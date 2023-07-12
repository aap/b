	jmp 9f

.globl .printn
.printn:
	.+2
	s; 14
	va; 12
	c; 0
	b1
	ia; 4
	c; 0
	b7
	f; L1
	iva; 4
	a; 4
	u2
	b1
	ia; 4
	c; 0
	b7
	f; L2
	iva; 4
	u10
	iva; 12
	c; 1
	b1
	t; L3
L2:
	ix; .putchar
	n2
	c; 55
	n3
L3:
L1:
	iva; 10
	a; 4
	a; 6
	b20
	b1
	f; L4
	ix; .printn
	n2
	a; 10
	a; 6
	n3
L4:
	ix; .putchar
	n2
	a; 4
	a; 6
	b16
	c; 60
	b14
	a; 12
	b14
	n3
	n11
7:

9:	jsr	r5,chain
	0
8:
