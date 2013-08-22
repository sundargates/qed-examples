# Makefile for QED testing programs, specifically w.r.t. LLVM.

.SUFFIXES: .c .bc .s .native .qed .ll
.PHONY: clean
# Uncomment this line to preserve intermediate files
#.SECONDARY:

SHELL = bash

include ../Makefile.defaults

# These defaults can be changed on the command line as MODE=3 and such
MODE = 1
NUM_BLOCKS = 10 #the default

#also available for change: what other passes you run, and in what order
hello_pass = -hello -QED-Mode=$(MODE) -NUM-CFTSS-BB=$(NUM_BLOCKS)
#PRE_PASSES = -std-compile-opts -std-link-opts -reassociate -lcssa -loop-simplify -indvars -loop-reduce -loop-rotate -loop-unswitch -loop-deletion -loop-unroll -instcombine
#PRE_PASSES = -instcombine

# Required for inlining check functions; no other effects in this directory
POST_PASSES = -inline

#TODO you will want to change this to your library!
lib = ~/Downloads/llvm-3.3.src/Release+Asserts/lib/LLVMHello.dylib
opt_options = -load $(lib) $(hello_pass) -disable-verify

inputs = matmul.c
outputs = $(inputs:.c=.qed)
execs = $(inputs:.c=.native)

all: $(outputs) $(execs)

#Make executables
%.native : %.c
	@$(CC) $(CFLAGS) $< -o $@
	@echo -e "\033[32m$(CC)\033[0m $(CFLAGS) $< -o $@"

#Make human-readable assembly files
%.ll : %.bc
	llvm-dis $< -o $@

#Convert to assembly
%.s : %.bc
	@llc $(LLC_FLAGS) $< -o $@
	@echo -e "\033[31mllc\033[0m $(LLC_FLAGS) $< -o $<"

%.bc : %.c
	$(CC) $(CFLAGS) -S -emit-llvm $< -o $@

#Run through QED.
%.qed.bc : %.bc $(lib)
	@opt $(opt_options) -o tmp.qed.bc < $<
	@echo -e "\033[35mopt\033[0m $(opt_options) -o tmp.qed.bc < $<"
	opt $(POST_PASSES) -o $@ < tmp.qed.bc
	rm tmp.qed.bc

#Make the executables that have Quick Error Detection
%.qed : %.qed.s $(lib)
	@$(CC) $(CFLAGS) $< -o $@
	@echo -e "\033[32m$(CC)\033[0m $(CFLAGS) $< -o $@"
