.text

main: # Program starts here
	li $t1, 3 # load immediate
	li $t2, 5
	# li $v0, 10 
	# li $v0, 15
	# li $v0, 16
	
	add $t0, $t1, $t2 # $t0 = $t1 + $t2
	sub $t0, $t1, $t2 # $t0 = $t1 - $t2
	mul $t0, $t1, $t2 # $t0 = $t1 * $t2
	div $t0, $t1, $t2 # $t0 = $t1 / $t2
	
.data 
