PROJECT:=baremetal
TARGETS:=$(PROJECT).elf $(PROJECT).bin $(PROJECT).debug.txt

#PREFIX:=riscv64-unknown-elf-
#CFLAGS:=-I/usr/include

PREFIX:=/opt/buildroot/output/host/bin/riscv32-buildroot-linux-uclibc-
CFLAGS:=-fno-stack-protector
CFLAGS+=-static-libgcc -fdata-sections -ffunction-sections
CFLAGS+=-g -Os -march=rv32ima_zicsr -mabi=ilp32 -static
LDFLAGS:= -T flatfile.lds -nostdlib -Wl,--gc-sections

$(PROJECT).elf : $(PROJECT).c $(PROJECT).S
	$(PREFIX)gcc -o $@ $^ $(CFLAGS) $(LDFLAGS)

$(PROJECT).debug.txt : $(PROJECT).elf
	$(PREFIX)objdump -t $^ > $@
	$(PREFIX)objdump -S $^ >> $@

$(PROJECT).bin : $(PROJECT).elf
	$(PREFIX)objcopy $^ -O binary $@

all : $(TARGETS)
	@echo ============ Built $< ============

clean :
	rm -rf $(TARGETS)

