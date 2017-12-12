.data

nl:
	.ascii "\n"
nlend:
	.equ len, nlend - nl

.text

.global _start

_start:
	movq	(%rsp), %r12
	movq	$0, %r13

.L_loop_start:
	movq	$1, %rax
	movq	$1, %rdi
	movq	8(%rsp, %r13, 8), %rsi
	movq	%rsi, %r10

.L_str_len:
	cmpb $0, (%r10)
	je .L_str_len_end
	inc %r10
	jmp .L_str_len
.L_str_len_end:
	sub %rsi, %r10
	movq %r10, %rdx
	syscall

	movq	$1, %rax
	movq	$1, %rdi
	movq	$nl, %rsi
	movq	$len, %rdx
	syscall

	inc %r13
	cmpq %r12, %r13
	jne .L_loop_start

	movq	$60, %rax
	movq	$0x0, %rdi
	syscall
