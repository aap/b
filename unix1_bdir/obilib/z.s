/ switch

/ switch table format:
/ ncases
/ case1; label1
/ ...
/ casen; labeln
/ default code
/ ....

.globl	z

z:
	mov	(r3),r3		/ go to switch table
	mov	-2(r5),r0	/ switch value from stack
	mov	(r3)+,r1	/ number cases
1:
	cmp	r0,(r3)+	/ check case
	beq	2f
	tst	(r3)+		/ skip label
	dec	r1
	bne	1b
	jmp	*(r3)+		/ default
2:
	mov	(r3),r3		/ case found
	jmp	*(r3)+
