.data
values: .word 128 64 32 16 8 4 2 1
input:  .space 9
result: .word 0
ans:    .asciiz "Der Wert ist "
endl:   .asciiz "\n"
						
        # t0 - Zum Zwischenspeichern eines Zeichens
        # a1 - Zum Zwischenspeichern der aktuellen String-Postion

.text
main:
        li      $v0, 8          # 8: read_str
        la      $a0, input      # Zieladresse des einzugebenden Textes
        li      $a1, 9          # maximale Länge
        syscall

	li 	$t5, 48		# ASCII("0") = 48
	li 	$t6, 49		# ASCII("1") = 49

	la   	$t1, values 	# t1 enthält Zeiger auf Stellenwert
	li 	$t7, 0		# Initialisiere Ergebnis
	
nextCh: # ==============================
        # Fügen Sie hier Ihre Lösung ein
        # ==============================
	
	sub 	$a1, $a1, 1
	ble	$a1, 0, strEnd	# Exit
	
	lb	$t2, ($a0)	# e. g.: 0x10010020
	andi 	$t2, $t2, 0x0F	# Convert from ASCII to Hex
	
	bnez  	$t2, eins	# j to eins if $t3 /= 0
				# Automaticlly goes to null if 'bnez' statement is not true
	
        # ==============================
        # Ende Ihrer Lösung
        # ==============================
null:				# Bit war 0
	addi    $t1, $t1, 4     # Verschiebe Zeiger um ein Wort
	addi    $a0, $a0, 1     # Verschiebe Zeiger um ein Zeichen
	j 	nextCh

eins:				# Bit war 1
        # ==============================
        # Fügen Sie hier Ihre Lösung ein
        # ==============================
	
	# Hier geplant, aber zu dumm:
	# Math.pow(2, $a1)
	
	beq 	$a1, 8, acht 	# Fuer acht
	beq 	$a1, 7, sieben	# Fuer sieben
	beq 	$a1, 6, sechs	# Fuer sechs
	beq 	$a1, 5, fuenf	# Fuer fuenf
	beq 	$a1, 4, vier	# Fuer vier
	beq 	$a1, 3, drei	# Fuer drei
	beq 	$a1, 2, zwei	# Fuer zwei
	beq 	$a1, 1, eins_pow# Fuer eins
							
	# Eigentlich nicht erreicherbarer code,
	# da nur Eingaben von 8 - 1 moeglich sind!
	addi    $t1, $t1, 4     # Verschiebe Zeiger um ein Wort
	addi    $a0, $a0, 1     # Verschiebe Zeiger um ein Zeichen
	j 	nextCh


acht:				# Also 2^(8-1) = 128
	addi 	$t7, $t7, 128
	
	addi    $t1, $t1, 4     # Verschiebe Zeiger um ein Wort
	addi    $a0, $a0, 1     # Verschiebe Zeiger um ein Zeichen
	j 	nextCh
	
	
sieben:				# Also 2^(7-1) = 64
	addi 	$t7, $t7, 64
	
	addi    $t1, $t1, 4     # Verschiebe Zeiger um ein Wort
	addi    $a0, $a0, 1     # Verschiebe Zeiger um ein Zeichen
	j 	nextCh
	
	
sechs:				# Also 2^(6-1) = 32
	addi 	$t7, $t7, 32
	
	addi    $t1, $t1, 4     # Verschiebe Zeiger um ein Wort
	addi    $a0, $a0, 1     # Verschiebe Zeiger um ein Zeichen
	j 	nextCh
	
	
fuenf:				# Also 2^(5-1) = 16
	addi 	$t7, $t7, 16
	
	addi    $t1, $t1, 4     # Verschiebe Zeiger um ein Wort
	addi    $a0, $a0, 1     # Verschiebe Zeiger um ein Zeichen
	j 	nextCh
	
	
vier:				# Also 2^(4-1) = 8
	addi 	$t7, $t7, 8
	
	addi    $t1, $t1, 4     # Verschiebe Zeiger um ein Wort
	addi    $a0, $a0, 1     # Verschiebe Zeiger um ein Zeichen
	j 	nextCh
	
	
drei:				# Also 2^(3-1) = 4
	addi 	$t7, $t7, 4
	
	addi    $t1, $t1, 4     # Verschiebe Zeiger um ein Wort
	addi    $a0, $a0, 1     # Verschiebe Zeiger um ein Zeichen
	j 	nextCh
	
	
zwei:				# Also 2^(2-1) = 2
	addi 	$t7, $t7, 2
	
	addi    $t1, $t1, 4     # Verschiebe Zeiger um ein Wort
	addi    $a0, $a0, 1     # Verschiebe Zeiger um ein Zeichen
	j 	nextCh
	
	
eins_pow:				# Also 2^(1-1) = 1
	addi 	$t7, $t7, 1	
	
        # ==============================
        # Ende Ihrer Lösung
        # ==============================

	addi    $t1, $t1, 4     # Verschiebe Zeiger um ein Wort
	addi    $a0, $a0, 1     # Verschiebe Zeiger um ein Zeichen
	j 	nextCh

strEnd: li      $v0, 4 		# 4: print_str
	la      $a0, endl       # Übergebe Adresse des Strings
	syscall			# Gebe Newline aus
        
        li      $v0, 4 		# 4: print_str
	la      $a0, ans        # Übergebe Adresse des Strings
	syscall			# Gebe Ergebnis-String aus

        li      $v0, 1 		# 4: print_int
	move    $a0, $t7        # Verschiebe Ergebnis
	syscall			# Gebe Ergebnis aus

	li      $v0, 4 		# 4: print_str
	la      $a0, endl       # Übergebe Adresse des Strings
	syscall			# Gebe Newline aus

        li      $v0,10
        syscall                 # au revoir...
