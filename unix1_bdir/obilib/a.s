/ get automatic

.globl	a, ia

ia:
	tst	-(r5)
a:
	mov	r4,r1
	add	(r3)+,r1
	mov	(r1),(r5)+
	jmp	*(r3)+
