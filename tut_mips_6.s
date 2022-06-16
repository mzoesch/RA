.text

main:
	li $t0, 0x100
	li $t1, 0x200
	
	# Swap method manully
	#li $t0, 0x200
	#li $t1, 0x100
	
	#li $v0, 10 # Quit
	#syscall
	
	
	# mov
	
	# Now Duplicating
	# Move ist just copiing
	#move $t0, $t1
	#move $t1, $t0
	
	# tmp
	move $t2, $t0
	
	move $t0, $t1
	move $t1, $t2
	
	li $t2, 0x0
	
	li $v0 10
	syscall
