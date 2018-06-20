//
// Created by darius on 18/06/18.
//

//#include <elf.h>

#include "decls.h"
#include "interrupts.h"

#define MAX_DESCRIPTORS 256

// Multiboot siempre define "8" como el segmento de código.
// (Ver campo CS en `info registers` de QEMU.)
static const uint8_t KSEG_CODE = 8;

// Identificador de "Interrupt gate de 32 bits" (ver IA32-3A,
// tabla 6-2: IDT Gate Descriptors).
static const uint8_t STS_IG32 = 0xE;

static struct IDTR idtr;

static struct Gate idt[MAX_DESCRIPTORS] __attribute__ ((aligned (8)));

void idt_init(void){
  idt_install(T_BRKPT, breakpoint);

  idtr.base = (uintptr_t) &idt;
  idtr.limit = 8*MAX_DESCRIPTORS - 1;

  asm("lidt %0" : : "m"(idtr));
}

void idt_install(uint8_t n, void (*handler)(void)) {
  uintptr_t addr = (uintptr_t) handler;

  idt[n].rpl = 0;
  idt[n].type = STS_IG32;
  idt[n].segment = KSEG_CODE;

  idt[n].off_15_0 = addr & 0xFFFF;
  idt[n].off_31_16 = addr >> 16;

  idt[n].present = 1;
}