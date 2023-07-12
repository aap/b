/ B library -- hog

.globl	.hog
.globl	n11

.hog:
	.+2
	.+2
	sys	hog
	jmp	n11
