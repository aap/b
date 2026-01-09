/ | operator

.globl	b2

b2:
	bis	-(r5),-2(r5)
	jmp	*(r3)+
