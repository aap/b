/ =- operator

.globl	b115

b115:
	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	sub	r0,(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
