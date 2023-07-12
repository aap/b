/ =* operator

.globl	b117
.globl	cksto

b117:
	mov	-(r5),(r2)+
	jsr	pc,cksto
	mov	(r1),(r2)
	mov	-(r2),(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
