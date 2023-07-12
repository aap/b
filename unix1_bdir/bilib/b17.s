/ * operator

.globl	b17

b17:
	mov	-(r5),(r2)+
	mov	-(r5),(r2)
	mov	-(r2),(r5)+
	jmp	*(r3)+
