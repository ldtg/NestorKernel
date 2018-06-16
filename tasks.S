.text
.globl task_exec
task_exec:
        // Preámbulo estándar
        push %ebp /// <- ebp lo guarda la callee o la caller?
        movl %esp, %ebp
        // Porque es 8 y no 4? Vi en el gdb que en el stack hay algo antes que ni idea quien lo metio ahi
        movl 8(%esp), %eax
        movl 12(%esp), %ebx

        // Realizar primera llamada con stack1. Ayuda: usar LEA
        // con el mismo offset que los últimos MOV para calcular
        // la dirección deseada de ESP.
        leal 0(%ebx), %esp
        call *%eax

        // Restaurar stack original. ¿Es %ebp suficiente?
        movl 0(%ebp), %esp

        
        // Restaurar registros callee-saved, si se usaron.
        pop %ebx

        leave
        ret

.globl vga_write2
vga_write2:
        push %ebp
        movl %esp, %ebp

        push %ecx
        push %edx
        push %eax

        call vga_write

        leave
        ret

        