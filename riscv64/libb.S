#define idp s0
#define isp s1
#define ipc s2

# to adjust stack, addiu isp,(2+nargs)*8,
# (2+1)*8 if no args but returns value

.globl	_putchar
.data
_putchar: .dword 1f
.text
1:	.dword 1f
1:	addi	isp,isp,24
	ld	t0,16(idp)	# chars
	la	a1,ch
	sd	t0,(a1)
	move	a2,zero	# num chars
1:	beq	t0,zero,1f
	srli	t0,t0,8
	addi	a2,a2,1
	j	1b
1:	ld	a0,_fout
	call	write@plt
	sd	a0,-8(isp)
	j	n7

.globl	_getchar
.data
_getchar: .dword 1f
.text
1:	.dword 1f
1:	addi	isp,isp,24
	ld	a0,_fin
	la	a1,ch
	li	a2,1
	call	read@plt
	li	t0,1
	move	t1,zero
	bne	a0,t0,1f
	lb	t1,ch
1:	sd	t1,-8(isp)
	j	n7

.data
ch:	.dword 0
	.dword 0
.globl _fin, _fout, _ferr
_fin:	.dword 0
_fout:	.dword 1
_ferr:	.dword 2
.text

.globl _char
.data
_char: .dword 1f
.text
1:	.dword 1f
1:	addi	isp,isp,32
	ld	t6,16(idp)	# string
	slli	t6,t6,3
	ld	t0,24(idp)	# offset
	add	t6,t6,t0
	lb	t1,(t6)
	sd	t1,-8(isp)
	j	n7

.globl _lchar
.data
_lchar: .dword 1f
.text
1:	.dword 1f
1:	ld	t6,16(idp)	# string
	slli	t6,t6,3
	ld	t0,24(idp)	# offet
	add	t6,t6,t0
	ld	t1,32(idp)	# char
	sb	t1,(t6)
	j	n11

.globl _open
.data
_open: .dword 1f
.text
1:	.dword 1f
1:	addi	isp,isp,40
	ld	a0,16(idp)	# path
	ld	a1,24(idp)	# flags
	ld	a2,32(idp)	# mode
	slli	a0,a0,3
	call	open@plt
	sd	a0,-8(isp)
	j	n7

.globl _creat
.data
_creat: .dword 1f
.text
1:	.dword 1f
1:	addi	isp,isp,32
	ld	a0,16(idp)	# path
	li	a1,01101	# flags, O_CREAT, O_TRUNC, O_WRONLY
	ld	a2,24(idp)	# mode
	slli	a0,a0,3
	call	open@plt
	sd	a0,-8(isp)
	j	n7

.globl _close
.data
_close: .dword 1f
.text
1:	.dword 1f
1:	ld	a0,16(idp)
	call	close@plt
	j	n11

.globl _seek
.data
_seek: .dword 1f
.text
1:	.dword 1f
1:	addi	isp,isp,40
	ld	a0,16(idp)	# fd
	ld	a1,24(idp)	# off
	ld	a2,32(idp)	# whence
	call	lseek@plt
	sd	a0,-8(isp)
	j	n7

.globl _write
.data
_write: .dword 1f
.text
1:	.dword 1f
1:	addi	isp,isp,40
	ld	a0,16(idp)	# fd
	ld	a1,24(idp)	# buf
	ld	a2,32(idp)	# count
	slli	a1,a1,3
	call	write@plt
	sd	a0,-8(isp)
	j	n7

.globl _read
.data
_read: .dword 1f
.text
1:	.dword 1f
1:	addi	isp,isp,40
	ld	a0,16(idp)	# fd
	ld	a1,24(idp)	# buf
	ld	a2,32(idp)	# count
	slli	a1,a1,3
	call	read@plt
	sd	a0,-8(isp)
	j	n7

.globl _exit
.data
_exit: .dword 1f
1:	.dword 1f
.text
1:	ld	a0,16(isp)
	call	exit@plt
