#include "lib/decls.h"

static volatile char* const VGABUF = (volatile char *) 0xb8000;

void vga_write(const char *string, int8_t linea, uint8_t color){
    volatile char *vga = VGABUF + SCREEN_WIDTH * linea;

    while( *string != 0 ) {
        *vga++ = *string++;
        *vga++ = color;
    }
}