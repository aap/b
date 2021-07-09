#define idp s0
#define isp s1
#define ipc s2

.macro  FETCH skip=0
	ld	t0,\skip(ipc)
	addi	ipc,ipc,8+\skip
	jr	t0
.endm

.extern fetch

# set stack
.globl s
s:
	ld	isp,(ipc)
	add	isp,isp,idp
	FETCH	8

# transfer if false
.globl f
f:
	ld	t0,-8(isp)
	beq	t0,zero,t
	FETCH	8

# transfer
.globl t
t:
	ld	ipc,(ipc)
	FETCH

# init automatic vector
.globl y
y:
	ld	t6,(ipc)
	add	t6,t6,idp
	addi	t0,t6,8
	srli	t0,t0,3
	sd	t0,(t6)
	FETCH	8

# switch
.globl z
z:	ld	t6,(ipc)
	ld	t0,-8(isp)
	ld	t1,(t6)
	addi	t6,t6,8
1:	beq	t1,zero,2f
	ld	t2,(t6)
	beq	t2,t0,1f
	addi	t1,t1,-1
	addi	t6,t6,16
	j	1b
1:	ld	ipc,8(t6)	# found case
	FETCH
2:	move	ipc,t6		# fall through
	FETCH

.globl n1,n2,n3
# call
n3:
	ld	isp,(sp)
	addi	sp,sp,8
# mcall
n1:
	sd	ipc,(isp)
	addi	isp,isp,-8
	ld	ipc,(isp)
	sd	idp,(isp)
	move	idp,isp
	FETCH
# mark
n2:
	sd	isp,-8(sp)
	addi	sp,sp,-8
	addi	isp,isp,8
	FETCH

# index vector
.globl n4
n4:
	ld	t0,-8(isp)
	ld	t1,-16(isp)
	addi	isp,isp,-8
	add	t6,t0,t1
	slli	t6,t6,3
	ld	t0,(t6)
	sd	t0,-8(isp)
	FETCH

# goto
.globl n6
n6:
	ld	ipc,-8(isp)
	FETCH

# return with value
.globl n7
n7:
	ld	t0,-8(isp)
	addi	isp,idp,8
	ld	idp,(idp)
	sd	t0,-8(isp)
	ld	ipc,(isp)
	FETCH

# return without value
.globl n11
n11:
	addi	isp,idp,8
	ld	idp,(idp)
	ld	ipc,(isp)
	FETCH

#
# Push values
#

# push automatic lvalue
.globl va, iva
va:	addi	isp,isp,8
iva:	ld	t6,(ipc)
	add	t6,t6,idp
	srli	t0,t6,3
	sd	t0,-8(isp)
	FETCH	8

# push automatic rvalue
.globl a, ia
a:	addi	isp,isp,8
ia:	ld	t6,(ipc)
	add	t6,t6,idp
	ld	t0,(t6)
	sd	t0,-8(isp)
	FETCH	8

# push constant
.globl c, ic
c:	addi	isp,isp,8
ic:	ld	t0,(ipc)
	sd	t0,-8(isp)
	FETCH	8

# push external lvalue
.globl vx, ivx
vx:	addi	isp,isp,8
ivx:	ld	t6,(ipc)
	srli	t0,t6,3
	sd	t0,-8(isp)
	FETCH	8

# push external rvalue
.globl x, ix
x:	addi	isp,isp,8
ix:	ld	t6,(ipc)
	ld	t0,(t6)
	sd	t0,-8(isp)
	FETCH	8

#
# Unary operators
#

# - operator
.globl u2
u2:
	ld	t0,-8(isp)
	sub	t0,zero,t0
	sd	t0,-8(isp)
	FETCH

# * operator
.globl u3
u3:
	ld	t6,-8(isp)
	slli	t6,t6,3
	ld	t0,(t6)
	sd	t0,-8(isp)
	FETCH

# ! operator
.globl u4
u4:
	ld	t0,-8(isp)
	beq	t0,zero,1f
	sd	zero,-8(isp)
	FETCH
1:	li	t0,1
	sd	t0,-8(isp)
	FETCH

# prefix ++ operator
.globl u5
u5:
	ld	t6,-8(isp)
	slli	t6,t6,3
	ld	t0,(t6)
	addi	t0,t0,1
	sd	t0,(t6)
	sd	t0,-8(isp)
	FETCH

# prefix -- operator
.globl u6
u6:
	ld	t6,-8(isp)
	slli	t6,t6,3
	ld	t0,(t6)
	addi	t0,t0,-1
	sd	t0,(t6)
	sd	t0,-8(isp)
	FETCH

# postfix ++ operator
.globl u7
u7:
	ld	t6,-8(isp)
	slli	t6,t6,3
	ld	t0,(t6)
	sd	t0,-8(isp)
	addi	t0,t0,1
	sd	t0,(t6)
	FETCH

# postfix -- operator
.globl u10
u10:
	ld	t6,-8(isp)
	slli	t6,t6,3
	ld	t0,(t6)
	sd	t0,-8(isp)
	addi	t0,t0,-1
	sd	t0,(t6)
	FETCH


#
# Binary operators
#

# = operator
.globl b1
b1:
	ld	t0,-8(isp)	# value
	ld	t6,-16(isp)	# address
	addi	isp,isp,-8
	slli	t6,t6,3
	sd	t0,(t6)
	sd	t0,-8(isp)
	FETCH

# | operator
.globl b2
b2:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	addi	isp,isp,-8
	or	t0,t0,t1
	sd	t0,-8(isp)
	FETCH

# & operator
.globl b3
b3:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	addi	isp,isp,-8
	and	t0,t0,t1
	sd	t0,-8(isp)
	FETCH

# == operator
.globl b4
b4:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	addi	isp,isp,-8
	beq	t0,t1,1f
	sd	zero,-8(isp)
	FETCH
1:
	li	t0,1
	sd	t0,-8(isp)
	FETCH

# != operator
.globl b5
b5:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	addi	isp,isp,-8
	bne	t0,t1,1f
	sd	zero,-8(isp)
	FETCH
1:
	li	t0,1
	sd	t0,-8(isp)
	FETCH

# <= operator
.globl b6
b6:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	slt	t0,t1,t0
	xori	t0,t0,1
	addi	isp,isp,-8
	sd	t0,-8(isp)
	FETCH

# < operator
.globl b7
b7:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	slt	t0,t0,t1
	addi	isp,isp,-8
	sd	t0,-8(isp)
	FETCH

# >= operator
.globl b10
b10:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	slt	t0,t0,t1
	xori	t0,t0,1
	addi	isp,isp,-8
	sd	t0,-8(isp)
	FETCH

# > operator
.globl b11
b11:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	slt	t0,t1,t0
	addi	isp,isp,-8
	sd	t0,-8(isp)
	FETCH

# >> operator
.globl b12
b12:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	addi	isp,isp,-8
	sra	t0,t0,t1
	sd	t0,-8(isp)
	FETCH

# << operator
.globl b13
b13:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	addi	isp,isp,-8
	sll	t0,t0,t1
	sd	t0,-8(isp)
	FETCH

# + operator
.globl b14
b14:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	addi	isp,isp,-8
	add	t0,t0,t1
	sd	t0,-8(isp)
	FETCH

# - operator
.globl b15
b15:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	addi	isp,isp,-8
	sub	t0,t0,t1
	sd	t0,-8(isp)
	FETCH

# % operator
.globl b16
b16:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	addi	isp,isp,-8
	rem	t0,t0,t1
	sd	t0,-8(isp)
	FETCH

# * operator
.globl b17
b17:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	addi	isp,isp,-8
	mul	t0,t0,t1
	sd	t0,-8(isp)
	FETCH

# / operator
.globl b20
b20:
	ld	t1,-8(isp)
	ld	t0,-16(isp)
	div	t0,t0,t1
	addi	isp,isp,-8
	sd	t0,-8(isp)
	FETCH

# =| operator
.globl b102
b102:
	ld	t1,-8(isp)	# value
	ld	t6,-16(isp)	# address
	addi	isp,isp,-4
	slli	t6,t6,3
	ld	t0,(t6)
	or	t0,t0,t1
	sd	t0,(t6)
	sd	t0,-8(isp)
	FETCH

# =& operator
.globl b103
b103:
	ld	t1,-8(isp)	# value
	ld	t6,-16(isp)	# address
	addi	isp,isp,-8
	slli	t6,t6,3
	ld	t0,(t6)
	and	t0,t0,t1
	sd	t0,(t6)
	sd	t0,-8(isp)
	FETCH

# =>> operator
.globl b112
b112:
	ld	t1,-8(isp)	# value
	ld	t6,-16(isp)	# address
	addi	isp,isp,-4
	slli	t6,t6,3
	ld	t0,(t6)
	sra	t0,t0,t1
	sd	t0,(t6)
	sd	t0,-8(isp)
	FETCH

# =<< operator
.globl b113
b113:
	ld	t1,-8(isp)	# value
	ld	t6,-16(isp)	# address
	addi	isp,isp,-8
	slli	t6,t6,3
	ld	t0,(t6)
	sll	t0,t0,t1
	sd	t0,(t6)
	sd	t0,-8(isp)
	FETCH

# =+ operator
.globl b114
b114:
	ld	t1,-8(isp)	# value
	ld	t6,-16(isp)	# address
	addi	isp,isp,-8
	slli	t6,t6,3
	ld	t0,(t6)
	add	t0,t0,t1
	sd	t0,(t6)
	sd	t0,-8(isp)
	FETCH

# =- operator
.globl b115
b115:
	ld	t1,-8(isp)	# value
	ld	t6,-16(isp)	# address
	addi	isp,isp,-8
	slli	t6,t6,3
	ld	t0,(t6)
	sub	t0,t0,t1
	sd	t0,(t6)
	sd	t0,-8(isp)
	FETCH

# =% operator
.globl b116
b116:
	ld	t1,-8(isp)	# value
	ld	t6,-16(isp)	# address
	addi	isp,isp,-8
	slli	t6,t6,3
	ld	t0,(t6)
	rem	t0,t0,t1
	sd	t0,(t6)
	sd	t0,-8(isp)
	FETCH

# =* operator
.globl b117
b117:
	ld	t1,-8(isp)	# value
	ld	t6,-16(isp)	# address
	addi	isp,isp,-8
	slli	t6,t6,3
	ld	t0,(t6)
	mul	t0,t0,t1
	sd	t0,(t6)
	sd	t0,-8(isp)
	FETCH

# =/ operator
.globl b120
b120:
	ld	t1,-8(isp)	# value
	ld	t6,-16(isp)	# address
	addi	isp,isp,-8
	slli	t6,t6,3
	ld	t0,(t6)
	div	t0,t0,t1
	sd	t0,(t6)
	sd	t0,-8(isp)
	FETCH
