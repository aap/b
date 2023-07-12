/ B library -- getuid

.globl	.getuid
.globl	n7

.getuid:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	sys	getuid
	mov	r0,(r5)+
	jmp	n7
