/ B library -- write

.globl	.write
.globl	n7

.write:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	(r5)+,r0
	asl	(r5)
	mov	(r5)+,0f
	mov	(r5)+,1f
	sys	write; 0:..; 1:..
	bec	1f
	mov	$-1,r0
1:
	mov	r0,(r5)+
	jmp	n7
