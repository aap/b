	jmp 9f

.globl .main
.main:
	.+2
	y; 10
	s; 42
	x; .argv
	c; 0
	n4
	c; 3
	b7
	f; L1
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
71101
20147
67543
67165
5164
0
2:
	n3
	ix; .exit
	n2
	c; 1
	n3
L1:
	ivx; .fin
	x; .open
	n2
	x; .argv
	c; 2
	n4
	c; 0
	n3
	b1
	c; 0
	b7
	f; L2
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
60503
23556
20164
64546
62156
22440
5163
0
2:
	x; .argv
	c; 2
	n4
	n3
	ix; .exit
	n2
	c; 1
	n3
L2:
	ivx; .fout
	x; .creat
	n2
	x; .argv
	c; 3
	n4
	c; 16
	n3
	b1
	c; 0
	b7
	f; L3
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
60503
23556
20164
71143
60545
62564
22440
5163
0
2:
	x; .argv
	c; 3
	n4
	n3
	ix; .exit
	n2
	c; 1
	n3
L3:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
65011
70155
34440
5146
0
2:
	n3
L4:
	iva; 4
	x; .getchar
	n1
	b1
	c; 0
	b11
	f; L5
	ia; 4
	z; L6
L7=114
L10:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
22514
35157
12
2:
	x; .getw
	n1
	n3
	ix; 7f+0
	n6
L12=161
L13:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
22514
36557
67445
12
2:
	x; .getw
	n1
	x; .getw
	n1
	n3
	ix; 7f+0
	n6
L14=147
L15:
	ix; .read
	n2
	x; .fin
	a; 10
	x; .namsiz
	n3
	ix; .lchar
	n2
	a; 10
	x; .namsiz
	c; 0
	n3
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
27012
66147
61157
20154
22456
5163
22456
35163
12
2:
	a; 10
	a; 10
	n3
	ix; 7f+0
	n6
L16=145
L17:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
27011
31053
12
2:
	n3
	ix; 7f+0
	n6
L20=166
L21:
	ix; .chain
	n1
	ix; 7f+0
	n6
L22=154
L23:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
46011
67445
12
2:
	x; .getw
	n1
	n3
	ix; 7f+0
	n6
L24=157
L25:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
22411
5157
0
2:
	x; .getw
	n1
	n3
	ix; 7f+0
	n6
L26=162
L27:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
27011
27075
22453
5157
0
2:
	x; .getw
	n1
	c; 2
	b17
	n3
	ix; 7f+0
	n6
L30=160
L31:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
35067
12
2:
	n3
	ix; 7f+0
	n6
L32=153
L33:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
72011
20073
25456
67445
12
2:
	x; .getw
	n1
	c; 1
	b14
	c; 2
	b17
	n3
	ix; 7f+0
	n6
L34=164
L35:
L36=146
L37:
L40=172
L41:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
22411
35543
46040
67445
12
2:
	a; 4
	x; .getw
	n1
	n3
	ix; 7f+0
	n6
L42=171
L43:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
74411
20073
67445
12
2:
	x; .getw
	n1
	c; 2
	b17
	n3
	ix; 7f+0
	n6
L44=163
L45:
	ivx; .stklvl
	x; .getw
	n1
	b1
	ivx; .drop
	c; 1
	b1
	ivx; .blockp
	x; .space
	b1
	ivx; .sp
	x; .stack
	b1
	ivx; .ap
	x; .ast
	b1
	ix; 7f+0
	n6
L46=170
L47:
	ix; .read
	n2
	x; .fin
	va; 36
	x; .blockp
	b1
	x; .namsiz
	n3
	ix; .lchar
	n2
	a; 36
	x; .namsiz
	c; 0
	n3
	ivx; .blockp
	c; 10
	b114
	ivx; .sp
	u7
	x; .block
	n2
	c; 1
	a; 4
	a; 36
	n3
	b1
	ix; 7f+0
	n6
L50=141
L51:
L52=143
L53:
L54=151
L55:
	ivx; .sp
	u7
	x; .block
	n2
	c; 1
	a; 4
	x; .getw
	n1
	n3
	b1
	ix; 7f+0
	n6
L56=74
L57:
	ivx; .sp
	u7
	va; 36
	x; .block
	n2
	c; 1
	c; 163
	c; 0
	n3
	b1
	b1
L60:
	iva; 4
	x; .getchar
	n1
	b1
	c; 76
	b5
	f; L61
	ivx; .blockp
	u7
	x; .getw
	n1
	b1
	t; L60
L61:
	ia; 36
	c; 1
	b14
	x; .blockp
	a; 36
	b15
	c; 2
	b15
	b1
	ix; 7f+0
	n6
L62=142
L63:
L64=165
L65:
	ix; .build
	n2
	a; 4
	x; .getw
	n1
	n3
	ix; 7f+0
	n6
L66=156
L67:
	iva; 6
	x; .getw
	n1
	b1
	ia; 6
	z; L70
L71=1
L72:
	ix; .sp
	c; -1
	b14
	x; .block
	n2
	c; 2
	c; 24051
	x; .sp
	c; -1
	n4
	c; 0
	n3
	b1
	ix; 7f+0
	n6
L73=2
L74:
	ivx; .ap
	u7
	x; .sp
	b1
	ix; 7f+0
	n6
L75=3
L76:
	iva; 40
	x; .sp
	b1
	ivx; .sp
	va; 6
	vx; .ap
	u6
	u3
	b1
	b1
	iva; 36
	x; .block
	n2
	c; 2
	c; 24051
	vx; .sp
	u6
	u3
	a; 40
	a; 6
	b15
	n3
	b1
L77:
	ia; 6
	a; 40
	b7
	f; L100
	ivx; .blockp
	u7
	va; 6
	u7
	u3
	b1
	t; L77
L100:
	ivx; .sp
	u7
	a; 36
	b1
	ix; 7f+0
	n6
L101=4
L102:
	ix; .build
	n2
	c; 55535
	n3
	ix; 7f+0
	n6
L103=6
L104:
L105=7
L106:
L107=11
L110:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
22411
22543
5157
0
2:
	a; 4
	a; 6
	n3
	ix; 7f+0
	n6
	t; .+40
L70:
	7
	L71
	L72
	L73
	L74
	L75
	L76
	L101
	L102
	L103
	L104
	L105
	L106
	L107
	L110
	ix; .error
	n2
	vx; 1f
	t; 2f
1:
20156
67445
0
2:
	a; 6
	n3
	ix; 7f+0
	n6
L111=77
L112:
	iva; 40
	vx; .sp
	u6
	u3
	b1
	iva; 36
	vx; .sp
	u6
	u3
	b1
	iva; 6
	vx; .sp
	u6
	u3
	b1
	ivx; .sp
	u7
	x; .block
	n2
	c; 4
	a; 4
	x; .getw
	n1
	a; 6
	a; 36
	a; 40
	n3
	b1
	ix; 7f+0
	n6
L113=123
L114:
	ivx; .setstk
	c; 1
	b1
	ix; 7f+0
	n6
L115=105
L116:
L117:
	ix; .sp
	x; .stack
	b11
	f; L120
	ix; .cexpr
	n2
	vx; .sp
	u6
	u3
	c; 0
	n3
	ivx; .drop
	c; 1
	b1
	t; L117
L120:
	ix; 7f+0
	n6
	t; .+154
L6:
	32
	L7
	L10
	L12
	L13
	L14
	L15
	L16
	L17
	L20
	L21
	L22
	L23
	L24
	L25
	L26
	L27
	L30
	L31
	L32
	L33
	L34
	L35
	L36
	L37
	L40
	L41
	L42
	L43
	L44
	L45
	L46
	L47
	L50
	L51
	L52
	L53
	L54
	L55
	L56
	L57
	L62
	L63
	L64
	L65
	L66
	L67
	L111
	L112
	L113
	L114
	L115
	L116
L11:
	t; L4
L5:
	s; 42
	x; .printf
	n2
	vx; 1f
	t; 2f
1:
34412
4472
71552
4562
32562
61454
60550
67151
12
2:
	n3
	ix; .chain
	n1
	n11
7:
	L11

.globl .build
.build:
	.+2
	s; 14
	a; 4
	c; 55535
	b4
	f; L121
	ix; .build
	n2
	c; 142
	c; 14
	n3
	iva; 4
	c; 165
	b1
	iva; 6
	c; 3
	b1
L121:
	ia; 4
	z; L122
L123=165
L124:
	iva; 10
	vx; .sp
	u6
	u3
	b1
	ia; 6
	z; L125
L126=1
L127:
	ia; 10
	c; 0
	n4
	c; 165
	b4
	a; 10
	c; 1
	n4
	c; 3
	b4
	b3
	f; L130
	ivx; .sp
	u7
	a; 10
	c; 2
	n4
	b1
	n11
L130:
	ix; 7f+0
	n6
L132=3
L133:
	ia; 10
	c; 0
	n4
	c; 165
	b4
	a; 10
	c; 1
	n4
	c; 1
	b4
	b3
	f; L134
	ivx; .sp
	u7
	a; 10
	c; 2
	n4
	b1
	n11
L134:
	ix; 7f+0
	n6
	t; .+14
L125:
	2
	L126
	L127
	L132
	L133
L131:
	s; 14
	vx; .sp
	u7
	x; .block
	n2
	c; 2
	a; 4
	a; 6
	a; 10
	n3
	b1
	n11
L135=142
L136:
	ivx; .sp
	u6
	c; -1
	b14
	x; .block
	n2
	c; 3
	a; 4
	a; 6
	x; .sp
	c; -1
	n4
	x; .sp
	u3
	n3
	b1
	n11
	t; .+14
L122:
	2
	L123
	L124
	L135
	L136
	ix; .error
	n2
	vx; 1f
	t; 2f
1:
72542
66151
20144
61445
0
2:
	a; 4
	n3
	n11
7:
	L131

.globl .leaf
.leaf:
	.+2
	s; 10
	x; .putchar
	n2
	c; 11
	n3
	ix; .drop
	f; L137
	ix; .putchar
	n2
	c; 151
	n3
L137:
	ia; 4
	f; L140
	ix; .putchar
	n2
	c; 166
	n3
L140:
	ix; .putchar
	n2
	a; 6
	n3
	ivx; .drop
	c; 0
	b1
	n11
7:

.globl .cexpr
.cexpr:
	.+2
	s; 14
	x; .setstk
	f; L141
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
71411
20073
67445
12
2:
	x; .stklvl
	c; 2
	b17
	n3
	ivx; .setstk
	vx; .drop
	c; 0
	b1
	b1
L141:
	iva; 10
	a; 4
	c; 1
	n4
	b1
	ia; 4
	u3
	z; L142
L143=143
L144:
	ia; 6
	f; L145
	ix; .error
	n2
	vx; 1f
	t; 2f
1:
66151
62554
60547
20154
73154
12
2:
	n3
L145:
	ix; .leaf
	n2
	a; 6
	c; 143
	n3
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
20073
67445
12
2:
	a; 10
	n3
	n11
L146=141
L147:
	ix; .leaf
	n2
	a; 6
	c; 141
	n3
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
20073
67445
12
2:
	a; 10
	c; 2
	b17
	n3
	n11
L150=151
L151:
	ix; .leaf
	n2
	a; 6
	c; 170
	n3
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
20073
63067
22453
5157
0
2:
	a; 10
	c; 2
	b17
	n3
	n11
L152=170
L153:
	ix; .leaf
	n2
	a; 6
	c; 170
	n3
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
20073
22456
5163
0
2:
	a; 10
	n3
	n11
L154=163
L155:
	ia; 6
	f; L156
	ix; .error
	n2
	vx; 1f
	t; 2f
1:
66151
62554
60547
20154
73154
12
2:
	n3
L156:
	ix; .leaf
	n2
	c; 1
	c; 170
	n3
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
20073
63061
4412
35564
31040
5146
35061
12
2:
	n3
	iva; 10
	a; 4
	c; 1
	n4
	b1
	iva; 12
	a; 4
	c; 2
	b14
	b1
L157:
	iva; 10
	u10
	f; L160
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
67445
12
2:
	va; 12
	u7
	u3
	n3
	t; L157
L160:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
35062
12
2:
	n3
	n11
L161=165
L162:
	iva; 12
	a; 4
	c; 2
	n4
	b1
	ia; 10
	c; 3
	b4
	f; L163
	ia; 6
	f; L164
	ix; .cexpr
	n2
	a; 4
	c; 2
	n4
	c; 0
	n3
	n11
L164:
	ia; 12
	c; 0
	n4
	c; 142
	b4
	a; 12
	c; 1
	n4
	c; 14
	b4
	b3
	f; L165
	ix; .cexpr
	n2
	a; 12
	c; 2
	n4
	c; 0
	n3
	ix; .cexpr
	n2
	a; 12
	c; 3
	n4
	c; 0
	n3
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
67011
5064
0
2:
	n3
	n11
L165:
L163:
	ia; 6
	f; L166
	ix; .error
	n2
	vx; 1f
	t; 2f
1:
66151
62554
60547
20154
73154
12
2:
	n3
L166:
	ia; 10
	c; 1
	b4
	f; L167
	ix; .cexpr
	n2
	a; 12
	c; 1
	n3
	n11
L167:
	ix; .cexpr
	n2
	a; 12
	a; 10
	c; 1
	b4
	a; 10
	c; 5
	b10
	b2
	n3
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
22411
22543
5157
0
2:
	a; 4
	u3
	a; 10
	n3
	n11
L170=142
L171:
	ia; 6
	f; L172
	ix; .error
	n2
	vx; 1f
	t; 2f
1:
66151
62554
60547
20154
73154
12
2:
	n3
L172:
	ix; .cexpr
	n2
	a; 4
	c; 2
	n4
	a; 10
	c; 1
	b4
	a; 10
	c; 100
	b10
	b2
	n3
	ix; .cexpr
	n2
	a; 4
	c; 3
	n4
	c; 0
	n3
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
22411
22543
5157
0
2:
	a; 4
	u3
	a; 10
	n3
	n11
L173=77
L174:
	ix; .cexpr
	n2
	a; 4
	c; 2
	n4
	c; 0
	n3
	ivx; .drop
	c; 1
	b1
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
63011
20073
22514
5157
0
2:
	a; 4
	c; 1
	n4
	n3
	ix; .cexpr
	n2
	a; 4
	c; 3
	n4
	c; 0
	n3
	ivx; .drop
	c; 1
	b1
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
72011
20073
22514
5157
0
2:
	a; 4
	c; 1
	n4
	c; 1
	b14
	n3
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
22514
35157
12
2:
	a; 4
	c; 1
	n4
	n3
	ix; .cexpr
	n2
	a; 4
	c; 4
	n4
	c; 0
	n3
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
22514
35157
12
2:
	a; 4
	c; 1
	n4
	c; 1
	b14
	n3
	n11
L175=24051
L176:
	ix; .cexpr
	n2
	a; 4
	c; 1
	n4
	c; 0
	n3
	iva; 10
	a; 4
	c; 2
	n4
	b1
	ia; 10
	c; 0
	b4
	f; L177
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
67011
5061
0
2:
	n3
	n11
L177:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
67011
5062
0
2:
	n3
	iva; 12
	a; 4
	c; 3
	b14
	b1
L200:
	iva; 10
	u10
	f; L201
	ix; .cexpr
	n2
	va; 12
	u7
	u3
	c; 0
	n3
	t; L200
L201:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
67011
5063
0
2:
	n3
	n11
	t; .+50
L142:
	11
	L143
	L144
	L146
	L147
	L150
	L151
	L152
	L153
	L154
	L155
	L161
	L162
	L170
	L171
	L173
	L174
	L175
	L176
	ix; .error
	n2
	vx; 1f
	t; 2f
1:
67165
67153
73557
20156
70157
22440
5143
0
2:
	a; 4
	u3
	n3
	n11
7:

.globl .chn
.chn:
	0

.globl .chain
.chain:
	.+2
	s; 4
	x; .chn
	f; L202
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
34011
26542
5062
35070
12
2:
	n3
	t; L203
L202:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
30011
34012
5072
0
2:
	n3
L203:
	ivx; .chn
	c; 1
	b1
	n11
7:

.globl .getw
.getw:
	.+2
	s; 6
	va; 4
	c; 0
	b1
	ix; .read
	n2
	x; .fin
	va; 4
	c; 2
	n3
	ia; 4
	n7
	n11
7:

.globl .block
.block:
	.+2
	s; 24
	va; 20
	x; .blockp
	b1
	iva; 22
	va; 6
	b1
	iva; 4
	u7
L204:
	iva; 4
	u10
	f; L205
	ivx; .blockp
	u7
	va; 22
	u7
	u3
	b1
	t; L204
L205:
	ia; 20
	n7
	n11
7:

.globl .error
.error:
	.+2
	s; 14
	vx; .nerror
	u7
	iva; 12
	x; .fout
	b1
	ivx; .fout
	c; 1
	b1
	ix; .printf
	n2
	a; 4
	a; 6
	a; 10
	n3
	ix; .putchar
	n2
	c; 12
	n3
	ivx; .fout
	a; 12
	b1
	n11
7:

.globl .namsiz
.namsiz:
	10

.globl .space
.space:
	0
8:
	.=.+764

.globl .blockp
.blockp:
	.=.+2

.globl .nerror
.nerror:
	.=.+2

.globl .ap
.ap:
	0

.globl .ast
.ast:
	8b-2
8:
	.=.+120

.globl .sp
.sp:
	0

.globl .stack
.stack:
	8b-2
8:
	.=.+120

.globl .stklvl
.stklvl:
	0

.globl .setstk
.setstk:
	0

.globl .drop
.drop:
	0

9:	jsr	r5,chain
	8b-2
8:
