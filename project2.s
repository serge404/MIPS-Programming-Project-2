.data
	char_array: .space 5 # space needed for 4 characters and 1 null
	invalid_hex: .asciiz "Invalid base-30 number" #for characters not in the set
	hex_too_long: .asciiz "Input is too long." #for strings more than 5 characters
	hex_too_short: .asciiz "Input is empty." #for strings with 0 characters

.text 
	main:
        li $v0, 8 # read in a string
        la $a0, char_array
        li $a1, 9
        syscall
	