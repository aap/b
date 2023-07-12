/ % operator

.globl	b16

b16:
	mov	-(r5),r0
	mov	-(r5),(r2)
	mov	r0,*$div
	mov	AC,(r5)+
	jmp	*(r3)+
