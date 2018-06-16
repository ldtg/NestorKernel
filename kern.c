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

//        strncat(buf, cmdline, CMD_BUF_SIZE - strlen(buf));
//        vga_write(buf, 9, WHITE_BLUE);
       //     vga_write("vga_write() from stack1", 12, 0x17);
       //   vga_write("vga_write() from stack2", 13, 0x90);
       two_stacks();
       two_stacks_c();
     }
}


static uint8_t stack1[USTACK_SIZE] __attribute__((aligned(4096)));
static uint8_t stack2[USTACK_SIZE] __attribute__((aligned(4096)));

void two_stacks_c() {
  // Inicializar al *tope* de cada pila.
  uintptr_t *a = ...
  uintptr_t *b = ...

  // Preparar, en stack1, la llamada:
  vga_write("vga_write() from stack1", 15, 0x57);

  // AYUDA 1: se puede usar alguna forma de pre- o post-
  // incremento/decremento, según corresponda:
  //
  //     *(a++) = ...
  //     *(++a) = ...
  //     *(a--) = ...
  //     *(--a) = ...

  // AYUDA 2: para apuntar a la cadena con el mensaje,
  // es suficiente con el siguiente cast:
  //
  //   ... a ... = (uintptr_t) "vga_write() from stack1";

  // Preparar, en s2, la llamada:
  vga_write("vga_write() from stack2", 16, 0xD0);

  // AYUDA 3: para esta segunda llamada, usar esta forma de
  // asignación alternativa:
  b -= 3;
  b[0] = ...
  b[1] = ...
  b[2] = ...

  // Primera llamada usando task_exec().
  task_exec((uintptr_t) vga_write, (uintptr_t) s1);

  // Segunda llamada con ASM directo. Importante: no
  // olvidar restaurar el valor de %esp al terminar, y
  // compilar con: -fasm -fno-omit-frame-pointer.
  asm("...; call *%1; ..."
  : /* no outputs */
  : "r"(s2), "r"(vga_write));
}

