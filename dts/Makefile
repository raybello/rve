
OUTPUT_DIR = /workspace/project

bintoh :
	echo "#include <stdio.h>" > bintoh.c
	echo "int main(int argc,char ** argv) {if(argc==1) return -1; int c, p=0; printf( \"static const unsigned char %s[] = {\", argv[1] ); while( ( c = getchar() ) != EOF ) printf( \"0x%02x,%c\", c, (((p++)&15)==15)?10:' '); printf( \"};\" ); return 0; }" >> bintoh.c
	gcc bintoh.c -o bintoh

sixtyfourmb.dtb : sixtyfourmb.dts
	dtc -I dts -O dtb -o $@ $^ -S 2048

default64mbdtc.h : sixtyfourmb.dtb bintoh
	./bintoh default64mbdtb < $< > $@
	# WARNING: sixtyfourmb.dtb MUST have at least 16 bytes of buffer room AND be 16-byte aligned.
	#  dtc -I dts -O dtb -o sixtyfourmb.dtb sixtyfourmb.dts -S 1536

# RV64 machine (OpenSBI + Sv39 Linux). 4 KiB of slack: OpenSBI expands the FDT in place.
rve64.dtb : rve64.dts
	dtc -I dts -O dtb -o $@ $^ -S 4096

default_rv64_dtc.h : rve64.dtb
	python3 ../scripts/dtb2h.py default_rv64_dtb < $< > $@

rv64:
	make default_rv64_dtc.h && \
	cp -f default_rv64_dtc.h $(OUTPUT_DIR)/rve/include/default_rv64_dtc.h

dts: clean
	make default64mbdtc.h && \
	cp -f default64mbdtc.h $(OUTPUT_DIR)/rve/include/default64mbdtc.h

clean:
	rm -f bintoh bintoh.c sixtyfourmb.dtb default64mbdtc.h rve64.dtb default_rv64_dtc.h