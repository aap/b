ipc = r3
idp = r4
isp = r5

.globl exit
exit:	sys	1.

read:	sys	3.
	br	sysret

write:	sys	4.
	br	sysret

open:	sys	5.
	br	sysret

close:	sys	6.
	br	sysret

lseek:	sys	19.
	br	sysret

sysret:	bcc	1f
	mov	$-1,r0
1:	rts	pc

.globl _putchar
.data
_putchar: 1f
.text
1:	1f
1:	mov	idp,isp
	cmp	(isp)+,(isp)+
	mov	(isp)+,ch	/ get character
	tstb	ch+1	/ check if one or two chars
	beq	1f	/ one char
/	swab	ch	/ sure about swab here?
	mov	$2,-(sp)
	br	2f
1:	mov	$1,-(sp)
2:	mov	$ch,-(sp)
	mov	_fout,-(sp)	/ fd
	jsr	pc,write
	add	$6,sp
	jmp	n7

.globl _getchar
.data
_getchar: 1f
.text
1:	1f
1:	mov	idp,isp
	cmp	(isp)+,(isp)+
	mov	$1,-(sp)
	mov	$ch2,-(sp)
	mov	_fin,-(sp)
	jsr	pc,read
	add	$6,sp
	tst	r0
	bne	1f
	clr	ch2
1:	mov	ch2,(isp)+
	jmp	n7

.data
ch:	0
ch2:	0
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
1:	mov	idp,isp
	cmp	(isp)+,(isp)+
	mov	(isp)+,r1	/ string
	asl	r1
	add	(isp),r1	/ add index
	movb	(r1),r0		/ get char
	mov	r0,(isp)+
	jmp	n7

.globl _lchar
.data
_lchar: 1f
.text
1:	1f
1:	mov	idp,isp
	cmp	(isp)+,(isp)+
	mov	(isp)+,r0	/ string
	asl	r0
	add	(isp)+,r0	/ add index
	mov	(isp)+,r1	/ char
	movb	r1,(r0)		/ get char
	jmp	n7


.globl _open
.data
_open: 1f
.text
1:	1f
1:	mov	idp,isp
	cmp	(isp)+,(isp)+
	mov	(isp)+,r0	/ name
	asl	r0
	mov	(isp)+,r1	/ flags
	mov	(isp),-(sp)	/ mode
	mov	r1,-(sp)
	mov	r0,-(sp)
	jsr	pc,open
	add	$6,sp
	mov	r0,(isp)+
	jmp	n7

.globl _creat
.data
_creat: 1f
.text
1:	1f
1:	mov	idp,isp
	cmp	(isp)+,(isp)+
	mov	(isp)+,r0	/ name
	asl	r0
	mov	(isp),-(sp)	/ mode
	mov	$3001,-(sp)	/ O_CREAT | O_TRUNC | O_WRONLY
	mov	r0,-(sp)
	jsr	pc,open
	add	$6,sp
	mov	r0,(isp)+
	jmp	n7

.globl _close
.data
_close: 1f
.text
1:	1f
1:	mov	4(idp),-(sp)	/ fd
	jsr	pc,close
	tst	(sp)+
	jmp	n11

.globl _seek
.data
_seek: 1f
.text
1:	1f
1:	mov	idp,isp
	cmp	(isp)+,(isp)+
	mov	(isp)+,r0	/ fd
	mov	(isp)+,r1	/ offset
	mov	(isp),-(sp)	/ whence
	mov	r1,-(sp)
	clr	-(sp)	/ offset high word
	mov	r0,-(sp)
	jsr	pc,lseek
	add	$8.,sp
	mov	r0,(isp)+
	jmp	n7

.globl _write
.data
_write: 1f
.text
1:	1f
1:	mov	idp,isp
	cmp	(isp)+,(isp)+
	mov	(isp)+,r0	/ fd
	mov	(isp)+,r1	/ buf
	asl	r1
	mov	(isp),-(sp)	/ count
	mov	r1,-(sp)
	mov	r0,-(sp)
	jsr	pc,write
	add	$6,sp
	mov	r0,(isp)+
	jmp	n7

.globl _read
.data
_read: 1f
.text
1:	1f
1:	mov	idp,isp
	cmp	(isp)+,(isp)+
	mov	(isp)+,r0	/ fd
	mov	(isp)+,r1	/ buf
	asl	r1
	mov	(isp),-(sp)	/ count
	mov	r1,-(sp)
	mov	r0,-(sp)
	jsr	pc,read
	add	$6,sp
	mov	r0,(isp)+
	jmp	n7

.globl _exit
.data
_exit: 1f
.text
1:	1f
1:	mov	4(idp),-(sp)
	jsr	pc,exit

