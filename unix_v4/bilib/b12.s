/ right shift

.globl	b12

b12:
	mov	-(r5),r2	/ shift amount
	mov	-(r5),r1	/ word
	clr	r0
	neg	r2
	ashc	r2,r0
	mov	r1,(r5)+
	jmp	*(r3)+
