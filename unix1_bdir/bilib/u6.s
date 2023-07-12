/ unary --x

.globl	u6
.globl	cksto

u6:
	jsr	pc,cksto
	dec	(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
