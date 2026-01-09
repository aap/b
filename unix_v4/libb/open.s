/ B library -- open

.globl	.open
.globl	n7

.data
.open:
	0f
.text
0:
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,0f
	mov	(r5)+,0f+2
	sys	0; 9f
	bec	1f
	mov	$-1,r0
1:
	mov	r0,(r5)+
	jmp	n7
.data
9:
	sys	open; 0:..; ..
