	/ fall through from chain init of last B file
.globl .argv
.argv:
	/ will be overwritten by argv vector
	cmp	.main,$.main+2
	bne	1f
	tst	nfiles
	bne	init
1:
	mov	$1,r0
	sys	write; 2f; 5
	sys	exit
2:	<Init\n>
.even


.globl chain
chain:
	inc	nfiles
	mov	(r5)+,r0
1:
	tst	r0
	beq	1f
	mov	r0,r1
	mov	r0,r2
	mov	(r0),r0
	asr	r1
	inc	r1
	mov	r1,(r2)
	br	1b
1:
	rts	r5


init:
	clr	.argv
	jsr	r5,chain; .argv
	sys	break; 0
	mov	$.argv+2,r0		/ build argv here
	mov	(sp)+,r1		/ argc
	mov	r1,r2
	mov	r2,(r0)+		/ store argc in argv
	asl	r1
	add	r0,r1			/ space after vector
2:
	inc	r1
	asr	r1			/ word alignment
	mov	r1,(r0)+		/ store in argv
	asl	r1
	mov	(sp)+,r3		/ next argument
1:	movb	(r3)+,(r1)+
	bne	1b
	dec	r2
	bne	2b

	mov	$bstart,r3
	mov	$stack,r4
	mov	r4,r5
	mov	$177304,r2
	cmp	(r5)+,(r5)+
	jmp	*(r3)+

bstart:
	x; .main
	n1
	.+2
	sys	exit

nfiles:	0
