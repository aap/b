#include "def.h"
#include "../b.h"

enum {
	TEXT,
	DATA,
	BSS
};
int sect = TEXT;

void
prologue(void)
{
	prf("\tjmp\tend\n");
	prf(".even\n");
}

void
epilogue(void)
{
	prf(".text\n");
	prf("end:\tjsr\tpc,chain\n");
}

void
label(int l)
{
	prf("%l:\n", l);
}

void
clab(int l)
{
	prf(".data; %l: 1f; .text\n1:", l);
	sect = TEXT;
}

void
etcop(int n)
{
	prf("\tn%o\n", n);
}
void
binop(int n)
{
	prf("\tb%o\n", n);
}
void
unaop(int n)
{
	prf("\tu%o\n", n);
}
void
opsym(char *op, char *s)
{
	prf("\t%s; %n\n", op, s);
}
void
oplab(char *op, int l)
{
	if(l == 0)
		prf("\t%s; 1f\n", op);
	else
		prf("\t%s; %l\n", op, l);
}
void
opint(char *op, int i)
{
	prf("\t%s; %D\n", op, i);
}
void
opconst(char *op, word w)
{
	prf("\t%s; %wO\n", op, w);
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
		prf("\t1f\n");
	else
		prf("\t%l\n", l);
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
	prf(".globl %n\n", s);
}

void
textsym(void)
{
	if(sect != TEXT)
		prf(".text\n");
	sect = TEXT;
	prf("1: ");
}

void
datasym(char *s)
{
	if(sect != DATA)
		prf(".data\n");
	sect = DATA;
	if(s)
		prf("%n: ", s);
	else
		prf("1: ");
}

void
bsssym(char *s)
{
	if(sect != BSS)
		prf(".bss\n");
	sect = BSS;
	if(s)
		prf("%n: ", s);
	else
		prf("1: ");
}

void
skip(int n)
{
	prf(".=.+%D", n);
}

void
setlab(int lab, int val)
{
	prf("%l = %D\n", lab, val);
}

void
fixup(char *s, int n)
{
	if(s)
		fprf(tmpfil2, "\t%n\n", s);
	else
		fprf(tmpfil2, "\t%l\n", n);
}

void
startstr(int n)
{
	fprf(tmpfil1, "%l: .byte ", n);
}

void
strchar(int c)
{
	fprf(tmpfil1, "%O, ", c);
}

void
endstr(void)
{
	fprf(tmpfil1, "0; .even\n");
}
