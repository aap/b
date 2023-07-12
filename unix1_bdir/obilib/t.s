/ jump

.globl	t

t:
	mov	(r3)+,r3
	jmp	*(r3)+
