.data

.text

.global printstdout
.global printnum

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
	xorq	%rcx, %rcx
	xorb	%al, %al

	not		%rcx

	cld
	repne scasb

	not		%rcx
	dec		%rcx
	movq %rcx, %rax
	ret
