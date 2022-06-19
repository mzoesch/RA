.text
main:
	li	$t0, 30
	li	$t1, 5
	li	$t2, 15
	addi	$sp, $sp, -12	# 16
	sw	$t2, 12($sp)
	sw	$t0, 8($sp)
	sw	$t1, 4($sp)
