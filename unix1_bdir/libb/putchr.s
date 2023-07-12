/ B library -- putchar

.globl	.putchar
.globl	n7
.globl	n11
.globl	.flush
.globl	.fout

.putchar:
	.+2
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

.flush:
	.+2
	n11

ch:	.=.+2
.fout:	1
