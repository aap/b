RELOCATABLE
.INSRT B;B DEF

%"main":
	.+1
	OP Y,3
	OP2 S,16
	OP2 X,%"getarg"
	OP N2
	OP2 A,3
	OP2 X,%"args"
	OP2 C,0
	OP N3
	OP2 IVA,2
	OP2 X,%"sixch"
	OP N2
	OP2 A,3
	OP N3
	OP B1
	OP2 C,0
	OP B4
	OP2 F,L1
L2:
	OP2 S,16
	OP2 X,%"err"
	OP N2
	OP2 C,33555
	OP2 C,0
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
	OP2 A,2
	OP2 X,%"sixch"
	OP N2
	OP2 VX,.+3
	OP2 T,LL2
-170000000000
LL2:
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
	OP2 A,2
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
	OP2 F,L4
	OP2 IX,LL1+0
	OP N6
L4:
	OP2 IX,%"keyw"
	OP N2
	OP2 VX,.+3
	OP2 T,LL4
-170241310400
LL4:
	OP2 C,4
	OP N3
	OP2 IX,%"keyw"
	OP N2
	OP2 VX,.+3
	OP2 T,LL5
-150161306444
0
LL5:
	OP2 C,3
	OP N3
	OP2 IX,%"keyw"
	OP N2
	OP2 VX,.+3
	OP2 T,LL6
-140401310400
LL6:
	OP2 C,6
	OP N3
	OP2 IX,%"keyw"
	OP N2
	OP2 VX,.+3
	OP2 T,LL7
-64641305034
-110000000000
LL7:
	OP2 C,7
	OP N3
	OP2 IX,%"keyw"
	OP N2
	OP2 VX,.+3
	OP2 T,LL10
-130640000000
LL10:
	OP2 C,10
	OP N3
	OP2 IX,%"keyw"
	OP N2
	OP2 VX,.+3
	OP2 T,LL11
-40562611466
0
LL11:
	OP2 C,11
	OP N3
	OP2 IX,%"keyw"
	OP N2
	OP2 VX,.+3
	OP2 T,LL12
-150461415400
LL12:
	OP2 C,12
	OP N3
	OP2 IX,%"keyw"
	OP N2
	OP2 VX,.+3
	OP2 T,LL13
-60202605472
-140000000000
LL13:
	OP2 C,13
	OP N3
	OP2 IX,%"keyw"
	OP N2
	OP2 VX,.+3
	OP2 T,LL14
-160741415400
LL14:
	OP2 C,14
	OP N3
L5:
	OP2 IX,%"eof"
	OP U4
	OP2 F,L6
	OP2 IX,%"extdef"
	OP N1
	OP2 IX,%"enddef"
	OP N1
	OP2 T,L5
L6:
	OP2 IX,%"exit"
	OP N2
	OP2 X,%"nerror"
	OP2 C,0
	OP B5
	OP N3
	OP N11
LL1:
	L2

%"keyw":
	.+1
	OP2 S,11
	OP2 VA,4
	OP2 X,%"namsiz"
	OP B1
	OP2 IVA,5
	OP2 VA,6
	OP2 C,0
	OP B1
	OP B1
L7:
	OP2 IVA,4
	OP U10
	OP2 F,L10
	OP2 IX,%"lchar"
	OP N2
	OP2 X,%"symbuf"
	OP2 VA,5
	OP U7
	OP2 VA,7
	OP2 X,%"char"
	OP N2
	OP2 A,2
	OP2 VA,6
	OP U7
	OP N3
	OP B1
	OP N3
	OP2 IA,7
	OP2 C,0
	OP B4
	OP2 F,L11
	OP2 IVA,6
	OP U10
L11:
	OP2 T,L7
L10:
	OP2 IVA,10
	OP2 X,%"lookup"
	OP N1
	OP B1
	OP2 IA,10
	OP2 C,0
	OP B14
	OP2 C,1
	OP B1
	OP2 IA,10
	OP2 C,1
	OP B14
	OP2 A,3
	OP B1
	OP N11
LL15:

%"extdef":
	.+1
	OP2 S,5
	OP2 VA,2
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,0
	OP B4
	OP2 A,2
	OP2 C,12
	OP B4
	OP B2
	OP2 F,L12
	OP N11
L12:
	OP2 IA,2
	OP2 C,17
	OP B5
	OP2 F,L13
	OP2 IX,LL16+0
	OP N6
L13:
	OP2 IX,%"csym"
	OP2 C,0
	OP B14
	OP2 C,3
	OP B1
	OP2 IX,%"gensym"
	OP N2
	OP2 C,147
	OP2 X,%"csym"
	OP2 C,2
	OP B14
	OP N3
	OP2 IVA,4
	OP2 C,1
	OP B1
	OP2 IVX,%"peeksym"
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,6
	OP B4
	OP2 F,L15
	OP2 IVX,%"peeksym"
	OP2 C,-1
	OP B1
	OP2 IVA,4
	OP2 C,0
	OP B1
	OP2 IVA,2
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,15
	OP B4
	OP2 F,L16
	OP2 IVA,4
	OP2 X,%"cval"
	OP B1
	OP2 IVA,2
	OP2 X,%"symbol"
	OP N1
	OP B1
L16:
	OP2 IA,2
	OP2 C,7
	OP B5
	OP2 F,L17
	OP2 IX,LL16+0
	OP N6
L17:
	OP2 IX,%"gen0"
	OP N2
	OP2 C,166
	OP N3
L15:
L20:
	OP2 S,5
	OP2 VA,2
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 Z,L21
L22=4
L23:
	OP2 IVX,%"nauto"
	OP2 C,2
	OP B1
	OP2 IVX,%"nlbl"
	OP2 C,0
	OP B1
	OP2 IX,%"gen0"
	OP N2
	OP2 C,145
	OP N3
	OP2 IX,%"declare"
	OP N2
	OP2 C,5
	OP N3
	OP2 IX,%"gen0"
	OP N2
	OP2 C,123
	OP N3
	OP2 IX,%"stmt"
	OP N1
	OP2 IX,%"gen1"
	OP N2
	OP2 C,156
	OP2 C,11
	OP N3
	OP2 IX,%"gen0"
	OP N2
	OP2 C,160
	OP N3
	OP2 IVA,3
	OP2 C,0
	OP B1
L24:
	OP2 IA,3
	OP2 X,%"nlbl"
	OP B7
	OP2 F,L25
	OP2 IX,%"gen1"
	OP N2
	OP2 C,154
	OP2 X,%"lbltab"
	OP2 VA,3
	OP U7
	OP N4
	OP N3
	OP2 T,L24
L25:
	OP N11
L26=12
L27:
L30:
	OP2 S,5
	OP2 A,4
	OP2 C,0
	OP B11
	OP2 F,L31
	OP2 IX,%"gen1"
	OP N2
	OP2 C,162
	OP2 A,4
	OP N3
L31:
	OP N11
L32=15
L33:
	OP2 IX,%"gen1"
	OP N2
	OP2 C,157
	OP2 X,%"cval"
	OP N3
L34:
	OP2 S,5
	OP2 VA,4
	OP U10
	OP2 IVA,2
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,12
	OP B4
	OP2 F,L35
	OP2 IX,LL16+2
	OP N6
L35:
	OP2 IA,2
	OP2 C,21
	OP B5
	OP2 F,L36
	OP2 IX,LL16+0
	OP N6
L36:
	OP2 IX,LL16+1
	OP N6
L37=16
L40:
	OP2 IX,%"getstr"
	OP N1
	OP2 IX,LL16+3
	OP N6
L41=0
L42:
	OP N11
	OP2 T,.+14
L21:
	5
	L22
	L23
	L26
	L27
	L32
	L33
	L37
	L40
	L41
	L42
L14:
	OP2 S,5
	OP2 X,%"err"
	OP N2
	OP2 C,36170
	OP2 C,0
	OP N3
	OP2 IX,%"errflush"
	OP N2
	OP2 A,2
	OP N3
	OP N11
LL16:
	L14
	L20
	L30
	L34

%"enddef":
	.+1
	OP2 S,3
	OP2 VA,2
	OP2 X,%"symtab"
	OP B1
L43:
	OP2 IA,2
	OP2 X,%"symtab"
	OP2 X,%"stablen"
	OP B14
	OP B7
	OP2 F,L44
	OP2 IA,2
	OP2 C,2
	OP N4
	OP2 F,L45
	OP2 IA,2
	OP2 C,0
	OP N4
	OP2 C,0
	OP B4
	OP2 F,L46
	OP2 IX,%"err"
	OP N2
	OP2 C,35356
	OP2 A,2
	OP2 C,2
	OP B14
	OP N3
L46:
L45:
	OP2 IA,2
	OP2 C,0
	OP N4
	OP2 C,1
	OP B5
	OP2 F,L47
	OP2 IA,2
	OP2 C,2
	OP B14
	OP2 C,0
	OP B1
	OP2 IVX,%"symused"
	OP U10
L47:
	OP2 IVA,2
	OP2 X,%"symsz"
	OP B114
	OP2 T,L43
L44:
	OP N11
LL17:

%"declare":
	.+1
L50:
	OP2 S,4
	OP2 VA,3
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,17
	OP B4
	OP2 F,L51
	OP2 IX,%"csym"
	OP U3
	OP2 C,0
	OP B5
	OP2 F,L52
	OP2 IX,%"err"
	OP N2
	OP2 C,34544
	OP2 X,%"csym"
	OP2 C,2
	OP B14
	OP N3
L52:
	OP2 IX,%"csym"
	OP2 A,2
	OP B1
	OP2 IA,2
	OP2 C,3
	OP B5
	OP2 F,L53
	OP2 IX,%"csym"
	OP2 C,4
	OP B1
	OP2 IX,%"csym"
	OP2 C,1
	OP B14
	OP2 VX,%"nauto"
	OP U7
	OP B1
L53:
	OP2 IVA,3
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 IA,2
	OP2 C,4
	OP B4
	OP2 A,3
	OP2 C,15
	OP B4
	OP B3
	OP2 F,L54
	OP2 IX,%"gen1"
	OP N2
	OP2 C,171
	OP2 X,%"csym"
	OP2 C,1
	OP N4
	OP N3
	OP2 IVX,%"nauto"
	OP2 X,%"cval"
	OP B114
	OP2 IVA,3
	OP2 X,%"symbol"
	OP N1
	OP B1
L54:
	OP2 IA,3
	OP2 C,21
	OP B5
	OP2 F,L55
	OP2 IX,LL20+0
	OP N6
L55:
	OP2 T,L50
L51:
L56:
	OP2 S,4
	OP2 A,3
	OP2 C,12
	OP B4
	OP2 A,2
	OP2 C,5
	OP B5
	OP B3
	OP2 A,3
	OP2 C,5
	OP B4
	OP2 A,2
	OP2 C,5
	OP B4
	OP B3
	OP B2
	OP2 F,L57
	OP N11
L57:
	OP2 IX,%"err"
	OP N2
	OP2 C,34770
	OP2 C,0
	OP N3
	OP2 IX,%"errflush"
	OP N2
	OP2 A,3
	OP N3
	OP N11
LL20:
	L56

%"stmt":
	.+1
	OP2 S,10
	OP2 VA,2
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 Z,L60
L61=0
L62:
	OP2 IX,%"err"
	OP N2
	OP2 C,17677
	OP2 C,0
	OP N3
	OP N11
L63=11
L64:
	OP2 IVX,%"peeksym"
	OP2 A,2
	OP B1
L65=12
L66:
	OP N11
L67=10
L70:
L71:
	OP2 IX,%"eof"
	OP U4
	OP2 F,L72
	OP2 IVA,2
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,11
	OP B4
	OP2 F,L73
	OP N11
L73:
	OP2 IVX,%"peeksym"
	OP2 A,2
	OP B1
	OP2 IX,%"stmt"
	OP N1
	OP2 T,L71
L72:
	OP2 IX,%"err"
	OP N2
	OP2 C,11051
	OP2 C,0
	OP N3
	OP N11
L74=20
L75:
	OP2 IX,%"cval"
	OP2 Z,L76
L77=4
L100:
L101=3
L102:
	OP2 IX,%"declare"
	OP N2
	OP2 X,%"cval"
	OP N3
	OP2 IX,%"stmt"
	OP N6
L103=6
L104:
	OP2 IX,%"expr"
	OP N1
	OP2 IX,%"gen1"
	OP N2
	OP2 C,156
	OP2 C,6
	OP N3
	OP2 IX,LL21+0
	OP N6
L106=7
L107:
	OP2 IVX,%"peeksym"
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,4
	OP B4
	OP2 F,L110
	OP2 IX,%"pexpr"
	OP N1
	OP2 IX,%"gen1"
	OP N2
	OP2 C,156
	OP2 C,7
	OP N3
	OP2 IX,LL21+0
	OP N6
L110:
	OP2 IX,%"gen1"
	OP N2
	OP2 C,156
	OP2 C,11
	OP N3
	OP2 IX,LL21+0
	OP N6
L111=10
L112:
	OP2 IX,%"pexpr"
	OP N1
	OP2 IX,%"gen1"
	OP N2
	OP2 C,146
	OP2 VA,3
	OP2 VX,%"loc"
	OP U7
	OP B1
	OP N3
	OP2 IX,%"stmt"
	OP N1
	OP2 IVA,2
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,20
	OP B4
	OP2 X,%"cval"
	OP2 C,12
	OP B4
	OP B3
	OP2 F,L113
	OP2 IX,%"gen1"
	OP N2
	OP2 C,164
	OP2 VA,4
	OP2 VX,%"loc"
	OP U7
	OP B1
	OP N3
	OP2 IX,%"label"
	OP N2
	OP2 A,3
	OP N3
	OP2 IX,%"stmt"
	OP N1
	OP2 IX,%"label"
	OP N2
	OP2 A,4
	OP N3
	OP N11
L113:
	OP2 IVX,%"peeksym"
	OP2 A,2
	OP B1
	OP2 IX,%"label"
	OP N2
	OP2 A,3
	OP N3
	OP N11
L114=11
L115:
	OP2 IX,%"label"
	OP N2
	OP2 VA,3
	OP2 VX,%"loc"
	OP U7
	OP B1
	OP N3
	OP2 IVA,4
	OP2 VX,%"loc"
	OP U7
	OP B1
	OP2 IX,%"pexpr"
	OP N1
	OP2 IX,%"gen1"
	OP N2
	OP2 C,146
	OP2 A,4
	OP N3
	OP2 IX,%"stmt"
	OP N1
	OP2 IX,%"gen1"
	OP N2
	OP2 C,164
	OP2 A,3
	OP N3
	OP2 IX,%"label"
	OP N2
	OP2 A,4
	OP N3
	OP N11
L116=14
L117:
	OP2 IVA,2
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,15
	OP B5
	OP2 F,L120
	OP2 IX,LL21+1
	OP N6
L120:
	OP2 IVA,2
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,22
	OP B5
	OP2 F,L122
	OP2 IX,LL21+1
	OP N6
L122:
	OP2 IX,%"swp"
	OP2 C,0
	OP B4
	OP2 F,L123
	OP2 IX,LL21+1
	OP N6
L123:
	OP2 IX,%"swp"
	OP2 X,%"swtab"
	OP2 X,%"swsiz"
	OP B14
	OP B10
	OP2 F,L124
	OP2 IX,%"err"
	OP N2
	OP2 C,17543
	OP2 C,0
	OP N3
	OP2 IX,%"exit"
	OP N2
	OP2 C,1
	OP N3
L124:
	OP2 IX,%"gen2"
	OP N2
	OP2 C,161
	OP2 X,%"loc"
	OP2 X,%"cval"
	OP N3
	OP2 IVX,%"swp"
	OP U7
	OP2 VX,%"loc"
	OP U7
	OP B1
	OP2 IX,%"label"
	OP N2
	OP2 VX,%"loc"
	OP U7
	OP N3
	OP2 IX,%"stmt"
	OP N6
L125=13
L126:
	OP2 IX,%"expr"
	OP N1
	OP2 IX,%"gen1"
	OP N2
	OP2 C,172
	OP2 VA,3
	OP2 VX,%"loc"
	OP U7
	OP B1
	OP N3
	OP2 IX,%"swp"
	OP2 C,0
	OP B4
	OP2 F,L127
	OP2 IVX,%"swp"
	OP2 X,%"swtab"
	OP B1
L127:
	OP2 IVA,7
	OP2 X,%"swp"
	OP B1
	OP2 IX,%"stmt"
	OP N1
	OP2 IX,%"swp"
	OP2 A,7
	OP B4
	OP2 F,L130
	OP2 IX,%"err"
	OP N2
	OP2 C,34767
	OP2 C,0
	OP N3
L130:
	OP2 IX,%"gen1"
	OP N2
	OP2 C,153
	OP2 C,1
	OP2 X,%"swp"
	OP2 A,7
	OP B15
	OP2 C,2
	OP B17
	OP B14
	OP N3
	OP2 IX,%"label"
	OP N2
	OP2 A,3
	OP N3
	OP2 IX,%"gen1"
	OP N2
	OP2 C,157
	OP2 X,%"swp"
	OP2 A,7
	OP B15
	OP N3
	OP2 IVA,6
	OP2 A,7
	OP B1
L131:
	OP2 IA,6
	OP2 X,%"swp"
	OP B5
	OP2 F,L132
	OP2 IX,%"gen1"
	OP N2
	OP2 C,154
	OP2 VA,3
	OP2 VA,6
	OP U7
	OP U3
	OP B1
	OP N3
	OP2 IX,%"gen1"
	OP N2
	OP2 C,154
	OP2 VA,3
	OP U5
	OP N3
	OP2 T,L131
L132:
	OP2 IVX,%"swp"
	OP2 A,7
	OP B1
	OP N11
	OP2 T,.+22
L76:
	10
	L77
	L100
	L101
	L102
	L103
	L104
	L106
	L107
	L111
	L112
	L114
	L115
	L116
	L117
	L125
	L126
	OP2 IX,LL21+1
	OP N6
L133=17
L134:
	OP2 IX,%"peekc"
	OP2 C,72
	OP B4
	OP2 F,L135
	OP2 IVX,%"peekc"
	OP2 C,0
	OP B1
	OP2 IX,%"csym"
	OP2 C,0
	OP N4
	OP2 C,0
	OP B11
	OP2 F,L136
	OP2 IX,%"err"
	OP N2
	OP2 C,34544
	OP2 X,%"csym"
	OP2 C,2
	OP B14
	OP N3
	OP2 IX,%"stmt"
	OP N6
L136:
	OP2 IX,%"csym"
	OP2 C,0
	OP B14
	OP2 C,2
	OP B1
	OP2 IX,%"deflab"
	OP N1
	OP2 IX,%"label"
	OP N2
	OP2 X,%"lbltab"
	OP2 X,%"csym"
	OP2 C,1
	OP N4
	OP2 C,1
	OP B15
	OP N4
	OP N3
	OP2 IX,%"gen0"
	OP N2
	OP2 C,123
	OP N3
	OP2 IX,%"stmt"
	OP N6
L135:
	OP2 T,.+16
L60:
	6
	L61
	L62
	L63
	L64
	L65
	L66
	L67
	L70
	L74
	L75
	L133
	L134
	OP2 IVX,%"peeksym"
	OP2 A,2
	OP B1
	OP2 IX,%"expr"
	OP N1
L105:
	OP2 S,10
	OP2 VA,2
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,12
	OP B4
	OP2 F,L137
	OP N11
L137:
L121:
	OP2 S,10
	OP2 X,%"err"
	OP N2
	OP2 C,34770
	OP2 C,0
	OP N3
	OP2 IX,%"errflush"
	OP N2
	OP2 A,2
	OP N3
	OP2 IX,%"stmt"
	OP N6
	OP N11
LL21:
	L105
	L121

%"deflab":
	.+1
	OP2 S,2
	OP2 X,%"csym"
	OP2 C,1
	OP N4
	OP2 C,0
	OP B4
	OP2 F,L140
	OP2 IX,%"nlbl"
	OP2 X,%"lblsiz"
	OP B10
	OP2 F,L141
	OP2 IX,%"err"
	OP N2
	OP2 C,17551
	OP2 C,0
	OP N3
	OP2 IX,%"exit"
	OP N2
	OP2 C,1
	OP N3
L141:
	OP2 IX,%"lbltab"
	OP2 X,%"nlbl"
	OP B14
	OP2 VX,%"loc"
	OP U7
	OP B1
	OP2 IX,%"csym"
	OP2 C,1
	OP B14
	OP2 VX,%"nlbl"
	OP U5
	OP B1
L140:
	OP N11
LL22:

%"label":
	.+1
	OP2 S,3
	OP2 X,%"gen1"
	OP N2
	OP2 C,114
	OP2 A,2
	OP N3
	OP N11
LL23:

%"putw":
	.+1
	OP2 S,3
	OP2 A,2
	OP2 C,0
	OP B7
	OP2 F,L142
	OP2 IX,%"putchar"
	OP N2
	OP2 C,55
	OP N3
L142:
	OP2 IX,%"prtn"
	OP N2
	OP2 A,2
	OP2 C,10
	OP N3
	OP2 IX,%"putchar"
	OP N2
	OP2 C,40
	OP N3
	OP N11
LL24:

%"putsym":
	.+1
	OP2 S,5
	OP2 VA,3
	OP2 C,0
	OP B1
L143:
	OP2 IA,3
	OP2 X,%"namsiz"
	OP B7
	OP2 VA,4
	OP2 X,%"char"
	OP N2
	OP2 A,2
	OP2 VA,3
	OP U7
	OP N3
	OP B1
	OP2 C,0
	OP B5
	OP B3
	OP2 F,L144
	OP2 IX,%"putchar"
	OP N2
	OP2 A,4
	OP N3
	OP2 T,L143
L144:
	OP2 IX,%"putchar"
	OP N2
	OP2 C,40
	OP N3
	OP N11
LL25:

%"gen0":
	.+1
	OP2 S,3
	OP2 X,%"putchar"
	OP N2
	OP2 A,2
	OP N3
	OP2 IX,%"putchar"
	OP N2
	OP2 C,12
	OP N3
	OP N11
LL26:

%"gen1":
	.+1
	OP2 S,4
	OP2 X,%"putchar"
	OP N2
	OP2 A,2
	OP N3
	OP2 IX,%"putw"
	OP N2
	OP2 A,3
	OP N3
	OP2 IX,%"putchar"
	OP N2
	OP2 C,12
	OP N3
	OP N11
LL27:

%"gen2":
	.+1
	OP2 S,5
	OP2 X,%"putchar"
	OP N2
	OP2 A,2
	OP N3
	OP2 IX,%"putw"
	OP N2
	OP2 A,3
	OP N3
	OP2 IX,%"putw"
	OP N2
	OP2 A,4
	OP N3
	OP2 IX,%"putchar"
	OP N2
	OP2 C,12
	OP N3
	OP N11
LL30:

%"gensym":
	.+1
	OP2 S,4
	OP2 X,%"putchar"
	OP N2
	OP2 A,2
	OP N3
	OP2 IX,%"putsym"
	OP N2
	OP2 A,3
	OP N3
	OP2 IX,%"putchar"
	OP N2
	OP2 C,12
	OP N3
	OP N11
LL31:

%"pexpr":
	.+1
	OP2 S,3
	OP2 VA,2
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,4
	OP B5
	OP2 F,L145
	OP2 IX,LL32+0
	OP N6
L145:
	OP2 IX,%"expr"
	OP N1
	OP2 IVA,2
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,5
	OP B4
	OP2 F,L147
	OP N11
L147:
L146:
	OP2 S,3
	OP2 X,%"err"
	OP N2
	OP2 C,34770
	OP2 C,0
	OP N3
	OP2 IX,%"errflush"
	OP N2
	OP2 A,2
	OP N3
	OP N11
LL32:
	L146

%"expr":
	.+1
	OP Y,3
	OP Y,31
	OP2 S,63
	OP2 VA,2
	OP2 A,3
	OP B1
	OP2 IVA,30
	OP2 A,31
	OP B1
	OP2 IA,2
	OP2 C,0
	OP B1
	OP2 IA,30
	OP2 C,6
	OP B1
	OP2 IVA,56
	OP2 C,0
	OP B1
	OP2 IX,%"gen1"
	OP N2
	OP2 C,163
	OP2 X,%"nauto"
	OP N3
L150:
	OP2 S,63
	OP2 VA,57
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 Z,L151
L152=17
L153:
	OP2 IX,%"csym"
	OP U3
	OP2 C,0
	OP B4
	OP2 F,L154
	OP2 IX,%"peekc"
	OP2 C,50
	OP B4
	OP2 F,L155
	OP2 IX,%"csym"
	OP2 C,0
	OP B14
	OP2 C,3
	OP B1
	OP2 T,L156
L155:
	OP2 IX,%"deflab"
	OP N1
L156:
L154:
	OP2 IX,%"csym"
	OP U3
	OP2 Z,L157
L160=3
L161:
	OP2 IX,%"gensym"
	OP N2
	OP2 C,170
	OP2 X,%"csym"
	OP2 C,2
	OP B14
	OP N3
	OP2 IX,LL33+1
	OP N6
L163=0
L164:
L165=2
L166:
	OP2 IX,%"gen1"
	OP N2
	OP2 C,151
	OP2 X,%"csym"
	OP2 C,1
	OP N4
	OP2 C,1
	OP B15
	OP N3
	OP2 IX,LL33+1
	OP N6
L167=4
L170:
	OP2 IX,%"gen1"
	OP N2
	OP2 C,141
	OP2 X,%"csym"
	OP2 C,1
	OP N4
	OP N3
	OP2 IX,LL33+1
	OP N6
	OP2 T,.+12
L157:
	4
	L160
	L161
	L163
	L164
	L165
	L166
	L167
	L170
	OP2 IX,LL33+2
	OP N6
L172=15
L173:
L174:
	OP2 S,63
	OP2 X,%"gen1"
	OP N2
	OP2 C,143
	OP2 X,%"cval"
	OP N3
	OP2 IX,LL33+1
	OP N6
L175=16
L176:
	OP2 IX,%"gen0"
	OP N2
	OP2 C,74
	OP N3
	OP2 IX,%"getstr"
	OP N1
	OP2 IX,%"gen0"
	OP N2
	OP2 C,76
	OP N3
L162:
	OP2 S,63
	OP2 A,56
	OP2 F,L177
	OP2 IX,LL33+2
	OP N6
L177:
	OP2 IVA,56
	OP2 C,1
	OP B1
	OP2 IX,LL33+0
	OP N6
L200=72
L201:
L202=73
L203:
	OP2 IA,56
	OP2 F,L204
	OP2 IVA,57
	OP2 C,2
	OP B114
L204:
	OP2 IX,LL33+4
	OP N6
L206=71
L207:
	OP2 IA,56
	OP2 F,L210
	OP2 IX,LL33+2
	OP N6
L210:
	OP2 IX,LL33+4
	OP N6
L211=43
L212:
	OP2 IA,56
	OP U4
	OP2 F,L213
	OP2 IVX,%"peeksym"
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,15
	OP B4
	OP2 F,L214
	OP2 IVX,%"peeksym"
	OP2 C,-1
	OP B1
	OP2 IVX,%"cval"
	OP2 X,%"cval"
	OP U2
	OP B1
	OP2 IX,LL33+3
	OP N6
L214:
	OP2 IVA,57
	OP2 C,67
	OP B1
L213:
	OP2 IVA,56
	OP2 C,0
	OP B1
	OP2 IX,LL33+4
	OP N6
L215=31
L216:
L217=45
L220:
	OP2 IA,56
	OP2 F,L221
	OP2 IVA,56
	OP2 C,0
	OP B1
	OP2 T,L222
L221:
	OP2 IA,57
	OP2 C,31
	OP B4
	OP2 F,L223
	OP2 IVA,57
	OP2 C,66
	OP B1
	OP2 T,L224
L223:
	OP2 IVA,57
	OP2 C,70
	OP B1
L224:
L222:
	OP2 IX,LL33+4
	OP N6
L225=4
L226:
	OP2 IA,56
	OP2 F,L227
	OP2 IVA,57
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 C,5
	OP B4
	OP2 F,L230
	OP2 IVA,57
	OP2 C,25
	OP B1
	OP2 T,L231
L230:
	OP2 IVX,%"peeksym"
	OP2 A,57
	OP B1
	OP2 IVA,57
	OP2 C,24
	OP B1
	OP2 IVA,56
	OP2 C,0
	OP B1
L231:
L227:
	OP2 IX,LL33+4
	OP N6
L232=5
L233:
L234=7
L235:
	OP2 IA,56
	OP U4
	OP2 F,L236
	OP2 IX,LL33+2
	OP N6
L236:
	OP2 IX,LL33+4
	OP N6
	OP2 T,.+32
L151:
	14
	L152
	L153
	L172
	L173
	L175
	L176
	L200
	L201
	L202
	L203
	L206
	L207
	L211
	L212
	L215
	L216
	L217
	L220
	L225
	L226
	L232
	L233
	L234
	L235
	OP2 IA,56
	OP U4
	OP2 F,L237
	OP2 IX,LL33+2
	OP N6
L237:
	OP2 IVA,56
	OP2 C,0
	OP B1
L205:
	OP2 S,63
	OP2 VA,60
	OP2 X,%"opdope"
	OP2 A,57
	OP N4
	OP B1
	OP2 IA,60
	OP2 A,30
	OP U3
	OP B11
	OP2 A,60
	OP2 A,30
	OP U3
	OP B4
	OP2 A,60
	OP2 C,1
	OP B3
	OP2 C,0
	OP B5
	OP B3
	OP B2
	OP2 F,L240
	OP2 IA,57
	OP2 Z,L241
L242=24
L243:
	OP2 IX,%"gen1"
	OP N2
	OP2 C,156
	OP2 C,2
	OP N3
L244=4
L245:
L246=6
L247:
	OP2 IVA,60
	OP2 C,4
	OP B1
	OP2 T,.+10
L241:
	3
	L242
	L243
	L244
	L245
	L246
	L247
	OP2 IA,2
	OP2 A,3
	OP2 C,24
	OP B14
	OP B10
	OP2 F,L250
	OP2 IX,%"err"
	OP N2
	OP2 C,17545
	OP2 C,0
	OP N3
	OP2 IX,%"exit"
	OP N2
	OP2 C,1
	OP N3
L250:
	OP2 IVA,2
	OP U5
	OP2 A,57
	OP B1
	OP2 IVA,30
	OP U5
	OP2 A,60
	OP B1
	OP2 IX,LL33+0
	OP N6
L240:
	OP2 IVA,30
	OP U6
	OP2 IVA,61
	OP2 VA,2
	OP U10
	OP U3
	OP B1
	OP2 Z,L251
L252=0
L253:
	OP2 IVX,%"peeksym"
	OP2 A,57
	OP B1
	OP2 IX,%"gen0"
	OP N2
	OP2 C,105
	OP N3
	OP N11
L254=23
L255:
	OP2 IX,%"gen1"
	OP N2
	OP2 C,77
	OP2 VX,%"loc"
	OP U7
	OP N3
	OP2 IVX,%"loc"
	OP U7
L256=22
L257:
	OP2 IX,LL33+4
	OP N6
L260=24
L261:
	OP2 IA,57
	OP2 C,5
	OP B5
	OP2 F,L262
	OP2 IX,LL33+2
	OP N6
L262:
	OP2 IX,%"gen1"
	OP N2
	OP2 C,156
	OP2 C,3
	OP N3
	OP2 IX,LL33+0
	OP N6
L263=25
L264:
	OP2 IX,%"gen1"
	OP N2
	OP2 C,156
	OP2 C,1
	OP N3
L265=21
L266:
	OP2 IX,LL33+4
	OP N6
L267=4
L270:
	OP2 IA,57
	OP2 C,5
	OP B5
	OP2 F,L271
	OP2 IX,LL33+2
	OP N6
L271:
	OP2 IX,LL33+0
	OP N6
L272=6
L273:
	OP2 IA,57
	OP2 C,7
	OP B5
	OP2 F,L274
	OP2 IX,LL33+2
	OP N6
L274:
	OP2 IX,%"gen1"
	OP N2
	OP2 C,156
	OP2 C,4
	OP N3
	OP2 IX,LL33+0
	OP N6
	OP2 T,.+22
L251:
	10
	L252
	L253
	L254
	L255
	L256
	L257
	L260
	L261
	L263
	L264
	L265
	L266
	L267
	L270
	L272
	L273
L275:
	OP2 S,63
	OP2 A,61
	OP2 C,27
	OP B7
	OP2 F,L276
	OP2 IX,LL33+2
	OP N6
	OP2 T,L277
L276:
	OP2 IA,61
	OP2 C,46
	OP B6
	OP2 F,L300
	OP2 IX,%"gen1"
	OP N2
	OP2 C,142
	OP2 A,61
	OP2 C,27
	OP B15
	OP2 C,1
	OP B14
	OP N3
	OP2 T,L301
L300:
	OP2 IA,61
	OP2 C,65
	OP B6
	OP2 F,L302
	OP2 IX,%"gen1"
	OP N2
	OP2 C,142
	OP2 A,61
	OP2 C,47
	OP B15
	OP2 C,102
	OP B14
	OP N3
	OP2 T,L303
L302:
	OP2 IA,61
	OP2 C,75
	OP B6
	OP2 F,L304
	OP2 IX,%"gen1"
	OP N2
	OP2 C,165
	OP2 A,61
	OP2 C,66
	OP B15
	OP2 C,1
	OP B14
	OP N3
L304:
L303:
L301:
L277:
	OP2 IX,LL33+4
	OP N6
L171:
	OP2 S,63
	OP2 X,%"err"
	OP N2
	OP2 C,31370
	OP2 C,0
	OP N3
	OP2 IX,%"errflush"
	OP N2
	OP2 A,57
	OP N3
	OP N11
LL33:
	L150
	L162
	L171
	L174
	L205
	L275

%"errflush":
	.+1
L305:
	OP2 S,3
	OP2 A,2
	OP2 C,12
	OP B5
	OP2 A,2
	OP2 C,10
	OP B5
	OP B3
	OP2 A,2
	OP2 C,11
	OP B5
	OP B3
	OP2 F,L306
	OP2 IVA,2
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 T,L305
L306:
	OP2 IVX,%"peeksym"
	OP2 A,2
	OP B1
	OP N11
LL34:

%"lookup":
	.+1
	OP2 S,7
	OP2 VA,2
	OP2 C,0
	OP B1
	OP2 IVA,5
	OP2 X,%"symbuf"
	OP B1
	OP2 IVA,3
	OP2 X,%"nwps"
	OP B1
L307:
	OP2 IVA,3
	OP U10
	OP2 F,L310
	OP2 IVA,2
	OP2 VA,5
	OP U7
	OP U3
	OP B114
	OP2 T,L307
L310:
	OP2 IA,2
	OP2 C,0
	OP B7
	OP2 F,L311
	OP2 IVA,2
	OP2 A,2
	OP U2
	OP B1
L311:
	OP2 IVA,2
	OP2 X,%"stabsz"
	OP B116
	OP2 IVA,2
	OP2 X,%"symsz"
	OP B117
L312:
	OP2 IVA,4
	OP2 X,%"symtab"
	OP2 A,2
	OP2 C,2
	OP B14
	OP B14
	OP B1
	OP U3
	OP2 F,L313
	OP2 IVA,5
	OP2 X,%"symbuf"
	OP B1
	OP2 IVA,3
	OP2 X,%"nwps"
	OP B1
L314:
	OP2 IVA,3
	OP U10
	OP2 F,L315
	OP2 IVA,4
	OP U7
	OP U3
	OP2 VA,5
	OP U7
	OP U3
	OP B5
	OP2 F,L316
	OP2 IX,LL35+0
	OP N6
L316:
	OP2 T,L314
L315:
	OP2 IX,%"symtab"
	OP2 A,2
	OP B14
	OP N7
L317:
	OP2 S,7
	OP2 VA,2
	OP2 X,%"symsz"
	OP B114
	OP2 X,%"stablen"
	OP B10
	OP2 F,L320
	OP2 IVA,2
	OP2 C,0
	OP B1
L320:
	OP2 T,L312
L313:
	OP2 IVX,%"symused"
	OP U5
	OP2 X,%"stabsz"
	OP B10
	OP2 F,L321
	OP2 IX,%"err"
	OP N2
	OP2 C,17563
	OP2 C,0
	OP N3
	OP2 IX,%"exit"
	OP N2
	OP2 C,1
	OP N3
L321:
	OP2 IVA,6
	OP2 VA,4
	OP2 X,%"symtab"
	OP2 A,2
	OP B14
	OP B1
	OP B1
	OP2 IVA,5
	OP2 X,%"symbuf"
	OP B1
	OP2 IVA,4
	OP U7
	OP2 C,0
	OP B1
	OP2 IVA,4
	OP U7
	OP2 C,0
	OP B1
	OP2 IVA,3
	OP2 X,%"nwps"
	OP B1
L322:
	OP2 IVA,3
	OP U10
	OP2 F,L323
	OP2 IVA,4
	OP U7
	OP2 VA,5
	OP U7
	OP U3
	OP B1
	OP2 T,L322
L323:
	OP2 IA,6
	OP N7
	OP N11
LL35:
	L317

%"symbol":
	.+1
L324:
	OP2 S,5
	OP2 X,%"peeksym"
	OP2 C,0
	OP B10
	OP2 F,L325
	OP2 IVA,3
	OP2 X,%"peeksym"
	OP B1
	OP2 IVX,%"peeksym"
	OP2 C,-1
	OP B1
	OP2 IA,3
	OP N7
L325:
	OP2 IVA,3
	OP2 X,%"getchr"
	OP N1
	OP B1
	OP2 IX,%"eof"
	OP2 F,L326
	OP2 IC,0
	OP N7
L326:
	OP2 IVA,3
	OP2 C,177
	OP B103
	OP2 IX,%"ctab"
	OP2 A,3
	OP N4
	OP2 Z,L327
L330=1
L331:
	OP2 IX,LL36+0
	OP N6
L332=42
L333:
	OP2 IX,%"subseq"
	OP N2
	OP2 C,53
	OP2 C,42
	OP2 C,72
	OP N3
	OP N7
L334=43
L335:
	OP2 IX,%"subseq"
	OP N2
	OP2 C,55
	OP2 C,43
	OP2 C,73
	OP N3
	OP N7
L336=71
L337:
	OP2 IX,%"subseq"
	OP N2
	OP2 C,75
	OP2 C,71
	OP2 C,33
	OP N3
	OP N7
L340=35
L341:
	OP2 IX,%"subseq"
	OP N2
	OP2 C,74
	OP2 C,0
	OP2 C,1
	OP N3
	OP2 F,L342
	OP2 IC,41
	OP N7
L342:
	OP2 IX,%"subseq"
	OP N2
	OP2 C,75
	OP2 C,35
	OP2 C,34
	OP N3
	OP N7
L343=37
L344:
	OP2 IX,%"subseq"
	OP N2
	OP2 C,76
	OP2 C,0
	OP2 C,1
	OP N3
	OP2 F,L345
	OP2 IC,40
	OP N7
L345:
	OP2 IX,%"subseq"
	OP N2
	OP2 C,75
	OP2 C,37
	OP2 C,36
	OP N3
	OP N7
L346=27
L347:
	OP2 IVA,3
	OP2 X,%"getchr"
	OP N1
	OP B1
	OP2 C,75
	OP B4
	OP2 F,L350
	OP2 IX,%"subseq"
	OP N2
	OP2 C,75
	OP2 C,32
	OP2 C,51
	OP N3
	OP N7
L350:
	OP2 IX,%"ctab"
	OP2 A,3
	OP N4
	OP2 C,1
	OP B4
	OP2 F,L351
	OP2 IC,27
	OP N7
L351:
	OP2 IX,%"ungetchr"
	OP N2
	OP2 A,3
	OP N3
	OP2 IVA,3
	OP2 X,%"symbol"
	OP N1
	OP B1
	OP2 IA,3
	OP2 C,30
	OP B10
	OP2 A,3
	OP2 C,46
	OP B6
	OP B3
	OP2 F,L352
	OP2 IA,3
	OP2 C,30
	OP B15
	OP2 C,47
	OP B14
	OP N7
L352:
	OP2 IVX,%"peeksym"
	OP2 A,3
	OP B1
	OP2 IC,27
	OP N7
L353=46
L354:
	OP2 IX,%"subseq"
	OP N2
	OP2 C,52
	OP2 C,1
	OP2 C,0
	OP N3
	OP2 F,L355
	OP2 IC,46
	OP N7
L355:
L356:
	OP2 IC,1
	OP2 F,L357
	OP2 IVA,3
	OP2 X,%"getchr"
	OP N1
	OP B1
	OP2 IX,%"eof"
	OP2 F,L360
	OP2 IX,%"err"
	OP N2
	OP2 C,57
	OP2 C,0
	OP N3
	OP2 IC,0
	OP N7
L360:
	OP2 IA,3
	OP2 C,52
	OP B4
	OP2 F,L361
	OP2 IVA,3
	OP2 X,%"getchr"
	OP N1
	OP B1
	OP2 IA,3
	OP2 C,57
	OP B4
	OP2 F,L362
	OP2 IX,LL36+0
	OP N6
L362:
L361:
	OP2 T,L356
L357:
L363=13
L364:
	OP2 IVX,%"cval"
	OP2 C,0
	OP B1
	OP2 IA,3
	OP2 C,60
	OP B4
	OP2 F,L365
	OP2 IVA,2
	OP2 C,10
	OP B1
	OP2 T,L366
L365:
	OP2 IVA,2
	OP2 C,12
	OP B1
L366:
L367:
	OP2 IX,%"ctab"
	OP2 A,3
	OP N4
	OP2 C,13
	OP B4
	OP2 F,L370
	OP2 IVX,%"cval"
	OP2 X,%"cval"
	OP2 A,2
	OP B17
	OP2 A,3
	OP B14
	OP2 C,60
	OP B15
	OP B1
	OP2 IVA,3
	OP2 X,%"getchr"
	OP N1
	OP B1
	OP2 T,L367
L370:
	OP2 IX,%"ungetchr"
	OP N2
	OP2 A,3
	OP N3
	OP2 IC,15
	OP N7
L371=3
L372:
	OP2 IX,%"getcc"
	OP N1
	OP N7
L373=14
L374:
	OP2 IVA,4
	OP2 C,0
	OP B1
L375:
	OP2 IX,%"ctab"
	OP2 A,3
	OP N4
	OP2 C,14
	OP B4
	OP2 X,%"ctab"
	OP2 A,3
	OP N4
	OP2 C,13
	OP B4
	OP B2
	OP2 F,L376
	OP2 IA,4
	OP2 X,%"namsiz"
	OP B7
	OP2 F,L377
	OP2 IX,%"lchar"
	OP N2
	OP2 X,%"symbuf"
	OP2 VA,4
	OP U7
	OP2 A,3
	OP N3
L377:
	OP2 IVA,3
	OP2 X,%"getchr"
	OP N1
	OP B1
	OP2 T,L375
L376:
L400:
	OP2 IA,4
	OP2 X,%"namsiz"
	OP B7
	OP2 F,L401
	OP2 IX,%"lchar"
	OP N2
	OP2 X,%"symbuf"
	OP2 VA,4
	OP U7
	OP2 C,0
	OP N3
	OP2 T,L400
L401:
	OP2 IX,%"ungetchr"
	OP N2
	OP2 A,3
	OP N3
	OP2 IVX,%"csym"
	OP2 X,%"lookup"
	OP N1
	OP B1
	OP2 IX,%"csym"
	OP2 C,0
	OP N4
	OP2 C,1
	OP B4
	OP2 F,L402
	OP2 IVX,%"cval"
	OP2 X,%"csym"
	OP2 C,1
	OP N4
	OP B1
	OP2 IC,20
	OP N7
L402:
	OP2 IC,17
	OP N7
	OP2 T,.+30
L327:
	13
	L330
	L331
	L332
	L333
	L334
	L335
	L336
	L337
	L340
	L341
	L343
	L344
	L346
	L347
	L353
	L354
	L363
	L364
	L371
	L372
	L373
	L374
	OP2 IX,%"ctab"
	OP2 A,3
	OP N4
	OP N7
	OP N11
LL36:
	L324

%"subseq":
	.+1
	OP2 S,6
	OP2 VA,5
	OP2 X,%"getchr"
	OP N1
	OP B1
	OP2 A,2
	OP B4
	OP2 F,L403
	OP2 IA,4
	OP N7
L403:
	OP2 IX,%"ungetchr"
	OP N2
	OP2 A,5
	OP N3
	OP2 IA,3
	OP N7
	OP N11
LL37:

%"getstr":
	.+1
L404:
	OP2 S,3
	OP2 VA,2
	OP2 X,%"mapch"
	OP N2
	OP2 C,42
	OP N3
	OP B1
	OP2 C,0
	OP B10
	OP2 F,L405
	OP2 IX,%"gen1"
	OP N2
	OP2 C,157
	OP2 A,2
	OP N3
	OP2 T,L404
L405:
	OP N11
LL40:

%"getcc":
	.+1
	OP2 S,3
	OP2 VX,%"cval"
	OP2 C,0
	OP B1
L406:
	OP2 IVA,2
	OP2 X,%"mapch"
	OP N2
	OP2 C,47
	OP N3
	OP B1
	OP2 C,0
	OP B10
	OP2 F,L407
	OP2 IVX,%"cval"
	OP2 X,%"cval"
	OP2 X,%"nbpc"
	OP B13
	OP2 A,2
	OP B14
	OP B1
	OP2 T,L406
L407:
	OP2 IC,15
	OP N7
	OP N11
LL41:

%"mapch":
	.+1
	OP2 S,4
	OP2 VA,3
	OP2 X,%"getchr"
	OP N1
	OP B1
	OP2 IX,%"eof"
	OP2 A,3
	OP2 C,12
	OP B4
	OP B2
	OP2 F,L410
	OP2 IX,%"err"
	OP N2
	OP2 C,10442
	OP2 C,0
	OP N3
	OP2 IX,%"ungetchr"
	OP N2
	OP2 A,3
	OP N3
	OP2 IC,-1
	OP N7
L410:
	OP2 IA,3
	OP2 A,2
	OP B4
	OP2 F,L411
	OP2 IC,-1
	OP N7
L411:
	OP2 IA,3
	OP2 C,52
	OP B4
	OP2 F,L412
	OP2 IVA,3
	OP2 X,%"getchr"
	OP N1
	OP B1
	OP2 IA,3
	OP2 Z,L413
L414=60
L415:
L416=145
L417:
	OP2 IC,0
	OP N7
L420=164
L421:
	OP2 IC,11
	OP N7
L422=162
L423:
	OP2 IC,15
	OP N7
L424=156
L425:
	OP2 IC,12
	OP N7
	OP2 T,.+14
L413:
	5
	L414
	L415
	L416
	L417
	L420
	L421
	L422
	L423
	L424
	L425
L412:
	OP2 IA,3
	OP N7
	OP N11
LL42:

%"getchr":
	.+1
	OP2 S,3
	OP2 X,%"peekc"
	OP2 F,L426
	OP2 IVA,2
	OP2 X,%"peekc"
	OP B1
	OP2 IVX,%"peekc"
	OP2 C,0
	OP B1
	OP2 T,L427
L426:
	OP2 IVA,2
	OP2 X,%"getchar"
	OP N1
	OP B1
L427:
	OP2 IA,2
	OP2 C,0
	OP B6
	OP2 F,L430
	OP2 IVX,%"eof"
	OP2 C,1
	OP B1
	OP2 IC,0
	OP N7
L430:
	OP2 IA,2
	OP2 C,12
	OP B4
	OP2 F,L431
	OP2 IVX,%"line"
	OP U7
L431:
	OP2 IA,2
	OP N7
	OP N11
LL43:

%"ungetchr":
	.+1
	OP2 S,3
	OP2 A,2
	OP2 C,12
	OP B4
	OP2 F,L432
	OP2 IVX,%"line"
	OP U10
L432:
	OP2 IVX,%"peekc"
	OP2 A,2
	OP B1
	OP N11
LL44:

%"prtn":
	.+1
	OP2 S,5
	OP2 A,2
	OP2 C,0
	OP B7
	OP2 F,L433
	OP2 IVA,2
	OP2 A,2
	OP U2
	OP B1
L433:
	OP2 IVA,4
	OP2 A,2
	OP2 A,3
	OP B20
	OP B1
	OP2 F,L434
	OP2 IX,%"prtn"
	OP N2
	OP2 A,4
	OP2 A,3
	OP N3
L434:
	OP2 IX,%"putchar"
	OP N2
	OP2 A,2
	OP2 A,3
	OP B16
	OP2 C,60
	OP B14
	OP N3
	OP N11
LL45:

%"err":
	.+1
	OP2 S,5
	OP2 VX,%"nerror"
	OP U7
	OP2 IVA,4
	OP2 X,%"fout"
	OP B1
	OP2 IVX,%"fout"
	OP2 C,1
	OP B1
	OP2 IX,%"prtn"
	OP N2
	OP2 X,%"line"
	OP2 C,12
	OP N3
	OP2 IX,%"putchar"
	OP N2
	OP2 C,40
	OP N3
	OP2 IX,%"putchar"
	OP N2
	OP2 A,2
	OP N3
	OP2 IA,3
	OP2 F,L435
	OP2 IX,%"putchar"
	OP N2
	OP2 C,40
	OP N3
	OP2 IX,%"putsym"
	OP N2
	OP2 A,3
	OP N3
L435:
	OP2 IX,%"putchar"
	OP N2
	OP2 C,12
	OP N3
	OP2 IVX,%"fout"
	OP2 A,4
	OP B1
	OP N11
LL46:

%"symbuf":
	.+1
	.=.+2

%"nwps":
	2

%"nbpc":
	7

%"namsiz":
	12

%"symsz":
	4

%"symused":
	0

%"stabsz":
	620

%"stablen":
	3100

%"symtab":
	.+1
	.=.+3100

%"loc":
	1

%"swsiz":
	170

%"swtab":
	.+1
	.=.+170

%"swp":
	0

%"nauto":
	0

%"nlbl":
	0

%"lblsiz":
	50

%"lbltab":
	.+1
	.=.+50

%"peeksym":
	-1

%"peekc":
	0

%"eof":
	0

%"line":
	1

%"csym":
	0

%"cval":
	0

%"nerror":
	0

%"ctab":
	.+1
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

%"opdope":
	.+1
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
END
��