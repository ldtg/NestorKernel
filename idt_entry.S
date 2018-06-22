#define PIC1 0x20
#define ACK_IRQ 0x20

.globl divzero
divzero:
        push %ebp
        movl %esp, %ebp

        movl $18, %edx
        movl $div0_msg, %eax

        call vga_write_cyan

        leave
        addl $1, %ebx

        iret

.globl ack_irq
ack_irq:
        // Indicar que se manejo la interrupcion.
        movl $ACK_IRQ, %eax
        outb %al, $PIC1
        iret

.globl timer_asm
timer_asm:
        // Guardar registros.
        push %ebp
        movl %esp, %ebp

        call timer
        // Restaurar registros.
        leave
        jmp ack_irq

.globl breakpoint
breakpoint:
        // (1) Guardar registros.
        push %ebp
        movl %esp, %ebp

        // (2) Preparar argumentos de la llamada.


        movl $0xB0, %ecx
        movl $14, %edx
        movl $breakpoint_msg, %eax

        // (3) Invocar a vga_write2()
        call vga_write2
        // (4) Restaurar registros.

        // (5) Finalizar ejecucion del manejador.
        leave
        iret

.data
div0_msg:
        .asciz "Se divide por ++ebx"

breakpoint_msg:
        .asciz "Hello, breakpoint"

