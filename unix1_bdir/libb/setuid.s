/ B library -- setuid

.globl	.setuid
.globl	n7

.setuid:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	(r5)+,r0
	sys	setuid
	bec	1f
	mov	$1,(r5)+
	br	2f
1:
	clr	(r5)+
2:
	jmp	n7
