// #include "maestro.h"
// using namespace maestro;
typedef unsigned long uint64;
typedef char uint8;
#define noexcept 

/// Calculate buffer size as twice the last-level cache size
uint64 CalcBufferSize() noexcept
{
    ProcInfo p0(0); 		// 0 = APIC ID 0
    CacheGeom llc(p0, -1); 	// -1 = LLC, default type is UNIFIED
    return llc.Size() * 2;
}


/// Get the line size of the LLC
uint64 GetLineSize() noexcept
{
    ProcInfo p0(0); 		// 0 = APIC ID 0
    CacheGeom llc(p0, -1); 	// -1 = LLC, default type is UNIFIED
    return llc.LineSize();
}


/// Calculate the stride (distance between two counters of the same processor)
uint64 CalcStride(uint64 sizeCounter, uint64 sizeBuffer) noexcept
{
	// Parax does this in a strange way:
	// About 50% of the time, the stride is a random number between counter size and 1/2 the buffer size
	// About 50% of the time, the stride is a random number between counter size and twice the counter size
	uint64 stride = StaticRand::Range(sizeCounter, sizeBuffer);
	if (stride > (sizeBuffer / 2)) {
		stride = StaticRand::Range(sizeCounter, sizeCounter * 2);
	}
	return stride;
}


/// Calculate the number of counters
uint64 CalcNumCounters(uint64 sizeBuffer, uint64 stride, uint64 itersMin, uint64 opsMax) noexcept
{
	// The maximum number of counters must satisfy both the buffer size and the max-ops threshold
	uint64 countersMax = sizeBuffer / stride;
	if (countersMax * itersMin > opsMax) {
		countersMax = opsMax / itersMin;
	}
	return StaticRand::Range(1, countersMax);
}


/// Calculate the number of iterations (number of times the counter set is incremented)
uint64 CalcNumIters(uint64 counters, uint64 itersMin, uint64 itersMax, uint64 opsMax) noexcept
{
	// The iterations must satisfy both maximum iterations and maximum operations
	uint64 itersMaxAdjusted = min(itersMax, opsMax / counters);
	return StaticRand::Range(itersMin, itersMaxAdjusted);
}


static const DeclTestParam itersMin("itersMin", "Minimum number of iterations - arbitrary constant", 50);
static const DeclTestParam itersMax("itersMax", "Maximum number of iterations - arbitrary constant", 4000);
static const DeclTestParam opsMax("opsMax", "Maximum number of operations - arbitrary constant", 0x1000000);
static const DeclTestParam threads("threads", "Number of threads", NumThreads());
static const DeclTestParam datawidth("datawidth", "Size (in bytes) of word size", StaticRand::Bits(1|2|4, 1));
static const DeclTestParam sizeCounter("sizeCounter", "Size of one multiprocessor counter", datawidth * threads);
static const DeclTestParam sizeBuffer("sizeBuffer", "Size of the data buffer", CalcBufferSize());
static const DeclTestParam stride("stride", "Increment between two sequential counters on the same processor", CalcStride(sizeCounter, sizeBuffer));
static const DeclTestParam sizeCacheLine("sizeCacheLine", "Size of a cache line", GetLineSize());
static const DeclTestParam slackBuffer("slackBuffer", "Cache line mis-alignment of main buffer", StaticRand::Range(0, sizeCacheLine - 1));
static const DeclTestParam slackChecksum("slackChecksum", "Cache line mis-alignment of checksum", StaticRand::Range(0, sizeCacheLine - 1));
static const DeclTestParam counters("counters", "Number of counters", CalcNumCounters(sizeBuffer, stride, itersMin, opsMax));
static const DeclTestParam iters("iters", "Number of iterations", CalcNumIters(counters, itersMin, itersMax, opsMax));
static const DeclTestParam ops("ops", "Number of operations", counters * iters);

// The physical memory buffer
// TODO: Ultimately, we want to make a complex initializer with a repeated Zero/Undefined pattern
DeclPhysMem buffer(sizeBuffer, Mem::ZeroPattern(), PhysMemAttrib::Alignment(sizeCacheLine) | PhysMemAttrib::Offset(slackBuffer));

// The checksum is a single word initialized to zero
DeclPhysMem checksum(datawidth * threads, Mem::ZeroPattern(), PhysMemAttrib::Alignment(sizeCacheLine) | PhysMemAttrib::Offset(slackChecksum));

// A barrier
Barrier bar(threads);

extern "C" void Test(int id) noexcept;
extern "C" int Check(int id) noexcept;
extern "C" int CompareNBytes(uint64 a, uint8 *b, int n) noexcept;


int main(void)
{
	// Perform the test
	// Pass the thread ID to ensure Test() is identical on all processors
	int id = ThreadID();
	Test(id);
	
	// Wait for all tests to finish
	bar.Sync(); 

	// Return the result of the check
	return Check(id); 
}


/// Run the test algorithm
extern "C" void __attribute__((noinline)) Test(int id) noexcept
{
    uint8 *pbuffer = StaticXlateToVirt<uint8 *>(&buffer) + datawidth * id;
	uint8 *pchecksum = StaticXlateToVirt<uint8 *>(&checksum) + datawidth * id;

	for (unsigned i = 0; i < iters; i++) { // The outer loop
        uint8 *pcounter = pbuffer;
		for (unsigned j = 0; j < counters; j++) { // The inner loop
			switch (datawidth) {
				case 1: // Byte
					asm ("incb (%0)" : : "r"(pcounter) : );
					asm ("incb (%0)" : : "r"(pchecksum) : );
					break;

				case 2: // Word
					asm ("incw (%0)" : : "r"(pcounter) : );
					asm ("incw (%0)" : : "r"(pchecksum) : );
					break;

				case 4: // Dword
					asm ("incl (%0)" : : "r"(pcounter) : );
					asm ("incl (%0)" : : "r"(pchecksum) : );
					break;
			}
			pcounter += stride;
		}
	}
}


/// Check for errors
extern "C" int __attribute__((noinline)) Check(int id) noexcept
{
	// Compare checksum against expected value (counters * iters)
	// On error, return a number beyond the last counter index to ensure the error is disambiguated from
	// the counter check below.
	uint8 *pchecksum = StaticXlateToVirt<uint8 *>(&checksum) + datawidth * id;
	uint64 checksumExpected = counters * iters;
	int res = CompareNBytes(checksumExpected, pchecksum, static_cast<int>(datawidth));
	if (res) {
		return counters;
	}
	
	// Compare each counter against the expected value (iters)
	uint8 *pcounter = StaticXlateToVirt<uint8 *>(&buffer) + datawidth * id;
	uint64 counterExpected = iters;
	for (unsigned j = 0; j < counters; j++)	{
		// On error, return the first failing counter index immediately
		int res = CompareNBytes(counterExpected, pcounter, static_cast<int>(datawidth));
		if (res) {
			return j;
		}
		pcounter += stride;
	}
	
	return 0; // PASS
}


/// Compare two instances of a common numeric type
template <typename T> int Compare(T a, T b) { return b - a; }

/// Compare N bytes of an immediate operand and a memory operand
extern "C" int CompareNBytes(uint64 a, uint8 *b, int n) noexcept
{
	switch (n) {
		case 1: return Compare<uint8>(static_cast<uint8>(a), *reinterpret_cast<uint8 *>(b));
		case 2: return Compare<uint16>(static_cast<uint16>(a), *reinterpret_cast<uint16 *>(b));
		case 4: return Compare<uint32>(static_cast<uint32>(a), *reinterpret_cast<uint32 *>(b));
	}
	return 0;
}

