/ < operator

.globl	b7

b7:
	cmp	-(r5),-(r5)
	bgt	1f
	clr	(r5)+
	jmp	*(r3)+
1:
	mov	$1,(r5)+
	jmp	*(r3)+
