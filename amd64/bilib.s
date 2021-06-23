.set dp, %r13
.set sp, %r14
.set pc, %r15

.extern fetch

# set stack
.globl s
s:
	mov	dp,sp
	add	(pc),sp
	add	$8,pc
	jmp	fetch

# transfer if false
.globl f
f:
	orq	$0,-8(sp)
	jz	1f
	add	$8,pc
	jmp	fetch
1:	mov	(pc),pc
	jmp	fetch

# transfer
.globl t
t:
	mov	(pc),pc
	jmp	fetch

# init automatic vector
.globl y
y:
	mov	dp,%rax
	add	(pc),%rax
	add	$8,pc
	mov	%rax,%rbx
	shr	$3,%rax
	inc	%rax
	mov	%rax,(%rbx)
	jmp	fetch

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
	lodsq
	loop	1b
	mov	%rsi,pc
	jmp	fetch
2:	mov	(%rsi),pc
	jmp fetch

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
	jmp	fetch
# mark
n2:	push	sp
	add	$8,sp
	jmp	fetch

# index vector
.globl n4
n4:
	mov	-8(sp),%rax
	add	-16(sp),%rax
	sub	$8,sp
	shl	$3,%rax
	mov	(%rax),%rax
	mov	%rax,-8(sp)
	jmp	fetch

# goto
.globl n6
n6:
	mov	-8(sp),pc
	jmp	fetch

# return with value
.globl n7
n7:
	mov	-8(sp),%rax
	mov	dp,sp
	mov	(sp),dp
	mov	%rax,(sp)
	add	$8,sp
	mov	(sp),pc
	jmp	fetch

# return without value
.globl n11
n11:
	mov	dp,sp
	mov	(sp),dp
	add	$8,sp
	mov	(sp),pc
	jmp	fetch

#
# Push values
#

# push automatic lvalue
.globl va, iva
va:	add	$8,sp
iva:	mov	dp,%rax
	add	(pc),%rax
	add	$8,pc
	shr	$3,%rax
	mov	%rax,-8(sp)
	jmp	fetch

# push automatic rvalue
.globl a, ia
a:	add	$8,sp
ia:	mov	dp,%rax
	add	(pc),%rax
	add	$8,pc
	mov	(%rax),%rax
	mov	%rax,-8(sp)
	jmp	fetch

# push constant
.globl c, ic
c:	add	$8,sp
ic:	mov	(pc),%rax
	add	$8,pc
	mov	%rax,-8(sp)
	jmp	fetch

# push external lvalue
.globl vx, ivx
vx:	add	$8,sp
ivx:	mov	(pc),%rax
	add	$8,pc
	shr	$3,%rax
	mov	%rax,-8(sp)
	jmp	fetch

# push external rvalue
.globl x, ix
x:	add	$8,sp
ix:	mov	(pc),%rax
	add	$8,pc
	mov	(%rax),%rax
	mov	%rax,-8(sp)
	jmp	fetch

#
# Unary operators
#

# - operator
.globl u2
u2:
	negq	-8(sp)
	jmp	fetch

# * operator
.globl u3
u3:
	mov	-8(sp),%rax
	shl	$3,%rax
	mov	(%rax),%rax
	mov	%rax,-8(sp)
	jmp	fetch

# ! operator
.globl u4
u4:
	xor	%rax,%rax
	orq	$0,-8(sp)
	jnz	1f
	inc	%rax
1:	mov	%rax,-8(sp)
	jmp	fetch

# prefix ++ operator
.globl u5
u5:
	mov	-8(sp),%rax
	shl	$3,%rax
	mov	(%rax),%rdx
	inc	%rdx
	mov	%rdx,(%rax)
	mov	%rdx,-8(sp)
	jmp	fetch

# prefix -- operator
.globl u6
u6:
	mov	-8(sp),%rax
	shl	$3,%rax
	mov	(%rax),%rdx
	dec	%rdx
	mov	%rdx,(%rax)
	mov	%rdx,-8(sp)
	jmp	fetch

# postfix ++ operator
.globl u7
u7:
	mov	-8(sp),%rax
	shl	$3,%rax
	mov	(%rax),%rdx
	mov	%rdx,-8(sp)
	inc	%rdx
	mov	%rdx,(%rax)
	jmp	fetch

# postfix -- operator
.globl u10
u10:
	mov	-8(sp),%rax
	shl	$3,%rax
	mov	(%rax),%rdx
	mov	%rdx,-8(sp)
	dec	%rdx
	mov	%rdx,(%rax)
	jmp	fetch

#
# Binary operators
#

# = operator
.globl b1
b1:
	mov	-8(sp),%rax	# value
	mov	-16(sp),%rbx	# address
	sub	$8,sp
	shl	$3,%rbx
	mov	%rax,(%rbx)
	mov	%rax,-8(sp)
	jmp	fetch

# | operator
.globl b2
b2:
	mov	-8(sp),%rax
	or	-16(sp),%rax
	sub	$8,sp
	mov	%rax,-8(sp)
	jmp	fetch

# & operator
.globl b3
b3:
	mov	-8(sp),%rax
	and	-16(sp),%rax
	sub	$8,sp
	mov	%rax,-8(sp)
	jmp	fetch

# == operator
.globl b4
b4:
	xor	%rax,%rax
	mov	-8(sp),%rdx
	cmp	-16(sp),%rdx
	jne	1f
	inc	%rax
1:	sub	$8,sp
	mov	%rax,-8(sp)
	jmp	fetch

# != operator
.globl b5
b5:
	xor	%rax,%rax
	mov	-8(sp),%rdx
	cmp	-16(sp),%rdx
	je	1f
	inc	%rax
1:	sub	$8,sp
	mov	%rax,-8(sp)
	jmp	fetch

# <= operator
.globl b6
b6:
	xor	%rax,%rax
	mov	-16(sp),%rdx
	cmp	-8(sp),%rdx
	jg	1f
	inc	%rax
1:	sub	$8,sp
	mov	%rax,-8(sp)
	jmp	fetch

# < operator
.globl b7
b7:
	xor	%rax,%rax
	mov	-16(sp),%rdx
	cmp	-8(sp),%rdx
	jge	1f
	inc	%rax
1:	sub	$8,sp
	mov	%rax,-8(sp)
	jmp	fetch

# >= operator
.globl b10
b10:
	xor	%rax,%rax
	mov	-16(sp),%rdx
	cmp	-8(sp),%rdx
	jl	1f
	inc	%rax
1:	sub	$8,sp
	mov	%rax,-8(sp)
	jmp	fetch

# > operator
.globl b11
b11:
	xor	%rax,%rax
	mov	-16(sp),%rdx
	cmp	-8(sp),%rdx
	jle	1f
	inc	%rax
1:	sub	$8,sp
	mov	%rax,-8(sp)
	jmp	fetch

# >> operator
.globl b12
b12:
	mov	-16(sp),%rax
	mov	-8(sp),%rcx
	shr	%cl,%rax
	sub	$8,sp
	mov	%rax,-8(sp)
	jmp	fetch

# << operator
.globl b13
b13:
	mov	-16(sp),%rax
	mov	-8(sp),%rcx
	shl	%cl,%rax
	sub	$8,sp
	mov	%rax,-8(sp)
	jmp	fetch

# + operator
.globl b14
b14:
	mov	-8(sp),%rax
	add	-16(sp),%rax
	sub	$8,sp
	mov	%rax,-8(sp)
	jmp	fetch

# - operator
.globl b15
b15:
	mov	-16(sp),%rax
	sub	-8(sp),%rax
	sub	$8,sp
	mov	%rax,-8(sp)
	jmp	fetch

# % operator
.globl b16
b16:
	xor	%rdx,%rdx
	mov	-16(sp),%rax
	idivq	-8(sp)
	sub	$8,sp
	mov	%rdx,-8(sp)
	jmp	fetch

# * operator
.globl b17
b17:
	mov	-16(sp),%rax
	mulq	-8(sp)
	sub	$8,sp
	mov	%rax,-8(sp)
	jmp	fetch

# / operator
.globl b20
b20:
	xor	%rdx,%rdx
	mov	-16(sp),%rax
	idivq	-8(sp)
	sub	$8,sp
	mov	%rax,-8(sp)
	jmp	fetch

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
	jmp	fetch

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
	jmp	fetch

# =>> operator
.globl b112
b112:
	mov	-8(sp),%rcx	# value
	mov	-16(sp),%rbx	# address
	sub	$8,sp
	shl	$3,%rbx
	mov	(%rbx),%rax
	shr	%cl,%rax
	mov	%rax,(%rbx)
	mov	%rax,-8(sp)
	jmp	fetch

# =<< operator
.globl b113
b113:
	mov	-8(sp),%rcx	# value
	mov	-16(sp),%rbx	# address
	sub	$8,sp
	shl	$3,%rbx
	mov	(%rbx),%rax
	shl	%cl,%rax
	mov	%rax,(%rbx)
	mov	%rax,-8(sp)
	jmp	fetch

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
	jmp	fetch

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
	jmp	fetch

# =% operator
.globl b116
b116:
	xor	%rdx,%rdx
	mov	-16(sp),%rbx	# address
	shl	$3,%rbx
	mov	(%rbx),%rax
	idivq	-8(sp)
	sub	$8,sp
	mov	%rdx,(%rbx)
	mov	%rdx,-8(sp)
	jmp	fetch

# =* operator
.globl b117
b117:
	mov	-16(sp),%rbx	# address
	shl	$3,%rbx
	mov	(%rbx),%rax
	mulq	-8(sp)
	sub	$8,sp
	mov	%rax,(%rbx)
	mov	%rax,-8(sp)
	jmp	fetch

# =/ operator
.globl b120
b120:
	xor	%rdx,%rdx
	mov	-16(sp),%rbx	# address
	shl	$3,%rbx
	mov	(%rbx),%rax
	idivq	-8(sp)
	sub	$8,sp
	mov	%rax,(%rbx)
	mov	%rax,-8(sp)
	jmp	fetch
