/ B library -- putchar

.globl	.putchar
.globl	n7
.globl	n11
.globl	.flush
.globl	.fout

.data
.putchar:
	0f
.text
0:
	.+2
	mov	4(r4),ch
	mov	.fout,r0
	tstb	ch+1
	beq	1f
	swab	ch
	sys	write; ch; 02
	br	2f
1:
	sys	write; ch; 01
2:
	jmp	n11

.data
.flush:
	0f
.text
0:
	n11

.data
ch:	.=.+2
.fout:	1
