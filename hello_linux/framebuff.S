
framebuff.gdb:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start-0x4>:
       0:	0000                	.2byte	0x0
	...

00000004 <_start>:
       4:	02c000ef          	jal	30 <.Lload_gp>
       8:	00050793          	mv	a5,a0
       c:	0000f517          	auipc	a0,0xf
      10:	39050513          	add	a0,a0,912 # f39c <main>
      14:	00012583          	lw	a1,0(sp)
      18:	00410613          	add	a2,sp,4
      1c:	ff017113          	and	sp,sp,-16
      20:	00000693          	li	a3,0
      24:	00000713          	li	a4,0
      28:	00010813          	mv	a6,sp
      2c:	5f10306f          	j	3e1c <__uClibc_main>

00000030 <.Lload_gp>:
      30:	00011197          	auipc	gp,0x11
      34:	af018193          	add	gp,gp,-1296 # 10b20 <__global_pointer$>
      38:	00008067          	ret

0000003c <deregister_tm_clones>:
      3c:	00012517          	auipc	a0,0x12
      40:	39050513          	add	a0,a0,912 # 123cc <__TMC_END__>
      44:	00012797          	auipc	a5,0x12
      48:	38878793          	add	a5,a5,904 # 123cc <__TMC_END__>
      4c:	00a78a63          	beq	a5,a0,60 <.L1>
      50:	00010797          	auipc	a5,0x10
      54:	2687a783          	lw	a5,616(a5) # 102b8 <.LLST90+0x13>
      58:	00078463          	beqz	a5,60 <.L1>
      5c:	00078067          	jr	a5

00000060 <.L1>:
      60:	00008067          	ret

00000064 <register_tm_clones>:
      64:	00012517          	auipc	a0,0x12
      68:	36850513          	add	a0,a0,872 # 123cc <__TMC_END__>
      6c:	00012597          	auipc	a1,0x12
      70:	36058593          	add	a1,a1,864 # 123cc <__TMC_END__>
      74:	40a585b3          	sub	a1,a1,a0
      78:	4025d593          	sra	a1,a1,0x2
      7c:	00200793          	li	a5,2
      80:	02f5c5b3          	div	a1,a1,a5
      84:	00058a63          	beqz	a1,98 <.L6>
      88:	00010797          	auipc	a5,0x10
      8c:	2247a783          	lw	a5,548(a5) # 102ac <.LLST90+0x7>
      90:	00078463          	beqz	a5,98 <.L6>
      94:	00078067          	jr	a5

00000098 <.L6>:
      98:	00008067          	ret

0000009c <__do_global_dtors_aux>:
      9c:	ff010113          	add	sp,sp,-16
      a0:	00812423          	sw	s0,8(sp)
      a4:	00014417          	auipc	s0,0x14
      a8:	c8440413          	add	s0,s0,-892 # 13d28 <completed.1>
      ac:	00044783          	lbu	a5,0(s0)
      b0:	00112623          	sw	ra,12(sp)
      b4:	02079463          	bnez	a5,dc <.L14>
      b8:	f85ff0ef          	jal	3c <deregister_tm_clones>
      bc:	00010797          	auipc	a5,0x10
      c0:	1ec7a783          	lw	a5,492(a5) # 102a8 <.LLST90+0x3>
      c4:	00078863          	beqz	a5,d4 <.L16>
      c8:	00012517          	auipc	a0,0x12
      cc:	30450513          	add	a0,a0,772 # 123cc <__TMC_END__>
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
      ec:	00010797          	auipc	a5,0x10
      f0:	1ec7a783          	lw	a5,492(a5) # 102d8 <.LLST90+0x33>
      f4:	02078463          	beqz	a5,11c <.L27>
      f8:	ff010113          	add	sp,sp,-16
      fc:	00112623          	sw	ra,12(sp)
     100:	00014597          	auipc	a1,0x14
     104:	c2c58593          	add	a1,a1,-980 # 13d2c <object.0>
     108:	00012517          	auipc	a0,0x12
     10c:	2c450513          	add	a0,a0,708 # 123cc <__TMC_END__>
     110:	000780e7          	jalr	a5
     114:	00c12083          	lw	ra,12(sp)
     118:	01010113          	add	sp,sp,16

0000011c <.L27>:
     11c:	f49ff06f          	j	64 <register_tm_clones>

00000120 <__divdi3>:
#endif

#ifdef L_divdi3
DWtype
__divdi3 (DWtype u, DWtype v)
{
     120:	00050313          	mv	t1,a0
     124:	00058e13          	mv	t3,a1

00000128 <.LVL1>:
  Wtype c = 0;
     128:	00000893          	li	a7,0
  DWunion uu = {.ll = u};
  DWunion vv = {.ll = v};
  DWtype w;

  if (uu.s.high < 0)
     12c:	0005dc63          	bgez	a1,144 <.L2>

00000130 <.LVL2>:
    c = ~c,
    uu.ll = -uu.ll;
     130:	00a037b3          	snez	a5,a0
     134:	40b00e33          	neg	t3,a1
     138:	40fe0e33          	sub	t3,t3,a5
     13c:	40a00333          	neg	t1,a0
    c = ~c,
     140:	fff00893          	li	a7,-1

00000144 <.L2>:
  if (vv.s.high < 0)
     144:	0006dc63          	bgez	a3,15c <.L3>
    c = ~c,
    vv.ll = -vv.ll;
     148:	00c037b3          	snez	a5,a2
     14c:	40d006b3          	neg	a3,a3

00000150 <.LVL4>:
    c = ~c,
     150:	fff8c893          	not	a7,a7
    vv.ll = -vv.ll;
     154:	40f686b3          	sub	a3,a3,a5
     158:	40c00633          	neg	a2,a2

0000015c <.L3>:
  d0 = dd.s.low;
     15c:	00060713          	mv	a4,a2

00000160 <.LVL7>:
  n0 = nn.s.low;
     160:	00030813          	mv	a6,t1

00000164 <.LVL8>:
  n1 = nn.s.high;
     164:	000e0793          	mv	a5,t3
  if (d1 == 0)
     168:	28069c63          	bnez	a3,400 <.L4>
      if (d0 > n1)
     16c:	00010597          	auipc	a1,0x10
     170:	1545a583          	lw	a1,340(a1) # 102c0 <.LLST90+0x1b>
     174:	0ece7663          	bgeu	t3,a2,260 <.L5>

00000178 <.LBB18>:
	  count_leading_zeros (bm, d0);
     178:	000106b7          	lui	a3,0x10
     17c:	0cd67863          	bgeu	a2,a3,24c <.L6>
     180:	10063693          	sltiu	a3,a2,256
     184:	0016b693          	seqz	a3,a3
     188:	00369693          	sll	a3,a3,0x3

0000018c <.L7>:
     18c:	00d65533          	srl	a0,a2,a3
     190:	00a585b3          	add	a1,a1,a0
     194:	0005c583          	lbu	a1,0(a1)
     198:	02000513          	li	a0,32
     19c:	00d586b3          	add	a3,a1,a3

000001a0 <.LVL12>:
     1a0:	40d505b3          	sub	a1,a0,a3

000001a4 <.LBE18>:
	  if (bm != 0)
     1a4:	00d50c63          	beq	a0,a3,1bc <.L8>

000001a8 <.LVL14>:
	      n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
     1a8:	00be17b3          	sll	a5,t3,a1
     1ac:	00d356b3          	srl	a3,t1,a3
	      d0 = d0 << bm;
     1b0:	00b61733          	sll	a4,a2,a1

000001b4 <.LVL15>:
	      n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
     1b4:	00f6e7b3          	or	a5,a3,a5

000001b8 <.LVL16>:
	      n0 = n0 << bm;
     1b8:	00b31833          	sll	a6,t1,a1

000001bc <.L8>:
	  udiv_qrnnd (q0, n0, n1, n0, d0);
     1bc:	01075593          	srl	a1,a4,0x10

000001c0 <.LVL18>:
     1c0:	02b7de33          	divu	t3,a5,a1
     1c4:	01071613          	sll	a2,a4,0x10
     1c8:	01065613          	srl	a2,a2,0x10

000001cc <.LVL19>:
     1cc:	02b7f7b3          	remu	a5,a5,a1

000001d0 <.LVL20>:
     1d0:	000e0513          	mv	a0,t3
     1d4:	03c60333          	mul	t1,a2,t3

000001d8 <.LVL21>:
     1d8:	01079693          	sll	a3,a5,0x10
     1dc:	01085793          	srl	a5,a6,0x10

000001e0 <.LVL22>:
     1e0:	00d7e7b3          	or	a5,a5,a3

000001e4 <.LVL23>:
     1e4:	0067fe63          	bgeu	a5,t1,200 <.L9>
     1e8:	00f707b3          	add	a5,a4,a5

000001ec <.LVL24>:
     1ec:	fffe0513          	add	a0,t3,-1

000001f0 <.LVL25>:
     1f0:	00e7e863          	bltu	a5,a4,200 <.L9>
     1f4:	0067f663          	bgeu	a5,t1,200 <.L9>
     1f8:	ffee0513          	add	a0,t3,-2
     1fc:	00e787b3          	add	a5,a5,a4

00000200 <.L9>:
     200:	406787b3          	sub	a5,a5,t1

00000204 <.LVL28>:
     204:	02b7d333          	divu	t1,a5,a1

00000208 <.LVL29>:
     208:	01081813          	sll	a6,a6,0x10

0000020c <.LVL30>:
     20c:	01085813          	srl	a6,a6,0x10
     210:	02b7f7b3          	remu	a5,a5,a1

00000214 <.LVL31>:
     214:	026606b3          	mul	a3,a2,t1

00000218 <.LVL32>:
     218:	01079793          	sll	a5,a5,0x10

0000021c <.LVL33>:
     21c:	00f86833          	or	a6,a6,a5

00000220 <.LVL34>:
     220:	00030793          	mv	a5,t1
     224:	00d87c63          	bgeu	a6,a3,23c <.L12>
     228:	01070833          	add	a6,a4,a6

0000022c <.LVL35>:
     22c:	fff30793          	add	a5,t1,-1

00000230 <.LVL36>:
     230:	00e86663          	bltu	a6,a4,23c <.L12>
     234:	00d87463          	bgeu	a6,a3,23c <.L12>
     238:	ffe30793          	add	a5,t1,-2

0000023c <.L12>:
     23c:	01051513          	sll	a0,a0,0x10

00000240 <.LVL38>:
     240:	00f56533          	or	a0,a0,a5

00000244 <.L59>:
	      q1 = 0;
     244:	00000593          	li	a1,0
     248:	0e00006f          	j	328 <.L15>

0000024c <.L6>:
	  count_leading_zeros (bm, d0);
     24c:	01000537          	lui	a0,0x1000

00000250 <.LVL41>:
     250:	01800693          	li	a3,24
     254:	f2a67ce3          	bgeu	a2,a0,18c <.L7>
     258:	01000693          	li	a3,16
     25c:	f31ff06f          	j	18c <.L7>

00000260 <.L5>:
	  count_leading_zeros (bm, d0);
     260:	00000693          	li	a3,0

00000264 <.LBE31>:
	  if (d0 == 0)
     264:	00060c63          	beqz	a2,27c <.L16>

00000268 <.LBB32>:
	  count_leading_zeros (bm, d0);
     268:	000107b7          	lui	a5,0x10
     26c:	0cf67a63          	bgeu	a2,a5,340 <.L17>

00000270 <.LVL44>:
     270:	10063693          	sltiu	a3,a2,256
     274:	0016b693          	seqz	a3,a3
     278:	00369693          	sll	a3,a3,0x3

0000027c <.L16>:
     27c:	00d657b3          	srl	a5,a2,a3
     280:	00f585b3          	add	a1,a1,a5
     284:	0005c783          	lbu	a5,0(a1)
     288:	00d787b3          	add	a5,a5,a3
     28c:	02000693          	li	a3,32

00000290 <.LVL46>:
     290:	40f685b3          	sub	a1,a3,a5

00000294 <.LBE32>:
	  if (bm == 0)
     294:	0cf69063          	bne	a3,a5,354 <.L18>
	      n1 -= d0;
     298:	40ce07b3          	sub	a5,t3,a2

0000029c <.LVL48>:
	      q1 = 1;
     29c:	00100593          	li	a1,1

000002a0 <.L19>:
	  udiv_qrnnd (q0, n0, n1, n0, d0);
     2a0:	01075313          	srl	t1,a4,0x10

000002a4 <.LVL50>:
     2a4:	0267deb3          	divu	t4,a5,t1
     2a8:	01071613          	sll	a2,a4,0x10
     2ac:	01065613          	srl	a2,a2,0x10

000002b0 <.LVL51>:
     2b0:	01085693          	srl	a3,a6,0x10
     2b4:	0267f7b3          	remu	a5,a5,t1

000002b8 <.LVL52>:
     2b8:	000e8513          	mv	a0,t4
     2bc:	03d60e33          	mul	t3,a2,t4

000002c0 <.LVL53>:
     2c0:	01079793          	sll	a5,a5,0x10

000002c4 <.LVL54>:
     2c4:	00f6e7b3          	or	a5,a3,a5

000002c8 <.LVL55>:
     2c8:	01c7fe63          	bgeu	a5,t3,2e4 <.L26>
     2cc:	00f707b3          	add	a5,a4,a5

000002d0 <.LVL56>:
     2d0:	fffe8513          	add	a0,t4,-1

000002d4 <.LVL57>:
     2d4:	00e7e863          	bltu	a5,a4,2e4 <.L26>
     2d8:	01c7f663          	bgeu	a5,t3,2e4 <.L26>
     2dc:	ffee8513          	add	a0,t4,-2
     2e0:	00e787b3          	add	a5,a5,a4

000002e4 <.L26>:
     2e4:	41c787b3          	sub	a5,a5,t3

000002e8 <.LVL60>:
     2e8:	0267de33          	divu	t3,a5,t1

000002ec <.LVL61>:
     2ec:	01081813          	sll	a6,a6,0x10

000002f0 <.LVL62>:
     2f0:	01085813          	srl	a6,a6,0x10
     2f4:	0267f7b3          	remu	a5,a5,t1

000002f8 <.LVL63>:
     2f8:	03c606b3          	mul	a3,a2,t3

000002fc <.LVL64>:
     2fc:	01079793          	sll	a5,a5,0x10

00000300 <.LVL65>:
     300:	00f86833          	or	a6,a6,a5

00000304 <.LVL66>:
     304:	000e0793          	mv	a5,t3
     308:	00d87c63          	bgeu	a6,a3,320 <.L29>
     30c:	01070833          	add	a6,a4,a6

00000310 <.LVL67>:
     310:	fffe0793          	add	a5,t3,-1

00000314 <.LVL68>:
     314:	00e86663          	bltu	a6,a4,320 <.L29>
     318:	00d87463          	bgeu	a6,a3,320 <.L29>
     31c:	ffee0793          	add	a5,t3,-2

00000320 <.L29>:
     320:	01051513          	sll	a0,a0,0x10

00000324 <.LVL70>:
     324:	00f56533          	or	a0,a0,a5

00000328 <.L15>:

  w = __udivmoddi4 (uu.ll, vv.ll, (UDWtype *) 0);
  if (c)
     328:	00088a63          	beqz	a7,33c <.L1>
    w = -w;
     32c:	00a037b3          	snez	a5,a0
     330:	40b005b3          	neg	a1,a1

00000334 <.LVL72>:
     334:	40f585b3          	sub	a1,a1,a5
     338:	40a00533          	neg	a0,a0

0000033c <.L1>:

  return w;
}
     33c:	00008067          	ret

00000340 <.L17>:
	  count_leading_zeros (bm, d0);
     340:	010007b7          	lui	a5,0x1000
     344:	01800693          	li	a3,24
     348:	f2f67ae3          	bgeu	a2,a5,27c <.L16>
     34c:	01000693          	li	a3,16
     350:	f2dff06f          	j	27c <.L16>

00000354 <.L18>:
	      d0 = d0 << bm;
     354:	00b61733          	sll	a4,a2,a1

00000358 <.LVL77>:
	      n2 = n1 >> b;
     358:	00fe56b3          	srl	a3,t3,a5

0000035c <.LBB35>:
	      udiv_qrnnd (q1, n1, n2, n1, d0);
     35c:	01075513          	srl	a0,a4,0x10

00000360 <.LBE35>:
	      n1 = (n1 << bm) | (n0 >> b);
     360:	00be1e33          	sll	t3,t3,a1
     364:	00f357b3          	srl	a5,t1,a5

00000368 <.LVL80>:
     368:	01c7e7b3          	or	a5,a5,t3

0000036c <.LBB36>:
	      udiv_qrnnd (q1, n1, n2, n1, d0);
     36c:	02a6de33          	divu	t3,a3,a0
     370:	01071613          	sll	a2,a4,0x10
     374:	01065613          	srl	a2,a2,0x10

00000378 <.LBE36>:
	      n0 = n0 << bm;
     378:	00b31833          	sll	a6,t1,a1

0000037c <.LBB37>:
	      udiv_qrnnd (q1, n1, n2, n1, d0);
     37c:	02a6f6b3          	remu	a3,a3,a0

00000380 <.LVL83>:
     380:	03c60333          	mul	t1,a2,t3

00000384 <.LVL84>:
     384:	01069593          	sll	a1,a3,0x10

00000388 <.LVL85>:
     388:	0107d693          	srl	a3,a5,0x10

0000038c <.LVL86>:
     38c:	00b6e6b3          	or	a3,a3,a1

00000390 <.LVL87>:
     390:	000e0593          	mv	a1,t3
     394:	0066fe63          	bgeu	a3,t1,3b0 <.L20>
     398:	00d706b3          	add	a3,a4,a3

0000039c <.LVL88>:
     39c:	fffe0593          	add	a1,t3,-1

000003a0 <.LVL89>:
     3a0:	00e6e863          	bltu	a3,a4,3b0 <.L20>
     3a4:	0066f663          	bgeu	a3,t1,3b0 <.L20>
     3a8:	ffee0593          	add	a1,t3,-2
     3ac:	00e686b3          	add	a3,a3,a4

000003b0 <.L20>:
     3b0:	406686b3          	sub	a3,a3,t1

000003b4 <.LVL92>:
     3b4:	02a6d333          	divu	t1,a3,a0

000003b8 <.LVL93>:
     3b8:	01079793          	sll	a5,a5,0x10

000003bc <.LVL94>:
     3bc:	0107d793          	srl	a5,a5,0x10
     3c0:	02a6f6b3          	remu	a3,a3,a0

000003c4 <.LVL95>:
     3c4:	02660633          	mul	a2,a2,t1

000003c8 <.LVL96>:
     3c8:	01069693          	sll	a3,a3,0x10

000003cc <.LVL97>:
     3cc:	00d7e7b3          	or	a5,a5,a3

000003d0 <.LVL98>:
     3d0:	00030693          	mv	a3,t1
     3d4:	00c7fe63          	bgeu	a5,a2,3f0 <.L23>
     3d8:	00f707b3          	add	a5,a4,a5

000003dc <.LVL99>:
     3dc:	fff30693          	add	a3,t1,-1

000003e0 <.LVL100>:
     3e0:	00e7e863          	bltu	a5,a4,3f0 <.L23>
     3e4:	00c7f663          	bgeu	a5,a2,3f0 <.L23>
     3e8:	ffe30693          	add	a3,t1,-2
     3ec:	00e787b3          	add	a5,a5,a4

000003f0 <.L23>:
     3f0:	01059593          	sll	a1,a1,0x10

000003f4 <.LVL103>:
     3f4:	40c787b3          	sub	a5,a5,a2
     3f8:	00d5e5b3          	or	a1,a1,a3

000003fc <.LVL105>:
     3fc:	ea5ff06f          	j	2a0 <.L19>

00000400 <.L4>:
      if (d1 > n1)
     400:	18de6663          	bltu	t3,a3,58c <.L54>

00000404 <.LBB38>:
	  count_leading_zeros (bm, d1);
     404:	000107b7          	lui	a5,0x10
     408:	04f6f463          	bgeu	a3,a5,450 <.L32>
     40c:	1006b713          	sltiu	a4,a3,256
     410:	00173713          	seqz	a4,a4
     414:	00371713          	sll	a4,a4,0x3

00000418 <.L33>:
     418:	00e6d5b3          	srl	a1,a3,a4
     41c:	00010797          	auipc	a5,0x10
     420:	ea47a783          	lw	a5,-348(a5) # 102c0 <.LLST90+0x1b>
     424:	00b787b3          	add	a5,a5,a1
     428:	0007c783          	lbu	a5,0(a5)
     42c:	00e787b3          	add	a5,a5,a4
     430:	02000713          	li	a4,32

00000434 <.LVL109>:
     434:	40f705b3          	sub	a1,a4,a5

00000438 <.LBE38>:
	  if (bm == 0)
     438:	02f71663          	bne	a4,a5,464 <.L34>
		  q0 = 1;
     43c:	00100513          	li	a0,1

00000440 <.LVL111>:
	      if (n1 > d1 || n0 >= d0)
     440:	efc6e4e3          	bltu	a3,t3,328 <.L15>
     444:	00c33533          	sltu	a0,t1,a2
     448:	00153513          	seqz	a0,a0
     44c:	eddff06f          	j	328 <.L15>

00000450 <.L32>:
	  count_leading_zeros (bm, d1);
     450:	010007b7          	lui	a5,0x1000
     454:	01800713          	li	a4,24
     458:	fcf6f0e3          	bgeu	a3,a5,418 <.L33>
     45c:	01000713          	li	a4,16
     460:	fb9ff06f          	j	418 <.L33>

00000464 <.L34>:
	      d1 = (d1 << bm) | (d0 >> b);
     464:	00f65733          	srl	a4,a2,a5
     468:	00b696b3          	sll	a3,a3,a1

0000046c <.LVL114>:
     46c:	00d766b3          	or	a3,a4,a3

00000470 <.LVL115>:
	      n2 = n1 >> b;
     470:	00fe5733          	srl	a4,t3,a5
	      n1 = (n1 << bm) | (n0 >> b);
     474:	00be1e33          	sll	t3,t3,a1
     478:	00f357b3          	srl	a5,t1,a5

0000047c <.LVL116>:
     47c:	01c7e7b3          	or	a5,a5,t3

00000480 <.LBB21>:
	      udiv_qrnnd (q0, n1, n2, n1, d1);
     480:	0106de13          	srl	t3,a3,0x10
     484:	03c75f33          	divu	t5,a4,t3
     488:	01069813          	sll	a6,a3,0x10
     48c:	01085813          	srl	a6,a6,0x10

00000490 <.LBE21>:
	      d0 = d0 << bm;
     490:	00b61633          	sll	a2,a2,a1

00000494 <.LBB22>:
	      udiv_qrnnd (q0, n1, n2, n1, d1);
     494:	03c77733          	remu	a4,a4,t3

00000498 <.LVL118>:
     498:	03e80eb3          	mul	t4,a6,t5

0000049c <.LVL119>:
     49c:	01071513          	sll	a0,a4,0x10

000004a0 <.LVL120>:
     4a0:	0107d713          	srl	a4,a5,0x10

000004a4 <.LVL121>:
     4a4:	00a76733          	or	a4,a4,a0

000004a8 <.LVL122>:
     4a8:	000f0513          	mv	a0,t5
     4ac:	01d77e63          	bgeu	a4,t4,4c8 <.L35>
     4b0:	00e68733          	add	a4,a3,a4

000004b4 <.LVL123>:
     4b4:	ffff0513          	add	a0,t5,-1

000004b8 <.LVL124>:
     4b8:	00d76863          	bltu	a4,a3,4c8 <.L35>
     4bc:	01d77663          	bgeu	a4,t4,4c8 <.L35>
     4c0:	ffef0513          	add	a0,t5,-2
     4c4:	00d70733          	add	a4,a4,a3

000004c8 <.L35>:
     4c8:	41d70733          	sub	a4,a4,t4

000004cc <.LVL127>:
     4cc:	03c75eb3          	divu	t4,a4,t3

000004d0 <.LVL128>:
     4d0:	01079793          	sll	a5,a5,0x10

000004d4 <.LVL129>:
     4d4:	0107d793          	srl	a5,a5,0x10
     4d8:	03c77733          	remu	a4,a4,t3

000004dc <.LVL130>:
     4dc:	03d80833          	mul	a6,a6,t4

000004e0 <.LVL131>:
     4e0:	01071713          	sll	a4,a4,0x10

000004e4 <.LVL132>:
     4e4:	00e7e7b3          	or	a5,a5,a4

000004e8 <.LVL133>:
     4e8:	000e8713          	mv	a4,t4
     4ec:	0107fe63          	bgeu	a5,a6,508 <.L38>
     4f0:	00f687b3          	add	a5,a3,a5

000004f4 <.LVL134>:
     4f4:	fffe8713          	add	a4,t4,-1

000004f8 <.LVL135>:
     4f8:	00d7e863          	bltu	a5,a3,508 <.L38>
     4fc:	0107f663          	bgeu	a5,a6,508 <.L38>
     500:	ffee8713          	add	a4,t4,-2
     504:	00d787b3          	add	a5,a5,a3

00000508 <.L38>:
     508:	01051513          	sll	a0,a0,0x10

0000050c <.LBB23>:
	      umul_ppmm (m1, m0, q0, d0);
     50c:	00010eb7          	lui	t4,0x10

00000510 <.LBB24>:
	      udiv_qrnnd (q0, n1, n2, n1, d1);
     510:	00e56533          	or	a0,a0,a4

00000514 <.LBB25>:
	      umul_ppmm (m1, m0, q0, d0);
     514:	fffe8693          	add	a3,t4,-1 # ffff <.LVL314+0x7>

00000518 <.LVL139>:
     518:	00d57733          	and	a4,a0,a3

0000051c <.LBB26>:
	      udiv_qrnnd (q0, n1, n2, n1, d1);
     51c:	410787b3          	sub	a5,a5,a6

00000520 <.LBB27>:
	      umul_ppmm (m1, m0, q0, d0);
     520:	00d676b3          	and	a3,a2,a3
     524:	01055813          	srl	a6,a0,0x10

00000528 <.LVL142>:
     528:	01065613          	srl	a2,a2,0x10

0000052c <.LVL143>:
     52c:	02d70e33          	mul	t3,a4,a3

00000530 <.LVL144>:
     530:	02d806b3          	mul	a3,a6,a3

00000534 <.LVL145>:
     534:	02c70733          	mul	a4,a4,a2

00000538 <.LVL146>:
     538:	02c80833          	mul	a6,a6,a2

0000053c <.LVL147>:
     53c:	00d70633          	add	a2,a4,a3

00000540 <.LVL148>:
     540:	010e5713          	srl	a4,t3,0x10
     544:	00c70733          	add	a4,a4,a2

00000548 <.LVL149>:
     548:	00d77463          	bgeu	a4,a3,550 <.L41>
     54c:	01d80833          	add	a6,a6,t4

00000550 <.L41>:
     550:	01075693          	srl	a3,a4,0x10

00000554 <.LVL151>:
     554:	010686b3          	add	a3,a3,a6

00000558 <.LBE27>:
	      if (m1 > n1 || (m1 == n1 && m0 > n0))
     558:	02d7e663          	bltu	a5,a3,584 <.L42>
     55c:	ced794e3          	bne	a5,a3,244 <.L59>

00000560 <.LBB28>:
	      umul_ppmm (m1, m0, q0, d0);
     560:	000107b7          	lui	a5,0x10

00000564 <.LVL153>:
     564:	fff78793          	add	a5,a5,-1 # ffff <.LVL314+0x7>

00000568 <.LVL154>:
     568:	00f77733          	and	a4,a4,a5

0000056c <.LVL155>:
     56c:	01071713          	sll	a4,a4,0x10
     570:	00fe7e33          	and	t3,t3,a5

00000574 <.LBE28>:
	      n0 = n0 << bm;
     574:	00b31333          	sll	t1,t1,a1

00000578 <.LBB29>:
	      umul_ppmm (m1, m0, q0, d0);
     578:	01c70733          	add	a4,a4,t3

0000057c <.LBE29>:
	      q1 = 0;
     57c:	00000593          	li	a1,0

00000580 <.LVL158>:
	      if (m1 > n1 || (m1 == n1 && m0 > n0))
     580:	dae374e3          	bgeu	t1,a4,328 <.L15>

00000584 <.L42>:
		  q0--;
     584:	fff50513          	add	a0,a0,-1 # ffffff <_ebss+0xfea10f>

00000588 <.LBE40>:
		  sub_ddmmss (m1, m0, m1, m0, d1, d0);
     588:	cbdff06f          	j	244 <.L59>

0000058c <.L54>:
	  q1 = 0;
     58c:	00000593          	li	a1,0
	  q0 = 0;
     590:	00000513          	li	a0,0

00000594 <.LVL162>:
     594:	d95ff06f          	j	328 <.L15>

00000598 <__addsf3>:
  FP_DECL_S (B);
  FP_DECL_S (R);
  SFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_S (A, a);
     598:	008006b7          	lui	a3,0x800
     59c:	fff68693          	add	a3,a3,-1 # 7fffff <_ebss+0x7ea10f>

000005a0 <.LBE2>:
{
     5a0:	ff010113          	add	sp,sp,-16

000005a4 <.LBB3>:
  FP_UNPACK_SEMIRAW_S (A, a);
     5a4:	00a6f633          	and	a2,a3,a0

000005a8 <.LVL1>:
     5a8:	01755713          	srl	a4,a0,0x17

000005ac <.LBE3>:
{
     5ac:	00812423          	sw	s0,8(sp)

000005b0 <.LBB4>:
  FP_UNPACK_SEMIRAW_S (A, a);
     5b0:	01f55413          	srl	s0,a0,0x1f

000005b4 <.LBE4>:
     5b4:	00361513          	sll	a0,a2,0x3

000005b8 <.LBB5>:
  FP_UNPACK_SEMIRAW_S (B, b);
     5b8:	0175d613          	srl	a2,a1,0x17

000005bc <.LVL3>:
     5bc:	00b6f6b3          	and	a3,a3,a1

000005c0 <.LBE5>:
{
     5c0:	01212023          	sw	s2,0(sp)

000005c4 <.LBB6>:
  FP_UNPACK_SEMIRAW_S (B, b);
     5c4:	0ff67613          	zext.b	a2,a2

000005c8 <.LBB7>:
  FP_UNPACK_SEMIRAW_S (A, a);
     5c8:	0ff77913          	zext.b	s2,a4

000005cc <.LBB8>:
{
     5cc:	00112623          	sw	ra,12(sp)
     5d0:	00912223          	sw	s1,4(sp)

000005d4 <.LBB9>:
  FP_UNPACK_SEMIRAW_S (B, b);
     5d4:	01f5d593          	srl	a1,a1,0x1f

000005d8 <.LBE9>:
     5d8:	00369793          	sll	a5,a3,0x3

000005dc <.LBB10>:
  FP_ADD_S (R, A, B);
     5dc:	40c906b3          	sub	a3,s2,a2

000005e0 <.LBE10>:
     5e0:	18b41063          	bne	s0,a1,760 <.L2>

000005e4 <.LBB11>:
     5e4:	08d05c63          	blez	a3,67c <.L3>

000005e8 <.LVL8>:
     5e8:	02061663          	bnez	a2,614 <.L4>
     5ec:	02078063          	beqz	a5,60c <.L62>
     5f0:	fff90693          	add	a3,s2,-1
     5f4:	00069863          	bnez	a3,604 <.L6>

000005f8 <.L92>:
     5f8:	00a787b3          	add	a5,a5,a0

000005fc <.LVL11>:
     5fc:	00100913          	li	s2,1

00000600 <.LVL12>:
     600:	04c0006f          	j	64c <.L7>

00000604 <.L6>:
     604:	0ff00713          	li	a4,255
     608:	00e91e63          	bne	s2,a4,624 <.L8>

0000060c <.L62>:
     60c:	00050793          	mv	a5,a0

00000610 <.LVL15>:
     610:	10c0006f          	j	71c <.L36>

00000614 <.L4>:
     614:	0ff00713          	li	a4,255
     618:	fee90ae3          	beq	s2,a4,60c <.L62>
     61c:	04000737          	lui	a4,0x4000
     620:	00e7e7b3          	or	a5,a5,a4

00000624 <.L8>:
     624:	01b00613          	li	a2,27

00000628 <.LVL18>:
     628:	00100713          	li	a4,1
     62c:	00d64e63          	blt	a2,a3,648 <.L9>
     630:	02000613          	li	a2,32
     634:	00d7d733          	srl	a4,a5,a3
     638:	40d606b3          	sub	a3,a2,a3

0000063c <.LVL19>:
     63c:	00d796b3          	sll	a3,a5,a3
     640:	00d036b3          	snez	a3,a3
     644:	00d76733          	or	a4,a4,a3

00000648 <.L9>:
     648:	00a707b3          	add	a5,a4,a0

0000064c <.L7>:
     64c:	00579713          	sll	a4,a5,0x5
     650:	0c075663          	bgez	a4,71c <.L36>

00000654 <.LVL22>:
     654:	00190913          	add	s2,s2,1

00000658 <.LVL23>:
     658:	0ff00713          	li	a4,255
     65c:	2ce90a63          	beq	s2,a4,930 <.L52>
     660:	7e000737          	lui	a4,0x7e000
     664:	0017f693          	and	a3,a5,1

00000668 <.LVL24>:
     668:	fff70713          	add	a4,a4,-1 # 7dffffff <_ebss+0x7dfea10f>
     66c:	0017d793          	srl	a5,a5,0x1

00000670 <.LVL25>:
     670:	00e7f7b3          	and	a5,a5,a4

00000674 <.LVL26>:
     674:	00d7e7b3          	or	a5,a5,a3
     678:	0a40006f          	j	71c <.L36>

0000067c <.L3>:
     67c:	06068663          	beqz	a3,6e8 <.L10>
     680:	41260733          	sub	a4,a2,s2

00000684 <.LVL28>:
     684:	02091063          	bnez	s2,6a4 <.L11>
     688:	0c050863          	beqz	a0,758 <.L44>
     68c:	fff70693          	add	a3,a4,-1

00000690 <.LVL29>:
     690:	f60684e3          	beqz	a3,5f8 <.L92>
     694:	0ff00593          	li	a1,255

00000698 <.LVL30>:
     698:	02b71063          	bne	a4,a1,6b8 <.L13>

0000069c <.L94>:
     69c:	0ff00913          	li	s2,255

000006a0 <.LVL32>:
     6a0:	07c0006f          	j	71c <.L36>

000006a4 <.L11>:
     6a4:	0ff00693          	li	a3,255
     6a8:	fed60ae3          	beq	a2,a3,69c <.L94>
     6ac:	040006b7          	lui	a3,0x4000
     6b0:	00d56533          	or	a0,a0,a3
     6b4:	00070693          	mv	a3,a4

000006b8 <.L13>:
     6b8:	01b00593          	li	a1,27
     6bc:	00100713          	li	a4,1
     6c0:	00d5ce63          	blt	a1,a3,6dc <.L14>
     6c4:	02000713          	li	a4,32
     6c8:	40d70733          	sub	a4,a4,a3
     6cc:	00e51733          	sll	a4,a0,a4
     6d0:	00d555b3          	srl	a1,a0,a3
     6d4:	00e03733          	snez	a4,a4
     6d8:	00e5e733          	or	a4,a1,a4

000006dc <.L14>:
     6dc:	00e787b3          	add	a5,a5,a4

000006e0 <.LVL37>:
     6e0:	00060913          	mv	s2,a2

000006e4 <.LVL38>:
     6e4:	f69ff06f          	j	64c <.L7>

000006e8 <.L10>:
     6e8:	00190713          	add	a4,s2,1
     6ec:	0fe77693          	and	a3,a4,254

000006f0 <.LVL40>:
     6f0:	04069c63          	bnez	a3,748 <.L15>
     6f4:	04091263          	bnez	s2,738 <.L16>

000006f8 <.LVL41>:
     6f8:	02050263          	beqz	a0,71c <.L36>
     6fc:	f00788e3          	beqz	a5,60c <.L62>
     700:	00a787b3          	add	a5,a5,a0

00000704 <.LVL42>:
     704:	00579713          	sll	a4,a5,0x5
     708:	00075a63          	bgez	a4,71c <.L36>
     70c:	fc000737          	lui	a4,0xfc000
     710:	fff70713          	add	a4,a4,-1 # fbffffff <_ebss+0xfbfea10f>
     714:	00e7f7b3          	and	a5,a5,a4

00000718 <.LVL43>:
     718:	00100913          	li	s2,1

0000071c <.L36>:
  FP_PACK_SEMIRAW_S (r, R);
     71c:	0077f713          	and	a4,a5,7
     720:	20070a63          	beqz	a4,934 <.L37>
     724:	00f7f713          	and	a4,a5,15
     728:	00400693          	li	a3,4
     72c:	20d70463          	beq	a4,a3,934 <.L37>
     730:	00478793          	add	a5,a5,4
     734:	2000006f          	j	934 <.L37>

00000738 <.L16>:
  FP_ADD_S (R, A, B);
     738:	f60502e3          	beqz	a0,69c <.L94>

0000073c <.L32>:
     73c:	16079663          	bnez	a5,8a8 <.L64>
     740:	00050793          	mv	a5,a0

00000744 <.LVL48>:
     744:	f59ff06f          	j	69c <.L94>

00000748 <.L15>:
     748:	0ff00693          	li	a3,255
     74c:	1ed70063          	beq	a4,a3,92c <.L51>
     750:	00f507b3          	add	a5,a0,a5

00000754 <.LVL50>:
     754:	0017d793          	srl	a5,a5,0x1

00000758 <.L44>:
     758:	00070913          	mv	s2,a4

0000075c <.LVL52>:
     75c:	fc1ff06f          	j	71c <.L36>

00000760 <.L2>:
     760:	06d05e63          	blez	a3,7dc <.L17>

00000764 <.LVL54>:
     764:	06061263          	bnez	a2,7c8 <.L18>
     768:	ea0782e3          	beqz	a5,60c <.L62>
     76c:	fff90693          	add	a3,s2,-1

00000770 <.LVL55>:
     770:	00069863          	bnez	a3,780 <.L19>
     774:	40f507b3          	sub	a5,a0,a5

00000778 <.L93>:
     778:	00100913          	li	s2,1

0000077c <.LVL57>:
     77c:	0340006f          	j	7b0 <.L20>

00000780 <.L19>:
     780:	0ff00713          	li	a4,255
     784:	e8e904e3          	beq	s2,a4,60c <.L62>

00000788 <.L21>:
     788:	01b00613          	li	a2,27

0000078c <.LVL60>:
     78c:	00100713          	li	a4,1
     790:	00d64e63          	blt	a2,a3,7ac <.L22>
     794:	02000613          	li	a2,32
     798:	00d7d733          	srl	a4,a5,a3
     79c:	40d606b3          	sub	a3,a2,a3

000007a0 <.LVL61>:
     7a0:	00d796b3          	sll	a3,a5,a3
     7a4:	00d036b3          	snez	a3,a3
     7a8:	00d76733          	or	a4,a4,a3

000007ac <.L22>:
     7ac:	40e507b3          	sub	a5,a0,a4

000007b0 <.L20>:
     7b0:	00579713          	sll	a4,a5,0x5
     7b4:	f60754e3          	bgez	a4,71c <.L36>

000007b8 <.LBB13>:
     7b8:	040004b7          	lui	s1,0x4000
     7bc:	fff48493          	add	s1,s1,-1 # 3ffffff <_ebss+0x3fea10f>
     7c0:	0097f4b3          	and	s1,a5,s1

000007c4 <.LVL64>:
     7c4:	1080006f          	j	8cc <.L34>

000007c8 <.L18>:
     7c8:	0ff00713          	li	a4,255
     7cc:	e4e900e3          	beq	s2,a4,60c <.L62>
     7d0:	04000737          	lui	a4,0x4000
     7d4:	00e7e7b3          	or	a5,a5,a4
     7d8:	fb1ff06f          	j	788 <.L21>

000007dc <.L17>:
     7dc:	06068e63          	beqz	a3,858 <.L23>
     7e0:	41260733          	sub	a4,a2,s2

000007e4 <.LVL68>:
     7e4:	02091663          	bnez	s2,810 <.L24>
     7e8:	1a050e63          	beqz	a0,9a4 <.L57>
     7ec:	fff70693          	add	a3,a4,-1 # 3ffffff <_ebss+0x3fea10f>

000007f0 <.LVL69>:
     7f0:	00069863          	bnez	a3,800 <.L25>
     7f4:	40a787b3          	sub	a5,a5,a0

000007f8 <.LVL70>:
     7f8:	00058413          	mv	s0,a1

000007fc <.LVL71>:
     7fc:	f7dff06f          	j	778 <.L93>

00000800 <.L25>:
     800:	0ff00813          	li	a6,255
     804:	03071063          	bne	a4,a6,824 <.L26>

00000808 <.L59>:
     808:	0ff00913          	li	s2,255

0000080c <.LVL74>:
     80c:	19c0006f          	j	9a8 <.L61>

00000810 <.L24>:
     810:	0ff00693          	li	a3,255
     814:	fed60ae3          	beq	a2,a3,808 <.L59>
     818:	040006b7          	lui	a3,0x4000
     81c:	00d56533          	or	a0,a0,a3
     820:	00070693          	mv	a3,a4

00000824 <.L26>:
     824:	01b00813          	li	a6,27
     828:	00100713          	li	a4,1
     82c:	00d84e63          	blt	a6,a3,848 <.L27>
     830:	02000713          	li	a4,32
     834:	40d70733          	sub	a4,a4,a3
     838:	00e51733          	sll	a4,a0,a4
     83c:	00d55833          	srl	a6,a0,a3
     840:	00e03733          	snez	a4,a4
     844:	00e86733          	or	a4,a6,a4

00000848 <.L27>:
     848:	40e787b3          	sub	a5,a5,a4

0000084c <.LVL79>:
     84c:	00060913          	mv	s2,a2

00000850 <.LVL80>:
     850:	00058413          	mv	s0,a1

00000854 <.LVL81>:
     854:	f5dff06f          	j	7b0 <.L20>

00000858 <.L23>:
     858:	00190713          	add	a4,s2,1
     85c:	0fe77713          	and	a4,a4,254
     860:	04071c63          	bnez	a4,8b8 <.L28>
     864:	02091c63          	bnez	s2,89c <.L29>

00000868 <.LVL83>:
     868:	00051863          	bnez	a0,878 <.L30>

0000086c <.LVL84>:
     86c:	12079e63          	bnez	a5,9a8 <.L61>

00000870 <.L95>:
     870:	00000413          	li	s0,0

00000874 <.LVL86>:
     874:	0c00006f          	j	934 <.L37>

00000878 <.L30>:
     878:	d8078ae3          	beqz	a5,60c <.L62>
     87c:	40f50733          	sub	a4,a0,a5

00000880 <.LVL88>:
     880:	00571693          	sll	a3,a4,0x5
     884:	40a787b3          	sub	a5,a5,a0

00000888 <.LVL89>:
     888:	1206c063          	bltz	a3,9a8 <.L61>
     88c:	00070793          	mv	a5,a4
     890:	e80716e3          	bnez	a4,71c <.L36>
     894:	00000793          	li	a5,0
     898:	fd9ff06f          	j	870 <.L95>

0000089c <.L29>:
     89c:	ea0510e3          	bnez	a0,73c <.L32>
     8a0:	00058413          	mv	s0,a1

000008a4 <.LVL91>:
     8a4:	de079ce3          	bnez	a5,69c <.L94>

000008a8 <.L64>:
     8a8:	00000413          	li	s0,0
     8ac:	020007b7          	lui	a5,0x2000

000008b0 <.LVL93>:
     8b0:	0ff00913          	li	s2,255

000008b4 <.LVL94>:
     8b4:	0800006f          	j	934 <.L37>

000008b8 <.L28>:
     8b8:	40f504b3          	sub	s1,a0,a5

000008bc <.LVL96>:
     8bc:	00549713          	sll	a4,s1,0x5
     8c0:	04075463          	bgez	a4,908 <.L33>
     8c4:	40a784b3          	sub	s1,a5,a0

000008c8 <.LVL97>:
     8c8:	00058413          	mv	s0,a1

000008cc <.L34>:
     8cc:	00048513          	mv	a0,s1
     8d0:	545000ef          	jal	1614 <__clzsi2>

000008d4 <.LVL99>:
     8d4:	ffb50513          	add	a0,a0,-5
     8d8:	00a494b3          	sll	s1,s1,a0
     8dc:	03254e63          	blt	a0,s2,918 <.L35>
     8e0:	41250533          	sub	a0,a0,s2

000008e4 <.LVL102>:
     8e4:	00150513          	add	a0,a0,1

000008e8 <.LVL103>:
     8e8:	02000713          	li	a4,32
     8ec:	40a70733          	sub	a4,a4,a0
     8f0:	00a4d7b3          	srl	a5,s1,a0
     8f4:	00e494b3          	sll	s1,s1,a4

000008f8 <.LVL104>:
     8f8:	009034b3          	snez	s1,s1
     8fc:	0097e7b3          	or	a5,a5,s1

00000900 <.LVL105>:
     900:	00000913          	li	s2,0
     904:	e19ff06f          	j	71c <.L36>

00000908 <.L33>:
     908:	fc0492e3          	bnez	s1,8cc <.L34>
     90c:	00000793          	li	a5,0

00000910 <.LVL107>:
     910:	00000913          	li	s2,0

00000914 <.LVL108>:
     914:	f5dff06f          	j	870 <.L95>

00000918 <.L35>:
     918:	fc0007b7          	lui	a5,0xfc000
     91c:	fff78793          	add	a5,a5,-1 # fbffffff <_ebss+0xfbfea10f>
     920:	40a90933          	sub	s2,s2,a0
     924:	00f4f7b3          	and	a5,s1,a5

00000928 <.LVL111>:
     928:	df5ff06f          	j	71c <.L36>

0000092c <.L51>:
     92c:	0ff00913          	li	s2,255

00000930 <.L52>:
     930:	00000793          	li	a5,0

00000934 <.L37>:
  FP_PACK_SEMIRAW_S (r, R);
     934:	00579713          	sll	a4,a5,0x5
     938:	00075e63          	bgez	a4,954 <.L38>

0000093c <.LVL115>:
     93c:	00190913          	add	s2,s2,1

00000940 <.LVL116>:
     940:	0ff00713          	li	a4,255
     944:	06e90663          	beq	s2,a4,9b0 <.L67>
     948:	fc000737          	lui	a4,0xfc000
     94c:	fff70713          	add	a4,a4,-1 # fbffffff <_ebss+0xfbfea10f>
     950:	00e7f7b3          	and	a5,a5,a4

00000954 <.L38>:
     954:	0ff00713          	li	a4,255
     958:	0037d793          	srl	a5,a5,0x3
     95c:	00e91863          	bne	s2,a4,96c <.L39>
     960:	00078663          	beqz	a5,96c <.L39>
     964:	004007b7          	lui	a5,0x400

00000968 <.LVL119>:
     968:	00000413          	li	s0,0

0000096c <.L39>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
     96c:	00c12083          	lw	ra,12(sp)

00000970 <.LBB28>:
  FP_PACK_SEMIRAW_S (r, R);
     970:	01791713          	sll	a4,s2,0x17
     974:	01f41513          	sll	a0,s0,0x1f
     978:	7f8006b7          	lui	a3,0x7f800

0000097c <.LBE28>:
}
     97c:	00812403          	lw	s0,8(sp)

00000980 <.LBB29>:
  FP_PACK_SEMIRAW_S (r, R);
     980:	00979793          	sll	a5,a5,0x9

00000984 <.LVL122>:
     984:	00d77733          	and	a4,a4,a3
     988:	0097d793          	srl	a5,a5,0x9
     98c:	00f767b3          	or	a5,a4,a5

00000990 <.LBE29>:
}
     990:	00412483          	lw	s1,4(sp)
     994:	00012903          	lw	s2,0(sp)

00000998 <.LVL124>:
     998:	00a7e533          	or	a0,a5,a0

0000099c <.LVL125>:
     99c:	01010113          	add	sp,sp,16
     9a0:	00008067          	ret

000009a4 <.L57>:
  FP_ADD_S (R, A, B);
     9a4:	00070913          	mv	s2,a4

000009a8 <.L61>:
     9a8:	00058413          	mv	s0,a1

000009ac <.LVL128>:
     9ac:	d71ff06f          	j	71c <.L36>

000009b0 <.L67>:
     9b0:	00000793          	li	a5,0

000009b4 <.LVL130>:
     9b4:	fa1ff06f          	j	954 <.L38>

000009b8 <__divsf3>:
#include "soft-fp.h"
#include "single.h"

SFtype
__divsf3 (SFtype a, SFtype b)
{
     9b8:	fe010113          	add	sp,sp,-32
     9bc:	00912a23          	sw	s1,20(sp)
     9c0:	01755493          	srl	s1,a0,0x17
     9c4:	01212823          	sw	s2,16(sp)
     9c8:	01312623          	sw	s3,12(sp)
     9cc:	01412423          	sw	s4,8(sp)

000009d0 <.LBB3>:
  FP_DECL_S (B);
  FP_DECL_S (R);
  SFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_S (A, a);
     9d0:	00951993          	sll	s3,a0,0x9

000009d4 <.LBE3>:
{
     9d4:	00112e23          	sw	ra,28(sp)
     9d8:	00812c23          	sw	s0,24(sp)
     9dc:	01512223          	sw	s5,4(sp)
     9e0:	0ff4f493          	zext.b	s1,s1
     9e4:	00058a13          	mv	s4,a1

000009e8 <.LBB4>:
  FP_UNPACK_S (A, a);
     9e8:	0099d993          	srl	s3,s3,0x9

000009ec <.LVL1>:
     9ec:	01f55913          	srl	s2,a0,0x1f

000009f0 <.LBE4>:
     9f0:	08048663          	beqz	s1,a7c <.L2>
     9f4:	0ff00793          	li	a5,255
     9f8:	0af48263          	beq	s1,a5,a9c <.L3>

000009fc <.LVL3>:
     9fc:	00399993          	sll	s3,s3,0x3

00000a00 <.LVL4>:
     a00:	040007b7          	lui	a5,0x4000
     a04:	00f9e9b3          	or	s3,s3,a5

00000a08 <.LVL5>:
     a08:	f8148493          	add	s1,s1,-127

00000a0c <.L51>:
     a0c:	00000a93          	li	s5,0

00000a10 <.L4>:
  FP_UNPACK_S (B, b);
     a10:	017a5793          	srl	a5,s4,0x17
     a14:	009a1413          	sll	s0,s4,0x9
     a18:	0ff7f793          	zext.b	a5,a5
     a1c:	00945413          	srl	s0,s0,0x9

00000a20 <.LVL8>:
     a20:	01fa5a13          	srl	s4,s4,0x1f

00000a24 <.LBE6>:
     a24:	08078c63          	beqz	a5,abc <.L5>
     a28:	0ff00713          	li	a4,255
     a2c:	0ae78863          	beq	a5,a4,adc <.L6>

00000a30 <.LVL10>:
     a30:	00341413          	sll	s0,s0,0x3

00000a34 <.LVL11>:
     a34:	04000737          	lui	a4,0x4000
     a38:	00e46433          	or	s0,s0,a4

00000a3c <.LVL12>:
     a3c:	f8178793          	add	a5,a5,-127 # 3ffff81 <_ebss+0x3fea091>

00000a40 <.L52>:
     a40:	00000713          	li	a4,0

00000a44 <.L7>:
  FP_DIV_S (R, A, B);
     a44:	40f484b3          	sub	s1,s1,a5

00000a48 <.LVL15>:
     a48:	002a9793          	sll	a5,s5,0x2

00000a4c <.LVL16>:
     a4c:	00e7e7b3          	or	a5,a5,a4
     a50:	fff78793          	add	a5,a5,-1
     a54:	00e00613          	li	a2,14
     a58:	014946b3          	xor	a3,s2,s4

00000a5c <.LVL17>:
     a5c:	0af66063          	bltu	a2,a5,afc <.L8>
     a60:	00010617          	auipc	a2,0x10
     a64:	8c060613          	add	a2,a2,-1856 # 10320 <.L10>
     a68:	00279793          	sll	a5,a5,0x2
     a6c:	00c787b3          	add	a5,a5,a2
     a70:	0007a783          	lw	a5,0(a5)
     a74:	00c787b3          	add	a5,a5,a2
     a78:	00078067          	jr	a5

00000a7c <.L2>:
  FP_UNPACK_S (A, a);
     a7c:	02098a63          	beqz	s3,ab0 <.L28>

00000a80 <.LBB8>:
     a80:	00098513          	mv	a0,s3

00000a84 <.LVL19>:
     a84:	391000ef          	jal	1614 <__clzsi2>

00000a88 <.LVL20>:
     a88:	ffb50793          	add	a5,a0,-5
     a8c:	f8a00493          	li	s1,-118

00000a90 <.LVL21>:
     a90:	00f999b3          	sll	s3,s3,a5
     a94:	40a484b3          	sub	s1,s1,a0
     a98:	f75ff06f          	j	a0c <.L51>

00000a9c <.L3>:
     a9c:	0ff00493          	li	s1,255

00000aa0 <.LBE9>:
     aa0:	00200a93          	li	s5,2
     aa4:	f60986e3          	beqz	s3,a10 <.L4>
     aa8:	00300a93          	li	s5,3
     aac:	f65ff06f          	j	a10 <.L4>

00000ab0 <.L28>:
     ab0:	00000493          	li	s1,0

00000ab4 <.LBE10>:
     ab4:	00100a93          	li	s5,1
     ab8:	f59ff06f          	j	a10 <.L4>

00000abc <.L5>:
  FP_UNPACK_S (B, b);
     abc:	02040a63          	beqz	s0,af0 <.L30>

00000ac0 <.LBB11>:
     ac0:	00040513          	mv	a0,s0
     ac4:	351000ef          	jal	1614 <__clzsi2>

00000ac8 <.LVL28>:
     ac8:	ffb50793          	add	a5,a0,-5
     acc:	00f41433          	sll	s0,s0,a5
     ad0:	f8a00793          	li	a5,-118
     ad4:	40a787b3          	sub	a5,a5,a0
     ad8:	f69ff06f          	j	a40 <.L52>

00000adc <.L6>:
     adc:	0ff00793          	li	a5,255

00000ae0 <.LBE12>:
     ae0:	00200713          	li	a4,2
     ae4:	f60400e3          	beqz	s0,a44 <.L7>
     ae8:	00300713          	li	a4,3
     aec:	f59ff06f          	j	a44 <.L7>

00000af0 <.L30>:
     af0:	00000793          	li	a5,0

00000af4 <.LBE13>:
     af4:	00100713          	li	a4,1
     af8:	f4dff06f          	j	a44 <.L7>

00000afc <.L8>:
  FP_DIV_S (R, A, B);
     afc:	00541613          	sll	a2,s0,0x5

00000b00 <.LVL35>:
     b00:	1289f263          	bgeu	s3,s0,c24 <.L15>
     b04:	fff48493          	add	s1,s1,-1

00000b08 <.LVL36>:
     b08:	00000793          	li	a5,0

00000b0c <.L16>:
     b0c:	01065593          	srl	a1,a2,0x10

00000b10 <.LVL38>:
     b10:	02b9d833          	divu	a6,s3,a1
     b14:	00010737          	lui	a4,0x10

00000b18 <.LVL39>:
     b18:	fe070713          	add	a4,a4,-32 # ffe0 <.LBB202+0x8>
     b1c:	00e67733          	and	a4,a2,a4

00000b20 <.LVL40>:
     b20:	0107d793          	srl	a5,a5,0x10

00000b24 <.LVL41>:
     b24:	02b9f9b3          	remu	s3,s3,a1

00000b28 <.LVL42>:
     b28:	00080413          	mv	s0,a6

00000b2c <.LVL43>:
     b2c:	03070533          	mul	a0,a4,a6

00000b30 <.LVL44>:
     b30:	01099993          	sll	s3,s3,0x10

00000b34 <.LVL45>:
     b34:	0137e7b3          	or	a5,a5,s3

00000b38 <.LVL46>:
     b38:	00a7fe63          	bgeu	a5,a0,b54 <.L17>
     b3c:	00f607b3          	add	a5,a2,a5

00000b40 <.LVL47>:
     b40:	fff80413          	add	s0,a6,-1

00000b44 <.LVL48>:
     b44:	00c7e863          	bltu	a5,a2,b54 <.L17>
     b48:	00a7f663          	bgeu	a5,a0,b54 <.L17>
     b4c:	ffe80413          	add	s0,a6,-2
     b50:	00c787b3          	add	a5,a5,a2

00000b54 <.L17>:
     b54:	40a787b3          	sub	a5,a5,a0

00000b58 <.LVL51>:
     b58:	02b7d533          	divu	a0,a5,a1

00000b5c <.LVL52>:
     b5c:	02b7f7b3          	remu	a5,a5,a1

00000b60 <.LVL53>:
     b60:	00050593          	mv	a1,a0

00000b64 <.LVL54>:
     b64:	02a70733          	mul	a4,a4,a0

00000b68 <.LVL55>:
     b68:	01079793          	sll	a5,a5,0x10
     b6c:	02e7f263          	bgeu	a5,a4,b90 <.L20>
     b70:	00c78833          	add	a6,a5,a2
     b74:	00f838b3          	sltu	a7,a6,a5
     b78:	fff50593          	add	a1,a0,-1

00000b7c <.LVL57>:
     b7c:	00080793          	mv	a5,a6
     b80:	00089863          	bnez	a7,b90 <.L20>
     b84:	00e87663          	bgeu	a6,a4,b90 <.L20>
     b88:	ffe50593          	add	a1,a0,-2
     b8c:	00c807b3          	add	a5,a6,a2

00000b90 <.L20>:
     b90:	01041413          	sll	s0,s0,0x10

00000b94 <.LBE16>:
     b94:	40e787b3          	sub	a5,a5,a4

00000b98 <.LBB17>:
     b98:	00b46433          	or	s0,s0,a1

00000b9c <.LBE17>:
     b9c:	00f037b3          	snez	a5,a5

00000ba0 <.LVL64>:
     ba0:	00f46433          	or	s0,s0,a5

00000ba4 <.L23>:
  FP_PACK_S (r, R);
     ba4:	07f48713          	add	a4,s1,127

00000ba8 <.LVL66>:
     ba8:	0ce05863          	blez	a4,c78 <.L24>
     bac:	00747793          	and	a5,s0,7
     bb0:	00078a63          	beqz	a5,bc4 <.L25>
     bb4:	00f47793          	and	a5,s0,15
     bb8:	00400613          	li	a2,4
     bbc:	00c78463          	beq	a5,a2,bc4 <.L25>
     bc0:	00440413          	add	s0,s0,4

00000bc4 <.L25>:
     bc4:	00441793          	sll	a5,s0,0x4
     bc8:	0007da63          	bgez	a5,bdc <.L26>
     bcc:	f80007b7          	lui	a5,0xf8000
     bd0:	fff78793          	add	a5,a5,-1 # f7ffffff <_ebss+0xf7fea10f>
     bd4:	00f47433          	and	s0,s0,a5
     bd8:	08048713          	add	a4,s1,128

00000bdc <.L26>:
     bdc:	0fe00793          	li	a5,254
     be0:	06e7ca63          	blt	a5,a4,c54 <.L13>
     be4:	00345793          	srl	a5,s0,0x3

00000be8 <.L14>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
     be8:	01c12083          	lw	ra,28(sp)
     bec:	01812403          	lw	s0,24(sp)

00000bf0 <.LBB19>:
  FP_PACK_S (r, R);
     bf0:	00979793          	sll	a5,a5,0x9

00000bf4 <.LVL71>:
     bf4:	01771713          	sll	a4,a4,0x17

00000bf8 <.LVL72>:
     bf8:	0097d793          	srl	a5,a5,0x9
     bfc:	00f76733          	or	a4,a4,a5
     c00:	01f69513          	sll	a0,a3,0x1f

00000c04 <.LBE19>:
}
     c04:	01412483          	lw	s1,20(sp)
     c08:	01012903          	lw	s2,16(sp)

00000c0c <.LVL74>:
     c0c:	00c12983          	lw	s3,12(sp)
     c10:	00812a03          	lw	s4,8(sp)

00000c14 <.LVL75>:
     c14:	00412a83          	lw	s5,4(sp)

00000c18 <.LVL76>:
     c18:	00a76533          	or	a0,a4,a0

00000c1c <.LVL77>:
     c1c:	02010113          	add	sp,sp,32
     c20:	00008067          	ret

00000c24 <.L15>:
  FP_DIV_S (R, A, B);
     c24:	01f99793          	sll	a5,s3,0x1f

00000c28 <.LVL79>:
     c28:	0019d993          	srl	s3,s3,0x1

00000c2c <.LVL80>:
     c2c:	ee1ff06f          	j	b0c <.L16>

00000c30 <.L11>:
  FP_UNPACK_S (A, a);
     c30:	00090693          	mv	a3,s2

00000c34 <.LBE21>:
  FP_DIV_S (R, A, B);
     c34:	00098413          	mv	s0,s3

00000c38 <.LVL83>:
     c38:	000a8713          	mv	a4,s5

00000c3c <.L9>:
  FP_PACK_S (r, R);
     c3c:	00300793          	li	a5,3
     c40:	08f70663          	beq	a4,a5,ccc <.L36>
     c44:	00100793          	li	a5,1
     c48:	08f70a63          	beq	a4,a5,cdc <.L38>
     c4c:	00200793          	li	a5,2
     c50:	f4f71ae3          	bne	a4,a5,ba4 <.L23>

00000c54 <.L13>:
     c54:	00000793          	li	a5,0
     c58:	0ff00713          	li	a4,255
     c5c:	f8dff06f          	j	be8 <.L14>

00000c60 <.L12>:
  FP_UNPACK_S (B, b);
     c60:	000a0693          	mv	a3,s4

00000c64 <.LBE22>:
  FP_DIV_S (R, A, B);
     c64:	fd9ff06f          	j	c3c <.L9>

00000c68 <.L33>:
     c68:	00400437          	lui	s0,0x400

00000c6c <.LVL89>:
     c6c:	00000693          	li	a3,0

00000c70 <.LVL90>:
     c70:	00300713          	li	a4,3

00000c74 <.LVL91>:
     c74:	fc9ff06f          	j	c3c <.L9>

00000c78 <.L24>:
  FP_PACK_S (r, R);
     c78:	00100793          	li	a5,1
     c7c:	40e787b3          	sub	a5,a5,a4

00000c80 <.LVL93>:
     c80:	01b00713          	li	a4,27
     c84:	04f74c63          	blt	a4,a5,cdc <.L38>
     c88:	09e48493          	add	s1,s1,158
     c8c:	00f457b3          	srl	a5,s0,a5

00000c90 <.LVL94>:
     c90:	00941433          	sll	s0,s0,s1

00000c94 <.LVL95>:
     c94:	00803433          	snez	s0,s0
     c98:	0087e7b3          	or	a5,a5,s0

00000c9c <.LVL96>:
     c9c:	0077f713          	and	a4,a5,7
     ca0:	00070a63          	beqz	a4,cb4 <.L27>
     ca4:	00f7f713          	and	a4,a5,15
     ca8:	00400613          	li	a2,4
     cac:	00c70463          	beq	a4,a2,cb4 <.L27>
     cb0:	00478793          	add	a5,a5,4

00000cb4 <.L27>:
     cb4:	00579713          	sll	a4,a5,0x5
     cb8:	0037d793          	srl	a5,a5,0x3

00000cbc <.LVL98>:
     cbc:	02075263          	bgez	a4,ce0 <.L53>
     cc0:	00000793          	li	a5,0
     cc4:	00100713          	li	a4,1

00000cc8 <.LVL99>:
     cc8:	f21ff06f          	j	be8 <.L14>

00000ccc <.L36>:
     ccc:	004007b7          	lui	a5,0x400
     cd0:	0ff00713          	li	a4,255

00000cd4 <.LVL101>:
     cd4:	00000693          	li	a3,0

00000cd8 <.LVL102>:
     cd8:	f11ff06f          	j	be8 <.L14>

00000cdc <.L38>:
     cdc:	00000793          	li	a5,0

00000ce0 <.L53>:
     ce0:	00000713          	li	a4,0
     ce4:	f05ff06f          	j	be8 <.L14>

00000ce8 <__mulsf3>:
#include "soft-fp.h"
#include "single.h"

SFtype
__mulsf3 (SFtype a, SFtype b)
{
     ce8:	fe010113          	add	sp,sp,-32
     cec:	01212823          	sw	s2,16(sp)
     cf0:	01755913          	srl	s2,a0,0x17
     cf4:	00912a23          	sw	s1,20(sp)
     cf8:	01312623          	sw	s3,12(sp)
     cfc:	01512223          	sw	s5,4(sp)

00000d00 <.LBB3>:
  FP_DECL_S (B);
  FP_DECL_S (R);
  SFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_S (A, a);
     d00:	00951493          	sll	s1,a0,0x9

00000d04 <.LBE3>:
{
     d04:	00112e23          	sw	ra,28(sp)
     d08:	00812c23          	sw	s0,24(sp)
     d0c:	01412423          	sw	s4,8(sp)
     d10:	0ff97913          	zext.b	s2,s2
     d14:	00058a93          	mv	s5,a1

00000d18 <.LBB4>:
  FP_UNPACK_S (A, a);
     d18:	0094d493          	srl	s1,s1,0x9

00000d1c <.LVL1>:
     d1c:	01f55993          	srl	s3,a0,0x1f

00000d20 <.LBE4>:
     d20:	10090863          	beqz	s2,e30 <.L2>
     d24:	0ff00793          	li	a5,255
     d28:	12f90463          	beq	s2,a5,e50 <.L3>

00000d2c <.LVL3>:
     d2c:	00349493          	sll	s1,s1,0x3

00000d30 <.LVL4>:
     d30:	040007b7          	lui	a5,0x4000
     d34:	00f4e4b3          	or	s1,s1,a5

00000d38 <.LVL5>:
     d38:	f8190913          	add	s2,s2,-127

00000d3c <.L50>:
     d3c:	00000a13          	li	s4,0

00000d40 <.L4>:
  FP_UNPACK_S (B, b);
     d40:	017ad793          	srl	a5,s5,0x17
     d44:	009a9413          	sll	s0,s5,0x9
     d48:	0ff7f793          	zext.b	a5,a5
     d4c:	00945413          	srl	s0,s0,0x9

00000d50 <.LVL8>:
     d50:	01fada93          	srl	s5,s5,0x1f

00000d54 <.LBE6>:
     d54:	10078e63          	beqz	a5,e70 <.L5>
     d58:	0ff00713          	li	a4,255
     d5c:	12e78a63          	beq	a5,a4,e90 <.L6>

00000d60 <.LVL10>:
     d60:	00341413          	sll	s0,s0,0x3

00000d64 <.LVL11>:
     d64:	04000737          	lui	a4,0x4000
     d68:	00e46433          	or	s0,s0,a4

00000d6c <.LVL12>:
     d6c:	f8178793          	add	a5,a5,-127 # 3ffff81 <_ebss+0x3fea091>

00000d70 <.L51>:
     d70:	00000713          	li	a4,0

00000d74 <.L7>:
  FP_MUL_S (R, A, B);
     d74:	00f90933          	add	s2,s2,a5

00000d78 <.LVL15>:
     d78:	002a1793          	sll	a5,s4,0x2

00000d7c <.LVL16>:
     d7c:	00e7e7b3          	or	a5,a5,a4
     d80:	00a00613          	li	a2,10
     d84:	00190693          	add	a3,s2,1

00000d88 <.LVL17>:
     d88:	1ef64263          	blt	a2,a5,f6c <.L8>
     d8c:	00200613          	li	a2,2
     d90:	0159c9b3          	xor	s3,s3,s5

00000d94 <.LVL18>:
     d94:	10f64e63          	blt	a2,a5,eb0 <.L9>
     d98:	fff78793          	add	a5,a5,-1
     d9c:	00100613          	li	a2,1
     da0:	12f67a63          	bgeu	a2,a5,ed4 <.L11>

00000da4 <.L10>:
     da4:	00010837          	lui	a6,0x10
     da8:	fff80513          	add	a0,a6,-1 # ffff <.LVL314+0x7>
     dac:	0104d613          	srl	a2,s1,0x10

00000db0 <.LVL20>:
     db0:	01045793          	srl	a5,s0,0x10

00000db4 <.LVL21>:
     db4:	00a4f4b3          	and	s1,s1,a0

00000db8 <.LVL22>:
     db8:	00a47433          	and	s0,s0,a0

00000dbc <.LVL23>:
     dbc:	029405b3          	mul	a1,s0,s1

00000dc0 <.LVL24>:
     dc0:	02860433          	mul	s0,a2,s0

00000dc4 <.LVL25>:
     dc4:	02f60633          	mul	a2,a2,a5

00000dc8 <.LVL26>:
     dc8:	029787b3          	mul	a5,a5,s1

00000dcc <.LVL27>:
     dcc:	00878733          	add	a4,a5,s0

00000dd0 <.LVL28>:
     dd0:	0105d793          	srl	a5,a1,0x10

00000dd4 <.LVL29>:
     dd4:	00e787b3          	add	a5,a5,a4

00000dd8 <.LVL30>:
     dd8:	0087f463          	bgeu	a5,s0,de0 <.L15>
     ddc:	01060633          	add	a2,a2,a6

00000de0 <.L15>:
     de0:	00a7f733          	and	a4,a5,a0
     de4:	01071713          	sll	a4,a4,0x10
     de8:	00a5f5b3          	and	a1,a1,a0

00000dec <.LVL32>:
     dec:	00b70733          	add	a4,a4,a1

00000df0 <.LBB11>:
     df0:	0107d793          	srl	a5,a5,0x10

00000df4 <.LBE11>:
     df4:	00671413          	sll	s0,a4,0x6

00000df8 <.LBB13>:
     df8:	00c787b3          	add	a5,a5,a2

00000dfc <.LBE13>:
     dfc:	01a75713          	srl	a4,a4,0x1a

00000e00 <.LVL37>:
     e00:	00679793          	sll	a5,a5,0x6

00000e04 <.LVL38>:
     e04:	00803433          	snez	s0,s0
     e08:	00e46433          	or	s0,s0,a4

00000e0c <.LBE8>:
     e0c:	00479713          	sll	a4,a5,0x4

00000e10 <.LBB16>:
     e10:	0087e433          	or	s0,a5,s0

00000e14 <.LBE16>:
     e14:	00075a63          	bgez	a4,e28 <.L16>
     e18:	00145793          	srl	a5,s0,0x1
     e1c:	00147413          	and	s0,s0,1

00000e20 <.LVL40>:
     e20:	0087e433          	or	s0,a5,s0

00000e24 <.LVL41>:
     e24:	00068913          	mv	s2,a3

00000e28 <.L16>:
     e28:	00090693          	mv	a3,s2
     e2c:	0c00006f          	j	eec <.L22>

00000e30 <.L2>:
  FP_UNPACK_S (A, a);
     e30:	02048a63          	beqz	s1,e64 <.L23>

00000e34 <.LBB17>:
     e34:	00048513          	mv	a0,s1

00000e38 <.LVL44>:
     e38:	7dc000ef          	jal	1614 <__clzsi2>

00000e3c <.LVL45>:
     e3c:	ffb50793          	add	a5,a0,-5
     e40:	f8a00913          	li	s2,-118

00000e44 <.LVL46>:
     e44:	00f494b3          	sll	s1,s1,a5
     e48:	40a90933          	sub	s2,s2,a0
     e4c:	ef1ff06f          	j	d3c <.L50>

00000e50 <.L3>:
     e50:	0ff00913          	li	s2,255

00000e54 <.LBE18>:
     e54:	00200a13          	li	s4,2
     e58:	ee0484e3          	beqz	s1,d40 <.L4>
     e5c:	00300a13          	li	s4,3
     e60:	ee1ff06f          	j	d40 <.L4>

00000e64 <.L23>:
     e64:	00000913          	li	s2,0

00000e68 <.LBE19>:
     e68:	00100a13          	li	s4,1
     e6c:	ed5ff06f          	j	d40 <.L4>

00000e70 <.L5>:
  FP_UNPACK_S (B, b);
     e70:	02040a63          	beqz	s0,ea4 <.L25>

00000e74 <.LBB20>:
     e74:	00040513          	mv	a0,s0
     e78:	79c000ef          	jal	1614 <__clzsi2>

00000e7c <.LVL53>:
     e7c:	ffb50793          	add	a5,a0,-5
     e80:	00f41433          	sll	s0,s0,a5
     e84:	f8a00793          	li	a5,-118
     e88:	40a787b3          	sub	a5,a5,a0
     e8c:	ee5ff06f          	j	d70 <.L51>

00000e90 <.L6>:
     e90:	0ff00793          	li	a5,255

00000e94 <.LBE21>:
     e94:	00200713          	li	a4,2
     e98:	ec040ee3          	beqz	s0,d74 <.L7>
     e9c:	00300713          	li	a4,3
     ea0:	ed5ff06f          	j	d74 <.L7>

00000ea4 <.L25>:
     ea4:	00000793          	li	a5,0

00000ea8 <.LBE22>:
     ea8:	00100713          	li	a4,1
     eac:	ec9ff06f          	j	d74 <.L7>

00000eb0 <.L9>:
     eb0:	00100613          	li	a2,1
     eb4:	00f617b3          	sll	a5,a2,a5
  FP_MUL_S (R, A, B);
     eb8:	5307f613          	and	a2,a5,1328
     ebc:	0c061063          	bnez	a2,f7c <.L27>
     ec0:	2407f613          	and	a2,a5,576
     ec4:	12061263          	bnez	a2,fe8 <.L30>
     ec8:	0887f793          	and	a5,a5,136
     ecc:	ec078ce3          	beqz	a5,da4 <.L10>

00000ed0 <.L13>:
  FP_UNPACK_S (B, b);
     ed0:	000a8993          	mv	s3,s5

00000ed4 <.L11>:
  FP_PACK_S (r, R);
     ed4:	00200793          	li	a5,2
     ed8:	10f70263          	beq	a4,a5,fdc <.L17>
     edc:	00300793          	li	a5,3
     ee0:	10f70463          	beq	a4,a5,fe8 <.L30>
     ee4:	00100793          	li	a5,1
     ee8:	10f70863          	beq	a4,a5,ff8 <.L32>

00000eec <.L22>:
     eec:	07f68713          	add	a4,a3,127 # 7f80007f <_ebss+0x7f7ea18f>

00000ef0 <.LVL62>:
     ef0:	08e05c63          	blez	a4,f88 <.L18>
     ef4:	00747793          	and	a5,s0,7
     ef8:	00078a63          	beqz	a5,f0c <.L19>
     efc:	00f47793          	and	a5,s0,15
     f00:	00400613          	li	a2,4
     f04:	00c78463          	beq	a5,a2,f0c <.L19>
     f08:	00440413          	add	s0,s0,4 # 400004 <_ebss+0x3ea114>

00000f0c <.L19>:
     f0c:	00441793          	sll	a5,s0,0x4
     f10:	0007da63          	bgez	a5,f24 <.L20>
     f14:	f80007b7          	lui	a5,0xf8000
     f18:	fff78793          	add	a5,a5,-1 # f7ffffff <_ebss+0xf7fea10f>
     f1c:	00f47433          	and	s0,s0,a5
     f20:	08068713          	add	a4,a3,128

00000f24 <.L20>:
     f24:	0fe00793          	li	a5,254
     f28:	0ae7ca63          	blt	a5,a4,fdc <.L17>
     f2c:	00345793          	srl	a5,s0,0x3

00000f30 <.L12>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
     f30:	01c12083          	lw	ra,28(sp)
     f34:	01812403          	lw	s0,24(sp)

00000f38 <.LBB25>:
  FP_PACK_S (r, R);
     f38:	00979793          	sll	a5,a5,0x9

00000f3c <.LVL67>:
     f3c:	01771513          	sll	a0,a4,0x17
     f40:	0097d793          	srl	a5,a5,0x9
     f44:	01f99993          	sll	s3,s3,0x1f

00000f48 <.LVL68>:
     f48:	00f56533          	or	a0,a0,a5

00000f4c <.LBE25>:
}
     f4c:	01412483          	lw	s1,20(sp)
     f50:	01012903          	lw	s2,16(sp)
     f54:	00812a03          	lw	s4,8(sp)

00000f58 <.LVL69>:
     f58:	00412a83          	lw	s5,4(sp)

00000f5c <.LBB26>:
  FP_PACK_S (r, R);
     f5c:	01356533          	or	a0,a0,s3

00000f60 <.LBE26>:
}
     f60:	00c12983          	lw	s3,12(sp)
     f64:	02010113          	add	sp,sp,32
     f68:	00008067          	ret

00000f6c <.L8>:
  FP_MUL_S (R, A, B);
     f6c:	00f00613          	li	a2,15
     f70:	06c78c63          	beq	a5,a2,fe8 <.L30>
     f74:	00b00613          	li	a2,11
     f78:	f4c78ce3          	beq	a5,a2,ed0 <.L13>

00000f7c <.L27>:
     f7c:	00048413          	mv	s0,s1

00000f80 <.LVL74>:
     f80:	000a0713          	mv	a4,s4

00000f84 <.LVL75>:
     f84:	f51ff06f          	j	ed4 <.L11>

00000f88 <.L18>:
  FP_PACK_S (r, R);
     f88:	00100793          	li	a5,1
     f8c:	40e787b3          	sub	a5,a5,a4

00000f90 <.LVL77>:
     f90:	01b00713          	li	a4,27
     f94:	06f74263          	blt	a4,a5,ff8 <.L32>
     f98:	09e68693          	add	a3,a3,158
     f9c:	00d416b3          	sll	a3,s0,a3
     fa0:	00f457b3          	srl	a5,s0,a5

00000fa4 <.LVL78>:
     fa4:	00d036b3          	snez	a3,a3
     fa8:	00d7e7b3          	or	a5,a5,a3

00000fac <.LVL79>:
     fac:	0077f713          	and	a4,a5,7
     fb0:	00070a63          	beqz	a4,fc4 <.L21>
     fb4:	00f7f713          	and	a4,a5,15
     fb8:	00400693          	li	a3,4
     fbc:	00d70463          	beq	a4,a3,fc4 <.L21>
     fc0:	00478793          	add	a5,a5,4

00000fc4 <.L21>:
     fc4:	00579713          	sll	a4,a5,0x5
     fc8:	0037d793          	srl	a5,a5,0x3

00000fcc <.LVL81>:
     fcc:	02075863          	bgez	a4,ffc <.L52>
     fd0:	00000793          	li	a5,0
     fd4:	00100713          	li	a4,1
     fd8:	f59ff06f          	j	f30 <.L12>

00000fdc <.L17>:
     fdc:	00000793          	li	a5,0
     fe0:	0ff00713          	li	a4,255
     fe4:	f4dff06f          	j	f30 <.L12>

00000fe8 <.L30>:
     fe8:	004007b7          	lui	a5,0x400
     fec:	0ff00713          	li	a4,255
     ff0:	00000993          	li	s3,0
     ff4:	f3dff06f          	j	f30 <.L12>

00000ff8 <.L32>:
     ff8:	00000793          	li	a5,0

00000ffc <.L52>:
     ffc:	00000713          	li	a4,0
    1000:	f31ff06f          	j	f30 <.L12>

00001004 <__subsf3>:
  FP_DECL_S (B);
  FP_DECL_S (R);
  SFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_S (A, a);
    1004:	008006b7          	lui	a3,0x800
    1008:	fff68693          	add	a3,a3,-1 # 7fffff <_ebss+0x7ea10f>

0000100c <.LBE2>:
{
    100c:	ff010113          	add	sp,sp,-16

00001010 <.LBB3>:
  FP_UNPACK_SEMIRAW_S (A, a);
    1010:	00a6f633          	and	a2,a3,a0

00001014 <.LVL1>:
    1014:	01755713          	srl	a4,a0,0x17

00001018 <.LBE3>:
{
    1018:	00812423          	sw	s0,8(sp)

0000101c <.LBB4>:
  FP_UNPACK_SEMIRAW_S (A, a);
    101c:	01f55413          	srl	s0,a0,0x1f

00001020 <.LBE4>:
    1020:	00361513          	sll	a0,a2,0x3

00001024 <.LBB5>:
  FP_UNPACK_SEMIRAW_S (B, b);
    1024:	0175d613          	srl	a2,a1,0x17

00001028 <.LVL3>:
    1028:	00b6f6b3          	and	a3,a3,a1

0000102c <.LBE5>:
{
    102c:	01212023          	sw	s2,0(sp)
    1030:	00112623          	sw	ra,12(sp)

00001034 <.LBB6>:
  FP_UNPACK_SEMIRAW_S (A, a);
    1034:	0ff77913          	zext.b	s2,a4

00001038 <.LBB7>:
{
    1038:	00912223          	sw	s1,4(sp)

0000103c <.LBB8>:
  FP_UNPACK_SEMIRAW_S (B, b);
    103c:	0ff67613          	zext.b	a2,a2

00001040 <.LBE8>:
  FP_SUB_S (R, A, B);
    1040:	0ff00713          	li	a4,255

00001044 <.LBB9>:
  FP_UNPACK_SEMIRAW_S (B, b);
    1044:	01f5d593          	srl	a1,a1,0x1f

00001048 <.LBE9>:
    1048:	00369793          	sll	a5,a3,0x3

0000104c <.LVL7>:
  FP_SUB_S (R, A, B);
    104c:	00e61463          	bne	a2,a4,1054 <.L2>
    1050:	00079463          	bnez	a5,1058 <.L3>

00001054 <.L2>:
    1054:	0015c593          	xor	a1,a1,1

00001058 <.L3>:
    1058:	40c906b3          	sub	a3,s2,a2

0000105c <.LBE10>:
    105c:	18859063          	bne	a1,s0,11dc <.L4>

00001060 <.LBB11>:
    1060:	08d05c63          	blez	a3,10f8 <.L5>

00001064 <.LVL10>:
    1064:	02061663          	bnez	a2,1090 <.L6>
    1068:	02078063          	beqz	a5,1088 <.L64>
    106c:	fff90693          	add	a3,s2,-1
    1070:	00069863          	bnez	a3,1080 <.L8>

00001074 <.L97>:
    1074:	00a787b3          	add	a5,a5,a0

00001078 <.LVL13>:
    1078:	00100913          	li	s2,1

0000107c <.LVL14>:
    107c:	04c0006f          	j	10c8 <.L9>

00001080 <.L8>:
    1080:	0ff00713          	li	a4,255
    1084:	00e91e63          	bne	s2,a4,10a0 <.L10>

00001088 <.L64>:
    1088:	00050793          	mv	a5,a0

0000108c <.LVL17>:
    108c:	10c0006f          	j	1198 <.L38>

00001090 <.L6>:
    1090:	0ff00713          	li	a4,255
    1094:	fee90ae3          	beq	s2,a4,1088 <.L64>
    1098:	04000737          	lui	a4,0x4000
    109c:	00e7e7b3          	or	a5,a5,a4

000010a0 <.L10>:
    10a0:	01b00613          	li	a2,27

000010a4 <.LVL20>:
    10a4:	00100713          	li	a4,1
    10a8:	00d64e63          	blt	a2,a3,10c4 <.L11>
    10ac:	02000613          	li	a2,32
    10b0:	00d7d733          	srl	a4,a5,a3
    10b4:	40d606b3          	sub	a3,a2,a3

000010b8 <.LVL21>:
    10b8:	00d796b3          	sll	a3,a5,a3
    10bc:	00d036b3          	snez	a3,a3
    10c0:	00d76733          	or	a4,a4,a3

000010c4 <.L11>:
    10c4:	00a707b3          	add	a5,a4,a0

000010c8 <.L9>:
    10c8:	00579713          	sll	a4,a5,0x5
    10cc:	0c075663          	bgez	a4,1198 <.L38>

000010d0 <.LVL24>:
    10d0:	00190913          	add	s2,s2,1

000010d4 <.LVL25>:
    10d4:	0ff00713          	li	a4,255
    10d8:	2ce90a63          	beq	s2,a4,13ac <.L54>
    10dc:	7e000737          	lui	a4,0x7e000
    10e0:	0017f693          	and	a3,a5,1

000010e4 <.LVL26>:
    10e4:	fff70713          	add	a4,a4,-1 # 7dffffff <_ebss+0x7dfea10f>
    10e8:	0017d793          	srl	a5,a5,0x1

000010ec <.LVL27>:
    10ec:	00e7f7b3          	and	a5,a5,a4

000010f0 <.LVL28>:
    10f0:	00d7e7b3          	or	a5,a5,a3
    10f4:	0a40006f          	j	1198 <.L38>

000010f8 <.L5>:
    10f8:	06068663          	beqz	a3,1164 <.L12>
    10fc:	41260733          	sub	a4,a2,s2

00001100 <.LVL30>:
    1100:	02091063          	bnez	s2,1120 <.L13>
    1104:	0c050863          	beqz	a0,11d4 <.L46>
    1108:	fff70693          	add	a3,a4,-1

0000110c <.LVL31>:
    110c:	f60684e3          	beqz	a3,1074 <.L97>
    1110:	0ff00593          	li	a1,255

00001114 <.LVL32>:
    1114:	02b71063          	bne	a4,a1,1134 <.L15>

00001118 <.L99>:
    1118:	0ff00913          	li	s2,255

0000111c <.LVL34>:
    111c:	07c0006f          	j	1198 <.L38>

00001120 <.L13>:
    1120:	0ff00693          	li	a3,255
    1124:	fed60ae3          	beq	a2,a3,1118 <.L99>
    1128:	040006b7          	lui	a3,0x4000
    112c:	00d56533          	or	a0,a0,a3
    1130:	00070693          	mv	a3,a4

00001134 <.L15>:
    1134:	01b00593          	li	a1,27
    1138:	00100713          	li	a4,1
    113c:	00d5ce63          	blt	a1,a3,1158 <.L16>
    1140:	02000713          	li	a4,32
    1144:	40d70733          	sub	a4,a4,a3
    1148:	00e51733          	sll	a4,a0,a4
    114c:	00d555b3          	srl	a1,a0,a3
    1150:	00e03733          	snez	a4,a4
    1154:	00e5e733          	or	a4,a1,a4

00001158 <.L16>:
    1158:	00e787b3          	add	a5,a5,a4

0000115c <.LVL39>:
    115c:	00060913          	mv	s2,a2

00001160 <.LVL40>:
    1160:	f69ff06f          	j	10c8 <.L9>

00001164 <.L12>:
    1164:	00190713          	add	a4,s2,1
    1168:	0fe77693          	and	a3,a4,254
    116c:	04069c63          	bnez	a3,11c4 <.L17>
    1170:	04091263          	bnez	s2,11b4 <.L18>

00001174 <.LVL42>:
    1174:	02050263          	beqz	a0,1198 <.L38>
    1178:	f00788e3          	beqz	a5,1088 <.L64>
    117c:	00a787b3          	add	a5,a5,a0

00001180 <.LVL43>:
    1180:	00579713          	sll	a4,a5,0x5
    1184:	00075a63          	bgez	a4,1198 <.L38>
    1188:	fc000737          	lui	a4,0xfc000
    118c:	fff70713          	add	a4,a4,-1 # fbffffff <_ebss+0xfbfea10f>
    1190:	00e7f7b3          	and	a5,a5,a4

00001194 <.LVL44>:
    1194:	00100913          	li	s2,1

00001198 <.L38>:
  FP_PACK_SEMIRAW_S (r, R);
    1198:	0077f713          	and	a4,a5,7
    119c:	20070a63          	beqz	a4,13b0 <.L39>
    11a0:	00f7f713          	and	a4,a5,15
    11a4:	00400693          	li	a3,4
    11a8:	20d70463          	beq	a4,a3,13b0 <.L39>
    11ac:	00478793          	add	a5,a5,4 # 400004 <_ebss+0x3ea114>
    11b0:	2000006f          	j	13b0 <.L39>

000011b4 <.L18>:
  FP_SUB_S (R, A, B);
    11b4:	f60502e3          	beqz	a0,1118 <.L99>

000011b8 <.L34>:
    11b8:	16079663          	bnez	a5,1324 <.L66>
    11bc:	00050793          	mv	a5,a0

000011c0 <.LVL49>:
    11c0:	f59ff06f          	j	1118 <.L99>

000011c4 <.L17>:
    11c4:	0ff00693          	li	a3,255
    11c8:	1ed70063          	beq	a4,a3,13a8 <.L53>
    11cc:	00f507b3          	add	a5,a0,a5

000011d0 <.LVL51>:
    11d0:	0017d793          	srl	a5,a5,0x1

000011d4 <.L46>:
    11d4:	00070913          	mv	s2,a4

000011d8 <.LVL53>:
    11d8:	fc1ff06f          	j	1198 <.L38>

000011dc <.L4>:
    11dc:	06d05e63          	blez	a3,1258 <.L19>

000011e0 <.LVL55>:
    11e0:	06061263          	bnez	a2,1244 <.L20>
    11e4:	ea0782e3          	beqz	a5,1088 <.L64>
    11e8:	fff90693          	add	a3,s2,-1

000011ec <.LVL56>:
    11ec:	00069863          	bnez	a3,11fc <.L21>
    11f0:	40f507b3          	sub	a5,a0,a5

000011f4 <.L98>:
    11f4:	00100913          	li	s2,1

000011f8 <.LVL58>:
    11f8:	0340006f          	j	122c <.L22>

000011fc <.L21>:
    11fc:	0ff00713          	li	a4,255
    1200:	e8e904e3          	beq	s2,a4,1088 <.L64>

00001204 <.L23>:
    1204:	01b00613          	li	a2,27

00001208 <.LVL61>:
    1208:	00100713          	li	a4,1
    120c:	00d64e63          	blt	a2,a3,1228 <.L24>
    1210:	02000613          	li	a2,32
    1214:	00d7d733          	srl	a4,a5,a3
    1218:	40d606b3          	sub	a3,a2,a3

0000121c <.LVL62>:
    121c:	00d796b3          	sll	a3,a5,a3
    1220:	00d036b3          	snez	a3,a3
    1224:	00d76733          	or	a4,a4,a3

00001228 <.L24>:
    1228:	40e507b3          	sub	a5,a0,a4

0000122c <.L22>:
    122c:	00579713          	sll	a4,a5,0x5
    1230:	f60754e3          	bgez	a4,1198 <.L38>

00001234 <.LBB13>:
    1234:	040004b7          	lui	s1,0x4000
    1238:	fff48493          	add	s1,s1,-1 # 3ffffff <_ebss+0x3fea10f>
    123c:	0097f4b3          	and	s1,a5,s1

00001240 <.LVL65>:
    1240:	1080006f          	j	1348 <.L36>

00001244 <.L20>:
    1244:	0ff00713          	li	a4,255
    1248:	e4e900e3          	beq	s2,a4,1088 <.L64>
    124c:	04000737          	lui	a4,0x4000
    1250:	00e7e7b3          	or	a5,a5,a4
    1254:	fb1ff06f          	j	1204 <.L23>

00001258 <.L19>:
    1258:	06068e63          	beqz	a3,12d4 <.L25>
    125c:	41260733          	sub	a4,a2,s2

00001260 <.LVL69>:
    1260:	02091663          	bnez	s2,128c <.L26>
    1264:	1a050e63          	beqz	a0,1420 <.L59>
    1268:	fff70693          	add	a3,a4,-1 # 3ffffff <_ebss+0x3fea10f>

0000126c <.LVL70>:
    126c:	00069863          	bnez	a3,127c <.L27>
    1270:	40a787b3          	sub	a5,a5,a0

00001274 <.LVL71>:
    1274:	00058413          	mv	s0,a1

00001278 <.LVL72>:
    1278:	f7dff06f          	j	11f4 <.L98>

0000127c <.L27>:
    127c:	0ff00813          	li	a6,255
    1280:	03071063          	bne	a4,a6,12a0 <.L28>

00001284 <.L61>:
    1284:	0ff00913          	li	s2,255

00001288 <.LVL75>:
    1288:	19c0006f          	j	1424 <.L63>

0000128c <.L26>:
    128c:	0ff00693          	li	a3,255
    1290:	fed60ae3          	beq	a2,a3,1284 <.L61>
    1294:	040006b7          	lui	a3,0x4000
    1298:	00d56533          	or	a0,a0,a3
    129c:	00070693          	mv	a3,a4

000012a0 <.L28>:
    12a0:	01b00813          	li	a6,27
    12a4:	00100713          	li	a4,1
    12a8:	00d84e63          	blt	a6,a3,12c4 <.L29>
    12ac:	02000713          	li	a4,32
    12b0:	40d70733          	sub	a4,a4,a3
    12b4:	00e51733          	sll	a4,a0,a4
    12b8:	00d55833          	srl	a6,a0,a3
    12bc:	00e03733          	snez	a4,a4
    12c0:	00e86733          	or	a4,a6,a4

000012c4 <.L29>:
    12c4:	40e787b3          	sub	a5,a5,a4

000012c8 <.LVL80>:
    12c8:	00060913          	mv	s2,a2

000012cc <.LVL81>:
    12cc:	00058413          	mv	s0,a1

000012d0 <.LVL82>:
    12d0:	f5dff06f          	j	122c <.L22>

000012d4 <.L25>:
    12d4:	00190713          	add	a4,s2,1
    12d8:	0fe77713          	and	a4,a4,254
    12dc:	04071c63          	bnez	a4,1334 <.L30>
    12e0:	02091c63          	bnez	s2,1318 <.L31>

000012e4 <.LVL84>:
    12e4:	00051863          	bnez	a0,12f4 <.L32>

000012e8 <.LVL85>:
    12e8:	12079e63          	bnez	a5,1424 <.L63>

000012ec <.L100>:
    12ec:	00000413          	li	s0,0

000012f0 <.LVL87>:
    12f0:	0c00006f          	j	13b0 <.L39>

000012f4 <.L32>:
    12f4:	d8078ae3          	beqz	a5,1088 <.L64>
    12f8:	40f50733          	sub	a4,a0,a5

000012fc <.LVL89>:
    12fc:	00571693          	sll	a3,a4,0x5
    1300:	40a787b3          	sub	a5,a5,a0

00001304 <.LVL90>:
    1304:	1206c063          	bltz	a3,1424 <.L63>
    1308:	00070793          	mv	a5,a4
    130c:	e80716e3          	bnez	a4,1198 <.L38>
    1310:	00000793          	li	a5,0
    1314:	fd9ff06f          	j	12ec <.L100>

00001318 <.L31>:
    1318:	ea0510e3          	bnez	a0,11b8 <.L34>
    131c:	00058413          	mv	s0,a1

00001320 <.LVL92>:
    1320:	de079ce3          	bnez	a5,1118 <.L99>

00001324 <.L66>:
    1324:	00000413          	li	s0,0
    1328:	020007b7          	lui	a5,0x2000

0000132c <.LVL94>:
    132c:	0ff00913          	li	s2,255

00001330 <.LVL95>:
    1330:	0800006f          	j	13b0 <.L39>

00001334 <.L30>:
    1334:	40f504b3          	sub	s1,a0,a5

00001338 <.LVL97>:
    1338:	00549713          	sll	a4,s1,0x5
    133c:	04075463          	bgez	a4,1384 <.L35>
    1340:	40a784b3          	sub	s1,a5,a0

00001344 <.LVL98>:
    1344:	00058413          	mv	s0,a1

00001348 <.L36>:
    1348:	00048513          	mv	a0,s1
    134c:	2c8000ef          	jal	1614 <__clzsi2>

00001350 <.LVL100>:
    1350:	ffb50513          	add	a0,a0,-5
    1354:	00a494b3          	sll	s1,s1,a0
    1358:	03254e63          	blt	a0,s2,1394 <.L37>
    135c:	41250533          	sub	a0,a0,s2

00001360 <.LVL103>:
    1360:	00150513          	add	a0,a0,1

00001364 <.LVL104>:
    1364:	02000713          	li	a4,32
    1368:	40a70733          	sub	a4,a4,a0
    136c:	00a4d7b3          	srl	a5,s1,a0
    1370:	00e494b3          	sll	s1,s1,a4

00001374 <.LVL105>:
    1374:	009034b3          	snez	s1,s1
    1378:	0097e7b3          	or	a5,a5,s1

0000137c <.LVL106>:
    137c:	00000913          	li	s2,0
    1380:	e19ff06f          	j	1198 <.L38>

00001384 <.L35>:
    1384:	fc0492e3          	bnez	s1,1348 <.L36>
    1388:	00000793          	li	a5,0

0000138c <.LVL108>:
    138c:	00000913          	li	s2,0

00001390 <.LVL109>:
    1390:	f5dff06f          	j	12ec <.L100>

00001394 <.L37>:
    1394:	fc0007b7          	lui	a5,0xfc000
    1398:	fff78793          	add	a5,a5,-1 # fbffffff <_ebss+0xfbfea10f>
    139c:	40a90933          	sub	s2,s2,a0
    13a0:	00f4f7b3          	and	a5,s1,a5

000013a4 <.LVL112>:
    13a4:	df5ff06f          	j	1198 <.L38>

000013a8 <.L53>:
    13a8:	0ff00913          	li	s2,255

000013ac <.L54>:
    13ac:	00000793          	li	a5,0

000013b0 <.L39>:
  FP_PACK_SEMIRAW_S (r, R);
    13b0:	00579713          	sll	a4,a5,0x5
    13b4:	00075e63          	bgez	a4,13d0 <.L40>

000013b8 <.LVL116>:
    13b8:	00190913          	add	s2,s2,1

000013bc <.LVL117>:
    13bc:	0ff00713          	li	a4,255
    13c0:	06e90663          	beq	s2,a4,142c <.L69>
    13c4:	fc000737          	lui	a4,0xfc000
    13c8:	fff70713          	add	a4,a4,-1 # fbffffff <_ebss+0xfbfea10f>
    13cc:	00e7f7b3          	and	a5,a5,a4

000013d0 <.L40>:
    13d0:	0ff00713          	li	a4,255
    13d4:	0037d793          	srl	a5,a5,0x3
    13d8:	00e91863          	bne	s2,a4,13e8 <.L41>
    13dc:	00078663          	beqz	a5,13e8 <.L41>
    13e0:	004007b7          	lui	a5,0x400

000013e4 <.LVL120>:
    13e4:	00000413          	li	s0,0

000013e8 <.L41>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    13e8:	00c12083          	lw	ra,12(sp)

000013ec <.LBB28>:
  FP_PACK_SEMIRAW_S (r, R);
    13ec:	01791713          	sll	a4,s2,0x17
    13f0:	01f41513          	sll	a0,s0,0x1f
    13f4:	7f8006b7          	lui	a3,0x7f800

000013f8 <.LBE28>:
}
    13f8:	00812403          	lw	s0,8(sp)

000013fc <.LBB29>:
  FP_PACK_SEMIRAW_S (r, R);
    13fc:	00979793          	sll	a5,a5,0x9

00001400 <.LVL123>:
    1400:	00d77733          	and	a4,a4,a3
    1404:	0097d793          	srl	a5,a5,0x9
    1408:	00f767b3          	or	a5,a4,a5

0000140c <.LBE29>:
}
    140c:	00412483          	lw	s1,4(sp)
    1410:	00012903          	lw	s2,0(sp)

00001414 <.LVL125>:
    1414:	00a7e533          	or	a0,a5,a0

00001418 <.LVL126>:
    1418:	01010113          	add	sp,sp,16
    141c:	00008067          	ret

00001420 <.L59>:
  FP_SUB_S (R, A, B);
    1420:	00070913          	mv	s2,a4

00001424 <.L63>:
    1424:	00058413          	mv	s0,a1

00001428 <.LVL129>:
    1428:	d71ff06f          	j	1198 <.L38>

0000142c <.L69>:
    142c:	00000793          	li	a5,0

00001430 <.LVL131>:
    1430:	fa1ff06f          	j	13d0 <.L40>

00001434 <__fixsfsi>:
  FP_DECL_EX;
  FP_DECL_S (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_S (A, a);
    1434:	00800637          	lui	a2,0x800
    1438:	01755713          	srl	a4,a0,0x17
    143c:	fff60793          	add	a5,a2,-1 # 7fffff <_ebss+0x7ea10f>
    1440:	0ff77713          	zext.b	a4,a4

00001444 <.LBE2>:
  FP_TO_INT_S (r, A, SI_BITS, 1);
    1444:	07e00593          	li	a1,126

00001448 <.LBB3>:
  FP_UNPACK_RAW_S (A, a);
    1448:	00a7f7b3          	and	a5,a5,a0

0000144c <.LVL1>:
    144c:	01f55693          	srl	a3,a0,0x1f

00001450 <.LBE3>:
  FP_TO_INT_S (r, A, SI_BITS, 1);
    1450:	04e5d663          	bge	a1,a4,149c <.L6>
    1454:	09d00593          	li	a1,157
    1458:	00e5da63          	bge	a1,a4,146c <.L3>

0000145c <.LVL3>:
    145c:	80000537          	lui	a0,0x80000

00001460 <.LVL4>:
    1460:	fff50513          	add	a0,a0,-1 # 7fffffff <_ebss+0x7ffea10f>
    1464:	00a68533          	add	a0,a3,a0

00001468 <.LVL5>:
    1468:	00008067          	ret

0000146c <.L3>:
    146c:	00c7e533          	or	a0,a5,a2

00001470 <.LVL7>:
    1470:	09500793          	li	a5,149
    1474:	00e7dc63          	bge	a5,a4,148c <.L4>

00001478 <.LVL8>:
    1478:	f6a70713          	add	a4,a4,-150

0000147c <.LVL9>:
    147c:	00e51533          	sll	a0,a0,a4

00001480 <.L5>:
    1480:	02068063          	beqz	a3,14a0 <.L2>
    1484:	40a00533          	neg	a0,a0
    1488:	00008067          	ret

0000148c <.L4>:
    148c:	09600793          	li	a5,150
    1490:	40e787b3          	sub	a5,a5,a4
    1494:	00f55533          	srl	a0,a0,a5

00001498 <.LVL13>:
    1498:	fe9ff06f          	j	1480 <.L5>

0000149c <.L6>:
    149c:	00000513          	li	a0,0

000014a0 <.L2>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    14a0:	00008067          	ret

000014a4 <__fixunssfsi>:
  FP_DECL_EX;
  FP_DECL_S (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_S (A, a);
    14a4:	008005b7          	lui	a1,0x800
    14a8:	01755793          	srl	a5,a0,0x17
    14ac:	fff58693          	add	a3,a1,-1 # 7fffff <_ebss+0x7ea10f>
    14b0:	0ff7f793          	zext.b	a5,a5

000014b4 <.LBE2>:
  FP_TO_INT_S (r, A, SI_BITS, 0);
    14b4:	07e00613          	li	a2,126

000014b8 <.LBB3>:
  FP_UNPACK_RAW_S (A, a);
    14b8:	00a6f6b3          	and	a3,a3,a0

000014bc <.LVL1>:
    14bc:	01f55713          	srl	a4,a0,0x1f

000014c0 <.LBE3>:
  FP_TO_INT_S (r, A, SI_BITS, 0);
    14c0:	04f65263          	bge	a2,a5,1504 <.L8>
    14c4:	00174613          	xor	a2,a4,1
    14c8:	09e60613          	add	a2,a2,158
    14cc:	fff70513          	add	a0,a4,-1

000014d0 <.LVL3>:
    14d0:	02c7dc63          	bge	a5,a2,1508 <.L1>
    14d4:	00000513          	li	a0,0
    14d8:	02071863          	bnez	a4,1508 <.L1>

000014dc <.LBB4>:
    14dc:	09500713          	li	a4,149

000014e0 <.LVL5>:
    14e0:	00b6e533          	or	a0,a3,a1

000014e4 <.LVL6>:
    14e4:	00f75863          	bge	a4,a5,14f4 <.L7>

000014e8 <.LVL7>:
    14e8:	f6a78793          	add	a5,a5,-150 # 3fff6a <_ebss+0x3ea07a>

000014ec <.LVL8>:
    14ec:	00f51533          	sll	a0,a0,a5

000014f0 <.LVL9>:
    14f0:	00008067          	ret

000014f4 <.L7>:
    14f4:	09600713          	li	a4,150
    14f8:	40f707b3          	sub	a5,a4,a5

000014fc <.LVL11>:
    14fc:	00f55533          	srl	a0,a0,a5

00001500 <.LVL12>:
    1500:	00008067          	ret

00001504 <.L8>:
    1504:	00000513          	li	a0,0

00001508 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    1508:	00008067          	ret

0000150c <__floatsisf>:
#include "soft-fp.h"
#include "single.h"

SFtype
__floatsisf (SItype i)
{
    150c:	ff010113          	add	sp,sp,-16
    1510:	00112623          	sw	ra,12(sp)
    1514:	00812423          	sw	s0,8(sp)
    1518:	00912223          	sw	s1,4(sp)
    151c:	00050793          	mv	a5,a0

00001520 <.LBB10>:
  FP_DECL_EX;
  FP_DECL_S (A);
  SFtype a;

  FP_INIT_ROUNDMODE;
  FP_FROM_INT_S (A, i, SI_BITS, USItype);
    1520:	0e050063          	beqz	a0,1600 <.L9>

00001524 <.LBB3>:
    1524:	41f55713          	sra	a4,a0,0x1f
    1528:	00a74433          	xor	s0,a4,a0
    152c:	40e40433          	sub	s0,s0,a4
    1530:	01f55493          	srl	s1,a0,0x1f

00001534 <.LBB4>:
    1534:	00040513          	mv	a0,s0

00001538 <.LVL3>:
    1538:	0dc000ef          	jal	1614 <__clzsi2>

0000153c <.LVL4>:
    153c:	09e00793          	li	a5,158
    1540:	40a787b3          	sub	a5,a5,a0

00001544 <.LBE4>:
    1544:	09600713          	li	a4,150
    1548:	04f74063          	blt	a4,a5,1588 <.L4>

0000154c <.LVL6>:
    154c:	00800713          	li	a4,8
    1550:	0ae50e63          	beq	a0,a4,160c <.L10>
    1554:	ff850513          	add	a0,a0,-8

00001558 <.LVL7>:
    1558:	00a41433          	sll	s0,s0,a0

0000155c <.L2>:
  FP_PACK_RAW_S (a, A);
    155c:	00941413          	sll	s0,s0,0x9

00001560 <.LVL9>:
    1560:	00945413          	srl	s0,s0,0x9
    1564:	01779793          	sll	a5,a5,0x17

00001568 <.LBE11>:
  FP_HANDLE_EXCEPTIONS;

  return a;
}
    1568:	00c12083          	lw	ra,12(sp)

0000156c <.LBB12>:
  FP_PACK_RAW_S (a, A);
    156c:	0087e7b3          	or	a5,a5,s0

00001570 <.LBE12>:
}
    1570:	00812403          	lw	s0,8(sp)

00001574 <.LBB13>:
  FP_PACK_RAW_S (a, A);
    1574:	01f49513          	sll	a0,s1,0x1f

00001578 <.LBE13>:
}
    1578:	00a7e533          	or	a0,a5,a0

0000157c <.LVL12>:
    157c:	00412483          	lw	s1,4(sp)

00001580 <.LVL13>:
    1580:	01010113          	add	sp,sp,16
    1584:	00008067          	ret

00001588 <.L4>:
  FP_FROM_INT_S (A, i, SI_BITS, USItype);
    1588:	09900713          	li	a4,153
    158c:	06f75463          	bge	a4,a5,15f4 <.L5>
    1590:	00500713          	li	a4,5
    1594:	40a70733          	sub	a4,a4,a0
    1598:	01b50693          	add	a3,a0,27
    159c:	00e45733          	srl	a4,s0,a4
    15a0:	00d41433          	sll	s0,s0,a3

000015a4 <.LVL15>:
    15a4:	00803433          	snez	s0,s0
    15a8:	00876733          	or	a4,a4,s0

000015ac <.L6>:
    15ac:	fc000437          	lui	s0,0xfc000
    15b0:	fff40413          	add	s0,s0,-1 # fbffffff <_ebss+0xfbfea10f>

000015b4 <.LBB5>:
    15b4:	00777693          	and	a3,a4,7

000015b8 <.LBE5>:
    15b8:	00877433          	and	s0,a4,s0

000015bc <.LBB6>:
    15bc:	00068a63          	beqz	a3,15d0 <.L7>

000015c0 <.LVL18>:
    15c0:	00f77713          	and	a4,a4,15
    15c4:	00400693          	li	a3,4
    15c8:	00d70463          	beq	a4,a3,15d0 <.L7>
    15cc:	00440413          	add	s0,s0,4

000015d0 <.L7>:
    15d0:	00541713          	sll	a4,s0,0x5
    15d4:	00075c63          	bgez	a4,15ec <.L8>
    15d8:	fc0007b7          	lui	a5,0xfc000

000015dc <.LVL20>:
    15dc:	fff78793          	add	a5,a5,-1 # fbffffff <_ebss+0xfbfea10f>
    15e0:	00f47433          	and	s0,s0,a5
    15e4:	09f00793          	li	a5,159
    15e8:	40a787b3          	sub	a5,a5,a0

000015ec <.L8>:
    15ec:	00345413          	srl	s0,s0,0x3
    15f0:	f6dff06f          	j	155c <.L2>

000015f4 <.L5>:
    15f4:	ffb50713          	add	a4,a0,-5
    15f8:	00e41733          	sll	a4,s0,a4
    15fc:	fb1ff06f          	j	15ac <.L6>

00001600 <.L9>:
    1600:	00000493          	li	s1,0
    1604:	00000413          	li	s0,0
    1608:	f55ff06f          	j	155c <.L2>

0000160c <.L10>:
    160c:	09600793          	li	a5,150

00001610 <.LVL27>:
    1610:	f4dff06f          	j	155c <.L2>

00001614 <__clzsi2>:
  count_leading_zeros (ret, x);
    1614:	000107b7          	lui	a5,0x10
    1618:	02f57a63          	bgeu	a0,a5,164c <.L2>
    161c:	10053793          	sltiu	a5,a0,256
    1620:	0017b793          	seqz	a5,a5
    1624:	00379793          	sll	a5,a5,0x3

00001628 <.L3>:
    1628:	02000713          	li	a4,32
    162c:	40f70733          	sub	a4,a4,a5
    1630:	00f55533          	srl	a0,a0,a5

00001634 <.LVL2>:
    1634:	0000f797          	auipc	a5,0xf
    1638:	c8c7a783          	lw	a5,-884(a5) # 102c0 <.LLST90+0x1b>

0000163c <.LVL3>:
    163c:	00a787b3          	add	a5,a5,a0
    1640:	0007c503          	lbu	a0,0(a5)

00001644 <.LBE3>:
}
    1644:	40a70533          	sub	a0,a4,a0
    1648:	00008067          	ret

0000164c <.L2>:
  count_leading_zeros (ret, x);
    164c:	01000737          	lui	a4,0x1000
    1650:	01800793          	li	a5,24
    1654:	fce57ae3          	bgeu	a0,a4,1628 <.L3>
    1658:	01000793          	li	a5,16
    165c:	fcdff06f          	j	1628 <.L3>

00001660 <__GI_close>:
    1660:	03900893          	li	a7,57
    1664:	00000073          	ecall
    1668:	fffff7b7          	lui	a5,0xfffff
    166c:	00a7fc63          	bgeu	a5,a0,1684 <.L1>
    1670:	40a00533          	neg	a0,a0
    1674:	0000f797          	auipc	a5,0xf
    1678:	c207a783          	lw	a5,-992(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    167c:	00a7a023          	sw	a0,0(a5)
    1680:	fff00513          	li	a0,-1

00001684 <.L1>:
    1684:	00008067          	ret

00001688 <__close_nocancel_no_status>:
    1688:	03900893          	li	a7,57
    168c:	00000073          	ecall
    1690:	00008067          	ret

00001694 <__GI_ioctl>:
    1694:	fd010113          	add	sp,sp,-48
    1698:	02f12223          	sw	a5,36(sp)
    169c:	01810793          	add	a5,sp,24
    16a0:	03112623          	sw	a7,44(sp)
    16a4:	00c12c23          	sw	a2,24(sp)
    16a8:	00d12e23          	sw	a3,28(sp)
    16ac:	02e12023          	sw	a4,32(sp)
    16b0:	03012423          	sw	a6,40(sp)
    16b4:	00f12623          	sw	a5,12(sp)
    16b8:	01d00893          	li	a7,29
    16bc:	00000073          	ecall
    16c0:	fffff7b7          	lui	a5,0xfffff
    16c4:	00a7fc63          	bgeu	a5,a0,16dc <.L1>
    16c8:	40a00533          	neg	a0,a0
    16cc:	0000f797          	auipc	a5,0xf
    16d0:	bc87a783          	lw	a5,-1080(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    16d4:	00a7a023          	sw	a0,0(a5)
    16d8:	fff00513          	li	a0,-1

000016dc <.L1>:
    16dc:	03010113          	add	sp,sp,48
    16e0:	00008067          	ret

000016e4 <__GI_lseek>:
    16e4:	00058793          	mv	a5,a1
    16e8:	ff010113          	add	sp,sp,-16
    16ec:	00060713          	mv	a4,a2
    16f0:	41f5d593          	sra	a1,a1,0x1f
    16f4:	00078613          	mv	a2,a5
    16f8:	00810693          	add	a3,sp,8
    16fc:	03e00893          	li	a7,62
    1700:	00000073          	ecall
    1704:	fffff7b7          	lui	a5,0xfffff
    1708:	02a7f063          	bgeu	a5,a0,1728 <.L2>
    170c:	40a00533          	neg	a0,a0
    1710:	0000f797          	auipc	a5,0xf
    1714:	b847a783          	lw	a5,-1148(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    1718:	00a7a023          	sw	a0,0(a5)
    171c:	fff00513          	li	a0,-1

00001720 <.L1>:
    1720:	01010113          	add	sp,sp,16
    1724:	00008067          	ret

00001728 <.L2>:
    1728:	fe051ce3          	bnez	a0,1720 <.L1>
    172c:	00812503          	lw	a0,8(sp)
    1730:	ff1ff06f          	j	1720 <.L1>

00001734 <__GI_open>:
    1734:	fc010113          	add	sp,sp,-64
    1738:	02f12a23          	sw	a5,52(sp)
    173c:	004007b7          	lui	a5,0x400
    1740:	04078793          	add	a5,a5,64 # 400040 <_ebss+0x3ea150>
    1744:	02d12623          	sw	a3,44(sp)
    1748:	00112e23          	sw	ra,28(sp)
    174c:	02c12423          	sw	a2,40(sp)
    1750:	02e12823          	sw	a4,48(sp)
    1754:	03012c23          	sw	a6,56(sp)
    1758:	03112e23          	sw	a7,60(sp)
    175c:	00f5f7b3          	and	a5,a1,a5
    1760:	00000693          	li	a3,0
    1764:	00078863          	beqz	a5,1774 <.L2>
    1768:	02810793          	add	a5,sp,40
    176c:	00f12623          	sw	a5,12(sp)
    1770:	00060693          	mv	a3,a2

00001774 <.L2>:
    1774:	00058613          	mv	a2,a1
    1778:	00050593          	mv	a1,a0
    177c:	f9c00513          	li	a0,-100
    1780:	018000ef          	jal	1798 <__GI_openat>
    1784:	01c12083          	lw	ra,28(sp)
    1788:	04010113          	add	sp,sp,64
    178c:	00008067          	ret

00001790 <__open2_nocancel>:
    1790:	fa5ff06f          	j	1734 <__GI_open>

00001794 <__open_nocancel>:
    1794:	fa1ff06f          	j	1734 <__GI_open>

00001798 <__GI_openat>:
    1798:	fd010113          	add	sp,sp,-48
    179c:	02f12223          	sw	a5,36(sp)
    17a0:	01c10793          	add	a5,sp,28
    17a4:	03112623          	sw	a7,44(sp)
    17a8:	00d12e23          	sw	a3,28(sp)
    17ac:	02e12023          	sw	a4,32(sp)
    17b0:	03012423          	sw	a6,40(sp)
    17b4:	00f12623          	sw	a5,12(sp)
    17b8:	03800893          	li	a7,56
    17bc:	00000073          	ecall
    17c0:	fffff7b7          	lui	a5,0xfffff
    17c4:	00a7fc63          	bgeu	a5,a0,17dc <.L1>
    17c8:	40a00533          	neg	a0,a0
    17cc:	0000f797          	auipc	a5,0xf
    17d0:	ac87a783          	lw	a5,-1336(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    17d4:	00a7a023          	sw	a0,0(a5)
    17d8:	fff00513          	li	a0,-1

000017dc <.L1>:
    17dc:	03010113          	add	sp,sp,48
    17e0:	00008067          	ret

000017e4 <__GI_write>:
    17e4:	04000893          	li	a7,64
    17e8:	00000073          	ecall
    17ec:	fffff7b7          	lui	a5,0xfffff
    17f0:	00a7fc63          	bgeu	a5,a0,1808 <.L1>
    17f4:	40a00533          	neg	a0,a0
    17f8:	0000f797          	auipc	a5,0xf
    17fc:	a9c7a783          	lw	a5,-1380(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    1800:	00a7a023          	sw	a0,0(a5)
    1804:	fff00513          	li	a0,-1

00001808 <.L1>:
    1808:	00008067          	ret

0000180c <puts>:
    180c:	0000f797          	auipc	a5,0xf
    1810:	a807a783          	lw	a5,-1408(a5) # 1028c <_GLOBAL_OFFSET_TABLE_+0x4>
    1814:	0007a583          	lw	a1,0(a5)
    1818:	fe010113          	add	sp,sp,-32
    181c:	00912a23          	sw	s1,20(sp)
    1820:	00b12623          	sw	a1,12(sp)
    1824:	00112e23          	sw	ra,28(sp)
    1828:	00812c23          	sw	s0,24(sp)
    182c:	fff00493          	li	s1,-1
    1830:	1c4010ef          	jal	29f4 <__GI_fputs>
    1834:	00c12583          	lw	a1,12(sp)
    1838:	02951063          	bne	a0,s1,1858 <.L2>

0000183c <.L4>:
    183c:	fff00413          	li	s0,-1

00001840 <.L1>:
    1840:	01c12083          	lw	ra,28(sp)
    1844:	00040513          	mv	a0,s0
    1848:	01812403          	lw	s0,24(sp)
    184c:	01412483          	lw	s1,20(sp)
    1850:	02010113          	add	sp,sp,32
    1854:	00008067          	ret

00001858 <.L2>:
    1858:	00150413          	add	s0,a0,1
    185c:	00a00513          	li	a0,10
    1860:	09c010ef          	jal	28fc <__GI___fputc_unlocked>
    1864:	fc951ee3          	bne	a0,s1,1840 <.L1>
    1868:	fd5ff06f          	j	183c <.L4>

0000186c <__GI_printf>:
    186c:	fc010113          	add	sp,sp,-64
    1870:	02b12223          	sw	a1,36(sp)
    1874:	02c12423          	sw	a2,40(sp)
    1878:	02f12a23          	sw	a5,52(sp)
    187c:	02d12623          	sw	a3,44(sp)
    1880:	02e12823          	sw	a4,48(sp)
    1884:	03012c23          	sw	a6,56(sp)
    1888:	03112e23          	sw	a7,60(sp)
    188c:	0000f797          	auipc	a5,0xf
    1890:	a007a783          	lw	a5,-1536(a5) # 1028c <_GLOBAL_OFFSET_TABLE_+0x4>
    1894:	00050593          	mv	a1,a0
    1898:	0007a503          	lw	a0,0(a5)
    189c:	02410613          	add	a2,sp,36
    18a0:	00112e23          	sw	ra,28(sp)
    18a4:	00c12623          	sw	a2,12(sp)
    18a8:	134000ef          	jal	19dc <__GI_vfprintf>
    18ac:	01c12083          	lw	ra,28(sp)
    18b0:	04010113          	add	sp,sp,64
    18b4:	00008067          	ret

000018b8 <_stdio_term>:
    18b8:	ff010113          	add	sp,sp,-16
    18bc:	0000f797          	auipc	a5,0xf
    18c0:	9e87a783          	lw	a5,-1560(a5) # 102a4 <_GLOBAL_OFFSET_TABLE_+0x1c>
    18c4:	00812423          	sw	s0,8(sp)
    18c8:	0007a403          	lw	s0,0(a5)
    18cc:	00912223          	sw	s1,4(sp)
    18d0:	00112623          	sw	ra,12(sp)
    18d4:	ffe00493          	li	s1,-2

000018d8 <.L2>:
    18d8:	00041c63          	bnez	s0,18f0 <.L5>
    18dc:	00c12083          	lw	ra,12(sp)
    18e0:	00812403          	lw	s0,8(sp)
    18e4:	00412483          	lw	s1,4(sp)
    18e8:	01010113          	add	sp,sp,16
    18ec:	00008067          	ret

000018f0 <.L5>:
    18f0:	00045783          	lhu	a5,0(s0)
    18f4:	0407f793          	and	a5,a5,64
    18f8:	00078663          	beqz	a5,1904 <.L3>
    18fc:	00040513          	mv	a0,s0
    1900:	098000ef          	jal	1998 <__stdio_wcommit>

00001904 <.L3>:
    1904:	00442783          	lw	a5,4(s0)
    1908:	00979a63          	bne	a5,s1,191c <.L4>
    190c:	03442783          	lw	a5,52(s0)
    1910:	00078663          	beqz	a5,191c <.L4>
    1914:	02442503          	lw	a0,36(s0)
    1918:	000780e7          	jalr	a5

0000191c <.L4>:
    191c:	02042403          	lw	s0,32(s0)
    1920:	fb9ff06f          	j	18d8 <.L2>

00001924 <_stdio_init>:
    1924:	ff010113          	add	sp,sp,-16
    1928:	00812423          	sw	s0,8(sp)
    192c:	00000513          	li	a0,0
    1930:	0000f417          	auipc	s0,0xf
    1934:	96442403          	lw	s0,-1692(s0) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    1938:	00912223          	sw	s1,4(sp)
    193c:	00112623          	sw	ra,12(sp)
    1940:	00042483          	lw	s1,0(s0)
    1944:	774010ef          	jal	30b8 <__GI_isatty>
    1948:	00051c63          	bnez	a0,1960 <.L14>
    194c:	00011717          	auipc	a4,0x11
    1950:	9d070713          	add	a4,a4,-1584 # 1231c <_stdio_streams>
    1954:	00075783          	lhu	a5,0(a4)
    1958:	1007c793          	xor	a5,a5,256
    195c:	00f71023          	sh	a5,0(a4)

00001960 <.L14>:
    1960:	00100513          	li	a0,1
    1964:	754010ef          	jal	30b8 <__GI_isatty>
    1968:	00051c63          	bnez	a0,1980 <.L15>
    196c:	00011717          	auipc	a4,0x11
    1970:	9b070713          	add	a4,a4,-1616 # 1231c <_stdio_streams>
    1974:	02475783          	lhu	a5,36(a4)
    1978:	1007c793          	xor	a5,a5,256
    197c:	02f71223          	sh	a5,36(a4)

00001980 <.L15>:
    1980:	00942023          	sw	s1,0(s0)
    1984:	00c12083          	lw	ra,12(sp)
    1988:	00812403          	lw	s0,8(sp)
    198c:	00412483          	lw	s1,4(sp)
    1990:	01010113          	add	sp,sp,16
    1994:	00008067          	ret

00001998 <__stdio_wcommit>:
    1998:	00852583          	lw	a1,8(a0)
    199c:	01052783          	lw	a5,16(a0)
    19a0:	ff010113          	add	sp,sp,-16
    19a4:	00812423          	sw	s0,8(sp)
    19a8:	00112623          	sw	ra,12(sp)
    19ac:	00050413          	mv	s0,a0
    19b0:	40b78633          	sub	a2,a5,a1
    19b4:	00b78663          	beq	a5,a1,19c0 <.L2>
    19b8:	00b52823          	sw	a1,16(a0)
    19bc:	008030ef          	jal	49c4 <__stdio_WRITE>

000019c0 <.L2>:
    19c0:	01042503          	lw	a0,16(s0)
    19c4:	00842783          	lw	a5,8(s0)
    19c8:	00c12083          	lw	ra,12(sp)
    19cc:	00812403          	lw	s0,8(sp)
    19d0:	40f50533          	sub	a0,a0,a5
    19d4:	01010113          	add	sp,sp,16
    19d8:	00008067          	ret

000019dc <__GI_vfprintf>:
    19dc:	00055783          	lhu	a5,0(a0)
    19e0:	fe010113          	add	sp,sp,-32
    19e4:	00812c23          	sw	s0,24(sp)
    19e8:	00112e23          	sw	ra,28(sp)
    19ec:	0407f793          	and	a5,a5,64
    19f0:	00050413          	mv	s0,a0
    19f4:	00078c63          	beqz	a5,1a0c <.L2>

000019f8 <.L3>:
    19f8:	00040513          	mv	a0,s0
    19fc:	01812403          	lw	s0,24(sp)
    1a00:	01c12083          	lw	ra,28(sp)
    1a04:	02010113          	add	sp,sp,32
    1a08:	1580006f          	j	1b60 <_vfprintf_internal>

00001a0c <.L2>:
    1a0c:	00c12623          	sw	a2,12(sp)
    1a10:	00b12423          	sw	a1,8(sp)
    1a14:	4d4030ef          	jal	4ee8 <__stdio_trans2w>
    1a18:	00812583          	lw	a1,8(sp)
    1a1c:	00c12603          	lw	a2,12(sp)
    1a20:	fc050ce3          	beqz	a0,19f8 <.L3>
    1a24:	01c12083          	lw	ra,28(sp)
    1a28:	01812403          	lw	s0,24(sp)
    1a2c:	fff00513          	li	a0,-1
    1a30:	02010113          	add	sp,sp,32
    1a34:	00008067          	ret

00001a38 <_charpad>:
    1a38:	fd010113          	add	sp,sp,-48
    1a3c:	02812423          	sw	s0,40(sp)
    1a40:	02912223          	sw	s1,36(sp)
    1a44:	03212023          	sw	s2,32(sp)
    1a48:	01312e23          	sw	s3,28(sp)
    1a4c:	02112623          	sw	ra,44(sp)
    1a50:	00050913          	mv	s2,a0
    1a54:	00060413          	mv	s0,a2
    1a58:	00b10623          	sb	a1,12(sp)
    1a5c:	00060493          	mv	s1,a2
    1a60:	00c10993          	add	s3,sp,12

00001a64 <.L2>:
    1a64:	00048e63          	beqz	s1,1a80 <.L5>
    1a68:	00090613          	mv	a2,s2
    1a6c:	00100593          	li	a1,1
    1a70:	00098513          	mv	a0,s3
    1a74:	324030ef          	jal	4d98 <__stdio_fwrite>
    1a78:	00100793          	li	a5,1
    1a7c:	02f50263          	beq	a0,a5,1aa0 <.L4>

00001a80 <.L5>:
    1a80:	40940533          	sub	a0,s0,s1
    1a84:	02c12083          	lw	ra,44(sp)
    1a88:	02812403          	lw	s0,40(sp)
    1a8c:	02412483          	lw	s1,36(sp)
    1a90:	02012903          	lw	s2,32(sp)
    1a94:	01c12983          	lw	s3,28(sp)
    1a98:	03010113          	add	sp,sp,48
    1a9c:	00008067          	ret

00001aa0 <.L4>:
    1aa0:	fff48493          	add	s1,s1,-1
    1aa4:	fc1ff06f          	j	1a64 <.L2>

00001aa8 <_fp_out_narrow>:
    1aa8:	fe010113          	add	sp,sp,-32
    1aac:	00912a23          	sw	s1,20(sp)
    1ab0:	01312623          	sw	s3,12(sp)
    1ab4:	01412423          	sw	s4,8(sp)
    1ab8:	00112e23          	sw	ra,28(sp)
    1abc:	00812c23          	sw	s0,24(sp)
    1ac0:	01212823          	sw	s2,16(sp)
    1ac4:	01512223          	sw	s5,4(sp)
    1ac8:	0805f793          	and	a5,a1,128
    1acc:	00050a13          	mv	s4,a0
    1ad0:	00060493          	mv	s1,a2
    1ad4:	00068993          	mv	s3,a3
    1ad8:	06078e63          	beqz	a5,1b54 <.L12>
    1adc:	00068513          	mv	a0,a3
    1ae0:	00058a93          	mv	s5,a1
    1ae4:	358010ef          	jal	2e3c <__GI_strlen>
    1ae8:	40a484b3          	sub	s1,s1,a0
    1aec:	00050913          	mv	s2,a0
    1af0:	00000413          	li	s0,0
    1af4:	00905e63          	blez	s1,1b10 <.L9>
    1af8:	00048613          	mv	a2,s1
    1afc:	07faf593          	and	a1,s5,127
    1b00:	000a0513          	mv	a0,s4
    1b04:	f35ff0ef          	jal	1a38 <_charpad>
    1b08:	00050413          	mv	s0,a0
    1b0c:	02a49063          	bne	s1,a0,1b2c <.L8>

00001b10 <.L9>:
    1b10:	00000513          	li	a0,0
    1b14:	01205a63          	blez	s2,1b28 <.L11>
    1b18:	000a0613          	mv	a2,s4
    1b1c:	00090593          	mv	a1,s2
    1b20:	00098513          	mv	a0,s3
    1b24:	274030ef          	jal	4d98 <__stdio_fwrite>

00001b28 <.L11>:
    1b28:	00a40433          	add	s0,s0,a0

00001b2c <.L8>:
    1b2c:	01c12083          	lw	ra,28(sp)
    1b30:	00040513          	mv	a0,s0
    1b34:	01812403          	lw	s0,24(sp)
    1b38:	01412483          	lw	s1,20(sp)
    1b3c:	01012903          	lw	s2,16(sp)
    1b40:	00c12983          	lw	s3,12(sp)
    1b44:	00812a03          	lw	s4,8(sp)
    1b48:	00412a83          	lw	s5,4(sp)
    1b4c:	02010113          	add	sp,sp,32
    1b50:	00008067          	ret

00001b54 <.L12>:
    1b54:	00060913          	mv	s2,a2
    1b58:	00000413          	li	s0,0
    1b5c:	fb5ff06f          	j	1b10 <.L9>

00001b60 <_vfprintf_internal>:
    1b60:	e2010113          	add	sp,sp,-480
    1b64:	1d412423          	sw	s4,456(sp)
    1b68:	0c010a13          	add	s4,sp,192
    1b6c:	00a12223          	sw	a0,4(sp)
    1b70:	000a0513          	mv	a0,s4
    1b74:	1c812c23          	sw	s0,472(sp)
    1b78:	1c912a23          	sw	s1,468(sp)
    1b7c:	1c112e23          	sw	ra,476(sp)
    1b80:	1d212823          	sw	s2,464(sp)
    1b84:	1d312623          	sw	s3,460(sp)
    1b88:	1d512223          	sw	s5,452(sp)
    1b8c:	1d612023          	sw	s6,448(sp)
    1b90:	1b712e23          	sw	s7,444(sp)
    1b94:	1b812c23          	sw	s8,440(sp)
    1b98:	1b912a23          	sw	s9,436(sp)
    1b9c:	1ba12823          	sw	s10,432(sp)
    1ba0:	1bb12623          	sw	s11,428(sp)
    1ba4:	00058413          	mv	s0,a1
    1ba8:	00060493          	mv	s1,a2
    1bac:	5ac000ef          	jal	2158 <_ppfs_init>
    1bb0:	06055663          	bgez	a0,1c1c <.L17>
    1bb4:	0c012403          	lw	s0,192(sp)
    1bb8:	00040513          	mv	a0,s0
    1bbc:	280010ef          	jal	2e3c <__GI_strlen>
    1bc0:	00050593          	mv	a1,a0
    1bc4:	04051463          	bnez	a0,1c0c <.L18>

00001bc8 <.L60>:
    1bc8:	fff00493          	li	s1,-1

00001bcc <.L16>:
    1bcc:	1dc12083          	lw	ra,476(sp)
    1bd0:	1d812403          	lw	s0,472(sp)
    1bd4:	1d012903          	lw	s2,464(sp)
    1bd8:	1cc12983          	lw	s3,460(sp)
    1bdc:	1c812a03          	lw	s4,456(sp)
    1be0:	1c412a83          	lw	s5,452(sp)
    1be4:	1c012b03          	lw	s6,448(sp)
    1be8:	1bc12b83          	lw	s7,444(sp)
    1bec:	1b812c03          	lw	s8,440(sp)
    1bf0:	1b412c83          	lw	s9,436(sp)
    1bf4:	1b012d03          	lw	s10,432(sp)
    1bf8:	1ac12d83          	lw	s11,428(sp)
    1bfc:	00048513          	mv	a0,s1
    1c00:	1d412483          	lw	s1,468(sp)
    1c04:	1e010113          	add	sp,sp,480
    1c08:	00008067          	ret

00001c0c <.L18>:
    1c0c:	00412603          	lw	a2,4(sp)
    1c10:	00040513          	mv	a0,s0
    1c14:	184030ef          	jal	4d98 <__stdio_fwrite>
    1c18:	fb1ff06f          	j	1bc8 <.L60>

00001c1c <.L17>:
    1c1c:	00048593          	mv	a1,s1
    1c20:	000a0513          	mv	a0,s4
    1c24:	618000ef          	jal	223c <_ppfs_prepargs>
    1c28:	40000ab7          	lui	s5,0x40000
    1c2c:	10000b37          	lui	s6,0x10000
    1c30:	00040513          	mv	a0,s0
    1c34:	00000493          	li	s1,0
    1c38:	11010b93          	add	s7,sp,272
    1c3c:	93c18c13          	add	s8,gp,-1732 # 1045c <prefix.0>
    1c40:	fffa8a93          	add	s5,s5,-1 # 3fffffff <_ebss+0x3ffea10f>
    1c44:	fffb0b13          	add	s6,s6,-1 # fffffff <_ebss+0xffea10f>

00001c48 <.L21>:
    1c48:	00044783          	lbu	a5,0(s0)
    1c4c:	44078663          	beqz	a5,2098 <.L22>
    1c50:	02500713          	li	a4,37
    1c54:	00e79663          	bne	a5,a4,1c60 <.L23>
    1c58:	46a40463          	beq	s0,a0,20c0 <.L70>
    1c5c:	4400006f          	j	209c <.L69>

00001c60 <.L23>:
    1c60:	00140413          	add	s0,s0,1
    1c64:	fe5ff06f          	j	1c48 <.L21>

00001c68 <.L30>:
    1c68:	00a6a023          	sw	a0,0(a3) # 7f800000 <_ebss+0x7f7ea110>
    1c6c:	00170713          	add	a4,a4,1
    1c70:	00468693          	add	a3,a3,4
    1c74:	4a00006f          	j	2114 <.L29>

00001c78 <.L31>:
    1c78:	00700713          	li	a4,7
    1c7c:	28f76663          	bltu	a4,a5,1f08 <.L33>
    1c80:	00010717          	auipc	a4,0x10
    1c84:	2dc70713          	add	a4,a4,732 # 11f5c <spec_base.1>
    1c88:	00f70733          	add	a4,a4,a5
    1c8c:	fff74683          	lbu	a3,-1(a4)
    1c90:	00a00613          	li	a2,10
    1c94:	05700713          	li	a4,87
    1c98:	02c69263          	bne	a3,a2,1cbc <.L34>
    1c9c:	0d012603          	lw	a2,208(sp)
    1ca0:	02c00713          	li	a4,44
    1ca4:	02067513          	and	a0,a2,32
    1ca8:	00051463          	bnez	a0,1cb0 <.L35>
    1cac:	05700713          	li	a4,87

00001cb0 <.L35>:
    1cb0:	04067613          	and	a2,a2,64
    1cb4:	00060463          	beqz	a2,1cbc <.L34>
    1cb8:	08076713          	or	a4,a4,128

00001cbc <.L34>:
    1cbc:	00500613          	li	a2,5
    1cc0:	10f66663          	bltu	a2,a5,1dcc <.L36>
    1cc4:	00300613          	li	a2,3
    1cc8:	10c78663          	beq	a5,a2,1dd4 <.L74>
    1ccc:	00100613          	li	a2,1
    1cd0:	00600d93          	li	s11,6
    1cd4:	00c78463          	beq	a5,a2,1cdc <.L37>

00001cd8 <.L106>:
    1cd8:	00b00d93          	li	s11,11

00001cdc <.L37>:
    1cdc:	0c412603          	lw	a2,196(sp)
    1ce0:	02000913          	li	s2,32
    1ce4:	00065463          	bgez	a2,1cec <.L38>
    1ce8:	0d414903          	lbu	s2,212(sp)

00001cec <.L38>:
    1cec:	00100613          	li	a2,1
    1cf0:	40000513          	li	a0,1024
    1cf4:	02c78463          	beq	a5,a2,1d1c <.L39>
    1cf8:	015585b3          	add	a1,a1,s5
    1cfc:	00259593          	sll	a1,a1,0x2
    1d00:	19058793          	add	a5,a1,400
    1d04:	01010613          	add	a2,sp,16
    1d08:	00c785b3          	add	a1,a5,a2
    1d0c:	f485a503          	lw	a0,-184(a1)
    1d10:	000017b7          	lui	a5,0x1
    1d14:	f0078793          	add	a5,a5,-256 # f00 <.LVL62+0x10>
    1d18:	00f57533          	and	a0,a0,a5

00001d1c <.L39>:
    1d1c:	02c12583          	lw	a1,44(sp)
    1d20:	00068613          	mv	a2,a3
    1d24:	00e12623          	sw	a4,12(sp)
    1d28:	00d12423          	sw	a3,8(sp)
    1d2c:	290030ef          	jal	4fbc <_load_inttype>
    1d30:	00c12703          	lw	a4,12(sp)
    1d34:	00812683          	lw	a3,8(sp)
    1d38:	0bf10c93          	add	s9,sp,191
    1d3c:	00058613          	mv	a2,a1
    1d40:	00050593          	mv	a1,a0
    1d44:	000c8513          	mv	a0,s9
    1d48:	32c030ef          	jal	5074 <_uintmaxtostr>
    1d4c:	0e012703          	lw	a4,224(sp)
    1d50:	00500793          	li	a5,5
    1d54:	00050d13          	mv	s10,a0
    1d58:	02e7f263          	bgeu	a5,a4,1d7c <.L40>
    1d5c:	00054603          	lbu	a2,0(a0)
    1d60:	02d00693          	li	a3,45
    1d64:	0d012783          	lw	a5,208(sp)
    1d68:	06d61c63          	bne	a2,a3,1de0 <.L41>
    1d6c:	0027e793          	or	a5,a5,2
    1d70:	0cf12823          	sw	a5,208(sp)
    1d74:	00150d13          	add	s10,a0,1
    1d78:	00200d93          	li	s11,2

00001d7c <.L40>:
    1d7c:	0c412403          	lw	s0,196(sp)
    1d80:	41ac8cb3          	sub	s9,s9,s10
    1d84:	00045463          	bgez	s0,1d8c <.L42>
    1d88:	00100413          	li	s0,1

00001d8c <.L42>:
    1d8c:	0d012783          	lw	a5,208(sp)
    1d90:	000d4683          	lbu	a3,0(s10)
    1d94:	0107f793          	and	a5,a5,16
    1d98:	06078663          	beqz	a5,1e04 <.L43>
    1d9c:	00200793          	li	a5,2
    1da0:	06e7f063          	bgeu	a5,a4,1e00 <.L80>
    1da4:	00300793          	li	a5,3
    1da8:	12f70e63          	beq	a4,a5,1ee4 <.L81>
    1dac:	00400793          	li	a5,4
    1db0:	04f71a63          	bne	a4,a5,1e04 <.L43>
    1db4:	048ce863          	bltu	s9,s0,1e04 <.L43>
    1db8:	03000793          	li	a5,48
    1dbc:	001c8413          	add	s0,s9,1
    1dc0:	06f69263          	bne	a3,a5,1e24 <.L45>
    1dc4:	00100413          	li	s0,1
    1dc8:	0440006f          	j	1e0c <.L44>

00001dcc <.L36>:
    1dcc:	40d006b3          	neg	a3,a3
    1dd0:	f09ff06f          	j	1cd8 <.L106>

00001dd4 <.L74>:
    1dd4:	00b00d93          	li	s11,11
    1dd8:	03700713          	li	a4,55
    1ddc:	f01ff06f          	j	1cdc <.L37>

00001de0 <.L41>:
    1de0:	0027f693          	and	a3,a5,2
    1de4:	00069a63          	bnez	a3,1df8 <.L78>
    1de8:	0017f793          	and	a5,a5,1
    1dec:	f80788e3          	beqz	a5,1d7c <.L40>
    1df0:	00400d93          	li	s11,4
    1df4:	f89ff06f          	j	1d7c <.L40>

00001df8 <.L78>:
    1df8:	00000d93          	li	s11,0
    1dfc:	f81ff06f          	j	1d7c <.L40>

00001e00 <.L80>:
    1e00:	00600d93          	li	s11,6

00001e04 <.L43>:
    1e04:	03000793          	li	a5,48
    1e08:	00f69e63          	bne	a3,a5,1e24 <.L45>

00001e0c <.L44>:
    1e0c:	00500793          	li	a5,5
    1e10:	01b7d463          	bge	a5,s11,1e18 <.L46>
    1e14:	00b00d93          	li	s11,11

00001e18 <.L46>:
    1e18:	00100793          	li	a5,1
    1e1c:	0cf70863          	beq	a4,a5,1eec <.L84>
    1e20:	0e040063          	beqz	s0,1f00 <.L85>

00001e24 <.L45>:
    1e24:	0c8cfa63          	bgeu	s9,s0,1ef8 <.L86>
    1e28:	41940433          	sub	s0,s0,s9

00001e2c <.L47>:
    1e2c:	00b00713          	li	a4,11
    1e30:	019407b3          	add	a5,s0,s9
    1e34:	00ed8a63          	beq	s11,a4,1e48 <.L62>
    1e38:	00500713          	li	a4,5
    1e3c:	01b72733          	slt	a4,a4,s11
    1e40:	00170713          	add	a4,a4,1
    1e44:	00e787b3          	add	a5,a5,a4

00001e48 <.L62>:
    1e48:	0c812703          	lw	a4,200(sp)
    1e4c:	00000993          	li	s3,0
    1e50:	00e7f463          	bgeu	a5,a4,1e58 <.L64>
    1e54:	40f709b3          	sub	s3,a4,a5

00001e58 <.L64>:
    1e58:	00f487b3          	add	a5,s1,a5
    1e5c:	013784b3          	add	s1,a5,s3
    1e60:	03000793          	li	a5,48
    1e64:	00f91663          	bne	s2,a5,1e70 <.L65>
    1e68:	01340433          	add	s0,s0,s3
    1e6c:	00000993          	li	s3,0

00001e70 <.L65>:
    1e70:	0d012783          	lw	a5,208(sp)
    1e74:	0087f793          	and	a5,a5,8
    1e78:	00079e63          	bnez	a5,1e94 <.L66>
    1e7c:	00412503          	lw	a0,4(sp)
    1e80:	00098613          	mv	a2,s3
    1e84:	02000593          	li	a1,32
    1e88:	bb1ff0ef          	jal	1a38 <_charpad>
    1e8c:	d2a99ee3          	bne	s3,a0,1bc8 <.L60>
    1e90:	00000993          	li	s3,0

00001e94 <.L66>:
    1e94:	00412583          	lw	a1,4(sp)
    1e98:	01bc0533          	add	a0,s8,s11
    1e9c:	359000ef          	jal	29f4 <__GI_fputs>
    1ea0:	00412503          	lw	a0,4(sp)
    1ea4:	00040613          	mv	a2,s0
    1ea8:	03000593          	li	a1,48
    1eac:	b8dff0ef          	jal	1a38 <_charpad>
    1eb0:	d0a41ce3          	bne	s0,a0,1bc8 <.L60>
    1eb4:	000c8c63          	beqz	s9,1ecc <.L67>
    1eb8:	00412603          	lw	a2,4(sp)
    1ebc:	000c8593          	mv	a1,s9
    1ec0:	000d0513          	mv	a0,s10
    1ec4:	6d5020ef          	jal	4d98 <__stdio_fwrite>
    1ec8:	d0ac90e3          	bne	s9,a0,1bc8 <.L60>

00001ecc <.L67>:
    1ecc:	00412503          	lw	a0,4(sp)
    1ed0:	00098613          	mv	a2,s3
    1ed4:	02000593          	li	a1,32
    1ed8:	b61ff0ef          	jal	1a38 <_charpad>
    1edc:	26a98863          	beq	s3,a0,214c <.L32>
    1ee0:	ce9ff06f          	j	1bc8 <.L60>

00001ee4 <.L81>:
    1ee4:	00900d93          	li	s11,9
    1ee8:	f1dff06f          	j	1e04 <.L43>

00001eec <.L84>:
    1eec:	00010d17          	auipc	s10,0x10
    1ef0:	060d0d13          	add	s10,s10,96 # 11f4c <.LC0>
    1ef4:	00500c93          	li	s9,5

00001ef8 <.L86>:
    1ef8:	00000413          	li	s0,0
    1efc:	f31ff06f          	j	1e2c <.L47>

00001f00 <.L85>:
    1f00:	00000c93          	li	s9,0
    1f04:	ff5ff06f          	j	1ef8 <.L86>

00001f08 <.L33>:
    1f08:	00f00713          	li	a4,15
    1f0c:	08f76063          	bltu	a4,a5,1f8c <.L48>
    1f10:	0d012703          	lw	a4,208(sp)
    1f14:	02c12783          	lw	a5,44(sp)
    1f18:	01010413          	add	s0,sp,16
    1f1c:	01471693          	sll	a3,a4,0x14
    1f20:	0406d463          	bgez	a3,1f68 <.L49>
    1f24:	0007a603          	lw	a2,0(a5)
    1f28:	0047a683          	lw	a3,4(a5)
    1f2c:	0087a703          	lw	a4,8(a5)
    1f30:	00c7a783          	lw	a5,12(a5)

00001f34 <.L50>:
    1f34:	00412503          	lw	a0,4(sp)
    1f38:	00c12823          	sw	a2,16(sp)
    1f3c:	00d12a23          	sw	a3,20(sp)
    1f40:	0c410613          	add	a2,sp,196
    1f44:	00000697          	auipc	a3,0x0
    1f48:	b6468693          	add	a3,a3,-1180 # 1aa8 <_fp_out_narrow>
    1f4c:	00040593          	mv	a1,s0
    1f50:	00e12c23          	sw	a4,24(sp)
    1f54:	00f12e23          	sw	a5,28(sp)
    1f58:	1dc030ef          	jal	5134 <_fpmaxtostr>

00001f5c <.L108>:
    1f5c:	c60546e3          	bltz	a0,1bc8 <.L60>
    1f60:	00a484b3          	add	s1,s1,a0
    1f64:	1e80006f          	j	214c <.L32>

00001f68 <.L49>:
    1f68:	0047a603          	lw	a2,4(a5)
    1f6c:	0007a583          	lw	a1,0(a5)
    1f70:	00040513          	mv	a0,s0
    1f74:	0f50c0ef          	jal	e868 <__extenddftf2>
    1f78:	01012603          	lw	a2,16(sp)
    1f7c:	01412683          	lw	a3,20(sp)
    1f80:	01812703          	lw	a4,24(sp)
    1f84:	01c12783          	lw	a5,28(sp)
    1f88:	fadff06f          	j	1f34 <.L50>

00001f8c <.L48>:
    1f8c:	01100713          	li	a4,17
    1f90:	c2f77ce3          	bgeu	a4,a5,1bc8 <.L60>
    1f94:	01300713          	li	a4,19
    1f98:	08f76463          	bltu	a4,a5,2020 <.L52>
    1f9c:	02c12683          	lw	a3,44(sp)
    1fa0:	0006a403          	lw	s0,0(a3)
    1fa4:	04e79e63          	bne	a5,a4,2000 <.L53>
    1fa8:	0c412703          	lw	a4,196(sp)
    1fac:	02040863          	beqz	s0,1fdc <.L54>
    1fb0:	00040d13          	mv	s10,s0

00001fb4 <.L55>:
    1fb4:	0c412783          	lw	a5,196(sp)
    1fb8:	fff00593          	li	a1,-1
    1fbc:	0007c463          	bltz	a5,1fc4 <.L56>
    1fc0:	00078593          	mv	a1,a5

00001fc4 <.L56>:
    1fc4:	000d0513          	mv	a0,s10
    1fc8:	709000ef          	jal	2ed0 <__GI_strnlen>
    1fcc:	00050c93          	mv	s9,a0
    1fd0:	02000913          	li	s2,32
    1fd4:	00b00d93          	li	s11,11
    1fd8:	f21ff06f          	j	1ef8 <.L86>

00001fdc <.L54>:
    1fdc:	00500793          	li	a5,5
    1fe0:	00010d17          	auipc	s10,0x10
    1fe4:	f74d0d13          	add	s10,s10,-140 # 11f54 <.LC1>
    1fe8:	02000913          	li	s2,32
    1fec:	00b00d93          	li	s11,11
    1ff0:	00600c93          	li	s9,6
    1ff4:	e2e7ece3          	bltu	a5,a4,1e2c <.L47>
    1ff8:	00000c93          	li	s9,0
    1ffc:	e31ff06f          	j	1e2c <.L47>

00002000 <.L53>:
    2000:	04810023          	sb	s0,64(sp)
    2004:	040100a3          	sb	zero,65(sp)
    2008:	04010d13          	add	s10,sp,64
    200c:	02000913          	li	s2,32
    2010:	00b00d93          	li	s11,11
    2014:	00000413          	li	s0,0
    2018:	00100c93          	li	s9,1
    201c:	e11ff06f          	j	1e2c <.L47>

00002020 <.L52>:
    2020:	01400713          	li	a4,20
    2024:	02e79263          	bne	a5,a4,2048 <.L57>
    2028:	0000e797          	auipc	a5,0xe
    202c:	26c7a783          	lw	a5,620(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    2030:	0007a503          	lw	a0,0(a5)
    2034:	08000613          	li	a2,128
    2038:	04010593          	add	a1,sp,64
    203c:	751000ef          	jal	2f8c <__GI___glibc_strerror_r>
    2040:	00050d13          	mv	s10,a0
    2044:	f71ff06f          	j	1fb4 <.L55>

00002048 <.L57>:
    2048:	0cc12583          	lw	a1,204(sp)
    204c:	00010717          	auipc	a4,0x10
    2050:	35472703          	lw	a4,852(a4) # 123a0 <_custom_printf_spec>
    2054:	00a70693          	add	a3,a4,10
    2058:	00070793          	mv	a5,a4

0000205c <.L61>:
    205c:	0007c503          	lbu	a0,0(a5)
    2060:	02b51663          	bne	a0,a1,208c <.L58>
    2064:	40e787b3          	sub	a5,a5,a4
    2068:	00279793          	sll	a5,a5,0x2
    206c:	00014717          	auipc	a4,0x14
    2070:	e4470713          	add	a4,a4,-444 # 15eb0 <_custom_printf_handler>
    2074:	00f707b3          	add	a5,a4,a5
    2078:	0007a783          	lw	a5,0(a5)
    207c:	00412503          	lw	a0,4(sp)
    2080:	0c410593          	add	a1,sp,196
    2084:	000780e7          	jalr	a5
    2088:	ed5ff06f          	j	1f5c <.L108>

0000208c <.L58>:
    208c:	00178793          	add	a5,a5,1
    2090:	fcd796e3          	bne	a5,a3,205c <.L61>
    2094:	b35ff06f          	j	1bc8 <.L60>

00002098 <.L22>:
    2098:	b2a40ae3          	beq	s0,a0,1bcc <.L16>

0000209c <.L69>:
    209c:	40a409b3          	sub	s3,s0,a0
    20a0:	b33054e3          	blez	s3,1bc8 <.L60>
    20a4:	00412603          	lw	a2,4(sp)
    20a8:	00098593          	mv	a1,s3
    20ac:	4ed020ef          	jal	4d98 <__stdio_fwrite>
    20b0:	b0a99ce3          	bne	s3,a0,1bc8 <.L60>
    20b4:	00044783          	lbu	a5,0(s0)
    20b8:	013484b3          	add	s1,s1,s3
    20bc:	b00788e3          	beqz	a5,1bcc <.L16>

000020c0 <.L70>:
    20c0:	00144703          	lbu	a4,1(s0)
    20c4:	02500793          	li	a5,37
    20c8:	00140513          	add	a0,s0,1
    20cc:	00240413          	add	s0,s0,2
    20d0:	b6f70ce3          	beq	a4,a5,1c48 <.L21>
    20d4:	0ca12023          	sw	a0,192(sp)
    20d8:	000a0513          	mv	a0,s4
    20dc:	35c000ef          	jal	2438 <_ppfs_parsespec>
    20e0:	000a0513          	mv	a0,s4
    20e4:	1a4000ef          	jal	2288 <_ppfs_setargs>
    20e8:	0d812703          	lw	a4,216(sp)
    20ec:	0e614583          	lbu	a1,230(sp)
    20f0:	000b8793          	mv	a5,s7
    20f4:	00e05863          	blez	a4,2104 <.L28>
    20f8:	016587b3          	add	a5,a1,s6
    20fc:	00479793          	sll	a5,a5,0x4
    2100:	00fb87b3          	add	a5,s7,a5

00002104 <.L28>:
    2104:	0dc12803          	lw	a6,220(sp)
    2108:	02c10693          	add	a3,sp,44
    210c:	00000713          	li	a4,0
    2110:	00068613          	mv	a2,a3

00002114 <.L29>:
    2114:	00471513          	sll	a0,a4,0x4
    2118:	00a78533          	add	a0,a5,a0
    211c:	b50746e3          	blt	a4,a6,1c68 <.L30>
    2120:	0e012783          	lw	a5,224(sp)
    2124:	b4079ae3          	bnez	a5,1c78 <.L31>
    2128:	0d012583          	lw	a1,208(sp)
    212c:	000017b7          	lui	a5,0x1
    2130:	f0078793          	add	a5,a5,-256 # f00 <.LVL62+0x10>
    2134:	00f5f5b3          	and	a1,a1,a5
    2138:	02c12783          	lw	a5,44(sp)
    213c:	00048613          	mv	a2,s1
    2140:	41f4d693          	sra	a3,s1,0x1f
    2144:	0007a503          	lw	a0,0(a5)
    2148:	6f1020ef          	jal	5038 <_store_inttype>

0000214c <.L32>:
    214c:	0c012403          	lw	s0,192(sp)
    2150:	00040513          	mv	a0,s0
    2154:	af5ff06f          	j	1c48 <.L21>

00002158 <_ppfs_init>:
    2158:	fe010113          	add	sp,sp,-32
    215c:	00912a23          	sw	s1,20(sp)
    2160:	0e000613          	li	a2,224
    2164:	00058493          	mv	s1,a1
    2168:	00000593          	li	a1,0
    216c:	00812c23          	sw	s0,24(sp)
    2170:	01212823          	sw	s2,16(sp)
    2174:	00050413          	mv	s0,a0
    2178:	00112e23          	sw	ra,28(sp)
    217c:	01312623          	sw	s3,12(sp)
    2180:	419000ef          	jal	2d98 <__GI_memset>
    2184:	01842783          	lw	a5,24(s0)
    2188:	02840913          	add	s2,s0,40
    218c:	00942023          	sw	s1,0(s0)
    2190:	fff78793          	add	a5,a5,-1
    2194:	00f42c23          	sw	a5,24(s0)
    2198:	04c40713          	add	a4,s0,76
    219c:	00090793          	mv	a5,s2
    21a0:	00800693          	li	a3,8

000021a4 <.L2>:
    21a4:	00478793          	add	a5,a5,4
    21a8:	fed7ae23          	sw	a3,-4(a5)
    21ac:	fef71ce3          	bne	a4,a5,21a4 <.L2>
    21b0:	00048793          	mv	a5,s1
    21b4:	02500993          	li	s3,37

000021b8 <.L3>:
    21b8:	0007c703          	lbu	a4,0(a5)
    21bc:	02071063          	bnez	a4,21dc <.L8>
    21c0:	01842783          	lw	a5,24(s0)
    21c4:	00942023          	sw	s1,0(s0)
    21c8:	00800713          	li	a4,8

000021cc <.L9>:
    21cc:	fff78793          	add	a5,a5,-1
    21d0:	0407de63          	bgez	a5,222c <.L11>
    21d4:	00000513          	li	a0,0
    21d8:	0280006f          	j	2200 <.L1>

000021dc <.L8>:
    21dc:	0017c683          	lbu	a3,1(a5)
    21e0:	05371263          	bne	a4,s3,2224 <.L4>
    21e4:	00178793          	add	a5,a5,1
    21e8:	03368e63          	beq	a3,s3,2224 <.L4>
    21ec:	00f42023          	sw	a5,0(s0)
    21f0:	00040513          	mv	a0,s0
    21f4:	244000ef          	jal	2438 <_ppfs_parsespec>
    21f8:	02055263          	bgez	a0,221c <.L5>

000021fc <.L10>:
    21fc:	fff00513          	li	a0,-1

00002200 <.L1>:
    2200:	01c12083          	lw	ra,28(sp)
    2204:	01812403          	lw	s0,24(sp)
    2208:	01412483          	lw	s1,20(sp)
    220c:	01012903          	lw	s2,16(sp)
    2210:	00c12983          	lw	s3,12(sp)
    2214:	02010113          	add	sp,sp,32
    2218:	00008067          	ret

0000221c <.L5>:
    221c:	00042783          	lw	a5,0(s0)
    2220:	f99ff06f          	j	21b8 <.L3>

00002224 <.L4>:
    2224:	00178793          	add	a5,a5,1
    2228:	f91ff06f          	j	21b8 <.L3>

0000222c <.L11>:
    222c:	00092683          	lw	a3,0(s2)
    2230:	fce686e3          	beq	a3,a4,21fc <.L10>
    2234:	00490913          	add	s2,s2,4
    2238:	f95ff06f          	j	21cc <.L9>

0000223c <_ppfs_prepargs>:
    223c:	ff010113          	add	sp,sp,-16
    2240:	00912223          	sw	s1,4(sp)
    2244:	01852483          	lw	s1,24(a0)
    2248:	00112623          	sw	ra,12(sp)
    224c:	00812423          	sw	s0,8(sp)
    2250:	04b52623          	sw	a1,76(a0)
    2254:	02905063          	blez	s1,2274 <.L1>
    2258:	00050413          	mv	s0,a0
    225c:	00952e23          	sw	s1,28(a0)
    2260:	00052c23          	sw	zero,24(a0)
    2264:	00052223          	sw	zero,4(a0)
    2268:	00052423          	sw	zero,8(a0)
    226c:	01c000ef          	jal	2288 <_ppfs_setargs>
    2270:	00942c23          	sw	s1,24(s0)

00002274 <.L1>:
    2274:	00c12083          	lw	ra,12(sp)
    2278:	00812403          	lw	s0,8(sp)
    227c:	00412483          	lw	s1,4(sp)
    2280:	01010113          	add	sp,sp,16
    2284:	00008067          	ret

00002288 <_ppfs_setargs>:
    2288:	01852603          	lw	a2,24(a0)
    228c:	00852783          	lw	a5,8(a0)
    2290:	00452683          	lw	a3,4(a0)
    2294:	05050713          	add	a4,a0,80
    2298:	12061c63          	bnez	a2,23d0 <.L2>
    229c:	800005b7          	lui	a1,0x80000
    22a0:	00b79e63          	bne	a5,a1,22bc <.L3>
    22a4:	04c52783          	lw	a5,76(a0)
    22a8:	00478593          	add	a1,a5,4
    22ac:	0007a783          	lw	a5,0(a5)
    22b0:	04b52623          	sw	a1,76(a0)
    22b4:	04f52823          	sw	a5,80(a0)
    22b8:	00f52423          	sw	a5,8(a0)

000022bc <.L3>:
    22bc:	800007b7          	lui	a5,0x80000
    22c0:	00f69e63          	bne	a3,a5,22dc <.L4>
    22c4:	04c52783          	lw	a5,76(a0)
    22c8:	00478693          	add	a3,a5,4 # 80000004 <_ebss+0x7ffea114>
    22cc:	0007a783          	lw	a5,0(a5)
    22d0:	04d52623          	sw	a3,76(a0)
    22d4:	04f52823          	sw	a5,80(a0)
    22d8:	00f52223          	sw	a5,4(a0)

000022dc <.L4>:
    22dc:	01c52f03          	lw	t5,28(a0)
    22e0:	00001837          	lui	a6,0x1
    22e4:	000018b7          	lui	a7,0x1
    22e8:	02850593          	add	a1,a0,40
    22ec:	00800e13          	li	t3,8
    22f0:	80080813          	add	a6,a6,-2048 # 800 <.L25>
    22f4:	80788893          	add	a7,a7,-2041 # 807 <.L25+0x7>
    22f8:	00200e93          	li	t4,2
    22fc:	00700f93          	li	t6,7

00002300 <.L5>:
    2300:	03e64863          	blt	a2,t5,2330 <.L17>

00002304 <.L18>:
    2304:	00852783          	lw	a5,8(a0)
    2308:	0207d263          	bgez	a5,232c <.L1>
    230c:	40f007b3          	neg	a5,a5
    2310:	00f52423          	sw	a5,8(a0)
    2314:	01052783          	lw	a5,16(a0)
    2318:	ffe7f793          	and	a5,a5,-2
    231c:	0087e793          	or	a5,a5,8
    2320:	00f52823          	sw	a5,16(a0)
    2324:	02000793          	li	a5,32
    2328:	00f52a23          	sw	a5,20(a0)

0000232c <.L1>:
    232c:	00008067          	ret

00002330 <.L17>:
    2330:	0005a683          	lw	a3,0(a1) # 80000000 <_ebss+0x7ffea110>
    2334:	00160613          	add	a2,a2,1
    2338:	05c68863          	beq	a3,t3,2388 <.L6>
    233c:	04c52783          	lw	a5,76(a0)
    2340:	04de4863          	blt	t3,a3,2390 <.L7>
    2344:	01d68463          	beq	a3,t4,234c <.L10>
    2348:	00decc63          	blt	t4,a3,2360 <.L9>

0000234c <.L10>:
    234c:	00478693          	add	a3,a5,4
    2350:	04d52623          	sw	a3,76(a0)
    2354:	0007a783          	lw	a5,0(a5)
    2358:	00f72023          	sw	a5,0(a4)
    235c:	0280006f          	j	2384 <.L16>

00002360 <.L9>:
    2360:	fff696e3          	bne	a3,t6,234c <.L10>

00002364 <.L12>:
    2364:	00778793          	add	a5,a5,7
    2368:	ff87f793          	and	a5,a5,-8
    236c:	00878693          	add	a3,a5,8
    2370:	04d52623          	sw	a3,76(a0)
    2374:	0007a303          	lw	t1,0(a5)
    2378:	0047a383          	lw	t2,4(a5)
    237c:	00672023          	sw	t1,0(a4)
    2380:	00772223          	sw	t2,4(a4)

00002384 <.L16>:
    2384:	01070713          	add	a4,a4,16

00002388 <.L6>:
    2388:	00458593          	add	a1,a1,4
    238c:	f75ff06f          	j	2300 <.L5>

00002390 <.L7>:
    2390:	80068313          	add	t1,a3,-2048
    2394:	fc0308e3          	beqz	t1,2364 <.L12>
    2398:	fad85ae3          	bge	a6,a3,234c <.L10>
    239c:	fb1698e3          	bne	a3,a7,234c <.L10>
    23a0:	00478693          	add	a3,a5,4
    23a4:	04d52623          	sw	a3,76(a0)
    23a8:	0007a783          	lw	a5,0(a5)
    23ac:	0007a283          	lw	t0,0(a5)
    23b0:	0047a303          	lw	t1,4(a5)
    23b4:	0087a683          	lw	a3,8(a5)
    23b8:	00c7a783          	lw	a5,12(a5)
    23bc:	00572023          	sw	t0,0(a4)
    23c0:	00672223          	sw	t1,4(a4)
    23c4:	00d72423          	sw	a3,8(a4)
    23c8:	00f72623          	sw	a5,12(a4)
    23cc:	fb9ff06f          	j	2384 <.L16>

000023d0 <.L2>:
    23d0:	80000637          	lui	a2,0x80000
    23d4:	00c79c63          	bne	a5,a2,23ec <.L19>
    23d8:	02454783          	lbu	a5,36(a0)
    23dc:	00479793          	sll	a5,a5,0x4
    23e0:	00f707b3          	add	a5,a4,a5
    23e4:	ff07a783          	lw	a5,-16(a5)
    23e8:	00f52423          	sw	a5,8(a0)

000023ec <.L19>:
    23ec:	800007b7          	lui	a5,0x80000
    23f0:	f0f69ae3          	bne	a3,a5,2304 <.L18>
    23f4:	02554783          	lbu	a5,37(a0)
    23f8:	00479793          	sll	a5,a5,0x4
    23fc:	00f70733          	add	a4,a4,a5
    2400:	ff072783          	lw	a5,-16(a4)
    2404:	00f52223          	sw	a5,4(a0)
    2408:	efdff06f          	j	2304 <.L18>

0000240c <_promoted_size>:
    240c:	96018793          	add	a5,gp,-1696 # 10480 <type_sizes>
    2410:	94818713          	add	a4,gp,-1720 # 10468 <type_codes>

00002414 <.L3>:
    2414:	ffe79683          	lh	a3,-2(a5) # 7ffffffe <_ebss+0x7ffea10e>
    2418:	ffe78793          	add	a5,a5,-2
    241c:	00a68463          	beq	a3,a0,2424 <.L2>
    2420:	fee79ae3          	bne	a5,a4,2414 <.L3>

00002424 <.L2>:
    2424:	40e787b3          	sub	a5,a5,a4
    2428:	4017d793          	sra	a5,a5,0x1
    242c:	00f70733          	add	a4,a4,a5
    2430:	01874503          	lbu	a0,24(a4)
    2434:	00008067          	ret

00002438 <_ppfs_parsespec>:
    2438:	f9010113          	add	sp,sp,-112
    243c:	00800793          	li	a5,8
    2440:	0cccd337          	lui	t1,0xcccd
    2444:	0cccde37          	lui	t3,0xcccd
    2448:	80000837          	lui	a6,0x80000
    244c:	00052683          	lw	a3,0(a0)
    2450:	06812423          	sw	s0,104(sp)
    2454:	07212023          	sw	s2,96(sp)
    2458:	05312e23          	sw	s3,92(sp)
    245c:	05412c23          	sw	s4,88(sp)
    2460:	01852983          	lw	s3,24(a0)
    2464:	05512a23          	sw	s5,84(sp)
    2468:	05612823          	sw	s6,80(sp)
    246c:	00050413          	mv	s0,a0
    2470:	06112623          	sw	ra,108(sp)
    2474:	06912223          	sw	s1,100(sp)
    2478:	05712623          	sw	s7,76(sp)
    247c:	05812423          	sw	s8,72(sp)
    2480:	05912223          	sw	s9,68(sp)
    2484:	05a12023          	sw	s10,64(sp)
    2488:	03b12e23          	sw	s11,60(sp)
    248c:	00012423          	sw	zero,8(sp)
    2490:	00012623          	sw	zero,12(sp)
    2494:	00f12a23          	sw	a5,20(sp)
    2498:	00f12c23          	sw	a5,24(sp)
    249c:	00010297          	auipc	t0,0x10
    24a0:	f1c2a283          	lw	t0,-228(t0) # 123b8 <__GI___ctype_b>
    24a4:	00000513          	li	a0,0
    24a8:	00000613          	li	a2,0
    24ac:	00000893          	li	a7,0
    24b0:	02a00e93          	li	t4,42
    24b4:	ccb30313          	add	t1,t1,-821 # ccccccb <_ebss+0xccb6ddb>
    24b8:	00a00393          	li	t2,10
    24bc:	ccce0e13          	add	t3,t3,-820 # ccccccc <_ebss+0xccb6ddc>
    24c0:	fff80813          	add	a6,a6,-1 # 7fffffff <_ebss+0x7ffea10f>
    24c4:	03700913          	li	s2,55
    24c8:	02500f13          	li	t5,37
    24cc:	02e00a13          	li	s4,46
    24d0:	02400f93          	li	t6,36
    24d4:	03000a93          	li	s5,48
    24d8:	06d00b13          	li	s6,109

000024dc <.L6>:
    24dc:	0006c783          	lbu	a5,0(a3)
    24e0:	00068713          	mv	a4,a3
    24e4:	01d79c63          	bne	a5,t4,24fc <.L7>
    24e8:	03010713          	add	a4,sp,48
    24ec:	00251793          	sll	a5,a0,0x2
    24f0:	40f707b3          	sub	a5,a4,a5
    24f4:	fe07a223          	sw	zero,-28(a5)
    24f8:	00168713          	add	a4,a3,1

000024fc <.L7>:
    24fc:	00000793          	li	a5,0

00002500 <.L8>:
    2500:	00074583          	lbu	a1,0(a4)
    2504:	00159493          	sll	s1,a1,0x1
    2508:	009284b3          	add	s1,t0,s1
    250c:	0004d483          	lhu	s1,0(s1)
    2510:	0084f493          	and	s1,s1,8
    2514:	04049e63          	bnez	s1,2570 <.L11>
    2518:	fff6c483          	lbu	s1,-1(a3)
    251c:	0be49e63          	bne	s1,t5,25d8 <.L12>
    2520:	0bf59863          	bne	a1,t6,25d0 <.L13>
    2524:	3cf05063          	blez	a5,28e4 <.L14>
    2528:	00170693          	add	a3,a4,1
    252c:	06099663          	bnez	s3,2598 <.L15>

00002530 <.L20>:
    2530:	fff00513          	li	a0,-1

00002534 <.L5>:
    2534:	06c12083          	lw	ra,108(sp)
    2538:	06812403          	lw	s0,104(sp)
    253c:	06412483          	lw	s1,100(sp)
    2540:	06012903          	lw	s2,96(sp)
    2544:	05c12983          	lw	s3,92(sp)
    2548:	05812a03          	lw	s4,88(sp)
    254c:	05412a83          	lw	s5,84(sp)
    2550:	05012b03          	lw	s6,80(sp)
    2554:	04c12b83          	lw	s7,76(sp)
    2558:	04812c03          	lw	s8,72(sp)
    255c:	04412c83          	lw	s9,68(sp)
    2560:	04012d03          	lw	s10,64(sp)
    2564:	03c12d83          	lw	s11,60(sp)
    2568:	07010113          	add	sp,sp,112
    256c:	00008067          	ret

00002570 <.L11>:
    2570:	00f35663          	bge	t1,a5,257c <.L9>
    2574:	01c79e63          	bne	a5,t3,2590 <.L53>
    2578:	00b96c63          	bltu	s2,a1,2590 <.L53>

0000257c <.L9>:
    257c:	027787b3          	mul	a5,a5,t2
    2580:	fd058593          	add	a1,a1,-48
    2584:	00f587b3          	add	a5,a1,a5

00002588 <.L10>:
    2588:	00170713          	add	a4,a4,1
    258c:	f75ff06f          	j	2500 <.L8>

00002590 <.L53>:
    2590:	00080793          	mv	a5,a6
    2594:	ff5ff06f          	j	2588 <.L10>

00002598 <.L15>:
    2598:	00f12823          	sw	a5,16(sp)
    259c:	00f9d463          	bge	s3,a5,25a4 <.L18>
    25a0:	00078993          	mv	s3,a5

000025a4 <.L18>:
    25a4:	00068713          	mv	a4,a3

000025a8 <.L22>:
    25a8:	00074483          	lbu	s1,0(a4)
    25ac:	00100793          	li	a5,1
    25b0:	00010697          	auipc	a3,0x10
    25b4:	9cc68693          	add	a3,a3,-1588 # 11f7c <spec_flags.5>

000025b8 <.L23>:
    25b8:	0006c583          	lbu	a1,0(a3)
    25bc:	00168693          	add	a3,a3,1
    25c0:	06959663          	bne	a1,s1,262c <.L21>
    25c4:	00170713          	add	a4,a4,1
    25c8:	00f66633          	or	a2,a2,a5
    25cc:	fddff06f          	j	25a8 <.L22>

000025d0 <.L13>:
    25d0:	31305c63          	blez	s3,28e8 <.L19>
    25d4:	f5659ee3          	bne	a1,s6,2530 <.L20>

000025d8 <.L12>:
    25d8:	0006c583          	lbu	a1,0(a3)
    25dc:	00070493          	mv	s1,a4
    25e0:	03d59663          	bne	a1,t4,260c <.L25>
    25e4:	06098a63          	beqz	s3,2658 <.L26>
    25e8:	00170493          	add	s1,a4,1
    25ec:	00074703          	lbu	a4,0(a4)
    25f0:	f5f710e3          	bne	a4,t6,2530 <.L20>
    25f4:	f2f05ee3          	blez	a5,2530 <.L20>
    25f8:	00251713          	sll	a4,a0,0x2
    25fc:	03010693          	add	a3,sp,48
    2600:	40e68733          	sub	a4,a3,a4
    2604:	fcf72c23          	sw	a5,-40(a4)

00002608 <.L72>:
    2608:	800007b7          	lui	a5,0x80000

0000260c <.L25>:
    260c:	0004c583          	lbu	a1,0(s1)
    2610:	04051e63          	bnez	a0,266c <.L27>
    2614:	05459863          	bne	a1,s4,2664 <.L57>
    2618:	00148713          	add	a4,s1,1
    261c:	00078893          	mv	a7,a5
    2620:	fff00513          	li	a0,-1

00002624 <.L24>:
    2624:	00070693          	mv	a3,a4
    2628:	eb5ff06f          	j	24dc <.L6>

0000262c <.L21>:
    262c:	0006c583          	lbu	a1,0(a3)
    2630:	00179793          	sll	a5,a5,0x1
    2634:	f80592e3          	bnez	a1,25b8 <.L23>
    2638:	40165793          	sra	a5,a2,0x1
    263c:	0057f793          	and	a5,a5,5
    2640:	fff7c793          	not	a5,a5
    2644:	00f67633          	and	a2,a2,a5
    2648:	fff74783          	lbu	a5,-1(a4)
    264c:	fde79ce3          	bne	a5,t5,2624 <.L24>
    2650:	00000793          	li	a5,0
    2654:	f85ff06f          	j	25d8 <.L12>

00002658 <.L26>:
    2658:	00168493          	add	s1,a3,1
    265c:	fa9706e3          	beq	a4,s1,2608 <.L72>
    2660:	ed1ff06f          	j	2530 <.L20>

00002664 <.L57>:
    2664:	00078893          	mv	a7,a5
    2668:	fff00793          	li	a5,-1

0000266c <.L27>:
    266c:	96c18713          	add	a4,gp,-1684 # 1048c <qual_chars.4>
    2670:	00070693          	mv	a3,a4

00002674 <.L30>:
    2674:	00074503          	lbu	a0,0(a4)
    2678:	1ab51663          	bne	a0,a1,2824 <.L28>
    267c:	00148493          	add	s1,s1,1

00002680 <.L29>:
    2680:	40d706b3          	sub	a3,a4,a3
    2684:	00100513          	li	a0,1
    2688:	0004c583          	lbu	a1,0(s1)
    268c:	00d54a63          	blt	a0,a3,26a0 <.L31>
    2690:	00074683          	lbu	a3,0(a4)
    2694:	00b69663          	bne	a3,a1,26a0 <.L31>
    2698:	00970713          	add	a4,a4,9
    269c:	00148493          	add	s1,s1,1

000026a0 <.L31>:
    26a0:	00974683          	lbu	a3,9(a4)
    26a4:	0004c583          	lbu	a1,0(s1)
    26a8:	00869693          	sll	a3,a3,0x8
    26ac:	e80582e3          	beqz	a1,2530 <.L20>
    26b0:	00010717          	auipc	a4,0x10
    26b4:	8b470713          	add	a4,a4,-1868 # 11f64 <spec_chars.3>
    26b8:	00070813          	mv	a6,a4

000026bc <.L36>:
    26bc:	00074503          	lbu	a0,0(a4)
    26c0:	16b51a63          	bne	a0,a1,2834 <.L32>
    26c4:	41070733          	sub	a4,a4,a6
    26c8:	01100593          	li	a1,17
    26cc:	00e5d863          	bge	a1,a4,26dc <.L33>
    26d0:	4006f593          	and	a1,a3,1024
    26d4:	00058463          	beqz	a1,26dc <.L33>
    26d8:	ffe70713          	add	a4,a4,-2

000026dc <.L33>:
    26dc:	98018513          	add	a0,gp,-1664 # 104a0 <spec_ranges.2>
    26e0:	02e42023          	sw	a4,32(s0)
    26e4:	00050813          	mv	a6,a0

000026e8 <.L34>:
    26e8:	00050593          	mv	a1,a0
    26ec:	0005c303          	lbu	t1,0(a1)
    26f0:	00150513          	add	a0,a0,1
    26f4:	fee34ae3          	blt	t1,a4,26e8 <.L34>
    26f8:	410585b3          	sub	a1,a1,a6
    26fc:	94818713          	add	a4,gp,-1720 # 10468 <type_codes>
    2700:	00159593          	sll	a1,a1,0x1
    2704:	00b705b3          	add	a1,a4,a1
    2708:	04459703          	lh	a4,68(a1)
    270c:	05459583          	lh	a1,84(a1)
    2710:	00d76733          	or	a4,a4,a3
    2714:	00b77733          	and	a4,a4,a1
    2718:	00e12e23          	sw	a4,28(sp)
    271c:	00010717          	auipc	a4,0x10
    2720:	84870713          	add	a4,a4,-1976 # 11f64 <spec_chars.3>

00002724 <.L35>:
    2724:	0004c583          	lbu	a1,0(s1)
    2728:	00f42223          	sw	a5,4(s0)
    272c:	01142423          	sw	a7,8(s0)
    2730:	00b42623          	sw	a1,12(s0)
    2734:	00467793          	and	a5,a2,4
    2738:	02000593          	li	a1,32
    273c:	00078463          	beqz	a5,2744 <.L37>
    2740:	03000593          	li	a1,48

00002744 <.L37>:
    2744:	000017b7          	lui	a5,0x1
    2748:	f0078793          	add	a5,a5,-256 # f00 <.LVL62+0x10>
    274c:	00f6f6b3          	and	a3,a3,a5
    2750:	ffb67613          	and	a2,a2,-5
    2754:	00100793          	li	a5,1
    2758:	00d66633          	or	a2,a2,a3
    275c:	00b42a23          	sw	a1,20(s0)
    2760:	00c42823          	sw	a2,16(s0)
    2764:	00f42e23          	sw	a5,28(s0)
    2768:	00074783          	lbu	a5,0(a4)
    276c:	00079e63          	bnez	a5,2788 <.L40>
    2770:	0004c703          	lbu	a4,0(s1)
    2774:	06d00793          	li	a5,109
    2778:	0cf71663          	bne	a4,a5,2844 <.L39>
    277c:	01400793          	li	a5,20
    2780:	02f42023          	sw	a5,32(s0)
    2784:	00042e23          	sw	zero,28(s0)

00002788 <.L40>:
    2788:	13305e63          	blez	s3,28c4 <.L43>
    278c:	01410b93          	add	s7,sp,20
    2790:	00810b13          	add	s6,sp,8
    2794:	00000a13          	li	s4,0
    2798:	00200d13          	li	s10,2
    279c:	00900d93          	li	s11,9
    27a0:	00800c93          	li	s9,8

000027a4 <.L49>:
    27a4:	114d4863          	blt	s10,s4,28b4 <.L44>
    27a8:	000b2783          	lw	a5,0(s6)
    27ac:	01440733          	add	a4,s0,s4
    27b0:	02f70223          	sb	a5,36(a4)
    27b4:	0ff7f793          	zext.b	a5,a5

000027b8 <.L45>:
    27b8:	00f9d663          	bge	s3,a5,27c4 <.L46>
    27bc:	d6fdcae3          	blt	s11,a5,2530 <.L20>
    27c0:	00078993          	mv	s3,a5

000027c4 <.L46>:
    27c4:	000baa83          	lw	s5,0(s7)
    27c8:	039a8863          	beq	s5,s9,27f8 <.L47>
    27cc:	00279793          	sll	a5,a5,0x2
    27d0:	00f40933          	add	s2,s0,a5
    27d4:	02492503          	lw	a0,36(s2)
    27d8:	01950e63          	beq	a0,s9,27f4 <.L48>
    27dc:	01550c63          	beq	a0,s5,27f4 <.L48>
    27e0:	c2dff0ef          	jal	240c <_promoted_size>
    27e4:	00050c13          	mv	s8,a0
    27e8:	000a8513          	mv	a0,s5
    27ec:	c21ff0ef          	jal	240c <_promoted_size>
    27f0:	01854463          	blt	a0,s8,27f8 <.L47>

000027f4 <.L48>:
    27f4:	03592223          	sw	s5,36(s2)

000027f8 <.L47>:
    27f8:	01c42783          	lw	a5,28(s0)
    27fc:	001a0713          	add	a4,s4,1
    2800:	004b8b93          	add	s7,s7,4
    2804:	004b0b13          	add	s6,s6,4
    2808:	0b47d263          	bge	a5,s4,28ac <.L59>

0000280c <.L50>:
    280c:	01c42503          	lw	a0,28(s0)
    2810:	00148493          	add	s1,s1,1
    2814:	01342c23          	sw	s3,24(s0)
    2818:	00942023          	sw	s1,0(s0)
    281c:	00250513          	add	a0,a0,2
    2820:	d15ff06f          	j	2534 <.L5>

00002824 <.L28>:
    2824:	00174503          	lbu	a0,1(a4)
    2828:	00170713          	add	a4,a4,1
    282c:	e40514e3          	bnez	a0,2674 <.L30>
    2830:	e51ff06f          	j	2680 <.L29>

00002834 <.L32>:
    2834:	00174503          	lbu	a0,1(a4)
    2838:	00170713          	add	a4,a4,1
    283c:	e80510e3          	bnez	a0,26bc <.L36>
    2840:	ee5ff06f          	j	2724 <.L35>

00002844 <.L39>:
    2844:	01500793          	li	a5,21
    2848:	02f42023          	sw	a5,32(s0)
    284c:	0004c603          	lbu	a2,0(s1)
    2850:	00010717          	auipc	a4,0x10
    2854:	b5072703          	lw	a4,-1200(a4) # 123a0 <_custom_printf_spec>
    2858:	00a70693          	add	a3,a4,10
    285c:	00070793          	mv	a5,a4

00002860 <.L42>:
    2860:	0007c583          	lbu	a1,0(a5)
    2864:	02c59e63          	bne	a1,a2,28a0 <.L41>
    2868:	40e787b3          	sub	a5,a5,a4
    286c:	00279793          	sll	a5,a5,0x2
    2870:	00013717          	auipc	a4,0x13
    2874:	61870713          	add	a4,a4,1560 # 15e88 <_custom_printf_arginfo>
    2878:	00f707b3          	add	a5,a4,a5
    287c:	0007a783          	lw	a5,0(a5)
    2880:	01c10613          	add	a2,sp,28
    2884:	00500593          	li	a1,5
    2888:	00440513          	add	a0,s0,4
    288c:	000780e7          	jalr	a5
    2890:	00a42e23          	sw	a0,28(s0)
    2894:	00500793          	li	a5,5
    2898:	eea7d8e3          	bge	a5,a0,2788 <.L40>
    289c:	c95ff06f          	j	2530 <.L20>

000028a0 <.L41>:
    28a0:	00178793          	add	a5,a5,1
    28a4:	fad79ee3          	bne	a5,a3,2860 <.L42>
    28a8:	c89ff06f          	j	2530 <.L20>

000028ac <.L59>:
    28ac:	00070a13          	mv	s4,a4
    28b0:	ef5ff06f          	j	27a4 <.L49>

000028b4 <.L44>:
    28b4:	01012703          	lw	a4,16(sp)
    28b8:	ffea0793          	add	a5,s4,-2
    28bc:	00e787b3          	add	a5,a5,a4
    28c0:	ef9ff06f          	j	27b8 <.L45>

000028c4 <.L43>:
    28c4:	01c42603          	lw	a2,28(s0)
    28c8:	00100793          	li	a5,1
    28cc:	02f40323          	sb	a5,38(s0)
    28d0:	00261613          	sll	a2,a2,0x2
    28d4:	01c10593          	add	a1,sp,28
    28d8:	02840513          	add	a0,s0,40
    28dc:	214000ef          	jal	2af0 <__GI_memcpy>
    28e0:	f2dff06f          	j	280c <.L50>

000028e4 <.L14>:
    28e4:	c53046e3          	bgtz	s3,2530 <.L20>

000028e8 <.L19>:
    28e8:	0006c583          	lbu	a1,0(a3)
    28ec:	00000993          	li	s3,0
    28f0:	cae6fae3          	bgeu	a3,a4,25a4 <.L18>
    28f4:	cf5592e3          	bne	a1,s5,25d8 <.L12>
    28f8:	cadff06f          	j	25a4 <.L18>

000028fc <__GI___fputc_unlocked>:
    28fc:	0105a783          	lw	a5,16(a1)
    2900:	01c5a703          	lw	a4,28(a1)
    2904:	fe010113          	add	sp,sp,-32
    2908:	00812c23          	sw	s0,24(sp)
    290c:	00912a23          	sw	s1,20(sp)
    2910:	00112e23          	sw	ra,28(sp)
    2914:	00050493          	mv	s1,a0
    2918:	00058413          	mv	s0,a1
    291c:	02e7f463          	bgeu	a5,a4,2944 <.L2>
    2920:	00178713          	add	a4,a5,1
    2924:	00e5a823          	sw	a4,16(a1)
    2928:	00a78023          	sb	a0,0(a5)

0000292c <.L5>:
    292c:	0ff4f513          	zext.b	a0,s1

00002930 <.L1>:
    2930:	01c12083          	lw	ra,28(sp)
    2934:	01812403          	lw	s0,24(sp)
    2938:	01412483          	lw	s1,20(sp)
    293c:	02010113          	add	sp,sp,32
    2940:	00008067          	ret

00002944 <.L2>:
    2944:	0005d783          	lhu	a5,0(a1)
    2948:	0407f793          	and	a5,a5,64
    294c:	06078463          	beqz	a5,29b4 <.L4>

00002950 <.L7>:
    2950:	00442703          	lw	a4,4(s0)
    2954:	ffd00793          	li	a5,-3
    2958:	fcf70ae3          	beq	a4,a5,292c <.L5>
    295c:	00c42783          	lw	a5,12(s0)
    2960:	00842703          	lw	a4,8(s0)
    2964:	06e78a63          	beq	a5,a4,29d8 <.L9>
    2968:	01042703          	lw	a4,16(s0)
    296c:	04e78e63          	beq	a5,a4,29c8 <.L10>

00002970 <.L14>:
    2970:	01042783          	lw	a5,16(s0)
    2974:	00178713          	add	a4,a5,1
    2978:	00e42823          	sw	a4,16(s0)
    297c:	0ff4f713          	zext.b	a4,s1
    2980:	00e78023          	sb	a4,0(a5)
    2984:	00045783          	lhu	a5,0(s0)
    2988:	1007f793          	and	a5,a5,256
    298c:	fa0780e3          	beqz	a5,292c <.L5>
    2990:	00a00793          	li	a5,10
    2994:	f8f71ce3          	bne	a4,a5,292c <.L5>
    2998:	00040513          	mv	a0,s0
    299c:	ffdfe0ef          	jal	1998 <__stdio_wcommit>
    29a0:	f80506e3          	beqz	a0,292c <.L5>
    29a4:	01042783          	lw	a5,16(s0)
    29a8:	fff78793          	add	a5,a5,-1
    29ac:	00f42823          	sw	a5,16(s0)
    29b0:	0100006f          	j	29c0 <.L8>

000029b4 <.L4>:
    29b4:	00058513          	mv	a0,a1
    29b8:	530020ef          	jal	4ee8 <__stdio_trans2w>
    29bc:	f8050ae3          	beqz	a0,2950 <.L7>

000029c0 <.L8>:
    29c0:	fff00513          	li	a0,-1
    29c4:	f6dff06f          	j	2930 <.L1>

000029c8 <.L10>:
    29c8:	00040513          	mv	a0,s0
    29cc:	fcdfe0ef          	jal	1998 <__stdio_wcommit>
    29d0:	fa0500e3          	beqz	a0,2970 <.L14>
    29d4:	fedff06f          	j	29c0 <.L8>

000029d8 <.L9>:
    29d8:	00100613          	li	a2,1
    29dc:	00f10593          	add	a1,sp,15
    29e0:	00040513          	mv	a0,s0
    29e4:	009107a3          	sb	s1,15(sp)
    29e8:	7dd010ef          	jal	49c4 <__stdio_WRITE>
    29ec:	f40510e3          	bnez	a0,292c <.L5>
    29f0:	fd1ff06f          	j	29c0 <.L8>

000029f4 <__GI_fputs>:
    29f4:	fe010113          	add	sp,sp,-32
    29f8:	00812c23          	sw	s0,24(sp)
    29fc:	00912a23          	sw	s1,20(sp)
    2a00:	00112e23          	sw	ra,28(sp)
    2a04:	00050493          	mv	s1,a0
    2a08:	00b12623          	sw	a1,12(sp)
    2a0c:	430000ef          	jal	2e3c <__GI_strlen>
    2a10:	00c12683          	lw	a3,12(sp)
    2a14:	00050413          	mv	s0,a0
    2a18:	00050613          	mv	a2,a0
    2a1c:	00100593          	li	a1,1
    2a20:	00048513          	mv	a0,s1
    2a24:	020000ef          	jal	2a44 <__GI_fwrite>
    2a28:	00850463          	beq	a0,s0,2a30 <.L1>
    2a2c:	fff00513          	li	a0,-1

00002a30 <.L1>:
    2a30:	01c12083          	lw	ra,28(sp)
    2a34:	01812403          	lw	s0,24(sp)
    2a38:	01412483          	lw	s1,20(sp)
    2a3c:	02010113          	add	sp,sp,32
    2a40:	00008067          	ret

00002a44 <__GI_fwrite>:
    2a44:	0006d783          	lhu	a5,0(a3)
    2a48:	fe010113          	add	sp,sp,-32
    2a4c:	00812c23          	sw	s0,24(sp)
    2a50:	00912a23          	sw	s1,20(sp)
    2a54:	01212823          	sw	s2,16(sp)
    2a58:	01312623          	sw	s3,12(sp)
    2a5c:	00112e23          	sw	ra,28(sp)
    2a60:	0407f793          	and	a5,a5,64
    2a64:	00050993          	mv	s3,a0
    2a68:	00058493          	mv	s1,a1
    2a6c:	00060913          	mv	s2,a2
    2a70:	00068413          	mv	s0,a3
    2a74:	02078463          	beqz	a5,2a9c <.L2>

00002a78 <.L5>:
    2a78:	02049a63          	bnez	s1,2aac <.L3>

00002a7c <.L10>:
    2a7c:	00000513          	li	a0,0

00002a80 <.L1>:
    2a80:	01c12083          	lw	ra,28(sp)
    2a84:	01812403          	lw	s0,24(sp)
    2a88:	01412483          	lw	s1,20(sp)
    2a8c:	01012903          	lw	s2,16(sp)
    2a90:	00c12983          	lw	s3,12(sp)
    2a94:	02010113          	add	sp,sp,32
    2a98:	00008067          	ret

00002a9c <.L2>:
    2a9c:	00068513          	mv	a0,a3
    2aa0:	448020ef          	jal	4ee8 <__stdio_trans2w>
    2aa4:	fc050ae3          	beqz	a0,2a78 <.L5>
    2aa8:	fd5ff06f          	j	2a7c <.L10>

00002aac <.L3>:
    2aac:	fc0908e3          	beqz	s2,2a7c <.L10>
    2ab0:	0324b7b3          	mulhu	a5,s1,s2
    2ab4:	00079e63          	bnez	a5,2ad0 <.L9>
    2ab8:	032485b3          	mul	a1,s1,s2
    2abc:	00040613          	mv	a2,s0
    2ac0:	00098513          	mv	a0,s3
    2ac4:	2d4020ef          	jal	4d98 <__stdio_fwrite>
    2ac8:	02955533          	divu	a0,a0,s1
    2acc:	fb5ff06f          	j	2a80 <.L1>

00002ad0 <.L9>:
    2ad0:	00045783          	lhu	a5,0(s0)
    2ad4:	01600713          	li	a4,22
    2ad8:	0087e793          	or	a5,a5,8
    2adc:	00f41023          	sh	a5,0(s0)
    2ae0:	0000d797          	auipc	a5,0xd
    2ae4:	7b47a783          	lw	a5,1972(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    2ae8:	00e7a023          	sw	a4,0(a5)
    2aec:	f91ff06f          	j	2a7c <.L10>

00002af0 <__GI_memcpy>:
    2af0:	00f00713          	li	a4,15
    2af4:	00050693          	mv	a3,a0
    2af8:	00058793          	mv	a5,a1
    2afc:	16c77a63          	bgeu	a4,a2,2c70 <.L2>
    2b00:	40a007b3          	neg	a5,a0
    2b04:	0037f793          	and	a5,a5,3
    2b08:	40f60633          	sub	a2,a2,a5
    2b0c:	00000713          	li	a4,0

00002b10 <.L3>:
    2b10:	04e79463          	bne	a5,a4,2b58 <.L4>
    2b14:	00f585b3          	add	a1,a1,a5
    2b18:	00f508b3          	add	a7,a0,a5
    2b1c:	0035fe13          	and	t3,a1,3
    2b20:	00088793          	mv	a5,a7
    2b24:	00265713          	srl	a4,a2,0x2
    2b28:	140e1a63          	bnez	t3,2c7c <.L5>
    2b2c:	00777693          	and	a3,a4,7
    2b30:	fff68693          	add	a3,a3,-1
    2b34:	00600313          	li	t1,6
    2b38:	0005a803          	lw	a6,0(a1)
    2b3c:	0ed36863          	bltu	t1,a3,2c2c <.L6>
    2b40:	9ac18313          	add	t1,gp,-1620 # 104cc <.L8>
    2b44:	00269693          	sll	a3,a3,0x2
    2b48:	006686b3          	add	a3,a3,t1
    2b4c:	0006a683          	lw	a3,0(a3)
    2b50:	006686b3          	add	a3,a3,t1
    2b54:	00068067          	jr	a3

00002b58 <.L4>:
    2b58:	00e586b3          	add	a3,a1,a4
    2b5c:	0006c803          	lbu	a6,0(a3)
    2b60:	00e506b3          	add	a3,a0,a4
    2b64:	00170713          	add	a4,a4,1
    2b68:	01068023          	sb	a6,0(a3)
    2b6c:	fa5ff06f          	j	2b10 <.L3>

00002b70 <.L13>:
    2b70:	fe858693          	add	a3,a1,-24
    2b74:	fe488793          	add	a5,a7,-28
    2b78:	00670713          	add	a4,a4,6

00002b7c <.L15>:
    2b7c:	01c6a303          	lw	t1,28(a3)
    2b80:	ff870713          	add	a4,a4,-8
    2b84:	0107ae23          	sw	a6,28(a5)
    2b88:	02078813          	add	a6,a5,32
    2b8c:	0c070863          	beqz	a4,2c5c <.L23>
    2b90:	00080793          	mv	a5,a6
    2b94:	02068693          	add	a3,a3,32
    2b98:	00030813          	mv	a6,t1
    2b9c:	0b00006f          	j	2c4c <.L22>

00002ba0 <.L12>:
    2ba0:	fec58693          	add	a3,a1,-20
    2ba4:	fe888793          	add	a5,a7,-24
    2ba8:	00570713          	add	a4,a4,5

00002bac <.L16>:
    2bac:	0186a303          	lw	t1,24(a3)
    2bb0:	0107ac23          	sw	a6,24(a5)
    2bb4:	00030813          	mv	a6,t1
    2bb8:	fc5ff06f          	j	2b7c <.L15>

00002bbc <.L11>:
    2bbc:	ff058693          	add	a3,a1,-16
    2bc0:	fec88793          	add	a5,a7,-20
    2bc4:	00470713          	add	a4,a4,4

00002bc8 <.L17>:
    2bc8:	0146a303          	lw	t1,20(a3)
    2bcc:	0107aa23          	sw	a6,20(a5)
    2bd0:	00030813          	mv	a6,t1
    2bd4:	fd9ff06f          	j	2bac <.L16>

00002bd8 <.L10>:
    2bd8:	ff458693          	add	a3,a1,-12
    2bdc:	ff088793          	add	a5,a7,-16
    2be0:	00370713          	add	a4,a4,3

00002be4 <.L18>:
    2be4:	0106a303          	lw	t1,16(a3)
    2be8:	0107a823          	sw	a6,16(a5)
    2bec:	00030813          	mv	a6,t1
    2bf0:	fd9ff06f          	j	2bc8 <.L17>

00002bf4 <.L9>:
    2bf4:	ff858693          	add	a3,a1,-8
    2bf8:	ff488793          	add	a5,a7,-12
    2bfc:	00270713          	add	a4,a4,2

00002c00 <.L19>:
    2c00:	00c6a303          	lw	t1,12(a3)
    2c04:	0107a623          	sw	a6,12(a5)
    2c08:	00030813          	mv	a6,t1
    2c0c:	fd9ff06f          	j	2be4 <.L18>

00002c10 <.L7>:
    2c10:	ffc58693          	add	a3,a1,-4
    2c14:	ff888793          	add	a5,a7,-8
    2c18:	00170713          	add	a4,a4,1

00002c1c <.L20>:
    2c1c:	0086a303          	lw	t1,8(a3)
    2c20:	0107a423          	sw	a6,8(a5)
    2c24:	00030813          	mv	a6,t1
    2c28:	fd9ff06f          	j	2c00 <.L19>

00002c2c <.L6>:
    2c2c:	00058693          	mv	a3,a1
    2c30:	ffc88793          	add	a5,a7,-4

00002c34 <.L21>:
    2c34:	0046a303          	lw	t1,4(a3)
    2c38:	0107a223          	sw	a6,4(a5)
    2c3c:	00030813          	mv	a6,t1
    2c40:	fddff06f          	j	2c1c <.L20>

00002c44 <.L14>:
    2c44:	00458693          	add	a3,a1,4
    2c48:	fff70713          	add	a4,a4,-1

00002c4c <.L22>:
    2c4c:	0006a303          	lw	t1,0(a3)
    2c50:	0107a023          	sw	a6,0(a5)
    2c54:	00030813          	mv	a6,t1
    2c58:	fddff06f          	j	2c34 <.L21>

00002c5c <.L23>:
    2c5c:	0267a023          	sw	t1,32(a5)

00002c60 <.L24>:
    2c60:	ffc67693          	and	a3,a2,-4
    2c64:	00b687b3          	add	a5,a3,a1
    2c68:	00367613          	and	a2,a2,3
    2c6c:	011686b3          	add	a3,a3,a7

00002c70 <.L2>:
    2c70:	00000713          	li	a4,0

00002c74 <.L34>:
    2c74:	10e61663          	bne	a2,a4,2d80 <.L35>
    2c78:	00008067          	ret

00002c7c <.L5>:
    2c7c:	ffc5fe93          	and	t4,a1,-4
    2c80:	003e1e13          	sll	t3,t3,0x3
    2c84:	02000f93          	li	t6,32
    2c88:	00377f13          	and	t5,a4,3
    2c8c:	00200293          	li	t0,2
    2c90:	000ea683          	lw	a3,0(t4)
    2c94:	004ea803          	lw	a6,4(t4)
    2c98:	41cf8fb3          	sub	t6,t6,t3
    2c9c:	004e8313          	add	t1,t4,4
    2ca0:	025f0c63          	beq	t5,t0,2cd8 <.L25>
    2ca4:	00300293          	li	t0,3
    2ca8:	065f0863          	beq	t5,t0,2d18 <.L26>
    2cac:	00100293          	li	t0,1
    2cb0:	085f0a63          	beq	t5,t0,2d44 <.L27>
    2cb4:	ffc88793          	add	a5,a7,-4

00002cb8 <.L31>:
    2cb8:	00432e83          	lw	t4,4(t1)
    2cbc:	01f81f33          	sll	t5,a6,t6
    2cc0:	01c6d6b3          	srl	a3,a3,t3
    2cc4:	01e6e6b3          	or	a3,a3,t5
    2cc8:	00d7a223          	sw	a3,4(a5)
    2ccc:	00080693          	mv	a3,a6
    2cd0:	000e8813          	mv	a6,t4
    2cd4:	0500006f          	j	2d24 <.L30>

00002cd8 <.L25>:
    2cd8:	ffce8313          	add	t1,t4,-4
    2cdc:	ff488793          	add	a5,a7,-12
    2ce0:	00270713          	add	a4,a4,2

00002ce4 <.L29>:
    2ce4:	01c6d6b3          	srl	a3,a3,t3
    2ce8:	01f81f33          	sll	t5,a6,t6
    2cec:	01e6e6b3          	or	a3,a3,t5
    2cf0:	00c32e83          	lw	t4,12(t1)
    2cf4:	ffc70713          	add	a4,a4,-4
    2cf8:	00d7a623          	sw	a3,12(a5)
    2cfc:	01078693          	add	a3,a5,16
    2d00:	06070663          	beqz	a4,2d6c <.L33>
    2d04:	00068793          	mv	a5,a3
    2d08:	01030313          	add	t1,t1,16
    2d0c:	00080693          	mv	a3,a6
    2d10:	000e8813          	mv	a6,t4
    2d14:	0380006f          	j	2d4c <.L32>

00002d18 <.L26>:
    2d18:	000e8313          	mv	t1,t4
    2d1c:	ff888793          	add	a5,a7,-8
    2d20:	00170713          	add	a4,a4,1

00002d24 <.L30>:
    2d24:	00832e83          	lw	t4,8(t1)
    2d28:	01f81f33          	sll	t5,a6,t6
    2d2c:	01c6d6b3          	srl	a3,a3,t3
    2d30:	01e6e6b3          	or	a3,a3,t5
    2d34:	00d7a423          	sw	a3,8(a5)
    2d38:	00080693          	mv	a3,a6
    2d3c:	000e8813          	mv	a6,t4
    2d40:	fa5ff06f          	j	2ce4 <.L29>

00002d44 <.L27>:
    2d44:	008e8313          	add	t1,t4,8
    2d48:	fff70713          	add	a4,a4,-1

00002d4c <.L32>:
    2d4c:	00032e83          	lw	t4,0(t1)
    2d50:	01f81f33          	sll	t5,a6,t6
    2d54:	01c6d6b3          	srl	a3,a3,t3
    2d58:	01e6e6b3          	or	a3,a3,t5
    2d5c:	00d7a023          	sw	a3,0(a5)
    2d60:	00080693          	mv	a3,a6
    2d64:	000e8813          	mv	a6,t4
    2d68:	f51ff06f          	j	2cb8 <.L31>

00002d6c <.L33>:
    2d6c:	01c85833          	srl	a6,a6,t3
    2d70:	01fe9eb3          	sll	t4,t4,t6
    2d74:	01d86833          	or	a6,a6,t4
    2d78:	0107a823          	sw	a6,16(a5)
    2d7c:	ee5ff06f          	j	2c60 <.L24>

00002d80 <.L35>:
    2d80:	00e785b3          	add	a1,a5,a4
    2d84:	0005c803          	lbu	a6,0(a1)
    2d88:	00e685b3          	add	a1,a3,a4
    2d8c:	00170713          	add	a4,a4,1
    2d90:	01058023          	sb	a6,0(a1)
    2d94:	ee1ff06f          	j	2c74 <.L34>

00002d98 <__GI_memset>:
    2d98:	00700713          	li	a4,7
    2d9c:	00050793          	mv	a5,a0
    2da0:	04c77263          	bgeu	a4,a2,2de4 <.L2>
    2da4:	010106b7          	lui	a3,0x1010
    2da8:	0ff5f713          	zext.b	a4,a1
    2dac:	10168693          	add	a3,a3,257 # 1010101 <_ebss+0xffa211>
    2db0:	02d70733          	mul	a4,a4,a3

00002db4 <.L3>:
    2db4:	0037f693          	and	a3,a5,3
    2db8:	02069c63          	bnez	a3,2df0 <.L4>
    2dbc:	00c50633          	add	a2,a0,a2
    2dc0:	40f60633          	sub	a2,a2,a5
    2dc4:	fe067813          	and	a6,a2,-32
    2dc8:	00f80833          	add	a6,a6,a5
    2dcc:	00080693          	mv	a3,a6

00002dd0 <.L5>:
    2dd0:	03079663          	bne	a5,a6,2dfc <.L6>
    2dd4:	01c67813          	and	a6,a2,28
    2dd8:	00f807b3          	add	a5,a6,a5

00002ddc <.L7>:
    2ddc:	04f69463          	bne	a3,a5,2e24 <.L8>
    2de0:	00367613          	and	a2,a2,3

00002de4 <.L2>:
    2de4:	00c78633          	add	a2,a5,a2

00002de8 <.L9>:
    2de8:	04c79463          	bne	a5,a2,2e30 <.L10>
    2dec:	00008067          	ret

00002df0 <.L4>:
    2df0:	00b78023          	sb	a1,0(a5)
    2df4:	00178793          	add	a5,a5,1
    2df8:	fbdff06f          	j	2db4 <.L3>

00002dfc <.L6>:
    2dfc:	00e7a023          	sw	a4,0(a5)
    2e00:	00e7a223          	sw	a4,4(a5)
    2e04:	00e7a423          	sw	a4,8(a5)
    2e08:	00e7a623          	sw	a4,12(a5)
    2e0c:	00e7a823          	sw	a4,16(a5)
    2e10:	00e7aa23          	sw	a4,20(a5)
    2e14:	00e7ac23          	sw	a4,24(a5)
    2e18:	00e7ae23          	sw	a4,28(a5)
    2e1c:	02078793          	add	a5,a5,32
    2e20:	fb1ff06f          	j	2dd0 <.L5>

00002e24 <.L8>:
    2e24:	00e6a023          	sw	a4,0(a3)
    2e28:	00468693          	add	a3,a3,4
    2e2c:	fb1ff06f          	j	2ddc <.L7>

00002e30 <.L10>:
    2e30:	00b78023          	sb	a1,0(a5)
    2e34:	00178793          	add	a5,a5,1
    2e38:	fb1ff06f          	j	2de8 <.L9>

00002e3c <__GI_strlen>:
    2e3c:	00050793          	mv	a5,a0

00002e40 <.L2>:
    2e40:	0037f713          	and	a4,a5,3
    2e44:	04071263          	bnez	a4,2e88 <.L5>
    2e48:	feff0637          	lui	a2,0xfeff0
    2e4c:	808085b7          	lui	a1,0x80808
    2e50:	eff60613          	add	a2,a2,-257 # fefefeff <_ebss+0xfefda00f>
    2e54:	08058593          	add	a1,a1,128 # 80808080 <_ebss+0x807f2190>

00002e58 <.L6>:
    2e58:	0007a683          	lw	a3,0(a5)
    2e5c:	00478713          	add	a4,a5,4
    2e60:	00c686b3          	add	a3,a3,a2
    2e64:	00b6f6b3          	and	a3,a3,a1
    2e68:	02068c63          	beqz	a3,2ea0 <.L7>
    2e6c:	ffc74683          	lbu	a3,-4(a4)
    2e70:	02068063          	beqz	a3,2e90 <.L14>
    2e74:	ffd74683          	lbu	a3,-3(a4)
    2e78:	02069863          	bnez	a3,2ea8 <.L9>
    2e7c:	40a787b3          	sub	a5,a5,a0
    2e80:	00178513          	add	a0,a5,1
    2e84:	00008067          	ret

00002e88 <.L5>:
    2e88:	0007c703          	lbu	a4,0(a5)
    2e8c:	00071663          	bnez	a4,2e98 <.L3>

00002e90 <.L14>:
    2e90:	40a78533          	sub	a0,a5,a0
    2e94:	00008067          	ret

00002e98 <.L3>:
    2e98:	00178793          	add	a5,a5,1
    2e9c:	fa5ff06f          	j	2e40 <.L2>

00002ea0 <.L7>:
    2ea0:	00070793          	mv	a5,a4
    2ea4:	fb5ff06f          	j	2e58 <.L6>

00002ea8 <.L9>:
    2ea8:	ffe74683          	lbu	a3,-2(a4)
    2eac:	00069863          	bnez	a3,2ebc <.L10>
    2eb0:	40a787b3          	sub	a5,a5,a0
    2eb4:	00278513          	add	a0,a5,2
    2eb8:	00008067          	ret

00002ebc <.L10>:
    2ebc:	fff74683          	lbu	a3,-1(a4)
    2ec0:	fe0690e3          	bnez	a3,2ea0 <.L7>
    2ec4:	40a787b3          	sub	a5,a5,a0
    2ec8:	00378513          	add	a0,a5,3
    2ecc:	00008067          	ret

00002ed0 <__GI_strnlen>:
    2ed0:	00050713          	mv	a4,a0
    2ed4:	00058513          	mv	a0,a1
    2ed8:	06058a63          	beqz	a1,2f4c <.L2>
    2edc:	00b705b3          	add	a1,a4,a1
    2ee0:	00e5f463          	bgeu	a1,a4,2ee8 <.L3>
    2ee4:	fff00593          	li	a1,-1

00002ee8 <.L3>:
    2ee8:	00070793          	mv	a5,a4

00002eec <.L4>:
    2eec:	0037f693          	and	a3,a5,3
    2ef0:	04069463          	bnez	a3,2f38 <.L7>
    2ef4:	feff0537          	lui	a0,0xfeff0
    2ef8:	80808837          	lui	a6,0x80808
    2efc:	00078693          	mv	a3,a5
    2f00:	eff50513          	add	a0,a0,-257 # fefefeff <_ebss+0xfefda00f>
    2f04:	08080813          	add	a6,a6,128 # 80808080 <_ebss+0x807f2190>

00002f08 <.L8>:
    2f08:	02b6fc63          	bgeu	a3,a1,2f40 <.L10>
    2f0c:	0006a783          	lw	a5,0(a3)
    2f10:	00468613          	add	a2,a3,4
    2f14:	00a787b3          	add	a5,a5,a0
    2f18:	0107f7b3          	and	a5,a5,a6
    2f1c:	04078e63          	beqz	a5,2f78 <.L18>
    2f20:	ffc64783          	lbu	a5,-4(a2)
    2f24:	06078063          	beqz	a5,2f84 <.L17>
    2f28:	ffd64783          	lbu	a5,-3(a2)
    2f2c:	02079663          	bnez	a5,2f58 <.L11>
    2f30:	00168793          	add	a5,a3,1
    2f34:	00c0006f          	j	2f40 <.L10>

00002f38 <.L7>:
    2f38:	0007c683          	lbu	a3,0(a5)
    2f3c:	00069a63          	bnez	a3,2f50 <.L5>

00002f40 <.L10>:
    2f40:	00b7f463          	bgeu	a5,a1,2f48 <.L14>
    2f44:	00078593          	mv	a1,a5

00002f48 <.L14>:
    2f48:	40e58533          	sub	a0,a1,a4

00002f4c <.L2>:
    2f4c:	00008067          	ret

00002f50 <.L5>:
    2f50:	00178793          	add	a5,a5,1
    2f54:	f99ff06f          	j	2eec <.L4>

00002f58 <.L11>:
    2f58:	ffe64783          	lbu	a5,-2(a2)
    2f5c:	00079663          	bnez	a5,2f68 <.L12>
    2f60:	00268793          	add	a5,a3,2
    2f64:	fddff06f          	j	2f40 <.L10>

00002f68 <.L12>:
    2f68:	fff64783          	lbu	a5,-1(a2)
    2f6c:	00079663          	bnez	a5,2f78 <.L18>
    2f70:	00368793          	add	a5,a3,3
    2f74:	fcdff06f          	j	2f40 <.L10>

00002f78 <.L18>:
    2f78:	00058793          	mv	a5,a1
    2f7c:	00060693          	mv	a3,a2
    2f80:	f89ff06f          	j	2f08 <.L8>

00002f84 <.L17>:
    2f84:	00068793          	mv	a5,a3
    2f88:	fb9ff06f          	j	2f40 <.L10>

00002f8c <__GI___glibc_strerror_r>:
    2f8c:	ff010113          	add	sp,sp,-16
    2f90:	00812423          	sw	s0,8(sp)
    2f94:	00112623          	sw	ra,12(sp)
    2f98:	00058413          	mv	s0,a1
    2f9c:	018000ef          	jal	2fb4 <__GI___xpg_strerror_r>
    2fa0:	00c12083          	lw	ra,12(sp)
    2fa4:	00040513          	mv	a0,s0
    2fa8:	00812403          	lw	s0,8(sp)
    2fac:	01010113          	add	sp,sp,16
    2fb0:	00008067          	ret

00002fb4 <__GI___xpg_strerror_r>:
    2fb4:	fa010113          	add	sp,sp,-96
    2fb8:	05312623          	sw	s3,76(sp)
    2fbc:	05412423          	sw	s4,72(sp)
    2fc0:	04112e23          	sw	ra,92(sp)
    2fc4:	04812c23          	sw	s0,88(sp)
    2fc8:	04912a23          	sw	s1,84(sp)
    2fcc:	05212823          	sw	s2,80(sp)
    2fd0:	07c00793          	li	a5,124
    2fd4:	00058993          	mv	s3,a1
    2fd8:	00060a13          	mv	s4,a2
    2fdc:	08a7f463          	bgeu	a5,a0,3064 <.L13>

00002fe0 <.L3>:
    2fe0:	00050593          	mv	a1,a0
    2fe4:	41f55613          	sra	a2,a0,0x1f
    2fe8:	00000713          	li	a4,0
    2fec:	ff600693          	li	a3,-10
    2ff0:	03d10513          	add	a0,sp,61
    2ff4:	080020ef          	jal	5074 <_uintmaxtostr>
    2ff8:	ff250913          	add	s2,a0,-14
    2ffc:	00e00613          	li	a2,14
    3000:	0000f597          	auipc	a1,0xf
    3004:	f8458593          	add	a1,a1,-124 # 11f84 <unknown.0>
    3008:	00090513          	mv	a0,s2
    300c:	ae5ff0ef          	jal	2af0 <__GI_memcpy>
    3010:	01600493          	li	s1,22
    3014:	01c0006f          	j	3030 <.L6>

00003018 <.L5>:
    3018:	00079463          	bnez	a5,3020 <.L4>
    301c:	fff48493          	add	s1,s1,-1

00003020 <.L4>:
    3020:	00190913          	add	s2,s2,1

00003024 <.L2>:
    3024:	00094783          	lbu	a5,0(s2)
    3028:	fe0498e3          	bnez	s1,3018 <.L5>
    302c:	fa078ae3          	beqz	a5,2fe0 <.L3>

00003030 <.L6>:
    3030:	00099463          	bnez	s3,3038 <.L7>
    3034:	00000a13          	li	s4,0

00003038 <.L7>:
    3038:	00090513          	mv	a0,s2
    303c:	e01ff0ef          	jal	2e3c <__GI_strlen>
    3040:	00150413          	add	s0,a0,1
    3044:	028a7863          	bgeu	s4,s0,3074 <.L8>
    3048:	000a0413          	mv	s0,s4
    304c:	02200493          	li	s1,34
    3050:	020a1463          	bnez	s4,3078 <.L9>

00003054 <.L10>:
    3054:	0000d797          	auipc	a5,0xd
    3058:	2407a783          	lw	a5,576(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    305c:	0097a023          	sw	s1,0(a5)
    3060:	0340006f          	j	3094 <.L1>

00003064 <.L13>:
    3064:	00050493          	mv	s1,a0
    3068:	0000d917          	auipc	s2,0xd
    306c:	48090913          	add	s2,s2,1152 # 104e8 <_string_syserrmsgs>
    3070:	fb5ff06f          	j	3024 <.L2>

00003074 <.L8>:
    3074:	00040e63          	beqz	s0,3090 <.L11>

00003078 <.L9>:
    3078:	00098513          	mv	a0,s3
    307c:	00040613          	mv	a2,s0
    3080:	00090593          	mv	a1,s2
    3084:	008989b3          	add	s3,s3,s0
    3088:	a69ff0ef          	jal	2af0 <__GI_memcpy>
    308c:	fe098fa3          	sb	zero,-1(s3)

00003090 <.L11>:
    3090:	fc0492e3          	bnez	s1,3054 <.L10>

00003094 <.L1>:
    3094:	05c12083          	lw	ra,92(sp)
    3098:	05812403          	lw	s0,88(sp)
    309c:	05012903          	lw	s2,80(sp)
    30a0:	04c12983          	lw	s3,76(sp)
    30a4:	04812a03          	lw	s4,72(sp)
    30a8:	00048513          	mv	a0,s1
    30ac:	05412483          	lw	s1,84(sp)
    30b0:	06010113          	add	sp,sp,96
    30b4:	00008067          	ret

000030b8 <__GI_isatty>:
    30b8:	fb010113          	add	sp,sp,-80
    30bc:	00410593          	add	a1,sp,4
    30c0:	04112623          	sw	ra,76(sp)
    30c4:	014000ef          	jal	30d8 <__GI_tcgetattr>
    30c8:	04c12083          	lw	ra,76(sp)
    30cc:	00153513          	seqz	a0,a0
    30d0:	05010113          	add	sp,sp,80
    30d4:	00008067          	ret

000030d8 <__GI_tcgetattr>:
    30d8:	fc010113          	add	sp,sp,-64
    30dc:	02812c23          	sw	s0,56(sp)
    30e0:	00058413          	mv	s0,a1
    30e4:	000055b7          	lui	a1,0x5
    30e8:	00c10613          	add	a2,sp,12
    30ec:	40158593          	add	a1,a1,1025 # 5401 <.L12+0x9>
    30f0:	02912a23          	sw	s1,52(sp)
    30f4:	02112e23          	sw	ra,60(sp)
    30f8:	d9cfe0ef          	jal	1694 <__GI_ioctl>
    30fc:	00050493          	mv	s1,a0
    3100:	04051463          	bnez	a0,3148 <.L1>
    3104:	00c12783          	lw	a5,12(sp)
    3108:	01300613          	li	a2,19
    310c:	01d10593          	add	a1,sp,29
    3110:	00f42023          	sw	a5,0(s0)
    3114:	01012783          	lw	a5,16(sp)
    3118:	01140513          	add	a0,s0,17
    311c:	00f42223          	sw	a5,4(s0)
    3120:	01412783          	lw	a5,20(sp)
    3124:	00f42423          	sw	a5,8(s0)
    3128:	01812783          	lw	a5,24(sp)
    312c:	00f42623          	sw	a5,12(s0)
    3130:	01c14783          	lbu	a5,28(sp)
    3134:	00f40823          	sb	a5,16(s0)
    3138:	769020ef          	jal	60a0 <__GI_mempcpy>
    313c:	00d00613          	li	a2,13
    3140:	00000593          	li	a1,0
    3144:	c55ff0ef          	jal	2d98 <__GI_memset>

00003148 <.L1>:
    3148:	03c12083          	lw	ra,60(sp)
    314c:	03812403          	lw	s0,56(sp)
    3150:	00048513          	mv	a0,s1
    3154:	03412483          	lw	s1,52(sp)
    3158:	04010113          	add	sp,sp,64
    315c:	00008067          	ret

00003160 <__malloc_from_heap>:
    3160:	fd010113          	add	sp,sp,-48
    3164:	01412c23          	sw	s4,24(sp)
    3168:	01512a23          	sw	s5,20(sp)
    316c:	00058a13          	mv	s4,a1
    3170:	00850513          	add	a0,a0,8
    3174:	00c10a93          	add	s5,sp,12
    3178:	00a12623          	sw	a0,12(sp)
    317c:	000a8593          	mv	a1,s5
    3180:	000a0513          	mv	a0,s4
    3184:	03212023          	sw	s2,32(sp)
    3188:	02112623          	sw	ra,44(sp)
    318c:	02812423          	sw	s0,40(sp)
    3190:	02912223          	sw	s1,36(sp)
    3194:	01312e23          	sw	s3,28(sp)
    3198:	354000ef          	jal	34ec <__heap_alloc>
    319c:	00050913          	mv	s2,a0
    31a0:	0a051863          	bnez	a0,3250 <.L2>
    31a4:	00050493          	mv	s1,a0
    31a8:	01e00513          	li	a0,30
    31ac:	04d000ef          	jal	39f8 <__GI_sysconf>
    31b0:	00c12783          	lw	a5,12(sp)
    31b4:	0ca7f863          	bgeu	a5,a0,3284 <.L3>
    31b8:	01e00513          	li	a0,30
    31bc:	03d000ef          	jal	39f8 <__GI_sysconf>
    31c0:	00050413          	mv	s0,a0

000031c4 <.L4>:
    31c4:	040006b7          	lui	a3,0x4000
    31c8:	00000793          	li	a5,0
    31cc:	00000713          	li	a4,0
    31d0:	02168693          	add	a3,a3,33 # 4000021 <_ebss+0x3fea131>
    31d4:	00300613          	li	a2,3
    31d8:	00040593          	mv	a1,s0
    31dc:	00000513          	li	a0,0
    31e0:	7ed000ef          	jal	41cc <__GI_mmap>
    31e4:	fff00793          	li	a5,-1
    31e8:	00050993          	mv	s3,a0
    31ec:	06f50863          	beq	a0,a5,325c <.L1>
    31f0:	00040613          	mv	a2,s0
    31f4:	00050593          	mv	a1,a0
    31f8:	000a0513          	mv	a0,s4
    31fc:	378000ef          	jal	3574 <__heap_free>
    3200:	000a8593          	mv	a1,s5
    3204:	000a0513          	mv	a0,s4
    3208:	2e4000ef          	jal	34ec <__heap_alloc>
    320c:	00050913          	mv	s2,a0
    3210:	0000d597          	auipc	a1,0xd
    3214:	0c45a583          	lw	a1,196(a1) # 102d4 <.LLST90+0x2f>
    3218:	00c00513          	li	a0,12
    321c:	f45ff0ef          	jal	3160 <__malloc_from_heap>
    3220:	0000d617          	auipc	a2,0xd
    3224:	07c62603          	lw	a2,124(a2) # 1029c <_GLOBAL_OFFSET_TABLE_+0x14>
    3228:	00062703          	lw	a4,0(a2)
    322c:	00050793          	mv	a5,a0
    3230:	00000693          	li	a3,0

00003234 <.L7>:
    3234:	06071c63          	bnez	a4,32ac <.L9>

00003238 <.L8>:
    3238:	00e7a423          	sw	a4,8(a5)
    323c:	0137a023          	sw	s3,0(a5)
    3240:	0087a223          	sw	s0,4(a5)
    3244:	06068e63          	beqz	a3,32c0 <.L10>
    3248:	00f6a423          	sw	a5,8(a3)

0000324c <.L11>:
    324c:	00090863          	beqz	s2,325c <.L1>

00003250 <.L2>:
    3250:	00c12783          	lw	a5,12(sp)
    3254:	00890493          	add	s1,s2,8
    3258:	00f92023          	sw	a5,0(s2)

0000325c <.L1>:
    325c:	02c12083          	lw	ra,44(sp)
    3260:	02812403          	lw	s0,40(sp)
    3264:	02012903          	lw	s2,32(sp)
    3268:	01c12983          	lw	s3,28(sp)
    326c:	01812a03          	lw	s4,24(sp)
    3270:	01412a83          	lw	s5,20(sp)
    3274:	00048513          	mv	a0,s1
    3278:	02412483          	lw	s1,36(sp)
    327c:	03010113          	add	sp,sp,48
    3280:	00008067          	ret

00003284 <.L3>:
    3284:	01e00513          	li	a0,30
    3288:	770000ef          	jal	39f8 <__GI_sysconf>
    328c:	00c12903          	lw	s2,12(sp)
    3290:	fff90913          	add	s2,s2,-1
    3294:	00a90933          	add	s2,s2,a0
    3298:	01e00513          	li	a0,30
    329c:	75c000ef          	jal	39f8 <__GI_sysconf>
    32a0:	40a00433          	neg	s0,a0
    32a4:	01247433          	and	s0,s0,s2
    32a8:	f1dff06f          	j	31c4 <.L4>

000032ac <.L9>:
    32ac:	00072583          	lw	a1,0(a4)
    32b0:	f8b9e4e3          	bltu	s3,a1,3238 <.L8>
    32b4:	00070693          	mv	a3,a4
    32b8:	00872703          	lw	a4,8(a4)
    32bc:	f79ff06f          	j	3234 <.L7>

000032c0 <.L10>:
    32c0:	00f62023          	sw	a5,0(a2)
    32c4:	f89ff06f          	j	324c <.L11>

000032c8 <malloc>:
    32c8:	02050263          	beqz	a0,32ec <.L23>
    32cc:	ff000793          	li	a5,-16
    32d0:	02a7f063          	bgeu	a5,a0,32f0 <.L20>
    32d4:	0000d797          	auipc	a5,0xd
    32d8:	fc07a783          	lw	a5,-64(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    32dc:	00c00713          	li	a4,12
    32e0:	00e7a023          	sw	a4,0(a5)
    32e4:	00000513          	li	a0,0
    32e8:	00008067          	ret

000032ec <.L23>:
    32ec:	00100513          	li	a0,1

000032f0 <.L20>:
    32f0:	ff010113          	add	sp,sp,-16
    32f4:	0000f597          	auipc	a1,0xf
    32f8:	0b058593          	add	a1,a1,176 # 123a4 <__malloc_heap>
    32fc:	00112623          	sw	ra,12(sp)
    3300:	e61ff0ef          	jal	3160 <__malloc_from_heap>
    3304:	00051c63          	bnez	a0,331c <.L19>
    3308:	0000d797          	auipc	a5,0xd
    330c:	f8c7a783          	lw	a5,-116(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    3310:	00c00713          	li	a4,12
    3314:	00e7a023          	sw	a4,0(a5)
    3318:	00000513          	li	a0,0

0000331c <.L19>:
    331c:	00c12083          	lw	ra,12(sp)
    3320:	01010113          	add	sp,sp,16
    3324:	00008067          	ret

00003328 <__free_to_heap>:
    3328:	1a050a63          	beqz	a0,34dc <.L25>
    332c:	fd010113          	add	sp,sp,-48
    3330:	ff852603          	lw	a2,-8(a0)
    3334:	03212023          	sw	s2,32(sp)
    3338:	00058913          	mv	s2,a1
    333c:	ff850593          	add	a1,a0,-8
    3340:	00090513          	mv	a0,s2
    3344:	02112623          	sw	ra,44(sp)
    3348:	02812423          	sw	s0,40(sp)
    334c:	02912223          	sw	s1,36(sp)
    3350:	01312e23          	sw	s3,28(sp)
    3354:	01412c23          	sw	s4,24(sp)
    3358:	01512a23          	sw	s5,20(sp)
    335c:	01612823          	sw	s6,16(sp)
    3360:	01712623          	sw	s7,12(sp)
    3364:	01812423          	sw	s8,8(sp)
    3368:	01912223          	sw	s9,4(sp)
    336c:	01a12023          	sw	s10,0(sp)
    3370:	204000ef          	jal	3574 <__heap_free>
    3374:	00052483          	lw	s1,0(a0)
    3378:	00050413          	mv	s0,a0
    337c:	01e00513          	li	a0,30
    3380:	678000ef          	jal	39f8 <__GI_sysconf>
    3384:	00351513          	sll	a0,a0,0x3
    3388:	10a4ee63          	bltu	s1,a0,34a4 <.L1>
    338c:	00042783          	lw	a5,0(s0)
    3390:	00c40993          	add	s3,s0,12
    3394:	40f407b3          	sub	a5,s0,a5
    3398:	00c78593          	add	a1,a5,12
    339c:	00442783          	lw	a5,4(s0)
    33a0:	00078663          	beqz	a5,33ac <.L5>
    33a4:	00842703          	lw	a4,8(s0)
    33a8:	00e7a423          	sw	a4,8(a5)

000033ac <.L5>:
    33ac:	00842703          	lw	a4,8(s0)
    33b0:	06070e63          	beqz	a4,342c <.L6>
    33b4:	00f72223          	sw	a5,4(a4)

000033b8 <.L7>:
    33b8:	0000dc17          	auipc	s8,0xd
    33bc:	ee4c2c03          	lw	s8,-284(s8) # 1029c <_GLOBAL_OFFSET_TABLE_+0x14>
    33c0:	000c2483          	lw	s1,0(s8)
    33c4:	00000a93          	li	s5,0
    33c8:	0000dc97          	auipc	s9,0xd
    33cc:	f0ccac83          	lw	s9,-244(s9) # 102d4 <.LLST90+0x2f>
    33d0:	03000d13          	li	s10,48

000033d4 <.L8>:
    33d4:	00048a63          	beqz	s1,33e8 <.L12>
    33d8:	0004a403          	lw	s0,0(s1)
    33dc:	0044ab83          	lw	s7,4(s1)
    33e0:	008b8a33          	add	s4,s7,s0
    33e4:	0549f863          	bgeu	s3,s4,3434 <.L17>

000033e8 <.L12>:
    33e8:	0b358e63          	beq	a1,s3,34a4 <.L1>
    33ec:	02812403          	lw	s0,40(sp)
    33f0:	02c12083          	lw	ra,44(sp)
    33f4:	02412483          	lw	s1,36(sp)
    33f8:	01812a03          	lw	s4,24(sp)
    33fc:	01412a83          	lw	s5,20(sp)
    3400:	01012b03          	lw	s6,16(sp)
    3404:	00c12b83          	lw	s7,12(sp)
    3408:	00812c03          	lw	s8,8(sp)
    340c:	00412c83          	lw	s9,4(sp)
    3410:	00012d03          	lw	s10,0(sp)
    3414:	40b98633          	sub	a2,s3,a1
    3418:	00090513          	mv	a0,s2
    341c:	01c12983          	lw	s3,28(sp)
    3420:	02012903          	lw	s2,32(sp)
    3424:	03010113          	add	sp,sp,48
    3428:	14c0006f          	j	3574 <__heap_free>

0000342c <.L6>:
    342c:	00f92023          	sw	a5,0(s2)
    3430:	f89ff06f          	j	33b8 <.L7>

00003434 <.L17>:
    3434:	0084ab03          	lw	s6,8(s1)
    3438:	06b46063          	bltu	s0,a1,3498 <.L9>
    343c:	00858663          	beq	a1,s0,3448 <.L10>
    3440:	40b407b3          	sub	a5,s0,a1
    3444:	04fd7a63          	bgeu	s10,a5,3498 <.L9>

00003448 <.L10>:
    3448:	01498663          	beq	s3,s4,3454 <.L11>
    344c:	030a0793          	add	a5,s4,48
    3450:	f8f9ece3          	bltu	s3,a5,33e8 <.L12>

00003454 <.L11>:
    3454:	00b40863          	beq	s0,a1,3464 <.L13>
    3458:	40b40633          	sub	a2,s0,a1
    345c:	00090513          	mv	a0,s2
    3460:	114000ef          	jal	3574 <__heap_free>

00003464 <.L13>:
    3464:	020a8663          	beqz	s5,3490 <.L14>
    3468:	016aa423          	sw	s6,8(s5)

0000346c <.L15>:
    346c:	000c8593          	mv	a1,s9
    3470:	00048513          	mv	a0,s1
    3474:	eb5ff0ef          	jal	3328 <__free_to_heap>
    3478:	000b8593          	mv	a1,s7
    347c:	00040513          	mv	a0,s0
    3480:	595000ef          	jal	4214 <__GI_munmap>

00003484 <.L16>:
    3484:	000b0493          	mv	s1,s6
    3488:	000a0593          	mv	a1,s4
    348c:	f49ff06f          	j	33d4 <.L8>

00003490 <.L14>:
    3490:	016c2023          	sw	s6,0(s8)
    3494:	fd9ff06f          	j	346c <.L15>

00003498 <.L9>:
    3498:	00048a93          	mv	s5,s1
    349c:	00058a13          	mv	s4,a1
    34a0:	fe5ff06f          	j	3484 <.L16>

000034a4 <.L1>:
    34a4:	02c12083          	lw	ra,44(sp)
    34a8:	02812403          	lw	s0,40(sp)
    34ac:	02412483          	lw	s1,36(sp)
    34b0:	02012903          	lw	s2,32(sp)
    34b4:	01c12983          	lw	s3,28(sp)
    34b8:	01812a03          	lw	s4,24(sp)
    34bc:	01412a83          	lw	s5,20(sp)
    34c0:	01012b03          	lw	s6,16(sp)
    34c4:	00c12b83          	lw	s7,12(sp)
    34c8:	00812c03          	lw	s8,8(sp)
    34cc:	00412c83          	lw	s9,4(sp)
    34d0:	00012d03          	lw	s10,0(sp)
    34d4:	03010113          	add	sp,sp,48
    34d8:	00008067          	ret

000034dc <.L25>:
    34dc:	00008067          	ret

000034e0 <free>:
    34e0:	0000f597          	auipc	a1,0xf
    34e4:	ec458593          	add	a1,a1,-316 # 123a4 <__malloc_heap>
    34e8:	e41ff06f          	j	3328 <__free_to_heap>

000034ec <__heap_alloc>:
    34ec:	0005a783          	lw	a5,0(a1)
    34f0:	00b00713          	li	a4,11
    34f4:	00050693          	mv	a3,a0
    34f8:	00778793          	add	a5,a5,7
    34fc:	ff87f793          	and	a5,a5,-8
    3500:	00f76463          	bltu	a4,a5,3508 <.L2>
    3504:	01000793          	li	a5,16

00003508 <.L2>:
    3508:	0006a503          	lw	a0,0(a3)

0000350c <.L3>:
    350c:	00051463          	bnez	a0,3514 <.L11>
    3510:	00008067          	ret

00003514 <.L11>:
    3514:	00052703          	lw	a4,0(a0)
    3518:	04f76a63          	bltu	a4,a5,356c <.L4>
    351c:	40e50633          	sub	a2,a0,a4
    3520:	03078813          	add	a6,a5,48
    3524:	00c60613          	add	a2,a2,12
    3528:	03077a63          	bgeu	a4,a6,355c <.L5>
    352c:	00452783          	lw	a5,4(a0)
    3530:	00078663          	beqz	a5,353c <.L6>
    3534:	00852803          	lw	a6,8(a0)
    3538:	0107a423          	sw	a6,8(a5)

0000353c <.L6>:
    353c:	00852503          	lw	a0,8(a0)
    3540:	00050a63          	beqz	a0,3554 <.L7>
    3544:	00f52223          	sw	a5,4(a0)

00003548 <.L9>:
    3548:	00e5a023          	sw	a4,0(a1)
    354c:	00060513          	mv	a0,a2
    3550:	00008067          	ret

00003554 <.L7>:
    3554:	00f6a023          	sw	a5,0(a3)
    3558:	ff1ff06f          	j	3548 <.L9>

0000355c <.L5>:
    355c:	40f70733          	sub	a4,a4,a5
    3560:	00e52023          	sw	a4,0(a0)
    3564:	00078713          	mv	a4,a5
    3568:	fe1ff06f          	j	3548 <.L9>

0000356c <.L4>:
    356c:	00452503          	lw	a0,4(a0)
    3570:	f9dff06f          	j	350c <.L3>

00003574 <__heap_free>:
    3574:	00050813          	mv	a6,a0
    3578:	00052503          	lw	a0,0(a0)
    357c:	00c58333          	add	t1,a1,a2
    3580:	00000793          	li	a5,0

00003584 <.L2>:
    3584:	02051863          	bnez	a0,35b4 <.L4>

00003588 <.L5>:
    3588:	ff460713          	add	a4,a2,-12
    358c:	00e585b3          	add	a1,a1,a4
    3590:	00c5a023          	sw	a2,0(a1)
    3594:	00a5a223          	sw	a0,4(a1)
    3598:	00f5a423          	sw	a5,8(a1)
    359c:	0c078e63          	beqz	a5,3678 <.L17>
    35a0:	00b7a223          	sw	a1,4(a5)

000035a4 <.L18>:
    35a4:	00050463          	beqz	a0,35ac <.L19>
    35a8:	00b52423          	sw	a1,8(a0)

000035ac <.L19>:
    35ac:	00058513          	mv	a0,a1
    35b0:	00008067          	ret

000035b4 <.L4>:
    35b4:	00c50713          	add	a4,a0,12
    35b8:	00b77863          	bgeu	a4,a1,35c8 <.L3>
    35bc:	00050793          	mv	a5,a0
    35c0:	00452503          	lw	a0,4(a0)
    35c4:	fc1ff06f          	j	3584 <.L2>

000035c8 <.L3>:
    35c8:	00052683          	lw	a3,0(a0)
    35cc:	00c00893          	li	a7,12
    35d0:	40d88733          	sub	a4,a7,a3
    35d4:	00e50733          	add	a4,a0,a4
    35d8:	fae368e3          	bltu	t1,a4,3588 <.L5>
    35dc:	00c686b3          	add	a3,a3,a2
    35e0:	02671c63          	bne	a4,t1,3618 <.L6>
    35e4:	02078263          	beqz	a5,3608 <.L7>
    35e8:	00c78713          	add	a4,a5,12
    35ec:	00e59e63          	bne	a1,a4,3608 <.L7>
    35f0:	0007a703          	lw	a4,0(a5)
    35f4:	0087a783          	lw	a5,8(a5)
    35f8:	00e686b3          	add	a3,a3,a4
    35fc:	00078a63          	beqz	a5,3610 <.L8>
    3600:	00a7a223          	sw	a0,4(a5)

00003604 <.L9>:
    3604:	00f52423          	sw	a5,8(a0)

00003608 <.L7>:
    3608:	00d52023          	sw	a3,0(a0)
    360c:	00008067          	ret

00003610 <.L8>:
    3610:	00a82023          	sw	a0,0(a6)
    3614:	ff1ff06f          	j	3604 <.L9>

00003618 <.L6>:
    3618:	00452703          	lw	a4,4(a0)
    361c:	02070a63          	beqz	a4,3650 <.L10>
    3620:	00072583          	lw	a1,0(a4)
    3624:	40b888b3          	sub	a7,a7,a1
    3628:	011708b3          	add	a7,a4,a7
    362c:	03131263          	bne	t1,a7,3650 <.L10>
    3630:	00b686b3          	add	a3,a3,a1
    3634:	00078a63          	beqz	a5,3648 <.L11>
    3638:	00e7a223          	sw	a4,4(a5)

0000363c <.L12>:
    363c:	00f72423          	sw	a5,8(a4)
    3640:	00070513          	mv	a0,a4
    3644:	fc5ff06f          	j	3608 <.L7>

00003648 <.L11>:
    3648:	00e82023          	sw	a4,0(a6)
    364c:	ff1ff06f          	j	363c <.L12>

00003650 <.L10>:
    3650:	00c50533          	add	a0,a0,a2
    3654:	00e52223          	sw	a4,4(a0)
    3658:	00f52423          	sw	a5,8(a0)
    365c:	00078a63          	beqz	a5,3670 <.L13>
    3660:	00a7a223          	sw	a0,4(a5)

00003664 <.L14>:
    3664:	fa0702e3          	beqz	a4,3608 <.L7>
    3668:	00a72423          	sw	a0,8(a4)
    366c:	f9dff06f          	j	3608 <.L7>

00003670 <.L13>:
    3670:	00a82023          	sw	a0,0(a6)
    3674:	ff1ff06f          	j	3664 <.L14>

00003678 <.L17>:
    3678:	00b82023          	sw	a1,0(a6)
    367c:	f29ff06f          	j	35a4 <.L18>

00003680 <__GI_atoi>:
    3680:	00a00613          	li	a2,10
    3684:	00000593          	li	a1,0
    3688:	0040006f          	j	368c <__GI_strtol>

0000368c <__GI_strtol>:
    368c:	00100693          	li	a3,1
    3690:	0040006f          	j	3694 <_stdlib_strto_l>

00003694 <_stdlib_strto_l>:
    3694:	00050893          	mv	a7,a0
    3698:	00088813          	mv	a6,a7
    369c:	0000f517          	auipc	a0,0xf
    36a0:	d1c52503          	lw	a0,-740(a0) # 123b8 <__GI___ctype_b>

000036a4 <.L2>:
    36a4:	00084783          	lbu	a5,0(a6)
    36a8:	00179713          	sll	a4,a5,0x1
    36ac:	00e50733          	add	a4,a0,a4
    36b0:	00075703          	lhu	a4,0(a4)
    36b4:	02077713          	and	a4,a4,32
    36b8:	08071a63          	bnez	a4,374c <.L3>
    36bc:	02b00713          	li	a4,43
    36c0:	08e78a63          	beq	a5,a4,3754 <.L25>
    36c4:	02d00713          	li	a4,45
    36c8:	00000313          	li	t1,0
    36cc:	00e79663          	bne	a5,a4,36d8 <.L5>
    36d0:	00100313          	li	t1,1

000036d4 <.L4>:
    36d4:	00180813          	add	a6,a6,1

000036d8 <.L5>:
    36d8:	fef67793          	and	a5,a2,-17
    36dc:	0a079663          	bnez	a5,3788 <.L6>
    36e0:	00084703          	lbu	a4,0(a6)
    36e4:	03000793          	li	a5,48
    36e8:	06f70a63          	beq	a4,a5,375c <.L7>
    36ec:	00a60613          	add	a2,a2,10

000036f0 <.L8>:
    36f0:	01000793          	li	a5,16
    36f4:	00c7d463          	bge	a5,a2,36fc <.L10>
    36f8:	01000613          	li	a2,16

000036fc <.L10>:
    36fc:	fff00713          	li	a4,-1
    3700:	02c77eb3          	remu	t4,a4,a2
    3704:	00000e13          	li	t3,0
    3708:	00000513          	li	a0,0
    370c:	00900f93          	li	t6,9
    3710:	06000293          	li	t0,96
    3714:	02c75733          	divu	a4,a4,a2
    3718:	0ffefe93          	zext.b	t4,t4

0000371c <.L12>:
    371c:	00084f03          	lbu	t5,0(a6)
    3720:	fd0f0793          	add	a5,t5,-48
    3724:	0ff7f793          	zext.b	a5,a5
    3728:	0afffa63          	bgeu	t6,a5,37dc <.L13>
    372c:	020f6793          	or	a5,t5,32
    3730:	0af2e263          	bltu	t0,a5,37d4 <.L14>

00003734 <.L17>:
    3734:	060e0263          	beqz	t3,3798 <.L11>
    3738:	0000d797          	auipc	a5,0xd
    373c:	b5c7a783          	lw	a5,-1188(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    3740:	02200713          	li	a4,34
    3744:	00e7a023          	sw	a4,0(a5)
    3748:	0500006f          	j	3798 <.L11>

0000374c <.L3>:
    374c:	00180813          	add	a6,a6,1
    3750:	f55ff06f          	j	36a4 <.L2>

00003754 <.L25>:
    3754:	00000313          	li	t1,0
    3758:	f7dff06f          	j	36d4 <.L4>

0000375c <.L7>:
    375c:	00184783          	lbu	a5,1(a6)
    3760:	07800713          	li	a4,120
    3764:	00180893          	add	a7,a6,1
    3768:	0207e793          	or	a5,a5,32
    376c:	00860613          	add	a2,a2,8
    3770:	00e79863          	bne	a5,a4,3780 <.L27>
    3774:	00280813          	add	a6,a6,2
    3778:	00161613          	sll	a2,a2,0x1
    377c:	f75ff06f          	j	36f0 <.L8>

00003780 <.L27>:
    3780:	00088813          	mv	a6,a7
    3784:	f6dff06f          	j	36f0 <.L8>

00003788 <.L6>:
    3788:	ffe60793          	add	a5,a2,-2
    378c:	02200713          	li	a4,34
    3790:	00000513          	li	a0,0
    3794:	f6f774e3          	bgeu	a4,a5,36fc <.L10>

00003798 <.L11>:
    3798:	00058463          	beqz	a1,37a0 <.L22>
    379c:	0115a023          	sw	a7,0(a1)

000037a0 <.L22>:
    37a0:	02068463          	beqz	a3,37c8 <.L23>
    37a4:	800007b7          	lui	a5,0x80000
    37a8:	fff78793          	add	a5,a5,-1 # 7fffffff <_ebss+0x7ffea10f>
    37ac:	00f307b3          	add	a5,t1,a5
    37b0:	00a7fc63          	bgeu	a5,a0,37c8 <.L23>
    37b4:	0000d717          	auipc	a4,0xd
    37b8:	ae072703          	lw	a4,-1312(a4) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    37bc:	02200693          	li	a3,34
    37c0:	00d72023          	sw	a3,0(a4)
    37c4:	00078513          	mv	a0,a5

000037c8 <.L23>:
    37c8:	00030463          	beqz	t1,37d0 <.L1>
    37cc:	40a00533          	neg	a0,a0

000037d0 <.L1>:
    37d0:	00008067          	ret

000037d4 <.L14>:
    37d4:	fa978793          	add	a5,a5,-87
    37d8:	0ff7f793          	zext.b	a5,a5

000037dc <.L13>:
    37dc:	f4c7dce3          	bge	a5,a2,3734 <.L17>
    37e0:	00180813          	add	a6,a6,1
    37e4:	00a76663          	bltu	a4,a0,37f0 <.L18>
    37e8:	00e51e63          	bne	a0,a4,3804 <.L19>
    37ec:	00fefc63          	bgeu	t4,a5,3804 <.L19>

000037f0 <.L18>:
    37f0:	00d37333          	and	t1,t1,a3
    37f4:	00100e13          	li	t3,1
    37f8:	fff00513          	li	a0,-1

000037fc <.L20>:
    37fc:	00080893          	mv	a7,a6
    3800:	f1dff06f          	j	371c <.L12>

00003804 <.L19>:
    3804:	02a60533          	mul	a0,a2,a0
    3808:	00a78533          	add	a0,a5,a0
    380c:	ff1ff06f          	j	37fc <.L20>

00003810 <nprocessors_onln>:
    3810:	fd010113          	add	sp,sp,-48
    3814:	0000e517          	auipc	a0,0xe
    3818:	78050513          	add	a0,a0,1920 # 11f94 <.LC0>
    381c:	02912223          	sw	s1,36(sp)
    3820:	02112623          	sw	ra,44(sp)
    3824:	02812423          	sw	s0,40(sp)
    3828:	03212023          	sw	s2,32(sp)
    382c:	01312e23          	sw	s3,28(sp)
    3830:	01412c23          	sw	s4,24(sp)
    3834:	01512a23          	sw	s5,20(sp)
    3838:	00012623          	sw	zero,12(sp)
    383c:	4d5000ef          	jal	4510 <__GI_config_open>
    3840:	00000493          	li	s1,0
    3844:	0a050c63          	beqz	a0,38fc <.L19>
    3848:	00050413          	mv	s0,a0
    384c:	00c10913          	add	s2,sp,12
    3850:	0000e997          	auipc	s3,0xe
    3854:	75098993          	add	s3,s3,1872 # 11fa0 <.LC1>
    3858:	06300a13          	li	s4,99
    385c:	07000a93          	li	s5,112

00003860 <.L2>:
    3860:	00098693          	mv	a3,s3
    3864:	10200613          	li	a2,258
    3868:	00090593          	mv	a1,s2
    386c:	00040513          	mv	a0,s0
    3870:	535000ef          	jal	45a4 <__GI_config_read>
    3874:	02051e63          	bnez	a0,38b0 <.L5>

00003878 <.L6>:
    3878:	00040513          	mv	a0,s0
    387c:	4e5000ef          	jal	4560 <__GI_config_close>
    3880:	00049463          	bnez	s1,3888 <.L1>
    3884:	00100493          	li	s1,1

00003888 <.L1>:
    3888:	02c12083          	lw	ra,44(sp)
    388c:	02812403          	lw	s0,40(sp)
    3890:	02012903          	lw	s2,32(sp)
    3894:	01c12983          	lw	s3,28(sp)
    3898:	01812a03          	lw	s4,24(sp)
    389c:	01412a83          	lw	s5,20(sp)
    38a0:	00048513          	mv	a0,s1
    38a4:	02412483          	lw	s1,36(sp)
    38a8:	03010113          	add	sp,sp,48
    38ac:	00008067          	ret

000038b0 <.L5>:
    38b0:	00c12783          	lw	a5,12(sp)
    38b4:	0007a783          	lw	a5,0(a5)
    38b8:	0007c703          	lbu	a4,0(a5)
    38bc:	fb4712e3          	bne	a4,s4,3860 <.L2>
    38c0:	0017c703          	lbu	a4,1(a5)
    38c4:	f9571ee3          	bne	a4,s5,3860 <.L2>
    38c8:	0027c683          	lbu	a3,2(a5)
    38cc:	07500713          	li	a4,117
    38d0:	f8e698e3          	bne	a3,a4,3860 <.L2>
    38d4:	0037c703          	lbu	a4,3(a5)
    38d8:	0000f797          	auipc	a5,0xf
    38dc:	ae07a783          	lw	a5,-1312(a5) # 123b8 <__GI___ctype_b>
    38e0:	00171713          	sll	a4,a4,0x1
    38e4:	00e787b3          	add	a5,a5,a4
    38e8:	0007d783          	lhu	a5,0(a5)
    38ec:	0087f793          	and	a5,a5,8
    38f0:	f60788e3          	beqz	a5,3860 <.L2>
    38f4:	00148493          	add	s1,s1,1
    38f8:	f69ff06f          	j	3860 <.L2>

000038fc <.L19>:
    38fc:	0000e517          	auipc	a0,0xe
    3900:	6a850513          	add	a0,a0,1704 # 11fa4 <.LC2>
    3904:	40d000ef          	jal	4510 <__GI_config_open>
    3908:	00050413          	mv	s0,a0
    390c:	f60506e3          	beqz	a0,3878 <.L6>
    3910:	00070937          	lui	s2,0x70
    3914:	00c10993          	add	s3,sp,12
    3918:	0000ea17          	auipc	s4,0xe
    391c:	aa8a0a13          	add	s4,s4,-1368 # 113c0 <.LANCHOR0>
    3920:	20290913          	add	s2,s2,514 # 70202 <_ebss+0x5a312>
    3924:	0000ea97          	auipc	s5,0xe
    3928:	690a8a93          	add	s5,s5,1680 # 11fb4 <.LC3>

0000392c <.L7>:
    392c:	000a0693          	mv	a3,s4
    3930:	00090613          	mv	a2,s2
    3934:	00098593          	mv	a1,s3
    3938:	00040513          	mv	a0,s0
    393c:	469000ef          	jal	45a4 <__GI_config_read>
    3940:	f2050ce3          	beqz	a0,3878 <.L6>
    3944:	00c12783          	lw	a5,12(sp)
    3948:	000a8513          	mv	a0,s5
    394c:	0007a583          	lw	a1,0(a5)
    3950:	1bd020ef          	jal	630c <__GI_strcmp>
    3954:	fc051ce3          	bnez	a0,392c <.L7>
    3958:	00148493          	add	s1,s1,1
    395c:	fd1ff06f          	j	392c <.L7>

00003960 <get_phys_pages>:
    3960:	fb010113          	add	sp,sp,-80
    3964:	04112623          	sw	ra,76(sp)
    3968:	04812423          	sw	s0,72(sp)
    396c:	7f4000ef          	jal	4160 <__GI_getpagesize>
    3970:	00050413          	mv	s0,a0
    3974:	00010513          	mv	a0,sp
    3978:	0c5000ef          	jal	423c <sysinfo>
    397c:	03412783          	lw	a5,52(sp)
    3980:	01012503          	lw	a0,16(sp)
    3984:	00f46e63          	bltu	s0,a5,39a0 <.L22>
    3988:	02f45433          	divu	s0,s0,a5
    398c:	02855533          	divu	a0,a0,s0

00003990 <.L21>:
    3990:	04c12083          	lw	ra,76(sp)
    3994:	04812403          	lw	s0,72(sp)
    3998:	05010113          	add	sp,sp,80
    399c:	00008067          	ret

000039a0 <.L22>:
    39a0:	0287d7b3          	divu	a5,a5,s0
    39a4:	02a78533          	mul	a0,a5,a0
    39a8:	fe9ff06f          	j	3990 <.L21>

000039ac <get_avphys_pages>:
    39ac:	fb010113          	add	sp,sp,-80
    39b0:	04112623          	sw	ra,76(sp)
    39b4:	04812423          	sw	s0,72(sp)
    39b8:	7a8000ef          	jal	4160 <__GI_getpagesize>
    39bc:	00050413          	mv	s0,a0
    39c0:	00010513          	mv	a0,sp
    39c4:	079000ef          	jal	423c <sysinfo>
    39c8:	03412783          	lw	a5,52(sp)
    39cc:	01412503          	lw	a0,20(sp)
    39d0:	00f46e63          	bltu	s0,a5,39ec <.L26>
    39d4:	02f45433          	divu	s0,s0,a5
    39d8:	02855533          	divu	a0,a0,s0

000039dc <.L25>:
    39dc:	04c12083          	lw	ra,76(sp)
    39e0:	04812403          	lw	s0,72(sp)
    39e4:	05010113          	add	sp,sp,80
    39e8:	00008067          	ret

000039ec <.L26>:
    39ec:	0287d7b3          	divu	a5,a5,s0
    39f0:	02a78533          	mul	a0,a5,a0
    39f4:	fe9ff06f          	j	39dc <.L25>

000039f8 <__GI_sysconf>:
    39f8:	fd010113          	add	sp,sp,-48
    39fc:	02112623          	sw	ra,44(sp)
    3a00:	02812423          	sw	s0,40(sp)
    3a04:	02912223          	sw	s1,36(sp)
    3a08:	03212023          	sw	s2,32(sp)
    3a0c:	01312e23          	sw	s3,28(sp)
    3a10:	01412c23          	sw	s4,24(sp)
    3a14:	01512a23          	sw	s5,20(sp)
    3a18:	0f000793          	li	a5,240
    3a1c:	00a7ce63          	blt	a5,a0,3a38 <.L30>
    3a20:	01600793          	li	a5,22
    3a24:	00050413          	mv	s0,a0
    3a28:	02a7c463          	blt	a5,a0,3a50 <.L31>
    3a2c:	00500793          	li	a5,5
    3a30:	0aa7cc63          	blt	a5,a0,3ae8 <.L32>
    3a34:	08055263          	bgez	a0,3ab8 <.L33>

00003a38 <.L30>:
    3a38:	0000d797          	auipc	a5,0xd
    3a3c:	85c7a783          	lw	a5,-1956(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    3a40:	01600713          	li	a4,22
    3a44:	00e7a023          	sw	a4,0(a5)

00003a48 <.L34>:
    3a48:	fff00413          	li	s0,-1
    3a4c:	02c0006f          	j	3a78 <.L47>

00003a50 <.L31>:
    3a50:	fe950413          	add	s0,a0,-23
    3a54:	0d900793          	li	a5,217
    3a58:	fe87e0e3          	bltu	a5,s0,3a38 <.L30>
    3a5c:	52418713          	add	a4,gp,1316 # 11044 <.L35>
    3a60:	00241413          	sll	s0,s0,0x2
    3a64:	00e40433          	add	s0,s0,a4
    3a68:	00042783          	lw	a5,0(s0)
    3a6c:	00e787b3          	add	a5,a5,a4
    3a70:	00078067          	jr	a5

00003a74 <.L65>:
    3a74:	00008437          	lui	s0,0x8

00003a78 <.L47>:
    3a78:	02c12083          	lw	ra,44(sp)
    3a7c:	00040513          	mv	a0,s0
    3a80:	02812403          	lw	s0,40(sp)
    3a84:	02412483          	lw	s1,36(sp)
    3a88:	02012903          	lw	s2,32(sp)
    3a8c:	01c12983          	lw	s3,28(sp)
    3a90:	01812a03          	lw	s4,24(sp)
    3a94:	01412a83          	lw	s5,20(sp)
    3a98:	03010113          	add	sp,sp,48
    3a9c:	00008067          	ret

00003aa0 <.L86>:
    3aa0:	00c75793          	srl	a5,a4,0xc
    3aa4:	3e37f793          	and	a5,a5,995
    3aa8:	fa0790e3          	bnez	a5,3a48 <.L34>
    3aac:	00600793          	li	a5,6
    3ab0:	fcf404e3          	beq	s0,a5,3a78 <.L47>
    3ab4:	f85ff06f          	j	3a38 <.L30>

00003ab8 <.L33>:
    3ab8:	fff50413          	add	s0,a0,-1
    3abc:	00400793          	li	a5,4
    3ac0:	0487e463          	bltu	a5,s0,3b08 <.L66>
    3ac4:	0000e717          	auipc	a4,0xe
    3ac8:	8e870713          	add	a4,a4,-1816 # 113ac <.L68>
    3acc:	00241413          	sll	s0,s0,0x2
    3ad0:	00e40433          	add	s0,s0,a4
    3ad4:	00042783          	lw	a5,0(s0) # 8000 <__kernel_rem_pio2+0x60>
    3ad8:	00e787b3          	add	a5,a5,a4
    3adc:	00078067          	jr	a5

00003ae0 <.L70>:
    3ae0:	06400413          	li	s0,100
    3ae4:	f95ff06f          	j	3a78 <.L47>

00003ae8 <.L32>:
    3ae8:	00100713          	li	a4,1
    3aec:	0041d7b7          	lui	a5,0x41d
    3af0:	00a71733          	sll	a4,a4,a0
    3af4:	f8078793          	add	a5,a5,-128 # 41cf80 <_ebss+0x407090>
    3af8:	00f777b3          	and	a5,a4,a5
    3afc:	fa0782e3          	beqz	a5,3aa0 <.L86>

00003b00 <.L36>:
    3b00:	00100413          	li	s0,1
    3b04:	f75ff06f          	j	3a78 <.L47>

00003b08 <.L66>:
    3b08:	00810593          	add	a1,sp,8
    3b0c:	00300513          	li	a0,3
    3b10:	65c000ef          	jal	416c <__GI_getrlimit>
    3b14:	00020437          	lui	s0,0x20
    3b18:	f60510e3          	bnez	a0,3a78 <.L47>
    3b1c:	00812783          	lw	a5,8(sp)
    3b20:	00080737          	lui	a4,0x80
    3b24:	f4e7eae3          	bltu	a5,a4,3a78 <.L47>
    3b28:	0027d413          	srl	s0,a5,0x2
    3b2c:	f4dff06f          	j	3a78 <.L47>

00003b30 <.L69>:
    3b30:	02812403          	lw	s0,40(sp)
    3b34:	02c12083          	lw	ra,44(sp)
    3b38:	02412483          	lw	s1,36(sp)
    3b3c:	02012903          	lw	s2,32(sp)
    3b40:	01c12983          	lw	s3,28(sp)
    3b44:	01812a03          	lw	s4,24(sp)
    3b48:	01412a83          	lw	s5,20(sp)
    3b4c:	03010113          	add	sp,sp,48
    3b50:	5e00006f          	j	4130 <__GI_getdtablesize>

00003b54 <.L48>:
    3b54:	01000413          	li	s0,16
    3b58:	f21ff06f          	j	3a78 <.L47>

00003b5c <.L64>:
    3b5c:	02812403          	lw	s0,40(sp)
    3b60:	02c12083          	lw	ra,44(sp)
    3b64:	02412483          	lw	s1,36(sp)
    3b68:	02012903          	lw	s2,32(sp)
    3b6c:	01c12983          	lw	s3,28(sp)
    3b70:	01812a03          	lw	s4,24(sp)
    3b74:	01412a83          	lw	s5,20(sp)
    3b78:	03010113          	add	sp,sp,48
    3b7c:	5e40006f          	j	4160 <__GI_getpagesize>

00003b80 <.L49>:
    3b80:	02000413          	li	s0,32
    3b84:	ef5ff06f          	j	3a78 <.L47>

00003b88 <.L63>:
    3b88:	06300413          	li	s0,99
    3b8c:	eedff06f          	j	3a78 <.L47>

00003b90 <.L39>:
    3b90:	00001437          	lui	s0,0x1
    3b94:	80040413          	add	s0,s0,-2048 # 800 <.L25>
    3b98:	ee1ff06f          	j	3a78 <.L47>

00003b9c <.L62>:
    3b9c:	3e800413          	li	s0,1000
    3ba0:	ed9ff06f          	j	3a78 <.L47>

00003ba4 <.L42>:
    3ba4:	0ff00413          	li	s0,255
    3ba8:	ed1ff06f          	j	3a78 <.L47>

00003bac <.L44>:
    3bac:	00008437          	lui	s0,0x8

00003bb0 <.L90>:
    3bb0:	fff40413          	add	s0,s0,-1 # 7fff <__kernel_rem_pio2+0x5f>
    3bb4:	ec5ff06f          	j	3a78 <.L47>

00003bb8 <.L61>:
    3bb8:	10000413          	li	s0,256
    3bbc:	ebdff06f          	j	3a78 <.L47>

00003bc0 <.L60>:
    3bc0:	0000e517          	auipc	a0,0xe
    3bc4:	40050513          	add	a0,a0,1024 # 11fc0 <.LC5>
    3bc8:	02d000ef          	jal	43f4 <__GI_opendir>
    3bcc:	00050493          	mv	s1,a0
    3bd0:	00000413          	li	s0,0
    3bd4:	06050c63          	beqz	a0,3c4c <.L87>
    3bd8:	00010937          	lui	s2,0x10
    3bdc:	000079b7          	lui	s3,0x7
    3be0:	ffff0a37          	lui	s4,0xffff0
    3be4:	63040ab7          	lui	s5,0x63040
    3be8:	fff90913          	add	s2,s2,-1 # ffff <.LVL314+0x7>
    3bec:	57098993          	add	s3,s3,1392 # 7570 <__stdio_rfill+0x10>

00003bf0 <.L72>:
    3bf0:	00048513          	mv	a0,s1
    3bf4:	085000ef          	jal	4478 <__GI_readdir64>
    3bf8:	00051a63          	bnez	a0,3c0c <.L75>
    3bfc:	00048513          	mv	a0,s1
    3c00:	664000ef          	jal	4264 <__GI_closedir>

00003c04 <.L76>:
    3c04:	e6041ae3          	bnez	s0,3a78 <.L47>
    3c08:	ef9ff06f          	j	3b00 <.L36>

00003c0c <.L75>:
    3c0c:	01052783          	lw	a5,16(a0)
    3c10:	00fa77b3          	and	a5,s4,a5
    3c14:	fd579ee3          	bne	a5,s5,3bf0 <.L72>
    3c18:	01452783          	lw	a5,20(a0)
    3c1c:	0127f7b3          	and	a5,a5,s2
    3c20:	fd3798e3          	bne	a5,s3,3bf0 <.L72>
    3c24:	01654703          	lbu	a4,22(a0)
    3c28:	0000e797          	auipc	a5,0xe
    3c2c:	7907a783          	lw	a5,1936(a5) # 123b8 <__GI___ctype_b>
    3c30:	00171713          	sll	a4,a4,0x1
    3c34:	00e787b3          	add	a5,a5,a4
    3c38:	0007d783          	lhu	a5,0(a5)
    3c3c:	0087f793          	and	a5,a5,8
    3c40:	fa0788e3          	beqz	a5,3bf0 <.L72>
    3c44:	00140413          	add	s0,s0,1
    3c48:	fa9ff06f          	j	3bf0 <.L72>

00003c4c <.L87>:
    3c4c:	bc5ff0ef          	jal	3810 <nprocessors_onln>
    3c50:	00050413          	mv	s0,a0
    3c54:	fb1ff06f          	j	3c04 <.L76>

00003c58 <.L59>:
    3c58:	02812403          	lw	s0,40(sp)
    3c5c:	02c12083          	lw	ra,44(sp)
    3c60:	02412483          	lw	s1,36(sp)
    3c64:	02012903          	lw	s2,32(sp)
    3c68:	01c12983          	lw	s3,28(sp)
    3c6c:	01812a03          	lw	s4,24(sp)
    3c70:	01412a83          	lw	s5,20(sp)
    3c74:	03010113          	add	sp,sp,48
    3c78:	b99ff06f          	j	3810 <nprocessors_onln>

00003c7c <.L58>:
    3c7c:	02812403          	lw	s0,40(sp)
    3c80:	02c12083          	lw	ra,44(sp)
    3c84:	02412483          	lw	s1,36(sp)
    3c88:	02012903          	lw	s2,32(sp)
    3c8c:	01c12983          	lw	s3,28(sp)
    3c90:	01812a03          	lw	s4,24(sp)
    3c94:	01412a83          	lw	s5,20(sp)
    3c98:	03010113          	add	sp,sp,48
    3c9c:	cc5ff06f          	j	3960 <get_phys_pages>

00003ca0 <.L57>:
    3ca0:	02812403          	lw	s0,40(sp)
    3ca4:	02c12083          	lw	ra,44(sp)
    3ca8:	02412483          	lw	s1,36(sp)
    3cac:	02012903          	lw	s2,32(sp)
    3cb0:	01c12983          	lw	s3,28(sp)
    3cb4:	01812a03          	lw	s4,24(sp)
    3cb8:	01412a83          	lw	s5,20(sp)
    3cbc:	03010113          	add	sp,sp,48
    3cc0:	cedff06f          	j	39ac <get_avphys_pages>

00003cc4 <.L38>:
    3cc4:	80000437          	lui	s0,0x80000
    3cc8:	ee9ff06f          	j	3bb0 <.L90>

00003ccc <.L56>:
    3ccc:	00001437          	lui	s0,0x1
    3cd0:	da9ff06f          	j	3a78 <.L47>

00003cd4 <.L55>:
    3cd4:	2bc00413          	li	s0,700
    3cd8:	da1ff06f          	j	3a78 <.L47>

00003cdc <.L54>:
    3cdc:	00400413          	li	s0,4
    3ce0:	d99ff06f          	j	3a78 <.L47>

00003ce4 <.L52>:
    3ce4:	00800413          	li	s0,8
    3ce8:	d91ff06f          	j	3a78 <.L47>

00003cec <.L51>:
    3cec:	00000413          	li	s0,0
    3cf0:	d89ff06f          	j	3a78 <.L47>

00003cf4 <.L50>:
    3cf4:	80000437          	lui	s0,0x80000
    3cf8:	d81ff06f          	j	3a78 <.L47>

00003cfc <.L46>:
    3cfc:	07f00413          	li	s0,127
    3d00:	d79ff06f          	j	3a78 <.L47>

00003d04 <.L45>:
    3d04:	f8000413          	li	s0,-128
    3d08:	d71ff06f          	j	3a78 <.L47>

00003d0c <.L43>:
    3d0c:	ffff8437          	lui	s0,0xffff8
    3d10:	d69ff06f          	j	3a78 <.L47>

00003d14 <.L41>:
    3d14:	00010437          	lui	s0,0x10
    3d18:	e99ff06f          	j	3bb0 <.L90>

00003d1c <.L40>:
    3d1c:	00900413          	li	s0,9
    3d20:	d59ff06f          	j	3a78 <.L47>

00003d24 <.L37>:
    3d24:	00000593          	li	a1,0
    3d28:	00100513          	li	a0,1
    3d2c:	3dc000ef          	jal	4108 <__GI_clock_getres>
    3d30:	d0054ce3          	bltz	a0,3a48 <.L34>

00003d34 <.L53>:
    3d34:	00031437          	lui	s0,0x31
    3d38:	06940413          	add	s0,s0,105 # 31069 <_ebss+0x1b179>
    3d3c:	d3dff06f          	j	3a78 <.L47>

00003d40 <.L77>:
    3d40:	01400413          	li	s0,20
    3d44:	d35ff06f          	j	3a78 <.L47>

00003d48 <.L78>:
    3d48:	00010437          	lui	s0,0x10
    3d4c:	d2dff06f          	j	3a78 <.L47>

00003d50 <__uClibc_init>:
    3d50:	00012797          	auipc	a5,0x12
    3d54:	00878793          	add	a5,a5,8 # 15d58 <__pagesize>
    3d58:	0007a703          	lw	a4,0(a5)
    3d5c:	02071063          	bnez	a4,3d7c <.L1>
    3d60:	00002737          	lui	a4,0x2
    3d64:	00e7a023          	sw	a4,0(a5)
    3d68:	0000c717          	auipc	a4,0xc
    3d6c:	56872703          	lw	a4,1384(a4) # 102d0 <.LLST90+0x2b>
    3d70:	00070793          	mv	a5,a4
    3d74:	00078463          	beqz	a5,3d7c <.L1>
    3d78:	00070067          	jr	a4

00003d7c <.L1>:
    3d7c:	00008067          	ret

00003d80 <__uClibc_fini>:
    3d80:	ff010113          	add	sp,sp,-16
    3d84:	00812423          	sw	s0,8(sp)
    3d88:	00912223          	sw	s1,4(sp)
    3d8c:	0000e417          	auipc	s0,0xe
    3d90:	64040413          	add	s0,s0,1600 # 123cc <__TMC_END__>
    3d94:	0000e497          	auipc	s1,0xe
    3d98:	63448493          	add	s1,s1,1588 # 123c8 <__do_global_dtors_aux_fini_array_entry>
    3d9c:	40940433          	sub	s0,s0,s1
    3da0:	40245413          	sra	s0,s0,0x2
    3da4:	01212023          	sw	s2,0(sp)
    3da8:	00112623          	sw	ra,12(sp)
    3dac:	fff40413          	add	s0,s0,-1
    3db0:	fff00913          	li	s2,-1

00003db4 <.L9>:
    3db4:	03241c63          	bne	s0,s2,3dec <.L10>
    3db8:	00012417          	auipc	s0,0x12
    3dbc:	fa040413          	add	s0,s0,-96 # 15d58 <__pagesize>
    3dc0:	00442783          	lw	a5,4(s0)
    3dc4:	00078463          	beqz	a5,3dcc <.L11>
    3dc8:	000780e7          	jalr	a5

00003dcc <.L11>:
    3dcc:	00842783          	lw	a5,8(s0)
    3dd0:	02078a63          	beqz	a5,3e04 <.L8>
    3dd4:	00812403          	lw	s0,8(sp)
    3dd8:	00c12083          	lw	ra,12(sp)
    3ddc:	00412483          	lw	s1,4(sp)
    3de0:	00012903          	lw	s2,0(sp)
    3de4:	01010113          	add	sp,sp,16
    3de8:	00078067          	jr	a5

00003dec <.L10>:
    3dec:	00241793          	sll	a5,s0,0x2
    3df0:	00f487b3          	add	a5,s1,a5
    3df4:	0007a783          	lw	a5,0(a5)
    3df8:	fff40413          	add	s0,s0,-1
    3dfc:	000780e7          	jalr	a5
    3e00:	fb5ff06f          	j	3db4 <.L9>

00003e04 <.L8>:
    3e04:	00c12083          	lw	ra,12(sp)
    3e08:	00812403          	lw	s0,8(sp)
    3e0c:	00412483          	lw	s1,4(sp)
    3e10:	00012903          	lw	s2,0(sp)
    3e14:	01010113          	add	sp,sp,16
    3e18:	00008067          	ret

00003e1c <__uClibc_main>:
    3e1c:	f5010113          	add	sp,sp,-176
    3e20:	0a812423          	sw	s0,168(sp)
    3e24:	0b212023          	sw	s2,160(sp)
    3e28:	09312e23          	sw	s3,156(sp)
    3e2c:	09412c23          	sw	s4,152(sp)
    3e30:	09512a23          	sw	s5,148(sp)
    3e34:	09612823          	sw	s6,144(sp)
    3e38:	09712623          	sw	s7,140(sp)
    3e3c:	0a112623          	sw	ra,172(sp)
    3e40:	0a912223          	sw	s1,164(sp)
    3e44:	09812423          	sw	s8,136(sp)
    3e48:	09912223          	sw	s9,132(sp)
    3e4c:	09a12023          	sw	s10,128(sp)
    3e50:	00070a93          	mv	s5,a4
    3e54:	00012b17          	auipc	s6,0x12
    3e58:	f04b0b13          	add	s6,s6,-252 # 15d58 <__pagesize>
    3e5c:	0000c717          	auipc	a4,0xc
    3e60:	43472703          	lw	a4,1076(a4) # 10290 <_GLOBAL_OFFSET_TABLE_+0x8>
    3e64:	01072023          	sw	a6,0(a4)
    3e68:	00fb2423          	sw	a5,8(s6)
    3e6c:	00158793          	add	a5,a1,1
    3e70:	00068993          	mv	s3,a3
    3e74:	00279793          	sll	a5,a5,0x2
    3e78:	00062683          	lw	a3,0(a2)
    3e7c:	00f60733          	add	a4,a2,a5
    3e80:	0000cb97          	auipc	s7,0xc
    3e84:	418bab83          	lw	s7,1048(s7) # 10298 <_GLOBAL_OFFSET_TABLE_+0x10>
    3e88:	00eba023          	sw	a4,0(s7)
    3e8c:	00050a13          	mv	s4,a0
    3e90:	00058913          	mv	s2,a1
    3e94:	00060413          	mv	s0,a2
    3e98:	00d71863          	bne	a4,a3,3ea8 <.L18>
    3e9c:	ffc78793          	add	a5,a5,-4
    3ea0:	00f607b3          	add	a5,a2,a5
    3ea4:	00fba023          	sw	a5,0(s7)

00003ea8 <.L18>:
    3ea8:	00810c93          	add	s9,sp,8
    3eac:	07800613          	li	a2,120
    3eb0:	00000593          	li	a1,0
    3eb4:	000c8513          	mv	a0,s9
    3eb8:	ee1fe0ef          	jal	2d98 <__GI_memset>
    3ebc:	000bac03          	lw	s8,0(s7)

00003ec0 <.L19>:
    3ec0:	000c2783          	lw	a5,0(s8)
    3ec4:	004c0c13          	add	s8,s8,4
    3ec8:	fe079ce3          	bnez	a5,3ec0 <.L19>
    3ecc:	00e00d13          	li	s10,14

00003ed0 <.L20>:
    3ed0:	000c2483          	lw	s1,0(s8)
    3ed4:	0c049a63          	bnez	s1,3fa8 <.L22>
    3ed8:	000c8513          	mv	a0,s9
    3edc:	120000ef          	jal	3ffc <_dl_aux_init>
    3ee0:	e71ff0ef          	jal	3d50 <__uClibc_init>
    3ee4:	00042783          	lw	a5,0(s0)
    3ee8:	0000e717          	auipc	a4,0xe
    3eec:	4cf72223          	sw	a5,1220(a4) # 123ac <__uclibc_progname>
    3ef0:	02078a63          	beqz	a5,3f24 <.L23>
    3ef4:	0000c717          	auipc	a4,0xc
    3ef8:	3ec72703          	lw	a4,1004(a4) # 102e0 <.LLST90+0x3b>
    3efc:	00f72023          	sw	a5,0(a4)
    3f00:	00042503          	lw	a0,0(s0)
    3f04:	02f00593          	li	a1,47
    3f08:	488020ef          	jal	6390 <__GI_strrchr>
    3f0c:	0000c797          	auipc	a5,0xc
    3f10:	3a47a783          	lw	a5,932(a5) # 102b0 <.LLST90+0xb>
    3f14:	00a7a023          	sw	a0,0(a5)
    3f18:	0a050863          	beqz	a0,3fc8 <.L24>
    3f1c:	00150513          	add	a0,a0,1
    3f20:	00a7a023          	sw	a0,0(a5)

00003f24 <.L23>:
    3f24:	015b2223          	sw	s5,4(s6)
    3f28:	0000eb17          	auipc	s6,0xe
    3f2c:	498b0b13          	add	s6,s6,1176 # 123c0 <__preinit_array_start>
    3f30:	0000ea97          	auipc	s5,0xe
    3f34:	494a8a93          	add	s5,s5,1172 # 123c4 <__frame_dummy_init_array_entry>
    3f38:	416a8ab3          	sub	s5,s5,s6
    3f3c:	402ada93          	sra	s5,s5,0x2
    3f40:	00000c13          	li	s8,0

00003f44 <.L25>:
    3f44:	095c1863          	bne	s8,s5,3fd4 <.L26>
    3f48:	00098463          	beqz	s3,3f50 <.L27>
    3f4c:	000980e7          	jalr	s3

00003f50 <.L27>:
    3f50:	0000ea97          	auipc	s5,0xe
    3f54:	474a8a93          	add	s5,s5,1140 # 123c4 <__frame_dummy_init_array_entry>
    3f58:	0000e997          	auipc	s3,0xe
    3f5c:	47098993          	add	s3,s3,1136 # 123c8 <__do_global_dtors_aux_fini_array_entry>
    3f60:	415989b3          	sub	s3,s3,s5
    3f64:	4029d993          	sra	s3,s3,0x2

00003f68 <.L28>:
    3f68:	08999063          	bne	s3,s1,3fe8 <.L29>
    3f6c:	0000c797          	auipc	a5,0xc
    3f70:	3607a783          	lw	a5,864(a5) # 102cc <.LLST90+0x27>
    3f74:	00078663          	beqz	a5,3f80 <.L30>
    3f78:	580000ef          	jal	44f8 <__errno_location>
    3f7c:	00052023          	sw	zero,0(a0)

00003f80 <.L30>:
    3f80:	0000c797          	auipc	a5,0xc
    3f84:	33c7a783          	lw	a5,828(a5) # 102bc <.LLST90+0x17>
    3f88:	00078663          	beqz	a5,3f94 <.L31>
    3f8c:	578000ef          	jal	4504 <__h_errno_location>
    3f90:	00052023          	sw	zero,0(a0)

00003f94 <.L31>:
    3f94:	000ba603          	lw	a2,0(s7)
    3f98:	00040593          	mv	a1,s0
    3f9c:	00090513          	mv	a0,s2
    3fa0:	000a00e7          	jalr	s4 # ffff0000 <_ebss+0xfffda110>
    3fa4:	654020ef          	jal	65f8 <__GI_exit>

00003fa8 <.L22>:
    3fa8:	009d6c63          	bltu	s10,s1,3fc0 <.L21>
    3fac:	00349513          	sll	a0,s1,0x3
    3fb0:	00800613          	li	a2,8
    3fb4:	000c0593          	mv	a1,s8
    3fb8:	00ac8533          	add	a0,s9,a0
    3fbc:	b35fe0ef          	jal	2af0 <__GI_memcpy>

00003fc0 <.L21>:
    3fc0:	008c0c13          	add	s8,s8,8
    3fc4:	f0dff06f          	j	3ed0 <.L20>

00003fc8 <.L24>:
    3fc8:	00042703          	lw	a4,0(s0)
    3fcc:	00e7a023          	sw	a4,0(a5)
    3fd0:	f55ff06f          	j	3f24 <.L23>

00003fd4 <.L26>:
    3fd4:	000b2783          	lw	a5,0(s6)
    3fd8:	001c0c13          	add	s8,s8,1
    3fdc:	004b0b13          	add	s6,s6,4
    3fe0:	000780e7          	jalr	a5
    3fe4:	f61ff06f          	j	3f44 <.L25>

00003fe8 <.L29>:
    3fe8:	000aa783          	lw	a5,0(s5)
    3fec:	00148493          	add	s1,s1,1
    3ff0:	004a8a93          	add	s5,s5,4
    3ff4:	000780e7          	jalr	a5
    3ff8:	f71ff06f          	j	3f68 <.L28>

00003ffc <_dl_aux_init>:
    3ffc:	01c52703          	lw	a4,28(a0)
    4000:	0000c797          	auipc	a5,0xc
    4004:	2b47a783          	lw	a5,692(a5) # 102b4 <.LLST90+0xf>
    4008:	00e7a023          	sw	a4,0(a5)
    400c:	02c52703          	lw	a4,44(a0)
    4010:	0000c797          	auipc	a5,0xc
    4014:	2b87a783          	lw	a5,696(a5) # 102c8 <.LLST90+0x23>
    4018:	00e7a023          	sw	a4,0(a5)
    401c:	03452783          	lw	a5,52(a0)
    4020:	00079463          	bnez	a5,4028 <.L2>
    4024:	000027b7          	lui	a5,0x2

00004028 <.L2>:
    4028:	0000c717          	auipc	a4,0xc
    402c:	2b472703          	lw	a4,692(a4) # 102dc <.LLST90+0x37>
    4030:	00f72023          	sw	a5,0(a4)
    4034:	00008067          	ret

00004038 <atan2f>:
    4038:	ff010113          	add	sp,sp,-16
    403c:	01212023          	sw	s2,0(sp)
    4040:	00050913          	mv	s2,a0
    4044:	00058513          	mv	a0,a1
    4048:	00112623          	sw	ra,12(sp)
    404c:	00812423          	sw	s0,8(sp)
    4050:	00912223          	sw	s1,4(sp)
    4054:	7380a0ef          	jal	e78c <__extendsfdf2>
    4058:	00050493          	mv	s1,a0
    405c:	00090513          	mv	a0,s2
    4060:	00058413          	mv	s0,a1
    4064:	7280a0ef          	jal	e78c <__extendsfdf2>
    4068:	00048613          	mv	a2,s1
    406c:	00040693          	mv	a3,s0
    4070:	5cc020ef          	jal	663c <__ieee754_atan2>
    4074:	2010a0ef          	jal	ea74 <__truncdfsf2>
    4078:	00c12083          	lw	ra,12(sp)
    407c:	00812403          	lw	s0,8(sp)
    4080:	00412483          	lw	s1,4(sp)
    4084:	00012903          	lw	s2,0(sp)
    4088:	01010113          	add	sp,sp,16
    408c:	00008067          	ret

00004090 <fmodf>:
    4090:	ff010113          	add	sp,sp,-16
    4094:	01212023          	sw	s2,0(sp)
    4098:	00050913          	mv	s2,a0
    409c:	00058513          	mv	a0,a1
    40a0:	00112623          	sw	ra,12(sp)
    40a4:	00812423          	sw	s0,8(sp)
    40a8:	00912223          	sw	s1,4(sp)
    40ac:	6e00a0ef          	jal	e78c <__extendsfdf2>
    40b0:	00050493          	mv	s1,a0
    40b4:	00090513          	mv	a0,s2
    40b8:	00058413          	mv	s0,a1
    40bc:	6d00a0ef          	jal	e78c <__extendsfdf2>
    40c0:	00048613          	mv	a2,s1
    40c4:	00040693          	mv	a3,s0
    40c8:	7d4020ef          	jal	689c <__ieee754_fmod>
    40cc:	1a90a0ef          	jal	ea74 <__truncdfsf2>
    40d0:	00c12083          	lw	ra,12(sp)
    40d4:	00812403          	lw	s0,8(sp)
    40d8:	00412483          	lw	s1,4(sp)
    40dc:	00012903          	lw	s2,0(sp)
    40e0:	01010113          	add	sp,sp,16
    40e4:	00008067          	ret

000040e8 <__GI_sinf>:
    40e8:	ff010113          	add	sp,sp,-16
    40ec:	00112623          	sw	ra,12(sp)
    40f0:	69c0a0ef          	jal	e78c <__extendsfdf2>
    40f4:	735020ef          	jal	7028 <__GI_sin>
    40f8:	17d0a0ef          	jal	ea74 <__truncdfsf2>
    40fc:	00c12083          	lw	ra,12(sp)
    4100:	01010113          	add	sp,sp,16
    4104:	00008067          	ret

00004108 <__GI_clock_getres>:
    4108:	07200893          	li	a7,114
    410c:	00000073          	ecall
    4110:	fffff7b7          	lui	a5,0xfffff
    4114:	00a7fc63          	bgeu	a5,a0,412c <.L1>
    4118:	40a00533          	neg	a0,a0
    411c:	0000c797          	auipc	a5,0xc
    4120:	1787a783          	lw	a5,376(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    4124:	00a7a023          	sw	a0,0(a5)
    4128:	fff00513          	li	a0,-1

0000412c <.L1>:
    412c:	00008067          	ret

00004130 <__GI_getdtablesize>:
    4130:	fe010113          	add	sp,sp,-32
    4134:	00810593          	add	a1,sp,8
    4138:	00700513          	li	a0,7
    413c:	00112e23          	sw	ra,28(sp)
    4140:	02c000ef          	jal	416c <__GI_getrlimit>
    4144:	10000793          	li	a5,256
    4148:	00054463          	bltz	a0,4150 <.L1>
    414c:	00812783          	lw	a5,8(sp)

00004150 <.L1>:
    4150:	01c12083          	lw	ra,28(sp)
    4154:	00078513          	mv	a0,a5
    4158:	02010113          	add	sp,sp,32
    415c:	00008067          	ret

00004160 <__GI_getpagesize>:
    4160:	00012517          	auipc	a0,0x12
    4164:	bf852503          	lw	a0,-1032(a0) # 15d58 <__pagesize>
    4168:	00008067          	ret

0000416c <__GI_getrlimit>:
    416c:	00058793          	mv	a5,a1
    4170:	0a300893          	li	a7,163
    4174:	00000073          	ecall
    4178:	fffff737          	lui	a4,0xfffff
    417c:	02a76c63          	bltu	a4,a0,41b4 <.L2>
    4180:	0005a683          	lw	a3,0(a1)
    4184:	80000737          	lui	a4,0x80000
    4188:	fff70713          	add	a4,a4,-1 # 7fffffff <_ebss+0x7ffea10f>
    418c:	00e69663          	bne	a3,a4,4198 <.L4>
    4190:	fff00713          	li	a4,-1
    4194:	00e5a023          	sw	a4,0(a1)

00004198 <.L4>:
    4198:	0047a683          	lw	a3,4(a5)
    419c:	80000737          	lui	a4,0x80000
    41a0:	fff70713          	add	a4,a4,-1 # 7fffffff <_ebss+0x7ffea10f>
    41a4:	00e69663          	bne	a3,a4,41b0 <.L1>
    41a8:	fff00713          	li	a4,-1
    41ac:	00e7a223          	sw	a4,4(a5)

000041b0 <.L1>:
    41b0:	00008067          	ret

000041b4 <.L2>:
    41b4:	40a00533          	neg	a0,a0
    41b8:	0000c797          	auipc	a5,0xc
    41bc:	0dc7a783          	lw	a5,220(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    41c0:	00a7a023          	sw	a0,0(a5)
    41c4:	fff00513          	li	a0,-1
    41c8:	00008067          	ret

000041cc <__GI_mmap>:
    41cc:	01379813          	sll	a6,a5,0x13
    41d0:	00080e63          	beqz	a6,41ec <.L2>
    41d4:	0000c797          	auipc	a5,0xc
    41d8:	0c07a783          	lw	a5,192(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    41dc:	01600713          	li	a4,22
    41e0:	00e7a023          	sw	a4,0(a5)

000041e4 <.L5>:
    41e4:	fff00513          	li	a0,-1

000041e8 <.L1>:
    41e8:	00008067          	ret

000041ec <.L2>:
    41ec:	00d7d793          	srl	a5,a5,0xd
    41f0:	0de00893          	li	a7,222
    41f4:	00000073          	ecall
    41f8:	fffff7b7          	lui	a5,0xfffff
    41fc:	fea7f6e3          	bgeu	a5,a0,41e8 <.L1>
    4200:	40a00533          	neg	a0,a0
    4204:	0000c797          	auipc	a5,0xc
    4208:	0907a783          	lw	a5,144(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    420c:	00a7a023          	sw	a0,0(a5)
    4210:	fd5ff06f          	j	41e4 <.L5>

00004214 <__GI_munmap>:
    4214:	0d700893          	li	a7,215
    4218:	00000073          	ecall
    421c:	fffff7b7          	lui	a5,0xfffff
    4220:	00a7fc63          	bgeu	a5,a0,4238 <.L1>
    4224:	40a00533          	neg	a0,a0
    4228:	0000c797          	auipc	a5,0xc
    422c:	06c7a783          	lw	a5,108(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    4230:	00a7a023          	sw	a0,0(a5)
    4234:	fff00513          	li	a0,-1

00004238 <.L1>:
    4238:	00008067          	ret

0000423c <sysinfo>:
    423c:	0b300893          	li	a7,179
    4240:	00000073          	ecall
    4244:	fffff7b7          	lui	a5,0xfffff
    4248:	00a7fc63          	bgeu	a5,a0,4260 <.L1>
    424c:	40a00533          	neg	a0,a0
    4250:	0000c797          	auipc	a5,0xc
    4254:	0447a783          	lw	a5,68(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    4258:	00a7a023          	sw	a0,0(a5)
    425c:	fff00513          	li	a0,-1

00004260 <.L1>:
    4260:	00008067          	ret

00004264 <__GI_closedir>:
    4264:	ff010113          	add	sp,sp,-16
    4268:	00912223          	sw	s1,4(sp)
    426c:	00052483          	lw	s1,0(a0)
    4270:	00112623          	sw	ra,12(sp)
    4274:	00812423          	sw	s0,8(sp)
    4278:	fff00793          	li	a5,-1
    427c:	02f48a63          	beq	s1,a5,42b0 <.L5>
    4280:	00050413          	mv	s0,a0
    4284:	00f52023          	sw	a5,0(a0)
    4288:	00c52503          	lw	a0,12(a0)
    428c:	a54ff0ef          	jal	34e0 <free>
    4290:	00040513          	mv	a0,s0
    4294:	a4cff0ef          	jal	34e0 <free>
    4298:	00812403          	lw	s0,8(sp)
    429c:	00c12083          	lw	ra,12(sp)
    42a0:	00048513          	mv	a0,s1
    42a4:	00412483          	lw	s1,4(sp)
    42a8:	01010113          	add	sp,sp,16
    42ac:	bb4fd06f          	j	1660 <__GI_close>

000042b0 <.L5>:
    42b0:	00c12083          	lw	ra,12(sp)
    42b4:	00812403          	lw	s0,8(sp)
    42b8:	0000c797          	auipc	a5,0xc
    42bc:	fdc7a783          	lw	a5,-36(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    42c0:	00900713          	li	a4,9
    42c4:	00e7a023          	sw	a4,0(a5)
    42c8:	00412483          	lw	s1,4(sp)
    42cc:	fff00513          	li	a0,-1
    42d0:	01010113          	add	sp,sp,16
    42d4:	00008067          	ret

000042d8 <fd_to_DIR>:
    42d8:	ff010113          	add	sp,sp,-16
    42dc:	01212023          	sw	s2,0(sp)
    42e0:	00050913          	mv	s2,a0
    42e4:	01c00513          	li	a0,28
    42e8:	00912223          	sw	s1,4(sp)
    42ec:	00112623          	sw	ra,12(sp)
    42f0:	00812423          	sw	s0,8(sp)
    42f4:	00058493          	mv	s1,a1
    42f8:	fd1fe0ef          	jal	32c8 <malloc>
    42fc:	04050263          	beqz	a0,4340 <.L2>
    4300:	01252023          	sw	s2,0(a0)
    4304:	00052823          	sw	zero,16(a0)
    4308:	00052423          	sw	zero,8(a0)
    430c:	00052223          	sw	zero,4(a0)
    4310:	20000793          	li	a5,512
    4314:	00050413          	mv	s0,a0
    4318:	00048593          	mv	a1,s1
    431c:	00f4f463          	bgeu	s1,a5,4324 <.L3>
    4320:	20000593          	li	a1,512

00004324 <.L3>:
    4324:	00b42a23          	sw	a1,20(s0)
    4328:	00100513          	li	a0,1
    432c:	10c020ef          	jal	6438 <calloc>
    4330:	00a42623          	sw	a0,12(s0)
    4334:	00051863          	bnez	a0,4344 <.L1>
    4338:	00040513          	mv	a0,s0
    433c:	9a4ff0ef          	jal	34e0 <free>

00004340 <.L2>:
    4340:	00000413          	li	s0,0

00004344 <.L1>:
    4344:	00c12083          	lw	ra,12(sp)
    4348:	00040513          	mv	a0,s0
    434c:	00812403          	lw	s0,8(sp)
    4350:	00412483          	lw	s1,4(sp)
    4354:	00012903          	lw	s2,0(sp)
    4358:	01010113          	add	sp,sp,16
    435c:	00008067          	ret

00004360 <fdopendir>:
    4360:	f8010113          	add	sp,sp,-128
    4364:	00810593          	add	a1,sp,8
    4368:	06812c23          	sw	s0,120(sp)
    436c:	06112e23          	sw	ra,124(sp)
    4370:	00050413          	mv	s0,a0
    4374:	63d020ef          	jal	71b0 <__GI_fstat64>
    4378:	02051463          	bnez	a0,43a0 <.L11>
    437c:	01812703          	lw	a4,24(sp)
    4380:	0000f7b7          	lui	a5,0xf
    4384:	00e7f7b3          	and	a5,a5,a4
    4388:	00004737          	lui	a4,0x4
    438c:	02e78463          	beq	a5,a4,43b4 <.L12>
    4390:	0000c797          	auipc	a5,0xc
    4394:	f047a783          	lw	a5,-252(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    4398:	01400713          	li	a4,20

0000439c <.L17>:
    439c:	00e7a023          	sw	a4,0(a5)

000043a0 <.L11>:
    43a0:	00000513          	li	a0,0

000043a4 <.L9>:
    43a4:	07c12083          	lw	ra,124(sp)
    43a8:	07812403          	lw	s0,120(sp)
    43ac:	08010113          	add	sp,sp,128
    43b0:	00008067          	ret

000043b4 <.L12>:
    43b4:	00300593          	li	a1,3
    43b8:	00040513          	mv	a0,s0
    43bc:	579020ef          	jal	7134 <__GI_fcntl>
    43c0:	fff00793          	li	a5,-1
    43c4:	fcf50ee3          	beq	a0,a5,43a0 <.L11>
    43c8:	00357793          	and	a5,a0,3
    43cc:	00100713          	li	a4,1
    43d0:	00e79a63          	bne	a5,a4,43e4 <.L15>
    43d4:	0000c797          	auipc	a5,0xc
    43d8:	ec07a783          	lw	a5,-320(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    43dc:	01600713          	li	a4,22
    43e0:	fbdff06f          	j	439c <.L17>

000043e4 <.L15>:
    43e4:	04012583          	lw	a1,64(sp)
    43e8:	00040513          	mv	a0,s0
    43ec:	eedff0ef          	jal	42d8 <fd_to_DIR>
    43f0:	fb5ff06f          	j	43a4 <.L9>

000043f4 <__GI_opendir>:
    43f4:	000915b7          	lui	a1,0x91
    43f8:	f8010113          	add	sp,sp,-128
    43fc:	80058593          	add	a1,a1,-2048 # 90800 <_ebss+0x7a910>
    4400:	06112e23          	sw	ra,124(sp)
    4404:	06812c23          	sw	s0,120(sp)
    4408:	06912a23          	sw	s1,116(sp)
    440c:	b84fd0ef          	jal	1790 <__open2_nocancel>
    4410:	00054e63          	bltz	a0,442c <.L19>
    4414:	00810593          	add	a1,sp,8
    4418:	00050413          	mv	s0,a0
    441c:	595020ef          	jal	71b0 <__GI_fstat64>
    4420:	02055463          	bgez	a0,4448 <.L20>
    4424:	00040513          	mv	a0,s0
    4428:	a60fd0ef          	jal	1688 <__close_nocancel_no_status>

0000442c <.L19>:
    442c:	00000493          	li	s1,0

00004430 <.L18>:
    4430:	07c12083          	lw	ra,124(sp)
    4434:	07812403          	lw	s0,120(sp)
    4438:	00048513          	mv	a0,s1
    443c:	07412483          	lw	s1,116(sp)
    4440:	08010113          	add	sp,sp,128
    4444:	00008067          	ret

00004448 <.L20>:
    4448:	00100613          	li	a2,1
    444c:	00200593          	li	a1,2
    4450:	00040513          	mv	a0,s0
    4454:	495020ef          	jal	70e8 <__fcntl_nocancel>
    4458:	04012583          	lw	a1,64(sp)
    445c:	00040513          	mv	a0,s0
    4460:	e79ff0ef          	jal	42d8 <fd_to_DIR>
    4464:	00050493          	mv	s1,a0
    4468:	fc0514e3          	bnez	a0,4430 <.L18>
    446c:	00040513          	mv	a0,s0
    4470:	a18fd0ef          	jal	1688 <__close_nocancel_no_status>
    4474:	fbdff06f          	j	4430 <.L18>

00004478 <__GI_readdir64>:
    4478:	ff010113          	add	sp,sp,-16
    447c:	00812423          	sw	s0,8(sp)
    4480:	00112623          	sw	ra,12(sp)
    4484:	00050413          	mv	s0,a0

00004488 <.L4>:
    4488:	00842703          	lw	a4,8(s0)
    448c:	00442783          	lw	a5,4(s0)
    4490:	00c42583          	lw	a1,12(s0)
    4494:	00e7ee63          	bltu	a5,a4,44b0 <.L2>
    4498:	01442603          	lw	a2,20(s0)
    449c:	00042503          	lw	a0,0(s0)
    44a0:	539020ef          	jal	71d8 <__getdents>
    44a4:	04a05663          	blez	a0,44f0 <.L6>
    44a8:	00a42423          	sw	a0,8(s0)
    44ac:	00042223          	sw	zero,4(s0)

000044b0 <.L2>:
    44b0:	00442703          	lw	a4,4(s0)
    44b4:	00c42503          	lw	a0,12(s0)
    44b8:	00e50533          	add	a0,a0,a4
    44bc:	01055783          	lhu	a5,16(a0)
    44c0:	00e787b3          	add	a5,a5,a4
    44c4:	00f42223          	sw	a5,4(s0)
    44c8:	00852783          	lw	a5,8(a0)
    44cc:	00452703          	lw	a4,4(a0)
    44d0:	00f42823          	sw	a5,16(s0)
    44d4:	00052783          	lw	a5,0(a0)
    44d8:	00e7e7b3          	or	a5,a5,a4
    44dc:	fa0786e3          	beqz	a5,4488 <.L4>

000044e0 <.L1>:
    44e0:	00c12083          	lw	ra,12(sp)
    44e4:	00812403          	lw	s0,8(sp)
    44e8:	01010113          	add	sp,sp,16
    44ec:	00008067          	ret

000044f0 <.L6>:
    44f0:	00000513          	li	a0,0
    44f4:	fedff06f          	j	44e0 <.L1>

000044f8 <__errno_location>:
    44f8:	0000c517          	auipc	a0,0xc
    44fc:	d9c52503          	lw	a0,-612(a0) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    4500:	00008067          	ret

00004504 <__h_errno_location>:
    4504:	0000c517          	auipc	a0,0xc
    4508:	d9c52503          	lw	a0,-612(a0) # 102a0 <_GLOBAL_OFFSET_TABLE_+0x18>
    450c:	00008067          	ret

00004510 <__GI_config_open>:
    4510:	ff010113          	add	sp,sp,-16
    4514:	0000e597          	auipc	a1,0xe
    4518:	aa858593          	add	a1,a1,-1368 # 11fbc <.LC0>
    451c:	00812423          	sw	s0,8(sp)
    4520:	00112623          	sw	ra,12(sp)
    4524:	494000ef          	jal	49b8 <__GI_fopen>
    4528:	00050413          	mv	s0,a0
    452c:	00050c63          	beqz	a0,4544 <.L1>
    4530:	01800593          	li	a1,24
    4534:	00100513          	li	a0,1
    4538:	701010ef          	jal	6438 <calloc>
    453c:	00051e63          	bnez	a0,4558 <.L3>

00004540 <.L4>:
    4540:	00050413          	mv	s0,a0

00004544 <.L1>:
    4544:	00c12083          	lw	ra,12(sp)
    4548:	00040513          	mv	a0,s0
    454c:	00812403          	lw	s0,8(sp)
    4550:	01010113          	add	sp,sp,16
    4554:	00008067          	ret

00004558 <.L3>:
    4558:	00852023          	sw	s0,0(a0)
    455c:	fe5ff06f          	j	4540 <.L4>

00004560 <__GI_config_close>:
    4560:	04050063          	beqz	a0,45a0 <.L9>
    4564:	ff010113          	add	sp,sp,-16
    4568:	00812423          	sw	s0,8(sp)
    456c:	00050413          	mv	s0,a0
    4570:	00052503          	lw	a0,0(a0)
    4574:	00112623          	sw	ra,12(sp)
    4578:	358000ef          	jal	48d0 <__GI_fclose>
    457c:	01442783          	lw	a5,20(s0)
    4580:	00078663          	beqz	a5,458c <.L11>
    4584:	00442503          	lw	a0,4(s0)
    4588:	f59fe0ef          	jal	34e0 <free>

0000458c <.L11>:
    458c:	00040513          	mv	a0,s0
    4590:	00812403          	lw	s0,8(sp)
    4594:	00c12083          	lw	ra,12(sp)
    4598:	01010113          	add	sp,sp,16
    459c:	f45fe06f          	j	34e0 <free>

000045a0 <.L9>:
    45a0:	00008067          	ret

000045a4 <__GI_config_read>:
    45a4:	fa010113          	add	sp,sp,-96
    45a8:	04112e23          	sw	ra,92(sp)
    45ac:	04812c23          	sw	s0,88(sp)
    45b0:	04912a23          	sw	s1,84(sp)
    45b4:	05212823          	sw	s2,80(sp)
    45b8:	05312623          	sw	s3,76(sp)
    45bc:	05412423          	sw	s4,72(sp)
    45c0:	05512223          	sw	s5,68(sp)
    45c4:	05612023          	sw	s6,64(sp)
    45c8:	03712e23          	sw	s7,60(sp)
    45cc:	03812c23          	sw	s8,56(sp)
    45d0:	03912a23          	sw	s9,52(sp)
    45d4:	03a12823          	sw	s10,48(sp)
    45d8:	03b12623          	sw	s11,44(sp)
    45dc:	0e050063          	beqz	a0,46bc <.L20>
    45e0:	0ff67a13          	zext.b	s4,a2
    45e4:	002a1793          	sll	a5,s4,0x2
    45e8:	00865a93          	srl	s5,a2,0x8
    45ec:	00f12623          	sw	a5,12(sp)
    45f0:	000209b7          	lui	s3,0x20
    45f4:	00178793          	add	a5,a5,1
    45f8:	00040b37          	lui	s6,0x40
    45fc:	00010bb7          	lui	s7,0x10
    4600:	00050c93          	mv	s9,a0
    4604:	00058913          	mv	s2,a1
    4608:	00060493          	mv	s1,a2
    460c:	00068413          	mv	s0,a3
    4610:	0ffafa93          	zext.b	s5,s5
    4614:	00f12823          	sw	a5,16(sp)
    4618:	013679b3          	and	s3,a2,s3
    461c:	01667b33          	and	s6,a2,s6
    4620:	01767bb3          	and	s7,a2,s7

00004624 <.L21>:
    4624:	004ca683          	lw	a3,4(s9)
    4628:	010ca703          	lw	a4,16(s9)
    462c:	04069263          	bnez	a3,4670 <.L22>
    4630:	00071663          	bnez	a4,463c <.L23>
    4634:	05100713          	li	a4,81
    4638:	00eca823          	sw	a4,16(s9)

0000463c <.L23>:
    463c:	008ca703          	lw	a4,8(s9)
    4640:	00071663          	bnez	a4,464c <.L24>
    4644:	01012783          	lw	a5,16(sp)
    4648:	00fca423          	sw	a5,8(s9)

0000464c <.L24>:
    464c:	008ca503          	lw	a0,8(s9)
    4650:	010ca703          	lw	a4,16(s9)
    4654:	00e50533          	add	a0,a0,a4
    4658:	c71fe0ef          	jal	32c8 <malloc>
    465c:	00aca223          	sw	a0,4(s9)
    4660:	04050e63          	beqz	a0,46bc <.L20>
    4664:	014ca703          	lw	a4,20(s9)
    4668:	00176713          	or	a4,a4,1
    466c:	00ecaa23          	sw	a4,20(s9)

00004670 <.L22>:
    4670:	004ca703          	lw	a4,4(s9)
    4674:	008ca683          	lw	a3,8(s9)
    4678:	00000d93          	li	s11,0
    467c:	00002c37          	lui	s8,0x2
    4680:	00d70733          	add	a4,a4,a3
    4684:	00eca623          	sw	a4,12(s9)
    4688:	05c00d13          	li	s10,92

0000468c <.L26>:
    468c:	010ca583          	lw	a1,16(s9)
    4690:	00cca503          	lw	a0,12(s9)
    4694:	000ca603          	lw	a2,0(s9)
    4698:	41b585b3          	sub	a1,a1,s11
    469c:	01b50533          	add	a0,a0,s11
    46a0:	05d010ef          	jal	5efc <__GI_fgets>
    46a4:	00cca703          	lw	a4,12(s9)
    46a8:	04051c63          	bnez	a0,4700 <.L27>
    46ac:	010ca603          	lw	a2,16(s9)
    46b0:	00000593          	li	a1,0
    46b4:	00070513          	mv	a0,a4
    46b8:	ee0fe0ef          	jal	2d98 <__GI_memset>

000046bc <.L20>:
    46bc:	00000d93          	li	s11,0

000046c0 <.L18>:
    46c0:	05c12083          	lw	ra,92(sp)
    46c4:	05812403          	lw	s0,88(sp)
    46c8:	05412483          	lw	s1,84(sp)
    46cc:	05012903          	lw	s2,80(sp)
    46d0:	04c12983          	lw	s3,76(sp)
    46d4:	04812a03          	lw	s4,72(sp)
    46d8:	04412a83          	lw	s5,68(sp)
    46dc:	04012b03          	lw	s6,64(sp)
    46e0:	03c12b83          	lw	s7,60(sp)
    46e4:	03812c03          	lw	s8,56(sp)
    46e8:	03412c83          	lw	s9,52(sp)
    46ec:	03012d03          	lw	s10,48(sp)
    46f0:	000d8513          	mv	a0,s11
    46f4:	02c12d83          	lw	s11,44(sp)
    46f8:	06010113          	add	sp,sp,96
    46fc:	00008067          	ret

00004700 <.L27>:
    4700:	01b70533          	add	a0,a4,s11
    4704:	00e12a23          	sw	a4,20(sp)
    4708:	f34fe0ef          	jal	2e3c <__GI_strlen>
    470c:	01412703          	lw	a4,20(sp)
    4710:	00ad8db3          	add	s11,s11,a0
    4714:	00a00593          	li	a1,10
    4718:	00070513          	mv	a0,a4
    471c:	289010ef          	jal	61a4 <__GI_strchr>
    4720:	02050063          	beqz	a0,4740 <.L29>
    4724:	00054703          	lbu	a4,0(a0)
    4728:	fff70713          	add	a4,a4,-1 # 3fff <_dl_aux_init+0x3>
    472c:	0ff77713          	zext.b	a4,a4
    4730:	00e50023          	sb	a4,0(a0)
    4734:	0fa71a63          	bne	a4,s10,4828 <.L30>
    4738:	ffed8d93          	add	s11,s11,-2
    473c:	f51ff06f          	j	468c <.L26>

00004740 <.L29>:
    4740:	014ca703          	lw	a4,20(s9)
    4744:	02071863          	bnez	a4,4774 <.L72>
    4748:	fff00d13          	li	s10,-1
    474c:	00a00c13          	li	s8,10

00004750 <.L32>:
    4750:	000ca503          	lw	a0,0(s9)
    4754:	01052703          	lw	a4,16(a0)
    4758:	01852683          	lw	a3,24(a0)
    475c:	04d77463          	bgeu	a4,a3,47a4 <.L33>
    4760:	00170693          	add	a3,a4,1
    4764:	00d52823          	sw	a3,16(a0)
    4768:	00074503          	lbu	a0,0(a4)

0000476c <.L34>:
    476c:	ff8512e3          	bne	a0,s8,4750 <.L32>
    4770:	03c0006f          	j	47ac <.L35>

00004774 <.L72>:
    4774:	010ca703          	lw	a4,16(s9)
    4778:	008ca583          	lw	a1,8(s9)
    477c:	004ca503          	lw	a0,4(s9)
    4780:	00ec0733          	add	a4,s8,a4
    4784:	00eca823          	sw	a4,16(s9)
    4788:	00b705b3          	add	a1,a4,a1
    478c:	511010ef          	jal	649c <realloc>
    4790:	008ca703          	lw	a4,8(s9)
    4794:	00aca223          	sw	a0,4(s9)
    4798:	00e50533          	add	a0,a0,a4
    479c:	00aca623          	sw	a0,12(s9)
    47a0:	eedff06f          	j	468c <.L26>

000047a4 <.L33>:
    47a4:	64c010ef          	jal	5df0 <__GI___fgetc_unlocked>
    47a8:	fda512e3          	bne	a0,s10,476c <.L34>

000047ac <.L35>:
    47ac:	fff00713          	li	a4,-1
    47b0:	f0ed86e3          	beq	s11,a4,46bc <.L20>
    47b4:	00ccad03          	lw	s10,12(s9)
    47b8:	00098a63          	beqz	s3,47cc <.L37>
    47bc:	000d0513          	mv	a0,s10
    47c0:	00140593          	add	a1,s0,1
    47c4:	439010ef          	jal	63fc <__GI_strspn>
    47c8:	00ad0d33          	add	s10,s10,a0

000047cc <.L37>:
    47cc:	000d4683          	lbu	a3,0(s10)
    47d0:	004ca503          	lw	a0,4(s9)
    47d4:	e40688e3          	beqz	a3,4624 <.L21>
    47d8:	00044603          	lbu	a2,0(s0)
    47dc:	e4d604e3          	beq	a2,a3,4624 <.L21>
    47e0:	00c12603          	lw	a2,12(sp)
    47e4:	00a92023          	sw	a0,0(s2)
    47e8:	00000593          	li	a1,0
    47ec:	dacfe0ef          	jal	2d98 <__GI_memset>
    47f0:	fffa0793          	add	a5,s4,-1
    47f4:	00f12c23          	sw	a5,24(sp)
    47f8:	00140793          	add	a5,s0,1
    47fc:	00000d93          	li	s11,0
    4800:	00f12e23          	sw	a5,28(sp)

00004804 <.L39>:
    4804:	000d4603          	lbu	a2,0(s10)
    4808:	00060863          	beqz	a2,4818 <.L51>
    480c:	00044583          	lbu	a1,0(s0)
    4810:	00c58463          	beq	a1,a2,4818 <.L51>
    4814:	014dce63          	blt	s11,s4,4830 <.L52>

00004818 <.L51>:
    4818:	eb5dd4e3          	bge	s11,s5,46c0 <.L18>
    481c:	00b49713          	sll	a4,s1,0xb
    4820:	e00752e3          	bgez	a4,4624 <.L21>
    4824:	e99ff06f          	j	46bc <.L20>

00004828 <.L30>:
    4828:	fffd8d93          	add	s11,s11,-1
    482c:	f81ff06f          	j	47ac <.L35>

00004830 <.L52>:
    4830:	00092603          	lw	a2,0(s2)
    4834:	002d9593          	sll	a1,s11,0x2
    4838:	01812783          	lw	a5,24(sp)
    483c:	00b60633          	add	a2,a2,a1
    4840:	01a62023          	sw	s10,0(a2)
    4844:	00044c03          	lbu	s8,0(s0)
    4848:	01b79463          	bne	a5,s11,4850 <.L40>
    484c:	040b1063          	bnez	s6,488c <.L41>

00004850 <.L40>:
    4850:	001c3593          	seqz	a1,s8
    4854:	000d0513          	mv	a0,s10
    4858:	00b405b3          	add	a1,s0,a1
    485c:	2d9010ef          	jal	6334 <__GI_strcspn>
    4860:	00ad0d33          	add	s10,s10,a0

00004864 <.L43>:
    4864:	000d4603          	lbu	a2,0(s10)
    4868:	04cc1c63          	bne	s8,a2,48c0 <.L46>
    486c:	000d0023          	sb	zero,0(s10)

00004870 <.L49>:
    4870:	000b8a63          	beqz	s7,4884 <.L50>
    4874:	01c12583          	lw	a1,28(sp)
    4878:	000d0513          	mv	a0,s10
    487c:	381010ef          	jal	63fc <__GI_strspn>
    4880:	00ad0d33          	add	s10,s10,a0

00004884 <.L50>:
    4884:	001d8d93          	add	s11,s11,1
    4888:	f7dff06f          	j	4804 <.L39>

0000488c <.L41>:
    488c:	000d0513          	mv	a0,s10
    4890:	000c0593          	mv	a1,s8
    4894:	1cd010ef          	jal	6260 <__GI_strchrnul>
    4898:	00050d13          	mv	s10,a0
    489c:	fc0984e3          	beqz	s3,4864 <.L43>
    48a0:	00140793          	add	a5,s0,1
    48a4:	00f12a23          	sw	a5,20(sp)

000048a8 <.L44>:
    48a8:	fffd4583          	lbu	a1,-1(s10)
    48ac:	01412503          	lw	a0,20(sp)
    48b0:	0f5010ef          	jal	61a4 <__GI_strchr>
    48b4:	fa0508e3          	beqz	a0,4864 <.L43>
    48b8:	fffd0d13          	add	s10,s10,-1
    48bc:	fedff06f          	j	48a8 <.L44>

000048c0 <.L46>:
    48c0:	fa0608e3          	beqz	a2,4870 <.L49>
    48c4:	000d0023          	sb	zero,0(s10)
    48c8:	001d0d13          	add	s10,s10,1
    48cc:	fa5ff06f          	j	4870 <.L49>

000048d0 <__GI_fclose>:
    48d0:	0000c717          	auipc	a4,0xc
    48d4:	9d472703          	lw	a4,-1580(a4) # 102a4 <_GLOBAL_OFFSET_TABLE_+0x1c>
    48d8:	00072783          	lw	a5,0(a4)
    48dc:	ff010113          	add	sp,sp,-16
    48e0:	00812423          	sw	s0,8(sp)
    48e4:	00112623          	sw	ra,12(sp)
    48e8:	00912223          	sw	s1,4(sp)
    48ec:	00050413          	mv	s0,a0
    48f0:	0aa79463          	bne	a5,a0,4998 <.L2>
    48f4:	02052783          	lw	a5,32(a0)
    48f8:	00f72023          	sw	a5,0(a4)

000048fc <.L3>:
    48fc:	00045783          	lhu	a5,0(s0)
    4900:	00000493          	li	s1,0
    4904:	0407f793          	and	a5,a5,64
    4908:	00078863          	beqz	a5,4918 <.L5>
    490c:	00040513          	mv	a0,s0
    4910:	408010ef          	jal	5d18 <__GI_fflush>
    4914:	00050493          	mv	s1,a0

00004918 <.L5>:
    4918:	00442503          	lw	a0,4(s0)
    491c:	ffe00793          	li	a5,-2
    4920:	08f51863          	bne	a0,a5,49b0 <.L6>
    4924:	03442783          	lw	a5,52(s0)
    4928:	00078a63          	beqz	a5,493c <.L9>
    492c:	02442503          	lw	a0,36(s0)
    4930:	000780e7          	jalr	a5

00004934 <.L8>:
    4934:	00055463          	bgez	a0,493c <.L9>
    4938:	fff00493          	li	s1,-1

0000493c <.L9>:
    493c:	00045703          	lhu	a4,0(s0)
    4940:	fff00793          	li	a5,-1
    4944:	00f42223          	sw	a5,4(s0)
    4948:	000067b7          	lui	a5,0x6
    494c:	00f777b3          	and	a5,a4,a5
    4950:	0307e793          	or	a5,a5,48
    4954:	00f41023          	sh	a5,0(s0)
    4958:	01171793          	sll	a5,a4,0x11
    495c:	0007d663          	bgez	a5,4968 <.L10>
    4960:	00842503          	lw	a0,8(s0)
    4964:	b7dfe0ef          	jal	34e0 <free>

00004968 <.L10>:
    4968:	00045783          	lhu	a5,0(s0)
    496c:	01279713          	sll	a4,a5,0x12
    4970:	00075663          	bgez	a4,497c <.L1>
    4974:	00040513          	mv	a0,s0
    4978:	b69fe0ef          	jal	34e0 <free>

0000497c <.L1>:
    497c:	00c12083          	lw	ra,12(sp)
    4980:	00812403          	lw	s0,8(sp)
    4984:	00048513          	mv	a0,s1
    4988:	00412483          	lw	s1,4(sp)
    498c:	01010113          	add	sp,sp,16
    4990:	00008067          	ret

00004994 <.L12>:
    4994:	00070793          	mv	a5,a4

00004998 <.L2>:
    4998:	f60782e3          	beqz	a5,48fc <.L3>
    499c:	0207a703          	lw	a4,32(a5) # 6020 <.L5+0x4>
    49a0:	fe871ae3          	bne	a4,s0,4994 <.L12>
    49a4:	02042703          	lw	a4,32(s0)
    49a8:	02e7a023          	sw	a4,32(a5)
    49ac:	f51ff06f          	j	48fc <.L3>

000049b0 <.L6>:
    49b0:	cb1fc0ef          	jal	1660 <__GI_close>
    49b4:	f81ff06f          	j	4934 <.L8>

000049b8 <__GI_fopen>:
    49b8:	fff00693          	li	a3,-1
    49bc:	00000613          	li	a2,0
    49c0:	16c0006f          	j	4b2c <_stdio_fopen>

000049c4 <__stdio_WRITE>:
    49c4:	fd010113          	add	sp,sp,-48
    49c8:	01512a23          	sw	s5,20(sp)
    49cc:	80000ab7          	lui	s5,0x80000
    49d0:	02812423          	sw	s0,40(sp)
    49d4:	02912223          	sw	s1,36(sp)
    49d8:	03212023          	sw	s2,32(sp)
    49dc:	01312e23          	sw	s3,28(sp)
    49e0:	01612823          	sw	s6,16(sp)
    49e4:	01712623          	sw	s7,12(sp)
    49e8:	01812423          	sw	s8,8(sp)
    49ec:	02112623          	sw	ra,44(sp)
    49f0:	01412c23          	sw	s4,24(sp)
    49f4:	00050493          	mv	s1,a0
    49f8:	00058413          	mv	s0,a1
    49fc:	00060993          	mv	s3,a2
    4a00:	00060913          	mv	s2,a2
    4a04:	fffa8a93          	add	s5,s5,-1 # 7fffffff <_ebss+0x7ffea10f>
    4a08:	ffe00b93          	li	s7,-2
    4a0c:	0000cb17          	auipc	s6,0xc
    4a10:	888b2b03          	lw	s6,-1912(s6) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    4a14:	00b00c13          	li	s8,11

00004a18 <.L2>:
    4a18:	04090c63          	beqz	s2,4a70 <.L10>
    4a1c:	00090a13          	mv	s4,s2
    4a20:	00090613          	mv	a2,s2
    4a24:	00095463          	bgez	s2,4a2c <.L3>
    4a28:	000a8613          	mv	a2,s5

00004a2c <.L3>:
    4a2c:	0044a503          	lw	a0,4(s1)
    4a30:	09751c63          	bne	a0,s7,4ac8 <.L4>
    4a34:	02c4a783          	lw	a5,44(s1)
    4a38:	06079663          	bnez	a5,4aa4 <.L5>
    4a3c:	01600793          	li	a5,22
    4a40:	00fb2023          	sw	a5,0(s6)

00004a44 <.L6>:
    4a44:	0004d783          	lhu	a5,0(s1)
    4a48:	00400713          	li	a4,4
    4a4c:	0087e793          	or	a5,a5,8
    4a50:	00f49023          	sh	a5,0(s1)
    4a54:	0000c797          	auipc	a5,0xc
    4a58:	8407a783          	lw	a5,-1984(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    4a5c:	0007a783          	lw	a5,0(a5)
    4a60:	06e78a63          	beq	a5,a4,4ad4 <.L9>
    4a64:	00b00713          	li	a4,11
    4a68:	06e78663          	beq	a5,a4,4ad4 <.L9>

00004a6c <.L11>:
    4a6c:	412989b3          	sub	s3,s3,s2

00004a70 <.L10>:
    4a70:	02c12083          	lw	ra,44(sp)
    4a74:	02812403          	lw	s0,40(sp)
    4a78:	02412483          	lw	s1,36(sp)
    4a7c:	02012903          	lw	s2,32(sp)
    4a80:	01812a03          	lw	s4,24(sp)
    4a84:	01412a83          	lw	s5,20(sp)
    4a88:	01012b03          	lw	s6,16(sp)
    4a8c:	00c12b83          	lw	s7,12(sp)
    4a90:	00812c03          	lw	s8,8(sp)
    4a94:	00098513          	mv	a0,s3
    4a98:	01c12983          	lw	s3,28(sp)
    4a9c:	03010113          	add	sp,sp,48
    4aa0:	00008067          	ret

00004aa4 <.L5>:
    4aa4:	0244a503          	lw	a0,36(s1)
    4aa8:	018b2023          	sw	s8,0(s6)
    4aac:	00040593          	mv	a1,s0
    4ab0:	000780e7          	jalr	a5
    4ab4:	f80508e3          	beqz	a0,4a44 <.L6>

00004ab8 <.L7>:
    4ab8:	f80546e3          	bltz	a0,4a44 <.L6>
    4abc:	40a90933          	sub	s2,s2,a0
    4ac0:	00a40433          	add	s0,s0,a0
    4ac4:	f55ff06f          	j	4a18 <.L2>

00004ac8 <.L4>:
    4ac8:	00040593          	mv	a1,s0
    4acc:	d19fc0ef          	jal	17e4 <__GI_write>
    4ad0:	fe9ff06f          	j	4ab8 <.L7>

00004ad4 <.L9>:
    4ad4:	0084a783          	lw	a5,8(s1)
    4ad8:	00c4a683          	lw	a3,12(s1)
    4adc:	40f68733          	sub	a4,a3,a5
    4ae0:	f8f686e3          	beq	a3,a5,4a6c <.L11>
    4ae4:	00e96463          	bltu	s2,a4,4aec <.L12>
    4ae8:	00070a13          	mv	s4,a4

00004aec <.L12>:
    4aec:	00a00693          	li	a3,10
    4af0:	01440a33          	add	s4,s0,s4

00004af4 <.L15>:
    4af4:	00044703          	lbu	a4,0(s0)
    4af8:	00e78023          	sb	a4,0(a5)
    4afc:	00d71863          	bne	a4,a3,4b0c <.L13>
    4b00:	0004d703          	lhu	a4,0(s1)
    4b04:	10077713          	and	a4,a4,256
    4b08:	00071863          	bnez	a4,4b18 <.L14>

00004b0c <.L13>:
    4b0c:	00140413          	add	s0,s0,1
    4b10:	00178793          	add	a5,a5,1
    4b14:	ff4410e3          	bne	s0,s4,4af4 <.L15>

00004b18 <.L14>:
    4b18:	0084a703          	lw	a4,8(s1)
    4b1c:	00f4a823          	sw	a5,16(s1)
    4b20:	40e787b3          	sub	a5,a5,a4
    4b24:	40f90933          	sub	s2,s2,a5
    4b28:	f45ff06f          	j	4a6c <.L11>

00004b2c <_stdio_fopen>:
    4b2c:	fe010113          	add	sp,sp,-32
    4b30:	00812c23          	sw	s0,24(sp)
    4b34:	01212823          	sw	s2,16(sp)
    4b38:	01312623          	sw	s3,12(sp)
    4b3c:	00112e23          	sw	ra,28(sp)
    4b40:	00912a23          	sw	s1,20(sp)
    4b44:	0005c783          	lbu	a5,0(a1)
    4b48:	07200713          	li	a4,114
    4b4c:	00050913          	mv	s2,a0
    4b50:	00060413          	mv	s0,a2
    4b54:	00068993          	mv	s3,a3
    4b58:	04e78663          	beq	a5,a4,4ba4 <.L26>
    4b5c:	07700713          	li	a4,119
    4b60:	0ee78663          	beq	a5,a4,4c4c <.L27>
    4b64:	06100713          	li	a4,97
    4b68:	0ee78663          	beq	a5,a4,4c54 <.L28>
    4b6c:	0000b797          	auipc	a5,0xb
    4b70:	7287a783          	lw	a5,1832(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    4b74:	01600713          	li	a4,22
    4b78:	00e7a023          	sw	a4,0(a5)
    4b7c:	0a061c63          	bnez	a2,4c34 <.L5>

00004b80 <.L8>:
    4b80:	00000413          	li	s0,0

00004b84 <.L6>:
    4b84:	01c12083          	lw	ra,28(sp)
    4b88:	00040513          	mv	a0,s0
    4b8c:	01812403          	lw	s0,24(sp)
    4b90:	01412483          	lw	s1,20(sp)
    4b94:	01012903          	lw	s2,16(sp)
    4b98:	00c12983          	lw	s3,12(sp)
    4b9c:	02010113          	add	sp,sp,32
    4ba0:	00008067          	ret

00004ba4 <.L26>:
    4ba4:	00000493          	li	s1,0

00004ba8 <.L2>:
    4ba8:	0015c703          	lbu	a4,1(a1)
    4bac:	06200793          	li	a5,98
    4bb0:	00f71463          	bne	a4,a5,4bb8 <.L9>
    4bb4:	00158593          	add	a1,a1,1

00004bb8 <.L9>:
    4bb8:	0015c703          	lbu	a4,1(a1)
    4bbc:	02b00793          	li	a5,43
    4bc0:	00f71863          	bne	a4,a5,4bd0 <.L10>
    4bc4:	0014e493          	or	s1,s1,1
    4bc8:	00158593          	add	a1,a1,1
    4bcc:	00148493          	add	s1,s1,1

00004bd0 <.L10>:
    4bd0:	07800713          	li	a4,120

00004bd4 <.L11>:
    4bd4:	0015c783          	lbu	a5,1(a1)
    4bd8:	00158593          	add	a1,a1,1
    4bdc:	08079063          	bnez	a5,4c5c <.L13>
    4be0:	02041063          	bnez	s0,4c00 <.L14>
    4be4:	02400513          	li	a0,36
    4be8:	ee0fe0ef          	jal	32c8 <malloc>
    4bec:	00050413          	mv	s0,a0
    4bf0:	f80508e3          	beqz	a0,4b80 <.L8>
    4bf4:	000027b7          	lui	a5,0x2
    4bf8:	00f51023          	sh	a5,0(a0)
    4bfc:	00052423          	sw	zero,8(a0)

00004c00 <.L14>:
    4c00:	1609c263          	bltz	s3,4d64 <.L15>
    4c04:	000087b7          	lui	a5,0x8
    4c08:	00378793          	add	a5,a5,3 # 8003 <__kernel_rem_pio2+0x63>
    4c0c:	00f4f7b3          	and	a5,s1,a5
    4c10:	00178793          	add	a5,a5,1
    4c14:	00190713          	add	a4,s2,1
    4c18:	01342223          	sw	s3,4(s0)
    4c1c:	00f77733          	and	a4,a4,a5
    4c20:	04f70463          	beq	a4,a5,4c68 <.L16>

00004c24 <.L41>:
    4c24:	0000b797          	auipc	a5,0xb
    4c28:	6707a783          	lw	a5,1648(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    4c2c:	01600713          	li	a4,22
    4c30:	00e7a023          	sw	a4,0(a5)

00004c34 <.L5>:
    4c34:	00045783          	lhu	a5,0(s0)
    4c38:	01279713          	sll	a4,a5,0x12
    4c3c:	f40752e3          	bgez	a4,4b80 <.L8>
    4c40:	00040513          	mv	a0,s0
    4c44:	89dfe0ef          	jal	34e0 <free>
    4c48:	f39ff06f          	j	4b80 <.L8>

00004c4c <.L27>:
    4c4c:	24100493          	li	s1,577
    4c50:	f59ff06f          	j	4ba8 <.L2>

00004c54 <.L28>:
    4c54:	44100493          	li	s1,1089
    4c58:	f51ff06f          	j	4ba8 <.L2>

00004c5c <.L13>:
    4c5c:	f6e79ce3          	bne	a5,a4,4bd4 <.L11>
    4c60:	0804e493          	or	s1,s1,128
    4c64:	f71ff06f          	j	4bd4 <.L11>

00004c68 <.L16>:
    4c68:	fff94793          	not	a5,s2
    4c6c:	0097f7b3          	and	a5,a5,s1
    4c70:	4007f793          	and	a5,a5,1024
    4c74:	0c079c63          	bnez	a5,4d4c <.L17>

00004c78 <.L20>:
    4c78:	000087b7          	lui	a5,0x8
    4c7c:	00f977b3          	and	a5,s2,a5
    4c80:	00f4e4b3          	or	s1,s1,a5

00004c84 <.L18>:
    4c84:	00045783          	lhu	a5,0(s0)
    4c88:	00002737          	lui	a4,0x2
    4c8c:	00442503          	lw	a0,4(s0)
    4c90:	00e7f7b3          	and	a5,a5,a4
    4c94:	ffff8737          	lui	a4,0xffff8
    4c98:	40070713          	add	a4,a4,1024 # ffff8400 <_ebss+0xfffe2510>
    4c9c:	00e4f733          	and	a4,s1,a4
    4ca0:	0034f493          	and	s1,s1,3
    4ca4:	00148493          	add	s1,s1,1
    4ca8:	0034c493          	xor	s1,s1,3
    4cac:	00e7e7b3          	or	a5,a5,a4
    4cb0:	00449493          	sll	s1,s1,0x4
    4cb4:	0097e7b3          	or	a5,a5,s1
    4cb8:	00f41023          	sh	a5,0(s0)
    4cbc:	800007b7          	lui	a5,0x80000
    4cc0:	fff78793          	add	a5,a5,-1 # 7fffffff <_ebss+0x7ffea10f>
    4cc4:	02f50463          	beq	a0,a5,4cec <.L22>
    4cc8:	0000b497          	auipc	s1,0xb
    4ccc:	5cc4a483          	lw	s1,1484(s1) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    4cd0:	0004a903          	lw	s2,0(s1)
    4cd4:	be4fe0ef          	jal	30b8 <__GI_isatty>
    4cd8:	00050863          	beqz	a0,4ce8 <.L23>
    4cdc:	00045783          	lhu	a5,0(s0)
    4ce0:	1007e793          	or	a5,a5,256
    4ce4:	00f41023          	sh	a5,0(s0)

00004ce8 <.L23>:
    4ce8:	0124a023          	sw	s2,0(s1)

00004cec <.L22>:
    4cec:	00842783          	lw	a5,8(s0)
    4cf0:	02079863          	bnez	a5,4d20 <.L24>
    4cf4:	00001537          	lui	a0,0x1
    4cf8:	dd0fe0ef          	jal	32c8 <malloc>
    4cfc:	00a42423          	sw	a0,8(s0)
    4d00:	08050863          	beqz	a0,4d90 <.L25>
    4d04:	000017b7          	lui	a5,0x1
    4d08:	00f50533          	add	a0,a0,a5
    4d0c:	00045783          	lhu	a5,0(s0)
    4d10:	00004737          	lui	a4,0x4
    4d14:	00a42623          	sw	a0,12(s0)
    4d18:	00e7e7b3          	or	a5,a5,a4
    4d1c:	00f41023          	sh	a5,0(s0)

00004d20 <.L24>:
    4d20:	00842783          	lw	a5,8(s0)
    4d24:	00f42c23          	sw	a5,24(s0)
    4d28:	00f42e23          	sw	a5,28(s0)
    4d2c:	00f42823          	sw	a5,16(s0)
    4d30:	00f42a23          	sw	a5,20(s0)
    4d34:	0000b797          	auipc	a5,0xb
    4d38:	5707a783          	lw	a5,1392(a5) # 102a4 <_GLOBAL_OFFSET_TABLE_+0x1c>
    4d3c:	0007a703          	lw	a4,0(a5)
    4d40:	0087a023          	sw	s0,0(a5)
    4d44:	02e42023          	sw	a4,32(s0)
    4d48:	e3dff06f          	j	4b84 <.L6>

00004d4c <.L17>:
    4d4c:	40000613          	li	a2,1024
    4d50:	00400593          	li	a1,4
    4d54:	00098513          	mv	a0,s3
    4d58:	3dc020ef          	jal	7134 <__GI_fcntl>
    4d5c:	f0050ee3          	beqz	a0,4c78 <.L20>
    4d60:	ec5ff06f          	j	4c24 <.L41>

00004d64 <.L15>:
    4d64:	fff00793          	li	a5,-1
    4d68:	00f98663          	beq	s3,a5,4d74 <.L21>
    4d6c:	000087b7          	lui	a5,0x8
    4d70:	00f4e4b3          	or	s1,s1,a5

00004d74 <.L21>:
    4d74:	1b600613          	li	a2,438
    4d78:	00048593          	mv	a1,s1
    4d7c:	00090513          	mv	a0,s2
    4d80:	9b5fc0ef          	jal	1734 <__GI_open>
    4d84:	00a42223          	sw	a0,4(s0)
    4d88:	ee055ee3          	bgez	a0,4c84 <.L18>
    4d8c:	ea9ff06f          	j	4c34 <.L5>

00004d90 <.L25>:
    4d90:	00042623          	sw	zero,12(s0)
    4d94:	f8dff06f          	j	4d20 <.L24>

00004d98 <__stdio_fwrite>:
    4d98:	00065783          	lhu	a5,0(a2)
    4d9c:	fe010113          	add	sp,sp,-32
    4da0:	00812c23          	sw	s0,24(sp)
    4da4:	00912a23          	sw	s1,20(sp)
    4da8:	01212823          	sw	s2,16(sp)
    4dac:	00112e23          	sw	ra,28(sp)
    4db0:	01312623          	sw	s3,12(sp)
    4db4:	2007f793          	and	a5,a5,512
    4db8:	00050913          	mv	s2,a0
    4dbc:	00058413          	mv	s0,a1
    4dc0:	00060493          	mv	s1,a2
    4dc4:	02078663          	beqz	a5,4df0 <.L2>

00004dc8 <.L11>:
    4dc8:	00040613          	mv	a2,s0
    4dcc:	01812403          	lw	s0,24(sp)
    4dd0:	01c12083          	lw	ra,28(sp)
    4dd4:	00c12983          	lw	s3,12(sp)
    4dd8:	00090593          	mv	a1,s2
    4ddc:	00048513          	mv	a0,s1
    4de0:	01012903          	lw	s2,16(sp)
    4de4:	01412483          	lw	s1,20(sp)
    4de8:	02010113          	add	sp,sp,32
    4dec:	bd9ff06f          	j	49c4 <__stdio_WRITE>

00004df0 <.L2>:
    4df0:	01062503          	lw	a0,16(a2)
    4df4:	00c62783          	lw	a5,12(a2)
    4df8:	00462683          	lw	a3,4(a2)
    4dfc:	ffd00713          	li	a4,-3
    4e00:	40a787b3          	sub	a5,a5,a0
    4e04:	04e69463          	bne	a3,a4,4e4c <.L3>
    4e08:	00058993          	mv	s3,a1
    4e0c:	00b7f463          	bgeu	a5,a1,4e14 <.L4>
    4e10:	00078993          	mv	s3,a5

00004e14 <.L4>:
    4e14:	00098613          	mv	a2,s3
    4e18:	00090593          	mv	a1,s2
    4e1c:	cd5fd0ef          	jal	2af0 <__GI_memcpy>
    4e20:	0104a783          	lw	a5,16(s1)
    4e24:	013787b3          	add	a5,a5,s3

00004e28 <.L25>:
    4e28:	00f4a823          	sw	a5,16(s1)

00004e2c <.L5>:
    4e2c:	01c12083          	lw	ra,28(sp)
    4e30:	00040513          	mv	a0,s0
    4e34:	01812403          	lw	s0,24(sp)
    4e38:	01412483          	lw	s1,20(sp)
    4e3c:	01012903          	lw	s2,16(sp)
    4e40:	00c12983          	lw	s3,12(sp)
    4e44:	02010113          	add	sp,sp,32
    4e48:	00008067          	ret

00004e4c <.L3>:
    4e4c:	08b7e063          	bltu	a5,a1,4ecc <.L6>
    4e50:	00058613          	mv	a2,a1
    4e54:	00090593          	mv	a1,s2
    4e58:	c99fd0ef          	jal	2af0 <__GI_memcpy>
    4e5c:	0104a783          	lw	a5,16(s1)
    4e60:	008787b3          	add	a5,a5,s0
    4e64:	00f4a823          	sw	a5,16(s1)
    4e68:	0004d783          	lhu	a5,0(s1)
    4e6c:	1007f793          	and	a5,a5,256
    4e70:	fa078ee3          	beqz	a5,4e2c <.L5>
    4e74:	00040613          	mv	a2,s0
    4e78:	00a00593          	li	a1,10
    4e7c:	00090513          	mv	a0,s2
    4e80:	254010ef          	jal	60d4 <__GI_memrchr>
    4e84:	fa0504e3          	beqz	a0,4e2c <.L5>
    4e88:	00048513          	mv	a0,s1
    4e8c:	b0dfc0ef          	jal	1998 <__stdio_wcommit>
    4e90:	f8050ee3          	beqz	a0,4e2c <.L5>
    4e94:	00040613          	mv	a2,s0
    4e98:	00857463          	bgeu	a0,s0,4ea0 <.L10>
    4e9c:	00050613          	mv	a2,a0

00004ea0 <.L10>:
    4ea0:	40c40533          	sub	a0,s0,a2
    4ea4:	00a00593          	li	a1,10
    4ea8:	00a90533          	add	a0,s2,a0
    4eac:	12c010ef          	jal	5fd8 <__GI_memchr>
    4eb0:	f6050ee3          	beqz	a0,4e2c <.L5>
    4eb4:	0104a783          	lw	a5,16(s1)
    4eb8:	00890933          	add	s2,s2,s0
    4ebc:	40a90533          	sub	a0,s2,a0
    4ec0:	40a40433          	sub	s0,s0,a0
    4ec4:	40a787b3          	sub	a5,a5,a0
    4ec8:	f61ff06f          	j	4e28 <.L25>

00004ecc <.L6>:
    4ecc:	00862783          	lw	a5,8(a2)
    4ed0:	eea78ce3          	beq	a5,a0,4dc8 <.L11>
    4ed4:	00060513          	mv	a0,a2
    4ed8:	ac1fc0ef          	jal	1998 <__stdio_wcommit>
    4edc:	ee0506e3          	beqz	a0,4dc8 <.L11>
    4ee0:	00000413          	li	s0,0
    4ee4:	f49ff06f          	j	4e2c <.L5>

00004ee8 <__stdio_trans2w>:
    4ee8:	00055603          	lhu	a2,0(a0) # 1000 <.L52+0x4>
    4eec:	ff010113          	add	sp,sp,-16
    4ef0:	00812423          	sw	s0,8(sp)
    4ef4:	00112623          	sw	ra,12(sp)
    4ef8:	02067793          	and	a5,a2,32
    4efc:	00050413          	mv	s0,a0
    4f00:	02078a63          	beqz	a5,4f34 <.L2>
    4f04:	0000b797          	auipc	a5,0xb
    4f08:	3907a783          	lw	a5,912(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    4f0c:	00900713          	li	a4,9
    4f10:	00e7a023          	sw	a4,0(a5)

00004f14 <.L3>:
    4f14:	00045783          	lhu	a5,0(s0)
    4f18:	fff00513          	li	a0,-1
    4f1c:	0087e793          	or	a5,a5,8
    4f20:	00f41023          	sh	a5,0(s0)

00004f24 <.L1>:
    4f24:	00c12083          	lw	ra,12(sp)
    4f28:	00812403          	lw	s0,8(sp)
    4f2c:	01010113          	add	sp,sp,16
    4f30:	00008067          	ret

00004f34 <.L2>:
    4f34:	00367793          	and	a5,a2,3
    4f38:	02078463          	beqz	a5,4f60 <.L5>
    4f3c:	00467793          	and	a5,a2,4
    4f40:	02078e63          	beqz	a5,4f7c <.L6>

00004f44 <.L8>:
    4f44:	00045783          	lhu	a5,0(s0)
    4f48:	ffc7f793          	and	a5,a5,-4
    4f4c:	00f41023          	sh	a5,0(s0)
    4f50:	00842783          	lw	a5,8(s0)
    4f54:	00f42c23          	sw	a5,24(s0)
    4f58:	00f42823          	sw	a5,16(s0)
    4f5c:	00f42a23          	sw	a5,20(s0)

00004f60 <.L5>:
    4f60:	00045783          	lhu	a5,0(s0)
    4f64:	0407e713          	or	a4,a5,64
    4f68:	00e41023          	sh	a4,0(s0)
    4f6c:	3007f793          	and	a5,a5,768
    4f70:	04078063          	beqz	a5,4fb0 <.L10>

00004f74 <.L11>:
    4f74:	00000513          	li	a0,0
    4f78:	fadff06f          	j	4f24 <.L1>

00004f7c <.L6>:
    4f7c:	01452703          	lw	a4,20(a0)
    4f80:	01052783          	lw	a5,16(a0)
    4f84:	00f71663          	bne	a4,a5,4f90 <.L7>
    4f88:	00267793          	and	a5,a2,2
    4f8c:	fa078ce3          	beqz	a5,4f44 <.L8>

00004f90 <.L7>:
    4f90:	40067613          	and	a2,a2,1024
    4f94:	00c03633          	snez	a2,a2
    4f98:	00160613          	add	a2,a2,1
    4f9c:	00000593          	li	a1,0
    4fa0:	00040513          	mv	a0,s0
    4fa4:	3a8020ef          	jal	734c <__GI_fseek>
    4fa8:	f8050ee3          	beqz	a0,4f44 <.L8>
    4fac:	f69ff06f          	j	4f14 <.L3>

00004fb0 <.L10>:
    4fb0:	00c42783          	lw	a5,12(s0)
    4fb4:	00f42e23          	sw	a5,28(s0)
    4fb8:	fbdff06f          	j	4f74 <.L11>

00004fbc <_load_inttype>:
    4fbc:	00001737          	lui	a4,0x1
    4fc0:	80070713          	add	a4,a4,-2048 # 800 <.L25>
    4fc4:	00050793          	mv	a5,a0
    4fc8:	00e57733          	and	a4,a0,a4
    4fcc:	0005a503          	lw	a0,0(a1)
    4fd0:	02064c63          	bltz	a2,5008 <.L2>
    4fd4:	00070663          	beqz	a4,4fe0 <.L3>

00004fd8 <.L10>:
    4fd8:	0045a583          	lw	a1,4(a1)
    4fdc:	00008067          	ret

00004fe0 <.L3>:
    4fe0:	10000713          	li	a4,256
    4fe4:	00e79863          	bne	a5,a4,4ff4 <.L5>
    4fe8:	0ff57513          	zext.b	a0,a0

00004fec <.L6>:
    4fec:	00000593          	li	a1,0
    4ff0:	00008067          	ret

00004ff4 <.L5>:
    4ff4:	20000713          	li	a4,512
    4ff8:	fee79ae3          	bne	a5,a4,4fec <.L6>
    4ffc:	01051513          	sll	a0,a0,0x10
    5000:	01055513          	srl	a0,a0,0x10
    5004:	fe9ff06f          	j	4fec <.L6>

00005008 <.L2>:
    5008:	fc0718e3          	bnez	a4,4fd8 <.L10>
    500c:	10000713          	li	a4,256
    5010:	00e79a63          	bne	a5,a4,5024 <.L8>
    5014:	01851513          	sll	a0,a0,0x18
    5018:	41855513          	sra	a0,a0,0x18

0000501c <.L9>:
    501c:	41f55593          	sra	a1,a0,0x1f
    5020:	00008067          	ret

00005024 <.L8>:
    5024:	20000713          	li	a4,512
    5028:	fee79ae3          	bne	a5,a4,501c <.L9>
    502c:	01051513          	sll	a0,a0,0x10
    5030:	41055513          	sra	a0,a0,0x10
    5034:	fe9ff06f          	j	501c <.L9>

00005038 <_store_inttype>:
    5038:	10000793          	li	a5,256
    503c:	00f59663          	bne	a1,a5,5048 <.L2>
    5040:	00c50023          	sb	a2,0(a0)
    5044:	00008067          	ret

00005048 <.L2>:
    5048:	80058793          	add	a5,a1,-2048
    504c:	00079863          	bnez	a5,505c <.L4>
    5050:	00c52023          	sw	a2,0(a0)
    5054:	00d52223          	sw	a3,4(a0)
    5058:	00008067          	ret

0000505c <.L4>:
    505c:	20000793          	li	a5,512
    5060:	00f59663          	bne	a1,a5,506c <.L5>
    5064:	00c51023          	sh	a2,0(a0)
    5068:	00008067          	ret

0000506c <.L5>:
    506c:	00c52023          	sw	a2,0(a0)
    5070:	00008067          	ret

00005074 <_uintmaxtostr>:
    5074:	00050893          	mv	a7,a0
    5078:	00000e13          	li	t3,0
    507c:	0206d063          	bgez	a3,509c <.L2>
    5080:	40d006b3          	neg	a3,a3
    5084:	00065c63          	bgez	a2,509c <.L2>
    5088:	00b037b3          	snez	a5,a1
    508c:	40c00633          	neg	a2,a2
    5090:	40f60633          	sub	a2,a2,a5
    5094:	40b005b3          	neg	a1,a1
    5098:	00100e13          	li	t3,1

0000509c <.L2>:
    509c:	fff00813          	li	a6,-1
    50a0:	02d85333          	divu	t1,a6,a3
    50a4:	00088023          	sb	zero,0(a7)
    50a8:	02d87833          	remu	a6,a6,a3
    50ac:	00180813          	add	a6,a6,1
    50b0:	01069663          	bne	a3,a6,50bc <.L4>
    50b4:	00130313          	add	t1,t1,1
    50b8:	00000813          	li	a6,0

000050bc <.L4>:
    50bc:	00900e93          	li	t4,9

000050c0 <.L8>:
    50c0:	02d5f533          	remu	a0,a1,a3
    50c4:	02d5d5b3          	divu	a1,a1,a3
    50c8:	02060463          	beqz	a2,50f0 <.L5>
    50cc:	02d677b3          	remu	a5,a2,a3
    50d0:	02f80f33          	mul	t5,a6,a5
    50d4:	02f307b3          	mul	a5,t1,a5
    50d8:	00af0533          	add	a0,t5,a0
    50dc:	00b785b3          	add	a1,a5,a1
    50e0:	02d557b3          	divu	a5,a0,a3
    50e4:	02d65633          	divu	a2,a2,a3
    50e8:	00f585b3          	add	a1,a1,a5
    50ec:	02d57533          	remu	a0,a0,a3

000050f0 <.L5>:
    50f0:	0ff57793          	zext.b	a5,a0
    50f4:	02aeec63          	bltu	t4,a0,512c <.L6>
    50f8:	03078793          	add	a5,a5,48

000050fc <.L19>:
    50fc:	0ff7f793          	zext.b	a5,a5
    5100:	fef88fa3          	sb	a5,-1(a7)
    5104:	00b667b3          	or	a5,a2,a1
    5108:	fff88513          	add	a0,a7,-1
    510c:	00079c63          	bnez	a5,5124 <.L12>
    5110:	000e0863          	beqz	t3,5120 <.L1>
    5114:	02d00793          	li	a5,45
    5118:	fef50fa3          	sb	a5,-1(a0)
    511c:	ffe88513          	add	a0,a7,-2

00005120 <.L1>:
    5120:	00008067          	ret

00005124 <.L12>:
    5124:	00050893          	mv	a7,a0
    5128:	f99ff06f          	j	50c0 <.L8>

0000512c <.L6>:
    512c:	00e787b3          	add	a5,a5,a4
    5130:	fcdff06f          	j	50fc <.L19>

00005134 <_fpmaxtostr>:
    5134:	e7010113          	add	sp,sp,-400
    5138:	00462783          	lw	a5,4(a2)
    513c:	18812423          	sw	s0,392(sp)
    5140:	00864403          	lbu	s0,8(a2)
    5144:	02f12c23          	sw	a5,56(sp)
    5148:	06500793          	li	a5,101
    514c:	18912223          	sw	s1,388(sp)
    5150:	19212023          	sw	s2,384(sp)
    5154:	17312e23          	sw	s3,380(sp)
    5158:	17412c23          	sw	s4,376(sp)
    515c:	17512a23          	sw	s5,372(sp)
    5160:	17612823          	sw	s6,368(sp)
    5164:	17912223          	sw	s9,356(sp)
    5168:	0af10c23          	sb	a5,184(sp)
    516c:	18112623          	sw	ra,396(sp)
    5170:	17712623          	sw	s7,364(sp)
    5174:	17812423          	sw	s8,360(sp)
    5178:	17a12023          	sw	s10,352(sp)
    517c:	15b12e23          	sw	s11,348(sp)
    5180:	04a12823          	sw	a0,80(sp)
    5184:	04d12a23          	sw	a3,84(sp)
    5188:	02046c93          	or	s9,s0,32
    518c:	06100793          	li	a5,97
    5190:	0005aa03          	lw	s4,0(a1)
    5194:	0045aa83          	lw	s5,4(a1)
    5198:	0085ab03          	lw	s6,8(a1)
    519c:	00c5a903          	lw	s2,12(a1)
    51a0:	00062483          	lw	s1,0(a2)
    51a4:	00060993          	mv	s3,a2
    51a8:	1cfc9e63          	bne	s9,a5,5384 <.L2>
    51ac:	07000793          	li	a5,112
    51b0:	0af10c23          	sb	a5,184(sp)
    51b4:	1e04c063          	bltz	s1,5394 <.L67>

000051b8 <.L4>:
    51b8:	02012a23          	sw	zero,52(sp)

000051bc <.L3>:
    51bc:	00c9a783          	lw	a5,12(s3) # 2000c <_ebss+0xa11c>
    51c0:	0a010823          	sb	zero,176(sp)
    51c4:	0027f713          	and	a4,a5,2
    51c8:	1c070e63          	beqz	a4,53a4 <.L5>
    51cc:	02b00793          	li	a5,43

000051d0 <.L118>:
    51d0:	0af10823          	sb	a5,176(sp)

000051d4 <.L6>:
    51d4:	0a010c13          	add	s8,sp,160
    51d8:	09010b93          	add	s7,sp,144
    51dc:	000b8593          	mv	a1,s7
    51e0:	000c0513          	mv	a0,s8
    51e4:	0a0108a3          	sb	zero,177(sp)
    51e8:	10012223          	sw	zero,260(sp)
    51ec:	0b412023          	sw	s4,160(sp)
    51f0:	0b512223          	sw	s5,164(sp)
    51f4:	0b612423          	sw	s6,168(sp)
    51f8:	0b212623          	sw	s2,172(sp)
    51fc:	09412823          	sw	s4,144(sp)
    5200:	09512a23          	sw	s5,148(sp)
    5204:	09612c23          	sw	s6,152(sp)
    5208:	09212e23          	sw	s2,156(sp)
    520c:	391060ef          	jal	bd9c <__eqtf2>
    5210:	1a050263          	beqz	a0,53b4 <.L113>
    5214:	00800793          	li	a5,8
    5218:	10f12223          	sw	a5,260(sp)

0000521c <.L9>:
    521c:	02000793          	li	a5,32
    5220:	00f9a823          	sw	a5,16(s3)
    5224:	07000793          	li	a5,112
    5228:	0ef12e23          	sw	a5,252(sp)
    522c:	00300793          	li	a5,3
    5230:	10f12023          	sw	a5,256(sp)
    5234:	06000793          	li	a5,96
    5238:	0087e863          	bltu	a5,s0,5248 <.L18>
    523c:	10412783          	lw	a5,260(sp)
    5240:	00478793          	add	a5,a5,4
    5244:	10f12223          	sw	a5,260(sp)

00005248 <.L18>:
    5248:	10412783          	lw	a5,260(sp)
    524c:	0000c717          	auipc	a4,0xc
    5250:	62470713          	add	a4,a4,1572 # 11870 <fmt>
    5254:	00040593          	mv	a1,s0
    5258:	00e787b3          	add	a5,a5,a4
    525c:	10f12223          	sw	a5,260(sp)
    5260:	10810913          	add	s2,sp,264

00005264 <.L19>:
    5264:	10010793          	add	a5,sp,256

00005268 <.L59>:
    5268:	0007a703          	lw	a4,0(a5)
    526c:	03812683          	lw	a3,56(sp)
    5270:	00c78793          	add	a5,a5,12
    5274:	40e68733          	sub	a4,a3,a4
    5278:	02e12c23          	sw	a4,56(sp)
    527c:	ff27e6e3          	bltu	a5,s2,5268 <.L59>
    5280:	0b014703          	lbu	a4,176(sp)
    5284:	0a000793          	li	a5,160
    5288:	0ef12823          	sw	a5,240(sp)
    528c:	00e03733          	snez	a4,a4
    5290:	0b010693          	add	a3,sp,176
    5294:	0205e793          	or	a5,a1,32
    5298:	0ee12a23          	sw	a4,244(sp)
    529c:	0ed12c23          	sw	a3,248(sp)
    52a0:	0ff7f793          	zext.b	a5,a5
    52a4:	06100613          	li	a2,97
    52a8:	02c79a63          	bne	a5,a2,52dc <.L60>
    52ac:	0fc12603          	lw	a2,252(sp)
    52b0:	00f00793          	li	a5,15
    52b4:	02c7d463          	bge	a5,a2,52dc <.L60>
    52b8:	00e687b3          	add	a5,a3,a4
    52bc:	03000693          	li	a3,48
    52c0:	00d78023          	sb	a3,0(a5)
    52c4:	0b814683          	lbu	a3,184(sp)
    52c8:	00270713          	add	a4,a4,2
    52cc:	00078123          	sb	zero,2(a5)
    52d0:	00868693          	add	a3,a3,8
    52d4:	00d780a3          	sb	a3,1(a5)
    52d8:	0ee12a23          	sw	a4,244(sp)

000052dc <.L60>:
    52dc:	03812783          	lw	a5,56(sp)
    52e0:	40e787b3          	sub	a5,a5,a4
    52e4:	02f05663          	blez	a5,5310 <.L63>
    52e8:	00c9a703          	lw	a4,12(s3)
    52ec:	00877713          	and	a4,a4,8
    52f0:	1e070ae3          	beqz	a4,5ce4 <.L62>
    52f4:	00f92223          	sw	a5,4(s2)
    52f8:	0a000713          	li	a4,160
    52fc:	0000c797          	auipc	a5,0xc
    5300:	57778793          	add	a5,a5,1399 # 11873 <fmt+0x3>
    5304:	00e92023          	sw	a4,0(s2)
    5308:	00f92423          	sw	a5,8(s2)
    530c:	00c90913          	add	s2,s2,12

00005310 <.L63>:
    5310:	0f010413          	add	s0,sp,240
    5314:	00000493          	li	s1,0

00005318 <.L66>:
    5318:	00442983          	lw	s3,4(s0)
    531c:	00842683          	lw	a3,8(s0)
    5320:	00042583          	lw	a1,0(s0)
    5324:	05012503          	lw	a0,80(sp)
    5328:	05412783          	lw	a5,84(sp)
    532c:	00098613          	mv	a2,s3
    5330:	000780e7          	jalr	a5
    5334:	1d351ee3          	bne	a0,s3,5d10 <.L82>
    5338:	00c40413          	add	s0,s0,12
    533c:	00a484b3          	add	s1,s1,a0
    5340:	fd246ce3          	bltu	s0,s2,5318 <.L66>

00005344 <.L1>:
    5344:	18c12083          	lw	ra,396(sp)
    5348:	18812403          	lw	s0,392(sp)
    534c:	18012903          	lw	s2,384(sp)
    5350:	17c12983          	lw	s3,380(sp)
    5354:	17812a03          	lw	s4,376(sp)
    5358:	17412a83          	lw	s5,372(sp)
    535c:	17012b03          	lw	s6,368(sp)
    5360:	16c12b83          	lw	s7,364(sp)
    5364:	16812c03          	lw	s8,360(sp)
    5368:	16412c83          	lw	s9,356(sp)
    536c:	16012d03          	lw	s10,352(sp)
    5370:	15c12d83          	lw	s11,348(sp)
    5374:	00048513          	mv	a0,s1
    5378:	18412483          	lw	s1,388(sp)
    537c:	19010113          	add	sp,sp,400
    5380:	00008067          	ret

00005384 <.L2>:
    5384:	e204dae3          	bgez	s1,51b8 <.L4>
    5388:	02012a23          	sw	zero,52(sp)
    538c:	00600493          	li	s1,6
    5390:	e2dff06f          	j	51bc <.L3>

00005394 <.L67>:
    5394:	00100793          	li	a5,1
    5398:	02f12a23          	sw	a5,52(sp)
    539c:	01d00493          	li	s1,29
    53a0:	e1dff06f          	j	51bc <.L3>

000053a4 <.L5>:
    53a4:	0017f793          	and	a5,a5,1
    53a8:	e20786e3          	beqz	a5,51d4 <.L6>
    53ac:	02000793          	li	a5,32
    53b0:	e21ff06f          	j	51d0 <.L118>

000053b4 <.L113>:
    53b4:	000b8593          	mv	a1,s7
    53b8:	000c0513          	mv	a0,s8
    53bc:	0b412023          	sw	s4,160(sp)
    53c0:	0b512223          	sw	s5,164(sp)
    53c4:	0b612423          	sw	s6,168(sp)
    53c8:	0b212623          	sw	s2,172(sp)
    53cc:	08012823          	sw	zero,144(sp)
    53d0:	08012a23          	sw	zero,148(sp)
    53d4:	08012c23          	sw	zero,152(sp)
    53d8:	08012e23          	sw	zero,156(sp)
    53dc:	1c1060ef          	jal	bd9c <__eqtf2>
    53e0:	24051e63          	bnez	a0,563c <.L114>
    53e4:	000c0513          	mv	a0,s8
    53e8:	005090ef          	jal	ebec <__trunctfdf2>
    53ec:	00b50663          	beq	a0,a1,53f8 <.L12>
    53f0:	02d00793          	li	a5,45
    53f4:	0af10823          	sb	a5,176(sp)

000053f8 <.L12>:
    53f8:	02400793          	li	a5,36
    53fc:	02f12623          	sw	a5,44(sp)
    5400:	00900793          	li	a5,9
    5404:	0000d617          	auipc	a2,0xd
    5408:	bfc60613          	add	a2,a2,-1028 # 12000 <.LC2>
    540c:	02f12423          	sw	a5,40(sp)
    5410:	00a00793          	li	a5,10
    5414:	00f12623          	sw	a5,12(sp)
    5418:	00062783          	lw	a5,0(a2)
    541c:	000a0c93          	mv	s9,s4
    5420:	000a8d13          	mv	s10,s5
    5424:	00f12c23          	sw	a5,24(sp)
    5428:	00462783          	lw	a5,4(a2)
    542c:	000b0d93          	mv	s11,s6
    5430:	00090b93          	mv	s7,s2
    5434:	00f12e23          	sw	a5,28(sp)
    5438:	00862783          	lw	a5,8(a2)
    543c:	fff00c13          	li	s8,-1
    5440:	02f12023          	sw	a5,32(sp)
    5444:	00c62783          	lw	a5,12(a2)
    5448:	02f12223          	sw	a5,36(sp)

0000544c <.L13>:
    544c:	0a010793          	add	a5,sp,160
    5450:	00f12823          	sw	a5,16(sp)
    5454:	09010793          	add	a5,sp,144
    5458:	00f12a23          	sw	a5,20(sp)
    545c:	08010793          	add	a5,sp,128
    5460:	00400913          	li	s2,4
    5464:	0ca10a13          	add	s4,sp,202
    5468:	02f12823          	sw	a5,48(sp)
    546c:	07010b13          	add	s6,sp,112

00005470 <.L29>:
    5470:	01012503          	lw	a0,16(sp)
    5474:	0b912023          	sw	s9,160(sp)
    5478:	0ba12223          	sw	s10,164(sp)
    547c:	0bb12423          	sw	s11,168(sp)
    5480:	0b712623          	sw	s7,172(sp)
    5484:	0dc090ef          	jal	e560 <__fixunstfsi>
    5488:	00050593          	mv	a1,a0
    548c:	00050a93          	mv	s5,a0
    5490:	01012503          	lw	a0,16(sp)
    5494:	1c4090ef          	jal	e658 <__floatunsitf>
    5498:	0a012703          	lw	a4,160(sp)
    549c:	03012583          	lw	a1,48(sp)
    54a0:	01412503          	lw	a0,20(sp)
    54a4:	06e12823          	sw	a4,112(sp)
    54a8:	0a412703          	lw	a4,164(sp)
    54ac:	000b0613          	mv	a2,s6
    54b0:	09912023          	sw	s9,128(sp)
    54b4:	06e12a23          	sw	a4,116(sp)
    54b8:	0a812703          	lw	a4,168(sp)
    54bc:	09a12223          	sw	s10,132(sp)
    54c0:	09b12423          	sw	s11,136(sp)
    54c4:	06e12c23          	sw	a4,120(sp)
    54c8:	0ac12703          	lw	a4,172(sp)
    54cc:	09712623          	sw	s7,140(sp)
    54d0:	06e12e23          	sw	a4,124(sp)
    54d4:	3f9070ef          	jal	d0cc <__subtf3>
    54d8:	01812783          	lw	a5,24(sp)
    54dc:	03012603          	lw	a2,48(sp)
    54e0:	01012503          	lw	a0,16(sp)
    54e4:	08f12023          	sw	a5,128(sp)
    54e8:	01c12783          	lw	a5,28(sp)
    54ec:	01412583          	lw	a1,20(sp)
    54f0:	08f12223          	sw	a5,132(sp)
    54f4:	02012783          	lw	a5,32(sp)
    54f8:	08f12423          	sw	a5,136(sp)
    54fc:	02412783          	lw	a5,36(sp)
    5500:	08f12623          	sw	a5,140(sp)
    5504:	3c5060ef          	jal	c0c8 <__multf3>
    5508:	02812783          	lw	a5,40(sp)
    550c:	0a012c83          	lw	s9,160(sp)
    5510:	0a412d03          	lw	s10,164(sp)
    5514:	0a812d83          	lw	s11,168(sp)
    5518:	0ac12b83          	lw	s7,172(sp)
    551c:	00fa0a33          	add	s4,s4,a5
    5520:	000a0613          	mv	a2,s4
    5524:	40fa0533          	sub	a0,s4,a5

00005528 <.L28>:
    5528:	00c12783          	lw	a5,12(sp)
    552c:	fff60613          	add	a2,a2,-1
    5530:	02faf5b3          	remu	a1,s5,a5
    5534:	03058593          	add	a1,a1,48
    5538:	00b60023          	sb	a1,0(a2)
    553c:	02fadab3          	divu	s5,s5,a5
    5540:	fec514e3          	bne	a0,a2,5528 <.L28>
    5544:	fff90913          	add	s2,s2,-1
    5548:	f20914e3          	bnez	s2,5470 <.L29>
    554c:	06000713          	li	a4,96
    5550:	00876c63          	bltu	a4,s0,5568 <.L30>
    5554:	0b814703          	lbu	a4,184(sp)
    5558:	02040413          	add	s0,s0,32
    555c:	0ff47413          	zext.b	s0,s0
    5560:	fe070713          	add	a4,a4,-32
    5564:	0ae10c23          	sb	a4,184(sp)

00005568 <.L30>:
    5568:	06700713          	li	a4,103
    556c:	50e41663          	bne	s0,a4,5a78 <.L31>
    5570:	00000693          	li	a3,0
    5574:	00048663          	beqz	s1,5580 <.L32>
    5578:	fff48493          	add	s1,s1,-1
    557c:	00048693          	mv	a3,s1

00005580 <.L32>:
    5580:	02c12783          	lw	a5,44(sp)
    5584:	00003737          	lui	a4,0x3
    5588:	0ce11423          	sh	a4,200(sp)
    558c:	0c910513          	add	a0,sp,201
    5590:	50f6ce63          	blt	a3,a5,5aac <.L33>
    5594:	00178613          	add	a2,a5,1
    5598:	00c50633          	add	a2,a0,a2
    559c:	00000593          	li	a1,0

000055a0 <.L34>:
    55a0:	00c12783          	lw	a5,12(sp)
    55a4:	03000813          	li	a6,48
    55a8:	02f78b93          	add	s7,a5,47

000055ac <.L35>:
    55ac:	fff64703          	lbu	a4,-1(a2)
    55b0:	fff60613          	add	a2,a2,-1
    55b4:	00b70733          	add	a4,a4,a1
    55b8:	0ff77713          	zext.b	a4,a4
    55bc:	00e60023          	sb	a4,0(a2)
    55c0:	ff0706e3          	beq	a4,a6,55ac <.L35>
    55c4:	feebe4e3          	bltu	s7,a4,55ac <.L35>
    55c8:	02046713          	or	a4,s0,32
    55cc:	06100593          	li	a1,97
    55d0:	52b71063          	bne	a4,a1,5af0 <.L37>
    55d4:	0b814583          	lbu	a1,184(sp)
    55d8:	00060813          	mv	a6,a2
    55dc:	03900893          	li	a7,57
    55e0:	fb758593          	add	a1,a1,-73
    55e4:	0ff5f593          	zext.b	a1,a1

000055e8 <.L38>:
    55e8:	00084703          	lbu	a4,0(a6)
    55ec:	4e071263          	bnez	a4,5ad0 <.L40>
    55f0:	4ec56a63          	bltu	a0,a2,5ae4 <.L41>

000055f4 <.L43>:
    55f4:	001c0c13          	add	s8,s8,1 # 2001 <.L53+0x1>
    55f8:	00050613          	mv	a2,a0
    55fc:	00050713          	mv	a4,a0

00005600 <.L42>:
    5600:	000600a3          	sb	zero,1(a2)
    5604:	06700593          	li	a1,103
    5608:	4eb41863          	bne	s0,a1,5af8 <.L44>
    560c:	ffc00593          	li	a1,-4
    5610:	4ebc4c63          	blt	s8,a1,5b08 <.L73>
    5614:	4f86ca63          	blt	a3,s8,5b08 <.L73>
    5618:	418684b3          	sub	s1,a3,s8

0000561c <.L46>:
    561c:	000c0693          	mv	a3,s8
    5620:	000c5a63          	bgez	s8,5634 <.L123>
    5624:	03000693          	li	a3,48
    5628:	fed70fa3          	sb	a3,-1(a4) # 2fff <.L3+0x1f>
    562c:	000c0693          	mv	a3,s8
    5630:	fff70713          	add	a4,a4,-1

00005634 <.L123>:
    5634:	06600593          	li	a1,102
    5638:	4d80006f          	j	5b10 <.L45>

0000563c <.L114>:
    563c:	000b8593          	mv	a1,s7
    5640:	000c0513          	mv	a0,s8
    5644:	0b412023          	sw	s4,160(sp)
    5648:	0b512223          	sw	s5,164(sp)
    564c:	0b612423          	sw	s6,168(sp)
    5650:	0b212623          	sw	s2,172(sp)
    5654:	08012823          	sw	zero,144(sp)
    5658:	08012a23          	sw	zero,148(sp)
    565c:	08012c23          	sw	zero,152(sp)
    5660:	08012e23          	sw	zero,156(sp)
    5664:	135060ef          	jal	bf98 <__letf2>
    5668:	00055a63          	bgez	a0,567c <.L14>
    566c:	02d00793          	li	a5,45
    5670:	0af10823          	sb	a5,176(sp)
    5674:	800007b7          	lui	a5,0x80000
    5678:	0127c933          	xor	s2,a5,s2

0000567c <.L14>:
    567c:	0000d797          	auipc	a5,0xd
    5680:	9a478793          	add	a5,a5,-1628 # 12020 <.LC4>
    5684:	0007a603          	lw	a2,0(a5)
    5688:	0047a683          	lw	a3,4(a5)
    568c:	0087a703          	lw	a4,8(a5)
    5690:	00c7a783          	lw	a5,12(a5)
    5694:	08010d13          	add	s10,sp,128
    5698:	08c12023          	sw	a2,128(sp)
    569c:	000b8593          	mv	a1,s7
    56a0:	000c0513          	mv	a0,s8
    56a4:	000d0613          	mv	a2,s10
    56a8:	08f12623          	sw	a5,140(sp)
    56ac:	09412823          	sw	s4,144(sp)
    56b0:	09512a23          	sw	s5,148(sp)
    56b4:	09612c23          	sw	s6,152(sp)
    56b8:	09212e23          	sw	s2,156(sp)
    56bc:	08d12223          	sw	a3,132(sp)
    56c0:	08e12423          	sw	a4,136(sp)
    56c4:	205060ef          	jal	c0c8 <__multf3>
    56c8:	0a012783          	lw	a5,160(sp)
    56cc:	000d0593          	mv	a1,s10
    56d0:	000b8513          	mv	a0,s7
    56d4:	08f12823          	sw	a5,144(sp)
    56d8:	0a412783          	lw	a5,164(sp)
    56dc:	09412023          	sw	s4,128(sp)
    56e0:	09512223          	sw	s5,132(sp)
    56e4:	08f12a23          	sw	a5,148(sp)
    56e8:	0a812783          	lw	a5,168(sp)
    56ec:	09612423          	sw	s6,136(sp)
    56f0:	09212623          	sw	s2,140(sp)
    56f4:	08f12c23          	sw	a5,152(sp)
    56f8:	0ac12783          	lw	a5,172(sp)
    56fc:	08f12e23          	sw	a5,156(sp)
    5700:	69c060ef          	jal	bd9c <__eqtf2>
    5704:	b0050ce3          	beqz	a0,521c <.L9>
    5708:	06100793          	li	a5,97
    570c:	2afc9063          	bne	s9,a5,59ac <.L68>
    5710:	01d00793          	li	a5,29
    5714:	02f12623          	sw	a5,44(sp)
    5718:	00800793          	li	a5,8
    571c:	0000d717          	auipc	a4,0xd
    5720:	8c470713          	add	a4,a4,-1852 # 11fe0 <.LC0>
    5724:	02f12423          	sw	a5,40(sp)
    5728:	01000793          	li	a5,16
    572c:	00f12623          	sw	a5,12(sp)
    5730:	00072783          	lw	a5,0(a4)
    5734:	00700c13          	li	s8,7
    5738:	0000c317          	auipc	t1,0xc
    573c:	f9830313          	add	t1,t1,-104 # 116d0 <exp16_table>
    5740:	00f12c23          	sw	a5,24(sp)
    5744:	00472783          	lw	a5,4(a4)
    5748:	00f12e23          	sw	a5,28(sp)
    574c:	00872783          	lw	a5,8(a4)
    5750:	02f12023          	sw	a5,32(sp)
    5754:	00c72783          	lw	a5,12(a4)
    5758:	0000d717          	auipc	a4,0xd
    575c:	89870713          	add	a4,a4,-1896 # 11ff0 <.LC1>
    5760:	02f12223          	sw	a5,36(sp)

00005764 <.L119>:
    5764:	00072783          	lw	a5,0(a4)
    5768:	0c030e13          	add	t3,t1,192
    576c:	000a0c93          	mv	s9,s4
    5770:	02f12e23          	sw	a5,60(sp)
    5774:	00472783          	lw	a5,4(a4)
    5778:	000a8d13          	mv	s10,s5
    577c:	000b0d93          	mv	s11,s6
    5780:	04f12023          	sw	a5,64(sp)
    5784:	00872783          	lw	a5,8(a4)
    5788:	00090b93          	mv	s7,s2
    578c:	04f12223          	sw	a5,68(sp)
    5790:	00c72783          	lw	a5,12(a4)
    5794:	04f12423          	sw	a5,72(sp)
    5798:	000017b7          	lui	a5,0x1
    579c:	02f12823          	sw	a5,48(sp)
    57a0:	0a010793          	add	a5,sp,160
    57a4:	00f12823          	sw	a5,16(sp)
    57a8:	09010793          	add	a5,sp,144
    57ac:	00f12a23          	sw	a5,20(sp)
    57b0:	08010793          	add	a5,sp,128
    57b4:	04f12623          	sw	a5,76(sp)

000057b8 <.L26>:
    57b8:	03c12783          	lw	a5,60(sp)
    57bc:	000e2f83          	lw	t6,0(t3)
    57c0:	004e2f03          	lw	t5,4(t3)
    57c4:	008e2e83          	lw	t4,8(t3)
    57c8:	00ce2603          	lw	a2,12(t3)
    57cc:	08f12823          	sw	a5,144(sp)
    57d0:	04012783          	lw	a5,64(sp)
    57d4:	01412583          	lw	a1,20(sp)
    57d8:	01012503          	lw	a0,16(sp)
    57dc:	08f12a23          	sw	a5,148(sp)
    57e0:	04412783          	lw	a5,68(sp)
    57e4:	06612623          	sw	t1,108(sp)
    57e8:	07f12423          	sw	t6,104(sp)
    57ec:	08f12c23          	sw	a5,152(sp)
    57f0:	04812783          	lw	a5,72(sp)
    57f4:	07e12223          	sw	t5,100(sp)
    57f8:	07d12023          	sw	t4,96(sp)
    57fc:	05c12e23          	sw	t3,92(sp)
    5800:	04c12c23          	sw	a2,88(sp)
    5804:	0b412023          	sw	s4,160(sp)
    5808:	0b512223          	sw	s5,164(sp)
    580c:	0b612423          	sw	s6,168(sp)
    5810:	0b212623          	sw	s2,172(sp)
    5814:	08f12e23          	sw	a5,156(sp)
    5818:	780060ef          	jal	bf98 <__letf2>
    581c:	05812603          	lw	a2,88(sp)
    5820:	06812f83          	lw	t6,104(sp)
    5824:	06c12303          	lw	t1,108(sp)
    5828:	05c12e03          	lw	t3,92(sp)
    582c:	06012e83          	lw	t4,96(sp)
    5830:	06412f03          	lw	t5,100(sp)
    5834:	08c12623          	sw	a2,140(sp)
    5838:	07c12623          	sw	t3,108(sp)
    583c:	06612423          	sw	t1,104(sp)
    5840:	09912823          	sw	s9,144(sp)
    5844:	09a12a23          	sw	s10,148(sp)
    5848:	09b12c23          	sw	s11,152(sp)
    584c:	09712e23          	sw	s7,156(sp)
    5850:	09f12023          	sw	t6,128(sp)
    5854:	09e12223          	sw	t5,132(sp)
    5858:	09d12423          	sw	t4,136(sp)
    585c:	04c12603          	lw	a2,76(sp)
    5860:	01412583          	lw	a1,20(sp)
    5864:	1a055463          	bgez	a0,5a0c <.L116>
    5868:	01012503          	lw	a0,16(sp)
    586c:	05d060ef          	jal	c0c8 <__multf3>
    5870:	01812783          	lw	a5,24(sp)
    5874:	0a012f83          	lw	t6,160(sp)
    5878:	0a412f03          	lw	t5,164(sp)
    587c:	08f12823          	sw	a5,144(sp)
    5880:	01c12783          	lw	a5,28(sp)
    5884:	0a812e83          	lw	t4,168(sp)
    5888:	0ac12603          	lw	a2,172(sp)
    588c:	08f12a23          	sw	a5,148(sp)
    5890:	02012783          	lw	a5,32(sp)
    5894:	01412583          	lw	a1,20(sp)
    5898:	01012503          	lw	a0,16(sp)
    589c:	08f12c23          	sw	a5,152(sp)
    58a0:	02412783          	lw	a5,36(sp)
    58a4:	07f12223          	sw	t6,100(sp)
    58a8:	07e12023          	sw	t5,96(sp)
    58ac:	05d12e23          	sw	t4,92(sp)
    58b0:	04c12c23          	sw	a2,88(sp)
    58b4:	08f12e23          	sw	a5,156(sp)
    58b8:	6e0060ef          	jal	bf98 <__letf2>
    58bc:	06812303          	lw	t1,104(sp)
    58c0:	06c12e03          	lw	t3,108(sp)
    58c4:	02055663          	bgez	a0,58f0 <.L23>
    58c8:	03012783          	lw	a5,48(sp)
    58cc:	40fc0c33          	sub	s8,s8,a5

000058d0 <.L120>:
    58d0:	06412f83          	lw	t6,100(sp)
    58d4:	06012f03          	lw	t5,96(sp)
    58d8:	05c12e83          	lw	t4,92(sp)
    58dc:	05812603          	lw	a2,88(sp)
    58e0:	000f8c93          	mv	s9,t6
    58e4:	000f0d13          	mv	s10,t5
    58e8:	000e8d93          	mv	s11,t4
    58ec:	00060b93          	mv	s7,a2

000058f0 <.L23>:
    58f0:	03012783          	lw	a5,48(sp)
    58f4:	ff0e0613          	add	a2,t3,-16
    58f8:	4017d793          	sra	a5,a5,0x1
    58fc:	02f12823          	sw	a5,48(sp)
    5900:	11c31263          	bne	t1,t3,5a04 <.L69>
    5904:	01812783          	lw	a5,24(sp)
    5908:	0a010913          	add	s2,sp,160
    590c:	09010593          	add	a1,sp,144
    5910:	08f12823          	sw	a5,144(sp)
    5914:	01c12783          	lw	a5,28(sp)
    5918:	00090513          	mv	a0,s2
    591c:	00612a23          	sw	t1,20(sp)
    5920:	08f12a23          	sw	a5,148(sp)
    5924:	02012783          	lw	a5,32(sp)
    5928:	0b912023          	sw	s9,160(sp)
    592c:	0ba12223          	sw	s10,164(sp)
    5930:	08f12c23          	sw	a5,152(sp)
    5934:	02412783          	lw	a5,36(sp)
    5938:	0bb12423          	sw	s11,168(sp)
    593c:	0b712623          	sw	s7,172(sp)
    5940:	08f12e23          	sw	a5,156(sp)
    5944:	00b12823          	sw	a1,16(sp)
    5948:	520060ef          	jal	be68 <__getf2>
    594c:	b00540e3          	bltz	a0,544c <.L13>
    5950:	01412303          	lw	t1,20(sp)
    5954:	09912823          	sw	s9,144(sp)
    5958:	09a12a23          	sw	s10,148(sp)
    595c:	09b12c23          	sw	s11,152(sp)
    5960:	09712e23          	sw	s7,156(sp)
    5964:	00032703          	lw	a4,0(t1)
    5968:	01012583          	lw	a1,16(sp)
    596c:	08010613          	add	a2,sp,128
    5970:	08e12023          	sw	a4,128(sp)
    5974:	00432703          	lw	a4,4(t1)
    5978:	00090513          	mv	a0,s2
    597c:	001c0c13          	add	s8,s8,1
    5980:	08e12223          	sw	a4,132(sp)
    5984:	00832703          	lw	a4,8(t1)
    5988:	08e12423          	sw	a4,136(sp)
    598c:	00c32703          	lw	a4,12(t1)
    5990:	08e12623          	sw	a4,140(sp)
    5994:	674050ef          	jal	b008 <__divtf3>
    5998:	0a012c83          	lw	s9,160(sp)
    599c:	0a412d03          	lw	s10,164(sp)
    59a0:	0a812d83          	lw	s11,168(sp)
    59a4:	0ac12b83          	lw	s7,172(sp)
    59a8:	aa5ff06f          	j	544c <.L13>

000059ac <.L68>:
    59ac:	02400793          	li	a5,36
    59b0:	02f12623          	sw	a5,44(sp)
    59b4:	00900793          	li	a5,9
    59b8:	0000c717          	auipc	a4,0xc
    59bc:	64870713          	add	a4,a4,1608 # 12000 <.LC2>
    59c0:	02f12423          	sw	a5,40(sp)
    59c4:	00a00793          	li	a5,10
    59c8:	00f12623          	sw	a5,12(sp)
    59cc:	00072783          	lw	a5,0(a4)
    59d0:	00800c13          	li	s8,8
    59d4:	0000c317          	auipc	t1,0xc
    59d8:	dcc30313          	add	t1,t1,-564 # 117a0 <exp10_table>
    59dc:	00f12c23          	sw	a5,24(sp)
    59e0:	00472783          	lw	a5,4(a4)
    59e4:	00f12e23          	sw	a5,28(sp)
    59e8:	00872783          	lw	a5,8(a4)
    59ec:	02f12023          	sw	a5,32(sp)
    59f0:	00c72783          	lw	a5,12(a4)
    59f4:	0000c717          	auipc	a4,0xc
    59f8:	61c70713          	add	a4,a4,1564 # 12010 <.LC3>
    59fc:	02f12223          	sw	a5,36(sp)
    5a00:	d65ff06f          	j	5764 <.L119>

00005a04 <.L69>:
    5a04:	00060e13          	mv	t3,a2
    5a08:	db1ff06f          	j	57b8 <.L26>

00005a0c <.L116>:
    5a0c:	01012503          	lw	a0,16(sp)
    5a10:	5f8050ef          	jal	b008 <__divtf3>
    5a14:	03c12783          	lw	a5,60(sp)
    5a18:	0a012f83          	lw	t6,160(sp)
    5a1c:	0a412f03          	lw	t5,164(sp)
    5a20:	08f12823          	sw	a5,144(sp)
    5a24:	04012783          	lw	a5,64(sp)
    5a28:	0a812e83          	lw	t4,168(sp)
    5a2c:	0ac12603          	lw	a2,172(sp)
    5a30:	08f12a23          	sw	a5,148(sp)
    5a34:	04412783          	lw	a5,68(sp)
    5a38:	01412583          	lw	a1,20(sp)
    5a3c:	01012503          	lw	a0,16(sp)
    5a40:	08f12c23          	sw	a5,152(sp)
    5a44:	04812783          	lw	a5,72(sp)
    5a48:	07f12223          	sw	t6,100(sp)
    5a4c:	07e12023          	sw	t5,96(sp)
    5a50:	05d12e23          	sw	t4,92(sp)
    5a54:	04c12c23          	sw	a2,88(sp)
    5a58:	08f12e23          	sw	a5,156(sp)
    5a5c:	40c060ef          	jal	be68 <__getf2>
    5a60:	06812303          	lw	t1,104(sp)
    5a64:	06c12e03          	lw	t3,108(sp)
    5a68:	e80544e3          	bltz	a0,58f0 <.L23>
    5a6c:	03012783          	lw	a5,48(sp)
    5a70:	00fc0c33          	add	s8,s8,a5
    5a74:	e5dff06f          	j	58d0 <.L120>

00005a78 <.L31>:
    5a78:	06600713          	li	a4,102
    5a7c:	00048693          	mv	a3,s1
    5a80:	b0e410e3          	bne	s0,a4,5580 <.L32>
    5a84:	009c06b3          	add	a3,s8,s1
    5a88:	fff00713          	li	a4,-1
    5a8c:	aee6dae3          	bge	a3,a4,5580 <.L32>
    5a90:	02400613          	li	a2,36
    5a94:	03000593          	li	a1,48
    5a98:	0c810513          	add	a0,sp,200
    5a9c:	afcfd0ef          	jal	2d98 <__GI_memset>
    5aa0:	fff00c13          	li	s8,-1
    5aa4:	fff00693          	li	a3,-1
    5aa8:	ad9ff06f          	j	5580 <.L32>

00005aac <.L33>:
    5aac:	00c12783          	lw	a5,12(sp)
    5ab0:	00268613          	add	a2,a3,2
    5ab4:	00c50633          	add	a2,a0,a2
    5ab8:	00064583          	lbu	a1,0(a2)
    5abc:	0017d713          	srl	a4,a5,0x1
    5ac0:	03070713          	add	a4,a4,48
    5ac4:	00e5b5b3          	sltu	a1,a1,a4
    5ac8:	0015b593          	seqz	a1,a1
    5acc:	ad5ff06f          	j	55a0 <.L34>

00005ad0 <.L40>:
    5ad0:	00e8f663          	bgeu	a7,a4,5adc <.L39>
    5ad4:	00b70733          	add	a4,a4,a1
    5ad8:	00e80023          	sb	a4,0(a6)

00005adc <.L39>:
    5adc:	fff80813          	add	a6,a6,-1
    5ae0:	b09ff06f          	j	55e8 <.L38>

00005ae4 <.L41>:
    5ae4:	002c1c13          	sll	s8,s8,0x2

00005ae8 <.L121>:
    5ae8:	0ca10713          	add	a4,sp,202
    5aec:	b15ff06f          	j	5600 <.L42>

00005af0 <.L37>:
    5af0:	b0c572e3          	bgeu	a0,a2,55f4 <.L43>
    5af4:	ff5ff06f          	j	5ae8 <.L121>

00005af8 <.L44>:
    5af8:	06600693          	li	a3,102
    5afc:	b2d400e3          	beq	s0,a3,561c <.L46>
    5b00:	00040593          	mv	a1,s0
    5b04:	0080006f          	j	5b0c <.L122>

00005b08 <.L73>:
    5b08:	06700593          	li	a1,103

00005b0c <.L122>:
    5b0c:	00000693          	li	a3,0

00005b10 <.L45>:
    5b10:	00074883          	lbu	a7,0(a4)
    5b14:	00100513          	li	a0,1
    5b18:	0b000813          	li	a6,176
    5b1c:	10a12023          	sw	a0,256(sp)
    5b20:	0b410513          	add	a0,sp,180
    5b24:	10a12223          	sw	a0,260(sp)
    5b28:	0f012e23          	sw	a6,252(sp)
    5b2c:	0b110a23          	sb	a7,180(sp)
    5b30:	0a010aa3          	sb	zero,181(sp)
    5b34:	00170513          	add	a0,a4,1
    5b38:	10810913          	add	s2,sp,264
    5b3c:	40e60733          	sub	a4,a2,a4
    5b40:	0406c063          	bltz	a3,5b80 <.L47>
    5b44:	07000613          	li	a2,112
    5b48:	10c12423          	sw	a2,264(sp)
    5b4c:	10a12823          	sw	a0,272(sp)
    5b50:	16e6c863          	blt	a3,a4,5cc0 <.L48>
    5b54:	10e12623          	sw	a4,268(sp)
    5b58:	40e68733          	sub	a4,a3,a4
    5b5c:	16070a63          	beqz	a4,5cd0 <.L77>
    5b60:	10e12c23          	sw	a4,280(sp)
    5b64:	0000c717          	auipc	a4,0xc
    5b68:	d0f70713          	add	a4,a4,-753 # 11873 <fmt+0x3>
    5b6c:	10e12e23          	sw	a4,284(sp)
    5b70:	11012a23          	sw	a6,276(sp)
    5b74:	00000713          	li	a4,0
    5b78:	12010913          	add	s2,sp,288

00005b7c <.L78>:
    5b7c:	fff00693          	li	a3,-1

00005b80 <.L47>:
    5b80:	00c9a603          	lw	a2,12(s3)
    5b84:	01067613          	and	a2,a2,16
    5b88:	00c76833          	or	a6,a4,a2
    5b8c:	00081c63          	bnez	a6,5ba4 <.L49>
    5b90:	06700813          	li	a6,103
    5b94:	03040863          	beq	s0,a6,5bc4 <.L50>
    5b98:	06100813          	li	a6,97
    5b9c:	03040463          	beq	s0,a6,5bc4 <.L50>
    5ba0:	02048263          	beqz	s1,5bc4 <.L50>

00005ba4 <.L49>:
    5ba4:	07000813          	li	a6,112
    5ba8:	01092023          	sw	a6,0(s2)
    5bac:	00100813          	li	a6,1
    5bb0:	01092223          	sw	a6,4(s2)
    5bb4:	0000c817          	auipc	a6,0xc
    5bb8:	ccc80813          	add	a6,a6,-820 # 11880 <fmt+0x10>
    5bbc:	01092423          	sw	a6,8(s2)
    5bc0:	00c90913          	add	s2,s2,12

00005bc4 <.L50>:
    5bc4:	00168813          	add	a6,a3,1
    5bc8:	02080263          	beqz	a6,5bec <.L51>
    5bcc:	fff6c693          	not	a3,a3
    5bd0:	00d92223          	sw	a3,4(s2)
    5bd4:	0b000893          	li	a7,176
    5bd8:	0000c697          	auipc	a3,0xc
    5bdc:	c9b68693          	add	a3,a3,-869 # 11873 <fmt+0x3>
    5be0:	01192023          	sw	a7,0(s2)
    5be4:	00d92423          	sw	a3,8(s2)
    5be8:	00c90913          	add	s2,s2,12

00005bec <.L51>:
    5bec:	00070c63          	beqz	a4,5c04 <.L52>
    5bf0:	07000693          	li	a3,112
    5bf4:	00d92023          	sw	a3,0(s2)
    5bf8:	00e92223          	sw	a4,4(s2)
    5bfc:	00a92423          	sw	a0,8(s2)
    5c00:	00c90913          	add	s2,s2,12

00005c04 <.L52>:
    5c04:	06700693          	li	a3,103
    5c08:	00d41463          	bne	s0,a3,5c10 <.L53>
    5c0c:	02060a63          	beqz	a2,5c40 <.L54>

00005c10 <.L53>:
    5c10:	03412783          	lw	a5,52(sp)
    5c14:	02079663          	bnez	a5,5c40 <.L54>
    5c18:	41070733          	sub	a4,a4,a6
    5c1c:	02975263          	bge	a4,s1,5c40 <.L54>
    5c20:	40e484b3          	sub	s1,s1,a4
    5c24:	0b000693          	li	a3,176
    5c28:	0000c717          	auipc	a4,0xc
    5c2c:	c4b70713          	add	a4,a4,-949 # 11873 <fmt+0x3>
    5c30:	00d92023          	sw	a3,0(s2)
    5c34:	00992223          	sw	s1,4(s2)
    5c38:	00e92423          	sw	a4,8(s2)
    5c3c:	00c90913          	add	s2,s2,12

00005c40 <.L54>:
    5c40:	06600713          	li	a4,102
    5c44:	e2e58063          	beq	a1,a4,5264 <.L19>
    5c48:	06100713          	li	a4,97
    5c4c:	0b814e03          	lbu	t3,184(sp)
    5c50:	00300893          	li	a7,3
    5c54:	00e40463          	beq	s0,a4,5c5c <.L55>
    5c58:	00400893          	li	a7,4

00005c5c <.L55>:
    5c5c:	02b00813          	li	a6,43
    5c60:	000c5663          	bgez	s8,5c6c <.L56>
    5c64:	41800c33          	neg	s8,s8
    5c68:	02d00813          	li	a6,45

00005c6c <.L56>:
    5c6c:	0c0103a3          	sb	zero,199(sp)
    5c70:	00200693          	li	a3,2
    5c74:	0c710713          	add	a4,sp,199
    5c78:	00a00313          	li	t1,10

00005c7c <.L57>:
    5c7c:	026c6533          	rem	a0,s8,t1
    5c80:	00168693          	add	a3,a3,1
    5c84:	fff70613          	add	a2,a4,-1
    5c88:	03050513          	add	a0,a0,48
    5c8c:	fea70fa3          	sb	a0,-1(a4)
    5c90:	026c4c33          	div	s8,s8,t1
    5c94:	0516c263          	blt	a3,a7,5cd8 <.L81>
    5c98:	040c1263          	bnez	s8,5cdc <.L58>
    5c9c:	07000793          	li	a5,112
    5ca0:	ffd70713          	add	a4,a4,-3
    5ca4:	00f92023          	sw	a5,0(s2)
    5ca8:	00d92223          	sw	a3,4(s2)
    5cac:	00e92423          	sw	a4,8(s2)
    5cb0:	ff060fa3          	sb	a6,-1(a2)
    5cb4:	ffc60f23          	sb	t3,-2(a2)
    5cb8:	00c90913          	add	s2,s2,12
    5cbc:	da8ff06f          	j	5264 <.L19>

00005cc0 <.L48>:
    5cc0:	ea068ee3          	beqz	a3,5b7c <.L78>
    5cc4:	10d12623          	sw	a3,268(sp)
    5cc8:	00d50533          	add	a0,a0,a3
    5ccc:	40d70733          	sub	a4,a4,a3

00005cd0 <.L77>:
    5cd0:	11410913          	add	s2,sp,276
    5cd4:	ea9ff06f          	j	5b7c <.L78>

00005cd8 <.L81>:
    5cd8:	00300693          	li	a3,3

00005cdc <.L58>:
    5cdc:	00060713          	mv	a4,a2
    5ce0:	f9dff06f          	j	5c7c <.L57>

00005ce4 <.L62>:
    5ce4:	0109a603          	lw	a2,16(s3)
    5ce8:	03000693          	li	a3,48
    5cec:	0f412703          	lw	a4,244(sp)
    5cf0:	00d61a63          	bne	a2,a3,5d04 <.L64>
    5cf4:	10012703          	lw	a4,256(sp)
    5cf8:	00f707b3          	add	a5,a4,a5
    5cfc:	10f12023          	sw	a5,256(sp)
    5d00:	e10ff06f          	j	5310 <.L63>

00005d04 <.L64>:
    5d04:	00e787b3          	add	a5,a5,a4
    5d08:	0ef12a23          	sw	a5,244(sp)
    5d0c:	e04ff06f          	j	5310 <.L63>

00005d10 <.L82>:
    5d10:	fff00493          	li	s1,-1
    5d14:	e30ff06f          	j	5344 <.L1>

00005d18 <__GI_fflush>:
    5d18:	ff010113          	add	sp,sp,-16
    5d1c:	00112623          	sw	ra,12(sp)
    5d20:	00812423          	sw	s0,8(sp)
    5d24:	00912223          	sw	s1,4(sp)
    5d28:	01212023          	sw	s2,0(sp)
    5d2c:	0000a797          	auipc	a5,0xa
    5d30:	5787a783          	lw	a5,1400(a5) # 102a4 <_GLOBAL_OFFSET_TABLE_+0x1c>
    5d34:	04f50263          	beq	a0,a5,5d78 <.L11>
    5d38:	00050413          	mv	s0,a0
    5d3c:	10000913          	li	s2,256
    5d40:	02050e63          	beqz	a0,5d7c <.L2>
    5d44:	00055783          	lhu	a5,0(a0)
    5d48:	0407f793          	and	a5,a5,64
    5d4c:	02078263          	beqz	a5,5d70 <.L10>
    5d50:	c49fb0ef          	jal	1998 <__stdio_wcommit>
    5d54:	fff00493          	li	s1,-1
    5d58:	02051863          	bnez	a0,5d88 <.L1>
    5d5c:	00842783          	lw	a5,8(s0)
    5d60:	00f42e23          	sw	a5,28(s0)
    5d64:	00045783          	lhu	a5,0(s0)
    5d68:	fbf7f793          	and	a5,a5,-65
    5d6c:	00f41023          	sh	a5,0(s0)

00005d70 <.L10>:
    5d70:	00000493          	li	s1,0
    5d74:	0140006f          	j	5d88 <.L1>

00005d78 <.L11>:
    5d78:	00000913          	li	s2,0

00005d7c <.L2>:
    5d7c:	0007a403          	lw	s0,0(a5)
    5d80:	00000493          	li	s1,0

00005d84 <.L4>:
    5d84:	02041063          	bnez	s0,5da4 <.L8>

00005d88 <.L1>:
    5d88:	00c12083          	lw	ra,12(sp)
    5d8c:	00812403          	lw	s0,8(sp)
    5d90:	00012903          	lw	s2,0(sp)
    5d94:	00048513          	mv	a0,s1
    5d98:	00412483          	lw	s1,4(sp)
    5d9c:	01010113          	add	sp,sp,16
    5da0:	00008067          	ret

00005da4 <.L8>:
    5da4:	00045783          	lhu	a5,0(s0)
    5da8:	0407f713          	and	a4,a5,64
    5dac:	02070a63          	beqz	a4,5de0 <.L7>
    5db0:	0127e7b3          	or	a5,a5,s2
    5db4:	1407c793          	xor	a5,a5,320
    5db8:	3407f793          	and	a5,a5,832
    5dbc:	02079263          	bnez	a5,5de0 <.L7>
    5dc0:	00040513          	mv	a0,s0
    5dc4:	bd5fb0ef          	jal	1998 <__stdio_wcommit>
    5dc8:	02051063          	bnez	a0,5de8 <.L12>
    5dcc:	00842783          	lw	a5,8(s0)
    5dd0:	00f42e23          	sw	a5,28(s0)
    5dd4:	00045783          	lhu	a5,0(s0)
    5dd8:	fbf7f793          	and	a5,a5,-65
    5ddc:	00f41023          	sh	a5,0(s0)

00005de0 <.L7>:
    5de0:	02042403          	lw	s0,32(s0)
    5de4:	fa1ff06f          	j	5d84 <.L4>

00005de8 <.L12>:
    5de8:	fff00493          	li	s1,-1
    5dec:	ff5ff06f          	j	5de0 <.L7>

00005df0 <__GI___fgetc_unlocked>:
    5df0:	01052783          	lw	a5,16(a0)
    5df4:	01852703          	lw	a4,24(a0)
    5df8:	fe010113          	add	sp,sp,-32
    5dfc:	00812c23          	sw	s0,24(sp)
    5e00:	00112e23          	sw	ra,28(sp)
    5e04:	00050413          	mv	s0,a0
    5e08:	00e7fa63          	bgeu	a5,a4,5e1c <.L2>

00005e0c <.L29>:
    5e0c:	00178713          	add	a4,a5,1
    5e10:	00e42823          	sw	a4,16(s0)
    5e14:	0007c503          	lbu	a0,0(a5)
    5e18:	0340006f          	j	5e4c <.L1>

00005e1c <.L2>:
    5e1c:	00055783          	lhu	a5,0(a0)
    5e20:	0037f793          	and	a5,a5,3
    5e24:	02078c63          	beqz	a5,5e5c <.L4>

00005e28 <.L7>:
    5e28:	00045783          	lhu	a5,0(s0)
    5e2c:	0027f713          	and	a4,a5,2
    5e30:	02070e63          	beqz	a4,5e6c <.L27>
    5e34:	fff78713          	add	a4,a5,-1
    5e38:	0017f793          	and	a5,a5,1
    5e3c:	00e41023          	sh	a4,0(s0)
    5e40:	00f407b3          	add	a5,s0,a5
    5e44:	0027c503          	lbu	a0,2(a5)
    5e48:	000401a3          	sb	zero,3(s0)

00005e4c <.L1>:
    5e4c:	01c12083          	lw	ra,28(sp)
    5e50:	01812403          	lw	s0,24(sp)
    5e54:	02010113          	add	sp,sp,32
    5e58:	00008067          	ret

00005e5c <.L4>:
    5e5c:	744010ef          	jal	75a0 <__stdio_trans2r>
    5e60:	fc0504e3          	beqz	a0,5e28 <.L7>

00005e64 <.L8>:
    5e64:	fff00513          	li	a0,-1
    5e68:	fe5ff06f          	j	5e4c <.L1>

00005e6c <.L27>:
    5e6c:	01042703          	lw	a4,16(s0)
    5e70:	01442683          	lw	a3,20(s0)
    5e74:	00e68a63          	beq	a3,a4,5e88 <.L9>
    5e78:	00170793          	add	a5,a4,1
    5e7c:	00f42823          	sw	a5,16(s0)
    5e80:	00074503          	lbu	a0,0(a4)
    5e84:	fc9ff06f          	j	5e4c <.L1>

00005e88 <.L9>:
    5e88:	00442683          	lw	a3,4(s0)
    5e8c:	ffd00713          	li	a4,-3
    5e90:	00e69863          	bne	a3,a4,5ea0 <.L10>
    5e94:	0047e793          	or	a5,a5,4
    5e98:	00f41023          	sh	a5,0(s0)
    5e9c:	fc9ff06f          	j	5e64 <.L8>

00005ea0 <.L10>:
    5ea0:	3007f793          	and	a5,a5,768
    5ea4:	00078863          	beqz	a5,5eb4 <.L11>
    5ea8:	0000a517          	auipc	a0,0xa
    5eac:	3fc52503          	lw	a0,1020(a0) # 102a4 <_GLOBAL_OFFSET_TABLE_+0x1c>
    5eb0:	e69ff0ef          	jal	5d18 <__GI_fflush>

00005eb4 <.L11>:
    5eb4:	00842783          	lw	a5,8(s0)
    5eb8:	00c42703          	lw	a4,12(s0)
    5ebc:	02f70263          	beq	a4,a5,5ee0 <.L12>
    5ec0:	00f42c23          	sw	a5,24(s0)
    5ec4:	00040513          	mv	a0,s0
    5ec8:	698010ef          	jal	7560 <__stdio_rfill>
    5ecc:	f8050ce3          	beqz	a0,5e64 <.L8>
    5ed0:	01442783          	lw	a5,20(s0)
    5ed4:	00f42c23          	sw	a5,24(s0)
    5ed8:	01042783          	lw	a5,16(s0)
    5edc:	f31ff06f          	j	5e0c <.L29>

00005ee0 <.L12>:
    5ee0:	00100613          	li	a2,1
    5ee4:	00f10593          	add	a1,sp,15
    5ee8:	00040513          	mv	a0,s0
    5eec:	550010ef          	jal	743c <__stdio_READ>
    5ef0:	f6050ae3          	beqz	a0,5e64 <.L8>
    5ef4:	00f14503          	lbu	a0,15(sp)
    5ef8:	f55ff06f          	j	5e4c <.L1>

00005efc <__GI_fgets>:
    5efc:	fe010113          	add	sp,sp,-32
    5f00:	00112e23          	sw	ra,28(sp)
    5f04:	00812c23          	sw	s0,24(sp)
    5f08:	00912a23          	sw	s1,20(sp)
    5f0c:	01212823          	sw	s2,16(sp)
    5f10:	01312623          	sw	s3,12(sp)
    5f14:	01412423          	sw	s4,8(sp)
    5f18:	01512223          	sw	s5,4(sp)
    5f1c:	01612023          	sw	s6,0(sp)
    5f20:	02b04a63          	bgtz	a1,5f54 <.L2>

00005f24 <.L9>:
    5f24:	00000493          	li	s1,0

00005f28 <.L3>:
    5f28:	01c12083          	lw	ra,28(sp)
    5f2c:	01812403          	lw	s0,24(sp)
    5f30:	01012903          	lw	s2,16(sp)
    5f34:	00c12983          	lw	s3,12(sp)
    5f38:	00812a03          	lw	s4,8(sp)
    5f3c:	00412a83          	lw	s5,4(sp)
    5f40:	00012b03          	lw	s6,0(sp)
    5f44:	00048513          	mv	a0,s1
    5f48:	01412483          	lw	s1,20(sp)
    5f4c:	02010113          	add	sp,sp,32
    5f50:	00008067          	ret

00005f54 <.L2>:
    5f54:	00050493          	mv	s1,a0
    5f58:	00060913          	mv	s2,a2
    5f5c:	00150413          	add	s0,a0,1
    5f60:	00b509b3          	add	s3,a0,a1
    5f64:	fff00b13          	li	s6,-1
    5f68:	00a00a93          	li	s5,10

00005f6c <.L4>:
    5f6c:	fff40a13          	add	s4,s0,-1
    5f70:	03340463          	beq	s0,s3,5f98 <.L6>
    5f74:	01092783          	lw	a5,16(s2)
    5f78:	01892703          	lw	a4,24(s2)
    5f7c:	02e7f463          	bgeu	a5,a4,5fa4 <.L5>
    5f80:	00178713          	add	a4,a5,1
    5f84:	00e92823          	sw	a4,16(s2)
    5f88:	0007c783          	lbu	a5,0(a5)
    5f8c:	00040a13          	mv	s4,s0
    5f90:	fef40fa3          	sb	a5,-1(s0)
    5f94:	03579e63          	bne	a5,s5,5fd0 <.L7>

00005f98 <.L6>:
    5f98:	f944f6e3          	bgeu	s1,s4,5f24 <.L9>
    5f9c:	000a0023          	sb	zero,0(s4)
    5fa0:	f89ff06f          	j	5f28 <.L3>

00005fa4 <.L5>:
    5fa4:	00090513          	mv	a0,s2
    5fa8:	e49ff0ef          	jal	5df0 <__GI___fgetc_unlocked>
    5fac:	01651a63          	bne	a0,s6,5fc0 <.L8>
    5fb0:	00095783          	lhu	a5,0(s2)
    5fb4:	0087f793          	and	a5,a5,8
    5fb8:	fe0780e3          	beqz	a5,5f98 <.L6>
    5fbc:	f69ff06f          	j	5f24 <.L9>

00005fc0 <.L8>:
    5fc0:	0ff57513          	zext.b	a0,a0
    5fc4:	fea40fa3          	sb	a0,-1(s0)
    5fc8:	00040a13          	mv	s4,s0
    5fcc:	fd5506e3          	beq	a0,s5,5f98 <.L6>

00005fd0 <.L7>:
    5fd0:	00140413          	add	s0,s0,1
    5fd4:	f99ff06f          	j	5f6c <.L4>

00005fd8 <__GI_memchr>:
    5fd8:	0ff5f793          	zext.b	a5,a1

00005fdc <.L2>:
    5fdc:	00060663          	beqz	a2,5fe8 <.L4>
    5fe0:	00357713          	and	a4,a0,3
    5fe4:	02071c63          	bnez	a4,601c <.L5>

00005fe8 <.L4>:
    5fe8:	01010737          	lui	a4,0x1010
    5fec:	0ff5f593          	zext.b	a1,a1
    5ff0:	10170713          	add	a4,a4,257 # 1010101 <_ebss+0xffa211>
    5ff4:	02e585b3          	mul	a1,a1,a4
    5ff8:	7eff0837          	lui	a6,0x7eff0
    5ffc:	00300313          	li	t1,3
    6000:	eff80813          	add	a6,a6,-257 # 7efefeff <_ebss+0x7efda00f>
    6004:	fff00e13          	li	t3,-1

00006008 <.L6>:
    6008:	02c36463          	bltu	t1,a2,6030 <.L10>
    600c:	00c50633          	add	a2,a0,a2

00006010 <.L11>:
    6010:	08c51063          	bne	a0,a2,6090 <.L12>
    6014:	00000513          	li	a0,0

00006018 <.L1>:
    6018:	00008067          	ret

0000601c <.L5>:
    601c:	00054703          	lbu	a4,0(a0)
    6020:	fef70ce3          	beq	a4,a5,6018 <.L1>
    6024:	fff60613          	add	a2,a2,-1
    6028:	00150513          	add	a0,a0,1
    602c:	fb1ff06f          	j	5fdc <.L2>

00006030 <.L10>:
    6030:	00052883          	lw	a7,0(a0)
    6034:	00450713          	add	a4,a0,4
    6038:	0115c8b3          	xor	a7,a1,a7
    603c:	010886b3          	add	a3,a7,a6
    6040:	0116c6b3          	xor	a3,a3,a7
    6044:	0106e6b3          	or	a3,a3,a6
    6048:	03c68e63          	beq	a3,t3,6084 <.L7>
    604c:	ffc74683          	lbu	a3,-4(a4)
    6050:	fcf684e3          	beq	a3,a5,6018 <.L1>
    6054:	ffd74683          	lbu	a3,-3(a4)
    6058:	00f69663          	bne	a3,a5,6064 <.L8>
    605c:	00150513          	add	a0,a0,1
    6060:	00008067          	ret

00006064 <.L8>:
    6064:	ffe74683          	lbu	a3,-2(a4)
    6068:	00f69663          	bne	a3,a5,6074 <.L9>
    606c:	00250513          	add	a0,a0,2
    6070:	00008067          	ret

00006074 <.L9>:
    6074:	fff74683          	lbu	a3,-1(a4)
    6078:	00f69663          	bne	a3,a5,6084 <.L7>
    607c:	00350513          	add	a0,a0,3
    6080:	00008067          	ret

00006084 <.L7>:
    6084:	ffc60613          	add	a2,a2,-4
    6088:	00070513          	mv	a0,a4
    608c:	f7dff06f          	j	6008 <.L6>

00006090 <.L12>:
    6090:	00054703          	lbu	a4,0(a0)
    6094:	f8f702e3          	beq	a4,a5,6018 <.L1>
    6098:	00150513          	add	a0,a0,1
    609c:	f75ff06f          	j	6010 <.L11>

000060a0 <__GI_mempcpy>:
    60a0:	ff010113          	add	sp,sp,-16
    60a4:	00812423          	sw	s0,8(sp)
    60a8:	00912223          	sw	s1,4(sp)
    60ac:	00112623          	sw	ra,12(sp)
    60b0:	00050493          	mv	s1,a0
    60b4:	00060413          	mv	s0,a2
    60b8:	a39fc0ef          	jal	2af0 <__GI_memcpy>
    60bc:	00848533          	add	a0,s1,s0
    60c0:	00c12083          	lw	ra,12(sp)
    60c4:	00812403          	lw	s0,8(sp)
    60c8:	00412483          	lw	s1,4(sp)
    60cc:	01010113          	add	sp,sp,16
    60d0:	00008067          	ret

000060d4 <__GI_memrchr>:
    60d4:	0ff5f793          	zext.b	a5,a1
    60d8:	00c50533          	add	a0,a0,a2

000060dc <.L2>:
    60dc:	00060663          	beqz	a2,60e8 <.L4>
    60e0:	00357713          	and	a4,a0,3
    60e4:	02071e63          	bnez	a4,6120 <.L5>

000060e8 <.L4>:
    60e8:	01010737          	lui	a4,0x1010
    60ec:	0ff5f593          	zext.b	a1,a1
    60f0:	10170713          	add	a4,a4,257 # 1010101 <_ebss+0xffa211>
    60f4:	02e585b3          	mul	a1,a1,a4
    60f8:	7eff0837          	lui	a6,0x7eff0
    60fc:	00050693          	mv	a3,a0
    6100:	00300313          	li	t1,3
    6104:	eff80813          	add	a6,a6,-257 # 7efefeff <_ebss+0x7efda00f>
    6108:	fff00e13          	li	t3,-1

0000610c <.L6>:
    610c:	02c36463          	bltu	t1,a2,6134 <.L11>
    6110:	40c50633          	sub	a2,a0,a2

00006114 <.L12>:
    6114:	08c51063          	bne	a0,a2,6194 <.L13>
    6118:	00000513          	li	a0,0
    611c:	00008067          	ret

00006120 <.L5>:
    6120:	fff54703          	lbu	a4,-1(a0)
    6124:	fff50513          	add	a0,a0,-1
    6128:	06f70c63          	beq	a4,a5,61a0 <.L1>
    612c:	fff60613          	add	a2,a2,-1
    6130:	fadff06f          	j	60dc <.L2>

00006134 <.L11>:
    6134:	ffc52883          	lw	a7,-4(a0)
    6138:	ffc50513          	add	a0,a0,-4
    613c:	0115c8b3          	xor	a7,a1,a7
    6140:	01088733          	add	a4,a7,a6
    6144:	01174733          	xor	a4,a4,a7
    6148:	01076733          	or	a4,a4,a6
    614c:	03c70e63          	beq	a4,t3,6188 <.L7>
    6150:	00354703          	lbu	a4,3(a0)
    6154:	00f71663          	bne	a4,a5,6160 <.L8>
    6158:	fff68513          	add	a0,a3,-1
    615c:	00008067          	ret

00006160 <.L8>:
    6160:	00254703          	lbu	a4,2(a0)
    6164:	00f71663          	bne	a4,a5,6170 <.L9>
    6168:	ffe68513          	add	a0,a3,-2
    616c:	00008067          	ret

00006170 <.L9>:
    6170:	00154703          	lbu	a4,1(a0)
    6174:	00f71663          	bne	a4,a5,6180 <.L10>
    6178:	ffd68513          	add	a0,a3,-3
    617c:	00008067          	ret

00006180 <.L10>:
    6180:	00054703          	lbu	a4,0(a0)
    6184:	00f70e63          	beq	a4,a5,61a0 <.L1>

00006188 <.L7>:
    6188:	ffc60613          	add	a2,a2,-4
    618c:	00050693          	mv	a3,a0
    6190:	f7dff06f          	j	610c <.L6>

00006194 <.L13>:
    6194:	fff54703          	lbu	a4,-1(a0)
    6198:	fff50513          	add	a0,a0,-1
    619c:	f6f71ce3          	bne	a4,a5,6114 <.L12>

000061a0 <.L1>:
    61a0:	00008067          	ret

000061a4 <__GI_strchr>:
    61a4:	0ff5f693          	zext.b	a3,a1

000061a8 <.L2>:
    61a8:	00357793          	and	a5,a0,3
    61ac:	06079263          	bnez	a5,6210 <.L4>
    61b0:	010107b7          	lui	a5,0x1010
    61b4:	0ff5f593          	zext.b	a1,a1
    61b8:	10178793          	add	a5,a5,257 # 1010101 <_ebss+0xffa211>
    61bc:	02f585b3          	mul	a1,a1,a5
    61c0:	7eff0637          	lui	a2,0x7eff0
    61c4:	eff60613          	add	a2,a2,-257 # 7efefeff <_ebss+0x7efda00f>
    61c8:	fff00313          	li	t1,-1

000061cc <.L5>:
    61cc:	00052803          	lw	a6,0(a0)
    61d0:	00450713          	add	a4,a0,4
    61d4:	0105c8b3          	xor	a7,a1,a6
    61d8:	00c807b3          	add	a5,a6,a2
    61dc:	0107c7b3          	xor	a5,a5,a6
    61e0:	00c88833          	add	a6,a7,a2
    61e4:	01184833          	xor	a6,a6,a7
    61e8:	0107f7b3          	and	a5,a5,a6
    61ec:	00c7e7b3          	or	a5,a5,a2
    61f0:	02678a63          	beq	a5,t1,6224 <.L6>
    61f4:	ffc74783          	lbu	a5,-4(a4)
    61f8:	06d78263          	beq	a5,a3,625c <.L1>
    61fc:	04078e63          	beqz	a5,6258 <.L13>
    6200:	ffd74783          	lbu	a5,-3(a4)
    6204:	02d79463          	bne	a5,a3,622c <.L7>
    6208:	00150513          	add	a0,a0,1
    620c:	00008067          	ret

00006210 <.L4>:
    6210:	00054783          	lbu	a5,0(a0)
    6214:	04d78463          	beq	a5,a3,625c <.L1>
    6218:	04078063          	beqz	a5,6258 <.L13>
    621c:	00150513          	add	a0,a0,1
    6220:	f89ff06f          	j	61a8 <.L2>

00006224 <.L6>:
    6224:	00070513          	mv	a0,a4
    6228:	fa5ff06f          	j	61cc <.L5>

0000622c <.L7>:
    622c:	02078663          	beqz	a5,6258 <.L13>
    6230:	ffe74783          	lbu	a5,-2(a4)
    6234:	00d79663          	bne	a5,a3,6240 <.L8>
    6238:	00250513          	add	a0,a0,2
    623c:	00008067          	ret

00006240 <.L8>:
    6240:	00078c63          	beqz	a5,6258 <.L13>
    6244:	fff74783          	lbu	a5,-1(a4)
    6248:	00d79663          	bne	a5,a3,6254 <.L9>
    624c:	00350513          	add	a0,a0,3
    6250:	00008067          	ret

00006254 <.L9>:
    6254:	fc0798e3          	bnez	a5,6224 <.L6>

00006258 <.L13>:
    6258:	00000513          	li	a0,0

0000625c <.L1>:
    625c:	00008067          	ret

00006260 <__GI_strchrnul>:
    6260:	0ff5f693          	zext.b	a3,a1

00006264 <.L2>:
    6264:	00357793          	and	a5,a0,3
    6268:	08079463          	bnez	a5,62f0 <.L4>
    626c:	010107b7          	lui	a5,0x1010
    6270:	0ff5f593          	zext.b	a1,a1
    6274:	10178793          	add	a5,a5,257 # 1010101 <_ebss+0xffa211>
    6278:	02f585b3          	mul	a1,a1,a5
    627c:	7eff0637          	lui	a2,0x7eff0
    6280:	eff60613          	add	a2,a2,-257 # 7efefeff <_ebss+0x7efda00f>
    6284:	fff00313          	li	t1,-1

00006288 <.L5>:
    6288:	00052803          	lw	a6,0(a0)
    628c:	00450793          	add	a5,a0,4
    6290:	0105c8b3          	xor	a7,a1,a6
    6294:	00c80733          	add	a4,a6,a2
    6298:	01074733          	xor	a4,a4,a6
    629c:	00c88833          	add	a6,a7,a2
    62a0:	01184833          	xor	a6,a6,a7
    62a4:	01077733          	and	a4,a4,a6
    62a8:	00c76733          	or	a4,a4,a2
    62ac:	04670c63          	beq	a4,t1,6304 <.L6>
    62b0:	ffc7c703          	lbu	a4,-4(a5)
    62b4:	02d70c63          	beq	a4,a3,62ec <.L1>
    62b8:	02070a63          	beqz	a4,62ec <.L1>
    62bc:	ffd7c703          	lbu	a4,-3(a5)
    62c0:	00150513          	add	a0,a0,1
    62c4:	02d70463          	beq	a4,a3,62ec <.L1>
    62c8:	02070263          	beqz	a4,62ec <.L1>
    62cc:	ffe7c703          	lbu	a4,-2(a5)
    62d0:	ffe78513          	add	a0,a5,-2
    62d4:	00d70c63          	beq	a4,a3,62ec <.L1>
    62d8:	00070a63          	beqz	a4,62ec <.L1>
    62dc:	fff7c703          	lbu	a4,-1(a5)
    62e0:	fff78513          	add	a0,a5,-1
    62e4:	00d70463          	beq	a4,a3,62ec <.L1>
    62e8:	00071e63          	bnez	a4,6304 <.L6>

000062ec <.L1>:
    62ec:	00008067          	ret

000062f0 <.L4>:
    62f0:	00054783          	lbu	a5,0(a0)
    62f4:	fed78ce3          	beq	a5,a3,62ec <.L1>
    62f8:	fe078ae3          	beqz	a5,62ec <.L1>
    62fc:	00150513          	add	a0,a0,1
    6300:	f65ff06f          	j	6264 <.L2>

00006304 <.L6>:
    6304:	00078513          	mv	a0,a5
    6308:	f81ff06f          	j	6288 <.L5>

0000630c <__GI_strcmp>:
    630c:	00054703          	lbu	a4,0(a0)
    6310:	00150513          	add	a0,a0,1
    6314:	00158593          	add	a1,a1,1
    6318:	fff5c783          	lbu	a5,-1(a1)
    631c:	00071663          	bnez	a4,6328 <.L2>
    6320:	40f00533          	neg	a0,a5
    6324:	00008067          	ret

00006328 <.L2>:
    6328:	fef702e3          	beq	a4,a5,630c <__GI_strcmp>
    632c:	40f70533          	sub	a0,a4,a5
    6330:	00008067          	ret

00006334 <__GI_strcspn>:
    6334:	ff010113          	add	sp,sp,-16
    6338:	00812423          	sw	s0,8(sp)
    633c:	00912223          	sw	s1,4(sp)
    6340:	01212023          	sw	s2,0(sp)
    6344:	00112623          	sw	ra,12(sp)
    6348:	00050493          	mv	s1,a0
    634c:	00058913          	mv	s2,a1
    6350:	00000413          	li	s0,0

00006354 <.L2>:
    6354:	008487b3          	add	a5,s1,s0
    6358:	0007c583          	lbu	a1,0(a5)
    635c:	02059063          	bnez	a1,637c <.L4>

00006360 <.L1>:
    6360:	00c12083          	lw	ra,12(sp)
    6364:	00040513          	mv	a0,s0
    6368:	00812403          	lw	s0,8(sp)
    636c:	00412483          	lw	s1,4(sp)
    6370:	00012903          	lw	s2,0(sp)
    6374:	01010113          	add	sp,sp,16
    6378:	00008067          	ret

0000637c <.L4>:
    637c:	00090513          	mv	a0,s2
    6380:	e25ff0ef          	jal	61a4 <__GI_strchr>
    6384:	fc051ee3          	bnez	a0,6360 <.L1>
    6388:	00140413          	add	s0,s0,1
    638c:	fc9ff06f          	j	6354 <.L2>

00006390 <__GI_strrchr>:
    6390:	ff010113          	add	sp,sp,-16
    6394:	00812423          	sw	s0,8(sp)
    6398:	00112623          	sw	ra,12(sp)
    639c:	00912223          	sw	s1,4(sp)
    63a0:	0ff5f413          	zext.b	s0,a1
    63a4:	04041663          	bnez	s0,63f0 <.L6>
    63a8:	00812403          	lw	s0,8(sp)
    63ac:	00c12083          	lw	ra,12(sp)
    63b0:	00412483          	lw	s1,4(sp)
    63b4:	00000593          	li	a1,0
    63b8:	01010113          	add	sp,sp,16
    63bc:	de9ff06f          	j	61a4 <__GI_strchr>

000063c0 <.L3>:
    63c0:	00150793          	add	a5,a0,1
    63c4:	00050493          	mv	s1,a0

000063c8 <.L2>:
    63c8:	00040593          	mv	a1,s0
    63cc:	00078513          	mv	a0,a5
    63d0:	dd5ff0ef          	jal	61a4 <__GI_strchr>
    63d4:	fe0516e3          	bnez	a0,63c0 <.L3>
    63d8:	00c12083          	lw	ra,12(sp)
    63dc:	00812403          	lw	s0,8(sp)
    63e0:	00048513          	mv	a0,s1
    63e4:	00412483          	lw	s1,4(sp)
    63e8:	01010113          	add	sp,sp,16
    63ec:	00008067          	ret

000063f0 <.L6>:
    63f0:	00050793          	mv	a5,a0
    63f4:	00000493          	li	s1,0
    63f8:	fd1ff06f          	j	63c8 <.L2>

000063fc <__GI_strspn>:
    63fc:	00050793          	mv	a5,a0
    6400:	00000513          	li	a0,0

00006404 <.L2>:
    6404:	00a78733          	add	a4,a5,a0
    6408:	00074683          	lbu	a3,0(a4)
    640c:	00069e63          	bnez	a3,6428 <.L7>
    6410:	00008067          	ret

00006414 <.L4>:
    6414:	00d60e63          	beq	a2,a3,6430 <.L3>
    6418:	00170713          	add	a4,a4,1

0000641c <.L6>:
    641c:	00074603          	lbu	a2,0(a4)
    6420:	fe061ae3          	bnez	a2,6414 <.L4>
    6424:	00008067          	ret

00006428 <.L7>:
    6428:	00058713          	mv	a4,a1
    642c:	ff1ff06f          	j	641c <.L6>

00006430 <.L3>:
    6430:	00150513          	add	a0,a0,1
    6434:	fd1ff06f          	j	6404 <.L2>

00006438 <calloc>:
    6438:	02a5b7b3          	mulhu	a5,a1,a0
    643c:	fe010113          	add	sp,sp,-32
    6440:	00112e23          	sw	ra,28(sp)
    6444:	00812c23          	sw	s0,24(sp)
    6448:	02a58633          	mul	a2,a1,a0
    644c:	02078663          	beqz	a5,6478 <.L9>
    6450:	0000a797          	auipc	a5,0xa
    6454:	e447a783          	lw	a5,-444(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    6458:	00c00713          	li	a4,12
    645c:	00e7a023          	sw	a4,0(a5)
    6460:	00000413          	li	s0,0

00006464 <.L1>:
    6464:	01c12083          	lw	ra,28(sp)
    6468:	00040513          	mv	a0,s0
    646c:	01812403          	lw	s0,24(sp)
    6470:	02010113          	add	sp,sp,32
    6474:	00008067          	ret

00006478 <.L9>:
    6478:	00060513          	mv	a0,a2
    647c:	00c12623          	sw	a2,12(sp)
    6480:	e49fc0ef          	jal	32c8 <malloc>
    6484:	00050413          	mv	s0,a0
    6488:	fc050ee3          	beqz	a0,6464 <.L1>
    648c:	00c12603          	lw	a2,12(sp)
    6490:	00000593          	li	a1,0
    6494:	905fc0ef          	jal	2d98 <__GI_memset>
    6498:	fcdff06f          	j	6464 <.L1>

0000649c <realloc>:
    649c:	00051663          	bnez	a0,64a8 <.L2>
    64a0:	00058513          	mv	a0,a1
    64a4:	e25fc06f          	j	32c8 <malloc>

000064a8 <.L2>:
    64a8:	ff010113          	add	sp,sp,-16
    64ac:	00112623          	sw	ra,12(sp)
    64b0:	00812423          	sw	s0,8(sp)
    64b4:	00912223          	sw	s1,4(sp)
    64b8:	01212023          	sw	s2,0(sp)
    64bc:	02059463          	bnez	a1,64e4 <.L3>
    64c0:	820fd0ef          	jal	34e0 <free>

000064c4 <.L4>:
    64c4:	00000413          	li	s0,0

000064c8 <.L1>:
    64c8:	00c12083          	lw	ra,12(sp)
    64cc:	00040513          	mv	a0,s0
    64d0:	00812403          	lw	s0,8(sp)
    64d4:	00412483          	lw	s1,4(sp)
    64d8:	00012903          	lw	s2,0(sp)
    64dc:	01010113          	add	sp,sp,16
    64e0:	00008067          	ret

000064e4 <.L3>:
    64e4:	ff000793          	li	a5,-16
    64e8:	fcb7eee3          	bltu	a5,a1,64c4 <.L4>
    64ec:	ff852903          	lw	s2,-8(a0)
    64f0:	00f58413          	add	s0,a1,15
    64f4:	ff847413          	and	s0,s0,-8
    64f8:	00050493          	mv	s1,a0
    64fc:	ff850793          	add	a5,a0,-8
    6500:	04897a63          	bgeu	s2,s0,6554 <.L7>
    6504:	41240633          	sub	a2,s0,s2
    6508:	012785b3          	add	a1,a5,s2
    650c:	0000c517          	auipc	a0,0xc
    6510:	e9850513          	add	a0,a0,-360 # 123a4 <__malloc_heap>
    6514:	064000ef          	jal	6578 <__heap_alloc_at>
    6518:	00050a63          	beqz	a0,652c <.L8>
    651c:	00a90933          	add	s2,s2,a0
    6520:	ff24ac23          	sw	s2,-8(s1)

00006524 <.L9>:
    6524:	00048413          	mv	s0,s1
    6528:	fa1ff06f          	j	64c8 <.L1>

0000652c <.L8>:
    652c:	ff840513          	add	a0,s0,-8
    6530:	d99fc0ef          	jal	32c8 <malloc>
    6534:	00050413          	mv	s0,a0
    6538:	f80508e3          	beqz	a0,64c8 <.L1>
    653c:	ff890613          	add	a2,s2,-8
    6540:	00048593          	mv	a1,s1
    6544:	dacfc0ef          	jal	2af0 <__GI_memcpy>
    6548:	00048513          	mv	a0,s1
    654c:	f95fc0ef          	jal	34e0 <free>
    6550:	f79ff06f          	j	64c8 <.L1>

00006554 <.L7>:
    6554:	02040713          	add	a4,s0,32
    6558:	fce966e3          	bltu	s2,a4,6524 <.L9>
    655c:	40890633          	sub	a2,s2,s0
    6560:	008785b3          	add	a1,a5,s0
    6564:	0000c517          	auipc	a0,0xc
    6568:	e4050513          	add	a0,a0,-448 # 123a4 <__malloc_heap>
    656c:	808fd0ef          	jal	3574 <__heap_free>
    6570:	fe84ac23          	sw	s0,-8(s1)
    6574:	fb1ff06f          	j	6524 <.L9>

00006578 <__heap_alloc_at>:
    6578:	00052783          	lw	a5,0(a0)
    657c:	00050713          	mv	a4,a0
    6580:	00c00813          	li	a6,12

00006584 <.L2>:
    6584:	00079663          	bnez	a5,6590 <.L9>

00006588 <.L11>:
    6588:	00000513          	li	a0,0
    658c:	00008067          	ret

00006590 <.L9>:
    6590:	0007a503          	lw	a0,0(a5)
    6594:	40a806b3          	sub	a3,a6,a0
    6598:	00d786b3          	add	a3,a5,a3
    659c:	04d5ea63          	bltu	a1,a3,65f0 <.L3>
    65a0:	feb694e3          	bne	a3,a1,6588 <.L11>
    65a4:	00760613          	add	a2,a2,7
    65a8:	ff867613          	and	a2,a2,-8
    65ac:	fcc56ee3          	bltu	a0,a2,6588 <.L11>
    65b0:	03060693          	add	a3,a2,48
    65b4:	02d57663          	bgeu	a0,a3,65e0 <.L5>
    65b8:	0047a683          	lw	a3,4(a5)
    65bc:	00068663          	beqz	a3,65c8 <.L6>
    65c0:	0087a603          	lw	a2,8(a5)
    65c4:	00c6a423          	sw	a2,8(a3)

000065c8 <.L6>:
    65c8:	0087a783          	lw	a5,8(a5)
    65cc:	00078663          	beqz	a5,65d8 <.L7>
    65d0:	00d7a223          	sw	a3,4(a5)
    65d4:	00008067          	ret

000065d8 <.L7>:
    65d8:	00d72023          	sw	a3,0(a4)
    65dc:	00008067          	ret

000065e0 <.L5>:
    65e0:	40c50533          	sub	a0,a0,a2
    65e4:	00a7a023          	sw	a0,0(a5)
    65e8:	00060513          	mv	a0,a2
    65ec:	00008067          	ret

000065f0 <.L3>:
    65f0:	0047a783          	lw	a5,4(a5)
    65f4:	f91ff06f          	j	6584 <.L2>

000065f8 <__GI_exit>:
    65f8:	ff010113          	add	sp,sp,-16
    65fc:	00812423          	sw	s0,8(sp)
    6600:	0000f717          	auipc	a4,0xf
    6604:	77072703          	lw	a4,1904(a4) # 15d70 <__exit_cleanup>
    6608:	00112623          	sw	ra,12(sp)
    660c:	00070793          	mv	a5,a4
    6610:	00050413          	mv	s0,a0
    6614:	00078463          	beqz	a5,661c <.L2>
    6618:	000700e7          	jalr	a4

0000661c <.L2>:
    661c:	f64fd0ef          	jal	3d80 <__uClibc_fini>
    6620:	0000a717          	auipc	a4,0xa
    6624:	ca472703          	lw	a4,-860(a4) # 102c4 <.LLST90+0x1f>
    6628:	00070793          	mv	a5,a4
    662c:	00078463          	beqz	a5,6634 <.L3>
    6630:	000700e7          	jalr	a4

00006634 <.L3>:
    6634:	00040513          	mv	a0,s0
    6638:	34d000ef          	jal	7184 <__GI__exit>

0000663c <__ieee754_atan2>:
    663c:	00060893          	mv	a7,a2
    6640:	80000837          	lui	a6,0x80000
    6644:	40c00633          	neg	a2,a2
    6648:	fff80813          	add	a6,a6,-1 # 7fffffff <_ebss+0x7ffea10f>
    664c:	01166633          	or	a2,a2,a7
    6650:	ff010113          	add	sp,sp,-16
    6654:	00d87333          	and	t1,a6,a3
    6658:	01f65613          	srl	a2,a2,0x1f
    665c:	00112623          	sw	ra,12(sp)
    6660:	00812423          	sw	s0,8(sp)
    6664:	00666633          	or	a2,a2,t1
    6668:	7ff00e37          	lui	t3,0x7ff00
    666c:	00050793          	mv	a5,a0
    6670:	00058713          	mv	a4,a1
    6674:	02ce6063          	bltu	t3,a2,6694 <.L2>
    6678:	40a00633          	neg	a2,a0
    667c:	00a66633          	or	a2,a2,a0
    6680:	00b87833          	and	a6,a6,a1
    6684:	01f65613          	srl	a2,a2,0x1f
    6688:	01066633          	or	a2,a2,a6
    668c:	00058e93          	mv	t4,a1
    6690:	02ce7063          	bgeu	t3,a2,66b0 <.L3>

00006694 <.L2>:
    6694:	00088613          	mv	a2,a7
    6698:	00078513          	mv	a0,a5
    669c:	00070593          	mv	a1,a4
    66a0:	2cd020ef          	jal	916c <__adddf3>

000066a4 <.L29>:
    66a4:	00050793          	mv	a5,a0
    66a8:	00058713          	mv	a4,a1
    66ac:	04c0006f          	j	66f8 <.L4>

000066b0 <.L3>:
    66b0:	c0100637          	lui	a2,0xc0100
    66b4:	00d60633          	add	a2,a2,a3
    66b8:	01166633          	or	a2,a2,a7
    66bc:	00061a63          	bnez	a2,66d0 <.L5>
    66c0:	00812403          	lw	s0,8(sp)
    66c4:	00c12083          	lw	ra,12(sp)
    66c8:	01010113          	add	sp,sp,16
    66cc:	4b80006f          	j	6b84 <__GI_atan>

000066d0 <.L5>:
    66d0:	41e6d413          	sra	s0,a3,0x1e
    66d4:	00247413          	and	s0,s0,2
    66d8:	01f5d613          	srl	a2,a1,0x1f
    66dc:	00a86fb3          	or	t6,a6,a0
    66e0:	00c46433          	or	s0,s0,a2
    66e4:	020f9663          	bnez	t6,6710 <.L6>
    66e8:	00200693          	li	a3,2
    66ec:	18d40c63          	beq	s0,a3,6884 <.L16>
    66f0:	00300693          	li	a3,3
    66f4:	18d40e63          	beq	s0,a3,6890 <.L17>

000066f8 <.L4>:
    66f8:	00c12083          	lw	ra,12(sp)
    66fc:	00812403          	lw	s0,8(sp)
    6700:	00078513          	mv	a0,a5
    6704:	00070593          	mv	a1,a4
    6708:	01010113          	add	sp,sp,16
    670c:	00008067          	ret

00006710 <.L6>:
    6710:	01136633          	or	a2,t1,a7
    6714:	00061e63          	bnez	a2,6730 <.L7>

00006718 <.L34>:
    6718:	0000c717          	auipc	a4,0xc
    671c:	91870713          	add	a4,a4,-1768 # 12030 <.LC0>
    6720:	020ede63          	bgez	t4,675c <.L30>
    6724:	0000c717          	auipc	a4,0xc
    6728:	92c70713          	add	a4,a4,-1748 # 12050 <.LC1>
    672c:	0300006f          	j	675c <.L30>

00006730 <.L7>:
    6730:	07c31263          	bne	t1,t3,6794 <.L8>
    6734:	fff40413          	add	s0,s0,-1
    6738:	02681863          	bne	a6,t1,6768 <.L9>
    673c:	00200793          	li	a5,2
    6740:	0000c717          	auipc	a4,0xc
    6744:	90870713          	add	a4,a4,-1784 # 12048 <.LC3>
    6748:	0087ea63          	bltu	a5,s0,675c <.L30>
    674c:	00341413          	sll	s0,s0,0x3
    6750:	0000b717          	auipc	a4,0xb
    6754:	13870713          	add	a4,a4,312 # 11888 <CSWTCH.8>
    6758:	00870733          	add	a4,a4,s0

0000675c <.L30>:
    675c:	00072783          	lw	a5,0(a4)
    6760:	00472703          	lw	a4,4(a4)
    6764:	f95ff06f          	j	66f8 <.L4>

00006768 <.L9>:
    6768:	00200693          	li	a3,2
    676c:	00000793          	li	a5,0
    6770:	00000713          	li	a4,0
    6774:	f886e2e3          	bltu	a3,s0,66f8 <.L4>
    6778:	00341413          	sll	s0,s0,0x3
    677c:	0000b717          	auipc	a4,0xb
    6780:	10c70713          	add	a4,a4,268 # 11888 <CSWTCH.8>
    6784:	00870733          	add	a4,a4,s0
    6788:	01872783          	lw	a5,24(a4)
    678c:	01c72703          	lw	a4,28(a4)
    6790:	f69ff06f          	j	66f8 <.L4>

00006794 <.L8>:
    6794:	f9c802e3          	beq	a6,t3,6718 <.L34>
    6798:	40680833          	sub	a6,a6,t1
    679c:	41485813          	sra	a6,a6,0x14
    67a0:	03c00613          	li	a2,60
    67a4:	07064a63          	blt	a2,a6,6818 <.L22>
    67a8:	0006d663          	bgez	a3,67b4 <.L12>
    67ac:	fc400613          	li	a2,-60
    67b0:	06c84e63          	blt	a6,a2,682c <.L23>

000067b4 <.L12>:
    67b4:	00078513          	mv	a0,a5
    67b8:	00070593          	mv	a1,a4
    67bc:	00088613          	mv	a2,a7
    67c0:	140030ef          	jal	9900 <__divdf3>
    67c4:	04d000ef          	jal	7010 <__GI_fabs>
    67c8:	3bc000ef          	jal	6b84 <__GI_atan>
    67cc:	00050793          	mv	a5,a0
    67d0:	00058713          	mv	a4,a1

000067d4 <.L11>:
    67d4:	00100693          	li	a3,1
    67d8:	06d40063          	beq	s0,a3,6838 <.L13>
    67dc:	00200693          	li	a3,2
    67e0:	06d40463          	beq	s0,a3,6848 <.L14>
    67e4:	f0040ae3          	beqz	s0,66f8 <.L4>
    67e8:	0000c697          	auipc	a3,0xc
    67ec:	87068693          	add	a3,a3,-1936 # 12058 <.LC5>
    67f0:	0006a603          	lw	a2,0(a3)
    67f4:	0046a683          	lw	a3,4(a3)
    67f8:	00078513          	mv	a0,a5
    67fc:	00070593          	mv	a1,a4
    6800:	739030ef          	jal	a738 <__subdf3>
    6804:	0000c797          	auipc	a5,0xc
    6808:	83478793          	add	a5,a5,-1996 # 12038 <.LC1>
    680c:	0007a603          	lw	a2,0(a5)
    6810:	0047a683          	lw	a3,4(a5)
    6814:	0680006f          	j	687c <.L31>

00006818 <.L22>:
    6818:	0000c717          	auipc	a4,0xc
    681c:	81870713          	add	a4,a4,-2024 # 12030 <.LC0>
    6820:	00072783          	lw	a5,0(a4)
    6824:	00472703          	lw	a4,4(a4)
    6828:	fadff06f          	j	67d4 <.L11>

0000682c <.L23>:
    682c:	00000793          	li	a5,0
    6830:	00000713          	li	a4,0
    6834:	fa1ff06f          	j	67d4 <.L11>

00006838 <.L13>:
    6838:	800006b7          	lui	a3,0x80000
    683c:	00e6c6b3          	xor	a3,a3,a4
    6840:	00068713          	mv	a4,a3
    6844:	eb5ff06f          	j	66f8 <.L4>

00006848 <.L14>:
    6848:	0000c697          	auipc	a3,0xc
    684c:	81068693          	add	a3,a3,-2032 # 12058 <.LC5>
    6850:	0006a603          	lw	a2,0(a3)
    6854:	0046a683          	lw	a3,4(a3)
    6858:	00078513          	mv	a0,a5
    685c:	00070593          	mv	a1,a4
    6860:	6d9030ef          	jal	a738 <__subdf3>
    6864:	0000b797          	auipc	a5,0xb
    6868:	7d478793          	add	a5,a5,2004 # 12038 <.LC1>
    686c:	00050613          	mv	a2,a0
    6870:	00058693          	mv	a3,a1
    6874:	0007a503          	lw	a0,0(a5)
    6878:	0047a583          	lw	a1,4(a5)

0000687c <.L31>:
    687c:	6bd030ef          	jal	a738 <__subdf3>
    6880:	e25ff06f          	j	66a4 <.L29>

00006884 <.L16>:
    6884:	0000b717          	auipc	a4,0xb
    6888:	7b470713          	add	a4,a4,1972 # 12038 <.LC1>
    688c:	ed1ff06f          	j	675c <.L30>

00006890 <.L17>:
    6890:	0000b717          	auipc	a4,0xb
    6894:	7b070713          	add	a4,a4,1968 # 12040 <.LC2>
    6898:	ec5ff06f          	j	675c <.L30>

0000689c <__ieee754_fmod>:
    689c:	80000fb7          	lui	t6,0x80000
    68a0:	00060313          	mv	t1,a2
    68a4:	00068f13          	mv	t5,a3
    68a8:	00060e93          	mv	t4,a2
    68ac:	ffff8613          	add	a2,t6,-1 # 7fffffff <_ebss+0x7ffea10f>
    68b0:	01e67e33          	and	t3,a2,t5
    68b4:	006e67b3          	or	a5,t3,t1
    68b8:	02078463          	beqz	a5,68e0 <.L2>
    68bc:	00b67633          	and	a2,a2,a1
    68c0:	7ff008b7          	lui	a7,0x7ff00
    68c4:	00058793          	mv	a5,a1
    68c8:	01167c63          	bgeu	a2,a7,68e0 <.L2>
    68cc:	40600733          	neg	a4,t1
    68d0:	00676733          	or	a4,a4,t1
    68d4:	01f75713          	srl	a4,a4,0x1f
    68d8:	01c76733          	or	a4,a4,t3
    68dc:	02e8f863          	bgeu	a7,a4,690c <.L3>

000068e0 <.L2>:
    68e0:	ff010113          	add	sp,sp,-16
    68e4:	00030613          	mv	a2,t1
    68e8:	000f0693          	mv	a3,t5
    68ec:	00112623          	sw	ra,12(sp)
    68f0:	059030ef          	jal	a148 <__muldf3>
    68f4:	00050613          	mv	a2,a0
    68f8:	00058693          	mv	a3,a1
    68fc:	004030ef          	jal	9900 <__divdf3>
    6900:	00c12083          	lw	ra,12(sp)
    6904:	01010113          	add	sp,sp,16
    6908:	00008067          	ret

0000690c <.L3>:
    690c:	00050893          	mv	a7,a0
    6910:	01f5f833          	and	a6,a1,t6
    6914:	02ce4663          	blt	t3,a2,6940 <.L5>
    6918:	23c64c63          	blt	a2,t3,6b50 <.L45>
    691c:	22656a63          	bltu	a0,t1,6b50 <.L45>
    6920:	02a31063          	bne	t1,a0,6940 <.L5>

00006924 <.L49>:
    6924:	0000b797          	auipc	a5,0xb
    6928:	f9478793          	add	a5,a5,-108 # 118b8 <Zero>
    692c:	01c85813          	srl	a6,a6,0x1c
    6930:	01078833          	add	a6,a5,a6
    6934:	00082503          	lw	a0,0(a6)
    6938:	00482583          	lw	a1,4(a6)
    693c:	00008067          	ret

00006940 <.L5>:
    6940:	0147d713          	srl	a4,a5,0x14
    6944:	7ff77713          	and	a4,a4,2047
    6948:	0c071e63          	bnez	a4,6a24 <.L6>
    694c:	0c061063          	bnez	a2,6a0c <.L7>
    6950:	00088713          	mv	a4,a7
    6954:	bed00513          	li	a0,-1043

00006958 <.L8>:
    6958:	0ae04463          	bgtz	a4,6a00 <.L9>

0000695c <.L10>:
    695c:	014f5713          	srl	a4,t5,0x14
    6960:	7ff77713          	and	a4,a4,2047
    6964:	0e071863          	bnez	a4,6a54 <.L13>
    6968:	0c0e1a63          	bnez	t3,6a3c <.L14>
    696c:	00030693          	mv	a3,t1
    6970:	bed00713          	li	a4,-1043

00006974 <.L15>:
    6974:	0ad04e63          	bgtz	a3,6a30 <.L16>

00006978 <.L17>:
    6978:	c0200693          	li	a3,-1022
    697c:	0ed54263          	blt	a0,a3,6a60 <.L20>
    6980:	001006b7          	lui	a3,0x100
    6984:	fff68613          	add	a2,a3,-1 # fffff <_ebss+0xea10f>
    6988:	00c7f5b3          	and	a1,a5,a2
    698c:	00d5e5b3          	or	a1,a1,a3

00006990 <.L21>:
    6990:	c0200613          	li	a2,-1022
    6994:	10c74263          	blt	a4,a2,6a98 <.L23>
    6998:	001007b7          	lui	a5,0x100
    699c:	fff78693          	add	a3,a5,-1 # fffff <_ebss+0xea10f>
    69a0:	01e6f6b3          	and	a3,a3,t5
    69a4:	00f6e6b3          	or	a3,a3,a5

000069a8 <.L24>:
    69a8:	40e50533          	sub	a0,a0,a4

000069ac <.L26>:
    69ac:	40d587b3          	sub	a5,a1,a3
    69b0:	41d88633          	sub	a2,a7,t4
    69b4:	10051e63          	bnez	a0,6ad0 <.L31>
    69b8:	01d8f463          	bgeu	a7,t4,69c0 <.L32>
    69bc:	fff78793          	add	a5,a5,-1

000069c0 <.L32>:
    69c0:	0007d663          	bgez	a5,69cc <.L33>
    69c4:	00088613          	mv	a2,a7
    69c8:	00058793          	mv	a5,a1

000069cc <.L33>:
    69cc:	00c7e6b3          	or	a3,a5,a2
    69d0:	001005b7          	lui	a1,0x100
    69d4:	f40688e3          	beqz	a3,6924 <.L49>

000069d8 <.L34>:
    69d8:	12b7cc63          	blt	a5,a1,6b10 <.L35>
    69dc:	c0200693          	li	a3,-1022
    69e0:	14d74463          	blt	a4,a3,6b28 <.L36>
    69e4:	40b787b3          	sub	a5,a5,a1
    69e8:	3ff70713          	add	a4,a4,1023
    69ec:	0107e7b3          	or	a5,a5,a6
    69f0:	01471713          	sll	a4,a4,0x14
    69f4:	00060513          	mv	a0,a2
    69f8:	00e7e5b3          	or	a1,a5,a4
    69fc:	00008067          	ret

00006a00 <.L9>:
    6a00:	fff50513          	add	a0,a0,-1
    6a04:	00171713          	sll	a4,a4,0x1
    6a08:	f51ff06f          	j	6958 <.L8>

00006a0c <.L7>:
    6a0c:	00b61713          	sll	a4,a2,0xb
    6a10:	c0200513          	li	a0,-1022

00006a14 <.L11>:
    6a14:	f4e054e3          	blez	a4,695c <.L10>
    6a18:	fff50513          	add	a0,a0,-1
    6a1c:	00171713          	sll	a4,a4,0x1
    6a20:	ff5ff06f          	j	6a14 <.L11>

00006a24 <.L6>:
    6a24:	41465513          	sra	a0,a2,0x14
    6a28:	c0150513          	add	a0,a0,-1023
    6a2c:	f31ff06f          	j	695c <.L10>

00006a30 <.L16>:
    6a30:	fff70713          	add	a4,a4,-1
    6a34:	00169693          	sll	a3,a3,0x1
    6a38:	f3dff06f          	j	6974 <.L15>

00006a3c <.L14>:
    6a3c:	00be1693          	sll	a3,t3,0xb
    6a40:	c0200713          	li	a4,-1022

00006a44 <.L18>:
    6a44:	f2d05ae3          	blez	a3,6978 <.L17>
    6a48:	fff70713          	add	a4,a4,-1
    6a4c:	00169693          	sll	a3,a3,0x1
    6a50:	ff5ff06f          	j	6a44 <.L18>

00006a54 <.L13>:
    6a54:	414e5713          	sra	a4,t3,0x14
    6a58:	c0170713          	add	a4,a4,-1023
    6a5c:	f1dff06f          	j	6978 <.L17>

00006a60 <.L20>:
    6a60:	40a687b3          	sub	a5,a3,a0
    6a64:	01f00693          	li	a3,31
    6a68:	00f6ce63          	blt	a3,a5,6a84 <.L22>
    6a6c:	41e50593          	add	a1,a0,1054
    6a70:	00b8d5b3          	srl	a1,a7,a1
    6a74:	00f61633          	sll	a2,a2,a5
    6a78:	00c5e5b3          	or	a1,a1,a2
    6a7c:	00f898b3          	sll	a7,a7,a5
    6a80:	f11ff06f          	j	6990 <.L21>

00006a84 <.L22>:
    6a84:	be200593          	li	a1,-1054
    6a88:	40a585b3          	sub	a1,a1,a0
    6a8c:	00b895b3          	sll	a1,a7,a1
    6a90:	00000893          	li	a7,0
    6a94:	efdff06f          	j	6990 <.L21>

00006a98 <.L23>:
    6a98:	40e60633          	sub	a2,a2,a4
    6a9c:	01f00793          	li	a5,31
    6aa0:	00c7ce63          	blt	a5,a2,6abc <.L25>
    6aa4:	41e70693          	add	a3,a4,1054
    6aa8:	00ce17b3          	sll	a5,t3,a2
    6aac:	00d356b3          	srl	a3,t1,a3
    6ab0:	00f6e6b3          	or	a3,a3,a5
    6ab4:	00c31eb3          	sll	t4,t1,a2
    6ab8:	ef1ff06f          	j	69a8 <.L24>

00006abc <.L25>:
    6abc:	be200693          	li	a3,-1054
    6ac0:	40e686b3          	sub	a3,a3,a4
    6ac4:	00d316b3          	sll	a3,t1,a3
    6ac8:	00000e93          	li	t4,0
    6acc:	eddff06f          	j	69a8 <.L24>

00006ad0 <.L31>:
    6ad0:	01d8f463          	bgeu	a7,t4,6ad8 <.L27>
    6ad4:	fff78793          	add	a5,a5,-1

00006ad8 <.L27>:
    6ad8:	0007de63          	bgez	a5,6af4 <.L28>
    6adc:	01f8d793          	srl	a5,a7,0x1f
    6ae0:	00159593          	sll	a1,a1,0x1
    6ae4:	00f585b3          	add	a1,a1,a5
    6ae8:	00189893          	sll	a7,a7,0x1

00006aec <.L29>:
    6aec:	fff50513          	add	a0,a0,-1
    6af0:	ebdff06f          	j	69ac <.L26>

00006af4 <.L28>:
    6af4:	00c7e5b3          	or	a1,a5,a2
    6af8:	e20586e3          	beqz	a1,6924 <.L49>
    6afc:	00179793          	sll	a5,a5,0x1
    6b00:	01f65593          	srl	a1,a2,0x1f
    6b04:	00b785b3          	add	a1,a5,a1
    6b08:	00161893          	sll	a7,a2,0x1
    6b0c:	fe1ff06f          	j	6aec <.L29>

00006b10 <.L35>:
    6b10:	01f65693          	srl	a3,a2,0x1f
    6b14:	00179793          	sll	a5,a5,0x1
    6b18:	00d787b3          	add	a5,a5,a3
    6b1c:	00161613          	sll	a2,a2,0x1
    6b20:	fff70713          	add	a4,a4,-1
    6b24:	eb5ff06f          	j	69d8 <.L34>

00006b28 <.L36>:
    6b28:	40e686b3          	sub	a3,a3,a4
    6b2c:	01400593          	li	a1,20
    6b30:	02d5c263          	blt	a1,a3,6b54 <.L37>
    6b34:	41e70713          	add	a4,a4,1054
    6b38:	00e79733          	sll	a4,a5,a4
    6b3c:	00d65633          	srl	a2,a2,a3
    6b40:	00c76633          	or	a2,a4,a2
    6b44:	40d7d7b3          	sra	a5,a5,a3

00006b48 <.L38>:
    6b48:	00060513          	mv	a0,a2
    6b4c:	0107e5b3          	or	a1,a5,a6

00006b50 <.L45>:
    6b50:	00008067          	ret

00006b54 <.L37>:
    6b54:	01f00593          	li	a1,31
    6b58:	00d5ce63          	blt	a1,a3,6b74 <.L39>
    6b5c:	41e70713          	add	a4,a4,1054
    6b60:	00d65633          	srl	a2,a2,a3
    6b64:	00e797b3          	sll	a5,a5,a4
    6b68:	00c7e633          	or	a2,a5,a2

00006b6c <.L47>:
    6b6c:	00080793          	mv	a5,a6
    6b70:	fd9ff06f          	j	6b48 <.L38>

00006b74 <.L39>:
    6b74:	be200613          	li	a2,-1054
    6b78:	40e60633          	sub	a2,a2,a4
    6b7c:	40c7d633          	sra	a2,a5,a2
    6b80:	fedff06f          	j	6b6c <.L47>

00006b84 <__GI_atan>:
    6b84:	fd010113          	add	sp,sp,-48
    6b88:	02912223          	sw	s1,36(sp)
    6b8c:	00159493          	sll	s1,a1,0x1
    6b90:	02812423          	sw	s0,40(sp)
    6b94:	01712623          	sw	s7,12(sp)
    6b98:	02112623          	sw	ra,44(sp)
    6b9c:	03212023          	sw	s2,32(sp)
    6ba0:	01312e23          	sw	s3,28(sp)
    6ba4:	01412c23          	sw	s4,24(sp)
    6ba8:	01512a23          	sw	s5,20(sp)
    6bac:	01612823          	sw	s6,16(sp)
    6bb0:	0014d493          	srl	s1,s1,0x1
    6bb4:	441007b7          	lui	a5,0x44100
    6bb8:	00050b93          	mv	s7,a0
    6bbc:	00058413          	mv	s0,a1
    6bc0:	08f4e263          	bltu	s1,a5,6c44 <.L2>
    6bc4:	7ff007b7          	lui	a5,0x7ff00
    6bc8:	0097e663          	bltu	a5,s1,6bd4 <.L3>
    6bcc:	04f49c63          	bne	s1,a5,6c24 <.L4>
    6bd0:	04050a63          	beqz	a0,6c24 <.L4>

00006bd4 <.L3>:
    6bd4:	000b8613          	mv	a2,s7
    6bd8:	00040693          	mv	a3,s0
    6bdc:	000b8513          	mv	a0,s7
    6be0:	00040593          	mv	a1,s0
    6be4:	588020ef          	jal	916c <__adddf3>

00006be8 <.L18>:
    6be8:	00050b93          	mv	s7,a0
    6bec:	00058413          	mv	s0,a1

00006bf0 <.L5>:
    6bf0:	02c12083          	lw	ra,44(sp)
    6bf4:	00040593          	mv	a1,s0
    6bf8:	02812403          	lw	s0,40(sp)
    6bfc:	02412483          	lw	s1,36(sp)
    6c00:	02012903          	lw	s2,32(sp)
    6c04:	01c12983          	lw	s3,28(sp)
    6c08:	01812a03          	lw	s4,24(sp)
    6c0c:	01412a83          	lw	s5,20(sp)
    6c10:	01012b03          	lw	s6,16(sp)
    6c14:	000b8513          	mv	a0,s7
    6c18:	00c12b83          	lw	s7,12(sp)
    6c1c:	03010113          	add	sp,sp,48
    6c20:	00008067          	ret

00006c24 <.L4>:
    6c24:	0000b797          	auipc	a5,0xb
    6c28:	40c78793          	add	a5,a5,1036 # 12030 <.LC0>
    6c2c:	00804663          	bgtz	s0,6c38 <.L19>
    6c30:	0000b797          	auipc	a5,0xb
    6c34:	42078793          	add	a5,a5,1056 # 12050 <.LC1>

00006c38 <.L19>:
    6c38:	0007ab83          	lw	s7,0(a5)
    6c3c:	0047a403          	lw	s0,4(a5)
    6c40:	fb1ff06f          	j	6bf0 <.L5>

00006c44 <.L2>:
    6c44:	3fdc07b7          	lui	a5,0x3fdc0
    6c48:	00058a13          	mv	s4,a1
    6c4c:	04f4f063          	bgeu	s1,a5,6c8c <.L6>
    6c50:	3e2007b7          	lui	a5,0x3e200
    6c54:	02f4f863          	bgeu	s1,a5,6c84 <.L13>
    6c58:	0000b797          	auipc	a5,0xb
    6c5c:	40878793          	add	a5,a5,1032 # 12060 <.LC0>
    6c60:	0007a603          	lw	a2,0(a5)
    6c64:	0047a683          	lw	a3,4(a5)
    6c68:	504020ef          	jal	916c <__adddf3>
    6c6c:	0000b797          	auipc	a5,0xb
    6c70:	3fc78793          	add	a5,a5,1020 # 12068 <.LC1>
    6c74:	0007a603          	lw	a2,0(a5)
    6c78:	0047a683          	lw	a3,4(a5)
    6c7c:	3f0030ef          	jal	a06c <__gedf2>
    6c80:	f6a048e3          	bgtz	a0,6bf0 <.L5>

00006c84 <.L13>:
    6c84:	fff00993          	li	s3,-1
    6c88:	0840006f          	j	6d0c <.L7>

00006c8c <.L6>:
    6c8c:	384000ef          	jal	7010 <__GI_fabs>
    6c90:	3ff307b7          	lui	a5,0x3ff30
    6c94:	00050913          	mv	s2,a0
    6c98:	00058413          	mv	s0,a1
    6c9c:	28f4f263          	bgeu	s1,a5,6f20 <.L8>
    6ca0:	3fe607b7          	lui	a5,0x3fe60
    6ca4:	0000ba97          	auipc	s5,0xb
    6ca8:	3c4a8a93          	add	s5,s5,964 # 12068 <.LC1>
    6cac:	22f4f463          	bgeu	s1,a5,6ed4 <.L9>
    6cb0:	00050613          	mv	a2,a0
    6cb4:	00058693          	mv	a3,a1
    6cb8:	4b4020ef          	jal	916c <__adddf3>
    6cbc:	000aa603          	lw	a2,0(s5)
    6cc0:	004aa683          	lw	a3,4(s5)
    6cc4:	275030ef          	jal	a738 <__subdf3>
    6cc8:	0000b797          	auipc	a5,0xb
    6ccc:	3a878793          	add	a5,a5,936 # 12070 <.LC4>
    6cd0:	0007a603          	lw	a2,0(a5)
    6cd4:	0047a683          	lw	a3,4(a5)
    6cd8:	00050993          	mv	s3,a0
    6cdc:	00058493          	mv	s1,a1
    6ce0:	00090513          	mv	a0,s2
    6ce4:	00040593          	mv	a1,s0
    6ce8:	484020ef          	jal	916c <__adddf3>
    6cec:	00050613          	mv	a2,a0
    6cf0:	00058693          	mv	a3,a1
    6cf4:	00098513          	mv	a0,s3
    6cf8:	00048593          	mv	a1,s1
    6cfc:	405020ef          	jal	9900 <__divdf3>
    6d00:	00050b93          	mv	s7,a0
    6d04:	00058413          	mv	s0,a1
    6d08:	00000993          	li	s3,0

00006d0c <.L7>:
    6d0c:	000b8613          	mv	a2,s7
    6d10:	00040693          	mv	a3,s0
    6d14:	000b8513          	mv	a0,s7
    6d18:	00040593          	mv	a1,s0
    6d1c:	42c030ef          	jal	a148 <__muldf3>
    6d20:	00050613          	mv	a2,a0
    6d24:	00058693          	mv	a3,a1
    6d28:	00050b13          	mv	s6,a0
    6d2c:	00058a93          	mv	s5,a1
    6d30:	418030ef          	jal	a148 <__muldf3>
    6d34:	0000b797          	auipc	a5,0xb
    6d38:	35478793          	add	a5,a5,852 # 12088 <.LC7>
    6d3c:	0007a603          	lw	a2,0(a5)
    6d40:	0047a683          	lw	a3,4(a5)
    6d44:	00050913          	mv	s2,a0
    6d48:	00058493          	mv	s1,a1
    6d4c:	3fc030ef          	jal	a148 <__muldf3>
    6d50:	0000b797          	auipc	a5,0xb
    6d54:	34078793          	add	a5,a5,832 # 12090 <.LC8>
    6d58:	0007a603          	lw	a2,0(a5)
    6d5c:	0047a683          	lw	a3,4(a5)
    6d60:	40c020ef          	jal	916c <__adddf3>
    6d64:	00090613          	mv	a2,s2
    6d68:	00048693          	mv	a3,s1
    6d6c:	3dc030ef          	jal	a148 <__muldf3>
    6d70:	0000b797          	auipc	a5,0xb
    6d74:	32878793          	add	a5,a5,808 # 12098 <.LC9>
    6d78:	0007a603          	lw	a2,0(a5)
    6d7c:	0047a683          	lw	a3,4(a5)
    6d80:	3ec020ef          	jal	916c <__adddf3>
    6d84:	00090613          	mv	a2,s2
    6d88:	00048693          	mv	a3,s1
    6d8c:	3bc030ef          	jal	a148 <__muldf3>
    6d90:	0000b797          	auipc	a5,0xb
    6d94:	31078793          	add	a5,a5,784 # 120a0 <.LC10>
    6d98:	0007a603          	lw	a2,0(a5)
    6d9c:	0047a683          	lw	a3,4(a5)
    6da0:	3cc020ef          	jal	916c <__adddf3>
    6da4:	00090613          	mv	a2,s2
    6da8:	00048693          	mv	a3,s1
    6dac:	39c030ef          	jal	a148 <__muldf3>
    6db0:	0000b797          	auipc	a5,0xb
    6db4:	2f878793          	add	a5,a5,760 # 120a8 <.LC11>
    6db8:	0007a603          	lw	a2,0(a5)
    6dbc:	0047a683          	lw	a3,4(a5)
    6dc0:	3ac020ef          	jal	916c <__adddf3>
    6dc4:	00090613          	mv	a2,s2
    6dc8:	00048693          	mv	a3,s1
    6dcc:	37c030ef          	jal	a148 <__muldf3>
    6dd0:	0000b797          	auipc	a5,0xb
    6dd4:	2e078793          	add	a5,a5,736 # 120b0 <.LC12>
    6dd8:	0007a603          	lw	a2,0(a5)
    6ddc:	0047a683          	lw	a3,4(a5)
    6de0:	38c020ef          	jal	916c <__adddf3>
    6de4:	000b0613          	mv	a2,s6
    6de8:	000a8693          	mv	a3,s5
    6dec:	35c030ef          	jal	a148 <__muldf3>
    6df0:	0000b797          	auipc	a5,0xb
    6df4:	2c878793          	add	a5,a5,712 # 120b8 <.LC13>
    6df8:	0007a603          	lw	a2,0(a5)
    6dfc:	0047a683          	lw	a3,4(a5)
    6e00:	00050b13          	mv	s6,a0
    6e04:	00058a93          	mv	s5,a1
    6e08:	00090513          	mv	a0,s2
    6e0c:	00048593          	mv	a1,s1
    6e10:	338030ef          	jal	a148 <__muldf3>
    6e14:	0000b797          	auipc	a5,0xb
    6e18:	2ac78793          	add	a5,a5,684 # 120c0 <.LC14>
    6e1c:	0007a603          	lw	a2,0(a5)
    6e20:	0047a683          	lw	a3,4(a5)
    6e24:	115030ef          	jal	a738 <__subdf3>
    6e28:	00090613          	mv	a2,s2
    6e2c:	00048693          	mv	a3,s1
    6e30:	318030ef          	jal	a148 <__muldf3>
    6e34:	0000b797          	auipc	a5,0xb
    6e38:	29478793          	add	a5,a5,660 # 120c8 <.LC15>
    6e3c:	0007a603          	lw	a2,0(a5)
    6e40:	0047a683          	lw	a3,4(a5)
    6e44:	0f5030ef          	jal	a738 <__subdf3>
    6e48:	00090613          	mv	a2,s2
    6e4c:	00048693          	mv	a3,s1
    6e50:	2f8030ef          	jal	a148 <__muldf3>
    6e54:	0000b797          	auipc	a5,0xb
    6e58:	27c78793          	add	a5,a5,636 # 120d0 <.LC16>
    6e5c:	0007a603          	lw	a2,0(a5)
    6e60:	0047a683          	lw	a3,4(a5)
    6e64:	0d5030ef          	jal	a738 <__subdf3>
    6e68:	00090613          	mv	a2,s2
    6e6c:	00048693          	mv	a3,s1
    6e70:	2d8030ef          	jal	a148 <__muldf3>
    6e74:	0000b797          	auipc	a5,0xb
    6e78:	26478793          	add	a5,a5,612 # 120d8 <.LC17>
    6e7c:	0007a603          	lw	a2,0(a5)
    6e80:	0047a683          	lw	a3,4(a5)
    6e84:	0b5030ef          	jal	a738 <__subdf3>
    6e88:	00090613          	mv	a2,s2
    6e8c:	00048693          	mv	a3,s1
    6e90:	2b8030ef          	jal	a148 <__muldf3>
    6e94:	00050613          	mv	a2,a0
    6e98:	00058693          	mv	a3,a1
    6e9c:	000b0513          	mv	a0,s6
    6ea0:	000a8593          	mv	a1,s5
    6ea4:	2c8020ef          	jal	916c <__adddf3>
    6ea8:	00040693          	mv	a3,s0
    6eac:	000b8613          	mv	a2,s7
    6eb0:	298030ef          	jal	a148 <__muldf3>
    6eb4:	fff00693          	li	a3,-1
    6eb8:	10d99263          	bne	s3,a3,6fbc <.L11>
    6ebc:	00050613          	mv	a2,a0
    6ec0:	00058693          	mv	a3,a1
    6ec4:	000b8513          	mv	a0,s7
    6ec8:	00040593          	mv	a1,s0
    6ecc:	06d030ef          	jal	a738 <__subdf3>
    6ed0:	d19ff06f          	j	6be8 <.L18>

00006ed4 <.L9>:
    6ed4:	000aa603          	lw	a2,0(s5)
    6ed8:	004aa683          	lw	a3,4(s5)
    6edc:	05d030ef          	jal	a738 <__subdf3>
    6ee0:	000aa603          	lw	a2,0(s5)
    6ee4:	004aa683          	lw	a3,4(s5)
    6ee8:	00050993          	mv	s3,a0
    6eec:	00058493          	mv	s1,a1
    6ef0:	00090513          	mv	a0,s2
    6ef4:	00040593          	mv	a1,s0
    6ef8:	274020ef          	jal	916c <__adddf3>
    6efc:	00050613          	mv	a2,a0
    6f00:	00058693          	mv	a3,a1
    6f04:	00098513          	mv	a0,s3
    6f08:	00048593          	mv	a1,s1
    6f0c:	1f5020ef          	jal	9900 <__divdf3>
    6f10:	00050b93          	mv	s7,a0
    6f14:	00058413          	mv	s0,a1
    6f18:	00100993          	li	s3,1
    6f1c:	df1ff06f          	j	6d0c <.L7>

00006f20 <.L8>:
    6f20:	400387b7          	lui	a5,0x40038
    6f24:	06f4f663          	bgeu	s1,a5,6f90 <.L10>
    6f28:	0000ba97          	auipc	s5,0xb
    6f2c:	150a8a93          	add	s5,s5,336 # 12078 <.LC5>
    6f30:	000aa603          	lw	a2,0(s5)
    6f34:	004aa683          	lw	a3,4(s5)
    6f38:	001030ef          	jal	a738 <__subdf3>
    6f3c:	000aa603          	lw	a2,0(s5)
    6f40:	004aa683          	lw	a3,4(s5)
    6f44:	00050993          	mv	s3,a0
    6f48:	00058493          	mv	s1,a1
    6f4c:	00090513          	mv	a0,s2
    6f50:	00040593          	mv	a1,s0
    6f54:	1f4030ef          	jal	a148 <__muldf3>
    6f58:	0000b797          	auipc	a5,0xb
    6f5c:	11078793          	add	a5,a5,272 # 12068 <.LC1>
    6f60:	0007a603          	lw	a2,0(a5)
    6f64:	0047a683          	lw	a3,4(a5)
    6f68:	204020ef          	jal	916c <__adddf3>
    6f6c:	00050613          	mv	a2,a0
    6f70:	00058693          	mv	a3,a1
    6f74:	00098513          	mv	a0,s3
    6f78:	00048593          	mv	a1,s1
    6f7c:	185020ef          	jal	9900 <__divdf3>
    6f80:	00050b93          	mv	s7,a0
    6f84:	00058413          	mv	s0,a1
    6f88:	00200993          	li	s3,2
    6f8c:	d81ff06f          	j	6d0c <.L7>

00006f90 <.L10>:
    6f90:	0000b797          	auipc	a5,0xb
    6f94:	0f078793          	add	a5,a5,240 # 12080 <.LC6>
    6f98:	00050613          	mv	a2,a0
    6f9c:	00058693          	mv	a3,a1
    6fa0:	0007a503          	lw	a0,0(a5)
    6fa4:	0047a583          	lw	a1,4(a5)
    6fa8:	00300993          	li	s3,3
    6fac:	155020ef          	jal	9900 <__divdf3>
    6fb0:	00050b93          	mv	s7,a0
    6fb4:	00058413          	mv	s0,a1
    6fb8:	d55ff06f          	j	6d0c <.L7>

00006fbc <.L11>:
    6fbc:	00399993          	sll	s3,s3,0x3
    6fc0:	0000b497          	auipc	s1,0xb
    6fc4:	90848493          	add	s1,s1,-1784 # 118c8 <atanhi>
    6fc8:	013484b3          	add	s1,s1,s3
    6fcc:	0204a603          	lw	a2,32(s1)
    6fd0:	0244a683          	lw	a3,36(s1)
    6fd4:	764030ef          	jal	a738 <__subdf3>
    6fd8:	000b8613          	mv	a2,s7
    6fdc:	00040693          	mv	a3,s0
    6fe0:	758030ef          	jal	a738 <__subdf3>
    6fe4:	00050613          	mv	a2,a0
    6fe8:	00058693          	mv	a3,a1
    6fec:	0004a503          	lw	a0,0(s1)
    6ff0:	0044a583          	lw	a1,4(s1)
    6ff4:	744030ef          	jal	a738 <__subdf3>
    6ff8:	00050b93          	mv	s7,a0
    6ffc:	00058413          	mv	s0,a1
    7000:	be0a58e3          	bgez	s4,6bf0 <.L5>
    7004:	80000437          	lui	s0,0x80000
    7008:	00b44433          	xor	s0,s0,a1
    700c:	be5ff06f          	j	6bf0 <.L5>

00007010 <__GI_fabs>:
    7010:	00159593          	sll	a1,a1,0x1
    7014:	00050713          	mv	a4,a0
    7018:	0015d793          	srl	a5,a1,0x1
    701c:	00070513          	mv	a0,a4
    7020:	00078593          	mv	a1,a5
    7024:	00008067          	ret

00007028 <__GI_sin>:
    7028:	fe010113          	add	sp,sp,-32
    702c:	00812c23          	sw	s0,24(sp)
    7030:	80000437          	lui	s0,0x80000
    7034:	fff40713          	add	a4,s0,-1 # 7fffffff <_ebss+0x7ffea10f>
    7038:	3fe926b7          	lui	a3,0x3fe92
    703c:	00112e23          	sw	ra,28(sp)
    7040:	00b77733          	and	a4,a4,a1
    7044:	1fb68693          	add	a3,a3,507 # 3fe921fb <_ebss+0x3fe7c30b>
    7048:	02e6e063          	bltu	a3,a4,7068 <.L2>
    704c:	01812403          	lw	s0,24(sp)
    7050:	01c12083          	lw	ra,28(sp)
    7054:	00000713          	li	a4,0
    7058:	00000613          	li	a2,0
    705c:	00000693          	li	a3,0
    7060:	02010113          	add	sp,sp,32
    7064:	2190106f          	j	8a7c <__kernel_sin>

00007068 <.L2>:
    7068:	7ff006b7          	lui	a3,0x7ff00
    706c:	02d76063          	bltu	a4,a3,708c <.L3>
    7070:	00050613          	mv	a2,a0
    7074:	00058693          	mv	a3,a1
    7078:	6c0030ef          	jal	a738 <__subdf3>

0000707c <.L1>:
    707c:	01c12083          	lw	ra,28(sp)
    7080:	01812403          	lw	s0,24(sp)
    7084:	02010113          	add	sp,sp,32
    7088:	00008067          	ret

0000708c <.L3>:
    708c:	00010613          	mv	a2,sp
    7090:	684000ef          	jal	7714 <__ieee754_rem_pio2>
    7094:	00357793          	and	a5,a0,3
    7098:	00100713          	li	a4,1
    709c:	00812603          	lw	a2,8(sp)
    70a0:	00c12683          	lw	a3,12(sp)
    70a4:	00012503          	lw	a0,0(sp)
    70a8:	00412583          	lw	a1,4(sp)
    70ac:	00e78e63          	beq	a5,a4,70c8 <.L5>
    70b0:	00200713          	li	a4,2
    70b4:	00e78e63          	beq	a5,a4,70d0 <.L6>
    70b8:	02079463          	bnez	a5,70e0 <.L7>
    70bc:	00100713          	li	a4,1
    70c0:	1bd010ef          	jal	8a7c <__kernel_sin>
    70c4:	fb9ff06f          	j	707c <.L1>

000070c8 <.L5>:
    70c8:	44d000ef          	jal	7d14 <__kernel_cos>
    70cc:	fb1ff06f          	j	707c <.L1>

000070d0 <.L6>:
    70d0:	00100713          	li	a4,1
    70d4:	1a9010ef          	jal	8a7c <__kernel_sin>

000070d8 <.L10>:
    70d8:	00b445b3          	xor	a1,s0,a1
    70dc:	fa1ff06f          	j	707c <.L1>

000070e0 <.L7>:
    70e0:	435000ef          	jal	7d14 <__kernel_cos>
    70e4:	ff5ff06f          	j	70d8 <.L10>

000070e8 <__fcntl_nocancel>:
    70e8:	ff458793          	add	a5,a1,-12 # ffff4 <_ebss+0xea104>
    70ec:	00200713          	li	a4,2
    70f0:	02f76663          	bltu	a4,a5,711c <.L2>
    70f4:	01900893          	li	a7,25
    70f8:	00000073          	ecall
    70fc:	fffff7b7          	lui	a5,0xfffff
    7100:	02a7f863          	bgeu	a5,a0,7130 <.L1>
    7104:	40a00533          	neg	a0,a0
    7108:	00009797          	auipc	a5,0x9
    710c:	18c7a783          	lw	a5,396(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    7110:	00a7a023          	sw	a0,0(a5)

00007114 <.L4>:
    7114:	fff00513          	li	a0,-1
    7118:	00008067          	ret

0000711c <.L2>:
    711c:	00009797          	auipc	a5,0x9
    7120:	1787a783          	lw	a5,376(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    7124:	02600713          	li	a4,38
    7128:	00e7a023          	sw	a4,0(a5)
    712c:	fe9ff06f          	j	7114 <.L4>

00007130 <.L1>:
    7130:	00008067          	ret

00007134 <__GI_fcntl>:
    7134:	fd010113          	add	sp,sp,-48
    7138:	02f12223          	sw	a5,36(sp)
    713c:	01810793          	add	a5,sp,24
    7140:	03112623          	sw	a7,44(sp)
    7144:	00c12c23          	sw	a2,24(sp)
    7148:	00d12e23          	sw	a3,28(sp)
    714c:	02e12023          	sw	a4,32(sp)
    7150:	03012423          	sw	a6,40(sp)
    7154:	00f12623          	sw	a5,12(sp)
    7158:	01900893          	li	a7,25
    715c:	00000073          	ecall
    7160:	fffff7b7          	lui	a5,0xfffff
    7164:	00a7fc63          	bgeu	a5,a0,717c <.L5>
    7168:	40a00533          	neg	a0,a0
    716c:	00009797          	auipc	a5,0x9
    7170:	1287a783          	lw	a5,296(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    7174:	00a7a023          	sw	a0,0(a5)
    7178:	fff00513          	li	a0,-1

0000717c <.L5>:
    717c:	03010113          	add	sp,sp,48
    7180:	00008067          	ret

00007184 <__GI__exit>:
    7184:	00050713          	mv	a4,a0
    7188:	fffff637          	lui	a2,0xfffff
    718c:	00009697          	auipc	a3,0x9
    7190:	1086a683          	lw	a3,264(a3) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>

00007194 <.L2>:
    7194:	00070513          	mv	a0,a4
    7198:	05d00893          	li	a7,93
    719c:	00000073          	ecall
    71a0:	fea67ae3          	bgeu	a2,a0,7194 <.L2>
    71a4:	40a007b3          	neg	a5,a0
    71a8:	00f6a023          	sw	a5,0(a3)
    71ac:	fe9ff06f          	j	7194 <.L2>

000071b0 <__GI_fstat64>:
    71b0:	05000893          	li	a7,80
    71b4:	00000073          	ecall
    71b8:	fffff7b7          	lui	a5,0xfffff
    71bc:	00a7fc63          	bgeu	a5,a0,71d4 <.L1>
    71c0:	40a00533          	neg	a0,a0
    71c4:	00009797          	auipc	a5,0x9
    71c8:	0d07a783          	lw	a5,208(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    71cc:	00a7a023          	sw	a0,0(a5)
    71d0:	fff00513          	li	a0,-1

000071d4 <.L1>:
    71d4:	00008067          	ret

000071d8 <__getdents>:
    71d8:	fd010113          	add	sp,sp,-48
    71dc:	01812423          	sw	s8,8(sp)
    71e0:	00050c13          	mv	s8,a0
    71e4:	00060513          	mv	a0,a2
    71e8:	01312e23          	sw	s3,28(sp)
    71ec:	01412c23          	sw	s4,24(sp)
    71f0:	01512a23          	sw	s5,20(sp)
    71f4:	00060a13          	mv	s4,a2
    71f8:	00058a93          	mv	s5,a1
    71fc:	02112623          	sw	ra,44(sp)
    7200:	02812423          	sw	s0,40(sp)
    7204:	02912223          	sw	s1,36(sp)
    7208:	03212023          	sw	s2,32(sp)
    720c:	01612823          	sw	s6,16(sp)
    7210:	01712623          	sw	s7,12(sp)
    7214:	01912223          	sw	s9,4(sp)
    7218:	8b0fc0ef          	jal	32c8 <malloc>
    721c:	00050993          	mv	s3,a0
    7220:	00098593          	mv	a1,s3
    7224:	000c0513          	mv	a0,s8
    7228:	000a0613          	mv	a2,s4
    722c:	03d00893          	li	a7,61
    7230:	00000073          	ecall
    7234:	fffff737          	lui	a4,0xfffff
    7238:	0ea77c63          	bgeu	a4,a0,7330 <.L9>
    723c:	40a007b3          	neg	a5,a0
    7240:	00009717          	auipc	a4,0x9
    7244:	05472703          	lw	a4,84(a4) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    7248:	00098513          	mv	a0,s3
    724c:	00f72023          	sw	a5,0(a4)
    7250:	a90fc0ef          	jal	34e0 <free>

00007254 <.L3>:
    7254:	fff00513          	li	a0,-1
    7258:	0a40006f          	j	72fc <.L1>

0000725c <.L5>:
    725c:	00098513          	mv	a0,s3
    7260:	a80fc0ef          	jal	34e0 <free>
    7264:	00009797          	auipc	a5,0x9
    7268:	0307a783          	lw	a5,48(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    726c:	01600713          	li	a4,22
    7270:	00e7a023          	sw	a4,0(a5)
    7274:	fe1ff06f          	j	7254 <.L3>

00007278 <.L4>:
    7278:	00492783          	lw	a5,4(s2)
    727c:	00892b03          	lw	s6,8(s2)
    7280:	00c92b83          	lw	s7,12(s2)
    7284:	00092703          	lw	a4,0(s2)
    7288:	00f42223          	sw	a5,4(s0)
    728c:	01294783          	lbu	a5,18(s2)
    7290:	00e42023          	sw	a4,0(s0)
    7294:	01642423          	sw	s6,8(s0)
    7298:	00f40923          	sb	a5,18(s0)
    729c:	01742623          	sw	s7,12(s0)
    72a0:	00d41823          	sh	a3,16(s0)
    72a4:	01390593          	add	a1,s2,19
    72a8:	01340513          	add	a0,s0,19
    72ac:	fed60613          	add	a2,a2,-19 # ffffefed <_ebss+0xfffe90fd>
    72b0:	841fb0ef          	jal	2af0 <__GI_memcpy>
    72b4:	01095783          	lhu	a5,16(s2)
    72b8:	000c8413          	mv	s0,s9
    72bc:	00f90933          	add	s2,s2,a5

000072c0 <.L2>:
    72c0:	02997863          	bgeu	s2,s1,72f0 <.L8>
    72c4:	01095603          	lhu	a2,16(s2)
    72c8:	00760693          	add	a3,a2,7
    72cc:	ff86f693          	and	a3,a3,-8
    72d0:	00d40cb3          	add	s9,s0,a3
    72d4:	fb9a72e3          	bgeu	s4,s9,7278 <.L4>
    72d8:	00000693          	li	a3,0
    72dc:	000b0593          	mv	a1,s6
    72e0:	000b8613          	mv	a2,s7
    72e4:	000c0513          	mv	a0,s8
    72e8:	57d010ef          	jal	9064 <__GI_lseek64>
    72ec:	f75408e3          	beq	s0,s5,725c <.L5>

000072f0 <.L8>:
    72f0:	00098513          	mv	a0,s3
    72f4:	9ecfc0ef          	jal	34e0 <free>
    72f8:	41540533          	sub	a0,s0,s5

000072fc <.L1>:
    72fc:	02c12083          	lw	ra,44(sp)
    7300:	02812403          	lw	s0,40(sp)
    7304:	02412483          	lw	s1,36(sp)
    7308:	02012903          	lw	s2,32(sp)
    730c:	01c12983          	lw	s3,28(sp)
    7310:	01812a03          	lw	s4,24(sp)
    7314:	01412a83          	lw	s5,20(sp)
    7318:	01012b03          	lw	s6,16(sp)
    731c:	00c12b83          	lw	s7,12(sp)
    7320:	00812c03          	lw	s8,8(sp)
    7324:	00412c83          	lw	s9,4(sp)
    7328:	03010113          	add	sp,sp,48
    732c:	00008067          	ret

00007330 <.L9>:
    7330:	00098913          	mv	s2,s3
    7334:	000a8413          	mv	s0,s5
    7338:	fff00b13          	li	s6,-1
    733c:	fff00b93          	li	s7,-1
    7340:	00a984b3          	add	s1,s3,a0
    7344:	014a8a33          	add	s4,s5,s4
    7348:	f79ff06f          	j	72c0 <.L2>

0000734c <__GI_fseek>:
    734c:	00060693          	mv	a3,a2
    7350:	41f5d613          	sra	a2,a1,0x1f
    7354:	0040006f          	j	7358 <__GI_fseeko64>

00007358 <__GI_fseeko64>:
    7358:	fd010113          	add	sp,sp,-48
    735c:	02112623          	sw	ra,44(sp)
    7360:	02812423          	sw	s0,40(sp)
    7364:	00b12c23          	sw	a1,24(sp)
    7368:	00c12e23          	sw	a2,28(sp)
    736c:	00200793          	li	a5,2
    7370:	02d7f463          	bgeu	a5,a3,7398 <.L2>
    7374:	00009797          	auipc	a5,0x9
    7378:	f207a783          	lw	a5,-224(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    737c:	01600713          	li	a4,22
    7380:	00e7a023          	sw	a4,0(a5)

00007384 <.L3>:
    7384:	fff00513          	li	a0,-1

00007388 <.L1>:
    7388:	02c12083          	lw	ra,44(sp)
    738c:	02812403          	lw	s0,40(sp)
    7390:	03010113          	add	sp,sp,48
    7394:	00008067          	ret

00007398 <.L2>:
    7398:	00055783          	lhu	a5,0(a0)
    739c:	00050413          	mv	s0,a0
    73a0:	00068613          	mv	a2,a3
    73a4:	0407f793          	and	a5,a5,64
    73a8:	06079863          	bnez	a5,7418 <.L4>

000073ac <.L7>:
    73ac:	00100793          	li	a5,1
    73b0:	00f61e63          	bne	a2,a5,73cc <.L5>
    73b4:	01810593          	add	a1,sp,24
    73b8:	00040513          	mv	a0,s0
    73bc:	00c12623          	sw	a2,12(sp)
    73c0:	120000ef          	jal	74e0 <__stdio_adjust_position>
    73c4:	00c12603          	lw	a2,12(sp)
    73c8:	fa054ee3          	bltz	a0,7384 <.L3>

000073cc <.L5>:
    73cc:	00442703          	lw	a4,4(s0)
    73d0:	ffe00793          	li	a5,-2
    73d4:	04f71c63          	bne	a4,a5,742c <.L20>
    73d8:	03042783          	lw	a5,48(s0)
    73dc:	fa0784e3          	beqz	a5,7384 <.L3>
    73e0:	02442503          	lw	a0,36(s0)
    73e4:	01810593          	add	a1,sp,24
    73e8:	000780e7          	jalr	a5

000073ec <.L12>:
    73ec:	f8054ce3          	bltz	a0,7384 <.L3>
    73f0:	00045783          	lhu	a5,0(s0)
    73f4:	00000513          	li	a0,0
    73f8:	fb87f793          	and	a5,a5,-72
    73fc:	00f41023          	sh	a5,0(s0)
    7400:	00842783          	lw	a5,8(s0)
    7404:	00f42823          	sw	a5,16(s0)
    7408:	00f42a23          	sw	a5,20(s0)
    740c:	00f42c23          	sw	a5,24(s0)
    7410:	00f42e23          	sw	a5,28(s0)
    7414:	f75ff06f          	j	7388 <.L1>

00007418 <.L4>:
    7418:	00d12623          	sw	a3,12(sp)
    741c:	d7cfa0ef          	jal	1998 <__stdio_wcommit>
    7420:	00c12603          	lw	a2,12(sp)
    7424:	f80504e3          	beqz	a0,73ac <.L7>
    7428:	f5dff06f          	j	7384 <.L3>

0000742c <.L20>:
    742c:	01810593          	add	a1,sp,24
    7430:	00040513          	mv	a0,s0
    7434:	1ec000ef          	jal	7620 <__stdio_seek>
    7438:	fb5ff06f          	j	73ec <.L12>

0000743c <__stdio_READ>:
    743c:	00055783          	lhu	a5,0(a0)
    7440:	0047f793          	and	a5,a5,4
    7444:	08079a63          	bnez	a5,74d8 <.L13>
    7448:	ff010113          	add	sp,sp,-16
    744c:	800007b7          	lui	a5,0x80000
    7450:	00812423          	sw	s0,8(sp)
    7454:	00912223          	sw	s1,4(sp)
    7458:	00112623          	sw	ra,12(sp)
    745c:	fff78793          	add	a5,a5,-1 # 7fffffff <_ebss+0x7ffea10f>
    7460:	00050413          	mv	s0,a0
    7464:	00060493          	mv	s1,a2
    7468:	00c7f463          	bgeu	a5,a2,7470 <.L3>
    746c:	00078493          	mv	s1,a5

00007470 <.L3>:
    7470:	00442503          	lw	a0,4(s0)
    7474:	ffe00793          	li	a5,-2
    7478:	04f51663          	bne	a0,a5,74c4 <.L4>
    747c:	02842783          	lw	a5,40(s0)
    7480:	02078063          	beqz	a5,74a0 <.L5>
    7484:	02442503          	lw	a0,36(s0)
    7488:	00048613          	mv	a2,s1
    748c:	000780e7          	jalr	a5

00007490 <.L6>:
    7490:	04a04063          	bgtz	a0,74d0 <.L7>
    7494:	00045783          	lhu	a5,0(s0)
    7498:	0047e793          	or	a5,a5,4
    749c:	00050663          	beqz	a0,74a8 <.L17>

000074a0 <.L5>:
    74a0:	00045783          	lhu	a5,0(s0)
    74a4:	0087e793          	or	a5,a5,8

000074a8 <.L17>:
    74a8:	00f41023          	sh	a5,0(s0)
    74ac:	00000513          	li	a0,0

000074b0 <.L8>:
    74b0:	00c12083          	lw	ra,12(sp)
    74b4:	00812403          	lw	s0,8(sp)
    74b8:	00412483          	lw	s1,4(sp)
    74bc:	01010113          	add	sp,sp,16
    74c0:	00008067          	ret

000074c4 <.L4>:
    74c4:	00048613          	mv	a2,s1
    74c8:	349010ef          	jal	9010 <__GI_read>
    74cc:	fc5ff06f          	j	7490 <.L6>

000074d0 <.L7>:
    74d0:	fea4f0e3          	bgeu	s1,a0,74b0 <.L8>
    74d4:	190000ef          	jal	7664 <__GI_abort>

000074d8 <.L13>:
    74d8:	00000513          	li	a0,0
    74dc:	00008067          	ret

000074e0 <__stdio_adjust_position>:
    74e0:	00055783          	lhu	a5,0(a0)
    74e4:	00000713          	li	a4,0
    74e8:	0037f693          	and	a3,a5,3
    74ec:	00068463          	beqz	a3,74f4 <.L2>
    74f0:	fff68713          	add	a4,a3,-1

000074f4 <.L2>:
    74f4:	0407f793          	and	a5,a5,64
    74f8:	06078063          	beqz	a5,7558 <.L3>
    74fc:	00852783          	lw	a5,8(a0)

00007500 <.L4>:
    7500:	01052683          	lw	a3,16(a0)
    7504:	0045a603          	lw	a2,4(a1)
    7508:	40d78533          	sub	a0,a5,a3
    750c:	00e50533          	add	a0,a0,a4
    7510:	0005a703          	lw	a4,0(a1)
    7514:	41f55793          	sra	a5,a0,0x1f
    7518:	40f607b3          	sub	a5,a2,a5
    751c:	40a706b3          	sub	a3,a4,a0
    7520:	00d73833          	sltu	a6,a4,a3
    7524:	410787b3          	sub	a5,a5,a6
    7528:	00d5a023          	sw	a3,0(a1)
    752c:	00f5a223          	sw	a5,4(a1)
    7530:	00f64663          	blt	a2,a5,753c <.L9>
    7534:	00c79663          	bne	a5,a2,7540 <.L5>
    7538:	00d77463          	bgeu	a4,a3,7540 <.L5>

0000753c <.L9>:
    753c:	40a00533          	neg	a0,a0

00007540 <.L5>:
    7540:	00055a63          	bgez	a0,7554 <.L1>
    7544:	00009797          	auipc	a5,0x9
    7548:	d507a783          	lw	a5,-688(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    754c:	04b00713          	li	a4,75
    7550:	00e7a023          	sw	a4,0(a5)

00007554 <.L1>:
    7554:	00008067          	ret

00007558 <.L3>:
    7558:	01452783          	lw	a5,20(a0)
    755c:	fa5ff06f          	j	7500 <.L4>

00007560 <__stdio_rfill>:
    7560:	00852583          	lw	a1,8(a0)
    7564:	00c52603          	lw	a2,12(a0)
    7568:	ff010113          	add	sp,sp,-16
    756c:	00812423          	sw	s0,8(sp)
    7570:	40b60633          	sub	a2,a2,a1
    7574:	00112623          	sw	ra,12(sp)
    7578:	00050413          	mv	s0,a0
    757c:	ec1ff0ef          	jal	743c <__stdio_READ>
    7580:	00842783          	lw	a5,8(s0)
    7584:	00c12083          	lw	ra,12(sp)
    7588:	00f42823          	sw	a5,16(s0)
    758c:	00a787b3          	add	a5,a5,a0
    7590:	00f42a23          	sw	a5,20(s0)
    7594:	00812403          	lw	s0,8(sp)
    7598:	01010113          	add	sp,sp,16
    759c:	00008067          	ret

000075a0 <__stdio_trans2r>:
    75a0:	00055783          	lhu	a5,0(a0)
    75a4:	ff010113          	add	sp,sp,-16
    75a8:	00812423          	sw	s0,8(sp)
    75ac:	00112623          	sw	ra,12(sp)
    75b0:	0107f713          	and	a4,a5,16
    75b4:	00050413          	mv	s0,a0
    75b8:	02070a63          	beqz	a4,75ec <.L2>
    75bc:	00009797          	auipc	a5,0x9
    75c0:	cd87a783          	lw	a5,-808(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    75c4:	00900713          	li	a4,9
    75c8:	00e7a023          	sw	a4,0(a5)

000075cc <.L3>:
    75cc:	00045783          	lhu	a5,0(s0)
    75d0:	fff00513          	li	a0,-1
    75d4:	0087e793          	or	a5,a5,8

000075d8 <.L4>:
    75d8:	00c12083          	lw	ra,12(sp)
    75dc:	00f41023          	sh	a5,0(s0)
    75e0:	00812403          	lw	s0,8(sp)
    75e4:	01010113          	add	sp,sp,16
    75e8:	00008067          	ret

000075ec <.L2>:
    75ec:	0407f793          	and	a5,a5,64
    75f0:	02078063          	beqz	a5,7610 <.L5>
    75f4:	ba4fa0ef          	jal	1998 <__stdio_wcommit>
    75f8:	fc051ae3          	bnez	a0,75cc <.L3>
    75fc:	00842783          	lw	a5,8(s0)
    7600:	00f42e23          	sw	a5,28(s0)
    7604:	00045783          	lhu	a5,0(s0)
    7608:	fbf7f793          	and	a5,a5,-65
    760c:	00f41023          	sh	a5,0(s0)

00007610 <.L5>:
    7610:	00045783          	lhu	a5,0(s0)
    7614:	00000513          	li	a0,0
    7618:	0017e793          	or	a5,a5,1
    761c:	fbdff06f          	j	75d8 <.L4>

00007620 <__stdio_seek>:
    7620:	ff010113          	add	sp,sp,-16
    7624:	00812423          	sw	s0,8(sp)
    7628:	00058413          	mv	s0,a1
    762c:	00060693          	mv	a3,a2
    7630:	0005a583          	lw	a1,0(a1)
    7634:	00442603          	lw	a2,4(s0)
    7638:	00452503          	lw	a0,4(a0)
    763c:	00112623          	sw	ra,12(sp)
    7640:	225010ef          	jal	9064 <__GI_lseek64>
    7644:	0005c863          	bltz	a1,7654 <.L1>
    7648:	00a42023          	sw	a0,0(s0)
    764c:	00b42223          	sw	a1,4(s0)
    7650:	00000513          	li	a0,0

00007654 <.L1>:
    7654:	00c12083          	lw	ra,12(sp)
    7658:	00812403          	lw	s0,8(sp)
    765c:	01010113          	add	sp,sp,16
    7660:	00008067          	ret

00007664 <__GI_abort>:
    7664:	fd010113          	add	sp,sp,-48
    7668:	02000793          	li	a5,32
    766c:	00000613          	li	a2,0
    7670:	00410593          	add	a1,sp,4
    7674:	00100513          	li	a0,1
    7678:	02812423          	sw	s0,40(sp)
    767c:	00f12223          	sw	a5,4(sp)
    7680:	02112623          	sw	ra,44(sp)
    7684:	02912223          	sw	s1,36(sp)
    7688:	00012423          	sw	zero,8(sp)
    768c:	0000e417          	auipc	s0,0xe
    7690:	6ec40413          	add	s0,s0,1772 # 15d78 <been_there_done_that>
    7694:	1a5010ef          	jal	9038 <__GI_sigprocmask>
    7698:	00042783          	lw	a5,0(s0)
    769c:	00079a63          	bnez	a5,76b0 <.L2>
    76a0:	00100793          	li	a5,1
    76a4:	00f42023          	sw	a5,0(s0)

000076a8 <.L3>:
    76a8:	00600513          	li	a0,6
    76ac:	221010ef          	jal	90cc <__GI_raise>

000076b0 <.L2>:
    76b0:	00042783          	lw	a5,0(s0)
    76b4:	00100713          	li	a4,1
    76b8:	04e79063          	bne	a5,a4,76f8 <.L4>
    76bc:	00c10493          	add	s1,sp,12
    76c0:	00200793          	li	a5,2
    76c4:	01400613          	li	a2,20
    76c8:	00000593          	li	a1,0
    76cc:	00048513          	mv	a0,s1
    76d0:	00f42023          	sw	a5,0(s0)
    76d4:	ec4fb0ef          	jal	2d98 <__GI_memset>
    76d8:	fff00793          	li	a5,-1
    76dc:	00000613          	li	a2,0
    76e0:	00048593          	mv	a1,s1
    76e4:	00600513          	li	a0,6
    76e8:	00f12c23          	sw	a5,24(sp)
    76ec:	00f12e23          	sw	a5,28(sp)
    76f0:	1d5010ef          	jal	90c4 <__GI_sigaction>
    76f4:	fb5ff06f          	j	76a8 <.L3>

000076f8 <.L4>:
    76f8:	ffe78793          	add	a5,a5,-2
    76fc:	00f76a63          	bltu	a4,a5,7710 <.L5>
    7700:	00400793          	li	a5,4
    7704:	07f00513          	li	a0,127
    7708:	00f42023          	sw	a5,0(s0)
    770c:	a79ff0ef          	jal	7184 <__GI__exit>

00007710 <.L5>:
    7710:	0000006f          	j	7710 <.L5>

00007714 <__ieee754_rem_pio2>:
    7714:	fa010113          	add	sp,sp,-96
    7718:	04912a23          	sw	s1,84(sp)
    771c:	3fe926b7          	lui	a3,0x3fe92
    7720:	00159493          	sll	s1,a1,0x1
    7724:	04812c23          	sw	s0,88(sp)
    7728:	04112e23          	sw	ra,92(sp)
    772c:	05212823          	sw	s2,80(sp)
    7730:	05312623          	sw	s3,76(sp)
    7734:	05412423          	sw	s4,72(sp)
    7738:	05512223          	sw	s5,68(sp)
    773c:	05612023          	sw	s6,64(sp)
    7740:	03712e23          	sw	s7,60(sp)
    7744:	03812c23          	sw	s8,56(sp)
    7748:	03912a23          	sw	s9,52(sp)
    774c:	03a12823          	sw	s10,48(sp)
    7750:	03b12623          	sw	s11,44(sp)
    7754:	0014d493          	srl	s1,s1,0x1
    7758:	1fb68693          	add	a3,a3,507 # 3fe921fb <_ebss+0x3fe7c30b>
    775c:	00060413          	mv	s0,a2
    7760:	0296e263          	bltu	a3,s1,7784 <.L2>
    7764:	00000713          	li	a4,0
    7768:	00000793          	li	a5,0
    776c:	00a42023          	sw	a0,0(s0)
    7770:	00b42223          	sw	a1,4(s0)
    7774:	00e42423          	sw	a4,8(s0)
    7778:	00f42623          	sw	a5,12(s0)

0000777c <.L3>:
    777c:	00000913          	li	s2,0
    7780:	0b40006f          	j	7834 <.L1>

00007784 <.L2>:
    7784:	4002e6b7          	lui	a3,0x4002e
    7788:	97b68693          	add	a3,a3,-1669 # 4002d97b <_ebss+0x40017a8b>
    778c:	00058c93          	mv	s9,a1
    7790:	1696ee63          	bltu	a3,s1,790c <.L4>
    7794:	0000b797          	auipc	a5,0xb
    7798:	94c78793          	add	a5,a5,-1716 # 120e0 <.LC0>
    779c:	0cb05c63          	blez	a1,7874 <.L5>
    77a0:	0007a603          	lw	a2,0(a5)
    77a4:	0047a683          	lw	a3,4(a5)
    77a8:	0000ba97          	auipc	s5,0xb
    77ac:	940a8a93          	add	s5,s5,-1728 # 120e8 <.LC1>
    77b0:	789020ef          	jal	a738 <__subdf3>
    77b4:	3ff927b7          	lui	a5,0x3ff92
    77b8:	1fb78793          	add	a5,a5,507 # 3ff921fb <_ebss+0x3ff7c30b>
    77bc:	00050a13          	mv	s4,a0
    77c0:	00058993          	mv	s3,a1
    77c4:	02f49463          	bne	s1,a5,77ec <.L22>
    77c8:	0000b797          	auipc	a5,0xb
    77cc:	92878793          	add	a5,a5,-1752 # 120f0 <.LC2>
    77d0:	0007a603          	lw	a2,0(a5)
    77d4:	0047a683          	lw	a3,4(a5)
    77d8:	0000ba97          	auipc	s5,0xb
    77dc:	920a8a93          	add	s5,s5,-1760 # 120f8 <.LC3>
    77e0:	759020ef          	jal	a738 <__subdf3>
    77e4:	00050a13          	mv	s4,a0
    77e8:	00058993          	mv	s3,a1

000077ec <.L22>:
    77ec:	000aa603          	lw	a2,0(s5)
    77f0:	004aa683          	lw	a3,4(s5)
    77f4:	745020ef          	jal	a738 <__subdf3>
    77f8:	00050913          	mv	s2,a0
    77fc:	00050613          	mv	a2,a0
    7800:	00058693          	mv	a3,a1
    7804:	00058493          	mv	s1,a1
    7808:	000a0513          	mv	a0,s4
    780c:	00098593          	mv	a1,s3
    7810:	729020ef          	jal	a738 <__subdf3>
    7814:	000aa603          	lw	a2,0(s5)
    7818:	004aa683          	lw	a3,4(s5)
    781c:	71d020ef          	jal	a738 <__subdf3>
    7820:	00a42423          	sw	a0,8(s0)
    7824:	01242023          	sw	s2,0(s0)
    7828:	00942223          	sw	s1,4(s0)
    782c:	00b42623          	sw	a1,12(s0)
    7830:	00100913          	li	s2,1

00007834 <.L1>:
    7834:	05c12083          	lw	ra,92(sp)
    7838:	05812403          	lw	s0,88(sp)
    783c:	05412483          	lw	s1,84(sp)
    7840:	04c12983          	lw	s3,76(sp)
    7844:	04812a03          	lw	s4,72(sp)
    7848:	04412a83          	lw	s5,68(sp)
    784c:	04012b03          	lw	s6,64(sp)
    7850:	03c12b83          	lw	s7,60(sp)
    7854:	03812c03          	lw	s8,56(sp)
    7858:	03412c83          	lw	s9,52(sp)
    785c:	03012d03          	lw	s10,48(sp)
    7860:	02c12d83          	lw	s11,44(sp)
    7864:	00090513          	mv	a0,s2
    7868:	05012903          	lw	s2,80(sp)
    786c:	06010113          	add	sp,sp,96
    7870:	00008067          	ret

00007874 <.L5>:
    7874:	0007a603          	lw	a2,0(a5)
    7878:	0047a683          	lw	a3,4(a5)
    787c:	0000ba97          	auipc	s5,0xb
    7880:	86ca8a93          	add	s5,s5,-1940 # 120e8 <.LC1>
    7884:	0e9010ef          	jal	916c <__adddf3>
    7888:	3ff927b7          	lui	a5,0x3ff92
    788c:	1fb78793          	add	a5,a5,507 # 3ff921fb <_ebss+0x3ff7c30b>
    7890:	00050a13          	mv	s4,a0
    7894:	00058993          	mv	s3,a1
    7898:	02f49463          	bne	s1,a5,78c0 <.L23>
    789c:	0000b797          	auipc	a5,0xb
    78a0:	85478793          	add	a5,a5,-1964 # 120f0 <.LC2>
    78a4:	0007a603          	lw	a2,0(a5)
    78a8:	0047a683          	lw	a3,4(a5)
    78ac:	0000ba97          	auipc	s5,0xb
    78b0:	84ca8a93          	add	s5,s5,-1972 # 120f8 <.LC3>
    78b4:	0b9010ef          	jal	916c <__adddf3>
    78b8:	00050a13          	mv	s4,a0
    78bc:	00058993          	mv	s3,a1

000078c0 <.L23>:
    78c0:	000aa603          	lw	a2,0(s5)
    78c4:	004aa683          	lw	a3,4(s5)
    78c8:	0a5010ef          	jal	916c <__adddf3>
    78cc:	00050913          	mv	s2,a0
    78d0:	00050613          	mv	a2,a0
    78d4:	00058693          	mv	a3,a1
    78d8:	00058493          	mv	s1,a1
    78dc:	000a0513          	mv	a0,s4
    78e0:	00098593          	mv	a1,s3
    78e4:	655020ef          	jal	a738 <__subdf3>
    78e8:	000aa603          	lw	a2,0(s5)
    78ec:	004aa683          	lw	a3,4(s5)
    78f0:	07d010ef          	jal	916c <__adddf3>
    78f4:	00a42423          	sw	a0,8(s0)
    78f8:	01242023          	sw	s2,0(s0)
    78fc:	00942223          	sw	s1,4(s0)
    7900:	00b42623          	sw	a1,12(s0)
    7904:	fff00913          	li	s2,-1
    7908:	f2dff06f          	j	7834 <.L1>

0000790c <.L4>:
    790c:	413926b7          	lui	a3,0x41392
    7910:	1fb68693          	add	a3,a3,507 # 413921fb <_ebss+0x4137c30b>
    7914:	2c96ea63          	bltu	a3,s1,7be8 <.L11>
    7918:	ef8ff0ef          	jal	7010 <__GI_fabs>
    791c:	0000a797          	auipc	a5,0xa
    7920:	7e478793          	add	a5,a5,2020 # 12100 <.LC4>
    7924:	0007a603          	lw	a2,0(a5)
    7928:	0047a683          	lw	a3,4(a5)
    792c:	00050a13          	mv	s4,a0
    7930:	00058993          	mv	s3,a1
    7934:	015020ef          	jal	a148 <__muldf3>
    7938:	0000a797          	auipc	a5,0xa
    793c:	7d078793          	add	a5,a5,2000 # 12108 <.LC2>
    7940:	0007a603          	lw	a2,0(a5)
    7944:	0047a683          	lw	a3,4(a5)
    7948:	025010ef          	jal	916c <__adddf3>
    794c:	594030ef          	jal	aee0 <__fixdfsi>
    7950:	00050913          	mv	s2,a0
    7954:	60c030ef          	jal	af60 <__floatsidf>
    7958:	0000a797          	auipc	a5,0xa
    795c:	78878793          	add	a5,a5,1928 # 120e0 <.LC0>
    7960:	0007a603          	lw	a2,0(a5)
    7964:	0047a683          	lw	a3,4(a5)
    7968:	00050c13          	mv	s8,a0
    796c:	00058b93          	mv	s7,a1
    7970:	7d8020ef          	jal	a148 <__muldf3>
    7974:	00050613          	mv	a2,a0
    7978:	00058693          	mv	a3,a1
    797c:	000a0513          	mv	a0,s4
    7980:	00098593          	mv	a1,s3
    7984:	5b5020ef          	jal	a738 <__subdf3>
    7988:	0000a797          	auipc	a5,0xa
    798c:	76078793          	add	a5,a5,1888 # 120e8 <.LC1>
    7990:	0007a603          	lw	a2,0(a5)
    7994:	0047a683          	lw	a3,4(a5)
    7998:	00050b13          	mv	s6,a0
    799c:	00058a93          	mv	s5,a1
    79a0:	000c0513          	mv	a0,s8
    79a4:	000b8593          	mv	a1,s7
    79a8:	7a0020ef          	jal	a148 <__muldf3>
    79ac:	00050613          	mv	a2,a0
    79b0:	00058693          	mv	a3,a1
    79b4:	00050a13          	mv	s4,a0
    79b8:	00058993          	mv	s3,a1
    79bc:	000b0513          	mv	a0,s6
    79c0:	000a8593          	mv	a1,s5
    79c4:	575020ef          	jal	a738 <__subdf3>
    79c8:	01f00793          	li	a5,31
    79cc:	0327c063          	blt	a5,s2,79ec <.L12>
    79d0:	fff90713          	add	a4,s2,-1
    79d4:	00271713          	sll	a4,a4,0x2
    79d8:	0000a797          	auipc	a5,0xa
    79dc:	f3078793          	add	a5,a5,-208 # 11908 <npio2_hw>
    79e0:	00e787b3          	add	a5,a5,a4
    79e4:	0007a783          	lw	a5,0(a5)
    79e8:	00979e63          	bne	a5,s1,7a04 <.L13>

000079ec <.L12>:
    79ec:	0145d793          	srl	a5,a1,0x14
    79f0:	4144d493          	sra	s1,s1,0x14
    79f4:	7ff7f793          	and	a5,a5,2047
    79f8:	40f487b3          	sub	a5,s1,a5
    79fc:	01000713          	li	a4,16
    7a00:	04f74e63          	blt	a4,a5,7a5c <.L14>

00007a04 <.L13>:
    7a04:	00a42023          	sw	a0,0(s0)
    7a08:	00b42223          	sw	a1,4(s0)

00007a0c <.L15>:
    7a0c:	00042703          	lw	a4,0(s0)
    7a10:	00442483          	lw	s1,4(s0)
    7a14:	000b0513          	mv	a0,s6
    7a18:	00070613          	mv	a2,a4
    7a1c:	00048693          	mv	a3,s1
    7a20:	000a8593          	mv	a1,s5
    7a24:	515020ef          	jal	a738 <__subdf3>
    7a28:	000a0613          	mv	a2,s4
    7a2c:	00098693          	mv	a3,s3
    7a30:	509020ef          	jal	a738 <__subdf3>
    7a34:	00a42423          	sw	a0,8(s0)
    7a38:	00b42623          	sw	a1,12(s0)
    7a3c:	de0cdce3          	bgez	s9,7834 <.L1>
    7a40:	800007b7          	lui	a5,0x80000
    7a44:	0097c4b3          	xor	s1,a5,s1
    7a48:	00942223          	sw	s1,4(s0)
    7a4c:	00b7c7b3          	xor	a5,a5,a1

00007a50 <.L24>:
    7a50:	00f42623          	sw	a5,12(s0)
    7a54:	41200933          	neg	s2,s2
    7a58:	dddff06f          	j	7834 <.L1>

00007a5c <.L14>:
    7a5c:	0000a797          	auipc	a5,0xa
    7a60:	69478793          	add	a5,a5,1684 # 120f0 <.LC2>
    7a64:	0007a603          	lw	a2,0(a5)
    7a68:	0047a683          	lw	a3,4(a5)
    7a6c:	000c0513          	mv	a0,s8
    7a70:	000b8593          	mv	a1,s7
    7a74:	6d4020ef          	jal	a148 <__muldf3>
    7a78:	00050a13          	mv	s4,a0
    7a7c:	00058993          	mv	s3,a1
    7a80:	00050613          	mv	a2,a0
    7a84:	00058693          	mv	a3,a1
    7a88:	000b0513          	mv	a0,s6
    7a8c:	000a8593          	mv	a1,s5
    7a90:	4a9020ef          	jal	a738 <__subdf3>
    7a94:	00050613          	mv	a2,a0
    7a98:	00058693          	mv	a3,a1
    7a9c:	00050d93          	mv	s11,a0
    7aa0:	00058d13          	mv	s10,a1
    7aa4:	000b0513          	mv	a0,s6
    7aa8:	000a8593          	mv	a1,s5
    7aac:	48d020ef          	jal	a738 <__subdf3>
    7ab0:	000a0613          	mv	a2,s4
    7ab4:	00098693          	mv	a3,s3
    7ab8:	481020ef          	jal	a738 <__subdf3>
    7abc:	0000a797          	auipc	a5,0xa
    7ac0:	63c78793          	add	a5,a5,1596 # 120f8 <.LC3>
    7ac4:	0007a603          	lw	a2,0(a5)
    7ac8:	0047a683          	lw	a3,4(a5)
    7acc:	00050a13          	mv	s4,a0
    7ad0:	00058993          	mv	s3,a1
    7ad4:	000c0513          	mv	a0,s8
    7ad8:	000b8593          	mv	a1,s7
    7adc:	66c020ef          	jal	a148 <__muldf3>
    7ae0:	000a0613          	mv	a2,s4
    7ae4:	00098693          	mv	a3,s3
    7ae8:	451020ef          	jal	a738 <__subdf3>
    7aec:	00050613          	mv	a2,a0
    7af0:	00058693          	mv	a3,a1
    7af4:	00050a13          	mv	s4,a0
    7af8:	00058993          	mv	s3,a1
    7afc:	000d8513          	mv	a0,s11
    7b00:	000d0593          	mv	a1,s10
    7b04:	435020ef          	jal	a738 <__subdf3>
    7b08:	0145d793          	srl	a5,a1,0x14
    7b0c:	7ff7f793          	and	a5,a5,2047
    7b10:	40f484b3          	sub	s1,s1,a5
    7b14:	03100793          	li	a5,49
    7b18:	0097cc63          	blt	a5,s1,7b30 <.L16>
    7b1c:	00a42023          	sw	a0,0(s0)
    7b20:	00b42223          	sw	a1,4(s0)
    7b24:	000d8b13          	mv	s6,s11
    7b28:	000d0a93          	mv	s5,s10
    7b2c:	ee1ff06f          	j	7a0c <.L15>

00007b30 <.L16>:
    7b30:	0000a797          	auipc	a5,0xa
    7b34:	5e078793          	add	a5,a5,1504 # 12110 <.LC6>
    7b38:	0007a603          	lw	a2,0(a5)
    7b3c:	0047a683          	lw	a3,4(a5)
    7b40:	000c0513          	mv	a0,s8
    7b44:	000b8593          	mv	a1,s7
    7b48:	600020ef          	jal	a148 <__muldf3>
    7b4c:	00050993          	mv	s3,a0
    7b50:	00058493          	mv	s1,a1
    7b54:	00050613          	mv	a2,a0
    7b58:	00058693          	mv	a3,a1
    7b5c:	000d8513          	mv	a0,s11
    7b60:	000d0593          	mv	a1,s10
    7b64:	3d5020ef          	jal	a738 <__subdf3>
    7b68:	00050613          	mv	a2,a0
    7b6c:	00058693          	mv	a3,a1
    7b70:	00050b13          	mv	s6,a0
    7b74:	00058a93          	mv	s5,a1
    7b78:	000d8513          	mv	a0,s11
    7b7c:	000d0593          	mv	a1,s10
    7b80:	3b9020ef          	jal	a738 <__subdf3>
    7b84:	00098613          	mv	a2,s3
    7b88:	00048693          	mv	a3,s1
    7b8c:	3ad020ef          	jal	a738 <__subdf3>
    7b90:	0000a797          	auipc	a5,0xa
    7b94:	58878793          	add	a5,a5,1416 # 12118 <.LC7>
    7b98:	0007a603          	lw	a2,0(a5)
    7b9c:	0047a683          	lw	a3,4(a5)
    7ba0:	00050993          	mv	s3,a0
    7ba4:	00058493          	mv	s1,a1
    7ba8:	000c0513          	mv	a0,s8
    7bac:	000b8593          	mv	a1,s7
    7bb0:	598020ef          	jal	a148 <__muldf3>
    7bb4:	00098613          	mv	a2,s3
    7bb8:	00048693          	mv	a3,s1
    7bbc:	37d020ef          	jal	a738 <__subdf3>
    7bc0:	00050613          	mv	a2,a0
    7bc4:	00058693          	mv	a3,a1
    7bc8:	00050a13          	mv	s4,a0
    7bcc:	00058993          	mv	s3,a1
    7bd0:	000b0513          	mv	a0,s6
    7bd4:	000a8593          	mv	a1,s5
    7bd8:	361020ef          	jal	a738 <__subdf3>
    7bdc:	00a42023          	sw	a0,0(s0)
    7be0:	00b42223          	sw	a1,4(s0)
    7be4:	e29ff06f          	j	7a0c <.L15>

00007be8 <.L11>:
    7be8:	7ff006b7          	lui	a3,0x7ff00
    7bec:	02d4e263          	bltu	s1,a3,7c10 <.L17>
    7bf0:	00050613          	mv	a2,a0
    7bf4:	00058693          	mv	a3,a1
    7bf8:	341020ef          	jal	a738 <__subdf3>
    7bfc:	00a42423          	sw	a0,8(s0)
    7c00:	00b42623          	sw	a1,12(s0)
    7c04:	00a42023          	sw	a0,0(s0)
    7c08:	00b42223          	sw	a1,4(s0)
    7c0c:	b71ff06f          	j	777c <.L3>

00007c10 <.L17>:
    7c10:	4144d913          	sra	s2,s1,0x14
    7c14:	bea90913          	add	s2,s2,-1046
    7c18:	01491713          	sll	a4,s2,0x14
    7c1c:	40e489b3          	sub	s3,s1,a4
    7c20:	00098593          	mv	a1,s3
    7c24:	00050a13          	mv	s4,a0
    7c28:	2b8030ef          	jal	aee0 <__fixdfsi>
    7c2c:	334030ef          	jal	af60 <__floatsidf>
    7c30:	00050613          	mv	a2,a0
    7c34:	00058693          	mv	a3,a1
    7c38:	00a12423          	sw	a0,8(sp)
    7c3c:	00b12623          	sw	a1,12(sp)
    7c40:	000a0513          	mv	a0,s4
    7c44:	00098593          	mv	a1,s3
    7c48:	0000aa17          	auipc	s4,0xa
    7c4c:	4d8a0a13          	add	s4,s4,1240 # 12120 <.LC1>
    7c50:	2e9020ef          	jal	a738 <__subdf3>
    7c54:	000a2603          	lw	a2,0(s4)
    7c58:	004a2683          	lw	a3,4(s4)
    7c5c:	4ec020ef          	jal	a148 <__muldf3>
    7c60:	00058493          	mv	s1,a1
    7c64:	00050993          	mv	s3,a0
    7c68:	278030ef          	jal	aee0 <__fixdfsi>
    7c6c:	2f4030ef          	jal	af60 <__floatsidf>
    7c70:	00050613          	mv	a2,a0
    7c74:	00058693          	mv	a3,a1
    7c78:	00a12823          	sw	a0,16(sp)
    7c7c:	00b12a23          	sw	a1,20(sp)
    7c80:	00098513          	mv	a0,s3
    7c84:	00048593          	mv	a1,s1
    7c88:	2b1020ef          	jal	a738 <__subdf3>
    7c8c:	000a2603          	lw	a2,0(s4)
    7c90:	004a2683          	lw	a3,4(s4)
    7c94:	00810493          	add	s1,sp,8
    7c98:	00300993          	li	s3,3
    7c9c:	4ac020ef          	jal	a148 <__muldf3>
    7ca0:	00a12c23          	sw	a0,24(sp)
    7ca4:	00b12e23          	sw	a1,28(sp)
    7ca8:	00048a13          	mv	s4,s1

00007cac <.L18>:
    7cac:	0104a503          	lw	a0,16(s1)
    7cb0:	0144a583          	lw	a1,20(s1)
    7cb4:	00000613          	li	a2,0
    7cb8:	00000693          	li	a3,0
    7cbc:	ff848493          	add	s1,s1,-8
    7cc0:	00098a93          	mv	s5,s3
    7cc4:	fff98993          	add	s3,s3,-1
    7cc8:	318020ef          	jal	9fe0 <__eqdf2>
    7ccc:	fe0500e3          	beqz	a0,7cac <.L18>
    7cd0:	00090613          	mv	a2,s2
    7cd4:	0000a797          	auipc	a5,0xa
    7cd8:	cb478793          	add	a5,a5,-844 # 11988 <two_over_pi>
    7cdc:	00200713          	li	a4,2
    7ce0:	000a8693          	mv	a3,s5
    7ce4:	00040593          	mv	a1,s0
    7ce8:	000a0513          	mv	a0,s4
    7cec:	2b4000ef          	jal	7fa0 <__kernel_rem_pio2>
    7cf0:	00050913          	mv	s2,a0
    7cf4:	b40cd0e3          	bgez	s9,7834 <.L1>
    7cf8:	00442603          	lw	a2,4(s0)
    7cfc:	800006b7          	lui	a3,0x80000
    7d00:	00d647b3          	xor	a5,a2,a3
    7d04:	00c42603          	lw	a2,12(s0)
    7d08:	00f42223          	sw	a5,4(s0)
    7d0c:	00d647b3          	xor	a5,a2,a3
    7d10:	d41ff06f          	j	7a50 <.L24>

00007d14 <__kernel_cos>:
    7d14:	fd010113          	add	sp,sp,-48
    7d18:	03212023          	sw	s2,32(sp)
    7d1c:	00159913          	sll	s2,a1,0x1
    7d20:	01312e23          	sw	s3,28(sp)
    7d24:	01412c23          	sw	s4,24(sp)
    7d28:	01512a23          	sw	s5,20(sp)
    7d2c:	01812423          	sw	s8,8(sp)
    7d30:	01912223          	sw	s9,4(sp)
    7d34:	02112623          	sw	ra,44(sp)
    7d38:	02812423          	sw	s0,40(sp)
    7d3c:	02912223          	sw	s1,36(sp)
    7d40:	01612823          	sw	s6,16(sp)
    7d44:	01712623          	sw	s7,12(sp)
    7d48:	00195913          	srl	s2,s2,0x1
    7d4c:	3e4007b7          	lui	a5,0x3e400
    7d50:	00050a13          	mv	s4,a0
    7d54:	00058993          	mv	s3,a1
    7d58:	00060c93          	mv	s9,a2
    7d5c:	00068c13          	mv	s8,a3
    7d60:	0000aa97          	auipc	s5,0xa
    7d64:	308a8a93          	add	s5,s5,776 # 12068 <.LC1>
    7d68:	00f97663          	bgeu	s2,a5,7d74 <.L2>
    7d6c:	174030ef          	jal	aee0 <__fixdfsi>
    7d70:	22050263          	beqz	a0,7f94 <.L6>

00007d74 <.L2>:
    7d74:	000a0613          	mv	a2,s4
    7d78:	00098693          	mv	a3,s3
    7d7c:	000a0513          	mv	a0,s4
    7d80:	00098593          	mv	a1,s3
    7d84:	3c4020ef          	jal	a148 <__muldf3>
    7d88:	0000a797          	auipc	a5,0xa
    7d8c:	38078793          	add	a5,a5,896 # 12108 <.LC2>
    7d90:	0007a603          	lw	a2,0(a5)
    7d94:	0047a683          	lw	a3,4(a5)
    7d98:	00050493          	mv	s1,a0
    7d9c:	00058413          	mv	s0,a1
    7da0:	3a8020ef          	jal	a148 <__muldf3>
    7da4:	0000a797          	auipc	a5,0xa
    7da8:	38c78793          	add	a5,a5,908 # 12130 <.LC3>
    7dac:	0007a603          	lw	a2,0(a5)
    7db0:	0047a683          	lw	a3,4(a5)
    7db4:	00050b93          	mv	s7,a0
    7db8:	00058b13          	mv	s6,a1
    7dbc:	00048513          	mv	a0,s1
    7dc0:	00040593          	mv	a1,s0
    7dc4:	384020ef          	jal	a148 <__muldf3>
    7dc8:	0000a797          	auipc	a5,0xa
    7dcc:	37078793          	add	a5,a5,880 # 12138 <.LC4>
    7dd0:	0007a603          	lw	a2,0(a5)
    7dd4:	0047a683          	lw	a3,4(a5)
    7dd8:	394010ef          	jal	916c <__adddf3>
    7ddc:	00048613          	mv	a2,s1
    7de0:	00040693          	mv	a3,s0
    7de4:	364020ef          	jal	a148 <__muldf3>
    7de8:	0000a797          	auipc	a5,0xa
    7dec:	35878793          	add	a5,a5,856 # 12140 <.LC5>
    7df0:	0007a603          	lw	a2,0(a5)
    7df4:	0047a683          	lw	a3,4(a5)
    7df8:	141020ef          	jal	a738 <__subdf3>
    7dfc:	00048613          	mv	a2,s1
    7e00:	00040693          	mv	a3,s0
    7e04:	344020ef          	jal	a148 <__muldf3>
    7e08:	0000a797          	auipc	a5,0xa
    7e0c:	34078793          	add	a5,a5,832 # 12148 <.LC6>
    7e10:	0007a603          	lw	a2,0(a5)
    7e14:	0047a683          	lw	a3,4(a5)
    7e18:	354010ef          	jal	916c <__adddf3>
    7e1c:	00048613          	mv	a2,s1
    7e20:	00040693          	mv	a3,s0
    7e24:	324020ef          	jal	a148 <__muldf3>
    7e28:	0000a797          	auipc	a5,0xa
    7e2c:	32878793          	add	a5,a5,808 # 12150 <.LC7>
    7e30:	0007a603          	lw	a2,0(a5)
    7e34:	0047a683          	lw	a3,4(a5)
    7e38:	101020ef          	jal	a738 <__subdf3>
    7e3c:	00048613          	mv	a2,s1
    7e40:	00040693          	mv	a3,s0
    7e44:	304020ef          	jal	a148 <__muldf3>
    7e48:	0000a797          	auipc	a5,0xa
    7e4c:	31078793          	add	a5,a5,784 # 12158 <.LC8>
    7e50:	0007a603          	lw	a2,0(a5)
    7e54:	0047a683          	lw	a3,4(a5)
    7e58:	314010ef          	jal	916c <__adddf3>
    7e5c:	00048613          	mv	a2,s1
    7e60:	00040693          	mv	a3,s0
    7e64:	2e4020ef          	jal	a148 <__muldf3>
    7e68:	00048613          	mv	a2,s1
    7e6c:	00040693          	mv	a3,s0
    7e70:	2d8020ef          	jal	a148 <__muldf3>
    7e74:	00050493          	mv	s1,a0
    7e78:	00058413          	mv	s0,a1
    7e7c:	000c8613          	mv	a2,s9
    7e80:	000c0693          	mv	a3,s8
    7e84:	000a0513          	mv	a0,s4
    7e88:	00098593          	mv	a1,s3
    7e8c:	2bc020ef          	jal	a148 <__muldf3>
    7e90:	00050613          	mv	a2,a0
    7e94:	00058693          	mv	a3,a1
    7e98:	00048513          	mv	a0,s1
    7e9c:	00040593          	mv	a1,s0
    7ea0:	099020ef          	jal	a738 <__subdf3>
    7ea4:	3fd337b7          	lui	a5,0x3fd33
    7ea8:	33278793          	add	a5,a5,818 # 3fd33332 <_ebss+0x3fd1d442>
    7eac:	00050a13          	mv	s4,a0
    7eb0:	00058993          	mv	s3,a1
    7eb4:	0727e063          	bltu	a5,s2,7f14 <.L4>
    7eb8:	00050613          	mv	a2,a0
    7ebc:	00058693          	mv	a3,a1
    7ec0:	000b8513          	mv	a0,s7
    7ec4:	000b0593          	mv	a1,s6
    7ec8:	071020ef          	jal	a738 <__subdf3>
    7ecc:	00050613          	mv	a2,a0
    7ed0:	00058693          	mv	a3,a1
    7ed4:	000aa503          	lw	a0,0(s5)
    7ed8:	004aa583          	lw	a1,4(s5)

00007edc <.L9>:
    7edc:	05d020ef          	jal	a738 <__subdf3>

00007ee0 <.L1>:
    7ee0:	02c12083          	lw	ra,44(sp)
    7ee4:	02812403          	lw	s0,40(sp)
    7ee8:	02412483          	lw	s1,36(sp)
    7eec:	02012903          	lw	s2,32(sp)
    7ef0:	01c12983          	lw	s3,28(sp)
    7ef4:	01812a03          	lw	s4,24(sp)
    7ef8:	01412a83          	lw	s5,20(sp)
    7efc:	01012b03          	lw	s6,16(sp)
    7f00:	00c12b83          	lw	s7,12(sp)
    7f04:	00812c03          	lw	s8,8(sp)
    7f08:	00412c83          	lw	s9,4(sp)
    7f0c:	03010113          	add	sp,sp,48
    7f10:	00008067          	ret

00007f14 <.L4>:
    7f14:	3fe907b7          	lui	a5,0x3fe90
    7f18:	0727e463          	bltu	a5,s2,7f80 <.L7>
    7f1c:	ffe007b7          	lui	a5,0xffe00
    7f20:	00000713          	li	a4,0
    7f24:	00f907b3          	add	a5,s2,a5
    7f28:	00070413          	mv	s0,a4
    7f2c:	00078493          	mv	s1,a5

00007f30 <.L5>:
    7f30:	000aa503          	lw	a0,0(s5)
    7f34:	004aa583          	lw	a1,4(s5)
    7f38:	00040613          	mv	a2,s0
    7f3c:	00048693          	mv	a3,s1
    7f40:	7f8020ef          	jal	a738 <__subdf3>
    7f44:	00050a93          	mv	s5,a0
    7f48:	00058913          	mv	s2,a1
    7f4c:	00040613          	mv	a2,s0
    7f50:	00048693          	mv	a3,s1
    7f54:	000b8513          	mv	a0,s7
    7f58:	000b0593          	mv	a1,s6
    7f5c:	7dc020ef          	jal	a738 <__subdf3>
    7f60:	000a0613          	mv	a2,s4
    7f64:	00098693          	mv	a3,s3
    7f68:	7d0020ef          	jal	a738 <__subdf3>
    7f6c:	00050613          	mv	a2,a0
    7f70:	00058693          	mv	a3,a1
    7f74:	000a8513          	mv	a0,s5
    7f78:	00090593          	mv	a1,s2
    7f7c:	f61ff06f          	j	7edc <.L9>

00007f80 <.L7>:
    7f80:	0000a797          	auipc	a5,0xa
    7f84:	1a878793          	add	a5,a5,424 # 12128 <.LC0>
    7f88:	0007a403          	lw	s0,0(a5)
    7f8c:	0047a483          	lw	s1,4(a5)
    7f90:	fa1ff06f          	j	7f30 <.L5>

00007f94 <.L6>:
    7f94:	000aa503          	lw	a0,0(s5)
    7f98:	004aa583          	lw	a1,4(s5)
    7f9c:	f45ff06f          	j	7ee0 <.L1>

00007fa0 <__kernel_rem_pio2>:
    7fa0:	d6010113          	add	sp,sp,-672
    7fa4:	28912a23          	sw	s1,660(sp)
    7fa8:	00f12c23          	sw	a5,24(sp)
    7fac:	00070493          	mv	s1,a4
    7fb0:	0000a797          	auipc	a5,0xa
    7fb4:	ae078793          	add	a5,a5,-1312 # 11a90 <init_jk>
    7fb8:	00271713          	sll	a4,a4,0x2
    7fbc:	00e787b3          	add	a5,a5,a4
    7fc0:	29212823          	sw	s2,656(sp)
    7fc4:	29312623          	sw	s3,652(sp)
    7fc8:	29512223          	sw	s5,644(sp)
    7fcc:	27812c23          	sw	s8,632(sp)
    7fd0:	28112e23          	sw	ra,668(sp)
    7fd4:	0007ac03          	lw	s8,0(a5)
    7fd8:	28812c23          	sw	s0,664(sp)
    7fdc:	29412423          	sw	s4,648(sp)
    7fe0:	29612023          	sw	s6,640(sp)
    7fe4:	27712e23          	sw	s7,636(sp)
    7fe8:	27912a23          	sw	s9,628(sp)
    7fec:	27a12823          	sw	s10,624(sp)
    7ff0:	27b12623          	sw	s11,620(sp)
    7ff4:	00a12a23          	sw	a0,20(sp)
    7ff8:	fec00793          	li	a5,-20
    7ffc:	00012423          	sw	zero,8(sp)
    8000:	00058a93          	mv	s5,a1
    8004:	00068913          	mv	s2,a3
    8008:	fff68993          	add	s3,a3,-1 # 7fffffff <_ebss+0x7ffea10f>
    800c:	00f64a63          	blt	a2,a5,8020 <.L2>
    8010:	ffd60713          	add	a4,a2,-3
    8014:	01800793          	li	a5,24
    8018:	02f747b3          	div	a5,a4,a5
    801c:	00f12423          	sw	a5,8(sp)

00008020 <.L2>:
    8020:	00812783          	lw	a5,8(sp)
    8024:	013c0cb3          	add	s9,s8,s3
    8028:	00178413          	add	s0,a5,1
    802c:	fe800793          	li	a5,-24
    8030:	02f40433          	mul	s0,s0,a5
    8034:	00812783          	lw	a5,8(sp)
    8038:	41378bb3          	sub	s7,a5,s3
    803c:	08010793          	add	a5,sp,128
    8040:	00f12823          	sw	a5,16(sp)
    8044:	00078b13          	mv	s6,a5
    8048:	000b8a13          	mv	s4,s7
    804c:	00c40433          	add	s0,s0,a2

00008050 <.L3>:
    8050:	417a07b3          	sub	a5,s4,s7
    8054:	02fcda63          	bge	s9,a5,8088 <.L5>
    8058:	1c010d13          	add	s10,sp,448
    805c:	00090d93          	mv	s11,s2
    8060:	000d0793          	mv	a5,s10

00008064 <.L6>:
    8064:	412d8733          	sub	a4,s11,s2
    8068:	0aec4c63          	blt	s8,a4,8120 <.L8>
    806c:	01012703          	lw	a4,16(sp)
    8070:	003d9b93          	sll	s7,s11,0x3
    8074:	00000b13          	li	s6,0
    8078:	00eb8bb3          	add	s7,s7,a4
    807c:	00000a13          	li	s4,0
    8080:	00000c93          	li	s9,0
    8084:	0800006f          	j	8104 <.L9>

00008088 <.L5>:
    8088:	00000513          	li	a0,0
    808c:	00000593          	li	a1,0
    8090:	000a4c63          	bltz	s4,80a8 <.L4>
    8094:	01812703          	lw	a4,24(sp)
    8098:	002a1793          	sll	a5,s4,0x2
    809c:	00f707b3          	add	a5,a4,a5
    80a0:	0007a503          	lw	a0,0(a5)
    80a4:	6bd020ef          	jal	af60 <__floatsidf>

000080a8 <.L4>:
    80a8:	00ab2023          	sw	a0,0(s6)
    80ac:	00bb2223          	sw	a1,4(s6)
    80b0:	001a0a13          	add	s4,s4,1
    80b4:	008b0b13          	add	s6,s6,8
    80b8:	f99ff06f          	j	8050 <.L3>

000080bc <.L7>:
    80bc:	00f12e23          	sw	a5,28(sp)
    80c0:	01412783          	lw	a5,20(sp)
    80c4:	003c9713          	sll	a4,s9,0x3
    80c8:	000ba603          	lw	a2,0(s7) # 10000 <.LVL314+0x8>
    80cc:	00e78733          	add	a4,a5,a4
    80d0:	004ba683          	lw	a3,4(s7)
    80d4:	00072503          	lw	a0,0(a4)
    80d8:	00472583          	lw	a1,4(a4)
    80dc:	001c8c93          	add	s9,s9,1
    80e0:	068020ef          	jal	a148 <__muldf3>
    80e4:	00050613          	mv	a2,a0
    80e8:	00058693          	mv	a3,a1
    80ec:	000b0513          	mv	a0,s6
    80f0:	000a0593          	mv	a1,s4
    80f4:	078010ef          	jal	916c <__adddf3>
    80f8:	01c12783          	lw	a5,28(sp)
    80fc:	00050b13          	mv	s6,a0
    8100:	00058a13          	mv	s4,a1

00008104 <.L9>:
    8104:	ff8b8b93          	add	s7,s7,-8
    8108:	fb99dae3          	bge	s3,s9,80bc <.L7>
    810c:	0167a023          	sw	s6,0(a5)
    8110:	0147a223          	sw	s4,4(a5)
    8114:	001d8d93          	add	s11,s11,1
    8118:	00878793          	add	a5,a5,8
    811c:	f49ff06f          	j	8064 <.L6>

00008120 <.L8>:
    8120:	03010c93          	add	s9,sp,48
    8124:	002c1793          	sll	a5,s8,0x2
    8128:	00fc87b3          	add	a5,s9,a5
    812c:	00f12e23          	sw	a5,28(sp)
    8130:	000c0a13          	mv	s4,s8

00008134 <.L10>:
    8134:	003a1793          	sll	a5,s4,0x3
    8138:	03010713          	add	a4,sp,48
    813c:	23078793          	add	a5,a5,560
    8140:	00e787b3          	add	a5,a5,a4
    8144:	f607ab83          	lw	s7,-160(a5)
    8148:	f647ab03          	lw	s6,-156(a5)
    814c:	000c8d93          	mv	s11,s9
    8150:	000c8713          	mv	a4,s9
    8154:	000a0793          	mv	a5,s4

00008158 <.L11>:
    8158:	22f04063          	bgtz	a5,8378 <.L12>
    815c:	00040613          	mv	a2,s0
    8160:	000b8513          	mv	a0,s7
    8164:	000b0593          	mv	a1,s6
    8168:	555000ef          	jal	8ebc <__GI_scalbln>
    816c:	0000a797          	auipc	a5,0xa
    8170:	ffc78793          	add	a5,a5,-4 # 12168 <.LC2>
    8174:	0007a603          	lw	a2,0(a5)
    8178:	0047a683          	lw	a3,4(a5)
    817c:	00050b93          	mv	s7,a0
    8180:	00058b13          	mv	s6,a1
    8184:	7c5010ef          	jal	a148 <__muldf3>
    8188:	371000ef          	jal	8cf8 <__GI_floor>
    818c:	0000a797          	auipc	a5,0xa
    8190:	fe478793          	add	a5,a5,-28 # 12170 <.LC3>
    8194:	0007a603          	lw	a2,0(a5)
    8198:	0047a683          	lw	a3,4(a5)
    819c:	7ad010ef          	jal	a148 <__muldf3>
    81a0:	00050613          	mv	a2,a0
    81a4:	00058693          	mv	a3,a1
    81a8:	000b8513          	mv	a0,s7
    81ac:	000b0593          	mv	a1,s6
    81b0:	588020ef          	jal	a738 <__subdf3>
    81b4:	00058b13          	mv	s6,a1
    81b8:	02a12023          	sw	a0,32(sp)
    81bc:	525020ef          	jal	aee0 <__fixdfsi>
    81c0:	00050b93          	mv	s7,a0
    81c4:	59d020ef          	jal	af60 <__floatsidf>
    81c8:	02012783          	lw	a5,32(sp)
    81cc:	00050613          	mv	a2,a0
    81d0:	00058693          	mv	a3,a1
    81d4:	00078513          	mv	a0,a5
    81d8:	000b0593          	mv	a1,s6
    81dc:	55c020ef          	jal	a738 <__subdf3>
    81e0:	00050713          	mv	a4,a0
    81e4:	00058793          	mv	a5,a1
    81e8:	24805063          	blez	s0,8428 <.L13>
    81ec:	fffa0693          	add	a3,s4,-1
    81f0:	00269693          	sll	a3,a3,0x2
    81f4:	03010613          	add	a2,sp,48
    81f8:	23068693          	add	a3,a3,560
    81fc:	00c686b3          	add	a3,a3,a2
    8200:	dd06ab03          	lw	s6,-560(a3)
    8204:	01800593          	li	a1,24
    8208:	408585b3          	sub	a1,a1,s0
    820c:	40bb5633          	sra	a2,s6,a1
    8210:	00cb8bb3          	add	s7,s7,a2
    8214:	00b61633          	sll	a2,a2,a1
    8218:	40cb0b33          	sub	s6,s6,a2
    821c:	dd66a823          	sw	s6,-560(a3)
    8220:	01700693          	li	a3,23
    8224:	408686b3          	sub	a3,a3,s0
    8228:	40db5b33          	sra	s6,s6,a3

0000822c <.L14>:
    822c:	09605e63          	blez	s6,82c8 <.L17>

00008230 <.L16>:
    8230:	001b8b93          	add	s7,s7,1
    8234:	00000613          	li	a2,0
    8238:	00000813          	li	a6,0

0000823c <.L18>:
    823c:	25464263          	blt	a2,s4,8480 <.L22>
    8240:	00805a63          	blez	s0,8254 <.L23>
    8244:	00100693          	li	a3,1
    8248:	26d40863          	beq	s0,a3,84b8 <.L24>
    824c:	00200693          	li	a3,2
    8250:	28d40863          	beq	s0,a3,84e0 <.L25>

00008254 <.L23>:
    8254:	00200693          	li	a3,2
    8258:	06db1863          	bne	s6,a3,82c8 <.L17>
    825c:	0000ad97          	auipc	s11,0xa
    8260:	e0cd8d93          	add	s11,s11,-500 # 12068 <.LC1>
    8264:	000da503          	lw	a0,0(s11)
    8268:	004da583          	lw	a1,4(s11)
    826c:	00070613          	mv	a2,a4
    8270:	00078693          	mv	a3,a5
    8274:	03012023          	sw	a6,32(sp)
    8278:	4c0020ef          	jal	a738 <__subdf3>
    827c:	02012803          	lw	a6,32(sp)
    8280:	00050713          	mv	a4,a0
    8284:	00058793          	mv	a5,a1
    8288:	04080063          	beqz	a6,82c8 <.L17>
    828c:	02b12223          	sw	a1,36(sp)
    8290:	02a12023          	sw	a0,32(sp)
    8294:	004da583          	lw	a1,4(s11)
    8298:	000da503          	lw	a0,0(s11)
    829c:	00040613          	mv	a2,s0
    82a0:	41d000ef          	jal	8ebc <__GI_scalbln>
    82a4:	02012703          	lw	a4,32(sp)
    82a8:	02412783          	lw	a5,36(sp)
    82ac:	00050613          	mv	a2,a0
    82b0:	00058693          	mv	a3,a1
    82b4:	00070513          	mv	a0,a4
    82b8:	00078593          	mv	a1,a5
    82bc:	47c020ef          	jal	a738 <__subdf3>
    82c0:	00050713          	mv	a4,a0
    82c4:	00058793          	mv	a5,a1

000082c8 <.L17>:
    82c8:	00070513          	mv	a0,a4
    82cc:	00078593          	mv	a1,a5
    82d0:	00000613          	li	a2,0
    82d4:	00000693          	li	a3,0
    82d8:	02e12223          	sw	a4,36(sp)
    82dc:	02f12023          	sw	a5,32(sp)
    82e0:	501010ef          	jal	9fe0 <__eqdf2>
    82e4:	02012783          	lw	a5,32(sp)
    82e8:	02412703          	lw	a4,36(sp)
    82ec:	32051263          	bnez	a0,8610 <.L89>
    82f0:	fffa0793          	add	a5,s4,-1
    82f4:	00000713          	li	a4,0
    82f8:	00078613          	mv	a2,a5

000082fc <.L28>:
    82fc:	2187d463          	bge	a5,s8,8504 <.L29>
    8300:	28070e63          	beqz	a4,859c <.L70>
    8304:	00060a13          	mv	s4,a2

00008308 <.L95>:
    8308:	002a1793          	sll	a5,s4,0x2
    830c:	00fc87b3          	add	a5,s9,a5
    8310:	0007a783          	lw	a5,0(a5)
    8314:	fe840413          	add	s0,s0,-24
    8318:	2e078863          	beqz	a5,8608 <.L38>

0000831c <.L39>:
    831c:	0000a797          	auipc	a5,0xa
    8320:	d4c78793          	add	a5,a5,-692 # 12068 <.LC1>
    8324:	0007a503          	lw	a0,0(a5)
    8328:	0047a583          	lw	a1,4(a5)
    832c:	00040613          	mv	a2,s0
    8330:	000a0d93          	mv	s11,s4
    8334:	389000ef          	jal	8ebc <__GI_scalbln>
    8338:	00050413          	mv	s0,a0
    833c:	00058913          	mv	s2,a1
    8340:	0000a997          	auipc	s3,0xa
    8344:	e2098993          	add	s3,s3,-480 # 12160 <.LC0>

00008348 <.L42>:
    8348:	3a0dd663          	bgez	s11,86f4 <.L43>
    834c:	000a0913          	mv	s2,s4

00008350 <.L44>:
    8350:	46094863          	bltz	s2,87c0 <.L47>
    8354:	00391d93          	sll	s11,s2,0x3
    8358:	00009717          	auipc	a4,0x9
    835c:	74870713          	add	a4,a4,1864 # 11aa0 <PIo2>
    8360:	01ad8db3          	add	s11,s11,s10
    8364:	00000c93          	li	s9,0
    8368:	00000993          	li	s3,0
    836c:	00000793          	li	a5,0
    8370:	412a0433          	sub	s0,s4,s2
    8374:	4240006f          	j	8798 <.L48>

00008378 <.L12>:
    8378:	02f12023          	sw	a5,32(sp)
    837c:	0000a797          	auipc	a5,0xa
    8380:	de478793          	add	a5,a5,-540 # 12160 <.LC0>
    8384:	0007a603          	lw	a2,0(a5)
    8388:	0047a683          	lw	a3,4(a5)
    838c:	000b8513          	mv	a0,s7
    8390:	000b0593          	mv	a1,s6
    8394:	02e12223          	sw	a4,36(sp)
    8398:	5b1010ef          	jal	a148 <__muldf3>
    839c:	345020ef          	jal	aee0 <__fixdfsi>
    83a0:	3c1020ef          	jal	af60 <__floatsidf>
    83a4:	0000a797          	auipc	a5,0xa
    83a8:	d7c78793          	add	a5,a5,-644 # 12120 <.LC1>
    83ac:	0007a603          	lw	a2,0(a5)
    83b0:	0047a683          	lw	a3,4(a5)
    83b4:	02a12623          	sw	a0,44(sp)
    83b8:	02b12423          	sw	a1,40(sp)
    83bc:	58d010ef          	jal	a148 <__muldf3>
    83c0:	00050613          	mv	a2,a0
    83c4:	00058693          	mv	a3,a1
    83c8:	000b8513          	mv	a0,s7
    83cc:	000b0593          	mv	a1,s6
    83d0:	368020ef          	jal	a738 <__subdf3>
    83d4:	30d020ef          	jal	aee0 <__fixdfsi>
    83d8:	02012783          	lw	a5,32(sp)
    83dc:	02412703          	lw	a4,36(sp)
    83e0:	02c12883          	lw	a7,44(sp)
    83e4:	fff78793          	add	a5,a5,-1
    83e8:	00379693          	sll	a3,a5,0x3
    83ec:	02812803          	lw	a6,40(sp)
    83f0:	00dd06b3          	add	a3,s10,a3
    83f4:	0006a603          	lw	a2,0(a3)
    83f8:	0046a683          	lw	a3,4(a3)
    83fc:	00a72023          	sw	a0,0(a4)
    8400:	00080593          	mv	a1,a6
    8404:	00088513          	mv	a0,a7
    8408:	02f12023          	sw	a5,32(sp)
    840c:	561000ef          	jal	916c <__adddf3>
    8410:	02412703          	lw	a4,36(sp)
    8414:	02012783          	lw	a5,32(sp)
    8418:	00050b93          	mv	s7,a0
    841c:	00058b13          	mv	s6,a1
    8420:	00470713          	add	a4,a4,4
    8424:	d35ff06f          	j	8158 <.L11>

00008428 <.L13>:
    8428:	02041263          	bnez	s0,844c <.L15>
    842c:	fffa0693          	add	a3,s4,-1
    8430:	00269693          	sll	a3,a3,0x2
    8434:	23068693          	add	a3,a3,560
    8438:	03010613          	add	a2,sp,48
    843c:	00c686b3          	add	a3,a3,a2
    8440:	dd06ab03          	lw	s6,-560(a3)
    8444:	417b5b13          	sra	s6,s6,0x17
    8448:	de5ff06f          	j	822c <.L14>

0000844c <.L15>:
    844c:	0000a697          	auipc	a3,0xa
    8450:	cbc68693          	add	a3,a3,-836 # 12108 <.LC2>
    8454:	0006a603          	lw	a2,0(a3)
    8458:	0046a683          	lw	a3,4(a3)
    845c:	02b12223          	sw	a1,36(sp)
    8460:	02a12023          	sw	a0,32(sp)
    8464:	409010ef          	jal	a06c <__gedf2>
    8468:	02012703          	lw	a4,32(sp)
    846c:	02412783          	lw	a5,36(sp)
    8470:	00000b13          	li	s6,0
    8474:	e4054ae3          	bltz	a0,82c8 <.L17>
    8478:	00200b13          	li	s6,2
    847c:	db5ff06f          	j	8230 <.L16>

00008480 <.L22>:
    8480:	000da683          	lw	a3,0(s11)
    8484:	00081e63          	bnez	a6,84a0 <.L19>
    8488:	010005b7          	lui	a1,0x1000
    848c:	00069e63          	bnez	a3,84a8 <.L93>

00008490 <.L20>:
    8490:	00160613          	add	a2,a2,1
    8494:	004d8d93          	add	s11,s11,4
    8498:	00068813          	mv	a6,a3
    849c:	da1ff06f          	j	823c <.L18>

000084a0 <.L19>:
    84a0:	010005b7          	lui	a1,0x1000
    84a4:	fff58593          	add	a1,a1,-1 # ffffff <_ebss+0xfea10f>

000084a8 <.L93>:
    84a8:	40d586b3          	sub	a3,a1,a3
    84ac:	00dda023          	sw	a3,0(s11)
    84b0:	00100693          	li	a3,1
    84b4:	fddff06f          	j	8490 <.L20>

000084b8 <.L24>:
    84b8:	fffa0693          	add	a3,s4,-1
    84bc:	00269693          	sll	a3,a3,0x2
    84c0:	03010613          	add	a2,sp,48
    84c4:	23068693          	add	a3,a3,560
    84c8:	00c686b3          	add	a3,a3,a2
    84cc:	dd06a603          	lw	a2,-560(a3)
    84d0:	00961613          	sll	a2,a2,0x9
    84d4:	00965613          	srl	a2,a2,0x9

000084d8 <.L94>:
    84d8:	dcc6a823          	sw	a2,-560(a3)
    84dc:	d79ff06f          	j	8254 <.L23>

000084e0 <.L25>:
    84e0:	fffa0693          	add	a3,s4,-1
    84e4:	00269693          	sll	a3,a3,0x2
    84e8:	03010613          	add	a2,sp,48
    84ec:	23068693          	add	a3,a3,560
    84f0:	00c686b3          	add	a3,a3,a2
    84f4:	dd06a603          	lw	a2,-560(a3)
    84f8:	00a61613          	sll	a2,a2,0xa
    84fc:	00a65613          	srl	a2,a2,0xa
    8500:	fd9ff06f          	j	84d8 <.L94>

00008504 <.L29>:
    8504:	00279693          	sll	a3,a5,0x2
    8508:	00dc86b3          	add	a3,s9,a3
    850c:	0006a683          	lw	a3,0(a3)
    8510:	fff78793          	add	a5,a5,-1
    8514:	00d76733          	or	a4,a4,a3
    8518:	de5ff06f          	j	82fc <.L28>

0000851c <.L32>:
    851c:	00178793          	add	a5,a5,1

00008520 <.L30>:
    8520:	ffc72683          	lw	a3,-4(a4)
    8524:	ffc70713          	add	a4,a4,-4
    8528:	fe068ae3          	beqz	a3,851c <.L32>
    852c:	01012703          	lw	a4,16(sp)
    8530:	012a0bb3          	add	s7,s4,s2
    8534:	003b9b93          	sll	s7,s7,0x3
    8538:	001a0d93          	add	s11,s4,1
    853c:	01770bb3          	add	s7,a4,s7
    8540:	00fa0a33          	add	s4,s4,a5

00008544 <.L33>:
    8544:	bfba48e3          	blt	s4,s11,8134 <.L10>
    8548:	00812783          	lw	a5,8(sp)
    854c:	01812703          	lw	a4,24(sp)
    8550:	00000b13          	li	s6,0
    8554:	01b787b3          	add	a5,a5,s11
    8558:	00279793          	sll	a5,a5,0x2
    855c:	00f707b3          	add	a5,a4,a5
    8560:	0007a503          	lw	a0,0(a5)
    8564:	1fd020ef          	jal	af60 <__floatsidf>
    8568:	00aba023          	sw	a0,0(s7)
    856c:	00bba223          	sw	a1,4(s7)
    8570:	000b8813          	mv	a6,s7
    8574:	00000713          	li	a4,0
    8578:	00000793          	li	a5,0

0000857c <.L34>:
    857c:	0369d663          	bge	s3,s6,85a8 <.L35>
    8580:	003d9693          	sll	a3,s11,0x3
    8584:	00dd06b3          	add	a3,s10,a3
    8588:	00e6a023          	sw	a4,0(a3)
    858c:	00f6a223          	sw	a5,4(a3)
    8590:	001d8d93          	add	s11,s11,1
    8594:	008b8b93          	add	s7,s7,8
    8598:	fadff06f          	j	8544 <.L33>

0000859c <.L70>:
    859c:	01c12703          	lw	a4,28(sp)
    85a0:	00100793          	li	a5,1
    85a4:	f7dff06f          	j	8520 <.L30>

000085a8 <.L35>:
    85a8:	02f12423          	sw	a5,40(sp)
    85ac:	01412783          	lw	a5,20(sp)
    85b0:	003b1593          	sll	a1,s6,0x3
    85b4:	00082603          	lw	a2,0(a6)
    85b8:	00b785b3          	add	a1,a5,a1
    85bc:	00482683          	lw	a3,4(a6)
    85c0:	0005a503          	lw	a0,0(a1)
    85c4:	0045a583          	lw	a1,4(a1)
    85c8:	03012023          	sw	a6,32(sp)
    85cc:	02e12223          	sw	a4,36(sp)
    85d0:	379010ef          	jal	a148 <__muldf3>
    85d4:	02412703          	lw	a4,36(sp)
    85d8:	02812783          	lw	a5,40(sp)
    85dc:	00050613          	mv	a2,a0
    85e0:	00058693          	mv	a3,a1
    85e4:	00070513          	mv	a0,a4
    85e8:	00078593          	mv	a1,a5
    85ec:	381000ef          	jal	916c <__adddf3>
    85f0:	02012803          	lw	a6,32(sp)
    85f4:	00050713          	mv	a4,a0
    85f8:	00058793          	mv	a5,a1
    85fc:	001b0b13          	add	s6,s6,1
    8600:	ff880813          	add	a6,a6,-8
    8604:	f79ff06f          	j	857c <.L34>

00008608 <.L38>:
    8608:	fffa0a13          	add	s4,s4,-1
    860c:	cfdff06f          	j	8308 <.L95>

00008610 <.L89>:
    8610:	40800633          	neg	a2,s0
    8614:	00070513          	mv	a0,a4
    8618:	00078593          	mv	a1,a5
    861c:	0a1000ef          	jal	8ebc <__GI_scalbln>
    8620:	0000a697          	auipc	a3,0xa
    8624:	b0068693          	add	a3,a3,-1280 # 12120 <.LC1>
    8628:	0006a783          	lw	a5,0(a3)
    862c:	0046a803          	lw	a6,4(a3)
    8630:	00050993          	mv	s3,a0
    8634:	00078613          	mv	a2,a5
    8638:	00080693          	mv	a3,a6
    863c:	00058913          	mv	s2,a1
    8640:	00f12423          	sw	a5,8(sp)
    8644:	01012623          	sw	a6,12(sp)
    8648:	225010ef          	jal	a06c <__gedf2>
    864c:	002a1d93          	sll	s11,s4,0x2
    8650:	08054263          	bltz	a0,86d4 <.L91>
    8654:	0000a697          	auipc	a3,0xa
    8658:	b0c68693          	add	a3,a3,-1268 # 12160 <.LC0>
    865c:	0006a603          	lw	a2,0(a3)
    8660:	0046a683          	lw	a3,4(a3)
    8664:	00098513          	mv	a0,s3
    8668:	00090593          	mv	a1,s2
    866c:	2dd010ef          	jal	a148 <__muldf3>
    8670:	071020ef          	jal	aee0 <__fixdfsi>
    8674:	230d8793          	add	a5,s11,560
    8678:	03010713          	add	a4,sp,48
    867c:	00e78db3          	add	s11,a5,a4
    8680:	00a12823          	sw	a0,16(sp)
    8684:	0dd020ef          	jal	af60 <__floatsidf>
    8688:	00812603          	lw	a2,8(sp)
    868c:	00c12683          	lw	a3,12(sp)
    8690:	001a0a13          	add	s4,s4,1
    8694:	01840413          	add	s0,s0,24
    8698:	2b1010ef          	jal	a148 <__muldf3>
    869c:	00050613          	mv	a2,a0
    86a0:	00058693          	mv	a3,a1
    86a4:	00098513          	mv	a0,s3
    86a8:	00090593          	mv	a1,s2
    86ac:	08c020ef          	jal	a738 <__subdf3>
    86b0:	031020ef          	jal	aee0 <__fixdfsi>
    86b4:	01012803          	lw	a6,16(sp)
    86b8:	002a1793          	sll	a5,s4,0x2
    86bc:	23078793          	add	a5,a5,560
    86c0:	03010713          	add	a4,sp,48
    86c4:	dcada823          	sw	a0,-560(s11)
    86c8:	00e787b3          	add	a5,a5,a4
    86cc:	dd07a823          	sw	a6,-560(a5)
    86d0:	c4dff06f          	j	831c <.L39>

000086d4 <.L91>:
    86d4:	230d8793          	add	a5,s11,560
    86d8:	03010713          	add	a4,sp,48
    86dc:	00098513          	mv	a0,s3
    86e0:	00090593          	mv	a1,s2
    86e4:	00e78db3          	add	s11,a5,a4
    86e8:	7f8020ef          	jal	aee0 <__fixdfsi>
    86ec:	dcada823          	sw	a0,-560(s11)
    86f0:	c2dff06f          	j	831c <.L39>

000086f4 <.L43>:
    86f4:	002d9713          	sll	a4,s11,0x2
    86f8:	00ec8733          	add	a4,s9,a4
    86fc:	00072503          	lw	a0,0(a4)
    8700:	003d9793          	sll	a5,s11,0x3
    8704:	00fd07b3          	add	a5,s10,a5
    8708:	00f12423          	sw	a5,8(sp)
    870c:	055020ef          	jal	af60 <__floatsidf>
    8710:	00040613          	mv	a2,s0
    8714:	00090693          	mv	a3,s2
    8718:	231010ef          	jal	a148 <__muldf3>
    871c:	00812783          	lw	a5,8(sp)
    8720:	0009a603          	lw	a2,0(s3)
    8724:	0049a683          	lw	a3,4(s3)
    8728:	00a7a023          	sw	a0,0(a5)
    872c:	00b7a223          	sw	a1,4(a5)
    8730:	00040513          	mv	a0,s0
    8734:	00090593          	mv	a1,s2
    8738:	211010ef          	jal	a148 <__muldf3>
    873c:	00050413          	mv	s0,a0
    8740:	00058913          	mv	s2,a1
    8744:	fffd8d93          	add	s11,s11,-1
    8748:	c01ff06f          	j	8348 <.L42>

0000874c <.L46>:
    874c:	000da603          	lw	a2,0(s11)
    8750:	004da683          	lw	a3,4(s11)
    8754:	00072503          	lw	a0,0(a4)
    8758:	00472583          	lw	a1,4(a4)
    875c:	00f12823          	sw	a5,16(sp)
    8760:	00e12423          	sw	a4,8(sp)
    8764:	1e5010ef          	jal	a148 <__muldf3>
    8768:	00050613          	mv	a2,a0
    876c:	00058693          	mv	a3,a1
    8770:	000c8513          	mv	a0,s9
    8774:	00098593          	mv	a1,s3
    8778:	1f5000ef          	jal	916c <__adddf3>
    877c:	01012783          	lw	a5,16(sp)
    8780:	00812703          	lw	a4,8(sp)
    8784:	00050c93          	mv	s9,a0
    8788:	00058993          	mv	s3,a1
    878c:	00178793          	add	a5,a5,1
    8790:	00870713          	add	a4,a4,8
    8794:	008d8d93          	add	s11,s11,8

00008798 <.L48>:
    8798:	00fc4463          	blt	s8,a5,87a0 <.L45>
    879c:	faf458e3          	bge	s0,a5,874c <.L46>

000087a0 <.L45>:
    87a0:	00341413          	sll	s0,s0,0x3
    87a4:	23040793          	add	a5,s0,560
    87a8:	03010713          	add	a4,sp,48
    87ac:	00e78433          	add	s0,a5,a4
    87b0:	ed942023          	sw	s9,-320(s0)
    87b4:	ed342223          	sw	s3,-316(s0)
    87b8:	fff90913          	add	s2,s2,-1
    87bc:	b95ff06f          	j	8350 <.L44>

000087c0 <.L47>:
    87c0:	00200793          	li	a5,2
    87c4:	0497c663          	blt	a5,s1,8810 <.L49>
    87c8:	16904863          	bgtz	s1,8938 <.L71>
    87cc:	0e048863          	beqz	s1,88bc <.L72>

000087d0 <.L52>:
    87d0:	29c12083          	lw	ra,668(sp)
    87d4:	29812403          	lw	s0,664(sp)
    87d8:	29412483          	lw	s1,660(sp)
    87dc:	29012903          	lw	s2,656(sp)
    87e0:	28c12983          	lw	s3,652(sp)
    87e4:	28812a03          	lw	s4,648(sp)
    87e8:	28412a83          	lw	s5,644(sp)
    87ec:	28012b03          	lw	s6,640(sp)
    87f0:	27812c03          	lw	s8,632(sp)
    87f4:	27412c83          	lw	s9,628(sp)
    87f8:	27012d03          	lw	s10,624(sp)
    87fc:	26c12d83          	lw	s11,620(sp)
    8800:	007bf513          	and	a0,s7,7
    8804:	27c12b83          	lw	s7,636(sp)
    8808:	2a010113          	add	sp,sp,672
    880c:	00008067          	ret

00008810 <.L49>:
    8810:	00300793          	li	a5,3
    8814:	faf49ee3          	bne	s1,a5,87d0 <.L52>
    8818:	12010c93          	add	s9,sp,288
    881c:	003a1c13          	sll	s8,s4,0x3
    8820:	018c8c33          	add	s8,s9,s8
    8824:	000c0d13          	mv	s10,s8
    8828:	000a0413          	mv	s0,s4

0000882c <.L53>:
    882c:	ff8d0d13          	add	s10,s10,-8
    8830:	12804863          	bgtz	s0,8960 <.L61>
    8834:	000a0493          	mv	s1,s4
    8838:	00100413          	li	s0,1

0000883c <.L62>:
    883c:	ff8c0c13          	add	s8,s8,-8
    8840:	18944663          	blt	s0,s1,89cc <.L63>
    8844:	00000513          	li	a0,0
    8848:	00000593          	li	a1,0
    884c:	00100413          	li	s0,1

00008850 <.L64>:
    8850:	1f444463          	blt	s0,s4,8a38 <.L65>
    8854:	12012783          	lw	a5,288(sp)
    8858:	12412683          	lw	a3,292(sp)
    885c:	12812603          	lw	a2,296(sp)
    8860:	12c12703          	lw	a4,300(sp)
    8864:	1e0b1863          	bnez	s6,8a54 <.L66>
    8868:	00faa023          	sw	a5,0(s5)
    886c:	00daa223          	sw	a3,4(s5)
    8870:	00caa423          	sw	a2,8(s5)
    8874:	00eaa623          	sw	a4,12(s5)
    8878:	00058793          	mv	a5,a1
    887c:	00aaa823          	sw	a0,16(s5)

00008880 <.L96>:
    8880:	00faaa23          	sw	a5,20(s5)
    8884:	f4dff06f          	j	87d0 <.L52>

00008888 <.L54>:
    8888:	003a1793          	sll	a5,s4,0x3
    888c:	00f407b3          	add	a5,s0,a5
    8890:	0007a603          	lw	a2,0(a5)
    8894:	0047a683          	lw	a3,4(a5)
    8898:	fffa0a13          	add	s4,s4,-1
    889c:	0d1000ef          	jal	916c <__adddf3>

000088a0 <.L51>:
    88a0:	fe0a54e3          	bgez	s4,8888 <.L54>
    88a4:	000b0663          	beqz	s6,88b0 <.L55>
    88a8:	800007b7          	lui	a5,0x80000
    88ac:	00b7c5b3          	xor	a1,a5,a1

000088b0 <.L55>:
    88b0:	00aaa023          	sw	a0,0(s5)
    88b4:	00baa223          	sw	a1,4(s5)
    88b8:	f19ff06f          	j	87d0 <.L52>

000088bc <.L72>:
    88bc:	00000513          	li	a0,0
    88c0:	00000593          	li	a1,0
    88c4:	12010413          	add	s0,sp,288
    88c8:	fd9ff06f          	j	88a0 <.L51>

000088cc <.L56>:
    88cc:	00349793          	sll	a5,s1,0x3
    88d0:	00f407b3          	add	a5,s0,a5
    88d4:	0007a603          	lw	a2,0(a5) # 80000000 <_ebss+0x7ffea110>
    88d8:	0047a683          	lw	a3,4(a5)
    88dc:	fff48493          	add	s1,s1,-1
    88e0:	08d000ef          	jal	916c <__adddf3>

000088e4 <.L50>:
    88e4:	fe04d4e3          	bgez	s1,88cc <.L56>
    88e8:	00058793          	mv	a5,a1
    88ec:	000b0663          	beqz	s6,88f8 <.L57>
    88f0:	800007b7          	lui	a5,0x80000
    88f4:	00b7c7b3          	xor	a5,a5,a1

000088f8 <.L57>:
    88f8:	00aaa023          	sw	a0,0(s5)
    88fc:	00050613          	mv	a2,a0
    8900:	00058693          	mv	a3,a1
    8904:	12012503          	lw	a0,288(sp)
    8908:	12412583          	lw	a1,292(sp)
    890c:	00faa223          	sw	a5,4(s5)
    8910:	00100493          	li	s1,1
    8914:	625010ef          	jal	a738 <__subdf3>

00008918 <.L58>:
    8918:	00840413          	add	s0,s0,8
    891c:	029a5863          	bge	s4,s1,894c <.L59>
    8920:	000b0663          	beqz	s6,892c <.L60>
    8924:	800007b7          	lui	a5,0x80000
    8928:	00b7c5b3          	xor	a1,a5,a1

0000892c <.L60>:
    892c:	00aaa423          	sw	a0,8(s5)
    8930:	00baa623          	sw	a1,12(s5)
    8934:	e9dff06f          	j	87d0 <.L52>

00008938 <.L71>:
    8938:	000a0493          	mv	s1,s4
    893c:	00000513          	li	a0,0
    8940:	00000593          	li	a1,0
    8944:	12010413          	add	s0,sp,288
    8948:	f9dff06f          	j	88e4 <.L50>

0000894c <.L59>:
    894c:	00042603          	lw	a2,0(s0)
    8950:	00442683          	lw	a3,4(s0)
    8954:	00148493          	add	s1,s1,1
    8958:	015000ef          	jal	916c <__adddf3>
    895c:	fbdff06f          	j	8918 <.L58>

00008960 <.L61>:
    8960:	008d2783          	lw	a5,8(s10)
    8964:	00cd2803          	lw	a6,12(s10)
    8968:	000d2903          	lw	s2,0(s10)
    896c:	004d2983          	lw	s3,4(s10)
    8970:	00078613          	mv	a2,a5
    8974:	00080693          	mv	a3,a6
    8978:	00090513          	mv	a0,s2
    897c:	00098593          	mv	a1,s3
    8980:	00f12423          	sw	a5,8(sp)
    8984:	01012623          	sw	a6,12(sp)
    8988:	7e4000ef          	jal	916c <__adddf3>
    898c:	00050613          	mv	a2,a0
    8990:	00058693          	mv	a3,a1
    8994:	00050493          	mv	s1,a0
    8998:	00058d93          	mv	s11,a1
    899c:	00090513          	mv	a0,s2
    89a0:	00098593          	mv	a1,s3
    89a4:	595010ef          	jal	a738 <__subdf3>
    89a8:	00812603          	lw	a2,8(sp)
    89ac:	00c12683          	lw	a3,12(sp)
    89b0:	fff40413          	add	s0,s0,-1
    89b4:	7b8000ef          	jal	916c <__adddf3>
    89b8:	00ad2423          	sw	a0,8(s10)
    89bc:	00bd2623          	sw	a1,12(s10)
    89c0:	009d2023          	sw	s1,0(s10)
    89c4:	01bd2223          	sw	s11,4(s10)
    89c8:	e65ff06f          	j	882c <.L53>

000089cc <.L63>:
    89cc:	008c2783          	lw	a5,8(s8)
    89d0:	00cc2803          	lw	a6,12(s8)
    89d4:	000c2903          	lw	s2,0(s8)
    89d8:	004c2983          	lw	s3,4(s8)
    89dc:	00078613          	mv	a2,a5
    89e0:	00080693          	mv	a3,a6
    89e4:	00090513          	mv	a0,s2
    89e8:	00098593          	mv	a1,s3
    89ec:	00f12423          	sw	a5,8(sp)
    89f0:	01012623          	sw	a6,12(sp)
    89f4:	778000ef          	jal	916c <__adddf3>
    89f8:	00050613          	mv	a2,a0
    89fc:	00058693          	mv	a3,a1
    8a00:	00050d93          	mv	s11,a0
    8a04:	00058d13          	mv	s10,a1
    8a08:	00090513          	mv	a0,s2
    8a0c:	00098593          	mv	a1,s3
    8a10:	529010ef          	jal	a738 <__subdf3>
    8a14:	00812603          	lw	a2,8(sp)
    8a18:	00c12683          	lw	a3,12(sp)
    8a1c:	fff48493          	add	s1,s1,-1
    8a20:	74c000ef          	jal	916c <__adddf3>
    8a24:	00ac2423          	sw	a0,8(s8)
    8a28:	00bc2623          	sw	a1,12(s8)
    8a2c:	01bc2023          	sw	s11,0(s8)
    8a30:	01ac2223          	sw	s10,4(s8)
    8a34:	e09ff06f          	j	883c <.L62>

00008a38 <.L65>:
    8a38:	003a1793          	sll	a5,s4,0x3
    8a3c:	00fc87b3          	add	a5,s9,a5
    8a40:	0007a603          	lw	a2,0(a5) # 80000000 <_ebss+0x7ffea110>
    8a44:	0047a683          	lw	a3,4(a5)
    8a48:	fffa0a13          	add	s4,s4,-1
    8a4c:	720000ef          	jal	916c <__adddf3>
    8a50:	e01ff06f          	j	8850 <.L64>

00008a54 <.L66>:
    8a54:	00faa023          	sw	a5,0(s5)
    8a58:	800007b7          	lui	a5,0x80000
    8a5c:	00d7c6b3          	xor	a3,a5,a3
    8a60:	00e7c733          	xor	a4,a5,a4
    8a64:	00daa223          	sw	a3,4(s5)
    8a68:	00caa423          	sw	a2,8(s5)
    8a6c:	00eaa623          	sw	a4,12(s5)
    8a70:	00aaa823          	sw	a0,16(s5)
    8a74:	00b7c7b3          	xor	a5,a5,a1
    8a78:	e09ff06f          	j	8880 <.L96>

00008a7c <__kernel_sin>:
    8a7c:	fb010113          	add	sp,sp,-80
    8a80:	00159793          	sll	a5,a1,0x1
    8a84:	04812423          	sw	s0,72(sp)
    8a88:	04912223          	sw	s1,68(sp)
    8a8c:	03612823          	sw	s6,48(sp)
    8a90:	03712623          	sw	s7,44(sp)
    8a94:	03a12023          	sw	s10,32(sp)
    8a98:	04112623          	sw	ra,76(sp)
    8a9c:	00070d13          	mv	s10,a4
    8aa0:	05212023          	sw	s2,64(sp)
    8aa4:	03312e23          	sw	s3,60(sp)
    8aa8:	03412c23          	sw	s4,56(sp)
    8aac:	03512a23          	sw	s5,52(sp)
    8ab0:	03812423          	sw	s8,40(sp)
    8ab4:	03912223          	sw	s9,36(sp)
    8ab8:	01b12e23          	sw	s11,28(sp)
    8abc:	0017d793          	srl	a5,a5,0x1
    8ac0:	3e400737          	lui	a4,0x3e400
    8ac4:	00050493          	mv	s1,a0
    8ac8:	00058413          	mv	s0,a1
    8acc:	00060b93          	mv	s7,a2
    8ad0:	00068b13          	mv	s6,a3
    8ad4:	00e7f663          	bgeu	a5,a4,8ae0 <.L2>
    8ad8:	408020ef          	jal	aee0 <__fixdfsi>
    8adc:	12050463          	beqz	a0,8c04 <.L3>

00008ae0 <.L2>:
    8ae0:	00048613          	mv	a2,s1
    8ae4:	00040693          	mv	a3,s0
    8ae8:	00048513          	mv	a0,s1
    8aec:	00040593          	mv	a1,s0
    8af0:	658010ef          	jal	a148 <__muldf3>
    8af4:	00050993          	mv	s3,a0
    8af8:	00058913          	mv	s2,a1
    8afc:	00050613          	mv	a2,a0
    8b00:	00058693          	mv	a3,a1
    8b04:	00048513          	mv	a0,s1
    8b08:	00040593          	mv	a1,s0
    8b0c:	63c010ef          	jal	a148 <__muldf3>
    8b10:	00009797          	auipc	a5,0x9
    8b14:	66878793          	add	a5,a5,1640 # 12178 <.LC0>
    8b18:	0007a603          	lw	a2,0(a5)
    8b1c:	0047a683          	lw	a3,4(a5)
    8b20:	00050a93          	mv	s5,a0
    8b24:	00058a13          	mv	s4,a1
    8b28:	00098513          	mv	a0,s3
    8b2c:	00090593          	mv	a1,s2
    8b30:	618010ef          	jal	a148 <__muldf3>
    8b34:	00009797          	auipc	a5,0x9
    8b38:	64c78793          	add	a5,a5,1612 # 12180 <.LC1>
    8b3c:	0007a603          	lw	a2,0(a5)
    8b40:	0047a683          	lw	a3,4(a5)
    8b44:	00009d97          	auipc	s11,0x9
    8b48:	65cd8d93          	add	s11,s11,1628 # 121a0 <.LC5>
    8b4c:	3ed010ef          	jal	a738 <__subdf3>
    8b50:	00098613          	mv	a2,s3
    8b54:	00090693          	mv	a3,s2
    8b58:	5f0010ef          	jal	a148 <__muldf3>
    8b5c:	00009797          	auipc	a5,0x9
    8b60:	62c78793          	add	a5,a5,1580 # 12188 <.LC2>
    8b64:	0007a603          	lw	a2,0(a5)
    8b68:	0047a683          	lw	a3,4(a5)
    8b6c:	600000ef          	jal	916c <__adddf3>
    8b70:	00098613          	mv	a2,s3
    8b74:	00090693          	mv	a3,s2
    8b78:	5d0010ef          	jal	a148 <__muldf3>
    8b7c:	00009797          	auipc	a5,0x9
    8b80:	61478793          	add	a5,a5,1556 # 12190 <.LC3>
    8b84:	0007a603          	lw	a2,0(a5)
    8b88:	0047a683          	lw	a3,4(a5)
    8b8c:	3ad010ef          	jal	a738 <__subdf3>
    8b90:	00098613          	mv	a2,s3
    8b94:	00090693          	mv	a3,s2
    8b98:	5b0010ef          	jal	a148 <__muldf3>
    8b9c:	00009797          	auipc	a5,0x9
    8ba0:	5fc78793          	add	a5,a5,1532 # 12198 <.LC4>
    8ba4:	0007a603          	lw	a2,0(a5)
    8ba8:	0047a683          	lw	a3,4(a5)
    8bac:	5c0000ef          	jal	916c <__adddf3>
    8bb0:	00050c93          	mv	s9,a0
    8bb4:	00058c13          	mv	s8,a1
    8bb8:	080d1863          	bnez	s10,8c48 <.L4>
    8bbc:	00050613          	mv	a2,a0
    8bc0:	00058693          	mv	a3,a1
    8bc4:	00098513          	mv	a0,s3
    8bc8:	00090593          	mv	a1,s2
    8bcc:	57c010ef          	jal	a148 <__muldf3>
    8bd0:	000da603          	lw	a2,0(s11)
    8bd4:	004da683          	lw	a3,4(s11)
    8bd8:	361010ef          	jal	a738 <__subdf3>
    8bdc:	000a8613          	mv	a2,s5
    8be0:	000a0693          	mv	a3,s4
    8be4:	564010ef          	jal	a148 <__muldf3>
    8be8:	00050613          	mv	a2,a0
    8bec:	00058693          	mv	a3,a1
    8bf0:	00048513          	mv	a0,s1
    8bf4:	00040593          	mv	a1,s0
    8bf8:	574000ef          	jal	916c <__adddf3>

00008bfc <.L9>:
    8bfc:	00050493          	mv	s1,a0
    8c00:	00058413          	mv	s0,a1

00008c04 <.L3>:
    8c04:	04c12083          	lw	ra,76(sp)
    8c08:	00040593          	mv	a1,s0
    8c0c:	04812403          	lw	s0,72(sp)
    8c10:	04012903          	lw	s2,64(sp)
    8c14:	03c12983          	lw	s3,60(sp)
    8c18:	03812a03          	lw	s4,56(sp)
    8c1c:	03412a83          	lw	s5,52(sp)
    8c20:	03012b03          	lw	s6,48(sp)
    8c24:	02c12b83          	lw	s7,44(sp)
    8c28:	02812c03          	lw	s8,40(sp)
    8c2c:	02412c83          	lw	s9,36(sp)
    8c30:	02012d03          	lw	s10,32(sp)
    8c34:	01c12d83          	lw	s11,28(sp)
    8c38:	00048513          	mv	a0,s1
    8c3c:	04412483          	lw	s1,68(sp)
    8c40:	05010113          	add	sp,sp,80
    8c44:	00008067          	ret

00008c48 <.L4>:
    8c48:	00009797          	auipc	a5,0x9
    8c4c:	4c078793          	add	a5,a5,1216 # 12108 <.LC2>
    8c50:	0007a603          	lw	a2,0(a5)
    8c54:	0047a683          	lw	a3,4(a5)
    8c58:	000b8513          	mv	a0,s7
    8c5c:	000b0593          	mv	a1,s6
    8c60:	4e8010ef          	jal	a148 <__muldf3>
    8c64:	00a12623          	sw	a0,12(sp)
    8c68:	00058d13          	mv	s10,a1
    8c6c:	000c8613          	mv	a2,s9
    8c70:	000c0693          	mv	a3,s8
    8c74:	000a8513          	mv	a0,s5
    8c78:	000a0593          	mv	a1,s4
    8c7c:	4cc010ef          	jal	a148 <__muldf3>
    8c80:	00c12783          	lw	a5,12(sp)
    8c84:	00050613          	mv	a2,a0
    8c88:	00058693          	mv	a3,a1
    8c8c:	00078513          	mv	a0,a5
    8c90:	000d0593          	mv	a1,s10
    8c94:	2a5010ef          	jal	a738 <__subdf3>
    8c98:	00098613          	mv	a2,s3
    8c9c:	00090693          	mv	a3,s2
    8ca0:	4a8010ef          	jal	a148 <__muldf3>
    8ca4:	000b8613          	mv	a2,s7
    8ca8:	000b0693          	mv	a3,s6
    8cac:	28d010ef          	jal	a738 <__subdf3>
    8cb0:	000da603          	lw	a2,0(s11)
    8cb4:	004da683          	lw	a3,4(s11)
    8cb8:	00050993          	mv	s3,a0
    8cbc:	00058913          	mv	s2,a1
    8cc0:	000a8513          	mv	a0,s5
    8cc4:	000a0593          	mv	a1,s4
    8cc8:	480010ef          	jal	a148 <__muldf3>
    8ccc:	00050613          	mv	a2,a0
    8cd0:	00058693          	mv	a3,a1
    8cd4:	00098513          	mv	a0,s3
    8cd8:	00090593          	mv	a1,s2
    8cdc:	490000ef          	jal	916c <__adddf3>
    8ce0:	00050613          	mv	a2,a0
    8ce4:	00058693          	mv	a3,a1
    8ce8:	00048513          	mv	a0,s1
    8cec:	00040593          	mv	a1,s0
    8cf0:	249010ef          	jal	a738 <__subdf3>
    8cf4:	f09ff06f          	j	8bfc <.L9>

00008cf8 <__GI_floor>:
    8cf8:	4145d693          	sra	a3,a1,0x14
    8cfc:	fe010113          	add	sp,sp,-32
    8d00:	7ff6f693          	and	a3,a3,2047
    8d04:	00812c23          	sw	s0,24(sp)
    8d08:	00912a23          	sw	s1,20(sp)
    8d0c:	01312623          	sw	s3,12(sp)
    8d10:	01512223          	sw	s5,4(sp)
    8d14:	00112e23          	sw	ra,28(sp)
    8d18:	01212823          	sw	s2,16(sp)
    8d1c:	01412423          	sw	s4,8(sp)
    8d20:	c0168493          	add	s1,a3,-1023
    8d24:	01300613          	li	a2,19
    8d28:	00050713          	mv	a4,a0
    8d2c:	00058793          	mv	a5,a1
    8d30:	00058413          	mv	s0,a1
    8d34:	00050a93          	mv	s5,a0
    8d38:	00050993          	mv	s3,a0
    8d3c:	0a964663          	blt	a2,s1,8de8 <.L2>
    8d40:	0404d863          	bgez	s1,8d90 <.L3>
    8d44:	00009797          	auipc	a5,0x9
    8d48:	31c78793          	add	a5,a5,796 # 12060 <.LC0>
    8d4c:	0007a603          	lw	a2,0(a5)
    8d50:	0047a683          	lw	a3,4(a5)
    8d54:	418000ef          	jal	916c <__adddf3>
    8d58:	00000613          	li	a2,0
    8d5c:	00000693          	li	a3,0
    8d60:	30c010ef          	jal	a06c <__gedf2>
    8d64:	02a05063          	blez	a0,8d84 <.L4>
    8d68:	14045063          	bgez	s0,8ea8 <.L13>
    8d6c:	00141413          	sll	s0,s0,0x1
    8d70:	00145413          	srl	s0,s0,0x1
    8d74:	01546433          	or	s0,s0,s5
    8d78:	00000993          	li	s3,0
    8d7c:	12041c63          	bnez	s0,8eb4 <.L14>
    8d80:	80000437          	lui	s0,0x80000

00008d84 <.L4>:
    8d84:	00098713          	mv	a4,s3
    8d88:	00040793          	mv	a5,s0
    8d8c:	0800006f          	j	8e0c <.L6>

00008d90 <.L3>:
    8d90:	00100a37          	lui	s4,0x100
    8d94:	fffa0913          	add	s2,s4,-1 # fffff <_ebss+0xea10f>
    8d98:	40995933          	sra	s2,s2,s1
    8d9c:	0125f6b3          	and	a3,a1,s2
    8da0:	00a6e6b3          	or	a3,a3,a0
    8da4:	06068463          	beqz	a3,8e0c <.L6>
    8da8:	00009797          	auipc	a5,0x9
    8dac:	2b878793          	add	a5,a5,696 # 12060 <.LC0>
    8db0:	0007a603          	lw	a2,0(a5)
    8db4:	0047a683          	lw	a3,4(a5)
    8db8:	3b4000ef          	jal	916c <__adddf3>
    8dbc:	00000613          	li	a2,0
    8dc0:	00000693          	li	a3,0
    8dc4:	2a8010ef          	jal	a06c <__gedf2>
    8dc8:	faa05ee3          	blez	a0,8d84 <.L4>
    8dcc:	00045663          	bgez	s0,8dd8 <.L8>
    8dd0:	409a5a33          	sra	s4,s4,s1
    8dd4:	01440433          	add	s0,s0,s4

00008dd8 <.L8>:
    8dd8:	fff94913          	not	s2,s2
    8ddc:	01247433          	and	s0,s0,s2
    8de0:	00000993          	li	s3,0
    8de4:	fa1ff06f          	j	8d84 <.L4>

00008de8 <.L2>:
    8de8:	03300613          	li	a2,51
    8dec:	04965663          	bge	a2,s1,8e38 <.L9>
    8df0:	40000693          	li	a3,1024
    8df4:	00d49c63          	bne	s1,a3,8e0c <.L6>
    8df8:	00050613          	mv	a2,a0
    8dfc:	00058693          	mv	a3,a1
    8e00:	36c000ef          	jal	916c <__adddf3>
    8e04:	00050713          	mv	a4,a0
    8e08:	00058793          	mv	a5,a1

00008e0c <.L6>:
    8e0c:	01c12083          	lw	ra,28(sp)
    8e10:	01812403          	lw	s0,24(sp)
    8e14:	01412483          	lw	s1,20(sp)
    8e18:	01012903          	lw	s2,16(sp)
    8e1c:	00c12983          	lw	s3,12(sp)
    8e20:	00812a03          	lw	s4,8(sp)
    8e24:	00412a83          	lw	s5,4(sp)
    8e28:	00070513          	mv	a0,a4
    8e2c:	00078593          	mv	a1,a5
    8e30:	02010113          	add	sp,sp,32
    8e34:	00008067          	ret

00008e38 <.L9>:
    8e38:	bed68693          	add	a3,a3,-1043
    8e3c:	fff00913          	li	s2,-1
    8e40:	00d95933          	srl	s2,s2,a3
    8e44:	00a976b3          	and	a3,s2,a0
    8e48:	fc0682e3          	beqz	a3,8e0c <.L6>
    8e4c:	00009797          	auipc	a5,0x9
    8e50:	21478793          	add	a5,a5,532 # 12060 <.LC0>
    8e54:	0007a603          	lw	a2,0(a5)
    8e58:	0047a683          	lw	a3,4(a5)
    8e5c:	310000ef          	jal	916c <__adddf3>
    8e60:	00000613          	li	a2,0
    8e64:	00000693          	li	a3,0
    8e68:	204010ef          	jal	a06c <__gedf2>
    8e6c:	f0a05ce3          	blez	a0,8d84 <.L4>
    8e70:	02045663          	bgez	s0,8e9c <.L11>
    8e74:	01400793          	li	a5,20
    8e78:	00f49663          	bne	s1,a5,8e84 <.L12>

00008e7c <.L25>:
    8e7c:	00140413          	add	s0,s0,1 # 80000001 <_ebss+0x7ffea111>
    8e80:	01c0006f          	j	8e9c <.L11>

00008e84 <.L12>:
    8e84:	03400713          	li	a4,52
    8e88:	40970733          	sub	a4,a4,s1
    8e8c:	00100793          	li	a5,1
    8e90:	00e797b3          	sll	a5,a5,a4
    8e94:	00fa89b3          	add	s3,s5,a5
    8e98:	ff59e2e3          	bltu	s3,s5,8e7c <.L25>

00008e9c <.L11>:
    8e9c:	fff94913          	not	s2,s2
    8ea0:	0129f9b3          	and	s3,s3,s2
    8ea4:	ee1ff06f          	j	8d84 <.L4>

00008ea8 <.L13>:
    8ea8:	00000993          	li	s3,0
    8eac:	00000413          	li	s0,0
    8eb0:	ed5ff06f          	j	8d84 <.L4>

00008eb4 <.L14>:
    8eb4:	bff00437          	lui	s0,0xbff00
    8eb8:	ecdff06f          	j	8d84 <.L4>

00008ebc <__GI_scalbln>:
    8ebc:	ff010113          	add	sp,sp,-16
    8ec0:	4145d693          	sra	a3,a1,0x14
    8ec4:	00812423          	sw	s0,8(sp)
    8ec8:	00112623          	sw	ra,12(sp)
    8ecc:	00912223          	sw	s1,4(sp)
    8ed0:	7ff6f693          	and	a3,a3,2047
    8ed4:	00050713          	mv	a4,a0
    8ed8:	00058793          	mv	a5,a1
    8edc:	00060413          	mv	s0,a2
    8ee0:	08069063          	bnez	a3,8f60 <.L2>
    8ee4:	00159693          	sll	a3,a1,0x1
    8ee8:	0016d693          	srl	a3,a3,0x1
    8eec:	00a6e6b3          	or	a3,a3,a0
    8ef0:	0c068263          	beqz	a3,8fb4 <.L3>
    8ef4:	00009797          	auipc	a5,0x9
    8ef8:	2b478793          	add	a5,a5,692 # 121a8 <.LC0>
    8efc:	0047a683          	lw	a3,4(a5)
    8f00:	0007a603          	lw	a2,0(a5)
    8f04:	244010ef          	jal	a148 <__muldf3>
    8f08:	4145d693          	sra	a3,a1,0x14
    8f0c:	7ff6f693          	and	a3,a3,2047
    8f10:	00050713          	mv	a4,a0
    8f14:	00058793          	mv	a5,a1
    8f18:	00058813          	mv	a6,a1
    8f1c:	fca68693          	add	a3,a3,-54

00008f20 <.L4>:
    8f20:	00d406b3          	add	a3,s0,a3
    8f24:	7fe00613          	li	a2,2046
    8f28:	04d65e63          	bge	a2,a3,8f84 <.L5>
    8f2c:	00009697          	auipc	a3,0x9
    8f30:	13468693          	add	a3,a3,308 # 12060 <.LC0>

00008f34 <.L15>:
    8f34:	0006a403          	lw	s0,0(a3)
    8f38:	0046a483          	lw	s1,4(a3)
    8f3c:	00070613          	mv	a2,a4
    8f40:	00078693          	mv	a3,a5
    8f44:	00040513          	mv	a0,s0
    8f48:	00048593          	mv	a1,s1
    8f4c:	1a0000ef          	jal	90ec <__GI_copysign>
    8f50:	00040613          	mv	a2,s0
    8f54:	00048693          	mv	a3,s1

00008f58 <.L14>:
    8f58:	1f0010ef          	jal	a148 <__muldf3>
    8f5c:	01c0006f          	j	8f78 <.L13>

00008f60 <.L2>:
    8f60:	7ff00613          	li	a2,2047
    8f64:	00058813          	mv	a6,a1
    8f68:	fac69ce3          	bne	a3,a2,8f20 <.L4>
    8f6c:	00050613          	mv	a2,a0
    8f70:	00058693          	mv	a3,a1
    8f74:	1f8000ef          	jal	916c <__adddf3>

00008f78 <.L13>:
    8f78:	00050713          	mv	a4,a0
    8f7c:	00058793          	mv	a5,a1
    8f80:	0340006f          	j	8fb4 <.L3>

00008f84 <.L5>:
    8f84:	ffff4637          	lui	a2,0xffff4
    8f88:	cb060613          	add	a2,a2,-848 # ffff3cb0 <_ebss+0xfffdddc0>
    8f8c:	00c45863          	bge	s0,a2,8f9c <.L6>

00008f90 <.L16>:
    8f90:	00009697          	auipc	a3,0x9
    8f94:	22068693          	add	a3,a3,544 # 121b0 <.LC2>
    8f98:	f9dff06f          	j	8f34 <.L15>

00008f9c <.L6>:
    8f9c:	02d05a63          	blez	a3,8fd0 <.L7>
    8fa0:	801007b7          	lui	a5,0x80100
    8fa4:	fff78793          	add	a5,a5,-1 # 800fffff <_ebss+0x800ea10f>
    8fa8:	00f87833          	and	a6,a6,a5
    8fac:	01469693          	sll	a3,a3,0x14
    8fb0:	00d867b3          	or	a5,a6,a3

00008fb4 <.L3>:
    8fb4:	00c12083          	lw	ra,12(sp)
    8fb8:	00812403          	lw	s0,8(sp)
    8fbc:	00412483          	lw	s1,4(sp)
    8fc0:	00070513          	mv	a0,a4
    8fc4:	00078593          	mv	a1,a5
    8fc8:	01010113          	add	sp,sp,16
    8fcc:	00008067          	ret

00008fd0 <.L7>:
    8fd0:	fcb00613          	li	a2,-53
    8fd4:	fac6cee3          	blt	a3,a2,8f90 <.L16>
    8fd8:	801007b7          	lui	a5,0x80100
    8fdc:	fff78793          	add	a5,a5,-1 # 800fffff <_ebss+0x800ea10f>
    8fe0:	03668693          	add	a3,a3,54
    8fe4:	01469693          	sll	a3,a3,0x14
    8fe8:	00f87833          	and	a6,a6,a5
    8fec:	00070893          	mv	a7,a4
    8ff0:	0106e7b3          	or	a5,a3,a6
    8ff4:	00009717          	auipc	a4,0x9
    8ff8:	1c470713          	add	a4,a4,452 # 121b8 <.LC3>
    8ffc:	00072603          	lw	a2,0(a4)
    9000:	00472683          	lw	a3,4(a4)
    9004:	00088513          	mv	a0,a7
    9008:	00078593          	mv	a1,a5
    900c:	f4dff06f          	j	8f58 <.L14>

00009010 <__GI_read>:
    9010:	03f00893          	li	a7,63
    9014:	00000073          	ecall
    9018:	fffff7b7          	lui	a5,0xfffff
    901c:	00a7fc63          	bgeu	a5,a0,9034 <.L1>
    9020:	40a00533          	neg	a0,a0
    9024:	00007797          	auipc	a5,0x7
    9028:	2707a783          	lw	a5,624(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    902c:	00a7a023          	sw	a0,0(a5)
    9030:	fff00513          	li	a0,-1

00009034 <.L1>:
    9034:	00008067          	ret

00009038 <__GI_sigprocmask>:
    9038:	00800693          	li	a3,8
    903c:	08700893          	li	a7,135
    9040:	00000073          	ecall
    9044:	fffff7b7          	lui	a5,0xfffff
    9048:	00a7fc63          	bgeu	a5,a0,9060 <.L1>
    904c:	40a00533          	neg	a0,a0
    9050:	00007797          	auipc	a5,0x7
    9054:	2447a783          	lw	a5,580(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    9058:	00a7a023          	sw	a0,0(a5)
    905c:	fff00513          	li	a0,-1

00009060 <.L1>:
    9060:	00008067          	ret

00009064 <__GI_lseek64>:
    9064:	00058793          	mv	a5,a1
    9068:	ff010113          	add	sp,sp,-16
    906c:	00068713          	mv	a4,a3
    9070:	00060593          	mv	a1,a2
    9074:	00810693          	add	a3,sp,8
    9078:	00078613          	mv	a2,a5
    907c:	03e00893          	li	a7,62
    9080:	00000073          	ecall
    9084:	fffff7b7          	lui	a5,0xfffff
    9088:	02a7f263          	bgeu	a5,a0,90ac <.L2>
    908c:	40a00533          	neg	a0,a0
    9090:	00007797          	auipc	a5,0x7
    9094:	2047a783          	lw	a5,516(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    9098:	00a7a023          	sw	a0,0(a5)
    909c:	fff00593          	li	a1,-1
    90a0:	fff00513          	li	a0,-1

000090a4 <.L1>:
    90a4:	01010113          	add	sp,sp,16
    90a8:	00008067          	ret

000090ac <.L2>:
    90ac:	41f55593          	sra	a1,a0,0x1f
    90b0:	00b567b3          	or	a5,a0,a1
    90b4:	fe0798e3          	bnez	a5,90a4 <.L1>
    90b8:	00812503          	lw	a0,8(sp)
    90bc:	00c12583          	lw	a1,12(sp)
    90c0:	fe5ff06f          	j	90a4 <.L1>

000090c4 <__GI_sigaction>:
    90c4:	00800693          	li	a3,8
    90c8:	0480006f          	j	9110 <__syscall_rt_sigaction>

000090cc <__GI_raise>:
    90cc:	fe010113          	add	sp,sp,-32
    90d0:	00112e23          	sw	ra,28(sp)
    90d4:	00a12623          	sw	a0,12(sp)
    90d8:	060000ef          	jal	9138 <__GI_getpid>
    90dc:	00c12583          	lw	a1,12(sp)
    90e0:	01c12083          	lw	ra,28(sp)
    90e4:	02010113          	add	sp,sp,32
    90e8:	05c0006f          	j	9144 <__GI_kill>

000090ec <__GI_copysign>:
    90ec:	800007b7          	lui	a5,0x80000
    90f0:	fff78713          	add	a4,a5,-1 # 7fffffff <_ebss+0x7ffea10f>
    90f4:	00b775b3          	and	a1,a4,a1
    90f8:	00d7f7b3          	and	a5,a5,a3
    90fc:	00f5e733          	or	a4,a1,a5
    9100:	00050693          	mv	a3,a0
    9104:	00068513          	mv	a0,a3
    9108:	00070593          	mv	a1,a4
    910c:	00008067          	ret

00009110 <__syscall_rt_sigaction>:
    9110:	08600893          	li	a7,134
    9114:	00000073          	ecall
    9118:	fffff7b7          	lui	a5,0xfffff
    911c:	00a7fc63          	bgeu	a5,a0,9134 <.L1>
    9120:	40a00533          	neg	a0,a0
    9124:	00007797          	auipc	a5,0x7
    9128:	1707a783          	lw	a5,368(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    912c:	00a7a023          	sw	a0,0(a5)
    9130:	fff00513          	li	a0,-1

00009134 <.L1>:
    9134:	00008067          	ret

00009138 <__GI_getpid>:
    9138:	0ac00893          	li	a7,172
    913c:	00000073          	ecall
    9140:	00008067          	ret

00009144 <__GI_kill>:
    9144:	08100893          	li	a7,129
    9148:	00000073          	ecall
    914c:	fffff7b7          	lui	a5,0xfffff
    9150:	00a7fc63          	bgeu	a5,a0,9168 <.L1>
    9154:	40a00533          	neg	a0,a0
    9158:	00007797          	auipc	a5,0x7
    915c:	13c7a783          	lw	a5,316(a5) # 10294 <_GLOBAL_OFFSET_TABLE_+0xc>
    9160:	00a7a023          	sw	a0,0(a5)
    9164:	fff00513          	li	a0,-1

00009168 <.L1>:
    9168:	00008067          	ret

0000916c <__adddf3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
    916c:	00100837          	lui	a6,0x100
    9170:	fff80813          	add	a6,a6,-1 # fffff <_ebss+0xea10f>

00009174 <.LBE2>:
{
    9174:	fe010113          	add	sp,sp,-32

00009178 <.LBB3>:
  FP_UNPACK_SEMIRAW_D (A, a);
    9178:	00b878b3          	and	a7,a6,a1

0000917c <.LVL1>:
    917c:	0145d713          	srl	a4,a1,0x14

00009180 <.LBE3>:
    9180:	01d55793          	srl	a5,a0,0x1d

00009184 <.LBB5>:
  FP_UNPACK_SEMIRAW_D (B, b);
    9184:	00d87833          	and	a6,a6,a3

00009188 <.LBE5>:
{
    9188:	00912a23          	sw	s1,20(sp)

0000918c <.LBB6>:
  FP_UNPACK_SEMIRAW_D (A, a);
    918c:	7ff77493          	and	s1,a4,2047

00009190 <.LBE6>:
    9190:	00389713          	sll	a4,a7,0x3

00009194 <.LBB8>:
  FP_UNPACK_SEMIRAW_D (B, b);
    9194:	0146d893          	srl	a7,a3,0x14

00009198 <.LBE8>:
    9198:	00381813          	sll	a6,a6,0x3
{
    919c:	01212823          	sw	s2,16(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
    91a0:	00e7e7b3          	or	a5,a5,a4

000091a4 <.LBB11>:
  FP_UNPACK_SEMIRAW_D (B, b);
    91a4:	7ff8f893          	and	a7,a7,2047

000091a8 <.LBE11>:
    91a8:	01d65713          	srl	a4,a2,0x1d
{
    91ac:	00112e23          	sw	ra,28(sp)
    91b0:	00812c23          	sw	s0,24(sp)
    91b4:	01312623          	sw	s3,12(sp)

000091b8 <.LBB13>:
  FP_UNPACK_SEMIRAW_D (A, a);
    91b8:	01f5d913          	srl	s2,a1,0x1f

000091bc <.LBB15>:
  FP_UNPACK_SEMIRAW_D (B, b);
    91bc:	01f6d693          	srl	a3,a3,0x1f

000091c0 <.LBE15>:
    91c0:	01076733          	or	a4,a4,a6
  FP_UNPACK_SEMIRAW_D (A, a);
    91c4:	00351513          	sll	a0,a0,0x3

000091c8 <.LBB18>:
  FP_UNPACK_SEMIRAW_D (B, b);
    91c8:	00361613          	sll	a2,a2,0x3

000091cc <.LVL6>:
  FP_ADD_D (R, A, B);
    91cc:	41148833          	sub	a6,s1,a7
    91d0:	2ad91a63          	bne	s2,a3,9484 <.L2>

000091d4 <.LBB20>:
    91d4:	11005c63          	blez	a6,92ec <.L3>

000091d8 <.LVL8>:
    91d8:	04089063          	bnez	a7,9218 <.L4>
    91dc:	00c766b3          	or	a3,a4,a2

000091e0 <.LVL9>:
    91e0:	66068063          	beqz	a3,9840 <.L100>
    91e4:	fff80593          	add	a1,a6,-1

000091e8 <.LVL10>:
    91e8:	02059063          	bnez	a1,9208 <.L6>

000091ec <.L143>:
    91ec:	00c50633          	add	a2,a0,a2

000091f0 <.LVL12>:
    91f0:	00a636b3          	sltu	a3,a2,a0
    91f4:	00e78733          	add	a4,a5,a4

000091f8 <.LVL13>:
    91f8:	00060513          	mv	a0,a2

000091fc <.LVL14>:
    91fc:	00d707b3          	add	a5,a4,a3

00009200 <.LBE21>:
    9200:	00100493          	li	s1,1

00009204 <.LVL16>:
    9204:	06c0006f          	j	9270 <.L9>

00009208 <.L6>:
    9208:	7ff00693          	li	a3,2047
    920c:	02d81063          	bne	a6,a3,922c <.L10>

00009210 <.L110>:
    9210:	7ff00493          	li	s1,2047

00009214 <.LVL19>:
    9214:	1f80006f          	j	940c <.L5>

00009218 <.L4>:
    9218:	7ff00693          	li	a3,2047

0000921c <.LVL21>:
    921c:	1ed48863          	beq	s1,a3,940c <.L5>
    9220:	008006b7          	lui	a3,0x800
    9224:	00d76733          	or	a4,a4,a3
    9228:	00080593          	mv	a1,a6

0000922c <.L10>:
    922c:	03800693          	li	a3,56
    9230:	0ab6c863          	blt	a3,a1,92e0 <.L11>
    9234:	01f00693          	li	a3,31
    9238:	06b6ca63          	blt	a3,a1,92ac <.L12>
    923c:	02000813          	li	a6,32
    9240:	40b80833          	sub	a6,a6,a1
    9244:	010716b3          	sll	a3,a4,a6
    9248:	00b658b3          	srl	a7,a2,a1

0000924c <.LVL24>:
    924c:	01061833          	sll	a6,a2,a6
    9250:	0116e6b3          	or	a3,a3,a7
    9254:	01003833          	snez	a6,a6
    9258:	0106e6b3          	or	a3,a3,a6

0000925c <.LVL25>:
    925c:	00b755b3          	srl	a1,a4,a1

00009260 <.L13>:
    9260:	00a68533          	add	a0,a3,a0

00009264 <.LVL27>:
    9264:	00f585b3          	add	a1,a1,a5

00009268 <.LVL28>:
    9268:	00d536b3          	sltu	a3,a0,a3

0000926c <.LVL29>:
    926c:	00d587b3          	add	a5,a1,a3

00009270 <.L9>:
    9270:	00879713          	sll	a4,a5,0x8
    9274:	18075c63          	bgez	a4,940c <.L5>

00009278 <.LVL31>:
    9278:	00148493          	add	s1,s1,1

0000927c <.LVL32>:
    927c:	7ff00713          	li	a4,2047
    9280:	5ae48a63          	beq	s1,a4,9834 <.L150>
    9284:	ff800737          	lui	a4,0xff800
    9288:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7ea10f>
    928c:	00e7f733          	and	a4,a5,a4
    9290:	00155793          	srl	a5,a0,0x1

00009294 <.LVL33>:
    9294:	00157513          	and	a0,a0,1
    9298:	00a7e7b3          	or	a5,a5,a0
    929c:	01f71513          	sll	a0,a4,0x1f
    92a0:	00f56533          	or	a0,a0,a5
    92a4:	00175793          	srl	a5,a4,0x1
    92a8:	1640006f          	j	940c <.L5>

000092ac <.L12>:
    92ac:	fe058693          	add	a3,a1,-32
    92b0:	02000893          	li	a7,32

000092b4 <.LVL35>:
    92b4:	00d756b3          	srl	a3,a4,a3
    92b8:	00000813          	li	a6,0
    92bc:	01158863          	beq	a1,a7,92cc <.L14>
    92c0:	04000813          	li	a6,64
    92c4:	40b80833          	sub	a6,a6,a1
    92c8:	01071833          	sll	a6,a4,a6

000092cc <.L14>:
    92cc:	00c86833          	or	a6,a6,a2
    92d0:	01003833          	snez	a6,a6
    92d4:	0106e6b3          	or	a3,a3,a6

000092d8 <.L141>:
    92d8:	00000593          	li	a1,0

000092dc <.LVL37>:
    92dc:	f85ff06f          	j	9260 <.L13>

000092e0 <.L11>:
    92e0:	00c766b3          	or	a3,a4,a2
    92e4:	00d036b3          	snez	a3,a3
    92e8:	ff1ff06f          	j	92d8 <.L141>

000092ec <.L3>:
    92ec:	0c080a63          	beqz	a6,93c0 <.L17>
    92f0:	409886b3          	sub	a3,a7,s1

000092f4 <.LVL40>:
    92f4:	02049463          	bnez	s1,931c <.L18>
    92f8:	00a7e5b3          	or	a1,a5,a0
    92fc:	50058e63          	beqz	a1,9818 <.L91>
    9300:	fff68593          	add	a1,a3,-1 # 7fffff <_ebss+0x7ea10f>

00009304 <.LVL41>:
    9304:	ee0584e3          	beqz	a1,91ec <.L143>
    9308:	7ff00813          	li	a6,2047
    930c:	03069263          	bne	a3,a6,9330 <.L22>

00009310 <.L96>:
    9310:	00070793          	mv	a5,a4

00009314 <.LVL43>:
    9314:	00060513          	mv	a0,a2

00009318 <.LVL44>:
    9318:	ef9ff06f          	j	9210 <.L110>

0000931c <.L18>:
    931c:	7ff00593          	li	a1,2047
    9320:	feb888e3          	beq	a7,a1,9310 <.L96>
    9324:	008005b7          	lui	a1,0x800
    9328:	00b7e7b3          	or	a5,a5,a1
    932c:	00068593          	mv	a1,a3

00009330 <.L22>:
    9330:	03800693          	li	a3,56
    9334:	08b6c063          	blt	a3,a1,93b4 <.L23>
    9338:	01f00693          	li	a3,31
    933c:	04b6c263          	blt	a3,a1,9380 <.L24>
    9340:	02000813          	li	a6,32
    9344:	40b80833          	sub	a6,a6,a1
    9348:	010796b3          	sll	a3,a5,a6
    934c:	00b55333          	srl	t1,a0,a1
    9350:	01051833          	sll	a6,a0,a6
    9354:	0066e6b3          	or	a3,a3,t1
    9358:	01003833          	snez	a6,a6
    935c:	0106e6b3          	or	a3,a3,a6

00009360 <.LVL48>:
    9360:	00b7d5b3          	srl	a1,a5,a1

00009364 <.L25>:
    9364:	00c68633          	add	a2,a3,a2

00009368 <.LVL50>:
    9368:	00e585b3          	add	a1,a1,a4

0000936c <.LVL51>:
    936c:	00d636b3          	sltu	a3,a2,a3

00009370 <.LVL52>:
    9370:	00060513          	mv	a0,a2

00009374 <.LVL53>:
    9374:	00d587b3          	add	a5,a1,a3

00009378 <.LBE28>:
    9378:	00088493          	mv	s1,a7

0000937c <.LVL55>:
    937c:	ef5ff06f          	j	9270 <.L9>

00009380 <.L24>:
    9380:	fe058693          	add	a3,a1,-32 # 7fffe0 <_ebss+0x7ea0f0>
    9384:	02000313          	li	t1,32
    9388:	00d7d6b3          	srl	a3,a5,a3
    938c:	00000813          	li	a6,0
    9390:	00658863          	beq	a1,t1,93a0 <.L26>
    9394:	04000813          	li	a6,64
    9398:	40b80833          	sub	a6,a6,a1
    939c:	01079833          	sll	a6,a5,a6

000093a0 <.L26>:
    93a0:	00a86833          	or	a6,a6,a0
    93a4:	01003833          	snez	a6,a6
    93a8:	0106e6b3          	or	a3,a3,a6

000093ac <.L142>:
    93ac:	00000593          	li	a1,0

000093b0 <.LVL58>:
    93b0:	fb5ff06f          	j	9364 <.L25>

000093b4 <.L23>:
    93b4:	00a7e6b3          	or	a3,a5,a0
    93b8:	00d036b3          	snez	a3,a3
    93bc:	ff1ff06f          	j	93ac <.L142>

000093c0 <.L17>:
    93c0:	00148693          	add	a3,s1,1

000093c4 <.LVL61>:
    93c4:	7fe6f593          	and	a1,a3,2046
    93c8:	08059663          	bnez	a1,9454 <.L29>
    93cc:	00a7e6b3          	or	a3,a5,a0
    93d0:	06049263          	bnez	s1,9434 <.L30>

000093d4 <.LVL62>:
    93d4:	44068863          	beqz	a3,9824 <.L95>
    93d8:	00c766b3          	or	a3,a4,a2
    93dc:	02068863          	beqz	a3,940c <.L5>

000093e0 <.LBB30>:
    93e0:	00c50633          	add	a2,a0,a2

000093e4 <.LVL63>:
    93e4:	00a636b3          	sltu	a3,a2,a0
    93e8:	00e78733          	add	a4,a5,a4

000093ec <.LVL64>:
    93ec:	00d707b3          	add	a5,a4,a3

000093f0 <.LBE30>:
    93f0:	00879713          	sll	a4,a5,0x8

000093f4 <.LBB31>:
    93f4:	00060513          	mv	a0,a2

000093f8 <.LBE31>:
    93f8:	00075a63          	bgez	a4,940c <.L5>
    93fc:	ff800737          	lui	a4,0xff800
    9400:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7ea10f>
    9404:	00e7f7b3          	and	a5,a5,a4

00009408 <.LVL67>:
    9408:	00100493          	li	s1,1

0000940c <.L5>:
  FP_PACK_SEMIRAW_D (r, R);
    940c:	00757713          	and	a4,a0,7
    9410:	44070863          	beqz	a4,9860 <.L83>
    9414:	00f57713          	and	a4,a0,15
    9418:	00400693          	li	a3,4
    941c:	44d70263          	beq	a4,a3,9860 <.L83>

00009420 <.LBB64>:
    9420:	00450713          	add	a4,a0,4
    9424:	00a736b3          	sltu	a3,a4,a0
    9428:	00d787b3          	add	a5,a5,a3

0000942c <.LVL69>:
    942c:	00070513          	mv	a0,a4

00009430 <.LVL70>:
    9430:	4300006f          	j	9860 <.L83>

00009434 <.L30>:
  FP_ADD_D (R, A, B);
    9434:	ec068ee3          	beqz	a3,9310 <.L96>
    9438:	00c76633          	or	a2,a4,a2

0000943c <.LVL72>:
    943c:	dc060ae3          	beqz	a2,9210 <.L110>

00009440 <.L109>:
    9440:	00000913          	li	s2,0

00009444 <.LVL74>:
    9444:	004007b7          	lui	a5,0x400

00009448 <.LVL75>:
    9448:	00000513          	li	a0,0

0000944c <.LVL76>:
    944c:	7ff00493          	li	s1,2047

00009450 <.LVL77>:
    9450:	4100006f          	j	9860 <.L83>

00009454 <.L29>:
    9454:	7ff00593          	li	a1,2047
    9458:	3cb68c63          	beq	a3,a1,9830 <.L98>
    945c:	00c50633          	add	a2,a0,a2

00009460 <.LBB34>:
    9460:	00a63533          	sltu	a0,a2,a0

00009464 <.LVL80>:
    9464:	00e78733          	add	a4,a5,a4

00009468 <.LVL81>:
    9468:	00a70733          	add	a4,a4,a0

0000946c <.LBE34>:
    946c:	01f71513          	sll	a0,a4,0x1f
    9470:	00165613          	srl	a2,a2,0x1

00009474 <.LVL82>:
    9474:	00c56533          	or	a0,a0,a2
    9478:	00175793          	srl	a5,a4,0x1

0000947c <.L147>:
    947c:	00068493          	mv	s1,a3

00009480 <.LVL84>:
    9480:	f8dff06f          	j	940c <.L5>

00009484 <.L2>:
    9484:	0f005c63          	blez	a6,957c <.L35>

00009488 <.LVL86>:
    9488:	08089e63          	bnez	a7,9524 <.L36>
    948c:	00c766b3          	or	a3,a4,a2

00009490 <.LVL87>:
    9490:	3a068863          	beqz	a3,9840 <.L100>
    9494:	fff80693          	add	a3,a6,-1

00009498 <.LVL88>:
    9498:	02069063          	bnez	a3,94b8 <.L37>

0000949c <.LBB38>:
    949c:	40c50633          	sub	a2,a0,a2

000094a0 <.LVL89>:
    94a0:	00c536b3          	sltu	a3,a0,a2

000094a4 <.LVL90>:
    94a4:	40e78733          	sub	a4,a5,a4

000094a8 <.LVL91>:
    94a8:	00060513          	mv	a0,a2

000094ac <.LVL92>:
    94ac:	40d707b3          	sub	a5,a4,a3

000094b0 <.L146>:
    94b0:	00100493          	li	s1,1

000094b4 <.LVL94>:
    94b4:	0540006f          	j	9508 <.L40>

000094b8 <.L37>:
    94b8:	7ff00593          	li	a1,2047
    94bc:	d4b80ae3          	beq	a6,a1,9210 <.L110>

000094c0 <.L41>:
    94c0:	03800593          	li	a1,56
    94c4:	0ad5c663          	blt	a1,a3,9570 <.L42>
    94c8:	01f00593          	li	a1,31
    94cc:	06d5c863          	blt	a1,a3,953c <.L43>
    94d0:	02000813          	li	a6,32
    94d4:	40d80833          	sub	a6,a6,a3
    94d8:	00d658b3          	srl	a7,a2,a3

000094dc <.LVL96>:
    94dc:	010715b3          	sll	a1,a4,a6
    94e0:	01061833          	sll	a6,a2,a6
    94e4:	0115e5b3          	or	a1,a1,a7
    94e8:	01003833          	snez	a6,a6
    94ec:	0105e633          	or	a2,a1,a6
    94f0:	00d756b3          	srl	a3,a4,a3

000094f4 <.L44>:
    94f4:	40c50633          	sub	a2,a0,a2

000094f8 <.LVL99>:
    94f8:	00c53733          	sltu	a4,a0,a2
    94fc:	40d786b3          	sub	a3,a5,a3

00009500 <.LVL100>:
    9500:	00060513          	mv	a0,a2

00009504 <.LVL101>:
    9504:	40e687b3          	sub	a5,a3,a4

00009508 <.L40>:
    9508:	00879713          	sll	a4,a5,0x8
    950c:	f00750e3          	bgez	a4,940c <.L5>

00009510 <.LBB41>:
    9510:	00800437          	lui	s0,0x800
    9514:	fff40413          	add	s0,s0,-1 # 7fffff <_ebss+0x7ea10f>
    9518:	0087f433          	and	s0,a5,s0

0000951c <.LVL103>:
    951c:	00050993          	mv	s3,a0
    9520:	2100006f          	j	9730 <.L74>

00009524 <.L36>:
    9524:	7ff00693          	li	a3,2047

00009528 <.LVL105>:
    9528:	eed482e3          	beq	s1,a3,940c <.L5>
    952c:	008006b7          	lui	a3,0x800
    9530:	00d76733          	or	a4,a4,a3
    9534:	00080693          	mv	a3,a6
    9538:	f89ff06f          	j	94c0 <.L41>

0000953c <.L43>:
    953c:	fe068593          	add	a1,a3,-32 # 7fffe0 <_ebss+0x7ea0f0>
    9540:	02000893          	li	a7,32

00009544 <.LVL108>:
    9544:	00b755b3          	srl	a1,a4,a1
    9548:	00000813          	li	a6,0
    954c:	01168863          	beq	a3,a7,955c <.L45>
    9550:	04000813          	li	a6,64
    9554:	40d80833          	sub	a6,a6,a3
    9558:	01071833          	sll	a6,a4,a6

0000955c <.L45>:
    955c:	00c86833          	or	a6,a6,a2
    9560:	01003833          	snez	a6,a6
    9564:	0105e633          	or	a2,a1,a6

00009568 <.L144>:
    9568:	00000693          	li	a3,0

0000956c <.LVL110>:
    956c:	f89ff06f          	j	94f4 <.L44>

00009570 <.L42>:
    9570:	00c76633          	or	a2,a4,a2

00009574 <.LVL112>:
    9574:	00c03633          	snez	a2,a2
    9578:	ff1ff06f          	j	9568 <.L144>

0000957c <.L35>:
    957c:	0e080863          	beqz	a6,966c <.L48>
    9580:	40988833          	sub	a6,a7,s1

00009584 <.LVL114>:
    9584:	04049263          	bnez	s1,95c8 <.L49>
    9588:	00a7e5b3          	or	a1,a5,a0
    958c:	2a058e63          	beqz	a1,9848 <.L103>
    9590:	fff80593          	add	a1,a6,-1

00009594 <.LVL115>:
    9594:	00059e63          	bnez	a1,95b0 <.L50>

00009598 <.LBB47>:
    9598:	40a60533          	sub	a0,a2,a0

0000959c <.LVL117>:
    959c:	40f70733          	sub	a4,a4,a5

000095a0 <.LVL118>:
    95a0:	00a63633          	sltu	a2,a2,a0

000095a4 <.LVL119>:
    95a4:	40c707b3          	sub	a5,a4,a2

000095a8 <.LBE47>:
    95a8:	00068913          	mv	s2,a3

000095ac <.LVL121>:
    95ac:	f05ff06f          	j	94b0 <.L146>

000095b0 <.L50>:
    95b0:	7ff00313          	li	t1,2047
    95b4:	02681463          	bne	a6,t1,95dc <.L53>

000095b8 <.L105>:
    95b8:	00070793          	mv	a5,a4

000095bc <.LVL124>:
    95bc:	00060513          	mv	a0,a2

000095c0 <.LVL125>:
    95c0:	7ff00493          	li	s1,2047

000095c4 <.LVL126>:
    95c4:	0d00006f          	j	9694 <.L148>

000095c8 <.L49>:
    95c8:	7ff00593          	li	a1,2047
    95cc:	feb886e3          	beq	a7,a1,95b8 <.L105>
    95d0:	008005b7          	lui	a1,0x800
    95d4:	00b7e7b3          	or	a5,a5,a1
    95d8:	00080593          	mv	a1,a6

000095dc <.L53>:
    95dc:	03800813          	li	a6,56
    95e0:	08b84063          	blt	a6,a1,9660 <.L54>
    95e4:	01f00813          	li	a6,31
    95e8:	04b84263          	blt	a6,a1,962c <.L55>
    95ec:	02000313          	li	t1,32
    95f0:	40b30333          	sub	t1,t1,a1
    95f4:	00b55e33          	srl	t3,a0,a1
    95f8:	00679833          	sll	a6,a5,t1
    95fc:	00651333          	sll	t1,a0,t1
    9600:	01c86833          	or	a6,a6,t3
    9604:	00603333          	snez	t1,t1
    9608:	00686533          	or	a0,a6,t1
    960c:	00b7d5b3          	srl	a1,a5,a1

00009610 <.L56>:
    9610:	40a60533          	sub	a0,a2,a0

00009614 <.LVL132>:
    9614:	40b705b3          	sub	a1,a4,a1

00009618 <.LVL133>:
    9618:	00a63633          	sltu	a2,a2,a0

0000961c <.LVL134>:
    961c:	40c587b3          	sub	a5,a1,a2

00009620 <.LBE49>:
    9620:	00088493          	mv	s1,a7

00009624 <.LVL136>:
    9624:	00068913          	mv	s2,a3

00009628 <.LVL137>:
    9628:	ee1ff06f          	j	9508 <.L40>

0000962c <.L55>:
    962c:	fe058813          	add	a6,a1,-32 # 7fffe0 <_ebss+0x7ea0f0>
    9630:	02000e13          	li	t3,32
    9634:	0107d833          	srl	a6,a5,a6
    9638:	00000313          	li	t1,0
    963c:	01c58863          	beq	a1,t3,964c <.L57>
    9640:	04000313          	li	t1,64
    9644:	40b30333          	sub	t1,t1,a1
    9648:	00679333          	sll	t1,a5,t1

0000964c <.L57>:
    964c:	00a36333          	or	t1,t1,a0
    9650:	00603333          	snez	t1,t1
    9654:	00686533          	or	a0,a6,t1

00009658 <.L145>:
    9658:	00000593          	li	a1,0

0000965c <.LVL140>:
    965c:	fb5ff06f          	j	9610 <.L56>

00009660 <.L54>:
    9660:	00a7e533          	or	a0,a5,a0

00009664 <.LVL142>:
    9664:	00a03533          	snez	a0,a0
    9668:	ff1ff06f          	j	9658 <.L145>

0000966c <.L48>:
    966c:	00148593          	add	a1,s1,1
    9670:	7fe5f593          	and	a1,a1,2046
    9674:	08059663          	bnez	a1,9700 <.L60>

00009678 <.LBB72>:
    9678:	00a7e833          	or	a6,a5,a0

0000967c <.LVL144>:
    967c:	00c765b3          	or	a1,a4,a2

00009680 <.LBB73>:
    9680:	06049063          	bnez	s1,96e0 <.L61>

00009684 <.LVL145>:
    9684:	00081c63          	bnez	a6,969c <.L62>

00009688 <.LVL146>:
    9688:	10058e63          	beqz	a1,97a4 <.L151>
    968c:	00070793          	mv	a5,a4

00009690 <.LVL147>:
    9690:	00060513          	mv	a0,a2

00009694 <.L148>:
    9694:	00068913          	mv	s2,a3

00009698 <.LVL149>:
    9698:	d75ff06f          	j	940c <.L5>

0000969c <.L62>:
    969c:	d60588e3          	beqz	a1,940c <.L5>

000096a0 <.LBB51>:
    96a0:	40c50833          	sub	a6,a0,a2

000096a4 <.LVL151>:
    96a4:	010538b3          	sltu	a7,a0,a6

000096a8 <.LVL152>:
    96a8:	40e785b3          	sub	a1,a5,a4
    96ac:	411585b3          	sub	a1,a1,a7

000096b0 <.LBE51>:
    96b0:	00859893          	sll	a7,a1,0x8
    96b4:	0008dc63          	bgez	a7,96cc <.L65>

000096b8 <.LBB52>:
    96b8:	40a60533          	sub	a0,a2,a0

000096bc <.LVL155>:
    96bc:	40f70733          	sub	a4,a4,a5

000096c0 <.LVL156>:
    96c0:	00a63633          	sltu	a2,a2,a0

000096c4 <.LVL157>:
    96c4:	40c707b3          	sub	a5,a4,a2

000096c8 <.LBE52>:
    96c8:	fcdff06f          	j	9694 <.L148>

000096cc <.L65>:
    96cc:	00b86533          	or	a0,a6,a1

000096d0 <.LVL160>:
    96d0:	18050463          	beqz	a0,9858 <.L108>

000096d4 <.LBB53>:
    96d4:	00058793          	mv	a5,a1

000096d8 <.LVL161>:
    96d8:	00080513          	mv	a0,a6
    96dc:	d31ff06f          	j	940c <.L5>

000096e0 <.L61>:
    96e0:	00081c63          	bnez	a6,96f8 <.L68>
    96e4:	d4058ee3          	beqz	a1,9440 <.L109>
    96e8:	00070793          	mv	a5,a4

000096ec <.LVL163>:
    96ec:	00060513          	mv	a0,a2

000096f0 <.LVL164>:
    96f0:	00068913          	mv	s2,a3

000096f4 <.LVL165>:
    96f4:	b1dff06f          	j	9210 <.L110>

000096f8 <.L68>:
    96f8:	b0058ce3          	beqz	a1,9210 <.L110>
    96fc:	d45ff06f          	j	9440 <.L109>

00009700 <.L60>:
    9700:	40c505b3          	sub	a1,a0,a2
    9704:	00b53833          	sltu	a6,a0,a1

00009708 <.LVL168>:
    9708:	40e78433          	sub	s0,a5,a4
    970c:	41040433          	sub	s0,s0,a6

00009710 <.LBE54>:
    9710:	00841813          	sll	a6,s0,0x8

00009714 <.LBB55>:
    9714:	00058993          	mv	s3,a1

00009718 <.LBE55>:
    9718:	08085063          	bgez	a6,9798 <.L71>

0000971c <.LBB56>:
    971c:	40a609b3          	sub	s3,a2,a0

00009720 <.LVL171>:
    9720:	40f70433          	sub	s0,a4,a5

00009724 <.LVL172>:
    9724:	01363633          	sltu	a2,a2,s3

00009728 <.LVL173>:
    9728:	40c40433          	sub	s0,s0,a2

0000972c <.LBE56>:
    972c:	00068913          	mv	s2,a3

00009730 <.L74>:
    9730:	06040e63          	beqz	s0,97ac <.L75>
    9734:	00040513          	mv	a0,s0
    9738:	eddf70ef          	jal	1614 <__clzsi2>

0000973c <.LVL176>:
    973c:	ff850693          	add	a3,a0,-8

00009740 <.L76>:
    9740:	02000793          	li	a5,32
    9744:	40d787b3          	sub	a5,a5,a3
    9748:	00d41433          	sll	s0,s0,a3

0000974c <.LVL178>:
    974c:	00f9d7b3          	srl	a5,s3,a5
    9750:	0087e7b3          	or	a5,a5,s0

00009754 <.LVL179>:
    9754:	00d99433          	sll	s0,s3,a3

00009758 <.L78>:
    9758:	0a96c463          	blt	a3,s1,9800 <.L79>
    975c:	409686b3          	sub	a3,a3,s1

00009760 <.LVL181>:
    9760:	00168613          	add	a2,a3,1

00009764 <.LVL182>:
    9764:	01f00713          	li	a4,31
    9768:	06c74263          	blt	a4,a2,97cc <.L80>
    976c:	02000713          	li	a4,32
    9770:	40c70733          	sub	a4,a4,a2
    9774:	00e79533          	sll	a0,a5,a4
    9778:	00c456b3          	srl	a3,s0,a2
    977c:	00e41733          	sll	a4,s0,a4
    9780:	00d56533          	or	a0,a0,a3
    9784:	00e03733          	snez	a4,a4
    9788:	00e56533          	or	a0,a0,a4

0000978c <.LVL183>:
    978c:	00c7d7b3          	srl	a5,a5,a2

00009790 <.L149>:
    9790:	00000493          	li	s1,0

00009794 <.LVL185>:
    9794:	c79ff06f          	j	940c <.L5>

00009798 <.L71>:
    9798:	0085e5b3          	or	a1,a1,s0

0000979c <.LVL187>:
    979c:	f8059ae3          	bnez	a1,9730 <.L74>
    97a0:	00000493          	li	s1,0

000097a4 <.L151>:
    97a4:	00000913          	li	s2,0

000097a8 <.LVL189>:
    97a8:	08c0006f          	j	9834 <.L150>

000097ac <.L75>:
    97ac:	00098513          	mv	a0,s3
    97b0:	e65f70ef          	jal	1614 <__clzsi2>

000097b4 <.LVL191>:
    97b4:	01850693          	add	a3,a0,24

000097b8 <.LVL192>:
    97b8:	01f00793          	li	a5,31
    97bc:	f8d7d2e3          	bge	a5,a3,9740 <.L76>
    97c0:	ff850793          	add	a5,a0,-8
    97c4:	00f997b3          	sll	a5,s3,a5

000097c8 <.LVL193>:
    97c8:	f91ff06f          	j	9758 <.L78>

000097cc <.L80>:
    97cc:	fe168693          	add	a3,a3,-31
    97d0:	00d7d533          	srl	a0,a5,a3
    97d4:	02000693          	li	a3,32
    97d8:	00000713          	li	a4,0
    97dc:	00d60863          	beq	a2,a3,97ec <.L81>
    97e0:	04000713          	li	a4,64
    97e4:	40c70733          	sub	a4,a4,a2
    97e8:	00e79733          	sll	a4,a5,a4

000097ec <.L81>:
    97ec:	00e46733          	or	a4,s0,a4
    97f0:	00e03733          	snez	a4,a4
    97f4:	00e56533          	or	a0,a0,a4

000097f8 <.LVL195>:
    97f8:	00000793          	li	a5,0
    97fc:	f95ff06f          	j	9790 <.L149>

00009800 <.L79>:
    9800:	ff800737          	lui	a4,0xff800
    9804:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7ea10f>
    9808:	40d484b3          	sub	s1,s1,a3
    980c:	00e7f7b3          	and	a5,a5,a4
    9810:	00040513          	mv	a0,s0
    9814:	bf9ff06f          	j	940c <.L5>

00009818 <.L91>:
    9818:	00070793          	mv	a5,a4

0000981c <.LVL200>:
    981c:	00060513          	mv	a0,a2

00009820 <.LVL201>:
    9820:	c5dff06f          	j	947c <.L147>

00009824 <.L95>:
    9824:	00070793          	mv	a5,a4

00009828 <.LVL203>:
    9828:	00060513          	mv	a0,a2

0000982c <.LVL204>:
    982c:	be1ff06f          	j	940c <.L5>

00009830 <.L98>:
    9830:	7ff00493          	li	s1,2047

00009834 <.L150>:
    9834:	00000793          	li	a5,0
    9838:	00000513          	li	a0,0
    983c:	0240006f          	j	9860 <.L83>

00009840 <.L100>:
    9840:	00080493          	mv	s1,a6

00009844 <.LVL208>:
    9844:	bc9ff06f          	j	940c <.L5>

00009848 <.L103>:
    9848:	00070793          	mv	a5,a4

0000984c <.LVL210>:
    984c:	00060513          	mv	a0,a2

00009850 <.LVL211>:
    9850:	00080493          	mv	s1,a6

00009854 <.LVL212>:
    9854:	e41ff06f          	j	9694 <.L148>

00009858 <.L108>:
    9858:	00000793          	li	a5,0

0000985c <.LBE60>:
    985c:	00000913          	li	s2,0

00009860 <.L83>:
  FP_PACK_SEMIRAW_D (r, R);
    9860:	00879713          	sll	a4,a5,0x8
    9864:	00075e63          	bgez	a4,9880 <.L86>

00009868 <.LVL216>:
    9868:	00148493          	add	s1,s1,1

0000986c <.LVL217>:
    986c:	7ff00713          	li	a4,2047
    9870:	08e48263          	beq	s1,a4,98f4 <.L113>
    9874:	ff800737          	lui	a4,0xff800
    9878:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7ea10f>
    987c:	00e7f7b3          	and	a5,a5,a4

00009880 <.L86>:
    9880:	01d79693          	sll	a3,a5,0x1d
    9884:	00355513          	srl	a0,a0,0x3

00009888 <.LVL219>:
    9888:	7ff00713          	li	a4,2047
    988c:	00a6e6b3          	or	a3,a3,a0

00009890 <.LVL220>:
    9890:	0037d793          	srl	a5,a5,0x3
    9894:	00e49e63          	bne	s1,a4,98b0 <.L87>

00009898 <.LVL222>:
    9898:	00f6e6b3          	or	a3,a3,a5

0000989c <.LVL223>:
    989c:	00000793          	li	a5,0

000098a0 <.LVL224>:
    98a0:	00068863          	beqz	a3,98b0 <.L87>
    98a4:	000807b7          	lui	a5,0x80
    98a8:	00000693          	li	a3,0
    98ac:	00000913          	li	s2,0

000098b0 <.L87>:
    98b0:	01449713          	sll	a4,s1,0x14
    98b4:	7ff00637          	lui	a2,0x7ff00
    98b8:	00c79793          	sll	a5,a5,0xc

000098bc <.LVL226>:
    98bc:	00c77733          	and	a4,a4,a2

000098c0 <.LBE77>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    98c0:	01c12083          	lw	ra,28(sp)
    98c4:	01812403          	lw	s0,24(sp)

000098c8 <.LBB78>:
  FP_PACK_SEMIRAW_D (r, R);
    98c8:	00c7d793          	srl	a5,a5,0xc
    98cc:	00f767b3          	or	a5,a4,a5
    98d0:	01f91713          	sll	a4,s2,0x1f
    98d4:	00e7e633          	or	a2,a5,a4

000098d8 <.LBE78>:
}
    98d8:	01412483          	lw	s1,20(sp)
    98dc:	01012903          	lw	s2,16(sp)

000098e0 <.LVL228>:
    98e0:	00c12983          	lw	s3,12(sp)
    98e4:	00068513          	mv	a0,a3
    98e8:	00060593          	mv	a1,a2
    98ec:	02010113          	add	sp,sp,32
    98f0:	00008067          	ret

000098f4 <.L113>:
    98f4:	00000793          	li	a5,0

000098f8 <.LVL230>:
    98f8:	00000513          	li	a0,0

000098fc <.LVL231>:
    98fc:	f85ff06f          	j	9880 <.L86>

00009900 <__divdf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__divdf3 (DFtype a, DFtype b)
{
    9900:	fd010113          	add	sp,sp,-48

00009904 <.LBB3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
    9904:	0145d813          	srl	a6,a1,0x14

00009908 <.LBE3>:
{
    9908:	02912223          	sw	s1,36(sp)
    990c:	03212023          	sw	s2,32(sp)
    9910:	01312e23          	sw	s3,28(sp)
    9914:	01612823          	sw	s6,16(sp)
    9918:	01712623          	sw	s7,12(sp)

0000991c <.LBB4>:
  FP_UNPACK_D (A, a);
    991c:	00c59493          	sll	s1,a1,0xc

00009920 <.LBE4>:
{
    9920:	02112623          	sw	ra,44(sp)
    9924:	02812423          	sw	s0,40(sp)
    9928:	01412c23          	sw	s4,24(sp)
    992c:	01512a23          	sw	s5,20(sp)

00009930 <.LBB5>:
  FP_UNPACK_D (A, a);
    9930:	7ff87813          	and	a6,a6,2047

00009934 <.LBE5>:
{
    9934:	00050b13          	mv	s6,a0
    9938:	00060b93          	mv	s7,a2
    993c:	00068913          	mv	s2,a3

00009940 <.LBB6>:
  FP_UNPACK_D (A, a);
    9940:	00c4d493          	srl	s1,s1,0xc

00009944 <.LVL1>:
    9944:	01f5d993          	srl	s3,a1,0x1f

00009948 <.LBE6>:
    9948:	0a080263          	beqz	a6,99ec <.L2>
    994c:	7ff00793          	li	a5,2047
    9950:	10f80263          	beq	a6,a5,9a54 <.L3>

00009954 <.LVL3>:
    9954:	01d55a13          	srl	s4,a0,0x1d
    9958:	00349493          	sll	s1,s1,0x3

0000995c <.LVL4>:
    995c:	009a6a33          	or	s4,s4,s1
    9960:	008007b7          	lui	a5,0x800
    9964:	00fa6a33          	or	s4,s4,a5

00009968 <.LVL5>:
    9968:	00351413          	sll	s0,a0,0x3

0000996c <.LVL6>:
    996c:	c0180a93          	add	s5,a6,-1023

00009970 <.L104>:
    9970:	00000b13          	li	s6,0

00009974 <.L4>:
  FP_UNPACK_D (B, b);
    9974:	01495713          	srl	a4,s2,0x14
    9978:	00c91493          	sll	s1,s2,0xc
    997c:	7ff77713          	and	a4,a4,2047
    9980:	00c4d493          	srl	s1,s1,0xc

00009984 <.LVL9>:
    9984:	01f95913          	srl	s2,s2,0x1f

00009988 <.LBE11>:
    9988:	10070463          	beqz	a4,9a90 <.L9>
    998c:	7ff00793          	li	a5,2047
    9990:	16f70863          	beq	a4,a5,9b00 <.L10>

00009994 <.LVL11>:
    9994:	00349493          	sll	s1,s1,0x3

00009998 <.LVL12>:
    9998:	01dbd793          	srl	a5,s7,0x1d
    999c:	0097e7b3          	or	a5,a5,s1
    99a0:	008004b7          	lui	s1,0x800
    99a4:	0097e4b3          	or	s1,a5,s1

000099a8 <.LVL13>:
    99a8:	003b9f13          	sll	t5,s7,0x3

000099ac <.LVL14>:
    99ac:	c0170713          	add	a4,a4,-1023

000099b0 <.L105>:
    99b0:	00000793          	li	a5,0

000099b4 <.L11>:
  FP_DIV_D (R, A, B);
    99b4:	40ea8833          	sub	a6,s5,a4
    99b8:	002b1713          	sll	a4,s6,0x2

000099bc <.LVL17>:
    99bc:	00f76733          	or	a4,a4,a5
    99c0:	fff70713          	add	a4,a4,-1
    99c4:	00e00693          	li	a3,14
    99c8:	0129c633          	xor	a2,s3,s2

000099cc <.LVL18>:
    99cc:	16e6e663          	bltu	a3,a4,9b38 <.L16>
    99d0:	00008697          	auipc	a3,0x8
    99d4:	11068693          	add	a3,a3,272 # 11ae0 <.L18>
    99d8:	00271713          	sll	a4,a4,0x2
    99dc:	00d70733          	add	a4,a4,a3
    99e0:	00072703          	lw	a4,0(a4)
    99e4:	00d70733          	add	a4,a4,a3
    99e8:	00070067          	jr	a4

000099ec <.L2>:
  FP_UNPACK_D (A, a);
    99ec:	00a4ea33          	or	s4,s1,a0
    99f0:	060a0e63          	beqz	s4,9a6c <.L71>

000099f4 <.LBB16>:
    99f4:	02048e63          	beqz	s1,9a30 <.L5>
    99f8:	00048513          	mv	a0,s1

000099fc <.LVL20>:
    99fc:	c19f70ef          	jal	1614 <__clzsi2>

00009a00 <.LVL21>:
    9a00:	ff550793          	add	a5,a0,-11

00009a04 <.L6>:
    9a04:	01d00a13          	li	s4,29
    9a08:	ff850713          	add	a4,a0,-8
    9a0c:	40fa0a33          	sub	s4,s4,a5
    9a10:	00e494b3          	sll	s1,s1,a4

00009a14 <.LVL23>:
    9a14:	014b5a33          	srl	s4,s6,s4
    9a18:	009a6a33          	or	s4,s4,s1

00009a1c <.LVL24>:
    9a1c:	00eb14b3          	sll	s1,s6,a4

00009a20 <.L8>:
    9a20:	c0d00813          	li	a6,-1011
    9a24:	40a80ab3          	sub	s5,a6,a0

00009a28 <.LVL26>:
    9a28:	00048413          	mv	s0,s1
    9a2c:	f45ff06f          	j	9970 <.L104>

00009a30 <.L5>:
    9a30:	be5f70ef          	jal	1614 <__clzsi2>

00009a34 <.LVL28>:
    9a34:	00050a13          	mv	s4,a0

00009a38 <.LVL29>:
    9a38:	015a0793          	add	a5,s4,21
    9a3c:	01c00713          	li	a4,28
    9a40:	02050513          	add	a0,a0,32

00009a44 <.LVL30>:
    9a44:	fcf750e3          	bge	a4,a5,9a04 <.L6>
    9a48:	ff8a0a13          	add	s4,s4,-8
    9a4c:	014b1a33          	sll	s4,s6,s4

00009a50 <.LVL31>:
    9a50:	fd1ff06f          	j	9a20 <.L8>

00009a54 <.L3>:
    9a54:	00a4ea33          	or	s4,s1,a0
    9a58:	020a1263          	bnez	s4,9a7c <.L72>

00009a5c <.LBB17>:
    9a5c:	00000413          	li	s0,0
    9a60:	7ff00a93          	li	s5,2047

00009a64 <.LBE17>:
    9a64:	00200b13          	li	s6,2
    9a68:	f0dff06f          	j	9974 <.L4>

00009a6c <.L71>:
    9a6c:	00000413          	li	s0,0
    9a70:	00000a93          	li	s5,0

00009a74 <.LBE18>:
    9a74:	00100b13          	li	s6,1
    9a78:	efdff06f          	j	9974 <.L4>

00009a7c <.L72>:
    9a7c:	00050413          	mv	s0,a0

00009a80 <.LBB19>:
    9a80:	00048a13          	mv	s4,s1
    9a84:	7ff00a93          	li	s5,2047

00009a88 <.LBE19>:
    9a88:	00300b13          	li	s6,3
    9a8c:	ee9ff06f          	j	9974 <.L4>

00009a90 <.L9>:
  FP_UNPACK_D (B, b);
    9a90:	0174ef33          	or	t5,s1,s7
    9a94:	080f0263          	beqz	t5,9b18 <.L73>

00009a98 <.LBB20>:
    9a98:	04048063          	beqz	s1,9ad8 <.L12>
    9a9c:	00048513          	mv	a0,s1
    9aa0:	b75f70ef          	jal	1614 <__clzsi2>

00009aa4 <.LVL34>:
    9aa4:	ff550713          	add	a4,a0,-11

00009aa8 <.L13>:
    9aa8:	01d00793          	li	a5,29
    9aac:	ff850693          	add	a3,a0,-8
    9ab0:	40e787b3          	sub	a5,a5,a4
    9ab4:	00d494b3          	sll	s1,s1,a3

00009ab8 <.LVL36>:
    9ab8:	00fbd7b3          	srl	a5,s7,a5
    9abc:	0097e7b3          	or	a5,a5,s1

00009ac0 <.LVL37>:
    9ac0:	00db94b3          	sll	s1,s7,a3

00009ac4 <.L15>:
    9ac4:	c0d00713          	li	a4,-1011

00009ac8 <.LVL39>:
    9ac8:	00048f13          	mv	t5,s1
    9acc:	40a70733          	sub	a4,a4,a0

00009ad0 <.LVL40>:
    9ad0:	00078493          	mv	s1,a5

00009ad4 <.LVL41>:
    9ad4:	eddff06f          	j	99b0 <.L105>

00009ad8 <.L12>:
    9ad8:	000b8513          	mv	a0,s7
    9adc:	b39f70ef          	jal	1614 <__clzsi2>

00009ae0 <.LVL43>:
    9ae0:	00050793          	mv	a5,a0

00009ae4 <.LVL44>:
    9ae4:	01578713          	add	a4,a5,21 # 800015 <_ebss+0x7ea125>
    9ae8:	01c00693          	li	a3,28
    9aec:	02050513          	add	a0,a0,32

00009af0 <.LVL45>:
    9af0:	fae6dce3          	bge	a3,a4,9aa8 <.L13>
    9af4:	ff878793          	add	a5,a5,-8
    9af8:	00fb97b3          	sll	a5,s7,a5

00009afc <.LVL46>:
    9afc:	fc9ff06f          	j	9ac4 <.L15>

00009b00 <.L10>:
    9b00:	0174ef33          	or	t5,s1,s7
    9b04:	020f1263          	bnez	t5,9b28 <.L74>

00009b08 <.LBB21>:
    9b08:	00000493          	li	s1,0

00009b0c <.LVL48>:
    9b0c:	7ff00713          	li	a4,2047

00009b10 <.LBE21>:
    9b10:	00200793          	li	a5,2
    9b14:	ea1ff06f          	j	99b4 <.L11>

00009b18 <.L73>:
    9b18:	00000493          	li	s1,0

00009b1c <.LVL51>:
    9b1c:	00000713          	li	a4,0

00009b20 <.LBE22>:
    9b20:	00100793          	li	a5,1
    9b24:	e91ff06f          	j	99b4 <.L11>

00009b28 <.L74>:
    9b28:	000b8f13          	mv	t5,s7
    9b2c:	7ff00713          	li	a4,2047

00009b30 <.LBE23>:
    9b30:	00300793          	li	a5,3
    9b34:	e81ff06f          	j	99b4 <.L11>

00009b38 <.L16>:
  FP_DIV_D (R, A, B);
    9b38:	0144e663          	bltu	s1,s4,9b44 <.L23>
    9b3c:	349a1c63          	bne	s4,s1,9e94 <.L24>
    9b40:	35e46a63          	bltu	s0,t5,9e94 <.L24>

00009b44 <.L23>:
    9b44:	01fa1693          	sll	a3,s4,0x1f
    9b48:	00145793          	srl	a5,s0,0x1

00009b4c <.LVL57>:
    9b4c:	01f41713          	sll	a4,s0,0x1f

00009b50 <.LVL58>:
    9b50:	001a5a13          	srl	s4,s4,0x1

00009b54 <.LVL59>:
    9b54:	00f6e433          	or	s0,a3,a5

00009b58 <.L25>:
    9b58:	00849893          	sll	a7,s1,0x8
    9b5c:	018f5593          	srl	a1,t5,0x18
    9b60:	0115e5b3          	or	a1,a1,a7

00009b64 <.LBB26>:
    9b64:	0108d893          	srl	a7,a7,0x10
    9b68:	031a5eb3          	divu	t4,s4,a7
    9b6c:	01059313          	sll	t1,a1,0x10
    9b70:	01035313          	srl	t1,t1,0x10
    9b74:	01045793          	srl	a5,s0,0x10

00009b78 <.LBE26>:
    9b78:	008f1513          	sll	a0,t5,0x8

00009b7c <.LBB28>:
    9b7c:	031a7a33          	remu	s4,s4,a7

00009b80 <.LVL63>:
    9b80:	000e8693          	mv	a3,t4
    9b84:	03d30e33          	mul	t3,t1,t4

00009b88 <.LVL64>:
    9b88:	010a1a13          	sll	s4,s4,0x10

00009b8c <.LVL65>:
    9b8c:	0147e7b3          	or	a5,a5,s4

00009b90 <.LVL66>:
    9b90:	01c7fe63          	bgeu	a5,t3,9bac <.L26>
    9b94:	00f587b3          	add	a5,a1,a5

00009b98 <.LVL67>:
    9b98:	fffe8693          	add	a3,t4,-1

00009b9c <.LVL68>:
    9b9c:	00b7e863          	bltu	a5,a1,9bac <.L26>
    9ba0:	01c7f663          	bgeu	a5,t3,9bac <.L26>
    9ba4:	ffee8693          	add	a3,t4,-2
    9ba8:	00b787b3          	add	a5,a5,a1

00009bac <.L26>:
    9bac:	41c787b3          	sub	a5,a5,t3

00009bb0 <.LVL71>:
    9bb0:	0317df33          	divu	t5,a5,a7

00009bb4 <.LVL72>:
    9bb4:	01041413          	sll	s0,s0,0x10

00009bb8 <.LVL73>:
    9bb8:	01045413          	srl	s0,s0,0x10
    9bbc:	0317f7b3          	remu	a5,a5,a7

00009bc0 <.LVL74>:
    9bc0:	000f0e13          	mv	t3,t5

00009bc4 <.LVL75>:
    9bc4:	03e30eb3          	mul	t4,t1,t5

00009bc8 <.LVL76>:
    9bc8:	01079793          	sll	a5,a5,0x10

00009bcc <.LVL77>:
    9bcc:	00f467b3          	or	a5,s0,a5

00009bd0 <.LVL78>:
    9bd0:	01d7fe63          	bgeu	a5,t4,9bec <.L29>
    9bd4:	00f587b3          	add	a5,a1,a5

00009bd8 <.LVL79>:
    9bd8:	ffff0e13          	add	t3,t5,-1

00009bdc <.LVL80>:
    9bdc:	00b7e863          	bltu	a5,a1,9bec <.L29>
    9be0:	01d7f663          	bgeu	a5,t4,9bec <.L29>
    9be4:	ffef0e13          	add	t3,t5,-2
    9be8:	00b787b3          	add	a5,a5,a1

00009bec <.L29>:
    9bec:	01069693          	sll	a3,a3,0x10

00009bf0 <.LVL83>:
    9bf0:	00010437          	lui	s0,0x10
    9bf4:	01c6e2b3          	or	t0,a3,t3
    9bf8:	fff40e13          	add	t3,s0,-1 # ffff <.LVL314+0x7>

00009bfc <.LVL84>:
    9bfc:	01c2f6b3          	and	a3,t0,t3

00009c00 <.LBB29>:
    9c00:	0102df93          	srl	t6,t0,0x10
    9c04:	01c57e33          	and	t3,a0,t3

00009c08 <.LBB30>:
    9c08:	41d787b3          	sub	a5,a5,t4

00009c0c <.LBB31>:
    9c0c:	01055e93          	srl	t4,a0,0x10

00009c10 <.LVL86>:
    9c10:	02de03b3          	mul	t2,t3,a3

00009c14 <.LVL87>:
    9c14:	03cf84b3          	mul	s1,t6,t3

00009c18 <.LVL88>:
    9c18:	02de86b3          	mul	a3,t4,a3

00009c1c <.LVL89>:
    9c1c:	00968f33          	add	t5,a3,s1

00009c20 <.LVL90>:
    9c20:	0103d693          	srl	a3,t2,0x10

00009c24 <.LVL91>:
    9c24:	01e686b3          	add	a3,a3,t5
    9c28:	03df8fb3          	mul	t6,t6,t4

00009c2c <.LVL92>:
    9c2c:	0096f463          	bgeu	a3,s1,9c34 <.L32>
    9c30:	008f8fb3          	add	t6,t6,s0

00009c34 <.L32>:
    9c34:	0106df13          	srl	t5,a3,0x10
    9c38:	01ff0f33          	add	t5,t5,t6

00009c3c <.LVL94>:
    9c3c:	00010fb7          	lui	t6,0x10

00009c40 <.LVL95>:
    9c40:	ffff8f93          	add	t6,t6,-1 # ffff <.LVL314+0x7>
    9c44:	01f6f6b3          	and	a3,a3,t6

00009c48 <.LVL96>:
    9c48:	01069693          	sll	a3,a3,0x10
    9c4c:	01f3f3b3          	and	t2,t2,t6

00009c50 <.LVL97>:
    9c50:	007686b3          	add	a3,a3,t2

00009c54 <.LBE31>:
    9c54:	01e7e863          	bltu	a5,t5,9c64 <.L33>

00009c58 <.LBB32>:
    9c58:	00028493          	mv	s1,t0

00009c5c <.LBE32>:
    9c5c:	05e79863          	bne	a5,t5,9cac <.L34>
    9c60:	04d77663          	bgeu	a4,a3,9cac <.L34>

00009c64 <.L33>:
    9c64:	00a70fb3          	add	t6,a4,a0

00009c68 <.LVL100>:
    9c68:	00efb3b3          	sltu	t2,t6,a4

00009c6c <.LBB33>:
    9c6c:	00b38433          	add	s0,t2,a1

00009c70 <.LVL101>:
    9c70:	008787b3          	add	a5,a5,s0

00009c74 <.LBE33>:
    9c74:	fff28493          	add	s1,t0,-1

00009c78 <.LBB34>:
    9c78:	000f8713          	mv	a4,t6

00009c7c <.LBE34>:
    9c7c:	00f5e663          	bltu	a1,a5,9c88 <.L37>
    9c80:	02f59663          	bne	a1,a5,9cac <.L34>
    9c84:	02039463          	bnez	t2,9cac <.L34>

00009c88 <.L37>:
    9c88:	01e7e663          	bltu	a5,t5,9c94 <.L38>
    9c8c:	02ff1063          	bne	t5,a5,9cac <.L34>
    9c90:	00dffe63          	bgeu	t6,a3,9cac <.L34>

00009c94 <.L38>:
    9c94:	01f50fb3          	add	t6,a0,t6

00009c98 <.LBB35>:
    9c98:	000f8713          	mv	a4,t6

00009c9c <.LVL105>:
    9c9c:	00afbfb3          	sltu	t6,t6,a0
    9ca0:	00bf8fb3          	add	t6,t6,a1

00009ca4 <.LBE35>:
    9ca4:	ffe28493          	add	s1,t0,-2

00009ca8 <.LBB36>:
    9ca8:	01f787b3          	add	a5,a5,t6

00009cac <.L34>:
    9cac:	40d706b3          	sub	a3,a4,a3

00009cb0 <.LVL108>:
    9cb0:	41e787b3          	sub	a5,a5,t5

00009cb4 <.LVL109>:
    9cb4:	00d73733          	sltu	a4,a4,a3

00009cb8 <.LVL110>:
    9cb8:	40e787b3          	sub	a5,a5,a4

00009cbc <.LBE37>:
    9cbc:	fff00f13          	li	t5,-1

00009cc0 <.LVL112>:
    9cc0:	12f58663          	beq	a1,a5,9dec <.L70>

00009cc4 <.LBB38>:
    9cc4:	0317dfb3          	divu	t6,a5,a7

00009cc8 <.LVL114>:
    9cc8:	0106d713          	srl	a4,a3,0x10
    9ccc:	0317f7b3          	remu	a5,a5,a7

00009cd0 <.LVL115>:
    9cd0:	03f30f33          	mul	t5,t1,t6

00009cd4 <.LVL116>:
    9cd4:	01079793          	sll	a5,a5,0x10

00009cd8 <.LVL117>:
    9cd8:	00f767b3          	or	a5,a4,a5

00009cdc <.LVL118>:
    9cdc:	000f8713          	mv	a4,t6
    9ce0:	01e7fe63          	bgeu	a5,t5,9cfc <.L44>
    9ce4:	00f587b3          	add	a5,a1,a5

00009ce8 <.LVL119>:
    9ce8:	ffff8713          	add	a4,t6,-1

00009cec <.LVL120>:
    9cec:	00b7e863          	bltu	a5,a1,9cfc <.L44>
    9cf0:	01e7f663          	bgeu	a5,t5,9cfc <.L44>
    9cf4:	ffef8713          	add	a4,t6,-2
    9cf8:	00b787b3          	add	a5,a5,a1

00009cfc <.L44>:
    9cfc:	41e787b3          	sub	a5,a5,t5

00009d00 <.LVL123>:
    9d00:	0317df33          	divu	t5,a5,a7

00009d04 <.LVL124>:
    9d04:	01069693          	sll	a3,a3,0x10

00009d08 <.LVL125>:
    9d08:	0106d693          	srl	a3,a3,0x10
    9d0c:	0317f7b3          	remu	a5,a5,a7

00009d10 <.LVL126>:
    9d10:	000f0893          	mv	a7,t5

00009d14 <.LVL127>:
    9d14:	03e30333          	mul	t1,t1,t5

00009d18 <.LVL128>:
    9d18:	01079793          	sll	a5,a5,0x10

00009d1c <.LVL129>:
    9d1c:	00f6e7b3          	or	a5,a3,a5

00009d20 <.LVL130>:
    9d20:	0067fe63          	bgeu	a5,t1,9d3c <.L47>
    9d24:	00f587b3          	add	a5,a1,a5

00009d28 <.LVL131>:
    9d28:	ffff0893          	add	a7,t5,-1

00009d2c <.LVL132>:
    9d2c:	00b7e863          	bltu	a5,a1,9d3c <.L47>
    9d30:	0067f663          	bgeu	a5,t1,9d3c <.L47>
    9d34:	ffef0893          	add	a7,t5,-2
    9d38:	00b787b3          	add	a5,a5,a1

00009d3c <.L47>:
    9d3c:	01071693          	sll	a3,a4,0x10
    9d40:	0116e6b3          	or	a3,a3,a7
    9d44:	01069713          	sll	a4,a3,0x10

00009d48 <.LVL135>:
    9d48:	01075713          	srl	a4,a4,0x10
    9d4c:	406787b3          	sub	a5,a5,t1

00009d50 <.LBB39>:
    9d50:	0106d313          	srl	t1,a3,0x10

00009d54 <.LVL137>:
    9d54:	03c70f33          	mul	t5,a4,t3

00009d58 <.LVL138>:
    9d58:	03c30e33          	mul	t3,t1,t3

00009d5c <.LVL139>:
    9d5c:	026e8333          	mul	t1,t4,t1

00009d60 <.LVL140>:
    9d60:	02ee8eb3          	mul	t4,t4,a4

00009d64 <.LVL141>:
    9d64:	010f5713          	srl	a4,t5,0x10
    9d68:	01ce8eb3          	add	t4,t4,t3

00009d6c <.LVL142>:
    9d6c:	01d70733          	add	a4,a4,t4

00009d70 <.LVL143>:
    9d70:	01c77663          	bgeu	a4,t3,9d7c <.L50>
    9d74:	000108b7          	lui	a7,0x10

00009d78 <.LVL144>:
    9d78:	01130333          	add	t1,t1,a7

00009d7c <.L50>:
    9d7c:	01075893          	srl	a7,a4,0x10
    9d80:	006888b3          	add	a7,a7,t1

00009d84 <.LVL146>:
    9d84:	00010337          	lui	t1,0x10

00009d88 <.LVL147>:
    9d88:	fff30313          	add	t1,t1,-1 # ffff <.LVL314+0x7>

00009d8c <.LVL148>:
    9d8c:	00677733          	and	a4,a4,t1

00009d90 <.LVL149>:
    9d90:	01071713          	sll	a4,a4,0x10
    9d94:	006f7f33          	and	t5,t5,t1

00009d98 <.LVL150>:
    9d98:	01e70733          	add	a4,a4,t5

00009d9c <.LBE39>:
    9d9c:	0117e863          	bltu	a5,a7,9dac <.L51>
    9da0:	23179c63          	bne	a5,a7,9fd8 <.L52>

00009da4 <.LBB40>:
    9da4:	00068f13          	mv	t5,a3

00009da8 <.LBE40>:
    9da8:	04070263          	beqz	a4,9dec <.L70>

00009dac <.L51>:
    9dac:	00f587b3          	add	a5,a1,a5

00009db0 <.LVL152>:
    9db0:	fff68f13          	add	t5,a3,-1

00009db4 <.LBB41>:
    9db4:	00078313          	mv	t1,a5

00009db8 <.LBE41>:
    9db8:	02b7e463          	bltu	a5,a1,9de0 <.L55>
    9dbc:	0117e663          	bltu	a5,a7,9dc8 <.L56>
    9dc0:	21179a63          	bne	a5,a7,9fd4 <.L85>
    9dc4:	02e57063          	bgeu	a0,a4,9de4 <.L57>

00009dc8 <.L56>:
    9dc8:	ffe68f13          	add	t5,a3,-2

00009dcc <.LBB42>:
    9dcc:	00151693          	sll	a3,a0,0x1

00009dd0 <.LVL156>:
    9dd0:	00a6b333          	sltu	t1,a3,a0

00009dd4 <.LVL157>:
    9dd4:	00b30333          	add	t1,t1,a1
    9dd8:	00678333          	add	t1,a5,t1

00009ddc <.LVL158>:
    9ddc:	00068513          	mv	a0,a3

00009de0 <.L55>:
    9de0:	01131463          	bne	t1,a7,9de8 <.L58>

00009de4 <.L57>:
    9de4:	00a70463          	beq	a4,a0,9dec <.L70>

00009de8 <.L58>:
    9de8:	001f6f13          	or	t5,t5,1

00009dec <.L70>:
  FP_PACK_D (r, R);
    9dec:	3ff80713          	add	a4,a6,1023

00009df0 <.LVL163>:
    9df0:	10e05263          	blez	a4,9ef4 <.L59>
    9df4:	007f7793          	and	a5,t5,7
    9df8:	02078063          	beqz	a5,9e18 <.L60>
    9dfc:	00ff7793          	and	a5,t5,15
    9e00:	00400693          	li	a3,4
    9e04:	00d78a63          	beq	a5,a3,9e18 <.L60>

00009e08 <.LBB44>:
    9e08:	004f0793          	add	a5,t5,4
    9e0c:	01e7b6b3          	sltu	a3,a5,t5
    9e10:	00d484b3          	add	s1,s1,a3

00009e14 <.LVL164>:
    9e14:	00078f13          	mv	t5,a5

00009e18 <.L60>:
    9e18:	00749793          	sll	a5,s1,0x7
    9e1c:	0007da63          	bgez	a5,9e30 <.L63>
    9e20:	ff0007b7          	lui	a5,0xff000
    9e24:	fff78793          	add	a5,a5,-1 # feffffff <_ebss+0xfefea10f>
    9e28:	00f4f4b3          	and	s1,s1,a5
    9e2c:	40080713          	add	a4,a6,1024

00009e30 <.L63>:
    9e30:	7fe00793          	li	a5,2046
    9e34:	08e7ca63          	blt	a5,a4,9ec8 <.L21>
    9e38:	003f5f13          	srl	t5,t5,0x3

00009e3c <.LVL168>:
    9e3c:	01d49793          	sll	a5,s1,0x1d

00009e40 <.LVL169>:
    9e40:	01e7ef33          	or	t5,a5,t5

00009e44 <.LVL170>:
    9e44:	0034d513          	srl	a0,s1,0x3

00009e48 <.L22>:
    9e48:	00c51513          	sll	a0,a0,0xc

00009e4c <.LBE47>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    9e4c:	02c12083          	lw	ra,44(sp)
    9e50:	02812403          	lw	s0,40(sp)

00009e54 <.LBB48>:
  FP_PACK_D (r, R);
    9e54:	00c55513          	srl	a0,a0,0xc
    9e58:	01471713          	sll	a4,a4,0x14

00009e5c <.LVL173>:
    9e5c:	00a76733          	or	a4,a4,a0
    9e60:	01f61613          	sll	a2,a2,0x1f

00009e64 <.LVL174>:
    9e64:	00c767b3          	or	a5,a4,a2

00009e68 <.LBE48>:
}
    9e68:	02412483          	lw	s1,36(sp)
    9e6c:	02012903          	lw	s2,32(sp)

00009e70 <.LVL176>:
    9e70:	01c12983          	lw	s3,28(sp)

00009e74 <.LVL177>:
    9e74:	01812a03          	lw	s4,24(sp)
    9e78:	01412a83          	lw	s5,20(sp)

00009e7c <.LVL178>:
    9e7c:	01012b03          	lw	s6,16(sp)

00009e80 <.LVL179>:
    9e80:	00c12b83          	lw	s7,12(sp)
    9e84:	000f0513          	mv	a0,t5
    9e88:	00078593          	mv	a1,a5
    9e8c:	03010113          	add	sp,sp,48
    9e90:	00008067          	ret

00009e94 <.L24>:
  FP_DIV_D (R, A, B);
    9e94:	fff80813          	add	a6,a6,-1

00009e98 <.LVL181>:
    9e98:	00000713          	li	a4,0
    9e9c:	cbdff06f          	j	9b58 <.L25>

00009ea0 <.L19>:
  FP_UNPACK_D (A, a);
    9ea0:	00098613          	mv	a2,s3

00009ea4 <.LBE50>:
  FP_DIV_D (R, A, B);
    9ea4:	000a0493          	mv	s1,s4

00009ea8 <.LVL184>:
    9ea8:	00040f13          	mv	t5,s0

00009eac <.LVL185>:
    9eac:	000b0793          	mv	a5,s6

00009eb0 <.L17>:
  FP_PACK_D (r, R);
    9eb0:	00300713          	li	a4,3
    9eb4:	0ee78863          	beq	a5,a4,9fa4 <.L86>
    9eb8:	00100713          	li	a4,1
    9ebc:	0ee78e63          	beq	a5,a4,9fb8 <.L88>
    9ec0:	00200713          	li	a4,2
    9ec4:	f2e794e3          	bne	a5,a4,9dec <.L70>

00009ec8 <.L21>:
    9ec8:	00000513          	li	a0,0
    9ecc:	00000f13          	li	t5,0
    9ed0:	7ff00713          	li	a4,2047
    9ed4:	f75ff06f          	j	9e48 <.L22>

00009ed8 <.L20>:
  FP_UNPACK_D (B, b);
    9ed8:	00090613          	mv	a2,s2

00009edc <.LBE51>:
  FP_DIV_D (R, A, B);
    9edc:	fd5ff06f          	j	9eb0 <.L17>

00009ee0 <.L76>:
    9ee0:	000804b7          	lui	s1,0x80

00009ee4 <.LVL191>:
    9ee4:	00000f13          	li	t5,0

00009ee8 <.LVL192>:
    9ee8:	00000613          	li	a2,0

00009eec <.LVL193>:
    9eec:	00300793          	li	a5,3

00009ef0 <.LVL194>:
    9ef0:	fc1ff06f          	j	9eb0 <.L17>

00009ef4 <.L59>:
  FP_PACK_D (r, R);
    9ef4:	00100513          	li	a0,1
    9ef8:	40e50533          	sub	a0,a0,a4

00009efc <.LVL196>:
    9efc:	03800793          	li	a5,56
    9f00:	0aa7cc63          	blt	a5,a0,9fb8 <.L88>
    9f04:	01f00793          	li	a5,31
    9f08:	06a7c463          	blt	a5,a0,9f70 <.L64>
    9f0c:	41e80813          	add	a6,a6,1054
    9f10:	010497b3          	sll	a5,s1,a6
    9f14:	00af5733          	srl	a4,t5,a0
    9f18:	010f1833          	sll	a6,t5,a6
    9f1c:	00e7e7b3          	or	a5,a5,a4
    9f20:	01003833          	snez	a6,a6
    9f24:	0107e7b3          	or	a5,a5,a6

00009f28 <.LVL197>:
    9f28:	00a4d533          	srl	a0,s1,a0

00009f2c <.L65>:
    9f2c:	0077f713          	and	a4,a5,7
    9f30:	02070063          	beqz	a4,9f50 <.L67>
    9f34:	00f7f713          	and	a4,a5,15
    9f38:	00400693          	li	a3,4
    9f3c:	00d70a63          	beq	a4,a3,9f50 <.L67>

00009f40 <.LBB54>:
    9f40:	00478713          	add	a4,a5,4
    9f44:	00f736b3          	sltu	a3,a4,a5
    9f48:	00d50533          	add	a0,a0,a3

00009f4c <.LVL199>:
    9f4c:	00070793          	mv	a5,a4

00009f50 <.L67>:
    9f50:	00851713          	sll	a4,a0,0x8
    9f54:	06074863          	bltz	a4,9fc4 <.L90>

00009f58 <.LVL201>:
    9f58:	01d51f13          	sll	t5,a0,0x1d
    9f5c:	0037d793          	srl	a5,a5,0x3

00009f60 <.LVL202>:
    9f60:	00ff6f33          	or	t5,t5,a5

00009f64 <.LVL203>:
    9f64:	00355513          	srl	a0,a0,0x3

00009f68 <.L106>:
    9f68:	00000713          	li	a4,0
    9f6c:	eddff06f          	j	9e48 <.L22>

00009f70 <.L64>:
    9f70:	fe100793          	li	a5,-31
    9f74:	40e787b3          	sub	a5,a5,a4
    9f78:	02000693          	li	a3,32
    9f7c:	00f4d7b3          	srl	a5,s1,a5
    9f80:	00000713          	li	a4,0
    9f84:	00d50663          	beq	a0,a3,9f90 <.L66>
    9f88:	43e80713          	add	a4,a6,1086
    9f8c:	00e49733          	sll	a4,s1,a4

00009f90 <.L66>:
    9f90:	01e76733          	or	a4,a4,t5
    9f94:	00e03733          	snez	a4,a4
    9f98:	00e7e7b3          	or	a5,a5,a4

00009f9c <.LVL206>:
    9f9c:	00000513          	li	a0,0

00009fa0 <.LVL207>:
    9fa0:	f8dff06f          	j	9f2c <.L65>

00009fa4 <.L86>:
    9fa4:	00080537          	lui	a0,0x80
    9fa8:	00000f13          	li	t5,0

00009fac <.LVL209>:
    9fac:	7ff00713          	li	a4,2047
    9fb0:	00000613          	li	a2,0

00009fb4 <.LVL210>:
    9fb4:	e95ff06f          	j	9e48 <.L22>

00009fb8 <.L88>:
    9fb8:	00000513          	li	a0,0
    9fbc:	00000f13          	li	t5,0
    9fc0:	fa9ff06f          	j	9f68 <.L106>

00009fc4 <.L90>:
    9fc4:	00000513          	li	a0,0

00009fc8 <.LVL213>:
    9fc8:	00000f13          	li	t5,0
    9fcc:	00100713          	li	a4,1
    9fd0:	e79ff06f          	j	9e48 <.L22>

00009fd4 <.L85>:
  FP_DIV_D (R, A, B);
    9fd4:	000f0693          	mv	a3,t5

00009fd8 <.L52>:
    9fd8:	00068f13          	mv	t5,a3
    9fdc:	e0dff06f          	j	9de8 <.L58>

00009fe0 <__eqdf2>:
  FP_DECL_D (A);
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    9fe0:	0145d713          	srl	a4,a1,0x14
    9fe4:	001007b7          	lui	a5,0x100
    9fe8:	fff78793          	add	a5,a5,-1 # fffff <_ebss+0xea10f>

00009fec <.LBB3>:
  FP_UNPACK_RAW_D (B, b);
    9fec:	0146d813          	srl	a6,a3,0x14

00009ff0 <.LBE3>:
{
    9ff0:	00050313          	mv	t1,a0
    9ff4:	00050e93          	mv	t4,a0

00009ff8 <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    9ff8:	7ff77713          	and	a4,a4,2047

00009ffc <.LBE4>:
  FP_CMP_EQ_D (r, A, B, 1);
    9ffc:	7ff00513          	li	a0,2047

0000a000 <.LBB5>:
  FP_UNPACK_RAW_D (A, a);
    a000:	00b7f8b3          	and	a7,a5,a1

0000a004 <.LVL3>:
    a004:	00060f13          	mv	t5,a2

0000a008 <.LBB6>:
  FP_UNPACK_RAW_D (B, b);
    a008:	00d7f7b3          	and	a5,a5,a3

0000a00c <.LBB7>:
  FP_UNPACK_RAW_D (A, a);
    a00c:	01f5d593          	srl	a1,a1,0x1f

0000a010 <.LBB8>:
  FP_UNPACK_RAW_D (B, b);
    a010:	7ff87813          	and	a6,a6,2047
    a014:	01f6d693          	srl	a3,a3,0x1f

0000a018 <.LBE8>:
  FP_CMP_EQ_D (r, A, B, 1);
    a018:	00a71c63          	bne	a4,a0,a030 <.L2>
    a01c:	0068ee33          	or	t3,a7,t1
    a020:	00100513          	li	a0,1
    a024:	000e1463          	bnez	t3,a02c <.L1>
    a028:	00e80663          	beq	a6,a4,a034 <.L6>

0000a02c <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    a02c:	00008067          	ret

0000a030 <.L2>:
  FP_CMP_EQ_D (r, A, B, 1);
    a030:	00a81863          	bne	a6,a0,a040 <.L5>

0000a034 <.L6>:
    a034:	00c7e633          	or	a2,a5,a2

0000a038 <.LVL9>:
    a038:	00100513          	li	a0,1
    a03c:	fe0618e3          	bnez	a2,a02c <.L1>

0000a040 <.L5>:
    a040:	00100513          	li	a0,1
    a044:	ff0714e3          	bne	a4,a6,a02c <.L1>
    a048:	fef892e3          	bne	a7,a5,a02c <.L1>
    a04c:	ffee90e3          	bne	t4,t5,a02c <.L1>
    a050:	00d58a63          	beq	a1,a3,a064 <.L12>
    a054:	fc071ce3          	bnez	a4,a02c <.L1>
    a058:	0068e8b3          	or	a7,a7,t1

0000a05c <.LVL10>:
    a05c:	01103533          	snez	a0,a7
    a060:	00008067          	ret

0000a064 <.L12>:
    a064:	00000513          	li	a0,0
    a068:	00008067          	ret

0000a06c <__gedf2>:
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
  FP_UNPACK_RAW_D (B, b);
    a06c:	0146d793          	srl	a5,a3,0x14

0000a070 <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    a070:	0145d893          	srl	a7,a1,0x14
    a074:	00100737          	lui	a4,0x100
    a078:	fff70713          	add	a4,a4,-1 # fffff <_ebss+0xea10f>

0000a07c <.LBE4>:
{
    a07c:	00050813          	mv	a6,a0
    a080:	00050e13          	mv	t3,a0

0000a084 <.LBB5>:
  FP_UNPACK_RAW_D (A, a);
    a084:	7ff8f893          	and	a7,a7,2047

0000a088 <.LBB6>:
  FP_UNPACK_RAW_D (B, b);
    a088:	7ff7f513          	and	a0,a5,2047

0000a08c <.LBE6>:
  FP_CMP_D (r, A, B, -2, 2);
    a08c:	7ff00793          	li	a5,2047

0000a090 <.LBB7>:
  FP_UNPACK_RAW_D (A, a);
    a090:	00b77333          	and	t1,a4,a1
    a094:	00060e93          	mv	t4,a2

0000a098 <.LBB8>:
  FP_UNPACK_RAW_D (B, b);
    a098:	00d77733          	and	a4,a4,a3

0000a09c <.LBB9>:
  FP_UNPACK_RAW_D (A, a);
    a09c:	01f5d593          	srl	a1,a1,0x1f

0000a0a0 <.LBB10>:
  FP_UNPACK_RAW_D (B, b);
    a0a0:	01f6d693          	srl	a3,a3,0x1f

0000a0a4 <.LBE10>:
  FP_CMP_D (r, A, B, -2, 2);
    a0a4:	00f89663          	bne	a7,a5,a0b0 <.L2>
    a0a8:	010367b3          	or	a5,t1,a6
    a0ac:	06079c63          	bnez	a5,a124 <.L17>

0000a0b0 <.L2>:
    a0b0:	7ff00793          	li	a5,2047
    a0b4:	00f51663          	bne	a0,a5,a0c0 <.L4>
    a0b8:	00c767b3          	or	a5,a4,a2
    a0bc:	06079463          	bnez	a5,a124 <.L17>

0000a0c0 <.L4>:
    a0c0:	00000793          	li	a5,0
    a0c4:	00089663          	bnez	a7,a0d0 <.L5>
    a0c8:	01036833          	or	a6,t1,a6

0000a0cc <.LVL6>:
    a0cc:	00183793          	seqz	a5,a6

0000a0d0 <.L5>:
    a0d0:	04051e63          	bnez	a0,a12c <.L6>
    a0d4:	00c76633          	or	a2,a4,a2

0000a0d8 <.LVL8>:
    a0d8:	00078c63          	beqz	a5,a0f0 <.L7>
    a0dc:	02060063          	beqz	a2,a0fc <.L1>

0000a0e0 <.L38>:
    a0e0:	00100513          	li	a0,1

0000a0e4 <.LVL10>:
    a0e4:	00069c63          	bnez	a3,a0fc <.L1>

0000a0e8 <.L34>:
    a0e8:	fff00513          	li	a0,-1
    a0ec:	00008067          	ret

0000a0f0 <.L7>:
    a0f0:	04061063          	bnez	a2,a130 <.L8>

0000a0f4 <.L12>:
    a0f4:	fff00513          	li	a0,-1

0000a0f8 <.LVL13>:
    a0f8:	04058463          	beqz	a1,a140 <.L33>

0000a0fc <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    a0fc:	00008067          	ret

0000a100 <.L10>:
  FP_CMP_D (r, A, B, -2, 2);
    a100:	fea8c0e3          	blt	a7,a0,a0e0 <.L38>
    a104:	fe6768e3          	bltu	a4,t1,a0f4 <.L12>
    a108:	00e31863          	bne	t1,a4,a118 <.L13>
    a10c:	ffcee4e3          	bltu	t4,t3,a0f4 <.L12>
    a110:	00000513          	li	a0,0

0000a114 <.LVL15>:
    a114:	ffde74e3          	bgeu	t3,t4,a0fc <.L1>

0000a118 <.L13>:
    a118:	00100513          	li	a0,1
    a11c:	fe0590e3          	bnez	a1,a0fc <.L1>
    a120:	fc9ff06f          	j	a0e8 <.L34>

0000a124 <.L17>:
    a124:	ffe00513          	li	a0,-2

0000a128 <.LVL17>:
    a128:	00008067          	ret

0000a12c <.L6>:
    a12c:	fa079ae3          	bnez	a5,a0e0 <.L38>

0000a130 <.L8>:
    a130:	fcb692e3          	bne	a3,a1,a0f4 <.L12>
    a134:	fd1556e3          	bge	a0,a7,a100 <.L10>
    a138:	fff00513          	li	a0,-1

0000a13c <.LVL20>:
    a13c:	fc0690e3          	bnez	a3,a0fc <.L1>

0000a140 <.L33>:
    a140:	00100513          	li	a0,1
    a144:	00008067          	ret

0000a148 <__muldf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__muldf3 (DFtype a, DFtype b)
{
    a148:	fd010113          	add	sp,sp,-48
    a14c:	01512a23          	sw	s5,20(sp)

0000a150 <.LBB3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
    a150:	0145da93          	srl	s5,a1,0x14

0000a154 <.LBE3>:
{
    a154:	02812423          	sw	s0,40(sp)
    a158:	02912223          	sw	s1,36(sp)
    a15c:	01312e23          	sw	s3,28(sp)
    a160:	01412c23          	sw	s4,24(sp)
    a164:	01612823          	sw	s6,16(sp)

0000a168 <.LBB4>:
  FP_UNPACK_D (A, a);
    a168:	00c59493          	sll	s1,a1,0xc

0000a16c <.LBE4>:
{
    a16c:	02112623          	sw	ra,44(sp)
    a170:	03212023          	sw	s2,32(sp)
    a174:	01712623          	sw	s7,12(sp)

0000a178 <.LBB5>:
  FP_UNPACK_D (A, a);
    a178:	7ffafa93          	and	s5,s5,2047

0000a17c <.LBE5>:
{
    a17c:	00050413          	mv	s0,a0
    a180:	00060b13          	mv	s6,a2
    a184:	00068993          	mv	s3,a3

0000a188 <.LBB6>:
  FP_UNPACK_D (A, a);
    a188:	00c4d493          	srl	s1,s1,0xc

0000a18c <.LVL1>:
    a18c:	01f5da13          	srl	s4,a1,0x1f

0000a190 <.LBE6>:
    a190:	240a8e63          	beqz	s5,a3ec <.L2>
    a194:	7ff00793          	li	a5,2047
    a198:	2cfa8063          	beq	s5,a5,a458 <.L3>

0000a19c <.LVL3>:
    a19c:	00349493          	sll	s1,s1,0x3
    a1a0:	01d55793          	srl	a5,a0,0x1d
    a1a4:	0097e7b3          	or	a5,a5,s1
    a1a8:	008004b7          	lui	s1,0x800

0000a1ac <.LVL4>:
    a1ac:	0097e4b3          	or	s1,a5,s1

0000a1b0 <.LVL5>:
    a1b0:	00351913          	sll	s2,a0,0x3

0000a1b4 <.LVL6>:
    a1b4:	c01a8a93          	add	s5,s5,-1023

0000a1b8 <.L79>:
    a1b8:	00000b93          	li	s7,0

0000a1bc <.L4>:
  FP_UNPACK_D (B, b);
    a1bc:	0149d713          	srl	a4,s3,0x14
    a1c0:	00c99413          	sll	s0,s3,0xc
    a1c4:	7ff77713          	and	a4,a4,2047
    a1c8:	00c45413          	srl	s0,s0,0xc

0000a1cc <.LVL9>:
    a1cc:	01f9d993          	srl	s3,s3,0x1f

0000a1d0 <.LBE11>:
    a1d0:	2c070063          	beqz	a4,a490 <.L9>
    a1d4:	7ff00793          	li	a5,2047
    a1d8:	32f70463          	beq	a4,a5,a500 <.L10>
    a1dc:	00341413          	sll	s0,s0,0x3
    a1e0:	01db5793          	srl	a5,s6,0x1d
    a1e4:	0087e7b3          	or	a5,a5,s0
    a1e8:	00800437          	lui	s0,0x800

0000a1ec <.LVL11>:
    a1ec:	0087e433          	or	s0,a5,s0

0000a1f0 <.LVL12>:
    a1f0:	c0170693          	add	a3,a4,-1023
    a1f4:	003b1793          	sll	a5,s6,0x3

0000a1f8 <.L80>:
    a1f8:	00000713          	li	a4,0

0000a1fc <.L11>:
  FP_MUL_D (R, A, B);
    a1fc:	00da8ab3          	add	s5,s5,a3

0000a200 <.LVL15>:
    a200:	002b9693          	sll	a3,s7,0x2

0000a204 <.LVL16>:
    a204:	00e6e6b3          	or	a3,a3,a4
    a208:	00a00613          	li	a2,10
    a20c:	001a8513          	add	a0,s5,1

0000a210 <.LVL17>:
    a210:	40d64663          	blt	a2,a3,a61c <.L16>
    a214:	00200613          	li	a2,2
    a218:	013a45b3          	xor	a1,s4,s3
    a21c:	30d64e63          	blt	a2,a3,a538 <.L17>
    a220:	fff68693          	add	a3,a3,-1
    a224:	00100613          	li	a2,1
    a228:	32d67a63          	bgeu	a2,a3,a55c <.L19>

0000a22c <.L18>:
    a22c:	00010337          	lui	t1,0x10
    a230:	fff30e13          	add	t3,t1,-1 # ffff <.LVL314+0x7>
    a234:	01095713          	srl	a4,s2,0x10

0000a238 <.LVL19>:
    a238:	0107d893          	srl	a7,a5,0x10

0000a23c <.LVL20>:
    a23c:	01c97933          	and	s2,s2,t3

0000a240 <.LVL21>:
    a240:	01c7ff33          	and	t5,a5,t3
    a244:	03e907b3          	mul	a5,s2,t5

0000a248 <.LVL22>:
    a248:	03e70eb3          	mul	t4,a4,t5

0000a24c <.LVL23>:
    a24c:	0107d813          	srl	a6,a5,0x10
    a250:	03288633          	mul	a2,a7,s2

0000a254 <.LVL24>:
    a254:	01d60633          	add	a2,a2,t4

0000a258 <.LVL25>:
    a258:	00c80833          	add	a6,a6,a2
    a25c:	031706b3          	mul	a3,a4,a7

0000a260 <.LVL26>:
    a260:	01d87463          	bgeu	a6,t4,a268 <.L23>
    a264:	006686b3          	add	a3,a3,t1

0000a268 <.L23>:
    a268:	01085293          	srl	t0,a6,0x10
    a26c:	01c87833          	and	a6,a6,t3

0000a270 <.LVL28>:
    a270:	01c7f7b3          	and	a5,a5,t3

0000a274 <.LBB20>:
    a274:	01045613          	srl	a2,s0,0x10

0000a278 <.LVL30>:
    a278:	01c47e33          	and	t3,s0,t3

0000a27c <.LBB21>:
    a27c:	01081813          	sll	a6,a6,0x10
    a280:	00f80833          	add	a6,a6,a5

0000a284 <.LBB22>:
    a284:	03c90eb3          	mul	t4,s2,t3

0000a288 <.LVL32>:
    a288:	03c707b3          	mul	a5,a4,t3

0000a28c <.LVL33>:
    a28c:	03260933          	mul	s2,a2,s2

0000a290 <.LVL34>:
    a290:	02c70333          	mul	t1,a4,a2

0000a294 <.LVL35>:
    a294:	00f90933          	add	s2,s2,a5

0000a298 <.LVL36>:
    a298:	010ed713          	srl	a4,t4,0x10

0000a29c <.LVL37>:
    a29c:	01270733          	add	a4,a4,s2

0000a2a0 <.LVL38>:
    a2a0:	00f77663          	bgeu	a4,a5,a2ac <.L24>
    a2a4:	000107b7          	lui	a5,0x10

0000a2a8 <.LVL39>:
    a2a8:	00f30333          	add	t1,t1,a5

0000a2ac <.L24>:
    a2ac:	00010437          	lui	s0,0x10
    a2b0:	01075793          	srl	a5,a4,0x10
    a2b4:	fff40f93          	add	t6,s0,-1 # ffff <.LVL314+0x7>
    a2b8:	00678333          	add	t1,a5,t1

0000a2bc <.LVL41>:
    a2bc:	01f777b3          	and	a5,a4,t6
    a2c0:	01fefeb3          	and	t4,t4,t6

0000a2c4 <.LVL42>:
    a2c4:	01079793          	sll	a5,a5,0x10
    a2c8:	01f4ffb3          	and	t6,s1,t6
    a2cc:	01d787b3          	add	a5,a5,t4

0000a2d0 <.LBB23>:
    a2d0:	0104de93          	srl	t4,s1,0x10
    a2d4:	03ff03b3          	mul	t2,t5,t6
    a2d8:	00f282b3          	add	t0,t0,a5

0000a2dc <.LBB24>:
    a2dc:	03ee8f33          	mul	t5,t4,t5

0000a2e0 <.LVL44>:
    a2e0:	0103d713          	srl	a4,t2,0x10

0000a2e4 <.LVL45>:
    a2e4:	03d884b3          	mul	s1,a7,t4

0000a2e8 <.LVL46>:
    a2e8:	03f888b3          	mul	a7,a7,t6

0000a2ec <.LVL47>:
    a2ec:	01e888b3          	add	a7,a7,t5

0000a2f0 <.LVL48>:
    a2f0:	01170733          	add	a4,a4,a7

0000a2f4 <.LVL49>:
    a2f4:	01e77463          	bgeu	a4,t5,a2fc <.L25>
    a2f8:	008484b3          	add	s1,s1,s0

0000a2fc <.L25>:
    a2fc:	01075f13          	srl	t5,a4,0x10

0000a300 <.LVL51>:
    a300:	009f0f33          	add	t5,t5,s1

0000a304 <.LVL52>:
    a304:	000104b7          	lui	s1,0x10

0000a308 <.LVL53>:
    a308:	fff48413          	add	s0,s1,-1 # ffff <.LVL314+0x7>
    a30c:	00877733          	and	a4,a4,s0

0000a310 <.LVL54>:
    a310:	0083f3b3          	and	t2,t2,s0

0000a314 <.LVL55>:
    a314:	01071713          	sll	a4,a4,0x10
    a318:	007708b3          	add	a7,a4,t2

0000a31c <.LBB25>:
    a31c:	03fe03b3          	mul	t2,t3,t6

0000a320 <.LVL57>:
    a320:	03ce8e33          	mul	t3,t4,t3

0000a324 <.LVL58>:
    a324:	03d60eb3          	mul	t4,a2,t4

0000a328 <.LVL59>:
    a328:	03f60633          	mul	a2,a2,t6

0000a32c <.LVL60>:
    a32c:	0103df93          	srl	t6,t2,0x10
    a330:	01c60633          	add	a2,a2,t3

0000a334 <.LVL61>:
    a334:	00cf8fb3          	add	t6,t6,a2

0000a338 <.LVL62>:
    a338:	01cff463          	bgeu	t6,t3,a340 <.L26>
    a33c:	009e8eb3          	add	t4,t4,s1

0000a340 <.L26>:
    a340:	008ff733          	and	a4,t6,s0
    a344:	0083f3b3          	and	t2,t2,s0

0000a348 <.LVL64>:
    a348:	01071713          	sll	a4,a4,0x10

0000a34c <.LBB28>:
    a34c:	005686b3          	add	a3,a3,t0

0000a350 <.LBB29>:
    a350:	00770733          	add	a4,a4,t2
    a354:	00670333          	add	t1,a4,t1

0000a358 <.LBB30>:
    a358:	00f6b7b3          	sltu	a5,a3,a5

0000a35c <.LVL67>:
    a35c:	00f307b3          	add	a5,t1,a5
    a360:	00e33633          	sltu	a2,t1,a4

0000a364 <.LVL68>:
    a364:	011688b3          	add	a7,a3,a7

0000a368 <.LVL69>:
    a368:	0067b333          	sltu	t1,a5,t1
    a36c:	00666633          	or	a2,a2,t1

0000a370 <.LBB31>:
    a370:	00d8b6b3          	sltu	a3,a7,a3
    a374:	01e78333          	add	t1,a5,t5
    a378:	00d306b3          	add	a3,t1,a3
    a37c:	00f33733          	sltu	a4,t1,a5

0000a380 <.LBB32>:
    a380:	010fdf93          	srl	t6,t6,0x10

0000a384 <.LBB33>:
    a384:	0066b333          	sltu	t1,a3,t1

0000a388 <.LBB38>:
    a388:	00989793          	sll	a5,a7,0x9
    a38c:	01f60633          	add	a2,a2,t6

0000a390 <.LBB34>:
    a390:	00676733          	or	a4,a4,t1
    a394:	00c70733          	add	a4,a4,a2

0000a398 <.LBB41>:
    a398:	0107e7b3          	or	a5,a5,a6

0000a39c <.LBB37>:
    a39c:	01d70733          	add	a4,a4,t4

0000a3a0 <.LBB42>:
    a3a0:	00f037b3          	snez	a5,a5

0000a3a4 <.LVL74>:
    a3a4:	0178d893          	srl	a7,a7,0x17

0000a3a8 <.LVL75>:
    a3a8:	00971713          	sll	a4,a4,0x9
    a3ac:	0176d413          	srl	s0,a3,0x17

0000a3b0 <.LBE42>:
    a3b0:	0117e7b3          	or	a5,a5,a7

0000a3b4 <.LBB43>:
    a3b4:	00969693          	sll	a3,a3,0x9

0000a3b8 <.LBE43>:
    a3b8:	00d7e7b3          	or	a5,a5,a3

0000a3bc <.LBE17>:
    a3bc:	00771693          	sll	a3,a4,0x7

0000a3c0 <.LBB44>:
    a3c0:	00876433          	or	s0,a4,s0

0000a3c4 <.LBE44>:
    a3c4:	0206d063          	bgez	a3,a3e4 <.L37>
    a3c8:	0017d713          	srl	a4,a5,0x1
    a3cc:	0017f793          	and	a5,a5,1
    a3d0:	00f76733          	or	a4,a4,a5
    a3d4:	01f41793          	sll	a5,s0,0x1f

0000a3d8 <.LVL78>:
    a3d8:	00f767b3          	or	a5,a4,a5

0000a3dc <.LVL79>:
    a3dc:	00145413          	srl	s0,s0,0x1

0000a3e0 <.LVL80>:
    a3e0:	00050a93          	mv	s5,a0

0000a3e4 <.L37>:
    a3e4:	000a8513          	mv	a0,s5
    a3e8:	18c0006f          	j	a574 <.L50>

0000a3ec <.L2>:
  FP_UNPACK_D (A, a);
    a3ec:	00a4e933          	or	s2,s1,a0
    a3f0:	08090063          	beqz	s2,a470 <.L51>

0000a3f4 <.LBB54>:
    a3f4:	04048063          	beqz	s1,a434 <.L5>
    a3f8:	00048513          	mv	a0,s1

0000a3fc <.LVL83>:
    a3fc:	a18f70ef          	jal	1614 <__clzsi2>

0000a400 <.LVL84>:
    a400:	ff550713          	add	a4,a0,-11 # 7fff5 <_ebss+0x6a105>

0000a404 <.L6>:
    a404:	01d00793          	li	a5,29
    a408:	ff850693          	add	a3,a0,-8
    a40c:	40e787b3          	sub	a5,a5,a4
    a410:	00d494b3          	sll	s1,s1,a3
    a414:	00f457b3          	srl	a5,s0,a5
    a418:	0097e7b3          	or	a5,a5,s1

0000a41c <.LVL86>:
    a41c:	00d414b3          	sll	s1,s0,a3

0000a420 <.L8>:
    a420:	c0d00a93          	li	s5,-1011

0000a424 <.LVL88>:
    a424:	00048913          	mv	s2,s1
    a428:	40aa8ab3          	sub	s5,s5,a0

0000a42c <.LVL89>:
    a42c:	00078493          	mv	s1,a5
    a430:	d89ff06f          	j	a1b8 <.L79>

0000a434 <.L5>:
    a434:	9e0f70ef          	jal	1614 <__clzsi2>

0000a438 <.LVL91>:
    a438:	00050793          	mv	a5,a0

0000a43c <.LVL92>:
    a43c:	01578713          	add	a4,a5,21 # 10015 <.L101+0x1>
    a440:	01c00693          	li	a3,28
    a444:	02050513          	add	a0,a0,32

0000a448 <.LVL93>:
    a448:	fae6dee3          	bge	a3,a4,a404 <.L6>
    a44c:	ff878793          	add	a5,a5,-8
    a450:	00f417b3          	sll	a5,s0,a5

0000a454 <.LVL94>:
    a454:	fcdff06f          	j	a420 <.L8>

0000a458 <.L3>:
    a458:	00a4e933          	or	s2,s1,a0
    a45c:	02091263          	bnez	s2,a480 <.L52>

0000a460 <.LBB55>:
    a460:	00000493          	li	s1,0
    a464:	7ff00a93          	li	s5,2047

0000a468 <.LBE55>:
    a468:	00200b93          	li	s7,2
    a46c:	d51ff06f          	j	a1bc <.L4>

0000a470 <.L51>:
    a470:	00000493          	li	s1,0
    a474:	00000a93          	li	s5,0

0000a478 <.LBE56>:
    a478:	00100b93          	li	s7,1
    a47c:	d41ff06f          	j	a1bc <.L4>

0000a480 <.L52>:
    a480:	00050913          	mv	s2,a0
    a484:	7ff00a93          	li	s5,2047

0000a488 <.LBE57>:
    a488:	00300b93          	li	s7,3
    a48c:	d31ff06f          	j	a1bc <.L4>

0000a490 <.L9>:
  FP_UNPACK_D (B, b);
    a490:	016467b3          	or	a5,s0,s6
    a494:	08078263          	beqz	a5,a518 <.L53>

0000a498 <.LBB58>:
    a498:	04040063          	beqz	s0,a4d8 <.L12>
    a49c:	00040513          	mv	a0,s0
    a4a0:	974f70ef          	jal	1614 <__clzsi2>

0000a4a4 <.LVL103>:
    a4a4:	ff550693          	add	a3,a0,-11

0000a4a8 <.L13>:
    a4a8:	01d00713          	li	a4,29
    a4ac:	ff850793          	add	a5,a0,-8
    a4b0:	40d70733          	sub	a4,a4,a3
    a4b4:	00f41433          	sll	s0,s0,a5
    a4b8:	00eb5733          	srl	a4,s6,a4
    a4bc:	00876733          	or	a4,a4,s0

0000a4c0 <.LVL105>:
    a4c0:	00fb1433          	sll	s0,s6,a5

0000a4c4 <.L15>:
    a4c4:	c0d00693          	li	a3,-1011

0000a4c8 <.LVL107>:
    a4c8:	00040793          	mv	a5,s0
    a4cc:	40a686b3          	sub	a3,a3,a0

0000a4d0 <.LVL108>:
    a4d0:	00070413          	mv	s0,a4
    a4d4:	d25ff06f          	j	a1f8 <.L80>

0000a4d8 <.L12>:
    a4d8:	000b0513          	mv	a0,s6
    a4dc:	938f70ef          	jal	1614 <__clzsi2>

0000a4e0 <.LVL110>:
    a4e0:	00050793          	mv	a5,a0

0000a4e4 <.LVL111>:
    a4e4:	01578693          	add	a3,a5,21
    a4e8:	01c00713          	li	a4,28
    a4ec:	02050513          	add	a0,a0,32

0000a4f0 <.LVL112>:
    a4f0:	fad75ce3          	bge	a4,a3,a4a8 <.L13>
    a4f4:	ff878793          	add	a5,a5,-8
    a4f8:	00fb1733          	sll	a4,s6,a5

0000a4fc <.LVL113>:
    a4fc:	fc9ff06f          	j	a4c4 <.L15>

0000a500 <.L10>:
    a500:	016467b3          	or	a5,s0,s6
    a504:	02079263          	bnez	a5,a528 <.L54>

0000a508 <.LBB59>:
    a508:	00000413          	li	s0,0
    a50c:	7ff00693          	li	a3,2047

0000a510 <.LBE59>:
    a510:	00200713          	li	a4,2

0000a514 <.LVL116>:
    a514:	ce9ff06f          	j	a1fc <.L11>

0000a518 <.L53>:
    a518:	00000413          	li	s0,0
    a51c:	00000693          	li	a3,0

0000a520 <.LBE60>:
    a520:	00100713          	li	a4,1

0000a524 <.LVL118>:
    a524:	cd9ff06f          	j	a1fc <.L11>

0000a528 <.L54>:
    a528:	000b0793          	mv	a5,s6
    a52c:	7ff00693          	li	a3,2047

0000a530 <.LBE61>:
    a530:	00300713          	li	a4,3

0000a534 <.LVL120>:
    a534:	cc9ff06f          	j	a1fc <.L11>

0000a538 <.L17>:
    a538:	00100613          	li	a2,1
    a53c:	00d61633          	sll	a2,a2,a3
  FP_MUL_D (R, A, B);
    a540:	53067693          	and	a3,a2,1328
    a544:	0e069663          	bnez	a3,a630 <.L55>
    a548:	24067813          	and	a6,a2,576
    a54c:	1a081a63          	bnez	a6,a700 <.L56>
    a550:	08867613          	and	a2,a2,136
    a554:	cc060ce3          	beqz	a2,a22c <.L18>

0000a558 <.L21>:
  FP_UNPACK_D (B, b);
    a558:	00098593          	mv	a1,s3

0000a55c <.L19>:
  FP_PACK_D (r, R);
    a55c:	00200693          	li	a3,2
    a560:	18d70863          	beq	a4,a3,a6f0 <.L38>
    a564:	00300693          	li	a3,3
    a568:	1ad70463          	beq	a4,a3,a710 <.L58>
    a56c:	00100693          	li	a3,1
    a570:	1ad70663          	beq	a4,a3,a71c <.L60>

0000a574 <.L50>:
    a574:	3ff50613          	add	a2,a0,1023

0000a578 <.LVL124>:
    a578:	0cc05463          	blez	a2,a640 <.L39>
    a57c:	0077f713          	and	a4,a5,7
    a580:	02070063          	beqz	a4,a5a0 <.L40>
    a584:	00f7f713          	and	a4,a5,15
    a588:	00400693          	li	a3,4
    a58c:	00d70a63          	beq	a4,a3,a5a0 <.L40>

0000a590 <.LBB63>:
    a590:	00478713          	add	a4,a5,4
    a594:	00f736b3          	sltu	a3,a4,a5

0000a598 <.LVL125>:
    a598:	00d40433          	add	s0,s0,a3
    a59c:	00070793          	mv	a5,a4

0000a5a0 <.L40>:
    a5a0:	00741713          	sll	a4,s0,0x7
    a5a4:	00075a63          	bgez	a4,a5b8 <.L43>
    a5a8:	ff000737          	lui	a4,0xff000
    a5ac:	fff70713          	add	a4,a4,-1 # feffffff <_ebss+0xfefea10f>

0000a5b0 <.LVL127>:
    a5b0:	00e47433          	and	s0,s0,a4

0000a5b4 <.LVL128>:
    a5b4:	40050613          	add	a2,a0,1024

0000a5b8 <.L43>:
    a5b8:	7fe00713          	li	a4,2046
    a5bc:	12c74a63          	blt	a4,a2,a6f0 <.L38>
    a5c0:	0037d793          	srl	a5,a5,0x3
    a5c4:	01d41693          	sll	a3,s0,0x1d
    a5c8:	00f6e6b3          	or	a3,a3,a5
    a5cc:	00345713          	srl	a4,s0,0x3

0000a5d0 <.L20>:
    a5d0:	00c71713          	sll	a4,a4,0xc

0000a5d4 <.LBE66>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    a5d4:	02c12083          	lw	ra,44(sp)
    a5d8:	02812403          	lw	s0,40(sp)

0000a5dc <.LBB67>:
  FP_PACK_D (r, R);
    a5dc:	01461613          	sll	a2,a2,0x14

0000a5e0 <.LVL132>:
    a5e0:	00c75713          	srl	a4,a4,0xc
    a5e4:	01f59593          	sll	a1,a1,0x1f

0000a5e8 <.LVL133>:
    a5e8:	00e66633          	or	a2,a2,a4
    a5ec:	00b667b3          	or	a5,a2,a1

0000a5f0 <.LBE67>:
}
    a5f0:	02412483          	lw	s1,36(sp)
    a5f4:	02012903          	lw	s2,32(sp)
    a5f8:	01c12983          	lw	s3,28(sp)

0000a5fc <.LVL135>:
    a5fc:	01812a03          	lw	s4,24(sp)

0000a600 <.LVL136>:
    a600:	01412a83          	lw	s5,20(sp)
    a604:	01012b03          	lw	s6,16(sp)
    a608:	00c12b83          	lw	s7,12(sp)

0000a60c <.LVL137>:
    a60c:	00068513          	mv	a0,a3
    a610:	00078593          	mv	a1,a5
    a614:	03010113          	add	sp,sp,48
    a618:	00008067          	ret

0000a61c <.L16>:
  FP_MUL_D (R, A, B);
    a61c:	00f00613          	li	a2,15
    a620:	0ec68863          	beq	a3,a2,a710 <.L58>
    a624:	00b00613          	li	a2,11

0000a628 <.LBB68>:
  FP_UNPACK_D (A, a);
    a628:	000a0593          	mv	a1,s4

0000a62c <.LBE68>:
  FP_MUL_D (R, A, B);
    a62c:	f2c686e3          	beq	a3,a2,a558 <.L21>

0000a630 <.L55>:
    a630:	00048413          	mv	s0,s1

0000a634 <.LVL140>:
    a634:	00090793          	mv	a5,s2
    a638:	000b8713          	mv	a4,s7

0000a63c <.LVL141>:
    a63c:	f21ff06f          	j	a55c <.L19>

0000a640 <.L39>:
  FP_PACK_D (r, R);
    a640:	00100713          	li	a4,1
    a644:	40c70733          	sub	a4,a4,a2

0000a648 <.LVL143>:
    a648:	03800693          	li	a3,56
    a64c:	0ce6c863          	blt	a3,a4,a71c <.L60>
    a650:	01f00693          	li	a3,31
    a654:	06e6c463          	blt	a3,a4,a6bc <.L44>
    a658:	41e50513          	add	a0,a0,1054
    a65c:	00e7d633          	srl	a2,a5,a4
    a660:	00a416b3          	sll	a3,s0,a0
    a664:	00a79533          	sll	a0,a5,a0
    a668:	00c6e6b3          	or	a3,a3,a2
    a66c:	00a03533          	snez	a0,a0
    a670:	00a6e7b3          	or	a5,a3,a0

0000a674 <.LVL144>:
    a674:	00e45733          	srl	a4,s0,a4

0000a678 <.L45>:
    a678:	0077f693          	and	a3,a5,7
    a67c:	02068063          	beqz	a3,a69c <.L47>
    a680:	00f7f693          	and	a3,a5,15
    a684:	00400613          	li	a2,4
    a688:	00c68a63          	beq	a3,a2,a69c <.L47>

0000a68c <.LBB71>:
    a68c:	00478693          	add	a3,a5,4
    a690:	00f6b633          	sltu	a2,a3,a5
    a694:	00c70733          	add	a4,a4,a2

0000a698 <.LVL146>:
    a698:	00068793          	mv	a5,a3

0000a69c <.L47>:
    a69c:	00871693          	sll	a3,a4,0x8
    a6a0:	0806c463          	bltz	a3,a728 <.L62>

0000a6a4 <.LVL148>:
    a6a4:	01d71693          	sll	a3,a4,0x1d
    a6a8:	0037d793          	srl	a5,a5,0x3

0000a6ac <.LVL149>:
    a6ac:	00f6e6b3          	or	a3,a3,a5

0000a6b0 <.LVL150>:
    a6b0:	00375713          	srl	a4,a4,0x3

0000a6b4 <.L82>:
    a6b4:	00000613          	li	a2,0
    a6b8:	f19ff06f          	j	a5d0 <.L20>

0000a6bc <.L44>:
    a6bc:	fe100693          	li	a3,-31
    a6c0:	40c686b3          	sub	a3,a3,a2
    a6c4:	02000813          	li	a6,32
    a6c8:	00d456b3          	srl	a3,s0,a3
    a6cc:	00000613          	li	a2,0
    a6d0:	01070663          	beq	a4,a6,a6dc <.L46>
    a6d4:	43e50613          	add	a2,a0,1086
    a6d8:	00c41633          	sll	a2,s0,a2

0000a6dc <.L46>:
    a6dc:	00f66633          	or	a2,a2,a5
    a6e0:	00c03633          	snez	a2,a2
    a6e4:	00c6e7b3          	or	a5,a3,a2

0000a6e8 <.LVL153>:
    a6e8:	00000713          	li	a4,0

0000a6ec <.LVL154>:
    a6ec:	f8dff06f          	j	a678 <.L45>

0000a6f0 <.L38>:
    a6f0:	00000713          	li	a4,0
    a6f4:	00000693          	li	a3,0
    a6f8:	7ff00613          	li	a2,2047
    a6fc:	ed5ff06f          	j	a5d0 <.L20>

0000a700 <.L56>:
  FP_MUL_D (R, A, B);
    a700:	00080737          	lui	a4,0x80

0000a704 <.L81>:
  FP_PACK_D (r, R);
    a704:	7ff00613          	li	a2,2047
    a708:	00000593          	li	a1,0
    a70c:	ec5ff06f          	j	a5d0 <.L20>

0000a710 <.L58>:
    a710:	00080737          	lui	a4,0x80
    a714:	00000693          	li	a3,0
    a718:	fedff06f          	j	a704 <.L81>

0000a71c <.L60>:
    a71c:	00000713          	li	a4,0
    a720:	00000693          	li	a3,0
    a724:	f91ff06f          	j	a6b4 <.L82>

0000a728 <.L62>:
    a728:	00000713          	li	a4,0

0000a72c <.LVL160>:
    a72c:	00000693          	li	a3,0
    a730:	00100613          	li	a2,1
    a734:	e9dff06f          	j	a5d0 <.L20>

0000a738 <__subdf3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
    a738:	00100837          	lui	a6,0x100
    a73c:	fff80813          	add	a6,a6,-1 # fffff <_ebss+0xea10f>

0000a740 <.LBE2>:
{
    a740:	fe010113          	add	sp,sp,-32

0000a744 <.LBB3>:
  FP_UNPACK_SEMIRAW_D (A, a);
    a744:	00b878b3          	and	a7,a6,a1

0000a748 <.LVL1>:
    a748:	0145d713          	srl	a4,a1,0x14

0000a74c <.LBE3>:
    a74c:	01d55793          	srl	a5,a0,0x1d

0000a750 <.LBB5>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a750:	00d87833          	and	a6,a6,a3

0000a754 <.LBE5>:
{
    a754:	01212823          	sw	s2,16(sp)

0000a758 <.LBB6>:
  FP_UNPACK_SEMIRAW_D (A, a);
    a758:	7ff77913          	and	s2,a4,2047

0000a75c <.LBE6>:
    a75c:	00389713          	sll	a4,a7,0x3

0000a760 <.LBB8>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a760:	0146d893          	srl	a7,a3,0x14

0000a764 <.LBE8>:
{
    a764:	00912a23          	sw	s1,20(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
    a768:	00e7e7b3          	or	a5,a5,a4

0000a76c <.LBB10>:
    a76c:	01f5d493          	srl	s1,a1,0x1f

0000a770 <.LBE10>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a770:	01d65713          	srl	a4,a2,0x1d
    a774:	00381813          	sll	a6,a6,0x3
{
    a778:	00112e23          	sw	ra,28(sp)
    a77c:	00812c23          	sw	s0,24(sp)
    a780:	01312623          	sw	s3,12(sp)

0000a784 <.LBB13>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a784:	7ff8f893          	and	a7,a7,2047

0000a788 <.LBE13>:
  FP_SUB_D (R, A, B);
    a788:	7ff00593          	li	a1,2047
  FP_UNPACK_SEMIRAW_D (A, a);
    a78c:	00351513          	sll	a0,a0,0x3

0000a790 <.LBB15>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a790:	01f6d693          	srl	a3,a3,0x1f

0000a794 <.LBE15>:
    a794:	01076733          	or	a4,a4,a6

0000a798 <.LVL7>:
    a798:	00361613          	sll	a2,a2,0x3

0000a79c <.LVL8>:
  FP_SUB_D (R, A, B);
    a79c:	00b89663          	bne	a7,a1,a7a8 <.L2>
    a7a0:	00c765b3          	or	a1,a4,a2
    a7a4:	00059463          	bnez	a1,a7ac <.L3>

0000a7a8 <.L2>:
    a7a8:	0016c693          	xor	a3,a3,1

0000a7ac <.L3>:
    a7ac:	41190833          	sub	a6,s2,a7

0000a7b0 <.LBE17>:
    a7b0:	2a969a63          	bne	a3,s1,aa64 <.L4>

0000a7b4 <.LBB33>:
    a7b4:	11005c63          	blez	a6,a8cc <.L5>

0000a7b8 <.LVL11>:
    a7b8:	04089063          	bnez	a7,a7f8 <.L6>
    a7bc:	00c766b3          	or	a3,a4,a2

0000a7c0 <.LVL12>:
    a7c0:	66068063          	beqz	a3,ae20 <.L102>
    a7c4:	fff80593          	add	a1,a6,-1

0000a7c8 <.LVL13>:
    a7c8:	02059063          	bnez	a1,a7e8 <.L8>

0000a7cc <.L148>:
    a7cc:	00c50633          	add	a2,a0,a2

0000a7d0 <.LVL15>:
    a7d0:	00a636b3          	sltu	a3,a2,a0
    a7d4:	00e78733          	add	a4,a5,a4

0000a7d8 <.LVL16>:
    a7d8:	00060513          	mv	a0,a2

0000a7dc <.LVL17>:
    a7dc:	00d707b3          	add	a5,a4,a3

0000a7e0 <.LBE18>:
    a7e0:	00100913          	li	s2,1

0000a7e4 <.LVL19>:
    a7e4:	06c0006f          	j	a850 <.L11>

0000a7e8 <.L8>:
    a7e8:	7ff00693          	li	a3,2047
    a7ec:	02d81063          	bne	a6,a3,a80c <.L12>

0000a7f0 <.L112>:
    a7f0:	7ff00913          	li	s2,2047

0000a7f4 <.LVL22>:
    a7f4:	1f80006f          	j	a9ec <.L7>

0000a7f8 <.L6>:
    a7f8:	7ff00693          	li	a3,2047

0000a7fc <.LVL24>:
    a7fc:	1ed90863          	beq	s2,a3,a9ec <.L7>
    a800:	008006b7          	lui	a3,0x800
    a804:	00d76733          	or	a4,a4,a3
    a808:	00080593          	mv	a1,a6

0000a80c <.L12>:
    a80c:	03800693          	li	a3,56
    a810:	0ab6c863          	blt	a3,a1,a8c0 <.L13>
    a814:	01f00693          	li	a3,31
    a818:	06b6ca63          	blt	a3,a1,a88c <.L14>
    a81c:	02000813          	li	a6,32
    a820:	40b80833          	sub	a6,a6,a1
    a824:	010716b3          	sll	a3,a4,a6
    a828:	00b658b3          	srl	a7,a2,a1

0000a82c <.LVL27>:
    a82c:	01061833          	sll	a6,a2,a6
    a830:	0116e6b3          	or	a3,a3,a7
    a834:	01003833          	snez	a6,a6
    a838:	0106e6b3          	or	a3,a3,a6

0000a83c <.LVL28>:
    a83c:	00b755b3          	srl	a1,a4,a1

0000a840 <.L15>:
    a840:	00a68533          	add	a0,a3,a0

0000a844 <.LVL30>:
    a844:	00f585b3          	add	a1,a1,a5

0000a848 <.LVL31>:
    a848:	00d536b3          	sltu	a3,a0,a3

0000a84c <.LVL32>:
    a84c:	00d587b3          	add	a5,a1,a3

0000a850 <.L11>:
    a850:	00879713          	sll	a4,a5,0x8
    a854:	18075c63          	bgez	a4,a9ec <.L7>

0000a858 <.LVL34>:
    a858:	00190913          	add	s2,s2,1

0000a85c <.LVL35>:
    a85c:	7ff00713          	li	a4,2047
    a860:	5ae90a63          	beq	s2,a4,ae14 <.L155>
    a864:	ff800737          	lui	a4,0xff800
    a868:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7ea10f>
    a86c:	00e7f733          	and	a4,a5,a4
    a870:	00155793          	srl	a5,a0,0x1

0000a874 <.LVL36>:
    a874:	00157513          	and	a0,a0,1
    a878:	00a7e7b3          	or	a5,a5,a0
    a87c:	01f71513          	sll	a0,a4,0x1f
    a880:	00f56533          	or	a0,a0,a5
    a884:	00175793          	srl	a5,a4,0x1
    a888:	1640006f          	j	a9ec <.L7>

0000a88c <.L14>:
    a88c:	fe058693          	add	a3,a1,-32
    a890:	02000893          	li	a7,32

0000a894 <.LVL38>:
    a894:	00d756b3          	srl	a3,a4,a3
    a898:	00000813          	li	a6,0
    a89c:	01158863          	beq	a1,a7,a8ac <.L16>
    a8a0:	04000813          	li	a6,64
    a8a4:	40b80833          	sub	a6,a6,a1
    a8a8:	01071833          	sll	a6,a4,a6

0000a8ac <.L16>:
    a8ac:	00c86833          	or	a6,a6,a2
    a8b0:	01003833          	snez	a6,a6
    a8b4:	0106e6b3          	or	a3,a3,a6

0000a8b8 <.L146>:
    a8b8:	00000593          	li	a1,0

0000a8bc <.LVL40>:
    a8bc:	f85ff06f          	j	a840 <.L15>

0000a8c0 <.L13>:
    a8c0:	00c766b3          	or	a3,a4,a2
    a8c4:	00d036b3          	snez	a3,a3
    a8c8:	ff1ff06f          	j	a8b8 <.L146>

0000a8cc <.L5>:
    a8cc:	0c080a63          	beqz	a6,a9a0 <.L19>
    a8d0:	412886b3          	sub	a3,a7,s2

0000a8d4 <.LVL43>:
    a8d4:	02091463          	bnez	s2,a8fc <.L20>
    a8d8:	00a7e5b3          	or	a1,a5,a0
    a8dc:	50058e63          	beqz	a1,adf8 <.L93>
    a8e0:	fff68593          	add	a1,a3,-1 # 7fffff <_ebss+0x7ea10f>

0000a8e4 <.LVL44>:
    a8e4:	ee0584e3          	beqz	a1,a7cc <.L148>
    a8e8:	7ff00813          	li	a6,2047
    a8ec:	03069263          	bne	a3,a6,a910 <.L24>

0000a8f0 <.L98>:
    a8f0:	00070793          	mv	a5,a4

0000a8f4 <.LVL46>:
    a8f4:	00060513          	mv	a0,a2

0000a8f8 <.LVL47>:
    a8f8:	ef9ff06f          	j	a7f0 <.L112>

0000a8fc <.L20>:
    a8fc:	7ff00593          	li	a1,2047
    a900:	feb888e3          	beq	a7,a1,a8f0 <.L98>
    a904:	008005b7          	lui	a1,0x800
    a908:	00b7e7b3          	or	a5,a5,a1
    a90c:	00068593          	mv	a1,a3

0000a910 <.L24>:
    a910:	03800693          	li	a3,56
    a914:	08b6c063          	blt	a3,a1,a994 <.L25>
    a918:	01f00693          	li	a3,31
    a91c:	04b6c263          	blt	a3,a1,a960 <.L26>
    a920:	02000813          	li	a6,32
    a924:	40b80833          	sub	a6,a6,a1
    a928:	010796b3          	sll	a3,a5,a6
    a92c:	00b55333          	srl	t1,a0,a1
    a930:	01051833          	sll	a6,a0,a6
    a934:	0066e6b3          	or	a3,a3,t1
    a938:	01003833          	snez	a6,a6
    a93c:	0106e6b3          	or	a3,a3,a6

0000a940 <.LVL51>:
    a940:	00b7d5b3          	srl	a1,a5,a1

0000a944 <.L27>:
    a944:	00c68633          	add	a2,a3,a2

0000a948 <.LVL53>:
    a948:	00e585b3          	add	a1,a1,a4

0000a94c <.LVL54>:
    a94c:	00d636b3          	sltu	a3,a2,a3

0000a950 <.LVL55>:
    a950:	00060513          	mv	a0,a2

0000a954 <.LVL56>:
    a954:	00d587b3          	add	a5,a1,a3

0000a958 <.LBE25>:
    a958:	00088913          	mv	s2,a7

0000a95c <.LVL58>:
    a95c:	ef5ff06f          	j	a850 <.L11>

0000a960 <.L26>:
    a960:	fe058693          	add	a3,a1,-32 # 7fffe0 <_ebss+0x7ea0f0>
    a964:	02000313          	li	t1,32
    a968:	00d7d6b3          	srl	a3,a5,a3
    a96c:	00000813          	li	a6,0
    a970:	00658863          	beq	a1,t1,a980 <.L28>
    a974:	04000813          	li	a6,64
    a978:	40b80833          	sub	a6,a6,a1
    a97c:	01079833          	sll	a6,a5,a6

0000a980 <.L28>:
    a980:	00a86833          	or	a6,a6,a0
    a984:	01003833          	snez	a6,a6
    a988:	0106e6b3          	or	a3,a3,a6

0000a98c <.L147>:
    a98c:	00000593          	li	a1,0

0000a990 <.LVL61>:
    a990:	fb5ff06f          	j	a944 <.L27>

0000a994 <.L25>:
    a994:	00a7e6b3          	or	a3,a5,a0
    a998:	00d036b3          	snez	a3,a3
    a99c:	ff1ff06f          	j	a98c <.L147>

0000a9a0 <.L19>:
    a9a0:	00190693          	add	a3,s2,1

0000a9a4 <.LVL64>:
    a9a4:	7fe6f593          	and	a1,a3,2046
    a9a8:	08059663          	bnez	a1,aa34 <.L31>
    a9ac:	00a7e6b3          	or	a3,a5,a0
    a9b0:	06091263          	bnez	s2,aa14 <.L32>

0000a9b4 <.LVL65>:
    a9b4:	44068863          	beqz	a3,ae04 <.L97>
    a9b8:	00c766b3          	or	a3,a4,a2
    a9bc:	02068863          	beqz	a3,a9ec <.L7>

0000a9c0 <.LBB27>:
    a9c0:	00c50633          	add	a2,a0,a2

0000a9c4 <.LVL66>:
    a9c4:	00a636b3          	sltu	a3,a2,a0
    a9c8:	00e78733          	add	a4,a5,a4

0000a9cc <.LVL67>:
    a9cc:	00d707b3          	add	a5,a4,a3

0000a9d0 <.LBE27>:
    a9d0:	00879713          	sll	a4,a5,0x8

0000a9d4 <.LBB28>:
    a9d4:	00060513          	mv	a0,a2

0000a9d8 <.LBE28>:
    a9d8:	00075a63          	bgez	a4,a9ec <.L7>
    a9dc:	ff800737          	lui	a4,0xff800
    a9e0:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7ea10f>
    a9e4:	00e7f7b3          	and	a5,a5,a4

0000a9e8 <.LVL70>:
    a9e8:	00100913          	li	s2,1

0000a9ec <.L7>:
  FP_PACK_SEMIRAW_D (r, R);
    a9ec:	00757713          	and	a4,a0,7
    a9f0:	44070863          	beqz	a4,ae40 <.L85>
    a9f4:	00f57713          	and	a4,a0,15
    a9f8:	00400693          	li	a3,4
    a9fc:	44d70263          	beq	a4,a3,ae40 <.L85>

0000aa00 <.LBB62>:
    aa00:	00450713          	add	a4,a0,4
    aa04:	00a736b3          	sltu	a3,a4,a0
    aa08:	00d787b3          	add	a5,a5,a3

0000aa0c <.LVL72>:
    aa0c:	00070513          	mv	a0,a4

0000aa10 <.LVL73>:
    aa10:	4300006f          	j	ae40 <.L85>

0000aa14 <.L32>:
  FP_SUB_D (R, A, B);
    aa14:	ec068ee3          	beqz	a3,a8f0 <.L98>
    aa18:	00c76633          	or	a2,a4,a2

0000aa1c <.LVL75>:
    aa1c:	dc060ae3          	beqz	a2,a7f0 <.L112>

0000aa20 <.L111>:
    aa20:	00000493          	li	s1,0

0000aa24 <.LVL77>:
    aa24:	004007b7          	lui	a5,0x400

0000aa28 <.LVL78>:
    aa28:	00000513          	li	a0,0

0000aa2c <.LVL79>:
    aa2c:	7ff00913          	li	s2,2047

0000aa30 <.LVL80>:
    aa30:	4100006f          	j	ae40 <.L85>

0000aa34 <.L31>:
    aa34:	7ff00593          	li	a1,2047
    aa38:	3cb68c63          	beq	a3,a1,ae10 <.L100>
    aa3c:	00c50633          	add	a2,a0,a2

0000aa40 <.LBB31>:
    aa40:	00a63533          	sltu	a0,a2,a0

0000aa44 <.LVL83>:
    aa44:	00e78733          	add	a4,a5,a4

0000aa48 <.LVL84>:
    aa48:	00a70733          	add	a4,a4,a0

0000aa4c <.LBE31>:
    aa4c:	01f71513          	sll	a0,a4,0x1f
    aa50:	00165613          	srl	a2,a2,0x1

0000aa54 <.LVL85>:
    aa54:	00c56533          	or	a0,a0,a2
    aa58:	00175793          	srl	a5,a4,0x1

0000aa5c <.L152>:
    aa5c:	00068913          	mv	s2,a3

0000aa60 <.LVL87>:
    aa60:	f8dff06f          	j	a9ec <.L7>

0000aa64 <.L4>:
    aa64:	0f005c63          	blez	a6,ab5c <.L37>

0000aa68 <.LVL89>:
    aa68:	08089e63          	bnez	a7,ab04 <.L38>
    aa6c:	00c766b3          	or	a3,a4,a2

0000aa70 <.LVL90>:
    aa70:	3a068863          	beqz	a3,ae20 <.L102>
    aa74:	fff80693          	add	a3,a6,-1

0000aa78 <.LVL91>:
    aa78:	02069063          	bnez	a3,aa98 <.L39>

0000aa7c <.LBB36>:
    aa7c:	40c50633          	sub	a2,a0,a2

0000aa80 <.LVL92>:
    aa80:	00c536b3          	sltu	a3,a0,a2

0000aa84 <.LVL93>:
    aa84:	40e78733          	sub	a4,a5,a4

0000aa88 <.LVL94>:
    aa88:	00060513          	mv	a0,a2

0000aa8c <.LVL95>:
    aa8c:	40d707b3          	sub	a5,a4,a3

0000aa90 <.L151>:
    aa90:	00100913          	li	s2,1

0000aa94 <.LVL97>:
    aa94:	0540006f          	j	aae8 <.L42>

0000aa98 <.L39>:
    aa98:	7ff00593          	li	a1,2047
    aa9c:	d4b80ae3          	beq	a6,a1,a7f0 <.L112>

0000aaa0 <.L43>:
    aaa0:	03800593          	li	a1,56
    aaa4:	0ad5c663          	blt	a1,a3,ab50 <.L44>
    aaa8:	01f00593          	li	a1,31
    aaac:	06d5c863          	blt	a1,a3,ab1c <.L45>
    aab0:	02000813          	li	a6,32
    aab4:	40d80833          	sub	a6,a6,a3
    aab8:	00d658b3          	srl	a7,a2,a3

0000aabc <.LVL100>:
    aabc:	010715b3          	sll	a1,a4,a6
    aac0:	01061833          	sll	a6,a2,a6
    aac4:	0115e5b3          	or	a1,a1,a7
    aac8:	01003833          	snez	a6,a6
    aacc:	0105e633          	or	a2,a1,a6
    aad0:	00d756b3          	srl	a3,a4,a3

0000aad4 <.L46>:
    aad4:	40c50633          	sub	a2,a0,a2

0000aad8 <.LVL103>:
    aad8:	00c53733          	sltu	a4,a0,a2
    aadc:	40d786b3          	sub	a3,a5,a3

0000aae0 <.LVL104>:
    aae0:	00060513          	mv	a0,a2

0000aae4 <.LVL105>:
    aae4:	40e687b3          	sub	a5,a3,a4

0000aae8 <.L42>:
    aae8:	00879713          	sll	a4,a5,0x8
    aaec:	f00750e3          	bgez	a4,a9ec <.L7>

0000aaf0 <.LBB39>:
    aaf0:	00800437          	lui	s0,0x800
    aaf4:	fff40413          	add	s0,s0,-1 # 7fffff <_ebss+0x7ea10f>
    aaf8:	0087f433          	and	s0,a5,s0

0000aafc <.LVL107>:
    aafc:	00050993          	mv	s3,a0
    ab00:	2100006f          	j	ad10 <.L76>

0000ab04 <.L38>:
    ab04:	7ff00693          	li	a3,2047

0000ab08 <.LVL109>:
    ab08:	eed902e3          	beq	s2,a3,a9ec <.L7>
    ab0c:	008006b7          	lui	a3,0x800
    ab10:	00d76733          	or	a4,a4,a3
    ab14:	00080693          	mv	a3,a6
    ab18:	f89ff06f          	j	aaa0 <.L43>

0000ab1c <.L45>:
    ab1c:	fe068593          	add	a1,a3,-32 # 7fffe0 <_ebss+0x7ea0f0>
    ab20:	02000893          	li	a7,32

0000ab24 <.LVL112>:
    ab24:	00b755b3          	srl	a1,a4,a1
    ab28:	00000813          	li	a6,0
    ab2c:	01168863          	beq	a3,a7,ab3c <.L47>
    ab30:	04000813          	li	a6,64
    ab34:	40d80833          	sub	a6,a6,a3
    ab38:	01071833          	sll	a6,a4,a6

0000ab3c <.L47>:
    ab3c:	00c86833          	or	a6,a6,a2
    ab40:	01003833          	snez	a6,a6
    ab44:	0105e633          	or	a2,a1,a6

0000ab48 <.L149>:
    ab48:	00000693          	li	a3,0

0000ab4c <.LVL114>:
    ab4c:	f89ff06f          	j	aad4 <.L46>

0000ab50 <.L44>:
    ab50:	00c76633          	or	a2,a4,a2

0000ab54 <.LVL116>:
    ab54:	00c03633          	snez	a2,a2
    ab58:	ff1ff06f          	j	ab48 <.L149>

0000ab5c <.L37>:
    ab5c:	0e080863          	beqz	a6,ac4c <.L50>
    ab60:	41288833          	sub	a6,a7,s2

0000ab64 <.LVL118>:
    ab64:	04091263          	bnez	s2,aba8 <.L51>
    ab68:	00a7e5b3          	or	a1,a5,a0
    ab6c:	2a058e63          	beqz	a1,ae28 <.L105>
    ab70:	fff80593          	add	a1,a6,-1

0000ab74 <.LVL119>:
    ab74:	00059e63          	bnez	a1,ab90 <.L52>

0000ab78 <.LBB45>:
    ab78:	40a60533          	sub	a0,a2,a0

0000ab7c <.LVL121>:
    ab7c:	40f70733          	sub	a4,a4,a5

0000ab80 <.LVL122>:
    ab80:	00a63633          	sltu	a2,a2,a0

0000ab84 <.LVL123>:
    ab84:	40c707b3          	sub	a5,a4,a2

0000ab88 <.LBE45>:
    ab88:	00068493          	mv	s1,a3

0000ab8c <.LVL125>:
    ab8c:	f05ff06f          	j	aa90 <.L151>

0000ab90 <.L52>:
    ab90:	7ff00313          	li	t1,2047
    ab94:	02681463          	bne	a6,t1,abbc <.L55>

0000ab98 <.L107>:
    ab98:	00070793          	mv	a5,a4

0000ab9c <.LVL128>:
    ab9c:	00060513          	mv	a0,a2

0000aba0 <.LVL129>:
    aba0:	7ff00913          	li	s2,2047

0000aba4 <.LVL130>:
    aba4:	0d00006f          	j	ac74 <.L153>

0000aba8 <.L51>:
    aba8:	7ff00593          	li	a1,2047
    abac:	feb886e3          	beq	a7,a1,ab98 <.L107>
    abb0:	008005b7          	lui	a1,0x800
    abb4:	00b7e7b3          	or	a5,a5,a1
    abb8:	00080593          	mv	a1,a6

0000abbc <.L55>:
    abbc:	03800813          	li	a6,56
    abc0:	08b84063          	blt	a6,a1,ac40 <.L56>
    abc4:	01f00813          	li	a6,31
    abc8:	04b84263          	blt	a6,a1,ac0c <.L57>
    abcc:	02000313          	li	t1,32
    abd0:	40b30333          	sub	t1,t1,a1
    abd4:	00b55e33          	srl	t3,a0,a1
    abd8:	00679833          	sll	a6,a5,t1
    abdc:	00651333          	sll	t1,a0,t1
    abe0:	01c86833          	or	a6,a6,t3
    abe4:	00603333          	snez	t1,t1
    abe8:	00686533          	or	a0,a6,t1
    abec:	00b7d5b3          	srl	a1,a5,a1

0000abf0 <.L58>:
    abf0:	40a60533          	sub	a0,a2,a0

0000abf4 <.LVL136>:
    abf4:	40b705b3          	sub	a1,a4,a1

0000abf8 <.LVL137>:
    abf8:	00a63633          	sltu	a2,a2,a0

0000abfc <.LVL138>:
    abfc:	40c587b3          	sub	a5,a1,a2

0000ac00 <.LBE47>:
    ac00:	00088913          	mv	s2,a7

0000ac04 <.LVL140>:
    ac04:	00068493          	mv	s1,a3

0000ac08 <.LVL141>:
    ac08:	ee1ff06f          	j	aae8 <.L42>

0000ac0c <.L57>:
    ac0c:	fe058813          	add	a6,a1,-32 # 7fffe0 <_ebss+0x7ea0f0>
    ac10:	02000e13          	li	t3,32
    ac14:	0107d833          	srl	a6,a5,a6
    ac18:	00000313          	li	t1,0
    ac1c:	01c58863          	beq	a1,t3,ac2c <.L59>
    ac20:	04000313          	li	t1,64
    ac24:	40b30333          	sub	t1,t1,a1
    ac28:	00679333          	sll	t1,a5,t1

0000ac2c <.L59>:
    ac2c:	00a36333          	or	t1,t1,a0
    ac30:	00603333          	snez	t1,t1
    ac34:	00686533          	or	a0,a6,t1

0000ac38 <.L150>:
    ac38:	00000593          	li	a1,0

0000ac3c <.LVL144>:
    ac3c:	fb5ff06f          	j	abf0 <.L58>

0000ac40 <.L56>:
    ac40:	00a7e533          	or	a0,a5,a0

0000ac44 <.LVL146>:
    ac44:	00a03533          	snez	a0,a0
    ac48:	ff1ff06f          	j	ac38 <.L150>

0000ac4c <.L50>:
    ac4c:	00190593          	add	a1,s2,1
    ac50:	7fe5f593          	and	a1,a1,2046
    ac54:	08059663          	bnez	a1,ace0 <.L62>

0000ac58 <.LBE69>:
    ac58:	00c765b3          	or	a1,a4,a2

0000ac5c <.LBB70>:
    ac5c:	00a7e833          	or	a6,a5,a0

0000ac60 <.LBB71>:
    ac60:	06091063          	bnez	s2,acc0 <.L63>

0000ac64 <.LVL148>:
    ac64:	00081c63          	bnez	a6,ac7c <.L64>

0000ac68 <.LVL149>:
    ac68:	10058e63          	beqz	a1,ad84 <.L156>
    ac6c:	00070793          	mv	a5,a4

0000ac70 <.LVL150>:
    ac70:	00060513          	mv	a0,a2

0000ac74 <.L153>:
    ac74:	00068493          	mv	s1,a3

0000ac78 <.LVL152>:
    ac78:	d75ff06f          	j	a9ec <.L7>

0000ac7c <.L64>:
    ac7c:	d60588e3          	beqz	a1,a9ec <.L7>

0000ac80 <.LBB49>:
    ac80:	40c50833          	sub	a6,a0,a2

0000ac84 <.LVL154>:
    ac84:	010538b3          	sltu	a7,a0,a6

0000ac88 <.LVL155>:
    ac88:	40e785b3          	sub	a1,a5,a4
    ac8c:	411585b3          	sub	a1,a1,a7

0000ac90 <.LBE49>:
    ac90:	00859893          	sll	a7,a1,0x8
    ac94:	0008dc63          	bgez	a7,acac <.L67>

0000ac98 <.LBB50>:
    ac98:	40a60533          	sub	a0,a2,a0

0000ac9c <.LVL158>:
    ac9c:	40f70733          	sub	a4,a4,a5

0000aca0 <.LVL159>:
    aca0:	00a63633          	sltu	a2,a2,a0

0000aca4 <.LVL160>:
    aca4:	40c707b3          	sub	a5,a4,a2

0000aca8 <.LBE50>:
    aca8:	fcdff06f          	j	ac74 <.L153>

0000acac <.L67>:
    acac:	00b86533          	or	a0,a6,a1

0000acb0 <.LVL163>:
    acb0:	18050463          	beqz	a0,ae38 <.L110>

0000acb4 <.LBB51>:
    acb4:	00058793          	mv	a5,a1

0000acb8 <.LVL164>:
    acb8:	00080513          	mv	a0,a6
    acbc:	d31ff06f          	j	a9ec <.L7>

0000acc0 <.L63>:
    acc0:	00081c63          	bnez	a6,acd8 <.L70>
    acc4:	d4058ee3          	beqz	a1,aa20 <.L111>
    acc8:	00070793          	mv	a5,a4

0000accc <.LVL166>:
    accc:	00060513          	mv	a0,a2

0000acd0 <.LVL167>:
    acd0:	00068493          	mv	s1,a3

0000acd4 <.LVL168>:
    acd4:	b1dff06f          	j	a7f0 <.L112>

0000acd8 <.L70>:
    acd8:	b0058ce3          	beqz	a1,a7f0 <.L112>
    acdc:	d45ff06f          	j	aa20 <.L111>

0000ace0 <.L62>:
    ace0:	40c505b3          	sub	a1,a0,a2
    ace4:	00b53833          	sltu	a6,a0,a1
    ace8:	40e78433          	sub	s0,a5,a4
    acec:	41040433          	sub	s0,s0,a6

0000acf0 <.LBE52>:
    acf0:	00841813          	sll	a6,s0,0x8

0000acf4 <.LBB53>:
    acf4:	00058993          	mv	s3,a1

0000acf8 <.LBE53>:
    acf8:	08085063          	bgez	a6,ad78 <.L73>

0000acfc <.LBB54>:
    acfc:	40a609b3          	sub	s3,a2,a0

0000ad00 <.LVL173>:
    ad00:	40f70433          	sub	s0,a4,a5

0000ad04 <.LVL174>:
    ad04:	01363633          	sltu	a2,a2,s3

0000ad08 <.LVL175>:
    ad08:	40c40433          	sub	s0,s0,a2

0000ad0c <.LBE54>:
    ad0c:	00068493          	mv	s1,a3

0000ad10 <.L76>:
    ad10:	06040e63          	beqz	s0,ad8c <.L77>
    ad14:	00040513          	mv	a0,s0
    ad18:	8fdf60ef          	jal	1614 <__clzsi2>

0000ad1c <.LVL178>:
    ad1c:	ff850693          	add	a3,a0,-8

0000ad20 <.L78>:
    ad20:	02000793          	li	a5,32
    ad24:	40d787b3          	sub	a5,a5,a3
    ad28:	00d41433          	sll	s0,s0,a3

0000ad2c <.LVL180>:
    ad2c:	00f9d7b3          	srl	a5,s3,a5
    ad30:	0087e7b3          	or	a5,a5,s0

0000ad34 <.LVL181>:
    ad34:	00d99433          	sll	s0,s3,a3

0000ad38 <.L80>:
    ad38:	0b26c463          	blt	a3,s2,ade0 <.L81>
    ad3c:	412686b3          	sub	a3,a3,s2

0000ad40 <.LVL183>:
    ad40:	00168613          	add	a2,a3,1

0000ad44 <.LVL184>:
    ad44:	01f00713          	li	a4,31
    ad48:	06c74263          	blt	a4,a2,adac <.L82>
    ad4c:	02000713          	li	a4,32
    ad50:	40c70733          	sub	a4,a4,a2
    ad54:	00e79533          	sll	a0,a5,a4
    ad58:	00c456b3          	srl	a3,s0,a2
    ad5c:	00e41733          	sll	a4,s0,a4
    ad60:	00d56533          	or	a0,a0,a3
    ad64:	00e03733          	snez	a4,a4
    ad68:	00e56533          	or	a0,a0,a4

0000ad6c <.LVL185>:
    ad6c:	00c7d7b3          	srl	a5,a5,a2

0000ad70 <.L154>:
    ad70:	00000913          	li	s2,0

0000ad74 <.LVL187>:
    ad74:	c79ff06f          	j	a9ec <.L7>

0000ad78 <.L73>:
    ad78:	0085e5b3          	or	a1,a1,s0

0000ad7c <.LVL189>:
    ad7c:	f8059ae3          	bnez	a1,ad10 <.L76>
    ad80:	00000913          	li	s2,0

0000ad84 <.L156>:
    ad84:	00000493          	li	s1,0

0000ad88 <.LVL191>:
    ad88:	08c0006f          	j	ae14 <.L155>

0000ad8c <.L77>:
    ad8c:	00098513          	mv	a0,s3
    ad90:	885f60ef          	jal	1614 <__clzsi2>

0000ad94 <.LVL193>:
    ad94:	01850693          	add	a3,a0,24

0000ad98 <.LVL194>:
    ad98:	01f00793          	li	a5,31
    ad9c:	f8d7d2e3          	bge	a5,a3,ad20 <.L78>
    ada0:	ff850793          	add	a5,a0,-8
    ada4:	00f997b3          	sll	a5,s3,a5

0000ada8 <.LVL195>:
    ada8:	f91ff06f          	j	ad38 <.L80>

0000adac <.L82>:
    adac:	fe168693          	add	a3,a3,-31
    adb0:	00d7d533          	srl	a0,a5,a3
    adb4:	02000693          	li	a3,32
    adb8:	00000713          	li	a4,0
    adbc:	00d60863          	beq	a2,a3,adcc <.L83>
    adc0:	04000713          	li	a4,64
    adc4:	40c70733          	sub	a4,a4,a2
    adc8:	00e79733          	sll	a4,a5,a4

0000adcc <.L83>:
    adcc:	00e46733          	or	a4,s0,a4
    add0:	00e03733          	snez	a4,a4
    add4:	00e56533          	or	a0,a0,a4

0000add8 <.LVL197>:
    add8:	00000793          	li	a5,0
    addc:	f95ff06f          	j	ad70 <.L154>

0000ade0 <.L81>:
    ade0:	ff800737          	lui	a4,0xff800
    ade4:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7ea10f>
    ade8:	40d90933          	sub	s2,s2,a3
    adec:	00e7f7b3          	and	a5,a5,a4
    adf0:	00040513          	mv	a0,s0
    adf4:	bf9ff06f          	j	a9ec <.L7>

0000adf8 <.L93>:
    adf8:	00070793          	mv	a5,a4

0000adfc <.LVL202>:
    adfc:	00060513          	mv	a0,a2

0000ae00 <.LVL203>:
    ae00:	c5dff06f          	j	aa5c <.L152>

0000ae04 <.L97>:
    ae04:	00070793          	mv	a5,a4

0000ae08 <.LVL205>:
    ae08:	00060513          	mv	a0,a2

0000ae0c <.LVL206>:
    ae0c:	be1ff06f          	j	a9ec <.L7>

0000ae10 <.L100>:
    ae10:	7ff00913          	li	s2,2047

0000ae14 <.L155>:
    ae14:	00000793          	li	a5,0
    ae18:	00000513          	li	a0,0
    ae1c:	0240006f          	j	ae40 <.L85>

0000ae20 <.L102>:
    ae20:	00080913          	mv	s2,a6

0000ae24 <.LVL210>:
    ae24:	bc9ff06f          	j	a9ec <.L7>

0000ae28 <.L105>:
    ae28:	00070793          	mv	a5,a4

0000ae2c <.LVL212>:
    ae2c:	00060513          	mv	a0,a2

0000ae30 <.LVL213>:
    ae30:	00080913          	mv	s2,a6

0000ae34 <.LVL214>:
    ae34:	e41ff06f          	j	ac74 <.L153>

0000ae38 <.L110>:
    ae38:	00000793          	li	a5,0

0000ae3c <.LBE58>:
    ae3c:	00000493          	li	s1,0

0000ae40 <.L85>:
  FP_PACK_SEMIRAW_D (r, R);
    ae40:	00879713          	sll	a4,a5,0x8
    ae44:	00075e63          	bgez	a4,ae60 <.L88>

0000ae48 <.LVL218>:
    ae48:	00190913          	add	s2,s2,1

0000ae4c <.LVL219>:
    ae4c:	7ff00713          	li	a4,2047
    ae50:	08e90263          	beq	s2,a4,aed4 <.L115>
    ae54:	ff800737          	lui	a4,0xff800
    ae58:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7ea10f>
    ae5c:	00e7f7b3          	and	a5,a5,a4

0000ae60 <.L88>:
    ae60:	01d79693          	sll	a3,a5,0x1d
    ae64:	00355513          	srl	a0,a0,0x3

0000ae68 <.LVL221>:
    ae68:	7ff00713          	li	a4,2047
    ae6c:	00a6e6b3          	or	a3,a3,a0

0000ae70 <.LVL222>:
    ae70:	0037d793          	srl	a5,a5,0x3
    ae74:	00e91e63          	bne	s2,a4,ae90 <.L89>

0000ae78 <.LVL224>:
    ae78:	00f6e6b3          	or	a3,a3,a5

0000ae7c <.LVL225>:
    ae7c:	00000793          	li	a5,0

0000ae80 <.LVL226>:
    ae80:	00068863          	beqz	a3,ae90 <.L89>
    ae84:	000807b7          	lui	a5,0x80
    ae88:	00000693          	li	a3,0
    ae8c:	00000493          	li	s1,0

0000ae90 <.L89>:
    ae90:	01491713          	sll	a4,s2,0x14
    ae94:	7ff00637          	lui	a2,0x7ff00
    ae98:	00c79793          	sll	a5,a5,0xc

0000ae9c <.LVL228>:
    ae9c:	00c77733          	and	a4,a4,a2

0000aea0 <.LBE75>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    aea0:	01c12083          	lw	ra,28(sp)
    aea4:	01812403          	lw	s0,24(sp)

0000aea8 <.LBB76>:
  FP_PACK_SEMIRAW_D (r, R);
    aea8:	00c7d793          	srl	a5,a5,0xc
    aeac:	00f767b3          	or	a5,a4,a5
    aeb0:	01f49713          	sll	a4,s1,0x1f
    aeb4:	00e7e633          	or	a2,a5,a4

0000aeb8 <.LBE76>:
}
    aeb8:	01412483          	lw	s1,20(sp)

0000aebc <.LVL230>:
    aebc:	01012903          	lw	s2,16(sp)
    aec0:	00c12983          	lw	s3,12(sp)
    aec4:	00068513          	mv	a0,a3
    aec8:	00060593          	mv	a1,a2
    aecc:	02010113          	add	sp,sp,32
    aed0:	00008067          	ret

0000aed4 <.L115>:
    aed4:	00000793          	li	a5,0

0000aed8 <.LVL232>:
    aed8:	00000513          	li	a0,0

0000aedc <.LVL233>:
    aedc:	f85ff06f          	j	ae60 <.L88>

0000aee0 <__fixdfsi>:
  FP_DECL_EX;
  FP_DECL_D (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    aee0:	0145d713          	srl	a4,a1,0x14
    aee4:	001006b7          	lui	a3,0x100
    aee8:	fff68793          	add	a5,a3,-1 # fffff <_ebss+0xea10f>
    aeec:	7ff77713          	and	a4,a4,2047

0000aef0 <.LBE2>:
  FP_TO_INT_D (r, A, SI_BITS, 1);
    aef0:	3fe00613          	li	a2,1022

0000aef4 <.LBB3>:
  FP_UNPACK_RAW_D (A, a);
    aef4:	00b7f7b3          	and	a5,a5,a1

0000aef8 <.LVL1>:
    aef8:	01f5d593          	srl	a1,a1,0x1f

0000aefc <.LBE3>:
  FP_TO_INT_D (r, A, SI_BITS, 1);
    aefc:	04e65e63          	bge	a2,a4,af58 <.L6>
    af00:	41d00613          	li	a2,1053
    af04:	00e65a63          	bge	a2,a4,af18 <.L3>

0000af08 <.LVL3>:
    af08:	80000537          	lui	a0,0x80000

0000af0c <.LVL4>:
    af0c:	fff50513          	add	a0,a0,-1 # 7fffffff <_ebss+0x7ffea10f>
    af10:	00a58533          	add	a0,a1,a0
    af14:	00008067          	ret

0000af18 <.L3>:
    af18:	00d7e7b3          	or	a5,a5,a3
    af1c:	43300693          	li	a3,1075
    af20:	40e686b3          	sub	a3,a3,a4
    af24:	01f00613          	li	a2,31
    af28:	02d64063          	blt	a2,a3,af48 <.L4>

0000af2c <.LVL7>:
    af2c:	bed70713          	add	a4,a4,-1043

0000af30 <.LVL8>:
    af30:	00e797b3          	sll	a5,a5,a4

0000af34 <.LVL9>:
    af34:	00d55533          	srl	a0,a0,a3

0000af38 <.LVL10>:
    af38:	00a7e533          	or	a0,a5,a0

0000af3c <.L5>:
    af3c:	02058063          	beqz	a1,af5c <.L2>
    af40:	40a00533          	neg	a0,a0

0000af44 <.LVL12>:
    af44:	00008067          	ret

0000af48 <.L4>:
    af48:	41300693          	li	a3,1043
    af4c:	40e68733          	sub	a4,a3,a4

0000af50 <.LVL14>:
    af50:	00e7d533          	srl	a0,a5,a4

0000af54 <.LVL15>:
    af54:	fe9ff06f          	j	af3c <.L5>

0000af58 <.L6>:
    af58:	00000513          	li	a0,0

0000af5c <.L2>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    af5c:	00008067          	ret

0000af60 <__floatsidf>:
#include "soft-fp.h"
#include "double.h"

DFtype
__floatsidf (SItype i)
{
    af60:	ff010113          	add	sp,sp,-16
    af64:	00112623          	sw	ra,12(sp)
    af68:	00812423          	sw	s0,8(sp)
    af6c:	00912223          	sw	s1,4(sp)

0000af70 <.LBB9>:
  FP_DECL_D (A);
  DFtype a;

  FP_FROM_INT_D (A, i, SI_BITS, USItype);
    af70:	08050663          	beqz	a0,affc <.L5>

0000af74 <.LBB3>:
    af74:	41f55793          	sra	a5,a0,0x1f
    af78:	00a7c433          	xor	s0,a5,a0
    af7c:	40f40433          	sub	s0,s0,a5
    af80:	01f55493          	srl	s1,a0,0x1f

0000af84 <.LBB4>:
    af84:	00040513          	mv	a0,s0

0000af88 <.LVL3>:
    af88:	e8cf60ef          	jal	1614 <__clzsi2>

0000af8c <.LVL4>:
    af8c:	41e00713          	li	a4,1054

0000af90 <.LBE4>:
    af90:	00a00793          	li	a5,10

0000af94 <.LBB5>:
    af94:	40a70733          	sub	a4,a4,a0

0000af98 <.LBE5>:
    af98:	04a7c863          	blt	a5,a0,afe8 <.L4>
    af9c:	00b00793          	li	a5,11
    afa0:	40a787b3          	sub	a5,a5,a0
    afa4:	01550513          	add	a0,a0,21

0000afa8 <.LVL6>:
    afa8:	00f457b3          	srl	a5,s0,a5

0000afac <.LVL7>:
    afac:	00a41433          	sll	s0,s0,a0

0000afb0 <.LVL8>:
    afb0:	00048513          	mv	a0,s1

0000afb4 <.L2>:
  FP_PACK_RAW_D (a, A);
    afb4:	00c79793          	sll	a5,a5,0xc

0000afb8 <.LVL10>:
    afb8:	00c7d793          	srl	a5,a5,0xc
    afbc:	01471713          	sll	a4,a4,0x14

0000afc0 <.LVL11>:
    afc0:	01f51513          	sll	a0,a0,0x1f

0000afc4 <.LVL12>:
    afc4:	00f76733          	or	a4,a4,a5

0000afc8 <.LBE10>:

  return a;
}
    afc8:	00c12083          	lw	ra,12(sp)

0000afcc <.LBB11>:
  FP_PACK_RAW_D (a, A);
    afcc:	00a767b3          	or	a5,a4,a0

0000afd0 <.LBE11>:
}
    afd0:	00040513          	mv	a0,s0
    afd4:	00812403          	lw	s0,8(sp)

0000afd8 <.LVL14>:
    afd8:	00412483          	lw	s1,4(sp)
    afdc:	00078593          	mv	a1,a5
    afe0:	01010113          	add	sp,sp,16
    afe4:	00008067          	ret

0000afe8 <.L4>:
  FP_FROM_INT_D (A, i, SI_BITS, USItype);
    afe8:	ff550513          	add	a0,a0,-11

0000afec <.LVL16>:
    afec:	00a417b3          	sll	a5,s0,a0

0000aff0 <.LVL17>:
    aff0:	00048513          	mv	a0,s1

0000aff4 <.L7>:
    aff4:	00000413          	li	s0,0
    aff8:	fbdff06f          	j	afb4 <.L2>

0000affc <.L5>:
    affc:	00000713          	li	a4,0
    b000:	00000793          	li	a5,0
    b004:	ff1ff06f          	j	aff4 <.L7>

0000b008 <__divtf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__divtf3 (TFtype a, TFtype b)
{
    b008:	f5010113          	add	sp,sp,-176
    b00c:	09312e23          	sw	s3,156(sp)
    b010:	00c5a983          	lw	s3,12(a1)
    b014:	0045a783          	lw	a5,4(a1)
    b018:	0085a803          	lw	a6,8(a1)
    b01c:	0a812423          	sw	s0,168(sp)
    b020:	00050413          	mv	s0,a0
    b024:	0005a503          	lw	a0,0(a1)

0000b028 <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_Q (A, a);
    b028:	01099713          	sll	a4,s3,0x10

0000b02c <.LBE3>:
{
    b02c:	0b212023          	sw	s2,160(sp)
    b030:	09512a23          	sw	s5,148(sp)
    b034:	00462903          	lw	s2,4(a2) # 7ff00004 <_ebss+0x7feea114>
    b038:	00c62a83          	lw	s5,12(a2)
    b03c:	09612823          	sw	s6,144(sp)
    b040:	09712623          	sw	s7,140(sp)
    b044:	00862b03          	lw	s6,8(a2)
    b048:	00062b83          	lw	s7,0(a2)

0000b04c <.LBB4>:
  FP_UNPACK_Q (A, a);
    b04c:	00008637          	lui	a2,0x8

0000b050 <.LBE4>:
{
    b050:	0a912223          	sw	s1,164(sp)

0000b054 <.LBB5>:
  FP_UNPACK_Q (A, a);
    b054:	01075713          	srl	a4,a4,0x10
    b058:	0109d493          	srl	s1,s3,0x10
    b05c:	fff60613          	add	a2,a2,-1 # 7fff <__kernel_rem_pio2+0x5f>
    b060:	07312623          	sw	s3,108(sp)

0000b064 <.LBE5>:
{
    b064:	0a112623          	sw	ra,172(sp)
    b068:	09412c23          	sw	s4,152(sp)
    b06c:	09812423          	sw	s8,136(sp)
    b070:	09912223          	sw	s9,132(sp)
    b074:	09a12023          	sw	s10,128(sp)
    b078:	07b12e23          	sw	s11,124(sp)

0000b07c <.LBB6>:
  FP_UNPACK_Q (A, a);
    b07c:	06a12023          	sw	a0,96(sp)
    b080:	06f12223          	sw	a5,100(sp)
    b084:	07012423          	sw	a6,104(sp)
    b088:	02a12823          	sw	a0,48(sp)
    b08c:	02f12a23          	sw	a5,52(sp)
    b090:	03012c23          	sw	a6,56(sp)
    b094:	02e12e23          	sw	a4,60(sp)
    b098:	00c4f6b3          	and	a3,s1,a2

0000b09c <.LVL2>:
    b09c:	01f9d993          	srl	s3,s3,0x1f

0000b0a0 <.LBE6>:
    b0a0:	10068e63          	beqz	a3,b1bc <.L2>
    b0a4:	24c68863          	beq	a3,a2,b2f4 <.L3>
    b0a8:	000107b7          	lui	a5,0x10
    b0ac:	00f76733          	or	a4,a4,a5
    b0b0:	02e12e23          	sw	a4,60(sp)

0000b0b4 <.LBB7>:
    b0b4:	03010593          	add	a1,sp,48
    b0b8:	03c10793          	add	a5,sp,60

0000b0bc <.L4>:
    b0bc:	0007a703          	lw	a4,0(a5) # 10000 <.LVL314+0x8>
    b0c0:	ffc7a603          	lw	a2,-4(a5)
    b0c4:	ffc78793          	add	a5,a5,-4
    b0c8:	00371713          	sll	a4,a4,0x3
    b0cc:	01d65613          	srl	a2,a2,0x1d
    b0d0:	00c76733          	or	a4,a4,a2
    b0d4:	00e7a223          	sw	a4,4(a5)
    b0d8:	fef592e3          	bne	a1,a5,b0bc <.L4>

0000b0dc <.LBE7>:
    b0dc:	ffffc7b7          	lui	a5,0xffffc

0000b0e0 <.LBB8>:
    b0e0:	00351513          	sll	a0,a0,0x3

0000b0e4 <.LBE8>:
    b0e4:	00178793          	add	a5,a5,1 # ffffc001 <_ebss+0xfffe6111>

0000b0e8 <.LBB9>:
    b0e8:	02a12823          	sw	a0,48(sp)

0000b0ec <.LBE9>:
    b0ec:	00f684b3          	add	s1,a3,a5

0000b0f0 <.L193>:
    b0f0:	00000a13          	li	s4,0

0000b0f4 <.L5>:
  FP_UNPACK_Q (B, b);
    b0f4:	010a9513          	sll	a0,s5,0x10
    b0f8:	00008737          	lui	a4,0x8
    b0fc:	010ad793          	srl	a5,s5,0x10
    b100:	01055513          	srl	a0,a0,0x10
    b104:	fff70713          	add	a4,a4,-1 # 7fff <__kernel_rem_pio2+0x5f>
    b108:	07512623          	sw	s5,108(sp)
    b10c:	07712023          	sw	s7,96(sp)
    b110:	07212223          	sw	s2,100(sp)
    b114:	07612423          	sw	s6,104(sp)
    b118:	05712023          	sw	s7,64(sp)
    b11c:	05212223          	sw	s2,68(sp)
    b120:	05612423          	sw	s6,72(sp)
    b124:	04a12623          	sw	a0,76(sp)
    b128:	00e7f7b3          	and	a5,a5,a4

0000b12c <.LVL9>:
    b12c:	01fada93          	srl	s5,s5,0x1f

0000b130 <.LBE13>:
    b130:	1e078863          	beqz	a5,b320 <.L18>
    b134:	32e78263          	beq	a5,a4,b458 <.L19>
    b138:	00010737          	lui	a4,0x10
    b13c:	00e56533          	or	a0,a0,a4
    b140:	04a12623          	sw	a0,76(sp)

0000b144 <.LBB14>:
    b144:	04010593          	add	a1,sp,64
    b148:	04c10713          	add	a4,sp,76

0000b14c <.L20>:
    b14c:	00072683          	lw	a3,0(a4) # 10000 <.LVL314+0x8>
    b150:	ffc72603          	lw	a2,-4(a4)
    b154:	ffc70713          	add	a4,a4,-4
    b158:	00369693          	sll	a3,a3,0x3
    b15c:	01d65613          	srl	a2,a2,0x1d
    b160:	00c6e6b3          	or	a3,a3,a2
    b164:	00d72223          	sw	a3,4(a4)
    b168:	fee592e3          	bne	a1,a4,b14c <.L20>

0000b16c <.LBE14>:
    b16c:	ffffc737          	lui	a4,0xffffc

0000b170 <.LBB15>:
    b170:	003b9b93          	sll	s7,s7,0x3

0000b174 <.LBE15>:
    b174:	00170713          	add	a4,a4,1 # ffffc001 <_ebss+0xfffe6111>

0000b178 <.LBB16>:
    b178:	05712023          	sw	s7,64(sp)

0000b17c <.LBE16>:
    b17c:	00e787b3          	add	a5,a5,a4

0000b180 <.L194>:
    b180:	00000713          	li	a4,0

0000b184 <.L21>:
  FP_DIV_Q (R, A, B);
    b184:	40f486b3          	sub	a3,s1,a5
    b188:	002a1793          	sll	a5,s4,0x2

0000b18c <.LVL16>:
    b18c:	00e7e7b3          	or	a5,a5,a4
    b190:	fff78793          	add	a5,a5,-1
    b194:	00e00613          	li	a2,14
    b198:	0159c933          	xor	s2,s3,s5

0000b19c <.LVL17>:
    b19c:	2ef66263          	bltu	a2,a5,b480 <.L34>
    b1a0:	00007617          	auipc	a2,0x7
    b1a4:	97c60613          	add	a2,a2,-1668 # 11b1c <.L36>
    b1a8:	00279793          	sll	a5,a5,0x2
    b1ac:	00c787b3          	add	a5,a5,a2
    b1b0:	0007a783          	lw	a5,0(a5)
    b1b4:	00c787b3          	add	a5,a5,a2
    b1b8:	00078067          	jr	a5

0000b1bc <.L2>:
  FP_UNPACK_Q (A, a);
    b1bc:	00a7e6b3          	or	a3,a5,a0

0000b1c0 <.LVL19>:
    b1c0:	0106e6b3          	or	a3,a3,a6
    b1c4:	00e6e6b3          	or	a3,a3,a4
    b1c8:	14068663          	beqz	a3,b314 <.L145>

0000b1cc <.LBB20>:
    b1cc:	0a070063          	beqz	a4,b26c <.L6>
    b1d0:	00070513          	mv	a0,a4
    b1d4:	c40f60ef          	jal	1614 <__clzsi2>

0000b1d8 <.L7>:
    b1d8:	ff450713          	add	a4,a0,-12
    b1dc:	40575593          	sra	a1,a4,0x5

0000b1e0 <.LVL21>:
    b1e0:	01f77713          	and	a4,a4,31

0000b1e4 <.LVL22>:
    b1e4:	0a070e63          	beqz	a4,b2a0 <.L10>
    b1e8:	ffc00693          	li	a3,-4
    b1ec:	02d586b3          	mul	a3,a1,a3
    b1f0:	02000813          	li	a6,32
    b1f4:	03010313          	add	t1,sp,48
    b1f8:	40e80833          	sub	a6,a6,a4

0000b1fc <.LVL23>:
    b1fc:	00c68793          	add	a5,a3,12
    b200:	00f307b3          	add	a5,t1,a5
    b204:	40d006b3          	neg	a3,a3

0000b208 <.L11>:
    b208:	0cf31463          	bne	t1,a5,b2d0 <.L14>
    b20c:	fff58793          	add	a5,a1,-1

0000b210 <.LVL24>:
    b210:	00259593          	sll	a1,a1,0x2

0000b214 <.LVL25>:
    b214:	04058693          	add	a3,a1,64
    b218:	03010613          	add	a2,sp,48
    b21c:	00c685b3          	add	a1,a3,a2
    b220:	03012683          	lw	a3,48(sp)
    b224:	00e69733          	sll	a4,a3,a4

0000b228 <.LVL26>:
    b228:	fce5a023          	sw	a4,-64(a1)

0000b22c <.L15>:
    b22c:	00178793          	add	a5,a5,1
    b230:	00279793          	sll	a5,a5,0x2
    b234:	00800693          	li	a3,8
    b238:	03010713          	add	a4,sp,48
    b23c:	00d7ea63          	bltu	a5,a3,b250 <.L16>
    b240:	02012823          	sw	zero,48(sp)
    b244:	00072223          	sw	zero,4(a4)
    b248:	ff878793          	add	a5,a5,-8
    b24c:	03810713          	add	a4,sp,56

0000b250 <.L16>:
    b250:	00400693          	li	a3,4
    b254:	00d7e463          	bltu	a5,a3,b25c <.L17>
    b258:	00072023          	sw	zero,0(a4)

0000b25c <.L17>:
    b25c:	ffffc6b7          	lui	a3,0xffffc
    b260:	01168693          	add	a3,a3,17 # ffffc011 <_ebss+0xfffe6121>
    b264:	40a684b3          	sub	s1,a3,a0

0000b268 <.LVL28>:
    b268:	e89ff06f          	j	b0f0 <.L193>

0000b26c <.L6>:
    b26c:	00080a63          	beqz	a6,b280 <.L8>
    b270:	00080513          	mv	a0,a6
    b274:	ba0f60ef          	jal	1614 <__clzsi2>

0000b278 <.LVL30>:
    b278:	02050513          	add	a0,a0,32
    b27c:	f5dff06f          	j	b1d8 <.L7>

0000b280 <.L8>:
    b280:	00078a63          	beqz	a5,b294 <.L9>
    b284:	00078513          	mv	a0,a5
    b288:	b8cf60ef          	jal	1614 <__clzsi2>

0000b28c <.LVL33>:
    b28c:	04050513          	add	a0,a0,64
    b290:	f49ff06f          	j	b1d8 <.L7>

0000b294 <.L9>:
    b294:	b80f60ef          	jal	1614 <__clzsi2>

0000b298 <.LVL36>:
    b298:	06050513          	add	a0,a0,96
    b29c:	f3dff06f          	j	b1d8 <.L7>

0000b2a0 <.L10>:
    b2a0:	ffc00693          	li	a3,-4
    b2a4:	02d586b3          	mul	a3,a1,a3
    b2a8:	03c10793          	add	a5,sp,60

0000b2ac <.LBB12>:
    b2ac:	00300713          	li	a4,3

0000b2b0 <.L12>:
    b2b0:	00d78633          	add	a2,a5,a3
    b2b4:	00062603          	lw	a2,0(a2)
    b2b8:	fff70713          	add	a4,a4,-1

0000b2bc <.LVL40>:
    b2bc:	ffc78793          	add	a5,a5,-4
    b2c0:	00c7a223          	sw	a2,4(a5)

0000b2c4 <.LVL41>:
    b2c4:	feb756e3          	bge	a4,a1,b2b0 <.L12>
    b2c8:	fff58793          	add	a5,a1,-1
    b2cc:	f61ff06f          	j	b22c <.L15>

0000b2d0 <.L14>:
    b2d0:	0007a603          	lw	a2,0(a5)
    b2d4:	ffc7a883          	lw	a7,-4(a5)
    b2d8:	00d78e33          	add	t3,a5,a3
    b2dc:	00e61633          	sll	a2,a2,a4
    b2e0:	0108d8b3          	srl	a7,a7,a6
    b2e4:	01166633          	or	a2,a2,a7
    b2e8:	00ce2023          	sw	a2,0(t3) # 7ff00000 <_ebss+0x7feea110>
    b2ec:	ffc78793          	add	a5,a5,-4
    b2f0:	f19ff06f          	j	b208 <.L11>

0000b2f4 <.L3>:
    b2f4:	00a7e7b3          	or	a5,a5,a0
    b2f8:	0107e7b3          	or	a5,a5,a6
    b2fc:	00e7e7b3          	or	a5,a5,a4

0000b300 <.LBB21>:
    b300:	00068493          	mv	s1,a3

0000b304 <.LBE21>:
    b304:	00200a13          	li	s4,2
    b308:	de0786e3          	beqz	a5,b0f4 <.L5>
    b30c:	00300a13          	li	s4,3
    b310:	de5ff06f          	j	b0f4 <.L5>

0000b314 <.L145>:
    b314:	00000493          	li	s1,0

0000b318 <.LBE22>:
    b318:	00100a13          	li	s4,1
    b31c:	dd9ff06f          	j	b0f4 <.L5>

0000b320 <.L18>:
  FP_UNPACK_Q (B, b);
    b320:	017967b3          	or	a5,s2,s7

0000b324 <.LVL47>:
    b324:	0167e7b3          	or	a5,a5,s6
    b328:	00a7e7b3          	or	a5,a5,a0
    b32c:	14078463          	beqz	a5,b474 <.L147>

0000b330 <.LBB23>:
    b330:	08050e63          	beqz	a0,b3cc <.L22>
    b334:	ae0f60ef          	jal	1614 <__clzsi2>

0000b338 <.L23>:
    b338:	ff450693          	add	a3,a0,-12
    b33c:	4056d793          	sra	a5,a3,0x5

0000b340 <.LVL49>:
    b340:	01f6f693          	and	a3,a3,31

0000b344 <.LVL50>:
    b344:	0c068063          	beqz	a3,b404 <.L26>
    b348:	ffc00613          	li	a2,-4
    b34c:	02c78633          	mul	a2,a5,a2
    b350:	02000813          	li	a6,32
    b354:	04010313          	add	t1,sp,64
    b358:	40d80833          	sub	a6,a6,a3

0000b35c <.LVL51>:
    b35c:	00c60713          	add	a4,a2,12
    b360:	00e30733          	add	a4,t1,a4
    b364:	40c00633          	neg	a2,a2

0000b368 <.L27>:
    b368:	0ce31663          	bne	t1,a4,b434 <.L30>
    b36c:	fff78713          	add	a4,a5,-1

0000b370 <.LVL52>:
    b370:	00279793          	sll	a5,a5,0x2

0000b374 <.LVL53>:
    b374:	03010613          	add	a2,sp,48
    b378:	04078793          	add	a5,a5,64
    b37c:	00c787b3          	add	a5,a5,a2
    b380:	04012603          	lw	a2,64(sp)
    b384:	00d616b3          	sll	a3,a2,a3

0000b388 <.LVL54>:
    b388:	fcd7a823          	sw	a3,-48(a5)

0000b38c <.L31>:
    b38c:	00170793          	add	a5,a4,1
    b390:	00279793          	sll	a5,a5,0x2
    b394:	00800693          	li	a3,8
    b398:	04010713          	add	a4,sp,64
    b39c:	00d7ea63          	bltu	a5,a3,b3b0 <.L32>
    b3a0:	04012023          	sw	zero,64(sp)
    b3a4:	00072223          	sw	zero,4(a4)
    b3a8:	ff878793          	add	a5,a5,-8
    b3ac:	04810713          	add	a4,sp,72

0000b3b0 <.L32>:
    b3b0:	00400693          	li	a3,4
    b3b4:	00d7e463          	bltu	a5,a3,b3bc <.L33>
    b3b8:	00072023          	sw	zero,0(a4)

0000b3bc <.L33>:
    b3bc:	ffffc7b7          	lui	a5,0xffffc
    b3c0:	01178793          	add	a5,a5,17 # ffffc011 <_ebss+0xfffe6121>
    b3c4:	40a787b3          	sub	a5,a5,a0
    b3c8:	db9ff06f          	j	b180 <.L194>

0000b3cc <.L22>:
    b3cc:	000b0a63          	beqz	s6,b3e0 <.L24>
    b3d0:	000b0513          	mv	a0,s6
    b3d4:	a40f60ef          	jal	1614 <__clzsi2>

0000b3d8 <.LVL57>:
    b3d8:	02050513          	add	a0,a0,32
    b3dc:	f5dff06f          	j	b338 <.L23>

0000b3e0 <.L24>:
    b3e0:	00090a63          	beqz	s2,b3f4 <.L25>
    b3e4:	00090513          	mv	a0,s2
    b3e8:	a2cf60ef          	jal	1614 <__clzsi2>

0000b3ec <.LVL60>:
    b3ec:	04050513          	add	a0,a0,64
    b3f0:	f49ff06f          	j	b338 <.L23>

0000b3f4 <.L25>:
    b3f4:	000b8513          	mv	a0,s7
    b3f8:	a1cf60ef          	jal	1614 <__clzsi2>

0000b3fc <.LVL63>:
    b3fc:	06050513          	add	a0,a0,96
    b400:	f39ff06f          	j	b338 <.L23>

0000b404 <.L26>:
    b404:	ffc00613          	li	a2,-4
    b408:	02c78633          	mul	a2,a5,a2
    b40c:	04c10713          	add	a4,sp,76

0000b410 <.LBB19>:
    b410:	00300693          	li	a3,3

0000b414 <.L28>:
    b414:	00c705b3          	add	a1,a4,a2
    b418:	0005a583          	lw	a1,0(a1)
    b41c:	fff68693          	add	a3,a3,-1

0000b420 <.LVL67>:
    b420:	ffc70713          	add	a4,a4,-4
    b424:	00b72223          	sw	a1,4(a4)

0000b428 <.LVL68>:
    b428:	fef6d6e3          	bge	a3,a5,b414 <.L28>
    b42c:	fff78713          	add	a4,a5,-1
    b430:	f5dff06f          	j	b38c <.L31>

0000b434 <.L30>:
    b434:	00072583          	lw	a1,0(a4)
    b438:	ffc72883          	lw	a7,-4(a4)
    b43c:	00c70e33          	add	t3,a4,a2
    b440:	00d595b3          	sll	a1,a1,a3
    b444:	0108d8b3          	srl	a7,a7,a6
    b448:	0115e5b3          	or	a1,a1,a7
    b44c:	00be2023          	sw	a1,0(t3)
    b450:	ffc70713          	add	a4,a4,-4
    b454:	f15ff06f          	j	b368 <.L27>

0000b458 <.L19>:
    b458:	01796933          	or	s2,s2,s7
    b45c:	01696933          	or	s2,s2,s6
    b460:	00a96933          	or	s2,s2,a0
    b464:	00200713          	li	a4,2
    b468:	d0090ee3          	beqz	s2,b184 <.L21>
    b46c:	00300713          	li	a4,3
    b470:	d15ff06f          	j	b184 <.L21>

0000b474 <.L147>:
    b474:	00000793          	li	a5,0

0000b478 <.LBE24>:
    b478:	00100713          	li	a4,1

0000b47c <.LVL72>:
    b47c:	d09ff06f          	j	b184 <.L21>

0000b480 <.L34>:
  FP_DIV_Q (R, A, B);
    b480:	03c12703          	lw	a4,60(sp)

0000b484 <.LVL74>:
    b484:	04c12503          	lw	a0,76(sp)
    b488:	06012623          	sw	zero,108(sp)
    b48c:	06012423          	sw	zero,104(sp)
    b490:	06012223          	sw	zero,100(sp)
    b494:	06012023          	sw	zero,96(sp)
    b498:	03012783          	lw	a5,48(sp)
    b49c:	03412603          	lw	a2,52(sp)
    b4a0:	04012803          	lw	a6,64(sp)
    b4a4:	04812583          	lw	a1,72(sp)
    b4a8:	02e56263          	bltu	a0,a4,b4cc <.L41>
    b4ac:	22a71263          	bne	a4,a0,b6d0 <.L42>
    b4b0:	03812503          	lw	a0,56(sp)
    b4b4:	00a5ec63          	bltu	a1,a0,b4cc <.L41>
    b4b8:	20b51c63          	bne	a0,a1,b6d0 <.L42>
    b4bc:	04412583          	lw	a1,68(sp)
    b4c0:	00c5e663          	bltu	a1,a2,b4cc <.L41>
    b4c4:	20c59663          	bne	a1,a2,b6d0 <.L42>
    b4c8:	2107e463          	bltu	a5,a6,b6d0 <.L42>

0000b4cc <.L41>:
    b4cc:	01f79793          	sll	a5,a5,0x1f
    b4d0:	06f12623          	sw	a5,108(sp)

0000b4d4 <.LBB26>:
    b4d4:	03c10513          	add	a0,sp,60
    b4d8:	03010793          	add	a5,sp,48

0000b4dc <.L43>:
    b4dc:	0007a603          	lw	a2,0(a5)
    b4e0:	0047a583          	lw	a1,4(a5)
    b4e4:	00478793          	add	a5,a5,4
    b4e8:	00165613          	srl	a2,a2,0x1
    b4ec:	01f59593          	sll	a1,a1,0x1f
    b4f0:	00b66633          	or	a2,a2,a1
    b4f4:	fec7ae23          	sw	a2,-4(a5)
    b4f8:	fef512e3          	bne	a0,a5,b4dc <.L43>

0000b4fc <.LVL77>:
    b4fc:	00175713          	srl	a4,a4,0x1
    b500:	02e12e23          	sw	a4,60(sp)

0000b504 <.L44>:
    b504:	04010593          	add	a1,sp,64
    b508:	04c10793          	add	a5,sp,76

0000b50c <.L45>:
    b50c:	0007a703          	lw	a4,0(a5)
    b510:	ffc7a603          	lw	a2,-4(a5)
    b514:	ffc78793          	add	a5,a5,-4
    b518:	00c71713          	sll	a4,a4,0xc
    b51c:	01465613          	srl	a2,a2,0x14
    b520:	00c76733          	or	a4,a4,a2
    b524:	00e7a223          	sw	a4,4(a5)
    b528:	fef592e3          	bne	a1,a5,b50c <.L45>

0000b52c <.LBE27>:
    b52c:	04c12503          	lw	a0,76(sp)

0000b530 <.LBB28>:
    b530:	00010eb7          	lui	t4,0x10

0000b534 <.LBB29>:
    b534:	04412303          	lw	t1,68(sp)

0000b538 <.LBB54>:
    b538:	fffe8e93          	add	t4,t4,-1 # ffff <.LVL314+0x7>

0000b53c <.LBB55>:
    b53c:	00c81813          	sll	a6,a6,0xc

0000b540 <.LBB56>:
    b540:	01d577b3          	and	a5,a0,t4

0000b544 <.LBB31>:
    b544:	04812f83          	lw	t6,72(sp)

0000b548 <.LBB58>:
    b548:	00f12e23          	sw	a5,28(sp)

0000b54c <.LBB32>:
    b54c:	01085793          	srl	a5,a6,0x10
    b550:	00f12423          	sw	a5,8(sp)

0000b554 <.LBB33>:
    b554:	01035793          	srl	a5,t1,0x10
    b558:	00f12623          	sw	a5,12(sp)
    b55c:	01d377b3          	and	a5,t1,t4
    b560:	00f12a23          	sw	a5,20(sp)

0000b564 <.LBB34>:
    b564:	010fd793          	srl	a5,t6,0x10
    b568:	00f12823          	sw	a5,16(sp)
    b56c:	01dff7b3          	and	a5,t6,t4
    b570:	00f12c23          	sw	a5,24(sp)
    b574:	01d877b3          	and	a5,a6,t4
    b578:	02f12023          	sw	a5,32(sp)
    b57c:	03812883          	lw	a7,56(sp)

0000b580 <.LBB60>:
    b580:	410307b3          	sub	a5,t1,a6
    b584:	03c12703          	lw	a4,60(sp)
    b588:	03412603          	lw	a2,52(sp)
    b58c:	03012583          	lw	a1,48(sp)
    b590:	02f12223          	sw	a5,36(sp)
    b594:	406f87b3          	sub	a5,t6,t1

0000b598 <.LBB61>:
    b598:	01055d13          	srl	s10,a0,0x10
    b59c:	05010a13          	add	s4,sp,80

0000b5a0 <.LVL81>:
    b5a0:	06010c13          	add	s8,sp,96

0000b5a4 <.LBE61>:
    b5a4:	00300c93          	li	s9,3

0000b5a8 <.LBB62>:
    b5a8:	00010db7          	lui	s11,0x10

0000b5ac <.LBB63>:
    b5ac:	02f12423          	sw	a5,40(sp)

0000b5b0 <.L113>:
    b5b0:	12e51463          	bne	a0,a4,b6d8 <.L46>
    b5b4:	fff00793          	li	a5,-1
    b5b8:	00fa2623          	sw	a5,12(s4)
    b5bc:	3e0c8c63          	beqz	s9,b9b4 <.L114>

0000b5c0 <.LBB64>:
    b5c0:	00cc2f03          	lw	t5,12(s8)

0000b5c4 <.LVL83>:
    b5c4:	40b803b3          	sub	t2,a6,a1
    b5c8:	00783e33          	sltu	t3,a6,t2
    b5cc:	01e037b3          	snez	a5,t5

0000b5d0 <.LVL84>:
    b5d0:	00000993          	li	s3,0
    b5d4:	000f0463          	beqz	t5,b5dc <.L50>
    b5d8:	0013b993          	seqz	s3,t2

0000b5dc <.L50>:
    b5dc:	01c9e9b3          	or	s3,s3,t3

0000b5e0 <.LVL85>:
    b5e0:	40c302b3          	sub	t0,t1,a2

0000b5e4 <.LVL86>:
    b5e4:	00533e33          	sltu	t3,t1,t0

0000b5e8 <.LVL87>:
    b5e8:	00000a93          	li	s5,0
    b5ec:	00098463          	beqz	s3,b5f4 <.L53>
    b5f0:	0012ba93          	seqz	s5,t0

0000b5f4 <.L53>:
    b5f4:	01caeab3          	or	s5,s5,t3

0000b5f8 <.LBB65>:
    b5f8:	02412e03          	lw	t3,36(sp)
    b5fc:	01e80f33          	add	t5,a6,t5

0000b600 <.LVL89>:
    b600:	00be0e33          	add	t3,t3,a1
    b604:	00fe0e33          	add	t3,t3,a5

0000b608 <.LVL90>:
    b608:	01e835b3          	sltu	a1,a6,t5
    b60c:	01c334b3          	sltu	s1,t1,t3

0000b610 <.LVL91>:
    b610:	40be0e33          	sub	t3,t3,a1

0000b614 <.LVL92>:
    b614:	00000593          	li	a1,0
    b618:	01e87863          	bgeu	a6,t5,b628 <.L54>

0000b61c <.LBB66>:
    b61c:	40f383b3          	sub	t2,t2,a5

0000b620 <.LBB67>:
    b620:	406383b3          	sub	t2,t2,t1
    b624:	0013b593          	seqz	a1,t2

0000b628 <.L54>:
    b628:	02812783          	lw	a5,40(sp)

0000b62c <.LVL94>:
    b62c:	0095e5b3          	or	a1,a1,s1

0000b630 <.LVL95>:
    b630:	00c784b3          	add	s1,a5,a2
    b634:	013484b3          	add	s1,s1,s3

0000b638 <.LVL96>:
    b638:	009fb3b3          	sltu	t2,t6,s1

0000b63c <.LVL97>:
    b63c:	00000613          	li	a2,0
    b640:	40b484b3          	sub	s1,s1,a1

0000b644 <.LVL98>:
    b644:	00058863          	beqz	a1,b654 <.L55>

0000b648 <.LBB68>:
    b648:	413282b3          	sub	t0,t0,s3

0000b64c <.LBB69>:
    b64c:	41f282b3          	sub	t0,t0,t6
    b650:	0012b613          	seqz	a2,t0

0000b654 <.L55>:
    b654:	41f707b3          	sub	a5,a4,t6
    b658:	011787b3          	add	a5,a5,a7
    b65c:	015787b3          	add	a5,a5,s5
    b660:	00766633          	or	a2,a2,t2

0000b664 <.LVL101>:
    b664:	40c787b3          	sub	a5,a5,a2

0000b668 <.LBE69>:
    b668:	04f77463          	bgeu	a4,a5,b6b0 <.L56>
    b66c:	006e02b3          	add	t0,t3,t1
    b670:	01e80f33          	add	t5,a6,t5

0000b674 <.LVL102>:
    b674:	01c2b8b3          	sltu	a7,t0,t3

0000b678 <.LBB70>:
    b678:	010f3e33          	sltu	t3,t5,a6

0000b67c <.LVL103>:
    b67c:	01c28e33          	add	t3,t0,t3
    b680:	005e32b3          	sltu	t0,t3,t0
    b684:	01f485b3          	add	a1,s1,t6

0000b688 <.LVL104>:
    b688:	0058e8b3          	or	a7,a7,t0

0000b68c <.LBE70>:
    b68c:	ffe00613          	li	a2,-2

0000b690 <.LVL105>:
    b690:	011588b3          	add	a7,a1,a7
    b694:	00ca2623          	sw	a2,12(s4)

0000b698 <.LBB71>:
    b698:	0095b633          	sltu	a2,a1,s1

0000b69c <.LVL107>:
    b69c:	00b8b5b3          	sltu	a1,a7,a1
    b6a0:	00b66633          	or	a2,a2,a1

0000b6a4 <.LVL108>:
    b6a4:	00e60633          	add	a2,a2,a4
    b6a8:	00088493          	mv	s1,a7

0000b6ac <.LVL109>:
    b6ac:	00c787b3          	add	a5,a5,a2

0000b6b0 <.L56>:
    b6b0:	fffc8c93          	add	s9,s9,-1
    b6b4:	ffca0a13          	add	s4,s4,-4
    b6b8:	ffcc0c13          	add	s8,s8,-4
    b6bc:	00048893          	mv	a7,s1
    b6c0:	000e0613          	mv	a2,t3
    b6c4:	000f0593          	mv	a1,t5
    b6c8:	00078713          	mv	a4,a5
    b6cc:	ee5ff06f          	j	b5b0 <.L113>

0000b6d0 <.L42>:
    b6d0:	fff68693          	add	a3,a3,-1
    b6d4:	e31ff06f          	j	b504 <.L44>

0000b6d8 <.L46>:
    b6d8:	03a75e33          	divu	t3,a4,s10

0000b6dc <.LVL115>:
    b6dc:	01c12783          	lw	a5,28(sp)
    b6e0:	0108df13          	srl	t5,a7,0x10
    b6e4:	03a77733          	remu	a4,a4,s10

0000b6e8 <.LVL116>:
    b6e8:	03c787b3          	mul	a5,a5,t3

0000b6ec <.LVL117>:
    b6ec:	01071713          	sll	a4,a4,0x10

0000b6f0 <.LVL118>:
    b6f0:	00ef6733          	or	a4,t5,a4

0000b6f4 <.LVL119>:
    b6f4:	000e0f13          	mv	t5,t3
    b6f8:	00f77e63          	bgeu	a4,a5,b714 <.L67>
    b6fc:	00e50733          	add	a4,a0,a4

0000b700 <.LVL120>:
    b700:	fffe0f13          	add	t5,t3,-1

0000b704 <.LVL121>:
    b704:	00a76863          	bltu	a4,a0,b714 <.L67>
    b708:	00f77663          	bgeu	a4,a5,b714 <.L67>
    b70c:	ffee0f13          	add	t5,t3,-2
    b710:	00a70733          	add	a4,a4,a0

0000b714 <.L67>:
    b714:	40f70733          	sub	a4,a4,a5

0000b718 <.LVL124>:
    b718:	03a75e33          	divu	t3,a4,s10

0000b71c <.LVL125>:
    b71c:	01c12783          	lw	a5,28(sp)

0000b720 <.LVL126>:
    b720:	01d8f8b3          	and	a7,a7,t4
    b724:	03a77733          	remu	a4,a4,s10

0000b728 <.LVL127>:
    b728:	03c787b3          	mul	a5,a5,t3

0000b72c <.LVL128>:
    b72c:	01071713          	sll	a4,a4,0x10

0000b730 <.LVL129>:
    b730:	00e8e8b3          	or	a7,a7,a4

0000b734 <.LVL130>:
    b734:	000e0713          	mv	a4,t3
    b738:	00f8fe63          	bgeu	a7,a5,b754 <.L70>
    b73c:	011508b3          	add	a7,a0,a7

0000b740 <.LVL131>:
    b740:	fffe0713          	add	a4,t3,-1

0000b744 <.LVL132>:
    b744:	00a8e863          	bltu	a7,a0,b754 <.L70>
    b748:	00f8f663          	bgeu	a7,a5,b754 <.L70>
    b74c:	ffee0713          	add	a4,t3,-2
    b750:	00a888b3          	add	a7,a7,a0

0000b754 <.L70>:
    b754:	40f887b3          	sub	a5,a7,a5

0000b758 <.LVL135>:
    b758:	010f1f13          	sll	t5,t5,0x10

0000b75c <.LBB35>:
    b75c:	02012883          	lw	a7,32(sp)

0000b760 <.LBB74>:
    b760:	00ef6f33          	or	t5,t5,a4

0000b764 <.LBB36>:
    b764:	010f5293          	srl	t0,t5,0x10
    b768:	01df7733          	and	a4,t5,t4

0000b76c <.LVL137>:
    b76c:	02e88e33          	mul	t3,a7,a4

0000b770 <.LBB76>:
    b770:	01ea2623          	sw	t5,12(s4)

0000b774 <.LBB37>:
    b774:	031284b3          	mul	s1,t0,a7

0000b778 <.LVL140>:
    b778:	00812883          	lw	a7,8(sp)
    b77c:	010e5993          	srl	s3,t3,0x10
    b780:	031283b3          	mul	t2,t0,a7

0000b784 <.LVL141>:
    b784:	02e888b3          	mul	a7,a7,a4

0000b788 <.LVL142>:
    b788:	009888b3          	add	a7,a7,s1

0000b78c <.LVL143>:
    b78c:	011988b3          	add	a7,s3,a7

0000b790 <.LVL144>:
    b790:	0098f463          	bgeu	a7,s1,b798 <.L73>
    b794:	01b383b3          	add	t2,t2,s11

0000b798 <.L73>:
    b798:	0108d493          	srl	s1,a7,0x10

0000b79c <.LVL146>:
    b79c:	01d8f8b3          	and	a7,a7,t4

0000b7a0 <.LVL147>:
    b7a0:	01de7e33          	and	t3,t3,t4

0000b7a4 <.LVL148>:
    b7a4:	01089893          	sll	a7,a7,0x10
    b7a8:	01c888b3          	add	a7,a7,t3

0000b7ac <.LBB38>:
    b7ac:	01412e03          	lw	t3,20(sp)

0000b7b0 <.LBB39>:
    b7b0:	007484b3          	add	s1,s1,t2

0000b7b4 <.LBB40>:
    b7b4:	02ee09b3          	mul	s3,t3,a4

0000b7b8 <.LVL150>:
    b7b8:	03c283b3          	mul	t2,t0,t3

0000b7bc <.LVL151>:
    b7bc:	00c12e03          	lw	t3,12(sp)
    b7c0:	0109db13          	srl	s6,s3,0x10
    b7c4:	03c28ab3          	mul	s5,t0,t3

0000b7c8 <.LVL152>:
    b7c8:	02ee0e33          	mul	t3,t3,a4

0000b7cc <.LVL153>:
    b7cc:	007e0e33          	add	t3,t3,t2

0000b7d0 <.LVL154>:
    b7d0:	01cb0e33          	add	t3,s6,t3

0000b7d4 <.LVL155>:
    b7d4:	007e7463          	bgeu	t3,t2,b7dc <.L74>
    b7d8:	01ba8ab3          	add	s5,s5,s11

0000b7dc <.L74>:
    b7dc:	01de73b3          	and	t2,t3,t4
    b7e0:	01d9f9b3          	and	s3,s3,t4

0000b7e4 <.LVL157>:
    b7e4:	01039393          	sll	t2,t2,0x10
    b7e8:	013383b3          	add	t2,t2,s3
    b7ec:	007483b3          	add	t2,s1,t2

0000b7f0 <.LBB43>:
    b7f0:	01812983          	lw	s3,24(sp)

0000b7f4 <.LBB45>:
    b7f4:	0093b4b3          	sltu	s1,t2,s1

0000b7f8 <.LBB46>:
    b7f8:	010e5e13          	srl	t3,t3,0x10

0000b7fc <.LBB47>:
    b7fc:	009e0e33          	add	t3,t3,s1
    b800:	015e0e33          	add	t3,t3,s5

0000b804 <.LBB48>:
    b804:	03328ab3          	mul	s5,t0,s3

0000b808 <.LVL162>:
    b808:	01012983          	lw	s3,16(sp)
    b80c:	01812483          	lw	s1,24(sp)
    b810:	033289b3          	mul	s3,t0,s3
    b814:	01012283          	lw	t0,16(sp)

0000b818 <.LVL163>:
    b818:	02e484b3          	mul	s1,s1,a4

0000b81c <.LVL164>:
    b81c:	02e28733          	mul	a4,t0,a4

0000b820 <.LVL165>:
    b820:	0104d293          	srl	t0,s1,0x10
    b824:	01570733          	add	a4,a4,s5

0000b828 <.LVL166>:
    b828:	00e28733          	add	a4,t0,a4

0000b82c <.LVL167>:
    b82c:	01577463          	bgeu	a4,s5,b834 <.L77>
    b830:	01b989b3          	add	s3,s3,s11

0000b834 <.L77>:
    b834:	01d772b3          	and	t0,a4,t4
    b838:	01029293          	sll	t0,t0,0x10
    b83c:	01d4f4b3          	and	s1,s1,t4

0000b840 <.LVL169>:
    b840:	009282b3          	add	t0,t0,s1
    b844:	005e02b3          	add	t0,t3,t0

0000b848 <.LBB51>:
    b848:	01075713          	srl	a4,a4,0x10

0000b84c <.LBB53>:
    b84c:	01c2be33          	sltu	t3,t0,t3

0000b850 <.LVL172>:
    b850:	01c70733          	add	a4,a4,t3
    b854:	01370733          	add	a4,a4,s3

0000b858 <.LBE53>:
    b858:	00cc2983          	lw	s3,12(s8)

0000b85c <.LVL174>:
    b85c:	00e7ee63          	bltu	a5,a4,b878 <.L80>
    b860:	0ef71463          	bne	a4,a5,b948 <.L81>
    b864:	00566a63          	bltu	a2,t0,b878 <.L80>
    b868:	0e561063          	bne	a2,t0,b948 <.L81>
    b86c:	0075e663          	bltu	a1,t2,b878 <.L80>
    b870:	0c759c63          	bne	a1,t2,b948 <.L81>
    b874:	0d19fa63          	bgeu	s3,a7,b948 <.L81>

0000b878 <.L80>:
    b878:	ffff0e13          	add	t3,t5,-1
    b87c:	01380ab3          	add	s5,a6,s3

0000b880 <.LVL175>:
    b880:	00b30b33          	add	s6,t1,a1

0000b884 <.LVL176>:
    b884:	01ca2623          	sw	t3,12(s4)

0000b888 <.LBB78>:
    b888:	010abe33          	sltu	t3,s5,a6
    b88c:	01cb04b3          	add	s1,s6,t3
    b890:	03c12623          	sw	t3,44(sp)
    b894:	006b3e33          	sltu	t3,s6,t1
    b898:	0164bb33          	sltu	s6,s1,s6
    b89c:	00cf8bb3          	add	s7,t6,a2
    b8a0:	016e6e33          	or	t3,t3,s6
    b8a4:	01cb8e33          	add	t3,s7,t3
    b8a8:	01fbbb33          	sltu	s6,s7,t6
    b8ac:	017e3bb3          	sltu	s7,t3,s7
    b8b0:	017b6b33          	or	s6,s6,s7
    b8b4:	00ab0b33          	add	s6,s6,a0
    b8b8:	016787b3          	add	a5,a5,s6

0000b8bc <.LVL177>:
    b8bc:	000a8993          	mv	s3,s5

0000b8c0 <.LVL178>:
    b8c0:	00048593          	mv	a1,s1
    b8c4:	000e0613          	mv	a2,t3

0000b8c8 <.LBE78>:
    b8c8:	02f56063          	bltu	a0,a5,b8e8 <.L92>
    b8cc:	06f51e63          	bne	a0,a5,b948 <.L81>
    b8d0:	01cfec63          	bltu	t6,t3,b8e8 <.L92>
    b8d4:	07cf9a63          	bne	t6,t3,b948 <.L81>
    b8d8:	00936863          	bltu	t1,s1,b8e8 <.L92>
    b8dc:	06931663          	bne	t1,s1,b948 <.L81>
    b8e0:	010abb33          	sltu	s6,s5,a6
    b8e4:	060b1263          	bnez	s6,b948 <.L81>

0000b8e8 <.L92>:
    b8e8:	00e7ee63          	bltu	a5,a4,b904 <.L93>
    b8ec:	04f71e63          	bne	a4,a5,b948 <.L81>
    b8f0:	005e6a63          	bltu	t3,t0,b904 <.L93>
    b8f4:	045e1a63          	bne	t3,t0,b948 <.L81>
    b8f8:	0074e663          	bltu	s1,t2,b904 <.L93>
    b8fc:	04749663          	bne	s1,t2,b948 <.L81>
    b900:	051af463          	bgeu	s5,a7,b948 <.L81>

0000b904 <.L93>:
    b904:	01580ab3          	add	s5,a6,s5
    b908:	009304b3          	add	s1,t1,s1

0000b90c <.LBB79>:
    b90c:	010ab5b3          	sltu	a1,s5,a6
    b910:	00b485b3          	add	a1,s1,a1
    b914:	0064b633          	sltu	a2,s1,t1
    b918:	0095b4b3          	sltu	s1,a1,s1
    b91c:	01cf8e33          	add	t3,t6,t3
    b920:	00966633          	or	a2,a2,s1

0000b924 <.LBE79>:
    b924:	ffef0f13          	add	t5,t5,-2

0000b928 <.LVL180>:
    b928:	00ce0633          	add	a2,t3,a2
    b92c:	01ea2623          	sw	t5,12(s4)

0000b930 <.LBB80>:
    b930:	01fe3f33          	sltu	t5,t3,t6

0000b934 <.LVL182>:
    b934:	01c63e33          	sltu	t3,a2,t3
    b938:	01cf6f33          	or	t5,t5,t3
    b93c:	00af0f33          	add	t5,t5,a0
    b940:	000a8993          	mv	s3,s5

0000b944 <.LVL183>:
    b944:	01e787b3          	add	a5,a5,t5

0000b948 <.L81>:
    b948:	41198ab3          	sub	s5,s3,a7
    b94c:	407584b3          	sub	s1,a1,t2
    b950:	0159be33          	sltu	t3,s3,s5
    b954:	0095bb33          	sltu	s6,a1,s1
    b958:	000a8f13          	mv	t5,s5

0000b95c <.LVL185>:
    b95c:	41c48e33          	sub	t3,s1,t3

0000b960 <.LVL186>:
    b960:	00000593          	li	a1,0

0000b964 <.LVL187>:
    b964:	0159f463          	bgeu	s3,s5,b96c <.L108>
    b968:	0014b593          	seqz	a1,s1

0000b96c <.L108>:
    b96c:	0165e5b3          	or	a1,a1,s6

0000b970 <.LVL188>:
    b970:	40560b33          	sub	s6,a2,t0

0000b974 <.LVL189>:
    b974:	01663633          	sltu	a2,a2,s6

0000b978 <.LVL190>:
    b978:	40bb04b3          	sub	s1,s6,a1

0000b97c <.LVL191>:
    b97c:	00000993          	li	s3,0

0000b980 <.LVL192>:
    b980:	00058463          	beqz	a1,b988 <.L111>
    b984:	001b3993          	seqz	s3,s6

0000b988 <.L111>:
    b988:	40e787b3          	sub	a5,a5,a4

0000b98c <.LVL194>:
    b98c:	00c9e9b3          	or	s3,s3,a2

0000b990 <.LVL195>:
    b990:	413787b3          	sub	a5,a5,s3

0000b994 <.LBE81>:
    b994:	d00c9ee3          	bnez	s9,b6b0 <.L56>
    b998:	01589863          	bne	a7,s5,b9a8 <.L112>
    b99c:	007e1663          	bne	t3,t2,b9a8 <.L112>
    b9a0:	00549463          	bne	s1,t0,b9a8 <.L112>
    b9a4:	00f70863          	beq	a4,a5,b9b4 <.L114>

0000b9a8 <.L112>:
    b9a8:	05012783          	lw	a5,80(sp)
    b9ac:	0017e793          	or	a5,a5,1
    b9b0:	04f12823          	sw	a5,80(sp)

0000b9b4 <.L114>:
  FP_PACK_Q (r, R);
    b9b4:	000047b7          	lui	a5,0x4
    b9b8:	fff78793          	add	a5,a5,-1 # 3fff <_dl_aux_init+0x3>
    b9bc:	00f687b3          	add	a5,a3,a5

0000b9c0 <.LVL197>:
    b9c0:	1af05463          	blez	a5,bb68 <.L116>
    b9c4:	05012703          	lw	a4,80(sp)
    b9c8:	00777613          	and	a2,a4,7
    b9cc:	04060463          	beqz	a2,ba14 <.L117>
    b9d0:	00f77613          	and	a2,a4,15
    b9d4:	00400593          	li	a1,4
    b9d8:	02b60e63          	beq	a2,a1,ba14 <.L117>

0000b9dc <.LBB83>:
    b9dc:	00470713          	add	a4,a4,4
    b9e0:	00473613          	sltiu	a2,a4,4
    b9e4:	04e12823          	sw	a4,80(sp)

0000b9e8 <.LVL198>:
    b9e8:	05412703          	lw	a4,84(sp)

0000b9ec <.LVL199>:
    b9ec:	00e60733          	add	a4,a2,a4
    b9f0:	04e12a23          	sw	a4,84(sp)

0000b9f4 <.LVL200>:
    b9f4:	00c73733          	sltu	a4,a4,a2

0000b9f8 <.LVL201>:
    b9f8:	05812603          	lw	a2,88(sp)
    b9fc:	00e60733          	add	a4,a2,a4

0000ba00 <.LVL202>:
    ba00:	04e12c23          	sw	a4,88(sp)

0000ba04 <.LVL203>:
    ba04:	00c73733          	sltu	a4,a4,a2

0000ba08 <.LVL204>:
    ba08:	05c12603          	lw	a2,92(sp)
    ba0c:	00c70733          	add	a4,a4,a2

0000ba10 <.LVL205>:
    ba10:	04e12e23          	sw	a4,92(sp)

0000ba14 <.L117>:
    ba14:	05c12703          	lw	a4,92(sp)
    ba18:	00b71613          	sll	a2,a4,0xb
    ba1c:	00065e63          	bgez	a2,ba38 <.L122>
    ba20:	fff007b7          	lui	a5,0xfff00

0000ba24 <.LVL207>:
    ba24:	fff78793          	add	a5,a5,-1 # ffefffff <_ebss+0xffeea10f>
    ba28:	00f77733          	and	a4,a4,a5
    ba2c:	000047b7          	lui	a5,0x4

0000ba30 <.LVL208>:
    ba30:	04e12e23          	sw	a4,92(sp)
    ba34:	00f687b3          	add	a5,a3,a5

0000ba38 <.L122>:
    ba38:	05010713          	add	a4,sp,80
    ba3c:	05c10593          	add	a1,sp,92

0000ba40 <.L123>:
    ba40:	00072683          	lw	a3,0(a4)
    ba44:	00472603          	lw	a2,4(a4)
    ba48:	00470713          	add	a4,a4,4
    ba4c:	0036d693          	srl	a3,a3,0x3
    ba50:	01d61613          	sll	a2,a2,0x1d
    ba54:	00c6e6b3          	or	a3,a3,a2
    ba58:	fed72e23          	sw	a3,-4(a4)
    ba5c:	feb712e3          	bne	a4,a1,ba40 <.L123>

0000ba60 <.LBE84>:
    ba60:	000086b7          	lui	a3,0x8
    ba64:	ffe68693          	add	a3,a3,-2 # 7ffe <__kernel_rem_pio2+0x5e>

0000ba68 <.LBB85>:
    ba68:	05c12703          	lw	a4,92(sp)

0000ba6c <.LBE85>:
    ba6c:	0af6ce63          	blt	a3,a5,bb28 <.L39>

0000ba70 <.LBB86>:
    ba70:	00375713          	srl	a4,a4,0x3
    ba74:	04e12e23          	sw	a4,92(sp)

0000ba78 <.L125>:
    ba78:	00f91913          	sll	s2,s2,0xf

0000ba7c <.LVL213>:
    ba7c:	00f96933          	or	s2,s2,a5

0000ba80 <.LBE87>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    ba80:	05012783          	lw	a5,80(sp)

0000ba84 <.LBB88>:
  FP_PACK_Q (r, R);
    ba84:	05c12703          	lw	a4,92(sp)
    ba88:	07211723          	sh	s2,110(sp)

0000ba8c <.LBE88>:
  return r;
    ba8c:	00f42023          	sw	a5,0(s0)
    ba90:	05412783          	lw	a5,84(sp)

0000ba94 <.LBB89>:
  FP_PACK_Q (r, R);
    ba94:	06e11623          	sh	a4,108(sp)

0000ba98 <.LBE89>:
}
    ba98:	0ac12083          	lw	ra,172(sp)
  return r;
    ba9c:	00f42223          	sw	a5,4(s0)
    baa0:	05812783          	lw	a5,88(sp)

0000baa4 <.LVL216>:
}
    baa4:	00040513          	mv	a0,s0
    baa8:	0a412483          	lw	s1,164(sp)
  return r;
    baac:	00f42423          	sw	a5,8(s0)
    bab0:	06c12783          	lw	a5,108(sp)
}
    bab4:	0a012903          	lw	s2,160(sp)
    bab8:	09c12983          	lw	s3,156(sp)
  return r;
    babc:	00f42623          	sw	a5,12(s0)
}
    bac0:	0a812403          	lw	s0,168(sp)
    bac4:	09812a03          	lw	s4,152(sp)
    bac8:	09412a83          	lw	s5,148(sp)
    bacc:	09012b03          	lw	s6,144(sp)
    bad0:	08c12b83          	lw	s7,140(sp)
    bad4:	08812c03          	lw	s8,136(sp)
    bad8:	08412c83          	lw	s9,132(sp)
    badc:	08012d03          	lw	s10,128(sp)
    bae0:	07c12d83          	lw	s11,124(sp)
    bae4:	0b010113          	add	sp,sp,176

0000bae8 <.LVL218>:
    bae8:	00008067          	ret

0000baec <.L37>:
  FP_DIV_Q (R, A, B);
    baec:	03012783          	lw	a5,48(sp)

0000baf0 <.LBB90>:
  FP_UNPACK_Q (A, a);
    baf0:	00098913          	mv	s2,s3

0000baf4 <.LBE90>:
  FP_DIV_Q (R, A, B);
    baf4:	000a0713          	mv	a4,s4

0000baf8 <.LVL221>:
    baf8:	04f12823          	sw	a5,80(sp)
    bafc:	03412783          	lw	a5,52(sp)
    bb00:	04f12a23          	sw	a5,84(sp)
    bb04:	03812783          	lw	a5,56(sp)
    bb08:	04f12c23          	sw	a5,88(sp)
    bb0c:	03c12783          	lw	a5,60(sp)

0000bb10 <.L115>:
    bb10:	04f12e23          	sw	a5,92(sp)

0000bb14 <.LVL223>:
  FP_PACK_Q (r, R);
    bb14:	00100793          	li	a5,1
    bb18:	24f70863          	beq	a4,a5,bd68 <.L195>
    bb1c:	e8070ce3          	beqz	a4,b9b4 <.L114>
    bb20:	00200793          	li	a5,2
    bb24:	24f71c63          	bne	a4,a5,bd7c <.L35>

0000bb28 <.L39>:
    bb28:	000087b7          	lui	a5,0x8
    bb2c:	04012e23          	sw	zero,92(sp)
    bb30:	04012c23          	sw	zero,88(sp)
    bb34:	04012a23          	sw	zero,84(sp)
    bb38:	04012823          	sw	zero,80(sp)
    bb3c:	fff78793          	add	a5,a5,-1 # 7fff <__kernel_rem_pio2+0x5f>
    bb40:	f39ff06f          	j	ba78 <.L125>

0000bb44 <.L38>:
  FP_DIV_Q (R, A, B);
    bb44:	04012783          	lw	a5,64(sp)

0000bb48 <.LBB91>:
  FP_UNPACK_Q (B, b);
    bb48:	000a8913          	mv	s2,s5

0000bb4c <.LBE91>:
  FP_DIV_Q (R, A, B);
    bb4c:	04f12823          	sw	a5,80(sp)
    bb50:	04412783          	lw	a5,68(sp)
    bb54:	04f12a23          	sw	a5,84(sp)
    bb58:	04812783          	lw	a5,72(sp)
    bb5c:	04f12c23          	sw	a5,88(sp)
    bb60:	04c12783          	lw	a5,76(sp)

0000bb64 <.LVL227>:
    bb64:	fadff06f          	j	bb10 <.L115>

0000bb68 <.L116>:
  FP_PACK_Q (r, R);
    bb68:	00100693          	li	a3,1
    bb6c:	40f686b3          	sub	a3,a3,a5

0000bb70 <.LVL229>:
    bb70:	07400793          	li	a5,116
    bb74:	1cd7ca63          	blt	a5,a3,bd48 <.L126>

0000bb78 <.LBB93>:
    bb78:	05010613          	add	a2,sp,80
    bb7c:	4056d713          	sra	a4,a3,0x5

0000bb80 <.LVL230>:
    bb80:	00060513          	mv	a0,a2
    bb84:	01f6f693          	and	a3,a3,31

0000bb88 <.LVL231>:
    bb88:	00000793          	li	a5,0
    bb8c:	00000593          	li	a1,0

0000bb90 <.L127>:
    bb90:	02e59e63          	bne	a1,a4,bbcc <.L128>
    bb94:	00300593          	li	a1,3

0000bb98 <.LVL233>:
    bb98:	40e585b3          	sub	a1,a1,a4
    bb9c:	00271513          	sll	a0,a4,0x2
    bba0:	04069063          	bnez	a3,bbe0 <.L129>
    bba4:	00060813          	mv	a6,a2

0000bba8 <.L130>:
    bba8:	00a808b3          	add	a7,a6,a0
    bbac:	0008a883          	lw	a7,0(a7) # 10000 <.LVL314+0x8>
    bbb0:	00168693          	add	a3,a3,1

0000bbb4 <.LVL235>:
    bbb4:	00480813          	add	a6,a6,4
    bbb8:	ff182e23          	sw	a7,-4(a6)

0000bbbc <.LVL236>:
    bbbc:	fed5d6e3          	bge	a1,a3,bba8 <.L130>
    bbc0:	00400693          	li	a3,4

0000bbc4 <.LVL237>:
    bbc4:	40e68733          	sub	a4,a3,a4

0000bbc8 <.LVL238>:
    bbc8:	06c0006f          	j	bc34 <.L134>

0000bbcc <.L128>:
    bbcc:	00052803          	lw	a6,0(a0)
    bbd0:	00158593          	add	a1,a1,1

0000bbd4 <.LVL240>:
    bbd4:	00450513          	add	a0,a0,4
    bbd8:	0107e7b3          	or	a5,a5,a6

0000bbdc <.LVL241>:
    bbdc:	fb5ff06f          	j	bb90 <.L127>

0000bbe0 <.L129>:
    bbe0:	04050813          	add	a6,a0,64
    bbe4:	03010893          	add	a7,sp,48
    bbe8:	01180833          	add	a6,a6,a7
    bbec:	fe082803          	lw	a6,-32(a6)
    bbf0:	02000313          	li	t1,32
    bbf4:	40d30333          	sub	t1,t1,a3
    bbf8:	00681833          	sll	a6,a6,t1
    bbfc:	0107e7b3          	or	a5,a5,a6

0000bc00 <.LVL243>:
    bc00:	00000e13          	li	t3,0
    bc04:	00a60833          	add	a6,a2,a0
    bc08:	40a00533          	neg	a0,a0

0000bc0c <.L132>:
    bc0c:	0ebe4063          	blt	t3,a1,bcec <.L133>
    bc10:	00400513          	li	a0,4
    bc14:	00259593          	sll	a1,a1,0x2
    bc18:	40e50733          	sub	a4,a0,a4

0000bc1c <.LVL245>:
    bc1c:	04058593          	add	a1,a1,64
    bc20:	03010513          	add	a0,sp,48
    bc24:	00a585b3          	add	a1,a1,a0
    bc28:	05c12503          	lw	a0,92(sp)
    bc2c:	00d556b3          	srl	a3,a0,a3

0000bc30 <.LVL246>:
    bc30:	fed5a023          	sw	a3,-32(a1)

0000bc34 <.L134>:
    bc34:	00400693          	li	a3,4
    bc38:	40e686b3          	sub	a3,a3,a4
    bc3c:	00269693          	sll	a3,a3,0x2
    bc40:	00271713          	sll	a4,a4,0x2
    bc44:	00800593          	li	a1,8
    bc48:	00e60733          	add	a4,a2,a4
    bc4c:	00b6ea63          	bltu	a3,a1,bc60 <.L135>
    bc50:	00072023          	sw	zero,0(a4)
    bc54:	00072223          	sw	zero,4(a4)
    bc58:	ff868693          	add	a3,a3,-8
    bc5c:	00870713          	add	a4,a4,8

0000bc60 <.L135>:
    bc60:	00400593          	li	a1,4
    bc64:	00b6e463          	bltu	a3,a1,bc6c <.L136>
    bc68:	00072023          	sw	zero,0(a4)

0000bc6c <.L136>:
    bc6c:	05012703          	lw	a4,80(sp)

0000bc70 <.LBB95>:
    bc70:	00f037b3          	snez	a5,a5

0000bc74 <.LBE95>:
    bc74:	00e7e7b3          	or	a5,a5,a4
    bc78:	04f12823          	sw	a5,80(sp)

0000bc7c <.LBE93>:
    bc7c:	0077f713          	and	a4,a5,7
    bc80:	04070463          	beqz	a4,bcc8 <.L137>
    bc84:	00f7f713          	and	a4,a5,15
    bc88:	00400693          	li	a3,4
    bc8c:	02d70e63          	beq	a4,a3,bcc8 <.L137>

0000bc90 <.LBB97>:
    bc90:	05412703          	lw	a4,84(sp)
    bc94:	00478793          	add	a5,a5,4
    bc98:	04f12823          	sw	a5,80(sp)

0000bc9c <.LVL249>:
    bc9c:	0047b793          	sltiu	a5,a5,4

0000bca0 <.LVL250>:
    bca0:	00f707b3          	add	a5,a4,a5
    bca4:	04f12a23          	sw	a5,84(sp)

0000bca8 <.LVL251>:
    bca8:	00e7b7b3          	sltu	a5,a5,a4

0000bcac <.LVL252>:
    bcac:	05812703          	lw	a4,88(sp)
    bcb0:	00f707b3          	add	a5,a4,a5

0000bcb4 <.LVL253>:
    bcb4:	04f12c23          	sw	a5,88(sp)

0000bcb8 <.LVL254>:
    bcb8:	00e7b7b3          	sltu	a5,a5,a4

0000bcbc <.LVL255>:
    bcbc:	05c12703          	lw	a4,92(sp)
    bcc0:	00e787b3          	add	a5,a5,a4

0000bcc4 <.LVL256>:
    bcc4:	04f12e23          	sw	a5,92(sp)

0000bcc8 <.L137>:
    bcc8:	05c12703          	lw	a4,92(sp)
    bccc:	00c71793          	sll	a5,a4,0xc
    bcd0:	0407d263          	bgez	a5,bd14 <.L142>

0000bcd4 <.LVL258>:
    bcd4:	04012e23          	sw	zero,92(sp)
    bcd8:	04012c23          	sw	zero,88(sp)
    bcdc:	04012a23          	sw	zero,84(sp)
    bce0:	04012823          	sw	zero,80(sp)
    bce4:	00100793          	li	a5,1
    bce8:	d91ff06f          	j	ba78 <.L125>

0000bcec <.L133>:
    bcec:	00082883          	lw	a7,0(a6)
    bcf0:	00482e83          	lw	t4,4(a6)
    bcf4:	00a80f33          	add	t5,a6,a0
    bcf8:	00d8d8b3          	srl	a7,a7,a3
    bcfc:	006e9eb3          	sll	t4,t4,t1
    bd00:	01d8e8b3          	or	a7,a7,t4
    bd04:	011f2023          	sw	a7,0(t5)

0000bd08 <.LVL260>:
    bd08:	001e0e13          	add	t3,t3,1

0000bd0c <.LVL261>:
    bd0c:	00480813          	add	a6,a6,4
    bd10:	efdff06f          	j	bc0c <.L132>

0000bd14 <.L142>:
    bd14:	00c60593          	add	a1,a2,12

0000bd18 <.L143>:
    bd18:	00062783          	lw	a5,0(a2)
    bd1c:	00462683          	lw	a3,4(a2)
    bd20:	00460613          	add	a2,a2,4
    bd24:	0037d793          	srl	a5,a5,0x3
    bd28:	01d69693          	sll	a3,a3,0x1d
    bd2c:	00d7e7b3          	or	a5,a5,a3
    bd30:	fef62e23          	sw	a5,-4(a2)
    bd34:	fec592e3          	bne	a1,a2,bd18 <.L143>

0000bd38 <.LVL264>:
    bd38:	00375713          	srl	a4,a4,0x3
    bd3c:	04e12e23          	sw	a4,92(sp)

0000bd40 <.L144>:
    bd40:	00000793          	li	a5,0
    bd44:	d35ff06f          	j	ba78 <.L125>

0000bd48 <.L126>:
    bd48:	05412703          	lw	a4,84(sp)
    bd4c:	05012783          	lw	a5,80(sp)
    bd50:	00e7e7b3          	or	a5,a5,a4
    bd54:	05812703          	lw	a4,88(sp)
    bd58:	00e7e7b3          	or	a5,a5,a4
    bd5c:	05c12703          	lw	a4,92(sp)
    bd60:	00e7e7b3          	or	a5,a5,a4
    bd64:	fc078ee3          	beqz	a5,bd40 <.L144>

0000bd68 <.L195>:
    bd68:	04012e23          	sw	zero,92(sp)
    bd6c:	04012c23          	sw	zero,88(sp)
    bd70:	04012a23          	sw	zero,84(sp)

0000bd74 <.LBB100>:
    bd74:	04012823          	sw	zero,80(sp)
    bd78:	fc9ff06f          	j	bd40 <.L144>

0000bd7c <.L35>:
    bd7c:	000087b7          	lui	a5,0x8
    bd80:	04f12e23          	sw	a5,92(sp)
    bd84:	04012c23          	sw	zero,88(sp)
    bd88:	04012a23          	sw	zero,84(sp)
    bd8c:	04012823          	sw	zero,80(sp)

0000bd90 <.LVL270>:
    bd90:	fff78793          	add	a5,a5,-1 # 7fff <__kernel_rem_pio2+0x5f>
    bd94:	00000913          	li	s2,0
    bd98:	ce1ff06f          	j	ba78 <.L125>

0000bd9c <__eqtf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__eqtf2 (TFtype a, TFtype b)
{
    bd9c:	00c52783          	lw	a5,12(a0)
    bda0:	0005af03          	lw	t5,0(a1)
    bda4:	0045af83          	lw	t6,4(a1)
    bda8:	0085a283          	lw	t0,8(a1)
    bdac:	00c5a583          	lw	a1,12(a1)

0000bdb0 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    bdb0:	00008737          	lui	a4,0x8
    bdb4:	0107d693          	srl	a3,a5,0x10
    bdb8:	fff70713          	add	a4,a4,-1 # 7fff <__kernel_rem_pio2+0x5f>
    bdbc:	01079813          	sll	a6,a5,0x10

0000bdc0 <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    bdc0:	01059e93          	sll	t4,a1,0x10

0000bdc4 <.LBB5>:
  FP_UNPACK_RAW_Q (A, a);
    bdc4:	01f7d613          	srl	a2,a5,0x1f
    bdc8:	00e6f6b3          	and	a3,a3,a4

0000bdcc <.LBB6>:
  FP_UNPACK_RAW_Q (B, b);
    bdcc:	0105d793          	srl	a5,a1,0x10

0000bdd0 <.LBE6>:
{
    bdd0:	00052883          	lw	a7,0(a0)

0000bdd4 <.LBB7>:
    bdd4:	00452303          	lw	t1,4(a0)

0000bdd8 <.LBB8>:
    bdd8:	00852e03          	lw	t3,8(a0)

0000bddc <.LBB9>:
    bddc:	ff010113          	add	sp,sp,-16

0000bde0 <.LBB10>:
  FP_UNPACK_RAW_Q (A, a);
    bde0:	01085813          	srl	a6,a6,0x10

0000bde4 <.LBB11>:
  FP_UNPACK_RAW_Q (B, b);
    bde4:	010ede93          	srl	t4,t4,0x10

0000bde8 <.LVL5>:
    bde8:	00e7f7b3          	and	a5,a5,a4
    bdec:	01f5d593          	srl	a1,a1,0x1f

0000bdf0 <.LBE11>:
  FP_CMP_EQ_Q (r, A, B, 1);
    bdf0:	02e69063          	bne	a3,a4,be10 <.L2>
    bdf4:	0068e733          	or	a4,a7,t1
    bdf8:	01c76733          	or	a4,a4,t3
    bdfc:	01076733          	or	a4,a4,a6
    be00:	00100513          	li	a0,1
    be04:	04071a63          	bnez	a4,be58 <.L1>
    be08:	04d79863          	bne	a5,a3,be58 <.L1>
    be0c:	0080006f          	j	be14 <.L6>

0000be10 <.L2>:
    be10:	00e79c63          	bne	a5,a4,be28 <.L5>

0000be14 <.L6>:
    be14:	01ff6733          	or	a4,t5,t6
    be18:	00576733          	or	a4,a4,t0
    be1c:	01d76733          	or	a4,a4,t4
    be20:	00100513          	li	a0,1
    be24:	02071a63          	bnez	a4,be58 <.L1>

0000be28 <.L5>:
    be28:	00100513          	li	a0,1
    be2c:	02d79663          	bne	a5,a3,be58 <.L1>
    be30:	03e89463          	bne	a7,t5,be58 <.L1>
    be34:	03f31263          	bne	t1,t6,be58 <.L1>
    be38:	025e1063          	bne	t3,t0,be58 <.L1>
    be3c:	01d81e63          	bne	a6,t4,be58 <.L1>
    be40:	02b60063          	beq	a2,a1,be60 <.L14>
    be44:	00079a63          	bnez	a5,be58 <.L1>
    be48:	0068e533          	or	a0,a7,t1
    be4c:	01c56533          	or	a0,a0,t3
    be50:	01056533          	or	a0,a0,a6
    be54:	00a03533          	snez	a0,a0

0000be58 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    be58:	01010113          	add	sp,sp,16
    be5c:	00008067          	ret

0000be60 <.L14>:
  FP_CMP_EQ_Q (r, A, B, 1);
    be60:	00000513          	li	a0,0
    be64:	ff5ff06f          	j	be58 <.L1>

0000be68 <__getf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__getf2 (TFtype a, TFtype b)
{
    be68:	00c52783          	lw	a5,12(a0)
    be6c:	00c5a683          	lw	a3,12(a1)

0000be70 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    be70:	00008737          	lui	a4,0x8
    be74:	0107d613          	srl	a2,a5,0x10
    be78:	fff70713          	add	a4,a4,-1 # 7fff <__kernel_rem_pio2+0x5f>
    be7c:	01079813          	sll	a6,a5,0x10

0000be80 <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    be80:	01069293          	sll	t0,a3,0x10

0000be84 <.LBE4>:
{
    be84:	00052883          	lw	a7,0(a0)

0000be88 <.LBB5>:
    be88:	00452303          	lw	t1,4(a0)

0000be8c <.LBB6>:
    be8c:	00852e03          	lw	t3,8(a0)

0000be90 <.LBB7>:
  FP_UNPACK_RAW_Q (A, a);
    be90:	00e67633          	and	a2,a2,a4

0000be94 <.LBB8>:
  FP_UNPACK_RAW_Q (B, b);
    be94:	0106d513          	srl	a0,a3,0x10

0000be98 <.LBE8>:
{
    be98:	0005ae83          	lw	t4,0(a1)
    be9c:	0045af03          	lw	t5,4(a1)
    bea0:	0085af83          	lw	t6,8(a1)
    bea4:	ff010113          	add	sp,sp,-16

0000bea8 <.LBB9>:
  FP_UNPACK_RAW_Q (A, a);
    bea8:	01085813          	srl	a6,a6,0x10

0000beac <.LVL4>:
    beac:	01f7d793          	srl	a5,a5,0x1f

0000beb0 <.LBB10>:
  FP_UNPACK_RAW_Q (B, b);
    beb0:	0102d293          	srl	t0,t0,0x10

0000beb4 <.LVL6>:
    beb4:	00e57533          	and	a0,a0,a4

0000beb8 <.LVL7>:
    beb8:	01f6d693          	srl	a3,a3,0x1f

0000bebc <.LBE10>:
  FP_CMP_Q (r, A, B, -2, 2);
    bebc:	00e61a63          	bne	a2,a4,bed0 <.L2>
    bec0:	01136733          	or	a4,t1,a7
    bec4:	01c76733          	or	a4,a4,t3
    bec8:	01076733          	or	a4,a4,a6
    becc:	0a071463          	bnez	a4,bf74 <.L17>

0000bed0 <.L2>:
    bed0:	00008737          	lui	a4,0x8
    bed4:	fff70713          	add	a4,a4,-1 # 7fff <__kernel_rem_pio2+0x5f>
    bed8:	00e51a63          	bne	a0,a4,beec <.L4>
    bedc:	01eee733          	or	a4,t4,t5
    bee0:	01f76733          	or	a4,a4,t6
    bee4:	00576733          	or	a4,a4,t0
    bee8:	08071663          	bnez	a4,bf74 <.L17>

0000beec <.L4>:
    beec:	00000713          	li	a4,0
    bef0:	00061a63          	bnez	a2,bf04 <.L5>
    bef4:	01136733          	or	a4,t1,a7
    bef8:	01c76733          	or	a4,a4,t3
    befc:	01076733          	or	a4,a4,a6
    bf00:	00173713          	seqz	a4,a4

0000bf04 <.L5>:
    bf04:	06051c63          	bnez	a0,bf7c <.L6>
    bf08:	01eee5b3          	or	a1,t4,t5
    bf0c:	01f5e5b3          	or	a1,a1,t6
    bf10:	0055e5b3          	or	a1,a1,t0

0000bf14 <.LVL10>:
    bf14:	00070c63          	beqz	a4,bf2c <.L7>
    bf18:	02058063          	beqz	a1,bf38 <.L1>

0000bf1c <.L39>:
    bf1c:	00100513          	li	a0,1

0000bf20 <.LVL12>:
    bf20:	00069c63          	bnez	a3,bf38 <.L1>

0000bf24 <.L35>:
    bf24:	fff00513          	li	a0,-1
    bf28:	0100006f          	j	bf38 <.L1>

0000bf2c <.L7>:
    bf2c:	04059a63          	bnez	a1,bf80 <.L8>

0000bf30 <.L12>:
    bf30:	fff00513          	li	a0,-1

0000bf34 <.LVL15>:
    bf34:	04078e63          	beqz	a5,bf90 <.L34>

0000bf38 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    bf38:	01010113          	add	sp,sp,16
    bf3c:	00008067          	ret

0000bf40 <.L10>:
  FP_CMP_Q (r, A, B, -2, 2);
    bf40:	fca64ee3          	blt	a2,a0,bf1c <.L39>
    bf44:	ff02e6e3          	bltu	t0,a6,bf30 <.L12>
    bf48:	02581063          	bne	a6,t0,bf68 <.L13>
    bf4c:	ffcfe2e3          	bltu	t6,t3,bf30 <.L12>
    bf50:	01fe1c63          	bne	t3,t6,bf68 <.L13>
    bf54:	fc6f6ee3          	bltu	t5,t1,bf30 <.L12>
    bf58:	01e31863          	bne	t1,t5,bf68 <.L13>
    bf5c:	fd1eeae3          	bltu	t4,a7,bf30 <.L12>
    bf60:	00000513          	li	a0,0

0000bf64 <.LVL18>:
    bf64:	fdd8fae3          	bgeu	a7,t4,bf38 <.L1>

0000bf68 <.L13>:
    bf68:	00100513          	li	a0,1
    bf6c:	fc0796e3          	bnez	a5,bf38 <.L1>
    bf70:	fb5ff06f          	j	bf24 <.L35>

0000bf74 <.L17>:
    bf74:	ffe00513          	li	a0,-2

0000bf78 <.LVL20>:
    bf78:	fc1ff06f          	j	bf38 <.L1>

0000bf7c <.L6>:
    bf7c:	fa0710e3          	bnez	a4,bf1c <.L39>

0000bf80 <.L8>:
    bf80:	faf698e3          	bne	a3,a5,bf30 <.L12>
    bf84:	fac55ee3          	bge	a0,a2,bf40 <.L10>
    bf88:	fff00513          	li	a0,-1

0000bf8c <.LVL23>:
    bf8c:	fa0696e3          	bnez	a3,bf38 <.L1>

0000bf90 <.L34>:
    bf90:	00100513          	li	a0,1
    bf94:	fa5ff06f          	j	bf38 <.L1>

0000bf98 <__letf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__letf2 (TFtype a, TFtype b)
{
    bf98:	00c52783          	lw	a5,12(a0)
    bf9c:	00c5a683          	lw	a3,12(a1)

0000bfa0 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    bfa0:	00008737          	lui	a4,0x8
    bfa4:	0107d613          	srl	a2,a5,0x10
    bfa8:	fff70713          	add	a4,a4,-1 # 7fff <__kernel_rem_pio2+0x5f>
    bfac:	01079813          	sll	a6,a5,0x10

0000bfb0 <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    bfb0:	01069293          	sll	t0,a3,0x10

0000bfb4 <.LBE4>:
{
    bfb4:	00052883          	lw	a7,0(a0)

0000bfb8 <.LBB5>:
    bfb8:	00452303          	lw	t1,4(a0)

0000bfbc <.LBB6>:
    bfbc:	00852e03          	lw	t3,8(a0)

0000bfc0 <.LBB7>:
  FP_UNPACK_RAW_Q (A, a);
    bfc0:	00e67633          	and	a2,a2,a4

0000bfc4 <.LBB8>:
  FP_UNPACK_RAW_Q (B, b);
    bfc4:	0106d513          	srl	a0,a3,0x10

0000bfc8 <.LBE8>:
{
    bfc8:	0005ae83          	lw	t4,0(a1)
    bfcc:	0045af03          	lw	t5,4(a1)
    bfd0:	0085af83          	lw	t6,8(a1)
    bfd4:	ff010113          	add	sp,sp,-16

0000bfd8 <.LBB9>:
  FP_UNPACK_RAW_Q (A, a);
    bfd8:	01085813          	srl	a6,a6,0x10

0000bfdc <.LVL4>:
    bfdc:	01f7d793          	srl	a5,a5,0x1f

0000bfe0 <.LBB10>:
  FP_UNPACK_RAW_Q (B, b);
    bfe0:	0102d293          	srl	t0,t0,0x10

0000bfe4 <.LVL6>:
    bfe4:	00e57533          	and	a0,a0,a4

0000bfe8 <.LVL7>:
    bfe8:	01f6d693          	srl	a3,a3,0x1f

0000bfec <.LBE10>:
  FP_CMP_Q (r, A, B, 2, 2);
    bfec:	00e61a63          	bne	a2,a4,c000 <.L2>
    bff0:	01136733          	or	a4,t1,a7
    bff4:	01c76733          	or	a4,a4,t3
    bff8:	01076733          	or	a4,a4,a6
    bffc:	0a071463          	bnez	a4,c0a4 <.L17>

0000c000 <.L2>:
    c000:	00008737          	lui	a4,0x8
    c004:	fff70713          	add	a4,a4,-1 # 7fff <__kernel_rem_pio2+0x5f>
    c008:	00e51a63          	bne	a0,a4,c01c <.L4>
    c00c:	01eee733          	or	a4,t4,t5
    c010:	01f76733          	or	a4,a4,t6
    c014:	00576733          	or	a4,a4,t0
    c018:	08071663          	bnez	a4,c0a4 <.L17>

0000c01c <.L4>:
    c01c:	00000713          	li	a4,0
    c020:	00061a63          	bnez	a2,c034 <.L5>
    c024:	01136733          	or	a4,t1,a7
    c028:	01c76733          	or	a4,a4,t3
    c02c:	01076733          	or	a4,a4,a6
    c030:	00173713          	seqz	a4,a4

0000c034 <.L5>:
    c034:	06051c63          	bnez	a0,c0ac <.L6>
    c038:	01eee5b3          	or	a1,t4,t5
    c03c:	01f5e5b3          	or	a1,a1,t6
    c040:	0055e5b3          	or	a1,a1,t0

0000c044 <.LVL10>:
    c044:	00070c63          	beqz	a4,c05c <.L7>
    c048:	02058063          	beqz	a1,c068 <.L1>

0000c04c <.L39>:
    c04c:	00100513          	li	a0,1

0000c050 <.LVL12>:
    c050:	00069c63          	bnez	a3,c068 <.L1>

0000c054 <.L35>:
    c054:	fff00513          	li	a0,-1
    c058:	0100006f          	j	c068 <.L1>

0000c05c <.L7>:
    c05c:	04059a63          	bnez	a1,c0b0 <.L8>

0000c060 <.L12>:
    c060:	fff00513          	li	a0,-1

0000c064 <.LVL15>:
    c064:	04078e63          	beqz	a5,c0c0 <.L34>

0000c068 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    c068:	01010113          	add	sp,sp,16
    c06c:	00008067          	ret

0000c070 <.L10>:
  FP_CMP_Q (r, A, B, 2, 2);
    c070:	fca64ee3          	blt	a2,a0,c04c <.L39>
    c074:	ff02e6e3          	bltu	t0,a6,c060 <.L12>
    c078:	02581063          	bne	a6,t0,c098 <.L13>
    c07c:	ffcfe2e3          	bltu	t6,t3,c060 <.L12>
    c080:	01fe1c63          	bne	t3,t6,c098 <.L13>
    c084:	fc6f6ee3          	bltu	t5,t1,c060 <.L12>
    c088:	01e31863          	bne	t1,t5,c098 <.L13>
    c08c:	fd1eeae3          	bltu	t4,a7,c060 <.L12>
    c090:	00000513          	li	a0,0

0000c094 <.LVL18>:
    c094:	fdd8fae3          	bgeu	a7,t4,c068 <.L1>

0000c098 <.L13>:
    c098:	00100513          	li	a0,1
    c09c:	fc0796e3          	bnez	a5,c068 <.L1>
    c0a0:	fb5ff06f          	j	c054 <.L35>

0000c0a4 <.L17>:
    c0a4:	00200513          	li	a0,2

0000c0a8 <.LVL20>:
    c0a8:	fc1ff06f          	j	c068 <.L1>

0000c0ac <.L6>:
    c0ac:	fa0710e3          	bnez	a4,c04c <.L39>

0000c0b0 <.L8>:
    c0b0:	faf698e3          	bne	a3,a5,c060 <.L12>
    c0b4:	fac55ee3          	bge	a0,a2,c070 <.L10>
    c0b8:	fff00513          	li	a0,-1

0000c0bc <.LVL23>:
    c0bc:	fa0696e3          	bnez	a3,c068 <.L1>

0000c0c0 <.L34>:
    c0c0:	00100513          	li	a0,1
    c0c4:	fa5ff06f          	j	c068 <.L1>

0000c0c8 <__multf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__multf3 (TFtype a, TFtype b)
{
    c0c8:	f5010113          	add	sp,sp,-176
    c0cc:	09412c23          	sw	s4,152(sp)
    c0d0:	00c5aa03          	lw	s4,12(a1)
    c0d4:	0005a783          	lw	a5,0(a1)
    c0d8:	0085a683          	lw	a3,8(a1)
    c0dc:	0a812423          	sw	s0,168(sp)
    c0e0:	00050413          	mv	s0,a0
    c0e4:	0045a503          	lw	a0,4(a1)

0000c0e8 <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_Q (A, a);
    c0e8:	010a1713          	sll	a4,s4,0x10

0000c0ec <.LBE3>:
{
    c0ec:	0b212023          	sw	s2,160(sp)
    c0f0:	09312e23          	sw	s3,156(sp)
    c0f4:	00062903          	lw	s2,0(a2)
    c0f8:	00c62983          	lw	s3,12(a2)
    c0fc:	09512a23          	sw	s5,148(sp)
    c100:	09612823          	sw	s6,144(sp)
    c104:	00862a83          	lw	s5,8(a2)
    c108:	00462b03          	lw	s6,4(a2)

0000c10c <.LBB4>:
  FP_UNPACK_Q (A, a);
    c10c:	00008637          	lui	a2,0x8

0000c110 <.LBE4>:
{
    c110:	0a912223          	sw	s1,164(sp)

0000c114 <.LBB5>:
  FP_UNPACK_Q (A, a);
    c114:	01075713          	srl	a4,a4,0x10
    c118:	010a5493          	srl	s1,s4,0x10
    c11c:	fff60613          	add	a2,a2,-1 # 7fff <__kernel_rem_pio2+0x5f>
    c120:	05412e23          	sw	s4,92(sp)

0000c124 <.LBE5>:
{
    c124:	0a112623          	sw	ra,172(sp)
    c128:	09712623          	sw	s7,140(sp)
    c12c:	09812423          	sw	s8,136(sp)
    c130:	09912223          	sw	s9,132(sp)
    c134:	09a12023          	sw	s10,128(sp)
    c138:	07b12e23          	sw	s11,124(sp)

0000c13c <.LBB6>:
  FP_UNPACK_Q (A, a);
    c13c:	04f12823          	sw	a5,80(sp)
    c140:	04a12a23          	sw	a0,84(sp)
    c144:	04d12c23          	sw	a3,88(sp)
    c148:	02f12023          	sw	a5,32(sp)
    c14c:	02a12223          	sw	a0,36(sp)
    c150:	02d12423          	sw	a3,40(sp)
    c154:	02e12623          	sw	a4,44(sp)
    c158:	00c4f4b3          	and	s1,s1,a2

0000c15c <.LVL2>:
    c15c:	01fa5a13          	srl	s4,s4,0x1f

0000c160 <.LBE6>:
    c160:	080482e3          	beqz	s1,c9e4 <.L2>
    c164:	1ac48ce3          	beq	s1,a2,cb1c <.L3>
    c168:	000106b7          	lui	a3,0x10
    c16c:	00d76733          	or	a4,a4,a3
    c170:	02e12623          	sw	a4,44(sp)

0000c174 <.LBB7>:
    c174:	02010593          	add	a1,sp,32
    c178:	02c10713          	add	a4,sp,44

0000c17c <.L4>:
    c17c:	00072683          	lw	a3,0(a4)
    c180:	ffc72603          	lw	a2,-4(a4)
    c184:	ffc70713          	add	a4,a4,-4
    c188:	00369693          	sll	a3,a3,0x3
    c18c:	01d65613          	srl	a2,a2,0x1d
    c190:	00c6e6b3          	or	a3,a3,a2
    c194:	00d72223          	sw	a3,4(a4)
    c198:	fee592e3          	bne	a1,a4,c17c <.L4>

0000c19c <.LVL6>:
    c19c:	00379793          	sll	a5,a5,0x3
    c1a0:	02f12023          	sw	a5,32(sp)

0000c1a4 <.LBE7>:
    c1a4:	ffffc7b7          	lui	a5,0xffffc
    c1a8:	00178793          	add	a5,a5,1 # ffffc001 <_ebss+0xfffe6111>
    c1ac:	00f484b3          	add	s1,s1,a5

0000c1b0 <.L209>:
    c1b0:	00000b93          	li	s7,0

0000c1b4 <.L5>:
  FP_UNPACK_Q (B, b);
    c1b4:	01099513          	sll	a0,s3,0x10
    c1b8:	00008737          	lui	a4,0x8
    c1bc:	0109d793          	srl	a5,s3,0x10
    c1c0:	01055513          	srl	a0,a0,0x10
    c1c4:	fff70713          	add	a4,a4,-1 # 7fff <__kernel_rem_pio2+0x5f>
    c1c8:	05312e23          	sw	s3,92(sp)
    c1cc:	05212823          	sw	s2,80(sp)
    c1d0:	05612a23          	sw	s6,84(sp)
    c1d4:	05512c23          	sw	s5,88(sp)
    c1d8:	03212823          	sw	s2,48(sp)
    c1dc:	03612a23          	sw	s6,52(sp)
    c1e0:	03512c23          	sw	s5,56(sp)
    c1e4:	02a12e23          	sw	a0,60(sp)
    c1e8:	00e7f7b3          	and	a5,a5,a4

0000c1ec <.LVL9>:
    c1ec:	01f9d993          	srl	s3,s3,0x1f

0000c1f0 <.LBE11>:
    c1f0:	14078ae3          	beqz	a5,cb44 <.L18>
    c1f4:	28e784e3          	beq	a5,a4,cc7c <.L19>
    c1f8:	00010737          	lui	a4,0x10
    c1fc:	00e56533          	or	a0,a0,a4
    c200:	02a12e23          	sw	a0,60(sp)

0000c204 <.LBB12>:
    c204:	03010593          	add	a1,sp,48
    c208:	03c10713          	add	a4,sp,60

0000c20c <.L20>:
    c20c:	00072683          	lw	a3,0(a4) # 10000 <.LVL314+0x8>
    c210:	ffc72603          	lw	a2,-4(a4)
    c214:	ffc70713          	add	a4,a4,-4
    c218:	00369693          	sll	a3,a3,0x3
    c21c:	01d65613          	srl	a2,a2,0x1d
    c220:	00c6e6b3          	or	a3,a3,a2
    c224:	00d72223          	sw	a3,4(a4)
    c228:	fee592e3          	bne	a1,a4,c20c <.L20>

0000c22c <.LBE12>:
    c22c:	ffffc737          	lui	a4,0xffffc

0000c230 <.LBB13>:
    c230:	00391913          	sll	s2,s2,0x3

0000c234 <.LBE13>:
    c234:	00170713          	add	a4,a4,1 # ffffc001 <_ebss+0xfffe6111>

0000c238 <.LBB14>:
    c238:	03212823          	sw	s2,48(sp)

0000c23c <.LBE14>:
    c23c:	00e787b3          	add	a5,a5,a4

0000c240 <.L210>:
    c240:	00000693          	li	a3,0

0000c244 <.L21>:
  FP_MUL_Q (R, A, B);
    c244:	009787b3          	add	a5,a5,s1

0000c248 <.LVL16>:
    c248:	00f12623          	sw	a5,12(sp)
    c24c:	00178793          	add	a5,a5,1
    c250:	00f12423          	sw	a5,8(sp)

0000c254 <.LVL17>:
    c254:	002b9793          	sll	a5,s7,0x2

0000c258 <.LVL18>:
    c258:	00d7e7b3          	or	a5,a5,a3
    c25c:	00a00713          	li	a4,10
    c260:	28f742e3          	blt	a4,a5,cce4 <.L34>
    c264:	013a4733          	xor	a4,s4,s3
    c268:	00e12223          	sw	a4,4(sp)
    c26c:	00200713          	li	a4,2
    c270:	22f74ae3          	blt	a4,a5,cca4 <.L35>
    c274:	fff78793          	add	a5,a5,-1
    c278:	00100713          	li	a4,1
    c27c:	28f770e3          	bgeu	a4,a5,ccfc <.L37>

0000c280 <.L36>:
    c280:	02012883          	lw	a7,32(sp)

0000c284 <.LVL20>:
    c284:	03012f03          	lw	t5,48(sp)
    c288:	000105b7          	lui	a1,0x10
    c28c:	fff58713          	add	a4,a1,-1 # ffff <.LVL314+0x7>
    c290:	0108d913          	srl	s2,a7,0x10

0000c294 <.LVL21>:
    c294:	010f5493          	srl	s1,t5,0x10

0000c298 <.LVL22>:
    c298:	00e8f8b3          	and	a7,a7,a4

0000c29c <.LVL23>:
    c29c:	00ef7f33          	and	t5,t5,a4

0000c2a0 <.LVL24>:
    c2a0:	031f0633          	mul	a2,t5,a7

0000c2a4 <.LVL25>:
    c2a4:	03e90533          	mul	a0,s2,t5

0000c2a8 <.LVL26>:
    c2a8:	01065793          	srl	a5,a2,0x10
    c2ac:	031486b3          	mul	a3,s1,a7

0000c2b0 <.LVL27>:
    c2b0:	00a686b3          	add	a3,a3,a0

0000c2b4 <.LVL28>:
    c2b4:	00d787b3          	add	a5,a5,a3
    c2b8:	02990bb3          	mul	s7,s2,s1

0000c2bc <.LVL29>:
    c2bc:	00a7f463          	bgeu	a5,a0,c2c4 <.L42>
    c2c0:	00bb8bb3          	add	s7,s7,a1

0000c2c4 <.L42>:
    c2c4:	03412e83          	lw	t4,52(sp)

0000c2c8 <.LBB22>:
    c2c8:	0107d693          	srl	a3,a5,0x10
    c2cc:	00e7f7b3          	and	a5,a5,a4

0000c2d0 <.LVL31>:
    c2d0:	00e67633          	and	a2,a2,a4

0000c2d4 <.LVL32>:
    c2d4:	01079793          	sll	a5,a5,0x10
    c2d8:	00c787b3          	add	a5,a5,a2

0000c2dc <.LBB23>:
    c2dc:	010ed293          	srl	t0,t4,0x10
    c2e0:	00eefeb3          	and	t4,t4,a4
    c2e4:	03d90633          	mul	a2,s2,t4

0000c2e8 <.LBB24>:
    c2e8:	00f12823          	sw	a5,16(sp)
    c2ec:	04f12823          	sw	a5,80(sp)

0000c2f0 <.LBB25>:
    c2f0:	03128733          	mul	a4,t0,a7
    c2f4:	031e87b3          	mul	a5,t4,a7

0000c2f8 <.LVL34>:
    c2f8:	00c70733          	add	a4,a4,a2

0000c2fc <.LVL35>:
    c2fc:	0107d313          	srl	t1,a5,0x10
    c300:	00e30333          	add	t1,t1,a4
    c304:	02590b33          	mul	s6,s2,t0

0000c308 <.LVL36>:
    c308:	00c37663          	bgeu	t1,a2,c314 <.L43>
    c30c:	00010737          	lui	a4,0x10
    c310:	00eb0b33          	add	s6,s6,a4

0000c314 <.L43>:
    c314:	02412803          	lw	a6,36(sp)

0000c318 <.LBB27>:
    c318:	00010737          	lui	a4,0x10
    c31c:	fff70613          	add	a2,a4,-1 # ffff <.LVL314+0x7>

0000c320 <.LVL38>:
    c320:	01035513          	srl	a0,t1,0x10

0000c324 <.LVL39>:
    c324:	00c37333          	and	t1,t1,a2

0000c328 <.LVL40>:
    c328:	00c7f7b3          	and	a5,a5,a2

0000c32c <.LBB28>:
    c32c:	01085393          	srl	t2,a6,0x10

0000c330 <.LBB29>:
    c330:	01031313          	sll	t1,t1,0x10
    c334:	00c87833          	and	a6,a6,a2
    c338:	00f30333          	add	t1,t1,a5

0000c33c <.LBB30>:
    c33c:	03e38fb3          	mul	t6,t2,t5
    c340:	006686b3          	add	a3,a3,t1

0000c344 <.LBB31>:
    c344:	03e807b3          	mul	a5,a6,t5

0000c348 <.LVL43>:
    c348:	03048e33          	mul	t3,s1,a6

0000c34c <.LVL44>:
    c34c:	0107d613          	srl	a2,a5,0x10
    c350:	01fe0e33          	add	t3,t3,t6

0000c354 <.LVL45>:
    c354:	01c60633          	add	a2,a2,t3
    c358:	027485b3          	mul	a1,s1,t2

0000c35c <.LVL46>:
    c35c:	01f67463          	bgeu	a2,t6,c364 <.L44>
    c360:	00e585b3          	add	a1,a1,a4

0000c364 <.L44>:
    c364:	01065a93          	srl	s5,a2,0x10
    c368:	00010737          	lui	a4,0x10
    c36c:	00ba8ab3          	add	s5,s5,a1

0000c370 <.LVL48>:
    c370:	fff70593          	add	a1,a4,-1 # ffff <.LVL314+0x7>

0000c374 <.LVL49>:
    c374:	00b7f7b3          	and	a5,a5,a1

0000c378 <.LVL50>:
    c378:	00b67633          	and	a2,a2,a1

0000c37c <.LVL51>:
    c37c:	01061613          	sll	a2,a2,0x10

0000c380 <.LBB32>:
    c380:	030e85b3          	mul	a1,t4,a6

0000c384 <.LBB33>:
    c384:	00f60633          	add	a2,a2,a5

0000c388 <.LBB34>:
    c388:	03d38fb3          	mul	t6,t2,t4

0000c38c <.LVL53>:
    c38c:	0105d793          	srl	a5,a1,0x10
    c390:	03028e33          	mul	t3,t0,a6

0000c394 <.LVL54>:
    c394:	01fe0e33          	add	t3,t3,t6

0000c398 <.LVL55>:
    c398:	01c787b3          	add	a5,a5,t3
    c39c:	027289b3          	mul	s3,t0,t2

0000c3a0 <.LVL56>:
    c3a0:	01f7f463          	bgeu	a5,t6,c3a8 <.L45>
    c3a4:	00e989b3          	add	s3,s3,a4

0000c3a8 <.L45>:
    c3a8:	0107d713          	srl	a4,a5,0x10
    c3ac:	01370733          	add	a4,a4,s3
    c3b0:	00010a37          	lui	s4,0x10

0000c3b4 <.LVL58>:
    c3b4:	00e12a23          	sw	a4,20(sp)

0000c3b8 <.LVL59>:
    c3b8:	fffa0713          	add	a4,s4,-1 # ffff <.LVL314+0x7>

0000c3bc <.LBB35>:
    c3bc:	03812e03          	lw	t3,56(sp)

0000c3c0 <.LBB36>:
    c3c0:	00e7f7b3          	and	a5,a5,a4

0000c3c4 <.LVL61>:
    c3c4:	00e5f5b3          	and	a1,a1,a4

0000c3c8 <.LVL62>:
    c3c8:	01079793          	sll	a5,a5,0x10
    c3cc:	00b787b3          	add	a5,a5,a1
    c3d0:	00f12c23          	sw	a5,24(sp)

0000c3d4 <.LBB37>:
    c3d4:	010e5793          	srl	a5,t3,0x10

0000c3d8 <.LVL64>:
    c3d8:	00ee7e33          	and	t3,t3,a4

0000c3dc <.LVL65>:
    c3dc:	031e05b3          	mul	a1,t3,a7

0000c3e0 <.LVL66>:
    c3e0:	03c90c33          	mul	s8,s2,t3

0000c3e4 <.LVL67>:
    c3e4:	0105d713          	srl	a4,a1,0x10
    c3e8:	031789b3          	mul	s3,a5,a7

0000c3ec <.LVL68>:
    c3ec:	018989b3          	add	s3,s3,s8

0000c3f0 <.LVL69>:
    c3f0:	01370733          	add	a4,a4,s3
    c3f4:	02f90fb3          	mul	t6,s2,a5

0000c3f8 <.LVL70>:
    c3f8:	01877463          	bgeu	a4,s8,c400 <.L46>
    c3fc:	014f8fb3          	add	t6,t6,s4

0000c400 <.L46>:
    c400:	01075993          	srl	s3,a4,0x10
    c404:	00010cb7          	lui	s9,0x10
    c408:	01f98fb3          	add	t6,s3,t6

0000c40c <.LVL72>:
    c40c:	fffc8993          	add	s3,s9,-1 # ffff <.LVL314+0x7>
    c410:	01377733          	and	a4,a4,s3

0000c414 <.LVL73>:
    c414:	0135f5b3          	and	a1,a1,s3

0000c418 <.LVL74>:
    c418:	01071713          	sll	a4,a4,0x10
    c41c:	00b70733          	add	a4,a4,a1

0000c420 <.LBB38>:
    c420:	02812583          	lw	a1,40(sp)

0000c424 <.LBB39>:
    c424:	01f12e23          	sw	t6,28(sp)

0000c428 <.LBB40>:
    c428:	0105df93          	srl	t6,a1,0x10

0000c42c <.LVL76>:
    c42c:	0135f5b3          	and	a1,a1,s3

0000c430 <.LVL77>:
    c430:	03e58a33          	mul	s4,a1,t5

0000c434 <.LVL78>:
    c434:	03ef8d33          	mul	s10,t6,t5

0000c438 <.LVL79>:
    c438:	010a5d93          	srl	s11,s4,0x10
    c43c:	02b489b3          	mul	s3,s1,a1

0000c440 <.LVL80>:
    c440:	01a989b3          	add	s3,s3,s10

0000c444 <.LVL81>:
    c444:	013d89b3          	add	s3,s11,s3
    c448:	03f48c33          	mul	s8,s1,t6

0000c44c <.LVL82>:
    c44c:	01a9f463          	bgeu	s3,s10,c454 <.L47>
    c450:	019c0c33          	add	s8,s8,s9

0000c454 <.L47>:
    c454:	00db86b3          	add	a3,s7,a3
    c458:	0066b333          	sltu	t1,a3,t1

0000c45c <.LBB42>:
    c45c:	0109dd13          	srl	s10,s3,0x10

0000c460 <.LBB43>:
    c460:	00650533          	add	a0,a0,t1

0000c464 <.LBB44>:
    c464:	00010cb7          	lui	s9,0x10

0000c468 <.LBB45>:
    c468:	01650533          	add	a0,a0,s6

0000c46c <.LBB46>:
    c46c:	018d0d33          	add	s10,s10,s8

0000c470 <.LVL87>:
    c470:	00c68633          	add	a2,a3,a2

0000c474 <.LVL88>:
    c474:	fffc8c13          	add	s8,s9,-1 # ffff <.LVL314+0x7>

0000c478 <.LVL89>:
    c478:	01550ab3          	add	s5,a0,s5

0000c47c <.LVL90>:
    c47c:	0189f9b3          	and	s3,s3,s8

0000c480 <.LBB47>:
    c480:	00d636b3          	sltu	a3,a2,a3
    c484:	00da86b3          	add	a3,s5,a3

0000c488 <.LBB48>:
    c488:	01099993          	sll	s3,s3,0x10
    c48c:	018a7a33          	and	s4,s4,s8

0000c490 <.LVL92>:
    c490:	01498a33          	add	s4,s3,s4

0000c494 <.LBB49>:
    c494:	00aab9b3          	sltu	s3,s5,a0
    c498:	0156bab3          	sltu	s5,a3,s5
    c49c:	0159e9b3          	or	s3,s3,s5

0000c4a0 <.LBB51>:
    c4a0:	00653533          	sltu	a0,a0,t1

0000c4a4 <.LBB52>:
    c4a4:	00a98533          	add	a0,s3,a0
    c4a8:	01812303          	lw	t1,24(sp)

0000c4ac <.LVL95>:
    c4ac:	01412983          	lw	s3,20(sp)
    c4b0:	04c12a23          	sw	a2,84(sp)

0000c4b4 <.LBB53>:
    c4b4:	00668333          	add	t1,a3,t1

0000c4b8 <.LVL97>:
    c4b8:	01350ab3          	add	s5,a0,s3

0000c4bc <.LVL98>:
    c4bc:	01c12983          	lw	s3,28(sp)
    c4c0:	00d336b3          	sltu	a3,t1,a3

0000c4c4 <.LVL99>:
    c4c4:	00da86b3          	add	a3,s5,a3

0000c4c8 <.LBB54>:
    c4c8:	00e30733          	add	a4,t1,a4

0000c4cc <.LVL101>:
    c4cc:	01368b33          	add	s6,a3,s3

0000c4d0 <.LVL102>:
    c4d0:	00673333          	sltu	t1,a4,t1

0000c4d4 <.LVL103>:
    c4d4:	006b0333          	add	t1,s6,t1

0000c4d8 <.LVL104>:
    c4d8:	01470a33          	add	s4,a4,s4

0000c4dc <.LVL105>:
    c4dc:	01a30d33          	add	s10,t1,s10

0000c4e0 <.LBB55>:
    c4e0:	00ea3733          	sltu	a4,s4,a4

0000c4e4 <.LBB56>:
    c4e4:	00aab533          	sltu	a0,s5,a0

0000c4e8 <.LVL107>:
    c4e8:	00ed0733          	add	a4,s10,a4
    c4ec:	0156bab3          	sltu	s5,a3,s5

0000c4f0 <.LBB57>:
    c4f0:	00db36b3          	sltu	a3,s6,a3

0000c4f4 <.LVL109>:
    c4f4:	01633b33          	sltu	s6,t1,s6

0000c4f8 <.LVL110>:
    c4f8:	0166e6b3          	or	a3,a3,s6

0000c4fc <.LBB58>:
    c4fc:	006d39b3          	sltu	s3,s10,t1

0000c500 <.LBB59>:
    c500:	01556ab3          	or	s5,a0,s5

0000c504 <.LBB60>:
    c504:	01a73d33          	sltu	s10,a4,s10

0000c508 <.LBB61>:
    c508:	00da8ab3          	add	s5,s5,a3

0000c50c <.LBB62>:
    c50c:	01a9e9b3          	or	s3,s3,s10
    c510:	015989b3          	add	s3,s3,s5

0000c514 <.LBB63>:
    c514:	03c12a83          	lw	s5,60(sp)

0000c518 <.LBB64>:
    c518:	05412c23          	sw	s4,88(sp)

0000c51c <.LBB65>:
    c51c:	010adb13          	srl	s6,s5,0x10

0000c520 <.LVL114>:
    c520:	018afab3          	and	s5,s5,s8

0000c524 <.LVL115>:
    c524:	031a86b3          	mul	a3,s5,a7

0000c528 <.LVL116>:
    c528:	03590533          	mul	a0,s2,s5

0000c52c <.LVL117>:
    c52c:	031b08b3          	mul	a7,s6,a7

0000c530 <.LVL118>:
    c530:	00a88333          	add	t1,a7,a0
    c534:	0106d893          	srl	a7,a3,0x10

0000c538 <.LVL119>:
    c538:	006888b3          	add	a7,a7,t1
    c53c:	03690933          	mul	s2,s2,s6

0000c540 <.LVL120>:
    c540:	00a8f463          	bgeu	a7,a0,c548 <.L72>
    c544:	01990933          	add	s2,s2,s9

0000c548 <.L72>:
    c548:	02c12b83          	lw	s7,44(sp)

0000c54c <.LBB67>:
    c54c:	0108d513          	srl	a0,a7,0x10

0000c550 <.LVL123>:
    c550:	01250533          	add	a0,a0,s2
    c554:	00010c37          	lui	s8,0x10
    c558:	00a12a23          	sw	a0,20(sp)

0000c55c <.LVL124>:
    c55c:	fffc0513          	add	a0,s8,-1 # ffff <.LVL314+0x7>

0000c560 <.LBB68>:
    c560:	010bd913          	srl	s2,s7,0x10

0000c564 <.LVL126>:
    c564:	00abfbb3          	and	s7,s7,a0

0000c568 <.LBB69>:
    c568:	00a6f6b3          	and	a3,a3,a0

0000c56c <.LVL127>:
    c56c:	00a8f8b3          	and	a7,a7,a0

0000c570 <.LBB70>:
    c570:	03248333          	mul	t1,s1,s2

0000c574 <.LBB71>:
    c574:	01089893          	sll	a7,a7,0x10
    c578:	00d888b3          	add	a7,a7,a3

0000c57c <.LBB72>:
    c57c:	03eb8533          	mul	a0,s7,t5

0000c580 <.LVL131>:
    c580:	037484b3          	mul	s1,s1,s7

0000c584 <.LVL132>:
    c584:	01055693          	srl	a3,a0,0x10
    c588:	03e90f33          	mul	t5,s2,t5

0000c58c <.LVL133>:
    c58c:	01e484b3          	add	s1,s1,t5

0000c590 <.LVL134>:
    c590:	009686b3          	add	a3,a3,s1

0000c594 <.LVL135>:
    c594:	01e6f463          	bgeu	a3,t5,c59c <.L73>
    c598:	01830333          	add	t1,t1,s8

0000c59c <.L73>:
    c59c:	0106df13          	srl	t5,a3,0x10

0000c5a0 <.LVL137>:
    c5a0:	006f0333          	add	t1,t5,t1

0000c5a4 <.LVL138>:
    c5a4:	00010cb7          	lui	s9,0x10

0000c5a8 <.LVL139>:
    c5a8:	00612c23          	sw	t1,24(sp)

0000c5ac <.LVL140>:
    c5ac:	fffc8313          	add	t1,s9,-1 # ffff <.LVL314+0x7>

0000c5b0 <.LVL141>:
    c5b0:	00657533          	and	a0,a0,t1

0000c5b4 <.LVL142>:
    c5b4:	0066f6b3          	and	a3,a3,t1

0000c5b8 <.LBB73>:
    c5b8:	03c38f33          	mul	t5,t2,t3

0000c5bc <.LBB74>:
    c5bc:	01069693          	sll	a3,a3,0x10
    c5c0:	00a686b3          	add	a3,a3,a0

0000c5c4 <.LBB75>:
    c5c4:	03c80333          	mul	t1,a6,t3

0000c5c8 <.LVL145>:
    c5c8:	030784b3          	mul	s1,a5,a6

0000c5cc <.LVL146>:
    c5cc:	01035513          	srl	a0,t1,0x10
    c5d0:	01e484b3          	add	s1,s1,t5

0000c5d4 <.LVL147>:
    c5d4:	00950533          	add	a0,a0,s1
    c5d8:	02f38c33          	mul	s8,t2,a5

0000c5dc <.LVL148>:
    c5dc:	01e57463          	bgeu	a0,t5,c5e4 <.L74>
    c5e0:	019c0c33          	add	s8,s8,s9

0000c5e4 <.L74>:
    c5e4:	00010d37          	lui	s10,0x10
    c5e8:	fffd0f13          	add	t5,s10,-1 # ffff <.LVL314+0x7>
    c5ec:	01055493          	srl	s1,a0,0x10
    c5f0:	01e57533          	and	a0,a0,t5

0000c5f4 <.LVL150>:
    c5f4:	01e37333          	and	t1,t1,t5

0000c5f8 <.LVL151>:
    c5f8:	01051513          	sll	a0,a0,0x10
    c5fc:	018484b3          	add	s1,s1,s8

0000c600 <.LBB76>:
    c600:	02b28f33          	mul	t5,t0,a1

0000c604 <.LBB77>:
    c604:	00650533          	add	a0,a0,t1

0000c608 <.LBB78>:
    c608:	03df8c33          	mul	s8,t6,t4

0000c60c <.LVL154>:
    c60c:	02be8333          	mul	t1,t4,a1

0000c610 <.LVL155>:
    c610:	018f0f33          	add	t5,t5,s8

0000c614 <.LVL156>:
    c614:	01035d93          	srl	s11,t1,0x10

0000c618 <.LVL157>:
    c618:	01ed8f33          	add	t5,s11,t5
    c61c:	03f28cb3          	mul	s9,t0,t6

0000c620 <.LVL158>:
    c620:	018f7463          	bgeu	t5,s8,c628 <.L75>
    c624:	01ac8cb3          	add	s9,s9,s10

0000c628 <.L75>:
    c628:	010f5c13          	srl	s8,t5,0x10
    c62c:	019c0c33          	add	s8,s8,s9

0000c630 <.LVL160>:
    c630:	00010cb7          	lui	s9,0x10

0000c634 <.LVL161>:
    c634:	fffc8d13          	add	s10,s9,-1 # ffff <.LVL314+0x7>

0000c638 <.LVL162>:
    c638:	01af7f33          	and	t5,t5,s10

0000c63c <.LVL163>:
    c63c:	010f1f13          	sll	t5,t5,0x10
    c640:	01a37333          	and	t1,t1,s10

0000c644 <.LVL164>:
    c644:	006f0333          	add	t1,t5,t1

0000c648 <.LBB79>:
    c648:	01412f03          	lw	t5,20(sp)
    c64c:	011708b3          	add	a7,a4,a7

0000c650 <.LVL166>:
    c650:	01812d03          	lw	s10,24(sp)

0000c654 <.LVL167>:
    c654:	01e98f33          	add	t5,s3,t5

0000c658 <.LVL168>:
    c658:	00e8b733          	sltu	a4,a7,a4

0000c65c <.LVL169>:
    c65c:	00ef0733          	add	a4,t5,a4

0000c660 <.LBB80>:
    c660:	00d886b3          	add	a3,a7,a3

0000c664 <.LVL171>:
    c664:	01a70d33          	add	s10,a4,s10

0000c668 <.LVL172>:
    c668:	0116b8b3          	sltu	a7,a3,a7

0000c66c <.LVL173>:
    c66c:	011d08b3          	add	a7,s10,a7

0000c670 <.LVL174>:
    c670:	00a68533          	add	a0,a3,a0

0000c674 <.LVL175>:
    c674:	009884b3          	add	s1,a7,s1

0000c678 <.LBB81>:
    c678:	00d536b3          	sltu	a3,a0,a3
    c67c:	00d486b3          	add	a3,s1,a3

0000c680 <.LBB82>:
    c680:	013f39b3          	sltu	s3,t5,s3

0000c684 <.LVL177>:
    c684:	01e73f33          	sltu	t5,a4,t5

0000c688 <.LBB83>:
    c688:	00ed3733          	sltu	a4,s10,a4

0000c68c <.LVL179>:
    c68c:	01a8bd33          	sltu	s10,a7,s10

0000c690 <.LBB84>:
    c690:	01e9ef33          	or	t5,s3,t5

0000c694 <.LBB85>:
    c694:	0114b8b3          	sltu	a7,s1,a7

0000c698 <.LBB86>:
    c698:	01a76733          	or	a4,a4,s10

0000c69c <.LBB87>:
    c69c:	0096b4b3          	sltu	s1,a3,s1
    c6a0:	01868c33          	add	s8,a3,s8

0000c6a4 <.LBB88>:
    c6a4:	00ef0733          	add	a4,t5,a4

0000c6a8 <.LBB89>:
    c6a8:	0098e8b3          	or	a7,a7,s1
    c6ac:	00e884b3          	add	s1,a7,a4

0000c6b0 <.LBB90>:
    c6b0:	03cf8f33          	mul	t5,t6,t3

0000c6b4 <.LBB92>:
    c6b4:	00dc38b3          	sltu	a7,s8,a3
    c6b8:	00650333          	add	t1,a0,t1

0000c6bc <.LVL185>:
    c6bc:	00a33533          	sltu	a0,t1,a0
    c6c0:	00ac0533          	add	a0,s8,a0
    c6c4:	01853c33          	sltu	s8,a0,s8
    c6c8:	0188e8b3          	or	a7,a7,s8
    c6cc:	04612e23          	sw	t1,92(sp)
    c6d0:	009888b3          	add	a7,a7,s1

0000c6d4 <.LBB93>:
    c6d4:	02be06b3          	mul	a3,t3,a1

0000c6d8 <.LVL188>:
    c6d8:	02b789b3          	mul	s3,a5,a1

0000c6dc <.LVL189>:
    c6dc:	0106d713          	srl	a4,a3,0x10
    c6e0:	01e989b3          	add	s3,s3,t5

0000c6e4 <.LVL190>:
    c6e4:	01370733          	add	a4,a4,s3
    c6e8:	03f784b3          	mul	s1,a5,t6

0000c6ec <.LVL191>:
    c6ec:	01e77463          	bgeu	a4,t5,c6f4 <.L100>
    c6f0:	019484b3          	add	s1,s1,s9

0000c6f4 <.L100>:
    c6f4:	01075f13          	srl	t5,a4,0x10
    c6f8:	009f0f33          	add	t5,t5,s1

0000c6fc <.LVL193>:
    c6fc:	000104b7          	lui	s1,0x10

0000c700 <.LVL194>:
    c700:	fff48993          	add	s3,s1,-1 # ffff <.LVL314+0x7>
    c704:	01377733          	and	a4,a4,s3

0000c708 <.LVL195>:
    c708:	0136f6b3          	and	a3,a3,s3

0000c70c <.LVL196>:
    c70c:	01071713          	sll	a4,a4,0x10

0000c710 <.LBB94>:
    c710:	035389b3          	mul	s3,t2,s5

0000c714 <.LBB95>:
    c714:	00d70733          	add	a4,a4,a3

0000c718 <.LBB96>:
    c718:	030a86b3          	mul	a3,s5,a6

0000c71c <.LVL198>:
    c71c:	030b0833          	mul	a6,s6,a6

0000c720 <.LVL199>:
    c720:	01380c33          	add	s8,a6,s3
    c724:	0106d813          	srl	a6,a3,0x10

0000c728 <.LVL200>:
    c728:	01880833          	add	a6,a6,s8
    c72c:	036383b3          	mul	t2,t2,s6

0000c730 <.LVL201>:
    c730:	01387463          	bgeu	a6,s3,c738 <.L101>
    c734:	009383b3          	add	t2,t2,s1

0000c738 <.L101>:
    c738:	01085493          	srl	s1,a6,0x10
    c73c:	00010c37          	lui	s8,0x10
    c740:	007483b3          	add	t2,s1,t2

0000c744 <.LVL203>:
    c744:	fffc0493          	add	s1,s8,-1 # ffff <.LVL314+0x7>
    c748:	0096f6b3          	and	a3,a3,s1

0000c74c <.LVL204>:
    c74c:	00987833          	and	a6,a6,s1

0000c750 <.LVL205>:
    c750:	01081813          	sll	a6,a6,0x10

0000c754 <.LBB97>:
    c754:	03db89b3          	mul	s3,s7,t4

0000c758 <.LBB98>:
    c758:	00d80833          	add	a6,a6,a3

0000c75c <.LBB99>:
    c75c:	03d90eb3          	mul	t4,s2,t4

0000c760 <.LVL208>:
    c760:	0109d693          	srl	a3,s3,0x10
    c764:	032284b3          	mul	s1,t0,s2

0000c768 <.LVL209>:
    c768:	037282b3          	mul	t0,t0,s7

0000c76c <.LVL210>:
    c76c:	01d282b3          	add	t0,t0,t4

0000c770 <.LVL211>:
    c770:	005686b3          	add	a3,a3,t0

0000c774 <.LVL212>:
    c774:	01d6f463          	bgeu	a3,t4,c77c <.L102>
    c778:	018484b3          	add	s1,s1,s8

0000c77c <.L102>:
    c77c:	0106de93          	srl	t4,a3,0x10

0000c780 <.LVL214>:
    c780:	009e8eb3          	add	t4,t4,s1

0000c784 <.LVL215>:
    c784:	000104b7          	lui	s1,0x10

0000c788 <.LVL216>:
    c788:	fff48293          	add	t0,s1,-1 # ffff <.LVL314+0x7>
    c78c:	0056f6b3          	and	a3,a3,t0

0000c790 <.LVL217>:
    c790:	0059f9b3          	and	s3,s3,t0

0000c794 <.LVL218>:
    c794:	01069693          	sll	a3,a3,0x10

0000c798 <.LBB100>:
    c798:	02ba82b3          	mul	t0,s5,a1

0000c79c <.LBB101>:
    c79c:	013686b3          	add	a3,a3,s3

0000c7a0 <.LBB102>:
    c7a0:	02bb05b3          	mul	a1,s6,a1

0000c7a4 <.LVL220>:
    c7a4:	035f89b3          	mul	s3,t6,s5

0000c7a8 <.LVL221>:
    c7a8:	01358c33          	add	s8,a1,s3
    c7ac:	0102d593          	srl	a1,t0,0x10

0000c7b0 <.LVL222>:
    c7b0:	018585b3          	add	a1,a1,s8
    c7b4:	036f8fb3          	mul	t6,t6,s6

0000c7b8 <.LVL223>:
    c7b8:	0135f463          	bgeu	a1,s3,c7c0 <.L103>
    c7bc:	009f8fb3          	add	t6,t6,s1

0000c7c0 <.L103>:
    c7c0:	0105d493          	srl	s1,a1,0x10
    c7c4:	01f48fb3          	add	t6,s1,t6

0000c7c8 <.LVL225>:
    c7c8:	000104b7          	lui	s1,0x10
    c7cc:	fff48993          	add	s3,s1,-1 # ffff <.LVL314+0x7>

0000c7d0 <.LVL226>:
    c7d0:	0135f5b3          	and	a1,a1,s3

0000c7d4 <.LVL227>:
    c7d4:	0132f2b3          	and	t0,t0,s3

0000c7d8 <.LVL228>:
    c7d8:	01059593          	sll	a1,a1,0x10

0000c7dc <.LBB103>:
    c7dc:	032789b3          	mul	s3,a5,s2

0000c7e0 <.LBB104>:
    c7e0:	005585b3          	add	a1,a1,t0

0000c7e4 <.LBB105>:
    c7e4:	037787b3          	mul	a5,a5,s7

0000c7e8 <.LVL230>:
    c7e8:	03cb82b3          	mul	t0,s7,t3

0000c7ec <.LVL231>:
    c7ec:	03c90e33          	mul	t3,s2,t3

0000c7f0 <.LVL232>:
    c7f0:	0102dc13          	srl	s8,t0,0x10

0000c7f4 <.LVL233>:
    c7f4:	01c787b3          	add	a5,a5,t3
    c7f8:	00fc07b3          	add	a5,s8,a5

0000c7fc <.LVL235>:
    c7fc:	01c7f463          	bgeu	a5,t3,c804 <.L104>
    c800:	009989b3          	add	s3,s3,s1

0000c804 <.L104>:
    c804:	00e50733          	add	a4,a0,a4

0000c808 <.LVL237>:
    c808:	01070833          	add	a6,a4,a6

0000c80c <.LVL238>:
    c80c:	01e88f33          	add	t5,a7,t5

0000c810 <.LBB106>:
    c810:	00a73533          	sltu	a0,a4,a0
    c814:	00af0533          	add	a0,t5,a0
    c818:	00d806b3          	add	a3,a6,a3

0000c81c <.LVL240>:
    c81c:	007503b3          	add	t2,a0,t2

0000c820 <.LBB107>:
    c820:	00e83733          	sltu	a4,a6,a4

0000c824 <.LBB108>:
    c824:	06d12023          	sw	a3,96(sp)
    c828:	0106b6b3          	sltu	a3,a3,a6

0000c82c <.LBB109>:
    c82c:	037a8833          	mul	a6,s5,s7
    c830:	00e38733          	add	a4,t2,a4
    c834:	01d70eb3          	add	t4,a4,t4

0000c838 <.LVL242>:
    c838:	00de86b3          	add	a3,t4,a3

0000c83c <.LBB110>:
    c83c:	0107de13          	srl	t3,a5,0x10

0000c840 <.LBB111>:
    c840:	011f38b3          	sltu	a7,t5,a7

0000c844 <.LBB112>:
    c844:	000104b7          	lui	s1,0x10

0000c848 <.LBB113>:
    c848:	01e53f33          	sltu	t5,a0,t5

0000c84c <.LBB114>:
    c84c:	00a3b533          	sltu	a0,t2,a0
    c850:	007733b3          	sltu	t2,a4,t2

0000c854 <.LBB115>:
    c854:	03590ab3          	mul	s5,s2,s5

0000c858 <.LBB116>:
    c858:	013e0e33          	add	t3,t3,s3

0000c85c <.LBB117>:
    c85c:	00756533          	or	a0,a0,t2

0000c860 <.LBB118>:
    c860:	fff48993          	add	s3,s1,-1 # ffff <.LVL314+0x7>

0000c864 <.LBB119>:
    c864:	00eeb733          	sltu	a4,t4,a4

0000c868 <.LBB120>:
    c868:	01e8e8b3          	or	a7,a7,t5

0000c86c <.LBB121>:
    c86c:	01d6beb3          	sltu	t4,a3,t4

0000c870 <.LBB122>:
    c870:	00a888b3          	add	a7,a7,a0

0000c874 <.LBB123>:
    c874:	0137f7b3          	and	a5,a5,s3

0000c878 <.LBB124>:
    c878:	01d76733          	or	a4,a4,t4

0000c87c <.LBB125>:
    c87c:	032b0933          	mul	s2,s6,s2

0000c880 <.LVL248>:
    c880:	00b685b3          	add	a1,a3,a1

0000c884 <.LBB126>:
    c884:	01170733          	add	a4,a4,a7

0000c888 <.LBB127>:
    c888:	01079793          	sll	a5,a5,0x10
    c88c:	0132f2b3          	and	t0,t0,s3

0000c890 <.LVL250>:
    c890:	01f70fb3          	add	t6,a4,t6

0000c894 <.LVL251>:
    c894:	005787b3          	add	a5,a5,t0

0000c898 <.LBB128>:
    c898:	00d5b6b3          	sltu	a3,a1,a3

0000c89c <.LVL253>:
    c89c:	00df86b3          	add	a3,t6,a3

0000c8a0 <.LVL254>:
    c8a0:	00f587b3          	add	a5,a1,a5

0000c8a4 <.LBB132>:
    c8a4:	037b0b33          	mul	s6,s6,s7

0000c8a8 <.LBB133>:
    c8a8:	00efb733          	sltu	a4,t6,a4

0000c8ac <.LVL257>:
    c8ac:	01c68e33          	add	t3,a3,t3

0000c8b0 <.LVL258>:
    c8b0:	01f6bfb3          	sltu	t6,a3,t6

0000c8b4 <.LBB134>:
    c8b4:	06f12223          	sw	a5,100(sp)
    c8b8:	00b7b7b3          	sltu	a5,a5,a1

0000c8bc <.LBB135>:
    c8bc:	01f76533          	or	a0,a4,t6

0000c8c0 <.LBB136>:
    c8c0:	00fe07b3          	add	a5,t3,a5

0000c8c4 <.LBB137>:
    c8c4:	01085713          	srl	a4,a6,0x10

0000c8c8 <.LBB138>:
    c8c8:	00de36b3          	sltu	a3,t3,a3

0000c8cc <.LVL260>:
    c8cc:	015b0b33          	add	s6,s6,s5
    c8d0:	01c7be33          	sltu	t3,a5,t3

0000c8d4 <.LBB139>:
    c8d4:	01670733          	add	a4,a4,s6

0000c8d8 <.LBB140>:
    c8d8:	01c6e6b3          	or	a3,a3,t3

0000c8dc <.LBB141>:
    c8dc:	01577463          	bgeu	a4,s5,c8e4 <.L135>
    c8e0:	00990933          	add	s2,s2,s1

0000c8e4 <.L135>:
    c8e4:	01075593          	srl	a1,a4,0x10
    c8e8:	00a585b3          	add	a1,a1,a0

0000c8ec <.LBB142>:
    c8ec:	00010537          	lui	a0,0x10

0000c8f0 <.LVL264>:
    c8f0:	fff50513          	add	a0,a0,-1 # ffff <.LVL314+0x7>
    c8f4:	00a77733          	and	a4,a4,a0

0000c8f8 <.LVL265>:
    c8f8:	01071713          	sll	a4,a4,0x10
    c8fc:	00a87833          	and	a6,a6,a0

0000c900 <.LVL266>:
    c900:	01070733          	add	a4,a4,a6
    c904:	00e78733          	add	a4,a5,a4

0000c908 <.LBB144>:
    c908:	00d586b3          	add	a3,a1,a3

0000c90c <.LVL268>:
    c90c:	00f737b3          	sltu	a5,a4,a5
    c910:	00f687b3          	add	a5,a3,a5
    c914:	012787b3          	add	a5,a5,s2
    c918:	06f12623          	sw	a5,108(sp)

0000c91c <.LBB146>:
    c91c:	01012783          	lw	a5,16(sp)
    c920:	00d31313          	sll	t1,t1,0xd

0000c924 <.LBB145>:
    c924:	06e12423          	sw	a4,104(sp)

0000c928 <.LBB148>:
    c928:	00c7e7b3          	or	a5,a5,a2

0000c92c <.LVL270>:
    c92c:	0147e7b3          	or	a5,a5,s4

0000c930 <.LVL271>:
    c930:	00f36333          	or	t1,t1,a5

0000c934 <.LVL272>:
    c934:	06010613          	add	a2,sp,96
    c938:	05010793          	add	a5,sp,80

0000c93c <.L138>:
    c93c:	00c7a703          	lw	a4,12(a5)
    c940:	0107a683          	lw	a3,16(a5)
    c944:	00478793          	add	a5,a5,4
    c948:	01375713          	srl	a4,a4,0x13
    c94c:	00d69693          	sll	a3,a3,0xd
    c950:	00d76733          	or	a4,a4,a3
    c954:	fee7ae23          	sw	a4,-4(a5)
    c958:	fef612e3          	bne	a2,a5,c93c <.L138>
    c95c:	05012783          	lw	a5,80(sp)
    c960:	00603333          	snez	t1,t1

0000c964 <.LBE148>:
    c964:	05c12703          	lw	a4,92(sp)

0000c968 <.LBB149>:
    c968:	00f36333          	or	t1,t1,a5

0000c96c <.LBE149>:
    c96c:	05812783          	lw	a5,88(sp)
    c970:	04e12623          	sw	a4,76(sp)
    c974:	04612023          	sw	t1,64(sp)

0000c978 <.LBB150>:
    c978:	04f12423          	sw	a5,72(sp)
    c97c:	05412783          	lw	a5,84(sp)
    c980:	04f12223          	sw	a5,68(sp)

0000c984 <.LBE150>:
    c984:	00b71793          	sll	a5,a4,0xb
    c988:	0407d863          	bgez	a5,c9d8 <.L139>

0000c98c <.LBB151>:
    c98c:	01f31313          	sll	t1,t1,0x1f

0000c990 <.LVL276>:
    c990:	04010793          	add	a5,sp,64
    c994:	04c10593          	add	a1,sp,76

0000c998 <.L140>:
    c998:	0007a683          	lw	a3,0(a5)
    c99c:	0047a603          	lw	a2,4(a5)
    c9a0:	00478793          	add	a5,a5,4
    c9a4:	0016d693          	srl	a3,a3,0x1
    c9a8:	01f61613          	sll	a2,a2,0x1f
    c9ac:	00c6e6b3          	or	a3,a3,a2
    c9b0:	fed7ae23          	sw	a3,-4(a5)
    c9b4:	fef592e3          	bne	a1,a5,c998 <.L140>

0000c9b8 <.LBE152>:
    c9b8:	04012783          	lw	a5,64(sp)

0000c9bc <.LBB153>:
    c9bc:	00603333          	snez	t1,t1

0000c9c0 <.LVL279>:
    c9c0:	00175713          	srl	a4,a4,0x1

0000c9c4 <.LBE153>:
    c9c4:	0067e7b3          	or	a5,a5,t1
    c9c8:	04f12023          	sw	a5,64(sp)

0000c9cc <.LBE151>:
    c9cc:	00812783          	lw	a5,8(sp)

0000c9d0 <.LBB154>:
    c9d0:	04e12623          	sw	a4,76(sp)

0000c9d4 <.LBE154>:
    c9d4:	00f12623          	sw	a5,12(sp)

0000c9d8 <.L139>:
    c9d8:	00c12783          	lw	a5,12(sp)
    c9dc:	00f12423          	sw	a5,8(sp)
    c9e0:	3780006f          	j	cd58 <.L173>

0000c9e4 <.L2>:
  FP_UNPACK_Q (A, a);
    c9e4:	00a7e633          	or	a2,a5,a0
    c9e8:	00d66633          	or	a2,a2,a3
    c9ec:	00e66633          	or	a2,a2,a4
    c9f0:	14060463          	beqz	a2,cb38 <.L174>

0000c9f4 <.LBB156>:
    c9f4:	0a070063          	beqz	a4,ca94 <.L6>
    c9f8:	00070513          	mv	a0,a4
    c9fc:	c19f40ef          	jal	1614 <__clzsi2>

0000ca00 <.L7>:
    ca00:	ff450713          	add	a4,a0,-12
    ca04:	40575593          	sra	a1,a4,0x5

0000ca08 <.LVL284>:
    ca08:	01f77713          	and	a4,a4,31

0000ca0c <.LVL285>:
    ca0c:	0a070e63          	beqz	a4,cac8 <.L10>
    ca10:	ffc00693          	li	a3,-4
    ca14:	02d586b3          	mul	a3,a1,a3
    ca18:	02000813          	li	a6,32
    ca1c:	02010313          	add	t1,sp,32
    ca20:	40e80833          	sub	a6,a6,a4

0000ca24 <.LVL286>:
    ca24:	00c68793          	add	a5,a3,12 # 1000c <.LVL315>
    ca28:	00f307b3          	add	a5,t1,a5
    ca2c:	40d006b3          	neg	a3,a3

0000ca30 <.L11>:
    ca30:	0cf31463          	bne	t1,a5,caf8 <.L14>
    ca34:	fff58793          	add	a5,a1,-1

0000ca38 <.LVL287>:
    ca38:	00259593          	sll	a1,a1,0x2

0000ca3c <.LVL288>:
    ca3c:	05058693          	add	a3,a1,80
    ca40:	02010613          	add	a2,sp,32
    ca44:	00c685b3          	add	a1,a3,a2
    ca48:	02012683          	lw	a3,32(sp)
    ca4c:	00e69733          	sll	a4,a3,a4

0000ca50 <.LVL289>:
    ca50:	fae5a823          	sw	a4,-80(a1)

0000ca54 <.L15>:
    ca54:	00178793          	add	a5,a5,1
    ca58:	00279793          	sll	a5,a5,0x2
    ca5c:	00800693          	li	a3,8
    ca60:	02010713          	add	a4,sp,32
    ca64:	00d7ea63          	bltu	a5,a3,ca78 <.L16>
    ca68:	02012023          	sw	zero,32(sp)
    ca6c:	00072223          	sw	zero,4(a4)
    ca70:	ff878793          	add	a5,a5,-8
    ca74:	02810713          	add	a4,sp,40

0000ca78 <.L16>:
    ca78:	00400693          	li	a3,4
    ca7c:	00d7e463          	bltu	a5,a3,ca84 <.L17>
    ca80:	00072023          	sw	zero,0(a4)

0000ca84 <.L17>:
    ca84:	ffffc4b7          	lui	s1,0xffffc

0000ca88 <.LVL291>:
    ca88:	01148493          	add	s1,s1,17 # ffffc011 <_ebss+0xfffe6121>
    ca8c:	40a484b3          	sub	s1,s1,a0
    ca90:	f20ff06f          	j	c1b0 <.L209>

0000ca94 <.L6>:
    ca94:	00068a63          	beqz	a3,caa8 <.L8>
    ca98:	00068513          	mv	a0,a3
    ca9c:	b79f40ef          	jal	1614 <__clzsi2>

0000caa0 <.LVL293>:
    caa0:	02050513          	add	a0,a0,32
    caa4:	f5dff06f          	j	ca00 <.L7>

0000caa8 <.L8>:
    caa8:	00050863          	beqz	a0,cab8 <.L9>
    caac:	b69f40ef          	jal	1614 <__clzsi2>

0000cab0 <.LVL296>:
    cab0:	04050513          	add	a0,a0,64
    cab4:	f4dff06f          	j	ca00 <.L7>

0000cab8 <.L9>:
    cab8:	00078513          	mv	a0,a5
    cabc:	b59f40ef          	jal	1614 <__clzsi2>

0000cac0 <.LVL299>:
    cac0:	06050513          	add	a0,a0,96
    cac4:	f3dff06f          	j	ca00 <.L7>

0000cac8 <.L10>:
    cac8:	ffc00693          	li	a3,-4
    cacc:	02d586b3          	mul	a3,a1,a3
    cad0:	02c10793          	add	a5,sp,44

0000cad4 <.LBB10>:
    cad4:	00300713          	li	a4,3

0000cad8 <.L12>:
    cad8:	00d78633          	add	a2,a5,a3
    cadc:	00062603          	lw	a2,0(a2)
    cae0:	fff70713          	add	a4,a4,-1

0000cae4 <.LVL303>:
    cae4:	ffc78793          	add	a5,a5,-4
    cae8:	00c7a223          	sw	a2,4(a5)

0000caec <.LVL304>:
    caec:	feb756e3          	bge	a4,a1,cad8 <.L12>
    caf0:	fff58793          	add	a5,a1,-1
    caf4:	f61ff06f          	j	ca54 <.L15>

0000caf8 <.L14>:
    caf8:	0007a603          	lw	a2,0(a5)
    cafc:	ffc7a883          	lw	a7,-4(a5)
    cb00:	00d78e33          	add	t3,a5,a3
    cb04:	00e61633          	sll	a2,a2,a4
    cb08:	0108d8b3          	srl	a7,a7,a6
    cb0c:	01166633          	or	a2,a2,a7
    cb10:	00ce2023          	sw	a2,0(t3)
    cb14:	ffc78793          	add	a5,a5,-4
    cb18:	f19ff06f          	j	ca30 <.L11>

0000cb1c <.L3>:
    cb1c:	00a7e7b3          	or	a5,a5,a0
    cb20:	00d7e7b3          	or	a5,a5,a3
    cb24:	00e7e7b3          	or	a5,a5,a4
    cb28:	00200b93          	li	s7,2
    cb2c:	e8078463          	beqz	a5,c1b4 <.L5>
    cb30:	00300b93          	li	s7,3
    cb34:	e80ff06f          	j	c1b4 <.L5>

0000cb38 <.L174>:
    cb38:	00000493          	li	s1,0

0000cb3c <.LBE157>:
    cb3c:	00100b93          	li	s7,1
    cb40:	e74ff06f          	j	c1b4 <.L5>

0000cb44 <.L18>:
  FP_UNPACK_Q (B, b);
    cb44:	016967b3          	or	a5,s2,s6

0000cb48 <.LVL309>:
    cb48:	0157e7b3          	or	a5,a5,s5
    cb4c:	00a7e7b3          	or	a5,a5,a0
    cb50:	14078463          	beqz	a5,cc98 <.L176>

0000cb54 <.LBB158>:
    cb54:	08050e63          	beqz	a0,cbf0 <.L22>
    cb58:	abdf40ef          	jal	1614 <__clzsi2>

0000cb5c <.L23>:
    cb5c:	ff450693          	add	a3,a0,-12
    cb60:	4056d793          	sra	a5,a3,0x5

0000cb64 <.LVL311>:
    cb64:	01f6f693          	and	a3,a3,31

0000cb68 <.LVL312>:
    cb68:	0c068063          	beqz	a3,cc28 <.L26>
    cb6c:	ffc00613          	li	a2,-4
    cb70:	02c78633          	mul	a2,a5,a2
    cb74:	02000813          	li	a6,32
    cb78:	03010313          	add	t1,sp,48
    cb7c:	40d80833          	sub	a6,a6,a3

0000cb80 <.LVL313>:
    cb80:	00c60713          	add	a4,a2,12
    cb84:	00e30733          	add	a4,t1,a4
    cb88:	40c00633          	neg	a2,a2

0000cb8c <.L27>:
    cb8c:	0ce31663          	bne	t1,a4,cc58 <.L30>
    cb90:	fff78713          	add	a4,a5,-1

0000cb94 <.LVL314>:
    cb94:	00279793          	sll	a5,a5,0x2

0000cb98 <.LVL315>:
    cb98:	02010613          	add	a2,sp,32
    cb9c:	05078793          	add	a5,a5,80
    cba0:	00c787b3          	add	a5,a5,a2
    cba4:	03012603          	lw	a2,48(sp)
    cba8:	00d616b3          	sll	a3,a2,a3

0000cbac <.LVL316>:
    cbac:	fcd7a023          	sw	a3,-64(a5)

0000cbb0 <.L31>:
    cbb0:	00170793          	add	a5,a4,1
    cbb4:	00279793          	sll	a5,a5,0x2
    cbb8:	00800693          	li	a3,8
    cbbc:	03010713          	add	a4,sp,48
    cbc0:	00d7ea63          	bltu	a5,a3,cbd4 <.L32>
    cbc4:	02012823          	sw	zero,48(sp)
    cbc8:	00072223          	sw	zero,4(a4)
    cbcc:	ff878793          	add	a5,a5,-8
    cbd0:	03810713          	add	a4,sp,56

0000cbd4 <.L32>:
    cbd4:	00400693          	li	a3,4
    cbd8:	00d7e463          	bltu	a5,a3,cbe0 <.L33>
    cbdc:	00072023          	sw	zero,0(a4)

0000cbe0 <.L33>:
    cbe0:	ffffc7b7          	lui	a5,0xffffc
    cbe4:	01178793          	add	a5,a5,17 # ffffc011 <_ebss+0xfffe6121>
    cbe8:	40a787b3          	sub	a5,a5,a0
    cbec:	e54ff06f          	j	c240 <.L210>

0000cbf0 <.L22>:
    cbf0:	000a8a63          	beqz	s5,cc04 <.L24>
    cbf4:	000a8513          	mv	a0,s5
    cbf8:	a1df40ef          	jal	1614 <__clzsi2>

0000cbfc <.LVL319>:
    cbfc:	02050513          	add	a0,a0,32
    cc00:	f5dff06f          	j	cb5c <.L23>

0000cc04 <.L24>:
    cc04:	000b0a63          	beqz	s6,cc18 <.L25>
    cc08:	000b0513          	mv	a0,s6
    cc0c:	a09f40ef          	jal	1614 <__clzsi2>

0000cc10 <.LVL322>:
    cc10:	04050513          	add	a0,a0,64
    cc14:	f49ff06f          	j	cb5c <.L23>

0000cc18 <.L25>:
    cc18:	00090513          	mv	a0,s2
    cc1c:	9f9f40ef          	jal	1614 <__clzsi2>

0000cc20 <.LVL325>:
    cc20:	06050513          	add	a0,a0,96
    cc24:	f39ff06f          	j	cb5c <.L23>

0000cc28 <.L26>:
    cc28:	ffc00613          	li	a2,-4
    cc2c:	02c78633          	mul	a2,a5,a2
    cc30:	03c10713          	add	a4,sp,60

0000cc34 <.LBB17>:
    cc34:	00300693          	li	a3,3

0000cc38 <.L28>:
    cc38:	00c705b3          	add	a1,a4,a2
    cc3c:	0005a583          	lw	a1,0(a1)
    cc40:	fff68693          	add	a3,a3,-1

0000cc44 <.LVL329>:
    cc44:	ffc70713          	add	a4,a4,-4
    cc48:	00b72223          	sw	a1,4(a4)

0000cc4c <.LVL330>:
    cc4c:	fef6d6e3          	bge	a3,a5,cc38 <.L28>
    cc50:	fff78713          	add	a4,a5,-1
    cc54:	f5dff06f          	j	cbb0 <.L31>

0000cc58 <.L30>:
    cc58:	00072583          	lw	a1,0(a4)
    cc5c:	ffc72883          	lw	a7,-4(a4)
    cc60:	00c70e33          	add	t3,a4,a2
    cc64:	00d595b3          	sll	a1,a1,a3
    cc68:	0108d8b3          	srl	a7,a7,a6
    cc6c:	0115e5b3          	or	a1,a1,a7
    cc70:	00be2023          	sw	a1,0(t3)
    cc74:	ffc70713          	add	a4,a4,-4
    cc78:	f15ff06f          	j	cb8c <.L27>

0000cc7c <.L19>:
    cc7c:	01696933          	or	s2,s2,s6
    cc80:	01596933          	or	s2,s2,s5
    cc84:	00a96933          	or	s2,s2,a0
    cc88:	00200693          	li	a3,2
    cc8c:	da090c63          	beqz	s2,c244 <.L21>
    cc90:	00300693          	li	a3,3
    cc94:	db0ff06f          	j	c244 <.L21>

0000cc98 <.L176>:
    cc98:	00000793          	li	a5,0

0000cc9c <.LBE159>:
    cc9c:	00100693          	li	a3,1
    cca0:	da4ff06f          	j	c244 <.L21>

0000cca4 <.L35>:
    cca4:	00100713          	li	a4,1
    cca8:	00f717b3          	sll	a5,a4,a5
  FP_MUL_Q (R, A, B);
    ccac:	5307f713          	and	a4,a5,1328
    ccb0:	06071863          	bnez	a4,cd20 <.L38>
    ccb4:	0887f713          	and	a4,a5,136
    ccb8:	04071063          	bnez	a4,ccf8 <.L39>
    ccbc:	2407f793          	and	a5,a5,576
    ccc0:	dc078063          	beqz	a5,c280 <.L36>

0000ccc4 <.L40>:
  FP_PACK_Q (r, R);
    ccc4:	000087b7          	lui	a5,0x8
    ccc8:	04f12623          	sw	a5,76(sp)
    cccc:	04012423          	sw	zero,72(sp)
    ccd0:	04012223          	sw	zero,68(sp)
    ccd4:	04012023          	sw	zero,64(sp)

0000ccd8 <.LVL336>:
    ccd8:	fff78793          	add	a5,a5,-1 # 7fff <__kernel_rem_pio2+0x5f>
    ccdc:	00012223          	sw	zero,4(sp)
    cce0:	1440006f          	j	ce24 <.L153>

0000cce4 <.L34>:
  FP_MUL_Q (R, A, B);
    cce4:	00f00713          	li	a4,15
    cce8:	fce78ee3          	beq	a5,a4,ccc4 <.L40>
    ccec:	00b00713          	li	a4,11

0000ccf0 <.LBB160>:
  FP_UNPACK_Q (A, a);
    ccf0:	01412223          	sw	s4,4(sp)

0000ccf4 <.LBE160>:
  FP_MUL_Q (R, A, B);
    ccf4:	02e79663          	bne	a5,a4,cd20 <.L38>

0000ccf8 <.L39>:
  FP_UNPACK_Q (B, b);
    ccf8:	01312223          	sw	s3,4(sp)

0000ccfc <.L37>:
  FP_MUL_Q (R, A, B);
    ccfc:	03012783          	lw	a5,48(sp)
    cd00:	00068b93          	mv	s7,a3

0000cd04 <.LVL339>:
    cd04:	04f12023          	sw	a5,64(sp)
    cd08:	03412783          	lw	a5,52(sp)
    cd0c:	04f12223          	sw	a5,68(sp)
    cd10:	03812783          	lw	a5,56(sp)
    cd14:	04f12423          	sw	a5,72(sp)
    cd18:	03c12783          	lw	a5,60(sp)

0000cd1c <.LVL340>:
    cd1c:	0200006f          	j	cd3c <.L141>

0000cd20 <.L38>:
    cd20:	02012783          	lw	a5,32(sp)
    cd24:	04f12023          	sw	a5,64(sp)
    cd28:	02412783          	lw	a5,36(sp)
    cd2c:	04f12223          	sw	a5,68(sp)
    cd30:	02812783          	lw	a5,40(sp)
    cd34:	04f12423          	sw	a5,72(sp)
    cd38:	02c12783          	lw	a5,44(sp)

0000cd3c <.L141>:
    cd3c:	04f12623          	sw	a5,76(sp)
  FP_PACK_Q (r, R);
    cd40:	00200793          	li	a5,2
    cd44:	36fb8663          	beq	s7,a5,d0b0 <.L142>
    cd48:	00300793          	li	a5,3
    cd4c:	f6fb8ce3          	beq	s7,a5,ccc4 <.L40>
    cd50:	00100793          	li	a5,1
    cd54:	34fb8463          	beq	s7,a5,d09c <.L211>

0000cd58 <.L173>:
    cd58:	00812703          	lw	a4,8(sp)
    cd5c:	000047b7          	lui	a5,0x4
    cd60:	fff78793          	add	a5,a5,-1 # 3fff <_dl_aux_init+0x3>
    cd64:	00f707b3          	add	a5,a4,a5

0000cd68 <.LVL344>:
    cd68:	12f05a63          	blez	a5,ce9c <.L144>
    cd6c:	04012703          	lw	a4,64(sp)
    cd70:	00777693          	and	a3,a4,7
    cd74:	04068463          	beqz	a3,cdbc <.L145>
    cd78:	00f77693          	and	a3,a4,15
    cd7c:	00400613          	li	a2,4
    cd80:	02c68e63          	beq	a3,a2,cdbc <.L145>

0000cd84 <.LBB162>:
    cd84:	00470713          	add	a4,a4,4
    cd88:	00473693          	sltiu	a3,a4,4
    cd8c:	04e12023          	sw	a4,64(sp)

0000cd90 <.LVL345>:
    cd90:	04412703          	lw	a4,68(sp)

0000cd94 <.LVL346>:
    cd94:	00e68733          	add	a4,a3,a4
    cd98:	04e12223          	sw	a4,68(sp)

0000cd9c <.LVL347>:
    cd9c:	00d73733          	sltu	a4,a4,a3

0000cda0 <.LVL348>:
    cda0:	04812683          	lw	a3,72(sp)
    cda4:	00e68733          	add	a4,a3,a4

0000cda8 <.LVL349>:
    cda8:	04e12423          	sw	a4,72(sp)

0000cdac <.LVL350>:
    cdac:	00d73733          	sltu	a4,a4,a3

0000cdb0 <.LVL351>:
    cdb0:	04c12683          	lw	a3,76(sp)
    cdb4:	00d70733          	add	a4,a4,a3

0000cdb8 <.LVL352>:
    cdb8:	04e12623          	sw	a4,76(sp)

0000cdbc <.L145>:
    cdbc:	04c12703          	lw	a4,76(sp)
    cdc0:	00b71693          	sll	a3,a4,0xb
    cdc4:	0206d063          	bgez	a3,cde4 <.L150>
    cdc8:	fff007b7          	lui	a5,0xfff00

0000cdcc <.LVL354>:
    cdcc:	fff78793          	add	a5,a5,-1 # ffefffff <_ebss+0xffeea10f>
    cdd0:	00f77733          	and	a4,a4,a5
    cdd4:	04e12623          	sw	a4,76(sp)
    cdd8:	00812703          	lw	a4,8(sp)
    cddc:	000047b7          	lui	a5,0x4

0000cde0 <.LVL355>:
    cde0:	00f707b3          	add	a5,a4,a5

0000cde4 <.L150>:
    cde4:	04010713          	add	a4,sp,64
    cde8:	04c10593          	add	a1,sp,76

0000cdec <.L151>:
    cdec:	00072683          	lw	a3,0(a4)
    cdf0:	00472603          	lw	a2,4(a4)
    cdf4:	00470713          	add	a4,a4,4
    cdf8:	0036d693          	srl	a3,a3,0x3
    cdfc:	01d61613          	sll	a2,a2,0x1d
    ce00:	00c6e6b3          	or	a3,a3,a2
    ce04:	fed72e23          	sw	a3,-4(a4)
    ce08:	fee592e3          	bne	a1,a4,cdec <.L151>

0000ce0c <.LBE163>:
    ce0c:	000086b7          	lui	a3,0x8
    ce10:	ffe68693          	add	a3,a3,-2 # 7ffe <__kernel_rem_pio2+0x5e>

0000ce14 <.LBB164>:
    ce14:	04c12703          	lw	a4,76(sp)

0000ce18 <.LBE164>:
    ce18:	28f6cc63          	blt	a3,a5,d0b0 <.L142>

0000ce1c <.LBB165>:
    ce1c:	00375713          	srl	a4,a4,0x3
    ce20:	04e12623          	sw	a4,76(sp)

0000ce24 <.L153>:
    ce24:	04c12703          	lw	a4,76(sp)

0000ce28 <.LBE166>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    ce28:	0ac12083          	lw	ra,172(sp)
    ce2c:	00040513          	mv	a0,s0

0000ce30 <.LBB167>:
  FP_PACK_Q (r, R);
    ce30:	04e11e23          	sh	a4,92(sp)
    ce34:	00412703          	lw	a4,4(sp)

0000ce38 <.LBE167>:
}
    ce38:	0a412483          	lw	s1,164(sp)
    ce3c:	0a012903          	lw	s2,160(sp)

0000ce40 <.LBB168>:
  FP_PACK_Q (r, R);
    ce40:	00f71713          	sll	a4,a4,0xf
    ce44:	00f767b3          	or	a5,a4,a5

0000ce48 <.LVL360>:
    ce48:	04f11f23          	sh	a5,94(sp)

0000ce4c <.LBE168>:
  return r;
    ce4c:	04012783          	lw	a5,64(sp)
}
    ce50:	09c12983          	lw	s3,156(sp)
    ce54:	09812a03          	lw	s4,152(sp)
  return r;
    ce58:	00f42023          	sw	a5,0(s0)
    ce5c:	04412783          	lw	a5,68(sp)
}
    ce60:	09412a83          	lw	s5,148(sp)
    ce64:	09012b03          	lw	s6,144(sp)
  return r;
    ce68:	00f42223          	sw	a5,4(s0)
    ce6c:	04812783          	lw	a5,72(sp)
}
    ce70:	08c12b83          	lw	s7,140(sp)
    ce74:	08812c03          	lw	s8,136(sp)
  return r;
    ce78:	00f42423          	sw	a5,8(s0)
    ce7c:	05c12783          	lw	a5,92(sp)
}
    ce80:	08412c83          	lw	s9,132(sp)
    ce84:	08012d03          	lw	s10,128(sp)
  return r;
    ce88:	00f42623          	sw	a5,12(s0)
}
    ce8c:	0a812403          	lw	s0,168(sp)
    ce90:	07c12d83          	lw	s11,124(sp)
    ce94:	0b010113          	add	sp,sp,176

0000ce98 <.LVL363>:
    ce98:	00008067          	ret

0000ce9c <.L144>:
  FP_PACK_Q (r, R);
    ce9c:	00100693          	li	a3,1
    cea0:	40f686b3          	sub	a3,a3,a5

0000cea4 <.LVL365>:
    cea4:	07400793          	li	a5,116
    cea8:	1cd7ca63          	blt	a5,a3,d07c <.L154>

0000ceac <.LBB170>:
    ceac:	04010613          	add	a2,sp,64
    ceb0:	4056d713          	sra	a4,a3,0x5

0000ceb4 <.LVL367>:
    ceb4:	00060513          	mv	a0,a2
    ceb8:	01f6f693          	and	a3,a3,31

0000cebc <.LVL368>:
    cebc:	00000793          	li	a5,0
    cec0:	00000593          	li	a1,0

0000cec4 <.L155>:
    cec4:	02e59e63          	bne	a1,a4,cf00 <.L156>
    cec8:	00300593          	li	a1,3

0000cecc <.LVL370>:
    cecc:	40e585b3          	sub	a1,a1,a4
    ced0:	00271513          	sll	a0,a4,0x2
    ced4:	04069063          	bnez	a3,cf14 <.L157>
    ced8:	00060813          	mv	a6,a2

0000cedc <.L158>:
    cedc:	00a808b3          	add	a7,a6,a0
    cee0:	0008a883          	lw	a7,0(a7)
    cee4:	00168693          	add	a3,a3,1

0000cee8 <.LVL372>:
    cee8:	00480813          	add	a6,a6,4
    ceec:	ff182e23          	sw	a7,-4(a6)

0000cef0 <.LVL373>:
    cef0:	fed5d6e3          	bge	a1,a3,cedc <.L158>
    cef4:	00400693          	li	a3,4

0000cef8 <.LVL374>:
    cef8:	40e68733          	sub	a4,a3,a4

0000cefc <.LVL375>:
    cefc:	06c0006f          	j	cf68 <.L162>

0000cf00 <.L156>:
    cf00:	00052803          	lw	a6,0(a0)
    cf04:	00158593          	add	a1,a1,1

0000cf08 <.LVL377>:
    cf08:	00450513          	add	a0,a0,4
    cf0c:	0107e7b3          	or	a5,a5,a6

0000cf10 <.LVL378>:
    cf10:	fb5ff06f          	j	cec4 <.L155>

0000cf14 <.L157>:
    cf14:	05050813          	add	a6,a0,80
    cf18:	02010893          	add	a7,sp,32
    cf1c:	01180833          	add	a6,a6,a7
    cf20:	fd082803          	lw	a6,-48(a6)
    cf24:	02000313          	li	t1,32
    cf28:	40d30333          	sub	t1,t1,a3
    cf2c:	00681833          	sll	a6,a6,t1
    cf30:	0107e7b3          	or	a5,a5,a6

0000cf34 <.LVL380>:
    cf34:	00000e13          	li	t3,0
    cf38:	00a60833          	add	a6,a2,a0
    cf3c:	40a00533          	neg	a0,a0

0000cf40 <.L160>:
    cf40:	0ebe4063          	blt	t3,a1,d020 <.L161>
    cf44:	00400513          	li	a0,4
    cf48:	00259593          	sll	a1,a1,0x2
    cf4c:	40e50733          	sub	a4,a0,a4

0000cf50 <.LVL382>:
    cf50:	05058593          	add	a1,a1,80
    cf54:	02010513          	add	a0,sp,32
    cf58:	00a585b3          	add	a1,a1,a0
    cf5c:	04c12503          	lw	a0,76(sp)
    cf60:	00d556b3          	srl	a3,a0,a3

0000cf64 <.LVL383>:
    cf64:	fcd5a823          	sw	a3,-48(a1)

0000cf68 <.L162>:
    cf68:	00400693          	li	a3,4
    cf6c:	40e686b3          	sub	a3,a3,a4
    cf70:	00269693          	sll	a3,a3,0x2
    cf74:	00271713          	sll	a4,a4,0x2
    cf78:	00800593          	li	a1,8
    cf7c:	00e60733          	add	a4,a2,a4
    cf80:	00b6ea63          	bltu	a3,a1,cf94 <.L163>
    cf84:	00072023          	sw	zero,0(a4)
    cf88:	00072223          	sw	zero,4(a4)
    cf8c:	ff868693          	add	a3,a3,-8
    cf90:	00870713          	add	a4,a4,8

0000cf94 <.L163>:
    cf94:	00400593          	li	a1,4
    cf98:	00b6e463          	bltu	a3,a1,cfa0 <.L164>
    cf9c:	00072023          	sw	zero,0(a4)

0000cfa0 <.L164>:
    cfa0:	04012703          	lw	a4,64(sp)

0000cfa4 <.LBB172>:
    cfa4:	00f037b3          	snez	a5,a5

0000cfa8 <.LBE172>:
    cfa8:	00e7e7b3          	or	a5,a5,a4
    cfac:	04f12023          	sw	a5,64(sp)

0000cfb0 <.LBE170>:
    cfb0:	0077f713          	and	a4,a5,7
    cfb4:	04070463          	beqz	a4,cffc <.L165>
    cfb8:	00f7f713          	and	a4,a5,15
    cfbc:	00400693          	li	a3,4
    cfc0:	02d70e63          	beq	a4,a3,cffc <.L165>

0000cfc4 <.LBB174>:
    cfc4:	04412703          	lw	a4,68(sp)
    cfc8:	00478793          	add	a5,a5,4 # 4004 <_dl_aux_init+0x8>
    cfcc:	04f12023          	sw	a5,64(sp)

0000cfd0 <.LVL386>:
    cfd0:	0047b793          	sltiu	a5,a5,4

0000cfd4 <.LVL387>:
    cfd4:	00f707b3          	add	a5,a4,a5
    cfd8:	04f12223          	sw	a5,68(sp)

0000cfdc <.LVL388>:
    cfdc:	00e7b7b3          	sltu	a5,a5,a4

0000cfe0 <.LVL389>:
    cfe0:	04812703          	lw	a4,72(sp)
    cfe4:	00f707b3          	add	a5,a4,a5

0000cfe8 <.LVL390>:
    cfe8:	04f12423          	sw	a5,72(sp)

0000cfec <.LVL391>:
    cfec:	00e7b7b3          	sltu	a5,a5,a4

0000cff0 <.LVL392>:
    cff0:	04c12703          	lw	a4,76(sp)
    cff4:	00e787b3          	add	a5,a5,a4

0000cff8 <.LVL393>:
    cff8:	04f12623          	sw	a5,76(sp)

0000cffc <.L165>:
    cffc:	04c12703          	lw	a4,76(sp)
    d000:	00c71793          	sll	a5,a4,0xc
    d004:	0407d263          	bgez	a5,d048 <.L170>

0000d008 <.LVL395>:
    d008:	04012623          	sw	zero,76(sp)
    d00c:	04012423          	sw	zero,72(sp)
    d010:	04012223          	sw	zero,68(sp)
    d014:	04012023          	sw	zero,64(sp)
    d018:	00100793          	li	a5,1

0000d01c <.LVL396>:
    d01c:	e09ff06f          	j	ce24 <.L153>

0000d020 <.L161>:
    d020:	00082883          	lw	a7,0(a6)
    d024:	00482e83          	lw	t4,4(a6)
    d028:	00a80f33          	add	t5,a6,a0
    d02c:	00d8d8b3          	srl	a7,a7,a3
    d030:	006e9eb3          	sll	t4,t4,t1
    d034:	01d8e8b3          	or	a7,a7,t4
    d038:	011f2023          	sw	a7,0(t5)

0000d03c <.LVL398>:
    d03c:	001e0e13          	add	t3,t3,1

0000d040 <.LVL399>:
    d040:	00480813          	add	a6,a6,4
    d044:	efdff06f          	j	cf40 <.L160>

0000d048 <.L170>:
    d048:	00c60593          	add	a1,a2,12

0000d04c <.L171>:
    d04c:	00062783          	lw	a5,0(a2)
    d050:	00462683          	lw	a3,4(a2)
    d054:	00460613          	add	a2,a2,4
    d058:	0037d793          	srl	a5,a5,0x3
    d05c:	01d69693          	sll	a3,a3,0x1d
    d060:	00d7e7b3          	or	a5,a5,a3
    d064:	fef62e23          	sw	a5,-4(a2)
    d068:	fec592e3          	bne	a1,a2,d04c <.L171>

0000d06c <.LVL402>:
    d06c:	00375713          	srl	a4,a4,0x3
    d070:	04e12623          	sw	a4,76(sp)

0000d074 <.L172>:
    d074:	00000793          	li	a5,0
    d078:	dadff06f          	j	ce24 <.L153>

0000d07c <.L154>:
    d07c:	04412703          	lw	a4,68(sp)
    d080:	04012783          	lw	a5,64(sp)
    d084:	00e7e7b3          	or	a5,a5,a4
    d088:	04812703          	lw	a4,72(sp)
    d08c:	00e7e7b3          	or	a5,a5,a4
    d090:	04c12703          	lw	a4,76(sp)
    d094:	00e7e7b3          	or	a5,a5,a4
    d098:	fc078ee3          	beqz	a5,d074 <.L172>

0000d09c <.L211>:
    d09c:	04012623          	sw	zero,76(sp)
    d0a0:	04012423          	sw	zero,72(sp)
    d0a4:	04012223          	sw	zero,68(sp)

0000d0a8 <.LBB178>:
    d0a8:	04012023          	sw	zero,64(sp)
    d0ac:	fc9ff06f          	j	d074 <.L172>

0000d0b0 <.L142>:
    d0b0:	000087b7          	lui	a5,0x8
    d0b4:	04012623          	sw	zero,76(sp)
    d0b8:	04012423          	sw	zero,72(sp)
    d0bc:	04012223          	sw	zero,68(sp)
    d0c0:	04012023          	sw	zero,64(sp)
    d0c4:	fff78793          	add	a5,a5,-1 # 7fff <__kernel_rem_pio2+0x5f>
    d0c8:	d5dff06f          	j	ce24 <.L153>

0000d0cc <__subtf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__subtf3 (TFtype a, TFtype b)
{
    d0cc:	f9010113          	add	sp,sp,-112
    d0d0:	0085a703          	lw	a4,8(a1)
    d0d4:	05512a23          	sw	s5,84(sp)
    d0d8:	00c5aa83          	lw	s5,12(a1)
    d0dc:	0005a783          	lw	a5,0(a1)
    d0e0:	0045a683          	lw	a3,4(a1)

0000d0e4 <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_Q (A, a);
    d0e4:	02e12c23          	sw	a4,56(sp)
    d0e8:	00e12c23          	sw	a4,24(sp)
    d0ec:	010a9713          	sll	a4,s5,0x10

0000d0f0 <.LBE3>:
{
    d0f0:	06912223          	sw	s1,100(sp)

0000d0f4 <.LBB4>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d0f4:	01075713          	srl	a4,a4,0x10
    d0f8:	001a9493          	sll	s1,s5,0x1

0000d0fc <.LBE4>:
{
    d0fc:	00462803          	lw	a6,4(a2)
    d100:	00862583          	lw	a1,8(a2)
    d104:	06812423          	sw	s0,104(sp)
    d108:	07212023          	sw	s2,96(sp)
    d10c:	00062403          	lw	s0,0(a2)
    d110:	00c62903          	lw	s2,12(a2)
    d114:	05412c23          	sw	s4,88(sp)

0000d118 <.LBB5>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d118:	03512e23          	sw	s5,60(sp)

0000d11c <.LBE5>:
{
    d11c:	00050a13          	mv	s4,a0
    d120:	06112623          	sw	ra,108(sp)
    d124:	05312e23          	sw	s3,92(sp)
    d128:	05612823          	sw	s6,80(sp)
    d12c:	05712623          	sw	s7,76(sp)
    d130:	05812423          	sw	s8,72(sp)

0000d134 <.LBB6>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d134:	02f12823          	sw	a5,48(sp)
    d138:	02d12a23          	sw	a3,52(sp)
    d13c:	00f12823          	sw	a5,16(sp)
    d140:	00d12a23          	sw	a3,20(sp)
    d144:	00e12e23          	sw	a4,28(sp)
    d148:	0114d493          	srl	s1,s1,0x11

0000d14c <.LVL1>:
    d14c:	01fada93          	srl	s5,s5,0x1f

0000d150 <.LBB7>:
    d150:	01010513          	add	a0,sp,16
    d154:	01c10613          	add	a2,sp,28

0000d158 <.L2>:
    d158:	00062703          	lw	a4,0(a2)
    d15c:	ffc62683          	lw	a3,-4(a2)
    d160:	ffc60613          	add	a2,a2,-4
    d164:	00371713          	sll	a4,a4,0x3
    d168:	01d6d693          	srl	a3,a3,0x1d
    d16c:	00d76733          	or	a4,a4,a3
    d170:	00e62223          	sw	a4,4(a2)
    d174:	fec512e3          	bne	a0,a2,d158 <.L2>

0000d178 <.LBB8>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    d178:	01091713          	sll	a4,s2,0x10
    d17c:	00191b93          	sll	s7,s2,0x1

0000d180 <.LBB9>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d180:	00379793          	sll	a5,a5,0x3

0000d184 <.LBB10>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    d184:	01075713          	srl	a4,a4,0x10
    d188:	03012a23          	sw	a6,52(sp)
    d18c:	03212e23          	sw	s2,60(sp)
    d190:	03012223          	sw	a6,36(sp)

0000d194 <.LBB11>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d194:	00f12823          	sw	a5,16(sp)

0000d198 <.LBB12>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    d198:	02812823          	sw	s0,48(sp)
    d19c:	02b12c23          	sw	a1,56(sp)
    d1a0:	02812023          	sw	s0,32(sp)
    d1a4:	02b12423          	sw	a1,40(sp)
    d1a8:	02e12623          	sw	a4,44(sp)
    d1ac:	011bdb93          	srl	s7,s7,0x11

0000d1b0 <.LVL6>:
    d1b0:	01f95913          	srl	s2,s2,0x1f

0000d1b4 <.LBB13>:
    d1b4:	02010813          	add	a6,sp,32
    d1b8:	02c10313          	add	t1,sp,44

0000d1bc <.L3>:
    d1bc:	00032703          	lw	a4,0(t1)
    d1c0:	ffc32683          	lw	a3,-4(t1)
    d1c4:	ffc30313          	add	t1,t1,-4
    d1c8:	00371713          	sll	a4,a4,0x3
    d1cc:	01d6d693          	srl	a3,a3,0x1d
    d1d0:	00d76733          	or	a4,a4,a3
    d1d4:	00e32223          	sw	a4,4(t1)
    d1d8:	fe6812e3          	bne	a6,t1,d1bc <.L3>

0000d1dc <.LVL9>:
    d1dc:	00341413          	sll	s0,s0,0x3

0000d1e0 <.LBE13>:
  FP_SUB_Q (R, A, B);
    d1e0:	00008737          	lui	a4,0x8

0000d1e4 <.LBB14>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    d1e4:	02812023          	sw	s0,32(sp)

0000d1e8 <.LBE14>:
  FP_SUB_Q (R, A, B);
    d1e8:	fff70713          	add	a4,a4,-1 # 7fff <__kernel_rem_pio2+0x5f>
    d1ec:	02eb9063          	bne	s7,a4,d20c <.L4>
    d1f0:	02812683          	lw	a3,40(sp)
    d1f4:	02412703          	lw	a4,36(sp)
    d1f8:	00d76733          	or	a4,a4,a3
    d1fc:	02c12683          	lw	a3,44(sp)
    d200:	00d76733          	or	a4,a4,a3
    d204:	00876733          	or	a4,a4,s0
    d208:	00071463          	bnez	a4,d210 <.L5>

0000d20c <.L4>:
    d20c:	00194913          	xor	s2,s2,1

0000d210 <.L5>:
    d210:	417488b3          	sub	a7,s1,s7

0000d214 <.LBE15>:
    d214:	095916e3          	bne	s2,s5,daa0 <.L6>

0000d218 <.LBB48>:
    d218:	45105263          	blez	a7,d65c <.L7>

0000d21c <.LVL12>:
    d21c:	01412903          	lw	s2,20(sp)

0000d220 <.LVL13>:
    d220:	01812983          	lw	s3,24(sp)
    d224:	01c12b03          	lw	s6,28(sp)
    d228:	0a0b9263          	bnez	s7,d2cc <.L8>
    d22c:	02412683          	lw	a3,36(sp)
    d230:	02812703          	lw	a4,40(sp)
    d234:	02c12583          	lw	a1,44(sp)
    d238:	00e6e633          	or	a2,a3,a4
    d23c:	00b66633          	or	a2,a2,a1
    d240:	00866633          	or	a2,a2,s0
    d244:	00061e63          	bnez	a2,d260 <.L9>

0000d248 <.L363>:
    d248:	02f12823          	sw	a5,48(sp)
    d24c:	03212a23          	sw	s2,52(sp)
    d250:	03312c23          	sw	s3,56(sp)
    d254:	03612e23          	sw	s6,60(sp)

0000d258 <.LBB91>:
    d258:	00088493          	mv	s1,a7

0000d25c <.LVL16>:
    d25c:	08c0006f          	j	d2e8 <.L10>

0000d260 <.L9>:
    d260:	fff88613          	add	a2,a7,-1

0000d264 <.LVL18>:
    d264:	04061863          	bnez	a2,d2b4 <.L11>

0000d268 <.LBB16>:
    d268:	00878433          	add	s0,a5,s0
    d26c:	01268933          	add	s2,a3,s2
    d270:	02812823          	sw	s0,48(sp)

0000d274 <.LVL19>:
    d274:	00f43433          	sltu	s0,s0,a5

0000d278 <.LVL20>:
    d278:	00890433          	add	s0,s2,s0

0000d27c <.LVL21>:
    d27c:	02812a23          	sw	s0,52(sp)

0000d280 <.LVL22>:
    d280:	00d936b3          	sltu	a3,s2,a3

0000d284 <.LVL23>:
    d284:	01243433          	sltu	s0,s0,s2

0000d288 <.LVL24>:
    d288:	013709b3          	add	s3,a4,s3

0000d28c <.LVL25>:
    d28c:	0086e6b3          	or	a3,a3,s0

0000d290 <.LVL26>:
    d290:	00d986b3          	add	a3,s3,a3
    d294:	02d12c23          	sw	a3,56(sp)

0000d298 <.LVL27>:
    d298:	00e9b7b3          	sltu	a5,s3,a4

0000d29c <.LVL28>:
    d29c:	0136b6b3          	sltu	a3,a3,s3

0000d2a0 <.LVL29>:
    d2a0:	00d7e7b3          	or	a5,a5,a3

0000d2a4 <.LVL30>:
    d2a4:	016585b3          	add	a1,a1,s6
    d2a8:	00b787b3          	add	a5,a5,a1

0000d2ac <.L355>:
    d2ac:	00100493          	li	s1,1

0000d2b0 <.LVL32>:
    d2b0:	2fc0006f          	j	d5ac <.L22>

0000d2b4 <.L11>:
    d2b4:	00008737          	lui	a4,0x8
    d2b8:	fff70713          	add	a4,a4,-1 # 7fff <__kernel_rem_pio2+0x5f>
    d2bc:	00e88463          	beq	a7,a4,d2c4 <.L23>
    d2c0:	2540106f          	j	e514 <.L343>

0000d2c4 <.L23>:
    d2c4:	02f12823          	sw	a5,48(sp)
    d2c8:	4400006f          	j	d708 <.L364>

0000d2cc <.L8>:
    d2cc:	00008737          	lui	a4,0x8
    d2d0:	fff70713          	add	a4,a4,-1 # 7fff <__kernel_rem_pio2+0x5f>
    d2d4:	16e49a63          	bne	s1,a4,d448 <.L25>

0000d2d8 <.LVL36>:
    d2d8:	02f12823          	sw	a5,48(sp)
    d2dc:	03212a23          	sw	s2,52(sp)
    d2e0:	03312c23          	sw	s3,56(sp)
    d2e4:	03612e23          	sw	s6,60(sp)

0000d2e8 <.L10>:
  FP_PACK_SEMIRAW_Q (r, R);
    d2e8:	03012783          	lw	a5,48(sp)
    d2ec:	0077f713          	and	a4,a5,7
    d2f0:	04070463          	beqz	a4,d338 <.L257>
    d2f4:	00f7f713          	and	a4,a5,15
    d2f8:	00400693          	li	a3,4
    d2fc:	02d70e63          	beq	a4,a3,d338 <.L257>

0000d300 <.LBB92>:
    d300:	03412703          	lw	a4,52(sp)
    d304:	00478793          	add	a5,a5,4
    d308:	02f12823          	sw	a5,48(sp)

0000d30c <.LVL38>:
    d30c:	0047b793          	sltiu	a5,a5,4

0000d310 <.LVL39>:
    d310:	00f707b3          	add	a5,a4,a5
    d314:	02f12a23          	sw	a5,52(sp)

0000d318 <.LVL40>:
    d318:	00e7b7b3          	sltu	a5,a5,a4

0000d31c <.LVL41>:
    d31c:	03812703          	lw	a4,56(sp)
    d320:	00f707b3          	add	a5,a4,a5

0000d324 <.LVL42>:
    d324:	02f12c23          	sw	a5,56(sp)

0000d328 <.LVL43>:
    d328:	00e7b7b3          	sltu	a5,a5,a4

0000d32c <.LVL44>:
    d32c:	03c12703          	lw	a4,60(sp)
    d330:	00e787b3          	add	a5,a5,a4

0000d334 <.LVL45>:
    d334:	02f12e23          	sw	a5,60(sp)

0000d338 <.L257>:
    d338:	03c12783          	lw	a5,60(sp)
    d33c:	00c79713          	sll	a4,a5,0xc
    d340:	02075463          	bgez	a4,d368 <.L262>
    d344:	00008737          	lui	a4,0x8
    d348:	00148493          	add	s1,s1,1

0000d34c <.LVL47>:
    d34c:	fff70713          	add	a4,a4,-1 # 7fff <__kernel_rem_pio2+0x5f>
    d350:	00e49463          	bne	s1,a4,d358 <.LVL47+0xc>
    d354:	1ac0106f          	j	e500 <.L263>
    d358:	fff80737          	lui	a4,0xfff80
    d35c:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff6a10f>
    d360:	00e7f7b3          	and	a5,a5,a4
    d364:	02f12e23          	sw	a5,60(sp)

0000d368 <.L262>:
    d368:	03010793          	add	a5,sp,48
    d36c:	03c10613          	add	a2,sp,60

0000d370 <.L265>:
    d370:	0007a703          	lw	a4,0(a5)
    d374:	0047a683          	lw	a3,4(a5)
    d378:	00478793          	add	a5,a5,4
    d37c:	00375713          	srl	a4,a4,0x3
    d380:	01d69693          	sll	a3,a3,0x1d
    d384:	00d76733          	or	a4,a4,a3
    d388:	fee7ae23          	sw	a4,-4(a5)
    d38c:	fec792e3          	bne	a5,a2,d370 <.L265>

0000d390 <.LVL50>:
    d390:	03c12703          	lw	a4,60(sp)

0000d394 <.LBE93>:
    d394:	000086b7          	lui	a3,0x8
    d398:	fff68793          	add	a5,a3,-1 # 7fff <__kernel_rem_pio2+0x5f>

0000d39c <.LBB94>:
    d39c:	00375713          	srl	a4,a4,0x3
    d3a0:	02e12e23          	sw	a4,60(sp)

0000d3a4 <.LBE94>:
    d3a4:	02f49a63          	bne	s1,a5,d3d8 <.L266>
    d3a8:	03412603          	lw	a2,52(sp)
    d3ac:	03012783          	lw	a5,48(sp)
    d3b0:	00c7e7b3          	or	a5,a5,a2
    d3b4:	03812603          	lw	a2,56(sp)
    d3b8:	00c7e7b3          	or	a5,a5,a2
    d3bc:	00e7e7b3          	or	a5,a5,a4
    d3c0:	00078c63          	beqz	a5,d3d8 <.L266>
    d3c4:	02d12e23          	sw	a3,60(sp)
    d3c8:	02012c23          	sw	zero,56(sp)
    d3cc:	02012a23          	sw	zero,52(sp)
    d3d0:	02012823          	sw	zero,48(sp)

0000d3d4 <.LVL51>:
    d3d4:	00000a93          	li	s5,0

0000d3d8 <.L266>:
    d3d8:	03c12783          	lw	a5,60(sp)
    d3dc:	01149493          	sll	s1,s1,0x11

0000d3e0 <.LVL53>:
    d3e0:	0114d493          	srl	s1,s1,0x11
    d3e4:	00f11623          	sh	a5,12(sp)

0000d3e8 <.LBE101>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    d3e8:	03012783          	lw	a5,48(sp)

0000d3ec <.LBB102>:
  FP_PACK_SEMIRAW_Q (r, R);
    d3ec:	00fa9a93          	sll	s5,s5,0xf

0000d3f0 <.LVL54>:
    d3f0:	009aeab3          	or	s5,s5,s1

0000d3f4 <.LBE102>:
  return r;
    d3f4:	00fa2023          	sw	a5,0(s4)
    d3f8:	03412783          	lw	a5,52(sp)

0000d3fc <.LBB103>:
  FP_PACK_SEMIRAW_Q (r, R);
    d3fc:	01511723          	sh	s5,14(sp)

0000d400 <.LBE103>:
}
    d400:	06c12083          	lw	ra,108(sp)
  return r;
    d404:	00fa2223          	sw	a5,4(s4)
    d408:	03812783          	lw	a5,56(sp)

0000d40c <.LVL56>:
}
    d40c:	06812403          	lw	s0,104(sp)
    d410:	06412483          	lw	s1,100(sp)
  return r;
    d414:	00fa2423          	sw	a5,8(s4)
    d418:	00c12783          	lw	a5,12(sp)
}
    d41c:	06012903          	lw	s2,96(sp)
    d420:	05c12983          	lw	s3,92(sp)
  return r;
    d424:	00fa2623          	sw	a5,12(s4)
}
    d428:	05412a83          	lw	s5,84(sp)
    d42c:	05012b03          	lw	s6,80(sp)
    d430:	04c12b83          	lw	s7,76(sp)

0000d434 <.LVL57>:
    d434:	04812c03          	lw	s8,72(sp)
    d438:	000a0513          	mv	a0,s4
    d43c:	05812a03          	lw	s4,88(sp)
    d440:	07010113          	add	sp,sp,112

0000d444 <.LVL59>:
    d444:	00008067          	ret

0000d448 <.L25>:
  FP_SUB_Q (R, A, B);
    d448:	02c12703          	lw	a4,44(sp)
    d44c:	000806b7          	lui	a3,0x80
    d450:	00d76733          	or	a4,a4,a3
    d454:	02e12623          	sw	a4,44(sp)

0000d458 <.LDL1>:
    d458:	07400713          	li	a4,116
    d45c:	01175463          	bge	a4,a7,d464 <.LDL1+0xc>
    d460:	0c00106f          	j	e520 <.L26>
    d464:	00088613          	mv	a2,a7

0000d468 <.L267>:
    d468:	40565693          	sra	a3,a2,0x5

0000d46c <.LVL62>:
    d46c:	00030513          	mv	a0,t1
    d470:	01f67613          	and	a2,a2,31

0000d474 <.LVL63>:
    d474:	00000713          	li	a4,0
    d478:	00000593          	li	a1,0

0000d47c <.L27>:
    d47c:	02d59c63          	bne	a1,a3,d4b4 <.L28>
    d480:	00300593          	li	a1,3

0000d484 <.LVL65>:
    d484:	40d585b3          	sub	a1,a1,a3
    d488:	00269513          	sll	a0,a3,0x2
    d48c:	02061e63          	bnez	a2,d4c8 <.L29>

0000d490 <.L30>:
    d490:	00a308b3          	add	a7,t1,a0
    d494:	0008a883          	lw	a7,0(a7)
    d498:	00160613          	add	a2,a2,1

0000d49c <.LVL67>:
    d49c:	00430313          	add	t1,t1,4
    d4a0:	ff132e23          	sw	a7,-4(t1)

0000d4a4 <.LVL68>:
    d4a4:	fec5d6e3          	bge	a1,a2,d490 <.L30>
    d4a8:	00400613          	li	a2,4

0000d4ac <.LVL69>:
    d4ac:	40d606b3          	sub	a3,a2,a3

0000d4b0 <.LVL70>:
    d4b0:	0640006f          	j	d514 <.L34>

0000d4b4 <.L28>:
    d4b4:	00052883          	lw	a7,0(a0)
    d4b8:	00158593          	add	a1,a1,1

0000d4bc <.LVL72>:
    d4bc:	00450513          	add	a0,a0,4
    d4c0:	01176733          	or	a4,a4,a7

0000d4c4 <.LVL73>:
    d4c4:	fb9ff06f          	j	d47c <.L27>

0000d4c8 <.L29>:
    d4c8:	04050893          	add	a7,a0,64
    d4cc:	002888b3          	add	a7,a7,sp
    d4d0:	fe08a883          	lw	a7,-32(a7)
    d4d4:	02000e13          	li	t3,32
    d4d8:	40ce0e33          	sub	t3,t3,a2
    d4dc:	01c898b3          	sll	a7,a7,t3
    d4e0:	01176733          	or	a4,a4,a7

0000d4e4 <.LVL75>:
    d4e4:	00000e93          	li	t4,0
    d4e8:	00a808b3          	add	a7,a6,a0
    d4ec:	40a00533          	neg	a0,a0

0000d4f0 <.L32>:
    d4f0:	14bec263          	blt	t4,a1,d634 <.L33>
    d4f4:	00400513          	li	a0,4
    d4f8:	40d506b3          	sub	a3,a0,a3

0000d4fc <.LVL77>:
    d4fc:	02c12503          	lw	a0,44(sp)
    d500:	00259593          	sll	a1,a1,0x2

0000d504 <.LVL78>:
    d504:	04058593          	add	a1,a1,64
    d508:	002585b3          	add	a1,a1,sp
    d50c:	00c55633          	srl	a2,a0,a2

0000d510 <.LVL79>:
    d510:	fec5a023          	sw	a2,-32(a1)

0000d514 <.L34>:
    d514:	00400613          	li	a2,4
    d518:	40d60633          	sub	a2,a2,a3
    d51c:	00261613          	sll	a2,a2,0x2
    d520:	00269693          	sll	a3,a3,0x2
    d524:	00800593          	li	a1,8
    d528:	00d806b3          	add	a3,a6,a3
    d52c:	00b66a63          	bltu	a2,a1,d540 <.L35>
    d530:	0006a023          	sw	zero,0(a3) # 80000 <_ebss+0x6a110>
    d534:	0006a223          	sw	zero,4(a3)
    d538:	ff860613          	add	a2,a2,-8
    d53c:	00868693          	add	a3,a3,8

0000d540 <.L35>:
    d540:	00400593          	li	a1,4
    d544:	00b66463          	bltu	a2,a1,d54c <.L36>
    d548:	0006a023          	sw	zero,0(a3)

0000d54c <.L36>:
    d54c:	02012683          	lw	a3,32(sp)

0000d550 <.LBB19>:
    d550:	00e03733          	snez	a4,a4

0000d554 <.LBE19>:
    d554:	00d76733          	or	a4,a4,a3

0000d558 <.L37>:
    d558:	02412683          	lw	a3,36(sp)

0000d55c <.LBB21>:
    d55c:	02e12023          	sw	a4,32(sp)

0000d560 <.LBB22>:
    d560:	00e78733          	add	a4,a5,a4
    d564:	01268933          	add	s2,a3,s2
    d568:	02e12823          	sw	a4,48(sp)

0000d56c <.LVL84>:
    d56c:	00f73733          	sltu	a4,a4,a5

0000d570 <.LVL85>:
    d570:	02812783          	lw	a5,40(sp)
    d574:	00e90733          	add	a4,s2,a4

0000d578 <.LVL86>:
    d578:	02e12a23          	sw	a4,52(sp)

0000d57c <.LVL87>:
    d57c:	00d936b3          	sltu	a3,s2,a3

0000d580 <.LVL88>:
    d580:	01273733          	sltu	a4,a4,s2

0000d584 <.LVL89>:
    d584:	013789b3          	add	s3,a5,s3

0000d588 <.LVL90>:
    d588:	00e6e733          	or	a4,a3,a4

0000d58c <.LVL91>:
    d58c:	00e98733          	add	a4,s3,a4
    d590:	02e12c23          	sw	a4,56(sp)

0000d594 <.LVL92>:
    d594:	00f9b7b3          	sltu	a5,s3,a5

0000d598 <.LVL93>:
    d598:	01373733          	sltu	a4,a4,s3

0000d59c <.LVL94>:
    d59c:	00e7e7b3          	or	a5,a5,a4

0000d5a0 <.LVL95>:
    d5a0:	02c12703          	lw	a4,44(sp)

0000d5a4 <.LVL96>:
    d5a4:	00eb0733          	add	a4,s6,a4
    d5a8:	00e787b3          	add	a5,a5,a4

0000d5ac <.L22>:
    d5ac:	02f12e23          	sw	a5,60(sp)

0000d5b0 <.LBE23>:
    d5b0:	00c79713          	sll	a4,a5,0xc
    d5b4:	d2075ae3          	bgez	a4,d2e8 <.L10>

0000d5b8 <.LBB24>:
    d5b8:	03012683          	lw	a3,48(sp)

0000d5bc <.LBE24>:
    d5bc:	fff80737          	lui	a4,0xfff80
    d5c0:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff6a10f>
    d5c4:	00e7f7b3          	and	a5,a5,a4
    d5c8:	02f12e23          	sw	a5,60(sp)
    d5cc:	00148493          	add	s1,s1,1

0000d5d0 <.LBB26>:
    d5d0:	01f69693          	sll	a3,a3,0x1f

0000d5d4 <.LVL100>:
    d5d4:	03010713          	add	a4,sp,48
    d5d8:	03c10513          	add	a0,sp,60

0000d5dc <.L115>:
    d5dc:	00072603          	lw	a2,0(a4)
    d5e0:	00472583          	lw	a1,4(a4)
    d5e4:	00470713          	add	a4,a4,4
    d5e8:	00165613          	srl	a2,a2,0x1
    d5ec:	01f59593          	sll	a1,a1,0x1f
    d5f0:	00b66633          	or	a2,a2,a1
    d5f4:	fec72e23          	sw	a2,-4(a4)
    d5f8:	fee512e3          	bne	a0,a4,d5dc <.L115>

0000d5fc <.LBE26>:
    d5fc:	03012703          	lw	a4,48(sp)

0000d600 <.LBB27>:
    d600:	0017d793          	srl	a5,a5,0x1
    d604:	02f12e23          	sw	a5,60(sp)

0000d608 <.LBB28>:
    d608:	00d037b3          	snez	a5,a3

0000d60c <.LBE28>:
    d60c:	00f767b3          	or	a5,a4,a5
    d610:	02f12823          	sw	a5,48(sp)

0000d614 <.LBE29>:
    d614:	000087b7          	lui	a5,0x8
    d618:	fff78793          	add	a5,a5,-1 # 7fff <__kernel_rem_pio2+0x5f>
    d61c:	ccf496e3          	bne	s1,a5,d2e8 <.L10>

0000d620 <.LVL104>:
    d620:	02012e23          	sw	zero,60(sp)
    d624:	02012c23          	sw	zero,56(sp)
    d628:	02012a23          	sw	zero,52(sp)
    d62c:	02012823          	sw	zero,48(sp)

0000d630 <.LBB105>:
  FP_PACK_SEMIRAW_Q (r, R);
    d630:	cb9ff06f          	j	d2e8 <.L10>

0000d634 <.L33>:
  FP_SUB_Q (R, A, B);
    d634:	0008a303          	lw	t1,0(a7)
    d638:	0048af03          	lw	t5,4(a7)
    d63c:	00a88fb3          	add	t6,a7,a0
    d640:	00c35333          	srl	t1,t1,a2
    d644:	01cf1f33          	sll	t5,t5,t3
    d648:	01e36333          	or	t1,t1,t5
    d64c:	006fa023          	sw	t1,0(t6)

0000d650 <.LVL107>:
    d650:	001e8e93          	add	t4,t4,1

0000d654 <.LVL108>:
    d654:	00488893          	add	a7,a7,4
    d658:	e99ff06f          	j	d4f0 <.L32>

0000d65c <.L7>:
    d65c:	02412903          	lw	s2,36(sp)

0000d660 <.LVL110>:
    d660:	02812983          	lw	s3,40(sp)
    d664:	02c12b03          	lw	s6,44(sp)

0000d668 <.LBB108>:
    d668:	26088263          	beqz	a7,d8cc <.L48>
    d66c:	409b8833          	sub	a6,s7,s1

0000d670 <.LVL111>:
    d670:	0a049c63          	bnez	s1,d728 <.L49>
    d674:	01412683          	lw	a3,20(sp)
    d678:	01812703          	lw	a4,24(sp)
    d67c:	01c12883          	lw	a7,28(sp)
    d680:	00e6e5b3          	or	a1,a3,a4
    d684:	0115e5b3          	or	a1,a1,a7
    d688:	00f5e5b3          	or	a1,a1,a5
    d68c:	00059e63          	bnez	a1,d6a8 <.L50>

0000d690 <.LVL112>:
    d690:	02812823          	sw	s0,48(sp)
    d694:	03212a23          	sw	s2,52(sp)
    d698:	03312c23          	sw	s3,56(sp)
    d69c:	03612e23          	sw	s6,60(sp)

0000d6a0 <.L360>:
    d6a0:	00080493          	mv	s1,a6

0000d6a4 <.LVL114>:
    d6a4:	c45ff06f          	j	d2e8 <.L10>

0000d6a8 <.L50>:
    d6a8:	fff80593          	add	a1,a6,-1

0000d6ac <.LVL116>:
    d6ac:	04059663          	bnez	a1,d6f8 <.L51>

0000d6b0 <.LBB31>:
    d6b0:	00878433          	add	s0,a5,s0
    d6b4:	01268933          	add	s2,a3,s2
    d6b8:	02812823          	sw	s0,48(sp)

0000d6bc <.LVL117>:
    d6bc:	00f43433          	sltu	s0,s0,a5

0000d6c0 <.LVL118>:
    d6c0:	00890433          	add	s0,s2,s0

0000d6c4 <.LVL119>:
    d6c4:	02812a23          	sw	s0,52(sp)

0000d6c8 <.LVL120>:
    d6c8:	00d936b3          	sltu	a3,s2,a3

0000d6cc <.LVL121>:
    d6cc:	01243433          	sltu	s0,s0,s2

0000d6d0 <.LVL122>:
    d6d0:	013709b3          	add	s3,a4,s3

0000d6d4 <.LVL123>:
    d6d4:	0086e6b3          	or	a3,a3,s0

0000d6d8 <.LVL124>:
    d6d8:	00d986b3          	add	a3,s3,a3
    d6dc:	02d12c23          	sw	a3,56(sp)

0000d6e0 <.LVL125>:
    d6e0:	00e9b7b3          	sltu	a5,s3,a4

0000d6e4 <.LVL126>:
    d6e4:	0136b6b3          	sltu	a3,a3,s3

0000d6e8 <.LVL127>:
    d6e8:	00d7e7b3          	or	a5,a5,a3

0000d6ec <.LVL128>:
    d6ec:	016888b3          	add	a7,a7,s6
    d6f0:	011787b3          	add	a5,a5,a7
    d6f4:	bb9ff06f          	j	d2ac <.L355>

0000d6f8 <.L51>:
    d6f8:	000087b7          	lui	a5,0x8
    d6fc:	fff78793          	add	a5,a5,-1 # 7fff <__kernel_rem_pio2+0x5f>
    d700:	62f81ae3          	bne	a6,a5,e534 <.L62>

0000d704 <.L63>:
    d704:	02812823          	sw	s0,48(sp)

0000d708 <.L364>:
    d708:	03212a23          	sw	s2,52(sp)
    d70c:	03312c23          	sw	s3,56(sp)
    d710:	03612e23          	sw	s6,60(sp)

0000d714 <.L359>:
    d714:	000084b7          	lui	s1,0x8

0000d718 <.LVL132>:
    d718:	fff48493          	add	s1,s1,-1 # 7fff <__kernel_rem_pio2+0x5f>
    d71c:	bcdff06f          	j	d2e8 <.L10>

0000d720 <.L274>:
    d720:	00078413          	mv	s0,a5
    d724:	fe1ff06f          	j	d704 <.L63>

0000d728 <.L49>:
    d728:	000087b7          	lui	a5,0x8
    d72c:	fff78793          	add	a5,a5,-1 # 7fff <__kernel_rem_pio2+0x5f>
    d730:	fcfb8ae3          	beq	s7,a5,d704 <.L63>
    d734:	01c12783          	lw	a5,28(sp)
    d738:	00080737          	lui	a4,0x80
    d73c:	00e7e7b3          	or	a5,a5,a4
    d740:	00f12e23          	sw	a5,28(sp)

0000d744 <.LDL2>:
    d744:	07400793          	li	a5,116
    d748:	5f07cae3          	blt	a5,a6,e53c <.L64>
    d74c:	00080593          	mv	a1,a6

0000d750 <.L268>:
    d750:	02000713          	li	a4,32
    d754:	02e5c733          	div	a4,a1,a4

0000d758 <.LVL136>:
    d758:	00060693          	mv	a3,a2
    d75c:	00000493          	li	s1,0

0000d760 <.LVL137>:
    d760:	00000793          	li	a5,0

0000d764 <.L65>:
    d764:	02e7ce63          	blt	a5,a4,d7a0 <.L66>
    d768:	00300793          	li	a5,3

0000d76c <.LVL139>:
    d76c:	01f5f893          	and	a7,a1,31
    d770:	40e787b3          	sub	a5,a5,a4
    d774:	00271813          	sll	a6,a4,0x2
    d778:	02089e63          	bnez	a7,d7b4 <.L67>

0000d77c <.L68>:
    d77c:	010606b3          	add	a3,a2,a6
    d780:	0006a683          	lw	a3,0(a3)
    d784:	00188893          	add	a7,a7,1

0000d788 <.LVL141>:
    d788:	00460613          	add	a2,a2,4
    d78c:	fed62e23          	sw	a3,-4(a2)

0000d790 <.LVL142>:
    d790:	ff17d6e3          	bge	a5,a7,d77c <.L68>
    d794:	00400793          	li	a5,4
    d798:	40e78733          	sub	a4,a5,a4

0000d79c <.LVL143>:
    d79c:	0780006f          	j	d814 <.L73>

0000d7a0 <.L66>:
    d7a0:	0006a803          	lw	a6,0(a3)
    d7a4:	00178793          	add	a5,a5,1

0000d7a8 <.LVL145>:
    d7a8:	00468693          	add	a3,a3,4
    d7ac:	0104e4b3          	or	s1,s1,a6

0000d7b0 <.LVL146>:
    d7b0:	fb5ff06f          	j	d764 <.L65>

0000d7b4 <.L67>:
    d7b4:	02000693          	li	a3,32
    d7b8:	02d5e5b3          	rem	a1,a1,a3

0000d7bc <.LVL148>:
    d7bc:	40b685b3          	sub	a1,a3,a1
    d7c0:	00070693          	mv	a3,a4
    d7c4:	00075463          	bgez	a4,d7cc <.L70>

0000d7c8 <.LVL149>:
    d7c8:	00000693          	li	a3,0

0000d7cc <.L70>:
    d7cc:	00269693          	sll	a3,a3,0x2
    d7d0:	04068693          	add	a3,a3,64
    d7d4:	002686b3          	add	a3,a3,sp
    d7d8:	fd06a683          	lw	a3,-48(a3)
    d7dc:	00000313          	li	t1,0
    d7e0:	00b696b3          	sll	a3,a3,a1
    d7e4:	00d4e4b3          	or	s1,s1,a3

0000d7e8 <.LVL151>:
    d7e8:	010506b3          	add	a3,a0,a6
    d7ec:	41000833          	neg	a6,a6

0000d7f0 <.L71>:
    d7f0:	0af34a63          	blt	t1,a5,d8a4 <.L72>
    d7f4:	00400693          	li	a3,4
    d7f8:	40e68733          	sub	a4,a3,a4

0000d7fc <.LVL153>:
    d7fc:	01c12683          	lw	a3,28(sp)
    d800:	00279793          	sll	a5,a5,0x2

0000d804 <.LVL154>:
    d804:	04078793          	add	a5,a5,64
    d808:	002787b3          	add	a5,a5,sp
    d80c:	0116d6b3          	srl	a3,a3,a7
    d810:	fcd7a823          	sw	a3,-48(a5)

0000d814 <.L73>:
    d814:	00572793          	slti	a5,a4,5
    d818:	00000613          	li	a2,0
    d81c:	00078863          	beqz	a5,d82c <.L75>
    d820:	00400613          	li	a2,4
    d824:	40e60633          	sub	a2,a2,a4
    d828:	00261613          	sll	a2,a2,0x2

0000d82c <.L75>:
    d82c:	00271713          	sll	a4,a4,0x2
    d830:	00e50533          	add	a0,a0,a4
    d834:	00000593          	li	a1,0
    d838:	d60f50ef          	jal	2d98 <__GI_memset>

0000d83c <.LBE33>:
    d83c:	01012703          	lw	a4,16(sp)

0000d840 <.LBB34>:
    d840:	009037b3          	snez	a5,s1

0000d844 <.LBE34>:
    d844:	00e7e7b3          	or	a5,a5,a4

0000d848 <.L76>:
    d848:	01412683          	lw	a3,20(sp)

0000d84c <.LBB36>:
    d84c:	00f12823          	sw	a5,16(sp)

0000d850 <.LBB37>:
    d850:	00f407b3          	add	a5,s0,a5
    d854:	01268933          	add	s2,a3,s2
    d858:	02f12823          	sw	a5,48(sp)

0000d85c <.LVL158>:
    d85c:	0087b7b3          	sltu	a5,a5,s0

0000d860 <.LVL159>:
    d860:	00f90733          	add	a4,s2,a5
    d864:	01812783          	lw	a5,24(sp)

0000d868 <.LVL160>:
    d868:	02e12a23          	sw	a4,52(sp)

0000d86c <.LVL161>:
    d86c:	00d936b3          	sltu	a3,s2,a3

0000d870 <.LVL162>:
    d870:	01273733          	sltu	a4,a4,s2

0000d874 <.LVL163>:
    d874:	013789b3          	add	s3,a5,s3

0000d878 <.LVL164>:
    d878:	00e6e733          	or	a4,a3,a4

0000d87c <.LVL165>:
    d87c:	00e98733          	add	a4,s3,a4
    d880:	02e12c23          	sw	a4,56(sp)

0000d884 <.LVL166>:
    d884:	00f9b7b3          	sltu	a5,s3,a5

0000d888 <.LVL167>:
    d888:	01373733          	sltu	a4,a4,s3

0000d88c <.LVL168>:
    d88c:	00e7e7b3          	or	a5,a5,a4

0000d890 <.LVL169>:
    d890:	01c12703          	lw	a4,28(sp)

0000d894 <.LBE37>:
    d894:	000b8493          	mv	s1,s7

0000d898 <.LBB38>:
    d898:	00eb0733          	add	a4,s6,a4
    d89c:	00e787b3          	add	a5,a5,a4

0000d8a0 <.LBE38>:
    d8a0:	d0dff06f          	j	d5ac <.L22>

0000d8a4 <.L72>:
    d8a4:	0006a603          	lw	a2,0(a3)
    d8a8:	0046ae03          	lw	t3,4(a3)
    d8ac:	01068eb3          	add	t4,a3,a6
    d8b0:	01165633          	srl	a2,a2,a7
    d8b4:	00be1e33          	sll	t3,t3,a1
    d8b8:	01c66633          	or	a2,a2,t3
    d8bc:	00cea023          	sw	a2,0(t4)

0000d8c0 <.LVL172>:
    d8c0:	00130313          	add	t1,t1,1

0000d8c4 <.LVL173>:
    d8c4:	00468693          	add	a3,a3,4
    d8c8:	f29ff06f          	j	d7f0 <.L71>

0000d8cc <.L48>:
    d8cc:	00148813          	add	a6,s1,1
    d8d0:	01181893          	sll	a7,a6,0x11
    d8d4:	0128d893          	srl	a7,a7,0x12
    d8d8:	01412683          	lw	a3,20(sp)
    d8dc:	01812703          	lw	a4,24(sp)
    d8e0:	01c12603          	lw	a2,28(sp)
    d8e4:	03010593          	add	a1,sp,48
    d8e8:	03c10513          	add	a0,sp,60
    d8ec:	10089e63          	bnez	a7,da08 <.L87>
    d8f0:	00e6e833          	or	a6,a3,a4
    d8f4:	00c86833          	or	a6,a6,a2
    d8f8:	00f86833          	or	a6,a6,a5
    d8fc:	0a049863          	bnez	s1,d9ac <.L88>

0000d900 <.LVL175>:
    d900:	00081e63          	bnez	a6,d91c <.L89>
    d904:	02812823          	sw	s0,48(sp)
    d908:	03212a23          	sw	s2,52(sp)
    d90c:	03312c23          	sw	s3,56(sp)
    d910:	03612e23          	sw	s6,60(sp)

0000d914 <.L357>:
    d914:	00000493          	li	s1,0
    d918:	9d1ff06f          	j	d2e8 <.L10>

0000d91c <.L89>:
    d91c:	013965b3          	or	a1,s2,s3
    d920:	0165e5b3          	or	a1,a1,s6
    d924:	0085e5b3          	or	a1,a1,s0
    d928:	00059c63          	bnez	a1,d940 <.L90>
    d92c:	02f12823          	sw	a5,48(sp)
    d930:	02d12a23          	sw	a3,52(sp)
    d934:	02e12c23          	sw	a4,56(sp)
    d938:	02c12e23          	sw	a2,60(sp)

0000d93c <.LBB123>:
  FP_PACK_SEMIRAW_Q (r, R);
    d93c:	9adff06f          	j	d2e8 <.L10>

0000d940 <.L90>:
  FP_SUB_Q (R, A, B);
    d940:	00878433          	add	s0,a5,s0
    d944:	01268933          	add	s2,a3,s2
    d948:	02812823          	sw	s0,48(sp)

0000d94c <.LVL180>:
    d94c:	00f43433          	sltu	s0,s0,a5

0000d950 <.LVL181>:
    d950:	00890433          	add	s0,s2,s0

0000d954 <.LVL182>:
    d954:	02812a23          	sw	s0,52(sp)

0000d958 <.LVL183>:
    d958:	00d936b3          	sltu	a3,s2,a3

0000d95c <.LVL184>:
    d95c:	01243433          	sltu	s0,s0,s2

0000d960 <.LVL185>:
    d960:	013709b3          	add	s3,a4,s3

0000d964 <.LVL186>:
    d964:	0086e6b3          	or	a3,a3,s0

0000d968 <.LVL187>:
    d968:	00d986b3          	add	a3,s3,a3
    d96c:	02d12c23          	sw	a3,56(sp)

0000d970 <.LVL188>:
    d970:	00e9b733          	sltu	a4,s3,a4

0000d974 <.LVL189>:
    d974:	0136b6b3          	sltu	a3,a3,s3

0000d978 <.LVL190>:
    d978:	00d76733          	or	a4,a4,a3

0000d97c <.LVL191>:
    d97c:	01660633          	add	a2,a2,s6
    d980:	00c70733          	add	a4,a4,a2

0000d984 <.LBE40>:
    d984:	00c71793          	sll	a5,a4,0xc

0000d988 <.LVL192>:
    d988:	0007c663          	bltz	a5,d994 <.L101>

0000d98c <.LBB41>:
    d98c:	02e12e23          	sw	a4,60(sp)
    d990:	959ff06f          	j	d2e8 <.L10>

0000d994 <.L101>:
    d994:	fff807b7          	lui	a5,0xfff80
    d998:	fff78793          	add	a5,a5,-1 # fff7ffff <_ebss+0xfff6a10f>
    d99c:	00f77733          	and	a4,a4,a5
    d9a0:	02e12e23          	sw	a4,60(sp)

0000d9a4 <.LBB126>:
    d9a4:	00100493          	li	s1,1

0000d9a8 <.LVL194>:
    d9a8:	941ff06f          	j	d2e8 <.L10>

0000d9ac <.L88>:
    d9ac:	1a080463          	beqz	a6,db54 <.L271>
    d9b0:	01396933          	or	s2,s2,s3
    d9b4:	01696933          	or	s2,s2,s6
    d9b8:	00896933          	or	s2,s2,s0
    d9bc:	1a090063          	beqz	s2,db5c <.L272>

0000d9c0 <.LBB129>:
    d9c0:	000087b7          	lui	a5,0x8
    d9c4:	02f12e23          	sw	a5,60(sp)
    d9c8:	02012c23          	sw	zero,56(sp)
    d9cc:	02012a23          	sw	zero,52(sp)
    d9d0:	02012823          	sw	zero,48(sp)

0000d9d4 <.LBB42>:
    d9d4:	00050793          	mv	a5,a0

0000d9d8 <.L102>:
    d9d8:	0007a703          	lw	a4,0(a5) # 8000 <__kernel_rem_pio2+0x60>
    d9dc:	ffc7a683          	lw	a3,-4(a5)
    d9e0:	ffc78793          	add	a5,a5,-4
    d9e4:	00371713          	sll	a4,a4,0x3
    d9e8:	01d6d693          	srl	a3,a3,0x1d
    d9ec:	00d76733          	or	a4,a4,a3
    d9f0:	00e7a223          	sw	a4,4(a5)
    d9f4:	fef592e3          	bne	a1,a5,d9d8 <.L102>

0000d9f8 <.L213>:
    d9f8:	000084b7          	lui	s1,0x8

0000d9fc <.LVL200>:
    d9fc:	fff48493          	add	s1,s1,-1 # 7fff <__kernel_rem_pio2+0x5f>

0000da00 <.L358>:
    da00:	00000a93          	li	s5,0
    da04:	8e5ff06f          	j	d2e8 <.L10>

0000da08 <.L87>:
    da08:	00878433          	add	s0,a5,s0
    da0c:	01268933          	add	s2,a3,s2
    da10:	02812823          	sw	s0,48(sp)

0000da14 <.LVL203>:
    da14:	00f43433          	sltu	s0,s0,a5

0000da18 <.LVL204>:
    da18:	00890433          	add	s0,s2,s0

0000da1c <.LVL205>:
    da1c:	02812a23          	sw	s0,52(sp)

0000da20 <.LVL206>:
    da20:	00d936b3          	sltu	a3,s2,a3

0000da24 <.LVL207>:
    da24:	01243433          	sltu	s0,s0,s2

0000da28 <.LVL208>:
    da28:	013709b3          	add	s3,a4,s3

0000da2c <.LVL209>:
    da2c:	0086e6b3          	or	a3,a3,s0

0000da30 <.LVL210>:
    da30:	00d986b3          	add	a3,s3,a3
    da34:	02d12c23          	sw	a3,56(sp)

0000da38 <.LVL211>:
    da38:	00e9b733          	sltu	a4,s3,a4

0000da3c <.LVL212>:
    da3c:	0136b6b3          	sltu	a3,a3,s3

0000da40 <.LVL213>:
    da40:	00d76733          	or	a4,a4,a3

0000da44 <.LVL214>:
    da44:	01660633          	add	a2,a2,s6
    da48:	00c70733          	add	a4,a4,a2
    da4c:	02e12e23          	sw	a4,60(sp)

0000da50 <.LBB44>:
    da50:	00058793          	mv	a5,a1

0000da54 <.L113>:
    da54:	0007a683          	lw	a3,0(a5)
    da58:	0047a603          	lw	a2,4(a5)
    da5c:	00478793          	add	a5,a5,4
    da60:	0016d693          	srl	a3,a3,0x1
    da64:	01f61613          	sll	a2,a2,0x1f
    da68:	00c6e6b3          	or	a3,a3,a2
    da6c:	fed7ae23          	sw	a3,-4(a5)
    da70:	fef512e3          	bne	a0,a5,da54 <.L113>

0000da74 <.LBE44>:
    da74:	000087b7          	lui	a5,0x8
    da78:	fff78793          	add	a5,a5,-1 # 7fff <__kernel_rem_pio2+0x5f>
    da7c:	00f80863          	beq	a6,a5,da8c <.L114>

0000da80 <.LBB47>:
    da80:	00175713          	srl	a4,a4,0x1
    da84:	02e12e23          	sw	a4,60(sp)
    da88:	c19ff06f          	j	d6a0 <.L360>

0000da8c <.L114>:
    da8c:	02012e23          	sw	zero,60(sp)
    da90:	02012c23          	sw	zero,56(sp)
    da94:	02012a23          	sw	zero,52(sp)
    da98:	02012823          	sw	zero,48(sp)
    da9c:	c05ff06f          	j	d6a0 <.L360>

0000daa0 <.L6>:
    daa0:	29105c63          	blez	a7,dd38 <.L118>

0000daa4 <.LBB133>:
    daa4:	01412903          	lw	s2,20(sp)

0000daa8 <.LVL221>:
    daa8:	01812983          	lw	s3,24(sp)
    daac:	01c12b03          	lw	s6,28(sp)

0000dab0 <.LBB134>:
    dab0:	0a0b9e63          	bnez	s7,db6c <.L119>
    dab4:	02412e03          	lw	t3,36(sp)
    dab8:	02812503          	lw	a0,40(sp)
    dabc:	02c12683          	lw	a3,44(sp)
    dac0:	00ae6733          	or	a4,t3,a0
    dac4:	00d76733          	or	a4,a4,a3
    dac8:	00876733          	or	a4,a4,s0
    dacc:	f6070e63          	beqz	a4,d248 <.L363>
    dad0:	fff88e93          	add	t4,a7,-1

0000dad4 <.LVL222>:
    dad4:	040e9c63          	bnez	t4,db2c <.L121>

0000dad8 <.LBB61>:
    dad8:	40878733          	sub	a4,a5,s0

0000dadc <.LVL224>:
    dadc:	41c90633          	sub	a2,s2,t3

0000dae0 <.LVL225>:
    dae0:	00e7b5b3          	sltu	a1,a5,a4
    dae4:	00c93833          	sltu	a6,s2,a2

0000dae8 <.LVL226>:
    dae8:	40b60633          	sub	a2,a2,a1

0000daec <.LVL227>:
    daec:	00000593          	li	a1,0
    daf0:	00e7f663          	bgeu	a5,a4,dafc <.L126>
    daf4:	412e0e33          	sub	t3,t3,s2
    daf8:	001e3593          	seqz	a1,t3

0000dafc <.L126>:
    dafc:	0105e7b3          	or	a5,a1,a6

0000db00 <.LVL228>:
    db00:	40a985b3          	sub	a1,s3,a0

0000db04 <.LVL229>:
    db04:	00b9b833          	sltu	a6,s3,a1

0000db08 <.LVL230>:
    db08:	40f585b3          	sub	a1,a1,a5

0000db0c <.LVL231>:
    db0c:	00078663          	beqz	a5,db18 <.L129>
    db10:	41350533          	sub	a0,a0,s3
    db14:	00153e93          	seqz	t4,a0

0000db18 <.L129>:
    db18:	40db07b3          	sub	a5,s6,a3

0000db1c <.LVL233>:
    db1c:	010ee6b3          	or	a3,t4,a6

0000db20 <.LVL234>:
    db20:	40d787b3          	sub	a5,a5,a3

0000db24 <.L356>:
    db24:	00100493          	li	s1,1

0000db28 <.LVL236>:
    db28:	1bc0006f          	j	dce4 <.L130>

0000db2c <.L121>:
    db2c:	00008737          	lui	a4,0x8
    db30:	fff70713          	add	a4,a4,-1 # 7fff <__kernel_rem_pio2+0x5f>
    db34:	f8e88863          	beq	a7,a4,d2c4 <.L23>
    db38:	07400713          	li	a4,116
    db3c:	05d75c63          	bge	a4,t4,db94 <.L269>

0000db40 <.L132>:
    db40:	02012623          	sw	zero,44(sp)
    db44:	02012423          	sw	zero,40(sp)
    db48:	02012223          	sw	zero,36(sp)
    db4c:	00100713          	li	a4,1
    db50:	1340006f          	j	dc84 <.L143>

0000db54 <.L271>:
    db54:	00040793          	mv	a5,s0
    db58:	f6cff06f          	j	d2c4 <.L23>

0000db5c <.L272>:
    db5c:	00068913          	mv	s2,a3
    db60:	00070993          	mv	s3,a4
    db64:	00060b13          	mv	s6,a2
    db68:	f5cff06f          	j	d2c4 <.L23>

0000db6c <.L119>:
    db6c:	00008737          	lui	a4,0x8
    db70:	fff70713          	add	a4,a4,-1 # 7fff <__kernel_rem_pio2+0x5f>
    db74:	bae486e3          	beq	s1,a4,d720 <.L274>
    db78:	02c12703          	lw	a4,44(sp)
    db7c:	000806b7          	lui	a3,0x80
    db80:	00d76733          	or	a4,a4,a3
    db84:	02e12623          	sw	a4,44(sp)

0000db88 <.LDL3>:
    db88:	07400713          	li	a4,116
    db8c:	fb174ae3          	blt	a4,a7,db40 <.L132>
    db90:	00088e93          	mv	t4,a7

0000db94 <.L269>:
    db94:	405ed693          	sra	a3,t4,0x5

0000db98 <.LVL242>:
    db98:	00030593          	mv	a1,t1
    db9c:	01fefe93          	and	t4,t4,31

0000dba0 <.LVL243>:
    dba0:	00000713          	li	a4,0
    dba4:	00000613          	li	a2,0

0000dba8 <.L133>:
    dba8:	02d61c63          	bne	a2,a3,dbe0 <.L134>
    dbac:	00300613          	li	a2,3

0000dbb0 <.LVL245>:
    dbb0:	40d60633          	sub	a2,a2,a3
    dbb4:	00269593          	sll	a1,a3,0x2
    dbb8:	020e9e63          	bnez	t4,dbf4 <.L135>

0000dbbc <.L136>:
    dbbc:	00b30533          	add	a0,t1,a1
    dbc0:	00052503          	lw	a0,0(a0)
    dbc4:	001e8e93          	add	t4,t4,1

0000dbc8 <.LVL247>:
    dbc8:	00430313          	add	t1,t1,4
    dbcc:	fea32e23          	sw	a0,-4(t1)

0000dbd0 <.LVL248>:
    dbd0:	ffd656e3          	bge	a2,t4,dbbc <.L136>
    dbd4:	00400613          	li	a2,4
    dbd8:	40d606b3          	sub	a3,a2,a3

0000dbdc <.LVL249>:
    dbdc:	0640006f          	j	dc40 <.L140>

0000dbe0 <.L134>:
    dbe0:	0005a503          	lw	a0,0(a1)
    dbe4:	00160613          	add	a2,a2,1

0000dbe8 <.LVL251>:
    dbe8:	00458593          	add	a1,a1,4
    dbec:	00a76733          	or	a4,a4,a0

0000dbf0 <.LVL252>:
    dbf0:	fb9ff06f          	j	dba8 <.L133>

0000dbf4 <.L135>:
    dbf4:	04058513          	add	a0,a1,64
    dbf8:	00250533          	add	a0,a0,sp
    dbfc:	fe052503          	lw	a0,-32(a0)
    dc00:	02000313          	li	t1,32
    dc04:	41d30333          	sub	t1,t1,t4
    dc08:	00651533          	sll	a0,a0,t1
    dc0c:	00a76733          	or	a4,a4,a0

0000dc10 <.LVL254>:
    dc10:	00000e13          	li	t3,0
    dc14:	00b80533          	add	a0,a6,a1
    dc18:	40b005b3          	neg	a1,a1

0000dc1c <.L138>:
    dc1c:	0ece4a63          	blt	t3,a2,dd10 <.L139>
    dc20:	00400593          	li	a1,4
    dc24:	40d586b3          	sub	a3,a1,a3

0000dc28 <.LVL256>:
    dc28:	02c12583          	lw	a1,44(sp)
    dc2c:	00261613          	sll	a2,a2,0x2

0000dc30 <.LVL257>:
    dc30:	04060613          	add	a2,a2,64
    dc34:	00260633          	add	a2,a2,sp
    dc38:	01d5d5b3          	srl	a1,a1,t4
    dc3c:	feb62023          	sw	a1,-32(a2)

0000dc40 <.L140>:
    dc40:	00400613          	li	a2,4
    dc44:	40d60633          	sub	a2,a2,a3
    dc48:	00261613          	sll	a2,a2,0x2
    dc4c:	00269693          	sll	a3,a3,0x2
    dc50:	00800593          	li	a1,8
    dc54:	00d806b3          	add	a3,a6,a3
    dc58:	00b66a63          	bltu	a2,a1,dc6c <.L141>
    dc5c:	0006a023          	sw	zero,0(a3) # 80000 <_ebss+0x6a110>
    dc60:	0006a223          	sw	zero,4(a3)
    dc64:	ff860613          	add	a2,a2,-8
    dc68:	00868693          	add	a3,a3,8

0000dc6c <.L141>:
    dc6c:	00400593          	li	a1,4
    dc70:	00b66463          	bltu	a2,a1,dc78 <.L142>
    dc74:	0006a023          	sw	zero,0(a3)

0000dc78 <.L142>:
    dc78:	02012683          	lw	a3,32(sp)

0000dc7c <.LBB64>:
    dc7c:	00e03733          	snez	a4,a4

0000dc80 <.LBE64>:
    dc80:	00d76733          	or	a4,a4,a3

0000dc84 <.L143>:
    dc84:	02412583          	lw	a1,36(sp)

0000dc88 <.LBB67>:
    dc88:	02e12023          	sw	a4,32(sp)

0000dc8c <.LBB68>:
    dc8c:	40e78733          	sub	a4,a5,a4

0000dc90 <.LVL263>:
    dc90:	40b90633          	sub	a2,s2,a1

0000dc94 <.LVL264>:
    dc94:	00e7b6b3          	sltu	a3,a5,a4
    dc98:	00c93533          	sltu	a0,s2,a2

0000dc9c <.LVL265>:
    dc9c:	40d60633          	sub	a2,a2,a3

0000dca0 <.LVL266>:
    dca0:	00000693          	li	a3,0
    dca4:	00e7f663          	bgeu	a5,a4,dcb0 <.L148>
    dca8:	412585b3          	sub	a1,a1,s2
    dcac:	0015b693          	seqz	a3,a1

0000dcb0 <.L148>:
    dcb0:	00a6e7b3          	or	a5,a3,a0

0000dcb4 <.LVL267>:
    dcb4:	02812503          	lw	a0,40(sp)
    dcb8:	00000693          	li	a3,0
    dcbc:	40a985b3          	sub	a1,s3,a0

0000dcc0 <.LVL268>:
    dcc0:	00b9b833          	sltu	a6,s3,a1

0000dcc4 <.LVL269>:
    dcc4:	40f585b3          	sub	a1,a1,a5

0000dcc8 <.LVL270>:
    dcc8:	00078663          	beqz	a5,dcd4 <.L151>
    dccc:	41350533          	sub	a0,a0,s3
    dcd0:	00153693          	seqz	a3,a0

0000dcd4 <.L151>:
    dcd4:	02c12783          	lw	a5,44(sp)

0000dcd8 <.LVL272>:
    dcd8:	0106e6b3          	or	a3,a3,a6

0000dcdc <.LVL273>:
    dcdc:	40fb07b3          	sub	a5,s6,a5
    dce0:	40d787b3          	sub	a5,a5,a3

0000dce4 <.L130>:
    dce4:	02e12823          	sw	a4,48(sp)

0000dce8 <.LBB70>:
    dce8:	02f12e23          	sw	a5,60(sp)
    dcec:	02b12c23          	sw	a1,56(sp)
    dcf0:	02c12a23          	sw	a2,52(sp)

0000dcf4 <.LBE70>:
    dcf4:	00c79713          	sll	a4,a5,0xc
    dcf8:	de075863          	bgez	a4,d2e8 <.L10>

0000dcfc <.LBB71>:
    dcfc:	00080737          	lui	a4,0x80
    dd00:	fff70713          	add	a4,a4,-1 # 7ffff <_ebss+0x6a10f>
    dd04:	00e7f7b3          	and	a5,a5,a4
    dd08:	02f12e23          	sw	a5,60(sp)
    dd0c:	5740006f          	j	e280 <.L233>

0000dd10 <.L139>:
    dd10:	00052883          	lw	a7,0(a0)
    dd14:	00452f03          	lw	t5,4(a0)
    dd18:	00b50fb3          	add	t6,a0,a1
    dd1c:	01d8d8b3          	srl	a7,a7,t4
    dd20:	006f1f33          	sll	t5,t5,t1
    dd24:	01e8e8b3          	or	a7,a7,t5
    dd28:	011fa023          	sw	a7,0(t6)

0000dd2c <.LVL277>:
    dd2c:	001e0e13          	add	t3,t3,1

0000dd30 <.LVL278>:
    dd30:	00450513          	add	a0,a0,4
    dd34:	ee9ff06f          	j	dc1c <.L138>

0000dd38 <.L118>:
    dd38:	02412983          	lw	s3,36(sp)
    dd3c:	02812c03          	lw	s8,40(sp)
    dd40:	02c12b03          	lw	s6,44(sp)

0000dd44 <.LBB137>:
    dd44:	28088463          	beqz	a7,dfcc <.L152>
    dd48:	409b8333          	sub	t1,s7,s1

0000dd4c <.LVL280>:
    dd4c:	0a049e63          	bnez	s1,de08 <.L153>
    dd50:	01412583          	lw	a1,20(sp)
    dd54:	01812803          	lw	a6,24(sp)
    dd58:	01c12683          	lw	a3,28(sp)
    dd5c:	0105e8b3          	or	a7,a1,a6
    dd60:	00d8e8b3          	or	a7,a7,a3
    dd64:	00f8e8b3          	or	a7,a7,a5
    dd68:	02089063          	bnez	a7,dd88 <.L154>

0000dd6c <.LVL281>:
    dd6c:	02812823          	sw	s0,48(sp)
    dd70:	03312a23          	sw	s3,52(sp)
    dd74:	03812c23          	sw	s8,56(sp)
    dd78:	03612e23          	sw	s6,60(sp)

0000dd7c <.LBB138>:
    dd7c:	00030493          	mv	s1,t1

0000dd80 <.L361>:
    dd80:	00090a93          	mv	s5,s2

0000dd84 <.LVL284>:
    dd84:	d64ff06f          	j	d2e8 <.L10>

0000dd88 <.L154>:
    dd88:	fff30893          	add	a7,t1,-1

0000dd8c <.LVL286>:
    dd8c:	04089c63          	bnez	a7,dde4 <.L155>

0000dd90 <.LBB73>:
    dd90:	40f40733          	sub	a4,s0,a5

0000dd94 <.LVL288>:
    dd94:	40b98633          	sub	a2,s3,a1

0000dd98 <.LVL289>:
    dd98:	00e437b3          	sltu	a5,s0,a4
    dd9c:	00c9b533          	sltu	a0,s3,a2

0000dda0 <.LVL290>:
    dda0:	40f60633          	sub	a2,a2,a5

0000dda4 <.LVL291>:
    dda4:	00000793          	li	a5,0
    dda8:	00e47663          	bgeu	s0,a4,ddb4 <.L160>
    ddac:	413585b3          	sub	a1,a1,s3
    ddb0:	0015b793          	seqz	a5,a1

0000ddb4 <.L160>:
    ddb4:	00a7e7b3          	or	a5,a5,a0

0000ddb8 <.LVL292>:
    ddb8:	410c05b3          	sub	a1,s8,a6

0000ddbc <.LVL293>:
    ddbc:	00bc3533          	sltu	a0,s8,a1

0000ddc0 <.LVL294>:
    ddc0:	40f585b3          	sub	a1,a1,a5

0000ddc4 <.LVL295>:
    ddc4:	00078663          	beqz	a5,ddd0 <.L163>
    ddc8:	41880833          	sub	a6,a6,s8
    ddcc:	00183893          	seqz	a7,a6

0000ddd0 <.L163>:
    ddd0:	40db07b3          	sub	a5,s6,a3

0000ddd4 <.LVL297>:
    ddd4:	00a8e6b3          	or	a3,a7,a0

0000ddd8 <.LVL298>:
    ddd8:	40d787b3          	sub	a5,a5,a3

0000dddc <.LBE73>:
    dddc:	00090a93          	mv	s5,s2

0000dde0 <.LVL299>:
    dde0:	d45ff06f          	j	db24 <.L356>

0000dde4 <.L155>:
    dde4:	000087b7          	lui	a5,0x8
    dde8:	fff78793          	add	a5,a5,-1 # 7fff <__kernel_rem_pio2+0x5f>
    ddec:	76f31263          	bne	t1,a5,e550 <.L164>

0000ddf0 <.L165>:
    ddf0:	02812823          	sw	s0,48(sp)
    ddf4:	03312a23          	sw	s3,52(sp)
    ddf8:	03812c23          	sw	s8,56(sp)
    ddfc:	03612e23          	sw	s6,60(sp)
    de00:	00090a93          	mv	s5,s2

0000de04 <.LVL302>:
    de04:	911ff06f          	j	d714 <.L359>

0000de08 <.L153>:
    de08:	000087b7          	lui	a5,0x8
    de0c:	fff78793          	add	a5,a5,-1 # 7fff <__kernel_rem_pio2+0x5f>
    de10:	fefb80e3          	beq	s7,a5,ddf0 <.L165>
    de14:	01c12783          	lw	a5,28(sp)
    de18:	00080737          	lui	a4,0x80
    de1c:	00e7e7b3          	or	a5,a5,a4
    de20:	00f12e23          	sw	a5,28(sp)

0000de24 <.LDL4>:
    de24:	07400793          	li	a5,116
    de28:	1867c863          	blt	a5,t1,dfb8 <.L166>

0000de2c <.L270>:
    de2c:	02000793          	li	a5,32
    de30:	02f347b3          	div	a5,t1,a5

0000de34 <.LVL304>:
    de34:	00060693          	mv	a3,a2
    de38:	00000493          	li	s1,0

0000de3c <.LVL305>:
    de3c:	00000713          	li	a4,0

0000de40 <.L167>:
    de40:	02f74e63          	blt	a4,a5,de7c <.L168>
    de44:	00300713          	li	a4,3

0000de48 <.LVL307>:
    de48:	01f37893          	and	a7,t1,31
    de4c:	40f70e33          	sub	t3,a4,a5
    de50:	00279593          	sll	a1,a5,0x2
    de54:	02089e63          	bnez	a7,de90 <.L169>

0000de58 <.L170>:
    de58:	00b60733          	add	a4,a2,a1
    de5c:	00072703          	lw	a4,0(a4) # 80000 <_ebss+0x6a110>
    de60:	00188893          	add	a7,a7,1

0000de64 <.LVL309>:
    de64:	00460613          	add	a2,a2,4
    de68:	fee62e23          	sw	a4,-4(a2)

0000de6c <.LVL310>:
    de6c:	ff1e56e3          	bge	t3,a7,de58 <.L170>
    de70:	00400713          	li	a4,4
    de74:	40f707b3          	sub	a5,a4,a5

0000de78 <.LVL311>:
    de78:	0780006f          	j	def0 <.L175>

0000de7c <.L168>:
    de7c:	0006a583          	lw	a1,0(a3)
    de80:	00170713          	add	a4,a4,1

0000de84 <.LVL313>:
    de84:	00468693          	add	a3,a3,4
    de88:	00b4e4b3          	or	s1,s1,a1

0000de8c <.LVL314>:
    de8c:	fb5ff06f          	j	de40 <.L167>

0000de90 <.L169>:
    de90:	02000613          	li	a2,32
    de94:	02c36733          	rem	a4,t1,a2
    de98:	00078693          	mv	a3,a5
    de9c:	40e60633          	sub	a2,a2,a4
    dea0:	0007d463          	bgez	a5,dea8 <.L172>

0000dea4 <.LVL316>:
    dea4:	00000693          	li	a3,0

0000dea8 <.L172>:
    dea8:	00269693          	sll	a3,a3,0x2
    deac:	04068713          	add	a4,a3,64
    deb0:	002706b3          	add	a3,a4,sp
    deb4:	fd06a703          	lw	a4,-48(a3)
    deb8:	00b506b3          	add	a3,a0,a1
    debc:	40b005b3          	neg	a1,a1
    dec0:	00c71733          	sll	a4,a4,a2
    dec4:	00e4e4b3          	or	s1,s1,a4

0000dec8 <.LVL318>:
    dec8:	00000713          	li	a4,0

0000decc <.L173>:
    decc:	0dc74263          	blt	a4,t3,df90 <.L174>
    ded0:	01c12683          	lw	a3,28(sp)
    ded4:	00400713          	li	a4,4

0000ded8 <.LVL320>:
    ded8:	40f707b3          	sub	a5,a4,a5

0000dedc <.LVL321>:
    dedc:	002e1713          	sll	a4,t3,0x2
    dee0:	04070713          	add	a4,a4,64
    dee4:	00270733          	add	a4,a4,sp
    dee8:	0116d6b3          	srl	a3,a3,a7
    deec:	fcd72823          	sw	a3,-48(a4)

0000def0 <.L175>:
    def0:	0057a713          	slti	a4,a5,5
    def4:	00000613          	li	a2,0
    def8:	00070863          	beqz	a4,df08 <.L177>
    defc:	00400613          	li	a2,4
    df00:	40f60633          	sub	a2,a2,a5
    df04:	00261613          	sll	a2,a2,0x2

0000df08 <.L177>:
    df08:	00279793          	sll	a5,a5,0x2
    df0c:	00f50533          	add	a0,a0,a5
    df10:	00000593          	li	a1,0
    df14:	e85f40ef          	jal	2d98 <__GI_memset>

0000df18 <.LBE75>:
    df18:	01012783          	lw	a5,16(sp)

0000df1c <.LBB76>:
    df1c:	00903733          	snez	a4,s1

0000df20 <.LBE76>:
    df20:	00f76733          	or	a4,a4,a5

0000df24 <.L178>:
    df24:	01412683          	lw	a3,20(sp)

0000df28 <.LBB79>:
    df28:	00e12823          	sw	a4,16(sp)

0000df2c <.LBB80>:
    df2c:	40e40733          	sub	a4,s0,a4

0000df30 <.LVL326>:
    df30:	40d98633          	sub	a2,s3,a3

0000df34 <.LVL327>:
    df34:	00e437b3          	sltu	a5,s0,a4
    df38:	00c9b5b3          	sltu	a1,s3,a2

0000df3c <.LVL328>:
    df3c:	40f60633          	sub	a2,a2,a5

0000df40 <.LVL329>:
    df40:	00000793          	li	a5,0
    df44:	00e47663          	bgeu	s0,a4,df50 <.L183>
    df48:	413686b3          	sub	a3,a3,s3
    df4c:	0016b793          	seqz	a5,a3

0000df50 <.L183>:
    df50:	01812503          	lw	a0,24(sp)
    df54:	00b7e7b3          	or	a5,a5,a1

0000df58 <.LVL330>:
    df58:	00000693          	li	a3,0
    df5c:	40ac05b3          	sub	a1,s8,a0

0000df60 <.LVL331>:
    df60:	00bc3833          	sltu	a6,s8,a1

0000df64 <.LVL332>:
    df64:	40f585b3          	sub	a1,a1,a5

0000df68 <.LVL333>:
    df68:	00078663          	beqz	a5,df74 <.L186>
    df6c:	41850533          	sub	a0,a0,s8
    df70:	00153693          	seqz	a3,a0

0000df74 <.L186>:
    df74:	01c12783          	lw	a5,28(sp)

0000df78 <.LVL335>:
    df78:	0106e6b3          	or	a3,a3,a6

0000df7c <.LBE80>:
    df7c:	000b8493          	mv	s1,s7

0000df80 <.LBB81>:
    df80:	40fb07b3          	sub	a5,s6,a5
    df84:	40d787b3          	sub	a5,a5,a3

0000df88 <.LBE81>:
    df88:	00090a93          	mv	s5,s2

0000df8c <.LVL337>:
    df8c:	d59ff06f          	j	dce4 <.L130>

0000df90 <.L174>:
    df90:	0006a803          	lw	a6,0(a3)
    df94:	0046a303          	lw	t1,4(a3)
    df98:	00b68eb3          	add	t4,a3,a1
    df9c:	01185833          	srl	a6,a6,a7
    dfa0:	00c31333          	sll	t1,t1,a2
    dfa4:	00686833          	or	a6,a6,t1
    dfa8:	010ea023          	sw	a6,0(t4)

0000dfac <.LVL339>:
    dfac:	00170713          	add	a4,a4,1

0000dfb0 <.LVL340>:
    dfb0:	00468693          	add	a3,a3,4
    dfb4:	f19ff06f          	j	decc <.L173>

0000dfb8 <.L166>:
    dfb8:	00012e23          	sw	zero,28(sp)
    dfbc:	00012c23          	sw	zero,24(sp)
    dfc0:	00012a23          	sw	zero,20(sp)
    dfc4:	00100713          	li	a4,1
    dfc8:	f5dff06f          	j	df24 <.L178>

0000dfcc <.L152>:
    dfcc:	00148713          	add	a4,s1,1
    dfd0:	01171513          	sll	a0,a4,0x11
    dfd4:	01255513          	srl	a0,a0,0x12

0000dfd8 <.LBB142>:
    dfd8:	01412683          	lw	a3,20(sp)
    dfdc:	01812603          	lw	a2,24(sp)
    dfe0:	01c12583          	lw	a1,28(sp)

0000dfe4 <.LBB143>:
    dfe4:	00008337          	lui	t1,0x8
    dfe8:	1e051063          	bnez	a0,e1c8 <.L187>
    dfec:	0189e533          	or	a0,s3,s8
    dff0:	00c6e833          	or	a6,a3,a2
    dff4:	01656533          	or	a0,a0,s6
    dff8:	00b86833          	or	a6,a6,a1
    dffc:	00856533          	or	a0,a0,s0
    e000:	00f86833          	or	a6,a6,a5
    e004:	10049863          	bnez	s1,e114 <.L188>

0000e008 <.LVL343>:
    e008:	02081263          	bnez	a6,e02c <.L189>
    e00c:	02812823          	sw	s0,48(sp)
    e010:	03312a23          	sw	s3,52(sp)
    e014:	03812c23          	sw	s8,56(sp)
    e018:	03612e23          	sw	s6,60(sp)
    e01c:	00090a93          	mv	s5,s2

0000e020 <.LVL344>:
    e020:	ac051463          	bnez	a0,d2e8 <.L10>

0000e024 <.L209>:
    e024:	00000493          	li	s1,0

0000e028 <.LVL346>:
    e028:	9d9ff06f          	j	da00 <.L358>

0000e02c <.L189>:
    e02c:	00051c63          	bnez	a0,e044 <.L190>
    e030:	02f12823          	sw	a5,48(sp)
    e034:	02d12a23          	sw	a3,52(sp)
    e038:	02c12c23          	sw	a2,56(sp)
    e03c:	02b12e23          	sw	a1,60(sp)

0000e040 <.LBB146>:
  FP_PACK_SEMIRAW_Q (r, R);
    e040:	8d5ff06f          	j	d914 <.L357>

0000e044 <.L190>:
  FP_SUB_Q (R, A, B);
    e044:	40878533          	sub	a0,a5,s0

0000e048 <.LVL350>:
    e048:	41368e33          	sub	t3,a3,s3

0000e04c <.LVL351>:
    e04c:	00a7b833          	sltu	a6,a5,a0
    e050:	01c6b8b3          	sltu	a7,a3,t3

0000e054 <.LVL352>:
    e054:	410e0833          	sub	a6,t3,a6

0000e058 <.LVL353>:
    e058:	00000713          	li	a4,0
    e05c:	00a7f463          	bgeu	a5,a0,e064 <.L196>
    e060:	001e3713          	seqz	a4,t3

0000e064 <.L196>:
    e064:	01176733          	or	a4,a4,a7

0000e068 <.LVL354>:
    e068:	418608b3          	sub	a7,a2,s8

0000e06c <.LVL355>:
    e06c:	01163f33          	sltu	t5,a2,a7

0000e070 <.LVL356>:
    e070:	40e88eb3          	sub	t4,a7,a4

0000e074 <.LVL357>:
    e074:	00000313          	li	t1,0
    e078:	00070463          	beqz	a4,e080 <.L199>
    e07c:	0018b313          	seqz	t1,a7

0000e080 <.L199>:
    e080:	01e36333          	or	t1,t1,t5

0000e084 <.LVL359>:
    e084:	41658733          	sub	a4,a1,s6

0000e088 <.LVL360>:
    e088:	40670733          	sub	a4,a4,t1
    e08c:	02e12e23          	sw	a4,60(sp)
    e090:	03d12c23          	sw	t4,56(sp)
    e094:	03012a23          	sw	a6,52(sp)
    e098:	02a12823          	sw	a0,48(sp)

0000e09c <.LBE83>:
    e09c:	00c71313          	sll	t1,a4,0xc

0000e0a0 <.LVL362>:
    e0a0:	06035063          	bgez	t1,e100 <.L200>

0000e0a4 <.LBB84>:
    e0a4:	40f407b3          	sub	a5,s0,a5

0000e0a8 <.LVL363>:
    e0a8:	40d986b3          	sub	a3,s3,a3

0000e0ac <.LVL364>:
    e0ac:	00f43733          	sltu	a4,s0,a5
    e0b0:	00d9b9b3          	sltu	s3,s3,a3

0000e0b4 <.LVL365>:
    e0b4:	40e686b3          	sub	a3,a3,a4

0000e0b8 <.LVL366>:
    e0b8:	00000713          	li	a4,0
    e0bc:	00f47463          	bgeu	s0,a5,e0c4 <.L205>
    e0c0:	001e3713          	seqz	a4,t3

0000e0c4 <.L205>:
    e0c4:	40cc0633          	sub	a2,s8,a2
    e0c8:	013769b3          	or	s3,a4,s3

0000e0cc <.LVL367>:
    e0cc:	00cc3c33          	sltu	s8,s8,a2

0000e0d0 <.LVL368>:
    e0d0:	00000513          	li	a0,0

0000e0d4 <.LVL369>:
    e0d4:	41360633          	sub	a2,a2,s3

0000e0d8 <.LVL370>:
    e0d8:	00098463          	beqz	s3,e0e0 <.L208>
    e0dc:	0018b513          	seqz	a0,a7

0000e0e0 <.L208>:
    e0e0:	40bb05b3          	sub	a1,s6,a1
    e0e4:	01856533          	or	a0,a0,s8

0000e0e8 <.LVL372>:
    e0e8:	40a585b3          	sub	a1,a1,a0
    e0ec:	02b12e23          	sw	a1,60(sp)
    e0f0:	02c12c23          	sw	a2,56(sp)
    e0f4:	02d12a23          	sw	a3,52(sp)
    e0f8:	02f12823          	sw	a5,48(sp)

0000e0fc <.LVL373>:
    e0fc:	c85ff06f          	j	dd80 <.L361>

0000e100 <.L200>:
    e100:	01056533          	or	a0,a0,a6

0000e104 <.LVL375>:
    e104:	01d56533          	or	a0,a0,t4
    e108:	00e56533          	or	a0,a0,a4
    e10c:	f0050ce3          	beqz	a0,e024 <.L209>
    e110:	805ff06f          	j	d914 <.L357>

0000e114 <.L188>:
    e114:	03010893          	add	a7,sp,48
    e118:	03c10713          	add	a4,sp,60
    e11c:	04081e63          	bnez	a6,e178 <.L210>
    e120:	02051e63          	bnez	a0,e15c <.L211>

0000e124 <.LVL377>:
    e124:	02612e23          	sw	t1,60(sp)
    e128:	02012c23          	sw	zero,56(sp)
    e12c:	02012a23          	sw	zero,52(sp)
    e130:	02012823          	sw	zero,48(sp)

0000e134 <.LBB85>:
    e134:	00070793          	mv	a5,a4

0000e138 <.L212>:
    e138:	0007a703          	lw	a4,0(a5)
    e13c:	ffc7a683          	lw	a3,-4(a5)
    e140:	ffc78793          	add	a5,a5,-4
    e144:	00371713          	sll	a4,a4,0x3
    e148:	01d6d693          	srl	a3,a3,0x1d
    e14c:	00d76733          	or	a4,a4,a3
    e150:	00e7a223          	sw	a4,4(a5)
    e154:	fef892e3          	bne	a7,a5,e138 <.L212>
    e158:	8a1ff06f          	j	d9f8 <.L213>

0000e15c <.L211>:
    e15c:	02812823          	sw	s0,48(sp)
    e160:	03312a23          	sw	s3,52(sp)
    e164:	03812c23          	sw	s8,56(sp)
    e168:	03612e23          	sw	s6,60(sp)

0000e16c <.LBB148>:
    e16c:	00090a93          	mv	s5,s2

0000e170 <.L362>:
    e170:	fff30493          	add	s1,t1,-1 # 7fff <__kernel_rem_pio2+0x5f>

0000e174 <.LVL382>:
    e174:	974ff06f          	j	d2e8 <.L10>

0000e178 <.L210>:
    e178:	00051c63          	bnez	a0,e190 <.L214>

0000e17c <.LVL384>:
    e17c:	02f12823          	sw	a5,48(sp)
    e180:	02d12a23          	sw	a3,52(sp)
    e184:	02c12c23          	sw	a2,56(sp)
    e188:	02b12e23          	sw	a1,60(sp)
    e18c:	fe5ff06f          	j	e170 <.L362>

0000e190 <.L214>:
    e190:	02612e23          	sw	t1,60(sp)
    e194:	02012c23          	sw	zero,56(sp)
    e198:	02012a23          	sw	zero,52(sp)
    e19c:	02012823          	sw	zero,48(sp)

0000e1a0 <.LBB86>:
    e1a0:	00070793          	mv	a5,a4

0000e1a4 <.L215>:
    e1a4:	0007a703          	lw	a4,0(a5)
    e1a8:	ffc7a683          	lw	a3,-4(a5)
    e1ac:	ffc78793          	add	a5,a5,-4
    e1b0:	00371713          	sll	a4,a4,0x3
    e1b4:	01d6d693          	srl	a3,a3,0x1d
    e1b8:	00d76733          	or	a4,a4,a3
    e1bc:	00e7a223          	sw	a4,4(a5)
    e1c0:	fef892e3          	bne	a7,a5,e1a4 <.L215>
    e1c4:	835ff06f          	j	d9f8 <.L213>

0000e1c8 <.L187>:
    e1c8:	40878533          	sub	a0,a5,s0

0000e1cc <.LVL389>:
    e1cc:	41368eb3          	sub	t4,a3,s3

0000e1d0 <.LVL390>:
    e1d0:	00a7b833          	sltu	a6,a5,a0
    e1d4:	01d6b333          	sltu	t1,a3,t4

0000e1d8 <.LVL391>:
    e1d8:	410e8833          	sub	a6,t4,a6

0000e1dc <.LVL392>:
    e1dc:	00000713          	li	a4,0
    e1e0:	00a7f463          	bgeu	a5,a0,e1e8 <.L220>
    e1e4:	001eb713          	seqz	a4,t4

0000e1e8 <.L220>:
    e1e8:	00676733          	or	a4,a4,t1

0000e1ec <.LVL393>:
    e1ec:	41860333          	sub	t1,a2,s8

0000e1f0 <.LVL394>:
    e1f0:	00663fb3          	sltu	t6,a2,t1

0000e1f4 <.LVL395>:
    e1f4:	40e30f33          	sub	t5,t1,a4

0000e1f8 <.LVL396>:
    e1f8:	00000e13          	li	t3,0
    e1fc:	00070463          	beqz	a4,e204 <.L223>
    e200:	00133e13          	seqz	t3,t1

0000e204 <.L223>:
    e204:	01fe6e33          	or	t3,t3,t6

0000e208 <.LVL398>:
    e208:	41658733          	sub	a4,a1,s6

0000e20c <.LVL399>:
    e20c:	41c70733          	sub	a4,a4,t3
    e210:	02e12e23          	sw	a4,60(sp)
    e214:	03e12c23          	sw	t5,56(sp)
    e218:	03012a23          	sw	a6,52(sp)
    e21c:	02a12823          	sw	a0,48(sp)

0000e220 <.LBE87>:
    e220:	00c71e13          	sll	t3,a4,0xc

0000e224 <.LVL401>:
    e224:	140e5663          	bgez	t3,e370 <.L224>

0000e228 <.LBB88>:
    e228:	40f407b3          	sub	a5,s0,a5

0000e22c <.LVL402>:
    e22c:	40d986b3          	sub	a3,s3,a3

0000e230 <.LVL403>:
    e230:	00f43733          	sltu	a4,s0,a5
    e234:	00d9b9b3          	sltu	s3,s3,a3

0000e238 <.LVL404>:
    e238:	40e686b3          	sub	a3,a3,a4

0000e23c <.LVL405>:
    e23c:	00000713          	li	a4,0
    e240:	00f47463          	bgeu	s0,a5,e248 <.L229>
    e244:	001eb713          	seqz	a4,t4

0000e248 <.L229>:
    e248:	40cc0633          	sub	a2,s8,a2
    e24c:	013769b3          	or	s3,a4,s3

0000e250 <.LVL406>:
    e250:	00cc3c33          	sltu	s8,s8,a2

0000e254 <.LVL407>:
    e254:	41360633          	sub	a2,a2,s3

0000e258 <.LVL408>:
    e258:	00098463          	beqz	s3,e260 <.L232>
    e25c:	00133893          	seqz	a7,t1

0000e260 <.L232>:
    e260:	40bb05b3          	sub	a1,s6,a1
    e264:	0188e733          	or	a4,a7,s8

0000e268 <.LVL410>:
    e268:	40e58733          	sub	a4,a1,a4

0000e26c <.LVL411>:
    e26c:	02e12e23          	sw	a4,60(sp)
    e270:	02c12c23          	sw	a2,56(sp)
    e274:	02d12a23          	sw	a3,52(sp)
    e278:	02f12823          	sw	a5,48(sp)

0000e27c <.LBE88>:
    e27c:	00090a93          	mv	s5,s2

0000e280 <.L233>:
    e280:	03c12503          	lw	a0,60(sp)
    e284:	10050063          	beqz	a0,e384 <.L234>
    e288:	b8cf30ef          	jal	1614 <__clzsi2>

0000e28c <.L235>:
    e28c:	ff450513          	add	a0,a0,-12

0000e290 <.LBB56>:
    e290:	02000713          	li	a4,32
    e294:	01f57813          	and	a6,a0,31
    e298:	02e547b3          	div	a5,a0,a4

0000e29c <.LVL416>:
    e29c:	12080063          	beqz	a6,e3bc <.L238>
    e2a0:	03010313          	add	t1,sp,48
    e2a4:	02e566b3          	rem	a3,a0,a4

0000e2a8 <.LVL417>:
    e2a8:	40d70633          	sub	a2,a4,a3
    e2ac:	ffc00693          	li	a3,-4

0000e2b0 <.LVL418>:
    e2b0:	02d786b3          	mul	a3,a5,a3
    e2b4:	00c68713          	add	a4,a3,12
    e2b8:	00e30733          	add	a4,t1,a4
    e2bc:	40d006b3          	neg	a3,a3

0000e2c0 <.L239>:
    e2c0:	12e31663          	bne	t1,a4,e3ec <.L242>
    e2c4:	03012683          	lw	a3,48(sp)
    e2c8:	fff78713          	add	a4,a5,-1

0000e2cc <.LVL419>:
    e2cc:	00279793          	sll	a5,a5,0x2

0000e2d0 <.LVL420>:
    e2d0:	04078793          	add	a5,a5,64
    e2d4:	002787b3          	add	a5,a5,sp
    e2d8:	010696b3          	sll	a3,a3,a6
    e2dc:	fed7a823          	sw	a3,-16(a5)

0000e2e0 <.L243>:
    e2e0:	00170713          	add	a4,a4,1
    e2e4:	03010793          	add	a5,sp,48
    e2e8:	00271713          	sll	a4,a4,0x2
    e2ec:	00800693          	li	a3,8
    e2f0:	00078893          	mv	a7,a5
    e2f4:	00d76a63          	bltu	a4,a3,e308 <.L244>
    e2f8:	02012823          	sw	zero,48(sp)
    e2fc:	0007a223          	sw	zero,4(a5)
    e300:	ff870713          	add	a4,a4,-8
    e304:	03810793          	add	a5,sp,56

0000e308 <.L244>:
    e308:	00400693          	li	a3,4
    e30c:	00d76463          	bltu	a4,a3,e314 <.L245>
    e310:	0007a023          	sw	zero,0(a5)

0000e314 <.L245>:
    e314:	1c954863          	blt	a0,s1,e4e4 <.L246>
    e318:	40950533          	sub	a0,a0,s1

0000e31c <.LVL422>:
    e31c:	00150513          	add	a0,a0,1

0000e320 <.LBB52>:
    e320:	40555713          	sra	a4,a0,0x5

0000e324 <.LVL424>:
    e324:	01f57793          	and	a5,a0,31

0000e328 <.LVL425>:
    e328:	00088593          	mv	a1,a7
    e32c:	00088613          	mv	a2,a7
    e330:	00000313          	li	t1,0
    e334:	00000693          	li	a3,0

0000e338 <.L247>:
    e338:	0ce69c63          	bne	a3,a4,e410 <.L248>
    e33c:	00300693          	li	a3,3

0000e340 <.LVL427>:
    e340:	40e686b3          	sub	a3,a3,a4
    e344:	00271613          	sll	a2,a4,0x2
    e348:	0c079e63          	bnez	a5,e424 <.L249>

0000e34c <.L250>:
    e34c:	00c58533          	add	a0,a1,a2
    e350:	00052503          	lw	a0,0(a0)
    e354:	00178793          	add	a5,a5,1

0000e358 <.LVL429>:
    e358:	00458593          	add	a1,a1,4
    e35c:	fea5ae23          	sw	a0,-4(a1)

0000e360 <.LVL430>:
    e360:	fef6d6e3          	bge	a3,a5,e34c <.L250>
    e364:	00400793          	li	a5,4

0000e368 <.LVL431>:
    e368:	40e78733          	sub	a4,a5,a4

0000e36c <.LVL432>:
    e36c:	1040006f          	j	e470 <.L254>

0000e370 <.L224>:
    e370:	01056533          	or	a0,a0,a6

0000e374 <.LVL434>:
    e374:	01e56533          	or	a0,a0,t5
    e378:	00e56533          	or	a0,a0,a4
    e37c:	ca0504e3          	beqz	a0,e024 <.L209>
    e380:	f01ff06f          	j	e280 <.L233>

0000e384 <.L234>:
    e384:	03812503          	lw	a0,56(sp)
    e388:	00050863          	beqz	a0,e398 <.L236>
    e38c:	a88f30ef          	jal	1614 <__clzsi2>

0000e390 <.LVL436>:
    e390:	02050513          	add	a0,a0,32
    e394:	ef9ff06f          	j	e28c <.L235>

0000e398 <.L236>:
    e398:	03412503          	lw	a0,52(sp)
    e39c:	00050863          	beqz	a0,e3ac <.L237>
    e3a0:	a74f30ef          	jal	1614 <__clzsi2>

0000e3a4 <.LVL439>:
    e3a4:	04050513          	add	a0,a0,64
    e3a8:	ee5ff06f          	j	e28c <.L235>

0000e3ac <.L237>:
    e3ac:	03012503          	lw	a0,48(sp)
    e3b0:	a64f30ef          	jal	1614 <__clzsi2>

0000e3b4 <.LVL442>:
    e3b4:	06050513          	add	a0,a0,96
    e3b8:	ed5ff06f          	j	e28c <.L235>

0000e3bc <.L238>:
    e3bc:	ffc00613          	li	a2,-4
    e3c0:	02c78633          	mul	a2,a5,a2
    e3c4:	03c10713          	add	a4,sp,60

0000e3c8 <.LBB58>:
    e3c8:	00300693          	li	a3,3

0000e3cc <.L240>:
    e3cc:	00c705b3          	add	a1,a4,a2
    e3d0:	0005a583          	lw	a1,0(a1)
    e3d4:	fff68693          	add	a3,a3,-1

0000e3d8 <.LVL446>:
    e3d8:	ffc70713          	add	a4,a4,-4
    e3dc:	00b72223          	sw	a1,4(a4)

0000e3e0 <.LVL447>:
    e3e0:	fef6d6e3          	bge	a3,a5,e3cc <.L240>
    e3e4:	fff78713          	add	a4,a5,-1
    e3e8:	ef9ff06f          	j	e2e0 <.L243>

0000e3ec <.L242>:
    e3ec:	00072583          	lw	a1,0(a4)
    e3f0:	ffc72883          	lw	a7,-4(a4)
    e3f4:	00d70e33          	add	t3,a4,a3
    e3f8:	010595b3          	sll	a1,a1,a6
    e3fc:	00c8d8b3          	srl	a7,a7,a2
    e400:	0115e5b3          	or	a1,a1,a7
    e404:	00be2023          	sw	a1,0(t3)
    e408:	ffc70713          	add	a4,a4,-4
    e40c:	eb5ff06f          	j	e2c0 <.L239>

0000e410 <.L248>:
    e410:	00062503          	lw	a0,0(a2)
    e414:	00168693          	add	a3,a3,1

0000e418 <.LVL450>:
    e418:	00460613          	add	a2,a2,4
    e41c:	00a36333          	or	t1,t1,a0

0000e420 <.LVL451>:
    e420:	f19ff06f          	j	e338 <.L247>

0000e424 <.L249>:
    e424:	04060593          	add	a1,a2,64
    e428:	002585b3          	add	a1,a1,sp
    e42c:	ff05a583          	lw	a1,-16(a1)
    e430:	02000813          	li	a6,32
    e434:	40f80833          	sub	a6,a6,a5
    e438:	010595b3          	sll	a1,a1,a6
    e43c:	00b36333          	or	t1,t1,a1

0000e440 <.LVL453>:
    e440:	00000e13          	li	t3,0
    e444:	00c885b3          	add	a1,a7,a2
    e448:	40c00633          	neg	a2,a2

0000e44c <.L252>:
    e44c:	06de4863          	blt	t3,a3,e4bc <.L253>
    e450:	00400613          	li	a2,4
    e454:	40e60733          	sub	a4,a2,a4

0000e458 <.LVL455>:
    e458:	03c12603          	lw	a2,60(sp)
    e45c:	00269693          	sll	a3,a3,0x2

0000e460 <.LVL456>:
    e460:	04068693          	add	a3,a3,64
    e464:	002686b3          	add	a3,a3,sp
    e468:	00f657b3          	srl	a5,a2,a5

0000e46c <.LVL457>:
    e46c:	fef6a823          	sw	a5,-16(a3)

0000e470 <.L254>:
    e470:	00400693          	li	a3,4
    e474:	40e686b3          	sub	a3,a3,a4
    e478:	00271713          	sll	a4,a4,0x2
    e47c:	00e887b3          	add	a5,a7,a4
    e480:	00269713          	sll	a4,a3,0x2
    e484:	00800693          	li	a3,8
    e488:	00d76a63          	bltu	a4,a3,e49c <.L255>
    e48c:	0007a023          	sw	zero,0(a5)
    e490:	0007a223          	sw	zero,4(a5)
    e494:	ff870713          	add	a4,a4,-8
    e498:	00878793          	add	a5,a5,8

0000e49c <.L255>:
    e49c:	00400693          	li	a3,4
    e4a0:	00d76463          	bltu	a4,a3,e4a8 <.L256>
    e4a4:	0007a023          	sw	zero,0(a5)

0000e4a8 <.L256>:
    e4a8:	03012703          	lw	a4,48(sp)

0000e4ac <.LBB54>:
    e4ac:	006037b3          	snez	a5,t1

0000e4b0 <.LBE54>:
    e4b0:	00f767b3          	or	a5,a4,a5
    e4b4:	02f12823          	sw	a5,48(sp)
    e4b8:	c5cff06f          	j	d914 <.L357>

0000e4bc <.L253>:
    e4bc:	0005a503          	lw	a0,0(a1)
    e4c0:	0045ae83          	lw	t4,4(a1)
    e4c4:	00c58f33          	add	t5,a1,a2
    e4c8:	00f55533          	srl	a0,a0,a5
    e4cc:	010e9eb3          	sll	t4,t4,a6
    e4d0:	01d56533          	or	a0,a0,t4
    e4d4:	00af2023          	sw	a0,0(t5)

0000e4d8 <.LVL461>:
    e4d8:	001e0e13          	add	t3,t3,1

0000e4dc <.LVL462>:
    e4dc:	00458593          	add	a1,a1,4
    e4e0:	f6dff06f          	j	e44c <.L252>

0000e4e4 <.L246>:
    e4e4:	03c12783          	lw	a5,60(sp)
    e4e8:	fff80737          	lui	a4,0xfff80
    e4ec:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff6a10f>
    e4f0:	00e7f7b3          	and	a5,a5,a4
    e4f4:	40a484b3          	sub	s1,s1,a0
    e4f8:	02f12e23          	sw	a5,60(sp)

0000e4fc <.LBB153>:
  FP_PACK_SEMIRAW_Q (r, R);
    e4fc:	dedfe06f          	j	d2e8 <.L10>

0000e500 <.L263>:
    e500:	02012e23          	sw	zero,60(sp)
    e504:	02012c23          	sw	zero,56(sp)
    e508:	02012a23          	sw	zero,52(sp)
    e50c:	02012823          	sw	zero,48(sp)
    e510:	e59fe06f          	j	d368 <.L262>

0000e514 <.L343>:
  FP_SUB_Q (R, A, B);
    e514:	07400713          	li	a4,116
    e518:	00c74463          	blt	a4,a2,e520 <.L26>
    e51c:	f4dfe06f          	j	d468 <.L267>

0000e520 <.L26>:
    e520:	02012623          	sw	zero,44(sp)
    e524:	02012423          	sw	zero,40(sp)
    e528:	02012223          	sw	zero,36(sp)
    e52c:	00100713          	li	a4,1
    e530:	828ff06f          	j	d558 <.L37>

0000e534 <.L62>:
    e534:	07400793          	li	a5,116
    e538:	a0b7dc63          	bge	a5,a1,d750 <.L268>

0000e53c <.L64>:
    e53c:	00012e23          	sw	zero,28(sp)
    e540:	00012c23          	sw	zero,24(sp)
    e544:	00012a23          	sw	zero,20(sp)
    e548:	00100793          	li	a5,1
    e54c:	afcff06f          	j	d848 <.L76>

0000e550 <.L164>:
    e550:	07400793          	li	a5,116
    e554:	a717c2e3          	blt	a5,a7,dfb8 <.L166>
    e558:	00088313          	mv	t1,a7
    e55c:	8d1ff06f          	j	de2c <.L270>

0000e560 <__fixunstfsi>:
#include "soft-fp.h"
#include "quad.h"

USItype
__fixunstfsi (TFtype a)
{
    e560:	00052703          	lw	a4,0(a0)
    e564:	00c52783          	lw	a5,12(a0)
    e568:	00852583          	lw	a1,8(a0)
    e56c:	00452683          	lw	a3,4(a0)
    e570:	fe010113          	add	sp,sp,-32

0000e574 <.LBB3>:
  FP_DECL_EX;
  FP_DECL_Q (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    e574:	00e12023          	sw	a4,0(sp)
    e578:	00e12823          	sw	a4,16(sp)
    e57c:	00179613          	sll	a2,a5,0x1

0000e580 <.LBE3>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e580:	00004737          	lui	a4,0x4

0000e584 <.LBB4>:
  FP_UNPACK_RAW_Q (A, a);
    e584:	00d12223          	sw	a3,4(sp)
    e588:	00b12423          	sw	a1,8(sp)
    e58c:	00f12623          	sw	a5,12(sp)
    e590:	00b12c23          	sw	a1,24(sp)
    e594:	01165613          	srl	a2,a2,0x11

0000e598 <.LBE4>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e598:	ffe70713          	add	a4,a4,-2 # 3ffe <_dl_aux_init+0x2>
    e59c:	00000513          	li	a0,0
    e5a0:	06c75a63          	bge	a4,a2,e614 <.L1>
    e5a4:	01f7d813          	srl	a6,a5,0x1f
    e5a8:	00004737          	lui	a4,0x4

0000e5ac <.LBB5>:
  FP_UNPACK_RAW_Q (A, a);
    e5ac:	00080693          	mv	a3,a6

0000e5b0 <.LBE5>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e5b0:	01e70713          	add	a4,a4,30 # 401e <_dl_aux_init+0x22>
    e5b4:	00081663          	bnez	a6,e5c0 <.L5>
    e5b8:	00004737          	lui	a4,0x4
    e5bc:	01f70713          	add	a4,a4,31 # 401f <_dl_aux_init+0x23>

0000e5c0 <.L5>:
    e5c0:	fff80513          	add	a0,a6,-1
    e5c4:	04e65863          	bge	a2,a4,e614 <.L1>
    e5c8:	00000513          	li	a0,0
    e5cc:	04081463          	bnez	a6,e614 <.L1>

0000e5d0 <.LBB10>:
  FP_UNPACK_RAW_Q (A, a);
    e5d0:	01079793          	sll	a5,a5,0x10

0000e5d4 <.LBB11>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e5d4:	00010737          	lui	a4,0x10

0000e5d8 <.LBB12>:
  FP_UNPACK_RAW_Q (A, a);
    e5d8:	0107d793          	srl	a5,a5,0x10

0000e5dc <.LBB13>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e5dc:	00e7e7b3          	or	a5,a5,a4

0000e5e0 <.LBB7>:
    e5e0:	00004737          	lui	a4,0x4
    e5e4:	06f70713          	add	a4,a4,111 # 406f <atan2f+0x37>
    e5e8:	40c70733          	sub	a4,a4,a2
    e5ec:	40575613          	sra	a2,a4,0x5

0000e5f0 <.LBE7>:
    e5f0:	00f12e23          	sw	a5,28(sp)

0000e5f4 <.LBB8>:
    e5f4:	01f77713          	and	a4,a4,31

0000e5f8 <.LVL6>:
    e5f8:	02071263          	bnez	a4,e61c <.L7>

0000e5fc <.LVL7>:
    e5fc:	00261613          	sll	a2,a2,0x2

0000e600 <.LVL8>:
    e600:	02060793          	add	a5,a2,32
    e604:	00278633          	add	a2,a5,sp
    e608:	ff062783          	lw	a5,-16(a2)
    e60c:	00f12823          	sw	a5,16(sp)

0000e610 <.L8>:
    e610:	01012503          	lw	a0,16(sp)

0000e614 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    e614:	02010113          	add	sp,sp,32

0000e618 <.LVL11>:
    e618:	00008067          	ret

0000e61c <.L7>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e61c:	00200513          	li	a0,2
    e620:	02a61063          	bne	a2,a0,e640 <.L9>
    e624:	02000693          	li	a3,32
    e628:	40e686b3          	sub	a3,a3,a4
    e62c:	00d796b3          	sll	a3,a5,a3
    e630:	00e5d5b3          	srl	a1,a1,a4
    e634:	00b6e6b3          	or	a3,a3,a1
    e638:	00d12823          	sw	a3,16(sp)

0000e63c <.LVL13>:
    e63c:	00100693          	li	a3,1

0000e640 <.L9>:
    e640:	00269693          	sll	a3,a3,0x2

0000e644 <.LVL15>:
    e644:	02068693          	add	a3,a3,32
    e648:	002686b3          	add	a3,a3,sp
    e64c:	00e7d7b3          	srl	a5,a5,a4
    e650:	fef6a823          	sw	a5,-16(a3)
    e654:	fbdff06f          	j	e610 <.L8>

0000e658 <__floatunsitf>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__floatunsitf (USItype i)
{
    e658:	fd010113          	add	sp,sp,-48
    e65c:	02912223          	sw	s1,36(sp)
    e660:	02112623          	sw	ra,44(sp)
    e664:	02812423          	sw	s0,40(sp)
    e668:	00050493          	mv	s1,a0

0000e66c <.LBB12>:
  FP_DECL_Q (A);
  TFtype a;

  FP_FROM_INT_Q (A, i, SI_BITS, USItype);
    e66c:	10058463          	beqz	a1,e774 <.L2>

0000e670 <.LBB3>:
    e670:	00058513          	mv	a0,a1
    e674:	00058413          	mv	s0,a1

0000e678 <.LBB5>:
    e678:	f9df20ef          	jal	1614 <__clzsi2>

0000e67c <.LVL3>:
    e67c:	00004737          	lui	a4,0x4
    e680:	01e70713          	add	a4,a4,30 # 401e <_dl_aux_init+0x22>

0000e684 <.LBB6>:
    e684:	05150793          	add	a5,a0,81

0000e688 <.LBB7>:
    e688:	40a70633          	sub	a2,a4,a0

0000e68c <.LBE7>:
    e68c:	00812823          	sw	s0,16(sp)

0000e690 <.LBB8>:
    e690:	4057d713          	sra	a4,a5,0x5

0000e694 <.LBE8>:
    e694:	00012a23          	sw	zero,20(sp)
    e698:	00012c23          	sw	zero,24(sp)
    e69c:	00012e23          	sw	zero,28(sp)

0000e6a0 <.LBB9>:
    e6a0:	01f7f793          	and	a5,a5,31

0000e6a4 <.LVL6>:
    e6a4:	02078c63          	beqz	a5,e6dc <.L3>

0000e6a8 <.LVL7>:
    e6a8:	00200693          	li	a3,2
    e6ac:	0cd71063          	bne	a4,a3,e76c <.L8>
    e6b0:	02000693          	li	a3,32
    e6b4:	40f686b3          	sub	a3,a3,a5

0000e6b8 <.LVL8>:
    e6b8:	00d456b3          	srl	a3,s0,a3

0000e6bc <.LVL9>:
    e6bc:	00d12e23          	sw	a3,28(sp)

0000e6c0 <.L4>:
    e6c0:	fff70693          	add	a3,a4,-1

0000e6c4 <.LVL11>:
    e6c4:	00271713          	sll	a4,a4,0x2
    e6c8:	02070713          	add	a4,a4,32
    e6cc:	00270733          	add	a4,a4,sp
    e6d0:	00f41433          	sll	s0,s0,a5

0000e6d4 <.LVL12>:
    e6d4:	fe872823          	sw	s0,-16(a4)
    e6d8:	0340006f          	j	e70c <.L5>

0000e6dc <.L3>:
    e6dc:	00300793          	li	a5,3

0000e6e0 <.LVL14>:
    e6e0:	40e787b3          	sub	a5,a5,a4
    e6e4:	00279793          	sll	a5,a5,0x2
    e6e8:	02078793          	add	a5,a5,32
    e6ec:	002787b3          	add	a5,a5,sp
    e6f0:	ff07a783          	lw	a5,-16(a5)
    e6f4:	00200693          	li	a3,2
    e6f8:	00f12e23          	sw	a5,28(sp)

0000e6fc <.LVL15>:
    e6fc:	00200793          	li	a5,2
    e700:	00f71663          	bne	a4,a5,e70c <.L5>
    e704:	00812c23          	sw	s0,24(sp)

0000e708 <.LVL16>:
    e708:	00100693          	li	a3,1

0000e70c <.L5>:
    e70c:	00269693          	sll	a3,a3,0x2
    e710:	00012823          	sw	zero,16(sp)

0000e714 <.LVL18>:
    e714:	00012a23          	sw	zero,20(sp)
    e718:	ffc68693          	add	a3,a3,-4
    e71c:	00400793          	li	a5,4
    e720:	00f6e463          	bltu	a3,a5,e728 <.L7>
    e724:	00012c23          	sw	zero,24(sp)

0000e728 <.L7>:
  FP_PACK_RAW_Q (a, A);
    e728:	01c12783          	lw	a5,28(sp)
    e72c:	00c11723          	sh	a2,14(sp)

0000e730 <.LBE13>:

  return a;
}
    e730:	02c12083          	lw	ra,44(sp)

0000e734 <.LBB14>:
  FP_PACK_RAW_Q (a, A);
    e734:	00f11623          	sh	a5,12(sp)

0000e738 <.LBE14>:
  return a;
    e738:	01012783          	lw	a5,16(sp)
}
    e73c:	02812403          	lw	s0,40(sp)
    e740:	00048513          	mv	a0,s1
  return a;
    e744:	00f4a023          	sw	a5,0(s1)
    e748:	01412783          	lw	a5,20(sp)
    e74c:	00f4a223          	sw	a5,4(s1)
    e750:	01812783          	lw	a5,24(sp)
    e754:	00f4a423          	sw	a5,8(s1)
    e758:	00c12783          	lw	a5,12(sp)
    e75c:	00f4a623          	sw	a5,12(s1)
}
    e760:	02412483          	lw	s1,36(sp)
    e764:	03010113          	add	sp,sp,48

0000e768 <.LVL22>:
    e768:	00008067          	ret

0000e76c <.L8>:
  FP_FROM_INT_Q (A, i, SI_BITS, USItype);
    e76c:	00300713          	li	a4,3

0000e770 <.LVL24>:
    e770:	f51ff06f          	j	e6c0 <.L4>

0000e774 <.L2>:
    e774:	00012e23          	sw	zero,28(sp)
    e778:	00012c23          	sw	zero,24(sp)
    e77c:	00012a23          	sw	zero,20(sp)
    e780:	00012823          	sw	zero,16(sp)
    e784:	00000613          	li	a2,0
    e788:	fa1ff06f          	j	e728 <.L7>

0000e78c <__extendsfdf2>:
  FP_DECL_S (A);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_S (A, a);
    e78c:	01755713          	srl	a4,a0,0x17
    e790:	0ff77713          	zext.b	a4,a4

0000e794 <.LBE2>:
{
    e794:	ff010113          	add	sp,sp,-16
#if _FP_W_TYPE_SIZE < _FP_FRACBITS_D
  FP_EXTEND (D, S, 2, 1, R, A);
    e798:	00170793          	add	a5,a4,1
{
    e79c:	00812423          	sw	s0,8(sp)
    e7a0:	00912223          	sw	s1,4(sp)

0000e7a4 <.LBB3>:
  FP_UNPACK_RAW_S (A, a);
    e7a4:	00951413          	sll	s0,a0,0x9

0000e7a8 <.LBE3>:
{
    e7a8:	00112623          	sw	ra,12(sp)
  FP_EXTEND (D, S, 2, 1, R, A);
    e7ac:	0fe7f793          	and	a5,a5,254

0000e7b0 <.LBB4>:
  FP_UNPACK_RAW_S (A, a);
    e7b0:	00945413          	srl	s0,s0,0x9

0000e7b4 <.LVL1>:
    e7b4:	01f55493          	srl	s1,a0,0x1f

0000e7b8 <.LBE4>:
  FP_EXTEND (D, S, 2, 1, R, A);
    e7b8:	04078263          	beqz	a5,e7fc <.L2>
    e7bc:	00345793          	srl	a5,s0,0x3
    e7c0:	38070713          	add	a4,a4,896

0000e7c4 <.LVL3>:
    e7c4:	01d41413          	sll	s0,s0,0x1d

0000e7c8 <.L3>:
#else
  FP_EXTEND (D, S, 1, 1, R, A);
#endif
  FP_PACK_RAW_D (r, R);
    e7c8:	00c79793          	sll	a5,a5,0xc

0000e7cc <.LVL5>:
    e7cc:	00c7d793          	srl	a5,a5,0xc
    e7d0:	01471713          	sll	a4,a4,0x14

0000e7d4 <.LVL6>:
    e7d4:	01f49513          	sll	a0,s1,0x1f
    e7d8:	00f76733          	or	a4,a4,a5

0000e7dc <.LBE7>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    e7dc:	00c12083          	lw	ra,12(sp)

0000e7e0 <.LBB8>:
  FP_PACK_RAW_D (r, R);
    e7e0:	00a767b3          	or	a5,a4,a0

0000e7e4 <.LBE8>:
}
    e7e4:	00040513          	mv	a0,s0
    e7e8:	00812403          	lw	s0,8(sp)

0000e7ec <.LVL8>:
    e7ec:	00412483          	lw	s1,4(sp)

0000e7f0 <.LVL9>:
    e7f0:	00078593          	mv	a1,a5
    e7f4:	01010113          	add	sp,sp,16
    e7f8:	00008067          	ret

0000e7fc <.L2>:
  FP_EXTEND (D, S, 2, 1, R, A);
    e7fc:	04071663          	bnez	a4,e848 <.L4>
    e800:	00000793          	li	a5,0
    e804:	fc0402e3          	beqz	s0,e7c8 <.L3>

0000e808 <.LBB9>:
    e808:	00040513          	mv	a0,s0

0000e80c <.LVL11>:
    e80c:	e09f20ef          	jal	1614 <__clzsi2>

0000e810 <.LVL12>:
    e810:	00a00793          	li	a5,10
    e814:	02a7c263          	blt	a5,a0,e838 <.L5>
    e818:	00b00793          	li	a5,11
    e81c:	40a787b3          	sub	a5,a5,a0
    e820:	01550713          	add	a4,a0,21
    e824:	00f457b3          	srl	a5,s0,a5

0000e828 <.LVL13>:
    e828:	00e41433          	sll	s0,s0,a4

0000e82c <.L6>:
    e82c:	38900713          	li	a4,905
    e830:	40a70733          	sub	a4,a4,a0

0000e834 <.LVL15>:
    e834:	f95ff06f          	j	e7c8 <.L3>

0000e838 <.L5>:
    e838:	ff550793          	add	a5,a0,-11
    e83c:	00f417b3          	sll	a5,s0,a5

0000e840 <.LVL17>:
    e840:	00000413          	li	s0,0

0000e844 <.LVL18>:
    e844:	fe9ff06f          	j	e82c <.L6>

0000e848 <.L4>:
    e848:	00000793          	li	a5,0
    e84c:	00040a63          	beqz	s0,e860 <.L11>

0000e850 <.LVL20>:
    e850:	00345793          	srl	a5,s0,0x3

0000e854 <.LVL21>:
    e854:	00080737          	lui	a4,0x80

0000e858 <.LVL22>:
    e858:	01d41413          	sll	s0,s0,0x1d

0000e85c <.LVL23>:
    e85c:	00e7e7b3          	or	a5,a5,a4

0000e860 <.L11>:
    e860:	7ff00713          	li	a4,2047
    e864:	f65ff06f          	j	e7c8 <.L3>

0000e868 <__extenddftf2>:
  FP_DECL_D (A);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    e868:	01465713          	srl	a4,a2,0x14
    e86c:	00c61793          	sll	a5,a2,0xc
    e870:	7ff77713          	and	a4,a4,2047

0000e874 <.LBE2>:
{
    e874:	fd010113          	add	sp,sp,-48

0000e878 <.LBB3>:
  FP_UNPACK_RAW_D (A, a);
    e878:	00c7d793          	srl	a5,a5,0xc

0000e87c <.LBE3>:
#if _FP_W_TYPE_SIZE < 64
  FP_EXTEND (Q, D, 4, 2, R, A);
    e87c:	00170693          	add	a3,a4,1 # 80001 <_ebss+0x6a111>
{
    e880:	02812423          	sw	s0,40(sp)
    e884:	02912223          	sw	s1,36(sp)
    e888:	03212023          	sw	s2,32(sp)
    e88c:	02112623          	sw	ra,44(sp)
  FP_EXTEND (Q, D, 4, 2, R, A);
    e890:	00b12823          	sw	a1,16(sp)
    e894:	00f12a23          	sw	a5,20(sp)
    e898:	00012e23          	sw	zero,28(sp)
    e89c:	00012c23          	sw	zero,24(sp)
    e8a0:	7fe6f693          	and	a3,a3,2046
{
    e8a4:	00050913          	mv	s2,a0
    e8a8:	00058413          	mv	s0,a1

0000e8ac <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    e8ac:	01f65493          	srl	s1,a2,0x1f

0000e8b0 <.LBE4>:
  FP_EXTEND (Q, D, 4, 2, R, A);
    e8b0:	08068263          	beqz	a3,e934 <.L2>
    e8b4:	000046b7          	lui	a3,0x4
    e8b8:	c0068693          	add	a3,a3,-1024 # 3c00 <.L72+0x10>
    e8bc:	00d70733          	add	a4,a4,a3

0000e8c0 <.LBB5>:
    e8c0:	0047d693          	srl	a3,a5,0x4
    e8c4:	00d12e23          	sw	a3,28(sp)

0000e8c8 <.LVL4>:
    e8c8:	01c79793          	sll	a5,a5,0x1c

0000e8cc <.LVL5>:
    e8cc:	0045d693          	srl	a3,a1,0x4
    e8d0:	00d7e7b3          	or	a5,a5,a3
    e8d4:	01c59413          	sll	s0,a1,0x1c
    e8d8:	00f12c23          	sw	a5,24(sp)

0000e8dc <.LVL6>:
    e8dc:	00812a23          	sw	s0,20(sp)

0000e8e0 <.LVL7>:
    e8e0:	00012823          	sw	zero,16(sp)

0000e8e4 <.L3>:
#else
  FP_EXTEND (Q, D, 2, 1, R, A);
#endif
  FP_PACK_RAW_Q (r, R);
    e8e4:	01c12783          	lw	a5,28(sp)
    e8e8:	00f49493          	sll	s1,s1,0xf

0000e8ec <.LVL9>:
    e8ec:	00e4e4b3          	or	s1,s1,a4
    e8f0:	00f11623          	sh	a5,12(sp)

0000e8f4 <.LBE6>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    e8f4:	01012783          	lw	a5,16(sp)

0000e8f8 <.LBB7>:
  FP_PACK_RAW_Q (r, R);
    e8f8:	00911723          	sh	s1,14(sp)

0000e8fc <.LBE7>:
}
    e8fc:	02c12083          	lw	ra,44(sp)
  return r;
    e900:	00f92023          	sw	a5,0(s2)
    e904:	01412783          	lw	a5,20(sp)

0000e908 <.LVL11>:
}
    e908:	02812403          	lw	s0,40(sp)
    e90c:	02412483          	lw	s1,36(sp)
  return r;
    e910:	00f92223          	sw	a5,4(s2)
    e914:	01812783          	lw	a5,24(sp)
}
    e918:	00090513          	mv	a0,s2
  return r;
    e91c:	00f92423          	sw	a5,8(s2)
    e920:	00c12783          	lw	a5,12(sp)
    e924:	00f92623          	sw	a5,12(s2)
}
    e928:	02012903          	lw	s2,32(sp)
    e92c:	03010113          	add	sp,sp,48

0000e930 <.LVL13>:
    e930:	00008067          	ret

0000e934 <.L2>:
  FP_EXTEND (Q, D, 4, 2, R, A);
    e934:	00b7e533          	or	a0,a5,a1
    e938:	10071063          	bnez	a4,ea38 <.L4>
    e93c:	fa0504e3          	beqz	a0,e8e4 <.L3>

0000e940 <.LBB8>:
    e940:	04078e63          	beqz	a5,e99c <.L5>
    e944:	00078513          	mv	a0,a5
    e948:	ccdf20ef          	jal	1614 <__clzsi2>

0000e94c <.L6>:
    e94c:	03150693          	add	a3,a0,49
    e950:	4056d793          	sra	a5,a3,0x5

0000e954 <.LVL17>:
    e954:	01f6f693          	and	a3,a3,31

0000e958 <.LVL18>:
    e958:	04068863          	beqz	a3,e9a8 <.L7>
    e95c:	ffc00613          	li	a2,-4
    e960:	02c78633          	mul	a2,a5,a2
    e964:	02000813          	li	a6,32
    e968:	01010313          	add	t1,sp,16
    e96c:	40d80833          	sub	a6,a6,a3

0000e970 <.LVL19>:
    e970:	00c60713          	add	a4,a2,12
    e974:	00e30733          	add	a4,t1,a4
    e978:	40c00633          	neg	a2,a2

0000e97c <.L8>:
    e97c:	08e31c63          	bne	t1,a4,ea14 <.L11>
    e980:	fff78713          	add	a4,a5,-1

0000e984 <.LVL20>:
    e984:	00279793          	sll	a5,a5,0x2

0000e988 <.LVL21>:
    e988:	02078793          	add	a5,a5,32
    e98c:	002787b3          	add	a5,a5,sp
    e990:	00d416b3          	sll	a3,s0,a3

0000e994 <.LVL22>:
    e994:	fed7a823          	sw	a3,-16(a5)
    e998:	03c0006f          	j	e9d4 <.L10>

0000e99c <.L5>:
    e99c:	c79f20ef          	jal	1614 <__clzsi2>

0000e9a0 <.LVL24>:
    e9a0:	02050513          	add	a0,a0,32
    e9a4:	fa9ff06f          	j	e94c <.L6>

0000e9a8 <.L7>:
    e9a8:	ffc00613          	li	a2,-4
    e9ac:	02c78633          	mul	a2,a5,a2
    e9b0:	01c10713          	add	a4,sp,28

0000e9b4 <.LBB10>:
    e9b4:	00300693          	li	a3,3

0000e9b8 <.L9>:
    e9b8:	00c705b3          	add	a1,a4,a2
    e9bc:	0005a583          	lw	a1,0(a1)
    e9c0:	fff68693          	add	a3,a3,-1

0000e9c4 <.LVL28>:
    e9c4:	ffc70713          	add	a4,a4,-4
    e9c8:	00b72223          	sw	a1,4(a4)

0000e9cc <.LVL29>:
    e9cc:	fef6d6e3          	bge	a3,a5,e9b8 <.L9>
    e9d0:	fff78713          	add	a4,a5,-1

0000e9d4 <.L10>:
    e9d4:	00170793          	add	a5,a4,1
    e9d8:	00279793          	sll	a5,a5,0x2
    e9dc:	00800693          	li	a3,8
    e9e0:	01010713          	add	a4,sp,16
    e9e4:	00d7ea63          	bltu	a5,a3,e9f8 <.L12>
    e9e8:	00012823          	sw	zero,16(sp)
    e9ec:	00072223          	sw	zero,4(a4)
    e9f0:	ff878793          	add	a5,a5,-8
    e9f4:	01810713          	add	a4,sp,24

0000e9f8 <.L12>:
    e9f8:	00400693          	li	a3,4
    e9fc:	00d7e463          	bltu	a5,a3,ea04 <.L13>
    ea00:	00072023          	sw	zero,0(a4)

0000ea04 <.L13>:
    ea04:	00004737          	lui	a4,0x4
    ea08:	c0c70713          	add	a4,a4,-1012 # 3c0c <.L75>
    ea0c:	40a70733          	sub	a4,a4,a0

0000ea10 <.LVL31>:
    ea10:	ed5ff06f          	j	e8e4 <.L3>

0000ea14 <.L11>:
    ea14:	00072583          	lw	a1,0(a4)
    ea18:	ffc72883          	lw	a7,-4(a4)
    ea1c:	00c70e33          	add	t3,a4,a2
    ea20:	00d595b3          	sll	a1,a1,a3
    ea24:	0108d8b3          	srl	a7,a7,a6
    ea28:	0115e5b3          	or	a1,a1,a7
    ea2c:	00be2023          	sw	a1,0(t3)
    ea30:	ffc70713          	add	a4,a4,-4
    ea34:	f49ff06f          	j	e97c <.L8>

0000ea38 <.L4>:
    ea38:	02050863          	beqz	a0,ea68 <.L14>

0000ea3c <.LBB12>:
    ea3c:	01c79713          	sll	a4,a5,0x1c

0000ea40 <.LVL35>:
    ea40:	0045d693          	srl	a3,a1,0x4
    ea44:	00d76733          	or	a4,a4,a3
    ea48:	00e12c23          	sw	a4,24(sp)

0000ea4c <.LVL36>:
    ea4c:	0047d793          	srl	a5,a5,0x4

0000ea50 <.LBE12>:
    ea50:	00008737          	lui	a4,0x8

0000ea54 <.LBB13>:
    ea54:	01c59413          	sll	s0,a1,0x1c

0000ea58 <.LBE13>:
    ea58:	00e7e7b3          	or	a5,a5,a4

0000ea5c <.LBB14>:
    ea5c:	00812a23          	sw	s0,20(sp)

0000ea60 <.LVL39>:
    ea60:	00012823          	sw	zero,16(sp)

0000ea64 <.LBE14>:
    ea64:	00f12e23          	sw	a5,28(sp)

0000ea68 <.L14>:
    ea68:	00008737          	lui	a4,0x8
    ea6c:	fff70713          	add	a4,a4,-1 # 7fff <__kernel_rem_pio2+0x5f>
    ea70:	e75ff06f          	j	e8e4 <.L3>

0000ea74 <__truncdfsf2>:
  FP_DECL_D (A);
  FP_DECL_S (R);
  SFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
    ea74:	0145d613          	srl	a2,a1,0x14
    ea78:	7ff67613          	and	a2,a2,2047
    ea7c:	00c59793          	sll	a5,a1,0xc

0000ea80 <.LBE2>:
#if _FP_W_TYPE_SIZE < _FP_FRACBITS_D
  FP_TRUNC (S, D, 1, 2, R, A);
    ea80:	00160713          	add	a4,a2,1
  FP_UNPACK_SEMIRAW_D (A, a);
    ea84:	0097d793          	srl	a5,a5,0x9

0000ea88 <.LVL2>:
    ea88:	01d55693          	srl	a3,a0,0x1d
  FP_TRUNC (S, D, 1, 2, R, A);
    ea8c:	7fe77713          	and	a4,a4,2046
  FP_UNPACK_SEMIRAW_D (A, a);
    ea90:	00f6e6b3          	or	a3,a3,a5

0000ea94 <.LBB5>:
    ea94:	01f5d593          	srl	a1,a1,0x1f

0000ea98 <.LBE5>:
    ea98:	00351793          	sll	a5,a0,0x3

0000ea9c <.LVL4>:
  FP_TRUNC (S, D, 1, 2, R, A);
    ea9c:	0a070663          	beqz	a4,eb48 <.L2>
    eaa0:	c8060713          	add	a4,a2,-896

0000eaa4 <.LVL5>:
    eaa4:	0fe00813          	li	a6,254
    eaa8:	0ce84263          	blt	a6,a4,eb6c <.L11>
    eaac:	08e04063          	bgtz	a4,eb2c <.L4>
    eab0:	fe900513          	li	a0,-23

0000eab4 <.LVL6>:
    eab4:	10a74a63          	blt	a4,a0,ebc8 <.L12>
    eab8:	00800537          	lui	a0,0x800
    eabc:	00a6e6b3          	or	a3,a3,a0
    eac0:	01e00513          	li	a0,30
    eac4:	40e50533          	sub	a0,a0,a4
    eac8:	01f00813          	li	a6,31
    eacc:	02a84863          	blt	a6,a0,eafc <.L5>
    ead0:	c8260613          	add	a2,a2,-894

0000ead4 <.LVL8>:
    ead4:	00a7d533          	srl	a0,a5,a0
    ead8:	00c797b3          	sll	a5,a5,a2

0000eadc <.LVL9>:
    eadc:	00f037b3          	snez	a5,a5
    eae0:	00c696b3          	sll	a3,a3,a2

0000eae4 <.LVL10>:
    eae4:	00d7e7b3          	or	a5,a5,a3
    eae8:	00f567b3          	or	a5,a0,a5

0000eaec <.L26>:
    eaec:	00000713          	li	a4,0

0000eaf0 <.L3>:
#else
  FP_TRUNC (S, D, 1, 1, R, A);
#endif
  FP_PACK_SEMIRAW_S (r, R);
    eaf0:	0077f693          	and	a3,a5,7
    eaf4:	08068063          	beqz	a3,eb74 <.L8>
    eaf8:	0d80006f          	j	ebd0 <.L24>

0000eafc <.L5>:
  FP_TRUNC (S, D, 1, 2, R, A);
    eafc:	ffe00813          	li	a6,-2
    eb00:	40e80833          	sub	a6,a6,a4
    eb04:	02000893          	li	a7,32
    eb08:	0106d833          	srl	a6,a3,a6
    eb0c:	00000713          	li	a4,0

0000eb10 <.LVL14>:
    eb10:	01150663          	beq	a0,a7,eb1c <.L6>
    eb14:	ca260613          	add	a2,a2,-862

0000eb18 <.LVL15>:
    eb18:	00c69733          	sll	a4,a3,a2

0000eb1c <.L6>:
    eb1c:	00f76733          	or	a4,a4,a5
    eb20:	00e03733          	snez	a4,a4
    eb24:	00e867b3          	or	a5,a6,a4

0000eb28 <.LVL17>:
    eb28:	fc5ff06f          	j	eaec <.L26>

0000eb2c <.L4>:
    eb2c:	00651513          	sll	a0,a0,0x6

0000eb30 <.LVL19>:
    eb30:	00a03533          	snez	a0,a0
    eb34:	00369693          	sll	a3,a3,0x3

0000eb38 <.LVL20>:
    eb38:	01d7d793          	srl	a5,a5,0x1d

0000eb3c <.LVL21>:
    eb3c:	00d566b3          	or	a3,a0,a3

0000eb40 <.L27>:
    eb40:	00f6e7b3          	or	a5,a3,a5

0000eb44 <.LVL23>:
    eb44:	fadff06f          	j	eaf0 <.L3>

0000eb48 <.L2>:
    eb48:	00f6e7b3          	or	a5,a3,a5

0000eb4c <.LVL25>:
    eb4c:	00061663          	bnez	a2,eb58 <.L7>

0000eb50 <.LVL26>:
    eb50:	00f037b3          	snez	a5,a5
    eb54:	f99ff06f          	j	eaec <.L26>

0000eb58 <.L7>:
    eb58:	0ff00713          	li	a4,255
    eb5c:	00078c63          	beqz	a5,eb74 <.L8>

0000eb60 <.LVL28>:
    eb60:	00369693          	sll	a3,a3,0x3

0000eb64 <.LVL29>:
    eb64:	020007b7          	lui	a5,0x2000
    eb68:	fd9ff06f          	j	eb40 <.L27>

0000eb6c <.L11>:
    eb6c:	00000793          	li	a5,0

0000eb70 <.LVL31>:
    eb70:	0ff00713          	li	a4,255

0000eb74 <.L8>:
  FP_PACK_SEMIRAW_S (r, R);
    eb74:	00579693          	sll	a3,a5,0x5
    eb78:	0006de63          	bgez	a3,eb94 <.L9>

0000eb7c <.LVL33>:
    eb7c:	00170713          	add	a4,a4,1

0000eb80 <.LVL34>:
    eb80:	0ff00693          	li	a3,255
    eb84:	06d70063          	beq	a4,a3,ebe4 <.L15>
    eb88:	fc0006b7          	lui	a3,0xfc000
    eb8c:	fff68693          	add	a3,a3,-1 # fbffffff <_ebss+0xfbfea10f>
    eb90:	00d7f7b3          	and	a5,a5,a3

0000eb94 <.L9>:
    eb94:	0ff00693          	li	a3,255
    eb98:	0037d793          	srl	a5,a5,0x3
    eb9c:	00d71863          	bne	a4,a3,ebac <.L10>
    eba0:	00078663          	beqz	a5,ebac <.L10>
    eba4:	004007b7          	lui	a5,0x400

0000eba8 <.LVL37>:
    eba8:	00000593          	li	a1,0

0000ebac <.L10>:
    ebac:	7f8006b7          	lui	a3,0x7f800
    ebb0:	01771713          	sll	a4,a4,0x17

0000ebb4 <.LVL39>:
    ebb4:	00d77733          	and	a4,a4,a3
    ebb8:	00f76733          	or	a4,a4,a5
    ebbc:	01f59513          	sll	a0,a1,0x1f

0000ebc0 <.LBE13>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    ebc0:	00a76533          	or	a0,a4,a0

0000ebc4 <.LVL41>:
    ebc4:	00008067          	ret

0000ebc8 <.L12>:
  FP_TRUNC (S, D, 1, 2, R, A);
    ebc8:	00100793          	li	a5,1

0000ebcc <.LVL43>:
    ebcc:	00000713          	li	a4,0

0000ebd0 <.L24>:
  FP_PACK_SEMIRAW_S (r, R);
    ebd0:	00f7f693          	and	a3,a5,15
    ebd4:	00400613          	li	a2,4
    ebd8:	f8c68ee3          	beq	a3,a2,eb74 <.L8>
    ebdc:	00478793          	add	a5,a5,4 # 400004 <_ebss+0x3ea114>
    ebe0:	f95ff06f          	j	eb74 <.L8>

0000ebe4 <.L15>:
    ebe4:	00000793          	li	a5,0

0000ebe8 <.LVL47>:
    ebe8:	fadff06f          	j	eb94 <.L9>

0000ebec <__trunctfdf2>:
#include "double.h"
#include "quad.h"

DFtype
__trunctfdf2 (TFtype a)
{
    ebec:	00c52583          	lw	a1,12(a0) # 80000c <_ebss+0x7ea11c>
    ebf0:	00852703          	lw	a4,8(a0)
    ebf4:	00452683          	lw	a3,4(a0)
    ebf8:	fe010113          	add	sp,sp,-32
    ebfc:	00052783          	lw	a5,0(a0)

0000ec00 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_Q (A, a);
    ec00:	00e12423          	sw	a4,8(sp)
    ec04:	00e12c23          	sw	a4,24(sp)
    ec08:	01059713          	sll	a4,a1,0x10
    ec0c:	01075713          	srl	a4,a4,0x10
    ec10:	00d12223          	sw	a3,4(sp)
    ec14:	00d12a23          	sw	a3,20(sp)
    ec18:	01010613          	add	a2,sp,16
    ec1c:	00159693          	sll	a3,a1,0x1
    ec20:	00b12623          	sw	a1,12(sp)
    ec24:	00e12e23          	sw	a4,28(sp)
    ec28:	00f12023          	sw	a5,0(sp)
    ec2c:	00f12823          	sw	a5,16(sp)
    ec30:	0116d693          	srl	a3,a3,0x11

0000ec34 <.LVL1>:
    ec34:	01f5d593          	srl	a1,a1,0x1f

0000ec38 <.LBB4>:
    ec38:	01c10713          	add	a4,sp,28
    ec3c:	00060893          	mv	a7,a2

0000ec40 <.L2>:
    ec40:	00072503          	lw	a0,0(a4)
    ec44:	ffc72803          	lw	a6,-4(a4)
    ec48:	ffc70713          	add	a4,a4,-4
    ec4c:	00351513          	sll	a0,a0,0x3
    ec50:	01d85813          	srl	a6,a6,0x1d
    ec54:	01056533          	or	a0,a0,a6
    ec58:	00a72223          	sw	a0,4(a4)
    ec5c:	fee612e3          	bne	a2,a4,ec40 <.L2>

0000ec60 <.LVL4>:
    ec60:	00379513          	sll	a0,a5,0x3

0000ec64 <.LBE4>:
#if _FP_W_TYPE_SIZE < 64
  FP_TRUNC (D, Q, 2, 4, R, A);
    ec64:	00168793          	add	a5,a3,1 # 7f800001 <_ebss+0x7f7ea111>
    ec68:	01179713          	sll	a4,a5,0x11

0000ec6c <.LBB5>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    ec6c:	00a12823          	sw	a0,16(sp)

0000ec70 <.LBE5>:
  FP_TRUNC (D, Q, 2, 4, R, A);
    ec70:	01275713          	srl	a4,a4,0x12
    ec74:	1c070263          	beqz	a4,ee38 <.L3>
    ec78:	ffffc7b7          	lui	a5,0xffffc
    ec7c:	40078793          	add	a5,a5,1024 # ffffc400 <_ebss+0xfffe6510>
    ec80:	00f686b3          	add	a3,a3,a5

0000ec84 <.LVL6>:
    ec84:	7fe00793          	li	a5,2046
    ec88:	20d7c463          	blt	a5,a3,ee90 <.L23>
    ec8c:	06d05463          	blez	a3,ecf4 <.L5>

0000ec90 <.LBB6>:
    ec90:	01812603          	lw	a2,24(sp)
    ec94:	01c12783          	lw	a5,28(sp)
    ec98:	01412703          	lw	a4,20(sp)

0000ec9c <.LVL8>:
    ec9c:	01c65813          	srl	a6,a2,0x1c
    eca0:	00479793          	sll	a5,a5,0x4
    eca4:	0107e7b3          	or	a5,a5,a6
    eca8:	00f12a23          	sw	a5,20(sp)

0000ecac <.LBB8>:
    ecac:	00471793          	sll	a5,a4,0x4
    ecb0:	00a7e7b3          	or	a5,a5,a0

0000ecb4 <.LVL10>:
    ecb4:	01c75713          	srl	a4,a4,0x1c

0000ecb8 <.LVL11>:
    ecb8:	00461613          	sll	a2,a2,0x4
    ecbc:	00f037b3          	snez	a5,a5

0000ecc0 <.LVL12>:
    ecc0:	00c76733          	or	a4,a4,a2

0000ecc4 <.LBE8>:
    ecc4:	00e7e7b3          	or	a5,a5,a4

0000ecc8 <.L6>:
    ecc8:	01412703          	lw	a4,20(sp)

0000eccc <.L4>:
#else
  FP_TRUNC (D, Q, 1, 2, R, A);
#endif
  FP_PACK_SEMIRAW_D (r, R);
    eccc:	0077f613          	and	a2,a5,7
    ecd0:	1c060663          	beqz	a2,ee9c <.L18>
    ecd4:	00f7f613          	and	a2,a5,15
    ecd8:	00400513          	li	a0,4
    ecdc:	1ca60063          	beq	a2,a0,ee9c <.L18>

0000ece0 <.LBB11>:
    ece0:	00478613          	add	a2,a5,4
    ece4:	00f63533          	sltu	a0,a2,a5
    ece8:	00a70733          	add	a4,a4,a0

0000ecec <.LVL15>:
    ecec:	00060793          	mv	a5,a2

0000ecf0 <.LVL16>:
    ecf0:	1ac0006f          	j	ee9c <.L18>

0000ecf4 <.L5>:
  FP_TRUNC (D, Q, 2, 4, R, A);
    ecf4:	fcc00793          	li	a5,-52
    ecf8:	00f6da63          	bge	a3,a5,ed0c <.L7>
    ecfc:	00012a23          	sw	zero,20(sp)
    ed00:	00100793          	li	a5,1

0000ed04 <.L39>:
    ed04:	00000693          	li	a3,0
    ed08:	fc1ff06f          	j	ecc8 <.L6>

0000ed0c <.L7>:
    ed0c:	01c12783          	lw	a5,28(sp)
    ed10:	00080737          	lui	a4,0x80

0000ed14 <.LBB15>:
    ed14:	00060813          	mv	a6,a2

0000ed18 <.LBE15>:
    ed18:	00f76eb3          	or	t4,a4,a5

0000ed1c <.LBB17>:
    ed1c:	03d00793          	li	a5,61
    ed20:	40d787b3          	sub	a5,a5,a3
    ed24:	4057d693          	sra	a3,a5,0x5

0000ed28 <.LVL20>:
    ed28:	01f7f713          	and	a4,a5,31

0000ed2c <.LBE17>:
    ed2c:	01d12e23          	sw	t4,28(sp)

0000ed30 <.LBB18>:
    ed30:	00000513          	li	a0,0
    ed34:	00000793          	li	a5,0

0000ed38 <.L8>:
    ed38:	00082303          	lw	t1,0(a6)
    ed3c:	00150513          	add	a0,a0,1

0000ed40 <.LVL23>:
    ed40:	00480813          	add	a6,a6,4
    ed44:	0067e7b3          	or	a5,a5,t1

0000ed48 <.LVL24>:
    ed48:	fea698e3          	bne	a3,a0,ed38 <.L8>
    ed4c:	00300513          	li	a0,3

0000ed50 <.LVL25>:
    ed50:	40d50533          	sub	a0,a0,a3
    ed54:	00269813          	sll	a6,a3,0x2
    ed58:	02071463          	bnez	a4,ed80 <.L9>

0000ed5c <.L10>:
    ed5c:	01088333          	add	t1,a7,a6
    ed60:	00032303          	lw	t1,0(t1)
    ed64:	00170713          	add	a4,a4,1 # 80001 <_ebss+0x6a111>

0000ed68 <.LVL27>:
    ed68:	00488893          	add	a7,a7,4
    ed6c:	fe68ae23          	sw	t1,-4(a7)

0000ed70 <.LVL28>:
    ed70:	fee556e3          	bge	a0,a4,ed5c <.L10>
    ed74:	00400713          	li	a4,4

0000ed78 <.LVL29>:
    ed78:	40d706b3          	sub	a3,a4,a3

0000ed7c <.LVL30>:
    ed7c:	04c0006f          	j	edc8 <.L14>

0000ed80 <.L9>:
    ed80:	02080893          	add	a7,a6,32
    ed84:	002888b3          	add	a7,a7,sp
    ed88:	ff08a883          	lw	a7,-16(a7)
    ed8c:	02000e13          	li	t3,32
    ed90:	40ee0e33          	sub	t3,t3,a4
    ed94:	01c898b3          	sll	a7,a7,t3
    ed98:	0117e7b3          	or	a5,a5,a7

0000ed9c <.LVL32>:
    ed9c:	00000f13          	li	t5,0
    eda0:	010608b3          	add	a7,a2,a6
    eda4:	41000833          	neg	a6,a6

0000eda8 <.L12>:
    eda8:	06af4463          	blt	t5,a0,ee10 <.L13>
    edac:	00251513          	sll	a0,a0,0x2
    edb0:	02050513          	add	a0,a0,32
    edb4:	00400813          	li	a6,4
    edb8:	00250533          	add	a0,a0,sp
    edbc:	00eed733          	srl	a4,t4,a4

0000edc0 <.LVL34>:
    edc0:	40d806b3          	sub	a3,a6,a3

0000edc4 <.LVL35>:
    edc4:	fee52823          	sw	a4,-16(a0)

0000edc8 <.L14>:
    edc8:	00400513          	li	a0,4
    edcc:	40d50533          	sub	a0,a0,a3
    edd0:	00269693          	sll	a3,a3,0x2

0000edd4 <.LVL37>:
    edd4:	00d60733          	add	a4,a2,a3
    edd8:	00251693          	sll	a3,a0,0x2
    eddc:	00800613          	li	a2,8
    ede0:	00c6ea63          	bltu	a3,a2,edf4 <.L15>
    ede4:	00072023          	sw	zero,0(a4)
    ede8:	00072223          	sw	zero,4(a4)
    edec:	ff868693          	add	a3,a3,-8
    edf0:	00870713          	add	a4,a4,8

0000edf4 <.L15>:
    edf4:	00400613          	li	a2,4
    edf8:	00c6e463          	bltu	a3,a2,ee00 <.L16>
    edfc:	00072023          	sw	zero,0(a4)

0000ee00 <.L16>:
    ee00:	01012703          	lw	a4,16(sp)

0000ee04 <.LBB19>:
    ee04:	00f037b3          	snez	a5,a5

0000ee08 <.LBE19>:
    ee08:	00e7e7b3          	or	a5,a5,a4
    ee0c:	ef9ff06f          	j	ed04 <.L39>

0000ee10 <.L13>:
    ee10:	0008a303          	lw	t1,0(a7)
    ee14:	0048af83          	lw	t6,4(a7)
    ee18:	010882b3          	add	t0,a7,a6
    ee1c:	00e35333          	srl	t1,t1,a4
    ee20:	01cf9fb3          	sll	t6,t6,t3
    ee24:	01f36333          	or	t1,t1,t6
    ee28:	0062a023          	sw	t1,0(t0)

0000ee2c <.LVL41>:
    ee2c:	001f0f13          	add	t5,t5,1

0000ee30 <.LVL42>:
    ee30:	00488893          	add	a7,a7,4
    ee34:	f75ff06f          	j	eda8 <.L12>

0000ee38 <.L3>:
    ee38:	01412603          	lw	a2,20(sp)
    ee3c:	01812703          	lw	a4,24(sp)
    ee40:	01c12803          	lw	a6,28(sp)

0000ee44 <.LBE23>:
    ee44:	00c767b3          	or	a5,a4,a2
    ee48:	0107e7b3          	or	a5,a5,a6
    ee4c:	00a7e7b3          	or	a5,a5,a0
    ee50:	00069863          	bnez	a3,ee60 <.L17>

0000ee54 <.LVL44>:
    ee54:	00f037b3          	snez	a5,a5
    ee58:	00000713          	li	a4,0
    ee5c:	e71ff06f          	j	eccc <.L4>

0000ee60 <.L17>:
    ee60:	0a078e63          	beqz	a5,ef1c <.L24>

0000ee64 <.LBB24>:
    ee64:	00471793          	sll	a5,a4,0x4
    ee68:	01c65613          	srl	a2,a2,0x1c

0000ee6c <.LVL47>:
    ee6c:	01c75713          	srl	a4,a4,0x1c

0000ee70 <.LVL48>:
    ee70:	00481813          	sll	a6,a6,0x4

0000ee74 <.LBE25>:
    ee74:	004006b7          	lui	a3,0x400

0000ee78 <.LBB26>:
    ee78:	00f66633          	or	a2,a2,a5

0000ee7c <.LVL51>:
    ee7c:	01076733          	or	a4,a4,a6

0000ee80 <.LBE26>:
    ee80:	00d76733          	or	a4,a4,a3

0000ee84 <.LVL53>:
    ee84:	ff867793          	and	a5,a2,-8

0000ee88 <.LVL54>:
    ee88:	7ff00693          	li	a3,2047
    ee8c:	e41ff06f          	j	eccc <.L4>

0000ee90 <.L23>:
    ee90:	00000713          	li	a4,0
    ee94:	00000793          	li	a5,0

0000ee98 <.L40>:
    ee98:	7ff00693          	li	a3,2047

0000ee9c <.L18>:
  FP_PACK_SEMIRAW_D (r, R);
    ee9c:	00871613          	sll	a2,a4,0x8
    eea0:	00065e63          	bgez	a2,eebc <.L21>

0000eea4 <.LVL58>:
    eea4:	00168693          	add	a3,a3,1 # 400001 <_ebss+0x3ea111>

0000eea8 <.LVL59>:
    eea8:	7ff00613          	li	a2,2047
    eeac:	06c68c63          	beq	a3,a2,ef24 <.L25>
    eeb0:	ff800637          	lui	a2,0xff800
    eeb4:	fff60613          	add	a2,a2,-1 # ff7fffff <_ebss+0xff7ea10f>
    eeb8:	00c77733          	and	a4,a4,a2

0000eebc <.L21>:
    eebc:	01d71613          	sll	a2,a4,0x1d
    eec0:	0037d793          	srl	a5,a5,0x3

0000eec4 <.LVL61>:
    eec4:	00f667b3          	or	a5,a2,a5

0000eec8 <.LVL62>:
    eec8:	7ff00613          	li	a2,2047
    eecc:	00375713          	srl	a4,a4,0x3
    eed0:	00c69e63          	bne	a3,a2,eeec <.L22>

0000eed4 <.LVL64>:
    eed4:	00e7e7b3          	or	a5,a5,a4

0000eed8 <.LVL65>:
    eed8:	00000713          	li	a4,0

0000eedc <.LVL66>:
    eedc:	00078863          	beqz	a5,eeec <.L22>
    eee0:	00080737          	lui	a4,0x80
    eee4:	00000793          	li	a5,0
    eee8:	00000593          	li	a1,0

0000eeec <.L22>:
    eeec:	01469693          	sll	a3,a3,0x14
    eef0:	7ff00637          	lui	a2,0x7ff00
    eef4:	00c71713          	sll	a4,a4,0xc

0000eef8 <.LVL68>:
    eef8:	00c75713          	srl	a4,a4,0xc
    eefc:	00c6f6b3          	and	a3,a3,a2
    ef00:	01f59593          	sll	a1,a1,0x1f

0000ef04 <.LVL69>:
    ef04:	00e6e6b3          	or	a3,a3,a4
    ef08:	00b6e733          	or	a4,a3,a1

0000ef0c <.LBE28>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    ef0c:	00078513          	mv	a0,a5
    ef10:	00070593          	mv	a1,a4
    ef14:	02010113          	add	sp,sp,32

0000ef18 <.LVL71>:
    ef18:	00008067          	ret

0000ef1c <.L24>:
    ef1c:	00000713          	li	a4,0
    ef20:	f79ff06f          	j	ee98 <.L40>

0000ef24 <.L25>:
    ef24:	00000713          	li	a4,0

0000ef28 <.LVL74>:
    ef28:	00000793          	li	a5,0

0000ef2c <.LVL75>:
    ef2c:	f91ff06f          	j	eebc <.L21>

0000ef30 <pset>:
/* ------------------------------------------------------------------ */
/* Primitives                                                           */
/* ------------------------------------------------------------------ */
static void pset(int x, int y, uint8_t r, uint8_t g, uint8_t b)
{
    if ((unsigned)x >= (unsigned)g_w || (unsigned)y >= (unsigned)g_h) return;
    ef30:	00007797          	auipc	a5,0x7
    ef34:	f507a783          	lw	a5,-176(a5) # 15e80 <g_w>
    ef38:	02f57e63          	bgeu	a0,a5,ef74 <.L1>
    ef3c:	00007817          	auipc	a6,0x7
    ef40:	f4082803          	lw	a6,-192(a6) # 15e7c <g_h>
    ef44:	0305f863          	bgeu	a1,a6,ef74 <.L1>

0000ef48 <.LVL1>:
    int off = (y * g_w + x) * 4;
    ef48:	02b787b3          	mul	a5,a5,a1

0000ef4c <.LVL2>:
    g_buf[off+0] = r; g_buf[off+1] = g; g_buf[off+2] = b; g_buf[off+3] = 0xff;
    ef4c:	00007597          	auipc	a1,0x7
    ef50:	f385a583          	lw	a1,-200(a1) # 15e84 <g_buf>

0000ef54 <.LVL3>:
    int off = (y * g_w + x) * 4;
    ef54:	00a787b3          	add	a5,a5,a0
    ef58:	00279793          	sll	a5,a5,0x2

0000ef5c <.LVL4>:
    g_buf[off+0] = r; g_buf[off+1] = g; g_buf[off+2] = b; g_buf[off+3] = 0xff;
    ef5c:	00f587b3          	add	a5,a1,a5

0000ef60 <.LVL5>:
    ef60:	00e78123          	sb	a4,2(a5)
    ef64:	fff00713          	li	a4,-1

0000ef68 <.LVL6>:
    ef68:	00c78023          	sb	a2,0(a5)
    ef6c:	00d780a3          	sb	a3,1(a5)
    ef70:	00e781a3          	sb	a4,3(a5)

0000ef74 <.L1>:
}
    ef74:	00008067          	ret

0000ef78 <fill_rect>:

static void fill_rect(int x0, int y0, int x1, int y1,
                      uint8_t r, uint8_t g, uint8_t b)
{
    if (x0 < 0) x0 = 0; if (y0 < 0) y0 = 0;
    ef78:	00055463          	bgez	a0,ef80 <.L4>
    ef7c:	00000513          	li	a0,0

0000ef80 <.L4>:
    ef80:	0005d463          	bgez	a1,ef88 <.L5>
    ef84:	00000593          	li	a1,0

0000ef88 <.L5>:
    if (x1 > g_w) x1 = g_w; if (y1 > g_h) y1 = g_h;
    ef88:	00007897          	auipc	a7,0x7
    ef8c:	ef88a883          	lw	a7,-264(a7) # 15e80 <g_w>
    ef90:	00088e93          	mv	t4,a7
    ef94:	01165463          	bge	a2,a7,ef9c <.L6>
    ef98:	00060e93          	mv	t4,a2

0000ef9c <.L6>:
    ef9c:	00007e17          	auipc	t3,0x7
    efa0:	ee0e2e03          	lw	t3,-288(t3) # 15e7c <g_h>
    efa4:	01c6d463          	bge	a3,t3,efac <.L7>
    efa8:	00068e13          	mv	t3,a3

0000efac <.L7>:
    for (int y = y0; y < y1; y++)
    efac:	03158333          	mul	t1,a1,a7

0000efb0 <.LBB3>:
        for (int x = x0; x < x1; x++) {
            int off = (y * g_w + x) * 4;
            g_buf[off+0]=r; g_buf[off+1]=g; g_buf[off+2]=b; g_buf[off+3]=0xff;
    efb0:	00007f17          	auipc	t5,0x7
    efb4:	ed4f2f03          	lw	t5,-300(t5) # 15e84 <g_buf>
    efb8:	fff00f93          	li	t6,-1

0000efbc <.L8>:
    for (int y = y0; y < y1; y++)
    efbc:	05c5d063          	bge	a1,t3,effc <.L3>
    efc0:	00a306b3          	add	a3,t1,a0
    efc4:	00269693          	sll	a3,a3,0x2
    efc8:	00df06b3          	add	a3,t5,a3

0000efcc <.LBB6>:
        for (int x = x0; x < x1; x++) {
    efcc:	00050613          	mv	a2,a0
    efd0:	01c0006f          	j	efec <.L11>

0000efd4 <.L9>:
            g_buf[off+0]=r; g_buf[off+1]=g; g_buf[off+2]=b; g_buf[off+3]=0xff;
    efd4:	00e68023          	sb	a4,0(a3)
    efd8:	00f680a3          	sb	a5,1(a3)
    efdc:	01068123          	sb	a6,2(a3)
    efe0:	01f681a3          	sb	t6,3(a3)

0000efe4 <.LBE5>:
        for (int x = x0; x < x1; x++) {
    efe4:	00160613          	add	a2,a2,1 # 7ff00001 <_ebss+0x7feea111>
    efe8:	00468693          	add	a3,a3,4

0000efec <.L11>:
    efec:	ffd644e3          	blt	a2,t4,efd4 <.L9>

0000eff0 <.LBE6>:
    for (int y = y0; y < y1; y++)
    eff0:	00158593          	add	a1,a1,1
    eff4:	01130333          	add	t1,t1,a7
    eff8:	fc5ff06f          	j	efbc <.L8>

0000effc <.L3>:
        }
}
    effc:	00008067          	ret

0000f000 <clear>:

static void clear(void) { fill_rect(0, 0, g_w, g_h, 0, 0, 0); }
    f000:	00000813          	li	a6,0
    f004:	00000793          	li	a5,0
    f008:	00000713          	li	a4,0
    f00c:	00007697          	auipc	a3,0x7
    f010:	e706a683          	lw	a3,-400(a3) # 15e7c <g_h>
    f014:	00007617          	auipc	a2,0x7
    f018:	e6c62603          	lw	a2,-404(a2) # 15e80 <g_w>
    f01c:	00000593          	li	a1,0
    f020:	00000513          	li	a0,0
    f024:	f55ff06f          	j	ef78 <fill_rect>

0000f028 <draw_line>:

/* Bresenham line */
static void draw_line(int x0, int y0, int x1, int y1,
                      uint8_t r, uint8_t g, uint8_t b)
{
    f028:	fb010113          	add	sp,sp,-80
    f02c:	03412c23          	sw	s4,56(sp)
    f030:	00060a13          	mv	s4,a2
    f034:	05212023          	sw	s2,64(sp)
    int dx = abs(x1-x0), sx = x0<x1 ? 1 : -1;
    f038:	40aa0933          	sub	s2,s4,a0
{
    f03c:	03812423          	sw	s8,40(sp)
    f040:	00078c13          	mv	s8,a5
    int dx = abs(x1-x0), sx = x0<x1 ? 1 : -1;
    f044:	41f95793          	sra	a5,s2,0x1f

0000f048 <.LVL21>:
{
    f048:	04812423          	sw	s0,72(sp)
    f04c:	04912223          	sw	s1,68(sp)
    f050:	03512a23          	sw	s5,52(sp)
    f054:	03912223          	sw	s9,36(sp)
    f058:	01b12e23          	sw	s11,28(sp)
    int dx = abs(x1-x0), sx = x0<x1 ? 1 : -1;
    f05c:	0127c933          	xor	s2,a5,s2
{
    f060:	04112623          	sw	ra,76(sp)
    f064:	03312e23          	sw	s3,60(sp)
    f068:	03612823          	sw	s6,48(sp)
    f06c:	03712623          	sw	s7,44(sp)
    f070:	03a12023          	sw	s10,32(sp)
    f074:	00050493          	mv	s1,a0
    f078:	00058413          	mv	s0,a1
    f07c:	00068a93          	mv	s5,a3
    f080:	00070613          	mv	a2,a4

0000f084 <.LVL22>:
    f084:	00080c93          	mv	s9,a6
    int dx = abs(x1-x0), sx = x0<x1 ? 1 : -1;
    f088:	40f90933          	sub	s2,s2,a5

0000f08c <.LVL23>:
    f08c:	00100d93          	li	s11,1
    f090:	01454463          	blt	a0,s4,f098 <.L14>
    f094:	fff00d93          	li	s11,-1

0000f098 <.L14>:
    int dy = -abs(y1-y0), sy = y0<y1 ? 1 : -1;
    f098:	408a89b3          	sub	s3,s5,s0
    f09c:	41f9d793          	sra	a5,s3,0x1f
    f0a0:	0137c9b3          	xor	s3,a5,s3
    f0a4:	40f989b3          	sub	s3,s3,a5
    f0a8:	41300bb3          	neg	s7,s3

0000f0ac <.LVL25>:
    f0ac:	fff00d13          	li	s10,-1
    f0b0:	01545463          	bge	s0,s5,f0b8 <.L15>
    f0b4:	00100d13          	li	s10,1

0000f0b8 <.L15>:
    int err = dx+dy;
    f0b8:	41390b33          	sub	s6,s2,s3

0000f0bc <.L16>:
    for (;;) {
        pset(x0, y0, r, g, b);
    f0bc:	000c8713          	mv	a4,s9
    f0c0:	000c0693          	mv	a3,s8
    f0c4:	00040593          	mv	a1,s0
    f0c8:	00048513          	mv	a0,s1
    f0cc:	00c12623          	sw	a2,12(sp)
    f0d0:	e61ff0ef          	jal	ef30 <pset>

0000f0d4 <.LVL28>:
        if (x0==x1 && y0==y1) break;
    f0d4:	00c12603          	lw	a2,12(sp)
    f0d8:	01449463          	bne	s1,s4,f0e0 <.L17>
    f0dc:	03540663          	beq	s0,s5,f108 <.L13>

0000f0e0 <.L17>:
        int e2 = err<<1;
    f0e0:	001b1793          	sll	a5,s6,0x1

0000f0e4 <.LVL29>:
        if (e2 >= dy) { if (x0==x1) break; err+=dy; x0+=sx; }
    f0e4:	0177ca63          	blt	a5,s7,f0f8 <.L19>
    f0e8:	03448063          	beq	s1,s4,f108 <.L13>
    f0ec:	413b0b33          	sub	s6,s6,s3
    f0f0:	01b484b3          	add	s1,s1,s11
        if (e2 <= dx) { if (y0==y1) break; err+=dx; y0+=sy; }
    f0f4:	fcf944e3          	blt	s2,a5,f0bc <.L16>

0000f0f8 <.L19>:
    f0f8:	01540863          	beq	s0,s5,f108 <.L13>
    f0fc:	012b0b33          	add	s6,s6,s2
    f100:	01a40433          	add	s0,s0,s10
    f104:	fb9ff06f          	j	f0bc <.L16>

0000f108 <.L13>:
    }
}
    f108:	04c12083          	lw	ra,76(sp)
    f10c:	04812403          	lw	s0,72(sp)

0000f110 <.LVL35>:
    f110:	04412483          	lw	s1,68(sp)

0000f114 <.LVL36>:
    f114:	04012903          	lw	s2,64(sp)

0000f118 <.LVL37>:
    f118:	03c12983          	lw	s3,60(sp)
    f11c:	03812a03          	lw	s4,56(sp)

0000f120 <.LVL38>:
    f120:	03412a83          	lw	s5,52(sp)

0000f124 <.LVL39>:
    f124:	03012b03          	lw	s6,48(sp)

0000f128 <.LVL40>:
    f128:	02c12b83          	lw	s7,44(sp)

0000f12c <.LVL41>:
    f12c:	02812c03          	lw	s8,40(sp)

0000f130 <.LVL42>:
    f130:	02412c83          	lw	s9,36(sp)

0000f134 <.LVL43>:
    f134:	02012d03          	lw	s10,32(sp)

0000f138 <.LVL44>:
    f138:	01c12d83          	lw	s11,28(sp)

0000f13c <.LVL45>:
    f13c:	05010113          	add	sp,sp,80
    f140:	00008067          	ret

0000f144 <hsv2rgb>:

/* HSV [0,1] → RGB [0,255] */
static void hsv2rgb(float h, float s, float v,
                    uint8_t *r, uint8_t *g, uint8_t *b)
{
    f144:	fd010113          	add	sp,sp,-48
    f148:	02912223          	sw	s1,36(sp)
    f14c:	00050493          	mv	s1,a0
    float c = v*s;
    f150:	00060513          	mv	a0,a2

0000f154 <.LVL47>:
{
    f154:	02112623          	sw	ra,44(sp)
    f158:	02812423          	sw	s0,40(sp)
    f15c:	03212023          	sw	s2,32(sp)
    f160:	01312e23          	sw	s3,28(sp)
    f164:	00060913          	mv	s2,a2
    f168:	00078993          	mv	s3,a5
    f16c:	01412c23          	sw	s4,24(sp)
    f170:	01512a23          	sw	s5,20(sp)
    f174:	00070a13          	mv	s4,a4
    f178:	00068a93          	mv	s5,a3
    f17c:	01612823          	sw	s6,16(sp)
    f180:	01712623          	sw	s7,12(sp)
    float c = v*s;
    f184:	b65f10ef          	jal	ce8 <__mulsf3>

0000f188 <.LVL48>:
    f188:	00050413          	mv	s0,a0

0000f18c <.LVL49>:
    float x = c * (1.0f - fabsf(fmodf(h*6.0f, 2.0f) - 1.0f));
    f18c:	00003597          	auipc	a1,0x3
    f190:	d785a583          	lw	a1,-648(a1) # 11f04 <.LC0>
    f194:	00048513          	mv	a0,s1
    f198:	b51f10ef          	jal	ce8 <__mulsf3>

0000f19c <.LVL50>:
    f19c:	00003597          	auipc	a1,0x3
    f1a0:	d6c5a583          	lw	a1,-660(a1) # 11f08 <.LC1>
    f1a4:	00050b93          	mv	s7,a0
    f1a8:	ee9f40ef          	jal	4090 <fmodf>

0000f1ac <.LVL51>:
    f1ac:	00003597          	auipc	a1,0x3
    f1b0:	d605a583          	lw	a1,-672(a1) # 11f0c <.LC2>
    f1b4:	e51f10ef          	jal	1004 <__subsf3>

0000f1b8 <.LVL52>:
    f1b8:	00151593          	sll	a1,a0,0x1
    f1bc:	0015d593          	srl	a1,a1,0x1
    f1c0:	00003517          	auipc	a0,0x3
    f1c4:	d4c52503          	lw	a0,-692(a0) # 11f0c <.LC2>
    f1c8:	e3df10ef          	jal	1004 <__subsf3>

0000f1cc <.LVL53>:
    f1cc:	00040593          	mv	a1,s0
    f1d0:	b19f10ef          	jal	ce8 <__mulsf3>

0000f1d4 <.LVL54>:
    float m = v-c;
    f1d4:	00040593          	mv	a1,s0
    float x = c * (1.0f - fabsf(fmodf(h*6.0f, 2.0f) - 1.0f));
    f1d8:	00050493          	mv	s1,a0

0000f1dc <.LVL55>:
    float m = v-c;
    f1dc:	00090513          	mv	a0,s2
    f1e0:	e25f10ef          	jal	1004 <__subsf3>

0000f1e4 <.LVL56>:
    f1e4:	00050b13          	mv	s6,a0

0000f1e8 <.LVL57>:
    float r1,g1,b1;
    int hi = (int)(h*6.0f) % 6;
    f1e8:	000b8513          	mv	a0,s7

0000f1ec <.LVL58>:
    f1ec:	a48f20ef          	jal	1434 <__fixsfsi>

0000f1f0 <.LVL59>:
    f1f0:	00600793          	li	a5,6
    f1f4:	02f56633          	rem	a2,a0,a5
    f1f8:	00400793          	li	a5,4
    f1fc:	02c7e063          	bltu	a5,a2,f21c <.L26>
    f200:	00003717          	auipc	a4,0x3
    f204:	95870713          	add	a4,a4,-1704 # 11b58 <.L28>
    f208:	00261613          	sll	a2,a2,0x2
    f20c:	00e60633          	add	a2,a2,a4
    f210:	00062783          	lw	a5,0(a2)
    f214:	00e787b3          	add	a5,a5,a4
    f218:	00078067          	jr	a5

0000f21c <.L26>:
    if      (hi==0){r1=c;g1=x;b1=0;}
    else if (hi==1){r1=x;g1=c;b1=0;}
    else if (hi==2){r1=0;g1=c;b1=x;}
    else if (hi==3){r1=0;g1=x;b1=c;}
    else if (hi==4){r1=x;g1=0;b1=c;}
    else           {r1=c;g1=0;b1=x;}
    f21c:	00048913          	mv	s2,s1

0000f220 <.L35>:
    int hi = (int)(h*6.0f) % 6;
    f220:	00000493          	li	s1,0

0000f224 <.LVL61>:
    f224:	0240006f          	j	f248 <.L32>

0000f228 <.L31>:
    f228:	00040793          	mv	a5,s0
    f22c:	00048413          	mv	s0,s1

0000f230 <.LVL63>:
    f230:	00078493          	mv	s1,a5

0000f234 <.L33>:
    f234:	00000913          	li	s2,0

0000f238 <.LVL65>:
    f238:	0100006f          	j	f248 <.L32>

0000f23c <.L30>:
    f23c:	00048913          	mv	s2,s1

0000f240 <.LVL67>:
    f240:	00040493          	mv	s1,s0

0000f244 <.L36>:
    f244:	00000413          	li	s0,0

0000f248 <.L32>:
    *r = (uint8_t)((r1+m)*255.0f);
    f248:	000b0593          	mv	a1,s6
    f24c:	00040513          	mv	a0,s0
    f250:	b48f10ef          	jal	598 <__addsf3>

0000f254 <.LVL70>:
    f254:	00003597          	auipc	a1,0x3
    f258:	cbc5a583          	lw	a1,-836(a1) # 11f10 <.LC3>
    f25c:	a8df10ef          	jal	ce8 <__mulsf3>

0000f260 <.LVL71>:
    f260:	a44f20ef          	jal	14a4 <__fixunssfsi>

0000f264 <.LVL72>:
    f264:	00aa8023          	sb	a0,0(s5)
    *g = (uint8_t)((g1+m)*255.0f);
    f268:	000b0593          	mv	a1,s6
    f26c:	00048513          	mv	a0,s1
    f270:	b28f10ef          	jal	598 <__addsf3>

0000f274 <.LVL73>:
    f274:	00003597          	auipc	a1,0x3
    f278:	c9c5a583          	lw	a1,-868(a1) # 11f10 <.LC3>
    f27c:	a6df10ef          	jal	ce8 <__mulsf3>

0000f280 <.LVL74>:
    f280:	a24f20ef          	jal	14a4 <__fixunssfsi>

0000f284 <.LVL75>:
    f284:	00aa0023          	sb	a0,0(s4)
    *b = (uint8_t)((b1+m)*255.0f);
    f288:	000b0593          	mv	a1,s6
    f28c:	00090513          	mv	a0,s2
    f290:	b08f10ef          	jal	598 <__addsf3>

0000f294 <.LVL76>:
    f294:	00003597          	auipc	a1,0x3
    f298:	c7c5a583          	lw	a1,-900(a1) # 11f10 <.LC3>
    f29c:	a4df10ef          	jal	ce8 <__mulsf3>

0000f2a0 <.LVL77>:
    f2a0:	a04f20ef          	jal	14a4 <__fixunssfsi>

0000f2a4 <.LVL78>:
    f2a4:	00a98023          	sb	a0,0(s3)
}
    f2a8:	02c12083          	lw	ra,44(sp)
    f2ac:	02812403          	lw	s0,40(sp)

0000f2b0 <.LVL79>:
    f2b0:	02412483          	lw	s1,36(sp)

0000f2b4 <.LVL80>:
    f2b4:	02012903          	lw	s2,32(sp)

0000f2b8 <.LVL81>:
    f2b8:	01c12983          	lw	s3,28(sp)

0000f2bc <.LVL82>:
    f2bc:	01812a03          	lw	s4,24(sp)

0000f2c0 <.LVL83>:
    f2c0:	01412a83          	lw	s5,20(sp)

0000f2c4 <.LVL84>:
    f2c4:	01012b03          	lw	s6,16(sp)

0000f2c8 <.LVL85>:
    f2c8:	00c12b83          	lw	s7,12(sp)

0000f2cc <.LVL86>:
    f2cc:	03010113          	add	sp,sp,48
    f2d0:	00008067          	ret

0000f2d4 <.L29>:
    int hi = (int)(h*6.0f) % 6;
    f2d4:	00040913          	mv	s2,s0

0000f2d8 <.LVL88>:
    f2d8:	f6dff06f          	j	f244 <.L36>

0000f2dc <.L27>:
    f2dc:	00040913          	mv	s2,s0

0000f2e0 <.LVL90>:
    f2e0:	00048413          	mv	s0,s1

0000f2e4 <.LVL91>:
    f2e4:	f3dff06f          	j	f220 <.L35>

0000f2e8 <sin_tab_init>:
}

/* Sin lookup table [-127,127], 256 entries for one full period */
static int8_t sin_tab[256];
static void sin_tab_init(void)
{
    f2e8:	fe010113          	add	sp,sp,-32
    f2ec:	00812c23          	sw	s0,24(sp)
    f2f0:	00912a23          	sw	s1,20(sp)
    f2f4:	01312623          	sw	s3,12(sp)
    f2f8:	01412423          	sw	s4,8(sp)
    f2fc:	01512223          	sw	s5,4(sp)
    f300:	01612023          	sw	s6,0(sp)
    f304:	00112e23          	sw	ra,28(sp)
    f308:	01212823          	sw	s2,16(sp)

0000f30c <.LBB9>:
    for (int i = 0; i < 256; i++)
    f30c:	00000413          	li	s0,0
        sin_tab[i] = (int8_t)(sinf(i * 2.0f * PI / 256.0f) * 127.0f);
    f310:	00003b17          	auipc	s6,0x3
    f314:	c04b2b03          	lw	s6,-1020(s6) # 11f14 <.LC4>
    f318:	00003a97          	auipc	s5,0x3
    f31c:	c00aaa83          	lw	s5,-1024(s5) # 11f18 <.LC5>
    f320:	00007a17          	auipc	s4,0x7
    f324:	a5ca0a13          	add	s4,s4,-1444 # 15d7c <sin_tab>
    f328:	00003997          	auipc	s3,0x3
    f32c:	bf49a983          	lw	s3,-1036(s3) # 11f1c <.LC6>
    for (int i = 0; i < 256; i++)
    f330:	10000493          	li	s1,256

0000f334 <.L38>:
        sin_tab[i] = (int8_t)(sinf(i * 2.0f * PI / 256.0f) * 127.0f);
    f334:	00040513          	mv	a0,s0
    f338:	9d4f20ef          	jal	150c <__floatsisf>

0000f33c <.LVL94>:
    f33c:	00050593          	mv	a1,a0
    f340:	a58f10ef          	jal	598 <__addsf3>

0000f344 <.LVL95>:
    f344:	000b0593          	mv	a1,s6
    f348:	9a1f10ef          	jal	ce8 <__mulsf3>

0000f34c <.LVL96>:
    f34c:	000a8593          	mv	a1,s5
    f350:	999f10ef          	jal	ce8 <__mulsf3>

0000f354 <.LVL97>:
    f354:	d95f40ef          	jal	40e8 <__GI_sinf>

0000f358 <.LVL98>:
    f358:	00098593          	mv	a1,s3
    f35c:	98df10ef          	jal	ce8 <__mulsf3>

0000f360 <.LVL99>:
    f360:	01440933          	add	s2,s0,s4
    f364:	8d0f20ef          	jal	1434 <__fixsfsi>

0000f368 <.LVL100>:
    f368:	00a90023          	sb	a0,0(s2)
    for (int i = 0; i < 256; i++)
    f36c:	00140413          	add	s0,s0,1
    f370:	fc9412e3          	bne	s0,s1,f334 <.L38>

0000f374 <.LBE9>:
}
    f374:	01c12083          	lw	ra,28(sp)
    f378:	01812403          	lw	s0,24(sp)

0000f37c <.LVL102>:
    f37c:	01412483          	lw	s1,20(sp)
    f380:	01012903          	lw	s2,16(sp)
    f384:	00c12983          	lw	s3,12(sp)
    f388:	00812a03          	lw	s4,8(sp)
    f38c:	00412a83          	lw	s5,4(sp)
    f390:	00012b03          	lw	s6,0(sp)
    f394:	02010113          	add	sp,sp,32
    f398:	00008067          	ret

0000f39c <main>:

/* ================================================================== */
/* main                                                                 */
/* ================================================================== */
int main(int argc, char *argv[])
{
    f39c:	eb010113          	add	sp,sp,-336
    f3a0:	14112623          	sw	ra,332(sp)
    f3a4:	14812423          	sw	s0,328(sp)
    f3a8:	14912223          	sw	s1,324(sp)
    f3ac:	15212023          	sw	s2,320(sp)
    f3b0:	13312e23          	sw	s3,316(sp)
    f3b4:	13412c23          	sw	s4,312(sp)
    f3b8:	13512a23          	sw	s5,308(sp)
    f3bc:	13612823          	sw	s6,304(sp)
    f3c0:	13712623          	sw	s7,300(sp)
    f3c4:	13812423          	sw	s8,296(sp)
    f3c8:	13912223          	sw	s9,292(sp)
    f3cc:	13a12023          	sw	s10,288(sp)
    f3d0:	11b12e23          	sw	s11,284(sp)
    if (argc < 2) {
    f3d4:	00100793          	li	a5,1
    f3d8:	04a7c863          	blt	a5,a0,f428 <.L42>
        printf("Usage: framebuff <1-10>\n"
    f3dc:	00002517          	auipc	a0,0x2
    f3e0:	79050513          	add	a0,a0,1936 # 11b6c <.LC7>

0000f3e4 <.L121>:
               "  5  3D cube            10  Lissajous\n");
        return 1;
    }

    int pat = atoi(argv[1]);
    if (pat < 1 || pat > 10) { printf("Pattern must be 1-10\n"); return 1; }
    f3e4:	c28f20ef          	jal	180c <puts>

0000f3e8 <.L43>:
        return 1;
    f3e8:	00100513          	li	a0,1

0000f3ec <.L41>:
    write(fd, g_buf, size);

    free(g_buf);
    close(fd);
    return 0;
}
    f3ec:	14c12083          	lw	ra,332(sp)
    f3f0:	14812403          	lw	s0,328(sp)
    f3f4:	14412483          	lw	s1,324(sp)
    f3f8:	14012903          	lw	s2,320(sp)
    f3fc:	13c12983          	lw	s3,316(sp)
    f400:	13812a03          	lw	s4,312(sp)
    f404:	13412a83          	lw	s5,308(sp)
    f408:	13012b03          	lw	s6,304(sp)
    f40c:	12c12b83          	lw	s7,300(sp)
    f410:	12812c03          	lw	s8,296(sp)
    f414:	12412c83          	lw	s9,292(sp)
    f418:	12012d03          	lw	s10,288(sp)
    f41c:	11c12d83          	lw	s11,284(sp)
    f420:	15010113          	add	sp,sp,336
    f424:	00008067          	ret

0000f428 <.L42>:
    int pat = atoi(argv[1]);
    f428:	0045a503          	lw	a0,4(a1)

0000f42c <.LVL107>:
    f42c:	a54f40ef          	jal	3680 <__GI_atoi>

0000f430 <.LVL108>:
    f430:	00a12223          	sw	a0,4(sp)

0000f434 <.LVL109>:
    if (pat < 1 || pat > 10) { printf("Pattern must be 1-10\n"); return 1; }
    f434:	fff50713          	add	a4,a0,-1
    f438:	00900793          	li	a5,9
    f43c:	00e7f863          	bgeu	a5,a4,f44c <.L44>
    f440:	00003517          	auipc	a0,0x3
    f444:	81850513          	add	a0,a0,-2024 # 11c58 <.LC8>

0000f448 <.LVL110>:
    f448:	f9dff06f          	j	f3e4 <.L121>

0000f44c <.L44>:
    int fd = open("/dev/fb0", O_RDWR);
    f44c:	00200593          	li	a1,2
    f450:	00003517          	auipc	a0,0x3
    f454:	82050513          	add	a0,a0,-2016 # 11c70 <.LC9>

0000f458 <.LVL112>:
    f458:	adcf20ef          	jal	1734 <__GI_open>

0000f45c <.LVL113>:
    f45c:	00a12023          	sw	a0,0(sp)

0000f460 <.LVL114>:
    if (fd < 0) { printf("framebuff: open /dev/fb0 failed\n"); return 1; }
    f460:	00055863          	bgez	a0,f470 <.L46>
    f464:	00003517          	auipc	a0,0x3
    f468:	81850513          	add	a0,a0,-2024 # 11c7c <.LC10>

0000f46c <.LVL115>:
    f46c:	f79ff06f          	j	f3e4 <.L121>

0000f470 <.L46>:
    if (ioctl(fd, FBIOGET_VSCREENINFO, &vinfo) < 0) {
    f470:	000045b7          	lui	a1,0x4
    f474:	07010613          	add	a2,sp,112
    f478:	60058593          	add	a1,a1,1536 # 4600 <__GI_config_read+0x5c>
    f47c:	a18f20ef          	jal	1694 <__GI_ioctl>

0000f480 <.LVL117>:
    f480:	00055e63          	bgez	a0,f49c <.L47>
        printf("framebuff: ioctl failed\n"); close(fd); return 1;
    f484:	00003517          	auipc	a0,0x3
    f488:	81850513          	add	a0,a0,-2024 # 11c9c <.LC11>

0000f48c <.L122>:
    if (!g_buf) { printf("framebuff: malloc failed\n"); close(fd); return 1; }
    f48c:	b80f20ef          	jal	180c <puts>

0000f490 <.LVL118>:
    f490:	00012503          	lw	a0,0(sp)
    f494:	9ccf20ef          	jal	1660 <__GI_close>

0000f498 <.LVL119>:
    f498:	f51ff06f          	j	f3e8 <.L43>

0000f49c <.L47>:
    g_w = (int)vinfo.xres;
    f49c:	07012d83          	lw	s11,112(sp)
    g_h = (int)vinfo.yres;
    f4a0:	07412d03          	lw	s10,116(sp)
    g_w = (int)vinfo.xres;
    f4a4:	00007797          	auipc	a5,0x7
    f4a8:	9db7ae23          	sw	s11,-1572(a5) # 15e80 <g_w>
    g_h = (int)vinfo.yres;
    f4ac:	00007797          	auipc	a5,0x7
    f4b0:	9da7a823          	sw	s10,-1584(a5) # 15e7c <g_h>

0000f4b4 <.LVL120>:
    int size = g_w * g_h * 4;
    f4b4:	03ad87b3          	mul	a5,s11,s10
    f4b8:	00279793          	sll	a5,a5,0x2

0000f4bc <.LVL121>:
    g_buf = malloc(size);
    f4bc:	00078513          	mv	a0,a5
    int size = g_w * g_h * 4;
    f4c0:	00f12623          	sw	a5,12(sp)
    g_buf = malloc(size);
    f4c4:	e05f30ef          	jal	32c8 <malloc>

0000f4c8 <.LVL122>:
    f4c8:	00007797          	auipc	a5,0x7
    f4cc:	9bc78793          	add	a5,a5,-1604 # 15e84 <g_buf>
    f4d0:	00a7a023          	sw	a0,0(a5)
    if (!g_buf) { printf("framebuff: malloc failed\n"); close(fd); return 1; }
    f4d4:	00051863          	bnez	a0,f4e4 <.L48>
    f4d8:	00002517          	auipc	a0,0x2
    f4dc:	7dc50513          	add	a0,a0,2012 # 11cb4 <.LC12>
    f4e0:	fadff06f          	j	f48c <.L122>

0000f4e4 <.L48>:
    switch (pat) {
    f4e4:	00412783          	lw	a5,4(sp)
    f4e8:	00800713          	li	a4,8
    f4ec:	ffe78793          	add	a5,a5,-2
    f4f0:	02f76063          	bltu	a4,a5,f510 <.L49>
    f4f4:	00002717          	auipc	a4,0x2
    f4f8:	7fc70713          	add	a4,a4,2044 # 11cf0 <.L51>
    f4fc:	00279793          	sll	a5,a5,0x2
    f500:	00e787b3          	add	a5,a5,a4
    f504:	0007a783          	lw	a5,0(a5)
    f508:	00e787b3          	add	a5,a5,a4
    f50c:	00078067          	jr	a5

0000f510 <.L49>:
    int w=g_w, h=g_h, y1=h*7/12, y2=h*8/12;
    f510:	00700a13          	li	s4,7
    f514:	034d0a33          	mul	s4,s10,s4
    f518:	00c00793          	li	a5,12
    f51c:	003d1493          	sll	s1,s10,0x3
    f520:	00003417          	auipc	s0,0x3
    f524:	94040413          	add	s0,s0,-1728 # 11e60 <top.5>
    f528:	00003917          	auipc	s2,0x3
    f52c:	92090913          	add	s2,s2,-1760 # 11e48 <mid.4>
    f530:	00003b17          	auipc	s6,0x3
    f534:	945b0b13          	add	s6,s6,-1723 # 11e75 <top.5+0x15>
    f538:	00000993          	li	s3,0

0000f53c <.LBB74>:
        int x0 = w*i/7, x1 = w*(i+1)/7;
    f53c:	00700a93          	li	s5,7

0000f540 <.LBE74>:
    int w=g_w, h=g_h, y1=h*7/12, y2=h*8/12;
    f540:	02fa4a33          	div	s4,s4,a5

0000f544 <.LVL124>:
    f544:	02f4c4b3          	div	s1,s1,a5

0000f548 <.L60>:
        fill_rect(x0, 0,  x1, y1, top[i][0], top[i][1], top[i][2]);
    f548:	00244803          	lbu	a6,2(s0)
    f54c:	00144783          	lbu	a5,1(s0)
    f550:	00044703          	lbu	a4,0(s0)
    f554:	000a0693          	mv	a3,s4
    f558:	00000593          	li	a1,0

0000f55c <.LBE76>:
    for (int i = 0; i < 7; i++) {
    f55c:	00340413          	add	s0,s0,3
    f560:	00390913          	add	s2,s2,3

0000f564 <.LBB77>:
        int x0 = w*i/7, x1 = w*(i+1)/7;
    f564:	0359c533          	div	a0,s3,s5

0000f568 <.LVL126>:
    f568:	01b989b3          	add	s3,s3,s11
    f56c:	0359c633          	div	a2,s3,s5

0000f570 <.LVL127>:
        fill_rect(x0, 0,  x1, y1, top[i][0], top[i][1], top[i][2]);
    f570:	00a12423          	sw	a0,8(sp)
    f574:	00c12823          	sw	a2,16(sp)
    f578:	a01ff0ef          	jal	ef78 <fill_rect>

0000f57c <.LVL128>:
        fill_rect(x0, y1, x1, y2, mid[i][0], mid[i][1], mid[i][2]);
    f57c:	fff94803          	lbu	a6,-1(s2)
    f580:	ffe94783          	lbu	a5,-2(s2)
    f584:	ffd94703          	lbu	a4,-3(s2)
    f588:	01012603          	lw	a2,16(sp)
    f58c:	00812503          	lw	a0,8(sp)
    f590:	00048693          	mv	a3,s1
    f594:	000a0593          	mv	a1,s4
    f598:	9e1ff0ef          	jal	ef78 <fill_rect>

0000f59c <.LBE77>:
    for (int i = 0; i < 7; i++) {
    f59c:	fa8b16e3          	bne	s6,s0,f548 <.L60>

0000f5a0 <.LBE78>:
    int bw = w/4;
    f5a0:	00400413          	li	s0,4
    f5a4:	028dc433          	div	s0,s11,s0

0000f5a8 <.LVL130>:
    fill_rect(0,    y2, bw,   h,  0,  0,128);
    f5a8:	08000813          	li	a6,128
    f5ac:	00000793          	li	a5,0
    f5b0:	00000713          	li	a4,0
    f5b4:	000d0693          	mv	a3,s10
    f5b8:	00048593          	mv	a1,s1
    f5bc:	00000513          	li	a0,0
    f5c0:	00040613          	mv	a2,s0
    f5c4:	9b5ff0ef          	jal	ef78 <fill_rect>

0000f5c8 <.LVL131>:
    fill_rect(bw,   y2, bw*2, h, 255,255,255);
    f5c8:	00141913          	sll	s2,s0,0x1
    f5cc:	00040513          	mv	a0,s0
    f5d0:	0ff00813          	li	a6,255
    f5d4:	0ff00793          	li	a5,255
    f5d8:	0ff00713          	li	a4,255
    f5dc:	000d0693          	mv	a3,s10
    f5e0:	00090613          	mv	a2,s2
    f5e4:	00048593          	mv	a1,s1
    f5e8:	991ff0ef          	jal	ef78 <fill_rect>

0000f5ec <.LVL132>:
    fill_rect(bw*2, y2, bw*3, h,  75,  0,128);
    f5ec:	00300793          	li	a5,3
    f5f0:	02f40433          	mul	s0,s0,a5

0000f5f4 <.LVL133>:
    f5f4:	08000813          	li	a6,128
    f5f8:	00000793          	li	a5,0
    f5fc:	04b00713          	li	a4,75
    f600:	000d0693          	mv	a3,s10
    f604:	00048593          	mv	a1,s1
    f608:	00090513          	mv	a0,s2
    f60c:	00040613          	mv	a2,s0
    f610:	969ff0ef          	jal	ef78 <fill_rect>

0000f614 <.LVL134>:
    fill_rect(bw*3, y2, w,    h,  0,  0,  0);
    f614:	00000813          	li	a6,0
    f618:	00000793          	li	a5,0
    f61c:	00000713          	li	a4,0
    f620:	000d0693          	mv	a3,s10
    f624:	000d8613          	mv	a2,s11
    f628:	00048593          	mv	a1,s1
    f62c:	00040513          	mv	a0,s0
    f630:	949ff0ef          	jal	ef78 <fill_rect>

0000f634 <.L61>:
    printf("framebuff: %s rendered (%dx%d)\n", names[pat], g_w, g_h);
    f634:	00412783          	lw	a5,4(sp)
    f638:	00003717          	auipc	a4,0x3
    f63c:	cb870713          	add	a4,a4,-840 # 122f0 <names.6>
    f640:	000d0693          	mv	a3,s10
    f644:	00279793          	sll	a5,a5,0x2
    f648:	00f707b3          	add	a5,a4,a5
    f64c:	0007a583          	lw	a1,0(a5)
    f650:	000d8613          	mv	a2,s11
    f654:	00002517          	auipc	a0,0x2
    f658:	67c50513          	add	a0,a0,1660 # 11cd0 <.LC24>
    f65c:	a10f20ef          	jal	186c <__GI_printf>

0000f660 <.LVL136>:
    lseek(fd, 0, SEEK_SET);
    f660:	00012503          	lw	a0,0(sp)
    f664:	00000613          	li	a2,0
    f668:	00000593          	li	a1,0
    f66c:	878f20ef          	jal	16e4 <__GI_lseek>

0000f670 <.LVL137>:
    write(fd, g_buf, size);
    f670:	00007797          	auipc	a5,0x7
    f674:	81478793          	add	a5,a5,-2028 # 15e84 <g_buf>
    f678:	00c12603          	lw	a2,12(sp)
    f67c:	0007a583          	lw	a1,0(a5)
    f680:	00012503          	lw	a0,0(sp)
    f684:	00078413          	mv	s0,a5
    f688:	95cf20ef          	jal	17e4 <__GI_write>

0000f68c <.LVL138>:
    free(g_buf);
    f68c:	00042503          	lw	a0,0(s0)
    f690:	e51f30ef          	jal	34e0 <free>

0000f694 <.LVL139>:
    close(fd);
    f694:	00012503          	lw	a0,0(sp)
    f698:	fc9f10ef          	jal	1660 <__GI_close>

0000f69c <.LVL140>:
    return 0;
    f69c:	00000513          	li	a0,0
    f6a0:	d4dff06f          	j	f3ec <.L41>

0000f6a4 <.L62>:
            hsv2rgb((float)x/g_w, 1.0f, 1.0f - (float)y/g_h, &r,&g,&b);
    f6a4:	000b0513          	mv	a0,s6
    f6a8:	e65f10ef          	jal	150c <__floatsisf>

0000f6ac <.LVL142>:
    f6ac:	00050493          	mv	s1,a0
    f6b0:	000d0513          	mv	a0,s10
    f6b4:	e59f10ef          	jal	150c <__floatsisf>

0000f6b8 <.LVL143>:
    f6b8:	00050593          	mv	a1,a0
    f6bc:	00048513          	mv	a0,s1
    f6c0:	af8f10ef          	jal	9b8 <__divsf3>

0000f6c4 <.LVL144>:
    f6c4:	00050593          	mv	a1,a0
    f6c8:	00090513          	mv	a0,s2
    f6cc:	939f10ef          	jal	1004 <__subsf3>

0000f6d0 <.LVL145>:
    f6d0:	00a12423          	sw	a0,8(sp)
    f6d4:	00040513          	mv	a0,s0
    f6d8:	e35f10ef          	jal	150c <__floatsisf>

0000f6dc <.LVL146>:
    f6dc:	00050493          	mv	s1,a0
    f6e0:	000d8513          	mv	a0,s11
    f6e4:	e29f10ef          	jal	150c <__floatsisf>

0000f6e8 <.LVL147>:
    f6e8:	00050593          	mv	a1,a0
    f6ec:	00048513          	mv	a0,s1
    f6f0:	ac8f10ef          	jal	9b8 <__divsf3>

0000f6f4 <.LVL148>:
    f6f4:	00812603          	lw	a2,8(sp)
    f6f8:	00098793          	mv	a5,s3
    f6fc:	000a0713          	mv	a4,s4
    f700:	000a8693          	mv	a3,s5
    f704:	00090593          	mv	a1,s2
    f708:	a3dff0ef          	jal	f144 <hsv2rgb>

0000f70c <.LVL149>:
            pset(x, y, r, g, b);
    f70c:	05014703          	lbu	a4,80(sp)
    f710:	03014683          	lbu	a3,48(sp)
    f714:	02f14603          	lbu	a2,47(sp)
    f718:	00040513          	mv	a0,s0
    f71c:	000b0593          	mv	a1,s6
    f720:	811ff0ef          	jal	ef30 <pset>

0000f724 <.LBE82>:
        for (int x = 0; x < g_w; x++) {
    f724:	00140413          	add	s0,s0,1

0000f728 <.L63>:
    f728:	f7b44ee3          	blt	s0,s11,f6a4 <.L62>

0000f72c <.LBE81>:
    for (int y = 0; y < g_h; y++)
    f72c:	001b0b13          	add	s6,s6,1

0000f730 <.L59>:
    f730:	f1ab52e3          	bge	s6,s10,f634 <.L61>

0000f734 <.LBB84>:
        for (int x = 0; x < g_w; x++) {
    f734:	00000413          	li	s0,0
    f738:	ff1ff06f          	j	f728 <.L63>

0000f73c <.L108>:
    switch (pat) {
    f73c:	00000b13          	li	s6,0

0000f740 <.LBB83>:
            hsv2rgb((float)x/g_w, 1.0f, 1.0f - (float)y/g_h, &r,&g,&b);
    f740:	05010993          	add	s3,sp,80
    f744:	03010a13          	add	s4,sp,48
    f748:	02f10a93          	add	s5,sp,47
    f74c:	00002917          	auipc	s2,0x2
    f750:	7c092903          	lw	s2,1984(s2) # 11f0c <.LC2>
    f754:	fddff06f          	j	f730 <.L59>

0000f758 <.L71>:
        int32_t cim = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
    f758:	000d0613          	mv	a2,s10
    f75c:	00000693          	li	a3,0
    f760:	00090513          	mv	a0,s2
    f764:	000a0593          	mv	a1,s4
    f768:	9b9f00ef          	jal	120 <__divdi3>

0000f76c <.LBB92>:
                hsv2rgb((float)iter/MAXITER, 0.9f, 1.0f, &r,&g,&b);
    f76c:	05010793          	add	a5,sp,80
    f770:	00f12423          	sw	a5,8(sp)
    f774:	03010793          	add	a5,sp,48

0000f778 <.LBE92>:
        int32_t cim = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
    f778:	01550cb3          	add	s9,a0,s5

0000f77c <.LBB108>:
        for (int px = 0; px < g_w; px++) {
    f77c:	00000993          	li	s3,0
    f780:	00000b93          	li	s7,0
    f784:	00000493          	li	s1,0

0000f788 <.LBB103>:
                if (zr2+zi2 > ESCAPE) break;
    f788:	00004c37          	lui	s8,0x4

0000f78c <.LBB96>:
                hsv2rgb((float)iter/MAXITER, 0.9f, 1.0f, &r,&g,&b);
    f78c:	00f12823          	sw	a5,16(sp)

0000f790 <.L65>:
        for (int px = 0; px < g_w; px++) {
    f790:	03b4c463          	blt	s1,s11,f7b8 <.L70>

0000f794 <.LBE108>:
    for (int py = 0; py < g_h; py++) {
    f794:	000037b7          	lui	a5,0x3
    f798:	80078793          	add	a5,a5,-2048 # 2800 <.L47+0x8>
    f79c:	00f907b3          	add	a5,s2,a5
    f7a0:	0127b733          	sltu	a4,a5,s2
    f7a4:	00140413          	add	s0,s0,1
    f7a8:	00078913          	mv	s2,a5
    f7ac:	01470a33          	add	s4,a4,s4

0000f7b0 <.L58>:
    f7b0:	fba444e3          	blt	s0,s10,f758 <.L71>
    f7b4:	e81ff06f          	j	f634 <.L61>

0000f7b8 <.L70>:
            int32_t cre = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
    f7b8:	000d8613          	mv	a2,s11
    f7bc:	00000693          	li	a3,0
    f7c0:	00098513          	mv	a0,s3
    f7c4:	000b8593          	mv	a1,s7
    f7c8:	959f00ef          	jal	120 <__divdi3>

0000f7cc <.LVL161>:
    f7cc:	016505b3          	add	a1,a0,s6

0000f7d0 <.LBB97>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FP);
    f7d0:	00000613          	li	a2,0

0000f7d4 <.LBE97>:
            int iter=0;
    f7d4:	00000513          	li	a0,0

0000f7d8 <.LBB98>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FP);
    f7d8:	00000793          	li	a5,0
    f7dc:	00000313          	li	t1,0
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FP);
    f7e0:	00000693          	li	a3,0
    f7e4:	00000893          	li	a7,0
    f7e8:	00000713          	li	a4,0

0000f7ec <.LBE98>:
            while (iter < MAXITER) {
    f7ec:	05000813          	li	a6,80

0000f7f0 <.L66>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FP-1)) + cim;
    f7f0:	02f70733          	mul	a4,a4,a5
                int32_t tmp = zr2 - zi2 + cre;
    f7f4:	40c686b3          	sub	a3,a3,a2
                iter++;
    f7f8:	00150513          	add	a0,a0,1

0000f7fc <.LVL164>:
                int32_t tmp = zr2 - zi2 + cre;
    f7fc:	00b686b3          	add	a3,a3,a1

0000f800 <.LVL165>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FP-1)) + cim;
    f800:	03130333          	mul	t1,t1,a7
    f804:	02f88633          	mul	a2,a7,a5
    f808:	00670733          	add	a4,a4,t1
    f80c:	02f8b7b3          	mulhu	a5,a7,a5
    f810:	00f707b3          	add	a5,a4,a5
    f814:	01579793          	sll	a5,a5,0x15
    f818:	00b65713          	srl	a4,a2,0xb
    f81c:	00e7e733          	or	a4,a5,a4
    f820:	00ec87b3          	add	a5,s9,a4

0000f824 <.LBE99>:
            while (iter < MAXITER) {
    f824:	03051e63          	bne	a0,a6,f860 <.L68>
            if (iter == MAXITER) { pset(px,py, 0,0,0); }
    f828:	00000713          	li	a4,0
    f82c:	00000693          	li	a3,0

0000f830 <.LVL167>:
    f830:	00000613          	li	a2,0

0000f834 <.L123>:
                pset(px, py, r, g, b);
    f834:	00048513          	mv	a0,s1
    f838:	00040593          	mv	a1,s0
    f83c:	ef4ff0ef          	jal	ef30 <pset>

0000f840 <.LBE100>:
        for (int px = 0; px < g_w; px++) {
    f840:	000047b7          	lui	a5,0x4
    f844:	80078793          	add	a5,a5,-2048 # 3800 <.L20+0x4>
    f848:	00f987b3          	add	a5,s3,a5
    f84c:	0137b733          	sltu	a4,a5,s3
    f850:	00148493          	add	s1,s1,1
    f854:	00078993          	mv	s3,a5
    f858:	01770bb3          	add	s7,a4,s7
    f85c:	f35ff06f          	j	f790 <.L65>

0000f860 <.L68>:
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FP);
    f860:	02d68633          	mul	a2,a3,a3
    f864:	00068893          	mv	a7,a3
    f868:	41f6d713          	sra	a4,a3,0x1f
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FP);
    f86c:	41f7d313          	sra	t1,a5,0x1f
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FP);
    f870:	02d696b3          	mulh	a3,a3,a3

0000f874 <.LVL172>:
    f874:	00c65613          	srl	a2,a2,0xc
    f878:	01469693          	sll	a3,a3,0x14
    f87c:	00c6e6b3          	or	a3,a3,a2

0000f880 <.LVL173>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FP);
    f880:	02f78e33          	mul	t3,a5,a5
    f884:	02f79633          	mulh	a2,a5,a5

0000f888 <.LVL174>:
    f888:	00ce5e13          	srl	t3,t3,0xc
    f88c:	01461613          	sll	a2,a2,0x14
    f890:	01c66633          	or	a2,a2,t3

0000f894 <.LVL175>:
                if (zr2+zi2 > ESCAPE) break;
    f894:	00c68e33          	add	t3,a3,a2

0000f898 <.LVL176>:
    f898:	f5cc5ce3          	bge	s8,t3,f7f0 <.L66>

0000f89c <.LBB102>:
                hsv2rgb((float)iter/MAXITER, 0.9f, 1.0f, &r,&g,&b);
    f89c:	c71f10ef          	jal	150c <__floatsisf>

0000f8a0 <.LVL177>:
    f8a0:	00002797          	auipc	a5,0x2
    f8a4:	68478793          	add	a5,a5,1668 # 11f24 <.LC14>
    f8a8:	0007a583          	lw	a1,0(a5)
    f8ac:	90cf10ef          	jal	9b8 <__divsf3>

0000f8b0 <.LVL178>:
    f8b0:	00002617          	auipc	a2,0x2
    f8b4:	65c60613          	add	a2,a2,1628 # 11f0c <.LC2>
    f8b8:	00002597          	auipc	a1,0x2
    f8bc:	66858593          	add	a1,a1,1640 # 11f20 <.LC13>
    f8c0:	01012703          	lw	a4,16(sp)
    f8c4:	00062603          	lw	a2,0(a2)
    f8c8:	00812783          	lw	a5,8(sp)
    f8cc:	0005a583          	lw	a1,0(a1)
    f8d0:	02f10693          	add	a3,sp,47
    f8d4:	871ff0ef          	jal	f144 <hsv2rgb>

0000f8d8 <.LVL179>:
                pset(px, py, r, g, b);
    f8d8:	05014703          	lbu	a4,80(sp)
    f8dc:	03014683          	lbu	a3,48(sp)
    f8e0:	02f14603          	lbu	a2,47(sp)
    f8e4:	f51ff06f          	j	f834 <.L123>

0000f8e8 <.L109>:
        int32_t cim = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
    f8e8:	fffffab7          	lui	s5,0xfffff

0000f8ec <.LBB106>:
            int32_t cre = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
    f8ec:	ffffeb37          	lui	s6,0xffffe

0000f8f0 <.LBE106>:
    switch (pat) {
    f8f0:	00000913          	li	s2,0
    f8f4:	00000a13          	li	s4,0
    f8f8:	00000413          	li	s0,0

0000f8fc <.LBB113>:
        int32_t cim = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
    f8fc:	c00a8a93          	add	s5,s5,-1024 # ffffec00 <_ebss+0xfffe8d10>

0000f900 <.LBB107>:
            int32_t cre = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
    f900:	800b0b13          	add	s6,s6,-2048 # ffffd800 <_ebss+0xfffe7910>
    f904:	eadff06f          	j	f7b0 <.L58>

0000f908 <.L57>:
    sin_tab_init();
    f908:	9e1ff0ef          	jal	f2e8 <sin_tab_init>

0000f90c <.LBB119>:
    for (int y = 0; y < g_h; y++)
    f90c:	00000a93          	li	s5,0

0000f910 <.LBB120>:
            hsv2rgb((float)v / 762.0f, 1.0f, 1.0f, &r,&g,&bl);
    f910:	05010493          	add	s1,sp,80
    f914:	03010913          	add	s2,sp,48
    f918:	02f10993          	add	s3,sp,47
    f91c:	00002a17          	auipc	s4,0x2
    f920:	60ca2a03          	lw	s4,1548(s4) # 11f28 <.LC15>

0000f924 <.L72>:
    for (int y = 0; y < g_h; y++)
    f924:	d1aad8e3          	bge	s5,s10,f634 <.L61>
    f928:	001a9b93          	sll	s7,s5,0x1
    f92c:	00300c93          	li	s9,3
    f930:	039a8cb3          	mul	s9,s5,s9
    f934:	080b8b93          	add	s7,s7,128

0000f938 <.LBB123>:
        for (int x = 0; x < g_w; x++) {
    f938:	00000b13          	li	s6,0

0000f93c <.LBB122>:
            int v = (int)sin_tab[a] + (int)sin_tab[b] + (int)sin_tab[c] + 381;
    f93c:	00006c17          	auipc	s8,0x6
    f940:	440c0c13          	add	s8,s8,1088 # 15d7c <sin_tab>
            int a = (x*3 + y)     & 255;
    f944:	00300413          	li	s0,3
    f948:	08c0006f          	j	f9d4 <.L74>

0000f94c <.L73>:
    f94c:	028b07b3          	mul	a5,s6,s0
    f950:	015787b3          	add	a5,a5,s5
    f954:	0ff7f793          	zext.b	a5,a5
            int v = (int)sin_tab[a] + (int)sin_tab[b] + (int)sin_tab[c] + 381;
    f958:	00fc07b3          	add	a5,s8,a5
    f95c:	00078503          	lb	a0,0(a5)
            int b = (x   + y*3)   & 255;
    f960:	016c87b3          	add	a5,s9,s6

0000f964 <.LVL184>:
    f964:	0ff7f793          	zext.b	a5,a5

0000f968 <.LVL185>:
            int v = (int)sin_tab[a] + (int)sin_tab[b] + (int)sin_tab[c] + 381;
    f968:	00fc07b3          	add	a5,s8,a5
    f96c:	00078783          	lb	a5,0(a5)
    f970:	00f50533          	add	a0,a0,a5
            int c = (x*2 + y*2+128) & 255;
    f974:	0ffbf793          	zext.b	a5,s7

0000f978 <.LVL186>:
            int v = (int)sin_tab[a] + (int)sin_tab[b] + (int)sin_tab[c] + 381;
    f978:	00fc07b3          	add	a5,s8,a5

0000f97c <.LVL187>:
    f97c:	00078783          	lb	a5,0(a5)
    f980:	002b8b93          	add	s7,s7,2

0000f984 <.LVL188>:
    f984:	00f50533          	add	a0,a0,a5
            hsv2rgb((float)v / 762.0f, 1.0f, 1.0f, &r,&g,&bl);
    f988:	17d50513          	add	a0,a0,381
    f98c:	b81f10ef          	jal	150c <__floatsisf>

0000f990 <.LVL189>:
    f990:	000a0593          	mv	a1,s4
    f994:	824f10ef          	jal	9b8 <__divsf3>

0000f998 <.LVL190>:
    f998:	00002617          	auipc	a2,0x2
    f99c:	57460613          	add	a2,a2,1396 # 11f0c <.LC2>
    f9a0:	00062603          	lw	a2,0(a2)
    f9a4:	00048793          	mv	a5,s1
    f9a8:	00090713          	mv	a4,s2
    f9ac:	00060593          	mv	a1,a2
    f9b0:	00098693          	mv	a3,s3
    f9b4:	f90ff0ef          	jal	f144 <hsv2rgb>

0000f9b8 <.LVL191>:
            pset(x, y, r, g, bl);
    f9b8:	05014703          	lbu	a4,80(sp)
    f9bc:	03014683          	lbu	a3,48(sp)
    f9c0:	02f14603          	lbu	a2,47(sp)
    f9c4:	000b0513          	mv	a0,s6
    f9c8:	000a8593          	mv	a1,s5
    f9cc:	d64ff0ef          	jal	ef30 <pset>

0000f9d0 <.LBE122>:
        for (int x = 0; x < g_w; x++) {
    f9d0:	001b0b13          	add	s6,s6,1

0000f9d4 <.L74>:
    f9d4:	f7bb4ce3          	blt	s6,s11,f94c <.L73>

0000f9d8 <.LBE123>:
    for (int y = 0; y < g_h; y++)
    f9d8:	001a8a93          	add	s5,s5,1
    f9dc:	f49ff06f          	j	f924 <.L72>

0000f9e0 <.L56>:
    clear();
    f9e0:	e20ff0ef          	jal	f000 <clear>

0000f9e4 <.LBB126>:
        px[i] = (int)(x1*proj) + g_w/2;
    f9e4:	00200793          	li	a5,2
    f9e8:	02fdcc33          	div	s8,s11,a5
    f9ec:	00002a97          	auipc	s5,0x2
    f9f0:	3fca8a93          	add	s5,s5,1020 # 11de8 <vraw.3>
        py[i] = (int)(y2*proj) + g_h/2;
    f9f4:	00000993          	li	s3,0
        px[i] = (int)(x1*proj) + g_w/2;
    f9f8:	03010c93          	add	s9,sp,48
        py[i] = (int)(y2*proj) + g_h/2;
    f9fc:	05010b93          	add	s7,sp,80

0000fa00 <.LBE127>:
    for (int i = 0; i < 8; i++) {
    fa00:	02000493          	li	s1,32

0000fa04 <.LBB128>:
        py[i] = (int)(y2*proj) + g_h/2;
    fa04:	02fd4b33          	div	s6,s10,a5

0000fa08 <.L75>:
        float x = vraw[i][0], y = vraw[i][1], z = vraw[i][2];
    fa08:	004aa783          	lw	a5,4(s5)
    fa0c:	000aa903          	lw	s2,0(s5)

0000fa10 <.LVL198>:
    fa10:	008aaa03          	lw	s4,8(s5)
    fa14:	00f12423          	sw	a5,8(sp)

0000fa18 <.LVL199>:
        float z1 =  x*sy + z*cy;
    fa18:	00002797          	auipc	a5,0x2
    fa1c:	51478793          	add	a5,a5,1300 # 11f2c <.LC16>

0000fa20 <.LVL200>:
    fa20:	0007a583          	lw	a1,0(a5)
    fa24:	00090513          	mv	a0,s2

0000fa28 <.LBE128>:
    for (int i = 0; i < 8; i++) {
    fa28:	00ca8a93          	add	s5,s5,12

0000fa2c <.LBB129>:
        float z1 =  x*sy + z*cy;
    fa2c:	abcf10ef          	jal	ce8 <__mulsf3>

0000fa30 <.LVL201>:
    fa30:	00002717          	auipc	a4,0x2
    fa34:	50070713          	add	a4,a4,1280 # 11f30 <.LC17>
    fa38:	00072583          	lw	a1,0(a4)
    fa3c:	00050413          	mv	s0,a0
    fa40:	000a0513          	mv	a0,s4
    fa44:	aa4f10ef          	jal	ce8 <__mulsf3>

0000fa48 <.LVL202>:
    fa48:	00050593          	mv	a1,a0
    fa4c:	00040513          	mv	a0,s0
    fa50:	b49f00ef          	jal	598 <__addsf3>

0000fa54 <.LVL203>:
        float z2 =  y*sx + z1*cx;
    fa54:	00002697          	auipc	a3,0x2
    fa58:	4e068693          	add	a3,a3,1248 # 11f34 <.LC18>
    fa5c:	0006a583          	lw	a1,0(a3)
        float z1 =  x*sy + z*cy;
    fa60:	00a12823          	sw	a0,16(sp)

0000fa64 <.LVL204>:
        float z2 =  y*sx + z1*cx;
    fa64:	00812503          	lw	a0,8(sp)

0000fa68 <.LVL205>:
    fa68:	a80f10ef          	jal	ce8 <__mulsf3>

0000fa6c <.LVL206>:
    fa6c:	00002617          	auipc	a2,0x2
    fa70:	4cc60613          	add	a2,a2,1228 # 11f38 <.LC19>
    fa74:	00062583          	lw	a1,0(a2)
    fa78:	00050413          	mv	s0,a0
    fa7c:	01012503          	lw	a0,16(sp)
    fa80:	a68f10ef          	jal	ce8 <__mulsf3>

0000fa84 <.LVL207>:
    fa84:	00050593          	mv	a1,a0
    fa88:	00040513          	mv	a0,s0
    fa8c:	b0df00ef          	jal	598 <__addsf3>

0000fa90 <.LVL208>:
        float proj = fov / (dist + z2);
    fa90:	00002597          	auipc	a1,0x2
    fa94:	4ac58593          	add	a1,a1,1196 # 11f3c <.LC20>
    fa98:	0005a583          	lw	a1,0(a1)
        px[i] = (int)(x1*proj) + g_w/2;
    fa9c:	013c8433          	add	s0,s9,s3
        float proj = fov / (dist + z2);
    faa0:	af9f00ef          	jal	598 <__addsf3>

0000faa4 <.LVL209>:
    faa4:	00050593          	mv	a1,a0
    faa8:	00002517          	auipc	a0,0x2
    faac:	49850513          	add	a0,a0,1176 # 11f40 <.LC21>
    fab0:	00052503          	lw	a0,0(a0)
    fab4:	f05f00ef          	jal	9b8 <__divsf3>

0000fab8 <.LVL210>:
        float x1 =  x*cy - z*sy;
    fab8:	00002717          	auipc	a4,0x2
    fabc:	47870713          	add	a4,a4,1144 # 11f30 <.LC17>
    fac0:	00072583          	lw	a1,0(a4)
        float proj = fov / (dist + z2);
    fac4:	00a12a23          	sw	a0,20(sp)

0000fac8 <.LVL211>:
        float x1 =  x*cy - z*sy;
    fac8:	00090513          	mv	a0,s2

0000facc <.LVL212>:
    facc:	a1cf10ef          	jal	ce8 <__mulsf3>

0000fad0 <.LVL213>:
    fad0:	00002797          	auipc	a5,0x2
    fad4:	45c78793          	add	a5,a5,1116 # 11f2c <.LC16>
    fad8:	0007a583          	lw	a1,0(a5)
    fadc:	00050913          	mv	s2,a0

0000fae0 <.LVL214>:
    fae0:	000a0513          	mv	a0,s4
    fae4:	a04f10ef          	jal	ce8 <__mulsf3>

0000fae8 <.LVL215>:
    fae8:	00050593          	mv	a1,a0
    faec:	00090513          	mv	a0,s2
    faf0:	d14f10ef          	jal	1004 <__subsf3>

0000faf4 <.LVL216>:
        px[i] = (int)(x1*proj) + g_w/2;
    faf4:	01412583          	lw	a1,20(sp)
        py[i] = (int)(y2*proj) + g_h/2;
    faf8:	013b8a33          	add	s4,s7,s3

0000fafc <.LBE129>:
    for (int i = 0; i < 8; i++) {
    fafc:	00498993          	add	s3,s3,4

0000fb00 <.LBB130>:
        px[i] = (int)(x1*proj) + g_w/2;
    fb00:	9e8f10ef          	jal	ce8 <__mulsf3>

0000fb04 <.LVL218>:
    fb04:	931f10ef          	jal	1434 <__fixsfsi>

0000fb08 <.LVL219>:
        float y2 =  y*cx - z1*sx;
    fb08:	00002617          	auipc	a2,0x2
    fb0c:	43060613          	add	a2,a2,1072 # 11f38 <.LC19>
        px[i] = (int)(x1*proj) + g_w/2;
    fb10:	01850533          	add	a0,a0,s8
        float y2 =  y*cx - z1*sx;
    fb14:	00062583          	lw	a1,0(a2)
        px[i] = (int)(x1*proj) + g_w/2;
    fb18:	00a42023          	sw	a0,0(s0)
        float y2 =  y*cx - z1*sx;
    fb1c:	00812503          	lw	a0,8(sp)
    fb20:	9c8f10ef          	jal	ce8 <__mulsf3>

0000fb24 <.LVL220>:
    fb24:	00002697          	auipc	a3,0x2
    fb28:	41068693          	add	a3,a3,1040 # 11f34 <.LC18>
    fb2c:	0006a583          	lw	a1,0(a3)
    fb30:	00050913          	mv	s2,a0
    fb34:	01012503          	lw	a0,16(sp)
    fb38:	9b0f10ef          	jal	ce8 <__mulsf3>

0000fb3c <.LVL221>:
    fb3c:	00050593          	mv	a1,a0
    fb40:	00090513          	mv	a0,s2
    fb44:	cc0f10ef          	jal	1004 <__subsf3>

0000fb48 <.LVL222>:
        py[i] = (int)(y2*proj) + g_h/2;
    fb48:	01412583          	lw	a1,20(sp)
    fb4c:	99cf10ef          	jal	ce8 <__mulsf3>

0000fb50 <.LVL223>:
    fb50:	8e5f10ef          	jal	1434 <__fixsfsi>

0000fb54 <.LVL224>:
    fb54:	01650533          	add	a0,a0,s6
    fb58:	00aa2023          	sw	a0,0(s4)

0000fb5c <.LBE130>:
    for (int i = 0; i < 8; i++) {
    fb5c:	ea9996e3          	bne	s3,s1,fa08 <.L75>
    fb60:	00002a97          	auipc	s5,0x2
    fb64:	228a8a93          	add	s5,s5,552 # 11d88 <edges.2>
    fb68:	00002417          	auipc	s0,0x2
    fb6c:	1fc40413          	add	s0,s0,508 # 11d64 <ecol.1>
    fb70:	00002b17          	auipc	s6,0x2
    fb74:	218b0b13          	add	s6,s6,536 # 11d88 <edges.2>

0000fb78 <.L76>:
        int a = edges[i][0], b = edges[i][1];
    fb78:	000aa703          	lw	a4,0(s5)

0000fb7c <.LVL226>:
    fb7c:	004aa783          	lw	a5,4(s5)

0000fb80 <.LVL227>:
        draw_line(px[a],   py[a],   px[b],   py[b],   ecol[i][0],ecol[i][1],ecol[i][2]);
    fb80:	02010693          	add	a3,sp,32
    fb84:	00271713          	sll	a4,a4,0x2

0000fb88 <.LVL228>:
    fb88:	00279793          	sll	a5,a5,0x2

0000fb8c <.LVL229>:
    fb8c:	0f070713          	add	a4,a4,240
    fb90:	0f078793          	add	a5,a5,240
    fb94:	00d70733          	add	a4,a4,a3
    fb98:	00d787b3          	add	a5,a5,a3
    fb9c:	f2072483          	lw	s1,-224(a4)
    fba0:	f4072a03          	lw	s4,-192(a4)
    fba4:	f207a903          	lw	s2,-224(a5)
    fba8:	f407a983          	lw	s3,-192(a5)
    fbac:	00044703          	lbu	a4,0(s0)
    fbb0:	00144783          	lbu	a5,1(s0)
    fbb4:	00244803          	lbu	a6,2(s0)
    fbb8:	00098693          	mv	a3,s3
    fbbc:	00090613          	mv	a2,s2
    fbc0:	000a0593          	mv	a1,s4
    fbc4:	00048513          	mv	a0,s1
    fbc8:	01012a23          	sw	a6,20(sp)
    fbcc:	00f12823          	sw	a5,16(sp)
    fbd0:	00e12423          	sw	a4,8(sp)
    fbd4:	c54ff0ef          	jal	f028 <draw_line>

0000fbd8 <.LVL230>:
        draw_line(px[a]+1, py[a],   px[b]+1, py[b],   ecol[i][0],ecol[i][1],ecol[i][2]);
    fbd8:	01412803          	lw	a6,20(sp)
    fbdc:	01012783          	lw	a5,16(sp)
    fbe0:	00812703          	lw	a4,8(sp)
    fbe4:	00098693          	mv	a3,s3
    fbe8:	00190613          	add	a2,s2,1
    fbec:	000a0593          	mv	a1,s4
    fbf0:	00148513          	add	a0,s1,1
    fbf4:	c34ff0ef          	jal	f028 <draw_line>

0000fbf8 <.LVL231>:
        draw_line(px[a],   py[a]+1, px[b],   py[b]+1, ecol[i][0],ecol[i][1],ecol[i][2]);
    fbf8:	01412803          	lw	a6,20(sp)
    fbfc:	01012783          	lw	a5,16(sp)
    fc00:	00812703          	lw	a4,8(sp)
    fc04:	00198693          	add	a3,s3,1
    fc08:	00090613          	mv	a2,s2
    fc0c:	001a0593          	add	a1,s4,1
    fc10:	00048513          	mv	a0,s1

0000fc14 <.LBE132>:
    for (int i = 0; i < 12; i++) {
    fc14:	00340413          	add	s0,s0,3

0000fc18 <.LBB133>:
        draw_line(px[a],   py[a]+1, px[b],   py[b]+1, ecol[i][0],ecol[i][1],ecol[i][2]);
    fc18:	c10ff0ef          	jal	f028 <draw_line>

0000fc1c <.LBE133>:
    for (int i = 0; i < 12; i++) {
    fc1c:	008a8a93          	add	s5,s5,8
    fc20:	f5641ce3          	bne	s0,s6,fb78 <.L76>
    fc24:	a11ff06f          	j	f634 <.L61>

0000fc28 <.L55>:
    int cx = g_w/2, cy = g_h/2;
    fc28:	00200c13          	li	s8,2
    fc2c:	038dc433          	div	s0,s11,s8

0000fc30 <.LBB136>:
    for (int y = 0; y < g_h; y++)
    fc30:	00000b13          	li	s6,0

0000fc34 <.LBB137>:
            hsv2rgb((float)(dist % 48) / 48.0f, 1.0f, 1.0f, &r,&g,&b);
    fc34:	05010493          	add	s1,sp,80
    fc38:	03010913          	add	s2,sp,48
    fc3c:	02f10993          	add	s3,sp,47
    fc40:	00002a17          	auipc	s4,0x2
    fc44:	304a2a03          	lw	s4,772(s4) # 11f44 <.LC22>

0000fc48 <.LBE136>:
    int cx = g_w/2, cy = g_h/2;
    fc48:	038d4c33          	div	s8,s10,s8

0000fc4c <.L77>:
    for (int y = 0; y < g_h; y++)
    fc4c:	9fab54e3          	bge	s6,s10,f634 <.L61>

0000fc50 <.LBB147>:
            int dx = x-cx, dy = y-cy;
    fc50:	418b0bb3          	sub	s7,s6,s8

0000fc54 <.LBE147>:
        for (int x = 0; x < g_w; x++) {
    fc54:	00000a93          	li	s5,0

0000fc58 <.LBB139>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    fc58:	00200c93          	li	s9,2

0000fc5c <.LBE139>:
            int dist = isqrt(dx*dx + dy*dy);
    fc5c:	037b8bb3          	mul	s7,s7,s7
    fc60:	0780006f          	j	fcd8 <.L82>

0000fc64 <.L81>:
            int dx = x-cx, dy = y-cy;
    fc64:	408a87b3          	sub	a5,s5,s0

0000fc68 <.LVL237>:
            int dist = isqrt(dx*dx + dy*dy);
    fc68:	02f787b3          	mul	a5,a5,a5

0000fc6c <.LBB144>:
    if (n <= 0) return 0;
    fc6c:	00000693          	li	a3,0

0000fc70 <.LBE144>:
            int dist = isqrt(dx*dx + dy*dy);
    fc70:	017787b3          	add	a5,a5,s7

0000fc74 <.LBB145>:
    if (n <= 0) return 0;
    fc74:	00078a63          	beqz	a5,fc88 <.L78>

0000fc78 <.LVL240>:
    int x = n, y = (x+1)/2;
    fc78:	00178713          	add	a4,a5,1
    fc7c:	40175713          	sra	a4,a4,0x1

0000fc80 <.LVL241>:
    fc80:	00078693          	mv	a3,a5

0000fc84 <.L79>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    fc84:	06d74063          	blt	a4,a3,fce4 <.L80>

0000fc88 <.L78>:
            hsv2rgb((float)(dist % 48) / 48.0f, 1.0f, 1.0f, &r,&g,&b);
    fc88:	03000513          	li	a0,48
    fc8c:	02a6e533          	rem	a0,a3,a0
    fc90:	87df10ef          	jal	150c <__floatsisf>

0000fc94 <.LVL244>:
    fc94:	000a0593          	mv	a1,s4
    fc98:	d21f00ef          	jal	9b8 <__divsf3>

0000fc9c <.LVL245>:
    fc9c:	00002617          	auipc	a2,0x2
    fca0:	27060613          	add	a2,a2,624 # 11f0c <.LC2>
    fca4:	00062603          	lw	a2,0(a2)
    fca8:	00048793          	mv	a5,s1
    fcac:	00090713          	mv	a4,s2
    fcb0:	00060593          	mv	a1,a2
    fcb4:	00098693          	mv	a3,s3
    fcb8:	c8cff0ef          	jal	f144 <hsv2rgb>

0000fcbc <.LVL246>:
            pset(x, y, r, g, b);
    fcbc:	05014703          	lbu	a4,80(sp)
    fcc0:	03014683          	lbu	a3,48(sp)
    fcc4:	02f14603          	lbu	a2,47(sp)
    fcc8:	000a8513          	mv	a0,s5
    fccc:	000b0593          	mv	a1,s6
    fcd0:	a60ff0ef          	jal	ef30 <pset>

0000fcd4 <.LBE148>:
        for (int x = 0; x < g_w; x++) {
    fcd4:	001a8a93          	add	s5,s5,1

0000fcd8 <.L82>:
    fcd8:	f9bac6e3          	blt	s5,s11,fc64 <.L81>

0000fcdc <.LBE150>:
    for (int y = 0; y < g_h; y++)
    fcdc:	001b0b13          	add	s6,s6,1
    fce0:	f6dff06f          	j	fc4c <.L77>

0000fce4 <.L80>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    fce4:	02e7c633          	div	a2,a5,a4
    fce8:	00070693          	mv	a3,a4
    fcec:	00e60633          	add	a2,a2,a4

0000fcf0 <.LVL251>:
    fcf0:	03964733          	div	a4,a2,s9

0000fcf4 <.LVL252>:
    fcf4:	f91ff06f          	j	fc84 <.L79>

0000fcf8 <.L54>:
    int cx = g_w/2, cy = g_h/2;
    fcf8:	00200813          	li	a6,2
    fcfc:	030dcbb3          	div	s7,s11,a6

0000fd00 <.LVL254>:
    fd00:	030d4c33          	div	s8,s10,a6

0000fd04 <.LVL255>:
    int maxr = (cx < cy ? cx : cy);
    fd04:	000b8493          	mv	s1,s7
    fd08:	017c5463          	bge	s8,s7,fd10 <.L83>
    fd0c:	000c0493          	mv	s1,s8

0000fd10 <.L83>:
            hsv2rgb(hue, sat, 1.0f, &rv,&gv,&bv);
    fd10:	05010793          	add	a5,sp,80
    fd14:	00f12a23          	sw	a5,20(sp)
    fd18:	03010793          	add	a5,sp,48
    fd1c:	41800a33          	neg	s4,s8
    fd20:	00f12c23          	sw	a5,24(sp)
    fd24:	00002c97          	auipc	s9,0x2
    fd28:	1e8cac83          	lw	s9,488(s9) # 11f0c <.LC2>

0000fd2c <.L84>:
    fd2c:	018a0933          	add	s2,s4,s8

0000fd30 <.LBE156>:
    for (int y = 0; y < g_h; y++)
    fd30:	91a952e3          	bge	s2,s10,f634 <.L61>

0000fd34 <.LBB166>:
            hsv2rgb(hue, sat, 1.0f, &rv,&gv,&bv);
    fd34:	02f10793          	add	a5,sp,47
            int r = isqrt(dx*dx + dy*dy);
    fd38:	034a0b33          	mul	s6,s4,s4

0000fd3c <.LBE166>:
        for (int x = 0; x < g_w; x++) {
    fd3c:	00000413          	li	s0,0

0000fd40 <.LBB158>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    fd40:	00200a93          	li	s5,2

0000fd44 <.LBE158>:
            hsv2rgb(hue, sat, 1.0f, &rv,&gv,&bv);
    fd44:	00f12823          	sw	a5,16(sp)
    fd48:	0480006f          	j	fd90 <.L91>

0000fd4c <.L90>:
            int dx = x-cx, dy = y-cy;
    fd4c:	41740533          	sub	a0,s0,s7

0000fd50 <.LVL260>:
            int r = isqrt(dx*dx + dy*dy);
    fd50:	02a50733          	mul	a4,a0,a0

0000fd54 <.LBB163>:
    if (n <= 0) return 0;
    fd54:	00000993          	li	s3,0

0000fd58 <.LBE163>:
            int r = isqrt(dx*dx + dy*dy);
    fd58:	01670733          	add	a4,a4,s6

0000fd5c <.LBB164>:
    if (n <= 0) return 0;
    fd5c:	00070a63          	beqz	a4,fd70 <.L85>

0000fd60 <.LVL262>:
    int x = n, y = (x+1)/2;
    fd60:	00170793          	add	a5,a4,1
    fd64:	4017d793          	sra	a5,a5,0x1

0000fd68 <.LVL263>:
    fd68:	00070993          	mv	s3,a4

0000fd6c <.L86>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    fd6c:	0337c863          	blt	a5,s3,fd9c <.L87>

0000fd70 <.L85>:
            if (r > maxr) { pset(x,y, 0,0,0); continue; }
    fd70:	0534d063          	bge	s1,s3,fdb0 <.L88>
    fd74:	00000713          	li	a4,0
    fd78:	00000693          	li	a3,0
    fd7c:	00000613          	li	a2,0

0000fd80 <.L124>:
            pset(x, y, rv, gv, bv);
    fd80:	00040513          	mv	a0,s0
    fd84:	00090593          	mv	a1,s2
    fd88:	9a8ff0ef          	jal	ef30 <pset>

0000fd8c <.LBE167>:
        for (int x = 0; x < g_w; x++) {
    fd8c:	00140413          	add	s0,s0,1

0000fd90 <.L91>:
    fd90:	fbb44ee3          	blt	s0,s11,fd4c <.L90>

0000fd94 <.LBE169>:
    for (int y = 0; y < g_h; y++)
    fd94:	001a0a13          	add	s4,s4,1

0000fd98 <.LVL270>:
    fd98:	f95ff06f          	j	fd2c <.L84>

0000fd9c <.L87>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    fd9c:	02f746b3          	div	a3,a4,a5
    fda0:	00078993          	mv	s3,a5
    fda4:	00f686b3          	add	a3,a3,a5

0000fda8 <.LVL272>:
    fda8:	0356c7b3          	div	a5,a3,s5

0000fdac <.LVL273>:
    fdac:	fc1ff06f          	j	fd6c <.L86>

0000fdb0 <.L88>:
            float hue = (atan2f((float)dy, (float)dx) + PI) / (2.0f*PI);
    fdb0:	f5cf10ef          	jal	150c <__floatsisf>

0000fdb4 <.LVL275>:
    fdb4:	00a12423          	sw	a0,8(sp)
    fdb8:	000a0513          	mv	a0,s4
    fdbc:	f50f10ef          	jal	150c <__floatsisf>

0000fdc0 <.LVL276>:
    fdc0:	00812583          	lw	a1,8(sp)
    fdc4:	a74f40ef          	jal	4038 <atan2f>

0000fdc8 <.LVL277>:
    fdc8:	00a12423          	sw	a0,8(sp)

0000fdcc <.LVL278>:
            float sat = (float)r / maxr;
    fdcc:	00098513          	mv	a0,s3

0000fdd0 <.LVL279>:
    fdd0:	f3cf10ef          	jal	150c <__floatsisf>

0000fdd4 <.LVL280>:
    fdd4:	00050993          	mv	s3,a0

0000fdd8 <.LVL281>:
    fdd8:	00048513          	mv	a0,s1
    fddc:	f30f10ef          	jal	150c <__floatsisf>

0000fde0 <.LVL282>:
    fde0:	00050593          	mv	a1,a0
    fde4:	00098513          	mv	a0,s3
    fde8:	bd1f00ef          	jal	9b8 <__divsf3>

0000fdec <.LVL283>:
            float hue = (atan2f((float)dy, (float)dx) + PI) / (2.0f*PI);
    fdec:	00002797          	auipc	a5,0x2
    fdf0:	12878793          	add	a5,a5,296 # 11f14 <.LC4>
    fdf4:	0007a583          	lw	a1,0(a5)
            float sat = (float)r / maxr;
    fdf8:	00050993          	mv	s3,a0
            float hue = (atan2f((float)dy, (float)dx) + PI) / (2.0f*PI);
    fdfc:	00812503          	lw	a0,8(sp)
    fe00:	f98f00ef          	jal	598 <__addsf3>

0000fe04 <.LVL284>:
    fe04:	00002797          	auipc	a5,0x2
    fe08:	14478793          	add	a5,a5,324 # 11f48 <.LC23>
    fe0c:	0007a583          	lw	a1,0(a5)
    fe10:	ba9f00ef          	jal	9b8 <__divsf3>

0000fe14 <.LVL285>:
            hsv2rgb(hue, sat, 1.0f, &rv,&gv,&bv);
    fe14:	01812703          	lw	a4,24(sp)
    fe18:	01012683          	lw	a3,16(sp)
    fe1c:	01412783          	lw	a5,20(sp)
    fe20:	000c8613          	mv	a2,s9
    fe24:	00098593          	mv	a1,s3
    fe28:	b1cff0ef          	jal	f144 <hsv2rgb>

0000fe2c <.LVL286>:
            pset(x, y, rv, gv, bv);
    fe2c:	05014703          	lbu	a4,80(sp)
    fe30:	03014683          	lbu	a3,48(sp)
    fe34:	02f14603          	lbu	a2,47(sp)
    fe38:	f49ff06f          	j	fd80 <.L124>

0000fe3c <.L92>:
    while (sz < g_h) sz <<= 1;
    fe3c:	00141413          	sll	s0,s0,0x1

0000fe40 <.L53>:
    fe40:	ffa44ee3          	blt	s0,s10,fe3c <.L92>

0000fe44 <.LBB173>:
                hsv2rgb((float)(row ^ col) / (float)sz, 1.0f, 1.0f, &r,&g,&b);
    fe44:	02f10793          	add	a5,sp,47

0000fe48 <.LBE174>:
    for (int y = 0; y < g_h; y++) {
    fe48:	00000493          	li	s1,0

0000fe4c <.LBB178>:
                hsv2rgb((float)(row ^ col) / (float)sz, 1.0f, 1.0f, &r,&g,&b);
    fe4c:	05010c13          	add	s8,sp,80
    fe50:	03010c93          	add	s9,sp,48
    fe54:	00f12823          	sw	a5,16(sp)
    fe58:	00002b97          	auipc	s7,0x2
    fe5c:	0b4bab83          	lw	s7,180(s7) # 11f0c <.LC2>

0000fe60 <.L93>:
    for (int y = 0; y < g_h; y++) {
    fe60:	fda4da63          	bge	s1,s10,f634 <.L61>

0000fe64 <.LBB188>:
        int row = (int)((int64_t)y * sz / g_h);
    fe64:	028495b3          	mulh	a1,s1,s0
    fe68:	000d0613          	mv	a2,s10
    fe6c:	00000693          	li	a3,0
    fe70:	41f45b13          	sra	s6,s0,0x1f

0000fe74 <.LBB184>:
        for (int x = 0; x < g_w; x++) {
    fe74:	00000a93          	li	s5,0
    fe78:	00000993          	li	s3,0
    fe7c:	00000913          	li	s2,0

0000fe80 <.LBE184>:
        int row = (int)((int64_t)y * sz / g_h);
    fe80:	02848533          	mul	a0,s1,s0
    fe84:	a9cf00ef          	jal	120 <__divdi3>

0000fe88 <.LVL290>:
    fe88:	00050a13          	mv	s4,a0

0000fe8c <.L94>:
        for (int x = 0; x < g_w; x++) {
    fe8c:	01b94a63          	blt	s2,s11,fea0 <.L97>

0000fe90 <.LBE185>:
    for (int y = 0; y < g_h; y++) {
    fe90:	00148493          	add	s1,s1,1
    fe94:	fcdff06f          	j	fe60 <.L93>

0000fe98 <.L110>:
    switch (pat) {
    fe98:	00100413          	li	s0,1
    fe9c:	fa5ff06f          	j	fe40 <.L53>

0000fea0 <.L97>:
            int col = (int)((int64_t)x * sz / g_w);
    fea0:	000d8613          	mv	a2,s11
    fea4:	00000693          	li	a3,0
    fea8:	000a8513          	mv	a0,s5
    feac:	00098593          	mv	a1,s3
    feb0:	a70f00ef          	jal	120 <__divdi3>

0000feb4 <.LVL295>:
            if ((row & col) == 0) {
    feb4:	00aa77b3          	and	a5,s4,a0
    feb8:	06079863          	bnez	a5,ff28 <.L95>

0000febc <.LBB179>:
                hsv2rgb((float)(row ^ col) / (float)sz, 1.0f, 1.0f, &r,&g,&b);
    febc:	00aa4533          	xor	a0,s4,a0

0000fec0 <.LVL296>:
    fec0:	e4cf10ef          	jal	150c <__floatsisf>

0000fec4 <.LVL297>:
    fec4:	00a12423          	sw	a0,8(sp)
    fec8:	00040513          	mv	a0,s0
    fecc:	e40f10ef          	jal	150c <__floatsisf>

0000fed0 <.LVL298>:
    fed0:	00050593          	mv	a1,a0
    fed4:	00812503          	lw	a0,8(sp)
    fed8:	ae1f00ef          	jal	9b8 <__divsf3>

0000fedc <.LVL299>:
    fedc:	01012683          	lw	a3,16(sp)
    fee0:	000c8713          	mv	a4,s9
    fee4:	000b8613          	mv	a2,s7
    fee8:	000c0793          	mv	a5,s8
    feec:	000b8593          	mv	a1,s7
    fef0:	a54ff0ef          	jal	f144 <hsv2rgb>

0000fef4 <.LVL300>:
                pset(x, y, r, g, b);
    fef4:	05014703          	lbu	a4,80(sp)
    fef8:	03014683          	lbu	a3,48(sp)
    fefc:	02f14603          	lbu	a2,47(sp)

0000ff00 <.L125>:
                pset(x, y, 0, 0, 0);
    ff00:	00090513          	mv	a0,s2
    ff04:	00048593          	mv	a1,s1
    ff08:	828ff0ef          	jal	ef30 <pset>

0000ff0c <.LBE181>:
        for (int x = 0; x < g_w; x++) {
    ff0c:	008a87b3          	add	a5,s5,s0
    ff10:	0157b733          	sltu	a4,a5,s5
    ff14:	016989b3          	add	s3,s3,s6
    ff18:	00190913          	add	s2,s2,1
    ff1c:	00078a93          	mv	s5,a5
    ff20:	013709b3          	add	s3,a4,s3
    ff24:	f69ff06f          	j	fe8c <.L94>

0000ff28 <.L95>:
                pset(x, y, 0, 0, 0);
    ff28:	00000713          	li	a4,0
    ff2c:	00000693          	li	a3,0
    ff30:	00000613          	li	a2,0
    ff34:	fcdff06f          	j	ff00 <.L125>

0000ff38 <.L105>:
        int32_t im0 = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
    ff38:	000d0613          	mv	a2,s10
    ff3c:	00000693          	li	a3,0
    ff40:	00098513          	mv	a0,s3
    ff44:	000c8593          	mv	a1,s9
    ff48:	9d8f00ef          	jal	120 <__divdi3>

0000ff4c <.LVL305>:
    ff4c:	01550bb3          	add	s7,a0,s5

0000ff50 <.LBB197>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
    ff50:	41fbd793          	sra	a5,s7,0x1f
    ff54:	037b9433          	mulh	s0,s7,s7
    ff58:	00f12823          	sw	a5,16(sp)
                zi = (int32_t)(((int64_t)zr*zi) >> (FPJ-1)) + cim;
    ff5c:	00001c37          	lui	s8,0x1

0000ff60 <.LBE198>:
        for (int px = 0; px < g_w; px++) {
    ff60:	00000a13          	li	s4,0
    ff64:	00012423          	sw	zero,8(sp)
    ff68:	00000913          	li	s2,0

0000ff6c <.LBB200>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FPJ-1)) + cim;
    ff6c:	999c0c13          	add	s8,s8,-1639 # 999 <.LVL124+0x1>
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
    ff70:	037b87b3          	mul	a5,s7,s7
    ff74:	01441413          	sll	s0,s0,0x14
    ff78:	00c7d793          	srl	a5,a5,0xc
    ff7c:	00f46433          	or	s0,s0,a5

0000ff80 <.LBB201>:
                hsv2rgb((float)iter/MAXITER, 1.0f, 0.9f, &r,&g,&b);
    ff80:	05010793          	add	a5,sp,80
    ff84:	00f12a23          	sw	a5,20(sp)
    ff88:	03010793          	add	a5,sp,48
    ff8c:	00f12c23          	sw	a5,24(sp)
    ff90:	02f10793          	add	a5,sp,47
    ff94:	00f12e23          	sw	a5,28(sp)

0000ff98 <.L99>:
        for (int px = 0; px < g_w; px++) {
    ff98:	03b94463          	blt	s2,s11,ffc0 <.L104>

0000ff9c <.LBE196>:
    for (int py = 0; py < g_h; py++) {
    ff9c:	000027b7          	lui	a5,0x2
    ffa0:	ccc78793          	add	a5,a5,-820 # 1ccc <.L34+0x10>
    ffa4:	00f987b3          	add	a5,s3,a5
    ffa8:	0137b733          	sltu	a4,a5,s3
    ffac:	00148493          	add	s1,s1,1
    ffb0:	00078993          	mv	s3,a5
    ffb4:	01970cb3          	add	s9,a4,s9

0000ffb8 <.L52>:
    ffb8:	f9a4c0e3          	blt	s1,s10,ff38 <.L105>
    ffbc:	e78ff06f          	j	f634 <.L61>

0000ffc0 <.L104>:
            int32_t zr = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
    ffc0:	00812583          	lw	a1,8(sp)
    ffc4:	000d8613          	mv	a2,s11
    ffc8:	00000693          	li	a3,0
    ffcc:	000a0513          	mv	a0,s4
    ffd0:	950f00ef          	jal	120 <__divdi3>

0000ffd4 <.LVL311>:
    ffd4:	016507b3          	add	a5,a0,s6

0000ffd8 <.LBB202>:
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FPJ);
    ffd8:	02f786b3          	mul	a3,a5,a5
    ffdc:	41f7d613          	sra	a2,a5,0x1f
    ffe0:	02f79733          	mulh	a4,a5,a5
    ffe4:	00c6d693          	srl	a3,a3,0xc
    ffe8:	01471713          	sll	a4,a4,0x14
    ffec:	00d76733          	or	a4,a4,a3

0000fff0 <.LVL313>:
                if (zr2+zi2 > ESCAPE) break;
    fff0:	008705b3          	add	a1,a4,s0
    fff4:	000046b7          	lui	a3,0x4

0000fff8 <.LVL314>:
    fff8:	10b6ce63          	blt	a3,a1,10114 <.L115>
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
    fffc:	01012e03          	lw	t3,16(sp)
   10000:	00040593          	mv	a1,s0
   10004:	000b8693          	mv	a3,s7

00010008 <.LBE202>:
            int iter = 0;
   10008:	00000513          	li	a0,0

0001000c <.LVL315>:
            while (iter < MAXITER) {
   1000c:	05000893          	li	a7,80

00010010 <.LBB203>:
                if (zr2+zi2 > ESCAPE) break;
   10010:	00004337          	lui	t1,0x4

00010014 <.L101>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FPJ-1)) + cim;
   10014:	02d60633          	mul	a2,a2,a3
                int32_t tmp = zr2 - zi2 + cre;
   10018:	40b70733          	sub	a4,a4,a1
                iter++;
   1001c:	00150513          	add	a0,a0,1

00010020 <.LVL317>:
                int32_t tmp = zr2 - zi2 + cre;
   10020:	99a70713          	add	a4,a4,-1638

00010024 <.LVL318>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FPJ-1)) + cim;
   10024:	02fe0e33          	mul	t3,t3,a5
   10028:	02d785b3          	mul	a1,a5,a3
   1002c:	01c60633          	add	a2,a2,t3
   10030:	02d7b7b3          	mulhu	a5,a5,a3
   10034:	00b5d693          	srl	a3,a1,0xb
   10038:	00f607b3          	add	a5,a2,a5
   1003c:	01579793          	sll	a5,a5,0x15
   10040:	00d7e6b3          	or	a3,a5,a3
   10044:	018686b3          	add	a3,a3,s8

00010048 <.LBE203>:
            while (iter < MAXITER) {
   10048:	05151263          	bne	a0,a7,1008c <.L102>
            if (iter == MAXITER) { pset(px,py, 0,0,0); }
   1004c:	00000713          	li	a4,0

00010050 <.LVL320>:
   10050:	00000693          	li	a3,0

00010054 <.LVL321>:
   10054:	00000613          	li	a2,0

00010058 <.L126>:
                pset(px, py, r, g, b);
   10058:	00090513          	mv	a0,s2
   1005c:	00048593          	mv	a1,s1
   10060:	ed1fe0ef          	jal	ef30 <pset>

00010064 <.LBE204>:
        for (int px = 0; px < g_w; px++) {
   10064:	000037b7          	lui	a5,0x3
   10068:	33278793          	add	a5,a5,818 # 3332 <__free_to_heap+0xa>
   1006c:	00fa07b3          	add	a5,s4,a5
   10070:	0147b733          	sltu	a4,a5,s4
   10074:	00078a13          	mv	s4,a5
   10078:	00812783          	lw	a5,8(sp)
   1007c:	00190913          	add	s2,s2,1
   10080:	00f707b3          	add	a5,a4,a5
   10084:	00f12423          	sw	a5,8(sp)
   10088:	f11ff06f          	j	ff98 <.L99>

0001008c <.L102>:
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FPJ);
   1008c:	02e705b3          	mul	a1,a4,a4
   10090:	00070793          	mv	a5,a4
   10094:	41f75613          	sra	a2,a4,0x1f
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
   10098:	41f6de13          	sra	t3,a3,0x1f
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FPJ);
   1009c:	02e71733          	mulh	a4,a4,a4

000100a0 <.LVL326>:
   100a0:	00c5d593          	srl	a1,a1,0xc
   100a4:	01471713          	sll	a4,a4,0x14
   100a8:	00b76733          	or	a4,a4,a1

000100ac <.LVL327>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
   100ac:	02d68eb3          	mul	t4,a3,a3
   100b0:	02d695b3          	mulh	a1,a3,a3

000100b4 <.LVL328>:
   100b4:	00cede93          	srl	t4,t4,0xc
   100b8:	01459593          	sll	a1,a1,0x14
   100bc:	01d5e5b3          	or	a1,a1,t4

000100c0 <.LVL329>:
                if (zr2+zi2 > ESCAPE) break;
   100c0:	00b70eb3          	add	t4,a4,a1

000100c4 <.LVL330>:
   100c4:	f5d358e3          	bge	t1,t4,10014 <.L101>

000100c8 <.L100>:
                hsv2rgb((float)iter/MAXITER, 1.0f, 0.9f, &r,&g,&b);
   100c8:	c44f10ef          	jal	150c <__floatsisf>

000100cc <.LVL332>:
   100cc:	00002797          	auipc	a5,0x2
   100d0:	e5878793          	add	a5,a5,-424 # 11f24 <.LC14>
   100d4:	0007a583          	lw	a1,0(a5)
   100d8:	8e1f00ef          	jal	9b8 <__divsf3>

000100dc <.LVL333>:
   100dc:	00002617          	auipc	a2,0x2
   100e0:	e4460613          	add	a2,a2,-444 # 11f20 <.LC13>
   100e4:	00002597          	auipc	a1,0x2
   100e8:	e2858593          	add	a1,a1,-472 # 11f0c <.LC2>
   100ec:	01812703          	lw	a4,24(sp)
   100f0:	01c12683          	lw	a3,28(sp)
   100f4:	00062603          	lw	a2,0(a2)
   100f8:	01412783          	lw	a5,20(sp)
   100fc:	0005a583          	lw	a1,0(a1)
   10100:	844ff0ef          	jal	f144 <hsv2rgb>

00010104 <.LVL334>:
                pset(px, py, r, g, b);
   10104:	05014703          	lbu	a4,80(sp)
   10108:	03014683          	lbu	a3,48(sp)
   1010c:	02f14603          	lbu	a2,47(sp)
   10110:	f49ff06f          	j	10058 <.L126>

00010114 <.L115>:
            int iter = 0;
   10114:	00000513          	li	a0,0

00010118 <.LVL336>:
   10118:	fb1ff06f          	j	100c8 <.L100>

0001011c <.L111>:
        int32_t im0 = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
   1011c:	fffffab7          	lui	s5,0xfffff

00010120 <.LBB210>:
            int32_t zr = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
   10120:	ffffeb37          	lui	s6,0xffffe

00010124 <.LBE193>:
    switch (pat) {
   10124:	00000993          	li	s3,0
   10128:	00000c93          	li	s9,0
   1012c:	00000493          	li	s1,0

00010130 <.LBB216>:
        int32_t im0 = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
   10130:	19aa8a93          	add	s5,s5,410 # fffff19a <_ebss+0xfffe92aa>

00010134 <.LBB211>:
            int32_t zr = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
   10134:	667b0b13          	add	s6,s6,1639 # ffffe667 <_ebss+0xfffe8777>
   10138:	e81ff06f          	j	ffb8 <.L52>

0001013c <.L50>:
    int cx = g_w/2, cy = g_h/2;
   1013c:	00200b93          	li	s7,2
    clear();
   10140:	ec1fe0ef          	jal	f000 <clear>

00010144 <.LVL338>:
    sin_tab_init();
   10144:	9a4ff0ef          	jal	f2e8 <sin_tab_init>

00010148 <.LVL339>:
    int cx = g_w/2, cy = g_h/2;
   10148:	037dc9b3          	div	s3,s11,s7
    int rx = g_w*2/5, ry = g_h*2/5;
   1014c:	00500793          	li	a5,5
   10150:	001d9c13          	sll	s8,s11,0x1
   10154:	001d1c93          	sll	s9,s10,0x1
   10158:	00002417          	auipc	s0,0x2
   1015c:	bbc40413          	add	s0,s0,-1092 # 11d14 <curves.0>
   10160:	00002a17          	auipc	s4,0x2
   10164:	c04a0a13          	add	s4,s4,-1020 # 11d64 <ecol.1>

00010168 <.LBB222>:
            int x = cx + rx * (int)sin_tab[ai] / 128;
   10168:	00006a97          	auipc	s5,0x6
   1016c:	c14a8a93          	add	s5,s5,-1004 # 15d7c <sin_tab>
            int ai = (curves[ci].a * t * 256 / STEPS) & 255;
   10170:	02000b13          	li	s6,32

00010174 <.LBE222>:
    int cx = g_w/2, cy = g_h/2;
   10174:	037d4bb3          	div	s7,s10,s7
    int rx = g_w*2/5, ry = g_h*2/5;
   10178:	02fc4c33          	div	s8,s8,a5
   1017c:	02fcccb3          	div	s9,s9,a5

00010180 <.LBB225>:
            int x = cx + rx * (int)sin_tab[ai] / 128;
   10180:	08000793          	li	a5,128

00010184 <.L106>:
        for (int t = 0; t < STEPS; t++) {
   10184:	00000913          	li	s2,0

00010188 <.L107>:
            int ai = (curves[ci].a * t * 256 / STEPS) & 255;
   10188:	00042703          	lw	a4,0(s0)
            int bi = (curves[ci].q * t * 256 / STEPS + curves[ci].phase) & 255;
   1018c:	00842683          	lw	a3,8(s0)
            pset(x,   y,   curves[ci].r, curves[ci].g, curves[ci].b);
   10190:	00c44603          	lbu	a2,12(s0)
   10194:	00c12a23          	sw	a2,20(sp)
            int ai = (curves[ci].a * t * 256 / STEPS) & 255;
   10198:	02e90733          	mul	a4,s2,a4
   1019c:	03674733          	div	a4,a4,s6
   101a0:	0ff77713          	zext.b	a4,a4
            int x = cx + rx * (int)sin_tab[ai] / 128;
   101a4:	00ea8733          	add	a4,s5,a4
   101a8:	00070483          	lb	s1,0(a4)
            int bi = (curves[ci].q * t * 256 / STEPS + curves[ci].phase) & 255;
   101ac:	00442703          	lw	a4,4(s0)
            int x = cx + rx * (int)sin_tab[ai] / 128;
   101b0:	038484b3          	mul	s1,s1,s8
            int bi = (curves[ci].q * t * 256 / STEPS + curves[ci].phase) & 255;
   101b4:	02e90733          	mul	a4,s2,a4

000101b8 <.LBE226>:
        for (int t = 0; t < STEPS; t++) {
   101b8:	00190913          	add	s2,s2,1

000101bc <.LBB227>:
            int bi = (curves[ci].q * t * 256 / STEPS + curves[ci].phase) & 255;
   101bc:	03674733          	div	a4,a4,s6
   101c0:	00d70733          	add	a4,a4,a3
   101c4:	0ff77713          	zext.b	a4,a4
            int y = cy + ry * (int)sin_tab[bi] / 128;
   101c8:	00ea8733          	add	a4,s5,a4
   101cc:	00070583          	lb	a1,0(a4)
            int x = cx + rx * (int)sin_tab[ai] / 128;
   101d0:	02f4c4b3          	div	s1,s1,a5
            pset(x,   y,   curves[ci].r, curves[ci].g, curves[ci].b);
   101d4:	00d44683          	lbu	a3,13(s0)
   101d8:	00e44703          	lbu	a4,14(s0)
   101dc:	00d12c23          	sw	a3,24(sp)
   101e0:	00e12e23          	sw	a4,28(sp)
            int y = cy + ry * (int)sin_tab[bi] / 128;
   101e4:	039585b3          	mul	a1,a1,s9
            int x = cx + rx * (int)sin_tab[ai] / 128;
   101e8:	013484b3          	add	s1,s1,s3
            pset(x,   y,   curves[ci].r, curves[ci].g, curves[ci].b);
   101ec:	00048513          	mv	a0,s1
            int y = cy + ry * (int)sin_tab[bi] / 128;
   101f0:	02f5c5b3          	div	a1,a1,a5
   101f4:	017585b3          	add	a1,a1,s7

000101f8 <.LVL348>:
            pset(x,   y,   curves[ci].r, curves[ci].g, curves[ci].b);
   101f8:	00b12823          	sw	a1,16(sp)
   101fc:	d35fe0ef          	jal	ef30 <pset>

00010200 <.LVL349>:
            pset(x+1, y,   curves[ci].r, curves[ci].g, curves[ci].b);
   10200:	01c12703          	lw	a4,28(sp)
   10204:	01812683          	lw	a3,24(sp)
   10208:	01412603          	lw	a2,20(sp)
   1020c:	01012583          	lw	a1,16(sp)
   10210:	00148793          	add	a5,s1,1
   10214:	00078513          	mv	a0,a5
   10218:	00f12423          	sw	a5,8(sp)
   1021c:	d15fe0ef          	jal	ef30 <pset>

00010220 <.LVL350>:
            pset(x,   y+1, curves[ci].r, curves[ci].g, curves[ci].b);
   10220:	01012583          	lw	a1,16(sp)
   10224:	01c12703          	lw	a4,28(sp)
   10228:	01812683          	lw	a3,24(sp)
   1022c:	01412603          	lw	a2,20(sp)
   10230:	00158593          	add	a1,a1,1
   10234:	00048513          	mv	a0,s1
   10238:	00b12823          	sw	a1,16(sp)

0001023c <.LVL351>:
   1023c:	cf5fe0ef          	jal	ef30 <pset>

00010240 <.LVL352>:
            pset(x+1, y+1, curves[ci].r, curves[ci].g, curves[ci].b);
   10240:	01c12703          	lw	a4,28(sp)
   10244:	01812683          	lw	a3,24(sp)
   10248:	01412603          	lw	a2,20(sp)
   1024c:	01012583          	lw	a1,16(sp)
   10250:	00812503          	lw	a0,8(sp)
   10254:	cddfe0ef          	jal	ef30 <pset>

00010258 <.LBE227>:
        for (int t = 0; t < STEPS; t++) {
   10258:	00002337          	lui	t1,0x2
   1025c:	08000793          	li	a5,128
   10260:	f26914e3          	bne	s2,t1,10188 <.L107>

00010264 <.LBE228>:
    for (int ci = 0; ci < ncurves; ci++) {
   10264:	01040413          	add	s0,s0,16
   10268:	f08a1ee3          	bne	s4,s0,10184 <.L106>
   1026c:	bc8ff06f          	j	f634 <.L61>
