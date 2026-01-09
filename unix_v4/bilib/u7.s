/ unary x++

.globl	u7

u7:
	mov	-(r5),r1
	asl	r1
	mov	(r1),(r5)+
	inc	(r1)
	jmp	*(r3)+
