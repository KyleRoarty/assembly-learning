.data

hellostr:
	.ascii "Hello, World!\n"
helloend:
	.equ len, helloend - hellostr

.text

.global _start

_start:
	movl $4, %eax
	movl $1, %ebx
	movl $hellostr, %ecx
	movl $len, %edx
	int $0x80

	movl $1, %eax
	movl $100, %ebx
	int $0x80
