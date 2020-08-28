#include <stdint.h>
enum
{
	/* the same number but conceptually different */
	NCPW = 1,	/* number of characters per word */
	NBPW = 1,	/* number of bytes per word */

	DECOR = 0,
	OCTFMT = 0,
	DECFMT = 1,
};
typedef uint16_t word;
