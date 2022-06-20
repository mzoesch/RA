.data
x: .word 12
y: .word 14
z: .word 5
U: .word 0

.text
main:
	lw $t0, x		# $to := x
	lw $t1, y		# $t1 := y
	lw $t2, z		# $t2 := z
	
	add $t0, $t0, $t1	# $t0 := x+y
	add $t0, $t0, $t2	# $t0 := x+y+z
	
	sw $t0, U		# U := x+y+z
	
	li $v0, 10		# Exit
	syscall
