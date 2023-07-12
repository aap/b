	jmp 9f

.globl .main
.main:
	.+2
	s; 4
	x; .argv
	c; 0
	n4
	c; 3
	b7
	f; L1
	ix; .write
	n2
	c; 1
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
	c; 12
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
	ix; .write
	n2
	c; 1
	vx; 1f
	t; 2f
1:
67111
72560
20164
64546
62554
5077
0
2:
	c; 14
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
	ix; .write
	n2
	c; 1
	vx; 1f
	t; 2f
1:
72517
70164
72165
63040
66151
37545
12
2:
	c; 15
	n3
	ix; .exit
	n2
	c; 1
	n3
L3:
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
72541
67564
0
2:
	c; 4
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
74145
71164
156
2:
	c; 3
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
67547
67564
0
2:
	c; 6
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
62562
72564
67162
0
2:
	c; 7
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
63151
0
2:
	c; 10
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
64167
66151
145
2:
	c; 11
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
66145
62563
0
2:
	c; 12
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
73563
72151
64143
0
2:
	c; 13
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
60543
62563
0
2:
	c; 14
	n3
L4:
	ix; .eof
	u4
	f; L5
	ix; .extdef
	n1
	ix; .enddef
	n1
	t; L4
L5:
	ix; .exit
	n2
	x; .nerror
	c; 0
	b5
	n3
	n11
7:

.globl .keyw
.keyw:
	.+2
	s; 22
	va; 10
	x; .namsiz
	b1
	iva; 12
	va; 14
	c; 0
	b1
	b1
L6:
	iva; 10
	u10
	f; L7
	ix; .lchar
	n2
	x; .symbuf
	va; 12
	u7
	va; 16
	x; .char
	n2
	a; 4
	va; 14
	u7
	n3
	b1
	n3
	ia; 16
	c; 0
	b4
	f; L10
	iva; 14
	u10
L10:
	t; L6
L7:
	iva; 20
	x; .lookup
	n1
	b1
	ia; 20
	c; 0
	b14
	c; 1
	b1
	ia; 20
	c; 1
	b14
	a; 6
	b1
	n11
7:

.globl .extdef
.extdef:
	.+2
	s; 12
	va; 4
	x; .symbol
	n1
	b1
	c; 0
	b4
	a; 4
	c; 12
	b4
	b2
	f; L11
	n11
L11:
	ia; 4
	c; 17
	b5
	f; L12
	ix; 7f+0
	n6
L12:
	ix; .csym
	c; 0
	b14
	c; 3
	b1
	ix; .gensym
	n2
	c; 147
	x; .csym
	c; 2
	b14
	n3
	iva; 10
	c; 1
	b1
	ivx; .peeksym
	x; .symbol
	n1
	b1
	c; 6
	b4
	f; L14
	ivx; .peeksym
	c; -1
	b1
	iva; 10
	c; 0
	b1
	iva; 4
	x; .symbol
	n1
	b1
	c; 15
	b4
	f; L15
	iva; 10
	x; .cval
	b1
	iva; 4
	x; .symbol
	n1
	b1
L15:
	ia; 4
	c; 7
	b5
	f; L16
	ix; 7f+0
	n6
L16:
	ix; .gen0
	n2
	c; 166
	n3
L14:
L17:
	s; 12
	va; 4
	x; .symbol
	n1
	b1
	z; L20
L21=4
L22:
	ivx; .nauto
	c; 2
	b1
	ivx; .nlbl
	c; 0
	b1
	ix; .gen0
	n2
	c; 145
	n3
	ix; .declare
	n2
	c; 5
	n3
	ix; .gen0
	n2
	c; 123
	n3
	ix; .stmt
	n1
	ix; .gen1
	n2
	c; 156
	c; 11
	n3
	ix; .gen0
	n2
	c; 160
	n3
	iva; 6
	c; 0
	b1
L23:
	ia; 6
	x; .nlbl
	b7
	f; L24
	ix; .gen1
	n2
	c; 154
	x; .lbltab
	va; 6
	u7
	n4
	n3
	t; L23
L24:
	n11
L25=12
L26:
L27:
	s; 12
	a; 10
	c; 0
	b11
	f; L30
	ix; .gen1
	n2
	c; 162
	a; 10
	n3
L30:
	n11
L31=15
L32:
	ix; .gen1
	n2
	c; 157
	x; .cval
	n3
L33:
	s; 12
	va; 10
	u10
	iva; 4
	x; .symbol
	n1
	b1
	c; 12
	b4
	f; L34
	ix; 7f+4
	n6
L34:
	ia; 4
	c; 21
	b5
	f; L35
	ix; 7f+0
	n6
L35:
	ix; 7f+2
	n6
L36=16
L37:
	ix; .getstr
	n1
	ix; 7f+6
	n6
L40=0
L41:
	n11
	t; .+30
L20:
	5
	L21
	L22
	L25
	L26
	L31
	L32
	L36
	L37
	L40
	L41
L13:
	s; 12
	x; .err
	n2
	c; 74170
	c; 0
	n3
	ix; .errflush
	n2
	a; 4
	n3
	n11
7:
	L13
	L17
	L27
	L33

.globl .enddef
.enddef:
	.+2
	s; 6
	va; 4
	x; .symtab
	b1
L42:
	ia; 4
	x; .symtab
	x; .stablen
	b14
	b7
	f; L43
	ia; 4
	c; 2
	n4
	f; L44
	ia; 4
	c; 0
	n4
	c; 0
	b4
	f; L45
	ix; .err
	n2
	c; 72556
	a; 4
	c; 2
	b14
	n3
L45:
L44:
	ia; 4
	c; 0
	n4
	c; 1
	b5
	f; L46
	ia; 4
	c; 2
	b14
	c; 0
	b1
	ivx; .symused
	u10
L46:
	iva; 4
	x; .symsz
	b114
	t; L42
L43:
	n11
7:

.globl .declare
.declare:
	.+2
L47:
	s; 10
	va; 6
	x; .symbol
	n1
	b1
	c; 17
	b4
	f; L50
	ix; .csym
	u3
	c; 0
	b5
	f; L51
	ix; .err
	n2
	c; 71144
	x; .csym
	c; 2
	b14
	n3
L51:
	ix; .csym
	a; 4
	b1
	ia; 4
	c; 3
	b5
	f; L52
	ix; .csym
	c; 4
	b1
	ix; .csym
	c; 1
	b14
	vx; .nauto
	u7
	b1
L52:
	iva; 6
	x; .symbol
	n1
	b1
	ia; 4
	c; 4
	b4
	a; 6
	c; 15
	b4
	b3
	f; L53
	ix; .gen1
	n2
	c; 171
	x; .csym
	c; 1
	n4
	n3
	ivx; .nauto
	x; .cval
	b114
	iva; 6
	x; .symbol
	n1
	b1
L53:
	ia; 6
	c; 21
	b5
	f; L54
	ix; 7f+0
	n6
L54:
	t; L47
L50:
L55:
	s; 10
	a; 6
	c; 12
	b4
	a; 4
	c; 5
	b5
	b3
	a; 6
	c; 5
	b4
	a; 4
	c; 5
	b4
	b3
	b2
	f; L56
	n11
L56:
	ix; .err
	n2
	c; 71570
	c; 0
	n3
	ix; .errflush
	n2
	a; 6
	n3
	n11
7:
	L55

.globl .stmt
.stmt:
	.+2
	s; 20
	va; 4
	x; .symbol
	n1
	b1
	z; L57
L60=0
L61:
	ix; .err
	n2
	c; 37477
	c; 0
	n3
	n11
L62=11
L63:
	ivx; .peeksym
	a; 4
	b1
L64=12
L65:
	n11
L66=10
L67:
L70:
	ix; .eof
	u4
	f; L71
	iva; 4
	x; .symbol
	n1
	b1
	c; 11
	b4
	f; L72
	n11
L72:
	ivx; .peeksym
	a; 4
	b1
	ix; .stmt
	n1
	t; L70
L71:
	ix; .err
	n2
	c; 22051
	c; 0
	n3
	n11
L73=20
L74:
	ix; .cval
	z; L75
L76=4
L77:
L100=3
L101:
	ix; .declare
	n2
	x; .cval
	n3
	ix; .stmt
	n6
L102=6
L103:
	ix; .expr
	n1
	ix; .gen1
	n2
	c; 156
	c; 6
	n3
	ix; 7f+0
	n6
L105=7
L106:
	ivx; .peeksym
	x; .symbol
	n1
	b1
	c; 4
	b4
	f; L107
	ix; .pexpr
	n1
	ix; .gen1
	n2
	c; 156
	c; 7
	n3
	ix; 7f+0
	n6
L107:
	ix; .gen1
	n2
	c; 156
	c; 11
	n3
	ix; 7f+0
	n6
L110=10
L111:
	ix; .pexpr
	n1
	ix; .gen1
	n2
	c; 146
	va; 6
	vx; .loc
	u7
	b1
	n3
	ix; .stmt
	n1
	iva; 4
	x; .symbol
	n1
	b1
	c; 20
	b4
	x; .cval
	c; 12
	b4
	b3
	f; L112
	ix; .gen1
	n2
	c; 164
	va; 10
	vx; .loc
	u7
	b1
	n3
	ix; .label
	n2
	a; 6
	n3
	ix; .stmt
	n1
	ix; .label
	n2
	a; 10
	n3
	n11
L112:
	ivx; .peeksym
	a; 4
	b1
	ix; .label
	n2
	a; 6
	n3
	n11
L113=11
L114:
	ix; .label
	n2
	va; 6
	vx; .loc
	u7
	b1
	n3
	iva; 10
	vx; .loc
	u7
	b1
	ix; .pexpr
	n1
	ix; .gen1
	n2
	c; 146
	a; 10
	n3
	ix; .stmt
	n1
	ix; .gen1
	n2
	c; 164
	a; 6
	n3
	ix; .label
	n2
	a; 10
	n3
	n11
L115=14
L116:
	iva; 4
	x; .symbol
	n1
	b1
	c; 15
	b5
	f; L117
	ix; 7f+2
	n6
L117:
	iva; 4
	x; .symbol
	n1
	b1
	c; 22
	b5
	f; L121
	ix; 7f+2
	n6
L121:
	ix; .swp
	c; 0
	b4
	f; L122
	ix; 7f+2
	n6
L122:
	ix; .swp
	x; .swtab
	x; .swsiz
	b14
	b10
	f; L123
	ix; .err
	n2
	c; 37143
	c; 0
	n3
	ix; .exit
	n2
	c; 1
	n3
L123:
	ix; .gen2
	n2
	c; 161
	x; .loc
	x; .cval
	n3
	ivx; .swp
	u7
	vx; .loc
	u7
	b1
	ix; .label
	n2
	vx; .loc
	u7
	n3
	ix; .stmt
	n6
L124=13
L125:
	ix; .expr
	n1
	ix; .gen1
	n2
	c; 172
	va; 6
	vx; .loc
	u7
	b1
	n3
	ix; .swp
	c; 0
	b4
	f; L126
	ivx; .swp
	x; .swtab
	b1
L126:
	iva; 16
	x; .swp
	b1
	ix; .stmt
	n1
	ix; .swp
	a; 16
	b4
	f; L127
	ix; .err
	n2
	c; 71567
	c; 0
	n3
L127:
	ix; .gen1
	n2
	c; 153
	c; 1
	x; .swp
	a; 16
	b15
	c; 2
	b17
	b14
	n3
	ix; .label
	n2
	a; 6
	n3
	ix; .gen1
	n2
	c; 157
	x; .swp
	a; 16
	b15
	n3
	iva; 14
	a; 16
	b1
L130:
	ia; 14
	x; .swp
	b5
	f; L131
	ix; .gen1
	n2
	c; 154
	va; 6
	va; 14
	u7
	u3
	b1
	n3
	ix; .gen1
	n2
	c; 154
	va; 6
	u5
	n3
	t; L130
L131:
	ivx; .swp
	a; 16
	b1
	n11
	t; .+44
L75:
	10
	L76
	L77
	L100
	L101
	L102
	L103
	L105
	L106
	L110
	L111
	L113
	L114
	L115
	L116
	L124
	L125
	ix; 7f+2
	n6
L132=17
L133:
	ix; .peekc
	c; 72
	b4
	f; L134
	ivx; .peekc
	c; 0
	b1
	ix; .csym
	c; 0
	n4
	c; 0
	b11
	f; L135
	ix; .err
	n2
	c; 71144
	x; .csym
	c; 2
	b14
	n3
	ix; .stmt
	n6
L135:
	ix; .csym
	c; 0
	b14
	c; 2
	b1
	ix; .deflab
	n1
	ix; .label
	n2
	x; .lbltab
	x; .csym
	c; 1
	n4
	c; 1
	b15
	n4
	n3
	ix; .gen0
	n2
	c; 123
	n3
	ix; .stmt
	n6
L134:
	t; .+34
L57:
	6
	L60
	L61
	L62
	L63
	L64
	L65
	L66
	L67
	L73
	L74
	L132
	L133
	ivx; .peeksym
	a; 4
	b1
	ix; .expr
	n1
L104:
	s; 20
	va; 4
	x; .symbol
	n1
	b1
	c; 12
	b4
	f; L136
	n11
L136:
L120:
	s; 20
	x; .err
	n2
	c; 71570
	c; 0
	n3
	ix; .errflush
	n2
	a; 4
	n3
	ix; .stmt
	n6
	n11
7:
	L104
	L120

.globl .deflab
.deflab:
	.+2
	s; 4
	x; .csym
	c; 1
	n4
	c; 0
	b4
	f; L137
	ix; .nlbl
	x; .lblsiz
	b10
	f; L140
	ix; .err
	n2
	c; 37151
	c; 0
	n3
	ix; .exit
	n2
	c; 1
	n3
L140:
	ix; .lbltab
	x; .nlbl
	b14
	vx; .loc
	u7
	b1
	ix; .csym
	c; 1
	b14
	vx; .nlbl
	u5
	b1
L137:
	n11
7:

.globl .label
.label:
	.+2
	s; 6
	x; .gen1
	n2
	c; 114
	a; 4
	n3
	n11
7:

.globl .putw
.putw:
	.+2
	s; 6
	x; .write
	n2
	x; .fout
	va; 4
	c; 2
	n3
	n11
7:

.globl .gen0
.gen0:
	.+2
	s; 6
	x; .putchar
	n2
	a; 4
	n3
	n11
7:

.globl .gen1
.gen1:
	.+2
	s; 10
	x; .putchar
	n2
	a; 4
	n3
	ix; .putw
	n2
	a; 6
	n3
	n11
7:

.globl .gen2
.gen2:
	.+2
	s; 12
	x; .putchar
	n2
	a; 4
	n3
	ix; .putw
	n2
	a; 6
	n3
	ix; .putw
	n2
	a; 10
	n3
	n11
7:

.globl .gensym
.gensym:
	.+2
	s; 10
	x; .putchar
	n2
	a; 4
	n3
	ix; .write
	n2
	x; .fout
	a; 6
	x; .namsiz
	n3
	n11
7:

.globl .pexpr
.pexpr:
	.+2
	s; 6
	va; 4
	x; .symbol
	n1
	b1
	c; 4
	b5
	f; L141
	ix; 7f+0
	n6
L141:
	ix; .expr
	n1
	iva; 4
	x; .symbol
	n1
	b1
	c; 5
	b4
	f; L143
	n11
L143:
L142:
	s; 6
	x; .err
	n2
	c; 71570
	c; 0
	n3
	ix; .errflush
	n2
	a; 4
	n3
	n11
7:
	L142

.globl .expr
.expr:
	.+2
	y; 6
	y; 62
	s; 146
	va; 4
	a; 6
	b1
	iva; 60
	a; 62
	b1
	ia; 4
	c; 0
	b1
	ia; 60
	c; 6
	b1
	iva; 134
	c; 0
	b1
	ix; .gen1
	n2
	c; 163
	x; .nauto
	n3
L144:
	s; 146
	va; 136
	x; .symbol
	n1
	b1
	z; L145
L146=17
L147:
	ix; .csym
	u3
	c; 0
	b4
	f; L150
	ix; .peekc
	c; 50
	b4
	f; L151
	ix; .csym
	c; 0
	b14
	c; 3
	b1
	t; L152
L151:
	ix; .deflab
	n1
L152:
L150:
	ix; .csym
	u3
	z; L153
L154=3
L155:
	ix; .gensym
	n2
	c; 170
	x; .csym
	c; 2
	b14
	n3
	ix; 7f+2
	n6
L157=0
L160:
L161=2
L162:
	ix; .gen1
	n2
	c; 151
	x; .csym
	c; 1
	n4
	c; 1
	b15
	n3
	ix; 7f+2
	n6
L163=4
L164:
	ix; .gen1
	n2
	c; 141
	x; .csym
	c; 1
	n4
	n3
	ix; 7f+2
	n6
	t; .+24
L153:
	4
	L154
	L155
	L157
	L160
	L161
	L162
	L163
	L164
	ix; 7f+4
	n6
L166=15
L167:
L170:
	s; 146
	x; .gen1
	n2
	c; 143
	x; .cval
	n3
	ix; 7f+2
	n6
L171=16
L172:
	ix; .gen0
	n2
	c; 74
	n3
	ix; .getstr
	n1
	ix; .gen0
	n2
	c; 76
	n3
L156:
	s; 146
	a; 134
	f; L173
	ix; 7f+4
	n6
L173:
	iva; 134
	c; 1
	b1
	ix; 7f+0
	n6
L174=72
L175:
L176=73
L177:
	ia; 134
	f; L200
	iva; 136
	c; 2
	b114
L200:
	ix; 7f+10
	n6
L202=71
L203:
	ia; 134
	f; L204
	ix; 7f+4
	n6
L204:
	ix; 7f+10
	n6
L205=43
L206:
	ia; 134
	u4
	f; L207
	ivx; .peeksym
	x; .symbol
	n1
	b1
	c; 15
	b4
	f; L210
	ivx; .peeksym
	c; -1
	b1
	ivx; .cval
	x; .cval
	u2
	b1
	ix; 7f+6
	n6
L210:
	iva; 136
	c; 67
	b1
L207:
	iva; 134
	c; 0
	b1
	ix; 7f+10
	n6
L211=31
L212:
L213=45
L214:
	ia; 134
	f; L215
	iva; 134
	c; 0
	b1
	t; L216
L215:
	ia; 136
	c; 31
	b4
	f; L217
	iva; 136
	c; 66
	b1
	t; L220
L217:
	iva; 136
	c; 70
	b1
L220:
L216:
	ix; 7f+10
	n6
L221=4
L222:
	ia; 134
	f; L223
	iva; 136
	x; .symbol
	n1
	b1
	c; 5
	b4
	f; L224
	iva; 136
	c; 25
	b1
	t; L225
L224:
	ivx; .peeksym
	a; 136
	b1
	iva; 136
	c; 24
	b1
	iva; 134
	c; 0
	b1
L225:
L223:
	ix; 7f+10
	n6
L226=5
L227:
L230=7
L231:
	ia; 134
	u4
	f; L232
	ix; 7f+4
	n6
L232:
	ix; 7f+10
	n6
	t; .+64
L145:
	14
	L146
	L147
	L166
	L167
	L171
	L172
	L174
	L175
	L176
	L177
	L202
	L203
	L205
	L206
	L211
	L212
	L213
	L214
	L221
	L222
	L226
	L227
	L230
	L231
	ia; 134
	u4
	f; L233
	ix; 7f+4
	n6
L233:
	iva; 134
	c; 0
	b1
L201:
	s; 146
	va; 140
	x; .opdope
	a; 136
	n4
	c; 6
	b12
	c; 77
	b3
	b1
	ia; 140
	a; 60
	u3
	b11
	a; 140
	a; 60
	u3
	b4
	x; .opdope
	a; 136
	n4
	c; 2
	b3
	c; 0
	b5
	b3
	b2
	f; L234
	ia; 136
	z; L235
L236=24
L237:
	ix; .gen1
	n2
	c; 156
	c; 2
	n3
L240=4
L241:
L242=6
L243:
	iva; 140
	c; 4
	b1
	t; .+20
L235:
	3
	L236
	L237
	L240
	L241
	L242
	L243
	ia; 4
	a; 6
	c; 24
	b14
	b10
	f; L244
	ix; .err
	n2
	c; 37145
	c; 0
	n3
	ix; .exit
	n2
	c; 1
	n3
L244:
	iva; 4
	u5
	a; 136
	b1
	iva; 60
	u5
	a; 140
	b1
	ix; 7f+0
	n6
L234:
	iva; 60
	u6
	iva; 142
	va; 4
	u10
	u3
	b1
	z; L245
L246=0
L247:
	ivx; .peeksym
	a; 136
	b1
	ix; .gen0
	n2
	c; 105
	n3
	n11
L250=23
L251:
	ix; .gen1
	n2
	c; 77
	vx; .loc
	u7
	n3
	ivx; .loc
	u7
L252=22
L253:
	ix; 7f+10
	n6
L254=24
L255:
	ia; 136
	c; 5
	b5
	f; L256
	ix; 7f+4
	n6
L256:
	ix; .gen1
	n2
	c; 156
	c; 3
	n3
	ix; 7f+0
	n6
L257=25
L260:
	ix; .gen1
	n2
	c; 156
	c; 1
	n3
L261=21
L262:
	ix; 7f+10
	n6
L263=4
L264:
	ia; 136
	c; 5
	b5
	f; L265
	ix; 7f+4
	n6
L265:
	ix; 7f+0
	n6
L266=6
L267:
	ia; 136
	c; 7
	b5
	f; L270
	ix; 7f+4
	n6
L270:
	ix; .gen1
	n2
	c; 156
	c; 4
	n3
	ix; 7f+0
	n6
	t; .+44
L245:
	10
	L246
	L247
	L250
	L251
	L252
	L253
	L254
	L255
	L257
	L260
	L261
	L262
	L263
	L264
	L266
	L267
L271:
	s; 146
	a; 142
	c; 27
	b7
	f; L272
	ix; 7f+4
	n6
	t; L273
L272:
	ia; 142
	c; 46
	b6
	f; L274
	ix; .gen1
	n2
	c; 142
	a; 142
	c; 27
	b15
	c; 1
	b14
	n3
	t; L275
L274:
	ia; 142
	c; 65
	b6
	f; L276
	ix; .gen1
	n2
	c; 142
	a; 142
	c; 47
	b15
	c; 102
	b14
	n3
	t; L277
L276:
	ia; 142
	c; 75
	b6
	f; L300
	ix; .gen1
	n2
	c; 165
	a; 142
	c; 66
	b15
	c; 1
	b14
	n3
L300:
L277:
L275:
L273:
	ix; 7f+10
	n6
L165:
	s; 146
	x; .err
	n2
	c; 62570
	c; 0
	n3
	ix; .errflush
	n2
	a; 136
	n3
	n11
7:
	L144
	L156
	L165
	L170
	L201
	L271

.globl .errflush
.errflush:
	.+2
L301:
	s; 6
	a; 4
	c; 12
	b5
	a; 4
	c; 10
	b5
	b3
	a; 4
	c; 11
	b5
	b3
	f; L302
	iva; 4
	x; .symbol
	n1
	b1
	t; L301
L302:
	ivx; .peeksym
	a; 4
	b1
	n11
7:

.globl .lookup
.lookup:
	.+2
	s; 16
	va; 4
	c; 0
	b1
	iva; 12
	x; .symbuf
	b1
	iva; 6
	x; .nwps
	b1
L303:
	iva; 6
	u10
	f; L304
	iva; 4
	va; 12
	u7
	u3
	b114
	t; L303
L304:
	ia; 4
	c; 0
	b7
	f; L305
	iva; 4
	a; 4
	u2
	b1
L305:
	iva; 4
	x; .stabsz
	b116
	iva; 4
	x; .symsz
	b117
L306:
	iva; 10
	x; .symtab
	a; 4
	c; 2
	b14
	b14
	b1
	u3
	f; L307
	iva; 12
	x; .symbuf
	b1
	iva; 6
	x; .nwps
	b1
L310:
	iva; 6
	u10
	f; L311
	iva; 10
	u7
	u3
	va; 12
	u7
	u3
	b5
	f; L312
	ix; 7f+0
	n6
L312:
	t; L310
L311:
	ix; .symtab
	a; 4
	b14
	n7
L313:
	s; 16
	va; 4
	x; .symsz
	b114
	x; .stablen
	b10
	f; L314
	iva; 4
	c; 0
	b1
L314:
	t; L306
L307:
	ivx; .symused
	u5
	x; .stabsz
	b10
	f; L315
	ix; .err
	n2
	c; 37163
	c; 0
	n3
	ix; .exit
	n2
	c; 1
	n3
L315:
	iva; 14
	va; 10
	x; .symtab
	a; 4
	b14
	b1
	b1
	iva; 12
	x; .symbuf
	b1
	iva; 10
	u7
	c; 0
	b1
	iva; 10
	u7
	c; 0
	b1
	iva; 6
	x; .nwps
	b1
L316:
	iva; 6
	u10
	f; L317
	iva; 10
	u7
	va; 12
	u7
	u3
	b1
	t; L316
L317:
	ia; 14
	n7
	n11
7:
	L313

.globl .symbol
.symbol:
	.+2
L320:
	s; 12
	x; .peeksym
	c; 0
	b10
	f; L321
	iva; 6
	x; .peeksym
	b1
	ivx; .peeksym
	c; -1
	b1
	ia; 6
	n7
L321:
	iva; 6
	x; .getchr
	n1
	b1
	ix; .eof
	f; L322
	ic; 0
	n7
L322:
	iva; 6
	c; 177
	b103
	ix; .ctab
	a; 6
	n4
	z; L323
L324=1
L325:
	ix; 7f+0
	n6
L326=42
L327:
	ix; .subseq
	n2
	c; 53
	c; 42
	c; 72
	n3
	n7
L330=43
L331:
	ix; .subseq
	n2
	c; 55
	c; 43
	c; 73
	n3
	n7
L332=71
L333:
	ix; .subseq
	n2
	c; 75
	c; 71
	c; 33
	n3
	n7
L334=35
L335:
	ix; .subseq
	n2
	c; 74
	c; 0
	c; 1
	n3
	f; L336
	ic; 41
	n7
L336:
	ix; .subseq
	n2
	c; 75
	c; 35
	c; 34
	n3
	n7
L337=37
L340:
	ix; .subseq
	n2
	c; 76
	c; 0
	c; 1
	n3
	f; L341
	ic; 40
	n7
L341:
	ix; .subseq
	n2
	c; 75
	c; 37
	c; 36
	n3
	n7
L342=27
L343:
	iva; 6
	x; .getchr
	n1
	b1
	c; 75
	b4
	f; L344
	ix; .subseq
	n2
	c; 75
	c; 32
	c; 51
	n3
	n7
L344:
	ix; .ctab
	a; 6
	n4
	c; 1
	b4
	f; L345
	ic; 27
	n7
L345:
	ix; .ungetchr
	n2
	a; 6
	n3
	iva; 6
	x; .symbol
	n1
	b1
	ia; 6
	c; 30
	b10
	a; 6
	c; 46
	b6
	b3
	f; L346
	ia; 6
	c; 30
	b15
	c; 47
	b14
	n7
L346:
	ivx; .peeksym
	a; 6
	b1
	ic; 27
	n7
L347=46
L350:
	ix; .subseq
	n2
	c; 52
	c; 1
	c; 0
	n3
	f; L351
	ic; 46
	n7
L351:
L352:
	ic; 1
	f; L353
	iva; 6
	x; .getchr
	n1
	b1
	ix; .eof
	f; L354
	ix; .err
	n2
	c; 57
	c; 0
	n3
	ic; 0
	n7
L354:
	ia; 6
	c; 52
	b4
	f; L355
	iva; 6
	x; .getchr
	n1
	b1
	ia; 6
	c; 57
	b4
	f; L356
	ix; 7f+0
	n6
L356:
L355:
	t; L352
L353:
L357=13
L360:
	ivx; .cval
	c; 0
	b1
	ia; 6
	c; 60
	b4
	f; L361
	iva; 4
	c; 10
	b1
	t; L362
L361:
	iva; 4
	c; 12
	b1
L362:
L363:
	ix; .ctab
	a; 6
	n4
	c; 13
	b4
	f; L364
	ivx; .cval
	x; .cval
	a; 4
	b17
	a; 6
	b14
	c; 60
	b15
	b1
	iva; 6
	x; .getchr
	n1
	b1
	t; L363
L364:
	ix; .ungetchr
	n2
	a; 6
	n3
	ic; 15
	n7
L365=3
L366:
	ix; .getcc
	n1
	n7
L367=14
L370:
	iva; 10
	c; 0
	b1
L371:
	ix; .ctab
	a; 6
	n4
	c; 14
	b4
	x; .ctab
	a; 6
	n4
	c; 13
	b4
	b2
	f; L372
	ia; 10
	x; .namsiz
	b7
	f; L373
	ix; .lchar
	n2
	x; .symbuf
	va; 10
	u7
	a; 6
	n3
L373:
	iva; 6
	x; .getchr
	n1
	b1
	t; L371
L372:
L374:
	ia; 10
	x; .namsiz
	b7
	f; L375
	ix; .lchar
	n2
	x; .symbuf
	va; 10
	u7
	c; 0
	n3
	t; L374
L375:
	ix; .ungetchr
	n2
	a; 6
	n3
	ivx; .csym
	x; .lookup
	n1
	b1
	ix; .csym
	c; 0
	n4
	c; 1
	b4
	f; L376
	ivx; .cval
	x; .csym
	c; 1
	n4
	b1
	ic; 20
	n7
L376:
	ic; 17
	n7
	t; .+60
L323:
	13
	L324
	L325
	L326
	L327
	L330
	L331
	L332
	L333
	L334
	L335
	L337
	L340
	L342
	L343
	L347
	L350
	L357
	L360
	L365
	L366
	L367
	L370
	ix; .ctab
	a; 6
	n4
	n7
	n11
7:
	L320

.globl .subseq
.subseq:
	.+2
	s; 14
	va; 12
	x; .getchr
	n1
	b1
	a; 4
	b4
	f; L377
	ia; 10
	n7
L377:
	ix; .ungetchr
	n2
	a; 12
	n3
	ia; 6
	n7
	n11
7:

.globl .getstr
.getstr:
	.+2
	s; 12
	va; 10
	va; 6
	c; 0
	b1
	b1
L400:
	iva; 4
	x; .mapch
	n2
	c; 42
	n3
	b1
	c; 0
	b10
	f; L401
	ix; .lchar
	n2
	va; 10
	va; 6
	u7
	a; 4
	n3
	ia; 6
	c; 2
	b4
	f; L402
	ix; .gen1
	n2
	c; 157
	a; 10
	n3
	iva; 10
	va; 6
	c; 0
	b1
	b1
L402:
	t; L400
L401:
	ix; .gen1
	n2
	c; 157
	a; 10
	n3
	n11
7:

.globl .getcc
.getcc:
	.+2
	s; 10
	va; 6
	c; 0
	b1
	ivx; .cval
	c; 0
	b1
L403:
	iva; 4
	x; .mapch
	n2
	c; 47
	n3
	b1
	c; 0
	b10
	f; L404
	ivx; .cval
	x; .cval
	c; 10
	b13
	a; 4
	b14
	b1
	t; L403
L404:
	ic; 15
	n7
	n11
7:

.globl .mapch
.mapch:
	.+2
	s; 10
	va; 6
	x; .getchr
	n1
	b1
	ix; .eof
	a; 6
	c; 12
	b4
	b2
	f; L405
	ix; .err
	n2
	c; 21042
	c; 0
	n3
	ix; .ungetchr
	n2
	a; 6
	n3
	ic; -1
	n7
L405:
	ia; 6
	a; 4
	b4
	f; L406
	ic; -1
	n7
L406:
	ia; 6
	c; 52
	b4
	f; L407
	iva; 6
	x; .getchr
	n1
	b1
	ia; 6
	z; L410
L411=60
L412:
L413=145
L414:
	ic; 0
	n7
L415=164
L416:
	ic; 11
	n7
L417=156
L420:
	ic; 12
	n7
	t; .+24
L410:
	4
	L411
	L412
	L413
	L414
	L415
	L416
	L417
	L420
L407:
	ia; 6
	n7
	n11
7:

.globl .getchr
.getchr:
	.+2
	s; 6
	x; .peekc
	f; L421
	iva; 4
	x; .peekc
	b1
	ivx; .peekc
	c; 0
	b1
	t; L422
L421:
	iva; 4
	x; .getchar
	n1
	b1
L422:
	ia; 4
	c; 0
	b6
	f; L423
	ivx; .eof
	c; 1
	b1
	ic; 0
	n7
L423:
	ia; 4
	c; 12
	b4
	f; L424
	ivx; .line
	u7
L424:
	ia; 4
	n7
	n11
7:

.globl .ungetchr
.ungetchr:
	.+2
	s; 6
	a; 4
	c; 12
	b4
	f; L425
	ivx; .line
	u10
L425:
	ivx; .peekc
	a; 4
	b1
	n11
7:

.globl .prtn
.prtn:
	.+2
	s; 12
	va; 10
	a; 4
	a; 6
	b20
	b1
	f; L426
	ix; .prtn
	n2
	a; 10
	a; 6
	n3
L426:
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

.globl .err
.err:
	.+2
	s; 12
	vx; .nerror
	u7
	iva; 10
	x; .fout
	b1
	ivx; .fout
	c; 1
	b1
	ix; .prtn
	n2
	x; .line
	c; 12
	n3
	ix; .putchar
	n2
	c; 40
	n3
	ix; .putchar
	n2
	a; 4
	n3
	ia; 6
	f; L427
	ix; .putchar
	n2
	c; 40
	n3
	ix; .write
	n2
	x; .fout
	a; 6
	x; .namsiz
	n3
L427:
	ix; .putchar
	n2
	c; 12
	n3
	ivx; .fout
	a; 10
	b1
	n11
7:

.globl .symbuf
.symbuf:
	0
8:
	.=.+10

.globl .nwps
.nwps:
	4

.globl .namsiz
.namsiz:
	10

.globl .symsz
.symsz:
	6

.globl .symused
.symused:
	0

.globl .stabsz
.stabsz:
	144

.globl .stablen
.stablen:
	1130

.globl .symtab
.symtab:
	8b-2
8:
	.=.+2260

.globl .loc
.loc:
	1

.globl .swsiz
.swsiz:
	170

.globl .swtab
.swtab:
	8b-2
8:
	.=.+360

.globl .swp
.swp:
	0

.globl .nauto
.nauto:
	0

.globl .nlbl
.nlbl:
	0

.globl .lblsiz
.lblsiz:
	50

.globl .lbltab
.lbltab:
	8b-2
8:
	.=.+120

.globl .peeksym
.peeksym:
	-1

.globl .peekc
.peekc:
	0

.globl .eof
.eof:
	0

.globl .line
.line:
	1

.globl .csym
.csym:
	0

.globl .cval
.cval:
	0

.globl .nerror
.nerror:
	0

.globl .ctab
.ctab:
	8b-2
8:
	377
	377
	377
	377
	377
	377
	377
	377
	377
	1
	1
	1
	377
	1
	377
	377
	377
	377
	377
	377
	377
	377
	377
	377
	377
	377
	377
	377
	377
	377
	377
	377
	1
	71
	16
	377
	377
	44
	31
	3
	4
	5
	45
	42
	21
	43
	14
	46
	13
	13
	13
	13
	13
	13
	13
	13
	13
	13
	22
	12
	35
	27
	37
	23
	377
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	6
	377
	7
	377
	14
	377
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	14
	10
	30
	11
	377
	377

.globl .opdope
.opdope:
	8b-2
8:
	0
	0
	0
	0
	3600
	200
	3600
	200
	0
	0
	0
	0
	0
	0
	0
	0
	0
	701
	1403
	1403
	3601
	3601
	1
	1207
	1601
	2001
	2201
	2201
	2401
	2401
	2401
	2401
	2601
	2601
	3001
	3001
	3201
	3201
	3201
	1207
	1207
	1207
	1207
	1207
	1207
	1207
	1207
	1207
	1207
	1207
	1207
	1207
	1207
	1207
	3406
	3402
	3402
	3402
	3406
	3406
	3406
	3406

9:	jsr	r5,chain
	8b-2
8:
