/ == operator

.globl	b4

b4:
	cmp	-(r5),-(r5)
	beq	1f
	clr	(r5)+
	jmp	*(r3)+
1:
	mov	$1,(r5)+
	jmp	*(r3)+
