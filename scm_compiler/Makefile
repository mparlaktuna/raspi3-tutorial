SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
CFLAGS = -Wall -O2 -ffreestanding -nostdinc -nostdlib -nostartfiles
GCCPATH = ../../gcc-arm-10.2-2020.11-x86_64-aarch64-none-elf/bin

all: clean kernel8.img

generate:
	guile -s main.scm

start.o: start.S
	$(GCCPATH)/aarch64-none-elf-gcc $(CFLAGS) -c start.S -o start.o

rumi.o: rumi.s
	$(GCCPATH)/aarch64-none-elf-gcc $(CFLAGS) -c rumi.s -o rumi.o

main.s: main.c 
	$(GCCPATH)/aarch64-none-elf-gcc $(CFLAGS) -c -S $< -o $@ 

uart.s: uart.c
	$(GCCPATH)/aarch64-none-elf-gcc $(CFLAGS) -c -S $< -o $@ 

%.o: %.c
	$(GCCPATH)/aarch64-none-elf-gcc $(CFLAGS) -c  $< -o $@ 

kernel8.img: generate start.o rumi.o $(OBJS)
	$(GCCPATH)/aarch64-none-elf-ld -nostdlib -nostartfiles start.o rumi.o $(OBJS) -T link.ld -o kernel8.elf
	$(GCCPATH)/aarch64-none-elf-objcopy -O binary kernel8.elf kernel8.img

clean:
	rm kernel8.none-elf *.o >/dev/null 2>/dev/null || true

run: kernel8.img
	qemu-system-aarch64 -M raspi3b -kernel kernel8.img -serial null -serial stdio
objd:
	objdump -s -d -M no-aliases uart.o
