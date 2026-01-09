/ unary --x

.globl	u6

u6:
	mov	-(r5),r1
	asl	r1
	dec	(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
