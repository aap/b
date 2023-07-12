/ unary x++

.globl	u7
.globl	cksto

u7:
	jsr	pc,cksto
	mov	(r1),(r5)+
	inc	(r1)
	jmp	*(r3)+
