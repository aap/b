/ * operator

.globl	b17

b17:
	mov	-(r5),r2	/ multiplier
	mov	-(r5),r1	/ multiplicand
	mul	r2,r1
	mov	r1,(r5)+
	jmp	*(r3)+
