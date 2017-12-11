.data

.text

.global _start

_start:

	mov		$60, %rax
	mov		$0x10, %rdi
	syscall
