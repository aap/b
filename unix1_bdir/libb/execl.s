/ B library -- execl

.globl	.execl
.globl	n11

.execl:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,2f
	mov	r5,3f
1:
	asl	(r5)+
	bne	1b
	sys	exec; 2:..; 3:..
	jmp	n11
