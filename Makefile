CFLAGS := -g -std=c99 -Wall -Wextra -Wpedantic
CFLAGS += -m32 -O1 -ffreestanding -fasm -fno-omit-frame-pointer
CPPFLAGS := -nostdlibinc -idirafter lib
LIBGCC := $(shell $(CC) $(CFLAGS) -print-libgcc-file-name)
CC := clang
SRCS := $(wildcard *.c) $(wildcard lib/*.c)
OBJS :=  $(patsubst src/,,$(SRCS:.c=.o)) 

QEMU := qemu-system-i386 -serial mon:stdio
KERN ?= bin/kern
BOOT := -kernel $(KERN) $(QEMU_EXTRA)

bin/kern: boot.o $(OBJS)
	@mkdir -p bin
	ld -m elf_i386 -Ttext 0x100000 $^ $(LIBGCC) -o $@
	# Verificar imagen Multiboot v1.
	grub-file --is-x86-multiboot $@

%.o: %.S
	$(CC) $(CFLAGS) -c $<

qemu: $(KERN)
	$(QEMU) $(BOOT)

qemu-gdb: $(KERN)
	$(QEMU) $(BOOT) -S -gdb tcp:127.0.0.1:7508 

gdb:
	gdb -q -s bin/kern -n -ex 'target remote 127.0.0.1:7508'

clean:
	rm -f bin/kern *.o lib/*.o core

.PHONY: qemu qemu-gdb gdb