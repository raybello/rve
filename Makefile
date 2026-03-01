all:
	make -C rve

rerun:
	make -C rve rerun

run:
	make -C rve run

isa: 
	make -C rve isa ISA_TEST=rv32ua-p-lrsc

isas: 
	make -C rve isas

linux:
	make -C rve linux

linuxn:
	make -C rve linuxn

web:
	make -C rve web

clean:
	make -C rve clean