/ / operator

.globl	b20

b20:
	mov	-(r5),r2	/ divisor
	mov	-(r5),r1	/ dividend
	clr	r0
	div	r2,r0
	mov	r0,(r5)+
	jmp	*(r3)+
