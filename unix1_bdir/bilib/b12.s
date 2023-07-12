/ right shift

.globl	b12

b12:
	mov	-(r5),r0	/ shift amount
	mov	-(r5),-(r2)	/ set AC (high)
	sub	r0,*$lsh	/ negative shift
	mov	(r2)+,(r5)+	/ get AC
	jmp	*(r3)+
