//
// Created by darius on 18/06/18.
//

#include <elf.h>

#include "decls.h"
#include "interrupts.h"

#define DESCRIPTOR_SIZE 64
#define MAX_DESCRIPTORS 256

static struct IDTR idtr;
static char idt[DESCRIPTOR_SIZE * MAX_DESCRIPTORS];

void idt_init(void){
  idtr.base = (uintptr_t) &idt;
  idtr.limit = 0x0;

  asm("lidt %0" : : "m"(idtr));
}

void idt_install(uint8_t n, void (*handler)(void)){

};
