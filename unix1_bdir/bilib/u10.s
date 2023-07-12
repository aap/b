/ unary x--

.globl	u10
.globl	cksto

u10:
	jsr	pc,cksto
	mov	(r1),(r5)+
	dec	(r1)
	jmp	*(r3)+
