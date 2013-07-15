# Makefile for automatically generated tests.
# Since this directory is structured slightly differently, I had to structure its Makefile
# slightly differently. I've tried to retain as much of the old structure as possible.

# Things specific to this directory:
#	The goal of this directory is to store lots of automatically generated files for
#	large-scale testing. Thus, there are many targets and many sources, requiring a
#	slightly different Makefile setup. However, since each .c file in the directory
#	corresponds to a complete program, there's no need to involve the linker.
#	Additionally, because I had to structure the recipes to target individual files,
#	I found that filenames ending in -qed didn't work as well with make's syntax;
#	it seems to prefer suffixes. Thus, I used .qed instead of -qed (so foo.qed.bc
#	contains the IR of foo.c after it has been run through QED, and the corresponding
#	executable is foo.qed.native).
#	To test all files, type make tests.

LLVM_BASE=../../../llvm/build/Debug+Asserts

CFLAGS=$(OPTIMIZATION) -emit-llvm -c -w
ifeq ($(BENCHLANG),C)
    OBJECTS=$(SOURCES:.c=.o)
else
    OBJECTS=$(SOURCES:.cpp=.o)
endif

OPTFLAGS=-load

CC=clang
OPT=opt
LLC=llc
LLVM-DIS=llvm-dis

OPTFLAGS=-load
OPTLIB=LLVMHello.dylib

SOURCES      = $(wildcard *.c)
QED_MODE     = ALL
NUM_CFTSS_BB = 10
APPLICATION  = hello
OPTIMIZATION = 
BENCHLANG    = C

BYTECODE = $(SOURCES:.c=.bc)
QED_BYTECODE = $(SOURCES:.c=.qed.bc)
EXECUTABLES = $(SOURCES:.c=.native)
QED_EXECUTABLES = $(SOURCES:.c=.qed.native)

ASSEMBLY = $(SOURCES:.c=.s)
QED_ASSEMBLY = $(SOURCES:.c=.qed.s)

DIS = $(SOURCES:.c=.ll)
QED_DIS = $(SOURCES:.c=.qed.ll)

all: $(SOURCES) $(BYTECODE) $(QED_BYTECODE) $(ASSEMBLY) $(QED_ASSEMBLY) $(EXECUTABLES) $(QED_EXECUTABLES)

%.native: %.s
	$(CC) $< -o $@
	rm $<

%.qed.native: %.qed.s
	$(CC) $< -o $@
	rm $<

%.s: %.bc
	$(LLC) $< -o $@

%.qed.s: %.qed.bc
	$(LLC) $< -o $@

%.qed.bc: %.bc
	$(OPT) $(OPTFLAGS) $(OPTLIB) -hello -QED-Mode=$(QED_MODE) -NUM-CFTSS-BB=$(NUM_CFTSS_BB) $< -o $@

%.bc: %.c
	$(CC) $(CFLAGS) $< -S -o $@

clean:
	rm -fr *.bc *.ll *.s *.native

display: $(DIS) $(QED_DIS)

%.ll: %.bc
	$(LLVM-DIS) $< -o $@

%.qed.ll: %.bc
	$(LLVM-DIS) $< -o $@

#Runs all of the files and raises an error if QED fails for any of them.
tests: $(EXECUTABLES) $(QED_EXECUTABLES)
	./run_all -qeds > test_qeds
	grep -v ID test_qeds > /dev/null
	rm test_qeds
