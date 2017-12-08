.text
    STR0:
        .ascii "Hello, world!\0"

.global _start

_start:

    mov $STR0, %ebx
    mov $1, %edi

label1:

    cmpb $0, (%ebx, %edi)
    je label2

    movb $0x0e, %ah
    movb (%ebx, %edi), %al
    int $0x10

    add $1, %edi

    jmp label1


label2:

    jmp .

    .fill 510 - (. - .text), 1, 0
    .word 0xaa55

