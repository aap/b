/ B library -- seek

.globl	.seek
.globl	n7

.seek:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	(r5)+,r0
	mov	(r5)+,0f
	mov	(r5)+,1f
	sys	seek; 0:..; 1:..
	bec	1f
	mov	$1,(r5)+
	br	2f
1:
	clr	(r5)+
2:
	jmp	n7
