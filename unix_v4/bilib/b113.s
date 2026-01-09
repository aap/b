/ =<< operator

.globl	b113

b113:
	mov	-(r5),r2
	mov	-(r5),r1
	asl	r1
	mov	r1,-(sp)
	mov	(r1),r1
	clr	r0
	ashc	r2,r0
	mov	r1,*(sp)+
	mov	r1,(r5)+
	jmp	*(r3)+
