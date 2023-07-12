/ B library -- exit

.globl    .exit

.exit:	.+2
	n10; n7
	sys	exit


/ B library -- write

.globl	.write

.write:	.+2
	n10; n7
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	(r5)+,r0
	asl	(r5)
	mov	(r5)+,0f
	mov	(r5)+,1f
	sys	write; 0:..; 1:..
	bec	1f
	mov	$-1,r0
1:
	mov	r0,(r5)+
	jmp	fetch


/ B library -- open

.globl    .open

.text
.open:	.+2
	n10; n7
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,0f
	mov	(r5)+,1f
	sys	open; 0:..; 1:..
	bcc	1f
	mov	$-1,r0
1:
	mov	r0,(r5)+
	jmp	fetch


/ B library -- creat

.globl	.creat

.creat:
	.+2
	n10; n7
	mov	r4,r5
	cmp	(r5)+,(r5)+
	asl	(r5)
	mov	(r5)+,1f
	mov	(r5)+,2f
	sys	creat; 1:..; 2:..
	bec	1f
	mov	$-1,r0
1:
	mov	r0,(r5)+
	jmp	fetch


/ B library -- getchar

.globl	.getchar
.globl	.fin

.getchar:
	.+2
	n10; n7
	mov	.fin,r0
	sys	read; ch; 01
	bes	1f
	tst	r0
	beq	1f
	mov	ch,r0
	br	2f
1:
	clr	r0
2:
	mov	r4,r5
	add	$4,r5
	mov	r0,(r5)+
	jmp	fetch

/ch:	.=.+2
.fin:	0


/ B library -- putchar

.globl	.putchar
.globl	.flush
.globl	.fout

.putchar:
	.+2
	n10; n11
	mov	4(r4),ch
	mov	.fout,r0
	tstb	ch+1
	beq	1f
	swab	ch
	sys	write; ch; 02
	br	2f
1:
	sys	write; ch; 01
2:
	jmp	fetch

.flush:
	.+2
	n11

ch:	.=.+2
.fout:	1


/ B library -- char

.globl	.char

.char:	.+2
	n10; n7
	mov	r4,r5
	add	$4,r5
	mov	(r5)+,r1
	asl	r1
	add	(r5),r1
	movb	(r1),r0
	mov	r0,(r5)+
	jmp	fetch


/ B library -- lchar

.globl	.lchar

.lchar:	.+2
	n10; n11
	mov	r4,r5
	cmp	(r5)+,(r5)+
	mov	(r5)+,r0
	asl	r0
	add	(r5)+,r0
	movb	(r5),(r0)
	jmp	fetch


/ B library -- read

.globl  .read

.read:  .+2
        n10; n7
        mov     r4,r5
        cmp     (r5)+,(r5)+
        mov     (r5)+,r0
        asl     (r5)
        mov     (r5)+,0f
        mov     (r5)+,1f
        sys     read; 0:..; 1:..
        bec     1f
        mov     $-1,r0
1:
        mov     r0,(r5)+
        jmp     fetch
