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
	clr	r0
	sys	link; 0:..; 1:..
	bec	1f
	dec	r0
1:
	mov	r0,(r5)+
2:
	jmp	n7
