CFLAGS = -nostdlib -ffreestanding
CC = aarch64-elf-gcc
QEMU = qemu-system-aarch64

all: bmpm.bin

bmpm.bin: entry_point.S link.lds
	$(CC) -o $@ $(CFLAGS) entry_point.S -Tlink.lds

run:
	$(QEMU) \
    	-M virt,gic_version=3 \
    	-cpu cortex-a53 \
    	-smp 4 -M type=virt -m 512M \
    	-chardev socket,id=qemu-monitor,host=localhost,port=7777,server,nowait,telnet \
    	-mon qemu-monitor,mode=readline \
    	-nographic -no-reboot -s \
    	-kernel bmpm.bin 