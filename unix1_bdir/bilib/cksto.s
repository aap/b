.globl	cksto

cksto:
	mov	r5,r1
	add	$74,r1
	cmp	r1,sp
	bhis	1f
	mov	-(r5),r1
	asl	r1
	cmp	r1,$40000
	blos	1f
	cmp	r1,r5
	bhi	1f
	rts	pc
1:

	mov	$1,r0
	sys	write; 1f; 21
	4
1:
	<\nLV out of range\n>
	.even
