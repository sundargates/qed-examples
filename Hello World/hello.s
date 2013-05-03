	.section	__TEXT,__text,regular,pure_instructions
	.globl	_add
	.align	4, 0x90
_add:                                   ## @add
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp2:
	.cfi_def_cfa_offset 16
Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp4:
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	addl	-4(%rbp), %esi
	movl	%esi, -12(%rbp)
	movl	%esi, %eax
	popq	%rbp
	ret
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp7:
	.cfi_def_cfa_offset 16
Ltmp8:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp9:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$100, -8(%rbp)
	movl	$200, -12(%rbp)
	movl	-8(%rbp), %edi
	movl	$200, %esi
	callq	_add
	movl	%eax, -16(%rbp)
	leaq	L_.str(%rip), %rdi
	movl	%eax, %esi
	xorb	%al, %al
	callq	_printf
	movl	-8(%rbp), %eax
	addl	-12(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	 "%d\n"


.subsections_via_symbols
