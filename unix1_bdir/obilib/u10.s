/ unary x--

.globl	u10

u10:
	mov	-(r5),r1
	asl	r1
	mov	(r1),(r5)+
	dec	(r1)
	jmp	*(r3)+
