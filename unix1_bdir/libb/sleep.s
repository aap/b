/ B library -- sleep

.globl	.sleep
.globl	n11

sleep = 35.

.sleep:
	.+2
	.+2
	mov	4(r4),r0
	sys	sleep
	jmp	n11
