.SUFFIXES: .native .bc .ll

include ../Makefile.defaults

all: matmul.native matmul-via-llvm.native

# Straightforward compilation
matmul.native: matmul.c
	$(CC) $(CFLAGS) $< -o $@

# Also straightforward compilation, but by the LLVM route
matmul-via-llvm.native: matmul-via-llvm.s
	$(CC) $(CFLAGS) $< -o $@
matmul-via-llvm.s: matmul-via-llvm.bc
	$(LLC) $(LLC_FLAGS) $< -o $@
matmul-via-llvm.bc: matmul.c
	$(CC) $(CFLAGS) -S -emit-llvm $< -o $@
# Do I want to invoke opt here?
