#include "def.h"
#include "b.h"

void extdef(void);
void enddef(void);
void func(void);
void decl(int type);
void stmt(void);
Node *expr(void);
Node *pexpr(void);
Node *tree(void);
Node *node(int op);
int build(int op);
void genxpr(Node *n, int lv);
void cjmp(Node *n, int l);
void jmp(int l);
void errflush(int t);
Sym *lookup(char *s);
int token(void);
int number(void);
int getcc(void);
int getstr(void);
int getchr(void);
void ungetchr(int c);

int loc;
int prevfix;
FILE *tmpfil1, *tmpfil2;

int opdope[] = {
#define X(def, str, prec, flag) prec<<6 | flag,
OPS
#undef X
};

char *opstr[] = {
#define X(def, str, prec, flag) str,
OPS
#undef X
};

unsigned char ctab[256];
int nerrors;
int eof;
int lineno = 1;
int peekc[2];
int npeek;
int peektok = -1;
Sym symtab[NSYMS];
int symsused;
Sym *sym;
word val;
int brklab;
int deflab;
int pop;
int stklab;
int stack;
int setstack;
Node nodes[NNODES];
int nalloc;
Node *nst[NNSTACK];
Node **np;
SwCase swtab[NSWITCH];
SwCase *swp;

void
panic(char *fmt, ...)
{
	va_list ap;
	va_start(ap, fmt);
	vfprintf(stderr, fmt, ap);
	fprintf(stderr, "\n");
	va_end(ap);
	exit(1);
}

void
err(char *fmt, ...)
{
	va_list ap;
	nerrors++;
	va_start(ap, fmt);
	fprintf(stderr, "%d error: ", lineno);
	vfprintf(stderr, fmt, ap);
	fprintf(stderr, "\n");
	va_end(ap);
}

void
uputn(FILE *f, uint64_t n, int b)
{
	if(n/b)
		uputn(f, n/b, b);
	putc(n%b + '0', f);
}
void
putn(FILE *f, int64_t n, int b)
{
	if(n < 0) {
		putchar('-');
		n = -n;
	}
	uputn(f, n, b);
}

void
fprf(FILE *f, char *fmt, ...)
{
	char *s;
	int n;
	int nfmt;
	word w;
	word wflg;
	int b;
	va_list ap;

	va_start(ap, fmt);
	for(; *fmt; fmt++) {
		if(*fmt != '%')
			putc(*fmt, f);
		else {
cont:			fmt++;
			nfmt = 0;
			switch(*fmt) {
			case 's':
				s = va_arg(ap, char*);
				while(*s)
					putc(*s++, f);
				break;
			case 'n':
				s = va_arg(ap, char*);
				if(DECOR)
					putc('_', f);
				n = NCPS;
				while(n-- && *s)
					putc(*s++, f);
				break;
			case 'O':
				if(OCTFMT)
					putc('0', f);
			case 'o':
				b = 8;
				goto num;
			case 'D':
				if(DECFMT)
					nfmt = 1;
			case 'd':
				b = 10;
num:
				if(wflg && sizeof(word) > sizeof(int)) {
					w = va_arg(ap, word);
					uputn(f, w, b);
				} else {
					n = va_arg(ap, int);
					putn(f, n, b);
				}
				if(nfmt)
					putc('.', f);
				break;
			case 'l':
				putc('l', f);
				b = 10;
				wflg = 0;
				goto num;
			case 'w':
				wflg = 1;
				goto cont;
			default:
				putc(*fmt, f);
			}
		}
		wflg = 0;
	}
	va_end(ap);
}

void
keyw(char *s, int t)
{
	char *bp, buf[NCPS];
	int i;
	Sym *sp;

	i = NCPS;
	bp = buf;
	while(i--)
		if((*bp++ = *s++) == '\0')
			s--;
	sp = lookup(buf);
	sp->type = KeyType;
	sp->val = t;
}

void
dumptbl(void)
{
	Sym *s;
	for(s = symtab; s < &symtab[NSYMS]; s++)
		if(s->name[0])
			prf("%n %d %d\n", s->name, s->type, s->val);
}

int
main(/*int argc, char *argv[]*/)
{
	int c;

	tmpfil1 = fopen("/tmp/b.tmp1", "w+");
	if(tmpfil1 == nil)
		panic("can't open file /tmp/b.tmp1");
	tmpfil2 = fopen("/tmp/b.tmp2", "w+");
	if(tmpfil2 == nil)
		panic("can't open file /tmp/b.tmp2");

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

	loc = 1;

	prologue();
	while(!eof) {
		extdef();
		enddef();
	}

	/* strings - in data segment */
	datasym(nil);
	rewind(tmpfil1);
	while(c = getc(tmpfil1), c != EOF)
		putchar(c);
	putchar('\n');

	epilogue();
	rewind(tmpfil2);
	while(c = getc(tmpfil2), c != EOF)
		putchar(c);
	wdconst(0);

	return nerrors != 0;
}

void
extdef(void)
{
	char *s;
	int t;
	int i, n;

	t = token();
	if(t == 0 || t == Semi)
		return;
	if(t != Name)
		goto syntax;
	sym->type = Extern;
	s = sym->name;
	global(s);
	switch(t = token()) {
	/* Single word */
	case Semi:
		bsssym(s);
		skip(NBPW);
		return;
	case Const:
		datasym(s);
		wdconst(val);
		return;
	case String:
		datasym(s);
		wdlab(val);
		fixup(s, 0);
		return;
	case Name:
		datasym(s);
		wdsym(sym->name);
		fixup(s, 0);
		return;

	/* Vector */
	case LBrack:
		t = token();
		n = 0;
		if(t == Const) {
			n = val;
			t = token();
		}
		if(t != RBrack)
			goto syntax;
		datasym(s);
		wdlab(0);
		fixup(s, 0);
		t = token();
		if(t == Semi) {
			bsssym(nil);
			skip(n*NBPW);
			return;
		}
		datasym(nil);
		while(t == Const || t == String || t == Name) {
			switch(t) {
			case Const:
				wdconst(val);
				break;
			case String:
				i = loc++;
				label(i);
				wdlab(val);
				fixup(nil, i);
				break;
			case Name:
				i = loc++;
				label(i);
				wdsym(sym->name);
				fixup(nil, i);
				break;
			}
			n--;
			t = token();
			if(t == Semi)
				break;
			if(t != Comma)
				goto syntax;
			t = token();
		}
		if(n > 0)
			skip(n*NBPW);
		return;

	/* Function */
	case LParen:
		datasym(s);
		wdlab(0);
		func();
		return;
	}
syntax:
	err("Definition syntax");
	errflush(t);
}

void
func(void)
{
	Sym *s;

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
	stack = 2*NBPW;		/* address of first variable */
	stklab = loc++;
	textsym();
	decl(Param);
	setstack = 1;
	stmt();
	etcop(9);
	setlab(stklab, stack);

	for(s = symtab; s < &symtab[NSYMS]; s++)
		if(s->name[0] != '\0' && s->type == 0)
			err("%.8s undefined", s->name);
}

void
enddef(void)
{
	Sym *s;

	for(s = symtab; s < &symtab[NSYMS]; s++)
		if(s->type != KeyType)
			memset(s, 0, sizeof(Sym));

	putchar('\n');
}

void
decl(int type)
{
	int t;

	while(t = token(), t == Name) {
		if(sym->type != 0)
			err("Redeclared %.8s", sym->name);
		sym->type = type;
		if(type == Param || type == Auto) {
			sym->type = Auto;
			sym->val = stack;
			stack += NBPW;
		}
		t = token();
		if(type == Auto) {
			/* Two ways to declare vectors */
			if(t == LBrack) {
				opint("y", sym->val);
				t = token();
				if(t == Const) {
					stack += val*NBPW;
					t = token();
				}
				if(t != RBrack)
					goto syntax;
				t = token();
			} else if(t == Const) {
				opint("y", sym->val);
				stack += val*NBPW;
				t = token();
			}
		}
		if(t != Comma)
			break;
	}
	if(type == Param && t != RParen)
		goto syntax;
	if(type != Param && t != Semi)
		goto syntax;
	return;

syntax:
	err("Declaration syntax");
	errflush(t);
}

void
setop(void)
{
	if(setstack) {
		oplab("s", stklab);
		setstack = 0;
		pop = 0;
	}
}

void
stmt(void)
{
	int l1, l2, l3;
	int c, t, i;
	SwCase *ssw;

stmt:
	t = token();
	switch(t) {
	case 0:
		err("Unexpected EOF");
		return;
	case RBrace:
		peektok = t;
	case Semi:
		return;
	case LBrace:
		while(t = token(), t != RBrace) {
			if(eof) {
				err("Expected }");
				break;
			}
			peektok = t;
			stmt();
		}
		return;

	case Keyword:
		switch(val) {
		case Auto:
			setstack = 1;
		case Extern:
			decl(val);
			goto stmt;

		case Return:
			if(peektok = token(), peektok == LParen) {
				setop();
				genxpr(pexpr(), 0);
				pop = 1;
				etcop(7);
				goto semi;
			}
			etcop(9);
			goto semi;

		case Goto:
			setop();
			genxpr(expr(), 0);
			pop = 1;
			etcop(6);
			goto semi;

		case If:
			setop();
			cjmp(pexpr(), l1=loc++);
			pop = 1;
			stmt();
			t = token();
			if(t == Keyword && val == Else) {
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
			setop();
			cjmp(pexpr(), brklab);
			pop = 1;
			stmt();
			jmp(l2);
			label(brklab);
			brklab = l1;
			return;

		case Switch:
			l1 = brklab;
			brklab = loc++;
			setop();
			/* TODO: actually expr(),
			 * but that might not parse nicely */
			genxpr(pexpr(), 0);
			pop = 1;

			oplab("z", l2=loc++);
			ssw = swp;
			if(swp == nil)
				swp = swtab;
			l3 = deflab;
			deflab = 0;
			stmt();
			jmp(brklab);
			if(deflab == 0)
				deflab = brklab;

			c = 0;
			while(swp > ssw && swp > swtab) {
				c++;
				swp--;
			}
			/* this wouldn't be so bad but the PDP-11 runtime
			 * doesn't handle this case */
			if(c == 0)
				err("No cases in switch");
			label(l2);
			wdint(c);
			for(i = 0; i < c; i++) {
				wdconst((word)swp[i].val);
				wdlab(swp[i].lab);
			}
			/* Fall through here if no case has been found.
			 * Put a jump to the default case if there is one. */
			if(deflab != brklab)
				jmp(deflab);

			label(brklab);
			deflab = l3;
			brklab = l1;
			return;
		case Case:
			if(t = token(), t != Const)
				goto syntax;
			if(t = token(), t != Colon)
				goto syntax;
			if(swp == nil) {
				err("Not in switch");
				goto stmt;
			}
			/* TODO: check size */
			swp->val = val;
			swp->lab = loc;
			swp++;
			label(loc++);
			goto stmt;
		case Break:
			if(brklab == 0)
				err("Nothing to break from");
			jmp(brklab);
			goto semi;
		case Default:
			if(swp == nil)
				err("Not in switch");
			if(deflab)
				err("default case already defined");
			if(t = token(), t != Colon)
				goto syntax;
			label(deflab = loc++);
			goto stmt;
		}
	case Name:
		c = getchr();
		if(c != ':') {
			ungetchr(c);
			break;
		}
		if(sym->type != 0) {
			err("Redefinition");
			goto stmt;
		}
		sym->type = Intern;
		if(sym->val == 0)
			sym->val = loc++;
		clab(sym->val);
		setstack = 1;
		goto stmt;
	}
	peektok = t;
	setop();
	genxpr(expr(), 0);
	pop = 1;
semi:	t = token();
	if(t != Semi)
		goto syntax;
	return;

syntax:
	err("Statement syntax %d", t);
	errflush(t);
	goto stmt;
}

Node*
pexpr(void)
{
	int t;
	Node *n;

	if(t = token(), t != LParen)
		goto syntax;
	n = expr();
	if(t = token(), t != RParen)
		goto syntax;
	return n;
syntax:
	err("Statement syntax");
	errflush(t);
	return nil;
}

Node*
expr(void)
{
	np = nst;
	nalloc = 0;
	return tree();
}

Node*
tree(void)
{
	int o, t;
	int opst[100];
	int *op;
	Node *n;
	int p, ps;
	int and;

	op = opst;
	*op = 0;
	and = 0;

next:
	t = token();
	switch(t) {
	/* Leaves */
	case Name:
		n = node(t);
		n->s = sym;
		if(sym->type == 0) {
			t = token();
			if(t == LParen)
				sym->type = Extern;
			else
				if(sym->val == 0)
					sym->val = loc++;
			peektok = t;
		}
		goto opnd;
	case Const:
		n = node(t);
		n->w = val;
		goto opnd;
	case String:
		n = node(t);
		n->l = val;
opnd:
		/* TODO: check space */
		*np++ = n;
		if(and)
			goto syntax;
		and = 1;
		goto next;

	/* Unary ops */
	case Preinc:
		if(and) {
			t = Postinc;
			goto opstk;
		}
		goto un;
	case Predec:
		if(and) {
			t = Postdec;
			goto opstk;
		}
		goto un;
	case Not:
		if(and) goto syntax;
		goto un;
	case Minus:
		if(!and) t = Neg;
		goto un;
	case And:
		if(!and) t = Amp;
		goto un;
	case Times:
		if(!and) t = Star;
		goto un;

	/* Vector addressing */
	case LBrack:
		if(!and)
			goto syntax;
		if(n = tree(), n == nil)
			goto flsh;
		t = token();
		if(t != RBrack)
			goto syntax;
		*np++ = n;
		if(build(Vector)) goto flsh;
		goto next;

	case LParen:
		if(and) {
			/* Function call */
			peektok = token();
			if(peektok == RParen) {
				peektok = -1;
				n = nil;
			} else {
				if(n = tree(), n == nil)
					goto flsh;
				if(t = token(), t != RParen)
					goto syntax;
			}
			*np++ = n;
			if(build(Call)) goto flsh;
			goto next;
		} else {	
			/* Sub-expression */
			if(n = tree(), n == nil)
				goto flsh;
			if(t = token(), t != RParen)
				goto syntax;
			goto opnd;
		}
	}
	/* Everything else should be binary */
	if(and == 0)
		goto syntax;
un:
	and = 0;
opstk:
	p = opdope[t]>>6;
	ps = opdope[*op]>>6;
	if(p > ps || p == ps && opdope[t]&R) {
		*++op = t;
		goto next;
	}

	if(o = *op--, o == 0) {
		peektok = t;
		return *--np;
	}
	if(build(o)) goto flsh;
	goto opstk;

syntax:
	err("Expression syntax");
flsh:	errflush(t);
	return nil;
}

Node*
node(int op)
{
	Node *n;
	n = &nodes[nalloc++];
	/* TODO: check space */
	n->op = op;
	n->n1 = nil;
	n->n2 = nil;
	return n;
}

int
build(int op)
{
	Node *n, *n1, *n2;

	if(op == Vector) {
		if(build(Plus)) return 1;
		op = Star;
	}

	n2 = nil;
	if(opdope[op] & Bin)
		n2 = *--np;
	n1 = *--np;

	switch(op) {
	case Quest:
		if(n2->op != Colon) {
			err(": Expected");
			return 1;
		}
		break;
	case Star:
		if(n1->op == Amp) {
			*np++ = n1->n1;
			return 0;
		}
		break;
	case Amp:
		if(n1->op == Star) {
			*np++ = n1->n1;
			return 0;
		}
		if(n1->op != Name) {
			err("Illegal lvalue");
			return 1;
		}
	}

	if(opdope[op] & Lval)
		if(n1->op != Star && n1->op != Name) {
			err("Illegal lvalue");
			return 1;
		}

	n = node(op);
	n->n1 = n1;
	n->n2 = n2;
	*np++ = n;
	return 0;
}

void
genleaf(Node *n, int lv)
{
	static char *a[] = { "a", "ia", "va", "iva" };
	static char *x[] = { "x", "ix", "vx", "ivx" };
	static char *c[] = { "c", "ic" };
	Sym *s;
	int i;

	i = pop;
	pop = 0;
	switch(n->op) {
	case Name:
		s = n->s;
		switch(s->type) {
		case Extern:
			opsym(x[lv<<1|i], s->name);
			break;
		case 0:		/* undefined labels */
		case Intern:
			oplab(x[lv<<1|i], (int)s->val);
			break;
		case Auto:
			opint(a[lv<<1|i], (int)s->val);
			break;
		default:
			panic("invalid type %d\n", s->type);
		}
		return;
	case Const:
		opconst(c[i], n->w);
		return;
	case String:
		oplab(x[2|i], n->l);
		return;
	}
}

void
genxpr(Node *n, int lv)
{
	int op, l1, l2;
	Node *n1, *n2;

	if(n == nil) return;
	op = n->op;
	n1 = n->n1;
	n2 = n->n2;
	switch(n->op) {
	case Name:
	case Const:
	case String:
		genleaf(n, lv);
		return;
	case Amp:
		if(n1->op == Name)
			genleaf(n1, 1);
		return;

	case Call:
		genxpr(n1, 0);
		if(n2 == nil) {
			etcop(1);
			return;
		}
		etcop(2);
		for(; n2->op == Comma; n2 = n2->n2)
			genxpr(n2->n1, 0);
		genxpr(n2, 0);
		etcop(3);
		return;
	case Comma:
		for(; n->op == Comma; n = n->n2) {
			genxpr(n->n1, 0);
			pop = 1;
		}
		genxpr(n, 0);
		return;
	case Quest:
		cjmp(n1, l1=loc++);
		pop = 1;
		genxpr(n2->n1, lv);
		jmp(l2=loc++);
		label(l1);
		pop = 1;
		genxpr(n2->n2, lv);
		label(l2);
		return;
	case Star:
		if(lv) {
			genxpr(n1, 0);
			return;
		}
		if(n1->op == Plus) {
			n->op = Vector;
			n->n1 = n1->n1;
			n->n2 = n1->n2;
			genxpr(n, 0);
			return;
		}
	}
	genxpr(n1, (opdope[op]&Lval)!=0);
	genxpr(n2, 0);

	if(op < Vector)
		err("UNKNOWN OP(%s)\n", opstr[op]);
	else if(op == Vector)
		etcop(4);
	else if(op <= Div)
		binop(op-Assign+1);
	else if(op <= ADiv)
		binop(op-AOr+0102);
	else if(op <= Postdec)
		unaop(op-Amp+1);
}

/* jump to label l if condition is false,
 * fall through otherwise. */
void
cjmp(Node *n, int l)
{
	int l1, l2;

	/* error */
	if(n == nil)
		return;
	switch(n->op) {
	case And:
		cjmp(n->n1, l);
		cjmp(n->n2, l);
		return;
	case Or:
		cjmp(n->n1, l1=loc++);
		jmp(l2=loc++);
		label(l1);
		cjmp(n->n2, l);
		label(l2);
		return;
	case Not:
		cjmp(n->n1, l1=loc++);
		jmp(l);
		label(l1);
	}
	genxpr(n, 0);
	pop = 1;
	oplab("f", l);
}

void
jmp(int l)
{
	oplab("t", l);
}

void
errflush(int t)
{
	while(t != Semi && t != LBrace && t != RBrace)
		t = token();
	peektok = t;
}

/* Lexical analysis */

Sym*
lookup(char *s)
{
	Sym *sp;
	int i, j;

	i = 0;
	j = NCPS;
	while(j--)
		i += s[j];
	if(i < 0)
		i = -i;
	i %= NSYMS;
	sp = &symtab[i];
	while(sp->name[0] != '\0') {
		if(strncmp(sp->name, s, NCPS) == 0)
			return sp;
		if(++sp >= &symtab[NSYMS])
			sp = &symtab[0];
	}
	if(++symsused >= NSYMS)
		panic("Symbol table overflow");
	sp->type = 0;
	sp->val = 0;
	memcpy(sp->name, s, NCPS);
	return sp;
}

int
token(void)
{
	char *bp, buf[NCPS];
	int c;
	int as;

	as = 0;
next:
	if(peektok >= 0) {
		c = peektok;
		peektok = -1;
		return c;
	}
	c = getchr();
	if(eof)
		return 0;
	switch(ctab[c]) {
	case Not:
		c = getchr();
		if(c == '=') return Neq;
		ungetchr(c);
		return Not;
	case Plus:
		c = getchr();
		if(c == '+') return Preinc;
		ungetchr(c);
		return Plus;
	case Minus:
		c = getchr();
		if(c == '-') return Predec;
		ungetchr(c);
/*
		if(ctab[c] == Digit) {
			ungetchr('-');
			return number();
		}
*/
		return Minus;
	case Less:
	less:
		c = getchr();
		if(c == '<') return as+LShift;
		if(c == '=') return as+Leq;
		ungetchr(c);
		return as+Less;
	case Greater:
	greater:
		c = getchr();
		if(c == '>') return as+RShift;
		if(c == '=') return as+Geq;
		ungetchr(c);
		return as+Greater;
	case Assign:
		c = getchr();
		if(c == '=') {
			c = getchr();
			if(c == '=') return AEq;
			ungetchr(c);
			return Eq;
		}
		as = AOr-Or;
		if(c == '<') goto less;
		if(c == '>') goto greater;
		if(c == '!') {
			c = getchr();
			if(c == '=') return ANeq;
			ungetchr(c);
			c = '!';
		}
		if(c == '/') {
			ungetchr(c = getchr());
			if(c != '*')
				return ADiv;
			c = '/';
		}
		if(strchr("|&+-*%", c))
			return as+ctab[c];
		ungetchr(c);
		return Assign;
	case Div:
		c = getchr();
		if(c != '*') {
			ungetchr(c);
			return Div;
		}
		while(1) {
			c = getchr();
			if(eof) {
				err("Unterminated comment");
				return 0;
			}
			if(c == '*') {
				c = getchr();
				if(c == '/')
					goto next;
			}
		}
	case SQuote:
		return getcc();
	case DQuote:
		return getstr();
	case Letter:
		bp = buf;
		while(ctab[c] == Letter || ctab[c] == Digit) {
			if(bp < &buf[NCPS])
				*bp++ = c;
			c = getchr();
		}
		ungetchr(c);
		while(bp < &buf[NCPS])
			*bp++ = '\0';
		sym = lookup(buf);
		if(sym->type == KeyType) {
			val = sym->val;
			return Keyword;
		}
		return Name;
	case Digit:
		ungetchr(c);
		return number();
	case Invalid:
		err("Unknown character %c", c);
	case Space:
		goto next;
	default:
		return ctab[c];
	}
}

int
mapch(int d)
{
	int c;
	c = getchr();
	if(eof || c == '\n') {
		err("Unterminated string");
		ungetchr(c);
		return -1;
	}
	if(c == d)
		return -1;
	if(c == '*') {
		c = getchr();
		switch(c) {
		/* TODO: *e something else than 0 on H6070? */
		case '0':
		case 'e': return '\0';
		case 't': return '\t';
		case 'n': return '\n';
		}
	}
	return c;
}

int
getcc(void)
{
	int c;
	int n;

	n = 0;
	val = 0;
	while(c = mapch('\''), c >= 0) {
		if(n < NCPW)
			/* TODO: this is platform dependent */
			val |= (word)c << 8*n;
		n++;
	}
	return Const;
}

int
getstr(void)
{
	int c;

	startstr(val = loc++);
	while(c = mapch('"'), c >= 0)
		strchar(c);
	endstr();
	return String;
}

int
number(void)
{
	int c;
	int b;
	int neg;

	neg = 0;
	val = 0;
	c = getchr();
	if(c == '-') {
		neg = 1;
		c = getchr();
	}
	b = 10;
	if(c == '0') {
		b = 8;
		c = getchr();
/*		if(c == 'x') {
			b = 16;
			c = getchr();
		}*/
	}
	while(ctab[c] == Digit) {
		val = val*b + c-'0';
		c = getchr();
	}
	ungetchr(c);
	if(neg)
		val = ~val + 1;
	return Const;
}

int
getchr(void)
{
	int c;

	if(npeek > 0) {
		c = peekc[--npeek];
		goto ret;
	}
	c = getchar();
	if(c <= 0) {
		eof = 1;
		return 0;
	}
ret:
	if(c == '\n')
		lineno++;
	return c;
}

void
ungetchr(int c)
{
	assert(npeek < 2);
	if(c == '\n')
		lineno--;
	peekc[npeek++] = c;
}

unsigned char ctab[256] = {
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
	Letter,  Letter,  Letter,  LBrace,  Or,      RBrace,  Invalid, Invalid,

	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
	Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid, Invalid,
};
