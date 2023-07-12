/ init automatic array

.globl	y

y:
	mov	r4,r0
	add	(r3)+,r0	/ address of pointer
	mov	r0,r1		/ remember address
	asr	r0		/ to word address
	inc	r0		/ address of array
	mov	r0,(r1)		/ set pointer
	jmp	*(r3)+
