/* Turn B intermediate code to mips32 GNU assembly */

main(argc, argv) {
	extrn fout, fin, nerror, eof;

	if(argc<3) {
		error("Arg count");
		exit(1);
	}
	if((fin=open(argv[1],0))<0) {
		error("Can't find %s", argv[1]);
		exit(1);
	}
	if((fout=creat(argv[2], 0664))<0) {
		error("Can't create %s", argv[2]);
		exit(1);
	}

	printf(".set noreorder*n*tj*tend*n*tnop*n");
	textdata();

	printf(".data*n");
	strings();

	printf("*n.text*nend:*tjal*tchain*n*tnop*n");
	fixup();
	printf("*t.word 0*n");

	exit(nerror!=0);
}

textdata() {
	extrn fin, c;
	auto sect;

	sect = 0;
	seek(fin, 0, 0);
next:
	c = getchar();
	switch(c) {
	case 0:
		return;

	case 't':	/* text */
		if(sect == 3) {
			sect = 0;
			goto skip;
		}
		sect = 0;
		printf(".text");
		break;
	case 'd':	/* data */
		printf(".data");
		sect = 1;
		break;
	case 'b':	/* bss */
		printf(".bss");
		sect = 2;
		break;
	case 'a':	/* string section */
		sect = 3;
		goto skip;
	case 'w':	/* word (octal) */
		if(sect == 3)
			goto skip;
		printf(".word ");
		getchar();
		copyoct('*n');
		break;
	case 'v':	/* word (label) */
		printf(".word ");
		getchar();
		copy('*n');
		break;
	case 's':	/* space (words) */
		printf(".space");
		goto tobytes;
	case 'l':	/* label */
	case 'f':	/* fixup label */
		if(sect == 3)
			goto skip;
		getchar();
		copy('*n');
		putchar(':');
		break;
	case 'g':	/* global */
		printf(".global ");
		getchar();
		copy('*n');
		break;
	case 'q':	/* set stack sym (words) */
		getchar();
		copy(',');
		printf(" = ");
		goto tobytes;
	case '*t':	/* B code */
		printf("*t.word ");
		putchar(c = getchar());
		if(c == 'i')
			putchar(c = getchar());
		if(c == 'v')
			putchar(c = getchar());
		switch(c) {
		case 'c':
			/* convert to octal */
			putchar(',');
			putchar(getchar());
			copyoct('*n');
			break;
		case 'a':
		case 'y':
			putchar(',');
		tobytes:
			/* convert offset to bytes */
			copy('*n');
			printf("**4");
			break;
		default:
			c = getchar();
			if(c == ' ')
				putchar(',');
			putchar(c);
			copy('*n');
		}
		break;
	}
	putchar('*n');
skip:
	while(c != '*n')
		c = getchar();
	goto next;
}

strings() {
	extrn fin, c;
	auto sect;

	sect = 0;
	seek(fin, 0, 0);
next:
	c = getchar();
	switch(c) {
	case 0:
		return;

	case 't':	/* text */
		sect = 0;
		break;
	case 'a':	/* string section */
		sect = 3;
		break;
	case 'w':	/* word (octal) */
		if(sect != 3)
			break;
		printf(".word ");
		getchar();
		copyoct('*n');
		putchar('*n');
		break;
	case 'l':	/* label */
	case 'f':	/* fixup label */
		if(sect != 3)
			break;
		getchar();
		copy('*n');
		putchar(':');
		putchar('*n');
		break;
	}
	while(c != '*n')
		c = getchar();
	goto next;
}

fixup() {
	extrn fin, c;

	seek(fin, 0, 0);
next:
	c = getchar();
	switch(c) {
	case 0:
		return;

	case 'f':	/* fixup label */
		getchar();
		printf("*t.word ");
		copy('*n');
		putchar('*n');
	}
	while(c != '*n')
		c = getchar();
	goto next;
}

copyoct(d) {
	extrn c;

	c = getchar();
	if(c == '-') {
		putchar('-0');
	} else {
		putchar('0');
		putchar(c);
	}
	copy('*n');
}

copy(d) {
	extrn c;
	while((c=getchar()) != d)
		putchar(c);
}

error(s, p1, p2) {
	extrn fout, nerror;
	auto f;

	nerror++;
	f = fout;
	fout = 1;
	printf(s, p1, p2);
	putchar('*n');
	fout = f;
}

c 0;
nerror 0;
