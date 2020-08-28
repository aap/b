#include <stdint.h>
enum
{
	/* the same number but conceptually different */
	NCPW = 8,	/* number of characters per word */
	NBPW = 8,	/* number of bytes per word */

	DECOR = 1,
	OCTFMT = 1,
	DECFMT = 0,
};
typedef uint64_t word;
