	.file	"parax.bc"
	.text
	.align	16, 0x90
	.type	__MCP__Test__MCP__main,@function
__MCP__Test__MCP__main:                 # @__MCP__Test__MCP__main
# BB#0:                                 # %entry
	pushl	%edi
	pushl	%esi
	subl	$12, %esp
	#APP
	.intel_syntax;
	mov	ax,	cs;

	#NO_APP
                                        # kill: AX<def> AX<kill> EAX<def>
	shll	$16, %eax
	xorl	%ecx, %ecx
	movl	$_Z24_DefaultInterruptHandlerv, %edx
	movl	$-256, %esi
	.align	16, 0x90
.LBB0_1:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	movl	%edx, %edi
	andl	$65520, %edi            # imm = 0xFFF0
	orl	%eax, %edi
	movl	%edi, IDTBuffer+2048(,%esi,8)
	movl	%edx, %edi
	andl	$-65536, %edi           # imm = 0xFFFFFFFFFFFF0000
	orl	%ecx, %edi
	orl	$36352, %edi            # imm = 0x8E00
	movl	%edi, IDTBuffer+2052(,%esi,8)
	addl	$16, %edx
	incl	%esi
	jne	.LBB0_1
# BB#2:                                 # %_Z23_InstallDefaultHandlersb182.exit
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	movw	$0, 8(%esp)
	movb	$-1, (%esp)
	movb	$7, 1(%esp)
	movl	$IDTBuffer, 2(%esp)
	leal	(%esp), %eax
	#APP
	lidt	(%eax)
	#NO_APP
	calll	.L__ExecuteGlobalCtorChain0
	calll	.L__WaitForGlobalCtorChain0
	calll	__MCP__Test__MCP__Test
	cmpl	$2, __MCP__Test__MCP__bar+8
	jb	.LBB0_7
# BB#3:                                 # %if.then.i
	movl	__MCP__Test__MCP__bar+4, %eax
	movl	$1, %ecx
	lock
	xaddl	%ecx, __MCP__Test__MCP__bar
	incl	%ecx
	cmpl	__MCP__Test__MCP__bar+8, %ecx
	jne	.LBB0_6
# BB#4:                                 # %if.then4.i
	movl	$0, __MCP__Test__MCP__bar
	lock
	incl	__MCP__Test__MCP__bar+4
	jmp	.LBB0_7
	.align	16, 0x90
.LBB0_5:                                # %while.body.i
                                        #   in Loop: Header=BB0_6 Depth=1
	#APP
	pause
	#NO_APP
.LBB0_6:                                # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	movl	__MCP__Test__MCP__bar+4, %ecx
	cmpl	%eax, %ecx
	je	.LBB0_5
.LBB0_7:                                # %_ZN7maestro7Barrier4SyncEv.exit
	calll	__MCP__Test__MCP__Check
	addl	$12, %esp
	popl	%esi
	popl	%edi
	ret
.Ltmp0:
	.size	__MCP__Test__MCP__main, .Ltmp0-__MCP__Test__MCP__main

	.align	16, 0x90
	.type	__MCP__Test__MCP__Test,@function
__MCP__Test__MCP__Test:                 # @__MCP__Test__MCP__Test
# BB#0:                                 # %entry
	movl	$3026, %eax             # imm = 0xBD2
	movl	$__MCP__Test__MCP__buffer_maestro_init_2, %ecx
	movl	$__MCP__Test__MCP__checksum_maestro_init_1, %edx
	.align	16, 0x90
.LBB1_1:                                # %sw.bb20
                                        # =>This Inner Loop Header: Depth=1
	#APP
	incl (%ecx)
	#NO_APP
	#APP
	incl (%edx)
	#NO_APP
	decl	%eax
	jne	.LBB1_1
# BB#2:                                 # %for.end26
	ret
.Ltmp1:
	.size	__MCP__Test__MCP__Test, .Ltmp1-__MCP__Test__MCP__Test

	.align	16, 0x90
	.type	__MCP__Test__MCP__Check,@function
__MCP__Test__MCP__Check:                # @__MCP__Test__MCP__Check
# BB#0:                                 # %entry
	cmpl	$3026, __MCP__Test__MCP__checksum_maestro_init_1 # imm = 0xBD2
	setne	%al
	movzbl	%al, %eax
	ret
.Ltmp2:
	.size	__MCP__Test__MCP__Check, .Ltmp2-__MCP__Test__MCP__Check

	.section	.text.startup,"ax",@progbits
	.align	16, 0x90
	.type	__MCP__Test__MCP___GLOBAL__I_a,@function
__MCP__Test__MCP___GLOBAL__I_a:         # @__MCP__Test__MCP___GLOBAL__I_a
# BB#0:                                 # %entry
	movl	$0, __MCP__Test__MCP__bar
	movl	$0, __MCP__Test__MCP__bar+4
	movl	$1, __MCP__Test__MCP__bar+8
	ret
.Ltmp3:
	.size	__MCP__Test__MCP___GLOBAL__I_a, .Ltmp3-__MCP__Test__MCP___GLOBAL__I_a

	.text
	.align	16, 0x90
	.type	_Z24_DefaultInterruptHandlerv,@function
_Z24_DefaultInterruptHandlerv:          # @_Z24_DefaultInterruptHandlerv
# BB#0:                                 # %entry
	#APP
	.intel_syntax;
ivl0:;
	push	0;
	push	0;
	jmp	Istmake;
.align	16, 0xf4;
ivl1:;
	push	0;
	push	1;
	jmp	Istmake;
.align	16, 0xf4;
ivl2:;
	push	0;
	push	2;
	jmp	Istmake;
.align	16, 0xf4;
ivl3:;
	push	0;
	push	3;
	jmp	Istmake;
.align	16, 0xf4;
ivl4:;
	push	0;
	push	4;
	jmp	Istmake;
.align	16, 0xf4;
ivl5:;
	push	0;
	push	5;
	jmp	Istmake;
.align	16, 0xf4;
ivl6:;
	push	0;
	push	6;
	jmp	Istmake;
.align	16, 0xf4;
ivl7:;
	push	0;
	push	7;
	jmp	Istmake;
.align	16, 0xf4;
ivl8:;
	push	8;
	jmp	Istmake;
.align	16, 0xf4;
ivl9:;
	push	0;
	push	9;
	jmp	Istmake;
.align	16, 0xf4;
ivl10:;
	push	10;
	jmp	Istmake;
.align	16, 0xf4;
ivl11:;
	push	11;
	jmp	Istmake;
.align	16, 0xf4;
ivl12:;
	push	12;
	jmp	Istmake;
.align	16, 0xf4;
ivl13:;
	push	13;
	jmp	Istmake;
.align	16, 0xf4;
ivl14:;
	push	14;
	jmp	Istmake;
.align	16, 0xf4;
ivl15:;
	push	0;
	push	15;
	jmp	Istmake;
.align	16, 0xf4;
ivl16:;
	push	0;
	push	16;
	jmp	Istmake;
.align	16, 0xf4;
ivl17:;
	push	17;
	jmp	Istmake;
.align	16, 0xf4;
ivl18:;
	push	0;
	push	18;
	jmp	Istmake;
.align	16, 0xf4;
ivl19:;
	push	0;
	push	19;
	jmp	Istmake;
.align	16, 0xf4;
ivl20:;
	push	0;
	push	20;
	jmp	Istmake;
.align	16, 0xf4;
ivl21:;
	push	0;
	push	21;
	jmp	Istmake;
.align	16, 0xf4;
ivl22:;
	push	0;
	push	22;
	jmp	Istmake;
.align	16, 0xf4;
ivl23:;
	push	0;
	push	23;
	jmp	Istmake;
.align	16, 0xf4;
ivl24:;
	push	0;
	push	24;
	jmp	Istmake;
.align	16, 0xf4;
ivl25:;
	push	0;
	push	25;
	jmp	Istmake;
.align	16, 0xf4;
ivl26:;
	push	0;
	push	26;
	jmp	Istmake;
.align	16, 0xf4;
ivl27:;
	push	0;
	push	27;
	jmp	Istmake;
.align	16, 0xf4;
ivl28:;
	push	0;
	push	28;
	jmp	Istmake;
.align	16, 0xf4;
ivl29:;
	push	0;
	push	29;
	jmp	Istmake;
.align	16, 0xf4;
ivl30:;
	push	0;
	push	30;
	jmp	Istmake;
.align	16, 0xf4;
ivl31:;
	push	0;
	push	31;
	jmp	Istmake;
.align	16, 0xf4;
ivl32:;
	push	0;
	push	32;
	jmp	Istmake;
.align	16, 0xf4;
ivl33:;
	push	0;
	push	33;
	jmp	Istmake;
.align	16, 0xf4;
ivl34:;
	push	0;
	push	34;
	jmp	Istmake;
.align	16, 0xf4;
ivl35:;
	push	0;
	push	35;
	jmp	Istmake;
.align	16, 0xf4;
ivl36:;
	push	0;
	push	36;
	jmp	Istmake;
.align	16, 0xf4;
ivl37:;
	push	0;
	push	37;
	jmp	Istmake;
.align	16, 0xf4;
ivl38:;
	push	0;
	push	38;
	jmp	Istmake;
.align	16, 0xf4;
ivl39:;
	push	0;
	push	39;
	jmp	Istmake;
.align	16, 0xf4;
ivl40:;
	push	0;
	push	40;
	jmp	Istmake;
.align	16, 0xf4;
ivl41:;
	push	0;
	push	41;
	jmp	Istmake;
.align	16, 0xf4;
ivl42:;
	push	0;
	push	42;
	jmp	Istmake;
.align	16, 0xf4;
ivl43:;
	push	0;
	push	43;
	jmp	Istmake;
.align	16, 0xf4;
ivl44:;
	push	0;
	push	44;
	jmp	Istmake;
.align	16, 0xf4;
ivl45:;
	push	0;
	push	45;
	jmp	Istmake;
.align	16, 0xf4;
ivl46:;
	push	0;
	push	46;
	jmp	Istmake;
.align	16, 0xf4;
ivl47:;
	push	0;
	push	47;
	jmp	Istmake;
.align	16, 0xf4;
ivl48:;
	push	0;
	push	48;
	jmp	Istmake;
.align	16, 0xf4;
ivl49:;
	push	0;
	push	49;
	jmp	Istmake;
.align	16, 0xf4;
ivl50:;
	push	0;
	push	50;
	jmp	Istmake;
.align	16, 0xf4;
ivl51:;
	push	0;
	push	51;
	jmp	Istmake;
.align	16, 0xf4;
ivl52:;
	push	0;
	push	52;
	jmp	Istmake;
.align	16, 0xf4;
ivl53:;
	push	0;
	push	53;
	jmp	Istmake;
.align	16, 0xf4;
ivl54:;
	push	0;
	push	54;
	jmp	Istmake;
.align	16, 0xf4;
ivl55:;
	push	0;
	push	55;
	jmp	Istmake;
.align	16, 0xf4;
ivl56:;
	push	0;
	push	56;
	jmp	Istmake;
.align	16, 0xf4;
ivl57:;
	push	0;
	push	57;
	jmp	Istmake;
.align	16, 0xf4;
ivl58:;
	push	0;
	push	58;
	jmp	Istmake;
.align	16, 0xf4;
ivl59:;
	push	0;
	push	59;
	jmp	Istmake;
.align	16, 0xf4;
ivl60:;
	push	0;
	push	60;
	jmp	Istmake;
.align	16, 0xf4;
ivl61:;
	push	0;
	push	61;
	jmp	Istmake;
.align	16, 0xf4;
ivl62:;
	push	0;
	push	62;
	jmp	Istmake;
.align	16, 0xf4;
ivl63:;
	push	0;
	push	63;
	jmp	Istmake;
.align	16, 0xf4;
ivl64:;
	push	0;
	push	64;
	jmp	Istmake;
.align	16, 0xf4;
ivl65:;
	push	0;
	push	65;
	jmp	Istmake;
.align	16, 0xf4;
ivl66:;
	push	0;
	push	66;
	jmp	Istmake;
.align	16, 0xf4;
ivl67:;
	push	0;
	push	67;
	jmp	Istmake;
.align	16, 0xf4;
ivl68:;
	push	0;
	push	68;
	jmp	Istmake;
.align	16, 0xf4;
ivl69:;
	push	0;
	push	69;
	jmp	Istmake;
.align	16, 0xf4;
ivl70:;
	push	0;
	push	70;
	jmp	Istmake;
.align	16, 0xf4;
ivl71:;
	push	0;
	push	71;
	jmp	Istmake;
.align	16, 0xf4;
ivl72:;
	push	0;
	push	72;
	jmp	Istmake;
.align	16, 0xf4;
ivl73:;
	push	0;
	push	73;
	jmp	Istmake;
.align	16, 0xf4;
ivl74:;
	push	0;
	push	74;
	jmp	Istmake;
.align	16, 0xf4;
ivl75:;
	push	0;
	push	75;
	jmp	Istmake;
.align	16, 0xf4;
ivl76:;
	push	0;
	push	76;
	jmp	Istmake;
.align	16, 0xf4;
ivl77:;
	push	0;
	push	77;
	jmp	Istmake;
.align	16, 0xf4;
ivl78:;
	push	0;
	push	78;
	jmp	Istmake;
.align	16, 0xf4;
ivl79:;
	push	0;
	push	79;
	jmp	Istmake;
.align	16, 0xf4;
ivl80:;
	push	0;
	push	80;
	jmp	Istmake;
.align	16, 0xf4;
ivl81:;
	push	0;
	push	81;
	jmp	Istmake;
.align	16, 0xf4;
ivl82:;
	push	0;
	push	82;
	jmp	Istmake;
.align	16, 0xf4;
ivl83:;
	push	0;
	push	83;
	jmp	Istmake;
.align	16, 0xf4;
ivl84:;
	push	0;
	push	84;
	jmp	Istmake;
.align	16, 0xf4;
ivl85:;
	push	0;
	push	85;
	jmp	Istmake;
.align	16, 0xf4;
ivl86:;
	push	0;
	push	86;
	jmp	Istmake;
.align	16, 0xf4;
ivl87:;
	push	0;
	push	87;
	jmp	Istmake;
.align	16, 0xf4;
ivl88:;
	push	0;
	push	88;
	jmp	Istmake;
.align	16, 0xf4;
ivl89:;
	push	0;
	push	89;
	jmp	Istmake;
.align	16, 0xf4;
ivl90:;
	push	0;
	push	90;
	jmp	Istmake;
.align	16, 0xf4;
ivl91:;
	push	0;
	push	91;
	jmp	Istmake;
.align	16, 0xf4;
ivl92:;
	push	0;
	push	92;
	jmp	Istmake;
.align	16, 0xf4;
ivl93:;
	push	0;
	push	93;
	jmp	Istmake;
.align	16, 0xf4;
ivl94:;
	push	0;
	push	94;
	jmp	Istmake;
.align	16, 0xf4;
ivl95:;
	push	0;
	push	95;
	jmp	Istmake;
.align	16, 0xf4;
ivl96:;
	push	0;
	push	96;
	jmp	Istmake;
.align	16, 0xf4;
ivl97:;
	push	0;
	push	97;
	jmp	Istmake;
.align	16, 0xf4;
ivl98:;
	push	0;
	push	98;
	jmp	Istmake;
.align	16, 0xf4;
ivl99:;
	push	0;
	push	99;
	jmp	Istmake;
.align	16, 0xf4;
ivl100:;
	push	0;
	push	100;
	jmp	Istmake;
.align	16, 0xf4;
ivl101:;
	push	0;
	push	101;
	jmp	Istmake;
.align	16, 0xf4;
ivl102:;
	push	0;
	push	102;
	jmp	Istmake;
.align	16, 0xf4;
ivl103:;
	push	0;
	push	103;
	jmp	Istmake;
.align	16, 0xf4;
ivl104:;
	push	0;
	push	104;
	jmp	Istmake;
.align	16, 0xf4;
ivl105:;
	push	0;
	push	105;
	jmp	Istmake;
.align	16, 0xf4;
ivl106:;
	push	0;
	push	106;
	jmp	Istmake;
.align	16, 0xf4;
ivl107:;
	push	0;
	push	107;
	jmp	Istmake;
.align	16, 0xf4;
ivl108:;
	push	0;
	push	108;
	jmp	Istmake;
.align	16, 0xf4;
ivl109:;
	push	0;
	push	109;
	jmp	Istmake;
.align	16, 0xf4;
ivl110:;
	push	0;
	push	110;
	jmp	Istmake;
.align	16, 0xf4;
ivl111:;
	push	0;
	push	111;
	jmp	Istmake;
.align	16, 0xf4;
ivl112:;
	push	0;
	push	112;
	jmp	Istmake;
.align	16, 0xf4;
ivl113:;
	push	0;
	push	113;
	jmp	Istmake;
.align	16, 0xf4;
ivl114:;
	push	0;
	push	114;
	jmp	Istmake;
.align	16, 0xf4;
ivl115:;
	push	0;
	push	115;
	jmp	Istmake;
.align	16, 0xf4;
ivl116:;
	push	0;
	push	116;
	jmp	Istmake;
.align	16, 0xf4;
ivl117:;
	push	0;
	push	117;
	jmp	Istmake;
.align	16, 0xf4;
ivl118:;
	push	0;
	push	118;
	jmp	Istmake;
.align	16, 0xf4;
ivl119:;
	push	0;
	push	119;
	jmp	Istmake;
.align	16, 0xf4;
ivl120:;
	push	0;
	push	120;
	jmp	Istmake;
.align	16, 0xf4;
ivl121:;
	push	0;
	push	121;
	jmp	Istmake;
.align	16, 0xf4;
ivl122:;
	push	0;
	push	122;
	jmp	Istmake;
.align	16, 0xf4;
ivl123:;
	push	0;
	push	123;
	jmp	Istmake;
.align	16, 0xf4;
ivl124:;
	push	0;
	push	124;
	jmp	Istmake;
.align	16, 0xf4;
ivl125:;
	push	0;
	push	125;
	jmp	Istmake;
.align	16, 0xf4;
ivl126:;
	push	0;
	push	126;
	jmp	Istmake;
.align	16, 0xf4;
ivl127:;
	push	0;
	push	127;
	jmp	Istmake;
.align	16, 0xf4;
ivl128:;
	push	0;
	push	128;
	jmp	Istmake;
.align	16, 0xf4;
ivl129:;
	push	0;
	push	129;
	jmp	Istmake;
.align	16, 0xf4;
ivl130:;
	push	0;
	push	130;
	jmp	Istmake;
.align	16, 0xf4;
ivl131:;
	push	0;
	push	131;
	jmp	Istmake;
.align	16, 0xf4;
ivl132:;
	push	0;
	push	132;
	jmp	Istmake;
.align	16, 0xf4;
ivl133:;
	push	0;
	push	133;
	jmp	Istmake;
.align	16, 0xf4;
ivl134:;
	push	0;
	push	134;
	jmp	Istmake;
.align	16, 0xf4;
ivl135:;
	push	0;
	push	135;
	jmp	Istmake;
.align	16, 0xf4;
ivl136:;
	push	0;
	push	136;
	jmp	Istmake;
.align	16, 0xf4;
ivl137:;
	push	0;
	push	137;
	jmp	Istmake;
.align	16, 0xf4;
ivl138:;
	push	0;
	push	138;
	jmp	Istmake;
.align	16, 0xf4;
ivl139:;
	push	0;
	push	139;
	jmp	Istmake;
.align	16, 0xf4;
ivl140:;
	push	0;
	push	140;
	jmp	Istmake;
.align	16, 0xf4;
ivl141:;
	push	0;
	push	141;
	jmp	Istmake;
.align	16, 0xf4;
ivl142:;
	push	0;
	push	142;
	jmp	Istmake;
.align	16, 0xf4;
ivl143:;
	push	0;
	push	143;
	jmp	Istmake;
.align	16, 0xf4;
ivl144:;
	push	0;
	push	144;
	jmp	Istmake;
.align	16, 0xf4;
ivl145:;
	push	0;
	push	145;
	jmp	Istmake;
.align	16, 0xf4;
ivl146:;
	push	0;
	push	146;
	jmp	Istmake;
.align	16, 0xf4;
ivl147:;
	push	0;
	push	147;
	jmp	Istmake;
.align	16, 0xf4;
ivl148:;
	push	0;
	push	148;
	jmp	Istmake;
.align	16, 0xf4;
ivl149:;
	push	0;
	push	149;
	jmp	Istmake;
.align	16, 0xf4;
ivl150:;
	push	0;
	push	150;
	jmp	Istmake;
.align	16, 0xf4;
ivl151:;
	push	0;
	push	151;
	jmp	Istmake;
.align	16, 0xf4;
ivl152:;
	push	0;
	push	152;
	jmp	Istmake;
.align	16, 0xf4;
ivl153:;
	push	0;
	push	153;
	jmp	Istmake;
.align	16, 0xf4;
ivl154:;
	push	0;
	push	154;
	jmp	Istmake;
.align	16, 0xf4;
ivl155:;
	push	0;
	push	155;
	jmp	Istmake;
.align	16, 0xf4;
ivl156:;
	push	0;
	push	156;
	jmp	Istmake;
.align	16, 0xf4;
ivl157:;
	push	0;
	push	157;
	jmp	Istmake;
.align	16, 0xf4;
ivl158:;
	push	0;
	push	158;
	jmp	Istmake;
.align	16, 0xf4;
ivl159:;
	push	0;
	push	159;
	jmp	Istmake;
.align	16, 0xf4;
ivl160:;
	push	0;
	push	160;
	jmp	Istmake;
.align	16, 0xf4;
ivl161:;
	push	0;
	push	161;
	jmp	Istmake;
.align	16, 0xf4;
ivl162:;
	push	0;
	push	162;
	jmp	Istmake;
.align	16, 0xf4;
ivl163:;
	push	0;
	push	163;
	jmp	Istmake;
.align	16, 0xf4;
ivl164:;
	push	0;
	push	164;
	jmp	Istmake;
.align	16, 0xf4;
ivl165:;
	push	0;
	push	165;
	jmp	Istmake;
.align	16, 0xf4;
ivl166:;
	push	0;
	push	166;
	jmp	Istmake;
.align	16, 0xf4;
ivl167:;
	push	0;
	push	167;
	jmp	Istmake;
.align	16, 0xf4;
ivl168:;
	push	0;
	push	168;
	jmp	Istmake;
.align	16, 0xf4;
ivl169:;
	push	0;
	push	169;
	jmp	Istmake;
.align	16, 0xf4;
ivl170:;
	push	0;
	push	170;
	jmp	Istmake;
.align	16, 0xf4;
ivl171:;
	push	0;
	push	171;
	jmp	Istmake;
.align	16, 0xf4;
ivl172:;
	push	0;
	push	172;
	jmp	Istmake;
.align	16, 0xf4;
ivl173:;
	push	0;
	push	173;
	jmp	Istmake;
.align	16, 0xf4;
ivl174:;
	push	0;
	push	174;
	jmp	Istmake;
.align	16, 0xf4;
ivl175:;
	push	0;
	push	175;
	jmp	Istmake;
.align	16, 0xf4;
ivl176:;
	push	0;
	push	176;
	jmp	Istmake;
.align	16, 0xf4;
ivl177:;
	push	0;
	push	177;
	jmp	Istmake;
.align	16, 0xf4;
ivl178:;
	push	0;
	push	178;
	jmp	Istmake;
.align	16, 0xf4;
ivl179:;
	push	0;
	push	179;
	jmp	Istmake;
.align	16, 0xf4;
ivl180:;
	push	0;
	push	180;
	jmp	Istmake;
.align	16, 0xf4;
ivl181:;
	push	0;
	push	181;
	jmp	Istmake;
.align	16, 0xf4;
ivl182:;
	push	0;
	push	182;
	jmp	Istmake;
.align	16, 0xf4;
ivl183:;
	push	0;
	push	183;
	jmp	Istmake;
.align	16, 0xf4;
ivl184:;
	push	0;
	push	184;
	jmp	Istmake;
.align	16, 0xf4;
ivl185:;
	push	0;
	push	185;
	jmp	Istmake;
.align	16, 0xf4;
ivl186:;
	push	0;
	push	186;
	jmp	Istmake;
.align	16, 0xf4;
ivl187:;
	push	0;
	push	187;
	jmp	Istmake;
.align	16, 0xf4;
ivl188:;
	push	0;
	push	188;
	jmp	Istmake;
.align	16, 0xf4;
ivl189:;
	push	0;
	push	189;
	jmp	Istmake;
.align	16, 0xf4;
ivl190:;
	push	0;
	push	190;
	jmp	Istmake;
.align	16, 0xf4;
ivl191:;
	push	0;
	push	191;
	jmp	Istmake;
.align	16, 0xf4;
ivl192:;
	push	0;
	push	192;
	jmp	Istmake;
.align	16, 0xf4;
ivl193:;
	push	0;
	push	193;
	jmp	Istmake;
.align	16, 0xf4;
ivl194:;
	push	0;
	push	194;
	jmp	Istmake;
.align	16, 0xf4;
ivl195:;
	push	0;
	push	195;
	jmp	Istmake;
.align	16, 0xf4;
ivl196:;
	push	0;
	push	196;
	jmp	Istmake;
.align	16, 0xf4;
ivl197:;
	push	0;
	push	197;
	jmp	Istmake;
.align	16, 0xf4;
ivl198:;
	push	0;
	push	198;
	jmp	Istmake;
.align	16, 0xf4;
ivl199:;
	push	0;
	push	199;
	jmp	Istmake;
.align	16, 0xf4;
ivl200:;
	push	0;
	push	200;
	jmp	Istmake;
.align	16, 0xf4;
ivl201:;
	push	0;
	push	201;
	jmp	Istmake;
.align	16, 0xf4;
ivl202:;
	push	0;
	push	202;
	jmp	Istmake;
.align	16, 0xf4;
ivl203:;
	push	0;
	push	203;
	jmp	Istmake;
.align	16, 0xf4;
ivl204:;
	push	0;
	push	204;
	jmp	Istmake;
.align	16, 0xf4;
ivl205:;
	push	0;
	push	205;
	jmp	Istmake;
.align	16, 0xf4;
ivl206:;
	push	0;
	push	206;
	jmp	Istmake;
.align	16, 0xf4;
ivl207:;
	push	0;
	push	207;
	jmp	Istmake;
.align	16, 0xf4;
ivl208:;
	push	0;
	push	208;
	jmp	Istmake;
.align	16, 0xf4;
ivl209:;
	push	0;
	push	209;
	jmp	Istmake;
.align	16, 0xf4;
ivl210:;
	push	0;
	push	210;
	jmp	Istmake;
.align	16, 0xf4;
ivl211:;
	push	0;
	push	211;
	jmp	Istmake;
.align	16, 0xf4;
ivl212:;
	push	0;
	push	212;
	jmp	Istmake;
.align	16, 0xf4;
ivl213:;
	push	0;
	push	213;
	jmp	Istmake;
.align	16, 0xf4;
ivl214:;
	push	0;
	push	214;
	jmp	Istmake;
.align	16, 0xf4;
ivl215:;
	push	0;
	push	215;
	jmp	Istmake;
.align	16, 0xf4;
ivl216:;
	push	0;
	push	216;
	jmp	Istmake;
.align	16, 0xf4;
ivl217:;
	push	0;
	push	217;
	jmp	Istmake;
.align	16, 0xf4;
ivl218:;
	push	0;
	push	218;
	jmp	Istmake;
.align	16, 0xf4;
ivl219:;
	push	0;
	push	219;
	jmp	Istmake;
.align	16, 0xf4;
ivl220:;
	push	0;
	push	220;
	jmp	Istmake;
.align	16, 0xf4;
ivl221:;
	push	0;
	push	221;
	jmp	Istmake;
.align	16, 0xf4;
ivl222:;
	push	0;
	push	222;
	jmp	Istmake;
.align	16, 0xf4;
ivl223:;
	push	0;
	push	223;
	jmp	Istmake;
.align	16, 0xf4;
ivl224:;
	push	0;
	push	224;
	jmp	Istmake;
.align	16, 0xf4;
ivl225:;
	push	0;
	push	225;
	jmp	Istmake;
.align	16, 0xf4;
ivl226:;
	push	0;
	push	226;
	jmp	Istmake;
.align	16, 0xf4;
ivl227:;
	push	0;
	push	227;
	jmp	Istmake;
.align	16, 0xf4;
ivl228:;
	push	0;
	push	228;
	jmp	Istmake;
.align	16, 0xf4;
ivl229:;
	push	0;
	push	229;
	jmp	Istmake;
.align	16, 0xf4;
ivl230:;
	push	0;
	push	230;
	jmp	Istmake;
.align	16, 0xf4;
ivl231:;
	push	0;
	push	231;
	jmp	Istmake;
.align	16, 0xf4;
ivl232:;
	push	0;
	push	232;
	jmp	Istmake;
.align	16, 0xf4;
ivl233:;
	push	0;
	push	233;
	jmp	Istmake;
.align	16, 0xf4;
ivl234:;
	push	0;
	push	234;
	jmp	Istmake;
.align	16, 0xf4;
ivl235:;
	push	0;
	push	235;
	jmp	Istmake;
.align	16, 0xf4;
ivl236:;
	push	0;
	push	236;
	jmp	Istmake;
.align	16, 0xf4;
ivl237:;
	push	0;
	push	237;
	jmp	Istmake;
.align	16, 0xf4;
ivl238:;
	push	0;
	push	238;
	jmp	Istmake;
.align	16, 0xf4;
ivl239:;
	push	0;
	push	239;
	jmp	Istmake;
.align	16, 0xf4;
ivl240:;
	push	0;
	push	240;
	jmp	Istmake;
.align	16, 0xf4;
ivl241:;
	push	0;
	push	241;
	jmp	Istmake;
.align	16, 0xf4;
ivl242:;
	push	0;
	push	242;
	jmp	Istmake;
.align	16, 0xf4;
ivl243:;
	push	0;
	push	243;
	jmp	Istmake;
.align	16, 0xf4;
ivl244:;
	push	0;
	push	244;
	jmp	Istmake;
.align	16, 0xf4;
ivl245:;
	push	0;
	push	245;
	jmp	Istmake;
.align	16, 0xf4;
ivl246:;
	push	0;
	push	246;
	jmp	Istmake;
.align	16, 0xf4;
ivl247:;
	push	0;
	push	247;
	jmp	Istmake;
.align	16, 0xf4;
ivl248:;
	push	0;
	push	248;
	jmp	Istmake;
.align	16, 0xf4;
ivl249:;
	push	0;
	push	249;
	jmp	Istmake;
.align	16, 0xf4;
ivl250:;
	push	0;
	push	250;
	jmp	Istmake;
.align	16, 0xf4;
ivl251:;
	push	0;
	push	251;
	jmp	Istmake;
.align	16, 0xf4;
ivl252:;
	push	0;
	push	252;
	jmp	Istmake;
.align	16, 0xf4;
ivl253:;
	push	0;
	push	253;
	jmp	Istmake;
.align	16, 0xf4;
ivl254:;
	push	0;
	push	254;
	jmp	Istmake;
.align	16, 0xf4;
ivl255:;
	push	0;
	push	255;
	jmp	Istmake;
.align	16, 0xf4;
Istmake:;
	push	0;
	push	eax;
	xor	eax,	eax;
	push	eax;
	push	DWORD PTR [esp+0x1C];
	push	eax;
	push	DWORD PTR [esp+0x20];
	push	eax;
	push	DWORD PTR [esp+0x24];
	push	eax;
	push	DWORD PTR [esp+0x20];
	push	eax;
	push	ebx;
	push	eax;
	push	ecx;
	push	eax;
	push	edx;
	push	eax;
	push	edi;
	push	eax;
	push	esi;
	push	eax;
	push	ebp;
	push	0;
	push	0;
	sub	esp,	0x40;
	push	eax;
	mov	eax,	cr0;
	push	eax;
	sub	esp,	6;
	mov	ax,	ss
	push	ax;
	mov	ax,	ds;
	push	ax;
	mov	ax,	es;
	push	ax;
	mov	ax,	fs;
	push	ax;
	mov	ax,	gs;
	push	ax;
	mov	edi,	esp;
	mov	eax,	DWORD PTR [esp+0xB8];

	#NO_APP
	movl	%eax, %esi
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_2
# BB#1:                                 # %if.then.i2
	movl	$98, (%eax)
.LBB4_2:                                # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_4
# BB#3:                                 # %if.then.i5
	movl	%esi, (%eax)
.LBB4_4:                                # %_ZN7maestro6LoggerlsEj.exit
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_6
# BB#5:                                 # %if.then.i11
	movl	$97, (%eax)
.LBB4_6:                                # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit12
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_8
# BB#7:                                 # %if.then.i18
	movl	$96, (%eax)
.LBB4_8:                                # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit19
	movzwl	160(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_10
# BB#9:                                 # %if.then.i22
	movl	%esi, (%eax)
.LBB4_10:                               # %_ZN7maestro6LoggerlsEj.exit23
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_12
# BB#11:                                # %if.then.i35
	movl	$95, (%eax)
.LBB4_12:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit36
	movl	152(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_14
# BB#13:                                # %if.then.i39
	movl	%esi, (%eax)
.LBB4_14:                               # %_ZN7maestro6LoggerlsEj.exit40
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_16
# BB#15:                                # %if.then.i51
	movl	$94, (%eax)
.LBB4_16:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit52
	movl	176(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_18
# BB#17:                                # %if.then.i55
	movl	%esi, (%eax)
.LBB4_18:                               # %_ZN7maestro6LoggerlsEj.exit56
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_20
# BB#19:                                # %if.then.i68
	movl	$93, (%eax)
.LBB4_20:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit69
	movl	136(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_22
# BB#21:                                # %if.then.i72
	movl	%esi, (%eax)
.LBB4_22:                               # %_ZN7maestro6LoggerlsEj.exit73
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_24
# BB#23:                                # %if.then.i84
	movl	$92, (%eax)
.LBB4_24:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit85
	movl	128(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_26
# BB#25:                                # %if.then.i88
	movl	%esi, (%eax)
.LBB4_26:                               # %_ZN7maestro6LoggerlsEj.exit89
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_28
# BB#27:                                # %if.then.i101
	movl	$91, (%eax)
.LBB4_28:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit102
	movl	120(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_30
# BB#29:                                # %if.then.i105
	movl	%esi, (%eax)
.LBB4_30:                               # %_ZN7maestro6LoggerlsEj.exit106
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_32
# BB#31:                                # %if.then.i117
	movl	$90, (%eax)
.LBB4_32:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit118
	movl	112(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_34
# BB#33:                                # %if.then.i121
	movl	%esi, (%eax)
.LBB4_34:                               # %_ZN7maestro6LoggerlsEj.exit122
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_36
# BB#35:                                # %if.then.i134
	movl	$89, (%eax)
.LBB4_36:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit135
	movl	104(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_38
# BB#37:                                # %if.then.i138
	movl	%esi, (%eax)
.LBB4_38:                               # %_ZN7maestro6LoggerlsEj.exit139
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_40
# BB#39:                                # %if.then.i150
	movl	$88, (%eax)
.LBB4_40:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit151
	movl	96(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_42
# BB#41:                                # %if.then.i154
	movl	%esi, (%eax)
.LBB4_42:                               # %_ZN7maestro6LoggerlsEj.exit155
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_44
# BB#43:                                # %if.then.i167
	movl	$87, (%eax)
.LBB4_44:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit168
	movzwl	6(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_46
# BB#45:                                # %if.then.i171
	movl	%esi, (%eax)
.LBB4_46:                               # %_ZN7maestro6LoggerlsEj.exit172
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_48
# BB#47:                                # %if.then.i183
	movl	$86, (%eax)
.LBB4_48:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit184
	movzwl	4(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_50
# BB#49:                                # %if.then.i187
	movl	%esi, (%eax)
.LBB4_50:                               # %_ZN7maestro6LoggerlsEj.exit188
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_52
# BB#51:                                # %if.then.i194
	movl	$85, (%eax)
.LBB4_52:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit195
	movzwl	2(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_54
# BB#53:                                # %if.then.i177
	movl	%esi, (%eax)
.LBB4_54:                               # %_ZN7maestro6LoggerlsEj.exit178
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_56
# BB#55:                                # %if.then.i161
	movl	$84, (%eax)
.LBB4_56:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit162
	movzwl	(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_58
# BB#57:                                # %if.then.i144
	movl	%esi, (%eax)
.LBB4_58:                               # %_ZN7maestro6LoggerlsEj.exit145
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_60
# BB#59:                                # %if.then.i128
	movl	$83, (%eax)
.LBB4_60:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit129
	movzwl	8(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_62
# BB#61:                                # %if.then.i111
	movl	%esi, (%eax)
.LBB4_62:                               # %_ZN7maestro6LoggerlsEj.exit112
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_64
# BB#63:                                # %if.then.i95
	movl	$82, (%eax)
.LBB4_64:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit96
	movl	144(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_66
# BB#65:                                # %if.then.i78
	movl	%esi, (%eax)
.LBB4_66:                               # %_ZN7maestro6LoggerlsEj.exit79
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_68
# BB#67:                                # %if.then.i62
	movl	$81, (%eax)
.LBB4_68:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit63
	movl	168(%edi), %esi
	movl	$2, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_70
# BB#69:                                # %if.then.i45
	movl	%esi, (%eax)
.LBB4_70:                               # %_ZN7maestro6LoggerlsEj.exit46
	movl	$1, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_72
# BB#71:                                # %if.then.i29
	movl	$80, (%eax)
.LBB4_72:                               # %_ZN7maestro6LoggerlsERKNS_12StaticStringE.exit30
	movb	$1, %al
	xchgb	%al, _ZZ5_exitE4flag
	testb	%al, %al
	jne	.LBB4_76
# BB#73:                                # %if.then.i
	movl	$4, %ecx
	calll	_ZN7maestro6Logger9AddRecordEjj
	testl	%eax, %eax
	je	.LBB4_75
# BB#74:                                # %if.then.i.i
	movl	$-1, (%eax)
.LBB4_75:                               # %_ZN7maestro6LoggerlsERKNS_14ThreadExitCodeE.exit.i
	movl	$-2147418042, -2038431648 # imm = 0xFFFFFFFF80010046
.LBB4_76:                               # %if.then2.i
	#APP
	movl $0xdead, %ebx
	#NO_APP
	#APP
	hlt
	#NO_APP
.Ltmp4:
	.size	_Z24_DefaultInterruptHandlerv, .Ltmp4-_Z24_DefaultInterruptHandlerv

	.align	16, 0x90
	.type	_Z10ThreadExiti,@function
_Z10ThreadExiti:                        # @_Z10ThreadExiti
# BB#0:                                 # %entry
	pushl	%edi
	pushl	%esi
	movl	%ecx, %esi
	movl	-18874336, %edi
	calll	.L_ZN7maestro6Logger9AddRecordEjj179
	testl	%eax, %eax
	je	.LBB5_2
# BB#1:                                 # %if.then.i
	movl	%esi, (%eax)
.LBB5_2:                                # %_ZN7maestro6LoggerlsERKNS_14ThreadExitCodeE174.exit
	cmpl	$16777215, %edi         # imm = 0xFFFFFF
	ja	.LBB5_14
# BB#3:                                 # %if.then
	cmpl	$2, ThreadExitSync+8
	jb	.LBB5_8
# BB#4:                                 # %if.then.i1
	movl	ThreadExitSync+4, %eax
	movl	$1, %ecx
	lock
	xaddl	%ecx, ThreadExitSync
	incl	%ecx
	cmpl	ThreadExitSync+8, %ecx
	jne	.LBB5_7
# BB#5:                                 # %if.then4.i
	movl	$0, ThreadExitSync
	lock
	incl	ThreadExitSync+4
	jmp	.LBB5_8
	.align	16, 0x90
.LBB5_6:                                # %while.body.i
                                        #   in Loop: Header=BB5_7 Depth=1
	#APP
	pause
	#NO_APP
.LBB5_7:                                # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	movl	ThreadExitSync+4, %ecx
	cmpl	%eax, %ecx
	je	.LBB5_6
.LBB5_8:                                # %_ZN7maestro7Barrier4SyncEv.exit
	movl	_ZL16ThreadExitFailed, %eax
.LBB5_9:                                # %_ZN7maestro7Barrier4SyncEv.exit
                                        # =>This Inner Loop Header: Depth=1
	movl	%esi, %ecx
	orl	%eax, %ecx
	lock
	cmpxchgl	%ecx, _ZL16ThreadExitFailed
	jne	.LBB5_9
# BB#10:                                # %_ZN7maestro7Barrier4SyncEv.exit
	orl	%esi, %eax
	jne	.LBB5_12
# BB#11:                                # %if.end.thread
	movl	$-2147418032, -2038431648 # imm = 0xFFFFFFFF80010050
	#APP
	mov $0xaced, %ebx
	#NO_APP
	#APP
	hlt
	#NO_APP
.LBB5_14:                               # %if.else
	lock
	orl	%esi, _ZL16ThreadExitFailed
	cmpl	$2, ThreadExitSync+8
	jb	.LBB5_19
# BB#15:                                # %if.then.i6
	movl	ThreadExitSync+4, %eax
	movl	$1, %ecx
	lock
	xaddl	%ecx, ThreadExitSync
	incl	%ecx
	cmpl	ThreadExitSync+8, %ecx
	jne	.LBB5_18
# BB#16:                                # %if.then4.i9
	movl	$0, ThreadExitSync
	lock
	incl	ThreadExitSync+4
	jmp	.LBB5_19
	.align	16, 0x90
.LBB5_17:                               # %while.body.i11
                                        #   in Loop: Header=BB5_18 Depth=1
	#APP
	pause
	#NO_APP
.LBB5_18:                               # %while.body.i11
                                        # =>This Inner Loop Header: Depth=1
	movl	ThreadExitSync+4, %ecx
	cmpl	%eax, %ecx
	je	.LBB5_17
.LBB5_19:                               # %if.end
	testl	%esi, %esi
	jne	.LBB5_13
# BB#20:                                # %if.else2
	#APP
	mov $0xaced, %ebx
	#NO_APP
	#APP
	hlt
	#NO_APP
.LBB5_12:                               # %if.end.thread14
	movl	$-2147418042, -2038431648 # imm = 0xFFFFFFFF80010046
.LBB5_13:                               # %if.then1
	#APP
	movl $0xdead, %ebx
	#NO_APP
	#APP
	hlt
	#NO_APP
.Ltmp5:
	.size	_Z10ThreadExiti, .Ltmp5-_Z10ThreadExiti

	.section	.text.startup,"ax",@progbits
	.align	16, 0x90
	.type	_GLOBAL__I_a,@function
_GLOBAL__I_a:                           # @_GLOBAL__I_a
# BB#0:                                 # %entry
	movl	$0, ThreadExitSync
	movl	$0, ThreadExitSync+4
	movl	$1, ThreadExitSync+8
	ret
.Ltmp6:
	.size	_GLOBAL__I_a, .Ltmp6-_GLOBAL__I_a

	.text
	.align	16, 0x90
	.type	_ZN7maestro6Logger9AddRecordEjj,@function
_ZN7maestro6Logger9AddRecordEjj:        # @_ZN7maestro6Logger9AddRecordEjj
# BB#0:                                 # %entry
	movl	$3, %eax
	lock
	xaddl	%eax, LogBufferSize
	leal	3(%eax), %edx
	cmpl	$262145, %edx           # imm = 0x40001
	jb	.LBB7_2
# BB#1:                                 # %if.then
	movl	$262144, LogBufferSize  # imm = 0x40000
	xorl	%eax, %eax
	ret
.LBB7_2:                                # %if.end
	shll	$16, %ecx
	orl	$3, %ecx
	movl	%ecx, _ZN12_GLOBAL__N_16bufferE_maestro_init_0(,%eax,4)
	movl	-18874336, %ecx
	shrl	$24, %ecx
	movl	%ecx, _ZN12_GLOBAL__N_16bufferE_maestro_init_0+4(,%eax,4)
	leal	_ZN12_GLOBAL__N_16bufferE_maestro_init_0+8(,%eax,4), %eax
	ret
.Ltmp7:
	.size	_ZN7maestro6Logger9AddRecordEjj, .Ltmp7-_ZN7maestro6Logger9AddRecordEjj

	.align	16, 0x90
	.type	memset,@function
memset:                                 # @memset
# BB#0:                                 # %entry
	pushl	%edi
	movl	8(%esp), %edi
	movl	12(%esp), %eax
	movl	16(%esp), %ecx
	#APP
	cld ; rep stosb
	#NO_APP
	movl	%edi, %eax
	popl	%edi
	ret
.Ltmp8:
	.size	memset, .Ltmp8-memset

	.align	16, 0x90
	.type	memcpy,@function
memcpy:                                 # @memcpy
# BB#0:                                 # %entry
	pushl	%edi
	pushl	%esi
	movl	16(%esp), %esi
	movl	12(%esp), %edi
	movl	20(%esp), %ecx
	#APP
	cld ; rep movsb
	#NO_APP
	movl	%edi, %eax
	popl	%esi
	popl	%edi
	ret
.Ltmp9:
	.size	memcpy, .Ltmp9-memcpy

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
# BB#0:                                 # %entry
	cmpl	$16777216, -18874336    # imm = 0x1000000
	jae	.LBB10_1
# BB#2:                                 # %apicId1
	movl	$_mainStub_0_stack+4096, %eax
	#APP
	movl %eax, %esp
	#NO_APP
	calll	.L__ExecuteGlobalCtorChain1
	calll	.L__WaitForGlobalCtorChain1
	movl	$804384, -18873600      # imm = 0xC4620
	calll	__MCP__Test__MCP__main
	movl	%eax, %ecx
	calll	_Z10ThreadExiti
.LBB10_1:                               # %idledThreads
	#APP
	hlt
	#NO_APP
.Ltmp10:
	.size	main, .Ltmp10-main

	.align	16, 0x90
	.type	.L__ExecuteGlobalCtorChain0,@function
.L__ExecuteGlobalCtorChain0:            # @__ExecuteGlobalCtorChain0
# BB#0:                                 # %entry
	pushl	%ebx
	movb	$1, %bl
	movb	$1, %al
	xchgb	%al, __FlagRunCtorOnce0
	testb	%al, %al
	jne	.LBB11_2
# BB#1:                                 # %if.then
	calll	.L__CallAllCtors0
	xchgb	%bl, __BarrierWaitOnCtor0
.LBB11_2:                               # %if.end
	popl	%ebx
	ret
.Ltmp11:
	.size	.L__ExecuteGlobalCtorChain0, .Ltmp11-.L__ExecuteGlobalCtorChain0

	.align	16, 0x90
	.type	.L__WaitForGlobalCtorChain0,@function
.L__WaitForGlobalCtorChain0:            # @__WaitForGlobalCtorChain0
# BB#0:                                 # %entry
	.align	16, 0x90
.LBB12_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movb	__BarrierWaitOnCtor0, %al
	testb	%al, %al
	je	.LBB12_1
# BB#2:                                 # %while.end
	ret
.Ltmp12:
	.size	.L__WaitForGlobalCtorChain0, .Ltmp12-.L__WaitForGlobalCtorChain0

	.align	16, 0x90
	.type	.L__CallAllCtors0,@function
.L__CallAllCtors0:                      # @__CallAllCtors0
# BB#0:                                 # %entry
	movl	$0, __MCP__Test__MCP__bar
	movl	$0, __MCP__Test__MCP__bar+4
	movl	$1, __MCP__Test__MCP__bar+8
	ret
.Ltmp13:
	.size	.L__CallAllCtors0, .Ltmp13-.L__CallAllCtors0

	.align	16, 0x90
	.type	.L__ExecuteGlobalCtorChain1,@function
.L__ExecuteGlobalCtorChain1:            # @__ExecuteGlobalCtorChain1
# BB#0:                                 # %entry
	pushl	%ebx
	movb	$1, %bl
	movb	$1, %al
	xchgb	%al, __FlagRunCtorOnce1
	testb	%al, %al
	jne	.LBB14_2
# BB#1:                                 # %if.then
	calll	.L__CallAllCtors1
	xchgb	%bl, __BarrierWaitOnCtor1
.LBB14_2:                               # %if.end
	popl	%ebx
	ret
.Ltmp14:
	.size	.L__ExecuteGlobalCtorChain1, .Ltmp14-.L__ExecuteGlobalCtorChain1

	.align	16, 0x90
	.type	.L__WaitForGlobalCtorChain1,@function
.L__WaitForGlobalCtorChain1:            # @__WaitForGlobalCtorChain1
# BB#0:                                 # %entry
	.align	16, 0x90
.LBB15_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movb	__BarrierWaitOnCtor1, %al
	testb	%al, %al
	je	.LBB15_1
# BB#2:                                 # %while.end
	ret
.Ltmp15:
	.size	.L__WaitForGlobalCtorChain1, .Ltmp15-.L__WaitForGlobalCtorChain1

	.align	16, 0x90
	.type	.L__CallAllCtors1,@function
.L__CallAllCtors1:                      # @__CallAllCtors1
# BB#0:                                 # %entry
	movl	$0, ThreadExitSync
	movl	$0, ThreadExitSync+4
	movl	$1, ThreadExitSync+8
	ret
.Ltmp16:
	.size	.L__CallAllCtors1, .Ltmp16-.L__CallAllCtors1

	.globl	__cxx_global_var_dtor
	.align	16, 0x90
	.type	__cxx_global_var_dtor,@function
__cxx_global_var_dtor:                  # @__cxx_global_var_dtor
# BB#0:                                 # %entry
	ret
.Ltmp17:
	.size	__cxx_global_var_dtor, .Ltmp17-__cxx_global_var_dtor

	.align	16, 0x90
	.type	.L_ZN7maestro6Logger9AddRecordEjj179,@function
.L_ZN7maestro6Logger9AddRecordEjj179:   # @_ZN7maestro6Logger9AddRecordEjj179
# BB#0:                                 # %entry
	movl	$3, %eax
	lock
	xaddl	%eax, LogBufferSize
	leal	3(%eax), %ecx
	cmpl	$262145, %ecx           # imm = 0x40001
	jb	.LBB18_2
# BB#1:                                 # %if.then
	movl	$262144, LogBufferSize  # imm = 0x40000
	xorl	%eax, %eax
	ret
.LBB18_2:                               # %if.end
	movl	$262147, _ZN12_GLOBAL__N_16bufferE_maestro_init_0(,%eax,4) # imm = 0x40003
	movl	$0, _ZN12_GLOBAL__N_16bufferE_maestro_init_0+4(,%eax,4)
	leal	_ZN12_GLOBAL__N_16bufferE_maestro_init_0+8(,%eax,4), %eax
	ret
.Ltmp18:
	.size	.L_ZN7maestro6Logger9AddRecordEjj179, .Ltmp18-.L_ZN7maestro6Logger9AddRecordEjj179

	.type	__MCP__Test__MCP__buffer_maestro_init_2,@object # @__MCP__Test__MCP__buffer_maestro_init_2
	.section	__MCP__Test__MCP__buffer_maestro_init_2,"aw",@progbits
	.globl	__MCP__Test__MCP__buffer_maestro_init_2
__MCP__Test__MCP__buffer_maestro_init_2:
	.zero	16777216
	.size	__MCP__Test__MCP__buffer_maestro_init_2, 16777216

	.type	__MCP__Test__MCP__checksum_maestro_init_1,@object # @__MCP__Test__MCP__checksum_maestro_init_1
	.section	__MCP__Test__MCP__checksum_maestro_init_1,"aw",@progbits
	.globl	__MCP__Test__MCP__checksum_maestro_init_1
__MCP__Test__MCP__checksum_maestro_init_1:
	.zero	4
	.size	__MCP__Test__MCP__checksum_maestro_init_1, 4

	.type	__MCP__Test__MCP__bar,@object # @__MCP__Test__MCP__bar
	.local	__MCP__Test__MCP__bar
	.comm	__MCP__Test__MCP__bar,12,4
	.section	.ctors,"aw",@progbits
	.align	4
	.long	__MCP__Test__MCP___GLOBAL__I_a
	.long	_GLOBAL__I_a
	.type	IDTBuffer,@object       # @IDTBuffer
	.local	IDTBuffer
	.comm	IDTBuffer,2048,4096
	.type	ThreadExitSync,@object  # @ThreadExitSync
	.local	ThreadExitSync
	.comm	ThreadExitSync,12,4
	.type	_ZL16ThreadExitFailed,@object # @_ZL16ThreadExitFailed
	.local	_ZL16ThreadExitFailed
	.comm	_ZL16ThreadExitFailed,4,4
	.type	_ZZ5_exitE4flag,@object # @_ZZ5_exitE4flag
	.local	_ZZ5_exitE4flag
	.comm	_ZZ5_exitE4flag,1,1
	.type	_ZN12_GLOBAL__N_16bufferE_maestro_init_0,@object # @_ZN12_GLOBAL__N_16bufferE_maestro_init_0
	.section	_ZN12_GLOBAL__N_16bufferE_maestro_init_0,"aw",@progbits
	.globl	_ZN12_GLOBAL__N_16bufferE_maestro_init_0
_ZN12_GLOBAL__N_16bufferE_maestro_init_0:
	.zero	1048576
	.size	_ZN12_GLOBAL__N_16bufferE_maestro_init_0, 1048576

	.type	LogBufferBase,@object   # @LogBufferBase
	.data
	.globl	LogBufferBase
	.align	4
LogBufferBase:
	.long	_ZN12_GLOBAL__N_16bufferE_maestro_init_0
	.size	LogBufferBase, 4

	.type	LogBufferSize,@object   # @LogBufferSize
	.bss
	.globl	LogBufferSize
	.align	4
LogBufferSize:
	.long	0                       # 0x0
	.size	LogBufferSize, 4

	.type	_mainStub_0_stack,@object # @_mainStub_0_stack
	.local	_mainStub_0_stack
	.comm	_mainStub_0_stack,4096,4096
	.type	__BarrierWaitOnCtor0,@object # @__BarrierWaitOnCtor0
	.local	__BarrierWaitOnCtor0
	.comm	__BarrierWaitOnCtor0,1,1
	.type	__FlagRunCtorOnce0,@object # @__FlagRunCtorOnce0
	.local	__FlagRunCtorOnce0
	.comm	__FlagRunCtorOnce0,1,1
	.type	__BarrierWaitOnCtor1,@object # @__BarrierWaitOnCtor1
	.local	__BarrierWaitOnCtor1
	.comm	__BarrierWaitOnCtor1,1,1
	.type	__FlagRunCtorOnce1,@object # @__FlagRunCtorOnce1
	.local	__FlagRunCtorOnce1
	.comm	__FlagRunCtorOnce1,1,1

	.section	".note.GNU-stack","",@progbits
