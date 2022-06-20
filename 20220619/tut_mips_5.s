.text

main:
	la $a0, Bob # Loads address Bob to $a0
	# Caution: Only loads address (0x1001 0000) not the actual value of 0x1001 0000
	la $t0, Steve # Case sensetive!
	
	li $v0, 4 # Syscall 4: Prints string $a0 to commandline
	syscall
	
	move $a0, $t0 # Coping $t0 to $a0
	li $v0, 4
	syscall
	
	li $v0, 10 # Quit
	syscall

.data

Bob: .asciiz "My name is Bob." # z adds null terminator		# 0x1001 0000
Steve: .asciiz "My name is Steve."				# 0x1001 0010
