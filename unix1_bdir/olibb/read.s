/ B library -- read

.globl	.read
.globl	n7

.read:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	(r5)+,r0
	asl	(r5)
	mov	(r5)+,0f
	mov	(r5)+,1f
	sys	read; 0:..; 1:..
	bec	1f
	mov	$-1,r0
1:
	mov	r0,(r5)+
	jmp	n7
