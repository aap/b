/ set frame size

.globl	s

s:
	mov	r4,r5		/ get current frame
	add	(r3)+,r5	/ put stack above it
	jmp	*(r3)+
