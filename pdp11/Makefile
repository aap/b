a.out: xx.s brt1.o brt2.o bilib.o libb.o printf.o printn.o
	as -u -o xx.o xx.s
	ld brt1.o xx.o brt2.o bilib.o libb.o printf.o printn.o

brt1.o: brt1.s
	as -u -o brt1.o brt1.s
brt2.o: brt2.s
	as -u -o brt2.o brt2.s
bilib.o: bilib.s
	as -u -o bilib.o bilib.s
libb.o: libb.s
	as -u -o libb.o libb.s
printf.o: printf.s
	as -u -o printf.o printf.s
printn.o: printn.s
	as -u -o printn.o printn.s

prf.o: prf.s
	as -u -o prf.o prf.s
