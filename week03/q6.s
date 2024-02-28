	.text # don't need it if your code is at the start of your program
N_SIZE = 10
SIZE_OF_ELEM = 4 # size of each element in the array

main:
main_loop_init:
	li	$t0, 0	# int i = 0
main_loop_condition:
	bge	$t0, N_SIZE, main_loop_end # if (i >= N_SIZE) goto end
main_loop_body:
	mul	$t1, $t0, SIZE_OF_ELEM	# $t1 = OFFSET = i * size_of_elem

	# MORE CONCISE WAY:
	lw	$t2, numbers($t1) # $t2 = numbers[i]
	
	# MORE VERBOSE WAY:
	la	$t3, numbers	# $t3 = &numbers
	add	$t3, $t3, $t1	# $t3 = &numbers + OFFSET 
	lw	$t3, ($t3)	# $t3 = numbers[i]

	li	$v0, 1		# printf("%d", numbers[i]);
	move	$a0, $t2	
	syscall

	li	$v0, 11		# printf("%c", '\n')
	li	$a0, '\n'
	syscall
main_loop_step:
	addi	$t0, $t0, 1	# i++
	b	main_loop_condition
main_loop_end:
	jr	$ra
	.data
numbers:
        .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9  # int numbers[N_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};


