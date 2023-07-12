/ B library -- getchar

.globl	.getchar
.globl	n7
.globl	.fin

.getchar:
	.+2
	.+2
	mov	.fin,r0
	sys	read; ch; 01
	bes	1f
	tst	r0
	beq	1f
	mov	ch,r0
	br	2f
1:
	clr	r0
2:
	mov	r4,r5
	add	$4,r5
	mov	r0,(r5)+
	jmp	n7

ch:	.=.+2
.fin:	0
