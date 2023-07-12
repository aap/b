/ =* operator

.globl	b117

b117:
	mov	-(r5),*$mq
	mov	-(r5),r1
	asl	r1
	mov	(r1),*$mul
	mov	*$mq,(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
