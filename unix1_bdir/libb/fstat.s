/ B library -- fstat

.globl	.fstat
.globl	n7

.fstat:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	(r5)+,r0
	asl	(r5)
	mov	(r5)+,1f
	clr	(r5)
	sys	fstat; 1:..; 05625
	jmp	n7
