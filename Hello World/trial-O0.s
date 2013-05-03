	.section	__TEXT,__text,regular,pure_instructions
	.globl	_add
	.align	4, 0x90
_add:                                   ## @add
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$32, %rsp
Ltmp6:
	.cfi_offset %rbx, -32
Ltmp7:
	.cfi_offset %r14, -24
	movl	%edx, %r14d
	movl	%esi, -20(%rbp)
	movl	%edi, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movl	%r14d, -32(%rbp)
	addl	-24(%rbp), %r14d
	movl	-20(%rbp), %ebx
	addl	-28(%rbp), %ebx
	cmpl	%ebx, %r14d
	je	LBB0_2
## BB#1:                                ## %entry_fall_back
	movl	$1, %edi
	callq	_exit
LBB0_2:                                 ## %entry_split
	movl	%ebx, -36(%rbp)
	movl	%r14d, -40(%rbp)
	movl	-36(%rbp), %edx
	movq	%rsp, %rax
	addq	$-16, %rax
	movq	%rax, %rsp
	movl	%r14d, %eax
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
	.cfi_endproc


.subsections_via_symbols
