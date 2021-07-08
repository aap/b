path "foo";
main() {
	extrn path, fout;

	fout = creat(path, 0664);
	if(fout < 0)
		return(1);
	write(fout, "hello from B!*n", 14);
	close(fout);

	return(0);
}
