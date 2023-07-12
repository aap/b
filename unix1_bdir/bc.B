main() {
	extrn argv, fout, fin, nerror, eof;

	if(argv[0]<3) {
		write(1, "Arg count*n", 10);
		exit(1);
	}
	if((fin=open(argv[2],0))<0) {
		write(1, "Input file?*n", 12);
		exit(1);
	}
	if((fout=creat(argv[3], PERM))<0) {
		write(1, "Output file?*n", 13);
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

	while(!eof) {
		extdef();
		enddef();
	}
	exit(nerror!=0);
}

keyw(s, t) {
	extrn namsiz, symbuf;
	auto n, i, j, c, np;

	n = namsiz;
	i = j = 0;
	while(n--) {
		lchar(symbuf, i++, c = char(s, j++));
		if(c == '*e')
			j--;
	}
	np = lookup();
	np[0] = KeyType;
	np[1] = t;
}

extdef() {
	extrn csym, cval, loc, peeksym, nauto, nlbl, lbltab;
	auto o, i, n;

	if(((o=symbol())==0) | o==Semi)
		return;
	if(o!=Name)
		goto syntax;
	csym[0] = Extern;
	gensym('g', csym+2);
	n = 1;
	if((peeksym=symbol())==LBrack) {
		peeksym = -1;
		n = 0;
		if((o=symbol())==Const) {
			n = cval;
			o = symbol();
		}
		if(o!=RBrack)
			goto syntax;
		gen0('v');
	}
loop:
	switch(o=symbol()) {
	case LParen:
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
		nauto = 2;
		nlbl = 0;
		gen0('e');
		declare(Param);
		gen0('S');
		stmt();
		gen1('n', 011);
		/* write out internals */
		gen0('p');
		i = 0;
		while(i < nlbl)
			gen1('l', lbltab[i++]);
		return;

	case Semi:
	done:
		if(n > 0)
			gen1('r', n);
		return;

	case Const:
		gen1('o', cval);
	semi:
		n--;
		if((o=symbol()) == Semi)
			goto done;
		if(o != Comma)
			goto syntax;
		goto loop;

	case String:
		getstr();
		goto semi;

	/* cannot handle names */

	case 0:
		return;
	}
syntax:
	err('xx', 0);
	errflush(o);
}

enddef() {
	extrn symsz, symtab, stablen, symused;
	auto s;

	s = symtab;
	while(s < &symtab[stablen]) {
		if(s[2])
			if(s[0] == 0)
				err('un', s+2);
		if(s[0] != KeyType) {
			s[2] = 0;
			symused--;
		}
		s =+ symsz;
	}
}

declare(kw) {
	extrn csym, cval, nauto;
	auto o;

	while((o=symbol())==Name) {
		if(*csym!=0)
			err('rd', csym+2);
		*csym = kw;
		if(kw!=Extern) {
			*csym = Auto;
			csym[1] = nauto++;
		}
		o = symbol();
		if(kw==Auto & o==Const) {
			gen1('y', csym[1]);
			nauto =+ cval;
			o = symbol();
		}
		if(o != Comma)
			goto done;
	}
done:
	if(o==Semi & kw!=Param | o==RParen & kw==Param)
		return;
	err('sx', 0);
	errflush(o);
}

stmt() {
	extrn loc, csym, cval, eof, peekc, peeksym,
		swp, swtab, swsiz, lbltab;
	auto o, l1, l2, l3, p, sswp;

	switch(o = symbol()) {
	case 0:
		err('??', 0);
		return;

	case RBrace:
		peeksym = o;
	case Semi:
		return;

	case LBrace:
		while(!eof) {
			if((o=symbol())==RBrace)
				return;
			peeksym = o;
			stmt();
		}
		err('$)', 0);
		return;

	case Keyword:
		switch(cval) {
		case Auto:
		case Extern:
			declare(cval);
			goto stmt;

		case Goto:
			expr();
			gen1('n', 6);
			goto semi;

		case Return:
			if((peeksym=symbol())==LParen) {
				pexpr();
				gen1('n', 7);
				goto semi;
			}
			gen1('n', 011);
			goto semi;

		case If:
			pexpr();
			gen1('f', l1=loc++);
			stmt();
			if((o=symbol())==Keyword & cval==Else) {
				gen1('t', l2=loc++);
				label(l1);
				stmt();
				label(l2);
				return;
			}
			peeksym = o;
			label(l1);
			return;

		case While:
			label(l1 = loc++);
			l2 = loc++;
			pexpr();
			gen1('f', l2);
			stmt();
			gen1('t', l1);
			label(l2);
			return;

		case Case:
			if((o=symbol())!=Const)
				goto syntax;
			if((o=symbol())!=Colon)
				goto syntax;
			if(swp==0)
				goto syntax;
			if(swp>=swtab+swsiz) {
				err('>c', 0);
				exit(1);
			}
			gen2('q', loc, cval);
			*swp++ = loc++;
			label(loc++);
			goto stmt;

		case Switch:
			expr();
			gen1('z', l1=loc++);
			if(swp==0)
				swp = swtab;
			sswp = swp;
			stmt();
			/* runtime can't handle this */
			if(swp==sswp)
				err('sw', 0);
			gen1('k', 1+(swp-sswp)*2);	/* skip over table */
			label(l1);
			gen1('o', swp-sswp);
			p = sswp;
			while(p != swp) {
				gen1('l', l1 = *p++);
				gen1('l', ++l1);
			}
			swp = sswp;
			return;
		}
		goto syntax;

	case Name:
		if(peekc==':') {
			peekc = 0;
			if(csym[0]>0) {
				err('rd', csym+2);
				goto stmt;
			}
			csym[0] = Intern;
			deflab();
			label(lbltab[csym[1]-1]);
			gen0('S');
			goto stmt;
		}
	}

	/* Expression statement */
	peeksym = o;
	expr();

semi:
	if((o=symbol())==Semi)
		return;
syntax:
	err('sx', 0);	/* TODO? print keyword */
	errflush(o);
	goto stmt;
}

deflab() {
	extrn csym, lblsiz, lbltab, nlbl, loc;
	if(csym[1]==0) {
		if(nlbl>=lblsiz) {
			err('>i', 0);
			exit(1);
		}
		lbltab[nlbl] = loc++;
		csym[1] = ++nlbl;
	}
}
label(n) gen1('L', n);
putw(w) extrn fout; write(fout, &w, NCPW);
gen0(o) putchar(o);
gen1(o, a) {
	putchar(o);
	putw(a);
}
gen2(o, a, b) {
	putchar(o);
	putw(a);
	putw(b);
}
gensym(o, s) {
	extrn fout, namsiz;
	putchar(o);
	write(fout, s, namsiz);
}


pexpr() {
	auto t;

	if((t = symbol()) != LParen)
		goto syntax;
	expr();
	if((t = symbol()) == RParen)
		return;
syntax:
	err('sx', 0);	/* TODO? print keyword */
	errflush(t);
}

expr() {
	extrn csym, cval, peekc, peeksym, loc, opdope, nauto;
	auto op, opst 20, pp, prst 20, andflg, o, p, os, l;

	op = opst;
	pp = prst;
	*op = 0;
	*pp = 6;
	andflg = 0;

	gen1('s', nauto);
advanc:
	switch(o=symbol()) {
	case Name:
		/* Have to be very careful here because symbol()
		 * can peek a token itself after a '='.
		 * In particular it can overwrite csym then.
		 * e.g. 'a =b' will return '=' and peek b,
		 * overwriting a's csym. */
		if(*csym==0) {
			/* this is the best we can do to recognize a call */
			if(peekc=='(')
				csym[0] = Extern;
			else
				/* otherwise assume it's a label */
				deflab();
		}
		switch(*csym) {
		case Extern:
			gensym('x', csym+2);
			goto tand;
		case 0:
		case Intern:
			gen1('i', csym[1]-1);
			goto tand;
		case Auto:
			gen1('a', csym[1]);
			goto tand;
		}
		goto syntax;

	case Const:
	caseConst:
		gen1('c', cval);
		goto tand;

	case String:
		gen0('<');
		getstr();
		gen0('>');
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
		if(!andflg) {
			if((peeksym=symbol())==Const) {
				peeksym = -1;
				cval = -cval;
				goto caseConst;
			}
			o = Neg;
		}
		andflg = 0;
		goto oponst;

	case And:
	case Times:
		if(andflg)
			andflg = 0;
		else if(o==And)
			o = Amp;
		else
			o = Star;
		goto oponst;

	/* special tokens */
	case LParen:
		if(andflg) {
			/* function call */
			if((o=symbol())==RParen) {
				/* empty call */
				o = MCall;
			} else {
				peeksym = o;
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
	if(p>*pp | p==*pp & (opdope[o]&2)!=0) {
		switch(o) {
		/* Make parens (and calls) such low precedence
		 * that only closing paren can pop. */
		case Call:
			gen1('n', 2);
		case LParen:
		case LBrack:
			p = 04;
		}
		if(op>=opst+20) {
			err('>e', 0);
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
		peeksym = o;
		gen0('E');
		return;

	case Quest:
		gen1('?', loc++);
		loc++;
	case Colon:
		goto oponst;

	case Call:
		if(o!=RParen)
			goto syntax;
		gen1('n', 3);
		goto advanc;

	case MCall:
		gen1('n', 1);
	case Comma:
		goto oponst;

	case LParen:
		if(o!=RParen)
			goto syntax;
		goto advanc;

	case LBrack:
		if(o!=RBrack)
			goto syntax;
		gen1('n', 4);
		goto advanc;

	}
fbuild:
	if(os < Assign)
		goto syntax;
	else if(os <= Div)
		gen1('b', os-Assign+1);
	else if(os <= ADiv)
		gen1('b', os-AOr+0102);
	else if(os <= Postdec)
		gen1('u', os-Amp+1);
	goto oponst;

syntax:
	err('ex', 0);
	errflush(o);
}

errflush(t) {
	extrn peeksym;

	while(t != Semi & t != LBrace & t != RBrace)
		t = symbol();
	peeksym = t;
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
		err('>s', 0);
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

symbol() {
	extrn peeksym, eof, ctab, symbuf, namsiz, csym, cval;
	auto b, c, i;

next:
	if(peeksym >= 0) {
		c = peeksym;
		peeksym = -1;
		return(c);
	}
	c = getchr();
	if(eof)
		return(0);
	c =& 0177;

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
		c = symbol();
		if(c >= Or & c <= Div)
			return(c - Or + AOr);
/*		if(peeksym >= 0) error("OVERWRITING peeked symbol (%o %o)", peeksym, c); */
		peeksym = c;
		return(Assign);

	case Div:
		if(subseq('**', 1, 0))
			return(Div);
		/* find end of comment */
		while(1) {
			c = getchr();
			if(eof) {
				err('*/', 0);
				return(0);
			}
			if(c == '**') {
				c = getchr();
				if(c == '/')
					goto next;
			}
		}

	case Digit:
		cval = 0;
		if(c=='0')
			b = 8;
		else
			b = 10;
		while(ctab[c]==Digit) {
			cval = cval*b + c-'0';
			c = getchr();
		}
		ungetchr(c);
		return(Const);

	case SQuote:
		return(getcc());

	case Letter:
		i = 0;
		while(ctab[c]==Letter | ctab[c]==Digit) {
			if(i < namsiz) lchar(symbuf, i++, c);
			c = getchr();
		}
		while(i<namsiz)
			lchar(symbuf, i++, 0);
		ungetchr(c);
		csym = lookup();
		if(csym[0]==KeyType) {
			cval = csym[1];
			return(Keyword);
		}
		return(Name);
	}
	return(ctab[c]);
}

subseq(c,a,b) {
	auto chr;

	if((chr=getchr())==c)
		return(b);
	ungetchr(chr);
	return(a);
}

getstr() {
	extrn cval, loc;
	auto c, i, buf;

	buf = i = 0;
	while((c=mapch('"'))>=0) {
		lchar(&buf, i++, c);
		if(i==NCPW) {
			gen1('o', buf);
			buf = i = 0;
		}
	}
	gen1('o', buf);
}

getcc() {
	extrn cval;
	auto c, i;

	i = 0;
	cval = 0;
	while((c = mapch('*'')) >= 0)
		cval = (cval<<8) + c;
	return(Const);
}

mapch(d) {
	extrn eof;
	auto c;

	c = getchr();
	if(eof | c == '*n') {
		err('""', 0);
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

prtn(n, b) {
	auto a;

	if(a = n/b)
		prtn(a, b);
	putchar(n%b + '0');
}

err(c, sym) {
	extrn line, nerror, namsiz, fout;
	auto f;

	nerror++;
	f = fout;
	fout = 1;
	prtn(line, 10);
	putchar(' ');
	putchar(c);
	if(sym) {
		putchar(' ');
		write(fout, sym, namsiz);
	}
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
loc 1;
swsiz 120;
swtab[120];
swp 0;
nauto 0;
nlbl 0;
lblsiz 40;
lbltab[40];
peeksym 01777777777777777777777;	/* -1 */
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
	Space,   Not,     String,  Invalid, Invalid, Mod,     And,     SQuote,
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
	000000,	/* DQuote  ---- unused*/
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
	000701,	/* Comma */
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
