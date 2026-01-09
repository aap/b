printf(fmt, x1,x2,x3,x4,x5,x6,x7,x8,x9) {
	extrn printn, char, putchar;
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
	}
	putchar('%');
	i--;
	adx--;
	goto loop;
}
