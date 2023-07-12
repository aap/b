/ =/ operator

.globl	b120

b120:
	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	mov	(r1),*$mq
	mov	r0,*$div
	mov	*$mq,(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
