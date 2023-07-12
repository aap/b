/ / operator

.globl	b20

b20:
	mov	-(r5),r0
	mov	-(r5),*$mq
	mov	r0,*$div
	mov	*$mq,(r5)+
	jmp	*(r3)+
