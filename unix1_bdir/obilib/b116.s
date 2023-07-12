/ =% operator

.globl	b116

b116:
	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	mov	(r1),*$mq
	mov	r0,*$div
	mov	*$ac,(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
