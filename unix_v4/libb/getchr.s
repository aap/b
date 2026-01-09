/ B library -- getchar

.globl	.getchar
.globl	n7
.globl	.fin

.data
.getchar:
	0f
.text
0:
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	.fin,r0
	sys	read; ch; 01
	bes	1f
	tst	r0
	bne	2f
1:
	clr	ch
2:
	mov	ch,(r5)+
	jmp	n7

.data
ch:	.=.+2
.fin:	0
