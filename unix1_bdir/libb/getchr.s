/ B library -- getchar

.globl	.getchar
.globl	n7
.globl	.fin

.getchar:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	.fin,r0
	sys	read; ch; 01
	bes	1f
	tst	r0
	bne	1f
	clr	ch
1:
	mov	ch,(r5)+
	jmp	n7

ch:	.=.+2
.fin:	0
