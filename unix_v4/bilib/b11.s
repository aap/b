/ > operator

.globl	b11

b11:
	cmp	-(r5),-(r5)
	blt	1f
	clr	(r5)+
	jmp	*(r3)+
1:
	mov	$1,(r5)+
	jmp	*(r3)+
