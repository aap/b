main(argc, argv) {
	auto i;

	printf("nargs: %d*n", argc);
	i = 0;
	while(i < argc) {
		printf("%d: %s*n", i, argv[i]);
		i++;
	}
	return(0);
}
