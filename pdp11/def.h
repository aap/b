#include <stdint.h>
enum
{
	/* the same number but conceptually different */
	NCPW = 2,	/* number of characters per word */
	NBPW = 2,	/* number of bytes per word */

	DECOR = 1,
	OCTFMT = 0,
	DECFMT = 1,
};
typedef uint16_t word;
