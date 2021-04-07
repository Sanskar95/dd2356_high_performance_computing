	.file	"nbody.c"
# GNU C17 (Ubuntu 9.3.0-17ubuntu1~20.04) version 9.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.3.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu nbody.c -mtune=generic
# -march=x86-64 -fverbose-asm -fasynchronous-unwind-tables
# -fstack-protector-strong -Wformat -Wformat-security
# -fstack-clash-protection -fcf-protection
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -fassume-phsa -fasynchronous-unwind-tables -fauto-inc-dec -fcommon
# -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -ffp-int-builtin-inexact -ffunction-cse
# -fgcse-lm -fgnu-runtime -fgnu-unique -fident -finline-atomics
# -fipa-stack-alignment -fira-hoist-pressure -fira-share-save-slots
# -fira-share-spill-slots -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flto-odr-type-merging -fmath-errno
# -fmerge-debug-strings -fpeephole -fplt -fprefetch-loop-arrays
# -freg-struct-return -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fsemantic-interposition -fshow-column -fshrink-wrap-separate
# -fsigned-zeros -fsplit-ivs-in-unroller -fssa-backprop
# -fstack-clash-protection -fstack-protector-strong -fstdarg-opt
# -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math -ftree-cselim
# -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop
# -ftree-reassoc -ftree-scev-cprop -funit-at-a-time -funwind-tables
# -fverbose-asm -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -malign-stringops -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387 -mfxsr
# -mglibc -mieee-fp -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone
# -msse -msse2 -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
	.globl	mysecond
	.type	mysecond, @function
mysecond:
.LFB6:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
# nbody.c:33: double mysecond(){
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp94
	movq	%rax, -8(%rbp)	# tmp94, D.5022
	xorl	%eax, %eax	# tmp94
# nbody.c:38:   i = gettimeofday(&tp,&tzp);
	leaq	-40(%rbp), %rdx	#, tmp89
	leaq	-32(%rbp), %rax	#, tmp90
	movq	%rdx, %rsi	# tmp89,
	movq	%rax, %rdi	# tmp90,
	call	gettimeofday@PLT	#
	movl	%eax, -44(%rbp)	# tmp91, i
# nbody.c:39:   return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
	movq	-32(%rbp), %rax	# tp.tv_sec, _1
# nbody.c:39:   return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
	cvtsi2sdq	%rax, %xmm1	# _1, _2
# nbody.c:39:   return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
	movq	-24(%rbp), %rax	# tp.tv_usec, _3
# nbody.c:39:   return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
	cvtsi2sdq	%rax, %xmm2	# _3, _4
# nbody.c:39:   return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
	movsd	.LC0(%rip), %xmm0	#, tmp92
	mulsd	%xmm2, %xmm0	# _4, _5
# nbody.c:39:   return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
	addsd	%xmm1, %xmm0	# _2, _9
# nbody.c:40: }
	movq	-8(%rbp), %rax	# D.5022, tmp95
	xorq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp95
	je	.L3	#,
	call	__stack_chk_fail@PLT	#
.L3:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	mysecond, .-mysecond
	.comm	forces,8,8
	.comm	positions,8,8
	.comm	velocities,8,8
	.comm	masses,8,8
	.comm	num_bodies,4,4
	.comm	num_steps,4,4
	.globl	delta_t
	.data
	.align 8
	.type	delta_t, @object
	.size	delta_t, 8
delta_t:
	.long	2576980378
	.long	1068079513
	.section	.rodata
	.align 8
.LC1:
	.string	"Time for runnning %d cycles, T = %f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movl	%edi, -36(%rbp)	# argc, argc
	movq	%rsi, -48(%rbp)	# argv, argv
# nbody.c:63:     num_bodies = 2000;
	movl	$2000, num_bodies(%rip)	#, num_bodies
# nbody.c:64:     num_steps = 100;
	movl	$100, num_steps(%rip)	#, num_steps
# nbody.c:68:     initializeBodies();
	movl	$0, %eax	#,
	call	initializeBodies	#
# nbody.c:72:     ts = mysecond();;/* start time */
	movl	$0, %eax	#,
	call	mysecond	#
	movq	%xmm0, %rax	#, tmp87
	movq	%rax, -16(%rbp)	# tmp87, ts
# nbody.c:73:     for (i = 0; i < num_steps; i++) {
	movl	$0, -20(%rbp)	#, i
# nbody.c:73:     for (i = 0; i < num_steps; i++) {
	jmp	.L5	#
.L6:
# nbody.c:74:         calculateForces();
	movl	$0, %eax	#,
	call	calculateForces	#
# nbody.c:76:         calculatePositionAndVelocities();
	movl	$0, %eax	#,
	call	calculatePositionAndVelocities	#
# nbody.c:73:     for (i = 0; i < num_steps; i++) {
	addl	$1, -20(%rbp)	#, i
.L5:
# nbody.c:73:     for (i = 0; i < num_steps; i++) {
	movl	num_steps(%rip), %eax	# num_steps, num_steps.0_1
# nbody.c:73:     for (i = 0; i < num_steps; i++) {
	cmpl	%eax, -20(%rbp)	# num_steps.0_1, i
	jl	.L6	#,
# nbody.c:79:      t = mysecond() - ts;/* end time */
	movl	$0, %eax	#,
	call	mysecond	#
# nbody.c:79:      t = mysecond() - ts;/* end time */
	subsd	-16(%rbp), %xmm0	# ts, tmp88
	movsd	%xmm0, -8(%rbp)	# tmp88, t
# nbody.c:80:      printf("Time for runnning %d cycles, T = %f\n", num_steps, t);
	movl	num_steps(%rip), %eax	# num_steps, num_steps.1_3
	movq	-8(%rbp), %rdx	# t, tmp89
	movq	%rdx, %xmm0	# tmp89,
	movl	%eax, %esi	# num_steps.1_3,
	leaq	.LC1(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# nbody.c:83:     return 0;
	movl	$0, %eax	#, _16
# nbody.c:84: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.globl	calculateForces
	.type	calculateForces, @function
calculateForces:
.LFB8:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
# nbody.c:90:     for (i = 0; i < num_bodies ; i++) {
	movl	$0, -40(%rbp)	#, i
# nbody.c:90:     for (i = 0; i < num_bodies ; i++) {
	jmp	.L9	#
.L13:
# nbody.c:92:         for (j = 0; j < num_bodies ; j++) {
	movl	$0, -36(%rbp)	#, j
# nbody.c:92:         for (j = 0; j < num_bodies ; j++) {
	jmp	.L10	#
.L12:
# nbody.c:93:             if(i!=j ){
	movl	-40(%rbp), %eax	# i, tmp156
	cmpl	-36(%rbp), %eax	# j, tmp156
	je	.L11	#,
# nbody.c:96:             double x_diff = positions[i][X_Coordinate] - positions[j][X_Coordinate]; 
	movq	positions(%rip), %rax	# positions, positions.2_1
	movl	-40(%rbp), %edx	# i, tmp157
	movslq	%edx, %rdx	# tmp157, _2
	salq	$4, %rdx	#, _3
	addq	%rdx, %rax	# _3, _4
# nbody.c:96:             double x_diff = positions[i][X_Coordinate] - positions[j][X_Coordinate]; 
	movsd	(%rax), %xmm0	# *_4, _5
# nbody.c:96:             double x_diff = positions[i][X_Coordinate] - positions[j][X_Coordinate]; 
	movq	positions(%rip), %rax	# positions, positions.3_6
	movl	-36(%rbp), %edx	# j, tmp158
	movslq	%edx, %rdx	# tmp158, _7
	salq	$4, %rdx	#, _8
	addq	%rdx, %rax	# _8, _9
# nbody.c:96:             double x_diff = positions[i][X_Coordinate] - positions[j][X_Coordinate]; 
	movsd	(%rax), %xmm1	# *_9, _10
# nbody.c:96:             double x_diff = positions[i][X_Coordinate] - positions[j][X_Coordinate]; 
	subsd	%xmm1, %xmm0	# _10, tmp159
	movsd	%xmm0, -32(%rbp)	# tmp159, x_diff
# nbody.c:97:             double y_diff = positions[i][Y_Coordinate] - positions[j][Y_Coordinate]; 
	movq	positions(%rip), %rax	# positions, positions.4_11
	movl	-40(%rbp), %edx	# i, tmp160
	movslq	%edx, %rdx	# tmp160, _12
	salq	$4, %rdx	#, _13
	addq	%rdx, %rax	# _13, _14
# nbody.c:97:             double y_diff = positions[i][Y_Coordinate] - positions[j][Y_Coordinate]; 
	movsd	8(%rax), %xmm0	# *_14, _15
# nbody.c:97:             double y_diff = positions[i][Y_Coordinate] - positions[j][Y_Coordinate]; 
	movq	positions(%rip), %rax	# positions, positions.5_16
	movl	-36(%rbp), %edx	# j, tmp161
	movslq	%edx, %rdx	# tmp161, _17
	salq	$4, %rdx	#, _18
	addq	%rdx, %rax	# _18, _19
# nbody.c:97:             double y_diff = positions[i][Y_Coordinate] - positions[j][Y_Coordinate]; 
	movsd	8(%rax), %xmm1	# *_19, _20
# nbody.c:97:             double y_diff = positions[i][Y_Coordinate] - positions[j][Y_Coordinate]; 
	subsd	%xmm1, %xmm0	# _20, tmp162
	movsd	%xmm0, -24(%rbp)	# tmp162, y_diff
# nbody.c:98:             double dist = sqrt(x_diff*x_diff + y_diff*y_diff); 
	movsd	-32(%rbp), %xmm0	# x_diff, tmp163
	movapd	%xmm0, %xmm1	# tmp163, tmp163
	mulsd	%xmm0, %xmm1	# tmp163, tmp163
# nbody.c:98:             double dist = sqrt(x_diff*x_diff + y_diff*y_diff); 
	movsd	-24(%rbp), %xmm0	# y_diff, tmp164
	mulsd	%xmm0, %xmm0	# tmp164, _22
# nbody.c:98:             double dist = sqrt(x_diff*x_diff + y_diff*y_diff); 
	addsd	%xmm1, %xmm0	# _21, _23
	call	sqrt@PLT	#
	movq	%xmm0, %rax	#, tmp165
	movq	%rax, -16(%rbp)	# tmp165, dist
# nbody.c:99:             double dist_cubed = dist*dist*dist; 
	movsd	-16(%rbp), %xmm0	# dist, tmp166
	mulsd	%xmm0, %xmm0	# tmp166, _24
# nbody.c:99:             double dist_cubed = dist*dist*dist; 
	movsd	-16(%rbp), %xmm1	# dist, tmp168
	mulsd	%xmm1, %xmm0	# tmp168, tmp167
	movsd	%xmm0, -8(%rbp)	# tmp167, dist_cubed
# nbody.c:100:             forces[i][X_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * x_diff; 
	movq	forces(%rip), %rax	# forces, forces.6_25
	movl	-40(%rbp), %edx	# i, tmp169
	movslq	%edx, %rdx	# tmp169, _26
	salq	$4, %rdx	#, _27
	addq	%rdx, %rax	# _27, _28
	movsd	(%rax), %xmm0	# *_28, _29
# nbody.c:100:             forces[i][X_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * x_diff; 
	movq	masses(%rip), %rax	# masses, masses.7_30
	movl	-40(%rbp), %edx	# i, tmp170
	movslq	%edx, %rdx	# tmp170, _31
	salq	$3, %rdx	#, _32
	addq	%rdx, %rax	# _32, _33
	movsd	(%rax), %xmm2	# *_33, _34
# nbody.c:100:             forces[i][X_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * x_diff; 
	movsd	.LC2(%rip), %xmm1	#, tmp171
	mulsd	%xmm1, %xmm2	# tmp171, _35
# nbody.c:100:             forces[i][X_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * x_diff; 
	movq	masses(%rip), %rax	# masses, masses.8_36
	movl	-36(%rbp), %edx	# j, tmp172
	movslq	%edx, %rdx	# tmp172, _37
	salq	$3, %rdx	#, _38
	addq	%rdx, %rax	# _38, _39
	movsd	(%rax), %xmm1	# *_39, _40
# nbody.c:100:             forces[i][X_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * x_diff; 
	mulsd	%xmm2, %xmm1	# _35, _41
# nbody.c:100:             forces[i][X_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * x_diff; 
	divsd	-8(%rbp), %xmm1	# dist_cubed, _42
# nbody.c:100:             forces[i][X_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * x_diff; 
	mulsd	-32(%rbp), %xmm1	# x_diff, _43
# nbody.c:100:             forces[i][X_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * x_diff; 
	movq	forces(%rip), %rax	# forces, forces.9_44
	movl	-40(%rbp), %edx	# i, tmp173
	movslq	%edx, %rdx	# tmp173, _45
	salq	$4, %rdx	#, _46
	addq	%rdx, %rax	# _46, _47
	subsd	%xmm1, %xmm0	# _43, _48
	movsd	%xmm0, (%rax)	# _48, *_47
# nbody.c:101:             forces[i][Y_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * y_diff; 
	movq	forces(%rip), %rax	# forces, forces.10_49
	movl	-40(%rbp), %edx	# i, tmp174
	movslq	%edx, %rdx	# tmp174, _50
	salq	$4, %rdx	#, _51
	addq	%rdx, %rax	# _51, _52
	movsd	8(%rax), %xmm0	# *_52, _53
# nbody.c:101:             forces[i][Y_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * y_diff; 
	movq	masses(%rip), %rax	# masses, masses.11_54
	movl	-40(%rbp), %edx	# i, tmp175
	movslq	%edx, %rdx	# tmp175, _55
	salq	$3, %rdx	#, _56
	addq	%rdx, %rax	# _56, _57
	movsd	(%rax), %xmm2	# *_57, _58
# nbody.c:101:             forces[i][Y_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * y_diff; 
	movsd	.LC2(%rip), %xmm1	#, tmp176
	mulsd	%xmm1, %xmm2	# tmp176, _59
# nbody.c:101:             forces[i][Y_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * y_diff; 
	movq	masses(%rip), %rax	# masses, masses.12_60
	movl	-36(%rbp), %edx	# j, tmp177
	movslq	%edx, %rdx	# tmp177, _61
	salq	$3, %rdx	#, _62
	addq	%rdx, %rax	# _62, _63
	movsd	(%rax), %xmm1	# *_63, _64
# nbody.c:101:             forces[i][Y_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * y_diff; 
	mulsd	%xmm2, %xmm1	# _59, _65
# nbody.c:101:             forces[i][Y_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * y_diff; 
	divsd	-8(%rbp), %xmm1	# dist_cubed, _66
# nbody.c:101:             forces[i][Y_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * y_diff; 
	mulsd	-24(%rbp), %xmm1	# y_diff, _67
# nbody.c:101:             forces[i][Y_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * y_diff; 
	movq	forces(%rip), %rax	# forces, forces.13_68
	movl	-40(%rbp), %edx	# i, tmp178
	movslq	%edx, %rdx	# tmp178, _69
	salq	$4, %rdx	#, _70
	addq	%rdx, %rax	# _70, _71
	subsd	%xmm1, %xmm0	# _67, _72
	movsd	%xmm0, 8(%rax)	# _72, *_71
.L11:
# nbody.c:92:         for (j = 0; j < num_bodies ; j++) {
	addl	$1, -36(%rbp)	#, j
.L10:
# nbody.c:92:         for (j = 0; j < num_bodies ; j++) {
	movl	num_bodies(%rip), %eax	# num_bodies, num_bodies.14_73
# nbody.c:92:         for (j = 0; j < num_bodies ; j++) {
	cmpl	%eax, -36(%rbp)	# num_bodies.14_73, j
	jl	.L12	#,
# nbody.c:90:     for (i = 0; i < num_bodies ; i++) {
	addl	$1, -40(%rbp)	#, i
.L9:
# nbody.c:90:     for (i = 0; i < num_bodies ; i++) {
	movl	num_bodies(%rip), %eax	# num_bodies, num_bodies.15_74
# nbody.c:90:     for (i = 0; i < num_bodies ; i++) {
	cmpl	%eax, -40(%rbp)	# num_bodies.15_74, i
	jl	.L13	#,
# nbody.c:108: }
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	calculateForces, .-calculateForces
	.globl	calculateForcesReduced
	.type	calculateForcesReduced, @function
calculateForcesReduced:
.LFB9:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	#,
# nbody.c:113:     for (i = 0; i < num_bodies ; i++) {
	movl	$0, -56(%rbp)	#, i
# nbody.c:113:     for (i = 0; i < num_bodies ; i++) {
	jmp	.L15	#
.L18:
# nbody.c:114:         for (j = i + 1; j < num_bodies; j++) {
	movl	-56(%rbp), %eax	# i, tmp177
	addl	$1, %eax	#, tmp176
	movl	%eax, -52(%rbp)	# tmp176, j
# nbody.c:114:         for (j = i + 1; j < num_bodies; j++) {
	jmp	.L16	#
.L17:
# nbody.c:115:             double x_diff = positions[i][X_Coordinate] - positions[j][X_Coordinate]; 
	movq	positions(%rip), %rax	# positions, positions.16_1
	movl	-56(%rbp), %edx	# i, tmp178
	movslq	%edx, %rdx	# tmp178, _2
	salq	$4, %rdx	#, _3
	addq	%rdx, %rax	# _3, _4
# nbody.c:115:             double x_diff = positions[i][X_Coordinate] - positions[j][X_Coordinate]; 
	movsd	(%rax), %xmm0	# *_4, _5
# nbody.c:115:             double x_diff = positions[i][X_Coordinate] - positions[j][X_Coordinate]; 
	movq	positions(%rip), %rax	# positions, positions.17_6
	movl	-52(%rbp), %edx	# j, tmp179
	movslq	%edx, %rdx	# tmp179, _7
	salq	$4, %rdx	#, _8
	addq	%rdx, %rax	# _8, _9
# nbody.c:115:             double x_diff = positions[i][X_Coordinate] - positions[j][X_Coordinate]; 
	movsd	(%rax), %xmm1	# *_9, _10
# nbody.c:115:             double x_diff = positions[i][X_Coordinate] - positions[j][X_Coordinate]; 
	subsd	%xmm1, %xmm0	# _10, tmp180
	movsd	%xmm0, -48(%rbp)	# tmp180, x_diff
# nbody.c:116:             double y_diff = positions[i][Y_Coordinate] - positions[j][Y_Coordinate]; 
	movq	positions(%rip), %rax	# positions, positions.18_11
	movl	-56(%rbp), %edx	# i, tmp181
	movslq	%edx, %rdx	# tmp181, _12
	salq	$4, %rdx	#, _13
	addq	%rdx, %rax	# _13, _14
# nbody.c:116:             double y_diff = positions[i][Y_Coordinate] - positions[j][Y_Coordinate]; 
	movsd	8(%rax), %xmm0	# *_14, _15
# nbody.c:116:             double y_diff = positions[i][Y_Coordinate] - positions[j][Y_Coordinate]; 
	movq	positions(%rip), %rax	# positions, positions.19_16
	movl	-52(%rbp), %edx	# j, tmp182
	movslq	%edx, %rdx	# tmp182, _17
	salq	$4, %rdx	#, _18
	addq	%rdx, %rax	# _18, _19
# nbody.c:116:             double y_diff = positions[i][Y_Coordinate] - positions[j][Y_Coordinate]; 
	movsd	8(%rax), %xmm1	# *_19, _20
# nbody.c:116:             double y_diff = positions[i][Y_Coordinate] - positions[j][Y_Coordinate]; 
	subsd	%xmm1, %xmm0	# _20, tmp183
	movsd	%xmm0, -40(%rbp)	# tmp183, y_diff
# nbody.c:117:             double dist = sqrt(x_diff*x_diff + y_diff*y_diff); 
	movsd	-48(%rbp), %xmm0	# x_diff, tmp184
	movapd	%xmm0, %xmm1	# tmp184, tmp184
	mulsd	%xmm0, %xmm1	# tmp184, tmp184
# nbody.c:117:             double dist = sqrt(x_diff*x_diff + y_diff*y_diff); 
	movsd	-40(%rbp), %xmm0	# y_diff, tmp185
	mulsd	%xmm0, %xmm0	# tmp185, _22
# nbody.c:117:             double dist = sqrt(x_diff*x_diff + y_diff*y_diff); 
	addsd	%xmm1, %xmm0	# _21, _23
	call	sqrt@PLT	#
	movq	%xmm0, %rax	#, tmp186
	movq	%rax, -32(%rbp)	# tmp186, dist
# nbody.c:118:             double dist_cubed = dist*dist*dist; 
	movsd	-32(%rbp), %xmm0	# dist, tmp187
	mulsd	%xmm0, %xmm0	# tmp187, _24
# nbody.c:118:             double dist_cubed = dist*dist*dist; 
	movsd	-32(%rbp), %xmm1	# dist, tmp189
	mulsd	%xmm1, %xmm0	# tmp189, tmp188
	movsd	%xmm0, -24(%rbp)	# tmp188, dist_cubed
# nbody.c:120:             double force_ij_X_Coordinate = G*masses[i]*masses[j]/dist_cubed * x_diff; 
	movq	masses(%rip), %rax	# masses, masses.20_25
	movl	-56(%rbp), %edx	# i, tmp190
	movslq	%edx, %rdx	# tmp190, _26
	salq	$3, %rdx	#, _27
	addq	%rdx, %rax	# _27, _28
	movsd	(%rax), %xmm1	# *_28, _29
# nbody.c:120:             double force_ij_X_Coordinate = G*masses[i]*masses[j]/dist_cubed * x_diff; 
	movsd	.LC2(%rip), %xmm0	#, tmp191
	mulsd	%xmm0, %xmm1	# tmp191, _30
# nbody.c:120:             double force_ij_X_Coordinate = G*masses[i]*masses[j]/dist_cubed * x_diff; 
	movq	masses(%rip), %rax	# masses, masses.21_31
	movl	-52(%rbp), %edx	# j, tmp192
	movslq	%edx, %rdx	# tmp192, _32
	salq	$3, %rdx	#, _33
	addq	%rdx, %rax	# _33, _34
	movsd	(%rax), %xmm0	# *_34, _35
# nbody.c:120:             double force_ij_X_Coordinate = G*masses[i]*masses[j]/dist_cubed * x_diff; 
	mulsd	%xmm1, %xmm0	# _30, _36
# nbody.c:120:             double force_ij_X_Coordinate = G*masses[i]*masses[j]/dist_cubed * x_diff; 
	divsd	-24(%rbp), %xmm0	# dist_cubed, _37
# nbody.c:120:             double force_ij_X_Coordinate = G*masses[i]*masses[j]/dist_cubed * x_diff; 
	movsd	-48(%rbp), %xmm1	# x_diff, tmp194
	mulsd	%xmm1, %xmm0	# tmp194, tmp193
	movsd	%xmm0, -16(%rbp)	# tmp193, force_ij_X_Coordinate
# nbody.c:121:             double force_ij_Y_Coordinate = G*masses[i]*masses[j]/dist_cubed * y_diff;
	movq	masses(%rip), %rax	# masses, masses.22_38
	movl	-56(%rbp), %edx	# i, tmp195
	movslq	%edx, %rdx	# tmp195, _39
	salq	$3, %rdx	#, _40
	addq	%rdx, %rax	# _40, _41
	movsd	(%rax), %xmm1	# *_41, _42
# nbody.c:121:             double force_ij_Y_Coordinate = G*masses[i]*masses[j]/dist_cubed * y_diff;
	movsd	.LC2(%rip), %xmm0	#, tmp196
	mulsd	%xmm0, %xmm1	# tmp196, _43
# nbody.c:121:             double force_ij_Y_Coordinate = G*masses[i]*masses[j]/dist_cubed * y_diff;
	movq	masses(%rip), %rax	# masses, masses.23_44
	movl	-52(%rbp), %edx	# j, tmp197
	movslq	%edx, %rdx	# tmp197, _45
	salq	$3, %rdx	#, _46
	addq	%rdx, %rax	# _46, _47
	movsd	(%rax), %xmm0	# *_47, _48
# nbody.c:121:             double force_ij_Y_Coordinate = G*masses[i]*masses[j]/dist_cubed * y_diff;
	mulsd	%xmm1, %xmm0	# _43, _49
# nbody.c:121:             double force_ij_Y_Coordinate = G*masses[i]*masses[j]/dist_cubed * y_diff;
	divsd	-24(%rbp), %xmm0	# dist_cubed, _50
# nbody.c:121:             double force_ij_Y_Coordinate = G*masses[i]*masses[j]/dist_cubed * y_diff;
	movsd	-40(%rbp), %xmm1	# y_diff, tmp199
	mulsd	%xmm1, %xmm0	# tmp199, tmp198
	movsd	%xmm0, -8(%rbp)	# tmp198, force_ij_Y_Coordinate
# nbody.c:122:             forces[i][X_Coordinate] += force_ij_X_Coordinate; 
	movq	forces(%rip), %rax	# forces, forces.24_51
	movl	-56(%rbp), %edx	# i, tmp200
	movslq	%edx, %rdx	# tmp200, _52
	salq	$4, %rdx	#, _53
	addq	%rdx, %rax	# _53, _54
	movsd	(%rax), %xmm0	# *_54, _55
	movq	forces(%rip), %rax	# forces, forces.25_56
	movl	-56(%rbp), %edx	# i, tmp201
	movslq	%edx, %rdx	# tmp201, _57
	salq	$4, %rdx	#, _58
	addq	%rdx, %rax	# _58, _59
	addsd	-16(%rbp), %xmm0	# force_ij_X_Coordinate, _60
	movsd	%xmm0, (%rax)	# _60, *_59
# nbody.c:123:             forces[i][Y_Coordinate] += force_ij_Y_Coordinate;
	movq	forces(%rip), %rax	# forces, forces.26_61
	movl	-56(%rbp), %edx	# i, tmp202
	movslq	%edx, %rdx	# tmp202, _62
	salq	$4, %rdx	#, _63
	addq	%rdx, %rax	# _63, _64
	movsd	8(%rax), %xmm0	# *_64, _65
	movq	forces(%rip), %rax	# forces, forces.27_66
	movl	-56(%rbp), %edx	# i, tmp203
	movslq	%edx, %rdx	# tmp203, _67
	salq	$4, %rdx	#, _68
	addq	%rdx, %rax	# _68, _69
	addsd	-8(%rbp), %xmm0	# force_ij_Y_Coordinate, _70
	movsd	%xmm0, 8(%rax)	# _70, *_69
# nbody.c:124:             forces[j][X_Coordinate] -= force_ij_X_Coordinate; 
	movq	forces(%rip), %rax	# forces, forces.28_71
	movl	-52(%rbp), %edx	# j, tmp204
	movslq	%edx, %rdx	# tmp204, _72
	salq	$4, %rdx	#, _73
	addq	%rdx, %rax	# _73, _74
	movsd	(%rax), %xmm0	# *_74, _75
	movq	forces(%rip), %rax	# forces, forces.29_76
	movl	-52(%rbp), %edx	# j, tmp205
	movslq	%edx, %rdx	# tmp205, _77
	salq	$4, %rdx	#, _78
	addq	%rdx, %rax	# _78, _79
	subsd	-16(%rbp), %xmm0	# force_ij_X_Coordinate, _80
	movsd	%xmm0, (%rax)	# _80, *_79
# nbody.c:125:             forces[j][Y_Coordinate] -= force_ij_Y_Coordinate;
	movq	forces(%rip), %rax	# forces, forces.30_81
	movl	-52(%rbp), %edx	# j, tmp206
	movslq	%edx, %rdx	# tmp206, _82
	salq	$4, %rdx	#, _83
	addq	%rdx, %rax	# _83, _84
	movsd	8(%rax), %xmm0	# *_84, _85
	movq	forces(%rip), %rax	# forces, forces.31_86
	movl	-52(%rbp), %edx	# j, tmp207
	movslq	%edx, %rdx	# tmp207, _87
	salq	$4, %rdx	#, _88
	addq	%rdx, %rax	# _88, _89
	subsd	-8(%rbp), %xmm0	# force_ij_Y_Coordinate, _90
	movsd	%xmm0, 8(%rax)	# _90, *_89
# nbody.c:114:         for (j = i + 1; j < num_bodies; j++) {
	addl	$1, -52(%rbp)	#, j
.L16:
# nbody.c:114:         for (j = i + 1; j < num_bodies; j++) {
	movl	num_bodies(%rip), %eax	# num_bodies, num_bodies.32_91
# nbody.c:114:         for (j = i + 1; j < num_bodies; j++) {
	cmpl	%eax, -52(%rbp)	# num_bodies.32_91, j
	jl	.L17	#,
# nbody.c:113:     for (i = 0; i < num_bodies ; i++) {
	addl	$1, -56(%rbp)	#, i
.L15:
# nbody.c:113:     for (i = 0; i < num_bodies ; i++) {
	movl	num_bodies(%rip), %eax	# num_bodies, num_bodies.33_92
# nbody.c:113:     for (i = 0; i < num_bodies ; i++) {
	cmpl	%eax, -56(%rbp)	# num_bodies.33_92, i
	jl	.L18	#,
# nbody.c:132: }
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
	.size	calculateForcesReduced, .-calculateForcesReduced
	.globl	calculatePositionAndVelocities
	.type	calculatePositionAndVelocities, @function
calculatePositionAndVelocities:
.LFB10:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
# nbody.c:140: for(j=0; j<num_bodies;j++){
	movl	$0, -4(%rbp)	#, j
# nbody.c:140: for(j=0; j<num_bodies;j++){
	jmp	.L20	#
.L21:
# nbody.c:141:         positions[j][X_Coordinate] += delta_t * velocities[j][X_Coordinate]; 
	movq	positions(%rip), %rax	# positions, positions.34_1
	movl	-4(%rbp), %edx	# j, tmp163
	movslq	%edx, %rdx	# tmp163, _2
	salq	$4, %rdx	#, _3
	addq	%rdx, %rax	# _3, _4
	movsd	(%rax), %xmm1	# *_4, _5
# nbody.c:141:         positions[j][X_Coordinate] += delta_t * velocities[j][X_Coordinate]; 
	movq	velocities(%rip), %rax	# velocities, velocities.35_6
	movl	-4(%rbp), %edx	# j, tmp164
	movslq	%edx, %rdx	# tmp164, _7
	salq	$4, %rdx	#, _8
	addq	%rdx, %rax	# _8, _9
# nbody.c:141:         positions[j][X_Coordinate] += delta_t * velocities[j][X_Coordinate]; 
	movsd	(%rax), %xmm2	# *_9, _10
# nbody.c:141:         positions[j][X_Coordinate] += delta_t * velocities[j][X_Coordinate]; 
	movsd	delta_t(%rip), %xmm0	# delta_t, delta_t.36_11
	mulsd	%xmm2, %xmm0	# _10, _12
# nbody.c:141:         positions[j][X_Coordinate] += delta_t * velocities[j][X_Coordinate]; 
	movq	positions(%rip), %rax	# positions, positions.37_13
	movl	-4(%rbp), %edx	# j, tmp165
	movslq	%edx, %rdx	# tmp165, _14
	salq	$4, %rdx	#, _15
	addq	%rdx, %rax	# _15, _16
	addsd	%xmm1, %xmm0	# _5, _17
	movsd	%xmm0, (%rax)	# _17, *_16
# nbody.c:142:         positions[j][Y_Coordinate] += delta_t * velocities[j][Y_Coordinate]; 
	movq	positions(%rip), %rax	# positions, positions.38_18
	movl	-4(%rbp), %edx	# j, tmp166
	movslq	%edx, %rdx	# tmp166, _19
	salq	$4, %rdx	#, _20
	addq	%rdx, %rax	# _20, _21
	movsd	8(%rax), %xmm1	# *_21, _22
# nbody.c:142:         positions[j][Y_Coordinate] += delta_t * velocities[j][Y_Coordinate]; 
	movq	velocities(%rip), %rax	# velocities, velocities.39_23
	movl	-4(%rbp), %edx	# j, tmp167
	movslq	%edx, %rdx	# tmp167, _24
	salq	$4, %rdx	#, _25
	addq	%rdx, %rax	# _25, _26
# nbody.c:142:         positions[j][Y_Coordinate] += delta_t * velocities[j][Y_Coordinate]; 
	movsd	8(%rax), %xmm2	# *_26, _27
# nbody.c:142:         positions[j][Y_Coordinate] += delta_t * velocities[j][Y_Coordinate]; 
	movsd	delta_t(%rip), %xmm0	# delta_t, delta_t.40_28
	mulsd	%xmm2, %xmm0	# _27, _29
# nbody.c:142:         positions[j][Y_Coordinate] += delta_t * velocities[j][Y_Coordinate]; 
	movq	positions(%rip), %rax	# positions, positions.41_30
	movl	-4(%rbp), %edx	# j, tmp168
	movslq	%edx, %rdx	# tmp168, _31
	salq	$4, %rdx	#, _32
	addq	%rdx, %rax	# _32, _33
	addsd	%xmm1, %xmm0	# _22, _34
	movsd	%xmm0, 8(%rax)	# _34, *_33
# nbody.c:143:         velocities[j][X_Coordinate] += delta_t/masses[j]*forces[j][X_Coordinate]; 
	movq	velocities(%rip), %rax	# velocities, velocities.42_35
	movl	-4(%rbp), %edx	# j, tmp169
	movslq	%edx, %rdx	# tmp169, _36
	salq	$4, %rdx	#, _37
	addq	%rdx, %rax	# _37, _38
	movsd	(%rax), %xmm1	# *_38, _39
# nbody.c:143:         velocities[j][X_Coordinate] += delta_t/masses[j]*forces[j][X_Coordinate]; 
	movsd	delta_t(%rip), %xmm0	# delta_t, delta_t.43_40
# nbody.c:143:         velocities[j][X_Coordinate] += delta_t/masses[j]*forces[j][X_Coordinate]; 
	movq	masses(%rip), %rax	# masses, masses.44_41
	movl	-4(%rbp), %edx	# j, tmp170
	movslq	%edx, %rdx	# tmp170, _42
	salq	$3, %rdx	#, _43
	addq	%rdx, %rax	# _43, _44
	movsd	(%rax), %xmm2	# *_44, _45
# nbody.c:143:         velocities[j][X_Coordinate] += delta_t/masses[j]*forces[j][X_Coordinate]; 
	divsd	%xmm2, %xmm0	# _45, delta_t.43_40
	movapd	%xmm0, %xmm2	# delta_t.43_40, _46
# nbody.c:143:         velocities[j][X_Coordinate] += delta_t/masses[j]*forces[j][X_Coordinate]; 
	movq	forces(%rip), %rax	# forces, forces.45_47
	movl	-4(%rbp), %edx	# j, tmp171
	movslq	%edx, %rdx	# tmp171, _48
	salq	$4, %rdx	#, _49
	addq	%rdx, %rax	# _49, _50
# nbody.c:143:         velocities[j][X_Coordinate] += delta_t/masses[j]*forces[j][X_Coordinate]; 
	movsd	(%rax), %xmm0	# *_50, _51
# nbody.c:143:         velocities[j][X_Coordinate] += delta_t/masses[j]*forces[j][X_Coordinate]; 
	mulsd	%xmm2, %xmm0	# _46, _52
# nbody.c:143:         velocities[j][X_Coordinate] += delta_t/masses[j]*forces[j][X_Coordinate]; 
	movq	velocities(%rip), %rax	# velocities, velocities.46_53
	movl	-4(%rbp), %edx	# j, tmp172
	movslq	%edx, %rdx	# tmp172, _54
	salq	$4, %rdx	#, _55
	addq	%rdx, %rax	# _55, _56
	addsd	%xmm1, %xmm0	# _39, _57
	movsd	%xmm0, (%rax)	# _57, *_56
# nbody.c:144:         velocities[j][Y_Coordinate] += delta_t/masses[j]*forces[j][Y_Coordinate];
	movq	velocities(%rip), %rax	# velocities, velocities.47_58
	movl	-4(%rbp), %edx	# j, tmp173
	movslq	%edx, %rdx	# tmp173, _59
	salq	$4, %rdx	#, _60
	addq	%rdx, %rax	# _60, _61
	movsd	8(%rax), %xmm1	# *_61, _62
# nbody.c:144:         velocities[j][Y_Coordinate] += delta_t/masses[j]*forces[j][Y_Coordinate];
	movsd	delta_t(%rip), %xmm0	# delta_t, delta_t.48_63
# nbody.c:144:         velocities[j][Y_Coordinate] += delta_t/masses[j]*forces[j][Y_Coordinate];
	movq	masses(%rip), %rax	# masses, masses.49_64
	movl	-4(%rbp), %edx	# j, tmp174
	movslq	%edx, %rdx	# tmp174, _65
	salq	$3, %rdx	#, _66
	addq	%rdx, %rax	# _66, _67
	movsd	(%rax), %xmm2	# *_67, _68
# nbody.c:144:         velocities[j][Y_Coordinate] += delta_t/masses[j]*forces[j][Y_Coordinate];
	divsd	%xmm2, %xmm0	# _68, delta_t.48_63
	movapd	%xmm0, %xmm2	# delta_t.48_63, _69
# nbody.c:144:         velocities[j][Y_Coordinate] += delta_t/masses[j]*forces[j][Y_Coordinate];
	movq	forces(%rip), %rax	# forces, forces.50_70
	movl	-4(%rbp), %edx	# j, tmp175
	movslq	%edx, %rdx	# tmp175, _71
	salq	$4, %rdx	#, _72
	addq	%rdx, %rax	# _72, _73
# nbody.c:144:         velocities[j][Y_Coordinate] += delta_t/masses[j]*forces[j][Y_Coordinate];
	movsd	8(%rax), %xmm0	# *_73, _74
# nbody.c:144:         velocities[j][Y_Coordinate] += delta_t/masses[j]*forces[j][Y_Coordinate];
	mulsd	%xmm2, %xmm0	# _69, _75
# nbody.c:144:         velocities[j][Y_Coordinate] += delta_t/masses[j]*forces[j][Y_Coordinate];
	movq	velocities(%rip), %rax	# velocities, velocities.51_76
	movl	-4(%rbp), %edx	# j, tmp176
	movslq	%edx, %rdx	# tmp176, _77
	salq	$4, %rdx	#, _78
	addq	%rdx, %rax	# _78, _79
	addsd	%xmm1, %xmm0	# _62, _80
	movsd	%xmm0, 8(%rax)	# _80, *_79
# nbody.c:140: for(j=0; j<num_bodies;j++){
	addl	$1, -4(%rbp)	#, j
.L20:
# nbody.c:140: for(j=0; j<num_bodies;j++){
	movl	num_bodies(%rip), %eax	# num_bodies, num_bodies.52_81
# nbody.c:140: for(j=0; j<num_bodies;j++){
	cmpl	%eax, -4(%rbp)	# num_bodies.52_81, j
	jl	.L21	#,
# nbody.c:147: }
	nop	
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE10:
	.size	calculatePositionAndVelocities, .-calculatePositionAndVelocities
	.globl	initializeBodies
	.type	initializeBodies, @function
initializeBodies:
.LFB11:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
# nbody.c:152:     positions = malloc(sizeof(vect_t) * num_bodies);
	movl	num_bodies(%rip), %eax	# num_bodies, num_bodies.53_1
	cltq
	salq	$4, %rax	#, _3
	movq	%rax, %rdi	# _3,
	call	malloc@PLT	#
# nbody.c:152:     positions = malloc(sizeof(vect_t) * num_bodies);
	movq	%rax, positions(%rip)	# _4, positions
# nbody.c:153:     velocities = malloc(sizeof(vect_t) * num_bodies);
	movl	num_bodies(%rip), %eax	# num_bodies, num_bodies.54_5
	cltq
	salq	$4, %rax	#, _7
	movq	%rax, %rdi	# _7,
	call	malloc@PLT	#
# nbody.c:153:     velocities = malloc(sizeof(vect_t) * num_bodies);
	movq	%rax, velocities(%rip)	# _8, velocities
# nbody.c:154:     forces = malloc(sizeof(vect_t) * num_bodies);
	movl	num_bodies(%rip), %eax	# num_bodies, num_bodies.55_9
	cltq
	salq	$4, %rax	#, _11
	movq	%rax, %rdi	# _11,
	call	malloc@PLT	#
# nbody.c:154:     forces = malloc(sizeof(vect_t) * num_bodies);
	movq	%rax, forces(%rip)	# _12, forces
# nbody.c:155:     masses = malloc(sizeof(double) * num_bodies);
	movl	num_bodies(%rip), %eax	# num_bodies, num_bodies.56_13
	cltq
	salq	$3, %rax	#, _15
	movq	%rax, %rdi	# _15,
	call	malloc@PLT	#
# nbody.c:155:     masses = malloc(sizeof(double) * num_bodies);
	movq	%rax, masses(%rip)	# _16, masses
# nbody.c:160:     for (i = 0; i < num_bodies; i++) {
	movl	$0, -4(%rbp)	#, i
# nbody.c:160:     for (i = 0; i < num_bodies; i++) {
	jmp	.L23	#
.L24:
# nbody.c:161:         positions[i][X_Coordinate]=(rand() / (double)(RAND_MAX)) * 2 - 1;
	call	rand@PLT	#
# nbody.c:161:         positions[i][X_Coordinate]=(rand() / (double)(RAND_MAX)) * 2 - 1;
	cvtsi2sdl	%eax, %xmm0	# _17, _18
	movsd	.LC3(%rip), %xmm1	#, tmp157
	divsd	%xmm1, %xmm0	# tmp157, _19
# nbody.c:161:         positions[i][X_Coordinate]=(rand() / (double)(RAND_MAX)) * 2 - 1;
	addsd	%xmm0, %xmm0	# _19, _20
# nbody.c:161:         positions[i][X_Coordinate]=(rand() / (double)(RAND_MAX)) * 2 - 1;
	movq	positions(%rip), %rax	# positions, positions.57_21
	movl	-4(%rbp), %edx	# i, tmp158
	movslq	%edx, %rdx	# tmp158, _22
	salq	$4, %rdx	#, _23
	addq	%rdx, %rax	# _23, _24
# nbody.c:161:         positions[i][X_Coordinate]=(rand() / (double)(RAND_MAX)) * 2 - 1;
	movsd	.LC4(%rip), %xmm1	#, tmp159
	subsd	%xmm1, %xmm0	# tmp159, _25
# nbody.c:161:         positions[i][X_Coordinate]=(rand() / (double)(RAND_MAX)) * 2 - 1;
	movsd	%xmm0, (%rax)	# _25, *_24
# nbody.c:162:         positions[i][Y_Coordinate] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	call	rand@PLT	#
# nbody.c:162:         positions[i][Y_Coordinate] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	cvtsi2sdl	%eax, %xmm0	# _26, _27
	movsd	.LC3(%rip), %xmm1	#, tmp160
	divsd	%xmm1, %xmm0	# tmp160, _28
# nbody.c:162:         positions[i][Y_Coordinate] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	addsd	%xmm0, %xmm0	# _28, _29
# nbody.c:162:         positions[i][Y_Coordinate] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	movq	positions(%rip), %rax	# positions, positions.58_30
	movl	-4(%rbp), %edx	# i, tmp161
	movslq	%edx, %rdx	# tmp161, _31
	salq	$4, %rdx	#, _32
	addq	%rdx, %rax	# _32, _33
# nbody.c:162:         positions[i][Y_Coordinate] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	movsd	.LC4(%rip), %xmm1	#, tmp162
	subsd	%xmm1, %xmm0	# tmp162, _34
# nbody.c:162:         positions[i][Y_Coordinate] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	movsd	%xmm0, 8(%rax)	# _34, *_33
# nbody.c:164:         forces[i][X_Coordinate] = 0;
	movq	forces(%rip), %rax	# forces, forces.59_35
	movl	-4(%rbp), %edx	# i, tmp163
	movslq	%edx, %rdx	# tmp163, _36
	salq	$4, %rdx	#, _37
	addq	%rdx, %rax	# _37, _38
# nbody.c:164:         forces[i][X_Coordinate] = 0;
	pxor	%xmm0, %xmm0	# tmp164
	movsd	%xmm0, (%rax)	# tmp164, *_38
# nbody.c:165:         forces[i][Y_Coordinate] = 0;
	movq	forces(%rip), %rax	# forces, forces.60_39
	movl	-4(%rbp), %edx	# i, tmp165
	movslq	%edx, %rdx	# tmp165, _40
	salq	$4, %rdx	#, _41
	addq	%rdx, %rax	# _41, _42
# nbody.c:165:         forces[i][Y_Coordinate] = 0;
	pxor	%xmm0, %xmm0	# tmp166
	movsd	%xmm0, 8(%rax)	# tmp166, *_42
# nbody.c:167:         velocities[i][X_Coordinate]=(rand() / (double)(RAND_MAX)) * 2 - 1;
	call	rand@PLT	#
# nbody.c:167:         velocities[i][X_Coordinate]=(rand() / (double)(RAND_MAX)) * 2 - 1;
	cvtsi2sdl	%eax, %xmm0	# _43, _44
	movsd	.LC3(%rip), %xmm1	#, tmp167
	divsd	%xmm1, %xmm0	# tmp167, _45
# nbody.c:167:         velocities[i][X_Coordinate]=(rand() / (double)(RAND_MAX)) * 2 - 1;
	addsd	%xmm0, %xmm0	# _45, _46
# nbody.c:167:         velocities[i][X_Coordinate]=(rand() / (double)(RAND_MAX)) * 2 - 1;
	movq	velocities(%rip), %rax	# velocities, velocities.61_47
	movl	-4(%rbp), %edx	# i, tmp168
	movslq	%edx, %rdx	# tmp168, _48
	salq	$4, %rdx	#, _49
	addq	%rdx, %rax	# _49, _50
# nbody.c:167:         velocities[i][X_Coordinate]=(rand() / (double)(RAND_MAX)) * 2 - 1;
	movsd	.LC4(%rip), %xmm1	#, tmp169
	subsd	%xmm1, %xmm0	# tmp169, _51
# nbody.c:167:         velocities[i][X_Coordinate]=(rand() / (double)(RAND_MAX)) * 2 - 1;
	movsd	%xmm0, (%rax)	# _51, *_50
# nbody.c:168:         velocities[i][Y_Coordinate] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	call	rand@PLT	#
# nbody.c:168:         velocities[i][Y_Coordinate] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	cvtsi2sdl	%eax, %xmm0	# _52, _53
	movsd	.LC3(%rip), %xmm1	#, tmp170
	divsd	%xmm1, %xmm0	# tmp170, _54
# nbody.c:168:         velocities[i][Y_Coordinate] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	addsd	%xmm0, %xmm0	# _54, _55
# nbody.c:168:         velocities[i][Y_Coordinate] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	movq	velocities(%rip), %rax	# velocities, velocities.62_56
	movl	-4(%rbp), %edx	# i, tmp171
	movslq	%edx, %rdx	# tmp171, _57
	salq	$4, %rdx	#, _58
	addq	%rdx, %rax	# _58, _59
# nbody.c:168:         velocities[i][Y_Coordinate] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	movsd	.LC4(%rip), %xmm1	#, tmp172
	subsd	%xmm1, %xmm0	# tmp172, _60
# nbody.c:168:         velocities[i][Y_Coordinate] = (rand() / (double)(RAND_MAX)) * 2 - 1;
	movsd	%xmm0, 8(%rax)	# _60, *_59
# nbody.c:169:         masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);        
	call	rand@PLT	#
# nbody.c:169:         masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);        
	cvtsi2sdl	%eax, %xmm0	# _61, _62
	movsd	.LC3(%rip), %xmm1	#, tmp173
	divsd	%xmm1, %xmm0	# tmp173, _63
# nbody.c:169:         masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);        
	addsd	%xmm0, %xmm0	# _63, _64
# nbody.c:169:         masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);        
	movsd	.LC4(%rip), %xmm1	#, tmp174
	subsd	%xmm1, %xmm0	# tmp174, _65
# nbody.c:169:         masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);        
	movq	masses(%rip), %rax	# masses, masses.63_66
	movl	-4(%rbp), %edx	# i, tmp175
	movslq	%edx, %rdx	# tmp175, _67
	salq	$3, %rdx	#, _68
	addq	%rdx, %rax	# _68, _69
# nbody.c:169:         masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);        
	movq	.LC6(%rip), %xmm1	#, tmp176
	andpd	%xmm1, %xmm0	# tmp176, _70
# nbody.c:169:         masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);        
	movsd	%xmm0, (%rax)	# _70, *_69
# nbody.c:160:     for (i = 0; i < num_bodies; i++) {
	addl	$1, -4(%rbp)	#, i
.L23:
# nbody.c:160:     for (i = 0; i < num_bodies; i++) {
	movl	num_bodies(%rip), %eax	# num_bodies, num_bodies.64_71
# nbody.c:160:     for (i = 0; i < num_bodies; i++) {
	cmpl	%eax, -4(%rbp)	# num_bodies.64_71, i
	jl	.L24	#,
# nbody.c:171: }
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE11:
	.size	initializeBodies, .-initializeBodies
	.section	.rodata
.LC7:
	.string	"Y Velocity of body %d is %g \n"
.LC8:
	.string	"X Velocity of body %d is %g \n"
.LC9:
	.string	"Y Position of body %d is %g \n"
.LC10:
	.string	"X Position of body %d is %g \n"
	.text
	.globl	printVelocitiesAndPositions
	.type	printVelocitiesAndPositions, @function
printVelocitiesAndPositions:
.LFB12:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
# nbody.c:176:         for (i = 0; i < num_bodies; i++) {
	movl	$0, -4(%rbp)	#, i
# nbody.c:176:         for (i = 0; i < num_bodies; i++) {
	jmp	.L26	#
.L27:
# nbody.c:177:         printf("Y Velocity of body %d is %g \n", i, velocities[i][Y_Coordinate]);
	movq	velocities(%rip), %rax	# velocities, velocities.65_1
	movl	-4(%rbp), %edx	# i, tmp104
	movslq	%edx, %rdx	# tmp104, _2
	salq	$4, %rdx	#, _3
	addq	%rdx, %rax	# _3, _4
# nbody.c:177:         printf("Y Velocity of body %d is %g \n", i, velocities[i][Y_Coordinate]);
	movq	8(%rax), %rdx	# *_4, _5
	movl	-4(%rbp), %eax	# i, tmp105
	movq	%rdx, %xmm0	# _5,
	movl	%eax, %esi	# tmp105,
	leaq	.LC7(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# nbody.c:178:         printf("X Velocity of body %d is %g \n", i, velocities[i][X_Coordinate]);
	movq	velocities(%rip), %rax	# velocities, velocities.66_6
	movl	-4(%rbp), %edx	# i, tmp106
	movslq	%edx, %rdx	# tmp106, _7
	salq	$4, %rdx	#, _8
	addq	%rdx, %rax	# _8, _9
# nbody.c:178:         printf("X Velocity of body %d is %g \n", i, velocities[i][X_Coordinate]);
	movq	(%rax), %rdx	# *_9, _10
	movl	-4(%rbp), %eax	# i, tmp107
	movq	%rdx, %xmm0	# _10,
	movl	%eax, %esi	# tmp107,
	leaq	.LC8(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# nbody.c:176:         for (i = 0; i < num_bodies; i++) {
	addl	$1, -4(%rbp)	#, i
.L26:
# nbody.c:176:         for (i = 0; i < num_bodies; i++) {
	movl	num_bodies(%rip), %eax	# num_bodies, num_bodies.67_11
# nbody.c:176:         for (i = 0; i < num_bodies; i++) {
	cmpl	%eax, -4(%rbp)	# num_bodies.67_11, i
	jl	.L27	#,
# nbody.c:181:     for (i = 0; i < num_bodies; i++) {
	movl	$0, -4(%rbp)	#, i
# nbody.c:181:     for (i = 0; i < num_bodies; i++) {
	jmp	.L28	#
.L29:
# nbody.c:182:         printf("Y Position of body %d is %g \n", i, positions[i][Y_Coordinate]);
	movq	positions(%rip), %rax	# positions, positions.68_12
	movl	-4(%rbp), %edx	# i, tmp108
	movslq	%edx, %rdx	# tmp108, _13
	salq	$4, %rdx	#, _14
	addq	%rdx, %rax	# _14, _15
# nbody.c:182:         printf("Y Position of body %d is %g \n", i, positions[i][Y_Coordinate]);
	movq	8(%rax), %rdx	# *_15, _16
	movl	-4(%rbp), %eax	# i, tmp109
	movq	%rdx, %xmm0	# _16,
	movl	%eax, %esi	# tmp109,
	leaq	.LC9(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# nbody.c:183:         printf("X Position of body %d is %g \n", i, positions[i][X_Coordinate]);
	movq	positions(%rip), %rax	# positions, positions.69_17
	movl	-4(%rbp), %edx	# i, tmp110
	movslq	%edx, %rdx	# tmp110, _18
	salq	$4, %rdx	#, _19
	addq	%rdx, %rax	# _19, _20
# nbody.c:183:         printf("X Position of body %d is %g \n", i, positions[i][X_Coordinate]);
	movq	(%rax), %rdx	# *_20, _21
	movl	-4(%rbp), %eax	# i, tmp111
	movq	%rdx, %xmm0	# _21,
	movl	%eax, %esi	# tmp111,
	leaq	.LC10(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# nbody.c:181:     for (i = 0; i < num_bodies; i++) {
	addl	$1, -4(%rbp)	#, i
.L28:
# nbody.c:181:     for (i = 0; i < num_bodies; i++) {
	movl	num_bodies(%rip), %eax	# num_bodies, num_bodies.70_22
# nbody.c:181:     for (i = 0; i < num_bodies; i++) {
	cmpl	%eax, -4(%rbp)	# num_bodies.70_22, i
	jl	.L29	#,
# nbody.c:187: }
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE12:
	.size	printVelocitiesAndPositions, .-printVelocitiesAndPositions
	.section	.rodata
	.align 8
.LC0:
	.long	2696277389
	.long	1051772663
	.align 8
.LC2:
	.long	3475326677
	.long	1047652246
	.align 8
.LC3:
	.long	4290772992
	.long	1105199103
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.align 16
.LC6:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
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
