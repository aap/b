/ B library -- creat

.globl	.creat
.globl	n7

.creat:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,1f
	mov	(r5)+,2f
	sys	creat; 1:..; 2:..
	bec	1f
	mov	$-1,r0
1:
	mov	r0,(r5)+
	jmp	n7
