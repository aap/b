RELOCATABLE
.INSRT B;B DEF

%"getarg":
	.+1
	OP2 S,7
	OP2 VA,5
	OP2 C,0
	OP B1
L1:
	OP2 IVA,6
	OP2 X,%"char"
	OP N2
	OP2 A,3
	OP2 A,4
	OP N3
	OP B1
	OP2 C,40
	OP B4
	OP2 F,L2
	OP2 IVA,4
	OP U7
	OP2 T,L1
L2:
L3:
	OP2 IVA,6
	OP2 X,%"char"
	OP N2
	OP2 A,3
	OP2 VA,4
	OP U7
	OP N3
	OP B1
	OP2 C,0
	OP B5
	OP2 A,6
	OP2 C,40
	OP B5
	OP B3
	OP2 A,6
	OP2 C,11
	OP B5
	OP B3
	OP2 F,L4
	OP2 IX,%"lchar"
	OP N2
	OP2 A,2
	OP2 VA,5
	OP U7
	OP2 A,6
	OP N3
	OP2 T,L3
L4:
	OP2 IA,4
	OP N7
	OP N11
LL1:

%"sixbit":
	.+1
	OP2 S,3
	OP2 VA,2
	OP2 C,40
	OP B115
	OP2 IA,2
	OP2 C,0
	OP B7
	OP2 F,L5
	OP2 IC,0
	OP N7
L5:
	OP2 IA,2
	OP2 C,77
	OP B11
	OP2 F,L6
	OP2 IVA,2
	OP2 C,40
	OP B115
L6:
	OP2 IA,2
	OP2 C,77
	OP B3
	OP N7
	OP N11
LL2:

%"sixch":
	.+1
	OP2 S,6
	OP2 VA,5
	OP2 VA,3
	OP2 C,0
	OP B1
	OP B1
L7:
	OP2 IA,3
	OP2 C,6
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
	OP2 F,L10
	OP2 IVA,5
	OP2 X,%"sixbit"
	OP N2
	OP2 A,4
	OP N3
	OP2 C,6
	OP2 A,3
	OP B15
	OP2 C,6
	OP B17
	OP B13
	OP B114
	OP2 T,L7
L10:
	OP2 IA,5
	OP N7
	OP N11
LL3:
END
