RELOCATABLE
.INSRT B;B DEF

%"printn":
	.+1
	OP2 S,6
	OP2 VA,5
	OP2 C,0
	OP B1
	OP2 IA,2
	OP2 C,0
	OP B7
	OP2 F,L1
	OP2 IVA,2
	OP2 A,2
	OP U2
	OP B1
	OP2 IA,2
	OP2 C,0
	OP B7
	OP2 F,L2
	OP2 IVA,2
	OP U10
	OP2 IVA,5
	OP2 C,1
	OP B1
	OP2 T,L3
L2:
	OP2 IX,%"putchar"
	OP N2
	OP2 C,55
	OP N3
L3:
L1:
	OP2 IVA,4
	OP2 A,2
	OP2 A,3
	OP B20
	OP B1
	OP2 F,L4
	OP2 IX,%"printn"
	OP N2
	OP2 A,4
	OP2 A,3
	OP N3
L4:
	OP2 IX,%"putchar"
	OP N2
	OP2 A,2
	OP2 A,3
	OP B16
	OP2 C,60
	OP B14
	OP2 A,5
	OP B14
	OP N3
	OP N11
LL1:
END
