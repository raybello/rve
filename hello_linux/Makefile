all : hello_linux pi framebuff

PREFIX:=/opt/buildroot/output/host/bin/riscv32-buildroot-linux-uclibc-
CC:=$(PREFIX)gcc
OBJDUMP:=$(PREFIX)objdump

# Note:  regymm says to do -fPIE -pie -static, instead of -fPIC
CFLAGS:=-mabi=ilp32 -fPIE -pie -static -march=rv32ima -Os -s -g -ffunction-sections -fdata-sections
LDFLAGS:=-Wl,-elf2flt=-r -Wl,-gc-sections


hello_linux : hello_linux.c
	$(CC) $(CFLAGS) $^  $(LDFLAGS) -o $@ 
	$(OBJDUMP) -S $@.gdb > $@.S

pi : pi.c
	$(CC) $(CFLAGS) $^ $(LDFLAGS) -o $@
	$(OBJDUMP) -S $@.gdb > $@.S

framebuff : framebuff.c
	$(CC) $(CFLAGS) $^ $(LDFLAGS) -lm -o $@
	$(OBJDUMP) -S $@.gdb > $@.S

deploy : hello_linux pi framebuff
	cp -f hello_linux /opt/buildroot/output/target/root
	cp -f pi /opt/buildroot/output/target/root
	cp -f framebuff /opt/buildroot/output/target/root

clean :
	rm -rf hello_linux hello_linux.gdb hello_linux.S pi pi.gdb pi.S framebuff framebuff.gdb framebuff.S
