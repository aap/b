/ arithmetic shift

.globl	b13

b13:
	mov	-(r5),r0	/ shift amount
	mov	-(r5),(r2)	/ set MQ (sxt)
	mov	r0,*$lsh	/ shift
	mov	(r2),(r5)+	/ get MQ
	jmp	*(r3)+
