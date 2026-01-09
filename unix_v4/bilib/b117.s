/ =* operator

.globl	b117

b117:
	mov	-(r5),r2
	mov	-(r5),r0
	asl	r0
	mov	r0,-(sp)
	mov	(r0),r0
	clr	r1
	mul	r2,r0
	mov	r1,*(sp)+
	mov	r1,(r5)+
	jmp	*(r3)+
