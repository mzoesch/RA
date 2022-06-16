.text
main:
	
	li $t0, 3		# 0x0000 0003
	li $t1, 5		# 0x0000 0005

	mul $t0, $t0, $t0 	# 0x0000 0009
	mul $t0, $t0, 2		# 0x0000 0012
	
	mul $t1, $t1, 3		# 0x0000 000f
	
	li $t2, 0x0		# 0x0000 0000
	add $t2, $t0, 2		# 0x0000 0014
	add $t2, $t1, $t2	# 0x0000 0023
	
	move $a0, $t2
	li $v0, 1 # Printing to console
	syscall
	
	li $v0, 10
	syscall
	

# z = 2x^2 + 3y + 2
