/ B library -- intr

.globl	.intr
.globl	n11

.intr:
	.+2
	.+2
	mov	4(r4),r0
	cmp	r0,$1
	bhi	1f
	mov	r0,0f
	sys	intr; 0:..
	jmp	n11
1:
	mov	r0,3f
	mov	r4,4f
	mov	r2,5f
	sys	intr; 2f
	jmp	n11
2:
	mov	3f,r3
	mov	*4f,r4
	mov	5f,r2
	jmp	*(r3)+

3:	.=.+2
4:	.=.+2
5:	.=.+2
