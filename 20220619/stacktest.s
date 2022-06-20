.data



.text
	li	$t0, 10
	li	$t1, 9
	li	$t2, 8
	
	#addiu	$sp, $sp -8
	sw	$t0, ($sp)
	sw	$t1, 4($sp)
	sw	$t2, 8($sp)
