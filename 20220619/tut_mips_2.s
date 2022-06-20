.text
	
	la $a0, myWord # load addres 'myWord' top $a0
	
	li $a1, 14 # Allowed to 7 Charachters n - 1 = 13
	
	li $v0, 8
	syscall
	
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall

.data
myWord: .space 20 # 1 Characters represents 1 ASCII letter (here: 20 Characters)
