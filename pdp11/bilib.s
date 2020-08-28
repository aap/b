.pc = r3
.dp = r4
.sp = r5

/ set frame size
.globl s
s:	mov	.dp,.sp	/ get current frame
	add	(.pc)+,.sp	/ put sp above it
	jmp	*(.pc)+

/ transfer if false
.globl f
f:	mov	(.pc)+,r0	/ get argument
	mov	-(.sp),(.sp)+	/ check top of stack
	bne	1f
	mov	r0,.pc	/ jump to target if == 0
1:	jmp	*(.pc)+

/ transfer
.globl t
t:	mov	(.pc)+,.pc
	jmp	*(.pc)+

/ init automatic vector
.globl y
y:	mov	.dp,r0
	add	(.pc)+,r0	/ address of pointer
	mov	r0,r1	/ remember address
	asr	r0	/ to byte address
	inc	r0	/ address of vector
	mov	r0,(r1)
	jmp	*(.pc)+

/ switch
.globl z
z:	mov	(.pc),.pc	/ go to switch table
	mov	-2(.sp),r0	/ switch value from stack
	mov	(.pc)+,r1	/ number of cases
1:	cmp	r0,(.pc)+	/ check case
	beq	1f
	tst	(.pc)+	/ skip label
	dec	r1
	bne	1b
	jmp	*(.pc)+	/ default
1:	mov	(.pc),.pc	/ case found
	jmp	*(.pc)+

.globl n1,n2,n3
/ mark
n2:	mov	.sp,-(sp)	/ remember .sp for function call
	tst	(.sp)+	/ slot for return address
	jmp	*(.pc)+
/ call
n3:	mov	(sp)+,.sp	/ pop .sp from sp
/ mcall
n1:	mov	.pc,(.sp)	/ save return address
	mov	-(.sp),.pc	/ jump to address on stack
	mov	.dp,(.sp)	/ replace by old frame pointer
	mov	.sp,.dp	/ setup new frame pointer
	jmp	*(.pc)+

/ index vector
.globl n4
n4:	mov	-(.sp),r1	/ vector address
	add	-(.sp),r1	/ add offset
	asl	r1	/ to byte address
	mov	(r1),(.sp)+	/ get value
	jmp	*(.pc)+

/ goto
.globl n6
n6:	mov	-2(.sp),.pc
	jmp	*(.pc)+

/ return with value
.globl n7
n7:	mov	-(.sp),r0	/ pop return value from stack
	mov	.dp,.sp	/ restore old stack
	mov	(.sp),.dp	/ restore old frame
	mov	r0,(.sp)+	/ push return value
	mov	(.sp),.pc	/ jump to return address
	jmp	*(.pc)+

/ return without value
.globl n11
n11:	mov	.dp,.sp	/ restore old stack
	mov	(.sp)+,.dp	/ restore old frame
	mov	(.sp),.pc	/ jump to return address
	jmp	*(.pc)+


/ push automatic lvalue
.globl va, iva
iva:	tst	-(.sp)
va:	mov	.dp,r1	/ frame
	add	(.pc)+,r1	/ offset
	asr	r1	/ to word address
	mov	r1,(.sp)+	/ push it
	jmp	*(.pc)+

/ push automatic rvalue
.globl a, ia
ia:	tst	-(.sp)
a:	mov	.dp,r1	/ frame
	add	(.pc)+,r1	/ offset
	mov	(r1),(.sp)+	/ push value
	jmp	*(.pc)+

/ push constant
.globl c, ic
ic:	mov	(.pc)+,-2(.sp)
	jmp	*(.pc)+
c:	mov	(.pc)+,(.sp)+
	jmp	*(.pc)+

/ push external lvalue
.globl vx, ivx
ivx:	tst	-(.sp)
vx:	mov	(.pc)+,r1
	asr	r1	/ to word address
	mov	r1,(.sp)+	/ push it
	jmp	*(.pc)+

/ push external rvalue
.globl x, ix
ix:	mov	*(.pc)+,-2(.sp)
	jmp	*(.pc)+
x:	mov	*(.pc)+,(.sp)+
	jmp	*(.pc)+

/ Unary operators

/ - operator
.globl u2
u2:	neg	-2(.sp)
	jmp	*(.pc)+

/ * operator
.globl u3
u3:	mov	-(.sp),r1
	asl	r1	/ to byte address
	mov	(r1),(.sp)+	/ push rvalue
	jmp	*(.pc)+

/ ! operator
.globl u4
u4:	tst	-(.sp)
	beq	1f
	clr	(.sp)+
	jmp	*(.pc)+
1:	mov	$1,(.sp)+
	jmp	*(.pc)+

/ prefix ++ operator
.globl u5
u5:	mov	-(.sp),r1
	asl	r1
	inc	(r1)
	mov	(r1),(.sp)+
	jmp	*(.pc)+

/ prefix -- operator
.globl u6
u6:	mov	-(.sp),r1
	asl	r1
	dec	(r1)
	mov	(r1),(.sp)+
	jmp	*(.pc)+

/ postfix ++ operator
.globl u7
u7:	mov	-(.sp),r1
	asl	r1
	mov	(r1),(.sp)+
	inc	(r1)
	jmp	*(.pc)+

/ postfix -- operator
.globl u10
u10:	mov	-(.sp),r1
	asl	r1
	mov	(r1),(.sp)+
	dec	(r1)
	jmp	*(.pc)+

/ Binary operators

/ = operator
.globl b1
b1:	mov	-(.sp),r0	/ value
	mov	-(.sp),r1
	asl	r1	/ address
	mov	r0,(r1)
	mov	r0,(.sp)+
	jmp	*(.pc)+

/ | operator
.globl b2
b2:	bis	-(.sp),-2(.sp)
	jmp	*(.pc)+

/ & operator
.globl b3
b3:	mov	-(.sp),r0
	com	r0
	bic	r0,-2(.sp)
	jmp	*(.pc)+

/ == operator
.globl b4
b4:	cmp	-(.sp),-(.sp)
	beq	1f
	clr	(.sp)+
	jmp	*(.pc)+
1:	mov	$1,(.sp)+
	jmp	*(.pc)+

/ != operator
.globl b5
b5:	cmp	-(.sp),-(.sp)
	bne	1f
	clr	(.sp)+
	jmp	*(.pc)+
1:	mov	$1,(.sp)+
	jmp	*(.pc)+

/ <= operator
.globl b6
b6:	cmp	-(.sp),-(.sp)
	bge	1f
	clr	(.sp)+
	jmp	*(.pc)+
1:	mov	$1,(.sp)+
	jmp	*(.pc)+

/ < operator
.globl b7
b7:	cmp	-(.sp),-(.sp)
	bgt	1f
	clr	(.sp)+
	jmp	*(.pc)+
1:	mov	$1,(.sp)+
	jmp	*(.pc)+

/ >= operator
.globl b10
b10:	cmp	-(.sp),-(.sp)
	ble	1f
	clr	(.sp)+
	jmp	*(.pc)+
1:	mov	$1,(.sp)+
	jmp	*(.pc)+

/ > operator
.globl b11
b11:	cmp	-(.sp),-(.sp)
	blt	1f
	clr	(.sp)+
	jmp	*(.pc)+
1:	mov	$1,(.sp)+
	jmp	*(.pc)+

/ >> operator
.globl b12
b12:	mov	-(.sp),r2	/ shift amount
	mov	-(.sp),r1	/ word
	clr	r0
	neg	r2	/ right shift
	ashc	r2,r0
	mov	r1,(.sp)+
	jmp	*(.pc)+

/ << operator
.globl b13
b13:	mov	-(.sp),r2	/ shift amount
	mov	-(.sp),r1	/ word
	clr	r0
	ashc	r2,r0
	mov	r1,(.sp)+
	jmp	*(.pc)+

/ + operator
.globl b14
b14:	add	-(.sp),-2(.sp)
	jmp	*(.pc)+

/ - operator
.globl b15
b15:	sub	-(.sp),-2(.sp)
	jmp	*(.pc)+

/ % operator
.globl b16
b16:	mov	-(.sp),r2	/ divisor
	mov	-(.sp),r1	/ dividend
	clr	r0
	div	r2,r0
	mov	r1,(.sp)+
	jmp	*(.pc)+

/ * operator
.globl b17
b17:	mov	-(.sp),r2	/ multiplier
	mov	-(.sp),r1	/ multiplicand
	mul	r2,r1
	mov	r1,(.sp)+
	jmp	*(.pc)+

/ / operator
.globl b20
b20:	mov	-(.sp),r2	/ divisor
	mov	-(.sp),r1	/ dividend
	clr	r0
	div	r2,r0
	mov	r0,(.sp)+
	jmp	*(.pc)+

/ =| operator
.globl b102
b102:	mov	-(.sp),r0	/ rvalue
	mov	-(.sp),r1
	asl	r1	/ lvalue
	bis	r0,(r1)
	mov	(r1),(.sp)+
	jmp	*(.pc)+

/ =& operator
.globl b103
b103:	mov	-(.sp),r0	/ rvalue
	mov	-(.sp),r1
	asl	r1	/ lvalue
	com	r0
	bic	r0,(r1)
	mov	(r1),(.sp)+
	jmp	*(.pc)+

/ =>> operator
.globl b112
b112:	mov	-(.sp),r2	/ rvalue
	mov	-(.sp),r1
	asl	r1	/ lvalue
	mov	r1,-(sp)
	mov	(r1),r1
	clr	r0
	neg	r2	/ right shift
	ashc	r2,r0
	mov	r1,*(sp)+
	mov	r1,(.sp)+
	jmp	*(.pc)+

/ =<< operator
.globl b113
b113:	mov	-(.sp),r2	/ rvalue
	mov	-(.sp),r1
	asl	r1	/ lvalue
	mov	r1,-(sp)
	mov	(r1),r1
	clr	r0
	ashc	r2,r0
	mov	r1,*(sp)+
	mov	r1,(.sp)+
	jmp	*(.pc)+

/ =+ operator
.globl b114
b114:	mov	-(.sp),r0	/ rvalue
	mov	-(.sp),r1
	asl	r1	/ lvalue
	add	r0,(r1)
	mov	(r1),(.sp)+
	jmp	*(.pc)+

/ =- operator
.globl b115
b115:	mov	-(.sp),r0	/ rvalue
	mov	-(.sp),r1
	asl	r1	/ lvalue
	sub	r0,(r1)
	mov	(r1),(.sp)+
	jmp	*(.pc)+

/ =% operator
.globl b116
b116:	mov	-(.sp),r2	/ rvalue
	mov	-(.sp),r1
	asl	r1	/ lvalue
	mov	r1,-(sp)
	mov	(r1),r1
	clr	r0
	div	r2,r0
	mov	r1,*(sp)+
	mov	r1,(.sp)+
	jmp	*(.pc)+

/ =* operator
.globl b117
b117:	mov	-(.sp),r2	/ rvalue
	mov	-(.sp),r0
	asl	r0	/ lvalue
	mov	r0,-(sp)
	mov	(r0),r0
	clr	r1
	mul	r2,r0
	mov	r1,*(sp)+
	mov	r1,(.sp)+
	jmp	*(.pc)+

/ =/ operator
.globl b120
b120:	mov	-(.sp),r2	/ rvalue
	mov	-(.sp),r1
	asl	r1	/ lvalue
	mov	r1,-(sp)
	mov	(r1),r1
	clr	r0
	div	r2,r0
	mov	r0,*(sp)+
	mov	r0,(.sp)+
	jmp	*(.pc)+
