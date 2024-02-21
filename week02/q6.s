main:
	la	$a0, prompt	# printf("Enter a number:")
	li	$v0, 4
	syscall
	
	li	$v0, 5		# scanf("%d", &x);
	syscall 

	# good practice to have a register ($t or $s) dedicated for a variable
	move	$t0, $v0	# $t0 = x
	
	ble	$t0, 100, main_print_small_big # if (x <= 100) ...
	bge	$t0, 1000, main_print_small_big # if (x >= 1000) .... 
	
	li	$v0, 4		# printf("meidum\n");
	la	$a0, medium_str
	syscall 

	j	main_epilogue

# good practice to have your labels prefixed with function name
main_print_small_big:
	li	$v0, 4		# printf("small/big\n")
	la	$a0, small_big_str 
	syscall

main_epilogue:
	li	$v0, 0		# return 0
	jr	$ra

	.data 
prompt:
	.asciiz "Enter a number: "
small_big_str:
	.asciiz "small/big\n"
medium_str:
	.asciiz "medium\n"
