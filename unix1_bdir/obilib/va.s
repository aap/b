/ get automatic word address

.globl	va, iva

iva:
	tst	-(r5)
va:
	mov	r4,r1
	add	(r3)+,r1
	asr	r1
	mov	r1,(r5)+
	jmp	*(r3)+
