.set dp, %r13
.set sp, %r14
.set pc, %r15
.set a0, %rdi
.set a1, %rsi
.set a2, %rdx
.set a4, %rcx
.set a5, %r8
.set a6, %r9

.globl	_putchar
.data
_putchar: .quad 1f
.text
1:	.quad 1f
1:	mov	16(sp),%rax
	mov	_fout(%rip),a0
	lea	ch(%rip),a1
	mov	%rax,(a1)
	xor	a2,a2
1:	cmpb	$0,(a1,a2,1)
	je	1f
	inc	a2
	jmp	1b
1:	call	write
	jmp	n11

.globl	_getchar
.data
_getchar: .quad 1f
.text
1:	.quad 1f
1:	add	$24,sp
	mov	_fin(%rip),a0
	lea	ch(%rip),a1
	mov	$1,a2
	call	read
	cmp	$1,%eax
	jne	1f
	movzbl	ch(%rip),%eax
	mov	%rax,-8(sp)
	jmp	n7
1:	movq	$0,-8(sp)
	jmp	n7

.data
ch:	.quad 0
	.quad 0
.globl _fin, _fout, _ferr
_fin:	.quad 0
_fout:	.quad 1
_ferr:	.quad 2
.text


.globl _char
.data
_char: .quad 1f
.text
1:	.quad 1f
1:	add	$24,sp
	mov	16(dp),%rax	# string
	mov	24(dp),%rcx	# offset
	xor	%rdx,%rdx
	movzbl	(%rcx,%rax,8),%edx	# load
	mov	%rdx,-8(sp)
	jmp	n7

.globl _lchar
.data
_lchar: .quad 1f
.text
1:	.quad 1f
1:	mov	16(dp),%rax	# string
	mov	24(dp),%rcx	# offset
	movzbl	32(dp),%edx	# char
	movb	%dl,(%rcx,%rax,8)	# store
	jmp	n11

.globl _open
.data
_open: .quad 1f
.text
1:	.quad 1f
1:	add	$40,sp
	mov	16(dp),a0	# path
	shl	$3,a0
	mov	24(dp),a1	# flags
	mov	32(dp),a2	# mode
	call	open
	movslq	%eax,%rax
	mov	%rax,-8(sp)
	jmp	n7

.globl _creat
.data
_creat: .quad 1f
.text
1:	.quad 1f
1:	add	$32,sp
	mov	16(dp),a0	# path
	shl	$3,a0
	mov	$01101,a1	# flags, O_CREAT, O_TRUNC, O_WRONLY
	mov	24(dp),a2	# mode
	call	open
	movslq	%eax,%rax
	mov	%rax,-8(sp)
	jmp	n7

.globl _close
.data
_close: .quad 1f
.text
1:	.quad 1f
1:	mov	16(dp),a0
	call 	close
	jmp	n11

.globl _seek
.data
_seek: .quad 1f
.text
1:	.quad 1f
1:	add	$40,sp
	mov	16(dp),a0	# fd
	mov	24(dp),a1	# off
	mov	32(dp),a2	# whence
	call	lseek
	mov	%rax,-8(sp)
	jmp	n7

.globl _write
.data
_write: .quad 1f
.text
1:	.quad 1f
1:	add	$40,sp
	mov	16(dp),a0	# fd
	mov	24(dp),a1	# buf
	shl	$3,a1
	mov	32(dp),a2	# count
	call	write
	mov	%rax,-8(sp)
	jmp	n7

.globl _read
.data
_read: .quad 1f
.text
1:	.quad 1f
1:	add	$40,sp
	mov	16(dp),a0	# fd
	mov	24(dp),a1	# buf
	shl	$3,a1
	mov	32(dp),a2	# count
	call	read
	mov	%rax,-8(sp)
	jmp	n7

.globl _exit
.data
_exit: .quad 1f
1:	.quad 1f
.text
1:	mov	16(dp),a0
	call	exit
