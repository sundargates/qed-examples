LLVM_BASE=../../../build/Release+Asserts
QED_MODE=NONE

all: func.c
	$(LLVM_BASE)/bin/clang -emit-llvm -g -c -O0 -g func.c -o func.bc
ifneq ($(QED_MODE),NONE)
	$(LLVM_BASE)/bin/opt -load $(LLVM_BASE)/lib/LLVMHello.so -hello -QED-Mode=$(QED_MODE) < func.bc > func_opt.bc
else
	cp func.bc func_opt.bc
endif
	$(LLVM_BASE)/bin/llvm-dis func_opt.bc

clean:
	rm -fr *.bc *.ll
