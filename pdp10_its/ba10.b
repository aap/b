main() {
	extrn args, fout, fin;
	extrn drop, setstk, stklvl, ilbl, loc;
	extrn namsiz;
	extrn blockp, space, sp, stack;
	extrn ap, ast;
	auto o, a, i, sym 10, p, pp;
	auto filnam, name 10;

	getarg(name,args,0);
	if((filnam = sixch(name)) == 0) {
usage:
		error("filename");
		exit(1);
	}
	if((fin=openr(10, filnam, sixch("i"))) < 0)
		goto usage;
	if((fout=openw(11, filnam, sixch("s"))) < 0)
		goto usage;

	printf("RELOCATABLE*n");
	printf(".INSRT B;B DEF*n");

	while((o=getchar()) > 0) {
		switch(o) {
		case 'L':
			printf("L%o:*n", getw());
			goto cont;
		/* ln=m */
		case 'q':
			printf("L%o=%o*n", getw(), getw());
			goto cont;

		case 'g':
			readsym(sym);
			lchar(sym, namsiz, '*0');
			printf("*n%*"%s*":*n", sym);
			goto cont;
		case 'e':
			printf("*t.+1*n");
			ilbl = loc++;
			goto cont;
		case 'v':
			printf("*t.+1*n");
			goto cont;

		case 'l':
			printf("*tL%o*n", getw());
			goto cont;
		case 'o':
			printf("*t%o*n", getw());
			goto cont;
		case 'r':
			printf("*t.=.+%o*n", getw());
			goto cont;

		case 'p':
			printf("LL%o:*n", ilbl);
			goto cont;

		case 'k':
			printf("*tOP2 T,.+%o*n", getw()+1);
			goto cont;

		case 't': case 'f': case 'z':
			printf("*tOP2 %c,L%o*n", o-040, getw());
			goto cont;

		case 'y':
			printf("*tOP Y,%o*n", getw());
			goto cont;

		case 's':
			stklvl = getw();
			drop = 1;
			blockp = space;
			sp = stack;
			ap = ast;
			goto cont;

		case 'x':
			readsym(p=blockp);
			lchar(p, namsiz, '*0');
			blockp =+ 8;
			*sp++ = block(1, o, p);
			goto cont;

		case 'a':
		case 'c':
		case 'i':
			*sp++ = block(1, o, getw());
			goto cont;
		case '<':
			*sp++ = p = block(1, 's', 0);
			a = i = 0;
			while((o=getchar()) != '>')
				if(o == 'o') {
					o = getw();
					a =<< 7;
					a =| o;
					if(++i == 5) {
						*blockp++ = a<<1;
						a = i = 0;
					}
				}
			a =<< (5-i)*7;
			*blockp++ = a<<1;
			p[1] = blockp-p-2;
			goto cont;

		case 'b': case 'u':
			build(o, getw());
			goto cont;

		case 'n':
			a = getw();
			switch(a) {
			case 1:
				sp[-1] = block(2, '()', sp[-1], 0);
				goto cont;

			case 2:
				*ap++ = sp;
				goto cont;
			case 3:
				pp = sp;
				sp = a = *--ap;
				p = block(2, '()', *--sp, pp-a);
				while(a < pp)
					*blockp++ = *a++;
				*sp++ = p;
				goto cont;

			case 4:
				build('[]');
				goto cont;

			case 6: case 7: case 011:
				printf("*tOP N%o*n", a);
				goto cont;
			}
			error("n %o", a);
			goto cont;

		case '?':
			pp = *--sp;
			p = *--sp;
			a = *--sp;
			*sp++ = block(4, o, getw(), a, p, pp);
			goto cont;

		case 'S':
			setstk = 1;
			goto cont;
		case 'E':
			while(sp > stack) {
				cexpr(*--sp, 0);
				drop = 1;
			}
			goto cont;
		case '*n':	/* ignore */
			goto cont;
		}
printf("		unk: %o*n", o);
		/* don't reach this */
cont:
	}

	printf("END*n");
}

build(op, n) {
	extrn sp;
	auto p1, p2;

	if(op=='[]') {
		build('b', 014);
		op = 'u';
		n = 3;
	}

	switch(op) {
	case 'u':
		p1 = *--sp;
		switch(n) {
		case 1:
			if(p1[0]=='u' & p1[1]==3) {
				*sp++ = p1[2];
				return;
			}
			goto un;
		case 3:
			if(p1[0]=='u' & p1[1]==1) {
				*sp++ = p1[2];
				return;
			}
			goto un;
		}
	un:
		*sp++ = block(2, op, n, p1);
		return;

	case 'b':
		(--sp)[-1] = block(3, op, n, sp[-1], *sp);
		return;
	}
	error("build %c", op);
}

leaf(v, o) {
	extrn drop;

	printf("*tOP2 ");
	if(drop) putchar('I');
	if(v) putchar('V');
	putchar(o-040);
	drop = 0;
}

cexpr(x, lv) {
	extrn drop, setstk, stklvl, ilbl, loc;
	auto n, p, l;

	if(setstk) {
		printf("*tOP2 S,%o*n", stklvl);
		setstk = drop = 0;
	}
	n = x[1];
	switch(*x) {
	case 'c':
		if(lv)
			error("illegal lv*n");
		leaf(lv, 'c');
		printf(",%o*n", n);
		return;
	case 'a':
		leaf(lv, 'a');
		printf(",%o*n", n);
		return;
	case 'i':
		leaf(lv, 'x');
		printf(",LL%o+%o*n", ilbl, n);
		return;
	case 'x':
		leaf(lv, 'x');
		printf(",%*"%s*"*n", n);
		return;
	case 's':
		if(lv)
			error("illegal lv*n");
		leaf(1, 'x');
		printf(",.+3*n*tOP2 T,LL%o*n", l=loc++);
		n = x[1];
		p = x+2;
		while(n--)
			printf("%o*n", *p++);
		printf("LL%o:*n", l);
		return;

	case 'u':
		p = x[2];
		if(n == 3) {
			if(lv) {
				cexpr(x[2], 0);
				return;
			}
			if(p[0]=='b' & p[1]==014) {
				cexpr(p[2], 0);
				cexpr(p[3], 0);
				printf("*tOP N4*n");
				return;
			}
		}
		if(lv)
			error("illegal lv*n");
		if(n == 1) {
			cexpr(p, 1);
			return;
		}
		cexpr(p, n==1 | n>=5);
		printf("*tOP %c%o*n", *x-040, n);
		return;

	case 'b':
		if(lv)
			error("illegal lv*n");
		cexpr(x[2], n==1 | n>=0100);
		cexpr(x[3], 0);
		printf("*tOP %c%o*n", *x-040, n);
		return;

	case '?':
		cexpr(x[2], 0);
		drop = 1;
		printf("*tOP2 F,L%o*n", x[1]);
		cexpr(x[3], 0);
		drop = 1;
		printf("*tOP2 T,L%o*n", x[1]+1);
		printf("L%o:*n", x[1]);
		cexpr(x[4], 0);
		printf("L%o:*n", x[1]+1);
		return;

	case '()':
		cexpr(x[1], 0);
		n=x[2];
		if(n == 0) {
			printf("*tOP N1*n");
			return;
		}
		printf("*tOP N2*n");
		p=x+3;
		while(n--)
			cexpr(*p++, 0);
		printf("*tOP N3*n");
		return;
	}
	error("unknown op %c*n", *x);
}

getw() {
	extrn fin;
	auto w, c, neg;

	neg = 0;
	w = 0;
	while((c=getchar()) != ' ') {
		if(c == '-')
			neg = 1;
		else
			w = w*8 + c-'0';
	}
	if(neg)
		w = -w;
	return(w);
}

readsym(s) {
	extrn namsiz;
	auto i, c;

	i = 0;
	while((c=getchar()) != ' ')
		lchar(s, i++, c);
	while(i < namsiz)
		lchar(s, i++, '*0');
}

block(n, o, a1, a2, a3, a4) {
	extrn blockp;
	auto bp, ap;

	bp = blockp;
	ap = &o;
	n++;
	while(n--)
		*blockp++ = *ap++;
	return(bp);
}

error(s, p1, p2) {
	extrn fout, nerror;
	auto f;

	nerror++;
	f = fout;
	fout = 1;
	printf(s, p1, p2);
	putchar('*n');
	fout = f;
}

namsiz 10;

space[250];
blockp;
nerror;

ap 0;
ast[40];

sp 0;
stack[40];

ilbl;
loc 1;
stklvl 0;
setstk 0;
drop 0;
