.data
	var: 	.word 10, 11, 12, 13	# e
	
.text
	#lw 	$t0, var+8		# e
	
	li 	$t1, 20
	li	$t2, 5
	
	div	$t0, $t1, $t2
