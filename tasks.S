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

.text
.globl task_swap
task_swap:
        // push calle saved
        push %ebx
        push %ebp
        push %esi
        push %edi
        
        //intercambiar esp y *esp_parametro
        movl 20(%esp), %eax // eax= esp_parametro
        movl 0(%eax), %edx // edx = *esp_parametro
        movl %esp, 0(%eax) // esp_parametro = esp
        movl %edx, %esp // 
        
        //pop calle saved
        pop %edi
        pop %esi
        pop %ebp
        pop %ebx

        ret
        