/ =>> operator

.globl	b112
.globl	cksto

b112:
	mov	-(r5),r0
	jsr	pc,cksto
	mov	(r1),-(r2)
	sub	r0,*$lsh
	mov	(r2)+,(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
