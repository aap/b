.pc = r3
.dp = r4
.sp = r5
stacksz = 128

.bss
.even
stack: .=.+stacksz+stacksz
.text

start:
	jsr	pc,startchain
	mov	$stack,.sp
	mov	$bstart,.pc
	jmp	*(.pc)+

bstart:	x; _main
	n1
	1f
1:	mov	-(.sp),-(sp)
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
