/ =<< operator

.globl	b113

b113:
	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	mov	(r1),*$mq
	mov	r0,*$lsh
	mov	*$mq,(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
