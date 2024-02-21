main:

main_loop_init:
	li	$t0, 24		# $t0 = x = 24
main_loop_condition:
	# important: remember to handle the equal case when flipping a condition
	bge	$t0, 42, main_loop_end	# if (x >= 42)...
main_loop_body:
	li	$v0, 1		# printf("%d", x);
	move	$a0, $t0
	syscall

	li	$v0, 11		# printf("%c", '\n')
	li	$a0, '\n'
	syscall

main_loop_increment:
	addi	$t0, $t0, 3	# x = x + 3

	# important: needs to branch/jump back to 
	# continue the next iteration of the loop
	b	main_loop_condition	
	
main_loop_end:
	jr	$ra

