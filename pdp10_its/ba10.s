RELOCATABLE
.INSRT B;B DEF

%"main":
	.+1
	OP Y,5
	OP Y,23
	OP2 S,36
	OP2 X,%"getarg"
	OP N2
	OP2 A,23
	OP2 X,%"args"
	OP2 C,0
	OP N3
	OP2 IVA,22
	OP2 X,%"sixch"
	OP N2
	OP2 A,23
	OP N3
	OP B1
	OP2 C,0
	OP B4
	OP2 F,L1
L2:
	OP2 S,36
	OP2 X,%"error"
	OP N2
	OP2 VX,.+3
	OP2 T,LL2
-144542315044
-170443300000
LL2:
	OP N3
	OP2 IX,%"exit"
	OP N2
	OP2 C,1
	OP N3
L1:
	OP2 IVX,%"fin"
	OP2 X,%"openr"
	OP N2
	OP2 C,12
	OP2 A,22
	OP2 X,%"sixch"
	OP N2
	OP2 VX,.+3
	OP2 T,LL3
-134000000000
LL3:
	OP N3
	OP N3
	OP B1
	OP2 C,0
	OP B7
	OP2 F,L3
	OP2 IX,LL1+0
	OP N6
L3:
	OP2 IVX,%"fout"
	OP2 X,%"openw"
	OP N2
	OP2 C,13
	OP2 A,22
	OP2 X,%"sixch"
	OP N2
	OP2 VX,.+3
	OP2 T,LL4
-64000000000
LL4:
	OP N3
	OP N3
	OP B1
	OP2 C,0
	OP B7
	OP2 F,L4
	OP2 IX,LL1+0
	OP N6
L4:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL5
-265646330172
-371267636550
-353540000000
LL5:
	OP N3
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL6
272231651644
-256767542174
202110543024
0
LL6:
	OP N3
L5:
	OP2 IVA,2
	OP2 X,%"getchar"
	OP N1
	OP B1
	OP2 C,0
	OP B11
	OP2 F,L6
	OP2 IA,2
	OP2 Z,L7
L10=114
L11:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL7
-316642042754
0
LL7:
	OP2 X,%"getw"
	OP N1
	OP N3
	OP2 IX,LL1+1
	OP N6
L13=161
L14:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL10
-316642041266
-103540000000
LL10:
	OP2 X,%"getw"
	OP N1
	OP2 X,%"getw"
	OP N1
	OP N3
	OP2 IX,LL1+1
	OP N6
L15=147
L16:
	OP2 IX,%"readsym"
	OP N2
	OP2 A,5
	OP N3
	OP2 IX,%"lchar"
	OP N2
	OP2 A,5
	OP2 X,%"namsiz"
	OP2 C,0
	OP N3
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL11
51124222746
211641200000
LL11:
	OP2 A,5
	OP N3
	OP2 IX,LL1+1
	OP N6
L17=145
L20:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL12
45345330424
0
LL12:
	OP N3
	OP2 IVX,%"ilbl"
	OP2 VX,%"loc"
	OP U7
	OP B1
	OP2 IX,LL1+1
	OP N6
L21=166
L22:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL13
45345330424
0
LL13:
	OP N3
	OP2 IX,LL1+1
	OP N6
L23=154
L24:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL14
46304567424
0
LL14:
	OP2 X,%"getw"
	OP N1
	OP N3
	OP2 IX,LL1+1
	OP N6
L25=157
L26:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL15
45135705000
LL15:
	OP2 X,%"getw"
	OP N1
	OP N3
	OP2 IX,LL1+1
	OP N6
L27=162
L30:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL16
45347527126
227361200000
LL16:
	OP2 X,%"getw"
	OP N1
	OP N3
	OP2 IX,LL1+1
	OP N6
L31=160
L32:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL17
-315473210214
50000000000
LL17:
	OP2 X,%"ilbl"
	OP N3
	OP2 IX,LL1+1
	OP N6
L33=153
L34:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL20
46372031100
-256472152266
-103540000000
LL20:
	OP2 X,%"getw"
	OP N1
	OP2 C,1
	OP B14
	OP N3
	OP2 IX,LL1+1
	OP N6
L35=164
L36:
L37=146
L40:
L41=172
L42:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL21
46372031100
227065446112
-103540000000
LL21:
	OP2 A,2
	OP2 C,40
	OP B15
	OP2 X,%"getw"
	OP N1
	OP N3
	OP2 IX,LL1+1
	OP N6
L43=171
L44:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL22
46372020262
261135705000
LL22:
	OP2 X,%"getw"
	OP N1
	OP N3
	OP2 IX,LL1+1
	OP N6
L45=163
L46:
	OP2 IVX,%"stklvl"
	OP2 X,%"getw"
	OP N1
	OP B1
	OP2 IVX,%"drop"
	OP2 C,1
	OP B1
	OP2 IVX,%"blockp"
	OP2 X,%"space"
	OP B1
	OP2 IVX,%"sp"
	OP2 X,%"stack"
	OP B1
	OP2 IVX,%"ap"
	OP2 X,%"ast"
	OP B1
	OP2 IX,LL1+1
	OP N6
L47=170
L50:
	OP2 IX,%"readsym"
	OP N2
	OP2 VA,20
	OP2 X,%"blockp"
	OP B1
	OP N3
	OP2 IX,%"lchar"
	OP N2
	OP2 A,20
	OP2 X,%"namsiz"
	OP2 C,0
	OP N3
	OP2 IVX,%"blockp"
	OP2 C,10
	OP B114
	OP2 IVX,%"sp"
	OP U7
	OP2 X,%"block"
	OP N2
	OP2 C,1
	OP2 A,2
	OP2 A,20
	OP N3
	OP B1
	OP2 IX,LL1+1
	OP N6
L51=141
L52:
L53=143
L54:
L55=151
L56:
	OP2 IVX,%"sp"
	OP U7
	OP2 X,%"block"
	OP N2
	OP2 C,1
	OP2 A,2
	OP2 X,%"getw"
	OP N1
	OP N3
	OP B1
	OP2 IX,LL1+1
	OP N6
L57=74
L60:
	OP2 IVX,%"sp"
	OP U7
	OP2 VA,20
	OP2 X,%"block"
	OP N2
	OP2 C,1
	OP2 C,163
	OP2 C,0
	OP N3
	OP B1
	OP B1
	OP2 IVA,3
	OP2 VA,4
	OP2 C,0
	OP B1
	OP B1
L61:
	OP2 IVA,2
	OP2 X,%"getchar"
	OP N1
	OP B1
	OP2 C,76
	OP B5
	OP2 F,L62
	OP2 IA,2
	OP2 C,157
	OP B4
	OP2 F,L63
	OP2 IVA,2
	OP2 X,%"getw"
	OP N1
	OP B1
	OP2 IVA,3
	OP2 C,7
	OP B113
	OP2 IVA,3
	OP2 A,2
	OP B102
	OP2 IVA,4
	OP U5
	OP2 C,5
	OP B4
	OP2 F,L64
	OP2 IVX,%"blockp"
	OP U7
	OP2 A,3
	OP2 C,1
	OP B13
	OP B1
	OP2 IVA,3
	OP2 VA,4
	OP2 C,0
	OP B1
	OP B1
L64:
L63:
	OP2 T,L61
L62:
	OP2 IVA,3
	OP2 C,5
	OP2 A,4
	OP B15
	OP2 C,7
	OP B17
	OP B113
	OP2 IVX,%"blockp"
	OP U7
	OP2 A,3
	OP2 C,1
	OP B13
	OP B1
	OP2 IA,20
	OP2 C,1
	OP B14
	OP2 X,%"blockp"
	OP2 A,20
	OP B15
	OP2 C,2
	OP B15
	OP B1
	OP2 IX,LL1+1
	OP N6
L65=142
L66:
L67=165
L70:
	OP2 IX,%"build"
	OP N2
	OP2 A,2
	OP2 X,%"getw"
	OP N1
	OP N3
	OP2 IX,LL1+1
	OP N6
L71=156
L72:
	OP2 IVA,3
	OP2 X,%"getw"
	OP N1
	OP B1
	OP2 IA,3
	OP2 Z,L73
L74=1
L75:
	OP2 IX,%"sp"
	OP2 C,-1
	OP B14
	OP2 X,%"block"
	OP N2
	OP2 C,2
	OP2 C,12051
	OP2 X,%"sp"
	OP2 C,-1
	OP N4
	OP2 C,0
	OP N3
	OP B1
	OP2 IX,LL1+1
	OP N6
L76=2
L77:
	OP2 IVX,%"ap"
	OP U7
	OP2 X,%"sp"
	OP B1
	OP2 IX,LL1+1
	OP N6
L100=3
L101:
	OP2 IVA,21
	OP2 X,%"sp"
	OP B1
	OP2 IVX,%"sp"
	OP2 VA,3
	OP2 VX,%"ap"
	OP U6
	OP U3
	OP B1
	OP B1
	OP2 IVA,20
	OP2 X,%"block"
	OP N2
	OP2 C,2
	OP2 C,12051
	OP2 VX,%"sp"
	OP U6
	OP U3
	OP2 A,21
	OP2 A,3
	OP B15
	OP N3
	OP B1
L102:
	OP2 IA,3
	OP2 A,21
	OP B7
	OP2 F,L103
	OP2 IVX,%"blockp"
	OP U7
	OP2 VA,3
	OP U7
	OP U3
	OP B1
	OP2 T,L102
L103:
	OP2 IVX,%"sp"
	OP U7
	OP2 A,20
	OP B1
	OP2 IX,LL1+1
	OP N6
L104=4
L105:
	OP2 IX,%"build"
	OP N2
	OP2 C,26735
	OP N3
	OP2 IX,LL1+1
	OP N6
L106=6
L107:
L110=7
L111:
L112=11
L113:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL23
46372020234
227361200000
LL23:
	OP2 A,3
	OP N3
	OP2 IX,LL1+1
	OP N6
	OP2 T,.+20
L73:
	7
	L74
	L75
	L76
	L77
	L100
	L101
	L104
	L105
	L106
	L107
	L110
	L111
	L112
	L113
	OP2 IX,%"error"
	OP N2
	OP2 VX,.+3
	OP2 T,LL24
-106773210400
LL24:
	OP2 A,3
	OP N3
	OP2 IX,LL1+1
	OP N6
L114=77
L115:
	OP2 IVA,21
	OP2 VX,%"sp"
	OP U6
	OP U3
	OP B1
	OP2 IVA,20
	OP2 VX,%"sp"
	OP U6
	OP U3
	OP B1
	OP2 IVA,3
	OP2 VX,%"sp"
	OP U6
	OP U3
	OP B1
	OP2 IVX,%"sp"
	OP U7
	OP2 X,%"block"
	OP N2
	OP2 C,4
	OP2 A,2
	OP2 X,%"getw"
	OP N1
	OP2 A,3
	OP2 A,20
	OP2 A,21
	OP N3
	OP B1
	OP2 IX,LL1+1
	OP N6
L116=123
L117:
	OP2 IVX,%"setstk"
	OP2 C,1
	OP B1
	OP2 IX,LL1+1
	OP N6
L120=105
L121:
L122:
	OP2 IX,%"sp"
	OP2 X,%"stack"
	OP B11
	OP2 F,L123
	OP2 IX,%"cexpr"
	OP N2
	OP2 VX,%"sp"
	OP U6
	OP U3
	OP2 C,0
	OP N3
	OP2 IVX,%"drop"
	OP2 C,1
	OP B1
	OP2 T,L122
L123:
	OP2 IX,LL1+1
	OP N6
L124=12
L125:
	OP2 IX,LL1+1
	OP N6
	OP2 T,.+70
L7:
	33
	L10
	L11
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
	L60
	L65
	L66
	L67
	L70
	L71
	L72
	L114
	L115
	L116
	L117
	L120
	L121
	L124
	L125
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL25
44236567326
351004567424
0
LL25:
	OP2 A,2
	OP N3
L12:
	OP2 T,L5
L6:
	OP2 S,36
	OP2 X,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL26
-351427373000
LL26:
	OP N3
	OP N11
LL1:
	L2
	L12

%"build":
	.+1
	OP2 S,6
	OP2 A,2
	OP2 C,26735
	OP B4
	OP2 F,L126
	OP2 IX,%"build"
	OP N2
	OP2 C,142
	OP2 C,14
	OP N3
	OP2 IVA,2
	OP2 C,165
	OP B1
	OP2 IVA,3
	OP2 C,3
	OP B1
L126:
	OP2 IA,2
	OP2 Z,L127
L130=165
L131:
	OP2 IVA,4
	OP2 VX,%"sp"
	OP U6
	OP U3
	OP B1
	OP2 IA,3
	OP2 Z,L132
L133=1
L134:
	OP2 IA,4
	OP2 C,0
	OP N4
	OP2 C,165
	OP B4
	OP2 A,4
	OP2 C,1
	OP N4
	OP2 C,3
	OP B4
	OP B3
	OP2 F,L135
	OP2 IVX,%"sp"
	OP U7
	OP2 A,4
	OP2 C,2
	OP N4
	OP B1
	OP N11
L135:
	OP2 IX,LL27+0
	OP N6
L137=3
L140:
	OP2 IA,4
	OP2 C,0
	OP N4
	OP2 C,165
	OP B4
	OP2 A,4
	OP2 C,1
	OP N4
	OP2 C,1
	OP B4
	OP B3
	OP2 F,L141
	OP2 IVX,%"sp"
	OP U7
	OP2 A,4
	OP2 C,2
	OP N4
	OP B1
	OP N11
L141:
	OP2 IX,LL27+0
	OP N6
	OP2 T,.+6
L132:
	2
	L133
	L134
	L137
	L140
L136:
	OP2 S,6
	OP2 VX,%"sp"
	OP U7
	OP2 X,%"block"
	OP N2
	OP2 C,2
	OP2 A,2
	OP2 A,3
	OP2 A,4
	OP N3
	OP B1
	OP N11
L142=142
L143:
	OP2 IVX,%"sp"
	OP U6
	OP2 C,-1
	OP B14
	OP2 X,%"block"
	OP N2
	OP2 C,3
	OP2 A,2
	OP2 A,3
	OP2 X,%"sp"
	OP2 C,-1
	OP N4
	OP2 X,%"sp"
	OP U3
	OP N3
	OP B1
	OP N11
	OP2 T,.+6
L127:
	2
	L130
	L131
	L142
	L143
	OP2 IX,%"error"
	OP N2
	OP2 VX,.+3
	OP2 T,LL30
-164242611470
201134300000
LL30:
	OP2 A,2
	OP N3
	OP N11
LL27:
	L136

%"leaf":
	.+1
	OP2 S,4
	OP2 X,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL32
46372031100
0
LL32:
	OP N3
	OP2 IX,%"drop"
	OP2 F,L144
	OP2 IX,%"putchar"
	OP N2
	OP2 C,111
	OP N3
L144:
	OP2 IA,2
	OP2 F,L145
	OP2 IX,%"putchar"
	OP N2
	OP2 C,126
	OP N3
L145:
	OP2 IX,%"putchar"
	OP N2
	OP2 A,3
	OP2 C,40
	OP B15
	OP N3
	OP2 IVX,%"drop"
	OP2 C,0
	OP B1
	OP N11
LL31:

%"cexpr":
	.+1
	OP2 S,7
	OP2 X,%"setstk"
	OP2 F,L146
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL34
46372031100
-262473210354
0
LL34:
	OP2 X,%"stklvl"
	OP N3
	OP2 IVX,%"setstk"
	OP2 VX,%"drop"
	OP2 C,0
	OP B1
	OP B1
L146:
	OP2 IVA,4
	OP2 A,2
	OP2 C,1
	OP N4
	OP B1
	OP2 IA,2
	OP U3
	OP2 Z,L147
L150=143
L151:
	OP2 IA,3
	OP2 F,L152
	OP2 IX,%"error"
	OP N2
	OP2 VX,.+3
	OP2 T,LL35
-130462315062
-170473711424
50000000000
LL35:
	OP N3
L152:
	OP2 IX,%"leaf"
	OP N2
	OP2 A,3
	OP2 C,143
	OP N3
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL36
261135705000
LL36:
	OP2 A,4
	OP N3
	OP N11
L153=141
L154:
	OP2 IX,%"leaf"
	OP N2
	OP2 A,3
	OP2 C,141
	OP N3
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL37
261135705000
LL37:
	OP2 A,4
	OP N3
	OP N11
L155=151
L156:
	OP2 IX,%"leaf"
	OP N2
	OP2 A,3
	OP2 C,170
	OP N3
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL40
262311422736
255135705000
LL40:
	OP2 X,%"ilbl"
	OP2 A,4
	OP N3
	OP N11
L157=170
L160:
	OP2 IX,%"leaf"
	OP N2
	OP2 A,3
	OP2 C,170
	OP N3
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL41
261124222746
210240000000
LL41:
	OP2 A,4
	OP N3
	OP N11
L161=163
L162:
	OP2 IA,3
	OP2 F,L163
	OP2 IX,%"error"
	OP N2
	OP2 VX,.+3
	OP2 T,LL42
-130462315062
-170473711424
50000000000
LL42:
	OP N3
L163:
	OP2 IX,%"leaf"
	OP N2
	OP2 C,1
	OP2 C,170
	OP N3
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL43
261345331424
46372031100
-256466331666
-103540000000
LL43:
	OP2 VA,6
	OP2 VX,%"loc"
	OP U7
	OP B1
	OP N3
	OP2 IVA,4
	OP2 A,2
	OP2 C,1
	OP N4
	OP B1
	OP2 IVA,5
	OP2 A,2
	OP2 C,2
	OP B14
	OP B1
L164:
	OP2 IVA,4
	OP U10
	OP2 F,L165
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL44
227361200000
LL44:
	OP2 VA,5
	OP U7
	OP U3
	OP N3
	OP2 T,L164
L165:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL45
-315473210214
50000000000
LL45:
	OP2 A,6
	OP N3
	OP N11
L166=165
L167:
	OP2 IVA,5
	OP2 A,2
	OP2 C,2
	OP N4
	OP B1
	OP2 IA,4
	OP2 C,3
	OP B4
	OP2 F,L170
	OP2 IA,3
	OP2 F,L171
	OP2 IX,%"cexpr"
	OP N2
	OP2 A,2
	OP2 C,2
	OP N4
	OP2 C,0
	OP N3
	OP N11
L171:
	OP2 IA,5
	OP2 C,0
	OP N4
	OP2 C,142
	OP B4
	OP2 A,5
	OP2 C,1
	OP N4
	OP2 C,14
	OP B4
	OP B3
	OP2 F,L172
	OP2 IX,%"cexpr"
	OP N2
	OP2 A,5
	OP2 C,2
	OP N4
	OP2 C,0
	OP N3
	OP2 IX,%"cexpr"
	OP N2
	OP2 A,5
	OP2 C,3
	OP N4
	OP2 C,0
	OP N3
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL46
46372020234
320240000000
LL46:
	OP N3
	OP N11
L172:
L170:
	OP2 IA,3
	OP2 F,L173
	OP2 IX,%"error"
	OP N2
	OP2 VX,.+3
	OP2 T,LL47
-130462315062
-170473711424
50000000000
LL47:
	OP N3
L173:
	OP2 IA,4
	OP2 C,1
	OP B4
	OP2 F,L174
	OP2 IX,%"cexpr"
	OP N2
	OP2 A,5
	OP2 C,1
	OP N3
	OP N11
L174:
	OP2 IX,%"cexpr"
	OP N2
	OP2 A,5
	OP2 A,4
	OP2 C,1
	OP B4
	OP2 A,4
	OP2 C,5
	OP B10
	OP B2
	OP N3
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL50
46372020112
-162642073000
LL50:
	OP2 A,2
	OP U3
	OP2 C,40
	OP B15
	OP2 A,4
	OP N3
	OP N11
L175=142
L176:
	OP2 IA,3
	OP2 F,L177
	OP2 IX,%"error"
	OP N2
	OP2 VX,.+3
	OP2 T,LL51
-130462315062
-170473711424
50000000000
LL51:
	OP N3
L177:
	OP2 IX,%"cexpr"
	OP N2
	OP2 A,2
	OP2 C,2
	OP N4
	OP2 A,4
	OP2 C,1
	OP B4
	OP2 A,4
	OP2 C,100
	OP B10
	OP B2
	OP N3
	OP2 IX,%"cexpr"
	OP N2
	OP2 A,2
	OP2 C,3
	OP N4
	OP2 C,0
	OP N3
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL52
46372020112
-162642073000
LL52:
	OP2 A,2
	OP U3
	OP2 C,40
	OP B15
	OP2 A,4
	OP N3
	OP N11
L200=77
L201:
	OP2 IX,%"cexpr"
	OP N2
	OP2 A,2
	OP2 C,2
	OP N4
	OP2 C,0
	OP N3
	OP2 IVX,%"drop"
	OP2 C,1
	OP B1
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL53
46372031100
-346466355042
50000000000
LL53:
	OP2 A,2
	OP2 C,1
	OP N4
	OP N3
	OP2 IX,%"cexpr"
	OP N2
	OP2 A,2
	OP2 C,3
	OP N4
	OP2 C,0
	OP N3
	OP2 IVX,%"drop"
	OP2 C,1
	OP B1
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL54
46372031100
-256466355042
50000000000
LL54:
	OP2 A,2
	OP2 C,1
	OP N4
	OP2 C,1
	OP B14
	OP N3
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL55
-316642042754
0
LL55:
	OP2 A,2
	OP2 C,1
	OP N4
	OP N3
	OP2 IX,%"cexpr"
	OP N2
	OP2 A,2
	OP2 C,4
	OP N4
	OP2 C,0
	OP N3
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL56
-316642042754
0
LL56:
	OP2 A,2
	OP2 C,1
	OP N4
	OP2 C,1
	OP B14
	OP N3
	OP N11
L202=12051
L203:
	OP2 IX,%"cexpr"
	OP N2
	OP2 A,2
	OP2 C,1
	OP N4
	OP2 C,0
	OP N3
	OP2 IVA,4
	OP2 A,2
	OP2 C,2
	OP N4
	OP B1
	OP2 IA,4
	OP2 C,0
	OP B4
	OP2 F,L204
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL57
46372020234
304240000000
LL57:
	OP N3
	OP N11
L204:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL60
46372020234
310240000000
LL60:
	OP N3
	OP2 IVA,5
	OP2 A,2
	OP2 C,3
	OP B14
	OP B1
L205:
	OP2 IVA,4
	OP U10
	OP2 F,L206
	OP2 IX,%"cexpr"
	OP N2
	OP2 VA,5
	OP U7
	OP U3
	OP2 C,0
	OP N3
	OP2 T,L205
L206:
	OP2 IX,%"printf"
	OP N2
	OP2 VX,.+3
	OP2 T,LL61
46372020234
314240000000
LL61:
	OP N3
	OP N11
	OP2 T,.+24
L147:
	11
	L150
	L151
	L153
	L154
	L155
	L156
	L157
	L160
	L161
	L162
	L166
	L167
	L175
	L176
	L200
	L201
	L202
	L203
	OP2 IX,%"error"
	OP N2
	OP2 VX,.+3
	OP2 T,LL62
-50422410442
-40433710040
201134305000
LL62:
	OP2 A,2
	OP U3
	OP N3
	OP N11
LL33:

%"getw":
	.+1
	OP2 S,5
	OP2 VA,4
	OP2 C,0
	OP B1
	OP2 IVA,2
	OP2 C,0
	OP B1
L207:
	OP2 IVA,3
	OP2 X,%"getchar"
	OP N1
	OP B1
	OP2 C,40
	OP B5
	OP2 F,L210
	OP2 IA,3
	OP2 C,55
	OP B4
	OP2 F,L211
	OP2 IVA,4
	OP2 C,1
	OP B1
	OP2 T,L212
L211:
	OP2 IVA,2
	OP2 A,2
	OP2 C,10
	OP B17
	OP2 A,3
	OP B14
	OP2 C,60
	OP B15
	OP B1
L212:
	OP2 T,L207
L210:
	OP2 IA,4
	OP2 F,L213
	OP2 IVA,2
	OP2 A,2
	OP U2
	OP B1
L213:
	OP2 IA,2
	OP N7
	OP N11
LL63:

%"readsym":
	.+1
	OP2 S,5
	OP2 VA,3
	OP2 C,0
	OP B1
L214:
	OP2 IVA,4
	OP2 X,%"getchar"
	OP N1
	OP B1
	OP2 C,40
	OP B5
	OP2 F,L215
	OP2 IX,%"lchar"
	OP N2
	OP2 A,2
	OP2 VA,3
	OP U7
	OP2 A,4
	OP N3
	OP2 T,L214
L215:
L216:
	OP2 IA,3
	OP2 X,%"namsiz"
	OP B7
	OP2 F,L217
	OP2 IX,%"lchar"
	OP N2
	OP2 A,2
	OP2 VA,3
	OP U7
	OP2 C,0
	OP N3
	OP2 T,L216
L217:
	OP N11
LL64:

%"block":
	.+1
	OP2 S,12
	OP2 VA,10
	OP2 X,%"blockp"
	OP B1
	OP2 IVA,11
	OP2 VA,3
	OP B1
	OP2 IVA,2
	OP U7
L220:
	OP2 IVA,2
	OP U10
	OP2 F,L221
	OP2 IVX,%"blockp"
	OP U7
	OP2 VA,11
	OP U7
	OP U3
	OP B1
	OP2 T,L220
L221:
	OP2 IA,10
	OP N7
	OP N11
LL65:

%"error":
	.+1
	OP2 S,6
	OP2 VX,%"nerror"
	OP U7
	OP2 IVA,5
	OP2 X,%"fout"
	OP B1
	OP2 IVX,%"fout"
	OP2 C,1
	OP B1
	OP2 IX,%"printf"
	OP N2
	OP2 A,2
	OP2 A,3
	OP2 A,4
	OP N3
	OP2 IX,%"putchar"
	OP N2
	OP2 C,12
	OP N3
	OP2 IVX,%"fout"
	OP2 A,5
	OP B1
	OP N11
LL66:

%"namsiz":
	12

%"space":
	.+1
	.=.+372

%"blockp":
	.=.+1

%"nerror":
	.=.+1

%"ap":
	0

%"ast":
	.+1
	.=.+50

%"sp":
	0

%"stack":
	.+1
	.=.+50

%"ilbl":
	.=.+1

%"loc":
	1

%"stklvl":
	0

%"setstk":
	0

%"drop":
	0
END
