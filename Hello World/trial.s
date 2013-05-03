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
	movl	%esi, -4(%rbp)
	movl	%edi, -8(%rbp)
	movl	%ecx, -12(%rbp)
	movl	%edx, -16(%rbp)
	addl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	-12(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	%edx, -24(%rbp)
	movl	-20(%rbp), %ecx
	movl	%edx, %eax
	movl	%ecx, %edx
	popq	%rbp
	ret
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp8:
	.cfi_def_cfa_offset 16
Ltmp9:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp10:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$40, %rsp
Ltmp11:
	.cfi_offset %rbx, -24
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
	movl	$100, -20(%rbp)
	movl	$100, -24(%rbp)
	movl	$200, -28(%rbp)
	movl	$200, -32(%rbp)
	movl	-28(%rbp), %ecx
	movl	-24(%rbp), %edi
	movl	-20(%rbp), %esi
	movl	$200, %edx
	callq	_add
	movl	%eax, %ebx
	leaq	L_.str_dup(%rip), %rdi
	movl	%edx, -36(%rbp)
	movl	%ebx, -40(%rbp)
	movl	-36(%rbp), %esi
	xorb	%al, %al
	callq	_printf
	leaq	L_.str(%rip), %rdi
	movl	%ebx, %esi
	xorb	%al, %al
	callq	_printf
	movl	-24(%rbp), %eax
	addl	-32(%rbp), %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str_dup:                             ## @.str_dup
	.asciz	 "%d\n"

L_.str:                                 ## @.str
	.asciz	 "%d\n"


.subsections_via_symbols
