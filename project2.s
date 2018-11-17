.data
	user_string: .space 5 # space needed for 4 characters and 1 null
	invalid_hex: .asciiz "Invalid base-30 number" #for characters not in the set
	hex_too_long: .asciiz "Input is too long." #for strings more than 5 characters
	hex_too_short: .asciiz "Input is empty." #for strings with 0 characters

.text 
	main:
        li $v0, 8 # read in a string
        la $a0, user_string
        li $a1, 2500
        syscall

	la $t0, user_string
	li $s0, 0	# store value
	li $s7, 0	# checks for spaces
	li $t4, 1	# power that is multiplied
	li $s1, 27				
	li $t1, 0   	# counts the number of characters in string