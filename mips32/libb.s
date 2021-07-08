.set idp,$s0
.set isp,$s1
.set ipc,$s2

.set noreorder

# to adjust stack, addiu isp,(2+nargs)*4,
# (2+1)*4 if no args but returns value

.globl	_putchar
.data
_putchar: .word 1f
.text
1:	.word 1f
1:	addiu	isp,12
	lw	$t0,8(idp)	# chars
	sw	$t0,ch
	move	$a2,$zero	# num chars
1:	beq	$t0,$zero,1f
	srl	$t0,8
	b	1b
	addiu	$a2,1
1:	lw	$a0,_fout
	la	$a1,ch
	jal	write
	nop
	j	n7
	sw	$v0,-4(isp)

.globl	_getchar
.data
_getchar: .word 1f
.text
1:	.word 1f
1:	addiu	isp,12
	lw	$a0,_fin
	la	$a1,ch
	jal	read
	li	$a2,1
	li	$v1,1
	bne	$v0,$v1,1f
	move	$v0,$zero
	lb	$v0,ch
1:	j	n7
	sw	$v0,-4(isp)

.data
ch:	.word 0
	.word 0
.globl _fin, _fout, _ferr
_fin:	.word 0
_fout:	.word 1
_ferr:	.word 2
.text


.globl _char
.data
_char: .word 1f
.text
1:	.word 1f
1:	addiu	isp,16
	lw	$v0,8(idp)	# string
	sll	$v0,2
	lw	$t0,12(idp)	# offset
	addu	$v0,$t0
	lb	$t1,($v0)
	j	n7
	sw	$t1,-4(isp)

.globl _lchar
.data
_lchar: .word 1f
.text
1:	.word 1f
1:	lw	$v0,8(idp)	# string
	sll	$v0,2
	lw	$t0,12(idp)	# offet
	addu	$v0,$t0
	lw	$t1,16(idp)	# char
	j	n11
	sb	$t1,($v0)

.globl _open
.data
_open: .word 1f
.text
1:	.word 1f
1:	addiu	isp,20
	lw	$a0,8(idp)	# path
	lw	$a1,12(idp)	# flags
	lw	$a2,16(idp)	# mode
	jal	open
	sll	$a0,2
	j	n7
	sw	$v0,-4(isp)

.globl _creat
.data
_creat: .word 1f
.text
1:	.word 1f
1:	addiu	isp,16
	lw	$a0,8(idp)	# path
	li	$a1,01401	# flags, O_CREAT, O_TRUNC, O_WRONLY
	lw	$a2,12(idp)	# mode
	jal	open
	sll	$a0,2
	j	n7
	sw	$v0,-4(isp)

.globl _close
.data
_close: .word 1f
.text
1:	.word 1f
1:	jal	close
	lw	$a0,8(idp)
	j	n11
	nop

.globl _seek
.data
_seek: .word 1f
.text
1:	.word 1f
1:	addiu	isp,20
	lw	$a0,8(idp)	# fd
	lw	$a1,12(idp)	# off
	jal	lseek
	lw	$a2,16(idp)	# whence
	j	n7
	sw	$v0,-4(isp)

.globl _write
.data
_write: .word 1f
.text
1:	.word 1f
1:	addiu	isp,20
	lw	$a0,8(idp)	# fd
	lw	$a1,12(idp)	# buf
	lw	$a2,16(idp)	# count
	jal	write
	sll	$a1,2
	j	n7
	sw	$v0,-4(isp)

.globl _read
.data
_read: .word 1f
.text
1:	.word 1f
1:	addiu	isp,20
	lw	$a0,8(idp)	# fd
	lw	$a1,12(idp)	# buf
	lw	$a2,16(idp)	# count
	jal	read
	sll	$a1,2
	j	n7
	sw	$v0,-4(isp)

.globl _exit
.data
_exit: .word 1f
1:	.word 1f
.text
1:	jal	exit
	lw	$a0,8(isp)

