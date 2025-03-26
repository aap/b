getarg(a,b,n) {
	auto i, c;

	i = 0;
	while((c=char(b,n)) == ' ')
		n++;
	while((c=char(b,n++)) != '*e' & c != ' ' & c != '*t')
		lchar(a,i++,c);
	return(n);
}

sixbit(c) {
	c =- 040;
	if(c < 0) return(0);
	if(c > 077) c =- 040;
	return(c&077);
}

sixch(s) {
	auto i, c, w;

	w = i = 0;
	while(i < 6 & (c=char(s,i++)) != '*e')
		w =+ sixbit(c)<<(6-i)*6;
	return(w);
}


