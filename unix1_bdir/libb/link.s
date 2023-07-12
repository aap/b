/ B library -- link

.globl	.link
.globl	n7

.link:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,0f
	asl	(r5)
	mov	(r5)+,1f
	clr	(r5)
	sys	link; 0:..; 1:..
	sbc	(r5)+
	jmp	n7
