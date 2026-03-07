
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

dts: clean
	make default64mbdtc.h && \
	cp -f default64mbdtc.h $(OUTPUT_DIR)/rve/include/default64mbdtc.h

clean:
	rm -f bintoh bintoh.c sixtyfourmb.dtb default64mbdtc.h