/ != operator

.globl	b5

b5:
	cmp	-(r5),-(r5)
	bne	1f
	clr	(r5)+
	jmp	*(r3)+
1:
	mov	$1,(r5)+
	jmp	*(r3)+
