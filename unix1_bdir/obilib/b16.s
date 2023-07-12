/ % operator

.globl	b16

b16:
	mov	-(r5),r0
	mov	-(r5),*$mq
	mov	r0,*$div
	mov	*$ac,(r5)+
	jmp	*(r3)+
