	.file	"clockgranularity.c"
# GNU C17 (Ubuntu 9.3.0-17ubuntu1~20.04) version 9.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.3.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu clockgranularity.c
# -mtune=generic -march=x86-64 -O2 -fverbose-asm
# -fasynchronous-unwind-tables -fstack-protector-strong -Wformat
# -Wformat-security -fstack-clash-protection -fcf-protection
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -falign-functions -falign-jumps -falign-labels -falign-loops
# -fassume-phsa -fasynchronous-unwind-tables -fauto-inc-dec
# -fbranch-count-reg -fcaller-saves -fcode-hoisting
# -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
# -fcrossjumping -fcse-follow-jumps -fdefer-pop
# -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -fexpensive-optimizations -fforward-propagate -ffp-int-builtin-inexact
# -ffunction-cse -fgcse -fgcse-lm -fgnu-runtime -fgnu-unique
# -fguess-branch-probability -fhoist-adjacent-loads -fident -fif-conversion
# -fif-conversion2 -findirect-inlining -finline -finline-atomics
# -finline-functions-called-once -finline-small-functions -fipa-bit-cp
# -fipa-cp -fipa-icf -fipa-icf-functions -fipa-icf-variables -fipa-profile
# -fipa-pure-const -fipa-ra -fipa-reference -fipa-reference-addressable
# -fipa-sra -fipa-stack-alignment -fipa-vrp -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
# -fmath-errno -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2 -fplt
# -fprefetch-loop-arrays -free -freg-struct-return -freorder-blocks
# -freorder-blocks-and-partition -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fschedule-insns2
# -fsemantic-interposition -fshow-column -fshrink-wrap
# -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
# -fsplit-wide-types -fssa-backprop -fssa-phiopt -fstack-clash-protection
# -fstack-protector-strong -fstdarg-opt -fstore-merging -fstrict-aliasing
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim
# -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
# -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
# -ftree-vrp -funit-at-a-time -funwind-tables -fverbose-asm
# -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -malign-stringops -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387 -mfxsr
# -mglibc -mieee-fp -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone
# -msse -msse2 -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.p2align 4
	.globl	elapsed
	.type	elapsed, @function
elapsed:
.LFB50:
	.cfi_startproc
	endbr64	
# clockgranularity.c:28: 	uint64_t end   = (((uint64_t)end_hi)   << 32) | end_lo;
	salq	$32, %rdx	#, tmp97
# clockgranularity.c:28: 	uint64_t end   = (((uint64_t)end_hi)   << 32) | end_lo;
	movl	%ecx, %eax	# tmp107, end_lo
# clockgranularity.c:27: 	uint64_t start = (((uint64_t)start_hi) << 32) | start_lo;
	salq	$32, %rdi	#, tmp101
# clockgranularity.c:27: 	uint64_t start = (((uint64_t)start_hi) << 32) | start_lo;
	movl	%esi, %esi	# tmp105, start_lo
# clockgranularity.c:28: 	uint64_t end   = (((uint64_t)end_hi)   << 32) | end_lo;
	orq	%rax, %rdx	# end_lo, end
# clockgranularity.c:27: 	uint64_t start = (((uint64_t)start_hi) << 32) | start_lo;
	orq	%rsi, %rdi	# start_lo, start
# clockgranularity.c:29: 	return end-start;
	movq	%rdx, %rax	# end, end
	subq	%rdi, %rax	# start, end
# clockgranularity.c:30: }
	ret	
	.cfi_endproc
.LFE50:
	.size	elapsed, .-elapsed
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%d\t%.2e\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"# min dist = %.2e, max dist = %.2e, total time = %.2e\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp	#,
	.cfi_def_cfa_offset 80
# clockgranularity.c:42:   if (argc > 0) n = atoi(argv[1]);
	testl	%edi, %edi	# tmp181
	jle	.L4	#,
# /usr/include/stdlib.h:363:   return (int) strtol (__nptr, (char **) NULL, 10);
	movq	8(%rsi), %rdi	# MEM[(char * *)argv_46(D) + 8B], MEM[(char * *)argv_46(D) + 8B]
	movl	$10, %edx	#,
	xorl	%esi, %esi	#
	call	strtol@PLT	#
# /usr/include/stdlib.h:363:   return (int) strtol (__nptr, (char **) NULL, 10);
	movl	%eax, %r12d	# tmp183, n
.L4:
# clockgranularity.c:44:   ticks = (double *)malloc(n * sizeof(double));
	movslq	%r12d, %r13	# n, n
	salq	$3, %r13	#, _3
	movq	%r13, %rdi	# _3,
	call	malloc@PLT	#
	movq	%rax, %rbp	# tmp184, ticks
# clockgranularity.c:50:   for (i=0; i<n; i++) {
	testl	%r12d, %r12d	# n
	jle	.L30	#,
	movq	%rax, %r10	# ticks, ivtmp.52
	leaq	8(%rbp), %r9	#, ivtmp.42
	leal	-1(%r12), %eax	#, tmp153
# clockgranularity.c:49:   totTime = 0;
	xorl	%r8d, %r8d	# totTime
	leaq	(%r9,%rax,8), %r11	#, _129
	jmp	.L11	#
	.p2align 4,,10
	.p2align 3
.L32:
# clockgranularity.c:54:      ticks[i] = totTime;
	pxor	%xmm0, %xmm0	# tmp169
	addq	$8, %r10	#, ivtmp.52
	cvtsi2sdq	%r8, %xmm0	# totTime, tmp169
	movsd	%xmm0, -8(%r10)	# tmp169, MEM[base: _39, offset: 0B]
# clockgranularity.c:50:   for (i=0; i<n; i++) {
	cmpq	%r11, %r10	# _129, ivtmp.52
	je	.L31	#,
.L11:
# clockgranularity.c:51:      RDTSC_START(); 
#APP
# 51 "clockgranularity.c" 1
	CPUID
	RDTSC
	mov %edx, %edi	# start_hi
	mov %eax, %r14d	# start_lo
	
# 0 "" 2
# clockgranularity.c:52:      RDTSC_STOP();    
# 52 "clockgranularity.c" 1
	RDTSCP
	mov %edx, %esi	# end_hi
	mov %eax, %r15d	# end_lo
	CPUID
	
# 0 "" 2
# clockgranularity.c:28: 	uint64_t end   = (((uint64_t)end_hi)   << 32) | end_lo;
#NO_APP
	movq	%rsi, %rax	# end_hi, tmp161
# clockgranularity.c:27: 	uint64_t start = (((uint64_t)start_hi) << 32) | start_lo;
	salq	$32, %rdi	#, tmp165
# clockgranularity.c:28: 	uint64_t end   = (((uint64_t)end_hi)   << 32) | end_lo;
	movl	%r15d, %esi	# end_lo, end_lo
# clockgranularity.c:27: 	uint64_t start = (((uint64_t)start_hi) << 32) | start_lo;
	movl	%r14d, %r14d	# start_lo, start_lo
# clockgranularity.c:28: 	uint64_t end   = (((uint64_t)end_hi)   << 32) | end_lo;
	salq	$32, %rax	#, tmp161
# clockgranularity.c:27: 	uint64_t start = (((uint64_t)start_hi) << 32) | start_lo;
	orq	%r14, %rdi	# start_lo, start
# clockgranularity.c:28: 	uint64_t end   = (((uint64_t)end_hi)   << 32) | end_lo;
	orq	%rsi, %rax	# end_lo, end
# clockgranularity.c:29: 	return end-start;
	subq	%rdi, %rax	# start, tmp168
# clockgranularity.c:54:      ticks[i] = totTime;
	addq	%rax, %r8	# tmp168, totTime
	jns	.L32	#,
	movq	%r8, %rax	# totTime, tmp171
	movq	%r8, %rdx	# totTime, tmp172
	pxor	%xmm0, %xmm0	# tmp170
	addq	$8, %r10	#, ivtmp.52
	shrq	%rax	# tmp171
	andl	$1, %edx	#, tmp172
	orq	%rdx, %rax	# tmp172, tmp171
	cvtsi2sdq	%rax, %xmm0	# tmp171, tmp170
	addsd	%xmm0, %xmm0	# tmp170, tmp169
	movsd	%xmm0, -8(%r10)	# tmp169, MEM[base: _39, offset: 0B]
# clockgranularity.c:50:   for (i=0; i<n; i++) {
	cmpq	%r11, %r10	# _129, ivtmp.52
	jne	.L11	#,
.L31:
	movsd	0(%rbp), %xmm4	# *ticks_49, pretmp_115
	movsd	-8(%rbp,%r13), %xmm2	# *_113, *_113
	subsd	%xmm4, %xmm2	# pretmp_115, _119
# clockgranularity.c:61:   for (i=1; i<n; i++) {
	cmpl	$1, %r12d	#, n
	jle	.L7	#,
	leal	-2(%r12), %r13d	#, _95
# clockgranularity.c:60:   maxdist = 0;
	pxor	%xmm6, %xmm6	# tmp178
# clockgranularity.c:59:   mindist = 1e10;
	movsd	.LC1(%rip), %xmm5	#, mindist
# clockgranularity.c:61:   for (i=1; i<n; i++) {
	movapd	%xmm4, %xmm0	# pretmp_115, prephitmp_121
	leaq	(%r9,%r13,8), %rax	#, _82
# clockgranularity.c:60:   maxdist = 0;
	movapd	%xmm6, %xmm1	# tmp178, maxdist
	jmp	.L8	#
	.p2align 4,,10
	.p2align 3
.L33:
	addq	$8, %r9	#, ivtmp.42
# clockgranularity.c:61:   for (i=1; i<n; i++) {
	movapd	%xmm3, %xmm0	# _13, prephitmp_121
.L8:
# clockgranularity.c:62:     dist = ticks[i] - ticks[i-1];
	movsd	(%r9), %xmm3	# MEM[base: _99, offset: 0B], _13
# clockgranularity.c:62:     dist = ticks[i] - ticks[i-1];
	movapd	%xmm3, %xmm7	# _13, dist
	subsd	%xmm0, %xmm7	# prephitmp_121, dist
# clockgranularity.c:63:     if (dist > 0) {
	comisd	%xmm6, %xmm7	# tmp178, dist
# clockgranularity.c:62:     dist = ticks[i] - ticks[i-1];
	movapd	%xmm7, %xmm0	# dist, dist
# clockgranularity.c:63:     if (dist > 0) {
	jbe	.L13	#,
# clockgranularity.c:64:       if (dist < mindist) mindist = dist;
	minsd	%xmm5, %xmm7	# mindist, mindist
# clockgranularity.c:65:       if (dist > maxdist) maxdist = dist;
	maxsd	%xmm1, %xmm0	# maxdist, dist
# clockgranularity.c:64:       if (dist < mindist) mindist = dist;
	movapd	%xmm7, %xmm5	# mindist, mindist
# clockgranularity.c:65:       if (dist > maxdist) maxdist = dist;
	movapd	%xmm0, %xmm1	# dist, maxdist
.L13:
# clockgranularity.c:61:   for (i=1; i<n; i++) {
	cmpq	%r9, %rax	# ivtmp.42, _82
	jne	.L33	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:107:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movapd	%xmm5, %xmm0	# mindist,
	leaq	.LC3(%rip), %rsi	#,
	movl	$1, %edi	#,
	movl	$3, %eax	#,
	movsd	%xmm4, 8(%rsp)	# pretmp_115, %sfp
	addq	$1, %r13	#, _104
	movl	$1, %r12d	#, ivtmp.21
	leaq	.LC2(%rip), %r14	#, tmp180
	call	__printf_chk@PLT	#
	movsd	8(%rsp), %xmm4	# %sfp, pretmp_115
	jmp	.L20	#
	.p2align 4,,10
	.p2align 3
.L19:
	addq	$1, %r12	#, ivtmp.21
# clockgranularity.c:71:   for (i=1; i<n; i++) {
	movapd	%xmm1, %xmm4	# _27, pretmp_115
.L20:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:107:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	%r12d, %edx	# ivtmp.21,
	movq	%r14, %rsi	# tmp180,
	movl	$1, %edi	#,
	movl	$1, %eax	#,
# clockgranularity.c:72:     printf("%d\t%.2e\n", i, ticks[i] - ticks[i-1]);
	movsd	0(%rbp,%r12,8), %xmm1	# MEM[base: ticks_49, index: ivtmp.21_28, step: 8, offset: 0B], _27
# clockgranularity.c:72:     printf("%d\t%.2e\n", i, ticks[i] - ticks[i-1]);
	movapd	%xmm1, %xmm0	# _27, tmp174
	movsd	%xmm1, 8(%rsp)	# _27, %sfp
	subsd	%xmm4, %xmm0	# pretmp_115, tmp174
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:107:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
# clockgranularity.c:71:   for (i=1; i<n; i++) {
	cmpq	%r13, %r12	# _104, ivtmp.21
	movsd	8(%rsp), %xmm1	# %sfp, _27
	jne	.L19	#,
.L28:
# clockgranularity.c:76: }
	addq	$24, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax	#
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
.L30:
	.cfi_restore_state
	movsd	-8(%rax,%r13), %xmm2	# *_60, *_60
	subsd	(%rax), %xmm2	# *ticks_49, _119
.L7:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:107:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	pxor	%xmm1, %xmm1	#
	movl	$1, %edi	#,
	movl	$3, %eax	#,
	movsd	.LC1(%rip), %xmm0	#,
	leaq	.LC3(%rip), %rsi	#,
	call	__printf_chk@PLT	#
	jmp	.L28	#
	.cfi_endproc
.LFE51:
	.size	main, .-main
	.text
	.p2align 4
	.globl	mysecond
	.type	mysecond, @function
mysecond:
.LFB52:
	.cfi_startproc
	endbr64	
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 64
# clockgranularity.c:79: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp97
	movq	%rax, 40(%rsp)	# tmp97, D.4131
	xorl	%eax, %eax	# tmp97
# clockgranularity.c:83:   i = gettimeofday(&tp,&tzp);
	leaq	8(%rsp), %rsi	#, tmp89
	leaq	16(%rsp), %rdi	#, tmp90
	call	gettimeofday@PLT	#
# clockgranularity.c:84:   return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
	pxor	%xmm0, %xmm0	# tmp91
# clockgranularity.c:84:   return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
	pxor	%xmm1, %xmm1	# tmp94
# clockgranularity.c:85: }
	movq	40(%rsp), %rax	# D.4131, tmp98
	xorq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp98
# clockgranularity.c:84:   return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
	cvtsi2sdq	24(%rsp), %xmm0	# tp.tv_usec, tmp91
# clockgranularity.c:84:   return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
	mulsd	.LC4(%rip), %xmm0	#, tmp92
# clockgranularity.c:84:   return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
	cvtsi2sdq	16(%rsp), %xmm1	# tp.tv_sec, tmp94
# clockgranularity.c:84:   return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
	addsd	%xmm1, %xmm0	# tmp94, <retval>
# clockgranularity.c:85: }
	jne	.L37	#,
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L37:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE52:
	.size	mysecond, .-mysecond
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	536870912
	.long	1107468383
	.align 8
.LC4:
	.long	2696277389
	.long	1051772663
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
