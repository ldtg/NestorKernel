#include "lib/multiboot.h"

#define KSTACK_SIZE 8192

.align 4
multiboot:
    .long MULTIBOOT_HEADER_MAGIC
    .long 0
    .long -(MULTIBOOT_HEADER_MAGIC)

.globl _start
_start:
    // Paso 1: Configurar el stack antes de llamar a kmain.
    movl $0, %ebp
    // El sp apunta al final del stack
    movl $(kstack + KSTACK_SIZE), %esp
    push %ebp

    // Paso 2: pasar la información multiboot a kmain. Si el
    // kernel no arrancó vía Multiboot, se debe pasar NULL.
    //
    // Usar una instrucción de comparación (TEST o CMP) para
    // comparar con MULTIBOOT_BOOTLOADER_MAGIC, pero no usar
    // un salto a continuación, sino una instrucción CMOVcc
    // (copia condicional).
     //   mov src, dst

    // Si en eax esta MULTIBOOT_BOOTLOADER_MAGIC significa que 
    //   arrancamos con multiboot */
    test %eax, MULTIBOOT_BOOTLOADER_MAGIC //TODO < SEGMENTATION FAULT
    // Pongo cero en edx despues pongo ebx (direccion de memoria del struct pedido)
    //   si el cmp anterior dio equals y pusheo edx (0 si no equals o ebx si equals)

    movl $0, %edx
    cmove %ebx, %edx
    push %edx

    call kmain
halt:
    hlt
    jmp halt

.data
.p2align 12
kstack:
    .space KSTACK_SIZE

    