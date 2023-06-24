main(argc, argv) {
	extrn printf, xprintf;
	extrn fout, fin, nerror, eof;

	printf = xprintf;	/* hack */
	if(argc<3) {
		error("Arg count");
		exit(1);
	}
	if((fin=open(argv[1],0))<0) {
		error("Can't find %s", argv[1]);
		exit(1);
	}
	if((fout=creat(argv[2], 0664))<0) {
		error("Can't create %s", argv[2]);
		exit(1);
	}

	keyw("auto", Auto);
	keyw("extrn", Extern);
	keyw("goto", Goto);
	keyw("return", Return);
	keyw("if", If);
	keyw("while", While);
	keyw("else", Else);
	keyw("switch", Switch);
	keyw("case", Case);
	keyw("break", Break);
	keyw("default", Default);

	while(!eof) {
		extdef();
		enddef();
	}

	exit(nerror!=0);
}

keyw(s, t) {
	extrn namsiz, symbuf;
	auto n, i, j, c, sp;

	n = namsiz;
	i = j = 0;
	while(n--) {
		lchar(symbuf, i++, c = char(s, j++));
		if(c == '*e')
			j--;
	}
	sp = lookup();
	sp[0] = KeyType;
	sp[1] = t;
}

extdef() {
	extrn csym, cval, loc;
	auto t, cs, i, n;

	if((t=token()) == 0 | t == Semi)
		return;
	if(t != Name)
		goto syntax;
	csym[0] = Extern;
	cs = csym+2;
	printf("g %p*n", cs);
	switch(t = token()) {
	/* Function */
	case LParen:
		printf("d*nl %p*nv 1f*n", cs);
		func();
		return;

	/* Single word */
	case Semi:
		printf("b*nl %p*ns 1*n", cs);
		return;

	case Const:
		printf("d*nl %p*nw %o*n", cs, cval);
	semi:
		if((t = token()) != Semi)
			goto syntax;
		return;

	case String:
		printf("d*nf %p*nv l%d*n", cs, cval);
		goto semi;

	case Name:
		csym[0] = Extern;
		printf("d*nf %p*nv %p*n", cs, csym+2);
		goto semi;

	/* Vector */
	case LBrack:
		n = 0;
		if((t = token()) == Const) {
			n = cval;
			t = token();
		}
		if(t != RBrack)
			goto syntax;
		printf("d*nf %p*nv 1f*n", cs);
		if((t = token()) == Semi) {
			printf("b*nl 1*ns %d*n", n);
			return;
		}
		printf("l 1*n");
		while(t == Const | t == String | t == Name) {
			switch(t) {
			case Const:
				printf("w %o*n", cval);
				break;
			case String:
				i = loc++;
				printf("d*nf l%d*nv l%d*n", i, cval);
				break;
			case Name:
				i = loc++;
				csym[0] = Extern;
				printf("f l%d*nv %p*n*n", i, csym+2);
				break;
			}
			n--;
			if((t=token()) == Semi)
				goto done;
			if(t != Comma)
				goto syntax;
			t = token();
		}
		goto syntax;
done:
		if(n > 0)
			printf("s %d*n", n);
		return;

	case 0:
		return;
	}
syntax:
	error("Definition syntax");
	errflush(t);
}

setstack() {
	extrn pop, stksym, dirty;
	if(dirty) {
		printf("*ts l%d*n", stksym);
		pop = dirty = 0;
	}
}

func() {
	extrn loc, stksym, stack, dirty;
	auto s;

	/* Stack layout:
	 *      auton
	 *      ....
	 *      auto0
	 *      argn
	 *   3  ....
	 *   2  arg0
	 *   1  return address
	 *   0  old fp          <- fp
	 */
	stack = 2;
	stksym = loc++;
	printf("t*nl 1*n", stksym);
	decl(Param);
	dirty = 1;
	stmt();
	printf("*tn11*nq l%d,%d*n", stksym, stack);
}

enddef() {
	extrn loc, stksym, stack, dirty, symsz, symtab, stablen, symused;
	auto s;

	s = symtab;
	while(s < &symtab[stablen]) {
		if(s[2])
			if(s[0] == 0)
				error("%p undefined", s+2);
		if(s[0] != KeyType) {
			s[2] = 0;
			symused--;
		}
		s =+ symsz;
	}
	printf("*n");
}

decl(kw) {
	extrn csym, cval, stack;
	auto t;

	while((t = token()) == Name) {
		if(csym[0] != 0)
			error("%p redeclared", csym+2);
		csym[0] = kw;
		if(kw == Param | kw == Auto) {
			csym[0] = Auto;
			csym[1] = stack;
			stack++;
		}
		t = token();
		if(kw == Auto) {
			/* Two ways to declare vectors */
			if(t == LBrack) {
				printf("*ty %d*n", csym[1]);
				if((t = token()) == Const) {
					stack =+ cval;
					t = token();
				}
				if(t != RBrack)
					goto syntax;
				t = token();
			} else if(t == Const) {
				printf("*ty %d*n", csym[1]);
				stack =+ cval;
				t = token();
			}
		}
		if(t != Comma)
			break;
	}
	if(kw == Param & t == RParen |
	   kw != Param & t == Semi)
		return;

syntax:
	error("Declaration syntax");
	errflush(t);
}

stmt() {
	extrn pop, stksym, dirty, loc, csym, cval, eof, peekc, peektok,
		brklab, deflab, swp, swtab, swsiz, nsw;
	auto t, l1, l2, l3, p, sswp, snsw;

next:
	switch(t = token()) {
	case 0:
		error("Unexpected EOF");
		return;

	case RBrace:
		peektok = t;
	case Semi:
		return;

	case LBrace:
		while((t = token()) != RBrace) {
			if(eof) {
				error("Expected }");
				break;
			}
			peektok = t;
			stmt();
		}
		return;

	case Keyword:
		switch(cval) {
		case Auto:
		case Extern:
			decl(cval);
			goto next;

		case Return:
			if((peektok = token()) == LParen) {
				gen(pexpr(), 0);
				printf("*tn7*n");
				goto semi;
			}
			printf("*tn11*n");
			goto semi;

		case Goto:
			gen(expr(), 0);
			printf("*tn6*n");
			goto semi;

		case If:
			gen(pexpr(), l1=loc++);
			stmt();
			if((t=token()) == Keyword & cval == Else) {
				jmp(l2=loc++);
				label(l1);
				stmt();
				label(l2);
			} else {
				peektok = t;
				label(l1);
			}
			return;

		case While:
			l1 = brklab;
			brklab = loc++;
			label(l2 = loc++);
			gen(pexpr(), brklab);
			stmt();
			jmp(l2);
			label(brklab);
			brklab = l1;
			return;

		case Switch:
			l1 = brklab;
			brklab = loc++;
			gen(pexpr(), 0);

			printf("*tz l%d*n", l2=loc++);
			sswp = swp;
			snsw = nsw;
			if(swp == 0)
				swp = swtab;
			p = swp;
			nsw = 0;
			l3 = deflab;
			deflab = 0;
			stmt();
			jmp(brklab);
			if(deflab == 0)
				deflab = brklab;
			/* PDP-11 runtime can't handle this */
			if(nsw == 0)
				error("No cases in switch");
			printf("l l%d*nw %o*n", l2, nsw);
			while(nsw--) {
				printf("w %o*nv l%d*n", p[1], p[0]);
				p =+ 2;
			}
			if(deflab != brklab)
				jmp(deflab);

			label(brklab);
			deflab = l3;
			swp = sswp;
			nsw = snsw;
			brklab = l1;
			return;

		case Case:
			if((t = token()) != Const)
				goto syntax;
			if((t = token()) != Colon)
				goto syntax;
			if(swp == 0) {
				error("Not in switch");
				goto next;
			}
			if(swp >= swtab+swsiz) {
				error("Switch table overflow");
			} else {
				*swp++ = loc;
				*swp++ = cval;
				nsw++;
				label(loc++);
			}
			goto next;
		case Break:
			if(brklab == 0)
				error("Nothing to break from");
			jmp(brklab);
			goto semi;
		case Default:
			if(swp == 0)
				error("Default not in switch");
			if(deflab)
				error("Default case already defined");
			if((t = token()) != Colon)
				goto syntax;
			label(deflab = loc++);
			goto next;
		}

		error("Unknown keyword");
		goto syntax;

	case Name:
		if(peekc == ':') {
			peekc = 0;
			if(csym[0] != 0) {
				error("Redefinition");
				goto next;
			}
			csym[0] = Intern;
			if(csym[1] == 0)
				csym[1] = loc++;
			printf("d*nl l%d*nv 1f*nt*nl 1*n", csym[1]);
			dirty = 1;
			goto next;
		}
	}

	/* Expression statement */
	peektok = t;
	gen(expr(), 0);
semi:
	if((t = token()) == Semi)
		return;
syntax:
	error("Statement syntax");
	errflush(t);
	goto next;
}

gen(x, l) {
	extrn pop;

	setstack();
	if(l == 0)
		genxpr(x, 0);
	else
		cjmp(x, l);
	pop = 1;
}

label(n) printf("l l%d*n", n);
jmp(n) printf("*tt l%d*n", n);

/* jump to label l if condition is false,
 * fall through otherwise. */
cjmp(x, l) {
	extrn pop, loc;
	auto l1, l2;

	if(x == 0)	/* there has been a parse error */
		return;
	switch(x[0]) {
	case And:
		cjmp(x[1], l);
		cjmp(x[2], l);
		return;
	case Or:
		cjmp(x[1], l1=loc++);
		jmp(l2=loc++);
		label(l1);
		cjmp(x[2], l);
		label(l2);
		return;
	case Not:
		cjmp(x[1], l1=loc++);
		jmp(l);
		label(l1);
	}
	genxpr(x, 0);
	pop = 1;
	printf("*tf l%d*n", l);
}

pexpr() {
	auto t, n;

	if((t = token()) != LParen)
		goto syntax;
	n = expr();
	if((t = token()) != RParen)
		goto syntax;
	return(n);
syntax:
	error("Statement syntax");
	errflush(t);
	return(0);
}


/* Parse an expression into a tree */
expr() {
	extrn csym, cval, peekc, peektok, loc, opdope, cp, cmst,
		space, ospace;
	auto op, opst[20], pp, prst[20], andflg, o, p, os;

	space = ospace;
	op = opst;
	pp = prst;
	cp = cmst;
	/* mark bottom of stack */
	*op = 0;
	*pp = 6;	/* why exactly was this chosen? */
	andflg = 0;

advanc:
	switch(o = token()) {
	/* operands */
	case Name:
		/* Have to be very careful here because token()
		 * can peek a token itself after a '='.
		 * In particular it can overwrite csym then.
		 * e.g. 'a =b' will return '=' and peek b,
		 * overwriting a's csym. */
		if(csym[0] == 0) {
			/* this is the best we can do to recognize a call */
			if(peekc == '(')
				csym[0] = Extern;
			else
				/* otherwise assume it's a label */
				if(csym[1] == 0)
					csym[1] = loc++;
		}
		*cp++ = block(1, o, csym);
		goto tand;

	case Const:
	case String:
		*cp++ = block(1, o, cval);
	tand:
		if(andflg)
			goto syntax;
		andflg = 1;
		goto advanc;

	/* unary operators */

	case Preinc:
	case Predec:
		if(andflg)
			o =+ 2;
		goto oponst;

	case Not:
		if(andflg)
			goto syntax;
		goto oponst;

	case Minus:
		if(andflg)
			andflg = 0;
		else
			o = Neg;
		goto oponst;

	case And:
	case Times:
		if(andflg)
			andflg = 0;
		else if(o == And)
			o = Amp;
		else
			o = Star;
		goto oponst;

	/* special tokens */
	case LParen:
		if(andflg) {
			/* function call */
			if((o=token()) == RParen) {
				/* empty call */
				o = MCall;
			} else {
				peektok = o;
				o = Call;
				andflg = 0;
			}
		}
		goto oponst;

	case RParen:
	case RBrack:
		if(!andflg)
			goto syntax;
		goto oponst;
	}

	/* binary operators */
	if(!andflg)
		goto syntax;
	andflg = 0;

oponst:
	p = (opdope[o]>>6) & 077;
	/* new op binds tighter, so push onto stack */
	if(p > *pp | p == *pp & (opdope[o]&2)!=0) {
		/* Make parens (and calls) such low precedence
		 * that only closing paren can pop. */
		switch(o) {
		case LParen:
		case LBrack:
		case Call:
			p = 04;
		}
		if(op >= opst+20) {
			error("expression overflow");
			exit(1);
		}
		*++op = o;
		*++pp = p;
		goto advanc;
	}
	/* new op binds less tightly, so pop off stack */
	--pp;
	switch(os = *op--) {
	case 0:
		peektok = o;
		return(*--cp);

	case MCall:
		*cp++ = 0;
		os = Call;
		break;

	case Call:
		if(o != RParen)
			goto syntax;
		build(os);
		goto advanc;

	case LParen:
		if(o != RParen)
			goto syntax;
		goto advanc;

	case LBrack:
		if(o != RBrack)
			goto syntax;
		build(Vector);
		goto advanc;
	}
	build(os);
	goto oponst;

syntax:
	error("Expression syntax");
	errflush(o);
	return(0);
}

block(n, op, p1, p2) {
	extrn space, ossiz, ospace;
	auto p, ap;

	p = space;
	ap = &op;
	n++;
	if(space+n >= ospace+ossiz) {
		error("Expression overflow");
		exit(1);
	}
	while(n--)
		*space++ = *ap++;
	return(p);
}

/* Combine operands on stack to a new tree node.
 * Also simplify somewhat and check semantics here. */
build(op) {
	extrn cp, opdope;
	auto p1, p2;

	/* convert a[b] to *(a+b) so we can take lvalue */
	if(op == Vector) {
		build(Plus);
		op = Star;
	}

	if((opdope[op] & 1) != 0)
		p2 = *--cp;
	p1 = *--cp;

	switch(op) {
	case Quest:
		if(p2[0] != Colon) {
			error(": Expected");
			return;
		}
		break;
	case Neg:
		if(p1[0] == Const) {
			p1[1] = -p1[1];
			*cp++ = p1;
			return;
		}
		break;
	case Star:
		if(p1[0] == Amp) {
			*cp++ = p1[1];
			return;
		}
		break;
	case Amp:
		if(p1[0] == Star) {
			*cp++ = p1[1];
			return;
		}
		if(p1[0] != Name) {
			error("Illegal lvalue");
			return;
		}
	}

	if((opdope[op] & 4)!=0)
		if(p1[0] != Star & p1[0] != Name) {
			error("Illegal lvalue");
			return;
		}

	if((opdope[op] & 1) != 0)
		*cp++ = block(2, op, p1, p2);
	else
		*cp++ = block(1, op, p1);
}

genxpr(x, lv) {
	extrn opdope, pop, loc;
	auto op, p1, p2, l1, l2;

	if(x == 0)	/* there has been a parse error */
		return;
	op = x[0];
	p1 = x[1];
	p2 = x[2];
	switch(op) {
	case Name:
	case Const:
	case String:
		genleaf(x, lv);
		return;
	case Amp:
		genleaf(p1, 1);	/* p1 can only be Name */
		return;
	case Star:
		if(lv) {
			genxpr(p1, 0);
			return;
		}
		/* turn *(a+b) back to a[b] */
		if(p1[0] == Plus) {
			p1[0] = Vector;
			genxpr(p1, 0);
			return;
		}
		break;

	case Call:
		genxpr(p1, 0);
		if(p2 == 0) {
			printf("*tn1*n");
			return;
		}
		printf("*tn2*n");
		while(p2[0] == Comma) {
			genxpr(p2[1], 0);
			p2 = p2[2];
		}
		genxpr(p2, 0);
		printf("*tn3*n");
		return;

	case Comma:
		while(x[0] == Comma) {
			genxpr(x[1], 0);
			x = x[2];
			pop = 1;
		}
		genxpr(x, 0);
		return;

	case Quest:
		cjmp(p1, l1=loc++);
		pop = 1;
		genxpr(p2[1], lv);
		jmp(l2=loc++);
		label(l1);
		pop = 1;
		genxpr(p2[2], lv);
		label(l2);
		return;
	}
	genxpr(p1, (opdope[op]&4)!=0);
	if((opdope[op]&1)!=0)
		genxpr(p2, 0);

	if(op < Vector)
		error("UNKNOWN OP %d", op);
	else if(op == Vector)
		printf("*tn4*n");
	else if(op <= Div)
		printf("*tb%o*n", op-Assign+1);
	else if(op <= ADiv)
		printf("*tb%o*n", op-AOr+0102);
	else if(op <= Postdec)
		printf("*tu%o*n", op-Amp+1);
}

genleaf(x, lv) {
	extrn pop;
	auto s;

	putchar('*t');
	if(pop) {
		putchar('i');
		pop = 0;
	}
	switch(x[0]) {
	case Name:
		s = x[1];
		if(lv)
			putchar('v');
		switch(s[0]) {
		case Extern:
			printf("x %p*n", s+2);
			return;
		case 0:	/* undefined label */
		case Intern:
			printf("x l%d*n", s[1]);
			return;
		case Auto:
			printf("a %d*n", s[1]);
			return;
		}
		error("invalid type*n");
		exit(1);
	case Const:
		printf("c %o*n", x[1]);
		return;
	case String:
		printf("vx l%d*n", x[1]);
		return;
	}
}

errflush(t) {
	extrn peektok;

	while(t != Semi & t != LBrace & t != RBrace)
		t = token();
	peektok = t;
}

/*
 * Lexical analysis
 */

lookup() {
	extrn symbuf, nwps, symtab, stabsz, stablen, symused, symsz;
	auto i, j, np, sp, rp;

	i = 0;
	sp = symbuf;
	j = nwps;
	while(j--)
		i =+ *sp++;
	if(i < 0)
		i = -i;
	i =% stabsz;
	i =* symsz;
	while(*(np = &symtab[i+2])) {
		sp = symbuf;
		j = nwps;
		while(j--)
			if(*np++ != *sp++)
				goto no;
		return(&symtab[i]);
no:
		if((i =+ symsz) >= stablen)
			i = 0;
	}
	if(++symused >= stabsz) {
		error("Symbol table overflow");
		exit(1);
	}
	rp = np = &symtab[i];
	sp = symbuf;
	*np++ = 0;
	*np++ = 0;
	j = nwps;
	while(j--)
		*np++ = *sp++;
	return(rp);
}

token() {
	extrn peektok, eof, ctab;
	auto c;

next:
	if(peektok >= 0) {
		c = peektok;
		peektok = -1;
		return(c);
	}
	c = getchr();
	if(eof)
		return(0);
	if(c >= 128) {
		error("unknown char <%c>", c);
		goto next;
	}

	switch(ctab[c]) {
	case Space:
		goto next;

	case Plus:
		return(subseq('+', Plus, Preinc));

	case Minus:
		return(subseq('-', Minus, Predec));

	case Not:
		return(subseq('=', Not, Neq));

	case Less:
		if(subseq('<', 0, 1))
			return(LShift);
		return(subseq('=', Less, Leq));

	case Greater:
		if(subseq('>', 0, 1))
			return(RShift);
		return(subseq('=', Greater, Geq));

	case Assign:
		/* First handle ==, === to avoid recursion later */
		if((c = getchr()) == '=')
			return(subseq('=', Eq, AEq));
		/* NB: does not handle comments! */
		if(ctab[c] == Space)
			return(Assign);
		ungetchr(c);
		/* BUG: this is a big kludge! */
		c = token();
		if(c >= Or & c <= Div)
			return(c - Or + AOr);
		if(peektok >= 0) error("OVERWRITING peeked token (%o %o)", peektok, c);
		peektok = c;
		return(Assign);

	case Div:
		if(subseq('**', 1, 0))
			return(Div);
		/* find end of comment */
		while(1) {
			c = getchr();
			if(eof) {
				error("Unterminated comment");
				return(0);
			}
			if(c == '**') {
				c = getchr();
				if(c == '/')
					goto next;
			}
		}

	case Digit:
		ungetchr(c);
		return(number());

	case Letter:
		ungetchr(c);
		return(symbol());

	case SQuote:
		return(getcc());

	case DQuote:
		return(getstr());

	default:
		return(ctab[c]);
	}
	return(0);
}

subseq(c,a,b) {
	auto chr;

	if((chr = getchr()) == c)
		return(b);
	ungetchr(chr);
	return(a);
}

getstr() {
	extrn cval, loc;
	auto c, i, buf;

	printf("a*nl l%d*n", cval=loc++);
	i = 0;
	buf = 0;
	while((c = mapch('"')) >= 0) {
		lchar(&buf, i++, c);
		if(i == NCPW) {
			printf("w %o*n", buf);
			buf = 0;
			i = 0;
		}
	}
	printf("w %o*nt*n", buf);
	return(String);
}

getcc() {
	extrn cval;
	auto c, i;

	i = 0;
	cval = 0;
	while((c = mapch('*'')) >= 0)
		if(i < NCPW)
			lchar(&cval, i++, c);
	return(Const);
}

mapch(d) {
	extrn eof;
	auto c;

	c = getchr();
	if(eof | c == '*n') {
		error("Unterminated string");
		ungetchr(c);
		return(-1);
	}
	if(c == d)
		return(-1);
	if(c == '**') {
		c = getchr();
		switch(c) {
		case '0':
		case 'e': return('*0');
		case 't': return('*t');
		case 'n': return('*n');
		}
	}
	return(c);
}

symbol() {
	extrn ctab, symbuf, namsiz, csym, cval;
	auto c, i;

	i = 0;
	c = getchr();
	while(ctab[c] == Letter | ctab[c] == Digit) {
		if(i < namsiz)
			lchar(symbuf, i++, c);
		c = getchr();
	}
	while(i < namsiz)
			lchar(symbuf, i++, 0);
	ungetchr(c);
	csym = lookup();
	if(csym[0] == KeyType) {
		cval = csym[1];
		return(Keyword);
	}
	return(Name);
}

number() {
	extrn ctab, cval;
	auto b, c;

	c = getchr();
	if(c == '0')
		b = 8;
	else
		b = 10;
	cval = 0;
	while(ctab[c] == Digit) {
		cval = cval*b + c-'0';
		c = getchr();
	}
	ungetchr(c);
	return(Const);
}

/*
 * Input/Output
 */

getchr() {
	extrn peekc, eof, line;
	auto c;

	if(peekc) {
		c = peekc;
		peekc = 0;
	} else
		c = getchar();
	if(c <= 0) {
		eof = 1;
		return(0);
	}
	if(c == '*n')
		line++;
	return(c);
}

ungetchr(c) {
	extrn peekc, line;

	if(c == '*n')
		line--;
	peekc = c;
}

xprintf(fmt, x1,x2,x3,x4,x5,x6,x7,x8,x9) {
	extrn printn, char, putchar, namsiz;
	auto adx, x, c, i, j;

	i = 0; /* fmt index */
	adx = &x1; /* argument pointer */
loop:
	while((c=char(fmt,i++)) != '%') {
		if(c == '*e')
			return;
		putchar(c);
	}
	x = *adx++;
	switch(c = char(fmt, i++)) {

	case 'd': /* decimal */
	case 'o': /* octal */
		printn(x, c=='o'?8:10);
		goto loop;

	case 'c': /* char */
		putchar(x);
		goto loop;

	case 's': /* string */
		j = 0;
		while((c=char(x,j++)) != '*e')
			putchar(c);
		goto loop;

	case 'p': /* symbol */
		c = namsiz;
		j = 0;
		putchar('_');
		while(c--)
			if(char(x,j) != '*e')
				putchar(char(x,j++));
		goto loop;
	}
	putchar('%');
	i--;
	adx--;
	goto loop;
}

error(s, p1, p2) {
	extrn line, fout, nerror;
	auto f;

	nerror++;
	f = fout;
	fout = 1;
	printf("%d: ", line);
	printf(s, p1, p2);
	putchar('*n');
	fout = f;
}

symbuf[NWPS];
nwps NWPS;
namsiz NCPS;
symsz SYMSZ;
symused 0;
stabsz NSYMS;
stablen SYMTABSZ;
symtab[SYMTABSZ];	/* SYMSZ*NSYMS */
ossiz 250;
ospace[250];
space 0;
cp 0;
cmsiz 40;
cmst[40];
loc 1;
swsiz 120;
swtab[120];
swp 0;
nsw 0;
brklab 0;
deflab 0;
stack 0;
stksym 0;
dirty 0;	/* have to set stack */
pop 0;	/* ignore last stack value */
peektok 01777777777777777777777;	/* -1 */
peekc 0;
eof 0;
line 1;
csym 0;
cval 0;
nerror 0;

ctab[128]
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Space,   Space,   Space,   Invalid, Space,   Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Space,   Not,     DQuote,  Invalid, Invalid, Mod,     And,     SQuote,
	LParen,  RParen,  Times,   Plus,    Comma,   Minus,   Letter,  Div,
	Digit,   Digit,   Digit,   Digit,   Digit,   Digit,   Digit,   Digit,
	Digit,   Digit,   Colon,   Semi,    Less,    Assign,  Greater, Quest,
	Invalid, Letter,  Letter,  Letter,  Letter,  Letter,  Letter,  Letter,
	Letter,  Letter,  Letter,  Letter,  Letter,  Letter,  Letter,  Letter,
	Letter,  Letter,  Letter,  Letter,  Letter,  Letter,  Letter,  Letter,
	Letter,  Letter,  Letter,  LBrack,  Invalid, RBrack,  Invalid, Letter,
	Invalid, Letter,  Letter,  Letter,  Letter,  Letter,  Letter,  Letter,
	Letter,  Letter,  Letter,  Letter,  Letter,  Letter,  Letter,  Letter,
	Letter,  Letter,  Letter,  Letter,  Letter,  Letter,  Letter,  Letter,
	Letter,  Letter,  Letter,  LBrace,  Or,      RBrace,  Invalid, Invalid;

opdope[]
	/* 00pp00 is precedence.
	 * 000001 is binary
	 * 000002 is right assoc.
	 * 000004 is lval */
	000000,	/* None */
	000000,	/* Space */
	000000,	/* DQuote */
	000000,	/* SQuote */
	003600,	/* LParen */
	000200,	/* RParen */
	003600,	/* LBrack */
	000200,	/* RBrack */
	000000,	/* LBrace */
	000000,	/* RBrace */
	000000,	/* Semi */
	000000,	/* Digit */
	000000,	/* Letter */
	000000,	/* Const */
	000000,	/* String */
	000000,	/* Name */
	000000,	/* Keyword */
	000703,	/* Comma */
	001403,	/* Colon */
	001403,	/* Quest */
	003601,	/* Call */
	003601,	/* MCall */
	000001,	/* Vector */
	001207,	/* Assign */
	001601,	/* Or */
	002001,	/* And */
	002201,	/* Eq */
	002201,	/* Neq */
	002401,	/* Leq */
	002401,	/* Less */
	002401,	/* Geq */
	002401,	/* Greater */
	002601,	/* RShift */
	002601,	/* LShift */
	003001,	/* Plus */
	003001,	/* Minus */
	003201,	/* Mod */
	003201,	/* Times */
	003201,	/* Div */
	001207,	/* AOr */
	001207,	/* AAnd */
	001207,	/* AEq */
	001207,	/* ANeq */
	001207,	/* ALeq */
	001207,	/* ALess */
	001207,	/* AGeq */
	001207,	/* AGreater */
	001207,	/* ARShift */
	001207,	/* ALShift */
	001207,	/* APlus */
	001207,	/* AMinus */
	001207,	/* AMod */
	001207,	/* ATimes */
	001207,	/* ADiv */
	003406,	/* Amp */
	003402,	/* Neg */
	003402,	/* Star */
	003402,	/* Not */
	003406,	/* Preinc */
	003406,	/* Predec */
	003406,	/* Postinc */
	003406	/* Postdec */
;
