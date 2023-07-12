/ could optimize eae with r2
/ ac	302
/ mq	304

.globl	fetch

fetch:
	mov	(r3)+,r0	/ fetch
	mov	r0,mq
	clr	ac
	mov	$3,lsh
	mov	ac,r1
	asl	r1		/ jump offset
	asr	r0
	bcs	const
addr:
	clr	ac
	mov	$-3,lsh
	mov	mq,r0		/ byte address
	add	$core,r0	/ relocate to user
	jmp	*tab0(r1)
const:
	bit	$004000,r0	/ sxt constant
	bne	const1
const0:
	bic	$170000,r0
	jmp	*tab1(r1)
const1:
	bis	$170000,r0
	jmp	*tab1(r1)

tab0:	x.; ix.; vx.; ivx.; f.; t.; z.; misc.
tab1:	c.; ic.; a.; ia.; va.; iva.; s.; y.

ic.:	tst	-(r5)
c.:	mov	r0,(r5)+
	jmp	fetch

ia.:	tst	-(r5)
a.:	mov	r4,r1
	add	r0,r1
	mov	(r1),(r5)+
	jmp	fetch

iva.:	tst	-(r5)
va.:	mov	r4,r1
	add	r0,r1
	asr	r1
	mov	r1,(r5)+
	jmp	fetch

s.:	mov	r4,r5
	add	r0,r5
	jmp	fetch

y.:	add	r4,r0
	mov	r0,r1
	asr	r0
	inc	r0
	mov	r0,(r1)
	jmp	fetch


ix.:	tst	-(r5)
x.:	mov	(r0),(r5)+
	jmp	fetch

ivx.:	tst	-(r5)
vx.:	asr	r0
	mov	r0,(r5)+
	jmp	fetch

f.:	mov	-(r5),(r5)+
	bne	1f
t.:	mov	r0,r3
1:	jmp	fetch

z.:	mov	r0,r3
	mov	-2(r5),r0
	mov	(r3)+,r1	/ num cases
1:	cmp	r0,(r3)+
	beq	2f
	tst	(r3)+
	dec	r1
	bne	1b
	jmp	fetch
2:	mov	(r3),r3
	jmp	fetch

misc.:	/ sub	$core,r0	/ unrelocate
	jmp	*mtab-core(r0)

mtab:
	b1.
	b2.
	b3.
	b4.
	b5.
	b6.
	b7.
	b10.
	b11.
	b12.
	b13.
	b14.
	b15.
	b16.
	b17.
	b20.
	b102.
	b103.
/	b104.
/	b105.
/	b106.
/	b107.
/	b110.
/	b111.
	b112.
	b113.
	b114.
	b115.
	b116.
	b117.
	b120.
	u2.
	u3.
	u4.
	u5.
	u6.
	u7.
	u10.
	n1.
	n2.
	n3.
	n4.
	n5.	/not threaded
	in5.	/not threaded
	n6.
	n7.
	n10.	/not threaded
	n11.

b1.:	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	mov	r0,(r1)
	mov	r0,(r5)+
	jmp	fetch

b2.:	bis	-(r5),-2(r5)
	jmp	fetch

b3.:	mov	-(r5),r0
	com	r0
	bic	r0,-2(r5)
	jmp	fetch

b4.:	cmp	-(r5),-(r5)
	beq	1f
	br	2f
b5.:	cmp	-(r5),-(r5)
	bne	1f
	br	2f
b6.:	cmp	-(r5),-(r5)
	bge	1f
	br	2f
b7.:	cmp	-(r5),-(r5)
	bgt	1f
	br	2f
b10.:	cmp	-(r5),-(r5)
	ble	1f
	br	2f
b11.:	cmp	-(r5),-(r5)
	blt	1f
	br	2f
1:	mov	$1,(r5)+
	jmp	fetch
2:	clr	(r5)+
	jmp	fetch

b12.:	mov	-(r5),r0
	mov	-(r5),ac
	sub	r0,lsh
	mov	ac,(r5)+
	jmp	fetch

b13.:	mov	-(r5),r0
	mov	-(r5),mq
	mov	r0,lsh
	mov	mq,(r5)+
	jmp	fetch

b14.:	add	-(r5),-2(r5)
	jmp	fetch

b15.:	sub	-(r5),-2(r5)
	jmp	fetch

b16.:	mov	-(r5),r0
	mov	-(r5),mq
	mov	r0,div
	mov	ac,(r5)+
	jmp	fetch

b17.:	mov	-(r5),mq
	mov	-(r5),mul
	mov	mq,(r5)+
	jmp	fetch

b20.:	mov	-(r5),r0
	mov	-(r5),mq
	mov	r0,div
	mov	mq,(r5)+
	jmp	fetch

b102.:	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	bis	r0,(r1)
	mov	(r1),(r5)+
	jmp	fetch

b103.:	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	com	r0
	bic	r0,(r1)
	mov	(r1),(r5)+
	jmp	fetch

b112.:	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	mov	(r1),ac
	sub	r0,lsh
	mov	ac,(r1)
	mov	(r1),(r5)+
	jmp	fetch

b113.:	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	mov	(r1),mq
	mov	r0,lsh
	mov	mq,(r1)
	mov	(r1),(r5)+
	jmp	fetch

b114.:	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	add	r0,(r1)
	mov	(r1),(r5)+
	jmp	fetch

b115.:	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	sub	r0,(r1)
	mov	(r1),(r5)+
	jmp	fetch

b116.:	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	mov	(r1),mq
	mov	r0,div
	mov	ac,(r1)
	mov	(r1),(r5)+
	jmp	fetch

b117.:	mov	-(r5),mq
	mov	-(r5),r1
	asl	r1
	mov	(r1),mul
	mov	mq,(r1)
	mov	(r1),(r5)+
	jmp	fetch

b120.:	mov	-(r5),r0
	mov	-(r5),r1
	asl	r1
	mov	(r1),mq
	mov	r0,div
	mov	mq,(r1)
	mov	(r1),(r5)+
	jmp	fetch

u2.:	neg	-2(r5)
	jmp	fetch

u3.:	mov	-(r5),r1
	asl	r1
	mov	(r1),(r5)+
	jmp	fetch

u4.:	tst	-(r5)
	beq	1f
	clr	(r5)+
	jmp	fetch
1:	mov	$1,(r5)+
	jmp	fetch

u5.:	mov	-(r5),r1
	asl	r1
	inc	(r1)
	mov	(r1),(r5)+
	jmp	fetch

u6.:	mov	-(r5),r1
	asl	r1
	dec	(r1)
	mov	(r1),(r5)+
	jmp	fetch

u7.:	mov	-(r5),r1
	asl	r1
	mov	(r1),(r5)+
	inc	(r1)
	jmp	fetch

u10.:	mov	-(r5),r1
	asl	r1
	mov	(r1),(r5)+
	dec	(r1)
	jmp	fetch

n2.:	mov	r5,-(sp)
	tst	(r5)+
	jmp	fetch
n3.:	mov	(sp)+,r5
n1.:	mov	r3,(r5)
	mov	-(r5),r3
	mov	r4,(r5)
	mov	r5,r4
	jmp	fetch

n4.:	mov	-(r5),r1
	add	-(r5),r1
	asl	r1
	mov	(r1),(r5)+
	jmp	fetch

in5.:	tst	-(r5)
n5.:	mov	(r3)+,(r5)+
	jmp	fetch

n6.:	mov	-2(r5),r3
	jmp	fetch

n7.:	mov	-(r5),r0
	mov	r4,r5
	mov	(r5),r4
	mov	r0,(r5)+
	mov	(r5),r3
	jmp	fetch

n10.:	jmp	2(r3)

n11.:	mov	r4,r5
	mov	(r5)+,r4
	mov	(r5),r3
	jmp	fetch
