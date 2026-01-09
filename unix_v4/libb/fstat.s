/ B library -- fstat

.globl	.fstat
.globl	n7

.data
.fstat:
	0f
.text
0:
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	(r5)+,r0
	asl	(r5)
	mov	(r5)+,0f
	clr	(r5)
	sys	0; 9f
	jmp	n7
.data
9:
	sys	fstat; 0:..
