LLVM_BASE=../../../build/Release+Asserts
QED_MODE=ALL

all: lexer.c
	$(LLVM_BASE)/bin/clang -emit-llvm -c -O0 -g lexer.c -o lexer.bc
ifneq ($(QED_MODE),NONE)
	$(LLVM_BASE)/bin/opt -load $(LLVM_BASE)/lib/LLVMHello.so -hello -QED-Mode=$(QED_MODE) < lexer.bc > lexer_opt.bc
else
	cp lexer.bc lexer_opt.bc
endif
	$(LLVM_BASE)/bin/llvm-dis lexer_opt.bc
	$(LLVM_BASE)/bin/llc lexer_opt.bc -o lexer.s 
	gcc lexer.s -lfl -o lexer.out

clean:
	rm -fr *.bc *.ll *.s *.out
