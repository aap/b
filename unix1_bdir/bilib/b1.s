/ = operator

.globl	b1
.globl	cksto

b1:
	mov	-(r5),r0
	jsr	pc,cksto
	mov	r0,(r1)
	mov	r0,(r5)+
	jmp	*(r3)+
