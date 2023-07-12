/ >= operator

.globl	b10

b10:
	cmp	-(r5),-(r5)
	ble	1f
	clr	(r5)+
	jmp	*(r3)+
1:
	mov	$1,(r5)+
	jmp	*(r3)+
