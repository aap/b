/ =& operator

.globl	b103
.globl	cksto

b103:
	mov	-(r5),r0
	jsr	pc,cksto
	com	r0
	bic	r0,(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
