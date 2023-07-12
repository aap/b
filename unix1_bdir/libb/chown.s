/ B library -- chown

.globl	.chown
.globl	n7

.chown:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,1f
	mov	(r5)+,2f
	clr	(r5)
	sys	chown; 1:..; 2:..
	sbc	(r5)+
	jmp	n7
