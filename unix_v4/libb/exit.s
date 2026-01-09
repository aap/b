/ B library -- exit

.globl	.exit

.data
.exit:
	0f
.text
0:
	.+2
	mov	-(r5),r0
	sys	exit
