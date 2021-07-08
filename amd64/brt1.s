.set dp, %r13
.set sp, %r14
.set pc, %r15

.macro	FETCH skip=0
	add $8+\skip, pc
	jmp *-8(pc)
.endm


stacksz = 1000
.data
.globl _argv
_argv:	.quad 0
.bss
.align 8
stack:	.space	8*stacksz
.text

.globl	main, fetch
main:
	lea	stack(%rip),sp
	mov	sp,dp
	lea	init(%rip),pc

	mov	%rdi,%r11	# argc
	mov	%rsi,%r12	# argv
	# B argc at 16(sp)
	movq	%r11,16(sp)
	# argv, have to make a B vector out of this, urgh
	lea	(,%r11,8),%rax
	sub	%rax,%rsp	# make space for argv array
	# B argv at 24(sp)
	mov	%rsp,%rbx
	shr	$3,%rbx
	mov	%rbx,24(sp)
	# add argc as element 0 for external argv
	push	%r11
	mov	%rsp,%rbx
	shr	$3,%rbx
	mov	%rbx,_argv
	# copy arguments to stack with word alignment
	# NB: the last word can have junk bytes after the NUL
	lea	8(%rsp),%rbx
1:
	test	%r11,%r11
	jz	1f		# end of array
	# count string
	mov	$-7,%rcx
	mov	(%r12),%rdi	# argv[i]
	xor	%al,%al
	repne scasb		# find end
	# rcx is -(len+7) (including NUL) now
	neg	%rcx
	and	$-8,%rcx	# aligned to qwords
	sub	%rcx,%rsp	# make space for it
	# copy string
	shr	$3,%rcx
	mov	(%r12),%rsi
	add	$8,%r12
	mov	%rsp,%rdi
	rep movsq
	# store pointer in argv array
	mov	%rsp,%rax
	shr	$3,%rax
	mov	%rax,(%rbx)
	add	$8,%rbx
	dec	%r11
	jmp	1b
1:

	call	startchain
fetch:
	FETCH
init:
	.quad	x, _main
	.quad	n1, 1f
1:	mov	-8(sp),%rdi
	call	exit

.globl chain
chain:
	pop	%rsi
1:	lodsq
	test	%rax,%rax
	jz	1f
	mov	(%rax),%rdx
	shr	$3,%rdx
	mov	%rdx,(%rax)
	jmp	1b
1:	jmp	*%rsi

startchain:
