/ B library -- wait

.globl    .wait
.globl    n7

.wait:
	.+2
	.+2
	mov	r4,r5
	cmp	(r5)+,(r5)+
	sys	wait
	bec	1f
	mov	$-1,r0
1:
	mov	r0,(r5)+
	jmp	n7
