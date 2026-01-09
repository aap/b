/ B library -- chdir

.globl	.chdir
.globl	n7

.data
.chdir:
	0f
.text
0:
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,0f
	clr	(r5)
	sys	0; 9f
	sbc	(r5)+
	jmp	n7
.data
9:	
	sys	chdir; 0:..
