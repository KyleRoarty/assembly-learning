.data

hellostr:
	.ascii "Hello, World!\n"
hellolen:
	.equ len, hellolen - hellostr

.text

.global _start

_start:

	movq	$1, %rax
	movq	$1, %rdi
	movq	$hellostr, %rsi
	movq	$len, %rdx
	syscall


	mov		$60, %rax
	mov		$0x0, %rdi
	syscall
