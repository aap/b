/ return from function without value

.globl	n11

n11:
	mov	r4,r5		/ restore old stack
	mov	(r5)+,r4	/ restore old frame pointer
	mov	(r5),r3		/ jump to return address
	jmp	*(r3)+
