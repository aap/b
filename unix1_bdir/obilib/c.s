/ get constant

.globl	ic, c

ic:
	tst	-(r5)
c:
	mov	(r3)+,(r5)+
	jmp	*(r3)+
