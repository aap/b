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
	clr	(r5)
	sys	seek; 0:..; 1:..
	sbc	(r5)+
	jmp	n7
