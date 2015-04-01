LfsrPalindrome:
	addu $t0, $0, $a0	# save seed in $t0 for comparing later
	addiu $t2, $0, 1	# temp for comparison


LfsrLoop:
	lfsr $a0, $a0		# lfsr = rd, rs. value stored in $a0.
	bitpal $t1, $a0 	# bitpal = rd, rs. check if value is a palindrome, store in $t1.

	beq $t1, $t2, ReturnPal # if palindrome (t1 == t2 == 1), exit and save palindrome in $v0
	beq $t0, $a0, ReturnSeed # if the seed was reached (t0 == a0), exit and save seed value in $v0

	j LfsrLoop


ReturnPal:
	sw $a0, 0($v0)
	jr $ra


ReturnSeed:
	sw $t0, 0($v0)
	jr $ra