.pc = r3
.dp = r4
.sp = r5

.globl exit
exit:	sys	1.

read:	sys	3.
	jmp	sysret

write:	sys	4.
	jmp	sysret

open:	sys	5.
	jmp	sysret

close:	sys	6.
	jmp	sysret

lseek:	sys	19.
	jmp	sysret

sysret:	bcc	1f
	mov	$-1,r0
1:	rts	pc

.globl _putchar
.data
_putchar: 1f
.text
1:	1f
1:	mov	.dp,.sp
	cmp	(.sp)+,(.sp)+
	mov	(.sp)+,ch	/ get character
	tstb	ch+1	/ check if one or two chars
	beq	1f	/ one char
/	swab	ch	/ sure about swab here?
	mov	$2,-(sp)
	br	2f
1:	mov	$1,-(sp)
2:	mov	$ch,-(sp)
	mov	_fout,-(sp)	/ fd
	jsr	pc,write
	jmp	n7

.globl _flush
.data
_flush:	1f
.text
1:	n11

.globl _getchar
.data
_getchar: 1f
.text
1:	1f
1:	mov	.dp,.sp
	cmp	(.sp)+,(.sp)+
	mov	$1,-(sp)
	mov	$ch,-(sp)
	mov	_fin,-(sp)
	jsr	pc,read
	tst	r0
	bne	1f
	clr	ch
1:	mov	ch,(.sp)+
	jmp	n7

.data
ch:	0
.globl _fin, _fout, _ferr
_fin:	0
_fout:	1
_ferr:	2
.text

.globl _char
.data
_char: 1f
.text
1:	1f
1:	mov	.dp,.sp
	cmp	(.sp)+,(.sp)+
	mov	(.sp)+,r1	/ string
	asl	r1
	add	(.sp),r1	/ add index
	movb	(r1),r0		/ get char
	mov	r0,(.sp)+
	jmp	n7

.globl _lchar
.data
_lchar: 1f
.text
1:	1f
1:	mov	.dp,.sp
	cmp	(.sp)+,(.sp)+
	mov	(.sp)+,r0	/ string
	asl	r1
	add	(.sp)+,r0	/ add index
	add	(.sp)+,r1	/ char
	movb	r1,(r0)		/ get char
	jmp	n7


.globl _exit
.data
_exit: 1f
.text
1:	1f
1:	mov	4(.dp),-(sp)
	jsr	pc,exit

.globl _write
.data
_write: 1f
.text
1:	1f
1:	mov	.dp,.sp
	cmp	(.sp)+,(.sp)+
	mov	(.sp)+,r0	/ fd
	mov	(.sp)+,r1	/ buf
	asl	r1
	mov	(.sp),-(sp)	/ count
	mov	r1,-(sp)
	mov	r0,-(sp)
	jsr	pc,write
	mov	r0,(.sp)+
	jmp	n7

.globl _open
.data
_open: 1f
.text
1:	1f
1:	mov	.dp,.sp
	cmp	(.sp)+,(.sp)+
	mov	(.sp)+,r0	/ name
	asl	r0
	mov	(.sp)+,r1	/ flags
	mov	(.sp),-(sp)	/ mode
	mov	r1,-(sp)
	mov	r0,-(sp)
	jsr	pc,open
	mov	r0,(.sp)+
	jmp	n7

.globl _close
.data
_close: 1f
.text
1:	1f
1:	mov	4(.dp),-(sp)	/ fd
	jsr	pc,close
	jmp	n11

.globl _seek
.data
_seek: 1f
.text
1:	1f
1:	mov	.dp,.sp
	cmp	(.sp)+,(.sp)+
	mov	(.sp)+,r0	/ fd
	mov	(.sp)+,r1	/ offset
	mov	(.sp),-(sp)	/ whence
	mov	r1,-(sp)
	clr	-(sp)	/ offset high word
	mov	r0,-(sp)
	jsr	pc,lseek
	mov	r0,(.sp)+
	jmp	n7

