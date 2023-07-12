/ B library -- time

.globl	.time
.globl	n11

.time:
	.+2
	.+2
	mov	r4,r5
	sys	time
	mov	4(r4),r0
	asl	r0
	mov	*$ac,(r0)+
	mov	*$mq,(r0)+
	jmp	n11
