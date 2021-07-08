.set idp,$s0
.set isp,$s1
.set ipc,$s2

.set noreorder

.macro  FETCH skip=0
	lw	$v0,\skip(ipc)
	jr	$v0
	addiu	ipc,4+\skip
.endm

.extern fetch

# set stack
.globl s
s:
	lw	isp,(ipc)
	addu	isp,idp
	FETCH	4

# transfer if false
.globl f
f:
	lw	$t0,-4(isp)
	beq	$t0,$zero,t
	nop
	FETCH	4

# transfer
.globl t
t:
	lw	ipc,(ipc)
	FETCH

# init automatic vector
.globl y
y:
	lw	$v0,(ipc)
	addu	$v1,$v0,idp
	addiu	$t0,$v1,4
	srl	$v0,$t0,2
	sw	$v0,($v1)
	FETCH	4

# switch
.globl z
z:	lw	$v0,(ipc)
	lw	$t0,-4(isp)
	lw	$t1,($v0)
	addiu	$v0,4
1:	beq	$t1,$zero,2f
	nop
	lw	$t2,($v0)
	beq	$t2,$t0,1f
	addiu	$t1,-1
	b	1b
	addiu	$v0,8
1:	lw	ipc,4($v0)	# found case
	FETCH
2:	move	ipc,$v0		# fall through
	FETCH

.globl n1,n2,n3
# call
n3:
	lw	isp,($sp)
	addiu	$sp,4
# mcall
n1:
	sw	ipc,(isp)
	addiu	isp,-4
	lw	ipc,(isp)
	sw	idp,(isp)
	move	idp,isp
	FETCH
# mark
n2:
	sw	isp,-4($sp)
	addiu	$sp,-4
	addiu	isp,4
	FETCH

# index vector
.globl n4
n4:
	lw	$t0,-4(isp)
	lw	$t1,-8(isp)
	addiu	isp,-4
	addu	$v0,$t0,$t1
	sll	$v0,$v0,2
	lw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH

# goto
.globl n6
n6:
	lw	ipc,-4(isp)
	FETCH

# return with value
.globl n7
n7:
	lw	$t0,-4(isp)
	addiu	isp,idp,4
	lw	idp,(idp)
	sw	$t0,-4(isp)
	lw	ipc,(isp)
	FETCH

# return without value
.globl n11
n11:
	addiu	isp,idp,4
	lw	idp,(idp)
	lw	ipc,(isp)
	FETCH

#
# Push values
#

# push automatic lvalue
.globl va, iva
va:	addiu	isp,4
iva:	lw	$v0,(ipc)
	addu	$v1,$v0,idp
	srl	$t0,$v1,2
	sw	$t0,-4(isp)
	FETCH	4

# push automatic rvalue
.globl a, ia
a:	addiu	isp,4
ia:	lw	$v0,(ipc)
	addu	$v1,$v0,idp
	lw	$t0,($v1)
	sw	$t0,-4(isp)
	FETCH	4

# push constant
.globl c, ic
c:	addiu	isp,4
ic:	lw	$t0,(ipc)
	sw	$t0,-4(isp)
	FETCH	4

# push external lvalue
.globl vx, ivx
vx:	addiu	isp,4
ivx:	lw	$v0,(ipc)
	srl	$t0,$v0,2
	sw	$t0,-4(isp)
	FETCH	4

# push external rvalue
.globl x, ix
x:	addiu	isp,4
ix:	lw	$v0,(ipc)
	lw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH	4

#
# Unary operators
#

# - operator
.globl u2
u2:
	lw	$t0,-4(isp)
	subu	$t0,$zero,$t0
	sw	$t0,-4(isp)
	FETCH

# * operator
.globl u3
u3:
	lw	$v0,-4(isp)
	sll	$v0,2
	lw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH

# ! operator
.globl u4
u4:
	lw	$t0,-4(isp)
	beq	$t0,$zero,1f
	li	$t0,1
	sw	$zero,-4(isp)
	FETCH
1:	sw	$t0,-4(isp)
	FETCH

# prefix ++ operator
.globl u5
u5:
	lw	$v0,-4(isp)
	sll	$v0,$v0,2
	lw	$t0,($v0)
	addiu	$t0,$t0,1
	sw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH

# prefix -- operator
.globl u6
u6:
	lw	$v0,-4(isp)
	sll	$v0,$v0,2
	lw	$t0,($v0)
	addiu	$t0,$t0,-1
	sw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH

# postfix ++ operator
.globl u7
u7:
	lw	$v0,-4(isp)
	sll	$v0,$v0,2
	lw	$t0,($v0)
	sw	$t0,-4(isp)
	addiu	$t0,$t0,1
	sw	$t0,($v0)
	FETCH

# postfix -- operator
.globl u10
u10:
	lw	$v0,-4(isp)
	sll	$v0,$v0,2
	lw	$t0,($v0)
	sw	$t0,-4(isp)
	addiu	$t0,$t0,-1
	sw	$t0,($v0)
	FETCH

#
# Binary operators
#

# = operator
.globl b1
b1:
	lw	$t0,-4(isp)	# value
	lw	$v0,-8(isp)	# address
	addiu	isp,-4
	sll	$v0,2
	sw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH

# | operator
.globl b2
b2:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	addiu	isp,-4
	or	$t0,$t1
	sw	$t0,-4(isp)
	FETCH

# & operator
.globl b3
b3:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	addiu	isp,-4
	and	$t0,$t1
	sw	$t0,-4(isp)
	FETCH

# == operator
.globl b4
b4:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	beq	$t0,$t1,1f
	addiu	isp,-4
	sw	$zero,-4(isp)
	FETCH
1:
	li	$t0,1
	sw	$t0,-4(isp)
	FETCH

# != operator
.globl b5
b5:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	bne	$t0,$t1,1f
	addiu	isp,-4
	sw	$zero,-4(isp)
	FETCH
1:
	li	$t0,1
	sw	$t0,-4(isp)
	FETCH

# <= operator
.globl b6
b6:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	slt	$t0,$t1,$t0
	xori	$t0,$t0,1
	addiu	isp,-4
	sw	$t0,-4(isp)
	FETCH

# < operator
.globl b7
b7:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	slt	$t0,$t0,$t1
	addiu	isp,-4
	sw	$t0,-4(isp)
	FETCH

# >= operator
.globl b10
b10:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	slt	$t0,$t0,$t1
	xori	$t0,$t0,1
	addiu	isp,-4
	sw	$t0,-4(isp)
	FETCH

# > operator
.globl b11
b11:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	slt	$t0,$t1,$t0
	addiu	isp,-4
	sw	$t0,-4(isp)
	FETCH

# >> operator
.globl b12
b12:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	addiu	isp,-4
	srav	$t0,$t0,$t1
	sw	$t0,-4(isp)
	FETCH

# << operator
.globl b13
b13:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	addiu	isp,-4
	sllv	$t0,$t0,$t1
	sw	$t0,-4(isp)
	FETCH

# + operator
.globl b14
b14:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	addiu	isp,-4
	addu	$t0,$t1
	sw	$t0,-4(isp)
	FETCH

# - operator
.globl b15
b15:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	addiu	isp,-4
	subu	$t0,$t1
	sw	$t0,-4(isp)
	FETCH

# % operator
.globl b16
b16:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	div	$t0,$t1
	addiu	isp,-4
	mfhi	$t0
	sw	$t0,-4(isp)
	FETCH

# * operator
.globl b17
b17:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	mult	$t0,$t1
	addiu	isp,-4
	mflo	$t0
	sw	$t0,-4(isp)
	FETCH

# / operator
.globl b20
b20:
	lw	$t1,-4(isp)
	lw	$t0,-8(isp)
	div	$t0,$t1
	addiu	isp,-4
	mflo	$t0
	sw	$t0,-4(isp)
	FETCH

# =| operator
.globl b102
b102:
	lw	$t1,-4(isp)	# value
	lw	$v0,-8(isp)	# address
	addiu	isp,-4
	sll	$v0,2
	lw	$t0,($v0)
	or	$t0,$t1
	sw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH

# =& operator
.globl b103
b103:
	lw	$t1,-4(isp)	# value
	lw	$v0,-8(isp)	# address
	addiu	isp,-4
	sll	$v0,2
	lw	$t0,($v0)
	and	$t0,$t1
	sw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH

# =>> operator
.globl b112
b112:
	lw	$t1,-4(isp)	# value
	lw	$v0,-8(isp)	# address
	addiu	isp,-4
	sll	$v0,2
	lw	$t0,($v0)
	srav	$t0,$t0,$t1
	sw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH

# =<< operator
.globl b113
b113:
	lw	$t1,-4(isp)	# value
	lw	$v0,-8(isp)	# address
	addiu	isp,-4
	sll	$v0,2
	lw	$t0,($v0)
	sllv	$t0,$t0,$t1
	sw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH

# =+ operator
.globl b114
b114:
	lw	$t1,-4(isp)	# value
	lw	$v0,-8(isp)	# address
	addiu	isp,-4
	sll	$v0,2
	lw	$t0,($v0)
	addu	$t0,$t1
	sw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH

# =- operator
.globl b115
b115:
	lw	$t1,-4(isp)	# value
	lw	$v0,-8(isp)	# address
	addiu	isp,-4
	sll	$v0,2
	lw	$t0,($v0)
	subu	$t0,$t1
	sw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH

# =% operator
.globl b116
b116:
	lw	$t1,-4(isp)	# value
	lw	$v0,-8(isp)	# address
	addiu	isp,-4
	sll	$v0,2
	lw	$t0,($v0)
	div	$t0,$t1
	mfhi	$t0
	sw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH

# =* operator
.globl b117
b117:
	lw	$t1,-4(isp)	# value
	lw	$v0,-8(isp)	# address
	addiu	isp,-4
	sll	$v0,2
	lw	$t0,($v0)
	mult	$t0,$t1
	mflo	$t0
	sw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH

# =/ operator
.globl b120
b120:
	lw	$t1,-4(isp)	# value
	lw	$v0,-8(isp)	# address
	addiu	isp,-4
	sll	$v0,2
	lw	$t0,($v0)
	div	$t0,$t1
	mflo	$t0
	sw	$t0,($v0)
	sw	$t0,-4(isp)
	FETCH
