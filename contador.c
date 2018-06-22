#include "lib/decls.h"

#define COUNTLEN 20
#define TICKS (1ULL << 15)
#define DELAY(x) (TICKS << (x))
#define USTACK_SIZE 4096

static volatile char *const VGABUF = (volatile void *) 0xb8000;

static uintptr_t esp;
static uint8_t stack1[USTACK_SIZE] __attribute__((aligned(4096)));
static uint8_t stack2[USTACK_SIZE] __attribute__((aligned(4096)));

static void yield() {
    if (esp)
        task_swap(&esp);
}

static void contador_yield(unsigned lim, uint8_t linea, char color) {
    char counter[COUNTLEN] = {'0'};  // ASCII digit counter (RTL).

    while (lim--) {
        char *c = &counter[COUNTLEN];
        volatile char *buf = VGABUF + 160 * linea + 2 * (80 - COUNTLEN);

        unsigned p = 0;
        unsigned long long i = 0;

        while (i++ < DELAY(6))  // Usar un entero menor si va demasiado lento.
            ;

        while (counter[p] == '9') {
            counter[p++] = '0';
        }

        if (!counter[p]++) {
            counter[p] = '1';
        }

        while (c-- > counter) {
            *buf++ = *c;
            *buf++ = color;
        }

        yield();
    }
}

void contador_run() {
    //contador_yield(100, 0, 0x2F);
    // Inicializar al *tope* de cada pila.
    uintptr_t *stack1_ptr = stack1 + USTACK_SIZE * sizeof (uint8_t);
    uintptr_t *stack2_ptr = stack2 + USTACK_SIZE * sizeof (uint8_t);

    // Preparar, en stack1, la llamada:
    //contador_yield(100, 0, 0x2F);
    *(--stack1_ptr) = 0x2F;
    *(--stack1_ptr) = 0;
    *(--stack1_ptr) = 100;

    // Preparar, en stack2, la llamada:
    //contador_yield(100, 1, 0x4F);
    *(--stack2_ptr) = 0x4F;
    *(--stack2_ptr) = 1;
    *(--stack2_ptr) = 100;
    *(--stack2_ptr) = &contador_yield;  //gcc extra return address  
    *(--stack2_ptr) = &contador_yield;
    asm ("movl %%edi, %0" : "=r" (*(--stack2_ptr)) );
    asm ("movl %%esi, %0" : "=r" (*(--stack2_ptr)) );
    asm ("movl %%ebp, %0" : "=r" (*(--stack2_ptr)) );
    asm ("movl %%ebx, %0" : "=r" (*(--stack2_ptr)) );
    
    // Actualizar la variable estatica 'esp' para que apunte
    // al del segundo contador.
    esp = stack2_ptr;
    // Lanzar primer contador
    task_exec((uintptr_t) contador_yield, (uintptr_t) stack1_ptr);
}
