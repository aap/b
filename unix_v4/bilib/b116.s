/ =% operator

.globl	b116

b116:
	mov	-(r5),r2
	mov	-(r5),r1
	asl	r1
	mov	r1,-(sp)
	mov	(r1),r1
	clr	r0
	div	r2,r0
	mov	r1,*(sp)+
	mov	r1,(r5)+
	jmp	*(r3)+
