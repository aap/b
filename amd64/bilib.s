.set dp, %r13
.set sp, %r14
.set pc, %r15

.macro	FETCH skip=0
	add $8+\skip, pc
	jmp *-8(pc)
.endm


.extern fetch

# set stack
.globl s
s:
	mov	dp,sp
	add	(pc),sp
	FETCH	8

# transfer if false
.globl f
f:
	cmpq	$0,-8(sp)
	jz	t
	FETCH	8

# transfer
.globl t
t:
	mov	(pc),pc
	FETCH

# init automatic vector
.globl y
y:
	mov	dp,%rax
	add	(pc),%rax
	lea	8(%rax),%rbx
	shr	$3,%rbx
	mov	%rbx,(%rax)
	FETCH	8

# switch
.globl z
z:
	mov	(pc),%rsi
	mov	-8(sp),%rbx
	lodsq
	mov	%rax,%rcx
1:	lodsq
	cmp	%rax,%rbx
	je	2f
	add	$8, %rsi
	dec	%rcx
	jnz	1b
	lea	8(%rsi), pc	# manually inlined FETCH
	jmp	*(%rsi)
2:	mov	(%rsi),pc
	FETCH

.globl n1,n2,n3
# call
n3:
	pop	sp
# mcall
n1:
	mov	pc,(sp)
	sub	$8,sp
	mov	(sp),pc
	mov	dp,(sp)
	mov	sp,dp
	FETCH
# mark
n2:	push	sp
	add	$8,sp
	FETCH

# index vector
.globl n4
n4:
	mov	-8(sp),%rax
	add	-16(sp),%rax
	sub	$8,sp
	mov	(,%rax,8),%rax
	mov	%rax,-8(sp)
	FETCH

# goto
.globl n6
n6:
	mov	-8(sp),pc
	FETCH

# return with value
.globl n7
n7:
	mov	-8(sp),%rax
	mov	dp,sp
	mov	(sp),dp
	mov	%rax,(sp)
	add	$8,sp
	mov	(sp),pc
	FETCH

# return without value
.globl n11
n11:
	mov	dp,sp
	mov	(sp),dp
	add	$8,sp
	mov	(sp),pc
	FETCH

#
# Push values
#

# push automatic lvalue
.globl va, iva
va:	add	$8,sp
iva:	mov	dp,%rax
	add	(pc),%rax
	shr	$3,%rax
	mov	%rax,-8(sp)
	FETCH	8

# push automatic rvalue
.globl a, ia
a:	add	$8,sp
ia:	mov	dp,%rax
	add	(pc),%rax
	mov	(%rax),%rax
	mov	%rax,-8(sp)
	FETCH	8

# push constant
.globl c, ic
c:	add	$8,sp
ic:	mov	(pc),%rax
	mov	%rax,-8(sp)
	FETCH	8

# push external lvalue
.globl vx, ivx
vx:	add	$8,sp
ivx:	mov	(pc),%rax
	shr	$3,%rax
	mov	%rax,-8(sp)
	FETCH	8

# push external rvalue
.globl x, ix
x:	add	$8,sp
ix:	mov	(pc),%rax
	mov	(%rax),%rax
	mov	%rax,-8(sp)
	FETCH	8

#
# Unary operators
#

# - operator
.globl u2
u2:
	negq	-8(sp)
	FETCH

# * operator
.globl u3
u3:
	mov	-8(sp),%rax
	mov	(,%rax,8),%rax
	mov	%rax,-8(sp)
	FETCH

# ! operator
.globl u4
u4:
	xor	%rax,%rax
	cmpq	%rax,-8(sp)
	setz	%al
	mov	%rax,-8(sp)
	FETCH

# prefix ++ operator
.globl u5
u5:
	mov	-8(sp),%rax
	shl	$3,%rax
	mov	(%rax),%rdx
	inc	%rdx
	mov	%rdx,(%rax)
	mov	%rdx,-8(sp)
	FETCH

# prefix -- operator
.globl u6
u6:
	mov	-8(sp),%rax
	shl	$3,%rax
	mov	(%rax),%rdx
	dec	%rdx
	mov	%rdx,(%rax)
	mov	%rdx,-8(sp)
	FETCH

# postfix ++ operator
.globl u7
u7:
	mov	-8(sp),%rax
	shl	$3,%rax
	mov	(%rax),%rdx
	mov	%rdx,-8(sp)
	inc	%rdx
	mov	%rdx,(%rax)
	FETCH

# postfix -- operator
.globl u10
u10:
	mov	-8(sp),%rax
	shl	$3,%rax
	mov	(%rax),%rdx
	mov	%rdx,-8(sp)
	dec	%rdx
	mov	%rdx,(%rax)
	FETCH

#
# Binary operators
#

# = operator
.globl b1
b1:
	mov	-8(sp),%rax	# value
	mov	-16(sp),%rbx	# address
	sub	$8,sp
	mov	%rax,(,%rbx,8)
	mov	%rax,-8(sp)
	FETCH

# | operator
.globl b2
b2:
	mov	-8(sp),%rax
	or	%rax,-16(sp)
	sub	$8,sp
	FETCH

# & operator
.globl b3
b3:
	mov	-8(sp),%rax
	and	%rax,-16(sp)
	sub	$8,sp
	FETCH

# == operator
.globl b4
b4:
	xor	%rax,%rax
	mov	-8(sp),%rdx
	cmp	-16(sp),%rdx
	sete	%al
	sub	$8,sp
	mov	%rax,-8(sp)
	FETCH

# != operator
.globl b5
b5:
	xor	%rax,%rax
	mov	-8(sp),%rdx
	cmp	-16(sp),%rdx
	setne	%al
	sub	$8,sp
	mov	%rax,-8(sp)
	FETCH

# <= operator
.globl b6
b6:
	xor	%rax,%rax
	mov	-16(sp),%rdx
	cmp	-8(sp),%rdx
	setle	%al
	sub	$8,sp
	mov	%rax,-8(sp)
	FETCH

# < operator
.globl b7
b7:
	xor	%rax,%rax
	mov	-16(sp),%rdx
	cmp	-8(sp),%rdx
	setl	%al
	sub	$8,sp
	mov	%rax,-8(sp)
	FETCH

# >= operator
.globl b10
b10:
	xor	%rax,%rax
	mov	-16(sp),%rdx
	cmp	-8(sp),%rdx
	setge	%al
	sub	$8,sp
	mov	%rax,-8(sp)
	FETCH

# > operator
.globl b11
b11:
	xor	%rax,%rax
	mov	-16(sp),%rdx
	cmp	-8(sp),%rdx
	setg	%al
	sub	$8,sp
	mov	%rax,-8(sp)
	FETCH

# >> operator
.globl b12
b12:
	mov	-16(sp),%rax
	mov	-8(sp),%ecx
	shr	%cl,%rax
	sub	$8,sp
	mov	%rax,-8(sp)
	FETCH

# << operator
.globl b13
b13:
	mov	-16(sp),%rax
	mov	-8(sp),%ecx
	shl	%cl,%rax
	sub	$8,sp
	mov	%rax,-8(sp)
	FETCH

# + operator
.globl b14
b14:
	mov	-8(sp),%rax
	add	%rax, -16(sp)
	sub	$8,sp
	FETCH

# - operator
.globl b15
b15:
	mov	-8(sp),%rax
	sub	%rax, -16(sp)
	sub	$8,sp
	FETCH

# % operator
.globl b16
b16:
	mov	-16(sp),%rax
	cqto
	idivq	-8(sp)
	sub	$8,sp
	mov	%rdx,-8(sp)
	FETCH

# * operator
.globl b17
b17:
	mov	-8(sp),%rax
	imul	-16(sp), %rax
	sub	$8,sp
	mov	%rax, -8(sp)
	FETCH

# / operator
.globl b20
b20:
	mov	-16(sp),%rax
	cqto
	idivq	-8(sp)
	sub	$8,sp
	mov	%rax,-8(sp)
	FETCH

# =| operator
.globl b102
b102:
	mov	-8(sp),%rax	# value
	mov	-16(sp),%rbx	# address
	sub	$8,sp
	shl	$3,%rbx
	or	(%rbx),%rax
	mov	%rax,(%rbx)
	mov	%rax,-8(sp)
	FETCH

# =& operator
.globl b103
b103:
	mov	-8(sp),%rax	# value
	mov	-16(sp),%rbx	# address
	sub	$8,sp
	shl	$3,%rbx
	and	(%rbx),%rax
	mov	%rax,(%rbx)
	mov	%rax,-8(sp)
	FETCH

# =>> operator
.globl b112
b112:
	mov	-8(sp),%ecx	# value
	mov	-16(sp),%rbx	# address
	sub	$8,sp
	shl	$3,%rbx
	mov	(%rbx),%rax
	shr	%cl,%rax
	mov	%rax,(%rbx)
	mov	%rax,-8(sp)
	FETCH

# =<< operator
.globl b113
b113:
	mov	-8(sp),%ecx	# value
	mov	-16(sp),%rbx	# address
	sub	$8,sp
	shl	$3,%rbx
	mov	(%rbx),%rax
	shl	%cl,%rax
	mov	%rax,(%rbx)
	mov	%rax,-8(sp)
	FETCH

# =+ operator
.globl b114
b114:
	mov	-8(sp),%rax	# value
	mov	-16(sp),%rbx	# address
	sub	$8,sp
	shl	$3,%rbx
	add	(%rbx),%rax
	mov	%rax,(%rbx)
	mov	%rax,-8(sp)
	FETCH

# =- operator
.globl b115
b115:
	mov	-8(sp),%rax	# value
	mov	-16(sp),%rbx	# address
	sub	$8,sp
	shl	$3,%rbx
	sub	%rax,(%rbx)
	mov	(%rbx),%rax
	mov	%rax,-8(sp)
	FETCH

# =% operator
.globl b116
b116:
	mov	-16(sp),%rbx	# address
	shl	$3,%rbx
	mov	(%rbx),%rax
	cqto
	idivq	-8(sp)
	sub	$8,sp
	mov	%rdx,(%rbx)
	mov	%rdx,-8(sp)
	FETCH

# =* operator
.globl b117
b117:
	mov	-16(sp),%rbx	# address
	shl	$3,%rbx
	mov	(%rbx),%rax
	imul	-8(sp), %rax
	sub	$8,sp
	mov	%rax,(%rbx)
	mov	%rax,-8(sp)
	FETCH

# =/ operator
.globl b120
b120:
	mov	-16(sp),%rbx	# address
	shl	$3,%rbx
	mov	(%rbx),%rax
	cqto
	idivq	-8(sp)
	sub	$8,sp
	mov	%rax,(%rbx)
	mov	%rax,-8(sp)
	FETCH
