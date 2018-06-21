/* Callee saved: EBX, EBP, EDI, ESI */

.data
breakpoint_msg:
        .asciz "Hello, breakpoint"

.text
.globl breakpoint
breakpoint:
        // (1) Guardar registros.
        push %ebp
        movl %esp, %ebp

        // (2) Preparar argumentos de la llamada.

        movl $0xB0, -4(%ebp)
        movl $14, -8(%ebp)
        movl $breakpoint_msg, -12(%ebp)

        // (3) Invocar a vga_write2()
        leal -12(%esp), %esp
        call vga_write2
        // (4) Restaurar registros.

        // (5) Finalizar ejecución del manejador.
        leave
        iret
