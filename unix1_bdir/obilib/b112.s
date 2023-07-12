/ =>> operator

.globl	b112

b112:
	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	mov	(r1),*$ac
	sub	r0,*$lsh
	mov	*$ac,(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
