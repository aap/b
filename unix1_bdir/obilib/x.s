/ absolute pointer

.globl	x, ix

ix:
	tst	-(r5)
x:
	mov	*(r3)+,(r5)+
	jmp	*(r3)+
