main() {
	extrn args, fout, fin, nerror, eof;
	auto filnam, name 10;

	getarg(name,args,0);
	if((filnam = sixch(name)) == 0) {
usage:
		err('nm',0);
		exit(1);
	}
	if((fin=openr(10, filnam, sixch("b"))) < 0)
		goto usage;
	if((fout=openw(11, filnam, sixch("i"))) < 0)
		goto usage;

	keyw("auto", 4);
	keyw("extrn", 3);
	keyw("goto", 6);
	keyw("return", 7);
	keyw("if", 8);
	keyw("while", 9);
	keyw("else", 10);
	keyw("switch", 11);
	keyw("case", 12);

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
	np[0] = 1;
	np[1] = t;
}

extdef() {
	extrn csym, cval, loc, peeksym, nauto, nlbl, lbltab;
	auto o, i, n;

	if(((o=symbol())==0) | o==10)
		return;
	if(o!=15)
		goto syntax;
	csym[0] = 3;
	gensym('g', csym+2);
	n = 1;
	if((peeksym=symbol())==6) {
		peeksym = -1;
		n = 0;
		if((o=symbol())==13) {
			n = cval;
			o = symbol();
		}
		if(o!=7)
			goto syntax;
		gen0('v');
	}
loop:
	switch(o=symbol()) {
	case 4:
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
		declare(5);
		gen0('S');
		stmt();
		gen1('n', 011);
		/* write out internals */
		gen0('p');
		i = 0;
		while(i < nlbl)
			gen1('l', lbltab[i++]);
		return;

	case 10:
	done:
		if(n > 0)
			gen1('r', n);
		return;

	case 13:
		gen1('o', cval);
	semi:
		n--;
		if((o=symbol()) == 10)
			goto done;
		if(o != 17)
			goto syntax;
		goto loop;

	case 14:
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
		if(s[0] != 1) {
			s[2] = 0;
			symused--;
		}
		s =+ symsz;
	}
}

declare(kw) {
	extrn csym, cval, nauto;
	auto o;

	while((o=symbol())==15) {
		if(*csym!=0)
			err('rd', csym+2);
		*csym = kw;
		if(kw!=3) {
			*csym = 4;
			csym[1] = nauto++;
		}
		o = symbol();
		if(kw==4 & o==13) {
			gen1('y', csym[1]);
			nauto =+ cval;
			o = symbol();
		}
		if(o != 17)
			goto done;
	}
done:
	if(o==10 & kw!=5 | o==5 & kw==5)
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

	case 9:
		peeksym = o;
	case 10:
		return;

	case 8:
		while(!eof) {
			if((o=symbol())==9)
				return;
			peeksym = o;
			stmt();
		}
		err('$)', 0);
		return;

	case 16:
		switch(cval) {
		case 4:
		case 3:
			declare(cval);
			goto stmt;

		case 6:
			expr();
			gen1('n', 6);
			goto semi;

		case 7:
			if((peeksym=symbol())==4) {
				pexpr();
				gen1('n', 7);
				goto semi;
			}
			gen1('n', 011);
			goto semi;

		case 8:
			pexpr();
			gen1('f', l1=loc++);
			stmt();
			if((o=symbol())==16 & cval==10) {
				gen1('t', l2=loc++);
				label(l1);
				stmt();
				label(l2);
				return;
			}
			peeksym = o;
			label(l1);
			return;

		case 9:
			label(l1 = loc++);
			l2 = loc++;
			pexpr();
			gen1('f', l2);
			stmt();
			gen1('t', l1);
			label(l2);
			return;

		case 12:
			if((o=symbol())!=13)
				goto syntax;
			if((o=symbol())!=18)
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

		case 11:
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

	case 15:
		if(peekc==':') {
			peekc = 0;
			if(csym[0]>0) {
				err('rd', csym+2);
				goto stmt;
			}
			csym[0] = 2;
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
	if((o=symbol())==10)
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
putw(w) {
	if(w < 0)
		putchar('-');
	prtn(w, 8);
	putchar(' ');
}
putsym(s) {
	extrn namsiz;
	auto i, c;
	i = 0;
	while(i < namsiz & (c=char(s,i++))!=0)
		putchar(c);
	putchar(' ');
}
gen0(o) {
	putchar(o);
	putchar('*n');
}
gen1(o, a) {
	putchar(o);
	putw(a);
	putchar('*n');
}
gen2(o, a, b) {
	putchar(o);
	putw(a);
	putw(b);
	putchar('*n');
}
gensym(o, s) {
	putchar(o);
	putsym(s);
	putchar('*n');
}


pexpr() {
	auto t;

	if((t = symbol()) != 4)
		goto syntax;
	expr();
	if((t = symbol()) == 5)
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
	case 15:
		/* Have to be very careful here because symbol()
		 * can peek a token itself after a '='.
		 * In particular it can overwrite csym then.
		 * e.g. 'a =b' will return '=' and peek b,
		 * overwriting a's csym. */
		if(*csym==0) {
			/* this is the best we can do to recognize a call */
			if(peekc=='(')
				csym[0] = 3;
			else
				/* otherwise assume it's a label */
				deflab();
		}
		switch(*csym) {
		case 3:
			gensym('x', csym+2);
			goto tand;
		case 0:
		case 2:
			gen1('i', csym[1]-1);
			goto tand;
		case 4:
			gen1('a', csym[1]);
			goto tand;
		}
		goto syntax;

	case 13:
	case13:
		gen1('c', cval);
		goto tand;

	case 14:
		gen0('<');
		getstr();
		gen0('>');
	tand:
		if(andflg)
			goto syntax;
		andflg = 1;
		goto advanc;

	/* unary operators */

	case 58:
	case 59:
		if(andflg)
			o =+ 2;
		goto oponst;

	case 57:
		if(andflg)
			goto syntax;
		goto oponst;

	case 35:
		if(!andflg) {
			if((peeksym=symbol())==13) {
				peeksym = -1;
				cval = -cval;
				goto case13;
			}
			o = 55;
		}
		andflg = 0;
		goto oponst;

	case 25:
	case 37:
		if(andflg)
			andflg = 0;
		else if(o==25)
			o = 54;
		else
			o = 56;
		goto oponst;

	/* special tokens */
	case 4:
		if(andflg) {
			/* function call */
			if((o=symbol())==5) {
				/* empty call */
				o = 21;
			} else {
				peeksym = o;
				o = 20;
				andflg = 0;
			}
		}
		goto oponst;

	case 5:
	case 7:
		if(!andflg)
			goto syntax;
		goto oponst;
	}

	/* binary operators */
	if(!andflg)
		goto syntax;
	andflg = 0;

oponst:
	p = opdope[o];
	/* new op binds tighter, so push onto stack */
	if(p>*pp | p==*pp & (p&1)!=0) {
		switch(o) {
		/* Make parens (and calls) such low precedence
		 * that only closing paren can pop. */
		case 20:
			gen1('n', 2);
		case 4:
		case 6:
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

	case 19:
		gen1('?', loc++);
		loc++;
	case 18:
		goto oponst;

	case 20:
		if(o!=5)
			goto syntax;
		gen1('n', 3);
		goto advanc;

	case 21:
		gen1('n', 1);
	case 17:
		goto oponst;

	case 4:
		if(o!=5)
			goto syntax;
		goto advanc;

	case 6:
		if(o!=7)
			goto syntax;
		gen1('n', 4);
		goto advanc;

	}
fbuild:
	if(os < 23)
		goto syntax;
	else if(os <= 38)
		gen1('b', os-23+1);
	else if(os <= 53)
		gen1('b', os-39+0102);
	else if(os <= 61)
		gen1('u', os-54+1);
	goto oponst;

syntax:
	err('ex', 0);
	errflush(o);
}

errflush(t) {
	extrn peeksym;

	while(t != 10 & t != 8 & t != 9)
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
	case 1:
		goto next;

	case 34:
		return(subseq('+', 34, 58));

	case 35:
		return(subseq('-', 35, 59));

	case 57:
		return(subseq('=', 57, 27));

	case 29:
		if(subseq('<', 0, 1))
			return(33);
		return(subseq('=', 29, 28));

	case 31:
		if(subseq('>', 0, 1))
			return(32);
		return(subseq('=', 31, 30));

	case 23:
		/* First handle ==, === to avoid recursion later */
		if((c = getchr()) == '=')
			return(subseq('=', 26, 41));
		/* NB: does not handle comments! */
		if(ctab[c] == 1)
			return(23);
		ungetchr(c);
		/* BUG: this is a big kludge! */
		c = symbol();
		if(c >= 24 & c <= 38)
			return(c - 24 + 39);
/*		if(peeksym >= 0) error("OVERWRITING peeked symbol (%o %o)", peeksym, c); */
		peeksym = c;
		return(23);

	case 38:
		if(subseq('**', 1, 0))
			return(38);
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

	case 11:
		cval = 0;
		if(c=='0')
			b = 8;
		else
			b = 10;
		while(ctab[c]==11) {
			cval = cval*b + c-'0';
			c = getchr();
		}
		ungetchr(c);
		return(13);

	case 3:
		return(getcc());

	case 12:
		i = 0;
		while(ctab[c]==12 | ctab[c]==11) {
			if(i < namsiz) lchar(symbuf, i++, c);
			c = getchr();
		}
		while(i<namsiz)
			lchar(symbuf, i++, 0);
		ungetchr(c);
		csym = lookup();
		if(csym[0]==1) {
			cval = csym[1];
			return(16);
		}
		return(15);
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
	auto c;

	while((c=mapch('"'))>=0)
		gen1('o', c);
}

getcc() {
	extrn cval, nbpc;
	auto c;

	cval = 0;
	while((c = mapch('*'')) >= 0)
		cval = (cval<<nbpc) + c;
	return(13);
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
		case 'r': return(015);
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

	if(n < 0) n = -n;
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
		putsym(sym);
	}
	putchar('*n');
	fout = f;
}

symbuf[2];
nwps 2;
nbpc 7;
namsiz 10;
symsz 4;
symused 0;
stabsz 400;
stablen 1600;
symtab[1600];	/* 4*400 */
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
	255, 255, 255, 255, 255, 255, 255, 255,
	255, 1,   1,   1,   255, 1,   255, 255,
	255, 255, 255, 255, 255, 255, 255, 255,
	255, 255, 255, 255, 255, 255, 255, 255,
	1,   57,     14,  255, 255, 36,     25,     3,
	4,  5,  37,   34,    17,   35,   12,  38,
	11,   11,   11,   11,   11,   11,   11,   11,
	11,   11,   18,   10,    29,    23,  31, 19,
	255, 12,  12,  12,  12,  12,  12,  12,
	12,  12,  12,  12,  12,  12,  12,  12,
	12,  12,  12,  12,  12,  12,  12,  12,
	12,  12,  12,  6,  255, 7,  255, 12,
	255, 12,  12,  12,  12,  12,  12,  12,
	12,  12,  12,  12,  12,  12,  12,  12,
	12,  12,  12,  12,  12,  12,  12,  12,
	12,  12,  12,  8,  24,      9,  255, 255;

/* precedence, odd means right assoc */
opdope[]
	000,	/* None */
	000,	/* 1 */
	000,	/* 2  ---- unused*/
	000,	/* 3 */
	036,	/* 4 */
	002,	/* 5 */
	036,	/* 6 */
	002,	/* 7 */
	000,	/* 8 */
	000,	/* 9 */
	000,	/* 10 */
	000,	/* 11 */
	000,	/* 12 */
	000,	/* 13 */
	000,	/* 14 */
	000,	/* 15 */
	000,	/* 16 */
	006,	/* 17 */
	015,	/* 18 */
	015,	/* 19 */
	036,	/* 20 */
	036,	/* 21 */
	000,	/* 22 */
	013,	/* 23 */
	016,	/* 24 */
	020,	/* 25 */
	022,	/* 26 */
	022,	/* 27 */
	024,	/* 28 */
	024,	/* 29 */
	024,	/* 30 */
	024,	/* 31 */
	026,	/* 32 */
	026,	/* 33 */
	030,	/* 34 */
	030,	/* 35 */
	032,	/* 36 */
	032,	/* 37 */
	032,	/* 38 */
	013,	/* 39 */
	013,	/* 40 */
	013,	/* 41 */
	013,	/* 42 */
	013,	/* 43 */
	013,	/* 44 */
	013,	/* 45 */
	013,	/* 46 */
	013,	/* 47 */
	013,	/* 48 */
	013,	/* 49 */
	013,	/* 50 */
	013,	/* 51 */
	013,	/* 52 */
	013,	/* 53 */
	035,	/* 54 */
	035,	/* 55 */
	035,	/* 56 */
	035,	/* 57 */
	035,	/* 58 */
	035,	/* 59 */
	035,	/* 60 */
	035	/* 61 */
;
