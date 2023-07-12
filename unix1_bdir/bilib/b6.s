/ <= operator

.globl	b6

b6:
	cmp	-(r5),-(r5)
	bge	1f
	clr	(r5)+
	jmp	*(r3)+
1:
	mov	$1,(r5)+
	jmp	*(r3)+
