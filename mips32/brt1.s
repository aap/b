.set idp,$s0
.set isp,$s1
.set ipc,$s2

.set noreorder

.macro  FETCH skip=0
	lw	$v0,\skip(ipc)
	jr	$v0
	addiu	ipc,4+\skip
.endm

stacksz = 1000
.data
.globl _argv
_argv:	.word 0
.bss
.align 2
stack:	.space 4*stacksz
.text

.globl main, fetch
main:
	la	isp,stack
	move	idp,isp
	la	ipc,init

	# B argc
	sw	$a0,8(idp)
	# argv, have to make a B vector out of this, urgh
	sll	$t0,$a0,2
	subu	$sp,$t0
	# B argv
	srl	$v1,$sp,2
	sw	$v1,12(idp)
	# add argc as element 0 for external argv
	sw	$a0,-4($sp)
	addiu	$sp,-4
	srl	$v1,$sp,2
	sw	$v1,_argv
	# copy arguments to stack with word alignment
	# NB: the last word can have junk bytes after the NUL
	addiu	$v0,$sp,4
1:	beq	$a0,$zero,1f
	addiu	$a0,-1
	# count string
	lw	$v1,($a1)
	li	$t0,3
2:	lb	$t1,($v1)
	beq	$t1,$zero,2f
	addiu	$t0,1
	b	2b
	addiu	$v1,1
2:	li	$t1,~3
	and	$t0,$t1
	# make space for string and copy it
	subu	$sp,$t0
	move	$t2,$sp
	lw	$v1,($a1)
2:	beq	$t0,$zero,2f
	addiu	$t0,-1
	lb	$t1,($v1)
	sb	$t1,($t2)
	addiu	$t2,1
	b	2b
	addiu	$v1,1
2:	addiu	$a1,4
	srl	$t2,$sp,2
	sw	$t2,($v0)
	j	1b
	addiu	$v0,4
1:

	jal	startchain
	nop
fetch:	FETCH

init:
	.word	x, _main
	.word	n1, 1f
1:	jal	exit
	lw	$a0,-4(isp)

.globl chain
chain:
	lw	$v0,($ra)
	beq	$v0,$zero,1f
	addiu	$ra,4
	lw	$t0,($v0)
	srl	$t0,2
	b	chain
	sw	$t0,($v0)
1:	jr	$ra
	nop

startchain:
	move	$t7,$ra
