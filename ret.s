.extern printstdout
.global _start

.data

nl:
	.asciz "\n"
nlend:
	.equ len, nlend - nl
hellostart:
	.asciz "Hello, World!\n"
helloend:
	.equ hello_len, helloend - hellostart

.text

_start:
	movq	(%rsp), %r12

	movq	$hellostart, %rdi
	call	printstdout

    movq    $0, %r13
.L_loop_start:
	movq	8(%rsp, %r13, 8), %rdi
	call	printstdout

	# Print newline
	movq	$nl, %rdi
	call	printstdout

	inc %r13
	cmpq %r12, %r13
	jne .L_loop_start

.L_loop_end:

	movq	$60, %rax
	movq	$0x0, %rdi
	syscall
