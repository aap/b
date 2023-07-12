/ return from function with value

.globl	n7

n7:
	mov	-(r5),r0	/ get return value from top of stack
	mov	r4,r5		/ restore old stack
	mov	(r5),r4		/ restore old frame pointer
	mov	r0,(r5)+	/ put return value on current stack
	mov	(r5),r3		/ jump to return address
	jmp	*(r3)+
