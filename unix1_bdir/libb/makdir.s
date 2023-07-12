/ B library -- makdir

.globl	.makdir
.globl	n7

.makdir:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,0f
	clr	(r5)
	sys	makdir; 0:..
	sbc	(r5)+
	jmp	n7
