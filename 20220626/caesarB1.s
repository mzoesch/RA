.data

shift_text: .asciiz "Um wieviele Stellen soll der Text verschoben werden: "
string1: .asciiz "Der verschluesselte Text lautet:  "
secret: .asciiz "GEHEIMNIS"
string_a: .asciiz "A"
string_z: .asciiz "Z"

result: .space 9

.text
main:
	# t0  - Zum Zwischenspeichern der Position des aktuell betrachteten Buchstabens 
	# t1 - Gibt die Laenge des Geheimworts an
	# t2 - ASCII Wert des Buchstaben A (65)
	# t3 - ASCII - WERT des Buchstaben Z (90)
	li  $t0, 0
	li  $t1, 9
	lb  $t2, string_a
	lb  $t3, string_z
	
	la $a0, shift_text	# String mit Anfangsadresse shift_text in $a0 laden
	li $v0, 4		# 4 in $v0 laden
	syscall			# Text mit Anfangsadreesse in $a0 auf der Konsole ausgeben
	
	li $v0, 5		# 5 in $v0 laden
	syscall			# Zahl eingeben
	
	move $s1, $v0		# Eingegebene Zahl in $s1 speichern
	
loop: 	bge $t0, $t1, end	# Falls alle Buchstaben betrachtet wurden -> Springe end
	lb  $t4, secret($t0)	# Lade den aktuellen Buchstaben in $t4
			
caesar: ####################################
	# Fuegen Sie hier Ihre Loesung ein #
	####################################
	
	# Hier Zahl plus $s1
	
	######################
	# Ende Ihrer Loesung #
	######################
	bgt $t4, $t3, cadd	# Falls das Ergebnis > Z --> springe zu cadd

save:	####################################
	# Fuegen Sie hier Ihre Loesung ein #
	####################################
	
	# Aktuellen Buchstaben in RAM speichern
	# $a0 ist Anfangsaddress des zu speichender Verschlüsselung
	# Values $a0 dürfen überschriebem werden
	# Zeiger $t0 um eins erhöhen
	
	######################
	# Ende Ihrer Loesung #
	######################
	j loop			# Springe zum Label loop
		
cadd:	####################################
	# Fuegen Sie hier Ihre Loesung ein #
	####################################
	
	# Hier Zahl sub mit 26 (A-Z)

	######################
	# Ende Ihrer Loesung #
	######################
	j save			# Springe zum Label save


end:	la $a0, string1		# Anfangsadresse des Strings string1 wird in $a0 geladen
	li $v0, 4		# 4 wird in $v0 geladen
	syscall			# String string1 wird auf der Konsole ausgeben
	
	la $a0, result		# Anfangsadresse des Strings result wird in $a0 geladen
	li $v0, 4		# 4 wird in $v0 geladen
	syscall			# String result  wird auf der Konsole ausgeben
	
	li $v0, 10		# 10 wird in $v0 geladen
	syscall			# Programm wird beendet
	
	
