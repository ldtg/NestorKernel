CFLAGS := -g -std=c99 -Wall -Wextra -Wpedantic
CFLAGS += -m32 -O0 -ffreestanding -fasm -fno-omit-frame-pointer
CPPFLAGS := -nostdlibinc -idirafter lib
LIBGCC := $(shell $(CC) $(CFLAGS) -print-libgcc-file-name)
CC := clang
SRCS := $(wildcard *.c) $(wildcard lib/*.c)
OBJS :=  $(patsubst %.S,%.o,$(wildcard *.S)) $(patsubst %.c,%.o,$(SRCS)) 

QEMU := qemu-system-i386 -serial mon:stdio
KERN ?= bin/kern
BOOT := -kernel $(KERN) 
# boot.o stack.o tasks.o funcs.o 
bin/kern: $(OBJS)
	@mkdir -p bin
	ld -m elf_i386 -Ttext 0x100000 $^ $(LIBGCC) -o $@
	# Verificar imagen Multiboot v1.
	grub-file --is-x86-multiboot $@

%.o: %.S
	$(CC) $(CFLAGS) -c $<

qemu: $(KERN)
	$(QEMU) $(BOOT) $(QEMU_EXTRA)

qemu-gdb: $(KERN)
	$(QEMU) $(BOOT) $(QEMU_EXTRA) -S -gdb tcp:127.0.0.1:7508 

gdb:
	gdb -q -s bin/kern -n -ex 'target remote 127.0.0.1:7508'

clean:
	rm -f bin/kern *.o lib/*.o core

.PHONY: qemu qemu-gdb gdb