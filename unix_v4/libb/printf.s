	jmp 9f
.data

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
L2:
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
	f; L3
	ia; 34
	c; 0
	b4
	f; L4
	n11
L4:
	ix; .putchar
	n2
	a; 34
	n3
	t; L2
L3:
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
	z; L5
L6=144
L7:
L10=157
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
L5:
	4
	L6
	L7
	L10
	L11
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

9:	jsr	r5,chain
	0
8:
	jmp	0f
.text
0:
