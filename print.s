.global _start

_start:
    movb $0x0e, %ah

    movb $'H', %al
    int $0x10
    movb $0x69, %al
    int $0x10
    movb $0x21, %al
    int $0x10

    jmp .

    .fill 510 - (. - _start), 1, 0
    .word 0xaa55

