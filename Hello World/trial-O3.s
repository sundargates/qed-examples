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
Ltmp6:
	.cfi_offset %rbx, -32
Ltmp7:
	.cfi_offset %r14, -24
	movl	%esi, %r14d
	movl	%edi, %ebx
	addl	%edx, %ebx
	addl	%ecx, %r14d
	cmpl	%r14d, %ebx
	je	LBB0_2
## BB#1:                                ## %entry_fall_back
	movl	$1, %edi
	callq	_exit
LBB0_2:                                 ## %entry_split
	movq	%rsp, %rax
	addq	$-16, %rax
	movq	%rax, %rsp
	movl	%ebx, %eax
	movl	%r14d, %edx
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
	.cfi_endproc


.subsections_via_symbols
