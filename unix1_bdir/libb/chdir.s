/ B library -- chdir

.globl	.chdir
.globl	n7

.chdir:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,1f
	clr	(r5)
	sys	chdir; 1:..
	sbc	(r5)+
	jmp	n7
