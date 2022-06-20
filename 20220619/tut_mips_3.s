.text

	lb $a0, 0x10010000 # = b # Load byte
	li $v0, 11 # Printing to console
	syscall
	
	lb $a0, 0x10010001 # = i
	syscall
	
	lb $a0, 0x10010002 # = r
	syscall
	
	lb $a0, 0x10010003 # = d
	syscall
	
	li $v0, 10 # Quitting program
	syscall
	
.data

myString: .ascii "bird" # 1 Column represents 4 Byte => 32 Bit
# ==>
# 0x64 = d --> 64 = 0110 0100 # Note: Numbers are Hexadecimal
# 0x72 = r --> 72 = 0111 0010
# 0x69 = i --> 69 = 0110 1001
# 0x62 = b --> 62 = 0110 0010
#
# Reading right to left: Big-Endian
# Reading left to right: Little-Endian
#
# Address
# 0x1001 0000 = 62 = b
# 0x1001 0001 = 69 = i
# 0x1001 0002 = 72 = r
# 0x1001 0003 = 64 = d
#
# 0x1001 0004 = 63 = c
# ...
# WARNING: Address are Heaxadecimal!

myString2: .ascii "cow"
