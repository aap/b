/ B library -- close

.globl	.close
.globl	n11

.close:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	(r5)+,r0
	sys	close
	jmp	n11
