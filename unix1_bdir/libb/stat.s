/ B library -- stat

.globl	.stat
.globl	n7

.stat:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,0f
        asl	(r5)
	mov	(r5)+,1f
	clr	(r5)
	sys	stat; 0:..; 1:..
	sbc	(r5)+
	jmp	n7
