.data

hellostr:
	.ascii "Hello, World!\n"
hellolen:
	.equ len, hellolen - hellostr

.text

.global _start

_start:

	mov		$1, %rax
	mov		$1, %rdi
	mov		$hellostr, %rsi
	mov		$len, %rdx
	syscall


	mov		$60, %rax
	mov		$0x0, %rdi
	syscall
