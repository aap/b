/ & operator

.globl	b3

b3:
	mov	-(r5),r0
	com	r0
	bic	r0,-2(r5)
	jmp	*(r3)+
