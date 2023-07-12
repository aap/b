/ B library -- close

.globl	.close
.globl	n11

.close:
	.+2
	.+2
	mov	4(r4),r0
	sys	close
	jmp	n11
