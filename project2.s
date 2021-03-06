.data
	user_string: .space 5 	# space needed for 4 characters and 1 null
	invalid_hex: .asciiz "Invalid base-30 number" 	# for characters not in the set
	hex_too_long: .asciiz "Input is too long." 	# for strings more than 5 characters
	hex_too_short: .asciiz "Input is empty." 	# for strings with 0 characters

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

	inputLength:
	lb $t2, 0($t0)
	beq $t2, 10, empty	# moves to convert
	addi $t0, $t0, 1
	beq $t2, 32, spaceLength 	# checks for number of spaces so it is not added to count
	li $s7, 1 	# count is set to 1 if nonspace character appears
	addi $t1, $t1, 1
	bgt $t1, 4, tooLong
	j inputLength

	convert:
	beq $t1, 0, printResult
	addi $t0, $t0, -1 	# move backwards 
	lb $t2, 0($t0)
	beq $t2, 32, space   # checks if space is middle or not
	li $s7, 1
	addi $t1, $t1, -1	# decreases $t1 by 1
	j convertChar

	exit: # exits code
	li $v0, 10
	syscall

