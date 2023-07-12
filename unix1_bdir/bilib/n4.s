/ array access

.globl	n4

n4:
	mov	-(r5),r1
	add	-(r5),r1
	asl	r1
	mov	(r1),(r5)+
	jmp	*(r3)+
