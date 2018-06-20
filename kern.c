#include "lib/decls.h"
#include "lib/interrupts.h"
#include "lib/multiboot.h"
#include "lib/string.h"
#define CMD_BUF_SIZE 256
#define USTACK_SIZE 4096

void kmain(const multiboot_info_t *mbi){
    vga_write("NestorKernel loading....", 2, WHITE_BLUE);
    
     if (mbi->flags & MULTIBOOT_INFO_CMDLINE) {
       char buf[CMD_BUF_SIZE] = "cmdline: ";
       char *cmdline = (void *) mbi->cmdline;
       // Aquí usar strlcat() para concatenar cmdline a buf.
       strlcat(buf, cmdline, CMD_BUF_SIZE);

        /*strncat(buf, cmdline, CMD_BUF_SIZE - strlen(buf));
        vga_write(buf, 9, WHITE_BLUE);
            vga_write("vga_write() from stack1", 12, 0x17);
          vga_write("vga_write() from stack2", 13, 0x90);*/



       two_stacks();
       two_stacks_c();

       idt_init();
       asm("int3");

       vga_write2("Funciona vga_write2?", 18, 0xE0);
       contador_run();
     }
}


static uint8_t stack1[USTACK_SIZE] __attribute__((aligned(4096)));
static uint8_t stack2[USTACK_SIZE] __attribute__((aligned(4096)));

void two_stacks_c() {
  // Inicializar al *tope* de cada pila.
  uintptr_t *stack1_ptr = stack1 + USTACK_SIZE * sizeof (uint8_t);
  uintptr_t *stack2_ptr = stack2 + USTACK_SIZE * sizeof (uint8_t);

  // Preparar, en stack1, la llamada:
  //vga_write("vga_write() from stack1", 15, 0x57);
    *(--stack1_ptr) = 0x57;
    *(--stack1_ptr) = 15;
    *(--stack1_ptr) =  (uintptr_t) "vga_write() from stack1 C";

  // Preparar, en s2, la llamada:
  //vga_write("vga_write() from stack2", 16, 0xD0);

  // AYUDA 3: para esta segunda llamada, usar esta forma de
  // asignación alternativa:
  stack2_ptr -= 3;
  stack2_ptr[0] = (uintptr_t) "vga_write() from stack2 C";
  stack2_ptr[1] = 16;
  stack2_ptr[2] = 0xD0;

  // Primera llamada usando task_exec().
  task_exec((uintptr_t) vga_write, (uintptr_t) stack1_ptr);

  // Segunda llamada con ASM directo. Importante: no
  // olvidar restaurar el valor de %esp al terminar, y
  // compilar con: -fasm -fno-omit-frame-pointer.
  asm(
    "movl %%esp, %%ebp;"
    "leal 0(%0), %%esp;"
    "call *%1;"
    "movl %%ebp, %%esp;"
    :: "r"(stack2_ptr), "r"(vga_write));
}

