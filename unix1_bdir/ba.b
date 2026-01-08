main() {
	extrn argv, fout, fin;
	extrn drop, setstk, stklvl;
	extrn namsiz;
	extrn blockp, space, sp, stack;
	extrn ap, ast;
	auto o, a, sym 10, p, pp;

	if(argv[0]<3) {
		printf("Arg count*n");
		exit(1);
	}
	if((fin=open(argv[2],0))<0) {
		printf("Can't find %s*n", argv[2]);
		exit(1);
	}
	if((fout=creat(argv[3], 016))<0) {
		printf("Can't create %s*n", argv[3]);
		exit(1);
	}

	printf("*tjmp 9f*n");

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
			printf("*n.globl .%s*n*.%s:*n", sym, sym);
			goto cont;
		case 'e':
			printf("*t.+2*n");
			goto cont;
		case 'v':
			chain();
			goto cont;

		case 'l':
			printf("*tL%o*n", getw());
			goto cont;
		case 'o':
			printf("*t%o*n", getw());
			goto cont;
		case 'r':
			printf("*t.=.+%o*n", getw()*2);
			goto cont;

		case 'p':
			printf("7:*n");
			goto cont;

		case 'k':
			printf("*tt; .+%o*n", (getw()+1)*2);
			goto cont;

		case 't': case 'f': case 'z':
			printf("*t%c; L%o*n", o, getw());
			goto cont;

		case 'y':
			printf("*ty; %o*n", getw()*2);
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
			while((o=getchar()) != '>')
				if(o == 'o')
					*blockp++ = getw();
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
				printf("*t%c%o*n", o, a);
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
		}
		/* don't reach this */
cont:
	}

	printf("*n9:*tjsr*tr5,chain*n");
	chain();
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

	putchar('*t');
	if(drop) putchar('i');
	if(v) putchar('v');
	putchar(o);
	drop = 0;
}

cexpr(x, lv) {
	extrn drop, setstk, stklvl;
	auto n, p;

	if(setstk) {
		printf("*ts; %o*n", stklvl*2);
		setstk = drop = 0;
	}
	n = x[1];
	switch(*x) {
	case 'c':
		if(lv)
			error("illegal lv*n");
		leaf(lv, 'c');
		printf("; %o*n", n);
		return;
	case 'a':
		leaf(lv, 'a');
		printf("; %o*n", n*2);
		return;
	case 'i':
		leaf(lv, 'x');
		printf("; 7f+%o*n", n*2);
		return;
	case 'x':
		leaf(lv, 'x');
		printf("; .%s*n", n);
		return;
	case 's':
		if(lv)
			error("illegal lv*n");
		leaf(1, 'x');
		printf("; 1f*n*tt; 2f*n1:*n");
		n = x[1];
		p = x+2;
		while(n--)
			printf(".byte %o*n", *p++);
		printf(".byte 0*n.even*n2:*n");
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
				printf("*tn4*n");
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
		printf("*t%c%o*n", *x, n);
		return;

	case 'b':
		if(lv)
			error("illegal lv*n");
		cexpr(x[2], n==1 | n>=0100);
		cexpr(x[3], 0);
		printf("*t%c%o*n", *x, n);
		return;

	case '?':
		cexpr(x[2], 0);
		drop = 1;
		printf("*tf; L%o*n", x[1]);
		cexpr(x[3], 0);
		drop = 1;
		printf("*tt; L%o*n", x[1]+1);
		printf("L%o:*n", x[1]);
		cexpr(x[4], 0);
		printf("L%o:*n", x[1]+1);
		return;

	case '()':
		cexpr(x[1], 0);
		n=x[2];
		if(n == 0) {
			printf("*tn1*n");
			return;
		}
		printf("*tn2*n");
		p=x+3;
		while(n--)
			cexpr(*p++, 0);
		printf("*tn3*n");
		return;
	}
	error("unknown op %c*n", *x);
}

chn 0;
chain() {
	extrn chn;

	if(chn)
		printf("*t8b-2*n8:*n");
	else
		printf("*t0*n8:*n");
	chn = 1;
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

namsiz 8;

space[250];
blockp;
nerror;

ap 0;
ast[40];

sp 0;
stack[40];

stklvl 0;
setstk 0;
drop 0;
