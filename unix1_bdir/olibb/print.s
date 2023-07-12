	jmp 9f

.globl .printf
.printf:
	.+2
	s; 42
	va; 36
	c; 0
	b1
	iva; 30
	va; 6
	b1
L1:
	s; 42
	va; 34
	x; .char
	n2
	a; 4
	va; 36
	u7
	n3
	b1
	c; 45
	b5
	f; L2
	ia; 34
	c; 0
	b4
	f; L3
	ix; .flush
	n1
	n11
L3:
	ix; .putchar
	n2
	a; 34
	n3
	ix; 7f+0
	n6
L2:
	iva; 32
	va; 30
	u7
	u3
	b1
	iva; 34
	x; .char
	n2
	a; 4
	va; 36
	u7
	n3
	b1
	z; L4
L5=144
L6:
L7=157
L10:
	ia; 32
	c; 0
	b7
	f; L11
	iva; 32
	a; 32
	u2
	b1
	ix; .putchar
	n2
	c; 55
	n3
L11:
	ix; .printn
	n2
	a; 32
	a; 34
	c; 157
	b4
	f; L12
	ic; 10
	t; L13
L12:
	ic; 12
L13:
	n3
	ix; 7f+0
	n6
L14=143
L15:
	ix; .putchar
	n2
	a; 32
	n3
	ix; 7f+0
	n6
L16=163
L17:
	iva; 40
	c; 0
	b1
L20:
	iva; 34
	x; .char
	n2
	a; 32
	va; 40
	u7
	n3
	b1
	c; 0
	b5
	f; L21
	ix; .putchar
	n2
	a; 34
	n3
	t; L20
L21:
	ix; 7f+0
	n6
	t; .+24
L4:
	4
	L5
	L6
	L7
	L10
	L14
	L15
	L16
	L17
	ix; .putchar
	n2
	c; 45
	n3
	iva; 36
	u10
	iva; 30
	u10
	ix; 7f+0
	n6
	n11
7:
	L1

.globl .printn
.printn:
	.+2
	s; 12
	va; 10
	a; 4
	a; 6
	b20
	b1
	f; L22
	ix; .printn
	n2
	a; 10
	a; 6
	n3
L22:
	ix; .putchar
	n2
	a; 4
	a; 6
	b16
	c; 60
	b14
	n3
	n11
7:

9:	jsr	r5,chain
	0;
8:
