ipc = r3
idp = r4
isp = r5
stacksz = 128

.bss
.even
stack: .=.+stacksz+stacksz
.text

start:
	jsr	pc,startchain
	mov	$stack,isp
	mov	$bstart,ipc
	jmp	*(ipc)+

bstart:	x; _main
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
