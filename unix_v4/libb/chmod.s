/ B library -- chmod

.globl	.chmod
.globl	n7

.data
.chmod:
	0f
.text
0:
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,0f
	mov	(r5)+,0f+2
	clr	(r5)
	sys	0; 9f
	sbc	(r5)+
	jmp	n7
.data
9:
	sys	chmod; 0:..; ..
