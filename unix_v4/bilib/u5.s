/ unary ++x

.globl	u5

u5:
	mov	-(r5),r1
	asl	r1
	inc	(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
