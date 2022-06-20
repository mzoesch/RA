.text
	li $t0, 0x10010000 # First location of data memory

RunLoop: # Label
		
	# Exit
	beq $t0, 0x10010011, EndLoop
	
	lb $a0, ($t0) # Puts value of $t0 to $a0
	li $v0, 11
	syscall
	
	addi $t0, $t0, 0x01 # Increments value of $t0 by 1
	j RunLoop

EndLoop:
	li $v0, 10
	syscall


.data
cake: .ascii "the cake is a lie"
