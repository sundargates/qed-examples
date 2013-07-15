LLVM_BASE=../../../build/Release+Asserts
QED_MODE=NONE

all: basic.c
	$(LLVM_BASE)/bin/clang -emit-llvm -g -c -O0 -g basic.c -o basic.bc
ifneq ($(QED_MODE),NONE)
	$(LLVM_BASE)/bin/opt -load $(LLVM_BASE)/lib/LLVMHello.so -hello -QED-Mode=$(QED_MODE) < basic.bc > basic_opt.bc
else
	cp basic.bc basic_opt.bc
endif
	$(LLVM_BASE)/bin/llvm-dis basic_opt.bc
	$(LLVM_BASE)/bin/llc basic_opt.bc -o basic.s 
	gcc basic.s -lm -o basic.out

clean:
	rm -fr *.bc *.ll *.s *.out
