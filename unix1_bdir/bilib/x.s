/ absolute pointer

.globl	x, ix

ix:
	mov	*(r3)+,-2(r5)
	jmp	*(r3)+
x:
	mov	*(r3)+,(r5)+
	jmp	*(r3)+
