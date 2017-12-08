;
; Note: this example is written in Intel Assembly syntax
;
[BITS 16]

boot:
    mov ah, 0x0e

    mov al, 'H'
    int 0x10

    mov al, 'i'
    int 0x10

    mov al, '!'
    int 0x10

    jmp $

times 510-($-$$) db 0

dw 0xaa55
