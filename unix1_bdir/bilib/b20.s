/ / operator

.globl	b20

b20:
	mov	-(r5),r0
	mov	-(r5),(r2)
	mov	r0,*$div
	mov	(r2),(r5)+
	jmp	*(r3)+
