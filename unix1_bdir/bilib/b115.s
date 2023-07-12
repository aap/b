/ =- operator

.globl	b115
.globl	cksto

b115:
	mov	-(r5),r0
	jsr	pc,cksto
	sub	r0,(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
