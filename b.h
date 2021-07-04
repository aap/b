#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdarg.h>
#include <assert.h>

#include <unistd.h>
#include <fcntl.h>

#define nil NULL

/* machine independent configuration */
enum
{
	NCPS = 8,	/* number of characters per symbol */
	NSYMS = 400,	/* Size of symbol table */
	NNODES = 200,	/* Size of node storage */
	NNSTACK = 40,	/* Size of node stack */
	NSWITCH = 200,	/* Size of switch table */
};

enum
{
	/* types and keywords */
	KeyType = 1,
	Intern,
	Extern,
	Auto,
	Param,

	Goto,
	Return,
	If,
	While,
	Else,
	Switch,
	Case,
	Break,
	Default,
};

enum {
	Bin	= 1,
	R	= 2,
	Lval	= 4,
};

/* The string is just a debugging aid */
#define OPS\
	X(None,		"",		0,	0)\
	/* token types */\
	X(Space,	" ",		0,	0)\
	X(DQuote,	"\"",		0,	0)\
	X(SQuote,	"'",		0,	0)\
	X(LParen,	"(",		0,	0)\
	X(RParen,	")",		0,	0)\
	X(LBrack,	"[",		0,	0)\
	X(RBrack,	"]",		0,	0)\
	X(LBrace,	"{",		0,	0)\
	X(RBrace,	"}",		0,	0)\
	X(Semi,		";",		0,	0)\
	X(Digit,	"digit",	0,	0)\
	X(Letter,	"letter",	0,	0)\
	X(Const,	"const",	0,	0)\
	X(String,	"string",	0,	0)\
	X(Name,		"name",		0,	0)\
	X(Keyword,	"key",		0,	0)\
	/* misc */\
	X(Comma,	",",		6,	Bin|R)\
	X(Colon,	":",		12,	Bin|R)\
	X(Quest,	"?",		12,	Bin|R)\
	X(Call,		"$",		0,	Bin)\
	X(Vector,	"@",		0,	Bin)\
	/* binary operators */\
	X(Assign,	"=",		10,	Bin|R|Lval)\
	X(Or,		"|",		14,	Bin)\
	X(And,		"&",		16,	Bin)\
	X(Eq,		"==",		18,	Bin)\
	X(Neq,		"!=",		18,	Bin)\
	X(Leq,		"<=",		20,	Bin)\
	X(Less,		"<",		20,	Bin)\
	X(Geq,		">=",		20,	Bin)\
	X(Greater,	">",		20,	Bin)\
	X(RShift,	">>",		22,	Bin)\
	X(LShift,	"<<",		22,	Bin)\
	X(Plus,		"+",		24,	Bin)\
	X(Minus,	"-",		24,	Bin)\
	X(Mod,		"%",		26,	Bin)\
	X(Times,	"*",		26,	Bin)\
	X(Div,		"/",		26,	Bin)\
	X(AOr,		"=|",		10,	Bin|R|Lval)\
	X(AAnd,		"=&",		10,	Bin|R|Lval)\
	X(AEq,		"===",		10,	Bin|R|Lval)\
	X(ANeq,		"=!=",		10,	Bin|R|Lval)\
	X(ALeq,		"=<=",		10,	Bin|R|Lval)\
	X(ALess,	"=<",		10,	Bin|R|Lval)\
	X(AGeq,		"=>=",		10,	Bin|R|Lval)\
	X(AGreater,	"=>",		10,	Bin|R|Lval)\
	X(ARShift,	"=>>",		10,	Bin|R|Lval)\
	X(ALShift,	"=<<",		10,	Bin|R|Lval)\
	X(APlus,	"=+",		10,	Bin|R|Lval)\
	X(AMinus,	"=-",		10,	Bin|R|Lval)\
	X(AMod,		"=%",		10,	Bin|R|Lval)\
	X(ATimes,	"=*",		10,	Bin|R|Lval)\
	X(ADiv,		"=/",		10,	Bin|R|Lval)\
	/* unary operators */\
	X(Amp,		"&u",		28,	R|Lval)\
	X(Neg,		"-u",		28,	R)\
	X(Star,		"*u",		28,	R)\
	X(Not,		"!u",		28,	R)\
	X(Preinc,	"++u",		28,	R|Lval)\
	X(Predec,	"--u",		28,	R|Lval)\
	X(Postinc,	"u++",		28,	R|Lval)\
	X(Postdec,	"u--",		28,	R|Lval)

enum
{
#define X(def, str, prec, flag) def,
OPS
#undef X
	Invalid = 255,
};

typedef struct Sym Sym;
struct Sym
{
	int type;	/* keyword, extern, auto, label */
	int val;	/* keyword id, label number, stack offset */
	char name[NCPS];
};

typedef struct Node Node;
struct Node
{
	int op;
	union {
		Sym *s;
		word w;	/* const */
		int l;	/* string label */
		Node *n1;
	};
	Node *n2;
};

typedef struct SwCase SwCase;
struct SwCase
{
	word val;
	int lab;
};

#define prf(...) fprf(stdout, __VA_ARGS__)
void fprf(FILE *f, char *fmt, ...);

void prologue(void);
void epilogue(void);
void label(int l);
void clab(int cl);
void etcop(int n);
void binop(int n);
void unaop(int n);
void opsym(char *op, char *s);
void oplab(char *op, int l);
void opint(char *op, int i);
void opconst(char *op, word w);
void wdsym(char *s);
void wdlab(int i);
void wdint(int i);
void wdconst(word w);
void global(char *s);
void textsym(void);
void datasym(char *s);
void bsssym(char *s);
void skip(int n);
void setlab(int lab, int val);
void fixup(char *s, int n);
void startstr(int n);
void strchar(int c);
void endstr(void);

extern int loc;
extern int prevfix;
extern FILE *tmpfil1, *tmpfil2;
