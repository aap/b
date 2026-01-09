.globl	.ctime
.globl	ctime
.globl	n11

.data
.ctime:
	0f
.text
0:
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	(r5)+,r0
	asl	r0
	mov	(r0)+,-(sp)
	mov	(r0)+,mq
	mov	(sp)+,ac
	mov	(r5)+,r0
	asl	r0
	clrb	17(r0)
	jsr	pc,ctime
	jmp	n11

ctime:
	mov	r2,-(sp)
	mov	r3,-(sp)
	mov	$28.,febru
	cmp	ac,yrtime
	blo	2f
	bhi	1f
	cmp	mq,yrtime+2
	bcs	2f
1:	
	mov	ac,-(sp)
	sub	yrtime+2,mq
	sbc	(sp)
	sub	yrtime,(sp)
	mov	(sp)+,ac
	mov	$29.,febru
2:	
	mov	$-4,lsh
	mov	$13500.,div
	mov	mq,r3
	mov	ac,mq
	mov	$2,lsh
	mov	$15.,div
	add	$15.,r0
	jsr	r5,tdiv; 10.
	jsr	r5,tdiv; 6
	movb	$':,-(r0)
	jsr	r5,tdiv; 10.
	jsr	r5,tdiv; 6
	movb	$':,-(r0)
	mov	r3,mq
	mov	$24.,div
	mov	mq,r3
	mov	ac,mq
	jsr	r5,tdiv; 10.
	jsr	r5,tdiv; 10.
	mov	$daytab,r2
1:
	cmp	(r2),r3
	bgt	2f
	sub	(r2)+,r3
	br	1b
2:
	movb	$' ,-(r0)
	sub	$daytab,r2
	asl	r2
	add	$montab+4,r2
	inc	r3
	mov	r3,mq
	jsr	r5,tdiv; 10.
	tst	mq
	beq	2f
	add	$60,mq
	movb	mq,-(r0)
	br	3f
2:
	movb	$' ,-(r0)
3:
	movb	$' ,-(r0)
	movb	-(r2),-(r0)
	movb	-(r2),-(r0)
	movb	-(r2),-(r0)
	mov	(sp)+,r3
	mov	(sp)+,r2
	rts	pc

tdiv:
	clr	ac
	mov	(r5)+,div
	add	$'0,ac
	movb	ac,-(r0)
	rts	r5

yrtime:
	70310
	11000
daytab:	31.
febru:	28.
	31.
	30.
	31.
	30.
	31.
	31.
	30.
	31.
	30.
	999.

montab:
	<\0Jan>
	<\0Feb>
	<\0Mar>
	<\0Apr>
	<\0May>
	<\0Jun>
	<\0Jul>
	<\0Aug>
	<\0Sep>
	<\0Oct>
	<\0Nov>
	<\0Dec>
