ipc = r3
idp = r4
isp = r5

/ set frame size
.globl s
s:	mov	idp,isp	/ get current frame
	add	(ipc)+,isp	/ put sp above it
	jmp	*(ipc)+

/ transfer if false
.globl f
f:	mov	(ipc)+,r0	/ get argument
	mov	-(isp),(isp)+	/ check top of stack
	bne	1f
	mov	r0,ipc	/ jump to target if == 0
1:	jmp	*(ipc)+

/ transfer
.globl t
t:	mov	(ipc)+,ipc
	jmp	*(ipc)+

/ init automatic vector
.globl y
y:	mov	idp,r0
	add	(ipc)+,r0	/ address of pointer
	mov	r0,r1	/ remember address
	asr	r0	/ to byte address
	inc	r0	/ address of vector
	mov	r0,(r1)
	jmp	*(ipc)+

/ switch
.globl z
z:	mov	(ipc),ipc	/ go to switch table
	mov	-2(isp),r0	/ switch value from stack
	mov	(ipc)+,r1	/ number of cases
1:	cmp	r0,(ipc)+	/ check case
	beq	1f
	tst	(ipc)+	/ skip label
	dec	r1
	bne	1b
	jmp	*(ipc)+	/ default
1:	mov	(ipc),ipc	/ case found
	jmp	*(ipc)+

.globl n1,n2,n3
/ mark
n2:	mov	isp,-(sp)	/ remember isp for function call
	tst	(isp)+	/ slot for return address
	jmp	*(ipc)+
/ call
n3:	mov	(sp)+,isp	/ pop isp from sp
/ mcall
n1:	mov	ipc,(isp)	/ save return address
	mov	-(isp),ipc	/ jump to address on stack
	mov	idp,(isp)	/ replace by old frame pointer
	mov	isp,idp	/ setup new frame pointer
	jmp	*(ipc)+

/ index vector
.globl n4
n4:	mov	-(isp),r1	/ vector address
	add	-(isp),r1	/ add offset
	asl	r1	/ to byte address
	mov	(r1),(isp)+	/ get value
	jmp	*(ipc)+

/ goto
.globl n6
n6:	mov	-2(isp),ipc
	jmp	*(ipc)+

/ return with value
.globl n7
n7:	mov	-(isp),r0	/ pop return value from stack
	mov	idp,isp	/ restore old stack
	mov	(isp),idp	/ restore old frame
	mov	r0,(isp)+	/ push return value
	mov	(isp),ipc	/ jump to return address
	jmp	*(ipc)+

/ return without value
.globl n11
n11:	mov	idp,isp	/ restore old stack
	mov	(isp)+,idp	/ restore old frame
	mov	(isp),ipc	/ jump to return address
	jmp	*(ipc)+


/ push automatic lvalue
.globl va, iva
iva:	tst	-(isp)
va:	mov	idp,r1	/ frame
	add	(ipc)+,r1	/ offset
	asr	r1	/ to word address
	mov	r1,(isp)+	/ push it
	jmp	*(ipc)+

/ push automatic rvalue
.globl a, ia
ia:	tst	-(isp)
a:	mov	idp,r1	/ frame
	add	(ipc)+,r1	/ offset
	mov	(r1),(isp)+	/ push value
	jmp	*(ipc)+

/ push constant
.globl c, ic
ic:	mov	(ipc)+,-2(isp)
	jmp	*(ipc)+
c:	mov	(ipc)+,(isp)+
	jmp	*(ipc)+

/ push external lvalue
.globl vx, ivx
ivx:	tst	-(isp)
vx:	mov	(ipc)+,r1
	asr	r1	/ to word address
	mov	r1,(isp)+	/ push it
	jmp	*(ipc)+

/ push external rvalue
.globl x, ix
ix:	mov	*(ipc)+,-2(isp)
	jmp	*(ipc)+
x:	mov	*(ipc)+,(isp)+
	jmp	*(ipc)+

/ Unary operators

/ - operator
.globl u2
u2:	neg	-2(isp)
	jmp	*(ipc)+

/ * operator
.globl u3
u3:	mov	-(isp),r1
	asl	r1	/ to byte address
	mov	(r1),(isp)+	/ push rvalue
	jmp	*(ipc)+

/ ! operator
.globl u4
u4:	tst	-(isp)
	beq	1f
	clr	(isp)+
	jmp	*(ipc)+
1:	mov	$1,(isp)+
	jmp	*(ipc)+

/ prefix ++ operator
.globl u5
u5:	mov	-(isp),r1
	asl	r1
	inc	(r1)
	mov	(r1),(isp)+
	jmp	*(ipc)+

/ prefix -- operator
.globl u6
u6:	mov	-(isp),r1
	asl	r1
	dec	(r1)
	mov	(r1),(isp)+
	jmp	*(ipc)+

/ postfix ++ operator
.globl u7
u7:	mov	-(isp),r1
	asl	r1
	mov	(r1),(isp)+
	inc	(r1)
	jmp	*(ipc)+

/ postfix -- operator
.globl u10
u10:	mov	-(isp),r1
	asl	r1
	mov	(r1),(isp)+
	dec	(r1)
	jmp	*(ipc)+

/ Binary operators

/ = operator
.globl b1
b1:	mov	-(isp),r0	/ value
	mov	-(isp),r1
	asl	r1	/ address
	mov	r0,(r1)
	mov	r0,(isp)+
	jmp	*(ipc)+

/ | operator
.globl b2
b2:	bis	-(isp),-2(isp)
	jmp	*(ipc)+

/ & operator
.globl b3
b3:	mov	-(isp),r0
	com	r0
	bic	r0,-2(isp)
	jmp	*(ipc)+

/ == operator
.globl b4
b4:	cmp	-(isp),-(isp)
	beq	1f
	clr	(isp)+
	jmp	*(ipc)+
1:	mov	$1,(isp)+
	jmp	*(ipc)+

/ != operator
.globl b5
b5:	cmp	-(isp),-(isp)
	bne	1f
	clr	(isp)+
	jmp	*(ipc)+
1:	mov	$1,(isp)+
	jmp	*(ipc)+

/ <= operator
.globl b6
b6:	cmp	-(isp),-(isp)
	bge	1f
	clr	(isp)+
	jmp	*(ipc)+
1:	mov	$1,(isp)+
	jmp	*(ipc)+

/ < operator
.globl b7
b7:	cmp	-(isp),-(isp)
	bgt	1f
	clr	(isp)+
	jmp	*(ipc)+
1:	mov	$1,(isp)+
	jmp	*(ipc)+

/ >= operator
.globl b10
b10:	cmp	-(isp),-(isp)
	ble	1f
	clr	(isp)+
	jmp	*(ipc)+
1:	mov	$1,(isp)+
	jmp	*(ipc)+

/ > operator
.globl b11
b11:	cmp	-(isp),-(isp)
	blt	1f
	clr	(isp)+
	jmp	*(ipc)+
1:	mov	$1,(isp)+
	jmp	*(ipc)+

/ >> operator
.globl b12
b12:	mov	-(isp),r2	/ shift amount
	mov	-(isp),r1	/ word
	clr	r0
	neg	r2	/ right shift
	ashc	r2,r0
	mov	r1,(isp)+
	jmp	*(ipc)+

/ << operator
.globl b13
b13:	mov	-(isp),r2	/ shift amount
	mov	-(isp),r1	/ word
	clr	r0
	ashc	r2,r0
	mov	r1,(isp)+
	jmp	*(ipc)+

/ + operator
.globl b14
b14:	add	-(isp),-2(isp)
	jmp	*(ipc)+

/ - operator
.globl b15
b15:	sub	-(isp),-2(isp)
	jmp	*(ipc)+

/ % operator
.globl b16
b16:	mov	-(isp),r2	/ divisor
	mov	-(isp),r1	/ dividend
	clr	r0
	div	r2,r0
	mov	r1,(isp)+
	jmp	*(ipc)+

/ * operator
.globl b17
b17:	mov	-(isp),r2	/ multiplier
	mov	-(isp),r1	/ multiplicand
	mul	r2,r1
	mov	r1,(isp)+
	jmp	*(ipc)+

/ / operator
.globl b20
b20:	mov	-(isp),r2	/ divisor
	mov	-(isp),r1	/ dividend
	clr	r0
	div	r2,r0
	mov	r0,(isp)+
	jmp	*(ipc)+

/ =| operator
.globl b102
b102:	mov	-(isp),r0	/ rvalue
	mov	-(isp),r1
	asl	r1	/ lvalue
	bis	r0,(r1)
	mov	(r1),(isp)+
	jmp	*(ipc)+

/ =& operator
.globl b103
b103:	mov	-(isp),r0	/ rvalue
	mov	-(isp),r1
	asl	r1	/ lvalue
	com	r0
	bic	r0,(r1)
	mov	(r1),(isp)+
	jmp	*(ipc)+

/ =>> operator
.globl b112
b112:	mov	-(isp),r2	/ rvalue
	mov	-(isp),r1
	asl	r1	/ lvalue
	mov	r1,-(sp)
	mov	(r1),r1
	clr	r0
	neg	r2	/ right shift
	ashc	r2,r0
	mov	r1,*(sp)+
	mov	r1,(isp)+
	jmp	*(ipc)+

/ =<< operator
.globl b113
b113:	mov	-(isp),r2	/ rvalue
	mov	-(isp),r1
	asl	r1	/ lvalue
	mov	r1,-(sp)
	mov	(r1),r1
	clr	r0
	ashc	r2,r0
	mov	r1,*(sp)+
	mov	r1,(isp)+
	jmp	*(ipc)+

/ =+ operator
.globl b114
b114:	mov	-(isp),r0	/ rvalue
	mov	-(isp),r1
	asl	r1	/ lvalue
	add	r0,(r1)
	mov	(r1),(isp)+
	jmp	*(ipc)+

/ =- operator
.globl b115
b115:	mov	-(isp),r0	/ rvalue
	mov	-(isp),r1
	asl	r1	/ lvalue
	sub	r0,(r1)
	mov	(r1),(isp)+
	jmp	*(ipc)+

/ =% operator
.globl b116
b116:	mov	-(isp),r2	/ rvalue
	mov	-(isp),r1
	asl	r1	/ lvalue
	mov	r1,-(sp)
	mov	(r1),r1
	clr	r0
	div	r2,r0
	mov	r1,*(sp)+
	mov	r1,(isp)+
	jmp	*(ipc)+

/ =* operator
.globl b117
b117:	mov	-(isp),r2	/ rvalue
	mov	-(isp),r0
	asl	r0	/ lvalue
	mov	r0,-(sp)
	mov	(r0),r0
	clr	r1
	mul	r2,r0
	mov	r1,*(sp)+
	mov	r1,(isp)+
	jmp	*(ipc)+

/ =/ operator
.globl b120
b120:	mov	-(isp),r2	/ rvalue
	mov	-(isp),r1
	asl	r1	/ lvalue
	mov	r1,-(sp)
	mov	(r1),r1
	clr	r0
	div	r2,r0
	mov	r0,*(sp)+
	mov	r0,(isp)+
	jmp	*(ipc)+
