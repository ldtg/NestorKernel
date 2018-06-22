#include "lib/decls.h"

static volatile char* const VGABUF = (volatile char *) 0xb8000;

void vga_write(const char *string, int8_t linea, uint8_t color){
    volatile char *vga = VGABUF + SCREEN_WIDTH * linea;

    while( *string != 0 ) {
        *vga++ = *string++;
        *vga++ = color;
    }
}

__attribute__((regparm(2)))
void vga_write_cyan(const char *s, int8_t linea) {
    vga_write(s, linea, 0xB0);
}