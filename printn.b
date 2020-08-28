printn(n, b) {
	auto a, d;

	d = 0;
	if(n < 0) {
		n = -n;
		if(n < 0) {
			n--;
			d = 1;
		} else
			putchar('-');
	}
	if(a = n/b)
		printn(a, b);
	putchar(n%b + '0' + d);
}
