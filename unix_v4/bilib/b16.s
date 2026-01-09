/ % operator

.globl	b16

b16:
	mov	-(r5),r2	/ divisor
	mov	-(r5),r1	/ dividend
	clr	r0
	div	r2,r0
	mov	r1,(r5)+
	jmp	*(r3)+
