/ =+ operator

.globl	b114

b114:
	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	add	r0,(r1)
	mov	(r1),(r5)+
	jmp	*(r3)+
