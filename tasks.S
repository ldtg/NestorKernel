.text
.globl two_stacks
two_stacks:
        // Preámbulo estándar
        push %ebp /// <- ebp lo guarda la callee o la caller?
        movl %esp, %ebp

        movl 4(%esp), %ebx
        movl 8(%esp), %eax

        // Realizar primera llamada con stack1. Ayuda: usar LEA
        // con el mismo offset que los últimos MOV para calcular
        // la dirección deseada de ESP.
        leal -12(%ebx), %esp
        call %eax

        // Restaurar stack original. ¿Es %ebp suficiente?
        movl 0(%ebp), %esp

        // Realizar segunda llamada con stack2.
        leal -12(%ebx), %esp
        call vga_write

        // Restaurar registros callee-saved, si se usaron.
        pop %ebx

        leave
        ret