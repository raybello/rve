
pi.gdb:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start-0x4>:
       0:	0000                	.2byte	0x0
	...

00000004 <_start>:
       4:	02c000ef          	jal	30 <.Lload_gp>
       8:	00050793          	mv	a5,a0
       c:	00007517          	auipc	a0,0x7
      10:	00c50513          	add	a0,a0,12 # 7018 <main>
      14:	00012583          	lw	a1,0(sp)
      18:	00410613          	add	a2,sp,4
      1c:	ff017113          	and	sp,sp,-16
      20:	00000693          	li	a3,0
      24:	00000713          	li	a4,0
      28:	00010813          	mv	a6,sp
      2c:	1c90106f          	j	19f4 <__uClibc_main>

00000030 <.Lload_gp>:
      30:	00008197          	auipc	gp,0x8
      34:	a1018193          	add	gp,gp,-1520 # 7a40 <__global_pointer$>
      38:	00008067          	ret

0000003c <deregister_tm_clones>:
      3c:	00008517          	auipc	a0,0x8
      40:	53450513          	add	a0,a0,1332 # 8570 <__TMC_END__>
      44:	00008797          	auipc	a5,0x8
      48:	52c78793          	add	a5,a5,1324 # 8570 <__TMC_END__>
      4c:	00a78a63          	beq	a5,a0,60 <.L1>
      50:	00007797          	auipc	a5,0x7
      54:	1a47a783          	lw	a5,420(a5) # 71f4 <_GLOBAL_OFFSET_TABLE_+0x2c>
      58:	00078463          	beqz	a5,60 <.L1>
      5c:	00078067          	jr	a5

00000060 <.L1>:
      60:	00008067          	ret

00000064 <register_tm_clones>:
      64:	00008517          	auipc	a0,0x8
      68:	50c50513          	add	a0,a0,1292 # 8570 <__TMC_END__>
      6c:	00008597          	auipc	a1,0x8
      70:	50458593          	add	a1,a1,1284 # 8570 <__TMC_END__>
      74:	40a585b3          	sub	a1,a1,a0
      78:	4025d593          	sra	a1,a1,0x2
      7c:	00200793          	li	a5,2
      80:	02f5c5b3          	div	a1,a1,a5
      84:	00058a63          	beqz	a1,98 <.L6>
      88:	00007797          	auipc	a5,0x7
      8c:	1607a783          	lw	a5,352(a5) # 71e8 <_GLOBAL_OFFSET_TABLE_+0x20>
      90:	00078463          	beqz	a5,98 <.L6>
      94:	00078067          	jr	a5

00000098 <.L6>:
      98:	00008067          	ret

0000009c <__do_global_dtors_aux>:
      9c:	ff010113          	add	sp,sp,-16
      a0:	00812423          	sw	s0,8(sp)
      a4:	00009417          	auipc	s0,0x9
      a8:	e7840413          	add	s0,s0,-392 # 8f1c <completed.1>
      ac:	00044783          	lbu	a5,0(s0)
      b0:	00112623          	sw	ra,12(sp)
      b4:	02079463          	bnez	a5,dc <.L14>
      b8:	f85ff0ef          	jal	3c <deregister_tm_clones>
      bc:	00007797          	auipc	a5,0x7
      c0:	1287a783          	lw	a5,296(a5) # 71e4 <_GLOBAL_OFFSET_TABLE_+0x1c>
      c4:	00078863          	beqz	a5,d4 <.L16>
      c8:	00008517          	auipc	a0,0x8
      cc:	4a850513          	add	a0,a0,1192 # 8570 <__TMC_END__>
      d0:	000780e7          	jalr	a5

000000d4 <.L16>:
      d4:	00100793          	li	a5,1
      d8:	00f40023          	sb	a5,0(s0)

000000dc <.L14>:
      dc:	00c12083          	lw	ra,12(sp)
      e0:	00812403          	lw	s0,8(sp)
      e4:	01010113          	add	sp,sp,16
      e8:	00008067          	ret

000000ec <frame_dummy>:
      ec:	00007797          	auipc	a5,0x7
      f0:	1247a783          	lw	a5,292(a5) # 7210 <.LLST53+0x13>
      f4:	02078463          	beqz	a5,11c <.L27>
      f8:	ff010113          	add	sp,sp,-16
      fc:	00112623          	sw	ra,12(sp)
     100:	00009597          	auipc	a1,0x9
     104:	e2058593          	add	a1,a1,-480 # 8f20 <object.0>
     108:	00008517          	auipc	a0,0x8
     10c:	46850513          	add	a0,a0,1128 # 8570 <__TMC_END__>
     110:	000780e7          	jalr	a5
     114:	00c12083          	lw	ra,12(sp)
     118:	01010113          	add	sp,sp,16

0000011c <.L27>:
     11c:	f49ff06f          	j	64 <register_tm_clones>

00000120 <__GI_printf>:
     120:	fc010113          	add	sp,sp,-64
     124:	02b12223          	sw	a1,36(sp)
     128:	02c12423          	sw	a2,40(sp)
     12c:	02f12a23          	sw	a5,52(sp)
     130:	02d12623          	sw	a3,44(sp)
     134:	02e12823          	sw	a4,48(sp)
     138:	03012c23          	sw	a6,56(sp)
     13c:	03112e23          	sw	a7,60(sp)
     140:	00007797          	auipc	a5,0x7
     144:	08c7a783          	lw	a5,140(a5) # 71cc <_GLOBAL_OFFSET_TABLE_+0x4>
     148:	00050593          	mv	a1,a0
     14c:	0007a503          	lw	a0,0(a5)
     150:	02410613          	add	a2,sp,36
     154:	00112e23          	sw	ra,28(sp)
     158:	00c12623          	sw	a2,12(sp)
     15c:	134000ef          	jal	290 <__GI_vfprintf>
     160:	01c12083          	lw	ra,28(sp)
     164:	04010113          	add	sp,sp,64
     168:	00008067          	ret

0000016c <_stdio_term>:
     16c:	ff010113          	add	sp,sp,-16
     170:	00007797          	auipc	a5,0x7
     174:	0707a783          	lw	a5,112(a5) # 71e0 <_GLOBAL_OFFSET_TABLE_+0x18>
     178:	00812423          	sw	s0,8(sp)
     17c:	0007a403          	lw	s0,0(a5)
     180:	00912223          	sw	s1,4(sp)
     184:	00112623          	sw	ra,12(sp)
     188:	ffe00493          	li	s1,-2

0000018c <.L2>:
     18c:	00041c63          	bnez	s0,1a4 <.L5>
     190:	00c12083          	lw	ra,12(sp)
     194:	00812403          	lw	s0,8(sp)
     198:	00412483          	lw	s1,4(sp)
     19c:	01010113          	add	sp,sp,16
     1a0:	00008067          	ret

000001a4 <.L5>:
     1a4:	00045783          	lhu	a5,0(s0)
     1a8:	0407f793          	and	a5,a5,64
     1ac:	00078663          	beqz	a5,1b8 <.L3>
     1b0:	00040513          	mv	a0,s0
     1b4:	098000ef          	jal	24c <__stdio_wcommit>

000001b8 <.L3>:
     1b8:	00442783          	lw	a5,4(s0)
     1bc:	00979a63          	bne	a5,s1,1d0 <.L4>
     1c0:	03442783          	lw	a5,52(s0)
     1c4:	00078663          	beqz	a5,1d0 <.L4>
     1c8:	02442503          	lw	a0,36(s0)
     1cc:	000780e7          	jalr	a5

000001d0 <.L4>:
     1d0:	02042403          	lw	s0,32(s0)
     1d4:	fb9ff06f          	j	18c <.L2>

000001d8 <_stdio_init>:
     1d8:	ff010113          	add	sp,sp,-16
     1dc:	00812423          	sw	s0,8(sp)
     1e0:	00000513          	li	a0,0
     1e4:	00007417          	auipc	s0,0x7
     1e8:	ff042403          	lw	s0,-16(s0) # 71d4 <_GLOBAL_OFFSET_TABLE_+0xc>
     1ec:	00912223          	sw	s1,4(sp)
     1f0:	00112623          	sw	ra,12(sp)
     1f4:	00042483          	lw	s1,0(s0)
     1f8:	688010ef          	jal	1880 <__GI_isatty>
     1fc:	00051c63          	bnez	a0,214 <.L14>
     200:	00008717          	auipc	a4,0x8
     204:	2c870713          	add	a4,a4,712 # 84c8 <_stdio_streams>
     208:	00075783          	lhu	a5,0(a4)
     20c:	1007c793          	xor	a5,a5,256
     210:	00f71023          	sh	a5,0(a4)

00000214 <.L14>:
     214:	00100513          	li	a0,1
     218:	668010ef          	jal	1880 <__GI_isatty>
     21c:	00051c63          	bnez	a0,234 <.L15>
     220:	00008717          	auipc	a4,0x8
     224:	2a870713          	add	a4,a4,680 # 84c8 <_stdio_streams>
     228:	02475783          	lhu	a5,36(a4)
     22c:	1007c793          	xor	a5,a5,256
     230:	02f71223          	sh	a5,36(a4)

00000234 <.L15>:
     234:	00942023          	sw	s1,0(s0)
     238:	00c12083          	lw	ra,12(sp)
     23c:	00812403          	lw	s0,8(sp)
     240:	00412483          	lw	s1,4(sp)
     244:	01010113          	add	sp,sp,16
     248:	00008067          	ret

0000024c <__stdio_wcommit>:
     24c:	00852583          	lw	a1,8(a0)
     250:	01052783          	lw	a5,16(a0)
     254:	ff010113          	add	sp,sp,-16
     258:	00812423          	sw	s0,8(sp)
     25c:	00112623          	sw	ra,12(sp)
     260:	00050413          	mv	s0,a0
     264:	40b78633          	sub	a2,a5,a1
     268:	00b78663          	beq	a5,a1,274 <.L2>
     26c:	00b52823          	sw	a1,16(a0)
     270:	209010ef          	jal	1c78 <__stdio_WRITE>

00000274 <.L2>:
     274:	01042503          	lw	a0,16(s0)
     278:	00842783          	lw	a5,8(s0)
     27c:	00c12083          	lw	ra,12(sp)
     280:	00812403          	lw	s0,8(sp)
     284:	40f50533          	sub	a0,a0,a5
     288:	01010113          	add	sp,sp,16
     28c:	00008067          	ret

00000290 <__GI_vfprintf>:
     290:	00055783          	lhu	a5,0(a0)
     294:	fe010113          	add	sp,sp,-32
     298:	00812c23          	sw	s0,24(sp)
     29c:	00112e23          	sw	ra,28(sp)
     2a0:	0407f793          	and	a5,a5,64
     2a4:	00050413          	mv	s0,a0
     2a8:	00078c63          	beqz	a5,2c0 <.L2>

000002ac <.L3>:
     2ac:	00040513          	mv	a0,s0
     2b0:	01812403          	lw	s0,24(sp)
     2b4:	01c12083          	lw	ra,28(sp)
     2b8:	02010113          	add	sp,sp,32
     2bc:	1580006f          	j	414 <_vfprintf_internal>

000002c0 <.L2>:
     2c0:	00c12623          	sw	a2,12(sp)
     2c4:	00b12423          	sw	a1,8(sp)
     2c8:	469010ef          	jal	1f30 <__stdio_trans2w>
     2cc:	00812583          	lw	a1,8(sp)
     2d0:	00c12603          	lw	a2,12(sp)
     2d4:	fc050ce3          	beqz	a0,2ac <.L3>
     2d8:	01c12083          	lw	ra,28(sp)
     2dc:	01812403          	lw	s0,24(sp)
     2e0:	fff00513          	li	a0,-1
     2e4:	02010113          	add	sp,sp,32
     2e8:	00008067          	ret

000002ec <_charpad>:
     2ec:	fd010113          	add	sp,sp,-48
     2f0:	02812423          	sw	s0,40(sp)
     2f4:	02912223          	sw	s1,36(sp)
     2f8:	03212023          	sw	s2,32(sp)
     2fc:	01312e23          	sw	s3,28(sp)
     300:	02112623          	sw	ra,44(sp)
     304:	00050913          	mv	s2,a0
     308:	00060413          	mv	s0,a2
     30c:	00b10623          	sb	a1,12(sp)
     310:	00060493          	mv	s1,a2
     314:	00c10993          	add	s3,sp,12

00000318 <.L2>:
     318:	00048e63          	beqz	s1,334 <.L5>
     31c:	00090613          	mv	a2,s2
     320:	00100593          	li	a1,1
     324:	00098513          	mv	a0,s3
     328:	2b9010ef          	jal	1de0 <__stdio_fwrite>
     32c:	00100793          	li	a5,1
     330:	02f50263          	beq	a0,a5,354 <.L4>

00000334 <.L5>:
     334:	40940533          	sub	a0,s0,s1
     338:	02c12083          	lw	ra,44(sp)
     33c:	02812403          	lw	s0,40(sp)
     340:	02412483          	lw	s1,36(sp)
     344:	02012903          	lw	s2,32(sp)
     348:	01c12983          	lw	s3,28(sp)
     34c:	03010113          	add	sp,sp,48
     350:	00008067          	ret

00000354 <.L4>:
     354:	fff48493          	add	s1,s1,-1
     358:	fc1ff06f          	j	318 <.L2>

0000035c <_fp_out_narrow>:
     35c:	fe010113          	add	sp,sp,-32
     360:	00912a23          	sw	s1,20(sp)
     364:	01312623          	sw	s3,12(sp)
     368:	01412423          	sw	s4,8(sp)
     36c:	00112e23          	sw	ra,28(sp)
     370:	00812c23          	sw	s0,24(sp)
     374:	01212823          	sw	s2,16(sp)
     378:	01512223          	sw	s5,4(sp)
     37c:	0805f793          	and	a5,a1,128
     380:	00050a13          	mv	s4,a0
     384:	00060493          	mv	s1,a2
     388:	00068993          	mv	s3,a3
     38c:	06078e63          	beqz	a5,408 <.L12>
     390:	00068513          	mv	a0,a3
     394:	00058a93          	mv	s5,a1
     398:	26c010ef          	jal	1604 <__GI_strlen>
     39c:	40a484b3          	sub	s1,s1,a0
     3a0:	00050913          	mv	s2,a0
     3a4:	00000413          	li	s0,0
     3a8:	00905e63          	blez	s1,3c4 <.L9>
     3ac:	00048613          	mv	a2,s1
     3b0:	07faf593          	and	a1,s5,127
     3b4:	000a0513          	mv	a0,s4
     3b8:	f35ff0ef          	jal	2ec <_charpad>
     3bc:	00050413          	mv	s0,a0
     3c0:	02a49063          	bne	s1,a0,3e0 <.L8>

000003c4 <.L9>:
     3c4:	00000513          	li	a0,0
     3c8:	01205a63          	blez	s2,3dc <.L11>
     3cc:	000a0613          	mv	a2,s4
     3d0:	00090593          	mv	a1,s2
     3d4:	00098513          	mv	a0,s3
     3d8:	209010ef          	jal	1de0 <__stdio_fwrite>

000003dc <.L11>:
     3dc:	00a40433          	add	s0,s0,a0

000003e0 <.L8>:
     3e0:	01c12083          	lw	ra,28(sp)
     3e4:	00040513          	mv	a0,s0
     3e8:	01812403          	lw	s0,24(sp)
     3ec:	01412483          	lw	s1,20(sp)
     3f0:	01012903          	lw	s2,16(sp)
     3f4:	00c12983          	lw	s3,12(sp)
     3f8:	00812a03          	lw	s4,8(sp)
     3fc:	00412a83          	lw	s5,4(sp)
     400:	02010113          	add	sp,sp,32
     404:	00008067          	ret

00000408 <.L12>:
     408:	00060913          	mv	s2,a2
     40c:	00000413          	li	s0,0
     410:	fb5ff06f          	j	3c4 <.L9>

00000414 <_vfprintf_internal>:
     414:	e2010113          	add	sp,sp,-480
     418:	1d412423          	sw	s4,456(sp)
     41c:	0c010a13          	add	s4,sp,192
     420:	00a12223          	sw	a0,4(sp)
     424:	000a0513          	mv	a0,s4
     428:	1c812c23          	sw	s0,472(sp)
     42c:	1c912a23          	sw	s1,468(sp)
     430:	1c112e23          	sw	ra,476(sp)
     434:	1d212823          	sw	s2,464(sp)
     438:	1d312623          	sw	s3,460(sp)
     43c:	1d512223          	sw	s5,452(sp)
     440:	1d612023          	sw	s6,448(sp)
     444:	1b712e23          	sw	s7,444(sp)
     448:	1b812c23          	sw	s8,440(sp)
     44c:	1b912a23          	sw	s9,436(sp)
     450:	1ba12823          	sw	s10,432(sp)
     454:	1bb12623          	sw	s11,428(sp)
     458:	00058413          	mv	s0,a1
     45c:	00060493          	mv	s1,a2
     460:	5b0000ef          	jal	a10 <_ppfs_init>
     464:	06055663          	bgez	a0,4d0 <.L17>
     468:	0c012403          	lw	s0,192(sp)
     46c:	00040513          	mv	a0,s0
     470:	194010ef          	jal	1604 <__GI_strlen>
     474:	00050593          	mv	a1,a0
     478:	04051463          	bnez	a0,4c0 <.L18>

0000047c <.L60>:
     47c:	fff00493          	li	s1,-1

00000480 <.L16>:
     480:	1dc12083          	lw	ra,476(sp)
     484:	1d812403          	lw	s0,472(sp)
     488:	1d012903          	lw	s2,464(sp)
     48c:	1cc12983          	lw	s3,460(sp)
     490:	1c812a03          	lw	s4,456(sp)
     494:	1c412a83          	lw	s5,452(sp)
     498:	1c012b03          	lw	s6,448(sp)
     49c:	1bc12b83          	lw	s7,444(sp)
     4a0:	1b812c03          	lw	s8,440(sp)
     4a4:	1b412c83          	lw	s9,436(sp)
     4a8:	1b012d03          	lw	s10,432(sp)
     4ac:	1ac12d83          	lw	s11,428(sp)
     4b0:	00048513          	mv	a0,s1
     4b4:	1d412483          	lw	s1,468(sp)
     4b8:	1e010113          	add	sp,sp,480
     4bc:	00008067          	ret

000004c0 <.L18>:
     4c0:	00412603          	lw	a2,4(sp)
     4c4:	00040513          	mv	a0,s0
     4c8:	119010ef          	jal	1de0 <__stdio_fwrite>
     4cc:	fb1ff06f          	j	47c <.L60>

000004d0 <.L17>:
     4d0:	00048593          	mv	a1,s1
     4d4:	000a0513          	mv	a0,s4
     4d8:	61c000ef          	jal	af4 <_ppfs_prepargs>
     4dc:	40000ab7          	lui	s5,0x40000
     4e0:	10000b37          	lui	s6,0x10000
     4e4:	00040513          	mv	a0,s0
     4e8:	00000493          	li	s1,0
     4ec:	11010b93          	add	s7,sp,272
     4f0:	00007c17          	auipc	s8,0x7
     4f4:	d50c0c13          	add	s8,s8,-688 # 7240 <prefix.0>
     4f8:	fffa8a93          	add	s5,s5,-1 # 3fffffff <_ebss+0x3fff245f>
     4fc:	fffb0b13          	add	s6,s6,-1 # fffffff <_ebss+0xfff245f>

00000500 <.L21>:
     500:	00044783          	lbu	a5,0(s0)
     504:	44078663          	beqz	a5,950 <.L22>
     508:	02500713          	li	a4,37
     50c:	00e79663          	bne	a5,a4,518 <.L23>
     510:	46a40463          	beq	s0,a0,978 <.L70>
     514:	4400006f          	j	954 <.L69>

00000518 <.L23>:
     518:	00140413          	add	s0,s0,1
     51c:	fe5ff06f          	j	500 <.L21>

00000520 <.L30>:
     520:	00a6a023          	sw	a0,0(a3)
     524:	00170713          	add	a4,a4,1
     528:	00468693          	add	a3,a3,4
     52c:	4a00006f          	j	9cc <.L29>

00000530 <.L31>:
     530:	00700713          	li	a4,7
     534:	28f76663          	bltu	a4,a5,7c0 <.L33>
     538:	00008717          	auipc	a4,0x8
     53c:	f0070713          	add	a4,a4,-256 # 8438 <spec_base.1>
     540:	00f70733          	add	a4,a4,a5
     544:	fff74683          	lbu	a3,-1(a4)
     548:	00a00613          	li	a2,10
     54c:	05700713          	li	a4,87
     550:	02c69263          	bne	a3,a2,574 <.L34>
     554:	0d012603          	lw	a2,208(sp)
     558:	02c00713          	li	a4,44
     55c:	02067513          	and	a0,a2,32
     560:	00051463          	bnez	a0,568 <.L35>
     564:	05700713          	li	a4,87

00000568 <.L35>:
     568:	04067613          	and	a2,a2,64
     56c:	00060463          	beqz	a2,574 <.L34>
     570:	08076713          	or	a4,a4,128

00000574 <.L34>:
     574:	00500613          	li	a2,5
     578:	10f66663          	bltu	a2,a5,684 <.L36>
     57c:	00300613          	li	a2,3
     580:	10c78663          	beq	a5,a2,68c <.L74>
     584:	00100613          	li	a2,1
     588:	00600d93          	li	s11,6
     58c:	00c78463          	beq	a5,a2,594 <.L37>

00000590 <.L106>:
     590:	00b00d93          	li	s11,11

00000594 <.L37>:
     594:	0c412603          	lw	a2,196(sp)
     598:	02000913          	li	s2,32
     59c:	00065463          	bgez	a2,5a4 <.L38>
     5a0:	0d414903          	lbu	s2,212(sp)

000005a4 <.L38>:
     5a4:	00100613          	li	a2,1
     5a8:	40000513          	li	a0,1024
     5ac:	02c78463          	beq	a5,a2,5d4 <.L39>
     5b0:	015585b3          	add	a1,a1,s5
     5b4:	00259593          	sll	a1,a1,0x2
     5b8:	19058793          	add	a5,a1,400
     5bc:	01010613          	add	a2,sp,16
     5c0:	00c785b3          	add	a1,a5,a2
     5c4:	f485a503          	lw	a0,-184(a1)
     5c8:	000017b7          	lui	a5,0x1
     5cc:	f0078793          	add	a5,a5,-256 # f00 <.L21+0x18>
     5d0:	00f57533          	and	a0,a0,a5

000005d4 <.L39>:
     5d4:	02c12583          	lw	a1,44(sp)
     5d8:	00068613          	mv	a2,a3
     5dc:	00e12623          	sw	a4,12(sp)
     5e0:	00d12423          	sw	a3,8(sp)
     5e4:	221010ef          	jal	2004 <_load_inttype>
     5e8:	00c12703          	lw	a4,12(sp)
     5ec:	00812683          	lw	a3,8(sp)
     5f0:	0bf10c93          	add	s9,sp,191
     5f4:	00058613          	mv	a2,a1
     5f8:	00050593          	mv	a1,a0
     5fc:	000c8513          	mv	a0,s9
     600:	2bd010ef          	jal	20bc <_uintmaxtostr>
     604:	0e012703          	lw	a4,224(sp)
     608:	00500793          	li	a5,5
     60c:	00050d13          	mv	s10,a0
     610:	02e7f263          	bgeu	a5,a4,634 <.L40>
     614:	00054603          	lbu	a2,0(a0)
     618:	02d00693          	li	a3,45
     61c:	0d012783          	lw	a5,208(sp)
     620:	06d61c63          	bne	a2,a3,698 <.L41>
     624:	0027e793          	or	a5,a5,2
     628:	0cf12823          	sw	a5,208(sp)
     62c:	00150d13          	add	s10,a0,1
     630:	00200d93          	li	s11,2

00000634 <.L40>:
     634:	0c412403          	lw	s0,196(sp)
     638:	41ac8cb3          	sub	s9,s9,s10
     63c:	00045463          	bgez	s0,644 <.L42>
     640:	00100413          	li	s0,1

00000644 <.L42>:
     644:	0d012783          	lw	a5,208(sp)
     648:	000d4683          	lbu	a3,0(s10)
     64c:	0107f793          	and	a5,a5,16
     650:	06078663          	beqz	a5,6bc <.L43>
     654:	00200793          	li	a5,2
     658:	06e7f063          	bgeu	a5,a4,6b8 <.L80>
     65c:	00300793          	li	a5,3
     660:	12f70e63          	beq	a4,a5,79c <.L81>
     664:	00400793          	li	a5,4
     668:	04f71a63          	bne	a4,a5,6bc <.L43>
     66c:	048ce863          	bltu	s9,s0,6bc <.L43>
     670:	03000793          	li	a5,48
     674:	001c8413          	add	s0,s9,1
     678:	06f69263          	bne	a3,a5,6dc <.L45>
     67c:	00100413          	li	s0,1
     680:	0440006f          	j	6c4 <.L44>

00000684 <.L36>:
     684:	40d006b3          	neg	a3,a3
     688:	f09ff06f          	j	590 <.L106>

0000068c <.L74>:
     68c:	00b00d93          	li	s11,11
     690:	03700713          	li	a4,55
     694:	f01ff06f          	j	594 <.L37>

00000698 <.L41>:
     698:	0027f693          	and	a3,a5,2
     69c:	00069a63          	bnez	a3,6b0 <.L78>
     6a0:	0017f793          	and	a5,a5,1
     6a4:	f80788e3          	beqz	a5,634 <.L40>
     6a8:	00400d93          	li	s11,4
     6ac:	f89ff06f          	j	634 <.L40>

000006b0 <.L78>:
     6b0:	00000d93          	li	s11,0
     6b4:	f81ff06f          	j	634 <.L40>

000006b8 <.L80>:
     6b8:	00600d93          	li	s11,6

000006bc <.L43>:
     6bc:	03000793          	li	a5,48
     6c0:	00f69e63          	bne	a3,a5,6dc <.L45>

000006c4 <.L44>:
     6c4:	00500793          	li	a5,5
     6c8:	01b7d463          	bge	a5,s11,6d0 <.L46>
     6cc:	00b00d93          	li	s11,11

000006d0 <.L46>:
     6d0:	00100793          	li	a5,1
     6d4:	0cf70863          	beq	a4,a5,7a4 <.L84>
     6d8:	0e040063          	beqz	s0,7b8 <.L85>

000006dc <.L45>:
     6dc:	0c8cfa63          	bgeu	s9,s0,7b0 <.L86>
     6e0:	41940433          	sub	s0,s0,s9

000006e4 <.L47>:
     6e4:	00b00713          	li	a4,11
     6e8:	019407b3          	add	a5,s0,s9
     6ec:	00ed8a63          	beq	s11,a4,700 <.L62>
     6f0:	00500713          	li	a4,5
     6f4:	01b72733          	slt	a4,a4,s11
     6f8:	00170713          	add	a4,a4,1
     6fc:	00e787b3          	add	a5,a5,a4

00000700 <.L62>:
     700:	0c812703          	lw	a4,200(sp)
     704:	00000993          	li	s3,0
     708:	00e7f463          	bgeu	a5,a4,710 <.L64>
     70c:	40f709b3          	sub	s3,a4,a5

00000710 <.L64>:
     710:	00f487b3          	add	a5,s1,a5
     714:	013784b3          	add	s1,a5,s3
     718:	03000793          	li	a5,48
     71c:	00f91663          	bne	s2,a5,728 <.L65>
     720:	01340433          	add	s0,s0,s3
     724:	00000993          	li	s3,0

00000728 <.L65>:
     728:	0d012783          	lw	a5,208(sp)
     72c:	0087f793          	and	a5,a5,8
     730:	00079e63          	bnez	a5,74c <.L66>
     734:	00412503          	lw	a0,4(sp)
     738:	00098613          	mv	a2,s3
     73c:	02000593          	li	a1,32
     740:	badff0ef          	jal	2ec <_charpad>
     744:	d2a99ce3          	bne	s3,a0,47c <.L60>
     748:	00000993          	li	s3,0

0000074c <.L66>:
     74c:	00412583          	lw	a1,4(sp)
     750:	01bc0533          	add	a0,s8,s11
     754:	269000ef          	jal	11bc <__GI_fputs>
     758:	00412503          	lw	a0,4(sp)
     75c:	00040613          	mv	a2,s0
     760:	03000593          	li	a1,48
     764:	b89ff0ef          	jal	2ec <_charpad>
     768:	d0a41ae3          	bne	s0,a0,47c <.L60>
     76c:	000c8c63          	beqz	s9,784 <.L67>
     770:	00412603          	lw	a2,4(sp)
     774:	000c8593          	mv	a1,s9
     778:	000d0513          	mv	a0,s10
     77c:	664010ef          	jal	1de0 <__stdio_fwrite>
     780:	ceac9ee3          	bne	s9,a0,47c <.L60>

00000784 <.L67>:
     784:	00412503          	lw	a0,4(sp)
     788:	00098613          	mv	a2,s3
     78c:	02000593          	li	a1,32
     790:	b5dff0ef          	jal	2ec <_charpad>
     794:	26a98863          	beq	s3,a0,a04 <.L32>
     798:	ce5ff06f          	j	47c <.L60>

0000079c <.L81>:
     79c:	00900d93          	li	s11,9
     7a0:	f1dff06f          	j	6bc <.L43>

000007a4 <.L84>:
     7a4:	00008d17          	auipc	s10,0x8
     7a8:	c84d0d13          	add	s10,s10,-892 # 8428 <.LC0>
     7ac:	00500c93          	li	s9,5

000007b0 <.L86>:
     7b0:	00000413          	li	s0,0
     7b4:	f31ff06f          	j	6e4 <.L47>

000007b8 <.L85>:
     7b8:	00000c93          	li	s9,0
     7bc:	ff5ff06f          	j	7b0 <.L86>

000007c0 <.L33>:
     7c0:	00f00713          	li	a4,15
     7c4:	08f76063          	bltu	a4,a5,844 <.L48>
     7c8:	0d012703          	lw	a4,208(sp)
     7cc:	02c12783          	lw	a5,44(sp)
     7d0:	01010413          	add	s0,sp,16
     7d4:	01471693          	sll	a3,a4,0x14
     7d8:	0406d463          	bgez	a3,820 <.L49>
     7dc:	0007a603          	lw	a2,0(a5)
     7e0:	0047a683          	lw	a3,4(a5)
     7e4:	0087a703          	lw	a4,8(a5)
     7e8:	00c7a783          	lw	a5,12(a5)

000007ec <.L50>:
     7ec:	00412503          	lw	a0,4(sp)
     7f0:	00c12823          	sw	a2,16(sp)
     7f4:	00d12a23          	sw	a3,20(sp)
     7f8:	0c410613          	add	a2,sp,196
     7fc:	00000697          	auipc	a3,0x0
     800:	b6068693          	add	a3,a3,-1184 # 35c <_fp_out_narrow>
     804:	00040593          	mv	a1,s0
     808:	00e12c23          	sw	a4,24(sp)
     80c:	00f12e23          	sw	a5,28(sp)
     810:	16d010ef          	jal	217c <_fpmaxtostr>

00000814 <.L108>:
     814:	c60544e3          	bltz	a0,47c <.L60>
     818:	00a484b3          	add	s1,s1,a0
     81c:	1e80006f          	j	a04 <.L32>

00000820 <.L49>:
     820:	0047a603          	lw	a2,4(a5)
     824:	0007a583          	lw	a1,0(a5)
     828:	00040513          	mv	a0,s0
     82c:	250060ef          	jal	6a7c <__extenddftf2>
     830:	01012603          	lw	a2,16(sp)
     834:	01412683          	lw	a3,20(sp)
     838:	01812703          	lw	a4,24(sp)
     83c:	01c12783          	lw	a5,28(sp)
     840:	fadff06f          	j	7ec <.L50>

00000844 <.L48>:
     844:	01100713          	li	a4,17
     848:	c2f77ae3          	bgeu	a4,a5,47c <.L60>
     84c:	01300713          	li	a4,19
     850:	08f76463          	bltu	a4,a5,8d8 <.L52>
     854:	02c12683          	lw	a3,44(sp)
     858:	0006a403          	lw	s0,0(a3)
     85c:	04e79e63          	bne	a5,a4,8b8 <.L53>
     860:	0c412703          	lw	a4,196(sp)
     864:	02040863          	beqz	s0,894 <.L54>
     868:	00040d13          	mv	s10,s0

0000086c <.L55>:
     86c:	0c412783          	lw	a5,196(sp)
     870:	fff00593          	li	a1,-1
     874:	0007c463          	bltz	a5,87c <.L56>
     878:	00078593          	mv	a1,a5

0000087c <.L56>:
     87c:	000d0513          	mv	a0,s10
     880:	619000ef          	jal	1698 <__GI_strnlen>
     884:	00050c93          	mv	s9,a0
     888:	02000913          	li	s2,32
     88c:	00b00d93          	li	s11,11
     890:	f21ff06f          	j	7b0 <.L86>

00000894 <.L54>:
     894:	00500793          	li	a5,5
     898:	00008d17          	auipc	s10,0x8
     89c:	b98d0d13          	add	s10,s10,-1128 # 8430 <.LC1>
     8a0:	02000913          	li	s2,32
     8a4:	00b00d93          	li	s11,11
     8a8:	00600c93          	li	s9,6
     8ac:	e2e7ece3          	bltu	a5,a4,6e4 <.L47>
     8b0:	00000c93          	li	s9,0
     8b4:	e31ff06f          	j	6e4 <.L47>

000008b8 <.L53>:
     8b8:	04810023          	sb	s0,64(sp)
     8bc:	040100a3          	sb	zero,65(sp)
     8c0:	04010d13          	add	s10,sp,64
     8c4:	02000913          	li	s2,32
     8c8:	00b00d93          	li	s11,11
     8cc:	00000413          	li	s0,0
     8d0:	00100c93          	li	s9,1
     8d4:	e11ff06f          	j	6e4 <.L47>

000008d8 <.L52>:
     8d8:	01400713          	li	a4,20
     8dc:	02e79263          	bne	a5,a4,900 <.L57>
     8e0:	00007797          	auipc	a5,0x7
     8e4:	8f47a783          	lw	a5,-1804(a5) # 71d4 <_GLOBAL_OFFSET_TABLE_+0xc>
     8e8:	0007a503          	lw	a0,0(a5)
     8ec:	08000613          	li	a2,128
     8f0:	04010593          	add	a1,sp,64
     8f4:	661000ef          	jal	1754 <__GI___glibc_strerror_r>
     8f8:	00050d13          	mv	s10,a0
     8fc:	f71ff06f          	j	86c <.L55>

00000900 <.L57>:
     900:	0cc12583          	lw	a1,204(sp)
     904:	00008717          	auipc	a4,0x8
     908:	c4872703          	lw	a4,-952(a4) # 854c <_custom_printf_spec>
     90c:	00a70693          	add	a3,a4,10
     910:	00070793          	mv	a5,a4

00000914 <.L61>:
     914:	0007c503          	lbu	a0,0(a5)
     918:	02b51663          	bne	a0,a1,944 <.L58>
     91c:	40e787b3          	sub	a5,a5,a4
     920:	00279793          	sll	a5,a5,0x2
     924:	0000d717          	auipc	a4,0xd
     928:	24070713          	add	a4,a4,576 # db64 <_custom_printf_handler>
     92c:	00f707b3          	add	a5,a4,a5
     930:	0007a783          	lw	a5,0(a5)
     934:	00412503          	lw	a0,4(sp)
     938:	0c410593          	add	a1,sp,196
     93c:	000780e7          	jalr	a5
     940:	ed5ff06f          	j	814 <.L108>

00000944 <.L58>:
     944:	00178793          	add	a5,a5,1
     948:	fcd796e3          	bne	a5,a3,914 <.L61>
     94c:	b31ff06f          	j	47c <.L60>

00000950 <.L22>:
     950:	b2a408e3          	beq	s0,a0,480 <.L16>

00000954 <.L69>:
     954:	40a409b3          	sub	s3,s0,a0
     958:	b33052e3          	blez	s3,47c <.L60>
     95c:	00412603          	lw	a2,4(sp)
     960:	00098593          	mv	a1,s3
     964:	47c010ef          	jal	1de0 <__stdio_fwrite>
     968:	b0a99ae3          	bne	s3,a0,47c <.L60>
     96c:	00044783          	lbu	a5,0(s0)
     970:	013484b3          	add	s1,s1,s3
     974:	b00786e3          	beqz	a5,480 <.L16>

00000978 <.L70>:
     978:	00144703          	lbu	a4,1(s0)
     97c:	02500793          	li	a5,37
     980:	00140513          	add	a0,s0,1
     984:	00240413          	add	s0,s0,2
     988:	b6f70ce3          	beq	a4,a5,500 <.L21>
     98c:	0ca12023          	sw	a0,192(sp)
     990:	000a0513          	mv	a0,s4
     994:	360000ef          	jal	cf4 <_ppfs_parsespec>
     998:	000a0513          	mv	a0,s4
     99c:	1a4000ef          	jal	b40 <_ppfs_setargs>
     9a0:	0d812703          	lw	a4,216(sp)
     9a4:	0e614583          	lbu	a1,230(sp)
     9a8:	000b8793          	mv	a5,s7
     9ac:	00e05863          	blez	a4,9bc <.L28>
     9b0:	016587b3          	add	a5,a1,s6
     9b4:	00479793          	sll	a5,a5,0x4
     9b8:	00fb87b3          	add	a5,s7,a5

000009bc <.L28>:
     9bc:	0dc12803          	lw	a6,220(sp)
     9c0:	02c10693          	add	a3,sp,44
     9c4:	00000713          	li	a4,0
     9c8:	00068613          	mv	a2,a3

000009cc <.L29>:
     9cc:	00471513          	sll	a0,a4,0x4
     9d0:	00a78533          	add	a0,a5,a0
     9d4:	b50746e3          	blt	a4,a6,520 <.L30>
     9d8:	0e012783          	lw	a5,224(sp)
     9dc:	b4079ae3          	bnez	a5,530 <.L31>
     9e0:	0d012583          	lw	a1,208(sp)
     9e4:	000017b7          	lui	a5,0x1
     9e8:	f0078793          	add	a5,a5,-256 # f00 <.L21+0x18>
     9ec:	00f5f5b3          	and	a1,a1,a5
     9f0:	02c12783          	lw	a5,44(sp)
     9f4:	00048613          	mv	a2,s1
     9f8:	41f4d693          	sra	a3,s1,0x1f
     9fc:	0007a503          	lw	a0,0(a5)
     a00:	680010ef          	jal	2080 <_store_inttype>

00000a04 <.L32>:
     a04:	0c012403          	lw	s0,192(sp)
     a08:	00040513          	mv	a0,s0
     a0c:	af5ff06f          	j	500 <.L21>

00000a10 <_ppfs_init>:
     a10:	fe010113          	add	sp,sp,-32
     a14:	00912a23          	sw	s1,20(sp)
     a18:	0e000613          	li	a2,224
     a1c:	00058493          	mv	s1,a1
     a20:	00000593          	li	a1,0
     a24:	00812c23          	sw	s0,24(sp)
     a28:	01212823          	sw	s2,16(sp)
     a2c:	00050413          	mv	s0,a0
     a30:	00112e23          	sw	ra,28(sp)
     a34:	01312623          	sw	s3,12(sp)
     a38:	329000ef          	jal	1560 <__GI_memset>
     a3c:	01842783          	lw	a5,24(s0)
     a40:	02840913          	add	s2,s0,40
     a44:	00942023          	sw	s1,0(s0)
     a48:	fff78793          	add	a5,a5,-1
     a4c:	00f42c23          	sw	a5,24(s0)
     a50:	04c40713          	add	a4,s0,76
     a54:	00090793          	mv	a5,s2
     a58:	00800693          	li	a3,8

00000a5c <.L2>:
     a5c:	00478793          	add	a5,a5,4
     a60:	fed7ae23          	sw	a3,-4(a5)
     a64:	fef71ce3          	bne	a4,a5,a5c <.L2>
     a68:	00048793          	mv	a5,s1
     a6c:	02500993          	li	s3,37

00000a70 <.L3>:
     a70:	0007c703          	lbu	a4,0(a5)
     a74:	02071063          	bnez	a4,a94 <.L8>
     a78:	01842783          	lw	a5,24(s0)
     a7c:	00942023          	sw	s1,0(s0)
     a80:	00800713          	li	a4,8

00000a84 <.L9>:
     a84:	fff78793          	add	a5,a5,-1
     a88:	0407de63          	bgez	a5,ae4 <.L11>
     a8c:	00000513          	li	a0,0
     a90:	0280006f          	j	ab8 <.L1>

00000a94 <.L8>:
     a94:	0017c683          	lbu	a3,1(a5)
     a98:	05371263          	bne	a4,s3,adc <.L4>
     a9c:	00178793          	add	a5,a5,1
     aa0:	03368e63          	beq	a3,s3,adc <.L4>
     aa4:	00f42023          	sw	a5,0(s0)
     aa8:	00040513          	mv	a0,s0
     aac:	248000ef          	jal	cf4 <_ppfs_parsespec>
     ab0:	02055263          	bgez	a0,ad4 <.L5>

00000ab4 <.L10>:
     ab4:	fff00513          	li	a0,-1

00000ab8 <.L1>:
     ab8:	01c12083          	lw	ra,28(sp)
     abc:	01812403          	lw	s0,24(sp)
     ac0:	01412483          	lw	s1,20(sp)
     ac4:	01012903          	lw	s2,16(sp)
     ac8:	00c12983          	lw	s3,12(sp)
     acc:	02010113          	add	sp,sp,32
     ad0:	00008067          	ret

00000ad4 <.L5>:
     ad4:	00042783          	lw	a5,0(s0)
     ad8:	f99ff06f          	j	a70 <.L3>

00000adc <.L4>:
     adc:	00178793          	add	a5,a5,1
     ae0:	f91ff06f          	j	a70 <.L3>

00000ae4 <.L11>:
     ae4:	00092683          	lw	a3,0(s2)
     ae8:	fce686e3          	beq	a3,a4,ab4 <.L10>
     aec:	00490913          	add	s2,s2,4
     af0:	f95ff06f          	j	a84 <.L9>

00000af4 <_ppfs_prepargs>:
     af4:	ff010113          	add	sp,sp,-16
     af8:	00912223          	sw	s1,4(sp)
     afc:	01852483          	lw	s1,24(a0)
     b00:	00112623          	sw	ra,12(sp)
     b04:	00812423          	sw	s0,8(sp)
     b08:	04b52623          	sw	a1,76(a0)
     b0c:	02905063          	blez	s1,b2c <.L1>
     b10:	00050413          	mv	s0,a0
     b14:	00952e23          	sw	s1,28(a0)
     b18:	00052c23          	sw	zero,24(a0)
     b1c:	00052223          	sw	zero,4(a0)
     b20:	00052423          	sw	zero,8(a0)
     b24:	01c000ef          	jal	b40 <_ppfs_setargs>
     b28:	00942c23          	sw	s1,24(s0)

00000b2c <.L1>:
     b2c:	00c12083          	lw	ra,12(sp)
     b30:	00812403          	lw	s0,8(sp)
     b34:	00412483          	lw	s1,4(sp)
     b38:	01010113          	add	sp,sp,16
     b3c:	00008067          	ret

00000b40 <_ppfs_setargs>:
     b40:	01852603          	lw	a2,24(a0)
     b44:	00852783          	lw	a5,8(a0)
     b48:	00452683          	lw	a3,4(a0)
     b4c:	05050713          	add	a4,a0,80
     b50:	12061c63          	bnez	a2,c88 <.L2>
     b54:	800005b7          	lui	a1,0x80000
     b58:	00b79e63          	bne	a5,a1,b74 <.L3>
     b5c:	04c52783          	lw	a5,76(a0)
     b60:	00478593          	add	a1,a5,4
     b64:	0007a783          	lw	a5,0(a5)
     b68:	04b52623          	sw	a1,76(a0)
     b6c:	04f52823          	sw	a5,80(a0)
     b70:	00f52423          	sw	a5,8(a0)

00000b74 <.L3>:
     b74:	800007b7          	lui	a5,0x80000
     b78:	00f69e63          	bne	a3,a5,b94 <.L4>
     b7c:	04c52783          	lw	a5,76(a0)
     b80:	00478693          	add	a3,a5,4 # 80000004 <_ebss+0x7fff2464>
     b84:	0007a783          	lw	a5,0(a5)
     b88:	04d52623          	sw	a3,76(a0)
     b8c:	04f52823          	sw	a5,80(a0)
     b90:	00f52223          	sw	a5,4(a0)

00000b94 <.L4>:
     b94:	01c52f03          	lw	t5,28(a0)
     b98:	00001837          	lui	a6,0x1
     b9c:	000018b7          	lui	a7,0x1
     ba0:	02850593          	add	a1,a0,40
     ba4:	00800e13          	li	t3,8
     ba8:	80080813          	add	a6,a6,-2048 # 800 <.L50+0x14>
     bac:	80788893          	add	a7,a7,-2041 # 807 <.L50+0x1b>
     bb0:	00200e93          	li	t4,2
     bb4:	00700f93          	li	t6,7

00000bb8 <.L5>:
     bb8:	03e64863          	blt	a2,t5,be8 <.L17>

00000bbc <.L18>:
     bbc:	00852783          	lw	a5,8(a0)
     bc0:	0207d263          	bgez	a5,be4 <.L1>
     bc4:	40f007b3          	neg	a5,a5
     bc8:	00f52423          	sw	a5,8(a0)
     bcc:	01052783          	lw	a5,16(a0)
     bd0:	ffe7f793          	and	a5,a5,-2
     bd4:	0087e793          	or	a5,a5,8
     bd8:	00f52823          	sw	a5,16(a0)
     bdc:	02000793          	li	a5,32
     be0:	00f52a23          	sw	a5,20(a0)

00000be4 <.L1>:
     be4:	00008067          	ret

00000be8 <.L17>:
     be8:	0005a683          	lw	a3,0(a1) # 80000000 <_ebss+0x7fff2460>
     bec:	00160613          	add	a2,a2,1
     bf0:	05c68863          	beq	a3,t3,c40 <.L6>
     bf4:	04c52783          	lw	a5,76(a0)
     bf8:	04de4863          	blt	t3,a3,c48 <.L7>
     bfc:	01d68463          	beq	a3,t4,c04 <.L10>
     c00:	00decc63          	blt	t4,a3,c18 <.L9>

00000c04 <.L10>:
     c04:	00478693          	add	a3,a5,4
     c08:	04d52623          	sw	a3,76(a0)
     c0c:	0007a783          	lw	a5,0(a5)
     c10:	00f72023          	sw	a5,0(a4)
     c14:	0280006f          	j	c3c <.L16>

00000c18 <.L9>:
     c18:	fff696e3          	bne	a3,t6,c04 <.L10>

00000c1c <.L12>:
     c1c:	00778793          	add	a5,a5,7
     c20:	ff87f793          	and	a5,a5,-8
     c24:	00878693          	add	a3,a5,8
     c28:	04d52623          	sw	a3,76(a0)
     c2c:	0007a303          	lw	t1,0(a5)
     c30:	0047a383          	lw	t2,4(a5)
     c34:	00672023          	sw	t1,0(a4)
     c38:	00772223          	sw	t2,4(a4)

00000c3c <.L16>:
     c3c:	01070713          	add	a4,a4,16

00000c40 <.L6>:
     c40:	00458593          	add	a1,a1,4
     c44:	f75ff06f          	j	bb8 <.L5>

00000c48 <.L7>:
     c48:	80068313          	add	t1,a3,-2048
     c4c:	fc0308e3          	beqz	t1,c1c <.L12>
     c50:	fad85ae3          	bge	a6,a3,c04 <.L10>
     c54:	fb1698e3          	bne	a3,a7,c04 <.L10>
     c58:	00478693          	add	a3,a5,4
     c5c:	04d52623          	sw	a3,76(a0)
     c60:	0007a783          	lw	a5,0(a5)
     c64:	0007a283          	lw	t0,0(a5)
     c68:	0047a303          	lw	t1,4(a5)
     c6c:	0087a683          	lw	a3,8(a5)
     c70:	00c7a783          	lw	a5,12(a5)
     c74:	00572023          	sw	t0,0(a4)
     c78:	00672223          	sw	t1,4(a4)
     c7c:	00d72423          	sw	a3,8(a4)
     c80:	00f72623          	sw	a5,12(a4)
     c84:	fb9ff06f          	j	c3c <.L16>

00000c88 <.L2>:
     c88:	80000637          	lui	a2,0x80000
     c8c:	00c79c63          	bne	a5,a2,ca4 <.L19>
     c90:	02454783          	lbu	a5,36(a0)
     c94:	00479793          	sll	a5,a5,0x4
     c98:	00f707b3          	add	a5,a4,a5
     c9c:	ff07a783          	lw	a5,-16(a5)
     ca0:	00f52423          	sw	a5,8(a0)

00000ca4 <.L19>:
     ca4:	800007b7          	lui	a5,0x80000
     ca8:	f0f69ae3          	bne	a3,a5,bbc <.L18>
     cac:	02554783          	lbu	a5,37(a0)
     cb0:	00479793          	sll	a5,a5,0x4
     cb4:	00f70733          	add	a4,a4,a5
     cb8:	ff072783          	lw	a5,-16(a4)
     cbc:	00f52223          	sw	a5,4(a0)
     cc0:	efdff06f          	j	bbc <.L18>

00000cc4 <_promoted_size>:
     cc4:	82418793          	add	a5,gp,-2012 # 7264 <type_sizes>
     cc8:	00006717          	auipc	a4,0x6
     ccc:	58470713          	add	a4,a4,1412 # 724c <type_codes>

00000cd0 <.L3>:
     cd0:	ffe79683          	lh	a3,-2(a5) # 7ffffffe <_ebss+0x7fff245e>
     cd4:	ffe78793          	add	a5,a5,-2
     cd8:	00a68463          	beq	a3,a0,ce0 <.L2>
     cdc:	fee79ae3          	bne	a5,a4,cd0 <.L3>

00000ce0 <.L2>:
     ce0:	40e787b3          	sub	a5,a5,a4
     ce4:	4017d793          	sra	a5,a5,0x1
     ce8:	00f70733          	add	a4,a4,a5
     cec:	01874503          	lbu	a0,24(a4)
     cf0:	00008067          	ret

00000cf4 <_ppfs_parsespec>:
     cf4:	f9010113          	add	sp,sp,-112
     cf8:	00800793          	li	a5,8
     cfc:	0cccd337          	lui	t1,0xcccd
     d00:	0cccde37          	lui	t3,0xcccd
     d04:	80000837          	lui	a6,0x80000
     d08:	00052683          	lw	a3,0(a0)
     d0c:	06812423          	sw	s0,104(sp)
     d10:	07212023          	sw	s2,96(sp)
     d14:	05312e23          	sw	s3,92(sp)
     d18:	05412c23          	sw	s4,88(sp)
     d1c:	01852983          	lw	s3,24(a0)
     d20:	05512a23          	sw	s5,84(sp)
     d24:	05612823          	sw	s6,80(sp)
     d28:	00050413          	mv	s0,a0
     d2c:	06112623          	sw	ra,108(sp)
     d30:	06912223          	sw	s1,100(sp)
     d34:	05712623          	sw	s7,76(sp)
     d38:	05812423          	sw	s8,72(sp)
     d3c:	05912223          	sw	s9,68(sp)
     d40:	05a12023          	sw	s10,64(sp)
     d44:	03b12e23          	sw	s11,60(sp)
     d48:	00012423          	sw	zero,8(sp)
     d4c:	00012623          	sw	zero,12(sp)
     d50:	00f12a23          	sw	a5,20(sp)
     d54:	00f12c23          	sw	a5,24(sp)
     d58:	00008297          	auipc	t0,0x8
     d5c:	8042a283          	lw	t0,-2044(t0) # 855c <__GI___ctype_b>
     d60:	00000513          	li	a0,0
     d64:	00000613          	li	a2,0
     d68:	00000893          	li	a7,0
     d6c:	02a00e93          	li	t4,42
     d70:	ccb30313          	add	t1,t1,-821 # ccccccb <_ebss+0xccbf12b>
     d74:	00a00393          	li	t2,10
     d78:	ccce0e13          	add	t3,t3,-820 # ccccccc <_ebss+0xccbf12c>
     d7c:	fff80813          	add	a6,a6,-1 # 7fffffff <_ebss+0x7fff245f>
     d80:	03700913          	li	s2,55
     d84:	02500f13          	li	t5,37
     d88:	02e00a13          	li	s4,46
     d8c:	02400f93          	li	t6,36
     d90:	03000a93          	li	s5,48
     d94:	06d00b13          	li	s6,109

00000d98 <.L6>:
     d98:	0006c783          	lbu	a5,0(a3)
     d9c:	00068713          	mv	a4,a3
     da0:	01d79c63          	bne	a5,t4,db8 <.L7>
     da4:	03010713          	add	a4,sp,48
     da8:	00251793          	sll	a5,a0,0x2
     dac:	40f707b3          	sub	a5,a4,a5
     db0:	fe07a223          	sw	zero,-28(a5)
     db4:	00168713          	add	a4,a3,1

00000db8 <.L7>:
     db8:	00000793          	li	a5,0

00000dbc <.L8>:
     dbc:	00074583          	lbu	a1,0(a4)
     dc0:	00159493          	sll	s1,a1,0x1
     dc4:	009284b3          	add	s1,t0,s1
     dc8:	0004d483          	lhu	s1,0(s1)
     dcc:	0084f493          	and	s1,s1,8
     dd0:	04049e63          	bnez	s1,e2c <.L11>
     dd4:	fff6c483          	lbu	s1,-1(a3)
     dd8:	0be49e63          	bne	s1,t5,e94 <.L12>
     ddc:	0bf59863          	bne	a1,t6,e8c <.L13>
     de0:	3cf05263          	blez	a5,11a4 <.L14>
     de4:	00170693          	add	a3,a4,1
     de8:	06099663          	bnez	s3,e54 <.L15>

00000dec <.L20>:
     dec:	fff00513          	li	a0,-1

00000df0 <.L5>:
     df0:	06c12083          	lw	ra,108(sp)
     df4:	06812403          	lw	s0,104(sp)
     df8:	06412483          	lw	s1,100(sp)
     dfc:	06012903          	lw	s2,96(sp)
     e00:	05c12983          	lw	s3,92(sp)
     e04:	05812a03          	lw	s4,88(sp)
     e08:	05412a83          	lw	s5,84(sp)
     e0c:	05012b03          	lw	s6,80(sp)
     e10:	04c12b83          	lw	s7,76(sp)
     e14:	04812c03          	lw	s8,72(sp)
     e18:	04412c83          	lw	s9,68(sp)
     e1c:	04012d03          	lw	s10,64(sp)
     e20:	03c12d83          	lw	s11,60(sp)
     e24:	07010113          	add	sp,sp,112
     e28:	00008067          	ret

00000e2c <.L11>:
     e2c:	00f35663          	bge	t1,a5,e38 <.L9>
     e30:	01c79e63          	bne	a5,t3,e4c <.L53>
     e34:	00b96c63          	bltu	s2,a1,e4c <.L53>

00000e38 <.L9>:
     e38:	027787b3          	mul	a5,a5,t2
     e3c:	fd058593          	add	a1,a1,-48
     e40:	00f587b3          	add	a5,a1,a5

00000e44 <.L10>:
     e44:	00170713          	add	a4,a4,1
     e48:	f75ff06f          	j	dbc <.L8>

00000e4c <.L53>:
     e4c:	00080793          	mv	a5,a6
     e50:	ff5ff06f          	j	e44 <.L10>

00000e54 <.L15>:
     e54:	00f12823          	sw	a5,16(sp)
     e58:	00f9d463          	bge	s3,a5,e60 <.L18>
     e5c:	00078993          	mv	s3,a5

00000e60 <.L18>:
     e60:	00068713          	mv	a4,a3

00000e64 <.L22>:
     e64:	00074483          	lbu	s1,0(a4)
     e68:	00100793          	li	a5,1
     e6c:	00007697          	auipc	a3,0x7
     e70:	5ec68693          	add	a3,a3,1516 # 8458 <spec_flags.5>

00000e74 <.L23>:
     e74:	0006c583          	lbu	a1,0(a3)
     e78:	00168693          	add	a3,a3,1
     e7c:	06959663          	bne	a1,s1,ee8 <.L21>
     e80:	00170713          	add	a4,a4,1
     e84:	00f66633          	or	a2,a2,a5
     e88:	fddff06f          	j	e64 <.L22>

00000e8c <.L13>:
     e8c:	31305e63          	blez	s3,11a8 <.L19>
     e90:	f5659ee3          	bne	a1,s6,dec <.L20>

00000e94 <.L12>:
     e94:	0006c583          	lbu	a1,0(a3)
     e98:	00070493          	mv	s1,a4
     e9c:	03d59663          	bne	a1,t4,ec8 <.L25>
     ea0:	06098a63          	beqz	s3,f14 <.L26>
     ea4:	00170493          	add	s1,a4,1
     ea8:	00074703          	lbu	a4,0(a4)
     eac:	f5f710e3          	bne	a4,t6,dec <.L20>
     eb0:	f2f05ee3          	blez	a5,dec <.L20>
     eb4:	00251713          	sll	a4,a0,0x2
     eb8:	03010693          	add	a3,sp,48
     ebc:	40e68733          	sub	a4,a3,a4
     ec0:	fcf72c23          	sw	a5,-40(a4)

00000ec4 <.L72>:
     ec4:	800007b7          	lui	a5,0x80000

00000ec8 <.L25>:
     ec8:	0004c583          	lbu	a1,0(s1)
     ecc:	04051e63          	bnez	a0,f28 <.L27>
     ed0:	05459863          	bne	a1,s4,f20 <.L57>
     ed4:	00148713          	add	a4,s1,1
     ed8:	00078893          	mv	a7,a5
     edc:	fff00513          	li	a0,-1

00000ee0 <.L24>:
     ee0:	00070693          	mv	a3,a4
     ee4:	eb5ff06f          	j	d98 <.L6>

00000ee8 <.L21>:
     ee8:	0006c583          	lbu	a1,0(a3)
     eec:	00179793          	sll	a5,a5,0x1
     ef0:	f80592e3          	bnez	a1,e74 <.L23>
     ef4:	40165793          	sra	a5,a2,0x1
     ef8:	0057f793          	and	a5,a5,5
     efc:	fff7c793          	not	a5,a5
     f00:	00f67633          	and	a2,a2,a5
     f04:	fff74783          	lbu	a5,-1(a4)
     f08:	fde79ce3          	bne	a5,t5,ee0 <.L24>
     f0c:	00000793          	li	a5,0
     f10:	f85ff06f          	j	e94 <.L12>

00000f14 <.L26>:
     f14:	00168493          	add	s1,a3,1
     f18:	fa9706e3          	beq	a4,s1,ec4 <.L72>
     f1c:	ed1ff06f          	j	dec <.L20>

00000f20 <.L57>:
     f20:	00078893          	mv	a7,a5
     f24:	fff00793          	li	a5,-1

00000f28 <.L27>:
     f28:	83018713          	add	a4,gp,-2000 # 7270 <qual_chars.4>
     f2c:	00070693          	mv	a3,a4

00000f30 <.L30>:
     f30:	00074503          	lbu	a0,0(a4)
     f34:	1ab51863          	bne	a0,a1,10e4 <.L28>
     f38:	00148493          	add	s1,s1,1

00000f3c <.L29>:
     f3c:	40d706b3          	sub	a3,a4,a3
     f40:	00100513          	li	a0,1
     f44:	0004c583          	lbu	a1,0(s1)
     f48:	00d54a63          	blt	a0,a3,f5c <.L31>
     f4c:	00074683          	lbu	a3,0(a4)
     f50:	00b69663          	bne	a3,a1,f5c <.L31>
     f54:	00970713          	add	a4,a4,9
     f58:	00148493          	add	s1,s1,1

00000f5c <.L31>:
     f5c:	00974683          	lbu	a3,9(a4)
     f60:	0004c583          	lbu	a1,0(s1)
     f64:	00869693          	sll	a3,a3,0x8
     f68:	e80582e3          	beqz	a1,dec <.L20>
     f6c:	00007717          	auipc	a4,0x7
     f70:	4d470713          	add	a4,a4,1236 # 8440 <spec_chars.3>
     f74:	00070813          	mv	a6,a4

00000f78 <.L36>:
     f78:	00074503          	lbu	a0,0(a4)
     f7c:	16b51c63          	bne	a0,a1,10f4 <.L32>
     f80:	41070733          	sub	a4,a4,a6
     f84:	01100593          	li	a1,17
     f88:	00e5d863          	bge	a1,a4,f98 <.L33>
     f8c:	4006f593          	and	a1,a3,1024
     f90:	00058463          	beqz	a1,f98 <.L33>
     f94:	ffe70713          	add	a4,a4,-2

00000f98 <.L33>:
     f98:	84418513          	add	a0,gp,-1980 # 7284 <spec_ranges.2>
     f9c:	02e42023          	sw	a4,32(s0)
     fa0:	00050813          	mv	a6,a0

00000fa4 <.L34>:
     fa4:	00050593          	mv	a1,a0
     fa8:	0005c303          	lbu	t1,0(a1)
     fac:	00150513          	add	a0,a0,1
     fb0:	fee34ae3          	blt	t1,a4,fa4 <.L34>
     fb4:	410585b3          	sub	a1,a1,a6
     fb8:	00006717          	auipc	a4,0x6
     fbc:	29470713          	add	a4,a4,660 # 724c <type_codes>
     fc0:	00159593          	sll	a1,a1,0x1
     fc4:	00b705b3          	add	a1,a4,a1
     fc8:	04459703          	lh	a4,68(a1)
     fcc:	05459583          	lh	a1,84(a1)
     fd0:	00d76733          	or	a4,a4,a3
     fd4:	00b77733          	and	a4,a4,a1
     fd8:	00e12e23          	sw	a4,28(sp)
     fdc:	00007717          	auipc	a4,0x7
     fe0:	46470713          	add	a4,a4,1124 # 8440 <spec_chars.3>

00000fe4 <.L35>:
     fe4:	0004c583          	lbu	a1,0(s1)
     fe8:	00f42223          	sw	a5,4(s0)
     fec:	01142423          	sw	a7,8(s0)
     ff0:	00b42623          	sw	a1,12(s0)
     ff4:	00467793          	and	a5,a2,4
     ff8:	02000593          	li	a1,32
     ffc:	00078463          	beqz	a5,1004 <.L37>
    1000:	03000593          	li	a1,48

00001004 <.L37>:
    1004:	000017b7          	lui	a5,0x1
    1008:	f0078793          	add	a5,a5,-256 # f00 <.L21+0x18>
    100c:	00f6f6b3          	and	a3,a3,a5
    1010:	ffb67613          	and	a2,a2,-5
    1014:	00100793          	li	a5,1
    1018:	00d66633          	or	a2,a2,a3
    101c:	00b42a23          	sw	a1,20(s0)
    1020:	00c42823          	sw	a2,16(s0)
    1024:	00f42e23          	sw	a5,28(s0)
    1028:	00074783          	lbu	a5,0(a4)
    102c:	00079e63          	bnez	a5,1048 <.L40>
    1030:	0004c703          	lbu	a4,0(s1)
    1034:	06d00793          	li	a5,109
    1038:	0cf71663          	bne	a4,a5,1104 <.L39>
    103c:	01400793          	li	a5,20
    1040:	02f42023          	sw	a5,32(s0)
    1044:	00042e23          	sw	zero,28(s0)

00001048 <.L40>:
    1048:	13305e63          	blez	s3,1184 <.L43>
    104c:	01410b93          	add	s7,sp,20
    1050:	00810b13          	add	s6,sp,8
    1054:	00000a13          	li	s4,0
    1058:	00200d13          	li	s10,2
    105c:	00900d93          	li	s11,9
    1060:	00800c93          	li	s9,8

00001064 <.L49>:
    1064:	114d4863          	blt	s10,s4,1174 <.L44>
    1068:	000b2783          	lw	a5,0(s6)
    106c:	01440733          	add	a4,s0,s4
    1070:	02f70223          	sb	a5,36(a4)
    1074:	0ff7f793          	zext.b	a5,a5

00001078 <.L45>:
    1078:	00f9d663          	bge	s3,a5,1084 <.L46>
    107c:	d6fdc8e3          	blt	s11,a5,dec <.L20>
    1080:	00078993          	mv	s3,a5

00001084 <.L46>:
    1084:	000baa83          	lw	s5,0(s7)
    1088:	039a8863          	beq	s5,s9,10b8 <.L47>
    108c:	00279793          	sll	a5,a5,0x2
    1090:	00f40933          	add	s2,s0,a5
    1094:	02492503          	lw	a0,36(s2)
    1098:	01950e63          	beq	a0,s9,10b4 <.L48>
    109c:	01550c63          	beq	a0,s5,10b4 <.L48>
    10a0:	c25ff0ef          	jal	cc4 <_promoted_size>
    10a4:	00050c13          	mv	s8,a0
    10a8:	000a8513          	mv	a0,s5
    10ac:	c19ff0ef          	jal	cc4 <_promoted_size>
    10b0:	01854463          	blt	a0,s8,10b8 <.L47>

000010b4 <.L48>:
    10b4:	03592223          	sw	s5,36(s2)

000010b8 <.L47>:
    10b8:	01c42783          	lw	a5,28(s0)
    10bc:	001a0713          	add	a4,s4,1
    10c0:	004b8b93          	add	s7,s7,4
    10c4:	004b0b13          	add	s6,s6,4
    10c8:	0b47d263          	bge	a5,s4,116c <.L59>

000010cc <.L50>:
    10cc:	01c42503          	lw	a0,28(s0)
    10d0:	00148493          	add	s1,s1,1
    10d4:	01342c23          	sw	s3,24(s0)
    10d8:	00942023          	sw	s1,0(s0)
    10dc:	00250513          	add	a0,a0,2
    10e0:	d11ff06f          	j	df0 <.L5>

000010e4 <.L28>:
    10e4:	00174503          	lbu	a0,1(a4)
    10e8:	00170713          	add	a4,a4,1
    10ec:	e40512e3          	bnez	a0,f30 <.L30>
    10f0:	e4dff06f          	j	f3c <.L29>

000010f4 <.L32>:
    10f4:	00174503          	lbu	a0,1(a4)
    10f8:	00170713          	add	a4,a4,1
    10fc:	e6051ee3          	bnez	a0,f78 <.L36>
    1100:	ee5ff06f          	j	fe4 <.L35>

00001104 <.L39>:
    1104:	01500793          	li	a5,21
    1108:	02f42023          	sw	a5,32(s0)
    110c:	0004c603          	lbu	a2,0(s1)
    1110:	00007717          	auipc	a4,0x7
    1114:	43c72703          	lw	a4,1084(a4) # 854c <_custom_printf_spec>
    1118:	00a70693          	add	a3,a4,10
    111c:	00070793          	mv	a5,a4

00001120 <.L42>:
    1120:	0007c583          	lbu	a1,0(a5)
    1124:	02c59e63          	bne	a1,a2,1160 <.L41>
    1128:	40e787b3          	sub	a5,a5,a4
    112c:	00279793          	sll	a5,a5,0x2
    1130:	0000d717          	auipc	a4,0xd
    1134:	a0c70713          	add	a4,a4,-1524 # db3c <_custom_printf_arginfo>
    1138:	00f707b3          	add	a5,a4,a5
    113c:	0007a783          	lw	a5,0(a5)
    1140:	01c10613          	add	a2,sp,28
    1144:	00500593          	li	a1,5
    1148:	00440513          	add	a0,s0,4
    114c:	000780e7          	jalr	a5
    1150:	00a42e23          	sw	a0,28(s0)
    1154:	00500793          	li	a5,5
    1158:	eea7d8e3          	bge	a5,a0,1048 <.L40>
    115c:	c91ff06f          	j	dec <.L20>

00001160 <.L41>:
    1160:	00178793          	add	a5,a5,1
    1164:	fad79ee3          	bne	a5,a3,1120 <.L42>
    1168:	c85ff06f          	j	dec <.L20>

0000116c <.L59>:
    116c:	00070a13          	mv	s4,a4
    1170:	ef5ff06f          	j	1064 <.L49>

00001174 <.L44>:
    1174:	01012703          	lw	a4,16(sp)
    1178:	ffea0793          	add	a5,s4,-2
    117c:	00e787b3          	add	a5,a5,a4
    1180:	ef9ff06f          	j	1078 <.L45>

00001184 <.L43>:
    1184:	01c42603          	lw	a2,28(s0)
    1188:	00100793          	li	a5,1
    118c:	02f40323          	sb	a5,38(s0)
    1190:	00261613          	sll	a2,a2,0x2
    1194:	01c10593          	add	a1,sp,28
    1198:	02840513          	add	a0,s0,40
    119c:	11c000ef          	jal	12b8 <__GI_memcpy>
    11a0:	f2dff06f          	j	10cc <.L50>

000011a4 <.L14>:
    11a4:	c53044e3          	bgtz	s3,dec <.L20>

000011a8 <.L19>:
    11a8:	0006c583          	lbu	a1,0(a3)
    11ac:	00000993          	li	s3,0
    11b0:	cae6f8e3          	bgeu	a3,a4,e60 <.L18>
    11b4:	cf5590e3          	bne	a1,s5,e94 <.L12>
    11b8:	ca9ff06f          	j	e60 <.L18>

000011bc <__GI_fputs>:
    11bc:	fe010113          	add	sp,sp,-32
    11c0:	00812c23          	sw	s0,24(sp)
    11c4:	00912a23          	sw	s1,20(sp)
    11c8:	00112e23          	sw	ra,28(sp)
    11cc:	00050493          	mv	s1,a0
    11d0:	00b12623          	sw	a1,12(sp)
    11d4:	430000ef          	jal	1604 <__GI_strlen>
    11d8:	00c12683          	lw	a3,12(sp)
    11dc:	00050413          	mv	s0,a0
    11e0:	00050613          	mv	a2,a0
    11e4:	00100593          	li	a1,1
    11e8:	00048513          	mv	a0,s1
    11ec:	020000ef          	jal	120c <__GI_fwrite>
    11f0:	00850463          	beq	a0,s0,11f8 <.L1>
    11f4:	fff00513          	li	a0,-1

000011f8 <.L1>:
    11f8:	01c12083          	lw	ra,28(sp)
    11fc:	01812403          	lw	s0,24(sp)
    1200:	01412483          	lw	s1,20(sp)
    1204:	02010113          	add	sp,sp,32
    1208:	00008067          	ret

0000120c <__GI_fwrite>:
    120c:	0006d783          	lhu	a5,0(a3)
    1210:	fe010113          	add	sp,sp,-32
    1214:	00812c23          	sw	s0,24(sp)
    1218:	00912a23          	sw	s1,20(sp)
    121c:	01212823          	sw	s2,16(sp)
    1220:	01312623          	sw	s3,12(sp)
    1224:	00112e23          	sw	ra,28(sp)
    1228:	0407f793          	and	a5,a5,64
    122c:	00050993          	mv	s3,a0
    1230:	00058493          	mv	s1,a1
    1234:	00060913          	mv	s2,a2
    1238:	00068413          	mv	s0,a3
    123c:	02078463          	beqz	a5,1264 <.L2>

00001240 <.L5>:
    1240:	02049a63          	bnez	s1,1274 <.L3>

00001244 <.L10>:
    1244:	00000513          	li	a0,0

00001248 <.L1>:
    1248:	01c12083          	lw	ra,28(sp)
    124c:	01812403          	lw	s0,24(sp)
    1250:	01412483          	lw	s1,20(sp)
    1254:	01012903          	lw	s2,16(sp)
    1258:	00c12983          	lw	s3,12(sp)
    125c:	02010113          	add	sp,sp,32
    1260:	00008067          	ret

00001264 <.L2>:
    1264:	00068513          	mv	a0,a3
    1268:	4c9000ef          	jal	1f30 <__stdio_trans2w>
    126c:	fc050ae3          	beqz	a0,1240 <.L5>
    1270:	fd5ff06f          	j	1244 <.L10>

00001274 <.L3>:
    1274:	fc0908e3          	beqz	s2,1244 <.L10>
    1278:	0324b7b3          	mulhu	a5,s1,s2
    127c:	00079e63          	bnez	a5,1298 <.L9>
    1280:	032485b3          	mul	a1,s1,s2
    1284:	00040613          	mv	a2,s0
    1288:	00098513          	mv	a0,s3
    128c:	355000ef          	jal	1de0 <__stdio_fwrite>
    1290:	02955533          	divu	a0,a0,s1
    1294:	fb5ff06f          	j	1248 <.L1>

00001298 <.L9>:
    1298:	00045783          	lhu	a5,0(s0)
    129c:	01600713          	li	a4,22
    12a0:	0087e793          	or	a5,a5,8
    12a4:	00f41023          	sh	a5,0(s0)
    12a8:	00006797          	auipc	a5,0x6
    12ac:	f2c7a783          	lw	a5,-212(a5) # 71d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    12b0:	00e7a023          	sw	a4,0(a5)
    12b4:	f91ff06f          	j	1244 <.L10>

000012b8 <__GI_memcpy>:
    12b8:	00f00713          	li	a4,15
    12bc:	00050693          	mv	a3,a0
    12c0:	00058793          	mv	a5,a1
    12c4:	16c77a63          	bgeu	a4,a2,1438 <.L2>
    12c8:	40a007b3          	neg	a5,a0
    12cc:	0037f793          	and	a5,a5,3
    12d0:	40f60633          	sub	a2,a2,a5
    12d4:	00000713          	li	a4,0

000012d8 <.L3>:
    12d8:	04e79463          	bne	a5,a4,1320 <.L4>
    12dc:	00f585b3          	add	a1,a1,a5
    12e0:	00f508b3          	add	a7,a0,a5
    12e4:	0035fe13          	and	t3,a1,3
    12e8:	00088793          	mv	a5,a7
    12ec:	00265713          	srl	a4,a2,0x2
    12f0:	140e1a63          	bnez	t3,1444 <.L5>
    12f4:	00777693          	and	a3,a4,7
    12f8:	fff68693          	add	a3,a3,-1
    12fc:	00600313          	li	t1,6
    1300:	0005a803          	lw	a6,0(a1)
    1304:	0ed36863          	bltu	t1,a3,13f4 <.L6>
    1308:	87018313          	add	t1,gp,-1936 # 72b0 <.L8>
    130c:	00269693          	sll	a3,a3,0x2
    1310:	006686b3          	add	a3,a3,t1
    1314:	0006a683          	lw	a3,0(a3)
    1318:	006686b3          	add	a3,a3,t1
    131c:	00068067          	jr	a3

00001320 <.L4>:
    1320:	00e586b3          	add	a3,a1,a4
    1324:	0006c803          	lbu	a6,0(a3)
    1328:	00e506b3          	add	a3,a0,a4
    132c:	00170713          	add	a4,a4,1
    1330:	01068023          	sb	a6,0(a3)
    1334:	fa5ff06f          	j	12d8 <.L3>

00001338 <.L13>:
    1338:	fe858693          	add	a3,a1,-24
    133c:	fe488793          	add	a5,a7,-28
    1340:	00670713          	add	a4,a4,6

00001344 <.L15>:
    1344:	01c6a303          	lw	t1,28(a3)
    1348:	ff870713          	add	a4,a4,-8
    134c:	0107ae23          	sw	a6,28(a5)
    1350:	02078813          	add	a6,a5,32
    1354:	0c070863          	beqz	a4,1424 <.L23>
    1358:	00080793          	mv	a5,a6
    135c:	02068693          	add	a3,a3,32
    1360:	00030813          	mv	a6,t1
    1364:	0b00006f          	j	1414 <.L22>

00001368 <.L12>:
    1368:	fec58693          	add	a3,a1,-20
    136c:	fe888793          	add	a5,a7,-24
    1370:	00570713          	add	a4,a4,5

00001374 <.L16>:
    1374:	0186a303          	lw	t1,24(a3)
    1378:	0107ac23          	sw	a6,24(a5)
    137c:	00030813          	mv	a6,t1
    1380:	fc5ff06f          	j	1344 <.L15>

00001384 <.L11>:
    1384:	ff058693          	add	a3,a1,-16
    1388:	fec88793          	add	a5,a7,-20
    138c:	00470713          	add	a4,a4,4

00001390 <.L17>:
    1390:	0146a303          	lw	t1,20(a3)
    1394:	0107aa23          	sw	a6,20(a5)
    1398:	00030813          	mv	a6,t1
    139c:	fd9ff06f          	j	1374 <.L16>

000013a0 <.L10>:
    13a0:	ff458693          	add	a3,a1,-12
    13a4:	ff088793          	add	a5,a7,-16
    13a8:	00370713          	add	a4,a4,3

000013ac <.L18>:
    13ac:	0106a303          	lw	t1,16(a3)
    13b0:	0107a823          	sw	a6,16(a5)
    13b4:	00030813          	mv	a6,t1
    13b8:	fd9ff06f          	j	1390 <.L17>

000013bc <.L9>:
    13bc:	ff858693          	add	a3,a1,-8
    13c0:	ff488793          	add	a5,a7,-12
    13c4:	00270713          	add	a4,a4,2

000013c8 <.L19>:
    13c8:	00c6a303          	lw	t1,12(a3)
    13cc:	0107a623          	sw	a6,12(a5)
    13d0:	00030813          	mv	a6,t1
    13d4:	fd9ff06f          	j	13ac <.L18>

000013d8 <.L7>:
    13d8:	ffc58693          	add	a3,a1,-4
    13dc:	ff888793          	add	a5,a7,-8
    13e0:	00170713          	add	a4,a4,1

000013e4 <.L20>:
    13e4:	0086a303          	lw	t1,8(a3)
    13e8:	0107a423          	sw	a6,8(a5)
    13ec:	00030813          	mv	a6,t1
    13f0:	fd9ff06f          	j	13c8 <.L19>

000013f4 <.L6>:
    13f4:	00058693          	mv	a3,a1
    13f8:	ffc88793          	add	a5,a7,-4

000013fc <.L21>:
    13fc:	0046a303          	lw	t1,4(a3)
    1400:	0107a223          	sw	a6,4(a5)
    1404:	00030813          	mv	a6,t1
    1408:	fddff06f          	j	13e4 <.L20>

0000140c <.L14>:
    140c:	00458693          	add	a3,a1,4
    1410:	fff70713          	add	a4,a4,-1

00001414 <.L22>:
    1414:	0006a303          	lw	t1,0(a3)
    1418:	0107a023          	sw	a6,0(a5)
    141c:	00030813          	mv	a6,t1
    1420:	fddff06f          	j	13fc <.L21>

00001424 <.L23>:
    1424:	0267a023          	sw	t1,32(a5)

00001428 <.L24>:
    1428:	ffc67693          	and	a3,a2,-4
    142c:	00b687b3          	add	a5,a3,a1
    1430:	00367613          	and	a2,a2,3
    1434:	011686b3          	add	a3,a3,a7

00001438 <.L2>:
    1438:	00000713          	li	a4,0

0000143c <.L34>:
    143c:	10e61663          	bne	a2,a4,1548 <.L35>
    1440:	00008067          	ret

00001444 <.L5>:
    1444:	ffc5fe93          	and	t4,a1,-4
    1448:	003e1e13          	sll	t3,t3,0x3
    144c:	02000f93          	li	t6,32
    1450:	00377f13          	and	t5,a4,3
    1454:	00200293          	li	t0,2
    1458:	000ea683          	lw	a3,0(t4)
    145c:	004ea803          	lw	a6,4(t4)
    1460:	41cf8fb3          	sub	t6,t6,t3
    1464:	004e8313          	add	t1,t4,4
    1468:	025f0c63          	beq	t5,t0,14a0 <.L25>
    146c:	00300293          	li	t0,3
    1470:	065f0863          	beq	t5,t0,14e0 <.L26>
    1474:	00100293          	li	t0,1
    1478:	085f0a63          	beq	t5,t0,150c <.L27>
    147c:	ffc88793          	add	a5,a7,-4

00001480 <.L31>:
    1480:	00432e83          	lw	t4,4(t1)
    1484:	01f81f33          	sll	t5,a6,t6
    1488:	01c6d6b3          	srl	a3,a3,t3
    148c:	01e6e6b3          	or	a3,a3,t5
    1490:	00d7a223          	sw	a3,4(a5)
    1494:	00080693          	mv	a3,a6
    1498:	000e8813          	mv	a6,t4
    149c:	0500006f          	j	14ec <.L30>

000014a0 <.L25>:
    14a0:	ffce8313          	add	t1,t4,-4
    14a4:	ff488793          	add	a5,a7,-12
    14a8:	00270713          	add	a4,a4,2

000014ac <.L29>:
    14ac:	01c6d6b3          	srl	a3,a3,t3
    14b0:	01f81f33          	sll	t5,a6,t6
    14b4:	01e6e6b3          	or	a3,a3,t5
    14b8:	00c32e83          	lw	t4,12(t1)
    14bc:	ffc70713          	add	a4,a4,-4
    14c0:	00d7a623          	sw	a3,12(a5)
    14c4:	01078693          	add	a3,a5,16
    14c8:	06070663          	beqz	a4,1534 <.L33>
    14cc:	00068793          	mv	a5,a3
    14d0:	01030313          	add	t1,t1,16
    14d4:	00080693          	mv	a3,a6
    14d8:	000e8813          	mv	a6,t4
    14dc:	0380006f          	j	1514 <.L32>

000014e0 <.L26>:
    14e0:	000e8313          	mv	t1,t4
    14e4:	ff888793          	add	a5,a7,-8
    14e8:	00170713          	add	a4,a4,1

000014ec <.L30>:
    14ec:	00832e83          	lw	t4,8(t1)
    14f0:	01f81f33          	sll	t5,a6,t6
    14f4:	01c6d6b3          	srl	a3,a3,t3
    14f8:	01e6e6b3          	or	a3,a3,t5
    14fc:	00d7a423          	sw	a3,8(a5)
    1500:	00080693          	mv	a3,a6
    1504:	000e8813          	mv	a6,t4
    1508:	fa5ff06f          	j	14ac <.L29>

0000150c <.L27>:
    150c:	008e8313          	add	t1,t4,8
    1510:	fff70713          	add	a4,a4,-1

00001514 <.L32>:
    1514:	00032e83          	lw	t4,0(t1)
    1518:	01f81f33          	sll	t5,a6,t6
    151c:	01c6d6b3          	srl	a3,a3,t3
    1520:	01e6e6b3          	or	a3,a3,t5
    1524:	00d7a023          	sw	a3,0(a5)
    1528:	00080693          	mv	a3,a6
    152c:	000e8813          	mv	a6,t4
    1530:	f51ff06f          	j	1480 <.L31>

00001534 <.L33>:
    1534:	01c85833          	srl	a6,a6,t3
    1538:	01fe9eb3          	sll	t4,t4,t6
    153c:	01d86833          	or	a6,a6,t4
    1540:	0107a823          	sw	a6,16(a5)
    1544:	ee5ff06f          	j	1428 <.L24>

00001548 <.L35>:
    1548:	00e785b3          	add	a1,a5,a4
    154c:	0005c803          	lbu	a6,0(a1)
    1550:	00e685b3          	add	a1,a3,a4
    1554:	00170713          	add	a4,a4,1
    1558:	01058023          	sb	a6,0(a1)
    155c:	ee1ff06f          	j	143c <.L34>

00001560 <__GI_memset>:
    1560:	00700713          	li	a4,7
    1564:	00050793          	mv	a5,a0
    1568:	04c77263          	bgeu	a4,a2,15ac <.L2>
    156c:	010106b7          	lui	a3,0x1010
    1570:	0ff5f713          	zext.b	a4,a1
    1574:	10168693          	add	a3,a3,257 # 1010101 <_ebss+0x1002561>
    1578:	02d70733          	mul	a4,a4,a3

0000157c <.L3>:
    157c:	0037f693          	and	a3,a5,3
    1580:	02069c63          	bnez	a3,15b8 <.L4>
    1584:	00c50633          	add	a2,a0,a2
    1588:	40f60633          	sub	a2,a2,a5
    158c:	fe067813          	and	a6,a2,-32
    1590:	00f80833          	add	a6,a6,a5
    1594:	00080693          	mv	a3,a6

00001598 <.L5>:
    1598:	03079663          	bne	a5,a6,15c4 <.L6>
    159c:	01c67813          	and	a6,a2,28
    15a0:	00f807b3          	add	a5,a6,a5

000015a4 <.L7>:
    15a4:	04f69463          	bne	a3,a5,15ec <.L8>
    15a8:	00367613          	and	a2,a2,3

000015ac <.L2>:
    15ac:	00c78633          	add	a2,a5,a2

000015b0 <.L9>:
    15b0:	04c79463          	bne	a5,a2,15f8 <.L10>
    15b4:	00008067          	ret

000015b8 <.L4>:
    15b8:	00b78023          	sb	a1,0(a5)
    15bc:	00178793          	add	a5,a5,1
    15c0:	fbdff06f          	j	157c <.L3>

000015c4 <.L6>:
    15c4:	00e7a023          	sw	a4,0(a5)
    15c8:	00e7a223          	sw	a4,4(a5)
    15cc:	00e7a423          	sw	a4,8(a5)
    15d0:	00e7a623          	sw	a4,12(a5)
    15d4:	00e7a823          	sw	a4,16(a5)
    15d8:	00e7aa23          	sw	a4,20(a5)
    15dc:	00e7ac23          	sw	a4,24(a5)
    15e0:	00e7ae23          	sw	a4,28(a5)
    15e4:	02078793          	add	a5,a5,32
    15e8:	fb1ff06f          	j	1598 <.L5>

000015ec <.L8>:
    15ec:	00e6a023          	sw	a4,0(a3)
    15f0:	00468693          	add	a3,a3,4
    15f4:	fb1ff06f          	j	15a4 <.L7>

000015f8 <.L10>:
    15f8:	00b78023          	sb	a1,0(a5)
    15fc:	00178793          	add	a5,a5,1
    1600:	fb1ff06f          	j	15b0 <.L9>

00001604 <__GI_strlen>:
    1604:	00050793          	mv	a5,a0

00001608 <.L2>:
    1608:	0037f713          	and	a4,a5,3
    160c:	04071263          	bnez	a4,1650 <.L5>
    1610:	feff0637          	lui	a2,0xfeff0
    1614:	808085b7          	lui	a1,0x80808
    1618:	eff60613          	add	a2,a2,-257 # fefefeff <_ebss+0xfefe235f>
    161c:	08058593          	add	a1,a1,128 # 80808080 <_ebss+0x807fa4e0>

00001620 <.L6>:
    1620:	0007a683          	lw	a3,0(a5)
    1624:	00478713          	add	a4,a5,4
    1628:	00c686b3          	add	a3,a3,a2
    162c:	00b6f6b3          	and	a3,a3,a1
    1630:	02068c63          	beqz	a3,1668 <.L7>
    1634:	ffc74683          	lbu	a3,-4(a4)
    1638:	02068063          	beqz	a3,1658 <.L14>
    163c:	ffd74683          	lbu	a3,-3(a4)
    1640:	02069863          	bnez	a3,1670 <.L9>
    1644:	40a787b3          	sub	a5,a5,a0
    1648:	00178513          	add	a0,a5,1
    164c:	00008067          	ret

00001650 <.L5>:
    1650:	0007c703          	lbu	a4,0(a5)
    1654:	00071663          	bnez	a4,1660 <.L3>

00001658 <.L14>:
    1658:	40a78533          	sub	a0,a5,a0
    165c:	00008067          	ret

00001660 <.L3>:
    1660:	00178793          	add	a5,a5,1
    1664:	fa5ff06f          	j	1608 <.L2>

00001668 <.L7>:
    1668:	00070793          	mv	a5,a4
    166c:	fb5ff06f          	j	1620 <.L6>

00001670 <.L9>:
    1670:	ffe74683          	lbu	a3,-2(a4)
    1674:	00069863          	bnez	a3,1684 <.L10>
    1678:	40a787b3          	sub	a5,a5,a0
    167c:	00278513          	add	a0,a5,2
    1680:	00008067          	ret

00001684 <.L10>:
    1684:	fff74683          	lbu	a3,-1(a4)
    1688:	fe0690e3          	bnez	a3,1668 <.L7>
    168c:	40a787b3          	sub	a5,a5,a0
    1690:	00378513          	add	a0,a5,3
    1694:	00008067          	ret

00001698 <__GI_strnlen>:
    1698:	00050713          	mv	a4,a0
    169c:	00058513          	mv	a0,a1
    16a0:	06058a63          	beqz	a1,1714 <.L2>
    16a4:	00b705b3          	add	a1,a4,a1
    16a8:	00e5f463          	bgeu	a1,a4,16b0 <.L3>
    16ac:	fff00593          	li	a1,-1

000016b0 <.L3>:
    16b0:	00070793          	mv	a5,a4

000016b4 <.L4>:
    16b4:	0037f693          	and	a3,a5,3
    16b8:	04069463          	bnez	a3,1700 <.L7>
    16bc:	feff0537          	lui	a0,0xfeff0
    16c0:	80808837          	lui	a6,0x80808
    16c4:	00078693          	mv	a3,a5
    16c8:	eff50513          	add	a0,a0,-257 # fefefeff <_ebss+0xfefe235f>
    16cc:	08080813          	add	a6,a6,128 # 80808080 <_ebss+0x807fa4e0>

000016d0 <.L8>:
    16d0:	02b6fc63          	bgeu	a3,a1,1708 <.L10>
    16d4:	0006a783          	lw	a5,0(a3)
    16d8:	00468613          	add	a2,a3,4
    16dc:	00a787b3          	add	a5,a5,a0
    16e0:	0107f7b3          	and	a5,a5,a6
    16e4:	04078e63          	beqz	a5,1740 <.L18>
    16e8:	ffc64783          	lbu	a5,-4(a2)
    16ec:	06078063          	beqz	a5,174c <.L17>
    16f0:	ffd64783          	lbu	a5,-3(a2)
    16f4:	02079663          	bnez	a5,1720 <.L11>
    16f8:	00168793          	add	a5,a3,1
    16fc:	00c0006f          	j	1708 <.L10>

00001700 <.L7>:
    1700:	0007c683          	lbu	a3,0(a5)
    1704:	00069a63          	bnez	a3,1718 <.L5>

00001708 <.L10>:
    1708:	00b7f463          	bgeu	a5,a1,1710 <.L14>
    170c:	00078593          	mv	a1,a5

00001710 <.L14>:
    1710:	40e58533          	sub	a0,a1,a4

00001714 <.L2>:
    1714:	00008067          	ret

00001718 <.L5>:
    1718:	00178793          	add	a5,a5,1
    171c:	f99ff06f          	j	16b4 <.L4>

00001720 <.L11>:
    1720:	ffe64783          	lbu	a5,-2(a2)
    1724:	00079663          	bnez	a5,1730 <.L12>
    1728:	00268793          	add	a5,a3,2
    172c:	fddff06f          	j	1708 <.L10>

00001730 <.L12>:
    1730:	fff64783          	lbu	a5,-1(a2)
    1734:	00079663          	bnez	a5,1740 <.L18>
    1738:	00368793          	add	a5,a3,3
    173c:	fcdff06f          	j	1708 <.L10>

00001740 <.L18>:
    1740:	00058793          	mv	a5,a1
    1744:	00060693          	mv	a3,a2
    1748:	f89ff06f          	j	16d0 <.L8>

0000174c <.L17>:
    174c:	00068793          	mv	a5,a3
    1750:	fb9ff06f          	j	1708 <.L10>

00001754 <__GI___glibc_strerror_r>:
    1754:	ff010113          	add	sp,sp,-16
    1758:	00812423          	sw	s0,8(sp)
    175c:	00112623          	sw	ra,12(sp)
    1760:	00058413          	mv	s0,a1
    1764:	018000ef          	jal	177c <__GI___xpg_strerror_r>
    1768:	00c12083          	lw	ra,12(sp)
    176c:	00040513          	mv	a0,s0
    1770:	00812403          	lw	s0,8(sp)
    1774:	01010113          	add	sp,sp,16
    1778:	00008067          	ret

0000177c <__GI___xpg_strerror_r>:
    177c:	fa010113          	add	sp,sp,-96
    1780:	05312623          	sw	s3,76(sp)
    1784:	05412423          	sw	s4,72(sp)
    1788:	04112e23          	sw	ra,92(sp)
    178c:	04812c23          	sw	s0,88(sp)
    1790:	04912a23          	sw	s1,84(sp)
    1794:	05212823          	sw	s2,80(sp)
    1798:	07c00793          	li	a5,124
    179c:	00058993          	mv	s3,a1
    17a0:	00060a13          	mv	s4,a2
    17a4:	08a7f463          	bgeu	a5,a0,182c <.L13>

000017a8 <.L3>:
    17a8:	00050593          	mv	a1,a0
    17ac:	41f55613          	sra	a2,a0,0x1f
    17b0:	00000713          	li	a4,0
    17b4:	ff600693          	li	a3,-10
    17b8:	03d10513          	add	a0,sp,61
    17bc:	101000ef          	jal	20bc <_uintmaxtostr>
    17c0:	ff250913          	add	s2,a0,-14
    17c4:	00e00613          	li	a2,14
    17c8:	00007597          	auipc	a1,0x7
    17cc:	c9858593          	add	a1,a1,-872 # 8460 <unknown.0>
    17d0:	00090513          	mv	a0,s2
    17d4:	ae5ff0ef          	jal	12b8 <__GI_memcpy>
    17d8:	01600493          	li	s1,22
    17dc:	01c0006f          	j	17f8 <.L6>

000017e0 <.L5>:
    17e0:	00079463          	bnez	a5,17e8 <.L4>
    17e4:	fff48493          	add	s1,s1,-1

000017e8 <.L4>:
    17e8:	00190913          	add	s2,s2,1

000017ec <.L2>:
    17ec:	00094783          	lbu	a5,0(s2)
    17f0:	fe0498e3          	bnez	s1,17e0 <.L5>
    17f4:	fa078ae3          	beqz	a5,17a8 <.L3>

000017f8 <.L6>:
    17f8:	00099463          	bnez	s3,1800 <.L7>
    17fc:	00000a13          	li	s4,0

00001800 <.L7>:
    1800:	00090513          	mv	a0,s2
    1804:	e01ff0ef          	jal	1604 <__GI_strlen>
    1808:	00150413          	add	s0,a0,1
    180c:	028a7863          	bgeu	s4,s0,183c <.L8>
    1810:	000a0413          	mv	s0,s4
    1814:	02200493          	li	s1,34
    1818:	020a1463          	bnez	s4,1840 <.L9>

0000181c <.L10>:
    181c:	00006797          	auipc	a5,0x6
    1820:	9b87a783          	lw	a5,-1608(a5) # 71d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    1824:	0097a023          	sw	s1,0(a5)
    1828:	0340006f          	j	185c <.L1>

0000182c <.L13>:
    182c:	00050493          	mv	s1,a0
    1830:	00006917          	auipc	s2,0x6
    1834:	a9c90913          	add	s2,s2,-1380 # 72cc <_string_syserrmsgs>
    1838:	fb5ff06f          	j	17ec <.L2>

0000183c <.L8>:
    183c:	00040e63          	beqz	s0,1858 <.L11>

00001840 <.L9>:
    1840:	00098513          	mv	a0,s3
    1844:	00040613          	mv	a2,s0
    1848:	00090593          	mv	a1,s2
    184c:	008989b3          	add	s3,s3,s0
    1850:	a69ff0ef          	jal	12b8 <__GI_memcpy>
    1854:	fe098fa3          	sb	zero,-1(s3)

00001858 <.L11>:
    1858:	fc0492e3          	bnez	s1,181c <.L10>

0000185c <.L1>:
    185c:	05c12083          	lw	ra,92(sp)
    1860:	05812403          	lw	s0,88(sp)
    1864:	05012903          	lw	s2,80(sp)
    1868:	04c12983          	lw	s3,76(sp)
    186c:	04812a03          	lw	s4,72(sp)
    1870:	00048513          	mv	a0,s1
    1874:	05412483          	lw	s1,84(sp)
    1878:	06010113          	add	sp,sp,96
    187c:	00008067          	ret

00001880 <__GI_isatty>:
    1880:	fb010113          	add	sp,sp,-80
    1884:	00410593          	add	a1,sp,4
    1888:	04112623          	sw	ra,76(sp)
    188c:	014000ef          	jal	18a0 <__GI_tcgetattr>
    1890:	04c12083          	lw	ra,76(sp)
    1894:	00153513          	seqz	a0,a0
    1898:	05010113          	add	sp,sp,80
    189c:	00008067          	ret

000018a0 <__GI_tcgetattr>:
    18a0:	fc010113          	add	sp,sp,-64
    18a4:	02812c23          	sw	s0,56(sp)
    18a8:	00058413          	mv	s0,a1
    18ac:	000055b7          	lui	a1,0x5
    18b0:	00c10613          	add	a2,sp,12
    18b4:	40158593          	add	a1,a1,1025 # 5401 <.LBE4+0x15>
    18b8:	02912a23          	sw	s1,52(sp)
    18bc:	02112e23          	sw	ra,60(sp)
    18c0:	350000ef          	jal	1c10 <__GI_ioctl>
    18c4:	00050493          	mv	s1,a0
    18c8:	04051463          	bnez	a0,1910 <.L1>
    18cc:	00c12783          	lw	a5,12(sp)
    18d0:	01300613          	li	a2,19
    18d4:	01d10593          	add	a1,sp,29
    18d8:	00f42023          	sw	a5,0(s0)
    18dc:	01012783          	lw	a5,16(sp)
    18e0:	01140513          	add	a0,s0,17
    18e4:	00f42223          	sw	a5,4(s0)
    18e8:	01412783          	lw	a5,20(sp)
    18ec:	00f42423          	sw	a5,8(s0)
    18f0:	01812783          	lw	a5,24(sp)
    18f4:	00f42623          	sw	a5,12(s0)
    18f8:	01c14783          	lbu	a5,28(sp)
    18fc:	00f40823          	sb	a5,16(s0)
    1900:	520010ef          	jal	2e20 <__GI_mempcpy>
    1904:	00d00613          	li	a2,13
    1908:	00000593          	li	a1,0
    190c:	c55ff0ef          	jal	1560 <__GI_memset>

00001910 <.L1>:
    1910:	03c12083          	lw	ra,60(sp)
    1914:	03812403          	lw	s0,56(sp)
    1918:	00048513          	mv	a0,s1
    191c:	03412483          	lw	s1,52(sp)
    1920:	04010113          	add	sp,sp,64
    1924:	00008067          	ret

00001928 <__uClibc_init>:
    1928:	00009797          	auipc	a5,0x9
    192c:	61c78793          	add	a5,a5,1564 # af44 <__pagesize>
    1930:	0007a703          	lw	a4,0(a5)
    1934:	02071063          	bnez	a4,1954 <.L1>
    1938:	00002737          	lui	a4,0x2
    193c:	00e7a023          	sw	a4,0(a5)
    1940:	00006717          	auipc	a4,0x6
    1944:	8cc72703          	lw	a4,-1844(a4) # 720c <.LLST53+0xf>
    1948:	00070793          	mv	a5,a4
    194c:	00078463          	beqz	a5,1954 <.L1>
    1950:	00070067          	jr	a4

00001954 <.L1>:
    1954:	00008067          	ret

00001958 <__uClibc_fini>:
    1958:	ff010113          	add	sp,sp,-16
    195c:	00812423          	sw	s0,8(sp)
    1960:	00912223          	sw	s1,4(sp)
    1964:	00007417          	auipc	s0,0x7
    1968:	c0c40413          	add	s0,s0,-1012 # 8570 <__TMC_END__>
    196c:	00007497          	auipc	s1,0x7
    1970:	c0048493          	add	s1,s1,-1024 # 856c <__do_global_dtors_aux_fini_array_entry>
    1974:	40940433          	sub	s0,s0,s1
    1978:	40245413          	sra	s0,s0,0x2
    197c:	01212023          	sw	s2,0(sp)
    1980:	00112623          	sw	ra,12(sp)
    1984:	fff40413          	add	s0,s0,-1
    1988:	fff00913          	li	s2,-1

0000198c <.L9>:
    198c:	03241c63          	bne	s0,s2,19c4 <.L10>
    1990:	00009417          	auipc	s0,0x9
    1994:	5b440413          	add	s0,s0,1460 # af44 <__pagesize>
    1998:	00442783          	lw	a5,4(s0)
    199c:	00078463          	beqz	a5,19a4 <.L11>
    19a0:	000780e7          	jalr	a5

000019a4 <.L11>:
    19a4:	00842783          	lw	a5,8(s0)
    19a8:	02078a63          	beqz	a5,19dc <.L8>
    19ac:	00812403          	lw	s0,8(sp)
    19b0:	00c12083          	lw	ra,12(sp)
    19b4:	00412483          	lw	s1,4(sp)
    19b8:	00012903          	lw	s2,0(sp)
    19bc:	01010113          	add	sp,sp,16
    19c0:	00078067          	jr	a5

000019c4 <.L10>:
    19c4:	00241793          	sll	a5,s0,0x2
    19c8:	00f487b3          	add	a5,s1,a5
    19cc:	0007a783          	lw	a5,0(a5)
    19d0:	fff40413          	add	s0,s0,-1
    19d4:	000780e7          	jalr	a5
    19d8:	fb5ff06f          	j	198c <.L9>

000019dc <.L8>:
    19dc:	00c12083          	lw	ra,12(sp)
    19e0:	00812403          	lw	s0,8(sp)
    19e4:	00412483          	lw	s1,4(sp)
    19e8:	00012903          	lw	s2,0(sp)
    19ec:	01010113          	add	sp,sp,16
    19f0:	00008067          	ret

000019f4 <__uClibc_main>:
    19f4:	f5010113          	add	sp,sp,-176
    19f8:	0a812423          	sw	s0,168(sp)
    19fc:	0b212023          	sw	s2,160(sp)
    1a00:	09312e23          	sw	s3,156(sp)
    1a04:	09412c23          	sw	s4,152(sp)
    1a08:	09512a23          	sw	s5,148(sp)
    1a0c:	09612823          	sw	s6,144(sp)
    1a10:	09712623          	sw	s7,140(sp)
    1a14:	0a112623          	sw	ra,172(sp)
    1a18:	0a912223          	sw	s1,164(sp)
    1a1c:	09812423          	sw	s8,136(sp)
    1a20:	09912223          	sw	s9,132(sp)
    1a24:	09a12023          	sw	s10,128(sp)
    1a28:	00070a93          	mv	s5,a4
    1a2c:	00009b17          	auipc	s6,0x9
    1a30:	518b0b13          	add	s6,s6,1304 # af44 <__pagesize>
    1a34:	00005717          	auipc	a4,0x5
    1a38:	79c72703          	lw	a4,1948(a4) # 71d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1a3c:	01072023          	sw	a6,0(a4)
    1a40:	00fb2423          	sw	a5,8(s6)
    1a44:	00158793          	add	a5,a1,1
    1a48:	00068993          	mv	s3,a3
    1a4c:	00279793          	sll	a5,a5,0x2
    1a50:	00062683          	lw	a3,0(a2)
    1a54:	00f60733          	add	a4,a2,a5
    1a58:	00005b97          	auipc	s7,0x5
    1a5c:	780bab83          	lw	s7,1920(s7) # 71d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    1a60:	00eba023          	sw	a4,0(s7)
    1a64:	00050a13          	mv	s4,a0
    1a68:	00058913          	mv	s2,a1
    1a6c:	00060413          	mv	s0,a2
    1a70:	00d71863          	bne	a4,a3,1a80 <.L18>
    1a74:	ffc78793          	add	a5,a5,-4
    1a78:	00f607b3          	add	a5,a2,a5
    1a7c:	00fba023          	sw	a5,0(s7)

00001a80 <.L18>:
    1a80:	00810c93          	add	s9,sp,8
    1a84:	07800613          	li	a2,120
    1a88:	00000593          	li	a1,0
    1a8c:	000c8513          	mv	a0,s9
    1a90:	ad1ff0ef          	jal	1560 <__GI_memset>
    1a94:	000bac03          	lw	s8,0(s7)

00001a98 <.L19>:
    1a98:	000c2783          	lw	a5,0(s8)
    1a9c:	004c0c13          	add	s8,s8,4
    1aa0:	fe079ce3          	bnez	a5,1a98 <.L19>
    1aa4:	00e00d13          	li	s10,14

00001aa8 <.L20>:
    1aa8:	000c2483          	lw	s1,0(s8)
    1aac:	0c049a63          	bnez	s1,1b80 <.L22>
    1ab0:	000c8513          	mv	a0,s9
    1ab4:	120000ef          	jal	1bd4 <_dl_aux_init>
    1ab8:	e71ff0ef          	jal	1928 <__uClibc_init>
    1abc:	00042783          	lw	a5,0(s0)
    1ac0:	00007717          	auipc	a4,0x7
    1ac4:	a8f72823          	sw	a5,-1392(a4) # 8550 <__uclibc_progname>
    1ac8:	02078a63          	beqz	a5,1afc <.L23>
    1acc:	00005717          	auipc	a4,0x5
    1ad0:	74c72703          	lw	a4,1868(a4) # 7218 <.LLST53+0x1b>
    1ad4:	00f72023          	sw	a5,0(a4)
    1ad8:	00042503          	lw	a0,0(s0)
    1adc:	02f00593          	li	a1,47
    1ae0:	444010ef          	jal	2f24 <__GI_strrchr>
    1ae4:	00005797          	auipc	a5,0x5
    1ae8:	7087a783          	lw	a5,1800(a5) # 71ec <_GLOBAL_OFFSET_TABLE_+0x24>
    1aec:	00a7a023          	sw	a0,0(a5)
    1af0:	0a050863          	beqz	a0,1ba0 <.L24>
    1af4:	00150513          	add	a0,a0,1
    1af8:	00a7a023          	sw	a0,0(a5)

00001afc <.L23>:
    1afc:	015b2223          	sw	s5,4(s6)
    1b00:	00007b17          	auipc	s6,0x7
    1b04:	a64b0b13          	add	s6,s6,-1436 # 8564 <__preinit_array_start>
    1b08:	00007a97          	auipc	s5,0x7
    1b0c:	a60a8a93          	add	s5,s5,-1440 # 8568 <__frame_dummy_init_array_entry>
    1b10:	416a8ab3          	sub	s5,s5,s6
    1b14:	402ada93          	sra	s5,s5,0x2
    1b18:	00000c13          	li	s8,0

00001b1c <.L25>:
    1b1c:	095c1863          	bne	s8,s5,1bac <.L26>
    1b20:	00098463          	beqz	s3,1b28 <.L27>
    1b24:	000980e7          	jalr	s3

00001b28 <.L27>:
    1b28:	00007a97          	auipc	s5,0x7
    1b2c:	a40a8a93          	add	s5,s5,-1472 # 8568 <__frame_dummy_init_array_entry>
    1b30:	00007997          	auipc	s3,0x7
    1b34:	a3c98993          	add	s3,s3,-1476 # 856c <__do_global_dtors_aux_fini_array_entry>
    1b38:	415989b3          	sub	s3,s3,s5
    1b3c:	4029d993          	sra	s3,s3,0x2

00001b40 <.L28>:
    1b40:	08999063          	bne	s3,s1,1bc0 <.L29>
    1b44:	00005797          	auipc	a5,0x5
    1b48:	6c47a783          	lw	a5,1732(a5) # 7208 <.LLST53+0xb>
    1b4c:	00078663          	beqz	a5,1b58 <.L30>
    1b50:	110000ef          	jal	1c60 <__errno_location>
    1b54:	00052023          	sw	zero,0(a0)

00001b58 <.L30>:
    1b58:	00005797          	auipc	a5,0x5
    1b5c:	6a07a783          	lw	a5,1696(a5) # 71f8 <_GLOBAL_OFFSET_TABLE_+0x30>
    1b60:	00078663          	beqz	a5,1b6c <.L31>
    1b64:	108000ef          	jal	1c6c <__h_errno_location>
    1b68:	00052023          	sw	zero,0(a0)

00001b6c <.L31>:
    1b6c:	000ba603          	lw	a2,0(s7)
    1b70:	00040593          	mv	a1,s0
    1b74:	00090513          	mv	a0,s2
    1b78:	000a00e7          	jalr	s4
    1b7c:	414010ef          	jal	2f90 <__GI_exit>

00001b80 <.L22>:
    1b80:	009d6c63          	bltu	s10,s1,1b98 <.L21>
    1b84:	00349513          	sll	a0,s1,0x3
    1b88:	00800613          	li	a2,8
    1b8c:	000c0593          	mv	a1,s8
    1b90:	00ac8533          	add	a0,s9,a0
    1b94:	f24ff0ef          	jal	12b8 <__GI_memcpy>

00001b98 <.L21>:
    1b98:	008c0c13          	add	s8,s8,8
    1b9c:	f0dff06f          	j	1aa8 <.L20>

00001ba0 <.L24>:
    1ba0:	00042703          	lw	a4,0(s0)
    1ba4:	00e7a023          	sw	a4,0(a5)
    1ba8:	f55ff06f          	j	1afc <.L23>

00001bac <.L26>:
    1bac:	000b2783          	lw	a5,0(s6)
    1bb0:	001c0c13          	add	s8,s8,1
    1bb4:	004b0b13          	add	s6,s6,4
    1bb8:	000780e7          	jalr	a5
    1bbc:	f61ff06f          	j	1b1c <.L25>

00001bc0 <.L29>:
    1bc0:	000aa783          	lw	a5,0(s5)
    1bc4:	00148493          	add	s1,s1,1
    1bc8:	004a8a93          	add	s5,s5,4
    1bcc:	000780e7          	jalr	a5
    1bd0:	f71ff06f          	j	1b40 <.L28>

00001bd4 <_dl_aux_init>:
    1bd4:	01c52703          	lw	a4,28(a0)
    1bd8:	00005797          	auipc	a5,0x5
    1bdc:	6187a783          	lw	a5,1560(a5) # 71f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    1be0:	00e7a023          	sw	a4,0(a5)
    1be4:	02c52703          	lw	a4,44(a0)
    1be8:	00005797          	auipc	a5,0x5
    1bec:	61c7a783          	lw	a5,1564(a5) # 7204 <.LLST53+0x7>
    1bf0:	00e7a023          	sw	a4,0(a5)
    1bf4:	03452783          	lw	a5,52(a0)
    1bf8:	00079463          	bnez	a5,1c00 <.L2>
    1bfc:	000027b7          	lui	a5,0x2

00001c00 <.L2>:
    1c00:	00005717          	auipc	a4,0x5
    1c04:	61472703          	lw	a4,1556(a4) # 7214 <.LLST53+0x17>
    1c08:	00f72023          	sw	a5,0(a4)
    1c0c:	00008067          	ret

00001c10 <__GI_ioctl>:
    1c10:	fd010113          	add	sp,sp,-48
    1c14:	02f12223          	sw	a5,36(sp)
    1c18:	01810793          	add	a5,sp,24
    1c1c:	03112623          	sw	a7,44(sp)
    1c20:	00c12c23          	sw	a2,24(sp)
    1c24:	00d12e23          	sw	a3,28(sp)
    1c28:	02e12023          	sw	a4,32(sp)
    1c2c:	03012423          	sw	a6,40(sp)
    1c30:	00f12623          	sw	a5,12(sp)
    1c34:	01d00893          	li	a7,29
    1c38:	00000073          	ecall
    1c3c:	fffff7b7          	lui	a5,0xfffff
    1c40:	00a7fc63          	bgeu	a5,a0,1c58 <.L1>
    1c44:	40a00533          	neg	a0,a0
    1c48:	00005797          	auipc	a5,0x5
    1c4c:	58c7a783          	lw	a5,1420(a5) # 71d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    1c50:	00a7a023          	sw	a0,0(a5)
    1c54:	fff00513          	li	a0,-1

00001c58 <.L1>:
    1c58:	03010113          	add	sp,sp,48
    1c5c:	00008067          	ret

00001c60 <__errno_location>:
    1c60:	00005517          	auipc	a0,0x5
    1c64:	57452503          	lw	a0,1396(a0) # 71d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    1c68:	00008067          	ret

00001c6c <__h_errno_location>:
    1c6c:	00005517          	auipc	a0,0x5
    1c70:	57052503          	lw	a0,1392(a0) # 71dc <_GLOBAL_OFFSET_TABLE_+0x14>
    1c74:	00008067          	ret

00001c78 <__stdio_WRITE>:
    1c78:	fd010113          	add	sp,sp,-48
    1c7c:	01512a23          	sw	s5,20(sp)
    1c80:	80000ab7          	lui	s5,0x80000
    1c84:	02812423          	sw	s0,40(sp)
    1c88:	02912223          	sw	s1,36(sp)
    1c8c:	03212023          	sw	s2,32(sp)
    1c90:	01312e23          	sw	s3,28(sp)
    1c94:	01612823          	sw	s6,16(sp)
    1c98:	01712623          	sw	s7,12(sp)
    1c9c:	01812423          	sw	s8,8(sp)
    1ca0:	02112623          	sw	ra,44(sp)
    1ca4:	01412c23          	sw	s4,24(sp)
    1ca8:	00050493          	mv	s1,a0
    1cac:	00058413          	mv	s0,a1
    1cb0:	00060993          	mv	s3,a2
    1cb4:	00060913          	mv	s2,a2
    1cb8:	fffa8a93          	add	s5,s5,-1 # 7fffffff <_ebss+0x7fff245f>
    1cbc:	ffe00b93          	li	s7,-2
    1cc0:	00005b17          	auipc	s6,0x5
    1cc4:	514b2b03          	lw	s6,1300(s6) # 71d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    1cc8:	00b00c13          	li	s8,11

00001ccc <.L2>:
    1ccc:	04090c63          	beqz	s2,1d24 <.L10>
    1cd0:	00090a13          	mv	s4,s2
    1cd4:	00090613          	mv	a2,s2
    1cd8:	00095463          	bgez	s2,1ce0 <.L3>
    1cdc:	000a8613          	mv	a2,s5

00001ce0 <.L3>:
    1ce0:	0044a503          	lw	a0,4(s1)
    1ce4:	09751c63          	bne	a0,s7,1d7c <.L4>
    1ce8:	02c4a783          	lw	a5,44(s1)
    1cec:	06079663          	bnez	a5,1d58 <.L5>
    1cf0:	01600793          	li	a5,22
    1cf4:	00fb2023          	sw	a5,0(s6)

00001cf8 <.L6>:
    1cf8:	0004d783          	lhu	a5,0(s1)
    1cfc:	00400713          	li	a4,4
    1d00:	0087e793          	or	a5,a5,8
    1d04:	00f49023          	sh	a5,0(s1)
    1d08:	00005797          	auipc	a5,0x5
    1d0c:	4cc7a783          	lw	a5,1228(a5) # 71d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    1d10:	0007a783          	lw	a5,0(a5)
    1d14:	06e78a63          	beq	a5,a4,1d88 <.L9>
    1d18:	00b00713          	li	a4,11
    1d1c:	06e78663          	beq	a5,a4,1d88 <.L9>

00001d20 <.L11>:
    1d20:	412989b3          	sub	s3,s3,s2

00001d24 <.L10>:
    1d24:	02c12083          	lw	ra,44(sp)
    1d28:	02812403          	lw	s0,40(sp)
    1d2c:	02412483          	lw	s1,36(sp)
    1d30:	02012903          	lw	s2,32(sp)
    1d34:	01812a03          	lw	s4,24(sp)
    1d38:	01412a83          	lw	s5,20(sp)
    1d3c:	01012b03          	lw	s6,16(sp)
    1d40:	00c12b83          	lw	s7,12(sp)
    1d44:	00812c03          	lw	s8,8(sp)
    1d48:	00098513          	mv	a0,s3
    1d4c:	01c12983          	lw	s3,28(sp)
    1d50:	03010113          	add	sp,sp,48
    1d54:	00008067          	ret

00001d58 <.L5>:
    1d58:	0244a503          	lw	a0,36(s1)
    1d5c:	018b2023          	sw	s8,0(s6)
    1d60:	00040593          	mv	a1,s0
    1d64:	000780e7          	jalr	a5
    1d68:	f80508e3          	beqz	a0,1cf8 <.L6>

00001d6c <.L7>:
    1d6c:	f80546e3          	bltz	a0,1cf8 <.L6>
    1d70:	40a90933          	sub	s2,s2,a0
    1d74:	00a40433          	add	s0,s0,a0
    1d78:	f55ff06f          	j	1ccc <.L2>

00001d7c <.L4>:
    1d7c:	00040593          	mv	a1,s0
    1d80:	280010ef          	jal	3000 <__GI_write>
    1d84:	fe9ff06f          	j	1d6c <.L7>

00001d88 <.L9>:
    1d88:	0084a783          	lw	a5,8(s1)
    1d8c:	00c4a683          	lw	a3,12(s1)
    1d90:	40f68733          	sub	a4,a3,a5
    1d94:	f8f686e3          	beq	a3,a5,1d20 <.L11>
    1d98:	00e96463          	bltu	s2,a4,1da0 <.L12>
    1d9c:	00070a13          	mv	s4,a4

00001da0 <.L12>:
    1da0:	00a00693          	li	a3,10
    1da4:	01440a33          	add	s4,s0,s4

00001da8 <.L15>:
    1da8:	00044703          	lbu	a4,0(s0)
    1dac:	00e78023          	sb	a4,0(a5)
    1db0:	00d71863          	bne	a4,a3,1dc0 <.L13>
    1db4:	0004d703          	lhu	a4,0(s1)
    1db8:	10077713          	and	a4,a4,256
    1dbc:	00071863          	bnez	a4,1dcc <.L14>

00001dc0 <.L13>:
    1dc0:	00140413          	add	s0,s0,1
    1dc4:	00178793          	add	a5,a5,1
    1dc8:	ff4410e3          	bne	s0,s4,1da8 <.L15>

00001dcc <.L14>:
    1dcc:	0084a703          	lw	a4,8(s1)
    1dd0:	00f4a823          	sw	a5,16(s1)
    1dd4:	40e787b3          	sub	a5,a5,a4
    1dd8:	40f90933          	sub	s2,s2,a5
    1ddc:	f45ff06f          	j	1d20 <.L11>

00001de0 <__stdio_fwrite>:
    1de0:	00065783          	lhu	a5,0(a2)
    1de4:	fe010113          	add	sp,sp,-32
    1de8:	00812c23          	sw	s0,24(sp)
    1dec:	00912a23          	sw	s1,20(sp)
    1df0:	01212823          	sw	s2,16(sp)
    1df4:	00112e23          	sw	ra,28(sp)
    1df8:	01312623          	sw	s3,12(sp)
    1dfc:	2007f793          	and	a5,a5,512
    1e00:	00050913          	mv	s2,a0
    1e04:	00058413          	mv	s0,a1
    1e08:	00060493          	mv	s1,a2
    1e0c:	02078663          	beqz	a5,1e38 <.L2>

00001e10 <.L11>:
    1e10:	00040613          	mv	a2,s0
    1e14:	01812403          	lw	s0,24(sp)
    1e18:	01c12083          	lw	ra,28(sp)
    1e1c:	00c12983          	lw	s3,12(sp)
    1e20:	00090593          	mv	a1,s2
    1e24:	00048513          	mv	a0,s1
    1e28:	01012903          	lw	s2,16(sp)
    1e2c:	01412483          	lw	s1,20(sp)
    1e30:	02010113          	add	sp,sp,32
    1e34:	e45ff06f          	j	1c78 <__stdio_WRITE>

00001e38 <.L2>:
    1e38:	01062503          	lw	a0,16(a2)
    1e3c:	00c62783          	lw	a5,12(a2)
    1e40:	00462683          	lw	a3,4(a2)
    1e44:	ffd00713          	li	a4,-3
    1e48:	40a787b3          	sub	a5,a5,a0
    1e4c:	04e69463          	bne	a3,a4,1e94 <.L3>
    1e50:	00058993          	mv	s3,a1
    1e54:	00b7f463          	bgeu	a5,a1,1e5c <.L4>
    1e58:	00078993          	mv	s3,a5

00001e5c <.L4>:
    1e5c:	00098613          	mv	a2,s3
    1e60:	00090593          	mv	a1,s2
    1e64:	c54ff0ef          	jal	12b8 <__GI_memcpy>
    1e68:	0104a783          	lw	a5,16(s1)
    1e6c:	013787b3          	add	a5,a5,s3

00001e70 <.L25>:
    1e70:	00f4a823          	sw	a5,16(s1)

00001e74 <.L5>:
    1e74:	01c12083          	lw	ra,28(sp)
    1e78:	00040513          	mv	a0,s0
    1e7c:	01812403          	lw	s0,24(sp)
    1e80:	01412483          	lw	s1,20(sp)
    1e84:	01012903          	lw	s2,16(sp)
    1e88:	00c12983          	lw	s3,12(sp)
    1e8c:	02010113          	add	sp,sp,32
    1e90:	00008067          	ret

00001e94 <.L3>:
    1e94:	08b7e063          	bltu	a5,a1,1f14 <.L6>
    1e98:	00058613          	mv	a2,a1
    1e9c:	00090593          	mv	a1,s2
    1ea0:	c18ff0ef          	jal	12b8 <__GI_memcpy>
    1ea4:	0104a783          	lw	a5,16(s1)
    1ea8:	008787b3          	add	a5,a5,s0
    1eac:	00f4a823          	sw	a5,16(s1)
    1eb0:	0004d783          	lhu	a5,0(s1)
    1eb4:	1007f793          	and	a5,a5,256
    1eb8:	fa078ee3          	beqz	a5,1e74 <.L5>
    1ebc:	00040613          	mv	a2,s0
    1ec0:	00a00593          	li	a1,10
    1ec4:	00090513          	mv	a0,s2
    1ec8:	78d000ef          	jal	2e54 <__GI_memrchr>
    1ecc:	fa0504e3          	beqz	a0,1e74 <.L5>
    1ed0:	00048513          	mv	a0,s1
    1ed4:	b78fe0ef          	jal	24c <__stdio_wcommit>
    1ed8:	f8050ee3          	beqz	a0,1e74 <.L5>
    1edc:	00040613          	mv	a2,s0
    1ee0:	00857463          	bgeu	a0,s0,1ee8 <.L10>
    1ee4:	00050613          	mv	a2,a0

00001ee8 <.L10>:
    1ee8:	40c40533          	sub	a0,s0,a2
    1eec:	00a00593          	li	a1,10
    1ef0:	00a90533          	add	a0,s2,a0
    1ef4:	665000ef          	jal	2d58 <__GI_memchr>
    1ef8:	f6050ee3          	beqz	a0,1e74 <.L5>
    1efc:	0104a783          	lw	a5,16(s1)
    1f00:	00890933          	add	s2,s2,s0
    1f04:	40a90533          	sub	a0,s2,a0
    1f08:	40a40433          	sub	s0,s0,a0
    1f0c:	40a787b3          	sub	a5,a5,a0
    1f10:	f61ff06f          	j	1e70 <.L25>

00001f14 <.L6>:
    1f14:	00862783          	lw	a5,8(a2)
    1f18:	eea78ce3          	beq	a5,a0,1e10 <.L11>
    1f1c:	00060513          	mv	a0,a2
    1f20:	b2cfe0ef          	jal	24c <__stdio_wcommit>
    1f24:	ee0506e3          	beqz	a0,1e10 <.L11>
    1f28:	00000413          	li	s0,0
    1f2c:	f49ff06f          	j	1e74 <.L5>

00001f30 <__stdio_trans2w>:
    1f30:	00055603          	lhu	a2,0(a0)
    1f34:	ff010113          	add	sp,sp,-16
    1f38:	00812423          	sw	s0,8(sp)
    1f3c:	00112623          	sw	ra,12(sp)
    1f40:	02067793          	and	a5,a2,32
    1f44:	00050413          	mv	s0,a0
    1f48:	02078a63          	beqz	a5,1f7c <.L2>
    1f4c:	00005797          	auipc	a5,0x5
    1f50:	2887a783          	lw	a5,648(a5) # 71d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    1f54:	00900713          	li	a4,9
    1f58:	00e7a023          	sw	a4,0(a5)

00001f5c <.L3>:
    1f5c:	00045783          	lhu	a5,0(s0)
    1f60:	fff00513          	li	a0,-1
    1f64:	0087e793          	or	a5,a5,8
    1f68:	00f41023          	sh	a5,0(s0)

00001f6c <.L1>:
    1f6c:	00c12083          	lw	ra,12(sp)
    1f70:	00812403          	lw	s0,8(sp)
    1f74:	01010113          	add	sp,sp,16
    1f78:	00008067          	ret

00001f7c <.L2>:
    1f7c:	00367793          	and	a5,a2,3
    1f80:	02078463          	beqz	a5,1fa8 <.L5>
    1f84:	00467793          	and	a5,a2,4
    1f88:	02078e63          	beqz	a5,1fc4 <.L6>

00001f8c <.L8>:
    1f8c:	00045783          	lhu	a5,0(s0)
    1f90:	ffc7f793          	and	a5,a5,-4
    1f94:	00f41023          	sh	a5,0(s0)
    1f98:	00842783          	lw	a5,8(s0)
    1f9c:	00f42c23          	sw	a5,24(s0)
    1fa0:	00f42823          	sw	a5,16(s0)
    1fa4:	00f42a23          	sw	a5,20(s0)

00001fa8 <.L5>:
    1fa8:	00045783          	lhu	a5,0(s0)
    1fac:	0407e713          	or	a4,a5,64
    1fb0:	00e41023          	sh	a4,0(s0)
    1fb4:	3007f793          	and	a5,a5,768
    1fb8:	04078063          	beqz	a5,1ff8 <.L10>

00001fbc <.L11>:
    1fbc:	00000513          	li	a0,0
    1fc0:	fadff06f          	j	1f6c <.L1>

00001fc4 <.L6>:
    1fc4:	01452703          	lw	a4,20(a0)
    1fc8:	01052783          	lw	a5,16(a0)
    1fcc:	00f71663          	bne	a4,a5,1fd8 <.L7>
    1fd0:	00267793          	and	a5,a2,2
    1fd4:	fa078ce3          	beqz	a5,1f8c <.L8>

00001fd8 <.L7>:
    1fd8:	40067613          	and	a2,a2,1024
    1fdc:	00c03633          	snez	a2,a2
    1fe0:	00160613          	add	a2,a2,1
    1fe4:	00000593          	li	a1,0
    1fe8:	00040513          	mv	a0,s0
    1fec:	03c010ef          	jal	3028 <__GI_fseek>
    1ff0:	f8050ee3          	beqz	a0,1f8c <.L8>
    1ff4:	f69ff06f          	j	1f5c <.L3>

00001ff8 <.L10>:
    1ff8:	00c42783          	lw	a5,12(s0)
    1ffc:	00f42e23          	sw	a5,28(s0)
    2000:	fbdff06f          	j	1fbc <.L11>

00002004 <_load_inttype>:
    2004:	00001737          	lui	a4,0x1
    2008:	80070713          	add	a4,a4,-2048 # 800 <.L50+0x14>
    200c:	00050793          	mv	a5,a0
    2010:	00e57733          	and	a4,a0,a4
    2014:	0005a503          	lw	a0,0(a1)
    2018:	02064c63          	bltz	a2,2050 <.L2>
    201c:	00070663          	beqz	a4,2028 <.L3>

00002020 <.L10>:
    2020:	0045a583          	lw	a1,4(a1)
    2024:	00008067          	ret

00002028 <.L3>:
    2028:	10000713          	li	a4,256
    202c:	00e79863          	bne	a5,a4,203c <.L5>
    2030:	0ff57513          	zext.b	a0,a0

00002034 <.L6>:
    2034:	00000593          	li	a1,0
    2038:	00008067          	ret

0000203c <.L5>:
    203c:	20000713          	li	a4,512
    2040:	fee79ae3          	bne	a5,a4,2034 <.L6>
    2044:	01051513          	sll	a0,a0,0x10
    2048:	01055513          	srl	a0,a0,0x10
    204c:	fe9ff06f          	j	2034 <.L6>

00002050 <.L2>:
    2050:	fc0718e3          	bnez	a4,2020 <.L10>
    2054:	10000713          	li	a4,256
    2058:	00e79a63          	bne	a5,a4,206c <.L8>
    205c:	01851513          	sll	a0,a0,0x18
    2060:	41855513          	sra	a0,a0,0x18

00002064 <.L9>:
    2064:	41f55593          	sra	a1,a0,0x1f
    2068:	00008067          	ret

0000206c <.L8>:
    206c:	20000713          	li	a4,512
    2070:	fee79ae3          	bne	a5,a4,2064 <.L9>
    2074:	01051513          	sll	a0,a0,0x10
    2078:	41055513          	sra	a0,a0,0x10
    207c:	fe9ff06f          	j	2064 <.L9>

00002080 <_store_inttype>:
    2080:	10000793          	li	a5,256
    2084:	00f59663          	bne	a1,a5,2090 <.L2>
    2088:	00c50023          	sb	a2,0(a0)
    208c:	00008067          	ret

00002090 <.L2>:
    2090:	80058793          	add	a5,a1,-2048
    2094:	00079863          	bnez	a5,20a4 <.L4>
    2098:	00c52023          	sw	a2,0(a0)
    209c:	00d52223          	sw	a3,4(a0)
    20a0:	00008067          	ret

000020a4 <.L4>:
    20a4:	20000793          	li	a5,512
    20a8:	00f59663          	bne	a1,a5,20b4 <.L5>
    20ac:	00c51023          	sh	a2,0(a0)
    20b0:	00008067          	ret

000020b4 <.L5>:
    20b4:	00c52023          	sw	a2,0(a0)
    20b8:	00008067          	ret

000020bc <_uintmaxtostr>:
    20bc:	00050893          	mv	a7,a0
    20c0:	00000e13          	li	t3,0
    20c4:	0206d063          	bgez	a3,20e4 <.L2>
    20c8:	40d006b3          	neg	a3,a3
    20cc:	00065c63          	bgez	a2,20e4 <.L2>
    20d0:	00b037b3          	snez	a5,a1
    20d4:	40c00633          	neg	a2,a2
    20d8:	40f60633          	sub	a2,a2,a5
    20dc:	40b005b3          	neg	a1,a1
    20e0:	00100e13          	li	t3,1

000020e4 <.L2>:
    20e4:	fff00813          	li	a6,-1
    20e8:	02d85333          	divu	t1,a6,a3
    20ec:	00088023          	sb	zero,0(a7)
    20f0:	02d87833          	remu	a6,a6,a3
    20f4:	00180813          	add	a6,a6,1
    20f8:	01069663          	bne	a3,a6,2104 <.L4>
    20fc:	00130313          	add	t1,t1,1
    2100:	00000813          	li	a6,0

00002104 <.L4>:
    2104:	00900e93          	li	t4,9

00002108 <.L8>:
    2108:	02d5f533          	remu	a0,a1,a3
    210c:	02d5d5b3          	divu	a1,a1,a3
    2110:	02060463          	beqz	a2,2138 <.L5>
    2114:	02d677b3          	remu	a5,a2,a3
    2118:	02f80f33          	mul	t5,a6,a5
    211c:	02f307b3          	mul	a5,t1,a5
    2120:	00af0533          	add	a0,t5,a0
    2124:	00b785b3          	add	a1,a5,a1
    2128:	02d557b3          	divu	a5,a0,a3
    212c:	02d65633          	divu	a2,a2,a3
    2130:	00f585b3          	add	a1,a1,a5
    2134:	02d57533          	remu	a0,a0,a3

00002138 <.L5>:
    2138:	0ff57793          	zext.b	a5,a0
    213c:	02aeec63          	bltu	t4,a0,2174 <.L6>
    2140:	03078793          	add	a5,a5,48

00002144 <.L19>:
    2144:	0ff7f793          	zext.b	a5,a5
    2148:	fef88fa3          	sb	a5,-1(a7)
    214c:	00b667b3          	or	a5,a2,a1
    2150:	fff88513          	add	a0,a7,-1
    2154:	00079c63          	bnez	a5,216c <.L12>
    2158:	000e0863          	beqz	t3,2168 <.L1>
    215c:	02d00793          	li	a5,45
    2160:	fef50fa3          	sb	a5,-1(a0)
    2164:	ffe88513          	add	a0,a7,-2

00002168 <.L1>:
    2168:	00008067          	ret

0000216c <.L12>:
    216c:	00050893          	mv	a7,a0
    2170:	f99ff06f          	j	2108 <.L8>

00002174 <.L6>:
    2174:	00e787b3          	add	a5,a5,a4
    2178:	fcdff06f          	j	2144 <.L19>

0000217c <_fpmaxtostr>:
    217c:	e7010113          	add	sp,sp,-400
    2180:	00462783          	lw	a5,4(a2)
    2184:	18812423          	sw	s0,392(sp)
    2188:	00864403          	lbu	s0,8(a2)
    218c:	02f12c23          	sw	a5,56(sp)
    2190:	06500793          	li	a5,101
    2194:	18912223          	sw	s1,388(sp)
    2198:	19212023          	sw	s2,384(sp)
    219c:	17312e23          	sw	s3,380(sp)
    21a0:	17412c23          	sw	s4,376(sp)
    21a4:	17512a23          	sw	s5,372(sp)
    21a8:	17612823          	sw	s6,368(sp)
    21ac:	17912223          	sw	s9,356(sp)
    21b0:	0af10c23          	sb	a5,184(sp)
    21b4:	18112623          	sw	ra,396(sp)
    21b8:	17712623          	sw	s7,364(sp)
    21bc:	17812423          	sw	s8,360(sp)
    21c0:	17a12023          	sw	s10,352(sp)
    21c4:	15b12e23          	sw	s11,348(sp)
    21c8:	04a12823          	sw	a0,80(sp)
    21cc:	04d12a23          	sw	a3,84(sp)
    21d0:	02046c93          	or	s9,s0,32
    21d4:	06100793          	li	a5,97
    21d8:	0005aa03          	lw	s4,0(a1)
    21dc:	0045aa83          	lw	s5,4(a1)
    21e0:	0085ab03          	lw	s6,8(a1)
    21e4:	00c5a903          	lw	s2,12(a1)
    21e8:	00062483          	lw	s1,0(a2)
    21ec:	00060993          	mv	s3,a2
    21f0:	1cfc9e63          	bne	s9,a5,23cc <.L2>
    21f4:	07000793          	li	a5,112
    21f8:	0af10c23          	sb	a5,184(sp)
    21fc:	1e04c063          	bltz	s1,23dc <.L67>

00002200 <.L4>:
    2200:	02012a23          	sw	zero,52(sp)

00002204 <.L3>:
    2204:	00c9a783          	lw	a5,12(s3)
    2208:	0a010823          	sb	zero,176(sp)
    220c:	0027f713          	and	a4,a5,2
    2210:	1c070e63          	beqz	a4,23ec <.L5>
    2214:	02b00793          	li	a5,43

00002218 <.L118>:
    2218:	0af10823          	sb	a5,176(sp)

0000221c <.L6>:
    221c:	0a010c13          	add	s8,sp,160
    2220:	09010b93          	add	s7,sp,144
    2224:	000b8593          	mv	a1,s7
    2228:	000c0513          	mv	a0,s8
    222c:	0a0108a3          	sb	zero,177(sp)
    2230:	10012223          	sw	zero,260(sp)
    2234:	0b412023          	sw	s4,160(sp)
    2238:	0b512223          	sw	s5,164(sp)
    223c:	0b612423          	sw	s6,168(sp)
    2240:	0b212623          	sw	s2,172(sp)
    2244:	09412823          	sw	s4,144(sp)
    2248:	09512a23          	sw	s5,148(sp)
    224c:	09612c23          	sw	s6,152(sp)
    2250:	09212e23          	sw	s2,156(sp)
    2254:	639010ef          	jal	408c <__eqtf2>
    2258:	1a050263          	beqz	a0,23fc <.L113>
    225c:	00800793          	li	a5,8
    2260:	10f12223          	sw	a5,260(sp)

00002264 <.L9>:
    2264:	02000793          	li	a5,32
    2268:	00f9a823          	sw	a5,16(s3)
    226c:	07000793          	li	a5,112
    2270:	0ef12e23          	sw	a5,252(sp)
    2274:	00300793          	li	a5,3
    2278:	10f12023          	sw	a5,256(sp)
    227c:	06000793          	li	a5,96
    2280:	0087e863          	bltu	a5,s0,2290 <.L18>
    2284:	10412783          	lw	a5,260(sp)
    2288:	00478793          	add	a5,a5,4
    228c:	10f12223          	sw	a5,260(sp)

00002290 <.L18>:
    2290:	10412783          	lw	a5,260(sp)
    2294:	00006717          	auipc	a4,0x6
    2298:	03c70713          	add	a4,a4,60 # 82d0 <fmt>
    229c:	00040593          	mv	a1,s0
    22a0:	00e787b3          	add	a5,a5,a4
    22a4:	10f12223          	sw	a5,260(sp)
    22a8:	10810913          	add	s2,sp,264

000022ac <.L19>:
    22ac:	10010793          	add	a5,sp,256

000022b0 <.L59>:
    22b0:	0007a703          	lw	a4,0(a5)
    22b4:	03812683          	lw	a3,56(sp)
    22b8:	00c78793          	add	a5,a5,12
    22bc:	40e68733          	sub	a4,a3,a4
    22c0:	02e12c23          	sw	a4,56(sp)
    22c4:	ff27e6e3          	bltu	a5,s2,22b0 <.L59>
    22c8:	0b014703          	lbu	a4,176(sp)
    22cc:	0a000793          	li	a5,160
    22d0:	0ef12823          	sw	a5,240(sp)
    22d4:	00e03733          	snez	a4,a4
    22d8:	0b010693          	add	a3,sp,176
    22dc:	0205e793          	or	a5,a1,32
    22e0:	0ee12a23          	sw	a4,244(sp)
    22e4:	0ed12c23          	sw	a3,248(sp)
    22e8:	0ff7f793          	zext.b	a5,a5
    22ec:	06100613          	li	a2,97
    22f0:	02c79a63          	bne	a5,a2,2324 <.L60>
    22f4:	0fc12603          	lw	a2,252(sp)
    22f8:	00f00793          	li	a5,15
    22fc:	02c7d463          	bge	a5,a2,2324 <.L60>
    2300:	00e687b3          	add	a5,a3,a4
    2304:	03000693          	li	a3,48
    2308:	00d78023          	sb	a3,0(a5)
    230c:	0b814683          	lbu	a3,184(sp)
    2310:	00270713          	add	a4,a4,2
    2314:	00078123          	sb	zero,2(a5)
    2318:	00868693          	add	a3,a3,8
    231c:	00d780a3          	sb	a3,1(a5)
    2320:	0ee12a23          	sw	a4,244(sp)

00002324 <.L60>:
    2324:	03812783          	lw	a5,56(sp)
    2328:	40e787b3          	sub	a5,a5,a4
    232c:	02f05663          	blez	a5,2358 <.L63>
    2330:	00c9a703          	lw	a4,12(s3)
    2334:	00877713          	and	a4,a4,8
    2338:	1e0706e3          	beqz	a4,2d24 <.L62>
    233c:	00f92223          	sw	a5,4(s2)
    2340:	0a000713          	li	a4,160
    2344:	00006797          	auipc	a5,0x6
    2348:	f8f78793          	add	a5,a5,-113 # 82d3 <fmt+0x3>
    234c:	00e92023          	sw	a4,0(s2)
    2350:	00f92423          	sw	a5,8(s2)
    2354:	00c90913          	add	s2,s2,12

00002358 <.L63>:
    2358:	0f010413          	add	s0,sp,240
    235c:	00000493          	li	s1,0

00002360 <.L66>:
    2360:	00442983          	lw	s3,4(s0)
    2364:	00842683          	lw	a3,8(s0)
    2368:	00042583          	lw	a1,0(s0)
    236c:	05012503          	lw	a0,80(sp)
    2370:	05412783          	lw	a5,84(sp)
    2374:	00098613          	mv	a2,s3
    2378:	000780e7          	jalr	a5
    237c:	1d351ae3          	bne	a0,s3,2d50 <.L82>
    2380:	00c40413          	add	s0,s0,12
    2384:	00a484b3          	add	s1,s1,a0
    2388:	fd246ce3          	bltu	s0,s2,2360 <.L66>

0000238c <.L1>:
    238c:	18c12083          	lw	ra,396(sp)
    2390:	18812403          	lw	s0,392(sp)
    2394:	18012903          	lw	s2,384(sp)
    2398:	17c12983          	lw	s3,380(sp)
    239c:	17812a03          	lw	s4,376(sp)
    23a0:	17412a83          	lw	s5,372(sp)
    23a4:	17012b03          	lw	s6,368(sp)
    23a8:	16c12b83          	lw	s7,364(sp)
    23ac:	16812c03          	lw	s8,360(sp)
    23b0:	16412c83          	lw	s9,356(sp)
    23b4:	16012d03          	lw	s10,352(sp)
    23b8:	15c12d83          	lw	s11,348(sp)
    23bc:	00048513          	mv	a0,s1
    23c0:	18412483          	lw	s1,388(sp)
    23c4:	19010113          	add	sp,sp,400
    23c8:	00008067          	ret

000023cc <.L2>:
    23cc:	e204dae3          	bgez	s1,2200 <.L4>
    23d0:	02012a23          	sw	zero,52(sp)
    23d4:	00600493          	li	s1,6
    23d8:	e2dff06f          	j	2204 <.L3>

000023dc <.L67>:
    23dc:	00100793          	li	a5,1
    23e0:	02f12a23          	sw	a5,52(sp)
    23e4:	01d00493          	li	s1,29
    23e8:	e1dff06f          	j	2204 <.L3>

000023ec <.L5>:
    23ec:	0017f793          	and	a5,a5,1
    23f0:	e20786e3          	beqz	a5,221c <.L6>
    23f4:	02000793          	li	a5,32
    23f8:	e21ff06f          	j	2218 <.L118>

000023fc <.L113>:
    23fc:	000b8593          	mv	a1,s7
    2400:	000c0513          	mv	a0,s8
    2404:	0b412023          	sw	s4,160(sp)
    2408:	0b512223          	sw	s5,164(sp)
    240c:	0b612423          	sw	s6,168(sp)
    2410:	0b212623          	sw	s2,172(sp)
    2414:	08012823          	sw	zero,144(sp)
    2418:	08012a23          	sw	zero,148(sp)
    241c:	08012c23          	sw	zero,152(sp)
    2420:	08012e23          	sw	zero,156(sp)
    2424:	469010ef          	jal	408c <__eqtf2>
    2428:	24051e63          	bnez	a0,2684 <.L114>
    242c:	000c0513          	mv	a0,s8
    2430:	059040ef          	jal	6c88 <__trunctfdf2>
    2434:	00b50663          	beq	a0,a1,2440 <.L12>
    2438:	02d00793          	li	a5,45
    243c:	0af10823          	sb	a5,176(sp)

00002440 <.L12>:
    2440:	02400793          	li	a5,36
    2444:	02f12623          	sw	a5,44(sp)
    2448:	00900793          	li	a5,9
    244c:	00006617          	auipc	a2,0x6
    2450:	04460613          	add	a2,a2,68 # 8490 <.LC2>
    2454:	02f12423          	sw	a5,40(sp)
    2458:	00a00793          	li	a5,10
    245c:	00f12623          	sw	a5,12(sp)
    2460:	00062783          	lw	a5,0(a2)
    2464:	000a0c93          	mv	s9,s4
    2468:	000a8d13          	mv	s10,s5
    246c:	00f12c23          	sw	a5,24(sp)
    2470:	00462783          	lw	a5,4(a2)
    2474:	000b0d93          	mv	s11,s6
    2478:	00090b93          	mv	s7,s2
    247c:	00f12e23          	sw	a5,28(sp)
    2480:	00862783          	lw	a5,8(a2)
    2484:	fff00c13          	li	s8,-1
    2488:	02f12023          	sw	a5,32(sp)
    248c:	00c62783          	lw	a5,12(a2)
    2490:	02f12223          	sw	a5,36(sp)

00002494 <.L13>:
    2494:	0a010793          	add	a5,sp,160
    2498:	00f12823          	sw	a5,16(sp)
    249c:	09010793          	add	a5,sp,144
    24a0:	00f12a23          	sw	a5,20(sp)
    24a4:	08010793          	add	a5,sp,128
    24a8:	00400913          	li	s2,4
    24ac:	0ca10a13          	add	s4,sp,202
    24b0:	02f12823          	sw	a5,48(sp)
    24b4:	07010b13          	add	s6,sp,112

000024b8 <.L29>:
    24b8:	01012503          	lw	a0,16(sp)
    24bc:	0b912023          	sw	s9,160(sp)
    24c0:	0ba12223          	sw	s10,164(sp)
    24c4:	0bb12423          	sw	s11,168(sp)
    24c8:	0b712623          	sw	s7,172(sp)
    24cc:	384040ef          	jal	6850 <__fixunstfsi>
    24d0:	00050593          	mv	a1,a0
    24d4:	00050a93          	mv	s5,a0
    24d8:	01012503          	lw	a0,16(sp)
    24dc:	46c040ef          	jal	6948 <__floatunsitf>
    24e0:	0a012703          	lw	a4,160(sp)
    24e4:	03012583          	lw	a1,48(sp)
    24e8:	01412503          	lw	a0,20(sp)
    24ec:	06e12823          	sw	a4,112(sp)
    24f0:	0a412703          	lw	a4,164(sp)
    24f4:	000b0613          	mv	a2,s6
    24f8:	09912023          	sw	s9,128(sp)
    24fc:	06e12a23          	sw	a4,116(sp)
    2500:	0a812703          	lw	a4,168(sp)
    2504:	09a12223          	sw	s10,132(sp)
    2508:	09b12423          	sw	s11,136(sp)
    250c:	06e12c23          	sw	a4,120(sp)
    2510:	0ac12703          	lw	a4,172(sp)
    2514:	09712623          	sw	s7,140(sp)
    2518:	06e12e23          	sw	a4,124(sp)
    251c:	6a1020ef          	jal	53bc <__subtf3>
    2520:	01812783          	lw	a5,24(sp)
    2524:	03012603          	lw	a2,48(sp)
    2528:	01012503          	lw	a0,16(sp)
    252c:	08f12023          	sw	a5,128(sp)
    2530:	01c12783          	lw	a5,28(sp)
    2534:	01412583          	lw	a1,20(sp)
    2538:	08f12223          	sw	a5,132(sp)
    253c:	02012783          	lw	a5,32(sp)
    2540:	08f12423          	sw	a5,136(sp)
    2544:	02412783          	lw	a5,36(sp)
    2548:	08f12623          	sw	a5,140(sp)
    254c:	66d010ef          	jal	43b8 <__multf3>
    2550:	02812783          	lw	a5,40(sp)
    2554:	0a012c83          	lw	s9,160(sp)
    2558:	0a412d03          	lw	s10,164(sp)
    255c:	0a812d83          	lw	s11,168(sp)
    2560:	0ac12b83          	lw	s7,172(sp)
    2564:	00fa0a33          	add	s4,s4,a5
    2568:	000a0613          	mv	a2,s4
    256c:	40fa0533          	sub	a0,s4,a5

00002570 <.L28>:
    2570:	00c12783          	lw	a5,12(sp)
    2574:	fff60613          	add	a2,a2,-1
    2578:	02faf5b3          	remu	a1,s5,a5
    257c:	03058593          	add	a1,a1,48
    2580:	00b60023          	sb	a1,0(a2)
    2584:	02fadab3          	divu	s5,s5,a5
    2588:	fec514e3          	bne	a0,a2,2570 <.L28>
    258c:	fff90913          	add	s2,s2,-1
    2590:	f20914e3          	bnez	s2,24b8 <.L29>
    2594:	06000713          	li	a4,96
    2598:	00876c63          	bltu	a4,s0,25b0 <.L30>
    259c:	0b814703          	lbu	a4,184(sp)
    25a0:	02040413          	add	s0,s0,32
    25a4:	0ff47413          	zext.b	s0,s0
    25a8:	fe070713          	add	a4,a4,-32
    25ac:	0ae10c23          	sb	a4,184(sp)

000025b0 <.L30>:
    25b0:	06700713          	li	a4,103
    25b4:	50e41263          	bne	s0,a4,2ab8 <.L31>
    25b8:	00000693          	li	a3,0
    25bc:	00048663          	beqz	s1,25c8 <.L32>
    25c0:	fff48493          	add	s1,s1,-1
    25c4:	00048693          	mv	a3,s1

000025c8 <.L32>:
    25c8:	02c12783          	lw	a5,44(sp)
    25cc:	00003737          	lui	a4,0x3
    25d0:	0ce11423          	sh	a4,200(sp)
    25d4:	0c910513          	add	a0,sp,201
    25d8:	50f6ca63          	blt	a3,a5,2aec <.L33>
    25dc:	00178613          	add	a2,a5,1
    25e0:	00c50633          	add	a2,a0,a2
    25e4:	00000593          	li	a1,0

000025e8 <.L34>:
    25e8:	00c12783          	lw	a5,12(sp)
    25ec:	03000813          	li	a6,48
    25f0:	02f78b93          	add	s7,a5,47

000025f4 <.L35>:
    25f4:	fff64703          	lbu	a4,-1(a2)
    25f8:	fff60613          	add	a2,a2,-1
    25fc:	00b70733          	add	a4,a4,a1
    2600:	0ff77713          	zext.b	a4,a4
    2604:	00e60023          	sb	a4,0(a2)
    2608:	ff0706e3          	beq	a4,a6,25f4 <.L35>
    260c:	feebe4e3          	bltu	s7,a4,25f4 <.L35>
    2610:	02046713          	or	a4,s0,32
    2614:	06100593          	li	a1,97
    2618:	50b71c63          	bne	a4,a1,2b30 <.L37>
    261c:	0b814583          	lbu	a1,184(sp)
    2620:	00060813          	mv	a6,a2
    2624:	03900893          	li	a7,57
    2628:	fb758593          	add	a1,a1,-73
    262c:	0ff5f593          	zext.b	a1,a1

00002630 <.L38>:
    2630:	00084703          	lbu	a4,0(a6)
    2634:	4c071e63          	bnez	a4,2b10 <.L40>
    2638:	4ec56663          	bltu	a0,a2,2b24 <.L41>

0000263c <.L43>:
    263c:	001c0c13          	add	s8,s8,1
    2640:	00050613          	mv	a2,a0
    2644:	00050713          	mv	a4,a0

00002648 <.L42>:
    2648:	000600a3          	sb	zero,1(a2)
    264c:	06700593          	li	a1,103
    2650:	4eb41463          	bne	s0,a1,2b38 <.L44>
    2654:	ffc00593          	li	a1,-4
    2658:	4ebc4863          	blt	s8,a1,2b48 <.L73>
    265c:	4f86c663          	blt	a3,s8,2b48 <.L73>
    2660:	418684b3          	sub	s1,a3,s8

00002664 <.L46>:
    2664:	000c0693          	mv	a3,s8
    2668:	000c5a63          	bgez	s8,267c <.L123>
    266c:	03000693          	li	a3,48
    2670:	fed70fa3          	sb	a3,-1(a4) # 2fff <.L2+0x1b>
    2674:	000c0693          	mv	a3,s8
    2678:	fff70713          	add	a4,a4,-1

0000267c <.L123>:
    267c:	06600593          	li	a1,102
    2680:	4d00006f          	j	2b50 <.L45>

00002684 <.L114>:
    2684:	000b8593          	mv	a1,s7
    2688:	000c0513          	mv	a0,s8
    268c:	0b412023          	sw	s4,160(sp)
    2690:	0b512223          	sw	s5,164(sp)
    2694:	0b612423          	sw	s6,168(sp)
    2698:	0b212623          	sw	s2,172(sp)
    269c:	08012823          	sw	zero,144(sp)
    26a0:	08012a23          	sw	zero,148(sp)
    26a4:	08012c23          	sw	zero,152(sp)
    26a8:	08012e23          	sw	zero,156(sp)
    26ac:	3dd010ef          	jal	4288 <__letf2>
    26b0:	00055a63          	bgez	a0,26c4 <.L14>
    26b4:	02d00793          	li	a5,45
    26b8:	0af10823          	sb	a5,176(sp)
    26bc:	800007b7          	lui	a5,0x80000
    26c0:	0127c933          	xor	s2,a5,s2

000026c4 <.L14>:
    26c4:	00006797          	auipc	a5,0x6
    26c8:	dec78793          	add	a5,a5,-532 # 84b0 <.LC4>
    26cc:	0007a603          	lw	a2,0(a5)
    26d0:	0047a683          	lw	a3,4(a5)
    26d4:	0087a703          	lw	a4,8(a5)
    26d8:	00c7a783          	lw	a5,12(a5)
    26dc:	08010d13          	add	s10,sp,128
    26e0:	08c12023          	sw	a2,128(sp)
    26e4:	000b8593          	mv	a1,s7
    26e8:	000c0513          	mv	a0,s8
    26ec:	000d0613          	mv	a2,s10
    26f0:	08f12623          	sw	a5,140(sp)
    26f4:	09412823          	sw	s4,144(sp)
    26f8:	09512a23          	sw	s5,148(sp)
    26fc:	09612c23          	sw	s6,152(sp)
    2700:	09212e23          	sw	s2,156(sp)
    2704:	08d12223          	sw	a3,132(sp)
    2708:	08e12423          	sw	a4,136(sp)
    270c:	4ad010ef          	jal	43b8 <__multf3>
    2710:	0a012783          	lw	a5,160(sp)
    2714:	000d0593          	mv	a1,s10
    2718:	000b8513          	mv	a0,s7
    271c:	08f12823          	sw	a5,144(sp)
    2720:	0a412783          	lw	a5,164(sp)
    2724:	09412023          	sw	s4,128(sp)
    2728:	09512223          	sw	s5,132(sp)
    272c:	08f12a23          	sw	a5,148(sp)
    2730:	0a812783          	lw	a5,168(sp)
    2734:	09612423          	sw	s6,136(sp)
    2738:	09212623          	sw	s2,140(sp)
    273c:	08f12c23          	sw	a5,152(sp)
    2740:	0ac12783          	lw	a5,172(sp)
    2744:	08f12e23          	sw	a5,156(sp)
    2748:	145010ef          	jal	408c <__eqtf2>
    274c:	b0050ce3          	beqz	a0,2264 <.L9>
    2750:	06100793          	li	a5,97
    2754:	28fc9e63          	bne	s9,a5,29f0 <.L68>
    2758:	01d00793          	li	a5,29
    275c:	02f12623          	sw	a5,44(sp)
    2760:	00800793          	li	a5,8
    2764:	00006717          	auipc	a4,0x6
    2768:	d0c70713          	add	a4,a4,-756 # 8470 <.LC0>
    276c:	02f12423          	sw	a5,40(sp)
    2770:	01000793          	li	a5,16
    2774:	00f12623          	sw	a5,12(sp)
    2778:	00072783          	lw	a5,0(a4)
    277c:	00700c13          	li	s8,7
    2780:	6f018313          	add	t1,gp,1776 # 8130 <exp16_table>
    2784:	00f12c23          	sw	a5,24(sp)
    2788:	00472783          	lw	a5,4(a4)
    278c:	00f12e23          	sw	a5,28(sp)
    2790:	00872783          	lw	a5,8(a4)
    2794:	02f12023          	sw	a5,32(sp)
    2798:	00c72783          	lw	a5,12(a4)
    279c:	00006717          	auipc	a4,0x6
    27a0:	ce470713          	add	a4,a4,-796 # 8480 <.LC1>
    27a4:	02f12223          	sw	a5,36(sp)

000027a8 <.L119>:
    27a8:	00072783          	lw	a5,0(a4)
    27ac:	0c030e13          	add	t3,t1,192
    27b0:	000a0c93          	mv	s9,s4
    27b4:	02f12e23          	sw	a5,60(sp)
    27b8:	00472783          	lw	a5,4(a4)
    27bc:	000a8d13          	mv	s10,s5
    27c0:	000b0d93          	mv	s11,s6
    27c4:	04f12023          	sw	a5,64(sp)
    27c8:	00872783          	lw	a5,8(a4)
    27cc:	00090b93          	mv	s7,s2
    27d0:	04f12223          	sw	a5,68(sp)
    27d4:	00c72783          	lw	a5,12(a4)
    27d8:	04f12423          	sw	a5,72(sp)
    27dc:	000017b7          	lui	a5,0x1
    27e0:	02f12823          	sw	a5,48(sp)
    27e4:	0a010793          	add	a5,sp,160
    27e8:	00f12823          	sw	a5,16(sp)
    27ec:	09010793          	add	a5,sp,144
    27f0:	00f12a23          	sw	a5,20(sp)
    27f4:	08010793          	add	a5,sp,128
    27f8:	04f12623          	sw	a5,76(sp)

000027fc <.L26>:
    27fc:	03c12783          	lw	a5,60(sp)
    2800:	000e2f83          	lw	t6,0(t3)
    2804:	004e2f03          	lw	t5,4(t3)
    2808:	008e2e83          	lw	t4,8(t3)
    280c:	00ce2603          	lw	a2,12(t3)
    2810:	08f12823          	sw	a5,144(sp)
    2814:	04012783          	lw	a5,64(sp)
    2818:	01412583          	lw	a1,20(sp)
    281c:	01012503          	lw	a0,16(sp)
    2820:	08f12a23          	sw	a5,148(sp)
    2824:	04412783          	lw	a5,68(sp)
    2828:	06612623          	sw	t1,108(sp)
    282c:	07f12423          	sw	t6,104(sp)
    2830:	08f12c23          	sw	a5,152(sp)
    2834:	04812783          	lw	a5,72(sp)
    2838:	07e12223          	sw	t5,100(sp)
    283c:	07d12023          	sw	t4,96(sp)
    2840:	05c12e23          	sw	t3,92(sp)
    2844:	04c12c23          	sw	a2,88(sp)
    2848:	0b412023          	sw	s4,160(sp)
    284c:	0b512223          	sw	s5,164(sp)
    2850:	0b612423          	sw	s6,168(sp)
    2854:	0b212623          	sw	s2,172(sp)
    2858:	08f12e23          	sw	a5,156(sp)
    285c:	22d010ef          	jal	4288 <__letf2>
    2860:	05812603          	lw	a2,88(sp)
    2864:	06812f83          	lw	t6,104(sp)
    2868:	06c12303          	lw	t1,108(sp)
    286c:	05c12e03          	lw	t3,92(sp)
    2870:	06012e83          	lw	t4,96(sp)
    2874:	06412f03          	lw	t5,100(sp)
    2878:	08c12623          	sw	a2,140(sp)
    287c:	07c12623          	sw	t3,108(sp)
    2880:	06612423          	sw	t1,104(sp)
    2884:	09912823          	sw	s9,144(sp)
    2888:	09a12a23          	sw	s10,148(sp)
    288c:	09b12c23          	sw	s11,152(sp)
    2890:	09712e23          	sw	s7,156(sp)
    2894:	09f12023          	sw	t6,128(sp)
    2898:	09e12223          	sw	t5,132(sp)
    289c:	09d12423          	sw	t4,136(sp)
    28a0:	04c12603          	lw	a2,76(sp)
    28a4:	01412583          	lw	a1,20(sp)
    28a8:	1a055263          	bgez	a0,2a4c <.L116>
    28ac:	01012503          	lw	a0,16(sp)
    28b0:	309010ef          	jal	43b8 <__multf3>
    28b4:	01812783          	lw	a5,24(sp)
    28b8:	0a012f83          	lw	t6,160(sp)
    28bc:	0a412f03          	lw	t5,164(sp)
    28c0:	08f12823          	sw	a5,144(sp)
    28c4:	01c12783          	lw	a5,28(sp)
    28c8:	0a812e83          	lw	t4,168(sp)
    28cc:	0ac12603          	lw	a2,172(sp)
    28d0:	08f12a23          	sw	a5,148(sp)
    28d4:	02012783          	lw	a5,32(sp)
    28d8:	01412583          	lw	a1,20(sp)
    28dc:	01012503          	lw	a0,16(sp)
    28e0:	08f12c23          	sw	a5,152(sp)
    28e4:	02412783          	lw	a5,36(sp)
    28e8:	07f12223          	sw	t6,100(sp)
    28ec:	07e12023          	sw	t5,96(sp)
    28f0:	05d12e23          	sw	t4,92(sp)
    28f4:	04c12c23          	sw	a2,88(sp)
    28f8:	08f12e23          	sw	a5,156(sp)
    28fc:	18d010ef          	jal	4288 <__letf2>
    2900:	06812303          	lw	t1,104(sp)
    2904:	06c12e03          	lw	t3,108(sp)
    2908:	02055663          	bgez	a0,2934 <.L23>
    290c:	03012783          	lw	a5,48(sp)
    2910:	40fc0c33          	sub	s8,s8,a5

00002914 <.L120>:
    2914:	06412f83          	lw	t6,100(sp)
    2918:	06012f03          	lw	t5,96(sp)
    291c:	05c12e83          	lw	t4,92(sp)
    2920:	05812603          	lw	a2,88(sp)
    2924:	000f8c93          	mv	s9,t6
    2928:	000f0d13          	mv	s10,t5
    292c:	000e8d93          	mv	s11,t4
    2930:	00060b93          	mv	s7,a2

00002934 <.L23>:
    2934:	03012783          	lw	a5,48(sp)
    2938:	ff0e0613          	add	a2,t3,-16
    293c:	4017d793          	sra	a5,a5,0x1
    2940:	02f12823          	sw	a5,48(sp)
    2944:	11c31063          	bne	t1,t3,2a44 <.L69>
    2948:	01812783          	lw	a5,24(sp)
    294c:	0a010913          	add	s2,sp,160
    2950:	09010593          	add	a1,sp,144
    2954:	08f12823          	sw	a5,144(sp)
    2958:	01c12783          	lw	a5,28(sp)
    295c:	00090513          	mv	a0,s2
    2960:	00612a23          	sw	t1,20(sp)
    2964:	08f12a23          	sw	a5,148(sp)
    2968:	02012783          	lw	a5,32(sp)
    296c:	0b912023          	sw	s9,160(sp)
    2970:	0ba12223          	sw	s10,164(sp)
    2974:	08f12c23          	sw	a5,152(sp)
    2978:	02412783          	lw	a5,36(sp)
    297c:	0bb12423          	sw	s11,168(sp)
    2980:	0b712623          	sw	s7,172(sp)
    2984:	08f12e23          	sw	a5,156(sp)
    2988:	00b12823          	sw	a1,16(sp)
    298c:	7cc010ef          	jal	4158 <__getf2>
    2990:	b00542e3          	bltz	a0,2494 <.L13>
    2994:	01412303          	lw	t1,20(sp)
    2998:	09912823          	sw	s9,144(sp)
    299c:	09a12a23          	sw	s10,148(sp)
    29a0:	09b12c23          	sw	s11,152(sp)
    29a4:	09712e23          	sw	s7,156(sp)
    29a8:	00032703          	lw	a4,0(t1)
    29ac:	01012583          	lw	a1,16(sp)
    29b0:	08010613          	add	a2,sp,128
    29b4:	08e12023          	sw	a4,128(sp)
    29b8:	00432703          	lw	a4,4(t1)
    29bc:	00090513          	mv	a0,s2
    29c0:	001c0c13          	add	s8,s8,1
    29c4:	08e12223          	sw	a4,132(sp)
    29c8:	00832703          	lw	a4,8(t1)
    29cc:	08e12423          	sw	a4,136(sp)
    29d0:	00c32703          	lw	a4,12(t1)
    29d4:	08e12623          	sw	a4,140(sp)
    29d8:	121000ef          	jal	32f8 <__divtf3>
    29dc:	0a012c83          	lw	s9,160(sp)
    29e0:	0a412d03          	lw	s10,164(sp)
    29e4:	0a812d83          	lw	s11,168(sp)
    29e8:	0ac12b83          	lw	s7,172(sp)
    29ec:	aa9ff06f          	j	2494 <.L13>

000029f0 <.L68>:
    29f0:	02400793          	li	a5,36
    29f4:	02f12623          	sw	a5,44(sp)
    29f8:	00900793          	li	a5,9
    29fc:	00006717          	auipc	a4,0x6
    2a00:	a9470713          	add	a4,a4,-1388 # 8490 <.LC2>
    2a04:	02f12423          	sw	a5,40(sp)
    2a08:	00a00793          	li	a5,10
    2a0c:	00f12623          	sw	a5,12(sp)
    2a10:	00072783          	lw	a5,0(a4)
    2a14:	00800c13          	li	s8,8
    2a18:	7c018313          	add	t1,gp,1984 # 8200 <exp10_table>
    2a1c:	00f12c23          	sw	a5,24(sp)
    2a20:	00472783          	lw	a5,4(a4)
    2a24:	00f12e23          	sw	a5,28(sp)
    2a28:	00872783          	lw	a5,8(a4)
    2a2c:	02f12023          	sw	a5,32(sp)
    2a30:	00c72783          	lw	a5,12(a4)
    2a34:	00006717          	auipc	a4,0x6
    2a38:	a6c70713          	add	a4,a4,-1428 # 84a0 <.LC3>
    2a3c:	02f12223          	sw	a5,36(sp)
    2a40:	d69ff06f          	j	27a8 <.L119>

00002a44 <.L69>:
    2a44:	00060e13          	mv	t3,a2
    2a48:	db5ff06f          	j	27fc <.L26>

00002a4c <.L116>:
    2a4c:	01012503          	lw	a0,16(sp)
    2a50:	0a9000ef          	jal	32f8 <__divtf3>
    2a54:	03c12783          	lw	a5,60(sp)
    2a58:	0a012f83          	lw	t6,160(sp)
    2a5c:	0a412f03          	lw	t5,164(sp)
    2a60:	08f12823          	sw	a5,144(sp)
    2a64:	04012783          	lw	a5,64(sp)
    2a68:	0a812e83          	lw	t4,168(sp)
    2a6c:	0ac12603          	lw	a2,172(sp)
    2a70:	08f12a23          	sw	a5,148(sp)
    2a74:	04412783          	lw	a5,68(sp)
    2a78:	01412583          	lw	a1,20(sp)
    2a7c:	01012503          	lw	a0,16(sp)
    2a80:	08f12c23          	sw	a5,152(sp)
    2a84:	04812783          	lw	a5,72(sp)
    2a88:	07f12223          	sw	t6,100(sp)
    2a8c:	07e12023          	sw	t5,96(sp)
    2a90:	05d12e23          	sw	t4,92(sp)
    2a94:	04c12c23          	sw	a2,88(sp)
    2a98:	08f12e23          	sw	a5,156(sp)
    2a9c:	6bc010ef          	jal	4158 <__getf2>
    2aa0:	06812303          	lw	t1,104(sp)
    2aa4:	06c12e03          	lw	t3,108(sp)
    2aa8:	e80546e3          	bltz	a0,2934 <.L23>
    2aac:	03012783          	lw	a5,48(sp)
    2ab0:	00fc0c33          	add	s8,s8,a5
    2ab4:	e61ff06f          	j	2914 <.L120>

00002ab8 <.L31>:
    2ab8:	06600713          	li	a4,102
    2abc:	00048693          	mv	a3,s1
    2ac0:	b0e414e3          	bne	s0,a4,25c8 <.L32>
    2ac4:	009c06b3          	add	a3,s8,s1
    2ac8:	fff00713          	li	a4,-1
    2acc:	aee6dee3          	bge	a3,a4,25c8 <.L32>
    2ad0:	02400613          	li	a2,36
    2ad4:	03000593          	li	a1,48
    2ad8:	0c810513          	add	a0,sp,200
    2adc:	a85fe0ef          	jal	1560 <__GI_memset>
    2ae0:	fff00c13          	li	s8,-1
    2ae4:	fff00693          	li	a3,-1
    2ae8:	ae1ff06f          	j	25c8 <.L32>

00002aec <.L33>:
    2aec:	00c12783          	lw	a5,12(sp)
    2af0:	00268613          	add	a2,a3,2
    2af4:	00c50633          	add	a2,a0,a2
    2af8:	00064583          	lbu	a1,0(a2)
    2afc:	0017d713          	srl	a4,a5,0x1
    2b00:	03070713          	add	a4,a4,48
    2b04:	00e5b5b3          	sltu	a1,a1,a4
    2b08:	0015b593          	seqz	a1,a1
    2b0c:	addff06f          	j	25e8 <.L34>

00002b10 <.L40>:
    2b10:	00e8f663          	bgeu	a7,a4,2b1c <.L39>
    2b14:	00b70733          	add	a4,a4,a1
    2b18:	00e80023          	sb	a4,0(a6)

00002b1c <.L39>:
    2b1c:	fff80813          	add	a6,a6,-1
    2b20:	b11ff06f          	j	2630 <.L38>

00002b24 <.L41>:
    2b24:	002c1c13          	sll	s8,s8,0x2

00002b28 <.L121>:
    2b28:	0ca10713          	add	a4,sp,202
    2b2c:	b1dff06f          	j	2648 <.L42>

00002b30 <.L37>:
    2b30:	b0c576e3          	bgeu	a0,a2,263c <.L43>
    2b34:	ff5ff06f          	j	2b28 <.L121>

00002b38 <.L44>:
    2b38:	06600693          	li	a3,102
    2b3c:	b2d404e3          	beq	s0,a3,2664 <.L46>
    2b40:	00040593          	mv	a1,s0
    2b44:	0080006f          	j	2b4c <.L122>

00002b48 <.L73>:
    2b48:	06700593          	li	a1,103

00002b4c <.L122>:
    2b4c:	00000693          	li	a3,0

00002b50 <.L45>:
    2b50:	00074883          	lbu	a7,0(a4)
    2b54:	00100513          	li	a0,1
    2b58:	0b000813          	li	a6,176
    2b5c:	10a12023          	sw	a0,256(sp)
    2b60:	0b410513          	add	a0,sp,180
    2b64:	10a12223          	sw	a0,260(sp)
    2b68:	0f012e23          	sw	a6,252(sp)
    2b6c:	0b110a23          	sb	a7,180(sp)
    2b70:	0a010aa3          	sb	zero,181(sp)
    2b74:	00170513          	add	a0,a4,1
    2b78:	10810913          	add	s2,sp,264
    2b7c:	40e60733          	sub	a4,a2,a4
    2b80:	0406c063          	bltz	a3,2bc0 <.L47>
    2b84:	07000613          	li	a2,112
    2b88:	10c12423          	sw	a2,264(sp)
    2b8c:	10a12823          	sw	a0,272(sp)
    2b90:	16e6c863          	blt	a3,a4,2d00 <.L48>
    2b94:	10e12623          	sw	a4,268(sp)
    2b98:	40e68733          	sub	a4,a3,a4
    2b9c:	16070a63          	beqz	a4,2d10 <.L77>
    2ba0:	10e12c23          	sw	a4,280(sp)
    2ba4:	00005717          	auipc	a4,0x5
    2ba8:	72f70713          	add	a4,a4,1839 # 82d3 <fmt+0x3>
    2bac:	10e12e23          	sw	a4,284(sp)
    2bb0:	11012a23          	sw	a6,276(sp)
    2bb4:	00000713          	li	a4,0
    2bb8:	12010913          	add	s2,sp,288

00002bbc <.L78>:
    2bbc:	fff00693          	li	a3,-1

00002bc0 <.L47>:
    2bc0:	00c9a603          	lw	a2,12(s3)
    2bc4:	01067613          	and	a2,a2,16
    2bc8:	00c76833          	or	a6,a4,a2
    2bcc:	00081c63          	bnez	a6,2be4 <.L49>
    2bd0:	06700813          	li	a6,103
    2bd4:	03040863          	beq	s0,a6,2c04 <.L50>
    2bd8:	06100813          	li	a6,97
    2bdc:	03040463          	beq	s0,a6,2c04 <.L50>
    2be0:	02048263          	beqz	s1,2c04 <.L50>

00002be4 <.L49>:
    2be4:	07000813          	li	a6,112
    2be8:	01092023          	sw	a6,0(s2)
    2bec:	00100813          	li	a6,1
    2bf0:	01092223          	sw	a6,4(s2)
    2bf4:	00005817          	auipc	a6,0x5
    2bf8:	6ec80813          	add	a6,a6,1772 # 82e0 <fmt+0x10>
    2bfc:	01092423          	sw	a6,8(s2)
    2c00:	00c90913          	add	s2,s2,12

00002c04 <.L50>:
    2c04:	00168813          	add	a6,a3,1
    2c08:	02080263          	beqz	a6,2c2c <.L51>
    2c0c:	fff6c693          	not	a3,a3
    2c10:	00d92223          	sw	a3,4(s2)
    2c14:	0b000893          	li	a7,176
    2c18:	00005697          	auipc	a3,0x5
    2c1c:	6bb68693          	add	a3,a3,1723 # 82d3 <fmt+0x3>
    2c20:	01192023          	sw	a7,0(s2)
    2c24:	00d92423          	sw	a3,8(s2)
    2c28:	00c90913          	add	s2,s2,12

00002c2c <.L51>:
    2c2c:	00070c63          	beqz	a4,2c44 <.L52>
    2c30:	07000693          	li	a3,112
    2c34:	00d92023          	sw	a3,0(s2)
    2c38:	00e92223          	sw	a4,4(s2)
    2c3c:	00a92423          	sw	a0,8(s2)
    2c40:	00c90913          	add	s2,s2,12

00002c44 <.L52>:
    2c44:	06700693          	li	a3,103
    2c48:	00d41463          	bne	s0,a3,2c50 <.L53>
    2c4c:	02060a63          	beqz	a2,2c80 <.L54>

00002c50 <.L53>:
    2c50:	03412783          	lw	a5,52(sp)
    2c54:	02079663          	bnez	a5,2c80 <.L54>
    2c58:	41070733          	sub	a4,a4,a6
    2c5c:	02975263          	bge	a4,s1,2c80 <.L54>
    2c60:	40e484b3          	sub	s1,s1,a4
    2c64:	0b000693          	li	a3,176
    2c68:	00005717          	auipc	a4,0x5
    2c6c:	66b70713          	add	a4,a4,1643 # 82d3 <fmt+0x3>
    2c70:	00d92023          	sw	a3,0(s2)
    2c74:	00992223          	sw	s1,4(s2)
    2c78:	00e92423          	sw	a4,8(s2)
    2c7c:	00c90913          	add	s2,s2,12

00002c80 <.L54>:
    2c80:	06600713          	li	a4,102
    2c84:	e2e58463          	beq	a1,a4,22ac <.L19>
    2c88:	06100713          	li	a4,97
    2c8c:	0b814e03          	lbu	t3,184(sp)
    2c90:	00300893          	li	a7,3
    2c94:	00e40463          	beq	s0,a4,2c9c <.L55>
    2c98:	00400893          	li	a7,4

00002c9c <.L55>:
    2c9c:	02b00813          	li	a6,43
    2ca0:	000c5663          	bgez	s8,2cac <.L56>
    2ca4:	41800c33          	neg	s8,s8
    2ca8:	02d00813          	li	a6,45

00002cac <.L56>:
    2cac:	0c0103a3          	sb	zero,199(sp)
    2cb0:	00200693          	li	a3,2
    2cb4:	0c710713          	add	a4,sp,199
    2cb8:	00a00313          	li	t1,10

00002cbc <.L57>:
    2cbc:	026c6533          	rem	a0,s8,t1
    2cc0:	00168693          	add	a3,a3,1
    2cc4:	fff70613          	add	a2,a4,-1
    2cc8:	03050513          	add	a0,a0,48
    2ccc:	fea70fa3          	sb	a0,-1(a4)
    2cd0:	026c4c33          	div	s8,s8,t1
    2cd4:	0516c263          	blt	a3,a7,2d18 <.L81>
    2cd8:	040c1263          	bnez	s8,2d1c <.L58>
    2cdc:	07000793          	li	a5,112
    2ce0:	ffd70713          	add	a4,a4,-3
    2ce4:	00f92023          	sw	a5,0(s2)
    2ce8:	00d92223          	sw	a3,4(s2)
    2cec:	00e92423          	sw	a4,8(s2)
    2cf0:	ff060fa3          	sb	a6,-1(a2)
    2cf4:	ffc60f23          	sb	t3,-2(a2)
    2cf8:	00c90913          	add	s2,s2,12
    2cfc:	db0ff06f          	j	22ac <.L19>

00002d00 <.L48>:
    2d00:	ea068ee3          	beqz	a3,2bbc <.L78>
    2d04:	10d12623          	sw	a3,268(sp)
    2d08:	00d50533          	add	a0,a0,a3
    2d0c:	40d70733          	sub	a4,a4,a3

00002d10 <.L77>:
    2d10:	11410913          	add	s2,sp,276
    2d14:	ea9ff06f          	j	2bbc <.L78>

00002d18 <.L81>:
    2d18:	00300693          	li	a3,3

00002d1c <.L58>:
    2d1c:	00060713          	mv	a4,a2
    2d20:	f9dff06f          	j	2cbc <.L57>

00002d24 <.L62>:
    2d24:	0109a603          	lw	a2,16(s3)
    2d28:	03000693          	li	a3,48
    2d2c:	0f412703          	lw	a4,244(sp)
    2d30:	00d61a63          	bne	a2,a3,2d44 <.L64>
    2d34:	10012703          	lw	a4,256(sp)
    2d38:	00f707b3          	add	a5,a4,a5
    2d3c:	10f12023          	sw	a5,256(sp)
    2d40:	e18ff06f          	j	2358 <.L63>

00002d44 <.L64>:
    2d44:	00e787b3          	add	a5,a5,a4
    2d48:	0ef12a23          	sw	a5,244(sp)
    2d4c:	e0cff06f          	j	2358 <.L63>

00002d50 <.L82>:
    2d50:	fff00493          	li	s1,-1
    2d54:	e38ff06f          	j	238c <.L1>

00002d58 <__GI_memchr>:
    2d58:	0ff5f793          	zext.b	a5,a1

00002d5c <.L2>:
    2d5c:	00060663          	beqz	a2,2d68 <.L4>
    2d60:	00357713          	and	a4,a0,3
    2d64:	02071c63          	bnez	a4,2d9c <.L5>

00002d68 <.L4>:
    2d68:	01010737          	lui	a4,0x1010
    2d6c:	0ff5f593          	zext.b	a1,a1
    2d70:	10170713          	add	a4,a4,257 # 1010101 <_ebss+0x1002561>
    2d74:	02e585b3          	mul	a1,a1,a4
    2d78:	7eff0837          	lui	a6,0x7eff0
    2d7c:	00300313          	li	t1,3
    2d80:	eff80813          	add	a6,a6,-257 # 7efefeff <_ebss+0x7efe235f>
    2d84:	fff00e13          	li	t3,-1

00002d88 <.L6>:
    2d88:	02c36463          	bltu	t1,a2,2db0 <.L10>
    2d8c:	00c50633          	add	a2,a0,a2

00002d90 <.L11>:
    2d90:	08c51063          	bne	a0,a2,2e10 <.L12>
    2d94:	00000513          	li	a0,0

00002d98 <.L1>:
    2d98:	00008067          	ret

00002d9c <.L5>:
    2d9c:	00054703          	lbu	a4,0(a0)
    2da0:	fef70ce3          	beq	a4,a5,2d98 <.L1>
    2da4:	fff60613          	add	a2,a2,-1
    2da8:	00150513          	add	a0,a0,1
    2dac:	fb1ff06f          	j	2d5c <.L2>

00002db0 <.L10>:
    2db0:	00052883          	lw	a7,0(a0)
    2db4:	00450713          	add	a4,a0,4
    2db8:	0115c8b3          	xor	a7,a1,a7
    2dbc:	010886b3          	add	a3,a7,a6
    2dc0:	0116c6b3          	xor	a3,a3,a7
    2dc4:	0106e6b3          	or	a3,a3,a6
    2dc8:	03c68e63          	beq	a3,t3,2e04 <.L7>
    2dcc:	ffc74683          	lbu	a3,-4(a4)
    2dd0:	fcf684e3          	beq	a3,a5,2d98 <.L1>
    2dd4:	ffd74683          	lbu	a3,-3(a4)
    2dd8:	00f69663          	bne	a3,a5,2de4 <.L8>
    2ddc:	00150513          	add	a0,a0,1
    2de0:	00008067          	ret

00002de4 <.L8>:
    2de4:	ffe74683          	lbu	a3,-2(a4)
    2de8:	00f69663          	bne	a3,a5,2df4 <.L9>
    2dec:	00250513          	add	a0,a0,2
    2df0:	00008067          	ret

00002df4 <.L9>:
    2df4:	fff74683          	lbu	a3,-1(a4)
    2df8:	00f69663          	bne	a3,a5,2e04 <.L7>
    2dfc:	00350513          	add	a0,a0,3
    2e00:	00008067          	ret

00002e04 <.L7>:
    2e04:	ffc60613          	add	a2,a2,-4
    2e08:	00070513          	mv	a0,a4
    2e0c:	f7dff06f          	j	2d88 <.L6>

00002e10 <.L12>:
    2e10:	00054703          	lbu	a4,0(a0)
    2e14:	f8f702e3          	beq	a4,a5,2d98 <.L1>
    2e18:	00150513          	add	a0,a0,1
    2e1c:	f75ff06f          	j	2d90 <.L11>

00002e20 <__GI_mempcpy>:
    2e20:	ff010113          	add	sp,sp,-16
    2e24:	00812423          	sw	s0,8(sp)
    2e28:	00912223          	sw	s1,4(sp)
    2e2c:	00112623          	sw	ra,12(sp)
    2e30:	00050493          	mv	s1,a0
    2e34:	00060413          	mv	s0,a2
    2e38:	c80fe0ef          	jal	12b8 <__GI_memcpy>
    2e3c:	00848533          	add	a0,s1,s0
    2e40:	00c12083          	lw	ra,12(sp)
    2e44:	00812403          	lw	s0,8(sp)
    2e48:	00412483          	lw	s1,4(sp)
    2e4c:	01010113          	add	sp,sp,16
    2e50:	00008067          	ret

00002e54 <__GI_memrchr>:
    2e54:	0ff5f793          	zext.b	a5,a1
    2e58:	00c50533          	add	a0,a0,a2

00002e5c <.L2>:
    2e5c:	00060663          	beqz	a2,2e68 <.L4>
    2e60:	00357713          	and	a4,a0,3
    2e64:	02071e63          	bnez	a4,2ea0 <.L5>

00002e68 <.L4>:
    2e68:	01010737          	lui	a4,0x1010
    2e6c:	0ff5f593          	zext.b	a1,a1
    2e70:	10170713          	add	a4,a4,257 # 1010101 <_ebss+0x1002561>
    2e74:	02e585b3          	mul	a1,a1,a4
    2e78:	7eff0837          	lui	a6,0x7eff0
    2e7c:	00050693          	mv	a3,a0
    2e80:	00300313          	li	t1,3
    2e84:	eff80813          	add	a6,a6,-257 # 7efefeff <_ebss+0x7efe235f>
    2e88:	fff00e13          	li	t3,-1

00002e8c <.L6>:
    2e8c:	02c36463          	bltu	t1,a2,2eb4 <.L11>
    2e90:	40c50633          	sub	a2,a0,a2

00002e94 <.L12>:
    2e94:	08c51063          	bne	a0,a2,2f14 <.L13>
    2e98:	00000513          	li	a0,0
    2e9c:	00008067          	ret

00002ea0 <.L5>:
    2ea0:	fff54703          	lbu	a4,-1(a0)
    2ea4:	fff50513          	add	a0,a0,-1
    2ea8:	06f70c63          	beq	a4,a5,2f20 <.L1>
    2eac:	fff60613          	add	a2,a2,-1
    2eb0:	fadff06f          	j	2e5c <.L2>

00002eb4 <.L11>:
    2eb4:	ffc52883          	lw	a7,-4(a0)
    2eb8:	ffc50513          	add	a0,a0,-4
    2ebc:	0115c8b3          	xor	a7,a1,a7
    2ec0:	01088733          	add	a4,a7,a6
    2ec4:	01174733          	xor	a4,a4,a7
    2ec8:	01076733          	or	a4,a4,a6
    2ecc:	03c70e63          	beq	a4,t3,2f08 <.L7>
    2ed0:	00354703          	lbu	a4,3(a0)
    2ed4:	00f71663          	bne	a4,a5,2ee0 <.L8>
    2ed8:	fff68513          	add	a0,a3,-1
    2edc:	00008067          	ret

00002ee0 <.L8>:
    2ee0:	00254703          	lbu	a4,2(a0)
    2ee4:	00f71663          	bne	a4,a5,2ef0 <.L9>
    2ee8:	ffe68513          	add	a0,a3,-2
    2eec:	00008067          	ret

00002ef0 <.L9>:
    2ef0:	00154703          	lbu	a4,1(a0)
    2ef4:	00f71663          	bne	a4,a5,2f00 <.L10>
    2ef8:	ffd68513          	add	a0,a3,-3
    2efc:	00008067          	ret

00002f00 <.L10>:
    2f00:	00054703          	lbu	a4,0(a0)
    2f04:	00f70e63          	beq	a4,a5,2f20 <.L1>

00002f08 <.L7>:
    2f08:	ffc60613          	add	a2,a2,-4
    2f0c:	00050693          	mv	a3,a0
    2f10:	f7dff06f          	j	2e8c <.L6>

00002f14 <.L13>:
    2f14:	fff54703          	lbu	a4,-1(a0)
    2f18:	fff50513          	add	a0,a0,-1
    2f1c:	f6f71ce3          	bne	a4,a5,2e94 <.L12>

00002f20 <.L1>:
    2f20:	00008067          	ret

00002f24 <__GI_strrchr>:
    2f24:	ff010113          	add	sp,sp,-16
    2f28:	00812423          	sw	s0,8(sp)
    2f2c:	00112623          	sw	ra,12(sp)
    2f30:	00912223          	sw	s1,4(sp)
    2f34:	0ff5f413          	zext.b	s0,a1
    2f38:	04041663          	bnez	s0,2f84 <.L6>
    2f3c:	00812403          	lw	s0,8(sp)
    2f40:	00c12083          	lw	ra,12(sp)
    2f44:	00412483          	lw	s1,4(sp)
    2f48:	00000593          	li	a1,0
    2f4c:	01010113          	add	sp,sp,16
    2f50:	28c0006f          	j	31dc <__GI_strchr>

00002f54 <.L3>:
    2f54:	00150793          	add	a5,a0,1
    2f58:	00050493          	mv	s1,a0

00002f5c <.L2>:
    2f5c:	00040593          	mv	a1,s0
    2f60:	00078513          	mv	a0,a5
    2f64:	278000ef          	jal	31dc <__GI_strchr>
    2f68:	fe0516e3          	bnez	a0,2f54 <.L3>
    2f6c:	00c12083          	lw	ra,12(sp)
    2f70:	00812403          	lw	s0,8(sp)
    2f74:	00048513          	mv	a0,s1
    2f78:	00412483          	lw	s1,4(sp)
    2f7c:	01010113          	add	sp,sp,16
    2f80:	00008067          	ret

00002f84 <.L6>:
    2f84:	00050793          	mv	a5,a0
    2f88:	00000493          	li	s1,0
    2f8c:	fd1ff06f          	j	2f5c <.L2>

00002f90 <__GI_exit>:
    2f90:	ff010113          	add	sp,sp,-16
    2f94:	00812423          	sw	s0,8(sp)
    2f98:	00008717          	auipc	a4,0x8
    2f9c:	fc872703          	lw	a4,-56(a4) # af60 <__exit_cleanup>
    2fa0:	00112623          	sw	ra,12(sp)
    2fa4:	00070793          	mv	a5,a4
    2fa8:	00050413          	mv	s0,a0
    2fac:	00078463          	beqz	a5,2fb4 <.L2>
    2fb0:	000700e7          	jalr	a4

00002fb4 <.L2>:
    2fb4:	9a5fe0ef          	jal	1958 <__uClibc_fini>
    2fb8:	00004717          	auipc	a4,0x4
    2fbc:	24872703          	lw	a4,584(a4) # 7200 <.LLST53+0x3>
    2fc0:	00070793          	mv	a5,a4
    2fc4:	00078463          	beqz	a5,2fcc <.L3>
    2fc8:	000700e7          	jalr	a4

00002fcc <.L3>:
    2fcc:	00040513          	mv	a0,s0
    2fd0:	004000ef          	jal	2fd4 <__GI__exit>

00002fd4 <__GI__exit>:
    2fd4:	00050713          	mv	a4,a0
    2fd8:	fffff637          	lui	a2,0xfffff
    2fdc:	00004697          	auipc	a3,0x4
    2fe0:	1f86a683          	lw	a3,504(a3) # 71d4 <_GLOBAL_OFFSET_TABLE_+0xc>

00002fe4 <.L2>:
    2fe4:	00070513          	mv	a0,a4
    2fe8:	05d00893          	li	a7,93
    2fec:	00000073          	ecall
    2ff0:	fea67ae3          	bgeu	a2,a0,2fe4 <.L2>
    2ff4:	40a007b3          	neg	a5,a0
    2ff8:	00f6a023          	sw	a5,0(a3)
    2ffc:	fe9ff06f          	j	2fe4 <.L2>

00003000 <__GI_write>:
    3000:	04000893          	li	a7,64
    3004:	00000073          	ecall
    3008:	fffff7b7          	lui	a5,0xfffff
    300c:	00a7fc63          	bgeu	a5,a0,3024 <.L1>
    3010:	40a00533          	neg	a0,a0
    3014:	00004797          	auipc	a5,0x4
    3018:	1c07a783          	lw	a5,448(a5) # 71d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    301c:	00a7a023          	sw	a0,0(a5)
    3020:	fff00513          	li	a0,-1

00003024 <.L1>:
    3024:	00008067          	ret

00003028 <__GI_fseek>:
    3028:	00060693          	mv	a3,a2
    302c:	41f5d613          	sra	a2,a1,0x1f
    3030:	0040006f          	j	3034 <__GI_fseeko64>

00003034 <__GI_fseeko64>:
    3034:	fd010113          	add	sp,sp,-48
    3038:	02112623          	sw	ra,44(sp)
    303c:	02812423          	sw	s0,40(sp)
    3040:	00b12c23          	sw	a1,24(sp)
    3044:	00c12e23          	sw	a2,28(sp)
    3048:	00200793          	li	a5,2
    304c:	02d7f463          	bgeu	a5,a3,3074 <.L2>
    3050:	00004797          	auipc	a5,0x4
    3054:	1847a783          	lw	a5,388(a5) # 71d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    3058:	01600713          	li	a4,22
    305c:	00e7a023          	sw	a4,0(a5)

00003060 <.L3>:
    3060:	fff00513          	li	a0,-1

00003064 <.L1>:
    3064:	02c12083          	lw	ra,44(sp)
    3068:	02812403          	lw	s0,40(sp)
    306c:	03010113          	add	sp,sp,48
    3070:	00008067          	ret

00003074 <.L2>:
    3074:	00055783          	lhu	a5,0(a0)
    3078:	00050413          	mv	s0,a0
    307c:	00068613          	mv	a2,a3
    3080:	0407f793          	and	a5,a5,64
    3084:	06079863          	bnez	a5,30f4 <.L4>

00003088 <.L7>:
    3088:	00100793          	li	a5,1
    308c:	00f61e63          	bne	a2,a5,30a8 <.L5>
    3090:	01810593          	add	a1,sp,24
    3094:	00040513          	mv	a0,s0
    3098:	00c12623          	sw	a2,12(sp)
    309c:	07c000ef          	jal	3118 <__stdio_adjust_position>
    30a0:	00c12603          	lw	a2,12(sp)
    30a4:	fa054ee3          	bltz	a0,3060 <.L3>

000030a8 <.L5>:
    30a8:	00442703          	lw	a4,4(s0)
    30ac:	ffe00793          	li	a5,-2
    30b0:	04f71c63          	bne	a4,a5,3108 <.L20>
    30b4:	03042783          	lw	a5,48(s0)
    30b8:	fa0784e3          	beqz	a5,3060 <.L3>
    30bc:	02442503          	lw	a0,36(s0)
    30c0:	01810593          	add	a1,sp,24
    30c4:	000780e7          	jalr	a5

000030c8 <.L12>:
    30c8:	f8054ce3          	bltz	a0,3060 <.L3>
    30cc:	00045783          	lhu	a5,0(s0)
    30d0:	00000513          	li	a0,0
    30d4:	fb87f793          	and	a5,a5,-72
    30d8:	00f41023          	sh	a5,0(s0)
    30dc:	00842783          	lw	a5,8(s0)
    30e0:	00f42823          	sw	a5,16(s0)
    30e4:	00f42a23          	sw	a5,20(s0)
    30e8:	00f42c23          	sw	a5,24(s0)
    30ec:	00f42e23          	sw	a5,28(s0)
    30f0:	f75ff06f          	j	3064 <.L1>

000030f4 <.L4>:
    30f4:	00d12623          	sw	a3,12(sp)
    30f8:	954fd0ef          	jal	24c <__stdio_wcommit>
    30fc:	00c12603          	lw	a2,12(sp)
    3100:	f80504e3          	beqz	a0,3088 <.L7>
    3104:	f5dff06f          	j	3060 <.L3>

00003108 <.L20>:
    3108:	01810593          	add	a1,sp,24
    310c:	00040513          	mv	a0,s0
    3110:	088000ef          	jal	3198 <__stdio_seek>
    3114:	fb5ff06f          	j	30c8 <.L12>

00003118 <__stdio_adjust_position>:
    3118:	00055783          	lhu	a5,0(a0)
    311c:	00000713          	li	a4,0
    3120:	0037f693          	and	a3,a5,3
    3124:	00068463          	beqz	a3,312c <.L2>
    3128:	fff68713          	add	a4,a3,-1

0000312c <.L2>:
    312c:	0407f793          	and	a5,a5,64
    3130:	06078063          	beqz	a5,3190 <.L3>
    3134:	00852783          	lw	a5,8(a0)

00003138 <.L4>:
    3138:	01052683          	lw	a3,16(a0)
    313c:	0045a603          	lw	a2,4(a1)
    3140:	40d78533          	sub	a0,a5,a3
    3144:	00e50533          	add	a0,a0,a4
    3148:	0005a703          	lw	a4,0(a1)
    314c:	41f55793          	sra	a5,a0,0x1f
    3150:	40f607b3          	sub	a5,a2,a5
    3154:	40a706b3          	sub	a3,a4,a0
    3158:	00d73833          	sltu	a6,a4,a3
    315c:	410787b3          	sub	a5,a5,a6
    3160:	00d5a023          	sw	a3,0(a1)
    3164:	00f5a223          	sw	a5,4(a1)
    3168:	00f64663          	blt	a2,a5,3174 <.L9>
    316c:	00c79663          	bne	a5,a2,3178 <.L5>
    3170:	00d77463          	bgeu	a4,a3,3178 <.L5>

00003174 <.L9>:
    3174:	40a00533          	neg	a0,a0

00003178 <.L5>:
    3178:	00055a63          	bgez	a0,318c <.L1>
    317c:	00004797          	auipc	a5,0x4
    3180:	0587a783          	lw	a5,88(a5) # 71d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    3184:	04b00713          	li	a4,75
    3188:	00e7a023          	sw	a4,0(a5)

0000318c <.L1>:
    318c:	00008067          	ret

00003190 <.L3>:
    3190:	01452783          	lw	a5,20(a0)
    3194:	fa5ff06f          	j	3138 <.L4>

00003198 <__stdio_seek>:
    3198:	ff010113          	add	sp,sp,-16
    319c:	00812423          	sw	s0,8(sp)
    31a0:	00058413          	mv	s0,a1
    31a4:	00060693          	mv	a3,a2
    31a8:	0005a583          	lw	a1,0(a1)
    31ac:	00442603          	lw	a2,4(s0)
    31b0:	00452503          	lw	a0,4(a0)
    31b4:	00112623          	sw	ra,12(sp)
    31b8:	0e0000ef          	jal	3298 <__GI_lseek64>
    31bc:	0005c863          	bltz	a1,31cc <.L1>
    31c0:	00a42023          	sw	a0,0(s0)
    31c4:	00b42223          	sw	a1,4(s0)
    31c8:	00000513          	li	a0,0

000031cc <.L1>:
    31cc:	00c12083          	lw	ra,12(sp)
    31d0:	00812403          	lw	s0,8(sp)
    31d4:	01010113          	add	sp,sp,16
    31d8:	00008067          	ret

000031dc <__GI_strchr>:
    31dc:	0ff5f693          	zext.b	a3,a1

000031e0 <.L2>:
    31e0:	00357793          	and	a5,a0,3
    31e4:	06079263          	bnez	a5,3248 <.L4>
    31e8:	010107b7          	lui	a5,0x1010
    31ec:	0ff5f593          	zext.b	a1,a1
    31f0:	10178793          	add	a5,a5,257 # 1010101 <_ebss+0x1002561>
    31f4:	02f585b3          	mul	a1,a1,a5
    31f8:	7eff0637          	lui	a2,0x7eff0
    31fc:	eff60613          	add	a2,a2,-257 # 7efefeff <_ebss+0x7efe235f>
    3200:	fff00313          	li	t1,-1

00003204 <.L5>:
    3204:	00052803          	lw	a6,0(a0)
    3208:	00450713          	add	a4,a0,4
    320c:	0105c8b3          	xor	a7,a1,a6
    3210:	00c807b3          	add	a5,a6,a2
    3214:	0107c7b3          	xor	a5,a5,a6
    3218:	00c88833          	add	a6,a7,a2
    321c:	01184833          	xor	a6,a6,a7
    3220:	0107f7b3          	and	a5,a5,a6
    3224:	00c7e7b3          	or	a5,a5,a2
    3228:	02678a63          	beq	a5,t1,325c <.L6>
    322c:	ffc74783          	lbu	a5,-4(a4)
    3230:	06d78263          	beq	a5,a3,3294 <.L1>
    3234:	04078e63          	beqz	a5,3290 <.L13>
    3238:	ffd74783          	lbu	a5,-3(a4)
    323c:	02d79463          	bne	a5,a3,3264 <.L7>
    3240:	00150513          	add	a0,a0,1
    3244:	00008067          	ret

00003248 <.L4>:
    3248:	00054783          	lbu	a5,0(a0)
    324c:	04d78463          	beq	a5,a3,3294 <.L1>
    3250:	04078063          	beqz	a5,3290 <.L13>
    3254:	00150513          	add	a0,a0,1
    3258:	f89ff06f          	j	31e0 <.L2>

0000325c <.L6>:
    325c:	00070513          	mv	a0,a4
    3260:	fa5ff06f          	j	3204 <.L5>

00003264 <.L7>:
    3264:	02078663          	beqz	a5,3290 <.L13>
    3268:	ffe74783          	lbu	a5,-2(a4)
    326c:	00d79663          	bne	a5,a3,3278 <.L8>
    3270:	00250513          	add	a0,a0,2
    3274:	00008067          	ret

00003278 <.L8>:
    3278:	00078c63          	beqz	a5,3290 <.L13>
    327c:	fff74783          	lbu	a5,-1(a4)
    3280:	00d79663          	bne	a5,a3,328c <.L9>
    3284:	00350513          	add	a0,a0,3
    3288:	00008067          	ret

0000328c <.L9>:
    328c:	fc0798e3          	bnez	a5,325c <.L6>

00003290 <.L13>:
    3290:	00000513          	li	a0,0

00003294 <.L1>:
    3294:	00008067          	ret

00003298 <__GI_lseek64>:
    3298:	00058793          	mv	a5,a1
    329c:	ff010113          	add	sp,sp,-16
    32a0:	00068713          	mv	a4,a3
    32a4:	00060593          	mv	a1,a2
    32a8:	00810693          	add	a3,sp,8
    32ac:	00078613          	mv	a2,a5
    32b0:	03e00893          	li	a7,62
    32b4:	00000073          	ecall
    32b8:	fffff7b7          	lui	a5,0xfffff
    32bc:	02a7f263          	bgeu	a5,a0,32e0 <.L2>
    32c0:	40a00533          	neg	a0,a0
    32c4:	00004797          	auipc	a5,0x4
    32c8:	f107a783          	lw	a5,-240(a5) # 71d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    32cc:	00a7a023          	sw	a0,0(a5)
    32d0:	fff00593          	li	a1,-1
    32d4:	fff00513          	li	a0,-1

000032d8 <.L1>:
    32d8:	01010113          	add	sp,sp,16
    32dc:	00008067          	ret

000032e0 <.L2>:
    32e0:	41f55593          	sra	a1,a0,0x1f
    32e4:	00b567b3          	or	a5,a0,a1
    32e8:	fe0798e3          	bnez	a5,32d8 <.L1>
    32ec:	00812503          	lw	a0,8(sp)
    32f0:	00c12583          	lw	a1,12(sp)
    32f4:	fe5ff06f          	j	32d8 <.L1>

000032f8 <__divtf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__divtf3 (TFtype a, TFtype b)
{
    32f8:	f5010113          	add	sp,sp,-176
    32fc:	09312e23          	sw	s3,156(sp)
    3300:	00c5a983          	lw	s3,12(a1)
    3304:	0045a783          	lw	a5,4(a1)
    3308:	0085a803          	lw	a6,8(a1)
    330c:	0a812423          	sw	s0,168(sp)
    3310:	00050413          	mv	s0,a0
    3314:	0005a503          	lw	a0,0(a1)

00003318 <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_Q (A, a);
    3318:	01099713          	sll	a4,s3,0x10

0000331c <.LBE3>:
{
    331c:	0b212023          	sw	s2,160(sp)
    3320:	09512a23          	sw	s5,148(sp)
    3324:	00462903          	lw	s2,4(a2)
    3328:	00c62a83          	lw	s5,12(a2)
    332c:	09612823          	sw	s6,144(sp)
    3330:	09712623          	sw	s7,140(sp)
    3334:	00862b03          	lw	s6,8(a2)
    3338:	00062b83          	lw	s7,0(a2)

0000333c <.LBB4>:
  FP_UNPACK_Q (A, a);
    333c:	00008637          	lui	a2,0x8

00003340 <.LBE4>:
{
    3340:	0a912223          	sw	s1,164(sp)

00003344 <.LBB5>:
  FP_UNPACK_Q (A, a);
    3344:	01075713          	srl	a4,a4,0x10
    3348:	0109d493          	srl	s1,s3,0x10
    334c:	fff60613          	add	a2,a2,-1 # 7fff <.LLST132+0x8>
    3350:	07312623          	sw	s3,108(sp)

00003354 <.LBE5>:
{
    3354:	0a112623          	sw	ra,172(sp)
    3358:	09412c23          	sw	s4,152(sp)
    335c:	09812423          	sw	s8,136(sp)
    3360:	09912223          	sw	s9,132(sp)
    3364:	09a12023          	sw	s10,128(sp)
    3368:	07b12e23          	sw	s11,124(sp)

0000336c <.LBB6>:
  FP_UNPACK_Q (A, a);
    336c:	06a12023          	sw	a0,96(sp)
    3370:	06f12223          	sw	a5,100(sp)
    3374:	07012423          	sw	a6,104(sp)
    3378:	02a12823          	sw	a0,48(sp)
    337c:	02f12a23          	sw	a5,52(sp)
    3380:	03012c23          	sw	a6,56(sp)
    3384:	02e12e23          	sw	a4,60(sp)
    3388:	00c4f6b3          	and	a3,s1,a2

0000338c <.LVL2>:
    338c:	01f9d993          	srl	s3,s3,0x1f

00003390 <.LBE6>:
    3390:	10068e63          	beqz	a3,34ac <.L2>
    3394:	24c68863          	beq	a3,a2,35e4 <.L3>
    3398:	000107b7          	lui	a5,0x10
    339c:	00f76733          	or	a4,a4,a5
    33a0:	02e12e23          	sw	a4,60(sp)

000033a4 <.LBB7>:
    33a4:	03010593          	add	a1,sp,48
    33a8:	03c10793          	add	a5,sp,60

000033ac <.L4>:
    33ac:	0007a703          	lw	a4,0(a5) # 10000 <_ebss+0x2460>
    33b0:	ffc7a603          	lw	a2,-4(a5)
    33b4:	ffc78793          	add	a5,a5,-4
    33b8:	00371713          	sll	a4,a4,0x3
    33bc:	01d65613          	srl	a2,a2,0x1d
    33c0:	00c76733          	or	a4,a4,a2
    33c4:	00e7a223          	sw	a4,4(a5)
    33c8:	fef592e3          	bne	a1,a5,33ac <.L4>

000033cc <.LBE7>:
    33cc:	ffffc7b7          	lui	a5,0xffffc

000033d0 <.LBB8>:
    33d0:	00351513          	sll	a0,a0,0x3

000033d4 <.LBE8>:
    33d4:	00178793          	add	a5,a5,1 # ffffc001 <_ebss+0xfffee461>

000033d8 <.LBB9>:
    33d8:	02a12823          	sw	a0,48(sp)

000033dc <.LBE9>:
    33dc:	00f684b3          	add	s1,a3,a5

000033e0 <.L193>:
    33e0:	00000a13          	li	s4,0

000033e4 <.L5>:
  FP_UNPACK_Q (B, b);
    33e4:	010a9513          	sll	a0,s5,0x10
    33e8:	00008737          	lui	a4,0x8
    33ec:	010ad793          	srl	a5,s5,0x10
    33f0:	01055513          	srl	a0,a0,0x10
    33f4:	fff70713          	add	a4,a4,-1 # 7fff <.LLST132+0x8>
    33f8:	07512623          	sw	s5,108(sp)
    33fc:	07712023          	sw	s7,96(sp)
    3400:	07212223          	sw	s2,100(sp)
    3404:	07612423          	sw	s6,104(sp)
    3408:	05712023          	sw	s7,64(sp)
    340c:	05212223          	sw	s2,68(sp)
    3410:	05612423          	sw	s6,72(sp)
    3414:	04a12623          	sw	a0,76(sp)
    3418:	00e7f7b3          	and	a5,a5,a4

0000341c <.LVL9>:
    341c:	01fada93          	srl	s5,s5,0x1f

00003420 <.LBE13>:
    3420:	1e078863          	beqz	a5,3610 <.L18>
    3424:	32e78263          	beq	a5,a4,3748 <.L19>
    3428:	00010737          	lui	a4,0x10
    342c:	00e56533          	or	a0,a0,a4
    3430:	04a12623          	sw	a0,76(sp)

00003434 <.LBB14>:
    3434:	04010593          	add	a1,sp,64
    3438:	04c10713          	add	a4,sp,76

0000343c <.L20>:
    343c:	00072683          	lw	a3,0(a4) # 10000 <_ebss+0x2460>
    3440:	ffc72603          	lw	a2,-4(a4)
    3444:	ffc70713          	add	a4,a4,-4
    3448:	00369693          	sll	a3,a3,0x3
    344c:	01d65613          	srl	a2,a2,0x1d
    3450:	00c6e6b3          	or	a3,a3,a2
    3454:	00d72223          	sw	a3,4(a4)
    3458:	fee592e3          	bne	a1,a4,343c <.L20>

0000345c <.LBE14>:
    345c:	ffffc737          	lui	a4,0xffffc

00003460 <.LBB15>:
    3460:	003b9b93          	sll	s7,s7,0x3

00003464 <.LBE15>:
    3464:	00170713          	add	a4,a4,1 # ffffc001 <_ebss+0xfffee461>

00003468 <.LBB16>:
    3468:	05712023          	sw	s7,64(sp)

0000346c <.LBE16>:
    346c:	00e787b3          	add	a5,a5,a4

00003470 <.L194>:
    3470:	00000713          	li	a4,0

00003474 <.L21>:
  FP_DIV_Q (R, A, B);
    3474:	40f486b3          	sub	a3,s1,a5
    3478:	002a1793          	sll	a5,s4,0x2

0000347c <.LVL16>:
    347c:	00e7e7b3          	or	a5,a5,a4
    3480:	fff78793          	add	a5,a5,-1
    3484:	00e00613          	li	a2,14
    3488:	0159c933          	xor	s2,s3,s5

0000348c <.LVL17>:
    348c:	2ef66263          	bltu	a2,a5,3770 <.L34>
    3490:	00005617          	auipc	a2,0x5
    3494:	e5460613          	add	a2,a2,-428 # 82e4 <.L36>
    3498:	00279793          	sll	a5,a5,0x2
    349c:	00c787b3          	add	a5,a5,a2
    34a0:	0007a783          	lw	a5,0(a5)
    34a4:	00c787b3          	add	a5,a5,a2
    34a8:	00078067          	jr	a5

000034ac <.L2>:
  FP_UNPACK_Q (A, a);
    34ac:	00a7e6b3          	or	a3,a5,a0

000034b0 <.LVL19>:
    34b0:	0106e6b3          	or	a3,a3,a6
    34b4:	00e6e6b3          	or	a3,a3,a4
    34b8:	14068663          	beqz	a3,3604 <.L145>

000034bc <.LBB20>:
    34bc:	0a070063          	beqz	a4,355c <.L6>
    34c0:	00070513          	mv	a0,a4
    34c4:	309030ef          	jal	6fcc <__clzsi2>

000034c8 <.L7>:
    34c8:	ff450713          	add	a4,a0,-12
    34cc:	40575593          	sra	a1,a4,0x5

000034d0 <.LVL21>:
    34d0:	01f77713          	and	a4,a4,31

000034d4 <.LVL22>:
    34d4:	0a070e63          	beqz	a4,3590 <.L10>
    34d8:	ffc00693          	li	a3,-4
    34dc:	02d586b3          	mul	a3,a1,a3
    34e0:	02000813          	li	a6,32
    34e4:	03010313          	add	t1,sp,48
    34e8:	40e80833          	sub	a6,a6,a4

000034ec <.LVL23>:
    34ec:	00c68793          	add	a5,a3,12
    34f0:	00f307b3          	add	a5,t1,a5
    34f4:	40d006b3          	neg	a3,a3

000034f8 <.L11>:
    34f8:	0cf31463          	bne	t1,a5,35c0 <.L14>
    34fc:	fff58793          	add	a5,a1,-1

00003500 <.LVL24>:
    3500:	00259593          	sll	a1,a1,0x2

00003504 <.LVL25>:
    3504:	04058693          	add	a3,a1,64
    3508:	03010613          	add	a2,sp,48
    350c:	00c685b3          	add	a1,a3,a2
    3510:	03012683          	lw	a3,48(sp)
    3514:	00e69733          	sll	a4,a3,a4

00003518 <.LVL26>:
    3518:	fce5a023          	sw	a4,-64(a1)

0000351c <.L15>:
    351c:	00178793          	add	a5,a5,1
    3520:	00279793          	sll	a5,a5,0x2
    3524:	00800693          	li	a3,8
    3528:	03010713          	add	a4,sp,48
    352c:	00d7ea63          	bltu	a5,a3,3540 <.L16>
    3530:	02012823          	sw	zero,48(sp)
    3534:	00072223          	sw	zero,4(a4)
    3538:	ff878793          	add	a5,a5,-8
    353c:	03810713          	add	a4,sp,56

00003540 <.L16>:
    3540:	00400693          	li	a3,4
    3544:	00d7e463          	bltu	a5,a3,354c <.L17>
    3548:	00072023          	sw	zero,0(a4)

0000354c <.L17>:
    354c:	ffffc6b7          	lui	a3,0xffffc
    3550:	01168693          	add	a3,a3,17 # ffffc011 <_ebss+0xfffee471>
    3554:	40a684b3          	sub	s1,a3,a0

00003558 <.LVL28>:
    3558:	e89ff06f          	j	33e0 <.L193>

0000355c <.L6>:
    355c:	00080a63          	beqz	a6,3570 <.L8>
    3560:	00080513          	mv	a0,a6
    3564:	269030ef          	jal	6fcc <__clzsi2>

00003568 <.LVL30>:
    3568:	02050513          	add	a0,a0,32
    356c:	f5dff06f          	j	34c8 <.L7>

00003570 <.L8>:
    3570:	00078a63          	beqz	a5,3584 <.L9>
    3574:	00078513          	mv	a0,a5
    3578:	255030ef          	jal	6fcc <__clzsi2>

0000357c <.LVL33>:
    357c:	04050513          	add	a0,a0,64
    3580:	f49ff06f          	j	34c8 <.L7>

00003584 <.L9>:
    3584:	249030ef          	jal	6fcc <__clzsi2>

00003588 <.LVL36>:
    3588:	06050513          	add	a0,a0,96
    358c:	f3dff06f          	j	34c8 <.L7>

00003590 <.L10>:
    3590:	ffc00693          	li	a3,-4
    3594:	02d586b3          	mul	a3,a1,a3
    3598:	03c10793          	add	a5,sp,60

0000359c <.LBB12>:
    359c:	00300713          	li	a4,3

000035a0 <.L12>:
    35a0:	00d78633          	add	a2,a5,a3
    35a4:	00062603          	lw	a2,0(a2)
    35a8:	fff70713          	add	a4,a4,-1

000035ac <.LVL40>:
    35ac:	ffc78793          	add	a5,a5,-4
    35b0:	00c7a223          	sw	a2,4(a5)

000035b4 <.LVL41>:
    35b4:	feb756e3          	bge	a4,a1,35a0 <.L12>
    35b8:	fff58793          	add	a5,a1,-1
    35bc:	f61ff06f          	j	351c <.L15>

000035c0 <.L14>:
    35c0:	0007a603          	lw	a2,0(a5)
    35c4:	ffc7a883          	lw	a7,-4(a5)
    35c8:	00d78e33          	add	t3,a5,a3
    35cc:	00e61633          	sll	a2,a2,a4
    35d0:	0108d8b3          	srl	a7,a7,a6
    35d4:	01166633          	or	a2,a2,a7
    35d8:	00ce2023          	sw	a2,0(t3)
    35dc:	ffc78793          	add	a5,a5,-4
    35e0:	f19ff06f          	j	34f8 <.L11>

000035e4 <.L3>:
    35e4:	00a7e7b3          	or	a5,a5,a0
    35e8:	0107e7b3          	or	a5,a5,a6
    35ec:	00e7e7b3          	or	a5,a5,a4

000035f0 <.LBB21>:
    35f0:	00068493          	mv	s1,a3

000035f4 <.LBE21>:
    35f4:	00200a13          	li	s4,2
    35f8:	de0786e3          	beqz	a5,33e4 <.L5>
    35fc:	00300a13          	li	s4,3
    3600:	de5ff06f          	j	33e4 <.L5>

00003604 <.L145>:
    3604:	00000493          	li	s1,0

00003608 <.LBE22>:
    3608:	00100a13          	li	s4,1
    360c:	dd9ff06f          	j	33e4 <.L5>

00003610 <.L18>:
  FP_UNPACK_Q (B, b);
    3610:	017967b3          	or	a5,s2,s7

00003614 <.LVL47>:
    3614:	0167e7b3          	or	a5,a5,s6
    3618:	00a7e7b3          	or	a5,a5,a0
    361c:	14078463          	beqz	a5,3764 <.L147>

00003620 <.LBB23>:
    3620:	08050e63          	beqz	a0,36bc <.L22>
    3624:	1a9030ef          	jal	6fcc <__clzsi2>

00003628 <.L23>:
    3628:	ff450693          	add	a3,a0,-12
    362c:	4056d793          	sra	a5,a3,0x5

00003630 <.LVL49>:
    3630:	01f6f693          	and	a3,a3,31

00003634 <.LVL50>:
    3634:	0c068063          	beqz	a3,36f4 <.L26>
    3638:	ffc00613          	li	a2,-4
    363c:	02c78633          	mul	a2,a5,a2
    3640:	02000813          	li	a6,32
    3644:	04010313          	add	t1,sp,64
    3648:	40d80833          	sub	a6,a6,a3

0000364c <.LVL51>:
    364c:	00c60713          	add	a4,a2,12
    3650:	00e30733          	add	a4,t1,a4
    3654:	40c00633          	neg	a2,a2

00003658 <.L27>:
    3658:	0ce31663          	bne	t1,a4,3724 <.L30>
    365c:	fff78713          	add	a4,a5,-1

00003660 <.LVL52>:
    3660:	00279793          	sll	a5,a5,0x2

00003664 <.LVL53>:
    3664:	03010613          	add	a2,sp,48
    3668:	04078793          	add	a5,a5,64
    366c:	00c787b3          	add	a5,a5,a2
    3670:	04012603          	lw	a2,64(sp)
    3674:	00d616b3          	sll	a3,a2,a3

00003678 <.LVL54>:
    3678:	fcd7a823          	sw	a3,-48(a5)

0000367c <.L31>:
    367c:	00170793          	add	a5,a4,1
    3680:	00279793          	sll	a5,a5,0x2
    3684:	00800693          	li	a3,8
    3688:	04010713          	add	a4,sp,64
    368c:	00d7ea63          	bltu	a5,a3,36a0 <.L32>
    3690:	04012023          	sw	zero,64(sp)
    3694:	00072223          	sw	zero,4(a4)
    3698:	ff878793          	add	a5,a5,-8
    369c:	04810713          	add	a4,sp,72

000036a0 <.L32>:
    36a0:	00400693          	li	a3,4
    36a4:	00d7e463          	bltu	a5,a3,36ac <.L33>
    36a8:	00072023          	sw	zero,0(a4)

000036ac <.L33>:
    36ac:	ffffc7b7          	lui	a5,0xffffc
    36b0:	01178793          	add	a5,a5,17 # ffffc011 <_ebss+0xfffee471>
    36b4:	40a787b3          	sub	a5,a5,a0
    36b8:	db9ff06f          	j	3470 <.L194>

000036bc <.L22>:
    36bc:	000b0a63          	beqz	s6,36d0 <.L24>
    36c0:	000b0513          	mv	a0,s6
    36c4:	109030ef          	jal	6fcc <__clzsi2>

000036c8 <.LVL57>:
    36c8:	02050513          	add	a0,a0,32
    36cc:	f5dff06f          	j	3628 <.L23>

000036d0 <.L24>:
    36d0:	00090a63          	beqz	s2,36e4 <.L25>
    36d4:	00090513          	mv	a0,s2
    36d8:	0f5030ef          	jal	6fcc <__clzsi2>

000036dc <.LVL60>:
    36dc:	04050513          	add	a0,a0,64
    36e0:	f49ff06f          	j	3628 <.L23>

000036e4 <.L25>:
    36e4:	000b8513          	mv	a0,s7
    36e8:	0e5030ef          	jal	6fcc <__clzsi2>

000036ec <.LVL63>:
    36ec:	06050513          	add	a0,a0,96
    36f0:	f39ff06f          	j	3628 <.L23>

000036f4 <.L26>:
    36f4:	ffc00613          	li	a2,-4
    36f8:	02c78633          	mul	a2,a5,a2
    36fc:	04c10713          	add	a4,sp,76

00003700 <.LBB19>:
    3700:	00300693          	li	a3,3

00003704 <.L28>:
    3704:	00c705b3          	add	a1,a4,a2
    3708:	0005a583          	lw	a1,0(a1)
    370c:	fff68693          	add	a3,a3,-1

00003710 <.LVL67>:
    3710:	ffc70713          	add	a4,a4,-4
    3714:	00b72223          	sw	a1,4(a4)

00003718 <.LVL68>:
    3718:	fef6d6e3          	bge	a3,a5,3704 <.L28>
    371c:	fff78713          	add	a4,a5,-1
    3720:	f5dff06f          	j	367c <.L31>

00003724 <.L30>:
    3724:	00072583          	lw	a1,0(a4)
    3728:	ffc72883          	lw	a7,-4(a4)
    372c:	00c70e33          	add	t3,a4,a2
    3730:	00d595b3          	sll	a1,a1,a3
    3734:	0108d8b3          	srl	a7,a7,a6
    3738:	0115e5b3          	or	a1,a1,a7
    373c:	00be2023          	sw	a1,0(t3)
    3740:	ffc70713          	add	a4,a4,-4
    3744:	f15ff06f          	j	3658 <.L27>

00003748 <.L19>:
    3748:	01796933          	or	s2,s2,s7
    374c:	01696933          	or	s2,s2,s6
    3750:	00a96933          	or	s2,s2,a0
    3754:	00200713          	li	a4,2
    3758:	d0090ee3          	beqz	s2,3474 <.L21>
    375c:	00300713          	li	a4,3
    3760:	d15ff06f          	j	3474 <.L21>

00003764 <.L147>:
    3764:	00000793          	li	a5,0

00003768 <.LBE24>:
    3768:	00100713          	li	a4,1

0000376c <.LVL72>:
    376c:	d09ff06f          	j	3474 <.L21>

00003770 <.L34>:
  FP_DIV_Q (R, A, B);
    3770:	03c12703          	lw	a4,60(sp)

00003774 <.LVL74>:
    3774:	04c12503          	lw	a0,76(sp)
    3778:	06012623          	sw	zero,108(sp)
    377c:	06012423          	sw	zero,104(sp)
    3780:	06012223          	sw	zero,100(sp)
    3784:	06012023          	sw	zero,96(sp)
    3788:	03012783          	lw	a5,48(sp)
    378c:	03412603          	lw	a2,52(sp)
    3790:	04012803          	lw	a6,64(sp)
    3794:	04812583          	lw	a1,72(sp)
    3798:	02e56263          	bltu	a0,a4,37bc <.L41>
    379c:	22a71263          	bne	a4,a0,39c0 <.L42>
    37a0:	03812503          	lw	a0,56(sp)
    37a4:	00a5ec63          	bltu	a1,a0,37bc <.L41>
    37a8:	20b51c63          	bne	a0,a1,39c0 <.L42>
    37ac:	04412583          	lw	a1,68(sp)
    37b0:	00c5e663          	bltu	a1,a2,37bc <.L41>
    37b4:	20c59663          	bne	a1,a2,39c0 <.L42>
    37b8:	2107e463          	bltu	a5,a6,39c0 <.L42>

000037bc <.L41>:
    37bc:	01f79793          	sll	a5,a5,0x1f
    37c0:	06f12623          	sw	a5,108(sp)

000037c4 <.LBB26>:
    37c4:	03c10513          	add	a0,sp,60
    37c8:	03010793          	add	a5,sp,48

000037cc <.L43>:
    37cc:	0007a603          	lw	a2,0(a5)
    37d0:	0047a583          	lw	a1,4(a5)
    37d4:	00478793          	add	a5,a5,4
    37d8:	00165613          	srl	a2,a2,0x1
    37dc:	01f59593          	sll	a1,a1,0x1f
    37e0:	00b66633          	or	a2,a2,a1
    37e4:	fec7ae23          	sw	a2,-4(a5)
    37e8:	fef512e3          	bne	a0,a5,37cc <.L43>

000037ec <.LVL77>:
    37ec:	00175713          	srl	a4,a4,0x1
    37f0:	02e12e23          	sw	a4,60(sp)

000037f4 <.L44>:
    37f4:	04010593          	add	a1,sp,64
    37f8:	04c10793          	add	a5,sp,76

000037fc <.L45>:
    37fc:	0007a703          	lw	a4,0(a5)
    3800:	ffc7a603          	lw	a2,-4(a5)
    3804:	ffc78793          	add	a5,a5,-4
    3808:	00c71713          	sll	a4,a4,0xc
    380c:	01465613          	srl	a2,a2,0x14
    3810:	00c76733          	or	a4,a4,a2
    3814:	00e7a223          	sw	a4,4(a5)
    3818:	fef592e3          	bne	a1,a5,37fc <.L45>

0000381c <.LBE27>:
    381c:	04c12503          	lw	a0,76(sp)

00003820 <.LBB28>:
    3820:	00010eb7          	lui	t4,0x10

00003824 <.LBB29>:
    3824:	04412303          	lw	t1,68(sp)

00003828 <.LBB54>:
    3828:	fffe8e93          	add	t4,t4,-1 # ffff <_ebss+0x245f>

0000382c <.LBB55>:
    382c:	00c81813          	sll	a6,a6,0xc

00003830 <.LBB56>:
    3830:	01d577b3          	and	a5,a0,t4

00003834 <.LBB31>:
    3834:	04812f83          	lw	t6,72(sp)

00003838 <.LBB58>:
    3838:	00f12e23          	sw	a5,28(sp)

0000383c <.LBB32>:
    383c:	01085793          	srl	a5,a6,0x10
    3840:	00f12423          	sw	a5,8(sp)

00003844 <.LBB33>:
    3844:	01035793          	srl	a5,t1,0x10
    3848:	00f12623          	sw	a5,12(sp)
    384c:	01d377b3          	and	a5,t1,t4
    3850:	00f12a23          	sw	a5,20(sp)

00003854 <.LBB34>:
    3854:	010fd793          	srl	a5,t6,0x10
    3858:	00f12823          	sw	a5,16(sp)
    385c:	01dff7b3          	and	a5,t6,t4
    3860:	00f12c23          	sw	a5,24(sp)
    3864:	01d877b3          	and	a5,a6,t4
    3868:	02f12023          	sw	a5,32(sp)
    386c:	03812883          	lw	a7,56(sp)

00003870 <.LBB60>:
    3870:	410307b3          	sub	a5,t1,a6
    3874:	03c12703          	lw	a4,60(sp)
    3878:	03412603          	lw	a2,52(sp)
    387c:	03012583          	lw	a1,48(sp)
    3880:	02f12223          	sw	a5,36(sp)
    3884:	406f87b3          	sub	a5,t6,t1

00003888 <.LBB61>:
    3888:	01055d13          	srl	s10,a0,0x10
    388c:	05010a13          	add	s4,sp,80

00003890 <.LVL81>:
    3890:	06010c13          	add	s8,sp,96

00003894 <.LBE61>:
    3894:	00300c93          	li	s9,3

00003898 <.LBB62>:
    3898:	00010db7          	lui	s11,0x10

0000389c <.LBB63>:
    389c:	02f12423          	sw	a5,40(sp)

000038a0 <.L113>:
    38a0:	12e51463          	bne	a0,a4,39c8 <.L46>
    38a4:	fff00793          	li	a5,-1
    38a8:	00fa2623          	sw	a5,12(s4)
    38ac:	3e0c8c63          	beqz	s9,3ca4 <.L114>

000038b0 <.LBB64>:
    38b0:	00cc2f03          	lw	t5,12(s8)

000038b4 <.LVL83>:
    38b4:	40b803b3          	sub	t2,a6,a1
    38b8:	00783e33          	sltu	t3,a6,t2
    38bc:	01e037b3          	snez	a5,t5

000038c0 <.LVL84>:
    38c0:	00000993          	li	s3,0
    38c4:	000f0463          	beqz	t5,38cc <.L50>
    38c8:	0013b993          	seqz	s3,t2

000038cc <.L50>:
    38cc:	01c9e9b3          	or	s3,s3,t3

000038d0 <.LVL85>:
    38d0:	40c302b3          	sub	t0,t1,a2

000038d4 <.LVL86>:
    38d4:	00533e33          	sltu	t3,t1,t0

000038d8 <.LVL87>:
    38d8:	00000a93          	li	s5,0
    38dc:	00098463          	beqz	s3,38e4 <.L53>
    38e0:	0012ba93          	seqz	s5,t0

000038e4 <.L53>:
    38e4:	01caeab3          	or	s5,s5,t3

000038e8 <.LBB65>:
    38e8:	02412e03          	lw	t3,36(sp)
    38ec:	01e80f33          	add	t5,a6,t5

000038f0 <.LVL89>:
    38f0:	00be0e33          	add	t3,t3,a1
    38f4:	00fe0e33          	add	t3,t3,a5

000038f8 <.LVL90>:
    38f8:	01e835b3          	sltu	a1,a6,t5
    38fc:	01c334b3          	sltu	s1,t1,t3

00003900 <.LVL91>:
    3900:	40be0e33          	sub	t3,t3,a1

00003904 <.LVL92>:
    3904:	00000593          	li	a1,0
    3908:	01e87863          	bgeu	a6,t5,3918 <.L54>

0000390c <.LBB66>:
    390c:	40f383b3          	sub	t2,t2,a5

00003910 <.LBB67>:
    3910:	406383b3          	sub	t2,t2,t1
    3914:	0013b593          	seqz	a1,t2

00003918 <.L54>:
    3918:	02812783          	lw	a5,40(sp)

0000391c <.LVL94>:
    391c:	0095e5b3          	or	a1,a1,s1

00003920 <.LVL95>:
    3920:	00c784b3          	add	s1,a5,a2
    3924:	013484b3          	add	s1,s1,s3

00003928 <.LVL96>:
    3928:	009fb3b3          	sltu	t2,t6,s1

0000392c <.LVL97>:
    392c:	00000613          	li	a2,0
    3930:	40b484b3          	sub	s1,s1,a1

00003934 <.LVL98>:
    3934:	00058863          	beqz	a1,3944 <.L55>

00003938 <.LBB68>:
    3938:	413282b3          	sub	t0,t0,s3

0000393c <.LBB69>:
    393c:	41f282b3          	sub	t0,t0,t6
    3940:	0012b613          	seqz	a2,t0

00003944 <.L55>:
    3944:	41f707b3          	sub	a5,a4,t6
    3948:	011787b3          	add	a5,a5,a7
    394c:	015787b3          	add	a5,a5,s5
    3950:	00766633          	or	a2,a2,t2

00003954 <.LVL101>:
    3954:	40c787b3          	sub	a5,a5,a2

00003958 <.LBE69>:
    3958:	04f77463          	bgeu	a4,a5,39a0 <.L56>
    395c:	006e02b3          	add	t0,t3,t1
    3960:	01e80f33          	add	t5,a6,t5

00003964 <.LVL102>:
    3964:	01c2b8b3          	sltu	a7,t0,t3

00003968 <.LBB70>:
    3968:	010f3e33          	sltu	t3,t5,a6

0000396c <.LVL103>:
    396c:	01c28e33          	add	t3,t0,t3
    3970:	005e32b3          	sltu	t0,t3,t0
    3974:	01f485b3          	add	a1,s1,t6

00003978 <.LVL104>:
    3978:	0058e8b3          	or	a7,a7,t0

0000397c <.LBE70>:
    397c:	ffe00613          	li	a2,-2

00003980 <.LVL105>:
    3980:	011588b3          	add	a7,a1,a7
    3984:	00ca2623          	sw	a2,12(s4)

00003988 <.LBB71>:
    3988:	0095b633          	sltu	a2,a1,s1

0000398c <.LVL107>:
    398c:	00b8b5b3          	sltu	a1,a7,a1
    3990:	00b66633          	or	a2,a2,a1

00003994 <.LVL108>:
    3994:	00e60633          	add	a2,a2,a4
    3998:	00088493          	mv	s1,a7

0000399c <.LVL109>:
    399c:	00c787b3          	add	a5,a5,a2

000039a0 <.L56>:
    39a0:	fffc8c93          	add	s9,s9,-1
    39a4:	ffca0a13          	add	s4,s4,-4
    39a8:	ffcc0c13          	add	s8,s8,-4
    39ac:	00048893          	mv	a7,s1
    39b0:	000e0613          	mv	a2,t3
    39b4:	000f0593          	mv	a1,t5
    39b8:	00078713          	mv	a4,a5
    39bc:	ee5ff06f          	j	38a0 <.L113>

000039c0 <.L42>:
    39c0:	fff68693          	add	a3,a3,-1
    39c4:	e31ff06f          	j	37f4 <.L44>

000039c8 <.L46>:
    39c8:	03a75e33          	divu	t3,a4,s10

000039cc <.LVL115>:
    39cc:	01c12783          	lw	a5,28(sp)
    39d0:	0108df13          	srl	t5,a7,0x10
    39d4:	03a77733          	remu	a4,a4,s10

000039d8 <.LVL116>:
    39d8:	03c787b3          	mul	a5,a5,t3

000039dc <.LVL117>:
    39dc:	01071713          	sll	a4,a4,0x10

000039e0 <.LVL118>:
    39e0:	00ef6733          	or	a4,t5,a4

000039e4 <.LVL119>:
    39e4:	000e0f13          	mv	t5,t3
    39e8:	00f77e63          	bgeu	a4,a5,3a04 <.L67>
    39ec:	00e50733          	add	a4,a0,a4

000039f0 <.LVL120>:
    39f0:	fffe0f13          	add	t5,t3,-1

000039f4 <.LVL121>:
    39f4:	00a76863          	bltu	a4,a0,3a04 <.L67>
    39f8:	00f77663          	bgeu	a4,a5,3a04 <.L67>
    39fc:	ffee0f13          	add	t5,t3,-2
    3a00:	00a70733          	add	a4,a4,a0

00003a04 <.L67>:
    3a04:	40f70733          	sub	a4,a4,a5

00003a08 <.LVL124>:
    3a08:	03a75e33          	divu	t3,a4,s10

00003a0c <.LVL125>:
    3a0c:	01c12783          	lw	a5,28(sp)

00003a10 <.LVL126>:
    3a10:	01d8f8b3          	and	a7,a7,t4
    3a14:	03a77733          	remu	a4,a4,s10

00003a18 <.LVL127>:
    3a18:	03c787b3          	mul	a5,a5,t3

00003a1c <.LVL128>:
    3a1c:	01071713          	sll	a4,a4,0x10

00003a20 <.LVL129>:
    3a20:	00e8e8b3          	or	a7,a7,a4

00003a24 <.LVL130>:
    3a24:	000e0713          	mv	a4,t3
    3a28:	00f8fe63          	bgeu	a7,a5,3a44 <.L70>
    3a2c:	011508b3          	add	a7,a0,a7

00003a30 <.LVL131>:
    3a30:	fffe0713          	add	a4,t3,-1

00003a34 <.LVL132>:
    3a34:	00a8e863          	bltu	a7,a0,3a44 <.L70>
    3a38:	00f8f663          	bgeu	a7,a5,3a44 <.L70>
    3a3c:	ffee0713          	add	a4,t3,-2
    3a40:	00a888b3          	add	a7,a7,a0

00003a44 <.L70>:
    3a44:	40f887b3          	sub	a5,a7,a5

00003a48 <.LVL135>:
    3a48:	010f1f13          	sll	t5,t5,0x10

00003a4c <.LBB35>:
    3a4c:	02012883          	lw	a7,32(sp)

00003a50 <.LBB74>:
    3a50:	00ef6f33          	or	t5,t5,a4

00003a54 <.LBB36>:
    3a54:	010f5293          	srl	t0,t5,0x10
    3a58:	01df7733          	and	a4,t5,t4

00003a5c <.LVL137>:
    3a5c:	02e88e33          	mul	t3,a7,a4

00003a60 <.LBB76>:
    3a60:	01ea2623          	sw	t5,12(s4)

00003a64 <.LBB37>:
    3a64:	031284b3          	mul	s1,t0,a7

00003a68 <.LVL140>:
    3a68:	00812883          	lw	a7,8(sp)
    3a6c:	010e5993          	srl	s3,t3,0x10
    3a70:	031283b3          	mul	t2,t0,a7

00003a74 <.LVL141>:
    3a74:	02e888b3          	mul	a7,a7,a4

00003a78 <.LVL142>:
    3a78:	009888b3          	add	a7,a7,s1

00003a7c <.LVL143>:
    3a7c:	011988b3          	add	a7,s3,a7

00003a80 <.LVL144>:
    3a80:	0098f463          	bgeu	a7,s1,3a88 <.L73>
    3a84:	01b383b3          	add	t2,t2,s11

00003a88 <.L73>:
    3a88:	0108d493          	srl	s1,a7,0x10

00003a8c <.LVL146>:
    3a8c:	01d8f8b3          	and	a7,a7,t4

00003a90 <.LVL147>:
    3a90:	01de7e33          	and	t3,t3,t4

00003a94 <.LVL148>:
    3a94:	01089893          	sll	a7,a7,0x10
    3a98:	01c888b3          	add	a7,a7,t3

00003a9c <.LBB38>:
    3a9c:	01412e03          	lw	t3,20(sp)

00003aa0 <.LBB39>:
    3aa0:	007484b3          	add	s1,s1,t2

00003aa4 <.LBB40>:
    3aa4:	02ee09b3          	mul	s3,t3,a4

00003aa8 <.LVL150>:
    3aa8:	03c283b3          	mul	t2,t0,t3

00003aac <.LVL151>:
    3aac:	00c12e03          	lw	t3,12(sp)
    3ab0:	0109db13          	srl	s6,s3,0x10
    3ab4:	03c28ab3          	mul	s5,t0,t3

00003ab8 <.LVL152>:
    3ab8:	02ee0e33          	mul	t3,t3,a4

00003abc <.LVL153>:
    3abc:	007e0e33          	add	t3,t3,t2

00003ac0 <.LVL154>:
    3ac0:	01cb0e33          	add	t3,s6,t3

00003ac4 <.LVL155>:
    3ac4:	007e7463          	bgeu	t3,t2,3acc <.L74>
    3ac8:	01ba8ab3          	add	s5,s5,s11

00003acc <.L74>:
    3acc:	01de73b3          	and	t2,t3,t4
    3ad0:	01d9f9b3          	and	s3,s3,t4

00003ad4 <.LVL157>:
    3ad4:	01039393          	sll	t2,t2,0x10
    3ad8:	013383b3          	add	t2,t2,s3
    3adc:	007483b3          	add	t2,s1,t2

00003ae0 <.LBB43>:
    3ae0:	01812983          	lw	s3,24(sp)

00003ae4 <.LBB45>:
    3ae4:	0093b4b3          	sltu	s1,t2,s1

00003ae8 <.LBB46>:
    3ae8:	010e5e13          	srl	t3,t3,0x10

00003aec <.LBB47>:
    3aec:	009e0e33          	add	t3,t3,s1
    3af0:	015e0e33          	add	t3,t3,s5

00003af4 <.LBB48>:
    3af4:	03328ab3          	mul	s5,t0,s3

00003af8 <.LVL162>:
    3af8:	01012983          	lw	s3,16(sp)
    3afc:	01812483          	lw	s1,24(sp)
    3b00:	033289b3          	mul	s3,t0,s3
    3b04:	01012283          	lw	t0,16(sp)

00003b08 <.LVL163>:
    3b08:	02e484b3          	mul	s1,s1,a4

00003b0c <.LVL164>:
    3b0c:	02e28733          	mul	a4,t0,a4

00003b10 <.LVL165>:
    3b10:	0104d293          	srl	t0,s1,0x10
    3b14:	01570733          	add	a4,a4,s5

00003b18 <.LVL166>:
    3b18:	00e28733          	add	a4,t0,a4

00003b1c <.LVL167>:
    3b1c:	01577463          	bgeu	a4,s5,3b24 <.L77>
    3b20:	01b989b3          	add	s3,s3,s11

00003b24 <.L77>:
    3b24:	01d772b3          	and	t0,a4,t4
    3b28:	01029293          	sll	t0,t0,0x10
    3b2c:	01d4f4b3          	and	s1,s1,t4

00003b30 <.LVL169>:
    3b30:	009282b3          	add	t0,t0,s1
    3b34:	005e02b3          	add	t0,t3,t0

00003b38 <.LBB51>:
    3b38:	01075713          	srl	a4,a4,0x10

00003b3c <.LBB53>:
    3b3c:	01c2be33          	sltu	t3,t0,t3

00003b40 <.LVL172>:
    3b40:	01c70733          	add	a4,a4,t3
    3b44:	01370733          	add	a4,a4,s3

00003b48 <.LBE53>:
    3b48:	00cc2983          	lw	s3,12(s8)

00003b4c <.LVL174>:
    3b4c:	00e7ee63          	bltu	a5,a4,3b68 <.L80>
    3b50:	0ef71463          	bne	a4,a5,3c38 <.L81>
    3b54:	00566a63          	bltu	a2,t0,3b68 <.L80>
    3b58:	0e561063          	bne	a2,t0,3c38 <.L81>
    3b5c:	0075e663          	bltu	a1,t2,3b68 <.L80>
    3b60:	0c759c63          	bne	a1,t2,3c38 <.L81>
    3b64:	0d19fa63          	bgeu	s3,a7,3c38 <.L81>

00003b68 <.L80>:
    3b68:	ffff0e13          	add	t3,t5,-1
    3b6c:	01380ab3          	add	s5,a6,s3

00003b70 <.LVL175>:
    3b70:	00b30b33          	add	s6,t1,a1

00003b74 <.LVL176>:
    3b74:	01ca2623          	sw	t3,12(s4)

00003b78 <.LBB78>:
    3b78:	010abe33          	sltu	t3,s5,a6
    3b7c:	01cb04b3          	add	s1,s6,t3
    3b80:	03c12623          	sw	t3,44(sp)
    3b84:	006b3e33          	sltu	t3,s6,t1
    3b88:	0164bb33          	sltu	s6,s1,s6
    3b8c:	00cf8bb3          	add	s7,t6,a2
    3b90:	016e6e33          	or	t3,t3,s6
    3b94:	01cb8e33          	add	t3,s7,t3
    3b98:	01fbbb33          	sltu	s6,s7,t6
    3b9c:	017e3bb3          	sltu	s7,t3,s7
    3ba0:	017b6b33          	or	s6,s6,s7
    3ba4:	00ab0b33          	add	s6,s6,a0
    3ba8:	016787b3          	add	a5,a5,s6

00003bac <.LVL177>:
    3bac:	000a8993          	mv	s3,s5

00003bb0 <.LVL178>:
    3bb0:	00048593          	mv	a1,s1
    3bb4:	000e0613          	mv	a2,t3

00003bb8 <.LBE78>:
    3bb8:	02f56063          	bltu	a0,a5,3bd8 <.L92>
    3bbc:	06f51e63          	bne	a0,a5,3c38 <.L81>
    3bc0:	01cfec63          	bltu	t6,t3,3bd8 <.L92>
    3bc4:	07cf9a63          	bne	t6,t3,3c38 <.L81>
    3bc8:	00936863          	bltu	t1,s1,3bd8 <.L92>
    3bcc:	06931663          	bne	t1,s1,3c38 <.L81>
    3bd0:	010abb33          	sltu	s6,s5,a6
    3bd4:	060b1263          	bnez	s6,3c38 <.L81>

00003bd8 <.L92>:
    3bd8:	00e7ee63          	bltu	a5,a4,3bf4 <.L93>
    3bdc:	04f71e63          	bne	a4,a5,3c38 <.L81>
    3be0:	005e6a63          	bltu	t3,t0,3bf4 <.L93>
    3be4:	045e1a63          	bne	t3,t0,3c38 <.L81>
    3be8:	0074e663          	bltu	s1,t2,3bf4 <.L93>
    3bec:	04749663          	bne	s1,t2,3c38 <.L81>
    3bf0:	051af463          	bgeu	s5,a7,3c38 <.L81>

00003bf4 <.L93>:
    3bf4:	01580ab3          	add	s5,a6,s5
    3bf8:	009304b3          	add	s1,t1,s1

00003bfc <.LBB79>:
    3bfc:	010ab5b3          	sltu	a1,s5,a6
    3c00:	00b485b3          	add	a1,s1,a1
    3c04:	0064b633          	sltu	a2,s1,t1
    3c08:	0095b4b3          	sltu	s1,a1,s1
    3c0c:	01cf8e33          	add	t3,t6,t3
    3c10:	00966633          	or	a2,a2,s1

00003c14 <.LBE79>:
    3c14:	ffef0f13          	add	t5,t5,-2

00003c18 <.LVL180>:
    3c18:	00ce0633          	add	a2,t3,a2
    3c1c:	01ea2623          	sw	t5,12(s4)

00003c20 <.LBB80>:
    3c20:	01fe3f33          	sltu	t5,t3,t6

00003c24 <.LVL182>:
    3c24:	01c63e33          	sltu	t3,a2,t3
    3c28:	01cf6f33          	or	t5,t5,t3
    3c2c:	00af0f33          	add	t5,t5,a0
    3c30:	000a8993          	mv	s3,s5

00003c34 <.LVL183>:
    3c34:	01e787b3          	add	a5,a5,t5

00003c38 <.L81>:
    3c38:	41198ab3          	sub	s5,s3,a7
    3c3c:	407584b3          	sub	s1,a1,t2
    3c40:	0159be33          	sltu	t3,s3,s5
    3c44:	0095bb33          	sltu	s6,a1,s1
    3c48:	000a8f13          	mv	t5,s5

00003c4c <.LVL185>:
    3c4c:	41c48e33          	sub	t3,s1,t3

00003c50 <.LVL186>:
    3c50:	00000593          	li	a1,0

00003c54 <.LVL187>:
    3c54:	0159f463          	bgeu	s3,s5,3c5c <.L108>
    3c58:	0014b593          	seqz	a1,s1

00003c5c <.L108>:
    3c5c:	0165e5b3          	or	a1,a1,s6

00003c60 <.LVL188>:
    3c60:	40560b33          	sub	s6,a2,t0

00003c64 <.LVL189>:
    3c64:	01663633          	sltu	a2,a2,s6

00003c68 <.LVL190>:
    3c68:	40bb04b3          	sub	s1,s6,a1

00003c6c <.LVL191>:
    3c6c:	00000993          	li	s3,0

00003c70 <.LVL192>:
    3c70:	00058463          	beqz	a1,3c78 <.L111>
    3c74:	001b3993          	seqz	s3,s6

00003c78 <.L111>:
    3c78:	40e787b3          	sub	a5,a5,a4

00003c7c <.LVL194>:
    3c7c:	00c9e9b3          	or	s3,s3,a2

00003c80 <.LVL195>:
    3c80:	413787b3          	sub	a5,a5,s3

00003c84 <.LBE81>:
    3c84:	d00c9ee3          	bnez	s9,39a0 <.L56>
    3c88:	01589863          	bne	a7,s5,3c98 <.L112>
    3c8c:	007e1663          	bne	t3,t2,3c98 <.L112>
    3c90:	00549463          	bne	s1,t0,3c98 <.L112>
    3c94:	00f70863          	beq	a4,a5,3ca4 <.L114>

00003c98 <.L112>:
    3c98:	05012783          	lw	a5,80(sp)
    3c9c:	0017e793          	or	a5,a5,1
    3ca0:	04f12823          	sw	a5,80(sp)

00003ca4 <.L114>:
  FP_PACK_Q (r, R);
    3ca4:	000047b7          	lui	a5,0x4
    3ca8:	fff78793          	add	a5,a5,-1 # 3fff <.LVL261+0x3>
    3cac:	00f687b3          	add	a5,a3,a5

00003cb0 <.LVL197>:
    3cb0:	1af05463          	blez	a5,3e58 <.L116>
    3cb4:	05012703          	lw	a4,80(sp)
    3cb8:	00777613          	and	a2,a4,7
    3cbc:	04060463          	beqz	a2,3d04 <.L117>
    3cc0:	00f77613          	and	a2,a4,15
    3cc4:	00400593          	li	a1,4
    3cc8:	02b60e63          	beq	a2,a1,3d04 <.L117>

00003ccc <.LBB83>:
    3ccc:	00470713          	add	a4,a4,4
    3cd0:	00473613          	sltiu	a2,a4,4
    3cd4:	04e12823          	sw	a4,80(sp)

00003cd8 <.LVL198>:
    3cd8:	05412703          	lw	a4,84(sp)

00003cdc <.LVL199>:
    3cdc:	00e60733          	add	a4,a2,a4
    3ce0:	04e12a23          	sw	a4,84(sp)

00003ce4 <.LVL200>:
    3ce4:	00c73733          	sltu	a4,a4,a2

00003ce8 <.LVL201>:
    3ce8:	05812603          	lw	a2,88(sp)
    3cec:	00e60733          	add	a4,a2,a4

00003cf0 <.LVL202>:
    3cf0:	04e12c23          	sw	a4,88(sp)

00003cf4 <.LVL203>:
    3cf4:	00c73733          	sltu	a4,a4,a2

00003cf8 <.LVL204>:
    3cf8:	05c12603          	lw	a2,92(sp)
    3cfc:	00c70733          	add	a4,a4,a2

00003d00 <.LVL205>:
    3d00:	04e12e23          	sw	a4,92(sp)

00003d04 <.L117>:
    3d04:	05c12703          	lw	a4,92(sp)
    3d08:	00b71613          	sll	a2,a4,0xb
    3d0c:	00065e63          	bgez	a2,3d28 <.L122>
    3d10:	fff007b7          	lui	a5,0xfff00

00003d14 <.LVL207>:
    3d14:	fff78793          	add	a5,a5,-1 # ffefffff <_ebss+0xffef245f>
    3d18:	00f77733          	and	a4,a4,a5
    3d1c:	000047b7          	lui	a5,0x4

00003d20 <.LVL208>:
    3d20:	04e12e23          	sw	a4,92(sp)
    3d24:	00f687b3          	add	a5,a3,a5

00003d28 <.L122>:
    3d28:	05010713          	add	a4,sp,80
    3d2c:	05c10593          	add	a1,sp,92

00003d30 <.L123>:
    3d30:	00072683          	lw	a3,0(a4)
    3d34:	00472603          	lw	a2,4(a4)
    3d38:	00470713          	add	a4,a4,4
    3d3c:	0036d693          	srl	a3,a3,0x3
    3d40:	01d61613          	sll	a2,a2,0x1d
    3d44:	00c6e6b3          	or	a3,a3,a2
    3d48:	fed72e23          	sw	a3,-4(a4)
    3d4c:	feb712e3          	bne	a4,a1,3d30 <.L123>

00003d50 <.LBE84>:
    3d50:	000086b7          	lui	a3,0x8
    3d54:	ffe68693          	add	a3,a3,-2 # 7ffe <.LLST132+0x7>

00003d58 <.LBB85>:
    3d58:	05c12703          	lw	a4,92(sp)

00003d5c <.LBE85>:
    3d5c:	0af6ce63          	blt	a3,a5,3e18 <.L39>

00003d60 <.LBB86>:
    3d60:	00375713          	srl	a4,a4,0x3
    3d64:	04e12e23          	sw	a4,92(sp)

00003d68 <.L125>:
    3d68:	00f91913          	sll	s2,s2,0xf

00003d6c <.LVL213>:
    3d6c:	00f96933          	or	s2,s2,a5

00003d70 <.LBE87>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    3d70:	05012783          	lw	a5,80(sp)

00003d74 <.LBB88>:
  FP_PACK_Q (r, R);
    3d74:	05c12703          	lw	a4,92(sp)
    3d78:	07211723          	sh	s2,110(sp)

00003d7c <.LBE88>:
  return r;
    3d7c:	00f42023          	sw	a5,0(s0)
    3d80:	05412783          	lw	a5,84(sp)

00003d84 <.LBB89>:
  FP_PACK_Q (r, R);
    3d84:	06e11623          	sh	a4,108(sp)

00003d88 <.LBE89>:
}
    3d88:	0ac12083          	lw	ra,172(sp)
  return r;
    3d8c:	00f42223          	sw	a5,4(s0)
    3d90:	05812783          	lw	a5,88(sp)

00003d94 <.LVL216>:
}
    3d94:	00040513          	mv	a0,s0
    3d98:	0a412483          	lw	s1,164(sp)
  return r;
    3d9c:	00f42423          	sw	a5,8(s0)
    3da0:	06c12783          	lw	a5,108(sp)
}
    3da4:	0a012903          	lw	s2,160(sp)
    3da8:	09c12983          	lw	s3,156(sp)
  return r;
    3dac:	00f42623          	sw	a5,12(s0)
}
    3db0:	0a812403          	lw	s0,168(sp)
    3db4:	09812a03          	lw	s4,152(sp)
    3db8:	09412a83          	lw	s5,148(sp)
    3dbc:	09012b03          	lw	s6,144(sp)
    3dc0:	08c12b83          	lw	s7,140(sp)
    3dc4:	08812c03          	lw	s8,136(sp)
    3dc8:	08412c83          	lw	s9,132(sp)
    3dcc:	08012d03          	lw	s10,128(sp)
    3dd0:	07c12d83          	lw	s11,124(sp)
    3dd4:	0b010113          	add	sp,sp,176

00003dd8 <.LVL218>:
    3dd8:	00008067          	ret

00003ddc <.L37>:
  FP_DIV_Q (R, A, B);
    3ddc:	03012783          	lw	a5,48(sp)

00003de0 <.LBB90>:
  FP_UNPACK_Q (A, a);
    3de0:	00098913          	mv	s2,s3

00003de4 <.LBE90>:
  FP_DIV_Q (R, A, B);
    3de4:	000a0713          	mv	a4,s4

00003de8 <.LVL221>:
    3de8:	04f12823          	sw	a5,80(sp)
    3dec:	03412783          	lw	a5,52(sp)
    3df0:	04f12a23          	sw	a5,84(sp)
    3df4:	03812783          	lw	a5,56(sp)
    3df8:	04f12c23          	sw	a5,88(sp)
    3dfc:	03c12783          	lw	a5,60(sp)

00003e00 <.L115>:
    3e00:	04f12e23          	sw	a5,92(sp)

00003e04 <.LVL223>:
  FP_PACK_Q (r, R);
    3e04:	00100793          	li	a5,1
    3e08:	24f70863          	beq	a4,a5,4058 <.L195>
    3e0c:	e8070ce3          	beqz	a4,3ca4 <.L114>
    3e10:	00200793          	li	a5,2
    3e14:	24f71c63          	bne	a4,a5,406c <.L35>

00003e18 <.L39>:
    3e18:	000087b7          	lui	a5,0x8
    3e1c:	04012e23          	sw	zero,92(sp)
    3e20:	04012c23          	sw	zero,88(sp)
    3e24:	04012a23          	sw	zero,84(sp)
    3e28:	04012823          	sw	zero,80(sp)
    3e2c:	fff78793          	add	a5,a5,-1 # 7fff <.LLST132+0x8>
    3e30:	f39ff06f          	j	3d68 <.L125>

00003e34 <.L38>:
  FP_DIV_Q (R, A, B);
    3e34:	04012783          	lw	a5,64(sp)

00003e38 <.LBB91>:
  FP_UNPACK_Q (B, b);
    3e38:	000a8913          	mv	s2,s5

00003e3c <.LBE91>:
  FP_DIV_Q (R, A, B);
    3e3c:	04f12823          	sw	a5,80(sp)
    3e40:	04412783          	lw	a5,68(sp)
    3e44:	04f12a23          	sw	a5,84(sp)
    3e48:	04812783          	lw	a5,72(sp)
    3e4c:	04f12c23          	sw	a5,88(sp)
    3e50:	04c12783          	lw	a5,76(sp)

00003e54 <.LVL227>:
    3e54:	fadff06f          	j	3e00 <.L115>

00003e58 <.L116>:
  FP_PACK_Q (r, R);
    3e58:	00100693          	li	a3,1
    3e5c:	40f686b3          	sub	a3,a3,a5

00003e60 <.LVL229>:
    3e60:	07400793          	li	a5,116
    3e64:	1cd7ca63          	blt	a5,a3,4038 <.L126>

00003e68 <.LBB93>:
    3e68:	05010613          	add	a2,sp,80
    3e6c:	4056d713          	sra	a4,a3,0x5

00003e70 <.LVL230>:
    3e70:	00060513          	mv	a0,a2
    3e74:	01f6f693          	and	a3,a3,31

00003e78 <.LVL231>:
    3e78:	00000793          	li	a5,0
    3e7c:	00000593          	li	a1,0

00003e80 <.L127>:
    3e80:	02e59e63          	bne	a1,a4,3ebc <.L128>
    3e84:	00300593          	li	a1,3

00003e88 <.LVL233>:
    3e88:	40e585b3          	sub	a1,a1,a4
    3e8c:	00271513          	sll	a0,a4,0x2
    3e90:	04069063          	bnez	a3,3ed0 <.L129>
    3e94:	00060813          	mv	a6,a2

00003e98 <.L130>:
    3e98:	00a808b3          	add	a7,a6,a0
    3e9c:	0008a883          	lw	a7,0(a7)
    3ea0:	00168693          	add	a3,a3,1

00003ea4 <.LVL235>:
    3ea4:	00480813          	add	a6,a6,4
    3ea8:	ff182e23          	sw	a7,-4(a6)

00003eac <.LVL236>:
    3eac:	fed5d6e3          	bge	a1,a3,3e98 <.L130>
    3eb0:	00400693          	li	a3,4

00003eb4 <.LVL237>:
    3eb4:	40e68733          	sub	a4,a3,a4

00003eb8 <.LVL238>:
    3eb8:	06c0006f          	j	3f24 <.L134>

00003ebc <.L128>:
    3ebc:	00052803          	lw	a6,0(a0)
    3ec0:	00158593          	add	a1,a1,1

00003ec4 <.LVL240>:
    3ec4:	00450513          	add	a0,a0,4
    3ec8:	0107e7b3          	or	a5,a5,a6

00003ecc <.LVL241>:
    3ecc:	fb5ff06f          	j	3e80 <.L127>

00003ed0 <.L129>:
    3ed0:	04050813          	add	a6,a0,64
    3ed4:	03010893          	add	a7,sp,48
    3ed8:	01180833          	add	a6,a6,a7
    3edc:	fe082803          	lw	a6,-32(a6)
    3ee0:	02000313          	li	t1,32
    3ee4:	40d30333          	sub	t1,t1,a3
    3ee8:	00681833          	sll	a6,a6,t1
    3eec:	0107e7b3          	or	a5,a5,a6

00003ef0 <.LVL243>:
    3ef0:	00000e13          	li	t3,0
    3ef4:	00a60833          	add	a6,a2,a0
    3ef8:	40a00533          	neg	a0,a0

00003efc <.L132>:
    3efc:	0ebe4063          	blt	t3,a1,3fdc <.L133>
    3f00:	00400513          	li	a0,4
    3f04:	00259593          	sll	a1,a1,0x2
    3f08:	40e50733          	sub	a4,a0,a4

00003f0c <.LVL245>:
    3f0c:	04058593          	add	a1,a1,64
    3f10:	03010513          	add	a0,sp,48
    3f14:	00a585b3          	add	a1,a1,a0
    3f18:	05c12503          	lw	a0,92(sp)
    3f1c:	00d556b3          	srl	a3,a0,a3

00003f20 <.LVL246>:
    3f20:	fed5a023          	sw	a3,-32(a1)

00003f24 <.L134>:
    3f24:	00400693          	li	a3,4
    3f28:	40e686b3          	sub	a3,a3,a4
    3f2c:	00269693          	sll	a3,a3,0x2
    3f30:	00271713          	sll	a4,a4,0x2
    3f34:	00800593          	li	a1,8
    3f38:	00e60733          	add	a4,a2,a4
    3f3c:	00b6ea63          	bltu	a3,a1,3f50 <.L135>
    3f40:	00072023          	sw	zero,0(a4)
    3f44:	00072223          	sw	zero,4(a4)
    3f48:	ff868693          	add	a3,a3,-8
    3f4c:	00870713          	add	a4,a4,8

00003f50 <.L135>:
    3f50:	00400593          	li	a1,4
    3f54:	00b6e463          	bltu	a3,a1,3f5c <.L136>
    3f58:	00072023          	sw	zero,0(a4)

00003f5c <.L136>:
    3f5c:	05012703          	lw	a4,80(sp)

00003f60 <.LBB95>:
    3f60:	00f037b3          	snez	a5,a5

00003f64 <.LBE95>:
    3f64:	00e7e7b3          	or	a5,a5,a4
    3f68:	04f12823          	sw	a5,80(sp)

00003f6c <.LBE93>:
    3f6c:	0077f713          	and	a4,a5,7
    3f70:	04070463          	beqz	a4,3fb8 <.L137>
    3f74:	00f7f713          	and	a4,a5,15
    3f78:	00400693          	li	a3,4
    3f7c:	02d70e63          	beq	a4,a3,3fb8 <.L137>

00003f80 <.LBB97>:
    3f80:	05412703          	lw	a4,84(sp)
    3f84:	00478793          	add	a5,a5,4
    3f88:	04f12823          	sw	a5,80(sp)

00003f8c <.LVL249>:
    3f8c:	0047b793          	sltiu	a5,a5,4

00003f90 <.LVL250>:
    3f90:	00f707b3          	add	a5,a4,a5
    3f94:	04f12a23          	sw	a5,84(sp)

00003f98 <.LVL251>:
    3f98:	00e7b7b3          	sltu	a5,a5,a4

00003f9c <.LVL252>:
    3f9c:	05812703          	lw	a4,88(sp)
    3fa0:	00f707b3          	add	a5,a4,a5

00003fa4 <.LVL253>:
    3fa4:	04f12c23          	sw	a5,88(sp)

00003fa8 <.LVL254>:
    3fa8:	00e7b7b3          	sltu	a5,a5,a4

00003fac <.LVL255>:
    3fac:	05c12703          	lw	a4,92(sp)
    3fb0:	00e787b3          	add	a5,a5,a4

00003fb4 <.LVL256>:
    3fb4:	04f12e23          	sw	a5,92(sp)

00003fb8 <.L137>:
    3fb8:	05c12703          	lw	a4,92(sp)
    3fbc:	00c71793          	sll	a5,a4,0xc
    3fc0:	0407d263          	bgez	a5,4004 <.L142>

00003fc4 <.LVL258>:
    3fc4:	04012e23          	sw	zero,92(sp)
    3fc8:	04012c23          	sw	zero,88(sp)
    3fcc:	04012a23          	sw	zero,84(sp)
    3fd0:	04012823          	sw	zero,80(sp)
    3fd4:	00100793          	li	a5,1
    3fd8:	d91ff06f          	j	3d68 <.L125>

00003fdc <.L133>:
    3fdc:	00082883          	lw	a7,0(a6)
    3fe0:	00482e83          	lw	t4,4(a6)
    3fe4:	00a80f33          	add	t5,a6,a0
    3fe8:	00d8d8b3          	srl	a7,a7,a3
    3fec:	006e9eb3          	sll	t4,t4,t1
    3ff0:	01d8e8b3          	or	a7,a7,t4
    3ff4:	011f2023          	sw	a7,0(t5)

00003ff8 <.LVL260>:
    3ff8:	001e0e13          	add	t3,t3,1

00003ffc <.LVL261>:
    3ffc:	00480813          	add	a6,a6,4
    4000:	efdff06f          	j	3efc <.L132>

00004004 <.L142>:
    4004:	00c60593          	add	a1,a2,12

00004008 <.L143>:
    4008:	00062783          	lw	a5,0(a2)
    400c:	00462683          	lw	a3,4(a2)
    4010:	00460613          	add	a2,a2,4
    4014:	0037d793          	srl	a5,a5,0x3
    4018:	01d69693          	sll	a3,a3,0x1d
    401c:	00d7e7b3          	or	a5,a5,a3
    4020:	fef62e23          	sw	a5,-4(a2)
    4024:	fec592e3          	bne	a1,a2,4008 <.L143>

00004028 <.LVL264>:
    4028:	00375713          	srl	a4,a4,0x3
    402c:	04e12e23          	sw	a4,92(sp)

00004030 <.L144>:
    4030:	00000793          	li	a5,0
    4034:	d35ff06f          	j	3d68 <.L125>

00004038 <.L126>:
    4038:	05412703          	lw	a4,84(sp)
    403c:	05012783          	lw	a5,80(sp)
    4040:	00e7e7b3          	or	a5,a5,a4
    4044:	05812703          	lw	a4,88(sp)
    4048:	00e7e7b3          	or	a5,a5,a4
    404c:	05c12703          	lw	a4,92(sp)
    4050:	00e7e7b3          	or	a5,a5,a4
    4054:	fc078ee3          	beqz	a5,4030 <.L144>

00004058 <.L195>:
    4058:	04012e23          	sw	zero,92(sp)
    405c:	04012c23          	sw	zero,88(sp)
    4060:	04012a23          	sw	zero,84(sp)

00004064 <.LBB100>:
    4064:	04012823          	sw	zero,80(sp)
    4068:	fc9ff06f          	j	4030 <.L144>

0000406c <.L35>:
    406c:	000087b7          	lui	a5,0x8
    4070:	04f12e23          	sw	a5,92(sp)
    4074:	04012c23          	sw	zero,88(sp)
    4078:	04012a23          	sw	zero,84(sp)
    407c:	04012823          	sw	zero,80(sp)

00004080 <.LVL270>:
    4080:	fff78793          	add	a5,a5,-1 # 7fff <.LLST132+0x8>
    4084:	00000913          	li	s2,0
    4088:	ce1ff06f          	j	3d68 <.L125>

0000408c <__eqtf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__eqtf2 (TFtype a, TFtype b)
{
    408c:	00c52783          	lw	a5,12(a0)
    4090:	0005af03          	lw	t5,0(a1)
    4094:	0045af83          	lw	t6,4(a1)
    4098:	0085a283          	lw	t0,8(a1)
    409c:	00c5a583          	lw	a1,12(a1)

000040a0 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    40a0:	00008737          	lui	a4,0x8
    40a4:	0107d693          	srl	a3,a5,0x10
    40a8:	fff70713          	add	a4,a4,-1 # 7fff <.LLST132+0x8>
    40ac:	01079813          	sll	a6,a5,0x10

000040b0 <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    40b0:	01059e93          	sll	t4,a1,0x10

000040b4 <.LBB5>:
  FP_UNPACK_RAW_Q (A, a);
    40b4:	01f7d613          	srl	a2,a5,0x1f
    40b8:	00e6f6b3          	and	a3,a3,a4

000040bc <.LBB6>:
  FP_UNPACK_RAW_Q (B, b);
    40bc:	0105d793          	srl	a5,a1,0x10

000040c0 <.LBE6>:
{
    40c0:	00052883          	lw	a7,0(a0)

000040c4 <.LBB7>:
    40c4:	00452303          	lw	t1,4(a0)

000040c8 <.LBB8>:
    40c8:	00852e03          	lw	t3,8(a0)

000040cc <.LBB9>:
    40cc:	ff010113          	add	sp,sp,-16

000040d0 <.LBB10>:
  FP_UNPACK_RAW_Q (A, a);
    40d0:	01085813          	srl	a6,a6,0x10

000040d4 <.LBB11>:
  FP_UNPACK_RAW_Q (B, b);
    40d4:	010ede93          	srl	t4,t4,0x10

000040d8 <.LVL5>:
    40d8:	00e7f7b3          	and	a5,a5,a4
    40dc:	01f5d593          	srl	a1,a1,0x1f

000040e0 <.LBE11>:
  FP_CMP_EQ_Q (r, A, B, 1);
    40e0:	02e69063          	bne	a3,a4,4100 <.L2>
    40e4:	0068e733          	or	a4,a7,t1
    40e8:	01c76733          	or	a4,a4,t3
    40ec:	01076733          	or	a4,a4,a6
    40f0:	00100513          	li	a0,1
    40f4:	04071a63          	bnez	a4,4148 <.L1>
    40f8:	04d79863          	bne	a5,a3,4148 <.L1>
    40fc:	0080006f          	j	4104 <.L6>

00004100 <.L2>:
    4100:	00e79c63          	bne	a5,a4,4118 <.L5>

00004104 <.L6>:
    4104:	01ff6733          	or	a4,t5,t6
    4108:	00576733          	or	a4,a4,t0
    410c:	01d76733          	or	a4,a4,t4
    4110:	00100513          	li	a0,1
    4114:	02071a63          	bnez	a4,4148 <.L1>

00004118 <.L5>:
    4118:	00100513          	li	a0,1
    411c:	02d79663          	bne	a5,a3,4148 <.L1>
    4120:	03e89463          	bne	a7,t5,4148 <.L1>
    4124:	03f31263          	bne	t1,t6,4148 <.L1>
    4128:	025e1063          	bne	t3,t0,4148 <.L1>
    412c:	01d81e63          	bne	a6,t4,4148 <.L1>
    4130:	02b60063          	beq	a2,a1,4150 <.L14>
    4134:	00079a63          	bnez	a5,4148 <.L1>
    4138:	0068e533          	or	a0,a7,t1
    413c:	01c56533          	or	a0,a0,t3
    4140:	01056533          	or	a0,a0,a6
    4144:	00a03533          	snez	a0,a0

00004148 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    4148:	01010113          	add	sp,sp,16
    414c:	00008067          	ret

00004150 <.L14>:
  FP_CMP_EQ_Q (r, A, B, 1);
    4150:	00000513          	li	a0,0
    4154:	ff5ff06f          	j	4148 <.L1>

00004158 <__getf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__getf2 (TFtype a, TFtype b)
{
    4158:	00c52783          	lw	a5,12(a0)
    415c:	00c5a683          	lw	a3,12(a1)

00004160 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    4160:	00008737          	lui	a4,0x8
    4164:	0107d613          	srl	a2,a5,0x10
    4168:	fff70713          	add	a4,a4,-1 # 7fff <.LLST132+0x8>
    416c:	01079813          	sll	a6,a5,0x10

00004170 <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    4170:	01069293          	sll	t0,a3,0x10

00004174 <.LBE4>:
{
    4174:	00052883          	lw	a7,0(a0)

00004178 <.LBB5>:
    4178:	00452303          	lw	t1,4(a0)

0000417c <.LBB6>:
    417c:	00852e03          	lw	t3,8(a0)

00004180 <.LBB7>:
  FP_UNPACK_RAW_Q (A, a);
    4180:	00e67633          	and	a2,a2,a4

00004184 <.LBB8>:
  FP_UNPACK_RAW_Q (B, b);
    4184:	0106d513          	srl	a0,a3,0x10

00004188 <.LBE8>:
{
    4188:	0005ae83          	lw	t4,0(a1)
    418c:	0045af03          	lw	t5,4(a1)
    4190:	0085af83          	lw	t6,8(a1)
    4194:	ff010113          	add	sp,sp,-16

00004198 <.LBB9>:
  FP_UNPACK_RAW_Q (A, a);
    4198:	01085813          	srl	a6,a6,0x10

0000419c <.LVL4>:
    419c:	01f7d793          	srl	a5,a5,0x1f

000041a0 <.LBB10>:
  FP_UNPACK_RAW_Q (B, b);
    41a0:	0102d293          	srl	t0,t0,0x10

000041a4 <.LVL6>:
    41a4:	00e57533          	and	a0,a0,a4

000041a8 <.LVL7>:
    41a8:	01f6d693          	srl	a3,a3,0x1f

000041ac <.LBE10>:
  FP_CMP_Q (r, A, B, -2, 2);
    41ac:	00e61a63          	bne	a2,a4,41c0 <.L2>
    41b0:	01136733          	or	a4,t1,a7
    41b4:	01c76733          	or	a4,a4,t3
    41b8:	01076733          	or	a4,a4,a6
    41bc:	0a071463          	bnez	a4,4264 <.L17>

000041c0 <.L2>:
    41c0:	00008737          	lui	a4,0x8
    41c4:	fff70713          	add	a4,a4,-1 # 7fff <.LLST132+0x8>
    41c8:	00e51a63          	bne	a0,a4,41dc <.L4>
    41cc:	01eee733          	or	a4,t4,t5
    41d0:	01f76733          	or	a4,a4,t6
    41d4:	00576733          	or	a4,a4,t0
    41d8:	08071663          	bnez	a4,4264 <.L17>

000041dc <.L4>:
    41dc:	00000713          	li	a4,0
    41e0:	00061a63          	bnez	a2,41f4 <.L5>
    41e4:	01136733          	or	a4,t1,a7
    41e8:	01c76733          	or	a4,a4,t3
    41ec:	01076733          	or	a4,a4,a6
    41f0:	00173713          	seqz	a4,a4

000041f4 <.L5>:
    41f4:	06051c63          	bnez	a0,426c <.L6>
    41f8:	01eee5b3          	or	a1,t4,t5
    41fc:	01f5e5b3          	or	a1,a1,t6
    4200:	0055e5b3          	or	a1,a1,t0

00004204 <.LVL10>:
    4204:	00070c63          	beqz	a4,421c <.L7>
    4208:	02058063          	beqz	a1,4228 <.L1>

0000420c <.L39>:
    420c:	00100513          	li	a0,1

00004210 <.LVL12>:
    4210:	00069c63          	bnez	a3,4228 <.L1>

00004214 <.L35>:
    4214:	fff00513          	li	a0,-1
    4218:	0100006f          	j	4228 <.L1>

0000421c <.L7>:
    421c:	04059a63          	bnez	a1,4270 <.L8>

00004220 <.L12>:
    4220:	fff00513          	li	a0,-1

00004224 <.LVL15>:
    4224:	04078e63          	beqz	a5,4280 <.L34>

00004228 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    4228:	01010113          	add	sp,sp,16
    422c:	00008067          	ret

00004230 <.L10>:
  FP_CMP_Q (r, A, B, -2, 2);
    4230:	fca64ee3          	blt	a2,a0,420c <.L39>
    4234:	ff02e6e3          	bltu	t0,a6,4220 <.L12>
    4238:	02581063          	bne	a6,t0,4258 <.L13>
    423c:	ffcfe2e3          	bltu	t6,t3,4220 <.L12>
    4240:	01fe1c63          	bne	t3,t6,4258 <.L13>
    4244:	fc6f6ee3          	bltu	t5,t1,4220 <.L12>
    4248:	01e31863          	bne	t1,t5,4258 <.L13>
    424c:	fd1eeae3          	bltu	t4,a7,4220 <.L12>
    4250:	00000513          	li	a0,0

00004254 <.LVL18>:
    4254:	fdd8fae3          	bgeu	a7,t4,4228 <.L1>

00004258 <.L13>:
    4258:	00100513          	li	a0,1
    425c:	fc0796e3          	bnez	a5,4228 <.L1>
    4260:	fb5ff06f          	j	4214 <.L35>

00004264 <.L17>:
    4264:	ffe00513          	li	a0,-2

00004268 <.LVL20>:
    4268:	fc1ff06f          	j	4228 <.L1>

0000426c <.L6>:
    426c:	fa0710e3          	bnez	a4,420c <.L39>

00004270 <.L8>:
    4270:	faf698e3          	bne	a3,a5,4220 <.L12>
    4274:	fac55ee3          	bge	a0,a2,4230 <.L10>
    4278:	fff00513          	li	a0,-1

0000427c <.LVL23>:
    427c:	fa0696e3          	bnez	a3,4228 <.L1>

00004280 <.L34>:
    4280:	00100513          	li	a0,1
    4284:	fa5ff06f          	j	4228 <.L1>

00004288 <__letf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__letf2 (TFtype a, TFtype b)
{
    4288:	00c52783          	lw	a5,12(a0)
    428c:	00c5a683          	lw	a3,12(a1)

00004290 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    4290:	00008737          	lui	a4,0x8
    4294:	0107d613          	srl	a2,a5,0x10
    4298:	fff70713          	add	a4,a4,-1 # 7fff <.LLST132+0x8>
    429c:	01079813          	sll	a6,a5,0x10

000042a0 <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    42a0:	01069293          	sll	t0,a3,0x10

000042a4 <.LBE4>:
{
    42a4:	00052883          	lw	a7,0(a0)

000042a8 <.LBB5>:
    42a8:	00452303          	lw	t1,4(a0)

000042ac <.LBB6>:
    42ac:	00852e03          	lw	t3,8(a0)

000042b0 <.LBB7>:
  FP_UNPACK_RAW_Q (A, a);
    42b0:	00e67633          	and	a2,a2,a4

000042b4 <.LBB8>:
  FP_UNPACK_RAW_Q (B, b);
    42b4:	0106d513          	srl	a0,a3,0x10

000042b8 <.LBE8>:
{
    42b8:	0005ae83          	lw	t4,0(a1)
    42bc:	0045af03          	lw	t5,4(a1)
    42c0:	0085af83          	lw	t6,8(a1)
    42c4:	ff010113          	add	sp,sp,-16

000042c8 <.LBB9>:
  FP_UNPACK_RAW_Q (A, a);
    42c8:	01085813          	srl	a6,a6,0x10

000042cc <.LVL4>:
    42cc:	01f7d793          	srl	a5,a5,0x1f

000042d0 <.LBB10>:
  FP_UNPACK_RAW_Q (B, b);
    42d0:	0102d293          	srl	t0,t0,0x10

000042d4 <.LVL6>:
    42d4:	00e57533          	and	a0,a0,a4

000042d8 <.LVL7>:
    42d8:	01f6d693          	srl	a3,a3,0x1f

000042dc <.LBE10>:
  FP_CMP_Q (r, A, B, 2, 2);
    42dc:	00e61a63          	bne	a2,a4,42f0 <.L2>
    42e0:	01136733          	or	a4,t1,a7
    42e4:	01c76733          	or	a4,a4,t3
    42e8:	01076733          	or	a4,a4,a6
    42ec:	0a071463          	bnez	a4,4394 <.L17>

000042f0 <.L2>:
    42f0:	00008737          	lui	a4,0x8
    42f4:	fff70713          	add	a4,a4,-1 # 7fff <.LLST132+0x8>
    42f8:	00e51a63          	bne	a0,a4,430c <.L4>
    42fc:	01eee733          	or	a4,t4,t5
    4300:	01f76733          	or	a4,a4,t6
    4304:	00576733          	or	a4,a4,t0
    4308:	08071663          	bnez	a4,4394 <.L17>

0000430c <.L4>:
    430c:	00000713          	li	a4,0
    4310:	00061a63          	bnez	a2,4324 <.L5>
    4314:	01136733          	or	a4,t1,a7
    4318:	01c76733          	or	a4,a4,t3
    431c:	01076733          	or	a4,a4,a6
    4320:	00173713          	seqz	a4,a4

00004324 <.L5>:
    4324:	06051c63          	bnez	a0,439c <.L6>
    4328:	01eee5b3          	or	a1,t4,t5
    432c:	01f5e5b3          	or	a1,a1,t6
    4330:	0055e5b3          	or	a1,a1,t0

00004334 <.LVL10>:
    4334:	00070c63          	beqz	a4,434c <.L7>
    4338:	02058063          	beqz	a1,4358 <.L1>

0000433c <.L39>:
    433c:	00100513          	li	a0,1

00004340 <.LVL12>:
    4340:	00069c63          	bnez	a3,4358 <.L1>

00004344 <.L35>:
    4344:	fff00513          	li	a0,-1
    4348:	0100006f          	j	4358 <.L1>

0000434c <.L7>:
    434c:	04059a63          	bnez	a1,43a0 <.L8>

00004350 <.L12>:
    4350:	fff00513          	li	a0,-1

00004354 <.LVL15>:
    4354:	04078e63          	beqz	a5,43b0 <.L34>

00004358 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    4358:	01010113          	add	sp,sp,16
    435c:	00008067          	ret

00004360 <.L10>:
  FP_CMP_Q (r, A, B, 2, 2);
    4360:	fca64ee3          	blt	a2,a0,433c <.L39>
    4364:	ff02e6e3          	bltu	t0,a6,4350 <.L12>
    4368:	02581063          	bne	a6,t0,4388 <.L13>
    436c:	ffcfe2e3          	bltu	t6,t3,4350 <.L12>
    4370:	01fe1c63          	bne	t3,t6,4388 <.L13>
    4374:	fc6f6ee3          	bltu	t5,t1,4350 <.L12>
    4378:	01e31863          	bne	t1,t5,4388 <.L13>
    437c:	fd1eeae3          	bltu	t4,a7,4350 <.L12>
    4380:	00000513          	li	a0,0

00004384 <.LVL18>:
    4384:	fdd8fae3          	bgeu	a7,t4,4358 <.L1>

00004388 <.L13>:
    4388:	00100513          	li	a0,1
    438c:	fc0796e3          	bnez	a5,4358 <.L1>
    4390:	fb5ff06f          	j	4344 <.L35>

00004394 <.L17>:
    4394:	00200513          	li	a0,2

00004398 <.LVL20>:
    4398:	fc1ff06f          	j	4358 <.L1>

0000439c <.L6>:
    439c:	fa0710e3          	bnez	a4,433c <.L39>

000043a0 <.L8>:
    43a0:	faf698e3          	bne	a3,a5,4350 <.L12>
    43a4:	fac55ee3          	bge	a0,a2,4360 <.L10>
    43a8:	fff00513          	li	a0,-1

000043ac <.LVL23>:
    43ac:	fa0696e3          	bnez	a3,4358 <.L1>

000043b0 <.L34>:
    43b0:	00100513          	li	a0,1
    43b4:	fa5ff06f          	j	4358 <.L1>

000043b8 <__multf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__multf3 (TFtype a, TFtype b)
{
    43b8:	f5010113          	add	sp,sp,-176
    43bc:	09412c23          	sw	s4,152(sp)
    43c0:	00c5aa03          	lw	s4,12(a1)
    43c4:	0005a783          	lw	a5,0(a1)
    43c8:	0085a683          	lw	a3,8(a1)
    43cc:	0a812423          	sw	s0,168(sp)
    43d0:	00050413          	mv	s0,a0
    43d4:	0045a503          	lw	a0,4(a1)

000043d8 <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_Q (A, a);
    43d8:	010a1713          	sll	a4,s4,0x10

000043dc <.LBE3>:
{
    43dc:	0b212023          	sw	s2,160(sp)
    43e0:	09312e23          	sw	s3,156(sp)
    43e4:	00062903          	lw	s2,0(a2)
    43e8:	00c62983          	lw	s3,12(a2)
    43ec:	09512a23          	sw	s5,148(sp)
    43f0:	09612823          	sw	s6,144(sp)
    43f4:	00862a83          	lw	s5,8(a2)
    43f8:	00462b03          	lw	s6,4(a2)

000043fc <.LBB4>:
  FP_UNPACK_Q (A, a);
    43fc:	00008637          	lui	a2,0x8

00004400 <.LBE4>:
{
    4400:	0a912223          	sw	s1,164(sp)

00004404 <.LBB5>:
  FP_UNPACK_Q (A, a);
    4404:	01075713          	srl	a4,a4,0x10
    4408:	010a5493          	srl	s1,s4,0x10
    440c:	fff60613          	add	a2,a2,-1 # 7fff <.LLST132+0x8>
    4410:	05412e23          	sw	s4,92(sp)

00004414 <.LBE5>:
{
    4414:	0a112623          	sw	ra,172(sp)
    4418:	09712623          	sw	s7,140(sp)
    441c:	09812423          	sw	s8,136(sp)
    4420:	09912223          	sw	s9,132(sp)
    4424:	09a12023          	sw	s10,128(sp)
    4428:	07b12e23          	sw	s11,124(sp)

0000442c <.LBB6>:
  FP_UNPACK_Q (A, a);
    442c:	04f12823          	sw	a5,80(sp)
    4430:	04a12a23          	sw	a0,84(sp)
    4434:	04d12c23          	sw	a3,88(sp)
    4438:	02f12023          	sw	a5,32(sp)
    443c:	02a12223          	sw	a0,36(sp)
    4440:	02d12423          	sw	a3,40(sp)
    4444:	02e12623          	sw	a4,44(sp)
    4448:	00c4f4b3          	and	s1,s1,a2

0000444c <.LVL2>:
    444c:	01fa5a13          	srl	s4,s4,0x1f

00004450 <.LBE6>:
    4450:	080482e3          	beqz	s1,4cd4 <.L2>
    4454:	1ac48ce3          	beq	s1,a2,4e0c <.L3>
    4458:	000106b7          	lui	a3,0x10
    445c:	00d76733          	or	a4,a4,a3
    4460:	02e12623          	sw	a4,44(sp)

00004464 <.LBB7>:
    4464:	02010593          	add	a1,sp,32
    4468:	02c10713          	add	a4,sp,44

0000446c <.L4>:
    446c:	00072683          	lw	a3,0(a4)
    4470:	ffc72603          	lw	a2,-4(a4)
    4474:	ffc70713          	add	a4,a4,-4
    4478:	00369693          	sll	a3,a3,0x3
    447c:	01d65613          	srl	a2,a2,0x1d
    4480:	00c6e6b3          	or	a3,a3,a2
    4484:	00d72223          	sw	a3,4(a4)
    4488:	fee592e3          	bne	a1,a4,446c <.L4>

0000448c <.LVL6>:
    448c:	00379793          	sll	a5,a5,0x3
    4490:	02f12023          	sw	a5,32(sp)

00004494 <.LBE7>:
    4494:	ffffc7b7          	lui	a5,0xffffc
    4498:	00178793          	add	a5,a5,1 # ffffc001 <_ebss+0xfffee461>
    449c:	00f484b3          	add	s1,s1,a5

000044a0 <.L209>:
    44a0:	00000b93          	li	s7,0

000044a4 <.L5>:
  FP_UNPACK_Q (B, b);
    44a4:	01099513          	sll	a0,s3,0x10
    44a8:	00008737          	lui	a4,0x8
    44ac:	0109d793          	srl	a5,s3,0x10
    44b0:	01055513          	srl	a0,a0,0x10
    44b4:	fff70713          	add	a4,a4,-1 # 7fff <.LLST132+0x8>
    44b8:	05312e23          	sw	s3,92(sp)
    44bc:	05212823          	sw	s2,80(sp)
    44c0:	05612a23          	sw	s6,84(sp)
    44c4:	05512c23          	sw	s5,88(sp)
    44c8:	03212823          	sw	s2,48(sp)
    44cc:	03612a23          	sw	s6,52(sp)
    44d0:	03512c23          	sw	s5,56(sp)
    44d4:	02a12e23          	sw	a0,60(sp)
    44d8:	00e7f7b3          	and	a5,a5,a4

000044dc <.LVL9>:
    44dc:	01f9d993          	srl	s3,s3,0x1f

000044e0 <.LBE11>:
    44e0:	14078ae3          	beqz	a5,4e34 <.L18>
    44e4:	28e784e3          	beq	a5,a4,4f6c <.L19>
    44e8:	00010737          	lui	a4,0x10
    44ec:	00e56533          	or	a0,a0,a4
    44f0:	02a12e23          	sw	a0,60(sp)

000044f4 <.LBB12>:
    44f4:	03010593          	add	a1,sp,48
    44f8:	03c10713          	add	a4,sp,60

000044fc <.L20>:
    44fc:	00072683          	lw	a3,0(a4) # 10000 <_ebss+0x2460>
    4500:	ffc72603          	lw	a2,-4(a4)
    4504:	ffc70713          	add	a4,a4,-4
    4508:	00369693          	sll	a3,a3,0x3
    450c:	01d65613          	srl	a2,a2,0x1d
    4510:	00c6e6b3          	or	a3,a3,a2
    4514:	00d72223          	sw	a3,4(a4)
    4518:	fee592e3          	bne	a1,a4,44fc <.L20>

0000451c <.LBE12>:
    451c:	ffffc737          	lui	a4,0xffffc

00004520 <.LBB13>:
    4520:	00391913          	sll	s2,s2,0x3

00004524 <.LBE13>:
    4524:	00170713          	add	a4,a4,1 # ffffc001 <_ebss+0xfffee461>

00004528 <.LBB14>:
    4528:	03212823          	sw	s2,48(sp)

0000452c <.LBE14>:
    452c:	00e787b3          	add	a5,a5,a4

00004530 <.L210>:
    4530:	00000693          	li	a3,0

00004534 <.L21>:
  FP_MUL_Q (R, A, B);
    4534:	009787b3          	add	a5,a5,s1

00004538 <.LVL16>:
    4538:	00f12623          	sw	a5,12(sp)
    453c:	00178793          	add	a5,a5,1
    4540:	00f12423          	sw	a5,8(sp)

00004544 <.LVL17>:
    4544:	002b9793          	sll	a5,s7,0x2

00004548 <.LVL18>:
    4548:	00d7e7b3          	or	a5,a5,a3
    454c:	00a00713          	li	a4,10
    4550:	28f742e3          	blt	a4,a5,4fd4 <.L34>
    4554:	013a4733          	xor	a4,s4,s3
    4558:	00e12223          	sw	a4,4(sp)
    455c:	00200713          	li	a4,2
    4560:	22f74ae3          	blt	a4,a5,4f94 <.L35>
    4564:	fff78793          	add	a5,a5,-1
    4568:	00100713          	li	a4,1
    456c:	28f770e3          	bgeu	a4,a5,4fec <.L37>

00004570 <.L36>:
    4570:	02012883          	lw	a7,32(sp)

00004574 <.LVL20>:
    4574:	03012f03          	lw	t5,48(sp)
    4578:	000105b7          	lui	a1,0x10
    457c:	fff58713          	add	a4,a1,-1 # ffff <_ebss+0x245f>
    4580:	0108d913          	srl	s2,a7,0x10

00004584 <.LVL21>:
    4584:	010f5493          	srl	s1,t5,0x10

00004588 <.LVL22>:
    4588:	00e8f8b3          	and	a7,a7,a4

0000458c <.LVL23>:
    458c:	00ef7f33          	and	t5,t5,a4

00004590 <.LVL24>:
    4590:	031f0633          	mul	a2,t5,a7

00004594 <.LVL25>:
    4594:	03e90533          	mul	a0,s2,t5

00004598 <.LVL26>:
    4598:	01065793          	srl	a5,a2,0x10
    459c:	031486b3          	mul	a3,s1,a7

000045a0 <.LVL27>:
    45a0:	00a686b3          	add	a3,a3,a0

000045a4 <.LVL28>:
    45a4:	00d787b3          	add	a5,a5,a3
    45a8:	02990bb3          	mul	s7,s2,s1

000045ac <.LVL29>:
    45ac:	00a7f463          	bgeu	a5,a0,45b4 <.L42>
    45b0:	00bb8bb3          	add	s7,s7,a1

000045b4 <.L42>:
    45b4:	03412e83          	lw	t4,52(sp)

000045b8 <.LBB22>:
    45b8:	0107d693          	srl	a3,a5,0x10
    45bc:	00e7f7b3          	and	a5,a5,a4

000045c0 <.LVL31>:
    45c0:	00e67633          	and	a2,a2,a4

000045c4 <.LVL32>:
    45c4:	01079793          	sll	a5,a5,0x10
    45c8:	00c787b3          	add	a5,a5,a2

000045cc <.LBB23>:
    45cc:	010ed293          	srl	t0,t4,0x10
    45d0:	00eefeb3          	and	t4,t4,a4
    45d4:	03d90633          	mul	a2,s2,t4

000045d8 <.LBB24>:
    45d8:	00f12823          	sw	a5,16(sp)
    45dc:	04f12823          	sw	a5,80(sp)

000045e0 <.LBB25>:
    45e0:	03128733          	mul	a4,t0,a7
    45e4:	031e87b3          	mul	a5,t4,a7

000045e8 <.LVL34>:
    45e8:	00c70733          	add	a4,a4,a2

000045ec <.LVL35>:
    45ec:	0107d313          	srl	t1,a5,0x10
    45f0:	00e30333          	add	t1,t1,a4
    45f4:	02590b33          	mul	s6,s2,t0

000045f8 <.LVL36>:
    45f8:	00c37663          	bgeu	t1,a2,4604 <.L43>
    45fc:	00010737          	lui	a4,0x10
    4600:	00eb0b33          	add	s6,s6,a4

00004604 <.L43>:
    4604:	02412803          	lw	a6,36(sp)

00004608 <.LBB27>:
    4608:	00010737          	lui	a4,0x10
    460c:	fff70613          	add	a2,a4,-1 # ffff <_ebss+0x245f>

00004610 <.LVL38>:
    4610:	01035513          	srl	a0,t1,0x10

00004614 <.LVL39>:
    4614:	00c37333          	and	t1,t1,a2

00004618 <.LVL40>:
    4618:	00c7f7b3          	and	a5,a5,a2

0000461c <.LBB28>:
    461c:	01085393          	srl	t2,a6,0x10

00004620 <.LBB29>:
    4620:	01031313          	sll	t1,t1,0x10
    4624:	00c87833          	and	a6,a6,a2
    4628:	00f30333          	add	t1,t1,a5

0000462c <.LBB30>:
    462c:	03e38fb3          	mul	t6,t2,t5
    4630:	006686b3          	add	a3,a3,t1

00004634 <.LBB31>:
    4634:	03e807b3          	mul	a5,a6,t5

00004638 <.LVL43>:
    4638:	03048e33          	mul	t3,s1,a6

0000463c <.LVL44>:
    463c:	0107d613          	srl	a2,a5,0x10
    4640:	01fe0e33          	add	t3,t3,t6

00004644 <.LVL45>:
    4644:	01c60633          	add	a2,a2,t3
    4648:	027485b3          	mul	a1,s1,t2

0000464c <.LVL46>:
    464c:	01f67463          	bgeu	a2,t6,4654 <.L44>
    4650:	00e585b3          	add	a1,a1,a4

00004654 <.L44>:
    4654:	01065a93          	srl	s5,a2,0x10
    4658:	00010737          	lui	a4,0x10
    465c:	00ba8ab3          	add	s5,s5,a1

00004660 <.LVL48>:
    4660:	fff70593          	add	a1,a4,-1 # ffff <_ebss+0x245f>

00004664 <.LVL49>:
    4664:	00b7f7b3          	and	a5,a5,a1

00004668 <.LVL50>:
    4668:	00b67633          	and	a2,a2,a1

0000466c <.LVL51>:
    466c:	01061613          	sll	a2,a2,0x10

00004670 <.LBB32>:
    4670:	030e85b3          	mul	a1,t4,a6

00004674 <.LBB33>:
    4674:	00f60633          	add	a2,a2,a5

00004678 <.LBB34>:
    4678:	03d38fb3          	mul	t6,t2,t4

0000467c <.LVL53>:
    467c:	0105d793          	srl	a5,a1,0x10
    4680:	03028e33          	mul	t3,t0,a6

00004684 <.LVL54>:
    4684:	01fe0e33          	add	t3,t3,t6

00004688 <.LVL55>:
    4688:	01c787b3          	add	a5,a5,t3
    468c:	027289b3          	mul	s3,t0,t2

00004690 <.LVL56>:
    4690:	01f7f463          	bgeu	a5,t6,4698 <.L45>
    4694:	00e989b3          	add	s3,s3,a4

00004698 <.L45>:
    4698:	0107d713          	srl	a4,a5,0x10
    469c:	01370733          	add	a4,a4,s3
    46a0:	00010a37          	lui	s4,0x10

000046a4 <.LVL58>:
    46a4:	00e12a23          	sw	a4,20(sp)

000046a8 <.LVL59>:
    46a8:	fffa0713          	add	a4,s4,-1 # ffff <_ebss+0x245f>

000046ac <.LBB35>:
    46ac:	03812e03          	lw	t3,56(sp)

000046b0 <.LBB36>:
    46b0:	00e7f7b3          	and	a5,a5,a4

000046b4 <.LVL61>:
    46b4:	00e5f5b3          	and	a1,a1,a4

000046b8 <.LVL62>:
    46b8:	01079793          	sll	a5,a5,0x10
    46bc:	00b787b3          	add	a5,a5,a1
    46c0:	00f12c23          	sw	a5,24(sp)

000046c4 <.LBB37>:
    46c4:	010e5793          	srl	a5,t3,0x10

000046c8 <.LVL64>:
    46c8:	00ee7e33          	and	t3,t3,a4

000046cc <.LVL65>:
    46cc:	031e05b3          	mul	a1,t3,a7

000046d0 <.LVL66>:
    46d0:	03c90c33          	mul	s8,s2,t3

000046d4 <.LVL67>:
    46d4:	0105d713          	srl	a4,a1,0x10
    46d8:	031789b3          	mul	s3,a5,a7

000046dc <.LVL68>:
    46dc:	018989b3          	add	s3,s3,s8

000046e0 <.LVL69>:
    46e0:	01370733          	add	a4,a4,s3
    46e4:	02f90fb3          	mul	t6,s2,a5

000046e8 <.LVL70>:
    46e8:	01877463          	bgeu	a4,s8,46f0 <.L46>
    46ec:	014f8fb3          	add	t6,t6,s4

000046f0 <.L46>:
    46f0:	01075993          	srl	s3,a4,0x10
    46f4:	00010cb7          	lui	s9,0x10
    46f8:	01f98fb3          	add	t6,s3,t6

000046fc <.LVL72>:
    46fc:	fffc8993          	add	s3,s9,-1 # ffff <_ebss+0x245f>
    4700:	01377733          	and	a4,a4,s3

00004704 <.LVL73>:
    4704:	0135f5b3          	and	a1,a1,s3

00004708 <.LVL74>:
    4708:	01071713          	sll	a4,a4,0x10
    470c:	00b70733          	add	a4,a4,a1

00004710 <.LBB38>:
    4710:	02812583          	lw	a1,40(sp)

00004714 <.LBB39>:
    4714:	01f12e23          	sw	t6,28(sp)

00004718 <.LBB40>:
    4718:	0105df93          	srl	t6,a1,0x10

0000471c <.LVL76>:
    471c:	0135f5b3          	and	a1,a1,s3

00004720 <.LVL77>:
    4720:	03e58a33          	mul	s4,a1,t5

00004724 <.LVL78>:
    4724:	03ef8d33          	mul	s10,t6,t5

00004728 <.LVL79>:
    4728:	010a5d93          	srl	s11,s4,0x10
    472c:	02b489b3          	mul	s3,s1,a1

00004730 <.LVL80>:
    4730:	01a989b3          	add	s3,s3,s10

00004734 <.LVL81>:
    4734:	013d89b3          	add	s3,s11,s3
    4738:	03f48c33          	mul	s8,s1,t6

0000473c <.LVL82>:
    473c:	01a9f463          	bgeu	s3,s10,4744 <.L47>
    4740:	019c0c33          	add	s8,s8,s9

00004744 <.L47>:
    4744:	00db86b3          	add	a3,s7,a3
    4748:	0066b333          	sltu	t1,a3,t1

0000474c <.LBB42>:
    474c:	0109dd13          	srl	s10,s3,0x10

00004750 <.LBB43>:
    4750:	00650533          	add	a0,a0,t1

00004754 <.LBB44>:
    4754:	00010cb7          	lui	s9,0x10

00004758 <.LBB45>:
    4758:	01650533          	add	a0,a0,s6

0000475c <.LBB46>:
    475c:	018d0d33          	add	s10,s10,s8

00004760 <.LVL87>:
    4760:	00c68633          	add	a2,a3,a2

00004764 <.LVL88>:
    4764:	fffc8c13          	add	s8,s9,-1 # ffff <_ebss+0x245f>

00004768 <.LVL89>:
    4768:	01550ab3          	add	s5,a0,s5

0000476c <.LVL90>:
    476c:	0189f9b3          	and	s3,s3,s8

00004770 <.LBB47>:
    4770:	00d636b3          	sltu	a3,a2,a3
    4774:	00da86b3          	add	a3,s5,a3

00004778 <.LBB48>:
    4778:	01099993          	sll	s3,s3,0x10
    477c:	018a7a33          	and	s4,s4,s8

00004780 <.LVL92>:
    4780:	01498a33          	add	s4,s3,s4

00004784 <.LBB49>:
    4784:	00aab9b3          	sltu	s3,s5,a0
    4788:	0156bab3          	sltu	s5,a3,s5
    478c:	0159e9b3          	or	s3,s3,s5

00004790 <.LBB51>:
    4790:	00653533          	sltu	a0,a0,t1

00004794 <.LBB52>:
    4794:	00a98533          	add	a0,s3,a0
    4798:	01812303          	lw	t1,24(sp)

0000479c <.LVL95>:
    479c:	01412983          	lw	s3,20(sp)
    47a0:	04c12a23          	sw	a2,84(sp)

000047a4 <.LBB53>:
    47a4:	00668333          	add	t1,a3,t1

000047a8 <.LVL97>:
    47a8:	01350ab3          	add	s5,a0,s3

000047ac <.LVL98>:
    47ac:	01c12983          	lw	s3,28(sp)
    47b0:	00d336b3          	sltu	a3,t1,a3

000047b4 <.LVL99>:
    47b4:	00da86b3          	add	a3,s5,a3

000047b8 <.LBB54>:
    47b8:	00e30733          	add	a4,t1,a4

000047bc <.LVL101>:
    47bc:	01368b33          	add	s6,a3,s3

000047c0 <.LVL102>:
    47c0:	00673333          	sltu	t1,a4,t1

000047c4 <.LVL103>:
    47c4:	006b0333          	add	t1,s6,t1

000047c8 <.LVL104>:
    47c8:	01470a33          	add	s4,a4,s4

000047cc <.LVL105>:
    47cc:	01a30d33          	add	s10,t1,s10

000047d0 <.LBB55>:
    47d0:	00ea3733          	sltu	a4,s4,a4

000047d4 <.LBB56>:
    47d4:	00aab533          	sltu	a0,s5,a0

000047d8 <.LVL107>:
    47d8:	00ed0733          	add	a4,s10,a4
    47dc:	0156bab3          	sltu	s5,a3,s5

000047e0 <.LBB57>:
    47e0:	00db36b3          	sltu	a3,s6,a3

000047e4 <.LVL109>:
    47e4:	01633b33          	sltu	s6,t1,s6

000047e8 <.LVL110>:
    47e8:	0166e6b3          	or	a3,a3,s6

000047ec <.LBB58>:
    47ec:	006d39b3          	sltu	s3,s10,t1

000047f0 <.LBB59>:
    47f0:	01556ab3          	or	s5,a0,s5

000047f4 <.LBB60>:
    47f4:	01a73d33          	sltu	s10,a4,s10

000047f8 <.LBB61>:
    47f8:	00da8ab3          	add	s5,s5,a3

000047fc <.LBB62>:
    47fc:	01a9e9b3          	or	s3,s3,s10
    4800:	015989b3          	add	s3,s3,s5

00004804 <.LBB63>:
    4804:	03c12a83          	lw	s5,60(sp)

00004808 <.LBB64>:
    4808:	05412c23          	sw	s4,88(sp)

0000480c <.LBB65>:
    480c:	010adb13          	srl	s6,s5,0x10

00004810 <.LVL114>:
    4810:	018afab3          	and	s5,s5,s8

00004814 <.LVL115>:
    4814:	031a86b3          	mul	a3,s5,a7

00004818 <.LVL116>:
    4818:	03590533          	mul	a0,s2,s5

0000481c <.LVL117>:
    481c:	031b08b3          	mul	a7,s6,a7

00004820 <.LVL118>:
    4820:	00a88333          	add	t1,a7,a0
    4824:	0106d893          	srl	a7,a3,0x10

00004828 <.LVL119>:
    4828:	006888b3          	add	a7,a7,t1
    482c:	03690933          	mul	s2,s2,s6

00004830 <.LVL120>:
    4830:	00a8f463          	bgeu	a7,a0,4838 <.L72>
    4834:	01990933          	add	s2,s2,s9

00004838 <.L72>:
    4838:	02c12b83          	lw	s7,44(sp)

0000483c <.LBB67>:
    483c:	0108d513          	srl	a0,a7,0x10

00004840 <.LVL123>:
    4840:	01250533          	add	a0,a0,s2
    4844:	00010c37          	lui	s8,0x10
    4848:	00a12a23          	sw	a0,20(sp)

0000484c <.LVL124>:
    484c:	fffc0513          	add	a0,s8,-1 # ffff <_ebss+0x245f>

00004850 <.LBB68>:
    4850:	010bd913          	srl	s2,s7,0x10

00004854 <.LVL126>:
    4854:	00abfbb3          	and	s7,s7,a0

00004858 <.LBB69>:
    4858:	00a6f6b3          	and	a3,a3,a0

0000485c <.LVL127>:
    485c:	00a8f8b3          	and	a7,a7,a0

00004860 <.LBB70>:
    4860:	03248333          	mul	t1,s1,s2

00004864 <.LBB71>:
    4864:	01089893          	sll	a7,a7,0x10
    4868:	00d888b3          	add	a7,a7,a3

0000486c <.LBB72>:
    486c:	03eb8533          	mul	a0,s7,t5

00004870 <.LVL131>:
    4870:	037484b3          	mul	s1,s1,s7

00004874 <.LVL132>:
    4874:	01055693          	srl	a3,a0,0x10
    4878:	03e90f33          	mul	t5,s2,t5

0000487c <.LVL133>:
    487c:	01e484b3          	add	s1,s1,t5

00004880 <.LVL134>:
    4880:	009686b3          	add	a3,a3,s1

00004884 <.LVL135>:
    4884:	01e6f463          	bgeu	a3,t5,488c <.L73>
    4888:	01830333          	add	t1,t1,s8

0000488c <.L73>:
    488c:	0106df13          	srl	t5,a3,0x10

00004890 <.LVL137>:
    4890:	006f0333          	add	t1,t5,t1

00004894 <.LVL138>:
    4894:	00010cb7          	lui	s9,0x10

00004898 <.LVL139>:
    4898:	00612c23          	sw	t1,24(sp)

0000489c <.LVL140>:
    489c:	fffc8313          	add	t1,s9,-1 # ffff <_ebss+0x245f>

000048a0 <.LVL141>:
    48a0:	00657533          	and	a0,a0,t1

000048a4 <.LVL142>:
    48a4:	0066f6b3          	and	a3,a3,t1

000048a8 <.LBB73>:
    48a8:	03c38f33          	mul	t5,t2,t3

000048ac <.LBB74>:
    48ac:	01069693          	sll	a3,a3,0x10
    48b0:	00a686b3          	add	a3,a3,a0

000048b4 <.LBB75>:
    48b4:	03c80333          	mul	t1,a6,t3

000048b8 <.LVL145>:
    48b8:	030784b3          	mul	s1,a5,a6

000048bc <.LVL146>:
    48bc:	01035513          	srl	a0,t1,0x10
    48c0:	01e484b3          	add	s1,s1,t5

000048c4 <.LVL147>:
    48c4:	00950533          	add	a0,a0,s1
    48c8:	02f38c33          	mul	s8,t2,a5

000048cc <.LVL148>:
    48cc:	01e57463          	bgeu	a0,t5,48d4 <.L74>
    48d0:	019c0c33          	add	s8,s8,s9

000048d4 <.L74>:
    48d4:	00010d37          	lui	s10,0x10
    48d8:	fffd0f13          	add	t5,s10,-1 # ffff <_ebss+0x245f>
    48dc:	01055493          	srl	s1,a0,0x10
    48e0:	01e57533          	and	a0,a0,t5

000048e4 <.LVL150>:
    48e4:	01e37333          	and	t1,t1,t5

000048e8 <.LVL151>:
    48e8:	01051513          	sll	a0,a0,0x10
    48ec:	018484b3          	add	s1,s1,s8

000048f0 <.LBB76>:
    48f0:	02b28f33          	mul	t5,t0,a1

000048f4 <.LBB77>:
    48f4:	00650533          	add	a0,a0,t1

000048f8 <.LBB78>:
    48f8:	03df8c33          	mul	s8,t6,t4

000048fc <.LVL154>:
    48fc:	02be8333          	mul	t1,t4,a1

00004900 <.LVL155>:
    4900:	018f0f33          	add	t5,t5,s8

00004904 <.LVL156>:
    4904:	01035d93          	srl	s11,t1,0x10

00004908 <.LVL157>:
    4908:	01ed8f33          	add	t5,s11,t5
    490c:	03f28cb3          	mul	s9,t0,t6

00004910 <.LVL158>:
    4910:	018f7463          	bgeu	t5,s8,4918 <.L75>
    4914:	01ac8cb3          	add	s9,s9,s10

00004918 <.L75>:
    4918:	010f5c13          	srl	s8,t5,0x10
    491c:	019c0c33          	add	s8,s8,s9

00004920 <.LVL160>:
    4920:	00010cb7          	lui	s9,0x10

00004924 <.LVL161>:
    4924:	fffc8d13          	add	s10,s9,-1 # ffff <_ebss+0x245f>

00004928 <.LVL162>:
    4928:	01af7f33          	and	t5,t5,s10

0000492c <.LVL163>:
    492c:	010f1f13          	sll	t5,t5,0x10
    4930:	01a37333          	and	t1,t1,s10

00004934 <.LVL164>:
    4934:	006f0333          	add	t1,t5,t1

00004938 <.LBB79>:
    4938:	01412f03          	lw	t5,20(sp)
    493c:	011708b3          	add	a7,a4,a7

00004940 <.LVL166>:
    4940:	01812d03          	lw	s10,24(sp)

00004944 <.LVL167>:
    4944:	01e98f33          	add	t5,s3,t5

00004948 <.LVL168>:
    4948:	00e8b733          	sltu	a4,a7,a4

0000494c <.LVL169>:
    494c:	00ef0733          	add	a4,t5,a4

00004950 <.LBB80>:
    4950:	00d886b3          	add	a3,a7,a3

00004954 <.LVL171>:
    4954:	01a70d33          	add	s10,a4,s10

00004958 <.LVL172>:
    4958:	0116b8b3          	sltu	a7,a3,a7

0000495c <.LVL173>:
    495c:	011d08b3          	add	a7,s10,a7

00004960 <.LVL174>:
    4960:	00a68533          	add	a0,a3,a0

00004964 <.LVL175>:
    4964:	009884b3          	add	s1,a7,s1

00004968 <.LBB81>:
    4968:	00d536b3          	sltu	a3,a0,a3
    496c:	00d486b3          	add	a3,s1,a3

00004970 <.LBB82>:
    4970:	013f39b3          	sltu	s3,t5,s3

00004974 <.LVL177>:
    4974:	01e73f33          	sltu	t5,a4,t5

00004978 <.LBB83>:
    4978:	00ed3733          	sltu	a4,s10,a4

0000497c <.LVL179>:
    497c:	01a8bd33          	sltu	s10,a7,s10

00004980 <.LBB84>:
    4980:	01e9ef33          	or	t5,s3,t5

00004984 <.LBB85>:
    4984:	0114b8b3          	sltu	a7,s1,a7

00004988 <.LBB86>:
    4988:	01a76733          	or	a4,a4,s10

0000498c <.LBB87>:
    498c:	0096b4b3          	sltu	s1,a3,s1
    4990:	01868c33          	add	s8,a3,s8

00004994 <.LBB88>:
    4994:	00ef0733          	add	a4,t5,a4

00004998 <.LBB89>:
    4998:	0098e8b3          	or	a7,a7,s1
    499c:	00e884b3          	add	s1,a7,a4

000049a0 <.LBB90>:
    49a0:	03cf8f33          	mul	t5,t6,t3

000049a4 <.LBB92>:
    49a4:	00dc38b3          	sltu	a7,s8,a3
    49a8:	00650333          	add	t1,a0,t1

000049ac <.LVL185>:
    49ac:	00a33533          	sltu	a0,t1,a0
    49b0:	00ac0533          	add	a0,s8,a0
    49b4:	01853c33          	sltu	s8,a0,s8
    49b8:	0188e8b3          	or	a7,a7,s8
    49bc:	04612e23          	sw	t1,92(sp)
    49c0:	009888b3          	add	a7,a7,s1

000049c4 <.LBB93>:
    49c4:	02be06b3          	mul	a3,t3,a1

000049c8 <.LVL188>:
    49c8:	02b789b3          	mul	s3,a5,a1

000049cc <.LVL189>:
    49cc:	0106d713          	srl	a4,a3,0x10
    49d0:	01e989b3          	add	s3,s3,t5

000049d4 <.LVL190>:
    49d4:	01370733          	add	a4,a4,s3
    49d8:	03f784b3          	mul	s1,a5,t6

000049dc <.LVL191>:
    49dc:	01e77463          	bgeu	a4,t5,49e4 <.L100>
    49e0:	019484b3          	add	s1,s1,s9

000049e4 <.L100>:
    49e4:	01075f13          	srl	t5,a4,0x10
    49e8:	009f0f33          	add	t5,t5,s1

000049ec <.LVL193>:
    49ec:	000104b7          	lui	s1,0x10

000049f0 <.LVL194>:
    49f0:	fff48993          	add	s3,s1,-1 # ffff <_ebss+0x245f>
    49f4:	01377733          	and	a4,a4,s3

000049f8 <.LVL195>:
    49f8:	0136f6b3          	and	a3,a3,s3

000049fc <.LVL196>:
    49fc:	01071713          	sll	a4,a4,0x10

00004a00 <.LBB94>:
    4a00:	035389b3          	mul	s3,t2,s5

00004a04 <.LBB95>:
    4a04:	00d70733          	add	a4,a4,a3

00004a08 <.LBB96>:
    4a08:	030a86b3          	mul	a3,s5,a6

00004a0c <.LVL198>:
    4a0c:	030b0833          	mul	a6,s6,a6

00004a10 <.LVL199>:
    4a10:	01380c33          	add	s8,a6,s3
    4a14:	0106d813          	srl	a6,a3,0x10

00004a18 <.LVL200>:
    4a18:	01880833          	add	a6,a6,s8
    4a1c:	036383b3          	mul	t2,t2,s6

00004a20 <.LVL201>:
    4a20:	01387463          	bgeu	a6,s3,4a28 <.L101>
    4a24:	009383b3          	add	t2,t2,s1

00004a28 <.L101>:
    4a28:	01085493          	srl	s1,a6,0x10
    4a2c:	00010c37          	lui	s8,0x10
    4a30:	007483b3          	add	t2,s1,t2

00004a34 <.LVL203>:
    4a34:	fffc0493          	add	s1,s8,-1 # ffff <_ebss+0x245f>
    4a38:	0096f6b3          	and	a3,a3,s1

00004a3c <.LVL204>:
    4a3c:	00987833          	and	a6,a6,s1

00004a40 <.LVL205>:
    4a40:	01081813          	sll	a6,a6,0x10

00004a44 <.LBB97>:
    4a44:	03db89b3          	mul	s3,s7,t4

00004a48 <.LBB98>:
    4a48:	00d80833          	add	a6,a6,a3

00004a4c <.LBB99>:
    4a4c:	03d90eb3          	mul	t4,s2,t4

00004a50 <.LVL208>:
    4a50:	0109d693          	srl	a3,s3,0x10
    4a54:	032284b3          	mul	s1,t0,s2

00004a58 <.LVL209>:
    4a58:	037282b3          	mul	t0,t0,s7

00004a5c <.LVL210>:
    4a5c:	01d282b3          	add	t0,t0,t4

00004a60 <.LVL211>:
    4a60:	005686b3          	add	a3,a3,t0

00004a64 <.LVL212>:
    4a64:	01d6f463          	bgeu	a3,t4,4a6c <.L102>
    4a68:	018484b3          	add	s1,s1,s8

00004a6c <.L102>:
    4a6c:	0106de93          	srl	t4,a3,0x10

00004a70 <.LVL214>:
    4a70:	009e8eb3          	add	t4,t4,s1

00004a74 <.LVL215>:
    4a74:	000104b7          	lui	s1,0x10

00004a78 <.LVL216>:
    4a78:	fff48293          	add	t0,s1,-1 # ffff <_ebss+0x245f>
    4a7c:	0056f6b3          	and	a3,a3,t0

00004a80 <.LVL217>:
    4a80:	0059f9b3          	and	s3,s3,t0

00004a84 <.LVL218>:
    4a84:	01069693          	sll	a3,a3,0x10

00004a88 <.LBB100>:
    4a88:	02ba82b3          	mul	t0,s5,a1

00004a8c <.LBB101>:
    4a8c:	013686b3          	add	a3,a3,s3

00004a90 <.LBB102>:
    4a90:	02bb05b3          	mul	a1,s6,a1

00004a94 <.LVL220>:
    4a94:	035f89b3          	mul	s3,t6,s5

00004a98 <.LVL221>:
    4a98:	01358c33          	add	s8,a1,s3
    4a9c:	0102d593          	srl	a1,t0,0x10

00004aa0 <.LVL222>:
    4aa0:	018585b3          	add	a1,a1,s8
    4aa4:	036f8fb3          	mul	t6,t6,s6

00004aa8 <.LVL223>:
    4aa8:	0135f463          	bgeu	a1,s3,4ab0 <.L103>
    4aac:	009f8fb3          	add	t6,t6,s1

00004ab0 <.L103>:
    4ab0:	0105d493          	srl	s1,a1,0x10
    4ab4:	01f48fb3          	add	t6,s1,t6

00004ab8 <.LVL225>:
    4ab8:	000104b7          	lui	s1,0x10
    4abc:	fff48993          	add	s3,s1,-1 # ffff <_ebss+0x245f>

00004ac0 <.LVL226>:
    4ac0:	0135f5b3          	and	a1,a1,s3

00004ac4 <.LVL227>:
    4ac4:	0132f2b3          	and	t0,t0,s3

00004ac8 <.LVL228>:
    4ac8:	01059593          	sll	a1,a1,0x10

00004acc <.LBB103>:
    4acc:	032789b3          	mul	s3,a5,s2

00004ad0 <.LBB104>:
    4ad0:	005585b3          	add	a1,a1,t0

00004ad4 <.LBB105>:
    4ad4:	037787b3          	mul	a5,a5,s7

00004ad8 <.LVL230>:
    4ad8:	03cb82b3          	mul	t0,s7,t3

00004adc <.LVL231>:
    4adc:	03c90e33          	mul	t3,s2,t3

00004ae0 <.LVL232>:
    4ae0:	0102dc13          	srl	s8,t0,0x10

00004ae4 <.LVL233>:
    4ae4:	01c787b3          	add	a5,a5,t3
    4ae8:	00fc07b3          	add	a5,s8,a5

00004aec <.LVL235>:
    4aec:	01c7f463          	bgeu	a5,t3,4af4 <.L104>
    4af0:	009989b3          	add	s3,s3,s1

00004af4 <.L104>:
    4af4:	00e50733          	add	a4,a0,a4

00004af8 <.LVL237>:
    4af8:	01070833          	add	a6,a4,a6

00004afc <.LVL238>:
    4afc:	01e88f33          	add	t5,a7,t5

00004b00 <.LBB106>:
    4b00:	00a73533          	sltu	a0,a4,a0
    4b04:	00af0533          	add	a0,t5,a0
    4b08:	00d806b3          	add	a3,a6,a3

00004b0c <.LVL240>:
    4b0c:	007503b3          	add	t2,a0,t2

00004b10 <.LBB107>:
    4b10:	00e83733          	sltu	a4,a6,a4

00004b14 <.LBB108>:
    4b14:	06d12023          	sw	a3,96(sp)
    4b18:	0106b6b3          	sltu	a3,a3,a6

00004b1c <.LBB109>:
    4b1c:	037a8833          	mul	a6,s5,s7
    4b20:	00e38733          	add	a4,t2,a4
    4b24:	01d70eb3          	add	t4,a4,t4

00004b28 <.LVL242>:
    4b28:	00de86b3          	add	a3,t4,a3

00004b2c <.LBB110>:
    4b2c:	0107de13          	srl	t3,a5,0x10

00004b30 <.LBB111>:
    4b30:	011f38b3          	sltu	a7,t5,a7

00004b34 <.LBB112>:
    4b34:	000104b7          	lui	s1,0x10

00004b38 <.LBB113>:
    4b38:	01e53f33          	sltu	t5,a0,t5

00004b3c <.LBB114>:
    4b3c:	00a3b533          	sltu	a0,t2,a0
    4b40:	007733b3          	sltu	t2,a4,t2

00004b44 <.LBB115>:
    4b44:	03590ab3          	mul	s5,s2,s5

00004b48 <.LBB116>:
    4b48:	013e0e33          	add	t3,t3,s3

00004b4c <.LBB117>:
    4b4c:	00756533          	or	a0,a0,t2

00004b50 <.LBB118>:
    4b50:	fff48993          	add	s3,s1,-1 # ffff <_ebss+0x245f>

00004b54 <.LBB119>:
    4b54:	00eeb733          	sltu	a4,t4,a4

00004b58 <.LBB120>:
    4b58:	01e8e8b3          	or	a7,a7,t5

00004b5c <.LBB121>:
    4b5c:	01d6beb3          	sltu	t4,a3,t4

00004b60 <.LBB122>:
    4b60:	00a888b3          	add	a7,a7,a0

00004b64 <.LBB123>:
    4b64:	0137f7b3          	and	a5,a5,s3

00004b68 <.LBB124>:
    4b68:	01d76733          	or	a4,a4,t4

00004b6c <.LBB125>:
    4b6c:	032b0933          	mul	s2,s6,s2

00004b70 <.LVL248>:
    4b70:	00b685b3          	add	a1,a3,a1

00004b74 <.LBB126>:
    4b74:	01170733          	add	a4,a4,a7

00004b78 <.LBB127>:
    4b78:	01079793          	sll	a5,a5,0x10
    4b7c:	0132f2b3          	and	t0,t0,s3

00004b80 <.LVL250>:
    4b80:	01f70fb3          	add	t6,a4,t6

00004b84 <.LVL251>:
    4b84:	005787b3          	add	a5,a5,t0

00004b88 <.LBB128>:
    4b88:	00d5b6b3          	sltu	a3,a1,a3

00004b8c <.LVL253>:
    4b8c:	00df86b3          	add	a3,t6,a3

00004b90 <.LVL254>:
    4b90:	00f587b3          	add	a5,a1,a5

00004b94 <.LBB132>:
    4b94:	037b0b33          	mul	s6,s6,s7

00004b98 <.LBB133>:
    4b98:	00efb733          	sltu	a4,t6,a4

00004b9c <.LVL257>:
    4b9c:	01c68e33          	add	t3,a3,t3

00004ba0 <.LVL258>:
    4ba0:	01f6bfb3          	sltu	t6,a3,t6

00004ba4 <.LBB134>:
    4ba4:	06f12223          	sw	a5,100(sp)
    4ba8:	00b7b7b3          	sltu	a5,a5,a1

00004bac <.LBB135>:
    4bac:	01f76533          	or	a0,a4,t6

00004bb0 <.LBB136>:
    4bb0:	00fe07b3          	add	a5,t3,a5

00004bb4 <.LBB137>:
    4bb4:	01085713          	srl	a4,a6,0x10

00004bb8 <.LBB138>:
    4bb8:	00de36b3          	sltu	a3,t3,a3

00004bbc <.LVL260>:
    4bbc:	015b0b33          	add	s6,s6,s5
    4bc0:	01c7be33          	sltu	t3,a5,t3

00004bc4 <.LBB139>:
    4bc4:	01670733          	add	a4,a4,s6

00004bc8 <.LBB140>:
    4bc8:	01c6e6b3          	or	a3,a3,t3

00004bcc <.LBB141>:
    4bcc:	01577463          	bgeu	a4,s5,4bd4 <.L135>
    4bd0:	00990933          	add	s2,s2,s1

00004bd4 <.L135>:
    4bd4:	01075593          	srl	a1,a4,0x10
    4bd8:	00a585b3          	add	a1,a1,a0

00004bdc <.LBB142>:
    4bdc:	00010537          	lui	a0,0x10

00004be0 <.LVL264>:
    4be0:	fff50513          	add	a0,a0,-1 # ffff <_ebss+0x245f>
    4be4:	00a77733          	and	a4,a4,a0

00004be8 <.LVL265>:
    4be8:	01071713          	sll	a4,a4,0x10
    4bec:	00a87833          	and	a6,a6,a0

00004bf0 <.LVL266>:
    4bf0:	01070733          	add	a4,a4,a6
    4bf4:	00e78733          	add	a4,a5,a4

00004bf8 <.LBB144>:
    4bf8:	00d586b3          	add	a3,a1,a3

00004bfc <.LVL268>:
    4bfc:	00f737b3          	sltu	a5,a4,a5
    4c00:	00f687b3          	add	a5,a3,a5
    4c04:	012787b3          	add	a5,a5,s2
    4c08:	06f12623          	sw	a5,108(sp)

00004c0c <.LBB146>:
    4c0c:	01012783          	lw	a5,16(sp)
    4c10:	00d31313          	sll	t1,t1,0xd

00004c14 <.LBB145>:
    4c14:	06e12423          	sw	a4,104(sp)

00004c18 <.LBB148>:
    4c18:	00c7e7b3          	or	a5,a5,a2

00004c1c <.LVL270>:
    4c1c:	0147e7b3          	or	a5,a5,s4

00004c20 <.LVL271>:
    4c20:	00f36333          	or	t1,t1,a5

00004c24 <.LVL272>:
    4c24:	06010613          	add	a2,sp,96
    4c28:	05010793          	add	a5,sp,80

00004c2c <.L138>:
    4c2c:	00c7a703          	lw	a4,12(a5)
    4c30:	0107a683          	lw	a3,16(a5)
    4c34:	00478793          	add	a5,a5,4
    4c38:	01375713          	srl	a4,a4,0x13
    4c3c:	00d69693          	sll	a3,a3,0xd
    4c40:	00d76733          	or	a4,a4,a3
    4c44:	fee7ae23          	sw	a4,-4(a5)
    4c48:	fef612e3          	bne	a2,a5,4c2c <.L138>
    4c4c:	05012783          	lw	a5,80(sp)
    4c50:	00603333          	snez	t1,t1

00004c54 <.LBE148>:
    4c54:	05c12703          	lw	a4,92(sp)

00004c58 <.LBB149>:
    4c58:	00f36333          	or	t1,t1,a5

00004c5c <.LBE149>:
    4c5c:	05812783          	lw	a5,88(sp)
    4c60:	04e12623          	sw	a4,76(sp)
    4c64:	04612023          	sw	t1,64(sp)

00004c68 <.LBB150>:
    4c68:	04f12423          	sw	a5,72(sp)
    4c6c:	05412783          	lw	a5,84(sp)
    4c70:	04f12223          	sw	a5,68(sp)

00004c74 <.LBE150>:
    4c74:	00b71793          	sll	a5,a4,0xb
    4c78:	0407d863          	bgez	a5,4cc8 <.L139>

00004c7c <.LBB151>:
    4c7c:	01f31313          	sll	t1,t1,0x1f

00004c80 <.LVL276>:
    4c80:	04010793          	add	a5,sp,64
    4c84:	04c10593          	add	a1,sp,76

00004c88 <.L140>:
    4c88:	0007a683          	lw	a3,0(a5)
    4c8c:	0047a603          	lw	a2,4(a5)
    4c90:	00478793          	add	a5,a5,4
    4c94:	0016d693          	srl	a3,a3,0x1
    4c98:	01f61613          	sll	a2,a2,0x1f
    4c9c:	00c6e6b3          	or	a3,a3,a2
    4ca0:	fed7ae23          	sw	a3,-4(a5)
    4ca4:	fef592e3          	bne	a1,a5,4c88 <.L140>

00004ca8 <.LBE152>:
    4ca8:	04012783          	lw	a5,64(sp)

00004cac <.LBB153>:
    4cac:	00603333          	snez	t1,t1

00004cb0 <.LVL279>:
    4cb0:	00175713          	srl	a4,a4,0x1

00004cb4 <.LBE153>:
    4cb4:	0067e7b3          	or	a5,a5,t1
    4cb8:	04f12023          	sw	a5,64(sp)

00004cbc <.LBE151>:
    4cbc:	00812783          	lw	a5,8(sp)

00004cc0 <.LBB154>:
    4cc0:	04e12623          	sw	a4,76(sp)

00004cc4 <.LBE154>:
    4cc4:	00f12623          	sw	a5,12(sp)

00004cc8 <.L139>:
    4cc8:	00c12783          	lw	a5,12(sp)
    4ccc:	00f12423          	sw	a5,8(sp)
    4cd0:	3780006f          	j	5048 <.L173>

00004cd4 <.L2>:
  FP_UNPACK_Q (A, a);
    4cd4:	00a7e633          	or	a2,a5,a0
    4cd8:	00d66633          	or	a2,a2,a3
    4cdc:	00e66633          	or	a2,a2,a4
    4ce0:	14060463          	beqz	a2,4e28 <.L174>

00004ce4 <.LBB156>:
    4ce4:	0a070063          	beqz	a4,4d84 <.L6>
    4ce8:	00070513          	mv	a0,a4
    4cec:	2e0020ef          	jal	6fcc <__clzsi2>

00004cf0 <.L7>:
    4cf0:	ff450713          	add	a4,a0,-12
    4cf4:	40575593          	sra	a1,a4,0x5

00004cf8 <.LVL284>:
    4cf8:	01f77713          	and	a4,a4,31

00004cfc <.LVL285>:
    4cfc:	0a070e63          	beqz	a4,4db8 <.L10>
    4d00:	ffc00693          	li	a3,-4
    4d04:	02d586b3          	mul	a3,a1,a3
    4d08:	02000813          	li	a6,32
    4d0c:	02010313          	add	t1,sp,32
    4d10:	40e80833          	sub	a6,a6,a4

00004d14 <.LVL286>:
    4d14:	00c68793          	add	a5,a3,12 # 1000c <_ebss+0x246c>
    4d18:	00f307b3          	add	a5,t1,a5
    4d1c:	40d006b3          	neg	a3,a3

00004d20 <.L11>:
    4d20:	0cf31463          	bne	t1,a5,4de8 <.L14>
    4d24:	fff58793          	add	a5,a1,-1

00004d28 <.LVL287>:
    4d28:	00259593          	sll	a1,a1,0x2

00004d2c <.LVL288>:
    4d2c:	05058693          	add	a3,a1,80
    4d30:	02010613          	add	a2,sp,32
    4d34:	00c685b3          	add	a1,a3,a2
    4d38:	02012683          	lw	a3,32(sp)
    4d3c:	00e69733          	sll	a4,a3,a4

00004d40 <.LVL289>:
    4d40:	fae5a823          	sw	a4,-80(a1)

00004d44 <.L15>:
    4d44:	00178793          	add	a5,a5,1
    4d48:	00279793          	sll	a5,a5,0x2
    4d4c:	00800693          	li	a3,8
    4d50:	02010713          	add	a4,sp,32
    4d54:	00d7ea63          	bltu	a5,a3,4d68 <.L16>
    4d58:	02012023          	sw	zero,32(sp)
    4d5c:	00072223          	sw	zero,4(a4)
    4d60:	ff878793          	add	a5,a5,-8
    4d64:	02810713          	add	a4,sp,40

00004d68 <.L16>:
    4d68:	00400693          	li	a3,4
    4d6c:	00d7e463          	bltu	a5,a3,4d74 <.L17>
    4d70:	00072023          	sw	zero,0(a4)

00004d74 <.L17>:
    4d74:	ffffc4b7          	lui	s1,0xffffc

00004d78 <.LVL291>:
    4d78:	01148493          	add	s1,s1,17 # ffffc011 <_ebss+0xfffee471>
    4d7c:	40a484b3          	sub	s1,s1,a0
    4d80:	f20ff06f          	j	44a0 <.L209>

00004d84 <.L6>:
    4d84:	00068a63          	beqz	a3,4d98 <.L8>
    4d88:	00068513          	mv	a0,a3
    4d8c:	240020ef          	jal	6fcc <__clzsi2>

00004d90 <.LVL293>:
    4d90:	02050513          	add	a0,a0,32
    4d94:	f5dff06f          	j	4cf0 <.L7>

00004d98 <.L8>:
    4d98:	00050863          	beqz	a0,4da8 <.L9>
    4d9c:	230020ef          	jal	6fcc <__clzsi2>

00004da0 <.LVL296>:
    4da0:	04050513          	add	a0,a0,64
    4da4:	f4dff06f          	j	4cf0 <.L7>

00004da8 <.L9>:
    4da8:	00078513          	mv	a0,a5
    4dac:	220020ef          	jal	6fcc <__clzsi2>

00004db0 <.LVL299>:
    4db0:	06050513          	add	a0,a0,96
    4db4:	f3dff06f          	j	4cf0 <.L7>

00004db8 <.L10>:
    4db8:	ffc00693          	li	a3,-4
    4dbc:	02d586b3          	mul	a3,a1,a3
    4dc0:	02c10793          	add	a5,sp,44

00004dc4 <.LBB10>:
    4dc4:	00300713          	li	a4,3

00004dc8 <.L12>:
    4dc8:	00d78633          	add	a2,a5,a3
    4dcc:	00062603          	lw	a2,0(a2)
    4dd0:	fff70713          	add	a4,a4,-1

00004dd4 <.LVL303>:
    4dd4:	ffc78793          	add	a5,a5,-4
    4dd8:	00c7a223          	sw	a2,4(a5)

00004ddc <.LVL304>:
    4ddc:	feb756e3          	bge	a4,a1,4dc8 <.L12>
    4de0:	fff58793          	add	a5,a1,-1
    4de4:	f61ff06f          	j	4d44 <.L15>

00004de8 <.L14>:
    4de8:	0007a603          	lw	a2,0(a5)
    4dec:	ffc7a883          	lw	a7,-4(a5)
    4df0:	00d78e33          	add	t3,a5,a3
    4df4:	00e61633          	sll	a2,a2,a4
    4df8:	0108d8b3          	srl	a7,a7,a6
    4dfc:	01166633          	or	a2,a2,a7
    4e00:	00ce2023          	sw	a2,0(t3)
    4e04:	ffc78793          	add	a5,a5,-4
    4e08:	f19ff06f          	j	4d20 <.L11>

00004e0c <.L3>:
    4e0c:	00a7e7b3          	or	a5,a5,a0
    4e10:	00d7e7b3          	or	a5,a5,a3
    4e14:	00e7e7b3          	or	a5,a5,a4
    4e18:	00200b93          	li	s7,2
    4e1c:	e8078463          	beqz	a5,44a4 <.L5>
    4e20:	00300b93          	li	s7,3
    4e24:	e80ff06f          	j	44a4 <.L5>

00004e28 <.L174>:
    4e28:	00000493          	li	s1,0

00004e2c <.LBE157>:
    4e2c:	00100b93          	li	s7,1
    4e30:	e74ff06f          	j	44a4 <.L5>

00004e34 <.L18>:
  FP_UNPACK_Q (B, b);
    4e34:	016967b3          	or	a5,s2,s6

00004e38 <.LVL309>:
    4e38:	0157e7b3          	or	a5,a5,s5
    4e3c:	00a7e7b3          	or	a5,a5,a0
    4e40:	14078463          	beqz	a5,4f88 <.L176>

00004e44 <.LBB158>:
    4e44:	08050e63          	beqz	a0,4ee0 <.L22>
    4e48:	184020ef          	jal	6fcc <__clzsi2>

00004e4c <.L23>:
    4e4c:	ff450693          	add	a3,a0,-12
    4e50:	4056d793          	sra	a5,a3,0x5

00004e54 <.LVL311>:
    4e54:	01f6f693          	and	a3,a3,31

00004e58 <.LVL312>:
    4e58:	0c068063          	beqz	a3,4f18 <.L26>
    4e5c:	ffc00613          	li	a2,-4
    4e60:	02c78633          	mul	a2,a5,a2
    4e64:	02000813          	li	a6,32
    4e68:	03010313          	add	t1,sp,48
    4e6c:	40d80833          	sub	a6,a6,a3

00004e70 <.LVL313>:
    4e70:	00c60713          	add	a4,a2,12
    4e74:	00e30733          	add	a4,t1,a4
    4e78:	40c00633          	neg	a2,a2

00004e7c <.L27>:
    4e7c:	0ce31663          	bne	t1,a4,4f48 <.L30>
    4e80:	fff78713          	add	a4,a5,-1

00004e84 <.LVL314>:
    4e84:	00279793          	sll	a5,a5,0x2

00004e88 <.LVL315>:
    4e88:	02010613          	add	a2,sp,32
    4e8c:	05078793          	add	a5,a5,80
    4e90:	00c787b3          	add	a5,a5,a2
    4e94:	03012603          	lw	a2,48(sp)
    4e98:	00d616b3          	sll	a3,a2,a3

00004e9c <.LVL316>:
    4e9c:	fcd7a023          	sw	a3,-64(a5)

00004ea0 <.L31>:
    4ea0:	00170793          	add	a5,a4,1
    4ea4:	00279793          	sll	a5,a5,0x2
    4ea8:	00800693          	li	a3,8
    4eac:	03010713          	add	a4,sp,48
    4eb0:	00d7ea63          	bltu	a5,a3,4ec4 <.L32>
    4eb4:	02012823          	sw	zero,48(sp)
    4eb8:	00072223          	sw	zero,4(a4)
    4ebc:	ff878793          	add	a5,a5,-8
    4ec0:	03810713          	add	a4,sp,56

00004ec4 <.L32>:
    4ec4:	00400693          	li	a3,4
    4ec8:	00d7e463          	bltu	a5,a3,4ed0 <.L33>
    4ecc:	00072023          	sw	zero,0(a4)

00004ed0 <.L33>:
    4ed0:	ffffc7b7          	lui	a5,0xffffc
    4ed4:	01178793          	add	a5,a5,17 # ffffc011 <_ebss+0xfffee471>
    4ed8:	40a787b3          	sub	a5,a5,a0
    4edc:	e54ff06f          	j	4530 <.L210>

00004ee0 <.L22>:
    4ee0:	000a8a63          	beqz	s5,4ef4 <.L24>
    4ee4:	000a8513          	mv	a0,s5
    4ee8:	0e4020ef          	jal	6fcc <__clzsi2>

00004eec <.LVL319>:
    4eec:	02050513          	add	a0,a0,32
    4ef0:	f5dff06f          	j	4e4c <.L23>

00004ef4 <.L24>:
    4ef4:	000b0a63          	beqz	s6,4f08 <.L25>
    4ef8:	000b0513          	mv	a0,s6
    4efc:	0d0020ef          	jal	6fcc <__clzsi2>

00004f00 <.LVL322>:
    4f00:	04050513          	add	a0,a0,64
    4f04:	f49ff06f          	j	4e4c <.L23>

00004f08 <.L25>:
    4f08:	00090513          	mv	a0,s2
    4f0c:	0c0020ef          	jal	6fcc <__clzsi2>

00004f10 <.LVL325>:
    4f10:	06050513          	add	a0,a0,96
    4f14:	f39ff06f          	j	4e4c <.L23>

00004f18 <.L26>:
    4f18:	ffc00613          	li	a2,-4
    4f1c:	02c78633          	mul	a2,a5,a2
    4f20:	03c10713          	add	a4,sp,60

00004f24 <.LBB17>:
    4f24:	00300693          	li	a3,3

00004f28 <.L28>:
    4f28:	00c705b3          	add	a1,a4,a2
    4f2c:	0005a583          	lw	a1,0(a1)
    4f30:	fff68693          	add	a3,a3,-1

00004f34 <.LVL329>:
    4f34:	ffc70713          	add	a4,a4,-4
    4f38:	00b72223          	sw	a1,4(a4)

00004f3c <.LVL330>:
    4f3c:	fef6d6e3          	bge	a3,a5,4f28 <.L28>
    4f40:	fff78713          	add	a4,a5,-1
    4f44:	f5dff06f          	j	4ea0 <.L31>

00004f48 <.L30>:
    4f48:	00072583          	lw	a1,0(a4)
    4f4c:	ffc72883          	lw	a7,-4(a4)
    4f50:	00c70e33          	add	t3,a4,a2
    4f54:	00d595b3          	sll	a1,a1,a3
    4f58:	0108d8b3          	srl	a7,a7,a6
    4f5c:	0115e5b3          	or	a1,a1,a7
    4f60:	00be2023          	sw	a1,0(t3)
    4f64:	ffc70713          	add	a4,a4,-4
    4f68:	f15ff06f          	j	4e7c <.L27>

00004f6c <.L19>:
    4f6c:	01696933          	or	s2,s2,s6
    4f70:	01596933          	or	s2,s2,s5
    4f74:	00a96933          	or	s2,s2,a0
    4f78:	00200693          	li	a3,2
    4f7c:	da090c63          	beqz	s2,4534 <.L21>
    4f80:	00300693          	li	a3,3
    4f84:	db0ff06f          	j	4534 <.L21>

00004f88 <.L176>:
    4f88:	00000793          	li	a5,0

00004f8c <.LBE159>:
    4f8c:	00100693          	li	a3,1
    4f90:	da4ff06f          	j	4534 <.L21>

00004f94 <.L35>:
    4f94:	00100713          	li	a4,1
    4f98:	00f717b3          	sll	a5,a4,a5
  FP_MUL_Q (R, A, B);
    4f9c:	5307f713          	and	a4,a5,1328
    4fa0:	06071863          	bnez	a4,5010 <.L38>
    4fa4:	0887f713          	and	a4,a5,136
    4fa8:	04071063          	bnez	a4,4fe8 <.L39>
    4fac:	2407f793          	and	a5,a5,576
    4fb0:	dc078063          	beqz	a5,4570 <.L36>

00004fb4 <.L40>:
  FP_PACK_Q (r, R);
    4fb4:	000087b7          	lui	a5,0x8
    4fb8:	04f12623          	sw	a5,76(sp)
    4fbc:	04012423          	sw	zero,72(sp)
    4fc0:	04012223          	sw	zero,68(sp)
    4fc4:	04012023          	sw	zero,64(sp)

00004fc8 <.LVL336>:
    4fc8:	fff78793          	add	a5,a5,-1 # 7fff <.LLST132+0x8>
    4fcc:	00012223          	sw	zero,4(sp)
    4fd0:	1440006f          	j	5114 <.L153>

00004fd4 <.L34>:
  FP_MUL_Q (R, A, B);
    4fd4:	00f00713          	li	a4,15
    4fd8:	fce78ee3          	beq	a5,a4,4fb4 <.L40>
    4fdc:	00b00713          	li	a4,11

00004fe0 <.LBB160>:
  FP_UNPACK_Q (A, a);
    4fe0:	01412223          	sw	s4,4(sp)

00004fe4 <.LBE160>:
  FP_MUL_Q (R, A, B);
    4fe4:	02e79663          	bne	a5,a4,5010 <.L38>

00004fe8 <.L39>:
  FP_UNPACK_Q (B, b);
    4fe8:	01312223          	sw	s3,4(sp)

00004fec <.L37>:
  FP_MUL_Q (R, A, B);
    4fec:	03012783          	lw	a5,48(sp)
    4ff0:	00068b93          	mv	s7,a3

00004ff4 <.LVL339>:
    4ff4:	04f12023          	sw	a5,64(sp)
    4ff8:	03412783          	lw	a5,52(sp)
    4ffc:	04f12223          	sw	a5,68(sp)
    5000:	03812783          	lw	a5,56(sp)
    5004:	04f12423          	sw	a5,72(sp)
    5008:	03c12783          	lw	a5,60(sp)

0000500c <.LVL340>:
    500c:	0200006f          	j	502c <.L141>

00005010 <.L38>:
    5010:	02012783          	lw	a5,32(sp)
    5014:	04f12023          	sw	a5,64(sp)
    5018:	02412783          	lw	a5,36(sp)
    501c:	04f12223          	sw	a5,68(sp)
    5020:	02812783          	lw	a5,40(sp)
    5024:	04f12423          	sw	a5,72(sp)
    5028:	02c12783          	lw	a5,44(sp)

0000502c <.L141>:
    502c:	04f12623          	sw	a5,76(sp)
  FP_PACK_Q (r, R);
    5030:	00200793          	li	a5,2
    5034:	36fb8663          	beq	s7,a5,53a0 <.L142>
    5038:	00300793          	li	a5,3
    503c:	f6fb8ce3          	beq	s7,a5,4fb4 <.L40>
    5040:	00100793          	li	a5,1
    5044:	34fb8463          	beq	s7,a5,538c <.L211>

00005048 <.L173>:
    5048:	00812703          	lw	a4,8(sp)
    504c:	000047b7          	lui	a5,0x4
    5050:	fff78793          	add	a5,a5,-1 # 3fff <.LVL261+0x3>
    5054:	00f707b3          	add	a5,a4,a5

00005058 <.LVL344>:
    5058:	12f05a63          	blez	a5,518c <.L144>
    505c:	04012703          	lw	a4,64(sp)
    5060:	00777693          	and	a3,a4,7
    5064:	04068463          	beqz	a3,50ac <.L145>
    5068:	00f77693          	and	a3,a4,15
    506c:	00400613          	li	a2,4
    5070:	02c68e63          	beq	a3,a2,50ac <.L145>

00005074 <.LBB162>:
    5074:	00470713          	add	a4,a4,4
    5078:	00473693          	sltiu	a3,a4,4
    507c:	04e12023          	sw	a4,64(sp)

00005080 <.LVL345>:
    5080:	04412703          	lw	a4,68(sp)

00005084 <.LVL346>:
    5084:	00e68733          	add	a4,a3,a4
    5088:	04e12223          	sw	a4,68(sp)

0000508c <.LVL347>:
    508c:	00d73733          	sltu	a4,a4,a3

00005090 <.LVL348>:
    5090:	04812683          	lw	a3,72(sp)
    5094:	00e68733          	add	a4,a3,a4

00005098 <.LVL349>:
    5098:	04e12423          	sw	a4,72(sp)

0000509c <.LVL350>:
    509c:	00d73733          	sltu	a4,a4,a3

000050a0 <.LVL351>:
    50a0:	04c12683          	lw	a3,76(sp)
    50a4:	00d70733          	add	a4,a4,a3

000050a8 <.LVL352>:
    50a8:	04e12623          	sw	a4,76(sp)

000050ac <.L145>:
    50ac:	04c12703          	lw	a4,76(sp)
    50b0:	00b71693          	sll	a3,a4,0xb
    50b4:	0206d063          	bgez	a3,50d4 <.L150>
    50b8:	fff007b7          	lui	a5,0xfff00

000050bc <.LVL354>:
    50bc:	fff78793          	add	a5,a5,-1 # ffefffff <_ebss+0xffef245f>
    50c0:	00f77733          	and	a4,a4,a5
    50c4:	04e12623          	sw	a4,76(sp)
    50c8:	00812703          	lw	a4,8(sp)
    50cc:	000047b7          	lui	a5,0x4

000050d0 <.LVL355>:
    50d0:	00f707b3          	add	a5,a4,a5

000050d4 <.L150>:
    50d4:	04010713          	add	a4,sp,64
    50d8:	04c10593          	add	a1,sp,76

000050dc <.L151>:
    50dc:	00072683          	lw	a3,0(a4)
    50e0:	00472603          	lw	a2,4(a4)
    50e4:	00470713          	add	a4,a4,4
    50e8:	0036d693          	srl	a3,a3,0x3
    50ec:	01d61613          	sll	a2,a2,0x1d
    50f0:	00c6e6b3          	or	a3,a3,a2
    50f4:	fed72e23          	sw	a3,-4(a4)
    50f8:	fee592e3          	bne	a1,a4,50dc <.L151>

000050fc <.LBE163>:
    50fc:	000086b7          	lui	a3,0x8
    5100:	ffe68693          	add	a3,a3,-2 # 7ffe <.LLST132+0x7>

00005104 <.LBB164>:
    5104:	04c12703          	lw	a4,76(sp)

00005108 <.LBE164>:
    5108:	28f6cc63          	blt	a3,a5,53a0 <.L142>

0000510c <.LBB165>:
    510c:	00375713          	srl	a4,a4,0x3
    5110:	04e12623          	sw	a4,76(sp)

00005114 <.L153>:
    5114:	04c12703          	lw	a4,76(sp)

00005118 <.LBE166>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    5118:	0ac12083          	lw	ra,172(sp)
    511c:	00040513          	mv	a0,s0

00005120 <.LBB167>:
  FP_PACK_Q (r, R);
    5120:	04e11e23          	sh	a4,92(sp)
    5124:	00412703          	lw	a4,4(sp)

00005128 <.LBE167>:
}
    5128:	0a412483          	lw	s1,164(sp)
    512c:	0a012903          	lw	s2,160(sp)

00005130 <.LBB168>:
  FP_PACK_Q (r, R);
    5130:	00f71713          	sll	a4,a4,0xf
    5134:	00f767b3          	or	a5,a4,a5

00005138 <.LVL360>:
    5138:	04f11f23          	sh	a5,94(sp)

0000513c <.LBE168>:
  return r;
    513c:	04012783          	lw	a5,64(sp)
}
    5140:	09c12983          	lw	s3,156(sp)
    5144:	09812a03          	lw	s4,152(sp)
  return r;
    5148:	00f42023          	sw	a5,0(s0)
    514c:	04412783          	lw	a5,68(sp)
}
    5150:	09412a83          	lw	s5,148(sp)
    5154:	09012b03          	lw	s6,144(sp)
  return r;
    5158:	00f42223          	sw	a5,4(s0)
    515c:	04812783          	lw	a5,72(sp)
}
    5160:	08c12b83          	lw	s7,140(sp)
    5164:	08812c03          	lw	s8,136(sp)
  return r;
    5168:	00f42423          	sw	a5,8(s0)
    516c:	05c12783          	lw	a5,92(sp)
}
    5170:	08412c83          	lw	s9,132(sp)
    5174:	08012d03          	lw	s10,128(sp)
  return r;
    5178:	00f42623          	sw	a5,12(s0)
}
    517c:	0a812403          	lw	s0,168(sp)
    5180:	07c12d83          	lw	s11,124(sp)
    5184:	0b010113          	add	sp,sp,176

00005188 <.LVL363>:
    5188:	00008067          	ret

0000518c <.L144>:
  FP_PACK_Q (r, R);
    518c:	00100693          	li	a3,1
    5190:	40f686b3          	sub	a3,a3,a5

00005194 <.LVL365>:
    5194:	07400793          	li	a5,116
    5198:	1cd7ca63          	blt	a5,a3,536c <.L154>

0000519c <.LBB170>:
    519c:	04010613          	add	a2,sp,64
    51a0:	4056d713          	sra	a4,a3,0x5

000051a4 <.LVL367>:
    51a4:	00060513          	mv	a0,a2
    51a8:	01f6f693          	and	a3,a3,31

000051ac <.LVL368>:
    51ac:	00000793          	li	a5,0
    51b0:	00000593          	li	a1,0

000051b4 <.L155>:
    51b4:	02e59e63          	bne	a1,a4,51f0 <.L156>
    51b8:	00300593          	li	a1,3

000051bc <.LVL370>:
    51bc:	40e585b3          	sub	a1,a1,a4
    51c0:	00271513          	sll	a0,a4,0x2
    51c4:	04069063          	bnez	a3,5204 <.L157>
    51c8:	00060813          	mv	a6,a2

000051cc <.L158>:
    51cc:	00a808b3          	add	a7,a6,a0
    51d0:	0008a883          	lw	a7,0(a7)
    51d4:	00168693          	add	a3,a3,1

000051d8 <.LVL372>:
    51d8:	00480813          	add	a6,a6,4
    51dc:	ff182e23          	sw	a7,-4(a6)

000051e0 <.LVL373>:
    51e0:	fed5d6e3          	bge	a1,a3,51cc <.L158>
    51e4:	00400693          	li	a3,4

000051e8 <.LVL374>:
    51e8:	40e68733          	sub	a4,a3,a4

000051ec <.LVL375>:
    51ec:	06c0006f          	j	5258 <.L162>

000051f0 <.L156>:
    51f0:	00052803          	lw	a6,0(a0)
    51f4:	00158593          	add	a1,a1,1

000051f8 <.LVL377>:
    51f8:	00450513          	add	a0,a0,4
    51fc:	0107e7b3          	or	a5,a5,a6

00005200 <.LVL378>:
    5200:	fb5ff06f          	j	51b4 <.L155>

00005204 <.L157>:
    5204:	05050813          	add	a6,a0,80
    5208:	02010893          	add	a7,sp,32
    520c:	01180833          	add	a6,a6,a7
    5210:	fd082803          	lw	a6,-48(a6)
    5214:	02000313          	li	t1,32
    5218:	40d30333          	sub	t1,t1,a3
    521c:	00681833          	sll	a6,a6,t1
    5220:	0107e7b3          	or	a5,a5,a6

00005224 <.LVL380>:
    5224:	00000e13          	li	t3,0
    5228:	00a60833          	add	a6,a2,a0
    522c:	40a00533          	neg	a0,a0

00005230 <.L160>:
    5230:	0ebe4063          	blt	t3,a1,5310 <.L161>
    5234:	00400513          	li	a0,4
    5238:	00259593          	sll	a1,a1,0x2
    523c:	40e50733          	sub	a4,a0,a4

00005240 <.LVL382>:
    5240:	05058593          	add	a1,a1,80
    5244:	02010513          	add	a0,sp,32
    5248:	00a585b3          	add	a1,a1,a0
    524c:	04c12503          	lw	a0,76(sp)
    5250:	00d556b3          	srl	a3,a0,a3

00005254 <.LVL383>:
    5254:	fcd5a823          	sw	a3,-48(a1)

00005258 <.L162>:
    5258:	00400693          	li	a3,4
    525c:	40e686b3          	sub	a3,a3,a4
    5260:	00269693          	sll	a3,a3,0x2
    5264:	00271713          	sll	a4,a4,0x2
    5268:	00800593          	li	a1,8
    526c:	00e60733          	add	a4,a2,a4
    5270:	00b6ea63          	bltu	a3,a1,5284 <.L163>
    5274:	00072023          	sw	zero,0(a4)
    5278:	00072223          	sw	zero,4(a4)
    527c:	ff868693          	add	a3,a3,-8
    5280:	00870713          	add	a4,a4,8

00005284 <.L163>:
    5284:	00400593          	li	a1,4
    5288:	00b6e463          	bltu	a3,a1,5290 <.L164>
    528c:	00072023          	sw	zero,0(a4)

00005290 <.L164>:
    5290:	04012703          	lw	a4,64(sp)

00005294 <.LBB172>:
    5294:	00f037b3          	snez	a5,a5

00005298 <.LBE172>:
    5298:	00e7e7b3          	or	a5,a5,a4
    529c:	04f12023          	sw	a5,64(sp)

000052a0 <.LBE170>:
    52a0:	0077f713          	and	a4,a5,7
    52a4:	04070463          	beqz	a4,52ec <.L165>
    52a8:	00f7f713          	and	a4,a5,15
    52ac:	00400693          	li	a3,4
    52b0:	02d70e63          	beq	a4,a3,52ec <.L165>

000052b4 <.LBB174>:
    52b4:	04412703          	lw	a4,68(sp)
    52b8:	00478793          	add	a5,a5,4 # 4004 <.L142>
    52bc:	04f12023          	sw	a5,64(sp)

000052c0 <.LVL386>:
    52c0:	0047b793          	sltiu	a5,a5,4

000052c4 <.LVL387>:
    52c4:	00f707b3          	add	a5,a4,a5
    52c8:	04f12223          	sw	a5,68(sp)

000052cc <.LVL388>:
    52cc:	00e7b7b3          	sltu	a5,a5,a4

000052d0 <.LVL389>:
    52d0:	04812703          	lw	a4,72(sp)
    52d4:	00f707b3          	add	a5,a4,a5

000052d8 <.LVL390>:
    52d8:	04f12423          	sw	a5,72(sp)

000052dc <.LVL391>:
    52dc:	00e7b7b3          	sltu	a5,a5,a4

000052e0 <.LVL392>:
    52e0:	04c12703          	lw	a4,76(sp)
    52e4:	00e787b3          	add	a5,a5,a4

000052e8 <.LVL393>:
    52e8:	04f12623          	sw	a5,76(sp)

000052ec <.L165>:
    52ec:	04c12703          	lw	a4,76(sp)
    52f0:	00c71793          	sll	a5,a4,0xc
    52f4:	0407d263          	bgez	a5,5338 <.L170>

000052f8 <.LVL395>:
    52f8:	04012623          	sw	zero,76(sp)
    52fc:	04012423          	sw	zero,72(sp)
    5300:	04012223          	sw	zero,68(sp)
    5304:	04012023          	sw	zero,64(sp)
    5308:	00100793          	li	a5,1

0000530c <.LVL396>:
    530c:	e09ff06f          	j	5114 <.L153>

00005310 <.L161>:
    5310:	00082883          	lw	a7,0(a6)
    5314:	00482e83          	lw	t4,4(a6)
    5318:	00a80f33          	add	t5,a6,a0
    531c:	00d8d8b3          	srl	a7,a7,a3
    5320:	006e9eb3          	sll	t4,t4,t1
    5324:	01d8e8b3          	or	a7,a7,t4
    5328:	011f2023          	sw	a7,0(t5)

0000532c <.LVL398>:
    532c:	001e0e13          	add	t3,t3,1

00005330 <.LVL399>:
    5330:	00480813          	add	a6,a6,4
    5334:	efdff06f          	j	5230 <.L160>

00005338 <.L170>:
    5338:	00c60593          	add	a1,a2,12

0000533c <.L171>:
    533c:	00062783          	lw	a5,0(a2)
    5340:	00462683          	lw	a3,4(a2)
    5344:	00460613          	add	a2,a2,4
    5348:	0037d793          	srl	a5,a5,0x3
    534c:	01d69693          	sll	a3,a3,0x1d
    5350:	00d7e7b3          	or	a5,a5,a3
    5354:	fef62e23          	sw	a5,-4(a2)
    5358:	fec592e3          	bne	a1,a2,533c <.L171>

0000535c <.LVL402>:
    535c:	00375713          	srl	a4,a4,0x3
    5360:	04e12623          	sw	a4,76(sp)

00005364 <.L172>:
    5364:	00000793          	li	a5,0
    5368:	dadff06f          	j	5114 <.L153>

0000536c <.L154>:
    536c:	04412703          	lw	a4,68(sp)
    5370:	04012783          	lw	a5,64(sp)
    5374:	00e7e7b3          	or	a5,a5,a4
    5378:	04812703          	lw	a4,72(sp)
    537c:	00e7e7b3          	or	a5,a5,a4
    5380:	04c12703          	lw	a4,76(sp)
    5384:	00e7e7b3          	or	a5,a5,a4
    5388:	fc078ee3          	beqz	a5,5364 <.L172>

0000538c <.L211>:
    538c:	04012623          	sw	zero,76(sp)
    5390:	04012423          	sw	zero,72(sp)
    5394:	04012223          	sw	zero,68(sp)

00005398 <.LBB178>:
    5398:	04012023          	sw	zero,64(sp)
    539c:	fc9ff06f          	j	5364 <.L172>

000053a0 <.L142>:
    53a0:	000087b7          	lui	a5,0x8
    53a4:	04012623          	sw	zero,76(sp)
    53a8:	04012423          	sw	zero,72(sp)
    53ac:	04012223          	sw	zero,68(sp)
    53b0:	04012023          	sw	zero,64(sp)
    53b4:	fff78793          	add	a5,a5,-1 # 7fff <.LLST132+0x8>
    53b8:	d5dff06f          	j	5114 <.L153>

000053bc <__subtf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__subtf3 (TFtype a, TFtype b)
{
    53bc:	f9010113          	add	sp,sp,-112
    53c0:	0085a703          	lw	a4,8(a1)
    53c4:	05512a23          	sw	s5,84(sp)
    53c8:	00c5aa83          	lw	s5,12(a1)
    53cc:	0005a783          	lw	a5,0(a1)
    53d0:	0045a683          	lw	a3,4(a1)

000053d4 <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_Q (A, a);
    53d4:	02e12c23          	sw	a4,56(sp)
    53d8:	00e12c23          	sw	a4,24(sp)
    53dc:	010a9713          	sll	a4,s5,0x10

000053e0 <.LBE3>:
{
    53e0:	06912223          	sw	s1,100(sp)

000053e4 <.LBB4>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    53e4:	01075713          	srl	a4,a4,0x10
    53e8:	001a9493          	sll	s1,s5,0x1

000053ec <.LBE4>:
{
    53ec:	00462803          	lw	a6,4(a2)
    53f0:	00862583          	lw	a1,8(a2)
    53f4:	06812423          	sw	s0,104(sp)
    53f8:	07212023          	sw	s2,96(sp)
    53fc:	00062403          	lw	s0,0(a2)
    5400:	00c62903          	lw	s2,12(a2)
    5404:	05412c23          	sw	s4,88(sp)

00005408 <.LBB5>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    5408:	03512e23          	sw	s5,60(sp)

0000540c <.LBE5>:
{
    540c:	00050a13          	mv	s4,a0
    5410:	06112623          	sw	ra,108(sp)
    5414:	05312e23          	sw	s3,92(sp)
    5418:	05612823          	sw	s6,80(sp)
    541c:	05712623          	sw	s7,76(sp)
    5420:	05812423          	sw	s8,72(sp)

00005424 <.LBB6>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    5424:	02f12823          	sw	a5,48(sp)
    5428:	02d12a23          	sw	a3,52(sp)
    542c:	00f12823          	sw	a5,16(sp)
    5430:	00d12a23          	sw	a3,20(sp)
    5434:	00e12e23          	sw	a4,28(sp)
    5438:	0114d493          	srl	s1,s1,0x11

0000543c <.LVL1>:
    543c:	01fada93          	srl	s5,s5,0x1f

00005440 <.LBB7>:
    5440:	01010513          	add	a0,sp,16
    5444:	01c10613          	add	a2,sp,28

00005448 <.L2>:
    5448:	00062703          	lw	a4,0(a2)
    544c:	ffc62683          	lw	a3,-4(a2)
    5450:	ffc60613          	add	a2,a2,-4
    5454:	00371713          	sll	a4,a4,0x3
    5458:	01d6d693          	srl	a3,a3,0x1d
    545c:	00d76733          	or	a4,a4,a3
    5460:	00e62223          	sw	a4,4(a2)
    5464:	fec512e3          	bne	a0,a2,5448 <.L2>

00005468 <.LBB8>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    5468:	01091713          	sll	a4,s2,0x10
    546c:	00191b93          	sll	s7,s2,0x1

00005470 <.LBB9>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    5470:	00379793          	sll	a5,a5,0x3

00005474 <.LBB10>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    5474:	01075713          	srl	a4,a4,0x10
    5478:	03012a23          	sw	a6,52(sp)
    547c:	03212e23          	sw	s2,60(sp)
    5480:	03012223          	sw	a6,36(sp)

00005484 <.LBB11>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    5484:	00f12823          	sw	a5,16(sp)

00005488 <.LBB12>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    5488:	02812823          	sw	s0,48(sp)
    548c:	02b12c23          	sw	a1,56(sp)
    5490:	02812023          	sw	s0,32(sp)
    5494:	02b12423          	sw	a1,40(sp)
    5498:	02e12623          	sw	a4,44(sp)
    549c:	011bdb93          	srl	s7,s7,0x11

000054a0 <.LVL6>:
    54a0:	01f95913          	srl	s2,s2,0x1f

000054a4 <.LBB13>:
    54a4:	02010813          	add	a6,sp,32
    54a8:	02c10313          	add	t1,sp,44

000054ac <.L3>:
    54ac:	00032703          	lw	a4,0(t1)
    54b0:	ffc32683          	lw	a3,-4(t1)
    54b4:	ffc30313          	add	t1,t1,-4
    54b8:	00371713          	sll	a4,a4,0x3
    54bc:	01d6d693          	srl	a3,a3,0x1d
    54c0:	00d76733          	or	a4,a4,a3
    54c4:	00e32223          	sw	a4,4(t1)
    54c8:	fe6812e3          	bne	a6,t1,54ac <.L3>

000054cc <.LVL9>:
    54cc:	00341413          	sll	s0,s0,0x3

000054d0 <.LBE13>:
  FP_SUB_Q (R, A, B);
    54d0:	00008737          	lui	a4,0x8

000054d4 <.LBB14>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    54d4:	02812023          	sw	s0,32(sp)

000054d8 <.LBE14>:
  FP_SUB_Q (R, A, B);
    54d8:	fff70713          	add	a4,a4,-1 # 7fff <.LLST132+0x8>
    54dc:	02eb9063          	bne	s7,a4,54fc <.L4>
    54e0:	02812683          	lw	a3,40(sp)
    54e4:	02412703          	lw	a4,36(sp)
    54e8:	00d76733          	or	a4,a4,a3
    54ec:	02c12683          	lw	a3,44(sp)
    54f0:	00d76733          	or	a4,a4,a3
    54f4:	00876733          	or	a4,a4,s0
    54f8:	00071463          	bnez	a4,5500 <.L5>

000054fc <.L4>:
    54fc:	00194913          	xor	s2,s2,1

00005500 <.L5>:
    5500:	417488b3          	sub	a7,s1,s7

00005504 <.LBE15>:
    5504:	095916e3          	bne	s2,s5,5d90 <.L6>

00005508 <.LBB48>:
    5508:	45105263          	blez	a7,594c <.L7>

0000550c <.LVL12>:
    550c:	01412903          	lw	s2,20(sp)

00005510 <.LVL13>:
    5510:	01812983          	lw	s3,24(sp)
    5514:	01c12b03          	lw	s6,28(sp)
    5518:	0a0b9263          	bnez	s7,55bc <.L8>
    551c:	02412683          	lw	a3,36(sp)
    5520:	02812703          	lw	a4,40(sp)
    5524:	02c12583          	lw	a1,44(sp)
    5528:	00e6e633          	or	a2,a3,a4
    552c:	00b66633          	or	a2,a2,a1
    5530:	00866633          	or	a2,a2,s0
    5534:	00061e63          	bnez	a2,5550 <.L9>

00005538 <.L363>:
    5538:	02f12823          	sw	a5,48(sp)
    553c:	03212a23          	sw	s2,52(sp)
    5540:	03312c23          	sw	s3,56(sp)
    5544:	03612e23          	sw	s6,60(sp)

00005548 <.LBB91>:
    5548:	00088493          	mv	s1,a7

0000554c <.LVL16>:
    554c:	08c0006f          	j	55d8 <.L10>

00005550 <.L9>:
    5550:	fff88613          	add	a2,a7,-1

00005554 <.LVL18>:
    5554:	04061863          	bnez	a2,55a4 <.L11>

00005558 <.LBB16>:
    5558:	00878433          	add	s0,a5,s0
    555c:	01268933          	add	s2,a3,s2
    5560:	02812823          	sw	s0,48(sp)

00005564 <.LVL19>:
    5564:	00f43433          	sltu	s0,s0,a5

00005568 <.LVL20>:
    5568:	00890433          	add	s0,s2,s0

0000556c <.LVL21>:
    556c:	02812a23          	sw	s0,52(sp)

00005570 <.LVL22>:
    5570:	00d936b3          	sltu	a3,s2,a3

00005574 <.LVL23>:
    5574:	01243433          	sltu	s0,s0,s2

00005578 <.LVL24>:
    5578:	013709b3          	add	s3,a4,s3

0000557c <.LVL25>:
    557c:	0086e6b3          	or	a3,a3,s0

00005580 <.LVL26>:
    5580:	00d986b3          	add	a3,s3,a3
    5584:	02d12c23          	sw	a3,56(sp)

00005588 <.LVL27>:
    5588:	00e9b7b3          	sltu	a5,s3,a4

0000558c <.LVL28>:
    558c:	0136b6b3          	sltu	a3,a3,s3

00005590 <.LVL29>:
    5590:	00d7e7b3          	or	a5,a5,a3

00005594 <.LVL30>:
    5594:	016585b3          	add	a1,a1,s6
    5598:	00b787b3          	add	a5,a5,a1

0000559c <.L355>:
    559c:	00100493          	li	s1,1

000055a0 <.LVL32>:
    55a0:	2fc0006f          	j	589c <.L22>

000055a4 <.L11>:
    55a4:	00008737          	lui	a4,0x8
    55a8:	fff70713          	add	a4,a4,-1 # 7fff <.LLST132+0x8>
    55ac:	00e88463          	beq	a7,a4,55b4 <.L23>
    55b0:	2540106f          	j	6804 <.L343>

000055b4 <.L23>:
    55b4:	02f12823          	sw	a5,48(sp)
    55b8:	4400006f          	j	59f8 <.L364>

000055bc <.L8>:
    55bc:	00008737          	lui	a4,0x8
    55c0:	fff70713          	add	a4,a4,-1 # 7fff <.LLST132+0x8>
    55c4:	16e49a63          	bne	s1,a4,5738 <.L25>

000055c8 <.LVL36>:
    55c8:	02f12823          	sw	a5,48(sp)
    55cc:	03212a23          	sw	s2,52(sp)
    55d0:	03312c23          	sw	s3,56(sp)
    55d4:	03612e23          	sw	s6,60(sp)

000055d8 <.L10>:
  FP_PACK_SEMIRAW_Q (r, R);
    55d8:	03012783          	lw	a5,48(sp)
    55dc:	0077f713          	and	a4,a5,7
    55e0:	04070463          	beqz	a4,5628 <.L257>
    55e4:	00f7f713          	and	a4,a5,15
    55e8:	00400693          	li	a3,4
    55ec:	02d70e63          	beq	a4,a3,5628 <.L257>

000055f0 <.LBB92>:
    55f0:	03412703          	lw	a4,52(sp)
    55f4:	00478793          	add	a5,a5,4
    55f8:	02f12823          	sw	a5,48(sp)

000055fc <.LVL38>:
    55fc:	0047b793          	sltiu	a5,a5,4

00005600 <.LVL39>:
    5600:	00f707b3          	add	a5,a4,a5
    5604:	02f12a23          	sw	a5,52(sp)

00005608 <.LVL40>:
    5608:	00e7b7b3          	sltu	a5,a5,a4

0000560c <.LVL41>:
    560c:	03812703          	lw	a4,56(sp)
    5610:	00f707b3          	add	a5,a4,a5

00005614 <.LVL42>:
    5614:	02f12c23          	sw	a5,56(sp)

00005618 <.LVL43>:
    5618:	00e7b7b3          	sltu	a5,a5,a4

0000561c <.LVL44>:
    561c:	03c12703          	lw	a4,60(sp)
    5620:	00e787b3          	add	a5,a5,a4

00005624 <.LVL45>:
    5624:	02f12e23          	sw	a5,60(sp)

00005628 <.L257>:
    5628:	03c12783          	lw	a5,60(sp)
    562c:	00c79713          	sll	a4,a5,0xc
    5630:	02075463          	bgez	a4,5658 <.L262>
    5634:	00008737          	lui	a4,0x8
    5638:	00148493          	add	s1,s1,1

0000563c <.LVL47>:
    563c:	fff70713          	add	a4,a4,-1 # 7fff <.LLST132+0x8>
    5640:	00e49463          	bne	s1,a4,5648 <.LVL47+0xc>
    5644:	1ac0106f          	j	67f0 <.L263>
    5648:	fff80737          	lui	a4,0xfff80
    564c:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff7245f>
    5650:	00e7f7b3          	and	a5,a5,a4
    5654:	02f12e23          	sw	a5,60(sp)

00005658 <.L262>:
    5658:	03010793          	add	a5,sp,48
    565c:	03c10613          	add	a2,sp,60

00005660 <.L265>:
    5660:	0007a703          	lw	a4,0(a5)
    5664:	0047a683          	lw	a3,4(a5)
    5668:	00478793          	add	a5,a5,4
    566c:	00375713          	srl	a4,a4,0x3
    5670:	01d69693          	sll	a3,a3,0x1d
    5674:	00d76733          	or	a4,a4,a3
    5678:	fee7ae23          	sw	a4,-4(a5)
    567c:	fec792e3          	bne	a5,a2,5660 <.L265>

00005680 <.LVL50>:
    5680:	03c12703          	lw	a4,60(sp)

00005684 <.LBE93>:
    5684:	000086b7          	lui	a3,0x8
    5688:	fff68793          	add	a5,a3,-1 # 7fff <.LLST132+0x8>

0000568c <.LBB94>:
    568c:	00375713          	srl	a4,a4,0x3
    5690:	02e12e23          	sw	a4,60(sp)

00005694 <.LBE94>:
    5694:	02f49a63          	bne	s1,a5,56c8 <.L266>
    5698:	03412603          	lw	a2,52(sp)
    569c:	03012783          	lw	a5,48(sp)
    56a0:	00c7e7b3          	or	a5,a5,a2
    56a4:	03812603          	lw	a2,56(sp)
    56a8:	00c7e7b3          	or	a5,a5,a2
    56ac:	00e7e7b3          	or	a5,a5,a4
    56b0:	00078c63          	beqz	a5,56c8 <.L266>
    56b4:	02d12e23          	sw	a3,60(sp)
    56b8:	02012c23          	sw	zero,56(sp)
    56bc:	02012a23          	sw	zero,52(sp)
    56c0:	02012823          	sw	zero,48(sp)

000056c4 <.LVL51>:
    56c4:	00000a93          	li	s5,0

000056c8 <.L266>:
    56c8:	03c12783          	lw	a5,60(sp)
    56cc:	01149493          	sll	s1,s1,0x11

000056d0 <.LVL53>:
    56d0:	0114d493          	srl	s1,s1,0x11
    56d4:	00f11623          	sh	a5,12(sp)

000056d8 <.LBE101>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    56d8:	03012783          	lw	a5,48(sp)

000056dc <.LBB102>:
  FP_PACK_SEMIRAW_Q (r, R);
    56dc:	00fa9a93          	sll	s5,s5,0xf

000056e0 <.LVL54>:
    56e0:	009aeab3          	or	s5,s5,s1

000056e4 <.LBE102>:
  return r;
    56e4:	00fa2023          	sw	a5,0(s4)
    56e8:	03412783          	lw	a5,52(sp)

000056ec <.LBB103>:
  FP_PACK_SEMIRAW_Q (r, R);
    56ec:	01511723          	sh	s5,14(sp)

000056f0 <.LBE103>:
}
    56f0:	06c12083          	lw	ra,108(sp)
  return r;
    56f4:	00fa2223          	sw	a5,4(s4)
    56f8:	03812783          	lw	a5,56(sp)

000056fc <.LVL56>:
}
    56fc:	06812403          	lw	s0,104(sp)
    5700:	06412483          	lw	s1,100(sp)
  return r;
    5704:	00fa2423          	sw	a5,8(s4)
    5708:	00c12783          	lw	a5,12(sp)
}
    570c:	06012903          	lw	s2,96(sp)
    5710:	05c12983          	lw	s3,92(sp)
  return r;
    5714:	00fa2623          	sw	a5,12(s4)
}
    5718:	05412a83          	lw	s5,84(sp)
    571c:	05012b03          	lw	s6,80(sp)
    5720:	04c12b83          	lw	s7,76(sp)

00005724 <.LVL57>:
    5724:	04812c03          	lw	s8,72(sp)
    5728:	000a0513          	mv	a0,s4
    572c:	05812a03          	lw	s4,88(sp)
    5730:	07010113          	add	sp,sp,112

00005734 <.LVL59>:
    5734:	00008067          	ret

00005738 <.L25>:
  FP_SUB_Q (R, A, B);
    5738:	02c12703          	lw	a4,44(sp)
    573c:	000806b7          	lui	a3,0x80
    5740:	00d76733          	or	a4,a4,a3
    5744:	02e12623          	sw	a4,44(sp)

00005748 <.LDL1>:
    5748:	07400713          	li	a4,116
    574c:	01175463          	bge	a4,a7,5754 <.LDL1+0xc>
    5750:	0c00106f          	j	6810 <.L26>
    5754:	00088613          	mv	a2,a7

00005758 <.L267>:
    5758:	40565693          	sra	a3,a2,0x5

0000575c <.LVL62>:
    575c:	00030513          	mv	a0,t1
    5760:	01f67613          	and	a2,a2,31

00005764 <.LVL63>:
    5764:	00000713          	li	a4,0
    5768:	00000593          	li	a1,0

0000576c <.L27>:
    576c:	02d59c63          	bne	a1,a3,57a4 <.L28>
    5770:	00300593          	li	a1,3

00005774 <.LVL65>:
    5774:	40d585b3          	sub	a1,a1,a3
    5778:	00269513          	sll	a0,a3,0x2
    577c:	02061e63          	bnez	a2,57b8 <.L29>

00005780 <.L30>:
    5780:	00a308b3          	add	a7,t1,a0
    5784:	0008a883          	lw	a7,0(a7)
    5788:	00160613          	add	a2,a2,1

0000578c <.LVL67>:
    578c:	00430313          	add	t1,t1,4
    5790:	ff132e23          	sw	a7,-4(t1)

00005794 <.LVL68>:
    5794:	fec5d6e3          	bge	a1,a2,5780 <.L30>
    5798:	00400613          	li	a2,4

0000579c <.LVL69>:
    579c:	40d606b3          	sub	a3,a2,a3

000057a0 <.LVL70>:
    57a0:	0640006f          	j	5804 <.L34>

000057a4 <.L28>:
    57a4:	00052883          	lw	a7,0(a0)
    57a8:	00158593          	add	a1,a1,1

000057ac <.LVL72>:
    57ac:	00450513          	add	a0,a0,4
    57b0:	01176733          	or	a4,a4,a7

000057b4 <.LVL73>:
    57b4:	fb9ff06f          	j	576c <.L27>

000057b8 <.L29>:
    57b8:	04050893          	add	a7,a0,64
    57bc:	002888b3          	add	a7,a7,sp
    57c0:	fe08a883          	lw	a7,-32(a7)
    57c4:	02000e13          	li	t3,32
    57c8:	40ce0e33          	sub	t3,t3,a2
    57cc:	01c898b3          	sll	a7,a7,t3
    57d0:	01176733          	or	a4,a4,a7

000057d4 <.LVL75>:
    57d4:	00000e93          	li	t4,0
    57d8:	00a808b3          	add	a7,a6,a0
    57dc:	40a00533          	neg	a0,a0

000057e0 <.L32>:
    57e0:	14bec263          	blt	t4,a1,5924 <.L33>
    57e4:	00400513          	li	a0,4
    57e8:	40d506b3          	sub	a3,a0,a3

000057ec <.LVL77>:
    57ec:	02c12503          	lw	a0,44(sp)
    57f0:	00259593          	sll	a1,a1,0x2

000057f4 <.LVL78>:
    57f4:	04058593          	add	a1,a1,64
    57f8:	002585b3          	add	a1,a1,sp
    57fc:	00c55633          	srl	a2,a0,a2

00005800 <.LVL79>:
    5800:	fec5a023          	sw	a2,-32(a1)

00005804 <.L34>:
    5804:	00400613          	li	a2,4
    5808:	40d60633          	sub	a2,a2,a3
    580c:	00261613          	sll	a2,a2,0x2
    5810:	00269693          	sll	a3,a3,0x2
    5814:	00800593          	li	a1,8
    5818:	00d806b3          	add	a3,a6,a3
    581c:	00b66a63          	bltu	a2,a1,5830 <.L35>
    5820:	0006a023          	sw	zero,0(a3) # 80000 <_ebss+0x72460>
    5824:	0006a223          	sw	zero,4(a3)
    5828:	ff860613          	add	a2,a2,-8
    582c:	00868693          	add	a3,a3,8

00005830 <.L35>:
    5830:	00400593          	li	a1,4
    5834:	00b66463          	bltu	a2,a1,583c <.L36>
    5838:	0006a023          	sw	zero,0(a3)

0000583c <.L36>:
    583c:	02012683          	lw	a3,32(sp)

00005840 <.LBB19>:
    5840:	00e03733          	snez	a4,a4

00005844 <.LBE19>:
    5844:	00d76733          	or	a4,a4,a3

00005848 <.L37>:
    5848:	02412683          	lw	a3,36(sp)

0000584c <.LBB21>:
    584c:	02e12023          	sw	a4,32(sp)

00005850 <.LBB22>:
    5850:	00e78733          	add	a4,a5,a4
    5854:	01268933          	add	s2,a3,s2
    5858:	02e12823          	sw	a4,48(sp)

0000585c <.LVL84>:
    585c:	00f73733          	sltu	a4,a4,a5

00005860 <.LVL85>:
    5860:	02812783          	lw	a5,40(sp)
    5864:	00e90733          	add	a4,s2,a4

00005868 <.LVL86>:
    5868:	02e12a23          	sw	a4,52(sp)

0000586c <.LVL87>:
    586c:	00d936b3          	sltu	a3,s2,a3

00005870 <.LVL88>:
    5870:	01273733          	sltu	a4,a4,s2

00005874 <.LVL89>:
    5874:	013789b3          	add	s3,a5,s3

00005878 <.LVL90>:
    5878:	00e6e733          	or	a4,a3,a4

0000587c <.LVL91>:
    587c:	00e98733          	add	a4,s3,a4
    5880:	02e12c23          	sw	a4,56(sp)

00005884 <.LVL92>:
    5884:	00f9b7b3          	sltu	a5,s3,a5

00005888 <.LVL93>:
    5888:	01373733          	sltu	a4,a4,s3

0000588c <.LVL94>:
    588c:	00e7e7b3          	or	a5,a5,a4

00005890 <.LVL95>:
    5890:	02c12703          	lw	a4,44(sp)

00005894 <.LVL96>:
    5894:	00eb0733          	add	a4,s6,a4
    5898:	00e787b3          	add	a5,a5,a4

0000589c <.L22>:
    589c:	02f12e23          	sw	a5,60(sp)

000058a0 <.LBE23>:
    58a0:	00c79713          	sll	a4,a5,0xc
    58a4:	d2075ae3          	bgez	a4,55d8 <.L10>

000058a8 <.LBB24>:
    58a8:	03012683          	lw	a3,48(sp)

000058ac <.LBE24>:
    58ac:	fff80737          	lui	a4,0xfff80
    58b0:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff7245f>
    58b4:	00e7f7b3          	and	a5,a5,a4
    58b8:	02f12e23          	sw	a5,60(sp)
    58bc:	00148493          	add	s1,s1,1

000058c0 <.LBB26>:
    58c0:	01f69693          	sll	a3,a3,0x1f

000058c4 <.LVL100>:
    58c4:	03010713          	add	a4,sp,48
    58c8:	03c10513          	add	a0,sp,60

000058cc <.L115>:
    58cc:	00072603          	lw	a2,0(a4)
    58d0:	00472583          	lw	a1,4(a4)
    58d4:	00470713          	add	a4,a4,4
    58d8:	00165613          	srl	a2,a2,0x1
    58dc:	01f59593          	sll	a1,a1,0x1f
    58e0:	00b66633          	or	a2,a2,a1
    58e4:	fec72e23          	sw	a2,-4(a4)
    58e8:	fee512e3          	bne	a0,a4,58cc <.L115>

000058ec <.LBE26>:
    58ec:	03012703          	lw	a4,48(sp)

000058f0 <.LBB27>:
    58f0:	0017d793          	srl	a5,a5,0x1
    58f4:	02f12e23          	sw	a5,60(sp)

000058f8 <.LBB28>:
    58f8:	00d037b3          	snez	a5,a3

000058fc <.LBE28>:
    58fc:	00f767b3          	or	a5,a4,a5
    5900:	02f12823          	sw	a5,48(sp)

00005904 <.LBE29>:
    5904:	000087b7          	lui	a5,0x8
    5908:	fff78793          	add	a5,a5,-1 # 7fff <.LLST132+0x8>
    590c:	ccf496e3          	bne	s1,a5,55d8 <.L10>

00005910 <.LVL104>:
    5910:	02012e23          	sw	zero,60(sp)
    5914:	02012c23          	sw	zero,56(sp)
    5918:	02012a23          	sw	zero,52(sp)
    591c:	02012823          	sw	zero,48(sp)

00005920 <.LBB105>:
  FP_PACK_SEMIRAW_Q (r, R);
    5920:	cb9ff06f          	j	55d8 <.L10>

00005924 <.L33>:
  FP_SUB_Q (R, A, B);
    5924:	0008a303          	lw	t1,0(a7)
    5928:	0048af03          	lw	t5,4(a7)
    592c:	00a88fb3          	add	t6,a7,a0
    5930:	00c35333          	srl	t1,t1,a2
    5934:	01cf1f33          	sll	t5,t5,t3
    5938:	01e36333          	or	t1,t1,t5
    593c:	006fa023          	sw	t1,0(t6)

00005940 <.LVL107>:
    5940:	001e8e93          	add	t4,t4,1

00005944 <.LVL108>:
    5944:	00488893          	add	a7,a7,4
    5948:	e99ff06f          	j	57e0 <.L32>

0000594c <.L7>:
    594c:	02412903          	lw	s2,36(sp)

00005950 <.LVL110>:
    5950:	02812983          	lw	s3,40(sp)
    5954:	02c12b03          	lw	s6,44(sp)

00005958 <.LBB108>:
    5958:	26088263          	beqz	a7,5bbc <.L48>
    595c:	409b8833          	sub	a6,s7,s1

00005960 <.LVL111>:
    5960:	0a049c63          	bnez	s1,5a18 <.L49>
    5964:	01412683          	lw	a3,20(sp)
    5968:	01812703          	lw	a4,24(sp)
    596c:	01c12883          	lw	a7,28(sp)
    5970:	00e6e5b3          	or	a1,a3,a4
    5974:	0115e5b3          	or	a1,a1,a7
    5978:	00f5e5b3          	or	a1,a1,a5
    597c:	00059e63          	bnez	a1,5998 <.L50>

00005980 <.LVL112>:
    5980:	02812823          	sw	s0,48(sp)
    5984:	03212a23          	sw	s2,52(sp)
    5988:	03312c23          	sw	s3,56(sp)
    598c:	03612e23          	sw	s6,60(sp)

00005990 <.L360>:
    5990:	00080493          	mv	s1,a6

00005994 <.LVL114>:
    5994:	c45ff06f          	j	55d8 <.L10>

00005998 <.L50>:
    5998:	fff80593          	add	a1,a6,-1

0000599c <.LVL116>:
    599c:	04059663          	bnez	a1,59e8 <.L51>

000059a0 <.LBB31>:
    59a0:	00878433          	add	s0,a5,s0
    59a4:	01268933          	add	s2,a3,s2
    59a8:	02812823          	sw	s0,48(sp)

000059ac <.LVL117>:
    59ac:	00f43433          	sltu	s0,s0,a5

000059b0 <.LVL118>:
    59b0:	00890433          	add	s0,s2,s0

000059b4 <.LVL119>:
    59b4:	02812a23          	sw	s0,52(sp)

000059b8 <.LVL120>:
    59b8:	00d936b3          	sltu	a3,s2,a3

000059bc <.LVL121>:
    59bc:	01243433          	sltu	s0,s0,s2

000059c0 <.LVL122>:
    59c0:	013709b3          	add	s3,a4,s3

000059c4 <.LVL123>:
    59c4:	0086e6b3          	or	a3,a3,s0

000059c8 <.LVL124>:
    59c8:	00d986b3          	add	a3,s3,a3
    59cc:	02d12c23          	sw	a3,56(sp)

000059d0 <.LVL125>:
    59d0:	00e9b7b3          	sltu	a5,s3,a4

000059d4 <.LVL126>:
    59d4:	0136b6b3          	sltu	a3,a3,s3

000059d8 <.LVL127>:
    59d8:	00d7e7b3          	or	a5,a5,a3

000059dc <.LVL128>:
    59dc:	016888b3          	add	a7,a7,s6
    59e0:	011787b3          	add	a5,a5,a7
    59e4:	bb9ff06f          	j	559c <.L355>

000059e8 <.L51>:
    59e8:	000087b7          	lui	a5,0x8
    59ec:	fff78793          	add	a5,a5,-1 # 7fff <.LLST132+0x8>
    59f0:	62f81ae3          	bne	a6,a5,6824 <.L62>

000059f4 <.L63>:
    59f4:	02812823          	sw	s0,48(sp)

000059f8 <.L364>:
    59f8:	03212a23          	sw	s2,52(sp)
    59fc:	03312c23          	sw	s3,56(sp)
    5a00:	03612e23          	sw	s6,60(sp)

00005a04 <.L359>:
    5a04:	000084b7          	lui	s1,0x8

00005a08 <.LVL132>:
    5a08:	fff48493          	add	s1,s1,-1 # 7fff <.LLST132+0x8>
    5a0c:	bcdff06f          	j	55d8 <.L10>

00005a10 <.L274>:
    5a10:	00078413          	mv	s0,a5
    5a14:	fe1ff06f          	j	59f4 <.L63>

00005a18 <.L49>:
    5a18:	000087b7          	lui	a5,0x8
    5a1c:	fff78793          	add	a5,a5,-1 # 7fff <.LLST132+0x8>
    5a20:	fcfb8ae3          	beq	s7,a5,59f4 <.L63>
    5a24:	01c12783          	lw	a5,28(sp)
    5a28:	00080737          	lui	a4,0x80
    5a2c:	00e7e7b3          	or	a5,a5,a4
    5a30:	00f12e23          	sw	a5,28(sp)

00005a34 <.LDL2>:
    5a34:	07400793          	li	a5,116
    5a38:	5f07cae3          	blt	a5,a6,682c <.L64>
    5a3c:	00080593          	mv	a1,a6

00005a40 <.L268>:
    5a40:	02000713          	li	a4,32
    5a44:	02e5c733          	div	a4,a1,a4

00005a48 <.LVL136>:
    5a48:	00060693          	mv	a3,a2
    5a4c:	00000493          	li	s1,0

00005a50 <.LVL137>:
    5a50:	00000793          	li	a5,0

00005a54 <.L65>:
    5a54:	02e7ce63          	blt	a5,a4,5a90 <.L66>
    5a58:	00300793          	li	a5,3

00005a5c <.LVL139>:
    5a5c:	01f5f893          	and	a7,a1,31
    5a60:	40e787b3          	sub	a5,a5,a4
    5a64:	00271813          	sll	a6,a4,0x2
    5a68:	02089e63          	bnez	a7,5aa4 <.L67>

00005a6c <.L68>:
    5a6c:	010606b3          	add	a3,a2,a6
    5a70:	0006a683          	lw	a3,0(a3)
    5a74:	00188893          	add	a7,a7,1

00005a78 <.LVL141>:
    5a78:	00460613          	add	a2,a2,4
    5a7c:	fed62e23          	sw	a3,-4(a2)

00005a80 <.LVL142>:
    5a80:	ff17d6e3          	bge	a5,a7,5a6c <.L68>
    5a84:	00400793          	li	a5,4
    5a88:	40e78733          	sub	a4,a5,a4

00005a8c <.LVL143>:
    5a8c:	0780006f          	j	5b04 <.L73>

00005a90 <.L66>:
    5a90:	0006a803          	lw	a6,0(a3)
    5a94:	00178793          	add	a5,a5,1

00005a98 <.LVL145>:
    5a98:	00468693          	add	a3,a3,4
    5a9c:	0104e4b3          	or	s1,s1,a6

00005aa0 <.LVL146>:
    5aa0:	fb5ff06f          	j	5a54 <.L65>

00005aa4 <.L67>:
    5aa4:	02000693          	li	a3,32
    5aa8:	02d5e5b3          	rem	a1,a1,a3

00005aac <.LVL148>:
    5aac:	40b685b3          	sub	a1,a3,a1
    5ab0:	00070693          	mv	a3,a4
    5ab4:	00075463          	bgez	a4,5abc <.L70>

00005ab8 <.LVL149>:
    5ab8:	00000693          	li	a3,0

00005abc <.L70>:
    5abc:	00269693          	sll	a3,a3,0x2
    5ac0:	04068693          	add	a3,a3,64
    5ac4:	002686b3          	add	a3,a3,sp
    5ac8:	fd06a683          	lw	a3,-48(a3)
    5acc:	00000313          	li	t1,0
    5ad0:	00b696b3          	sll	a3,a3,a1
    5ad4:	00d4e4b3          	or	s1,s1,a3

00005ad8 <.LVL151>:
    5ad8:	010506b3          	add	a3,a0,a6
    5adc:	41000833          	neg	a6,a6

00005ae0 <.L71>:
    5ae0:	0af34a63          	blt	t1,a5,5b94 <.L72>
    5ae4:	00400693          	li	a3,4
    5ae8:	40e68733          	sub	a4,a3,a4

00005aec <.LVL153>:
    5aec:	01c12683          	lw	a3,28(sp)
    5af0:	00279793          	sll	a5,a5,0x2

00005af4 <.LVL154>:
    5af4:	04078793          	add	a5,a5,64
    5af8:	002787b3          	add	a5,a5,sp
    5afc:	0116d6b3          	srl	a3,a3,a7
    5b00:	fcd7a823          	sw	a3,-48(a5)

00005b04 <.L73>:
    5b04:	00572793          	slti	a5,a4,5
    5b08:	00000613          	li	a2,0
    5b0c:	00078863          	beqz	a5,5b1c <.L75>
    5b10:	00400613          	li	a2,4
    5b14:	40e60633          	sub	a2,a2,a4
    5b18:	00261613          	sll	a2,a2,0x2

00005b1c <.L75>:
    5b1c:	00271713          	sll	a4,a4,0x2
    5b20:	00e50533          	add	a0,a0,a4
    5b24:	00000593          	li	a1,0
    5b28:	a39fb0ef          	jal	1560 <__GI_memset>

00005b2c <.LBE33>:
    5b2c:	01012703          	lw	a4,16(sp)

00005b30 <.LBB34>:
    5b30:	009037b3          	snez	a5,s1

00005b34 <.LBE34>:
    5b34:	00e7e7b3          	or	a5,a5,a4

00005b38 <.L76>:
    5b38:	01412683          	lw	a3,20(sp)

00005b3c <.LBB36>:
    5b3c:	00f12823          	sw	a5,16(sp)

00005b40 <.LBB37>:
    5b40:	00f407b3          	add	a5,s0,a5
    5b44:	01268933          	add	s2,a3,s2
    5b48:	02f12823          	sw	a5,48(sp)

00005b4c <.LVL158>:
    5b4c:	0087b7b3          	sltu	a5,a5,s0

00005b50 <.LVL159>:
    5b50:	00f90733          	add	a4,s2,a5
    5b54:	01812783          	lw	a5,24(sp)

00005b58 <.LVL160>:
    5b58:	02e12a23          	sw	a4,52(sp)

00005b5c <.LVL161>:
    5b5c:	00d936b3          	sltu	a3,s2,a3

00005b60 <.LVL162>:
    5b60:	01273733          	sltu	a4,a4,s2

00005b64 <.LVL163>:
    5b64:	013789b3          	add	s3,a5,s3

00005b68 <.LVL164>:
    5b68:	00e6e733          	or	a4,a3,a4

00005b6c <.LVL165>:
    5b6c:	00e98733          	add	a4,s3,a4
    5b70:	02e12c23          	sw	a4,56(sp)

00005b74 <.LVL166>:
    5b74:	00f9b7b3          	sltu	a5,s3,a5

00005b78 <.LVL167>:
    5b78:	01373733          	sltu	a4,a4,s3

00005b7c <.LVL168>:
    5b7c:	00e7e7b3          	or	a5,a5,a4

00005b80 <.LVL169>:
    5b80:	01c12703          	lw	a4,28(sp)

00005b84 <.LBE37>:
    5b84:	000b8493          	mv	s1,s7

00005b88 <.LBB38>:
    5b88:	00eb0733          	add	a4,s6,a4
    5b8c:	00e787b3          	add	a5,a5,a4

00005b90 <.LBE38>:
    5b90:	d0dff06f          	j	589c <.L22>

00005b94 <.L72>:
    5b94:	0006a603          	lw	a2,0(a3)
    5b98:	0046ae03          	lw	t3,4(a3)
    5b9c:	01068eb3          	add	t4,a3,a6
    5ba0:	01165633          	srl	a2,a2,a7
    5ba4:	00be1e33          	sll	t3,t3,a1
    5ba8:	01c66633          	or	a2,a2,t3
    5bac:	00cea023          	sw	a2,0(t4)

00005bb0 <.LVL172>:
    5bb0:	00130313          	add	t1,t1,1

00005bb4 <.LVL173>:
    5bb4:	00468693          	add	a3,a3,4
    5bb8:	f29ff06f          	j	5ae0 <.L71>

00005bbc <.L48>:
    5bbc:	00148813          	add	a6,s1,1
    5bc0:	01181893          	sll	a7,a6,0x11
    5bc4:	0128d893          	srl	a7,a7,0x12
    5bc8:	01412683          	lw	a3,20(sp)
    5bcc:	01812703          	lw	a4,24(sp)
    5bd0:	01c12603          	lw	a2,28(sp)
    5bd4:	03010593          	add	a1,sp,48
    5bd8:	03c10513          	add	a0,sp,60
    5bdc:	10089e63          	bnez	a7,5cf8 <.L87>
    5be0:	00e6e833          	or	a6,a3,a4
    5be4:	00c86833          	or	a6,a6,a2
    5be8:	00f86833          	or	a6,a6,a5
    5bec:	0a049863          	bnez	s1,5c9c <.L88>

00005bf0 <.LVL175>:
    5bf0:	00081e63          	bnez	a6,5c0c <.L89>
    5bf4:	02812823          	sw	s0,48(sp)
    5bf8:	03212a23          	sw	s2,52(sp)
    5bfc:	03312c23          	sw	s3,56(sp)
    5c00:	03612e23          	sw	s6,60(sp)

00005c04 <.L357>:
    5c04:	00000493          	li	s1,0
    5c08:	9d1ff06f          	j	55d8 <.L10>

00005c0c <.L89>:
    5c0c:	013965b3          	or	a1,s2,s3
    5c10:	0165e5b3          	or	a1,a1,s6
    5c14:	0085e5b3          	or	a1,a1,s0
    5c18:	00059c63          	bnez	a1,5c30 <.L90>
    5c1c:	02f12823          	sw	a5,48(sp)
    5c20:	02d12a23          	sw	a3,52(sp)
    5c24:	02e12c23          	sw	a4,56(sp)
    5c28:	02c12e23          	sw	a2,60(sp)

00005c2c <.LBB123>:
  FP_PACK_SEMIRAW_Q (r, R);
    5c2c:	9adff06f          	j	55d8 <.L10>

00005c30 <.L90>:
  FP_SUB_Q (R, A, B);
    5c30:	00878433          	add	s0,a5,s0
    5c34:	01268933          	add	s2,a3,s2
    5c38:	02812823          	sw	s0,48(sp)

00005c3c <.LVL180>:
    5c3c:	00f43433          	sltu	s0,s0,a5

00005c40 <.LVL181>:
    5c40:	00890433          	add	s0,s2,s0

00005c44 <.LVL182>:
    5c44:	02812a23          	sw	s0,52(sp)

00005c48 <.LVL183>:
    5c48:	00d936b3          	sltu	a3,s2,a3

00005c4c <.LVL184>:
    5c4c:	01243433          	sltu	s0,s0,s2

00005c50 <.LVL185>:
    5c50:	013709b3          	add	s3,a4,s3

00005c54 <.LVL186>:
    5c54:	0086e6b3          	or	a3,a3,s0

00005c58 <.LVL187>:
    5c58:	00d986b3          	add	a3,s3,a3
    5c5c:	02d12c23          	sw	a3,56(sp)

00005c60 <.LVL188>:
    5c60:	00e9b733          	sltu	a4,s3,a4

00005c64 <.LVL189>:
    5c64:	0136b6b3          	sltu	a3,a3,s3

00005c68 <.LVL190>:
    5c68:	00d76733          	or	a4,a4,a3

00005c6c <.LVL191>:
    5c6c:	01660633          	add	a2,a2,s6
    5c70:	00c70733          	add	a4,a4,a2

00005c74 <.LBE40>:
    5c74:	00c71793          	sll	a5,a4,0xc

00005c78 <.LVL192>:
    5c78:	0007c663          	bltz	a5,5c84 <.L101>

00005c7c <.LBB41>:
    5c7c:	02e12e23          	sw	a4,60(sp)
    5c80:	959ff06f          	j	55d8 <.L10>

00005c84 <.L101>:
    5c84:	fff807b7          	lui	a5,0xfff80
    5c88:	fff78793          	add	a5,a5,-1 # fff7ffff <_ebss+0xfff7245f>
    5c8c:	00f77733          	and	a4,a4,a5
    5c90:	02e12e23          	sw	a4,60(sp)

00005c94 <.LBB126>:
    5c94:	00100493          	li	s1,1

00005c98 <.LVL194>:
    5c98:	941ff06f          	j	55d8 <.L10>

00005c9c <.L88>:
    5c9c:	1a080463          	beqz	a6,5e44 <.L271>
    5ca0:	01396933          	or	s2,s2,s3
    5ca4:	01696933          	or	s2,s2,s6
    5ca8:	00896933          	or	s2,s2,s0
    5cac:	1a090063          	beqz	s2,5e4c <.L272>

00005cb0 <.LBB129>:
    5cb0:	000087b7          	lui	a5,0x8
    5cb4:	02f12e23          	sw	a5,60(sp)
    5cb8:	02012c23          	sw	zero,56(sp)
    5cbc:	02012a23          	sw	zero,52(sp)
    5cc0:	02012823          	sw	zero,48(sp)

00005cc4 <.LBB42>:
    5cc4:	00050793          	mv	a5,a0

00005cc8 <.L102>:
    5cc8:	0007a703          	lw	a4,0(a5) # 8000 <.LLST132+0x9>
    5ccc:	ffc7a683          	lw	a3,-4(a5)
    5cd0:	ffc78793          	add	a5,a5,-4
    5cd4:	00371713          	sll	a4,a4,0x3
    5cd8:	01d6d693          	srl	a3,a3,0x1d
    5cdc:	00d76733          	or	a4,a4,a3
    5ce0:	00e7a223          	sw	a4,4(a5)
    5ce4:	fef592e3          	bne	a1,a5,5cc8 <.L102>

00005ce8 <.L213>:
    5ce8:	000084b7          	lui	s1,0x8

00005cec <.LVL200>:
    5cec:	fff48493          	add	s1,s1,-1 # 7fff <.LLST132+0x8>

00005cf0 <.L358>:
    5cf0:	00000a93          	li	s5,0
    5cf4:	8e5ff06f          	j	55d8 <.L10>

00005cf8 <.L87>:
    5cf8:	00878433          	add	s0,a5,s0
    5cfc:	01268933          	add	s2,a3,s2
    5d00:	02812823          	sw	s0,48(sp)

00005d04 <.LVL203>:
    5d04:	00f43433          	sltu	s0,s0,a5

00005d08 <.LVL204>:
    5d08:	00890433          	add	s0,s2,s0

00005d0c <.LVL205>:
    5d0c:	02812a23          	sw	s0,52(sp)

00005d10 <.LVL206>:
    5d10:	00d936b3          	sltu	a3,s2,a3

00005d14 <.LVL207>:
    5d14:	01243433          	sltu	s0,s0,s2

00005d18 <.LVL208>:
    5d18:	013709b3          	add	s3,a4,s3

00005d1c <.LVL209>:
    5d1c:	0086e6b3          	or	a3,a3,s0

00005d20 <.LVL210>:
    5d20:	00d986b3          	add	a3,s3,a3
    5d24:	02d12c23          	sw	a3,56(sp)

00005d28 <.LVL211>:
    5d28:	00e9b733          	sltu	a4,s3,a4

00005d2c <.LVL212>:
    5d2c:	0136b6b3          	sltu	a3,a3,s3

00005d30 <.LVL213>:
    5d30:	00d76733          	or	a4,a4,a3

00005d34 <.LVL214>:
    5d34:	01660633          	add	a2,a2,s6
    5d38:	00c70733          	add	a4,a4,a2
    5d3c:	02e12e23          	sw	a4,60(sp)

00005d40 <.LBB44>:
    5d40:	00058793          	mv	a5,a1

00005d44 <.L113>:
    5d44:	0007a683          	lw	a3,0(a5)
    5d48:	0047a603          	lw	a2,4(a5)
    5d4c:	00478793          	add	a5,a5,4
    5d50:	0016d693          	srl	a3,a3,0x1
    5d54:	01f61613          	sll	a2,a2,0x1f
    5d58:	00c6e6b3          	or	a3,a3,a2
    5d5c:	fed7ae23          	sw	a3,-4(a5)
    5d60:	fef512e3          	bne	a0,a5,5d44 <.L113>

00005d64 <.LBE44>:
    5d64:	000087b7          	lui	a5,0x8
    5d68:	fff78793          	add	a5,a5,-1 # 7fff <.LLST132+0x8>
    5d6c:	00f80863          	beq	a6,a5,5d7c <.L114>

00005d70 <.LBB47>:
    5d70:	00175713          	srl	a4,a4,0x1
    5d74:	02e12e23          	sw	a4,60(sp)
    5d78:	c19ff06f          	j	5990 <.L360>

00005d7c <.L114>:
    5d7c:	02012e23          	sw	zero,60(sp)
    5d80:	02012c23          	sw	zero,56(sp)
    5d84:	02012a23          	sw	zero,52(sp)
    5d88:	02012823          	sw	zero,48(sp)
    5d8c:	c05ff06f          	j	5990 <.L360>

00005d90 <.L6>:
    5d90:	29105c63          	blez	a7,6028 <.L118>

00005d94 <.LBB133>:
    5d94:	01412903          	lw	s2,20(sp)

00005d98 <.LVL221>:
    5d98:	01812983          	lw	s3,24(sp)
    5d9c:	01c12b03          	lw	s6,28(sp)

00005da0 <.LBB134>:
    5da0:	0a0b9e63          	bnez	s7,5e5c <.L119>
    5da4:	02412e03          	lw	t3,36(sp)
    5da8:	02812503          	lw	a0,40(sp)
    5dac:	02c12683          	lw	a3,44(sp)
    5db0:	00ae6733          	or	a4,t3,a0
    5db4:	00d76733          	or	a4,a4,a3
    5db8:	00876733          	or	a4,a4,s0
    5dbc:	f6070e63          	beqz	a4,5538 <.L363>
    5dc0:	fff88e93          	add	t4,a7,-1

00005dc4 <.LVL222>:
    5dc4:	040e9c63          	bnez	t4,5e1c <.L121>

00005dc8 <.LBB61>:
    5dc8:	40878733          	sub	a4,a5,s0

00005dcc <.LVL224>:
    5dcc:	41c90633          	sub	a2,s2,t3

00005dd0 <.LVL225>:
    5dd0:	00e7b5b3          	sltu	a1,a5,a4
    5dd4:	00c93833          	sltu	a6,s2,a2

00005dd8 <.LVL226>:
    5dd8:	40b60633          	sub	a2,a2,a1

00005ddc <.LVL227>:
    5ddc:	00000593          	li	a1,0
    5de0:	00e7f663          	bgeu	a5,a4,5dec <.L126>
    5de4:	412e0e33          	sub	t3,t3,s2
    5de8:	001e3593          	seqz	a1,t3

00005dec <.L126>:
    5dec:	0105e7b3          	or	a5,a1,a6

00005df0 <.LVL228>:
    5df0:	40a985b3          	sub	a1,s3,a0

00005df4 <.LVL229>:
    5df4:	00b9b833          	sltu	a6,s3,a1

00005df8 <.LVL230>:
    5df8:	40f585b3          	sub	a1,a1,a5

00005dfc <.LVL231>:
    5dfc:	00078663          	beqz	a5,5e08 <.L129>
    5e00:	41350533          	sub	a0,a0,s3
    5e04:	00153e93          	seqz	t4,a0

00005e08 <.L129>:
    5e08:	40db07b3          	sub	a5,s6,a3

00005e0c <.LVL233>:
    5e0c:	010ee6b3          	or	a3,t4,a6

00005e10 <.LVL234>:
    5e10:	40d787b3          	sub	a5,a5,a3

00005e14 <.L356>:
    5e14:	00100493          	li	s1,1

00005e18 <.LVL236>:
    5e18:	1bc0006f          	j	5fd4 <.L130>

00005e1c <.L121>:
    5e1c:	00008737          	lui	a4,0x8
    5e20:	fff70713          	add	a4,a4,-1 # 7fff <.LLST132+0x8>
    5e24:	f8e88863          	beq	a7,a4,55b4 <.L23>
    5e28:	07400713          	li	a4,116
    5e2c:	05d75c63          	bge	a4,t4,5e84 <.L269>

00005e30 <.L132>:
    5e30:	02012623          	sw	zero,44(sp)
    5e34:	02012423          	sw	zero,40(sp)
    5e38:	02012223          	sw	zero,36(sp)
    5e3c:	00100713          	li	a4,1
    5e40:	1340006f          	j	5f74 <.L143>

00005e44 <.L271>:
    5e44:	00040793          	mv	a5,s0
    5e48:	f6cff06f          	j	55b4 <.L23>

00005e4c <.L272>:
    5e4c:	00068913          	mv	s2,a3
    5e50:	00070993          	mv	s3,a4
    5e54:	00060b13          	mv	s6,a2
    5e58:	f5cff06f          	j	55b4 <.L23>

00005e5c <.L119>:
    5e5c:	00008737          	lui	a4,0x8
    5e60:	fff70713          	add	a4,a4,-1 # 7fff <.LLST132+0x8>
    5e64:	bae486e3          	beq	s1,a4,5a10 <.L274>
    5e68:	02c12703          	lw	a4,44(sp)
    5e6c:	000806b7          	lui	a3,0x80
    5e70:	00d76733          	or	a4,a4,a3
    5e74:	02e12623          	sw	a4,44(sp)

00005e78 <.LDL3>:
    5e78:	07400713          	li	a4,116
    5e7c:	fb174ae3          	blt	a4,a7,5e30 <.L132>
    5e80:	00088e93          	mv	t4,a7

00005e84 <.L269>:
    5e84:	405ed693          	sra	a3,t4,0x5

00005e88 <.LVL242>:
    5e88:	00030593          	mv	a1,t1
    5e8c:	01fefe93          	and	t4,t4,31

00005e90 <.LVL243>:
    5e90:	00000713          	li	a4,0
    5e94:	00000613          	li	a2,0

00005e98 <.L133>:
    5e98:	02d61c63          	bne	a2,a3,5ed0 <.L134>
    5e9c:	00300613          	li	a2,3

00005ea0 <.LVL245>:
    5ea0:	40d60633          	sub	a2,a2,a3
    5ea4:	00269593          	sll	a1,a3,0x2
    5ea8:	020e9e63          	bnez	t4,5ee4 <.L135>

00005eac <.L136>:
    5eac:	00b30533          	add	a0,t1,a1
    5eb0:	00052503          	lw	a0,0(a0)
    5eb4:	001e8e93          	add	t4,t4,1

00005eb8 <.LVL247>:
    5eb8:	00430313          	add	t1,t1,4
    5ebc:	fea32e23          	sw	a0,-4(t1)

00005ec0 <.LVL248>:
    5ec0:	ffd656e3          	bge	a2,t4,5eac <.L136>
    5ec4:	00400613          	li	a2,4
    5ec8:	40d606b3          	sub	a3,a2,a3

00005ecc <.LVL249>:
    5ecc:	0640006f          	j	5f30 <.L140>

00005ed0 <.L134>:
    5ed0:	0005a503          	lw	a0,0(a1)
    5ed4:	00160613          	add	a2,a2,1

00005ed8 <.LVL251>:
    5ed8:	00458593          	add	a1,a1,4
    5edc:	00a76733          	or	a4,a4,a0

00005ee0 <.LVL252>:
    5ee0:	fb9ff06f          	j	5e98 <.L133>

00005ee4 <.L135>:
    5ee4:	04058513          	add	a0,a1,64
    5ee8:	00250533          	add	a0,a0,sp
    5eec:	fe052503          	lw	a0,-32(a0)
    5ef0:	02000313          	li	t1,32
    5ef4:	41d30333          	sub	t1,t1,t4
    5ef8:	00651533          	sll	a0,a0,t1
    5efc:	00a76733          	or	a4,a4,a0

00005f00 <.LVL254>:
    5f00:	00000e13          	li	t3,0
    5f04:	00b80533          	add	a0,a6,a1
    5f08:	40b005b3          	neg	a1,a1

00005f0c <.L138>:
    5f0c:	0ece4a63          	blt	t3,a2,6000 <.L139>
    5f10:	00400593          	li	a1,4
    5f14:	40d586b3          	sub	a3,a1,a3

00005f18 <.LVL256>:
    5f18:	02c12583          	lw	a1,44(sp)
    5f1c:	00261613          	sll	a2,a2,0x2

00005f20 <.LVL257>:
    5f20:	04060613          	add	a2,a2,64
    5f24:	00260633          	add	a2,a2,sp
    5f28:	01d5d5b3          	srl	a1,a1,t4
    5f2c:	feb62023          	sw	a1,-32(a2)

00005f30 <.L140>:
    5f30:	00400613          	li	a2,4
    5f34:	40d60633          	sub	a2,a2,a3
    5f38:	00261613          	sll	a2,a2,0x2
    5f3c:	00269693          	sll	a3,a3,0x2
    5f40:	00800593          	li	a1,8
    5f44:	00d806b3          	add	a3,a6,a3
    5f48:	00b66a63          	bltu	a2,a1,5f5c <.L141>
    5f4c:	0006a023          	sw	zero,0(a3) # 80000 <_ebss+0x72460>
    5f50:	0006a223          	sw	zero,4(a3)
    5f54:	ff860613          	add	a2,a2,-8
    5f58:	00868693          	add	a3,a3,8

00005f5c <.L141>:
    5f5c:	00400593          	li	a1,4
    5f60:	00b66463          	bltu	a2,a1,5f68 <.L142>
    5f64:	0006a023          	sw	zero,0(a3)

00005f68 <.L142>:
    5f68:	02012683          	lw	a3,32(sp)

00005f6c <.LBB64>:
    5f6c:	00e03733          	snez	a4,a4

00005f70 <.LBE64>:
    5f70:	00d76733          	or	a4,a4,a3

00005f74 <.L143>:
    5f74:	02412583          	lw	a1,36(sp)

00005f78 <.LBB67>:
    5f78:	02e12023          	sw	a4,32(sp)

00005f7c <.LBB68>:
    5f7c:	40e78733          	sub	a4,a5,a4

00005f80 <.LVL263>:
    5f80:	40b90633          	sub	a2,s2,a1

00005f84 <.LVL264>:
    5f84:	00e7b6b3          	sltu	a3,a5,a4
    5f88:	00c93533          	sltu	a0,s2,a2

00005f8c <.LVL265>:
    5f8c:	40d60633          	sub	a2,a2,a3

00005f90 <.LVL266>:
    5f90:	00000693          	li	a3,0
    5f94:	00e7f663          	bgeu	a5,a4,5fa0 <.L148>
    5f98:	412585b3          	sub	a1,a1,s2
    5f9c:	0015b693          	seqz	a3,a1

00005fa0 <.L148>:
    5fa0:	00a6e7b3          	or	a5,a3,a0

00005fa4 <.LVL267>:
    5fa4:	02812503          	lw	a0,40(sp)
    5fa8:	00000693          	li	a3,0
    5fac:	40a985b3          	sub	a1,s3,a0

00005fb0 <.LVL268>:
    5fb0:	00b9b833          	sltu	a6,s3,a1

00005fb4 <.LVL269>:
    5fb4:	40f585b3          	sub	a1,a1,a5

00005fb8 <.LVL270>:
    5fb8:	00078663          	beqz	a5,5fc4 <.L151>
    5fbc:	41350533          	sub	a0,a0,s3
    5fc0:	00153693          	seqz	a3,a0

00005fc4 <.L151>:
    5fc4:	02c12783          	lw	a5,44(sp)

00005fc8 <.LVL272>:
    5fc8:	0106e6b3          	or	a3,a3,a6

00005fcc <.LVL273>:
    5fcc:	40fb07b3          	sub	a5,s6,a5
    5fd0:	40d787b3          	sub	a5,a5,a3

00005fd4 <.L130>:
    5fd4:	02e12823          	sw	a4,48(sp)

00005fd8 <.LBB70>:
    5fd8:	02f12e23          	sw	a5,60(sp)
    5fdc:	02b12c23          	sw	a1,56(sp)
    5fe0:	02c12a23          	sw	a2,52(sp)

00005fe4 <.LBE70>:
    5fe4:	00c79713          	sll	a4,a5,0xc
    5fe8:	de075863          	bgez	a4,55d8 <.L10>

00005fec <.LBB71>:
    5fec:	00080737          	lui	a4,0x80
    5ff0:	fff70713          	add	a4,a4,-1 # 7ffff <_ebss+0x7245f>
    5ff4:	00e7f7b3          	and	a5,a5,a4
    5ff8:	02f12e23          	sw	a5,60(sp)
    5ffc:	5740006f          	j	6570 <.L233>

00006000 <.L139>:
    6000:	00052883          	lw	a7,0(a0)
    6004:	00452f03          	lw	t5,4(a0)
    6008:	00b50fb3          	add	t6,a0,a1
    600c:	01d8d8b3          	srl	a7,a7,t4
    6010:	006f1f33          	sll	t5,t5,t1
    6014:	01e8e8b3          	or	a7,a7,t5
    6018:	011fa023          	sw	a7,0(t6)

0000601c <.LVL277>:
    601c:	001e0e13          	add	t3,t3,1

00006020 <.LVL278>:
    6020:	00450513          	add	a0,a0,4
    6024:	ee9ff06f          	j	5f0c <.L138>

00006028 <.L118>:
    6028:	02412983          	lw	s3,36(sp)
    602c:	02812c03          	lw	s8,40(sp)
    6030:	02c12b03          	lw	s6,44(sp)

00006034 <.LBB137>:
    6034:	28088463          	beqz	a7,62bc <.L152>
    6038:	409b8333          	sub	t1,s7,s1

0000603c <.LVL280>:
    603c:	0a049e63          	bnez	s1,60f8 <.L153>
    6040:	01412583          	lw	a1,20(sp)
    6044:	01812803          	lw	a6,24(sp)
    6048:	01c12683          	lw	a3,28(sp)
    604c:	0105e8b3          	or	a7,a1,a6
    6050:	00d8e8b3          	or	a7,a7,a3
    6054:	00f8e8b3          	or	a7,a7,a5
    6058:	02089063          	bnez	a7,6078 <.L154>

0000605c <.LVL281>:
    605c:	02812823          	sw	s0,48(sp)
    6060:	03312a23          	sw	s3,52(sp)
    6064:	03812c23          	sw	s8,56(sp)
    6068:	03612e23          	sw	s6,60(sp)

0000606c <.LBB138>:
    606c:	00030493          	mv	s1,t1

00006070 <.L361>:
    6070:	00090a93          	mv	s5,s2

00006074 <.LVL284>:
    6074:	d64ff06f          	j	55d8 <.L10>

00006078 <.L154>:
    6078:	fff30893          	add	a7,t1,-1

0000607c <.LVL286>:
    607c:	04089c63          	bnez	a7,60d4 <.L155>

00006080 <.LBB73>:
    6080:	40f40733          	sub	a4,s0,a5

00006084 <.LVL288>:
    6084:	40b98633          	sub	a2,s3,a1

00006088 <.LVL289>:
    6088:	00e437b3          	sltu	a5,s0,a4
    608c:	00c9b533          	sltu	a0,s3,a2

00006090 <.LVL290>:
    6090:	40f60633          	sub	a2,a2,a5

00006094 <.LVL291>:
    6094:	00000793          	li	a5,0
    6098:	00e47663          	bgeu	s0,a4,60a4 <.L160>
    609c:	413585b3          	sub	a1,a1,s3
    60a0:	0015b793          	seqz	a5,a1

000060a4 <.L160>:
    60a4:	00a7e7b3          	or	a5,a5,a0

000060a8 <.LVL292>:
    60a8:	410c05b3          	sub	a1,s8,a6

000060ac <.LVL293>:
    60ac:	00bc3533          	sltu	a0,s8,a1

000060b0 <.LVL294>:
    60b0:	40f585b3          	sub	a1,a1,a5

000060b4 <.LVL295>:
    60b4:	00078663          	beqz	a5,60c0 <.L163>
    60b8:	41880833          	sub	a6,a6,s8
    60bc:	00183893          	seqz	a7,a6

000060c0 <.L163>:
    60c0:	40db07b3          	sub	a5,s6,a3

000060c4 <.LVL297>:
    60c4:	00a8e6b3          	or	a3,a7,a0

000060c8 <.LVL298>:
    60c8:	40d787b3          	sub	a5,a5,a3

000060cc <.LBE73>:
    60cc:	00090a93          	mv	s5,s2

000060d0 <.LVL299>:
    60d0:	d45ff06f          	j	5e14 <.L356>

000060d4 <.L155>:
    60d4:	000087b7          	lui	a5,0x8
    60d8:	fff78793          	add	a5,a5,-1 # 7fff <.LLST132+0x8>
    60dc:	76f31263          	bne	t1,a5,6840 <.L164>

000060e0 <.L165>:
    60e0:	02812823          	sw	s0,48(sp)
    60e4:	03312a23          	sw	s3,52(sp)
    60e8:	03812c23          	sw	s8,56(sp)
    60ec:	03612e23          	sw	s6,60(sp)
    60f0:	00090a93          	mv	s5,s2

000060f4 <.LVL302>:
    60f4:	911ff06f          	j	5a04 <.L359>

000060f8 <.L153>:
    60f8:	000087b7          	lui	a5,0x8
    60fc:	fff78793          	add	a5,a5,-1 # 7fff <.LLST132+0x8>
    6100:	fefb80e3          	beq	s7,a5,60e0 <.L165>
    6104:	01c12783          	lw	a5,28(sp)
    6108:	00080737          	lui	a4,0x80
    610c:	00e7e7b3          	or	a5,a5,a4
    6110:	00f12e23          	sw	a5,28(sp)

00006114 <.LDL4>:
    6114:	07400793          	li	a5,116
    6118:	1867c863          	blt	a5,t1,62a8 <.L166>

0000611c <.L270>:
    611c:	02000793          	li	a5,32
    6120:	02f347b3          	div	a5,t1,a5

00006124 <.LVL304>:
    6124:	00060693          	mv	a3,a2
    6128:	00000493          	li	s1,0

0000612c <.LVL305>:
    612c:	00000713          	li	a4,0

00006130 <.L167>:
    6130:	02f74e63          	blt	a4,a5,616c <.L168>
    6134:	00300713          	li	a4,3

00006138 <.LVL307>:
    6138:	01f37893          	and	a7,t1,31
    613c:	40f70e33          	sub	t3,a4,a5
    6140:	00279593          	sll	a1,a5,0x2
    6144:	02089e63          	bnez	a7,6180 <.L169>

00006148 <.L170>:
    6148:	00b60733          	add	a4,a2,a1
    614c:	00072703          	lw	a4,0(a4) # 80000 <_ebss+0x72460>
    6150:	00188893          	add	a7,a7,1

00006154 <.LVL309>:
    6154:	00460613          	add	a2,a2,4
    6158:	fee62e23          	sw	a4,-4(a2)

0000615c <.LVL310>:
    615c:	ff1e56e3          	bge	t3,a7,6148 <.L170>
    6160:	00400713          	li	a4,4
    6164:	40f707b3          	sub	a5,a4,a5

00006168 <.LVL311>:
    6168:	0780006f          	j	61e0 <.L175>

0000616c <.L168>:
    616c:	0006a583          	lw	a1,0(a3)
    6170:	00170713          	add	a4,a4,1

00006174 <.LVL313>:
    6174:	00468693          	add	a3,a3,4
    6178:	00b4e4b3          	or	s1,s1,a1

0000617c <.LVL314>:
    617c:	fb5ff06f          	j	6130 <.L167>

00006180 <.L169>:
    6180:	02000613          	li	a2,32
    6184:	02c36733          	rem	a4,t1,a2
    6188:	00078693          	mv	a3,a5
    618c:	40e60633          	sub	a2,a2,a4
    6190:	0007d463          	bgez	a5,6198 <.L172>

00006194 <.LVL316>:
    6194:	00000693          	li	a3,0

00006198 <.L172>:
    6198:	00269693          	sll	a3,a3,0x2
    619c:	04068713          	add	a4,a3,64
    61a0:	002706b3          	add	a3,a4,sp
    61a4:	fd06a703          	lw	a4,-48(a3)
    61a8:	00b506b3          	add	a3,a0,a1
    61ac:	40b005b3          	neg	a1,a1
    61b0:	00c71733          	sll	a4,a4,a2
    61b4:	00e4e4b3          	or	s1,s1,a4

000061b8 <.LVL318>:
    61b8:	00000713          	li	a4,0

000061bc <.L173>:
    61bc:	0dc74263          	blt	a4,t3,6280 <.L174>
    61c0:	01c12683          	lw	a3,28(sp)
    61c4:	00400713          	li	a4,4

000061c8 <.LVL320>:
    61c8:	40f707b3          	sub	a5,a4,a5

000061cc <.LVL321>:
    61cc:	002e1713          	sll	a4,t3,0x2
    61d0:	04070713          	add	a4,a4,64
    61d4:	00270733          	add	a4,a4,sp
    61d8:	0116d6b3          	srl	a3,a3,a7
    61dc:	fcd72823          	sw	a3,-48(a4)

000061e0 <.L175>:
    61e0:	0057a713          	slti	a4,a5,5
    61e4:	00000613          	li	a2,0
    61e8:	00070863          	beqz	a4,61f8 <.L177>
    61ec:	00400613          	li	a2,4
    61f0:	40f60633          	sub	a2,a2,a5
    61f4:	00261613          	sll	a2,a2,0x2

000061f8 <.L177>:
    61f8:	00279793          	sll	a5,a5,0x2
    61fc:	00f50533          	add	a0,a0,a5
    6200:	00000593          	li	a1,0
    6204:	b5cfb0ef          	jal	1560 <__GI_memset>

00006208 <.LBE75>:
    6208:	01012783          	lw	a5,16(sp)

0000620c <.LBB76>:
    620c:	00903733          	snez	a4,s1

00006210 <.LBE76>:
    6210:	00f76733          	or	a4,a4,a5

00006214 <.L178>:
    6214:	01412683          	lw	a3,20(sp)

00006218 <.LBB79>:
    6218:	00e12823          	sw	a4,16(sp)

0000621c <.LBB80>:
    621c:	40e40733          	sub	a4,s0,a4

00006220 <.LVL326>:
    6220:	40d98633          	sub	a2,s3,a3

00006224 <.LVL327>:
    6224:	00e437b3          	sltu	a5,s0,a4
    6228:	00c9b5b3          	sltu	a1,s3,a2

0000622c <.LVL328>:
    622c:	40f60633          	sub	a2,a2,a5

00006230 <.LVL329>:
    6230:	00000793          	li	a5,0
    6234:	00e47663          	bgeu	s0,a4,6240 <.L183>
    6238:	413686b3          	sub	a3,a3,s3
    623c:	0016b793          	seqz	a5,a3

00006240 <.L183>:
    6240:	01812503          	lw	a0,24(sp)
    6244:	00b7e7b3          	or	a5,a5,a1

00006248 <.LVL330>:
    6248:	00000693          	li	a3,0
    624c:	40ac05b3          	sub	a1,s8,a0

00006250 <.LVL331>:
    6250:	00bc3833          	sltu	a6,s8,a1

00006254 <.LVL332>:
    6254:	40f585b3          	sub	a1,a1,a5

00006258 <.LVL333>:
    6258:	00078663          	beqz	a5,6264 <.L186>
    625c:	41850533          	sub	a0,a0,s8
    6260:	00153693          	seqz	a3,a0

00006264 <.L186>:
    6264:	01c12783          	lw	a5,28(sp)

00006268 <.LVL335>:
    6268:	0106e6b3          	or	a3,a3,a6

0000626c <.LBE80>:
    626c:	000b8493          	mv	s1,s7

00006270 <.LBB81>:
    6270:	40fb07b3          	sub	a5,s6,a5
    6274:	40d787b3          	sub	a5,a5,a3

00006278 <.LBE81>:
    6278:	00090a93          	mv	s5,s2

0000627c <.LVL337>:
    627c:	d59ff06f          	j	5fd4 <.L130>

00006280 <.L174>:
    6280:	0006a803          	lw	a6,0(a3)
    6284:	0046a303          	lw	t1,4(a3)
    6288:	00b68eb3          	add	t4,a3,a1
    628c:	01185833          	srl	a6,a6,a7
    6290:	00c31333          	sll	t1,t1,a2
    6294:	00686833          	or	a6,a6,t1
    6298:	010ea023          	sw	a6,0(t4)

0000629c <.LVL339>:
    629c:	00170713          	add	a4,a4,1

000062a0 <.LVL340>:
    62a0:	00468693          	add	a3,a3,4
    62a4:	f19ff06f          	j	61bc <.L173>

000062a8 <.L166>:
    62a8:	00012e23          	sw	zero,28(sp)
    62ac:	00012c23          	sw	zero,24(sp)
    62b0:	00012a23          	sw	zero,20(sp)
    62b4:	00100713          	li	a4,1
    62b8:	f5dff06f          	j	6214 <.L178>

000062bc <.L152>:
    62bc:	00148713          	add	a4,s1,1
    62c0:	01171513          	sll	a0,a4,0x11
    62c4:	01255513          	srl	a0,a0,0x12

000062c8 <.LBB142>:
    62c8:	01412683          	lw	a3,20(sp)
    62cc:	01812603          	lw	a2,24(sp)
    62d0:	01c12583          	lw	a1,28(sp)

000062d4 <.LBB143>:
    62d4:	00008337          	lui	t1,0x8
    62d8:	1e051063          	bnez	a0,64b8 <.L187>
    62dc:	0189e533          	or	a0,s3,s8
    62e0:	00c6e833          	or	a6,a3,a2
    62e4:	01656533          	or	a0,a0,s6
    62e8:	00b86833          	or	a6,a6,a1
    62ec:	00856533          	or	a0,a0,s0
    62f0:	00f86833          	or	a6,a6,a5
    62f4:	10049863          	bnez	s1,6404 <.L188>

000062f8 <.LVL343>:
    62f8:	02081263          	bnez	a6,631c <.L189>
    62fc:	02812823          	sw	s0,48(sp)
    6300:	03312a23          	sw	s3,52(sp)
    6304:	03812c23          	sw	s8,56(sp)
    6308:	03612e23          	sw	s6,60(sp)
    630c:	00090a93          	mv	s5,s2

00006310 <.LVL344>:
    6310:	ac051463          	bnez	a0,55d8 <.L10>

00006314 <.L209>:
    6314:	00000493          	li	s1,0

00006318 <.LVL346>:
    6318:	9d9ff06f          	j	5cf0 <.L358>

0000631c <.L189>:
    631c:	00051c63          	bnez	a0,6334 <.L190>
    6320:	02f12823          	sw	a5,48(sp)
    6324:	02d12a23          	sw	a3,52(sp)
    6328:	02c12c23          	sw	a2,56(sp)
    632c:	02b12e23          	sw	a1,60(sp)

00006330 <.LBB146>:
  FP_PACK_SEMIRAW_Q (r, R);
    6330:	8d5ff06f          	j	5c04 <.L357>

00006334 <.L190>:
  FP_SUB_Q (R, A, B);
    6334:	40878533          	sub	a0,a5,s0

00006338 <.LVL350>:
    6338:	41368e33          	sub	t3,a3,s3

0000633c <.LVL351>:
    633c:	00a7b833          	sltu	a6,a5,a0
    6340:	01c6b8b3          	sltu	a7,a3,t3

00006344 <.LVL352>:
    6344:	410e0833          	sub	a6,t3,a6

00006348 <.LVL353>:
    6348:	00000713          	li	a4,0
    634c:	00a7f463          	bgeu	a5,a0,6354 <.L196>
    6350:	001e3713          	seqz	a4,t3

00006354 <.L196>:
    6354:	01176733          	or	a4,a4,a7

00006358 <.LVL354>:
    6358:	418608b3          	sub	a7,a2,s8

0000635c <.LVL355>:
    635c:	01163f33          	sltu	t5,a2,a7

00006360 <.LVL356>:
    6360:	40e88eb3          	sub	t4,a7,a4

00006364 <.LVL357>:
    6364:	00000313          	li	t1,0
    6368:	00070463          	beqz	a4,6370 <.L199>
    636c:	0018b313          	seqz	t1,a7

00006370 <.L199>:
    6370:	01e36333          	or	t1,t1,t5

00006374 <.LVL359>:
    6374:	41658733          	sub	a4,a1,s6

00006378 <.LVL360>:
    6378:	40670733          	sub	a4,a4,t1
    637c:	02e12e23          	sw	a4,60(sp)
    6380:	03d12c23          	sw	t4,56(sp)
    6384:	03012a23          	sw	a6,52(sp)
    6388:	02a12823          	sw	a0,48(sp)

0000638c <.LBE83>:
    638c:	00c71313          	sll	t1,a4,0xc

00006390 <.LVL362>:
    6390:	06035063          	bgez	t1,63f0 <.L200>

00006394 <.LBB84>:
    6394:	40f407b3          	sub	a5,s0,a5

00006398 <.LVL363>:
    6398:	40d986b3          	sub	a3,s3,a3

0000639c <.LVL364>:
    639c:	00f43733          	sltu	a4,s0,a5
    63a0:	00d9b9b3          	sltu	s3,s3,a3

000063a4 <.LVL365>:
    63a4:	40e686b3          	sub	a3,a3,a4

000063a8 <.LVL366>:
    63a8:	00000713          	li	a4,0
    63ac:	00f47463          	bgeu	s0,a5,63b4 <.L205>
    63b0:	001e3713          	seqz	a4,t3

000063b4 <.L205>:
    63b4:	40cc0633          	sub	a2,s8,a2
    63b8:	013769b3          	or	s3,a4,s3

000063bc <.LVL367>:
    63bc:	00cc3c33          	sltu	s8,s8,a2

000063c0 <.LVL368>:
    63c0:	00000513          	li	a0,0

000063c4 <.LVL369>:
    63c4:	41360633          	sub	a2,a2,s3

000063c8 <.LVL370>:
    63c8:	00098463          	beqz	s3,63d0 <.L208>
    63cc:	0018b513          	seqz	a0,a7

000063d0 <.L208>:
    63d0:	40bb05b3          	sub	a1,s6,a1
    63d4:	01856533          	or	a0,a0,s8

000063d8 <.LVL372>:
    63d8:	40a585b3          	sub	a1,a1,a0
    63dc:	02b12e23          	sw	a1,60(sp)
    63e0:	02c12c23          	sw	a2,56(sp)
    63e4:	02d12a23          	sw	a3,52(sp)
    63e8:	02f12823          	sw	a5,48(sp)

000063ec <.LVL373>:
    63ec:	c85ff06f          	j	6070 <.L361>

000063f0 <.L200>:
    63f0:	01056533          	or	a0,a0,a6

000063f4 <.LVL375>:
    63f4:	01d56533          	or	a0,a0,t4
    63f8:	00e56533          	or	a0,a0,a4
    63fc:	f0050ce3          	beqz	a0,6314 <.L209>
    6400:	805ff06f          	j	5c04 <.L357>

00006404 <.L188>:
    6404:	03010893          	add	a7,sp,48
    6408:	03c10713          	add	a4,sp,60
    640c:	04081e63          	bnez	a6,6468 <.L210>
    6410:	02051e63          	bnez	a0,644c <.L211>

00006414 <.LVL377>:
    6414:	02612e23          	sw	t1,60(sp)
    6418:	02012c23          	sw	zero,56(sp)
    641c:	02012a23          	sw	zero,52(sp)
    6420:	02012823          	sw	zero,48(sp)

00006424 <.LBB85>:
    6424:	00070793          	mv	a5,a4

00006428 <.L212>:
    6428:	0007a703          	lw	a4,0(a5)
    642c:	ffc7a683          	lw	a3,-4(a5)
    6430:	ffc78793          	add	a5,a5,-4
    6434:	00371713          	sll	a4,a4,0x3
    6438:	01d6d693          	srl	a3,a3,0x1d
    643c:	00d76733          	or	a4,a4,a3
    6440:	00e7a223          	sw	a4,4(a5)
    6444:	fef892e3          	bne	a7,a5,6428 <.L212>
    6448:	8a1ff06f          	j	5ce8 <.L213>

0000644c <.L211>:
    644c:	02812823          	sw	s0,48(sp)
    6450:	03312a23          	sw	s3,52(sp)
    6454:	03812c23          	sw	s8,56(sp)
    6458:	03612e23          	sw	s6,60(sp)

0000645c <.LBB148>:
    645c:	00090a93          	mv	s5,s2

00006460 <.L362>:
    6460:	fff30493          	add	s1,t1,-1 # 7fff <.LLST132+0x8>

00006464 <.LVL382>:
    6464:	974ff06f          	j	55d8 <.L10>

00006468 <.L210>:
    6468:	00051c63          	bnez	a0,6480 <.L214>

0000646c <.LVL384>:
    646c:	02f12823          	sw	a5,48(sp)
    6470:	02d12a23          	sw	a3,52(sp)
    6474:	02c12c23          	sw	a2,56(sp)
    6478:	02b12e23          	sw	a1,60(sp)
    647c:	fe5ff06f          	j	6460 <.L362>

00006480 <.L214>:
    6480:	02612e23          	sw	t1,60(sp)
    6484:	02012c23          	sw	zero,56(sp)
    6488:	02012a23          	sw	zero,52(sp)
    648c:	02012823          	sw	zero,48(sp)

00006490 <.LBB86>:
    6490:	00070793          	mv	a5,a4

00006494 <.L215>:
    6494:	0007a703          	lw	a4,0(a5)
    6498:	ffc7a683          	lw	a3,-4(a5)
    649c:	ffc78793          	add	a5,a5,-4
    64a0:	00371713          	sll	a4,a4,0x3
    64a4:	01d6d693          	srl	a3,a3,0x1d
    64a8:	00d76733          	or	a4,a4,a3
    64ac:	00e7a223          	sw	a4,4(a5)
    64b0:	fef892e3          	bne	a7,a5,6494 <.L215>
    64b4:	835ff06f          	j	5ce8 <.L213>

000064b8 <.L187>:
    64b8:	40878533          	sub	a0,a5,s0

000064bc <.LVL389>:
    64bc:	41368eb3          	sub	t4,a3,s3

000064c0 <.LVL390>:
    64c0:	00a7b833          	sltu	a6,a5,a0
    64c4:	01d6b333          	sltu	t1,a3,t4

000064c8 <.LVL391>:
    64c8:	410e8833          	sub	a6,t4,a6

000064cc <.LVL392>:
    64cc:	00000713          	li	a4,0
    64d0:	00a7f463          	bgeu	a5,a0,64d8 <.L220>
    64d4:	001eb713          	seqz	a4,t4

000064d8 <.L220>:
    64d8:	00676733          	or	a4,a4,t1

000064dc <.LVL393>:
    64dc:	41860333          	sub	t1,a2,s8

000064e0 <.LVL394>:
    64e0:	00663fb3          	sltu	t6,a2,t1

000064e4 <.LVL395>:
    64e4:	40e30f33          	sub	t5,t1,a4

000064e8 <.LVL396>:
    64e8:	00000e13          	li	t3,0
    64ec:	00070463          	beqz	a4,64f4 <.L223>
    64f0:	00133e13          	seqz	t3,t1

000064f4 <.L223>:
    64f4:	01fe6e33          	or	t3,t3,t6

000064f8 <.LVL398>:
    64f8:	41658733          	sub	a4,a1,s6

000064fc <.LVL399>:
    64fc:	41c70733          	sub	a4,a4,t3
    6500:	02e12e23          	sw	a4,60(sp)
    6504:	03e12c23          	sw	t5,56(sp)
    6508:	03012a23          	sw	a6,52(sp)
    650c:	02a12823          	sw	a0,48(sp)

00006510 <.LBE87>:
    6510:	00c71e13          	sll	t3,a4,0xc

00006514 <.LVL401>:
    6514:	140e5663          	bgez	t3,6660 <.L224>

00006518 <.LBB88>:
    6518:	40f407b3          	sub	a5,s0,a5

0000651c <.LVL402>:
    651c:	40d986b3          	sub	a3,s3,a3

00006520 <.LVL403>:
    6520:	00f43733          	sltu	a4,s0,a5
    6524:	00d9b9b3          	sltu	s3,s3,a3

00006528 <.LVL404>:
    6528:	40e686b3          	sub	a3,a3,a4

0000652c <.LVL405>:
    652c:	00000713          	li	a4,0
    6530:	00f47463          	bgeu	s0,a5,6538 <.L229>
    6534:	001eb713          	seqz	a4,t4

00006538 <.L229>:
    6538:	40cc0633          	sub	a2,s8,a2
    653c:	013769b3          	or	s3,a4,s3

00006540 <.LVL406>:
    6540:	00cc3c33          	sltu	s8,s8,a2

00006544 <.LVL407>:
    6544:	41360633          	sub	a2,a2,s3

00006548 <.LVL408>:
    6548:	00098463          	beqz	s3,6550 <.L232>
    654c:	00133893          	seqz	a7,t1

00006550 <.L232>:
    6550:	40bb05b3          	sub	a1,s6,a1
    6554:	0188e733          	or	a4,a7,s8

00006558 <.LVL410>:
    6558:	40e58733          	sub	a4,a1,a4

0000655c <.LVL411>:
    655c:	02e12e23          	sw	a4,60(sp)
    6560:	02c12c23          	sw	a2,56(sp)
    6564:	02d12a23          	sw	a3,52(sp)
    6568:	02f12823          	sw	a5,48(sp)

0000656c <.LBE88>:
    656c:	00090a93          	mv	s5,s2

00006570 <.L233>:
    6570:	03c12503          	lw	a0,60(sp)
    6574:	10050063          	beqz	a0,6674 <.L234>
    6578:	255000ef          	jal	6fcc <__clzsi2>

0000657c <.L235>:
    657c:	ff450513          	add	a0,a0,-12

00006580 <.LBB56>:
    6580:	02000713          	li	a4,32
    6584:	01f57813          	and	a6,a0,31
    6588:	02e547b3          	div	a5,a0,a4

0000658c <.LVL416>:
    658c:	12080063          	beqz	a6,66ac <.L238>
    6590:	03010313          	add	t1,sp,48
    6594:	02e566b3          	rem	a3,a0,a4

00006598 <.LVL417>:
    6598:	40d70633          	sub	a2,a4,a3
    659c:	ffc00693          	li	a3,-4

000065a0 <.LVL418>:
    65a0:	02d786b3          	mul	a3,a5,a3
    65a4:	00c68713          	add	a4,a3,12
    65a8:	00e30733          	add	a4,t1,a4
    65ac:	40d006b3          	neg	a3,a3

000065b0 <.L239>:
    65b0:	12e31663          	bne	t1,a4,66dc <.L242>
    65b4:	03012683          	lw	a3,48(sp)
    65b8:	fff78713          	add	a4,a5,-1

000065bc <.LVL419>:
    65bc:	00279793          	sll	a5,a5,0x2

000065c0 <.LVL420>:
    65c0:	04078793          	add	a5,a5,64
    65c4:	002787b3          	add	a5,a5,sp
    65c8:	010696b3          	sll	a3,a3,a6
    65cc:	fed7a823          	sw	a3,-16(a5)

000065d0 <.L243>:
    65d0:	00170713          	add	a4,a4,1
    65d4:	03010793          	add	a5,sp,48
    65d8:	00271713          	sll	a4,a4,0x2
    65dc:	00800693          	li	a3,8
    65e0:	00078893          	mv	a7,a5
    65e4:	00d76a63          	bltu	a4,a3,65f8 <.L244>
    65e8:	02012823          	sw	zero,48(sp)
    65ec:	0007a223          	sw	zero,4(a5)
    65f0:	ff870713          	add	a4,a4,-8
    65f4:	03810793          	add	a5,sp,56

000065f8 <.L244>:
    65f8:	00400693          	li	a3,4
    65fc:	00d76463          	bltu	a4,a3,6604 <.L245>
    6600:	0007a023          	sw	zero,0(a5)

00006604 <.L245>:
    6604:	1c954863          	blt	a0,s1,67d4 <.L246>
    6608:	40950533          	sub	a0,a0,s1

0000660c <.LVL422>:
    660c:	00150513          	add	a0,a0,1

00006610 <.LBB52>:
    6610:	40555713          	sra	a4,a0,0x5

00006614 <.LVL424>:
    6614:	01f57793          	and	a5,a0,31

00006618 <.LVL425>:
    6618:	00088593          	mv	a1,a7
    661c:	00088613          	mv	a2,a7
    6620:	00000313          	li	t1,0
    6624:	00000693          	li	a3,0

00006628 <.L247>:
    6628:	0ce69c63          	bne	a3,a4,6700 <.L248>
    662c:	00300693          	li	a3,3

00006630 <.LVL427>:
    6630:	40e686b3          	sub	a3,a3,a4
    6634:	00271613          	sll	a2,a4,0x2
    6638:	0c079e63          	bnez	a5,6714 <.L249>

0000663c <.L250>:
    663c:	00c58533          	add	a0,a1,a2
    6640:	00052503          	lw	a0,0(a0)
    6644:	00178793          	add	a5,a5,1

00006648 <.LVL429>:
    6648:	00458593          	add	a1,a1,4
    664c:	fea5ae23          	sw	a0,-4(a1)

00006650 <.LVL430>:
    6650:	fef6d6e3          	bge	a3,a5,663c <.L250>
    6654:	00400793          	li	a5,4

00006658 <.LVL431>:
    6658:	40e78733          	sub	a4,a5,a4

0000665c <.LVL432>:
    665c:	1040006f          	j	6760 <.L254>

00006660 <.L224>:
    6660:	01056533          	or	a0,a0,a6

00006664 <.LVL434>:
    6664:	01e56533          	or	a0,a0,t5
    6668:	00e56533          	or	a0,a0,a4
    666c:	ca0504e3          	beqz	a0,6314 <.L209>
    6670:	f01ff06f          	j	6570 <.L233>

00006674 <.L234>:
    6674:	03812503          	lw	a0,56(sp)
    6678:	00050863          	beqz	a0,6688 <.L236>
    667c:	151000ef          	jal	6fcc <__clzsi2>

00006680 <.LVL436>:
    6680:	02050513          	add	a0,a0,32
    6684:	ef9ff06f          	j	657c <.L235>

00006688 <.L236>:
    6688:	03412503          	lw	a0,52(sp)
    668c:	00050863          	beqz	a0,669c <.L237>
    6690:	13d000ef          	jal	6fcc <__clzsi2>

00006694 <.LVL439>:
    6694:	04050513          	add	a0,a0,64
    6698:	ee5ff06f          	j	657c <.L235>

0000669c <.L237>:
    669c:	03012503          	lw	a0,48(sp)
    66a0:	12d000ef          	jal	6fcc <__clzsi2>

000066a4 <.LVL442>:
    66a4:	06050513          	add	a0,a0,96
    66a8:	ed5ff06f          	j	657c <.L235>

000066ac <.L238>:
    66ac:	ffc00613          	li	a2,-4
    66b0:	02c78633          	mul	a2,a5,a2
    66b4:	03c10713          	add	a4,sp,60

000066b8 <.LBB58>:
    66b8:	00300693          	li	a3,3

000066bc <.L240>:
    66bc:	00c705b3          	add	a1,a4,a2
    66c0:	0005a583          	lw	a1,0(a1)
    66c4:	fff68693          	add	a3,a3,-1

000066c8 <.LVL446>:
    66c8:	ffc70713          	add	a4,a4,-4
    66cc:	00b72223          	sw	a1,4(a4)

000066d0 <.LVL447>:
    66d0:	fef6d6e3          	bge	a3,a5,66bc <.L240>
    66d4:	fff78713          	add	a4,a5,-1
    66d8:	ef9ff06f          	j	65d0 <.L243>

000066dc <.L242>:
    66dc:	00072583          	lw	a1,0(a4)
    66e0:	ffc72883          	lw	a7,-4(a4)
    66e4:	00d70e33          	add	t3,a4,a3
    66e8:	010595b3          	sll	a1,a1,a6
    66ec:	00c8d8b3          	srl	a7,a7,a2
    66f0:	0115e5b3          	or	a1,a1,a7
    66f4:	00be2023          	sw	a1,0(t3)
    66f8:	ffc70713          	add	a4,a4,-4
    66fc:	eb5ff06f          	j	65b0 <.L239>

00006700 <.L248>:
    6700:	00062503          	lw	a0,0(a2)
    6704:	00168693          	add	a3,a3,1

00006708 <.LVL450>:
    6708:	00460613          	add	a2,a2,4
    670c:	00a36333          	or	t1,t1,a0

00006710 <.LVL451>:
    6710:	f19ff06f          	j	6628 <.L247>

00006714 <.L249>:
    6714:	04060593          	add	a1,a2,64
    6718:	002585b3          	add	a1,a1,sp
    671c:	ff05a583          	lw	a1,-16(a1)
    6720:	02000813          	li	a6,32
    6724:	40f80833          	sub	a6,a6,a5
    6728:	010595b3          	sll	a1,a1,a6
    672c:	00b36333          	or	t1,t1,a1

00006730 <.LVL453>:
    6730:	00000e13          	li	t3,0
    6734:	00c885b3          	add	a1,a7,a2
    6738:	40c00633          	neg	a2,a2

0000673c <.L252>:
    673c:	06de4863          	blt	t3,a3,67ac <.L253>
    6740:	00400613          	li	a2,4
    6744:	40e60733          	sub	a4,a2,a4

00006748 <.LVL455>:
    6748:	03c12603          	lw	a2,60(sp)
    674c:	00269693          	sll	a3,a3,0x2

00006750 <.LVL456>:
    6750:	04068693          	add	a3,a3,64
    6754:	002686b3          	add	a3,a3,sp
    6758:	00f657b3          	srl	a5,a2,a5

0000675c <.LVL457>:
    675c:	fef6a823          	sw	a5,-16(a3)

00006760 <.L254>:
    6760:	00400693          	li	a3,4
    6764:	40e686b3          	sub	a3,a3,a4
    6768:	00271713          	sll	a4,a4,0x2
    676c:	00e887b3          	add	a5,a7,a4
    6770:	00269713          	sll	a4,a3,0x2
    6774:	00800693          	li	a3,8
    6778:	00d76a63          	bltu	a4,a3,678c <.L255>
    677c:	0007a023          	sw	zero,0(a5)
    6780:	0007a223          	sw	zero,4(a5)
    6784:	ff870713          	add	a4,a4,-8
    6788:	00878793          	add	a5,a5,8

0000678c <.L255>:
    678c:	00400693          	li	a3,4
    6790:	00d76463          	bltu	a4,a3,6798 <.L256>
    6794:	0007a023          	sw	zero,0(a5)

00006798 <.L256>:
    6798:	03012703          	lw	a4,48(sp)

0000679c <.LBB54>:
    679c:	006037b3          	snez	a5,t1

000067a0 <.LBE54>:
    67a0:	00f767b3          	or	a5,a4,a5
    67a4:	02f12823          	sw	a5,48(sp)
    67a8:	c5cff06f          	j	5c04 <.L357>

000067ac <.L253>:
    67ac:	0005a503          	lw	a0,0(a1)
    67b0:	0045ae83          	lw	t4,4(a1)
    67b4:	00c58f33          	add	t5,a1,a2
    67b8:	00f55533          	srl	a0,a0,a5
    67bc:	010e9eb3          	sll	t4,t4,a6
    67c0:	01d56533          	or	a0,a0,t4
    67c4:	00af2023          	sw	a0,0(t5)

000067c8 <.LVL461>:
    67c8:	001e0e13          	add	t3,t3,1

000067cc <.LVL462>:
    67cc:	00458593          	add	a1,a1,4
    67d0:	f6dff06f          	j	673c <.L252>

000067d4 <.L246>:
    67d4:	03c12783          	lw	a5,60(sp)
    67d8:	fff80737          	lui	a4,0xfff80
    67dc:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff7245f>
    67e0:	00e7f7b3          	and	a5,a5,a4
    67e4:	40a484b3          	sub	s1,s1,a0
    67e8:	02f12e23          	sw	a5,60(sp)

000067ec <.LBB153>:
  FP_PACK_SEMIRAW_Q (r, R);
    67ec:	dedfe06f          	j	55d8 <.L10>

000067f0 <.L263>:
    67f0:	02012e23          	sw	zero,60(sp)
    67f4:	02012c23          	sw	zero,56(sp)
    67f8:	02012a23          	sw	zero,52(sp)
    67fc:	02012823          	sw	zero,48(sp)
    6800:	e59fe06f          	j	5658 <.L262>

00006804 <.L343>:
  FP_SUB_Q (R, A, B);
    6804:	07400713          	li	a4,116
    6808:	00c74463          	blt	a4,a2,6810 <.L26>
    680c:	f4dfe06f          	j	5758 <.L267>

00006810 <.L26>:
    6810:	02012623          	sw	zero,44(sp)
    6814:	02012423          	sw	zero,40(sp)
    6818:	02012223          	sw	zero,36(sp)
    681c:	00100713          	li	a4,1
    6820:	828ff06f          	j	5848 <.L37>

00006824 <.L62>:
    6824:	07400793          	li	a5,116
    6828:	a0b7dc63          	bge	a5,a1,5a40 <.L268>

0000682c <.L64>:
    682c:	00012e23          	sw	zero,28(sp)
    6830:	00012c23          	sw	zero,24(sp)
    6834:	00012a23          	sw	zero,20(sp)
    6838:	00100793          	li	a5,1
    683c:	afcff06f          	j	5b38 <.L76>

00006840 <.L164>:
    6840:	07400793          	li	a5,116
    6844:	a717c2e3          	blt	a5,a7,62a8 <.L166>
    6848:	00088313          	mv	t1,a7
    684c:	8d1ff06f          	j	611c <.L270>

00006850 <__fixunstfsi>:
#include "soft-fp.h"
#include "quad.h"

USItype
__fixunstfsi (TFtype a)
{
    6850:	00052703          	lw	a4,0(a0)
    6854:	00c52783          	lw	a5,12(a0)
    6858:	00852583          	lw	a1,8(a0)
    685c:	00452683          	lw	a3,4(a0)
    6860:	fe010113          	add	sp,sp,-32

00006864 <.LBB3>:
  FP_DECL_EX;
  FP_DECL_Q (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    6864:	00e12023          	sw	a4,0(sp)
    6868:	00e12823          	sw	a4,16(sp)
    686c:	00179613          	sll	a2,a5,0x1

00006870 <.LBE3>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    6870:	00004737          	lui	a4,0x4

00006874 <.LBB4>:
  FP_UNPACK_RAW_Q (A, a);
    6874:	00d12223          	sw	a3,4(sp)
    6878:	00b12423          	sw	a1,8(sp)
    687c:	00f12623          	sw	a5,12(sp)
    6880:	00b12c23          	sw	a1,24(sp)
    6884:	01165613          	srl	a2,a2,0x11

00006888 <.LBE4>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    6888:	ffe70713          	add	a4,a4,-2 # 3ffe <.LVL261+0x2>
    688c:	00000513          	li	a0,0
    6890:	06c75a63          	bge	a4,a2,6904 <.L1>
    6894:	01f7d813          	srl	a6,a5,0x1f
    6898:	00004737          	lui	a4,0x4

0000689c <.LBB5>:
  FP_UNPACK_RAW_Q (A, a);
    689c:	00080693          	mv	a3,a6

000068a0 <.LBE5>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    68a0:	01e70713          	add	a4,a4,30 # 401e <.L143+0x16>
    68a4:	00081663          	bnez	a6,68b0 <.L5>
    68a8:	00004737          	lui	a4,0x4
    68ac:	01f70713          	add	a4,a4,31 # 401f <.L143+0x17>

000068b0 <.L5>:
    68b0:	fff80513          	add	a0,a6,-1
    68b4:	04e65863          	bge	a2,a4,6904 <.L1>
    68b8:	00000513          	li	a0,0
    68bc:	04081463          	bnez	a6,6904 <.L1>

000068c0 <.LBB10>:
  FP_UNPACK_RAW_Q (A, a);
    68c0:	01079793          	sll	a5,a5,0x10

000068c4 <.LBB11>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    68c4:	00010737          	lui	a4,0x10

000068c8 <.LBB12>:
  FP_UNPACK_RAW_Q (A, a);
    68c8:	0107d793          	srl	a5,a5,0x10

000068cc <.LBB13>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    68cc:	00e7e7b3          	or	a5,a5,a4

000068d0 <.LBB7>:
    68d0:	00004737          	lui	a4,0x4
    68d4:	06f70713          	add	a4,a4,111 # 406f <.L35+0x3>
    68d8:	40c70733          	sub	a4,a4,a2
    68dc:	40575613          	sra	a2,a4,0x5

000068e0 <.LBE7>:
    68e0:	00f12e23          	sw	a5,28(sp)

000068e4 <.LBB8>:
    68e4:	01f77713          	and	a4,a4,31

000068e8 <.LVL6>:
    68e8:	02071263          	bnez	a4,690c <.L7>

000068ec <.LVL7>:
    68ec:	00261613          	sll	a2,a2,0x2

000068f0 <.LVL8>:
    68f0:	02060793          	add	a5,a2,32
    68f4:	00278633          	add	a2,a5,sp
    68f8:	ff062783          	lw	a5,-16(a2)
    68fc:	00f12823          	sw	a5,16(sp)

00006900 <.L8>:
    6900:	01012503          	lw	a0,16(sp)

00006904 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    6904:	02010113          	add	sp,sp,32

00006908 <.LVL11>:
    6908:	00008067          	ret

0000690c <.L7>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    690c:	00200513          	li	a0,2
    6910:	02a61063          	bne	a2,a0,6930 <.L9>
    6914:	02000693          	li	a3,32
    6918:	40e686b3          	sub	a3,a3,a4
    691c:	00d796b3          	sll	a3,a5,a3
    6920:	00e5d5b3          	srl	a1,a1,a4
    6924:	00b6e6b3          	or	a3,a3,a1
    6928:	00d12823          	sw	a3,16(sp)

0000692c <.LVL13>:
    692c:	00100693          	li	a3,1

00006930 <.L9>:
    6930:	00269693          	sll	a3,a3,0x2

00006934 <.LVL15>:
    6934:	02068693          	add	a3,a3,32
    6938:	002686b3          	add	a3,a3,sp
    693c:	00e7d7b3          	srl	a5,a5,a4
    6940:	fef6a823          	sw	a5,-16(a3)
    6944:	fbdff06f          	j	6900 <.L8>

00006948 <__floatunsitf>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__floatunsitf (USItype i)
{
    6948:	fd010113          	add	sp,sp,-48
    694c:	02912223          	sw	s1,36(sp)
    6950:	02112623          	sw	ra,44(sp)
    6954:	02812423          	sw	s0,40(sp)
    6958:	00050493          	mv	s1,a0

0000695c <.LBB12>:
  FP_DECL_Q (A);
  TFtype a;

  FP_FROM_INT_Q (A, i, SI_BITS, USItype);
    695c:	10058463          	beqz	a1,6a64 <.L2>

00006960 <.LBB3>:
    6960:	00058513          	mv	a0,a1
    6964:	00058413          	mv	s0,a1

00006968 <.LBB5>:
    6968:	664000ef          	jal	6fcc <__clzsi2>

0000696c <.LVL3>:
    696c:	00004737          	lui	a4,0x4
    6970:	01e70713          	add	a4,a4,30 # 401e <.L143+0x16>

00006974 <.LBB6>:
    6974:	05150793          	add	a5,a0,81

00006978 <.LBB7>:
    6978:	40a70633          	sub	a2,a4,a0

0000697c <.LBE7>:
    697c:	00812823          	sw	s0,16(sp)

00006980 <.LBB8>:
    6980:	4057d713          	sra	a4,a5,0x5

00006984 <.LBE8>:
    6984:	00012a23          	sw	zero,20(sp)
    6988:	00012c23          	sw	zero,24(sp)
    698c:	00012e23          	sw	zero,28(sp)

00006990 <.LBB9>:
    6990:	01f7f793          	and	a5,a5,31

00006994 <.LVL6>:
    6994:	02078c63          	beqz	a5,69cc <.L3>

00006998 <.LVL7>:
    6998:	00200693          	li	a3,2
    699c:	0cd71063          	bne	a4,a3,6a5c <.L8>
    69a0:	02000693          	li	a3,32
    69a4:	40f686b3          	sub	a3,a3,a5

000069a8 <.LVL8>:
    69a8:	00d456b3          	srl	a3,s0,a3

000069ac <.LVL9>:
    69ac:	00d12e23          	sw	a3,28(sp)

000069b0 <.L4>:
    69b0:	fff70693          	add	a3,a4,-1

000069b4 <.LVL11>:
    69b4:	00271713          	sll	a4,a4,0x2
    69b8:	02070713          	add	a4,a4,32
    69bc:	00270733          	add	a4,a4,sp
    69c0:	00f41433          	sll	s0,s0,a5

000069c4 <.LVL12>:
    69c4:	fe872823          	sw	s0,-16(a4)
    69c8:	0340006f          	j	69fc <.L5>

000069cc <.L3>:
    69cc:	00300793          	li	a5,3

000069d0 <.LVL14>:
    69d0:	40e787b3          	sub	a5,a5,a4
    69d4:	00279793          	sll	a5,a5,0x2
    69d8:	02078793          	add	a5,a5,32
    69dc:	002787b3          	add	a5,a5,sp
    69e0:	ff07a783          	lw	a5,-16(a5)
    69e4:	00200693          	li	a3,2
    69e8:	00f12e23          	sw	a5,28(sp)

000069ec <.LVL15>:
    69ec:	00200793          	li	a5,2
    69f0:	00f71663          	bne	a4,a5,69fc <.L5>
    69f4:	00812c23          	sw	s0,24(sp)

000069f8 <.LVL16>:
    69f8:	00100693          	li	a3,1

000069fc <.L5>:
    69fc:	00269693          	sll	a3,a3,0x2
    6a00:	00012823          	sw	zero,16(sp)

00006a04 <.LVL18>:
    6a04:	00012a23          	sw	zero,20(sp)
    6a08:	ffc68693          	add	a3,a3,-4
    6a0c:	00400793          	li	a5,4
    6a10:	00f6e463          	bltu	a3,a5,6a18 <.L7>
    6a14:	00012c23          	sw	zero,24(sp)

00006a18 <.L7>:
  FP_PACK_RAW_Q (a, A);
    6a18:	01c12783          	lw	a5,28(sp)
    6a1c:	00c11723          	sh	a2,14(sp)

00006a20 <.LBE13>:

  return a;
}
    6a20:	02c12083          	lw	ra,44(sp)

00006a24 <.LBB14>:
  FP_PACK_RAW_Q (a, A);
    6a24:	00f11623          	sh	a5,12(sp)

00006a28 <.LBE14>:
  return a;
    6a28:	01012783          	lw	a5,16(sp)
}
    6a2c:	02812403          	lw	s0,40(sp)
    6a30:	00048513          	mv	a0,s1
  return a;
    6a34:	00f4a023          	sw	a5,0(s1)
    6a38:	01412783          	lw	a5,20(sp)
    6a3c:	00f4a223          	sw	a5,4(s1)
    6a40:	01812783          	lw	a5,24(sp)
    6a44:	00f4a423          	sw	a5,8(s1)
    6a48:	00c12783          	lw	a5,12(sp)
    6a4c:	00f4a623          	sw	a5,12(s1)
}
    6a50:	02412483          	lw	s1,36(sp)
    6a54:	03010113          	add	sp,sp,48

00006a58 <.LVL22>:
    6a58:	00008067          	ret

00006a5c <.L8>:
  FP_FROM_INT_Q (A, i, SI_BITS, USItype);
    6a5c:	00300713          	li	a4,3

00006a60 <.LVL24>:
    6a60:	f51ff06f          	j	69b0 <.L4>

00006a64 <.L2>:
    6a64:	00012e23          	sw	zero,28(sp)
    6a68:	00012c23          	sw	zero,24(sp)
    6a6c:	00012a23          	sw	zero,20(sp)
    6a70:	00012823          	sw	zero,16(sp)
    6a74:	00000613          	li	a2,0
    6a78:	fa1ff06f          	j	6a18 <.L7>

00006a7c <__extenddftf2>:
  FP_DECL_D (A);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    6a7c:	01465713          	srl	a4,a2,0x14
    6a80:	00c61793          	sll	a5,a2,0xc
    6a84:	7ff77713          	and	a4,a4,2047

00006a88 <.LBE2>:
{
    6a88:	fd010113          	add	sp,sp,-48

00006a8c <.LBB3>:
  FP_UNPACK_RAW_D (A, a);
    6a8c:	00c7d793          	srl	a5,a5,0xc

00006a90 <.LBE3>:
#if _FP_W_TYPE_SIZE < 64
  FP_EXTEND (Q, D, 4, 2, R, A);
    6a90:	00170693          	add	a3,a4,1
{
    6a94:	02812423          	sw	s0,40(sp)
    6a98:	02912223          	sw	s1,36(sp)
    6a9c:	03212023          	sw	s2,32(sp)
    6aa0:	02112623          	sw	ra,44(sp)
  FP_EXTEND (Q, D, 4, 2, R, A);
    6aa4:	00b12823          	sw	a1,16(sp)
    6aa8:	00f12a23          	sw	a5,20(sp)
    6aac:	00012e23          	sw	zero,28(sp)
    6ab0:	00012c23          	sw	zero,24(sp)
    6ab4:	7fe6f693          	and	a3,a3,2046
{
    6ab8:	00050913          	mv	s2,a0
    6abc:	00058413          	mv	s0,a1

00006ac0 <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    6ac0:	01f65493          	srl	s1,a2,0x1f

00006ac4 <.LBE4>:
  FP_EXTEND (Q, D, 4, 2, R, A);
    6ac4:	08068263          	beqz	a3,6b48 <.L2>
    6ac8:	000046b7          	lui	a3,0x4
    6acc:	c0068693          	add	a3,a3,-1024 # 3c00 <.LBB79+0x4>
    6ad0:	00d70733          	add	a4,a4,a3

00006ad4 <.LBB5>:
    6ad4:	0047d693          	srl	a3,a5,0x4
    6ad8:	00d12e23          	sw	a3,28(sp)

00006adc <.LVL4>:
    6adc:	01c79793          	sll	a5,a5,0x1c

00006ae0 <.LVL5>:
    6ae0:	0045d693          	srl	a3,a1,0x4
    6ae4:	00d7e7b3          	or	a5,a5,a3
    6ae8:	01c59413          	sll	s0,a1,0x1c
    6aec:	00f12c23          	sw	a5,24(sp)

00006af0 <.LVL6>:
    6af0:	00812a23          	sw	s0,20(sp)

00006af4 <.LVL7>:
    6af4:	00012823          	sw	zero,16(sp)

00006af8 <.L3>:
#else
  FP_EXTEND (Q, D, 2, 1, R, A);
#endif
  FP_PACK_RAW_Q (r, R);
    6af8:	01c12783          	lw	a5,28(sp)
    6afc:	00f49493          	sll	s1,s1,0xf

00006b00 <.LVL9>:
    6b00:	00e4e4b3          	or	s1,s1,a4
    6b04:	00f11623          	sh	a5,12(sp)

00006b08 <.LBE6>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    6b08:	01012783          	lw	a5,16(sp)

00006b0c <.LBB7>:
  FP_PACK_RAW_Q (r, R);
    6b0c:	00911723          	sh	s1,14(sp)

00006b10 <.LBE7>:
}
    6b10:	02c12083          	lw	ra,44(sp)
  return r;
    6b14:	00f92023          	sw	a5,0(s2)
    6b18:	01412783          	lw	a5,20(sp)

00006b1c <.LVL11>:
}
    6b1c:	02812403          	lw	s0,40(sp)
    6b20:	02412483          	lw	s1,36(sp)
  return r;
    6b24:	00f92223          	sw	a5,4(s2)
    6b28:	01812783          	lw	a5,24(sp)
}
    6b2c:	00090513          	mv	a0,s2
  return r;
    6b30:	00f92423          	sw	a5,8(s2)
    6b34:	00c12783          	lw	a5,12(sp)
    6b38:	00f92623          	sw	a5,12(s2)
}
    6b3c:	02012903          	lw	s2,32(sp)
    6b40:	03010113          	add	sp,sp,48

00006b44 <.LVL13>:
    6b44:	00008067          	ret

00006b48 <.L2>:
  FP_EXTEND (Q, D, 4, 2, R, A);
    6b48:	00b7e533          	or	a0,a5,a1
    6b4c:	10071063          	bnez	a4,6c4c <.L4>
    6b50:	fa0504e3          	beqz	a0,6af8 <.L3>

00006b54 <.LBB8>:
    6b54:	04078e63          	beqz	a5,6bb0 <.L5>
    6b58:	00078513          	mv	a0,a5
    6b5c:	470000ef          	jal	6fcc <__clzsi2>

00006b60 <.L6>:
    6b60:	03150693          	add	a3,a0,49
    6b64:	4056d793          	sra	a5,a3,0x5

00006b68 <.LVL17>:
    6b68:	01f6f693          	and	a3,a3,31

00006b6c <.LVL18>:
    6b6c:	04068863          	beqz	a3,6bbc <.L7>
    6b70:	ffc00613          	li	a2,-4
    6b74:	02c78633          	mul	a2,a5,a2
    6b78:	02000813          	li	a6,32
    6b7c:	01010313          	add	t1,sp,16
    6b80:	40d80833          	sub	a6,a6,a3

00006b84 <.LVL19>:
    6b84:	00c60713          	add	a4,a2,12
    6b88:	00e30733          	add	a4,t1,a4
    6b8c:	40c00633          	neg	a2,a2

00006b90 <.L8>:
    6b90:	08e31c63          	bne	t1,a4,6c28 <.L11>
    6b94:	fff78713          	add	a4,a5,-1

00006b98 <.LVL20>:
    6b98:	00279793          	sll	a5,a5,0x2

00006b9c <.LVL21>:
    6b9c:	02078793          	add	a5,a5,32
    6ba0:	002787b3          	add	a5,a5,sp
    6ba4:	00d416b3          	sll	a3,s0,a3

00006ba8 <.LVL22>:
    6ba8:	fed7a823          	sw	a3,-16(a5)
    6bac:	03c0006f          	j	6be8 <.L10>

00006bb0 <.L5>:
    6bb0:	41c000ef          	jal	6fcc <__clzsi2>

00006bb4 <.LVL24>:
    6bb4:	02050513          	add	a0,a0,32
    6bb8:	fa9ff06f          	j	6b60 <.L6>

00006bbc <.L7>:
    6bbc:	ffc00613          	li	a2,-4
    6bc0:	02c78633          	mul	a2,a5,a2
    6bc4:	01c10713          	add	a4,sp,28

00006bc8 <.LBB10>:
    6bc8:	00300693          	li	a3,3

00006bcc <.L9>:
    6bcc:	00c705b3          	add	a1,a4,a2
    6bd0:	0005a583          	lw	a1,0(a1)
    6bd4:	fff68693          	add	a3,a3,-1

00006bd8 <.LVL28>:
    6bd8:	ffc70713          	add	a4,a4,-4
    6bdc:	00b72223          	sw	a1,4(a4)

00006be0 <.LVL29>:
    6be0:	fef6d6e3          	bge	a3,a5,6bcc <.L9>
    6be4:	fff78713          	add	a4,a5,-1

00006be8 <.L10>:
    6be8:	00170793          	add	a5,a4,1
    6bec:	00279793          	sll	a5,a5,0x2
    6bf0:	00800693          	li	a3,8
    6bf4:	01010713          	add	a4,sp,16
    6bf8:	00d7ea63          	bltu	a5,a3,6c0c <.L12>
    6bfc:	00012823          	sw	zero,16(sp)
    6c00:	00072223          	sw	zero,4(a4)
    6c04:	ff878793          	add	a5,a5,-8
    6c08:	01810713          	add	a4,sp,24

00006c0c <.L12>:
    6c0c:	00400693          	li	a3,4
    6c10:	00d7e463          	bltu	a5,a3,6c18 <.L13>
    6c14:	00072023          	sw	zero,0(a4)

00006c18 <.L13>:
    6c18:	00004737          	lui	a4,0x4
    6c1c:	c0c70713          	add	a4,a4,-1012 # 3c0c <.LBB79+0x10>
    6c20:	40a70733          	sub	a4,a4,a0

00006c24 <.LVL31>:
    6c24:	ed5ff06f          	j	6af8 <.L3>

00006c28 <.L11>:
    6c28:	00072583          	lw	a1,0(a4)
    6c2c:	ffc72883          	lw	a7,-4(a4)
    6c30:	00c70e33          	add	t3,a4,a2
    6c34:	00d595b3          	sll	a1,a1,a3
    6c38:	0108d8b3          	srl	a7,a7,a6
    6c3c:	0115e5b3          	or	a1,a1,a7
    6c40:	00be2023          	sw	a1,0(t3)
    6c44:	ffc70713          	add	a4,a4,-4
    6c48:	f49ff06f          	j	6b90 <.L8>

00006c4c <.L4>:
    6c4c:	02050863          	beqz	a0,6c7c <.L14>

00006c50 <.LBB12>:
    6c50:	01c79713          	sll	a4,a5,0x1c

00006c54 <.LVL35>:
    6c54:	0045d693          	srl	a3,a1,0x4
    6c58:	00d76733          	or	a4,a4,a3
    6c5c:	00e12c23          	sw	a4,24(sp)

00006c60 <.LVL36>:
    6c60:	0047d793          	srl	a5,a5,0x4

00006c64 <.LBE12>:
    6c64:	00008737          	lui	a4,0x8

00006c68 <.LBB13>:
    6c68:	01c59413          	sll	s0,a1,0x1c

00006c6c <.LBE13>:
    6c6c:	00e7e7b3          	or	a5,a5,a4

00006c70 <.LBB14>:
    6c70:	00812a23          	sw	s0,20(sp)

00006c74 <.LVL39>:
    6c74:	00012823          	sw	zero,16(sp)

00006c78 <.LBE14>:
    6c78:	00f12e23          	sw	a5,28(sp)

00006c7c <.L14>:
    6c7c:	00008737          	lui	a4,0x8
    6c80:	fff70713          	add	a4,a4,-1 # 7fff <.LLST132+0x8>
    6c84:	e75ff06f          	j	6af8 <.L3>

00006c88 <__trunctfdf2>:
#include "double.h"
#include "quad.h"

DFtype
__trunctfdf2 (TFtype a)
{
    6c88:	00c52583          	lw	a1,12(a0)
    6c8c:	00852703          	lw	a4,8(a0)
    6c90:	00452683          	lw	a3,4(a0)
    6c94:	fe010113          	add	sp,sp,-32
    6c98:	00052783          	lw	a5,0(a0)

00006c9c <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_Q (A, a);
    6c9c:	00e12423          	sw	a4,8(sp)
    6ca0:	00e12c23          	sw	a4,24(sp)
    6ca4:	01059713          	sll	a4,a1,0x10
    6ca8:	01075713          	srl	a4,a4,0x10
    6cac:	00d12223          	sw	a3,4(sp)
    6cb0:	00d12a23          	sw	a3,20(sp)
    6cb4:	01010613          	add	a2,sp,16
    6cb8:	00159693          	sll	a3,a1,0x1
    6cbc:	00b12623          	sw	a1,12(sp)
    6cc0:	00e12e23          	sw	a4,28(sp)
    6cc4:	00f12023          	sw	a5,0(sp)
    6cc8:	00f12823          	sw	a5,16(sp)
    6ccc:	0116d693          	srl	a3,a3,0x11

00006cd0 <.LVL1>:
    6cd0:	01f5d593          	srl	a1,a1,0x1f

00006cd4 <.LBB4>:
    6cd4:	01c10713          	add	a4,sp,28
    6cd8:	00060893          	mv	a7,a2

00006cdc <.L2>:
    6cdc:	00072503          	lw	a0,0(a4)
    6ce0:	ffc72803          	lw	a6,-4(a4)
    6ce4:	ffc70713          	add	a4,a4,-4
    6ce8:	00351513          	sll	a0,a0,0x3
    6cec:	01d85813          	srl	a6,a6,0x1d
    6cf0:	01056533          	or	a0,a0,a6
    6cf4:	00a72223          	sw	a0,4(a4)
    6cf8:	fee612e3          	bne	a2,a4,6cdc <.L2>

00006cfc <.LVL4>:
    6cfc:	00379513          	sll	a0,a5,0x3

00006d00 <.LBE4>:
#if _FP_W_TYPE_SIZE < 64
  FP_TRUNC (D, Q, 2, 4, R, A);
    6d00:	00168793          	add	a5,a3,1
    6d04:	01179713          	sll	a4,a5,0x11

00006d08 <.LBB5>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    6d08:	00a12823          	sw	a0,16(sp)

00006d0c <.LBE5>:
  FP_TRUNC (D, Q, 2, 4, R, A);
    6d0c:	01275713          	srl	a4,a4,0x12
    6d10:	1c070263          	beqz	a4,6ed4 <.L3>
    6d14:	ffffc7b7          	lui	a5,0xffffc
    6d18:	40078793          	add	a5,a5,1024 # ffffc400 <_ebss+0xfffee860>
    6d1c:	00f686b3          	add	a3,a3,a5

00006d20 <.LVL6>:
    6d20:	7fe00793          	li	a5,2046
    6d24:	20d7c463          	blt	a5,a3,6f2c <.L23>
    6d28:	06d05463          	blez	a3,6d90 <.L5>

00006d2c <.LBB6>:
    6d2c:	01812603          	lw	a2,24(sp)
    6d30:	01c12783          	lw	a5,28(sp)
    6d34:	01412703          	lw	a4,20(sp)

00006d38 <.LVL8>:
    6d38:	01c65813          	srl	a6,a2,0x1c
    6d3c:	00479793          	sll	a5,a5,0x4
    6d40:	0107e7b3          	or	a5,a5,a6
    6d44:	00f12a23          	sw	a5,20(sp)

00006d48 <.LBB8>:
    6d48:	00471793          	sll	a5,a4,0x4
    6d4c:	00a7e7b3          	or	a5,a5,a0

00006d50 <.LVL10>:
    6d50:	01c75713          	srl	a4,a4,0x1c

00006d54 <.LVL11>:
    6d54:	00461613          	sll	a2,a2,0x4
    6d58:	00f037b3          	snez	a5,a5

00006d5c <.LVL12>:
    6d5c:	00c76733          	or	a4,a4,a2

00006d60 <.LBE8>:
    6d60:	00e7e7b3          	or	a5,a5,a4

00006d64 <.L6>:
    6d64:	01412703          	lw	a4,20(sp)

00006d68 <.L4>:
#else
  FP_TRUNC (D, Q, 1, 2, R, A);
#endif
  FP_PACK_SEMIRAW_D (r, R);
    6d68:	0077f613          	and	a2,a5,7
    6d6c:	1c060663          	beqz	a2,6f38 <.L18>
    6d70:	00f7f613          	and	a2,a5,15
    6d74:	00400513          	li	a0,4
    6d78:	1ca60063          	beq	a2,a0,6f38 <.L18>

00006d7c <.LBB11>:
    6d7c:	00478613          	add	a2,a5,4
    6d80:	00f63533          	sltu	a0,a2,a5
    6d84:	00a70733          	add	a4,a4,a0

00006d88 <.LVL15>:
    6d88:	00060793          	mv	a5,a2

00006d8c <.LVL16>:
    6d8c:	1ac0006f          	j	6f38 <.L18>

00006d90 <.L5>:
  FP_TRUNC (D, Q, 2, 4, R, A);
    6d90:	fcc00793          	li	a5,-52
    6d94:	00f6da63          	bge	a3,a5,6da8 <.L7>
    6d98:	00012a23          	sw	zero,20(sp)
    6d9c:	00100793          	li	a5,1

00006da0 <.L39>:
    6da0:	00000693          	li	a3,0
    6da4:	fc1ff06f          	j	6d64 <.L6>

00006da8 <.L7>:
    6da8:	01c12783          	lw	a5,28(sp)
    6dac:	00080737          	lui	a4,0x80

00006db0 <.LBB15>:
    6db0:	00060813          	mv	a6,a2

00006db4 <.LBE15>:
    6db4:	00f76eb3          	or	t4,a4,a5

00006db8 <.LBB17>:
    6db8:	03d00793          	li	a5,61
    6dbc:	40d787b3          	sub	a5,a5,a3
    6dc0:	4057d693          	sra	a3,a5,0x5

00006dc4 <.LVL20>:
    6dc4:	01f7f713          	and	a4,a5,31

00006dc8 <.LBE17>:
    6dc8:	01d12e23          	sw	t4,28(sp)

00006dcc <.LBB18>:
    6dcc:	00000513          	li	a0,0
    6dd0:	00000793          	li	a5,0

00006dd4 <.L8>:
    6dd4:	00082303          	lw	t1,0(a6)
    6dd8:	00150513          	add	a0,a0,1

00006ddc <.LVL23>:
    6ddc:	00480813          	add	a6,a6,4
    6de0:	0067e7b3          	or	a5,a5,t1

00006de4 <.LVL24>:
    6de4:	fea698e3          	bne	a3,a0,6dd4 <.L8>
    6de8:	00300513          	li	a0,3

00006dec <.LVL25>:
    6dec:	40d50533          	sub	a0,a0,a3
    6df0:	00269813          	sll	a6,a3,0x2
    6df4:	02071463          	bnez	a4,6e1c <.L9>

00006df8 <.L10>:
    6df8:	01088333          	add	t1,a7,a6
    6dfc:	00032303          	lw	t1,0(t1)
    6e00:	00170713          	add	a4,a4,1 # 80001 <_ebss+0x72461>

00006e04 <.LVL27>:
    6e04:	00488893          	add	a7,a7,4
    6e08:	fe68ae23          	sw	t1,-4(a7)

00006e0c <.LVL28>:
    6e0c:	fee556e3          	bge	a0,a4,6df8 <.L10>
    6e10:	00400713          	li	a4,4

00006e14 <.LVL29>:
    6e14:	40d706b3          	sub	a3,a4,a3

00006e18 <.LVL30>:
    6e18:	04c0006f          	j	6e64 <.L14>

00006e1c <.L9>:
    6e1c:	02080893          	add	a7,a6,32
    6e20:	002888b3          	add	a7,a7,sp
    6e24:	ff08a883          	lw	a7,-16(a7)
    6e28:	02000e13          	li	t3,32
    6e2c:	40ee0e33          	sub	t3,t3,a4
    6e30:	01c898b3          	sll	a7,a7,t3
    6e34:	0117e7b3          	or	a5,a5,a7

00006e38 <.LVL32>:
    6e38:	00000f13          	li	t5,0
    6e3c:	010608b3          	add	a7,a2,a6
    6e40:	41000833          	neg	a6,a6

00006e44 <.L12>:
    6e44:	06af4463          	blt	t5,a0,6eac <.L13>
    6e48:	00251513          	sll	a0,a0,0x2
    6e4c:	02050513          	add	a0,a0,32
    6e50:	00400813          	li	a6,4
    6e54:	00250533          	add	a0,a0,sp
    6e58:	00eed733          	srl	a4,t4,a4

00006e5c <.LVL34>:
    6e5c:	40d806b3          	sub	a3,a6,a3

00006e60 <.LVL35>:
    6e60:	fee52823          	sw	a4,-16(a0)

00006e64 <.L14>:
    6e64:	00400513          	li	a0,4
    6e68:	40d50533          	sub	a0,a0,a3
    6e6c:	00269693          	sll	a3,a3,0x2

00006e70 <.LVL37>:
    6e70:	00d60733          	add	a4,a2,a3
    6e74:	00251693          	sll	a3,a0,0x2
    6e78:	00800613          	li	a2,8
    6e7c:	00c6ea63          	bltu	a3,a2,6e90 <.L15>
    6e80:	00072023          	sw	zero,0(a4)
    6e84:	00072223          	sw	zero,4(a4)
    6e88:	ff868693          	add	a3,a3,-8
    6e8c:	00870713          	add	a4,a4,8

00006e90 <.L15>:
    6e90:	00400613          	li	a2,4
    6e94:	00c6e463          	bltu	a3,a2,6e9c <.L16>
    6e98:	00072023          	sw	zero,0(a4)

00006e9c <.L16>:
    6e9c:	01012703          	lw	a4,16(sp)

00006ea0 <.LBB19>:
    6ea0:	00f037b3          	snez	a5,a5

00006ea4 <.LBE19>:
    6ea4:	00e7e7b3          	or	a5,a5,a4
    6ea8:	ef9ff06f          	j	6da0 <.L39>

00006eac <.L13>:
    6eac:	0008a303          	lw	t1,0(a7)
    6eb0:	0048af83          	lw	t6,4(a7)
    6eb4:	010882b3          	add	t0,a7,a6
    6eb8:	00e35333          	srl	t1,t1,a4
    6ebc:	01cf9fb3          	sll	t6,t6,t3
    6ec0:	01f36333          	or	t1,t1,t6
    6ec4:	0062a023          	sw	t1,0(t0)

00006ec8 <.LVL41>:
    6ec8:	001f0f13          	add	t5,t5,1

00006ecc <.LVL42>:
    6ecc:	00488893          	add	a7,a7,4
    6ed0:	f75ff06f          	j	6e44 <.L12>

00006ed4 <.L3>:
    6ed4:	01412603          	lw	a2,20(sp)
    6ed8:	01812703          	lw	a4,24(sp)
    6edc:	01c12803          	lw	a6,28(sp)

00006ee0 <.LBE23>:
    6ee0:	00c767b3          	or	a5,a4,a2
    6ee4:	0107e7b3          	or	a5,a5,a6
    6ee8:	00a7e7b3          	or	a5,a5,a0
    6eec:	00069863          	bnez	a3,6efc <.L17>

00006ef0 <.LVL44>:
    6ef0:	00f037b3          	snez	a5,a5
    6ef4:	00000713          	li	a4,0
    6ef8:	e71ff06f          	j	6d68 <.L4>

00006efc <.L17>:
    6efc:	0a078e63          	beqz	a5,6fb8 <.L24>

00006f00 <.LBB24>:
    6f00:	00471793          	sll	a5,a4,0x4
    6f04:	01c65613          	srl	a2,a2,0x1c

00006f08 <.LVL47>:
    6f08:	01c75713          	srl	a4,a4,0x1c

00006f0c <.LVL48>:
    6f0c:	00481813          	sll	a6,a6,0x4

00006f10 <.LBE25>:
    6f10:	004006b7          	lui	a3,0x400

00006f14 <.LBB26>:
    6f14:	00f66633          	or	a2,a2,a5

00006f18 <.LVL51>:
    6f18:	01076733          	or	a4,a4,a6

00006f1c <.LBE26>:
    6f1c:	00d76733          	or	a4,a4,a3

00006f20 <.LVL53>:
    6f20:	ff867793          	and	a5,a2,-8

00006f24 <.LVL54>:
    6f24:	7ff00693          	li	a3,2047
    6f28:	e41ff06f          	j	6d68 <.L4>

00006f2c <.L23>:
    6f2c:	00000713          	li	a4,0
    6f30:	00000793          	li	a5,0

00006f34 <.L40>:
    6f34:	7ff00693          	li	a3,2047

00006f38 <.L18>:
  FP_PACK_SEMIRAW_D (r, R);
    6f38:	00871613          	sll	a2,a4,0x8
    6f3c:	00065e63          	bgez	a2,6f58 <.L21>

00006f40 <.LVL58>:
    6f40:	00168693          	add	a3,a3,1 # 400001 <_ebss+0x3f2461>

00006f44 <.LVL59>:
    6f44:	7ff00613          	li	a2,2047
    6f48:	06c68c63          	beq	a3,a2,6fc0 <.L25>
    6f4c:	ff800637          	lui	a2,0xff800
    6f50:	fff60613          	add	a2,a2,-1 # ff7fffff <_ebss+0xff7f245f>
    6f54:	00c77733          	and	a4,a4,a2

00006f58 <.L21>:
    6f58:	01d71613          	sll	a2,a4,0x1d
    6f5c:	0037d793          	srl	a5,a5,0x3

00006f60 <.LVL61>:
    6f60:	00f667b3          	or	a5,a2,a5

00006f64 <.LVL62>:
    6f64:	7ff00613          	li	a2,2047
    6f68:	00375713          	srl	a4,a4,0x3
    6f6c:	00c69e63          	bne	a3,a2,6f88 <.L22>

00006f70 <.LVL64>:
    6f70:	00e7e7b3          	or	a5,a5,a4

00006f74 <.LVL65>:
    6f74:	00000713          	li	a4,0

00006f78 <.LVL66>:
    6f78:	00078863          	beqz	a5,6f88 <.L22>
    6f7c:	00080737          	lui	a4,0x80
    6f80:	00000793          	li	a5,0
    6f84:	00000593          	li	a1,0

00006f88 <.L22>:
    6f88:	01469693          	sll	a3,a3,0x14
    6f8c:	7ff00637          	lui	a2,0x7ff00
    6f90:	00c71713          	sll	a4,a4,0xc

00006f94 <.LVL68>:
    6f94:	00c75713          	srl	a4,a4,0xc
    6f98:	00c6f6b3          	and	a3,a3,a2
    6f9c:	01f59593          	sll	a1,a1,0x1f

00006fa0 <.LVL69>:
    6fa0:	00e6e6b3          	or	a3,a3,a4
    6fa4:	00b6e733          	or	a4,a3,a1

00006fa8 <.LBE28>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    6fa8:	00078513          	mv	a0,a5
    6fac:	00070593          	mv	a1,a4
    6fb0:	02010113          	add	sp,sp,32

00006fb4 <.LVL71>:
    6fb4:	00008067          	ret

00006fb8 <.L24>:
    6fb8:	00000713          	li	a4,0
    6fbc:	f79ff06f          	j	6f34 <.L40>

00006fc0 <.L25>:
    6fc0:	00000713          	li	a4,0

00006fc4 <.LVL74>:
    6fc4:	00000793          	li	a5,0

00006fc8 <.LVL75>:
    6fc8:	f91ff06f          	j	6f58 <.L21>

00006fcc <__clzsi2>:
int
__clzSI2 (UWtype x)
{
  Wtype ret;

  count_leading_zeros (ret, x);
    6fcc:	000107b7          	lui	a5,0x10
    6fd0:	02f57a63          	bgeu	a0,a5,7004 <.L2>
    6fd4:	10053793          	sltiu	a5,a0,256
    6fd8:	0017b793          	seqz	a5,a5
    6fdc:	00379793          	sll	a5,a5,0x3

00006fe0 <.L3>:
    6fe0:	02000713          	li	a4,32
    6fe4:	40f70733          	sub	a4,a4,a5
    6fe8:	00f55533          	srl	a0,a0,a5

00006fec <.LVL2>:
    6fec:	00000797          	auipc	a5,0x0
    6ff0:	2107a783          	lw	a5,528(a5) # 71fc <_GLOBAL_OFFSET_TABLE_+0x34>

00006ff4 <.LVL3>:
    6ff4:	00a787b3          	add	a5,a5,a0
    6ff8:	0007c503          	lbu	a0,0(a5)

00006ffc <.LBE3>:

  return ret;
}
    6ffc:	40a70533          	sub	a0,a4,a0
    7000:	00008067          	ret

00007004 <.L2>:
  count_leading_zeros (ret, x);
    7004:	01000737          	lui	a4,0x1000
    7008:	01800793          	li	a5,24
    700c:	fce57ae3          	bgeu	a0,a4,6fe0 <.L3>
    7010:	01000793          	li	a5,16
    7014:	fcdff06f          	j	6fe0 <.L3>

00007018 <main>:
// https://crypto.stanford.edu/pbc/notes/pi/code.html
#include <stdio.h>
int a=10000,b,c=2800,d,e,f[2801],g;int main(){for(;b-c;)f[b++]=a/5;
    7018:	fd010113          	add	sp,sp,-48
    701c:	03212023          	sw	s2,32(sp)
    7020:	00001917          	auipc	s2,0x1
    7024:	4a490913          	add	s2,s2,1188 # 84c4 <a>
    7028:	00092703          	lw	a4,0(s2)
    702c:	00500793          	li	a5,5
    7030:	02912223          	sw	s1,36(sp)
    7034:	00007617          	auipc	a2,0x7
    7038:	b0460613          	add	a2,a2,-1276 # db38 <b>
    703c:	00001497          	auipc	s1,0x1
    7040:	48448493          	add	s1,s1,1156 # 84c0 <c>
    7044:	02f74733          	div	a4,a4,a5
    7048:	0004a583          	lw	a1,0(s1)
    704c:	00062783          	lw	a5,0(a2)
    7050:	02112623          	sw	ra,44(sp)
    7054:	02812423          	sw	s0,40(sp)
    7058:	01312e23          	sw	s3,28(sp)
    705c:	01412c23          	sw	s4,24(sp)
    7060:	01512a23          	sw	s5,20(sp)
    7064:	01612823          	sw	s6,16(sp)
    7068:	01712623          	sw	s7,12(sp)
    706c:	00000693          	li	a3,0
    7070:	00004517          	auipc	a0,0x4
    7074:	efc50513          	add	a0,a0,-260 # af6c <f>

00007078 <.L2>:
    7078:	08f59063          	bne	a1,a5,70f8 <.L3>
    707c:	00068463          	beqz	a3,7084 <.L4>
    7080:	00b62023          	sw	a1,0(a2)

00007084 <.L4>:
for(;d=0,g=c*2;c-=14,printf("%.4d",e+d/a),e=d%a)for(b=c;d+=f[b]*a,
    7084:	00004997          	auipc	s3,0x4
    7088:	ee498993          	add	s3,s3,-284 # af68 <g>
    708c:	00004b17          	auipc	s6,0x4
    7090:	ee0b0b13          	add	s6,s6,-288 # af6c <f>
    7094:	ffe00b93          	li	s7,-2
    7098:	00007a17          	auipc	s4,0x7
    709c:	a9ca0a13          	add	s4,s4,-1380 # db34 <d>
    70a0:	00007a97          	auipc	s5,0x7
    70a4:	a90a8a93          	add	s5,s5,-1392 # db30 <e>
    70a8:	00001417          	auipc	s0,0x1
    70ac:	37840413          	add	s0,s0,888 # 8420 <.LC0>

000070b0 <.L5>:
    70b0:	00007797          	auipc	a5,0x7
    70b4:	a807a223          	sw	zero,-1404(a5) # db34 <d>
    70b8:	0004a783          	lw	a5,0(s1)
    70bc:	00179613          	sll	a2,a5,0x1
    70c0:	00c9a023          	sw	a2,0(s3)
    70c4:	04079663          	bnez	a5,7110 <.L8>
f[b]=d%--g,d/=g--,--b;d*=b);}
    70c8:	02c12083          	lw	ra,44(sp)
    70cc:	02812403          	lw	s0,40(sp)
    70d0:	02412483          	lw	s1,36(sp)
    70d4:	02012903          	lw	s2,32(sp)
    70d8:	01c12983          	lw	s3,28(sp)
    70dc:	01812a03          	lw	s4,24(sp)
    70e0:	01412a83          	lw	s5,20(sp)
    70e4:	01012b03          	lw	s6,16(sp)
    70e8:	00c12b83          	lw	s7,12(sp)
    70ec:	00000513          	li	a0,0
    70f0:	03010113          	add	sp,sp,48
    70f4:	00008067          	ret

000070f8 <.L3>:
int a=10000,b,c=2800,d,e,f[2801],g;int main(){for(;b-c;)f[b++]=a/5;
    70f8:	00279693          	sll	a3,a5,0x2
    70fc:	00a686b3          	add	a3,a3,a0
    7100:	00e6a023          	sw	a4,0(a3)
    7104:	00178793          	add	a5,a5,1
    7108:	00100693          	li	a3,1
    710c:	f6dff06f          	j	7078 <.L2>

00007110 <.L8>:
for(;d=0,g=c*2;c-=14,printf("%.4d",e+d/a),e=d%a)for(b=c;d+=f[b]*a,
    7110:	00092803          	lw	a6,0(s2)
    7114:	00279713          	sll	a4,a5,0x2
    7118:	01670733          	add	a4,a4,s6
    711c:	00078693          	mv	a3,a5
    7120:	00000513          	li	a0,0

00007124 <.L6>:
    7124:	00072583          	lw	a1,0(a4) # 1000000 <_ebss+0xff2460>
    7128:	ffc70713          	add	a4,a4,-4
    712c:	02b805b3          	mul	a1,a6,a1
    7130:	00a585b3          	add	a1,a1,a0
f[b]=d%--g,d/=g--,--b;d*=b);}
    7134:	00169513          	sll	a0,a3,0x1
    7138:	fff50513          	add	a0,a0,-1
    713c:	02a5e8b3          	rem	a7,a1,a0
    7140:	fff68693          	add	a3,a3,-1
    7144:	01172223          	sw	a7,4(a4)
    7148:	02a5c5b3          	div	a1,a1,a0
for(;d=0,g=c*2;c-=14,printf("%.4d",e+d/a),e=d%a)for(b=c;d+=f[b]*a,
    714c:	04069a63          	bnez	a3,71a0 <.L7>
    7150:	00ba2023          	sw	a1,0(s4)
    7154:	fff78713          	add	a4,a5,-1
    7158:	ff278793          	add	a5,a5,-14
    715c:	00f4a023          	sw	a5,0(s1)
    7160:	000aa783          	lw	a5,0(s5)
    7164:	ffe60613          	add	a2,a2,-2
    7168:	00040513          	mv	a0,s0
    716c:	0305c5b3          	div	a1,a1,a6
    7170:	03770733          	mul	a4,a4,s7
    7174:	00f585b3          	add	a1,a1,a5
    7178:	00c70733          	add	a4,a4,a2
    717c:	00e9a023          	sw	a4,0(s3)
    7180:	00007717          	auipc	a4,0x7
    7184:	9a072c23          	sw	zero,-1608(a4) # db38 <b>
    7188:	f99f80ef          	jal	120 <__GI_printf>

0000718c <.LVL0>:
    718c:	000a2783          	lw	a5,0(s4)
    7190:	00092703          	lw	a4,0(s2)
    7194:	02e7e7b3          	rem	a5,a5,a4
    7198:	00faa023          	sw	a5,0(s5)
    719c:	f15ff06f          	j	70b0 <.L5>

000071a0 <.L7>:
f[b]=d%--g,d/=g--,--b;d*=b);}
    71a0:	02d58533          	mul	a0,a1,a3
    71a4:	f81ff06f          	j	7124 <.L6>
