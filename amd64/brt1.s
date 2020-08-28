.set dp, %r13
.set sp, %r14
.set pc, %r15
stacksz = 1000
.bss
.align 8
stack:	.=.+8*stacksz
.text

.globl	main, fetch
main:
	call	startchain
	lea	stack(%rip),sp
	mov	sp,dp
	lea	init(%rip),pc
fetch:
	mov	(pc),%r10
	add	$8,pc
	jmp	*%r10
init:
	.quad	x, _main
	.quad	n1, 1f
1:	mov	-8(sp),%rdi
	call	exit

.globl chain
chain:
	pop	%rsi
	cld
1:	lodsq
	test	%rax,%rax
	jz	1f
	mov	(%rax),%rdx
	shr	$3,%rdx
	mov	%rdx,(%rax)
	jmp	1b
1:	jmp	*%rsi

startchain:
