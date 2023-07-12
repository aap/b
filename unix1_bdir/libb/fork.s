/ B library -- fork

.globl	.fork
.globl	n7

.fork:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	sys	fork
	clr	r0
	bec	1f
	mov	$-1,r0
1:
	mov	r0,(r5)+
	jmp	n7
