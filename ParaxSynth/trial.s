	.section	__TEXT,__text,regular,pure_instructions
	.section	__TEXT,__StaticInit,regular,pure_instructions
	.align	4, 0x90
___cxx_global_var_init:                 ## @__cxx_global_var_init
	.cfi_startproc
## BB#0:                                ## %entry
	movl	_datawidth(%rip), %eax
	movl	_datawidth_dup(%rip), %ecx
	movl	%ecx, _stride_dup(%rip)
	movl	%eax, _stride(%rip)
	ret
	.cfi_endproc

	.align	4, 0x90
___cxx_global_var_init1:                ## @__cxx_global_var_init1
	.cfi_startproc
## BB#0:                                ## %entry
	movl	$1000, %eax             ## imm = 0x3E8
	xorl	%edx, %edx
	idivl	_datawidth(%rip)
	movl	%eax, %ecx
	movl	$1000, %eax             ## imm = 0x3E8
	xorl	%edx, %edx
	idivl	_datawidth_dup(%rip)
	movl	%eax, _counters_dup(%rip)
	movl	%ecx, _counters(%rip)
	ret
	.cfi_endproc

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z4Testi
	.align	4, 0x90
__Z4Testi:                              ## @_Z4Testi
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
	movl	_datawidth_dup(%rip), %eax
	imull	-4(%rbp), %eax
	imull	_datawidth(%rip), %edi
	movslq	%edi, %rdx
	leaq	_buffer(%rip), %rcx
	addq	%rdx, %rcx
	movslq	%eax, %rax
	leaq	_buffer_dup(%rip), %rsi
	addq	%rax, %rsi
	leaq	_checksum(%rip), %rax
	leaq	_checksum_dup(%rip), %rdx
	movq	%rsi, -16(%rbp)
	movq	%rcx, -24(%rbp)
	movl	_datawidth_dup(%rip), %ecx
	imull	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rdx, %rcx
	movl	_datawidth(%rip), %edx
	imull	-8(%rbp), %edx
	movq	%rcx, -32(%rbp)
	movslq	%edx, %rcx
	addq	%rax, %rcx
	movq	%rcx, -40(%rbp)
	movl	$0, -44(%rbp)
	movl	$0, -48(%rbp)
	jmp	LBB2_1
	.align	4, 0x90
LBB2_11:                                ## %for.inc11
                                        ##   in Loop: Header=BB2_1 Depth=1
	movl	-48(%rbp), %eax
	incl	-44(%rbp)
	incl	%eax
	movl	%eax, -48(%rbp)
LBB2_1:                                 ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_3 Depth 2
	movl	-48(%rbp), %eax
	cmpl	_iters(%rip), %eax
	jae	LBB2_12
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB2_1 Depth=1
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rcx, -56(%rbp)
	movq	%rax, -64(%rbp)
	movl	$0, -68(%rbp)
	movl	$0, -72(%rbp)
	jmp	LBB2_3
	.align	4, 0x90
LBB2_10:                                ## %for.inc
                                        ##   in Loop: Header=BB2_3 Depth=2
	movslq	_stride(%rip), %rax
	addq	-64(%rbp), %rax
	movslq	_stride_dup(%rip), %rcx
	addq	%rcx, -56(%rbp)
	movq	%rax, -64(%rbp)
	movl	-72(%rbp), %eax
	incl	-68(%rbp)
	incl	%eax
	movl	%eax, -72(%rbp)
LBB2_3:                                 ## %for.cond4
                                        ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-72(%rbp), %eax
	cmpl	_counters(%rip), %eax
	jae	LBB2_11
## BB#4:                                ## %for.body6
                                        ##   in Loop: Header=BB2_3 Depth=2
	movl	_datawidth(%rip), %eax
	cmpl	$4, %eax
	je	LBB2_9
## BB#5:                                ## %for.body6
                                        ##   in Loop: Header=BB2_3 Depth=2
	cmpl	$2, %eax
	jne	LBB2_6
## BB#8:                                ## %sw.bb7
                                        ##   in Loop: Header=BB2_3 Depth=2
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rcx
	## InlineAsm Start
	incw (%rcx)
	## InlineAsm End
	## InlineAsm Start
	incw (%rax)
	## InlineAsm End
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	## InlineAsm Start
	incw (%rcx)
	## InlineAsm End
	## InlineAsm Start
	incw (%rax)
	## InlineAsm End
	jmp	LBB2_10
	.align	4, 0x90
LBB2_9:                                 ## %sw.bb8
                                        ##   in Loop: Header=BB2_3 Depth=2
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rcx
	## InlineAsm Start
	incl (%rcx)
	## InlineAsm End
	## InlineAsm Start
	incl (%rax)
	## InlineAsm End
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	## InlineAsm Start
	incl (%rcx)
	## InlineAsm End
	## InlineAsm Start
	incl (%rax)
	## InlineAsm End
	jmp	LBB2_10
	.align	4, 0x90
LBB2_6:                                 ## %for.body6
                                        ##   in Loop: Header=BB2_3 Depth=2
	cmpl	$1, %eax
	jne	LBB2_10
## BB#7:                                ## %sw.bb
                                        ##   in Loop: Header=BB2_3 Depth=2
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rcx
	## InlineAsm Start
	incb (%rcx)
	## InlineAsm End
	## InlineAsm Start
	incb (%rax)
	## InlineAsm End
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	## InlineAsm Start
	incb (%rcx)
	## InlineAsm End
	## InlineAsm Start
	incb (%rax)
	## InlineAsm End
	jmp	LBB2_10
LBB2_12:                                ## %for.end13
	popq	%rbp
	ret
	.cfi_endproc

	.globl	__Z13CompareNBytesyPhi
	.align	4, 0x90
__Z13CompareNBytesyPhi:                 ## @_Z13CompareNBytesyPhi
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
	subq	$48, %rsp
	movq	%rsi, -16(%rbp)
	movq	%rdi, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	%r9d, -44(%rbp)
	movl	%r8d, -48(%rbp)
	cmpl	$4, %r8d
	je	LBB3_6
## BB#1:                                ## %entry
	cmpl	$2, %r8d
	jne	LBB3_2
## BB#5:                                ## %sw.bb1
	movq	-40(%rbp), %rax
	movzwl	(%rax), %edx
	movq	-32(%rbp), %rax
	movzwl	(%rax), %ecx
	movzwl	-24(%rbp), %edi
	movzwl	-16(%rbp), %esi
	callq	__Z7CompareItEiT_S0_
	jmp	LBB3_4
LBB3_6:                                 ## %sw.bb4
	movq	-40(%rbp), %rax
	movl	(%rax), %edx
	movq	-32(%rbp), %rax
	movl	(%rax), %ecx
	movl	-24(%rbp), %edi
	movl	-16(%rbp), %esi
	callq	__Z7CompareIjEiT_S0_
	jmp	LBB3_4
LBB3_2:                                 ## %entry
	cmpl	$1, %r8d
	jne	LBB3_7
## BB#3:                                ## %sw.bb
	movq	-40(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-32(%rbp), %rax
	movzbl	(%rax), %ecx
	movzbl	-24(%rbp), %edi
	movzbl	-16(%rbp), %esi
	callq	__Z7CompareIhEiT_S0_
LBB3_4:                                 ## %sw.bb
	movl	%edx, -4(%rbp)
	movl	%eax, -8(%rbp)
	jmp	LBB3_8
LBB3_7:                                 ## %sw.epilog
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
LBB3_8:                                 ## %return
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %edx
	movq	%rsp, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
	.cfi_endproc

	.section	__TEXT,__textcoal_nt,coalesced,pure_instructions
	.globl	__Z7CompareIhEiT_S0_
	.weak_definition	__Z7CompareIhEiT_S0_
	.align	4, 0x90
__Z7CompareIhEiT_S0_:                   ## @_Z7CompareIhEiT_S0_
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp12:
	.cfi_def_cfa_offset 16
Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp14:
	.cfi_def_cfa_register %rbp
	movb	%sil, -1(%rbp)
	movb	%dil, -2(%rbp)
	movb	%cl, -3(%rbp)
	movb	%dl, -4(%rbp)
	movzbl	-2(%rbp), %ecx
	movzbl	-4(%rbp), %eax
	subl	%ecx, %eax
	movzbl	-1(%rbp), %ecx
	movzbl	-3(%rbp), %edx
	subl	%ecx, %edx
	popq	%rbp
	ret
	.cfi_endproc

	.globl	__Z7CompareItEiT_S0_
	.weak_definition	__Z7CompareItEiT_S0_
	.align	4, 0x90
__Z7CompareItEiT_S0_:                   ## @_Z7CompareItEiT_S0_
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp17:
	.cfi_def_cfa_offset 16
Ltmp18:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp19:
	.cfi_def_cfa_register %rbp
	movw	%si, -2(%rbp)
	movw	%di, -4(%rbp)
	movw	%cx, -6(%rbp)
	movw	%dx, -8(%rbp)
	movzwl	-4(%rbp), %ecx
	movzwl	-8(%rbp), %eax
	subl	%ecx, %eax
	movzwl	-2(%rbp), %ecx
	movzwl	-6(%rbp), %edx
	subl	%ecx, %edx
	popq	%rbp
	ret
	.cfi_endproc

	.globl	__Z7CompareIjEiT_S0_
	.weak_definition	__Z7CompareIjEiT_S0_
	.align	4, 0x90
__Z7CompareIjEiT_S0_:                   ## @_Z7CompareIjEiT_S0_
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp22:
	.cfi_def_cfa_offset 16
Ltmp23:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp24:
	.cfi_def_cfa_register %rbp
	movl	%esi, -4(%rbp)
	movl	%edi, -8(%rbp)
	movl	%ecx, -12(%rbp)
	movl	%edx, -16(%rbp)
	subl	-8(%rbp), %edx
	movl	-12(%rbp), %ecx
	subl	-4(%rbp), %ecx
	movl	%edx, %eax
	movl	%ecx, %edx
	popq	%rbp
	ret
	.cfi_endproc

	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z5Checki
	.align	4, 0x90
__Z5Checki:                             ## @_Z5Checki
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp28:
	.cfi_def_cfa_offset 16
Ltmp29:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp30:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$112, %rsp
Ltmp31:
	.cfi_offset %rbx, -32
Ltmp32:
	.cfi_offset %r14, -24
	movl	%esi, -28(%rbp)
	movl	%edi, -32(%rbp)
	movl	_datawidth_dup(%rip), %ecx
	imull	-28(%rbp), %ecx
	imull	_datawidth(%rip), %edi
	movslq	%edi, %rdx
	leaq	_checksum(%rip), %rax
	addq	%rdx, %rax
	movslq	%ecx, %rdx
	leaq	_checksum_dup(%rip), %rcx
	addq	%rdx, %rcx
	leaq	L_.str_dup(%rip), %rdi
	movq	%rcx, -40(%rbp)
	movq	%rax, -48(%rbp)
	movl	_counters(%rip), %eax
	imull	_iters(%rip), %eax
	movl	_counters_dup(%rip), %ecx
	imull	_iters_dup(%rip), %ecx
	movslq	%ecx, %rcx
	movq	%rcx, -56(%rbp)
	movslq	%eax, %rbx
	movq	%rbx, -64(%rbp)
	movq	-48(%rbp), %rax
	movzwl	(%rax), %r14d
	movq	-40(%rbp), %rax
	movzwl	(%rax), %esi
	movq	-56(%rbp), %rdx
	xorb	%al, %al
	callq	_printf
	leaq	L_.str(%rip), %rdi
	movl	%r14d, %esi
	movq	%rbx, %rdx
	xorb	%al, %al
	callq	_printf
	movl	_datawidth(%rip), %r8d
	movl	_datawidth_dup(%rip), %r9d
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rcx
	movq	-64(%rbp), %rdi
	movq	-56(%rbp), %rsi
	callq	__Z13CompareNBytesyPhi
	movl	%edx, -68(%rbp)
	movl	%eax, -72(%rbp)
	testl	%eax, %eax
	je	LBB7_3
## BB#1:                                ## %if.then
	movl	_counters(%rip), %eax
	movl	_counters_dup(%rip), %ecx
	jmp	LBB7_2
LBB7_3:                                 ## %if.end
	movl	_datawidth_dup(%rip), %eax
	imull	-28(%rbp), %eax
	movslq	%eax, %rcx
	leaq	_buffer_dup(%rip), %rax
	addq	%rcx, %rax
	movl	_datawidth(%rip), %ecx
	imull	-32(%rbp), %ecx
	movq	%rax, -80(%rbp)
	movslq	%ecx, %rax
	leaq	_buffer(%rip), %rcx
	addq	%rax, %rcx
	movq	%rcx, -88(%rbp)
	movslq	_iters(%rip), %rax
	movslq	_iters_dup(%rip), %rcx
	movq	%rcx, -96(%rbp)
	movq	%rax, -104(%rbp)
	movl	$0, -108(%rbp)
	movl	$0, -112(%rbp)
	jmp	LBB7_4
	.align	4, 0x90
LBB7_7:                                 ## %if.end12
                                        ##   in Loop: Header=BB7_4 Depth=1
	movslq	_stride(%rip), %rax
	addq	-88(%rbp), %rax
	movslq	_stride_dup(%rip), %rcx
	addq	%rcx, -80(%rbp)
	movq	%rax, -88(%rbp)
	movl	-112(%rbp), %eax
	incl	-108(%rbp)
	incl	%eax
	movl	%eax, -112(%rbp)
LBB7_4:                                 ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	movl	-112(%rbp), %eax
	cmpl	_counters(%rip), %eax
	jae	LBB7_8
## BB#5:                                ## %for.body
                                        ##   in Loop: Header=BB7_4 Depth=1
	movl	_datawidth(%rip), %r8d
	movl	_datawidth_dup(%rip), %r9d
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rcx
	movq	-104(%rbp), %rdi
	movq	-96(%rbp), %rsi
	callq	__Z13CompareNBytesyPhi
	movl	%edx, -116(%rbp)
	movl	%eax, -120(%rbp)
	testl	%eax, %eax
	je	LBB7_7
## BB#6:                                ## %if.then11
	movl	-112(%rbp), %eax
	movl	-108(%rbp), %ecx
LBB7_2:                                 ## %if.then
	movl	%ecx, -20(%rbp)
	movl	%eax, -24(%rbp)
	jmp	LBB7_9
LBB7_8:                                 ## %for.end
	movl	$0, -20(%rbp)
	movl	$0, -24(%rbp)
LBB7_9:                                 ## %return
	movl	-24(%rbp), %eax
	movl	-20(%rbp), %edx
	movq	%rsp, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
	.cfi_endproc

	.globl	__Z10initializev
	.align	4, 0x90
__Z10initializev:                       ## @_Z10initializev
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp35:
	.cfi_def_cfa_offset 16
Ltmp36:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp37:
	.cfi_def_cfa_register %rbp
	leaq	_buffer_dup(%rip), %rdi
	movl	$1000, %esi             ## imm = 0x3E8
	callq	___bzero
	leaq	_buffer(%rip), %rdi
	movl	$1000, %esi             ## imm = 0x3E8
	callq	___bzero
	leaq	_checksum_dup(%rip), %rdi
	movl	$1000, %esi             ## imm = 0x3E8
	callq	___bzero
	leaq	_checksum(%rip), %rdi
	movl	$1000, %esi             ## imm = 0x3E8
	callq	___bzero
	popq	%rbp
	ret
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp40:
	.cfi_def_cfa_offset 16
Ltmp41:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp42:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
	movl	-12(%rbp), %esi
	xorl	%edi, %edi
	callq	__Z4Testi
	movl	-16(%rbp), %edi
	movl	-12(%rbp), %esi
	callq	__Z5Checki
	addq	$16, %rsp
	popq	%rbp
	ret
	.cfi_endproc

	.section	__TEXT,__StaticInit,regular,pure_instructions
	.align	4, 0x90
__GLOBAL__I_a:                          ## @_GLOBAL__I_a
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp45:
	.cfi_def_cfa_offset 16
Ltmp46:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp47:
	.cfi_def_cfa_register %rbp
	callq	___cxx_global_var_init
	callq	___cxx_global_var_init1
	popq	%rbp
	ret
	.cfi_endproc

	.globl	_buffer_dup             ## @buffer_dup
.zerofill __DATA,__common,_buffer_dup,1000,4
	.globl	_buffer                 ## @buffer
.zerofill __DATA,__common,_buffer,1000,4
	.globl	_checksum_dup           ## @checksum_dup
.zerofill __DATA,__common,_checksum_dup,8,3
	.globl	_checksum               ## @checksum
.zerofill __DATA,__common,_checksum,8,3
	.section	__DATA,__data
	.globl	_datawidth_dup          ## @datawidth_dup
	.align	2
_datawidth_dup:
	.long	2                       ## 0x2

	.globl	_datawidth              ## @datawidth
	.align	2
_datawidth:
	.long	2                       ## 0x2

	.globl	_stride_dup             ## @stride_dup
.zerofill __DATA,__common,_stride_dup,4,2
	.globl	_stride                 ## @stride
.zerofill __DATA,__common,_stride,4,2
	.globl	_counters_dup           ## @counters_dup
.zerofill __DATA,__common,_counters_dup,4,2
	.globl	_counters               ## @counters
.zerofill __DATA,__common,_counters,4,2
	.globl	_iters_dup              ## @iters_dup
	.align	2
_iters_dup:
	.long	10                      ## 0xa

	.globl	_iters                  ## @iters
	.align	2
_iters:
	.long	10                      ## 0xa

	.section	__TEXT,__cstring,cstring_literals
L_.str_dup:                             ## @.str_dup
	.asciz	 "%d %lld\n"

L_.str:                                 ## @.str
	.asciz	 "%d %lld\n"

	.section	__DATA,__mod_init_func,mod_init_funcs
	.align	3
	.quad	__GLOBAL__I_a

.subsections_via_symbols
