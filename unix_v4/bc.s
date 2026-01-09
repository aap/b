	jmp 9f
.data

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
.byte 111
.byte 156
.byte 160
.byte 165
.byte 164
.byte 40
.byte 146
.byte 151
.byte 154
.byte 145
.byte 77
.byte 12
.byte 0
.even
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
	c; 666
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
.byte 117
.byte 165
.byte 164
.byte 160
.byte 165
.byte 164
.byte 40
.byte 146
.byte 151
.byte 154
.byte 145
.byte 77
.byte 12
.byte 0
.even
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
.byte 141
.byte 165
.byte 164
.byte 157
.byte 0
.even
2:
	c; 4
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
.byte 145
.byte 170
.byte 164
.byte 162
.byte 156
.byte 0
.even
2:
	c; 3
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
.byte 147
.byte 157
.byte 164
.byte 157
.byte 0
.even
2:
	c; 6
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
.byte 162
.byte 145
.byte 164
.byte 165
.byte 162
.byte 156
.byte 0
.even
2:
	c; 7
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
.byte 151
.byte 146
.byte 0
.even
2:
	c; 10
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
.byte 167
.byte 150
.byte 151
.byte 154
.byte 145
.byte 0
.even
2:
	c; 11
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
.byte 145
.byte 154
.byte 163
.byte 145
.byte 0
.even
2:
	c; 12
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
.byte 163
.byte 167
.byte 151
.byte 164
.byte 143
.byte 150
.byte 0
.even
2:
	c; 13
	n3
	ix; .keyw
	n2
	vx; 1f
	t; 2f
1:
.byte 143
.byte 141
.byte 163
.byte 145
.byte 0
.even
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
	c; 36170
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
	c; 35356
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
	c; 34544
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
	c; 34770
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
	c; 17677
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
	c; 11051
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
	c; 17543
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
	c; 34767
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
	c; 34544
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
	c; 34770
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
	c; 17551
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
	a; 4
	c; 0
	b7
	f; L141
	ix; .putchar
	n2
	c; 55
	n3
L141:
	ix; .prtn
	n2
	a; 4
	c; 10
	n3
	ix; .putchar
	n2
	c; 40
	n3
	n11
7:

.globl .putsym
.putsym:
	.+2
	s; 12
	va; 6
	c; 0
	b1
L142:
	ia; 6
	x; .namsiz
	b7
	va; 10
	x; .char
	n2
	a; 4
	va; 6
	u7
	n3
	b1
	c; 0
	b5
	b3
	f; L143
	ix; .putchar
	n2
	a; 10
	n3
	t; L142
L143:
	ix; .putchar
	n2
	c; 40
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
	ix; .putchar
	n2
	c; 12
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
	ix; .putchar
	n2
	c; 12
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
	ix; .putchar
	n2
	c; 12
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
	ix; .putsym
	n2
	a; 6
	n3
	ix; .putchar
	n2
	c; 12
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
	f; L144
	ix; 7f+0
	n6
L144:
	ix; .expr
	n1
	iva; 4
	x; .symbol
	n1
	b1
	c; 5
	b4
	f; L146
	n11
L146:
L145:
	s; 6
	x; .err
	n2
	c; 34770
	c; 0
	n3
	ix; .errflush
	n2
	a; 4
	n3
	n11
7:
	L145

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
L147:
	s; 146
	va; 136
	x; .symbol
	n1
	b1
	z; L150
L151=17
L152:
	ix; .csym
	u3
	c; 0
	b4
	f; L153
	ix; .peekc
	c; 50
	b4
	f; L154
	ix; .csym
	c; 0
	b14
	c; 3
	b1
	t; L155
L154:
	ix; .deflab
	n1
L155:
L153:
	ix; .csym
	u3
	z; L156
L157=3
L160:
	ix; .gensym
	n2
	c; 170
	x; .csym
	c; 2
	b14
	n3
	ix; 7f+2
	n6
L162=0
L163:
L164=2
L165:
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
L166=4
L167:
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
L156:
	4
	L157
	L160
	L162
	L163
	L164
	L165
	L166
	L167
	ix; 7f+4
	n6
L171=15
L172:
L173:
	s; 146
	x; .gen1
	n2
	c; 143
	x; .cval
	n3
	ix; 7f+2
	n6
L174=16
L175:
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
L161:
	s; 146
	a; 134
	f; L176
	ix; 7f+4
	n6
L176:
	iva; 134
	c; 1
	b1
	ix; 7f+0
	n6
L177=72
L200:
L201=73
L202:
	ia; 134
	f; L203
	iva; 136
	c; 2
	b114
L203:
	ix; 7f+10
	n6
L205=71
L206:
	ia; 134
	f; L207
	ix; 7f+4
	n6
L207:
	ix; 7f+10
	n6
L210=43
L211:
	ia; 134
	u4
	f; L212
	ivx; .peeksym
	x; .symbol
	n1
	b1
	c; 15
	b4
	f; L213
	ivx; .peeksym
	c; -1
	b1
	ivx; .cval
	x; .cval
	u2
	b1
	ix; 7f+6
	n6
L213:
	iva; 136
	c; 67
	b1
L212:
	iva; 134
	c; 0
	b1
	ix; 7f+10
	n6
L214=31
L215:
L216=45
L217:
	ia; 134
	f; L220
	iva; 134
	c; 0
	b1
	t; L221
L220:
	ia; 136
	c; 31
	b4
	f; L222
	iva; 136
	c; 66
	b1
	t; L223
L222:
	iva; 136
	c; 70
	b1
L223:
L221:
	ix; 7f+10
	n6
L224=4
L225:
	ia; 134
	f; L226
	iva; 136
	x; .symbol
	n1
	b1
	c; 5
	b4
	f; L227
	iva; 136
	c; 25
	b1
	t; L230
L227:
	ivx; .peeksym
	a; 136
	b1
	iva; 136
	c; 24
	b1
	iva; 134
	c; 0
	b1
L230:
L226:
	ix; 7f+10
	n6
L231=5
L232:
L233=7
L234:
	ia; 134
	u4
	f; L235
	ix; 7f+4
	n6
L235:
	ix; 7f+10
	n6
	t; .+64
L150:
	14
	L151
	L152
	L171
	L172
	L174
	L175
	L177
	L200
	L201
	L202
	L205
	L206
	L210
	L211
	L214
	L215
	L216
	L217
	L224
	L225
	L231
	L232
	L233
	L234
	ia; 134
	u4
	f; L236
	ix; 7f+4
	n6
L236:
	iva; 134
	c; 0
	b1
L204:
	s; 146
	va; 140
	x; .opdope
	a; 136
	n4
	b1
	ia; 140
	a; 60
	u3
	b11
	a; 140
	a; 60
	u3
	b4
	a; 140
	c; 1
	b3
	c; 0
	b5
	b3
	b2
	f; L237
	ia; 136
	z; L240
L241=24
L242:
	ix; .gen1
	n2
	c; 156
	c; 2
	n3
L243=4
L244:
L245=6
L246:
	iva; 140
	c; 4
	b1
	t; .+20
L240:
	3
	L241
	L242
	L243
	L244
	L245
	L246
	ia; 4
	a; 6
	c; 24
	b14
	b10
	f; L247
	ix; .err
	n2
	c; 17545
	c; 0
	n3
	ix; .exit
	n2
	c; 1
	n3
L247:
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
L237:
	iva; 60
	u6
	iva; 142
	va; 4
	u10
	u3
	b1
	z; L250
L251=0
L252:
	ivx; .peeksym
	a; 136
	b1
	ix; .gen0
	n2
	c; 105
	n3
	n11
L253=23
L254:
	ix; .gen1
	n2
	c; 77
	vx; .loc
	u7
	n3
	ivx; .loc
	u7
L255=22
L256:
	ix; 7f+10
	n6
L257=24
L260:
	ia; 136
	c; 5
	b5
	f; L261
	ix; 7f+4
	n6
L261:
	ix; .gen1
	n2
	c; 156
	c; 3
	n3
	ix; 7f+0
	n6
L262=25
L263:
	ix; .gen1
	n2
	c; 156
	c; 1
	n3
L264=21
L265:
	ix; 7f+10
	n6
L266=4
L267:
	ia; 136
	c; 5
	b5
	f; L270
	ix; 7f+4
	n6
L270:
	ix; 7f+0
	n6
L271=6
L272:
	ia; 136
	c; 7
	b5
	f; L273
	ix; 7f+4
	n6
L273:
	ix; .gen1
	n2
	c; 156
	c; 4
	n3
	ix; 7f+0
	n6
	t; .+44
L250:
	10
	L251
	L252
	L253
	L254
	L255
	L256
	L257
	L260
	L262
	L263
	L264
	L265
	L266
	L267
	L271
	L272
L274:
	s; 146
	a; 142
	c; 27
	b7
	f; L275
	ix; 7f+4
	n6
	t; L276
L275:
	ia; 142
	c; 46
	b6
	f; L277
	ix; .gen1
	n2
	c; 142
	a; 142
	c; 27
	b15
	c; 1
	b14
	n3
	t; L300
L277:
	ia; 142
	c; 65
	b6
	f; L301
	ix; .gen1
	n2
	c; 142
	a; 142
	c; 47
	b15
	c; 102
	b14
	n3
	t; L302
L301:
	ia; 142
	c; 75
	b6
	f; L303
	ix; .gen1
	n2
	c; 165
	a; 142
	c; 66
	b15
	c; 1
	b14
	n3
L303:
L302:
L300:
L276:
	ix; 7f+10
	n6
L170:
	s; 146
	x; .err
	n2
	c; 31370
	c; 0
	n3
	ix; .errflush
	n2
	a; 136
	n3
	n11
7:
	L147
	L161
	L170
	L173
	L204
	L274

.globl .errflush
.errflush:
	.+2
L304:
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
	f; L305
	iva; 4
	x; .symbol
	n1
	b1
	t; L304
L305:
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
L306:
	iva; 6
	u10
	f; L307
	iva; 4
	va; 12
	u7
	u3
	b114
	t; L306
L307:
	ia; 4
	c; 0
	b7
	f; L310
	iva; 4
	a; 4
	u2
	b1
L310:
	iva; 4
	x; .stabsz
	b116
	iva; 4
	x; .symsz
	b117
L311:
	iva; 10
	x; .symtab
	a; 4
	c; 2
	b14
	b14
	b1
	u3
	f; L312
	iva; 12
	x; .symbuf
	b1
	iva; 6
	x; .nwps
	b1
L313:
	iva; 6
	u10
	f; L314
	iva; 10
	u7
	u3
	va; 12
	u7
	u3
	b5
	f; L315
	ix; 7f+0
	n6
L315:
	t; L313
L314:
	ix; .symtab
	a; 4
	b14
	n7
L316:
	s; 16
	va; 4
	x; .symsz
	b114
	x; .stablen
	b10
	f; L317
	iva; 4
	c; 0
	b1
L317:
	t; L311
L312:
	ivx; .symused
	u5
	x; .stabsz
	b10
	f; L320
	ix; .err
	n2
	c; 17563
	c; 0
	n3
	ix; .exit
	n2
	c; 1
	n3
L320:
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
L321:
	iva; 6
	u10
	f; L322
	iva; 10
	u7
	va; 12
	u7
	u3
	b1
	t; L321
L322:
	ia; 14
	n7
	n11
7:
	L316

.globl .symbol
.symbol:
	.+2
L323:
	s; 12
	x; .peeksym
	c; 0
	b10
	f; L324
	iva; 6
	x; .peeksym
	b1
	ivx; .peeksym
	c; -1
	b1
	ia; 6
	n7
L324:
	iva; 6
	x; .getchr
	n1
	b1
	ix; .eof
	f; L325
	ic; 0
	n7
L325:
	iva; 6
	c; 177
	b103
	ix; .ctab
	a; 6
	n4
	z; L326
L327=1
L330:
	ix; 7f+0
	n6
L331=42
L332:
	ix; .subseq
	n2
	c; 53
	c; 42
	c; 72
	n3
	n7
L333=43
L334:
	ix; .subseq
	n2
	c; 55
	c; 43
	c; 73
	n3
	n7
L335=71
L336:
	ix; .subseq
	n2
	c; 75
	c; 71
	c; 33
	n3
	n7
L337=35
L340:
	ix; .subseq
	n2
	c; 74
	c; 0
	c; 1
	n3
	f; L341
	ic; 41
	n7
L341:
	ix; .subseq
	n2
	c; 75
	c; 35
	c; 34
	n3
	n7
L342=37
L343:
	ix; .subseq
	n2
	c; 76
	c; 0
	c; 1
	n3
	f; L344
	ic; 40
	n7
L344:
	ix; .subseq
	n2
	c; 75
	c; 37
	c; 36
	n3
	n7
L345=27
L346:
	iva; 6
	x; .getchr
	n1
	b1
	c; 75
	b4
	f; L347
	ix; .subseq
	n2
	c; 75
	c; 32
	c; 51
	n3
	n7
L347:
	ix; .ctab
	a; 6
	n4
	c; 1
	b4
	f; L350
	ic; 27
	n7
L350:
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
	f; L351
	ia; 6
	c; 30
	b15
	c; 47
	b14
	n7
L351:
	ivx; .peeksym
	a; 6
	b1
	ic; 27
	n7
L352=46
L353:
	ix; .subseq
	n2
	c; 52
	c; 1
	c; 0
	n3
	f; L354
	ic; 46
	n7
L354:
L355:
	ic; 1
	f; L356
	iva; 6
	x; .getchr
	n1
	b1
	ix; .eof
	f; L357
	ix; .err
	n2
	c; 57
	c; 0
	n3
	ic; 0
	n7
L357:
	ia; 6
	c; 52
	b4
	f; L360
	iva; 6
	x; .getchr
	n1
	b1
	ia; 6
	c; 57
	b4
	f; L361
	ix; 7f+0
	n6
L361:
L360:
	t; L355
L356:
L362=13
L363:
	ivx; .cval
	c; 0
	b1
	ia; 6
	c; 60
	b4
	f; L364
	iva; 4
	c; 10
	b1
	t; L365
L364:
	iva; 4
	c; 12
	b1
L365:
L366:
	ix; .ctab
	a; 6
	n4
	c; 13
	b4
	f; L367
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
	t; L366
L367:
	ix; .ungetchr
	n2
	a; 6
	n3
	ic; 15
	n7
L370=3
L371:
	ix; .getcc
	n1
	n7
L372=14
L373:
	iva; 10
	c; 0
	b1
L374:
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
	f; L375
	ia; 10
	x; .namsiz
	b7
	f; L376
	ix; .lchar
	n2
	x; .symbuf
	va; 10
	u7
	a; 6
	n3
L376:
	iva; 6
	x; .getchr
	n1
	b1
	t; L374
L375:
L377:
	ia; 10
	x; .namsiz
	b7
	f; L400
	ix; .lchar
	n2
	x; .symbuf
	va; 10
	u7
	c; 0
	n3
	t; L377
L400:
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
	f; L401
	ivx; .cval
	x; .csym
	c; 1
	n4
	b1
	ic; 20
	n7
L401:
	ic; 17
	n7
	t; .+60
L326:
	13
	L327
	L330
	L331
	L332
	L333
	L334
	L335
	L336
	L337
	L340
	L342
	L343
	L345
	L346
	L352
	L353
	L362
	L363
	L370
	L371
	L372
	L373
	ix; .ctab
	a; 6
	n4
	n7
	n11
7:
	L323

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
	f; L402
	ia; 10
	n7
L402:
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
L403:
	s; 6
	va; 4
	x; .mapch
	n2
	c; 42
	n3
	b1
	c; 0
	b10
	f; L404
	ix; .gen1
	n2
	c; 157
	a; 4
	n3
	t; L403
L404:
	n11
7:

.globl .getcc
.getcc:
	.+2
	s; 6
	vx; .cval
	c; 0
	b1
L405:
	iva; 4
	x; .mapch
	n2
	c; 47
	n3
	b1
	c; 0
	b10
	f; L406
	ivx; .cval
	x; .cval
	x; .nbpc
	b13
	a; 4
	b14
	b1
	t; L405
L406:
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
	f; L407
	ix; .err
	n2
	c; 10442
	c; 0
	n3
	ix; .ungetchr
	n2
	a; 6
	n3
	ic; -1
	n7
L407:
	ia; 6
	a; 4
	b4
	f; L410
	ic; -1
	n7
L410:
	ia; 6
	c; 52
	b4
	f; L411
	iva; 6
	x; .getchr
	n1
	b1
	ia; 6
	z; L412
L413=60
L414:
L415=145
L416:
	ic; 0
	n7
L417=164
L420:
	ic; 11
	n7
L421=162
L422:
	ic; 15
	n7
L423=156
L424:
	ic; 12
	n7
	t; .+30
L412:
	5
	L413
	L414
	L415
	L416
	L417
	L420
	L421
	L422
	L423
	L424
L411:
	ia; 6
	n7
	n11
7:

.globl .getchr
.getchr:
	.+2
	s; 6
	x; .peekc
	f; L425
	iva; 4
	x; .peekc
	b1
	ivx; .peekc
	c; 0
	b1
	t; L426
L425:
	iva; 4
	x; .getchar
	n1
	b1
L426:
	ia; 4
	c; 0
	b6
	f; L427
	ivx; .eof
	c; 1
	b1
	ic; 0
	n7
L427:
	ia; 4
	c; 12
	b4
	f; L430
	ivx; .line
	u7
L430:
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
	f; L431
	ivx; .line
	u10
L431:
	ivx; .peekc
	a; 4
	b1
	n11
7:

.globl .prtn
.prtn:
	.+2
	s; 12
	a; 4
	c; 0
	b7
	f; L432
	iva; 4
	a; 4
	u2
	b1
L432:
	iva; 10
	a; 4
	a; 6
	b20
	b1
	f; L433
	ix; .prtn
	n2
	a; 10
	a; 6
	n3
L433:
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
	f; L434
	ix; .putchar
	n2
	c; 40
	n3
	ix; .putsym
	n2
	a; 6
	n3
L434:
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

.globl .nbpc
.nbpc:
	7

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
	36
	2
	36
	2
	0
	0
	0
	0
	0
	0
	0
	0
	0
	6
	15
	15
	36
	36
	0
	13
	16
	20
	22
	22
	24
	24
	24
	24
	26
	26
	30
	30
	32
	32
	32
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
	13
	13
	13
	13
	13
	35
	35
	35
	35
	35
	35
	35
	35

9:	jsr	r5,chain
	8b-2
8:
	jmp	0f
.text
0:
