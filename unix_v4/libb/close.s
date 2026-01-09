/ B library -- close

.globl	.close
.globl	n11

.data
.close:
	0f
.text
0:
	.+2
	mov	4(r4),r0
	sys	close
	jmp	n11
