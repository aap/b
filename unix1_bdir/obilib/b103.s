/ =& operator

.globl	b103

b103:
	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	com	r0
	bic	r0,(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
