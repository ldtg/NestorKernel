#include "lib/decls.h"
#include "lib/interrupts.h"
#include "lib/multiboot.h"

void kmain(void){
    vga_write("Hello there!", 2, WHITE_BLUE);
    while (1)
        asm("hlt");
}
