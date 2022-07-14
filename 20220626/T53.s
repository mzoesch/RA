			.data

prmpt:		.asciiz "Bitte geben Sie eine Zahl ein: "
erg2k: 		.asciiz "Ihre Zahl als Dualzahl in 2er-Komplement-Darstellung: "
nl: 		.asciiz "\n"
res: 		.space 33


			.text

main:
	li		$v0,	4
	la		$a0,	prmpt
	syscall							# Eingabeaufforderung ausgeben
	
	li		$v0,	5
	syscall							# Zahl von der Konsole einlesen
	
	move 	$t0,	$v0				# Eingelesene Zahl in $t0
	
	li		$t2, 	32				# Counter1 := 32 (abst. Counter)
	li		$t3,	0				# Counter2 := 0 (aufst. Counter)
	li		$t4,	1				# $t4 := 1 (Konstante)
	li		$t5,	48				# ASCII("0") = 48
	li		$t6,	49				# ASCII("1") = 49
	li		$t7,	00				# Nukllterminierung


loop:
	rol		$t0, 	$t0,	1		# Beginn mit Bit ganz links
	and		$t1,	$t0,	$t4		# Bit-weiser Vergleich
	addi	$t2,	$t2,	-1		# Counter1--
	beqz	$t1,	null			# Bit 0 oder 1


eins:								# Bit war 1
	sb		$t6,	res($t3)		# Bit als String speichern
	addi	$t3,	$t3,	1		# Counter2++
	beqz 	$t2,	end				# Alle 32 Bits abgeareitet?
	j 		loop


null:								# Bit war 0
	sb		$t5,	res($t3)		# Bit als String speichern
	addi	$t3,	$t3,	1		# Counter2++
	beqz	$t2,	end				# Alle 32 Bits abgearbeitet?
	j		loop

end:
	sb		$t7,	res($t3)		# Nullterminierung ans Ende
	
	la		$a0,	erg2k
	li		$v0,	4
	syscall							# erg2k ausgeben
	
	la		$a0,	res
	li		$v0,	4
	syscall							# Ergebnis ausgeben
	
	la		$a0,	nl
	li		$v0,	4
	syscall							# Neue Zeile ausgeben
	
	li		$v0,	10
	syscall							# Exit	
