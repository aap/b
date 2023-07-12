/ B library -- lchar

.globl	.lchar
.globl	n11

.lchar:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	(r5)+,r0
	asl	r0
	add	(r5)+,r0
	movb	(r5),(r0)
	jmp	n11
