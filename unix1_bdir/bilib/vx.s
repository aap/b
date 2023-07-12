/ constant word address

.globl	ivx, vx

ivx:
	tst	-(r5)
vx:
	mov	(r3)+,r1
	asr	r1
	mov	r1,(r5)+
	jmp	*(r3)+
