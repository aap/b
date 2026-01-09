/ B library -- execl

.globl	.execl
.globl	n11

.data
.execl:
	0f
.text
0:
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,0f
	mov	r5,0f+2
1:
	asl	(r5)+
	bne	1b
	sys	0; 9f
	jmp	n11
.data
9:
	sys	exec; 0:..; ..
