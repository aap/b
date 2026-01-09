/ unary *

.globl	u3

u3:
	mov	-(r5),r1
	asl	r1
	mov	(r1),(r5)+
	jmp	*(r3)+
