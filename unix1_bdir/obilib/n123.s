/ B function call
/
/ stack as set up for function call:
/            <- r5
/   argn
/   ...
/   arg1
/   XXX      <- r5 on stack
/   function address
/ n2 saves r5 on sp stack
/ n3 pops r5 and falls through to n1
/ n1 does the call
/
/ after the call:
/   argn
/   ...
/   arg2
/   arg1
/   return address
/   previous frame pointer     <- r4,r5

.globl	n1,n2,n3

n2:
	mov	r5,-(sp)	/ remember r5 for function call
	tst	(r5)+		/ slot for return address
	jmp	*(r3)+
n3:
	mov	(sp)+,r5	/ pop r5 from sp
n1:
	mov	r3,(r5)		/ save return address
	mov	-(r5),r3	/ jump to address on stack
	mov	r4,(r5)		/ replace by old frame pointer
	mov	r5,r4		/ setup new frame pointer
	jmp	*(r3)+
