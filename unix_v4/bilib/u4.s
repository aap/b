/ unary !

.globl	u4

u4:
	tst	-(r5)
	beq	1f
	clr	(r5)+
	jmp	*(r3)+
1:
	mov	$1,(r5)+
	jmp	*(r3)+
