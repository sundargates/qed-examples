#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <pthread.h>
#include <stdlib.h>
#define NUM_ELEMENTS	1000
#define NUM_THREADS		1
#define THREADS			NUM_THREADS
char buffer[NUM_ELEMENTS];
unsigned long long checksum[NUM_THREADS];
typedef u_int8_t uint8;
typedef u_int16_t uint16;
typedef u_int32_t uint32;
typedef u_int64_t uint64;

//can be 1 2 4
int datawidth = 1;
int stride = NUM_THREADS * datawidth;
int counters = (NUM_ELEMENTS / datawidth) / NUM_THREADS;
int iters = 10;                                                                                        


// pthread_barrier_t barr;

/// Run the test algorithm
void __attribute__((noinline)) Test(int id)
{
	uint8 *pbuffer = (uint8 *)(&buffer) + (datawidth*id);
	uint8 *pchecksum = (uint8 *)(&checksum) + (datawidth*id);

	for (unsigned i = 0; i < iters; i++) 
	{ 
		// The outer loop
		uint8 *pcounter = pbuffer;
		for (unsigned j = 0; j < counters; j++)
		{ 
			// The inner loop
			switch (datawidth)
			{
				case 1: 
					// Byte
					asm ("incb (%0)" : : "r"(pcounter) : );
					asm ("incb (%0)" : : "r"(pchecksum) : );
					break;

				case 2:
					// Word
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

/// Compare two instances of a common numeric type
template <typename T> int Compare(T a, T b) { return b - a; }

/// Compare N bytes of an immediate operand and a memory operand
int CompareNBytes(uint64 a, uint8 *b, int n)
{
	switch (n)
	{
		case 1: return Compare<uint8>(static_cast<uint8>(a), *reinterpret_cast<uint8 *>(b));
		case 2: return Compare<uint16>(static_cast<uint16>(a), *reinterpret_cast<uint16 *>(b));
		case 4: return Compare<uint32>(static_cast<uint32>(a), *reinterpret_cast<uint32 *>(b));
	}
	return 0;
}

/// Check for errors
int __attribute__((noinline)) Check(int id)
{
	// Compare checksum against expected value (counters * iters)
	// On error, return a number beyond the last counter index to ensure the error is disambiguated from
	// the counter check below.
	uint8 *pchecksum = (uint8 *)(&checksum) + (datawidth*id);
	uint64 checksumExpected = counters * iters;
	// printf("%d %lld\n", *(uint16 *)pchecksum, checksumExpected);
	int res = CompareNBytes(checksumExpected, pchecksum, static_cast<int>(datawidth));
	if (res)
	{
		printf("There is an error with respect to pchecksum bytes\n");
		return counters;
	}
	
	// Compare each counter against the expected value (iters)
	uint8 *pcounter = (uint8 *)(&buffer) + (datawidth*id);
	uint64 counterExpected = iters;
	// printf("%lld\n", counterExpected);
	for (unsigned j = 0; j < counters; j++)
	{
		// On error, return the first failing counter index immediately
		int res = CompareNBytes(counterExpected, pcounter, static_cast<int>(datawidth));
		if (res) 
		{
			printf("There is an error with respect to pcounter bytes expected\n");
			return j;
		}
		pcounter += stride;
	}
	
	return 0; // PASS
}
void * entry_point(void *arg)
{
	int *id = (int *)(arg);
	int t = *id;
	// printf("%d\n", t);
    Test(t);
    // Wait for all tests to finish
    // int rc = pthread_barrier_wait(&barr);
    // if(rc != 0 && rc != PTHREAD_BARRIER_SERIAL_THREAD)
    // {
    //     printf("Could not wait on barrier\n");
    //     exit(-1);
    // }
    // Return the result of the check
    int *temp = (int *)malloc(sizeof(int));
    *temp = Check(t);
	pthread_exit((void *)temp);
}
void initialize()
{
	memset(buffer, 0, sizeof buffer);
	memset(checksum, 0, sizeof checksum);
}
int main(void)
{
	initialize();
	pthread_t thr[THREADS];
	int data[THREADS];
	int id = 0;
	void *vptr = malloc(sizeof(int));
	memset(vptr, 0, sizeof vptr);

	// if(pthread_barrier_init(&barr, NULL, THREADS))
	// {
	// 	printf("Could not create a barrier\n");
	// 	return -1;
	// }
    for(int i = 0; i < THREADS; i++)
    {
    	data[i] = i;
		if(pthread_create(&thr[i], NULL, &entry_point, (void*) &data[i]))
		{
			printf("Could not create thread %d\n", i);
			return -1;
		}
    }
    for(int i = 0; i < THREADS; i++)
    {
        if(pthread_join(thr[i], &vptr))
        {
            printf("Could not join thread");
            return -1;
        }
        data[i] = *((int *)vptr);
        if(data[i])
        {
        	printf("Test failed Thread ID:%d\n", data[i]);
        	return i;
        }
    }
    return 0;
}



