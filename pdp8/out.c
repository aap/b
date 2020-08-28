#include "def.h"
#include "../b.h"

int tmplab;

void
prologue(void)
{
}

void
epilogue(void)
{
}

void
label(int n)
{
	prf("%l.,\n", n);
}

void
clab(int cl)
{
	int l;
	label(l = loc++);
	fprf(tmpfil, "%l., %l.\n", cl, l);
}

void
etcop(int n)
{
	prf("\tn%o.\n", n);
}
void
binop(int n)
{
	prf("\tb%o.\n", n);
}
void
unaop(int n)
{
	prf("\tu%o.\n", n);
}
void
opsym(char *op, char *s)
{
	prf("\t%s.;%n\n", op, s);
}
void
oplab(char *op, int l)
{
	if(l == 0)
		prf("\t%s.;%l.\n", op, tmplab=loc++);
	else
		prf("\t%s.;%l.\n", op, l);
}
void
opint(char *op, int i)
{
	prf("\t%s.;%D\n", op, i);
}
void
opconst(char *op, word w)
{
	prf("\t%s.;%wO\n", op, w);
}
void
wdsym(char *s)
{
	prf("\t%n\n", s);
}
void
wdlab(int l)
{
	if(l == 0)
		prf("\t%l.\n", tmplab=loc++);
	else
		prf("\t%l.\n", l);
}
void
wdint(int i)
{
	prf("\t%D\n", i);
}
void
wdconst(word w)
{
	prf("\t%wO\n", w);
}

void
global(char *s)
{
	(void)s;
}

void
textsym(void)
{
	prf("%l., ", tmplab);
}

void
datasym(char *s)
{
	if(s)
		prf("%n, ", s);
	else
		prf("%l., ", tmplab);
}

void
bsssym(char *s)
{
	datasym(s);
}

void
skip(int n)
{
	prf(".=.+%D", n);
}

void
fixup(char *s, int n)
{
	(void)s;
	(void)n;
}

void
startstr(int n)
{
	fprf(tmpfil, "%l., ", n);
}

void
strchar(int c)
{
	fprf(tmpfil, "%O, ", c);
}

void
endstr(void)
{
	fprf(tmpfil, "0\n");
}
