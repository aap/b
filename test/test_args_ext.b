main() {
	extrn argv;
	auto i;

	printf("nargs: %d*n", argv[0]);
	i = 1;
	while(i <= argv[0]) {
		printf("%d: %s*n", i, argv[i]);
		i++;
	}
	return(0);
}
