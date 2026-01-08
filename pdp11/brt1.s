ipc = r3
idp = r4
isp = r5
stacksz = 512

.globl x, n1
.globl _main

.data
.globl _argv
_argv: 0
.bss
.even
stack: .=.+[stacksz*2]
.text

start:
	setd
	jsr	pc,startchain
	mov	$stack,isp

	mov	(sp)+,r4	/ argc
	mov	sp,r3		/ argv
	mov	r4,4(isp)	/ B argc at 4(isp)
	/ make space for argv
	sub	r4,sp
	sub	r4,sp
	/ B argv at 6(isp)
	mov	sp,r2
	mov	r2,6(isp)
	asr	6(isp)
	/ add argc as element 0 for external argv
	mov	r4,-(sp)
	mov	sp,_argv
	asr	_argv
	/ copy arguments to stack with word alignment
1:
	/ count string
	mov	(r3),r0		/ src str
3:
	tstb	(r0)+
	bne	3b
	sub	(r3),r0
	/ pad length
	inc	r0
	bic	$1,r0
	/ make space for string and copy
	sub	r0,sp
	mov	sp,r1		/ dst str
	mov	r1,(r2)
	asr	(r2)+		/ ptr in argv array
	mov	(r3)+,r0	/ src str
3:
	movb	(r0)+,(r1)+
	bne	3b
	/ loop
	dec	r4
	bne	1b

	clr	idp
	mov	$init,ipc
	jmp	*(ipc)+

init:	x; _main
	n1
	1f
1:	mov	-(isp),-(sp)
	jsr	pc,exit

.globl chain
chain:
	mov	(sp)+,r0
1:	mov	(r0)+,r1
	beq	1f
	asr	(r1)
	br	1b
1:	jmp	(r0)

startchain:
