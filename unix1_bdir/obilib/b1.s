/ = operator

.globl	b1

b1:
	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	mov	r0,(r1)
	mov	r0,(r5)+
	jmp	*(r3)+
