	.section	__TEXT,__text,regular,pure_instructions
	.section	__TEXT,__StaticInit,regular,pure_instructions
	.align	4, 0x90
___cxx_global_var_init:                 ## @__cxx_global_var_init
	.cfi_startproc
## BB#0:                                ## %entry
	imull	$10, _datawidth(%rip), %eax
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
	movl	%edi, -4(%rbp)
	imull	_datawidth(%rip), %edi
	movslq	%edi, %rax
	leaq	_buffer(%rip), %rcx
	addq	%rax, %rcx
	movq	%rcx, -16(%rbp)
	leaq	_checksum(%rip), %rax
	movl	_datawidth(%rip), %ecx
	imull	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rax, %rcx
	movq	%rcx, -24(%rbp)
	movl	$0, -28(%rbp)
	jmp	LBB2_1
	.align	4, 0x90
LBB2_11:                                ## %for.inc11
                                        ##   in Loop: Header=BB2_1 Depth=1
	incl	-28(%rbp)
LBB2_1:                                 ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_3 Depth 2
	movl	-28(%rbp), %eax
	cmpl	_iters(%rip), %eax
	jae	LBB2_12
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB2_1 Depth=1
	movq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)
	movl	$0, -44(%rbp)
	jmp	LBB2_3
	.align	4, 0x90
LBB2_10:                                ## %for.inc
                                        ##   in Loop: Header=BB2_3 Depth=2
	movslq	_stride(%rip), %rax
	addq	%rax, -40(%rbp)
	incl	-44(%rbp)
LBB2_3:                                 ## %for.cond4
                                        ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-44(%rbp), %eax
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
	movq	-40(%rbp), %rax
	## InlineAsm Start
	incw (%rax)
	## InlineAsm End
	movq	-24(%rbp), %rax
	## InlineAsm Start
	incw (%rax)
	## InlineAsm End
	jmp	LBB2_10
	.align	4, 0x90
LBB2_9:                                 ## %sw.bb8
                                        ##   in Loop: Header=BB2_3 Depth=2
	movq	-40(%rbp), %rax
	## InlineAsm Start
	incl (%rax)
	## InlineAsm End
	movq	-24(%rbp), %rax
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
	movq	-40(%rbp), %rax
	## InlineAsm Start
	incb (%rax)
	## InlineAsm End
	movq	-24(%rbp), %rax
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
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movl	%edx, -28(%rbp)
	cmpl	$4, %edx
	je	LBB3_5
## BB#1:                                ## %entry
	cmpl	$2, %edx
	jne	LBB3_2
## BB#4:                                ## %sw.bb1
	movq	-24(%rbp), %rax
	movzwl	(%rax), %esi
	movzwl	-16(%rbp), %edi
	callq	__Z7CompareItEiT_S0_
	movl	%eax, -4(%rbp)
	jmp	LBB3_7
LBB3_5:                                 ## %sw.bb4
	movq	-24(%rbp), %rax
	movl	(%rax), %esi
	movl	-16(%rbp), %edi
	callq	__Z7CompareIjEiT_S0_
	movl	%eax, -4(%rbp)
	jmp	LBB3_7
LBB3_2:                                 ## %entry
	cmpl	$1, %edx
	jne	LBB3_6
## BB#3:                                ## %sw.bb
	movq	-24(%rbp), %rax
	movzbl	(%rax), %esi
	movzbl	-16(%rbp), %edi
	callq	__Z7CompareIhEiT_S0_
	movl	%eax, -4(%rbp)
	jmp	LBB3_7
LBB3_6:                                 ## %sw.epilog
	movl	$0, -4(%rbp)
LBB3_7:                                 ## %return
	movl	-4(%rbp), %eax
	addq	$32, %rsp
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
	movb	%dil, -1(%rbp)
	movb	%sil, -2(%rbp)
	movzbl	-1(%rbp), %ecx
	movzbl	-2(%rbp), %eax
	subl	%ecx, %eax
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
	movw	%di, -2(%rbp)
	movw	%si, -4(%rbp)
	movzwl	-2(%rbp), %ecx
	movzwl	-4(%rbp), %eax
	subl	%ecx, %eax
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
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	subl	-4(%rbp), %esi
	movl	%esi, %eax
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
	subq	$64, %rsp
	movl	%edi, -8(%rbp)
	imull	_datawidth(%rip), %edi
	movslq	%edi, %rax
	leaq	_checksum(%rip), %rcx
	addq	%rax, %rcx
	movq	%rcx, -16(%rbp)
	movl	_counters(%rip), %eax
	imull	_iters(%rip), %eax
	movslq	%eax, %rdi
	movq	%rdi, -24(%rbp)
	movl	_datawidth(%rip), %edx
	movq	-16(%rbp), %rsi
	callq	__Z13CompareNBytesyPhi
	movl	%eax, -28(%rbp)
	testl	%eax, %eax
	je	LBB7_2
## BB#1:                                ## %if.then
	leaq	L_.str(%rip), %rdi
	xorb	%al, %al
	callq	_printf
	movl	_counters(%rip), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB7_8
LBB7_2:                                 ## %if.end
	movl	_datawidth(%rip), %eax
	imull	-8(%rbp), %eax
	movslq	%eax, %rax
	leaq	_buffer(%rip), %rcx
	addq	%rax, %rcx
	movq	%rcx, -40(%rbp)
	movslq	_iters(%rip), %rax
	movq	%rax, -48(%rbp)
	movl	$0, -52(%rbp)
	jmp	LBB7_3
	.align	4, 0x90
LBB7_6:                                 ## %if.end12
                                        ##   in Loop: Header=BB7_3 Depth=1
	movslq	_stride(%rip), %rax
	addq	%rax, -40(%rbp)
	incl	-52(%rbp)
LBB7_3:                                 ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	movl	-52(%rbp), %eax
	cmpl	_counters(%rip), %eax
	jae	LBB7_7
## BB#4:                                ## %for.body
                                        ##   in Loop: Header=BB7_3 Depth=1
	movl	_datawidth(%rip), %edx
	movq	-40(%rbp), %rsi
	movq	-48(%rbp), %rdi
	callq	__Z13CompareNBytesyPhi
	movl	%eax, -56(%rbp)
	testl	%eax, %eax
	je	LBB7_6
## BB#5:                                ## %if.then10
	leaq	L_.str2(%rip), %rdi
	xorb	%al, %al
	callq	_printf
	movl	-52(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB7_8
LBB7_7:                                 ## %for.end
	movl	$0, -4(%rbp)
LBB7_8:                                 ## %return
	movl	-4(%rbp), %eax
	addq	$64, %rsp
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
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rdi, -24(%rbp)
	movl	(%rdi), %edi
	movl	%edi, -28(%rbp)
	callq	__Z4Testi
	movl	$4, %edi
	callq	_malloc
	movq	%rax, -40(%rbp)
	movl	-28(%rbp), %edi
	callq	__Z5Checki
	movq	-40(%rbp), %rcx
	movl	%eax, (%rcx)
	movq	-40(%rbp), %rdi
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
	subq	$176, %rsp
Ltmp46:
	.cfi_offset %rbx, -32
Ltmp47:
	.cfi_offset %r14, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %r14
	movq	(%r14), %rax
	movq	%rax, -24(%rbp)
	movl	$0, -28(%rbp)
	callq	__Z10initializev
	movl	$0, -164(%rbp)
	movl	$4, %edi
	callq	_malloc
	movq	%rax, -176(%rbp)
	movq	$0, (%rax)
	movl	$0, -180(%rbp)
	leaq	__Z11entry_pointPv(%rip), %rbx
	jmp	LBB10_1
	.align	4, 0x90
LBB10_4:                                ## %for.inc
                                        ##   in Loop: Header=BB10_1 Depth=1
	incl	-180(%rbp)
LBB10_1:                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	cmpl	$9, -180(%rbp)
	jg	LBB10_5
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB10_1 Depth=1
	movslq	-180(%rbp), %rax
	movl	%eax, -160(%rbp,%rax,4)
	movslq	-180(%rbp), %rax
	leaq	-112(%rbp,%rax,8), %rdi
	leaq	-160(%rbp,%rax,4), %rcx
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	_pthread_create
	testl	%eax, %eax
	je	LBB10_4
## BB#3:                                ## %if.then
	movl	-180(%rbp), %esi
	leaq	L_.str3(%rip), %rdi
	xorb	%al, %al
	callq	_printf
	movl	$-1, -28(%rbp)
	jmp	LBB10_13
LBB10_5:                                ## %for.end
	movl	$0, -184(%rbp)
	leaq	-176(%rbp), %rbx
	jmp	LBB10_6
	.align	4, 0x90
LBB10_11:                               ## %for.inc28
                                        ##   in Loop: Header=BB10_6 Depth=1
	incl	-184(%rbp)
LBB10_6:                                ## %for.cond8
                                        ## =>This Inner Loop Header: Depth=1
	cmpl	$9, -184(%rbp)
	jg	LBB10_12
## BB#7:                                ## %for.body10
                                        ##   in Loop: Header=BB10_6 Depth=1
	movslq	-184(%rbp), %rax
	movq	-112(%rbp,%rax,8), %rdi
	movq	%rbx, %rsi
	callq	_pthread_join
	testl	%eax, %eax
	jne	LBB10_8
## BB#9:                                ## %if.end17
                                        ##   in Loop: Header=BB10_6 Depth=1
	movq	-176(%rbp), %rax
	movl	(%rax), %eax
	movslq	-184(%rbp), %rcx
	movl	%eax, -160(%rbp,%rcx,4)
	movslq	-184(%rbp), %rax
	cmpl	$0, -160(%rbp,%rax,4)
	je	LBB10_11
## BB#10:                               ## %if.then23
	movslq	-184(%rbp), %rax
	movl	-160(%rbp,%rax,4), %esi
	leaq	L_.str5(%rip), %rdi
	xorb	%al, %al
	callq	_printf
	movl	-184(%rbp), %eax
	movl	%eax, -28(%rbp)
	jmp	LBB10_13
LBB10_12:                               ## %for.end30
	movl	$0, -28(%rbp)
	jmp	LBB10_13
LBB10_8:                                ## %if.then15
	leaq	L_.str4(%rip), %rdi
	xorb	%al, %al
	callq	_printf
	movl	$-1, -28(%rbp)
LBB10_13:                               ## %return
	movq	(%r14), %rcx
	movl	-28(%rbp), %eax
	cmpq	-24(%rbp), %rcx
	jne	LBB10_15
## BB#14:                               ## %SP_return
	addq	$176, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
LBB10_15:                               ## %CallStackCheckFailBlk
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

	.globl	_buffer                 ## @buffer
.zerofill __DATA,__common,_buffer,1000,4
	.globl	_checksum               ## @checksum
.zerofill __DATA,__common,_checksum,80,4
	.section	__DATA,__data
	.globl	_datawidth              ## @datawidth
	.align	2
_datawidth:
	.long	4                       ## 0x4

	.globl	_stride                 ## @stride
.zerofill __DATA,__common,_stride,4,2
	.globl	_counters               ## @counters
.zerofill __DATA,__common,_counters,4,2
	.globl	_iters                  ## @iters
	.align	2
_iters:
	.long	10                      ## 0xa

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	 "There is an error with respect to pchecksum bytes\n"

L_.str2:                                ## @.str2
	.asciz	 "There is an error with respect to pcounter bytes\n"

L_.str3:                                ## @.str3
	.asciz	 "Could not create thread %d\n"

L_.str4:                                ## @.str4
	.asciz	 "Could not join thread"

L_.str5:                                ## @.str5
	.asciz	 "Test failed Thread ID:%d\n"

	.section	__DATA,__mod_init_func,mod_init_funcs
	.align	3
	.quad	__GLOBAL__I_a

.subsections_via_symbols
