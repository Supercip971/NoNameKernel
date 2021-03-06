bits 64
global _x86_64_lgdt
_x86_64_lgdt:
    lgdt [rdi]
    push rbp
    mov rbp, rsp

    push qword 0x10
    push rbp
    pushf
    push qword 0x8
    push .trampoline
    iretq

.trampoline:
    pop rbp

    mov ax, 0x10

    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    mov ax, 0x28
    ltr ax

    ret
