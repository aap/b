/ B library -- execv

.globl	.execv
.globl	n11

.execv:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,3f
	mov	(r5),r0
	asl	r0
	mov	r5,4f
	mov	r5,r1
	mov	2(r5),-(sp)
1:
	dec	(sp)
	blt	2f
	mov	(r0)+,(r1)
	asl	(r1)+
	bne	1b
2:
	tst	(sp)+
	clr	(r1)+
	sys	exec; 3:..; 4:..
	jmp	n11
