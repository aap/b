/ B library -- stty

.globl	.stty
.globl	n7

.data
.stty:
	0f
.text
0:
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	(r5)+,r0
        asl	(r5)
	mov	(r5)+,0f
	sys	0; 9f
	bes	1f
	clr	(r5)+
	jmp	n7
1:
	mov	pc,(r5)+
	jmp	n7
.data
9:
	sys	stty; 0:..
