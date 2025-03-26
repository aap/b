main() {
	extrn args;
	auto name 10;
	auto cmdstr 40;

	getarg(name,args,0);
	system(sprintf(cmdstr, "B;BC %s", name));
	system(sprintf(cmdstr, "B;BA %s", name));
	system(sprintf(cmdstr, "MIDAS MAIN_%s S", name));
	system("B;STINKB B;BDUMP");
}


system(cmd) {
	auto valstr 40;

	sprintf(valstr, ":%s*r*n%s*r*n:CONTIN*r*n", cmd, cmd);
	value(valstr);
}

strp;
stri;

sputc(c) extrn strp, stri; lchar(strp, stri++, c);

sprintf(s, fmt, x1,x2,x3,x4,x5,x6,x7,x8,x9) {
	extrn putchar, sputc, strp, stri;
	auto pc;

	strp = s;
	stri = 0;
	pc = putchar;
	putchar = sputc;
	printf(fmt, x1,x2,x3,x4,x5,x6,x7,x8,x9);
	putchar('*e');
	putchar = pc;
	return(s);
}
