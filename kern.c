#include "lib/decls.h"
#include "lib/interrupts.h"
#include "lib/multiboot.h"
#include "lib/string.h"
#define CMD_BUF_SIZE 256

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
    }
}

