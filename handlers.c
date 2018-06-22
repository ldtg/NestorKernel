//
// Created by darius on 21/06/18.
//

#include "decls.h"

static unsigned ticks;

void timer() {
  if (++ticks == 15) {
    vga_write("Transcurrieron 15 ticks", 20, 0x07);
  }
}