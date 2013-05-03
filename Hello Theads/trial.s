	.section	__TEXT,__text,regular,pure_instructions
	.section	__TEXT,__StaticInit,regular,pure_instructions
	.align	4, 0x90
___cxx_global_var_init:                 ## @__cxx_global_var_init
	.cfi_startproc
## BB#0:                                ## %entry
	imull	$10, _datawidth(%rip), %eax
	imull	$10, _datawidth_dup(%rip), %ecx
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
	idivl	_datawidth_dup(%rip)
	movslq	%eax, %rax
	imulq	$1717986919, %rax, %rcx ## imm = 0x66666667
	movq	%rcx, %rax
	shrq	$63, %rax
	sarq	$34, %rcx
	addl	%eax, %ecx
	movl	$1000, %eax             ## imm = 0x3E8
	xorl	%edx, %edx
	idivl	_datawidth(%rip)
	movl	%ecx, _counters_dup(%rip)
	movslq	%eax, %rax
	imulq	$1717986919, %rax, %rax ## imm = 0x66666667
	movq	%rax, %rcx
	shrq	$63, %rcx
	sarq	$34, %rax
	addl	%ecx, %eax
	movl	%eax, _counters(%rip)
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
Ltmp27:
	.cfi_def_cfa_offset 16
Ltmp28:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp29:
	.cfi_def_cfa_register %rbp
	subq	$112, %rsp
	movl	%esi, -12(%rbp)
	movl	%edi, -16(%rbp)
	movl	_datawidth_dup(%rip), %eax
	imull	-12(%rbp), %eax
	movslq	%eax, %rcx
	leaq	_checksum_dup(%rip), %rax
	addq	%rcx, %rax
	imull	_datawidth(%rip), %edi
	leaq	_checksum(%rip), %rcx
	movq	%rax, -24(%rbp)
	movslq	%edi, %rax
	addq	%rcx, %rax
	movq	%rax, -32(%rbp)
	movl	_counters(%rip), %eax
	imull	_iters(%rip), %eax
	movl	_counters_dup(%rip), %ecx
	imull	_iters_dup(%rip), %ecx
	movslq	%ecx, %rcx
	movq	%rcx, -40(%rbp)
	movslq	%eax, %rdi
	movq	%rdi, -48(%rbp)
	movl	_datawidth(%rip), %r8d
	movl	_datawidth_dup(%rip), %r9d
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %rsi
	callq	__Z13CompareNBytesyPhi
	movl	%edx, -52(%rbp)
	movl	%eax, -56(%rbp)
	testl	%eax, %eax
	je	LBB7_3
## BB#1:                                ## %if.then
	leaq	L_.str_dup(%rip), %rdi
	xorb	%al, %al
	callq	_printf
	leaq	L_.str(%rip), %rdi
	xorb	%al, %al
	callq	_printf
	movl	_counters(%rip), %eax
	movl	_counters_dup(%rip), %ecx
	jmp	LBB7_2
LBB7_3:                                 ## %if.end
	movl	_datawidth_dup(%rip), %eax
	imull	-12(%rbp), %eax
	movslq	%eax, %rcx
	leaq	_buffer_dup(%rip), %rax
	addq	%rcx, %rax
	movl	_datawidth(%rip), %ecx
	imull	-16(%rbp), %ecx
	movq	%rax, -64(%rbp)
	movslq	%ecx, %rax
	leaq	_buffer(%rip), %rcx
	addq	%rax, %rcx
	movq	%rcx, -72(%rbp)
	movl	_iters_dup(%rip), %eax
	incl	%eax
	movslq	%eax, %rcx
	movl	_iters(%rip), %eax
	movq	%rcx, -80(%rbp)
	incl	%eax
	movslq	%eax, %rax
	movq	%rax, -88(%rbp)
	movl	$0, -92(%rbp)
	movl	$0, -96(%rbp)
	jmp	LBB7_4
	.align	4, 0x90
LBB7_7:                                 ## %if.end12
                                        ##   in Loop: Header=BB7_4 Depth=1
	movslq	_stride(%rip), %rax
	addq	-72(%rbp), %rax
	movslq	_stride_dup(%rip), %rcx
	addq	%rcx, -64(%rbp)
	movq	%rax, -72(%rbp)
	movl	-96(%rbp), %eax
	incl	-92(%rbp)
	incl	%eax
	movl	%eax, -96(%rbp)
LBB7_4:                                 ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	movl	-96(%rbp), %eax
	cmpl	_counters(%rip), %eax
	jae	LBB7_8
## BB#5:                                ## %for.body
                                        ##   in Loop: Header=BB7_4 Depth=1
	movl	_datawidth(%rip), %r8d
	movl	_datawidth_dup(%rip), %r9d
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-88(%rbp), %rdi
	movq	-80(%rbp), %rsi
	callq	__Z13CompareNBytesyPhi
	movl	%edx, -100(%rbp)
	movl	%eax, -104(%rbp)
	testl	%eax, %eax
	je	LBB7_7
## BB#6:                                ## %if.then10
	leaq	L_.str2_dup(%rip), %rdi
	xorb	%al, %al
	callq	_printf
	leaq	L_.str2(%rip), %rdi
	xorb	%al, %al
	callq	_printf
	movl	-96(%rbp), %eax
	movl	-92(%rbp), %ecx
LBB7_2:                                 ## %if.then
	movl	%ecx, -4(%rbp)
	movl	%eax, -8(%rbp)
	jmp	LBB7_9
LBB7_8:                                 ## %for.end
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
LBB7_9:                                 ## %return
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %edx
	movq	%rsp, %rcx
	addq	$-16, %rcx
	movq	%rcx, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
	.cfi_endproc

	.globl	__Z11entry_pointPv
	.align	4, 0x90
__Z11entry_pointPv:                     ## @_Z11entry_pointPv
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp32:
	.cfi_def_cfa_offset 16
Ltmp33:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp34:
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rdi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	%rdi, -48(%rbp)
	movl	(%rdi), %edi
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -52(%rbp)
	movl	%edi, -56(%rbp)
	movl	-52(%rbp), %esi
	callq	__Z4Testi
	movl	$4, %edi
	callq	_malloc
	movq	%rax, -64(%rbp)
	movq	%rax, -72(%rbp)
	movl	-56(%rbp), %edi
	movl	-52(%rbp), %esi
	callq	__Z5Checki
	movq	-72(%rbp), %rcx
	movq	-64(%rbp), %rsi
	movl	%edx, (%rsi)
	movl	%eax, (%rcx)
	movq	-72(%rbp), %rdi
	callq	_pthread_exit
	.cfi_endproc

	.globl	__Z10initializev
	.align	4, 0x90
__Z10initializev:                       ## @_Z10initializev
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp37:
	.cfi_def_cfa_offset 16
Ltmp38:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp39:
	.cfi_def_cfa_register %rbp
	leaq	_buffer(%rip), %rdi
	movl	$1000, %esi             ## imm = 0x3E8
	callq	___bzero
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, _checksum+16(%rip)
	vmovaps	%xmm0, _checksum(%rip)
	vmovaps	%xmm0, _checksum+32(%rip)
	vmovaps	%xmm0, _checksum+64(%rip)
	vmovaps	%xmm0, _checksum+48(%rip)
	popq	%rbp
	ret
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp43:
	.cfi_def_cfa_offset 16
Ltmp44:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp45:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$320, %rsp              ## imm = 0x140
Ltmp46:
	.cfi_offset %rbx, -32
Ltmp47:
	.cfi_offset %r14, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %r14
	movq	(%r14), %rax
	movq	%rax, -24(%rbp)
	movl	$0, -28(%rbp)
	movl	$0, -32(%rbp)
	callq	__Z10initializev
	movl	$0, -292(%rbp)
	movl	$0, -296(%rbp)
	movl	$4, %edi
	callq	_malloc
	movq	%rax, -304(%rbp)
	movq	%rax, -312(%rbp)
	movq	$0, (%rax)
	movl	$0, -316(%rbp)
	movl	$0, -320(%rbp)
	leaq	__Z11entry_pointPv(%rip), %rbx
	jmp	LBB10_1
	.align	4, 0x90
LBB10_4:                                ## %for.inc
                                        ##   in Loop: Header=BB10_1 Depth=1
	movl	-320(%rbp), %eax
	incl	-316(%rbp)
	incl	%eax
	movl	%eax, -320(%rbp)
LBB10_1:                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	cmpl	$9, -320(%rbp)
	jg	LBB10_5
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB10_1 Depth=1
	movslq	-316(%rbp), %rax
	movslq	-320(%rbp), %rcx
	movl	%eax, -240(%rbp,%rax,4)
	movl	%ecx, -288(%rbp,%rcx,4)
	movslq	-320(%rbp), %rax
	leaq	-192(%rbp,%rax,8), %rdi
	leaq	-288(%rbp,%rax,4), %rcx
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	_pthread_create
	testl	%eax, %eax
	je	LBB10_4
## BB#3:                                ## %if.then
	movl	-320(%rbp), %ebx
	movl	-316(%rbp), %esi
	leaq	L_.str3_dup(%rip), %rdi
	xorb	%al, %al
	callq	_printf
	leaq	L_.str3(%rip), %rdi
	movl	%ebx, %esi
	xorb	%al, %al
	callq	_printf
	jmp	LBB10_9
LBB10_5:                                ## %for.end
	movl	$0, -324(%rbp)
	movl	$0, -328(%rbp)
	leaq	-312(%rbp), %rbx
	jmp	LBB10_6
	.align	4, 0x90
LBB10_12:                               ## %for.inc28
                                        ##   in Loop: Header=BB10_6 Depth=1
	movl	-328(%rbp), %eax
	incl	-324(%rbp)
	incl	%eax
	movl	%eax, -328(%rbp)
LBB10_6:                                ## %for.cond8
                                        ## =>This Inner Loop Header: Depth=1
	cmpl	$9, -328(%rbp)
	jg	LBB10_13
## BB#7:                                ## %for.body10
                                        ##   in Loop: Header=BB10_6 Depth=1
	movslq	-328(%rbp), %rax
	movq	-192(%rbp,%rax,8), %rdi
	movq	%rbx, %rsi
	callq	_pthread_join
	testl	%eax, %eax
	jne	LBB10_8
## BB#10:                               ## %if.end17
                                        ##   in Loop: Header=BB10_6 Depth=1
	movq	-312(%rbp), %rax
	movl	(%rax), %eax
	movq	-304(%rbp), %rcx
	movl	(%rcx), %ecx
	movslq	-328(%rbp), %rdx
	movslq	-324(%rbp), %rsi
	movl	%ecx, -240(%rbp,%rsi,4)
	movl	%eax, -288(%rbp,%rdx,4)
	movslq	-328(%rbp), %rax
	cmpl	$0, -288(%rbp,%rax,4)
	je	LBB10_12
## BB#11:                               ## %if.then23
	movslq	-328(%rbp), %rax
	movl	-288(%rbp,%rax,4), %ebx
	movslq	-324(%rbp), %rax
	movl	-240(%rbp,%rax,4), %esi
	leaq	L_.str5_dup(%rip), %rdi
	xorb	%al, %al
	callq	_printf
	leaq	L_.str5(%rip), %rdi
	movl	%ebx, %esi
	xorb	%al, %al
	callq	_printf
	movl	-328(%rbp), %eax
	movl	-324(%rbp), %ecx
	movl	%ecx, -28(%rbp)
	movl	%eax, -32(%rbp)
	jmp	LBB10_14
LBB10_13:                               ## %for.end30
	movl	$0, -28(%rbp)
	movl	$0, -32(%rbp)
	jmp	LBB10_14
LBB10_8:                                ## %if.then15
	leaq	L_.str4_dup(%rip), %rdi
	xorb	%al, %al
	callq	_printf
	leaq	L_.str4(%rip), %rdi
	xorb	%al, %al
	callq	_printf
LBB10_9:                                ## %if.then15
	movl	$-1, -28(%rbp)
	movl	$-1, -32(%rbp)
LBB10_14:                               ## %return
	movq	(%r14), %rcx
	movl	-32(%rbp), %eax
	cmpq	-24(%rbp), %rcx
	jne	LBB10_16
## BB#15:                               ## %SP_return
	addq	$320, %rsp              ## imm = 0x140
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
LBB10_16:                               ## %CallStackCheckFailBlk
	callq	___stack_chk_fail
	.cfi_endproc

	.section	__TEXT,__StaticInit,regular,pure_instructions
	.align	4, 0x90
__GLOBAL__I_a:                          ## @_GLOBAL__I_a
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp50:
	.cfi_def_cfa_offset 16
Ltmp51:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp52:
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
.zerofill __DATA,__common,_checksum_dup,80,4
	.globl	_checksum               ## @checksum
.zerofill __DATA,__common,_checksum,80,4
	.section	__DATA,__data
	.globl	_datawidth_dup          ## @datawidth_dup
	.align	2
_datawidth_dup:
	.long	4                       ## 0x4

	.globl	_datawidth              ## @datawidth
	.align	2
_datawidth:
	.long	4                       ## 0x4

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
	.asciz	 "There is an error with respect to pchecksum bytes\n"

L_.str:                                 ## @.str
	.asciz	 "There is an error with respect to pchecksum bytes\n"

L_.str2_dup:                            ## @.str2_dup
	.asciz	 "There is an error with respect to pcounter bytes\n"

L_.str2:                                ## @.str2
	.asciz	 "There is an error with respect to pcounter bytes\n"

L_.str3_dup:                            ## @.str3_dup
	.asciz	 "Could not create thread %d\n"

L_.str3:                                ## @.str3
	.asciz	 "Could not create thread %d\n"

L_.str4_dup:                            ## @.str4_dup
	.asciz	 "Could not join thread"

L_.str4:                                ## @.str4
	.asciz	 "Could not join thread"

L_.str5_dup:                            ## @.str5_dup
	.asciz	 "Test failed Thread ID:%d\n"

L_.str5:                                ## @.str5
	.asciz	 "Test failed Thread ID:%d\n"

	.section	__DATA,__mod_init_func,mod_init_funcs
	.align	3
	.quad	__GLOBAL__I_a

.subsections_via_symbols
