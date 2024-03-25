
main:
main_prologue:
	begin
	push	$ra
main_body:
	li	$a0, 11
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal	sum4	# call sum4(11, 13, 17, 19)

	move	$a0, $v0	# printf("%d", result)
	li	$v0, 1
	syscall
main_epilogue:
	pop	$ra
	end
	jr	$ra


sum4:	# $a0 = a, $a1 = b, $a2 = c, $a3 = d
sum4_prologue:
	begin
	push	$ra
	push	$s0
	push	$s1
	push	$s2	# save the original value of $s2 before sum4 is called

sum4_body:
	move	$s1, $a2	# $s1 = c	
	move	$s2, $a3	# $s2 = d = 19

	move	$a0, $a0	# $a0 = a
	move	$a1, $a1	# $a1 = b
	jal	sum2		# call sum2(a, b)

	move	$s0, $v0	# $s0 = res1

	move	$a0, $s1	# $a0 = c
	move	$a1, $s2	# $a1 = d
	jal	sum2		# call sum2(c,d)

	move	$a0, $s0	# $a0 = res1
	move	$a1, $v0	# $a1 = res2
	jal	sum2		# call sum2(res1, res2)

	move	$v0, $v0	# return sum2(res1, res2) | can be omitted

sum4_epilogue:
	pop	$s2	# restore the old value of $s2 before sum4 is called
	pop	$s1
	pop	$s0
	pop	$ra
	end
	jr	$ra

sum2:
	# $a0 = x, $a1 = y
	# may be evil and clobber all the $t registers and $a registers
	# if sum2 use $s registers, need to push/pop them (same with any other functions)
	add	$v0, $a0, $a1	# return x + y
	jr	$ra

