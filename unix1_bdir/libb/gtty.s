/ B library -- gtty

.globl	.gtty
.globl	n7

.gtty:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	(r5)+,r0
	asl	(r5)
	mov	(r5)+,0f
	sys	gtty; 0:..
	bes	1f
	clr	(r5)+
	jmp	n7
1:
	mov	pc,(r5)+
	jmp	n7
