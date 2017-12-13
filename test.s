.global print_helloworld

print_helloworld:

	movq	%rdi, %r10
	movq	%rsi, %r11

	movq	$1, %rax
	movq	$1, %rdi
	movq	%r10, %rsi
	movq	%r11, %rdx
	syscall

	movq	$0, %rax
	ret
