.data

.text

.global printstdout
.global brkNum

/*
	rdi: pointer to first memory address
*/
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

/*
	rdi: number to print
*/
brkNum:
	pushq	%r12
	pushq	%r13

	movq	%rdi, %rax
	movq	$10, %r11

	xorq	%r12, %r12
	pushq	$0
	inc		%r12

.L_div_top:
	xorq	%rdx, %rdx
	cmpq	$0, %rax
	je .L_div_end

	divq	%r11
	inc		%r12
	addq	$0x30, %rdx
	pushq	%rdx

	jmp .L_div_top
.L_div_end:
	movq	$12, %rax
	movq	$0, %rdi
	syscall

	movq	%rax, %r13
	leaq	(%rax, %r12), %rdi
	movq	$12, %rax
	syscall

	xorq	%r11, %r11
.L_store_top:
	cmpq %r11, %r12
	je .L_store_end

	popq	%rax
	movb	%al, (%r13, %r11)
	inc		%r11

	jmp .L_store_top
.L_store_end:

	movq	%r13, %rdi
	call printstdout

	movq	$12, %rax
	movq	%r13, %rdi
	syscall

	popq	%r13
	popq	%r12

	ret





