/ * operator

.globl	b17

b17:
	mov	-(r5),*$mq
	mov	-(r5),*$mul
	mov	*$mq,(r5)+
	jmp	*(r3)+
