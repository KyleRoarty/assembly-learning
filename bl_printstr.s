.section .text

.global _start

_start:

    xorl %eax, %eax
    movb $0x0e, %ah
    movl $STR0, %esi

label1:

    movb (%esi), %al
    cmpb $0, %al
    je label2

    int $0x10

    inc %esi

    jmp label1


label2:

    jmp .

STR0:
    .ascii "Hello, world!\0"

    .fill 510 - (. - .text), 1, 0
    .word 0xaa55

