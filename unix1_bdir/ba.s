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
.byte 101
.byte 162
.byte 147
.byte 40
.byte 143
.byte 157
.byte 165
.byte 156
.byte 164
.byte 12
.byte 0
.even
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
.byte 103
.byte 141
.byte 156
.byte 47
.byte 164
.byte 40
.byte 146
.byte 151
.byte 156
.byte 144
.byte 40
.byte 45
.byte 163
.byte 12
.byte 0
.even
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
.byte 103
.byte 141
.byte 156
.byte 47
.byte 164
.byte 40
.byte 143
.byte 162
.byte 145
.byte 141
.byte 164
.byte 145
.byte 40
.byte 45
.byte 163
.byte 12
.byte 0
.even
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
.byte 11
.byte 152
.byte 155
.byte 160
.byte 40
.byte 71
.byte 146
.byte 12
.byte 0
.even
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
.byte 114
.byte 45
.byte 157
.byte 72
.byte 12
.byte 0
.even
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
.byte 114
.byte 45
.byte 157
.byte 75
.byte 45
.byte 157
.byte 12
.byte 0
.even
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
	ix; .readsym
	n2
	a; 10
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
.byte 12
.byte 56
.byte 147
.byte 154
.byte 157
.byte 142
.byte 154
.byte 40
.byte 56
.byte 45
.byte 163
.byte 12
.byte 56
.byte 45
.byte 163
.byte 72
.byte 12
.byte 0
.even
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
.byte 11
.byte 56
.byte 53
.byte 62
.byte 12
.byte 0
.even
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
.byte 11
.byte 114
.byte 45
.byte 157
.byte 12
.byte 0
.even
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
.byte 11
.byte 45
.byte 157
.byte 12
.byte 0
.even
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
.byte 11
.byte 56
.byte 75
.byte 56
.byte 53
.byte 45
.byte 157
.byte 12
.byte 0
.even
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
.byte 67
.byte 72
.byte 12
.byte 0
.even
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
.byte 11
.byte 164
.byte 73
.byte 40
.byte 56
.byte 53
.byte 45
.byte 157
.byte 12
.byte 0
.even
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
.byte 11
.byte 45
.byte 143
.byte 73
.byte 40
.byte 114
.byte 45
.byte 157
.byte 12
.byte 0
.even
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
.byte 11
.byte 171
.byte 73
.byte 40
.byte 45
.byte 157
.byte 12
.byte 0
.even
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
	ix; .readsym
	n2
	va; 36
	x; .blockp
	b1
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
	ia; 4
	c; 157
	b4
	f; L62
	ivx; .blockp
	u7
	x; .getw
	n1
	b1
L62:
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
L63=142
L64:
L65=165
L66:
	ix; .build
	n2
	a; 4
	x; .getw
	n1
	n3
	ix; 7f+0
	n6
L67=156
L70:
	iva; 6
	x; .getw
	n1
	b1
	ia; 6
	z; L71
L72=1
L73:
	ix; .sp
	c; -1
	b14
	x; .block
	n2
	c; 2
	c; 12051
	x; .sp
	c; -1
	n4
	c; 0
	n3
	b1
	ix; 7f+0
	n6
L74=2
L75:
	ivx; .ap
	u7
	x; .sp
	b1
	ix; 7f+0
	n6
L76=3
L77:
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
	c; 12051
	vx; .sp
	u6
	u3
	a; 40
	a; 6
	b15
	n3
	b1
L100:
	ia; 6
	a; 40
	b7
	f; L101
	ivx; .blockp
	u7
	va; 6
	u7
	u3
	b1
	t; L100
L101:
	ivx; .sp
	u7
	a; 36
	b1
	ix; 7f+0
	n6
L102=4
L103:
	ix; .build
	n2
	c; 26735
	n3
	ix; 7f+0
	n6
L104=6
L105:
L106=7
L107:
L110=11
L111:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
.byte 11
.byte 45
.byte 143
.byte 45
.byte 157
.byte 12
.byte 0
.even
2:
	a; 4
	a; 6
	n3
	ix; 7f+0
	n6
	t; .+40
L71:
	7
	L72
	L73
	L74
	L75
	L76
	L77
	L102
	L103
	L104
	L105
	L106
	L107
	L110
	L111
	ix; .error
	n2
	vx; 1f
	t; 2f
1:
.byte 156
.byte 40
.byte 45
.byte 157
.byte 0
.even
2:
	a; 6
	n3
	ix; 7f+0
	n6
L112=77
L113:
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
L114=123
L115:
	ivx; .setstk
	c; 1
	b1
	ix; 7f+0
	n6
L116=105
L117:
L120:
	ix; .sp
	x; .stack
	b11
	f; L121
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
	t; L120
L121:
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
	L63
	L64
	L65
	L66
	L67
	L70
	L112
	L113
	L114
	L115
	L116
	L117
L11:
	t; L4
L5:
	s; 42
	x; .printf
	n2
	vx; 1f
	t; 2f
1:
.byte 12
.byte 71
.byte 72
.byte 11
.byte 152
.byte 163
.byte 162
.byte 11
.byte 162
.byte 65
.byte 54
.byte 143
.byte 150
.byte 141
.byte 151
.byte 156
.byte 12
.byte 0
.even
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
	c; 26735
	b4
	f; L122
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
L122:
	ia; 4
	z; L123
L124=165
L125:
	iva; 10
	vx; .sp
	u6
	u3
	b1
	ia; 6
	z; L126
L127=1
L130:
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
	f; L131
	ivx; .sp
	u7
	a; 10
	c; 2
	n4
	b1
	n11
L131:
	ix; 7f+0
	n6
L133=3
L134:
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
	f; L135
	ivx; .sp
	u7
	a; 10
	c; 2
	n4
	b1
	n11
L135:
	ix; 7f+0
	n6
	t; .+14
L126:
	2
	L127
	L130
	L133
	L134
L132:
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
L136=142
L137:
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
L123:
	2
	L124
	L125
	L136
	L137
	ix; .error
	n2
	vx; 1f
	t; 2f
1:
.byte 142
.byte 165
.byte 151
.byte 154
.byte 144
.byte 40
.byte 45
.byte 143
.byte 0
.even
2:
	a; 4
	n3
	n11
7:
	L132

.globl .leaf
.leaf:
	.+2
	s; 10
	x; .putchar
	n2
	c; 11
	n3
	ix; .drop
	f; L140
	ix; .putchar
	n2
	c; 151
	n3
L140:
	ia; 4
	f; L141
	ix; .putchar
	n2
	c; 166
	n3
L141:
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
	f; L142
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
.byte 11
.byte 163
.byte 73
.byte 40
.byte 45
.byte 157
.byte 12
.byte 0
.even
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
L142:
	iva; 10
	a; 4
	c; 1
	n4
	b1
	ia; 4
	u3
	z; L143
L144=143
L145:
	ia; 6
	f; L146
	ix; .error
	n2
	vx; 1f
	t; 2f
1:
.byte 151
.byte 154
.byte 154
.byte 145
.byte 147
.byte 141
.byte 154
.byte 40
.byte 154
.byte 166
.byte 12
.byte 0
.even
2:
	n3
L146:
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
.byte 73
.byte 40
.byte 45
.byte 157
.byte 12
.byte 0
.even
2:
	a; 10
	n3
	n11
L147=141
L150:
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
.byte 73
.byte 40
.byte 45
.byte 157
.byte 12
.byte 0
.even
2:
	a; 10
	c; 2
	b17
	n3
	n11
L151=151
L152:
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
.byte 73
.byte 40
.byte 67
.byte 146
.byte 53
.byte 45
.byte 157
.byte 12
.byte 0
.even
2:
	a; 10
	c; 2
	b17
	n3
	n11
L153=170
L154:
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
.byte 73
.byte 40
.byte 56
.byte 45
.byte 163
.byte 12
.byte 0
.even
2:
	a; 10
	n3
	n11
L155=163
L156:
	ia; 6
	f; L157
	ix; .error
	n2
	vx; 1f
	t; 2f
1:
.byte 151
.byte 154
.byte 154
.byte 145
.byte 147
.byte 141
.byte 154
.byte 40
.byte 154
.byte 166
.byte 12
.byte 0
.even
2:
	n3
L157:
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
.byte 73
.byte 40
.byte 61
.byte 146
.byte 12
.byte 11
.byte 164
.byte 73
.byte 40
.byte 62
.byte 146
.byte 12
.byte 61
.byte 72
.byte 12
.byte 0
.even
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
L160:
	iva; 10
	u10
	f; L161
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
.byte 56
.byte 142
.byte 171
.byte 164
.byte 145
.byte 40
.byte 45
.byte 157
.byte 12
.byte 0
.even
2:
	va; 12
	u7
	u3
	n3
	t; L160
L161:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
.byte 56
.byte 142
.byte 171
.byte 164
.byte 145
.byte 40
.byte 60
.byte 12
.byte 56
.byte 145
.byte 166
.byte 145
.byte 156
.byte 12
.byte 62
.byte 72
.byte 12
.byte 0
.even
2:
	n3
	n11
L162=165
L163:
	iva; 12
	a; 4
	c; 2
	n4
	b1
	ia; 10
	c; 3
	b4
	f; L164
	ia; 6
	f; L165
	ix; .cexpr
	n2
	a; 4
	c; 2
	n4
	c; 0
	n3
	n11
L165:
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
	f; L166
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
.byte 11
.byte 156
.byte 64
.byte 12
.byte 0
.even
2:
	n3
	n11
L166:
L164:
	ia; 6
	f; L167
	ix; .error
	n2
	vx; 1f
	t; 2f
1:
.byte 151
.byte 154
.byte 154
.byte 145
.byte 147
.byte 141
.byte 154
.byte 40
.byte 154
.byte 166
.byte 12
.byte 0
.even
2:
	n3
L167:
	ia; 10
	c; 1
	b4
	f; L170
	ix; .cexpr
	n2
	a; 12
	c; 1
	n3
	n11
L170:
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
.byte 11
.byte 45
.byte 143
.byte 45
.byte 157
.byte 12
.byte 0
.even
2:
	a; 4
	u3
	a; 10
	n3
	n11
L171=142
L172:
	ia; 6
	f; L173
	ix; .error
	n2
	vx; 1f
	t; 2f
1:
.byte 151
.byte 154
.byte 154
.byte 145
.byte 147
.byte 141
.byte 154
.byte 40
.byte 154
.byte 166
.byte 12
.byte 0
.even
2:
	n3
L173:
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
.byte 11
.byte 45
.byte 143
.byte 45
.byte 157
.byte 12
.byte 0
.even
2:
	a; 4
	u3
	a; 10
	n3
	n11
L174=77
L175:
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
.byte 11
.byte 146
.byte 73
.byte 40
.byte 114
.byte 45
.byte 157
.byte 12
.byte 0
.even
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
.byte 11
.byte 164
.byte 73
.byte 40
.byte 114
.byte 45
.byte 157
.byte 12
.byte 0
.even
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
.byte 114
.byte 45
.byte 157
.byte 72
.byte 12
.byte 0
.even
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
.byte 114
.byte 45
.byte 157
.byte 72
.byte 12
.byte 0
.even
2:
	a; 4
	c; 1
	n4
	c; 1
	b14
	n3
	n11
L176=12051
L177:
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
	f; L200
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
.byte 11
.byte 156
.byte 61
.byte 12
.byte 0
.even
2:
	n3
	n11
L200:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
.byte 11
.byte 156
.byte 62
.byte 12
.byte 0
.even
2:
	n3
	iva; 12
	a; 4
	c; 3
	b14
	b1
L201:
	iva; 10
	u10
	f; L202
	ix; .cexpr
	n2
	va; 12
	u7
	u3
	c; 0
	n3
	t; L201
L202:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
.byte 11
.byte 156
.byte 63
.byte 12
.byte 0
.even
2:
	n3
	n11
	t; .+50
L143:
	11
	L144
	L145
	L147
	L150
	L151
	L152
	L153
	L154
	L155
	L156
	L162
	L163
	L171
	L172
	L174
	L175
	L176
	L177
	ix; .error
	n2
	vx; 1f
	t; 2f
1:
.byte 165
.byte 156
.byte 153
.byte 156
.byte 157
.byte 167
.byte 156
.byte 40
.byte 157
.byte 160
.byte 40
.byte 45
.byte 143
.byte 12
.byte 0
.even
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
	f; L203
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
.byte 11
.byte 70
.byte 142
.byte 55
.byte 62
.byte 12
.byte 70
.byte 72
.byte 12
.byte 0
.even
2:
	n3
	t; L204
L203:
	ix; .printf
	n2
	vx; 1f
	t; 2f
1:
.byte 11
.byte 60
.byte 12
.byte 70
.byte 72
.byte 12
.byte 0
.even
2:
	n3
L204:
	ivx; .chn
	c; 1
	b1
	n11
7:

.globl .getw
.getw:
	.+2
	s; 12
	va; 10
	c; 0
	b1
	iva; 4
	c; 0
	b1
L205:
	iva; 6
	x; .getchar
	n1
	b1
	c; 40
	b5
	f; L206
	ia; 6
	c; 55
	b4
	f; L207
	iva; 10
	c; 1
	b1
	t; L210
L207:
	iva; 4
	a; 4
	c; 10
	b17
	a; 6
	b14
	c; 60
	b15
	b1
L210:
	t; L205
L206:
	ia; 10
	f; L211
	iva; 4
	a; 4
	u2
	b1
L211:
	ia; 4
	n7
	n11
7:

.globl .readsym
.readsym:
	.+2
	s; 12
	va; 6
	c; 0
	b1
L212:
	iva; 10
	x; .getchar
	n1
	b1
	c; 40
	b5
	f; L213
	ix; .lchar
	n2
	a; 4
	va; 6
	u7
	a; 10
	n3
	t; L212
L213:
L214:
	ia; 6
	x; .namsiz
	b7
	f; L215
	ix; .lchar
	n2
	a; 4
	va; 6
	u7
	c; 0
	n3
	t; L214
L215:
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
L216:
	iva; 4
	u10
	f; L217
	ivx; .blockp
	u7
	va; 22
	u7
	u3
	b1
	t; L216
L217:
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
