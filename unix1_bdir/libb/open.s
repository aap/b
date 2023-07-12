/ B library -- open

.globl	.open
.globl	n7

.open:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,0f
	mov	(r5)+,1f
	sys	open; 0:..; 1:..
	bec	1f
	mov	$-1,r0
1:
	mov	r0,(r5)+
	jmp	n7
