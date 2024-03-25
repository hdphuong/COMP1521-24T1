FLAG_ROWS = 6	# number of rows
FLAG_COLS = 12	# number of cols
main:
main_row_loop_init:
	li	$t0, 0	# $to = row = 0
main_row_loop_cond:
	bge	$t0, FLAG_ROWS, main_row_loop_end	# if ...
main_row_loop_body:
main_col_loop_init:
	li	$t1, 0	# $t1 = col = 0
main_col_loop_cond:
	bge	$t1, FLAG_COLS, main_col_loop_end	# if ...
main_col_loop_body:
	# &flag[row][col] = &flag + offset
	la	$t3, flag	# $t3 = &flag
	
	# offset = (row * row_length + col) * SIZE_OF_AN_ELEM
	li	$t4, FLAG_COLS		# $t4 = FLAG_COLS
	mul	$t4, $t0, FLAG_COLS	# $t4 = row * FLAG_COLS
	add	$t4, $t4, $t1		# $t4 = row * FLAG_COLS + col
	mul	$t4, $t4, 1		# $t4 = offset

	add	$t5, $t3, $t4	# $t5 = &flag[row][col] = &flag + offset
	lb	$t6, ($t5)	# $t6 = flag[row][col]

	li	$v0, 11		# printf("%c", flag[row][col])
	move	$a0, $t6
	syscall
main_col_loop_step:
	addi	$t1, $t1, 1
	b	main_col_loop_cond
main_col_loop_end:
	li	$v0, 11		# printf("\n")
	li	$a0, '\n'
	syscall
main_row_loop_step:
	addi	$t0, $t0, 1
	b	main_row_loop_cond
main_row_loop_end:
	jr	$ra

	.data
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'  
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
