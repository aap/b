/ B library -- unlink

.globl	.unlink
.globl	n7

.unlink:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,0f
	sys	unlink; 0:..
	bec	1f
	mov	$1,(r5)+
	br	2f
1:
	clr	(r5)+
2:
	jmp	n7
