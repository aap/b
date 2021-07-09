#define idp s0
#define isp s1
#define ipc s2

.macro  FETCH skip=0
	ld	t0,\skip(ipc)
	addi	ipc,ipc,8+\skip
	jr	t0
.endm

stacksz = 1000
.data
.globl _argv
_argv:	.dword 0
.bss
.align 3
stack:	.space 8*stacksz
.text

.globl main, fetch
main:
	la	isp,stack
	move	idp,isp
	la	ipc,init

	# B argc
	sd	a0,16(idp)
	# argv, have to make a B vector out of this, urgh
	slli	t0,a0,3
	sub	sp,sp,t0
	# B argv
	srli	t0,sp,3
	sd	t0,24(idp)
	# add argc as element 0 for external argv
	sd	a0,-8(sp)
	addi	sp,sp,-8
	la	t1,_argv
	srli	t0,sp,3
	sd	t0,(t1)
	# copy arguments to stack with word alignment
	# NB: the last word can have junk bytes after the NUL
	addi	t6,sp,8
1:	beq	a0,zero,1f
	addi	a0,a0,-1
	# count string
	ld	t5,(a1)
	li	t4,7
2:	lb	t1,(t5)
	addi	t4,t4,1
	beq	t1,zero,2f
	addi	t5,t5,1
	j	2b
2:	li	t1,~7
	and	t4,t4,t1
	# make space for string and copy it
	sub	sp,sp,t4
	move	t0,sp
	ld	t5,(a1)
2:	beq	t4,zero,2f
	addi	t4,t4,-1
	lb	t1,(t5)
	sb	t1,(t0)
	addi	t0,t0,1
	addi	t5,t5,1
	j	2b
2:	srli	t0,sp,3
	sd	t0,(t6)
	addi	a1,a1,8
	addi	t6,t6,8
	j	1b
1:

	jal	t6,startchain
fetch:	#FETCH
	ld	t0,(ipc)
	addi	ipc,ipc,8
	jr	t0

init:
	.dword	x, _main
	.dword	n1, 1f
1:	ld	a0,-8(isp)
	call	exit@plt

.globl chain
chain:
	ld	t0,(ra)
	addi	ra,ra,8
	beq	t0,zero,1f
	ld	t1,(t0)
	srli	t1,t1,3
	sd	t1,(t0)
	j	chain
1:	jr	ra

startchain:
