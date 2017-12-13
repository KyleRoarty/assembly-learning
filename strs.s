.data

.text

.global printstdout

printstdout:
	push	%r12
	movq	%rdi, %r12

	call _strlen
	movq	%rax, %r11

	movq	$1, %rax
	movq	$1, %rdi
	movq	%r12, %rsi
	movq	%r11, %rdx
	syscall

	pop		%r12
	ret


_strlen:
	movq	%rdi, %r10
	xorb	%al, %al

	cld
	repne scasb

	subq %r10, %rdi
	movq %rdi, %rax
	ret
