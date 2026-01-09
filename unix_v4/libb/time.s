/ B library -- time

.globl	.time
.globl	n11

.data
.time:
	0f
.text
0:
	.+2
	sys	time
	mov	4(r4),r0
	asl	r0
	mov	ac,(r0)+
	mov	mq,(r0)+
	jmp	n11
