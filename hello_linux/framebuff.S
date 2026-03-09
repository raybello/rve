
framebuff.gdb:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start-0x4>:
       0:	0000                	.2byte	0x0
	...

00000004 <_start>:
       4:	02c000ef          	jal	30 <.Lload_gp>
       8:	00050793          	mv	a5,a0
       c:	0000f517          	auipc	a0,0xf
      10:	46c50513          	add	a0,a0,1132 # f478 <main>
      14:	00012583          	lw	a1,0(sp)
      18:	00410613          	add	a2,sp,4
      1c:	ff017113          	and	sp,sp,-16
      20:	00000693          	li	a3,0
      24:	00000713          	li	a4,0
      28:	00010813          	mv	a6,sp
      2c:	5f10306f          	j	3e1c <__uClibc_main>

00000030 <.Lload_gp>:
      30:	00011197          	auipc	gp,0x11
      34:	c7018193          	add	gp,gp,-912 # 10ca0 <__global_pointer$>
      38:	00008067          	ret

0000003c <deregister_tm_clones>:
      3c:	00012517          	auipc	a0,0x12
      40:	51050513          	add	a0,a0,1296 # 1254c <__TMC_END__>
      44:	00012797          	auipc	a5,0x12
      48:	50878793          	add	a5,a5,1288 # 1254c <__TMC_END__>
      4c:	00a78a63          	beq	a5,a0,60 <.L1>
      50:	00010797          	auipc	a5,0x10
      54:	3e87a783          	lw	a5,1000(a5) # 10438 <.LLST98+0xd>
      58:	00078463          	beqz	a5,60 <.L1>
      5c:	00078067          	jr	a5

00000060 <.L1>:
      60:	00008067          	ret

00000064 <register_tm_clones>:
      64:	00012517          	auipc	a0,0x12
      68:	4e850513          	add	a0,a0,1256 # 1254c <__TMC_END__>
      6c:	00012597          	auipc	a1,0x12
      70:	4e058593          	add	a1,a1,1248 # 1254c <__TMC_END__>
      74:	40a585b3          	sub	a1,a1,a0
      78:	4025d593          	sra	a1,a1,0x2
      7c:	00200793          	li	a5,2
      80:	02f5c5b3          	div	a1,a1,a5
      84:	00058a63          	beqz	a1,98 <.L6>
      88:	00010797          	auipc	a5,0x10
      8c:	3a47a783          	lw	a5,932(a5) # 1042c <.LLST98+0x1>
      90:	00078463          	beqz	a5,98 <.L6>
      94:	00078067          	jr	a5

00000098 <.L6>:
      98:	00008067          	ret

0000009c <__do_global_dtors_aux>:
      9c:	ff010113          	add	sp,sp,-16
      a0:	00812423          	sw	s0,8(sp)
      a4:	00014417          	auipc	s0,0x14
      a8:	e5040413          	add	s0,s0,-432 # 13ef4 <completed.1>
      ac:	00044783          	lbu	a5,0(s0)
      b0:	00112623          	sw	ra,12(sp)
      b4:	02079463          	bnez	a5,dc <.L14>
      b8:	f85ff0ef          	jal	3c <deregister_tm_clones>
      bc:	00010797          	auipc	a5,0x10
      c0:	36c7a783          	lw	a5,876(a5) # 10428 <_GLOBAL_OFFSET_TABLE_+0x20>
      c4:	00078863          	beqz	a5,d4 <.L16>
      c8:	00012517          	auipc	a0,0x12
      cc:	48450513          	add	a0,a0,1156 # 1254c <__TMC_END__>
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
      f0:	36c7a783          	lw	a5,876(a5) # 10458 <.LLST99+0xb>
      f4:	02078463          	beqz	a5,11c <.L27>
      f8:	ff010113          	add	sp,sp,-16
      fc:	00112623          	sw	ra,12(sp)
     100:	00014597          	auipc	a1,0x14
     104:	df858593          	add	a1,a1,-520 # 13ef8 <object.0>
     108:	00012517          	auipc	a0,0x12
     10c:	44450513          	add	a0,a0,1092 # 1254c <__TMC_END__>
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
     170:	2d45a583          	lw	a1,724(a1) # 10440 <.LLST98+0x15>
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
     420:	0247a783          	lw	a5,36(a5) # 10440 <.LLST98+0x15>
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
     514:	fffe8693          	add	a3,t4,-1 # ffff <.LBE193+0x3>

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
     564:	fff78793          	add	a5,a5,-1 # ffff <.LBE193+0x3>

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
     584:	fff50513          	add	a0,a0,-1 # ffffff <_ebss+0xfe9f4f>

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
     59c:	fff68693          	add	a3,a3,-1 # 7fffff <_ebss+0x7e9f4f>

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
     668:	fff70713          	add	a4,a4,-1 # 7dffffff <_ebss+0x7dfe9f4f>
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
     710:	fff70713          	add	a4,a4,-1 # fbffffff <_ebss+0xfbfe9f4f>
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
     7bc:	fff48493          	add	s1,s1,-1 # 3ffffff <_ebss+0x3fe9f4f>
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
     7ec:	fff70693          	add	a3,a4,-1 # 3ffffff <_ebss+0x3fe9f4f>

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
     91c:	fff78793          	add	a5,a5,-1 # fbffffff <_ebss+0xfbfe9f4f>
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
     94c:	fff70713          	add	a4,a4,-1 # fbffffff <_ebss+0xfbfe9f4f>
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
     a3c:	f8178793          	add	a5,a5,-127 # 3ffff81 <_ebss+0x3fe9ed1>

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
     a64:	a4060613          	add	a2,a2,-1472 # 104a0 <.L10>
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
     b18:	fe070713          	add	a4,a4,-32 # ffe0 <.LBB197>
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
     bd0:	fff78793          	add	a5,a5,-1 # f7ffffff <_ebss+0xf7fe9f4f>
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
     d6c:	f8178793          	add	a5,a5,-127 # 3ffff81 <_ebss+0x3fe9ed1>

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
     da8:	fff80513          	add	a0,a6,-1 # ffff <.LBE193+0x3>
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
     eec:	07f68713          	add	a4,a3,127 # 7f80007f <_ebss+0x7f7e9fcf>

00000ef0 <.LVL62>:
     ef0:	08e05c63          	blez	a4,f88 <.L18>
     ef4:	00747793          	and	a5,s0,7
     ef8:	00078a63          	beqz	a5,f0c <.L19>
     efc:	00f47793          	and	a5,s0,15
     f00:	00400613          	li	a2,4
     f04:	00c78463          	beq	a5,a2,f0c <.L19>
     f08:	00440413          	add	s0,s0,4 # 400004 <_ebss+0x3e9f54>

00000f0c <.L19>:
     f0c:	00441793          	sll	a5,s0,0x4
     f10:	0007da63          	bgez	a5,f24 <.L20>
     f14:	f80007b7          	lui	a5,0xf8000
     f18:	fff78793          	add	a5,a5,-1 # f7ffffff <_ebss+0xf7fe9f4f>
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
    1008:	fff68693          	add	a3,a3,-1 # 7fffff <_ebss+0x7e9f4f>

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
    10e4:	fff70713          	add	a4,a4,-1 # 7dffffff <_ebss+0x7dfe9f4f>
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
    118c:	fff70713          	add	a4,a4,-1 # fbffffff <_ebss+0xfbfe9f4f>
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
    11ac:	00478793          	add	a5,a5,4 # 400004 <_ebss+0x3e9f54>
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
    1238:	fff48493          	add	s1,s1,-1 # 3ffffff <_ebss+0x3fe9f4f>
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
    1268:	fff70693          	add	a3,a4,-1 # 3ffffff <_ebss+0x3fe9f4f>

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
    1398:	fff78793          	add	a5,a5,-1 # fbffffff <_ebss+0xfbfe9f4f>
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
    13c8:	fff70713          	add	a4,a4,-1 # fbffffff <_ebss+0xfbfe9f4f>
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
    143c:	fff60793          	add	a5,a2,-1 # 7fffff <_ebss+0x7e9f4f>
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
    1460:	fff50513          	add	a0,a0,-1 # 7fffffff <_ebss+0x7ffe9f4f>
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
    14ac:	fff58693          	add	a3,a1,-1 # 7fffff <_ebss+0x7e9f4f>
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
    14e8:	f6a78793          	add	a5,a5,-150 # 3fff6a <_ebss+0x3e9eba>

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
    15b0:	fff40413          	add	s0,s0,-1 # fbffffff <_ebss+0xfbfe9f4f>

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
    15dc:	fff78793          	add	a5,a5,-1 # fbffffff <_ebss+0xfbfe9f4f>
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
    1638:	e0c7a783          	lw	a5,-500(a5) # 10440 <.LLST98+0x15>

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
    1678:	da07a783          	lw	a5,-608(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
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
    16d0:	d487a783          	lw	a5,-696(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
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
    1714:	d047a783          	lw	a5,-764(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
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
    1740:	04078793          	add	a5,a5,64 # 400040 <_ebss+0x3e9f90>
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
    17d0:	c487a783          	lw	a5,-952(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
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
    17fc:	c1c7a783          	lw	a5,-996(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    1800:	00a7a023          	sw	a0,0(a5)
    1804:	fff00513          	li	a0,-1

00001808 <.L1>:
    1808:	00008067          	ret

0000180c <puts>:
    180c:	0000f797          	auipc	a5,0xf
    1810:	c007a783          	lw	a5,-1024(a5) # 1040c <_GLOBAL_OFFSET_TABLE_+0x4>
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
    1890:	b807a783          	lw	a5,-1152(a5) # 1040c <_GLOBAL_OFFSET_TABLE_+0x4>
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
    18c0:	b687a783          	lw	a5,-1176(a5) # 10424 <_GLOBAL_OFFSET_TABLE_+0x1c>
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
    1934:	ae442403          	lw	s0,-1308(s0) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    1938:	00912223          	sw	s1,4(sp)
    193c:	00112623          	sw	ra,12(sp)
    1940:	00042483          	lw	s1,0(s0)
    1944:	774010ef          	jal	30b8 <__GI_isatty>
    1948:	00051c63          	bnez	a0,1960 <.L14>
    194c:	00011717          	auipc	a4,0x11
    1950:	b5070713          	add	a4,a4,-1200 # 1249c <_stdio_streams>
    1954:	00075783          	lhu	a5,0(a4)
    1958:	1007c793          	xor	a5,a5,256
    195c:	00f71023          	sh	a5,0(a4)

00001960 <.L14>:
    1960:	00100513          	li	a0,1
    1964:	754010ef          	jal	30b8 <__GI_isatty>
    1968:	00051c63          	bnez	a0,1980 <.L15>
    196c:	00011717          	auipc	a4,0x11
    1970:	b3070713          	add	a4,a4,-1232 # 1249c <_stdio_streams>
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
    19bc:	028030ef          	jal	49e4 <__stdio_WRITE>

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
    1a14:	4f4030ef          	jal	4f08 <__stdio_trans2w>
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
    1a74:	344030ef          	jal	4db8 <__stdio_fwrite>
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
    1b24:	294030ef          	jal	4db8 <__stdio_fwrite>

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
    1c14:	1a4030ef          	jal	4db8 <__stdio_fwrite>
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
    1c3c:	93c18c13          	add	s8,gp,-1732 # 105dc <prefix.0>
    1c40:	fffa8a93          	add	s5,s5,-1 # 3fffffff <_ebss+0x3ffe9f4f>
    1c44:	fffb0b13          	add	s6,s6,-1 # fffffff <_ebss+0xffe9f4f>

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
    1c68:	00a6a023          	sw	a0,0(a3) # 7f800000 <_ebss+0x7f7e9f50>
    1c6c:	00170713          	add	a4,a4,1
    1c70:	00468693          	add	a3,a3,4
    1c74:	4a00006f          	j	2114 <.L29>

00001c78 <.L31>:
    1c78:	00700713          	li	a4,7
    1c7c:	28f76663          	bltu	a4,a5,1f08 <.L33>
    1c80:	00010717          	auipc	a4,0x10
    1c84:	45870713          	add	a4,a4,1112 # 120d8 <spec_base.1>
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
    1d2c:	2b0030ef          	jal	4fdc <_load_inttype>
    1d30:	00c12703          	lw	a4,12(sp)
    1d34:	00812683          	lw	a3,8(sp)
    1d38:	0bf10c93          	add	s9,sp,191
    1d3c:	00058613          	mv	a2,a1
    1d40:	00050593          	mv	a1,a0
    1d44:	000c8513          	mv	a0,s9
    1d48:	34c030ef          	jal	5094 <_uintmaxtostr>
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
    1ec4:	6f5020ef          	jal	4db8 <__stdio_fwrite>
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
    1ef0:	1dcd0d13          	add	s10,s10,476 # 120c8 <.LC0>
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
    1f58:	1fc030ef          	jal	5154 <_fpmaxtostr>

00001f5c <.L108>:
    1f5c:	c60546e3          	bltz	a0,1bc8 <.L60>
    1f60:	00a484b3          	add	s1,s1,a0
    1f64:	1e80006f          	j	214c <.L32>

00001f68 <.L49>:
    1f68:	0047a603          	lw	a2,4(a5)
    1f6c:	0007a583          	lw	a1,0(a5)
    1f70:	00040513          	mv	a0,s0
    1f74:	1d10c0ef          	jal	e944 <__extenddftf2>
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
    1fe4:	0f0d0d13          	add	s10,s10,240 # 120d0 <.LC1>
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
    202c:	3ec7a783          	lw	a5,1004(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    2030:	0007a503          	lw	a0,0(a5)
    2034:	08000613          	li	a2,128
    2038:	04010593          	add	a1,sp,64
    203c:	751000ef          	jal	2f8c <__GI___glibc_strerror_r>
    2040:	00050d13          	mv	s10,a0
    2044:	f71ff06f          	j	1fb4 <.L55>

00002048 <.L57>:
    2048:	0cc12583          	lw	a1,204(sp)
    204c:	00010717          	auipc	a4,0x10
    2050:	4d472703          	lw	a4,1236(a4) # 12520 <_custom_printf_spec>
    2054:	00a70693          	add	a3,a4,10
    2058:	00070793          	mv	a5,a4

0000205c <.L61>:
    205c:	0007c503          	lbu	a0,0(a5)
    2060:	02b51663          	bne	a0,a1,208c <.L58>
    2064:	40e787b3          	sub	a5,a5,a4
    2068:	00279793          	sll	a5,a5,0x2
    206c:	00014717          	auipc	a4,0x14
    2070:	01070713          	add	a4,a4,16 # 1607c <_custom_printf_handler>
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
    20ac:	50d020ef          	jal	4db8 <__stdio_fwrite>
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
    2148:	711020ef          	jal	5058 <_store_inttype>

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
    22c8:	00478693          	add	a3,a5,4 # 80000004 <_ebss+0x7ffe9f54>
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
    2330:	0005a683          	lw	a3,0(a1) # 80000000 <_ebss+0x7ffe9f50>
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
    240c:	96018793          	add	a5,gp,-1696 # 10600 <type_sizes>
    2410:	94818713          	add	a4,gp,-1720 # 105e8 <type_codes>

00002414 <.L3>:
    2414:	ffe79683          	lh	a3,-2(a5) # 7ffffffe <_ebss+0x7ffe9f4e>
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
    24a0:	09c2a283          	lw	t0,156(t0) # 12538 <__GI___ctype_b>
    24a4:	00000513          	li	a0,0
    24a8:	00000613          	li	a2,0
    24ac:	00000893          	li	a7,0
    24b0:	02a00e93          	li	t4,42
    24b4:	ccb30313          	add	t1,t1,-821 # ccccccb <_ebss+0xccb6c1b>
    24b8:	00a00393          	li	t2,10
    24bc:	ccce0e13          	add	t3,t3,-820 # ccccccc <_ebss+0xccb6c1c>
    24c0:	fff80813          	add	a6,a6,-1 # 7fffffff <_ebss+0x7ffe9f4f>
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
    25b4:	b4868693          	add	a3,a3,-1208 # 120f8 <spec_flags.5>

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
    266c:	96c18713          	add	a4,gp,-1684 # 1060c <qual_chars.4>
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
    26b4:	a3070713          	add	a4,a4,-1488 # 120e0 <spec_chars.3>
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
    26dc:	98018513          	add	a0,gp,-1664 # 10620 <spec_ranges.2>
    26e0:	02e42023          	sw	a4,32(s0)
    26e4:	00050813          	mv	a6,a0

000026e8 <.L34>:
    26e8:	00050593          	mv	a1,a0
    26ec:	0005c303          	lbu	t1,0(a1)
    26f0:	00150513          	add	a0,a0,1
    26f4:	fee34ae3          	blt	t1,a4,26e8 <.L34>
    26f8:	410585b3          	sub	a1,a1,a6
    26fc:	94818713          	add	a4,gp,-1720 # 105e8 <type_codes>
    2700:	00159593          	sll	a1,a1,0x1
    2704:	00b705b3          	add	a1,a4,a1
    2708:	04459703          	lh	a4,68(a1)
    270c:	05459583          	lh	a1,84(a1)
    2710:	00d76733          	or	a4,a4,a3
    2714:	00b77733          	and	a4,a4,a1
    2718:	00e12e23          	sw	a4,28(sp)
    271c:	00010717          	auipc	a4,0x10
    2720:	9c470713          	add	a4,a4,-1596 # 120e0 <spec_chars.3>

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
    2854:	cd072703          	lw	a4,-816(a4) # 12520 <_custom_printf_spec>
    2858:	00a70693          	add	a3,a4,10
    285c:	00070793          	mv	a5,a4

00002860 <.L42>:
    2860:	0007c583          	lbu	a1,0(a5)
    2864:	02c59e63          	bne	a1,a2,28a0 <.L41>
    2868:	40e787b3          	sub	a5,a5,a4
    286c:	00279793          	sll	a5,a5,0x2
    2870:	00013717          	auipc	a4,0x13
    2874:	7e470713          	add	a4,a4,2020 # 16054 <_custom_printf_arginfo>
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
    29b8:	550020ef          	jal	4f08 <__stdio_trans2w>
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
    29e8:	7fd010ef          	jal	49e4 <__stdio_WRITE>
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
    2aa0:	468020ef          	jal	4f08 <__stdio_trans2w>
    2aa4:	fc050ae3          	beqz	a0,2a78 <.L5>
    2aa8:	fd5ff06f          	j	2a7c <.L10>

00002aac <.L3>:
    2aac:	fc0908e3          	beqz	s2,2a7c <.L10>
    2ab0:	0324b7b3          	mulhu	a5,s1,s2
    2ab4:	00079e63          	bnez	a5,2ad0 <.L9>
    2ab8:	032485b3          	mul	a1,s1,s2
    2abc:	00040613          	mv	a2,s0
    2ac0:	00098513          	mv	a0,s3
    2ac4:	2f4020ef          	jal	4db8 <__stdio_fwrite>
    2ac8:	02955533          	divu	a0,a0,s1
    2acc:	fb5ff06f          	j	2a80 <.L1>

00002ad0 <.L9>:
    2ad0:	00045783          	lhu	a5,0(s0)
    2ad4:	01600713          	li	a4,22
    2ad8:	0087e793          	or	a5,a5,8
    2adc:	00f41023          	sh	a5,0(s0)
    2ae0:	0000e797          	auipc	a5,0xe
    2ae4:	9347a783          	lw	a5,-1740(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
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
    2b40:	9ac18313          	add	t1,gp,-1620 # 1064c <.L8>
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
    2dac:	10168693          	add	a3,a3,257 # 1010101 <_ebss+0xffa051>
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
    2e50:	eff60613          	add	a2,a2,-257 # fefefeff <_ebss+0xfefd9e4f>
    2e54:	08058593          	add	a1,a1,128 # 80808080 <_ebss+0x807f1fd0>

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
    2f00:	eff50513          	add	a0,a0,-257 # fefefeff <_ebss+0xfefd9e4f>
    2f04:	08080813          	add	a6,a6,128 # 80808080 <_ebss+0x807f1fd0>

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
    2ff4:	0a0020ef          	jal	5094 <_uintmaxtostr>
    2ff8:	ff250913          	add	s2,a0,-14
    2ffc:	00e00613          	li	a2,14
    3000:	0000f597          	auipc	a1,0xf
    3004:	10058593          	add	a1,a1,256 # 12100 <unknown.0>
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
    3058:	3c07a783          	lw	a5,960(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    305c:	0097a023          	sw	s1,0(a5)
    3060:	0340006f          	j	3094 <.L1>

00003064 <.L13>:
    3064:	00050493          	mv	s1,a0
    3068:	0000d917          	auipc	s2,0xd
    306c:	60090913          	add	s2,s2,1536 # 10668 <_string_syserrmsgs>
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
    30ec:	40158593          	add	a1,a1,1025 # 5401 <.L113+0x2d>
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
    3138:	789020ef          	jal	60c0 <__GI_mempcpy>
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
    31d0:	02168693          	add	a3,a3,33 # 4000021 <_ebss+0x3fe9f71>
    31d4:	00300613          	li	a2,3
    31d8:	00040593          	mv	a1,s0
    31dc:	00000513          	li	a0,0
    31e0:	00c010ef          	jal	41ec <__GI_mmap>
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
    3214:	2445a583          	lw	a1,580(a1) # 10454 <.LLST99+0x7>
    3218:	00c00513          	li	a0,12
    321c:	f45ff0ef          	jal	3160 <__malloc_from_heap>
    3220:	0000d617          	auipc	a2,0xd
    3224:	1fc62603          	lw	a2,508(a2) # 1041c <_GLOBAL_OFFSET_TABLE_+0x14>
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
    32d8:	1407a783          	lw	a5,320(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    32dc:	00c00713          	li	a4,12
    32e0:	00e7a023          	sw	a4,0(a5)
    32e4:	00000513          	li	a0,0
    32e8:	00008067          	ret

000032ec <.L23>:
    32ec:	00100513          	li	a0,1

000032f0 <.L20>:
    32f0:	ff010113          	add	sp,sp,-16
    32f4:	0000f597          	auipc	a1,0xf
    32f8:	23058593          	add	a1,a1,560 # 12524 <__malloc_heap>
    32fc:	00112623          	sw	ra,12(sp)
    3300:	e61ff0ef          	jal	3160 <__malloc_from_heap>
    3304:	00051c63          	bnez	a0,331c <.L19>
    3308:	0000d797          	auipc	a5,0xd
    330c:	10c7a783          	lw	a5,268(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
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
    33bc:	064c2c03          	lw	s8,100(s8) # 1041c <_GLOBAL_OFFSET_TABLE_+0x14>
    33c0:	000c2483          	lw	s1,0(s8)
    33c4:	00000a93          	li	s5,0
    33c8:	0000dc97          	auipc	s9,0xd
    33cc:	08ccac83          	lw	s9,140(s9) # 10454 <.LLST99+0x7>
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
    3480:	5b5000ef          	jal	4234 <__GI_munmap>

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
    34e4:	04458593          	add	a1,a1,68 # 12524 <__malloc_heap>
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
    36a0:	e9c52503          	lw	a0,-356(a0) # 12538 <__GI___ctype_b>

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
    373c:	cdc7a783          	lw	a5,-804(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
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
    37a8:	fff78793          	add	a5,a5,-1 # 7fffffff <_ebss+0x7ffe9f4f>
    37ac:	00f307b3          	add	a5,t1,a5
    37b0:	00a7fc63          	bgeu	a5,a0,37c8 <.L23>
    37b4:	0000d717          	auipc	a4,0xd
    37b8:	c6072703          	lw	a4,-928(a4) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
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
    3814:	0000f517          	auipc	a0,0xf
    3818:	8fc50513          	add	a0,a0,-1796 # 12110 <.LC0>
    381c:	02912223          	sw	s1,36(sp)
    3820:	02112623          	sw	ra,44(sp)
    3824:	02812423          	sw	s0,40(sp)
    3828:	03212023          	sw	s2,32(sp)
    382c:	01312e23          	sw	s3,28(sp)
    3830:	01412c23          	sw	s4,24(sp)
    3834:	01512a23          	sw	s5,20(sp)
    3838:	00012623          	sw	zero,12(sp)
    383c:	4f5000ef          	jal	4530 <__GI_config_open>
    3840:	00000493          	li	s1,0
    3844:	0a050c63          	beqz	a0,38fc <.L19>
    3848:	00050413          	mv	s0,a0
    384c:	00c10913          	add	s2,sp,12
    3850:	0000f997          	auipc	s3,0xf
    3854:	8cc98993          	add	s3,s3,-1844 # 1211c <.LC1>
    3858:	06300a13          	li	s4,99
    385c:	07000a93          	li	s5,112

00003860 <.L2>:
    3860:	00098693          	mv	a3,s3
    3864:	10200613          	li	a2,258
    3868:	00090593          	mv	a1,s2
    386c:	00040513          	mv	a0,s0
    3870:	555000ef          	jal	45c4 <__GI_config_read>
    3874:	02051e63          	bnez	a0,38b0 <.L5>

00003878 <.L6>:
    3878:	00040513          	mv	a0,s0
    387c:	505000ef          	jal	4580 <__GI_config_close>
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
    38dc:	c607a783          	lw	a5,-928(a5) # 12538 <__GI___ctype_b>
    38e0:	00171713          	sll	a4,a4,0x1
    38e4:	00e787b3          	add	a5,a5,a4
    38e8:	0007d783          	lhu	a5,0(a5)
    38ec:	0087f793          	and	a5,a5,8
    38f0:	f60788e3          	beqz	a5,3860 <.L2>
    38f4:	00148493          	add	s1,s1,1
    38f8:	f69ff06f          	j	3860 <.L2>

000038fc <.L19>:
    38fc:	0000f517          	auipc	a0,0xf
    3900:	82450513          	add	a0,a0,-2012 # 12120 <.LC2>
    3904:	42d000ef          	jal	4530 <__GI_config_open>
    3908:	00050413          	mv	s0,a0
    390c:	f60506e3          	beqz	a0,3878 <.L6>
    3910:	00070937          	lui	s2,0x70
    3914:	00c10993          	add	s3,sp,12
    3918:	0000ea17          	auipc	s4,0xe
    391c:	c28a0a13          	add	s4,s4,-984 # 11540 <.LANCHOR0>
    3920:	20290913          	add	s2,s2,514 # 70202 <_ebss+0x5a152>
    3924:	0000fa97          	auipc	s5,0xf
    3928:	80ca8a93          	add	s5,s5,-2036 # 12130 <.LC3>

0000392c <.L7>:
    392c:	000a0693          	mv	a3,s4
    3930:	00090613          	mv	a2,s2
    3934:	00098593          	mv	a1,s3
    3938:	00040513          	mv	a0,s0
    393c:	489000ef          	jal	45c4 <__GI_config_read>
    3940:	f2050ce3          	beqz	a0,3878 <.L6>
    3944:	00c12783          	lw	a5,12(sp)
    3948:	000a8513          	mv	a0,s5
    394c:	0007a583          	lw	a1,0(a5)
    3950:	1dd020ef          	jal	632c <__GI_strcmp>
    3954:	fc051ce3          	bnez	a0,392c <.L7>
    3958:	00148493          	add	s1,s1,1
    395c:	fd1ff06f          	j	392c <.L7>

00003960 <get_phys_pages>:
    3960:	fb010113          	add	sp,sp,-80
    3964:	04112623          	sw	ra,76(sp)
    3968:	04812423          	sw	s0,72(sp)
    396c:	015000ef          	jal	4180 <__GI_getpagesize>
    3970:	00050413          	mv	s0,a0
    3974:	00010513          	mv	a0,sp
    3978:	0e5000ef          	jal	425c <sysinfo>
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
    39b8:	7c8000ef          	jal	4180 <__GI_getpagesize>
    39bc:	00050413          	mv	s0,a0
    39c0:	00010513          	mv	a0,sp
    39c4:	099000ef          	jal	425c <sysinfo>
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
    3a3c:	9dc7a783          	lw	a5,-1572(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    3a40:	01600713          	li	a4,22
    3a44:	00e7a023          	sw	a4,0(a5)

00003a48 <.L34>:
    3a48:	fff00413          	li	s0,-1
    3a4c:	02c0006f          	j	3a78 <.L47>

00003a50 <.L31>:
    3a50:	fe950413          	add	s0,a0,-23
    3a54:	0d900793          	li	a5,217
    3a58:	fe87e0e3          	bltu	a5,s0,3a38 <.L30>
    3a5c:	52418713          	add	a4,gp,1316 # 111c4 <.L35>
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
    3ac8:	a6870713          	add	a4,a4,-1432 # 1152c <.L68>
    3acc:	00241413          	sll	s0,s0,0x2
    3ad0:	00e40433          	add	s0,s0,a4
    3ad4:	00042783          	lw	a5,0(s0) # 8000 <.L4+0x10>
    3ad8:	00e787b3          	add	a5,a5,a4
    3adc:	00078067          	jr	a5

00003ae0 <.L70>:
    3ae0:	06400413          	li	s0,100
    3ae4:	f95ff06f          	j	3a78 <.L47>

00003ae8 <.L32>:
    3ae8:	00100713          	li	a4,1
    3aec:	0041d7b7          	lui	a5,0x41d
    3af0:	00a71733          	sll	a4,a4,a0
    3af4:	f8078793          	add	a5,a5,-128 # 41cf80 <_ebss+0x406ed0>
    3af8:	00f777b3          	and	a5,a4,a5
    3afc:	fa0782e3          	beqz	a5,3aa0 <.L86>

00003b00 <.L36>:
    3b00:	00100413          	li	s0,1
    3b04:	f75ff06f          	j	3a78 <.L47>

00003b08 <.L66>:
    3b08:	00810593          	add	a1,sp,8
    3b0c:	00300513          	li	a0,3
    3b10:	67c000ef          	jal	418c <__GI_getrlimit>
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
    3b50:	6000006f          	j	4150 <__GI_getdtablesize>

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
    3b7c:	6040006f          	j	4180 <__GI_getpagesize>

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
    3bb0:	fff40413          	add	s0,s0,-1 # 7fff <.L4+0xf>
    3bb4:	ec5ff06f          	j	3a78 <.L47>

00003bb8 <.L61>:
    3bb8:	10000413          	li	s0,256
    3bbc:	ebdff06f          	j	3a78 <.L47>

00003bc0 <.L60>:
    3bc0:	0000e517          	auipc	a0,0xe
    3bc4:	57c50513          	add	a0,a0,1404 # 1213c <.LC5>
    3bc8:	04d000ef          	jal	4414 <__GI_opendir>
    3bcc:	00050493          	mv	s1,a0
    3bd0:	00000413          	li	s0,0
    3bd4:	06050c63          	beqz	a0,3c4c <.L87>
    3bd8:	00010937          	lui	s2,0x10
    3bdc:	000079b7          	lui	s3,0x7
    3be0:	ffff0a37          	lui	s4,0xffff0
    3be4:	63040ab7          	lui	s5,0x63040
    3be8:	fff90913          	add	s2,s2,-1 # ffff <.LBE193+0x3>
    3bec:	57098993          	add	s3,s3,1392 # 7570 <.L6+0x4>

00003bf0 <.L72>:
    3bf0:	00048513          	mv	a0,s1
    3bf4:	0a5000ef          	jal	4498 <__GI_readdir64>
    3bf8:	00051a63          	bnez	a0,3c0c <.L75>
    3bfc:	00048513          	mv	a0,s1
    3c00:	684000ef          	jal	4284 <__GI_closedir>

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
    3c28:	0000f797          	auipc	a5,0xf
    3c2c:	9107a783          	lw	a5,-1776(a5) # 12538 <__GI___ctype_b>
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
    3d2c:	3fc000ef          	jal	4128 <__GI_clock_getres>
    3d30:	d0054ce3          	bltz	a0,3a48 <.L34>

00003d34 <.L53>:
    3d34:	00031437          	lui	s0,0x31
    3d38:	06940413          	add	s0,s0,105 # 31069 <_ebss+0x1afb9>
    3d3c:	d3dff06f          	j	3a78 <.L47>

00003d40 <.L77>:
    3d40:	01400413          	li	s0,20
    3d44:	d35ff06f          	j	3a78 <.L47>

00003d48 <.L78>:
    3d48:	00010437          	lui	s0,0x10
    3d4c:	d2dff06f          	j	3a78 <.L47>

00003d50 <__uClibc_init>:
    3d50:	00012797          	auipc	a5,0x12
    3d54:	1d478793          	add	a5,a5,468 # 15f24 <__pagesize>
    3d58:	0007a703          	lw	a4,0(a5)
    3d5c:	02071063          	bnez	a4,3d7c <.L1>
    3d60:	00002737          	lui	a4,0x2
    3d64:	00e7a023          	sw	a4,0(a5)
    3d68:	0000c717          	auipc	a4,0xc
    3d6c:	6e872703          	lw	a4,1768(a4) # 10450 <.LLST99+0x3>
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
    3d90:	7c040413          	add	s0,s0,1984 # 1254c <__TMC_END__>
    3d94:	0000e497          	auipc	s1,0xe
    3d98:	7b448493          	add	s1,s1,1972 # 12548 <__do_global_dtors_aux_fini_array_entry>
    3d9c:	40940433          	sub	s0,s0,s1
    3da0:	40245413          	sra	s0,s0,0x2
    3da4:	01212023          	sw	s2,0(sp)
    3da8:	00112623          	sw	ra,12(sp)
    3dac:	fff40413          	add	s0,s0,-1
    3db0:	fff00913          	li	s2,-1

00003db4 <.L9>:
    3db4:	03241c63          	bne	s0,s2,3dec <.L10>
    3db8:	00012417          	auipc	s0,0x12
    3dbc:	16c40413          	add	s0,s0,364 # 15f24 <__pagesize>
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
    3e58:	0d0b0b13          	add	s6,s6,208 # 15f24 <__pagesize>
    3e5c:	0000c717          	auipc	a4,0xc
    3e60:	5b472703          	lw	a4,1460(a4) # 10410 <_GLOBAL_OFFSET_TABLE_+0x8>
    3e64:	01072023          	sw	a6,0(a4)
    3e68:	00fb2423          	sw	a5,8(s6)
    3e6c:	00158793          	add	a5,a1,1
    3e70:	00068993          	mv	s3,a3
    3e74:	00279793          	sll	a5,a5,0x2
    3e78:	00062683          	lw	a3,0(a2)
    3e7c:	00f60733          	add	a4,a2,a5
    3e80:	0000cb97          	auipc	s7,0xc
    3e84:	598bab83          	lw	s7,1432(s7) # 10418 <_GLOBAL_OFFSET_TABLE_+0x10>
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
    3eec:	64f72223          	sw	a5,1604(a4) # 1252c <__uclibc_progname>
    3ef0:	02078a63          	beqz	a5,3f24 <.L23>
    3ef4:	0000c717          	auipc	a4,0xc
    3ef8:	56c72703          	lw	a4,1388(a4) # 10460 <.LLST99+0x13>
    3efc:	00f72023          	sw	a5,0(a4)
    3f00:	00042503          	lw	a0,0(s0)
    3f04:	02f00593          	li	a1,47
    3f08:	4a8020ef          	jal	63b0 <__GI_strrchr>
    3f0c:	0000c797          	auipc	a5,0xc
    3f10:	5247a783          	lw	a5,1316(a5) # 10430 <.LLST98+0x5>
    3f14:	00a7a023          	sw	a0,0(a5)
    3f18:	0a050863          	beqz	a0,3fc8 <.L24>
    3f1c:	00150513          	add	a0,a0,1
    3f20:	00a7a023          	sw	a0,0(a5)

00003f24 <.L23>:
    3f24:	015b2223          	sw	s5,4(s6)
    3f28:	0000eb17          	auipc	s6,0xe
    3f2c:	618b0b13          	add	s6,s6,1560 # 12540 <__preinit_array_start>
    3f30:	0000ea97          	auipc	s5,0xe
    3f34:	614a8a93          	add	s5,s5,1556 # 12544 <__frame_dummy_init_array_entry>
    3f38:	416a8ab3          	sub	s5,s5,s6
    3f3c:	402ada93          	sra	s5,s5,0x2
    3f40:	00000c13          	li	s8,0

00003f44 <.L25>:
    3f44:	095c1863          	bne	s8,s5,3fd4 <.L26>
    3f48:	00098463          	beqz	s3,3f50 <.L27>
    3f4c:	000980e7          	jalr	s3

00003f50 <.L27>:
    3f50:	0000ea97          	auipc	s5,0xe
    3f54:	5f4a8a93          	add	s5,s5,1524 # 12544 <__frame_dummy_init_array_entry>
    3f58:	0000e997          	auipc	s3,0xe
    3f5c:	5f098993          	add	s3,s3,1520 # 12548 <__do_global_dtors_aux_fini_array_entry>
    3f60:	415989b3          	sub	s3,s3,s5
    3f64:	4029d993          	sra	s3,s3,0x2

00003f68 <.L28>:
    3f68:	08999063          	bne	s3,s1,3fe8 <.L29>
    3f6c:	0000c797          	auipc	a5,0xc
    3f70:	4e07a783          	lw	a5,1248(a5) # 1044c <.LLST98+0x21>
    3f74:	00078663          	beqz	a5,3f80 <.L30>
    3f78:	5a0000ef          	jal	4518 <__errno_location>
    3f7c:	00052023          	sw	zero,0(a0)

00003f80 <.L30>:
    3f80:	0000c797          	auipc	a5,0xc
    3f84:	4bc7a783          	lw	a5,1212(a5) # 1043c <.LLST98+0x11>
    3f88:	00078663          	beqz	a5,3f94 <.L31>
    3f8c:	598000ef          	jal	4524 <__h_errno_location>
    3f90:	00052023          	sw	zero,0(a0)

00003f94 <.L31>:
    3f94:	000ba603          	lw	a2,0(s7)
    3f98:	00040593          	mv	a1,s0
    3f9c:	00090513          	mv	a0,s2
    3fa0:	000a00e7          	jalr	s4 # ffff0000 <_ebss+0xfffd9f50>
    3fa4:	674020ef          	jal	6618 <__GI_exit>

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
    4004:	4347a783          	lw	a5,1076(a5) # 10434 <.LLST98+0x9>
    4008:	00e7a023          	sw	a4,0(a5)
    400c:	02c52703          	lw	a4,44(a0)
    4010:	0000c797          	auipc	a5,0xc
    4014:	4387a783          	lw	a5,1080(a5) # 10448 <.LLST98+0x1d>
    4018:	00e7a023          	sw	a4,0(a5)
    401c:	03452783          	lw	a5,52(a0)
    4020:	00079463          	bnez	a5,4028 <.L2>
    4024:	000027b7          	lui	a5,0x2

00004028 <.L2>:
    4028:	0000c717          	auipc	a4,0xc
    402c:	43472703          	lw	a4,1076(a4) # 1045c <.LLST99+0xf>
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
    4054:	0150a0ef          	jal	e868 <__extendsfdf2>
    4058:	00050493          	mv	s1,a0
    405c:	00090513          	mv	a0,s2
    4060:	00058413          	mv	s0,a1
    4064:	0050a0ef          	jal	e868 <__extendsfdf2>
    4068:	00048613          	mv	a2,s1
    406c:	00040693          	mv	a3,s0
    4070:	5ec020ef          	jal	665c <__ieee754_atan2>
    4074:	2dd0a0ef          	jal	eb50 <__truncdfsf2>
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
    40ac:	7bc0a0ef          	jal	e868 <__extendsfdf2>
    40b0:	00050493          	mv	s1,a0
    40b4:	00090513          	mv	a0,s2
    40b8:	00058413          	mv	s0,a1
    40bc:	7ac0a0ef          	jal	e868 <__extendsfdf2>
    40c0:	00048613          	mv	a2,s1
    40c4:	00040693          	mv	a3,s0
    40c8:	7f4020ef          	jal	68bc <__ieee754_fmod>
    40cc:	2850a0ef          	jal	eb50 <__truncdfsf2>
    40d0:	00c12083          	lw	ra,12(sp)
    40d4:	00812403          	lw	s0,8(sp)
    40d8:	00412483          	lw	s1,4(sp)
    40dc:	00012903          	lw	s2,0(sp)
    40e0:	01010113          	add	sp,sp,16
    40e4:	00008067          	ret

000040e8 <__GI_cosf>:
    40e8:	ff010113          	add	sp,sp,-16
    40ec:	00112623          	sw	ra,12(sp)
    40f0:	7780a0ef          	jal	e868 <__extendsfdf2>
    40f4:	73d020ef          	jal	7030 <__GI_cos>
    40f8:	2590a0ef          	jal	eb50 <__truncdfsf2>
    40fc:	00c12083          	lw	ra,12(sp)
    4100:	01010113          	add	sp,sp,16
    4104:	00008067          	ret

00004108 <__GI_sinf>:
    4108:	ff010113          	add	sp,sp,-16
    410c:	00112623          	sw	ra,12(sp)
    4110:	7580a0ef          	jal	e868 <__extendsfdf2>
    4114:	7f1020ef          	jal	7104 <__GI_sin>
    4118:	2390a0ef          	jal	eb50 <__truncdfsf2>
    411c:	00c12083          	lw	ra,12(sp)
    4120:	01010113          	add	sp,sp,16
    4124:	00008067          	ret

00004128 <__GI_clock_getres>:
    4128:	07200893          	li	a7,114
    412c:	00000073          	ecall
    4130:	fffff7b7          	lui	a5,0xfffff
    4134:	00a7fc63          	bgeu	a5,a0,414c <.L1>
    4138:	40a00533          	neg	a0,a0
    413c:	0000c797          	auipc	a5,0xc
    4140:	2d87a783          	lw	a5,728(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    4144:	00a7a023          	sw	a0,0(a5)
    4148:	fff00513          	li	a0,-1

0000414c <.L1>:
    414c:	00008067          	ret

00004150 <__GI_getdtablesize>:
    4150:	fe010113          	add	sp,sp,-32
    4154:	00810593          	add	a1,sp,8
    4158:	00700513          	li	a0,7
    415c:	00112e23          	sw	ra,28(sp)
    4160:	02c000ef          	jal	418c <__GI_getrlimit>
    4164:	10000793          	li	a5,256
    4168:	00054463          	bltz	a0,4170 <.L1>
    416c:	00812783          	lw	a5,8(sp)

00004170 <.L1>:
    4170:	01c12083          	lw	ra,28(sp)
    4174:	00078513          	mv	a0,a5
    4178:	02010113          	add	sp,sp,32
    417c:	00008067          	ret

00004180 <__GI_getpagesize>:
    4180:	00012517          	auipc	a0,0x12
    4184:	da452503          	lw	a0,-604(a0) # 15f24 <__pagesize>
    4188:	00008067          	ret

0000418c <__GI_getrlimit>:
    418c:	00058793          	mv	a5,a1
    4190:	0a300893          	li	a7,163
    4194:	00000073          	ecall
    4198:	fffff737          	lui	a4,0xfffff
    419c:	02a76c63          	bltu	a4,a0,41d4 <.L2>
    41a0:	0005a683          	lw	a3,0(a1)
    41a4:	80000737          	lui	a4,0x80000
    41a8:	fff70713          	add	a4,a4,-1 # 7fffffff <_ebss+0x7ffe9f4f>
    41ac:	00e69663          	bne	a3,a4,41b8 <.L4>
    41b0:	fff00713          	li	a4,-1
    41b4:	00e5a023          	sw	a4,0(a1)

000041b8 <.L4>:
    41b8:	0047a683          	lw	a3,4(a5)
    41bc:	80000737          	lui	a4,0x80000
    41c0:	fff70713          	add	a4,a4,-1 # 7fffffff <_ebss+0x7ffe9f4f>
    41c4:	00e69663          	bne	a3,a4,41d0 <.L1>
    41c8:	fff00713          	li	a4,-1
    41cc:	00e7a223          	sw	a4,4(a5)

000041d0 <.L1>:
    41d0:	00008067          	ret

000041d4 <.L2>:
    41d4:	40a00533          	neg	a0,a0
    41d8:	0000c797          	auipc	a5,0xc
    41dc:	23c7a783          	lw	a5,572(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    41e0:	00a7a023          	sw	a0,0(a5)
    41e4:	fff00513          	li	a0,-1
    41e8:	00008067          	ret

000041ec <__GI_mmap>:
    41ec:	01379813          	sll	a6,a5,0x13
    41f0:	00080e63          	beqz	a6,420c <.L2>
    41f4:	0000c797          	auipc	a5,0xc
    41f8:	2207a783          	lw	a5,544(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    41fc:	01600713          	li	a4,22
    4200:	00e7a023          	sw	a4,0(a5)

00004204 <.L5>:
    4204:	fff00513          	li	a0,-1

00004208 <.L1>:
    4208:	00008067          	ret

0000420c <.L2>:
    420c:	00d7d793          	srl	a5,a5,0xd
    4210:	0de00893          	li	a7,222
    4214:	00000073          	ecall
    4218:	fffff7b7          	lui	a5,0xfffff
    421c:	fea7f6e3          	bgeu	a5,a0,4208 <.L1>
    4220:	40a00533          	neg	a0,a0
    4224:	0000c797          	auipc	a5,0xc
    4228:	1f07a783          	lw	a5,496(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    422c:	00a7a023          	sw	a0,0(a5)
    4230:	fd5ff06f          	j	4204 <.L5>

00004234 <__GI_munmap>:
    4234:	0d700893          	li	a7,215
    4238:	00000073          	ecall
    423c:	fffff7b7          	lui	a5,0xfffff
    4240:	00a7fc63          	bgeu	a5,a0,4258 <.L1>
    4244:	40a00533          	neg	a0,a0
    4248:	0000c797          	auipc	a5,0xc
    424c:	1cc7a783          	lw	a5,460(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    4250:	00a7a023          	sw	a0,0(a5)
    4254:	fff00513          	li	a0,-1

00004258 <.L1>:
    4258:	00008067          	ret

0000425c <sysinfo>:
    425c:	0b300893          	li	a7,179
    4260:	00000073          	ecall
    4264:	fffff7b7          	lui	a5,0xfffff
    4268:	00a7fc63          	bgeu	a5,a0,4280 <.L1>
    426c:	40a00533          	neg	a0,a0
    4270:	0000c797          	auipc	a5,0xc
    4274:	1a47a783          	lw	a5,420(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    4278:	00a7a023          	sw	a0,0(a5)
    427c:	fff00513          	li	a0,-1

00004280 <.L1>:
    4280:	00008067          	ret

00004284 <__GI_closedir>:
    4284:	ff010113          	add	sp,sp,-16
    4288:	00912223          	sw	s1,4(sp)
    428c:	00052483          	lw	s1,0(a0)
    4290:	00112623          	sw	ra,12(sp)
    4294:	00812423          	sw	s0,8(sp)
    4298:	fff00793          	li	a5,-1
    429c:	02f48a63          	beq	s1,a5,42d0 <.L5>
    42a0:	00050413          	mv	s0,a0
    42a4:	00f52023          	sw	a5,0(a0)
    42a8:	00c52503          	lw	a0,12(a0)
    42ac:	a34ff0ef          	jal	34e0 <free>
    42b0:	00040513          	mv	a0,s0
    42b4:	a2cff0ef          	jal	34e0 <free>
    42b8:	00812403          	lw	s0,8(sp)
    42bc:	00c12083          	lw	ra,12(sp)
    42c0:	00048513          	mv	a0,s1
    42c4:	00412483          	lw	s1,4(sp)
    42c8:	01010113          	add	sp,sp,16
    42cc:	b94fd06f          	j	1660 <__GI_close>

000042d0 <.L5>:
    42d0:	00c12083          	lw	ra,12(sp)
    42d4:	00812403          	lw	s0,8(sp)
    42d8:	0000c797          	auipc	a5,0xc
    42dc:	13c7a783          	lw	a5,316(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    42e0:	00900713          	li	a4,9
    42e4:	00e7a023          	sw	a4,0(a5)
    42e8:	00412483          	lw	s1,4(sp)
    42ec:	fff00513          	li	a0,-1
    42f0:	01010113          	add	sp,sp,16
    42f4:	00008067          	ret

000042f8 <fd_to_DIR>:
    42f8:	ff010113          	add	sp,sp,-16
    42fc:	01212023          	sw	s2,0(sp)
    4300:	00050913          	mv	s2,a0
    4304:	01c00513          	li	a0,28
    4308:	00912223          	sw	s1,4(sp)
    430c:	00112623          	sw	ra,12(sp)
    4310:	00812423          	sw	s0,8(sp)
    4314:	00058493          	mv	s1,a1
    4318:	fb1fe0ef          	jal	32c8 <malloc>
    431c:	04050263          	beqz	a0,4360 <.L2>
    4320:	01252023          	sw	s2,0(a0)
    4324:	00052823          	sw	zero,16(a0)
    4328:	00052423          	sw	zero,8(a0)
    432c:	00052223          	sw	zero,4(a0)
    4330:	20000793          	li	a5,512
    4334:	00050413          	mv	s0,a0
    4338:	00048593          	mv	a1,s1
    433c:	00f4f463          	bgeu	s1,a5,4344 <.L3>
    4340:	20000593          	li	a1,512

00004344 <.L3>:
    4344:	00b42a23          	sw	a1,20(s0)
    4348:	00100513          	li	a0,1
    434c:	10c020ef          	jal	6458 <calloc>
    4350:	00a42623          	sw	a0,12(s0)
    4354:	00051863          	bnez	a0,4364 <.L1>
    4358:	00040513          	mv	a0,s0
    435c:	984ff0ef          	jal	34e0 <free>

00004360 <.L2>:
    4360:	00000413          	li	s0,0

00004364 <.L1>:
    4364:	00c12083          	lw	ra,12(sp)
    4368:	00040513          	mv	a0,s0
    436c:	00812403          	lw	s0,8(sp)
    4370:	00412483          	lw	s1,4(sp)
    4374:	00012903          	lw	s2,0(sp)
    4378:	01010113          	add	sp,sp,16
    437c:	00008067          	ret

00004380 <fdopendir>:
    4380:	f8010113          	add	sp,sp,-128
    4384:	00810593          	add	a1,sp,8
    4388:	06812c23          	sw	s0,120(sp)
    438c:	06112e23          	sw	ra,124(sp)
    4390:	00050413          	mv	s0,a0
    4394:	6f9020ef          	jal	728c <__GI_fstat64>
    4398:	02051463          	bnez	a0,43c0 <.L11>
    439c:	01812703          	lw	a4,24(sp)
    43a0:	0000f7b7          	lui	a5,0xf
    43a4:	00e7f7b3          	and	a5,a5,a4
    43a8:	00004737          	lui	a4,0x4
    43ac:	02e78463          	beq	a5,a4,43d4 <.L12>
    43b0:	0000c797          	auipc	a5,0xc
    43b4:	0647a783          	lw	a5,100(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    43b8:	01400713          	li	a4,20

000043bc <.L17>:
    43bc:	00e7a023          	sw	a4,0(a5)

000043c0 <.L11>:
    43c0:	00000513          	li	a0,0

000043c4 <.L9>:
    43c4:	07c12083          	lw	ra,124(sp)
    43c8:	07812403          	lw	s0,120(sp)
    43cc:	08010113          	add	sp,sp,128
    43d0:	00008067          	ret

000043d4 <.L12>:
    43d4:	00300593          	li	a1,3
    43d8:	00040513          	mv	a0,s0
    43dc:	635020ef          	jal	7210 <__GI_fcntl>
    43e0:	fff00793          	li	a5,-1
    43e4:	fcf50ee3          	beq	a0,a5,43c0 <.L11>
    43e8:	00357793          	and	a5,a0,3
    43ec:	00100713          	li	a4,1
    43f0:	00e79a63          	bne	a5,a4,4404 <.L15>
    43f4:	0000c797          	auipc	a5,0xc
    43f8:	0207a783          	lw	a5,32(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    43fc:	01600713          	li	a4,22
    4400:	fbdff06f          	j	43bc <.L17>

00004404 <.L15>:
    4404:	04012583          	lw	a1,64(sp)
    4408:	00040513          	mv	a0,s0
    440c:	eedff0ef          	jal	42f8 <fd_to_DIR>
    4410:	fb5ff06f          	j	43c4 <.L9>

00004414 <__GI_opendir>:
    4414:	000915b7          	lui	a1,0x91
    4418:	f8010113          	add	sp,sp,-128
    441c:	80058593          	add	a1,a1,-2048 # 90800 <_ebss+0x7a750>
    4420:	06112e23          	sw	ra,124(sp)
    4424:	06812c23          	sw	s0,120(sp)
    4428:	06912a23          	sw	s1,116(sp)
    442c:	b64fd0ef          	jal	1790 <__open2_nocancel>
    4430:	00054e63          	bltz	a0,444c <.L19>
    4434:	00810593          	add	a1,sp,8
    4438:	00050413          	mv	s0,a0
    443c:	651020ef          	jal	728c <__GI_fstat64>
    4440:	02055463          	bgez	a0,4468 <.L20>
    4444:	00040513          	mv	a0,s0
    4448:	a40fd0ef          	jal	1688 <__close_nocancel_no_status>

0000444c <.L19>:
    444c:	00000493          	li	s1,0

00004450 <.L18>:
    4450:	07c12083          	lw	ra,124(sp)
    4454:	07812403          	lw	s0,120(sp)
    4458:	00048513          	mv	a0,s1
    445c:	07412483          	lw	s1,116(sp)
    4460:	08010113          	add	sp,sp,128
    4464:	00008067          	ret

00004468 <.L20>:
    4468:	00100613          	li	a2,1
    446c:	00200593          	li	a1,2
    4470:	00040513          	mv	a0,s0
    4474:	551020ef          	jal	71c4 <__fcntl_nocancel>
    4478:	04012583          	lw	a1,64(sp)
    447c:	00040513          	mv	a0,s0
    4480:	e79ff0ef          	jal	42f8 <fd_to_DIR>
    4484:	00050493          	mv	s1,a0
    4488:	fc0514e3          	bnez	a0,4450 <.L18>
    448c:	00040513          	mv	a0,s0
    4490:	9f8fd0ef          	jal	1688 <__close_nocancel_no_status>
    4494:	fbdff06f          	j	4450 <.L18>

00004498 <__GI_readdir64>:
    4498:	ff010113          	add	sp,sp,-16
    449c:	00812423          	sw	s0,8(sp)
    44a0:	00112623          	sw	ra,12(sp)
    44a4:	00050413          	mv	s0,a0

000044a8 <.L4>:
    44a8:	00842703          	lw	a4,8(s0)
    44ac:	00442783          	lw	a5,4(s0)
    44b0:	00c42583          	lw	a1,12(s0)
    44b4:	00e7ee63          	bltu	a5,a4,44d0 <.L2>
    44b8:	01442603          	lw	a2,20(s0)
    44bc:	00042503          	lw	a0,0(s0)
    44c0:	5f5020ef          	jal	72b4 <__getdents>
    44c4:	04a05663          	blez	a0,4510 <.L6>
    44c8:	00a42423          	sw	a0,8(s0)
    44cc:	00042223          	sw	zero,4(s0)

000044d0 <.L2>:
    44d0:	00442703          	lw	a4,4(s0)
    44d4:	00c42503          	lw	a0,12(s0)
    44d8:	00e50533          	add	a0,a0,a4
    44dc:	01055783          	lhu	a5,16(a0)
    44e0:	00e787b3          	add	a5,a5,a4
    44e4:	00f42223          	sw	a5,4(s0)
    44e8:	00852783          	lw	a5,8(a0)
    44ec:	00452703          	lw	a4,4(a0)
    44f0:	00f42823          	sw	a5,16(s0)
    44f4:	00052783          	lw	a5,0(a0)
    44f8:	00e7e7b3          	or	a5,a5,a4
    44fc:	fa0786e3          	beqz	a5,44a8 <.L4>

00004500 <.L1>:
    4500:	00c12083          	lw	ra,12(sp)
    4504:	00812403          	lw	s0,8(sp)
    4508:	01010113          	add	sp,sp,16
    450c:	00008067          	ret

00004510 <.L6>:
    4510:	00000513          	li	a0,0
    4514:	fedff06f          	j	4500 <.L1>

00004518 <__errno_location>:
    4518:	0000c517          	auipc	a0,0xc
    451c:	efc52503          	lw	a0,-260(a0) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    4520:	00008067          	ret

00004524 <__h_errno_location>:
    4524:	0000c517          	auipc	a0,0xc
    4528:	efc52503          	lw	a0,-260(a0) # 10420 <_GLOBAL_OFFSET_TABLE_+0x18>
    452c:	00008067          	ret

00004530 <__GI_config_open>:
    4530:	ff010113          	add	sp,sp,-16
    4534:	0000e597          	auipc	a1,0xe
    4538:	c0458593          	add	a1,a1,-1020 # 12138 <.LC0>
    453c:	00812423          	sw	s0,8(sp)
    4540:	00112623          	sw	ra,12(sp)
    4544:	494000ef          	jal	49d8 <__GI_fopen>
    4548:	00050413          	mv	s0,a0
    454c:	00050c63          	beqz	a0,4564 <.L1>
    4550:	01800593          	li	a1,24
    4554:	00100513          	li	a0,1
    4558:	701010ef          	jal	6458 <calloc>
    455c:	00051e63          	bnez	a0,4578 <.L3>

00004560 <.L4>:
    4560:	00050413          	mv	s0,a0

00004564 <.L1>:
    4564:	00c12083          	lw	ra,12(sp)
    4568:	00040513          	mv	a0,s0
    456c:	00812403          	lw	s0,8(sp)
    4570:	01010113          	add	sp,sp,16
    4574:	00008067          	ret

00004578 <.L3>:
    4578:	00852023          	sw	s0,0(a0)
    457c:	fe5ff06f          	j	4560 <.L4>

00004580 <__GI_config_close>:
    4580:	04050063          	beqz	a0,45c0 <.L9>
    4584:	ff010113          	add	sp,sp,-16
    4588:	00812423          	sw	s0,8(sp)
    458c:	00050413          	mv	s0,a0
    4590:	00052503          	lw	a0,0(a0)
    4594:	00112623          	sw	ra,12(sp)
    4598:	358000ef          	jal	48f0 <__GI_fclose>
    459c:	01442783          	lw	a5,20(s0)
    45a0:	00078663          	beqz	a5,45ac <.L11>
    45a4:	00442503          	lw	a0,4(s0)
    45a8:	f39fe0ef          	jal	34e0 <free>

000045ac <.L11>:
    45ac:	00040513          	mv	a0,s0
    45b0:	00812403          	lw	s0,8(sp)
    45b4:	00c12083          	lw	ra,12(sp)
    45b8:	01010113          	add	sp,sp,16
    45bc:	f25fe06f          	j	34e0 <free>

000045c0 <.L9>:
    45c0:	00008067          	ret

000045c4 <__GI_config_read>:
    45c4:	fa010113          	add	sp,sp,-96
    45c8:	04112e23          	sw	ra,92(sp)
    45cc:	04812c23          	sw	s0,88(sp)
    45d0:	04912a23          	sw	s1,84(sp)
    45d4:	05212823          	sw	s2,80(sp)
    45d8:	05312623          	sw	s3,76(sp)
    45dc:	05412423          	sw	s4,72(sp)
    45e0:	05512223          	sw	s5,68(sp)
    45e4:	05612023          	sw	s6,64(sp)
    45e8:	03712e23          	sw	s7,60(sp)
    45ec:	03812c23          	sw	s8,56(sp)
    45f0:	03912a23          	sw	s9,52(sp)
    45f4:	03a12823          	sw	s10,48(sp)
    45f8:	03b12623          	sw	s11,44(sp)
    45fc:	0e050063          	beqz	a0,46dc <.L20>
    4600:	0ff67a13          	zext.b	s4,a2
    4604:	002a1793          	sll	a5,s4,0x2
    4608:	00865a93          	srl	s5,a2,0x8
    460c:	00f12623          	sw	a5,12(sp)
    4610:	000209b7          	lui	s3,0x20
    4614:	00178793          	add	a5,a5,1
    4618:	00040b37          	lui	s6,0x40
    461c:	00010bb7          	lui	s7,0x10
    4620:	00050c93          	mv	s9,a0
    4624:	00058913          	mv	s2,a1
    4628:	00060493          	mv	s1,a2
    462c:	00068413          	mv	s0,a3
    4630:	0ffafa93          	zext.b	s5,s5
    4634:	00f12823          	sw	a5,16(sp)
    4638:	013679b3          	and	s3,a2,s3
    463c:	01667b33          	and	s6,a2,s6
    4640:	01767bb3          	and	s7,a2,s7

00004644 <.L21>:
    4644:	004ca683          	lw	a3,4(s9)
    4648:	010ca703          	lw	a4,16(s9)
    464c:	04069263          	bnez	a3,4690 <.L22>
    4650:	00071663          	bnez	a4,465c <.L23>
    4654:	05100713          	li	a4,81
    4658:	00eca823          	sw	a4,16(s9)

0000465c <.L23>:
    465c:	008ca703          	lw	a4,8(s9)
    4660:	00071663          	bnez	a4,466c <.L24>
    4664:	01012783          	lw	a5,16(sp)
    4668:	00fca423          	sw	a5,8(s9)

0000466c <.L24>:
    466c:	008ca503          	lw	a0,8(s9)
    4670:	010ca703          	lw	a4,16(s9)
    4674:	00e50533          	add	a0,a0,a4
    4678:	c51fe0ef          	jal	32c8 <malloc>
    467c:	00aca223          	sw	a0,4(s9)
    4680:	04050e63          	beqz	a0,46dc <.L20>
    4684:	014ca703          	lw	a4,20(s9)
    4688:	00176713          	or	a4,a4,1
    468c:	00ecaa23          	sw	a4,20(s9)

00004690 <.L22>:
    4690:	004ca703          	lw	a4,4(s9)
    4694:	008ca683          	lw	a3,8(s9)
    4698:	00000d93          	li	s11,0
    469c:	00002c37          	lui	s8,0x2
    46a0:	00d70733          	add	a4,a4,a3
    46a4:	00eca623          	sw	a4,12(s9)
    46a8:	05c00d13          	li	s10,92

000046ac <.L26>:
    46ac:	010ca583          	lw	a1,16(s9)
    46b0:	00cca503          	lw	a0,12(s9)
    46b4:	000ca603          	lw	a2,0(s9)
    46b8:	41b585b3          	sub	a1,a1,s11
    46bc:	01b50533          	add	a0,a0,s11
    46c0:	05d010ef          	jal	5f1c <__GI_fgets>
    46c4:	00cca703          	lw	a4,12(s9)
    46c8:	04051c63          	bnez	a0,4720 <.L27>
    46cc:	010ca603          	lw	a2,16(s9)
    46d0:	00000593          	li	a1,0
    46d4:	00070513          	mv	a0,a4
    46d8:	ec0fe0ef          	jal	2d98 <__GI_memset>

000046dc <.L20>:
    46dc:	00000d93          	li	s11,0

000046e0 <.L18>:
    46e0:	05c12083          	lw	ra,92(sp)
    46e4:	05812403          	lw	s0,88(sp)
    46e8:	05412483          	lw	s1,84(sp)
    46ec:	05012903          	lw	s2,80(sp)
    46f0:	04c12983          	lw	s3,76(sp)
    46f4:	04812a03          	lw	s4,72(sp)
    46f8:	04412a83          	lw	s5,68(sp)
    46fc:	04012b03          	lw	s6,64(sp)
    4700:	03c12b83          	lw	s7,60(sp)
    4704:	03812c03          	lw	s8,56(sp)
    4708:	03412c83          	lw	s9,52(sp)
    470c:	03012d03          	lw	s10,48(sp)
    4710:	000d8513          	mv	a0,s11
    4714:	02c12d83          	lw	s11,44(sp)
    4718:	06010113          	add	sp,sp,96
    471c:	00008067          	ret

00004720 <.L27>:
    4720:	01b70533          	add	a0,a4,s11
    4724:	00e12a23          	sw	a4,20(sp)
    4728:	f14fe0ef          	jal	2e3c <__GI_strlen>
    472c:	01412703          	lw	a4,20(sp)
    4730:	00ad8db3          	add	s11,s11,a0
    4734:	00a00593          	li	a1,10
    4738:	00070513          	mv	a0,a4
    473c:	289010ef          	jal	61c4 <__GI_strchr>
    4740:	02050063          	beqz	a0,4760 <.L29>
    4744:	00054703          	lbu	a4,0(a0)
    4748:	fff70713          	add	a4,a4,-1 # 3fff <_dl_aux_init+0x3>
    474c:	0ff77713          	zext.b	a4,a4
    4750:	00e50023          	sb	a4,0(a0)
    4754:	0fa71a63          	bne	a4,s10,4848 <.L30>
    4758:	ffed8d93          	add	s11,s11,-2
    475c:	f51ff06f          	j	46ac <.L26>

00004760 <.L29>:
    4760:	014ca703          	lw	a4,20(s9)
    4764:	02071863          	bnez	a4,4794 <.L72>
    4768:	fff00d13          	li	s10,-1
    476c:	00a00c13          	li	s8,10

00004770 <.L32>:
    4770:	000ca503          	lw	a0,0(s9)
    4774:	01052703          	lw	a4,16(a0)
    4778:	01852683          	lw	a3,24(a0)
    477c:	04d77463          	bgeu	a4,a3,47c4 <.L33>
    4780:	00170693          	add	a3,a4,1
    4784:	00d52823          	sw	a3,16(a0)
    4788:	00074503          	lbu	a0,0(a4)

0000478c <.L34>:
    478c:	ff8512e3          	bne	a0,s8,4770 <.L32>
    4790:	03c0006f          	j	47cc <.L35>

00004794 <.L72>:
    4794:	010ca703          	lw	a4,16(s9)
    4798:	008ca583          	lw	a1,8(s9)
    479c:	004ca503          	lw	a0,4(s9)
    47a0:	00ec0733          	add	a4,s8,a4
    47a4:	00eca823          	sw	a4,16(s9)
    47a8:	00b705b3          	add	a1,a4,a1
    47ac:	511010ef          	jal	64bc <realloc>
    47b0:	008ca703          	lw	a4,8(s9)
    47b4:	00aca223          	sw	a0,4(s9)
    47b8:	00e50533          	add	a0,a0,a4
    47bc:	00aca623          	sw	a0,12(s9)
    47c0:	eedff06f          	j	46ac <.L26>

000047c4 <.L33>:
    47c4:	64c010ef          	jal	5e10 <__GI___fgetc_unlocked>
    47c8:	fda512e3          	bne	a0,s10,478c <.L34>

000047cc <.L35>:
    47cc:	fff00713          	li	a4,-1
    47d0:	f0ed86e3          	beq	s11,a4,46dc <.L20>
    47d4:	00ccad03          	lw	s10,12(s9)
    47d8:	00098a63          	beqz	s3,47ec <.L37>
    47dc:	000d0513          	mv	a0,s10
    47e0:	00140593          	add	a1,s0,1
    47e4:	439010ef          	jal	641c <__GI_strspn>
    47e8:	00ad0d33          	add	s10,s10,a0

000047ec <.L37>:
    47ec:	000d4683          	lbu	a3,0(s10)
    47f0:	004ca503          	lw	a0,4(s9)
    47f4:	e40688e3          	beqz	a3,4644 <.L21>
    47f8:	00044603          	lbu	a2,0(s0)
    47fc:	e4d604e3          	beq	a2,a3,4644 <.L21>
    4800:	00c12603          	lw	a2,12(sp)
    4804:	00a92023          	sw	a0,0(s2)
    4808:	00000593          	li	a1,0
    480c:	d8cfe0ef          	jal	2d98 <__GI_memset>
    4810:	fffa0793          	add	a5,s4,-1
    4814:	00f12c23          	sw	a5,24(sp)
    4818:	00140793          	add	a5,s0,1
    481c:	00000d93          	li	s11,0
    4820:	00f12e23          	sw	a5,28(sp)

00004824 <.L39>:
    4824:	000d4603          	lbu	a2,0(s10)
    4828:	00060863          	beqz	a2,4838 <.L51>
    482c:	00044583          	lbu	a1,0(s0)
    4830:	00c58463          	beq	a1,a2,4838 <.L51>
    4834:	014dce63          	blt	s11,s4,4850 <.L52>

00004838 <.L51>:
    4838:	eb5dd4e3          	bge	s11,s5,46e0 <.L18>
    483c:	00b49713          	sll	a4,s1,0xb
    4840:	e00752e3          	bgez	a4,4644 <.L21>
    4844:	e99ff06f          	j	46dc <.L20>

00004848 <.L30>:
    4848:	fffd8d93          	add	s11,s11,-1
    484c:	f81ff06f          	j	47cc <.L35>

00004850 <.L52>:
    4850:	00092603          	lw	a2,0(s2)
    4854:	002d9593          	sll	a1,s11,0x2
    4858:	01812783          	lw	a5,24(sp)
    485c:	00b60633          	add	a2,a2,a1
    4860:	01a62023          	sw	s10,0(a2)
    4864:	00044c03          	lbu	s8,0(s0)
    4868:	01b79463          	bne	a5,s11,4870 <.L40>
    486c:	040b1063          	bnez	s6,48ac <.L41>

00004870 <.L40>:
    4870:	001c3593          	seqz	a1,s8
    4874:	000d0513          	mv	a0,s10
    4878:	00b405b3          	add	a1,s0,a1
    487c:	2d9010ef          	jal	6354 <__GI_strcspn>
    4880:	00ad0d33          	add	s10,s10,a0

00004884 <.L43>:
    4884:	000d4603          	lbu	a2,0(s10)
    4888:	04cc1c63          	bne	s8,a2,48e0 <.L46>
    488c:	000d0023          	sb	zero,0(s10)

00004890 <.L49>:
    4890:	000b8a63          	beqz	s7,48a4 <.L50>
    4894:	01c12583          	lw	a1,28(sp)
    4898:	000d0513          	mv	a0,s10
    489c:	381010ef          	jal	641c <__GI_strspn>
    48a0:	00ad0d33          	add	s10,s10,a0

000048a4 <.L50>:
    48a4:	001d8d93          	add	s11,s11,1
    48a8:	f7dff06f          	j	4824 <.L39>

000048ac <.L41>:
    48ac:	000d0513          	mv	a0,s10
    48b0:	000c0593          	mv	a1,s8
    48b4:	1cd010ef          	jal	6280 <__GI_strchrnul>
    48b8:	00050d13          	mv	s10,a0
    48bc:	fc0984e3          	beqz	s3,4884 <.L43>
    48c0:	00140793          	add	a5,s0,1
    48c4:	00f12a23          	sw	a5,20(sp)

000048c8 <.L44>:
    48c8:	fffd4583          	lbu	a1,-1(s10)
    48cc:	01412503          	lw	a0,20(sp)
    48d0:	0f5010ef          	jal	61c4 <__GI_strchr>
    48d4:	fa0508e3          	beqz	a0,4884 <.L43>
    48d8:	fffd0d13          	add	s10,s10,-1
    48dc:	fedff06f          	j	48c8 <.L44>

000048e0 <.L46>:
    48e0:	fa0608e3          	beqz	a2,4890 <.L49>
    48e4:	000d0023          	sb	zero,0(s10)
    48e8:	001d0d13          	add	s10,s10,1
    48ec:	fa5ff06f          	j	4890 <.L49>

000048f0 <__GI_fclose>:
    48f0:	0000c717          	auipc	a4,0xc
    48f4:	b3472703          	lw	a4,-1228(a4) # 10424 <_GLOBAL_OFFSET_TABLE_+0x1c>
    48f8:	00072783          	lw	a5,0(a4)
    48fc:	ff010113          	add	sp,sp,-16
    4900:	00812423          	sw	s0,8(sp)
    4904:	00112623          	sw	ra,12(sp)
    4908:	00912223          	sw	s1,4(sp)
    490c:	00050413          	mv	s0,a0
    4910:	0aa79463          	bne	a5,a0,49b8 <.L2>
    4914:	02052783          	lw	a5,32(a0)
    4918:	00f72023          	sw	a5,0(a4)

0000491c <.L3>:
    491c:	00045783          	lhu	a5,0(s0)
    4920:	00000493          	li	s1,0
    4924:	0407f793          	and	a5,a5,64
    4928:	00078863          	beqz	a5,4938 <.L5>
    492c:	00040513          	mv	a0,s0
    4930:	408010ef          	jal	5d38 <__GI_fflush>
    4934:	00050493          	mv	s1,a0

00004938 <.L5>:
    4938:	00442503          	lw	a0,4(s0)
    493c:	ffe00793          	li	a5,-2
    4940:	08f51863          	bne	a0,a5,49d0 <.L6>
    4944:	03442783          	lw	a5,52(s0)
    4948:	00078a63          	beqz	a5,495c <.L9>
    494c:	02442503          	lw	a0,36(s0)
    4950:	000780e7          	jalr	a5

00004954 <.L8>:
    4954:	00055463          	bgez	a0,495c <.L9>
    4958:	fff00493          	li	s1,-1

0000495c <.L9>:
    495c:	00045703          	lhu	a4,0(s0)
    4960:	fff00793          	li	a5,-1
    4964:	00f42223          	sw	a5,4(s0)
    4968:	000067b7          	lui	a5,0x6
    496c:	00f777b3          	and	a5,a4,a5
    4970:	0307e793          	or	a5,a5,48
    4974:	00f41023          	sh	a5,0(s0)
    4978:	01171793          	sll	a5,a4,0x11
    497c:	0007d663          	bgez	a5,4988 <.L10>
    4980:	00842503          	lw	a0,8(s0)
    4984:	b5dfe0ef          	jal	34e0 <free>

00004988 <.L10>:
    4988:	00045783          	lhu	a5,0(s0)
    498c:	01279713          	sll	a4,a5,0x12
    4990:	00075663          	bgez	a4,499c <.L1>
    4994:	00040513          	mv	a0,s0
    4998:	b49fe0ef          	jal	34e0 <free>

0000499c <.L1>:
    499c:	00c12083          	lw	ra,12(sp)
    49a0:	00812403          	lw	s0,8(sp)
    49a4:	00048513          	mv	a0,s1
    49a8:	00412483          	lw	s1,4(sp)
    49ac:	01010113          	add	sp,sp,16
    49b0:	00008067          	ret

000049b4 <.L12>:
    49b4:	00070793          	mv	a5,a4

000049b8 <.L2>:
    49b8:	f60782e3          	beqz	a5,491c <.L3>
    49bc:	0207a703          	lw	a4,32(a5) # 6020 <.L4+0x18>
    49c0:	fe871ae3          	bne	a4,s0,49b4 <.L12>
    49c4:	02042703          	lw	a4,32(s0)
    49c8:	02e7a023          	sw	a4,32(a5)
    49cc:	f51ff06f          	j	491c <.L3>

000049d0 <.L6>:
    49d0:	c91fc0ef          	jal	1660 <__GI_close>
    49d4:	f81ff06f          	j	4954 <.L8>

000049d8 <__GI_fopen>:
    49d8:	fff00693          	li	a3,-1
    49dc:	00000613          	li	a2,0
    49e0:	16c0006f          	j	4b4c <_stdio_fopen>

000049e4 <__stdio_WRITE>:
    49e4:	fd010113          	add	sp,sp,-48
    49e8:	01512a23          	sw	s5,20(sp)
    49ec:	80000ab7          	lui	s5,0x80000
    49f0:	02812423          	sw	s0,40(sp)
    49f4:	02912223          	sw	s1,36(sp)
    49f8:	03212023          	sw	s2,32(sp)
    49fc:	01312e23          	sw	s3,28(sp)
    4a00:	01612823          	sw	s6,16(sp)
    4a04:	01712623          	sw	s7,12(sp)
    4a08:	01812423          	sw	s8,8(sp)
    4a0c:	02112623          	sw	ra,44(sp)
    4a10:	01412c23          	sw	s4,24(sp)
    4a14:	00050493          	mv	s1,a0
    4a18:	00058413          	mv	s0,a1
    4a1c:	00060993          	mv	s3,a2
    4a20:	00060913          	mv	s2,a2
    4a24:	fffa8a93          	add	s5,s5,-1 # 7fffffff <_ebss+0x7ffe9f4f>
    4a28:	ffe00b93          	li	s7,-2
    4a2c:	0000cb17          	auipc	s6,0xc
    4a30:	9e8b2b03          	lw	s6,-1560(s6) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    4a34:	00b00c13          	li	s8,11

00004a38 <.L2>:
    4a38:	04090c63          	beqz	s2,4a90 <.L10>
    4a3c:	00090a13          	mv	s4,s2
    4a40:	00090613          	mv	a2,s2
    4a44:	00095463          	bgez	s2,4a4c <.L3>
    4a48:	000a8613          	mv	a2,s5

00004a4c <.L3>:
    4a4c:	0044a503          	lw	a0,4(s1)
    4a50:	09751c63          	bne	a0,s7,4ae8 <.L4>
    4a54:	02c4a783          	lw	a5,44(s1)
    4a58:	06079663          	bnez	a5,4ac4 <.L5>
    4a5c:	01600793          	li	a5,22
    4a60:	00fb2023          	sw	a5,0(s6)

00004a64 <.L6>:
    4a64:	0004d783          	lhu	a5,0(s1)
    4a68:	00400713          	li	a4,4
    4a6c:	0087e793          	or	a5,a5,8
    4a70:	00f49023          	sh	a5,0(s1)
    4a74:	0000c797          	auipc	a5,0xc
    4a78:	9a07a783          	lw	a5,-1632(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    4a7c:	0007a783          	lw	a5,0(a5)
    4a80:	06e78a63          	beq	a5,a4,4af4 <.L9>
    4a84:	00b00713          	li	a4,11
    4a88:	06e78663          	beq	a5,a4,4af4 <.L9>

00004a8c <.L11>:
    4a8c:	412989b3          	sub	s3,s3,s2

00004a90 <.L10>:
    4a90:	02c12083          	lw	ra,44(sp)
    4a94:	02812403          	lw	s0,40(sp)
    4a98:	02412483          	lw	s1,36(sp)
    4a9c:	02012903          	lw	s2,32(sp)
    4aa0:	01812a03          	lw	s4,24(sp)
    4aa4:	01412a83          	lw	s5,20(sp)
    4aa8:	01012b03          	lw	s6,16(sp)
    4aac:	00c12b83          	lw	s7,12(sp)
    4ab0:	00812c03          	lw	s8,8(sp)
    4ab4:	00098513          	mv	a0,s3
    4ab8:	01c12983          	lw	s3,28(sp)
    4abc:	03010113          	add	sp,sp,48
    4ac0:	00008067          	ret

00004ac4 <.L5>:
    4ac4:	0244a503          	lw	a0,36(s1)
    4ac8:	018b2023          	sw	s8,0(s6)
    4acc:	00040593          	mv	a1,s0
    4ad0:	000780e7          	jalr	a5
    4ad4:	f80508e3          	beqz	a0,4a64 <.L6>

00004ad8 <.L7>:
    4ad8:	f80546e3          	bltz	a0,4a64 <.L6>
    4adc:	40a90933          	sub	s2,s2,a0
    4ae0:	00a40433          	add	s0,s0,a0
    4ae4:	f55ff06f          	j	4a38 <.L2>

00004ae8 <.L4>:
    4ae8:	00040593          	mv	a1,s0
    4aec:	cf9fc0ef          	jal	17e4 <__GI_write>
    4af0:	fe9ff06f          	j	4ad8 <.L7>

00004af4 <.L9>:
    4af4:	0084a783          	lw	a5,8(s1)
    4af8:	00c4a683          	lw	a3,12(s1)
    4afc:	40f68733          	sub	a4,a3,a5
    4b00:	f8f686e3          	beq	a3,a5,4a8c <.L11>
    4b04:	00e96463          	bltu	s2,a4,4b0c <.L12>
    4b08:	00070a13          	mv	s4,a4

00004b0c <.L12>:
    4b0c:	00a00693          	li	a3,10
    4b10:	01440a33          	add	s4,s0,s4

00004b14 <.L15>:
    4b14:	00044703          	lbu	a4,0(s0)
    4b18:	00e78023          	sb	a4,0(a5)
    4b1c:	00d71863          	bne	a4,a3,4b2c <.L13>
    4b20:	0004d703          	lhu	a4,0(s1)
    4b24:	10077713          	and	a4,a4,256
    4b28:	00071863          	bnez	a4,4b38 <.L14>

00004b2c <.L13>:
    4b2c:	00140413          	add	s0,s0,1
    4b30:	00178793          	add	a5,a5,1
    4b34:	ff4410e3          	bne	s0,s4,4b14 <.L15>

00004b38 <.L14>:
    4b38:	0084a703          	lw	a4,8(s1)
    4b3c:	00f4a823          	sw	a5,16(s1)
    4b40:	40e787b3          	sub	a5,a5,a4
    4b44:	40f90933          	sub	s2,s2,a5
    4b48:	f45ff06f          	j	4a8c <.L11>

00004b4c <_stdio_fopen>:
    4b4c:	fe010113          	add	sp,sp,-32
    4b50:	00812c23          	sw	s0,24(sp)
    4b54:	01212823          	sw	s2,16(sp)
    4b58:	01312623          	sw	s3,12(sp)
    4b5c:	00112e23          	sw	ra,28(sp)
    4b60:	00912a23          	sw	s1,20(sp)
    4b64:	0005c783          	lbu	a5,0(a1)
    4b68:	07200713          	li	a4,114
    4b6c:	00050913          	mv	s2,a0
    4b70:	00060413          	mv	s0,a2
    4b74:	00068993          	mv	s3,a3
    4b78:	04e78663          	beq	a5,a4,4bc4 <.L26>
    4b7c:	07700713          	li	a4,119
    4b80:	0ee78663          	beq	a5,a4,4c6c <.L27>
    4b84:	06100713          	li	a4,97
    4b88:	0ee78663          	beq	a5,a4,4c74 <.L28>
    4b8c:	0000c797          	auipc	a5,0xc
    4b90:	8887a783          	lw	a5,-1912(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    4b94:	01600713          	li	a4,22
    4b98:	00e7a023          	sw	a4,0(a5)
    4b9c:	0a061c63          	bnez	a2,4c54 <.L5>

00004ba0 <.L8>:
    4ba0:	00000413          	li	s0,0

00004ba4 <.L6>:
    4ba4:	01c12083          	lw	ra,28(sp)
    4ba8:	00040513          	mv	a0,s0
    4bac:	01812403          	lw	s0,24(sp)
    4bb0:	01412483          	lw	s1,20(sp)
    4bb4:	01012903          	lw	s2,16(sp)
    4bb8:	00c12983          	lw	s3,12(sp)
    4bbc:	02010113          	add	sp,sp,32
    4bc0:	00008067          	ret

00004bc4 <.L26>:
    4bc4:	00000493          	li	s1,0

00004bc8 <.L2>:
    4bc8:	0015c703          	lbu	a4,1(a1)
    4bcc:	06200793          	li	a5,98
    4bd0:	00f71463          	bne	a4,a5,4bd8 <.L9>
    4bd4:	00158593          	add	a1,a1,1

00004bd8 <.L9>:
    4bd8:	0015c703          	lbu	a4,1(a1)
    4bdc:	02b00793          	li	a5,43
    4be0:	00f71863          	bne	a4,a5,4bf0 <.L10>
    4be4:	0014e493          	or	s1,s1,1
    4be8:	00158593          	add	a1,a1,1
    4bec:	00148493          	add	s1,s1,1

00004bf0 <.L10>:
    4bf0:	07800713          	li	a4,120

00004bf4 <.L11>:
    4bf4:	0015c783          	lbu	a5,1(a1)
    4bf8:	00158593          	add	a1,a1,1
    4bfc:	08079063          	bnez	a5,4c7c <.L13>
    4c00:	02041063          	bnez	s0,4c20 <.L14>
    4c04:	02400513          	li	a0,36
    4c08:	ec0fe0ef          	jal	32c8 <malloc>
    4c0c:	00050413          	mv	s0,a0
    4c10:	f80508e3          	beqz	a0,4ba0 <.L8>
    4c14:	000027b7          	lui	a5,0x2
    4c18:	00f51023          	sh	a5,0(a0)
    4c1c:	00052423          	sw	zero,8(a0)

00004c20 <.L14>:
    4c20:	1609c263          	bltz	s3,4d84 <.L15>
    4c24:	000087b7          	lui	a5,0x8
    4c28:	00378793          	add	a5,a5,3 # 8003 <.L4+0x13>
    4c2c:	00f4f7b3          	and	a5,s1,a5
    4c30:	00178793          	add	a5,a5,1
    4c34:	00190713          	add	a4,s2,1
    4c38:	01342223          	sw	s3,4(s0)
    4c3c:	00f77733          	and	a4,a4,a5
    4c40:	04f70463          	beq	a4,a5,4c88 <.L16>

00004c44 <.L41>:
    4c44:	0000b797          	auipc	a5,0xb
    4c48:	7d07a783          	lw	a5,2000(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    4c4c:	01600713          	li	a4,22
    4c50:	00e7a023          	sw	a4,0(a5)

00004c54 <.L5>:
    4c54:	00045783          	lhu	a5,0(s0)
    4c58:	01279713          	sll	a4,a5,0x12
    4c5c:	f40752e3          	bgez	a4,4ba0 <.L8>
    4c60:	00040513          	mv	a0,s0
    4c64:	87dfe0ef          	jal	34e0 <free>
    4c68:	f39ff06f          	j	4ba0 <.L8>

00004c6c <.L27>:
    4c6c:	24100493          	li	s1,577
    4c70:	f59ff06f          	j	4bc8 <.L2>

00004c74 <.L28>:
    4c74:	44100493          	li	s1,1089
    4c78:	f51ff06f          	j	4bc8 <.L2>

00004c7c <.L13>:
    4c7c:	f6e79ce3          	bne	a5,a4,4bf4 <.L11>
    4c80:	0804e493          	or	s1,s1,128
    4c84:	f71ff06f          	j	4bf4 <.L11>

00004c88 <.L16>:
    4c88:	fff94793          	not	a5,s2
    4c8c:	0097f7b3          	and	a5,a5,s1
    4c90:	4007f793          	and	a5,a5,1024
    4c94:	0c079c63          	bnez	a5,4d6c <.L17>

00004c98 <.L20>:
    4c98:	000087b7          	lui	a5,0x8
    4c9c:	00f977b3          	and	a5,s2,a5
    4ca0:	00f4e4b3          	or	s1,s1,a5

00004ca4 <.L18>:
    4ca4:	00045783          	lhu	a5,0(s0)
    4ca8:	00002737          	lui	a4,0x2
    4cac:	00442503          	lw	a0,4(s0)
    4cb0:	00e7f7b3          	and	a5,a5,a4
    4cb4:	ffff8737          	lui	a4,0xffff8
    4cb8:	40070713          	add	a4,a4,1024 # ffff8400 <_ebss+0xfffe2350>
    4cbc:	00e4f733          	and	a4,s1,a4
    4cc0:	0034f493          	and	s1,s1,3
    4cc4:	00148493          	add	s1,s1,1
    4cc8:	0034c493          	xor	s1,s1,3
    4ccc:	00e7e7b3          	or	a5,a5,a4
    4cd0:	00449493          	sll	s1,s1,0x4
    4cd4:	0097e7b3          	or	a5,a5,s1
    4cd8:	00f41023          	sh	a5,0(s0)
    4cdc:	800007b7          	lui	a5,0x80000
    4ce0:	fff78793          	add	a5,a5,-1 # 7fffffff <_ebss+0x7ffe9f4f>
    4ce4:	02f50463          	beq	a0,a5,4d0c <.L22>
    4ce8:	0000b497          	auipc	s1,0xb
    4cec:	72c4a483          	lw	s1,1836(s1) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    4cf0:	0004a903          	lw	s2,0(s1)
    4cf4:	bc4fe0ef          	jal	30b8 <__GI_isatty>
    4cf8:	00050863          	beqz	a0,4d08 <.L23>
    4cfc:	00045783          	lhu	a5,0(s0)
    4d00:	1007e793          	or	a5,a5,256
    4d04:	00f41023          	sh	a5,0(s0)

00004d08 <.L23>:
    4d08:	0124a023          	sw	s2,0(s1)

00004d0c <.L22>:
    4d0c:	00842783          	lw	a5,8(s0)
    4d10:	02079863          	bnez	a5,4d40 <.L24>
    4d14:	00001537          	lui	a0,0x1
    4d18:	db0fe0ef          	jal	32c8 <malloc>
    4d1c:	00a42423          	sw	a0,8(s0)
    4d20:	08050863          	beqz	a0,4db0 <.L25>
    4d24:	000017b7          	lui	a5,0x1
    4d28:	00f50533          	add	a0,a0,a5
    4d2c:	00045783          	lhu	a5,0(s0)
    4d30:	00004737          	lui	a4,0x4
    4d34:	00a42623          	sw	a0,12(s0)
    4d38:	00e7e7b3          	or	a5,a5,a4
    4d3c:	00f41023          	sh	a5,0(s0)

00004d40 <.L24>:
    4d40:	00842783          	lw	a5,8(s0)
    4d44:	00f42c23          	sw	a5,24(s0)
    4d48:	00f42e23          	sw	a5,28(s0)
    4d4c:	00f42823          	sw	a5,16(s0)
    4d50:	00f42a23          	sw	a5,20(s0)
    4d54:	0000b797          	auipc	a5,0xb
    4d58:	6d07a783          	lw	a5,1744(a5) # 10424 <_GLOBAL_OFFSET_TABLE_+0x1c>
    4d5c:	0007a703          	lw	a4,0(a5)
    4d60:	0087a023          	sw	s0,0(a5)
    4d64:	02e42023          	sw	a4,32(s0)
    4d68:	e3dff06f          	j	4ba4 <.L6>

00004d6c <.L17>:
    4d6c:	40000613          	li	a2,1024
    4d70:	00400593          	li	a1,4
    4d74:	00098513          	mv	a0,s3
    4d78:	498020ef          	jal	7210 <__GI_fcntl>
    4d7c:	f0050ee3          	beqz	a0,4c98 <.L20>
    4d80:	ec5ff06f          	j	4c44 <.L41>

00004d84 <.L15>:
    4d84:	fff00793          	li	a5,-1
    4d88:	00f98663          	beq	s3,a5,4d94 <.L21>
    4d8c:	000087b7          	lui	a5,0x8
    4d90:	00f4e4b3          	or	s1,s1,a5

00004d94 <.L21>:
    4d94:	1b600613          	li	a2,438
    4d98:	00048593          	mv	a1,s1
    4d9c:	00090513          	mv	a0,s2
    4da0:	995fc0ef          	jal	1734 <__GI_open>
    4da4:	00a42223          	sw	a0,4(s0)
    4da8:	ee055ee3          	bgez	a0,4ca4 <.L18>
    4dac:	ea9ff06f          	j	4c54 <.L5>

00004db0 <.L25>:
    4db0:	00042623          	sw	zero,12(s0)
    4db4:	f8dff06f          	j	4d40 <.L24>

00004db8 <__stdio_fwrite>:
    4db8:	00065783          	lhu	a5,0(a2)
    4dbc:	fe010113          	add	sp,sp,-32
    4dc0:	00812c23          	sw	s0,24(sp)
    4dc4:	00912a23          	sw	s1,20(sp)
    4dc8:	01212823          	sw	s2,16(sp)
    4dcc:	00112e23          	sw	ra,28(sp)
    4dd0:	01312623          	sw	s3,12(sp)
    4dd4:	2007f793          	and	a5,a5,512
    4dd8:	00050913          	mv	s2,a0
    4ddc:	00058413          	mv	s0,a1
    4de0:	00060493          	mv	s1,a2
    4de4:	02078663          	beqz	a5,4e10 <.L2>

00004de8 <.L11>:
    4de8:	00040613          	mv	a2,s0
    4dec:	01812403          	lw	s0,24(sp)
    4df0:	01c12083          	lw	ra,28(sp)
    4df4:	00c12983          	lw	s3,12(sp)
    4df8:	00090593          	mv	a1,s2
    4dfc:	00048513          	mv	a0,s1
    4e00:	01012903          	lw	s2,16(sp)
    4e04:	01412483          	lw	s1,20(sp)
    4e08:	02010113          	add	sp,sp,32
    4e0c:	bd9ff06f          	j	49e4 <__stdio_WRITE>

00004e10 <.L2>:
    4e10:	01062503          	lw	a0,16(a2)
    4e14:	00c62783          	lw	a5,12(a2)
    4e18:	00462683          	lw	a3,4(a2)
    4e1c:	ffd00713          	li	a4,-3
    4e20:	40a787b3          	sub	a5,a5,a0
    4e24:	04e69463          	bne	a3,a4,4e6c <.L3>
    4e28:	00058993          	mv	s3,a1
    4e2c:	00b7f463          	bgeu	a5,a1,4e34 <.L4>
    4e30:	00078993          	mv	s3,a5

00004e34 <.L4>:
    4e34:	00098613          	mv	a2,s3
    4e38:	00090593          	mv	a1,s2
    4e3c:	cb5fd0ef          	jal	2af0 <__GI_memcpy>
    4e40:	0104a783          	lw	a5,16(s1)
    4e44:	013787b3          	add	a5,a5,s3

00004e48 <.L25>:
    4e48:	00f4a823          	sw	a5,16(s1)

00004e4c <.L5>:
    4e4c:	01c12083          	lw	ra,28(sp)
    4e50:	00040513          	mv	a0,s0
    4e54:	01812403          	lw	s0,24(sp)
    4e58:	01412483          	lw	s1,20(sp)
    4e5c:	01012903          	lw	s2,16(sp)
    4e60:	00c12983          	lw	s3,12(sp)
    4e64:	02010113          	add	sp,sp,32
    4e68:	00008067          	ret

00004e6c <.L3>:
    4e6c:	08b7e063          	bltu	a5,a1,4eec <.L6>
    4e70:	00058613          	mv	a2,a1
    4e74:	00090593          	mv	a1,s2
    4e78:	c79fd0ef          	jal	2af0 <__GI_memcpy>
    4e7c:	0104a783          	lw	a5,16(s1)
    4e80:	008787b3          	add	a5,a5,s0
    4e84:	00f4a823          	sw	a5,16(s1)
    4e88:	0004d783          	lhu	a5,0(s1)
    4e8c:	1007f793          	and	a5,a5,256
    4e90:	fa078ee3          	beqz	a5,4e4c <.L5>
    4e94:	00040613          	mv	a2,s0
    4e98:	00a00593          	li	a1,10
    4e9c:	00090513          	mv	a0,s2
    4ea0:	254010ef          	jal	60f4 <__GI_memrchr>
    4ea4:	fa0504e3          	beqz	a0,4e4c <.L5>
    4ea8:	00048513          	mv	a0,s1
    4eac:	aedfc0ef          	jal	1998 <__stdio_wcommit>
    4eb0:	f8050ee3          	beqz	a0,4e4c <.L5>
    4eb4:	00040613          	mv	a2,s0
    4eb8:	00857463          	bgeu	a0,s0,4ec0 <.L10>
    4ebc:	00050613          	mv	a2,a0

00004ec0 <.L10>:
    4ec0:	40c40533          	sub	a0,s0,a2
    4ec4:	00a00593          	li	a1,10
    4ec8:	00a90533          	add	a0,s2,a0
    4ecc:	12c010ef          	jal	5ff8 <__GI_memchr>
    4ed0:	f6050ee3          	beqz	a0,4e4c <.L5>
    4ed4:	0104a783          	lw	a5,16(s1)
    4ed8:	00890933          	add	s2,s2,s0
    4edc:	40a90533          	sub	a0,s2,a0
    4ee0:	40a40433          	sub	s0,s0,a0
    4ee4:	40a787b3          	sub	a5,a5,a0
    4ee8:	f61ff06f          	j	4e48 <.L25>

00004eec <.L6>:
    4eec:	00862783          	lw	a5,8(a2)
    4ef0:	eea78ce3          	beq	a5,a0,4de8 <.L11>
    4ef4:	00060513          	mv	a0,a2
    4ef8:	aa1fc0ef          	jal	1998 <__stdio_wcommit>
    4efc:	ee0506e3          	beqz	a0,4de8 <.L11>
    4f00:	00000413          	li	s0,0
    4f04:	f49ff06f          	j	4e4c <.L5>

00004f08 <__stdio_trans2w>:
    4f08:	00055603          	lhu	a2,0(a0) # 1000 <.L52+0x4>
    4f0c:	ff010113          	add	sp,sp,-16
    4f10:	00812423          	sw	s0,8(sp)
    4f14:	00112623          	sw	ra,12(sp)
    4f18:	02067793          	and	a5,a2,32
    4f1c:	00050413          	mv	s0,a0
    4f20:	02078a63          	beqz	a5,4f54 <.L2>
    4f24:	0000b797          	auipc	a5,0xb
    4f28:	4f07a783          	lw	a5,1264(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    4f2c:	00900713          	li	a4,9
    4f30:	00e7a023          	sw	a4,0(a5)

00004f34 <.L3>:
    4f34:	00045783          	lhu	a5,0(s0)
    4f38:	fff00513          	li	a0,-1
    4f3c:	0087e793          	or	a5,a5,8
    4f40:	00f41023          	sh	a5,0(s0)

00004f44 <.L1>:
    4f44:	00c12083          	lw	ra,12(sp)
    4f48:	00812403          	lw	s0,8(sp)
    4f4c:	01010113          	add	sp,sp,16
    4f50:	00008067          	ret

00004f54 <.L2>:
    4f54:	00367793          	and	a5,a2,3
    4f58:	02078463          	beqz	a5,4f80 <.L5>
    4f5c:	00467793          	and	a5,a2,4
    4f60:	02078e63          	beqz	a5,4f9c <.L6>

00004f64 <.L8>:
    4f64:	00045783          	lhu	a5,0(s0)
    4f68:	ffc7f793          	and	a5,a5,-4
    4f6c:	00f41023          	sh	a5,0(s0)
    4f70:	00842783          	lw	a5,8(s0)
    4f74:	00f42c23          	sw	a5,24(s0)
    4f78:	00f42823          	sw	a5,16(s0)
    4f7c:	00f42a23          	sw	a5,20(s0)

00004f80 <.L5>:
    4f80:	00045783          	lhu	a5,0(s0)
    4f84:	0407e713          	or	a4,a5,64
    4f88:	00e41023          	sh	a4,0(s0)
    4f8c:	3007f793          	and	a5,a5,768
    4f90:	04078063          	beqz	a5,4fd0 <.L10>

00004f94 <.L11>:
    4f94:	00000513          	li	a0,0
    4f98:	fadff06f          	j	4f44 <.L1>

00004f9c <.L6>:
    4f9c:	01452703          	lw	a4,20(a0)
    4fa0:	01052783          	lw	a5,16(a0)
    4fa4:	00f71663          	bne	a4,a5,4fb0 <.L7>
    4fa8:	00267793          	and	a5,a2,2
    4fac:	fa078ce3          	beqz	a5,4f64 <.L8>

00004fb0 <.L7>:
    4fb0:	40067613          	and	a2,a2,1024
    4fb4:	00c03633          	snez	a2,a2
    4fb8:	00160613          	add	a2,a2,1
    4fbc:	00000593          	li	a1,0
    4fc0:	00040513          	mv	a0,s0
    4fc4:	464020ef          	jal	7428 <__GI_fseek>
    4fc8:	f8050ee3          	beqz	a0,4f64 <.L8>
    4fcc:	f69ff06f          	j	4f34 <.L3>

00004fd0 <.L10>:
    4fd0:	00c42783          	lw	a5,12(s0)
    4fd4:	00f42e23          	sw	a5,28(s0)
    4fd8:	fbdff06f          	j	4f94 <.L11>

00004fdc <_load_inttype>:
    4fdc:	00001737          	lui	a4,0x1
    4fe0:	80070713          	add	a4,a4,-2048 # 800 <.L25>
    4fe4:	00050793          	mv	a5,a0
    4fe8:	00e57733          	and	a4,a0,a4
    4fec:	0005a503          	lw	a0,0(a1)
    4ff0:	02064c63          	bltz	a2,5028 <.L2>
    4ff4:	00070663          	beqz	a4,5000 <.L3>

00004ff8 <.L10>:
    4ff8:	0045a583          	lw	a1,4(a1)
    4ffc:	00008067          	ret

00005000 <.L3>:
    5000:	10000713          	li	a4,256
    5004:	00e79863          	bne	a5,a4,5014 <.L5>
    5008:	0ff57513          	zext.b	a0,a0

0000500c <.L6>:
    500c:	00000593          	li	a1,0
    5010:	00008067          	ret

00005014 <.L5>:
    5014:	20000713          	li	a4,512
    5018:	fee79ae3          	bne	a5,a4,500c <.L6>
    501c:	01051513          	sll	a0,a0,0x10
    5020:	01055513          	srl	a0,a0,0x10
    5024:	fe9ff06f          	j	500c <.L6>

00005028 <.L2>:
    5028:	fc0718e3          	bnez	a4,4ff8 <.L10>
    502c:	10000713          	li	a4,256
    5030:	00e79a63          	bne	a5,a4,5044 <.L8>
    5034:	01851513          	sll	a0,a0,0x18
    5038:	41855513          	sra	a0,a0,0x18

0000503c <.L9>:
    503c:	41f55593          	sra	a1,a0,0x1f
    5040:	00008067          	ret

00005044 <.L8>:
    5044:	20000713          	li	a4,512
    5048:	fee79ae3          	bne	a5,a4,503c <.L9>
    504c:	01051513          	sll	a0,a0,0x10
    5050:	41055513          	sra	a0,a0,0x10
    5054:	fe9ff06f          	j	503c <.L9>

00005058 <_store_inttype>:
    5058:	10000793          	li	a5,256
    505c:	00f59663          	bne	a1,a5,5068 <.L2>
    5060:	00c50023          	sb	a2,0(a0)
    5064:	00008067          	ret

00005068 <.L2>:
    5068:	80058793          	add	a5,a1,-2048
    506c:	00079863          	bnez	a5,507c <.L4>
    5070:	00c52023          	sw	a2,0(a0)
    5074:	00d52223          	sw	a3,4(a0)
    5078:	00008067          	ret

0000507c <.L4>:
    507c:	20000793          	li	a5,512
    5080:	00f59663          	bne	a1,a5,508c <.L5>
    5084:	00c51023          	sh	a2,0(a0)
    5088:	00008067          	ret

0000508c <.L5>:
    508c:	00c52023          	sw	a2,0(a0)
    5090:	00008067          	ret

00005094 <_uintmaxtostr>:
    5094:	00050893          	mv	a7,a0
    5098:	00000e13          	li	t3,0
    509c:	0206d063          	bgez	a3,50bc <.L2>
    50a0:	40d006b3          	neg	a3,a3
    50a4:	00065c63          	bgez	a2,50bc <.L2>
    50a8:	00b037b3          	snez	a5,a1
    50ac:	40c00633          	neg	a2,a2
    50b0:	40f60633          	sub	a2,a2,a5
    50b4:	40b005b3          	neg	a1,a1
    50b8:	00100e13          	li	t3,1

000050bc <.L2>:
    50bc:	fff00813          	li	a6,-1
    50c0:	02d85333          	divu	t1,a6,a3
    50c4:	00088023          	sb	zero,0(a7)
    50c8:	02d87833          	remu	a6,a6,a3
    50cc:	00180813          	add	a6,a6,1
    50d0:	01069663          	bne	a3,a6,50dc <.L4>
    50d4:	00130313          	add	t1,t1,1
    50d8:	00000813          	li	a6,0

000050dc <.L4>:
    50dc:	00900e93          	li	t4,9

000050e0 <.L8>:
    50e0:	02d5f533          	remu	a0,a1,a3
    50e4:	02d5d5b3          	divu	a1,a1,a3
    50e8:	02060463          	beqz	a2,5110 <.L5>
    50ec:	02d677b3          	remu	a5,a2,a3
    50f0:	02f80f33          	mul	t5,a6,a5
    50f4:	02f307b3          	mul	a5,t1,a5
    50f8:	00af0533          	add	a0,t5,a0
    50fc:	00b785b3          	add	a1,a5,a1
    5100:	02d557b3          	divu	a5,a0,a3
    5104:	02d65633          	divu	a2,a2,a3
    5108:	00f585b3          	add	a1,a1,a5
    510c:	02d57533          	remu	a0,a0,a3

00005110 <.L5>:
    5110:	0ff57793          	zext.b	a5,a0
    5114:	02aeec63          	bltu	t4,a0,514c <.L6>
    5118:	03078793          	add	a5,a5,48

0000511c <.L19>:
    511c:	0ff7f793          	zext.b	a5,a5
    5120:	fef88fa3          	sb	a5,-1(a7)
    5124:	00b667b3          	or	a5,a2,a1
    5128:	fff88513          	add	a0,a7,-1
    512c:	00079c63          	bnez	a5,5144 <.L12>
    5130:	000e0863          	beqz	t3,5140 <.L1>
    5134:	02d00793          	li	a5,45
    5138:	fef50fa3          	sb	a5,-1(a0)
    513c:	ffe88513          	add	a0,a7,-2

00005140 <.L1>:
    5140:	00008067          	ret

00005144 <.L12>:
    5144:	00050893          	mv	a7,a0
    5148:	f99ff06f          	j	50e0 <.L8>

0000514c <.L6>:
    514c:	00e787b3          	add	a5,a5,a4
    5150:	fcdff06f          	j	511c <.L19>

00005154 <_fpmaxtostr>:
    5154:	e7010113          	add	sp,sp,-400
    5158:	00462783          	lw	a5,4(a2)
    515c:	18812423          	sw	s0,392(sp)
    5160:	00864403          	lbu	s0,8(a2)
    5164:	02f12c23          	sw	a5,56(sp)
    5168:	06500793          	li	a5,101
    516c:	18912223          	sw	s1,388(sp)
    5170:	19212023          	sw	s2,384(sp)
    5174:	17312e23          	sw	s3,380(sp)
    5178:	17412c23          	sw	s4,376(sp)
    517c:	17512a23          	sw	s5,372(sp)
    5180:	17612823          	sw	s6,368(sp)
    5184:	17912223          	sw	s9,356(sp)
    5188:	0af10c23          	sb	a5,184(sp)
    518c:	18112623          	sw	ra,396(sp)
    5190:	17712623          	sw	s7,364(sp)
    5194:	17812423          	sw	s8,360(sp)
    5198:	17a12023          	sw	s10,352(sp)
    519c:	15b12e23          	sw	s11,348(sp)
    51a0:	04a12823          	sw	a0,80(sp)
    51a4:	04d12a23          	sw	a3,84(sp)
    51a8:	02046c93          	or	s9,s0,32
    51ac:	06100793          	li	a5,97
    51b0:	0005aa03          	lw	s4,0(a1)
    51b4:	0045aa83          	lw	s5,4(a1)
    51b8:	0085ab03          	lw	s6,8(a1)
    51bc:	00c5a903          	lw	s2,12(a1)
    51c0:	00062483          	lw	s1,0(a2)
    51c4:	00060993          	mv	s3,a2
    51c8:	1cfc9e63          	bne	s9,a5,53a4 <.L2>
    51cc:	07000793          	li	a5,112
    51d0:	0af10c23          	sb	a5,184(sp)
    51d4:	1e04c063          	bltz	s1,53b4 <.L67>

000051d8 <.L4>:
    51d8:	02012a23          	sw	zero,52(sp)

000051dc <.L3>:
    51dc:	00c9a783          	lw	a5,12(s3) # 2000c <_ebss+0x9f5c>
    51e0:	0a010823          	sb	zero,176(sp)
    51e4:	0027f713          	and	a4,a5,2
    51e8:	1c070e63          	beqz	a4,53c4 <.L5>
    51ec:	02b00793          	li	a5,43

000051f0 <.L118>:
    51f0:	0af10823          	sb	a5,176(sp)

000051f4 <.L6>:
    51f4:	0a010c13          	add	s8,sp,160
    51f8:	09010b93          	add	s7,sp,144
    51fc:	000b8593          	mv	a1,s7
    5200:	000c0513          	mv	a0,s8
    5204:	0a0108a3          	sb	zero,177(sp)
    5208:	10012223          	sw	zero,260(sp)
    520c:	0b412023          	sw	s4,160(sp)
    5210:	0b512223          	sw	s5,164(sp)
    5214:	0b612423          	sw	s6,168(sp)
    5218:	0b212623          	sw	s2,172(sp)
    521c:	09412823          	sw	s4,144(sp)
    5220:	09512a23          	sw	s5,148(sp)
    5224:	09612c23          	sw	s6,152(sp)
    5228:	09212e23          	sw	s2,156(sp)
    522c:	44d060ef          	jal	be78 <__eqtf2>
    5230:	1a050263          	beqz	a0,53d4 <.L113>
    5234:	00800793          	li	a5,8
    5238:	10f12223          	sw	a5,260(sp)

0000523c <.L9>:
    523c:	02000793          	li	a5,32
    5240:	00f9a823          	sw	a5,16(s3)
    5244:	07000793          	li	a5,112
    5248:	0ef12e23          	sw	a5,252(sp)
    524c:	00300793          	li	a5,3
    5250:	10f12023          	sw	a5,256(sp)
    5254:	06000793          	li	a5,96
    5258:	0087e863          	bltu	a5,s0,5268 <.L18>
    525c:	10412783          	lw	a5,260(sp)
    5260:	00478793          	add	a5,a5,4
    5264:	10f12223          	sw	a5,260(sp)

00005268 <.L18>:
    5268:	10412783          	lw	a5,260(sp)
    526c:	0000c717          	auipc	a4,0xc
    5270:	78470713          	add	a4,a4,1924 # 119f0 <fmt>
    5274:	00040593          	mv	a1,s0
    5278:	00e787b3          	add	a5,a5,a4
    527c:	10f12223          	sw	a5,260(sp)
    5280:	10810913          	add	s2,sp,264

00005284 <.L19>:
    5284:	10010793          	add	a5,sp,256

00005288 <.L59>:
    5288:	0007a703          	lw	a4,0(a5)
    528c:	03812683          	lw	a3,56(sp)
    5290:	00c78793          	add	a5,a5,12
    5294:	40e68733          	sub	a4,a3,a4
    5298:	02e12c23          	sw	a4,56(sp)
    529c:	ff27e6e3          	bltu	a5,s2,5288 <.L59>
    52a0:	0b014703          	lbu	a4,176(sp)
    52a4:	0a000793          	li	a5,160
    52a8:	0ef12823          	sw	a5,240(sp)
    52ac:	00e03733          	snez	a4,a4
    52b0:	0b010693          	add	a3,sp,176
    52b4:	0205e793          	or	a5,a1,32
    52b8:	0ee12a23          	sw	a4,244(sp)
    52bc:	0ed12c23          	sw	a3,248(sp)
    52c0:	0ff7f793          	zext.b	a5,a5
    52c4:	06100613          	li	a2,97
    52c8:	02c79a63          	bne	a5,a2,52fc <.L60>
    52cc:	0fc12603          	lw	a2,252(sp)
    52d0:	00f00793          	li	a5,15
    52d4:	02c7d463          	bge	a5,a2,52fc <.L60>
    52d8:	00e687b3          	add	a5,a3,a4
    52dc:	03000693          	li	a3,48
    52e0:	00d78023          	sb	a3,0(a5)
    52e4:	0b814683          	lbu	a3,184(sp)
    52e8:	00270713          	add	a4,a4,2
    52ec:	00078123          	sb	zero,2(a5)
    52f0:	00868693          	add	a3,a3,8
    52f4:	00d780a3          	sb	a3,1(a5)
    52f8:	0ee12a23          	sw	a4,244(sp)

000052fc <.L60>:
    52fc:	03812783          	lw	a5,56(sp)
    5300:	40e787b3          	sub	a5,a5,a4
    5304:	02f05663          	blez	a5,5330 <.L63>
    5308:	00c9a703          	lw	a4,12(s3)
    530c:	00877713          	and	a4,a4,8
    5310:	1e070ae3          	beqz	a4,5d04 <.L62>
    5314:	00f92223          	sw	a5,4(s2)
    5318:	0a000713          	li	a4,160
    531c:	0000c797          	auipc	a5,0xc
    5320:	6d778793          	add	a5,a5,1751 # 119f3 <fmt+0x3>
    5324:	00e92023          	sw	a4,0(s2)
    5328:	00f92423          	sw	a5,8(s2)
    532c:	00c90913          	add	s2,s2,12

00005330 <.L63>:
    5330:	0f010413          	add	s0,sp,240
    5334:	00000493          	li	s1,0

00005338 <.L66>:
    5338:	00442983          	lw	s3,4(s0)
    533c:	00842683          	lw	a3,8(s0)
    5340:	00042583          	lw	a1,0(s0)
    5344:	05012503          	lw	a0,80(sp)
    5348:	05412783          	lw	a5,84(sp)
    534c:	00098613          	mv	a2,s3
    5350:	000780e7          	jalr	a5
    5354:	1d351ee3          	bne	a0,s3,5d30 <.L82>
    5358:	00c40413          	add	s0,s0,12
    535c:	00a484b3          	add	s1,s1,a0
    5360:	fd246ce3          	bltu	s0,s2,5338 <.L66>

00005364 <.L1>:
    5364:	18c12083          	lw	ra,396(sp)
    5368:	18812403          	lw	s0,392(sp)
    536c:	18012903          	lw	s2,384(sp)
    5370:	17c12983          	lw	s3,380(sp)
    5374:	17812a03          	lw	s4,376(sp)
    5378:	17412a83          	lw	s5,372(sp)
    537c:	17012b03          	lw	s6,368(sp)
    5380:	16c12b83          	lw	s7,364(sp)
    5384:	16812c03          	lw	s8,360(sp)
    5388:	16412c83          	lw	s9,356(sp)
    538c:	16012d03          	lw	s10,352(sp)
    5390:	15c12d83          	lw	s11,348(sp)
    5394:	00048513          	mv	a0,s1
    5398:	18412483          	lw	s1,388(sp)
    539c:	19010113          	add	sp,sp,400
    53a0:	00008067          	ret

000053a4 <.L2>:
    53a4:	e204dae3          	bgez	s1,51d8 <.L4>
    53a8:	02012a23          	sw	zero,52(sp)
    53ac:	00600493          	li	s1,6
    53b0:	e2dff06f          	j	51dc <.L3>

000053b4 <.L67>:
    53b4:	00100793          	li	a5,1
    53b8:	02f12a23          	sw	a5,52(sp)
    53bc:	01d00493          	li	s1,29
    53c0:	e1dff06f          	j	51dc <.L3>

000053c4 <.L5>:
    53c4:	0017f793          	and	a5,a5,1
    53c8:	e20786e3          	beqz	a5,51f4 <.L6>
    53cc:	02000793          	li	a5,32
    53d0:	e21ff06f          	j	51f0 <.L118>

000053d4 <.L113>:
    53d4:	000b8593          	mv	a1,s7
    53d8:	000c0513          	mv	a0,s8
    53dc:	0b412023          	sw	s4,160(sp)
    53e0:	0b512223          	sw	s5,164(sp)
    53e4:	0b612423          	sw	s6,168(sp)
    53e8:	0b212623          	sw	s2,172(sp)
    53ec:	08012823          	sw	zero,144(sp)
    53f0:	08012a23          	sw	zero,148(sp)
    53f4:	08012c23          	sw	zero,152(sp)
    53f8:	08012e23          	sw	zero,156(sp)
    53fc:	27d060ef          	jal	be78 <__eqtf2>
    5400:	24051e63          	bnez	a0,565c <.L114>
    5404:	000c0513          	mv	a0,s8
    5408:	0c1090ef          	jal	ecc8 <__trunctfdf2>
    540c:	00b50663          	beq	a0,a1,5418 <.L12>
    5410:	02d00793          	li	a5,45
    5414:	0af10823          	sb	a5,176(sp)

00005418 <.L12>:
    5418:	02400793          	li	a5,36
    541c:	02f12623          	sw	a5,44(sp)
    5420:	00900793          	li	a5,9
    5424:	0000d617          	auipc	a2,0xd
    5428:	d5c60613          	add	a2,a2,-676 # 12180 <.LC2>
    542c:	02f12423          	sw	a5,40(sp)
    5430:	00a00793          	li	a5,10
    5434:	00f12623          	sw	a5,12(sp)
    5438:	00062783          	lw	a5,0(a2)
    543c:	000a0c93          	mv	s9,s4
    5440:	000a8d13          	mv	s10,s5
    5444:	00f12c23          	sw	a5,24(sp)
    5448:	00462783          	lw	a5,4(a2)
    544c:	000b0d93          	mv	s11,s6
    5450:	00090b93          	mv	s7,s2
    5454:	00f12e23          	sw	a5,28(sp)
    5458:	00862783          	lw	a5,8(a2)
    545c:	fff00c13          	li	s8,-1
    5460:	02f12023          	sw	a5,32(sp)
    5464:	00c62783          	lw	a5,12(a2)
    5468:	02f12223          	sw	a5,36(sp)

0000546c <.L13>:
    546c:	0a010793          	add	a5,sp,160
    5470:	00f12823          	sw	a5,16(sp)
    5474:	09010793          	add	a5,sp,144
    5478:	00f12a23          	sw	a5,20(sp)
    547c:	08010793          	add	a5,sp,128
    5480:	00400913          	li	s2,4
    5484:	0ca10a13          	add	s4,sp,202
    5488:	02f12823          	sw	a5,48(sp)
    548c:	07010b13          	add	s6,sp,112

00005490 <.L29>:
    5490:	01012503          	lw	a0,16(sp)
    5494:	0b912023          	sw	s9,160(sp)
    5498:	0ba12223          	sw	s10,164(sp)
    549c:	0bb12423          	sw	s11,168(sp)
    54a0:	0b712623          	sw	s7,172(sp)
    54a4:	198090ef          	jal	e63c <__fixunstfsi>
    54a8:	00050593          	mv	a1,a0
    54ac:	00050a93          	mv	s5,a0
    54b0:	01012503          	lw	a0,16(sp)
    54b4:	280090ef          	jal	e734 <__floatunsitf>
    54b8:	0a012703          	lw	a4,160(sp)
    54bc:	03012583          	lw	a1,48(sp)
    54c0:	01412503          	lw	a0,20(sp)
    54c4:	06e12823          	sw	a4,112(sp)
    54c8:	0a412703          	lw	a4,164(sp)
    54cc:	000b0613          	mv	a2,s6
    54d0:	09912023          	sw	s9,128(sp)
    54d4:	06e12a23          	sw	a4,116(sp)
    54d8:	0a812703          	lw	a4,168(sp)
    54dc:	09a12223          	sw	s10,132(sp)
    54e0:	09b12423          	sw	s11,136(sp)
    54e4:	06e12c23          	sw	a4,120(sp)
    54e8:	0ac12703          	lw	a4,172(sp)
    54ec:	09712623          	sw	s7,140(sp)
    54f0:	06e12e23          	sw	a4,124(sp)
    54f4:	4b5070ef          	jal	d1a8 <__subtf3>
    54f8:	01812783          	lw	a5,24(sp)
    54fc:	03012603          	lw	a2,48(sp)
    5500:	01012503          	lw	a0,16(sp)
    5504:	08f12023          	sw	a5,128(sp)
    5508:	01c12783          	lw	a5,28(sp)
    550c:	01412583          	lw	a1,20(sp)
    5510:	08f12223          	sw	a5,132(sp)
    5514:	02012783          	lw	a5,32(sp)
    5518:	08f12423          	sw	a5,136(sp)
    551c:	02412783          	lw	a5,36(sp)
    5520:	08f12623          	sw	a5,140(sp)
    5524:	481060ef          	jal	c1a4 <__multf3>
    5528:	02812783          	lw	a5,40(sp)
    552c:	0a012c83          	lw	s9,160(sp)
    5530:	0a412d03          	lw	s10,164(sp)
    5534:	0a812d83          	lw	s11,168(sp)
    5538:	0ac12b83          	lw	s7,172(sp)
    553c:	00fa0a33          	add	s4,s4,a5
    5540:	000a0613          	mv	a2,s4
    5544:	40fa0533          	sub	a0,s4,a5

00005548 <.L28>:
    5548:	00c12783          	lw	a5,12(sp)
    554c:	fff60613          	add	a2,a2,-1
    5550:	02faf5b3          	remu	a1,s5,a5
    5554:	03058593          	add	a1,a1,48
    5558:	00b60023          	sb	a1,0(a2)
    555c:	02fadab3          	divu	s5,s5,a5
    5560:	fec514e3          	bne	a0,a2,5548 <.L28>
    5564:	fff90913          	add	s2,s2,-1
    5568:	f20914e3          	bnez	s2,5490 <.L29>
    556c:	06000713          	li	a4,96
    5570:	00876c63          	bltu	a4,s0,5588 <.L30>
    5574:	0b814703          	lbu	a4,184(sp)
    5578:	02040413          	add	s0,s0,32
    557c:	0ff47413          	zext.b	s0,s0
    5580:	fe070713          	add	a4,a4,-32
    5584:	0ae10c23          	sb	a4,184(sp)

00005588 <.L30>:
    5588:	06700713          	li	a4,103
    558c:	50e41663          	bne	s0,a4,5a98 <.L31>
    5590:	00000693          	li	a3,0
    5594:	00048663          	beqz	s1,55a0 <.L32>
    5598:	fff48493          	add	s1,s1,-1
    559c:	00048693          	mv	a3,s1

000055a0 <.L32>:
    55a0:	02c12783          	lw	a5,44(sp)
    55a4:	00003737          	lui	a4,0x3
    55a8:	0ce11423          	sh	a4,200(sp)
    55ac:	0c910513          	add	a0,sp,201
    55b0:	50f6ce63          	blt	a3,a5,5acc <.L33>
    55b4:	00178613          	add	a2,a5,1
    55b8:	00c50633          	add	a2,a0,a2
    55bc:	00000593          	li	a1,0

000055c0 <.L34>:
    55c0:	00c12783          	lw	a5,12(sp)
    55c4:	03000813          	li	a6,48
    55c8:	02f78b93          	add	s7,a5,47

000055cc <.L35>:
    55cc:	fff64703          	lbu	a4,-1(a2)
    55d0:	fff60613          	add	a2,a2,-1
    55d4:	00b70733          	add	a4,a4,a1
    55d8:	0ff77713          	zext.b	a4,a4
    55dc:	00e60023          	sb	a4,0(a2)
    55e0:	ff0706e3          	beq	a4,a6,55cc <.L35>
    55e4:	feebe4e3          	bltu	s7,a4,55cc <.L35>
    55e8:	02046713          	or	a4,s0,32
    55ec:	06100593          	li	a1,97
    55f0:	52b71063          	bne	a4,a1,5b10 <.L37>
    55f4:	0b814583          	lbu	a1,184(sp)
    55f8:	00060813          	mv	a6,a2
    55fc:	03900893          	li	a7,57
    5600:	fb758593          	add	a1,a1,-73
    5604:	0ff5f593          	zext.b	a1,a1

00005608 <.L38>:
    5608:	00084703          	lbu	a4,0(a6)
    560c:	4e071263          	bnez	a4,5af0 <.L40>
    5610:	4ec56a63          	bltu	a0,a2,5b04 <.L41>

00005614 <.L43>:
    5614:	001c0c13          	add	s8,s8,1 # 2001 <.L53+0x1>
    5618:	00050613          	mv	a2,a0
    561c:	00050713          	mv	a4,a0

00005620 <.L42>:
    5620:	000600a3          	sb	zero,1(a2)
    5624:	06700593          	li	a1,103
    5628:	4eb41863          	bne	s0,a1,5b18 <.L44>
    562c:	ffc00593          	li	a1,-4
    5630:	4ebc4c63          	blt	s8,a1,5b28 <.L73>
    5634:	4f86ca63          	blt	a3,s8,5b28 <.L73>
    5638:	418684b3          	sub	s1,a3,s8

0000563c <.L46>:
    563c:	000c0693          	mv	a3,s8
    5640:	000c5a63          	bgez	s8,5654 <.L123>
    5644:	03000693          	li	a3,48
    5648:	fed70fa3          	sb	a3,-1(a4) # 2fff <.L3+0x1f>
    564c:	000c0693          	mv	a3,s8
    5650:	fff70713          	add	a4,a4,-1

00005654 <.L123>:
    5654:	06600593          	li	a1,102
    5658:	4d80006f          	j	5b30 <.L45>

0000565c <.L114>:
    565c:	000b8593          	mv	a1,s7
    5660:	000c0513          	mv	a0,s8
    5664:	0b412023          	sw	s4,160(sp)
    5668:	0b512223          	sw	s5,164(sp)
    566c:	0b612423          	sw	s6,168(sp)
    5670:	0b212623          	sw	s2,172(sp)
    5674:	08012823          	sw	zero,144(sp)
    5678:	08012a23          	sw	zero,148(sp)
    567c:	08012c23          	sw	zero,152(sp)
    5680:	08012e23          	sw	zero,156(sp)
    5684:	1f1060ef          	jal	c074 <__letf2>
    5688:	00055a63          	bgez	a0,569c <.L14>
    568c:	02d00793          	li	a5,45
    5690:	0af10823          	sb	a5,176(sp)
    5694:	800007b7          	lui	a5,0x80000
    5698:	0127c933          	xor	s2,a5,s2

0000569c <.L14>:
    569c:	0000d797          	auipc	a5,0xd
    56a0:	b0478793          	add	a5,a5,-1276 # 121a0 <.LC4>
    56a4:	0007a603          	lw	a2,0(a5)
    56a8:	0047a683          	lw	a3,4(a5)
    56ac:	0087a703          	lw	a4,8(a5)
    56b0:	00c7a783          	lw	a5,12(a5)
    56b4:	08010d13          	add	s10,sp,128
    56b8:	08c12023          	sw	a2,128(sp)
    56bc:	000b8593          	mv	a1,s7
    56c0:	000c0513          	mv	a0,s8
    56c4:	000d0613          	mv	a2,s10
    56c8:	08f12623          	sw	a5,140(sp)
    56cc:	09412823          	sw	s4,144(sp)
    56d0:	09512a23          	sw	s5,148(sp)
    56d4:	09612c23          	sw	s6,152(sp)
    56d8:	09212e23          	sw	s2,156(sp)
    56dc:	08d12223          	sw	a3,132(sp)
    56e0:	08e12423          	sw	a4,136(sp)
    56e4:	2c1060ef          	jal	c1a4 <__multf3>
    56e8:	0a012783          	lw	a5,160(sp)
    56ec:	000d0593          	mv	a1,s10
    56f0:	000b8513          	mv	a0,s7
    56f4:	08f12823          	sw	a5,144(sp)
    56f8:	0a412783          	lw	a5,164(sp)
    56fc:	09412023          	sw	s4,128(sp)
    5700:	09512223          	sw	s5,132(sp)
    5704:	08f12a23          	sw	a5,148(sp)
    5708:	0a812783          	lw	a5,168(sp)
    570c:	09612423          	sw	s6,136(sp)
    5710:	09212623          	sw	s2,140(sp)
    5714:	08f12c23          	sw	a5,152(sp)
    5718:	0ac12783          	lw	a5,172(sp)
    571c:	08f12e23          	sw	a5,156(sp)
    5720:	758060ef          	jal	be78 <__eqtf2>
    5724:	b0050ce3          	beqz	a0,523c <.L9>
    5728:	06100793          	li	a5,97
    572c:	2afc9063          	bne	s9,a5,59cc <.L68>
    5730:	01d00793          	li	a5,29
    5734:	02f12623          	sw	a5,44(sp)
    5738:	00800793          	li	a5,8
    573c:	0000d717          	auipc	a4,0xd
    5740:	a2470713          	add	a4,a4,-1500 # 12160 <.LC0>
    5744:	02f12423          	sw	a5,40(sp)
    5748:	01000793          	li	a5,16
    574c:	00f12623          	sw	a5,12(sp)
    5750:	00072783          	lw	a5,0(a4)
    5754:	00700c13          	li	s8,7
    5758:	0000c317          	auipc	t1,0xc
    575c:	0f830313          	add	t1,t1,248 # 11850 <exp16_table>
    5760:	00f12c23          	sw	a5,24(sp)
    5764:	00472783          	lw	a5,4(a4)
    5768:	00f12e23          	sw	a5,28(sp)
    576c:	00872783          	lw	a5,8(a4)
    5770:	02f12023          	sw	a5,32(sp)
    5774:	00c72783          	lw	a5,12(a4)
    5778:	0000d717          	auipc	a4,0xd
    577c:	9f870713          	add	a4,a4,-1544 # 12170 <.LC1>
    5780:	02f12223          	sw	a5,36(sp)

00005784 <.L119>:
    5784:	00072783          	lw	a5,0(a4)
    5788:	0c030e13          	add	t3,t1,192
    578c:	000a0c93          	mv	s9,s4
    5790:	02f12e23          	sw	a5,60(sp)
    5794:	00472783          	lw	a5,4(a4)
    5798:	000a8d13          	mv	s10,s5
    579c:	000b0d93          	mv	s11,s6
    57a0:	04f12023          	sw	a5,64(sp)
    57a4:	00872783          	lw	a5,8(a4)
    57a8:	00090b93          	mv	s7,s2
    57ac:	04f12223          	sw	a5,68(sp)
    57b0:	00c72783          	lw	a5,12(a4)
    57b4:	04f12423          	sw	a5,72(sp)
    57b8:	000017b7          	lui	a5,0x1
    57bc:	02f12823          	sw	a5,48(sp)
    57c0:	0a010793          	add	a5,sp,160
    57c4:	00f12823          	sw	a5,16(sp)
    57c8:	09010793          	add	a5,sp,144
    57cc:	00f12a23          	sw	a5,20(sp)
    57d0:	08010793          	add	a5,sp,128
    57d4:	04f12623          	sw	a5,76(sp)

000057d8 <.L26>:
    57d8:	03c12783          	lw	a5,60(sp)
    57dc:	000e2f83          	lw	t6,0(t3)
    57e0:	004e2f03          	lw	t5,4(t3)
    57e4:	008e2e83          	lw	t4,8(t3)
    57e8:	00ce2603          	lw	a2,12(t3)
    57ec:	08f12823          	sw	a5,144(sp)
    57f0:	04012783          	lw	a5,64(sp)
    57f4:	01412583          	lw	a1,20(sp)
    57f8:	01012503          	lw	a0,16(sp)
    57fc:	08f12a23          	sw	a5,148(sp)
    5800:	04412783          	lw	a5,68(sp)
    5804:	06612623          	sw	t1,108(sp)
    5808:	07f12423          	sw	t6,104(sp)
    580c:	08f12c23          	sw	a5,152(sp)
    5810:	04812783          	lw	a5,72(sp)
    5814:	07e12223          	sw	t5,100(sp)
    5818:	07d12023          	sw	t4,96(sp)
    581c:	05c12e23          	sw	t3,92(sp)
    5820:	04c12c23          	sw	a2,88(sp)
    5824:	0b412023          	sw	s4,160(sp)
    5828:	0b512223          	sw	s5,164(sp)
    582c:	0b612423          	sw	s6,168(sp)
    5830:	0b212623          	sw	s2,172(sp)
    5834:	08f12e23          	sw	a5,156(sp)
    5838:	03d060ef          	jal	c074 <__letf2>
    583c:	05812603          	lw	a2,88(sp)
    5840:	06812f83          	lw	t6,104(sp)
    5844:	06c12303          	lw	t1,108(sp)
    5848:	05c12e03          	lw	t3,92(sp)
    584c:	06012e83          	lw	t4,96(sp)
    5850:	06412f03          	lw	t5,100(sp)
    5854:	08c12623          	sw	a2,140(sp)
    5858:	07c12623          	sw	t3,108(sp)
    585c:	06612423          	sw	t1,104(sp)
    5860:	09912823          	sw	s9,144(sp)
    5864:	09a12a23          	sw	s10,148(sp)
    5868:	09b12c23          	sw	s11,152(sp)
    586c:	09712e23          	sw	s7,156(sp)
    5870:	09f12023          	sw	t6,128(sp)
    5874:	09e12223          	sw	t5,132(sp)
    5878:	09d12423          	sw	t4,136(sp)
    587c:	04c12603          	lw	a2,76(sp)
    5880:	01412583          	lw	a1,20(sp)
    5884:	1a055463          	bgez	a0,5a2c <.L116>
    5888:	01012503          	lw	a0,16(sp)
    588c:	119060ef          	jal	c1a4 <__multf3>
    5890:	01812783          	lw	a5,24(sp)
    5894:	0a012f83          	lw	t6,160(sp)
    5898:	0a412f03          	lw	t5,164(sp)
    589c:	08f12823          	sw	a5,144(sp)
    58a0:	01c12783          	lw	a5,28(sp)
    58a4:	0a812e83          	lw	t4,168(sp)
    58a8:	0ac12603          	lw	a2,172(sp)
    58ac:	08f12a23          	sw	a5,148(sp)
    58b0:	02012783          	lw	a5,32(sp)
    58b4:	01412583          	lw	a1,20(sp)
    58b8:	01012503          	lw	a0,16(sp)
    58bc:	08f12c23          	sw	a5,152(sp)
    58c0:	02412783          	lw	a5,36(sp)
    58c4:	07f12223          	sw	t6,100(sp)
    58c8:	07e12023          	sw	t5,96(sp)
    58cc:	05d12e23          	sw	t4,92(sp)
    58d0:	04c12c23          	sw	a2,88(sp)
    58d4:	08f12e23          	sw	a5,156(sp)
    58d8:	79c060ef          	jal	c074 <__letf2>
    58dc:	06812303          	lw	t1,104(sp)
    58e0:	06c12e03          	lw	t3,108(sp)
    58e4:	02055663          	bgez	a0,5910 <.L23>
    58e8:	03012783          	lw	a5,48(sp)
    58ec:	40fc0c33          	sub	s8,s8,a5

000058f0 <.L120>:
    58f0:	06412f83          	lw	t6,100(sp)
    58f4:	06012f03          	lw	t5,96(sp)
    58f8:	05c12e83          	lw	t4,92(sp)
    58fc:	05812603          	lw	a2,88(sp)
    5900:	000f8c93          	mv	s9,t6
    5904:	000f0d13          	mv	s10,t5
    5908:	000e8d93          	mv	s11,t4
    590c:	00060b93          	mv	s7,a2

00005910 <.L23>:
    5910:	03012783          	lw	a5,48(sp)
    5914:	ff0e0613          	add	a2,t3,-16
    5918:	4017d793          	sra	a5,a5,0x1
    591c:	02f12823          	sw	a5,48(sp)
    5920:	11c31263          	bne	t1,t3,5a24 <.L69>
    5924:	01812783          	lw	a5,24(sp)
    5928:	0a010913          	add	s2,sp,160
    592c:	09010593          	add	a1,sp,144
    5930:	08f12823          	sw	a5,144(sp)
    5934:	01c12783          	lw	a5,28(sp)
    5938:	00090513          	mv	a0,s2
    593c:	00612a23          	sw	t1,20(sp)
    5940:	08f12a23          	sw	a5,148(sp)
    5944:	02012783          	lw	a5,32(sp)
    5948:	0b912023          	sw	s9,160(sp)
    594c:	0ba12223          	sw	s10,164(sp)
    5950:	08f12c23          	sw	a5,152(sp)
    5954:	02412783          	lw	a5,36(sp)
    5958:	0bb12423          	sw	s11,168(sp)
    595c:	0b712623          	sw	s7,172(sp)
    5960:	08f12e23          	sw	a5,156(sp)
    5964:	00b12823          	sw	a1,16(sp)
    5968:	5dc060ef          	jal	bf44 <__getf2>
    596c:	b00540e3          	bltz	a0,546c <.L13>
    5970:	01412303          	lw	t1,20(sp)
    5974:	09912823          	sw	s9,144(sp)
    5978:	09a12a23          	sw	s10,148(sp)
    597c:	09b12c23          	sw	s11,152(sp)
    5980:	09712e23          	sw	s7,156(sp)
    5984:	00032703          	lw	a4,0(t1)
    5988:	01012583          	lw	a1,16(sp)
    598c:	08010613          	add	a2,sp,128
    5990:	08e12023          	sw	a4,128(sp)
    5994:	00432703          	lw	a4,4(t1)
    5998:	00090513          	mv	a0,s2
    599c:	001c0c13          	add	s8,s8,1
    59a0:	08e12223          	sw	a4,132(sp)
    59a4:	00832703          	lw	a4,8(t1)
    59a8:	08e12423          	sw	a4,136(sp)
    59ac:	00c32703          	lw	a4,12(t1)
    59b0:	08e12623          	sw	a4,140(sp)
    59b4:	730050ef          	jal	b0e4 <__divtf3>
    59b8:	0a012c83          	lw	s9,160(sp)
    59bc:	0a412d03          	lw	s10,164(sp)
    59c0:	0a812d83          	lw	s11,168(sp)
    59c4:	0ac12b83          	lw	s7,172(sp)
    59c8:	aa5ff06f          	j	546c <.L13>

000059cc <.L68>:
    59cc:	02400793          	li	a5,36
    59d0:	02f12623          	sw	a5,44(sp)
    59d4:	00900793          	li	a5,9
    59d8:	0000c717          	auipc	a4,0xc
    59dc:	7a870713          	add	a4,a4,1960 # 12180 <.LC2>
    59e0:	02f12423          	sw	a5,40(sp)
    59e4:	00a00793          	li	a5,10
    59e8:	00f12623          	sw	a5,12(sp)
    59ec:	00072783          	lw	a5,0(a4)
    59f0:	00800c13          	li	s8,8
    59f4:	0000c317          	auipc	t1,0xc
    59f8:	f2c30313          	add	t1,t1,-212 # 11920 <exp10_table>
    59fc:	00f12c23          	sw	a5,24(sp)
    5a00:	00472783          	lw	a5,4(a4)
    5a04:	00f12e23          	sw	a5,28(sp)
    5a08:	00872783          	lw	a5,8(a4)
    5a0c:	02f12023          	sw	a5,32(sp)
    5a10:	00c72783          	lw	a5,12(a4)
    5a14:	0000c717          	auipc	a4,0xc
    5a18:	77c70713          	add	a4,a4,1916 # 12190 <.LC3>
    5a1c:	02f12223          	sw	a5,36(sp)
    5a20:	d65ff06f          	j	5784 <.L119>

00005a24 <.L69>:
    5a24:	00060e13          	mv	t3,a2
    5a28:	db1ff06f          	j	57d8 <.L26>

00005a2c <.L116>:
    5a2c:	01012503          	lw	a0,16(sp)
    5a30:	6b4050ef          	jal	b0e4 <__divtf3>
    5a34:	03c12783          	lw	a5,60(sp)
    5a38:	0a012f83          	lw	t6,160(sp)
    5a3c:	0a412f03          	lw	t5,164(sp)
    5a40:	08f12823          	sw	a5,144(sp)
    5a44:	04012783          	lw	a5,64(sp)
    5a48:	0a812e83          	lw	t4,168(sp)
    5a4c:	0ac12603          	lw	a2,172(sp)
    5a50:	08f12a23          	sw	a5,148(sp)
    5a54:	04412783          	lw	a5,68(sp)
    5a58:	01412583          	lw	a1,20(sp)
    5a5c:	01012503          	lw	a0,16(sp)
    5a60:	08f12c23          	sw	a5,152(sp)
    5a64:	04812783          	lw	a5,72(sp)
    5a68:	07f12223          	sw	t6,100(sp)
    5a6c:	07e12023          	sw	t5,96(sp)
    5a70:	05d12e23          	sw	t4,92(sp)
    5a74:	04c12c23          	sw	a2,88(sp)
    5a78:	08f12e23          	sw	a5,156(sp)
    5a7c:	4c8060ef          	jal	bf44 <__getf2>
    5a80:	06812303          	lw	t1,104(sp)
    5a84:	06c12e03          	lw	t3,108(sp)
    5a88:	e80544e3          	bltz	a0,5910 <.L23>
    5a8c:	03012783          	lw	a5,48(sp)
    5a90:	00fc0c33          	add	s8,s8,a5
    5a94:	e5dff06f          	j	58f0 <.L120>

00005a98 <.L31>:
    5a98:	06600713          	li	a4,102
    5a9c:	00048693          	mv	a3,s1
    5aa0:	b0e410e3          	bne	s0,a4,55a0 <.L32>
    5aa4:	009c06b3          	add	a3,s8,s1
    5aa8:	fff00713          	li	a4,-1
    5aac:	aee6dae3          	bge	a3,a4,55a0 <.L32>
    5ab0:	02400613          	li	a2,36
    5ab4:	03000593          	li	a1,48
    5ab8:	0c810513          	add	a0,sp,200
    5abc:	adcfd0ef          	jal	2d98 <__GI_memset>
    5ac0:	fff00c13          	li	s8,-1
    5ac4:	fff00693          	li	a3,-1
    5ac8:	ad9ff06f          	j	55a0 <.L32>

00005acc <.L33>:
    5acc:	00c12783          	lw	a5,12(sp)
    5ad0:	00268613          	add	a2,a3,2
    5ad4:	00c50633          	add	a2,a0,a2
    5ad8:	00064583          	lbu	a1,0(a2)
    5adc:	0017d713          	srl	a4,a5,0x1
    5ae0:	03070713          	add	a4,a4,48
    5ae4:	00e5b5b3          	sltu	a1,a1,a4
    5ae8:	0015b593          	seqz	a1,a1
    5aec:	ad5ff06f          	j	55c0 <.L34>

00005af0 <.L40>:
    5af0:	00e8f663          	bgeu	a7,a4,5afc <.L39>
    5af4:	00b70733          	add	a4,a4,a1
    5af8:	00e80023          	sb	a4,0(a6)

00005afc <.L39>:
    5afc:	fff80813          	add	a6,a6,-1
    5b00:	b09ff06f          	j	5608 <.L38>

00005b04 <.L41>:
    5b04:	002c1c13          	sll	s8,s8,0x2

00005b08 <.L121>:
    5b08:	0ca10713          	add	a4,sp,202
    5b0c:	b15ff06f          	j	5620 <.L42>

00005b10 <.L37>:
    5b10:	b0c572e3          	bgeu	a0,a2,5614 <.L43>
    5b14:	ff5ff06f          	j	5b08 <.L121>

00005b18 <.L44>:
    5b18:	06600693          	li	a3,102
    5b1c:	b2d400e3          	beq	s0,a3,563c <.L46>
    5b20:	00040593          	mv	a1,s0
    5b24:	0080006f          	j	5b2c <.L122>

00005b28 <.L73>:
    5b28:	06700593          	li	a1,103

00005b2c <.L122>:
    5b2c:	00000693          	li	a3,0

00005b30 <.L45>:
    5b30:	00074883          	lbu	a7,0(a4)
    5b34:	00100513          	li	a0,1
    5b38:	0b000813          	li	a6,176
    5b3c:	10a12023          	sw	a0,256(sp)
    5b40:	0b410513          	add	a0,sp,180
    5b44:	10a12223          	sw	a0,260(sp)
    5b48:	0f012e23          	sw	a6,252(sp)
    5b4c:	0b110a23          	sb	a7,180(sp)
    5b50:	0a010aa3          	sb	zero,181(sp)
    5b54:	00170513          	add	a0,a4,1
    5b58:	10810913          	add	s2,sp,264
    5b5c:	40e60733          	sub	a4,a2,a4
    5b60:	0406c063          	bltz	a3,5ba0 <.L47>
    5b64:	07000613          	li	a2,112
    5b68:	10c12423          	sw	a2,264(sp)
    5b6c:	10a12823          	sw	a0,272(sp)
    5b70:	16e6c863          	blt	a3,a4,5ce0 <.L48>
    5b74:	10e12623          	sw	a4,268(sp)
    5b78:	40e68733          	sub	a4,a3,a4
    5b7c:	16070a63          	beqz	a4,5cf0 <.L77>
    5b80:	10e12c23          	sw	a4,280(sp)
    5b84:	0000c717          	auipc	a4,0xc
    5b88:	e6f70713          	add	a4,a4,-401 # 119f3 <fmt+0x3>
    5b8c:	10e12e23          	sw	a4,284(sp)
    5b90:	11012a23          	sw	a6,276(sp)
    5b94:	00000713          	li	a4,0
    5b98:	12010913          	add	s2,sp,288

00005b9c <.L78>:
    5b9c:	fff00693          	li	a3,-1

00005ba0 <.L47>:
    5ba0:	00c9a603          	lw	a2,12(s3)
    5ba4:	01067613          	and	a2,a2,16
    5ba8:	00c76833          	or	a6,a4,a2
    5bac:	00081c63          	bnez	a6,5bc4 <.L49>
    5bb0:	06700813          	li	a6,103
    5bb4:	03040863          	beq	s0,a6,5be4 <.L50>
    5bb8:	06100813          	li	a6,97
    5bbc:	03040463          	beq	s0,a6,5be4 <.L50>
    5bc0:	02048263          	beqz	s1,5be4 <.L50>

00005bc4 <.L49>:
    5bc4:	07000813          	li	a6,112
    5bc8:	01092023          	sw	a6,0(s2)
    5bcc:	00100813          	li	a6,1
    5bd0:	01092223          	sw	a6,4(s2)
    5bd4:	0000c817          	auipc	a6,0xc
    5bd8:	e2c80813          	add	a6,a6,-468 # 11a00 <fmt+0x10>
    5bdc:	01092423          	sw	a6,8(s2)
    5be0:	00c90913          	add	s2,s2,12

00005be4 <.L50>:
    5be4:	00168813          	add	a6,a3,1
    5be8:	02080263          	beqz	a6,5c0c <.L51>
    5bec:	fff6c693          	not	a3,a3
    5bf0:	00d92223          	sw	a3,4(s2)
    5bf4:	0b000893          	li	a7,176
    5bf8:	0000c697          	auipc	a3,0xc
    5bfc:	dfb68693          	add	a3,a3,-517 # 119f3 <fmt+0x3>
    5c00:	01192023          	sw	a7,0(s2)
    5c04:	00d92423          	sw	a3,8(s2)
    5c08:	00c90913          	add	s2,s2,12

00005c0c <.L51>:
    5c0c:	00070c63          	beqz	a4,5c24 <.L52>
    5c10:	07000693          	li	a3,112
    5c14:	00d92023          	sw	a3,0(s2)
    5c18:	00e92223          	sw	a4,4(s2)
    5c1c:	00a92423          	sw	a0,8(s2)
    5c20:	00c90913          	add	s2,s2,12

00005c24 <.L52>:
    5c24:	06700693          	li	a3,103
    5c28:	00d41463          	bne	s0,a3,5c30 <.L53>
    5c2c:	02060a63          	beqz	a2,5c60 <.L54>

00005c30 <.L53>:
    5c30:	03412783          	lw	a5,52(sp)
    5c34:	02079663          	bnez	a5,5c60 <.L54>
    5c38:	41070733          	sub	a4,a4,a6
    5c3c:	02975263          	bge	a4,s1,5c60 <.L54>
    5c40:	40e484b3          	sub	s1,s1,a4
    5c44:	0b000693          	li	a3,176
    5c48:	0000c717          	auipc	a4,0xc
    5c4c:	dab70713          	add	a4,a4,-597 # 119f3 <fmt+0x3>
    5c50:	00d92023          	sw	a3,0(s2)
    5c54:	00992223          	sw	s1,4(s2)
    5c58:	00e92423          	sw	a4,8(s2)
    5c5c:	00c90913          	add	s2,s2,12

00005c60 <.L54>:
    5c60:	06600713          	li	a4,102
    5c64:	e2e58063          	beq	a1,a4,5284 <.L19>
    5c68:	06100713          	li	a4,97
    5c6c:	0b814e03          	lbu	t3,184(sp)
    5c70:	00300893          	li	a7,3
    5c74:	00e40463          	beq	s0,a4,5c7c <.L55>
    5c78:	00400893          	li	a7,4

00005c7c <.L55>:
    5c7c:	02b00813          	li	a6,43
    5c80:	000c5663          	bgez	s8,5c8c <.L56>
    5c84:	41800c33          	neg	s8,s8
    5c88:	02d00813          	li	a6,45

00005c8c <.L56>:
    5c8c:	0c0103a3          	sb	zero,199(sp)
    5c90:	00200693          	li	a3,2
    5c94:	0c710713          	add	a4,sp,199
    5c98:	00a00313          	li	t1,10

00005c9c <.L57>:
    5c9c:	026c6533          	rem	a0,s8,t1
    5ca0:	00168693          	add	a3,a3,1
    5ca4:	fff70613          	add	a2,a4,-1
    5ca8:	03050513          	add	a0,a0,48
    5cac:	fea70fa3          	sb	a0,-1(a4)
    5cb0:	026c4c33          	div	s8,s8,t1
    5cb4:	0516c263          	blt	a3,a7,5cf8 <.L81>
    5cb8:	040c1263          	bnez	s8,5cfc <.L58>
    5cbc:	07000793          	li	a5,112
    5cc0:	ffd70713          	add	a4,a4,-3
    5cc4:	00f92023          	sw	a5,0(s2)
    5cc8:	00d92223          	sw	a3,4(s2)
    5ccc:	00e92423          	sw	a4,8(s2)
    5cd0:	ff060fa3          	sb	a6,-1(a2)
    5cd4:	ffc60f23          	sb	t3,-2(a2)
    5cd8:	00c90913          	add	s2,s2,12
    5cdc:	da8ff06f          	j	5284 <.L19>

00005ce0 <.L48>:
    5ce0:	ea068ee3          	beqz	a3,5b9c <.L78>
    5ce4:	10d12623          	sw	a3,268(sp)
    5ce8:	00d50533          	add	a0,a0,a3
    5cec:	40d70733          	sub	a4,a4,a3

00005cf0 <.L77>:
    5cf0:	11410913          	add	s2,sp,276
    5cf4:	ea9ff06f          	j	5b9c <.L78>

00005cf8 <.L81>:
    5cf8:	00300693          	li	a3,3

00005cfc <.L58>:
    5cfc:	00060713          	mv	a4,a2
    5d00:	f9dff06f          	j	5c9c <.L57>

00005d04 <.L62>:
    5d04:	0109a603          	lw	a2,16(s3)
    5d08:	03000693          	li	a3,48
    5d0c:	0f412703          	lw	a4,244(sp)
    5d10:	00d61a63          	bne	a2,a3,5d24 <.L64>
    5d14:	10012703          	lw	a4,256(sp)
    5d18:	00f707b3          	add	a5,a4,a5
    5d1c:	10f12023          	sw	a5,256(sp)
    5d20:	e10ff06f          	j	5330 <.L63>

00005d24 <.L64>:
    5d24:	00e787b3          	add	a5,a5,a4
    5d28:	0ef12a23          	sw	a5,244(sp)
    5d2c:	e04ff06f          	j	5330 <.L63>

00005d30 <.L82>:
    5d30:	fff00493          	li	s1,-1
    5d34:	e30ff06f          	j	5364 <.L1>

00005d38 <__GI_fflush>:
    5d38:	ff010113          	add	sp,sp,-16
    5d3c:	00112623          	sw	ra,12(sp)
    5d40:	00812423          	sw	s0,8(sp)
    5d44:	00912223          	sw	s1,4(sp)
    5d48:	01212023          	sw	s2,0(sp)
    5d4c:	0000a797          	auipc	a5,0xa
    5d50:	6d87a783          	lw	a5,1752(a5) # 10424 <_GLOBAL_OFFSET_TABLE_+0x1c>
    5d54:	04f50263          	beq	a0,a5,5d98 <.L11>
    5d58:	00050413          	mv	s0,a0
    5d5c:	10000913          	li	s2,256
    5d60:	02050e63          	beqz	a0,5d9c <.L2>
    5d64:	00055783          	lhu	a5,0(a0)
    5d68:	0407f793          	and	a5,a5,64
    5d6c:	02078263          	beqz	a5,5d90 <.L10>
    5d70:	c29fb0ef          	jal	1998 <__stdio_wcommit>
    5d74:	fff00493          	li	s1,-1
    5d78:	02051863          	bnez	a0,5da8 <.L1>
    5d7c:	00842783          	lw	a5,8(s0)
    5d80:	00f42e23          	sw	a5,28(s0)
    5d84:	00045783          	lhu	a5,0(s0)
    5d88:	fbf7f793          	and	a5,a5,-65
    5d8c:	00f41023          	sh	a5,0(s0)

00005d90 <.L10>:
    5d90:	00000493          	li	s1,0
    5d94:	0140006f          	j	5da8 <.L1>

00005d98 <.L11>:
    5d98:	00000913          	li	s2,0

00005d9c <.L2>:
    5d9c:	0007a403          	lw	s0,0(a5)
    5da0:	00000493          	li	s1,0

00005da4 <.L4>:
    5da4:	02041063          	bnez	s0,5dc4 <.L8>

00005da8 <.L1>:
    5da8:	00c12083          	lw	ra,12(sp)
    5dac:	00812403          	lw	s0,8(sp)
    5db0:	00012903          	lw	s2,0(sp)
    5db4:	00048513          	mv	a0,s1
    5db8:	00412483          	lw	s1,4(sp)
    5dbc:	01010113          	add	sp,sp,16
    5dc0:	00008067          	ret

00005dc4 <.L8>:
    5dc4:	00045783          	lhu	a5,0(s0)
    5dc8:	0407f713          	and	a4,a5,64
    5dcc:	02070a63          	beqz	a4,5e00 <.L7>
    5dd0:	0127e7b3          	or	a5,a5,s2
    5dd4:	1407c793          	xor	a5,a5,320
    5dd8:	3407f793          	and	a5,a5,832
    5ddc:	02079263          	bnez	a5,5e00 <.L7>
    5de0:	00040513          	mv	a0,s0
    5de4:	bb5fb0ef          	jal	1998 <__stdio_wcommit>
    5de8:	02051063          	bnez	a0,5e08 <.L12>
    5dec:	00842783          	lw	a5,8(s0)
    5df0:	00f42e23          	sw	a5,28(s0)
    5df4:	00045783          	lhu	a5,0(s0)
    5df8:	fbf7f793          	and	a5,a5,-65
    5dfc:	00f41023          	sh	a5,0(s0)

00005e00 <.L7>:
    5e00:	02042403          	lw	s0,32(s0)
    5e04:	fa1ff06f          	j	5da4 <.L4>

00005e08 <.L12>:
    5e08:	fff00493          	li	s1,-1
    5e0c:	ff5ff06f          	j	5e00 <.L7>

00005e10 <__GI___fgetc_unlocked>:
    5e10:	01052783          	lw	a5,16(a0)
    5e14:	01852703          	lw	a4,24(a0)
    5e18:	fe010113          	add	sp,sp,-32
    5e1c:	00812c23          	sw	s0,24(sp)
    5e20:	00112e23          	sw	ra,28(sp)
    5e24:	00050413          	mv	s0,a0
    5e28:	00e7fa63          	bgeu	a5,a4,5e3c <.L2>

00005e2c <.L29>:
    5e2c:	00178713          	add	a4,a5,1
    5e30:	00e42823          	sw	a4,16(s0)
    5e34:	0007c503          	lbu	a0,0(a5)
    5e38:	0340006f          	j	5e6c <.L1>

00005e3c <.L2>:
    5e3c:	00055783          	lhu	a5,0(a0)
    5e40:	0037f793          	and	a5,a5,3
    5e44:	02078c63          	beqz	a5,5e7c <.L4>

00005e48 <.L7>:
    5e48:	00045783          	lhu	a5,0(s0)
    5e4c:	0027f713          	and	a4,a5,2
    5e50:	02070e63          	beqz	a4,5e8c <.L27>
    5e54:	fff78713          	add	a4,a5,-1
    5e58:	0017f793          	and	a5,a5,1
    5e5c:	00e41023          	sh	a4,0(s0)
    5e60:	00f407b3          	add	a5,s0,a5
    5e64:	0027c503          	lbu	a0,2(a5)
    5e68:	000401a3          	sb	zero,3(s0)

00005e6c <.L1>:
    5e6c:	01c12083          	lw	ra,28(sp)
    5e70:	01812403          	lw	s0,24(sp)
    5e74:	02010113          	add	sp,sp,32
    5e78:	00008067          	ret

00005e7c <.L4>:
    5e7c:	001010ef          	jal	767c <__stdio_trans2r>
    5e80:	fc0504e3          	beqz	a0,5e48 <.L7>

00005e84 <.L8>:
    5e84:	fff00513          	li	a0,-1
    5e88:	fe5ff06f          	j	5e6c <.L1>

00005e8c <.L27>:
    5e8c:	01042703          	lw	a4,16(s0)
    5e90:	01442683          	lw	a3,20(s0)
    5e94:	00e68a63          	beq	a3,a4,5ea8 <.L9>
    5e98:	00170793          	add	a5,a4,1
    5e9c:	00f42823          	sw	a5,16(s0)
    5ea0:	00074503          	lbu	a0,0(a4)
    5ea4:	fc9ff06f          	j	5e6c <.L1>

00005ea8 <.L9>:
    5ea8:	00442683          	lw	a3,4(s0)
    5eac:	ffd00713          	li	a4,-3
    5eb0:	00e69863          	bne	a3,a4,5ec0 <.L10>
    5eb4:	0047e793          	or	a5,a5,4
    5eb8:	00f41023          	sh	a5,0(s0)
    5ebc:	fc9ff06f          	j	5e84 <.L8>

00005ec0 <.L10>:
    5ec0:	3007f793          	and	a5,a5,768
    5ec4:	00078863          	beqz	a5,5ed4 <.L11>
    5ec8:	0000a517          	auipc	a0,0xa
    5ecc:	55c52503          	lw	a0,1372(a0) # 10424 <_GLOBAL_OFFSET_TABLE_+0x1c>
    5ed0:	e69ff0ef          	jal	5d38 <__GI_fflush>

00005ed4 <.L11>:
    5ed4:	00842783          	lw	a5,8(s0)
    5ed8:	00c42703          	lw	a4,12(s0)
    5edc:	02f70263          	beq	a4,a5,5f00 <.L12>
    5ee0:	00f42c23          	sw	a5,24(s0)
    5ee4:	00040513          	mv	a0,s0
    5ee8:	754010ef          	jal	763c <__stdio_rfill>
    5eec:	f8050ce3          	beqz	a0,5e84 <.L8>
    5ef0:	01442783          	lw	a5,20(s0)
    5ef4:	00f42c23          	sw	a5,24(s0)
    5ef8:	01042783          	lw	a5,16(s0)
    5efc:	f31ff06f          	j	5e2c <.L29>

00005f00 <.L12>:
    5f00:	00100613          	li	a2,1
    5f04:	00f10593          	add	a1,sp,15
    5f08:	00040513          	mv	a0,s0
    5f0c:	60c010ef          	jal	7518 <__stdio_READ>
    5f10:	f6050ae3          	beqz	a0,5e84 <.L8>
    5f14:	00f14503          	lbu	a0,15(sp)
    5f18:	f55ff06f          	j	5e6c <.L1>

00005f1c <__GI_fgets>:
    5f1c:	fe010113          	add	sp,sp,-32
    5f20:	00112e23          	sw	ra,28(sp)
    5f24:	00812c23          	sw	s0,24(sp)
    5f28:	00912a23          	sw	s1,20(sp)
    5f2c:	01212823          	sw	s2,16(sp)
    5f30:	01312623          	sw	s3,12(sp)
    5f34:	01412423          	sw	s4,8(sp)
    5f38:	01512223          	sw	s5,4(sp)
    5f3c:	01612023          	sw	s6,0(sp)
    5f40:	02b04a63          	bgtz	a1,5f74 <.L2>

00005f44 <.L9>:
    5f44:	00000493          	li	s1,0

00005f48 <.L3>:
    5f48:	01c12083          	lw	ra,28(sp)
    5f4c:	01812403          	lw	s0,24(sp)
    5f50:	01012903          	lw	s2,16(sp)
    5f54:	00c12983          	lw	s3,12(sp)
    5f58:	00812a03          	lw	s4,8(sp)
    5f5c:	00412a83          	lw	s5,4(sp)
    5f60:	00012b03          	lw	s6,0(sp)
    5f64:	00048513          	mv	a0,s1
    5f68:	01412483          	lw	s1,20(sp)
    5f6c:	02010113          	add	sp,sp,32
    5f70:	00008067          	ret

00005f74 <.L2>:
    5f74:	00050493          	mv	s1,a0
    5f78:	00060913          	mv	s2,a2
    5f7c:	00150413          	add	s0,a0,1
    5f80:	00b509b3          	add	s3,a0,a1
    5f84:	fff00b13          	li	s6,-1
    5f88:	00a00a93          	li	s5,10

00005f8c <.L4>:
    5f8c:	fff40a13          	add	s4,s0,-1
    5f90:	03340463          	beq	s0,s3,5fb8 <.L6>
    5f94:	01092783          	lw	a5,16(s2)
    5f98:	01892703          	lw	a4,24(s2)
    5f9c:	02e7f463          	bgeu	a5,a4,5fc4 <.L5>
    5fa0:	00178713          	add	a4,a5,1
    5fa4:	00e92823          	sw	a4,16(s2)
    5fa8:	0007c783          	lbu	a5,0(a5)
    5fac:	00040a13          	mv	s4,s0
    5fb0:	fef40fa3          	sb	a5,-1(s0)
    5fb4:	03579e63          	bne	a5,s5,5ff0 <.L7>

00005fb8 <.L6>:
    5fb8:	f944f6e3          	bgeu	s1,s4,5f44 <.L9>
    5fbc:	000a0023          	sb	zero,0(s4)
    5fc0:	f89ff06f          	j	5f48 <.L3>

00005fc4 <.L5>:
    5fc4:	00090513          	mv	a0,s2
    5fc8:	e49ff0ef          	jal	5e10 <__GI___fgetc_unlocked>
    5fcc:	01651a63          	bne	a0,s6,5fe0 <.L8>
    5fd0:	00095783          	lhu	a5,0(s2)
    5fd4:	0087f793          	and	a5,a5,8
    5fd8:	fe0780e3          	beqz	a5,5fb8 <.L6>
    5fdc:	f69ff06f          	j	5f44 <.L9>

00005fe0 <.L8>:
    5fe0:	0ff57513          	zext.b	a0,a0
    5fe4:	fea40fa3          	sb	a0,-1(s0)
    5fe8:	00040a13          	mv	s4,s0
    5fec:	fd5506e3          	beq	a0,s5,5fb8 <.L6>

00005ff0 <.L7>:
    5ff0:	00140413          	add	s0,s0,1
    5ff4:	f99ff06f          	j	5f8c <.L4>

00005ff8 <__GI_memchr>:
    5ff8:	0ff5f793          	zext.b	a5,a1

00005ffc <.L2>:
    5ffc:	00060663          	beqz	a2,6008 <.L4>
    6000:	00357713          	and	a4,a0,3
    6004:	02071c63          	bnez	a4,603c <.L5>

00006008 <.L4>:
    6008:	01010737          	lui	a4,0x1010
    600c:	0ff5f593          	zext.b	a1,a1
    6010:	10170713          	add	a4,a4,257 # 1010101 <_ebss+0xffa051>
    6014:	02e585b3          	mul	a1,a1,a4
    6018:	7eff0837          	lui	a6,0x7eff0
    601c:	00300313          	li	t1,3
    6020:	eff80813          	add	a6,a6,-257 # 7efefeff <_ebss+0x7efd9e4f>
    6024:	fff00e13          	li	t3,-1

00006028 <.L6>:
    6028:	02c36463          	bltu	t1,a2,6050 <.L10>
    602c:	00c50633          	add	a2,a0,a2

00006030 <.L11>:
    6030:	08c51063          	bne	a0,a2,60b0 <.L12>
    6034:	00000513          	li	a0,0

00006038 <.L1>:
    6038:	00008067          	ret

0000603c <.L5>:
    603c:	00054703          	lbu	a4,0(a0)
    6040:	fef70ce3          	beq	a4,a5,6038 <.L1>
    6044:	fff60613          	add	a2,a2,-1
    6048:	00150513          	add	a0,a0,1
    604c:	fb1ff06f          	j	5ffc <.L2>

00006050 <.L10>:
    6050:	00052883          	lw	a7,0(a0)
    6054:	00450713          	add	a4,a0,4
    6058:	0115c8b3          	xor	a7,a1,a7
    605c:	010886b3          	add	a3,a7,a6
    6060:	0116c6b3          	xor	a3,a3,a7
    6064:	0106e6b3          	or	a3,a3,a6
    6068:	03c68e63          	beq	a3,t3,60a4 <.L7>
    606c:	ffc74683          	lbu	a3,-4(a4)
    6070:	fcf684e3          	beq	a3,a5,6038 <.L1>
    6074:	ffd74683          	lbu	a3,-3(a4)
    6078:	00f69663          	bne	a3,a5,6084 <.L8>
    607c:	00150513          	add	a0,a0,1
    6080:	00008067          	ret

00006084 <.L8>:
    6084:	ffe74683          	lbu	a3,-2(a4)
    6088:	00f69663          	bne	a3,a5,6094 <.L9>
    608c:	00250513          	add	a0,a0,2
    6090:	00008067          	ret

00006094 <.L9>:
    6094:	fff74683          	lbu	a3,-1(a4)
    6098:	00f69663          	bne	a3,a5,60a4 <.L7>
    609c:	00350513          	add	a0,a0,3
    60a0:	00008067          	ret

000060a4 <.L7>:
    60a4:	ffc60613          	add	a2,a2,-4
    60a8:	00070513          	mv	a0,a4
    60ac:	f7dff06f          	j	6028 <.L6>

000060b0 <.L12>:
    60b0:	00054703          	lbu	a4,0(a0)
    60b4:	f8f702e3          	beq	a4,a5,6038 <.L1>
    60b8:	00150513          	add	a0,a0,1
    60bc:	f75ff06f          	j	6030 <.L11>

000060c0 <__GI_mempcpy>:
    60c0:	ff010113          	add	sp,sp,-16
    60c4:	00812423          	sw	s0,8(sp)
    60c8:	00912223          	sw	s1,4(sp)
    60cc:	00112623          	sw	ra,12(sp)
    60d0:	00050493          	mv	s1,a0
    60d4:	00060413          	mv	s0,a2
    60d8:	a19fc0ef          	jal	2af0 <__GI_memcpy>
    60dc:	00848533          	add	a0,s1,s0
    60e0:	00c12083          	lw	ra,12(sp)
    60e4:	00812403          	lw	s0,8(sp)
    60e8:	00412483          	lw	s1,4(sp)
    60ec:	01010113          	add	sp,sp,16
    60f0:	00008067          	ret

000060f4 <__GI_memrchr>:
    60f4:	0ff5f793          	zext.b	a5,a1
    60f8:	00c50533          	add	a0,a0,a2

000060fc <.L2>:
    60fc:	00060663          	beqz	a2,6108 <.L4>
    6100:	00357713          	and	a4,a0,3
    6104:	02071e63          	bnez	a4,6140 <.L5>

00006108 <.L4>:
    6108:	01010737          	lui	a4,0x1010
    610c:	0ff5f593          	zext.b	a1,a1
    6110:	10170713          	add	a4,a4,257 # 1010101 <_ebss+0xffa051>
    6114:	02e585b3          	mul	a1,a1,a4
    6118:	7eff0837          	lui	a6,0x7eff0
    611c:	00050693          	mv	a3,a0
    6120:	00300313          	li	t1,3
    6124:	eff80813          	add	a6,a6,-257 # 7efefeff <_ebss+0x7efd9e4f>
    6128:	fff00e13          	li	t3,-1

0000612c <.L6>:
    612c:	02c36463          	bltu	t1,a2,6154 <.L11>
    6130:	40c50633          	sub	a2,a0,a2

00006134 <.L12>:
    6134:	08c51063          	bne	a0,a2,61b4 <.L13>
    6138:	00000513          	li	a0,0
    613c:	00008067          	ret

00006140 <.L5>:
    6140:	fff54703          	lbu	a4,-1(a0)
    6144:	fff50513          	add	a0,a0,-1
    6148:	06f70c63          	beq	a4,a5,61c0 <.L1>
    614c:	fff60613          	add	a2,a2,-1
    6150:	fadff06f          	j	60fc <.L2>

00006154 <.L11>:
    6154:	ffc52883          	lw	a7,-4(a0)
    6158:	ffc50513          	add	a0,a0,-4
    615c:	0115c8b3          	xor	a7,a1,a7
    6160:	01088733          	add	a4,a7,a6
    6164:	01174733          	xor	a4,a4,a7
    6168:	01076733          	or	a4,a4,a6
    616c:	03c70e63          	beq	a4,t3,61a8 <.L7>
    6170:	00354703          	lbu	a4,3(a0)
    6174:	00f71663          	bne	a4,a5,6180 <.L8>
    6178:	fff68513          	add	a0,a3,-1
    617c:	00008067          	ret

00006180 <.L8>:
    6180:	00254703          	lbu	a4,2(a0)
    6184:	00f71663          	bne	a4,a5,6190 <.L9>
    6188:	ffe68513          	add	a0,a3,-2
    618c:	00008067          	ret

00006190 <.L9>:
    6190:	00154703          	lbu	a4,1(a0)
    6194:	00f71663          	bne	a4,a5,61a0 <.L10>
    6198:	ffd68513          	add	a0,a3,-3
    619c:	00008067          	ret

000061a0 <.L10>:
    61a0:	00054703          	lbu	a4,0(a0)
    61a4:	00f70e63          	beq	a4,a5,61c0 <.L1>

000061a8 <.L7>:
    61a8:	ffc60613          	add	a2,a2,-4
    61ac:	00050693          	mv	a3,a0
    61b0:	f7dff06f          	j	612c <.L6>

000061b4 <.L13>:
    61b4:	fff54703          	lbu	a4,-1(a0)
    61b8:	fff50513          	add	a0,a0,-1
    61bc:	f6f71ce3          	bne	a4,a5,6134 <.L12>

000061c0 <.L1>:
    61c0:	00008067          	ret

000061c4 <__GI_strchr>:
    61c4:	0ff5f693          	zext.b	a3,a1

000061c8 <.L2>:
    61c8:	00357793          	and	a5,a0,3
    61cc:	06079263          	bnez	a5,6230 <.L4>
    61d0:	010107b7          	lui	a5,0x1010
    61d4:	0ff5f593          	zext.b	a1,a1
    61d8:	10178793          	add	a5,a5,257 # 1010101 <_ebss+0xffa051>
    61dc:	02f585b3          	mul	a1,a1,a5
    61e0:	7eff0637          	lui	a2,0x7eff0
    61e4:	eff60613          	add	a2,a2,-257 # 7efefeff <_ebss+0x7efd9e4f>
    61e8:	fff00313          	li	t1,-1

000061ec <.L5>:
    61ec:	00052803          	lw	a6,0(a0)
    61f0:	00450713          	add	a4,a0,4
    61f4:	0105c8b3          	xor	a7,a1,a6
    61f8:	00c807b3          	add	a5,a6,a2
    61fc:	0107c7b3          	xor	a5,a5,a6
    6200:	00c88833          	add	a6,a7,a2
    6204:	01184833          	xor	a6,a6,a7
    6208:	0107f7b3          	and	a5,a5,a6
    620c:	00c7e7b3          	or	a5,a5,a2
    6210:	02678a63          	beq	a5,t1,6244 <.L6>
    6214:	ffc74783          	lbu	a5,-4(a4)
    6218:	06d78263          	beq	a5,a3,627c <.L1>
    621c:	04078e63          	beqz	a5,6278 <.L13>
    6220:	ffd74783          	lbu	a5,-3(a4)
    6224:	02d79463          	bne	a5,a3,624c <.L7>
    6228:	00150513          	add	a0,a0,1
    622c:	00008067          	ret

00006230 <.L4>:
    6230:	00054783          	lbu	a5,0(a0)
    6234:	04d78463          	beq	a5,a3,627c <.L1>
    6238:	04078063          	beqz	a5,6278 <.L13>
    623c:	00150513          	add	a0,a0,1
    6240:	f89ff06f          	j	61c8 <.L2>

00006244 <.L6>:
    6244:	00070513          	mv	a0,a4
    6248:	fa5ff06f          	j	61ec <.L5>

0000624c <.L7>:
    624c:	02078663          	beqz	a5,6278 <.L13>
    6250:	ffe74783          	lbu	a5,-2(a4)
    6254:	00d79663          	bne	a5,a3,6260 <.L8>
    6258:	00250513          	add	a0,a0,2
    625c:	00008067          	ret

00006260 <.L8>:
    6260:	00078c63          	beqz	a5,6278 <.L13>
    6264:	fff74783          	lbu	a5,-1(a4)
    6268:	00d79663          	bne	a5,a3,6274 <.L9>
    626c:	00350513          	add	a0,a0,3
    6270:	00008067          	ret

00006274 <.L9>:
    6274:	fc0798e3          	bnez	a5,6244 <.L6>

00006278 <.L13>:
    6278:	00000513          	li	a0,0

0000627c <.L1>:
    627c:	00008067          	ret

00006280 <__GI_strchrnul>:
    6280:	0ff5f693          	zext.b	a3,a1

00006284 <.L2>:
    6284:	00357793          	and	a5,a0,3
    6288:	08079463          	bnez	a5,6310 <.L4>
    628c:	010107b7          	lui	a5,0x1010
    6290:	0ff5f593          	zext.b	a1,a1
    6294:	10178793          	add	a5,a5,257 # 1010101 <_ebss+0xffa051>
    6298:	02f585b3          	mul	a1,a1,a5
    629c:	7eff0637          	lui	a2,0x7eff0
    62a0:	eff60613          	add	a2,a2,-257 # 7efefeff <_ebss+0x7efd9e4f>
    62a4:	fff00313          	li	t1,-1

000062a8 <.L5>:
    62a8:	00052803          	lw	a6,0(a0)
    62ac:	00450793          	add	a5,a0,4
    62b0:	0105c8b3          	xor	a7,a1,a6
    62b4:	00c80733          	add	a4,a6,a2
    62b8:	01074733          	xor	a4,a4,a6
    62bc:	00c88833          	add	a6,a7,a2
    62c0:	01184833          	xor	a6,a6,a7
    62c4:	01077733          	and	a4,a4,a6
    62c8:	00c76733          	or	a4,a4,a2
    62cc:	04670c63          	beq	a4,t1,6324 <.L6>
    62d0:	ffc7c703          	lbu	a4,-4(a5)
    62d4:	02d70c63          	beq	a4,a3,630c <.L1>
    62d8:	02070a63          	beqz	a4,630c <.L1>
    62dc:	ffd7c703          	lbu	a4,-3(a5)
    62e0:	00150513          	add	a0,a0,1
    62e4:	02d70463          	beq	a4,a3,630c <.L1>
    62e8:	02070263          	beqz	a4,630c <.L1>
    62ec:	ffe7c703          	lbu	a4,-2(a5)
    62f0:	ffe78513          	add	a0,a5,-2
    62f4:	00d70c63          	beq	a4,a3,630c <.L1>
    62f8:	00070a63          	beqz	a4,630c <.L1>
    62fc:	fff7c703          	lbu	a4,-1(a5)
    6300:	fff78513          	add	a0,a5,-1
    6304:	00d70463          	beq	a4,a3,630c <.L1>
    6308:	00071e63          	bnez	a4,6324 <.L6>

0000630c <.L1>:
    630c:	00008067          	ret

00006310 <.L4>:
    6310:	00054783          	lbu	a5,0(a0)
    6314:	fed78ce3          	beq	a5,a3,630c <.L1>
    6318:	fe078ae3          	beqz	a5,630c <.L1>
    631c:	00150513          	add	a0,a0,1
    6320:	f65ff06f          	j	6284 <.L2>

00006324 <.L6>:
    6324:	00078513          	mv	a0,a5
    6328:	f81ff06f          	j	62a8 <.L5>

0000632c <__GI_strcmp>:
    632c:	00054703          	lbu	a4,0(a0)
    6330:	00150513          	add	a0,a0,1
    6334:	00158593          	add	a1,a1,1
    6338:	fff5c783          	lbu	a5,-1(a1)
    633c:	00071663          	bnez	a4,6348 <.L2>
    6340:	40f00533          	neg	a0,a5
    6344:	00008067          	ret

00006348 <.L2>:
    6348:	fef702e3          	beq	a4,a5,632c <__GI_strcmp>
    634c:	40f70533          	sub	a0,a4,a5
    6350:	00008067          	ret

00006354 <__GI_strcspn>:
    6354:	ff010113          	add	sp,sp,-16
    6358:	00812423          	sw	s0,8(sp)
    635c:	00912223          	sw	s1,4(sp)
    6360:	01212023          	sw	s2,0(sp)
    6364:	00112623          	sw	ra,12(sp)
    6368:	00050493          	mv	s1,a0
    636c:	00058913          	mv	s2,a1
    6370:	00000413          	li	s0,0

00006374 <.L2>:
    6374:	008487b3          	add	a5,s1,s0
    6378:	0007c583          	lbu	a1,0(a5)
    637c:	02059063          	bnez	a1,639c <.L4>

00006380 <.L1>:
    6380:	00c12083          	lw	ra,12(sp)
    6384:	00040513          	mv	a0,s0
    6388:	00812403          	lw	s0,8(sp)
    638c:	00412483          	lw	s1,4(sp)
    6390:	00012903          	lw	s2,0(sp)
    6394:	01010113          	add	sp,sp,16
    6398:	00008067          	ret

0000639c <.L4>:
    639c:	00090513          	mv	a0,s2
    63a0:	e25ff0ef          	jal	61c4 <__GI_strchr>
    63a4:	fc051ee3          	bnez	a0,6380 <.L1>
    63a8:	00140413          	add	s0,s0,1
    63ac:	fc9ff06f          	j	6374 <.L2>

000063b0 <__GI_strrchr>:
    63b0:	ff010113          	add	sp,sp,-16
    63b4:	00812423          	sw	s0,8(sp)
    63b8:	00112623          	sw	ra,12(sp)
    63bc:	00912223          	sw	s1,4(sp)
    63c0:	0ff5f413          	zext.b	s0,a1
    63c4:	04041663          	bnez	s0,6410 <.L6>
    63c8:	00812403          	lw	s0,8(sp)
    63cc:	00c12083          	lw	ra,12(sp)
    63d0:	00412483          	lw	s1,4(sp)
    63d4:	00000593          	li	a1,0
    63d8:	01010113          	add	sp,sp,16
    63dc:	de9ff06f          	j	61c4 <__GI_strchr>

000063e0 <.L3>:
    63e0:	00150793          	add	a5,a0,1
    63e4:	00050493          	mv	s1,a0

000063e8 <.L2>:
    63e8:	00040593          	mv	a1,s0
    63ec:	00078513          	mv	a0,a5
    63f0:	dd5ff0ef          	jal	61c4 <__GI_strchr>
    63f4:	fe0516e3          	bnez	a0,63e0 <.L3>
    63f8:	00c12083          	lw	ra,12(sp)
    63fc:	00812403          	lw	s0,8(sp)
    6400:	00048513          	mv	a0,s1
    6404:	00412483          	lw	s1,4(sp)
    6408:	01010113          	add	sp,sp,16
    640c:	00008067          	ret

00006410 <.L6>:
    6410:	00050793          	mv	a5,a0
    6414:	00000493          	li	s1,0
    6418:	fd1ff06f          	j	63e8 <.L2>

0000641c <__GI_strspn>:
    641c:	00050793          	mv	a5,a0
    6420:	00000513          	li	a0,0

00006424 <.L2>:
    6424:	00a78733          	add	a4,a5,a0
    6428:	00074683          	lbu	a3,0(a4)
    642c:	00069e63          	bnez	a3,6448 <.L7>
    6430:	00008067          	ret

00006434 <.L4>:
    6434:	00d60e63          	beq	a2,a3,6450 <.L3>
    6438:	00170713          	add	a4,a4,1

0000643c <.L6>:
    643c:	00074603          	lbu	a2,0(a4)
    6440:	fe061ae3          	bnez	a2,6434 <.L4>
    6444:	00008067          	ret

00006448 <.L7>:
    6448:	00058713          	mv	a4,a1
    644c:	ff1ff06f          	j	643c <.L6>

00006450 <.L3>:
    6450:	00150513          	add	a0,a0,1
    6454:	fd1ff06f          	j	6424 <.L2>

00006458 <calloc>:
    6458:	02a5b7b3          	mulhu	a5,a1,a0
    645c:	fe010113          	add	sp,sp,-32
    6460:	00112e23          	sw	ra,28(sp)
    6464:	00812c23          	sw	s0,24(sp)
    6468:	02a58633          	mul	a2,a1,a0
    646c:	02078663          	beqz	a5,6498 <.L9>
    6470:	0000a797          	auipc	a5,0xa
    6474:	fa47a783          	lw	a5,-92(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    6478:	00c00713          	li	a4,12
    647c:	00e7a023          	sw	a4,0(a5)
    6480:	00000413          	li	s0,0

00006484 <.L1>:
    6484:	01c12083          	lw	ra,28(sp)
    6488:	00040513          	mv	a0,s0
    648c:	01812403          	lw	s0,24(sp)
    6490:	02010113          	add	sp,sp,32
    6494:	00008067          	ret

00006498 <.L9>:
    6498:	00060513          	mv	a0,a2
    649c:	00c12623          	sw	a2,12(sp)
    64a0:	e29fc0ef          	jal	32c8 <malloc>
    64a4:	00050413          	mv	s0,a0
    64a8:	fc050ee3          	beqz	a0,6484 <.L1>
    64ac:	00c12603          	lw	a2,12(sp)
    64b0:	00000593          	li	a1,0
    64b4:	8e5fc0ef          	jal	2d98 <__GI_memset>
    64b8:	fcdff06f          	j	6484 <.L1>

000064bc <realloc>:
    64bc:	00051663          	bnez	a0,64c8 <.L2>
    64c0:	00058513          	mv	a0,a1
    64c4:	e05fc06f          	j	32c8 <malloc>

000064c8 <.L2>:
    64c8:	ff010113          	add	sp,sp,-16
    64cc:	00112623          	sw	ra,12(sp)
    64d0:	00812423          	sw	s0,8(sp)
    64d4:	00912223          	sw	s1,4(sp)
    64d8:	01212023          	sw	s2,0(sp)
    64dc:	02059463          	bnez	a1,6504 <.L3>
    64e0:	800fd0ef          	jal	34e0 <free>

000064e4 <.L4>:
    64e4:	00000413          	li	s0,0

000064e8 <.L1>:
    64e8:	00c12083          	lw	ra,12(sp)
    64ec:	00040513          	mv	a0,s0
    64f0:	00812403          	lw	s0,8(sp)
    64f4:	00412483          	lw	s1,4(sp)
    64f8:	00012903          	lw	s2,0(sp)
    64fc:	01010113          	add	sp,sp,16
    6500:	00008067          	ret

00006504 <.L3>:
    6504:	ff000793          	li	a5,-16
    6508:	fcb7eee3          	bltu	a5,a1,64e4 <.L4>
    650c:	ff852903          	lw	s2,-8(a0)
    6510:	00f58413          	add	s0,a1,15
    6514:	ff847413          	and	s0,s0,-8
    6518:	00050493          	mv	s1,a0
    651c:	ff850793          	add	a5,a0,-8
    6520:	04897a63          	bgeu	s2,s0,6574 <.L7>
    6524:	41240633          	sub	a2,s0,s2
    6528:	012785b3          	add	a1,a5,s2
    652c:	0000c517          	auipc	a0,0xc
    6530:	ff850513          	add	a0,a0,-8 # 12524 <__malloc_heap>
    6534:	064000ef          	jal	6598 <__heap_alloc_at>
    6538:	00050a63          	beqz	a0,654c <.L8>
    653c:	00a90933          	add	s2,s2,a0
    6540:	ff24ac23          	sw	s2,-8(s1)

00006544 <.L9>:
    6544:	00048413          	mv	s0,s1
    6548:	fa1ff06f          	j	64e8 <.L1>

0000654c <.L8>:
    654c:	ff840513          	add	a0,s0,-8
    6550:	d79fc0ef          	jal	32c8 <malloc>
    6554:	00050413          	mv	s0,a0
    6558:	f80508e3          	beqz	a0,64e8 <.L1>
    655c:	ff890613          	add	a2,s2,-8
    6560:	00048593          	mv	a1,s1
    6564:	d8cfc0ef          	jal	2af0 <__GI_memcpy>
    6568:	00048513          	mv	a0,s1
    656c:	f75fc0ef          	jal	34e0 <free>
    6570:	f79ff06f          	j	64e8 <.L1>

00006574 <.L7>:
    6574:	02040713          	add	a4,s0,32
    6578:	fce966e3          	bltu	s2,a4,6544 <.L9>
    657c:	40890633          	sub	a2,s2,s0
    6580:	008785b3          	add	a1,a5,s0
    6584:	0000c517          	auipc	a0,0xc
    6588:	fa050513          	add	a0,a0,-96 # 12524 <__malloc_heap>
    658c:	fe9fc0ef          	jal	3574 <__heap_free>
    6590:	fe84ac23          	sw	s0,-8(s1)
    6594:	fb1ff06f          	j	6544 <.L9>

00006598 <__heap_alloc_at>:
    6598:	00052783          	lw	a5,0(a0)
    659c:	00050713          	mv	a4,a0
    65a0:	00c00813          	li	a6,12

000065a4 <.L2>:
    65a4:	00079663          	bnez	a5,65b0 <.L9>

000065a8 <.L11>:
    65a8:	00000513          	li	a0,0
    65ac:	00008067          	ret

000065b0 <.L9>:
    65b0:	0007a503          	lw	a0,0(a5)
    65b4:	40a806b3          	sub	a3,a6,a0
    65b8:	00d786b3          	add	a3,a5,a3
    65bc:	04d5ea63          	bltu	a1,a3,6610 <.L3>
    65c0:	feb694e3          	bne	a3,a1,65a8 <.L11>
    65c4:	00760613          	add	a2,a2,7
    65c8:	ff867613          	and	a2,a2,-8
    65cc:	fcc56ee3          	bltu	a0,a2,65a8 <.L11>
    65d0:	03060693          	add	a3,a2,48
    65d4:	02d57663          	bgeu	a0,a3,6600 <.L5>
    65d8:	0047a683          	lw	a3,4(a5)
    65dc:	00068663          	beqz	a3,65e8 <.L6>
    65e0:	0087a603          	lw	a2,8(a5)
    65e4:	00c6a423          	sw	a2,8(a3)

000065e8 <.L6>:
    65e8:	0087a783          	lw	a5,8(a5)
    65ec:	00078663          	beqz	a5,65f8 <.L7>
    65f0:	00d7a223          	sw	a3,4(a5)
    65f4:	00008067          	ret

000065f8 <.L7>:
    65f8:	00d72023          	sw	a3,0(a4)
    65fc:	00008067          	ret

00006600 <.L5>:
    6600:	40c50533          	sub	a0,a0,a2
    6604:	00a7a023          	sw	a0,0(a5)
    6608:	00060513          	mv	a0,a2
    660c:	00008067          	ret

00006610 <.L3>:
    6610:	0047a783          	lw	a5,4(a5)
    6614:	f91ff06f          	j	65a4 <.L2>

00006618 <__GI_exit>:
    6618:	ff010113          	add	sp,sp,-16
    661c:	00812423          	sw	s0,8(sp)
    6620:	00010717          	auipc	a4,0x10
    6624:	91c72703          	lw	a4,-1764(a4) # 15f3c <__exit_cleanup>
    6628:	00112623          	sw	ra,12(sp)
    662c:	00070793          	mv	a5,a4
    6630:	00050413          	mv	s0,a0
    6634:	00078463          	beqz	a5,663c <.L2>
    6638:	000700e7          	jalr	a4

0000663c <.L2>:
    663c:	f44fd0ef          	jal	3d80 <__uClibc_fini>
    6640:	0000a717          	auipc	a4,0xa
    6644:	e0472703          	lw	a4,-508(a4) # 10444 <.LLST98+0x19>
    6648:	00070793          	mv	a5,a4
    664c:	00078463          	beqz	a5,6654 <.L3>
    6650:	000700e7          	jalr	a4

00006654 <.L3>:
    6654:	00040513          	mv	a0,s0
    6658:	409000ef          	jal	7260 <__GI__exit>

0000665c <__ieee754_atan2>:
    665c:	00060893          	mv	a7,a2
    6660:	80000837          	lui	a6,0x80000
    6664:	40c00633          	neg	a2,a2
    6668:	fff80813          	add	a6,a6,-1 # 7fffffff <_ebss+0x7ffe9f4f>
    666c:	01166633          	or	a2,a2,a7
    6670:	ff010113          	add	sp,sp,-16
    6674:	00d87333          	and	t1,a6,a3
    6678:	01f65613          	srl	a2,a2,0x1f
    667c:	00112623          	sw	ra,12(sp)
    6680:	00812423          	sw	s0,8(sp)
    6684:	00666633          	or	a2,a2,t1
    6688:	7ff00e37          	lui	t3,0x7ff00
    668c:	00050793          	mv	a5,a0
    6690:	00058713          	mv	a4,a1
    6694:	02ce6063          	bltu	t3,a2,66b4 <.L2>
    6698:	40a00633          	neg	a2,a0
    669c:	00a66633          	or	a2,a2,a0
    66a0:	00b87833          	and	a6,a6,a1
    66a4:	01f65613          	srl	a2,a2,0x1f
    66a8:	01066633          	or	a2,a2,a6
    66ac:	00058e93          	mv	t4,a1
    66b0:	02ce7063          	bgeu	t3,a2,66d0 <.L3>

000066b4 <.L2>:
    66b4:	00088613          	mv	a2,a7
    66b8:	00078513          	mv	a0,a5
    66bc:	00070593          	mv	a1,a4
    66c0:	389020ef          	jal	9248 <__adddf3>

000066c4 <.L29>:
    66c4:	00050793          	mv	a5,a0
    66c8:	00058713          	mv	a4,a1
    66cc:	04c0006f          	j	6718 <.L4>

000066d0 <.L3>:
    66d0:	c0100637          	lui	a2,0xc0100
    66d4:	00d60633          	add	a2,a2,a3
    66d8:	01166633          	or	a2,a2,a7
    66dc:	00061a63          	bnez	a2,66f0 <.L5>
    66e0:	00812403          	lw	s0,8(sp)
    66e4:	00c12083          	lw	ra,12(sp)
    66e8:	01010113          	add	sp,sp,16
    66ec:	4b80006f          	j	6ba4 <__GI_atan>

000066f0 <.L5>:
    66f0:	41e6d413          	sra	s0,a3,0x1e
    66f4:	00247413          	and	s0,s0,2
    66f8:	01f5d613          	srl	a2,a1,0x1f
    66fc:	00a86fb3          	or	t6,a6,a0
    6700:	00c46433          	or	s0,s0,a2
    6704:	020f9663          	bnez	t6,6730 <.L6>
    6708:	00200693          	li	a3,2
    670c:	18d40c63          	beq	s0,a3,68a4 <.L16>
    6710:	00300693          	li	a3,3
    6714:	18d40e63          	beq	s0,a3,68b0 <.L17>

00006718 <.L4>:
    6718:	00c12083          	lw	ra,12(sp)
    671c:	00812403          	lw	s0,8(sp)
    6720:	00078513          	mv	a0,a5
    6724:	00070593          	mv	a1,a4
    6728:	01010113          	add	sp,sp,16
    672c:	00008067          	ret

00006730 <.L6>:
    6730:	01136633          	or	a2,t1,a7
    6734:	00061e63          	bnez	a2,6750 <.L7>

00006738 <.L34>:
    6738:	0000c717          	auipc	a4,0xc
    673c:	a7870713          	add	a4,a4,-1416 # 121b0 <.LC0>
    6740:	020ede63          	bgez	t4,677c <.L30>
    6744:	0000c717          	auipc	a4,0xc
    6748:	a8c70713          	add	a4,a4,-1396 # 121d0 <.LC1>
    674c:	0300006f          	j	677c <.L30>

00006750 <.L7>:
    6750:	07c31263          	bne	t1,t3,67b4 <.L8>
    6754:	fff40413          	add	s0,s0,-1
    6758:	02681863          	bne	a6,t1,6788 <.L9>
    675c:	00200793          	li	a5,2
    6760:	0000c717          	auipc	a4,0xc
    6764:	a6870713          	add	a4,a4,-1432 # 121c8 <.LC3>
    6768:	0087ea63          	bltu	a5,s0,677c <.L30>
    676c:	00341413          	sll	s0,s0,0x3
    6770:	0000b717          	auipc	a4,0xb
    6774:	29870713          	add	a4,a4,664 # 11a08 <CSWTCH.8>
    6778:	00870733          	add	a4,a4,s0

0000677c <.L30>:
    677c:	00072783          	lw	a5,0(a4)
    6780:	00472703          	lw	a4,4(a4)
    6784:	f95ff06f          	j	6718 <.L4>

00006788 <.L9>:
    6788:	00200693          	li	a3,2
    678c:	00000793          	li	a5,0
    6790:	00000713          	li	a4,0
    6794:	f886e2e3          	bltu	a3,s0,6718 <.L4>
    6798:	00341413          	sll	s0,s0,0x3
    679c:	0000b717          	auipc	a4,0xb
    67a0:	26c70713          	add	a4,a4,620 # 11a08 <CSWTCH.8>
    67a4:	00870733          	add	a4,a4,s0
    67a8:	01872783          	lw	a5,24(a4)
    67ac:	01c72703          	lw	a4,28(a4)
    67b0:	f69ff06f          	j	6718 <.L4>

000067b4 <.L8>:
    67b4:	f9c802e3          	beq	a6,t3,6738 <.L34>
    67b8:	40680833          	sub	a6,a6,t1
    67bc:	41485813          	sra	a6,a6,0x14
    67c0:	03c00613          	li	a2,60
    67c4:	07064a63          	blt	a2,a6,6838 <.L22>
    67c8:	0006d663          	bgez	a3,67d4 <.L12>
    67cc:	fc400613          	li	a2,-60
    67d0:	06c84e63          	blt	a6,a2,684c <.L23>

000067d4 <.L12>:
    67d4:	00078513          	mv	a0,a5
    67d8:	00070593          	mv	a1,a4
    67dc:	00088613          	mv	a2,a7
    67e0:	1fc030ef          	jal	99dc <__divdf3>
    67e4:	109000ef          	jal	70ec <__GI_fabs>
    67e8:	3bc000ef          	jal	6ba4 <__GI_atan>
    67ec:	00050793          	mv	a5,a0
    67f0:	00058713          	mv	a4,a1

000067f4 <.L11>:
    67f4:	00100693          	li	a3,1
    67f8:	06d40063          	beq	s0,a3,6858 <.L13>
    67fc:	00200693          	li	a3,2
    6800:	06d40463          	beq	s0,a3,6868 <.L14>
    6804:	f0040ae3          	beqz	s0,6718 <.L4>
    6808:	0000c697          	auipc	a3,0xc
    680c:	9d068693          	add	a3,a3,-1584 # 121d8 <.LC5>
    6810:	0006a603          	lw	a2,0(a3)
    6814:	0046a683          	lw	a3,4(a3)
    6818:	00078513          	mv	a0,a5
    681c:	00070593          	mv	a1,a4
    6820:	7f5030ef          	jal	a814 <__subdf3>
    6824:	0000c797          	auipc	a5,0xc
    6828:	99478793          	add	a5,a5,-1644 # 121b8 <.LC1>
    682c:	0007a603          	lw	a2,0(a5)
    6830:	0047a683          	lw	a3,4(a5)
    6834:	0680006f          	j	689c <.L31>

00006838 <.L22>:
    6838:	0000c717          	auipc	a4,0xc
    683c:	97870713          	add	a4,a4,-1672 # 121b0 <.LC0>
    6840:	00072783          	lw	a5,0(a4)
    6844:	00472703          	lw	a4,4(a4)
    6848:	fadff06f          	j	67f4 <.L11>

0000684c <.L23>:
    684c:	00000793          	li	a5,0
    6850:	00000713          	li	a4,0
    6854:	fa1ff06f          	j	67f4 <.L11>

00006858 <.L13>:
    6858:	800006b7          	lui	a3,0x80000
    685c:	00e6c6b3          	xor	a3,a3,a4
    6860:	00068713          	mv	a4,a3
    6864:	eb5ff06f          	j	6718 <.L4>

00006868 <.L14>:
    6868:	0000c697          	auipc	a3,0xc
    686c:	97068693          	add	a3,a3,-1680 # 121d8 <.LC5>
    6870:	0006a603          	lw	a2,0(a3)
    6874:	0046a683          	lw	a3,4(a3)
    6878:	00078513          	mv	a0,a5
    687c:	00070593          	mv	a1,a4
    6880:	795030ef          	jal	a814 <__subdf3>
    6884:	0000c797          	auipc	a5,0xc
    6888:	93478793          	add	a5,a5,-1740 # 121b8 <.LC1>
    688c:	00050613          	mv	a2,a0
    6890:	00058693          	mv	a3,a1
    6894:	0007a503          	lw	a0,0(a5)
    6898:	0047a583          	lw	a1,4(a5)

0000689c <.L31>:
    689c:	779030ef          	jal	a814 <__subdf3>
    68a0:	e25ff06f          	j	66c4 <.L29>

000068a4 <.L16>:
    68a4:	0000c717          	auipc	a4,0xc
    68a8:	91470713          	add	a4,a4,-1772 # 121b8 <.LC1>
    68ac:	ed1ff06f          	j	677c <.L30>

000068b0 <.L17>:
    68b0:	0000c717          	auipc	a4,0xc
    68b4:	91070713          	add	a4,a4,-1776 # 121c0 <.LC2>
    68b8:	ec5ff06f          	j	677c <.L30>

000068bc <__ieee754_fmod>:
    68bc:	80000fb7          	lui	t6,0x80000
    68c0:	00060313          	mv	t1,a2
    68c4:	00068f13          	mv	t5,a3
    68c8:	00060e93          	mv	t4,a2
    68cc:	ffff8613          	add	a2,t6,-1 # 7fffffff <_ebss+0x7ffe9f4f>
    68d0:	01e67e33          	and	t3,a2,t5
    68d4:	006e67b3          	or	a5,t3,t1
    68d8:	02078463          	beqz	a5,6900 <.L2>
    68dc:	00b67633          	and	a2,a2,a1
    68e0:	7ff008b7          	lui	a7,0x7ff00
    68e4:	00058793          	mv	a5,a1
    68e8:	01167c63          	bgeu	a2,a7,6900 <.L2>
    68ec:	40600733          	neg	a4,t1
    68f0:	00676733          	or	a4,a4,t1
    68f4:	01f75713          	srl	a4,a4,0x1f
    68f8:	01c76733          	or	a4,a4,t3
    68fc:	02e8f863          	bgeu	a7,a4,692c <.L3>

00006900 <.L2>:
    6900:	ff010113          	add	sp,sp,-16
    6904:	00030613          	mv	a2,t1
    6908:	000f0693          	mv	a3,t5
    690c:	00112623          	sw	ra,12(sp)
    6910:	115030ef          	jal	a224 <__muldf3>
    6914:	00050613          	mv	a2,a0
    6918:	00058693          	mv	a3,a1
    691c:	0c0030ef          	jal	99dc <__divdf3>
    6920:	00c12083          	lw	ra,12(sp)
    6924:	01010113          	add	sp,sp,16
    6928:	00008067          	ret

0000692c <.L3>:
    692c:	00050893          	mv	a7,a0
    6930:	01f5f833          	and	a6,a1,t6
    6934:	02ce4663          	blt	t3,a2,6960 <.L5>
    6938:	23c64c63          	blt	a2,t3,6b70 <.L45>
    693c:	22656a63          	bltu	a0,t1,6b70 <.L45>
    6940:	02a31063          	bne	t1,a0,6960 <.L5>

00006944 <.L49>:
    6944:	0000b797          	auipc	a5,0xb
    6948:	0f478793          	add	a5,a5,244 # 11a38 <Zero>
    694c:	01c85813          	srl	a6,a6,0x1c
    6950:	01078833          	add	a6,a5,a6
    6954:	00082503          	lw	a0,0(a6)
    6958:	00482583          	lw	a1,4(a6)
    695c:	00008067          	ret

00006960 <.L5>:
    6960:	0147d713          	srl	a4,a5,0x14
    6964:	7ff77713          	and	a4,a4,2047
    6968:	0c071e63          	bnez	a4,6a44 <.L6>
    696c:	0c061063          	bnez	a2,6a2c <.L7>
    6970:	00088713          	mv	a4,a7
    6974:	bed00513          	li	a0,-1043

00006978 <.L8>:
    6978:	0ae04463          	bgtz	a4,6a20 <.L9>

0000697c <.L10>:
    697c:	014f5713          	srl	a4,t5,0x14
    6980:	7ff77713          	and	a4,a4,2047
    6984:	0e071863          	bnez	a4,6a74 <.L13>
    6988:	0c0e1a63          	bnez	t3,6a5c <.L14>
    698c:	00030693          	mv	a3,t1
    6990:	bed00713          	li	a4,-1043

00006994 <.L15>:
    6994:	0ad04e63          	bgtz	a3,6a50 <.L16>

00006998 <.L17>:
    6998:	c0200693          	li	a3,-1022
    699c:	0ed54263          	blt	a0,a3,6a80 <.L20>
    69a0:	001006b7          	lui	a3,0x100
    69a4:	fff68613          	add	a2,a3,-1 # fffff <_ebss+0xe9f4f>
    69a8:	00c7f5b3          	and	a1,a5,a2
    69ac:	00d5e5b3          	or	a1,a1,a3

000069b0 <.L21>:
    69b0:	c0200613          	li	a2,-1022
    69b4:	10c74263          	blt	a4,a2,6ab8 <.L23>
    69b8:	001007b7          	lui	a5,0x100
    69bc:	fff78693          	add	a3,a5,-1 # fffff <_ebss+0xe9f4f>
    69c0:	01e6f6b3          	and	a3,a3,t5
    69c4:	00f6e6b3          	or	a3,a3,a5

000069c8 <.L24>:
    69c8:	40e50533          	sub	a0,a0,a4

000069cc <.L26>:
    69cc:	40d587b3          	sub	a5,a1,a3
    69d0:	41d88633          	sub	a2,a7,t4
    69d4:	10051e63          	bnez	a0,6af0 <.L31>
    69d8:	01d8f463          	bgeu	a7,t4,69e0 <.L32>
    69dc:	fff78793          	add	a5,a5,-1

000069e0 <.L32>:
    69e0:	0007d663          	bgez	a5,69ec <.L33>
    69e4:	00088613          	mv	a2,a7
    69e8:	00058793          	mv	a5,a1

000069ec <.L33>:
    69ec:	00c7e6b3          	or	a3,a5,a2
    69f0:	001005b7          	lui	a1,0x100
    69f4:	f40688e3          	beqz	a3,6944 <.L49>

000069f8 <.L34>:
    69f8:	12b7cc63          	blt	a5,a1,6b30 <.L35>
    69fc:	c0200693          	li	a3,-1022
    6a00:	14d74463          	blt	a4,a3,6b48 <.L36>
    6a04:	40b787b3          	sub	a5,a5,a1
    6a08:	3ff70713          	add	a4,a4,1023
    6a0c:	0107e7b3          	or	a5,a5,a6
    6a10:	01471713          	sll	a4,a4,0x14
    6a14:	00060513          	mv	a0,a2
    6a18:	00e7e5b3          	or	a1,a5,a4
    6a1c:	00008067          	ret

00006a20 <.L9>:
    6a20:	fff50513          	add	a0,a0,-1
    6a24:	00171713          	sll	a4,a4,0x1
    6a28:	f51ff06f          	j	6978 <.L8>

00006a2c <.L7>:
    6a2c:	00b61713          	sll	a4,a2,0xb
    6a30:	c0200513          	li	a0,-1022

00006a34 <.L11>:
    6a34:	f4e054e3          	blez	a4,697c <.L10>
    6a38:	fff50513          	add	a0,a0,-1
    6a3c:	00171713          	sll	a4,a4,0x1
    6a40:	ff5ff06f          	j	6a34 <.L11>

00006a44 <.L6>:
    6a44:	41465513          	sra	a0,a2,0x14
    6a48:	c0150513          	add	a0,a0,-1023
    6a4c:	f31ff06f          	j	697c <.L10>

00006a50 <.L16>:
    6a50:	fff70713          	add	a4,a4,-1
    6a54:	00169693          	sll	a3,a3,0x1
    6a58:	f3dff06f          	j	6994 <.L15>

00006a5c <.L14>:
    6a5c:	00be1693          	sll	a3,t3,0xb
    6a60:	c0200713          	li	a4,-1022

00006a64 <.L18>:
    6a64:	f2d05ae3          	blez	a3,6998 <.L17>
    6a68:	fff70713          	add	a4,a4,-1
    6a6c:	00169693          	sll	a3,a3,0x1
    6a70:	ff5ff06f          	j	6a64 <.L18>

00006a74 <.L13>:
    6a74:	414e5713          	sra	a4,t3,0x14
    6a78:	c0170713          	add	a4,a4,-1023
    6a7c:	f1dff06f          	j	6998 <.L17>

00006a80 <.L20>:
    6a80:	40a687b3          	sub	a5,a3,a0
    6a84:	01f00693          	li	a3,31
    6a88:	00f6ce63          	blt	a3,a5,6aa4 <.L22>
    6a8c:	41e50593          	add	a1,a0,1054
    6a90:	00b8d5b3          	srl	a1,a7,a1
    6a94:	00f61633          	sll	a2,a2,a5
    6a98:	00c5e5b3          	or	a1,a1,a2
    6a9c:	00f898b3          	sll	a7,a7,a5
    6aa0:	f11ff06f          	j	69b0 <.L21>

00006aa4 <.L22>:
    6aa4:	be200593          	li	a1,-1054
    6aa8:	40a585b3          	sub	a1,a1,a0
    6aac:	00b895b3          	sll	a1,a7,a1
    6ab0:	00000893          	li	a7,0
    6ab4:	efdff06f          	j	69b0 <.L21>

00006ab8 <.L23>:
    6ab8:	40e60633          	sub	a2,a2,a4
    6abc:	01f00793          	li	a5,31
    6ac0:	00c7ce63          	blt	a5,a2,6adc <.L25>
    6ac4:	41e70693          	add	a3,a4,1054
    6ac8:	00ce17b3          	sll	a5,t3,a2
    6acc:	00d356b3          	srl	a3,t1,a3
    6ad0:	00f6e6b3          	or	a3,a3,a5
    6ad4:	00c31eb3          	sll	t4,t1,a2
    6ad8:	ef1ff06f          	j	69c8 <.L24>

00006adc <.L25>:
    6adc:	be200693          	li	a3,-1054
    6ae0:	40e686b3          	sub	a3,a3,a4
    6ae4:	00d316b3          	sll	a3,t1,a3
    6ae8:	00000e93          	li	t4,0
    6aec:	eddff06f          	j	69c8 <.L24>

00006af0 <.L31>:
    6af0:	01d8f463          	bgeu	a7,t4,6af8 <.L27>
    6af4:	fff78793          	add	a5,a5,-1

00006af8 <.L27>:
    6af8:	0007de63          	bgez	a5,6b14 <.L28>
    6afc:	01f8d793          	srl	a5,a7,0x1f
    6b00:	00159593          	sll	a1,a1,0x1
    6b04:	00f585b3          	add	a1,a1,a5
    6b08:	00189893          	sll	a7,a7,0x1

00006b0c <.L29>:
    6b0c:	fff50513          	add	a0,a0,-1
    6b10:	ebdff06f          	j	69cc <.L26>

00006b14 <.L28>:
    6b14:	00c7e5b3          	or	a1,a5,a2
    6b18:	e20586e3          	beqz	a1,6944 <.L49>
    6b1c:	00179793          	sll	a5,a5,0x1
    6b20:	01f65593          	srl	a1,a2,0x1f
    6b24:	00b785b3          	add	a1,a5,a1
    6b28:	00161893          	sll	a7,a2,0x1
    6b2c:	fe1ff06f          	j	6b0c <.L29>

00006b30 <.L35>:
    6b30:	01f65693          	srl	a3,a2,0x1f
    6b34:	00179793          	sll	a5,a5,0x1
    6b38:	00d787b3          	add	a5,a5,a3
    6b3c:	00161613          	sll	a2,a2,0x1
    6b40:	fff70713          	add	a4,a4,-1
    6b44:	eb5ff06f          	j	69f8 <.L34>

00006b48 <.L36>:
    6b48:	40e686b3          	sub	a3,a3,a4
    6b4c:	01400593          	li	a1,20
    6b50:	02d5c263          	blt	a1,a3,6b74 <.L37>
    6b54:	41e70713          	add	a4,a4,1054
    6b58:	00e79733          	sll	a4,a5,a4
    6b5c:	00d65633          	srl	a2,a2,a3
    6b60:	00c76633          	or	a2,a4,a2
    6b64:	40d7d7b3          	sra	a5,a5,a3

00006b68 <.L38>:
    6b68:	00060513          	mv	a0,a2
    6b6c:	0107e5b3          	or	a1,a5,a6

00006b70 <.L45>:
    6b70:	00008067          	ret

00006b74 <.L37>:
    6b74:	01f00593          	li	a1,31
    6b78:	00d5ce63          	blt	a1,a3,6b94 <.L39>
    6b7c:	41e70713          	add	a4,a4,1054
    6b80:	00d65633          	srl	a2,a2,a3
    6b84:	00e797b3          	sll	a5,a5,a4
    6b88:	00c7e633          	or	a2,a5,a2

00006b8c <.L47>:
    6b8c:	00080793          	mv	a5,a6
    6b90:	fd9ff06f          	j	6b68 <.L38>

00006b94 <.L39>:
    6b94:	be200613          	li	a2,-1054
    6b98:	40e60633          	sub	a2,a2,a4
    6b9c:	40c7d633          	sra	a2,a5,a2
    6ba0:	fedff06f          	j	6b8c <.L47>

00006ba4 <__GI_atan>:
    6ba4:	fd010113          	add	sp,sp,-48
    6ba8:	02912223          	sw	s1,36(sp)
    6bac:	00159493          	sll	s1,a1,0x1
    6bb0:	02812423          	sw	s0,40(sp)
    6bb4:	01712623          	sw	s7,12(sp)
    6bb8:	02112623          	sw	ra,44(sp)
    6bbc:	03212023          	sw	s2,32(sp)
    6bc0:	01312e23          	sw	s3,28(sp)
    6bc4:	01412c23          	sw	s4,24(sp)
    6bc8:	01512a23          	sw	s5,20(sp)
    6bcc:	01612823          	sw	s6,16(sp)
    6bd0:	0014d493          	srl	s1,s1,0x1
    6bd4:	441007b7          	lui	a5,0x44100
    6bd8:	00050b93          	mv	s7,a0
    6bdc:	00058413          	mv	s0,a1
    6be0:	08f4e263          	bltu	s1,a5,6c64 <.L2>
    6be4:	7ff007b7          	lui	a5,0x7ff00
    6be8:	0097e663          	bltu	a5,s1,6bf4 <.L3>
    6bec:	04f49c63          	bne	s1,a5,6c44 <.L4>
    6bf0:	04050a63          	beqz	a0,6c44 <.L4>

00006bf4 <.L3>:
    6bf4:	000b8613          	mv	a2,s7
    6bf8:	00040693          	mv	a3,s0
    6bfc:	000b8513          	mv	a0,s7
    6c00:	00040593          	mv	a1,s0
    6c04:	644020ef          	jal	9248 <__adddf3>

00006c08 <.L18>:
    6c08:	00050b93          	mv	s7,a0
    6c0c:	00058413          	mv	s0,a1

00006c10 <.L5>:
    6c10:	02c12083          	lw	ra,44(sp)
    6c14:	00040593          	mv	a1,s0
    6c18:	02812403          	lw	s0,40(sp)
    6c1c:	02412483          	lw	s1,36(sp)
    6c20:	02012903          	lw	s2,32(sp)
    6c24:	01c12983          	lw	s3,28(sp)
    6c28:	01812a03          	lw	s4,24(sp)
    6c2c:	01412a83          	lw	s5,20(sp)
    6c30:	01012b03          	lw	s6,16(sp)
    6c34:	000b8513          	mv	a0,s7
    6c38:	00c12b83          	lw	s7,12(sp)
    6c3c:	03010113          	add	sp,sp,48
    6c40:	00008067          	ret

00006c44 <.L4>:
    6c44:	0000b797          	auipc	a5,0xb
    6c48:	56c78793          	add	a5,a5,1388 # 121b0 <.LC0>
    6c4c:	00804663          	bgtz	s0,6c58 <.L19>
    6c50:	0000b797          	auipc	a5,0xb
    6c54:	58078793          	add	a5,a5,1408 # 121d0 <.LC1>

00006c58 <.L19>:
    6c58:	0007ab83          	lw	s7,0(a5)
    6c5c:	0047a403          	lw	s0,4(a5)
    6c60:	fb1ff06f          	j	6c10 <.L5>

00006c64 <.L2>:
    6c64:	3fdc07b7          	lui	a5,0x3fdc0
    6c68:	00058a13          	mv	s4,a1
    6c6c:	04f4f063          	bgeu	s1,a5,6cac <.L6>
    6c70:	3e2007b7          	lui	a5,0x3e200
    6c74:	02f4f863          	bgeu	s1,a5,6ca4 <.L13>
    6c78:	0000b797          	auipc	a5,0xb
    6c7c:	56878793          	add	a5,a5,1384 # 121e0 <.LC0>
    6c80:	0007a603          	lw	a2,0(a5)
    6c84:	0047a683          	lw	a3,4(a5)
    6c88:	5c0020ef          	jal	9248 <__adddf3>
    6c8c:	0000b797          	auipc	a5,0xb
    6c90:	55c78793          	add	a5,a5,1372 # 121e8 <.LC1>
    6c94:	0007a603          	lw	a2,0(a5)
    6c98:	0047a683          	lw	a3,4(a5)
    6c9c:	4ac030ef          	jal	a148 <__gedf2>
    6ca0:	f6a048e3          	bgtz	a0,6c10 <.L5>

00006ca4 <.L13>:
    6ca4:	fff00993          	li	s3,-1
    6ca8:	0840006f          	j	6d2c <.L7>

00006cac <.L6>:
    6cac:	440000ef          	jal	70ec <__GI_fabs>
    6cb0:	3ff307b7          	lui	a5,0x3ff30
    6cb4:	00050913          	mv	s2,a0
    6cb8:	00058413          	mv	s0,a1
    6cbc:	28f4f263          	bgeu	s1,a5,6f40 <.L8>
    6cc0:	3fe607b7          	lui	a5,0x3fe60
    6cc4:	0000ba97          	auipc	s5,0xb
    6cc8:	524a8a93          	add	s5,s5,1316 # 121e8 <.LC1>
    6ccc:	22f4f463          	bgeu	s1,a5,6ef4 <.L9>
    6cd0:	00050613          	mv	a2,a0
    6cd4:	00058693          	mv	a3,a1
    6cd8:	570020ef          	jal	9248 <__adddf3>
    6cdc:	000aa603          	lw	a2,0(s5)
    6ce0:	004aa683          	lw	a3,4(s5)
    6ce4:	331030ef          	jal	a814 <__subdf3>
    6ce8:	0000b797          	auipc	a5,0xb
    6cec:	50878793          	add	a5,a5,1288 # 121f0 <.LC4>
    6cf0:	0007a603          	lw	a2,0(a5)
    6cf4:	0047a683          	lw	a3,4(a5)
    6cf8:	00050993          	mv	s3,a0
    6cfc:	00058493          	mv	s1,a1
    6d00:	00090513          	mv	a0,s2
    6d04:	00040593          	mv	a1,s0
    6d08:	540020ef          	jal	9248 <__adddf3>
    6d0c:	00050613          	mv	a2,a0
    6d10:	00058693          	mv	a3,a1
    6d14:	00098513          	mv	a0,s3
    6d18:	00048593          	mv	a1,s1
    6d1c:	4c1020ef          	jal	99dc <__divdf3>
    6d20:	00050b93          	mv	s7,a0
    6d24:	00058413          	mv	s0,a1
    6d28:	00000993          	li	s3,0

00006d2c <.L7>:
    6d2c:	000b8613          	mv	a2,s7
    6d30:	00040693          	mv	a3,s0
    6d34:	000b8513          	mv	a0,s7
    6d38:	00040593          	mv	a1,s0
    6d3c:	4e8030ef          	jal	a224 <__muldf3>
    6d40:	00050613          	mv	a2,a0
    6d44:	00058693          	mv	a3,a1
    6d48:	00050b13          	mv	s6,a0
    6d4c:	00058a93          	mv	s5,a1
    6d50:	4d4030ef          	jal	a224 <__muldf3>
    6d54:	0000b797          	auipc	a5,0xb
    6d58:	4b478793          	add	a5,a5,1204 # 12208 <.LC7>
    6d5c:	0007a603          	lw	a2,0(a5)
    6d60:	0047a683          	lw	a3,4(a5)
    6d64:	00050913          	mv	s2,a0
    6d68:	00058493          	mv	s1,a1
    6d6c:	4b8030ef          	jal	a224 <__muldf3>
    6d70:	0000b797          	auipc	a5,0xb
    6d74:	4a078793          	add	a5,a5,1184 # 12210 <.LC8>
    6d78:	0007a603          	lw	a2,0(a5)
    6d7c:	0047a683          	lw	a3,4(a5)
    6d80:	4c8020ef          	jal	9248 <__adddf3>
    6d84:	00090613          	mv	a2,s2
    6d88:	00048693          	mv	a3,s1
    6d8c:	498030ef          	jal	a224 <__muldf3>
    6d90:	0000b797          	auipc	a5,0xb
    6d94:	48878793          	add	a5,a5,1160 # 12218 <.LC9>
    6d98:	0007a603          	lw	a2,0(a5)
    6d9c:	0047a683          	lw	a3,4(a5)
    6da0:	4a8020ef          	jal	9248 <__adddf3>
    6da4:	00090613          	mv	a2,s2
    6da8:	00048693          	mv	a3,s1
    6dac:	478030ef          	jal	a224 <__muldf3>
    6db0:	0000b797          	auipc	a5,0xb
    6db4:	47078793          	add	a5,a5,1136 # 12220 <.LC10>
    6db8:	0007a603          	lw	a2,0(a5)
    6dbc:	0047a683          	lw	a3,4(a5)
    6dc0:	488020ef          	jal	9248 <__adddf3>
    6dc4:	00090613          	mv	a2,s2
    6dc8:	00048693          	mv	a3,s1
    6dcc:	458030ef          	jal	a224 <__muldf3>
    6dd0:	0000b797          	auipc	a5,0xb
    6dd4:	45878793          	add	a5,a5,1112 # 12228 <.LC11>
    6dd8:	0007a603          	lw	a2,0(a5)
    6ddc:	0047a683          	lw	a3,4(a5)
    6de0:	468020ef          	jal	9248 <__adddf3>
    6de4:	00090613          	mv	a2,s2
    6de8:	00048693          	mv	a3,s1
    6dec:	438030ef          	jal	a224 <__muldf3>
    6df0:	0000b797          	auipc	a5,0xb
    6df4:	44078793          	add	a5,a5,1088 # 12230 <.LC12>
    6df8:	0007a603          	lw	a2,0(a5)
    6dfc:	0047a683          	lw	a3,4(a5)
    6e00:	448020ef          	jal	9248 <__adddf3>
    6e04:	000b0613          	mv	a2,s6
    6e08:	000a8693          	mv	a3,s5
    6e0c:	418030ef          	jal	a224 <__muldf3>
    6e10:	0000b797          	auipc	a5,0xb
    6e14:	42878793          	add	a5,a5,1064 # 12238 <.LC13>
    6e18:	0007a603          	lw	a2,0(a5)
    6e1c:	0047a683          	lw	a3,4(a5)
    6e20:	00050b13          	mv	s6,a0
    6e24:	00058a93          	mv	s5,a1
    6e28:	00090513          	mv	a0,s2
    6e2c:	00048593          	mv	a1,s1
    6e30:	3f4030ef          	jal	a224 <__muldf3>
    6e34:	0000b797          	auipc	a5,0xb
    6e38:	40c78793          	add	a5,a5,1036 # 12240 <.LC14>
    6e3c:	0007a603          	lw	a2,0(a5)
    6e40:	0047a683          	lw	a3,4(a5)
    6e44:	1d1030ef          	jal	a814 <__subdf3>
    6e48:	00090613          	mv	a2,s2
    6e4c:	00048693          	mv	a3,s1
    6e50:	3d4030ef          	jal	a224 <__muldf3>
    6e54:	0000b797          	auipc	a5,0xb
    6e58:	3f478793          	add	a5,a5,1012 # 12248 <.LC15>
    6e5c:	0007a603          	lw	a2,0(a5)
    6e60:	0047a683          	lw	a3,4(a5)
    6e64:	1b1030ef          	jal	a814 <__subdf3>
    6e68:	00090613          	mv	a2,s2
    6e6c:	00048693          	mv	a3,s1
    6e70:	3b4030ef          	jal	a224 <__muldf3>
    6e74:	0000b797          	auipc	a5,0xb
    6e78:	3dc78793          	add	a5,a5,988 # 12250 <.LC16>
    6e7c:	0007a603          	lw	a2,0(a5)
    6e80:	0047a683          	lw	a3,4(a5)
    6e84:	191030ef          	jal	a814 <__subdf3>
    6e88:	00090613          	mv	a2,s2
    6e8c:	00048693          	mv	a3,s1
    6e90:	394030ef          	jal	a224 <__muldf3>
    6e94:	0000b797          	auipc	a5,0xb
    6e98:	3c478793          	add	a5,a5,964 # 12258 <.LC17>
    6e9c:	0007a603          	lw	a2,0(a5)
    6ea0:	0047a683          	lw	a3,4(a5)
    6ea4:	171030ef          	jal	a814 <__subdf3>
    6ea8:	00090613          	mv	a2,s2
    6eac:	00048693          	mv	a3,s1
    6eb0:	374030ef          	jal	a224 <__muldf3>
    6eb4:	00050613          	mv	a2,a0
    6eb8:	00058693          	mv	a3,a1
    6ebc:	000b0513          	mv	a0,s6
    6ec0:	000a8593          	mv	a1,s5
    6ec4:	384020ef          	jal	9248 <__adddf3>
    6ec8:	00040693          	mv	a3,s0
    6ecc:	000b8613          	mv	a2,s7
    6ed0:	354030ef          	jal	a224 <__muldf3>
    6ed4:	fff00693          	li	a3,-1
    6ed8:	10d99263          	bne	s3,a3,6fdc <.L11>
    6edc:	00050613          	mv	a2,a0
    6ee0:	00058693          	mv	a3,a1
    6ee4:	000b8513          	mv	a0,s7
    6ee8:	00040593          	mv	a1,s0
    6eec:	129030ef          	jal	a814 <__subdf3>
    6ef0:	d19ff06f          	j	6c08 <.L18>

00006ef4 <.L9>:
    6ef4:	000aa603          	lw	a2,0(s5)
    6ef8:	004aa683          	lw	a3,4(s5)
    6efc:	119030ef          	jal	a814 <__subdf3>
    6f00:	000aa603          	lw	a2,0(s5)
    6f04:	004aa683          	lw	a3,4(s5)
    6f08:	00050993          	mv	s3,a0
    6f0c:	00058493          	mv	s1,a1
    6f10:	00090513          	mv	a0,s2
    6f14:	00040593          	mv	a1,s0
    6f18:	330020ef          	jal	9248 <__adddf3>
    6f1c:	00050613          	mv	a2,a0
    6f20:	00058693          	mv	a3,a1
    6f24:	00098513          	mv	a0,s3
    6f28:	00048593          	mv	a1,s1
    6f2c:	2b1020ef          	jal	99dc <__divdf3>
    6f30:	00050b93          	mv	s7,a0
    6f34:	00058413          	mv	s0,a1
    6f38:	00100993          	li	s3,1
    6f3c:	df1ff06f          	j	6d2c <.L7>

00006f40 <.L8>:
    6f40:	400387b7          	lui	a5,0x40038
    6f44:	06f4f663          	bgeu	s1,a5,6fb0 <.L10>
    6f48:	0000ba97          	auipc	s5,0xb
    6f4c:	2b0a8a93          	add	s5,s5,688 # 121f8 <.LC5>
    6f50:	000aa603          	lw	a2,0(s5)
    6f54:	004aa683          	lw	a3,4(s5)
    6f58:	0bd030ef          	jal	a814 <__subdf3>
    6f5c:	000aa603          	lw	a2,0(s5)
    6f60:	004aa683          	lw	a3,4(s5)
    6f64:	00050993          	mv	s3,a0
    6f68:	00058493          	mv	s1,a1
    6f6c:	00090513          	mv	a0,s2
    6f70:	00040593          	mv	a1,s0
    6f74:	2b0030ef          	jal	a224 <__muldf3>
    6f78:	0000b797          	auipc	a5,0xb
    6f7c:	27078793          	add	a5,a5,624 # 121e8 <.LC1>
    6f80:	0007a603          	lw	a2,0(a5)
    6f84:	0047a683          	lw	a3,4(a5)
    6f88:	2c0020ef          	jal	9248 <__adddf3>
    6f8c:	00050613          	mv	a2,a0
    6f90:	00058693          	mv	a3,a1
    6f94:	00098513          	mv	a0,s3
    6f98:	00048593          	mv	a1,s1
    6f9c:	241020ef          	jal	99dc <__divdf3>
    6fa0:	00050b93          	mv	s7,a0
    6fa4:	00058413          	mv	s0,a1
    6fa8:	00200993          	li	s3,2
    6fac:	d81ff06f          	j	6d2c <.L7>

00006fb0 <.L10>:
    6fb0:	0000b797          	auipc	a5,0xb
    6fb4:	25078793          	add	a5,a5,592 # 12200 <.LC6>
    6fb8:	00050613          	mv	a2,a0
    6fbc:	00058693          	mv	a3,a1
    6fc0:	0007a503          	lw	a0,0(a5)
    6fc4:	0047a583          	lw	a1,4(a5)
    6fc8:	00300993          	li	s3,3
    6fcc:	211020ef          	jal	99dc <__divdf3>
    6fd0:	00050b93          	mv	s7,a0
    6fd4:	00058413          	mv	s0,a1
    6fd8:	d55ff06f          	j	6d2c <.L7>

00006fdc <.L11>:
    6fdc:	00399993          	sll	s3,s3,0x3
    6fe0:	0000b497          	auipc	s1,0xb
    6fe4:	a6848493          	add	s1,s1,-1432 # 11a48 <atanhi>
    6fe8:	013484b3          	add	s1,s1,s3
    6fec:	0204a603          	lw	a2,32(s1)
    6ff0:	0244a683          	lw	a3,36(s1)
    6ff4:	021030ef          	jal	a814 <__subdf3>
    6ff8:	000b8613          	mv	a2,s7
    6ffc:	00040693          	mv	a3,s0
    7000:	015030ef          	jal	a814 <__subdf3>
    7004:	00050613          	mv	a2,a0
    7008:	00058693          	mv	a3,a1
    700c:	0004a503          	lw	a0,0(s1)
    7010:	0044a583          	lw	a1,4(s1)
    7014:	001030ef          	jal	a814 <__subdf3>
    7018:	00050b93          	mv	s7,a0
    701c:	00058413          	mv	s0,a1
    7020:	be0a58e3          	bgez	s4,6c10 <.L5>
    7024:	80000437          	lui	s0,0x80000
    7028:	00b44433          	xor	s0,s0,a1
    702c:	be5ff06f          	j	6c10 <.L5>

00007030 <__GI_cos>:
    7030:	fe010113          	add	sp,sp,-32
    7034:	00812c23          	sw	s0,24(sp)
    7038:	80000437          	lui	s0,0x80000
    703c:	fff40713          	add	a4,s0,-1 # 7fffffff <_ebss+0x7ffe9f4f>
    7040:	3fe926b7          	lui	a3,0x3fe92
    7044:	00112e23          	sw	ra,28(sp)
    7048:	00b77733          	and	a4,a4,a1
    704c:	1fb68693          	add	a3,a3,507 # 3fe921fb <_ebss+0x3fe7c14b>
    7050:	00e6ee63          	bltu	a3,a4,706c <.L2>
    7054:	01812403          	lw	s0,24(sp)
    7058:	01c12083          	lw	ra,28(sp)
    705c:	00000613          	li	a2,0
    7060:	00000693          	li	a3,0
    7064:	02010113          	add	sp,sp,32
    7068:	5890006f          	j	7df0 <__kernel_cos>

0000706c <.L2>:
    706c:	7ff006b7          	lui	a3,0x7ff00
    7070:	02d76063          	bltu	a4,a3,7090 <.L3>
    7074:	00050613          	mv	a2,a0
    7078:	00058693          	mv	a3,a1
    707c:	798030ef          	jal	a814 <__subdf3>

00007080 <.L1>:
    7080:	01c12083          	lw	ra,28(sp)
    7084:	01812403          	lw	s0,24(sp)
    7088:	02010113          	add	sp,sp,32
    708c:	00008067          	ret

00007090 <.L3>:
    7090:	00010613          	mv	a2,sp
    7094:	75c000ef          	jal	77f0 <__ieee754_rem_pio2>
    7098:	00357793          	and	a5,a0,3
    709c:	00100713          	li	a4,1
    70a0:	00812603          	lw	a2,8(sp)
    70a4:	00c12683          	lw	a3,12(sp)
    70a8:	00012503          	lw	a0,0(sp)
    70ac:	00412583          	lw	a1,4(sp)
    70b0:	00e78c63          	beq	a5,a4,70c8 <.L5>
    70b4:	00200713          	li	a4,2
    70b8:	02e78063          	beq	a5,a4,70d8 <.L6>
    70bc:	02079263          	bnez	a5,70e0 <.L7>
    70c0:	531000ef          	jal	7df0 <__kernel_cos>
    70c4:	fbdff06f          	j	7080 <.L1>

000070c8 <.L5>:
    70c8:	00100713          	li	a4,1
    70cc:	28d010ef          	jal	8b58 <__kernel_sin>

000070d0 <.L10>:
    70d0:	00b445b3          	xor	a1,s0,a1
    70d4:	fadff06f          	j	7080 <.L1>

000070d8 <.L6>:
    70d8:	519000ef          	jal	7df0 <__kernel_cos>
    70dc:	ff5ff06f          	j	70d0 <.L10>

000070e0 <.L7>:
    70e0:	00100713          	li	a4,1
    70e4:	275010ef          	jal	8b58 <__kernel_sin>
    70e8:	f99ff06f          	j	7080 <.L1>

000070ec <__GI_fabs>:
    70ec:	00159593          	sll	a1,a1,0x1
    70f0:	00050713          	mv	a4,a0
    70f4:	0015d793          	srl	a5,a1,0x1
    70f8:	00070513          	mv	a0,a4
    70fc:	00078593          	mv	a1,a5
    7100:	00008067          	ret

00007104 <__GI_sin>:
    7104:	fe010113          	add	sp,sp,-32
    7108:	00812c23          	sw	s0,24(sp)
    710c:	80000437          	lui	s0,0x80000
    7110:	fff40713          	add	a4,s0,-1 # 7fffffff <_ebss+0x7ffe9f4f>
    7114:	3fe926b7          	lui	a3,0x3fe92
    7118:	00112e23          	sw	ra,28(sp)
    711c:	00b77733          	and	a4,a4,a1
    7120:	1fb68693          	add	a3,a3,507 # 3fe921fb <_ebss+0x3fe7c14b>
    7124:	02e6e063          	bltu	a3,a4,7144 <.L2>
    7128:	01812403          	lw	s0,24(sp)
    712c:	01c12083          	lw	ra,28(sp)
    7130:	00000713          	li	a4,0
    7134:	00000613          	li	a2,0
    7138:	00000693          	li	a3,0
    713c:	02010113          	add	sp,sp,32
    7140:	2190106f          	j	8b58 <__kernel_sin>

00007144 <.L2>:
    7144:	7ff006b7          	lui	a3,0x7ff00
    7148:	02d76063          	bltu	a4,a3,7168 <.L3>
    714c:	00050613          	mv	a2,a0
    7150:	00058693          	mv	a3,a1
    7154:	6c0030ef          	jal	a814 <__subdf3>

00007158 <.L1>:
    7158:	01c12083          	lw	ra,28(sp)
    715c:	01812403          	lw	s0,24(sp)
    7160:	02010113          	add	sp,sp,32
    7164:	00008067          	ret

00007168 <.L3>:
    7168:	00010613          	mv	a2,sp
    716c:	684000ef          	jal	77f0 <__ieee754_rem_pio2>
    7170:	00357793          	and	a5,a0,3
    7174:	00100713          	li	a4,1
    7178:	00812603          	lw	a2,8(sp)
    717c:	00c12683          	lw	a3,12(sp)
    7180:	00012503          	lw	a0,0(sp)
    7184:	00412583          	lw	a1,4(sp)
    7188:	00e78e63          	beq	a5,a4,71a4 <.L5>
    718c:	00200713          	li	a4,2
    7190:	00e78e63          	beq	a5,a4,71ac <.L6>
    7194:	02079463          	bnez	a5,71bc <.L7>
    7198:	00100713          	li	a4,1
    719c:	1bd010ef          	jal	8b58 <__kernel_sin>
    71a0:	fb9ff06f          	j	7158 <.L1>

000071a4 <.L5>:
    71a4:	44d000ef          	jal	7df0 <__kernel_cos>
    71a8:	fb1ff06f          	j	7158 <.L1>

000071ac <.L6>:
    71ac:	00100713          	li	a4,1
    71b0:	1a9010ef          	jal	8b58 <__kernel_sin>

000071b4 <.L10>:
    71b4:	00b445b3          	xor	a1,s0,a1
    71b8:	fa1ff06f          	j	7158 <.L1>

000071bc <.L7>:
    71bc:	435000ef          	jal	7df0 <__kernel_cos>
    71c0:	ff5ff06f          	j	71b4 <.L10>

000071c4 <__fcntl_nocancel>:
    71c4:	ff458793          	add	a5,a1,-12 # ffff4 <_ebss+0xe9f44>
    71c8:	00200713          	li	a4,2
    71cc:	02f76663          	bltu	a4,a5,71f8 <.L2>
    71d0:	01900893          	li	a7,25
    71d4:	00000073          	ecall
    71d8:	fffff7b7          	lui	a5,0xfffff
    71dc:	02a7f863          	bgeu	a5,a0,720c <.L1>
    71e0:	40a00533          	neg	a0,a0
    71e4:	00009797          	auipc	a5,0x9
    71e8:	2307a783          	lw	a5,560(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    71ec:	00a7a023          	sw	a0,0(a5)

000071f0 <.L4>:
    71f0:	fff00513          	li	a0,-1
    71f4:	00008067          	ret

000071f8 <.L2>:
    71f8:	00009797          	auipc	a5,0x9
    71fc:	21c7a783          	lw	a5,540(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    7200:	02600713          	li	a4,38
    7204:	00e7a023          	sw	a4,0(a5)
    7208:	fe9ff06f          	j	71f0 <.L4>

0000720c <.L1>:
    720c:	00008067          	ret

00007210 <__GI_fcntl>:
    7210:	fd010113          	add	sp,sp,-48
    7214:	02f12223          	sw	a5,36(sp)
    7218:	01810793          	add	a5,sp,24
    721c:	03112623          	sw	a7,44(sp)
    7220:	00c12c23          	sw	a2,24(sp)
    7224:	00d12e23          	sw	a3,28(sp)
    7228:	02e12023          	sw	a4,32(sp)
    722c:	03012423          	sw	a6,40(sp)
    7230:	00f12623          	sw	a5,12(sp)
    7234:	01900893          	li	a7,25
    7238:	00000073          	ecall
    723c:	fffff7b7          	lui	a5,0xfffff
    7240:	00a7fc63          	bgeu	a5,a0,7258 <.L5>
    7244:	40a00533          	neg	a0,a0
    7248:	00009797          	auipc	a5,0x9
    724c:	1cc7a783          	lw	a5,460(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    7250:	00a7a023          	sw	a0,0(a5)
    7254:	fff00513          	li	a0,-1

00007258 <.L5>:
    7258:	03010113          	add	sp,sp,48
    725c:	00008067          	ret

00007260 <__GI__exit>:
    7260:	00050713          	mv	a4,a0
    7264:	fffff637          	lui	a2,0xfffff
    7268:	00009697          	auipc	a3,0x9
    726c:	1ac6a683          	lw	a3,428(a3) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>

00007270 <.L2>:
    7270:	00070513          	mv	a0,a4
    7274:	05d00893          	li	a7,93
    7278:	00000073          	ecall
    727c:	fea67ae3          	bgeu	a2,a0,7270 <.L2>
    7280:	40a007b3          	neg	a5,a0
    7284:	00f6a023          	sw	a5,0(a3)
    7288:	fe9ff06f          	j	7270 <.L2>

0000728c <__GI_fstat64>:
    728c:	05000893          	li	a7,80
    7290:	00000073          	ecall
    7294:	fffff7b7          	lui	a5,0xfffff
    7298:	00a7fc63          	bgeu	a5,a0,72b0 <.L1>
    729c:	40a00533          	neg	a0,a0
    72a0:	00009797          	auipc	a5,0x9
    72a4:	1747a783          	lw	a5,372(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    72a8:	00a7a023          	sw	a0,0(a5)
    72ac:	fff00513          	li	a0,-1

000072b0 <.L1>:
    72b0:	00008067          	ret

000072b4 <__getdents>:
    72b4:	fd010113          	add	sp,sp,-48
    72b8:	01812423          	sw	s8,8(sp)
    72bc:	00050c13          	mv	s8,a0
    72c0:	00060513          	mv	a0,a2
    72c4:	01312e23          	sw	s3,28(sp)
    72c8:	01412c23          	sw	s4,24(sp)
    72cc:	01512a23          	sw	s5,20(sp)
    72d0:	00060a13          	mv	s4,a2
    72d4:	00058a93          	mv	s5,a1
    72d8:	02112623          	sw	ra,44(sp)
    72dc:	02812423          	sw	s0,40(sp)
    72e0:	02912223          	sw	s1,36(sp)
    72e4:	03212023          	sw	s2,32(sp)
    72e8:	01612823          	sw	s6,16(sp)
    72ec:	01712623          	sw	s7,12(sp)
    72f0:	01912223          	sw	s9,4(sp)
    72f4:	fd5fb0ef          	jal	32c8 <malloc>
    72f8:	00050993          	mv	s3,a0
    72fc:	00098593          	mv	a1,s3
    7300:	000c0513          	mv	a0,s8
    7304:	000a0613          	mv	a2,s4
    7308:	03d00893          	li	a7,61
    730c:	00000073          	ecall
    7310:	fffff737          	lui	a4,0xfffff
    7314:	0ea77c63          	bgeu	a4,a0,740c <.L9>
    7318:	40a007b3          	neg	a5,a0
    731c:	00009717          	auipc	a4,0x9
    7320:	0f872703          	lw	a4,248(a4) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    7324:	00098513          	mv	a0,s3
    7328:	00f72023          	sw	a5,0(a4)
    732c:	9b4fc0ef          	jal	34e0 <free>

00007330 <.L3>:
    7330:	fff00513          	li	a0,-1
    7334:	0a40006f          	j	73d8 <.L1>

00007338 <.L5>:
    7338:	00098513          	mv	a0,s3
    733c:	9a4fc0ef          	jal	34e0 <free>
    7340:	00009797          	auipc	a5,0x9
    7344:	0d47a783          	lw	a5,212(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    7348:	01600713          	li	a4,22
    734c:	00e7a023          	sw	a4,0(a5)
    7350:	fe1ff06f          	j	7330 <.L3>

00007354 <.L4>:
    7354:	00492783          	lw	a5,4(s2)
    7358:	00892b03          	lw	s6,8(s2)
    735c:	00c92b83          	lw	s7,12(s2)
    7360:	00092703          	lw	a4,0(s2)
    7364:	00f42223          	sw	a5,4(s0)
    7368:	01294783          	lbu	a5,18(s2)
    736c:	00e42023          	sw	a4,0(s0)
    7370:	01642423          	sw	s6,8(s0)
    7374:	00f40923          	sb	a5,18(s0)
    7378:	01742623          	sw	s7,12(s0)
    737c:	00d41823          	sh	a3,16(s0)
    7380:	01390593          	add	a1,s2,19
    7384:	01340513          	add	a0,s0,19
    7388:	fed60613          	add	a2,a2,-19 # ffffefed <_ebss+0xfffe8f3d>
    738c:	f64fb0ef          	jal	2af0 <__GI_memcpy>
    7390:	01095783          	lhu	a5,16(s2)
    7394:	000c8413          	mv	s0,s9
    7398:	00f90933          	add	s2,s2,a5

0000739c <.L2>:
    739c:	02997863          	bgeu	s2,s1,73cc <.L8>
    73a0:	01095603          	lhu	a2,16(s2)
    73a4:	00760693          	add	a3,a2,7
    73a8:	ff86f693          	and	a3,a3,-8
    73ac:	00d40cb3          	add	s9,s0,a3
    73b0:	fb9a72e3          	bgeu	s4,s9,7354 <.L4>
    73b4:	00000693          	li	a3,0
    73b8:	000b0593          	mv	a1,s6
    73bc:	000b8613          	mv	a2,s7
    73c0:	000c0513          	mv	a0,s8
    73c4:	57d010ef          	jal	9140 <__GI_lseek64>
    73c8:	f75408e3          	beq	s0,s5,7338 <.L5>

000073cc <.L8>:
    73cc:	00098513          	mv	a0,s3
    73d0:	910fc0ef          	jal	34e0 <free>
    73d4:	41540533          	sub	a0,s0,s5

000073d8 <.L1>:
    73d8:	02c12083          	lw	ra,44(sp)
    73dc:	02812403          	lw	s0,40(sp)
    73e0:	02412483          	lw	s1,36(sp)
    73e4:	02012903          	lw	s2,32(sp)
    73e8:	01c12983          	lw	s3,28(sp)
    73ec:	01812a03          	lw	s4,24(sp)
    73f0:	01412a83          	lw	s5,20(sp)
    73f4:	01012b03          	lw	s6,16(sp)
    73f8:	00c12b83          	lw	s7,12(sp)
    73fc:	00812c03          	lw	s8,8(sp)
    7400:	00412c83          	lw	s9,4(sp)
    7404:	03010113          	add	sp,sp,48
    7408:	00008067          	ret

0000740c <.L9>:
    740c:	00098913          	mv	s2,s3
    7410:	000a8413          	mv	s0,s5
    7414:	fff00b13          	li	s6,-1
    7418:	fff00b93          	li	s7,-1
    741c:	00a984b3          	add	s1,s3,a0
    7420:	014a8a33          	add	s4,s5,s4
    7424:	f79ff06f          	j	739c <.L2>

00007428 <__GI_fseek>:
    7428:	00060693          	mv	a3,a2
    742c:	41f5d613          	sra	a2,a1,0x1f
    7430:	0040006f          	j	7434 <__GI_fseeko64>

00007434 <__GI_fseeko64>:
    7434:	fd010113          	add	sp,sp,-48
    7438:	02112623          	sw	ra,44(sp)
    743c:	02812423          	sw	s0,40(sp)
    7440:	00b12c23          	sw	a1,24(sp)
    7444:	00c12e23          	sw	a2,28(sp)
    7448:	00200793          	li	a5,2
    744c:	02d7f463          	bgeu	a5,a3,7474 <.L2>
    7450:	00009797          	auipc	a5,0x9
    7454:	fc47a783          	lw	a5,-60(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    7458:	01600713          	li	a4,22
    745c:	00e7a023          	sw	a4,0(a5)

00007460 <.L3>:
    7460:	fff00513          	li	a0,-1

00007464 <.L1>:
    7464:	02c12083          	lw	ra,44(sp)
    7468:	02812403          	lw	s0,40(sp)
    746c:	03010113          	add	sp,sp,48
    7470:	00008067          	ret

00007474 <.L2>:
    7474:	00055783          	lhu	a5,0(a0)
    7478:	00050413          	mv	s0,a0
    747c:	00068613          	mv	a2,a3
    7480:	0407f793          	and	a5,a5,64
    7484:	06079863          	bnez	a5,74f4 <.L4>

00007488 <.L7>:
    7488:	00100793          	li	a5,1
    748c:	00f61e63          	bne	a2,a5,74a8 <.L5>
    7490:	01810593          	add	a1,sp,24
    7494:	00040513          	mv	a0,s0
    7498:	00c12623          	sw	a2,12(sp)
    749c:	120000ef          	jal	75bc <__stdio_adjust_position>
    74a0:	00c12603          	lw	a2,12(sp)
    74a4:	fa054ee3          	bltz	a0,7460 <.L3>

000074a8 <.L5>:
    74a8:	00442703          	lw	a4,4(s0)
    74ac:	ffe00793          	li	a5,-2
    74b0:	04f71c63          	bne	a4,a5,7508 <.L20>
    74b4:	03042783          	lw	a5,48(s0)
    74b8:	fa0784e3          	beqz	a5,7460 <.L3>
    74bc:	02442503          	lw	a0,36(s0)
    74c0:	01810593          	add	a1,sp,24
    74c4:	000780e7          	jalr	a5

000074c8 <.L12>:
    74c8:	f8054ce3          	bltz	a0,7460 <.L3>
    74cc:	00045783          	lhu	a5,0(s0)
    74d0:	00000513          	li	a0,0
    74d4:	fb87f793          	and	a5,a5,-72
    74d8:	00f41023          	sh	a5,0(s0)
    74dc:	00842783          	lw	a5,8(s0)
    74e0:	00f42823          	sw	a5,16(s0)
    74e4:	00f42a23          	sw	a5,20(s0)
    74e8:	00f42c23          	sw	a5,24(s0)
    74ec:	00f42e23          	sw	a5,28(s0)
    74f0:	f75ff06f          	j	7464 <.L1>

000074f4 <.L4>:
    74f4:	00d12623          	sw	a3,12(sp)
    74f8:	ca0fa0ef          	jal	1998 <__stdio_wcommit>
    74fc:	00c12603          	lw	a2,12(sp)
    7500:	f80504e3          	beqz	a0,7488 <.L7>
    7504:	f5dff06f          	j	7460 <.L3>

00007508 <.L20>:
    7508:	01810593          	add	a1,sp,24
    750c:	00040513          	mv	a0,s0
    7510:	1ec000ef          	jal	76fc <__stdio_seek>
    7514:	fb5ff06f          	j	74c8 <.L12>

00007518 <__stdio_READ>:
    7518:	00055783          	lhu	a5,0(a0)
    751c:	0047f793          	and	a5,a5,4
    7520:	08079a63          	bnez	a5,75b4 <.L13>
    7524:	ff010113          	add	sp,sp,-16
    7528:	800007b7          	lui	a5,0x80000
    752c:	00812423          	sw	s0,8(sp)
    7530:	00912223          	sw	s1,4(sp)
    7534:	00112623          	sw	ra,12(sp)
    7538:	fff78793          	add	a5,a5,-1 # 7fffffff <_ebss+0x7ffe9f4f>
    753c:	00050413          	mv	s0,a0
    7540:	00060493          	mv	s1,a2
    7544:	00c7f463          	bgeu	a5,a2,754c <.L3>
    7548:	00078493          	mv	s1,a5

0000754c <.L3>:
    754c:	00442503          	lw	a0,4(s0)
    7550:	ffe00793          	li	a5,-2
    7554:	04f51663          	bne	a0,a5,75a0 <.L4>
    7558:	02842783          	lw	a5,40(s0)
    755c:	02078063          	beqz	a5,757c <.L5>
    7560:	02442503          	lw	a0,36(s0)
    7564:	00048613          	mv	a2,s1
    7568:	000780e7          	jalr	a5

0000756c <.L6>:
    756c:	04a04063          	bgtz	a0,75ac <.L7>
    7570:	00045783          	lhu	a5,0(s0)
    7574:	0047e793          	or	a5,a5,4
    7578:	00050663          	beqz	a0,7584 <.L17>

0000757c <.L5>:
    757c:	00045783          	lhu	a5,0(s0)
    7580:	0087e793          	or	a5,a5,8

00007584 <.L17>:
    7584:	00f41023          	sh	a5,0(s0)
    7588:	00000513          	li	a0,0

0000758c <.L8>:
    758c:	00c12083          	lw	ra,12(sp)
    7590:	00812403          	lw	s0,8(sp)
    7594:	00412483          	lw	s1,4(sp)
    7598:	01010113          	add	sp,sp,16
    759c:	00008067          	ret

000075a0 <.L4>:
    75a0:	00048613          	mv	a2,s1
    75a4:	349010ef          	jal	90ec <__GI_read>
    75a8:	fc5ff06f          	j	756c <.L6>

000075ac <.L7>:
    75ac:	fea4f0e3          	bgeu	s1,a0,758c <.L8>
    75b0:	190000ef          	jal	7740 <__GI_abort>

000075b4 <.L13>:
    75b4:	00000513          	li	a0,0
    75b8:	00008067          	ret

000075bc <__stdio_adjust_position>:
    75bc:	00055783          	lhu	a5,0(a0)
    75c0:	00000713          	li	a4,0
    75c4:	0037f693          	and	a3,a5,3
    75c8:	00068463          	beqz	a3,75d0 <.L2>
    75cc:	fff68713          	add	a4,a3,-1

000075d0 <.L2>:
    75d0:	0407f793          	and	a5,a5,64
    75d4:	06078063          	beqz	a5,7634 <.L3>
    75d8:	00852783          	lw	a5,8(a0)

000075dc <.L4>:
    75dc:	01052683          	lw	a3,16(a0)
    75e0:	0045a603          	lw	a2,4(a1)
    75e4:	40d78533          	sub	a0,a5,a3
    75e8:	00e50533          	add	a0,a0,a4
    75ec:	0005a703          	lw	a4,0(a1)
    75f0:	41f55793          	sra	a5,a0,0x1f
    75f4:	40f607b3          	sub	a5,a2,a5
    75f8:	40a706b3          	sub	a3,a4,a0
    75fc:	00d73833          	sltu	a6,a4,a3
    7600:	410787b3          	sub	a5,a5,a6
    7604:	00d5a023          	sw	a3,0(a1)
    7608:	00f5a223          	sw	a5,4(a1)
    760c:	00f64663          	blt	a2,a5,7618 <.L9>
    7610:	00c79663          	bne	a5,a2,761c <.L5>
    7614:	00d77463          	bgeu	a4,a3,761c <.L5>

00007618 <.L9>:
    7618:	40a00533          	neg	a0,a0

0000761c <.L5>:
    761c:	00055a63          	bgez	a0,7630 <.L1>
    7620:	00009797          	auipc	a5,0x9
    7624:	df47a783          	lw	a5,-524(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    7628:	04b00713          	li	a4,75
    762c:	00e7a023          	sw	a4,0(a5)

00007630 <.L1>:
    7630:	00008067          	ret

00007634 <.L3>:
    7634:	01452783          	lw	a5,20(a0)
    7638:	fa5ff06f          	j	75dc <.L4>

0000763c <__stdio_rfill>:
    763c:	00852583          	lw	a1,8(a0)
    7640:	00c52603          	lw	a2,12(a0)
    7644:	ff010113          	add	sp,sp,-16
    7648:	00812423          	sw	s0,8(sp)
    764c:	40b60633          	sub	a2,a2,a1
    7650:	00112623          	sw	ra,12(sp)
    7654:	00050413          	mv	s0,a0
    7658:	ec1ff0ef          	jal	7518 <__stdio_READ>
    765c:	00842783          	lw	a5,8(s0)
    7660:	00c12083          	lw	ra,12(sp)
    7664:	00f42823          	sw	a5,16(s0)
    7668:	00a787b3          	add	a5,a5,a0
    766c:	00f42a23          	sw	a5,20(s0)
    7670:	00812403          	lw	s0,8(sp)
    7674:	01010113          	add	sp,sp,16
    7678:	00008067          	ret

0000767c <__stdio_trans2r>:
    767c:	00055783          	lhu	a5,0(a0)
    7680:	ff010113          	add	sp,sp,-16
    7684:	00812423          	sw	s0,8(sp)
    7688:	00112623          	sw	ra,12(sp)
    768c:	0107f713          	and	a4,a5,16
    7690:	00050413          	mv	s0,a0
    7694:	02070a63          	beqz	a4,76c8 <.L2>
    7698:	00009797          	auipc	a5,0x9
    769c:	d7c7a783          	lw	a5,-644(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    76a0:	00900713          	li	a4,9
    76a4:	00e7a023          	sw	a4,0(a5)

000076a8 <.L3>:
    76a8:	00045783          	lhu	a5,0(s0)
    76ac:	fff00513          	li	a0,-1
    76b0:	0087e793          	or	a5,a5,8

000076b4 <.L4>:
    76b4:	00c12083          	lw	ra,12(sp)
    76b8:	00f41023          	sh	a5,0(s0)
    76bc:	00812403          	lw	s0,8(sp)
    76c0:	01010113          	add	sp,sp,16
    76c4:	00008067          	ret

000076c8 <.L2>:
    76c8:	0407f793          	and	a5,a5,64
    76cc:	02078063          	beqz	a5,76ec <.L5>
    76d0:	ac8fa0ef          	jal	1998 <__stdio_wcommit>
    76d4:	fc051ae3          	bnez	a0,76a8 <.L3>
    76d8:	00842783          	lw	a5,8(s0)
    76dc:	00f42e23          	sw	a5,28(s0)
    76e0:	00045783          	lhu	a5,0(s0)
    76e4:	fbf7f793          	and	a5,a5,-65
    76e8:	00f41023          	sh	a5,0(s0)

000076ec <.L5>:
    76ec:	00045783          	lhu	a5,0(s0)
    76f0:	00000513          	li	a0,0
    76f4:	0017e793          	or	a5,a5,1
    76f8:	fbdff06f          	j	76b4 <.L4>

000076fc <__stdio_seek>:
    76fc:	ff010113          	add	sp,sp,-16
    7700:	00812423          	sw	s0,8(sp)
    7704:	00058413          	mv	s0,a1
    7708:	00060693          	mv	a3,a2
    770c:	0005a583          	lw	a1,0(a1)
    7710:	00442603          	lw	a2,4(s0)
    7714:	00452503          	lw	a0,4(a0)
    7718:	00112623          	sw	ra,12(sp)
    771c:	225010ef          	jal	9140 <__GI_lseek64>
    7720:	0005c863          	bltz	a1,7730 <.L1>
    7724:	00a42023          	sw	a0,0(s0)
    7728:	00b42223          	sw	a1,4(s0)
    772c:	00000513          	li	a0,0

00007730 <.L1>:
    7730:	00c12083          	lw	ra,12(sp)
    7734:	00812403          	lw	s0,8(sp)
    7738:	01010113          	add	sp,sp,16
    773c:	00008067          	ret

00007740 <__GI_abort>:
    7740:	fd010113          	add	sp,sp,-48
    7744:	02000793          	li	a5,32
    7748:	00000613          	li	a2,0
    774c:	00410593          	add	a1,sp,4
    7750:	00100513          	li	a0,1
    7754:	02812423          	sw	s0,40(sp)
    7758:	00f12223          	sw	a5,4(sp)
    775c:	02112623          	sw	ra,44(sp)
    7760:	02912223          	sw	s1,36(sp)
    7764:	00012423          	sw	zero,8(sp)
    7768:	0000e417          	auipc	s0,0xe
    776c:	7dc40413          	add	s0,s0,2012 # 15f44 <been_there_done_that>
    7770:	1a5010ef          	jal	9114 <__GI_sigprocmask>
    7774:	00042783          	lw	a5,0(s0)
    7778:	00079a63          	bnez	a5,778c <.L2>
    777c:	00100793          	li	a5,1
    7780:	00f42023          	sw	a5,0(s0)

00007784 <.L3>:
    7784:	00600513          	li	a0,6
    7788:	221010ef          	jal	91a8 <__GI_raise>

0000778c <.L2>:
    778c:	00042783          	lw	a5,0(s0)
    7790:	00100713          	li	a4,1
    7794:	04e79063          	bne	a5,a4,77d4 <.L4>
    7798:	00c10493          	add	s1,sp,12
    779c:	00200793          	li	a5,2
    77a0:	01400613          	li	a2,20
    77a4:	00000593          	li	a1,0
    77a8:	00048513          	mv	a0,s1
    77ac:	00f42023          	sw	a5,0(s0)
    77b0:	de8fb0ef          	jal	2d98 <__GI_memset>
    77b4:	fff00793          	li	a5,-1
    77b8:	00000613          	li	a2,0
    77bc:	00048593          	mv	a1,s1
    77c0:	00600513          	li	a0,6
    77c4:	00f12c23          	sw	a5,24(sp)
    77c8:	00f12e23          	sw	a5,28(sp)
    77cc:	1d5010ef          	jal	91a0 <__GI_sigaction>
    77d0:	fb5ff06f          	j	7784 <.L3>

000077d4 <.L4>:
    77d4:	ffe78793          	add	a5,a5,-2
    77d8:	00f76a63          	bltu	a4,a5,77ec <.L5>
    77dc:	00400793          	li	a5,4
    77e0:	07f00513          	li	a0,127
    77e4:	00f42023          	sw	a5,0(s0)
    77e8:	a79ff0ef          	jal	7260 <__GI__exit>

000077ec <.L5>:
    77ec:	0000006f          	j	77ec <.L5>

000077f0 <__ieee754_rem_pio2>:
    77f0:	fa010113          	add	sp,sp,-96
    77f4:	04912a23          	sw	s1,84(sp)
    77f8:	3fe926b7          	lui	a3,0x3fe92
    77fc:	00159493          	sll	s1,a1,0x1
    7800:	04812c23          	sw	s0,88(sp)
    7804:	04112e23          	sw	ra,92(sp)
    7808:	05212823          	sw	s2,80(sp)
    780c:	05312623          	sw	s3,76(sp)
    7810:	05412423          	sw	s4,72(sp)
    7814:	05512223          	sw	s5,68(sp)
    7818:	05612023          	sw	s6,64(sp)
    781c:	03712e23          	sw	s7,60(sp)
    7820:	03812c23          	sw	s8,56(sp)
    7824:	03912a23          	sw	s9,52(sp)
    7828:	03a12823          	sw	s10,48(sp)
    782c:	03b12623          	sw	s11,44(sp)
    7830:	0014d493          	srl	s1,s1,0x1
    7834:	1fb68693          	add	a3,a3,507 # 3fe921fb <_ebss+0x3fe7c14b>
    7838:	00060413          	mv	s0,a2
    783c:	0296e263          	bltu	a3,s1,7860 <.L2>
    7840:	00000713          	li	a4,0
    7844:	00000793          	li	a5,0
    7848:	00a42023          	sw	a0,0(s0)
    784c:	00b42223          	sw	a1,4(s0)
    7850:	00e42423          	sw	a4,8(s0)
    7854:	00f42623          	sw	a5,12(s0)

00007858 <.L3>:
    7858:	00000913          	li	s2,0
    785c:	0b40006f          	j	7910 <.L1>

00007860 <.L2>:
    7860:	4002e6b7          	lui	a3,0x4002e
    7864:	97b68693          	add	a3,a3,-1669 # 4002d97b <_ebss+0x400178cb>
    7868:	00058c93          	mv	s9,a1
    786c:	1696ee63          	bltu	a3,s1,79e8 <.L4>
    7870:	0000b797          	auipc	a5,0xb
    7874:	9f078793          	add	a5,a5,-1552 # 12260 <.LC0>
    7878:	0cb05c63          	blez	a1,7950 <.L5>
    787c:	0007a603          	lw	a2,0(a5)
    7880:	0047a683          	lw	a3,4(a5)
    7884:	0000ba97          	auipc	s5,0xb
    7888:	9e4a8a93          	add	s5,s5,-1564 # 12268 <.LC1>
    788c:	789020ef          	jal	a814 <__subdf3>
    7890:	3ff927b7          	lui	a5,0x3ff92
    7894:	1fb78793          	add	a5,a5,507 # 3ff921fb <_ebss+0x3ff7c14b>
    7898:	00050a13          	mv	s4,a0
    789c:	00058993          	mv	s3,a1
    78a0:	02f49463          	bne	s1,a5,78c8 <.L22>
    78a4:	0000b797          	auipc	a5,0xb
    78a8:	9cc78793          	add	a5,a5,-1588 # 12270 <.LC2>
    78ac:	0007a603          	lw	a2,0(a5)
    78b0:	0047a683          	lw	a3,4(a5)
    78b4:	0000ba97          	auipc	s5,0xb
    78b8:	9c4a8a93          	add	s5,s5,-1596 # 12278 <.LC3>
    78bc:	759020ef          	jal	a814 <__subdf3>
    78c0:	00050a13          	mv	s4,a0
    78c4:	00058993          	mv	s3,a1

000078c8 <.L22>:
    78c8:	000aa603          	lw	a2,0(s5)
    78cc:	004aa683          	lw	a3,4(s5)
    78d0:	745020ef          	jal	a814 <__subdf3>
    78d4:	00050913          	mv	s2,a0
    78d8:	00050613          	mv	a2,a0
    78dc:	00058693          	mv	a3,a1
    78e0:	00058493          	mv	s1,a1
    78e4:	000a0513          	mv	a0,s4
    78e8:	00098593          	mv	a1,s3
    78ec:	729020ef          	jal	a814 <__subdf3>
    78f0:	000aa603          	lw	a2,0(s5)
    78f4:	004aa683          	lw	a3,4(s5)
    78f8:	71d020ef          	jal	a814 <__subdf3>
    78fc:	00a42423          	sw	a0,8(s0)
    7900:	01242023          	sw	s2,0(s0)
    7904:	00942223          	sw	s1,4(s0)
    7908:	00b42623          	sw	a1,12(s0)
    790c:	00100913          	li	s2,1

00007910 <.L1>:
    7910:	05c12083          	lw	ra,92(sp)
    7914:	05812403          	lw	s0,88(sp)
    7918:	05412483          	lw	s1,84(sp)
    791c:	04c12983          	lw	s3,76(sp)
    7920:	04812a03          	lw	s4,72(sp)
    7924:	04412a83          	lw	s5,68(sp)
    7928:	04012b03          	lw	s6,64(sp)
    792c:	03c12b83          	lw	s7,60(sp)
    7930:	03812c03          	lw	s8,56(sp)
    7934:	03412c83          	lw	s9,52(sp)
    7938:	03012d03          	lw	s10,48(sp)
    793c:	02c12d83          	lw	s11,44(sp)
    7940:	00090513          	mv	a0,s2
    7944:	05012903          	lw	s2,80(sp)
    7948:	06010113          	add	sp,sp,96
    794c:	00008067          	ret

00007950 <.L5>:
    7950:	0007a603          	lw	a2,0(a5)
    7954:	0047a683          	lw	a3,4(a5)
    7958:	0000ba97          	auipc	s5,0xb
    795c:	910a8a93          	add	s5,s5,-1776 # 12268 <.LC1>
    7960:	0e9010ef          	jal	9248 <__adddf3>
    7964:	3ff927b7          	lui	a5,0x3ff92
    7968:	1fb78793          	add	a5,a5,507 # 3ff921fb <_ebss+0x3ff7c14b>
    796c:	00050a13          	mv	s4,a0
    7970:	00058993          	mv	s3,a1
    7974:	02f49463          	bne	s1,a5,799c <.L23>
    7978:	0000b797          	auipc	a5,0xb
    797c:	8f878793          	add	a5,a5,-1800 # 12270 <.LC2>
    7980:	0007a603          	lw	a2,0(a5)
    7984:	0047a683          	lw	a3,4(a5)
    7988:	0000ba97          	auipc	s5,0xb
    798c:	8f0a8a93          	add	s5,s5,-1808 # 12278 <.LC3>
    7990:	0b9010ef          	jal	9248 <__adddf3>
    7994:	00050a13          	mv	s4,a0
    7998:	00058993          	mv	s3,a1

0000799c <.L23>:
    799c:	000aa603          	lw	a2,0(s5)
    79a0:	004aa683          	lw	a3,4(s5)
    79a4:	0a5010ef          	jal	9248 <__adddf3>
    79a8:	00050913          	mv	s2,a0
    79ac:	00050613          	mv	a2,a0
    79b0:	00058693          	mv	a3,a1
    79b4:	00058493          	mv	s1,a1
    79b8:	000a0513          	mv	a0,s4
    79bc:	00098593          	mv	a1,s3
    79c0:	655020ef          	jal	a814 <__subdf3>
    79c4:	000aa603          	lw	a2,0(s5)
    79c8:	004aa683          	lw	a3,4(s5)
    79cc:	07d010ef          	jal	9248 <__adddf3>
    79d0:	00a42423          	sw	a0,8(s0)
    79d4:	01242023          	sw	s2,0(s0)
    79d8:	00942223          	sw	s1,4(s0)
    79dc:	00b42623          	sw	a1,12(s0)
    79e0:	fff00913          	li	s2,-1
    79e4:	f2dff06f          	j	7910 <.L1>

000079e8 <.L4>:
    79e8:	413926b7          	lui	a3,0x41392
    79ec:	1fb68693          	add	a3,a3,507 # 413921fb <_ebss+0x4137c14b>
    79f0:	2c96ea63          	bltu	a3,s1,7cc4 <.L11>
    79f4:	ef8ff0ef          	jal	70ec <__GI_fabs>
    79f8:	0000b797          	auipc	a5,0xb
    79fc:	88878793          	add	a5,a5,-1912 # 12280 <.LC4>
    7a00:	0007a603          	lw	a2,0(a5)
    7a04:	0047a683          	lw	a3,4(a5)
    7a08:	00050a13          	mv	s4,a0
    7a0c:	00058993          	mv	s3,a1
    7a10:	015020ef          	jal	a224 <__muldf3>
    7a14:	0000b797          	auipc	a5,0xb
    7a18:	87478793          	add	a5,a5,-1932 # 12288 <.LC2>
    7a1c:	0007a603          	lw	a2,0(a5)
    7a20:	0047a683          	lw	a3,4(a5)
    7a24:	025010ef          	jal	9248 <__adddf3>
    7a28:	594030ef          	jal	afbc <__fixdfsi>
    7a2c:	00050913          	mv	s2,a0
    7a30:	60c030ef          	jal	b03c <__floatsidf>
    7a34:	0000b797          	auipc	a5,0xb
    7a38:	82c78793          	add	a5,a5,-2004 # 12260 <.LC0>
    7a3c:	0007a603          	lw	a2,0(a5)
    7a40:	0047a683          	lw	a3,4(a5)
    7a44:	00050c13          	mv	s8,a0
    7a48:	00058b93          	mv	s7,a1
    7a4c:	7d8020ef          	jal	a224 <__muldf3>
    7a50:	00050613          	mv	a2,a0
    7a54:	00058693          	mv	a3,a1
    7a58:	000a0513          	mv	a0,s4
    7a5c:	00098593          	mv	a1,s3
    7a60:	5b5020ef          	jal	a814 <__subdf3>
    7a64:	0000b797          	auipc	a5,0xb
    7a68:	80478793          	add	a5,a5,-2044 # 12268 <.LC1>
    7a6c:	0007a603          	lw	a2,0(a5)
    7a70:	0047a683          	lw	a3,4(a5)
    7a74:	00050b13          	mv	s6,a0
    7a78:	00058a93          	mv	s5,a1
    7a7c:	000c0513          	mv	a0,s8
    7a80:	000b8593          	mv	a1,s7
    7a84:	7a0020ef          	jal	a224 <__muldf3>
    7a88:	00050613          	mv	a2,a0
    7a8c:	00058693          	mv	a3,a1
    7a90:	00050a13          	mv	s4,a0
    7a94:	00058993          	mv	s3,a1
    7a98:	000b0513          	mv	a0,s6
    7a9c:	000a8593          	mv	a1,s5
    7aa0:	575020ef          	jal	a814 <__subdf3>
    7aa4:	01f00793          	li	a5,31
    7aa8:	0327c063          	blt	a5,s2,7ac8 <.L12>
    7aac:	fff90713          	add	a4,s2,-1
    7ab0:	00271713          	sll	a4,a4,0x2
    7ab4:	0000a797          	auipc	a5,0xa
    7ab8:	fd478793          	add	a5,a5,-44 # 11a88 <npio2_hw>
    7abc:	00e787b3          	add	a5,a5,a4
    7ac0:	0007a783          	lw	a5,0(a5)
    7ac4:	00979e63          	bne	a5,s1,7ae0 <.L13>

00007ac8 <.L12>:
    7ac8:	0145d793          	srl	a5,a1,0x14
    7acc:	4144d493          	sra	s1,s1,0x14
    7ad0:	7ff7f793          	and	a5,a5,2047
    7ad4:	40f487b3          	sub	a5,s1,a5
    7ad8:	01000713          	li	a4,16
    7adc:	04f74e63          	blt	a4,a5,7b38 <.L14>

00007ae0 <.L13>:
    7ae0:	00a42023          	sw	a0,0(s0)
    7ae4:	00b42223          	sw	a1,4(s0)

00007ae8 <.L15>:
    7ae8:	00042703          	lw	a4,0(s0)
    7aec:	00442483          	lw	s1,4(s0)
    7af0:	000b0513          	mv	a0,s6
    7af4:	00070613          	mv	a2,a4
    7af8:	00048693          	mv	a3,s1
    7afc:	000a8593          	mv	a1,s5
    7b00:	515020ef          	jal	a814 <__subdf3>
    7b04:	000a0613          	mv	a2,s4
    7b08:	00098693          	mv	a3,s3
    7b0c:	509020ef          	jal	a814 <__subdf3>
    7b10:	00a42423          	sw	a0,8(s0)
    7b14:	00b42623          	sw	a1,12(s0)
    7b18:	de0cdce3          	bgez	s9,7910 <.L1>
    7b1c:	800007b7          	lui	a5,0x80000
    7b20:	0097c4b3          	xor	s1,a5,s1
    7b24:	00942223          	sw	s1,4(s0)
    7b28:	00b7c7b3          	xor	a5,a5,a1

00007b2c <.L24>:
    7b2c:	00f42623          	sw	a5,12(s0)
    7b30:	41200933          	neg	s2,s2
    7b34:	dddff06f          	j	7910 <.L1>

00007b38 <.L14>:
    7b38:	0000a797          	auipc	a5,0xa
    7b3c:	73878793          	add	a5,a5,1848 # 12270 <.LC2>
    7b40:	0007a603          	lw	a2,0(a5)
    7b44:	0047a683          	lw	a3,4(a5)
    7b48:	000c0513          	mv	a0,s8
    7b4c:	000b8593          	mv	a1,s7
    7b50:	6d4020ef          	jal	a224 <__muldf3>
    7b54:	00050a13          	mv	s4,a0
    7b58:	00058993          	mv	s3,a1
    7b5c:	00050613          	mv	a2,a0
    7b60:	00058693          	mv	a3,a1
    7b64:	000b0513          	mv	a0,s6
    7b68:	000a8593          	mv	a1,s5
    7b6c:	4a9020ef          	jal	a814 <__subdf3>
    7b70:	00050613          	mv	a2,a0
    7b74:	00058693          	mv	a3,a1
    7b78:	00050d93          	mv	s11,a0
    7b7c:	00058d13          	mv	s10,a1
    7b80:	000b0513          	mv	a0,s6
    7b84:	000a8593          	mv	a1,s5
    7b88:	48d020ef          	jal	a814 <__subdf3>
    7b8c:	000a0613          	mv	a2,s4
    7b90:	00098693          	mv	a3,s3
    7b94:	481020ef          	jal	a814 <__subdf3>
    7b98:	0000a797          	auipc	a5,0xa
    7b9c:	6e078793          	add	a5,a5,1760 # 12278 <.LC3>
    7ba0:	0007a603          	lw	a2,0(a5)
    7ba4:	0047a683          	lw	a3,4(a5)
    7ba8:	00050a13          	mv	s4,a0
    7bac:	00058993          	mv	s3,a1
    7bb0:	000c0513          	mv	a0,s8
    7bb4:	000b8593          	mv	a1,s7
    7bb8:	66c020ef          	jal	a224 <__muldf3>
    7bbc:	000a0613          	mv	a2,s4
    7bc0:	00098693          	mv	a3,s3
    7bc4:	451020ef          	jal	a814 <__subdf3>
    7bc8:	00050613          	mv	a2,a0
    7bcc:	00058693          	mv	a3,a1
    7bd0:	00050a13          	mv	s4,a0
    7bd4:	00058993          	mv	s3,a1
    7bd8:	000d8513          	mv	a0,s11
    7bdc:	000d0593          	mv	a1,s10
    7be0:	435020ef          	jal	a814 <__subdf3>
    7be4:	0145d793          	srl	a5,a1,0x14
    7be8:	7ff7f793          	and	a5,a5,2047
    7bec:	40f484b3          	sub	s1,s1,a5
    7bf0:	03100793          	li	a5,49
    7bf4:	0097cc63          	blt	a5,s1,7c0c <.L16>
    7bf8:	00a42023          	sw	a0,0(s0)
    7bfc:	00b42223          	sw	a1,4(s0)
    7c00:	000d8b13          	mv	s6,s11
    7c04:	000d0a93          	mv	s5,s10
    7c08:	ee1ff06f          	j	7ae8 <.L15>

00007c0c <.L16>:
    7c0c:	0000a797          	auipc	a5,0xa
    7c10:	68478793          	add	a5,a5,1668 # 12290 <.LC6>
    7c14:	0007a603          	lw	a2,0(a5)
    7c18:	0047a683          	lw	a3,4(a5)
    7c1c:	000c0513          	mv	a0,s8
    7c20:	000b8593          	mv	a1,s7
    7c24:	600020ef          	jal	a224 <__muldf3>
    7c28:	00050993          	mv	s3,a0
    7c2c:	00058493          	mv	s1,a1
    7c30:	00050613          	mv	a2,a0
    7c34:	00058693          	mv	a3,a1
    7c38:	000d8513          	mv	a0,s11
    7c3c:	000d0593          	mv	a1,s10
    7c40:	3d5020ef          	jal	a814 <__subdf3>
    7c44:	00050613          	mv	a2,a0
    7c48:	00058693          	mv	a3,a1
    7c4c:	00050b13          	mv	s6,a0
    7c50:	00058a93          	mv	s5,a1
    7c54:	000d8513          	mv	a0,s11
    7c58:	000d0593          	mv	a1,s10
    7c5c:	3b9020ef          	jal	a814 <__subdf3>
    7c60:	00098613          	mv	a2,s3
    7c64:	00048693          	mv	a3,s1
    7c68:	3ad020ef          	jal	a814 <__subdf3>
    7c6c:	0000a797          	auipc	a5,0xa
    7c70:	62c78793          	add	a5,a5,1580 # 12298 <.LC7>
    7c74:	0007a603          	lw	a2,0(a5)
    7c78:	0047a683          	lw	a3,4(a5)
    7c7c:	00050993          	mv	s3,a0
    7c80:	00058493          	mv	s1,a1
    7c84:	000c0513          	mv	a0,s8
    7c88:	000b8593          	mv	a1,s7
    7c8c:	598020ef          	jal	a224 <__muldf3>
    7c90:	00098613          	mv	a2,s3
    7c94:	00048693          	mv	a3,s1
    7c98:	37d020ef          	jal	a814 <__subdf3>
    7c9c:	00050613          	mv	a2,a0
    7ca0:	00058693          	mv	a3,a1
    7ca4:	00050a13          	mv	s4,a0
    7ca8:	00058993          	mv	s3,a1
    7cac:	000b0513          	mv	a0,s6
    7cb0:	000a8593          	mv	a1,s5
    7cb4:	361020ef          	jal	a814 <__subdf3>
    7cb8:	00a42023          	sw	a0,0(s0)
    7cbc:	00b42223          	sw	a1,4(s0)
    7cc0:	e29ff06f          	j	7ae8 <.L15>

00007cc4 <.L11>:
    7cc4:	7ff006b7          	lui	a3,0x7ff00
    7cc8:	02d4e263          	bltu	s1,a3,7cec <.L17>
    7ccc:	00050613          	mv	a2,a0
    7cd0:	00058693          	mv	a3,a1
    7cd4:	341020ef          	jal	a814 <__subdf3>
    7cd8:	00a42423          	sw	a0,8(s0)
    7cdc:	00b42623          	sw	a1,12(s0)
    7ce0:	00a42023          	sw	a0,0(s0)
    7ce4:	00b42223          	sw	a1,4(s0)
    7ce8:	b71ff06f          	j	7858 <.L3>

00007cec <.L17>:
    7cec:	4144d913          	sra	s2,s1,0x14
    7cf0:	bea90913          	add	s2,s2,-1046
    7cf4:	01491713          	sll	a4,s2,0x14
    7cf8:	40e489b3          	sub	s3,s1,a4
    7cfc:	00098593          	mv	a1,s3
    7d00:	00050a13          	mv	s4,a0
    7d04:	2b8030ef          	jal	afbc <__fixdfsi>
    7d08:	334030ef          	jal	b03c <__floatsidf>
    7d0c:	00050613          	mv	a2,a0
    7d10:	00058693          	mv	a3,a1
    7d14:	00a12423          	sw	a0,8(sp)
    7d18:	00b12623          	sw	a1,12(sp)
    7d1c:	000a0513          	mv	a0,s4
    7d20:	00098593          	mv	a1,s3
    7d24:	0000aa17          	auipc	s4,0xa
    7d28:	57ca0a13          	add	s4,s4,1404 # 122a0 <.LC1>
    7d2c:	2e9020ef          	jal	a814 <__subdf3>
    7d30:	000a2603          	lw	a2,0(s4)
    7d34:	004a2683          	lw	a3,4(s4)
    7d38:	4ec020ef          	jal	a224 <__muldf3>
    7d3c:	00058493          	mv	s1,a1
    7d40:	00050993          	mv	s3,a0
    7d44:	278030ef          	jal	afbc <__fixdfsi>
    7d48:	2f4030ef          	jal	b03c <__floatsidf>
    7d4c:	00050613          	mv	a2,a0
    7d50:	00058693          	mv	a3,a1
    7d54:	00a12823          	sw	a0,16(sp)
    7d58:	00b12a23          	sw	a1,20(sp)
    7d5c:	00098513          	mv	a0,s3
    7d60:	00048593          	mv	a1,s1
    7d64:	2b1020ef          	jal	a814 <__subdf3>
    7d68:	000a2603          	lw	a2,0(s4)
    7d6c:	004a2683          	lw	a3,4(s4)
    7d70:	00810493          	add	s1,sp,8
    7d74:	00300993          	li	s3,3
    7d78:	4ac020ef          	jal	a224 <__muldf3>
    7d7c:	00a12c23          	sw	a0,24(sp)
    7d80:	00b12e23          	sw	a1,28(sp)
    7d84:	00048a13          	mv	s4,s1

00007d88 <.L18>:
    7d88:	0104a503          	lw	a0,16(s1)
    7d8c:	0144a583          	lw	a1,20(s1)
    7d90:	00000613          	li	a2,0
    7d94:	00000693          	li	a3,0
    7d98:	ff848493          	add	s1,s1,-8
    7d9c:	00098a93          	mv	s5,s3
    7da0:	fff98993          	add	s3,s3,-1
    7da4:	318020ef          	jal	a0bc <__eqdf2>
    7da8:	fe0500e3          	beqz	a0,7d88 <.L18>
    7dac:	00090613          	mv	a2,s2
    7db0:	0000a797          	auipc	a5,0xa
    7db4:	d5878793          	add	a5,a5,-680 # 11b08 <two_over_pi>
    7db8:	00200713          	li	a4,2
    7dbc:	000a8693          	mv	a3,s5
    7dc0:	00040593          	mv	a1,s0
    7dc4:	000a0513          	mv	a0,s4
    7dc8:	2b4000ef          	jal	807c <__kernel_rem_pio2>
    7dcc:	00050913          	mv	s2,a0
    7dd0:	b40cd0e3          	bgez	s9,7910 <.L1>
    7dd4:	00442603          	lw	a2,4(s0)
    7dd8:	800006b7          	lui	a3,0x80000
    7ddc:	00d647b3          	xor	a5,a2,a3
    7de0:	00c42603          	lw	a2,12(s0)
    7de4:	00f42223          	sw	a5,4(s0)
    7de8:	00d647b3          	xor	a5,a2,a3
    7dec:	d41ff06f          	j	7b2c <.L24>

00007df0 <__kernel_cos>:
    7df0:	fd010113          	add	sp,sp,-48
    7df4:	03212023          	sw	s2,32(sp)
    7df8:	00159913          	sll	s2,a1,0x1
    7dfc:	01312e23          	sw	s3,28(sp)
    7e00:	01412c23          	sw	s4,24(sp)
    7e04:	01512a23          	sw	s5,20(sp)
    7e08:	01812423          	sw	s8,8(sp)
    7e0c:	01912223          	sw	s9,4(sp)
    7e10:	02112623          	sw	ra,44(sp)
    7e14:	02812423          	sw	s0,40(sp)
    7e18:	02912223          	sw	s1,36(sp)
    7e1c:	01612823          	sw	s6,16(sp)
    7e20:	01712623          	sw	s7,12(sp)
    7e24:	00195913          	srl	s2,s2,0x1
    7e28:	3e4007b7          	lui	a5,0x3e400
    7e2c:	00050a13          	mv	s4,a0
    7e30:	00058993          	mv	s3,a1
    7e34:	00060c93          	mv	s9,a2
    7e38:	00068c13          	mv	s8,a3
    7e3c:	0000aa97          	auipc	s5,0xa
    7e40:	3aca8a93          	add	s5,s5,940 # 121e8 <.LC1>
    7e44:	00f97663          	bgeu	s2,a5,7e50 <.L2>
    7e48:	174030ef          	jal	afbc <__fixdfsi>
    7e4c:	22050263          	beqz	a0,8070 <.L6>

00007e50 <.L2>:
    7e50:	000a0613          	mv	a2,s4
    7e54:	00098693          	mv	a3,s3
    7e58:	000a0513          	mv	a0,s4
    7e5c:	00098593          	mv	a1,s3
    7e60:	3c4020ef          	jal	a224 <__muldf3>
    7e64:	0000a797          	auipc	a5,0xa
    7e68:	42478793          	add	a5,a5,1060 # 12288 <.LC2>
    7e6c:	0007a603          	lw	a2,0(a5)
    7e70:	0047a683          	lw	a3,4(a5)
    7e74:	00050493          	mv	s1,a0
    7e78:	00058413          	mv	s0,a1
    7e7c:	3a8020ef          	jal	a224 <__muldf3>
    7e80:	0000a797          	auipc	a5,0xa
    7e84:	43078793          	add	a5,a5,1072 # 122b0 <.LC3>
    7e88:	0007a603          	lw	a2,0(a5)
    7e8c:	0047a683          	lw	a3,4(a5)
    7e90:	00050b93          	mv	s7,a0
    7e94:	00058b13          	mv	s6,a1
    7e98:	00048513          	mv	a0,s1
    7e9c:	00040593          	mv	a1,s0
    7ea0:	384020ef          	jal	a224 <__muldf3>
    7ea4:	0000a797          	auipc	a5,0xa
    7ea8:	41478793          	add	a5,a5,1044 # 122b8 <.LC4>
    7eac:	0007a603          	lw	a2,0(a5)
    7eb0:	0047a683          	lw	a3,4(a5)
    7eb4:	394010ef          	jal	9248 <__adddf3>
    7eb8:	00048613          	mv	a2,s1
    7ebc:	00040693          	mv	a3,s0
    7ec0:	364020ef          	jal	a224 <__muldf3>
    7ec4:	0000a797          	auipc	a5,0xa
    7ec8:	3fc78793          	add	a5,a5,1020 # 122c0 <.LC5>
    7ecc:	0007a603          	lw	a2,0(a5)
    7ed0:	0047a683          	lw	a3,4(a5)
    7ed4:	141020ef          	jal	a814 <__subdf3>
    7ed8:	00048613          	mv	a2,s1
    7edc:	00040693          	mv	a3,s0
    7ee0:	344020ef          	jal	a224 <__muldf3>
    7ee4:	0000a797          	auipc	a5,0xa
    7ee8:	3e478793          	add	a5,a5,996 # 122c8 <.LC6>
    7eec:	0007a603          	lw	a2,0(a5)
    7ef0:	0047a683          	lw	a3,4(a5)
    7ef4:	354010ef          	jal	9248 <__adddf3>
    7ef8:	00048613          	mv	a2,s1
    7efc:	00040693          	mv	a3,s0
    7f00:	324020ef          	jal	a224 <__muldf3>
    7f04:	0000a797          	auipc	a5,0xa
    7f08:	3cc78793          	add	a5,a5,972 # 122d0 <.LC7>
    7f0c:	0007a603          	lw	a2,0(a5)
    7f10:	0047a683          	lw	a3,4(a5)
    7f14:	101020ef          	jal	a814 <__subdf3>
    7f18:	00048613          	mv	a2,s1
    7f1c:	00040693          	mv	a3,s0
    7f20:	304020ef          	jal	a224 <__muldf3>
    7f24:	0000a797          	auipc	a5,0xa
    7f28:	3b478793          	add	a5,a5,948 # 122d8 <.LC8>
    7f2c:	0007a603          	lw	a2,0(a5)
    7f30:	0047a683          	lw	a3,4(a5)
    7f34:	314010ef          	jal	9248 <__adddf3>
    7f38:	00048613          	mv	a2,s1
    7f3c:	00040693          	mv	a3,s0
    7f40:	2e4020ef          	jal	a224 <__muldf3>
    7f44:	00048613          	mv	a2,s1
    7f48:	00040693          	mv	a3,s0
    7f4c:	2d8020ef          	jal	a224 <__muldf3>
    7f50:	00050493          	mv	s1,a0
    7f54:	00058413          	mv	s0,a1
    7f58:	000c8613          	mv	a2,s9
    7f5c:	000c0693          	mv	a3,s8
    7f60:	000a0513          	mv	a0,s4
    7f64:	00098593          	mv	a1,s3
    7f68:	2bc020ef          	jal	a224 <__muldf3>
    7f6c:	00050613          	mv	a2,a0
    7f70:	00058693          	mv	a3,a1
    7f74:	00048513          	mv	a0,s1
    7f78:	00040593          	mv	a1,s0
    7f7c:	099020ef          	jal	a814 <__subdf3>
    7f80:	3fd337b7          	lui	a5,0x3fd33
    7f84:	33278793          	add	a5,a5,818 # 3fd33332 <_ebss+0x3fd1d282>
    7f88:	00050a13          	mv	s4,a0
    7f8c:	00058993          	mv	s3,a1
    7f90:	0727e063          	bltu	a5,s2,7ff0 <.L4>
    7f94:	00050613          	mv	a2,a0
    7f98:	00058693          	mv	a3,a1
    7f9c:	000b8513          	mv	a0,s7
    7fa0:	000b0593          	mv	a1,s6
    7fa4:	071020ef          	jal	a814 <__subdf3>
    7fa8:	00050613          	mv	a2,a0
    7fac:	00058693          	mv	a3,a1
    7fb0:	000aa503          	lw	a0,0(s5)
    7fb4:	004aa583          	lw	a1,4(s5)

00007fb8 <.L9>:
    7fb8:	05d020ef          	jal	a814 <__subdf3>

00007fbc <.L1>:
    7fbc:	02c12083          	lw	ra,44(sp)
    7fc0:	02812403          	lw	s0,40(sp)
    7fc4:	02412483          	lw	s1,36(sp)
    7fc8:	02012903          	lw	s2,32(sp)
    7fcc:	01c12983          	lw	s3,28(sp)
    7fd0:	01812a03          	lw	s4,24(sp)
    7fd4:	01412a83          	lw	s5,20(sp)
    7fd8:	01012b03          	lw	s6,16(sp)
    7fdc:	00c12b83          	lw	s7,12(sp)
    7fe0:	00812c03          	lw	s8,8(sp)
    7fe4:	00412c83          	lw	s9,4(sp)
    7fe8:	03010113          	add	sp,sp,48
    7fec:	00008067          	ret

00007ff0 <.L4>:
    7ff0:	3fe907b7          	lui	a5,0x3fe90
    7ff4:	0727e463          	bltu	a5,s2,805c <.L7>
    7ff8:	ffe007b7          	lui	a5,0xffe00
    7ffc:	00000713          	li	a4,0
    8000:	00f907b3          	add	a5,s2,a5
    8004:	00070413          	mv	s0,a4
    8008:	00078493          	mv	s1,a5

0000800c <.L5>:
    800c:	000aa503          	lw	a0,0(s5)
    8010:	004aa583          	lw	a1,4(s5)
    8014:	00040613          	mv	a2,s0
    8018:	00048693          	mv	a3,s1
    801c:	7f8020ef          	jal	a814 <__subdf3>
    8020:	00050a93          	mv	s5,a0
    8024:	00058913          	mv	s2,a1
    8028:	00040613          	mv	a2,s0
    802c:	00048693          	mv	a3,s1
    8030:	000b8513          	mv	a0,s7
    8034:	000b0593          	mv	a1,s6
    8038:	7dc020ef          	jal	a814 <__subdf3>
    803c:	000a0613          	mv	a2,s4
    8040:	00098693          	mv	a3,s3
    8044:	7d0020ef          	jal	a814 <__subdf3>
    8048:	00050613          	mv	a2,a0
    804c:	00058693          	mv	a3,a1
    8050:	000a8513          	mv	a0,s5
    8054:	00090593          	mv	a1,s2
    8058:	f61ff06f          	j	7fb8 <.L9>

0000805c <.L7>:
    805c:	0000a797          	auipc	a5,0xa
    8060:	24c78793          	add	a5,a5,588 # 122a8 <.LC0>
    8064:	0007a403          	lw	s0,0(a5)
    8068:	0047a483          	lw	s1,4(a5)
    806c:	fa1ff06f          	j	800c <.L5>

00008070 <.L6>:
    8070:	000aa503          	lw	a0,0(s5)
    8074:	004aa583          	lw	a1,4(s5)
    8078:	f45ff06f          	j	7fbc <.L1>

0000807c <__kernel_rem_pio2>:
    807c:	d6010113          	add	sp,sp,-672
    8080:	28912a23          	sw	s1,660(sp)
    8084:	00f12c23          	sw	a5,24(sp)
    8088:	00070493          	mv	s1,a4
    808c:	0000a797          	auipc	a5,0xa
    8090:	b8478793          	add	a5,a5,-1148 # 11c10 <init_jk>
    8094:	00271713          	sll	a4,a4,0x2
    8098:	00e787b3          	add	a5,a5,a4
    809c:	29212823          	sw	s2,656(sp)
    80a0:	29312623          	sw	s3,652(sp)
    80a4:	29512223          	sw	s5,644(sp)
    80a8:	27812c23          	sw	s8,632(sp)
    80ac:	28112e23          	sw	ra,668(sp)
    80b0:	0007ac03          	lw	s8,0(a5)
    80b4:	28812c23          	sw	s0,664(sp)
    80b8:	29412423          	sw	s4,648(sp)
    80bc:	29612023          	sw	s6,640(sp)
    80c0:	27712e23          	sw	s7,636(sp)
    80c4:	27912a23          	sw	s9,628(sp)
    80c8:	27a12823          	sw	s10,624(sp)
    80cc:	27b12623          	sw	s11,620(sp)
    80d0:	00a12a23          	sw	a0,20(sp)
    80d4:	fec00793          	li	a5,-20
    80d8:	00012423          	sw	zero,8(sp)
    80dc:	00058a93          	mv	s5,a1
    80e0:	00068913          	mv	s2,a3
    80e4:	fff68993          	add	s3,a3,-1 # 7fffffff <_ebss+0x7ffe9f4f>
    80e8:	00f64a63          	blt	a2,a5,80fc <.L2>
    80ec:	ffd60713          	add	a4,a2,-3
    80f0:	01800793          	li	a5,24
    80f4:	02f747b3          	div	a5,a4,a5
    80f8:	00f12423          	sw	a5,8(sp)

000080fc <.L2>:
    80fc:	00812783          	lw	a5,8(sp)
    8100:	013c0cb3          	add	s9,s8,s3
    8104:	00178413          	add	s0,a5,1
    8108:	fe800793          	li	a5,-24
    810c:	02f40433          	mul	s0,s0,a5
    8110:	00812783          	lw	a5,8(sp)
    8114:	41378bb3          	sub	s7,a5,s3
    8118:	08010793          	add	a5,sp,128
    811c:	00f12823          	sw	a5,16(sp)
    8120:	00078b13          	mv	s6,a5
    8124:	000b8a13          	mv	s4,s7
    8128:	00c40433          	add	s0,s0,a2

0000812c <.L3>:
    812c:	417a07b3          	sub	a5,s4,s7
    8130:	02fcda63          	bge	s9,a5,8164 <.L5>
    8134:	1c010d13          	add	s10,sp,448
    8138:	00090d93          	mv	s11,s2
    813c:	000d0793          	mv	a5,s10

00008140 <.L6>:
    8140:	412d8733          	sub	a4,s11,s2
    8144:	0aec4c63          	blt	s8,a4,81fc <.L8>
    8148:	01012703          	lw	a4,16(sp)
    814c:	003d9b93          	sll	s7,s11,0x3
    8150:	00000b13          	li	s6,0
    8154:	00eb8bb3          	add	s7,s7,a4
    8158:	00000a13          	li	s4,0
    815c:	00000c93          	li	s9,0
    8160:	0800006f          	j	81e0 <.L9>

00008164 <.L5>:
    8164:	00000513          	li	a0,0
    8168:	00000593          	li	a1,0
    816c:	000a4c63          	bltz	s4,8184 <.L4>
    8170:	01812703          	lw	a4,24(sp)
    8174:	002a1793          	sll	a5,s4,0x2
    8178:	00f707b3          	add	a5,a4,a5
    817c:	0007a503          	lw	a0,0(a5)
    8180:	6bd020ef          	jal	b03c <__floatsidf>

00008184 <.L4>:
    8184:	00ab2023          	sw	a0,0(s6)
    8188:	00bb2223          	sw	a1,4(s6)
    818c:	001a0a13          	add	s4,s4,1
    8190:	008b0b13          	add	s6,s6,8
    8194:	f99ff06f          	j	812c <.L3>

00008198 <.L7>:
    8198:	00f12e23          	sw	a5,28(sp)
    819c:	01412783          	lw	a5,20(sp)
    81a0:	003c9713          	sll	a4,s9,0x3
    81a4:	000ba603          	lw	a2,0(s7) # 10000 <.LBE193+0x4>
    81a8:	00e78733          	add	a4,a5,a4
    81ac:	004ba683          	lw	a3,4(s7)
    81b0:	00072503          	lw	a0,0(a4)
    81b4:	00472583          	lw	a1,4(a4)
    81b8:	001c8c93          	add	s9,s9,1
    81bc:	068020ef          	jal	a224 <__muldf3>
    81c0:	00050613          	mv	a2,a0
    81c4:	00058693          	mv	a3,a1
    81c8:	000b0513          	mv	a0,s6
    81cc:	000a0593          	mv	a1,s4
    81d0:	078010ef          	jal	9248 <__adddf3>
    81d4:	01c12783          	lw	a5,28(sp)
    81d8:	00050b13          	mv	s6,a0
    81dc:	00058a13          	mv	s4,a1

000081e0 <.L9>:
    81e0:	ff8b8b93          	add	s7,s7,-8
    81e4:	fb99dae3          	bge	s3,s9,8198 <.L7>
    81e8:	0167a023          	sw	s6,0(a5)
    81ec:	0147a223          	sw	s4,4(a5)
    81f0:	001d8d93          	add	s11,s11,1
    81f4:	00878793          	add	a5,a5,8
    81f8:	f49ff06f          	j	8140 <.L6>

000081fc <.L8>:
    81fc:	03010c93          	add	s9,sp,48
    8200:	002c1793          	sll	a5,s8,0x2
    8204:	00fc87b3          	add	a5,s9,a5
    8208:	00f12e23          	sw	a5,28(sp)
    820c:	000c0a13          	mv	s4,s8

00008210 <.L10>:
    8210:	003a1793          	sll	a5,s4,0x3
    8214:	03010713          	add	a4,sp,48
    8218:	23078793          	add	a5,a5,560
    821c:	00e787b3          	add	a5,a5,a4
    8220:	f607ab83          	lw	s7,-160(a5)
    8224:	f647ab03          	lw	s6,-156(a5)
    8228:	000c8d93          	mv	s11,s9
    822c:	000c8713          	mv	a4,s9
    8230:	000a0793          	mv	a5,s4

00008234 <.L11>:
    8234:	22f04063          	bgtz	a5,8454 <.L12>
    8238:	00040613          	mv	a2,s0
    823c:	000b8513          	mv	a0,s7
    8240:	000b0593          	mv	a1,s6
    8244:	555000ef          	jal	8f98 <__GI_scalbln>
    8248:	0000a797          	auipc	a5,0xa
    824c:	0a078793          	add	a5,a5,160 # 122e8 <.LC2>
    8250:	0007a603          	lw	a2,0(a5)
    8254:	0047a683          	lw	a3,4(a5)
    8258:	00050b93          	mv	s7,a0
    825c:	00058b13          	mv	s6,a1
    8260:	7c5010ef          	jal	a224 <__muldf3>
    8264:	371000ef          	jal	8dd4 <__GI_floor>
    8268:	0000a797          	auipc	a5,0xa
    826c:	08878793          	add	a5,a5,136 # 122f0 <.LC3>
    8270:	0007a603          	lw	a2,0(a5)
    8274:	0047a683          	lw	a3,4(a5)
    8278:	7ad010ef          	jal	a224 <__muldf3>
    827c:	00050613          	mv	a2,a0
    8280:	00058693          	mv	a3,a1
    8284:	000b8513          	mv	a0,s7
    8288:	000b0593          	mv	a1,s6
    828c:	588020ef          	jal	a814 <__subdf3>
    8290:	00058b13          	mv	s6,a1
    8294:	02a12023          	sw	a0,32(sp)
    8298:	525020ef          	jal	afbc <__fixdfsi>
    829c:	00050b93          	mv	s7,a0
    82a0:	59d020ef          	jal	b03c <__floatsidf>
    82a4:	02012783          	lw	a5,32(sp)
    82a8:	00050613          	mv	a2,a0
    82ac:	00058693          	mv	a3,a1
    82b0:	00078513          	mv	a0,a5
    82b4:	000b0593          	mv	a1,s6
    82b8:	55c020ef          	jal	a814 <__subdf3>
    82bc:	00050713          	mv	a4,a0
    82c0:	00058793          	mv	a5,a1
    82c4:	24805063          	blez	s0,8504 <.L13>
    82c8:	fffa0693          	add	a3,s4,-1
    82cc:	00269693          	sll	a3,a3,0x2
    82d0:	03010613          	add	a2,sp,48
    82d4:	23068693          	add	a3,a3,560
    82d8:	00c686b3          	add	a3,a3,a2
    82dc:	dd06ab03          	lw	s6,-560(a3)
    82e0:	01800593          	li	a1,24
    82e4:	408585b3          	sub	a1,a1,s0
    82e8:	40bb5633          	sra	a2,s6,a1
    82ec:	00cb8bb3          	add	s7,s7,a2
    82f0:	00b61633          	sll	a2,a2,a1
    82f4:	40cb0b33          	sub	s6,s6,a2
    82f8:	dd66a823          	sw	s6,-560(a3)
    82fc:	01700693          	li	a3,23
    8300:	408686b3          	sub	a3,a3,s0
    8304:	40db5b33          	sra	s6,s6,a3

00008308 <.L14>:
    8308:	09605e63          	blez	s6,83a4 <.L17>

0000830c <.L16>:
    830c:	001b8b93          	add	s7,s7,1
    8310:	00000613          	li	a2,0
    8314:	00000813          	li	a6,0

00008318 <.L18>:
    8318:	25464263          	blt	a2,s4,855c <.L22>
    831c:	00805a63          	blez	s0,8330 <.L23>
    8320:	00100693          	li	a3,1
    8324:	26d40863          	beq	s0,a3,8594 <.L24>
    8328:	00200693          	li	a3,2
    832c:	28d40863          	beq	s0,a3,85bc <.L25>

00008330 <.L23>:
    8330:	00200693          	li	a3,2
    8334:	06db1863          	bne	s6,a3,83a4 <.L17>
    8338:	0000ad97          	auipc	s11,0xa
    833c:	eb0d8d93          	add	s11,s11,-336 # 121e8 <.LC1>
    8340:	000da503          	lw	a0,0(s11)
    8344:	004da583          	lw	a1,4(s11)
    8348:	00070613          	mv	a2,a4
    834c:	00078693          	mv	a3,a5
    8350:	03012023          	sw	a6,32(sp)
    8354:	4c0020ef          	jal	a814 <__subdf3>
    8358:	02012803          	lw	a6,32(sp)
    835c:	00050713          	mv	a4,a0
    8360:	00058793          	mv	a5,a1
    8364:	04080063          	beqz	a6,83a4 <.L17>
    8368:	02b12223          	sw	a1,36(sp)
    836c:	02a12023          	sw	a0,32(sp)
    8370:	004da583          	lw	a1,4(s11)
    8374:	000da503          	lw	a0,0(s11)
    8378:	00040613          	mv	a2,s0
    837c:	41d000ef          	jal	8f98 <__GI_scalbln>
    8380:	02012703          	lw	a4,32(sp)
    8384:	02412783          	lw	a5,36(sp)
    8388:	00050613          	mv	a2,a0
    838c:	00058693          	mv	a3,a1
    8390:	00070513          	mv	a0,a4
    8394:	00078593          	mv	a1,a5
    8398:	47c020ef          	jal	a814 <__subdf3>
    839c:	00050713          	mv	a4,a0
    83a0:	00058793          	mv	a5,a1

000083a4 <.L17>:
    83a4:	00070513          	mv	a0,a4
    83a8:	00078593          	mv	a1,a5
    83ac:	00000613          	li	a2,0
    83b0:	00000693          	li	a3,0
    83b4:	02e12223          	sw	a4,36(sp)
    83b8:	02f12023          	sw	a5,32(sp)
    83bc:	501010ef          	jal	a0bc <__eqdf2>
    83c0:	02012783          	lw	a5,32(sp)
    83c4:	02412703          	lw	a4,36(sp)
    83c8:	32051263          	bnez	a0,86ec <.L89>
    83cc:	fffa0793          	add	a5,s4,-1
    83d0:	00000713          	li	a4,0
    83d4:	00078613          	mv	a2,a5

000083d8 <.L28>:
    83d8:	2187d463          	bge	a5,s8,85e0 <.L29>
    83dc:	28070e63          	beqz	a4,8678 <.L70>
    83e0:	00060a13          	mv	s4,a2

000083e4 <.L95>:
    83e4:	002a1793          	sll	a5,s4,0x2
    83e8:	00fc87b3          	add	a5,s9,a5
    83ec:	0007a783          	lw	a5,0(a5)
    83f0:	fe840413          	add	s0,s0,-24
    83f4:	2e078863          	beqz	a5,86e4 <.L38>

000083f8 <.L39>:
    83f8:	0000a797          	auipc	a5,0xa
    83fc:	df078793          	add	a5,a5,-528 # 121e8 <.LC1>
    8400:	0007a503          	lw	a0,0(a5)
    8404:	0047a583          	lw	a1,4(a5)
    8408:	00040613          	mv	a2,s0
    840c:	000a0d93          	mv	s11,s4
    8410:	389000ef          	jal	8f98 <__GI_scalbln>
    8414:	00050413          	mv	s0,a0
    8418:	00058913          	mv	s2,a1
    841c:	0000a997          	auipc	s3,0xa
    8420:	ec498993          	add	s3,s3,-316 # 122e0 <.LC0>

00008424 <.L42>:
    8424:	3a0dd663          	bgez	s11,87d0 <.L43>
    8428:	000a0913          	mv	s2,s4

0000842c <.L44>:
    842c:	46094863          	bltz	s2,889c <.L47>
    8430:	00391d93          	sll	s11,s2,0x3
    8434:	00009717          	auipc	a4,0x9
    8438:	7ec70713          	add	a4,a4,2028 # 11c20 <PIo2>
    843c:	01ad8db3          	add	s11,s11,s10
    8440:	00000c93          	li	s9,0
    8444:	00000993          	li	s3,0
    8448:	00000793          	li	a5,0
    844c:	412a0433          	sub	s0,s4,s2
    8450:	4240006f          	j	8874 <.L48>

00008454 <.L12>:
    8454:	02f12023          	sw	a5,32(sp)
    8458:	0000a797          	auipc	a5,0xa
    845c:	e8878793          	add	a5,a5,-376 # 122e0 <.LC0>
    8460:	0007a603          	lw	a2,0(a5)
    8464:	0047a683          	lw	a3,4(a5)
    8468:	000b8513          	mv	a0,s7
    846c:	000b0593          	mv	a1,s6
    8470:	02e12223          	sw	a4,36(sp)
    8474:	5b1010ef          	jal	a224 <__muldf3>
    8478:	345020ef          	jal	afbc <__fixdfsi>
    847c:	3c1020ef          	jal	b03c <__floatsidf>
    8480:	0000a797          	auipc	a5,0xa
    8484:	e2078793          	add	a5,a5,-480 # 122a0 <.LC1>
    8488:	0007a603          	lw	a2,0(a5)
    848c:	0047a683          	lw	a3,4(a5)
    8490:	02a12623          	sw	a0,44(sp)
    8494:	02b12423          	sw	a1,40(sp)
    8498:	58d010ef          	jal	a224 <__muldf3>
    849c:	00050613          	mv	a2,a0
    84a0:	00058693          	mv	a3,a1
    84a4:	000b8513          	mv	a0,s7
    84a8:	000b0593          	mv	a1,s6
    84ac:	368020ef          	jal	a814 <__subdf3>
    84b0:	30d020ef          	jal	afbc <__fixdfsi>
    84b4:	02012783          	lw	a5,32(sp)
    84b8:	02412703          	lw	a4,36(sp)
    84bc:	02c12883          	lw	a7,44(sp)
    84c0:	fff78793          	add	a5,a5,-1
    84c4:	00379693          	sll	a3,a5,0x3
    84c8:	02812803          	lw	a6,40(sp)
    84cc:	00dd06b3          	add	a3,s10,a3
    84d0:	0006a603          	lw	a2,0(a3)
    84d4:	0046a683          	lw	a3,4(a3)
    84d8:	00a72023          	sw	a0,0(a4)
    84dc:	00080593          	mv	a1,a6
    84e0:	00088513          	mv	a0,a7
    84e4:	02f12023          	sw	a5,32(sp)
    84e8:	561000ef          	jal	9248 <__adddf3>
    84ec:	02412703          	lw	a4,36(sp)
    84f0:	02012783          	lw	a5,32(sp)
    84f4:	00050b93          	mv	s7,a0
    84f8:	00058b13          	mv	s6,a1
    84fc:	00470713          	add	a4,a4,4
    8500:	d35ff06f          	j	8234 <.L11>

00008504 <.L13>:
    8504:	02041263          	bnez	s0,8528 <.L15>
    8508:	fffa0693          	add	a3,s4,-1
    850c:	00269693          	sll	a3,a3,0x2
    8510:	23068693          	add	a3,a3,560
    8514:	03010613          	add	a2,sp,48
    8518:	00c686b3          	add	a3,a3,a2
    851c:	dd06ab03          	lw	s6,-560(a3)
    8520:	417b5b13          	sra	s6,s6,0x17
    8524:	de5ff06f          	j	8308 <.L14>

00008528 <.L15>:
    8528:	0000a697          	auipc	a3,0xa
    852c:	d6068693          	add	a3,a3,-672 # 12288 <.LC2>
    8530:	0006a603          	lw	a2,0(a3)
    8534:	0046a683          	lw	a3,4(a3)
    8538:	02b12223          	sw	a1,36(sp)
    853c:	02a12023          	sw	a0,32(sp)
    8540:	409010ef          	jal	a148 <__gedf2>
    8544:	02012703          	lw	a4,32(sp)
    8548:	02412783          	lw	a5,36(sp)
    854c:	00000b13          	li	s6,0
    8550:	e4054ae3          	bltz	a0,83a4 <.L17>
    8554:	00200b13          	li	s6,2
    8558:	db5ff06f          	j	830c <.L16>

0000855c <.L22>:
    855c:	000da683          	lw	a3,0(s11)
    8560:	00081e63          	bnez	a6,857c <.L19>
    8564:	010005b7          	lui	a1,0x1000
    8568:	00069e63          	bnez	a3,8584 <.L93>

0000856c <.L20>:
    856c:	00160613          	add	a2,a2,1
    8570:	004d8d93          	add	s11,s11,4
    8574:	00068813          	mv	a6,a3
    8578:	da1ff06f          	j	8318 <.L18>

0000857c <.L19>:
    857c:	010005b7          	lui	a1,0x1000
    8580:	fff58593          	add	a1,a1,-1 # ffffff <_ebss+0xfe9f4f>

00008584 <.L93>:
    8584:	40d586b3          	sub	a3,a1,a3
    8588:	00dda023          	sw	a3,0(s11)
    858c:	00100693          	li	a3,1
    8590:	fddff06f          	j	856c <.L20>

00008594 <.L24>:
    8594:	fffa0693          	add	a3,s4,-1
    8598:	00269693          	sll	a3,a3,0x2
    859c:	03010613          	add	a2,sp,48
    85a0:	23068693          	add	a3,a3,560
    85a4:	00c686b3          	add	a3,a3,a2
    85a8:	dd06a603          	lw	a2,-560(a3)
    85ac:	00961613          	sll	a2,a2,0x9
    85b0:	00965613          	srl	a2,a2,0x9

000085b4 <.L94>:
    85b4:	dcc6a823          	sw	a2,-560(a3)
    85b8:	d79ff06f          	j	8330 <.L23>

000085bc <.L25>:
    85bc:	fffa0693          	add	a3,s4,-1
    85c0:	00269693          	sll	a3,a3,0x2
    85c4:	03010613          	add	a2,sp,48
    85c8:	23068693          	add	a3,a3,560
    85cc:	00c686b3          	add	a3,a3,a2
    85d0:	dd06a603          	lw	a2,-560(a3)
    85d4:	00a61613          	sll	a2,a2,0xa
    85d8:	00a65613          	srl	a2,a2,0xa
    85dc:	fd9ff06f          	j	85b4 <.L94>

000085e0 <.L29>:
    85e0:	00279693          	sll	a3,a5,0x2
    85e4:	00dc86b3          	add	a3,s9,a3
    85e8:	0006a683          	lw	a3,0(a3)
    85ec:	fff78793          	add	a5,a5,-1
    85f0:	00d76733          	or	a4,a4,a3
    85f4:	de5ff06f          	j	83d8 <.L28>

000085f8 <.L32>:
    85f8:	00178793          	add	a5,a5,1

000085fc <.L30>:
    85fc:	ffc72683          	lw	a3,-4(a4)
    8600:	ffc70713          	add	a4,a4,-4
    8604:	fe068ae3          	beqz	a3,85f8 <.L32>
    8608:	01012703          	lw	a4,16(sp)
    860c:	012a0bb3          	add	s7,s4,s2
    8610:	003b9b93          	sll	s7,s7,0x3
    8614:	001a0d93          	add	s11,s4,1
    8618:	01770bb3          	add	s7,a4,s7
    861c:	00fa0a33          	add	s4,s4,a5

00008620 <.L33>:
    8620:	bfba48e3          	blt	s4,s11,8210 <.L10>
    8624:	00812783          	lw	a5,8(sp)
    8628:	01812703          	lw	a4,24(sp)
    862c:	00000b13          	li	s6,0
    8630:	01b787b3          	add	a5,a5,s11
    8634:	00279793          	sll	a5,a5,0x2
    8638:	00f707b3          	add	a5,a4,a5
    863c:	0007a503          	lw	a0,0(a5)
    8640:	1fd020ef          	jal	b03c <__floatsidf>
    8644:	00aba023          	sw	a0,0(s7)
    8648:	00bba223          	sw	a1,4(s7)
    864c:	000b8813          	mv	a6,s7
    8650:	00000713          	li	a4,0
    8654:	00000793          	li	a5,0

00008658 <.L34>:
    8658:	0369d663          	bge	s3,s6,8684 <.L35>
    865c:	003d9693          	sll	a3,s11,0x3
    8660:	00dd06b3          	add	a3,s10,a3
    8664:	00e6a023          	sw	a4,0(a3)
    8668:	00f6a223          	sw	a5,4(a3)
    866c:	001d8d93          	add	s11,s11,1
    8670:	008b8b93          	add	s7,s7,8
    8674:	fadff06f          	j	8620 <.L33>

00008678 <.L70>:
    8678:	01c12703          	lw	a4,28(sp)
    867c:	00100793          	li	a5,1
    8680:	f7dff06f          	j	85fc <.L30>

00008684 <.L35>:
    8684:	02f12423          	sw	a5,40(sp)
    8688:	01412783          	lw	a5,20(sp)
    868c:	003b1593          	sll	a1,s6,0x3
    8690:	00082603          	lw	a2,0(a6)
    8694:	00b785b3          	add	a1,a5,a1
    8698:	00482683          	lw	a3,4(a6)
    869c:	0005a503          	lw	a0,0(a1)
    86a0:	0045a583          	lw	a1,4(a1)
    86a4:	03012023          	sw	a6,32(sp)
    86a8:	02e12223          	sw	a4,36(sp)
    86ac:	379010ef          	jal	a224 <__muldf3>
    86b0:	02412703          	lw	a4,36(sp)
    86b4:	02812783          	lw	a5,40(sp)
    86b8:	00050613          	mv	a2,a0
    86bc:	00058693          	mv	a3,a1
    86c0:	00070513          	mv	a0,a4
    86c4:	00078593          	mv	a1,a5
    86c8:	381000ef          	jal	9248 <__adddf3>
    86cc:	02012803          	lw	a6,32(sp)
    86d0:	00050713          	mv	a4,a0
    86d4:	00058793          	mv	a5,a1
    86d8:	001b0b13          	add	s6,s6,1
    86dc:	ff880813          	add	a6,a6,-8
    86e0:	f79ff06f          	j	8658 <.L34>

000086e4 <.L38>:
    86e4:	fffa0a13          	add	s4,s4,-1
    86e8:	cfdff06f          	j	83e4 <.L95>

000086ec <.L89>:
    86ec:	40800633          	neg	a2,s0
    86f0:	00070513          	mv	a0,a4
    86f4:	00078593          	mv	a1,a5
    86f8:	0a1000ef          	jal	8f98 <__GI_scalbln>
    86fc:	0000a697          	auipc	a3,0xa
    8700:	ba468693          	add	a3,a3,-1116 # 122a0 <.LC1>
    8704:	0006a783          	lw	a5,0(a3)
    8708:	0046a803          	lw	a6,4(a3)
    870c:	00050993          	mv	s3,a0
    8710:	00078613          	mv	a2,a5
    8714:	00080693          	mv	a3,a6
    8718:	00058913          	mv	s2,a1
    871c:	00f12423          	sw	a5,8(sp)
    8720:	01012623          	sw	a6,12(sp)
    8724:	225010ef          	jal	a148 <__gedf2>
    8728:	002a1d93          	sll	s11,s4,0x2
    872c:	08054263          	bltz	a0,87b0 <.L91>
    8730:	0000a697          	auipc	a3,0xa
    8734:	bb068693          	add	a3,a3,-1104 # 122e0 <.LC0>
    8738:	0006a603          	lw	a2,0(a3)
    873c:	0046a683          	lw	a3,4(a3)
    8740:	00098513          	mv	a0,s3
    8744:	00090593          	mv	a1,s2
    8748:	2dd010ef          	jal	a224 <__muldf3>
    874c:	071020ef          	jal	afbc <__fixdfsi>
    8750:	230d8793          	add	a5,s11,560
    8754:	03010713          	add	a4,sp,48
    8758:	00e78db3          	add	s11,a5,a4
    875c:	00a12823          	sw	a0,16(sp)
    8760:	0dd020ef          	jal	b03c <__floatsidf>
    8764:	00812603          	lw	a2,8(sp)
    8768:	00c12683          	lw	a3,12(sp)
    876c:	001a0a13          	add	s4,s4,1
    8770:	01840413          	add	s0,s0,24
    8774:	2b1010ef          	jal	a224 <__muldf3>
    8778:	00050613          	mv	a2,a0
    877c:	00058693          	mv	a3,a1
    8780:	00098513          	mv	a0,s3
    8784:	00090593          	mv	a1,s2
    8788:	08c020ef          	jal	a814 <__subdf3>
    878c:	031020ef          	jal	afbc <__fixdfsi>
    8790:	01012803          	lw	a6,16(sp)
    8794:	002a1793          	sll	a5,s4,0x2
    8798:	23078793          	add	a5,a5,560
    879c:	03010713          	add	a4,sp,48
    87a0:	dcada823          	sw	a0,-560(s11)
    87a4:	00e787b3          	add	a5,a5,a4
    87a8:	dd07a823          	sw	a6,-560(a5)
    87ac:	c4dff06f          	j	83f8 <.L39>

000087b0 <.L91>:
    87b0:	230d8793          	add	a5,s11,560
    87b4:	03010713          	add	a4,sp,48
    87b8:	00098513          	mv	a0,s3
    87bc:	00090593          	mv	a1,s2
    87c0:	00e78db3          	add	s11,a5,a4
    87c4:	7f8020ef          	jal	afbc <__fixdfsi>
    87c8:	dcada823          	sw	a0,-560(s11)
    87cc:	c2dff06f          	j	83f8 <.L39>

000087d0 <.L43>:
    87d0:	002d9713          	sll	a4,s11,0x2
    87d4:	00ec8733          	add	a4,s9,a4
    87d8:	00072503          	lw	a0,0(a4)
    87dc:	003d9793          	sll	a5,s11,0x3
    87e0:	00fd07b3          	add	a5,s10,a5
    87e4:	00f12423          	sw	a5,8(sp)
    87e8:	055020ef          	jal	b03c <__floatsidf>
    87ec:	00040613          	mv	a2,s0
    87f0:	00090693          	mv	a3,s2
    87f4:	231010ef          	jal	a224 <__muldf3>
    87f8:	00812783          	lw	a5,8(sp)
    87fc:	0009a603          	lw	a2,0(s3)
    8800:	0049a683          	lw	a3,4(s3)
    8804:	00a7a023          	sw	a0,0(a5)
    8808:	00b7a223          	sw	a1,4(a5)
    880c:	00040513          	mv	a0,s0
    8810:	00090593          	mv	a1,s2
    8814:	211010ef          	jal	a224 <__muldf3>
    8818:	00050413          	mv	s0,a0
    881c:	00058913          	mv	s2,a1
    8820:	fffd8d93          	add	s11,s11,-1
    8824:	c01ff06f          	j	8424 <.L42>

00008828 <.L46>:
    8828:	000da603          	lw	a2,0(s11)
    882c:	004da683          	lw	a3,4(s11)
    8830:	00072503          	lw	a0,0(a4)
    8834:	00472583          	lw	a1,4(a4)
    8838:	00f12823          	sw	a5,16(sp)
    883c:	00e12423          	sw	a4,8(sp)
    8840:	1e5010ef          	jal	a224 <__muldf3>
    8844:	00050613          	mv	a2,a0
    8848:	00058693          	mv	a3,a1
    884c:	000c8513          	mv	a0,s9
    8850:	00098593          	mv	a1,s3
    8854:	1f5000ef          	jal	9248 <__adddf3>
    8858:	01012783          	lw	a5,16(sp)
    885c:	00812703          	lw	a4,8(sp)
    8860:	00050c93          	mv	s9,a0
    8864:	00058993          	mv	s3,a1
    8868:	00178793          	add	a5,a5,1
    886c:	00870713          	add	a4,a4,8
    8870:	008d8d93          	add	s11,s11,8

00008874 <.L48>:
    8874:	00fc4463          	blt	s8,a5,887c <.L45>
    8878:	faf458e3          	bge	s0,a5,8828 <.L46>

0000887c <.L45>:
    887c:	00341413          	sll	s0,s0,0x3
    8880:	23040793          	add	a5,s0,560
    8884:	03010713          	add	a4,sp,48
    8888:	00e78433          	add	s0,a5,a4
    888c:	ed942023          	sw	s9,-320(s0)
    8890:	ed342223          	sw	s3,-316(s0)
    8894:	fff90913          	add	s2,s2,-1
    8898:	b95ff06f          	j	842c <.L44>

0000889c <.L47>:
    889c:	00200793          	li	a5,2
    88a0:	0497c663          	blt	a5,s1,88ec <.L49>
    88a4:	16904863          	bgtz	s1,8a14 <.L71>
    88a8:	0e048863          	beqz	s1,8998 <.L72>

000088ac <.L52>:
    88ac:	29c12083          	lw	ra,668(sp)
    88b0:	29812403          	lw	s0,664(sp)
    88b4:	29412483          	lw	s1,660(sp)
    88b8:	29012903          	lw	s2,656(sp)
    88bc:	28c12983          	lw	s3,652(sp)
    88c0:	28812a03          	lw	s4,648(sp)
    88c4:	28412a83          	lw	s5,644(sp)
    88c8:	28012b03          	lw	s6,640(sp)
    88cc:	27812c03          	lw	s8,632(sp)
    88d0:	27412c83          	lw	s9,628(sp)
    88d4:	27012d03          	lw	s10,624(sp)
    88d8:	26c12d83          	lw	s11,620(sp)
    88dc:	007bf513          	and	a0,s7,7
    88e0:	27c12b83          	lw	s7,636(sp)
    88e4:	2a010113          	add	sp,sp,672
    88e8:	00008067          	ret

000088ec <.L49>:
    88ec:	00300793          	li	a5,3
    88f0:	faf49ee3          	bne	s1,a5,88ac <.L52>
    88f4:	12010c93          	add	s9,sp,288
    88f8:	003a1c13          	sll	s8,s4,0x3
    88fc:	018c8c33          	add	s8,s9,s8
    8900:	000c0d13          	mv	s10,s8
    8904:	000a0413          	mv	s0,s4

00008908 <.L53>:
    8908:	ff8d0d13          	add	s10,s10,-8
    890c:	12804863          	bgtz	s0,8a3c <.L61>
    8910:	000a0493          	mv	s1,s4
    8914:	00100413          	li	s0,1

00008918 <.L62>:
    8918:	ff8c0c13          	add	s8,s8,-8
    891c:	18944663          	blt	s0,s1,8aa8 <.L63>
    8920:	00000513          	li	a0,0
    8924:	00000593          	li	a1,0
    8928:	00100413          	li	s0,1

0000892c <.L64>:
    892c:	1f444463          	blt	s0,s4,8b14 <.L65>
    8930:	12012783          	lw	a5,288(sp)
    8934:	12412683          	lw	a3,292(sp)
    8938:	12812603          	lw	a2,296(sp)
    893c:	12c12703          	lw	a4,300(sp)
    8940:	1e0b1863          	bnez	s6,8b30 <.L66>
    8944:	00faa023          	sw	a5,0(s5)
    8948:	00daa223          	sw	a3,4(s5)
    894c:	00caa423          	sw	a2,8(s5)
    8950:	00eaa623          	sw	a4,12(s5)
    8954:	00058793          	mv	a5,a1
    8958:	00aaa823          	sw	a0,16(s5)

0000895c <.L96>:
    895c:	00faaa23          	sw	a5,20(s5)
    8960:	f4dff06f          	j	88ac <.L52>

00008964 <.L54>:
    8964:	003a1793          	sll	a5,s4,0x3
    8968:	00f407b3          	add	a5,s0,a5
    896c:	0007a603          	lw	a2,0(a5)
    8970:	0047a683          	lw	a3,4(a5)
    8974:	fffa0a13          	add	s4,s4,-1
    8978:	0d1000ef          	jal	9248 <__adddf3>

0000897c <.L51>:
    897c:	fe0a54e3          	bgez	s4,8964 <.L54>
    8980:	000b0663          	beqz	s6,898c <.L55>
    8984:	800007b7          	lui	a5,0x80000
    8988:	00b7c5b3          	xor	a1,a5,a1

0000898c <.L55>:
    898c:	00aaa023          	sw	a0,0(s5)
    8990:	00baa223          	sw	a1,4(s5)
    8994:	f19ff06f          	j	88ac <.L52>

00008998 <.L72>:
    8998:	00000513          	li	a0,0
    899c:	00000593          	li	a1,0
    89a0:	12010413          	add	s0,sp,288
    89a4:	fd9ff06f          	j	897c <.L51>

000089a8 <.L56>:
    89a8:	00349793          	sll	a5,s1,0x3
    89ac:	00f407b3          	add	a5,s0,a5
    89b0:	0007a603          	lw	a2,0(a5) # 80000000 <_ebss+0x7ffe9f50>
    89b4:	0047a683          	lw	a3,4(a5)
    89b8:	fff48493          	add	s1,s1,-1
    89bc:	08d000ef          	jal	9248 <__adddf3>

000089c0 <.L50>:
    89c0:	fe04d4e3          	bgez	s1,89a8 <.L56>
    89c4:	00058793          	mv	a5,a1
    89c8:	000b0663          	beqz	s6,89d4 <.L57>
    89cc:	800007b7          	lui	a5,0x80000
    89d0:	00b7c7b3          	xor	a5,a5,a1

000089d4 <.L57>:
    89d4:	00aaa023          	sw	a0,0(s5)
    89d8:	00050613          	mv	a2,a0
    89dc:	00058693          	mv	a3,a1
    89e0:	12012503          	lw	a0,288(sp)
    89e4:	12412583          	lw	a1,292(sp)
    89e8:	00faa223          	sw	a5,4(s5)
    89ec:	00100493          	li	s1,1
    89f0:	625010ef          	jal	a814 <__subdf3>

000089f4 <.L58>:
    89f4:	00840413          	add	s0,s0,8
    89f8:	029a5863          	bge	s4,s1,8a28 <.L59>
    89fc:	000b0663          	beqz	s6,8a08 <.L60>
    8a00:	800007b7          	lui	a5,0x80000
    8a04:	00b7c5b3          	xor	a1,a5,a1

00008a08 <.L60>:
    8a08:	00aaa423          	sw	a0,8(s5)
    8a0c:	00baa623          	sw	a1,12(s5)
    8a10:	e9dff06f          	j	88ac <.L52>

00008a14 <.L71>:
    8a14:	000a0493          	mv	s1,s4
    8a18:	00000513          	li	a0,0
    8a1c:	00000593          	li	a1,0
    8a20:	12010413          	add	s0,sp,288
    8a24:	f9dff06f          	j	89c0 <.L50>

00008a28 <.L59>:
    8a28:	00042603          	lw	a2,0(s0)
    8a2c:	00442683          	lw	a3,4(s0)
    8a30:	00148493          	add	s1,s1,1
    8a34:	015000ef          	jal	9248 <__adddf3>
    8a38:	fbdff06f          	j	89f4 <.L58>

00008a3c <.L61>:
    8a3c:	008d2783          	lw	a5,8(s10)
    8a40:	00cd2803          	lw	a6,12(s10)
    8a44:	000d2903          	lw	s2,0(s10)
    8a48:	004d2983          	lw	s3,4(s10)
    8a4c:	00078613          	mv	a2,a5
    8a50:	00080693          	mv	a3,a6
    8a54:	00090513          	mv	a0,s2
    8a58:	00098593          	mv	a1,s3
    8a5c:	00f12423          	sw	a5,8(sp)
    8a60:	01012623          	sw	a6,12(sp)
    8a64:	7e4000ef          	jal	9248 <__adddf3>
    8a68:	00050613          	mv	a2,a0
    8a6c:	00058693          	mv	a3,a1
    8a70:	00050493          	mv	s1,a0
    8a74:	00058d93          	mv	s11,a1
    8a78:	00090513          	mv	a0,s2
    8a7c:	00098593          	mv	a1,s3
    8a80:	595010ef          	jal	a814 <__subdf3>
    8a84:	00812603          	lw	a2,8(sp)
    8a88:	00c12683          	lw	a3,12(sp)
    8a8c:	fff40413          	add	s0,s0,-1
    8a90:	7b8000ef          	jal	9248 <__adddf3>
    8a94:	00ad2423          	sw	a0,8(s10)
    8a98:	00bd2623          	sw	a1,12(s10)
    8a9c:	009d2023          	sw	s1,0(s10)
    8aa0:	01bd2223          	sw	s11,4(s10)
    8aa4:	e65ff06f          	j	8908 <.L53>

00008aa8 <.L63>:
    8aa8:	008c2783          	lw	a5,8(s8)
    8aac:	00cc2803          	lw	a6,12(s8)
    8ab0:	000c2903          	lw	s2,0(s8)
    8ab4:	004c2983          	lw	s3,4(s8)
    8ab8:	00078613          	mv	a2,a5
    8abc:	00080693          	mv	a3,a6
    8ac0:	00090513          	mv	a0,s2
    8ac4:	00098593          	mv	a1,s3
    8ac8:	00f12423          	sw	a5,8(sp)
    8acc:	01012623          	sw	a6,12(sp)
    8ad0:	778000ef          	jal	9248 <__adddf3>
    8ad4:	00050613          	mv	a2,a0
    8ad8:	00058693          	mv	a3,a1
    8adc:	00050d93          	mv	s11,a0
    8ae0:	00058d13          	mv	s10,a1
    8ae4:	00090513          	mv	a0,s2
    8ae8:	00098593          	mv	a1,s3
    8aec:	529010ef          	jal	a814 <__subdf3>
    8af0:	00812603          	lw	a2,8(sp)
    8af4:	00c12683          	lw	a3,12(sp)
    8af8:	fff48493          	add	s1,s1,-1
    8afc:	74c000ef          	jal	9248 <__adddf3>
    8b00:	00ac2423          	sw	a0,8(s8)
    8b04:	00bc2623          	sw	a1,12(s8)
    8b08:	01bc2023          	sw	s11,0(s8)
    8b0c:	01ac2223          	sw	s10,4(s8)
    8b10:	e09ff06f          	j	8918 <.L62>

00008b14 <.L65>:
    8b14:	003a1793          	sll	a5,s4,0x3
    8b18:	00fc87b3          	add	a5,s9,a5
    8b1c:	0007a603          	lw	a2,0(a5) # 80000000 <_ebss+0x7ffe9f50>
    8b20:	0047a683          	lw	a3,4(a5)
    8b24:	fffa0a13          	add	s4,s4,-1
    8b28:	720000ef          	jal	9248 <__adddf3>
    8b2c:	e01ff06f          	j	892c <.L64>

00008b30 <.L66>:
    8b30:	00faa023          	sw	a5,0(s5)
    8b34:	800007b7          	lui	a5,0x80000
    8b38:	00d7c6b3          	xor	a3,a5,a3
    8b3c:	00e7c733          	xor	a4,a5,a4
    8b40:	00daa223          	sw	a3,4(s5)
    8b44:	00caa423          	sw	a2,8(s5)
    8b48:	00eaa623          	sw	a4,12(s5)
    8b4c:	00aaa823          	sw	a0,16(s5)
    8b50:	00b7c7b3          	xor	a5,a5,a1
    8b54:	e09ff06f          	j	895c <.L96>

00008b58 <__kernel_sin>:
    8b58:	fb010113          	add	sp,sp,-80
    8b5c:	00159793          	sll	a5,a1,0x1
    8b60:	04812423          	sw	s0,72(sp)
    8b64:	04912223          	sw	s1,68(sp)
    8b68:	03612823          	sw	s6,48(sp)
    8b6c:	03712623          	sw	s7,44(sp)
    8b70:	03a12023          	sw	s10,32(sp)
    8b74:	04112623          	sw	ra,76(sp)
    8b78:	00070d13          	mv	s10,a4
    8b7c:	05212023          	sw	s2,64(sp)
    8b80:	03312e23          	sw	s3,60(sp)
    8b84:	03412c23          	sw	s4,56(sp)
    8b88:	03512a23          	sw	s5,52(sp)
    8b8c:	03812423          	sw	s8,40(sp)
    8b90:	03912223          	sw	s9,36(sp)
    8b94:	01b12e23          	sw	s11,28(sp)
    8b98:	0017d793          	srl	a5,a5,0x1
    8b9c:	3e400737          	lui	a4,0x3e400
    8ba0:	00050493          	mv	s1,a0
    8ba4:	00058413          	mv	s0,a1
    8ba8:	00060b93          	mv	s7,a2
    8bac:	00068b13          	mv	s6,a3
    8bb0:	00e7f663          	bgeu	a5,a4,8bbc <.L2>
    8bb4:	408020ef          	jal	afbc <__fixdfsi>
    8bb8:	12050463          	beqz	a0,8ce0 <.L3>

00008bbc <.L2>:
    8bbc:	00048613          	mv	a2,s1
    8bc0:	00040693          	mv	a3,s0
    8bc4:	00048513          	mv	a0,s1
    8bc8:	00040593          	mv	a1,s0
    8bcc:	658010ef          	jal	a224 <__muldf3>
    8bd0:	00050993          	mv	s3,a0
    8bd4:	00058913          	mv	s2,a1
    8bd8:	00050613          	mv	a2,a0
    8bdc:	00058693          	mv	a3,a1
    8be0:	00048513          	mv	a0,s1
    8be4:	00040593          	mv	a1,s0
    8be8:	63c010ef          	jal	a224 <__muldf3>
    8bec:	00009797          	auipc	a5,0x9
    8bf0:	70c78793          	add	a5,a5,1804 # 122f8 <.LC0>
    8bf4:	0007a603          	lw	a2,0(a5)
    8bf8:	0047a683          	lw	a3,4(a5)
    8bfc:	00050a93          	mv	s5,a0
    8c00:	00058a13          	mv	s4,a1
    8c04:	00098513          	mv	a0,s3
    8c08:	00090593          	mv	a1,s2
    8c0c:	618010ef          	jal	a224 <__muldf3>
    8c10:	00009797          	auipc	a5,0x9
    8c14:	6f078793          	add	a5,a5,1776 # 12300 <.LC1>
    8c18:	0007a603          	lw	a2,0(a5)
    8c1c:	0047a683          	lw	a3,4(a5)
    8c20:	00009d97          	auipc	s11,0x9
    8c24:	700d8d93          	add	s11,s11,1792 # 12320 <.LC5>
    8c28:	3ed010ef          	jal	a814 <__subdf3>
    8c2c:	00098613          	mv	a2,s3
    8c30:	00090693          	mv	a3,s2
    8c34:	5f0010ef          	jal	a224 <__muldf3>
    8c38:	00009797          	auipc	a5,0x9
    8c3c:	6d078793          	add	a5,a5,1744 # 12308 <.LC2>
    8c40:	0007a603          	lw	a2,0(a5)
    8c44:	0047a683          	lw	a3,4(a5)
    8c48:	600000ef          	jal	9248 <__adddf3>
    8c4c:	00098613          	mv	a2,s3
    8c50:	00090693          	mv	a3,s2
    8c54:	5d0010ef          	jal	a224 <__muldf3>
    8c58:	00009797          	auipc	a5,0x9
    8c5c:	6b878793          	add	a5,a5,1720 # 12310 <.LC3>
    8c60:	0007a603          	lw	a2,0(a5)
    8c64:	0047a683          	lw	a3,4(a5)
    8c68:	3ad010ef          	jal	a814 <__subdf3>
    8c6c:	00098613          	mv	a2,s3
    8c70:	00090693          	mv	a3,s2
    8c74:	5b0010ef          	jal	a224 <__muldf3>
    8c78:	00009797          	auipc	a5,0x9
    8c7c:	6a078793          	add	a5,a5,1696 # 12318 <.LC4>
    8c80:	0007a603          	lw	a2,0(a5)
    8c84:	0047a683          	lw	a3,4(a5)
    8c88:	5c0000ef          	jal	9248 <__adddf3>
    8c8c:	00050c93          	mv	s9,a0
    8c90:	00058c13          	mv	s8,a1
    8c94:	080d1863          	bnez	s10,8d24 <.L4>
    8c98:	00050613          	mv	a2,a0
    8c9c:	00058693          	mv	a3,a1
    8ca0:	00098513          	mv	a0,s3
    8ca4:	00090593          	mv	a1,s2
    8ca8:	57c010ef          	jal	a224 <__muldf3>
    8cac:	000da603          	lw	a2,0(s11)
    8cb0:	004da683          	lw	a3,4(s11)
    8cb4:	361010ef          	jal	a814 <__subdf3>
    8cb8:	000a8613          	mv	a2,s5
    8cbc:	000a0693          	mv	a3,s4
    8cc0:	564010ef          	jal	a224 <__muldf3>
    8cc4:	00050613          	mv	a2,a0
    8cc8:	00058693          	mv	a3,a1
    8ccc:	00048513          	mv	a0,s1
    8cd0:	00040593          	mv	a1,s0
    8cd4:	574000ef          	jal	9248 <__adddf3>

00008cd8 <.L9>:
    8cd8:	00050493          	mv	s1,a0
    8cdc:	00058413          	mv	s0,a1

00008ce0 <.L3>:
    8ce0:	04c12083          	lw	ra,76(sp)
    8ce4:	00040593          	mv	a1,s0
    8ce8:	04812403          	lw	s0,72(sp)
    8cec:	04012903          	lw	s2,64(sp)
    8cf0:	03c12983          	lw	s3,60(sp)
    8cf4:	03812a03          	lw	s4,56(sp)
    8cf8:	03412a83          	lw	s5,52(sp)
    8cfc:	03012b03          	lw	s6,48(sp)
    8d00:	02c12b83          	lw	s7,44(sp)
    8d04:	02812c03          	lw	s8,40(sp)
    8d08:	02412c83          	lw	s9,36(sp)
    8d0c:	02012d03          	lw	s10,32(sp)
    8d10:	01c12d83          	lw	s11,28(sp)
    8d14:	00048513          	mv	a0,s1
    8d18:	04412483          	lw	s1,68(sp)
    8d1c:	05010113          	add	sp,sp,80
    8d20:	00008067          	ret

00008d24 <.L4>:
    8d24:	00009797          	auipc	a5,0x9
    8d28:	56478793          	add	a5,a5,1380 # 12288 <.LC2>
    8d2c:	0007a603          	lw	a2,0(a5)
    8d30:	0047a683          	lw	a3,4(a5)
    8d34:	000b8513          	mv	a0,s7
    8d38:	000b0593          	mv	a1,s6
    8d3c:	4e8010ef          	jal	a224 <__muldf3>
    8d40:	00a12623          	sw	a0,12(sp)
    8d44:	00058d13          	mv	s10,a1
    8d48:	000c8613          	mv	a2,s9
    8d4c:	000c0693          	mv	a3,s8
    8d50:	000a8513          	mv	a0,s5
    8d54:	000a0593          	mv	a1,s4
    8d58:	4cc010ef          	jal	a224 <__muldf3>
    8d5c:	00c12783          	lw	a5,12(sp)
    8d60:	00050613          	mv	a2,a0
    8d64:	00058693          	mv	a3,a1
    8d68:	00078513          	mv	a0,a5
    8d6c:	000d0593          	mv	a1,s10
    8d70:	2a5010ef          	jal	a814 <__subdf3>
    8d74:	00098613          	mv	a2,s3
    8d78:	00090693          	mv	a3,s2
    8d7c:	4a8010ef          	jal	a224 <__muldf3>
    8d80:	000b8613          	mv	a2,s7
    8d84:	000b0693          	mv	a3,s6
    8d88:	28d010ef          	jal	a814 <__subdf3>
    8d8c:	000da603          	lw	a2,0(s11)
    8d90:	004da683          	lw	a3,4(s11)
    8d94:	00050993          	mv	s3,a0
    8d98:	00058913          	mv	s2,a1
    8d9c:	000a8513          	mv	a0,s5
    8da0:	000a0593          	mv	a1,s4
    8da4:	480010ef          	jal	a224 <__muldf3>
    8da8:	00050613          	mv	a2,a0
    8dac:	00058693          	mv	a3,a1
    8db0:	00098513          	mv	a0,s3
    8db4:	00090593          	mv	a1,s2
    8db8:	490000ef          	jal	9248 <__adddf3>
    8dbc:	00050613          	mv	a2,a0
    8dc0:	00058693          	mv	a3,a1
    8dc4:	00048513          	mv	a0,s1
    8dc8:	00040593          	mv	a1,s0
    8dcc:	249010ef          	jal	a814 <__subdf3>
    8dd0:	f09ff06f          	j	8cd8 <.L9>

00008dd4 <__GI_floor>:
    8dd4:	4145d693          	sra	a3,a1,0x14
    8dd8:	fe010113          	add	sp,sp,-32
    8ddc:	7ff6f693          	and	a3,a3,2047
    8de0:	00812c23          	sw	s0,24(sp)
    8de4:	00912a23          	sw	s1,20(sp)
    8de8:	01312623          	sw	s3,12(sp)
    8dec:	01512223          	sw	s5,4(sp)
    8df0:	00112e23          	sw	ra,28(sp)
    8df4:	01212823          	sw	s2,16(sp)
    8df8:	01412423          	sw	s4,8(sp)
    8dfc:	c0168493          	add	s1,a3,-1023
    8e00:	01300613          	li	a2,19
    8e04:	00050713          	mv	a4,a0
    8e08:	00058793          	mv	a5,a1
    8e0c:	00058413          	mv	s0,a1
    8e10:	00050a93          	mv	s5,a0
    8e14:	00050993          	mv	s3,a0
    8e18:	0a964663          	blt	a2,s1,8ec4 <.L2>
    8e1c:	0404d863          	bgez	s1,8e6c <.L3>
    8e20:	00009797          	auipc	a5,0x9
    8e24:	3c078793          	add	a5,a5,960 # 121e0 <.LC0>
    8e28:	0007a603          	lw	a2,0(a5)
    8e2c:	0047a683          	lw	a3,4(a5)
    8e30:	418000ef          	jal	9248 <__adddf3>
    8e34:	00000613          	li	a2,0
    8e38:	00000693          	li	a3,0
    8e3c:	30c010ef          	jal	a148 <__gedf2>
    8e40:	02a05063          	blez	a0,8e60 <.L4>
    8e44:	14045063          	bgez	s0,8f84 <.L13>
    8e48:	00141413          	sll	s0,s0,0x1
    8e4c:	00145413          	srl	s0,s0,0x1
    8e50:	01546433          	or	s0,s0,s5
    8e54:	00000993          	li	s3,0
    8e58:	12041c63          	bnez	s0,8f90 <.L14>
    8e5c:	80000437          	lui	s0,0x80000

00008e60 <.L4>:
    8e60:	00098713          	mv	a4,s3
    8e64:	00040793          	mv	a5,s0
    8e68:	0800006f          	j	8ee8 <.L6>

00008e6c <.L3>:
    8e6c:	00100a37          	lui	s4,0x100
    8e70:	fffa0913          	add	s2,s4,-1 # fffff <_ebss+0xe9f4f>
    8e74:	40995933          	sra	s2,s2,s1
    8e78:	0125f6b3          	and	a3,a1,s2
    8e7c:	00a6e6b3          	or	a3,a3,a0
    8e80:	06068463          	beqz	a3,8ee8 <.L6>
    8e84:	00009797          	auipc	a5,0x9
    8e88:	35c78793          	add	a5,a5,860 # 121e0 <.LC0>
    8e8c:	0007a603          	lw	a2,0(a5)
    8e90:	0047a683          	lw	a3,4(a5)
    8e94:	3b4000ef          	jal	9248 <__adddf3>
    8e98:	00000613          	li	a2,0
    8e9c:	00000693          	li	a3,0
    8ea0:	2a8010ef          	jal	a148 <__gedf2>
    8ea4:	faa05ee3          	blez	a0,8e60 <.L4>
    8ea8:	00045663          	bgez	s0,8eb4 <.L8>
    8eac:	409a5a33          	sra	s4,s4,s1
    8eb0:	01440433          	add	s0,s0,s4

00008eb4 <.L8>:
    8eb4:	fff94913          	not	s2,s2
    8eb8:	01247433          	and	s0,s0,s2
    8ebc:	00000993          	li	s3,0
    8ec0:	fa1ff06f          	j	8e60 <.L4>

00008ec4 <.L2>:
    8ec4:	03300613          	li	a2,51
    8ec8:	04965663          	bge	a2,s1,8f14 <.L9>
    8ecc:	40000693          	li	a3,1024
    8ed0:	00d49c63          	bne	s1,a3,8ee8 <.L6>
    8ed4:	00050613          	mv	a2,a0
    8ed8:	00058693          	mv	a3,a1
    8edc:	36c000ef          	jal	9248 <__adddf3>
    8ee0:	00050713          	mv	a4,a0
    8ee4:	00058793          	mv	a5,a1

00008ee8 <.L6>:
    8ee8:	01c12083          	lw	ra,28(sp)
    8eec:	01812403          	lw	s0,24(sp)
    8ef0:	01412483          	lw	s1,20(sp)
    8ef4:	01012903          	lw	s2,16(sp)
    8ef8:	00c12983          	lw	s3,12(sp)
    8efc:	00812a03          	lw	s4,8(sp)
    8f00:	00412a83          	lw	s5,4(sp)
    8f04:	00070513          	mv	a0,a4
    8f08:	00078593          	mv	a1,a5
    8f0c:	02010113          	add	sp,sp,32
    8f10:	00008067          	ret

00008f14 <.L9>:
    8f14:	bed68693          	add	a3,a3,-1043
    8f18:	fff00913          	li	s2,-1
    8f1c:	00d95933          	srl	s2,s2,a3
    8f20:	00a976b3          	and	a3,s2,a0
    8f24:	fc0682e3          	beqz	a3,8ee8 <.L6>
    8f28:	00009797          	auipc	a5,0x9
    8f2c:	2b878793          	add	a5,a5,696 # 121e0 <.LC0>
    8f30:	0007a603          	lw	a2,0(a5)
    8f34:	0047a683          	lw	a3,4(a5)
    8f38:	310000ef          	jal	9248 <__adddf3>
    8f3c:	00000613          	li	a2,0
    8f40:	00000693          	li	a3,0
    8f44:	204010ef          	jal	a148 <__gedf2>
    8f48:	f0a05ce3          	blez	a0,8e60 <.L4>
    8f4c:	02045663          	bgez	s0,8f78 <.L11>
    8f50:	01400793          	li	a5,20
    8f54:	00f49663          	bne	s1,a5,8f60 <.L12>

00008f58 <.L25>:
    8f58:	00140413          	add	s0,s0,1 # 80000001 <_ebss+0x7ffe9f51>
    8f5c:	01c0006f          	j	8f78 <.L11>

00008f60 <.L12>:
    8f60:	03400713          	li	a4,52
    8f64:	40970733          	sub	a4,a4,s1
    8f68:	00100793          	li	a5,1
    8f6c:	00e797b3          	sll	a5,a5,a4
    8f70:	00fa89b3          	add	s3,s5,a5
    8f74:	ff59e2e3          	bltu	s3,s5,8f58 <.L25>

00008f78 <.L11>:
    8f78:	fff94913          	not	s2,s2
    8f7c:	0129f9b3          	and	s3,s3,s2
    8f80:	ee1ff06f          	j	8e60 <.L4>

00008f84 <.L13>:
    8f84:	00000993          	li	s3,0
    8f88:	00000413          	li	s0,0
    8f8c:	ed5ff06f          	j	8e60 <.L4>

00008f90 <.L14>:
    8f90:	bff00437          	lui	s0,0xbff00
    8f94:	ecdff06f          	j	8e60 <.L4>

00008f98 <__GI_scalbln>:
    8f98:	ff010113          	add	sp,sp,-16
    8f9c:	4145d693          	sra	a3,a1,0x14
    8fa0:	00812423          	sw	s0,8(sp)
    8fa4:	00112623          	sw	ra,12(sp)
    8fa8:	00912223          	sw	s1,4(sp)
    8fac:	7ff6f693          	and	a3,a3,2047
    8fb0:	00050713          	mv	a4,a0
    8fb4:	00058793          	mv	a5,a1
    8fb8:	00060413          	mv	s0,a2
    8fbc:	08069063          	bnez	a3,903c <.L2>
    8fc0:	00159693          	sll	a3,a1,0x1
    8fc4:	0016d693          	srl	a3,a3,0x1
    8fc8:	00a6e6b3          	or	a3,a3,a0
    8fcc:	0c068263          	beqz	a3,9090 <.L3>
    8fd0:	00009797          	auipc	a5,0x9
    8fd4:	35878793          	add	a5,a5,856 # 12328 <.LC0>
    8fd8:	0047a683          	lw	a3,4(a5)
    8fdc:	0007a603          	lw	a2,0(a5)
    8fe0:	244010ef          	jal	a224 <__muldf3>
    8fe4:	4145d693          	sra	a3,a1,0x14
    8fe8:	7ff6f693          	and	a3,a3,2047
    8fec:	00050713          	mv	a4,a0
    8ff0:	00058793          	mv	a5,a1
    8ff4:	00058813          	mv	a6,a1
    8ff8:	fca68693          	add	a3,a3,-54

00008ffc <.L4>:
    8ffc:	00d406b3          	add	a3,s0,a3
    9000:	7fe00613          	li	a2,2046
    9004:	04d65e63          	bge	a2,a3,9060 <.L5>
    9008:	00009697          	auipc	a3,0x9
    900c:	1d868693          	add	a3,a3,472 # 121e0 <.LC0>

00009010 <.L15>:
    9010:	0006a403          	lw	s0,0(a3)
    9014:	0046a483          	lw	s1,4(a3)
    9018:	00070613          	mv	a2,a4
    901c:	00078693          	mv	a3,a5
    9020:	00040513          	mv	a0,s0
    9024:	00048593          	mv	a1,s1
    9028:	1a0000ef          	jal	91c8 <__GI_copysign>
    902c:	00040613          	mv	a2,s0
    9030:	00048693          	mv	a3,s1

00009034 <.L14>:
    9034:	1f0010ef          	jal	a224 <__muldf3>
    9038:	01c0006f          	j	9054 <.L13>

0000903c <.L2>:
    903c:	7ff00613          	li	a2,2047
    9040:	00058813          	mv	a6,a1
    9044:	fac69ce3          	bne	a3,a2,8ffc <.L4>
    9048:	00050613          	mv	a2,a0
    904c:	00058693          	mv	a3,a1
    9050:	1f8000ef          	jal	9248 <__adddf3>

00009054 <.L13>:
    9054:	00050713          	mv	a4,a0
    9058:	00058793          	mv	a5,a1
    905c:	0340006f          	j	9090 <.L3>

00009060 <.L5>:
    9060:	ffff4637          	lui	a2,0xffff4
    9064:	cb060613          	add	a2,a2,-848 # ffff3cb0 <_ebss+0xfffddc00>
    9068:	00c45863          	bge	s0,a2,9078 <.L6>

0000906c <.L16>:
    906c:	00009697          	auipc	a3,0x9
    9070:	2c468693          	add	a3,a3,708 # 12330 <.LC2>
    9074:	f9dff06f          	j	9010 <.L15>

00009078 <.L6>:
    9078:	02d05a63          	blez	a3,90ac <.L7>
    907c:	801007b7          	lui	a5,0x80100
    9080:	fff78793          	add	a5,a5,-1 # 800fffff <_ebss+0x800e9f4f>
    9084:	00f87833          	and	a6,a6,a5
    9088:	01469693          	sll	a3,a3,0x14
    908c:	00d867b3          	or	a5,a6,a3

00009090 <.L3>:
    9090:	00c12083          	lw	ra,12(sp)
    9094:	00812403          	lw	s0,8(sp)
    9098:	00412483          	lw	s1,4(sp)
    909c:	00070513          	mv	a0,a4
    90a0:	00078593          	mv	a1,a5
    90a4:	01010113          	add	sp,sp,16
    90a8:	00008067          	ret

000090ac <.L7>:
    90ac:	fcb00613          	li	a2,-53
    90b0:	fac6cee3          	blt	a3,a2,906c <.L16>
    90b4:	801007b7          	lui	a5,0x80100
    90b8:	fff78793          	add	a5,a5,-1 # 800fffff <_ebss+0x800e9f4f>
    90bc:	03668693          	add	a3,a3,54
    90c0:	01469693          	sll	a3,a3,0x14
    90c4:	00f87833          	and	a6,a6,a5
    90c8:	00070893          	mv	a7,a4
    90cc:	0106e7b3          	or	a5,a3,a6
    90d0:	00009717          	auipc	a4,0x9
    90d4:	26870713          	add	a4,a4,616 # 12338 <.LC3>
    90d8:	00072603          	lw	a2,0(a4)
    90dc:	00472683          	lw	a3,4(a4)
    90e0:	00088513          	mv	a0,a7
    90e4:	00078593          	mv	a1,a5
    90e8:	f4dff06f          	j	9034 <.L14>

000090ec <__GI_read>:
    90ec:	03f00893          	li	a7,63
    90f0:	00000073          	ecall
    90f4:	fffff7b7          	lui	a5,0xfffff
    90f8:	00a7fc63          	bgeu	a5,a0,9110 <.L1>
    90fc:	40a00533          	neg	a0,a0
    9100:	00007797          	auipc	a5,0x7
    9104:	3147a783          	lw	a5,788(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    9108:	00a7a023          	sw	a0,0(a5)
    910c:	fff00513          	li	a0,-1

00009110 <.L1>:
    9110:	00008067          	ret

00009114 <__GI_sigprocmask>:
    9114:	00800693          	li	a3,8
    9118:	08700893          	li	a7,135
    911c:	00000073          	ecall
    9120:	fffff7b7          	lui	a5,0xfffff
    9124:	00a7fc63          	bgeu	a5,a0,913c <.L1>
    9128:	40a00533          	neg	a0,a0
    912c:	00007797          	auipc	a5,0x7
    9130:	2e87a783          	lw	a5,744(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    9134:	00a7a023          	sw	a0,0(a5)
    9138:	fff00513          	li	a0,-1

0000913c <.L1>:
    913c:	00008067          	ret

00009140 <__GI_lseek64>:
    9140:	00058793          	mv	a5,a1
    9144:	ff010113          	add	sp,sp,-16
    9148:	00068713          	mv	a4,a3
    914c:	00060593          	mv	a1,a2
    9150:	00810693          	add	a3,sp,8
    9154:	00078613          	mv	a2,a5
    9158:	03e00893          	li	a7,62
    915c:	00000073          	ecall
    9160:	fffff7b7          	lui	a5,0xfffff
    9164:	02a7f263          	bgeu	a5,a0,9188 <.L2>
    9168:	40a00533          	neg	a0,a0
    916c:	00007797          	auipc	a5,0x7
    9170:	2a87a783          	lw	a5,680(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    9174:	00a7a023          	sw	a0,0(a5)
    9178:	fff00593          	li	a1,-1
    917c:	fff00513          	li	a0,-1

00009180 <.L1>:
    9180:	01010113          	add	sp,sp,16
    9184:	00008067          	ret

00009188 <.L2>:
    9188:	41f55593          	sra	a1,a0,0x1f
    918c:	00b567b3          	or	a5,a0,a1
    9190:	fe0798e3          	bnez	a5,9180 <.L1>
    9194:	00812503          	lw	a0,8(sp)
    9198:	00c12583          	lw	a1,12(sp)
    919c:	fe5ff06f          	j	9180 <.L1>

000091a0 <__GI_sigaction>:
    91a0:	00800693          	li	a3,8
    91a4:	0480006f          	j	91ec <__syscall_rt_sigaction>

000091a8 <__GI_raise>:
    91a8:	fe010113          	add	sp,sp,-32
    91ac:	00112e23          	sw	ra,28(sp)
    91b0:	00a12623          	sw	a0,12(sp)
    91b4:	060000ef          	jal	9214 <__GI_getpid>
    91b8:	00c12583          	lw	a1,12(sp)
    91bc:	01c12083          	lw	ra,28(sp)
    91c0:	02010113          	add	sp,sp,32
    91c4:	05c0006f          	j	9220 <__GI_kill>

000091c8 <__GI_copysign>:
    91c8:	800007b7          	lui	a5,0x80000
    91cc:	fff78713          	add	a4,a5,-1 # 7fffffff <_ebss+0x7ffe9f4f>
    91d0:	00b775b3          	and	a1,a4,a1
    91d4:	00d7f7b3          	and	a5,a5,a3
    91d8:	00f5e733          	or	a4,a1,a5
    91dc:	00050693          	mv	a3,a0
    91e0:	00068513          	mv	a0,a3
    91e4:	00070593          	mv	a1,a4
    91e8:	00008067          	ret

000091ec <__syscall_rt_sigaction>:
    91ec:	08600893          	li	a7,134
    91f0:	00000073          	ecall
    91f4:	fffff7b7          	lui	a5,0xfffff
    91f8:	00a7fc63          	bgeu	a5,a0,9210 <.L1>
    91fc:	40a00533          	neg	a0,a0
    9200:	00007797          	auipc	a5,0x7
    9204:	2147a783          	lw	a5,532(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    9208:	00a7a023          	sw	a0,0(a5)
    920c:	fff00513          	li	a0,-1

00009210 <.L1>:
    9210:	00008067          	ret

00009214 <__GI_getpid>:
    9214:	0ac00893          	li	a7,172
    9218:	00000073          	ecall
    921c:	00008067          	ret

00009220 <__GI_kill>:
    9220:	08100893          	li	a7,129
    9224:	00000073          	ecall
    9228:	fffff7b7          	lui	a5,0xfffff
    922c:	00a7fc63          	bgeu	a5,a0,9244 <.L1>
    9230:	40a00533          	neg	a0,a0
    9234:	00007797          	auipc	a5,0x7
    9238:	1e07a783          	lw	a5,480(a5) # 10414 <_GLOBAL_OFFSET_TABLE_+0xc>
    923c:	00a7a023          	sw	a0,0(a5)
    9240:	fff00513          	li	a0,-1

00009244 <.L1>:
    9244:	00008067          	ret

00009248 <__adddf3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
    9248:	00100837          	lui	a6,0x100
    924c:	fff80813          	add	a6,a6,-1 # fffff <_ebss+0xe9f4f>

00009250 <.LBE2>:
{
    9250:	fe010113          	add	sp,sp,-32

00009254 <.LBB3>:
  FP_UNPACK_SEMIRAW_D (A, a);
    9254:	00b878b3          	and	a7,a6,a1

00009258 <.LVL1>:
    9258:	0145d713          	srl	a4,a1,0x14

0000925c <.LBE3>:
    925c:	01d55793          	srl	a5,a0,0x1d

00009260 <.LBB5>:
  FP_UNPACK_SEMIRAW_D (B, b);
    9260:	00d87833          	and	a6,a6,a3

00009264 <.LBE5>:
{
    9264:	00912a23          	sw	s1,20(sp)

00009268 <.LBB6>:
  FP_UNPACK_SEMIRAW_D (A, a);
    9268:	7ff77493          	and	s1,a4,2047

0000926c <.LBE6>:
    926c:	00389713          	sll	a4,a7,0x3

00009270 <.LBB8>:
  FP_UNPACK_SEMIRAW_D (B, b);
    9270:	0146d893          	srl	a7,a3,0x14

00009274 <.LBE8>:
    9274:	00381813          	sll	a6,a6,0x3
{
    9278:	01212823          	sw	s2,16(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
    927c:	00e7e7b3          	or	a5,a5,a4

00009280 <.LBB11>:
  FP_UNPACK_SEMIRAW_D (B, b);
    9280:	7ff8f893          	and	a7,a7,2047

00009284 <.LBE11>:
    9284:	01d65713          	srl	a4,a2,0x1d
{
    9288:	00112e23          	sw	ra,28(sp)
    928c:	00812c23          	sw	s0,24(sp)
    9290:	01312623          	sw	s3,12(sp)

00009294 <.LBB13>:
  FP_UNPACK_SEMIRAW_D (A, a);
    9294:	01f5d913          	srl	s2,a1,0x1f

00009298 <.LBB15>:
  FP_UNPACK_SEMIRAW_D (B, b);
    9298:	01f6d693          	srl	a3,a3,0x1f

0000929c <.LBE15>:
    929c:	01076733          	or	a4,a4,a6
  FP_UNPACK_SEMIRAW_D (A, a);
    92a0:	00351513          	sll	a0,a0,0x3

000092a4 <.LBB18>:
  FP_UNPACK_SEMIRAW_D (B, b);
    92a4:	00361613          	sll	a2,a2,0x3

000092a8 <.LVL6>:
  FP_ADD_D (R, A, B);
    92a8:	41148833          	sub	a6,s1,a7
    92ac:	2ad91a63          	bne	s2,a3,9560 <.L2>

000092b0 <.LBB20>:
    92b0:	11005c63          	blez	a6,93c8 <.L3>

000092b4 <.LVL8>:
    92b4:	04089063          	bnez	a7,92f4 <.L4>
    92b8:	00c766b3          	or	a3,a4,a2

000092bc <.LVL9>:
    92bc:	66068063          	beqz	a3,991c <.L100>
    92c0:	fff80593          	add	a1,a6,-1

000092c4 <.LVL10>:
    92c4:	02059063          	bnez	a1,92e4 <.L6>

000092c8 <.L143>:
    92c8:	00c50633          	add	a2,a0,a2

000092cc <.LVL12>:
    92cc:	00a636b3          	sltu	a3,a2,a0
    92d0:	00e78733          	add	a4,a5,a4

000092d4 <.LVL13>:
    92d4:	00060513          	mv	a0,a2

000092d8 <.LVL14>:
    92d8:	00d707b3          	add	a5,a4,a3

000092dc <.LBE21>:
    92dc:	00100493          	li	s1,1

000092e0 <.LVL16>:
    92e0:	06c0006f          	j	934c <.L9>

000092e4 <.L6>:
    92e4:	7ff00693          	li	a3,2047
    92e8:	02d81063          	bne	a6,a3,9308 <.L10>

000092ec <.L110>:
    92ec:	7ff00493          	li	s1,2047

000092f0 <.LVL19>:
    92f0:	1f80006f          	j	94e8 <.L5>

000092f4 <.L4>:
    92f4:	7ff00693          	li	a3,2047

000092f8 <.LVL21>:
    92f8:	1ed48863          	beq	s1,a3,94e8 <.L5>
    92fc:	008006b7          	lui	a3,0x800
    9300:	00d76733          	or	a4,a4,a3
    9304:	00080593          	mv	a1,a6

00009308 <.L10>:
    9308:	03800693          	li	a3,56
    930c:	0ab6c863          	blt	a3,a1,93bc <.L11>
    9310:	01f00693          	li	a3,31
    9314:	06b6ca63          	blt	a3,a1,9388 <.L12>
    9318:	02000813          	li	a6,32
    931c:	40b80833          	sub	a6,a6,a1
    9320:	010716b3          	sll	a3,a4,a6
    9324:	00b658b3          	srl	a7,a2,a1

00009328 <.LVL24>:
    9328:	01061833          	sll	a6,a2,a6
    932c:	0116e6b3          	or	a3,a3,a7
    9330:	01003833          	snez	a6,a6
    9334:	0106e6b3          	or	a3,a3,a6

00009338 <.LVL25>:
    9338:	00b755b3          	srl	a1,a4,a1

0000933c <.L13>:
    933c:	00a68533          	add	a0,a3,a0

00009340 <.LVL27>:
    9340:	00f585b3          	add	a1,a1,a5

00009344 <.LVL28>:
    9344:	00d536b3          	sltu	a3,a0,a3

00009348 <.LVL29>:
    9348:	00d587b3          	add	a5,a1,a3

0000934c <.L9>:
    934c:	00879713          	sll	a4,a5,0x8
    9350:	18075c63          	bgez	a4,94e8 <.L5>

00009354 <.LVL31>:
    9354:	00148493          	add	s1,s1,1

00009358 <.LVL32>:
    9358:	7ff00713          	li	a4,2047
    935c:	5ae48a63          	beq	s1,a4,9910 <.L150>
    9360:	ff800737          	lui	a4,0xff800
    9364:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9f4f>
    9368:	00e7f733          	and	a4,a5,a4
    936c:	00155793          	srl	a5,a0,0x1

00009370 <.LVL33>:
    9370:	00157513          	and	a0,a0,1
    9374:	00a7e7b3          	or	a5,a5,a0
    9378:	01f71513          	sll	a0,a4,0x1f
    937c:	00f56533          	or	a0,a0,a5
    9380:	00175793          	srl	a5,a4,0x1
    9384:	1640006f          	j	94e8 <.L5>

00009388 <.L12>:
    9388:	fe058693          	add	a3,a1,-32
    938c:	02000893          	li	a7,32

00009390 <.LVL35>:
    9390:	00d756b3          	srl	a3,a4,a3
    9394:	00000813          	li	a6,0
    9398:	01158863          	beq	a1,a7,93a8 <.L14>
    939c:	04000813          	li	a6,64
    93a0:	40b80833          	sub	a6,a6,a1
    93a4:	01071833          	sll	a6,a4,a6

000093a8 <.L14>:
    93a8:	00c86833          	or	a6,a6,a2
    93ac:	01003833          	snez	a6,a6
    93b0:	0106e6b3          	or	a3,a3,a6

000093b4 <.L141>:
    93b4:	00000593          	li	a1,0

000093b8 <.LVL37>:
    93b8:	f85ff06f          	j	933c <.L13>

000093bc <.L11>:
    93bc:	00c766b3          	or	a3,a4,a2
    93c0:	00d036b3          	snez	a3,a3
    93c4:	ff1ff06f          	j	93b4 <.L141>

000093c8 <.L3>:
    93c8:	0c080a63          	beqz	a6,949c <.L17>
    93cc:	409886b3          	sub	a3,a7,s1

000093d0 <.LVL40>:
    93d0:	02049463          	bnez	s1,93f8 <.L18>
    93d4:	00a7e5b3          	or	a1,a5,a0
    93d8:	50058e63          	beqz	a1,98f4 <.L91>
    93dc:	fff68593          	add	a1,a3,-1 # 7fffff <_ebss+0x7e9f4f>

000093e0 <.LVL41>:
    93e0:	ee0584e3          	beqz	a1,92c8 <.L143>
    93e4:	7ff00813          	li	a6,2047
    93e8:	03069263          	bne	a3,a6,940c <.L22>

000093ec <.L96>:
    93ec:	00070793          	mv	a5,a4

000093f0 <.LVL43>:
    93f0:	00060513          	mv	a0,a2

000093f4 <.LVL44>:
    93f4:	ef9ff06f          	j	92ec <.L110>

000093f8 <.L18>:
    93f8:	7ff00593          	li	a1,2047
    93fc:	feb888e3          	beq	a7,a1,93ec <.L96>
    9400:	008005b7          	lui	a1,0x800
    9404:	00b7e7b3          	or	a5,a5,a1
    9408:	00068593          	mv	a1,a3

0000940c <.L22>:
    940c:	03800693          	li	a3,56
    9410:	08b6c063          	blt	a3,a1,9490 <.L23>
    9414:	01f00693          	li	a3,31
    9418:	04b6c263          	blt	a3,a1,945c <.L24>
    941c:	02000813          	li	a6,32
    9420:	40b80833          	sub	a6,a6,a1
    9424:	010796b3          	sll	a3,a5,a6
    9428:	00b55333          	srl	t1,a0,a1
    942c:	01051833          	sll	a6,a0,a6
    9430:	0066e6b3          	or	a3,a3,t1
    9434:	01003833          	snez	a6,a6
    9438:	0106e6b3          	or	a3,a3,a6

0000943c <.LVL48>:
    943c:	00b7d5b3          	srl	a1,a5,a1

00009440 <.L25>:
    9440:	00c68633          	add	a2,a3,a2

00009444 <.LVL50>:
    9444:	00e585b3          	add	a1,a1,a4

00009448 <.LVL51>:
    9448:	00d636b3          	sltu	a3,a2,a3

0000944c <.LVL52>:
    944c:	00060513          	mv	a0,a2

00009450 <.LVL53>:
    9450:	00d587b3          	add	a5,a1,a3

00009454 <.LBE28>:
    9454:	00088493          	mv	s1,a7

00009458 <.LVL55>:
    9458:	ef5ff06f          	j	934c <.L9>

0000945c <.L24>:
    945c:	fe058693          	add	a3,a1,-32 # 7fffe0 <_ebss+0x7e9f30>
    9460:	02000313          	li	t1,32
    9464:	00d7d6b3          	srl	a3,a5,a3
    9468:	00000813          	li	a6,0
    946c:	00658863          	beq	a1,t1,947c <.L26>
    9470:	04000813          	li	a6,64
    9474:	40b80833          	sub	a6,a6,a1
    9478:	01079833          	sll	a6,a5,a6

0000947c <.L26>:
    947c:	00a86833          	or	a6,a6,a0
    9480:	01003833          	snez	a6,a6
    9484:	0106e6b3          	or	a3,a3,a6

00009488 <.L142>:
    9488:	00000593          	li	a1,0

0000948c <.LVL58>:
    948c:	fb5ff06f          	j	9440 <.L25>

00009490 <.L23>:
    9490:	00a7e6b3          	or	a3,a5,a0
    9494:	00d036b3          	snez	a3,a3
    9498:	ff1ff06f          	j	9488 <.L142>

0000949c <.L17>:
    949c:	00148693          	add	a3,s1,1

000094a0 <.LVL61>:
    94a0:	7fe6f593          	and	a1,a3,2046
    94a4:	08059663          	bnez	a1,9530 <.L29>
    94a8:	00a7e6b3          	or	a3,a5,a0
    94ac:	06049263          	bnez	s1,9510 <.L30>

000094b0 <.LVL62>:
    94b0:	44068863          	beqz	a3,9900 <.L95>
    94b4:	00c766b3          	or	a3,a4,a2
    94b8:	02068863          	beqz	a3,94e8 <.L5>

000094bc <.LBB30>:
    94bc:	00c50633          	add	a2,a0,a2

000094c0 <.LVL63>:
    94c0:	00a636b3          	sltu	a3,a2,a0
    94c4:	00e78733          	add	a4,a5,a4

000094c8 <.LVL64>:
    94c8:	00d707b3          	add	a5,a4,a3

000094cc <.LBE30>:
    94cc:	00879713          	sll	a4,a5,0x8

000094d0 <.LBB31>:
    94d0:	00060513          	mv	a0,a2

000094d4 <.LBE31>:
    94d4:	00075a63          	bgez	a4,94e8 <.L5>
    94d8:	ff800737          	lui	a4,0xff800
    94dc:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9f4f>
    94e0:	00e7f7b3          	and	a5,a5,a4

000094e4 <.LVL67>:
    94e4:	00100493          	li	s1,1

000094e8 <.L5>:
  FP_PACK_SEMIRAW_D (r, R);
    94e8:	00757713          	and	a4,a0,7
    94ec:	44070863          	beqz	a4,993c <.L83>
    94f0:	00f57713          	and	a4,a0,15
    94f4:	00400693          	li	a3,4
    94f8:	44d70263          	beq	a4,a3,993c <.L83>

000094fc <.LBB64>:
    94fc:	00450713          	add	a4,a0,4
    9500:	00a736b3          	sltu	a3,a4,a0
    9504:	00d787b3          	add	a5,a5,a3

00009508 <.LVL69>:
    9508:	00070513          	mv	a0,a4

0000950c <.LVL70>:
    950c:	4300006f          	j	993c <.L83>

00009510 <.L30>:
  FP_ADD_D (R, A, B);
    9510:	ec068ee3          	beqz	a3,93ec <.L96>
    9514:	00c76633          	or	a2,a4,a2

00009518 <.LVL72>:
    9518:	dc060ae3          	beqz	a2,92ec <.L110>

0000951c <.L109>:
    951c:	00000913          	li	s2,0

00009520 <.LVL74>:
    9520:	004007b7          	lui	a5,0x400

00009524 <.LVL75>:
    9524:	00000513          	li	a0,0

00009528 <.LVL76>:
    9528:	7ff00493          	li	s1,2047

0000952c <.LVL77>:
    952c:	4100006f          	j	993c <.L83>

00009530 <.L29>:
    9530:	7ff00593          	li	a1,2047
    9534:	3cb68c63          	beq	a3,a1,990c <.L98>
    9538:	00c50633          	add	a2,a0,a2

0000953c <.LBB34>:
    953c:	00a63533          	sltu	a0,a2,a0

00009540 <.LVL80>:
    9540:	00e78733          	add	a4,a5,a4

00009544 <.LVL81>:
    9544:	00a70733          	add	a4,a4,a0

00009548 <.LBE34>:
    9548:	01f71513          	sll	a0,a4,0x1f
    954c:	00165613          	srl	a2,a2,0x1

00009550 <.LVL82>:
    9550:	00c56533          	or	a0,a0,a2
    9554:	00175793          	srl	a5,a4,0x1

00009558 <.L147>:
    9558:	00068493          	mv	s1,a3

0000955c <.LVL84>:
    955c:	f8dff06f          	j	94e8 <.L5>

00009560 <.L2>:
    9560:	0f005c63          	blez	a6,9658 <.L35>

00009564 <.LVL86>:
    9564:	08089e63          	bnez	a7,9600 <.L36>
    9568:	00c766b3          	or	a3,a4,a2

0000956c <.LVL87>:
    956c:	3a068863          	beqz	a3,991c <.L100>
    9570:	fff80693          	add	a3,a6,-1

00009574 <.LVL88>:
    9574:	02069063          	bnez	a3,9594 <.L37>

00009578 <.LBB38>:
    9578:	40c50633          	sub	a2,a0,a2

0000957c <.LVL89>:
    957c:	00c536b3          	sltu	a3,a0,a2

00009580 <.LVL90>:
    9580:	40e78733          	sub	a4,a5,a4

00009584 <.LVL91>:
    9584:	00060513          	mv	a0,a2

00009588 <.LVL92>:
    9588:	40d707b3          	sub	a5,a4,a3

0000958c <.L146>:
    958c:	00100493          	li	s1,1

00009590 <.LVL94>:
    9590:	0540006f          	j	95e4 <.L40>

00009594 <.L37>:
    9594:	7ff00593          	li	a1,2047
    9598:	d4b80ae3          	beq	a6,a1,92ec <.L110>

0000959c <.L41>:
    959c:	03800593          	li	a1,56
    95a0:	0ad5c663          	blt	a1,a3,964c <.L42>
    95a4:	01f00593          	li	a1,31
    95a8:	06d5c863          	blt	a1,a3,9618 <.L43>
    95ac:	02000813          	li	a6,32
    95b0:	40d80833          	sub	a6,a6,a3
    95b4:	00d658b3          	srl	a7,a2,a3

000095b8 <.LVL96>:
    95b8:	010715b3          	sll	a1,a4,a6
    95bc:	01061833          	sll	a6,a2,a6
    95c0:	0115e5b3          	or	a1,a1,a7
    95c4:	01003833          	snez	a6,a6
    95c8:	0105e633          	or	a2,a1,a6
    95cc:	00d756b3          	srl	a3,a4,a3

000095d0 <.L44>:
    95d0:	40c50633          	sub	a2,a0,a2

000095d4 <.LVL99>:
    95d4:	00c53733          	sltu	a4,a0,a2
    95d8:	40d786b3          	sub	a3,a5,a3

000095dc <.LVL100>:
    95dc:	00060513          	mv	a0,a2

000095e0 <.LVL101>:
    95e0:	40e687b3          	sub	a5,a3,a4

000095e4 <.L40>:
    95e4:	00879713          	sll	a4,a5,0x8
    95e8:	f00750e3          	bgez	a4,94e8 <.L5>

000095ec <.LBB41>:
    95ec:	00800437          	lui	s0,0x800
    95f0:	fff40413          	add	s0,s0,-1 # 7fffff <_ebss+0x7e9f4f>
    95f4:	0087f433          	and	s0,a5,s0

000095f8 <.LVL103>:
    95f8:	00050993          	mv	s3,a0
    95fc:	2100006f          	j	980c <.L74>

00009600 <.L36>:
    9600:	7ff00693          	li	a3,2047

00009604 <.LVL105>:
    9604:	eed482e3          	beq	s1,a3,94e8 <.L5>
    9608:	008006b7          	lui	a3,0x800
    960c:	00d76733          	or	a4,a4,a3
    9610:	00080693          	mv	a3,a6
    9614:	f89ff06f          	j	959c <.L41>

00009618 <.L43>:
    9618:	fe068593          	add	a1,a3,-32 # 7fffe0 <_ebss+0x7e9f30>
    961c:	02000893          	li	a7,32

00009620 <.LVL108>:
    9620:	00b755b3          	srl	a1,a4,a1
    9624:	00000813          	li	a6,0
    9628:	01168863          	beq	a3,a7,9638 <.L45>
    962c:	04000813          	li	a6,64
    9630:	40d80833          	sub	a6,a6,a3
    9634:	01071833          	sll	a6,a4,a6

00009638 <.L45>:
    9638:	00c86833          	or	a6,a6,a2
    963c:	01003833          	snez	a6,a6
    9640:	0105e633          	or	a2,a1,a6

00009644 <.L144>:
    9644:	00000693          	li	a3,0

00009648 <.LVL110>:
    9648:	f89ff06f          	j	95d0 <.L44>

0000964c <.L42>:
    964c:	00c76633          	or	a2,a4,a2

00009650 <.LVL112>:
    9650:	00c03633          	snez	a2,a2
    9654:	ff1ff06f          	j	9644 <.L144>

00009658 <.L35>:
    9658:	0e080863          	beqz	a6,9748 <.L48>
    965c:	40988833          	sub	a6,a7,s1

00009660 <.LVL114>:
    9660:	04049263          	bnez	s1,96a4 <.L49>
    9664:	00a7e5b3          	or	a1,a5,a0
    9668:	2a058e63          	beqz	a1,9924 <.L103>
    966c:	fff80593          	add	a1,a6,-1

00009670 <.LVL115>:
    9670:	00059e63          	bnez	a1,968c <.L50>

00009674 <.LBB47>:
    9674:	40a60533          	sub	a0,a2,a0

00009678 <.LVL117>:
    9678:	40f70733          	sub	a4,a4,a5

0000967c <.LVL118>:
    967c:	00a63633          	sltu	a2,a2,a0

00009680 <.LVL119>:
    9680:	40c707b3          	sub	a5,a4,a2

00009684 <.LBE47>:
    9684:	00068913          	mv	s2,a3

00009688 <.LVL121>:
    9688:	f05ff06f          	j	958c <.L146>

0000968c <.L50>:
    968c:	7ff00313          	li	t1,2047
    9690:	02681463          	bne	a6,t1,96b8 <.L53>

00009694 <.L105>:
    9694:	00070793          	mv	a5,a4

00009698 <.LVL124>:
    9698:	00060513          	mv	a0,a2

0000969c <.LVL125>:
    969c:	7ff00493          	li	s1,2047

000096a0 <.LVL126>:
    96a0:	0d00006f          	j	9770 <.L148>

000096a4 <.L49>:
    96a4:	7ff00593          	li	a1,2047
    96a8:	feb886e3          	beq	a7,a1,9694 <.L105>
    96ac:	008005b7          	lui	a1,0x800
    96b0:	00b7e7b3          	or	a5,a5,a1
    96b4:	00080593          	mv	a1,a6

000096b8 <.L53>:
    96b8:	03800813          	li	a6,56
    96bc:	08b84063          	blt	a6,a1,973c <.L54>
    96c0:	01f00813          	li	a6,31
    96c4:	04b84263          	blt	a6,a1,9708 <.L55>
    96c8:	02000313          	li	t1,32
    96cc:	40b30333          	sub	t1,t1,a1
    96d0:	00b55e33          	srl	t3,a0,a1
    96d4:	00679833          	sll	a6,a5,t1
    96d8:	00651333          	sll	t1,a0,t1
    96dc:	01c86833          	or	a6,a6,t3
    96e0:	00603333          	snez	t1,t1
    96e4:	00686533          	or	a0,a6,t1
    96e8:	00b7d5b3          	srl	a1,a5,a1

000096ec <.L56>:
    96ec:	40a60533          	sub	a0,a2,a0

000096f0 <.LVL132>:
    96f0:	40b705b3          	sub	a1,a4,a1

000096f4 <.LVL133>:
    96f4:	00a63633          	sltu	a2,a2,a0

000096f8 <.LVL134>:
    96f8:	40c587b3          	sub	a5,a1,a2

000096fc <.LBE49>:
    96fc:	00088493          	mv	s1,a7

00009700 <.LVL136>:
    9700:	00068913          	mv	s2,a3

00009704 <.LVL137>:
    9704:	ee1ff06f          	j	95e4 <.L40>

00009708 <.L55>:
    9708:	fe058813          	add	a6,a1,-32 # 7fffe0 <_ebss+0x7e9f30>
    970c:	02000e13          	li	t3,32
    9710:	0107d833          	srl	a6,a5,a6
    9714:	00000313          	li	t1,0
    9718:	01c58863          	beq	a1,t3,9728 <.L57>
    971c:	04000313          	li	t1,64
    9720:	40b30333          	sub	t1,t1,a1
    9724:	00679333          	sll	t1,a5,t1

00009728 <.L57>:
    9728:	00a36333          	or	t1,t1,a0
    972c:	00603333          	snez	t1,t1
    9730:	00686533          	or	a0,a6,t1

00009734 <.L145>:
    9734:	00000593          	li	a1,0

00009738 <.LVL140>:
    9738:	fb5ff06f          	j	96ec <.L56>

0000973c <.L54>:
    973c:	00a7e533          	or	a0,a5,a0

00009740 <.LVL142>:
    9740:	00a03533          	snez	a0,a0
    9744:	ff1ff06f          	j	9734 <.L145>

00009748 <.L48>:
    9748:	00148593          	add	a1,s1,1
    974c:	7fe5f593          	and	a1,a1,2046
    9750:	08059663          	bnez	a1,97dc <.L60>

00009754 <.LBB72>:
    9754:	00a7e833          	or	a6,a5,a0

00009758 <.LVL144>:
    9758:	00c765b3          	or	a1,a4,a2

0000975c <.LBB73>:
    975c:	06049063          	bnez	s1,97bc <.L61>

00009760 <.LVL145>:
    9760:	00081c63          	bnez	a6,9778 <.L62>

00009764 <.LVL146>:
    9764:	10058e63          	beqz	a1,9880 <.L151>
    9768:	00070793          	mv	a5,a4

0000976c <.LVL147>:
    976c:	00060513          	mv	a0,a2

00009770 <.L148>:
    9770:	00068913          	mv	s2,a3

00009774 <.LVL149>:
    9774:	d75ff06f          	j	94e8 <.L5>

00009778 <.L62>:
    9778:	d60588e3          	beqz	a1,94e8 <.L5>

0000977c <.LBB51>:
    977c:	40c50833          	sub	a6,a0,a2

00009780 <.LVL151>:
    9780:	010538b3          	sltu	a7,a0,a6

00009784 <.LVL152>:
    9784:	40e785b3          	sub	a1,a5,a4
    9788:	411585b3          	sub	a1,a1,a7

0000978c <.LBE51>:
    978c:	00859893          	sll	a7,a1,0x8
    9790:	0008dc63          	bgez	a7,97a8 <.L65>

00009794 <.LBB52>:
    9794:	40a60533          	sub	a0,a2,a0

00009798 <.LVL155>:
    9798:	40f70733          	sub	a4,a4,a5

0000979c <.LVL156>:
    979c:	00a63633          	sltu	a2,a2,a0

000097a0 <.LVL157>:
    97a0:	40c707b3          	sub	a5,a4,a2

000097a4 <.LBE52>:
    97a4:	fcdff06f          	j	9770 <.L148>

000097a8 <.L65>:
    97a8:	00b86533          	or	a0,a6,a1

000097ac <.LVL160>:
    97ac:	18050463          	beqz	a0,9934 <.L108>

000097b0 <.LBB53>:
    97b0:	00058793          	mv	a5,a1

000097b4 <.LVL161>:
    97b4:	00080513          	mv	a0,a6
    97b8:	d31ff06f          	j	94e8 <.L5>

000097bc <.L61>:
    97bc:	00081c63          	bnez	a6,97d4 <.L68>
    97c0:	d4058ee3          	beqz	a1,951c <.L109>
    97c4:	00070793          	mv	a5,a4

000097c8 <.LVL163>:
    97c8:	00060513          	mv	a0,a2

000097cc <.LVL164>:
    97cc:	00068913          	mv	s2,a3

000097d0 <.LVL165>:
    97d0:	b1dff06f          	j	92ec <.L110>

000097d4 <.L68>:
    97d4:	b0058ce3          	beqz	a1,92ec <.L110>
    97d8:	d45ff06f          	j	951c <.L109>

000097dc <.L60>:
    97dc:	40c505b3          	sub	a1,a0,a2
    97e0:	00b53833          	sltu	a6,a0,a1

000097e4 <.LVL168>:
    97e4:	40e78433          	sub	s0,a5,a4
    97e8:	41040433          	sub	s0,s0,a6

000097ec <.LBE54>:
    97ec:	00841813          	sll	a6,s0,0x8

000097f0 <.LBB55>:
    97f0:	00058993          	mv	s3,a1

000097f4 <.LBE55>:
    97f4:	08085063          	bgez	a6,9874 <.L71>

000097f8 <.LBB56>:
    97f8:	40a609b3          	sub	s3,a2,a0

000097fc <.LVL171>:
    97fc:	40f70433          	sub	s0,a4,a5

00009800 <.LVL172>:
    9800:	01363633          	sltu	a2,a2,s3

00009804 <.LVL173>:
    9804:	40c40433          	sub	s0,s0,a2

00009808 <.LBE56>:
    9808:	00068913          	mv	s2,a3

0000980c <.L74>:
    980c:	06040e63          	beqz	s0,9888 <.L75>
    9810:	00040513          	mv	a0,s0
    9814:	e01f70ef          	jal	1614 <__clzsi2>

00009818 <.LVL176>:
    9818:	ff850693          	add	a3,a0,-8

0000981c <.L76>:
    981c:	02000793          	li	a5,32
    9820:	40d787b3          	sub	a5,a5,a3
    9824:	00d41433          	sll	s0,s0,a3

00009828 <.LVL178>:
    9828:	00f9d7b3          	srl	a5,s3,a5
    982c:	0087e7b3          	or	a5,a5,s0

00009830 <.LVL179>:
    9830:	00d99433          	sll	s0,s3,a3

00009834 <.L78>:
    9834:	0a96c463          	blt	a3,s1,98dc <.L79>
    9838:	409686b3          	sub	a3,a3,s1

0000983c <.LVL181>:
    983c:	00168613          	add	a2,a3,1

00009840 <.LVL182>:
    9840:	01f00713          	li	a4,31
    9844:	06c74263          	blt	a4,a2,98a8 <.L80>
    9848:	02000713          	li	a4,32
    984c:	40c70733          	sub	a4,a4,a2
    9850:	00e79533          	sll	a0,a5,a4
    9854:	00c456b3          	srl	a3,s0,a2
    9858:	00e41733          	sll	a4,s0,a4
    985c:	00d56533          	or	a0,a0,a3
    9860:	00e03733          	snez	a4,a4
    9864:	00e56533          	or	a0,a0,a4

00009868 <.LVL183>:
    9868:	00c7d7b3          	srl	a5,a5,a2

0000986c <.L149>:
    986c:	00000493          	li	s1,0

00009870 <.LVL185>:
    9870:	c79ff06f          	j	94e8 <.L5>

00009874 <.L71>:
    9874:	0085e5b3          	or	a1,a1,s0

00009878 <.LVL187>:
    9878:	f8059ae3          	bnez	a1,980c <.L74>
    987c:	00000493          	li	s1,0

00009880 <.L151>:
    9880:	00000913          	li	s2,0

00009884 <.LVL189>:
    9884:	08c0006f          	j	9910 <.L150>

00009888 <.L75>:
    9888:	00098513          	mv	a0,s3
    988c:	d89f70ef          	jal	1614 <__clzsi2>

00009890 <.LVL191>:
    9890:	01850693          	add	a3,a0,24

00009894 <.LVL192>:
    9894:	01f00793          	li	a5,31
    9898:	f8d7d2e3          	bge	a5,a3,981c <.L76>
    989c:	ff850793          	add	a5,a0,-8
    98a0:	00f997b3          	sll	a5,s3,a5

000098a4 <.LVL193>:
    98a4:	f91ff06f          	j	9834 <.L78>

000098a8 <.L80>:
    98a8:	fe168693          	add	a3,a3,-31
    98ac:	00d7d533          	srl	a0,a5,a3
    98b0:	02000693          	li	a3,32
    98b4:	00000713          	li	a4,0
    98b8:	00d60863          	beq	a2,a3,98c8 <.L81>
    98bc:	04000713          	li	a4,64
    98c0:	40c70733          	sub	a4,a4,a2
    98c4:	00e79733          	sll	a4,a5,a4

000098c8 <.L81>:
    98c8:	00e46733          	or	a4,s0,a4
    98cc:	00e03733          	snez	a4,a4
    98d0:	00e56533          	or	a0,a0,a4

000098d4 <.LVL195>:
    98d4:	00000793          	li	a5,0
    98d8:	f95ff06f          	j	986c <.L149>

000098dc <.L79>:
    98dc:	ff800737          	lui	a4,0xff800
    98e0:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9f4f>
    98e4:	40d484b3          	sub	s1,s1,a3
    98e8:	00e7f7b3          	and	a5,a5,a4
    98ec:	00040513          	mv	a0,s0
    98f0:	bf9ff06f          	j	94e8 <.L5>

000098f4 <.L91>:
    98f4:	00070793          	mv	a5,a4

000098f8 <.LVL200>:
    98f8:	00060513          	mv	a0,a2

000098fc <.LVL201>:
    98fc:	c5dff06f          	j	9558 <.L147>

00009900 <.L95>:
    9900:	00070793          	mv	a5,a4

00009904 <.LVL203>:
    9904:	00060513          	mv	a0,a2

00009908 <.LVL204>:
    9908:	be1ff06f          	j	94e8 <.L5>

0000990c <.L98>:
    990c:	7ff00493          	li	s1,2047

00009910 <.L150>:
    9910:	00000793          	li	a5,0
    9914:	00000513          	li	a0,0
    9918:	0240006f          	j	993c <.L83>

0000991c <.L100>:
    991c:	00080493          	mv	s1,a6

00009920 <.LVL208>:
    9920:	bc9ff06f          	j	94e8 <.L5>

00009924 <.L103>:
    9924:	00070793          	mv	a5,a4

00009928 <.LVL210>:
    9928:	00060513          	mv	a0,a2

0000992c <.LVL211>:
    992c:	00080493          	mv	s1,a6

00009930 <.LVL212>:
    9930:	e41ff06f          	j	9770 <.L148>

00009934 <.L108>:
    9934:	00000793          	li	a5,0

00009938 <.LBE60>:
    9938:	00000913          	li	s2,0

0000993c <.L83>:
  FP_PACK_SEMIRAW_D (r, R);
    993c:	00879713          	sll	a4,a5,0x8
    9940:	00075e63          	bgez	a4,995c <.L86>

00009944 <.LVL216>:
    9944:	00148493          	add	s1,s1,1

00009948 <.LVL217>:
    9948:	7ff00713          	li	a4,2047
    994c:	08e48263          	beq	s1,a4,99d0 <.L113>
    9950:	ff800737          	lui	a4,0xff800
    9954:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9f4f>
    9958:	00e7f7b3          	and	a5,a5,a4

0000995c <.L86>:
    995c:	01d79693          	sll	a3,a5,0x1d
    9960:	00355513          	srl	a0,a0,0x3

00009964 <.LVL219>:
    9964:	7ff00713          	li	a4,2047
    9968:	00a6e6b3          	or	a3,a3,a0

0000996c <.LVL220>:
    996c:	0037d793          	srl	a5,a5,0x3
    9970:	00e49e63          	bne	s1,a4,998c <.L87>

00009974 <.LVL222>:
    9974:	00f6e6b3          	or	a3,a3,a5

00009978 <.LVL223>:
    9978:	00000793          	li	a5,0

0000997c <.LVL224>:
    997c:	00068863          	beqz	a3,998c <.L87>
    9980:	000807b7          	lui	a5,0x80
    9984:	00000693          	li	a3,0
    9988:	00000913          	li	s2,0

0000998c <.L87>:
    998c:	01449713          	sll	a4,s1,0x14
    9990:	7ff00637          	lui	a2,0x7ff00
    9994:	00c79793          	sll	a5,a5,0xc

00009998 <.LVL226>:
    9998:	00c77733          	and	a4,a4,a2

0000999c <.LBE77>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    999c:	01c12083          	lw	ra,28(sp)
    99a0:	01812403          	lw	s0,24(sp)

000099a4 <.LBB78>:
  FP_PACK_SEMIRAW_D (r, R);
    99a4:	00c7d793          	srl	a5,a5,0xc
    99a8:	00f767b3          	or	a5,a4,a5
    99ac:	01f91713          	sll	a4,s2,0x1f
    99b0:	00e7e633          	or	a2,a5,a4

000099b4 <.LBE78>:
}
    99b4:	01412483          	lw	s1,20(sp)
    99b8:	01012903          	lw	s2,16(sp)

000099bc <.LVL228>:
    99bc:	00c12983          	lw	s3,12(sp)
    99c0:	00068513          	mv	a0,a3
    99c4:	00060593          	mv	a1,a2
    99c8:	02010113          	add	sp,sp,32
    99cc:	00008067          	ret

000099d0 <.L113>:
    99d0:	00000793          	li	a5,0

000099d4 <.LVL230>:
    99d4:	00000513          	li	a0,0

000099d8 <.LVL231>:
    99d8:	f85ff06f          	j	995c <.L86>

000099dc <__divdf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__divdf3 (DFtype a, DFtype b)
{
    99dc:	fd010113          	add	sp,sp,-48

000099e0 <.LBB3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
    99e0:	0145d813          	srl	a6,a1,0x14

000099e4 <.LBE3>:
{
    99e4:	02912223          	sw	s1,36(sp)
    99e8:	03212023          	sw	s2,32(sp)
    99ec:	01312e23          	sw	s3,28(sp)
    99f0:	01612823          	sw	s6,16(sp)
    99f4:	01712623          	sw	s7,12(sp)

000099f8 <.LBB4>:
  FP_UNPACK_D (A, a);
    99f8:	00c59493          	sll	s1,a1,0xc

000099fc <.LBE4>:
{
    99fc:	02112623          	sw	ra,44(sp)
    9a00:	02812423          	sw	s0,40(sp)
    9a04:	01412c23          	sw	s4,24(sp)
    9a08:	01512a23          	sw	s5,20(sp)

00009a0c <.LBB5>:
  FP_UNPACK_D (A, a);
    9a0c:	7ff87813          	and	a6,a6,2047

00009a10 <.LBE5>:
{
    9a10:	00050b13          	mv	s6,a0
    9a14:	00060b93          	mv	s7,a2
    9a18:	00068913          	mv	s2,a3

00009a1c <.LBB6>:
  FP_UNPACK_D (A, a);
    9a1c:	00c4d493          	srl	s1,s1,0xc

00009a20 <.LVL1>:
    9a20:	01f5d993          	srl	s3,a1,0x1f

00009a24 <.LBE6>:
    9a24:	0a080263          	beqz	a6,9ac8 <.L2>
    9a28:	7ff00793          	li	a5,2047
    9a2c:	10f80263          	beq	a6,a5,9b30 <.L3>

00009a30 <.LVL3>:
    9a30:	01d55a13          	srl	s4,a0,0x1d
    9a34:	00349493          	sll	s1,s1,0x3

00009a38 <.LVL4>:
    9a38:	009a6a33          	or	s4,s4,s1
    9a3c:	008007b7          	lui	a5,0x800
    9a40:	00fa6a33          	or	s4,s4,a5

00009a44 <.LVL5>:
    9a44:	00351413          	sll	s0,a0,0x3

00009a48 <.LVL6>:
    9a48:	c0180a93          	add	s5,a6,-1023

00009a4c <.L104>:
    9a4c:	00000b13          	li	s6,0

00009a50 <.L4>:
  FP_UNPACK_D (B, b);
    9a50:	01495713          	srl	a4,s2,0x14
    9a54:	00c91493          	sll	s1,s2,0xc
    9a58:	7ff77713          	and	a4,a4,2047
    9a5c:	00c4d493          	srl	s1,s1,0xc

00009a60 <.LVL9>:
    9a60:	01f95913          	srl	s2,s2,0x1f

00009a64 <.LBE11>:
    9a64:	10070463          	beqz	a4,9b6c <.L9>
    9a68:	7ff00793          	li	a5,2047
    9a6c:	16f70863          	beq	a4,a5,9bdc <.L10>

00009a70 <.LVL11>:
    9a70:	00349493          	sll	s1,s1,0x3

00009a74 <.LVL12>:
    9a74:	01dbd793          	srl	a5,s7,0x1d
    9a78:	0097e7b3          	or	a5,a5,s1
    9a7c:	008004b7          	lui	s1,0x800
    9a80:	0097e4b3          	or	s1,a5,s1

00009a84 <.LVL13>:
    9a84:	003b9f13          	sll	t5,s7,0x3

00009a88 <.LVL14>:
    9a88:	c0170713          	add	a4,a4,-1023

00009a8c <.L105>:
    9a8c:	00000793          	li	a5,0

00009a90 <.L11>:
  FP_DIV_D (R, A, B);
    9a90:	40ea8833          	sub	a6,s5,a4
    9a94:	002b1713          	sll	a4,s6,0x2

00009a98 <.LVL17>:
    9a98:	00f76733          	or	a4,a4,a5
    9a9c:	fff70713          	add	a4,a4,-1
    9aa0:	00e00693          	li	a3,14
    9aa4:	0129c633          	xor	a2,s3,s2

00009aa8 <.LVL18>:
    9aa8:	16e6e663          	bltu	a3,a4,9c14 <.L16>
    9aac:	00008697          	auipc	a3,0x8
    9ab0:	1b468693          	add	a3,a3,436 # 11c60 <.L18>
    9ab4:	00271713          	sll	a4,a4,0x2
    9ab8:	00d70733          	add	a4,a4,a3
    9abc:	00072703          	lw	a4,0(a4)
    9ac0:	00d70733          	add	a4,a4,a3
    9ac4:	00070067          	jr	a4

00009ac8 <.L2>:
  FP_UNPACK_D (A, a);
    9ac8:	00a4ea33          	or	s4,s1,a0
    9acc:	060a0e63          	beqz	s4,9b48 <.L71>

00009ad0 <.LBB16>:
    9ad0:	02048e63          	beqz	s1,9b0c <.L5>
    9ad4:	00048513          	mv	a0,s1

00009ad8 <.LVL20>:
    9ad8:	b3df70ef          	jal	1614 <__clzsi2>

00009adc <.LVL21>:
    9adc:	ff550793          	add	a5,a0,-11

00009ae0 <.L6>:
    9ae0:	01d00a13          	li	s4,29
    9ae4:	ff850713          	add	a4,a0,-8
    9ae8:	40fa0a33          	sub	s4,s4,a5
    9aec:	00e494b3          	sll	s1,s1,a4

00009af0 <.LVL23>:
    9af0:	014b5a33          	srl	s4,s6,s4
    9af4:	009a6a33          	or	s4,s4,s1

00009af8 <.LVL24>:
    9af8:	00eb14b3          	sll	s1,s6,a4

00009afc <.L8>:
    9afc:	c0d00813          	li	a6,-1011
    9b00:	40a80ab3          	sub	s5,a6,a0

00009b04 <.LVL26>:
    9b04:	00048413          	mv	s0,s1
    9b08:	f45ff06f          	j	9a4c <.L104>

00009b0c <.L5>:
    9b0c:	b09f70ef          	jal	1614 <__clzsi2>

00009b10 <.LVL28>:
    9b10:	00050a13          	mv	s4,a0

00009b14 <.LVL29>:
    9b14:	015a0793          	add	a5,s4,21
    9b18:	01c00713          	li	a4,28
    9b1c:	02050513          	add	a0,a0,32

00009b20 <.LVL30>:
    9b20:	fcf750e3          	bge	a4,a5,9ae0 <.L6>
    9b24:	ff8a0a13          	add	s4,s4,-8
    9b28:	014b1a33          	sll	s4,s6,s4

00009b2c <.LVL31>:
    9b2c:	fd1ff06f          	j	9afc <.L8>

00009b30 <.L3>:
    9b30:	00a4ea33          	or	s4,s1,a0
    9b34:	020a1263          	bnez	s4,9b58 <.L72>

00009b38 <.LBB17>:
    9b38:	00000413          	li	s0,0
    9b3c:	7ff00a93          	li	s5,2047

00009b40 <.LBE17>:
    9b40:	00200b13          	li	s6,2
    9b44:	f0dff06f          	j	9a50 <.L4>

00009b48 <.L71>:
    9b48:	00000413          	li	s0,0
    9b4c:	00000a93          	li	s5,0

00009b50 <.LBE18>:
    9b50:	00100b13          	li	s6,1
    9b54:	efdff06f          	j	9a50 <.L4>

00009b58 <.L72>:
    9b58:	00050413          	mv	s0,a0

00009b5c <.LBB19>:
    9b5c:	00048a13          	mv	s4,s1
    9b60:	7ff00a93          	li	s5,2047

00009b64 <.LBE19>:
    9b64:	00300b13          	li	s6,3
    9b68:	ee9ff06f          	j	9a50 <.L4>

00009b6c <.L9>:
  FP_UNPACK_D (B, b);
    9b6c:	0174ef33          	or	t5,s1,s7
    9b70:	080f0263          	beqz	t5,9bf4 <.L73>

00009b74 <.LBB20>:
    9b74:	04048063          	beqz	s1,9bb4 <.L12>
    9b78:	00048513          	mv	a0,s1
    9b7c:	a99f70ef          	jal	1614 <__clzsi2>

00009b80 <.LVL34>:
    9b80:	ff550713          	add	a4,a0,-11

00009b84 <.L13>:
    9b84:	01d00793          	li	a5,29
    9b88:	ff850693          	add	a3,a0,-8
    9b8c:	40e787b3          	sub	a5,a5,a4
    9b90:	00d494b3          	sll	s1,s1,a3

00009b94 <.LVL36>:
    9b94:	00fbd7b3          	srl	a5,s7,a5
    9b98:	0097e7b3          	or	a5,a5,s1

00009b9c <.LVL37>:
    9b9c:	00db94b3          	sll	s1,s7,a3

00009ba0 <.L15>:
    9ba0:	c0d00713          	li	a4,-1011

00009ba4 <.LVL39>:
    9ba4:	00048f13          	mv	t5,s1
    9ba8:	40a70733          	sub	a4,a4,a0

00009bac <.LVL40>:
    9bac:	00078493          	mv	s1,a5

00009bb0 <.LVL41>:
    9bb0:	eddff06f          	j	9a8c <.L105>

00009bb4 <.L12>:
    9bb4:	000b8513          	mv	a0,s7
    9bb8:	a5df70ef          	jal	1614 <__clzsi2>

00009bbc <.LVL43>:
    9bbc:	00050793          	mv	a5,a0

00009bc0 <.LVL44>:
    9bc0:	01578713          	add	a4,a5,21 # 800015 <_ebss+0x7e9f65>
    9bc4:	01c00693          	li	a3,28
    9bc8:	02050513          	add	a0,a0,32

00009bcc <.LVL45>:
    9bcc:	fae6dce3          	bge	a3,a4,9b84 <.L13>
    9bd0:	ff878793          	add	a5,a5,-8
    9bd4:	00fb97b3          	sll	a5,s7,a5

00009bd8 <.LVL46>:
    9bd8:	fc9ff06f          	j	9ba0 <.L15>

00009bdc <.L10>:
    9bdc:	0174ef33          	or	t5,s1,s7
    9be0:	020f1263          	bnez	t5,9c04 <.L74>

00009be4 <.LBB21>:
    9be4:	00000493          	li	s1,0

00009be8 <.LVL48>:
    9be8:	7ff00713          	li	a4,2047

00009bec <.LBE21>:
    9bec:	00200793          	li	a5,2
    9bf0:	ea1ff06f          	j	9a90 <.L11>

00009bf4 <.L73>:
    9bf4:	00000493          	li	s1,0

00009bf8 <.LVL51>:
    9bf8:	00000713          	li	a4,0

00009bfc <.LBE22>:
    9bfc:	00100793          	li	a5,1
    9c00:	e91ff06f          	j	9a90 <.L11>

00009c04 <.L74>:
    9c04:	000b8f13          	mv	t5,s7
    9c08:	7ff00713          	li	a4,2047

00009c0c <.LBE23>:
    9c0c:	00300793          	li	a5,3
    9c10:	e81ff06f          	j	9a90 <.L11>

00009c14 <.L16>:
  FP_DIV_D (R, A, B);
    9c14:	0144e663          	bltu	s1,s4,9c20 <.L23>
    9c18:	349a1c63          	bne	s4,s1,9f70 <.L24>
    9c1c:	35e46a63          	bltu	s0,t5,9f70 <.L24>

00009c20 <.L23>:
    9c20:	01fa1693          	sll	a3,s4,0x1f
    9c24:	00145793          	srl	a5,s0,0x1

00009c28 <.LVL57>:
    9c28:	01f41713          	sll	a4,s0,0x1f

00009c2c <.LVL58>:
    9c2c:	001a5a13          	srl	s4,s4,0x1

00009c30 <.LVL59>:
    9c30:	00f6e433          	or	s0,a3,a5

00009c34 <.L25>:
    9c34:	00849893          	sll	a7,s1,0x8
    9c38:	018f5593          	srl	a1,t5,0x18
    9c3c:	0115e5b3          	or	a1,a1,a7

00009c40 <.LBB26>:
    9c40:	0108d893          	srl	a7,a7,0x10
    9c44:	031a5eb3          	divu	t4,s4,a7
    9c48:	01059313          	sll	t1,a1,0x10
    9c4c:	01035313          	srl	t1,t1,0x10
    9c50:	01045793          	srl	a5,s0,0x10

00009c54 <.LBE26>:
    9c54:	008f1513          	sll	a0,t5,0x8

00009c58 <.LBB28>:
    9c58:	031a7a33          	remu	s4,s4,a7

00009c5c <.LVL63>:
    9c5c:	000e8693          	mv	a3,t4
    9c60:	03d30e33          	mul	t3,t1,t4

00009c64 <.LVL64>:
    9c64:	010a1a13          	sll	s4,s4,0x10

00009c68 <.LVL65>:
    9c68:	0147e7b3          	or	a5,a5,s4

00009c6c <.LVL66>:
    9c6c:	01c7fe63          	bgeu	a5,t3,9c88 <.L26>
    9c70:	00f587b3          	add	a5,a1,a5

00009c74 <.LVL67>:
    9c74:	fffe8693          	add	a3,t4,-1

00009c78 <.LVL68>:
    9c78:	00b7e863          	bltu	a5,a1,9c88 <.L26>
    9c7c:	01c7f663          	bgeu	a5,t3,9c88 <.L26>
    9c80:	ffee8693          	add	a3,t4,-2
    9c84:	00b787b3          	add	a5,a5,a1

00009c88 <.L26>:
    9c88:	41c787b3          	sub	a5,a5,t3

00009c8c <.LVL71>:
    9c8c:	0317df33          	divu	t5,a5,a7

00009c90 <.LVL72>:
    9c90:	01041413          	sll	s0,s0,0x10

00009c94 <.LVL73>:
    9c94:	01045413          	srl	s0,s0,0x10
    9c98:	0317f7b3          	remu	a5,a5,a7

00009c9c <.LVL74>:
    9c9c:	000f0e13          	mv	t3,t5

00009ca0 <.LVL75>:
    9ca0:	03e30eb3          	mul	t4,t1,t5

00009ca4 <.LVL76>:
    9ca4:	01079793          	sll	a5,a5,0x10

00009ca8 <.LVL77>:
    9ca8:	00f467b3          	or	a5,s0,a5

00009cac <.LVL78>:
    9cac:	01d7fe63          	bgeu	a5,t4,9cc8 <.L29>
    9cb0:	00f587b3          	add	a5,a1,a5

00009cb4 <.LVL79>:
    9cb4:	ffff0e13          	add	t3,t5,-1

00009cb8 <.LVL80>:
    9cb8:	00b7e863          	bltu	a5,a1,9cc8 <.L29>
    9cbc:	01d7f663          	bgeu	a5,t4,9cc8 <.L29>
    9cc0:	ffef0e13          	add	t3,t5,-2
    9cc4:	00b787b3          	add	a5,a5,a1

00009cc8 <.L29>:
    9cc8:	01069693          	sll	a3,a3,0x10

00009ccc <.LVL83>:
    9ccc:	00010437          	lui	s0,0x10
    9cd0:	01c6e2b3          	or	t0,a3,t3
    9cd4:	fff40e13          	add	t3,s0,-1 # ffff <.LBE193+0x3>

00009cd8 <.LVL84>:
    9cd8:	01c2f6b3          	and	a3,t0,t3

00009cdc <.LBB29>:
    9cdc:	0102df93          	srl	t6,t0,0x10
    9ce0:	01c57e33          	and	t3,a0,t3

00009ce4 <.LBB30>:
    9ce4:	41d787b3          	sub	a5,a5,t4

00009ce8 <.LBB31>:
    9ce8:	01055e93          	srl	t4,a0,0x10

00009cec <.LVL86>:
    9cec:	02de03b3          	mul	t2,t3,a3

00009cf0 <.LVL87>:
    9cf0:	03cf84b3          	mul	s1,t6,t3

00009cf4 <.LVL88>:
    9cf4:	02de86b3          	mul	a3,t4,a3

00009cf8 <.LVL89>:
    9cf8:	00968f33          	add	t5,a3,s1

00009cfc <.LVL90>:
    9cfc:	0103d693          	srl	a3,t2,0x10

00009d00 <.LVL91>:
    9d00:	01e686b3          	add	a3,a3,t5
    9d04:	03df8fb3          	mul	t6,t6,t4

00009d08 <.LVL92>:
    9d08:	0096f463          	bgeu	a3,s1,9d10 <.L32>
    9d0c:	008f8fb3          	add	t6,t6,s0

00009d10 <.L32>:
    9d10:	0106df13          	srl	t5,a3,0x10
    9d14:	01ff0f33          	add	t5,t5,t6

00009d18 <.LVL94>:
    9d18:	00010fb7          	lui	t6,0x10

00009d1c <.LVL95>:
    9d1c:	ffff8f93          	add	t6,t6,-1 # ffff <.LBE193+0x3>
    9d20:	01f6f6b3          	and	a3,a3,t6

00009d24 <.LVL96>:
    9d24:	01069693          	sll	a3,a3,0x10
    9d28:	01f3f3b3          	and	t2,t2,t6

00009d2c <.LVL97>:
    9d2c:	007686b3          	add	a3,a3,t2

00009d30 <.LBE31>:
    9d30:	01e7e863          	bltu	a5,t5,9d40 <.L33>

00009d34 <.LBB32>:
    9d34:	00028493          	mv	s1,t0

00009d38 <.LBE32>:
    9d38:	05e79863          	bne	a5,t5,9d88 <.L34>
    9d3c:	04d77663          	bgeu	a4,a3,9d88 <.L34>

00009d40 <.L33>:
    9d40:	00a70fb3          	add	t6,a4,a0

00009d44 <.LVL100>:
    9d44:	00efb3b3          	sltu	t2,t6,a4

00009d48 <.LBB33>:
    9d48:	00b38433          	add	s0,t2,a1

00009d4c <.LVL101>:
    9d4c:	008787b3          	add	a5,a5,s0

00009d50 <.LBE33>:
    9d50:	fff28493          	add	s1,t0,-1

00009d54 <.LBB34>:
    9d54:	000f8713          	mv	a4,t6

00009d58 <.LBE34>:
    9d58:	00f5e663          	bltu	a1,a5,9d64 <.L37>
    9d5c:	02f59663          	bne	a1,a5,9d88 <.L34>
    9d60:	02039463          	bnez	t2,9d88 <.L34>

00009d64 <.L37>:
    9d64:	01e7e663          	bltu	a5,t5,9d70 <.L38>
    9d68:	02ff1063          	bne	t5,a5,9d88 <.L34>
    9d6c:	00dffe63          	bgeu	t6,a3,9d88 <.L34>

00009d70 <.L38>:
    9d70:	01f50fb3          	add	t6,a0,t6

00009d74 <.LBB35>:
    9d74:	000f8713          	mv	a4,t6

00009d78 <.LVL105>:
    9d78:	00afbfb3          	sltu	t6,t6,a0
    9d7c:	00bf8fb3          	add	t6,t6,a1

00009d80 <.LBE35>:
    9d80:	ffe28493          	add	s1,t0,-2

00009d84 <.LBB36>:
    9d84:	01f787b3          	add	a5,a5,t6

00009d88 <.L34>:
    9d88:	40d706b3          	sub	a3,a4,a3

00009d8c <.LVL108>:
    9d8c:	41e787b3          	sub	a5,a5,t5

00009d90 <.LVL109>:
    9d90:	00d73733          	sltu	a4,a4,a3

00009d94 <.LVL110>:
    9d94:	40e787b3          	sub	a5,a5,a4

00009d98 <.LBE37>:
    9d98:	fff00f13          	li	t5,-1

00009d9c <.LVL112>:
    9d9c:	12f58663          	beq	a1,a5,9ec8 <.L70>

00009da0 <.LBB38>:
    9da0:	0317dfb3          	divu	t6,a5,a7

00009da4 <.LVL114>:
    9da4:	0106d713          	srl	a4,a3,0x10
    9da8:	0317f7b3          	remu	a5,a5,a7

00009dac <.LVL115>:
    9dac:	03f30f33          	mul	t5,t1,t6

00009db0 <.LVL116>:
    9db0:	01079793          	sll	a5,a5,0x10

00009db4 <.LVL117>:
    9db4:	00f767b3          	or	a5,a4,a5

00009db8 <.LVL118>:
    9db8:	000f8713          	mv	a4,t6
    9dbc:	01e7fe63          	bgeu	a5,t5,9dd8 <.L44>
    9dc0:	00f587b3          	add	a5,a1,a5

00009dc4 <.LVL119>:
    9dc4:	ffff8713          	add	a4,t6,-1

00009dc8 <.LVL120>:
    9dc8:	00b7e863          	bltu	a5,a1,9dd8 <.L44>
    9dcc:	01e7f663          	bgeu	a5,t5,9dd8 <.L44>
    9dd0:	ffef8713          	add	a4,t6,-2
    9dd4:	00b787b3          	add	a5,a5,a1

00009dd8 <.L44>:
    9dd8:	41e787b3          	sub	a5,a5,t5

00009ddc <.LVL123>:
    9ddc:	0317df33          	divu	t5,a5,a7

00009de0 <.LVL124>:
    9de0:	01069693          	sll	a3,a3,0x10

00009de4 <.LVL125>:
    9de4:	0106d693          	srl	a3,a3,0x10
    9de8:	0317f7b3          	remu	a5,a5,a7

00009dec <.LVL126>:
    9dec:	000f0893          	mv	a7,t5

00009df0 <.LVL127>:
    9df0:	03e30333          	mul	t1,t1,t5

00009df4 <.LVL128>:
    9df4:	01079793          	sll	a5,a5,0x10

00009df8 <.LVL129>:
    9df8:	00f6e7b3          	or	a5,a3,a5

00009dfc <.LVL130>:
    9dfc:	0067fe63          	bgeu	a5,t1,9e18 <.L47>
    9e00:	00f587b3          	add	a5,a1,a5

00009e04 <.LVL131>:
    9e04:	ffff0893          	add	a7,t5,-1

00009e08 <.LVL132>:
    9e08:	00b7e863          	bltu	a5,a1,9e18 <.L47>
    9e0c:	0067f663          	bgeu	a5,t1,9e18 <.L47>
    9e10:	ffef0893          	add	a7,t5,-2
    9e14:	00b787b3          	add	a5,a5,a1

00009e18 <.L47>:
    9e18:	01071693          	sll	a3,a4,0x10
    9e1c:	0116e6b3          	or	a3,a3,a7
    9e20:	01069713          	sll	a4,a3,0x10

00009e24 <.LVL135>:
    9e24:	01075713          	srl	a4,a4,0x10
    9e28:	406787b3          	sub	a5,a5,t1

00009e2c <.LBB39>:
    9e2c:	0106d313          	srl	t1,a3,0x10

00009e30 <.LVL137>:
    9e30:	03c70f33          	mul	t5,a4,t3

00009e34 <.LVL138>:
    9e34:	03c30e33          	mul	t3,t1,t3

00009e38 <.LVL139>:
    9e38:	026e8333          	mul	t1,t4,t1

00009e3c <.LVL140>:
    9e3c:	02ee8eb3          	mul	t4,t4,a4

00009e40 <.LVL141>:
    9e40:	010f5713          	srl	a4,t5,0x10
    9e44:	01ce8eb3          	add	t4,t4,t3

00009e48 <.LVL142>:
    9e48:	01d70733          	add	a4,a4,t4

00009e4c <.LVL143>:
    9e4c:	01c77663          	bgeu	a4,t3,9e58 <.L50>
    9e50:	000108b7          	lui	a7,0x10

00009e54 <.LVL144>:
    9e54:	01130333          	add	t1,t1,a7

00009e58 <.L50>:
    9e58:	01075893          	srl	a7,a4,0x10
    9e5c:	006888b3          	add	a7,a7,t1

00009e60 <.LVL146>:
    9e60:	00010337          	lui	t1,0x10

00009e64 <.LVL147>:
    9e64:	fff30313          	add	t1,t1,-1 # ffff <.LBE193+0x3>

00009e68 <.LVL148>:
    9e68:	00677733          	and	a4,a4,t1

00009e6c <.LVL149>:
    9e6c:	01071713          	sll	a4,a4,0x10
    9e70:	006f7f33          	and	t5,t5,t1

00009e74 <.LVL150>:
    9e74:	01e70733          	add	a4,a4,t5

00009e78 <.LBE39>:
    9e78:	0117e863          	bltu	a5,a7,9e88 <.L51>
    9e7c:	23179c63          	bne	a5,a7,a0b4 <.L52>

00009e80 <.LBB40>:
    9e80:	00068f13          	mv	t5,a3

00009e84 <.LBE40>:
    9e84:	04070263          	beqz	a4,9ec8 <.L70>

00009e88 <.L51>:
    9e88:	00f587b3          	add	a5,a1,a5

00009e8c <.LVL152>:
    9e8c:	fff68f13          	add	t5,a3,-1

00009e90 <.LBB41>:
    9e90:	00078313          	mv	t1,a5

00009e94 <.LBE41>:
    9e94:	02b7e463          	bltu	a5,a1,9ebc <.L55>
    9e98:	0117e663          	bltu	a5,a7,9ea4 <.L56>
    9e9c:	21179a63          	bne	a5,a7,a0b0 <.L85>
    9ea0:	02e57063          	bgeu	a0,a4,9ec0 <.L57>

00009ea4 <.L56>:
    9ea4:	ffe68f13          	add	t5,a3,-2

00009ea8 <.LBB42>:
    9ea8:	00151693          	sll	a3,a0,0x1

00009eac <.LVL156>:
    9eac:	00a6b333          	sltu	t1,a3,a0

00009eb0 <.LVL157>:
    9eb0:	00b30333          	add	t1,t1,a1
    9eb4:	00678333          	add	t1,a5,t1

00009eb8 <.LVL158>:
    9eb8:	00068513          	mv	a0,a3

00009ebc <.L55>:
    9ebc:	01131463          	bne	t1,a7,9ec4 <.L58>

00009ec0 <.L57>:
    9ec0:	00a70463          	beq	a4,a0,9ec8 <.L70>

00009ec4 <.L58>:
    9ec4:	001f6f13          	or	t5,t5,1

00009ec8 <.L70>:
  FP_PACK_D (r, R);
    9ec8:	3ff80713          	add	a4,a6,1023

00009ecc <.LVL163>:
    9ecc:	10e05263          	blez	a4,9fd0 <.L59>
    9ed0:	007f7793          	and	a5,t5,7
    9ed4:	02078063          	beqz	a5,9ef4 <.L60>
    9ed8:	00ff7793          	and	a5,t5,15
    9edc:	00400693          	li	a3,4
    9ee0:	00d78a63          	beq	a5,a3,9ef4 <.L60>

00009ee4 <.LBB44>:
    9ee4:	004f0793          	add	a5,t5,4
    9ee8:	01e7b6b3          	sltu	a3,a5,t5
    9eec:	00d484b3          	add	s1,s1,a3

00009ef0 <.LVL164>:
    9ef0:	00078f13          	mv	t5,a5

00009ef4 <.L60>:
    9ef4:	00749793          	sll	a5,s1,0x7
    9ef8:	0007da63          	bgez	a5,9f0c <.L63>
    9efc:	ff0007b7          	lui	a5,0xff000
    9f00:	fff78793          	add	a5,a5,-1 # feffffff <_ebss+0xfefe9f4f>
    9f04:	00f4f4b3          	and	s1,s1,a5
    9f08:	40080713          	add	a4,a6,1024

00009f0c <.L63>:
    9f0c:	7fe00793          	li	a5,2046
    9f10:	08e7ca63          	blt	a5,a4,9fa4 <.L21>
    9f14:	003f5f13          	srl	t5,t5,0x3

00009f18 <.LVL168>:
    9f18:	01d49793          	sll	a5,s1,0x1d

00009f1c <.LVL169>:
    9f1c:	01e7ef33          	or	t5,a5,t5

00009f20 <.LVL170>:
    9f20:	0034d513          	srl	a0,s1,0x3

00009f24 <.L22>:
    9f24:	00c51513          	sll	a0,a0,0xc

00009f28 <.LBE47>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    9f28:	02c12083          	lw	ra,44(sp)
    9f2c:	02812403          	lw	s0,40(sp)

00009f30 <.LBB48>:
  FP_PACK_D (r, R);
    9f30:	00c55513          	srl	a0,a0,0xc
    9f34:	01471713          	sll	a4,a4,0x14

00009f38 <.LVL173>:
    9f38:	00a76733          	or	a4,a4,a0
    9f3c:	01f61613          	sll	a2,a2,0x1f

00009f40 <.LVL174>:
    9f40:	00c767b3          	or	a5,a4,a2

00009f44 <.LBE48>:
}
    9f44:	02412483          	lw	s1,36(sp)
    9f48:	02012903          	lw	s2,32(sp)

00009f4c <.LVL176>:
    9f4c:	01c12983          	lw	s3,28(sp)

00009f50 <.LVL177>:
    9f50:	01812a03          	lw	s4,24(sp)
    9f54:	01412a83          	lw	s5,20(sp)

00009f58 <.LVL178>:
    9f58:	01012b03          	lw	s6,16(sp)

00009f5c <.LVL179>:
    9f5c:	00c12b83          	lw	s7,12(sp)
    9f60:	000f0513          	mv	a0,t5
    9f64:	00078593          	mv	a1,a5
    9f68:	03010113          	add	sp,sp,48
    9f6c:	00008067          	ret

00009f70 <.L24>:
  FP_DIV_D (R, A, B);
    9f70:	fff80813          	add	a6,a6,-1

00009f74 <.LVL181>:
    9f74:	00000713          	li	a4,0
    9f78:	cbdff06f          	j	9c34 <.L25>

00009f7c <.L19>:
  FP_UNPACK_D (A, a);
    9f7c:	00098613          	mv	a2,s3

00009f80 <.LBE50>:
  FP_DIV_D (R, A, B);
    9f80:	000a0493          	mv	s1,s4

00009f84 <.LVL184>:
    9f84:	00040f13          	mv	t5,s0

00009f88 <.LVL185>:
    9f88:	000b0793          	mv	a5,s6

00009f8c <.L17>:
  FP_PACK_D (r, R);
    9f8c:	00300713          	li	a4,3
    9f90:	0ee78863          	beq	a5,a4,a080 <.L86>
    9f94:	00100713          	li	a4,1
    9f98:	0ee78e63          	beq	a5,a4,a094 <.L88>
    9f9c:	00200713          	li	a4,2
    9fa0:	f2e794e3          	bne	a5,a4,9ec8 <.L70>

00009fa4 <.L21>:
    9fa4:	00000513          	li	a0,0
    9fa8:	00000f13          	li	t5,0
    9fac:	7ff00713          	li	a4,2047
    9fb0:	f75ff06f          	j	9f24 <.L22>

00009fb4 <.L20>:
  FP_UNPACK_D (B, b);
    9fb4:	00090613          	mv	a2,s2

00009fb8 <.LBE51>:
  FP_DIV_D (R, A, B);
    9fb8:	fd5ff06f          	j	9f8c <.L17>

00009fbc <.L76>:
    9fbc:	000804b7          	lui	s1,0x80

00009fc0 <.LVL191>:
    9fc0:	00000f13          	li	t5,0

00009fc4 <.LVL192>:
    9fc4:	00000613          	li	a2,0

00009fc8 <.LVL193>:
    9fc8:	00300793          	li	a5,3

00009fcc <.LVL194>:
    9fcc:	fc1ff06f          	j	9f8c <.L17>

00009fd0 <.L59>:
  FP_PACK_D (r, R);
    9fd0:	00100513          	li	a0,1
    9fd4:	40e50533          	sub	a0,a0,a4

00009fd8 <.LVL196>:
    9fd8:	03800793          	li	a5,56
    9fdc:	0aa7cc63          	blt	a5,a0,a094 <.L88>
    9fe0:	01f00793          	li	a5,31
    9fe4:	06a7c463          	blt	a5,a0,a04c <.L64>
    9fe8:	41e80813          	add	a6,a6,1054
    9fec:	010497b3          	sll	a5,s1,a6
    9ff0:	00af5733          	srl	a4,t5,a0
    9ff4:	010f1833          	sll	a6,t5,a6
    9ff8:	00e7e7b3          	or	a5,a5,a4
    9ffc:	01003833          	snez	a6,a6
    a000:	0107e7b3          	or	a5,a5,a6

0000a004 <.LVL197>:
    a004:	00a4d533          	srl	a0,s1,a0

0000a008 <.L65>:
    a008:	0077f713          	and	a4,a5,7
    a00c:	02070063          	beqz	a4,a02c <.L67>
    a010:	00f7f713          	and	a4,a5,15
    a014:	00400693          	li	a3,4
    a018:	00d70a63          	beq	a4,a3,a02c <.L67>

0000a01c <.LBB54>:
    a01c:	00478713          	add	a4,a5,4
    a020:	00f736b3          	sltu	a3,a4,a5
    a024:	00d50533          	add	a0,a0,a3

0000a028 <.LVL199>:
    a028:	00070793          	mv	a5,a4

0000a02c <.L67>:
    a02c:	00851713          	sll	a4,a0,0x8
    a030:	06074863          	bltz	a4,a0a0 <.L90>

0000a034 <.LVL201>:
    a034:	01d51f13          	sll	t5,a0,0x1d
    a038:	0037d793          	srl	a5,a5,0x3

0000a03c <.LVL202>:
    a03c:	00ff6f33          	or	t5,t5,a5

0000a040 <.LVL203>:
    a040:	00355513          	srl	a0,a0,0x3

0000a044 <.L106>:
    a044:	00000713          	li	a4,0
    a048:	eddff06f          	j	9f24 <.L22>

0000a04c <.L64>:
    a04c:	fe100793          	li	a5,-31
    a050:	40e787b3          	sub	a5,a5,a4
    a054:	02000693          	li	a3,32
    a058:	00f4d7b3          	srl	a5,s1,a5
    a05c:	00000713          	li	a4,0
    a060:	00d50663          	beq	a0,a3,a06c <.L66>
    a064:	43e80713          	add	a4,a6,1086
    a068:	00e49733          	sll	a4,s1,a4

0000a06c <.L66>:
    a06c:	01e76733          	or	a4,a4,t5
    a070:	00e03733          	snez	a4,a4
    a074:	00e7e7b3          	or	a5,a5,a4

0000a078 <.LVL206>:
    a078:	00000513          	li	a0,0

0000a07c <.LVL207>:
    a07c:	f8dff06f          	j	a008 <.L65>

0000a080 <.L86>:
    a080:	00080537          	lui	a0,0x80
    a084:	00000f13          	li	t5,0

0000a088 <.LVL209>:
    a088:	7ff00713          	li	a4,2047
    a08c:	00000613          	li	a2,0

0000a090 <.LVL210>:
    a090:	e95ff06f          	j	9f24 <.L22>

0000a094 <.L88>:
    a094:	00000513          	li	a0,0
    a098:	00000f13          	li	t5,0
    a09c:	fa9ff06f          	j	a044 <.L106>

0000a0a0 <.L90>:
    a0a0:	00000513          	li	a0,0

0000a0a4 <.LVL213>:
    a0a4:	00000f13          	li	t5,0
    a0a8:	00100713          	li	a4,1
    a0ac:	e79ff06f          	j	9f24 <.L22>

0000a0b0 <.L85>:
  FP_DIV_D (R, A, B);
    a0b0:	000f0693          	mv	a3,t5

0000a0b4 <.L52>:
    a0b4:	00068f13          	mv	t5,a3
    a0b8:	e0dff06f          	j	9ec4 <.L58>

0000a0bc <__eqdf2>:
  FP_DECL_D (A);
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    a0bc:	0145d713          	srl	a4,a1,0x14
    a0c0:	001007b7          	lui	a5,0x100
    a0c4:	fff78793          	add	a5,a5,-1 # fffff <_ebss+0xe9f4f>

0000a0c8 <.LBB3>:
  FP_UNPACK_RAW_D (B, b);
    a0c8:	0146d813          	srl	a6,a3,0x14

0000a0cc <.LBE3>:
{
    a0cc:	00050313          	mv	t1,a0
    a0d0:	00050e93          	mv	t4,a0

0000a0d4 <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    a0d4:	7ff77713          	and	a4,a4,2047

0000a0d8 <.LBE4>:
  FP_CMP_EQ_D (r, A, B, 1);
    a0d8:	7ff00513          	li	a0,2047

0000a0dc <.LBB5>:
  FP_UNPACK_RAW_D (A, a);
    a0dc:	00b7f8b3          	and	a7,a5,a1

0000a0e0 <.LVL3>:
    a0e0:	00060f13          	mv	t5,a2

0000a0e4 <.LBB6>:
  FP_UNPACK_RAW_D (B, b);
    a0e4:	00d7f7b3          	and	a5,a5,a3

0000a0e8 <.LBB7>:
  FP_UNPACK_RAW_D (A, a);
    a0e8:	01f5d593          	srl	a1,a1,0x1f

0000a0ec <.LBB8>:
  FP_UNPACK_RAW_D (B, b);
    a0ec:	7ff87813          	and	a6,a6,2047
    a0f0:	01f6d693          	srl	a3,a3,0x1f

0000a0f4 <.LBE8>:
  FP_CMP_EQ_D (r, A, B, 1);
    a0f4:	00a71c63          	bne	a4,a0,a10c <.L2>
    a0f8:	0068ee33          	or	t3,a7,t1
    a0fc:	00100513          	li	a0,1
    a100:	000e1463          	bnez	t3,a108 <.L1>
    a104:	00e80663          	beq	a6,a4,a110 <.L6>

0000a108 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    a108:	00008067          	ret

0000a10c <.L2>:
  FP_CMP_EQ_D (r, A, B, 1);
    a10c:	00a81863          	bne	a6,a0,a11c <.L5>

0000a110 <.L6>:
    a110:	00c7e633          	or	a2,a5,a2

0000a114 <.LVL9>:
    a114:	00100513          	li	a0,1
    a118:	fe0618e3          	bnez	a2,a108 <.L1>

0000a11c <.L5>:
    a11c:	00100513          	li	a0,1
    a120:	ff0714e3          	bne	a4,a6,a108 <.L1>
    a124:	fef892e3          	bne	a7,a5,a108 <.L1>
    a128:	ffee90e3          	bne	t4,t5,a108 <.L1>
    a12c:	00d58a63          	beq	a1,a3,a140 <.L12>
    a130:	fc071ce3          	bnez	a4,a108 <.L1>
    a134:	0068e8b3          	or	a7,a7,t1

0000a138 <.LVL10>:
    a138:	01103533          	snez	a0,a7
    a13c:	00008067          	ret

0000a140 <.L12>:
    a140:	00000513          	li	a0,0
    a144:	00008067          	ret

0000a148 <__gedf2>:
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
  FP_UNPACK_RAW_D (B, b);
    a148:	0146d793          	srl	a5,a3,0x14

0000a14c <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    a14c:	0145d893          	srl	a7,a1,0x14
    a150:	00100737          	lui	a4,0x100
    a154:	fff70713          	add	a4,a4,-1 # fffff <_ebss+0xe9f4f>

0000a158 <.LBE4>:
{
    a158:	00050813          	mv	a6,a0
    a15c:	00050e13          	mv	t3,a0

0000a160 <.LBB5>:
  FP_UNPACK_RAW_D (A, a);
    a160:	7ff8f893          	and	a7,a7,2047

0000a164 <.LBB6>:
  FP_UNPACK_RAW_D (B, b);
    a164:	7ff7f513          	and	a0,a5,2047

0000a168 <.LBE6>:
  FP_CMP_D (r, A, B, -2, 2);
    a168:	7ff00793          	li	a5,2047

0000a16c <.LBB7>:
  FP_UNPACK_RAW_D (A, a);
    a16c:	00b77333          	and	t1,a4,a1
    a170:	00060e93          	mv	t4,a2

0000a174 <.LBB8>:
  FP_UNPACK_RAW_D (B, b);
    a174:	00d77733          	and	a4,a4,a3

0000a178 <.LBB9>:
  FP_UNPACK_RAW_D (A, a);
    a178:	01f5d593          	srl	a1,a1,0x1f

0000a17c <.LBB10>:
  FP_UNPACK_RAW_D (B, b);
    a17c:	01f6d693          	srl	a3,a3,0x1f

0000a180 <.LBE10>:
  FP_CMP_D (r, A, B, -2, 2);
    a180:	00f89663          	bne	a7,a5,a18c <.L2>
    a184:	010367b3          	or	a5,t1,a6
    a188:	06079c63          	bnez	a5,a200 <.L17>

0000a18c <.L2>:
    a18c:	7ff00793          	li	a5,2047
    a190:	00f51663          	bne	a0,a5,a19c <.L4>
    a194:	00c767b3          	or	a5,a4,a2
    a198:	06079463          	bnez	a5,a200 <.L17>

0000a19c <.L4>:
    a19c:	00000793          	li	a5,0
    a1a0:	00089663          	bnez	a7,a1ac <.L5>
    a1a4:	01036833          	or	a6,t1,a6

0000a1a8 <.LVL6>:
    a1a8:	00183793          	seqz	a5,a6

0000a1ac <.L5>:
    a1ac:	04051e63          	bnez	a0,a208 <.L6>
    a1b0:	00c76633          	or	a2,a4,a2

0000a1b4 <.LVL8>:
    a1b4:	00078c63          	beqz	a5,a1cc <.L7>
    a1b8:	02060063          	beqz	a2,a1d8 <.L1>

0000a1bc <.L38>:
    a1bc:	00100513          	li	a0,1

0000a1c0 <.LVL10>:
    a1c0:	00069c63          	bnez	a3,a1d8 <.L1>

0000a1c4 <.L34>:
    a1c4:	fff00513          	li	a0,-1
    a1c8:	00008067          	ret

0000a1cc <.L7>:
    a1cc:	04061063          	bnez	a2,a20c <.L8>

0000a1d0 <.L12>:
    a1d0:	fff00513          	li	a0,-1

0000a1d4 <.LVL13>:
    a1d4:	04058463          	beqz	a1,a21c <.L33>

0000a1d8 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    a1d8:	00008067          	ret

0000a1dc <.L10>:
  FP_CMP_D (r, A, B, -2, 2);
    a1dc:	fea8c0e3          	blt	a7,a0,a1bc <.L38>
    a1e0:	fe6768e3          	bltu	a4,t1,a1d0 <.L12>
    a1e4:	00e31863          	bne	t1,a4,a1f4 <.L13>
    a1e8:	ffcee4e3          	bltu	t4,t3,a1d0 <.L12>
    a1ec:	00000513          	li	a0,0

0000a1f0 <.LVL15>:
    a1f0:	ffde74e3          	bgeu	t3,t4,a1d8 <.L1>

0000a1f4 <.L13>:
    a1f4:	00100513          	li	a0,1
    a1f8:	fe0590e3          	bnez	a1,a1d8 <.L1>
    a1fc:	fc9ff06f          	j	a1c4 <.L34>

0000a200 <.L17>:
    a200:	ffe00513          	li	a0,-2

0000a204 <.LVL17>:
    a204:	00008067          	ret

0000a208 <.L6>:
    a208:	fa079ae3          	bnez	a5,a1bc <.L38>

0000a20c <.L8>:
    a20c:	fcb692e3          	bne	a3,a1,a1d0 <.L12>
    a210:	fd1556e3          	bge	a0,a7,a1dc <.L10>
    a214:	fff00513          	li	a0,-1

0000a218 <.LVL20>:
    a218:	fc0690e3          	bnez	a3,a1d8 <.L1>

0000a21c <.L33>:
    a21c:	00100513          	li	a0,1
    a220:	00008067          	ret

0000a224 <__muldf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__muldf3 (DFtype a, DFtype b)
{
    a224:	fd010113          	add	sp,sp,-48
    a228:	01512a23          	sw	s5,20(sp)

0000a22c <.LBB3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
    a22c:	0145da93          	srl	s5,a1,0x14

0000a230 <.LBE3>:
{
    a230:	02812423          	sw	s0,40(sp)
    a234:	02912223          	sw	s1,36(sp)
    a238:	01312e23          	sw	s3,28(sp)
    a23c:	01412c23          	sw	s4,24(sp)
    a240:	01612823          	sw	s6,16(sp)

0000a244 <.LBB4>:
  FP_UNPACK_D (A, a);
    a244:	00c59493          	sll	s1,a1,0xc

0000a248 <.LBE4>:
{
    a248:	02112623          	sw	ra,44(sp)
    a24c:	03212023          	sw	s2,32(sp)
    a250:	01712623          	sw	s7,12(sp)

0000a254 <.LBB5>:
  FP_UNPACK_D (A, a);
    a254:	7ffafa93          	and	s5,s5,2047

0000a258 <.LBE5>:
{
    a258:	00050413          	mv	s0,a0
    a25c:	00060b13          	mv	s6,a2
    a260:	00068993          	mv	s3,a3

0000a264 <.LBB6>:
  FP_UNPACK_D (A, a);
    a264:	00c4d493          	srl	s1,s1,0xc

0000a268 <.LVL1>:
    a268:	01f5da13          	srl	s4,a1,0x1f

0000a26c <.LBE6>:
    a26c:	240a8e63          	beqz	s5,a4c8 <.L2>
    a270:	7ff00793          	li	a5,2047
    a274:	2cfa8063          	beq	s5,a5,a534 <.L3>

0000a278 <.LVL3>:
    a278:	00349493          	sll	s1,s1,0x3
    a27c:	01d55793          	srl	a5,a0,0x1d
    a280:	0097e7b3          	or	a5,a5,s1
    a284:	008004b7          	lui	s1,0x800

0000a288 <.LVL4>:
    a288:	0097e4b3          	or	s1,a5,s1

0000a28c <.LVL5>:
    a28c:	00351913          	sll	s2,a0,0x3

0000a290 <.LVL6>:
    a290:	c01a8a93          	add	s5,s5,-1023

0000a294 <.L79>:
    a294:	00000b93          	li	s7,0

0000a298 <.L4>:
  FP_UNPACK_D (B, b);
    a298:	0149d713          	srl	a4,s3,0x14
    a29c:	00c99413          	sll	s0,s3,0xc
    a2a0:	7ff77713          	and	a4,a4,2047
    a2a4:	00c45413          	srl	s0,s0,0xc

0000a2a8 <.LVL9>:
    a2a8:	01f9d993          	srl	s3,s3,0x1f

0000a2ac <.LBE11>:
    a2ac:	2c070063          	beqz	a4,a56c <.L9>
    a2b0:	7ff00793          	li	a5,2047
    a2b4:	32f70463          	beq	a4,a5,a5dc <.L10>
    a2b8:	00341413          	sll	s0,s0,0x3
    a2bc:	01db5793          	srl	a5,s6,0x1d
    a2c0:	0087e7b3          	or	a5,a5,s0
    a2c4:	00800437          	lui	s0,0x800

0000a2c8 <.LVL11>:
    a2c8:	0087e433          	or	s0,a5,s0

0000a2cc <.LVL12>:
    a2cc:	c0170693          	add	a3,a4,-1023
    a2d0:	003b1793          	sll	a5,s6,0x3

0000a2d4 <.L80>:
    a2d4:	00000713          	li	a4,0

0000a2d8 <.L11>:
  FP_MUL_D (R, A, B);
    a2d8:	00da8ab3          	add	s5,s5,a3

0000a2dc <.LVL15>:
    a2dc:	002b9693          	sll	a3,s7,0x2

0000a2e0 <.LVL16>:
    a2e0:	00e6e6b3          	or	a3,a3,a4
    a2e4:	00a00613          	li	a2,10
    a2e8:	001a8513          	add	a0,s5,1

0000a2ec <.LVL17>:
    a2ec:	40d64663          	blt	a2,a3,a6f8 <.L16>
    a2f0:	00200613          	li	a2,2
    a2f4:	013a45b3          	xor	a1,s4,s3
    a2f8:	30d64e63          	blt	a2,a3,a614 <.L17>
    a2fc:	fff68693          	add	a3,a3,-1
    a300:	00100613          	li	a2,1
    a304:	32d67a63          	bgeu	a2,a3,a638 <.L19>

0000a308 <.L18>:
    a308:	00010337          	lui	t1,0x10
    a30c:	fff30e13          	add	t3,t1,-1 # ffff <.LBE193+0x3>
    a310:	01095713          	srl	a4,s2,0x10

0000a314 <.LVL19>:
    a314:	0107d893          	srl	a7,a5,0x10

0000a318 <.LVL20>:
    a318:	01c97933          	and	s2,s2,t3

0000a31c <.LVL21>:
    a31c:	01c7ff33          	and	t5,a5,t3
    a320:	03e907b3          	mul	a5,s2,t5

0000a324 <.LVL22>:
    a324:	03e70eb3          	mul	t4,a4,t5

0000a328 <.LVL23>:
    a328:	0107d813          	srl	a6,a5,0x10
    a32c:	03288633          	mul	a2,a7,s2

0000a330 <.LVL24>:
    a330:	01d60633          	add	a2,a2,t4

0000a334 <.LVL25>:
    a334:	00c80833          	add	a6,a6,a2
    a338:	031706b3          	mul	a3,a4,a7

0000a33c <.LVL26>:
    a33c:	01d87463          	bgeu	a6,t4,a344 <.L23>
    a340:	006686b3          	add	a3,a3,t1

0000a344 <.L23>:
    a344:	01085293          	srl	t0,a6,0x10
    a348:	01c87833          	and	a6,a6,t3

0000a34c <.LVL28>:
    a34c:	01c7f7b3          	and	a5,a5,t3

0000a350 <.LBB20>:
    a350:	01045613          	srl	a2,s0,0x10

0000a354 <.LVL30>:
    a354:	01c47e33          	and	t3,s0,t3

0000a358 <.LBB21>:
    a358:	01081813          	sll	a6,a6,0x10
    a35c:	00f80833          	add	a6,a6,a5

0000a360 <.LBB22>:
    a360:	03c90eb3          	mul	t4,s2,t3

0000a364 <.LVL32>:
    a364:	03c707b3          	mul	a5,a4,t3

0000a368 <.LVL33>:
    a368:	03260933          	mul	s2,a2,s2

0000a36c <.LVL34>:
    a36c:	02c70333          	mul	t1,a4,a2

0000a370 <.LVL35>:
    a370:	00f90933          	add	s2,s2,a5

0000a374 <.LVL36>:
    a374:	010ed713          	srl	a4,t4,0x10

0000a378 <.LVL37>:
    a378:	01270733          	add	a4,a4,s2

0000a37c <.LVL38>:
    a37c:	00f77663          	bgeu	a4,a5,a388 <.L24>
    a380:	000107b7          	lui	a5,0x10

0000a384 <.LVL39>:
    a384:	00f30333          	add	t1,t1,a5

0000a388 <.L24>:
    a388:	00010437          	lui	s0,0x10
    a38c:	01075793          	srl	a5,a4,0x10
    a390:	fff40f93          	add	t6,s0,-1 # ffff <.LBE193+0x3>
    a394:	00678333          	add	t1,a5,t1

0000a398 <.LVL41>:
    a398:	01f777b3          	and	a5,a4,t6
    a39c:	01fefeb3          	and	t4,t4,t6

0000a3a0 <.LVL42>:
    a3a0:	01079793          	sll	a5,a5,0x10
    a3a4:	01f4ffb3          	and	t6,s1,t6
    a3a8:	01d787b3          	add	a5,a5,t4

0000a3ac <.LBB23>:
    a3ac:	0104de93          	srl	t4,s1,0x10
    a3b0:	03ff03b3          	mul	t2,t5,t6
    a3b4:	00f282b3          	add	t0,t0,a5

0000a3b8 <.LBB24>:
    a3b8:	03ee8f33          	mul	t5,t4,t5

0000a3bc <.LVL44>:
    a3bc:	0103d713          	srl	a4,t2,0x10

0000a3c0 <.LVL45>:
    a3c0:	03d884b3          	mul	s1,a7,t4

0000a3c4 <.LVL46>:
    a3c4:	03f888b3          	mul	a7,a7,t6

0000a3c8 <.LVL47>:
    a3c8:	01e888b3          	add	a7,a7,t5

0000a3cc <.LVL48>:
    a3cc:	01170733          	add	a4,a4,a7

0000a3d0 <.LVL49>:
    a3d0:	01e77463          	bgeu	a4,t5,a3d8 <.L25>
    a3d4:	008484b3          	add	s1,s1,s0

0000a3d8 <.L25>:
    a3d8:	01075f13          	srl	t5,a4,0x10

0000a3dc <.LVL51>:
    a3dc:	009f0f33          	add	t5,t5,s1

0000a3e0 <.LVL52>:
    a3e0:	000104b7          	lui	s1,0x10

0000a3e4 <.LVL53>:
    a3e4:	fff48413          	add	s0,s1,-1 # ffff <.LBE193+0x3>
    a3e8:	00877733          	and	a4,a4,s0

0000a3ec <.LVL54>:
    a3ec:	0083f3b3          	and	t2,t2,s0

0000a3f0 <.LVL55>:
    a3f0:	01071713          	sll	a4,a4,0x10
    a3f4:	007708b3          	add	a7,a4,t2

0000a3f8 <.LBB25>:
    a3f8:	03fe03b3          	mul	t2,t3,t6

0000a3fc <.LVL57>:
    a3fc:	03ce8e33          	mul	t3,t4,t3

0000a400 <.LVL58>:
    a400:	03d60eb3          	mul	t4,a2,t4

0000a404 <.LVL59>:
    a404:	03f60633          	mul	a2,a2,t6

0000a408 <.LVL60>:
    a408:	0103df93          	srl	t6,t2,0x10
    a40c:	01c60633          	add	a2,a2,t3

0000a410 <.LVL61>:
    a410:	00cf8fb3          	add	t6,t6,a2

0000a414 <.LVL62>:
    a414:	01cff463          	bgeu	t6,t3,a41c <.L26>
    a418:	009e8eb3          	add	t4,t4,s1

0000a41c <.L26>:
    a41c:	008ff733          	and	a4,t6,s0
    a420:	0083f3b3          	and	t2,t2,s0

0000a424 <.LVL64>:
    a424:	01071713          	sll	a4,a4,0x10

0000a428 <.LBB28>:
    a428:	005686b3          	add	a3,a3,t0

0000a42c <.LBB29>:
    a42c:	00770733          	add	a4,a4,t2
    a430:	00670333          	add	t1,a4,t1

0000a434 <.LBB30>:
    a434:	00f6b7b3          	sltu	a5,a3,a5

0000a438 <.LVL67>:
    a438:	00f307b3          	add	a5,t1,a5
    a43c:	00e33633          	sltu	a2,t1,a4

0000a440 <.LVL68>:
    a440:	011688b3          	add	a7,a3,a7

0000a444 <.LVL69>:
    a444:	0067b333          	sltu	t1,a5,t1
    a448:	00666633          	or	a2,a2,t1

0000a44c <.LBB31>:
    a44c:	00d8b6b3          	sltu	a3,a7,a3
    a450:	01e78333          	add	t1,a5,t5
    a454:	00d306b3          	add	a3,t1,a3
    a458:	00f33733          	sltu	a4,t1,a5

0000a45c <.LBB32>:
    a45c:	010fdf93          	srl	t6,t6,0x10

0000a460 <.LBB33>:
    a460:	0066b333          	sltu	t1,a3,t1

0000a464 <.LBB38>:
    a464:	00989793          	sll	a5,a7,0x9
    a468:	01f60633          	add	a2,a2,t6

0000a46c <.LBB34>:
    a46c:	00676733          	or	a4,a4,t1
    a470:	00c70733          	add	a4,a4,a2

0000a474 <.LBB41>:
    a474:	0107e7b3          	or	a5,a5,a6

0000a478 <.LBB37>:
    a478:	01d70733          	add	a4,a4,t4

0000a47c <.LBB42>:
    a47c:	00f037b3          	snez	a5,a5

0000a480 <.LVL74>:
    a480:	0178d893          	srl	a7,a7,0x17

0000a484 <.LVL75>:
    a484:	00971713          	sll	a4,a4,0x9
    a488:	0176d413          	srl	s0,a3,0x17

0000a48c <.LBE42>:
    a48c:	0117e7b3          	or	a5,a5,a7

0000a490 <.LBB43>:
    a490:	00969693          	sll	a3,a3,0x9

0000a494 <.LBE43>:
    a494:	00d7e7b3          	or	a5,a5,a3

0000a498 <.LBE17>:
    a498:	00771693          	sll	a3,a4,0x7

0000a49c <.LBB44>:
    a49c:	00876433          	or	s0,a4,s0

0000a4a0 <.LBE44>:
    a4a0:	0206d063          	bgez	a3,a4c0 <.L37>
    a4a4:	0017d713          	srl	a4,a5,0x1
    a4a8:	0017f793          	and	a5,a5,1
    a4ac:	00f76733          	or	a4,a4,a5
    a4b0:	01f41793          	sll	a5,s0,0x1f

0000a4b4 <.LVL78>:
    a4b4:	00f767b3          	or	a5,a4,a5

0000a4b8 <.LVL79>:
    a4b8:	00145413          	srl	s0,s0,0x1

0000a4bc <.LVL80>:
    a4bc:	00050a93          	mv	s5,a0

0000a4c0 <.L37>:
    a4c0:	000a8513          	mv	a0,s5
    a4c4:	18c0006f          	j	a650 <.L50>

0000a4c8 <.L2>:
  FP_UNPACK_D (A, a);
    a4c8:	00a4e933          	or	s2,s1,a0
    a4cc:	08090063          	beqz	s2,a54c <.L51>

0000a4d0 <.LBB54>:
    a4d0:	04048063          	beqz	s1,a510 <.L5>
    a4d4:	00048513          	mv	a0,s1

0000a4d8 <.LVL83>:
    a4d8:	93cf70ef          	jal	1614 <__clzsi2>

0000a4dc <.LVL84>:
    a4dc:	ff550713          	add	a4,a0,-11 # 7fff5 <_ebss+0x69f45>

0000a4e0 <.L6>:
    a4e0:	01d00793          	li	a5,29
    a4e4:	ff850693          	add	a3,a0,-8
    a4e8:	40e787b3          	sub	a5,a5,a4
    a4ec:	00d494b3          	sll	s1,s1,a3
    a4f0:	00f457b3          	srl	a5,s0,a5
    a4f4:	0097e7b3          	or	a5,a5,s1

0000a4f8 <.LVL86>:
    a4f8:	00d414b3          	sll	s1,s0,a3

0000a4fc <.L8>:
    a4fc:	c0d00a93          	li	s5,-1011

0000a500 <.LVL88>:
    a500:	00048913          	mv	s2,s1
    a504:	40aa8ab3          	sub	s5,s5,a0

0000a508 <.LVL89>:
    a508:	00078493          	mv	s1,a5
    a50c:	d89ff06f          	j	a294 <.L79>

0000a510 <.L5>:
    a510:	904f70ef          	jal	1614 <__clzsi2>

0000a514 <.LVL91>:
    a514:	00050793          	mv	a5,a0

0000a518 <.LVL92>:
    a518:	01578713          	add	a4,a5,21 # 10015 <.L111+0x1>
    a51c:	01c00693          	li	a3,28
    a520:	02050513          	add	a0,a0,32

0000a524 <.LVL93>:
    a524:	fae6dee3          	bge	a3,a4,a4e0 <.L6>
    a528:	ff878793          	add	a5,a5,-8
    a52c:	00f417b3          	sll	a5,s0,a5

0000a530 <.LVL94>:
    a530:	fcdff06f          	j	a4fc <.L8>

0000a534 <.L3>:
    a534:	00a4e933          	or	s2,s1,a0
    a538:	02091263          	bnez	s2,a55c <.L52>

0000a53c <.LBB55>:
    a53c:	00000493          	li	s1,0
    a540:	7ff00a93          	li	s5,2047

0000a544 <.LBE55>:
    a544:	00200b93          	li	s7,2
    a548:	d51ff06f          	j	a298 <.L4>

0000a54c <.L51>:
    a54c:	00000493          	li	s1,0
    a550:	00000a93          	li	s5,0

0000a554 <.LBE56>:
    a554:	00100b93          	li	s7,1
    a558:	d41ff06f          	j	a298 <.L4>

0000a55c <.L52>:
    a55c:	00050913          	mv	s2,a0
    a560:	7ff00a93          	li	s5,2047

0000a564 <.LBE57>:
    a564:	00300b93          	li	s7,3
    a568:	d31ff06f          	j	a298 <.L4>

0000a56c <.L9>:
  FP_UNPACK_D (B, b);
    a56c:	016467b3          	or	a5,s0,s6
    a570:	08078263          	beqz	a5,a5f4 <.L53>

0000a574 <.LBB58>:
    a574:	04040063          	beqz	s0,a5b4 <.L12>
    a578:	00040513          	mv	a0,s0
    a57c:	898f70ef          	jal	1614 <__clzsi2>

0000a580 <.LVL103>:
    a580:	ff550693          	add	a3,a0,-11

0000a584 <.L13>:
    a584:	01d00713          	li	a4,29
    a588:	ff850793          	add	a5,a0,-8
    a58c:	40d70733          	sub	a4,a4,a3
    a590:	00f41433          	sll	s0,s0,a5
    a594:	00eb5733          	srl	a4,s6,a4
    a598:	00876733          	or	a4,a4,s0

0000a59c <.LVL105>:
    a59c:	00fb1433          	sll	s0,s6,a5

0000a5a0 <.L15>:
    a5a0:	c0d00693          	li	a3,-1011

0000a5a4 <.LVL107>:
    a5a4:	00040793          	mv	a5,s0
    a5a8:	40a686b3          	sub	a3,a3,a0

0000a5ac <.LVL108>:
    a5ac:	00070413          	mv	s0,a4
    a5b0:	d25ff06f          	j	a2d4 <.L80>

0000a5b4 <.L12>:
    a5b4:	000b0513          	mv	a0,s6
    a5b8:	85cf70ef          	jal	1614 <__clzsi2>

0000a5bc <.LVL110>:
    a5bc:	00050793          	mv	a5,a0

0000a5c0 <.LVL111>:
    a5c0:	01578693          	add	a3,a5,21
    a5c4:	01c00713          	li	a4,28
    a5c8:	02050513          	add	a0,a0,32

0000a5cc <.LVL112>:
    a5cc:	fad75ce3          	bge	a4,a3,a584 <.L13>
    a5d0:	ff878793          	add	a5,a5,-8
    a5d4:	00fb1733          	sll	a4,s6,a5

0000a5d8 <.LVL113>:
    a5d8:	fc9ff06f          	j	a5a0 <.L15>

0000a5dc <.L10>:
    a5dc:	016467b3          	or	a5,s0,s6
    a5e0:	02079263          	bnez	a5,a604 <.L54>

0000a5e4 <.LBB59>:
    a5e4:	00000413          	li	s0,0
    a5e8:	7ff00693          	li	a3,2047

0000a5ec <.LBE59>:
    a5ec:	00200713          	li	a4,2

0000a5f0 <.LVL116>:
    a5f0:	ce9ff06f          	j	a2d8 <.L11>

0000a5f4 <.L53>:
    a5f4:	00000413          	li	s0,0
    a5f8:	00000693          	li	a3,0

0000a5fc <.LBE60>:
    a5fc:	00100713          	li	a4,1

0000a600 <.LVL118>:
    a600:	cd9ff06f          	j	a2d8 <.L11>

0000a604 <.L54>:
    a604:	000b0793          	mv	a5,s6
    a608:	7ff00693          	li	a3,2047

0000a60c <.LBE61>:
    a60c:	00300713          	li	a4,3

0000a610 <.LVL120>:
    a610:	cc9ff06f          	j	a2d8 <.L11>

0000a614 <.L17>:
    a614:	00100613          	li	a2,1
    a618:	00d61633          	sll	a2,a2,a3
  FP_MUL_D (R, A, B);
    a61c:	53067693          	and	a3,a2,1328
    a620:	0e069663          	bnez	a3,a70c <.L55>
    a624:	24067813          	and	a6,a2,576
    a628:	1a081a63          	bnez	a6,a7dc <.L56>
    a62c:	08867613          	and	a2,a2,136
    a630:	cc060ce3          	beqz	a2,a308 <.L18>

0000a634 <.L21>:
  FP_UNPACK_D (B, b);
    a634:	00098593          	mv	a1,s3

0000a638 <.L19>:
  FP_PACK_D (r, R);
    a638:	00200693          	li	a3,2
    a63c:	18d70863          	beq	a4,a3,a7cc <.L38>
    a640:	00300693          	li	a3,3
    a644:	1ad70463          	beq	a4,a3,a7ec <.L58>
    a648:	00100693          	li	a3,1
    a64c:	1ad70663          	beq	a4,a3,a7f8 <.L60>

0000a650 <.L50>:
    a650:	3ff50613          	add	a2,a0,1023

0000a654 <.LVL124>:
    a654:	0cc05463          	blez	a2,a71c <.L39>
    a658:	0077f713          	and	a4,a5,7
    a65c:	02070063          	beqz	a4,a67c <.L40>
    a660:	00f7f713          	and	a4,a5,15
    a664:	00400693          	li	a3,4
    a668:	00d70a63          	beq	a4,a3,a67c <.L40>

0000a66c <.LBB63>:
    a66c:	00478713          	add	a4,a5,4
    a670:	00f736b3          	sltu	a3,a4,a5

0000a674 <.LVL125>:
    a674:	00d40433          	add	s0,s0,a3
    a678:	00070793          	mv	a5,a4

0000a67c <.L40>:
    a67c:	00741713          	sll	a4,s0,0x7
    a680:	00075a63          	bgez	a4,a694 <.L43>
    a684:	ff000737          	lui	a4,0xff000
    a688:	fff70713          	add	a4,a4,-1 # feffffff <_ebss+0xfefe9f4f>

0000a68c <.LVL127>:
    a68c:	00e47433          	and	s0,s0,a4

0000a690 <.LVL128>:
    a690:	40050613          	add	a2,a0,1024

0000a694 <.L43>:
    a694:	7fe00713          	li	a4,2046
    a698:	12c74a63          	blt	a4,a2,a7cc <.L38>
    a69c:	0037d793          	srl	a5,a5,0x3
    a6a0:	01d41693          	sll	a3,s0,0x1d
    a6a4:	00f6e6b3          	or	a3,a3,a5
    a6a8:	00345713          	srl	a4,s0,0x3

0000a6ac <.L20>:
    a6ac:	00c71713          	sll	a4,a4,0xc

0000a6b0 <.LBE66>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    a6b0:	02c12083          	lw	ra,44(sp)
    a6b4:	02812403          	lw	s0,40(sp)

0000a6b8 <.LBB67>:
  FP_PACK_D (r, R);
    a6b8:	01461613          	sll	a2,a2,0x14

0000a6bc <.LVL132>:
    a6bc:	00c75713          	srl	a4,a4,0xc
    a6c0:	01f59593          	sll	a1,a1,0x1f

0000a6c4 <.LVL133>:
    a6c4:	00e66633          	or	a2,a2,a4
    a6c8:	00b667b3          	or	a5,a2,a1

0000a6cc <.LBE67>:
}
    a6cc:	02412483          	lw	s1,36(sp)
    a6d0:	02012903          	lw	s2,32(sp)
    a6d4:	01c12983          	lw	s3,28(sp)

0000a6d8 <.LVL135>:
    a6d8:	01812a03          	lw	s4,24(sp)

0000a6dc <.LVL136>:
    a6dc:	01412a83          	lw	s5,20(sp)
    a6e0:	01012b03          	lw	s6,16(sp)
    a6e4:	00c12b83          	lw	s7,12(sp)

0000a6e8 <.LVL137>:
    a6e8:	00068513          	mv	a0,a3
    a6ec:	00078593          	mv	a1,a5
    a6f0:	03010113          	add	sp,sp,48
    a6f4:	00008067          	ret

0000a6f8 <.L16>:
  FP_MUL_D (R, A, B);
    a6f8:	00f00613          	li	a2,15
    a6fc:	0ec68863          	beq	a3,a2,a7ec <.L58>
    a700:	00b00613          	li	a2,11

0000a704 <.LBB68>:
  FP_UNPACK_D (A, a);
    a704:	000a0593          	mv	a1,s4

0000a708 <.LBE68>:
  FP_MUL_D (R, A, B);
    a708:	f2c686e3          	beq	a3,a2,a634 <.L21>

0000a70c <.L55>:
    a70c:	00048413          	mv	s0,s1

0000a710 <.LVL140>:
    a710:	00090793          	mv	a5,s2
    a714:	000b8713          	mv	a4,s7

0000a718 <.LVL141>:
    a718:	f21ff06f          	j	a638 <.L19>

0000a71c <.L39>:
  FP_PACK_D (r, R);
    a71c:	00100713          	li	a4,1
    a720:	40c70733          	sub	a4,a4,a2

0000a724 <.LVL143>:
    a724:	03800693          	li	a3,56
    a728:	0ce6c863          	blt	a3,a4,a7f8 <.L60>
    a72c:	01f00693          	li	a3,31
    a730:	06e6c463          	blt	a3,a4,a798 <.L44>
    a734:	41e50513          	add	a0,a0,1054
    a738:	00e7d633          	srl	a2,a5,a4
    a73c:	00a416b3          	sll	a3,s0,a0
    a740:	00a79533          	sll	a0,a5,a0
    a744:	00c6e6b3          	or	a3,a3,a2
    a748:	00a03533          	snez	a0,a0
    a74c:	00a6e7b3          	or	a5,a3,a0

0000a750 <.LVL144>:
    a750:	00e45733          	srl	a4,s0,a4

0000a754 <.L45>:
    a754:	0077f693          	and	a3,a5,7
    a758:	02068063          	beqz	a3,a778 <.L47>
    a75c:	00f7f693          	and	a3,a5,15
    a760:	00400613          	li	a2,4
    a764:	00c68a63          	beq	a3,a2,a778 <.L47>

0000a768 <.LBB71>:
    a768:	00478693          	add	a3,a5,4
    a76c:	00f6b633          	sltu	a2,a3,a5
    a770:	00c70733          	add	a4,a4,a2

0000a774 <.LVL146>:
    a774:	00068793          	mv	a5,a3

0000a778 <.L47>:
    a778:	00871693          	sll	a3,a4,0x8
    a77c:	0806c463          	bltz	a3,a804 <.L62>

0000a780 <.LVL148>:
    a780:	01d71693          	sll	a3,a4,0x1d
    a784:	0037d793          	srl	a5,a5,0x3

0000a788 <.LVL149>:
    a788:	00f6e6b3          	or	a3,a3,a5

0000a78c <.LVL150>:
    a78c:	00375713          	srl	a4,a4,0x3

0000a790 <.L82>:
    a790:	00000613          	li	a2,0
    a794:	f19ff06f          	j	a6ac <.L20>

0000a798 <.L44>:
    a798:	fe100693          	li	a3,-31
    a79c:	40c686b3          	sub	a3,a3,a2
    a7a0:	02000813          	li	a6,32
    a7a4:	00d456b3          	srl	a3,s0,a3
    a7a8:	00000613          	li	a2,0
    a7ac:	01070663          	beq	a4,a6,a7b8 <.L46>
    a7b0:	43e50613          	add	a2,a0,1086
    a7b4:	00c41633          	sll	a2,s0,a2

0000a7b8 <.L46>:
    a7b8:	00f66633          	or	a2,a2,a5
    a7bc:	00c03633          	snez	a2,a2
    a7c0:	00c6e7b3          	or	a5,a3,a2

0000a7c4 <.LVL153>:
    a7c4:	00000713          	li	a4,0

0000a7c8 <.LVL154>:
    a7c8:	f8dff06f          	j	a754 <.L45>

0000a7cc <.L38>:
    a7cc:	00000713          	li	a4,0
    a7d0:	00000693          	li	a3,0
    a7d4:	7ff00613          	li	a2,2047
    a7d8:	ed5ff06f          	j	a6ac <.L20>

0000a7dc <.L56>:
  FP_MUL_D (R, A, B);
    a7dc:	00080737          	lui	a4,0x80

0000a7e0 <.L81>:
  FP_PACK_D (r, R);
    a7e0:	7ff00613          	li	a2,2047
    a7e4:	00000593          	li	a1,0
    a7e8:	ec5ff06f          	j	a6ac <.L20>

0000a7ec <.L58>:
    a7ec:	00080737          	lui	a4,0x80
    a7f0:	00000693          	li	a3,0
    a7f4:	fedff06f          	j	a7e0 <.L81>

0000a7f8 <.L60>:
    a7f8:	00000713          	li	a4,0
    a7fc:	00000693          	li	a3,0
    a800:	f91ff06f          	j	a790 <.L82>

0000a804 <.L62>:
    a804:	00000713          	li	a4,0

0000a808 <.LVL160>:
    a808:	00000693          	li	a3,0
    a80c:	00100613          	li	a2,1
    a810:	e9dff06f          	j	a6ac <.L20>

0000a814 <__subdf3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
    a814:	00100837          	lui	a6,0x100
    a818:	fff80813          	add	a6,a6,-1 # fffff <_ebss+0xe9f4f>

0000a81c <.LBE2>:
{
    a81c:	fe010113          	add	sp,sp,-32

0000a820 <.LBB3>:
  FP_UNPACK_SEMIRAW_D (A, a);
    a820:	00b878b3          	and	a7,a6,a1

0000a824 <.LVL1>:
    a824:	0145d713          	srl	a4,a1,0x14

0000a828 <.LBE3>:
    a828:	01d55793          	srl	a5,a0,0x1d

0000a82c <.LBB5>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a82c:	00d87833          	and	a6,a6,a3

0000a830 <.LBE5>:
{
    a830:	01212823          	sw	s2,16(sp)

0000a834 <.LBB6>:
  FP_UNPACK_SEMIRAW_D (A, a);
    a834:	7ff77913          	and	s2,a4,2047

0000a838 <.LBE6>:
    a838:	00389713          	sll	a4,a7,0x3

0000a83c <.LBB8>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a83c:	0146d893          	srl	a7,a3,0x14

0000a840 <.LBE8>:
{
    a840:	00912a23          	sw	s1,20(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
    a844:	00e7e7b3          	or	a5,a5,a4

0000a848 <.LBB10>:
    a848:	01f5d493          	srl	s1,a1,0x1f

0000a84c <.LBE10>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a84c:	01d65713          	srl	a4,a2,0x1d
    a850:	00381813          	sll	a6,a6,0x3
{
    a854:	00112e23          	sw	ra,28(sp)
    a858:	00812c23          	sw	s0,24(sp)
    a85c:	01312623          	sw	s3,12(sp)

0000a860 <.LBB13>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a860:	7ff8f893          	and	a7,a7,2047

0000a864 <.LBE13>:
  FP_SUB_D (R, A, B);
    a864:	7ff00593          	li	a1,2047
  FP_UNPACK_SEMIRAW_D (A, a);
    a868:	00351513          	sll	a0,a0,0x3

0000a86c <.LBB15>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a86c:	01f6d693          	srl	a3,a3,0x1f

0000a870 <.LBE15>:
    a870:	01076733          	or	a4,a4,a6

0000a874 <.LVL7>:
    a874:	00361613          	sll	a2,a2,0x3

0000a878 <.LVL8>:
  FP_SUB_D (R, A, B);
    a878:	00b89663          	bne	a7,a1,a884 <.L2>
    a87c:	00c765b3          	or	a1,a4,a2
    a880:	00059463          	bnez	a1,a888 <.L3>

0000a884 <.L2>:
    a884:	0016c693          	xor	a3,a3,1

0000a888 <.L3>:
    a888:	41190833          	sub	a6,s2,a7

0000a88c <.LBE17>:
    a88c:	2a969a63          	bne	a3,s1,ab40 <.L4>

0000a890 <.LBB33>:
    a890:	11005c63          	blez	a6,a9a8 <.L5>

0000a894 <.LVL11>:
    a894:	04089063          	bnez	a7,a8d4 <.L6>
    a898:	00c766b3          	or	a3,a4,a2

0000a89c <.LVL12>:
    a89c:	66068063          	beqz	a3,aefc <.L102>
    a8a0:	fff80593          	add	a1,a6,-1

0000a8a4 <.LVL13>:
    a8a4:	02059063          	bnez	a1,a8c4 <.L8>

0000a8a8 <.L148>:
    a8a8:	00c50633          	add	a2,a0,a2

0000a8ac <.LVL15>:
    a8ac:	00a636b3          	sltu	a3,a2,a0
    a8b0:	00e78733          	add	a4,a5,a4

0000a8b4 <.LVL16>:
    a8b4:	00060513          	mv	a0,a2

0000a8b8 <.LVL17>:
    a8b8:	00d707b3          	add	a5,a4,a3

0000a8bc <.LBE18>:
    a8bc:	00100913          	li	s2,1

0000a8c0 <.LVL19>:
    a8c0:	06c0006f          	j	a92c <.L11>

0000a8c4 <.L8>:
    a8c4:	7ff00693          	li	a3,2047
    a8c8:	02d81063          	bne	a6,a3,a8e8 <.L12>

0000a8cc <.L112>:
    a8cc:	7ff00913          	li	s2,2047

0000a8d0 <.LVL22>:
    a8d0:	1f80006f          	j	aac8 <.L7>

0000a8d4 <.L6>:
    a8d4:	7ff00693          	li	a3,2047

0000a8d8 <.LVL24>:
    a8d8:	1ed90863          	beq	s2,a3,aac8 <.L7>
    a8dc:	008006b7          	lui	a3,0x800
    a8e0:	00d76733          	or	a4,a4,a3
    a8e4:	00080593          	mv	a1,a6

0000a8e8 <.L12>:
    a8e8:	03800693          	li	a3,56
    a8ec:	0ab6c863          	blt	a3,a1,a99c <.L13>
    a8f0:	01f00693          	li	a3,31
    a8f4:	06b6ca63          	blt	a3,a1,a968 <.L14>
    a8f8:	02000813          	li	a6,32
    a8fc:	40b80833          	sub	a6,a6,a1
    a900:	010716b3          	sll	a3,a4,a6
    a904:	00b658b3          	srl	a7,a2,a1

0000a908 <.LVL27>:
    a908:	01061833          	sll	a6,a2,a6
    a90c:	0116e6b3          	or	a3,a3,a7
    a910:	01003833          	snez	a6,a6
    a914:	0106e6b3          	or	a3,a3,a6

0000a918 <.LVL28>:
    a918:	00b755b3          	srl	a1,a4,a1

0000a91c <.L15>:
    a91c:	00a68533          	add	a0,a3,a0

0000a920 <.LVL30>:
    a920:	00f585b3          	add	a1,a1,a5

0000a924 <.LVL31>:
    a924:	00d536b3          	sltu	a3,a0,a3

0000a928 <.LVL32>:
    a928:	00d587b3          	add	a5,a1,a3

0000a92c <.L11>:
    a92c:	00879713          	sll	a4,a5,0x8
    a930:	18075c63          	bgez	a4,aac8 <.L7>

0000a934 <.LVL34>:
    a934:	00190913          	add	s2,s2,1

0000a938 <.LVL35>:
    a938:	7ff00713          	li	a4,2047
    a93c:	5ae90a63          	beq	s2,a4,aef0 <.L155>
    a940:	ff800737          	lui	a4,0xff800
    a944:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9f4f>
    a948:	00e7f733          	and	a4,a5,a4
    a94c:	00155793          	srl	a5,a0,0x1

0000a950 <.LVL36>:
    a950:	00157513          	and	a0,a0,1
    a954:	00a7e7b3          	or	a5,a5,a0
    a958:	01f71513          	sll	a0,a4,0x1f
    a95c:	00f56533          	or	a0,a0,a5
    a960:	00175793          	srl	a5,a4,0x1
    a964:	1640006f          	j	aac8 <.L7>

0000a968 <.L14>:
    a968:	fe058693          	add	a3,a1,-32
    a96c:	02000893          	li	a7,32

0000a970 <.LVL38>:
    a970:	00d756b3          	srl	a3,a4,a3
    a974:	00000813          	li	a6,0
    a978:	01158863          	beq	a1,a7,a988 <.L16>
    a97c:	04000813          	li	a6,64
    a980:	40b80833          	sub	a6,a6,a1
    a984:	01071833          	sll	a6,a4,a6

0000a988 <.L16>:
    a988:	00c86833          	or	a6,a6,a2
    a98c:	01003833          	snez	a6,a6
    a990:	0106e6b3          	or	a3,a3,a6

0000a994 <.L146>:
    a994:	00000593          	li	a1,0

0000a998 <.LVL40>:
    a998:	f85ff06f          	j	a91c <.L15>

0000a99c <.L13>:
    a99c:	00c766b3          	or	a3,a4,a2
    a9a0:	00d036b3          	snez	a3,a3
    a9a4:	ff1ff06f          	j	a994 <.L146>

0000a9a8 <.L5>:
    a9a8:	0c080a63          	beqz	a6,aa7c <.L19>
    a9ac:	412886b3          	sub	a3,a7,s2

0000a9b0 <.LVL43>:
    a9b0:	02091463          	bnez	s2,a9d8 <.L20>
    a9b4:	00a7e5b3          	or	a1,a5,a0
    a9b8:	50058e63          	beqz	a1,aed4 <.L93>
    a9bc:	fff68593          	add	a1,a3,-1 # 7fffff <_ebss+0x7e9f4f>

0000a9c0 <.LVL44>:
    a9c0:	ee0584e3          	beqz	a1,a8a8 <.L148>
    a9c4:	7ff00813          	li	a6,2047
    a9c8:	03069263          	bne	a3,a6,a9ec <.L24>

0000a9cc <.L98>:
    a9cc:	00070793          	mv	a5,a4

0000a9d0 <.LVL46>:
    a9d0:	00060513          	mv	a0,a2

0000a9d4 <.LVL47>:
    a9d4:	ef9ff06f          	j	a8cc <.L112>

0000a9d8 <.L20>:
    a9d8:	7ff00593          	li	a1,2047
    a9dc:	feb888e3          	beq	a7,a1,a9cc <.L98>
    a9e0:	008005b7          	lui	a1,0x800
    a9e4:	00b7e7b3          	or	a5,a5,a1
    a9e8:	00068593          	mv	a1,a3

0000a9ec <.L24>:
    a9ec:	03800693          	li	a3,56
    a9f0:	08b6c063          	blt	a3,a1,aa70 <.L25>
    a9f4:	01f00693          	li	a3,31
    a9f8:	04b6c263          	blt	a3,a1,aa3c <.L26>
    a9fc:	02000813          	li	a6,32
    aa00:	40b80833          	sub	a6,a6,a1
    aa04:	010796b3          	sll	a3,a5,a6
    aa08:	00b55333          	srl	t1,a0,a1
    aa0c:	01051833          	sll	a6,a0,a6
    aa10:	0066e6b3          	or	a3,a3,t1
    aa14:	01003833          	snez	a6,a6
    aa18:	0106e6b3          	or	a3,a3,a6

0000aa1c <.LVL51>:
    aa1c:	00b7d5b3          	srl	a1,a5,a1

0000aa20 <.L27>:
    aa20:	00c68633          	add	a2,a3,a2

0000aa24 <.LVL53>:
    aa24:	00e585b3          	add	a1,a1,a4

0000aa28 <.LVL54>:
    aa28:	00d636b3          	sltu	a3,a2,a3

0000aa2c <.LVL55>:
    aa2c:	00060513          	mv	a0,a2

0000aa30 <.LVL56>:
    aa30:	00d587b3          	add	a5,a1,a3

0000aa34 <.LBE25>:
    aa34:	00088913          	mv	s2,a7

0000aa38 <.LVL58>:
    aa38:	ef5ff06f          	j	a92c <.L11>

0000aa3c <.L26>:
    aa3c:	fe058693          	add	a3,a1,-32 # 7fffe0 <_ebss+0x7e9f30>
    aa40:	02000313          	li	t1,32
    aa44:	00d7d6b3          	srl	a3,a5,a3
    aa48:	00000813          	li	a6,0
    aa4c:	00658863          	beq	a1,t1,aa5c <.L28>
    aa50:	04000813          	li	a6,64
    aa54:	40b80833          	sub	a6,a6,a1
    aa58:	01079833          	sll	a6,a5,a6

0000aa5c <.L28>:
    aa5c:	00a86833          	or	a6,a6,a0
    aa60:	01003833          	snez	a6,a6
    aa64:	0106e6b3          	or	a3,a3,a6

0000aa68 <.L147>:
    aa68:	00000593          	li	a1,0

0000aa6c <.LVL61>:
    aa6c:	fb5ff06f          	j	aa20 <.L27>

0000aa70 <.L25>:
    aa70:	00a7e6b3          	or	a3,a5,a0
    aa74:	00d036b3          	snez	a3,a3
    aa78:	ff1ff06f          	j	aa68 <.L147>

0000aa7c <.L19>:
    aa7c:	00190693          	add	a3,s2,1

0000aa80 <.LVL64>:
    aa80:	7fe6f593          	and	a1,a3,2046
    aa84:	08059663          	bnez	a1,ab10 <.L31>
    aa88:	00a7e6b3          	or	a3,a5,a0
    aa8c:	06091263          	bnez	s2,aaf0 <.L32>

0000aa90 <.LVL65>:
    aa90:	44068863          	beqz	a3,aee0 <.L97>
    aa94:	00c766b3          	or	a3,a4,a2
    aa98:	02068863          	beqz	a3,aac8 <.L7>

0000aa9c <.LBB27>:
    aa9c:	00c50633          	add	a2,a0,a2

0000aaa0 <.LVL66>:
    aaa0:	00a636b3          	sltu	a3,a2,a0
    aaa4:	00e78733          	add	a4,a5,a4

0000aaa8 <.LVL67>:
    aaa8:	00d707b3          	add	a5,a4,a3

0000aaac <.LBE27>:
    aaac:	00879713          	sll	a4,a5,0x8

0000aab0 <.LBB28>:
    aab0:	00060513          	mv	a0,a2

0000aab4 <.LBE28>:
    aab4:	00075a63          	bgez	a4,aac8 <.L7>
    aab8:	ff800737          	lui	a4,0xff800
    aabc:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9f4f>
    aac0:	00e7f7b3          	and	a5,a5,a4

0000aac4 <.LVL70>:
    aac4:	00100913          	li	s2,1

0000aac8 <.L7>:
  FP_PACK_SEMIRAW_D (r, R);
    aac8:	00757713          	and	a4,a0,7
    aacc:	44070863          	beqz	a4,af1c <.L85>
    aad0:	00f57713          	and	a4,a0,15
    aad4:	00400693          	li	a3,4
    aad8:	44d70263          	beq	a4,a3,af1c <.L85>

0000aadc <.LBB62>:
    aadc:	00450713          	add	a4,a0,4
    aae0:	00a736b3          	sltu	a3,a4,a0
    aae4:	00d787b3          	add	a5,a5,a3

0000aae8 <.LVL72>:
    aae8:	00070513          	mv	a0,a4

0000aaec <.LVL73>:
    aaec:	4300006f          	j	af1c <.L85>

0000aaf0 <.L32>:
  FP_SUB_D (R, A, B);
    aaf0:	ec068ee3          	beqz	a3,a9cc <.L98>
    aaf4:	00c76633          	or	a2,a4,a2

0000aaf8 <.LVL75>:
    aaf8:	dc060ae3          	beqz	a2,a8cc <.L112>

0000aafc <.L111>:
    aafc:	00000493          	li	s1,0

0000ab00 <.LVL77>:
    ab00:	004007b7          	lui	a5,0x400

0000ab04 <.LVL78>:
    ab04:	00000513          	li	a0,0

0000ab08 <.LVL79>:
    ab08:	7ff00913          	li	s2,2047

0000ab0c <.LVL80>:
    ab0c:	4100006f          	j	af1c <.L85>

0000ab10 <.L31>:
    ab10:	7ff00593          	li	a1,2047
    ab14:	3cb68c63          	beq	a3,a1,aeec <.L100>
    ab18:	00c50633          	add	a2,a0,a2

0000ab1c <.LBB31>:
    ab1c:	00a63533          	sltu	a0,a2,a0

0000ab20 <.LVL83>:
    ab20:	00e78733          	add	a4,a5,a4

0000ab24 <.LVL84>:
    ab24:	00a70733          	add	a4,a4,a0

0000ab28 <.LBE31>:
    ab28:	01f71513          	sll	a0,a4,0x1f
    ab2c:	00165613          	srl	a2,a2,0x1

0000ab30 <.LVL85>:
    ab30:	00c56533          	or	a0,a0,a2
    ab34:	00175793          	srl	a5,a4,0x1

0000ab38 <.L152>:
    ab38:	00068913          	mv	s2,a3

0000ab3c <.LVL87>:
    ab3c:	f8dff06f          	j	aac8 <.L7>

0000ab40 <.L4>:
    ab40:	0f005c63          	blez	a6,ac38 <.L37>

0000ab44 <.LVL89>:
    ab44:	08089e63          	bnez	a7,abe0 <.L38>
    ab48:	00c766b3          	or	a3,a4,a2

0000ab4c <.LVL90>:
    ab4c:	3a068863          	beqz	a3,aefc <.L102>
    ab50:	fff80693          	add	a3,a6,-1

0000ab54 <.LVL91>:
    ab54:	02069063          	bnez	a3,ab74 <.L39>

0000ab58 <.LBB36>:
    ab58:	40c50633          	sub	a2,a0,a2

0000ab5c <.LVL92>:
    ab5c:	00c536b3          	sltu	a3,a0,a2

0000ab60 <.LVL93>:
    ab60:	40e78733          	sub	a4,a5,a4

0000ab64 <.LVL94>:
    ab64:	00060513          	mv	a0,a2

0000ab68 <.LVL95>:
    ab68:	40d707b3          	sub	a5,a4,a3

0000ab6c <.L151>:
    ab6c:	00100913          	li	s2,1

0000ab70 <.LVL97>:
    ab70:	0540006f          	j	abc4 <.L42>

0000ab74 <.L39>:
    ab74:	7ff00593          	li	a1,2047
    ab78:	d4b80ae3          	beq	a6,a1,a8cc <.L112>

0000ab7c <.L43>:
    ab7c:	03800593          	li	a1,56
    ab80:	0ad5c663          	blt	a1,a3,ac2c <.L44>
    ab84:	01f00593          	li	a1,31
    ab88:	06d5c863          	blt	a1,a3,abf8 <.L45>
    ab8c:	02000813          	li	a6,32
    ab90:	40d80833          	sub	a6,a6,a3
    ab94:	00d658b3          	srl	a7,a2,a3

0000ab98 <.LVL100>:
    ab98:	010715b3          	sll	a1,a4,a6
    ab9c:	01061833          	sll	a6,a2,a6
    aba0:	0115e5b3          	or	a1,a1,a7
    aba4:	01003833          	snez	a6,a6
    aba8:	0105e633          	or	a2,a1,a6
    abac:	00d756b3          	srl	a3,a4,a3

0000abb0 <.L46>:
    abb0:	40c50633          	sub	a2,a0,a2

0000abb4 <.LVL103>:
    abb4:	00c53733          	sltu	a4,a0,a2
    abb8:	40d786b3          	sub	a3,a5,a3

0000abbc <.LVL104>:
    abbc:	00060513          	mv	a0,a2

0000abc0 <.LVL105>:
    abc0:	40e687b3          	sub	a5,a3,a4

0000abc4 <.L42>:
    abc4:	00879713          	sll	a4,a5,0x8
    abc8:	f00750e3          	bgez	a4,aac8 <.L7>

0000abcc <.LBB39>:
    abcc:	00800437          	lui	s0,0x800
    abd0:	fff40413          	add	s0,s0,-1 # 7fffff <_ebss+0x7e9f4f>
    abd4:	0087f433          	and	s0,a5,s0

0000abd8 <.LVL107>:
    abd8:	00050993          	mv	s3,a0
    abdc:	2100006f          	j	adec <.L76>

0000abe0 <.L38>:
    abe0:	7ff00693          	li	a3,2047

0000abe4 <.LVL109>:
    abe4:	eed902e3          	beq	s2,a3,aac8 <.L7>
    abe8:	008006b7          	lui	a3,0x800
    abec:	00d76733          	or	a4,a4,a3
    abf0:	00080693          	mv	a3,a6
    abf4:	f89ff06f          	j	ab7c <.L43>

0000abf8 <.L45>:
    abf8:	fe068593          	add	a1,a3,-32 # 7fffe0 <_ebss+0x7e9f30>
    abfc:	02000893          	li	a7,32

0000ac00 <.LVL112>:
    ac00:	00b755b3          	srl	a1,a4,a1
    ac04:	00000813          	li	a6,0
    ac08:	01168863          	beq	a3,a7,ac18 <.L47>
    ac0c:	04000813          	li	a6,64
    ac10:	40d80833          	sub	a6,a6,a3
    ac14:	01071833          	sll	a6,a4,a6

0000ac18 <.L47>:
    ac18:	00c86833          	or	a6,a6,a2
    ac1c:	01003833          	snez	a6,a6
    ac20:	0105e633          	or	a2,a1,a6

0000ac24 <.L149>:
    ac24:	00000693          	li	a3,0

0000ac28 <.LVL114>:
    ac28:	f89ff06f          	j	abb0 <.L46>

0000ac2c <.L44>:
    ac2c:	00c76633          	or	a2,a4,a2

0000ac30 <.LVL116>:
    ac30:	00c03633          	snez	a2,a2
    ac34:	ff1ff06f          	j	ac24 <.L149>

0000ac38 <.L37>:
    ac38:	0e080863          	beqz	a6,ad28 <.L50>
    ac3c:	41288833          	sub	a6,a7,s2

0000ac40 <.LVL118>:
    ac40:	04091263          	bnez	s2,ac84 <.L51>
    ac44:	00a7e5b3          	or	a1,a5,a0
    ac48:	2a058e63          	beqz	a1,af04 <.L105>
    ac4c:	fff80593          	add	a1,a6,-1

0000ac50 <.LVL119>:
    ac50:	00059e63          	bnez	a1,ac6c <.L52>

0000ac54 <.LBB45>:
    ac54:	40a60533          	sub	a0,a2,a0

0000ac58 <.LVL121>:
    ac58:	40f70733          	sub	a4,a4,a5

0000ac5c <.LVL122>:
    ac5c:	00a63633          	sltu	a2,a2,a0

0000ac60 <.LVL123>:
    ac60:	40c707b3          	sub	a5,a4,a2

0000ac64 <.LBE45>:
    ac64:	00068493          	mv	s1,a3

0000ac68 <.LVL125>:
    ac68:	f05ff06f          	j	ab6c <.L151>

0000ac6c <.L52>:
    ac6c:	7ff00313          	li	t1,2047
    ac70:	02681463          	bne	a6,t1,ac98 <.L55>

0000ac74 <.L107>:
    ac74:	00070793          	mv	a5,a4

0000ac78 <.LVL128>:
    ac78:	00060513          	mv	a0,a2

0000ac7c <.LVL129>:
    ac7c:	7ff00913          	li	s2,2047

0000ac80 <.LVL130>:
    ac80:	0d00006f          	j	ad50 <.L153>

0000ac84 <.L51>:
    ac84:	7ff00593          	li	a1,2047
    ac88:	feb886e3          	beq	a7,a1,ac74 <.L107>
    ac8c:	008005b7          	lui	a1,0x800
    ac90:	00b7e7b3          	or	a5,a5,a1
    ac94:	00080593          	mv	a1,a6

0000ac98 <.L55>:
    ac98:	03800813          	li	a6,56
    ac9c:	08b84063          	blt	a6,a1,ad1c <.L56>
    aca0:	01f00813          	li	a6,31
    aca4:	04b84263          	blt	a6,a1,ace8 <.L57>
    aca8:	02000313          	li	t1,32
    acac:	40b30333          	sub	t1,t1,a1
    acb0:	00b55e33          	srl	t3,a0,a1
    acb4:	00679833          	sll	a6,a5,t1
    acb8:	00651333          	sll	t1,a0,t1
    acbc:	01c86833          	or	a6,a6,t3
    acc0:	00603333          	snez	t1,t1
    acc4:	00686533          	or	a0,a6,t1
    acc8:	00b7d5b3          	srl	a1,a5,a1

0000accc <.L58>:
    accc:	40a60533          	sub	a0,a2,a0

0000acd0 <.LVL136>:
    acd0:	40b705b3          	sub	a1,a4,a1

0000acd4 <.LVL137>:
    acd4:	00a63633          	sltu	a2,a2,a0

0000acd8 <.LVL138>:
    acd8:	40c587b3          	sub	a5,a1,a2

0000acdc <.LBE47>:
    acdc:	00088913          	mv	s2,a7

0000ace0 <.LVL140>:
    ace0:	00068493          	mv	s1,a3

0000ace4 <.LVL141>:
    ace4:	ee1ff06f          	j	abc4 <.L42>

0000ace8 <.L57>:
    ace8:	fe058813          	add	a6,a1,-32 # 7fffe0 <_ebss+0x7e9f30>
    acec:	02000e13          	li	t3,32
    acf0:	0107d833          	srl	a6,a5,a6
    acf4:	00000313          	li	t1,0
    acf8:	01c58863          	beq	a1,t3,ad08 <.L59>
    acfc:	04000313          	li	t1,64
    ad00:	40b30333          	sub	t1,t1,a1
    ad04:	00679333          	sll	t1,a5,t1

0000ad08 <.L59>:
    ad08:	00a36333          	or	t1,t1,a0
    ad0c:	00603333          	snez	t1,t1
    ad10:	00686533          	or	a0,a6,t1

0000ad14 <.L150>:
    ad14:	00000593          	li	a1,0

0000ad18 <.LVL144>:
    ad18:	fb5ff06f          	j	accc <.L58>

0000ad1c <.L56>:
    ad1c:	00a7e533          	or	a0,a5,a0

0000ad20 <.LVL146>:
    ad20:	00a03533          	snez	a0,a0
    ad24:	ff1ff06f          	j	ad14 <.L150>

0000ad28 <.L50>:
    ad28:	00190593          	add	a1,s2,1
    ad2c:	7fe5f593          	and	a1,a1,2046
    ad30:	08059663          	bnez	a1,adbc <.L62>

0000ad34 <.LBE69>:
    ad34:	00c765b3          	or	a1,a4,a2

0000ad38 <.LBB70>:
    ad38:	00a7e833          	or	a6,a5,a0

0000ad3c <.LBB71>:
    ad3c:	06091063          	bnez	s2,ad9c <.L63>

0000ad40 <.LVL148>:
    ad40:	00081c63          	bnez	a6,ad58 <.L64>

0000ad44 <.LVL149>:
    ad44:	10058e63          	beqz	a1,ae60 <.L156>
    ad48:	00070793          	mv	a5,a4

0000ad4c <.LVL150>:
    ad4c:	00060513          	mv	a0,a2

0000ad50 <.L153>:
    ad50:	00068493          	mv	s1,a3

0000ad54 <.LVL152>:
    ad54:	d75ff06f          	j	aac8 <.L7>

0000ad58 <.L64>:
    ad58:	d60588e3          	beqz	a1,aac8 <.L7>

0000ad5c <.LBB49>:
    ad5c:	40c50833          	sub	a6,a0,a2

0000ad60 <.LVL154>:
    ad60:	010538b3          	sltu	a7,a0,a6

0000ad64 <.LVL155>:
    ad64:	40e785b3          	sub	a1,a5,a4
    ad68:	411585b3          	sub	a1,a1,a7

0000ad6c <.LBE49>:
    ad6c:	00859893          	sll	a7,a1,0x8
    ad70:	0008dc63          	bgez	a7,ad88 <.L67>

0000ad74 <.LBB50>:
    ad74:	40a60533          	sub	a0,a2,a0

0000ad78 <.LVL158>:
    ad78:	40f70733          	sub	a4,a4,a5

0000ad7c <.LVL159>:
    ad7c:	00a63633          	sltu	a2,a2,a0

0000ad80 <.LVL160>:
    ad80:	40c707b3          	sub	a5,a4,a2

0000ad84 <.LBE50>:
    ad84:	fcdff06f          	j	ad50 <.L153>

0000ad88 <.L67>:
    ad88:	00b86533          	or	a0,a6,a1

0000ad8c <.LVL163>:
    ad8c:	18050463          	beqz	a0,af14 <.L110>

0000ad90 <.LBB51>:
    ad90:	00058793          	mv	a5,a1

0000ad94 <.LVL164>:
    ad94:	00080513          	mv	a0,a6
    ad98:	d31ff06f          	j	aac8 <.L7>

0000ad9c <.L63>:
    ad9c:	00081c63          	bnez	a6,adb4 <.L70>
    ada0:	d4058ee3          	beqz	a1,aafc <.L111>
    ada4:	00070793          	mv	a5,a4

0000ada8 <.LVL166>:
    ada8:	00060513          	mv	a0,a2

0000adac <.LVL167>:
    adac:	00068493          	mv	s1,a3

0000adb0 <.LVL168>:
    adb0:	b1dff06f          	j	a8cc <.L112>

0000adb4 <.L70>:
    adb4:	b0058ce3          	beqz	a1,a8cc <.L112>
    adb8:	d45ff06f          	j	aafc <.L111>

0000adbc <.L62>:
    adbc:	40c505b3          	sub	a1,a0,a2
    adc0:	00b53833          	sltu	a6,a0,a1
    adc4:	40e78433          	sub	s0,a5,a4
    adc8:	41040433          	sub	s0,s0,a6

0000adcc <.LBE52>:
    adcc:	00841813          	sll	a6,s0,0x8

0000add0 <.LBB53>:
    add0:	00058993          	mv	s3,a1

0000add4 <.LBE53>:
    add4:	08085063          	bgez	a6,ae54 <.L73>

0000add8 <.LBB54>:
    add8:	40a609b3          	sub	s3,a2,a0

0000addc <.LVL173>:
    addc:	40f70433          	sub	s0,a4,a5

0000ade0 <.LVL174>:
    ade0:	01363633          	sltu	a2,a2,s3

0000ade4 <.LVL175>:
    ade4:	40c40433          	sub	s0,s0,a2

0000ade8 <.LBE54>:
    ade8:	00068493          	mv	s1,a3

0000adec <.L76>:
    adec:	06040e63          	beqz	s0,ae68 <.L77>
    adf0:	00040513          	mv	a0,s0
    adf4:	821f60ef          	jal	1614 <__clzsi2>

0000adf8 <.LVL178>:
    adf8:	ff850693          	add	a3,a0,-8

0000adfc <.L78>:
    adfc:	02000793          	li	a5,32
    ae00:	40d787b3          	sub	a5,a5,a3
    ae04:	00d41433          	sll	s0,s0,a3

0000ae08 <.LVL180>:
    ae08:	00f9d7b3          	srl	a5,s3,a5
    ae0c:	0087e7b3          	or	a5,a5,s0

0000ae10 <.LVL181>:
    ae10:	00d99433          	sll	s0,s3,a3

0000ae14 <.L80>:
    ae14:	0b26c463          	blt	a3,s2,aebc <.L81>
    ae18:	412686b3          	sub	a3,a3,s2

0000ae1c <.LVL183>:
    ae1c:	00168613          	add	a2,a3,1

0000ae20 <.LVL184>:
    ae20:	01f00713          	li	a4,31
    ae24:	06c74263          	blt	a4,a2,ae88 <.L82>
    ae28:	02000713          	li	a4,32
    ae2c:	40c70733          	sub	a4,a4,a2
    ae30:	00e79533          	sll	a0,a5,a4
    ae34:	00c456b3          	srl	a3,s0,a2
    ae38:	00e41733          	sll	a4,s0,a4
    ae3c:	00d56533          	or	a0,a0,a3
    ae40:	00e03733          	snez	a4,a4
    ae44:	00e56533          	or	a0,a0,a4

0000ae48 <.LVL185>:
    ae48:	00c7d7b3          	srl	a5,a5,a2

0000ae4c <.L154>:
    ae4c:	00000913          	li	s2,0

0000ae50 <.LVL187>:
    ae50:	c79ff06f          	j	aac8 <.L7>

0000ae54 <.L73>:
    ae54:	0085e5b3          	or	a1,a1,s0

0000ae58 <.LVL189>:
    ae58:	f8059ae3          	bnez	a1,adec <.L76>
    ae5c:	00000913          	li	s2,0

0000ae60 <.L156>:
    ae60:	00000493          	li	s1,0

0000ae64 <.LVL191>:
    ae64:	08c0006f          	j	aef0 <.L155>

0000ae68 <.L77>:
    ae68:	00098513          	mv	a0,s3
    ae6c:	fa8f60ef          	jal	1614 <__clzsi2>

0000ae70 <.LVL193>:
    ae70:	01850693          	add	a3,a0,24

0000ae74 <.LVL194>:
    ae74:	01f00793          	li	a5,31
    ae78:	f8d7d2e3          	bge	a5,a3,adfc <.L78>
    ae7c:	ff850793          	add	a5,a0,-8
    ae80:	00f997b3          	sll	a5,s3,a5

0000ae84 <.LVL195>:
    ae84:	f91ff06f          	j	ae14 <.L80>

0000ae88 <.L82>:
    ae88:	fe168693          	add	a3,a3,-31
    ae8c:	00d7d533          	srl	a0,a5,a3
    ae90:	02000693          	li	a3,32
    ae94:	00000713          	li	a4,0
    ae98:	00d60863          	beq	a2,a3,aea8 <.L83>
    ae9c:	04000713          	li	a4,64
    aea0:	40c70733          	sub	a4,a4,a2
    aea4:	00e79733          	sll	a4,a5,a4

0000aea8 <.L83>:
    aea8:	00e46733          	or	a4,s0,a4
    aeac:	00e03733          	snez	a4,a4
    aeb0:	00e56533          	or	a0,a0,a4

0000aeb4 <.LVL197>:
    aeb4:	00000793          	li	a5,0
    aeb8:	f95ff06f          	j	ae4c <.L154>

0000aebc <.L81>:
    aebc:	ff800737          	lui	a4,0xff800
    aec0:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9f4f>
    aec4:	40d90933          	sub	s2,s2,a3
    aec8:	00e7f7b3          	and	a5,a5,a4
    aecc:	00040513          	mv	a0,s0
    aed0:	bf9ff06f          	j	aac8 <.L7>

0000aed4 <.L93>:
    aed4:	00070793          	mv	a5,a4

0000aed8 <.LVL202>:
    aed8:	00060513          	mv	a0,a2

0000aedc <.LVL203>:
    aedc:	c5dff06f          	j	ab38 <.L152>

0000aee0 <.L97>:
    aee0:	00070793          	mv	a5,a4

0000aee4 <.LVL205>:
    aee4:	00060513          	mv	a0,a2

0000aee8 <.LVL206>:
    aee8:	be1ff06f          	j	aac8 <.L7>

0000aeec <.L100>:
    aeec:	7ff00913          	li	s2,2047

0000aef0 <.L155>:
    aef0:	00000793          	li	a5,0
    aef4:	00000513          	li	a0,0
    aef8:	0240006f          	j	af1c <.L85>

0000aefc <.L102>:
    aefc:	00080913          	mv	s2,a6

0000af00 <.LVL210>:
    af00:	bc9ff06f          	j	aac8 <.L7>

0000af04 <.L105>:
    af04:	00070793          	mv	a5,a4

0000af08 <.LVL212>:
    af08:	00060513          	mv	a0,a2

0000af0c <.LVL213>:
    af0c:	00080913          	mv	s2,a6

0000af10 <.LVL214>:
    af10:	e41ff06f          	j	ad50 <.L153>

0000af14 <.L110>:
    af14:	00000793          	li	a5,0

0000af18 <.LBE58>:
    af18:	00000493          	li	s1,0

0000af1c <.L85>:
  FP_PACK_SEMIRAW_D (r, R);
    af1c:	00879713          	sll	a4,a5,0x8
    af20:	00075e63          	bgez	a4,af3c <.L88>

0000af24 <.LVL218>:
    af24:	00190913          	add	s2,s2,1

0000af28 <.LVL219>:
    af28:	7ff00713          	li	a4,2047
    af2c:	08e90263          	beq	s2,a4,afb0 <.L115>
    af30:	ff800737          	lui	a4,0xff800
    af34:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9f4f>
    af38:	00e7f7b3          	and	a5,a5,a4

0000af3c <.L88>:
    af3c:	01d79693          	sll	a3,a5,0x1d
    af40:	00355513          	srl	a0,a0,0x3

0000af44 <.LVL221>:
    af44:	7ff00713          	li	a4,2047
    af48:	00a6e6b3          	or	a3,a3,a0

0000af4c <.LVL222>:
    af4c:	0037d793          	srl	a5,a5,0x3
    af50:	00e91e63          	bne	s2,a4,af6c <.L89>

0000af54 <.LVL224>:
    af54:	00f6e6b3          	or	a3,a3,a5

0000af58 <.LVL225>:
    af58:	00000793          	li	a5,0

0000af5c <.LVL226>:
    af5c:	00068863          	beqz	a3,af6c <.L89>
    af60:	000807b7          	lui	a5,0x80
    af64:	00000693          	li	a3,0
    af68:	00000493          	li	s1,0

0000af6c <.L89>:
    af6c:	01491713          	sll	a4,s2,0x14
    af70:	7ff00637          	lui	a2,0x7ff00
    af74:	00c79793          	sll	a5,a5,0xc

0000af78 <.LVL228>:
    af78:	00c77733          	and	a4,a4,a2

0000af7c <.LBE75>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    af7c:	01c12083          	lw	ra,28(sp)
    af80:	01812403          	lw	s0,24(sp)

0000af84 <.LBB76>:
  FP_PACK_SEMIRAW_D (r, R);
    af84:	00c7d793          	srl	a5,a5,0xc
    af88:	00f767b3          	or	a5,a4,a5
    af8c:	01f49713          	sll	a4,s1,0x1f
    af90:	00e7e633          	or	a2,a5,a4

0000af94 <.LBE76>:
}
    af94:	01412483          	lw	s1,20(sp)

0000af98 <.LVL230>:
    af98:	01012903          	lw	s2,16(sp)
    af9c:	00c12983          	lw	s3,12(sp)
    afa0:	00068513          	mv	a0,a3
    afa4:	00060593          	mv	a1,a2
    afa8:	02010113          	add	sp,sp,32
    afac:	00008067          	ret

0000afb0 <.L115>:
    afb0:	00000793          	li	a5,0

0000afb4 <.LVL232>:
    afb4:	00000513          	li	a0,0

0000afb8 <.LVL233>:
    afb8:	f85ff06f          	j	af3c <.L88>

0000afbc <__fixdfsi>:
  FP_DECL_EX;
  FP_DECL_D (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    afbc:	0145d713          	srl	a4,a1,0x14
    afc0:	001006b7          	lui	a3,0x100
    afc4:	fff68793          	add	a5,a3,-1 # fffff <_ebss+0xe9f4f>
    afc8:	7ff77713          	and	a4,a4,2047

0000afcc <.LBE2>:
  FP_TO_INT_D (r, A, SI_BITS, 1);
    afcc:	3fe00613          	li	a2,1022

0000afd0 <.LBB3>:
  FP_UNPACK_RAW_D (A, a);
    afd0:	00b7f7b3          	and	a5,a5,a1

0000afd4 <.LVL1>:
    afd4:	01f5d593          	srl	a1,a1,0x1f

0000afd8 <.LBE3>:
  FP_TO_INT_D (r, A, SI_BITS, 1);
    afd8:	04e65e63          	bge	a2,a4,b034 <.L6>
    afdc:	41d00613          	li	a2,1053
    afe0:	00e65a63          	bge	a2,a4,aff4 <.L3>

0000afe4 <.LVL3>:
    afe4:	80000537          	lui	a0,0x80000

0000afe8 <.LVL4>:
    afe8:	fff50513          	add	a0,a0,-1 # 7fffffff <_ebss+0x7ffe9f4f>
    afec:	00a58533          	add	a0,a1,a0
    aff0:	00008067          	ret

0000aff4 <.L3>:
    aff4:	00d7e7b3          	or	a5,a5,a3
    aff8:	43300693          	li	a3,1075
    affc:	40e686b3          	sub	a3,a3,a4
    b000:	01f00613          	li	a2,31
    b004:	02d64063          	blt	a2,a3,b024 <.L4>

0000b008 <.LVL7>:
    b008:	bed70713          	add	a4,a4,-1043

0000b00c <.LVL8>:
    b00c:	00e797b3          	sll	a5,a5,a4

0000b010 <.LVL9>:
    b010:	00d55533          	srl	a0,a0,a3

0000b014 <.LVL10>:
    b014:	00a7e533          	or	a0,a5,a0

0000b018 <.L5>:
    b018:	02058063          	beqz	a1,b038 <.L2>
    b01c:	40a00533          	neg	a0,a0

0000b020 <.LVL12>:
    b020:	00008067          	ret

0000b024 <.L4>:
    b024:	41300693          	li	a3,1043
    b028:	40e68733          	sub	a4,a3,a4

0000b02c <.LVL14>:
    b02c:	00e7d533          	srl	a0,a5,a4

0000b030 <.LVL15>:
    b030:	fe9ff06f          	j	b018 <.L5>

0000b034 <.L6>:
    b034:	00000513          	li	a0,0

0000b038 <.L2>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    b038:	00008067          	ret

0000b03c <__floatsidf>:
#include "soft-fp.h"
#include "double.h"

DFtype
__floatsidf (SItype i)
{
    b03c:	ff010113          	add	sp,sp,-16
    b040:	00112623          	sw	ra,12(sp)
    b044:	00812423          	sw	s0,8(sp)
    b048:	00912223          	sw	s1,4(sp)

0000b04c <.LBB9>:
  FP_DECL_D (A);
  DFtype a;

  FP_FROM_INT_D (A, i, SI_BITS, USItype);
    b04c:	08050663          	beqz	a0,b0d8 <.L5>

0000b050 <.LBB3>:
    b050:	41f55793          	sra	a5,a0,0x1f
    b054:	00a7c433          	xor	s0,a5,a0
    b058:	40f40433          	sub	s0,s0,a5
    b05c:	01f55493          	srl	s1,a0,0x1f

0000b060 <.LBB4>:
    b060:	00040513          	mv	a0,s0

0000b064 <.LVL3>:
    b064:	db0f60ef          	jal	1614 <__clzsi2>

0000b068 <.LVL4>:
    b068:	41e00713          	li	a4,1054

0000b06c <.LBE4>:
    b06c:	00a00793          	li	a5,10

0000b070 <.LBB5>:
    b070:	40a70733          	sub	a4,a4,a0

0000b074 <.LBE5>:
    b074:	04a7c863          	blt	a5,a0,b0c4 <.L4>
    b078:	00b00793          	li	a5,11
    b07c:	40a787b3          	sub	a5,a5,a0
    b080:	01550513          	add	a0,a0,21

0000b084 <.LVL6>:
    b084:	00f457b3          	srl	a5,s0,a5

0000b088 <.LVL7>:
    b088:	00a41433          	sll	s0,s0,a0

0000b08c <.LVL8>:
    b08c:	00048513          	mv	a0,s1

0000b090 <.L2>:
  FP_PACK_RAW_D (a, A);
    b090:	00c79793          	sll	a5,a5,0xc

0000b094 <.LVL10>:
    b094:	00c7d793          	srl	a5,a5,0xc
    b098:	01471713          	sll	a4,a4,0x14

0000b09c <.LVL11>:
    b09c:	01f51513          	sll	a0,a0,0x1f

0000b0a0 <.LVL12>:
    b0a0:	00f76733          	or	a4,a4,a5

0000b0a4 <.LBE10>:

  return a;
}
    b0a4:	00c12083          	lw	ra,12(sp)

0000b0a8 <.LBB11>:
  FP_PACK_RAW_D (a, A);
    b0a8:	00a767b3          	or	a5,a4,a0

0000b0ac <.LBE11>:
}
    b0ac:	00040513          	mv	a0,s0
    b0b0:	00812403          	lw	s0,8(sp)

0000b0b4 <.LVL14>:
    b0b4:	00412483          	lw	s1,4(sp)
    b0b8:	00078593          	mv	a1,a5
    b0bc:	01010113          	add	sp,sp,16
    b0c0:	00008067          	ret

0000b0c4 <.L4>:
  FP_FROM_INT_D (A, i, SI_BITS, USItype);
    b0c4:	ff550513          	add	a0,a0,-11

0000b0c8 <.LVL16>:
    b0c8:	00a417b3          	sll	a5,s0,a0

0000b0cc <.LVL17>:
    b0cc:	00048513          	mv	a0,s1

0000b0d0 <.L7>:
    b0d0:	00000413          	li	s0,0
    b0d4:	fbdff06f          	j	b090 <.L2>

0000b0d8 <.L5>:
    b0d8:	00000713          	li	a4,0
    b0dc:	00000793          	li	a5,0
    b0e0:	ff1ff06f          	j	b0d0 <.L7>

0000b0e4 <__divtf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__divtf3 (TFtype a, TFtype b)
{
    b0e4:	f5010113          	add	sp,sp,-176
    b0e8:	09312e23          	sw	s3,156(sp)
    b0ec:	00c5a983          	lw	s3,12(a1)
    b0f0:	0045a783          	lw	a5,4(a1)
    b0f4:	0085a803          	lw	a6,8(a1)
    b0f8:	0a812423          	sw	s0,168(sp)
    b0fc:	00050413          	mv	s0,a0
    b100:	0005a503          	lw	a0,0(a1)

0000b104 <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_Q (A, a);
    b104:	01099713          	sll	a4,s3,0x10

0000b108 <.LBE3>:
{
    b108:	0b212023          	sw	s2,160(sp)
    b10c:	09512a23          	sw	s5,148(sp)
    b110:	00462903          	lw	s2,4(a2) # 7ff00004 <_ebss+0x7fee9f54>
    b114:	00c62a83          	lw	s5,12(a2)
    b118:	09612823          	sw	s6,144(sp)
    b11c:	09712623          	sw	s7,140(sp)
    b120:	00862b03          	lw	s6,8(a2)
    b124:	00062b83          	lw	s7,0(a2)

0000b128 <.LBB4>:
  FP_UNPACK_Q (A, a);
    b128:	00008637          	lui	a2,0x8

0000b12c <.LBE4>:
{
    b12c:	0a912223          	sw	s1,164(sp)

0000b130 <.LBB5>:
  FP_UNPACK_Q (A, a);
    b130:	01075713          	srl	a4,a4,0x10
    b134:	0109d493          	srl	s1,s3,0x10
    b138:	fff60613          	add	a2,a2,-1 # 7fff <.L4+0xf>
    b13c:	07312623          	sw	s3,108(sp)

0000b140 <.LBE5>:
{
    b140:	0a112623          	sw	ra,172(sp)
    b144:	09412c23          	sw	s4,152(sp)
    b148:	09812423          	sw	s8,136(sp)
    b14c:	09912223          	sw	s9,132(sp)
    b150:	09a12023          	sw	s10,128(sp)
    b154:	07b12e23          	sw	s11,124(sp)

0000b158 <.LBB6>:
  FP_UNPACK_Q (A, a);
    b158:	06a12023          	sw	a0,96(sp)
    b15c:	06f12223          	sw	a5,100(sp)
    b160:	07012423          	sw	a6,104(sp)
    b164:	02a12823          	sw	a0,48(sp)
    b168:	02f12a23          	sw	a5,52(sp)
    b16c:	03012c23          	sw	a6,56(sp)
    b170:	02e12e23          	sw	a4,60(sp)
    b174:	00c4f6b3          	and	a3,s1,a2

0000b178 <.LVL2>:
    b178:	01f9d993          	srl	s3,s3,0x1f

0000b17c <.LBE6>:
    b17c:	10068e63          	beqz	a3,b298 <.L2>
    b180:	24c68863          	beq	a3,a2,b3d0 <.L3>
    b184:	000107b7          	lui	a5,0x10
    b188:	00f76733          	or	a4,a4,a5
    b18c:	02e12e23          	sw	a4,60(sp)

0000b190 <.LBB7>:
    b190:	03010593          	add	a1,sp,48
    b194:	03c10793          	add	a5,sp,60

0000b198 <.L4>:
    b198:	0007a703          	lw	a4,0(a5) # 10000 <.LBE193+0x4>
    b19c:	ffc7a603          	lw	a2,-4(a5)
    b1a0:	ffc78793          	add	a5,a5,-4
    b1a4:	00371713          	sll	a4,a4,0x3
    b1a8:	01d65613          	srl	a2,a2,0x1d
    b1ac:	00c76733          	or	a4,a4,a2
    b1b0:	00e7a223          	sw	a4,4(a5)
    b1b4:	fef592e3          	bne	a1,a5,b198 <.L4>

0000b1b8 <.LBE7>:
    b1b8:	ffffc7b7          	lui	a5,0xffffc

0000b1bc <.LBB8>:
    b1bc:	00351513          	sll	a0,a0,0x3

0000b1c0 <.LBE8>:
    b1c0:	00178793          	add	a5,a5,1 # ffffc001 <_ebss+0xfffe5f51>

0000b1c4 <.LBB9>:
    b1c4:	02a12823          	sw	a0,48(sp)

0000b1c8 <.LBE9>:
    b1c8:	00f684b3          	add	s1,a3,a5

0000b1cc <.L193>:
    b1cc:	00000a13          	li	s4,0

0000b1d0 <.L5>:
  FP_UNPACK_Q (B, b);
    b1d0:	010a9513          	sll	a0,s5,0x10
    b1d4:	00008737          	lui	a4,0x8
    b1d8:	010ad793          	srl	a5,s5,0x10
    b1dc:	01055513          	srl	a0,a0,0x10
    b1e0:	fff70713          	add	a4,a4,-1 # 7fff <.L4+0xf>
    b1e4:	07512623          	sw	s5,108(sp)
    b1e8:	07712023          	sw	s7,96(sp)
    b1ec:	07212223          	sw	s2,100(sp)
    b1f0:	07612423          	sw	s6,104(sp)
    b1f4:	05712023          	sw	s7,64(sp)
    b1f8:	05212223          	sw	s2,68(sp)
    b1fc:	05612423          	sw	s6,72(sp)
    b200:	04a12623          	sw	a0,76(sp)
    b204:	00e7f7b3          	and	a5,a5,a4

0000b208 <.LVL9>:
    b208:	01fada93          	srl	s5,s5,0x1f

0000b20c <.LBE13>:
    b20c:	1e078863          	beqz	a5,b3fc <.L18>
    b210:	32e78263          	beq	a5,a4,b534 <.L19>
    b214:	00010737          	lui	a4,0x10
    b218:	00e56533          	or	a0,a0,a4
    b21c:	04a12623          	sw	a0,76(sp)

0000b220 <.LBB14>:
    b220:	04010593          	add	a1,sp,64
    b224:	04c10713          	add	a4,sp,76

0000b228 <.L20>:
    b228:	00072683          	lw	a3,0(a4) # 10000 <.LBE193+0x4>
    b22c:	ffc72603          	lw	a2,-4(a4)
    b230:	ffc70713          	add	a4,a4,-4
    b234:	00369693          	sll	a3,a3,0x3
    b238:	01d65613          	srl	a2,a2,0x1d
    b23c:	00c6e6b3          	or	a3,a3,a2
    b240:	00d72223          	sw	a3,4(a4)
    b244:	fee592e3          	bne	a1,a4,b228 <.L20>

0000b248 <.LBE14>:
    b248:	ffffc737          	lui	a4,0xffffc

0000b24c <.LBB15>:
    b24c:	003b9b93          	sll	s7,s7,0x3

0000b250 <.LBE15>:
    b250:	00170713          	add	a4,a4,1 # ffffc001 <_ebss+0xfffe5f51>

0000b254 <.LBB16>:
    b254:	05712023          	sw	s7,64(sp)

0000b258 <.LBE16>:
    b258:	00e787b3          	add	a5,a5,a4

0000b25c <.L194>:
    b25c:	00000713          	li	a4,0

0000b260 <.L21>:
  FP_DIV_Q (R, A, B);
    b260:	40f486b3          	sub	a3,s1,a5
    b264:	002a1793          	sll	a5,s4,0x2

0000b268 <.LVL16>:
    b268:	00e7e7b3          	or	a5,a5,a4
    b26c:	fff78793          	add	a5,a5,-1
    b270:	00e00613          	li	a2,14
    b274:	0159c933          	xor	s2,s3,s5

0000b278 <.LVL17>:
    b278:	2ef66263          	bltu	a2,a5,b55c <.L34>
    b27c:	00007617          	auipc	a2,0x7
    b280:	a2060613          	add	a2,a2,-1504 # 11c9c <.L36>
    b284:	00279793          	sll	a5,a5,0x2
    b288:	00c787b3          	add	a5,a5,a2
    b28c:	0007a783          	lw	a5,0(a5)
    b290:	00c787b3          	add	a5,a5,a2
    b294:	00078067          	jr	a5

0000b298 <.L2>:
  FP_UNPACK_Q (A, a);
    b298:	00a7e6b3          	or	a3,a5,a0

0000b29c <.LVL19>:
    b29c:	0106e6b3          	or	a3,a3,a6
    b2a0:	00e6e6b3          	or	a3,a3,a4
    b2a4:	14068663          	beqz	a3,b3f0 <.L145>

0000b2a8 <.LBB20>:
    b2a8:	0a070063          	beqz	a4,b348 <.L6>
    b2ac:	00070513          	mv	a0,a4
    b2b0:	b64f60ef          	jal	1614 <__clzsi2>

0000b2b4 <.L7>:
    b2b4:	ff450713          	add	a4,a0,-12
    b2b8:	40575593          	sra	a1,a4,0x5

0000b2bc <.LVL21>:
    b2bc:	01f77713          	and	a4,a4,31

0000b2c0 <.LVL22>:
    b2c0:	0a070e63          	beqz	a4,b37c <.L10>
    b2c4:	ffc00693          	li	a3,-4
    b2c8:	02d586b3          	mul	a3,a1,a3
    b2cc:	02000813          	li	a6,32
    b2d0:	03010313          	add	t1,sp,48
    b2d4:	40e80833          	sub	a6,a6,a4

0000b2d8 <.LVL23>:
    b2d8:	00c68793          	add	a5,a3,12
    b2dc:	00f307b3          	add	a5,t1,a5
    b2e0:	40d006b3          	neg	a3,a3

0000b2e4 <.L11>:
    b2e4:	0cf31463          	bne	t1,a5,b3ac <.L14>
    b2e8:	fff58793          	add	a5,a1,-1

0000b2ec <.LVL24>:
    b2ec:	00259593          	sll	a1,a1,0x2

0000b2f0 <.LVL25>:
    b2f0:	04058693          	add	a3,a1,64
    b2f4:	03010613          	add	a2,sp,48
    b2f8:	00c685b3          	add	a1,a3,a2
    b2fc:	03012683          	lw	a3,48(sp)
    b300:	00e69733          	sll	a4,a3,a4

0000b304 <.LVL26>:
    b304:	fce5a023          	sw	a4,-64(a1)

0000b308 <.L15>:
    b308:	00178793          	add	a5,a5,1
    b30c:	00279793          	sll	a5,a5,0x2
    b310:	00800693          	li	a3,8
    b314:	03010713          	add	a4,sp,48
    b318:	00d7ea63          	bltu	a5,a3,b32c <.L16>
    b31c:	02012823          	sw	zero,48(sp)
    b320:	00072223          	sw	zero,4(a4)
    b324:	ff878793          	add	a5,a5,-8
    b328:	03810713          	add	a4,sp,56

0000b32c <.L16>:
    b32c:	00400693          	li	a3,4
    b330:	00d7e463          	bltu	a5,a3,b338 <.L17>
    b334:	00072023          	sw	zero,0(a4)

0000b338 <.L17>:
    b338:	ffffc6b7          	lui	a3,0xffffc
    b33c:	01168693          	add	a3,a3,17 # ffffc011 <_ebss+0xfffe5f61>
    b340:	40a684b3          	sub	s1,a3,a0

0000b344 <.LVL28>:
    b344:	e89ff06f          	j	b1cc <.L193>

0000b348 <.L6>:
    b348:	00080a63          	beqz	a6,b35c <.L8>
    b34c:	00080513          	mv	a0,a6
    b350:	ac4f60ef          	jal	1614 <__clzsi2>

0000b354 <.LVL30>:
    b354:	02050513          	add	a0,a0,32
    b358:	f5dff06f          	j	b2b4 <.L7>

0000b35c <.L8>:
    b35c:	00078a63          	beqz	a5,b370 <.L9>
    b360:	00078513          	mv	a0,a5
    b364:	ab0f60ef          	jal	1614 <__clzsi2>

0000b368 <.LVL33>:
    b368:	04050513          	add	a0,a0,64
    b36c:	f49ff06f          	j	b2b4 <.L7>

0000b370 <.L9>:
    b370:	aa4f60ef          	jal	1614 <__clzsi2>

0000b374 <.LVL36>:
    b374:	06050513          	add	a0,a0,96
    b378:	f3dff06f          	j	b2b4 <.L7>

0000b37c <.L10>:
    b37c:	ffc00693          	li	a3,-4
    b380:	02d586b3          	mul	a3,a1,a3
    b384:	03c10793          	add	a5,sp,60

0000b388 <.LBB12>:
    b388:	00300713          	li	a4,3

0000b38c <.L12>:
    b38c:	00d78633          	add	a2,a5,a3
    b390:	00062603          	lw	a2,0(a2)
    b394:	fff70713          	add	a4,a4,-1

0000b398 <.LVL40>:
    b398:	ffc78793          	add	a5,a5,-4
    b39c:	00c7a223          	sw	a2,4(a5)

0000b3a0 <.LVL41>:
    b3a0:	feb756e3          	bge	a4,a1,b38c <.L12>
    b3a4:	fff58793          	add	a5,a1,-1
    b3a8:	f61ff06f          	j	b308 <.L15>

0000b3ac <.L14>:
    b3ac:	0007a603          	lw	a2,0(a5)
    b3b0:	ffc7a883          	lw	a7,-4(a5)
    b3b4:	00d78e33          	add	t3,a5,a3
    b3b8:	00e61633          	sll	a2,a2,a4
    b3bc:	0108d8b3          	srl	a7,a7,a6
    b3c0:	01166633          	or	a2,a2,a7
    b3c4:	00ce2023          	sw	a2,0(t3) # 7ff00000 <_ebss+0x7fee9f50>
    b3c8:	ffc78793          	add	a5,a5,-4
    b3cc:	f19ff06f          	j	b2e4 <.L11>

0000b3d0 <.L3>:
    b3d0:	00a7e7b3          	or	a5,a5,a0
    b3d4:	0107e7b3          	or	a5,a5,a6
    b3d8:	00e7e7b3          	or	a5,a5,a4

0000b3dc <.LBB21>:
    b3dc:	00068493          	mv	s1,a3

0000b3e0 <.LBE21>:
    b3e0:	00200a13          	li	s4,2
    b3e4:	de0786e3          	beqz	a5,b1d0 <.L5>
    b3e8:	00300a13          	li	s4,3
    b3ec:	de5ff06f          	j	b1d0 <.L5>

0000b3f0 <.L145>:
    b3f0:	00000493          	li	s1,0

0000b3f4 <.LBE22>:
    b3f4:	00100a13          	li	s4,1
    b3f8:	dd9ff06f          	j	b1d0 <.L5>

0000b3fc <.L18>:
  FP_UNPACK_Q (B, b);
    b3fc:	017967b3          	or	a5,s2,s7

0000b400 <.LVL47>:
    b400:	0167e7b3          	or	a5,a5,s6
    b404:	00a7e7b3          	or	a5,a5,a0
    b408:	14078463          	beqz	a5,b550 <.L147>

0000b40c <.LBB23>:
    b40c:	08050e63          	beqz	a0,b4a8 <.L22>
    b410:	a04f60ef          	jal	1614 <__clzsi2>

0000b414 <.L23>:
    b414:	ff450693          	add	a3,a0,-12
    b418:	4056d793          	sra	a5,a3,0x5

0000b41c <.LVL49>:
    b41c:	01f6f693          	and	a3,a3,31

0000b420 <.LVL50>:
    b420:	0c068063          	beqz	a3,b4e0 <.L26>
    b424:	ffc00613          	li	a2,-4
    b428:	02c78633          	mul	a2,a5,a2
    b42c:	02000813          	li	a6,32
    b430:	04010313          	add	t1,sp,64
    b434:	40d80833          	sub	a6,a6,a3

0000b438 <.LVL51>:
    b438:	00c60713          	add	a4,a2,12
    b43c:	00e30733          	add	a4,t1,a4
    b440:	40c00633          	neg	a2,a2

0000b444 <.L27>:
    b444:	0ce31663          	bne	t1,a4,b510 <.L30>
    b448:	fff78713          	add	a4,a5,-1

0000b44c <.LVL52>:
    b44c:	00279793          	sll	a5,a5,0x2

0000b450 <.LVL53>:
    b450:	03010613          	add	a2,sp,48
    b454:	04078793          	add	a5,a5,64
    b458:	00c787b3          	add	a5,a5,a2
    b45c:	04012603          	lw	a2,64(sp)
    b460:	00d616b3          	sll	a3,a2,a3

0000b464 <.LVL54>:
    b464:	fcd7a823          	sw	a3,-48(a5)

0000b468 <.L31>:
    b468:	00170793          	add	a5,a4,1
    b46c:	00279793          	sll	a5,a5,0x2
    b470:	00800693          	li	a3,8
    b474:	04010713          	add	a4,sp,64
    b478:	00d7ea63          	bltu	a5,a3,b48c <.L32>
    b47c:	04012023          	sw	zero,64(sp)
    b480:	00072223          	sw	zero,4(a4)
    b484:	ff878793          	add	a5,a5,-8
    b488:	04810713          	add	a4,sp,72

0000b48c <.L32>:
    b48c:	00400693          	li	a3,4
    b490:	00d7e463          	bltu	a5,a3,b498 <.L33>
    b494:	00072023          	sw	zero,0(a4)

0000b498 <.L33>:
    b498:	ffffc7b7          	lui	a5,0xffffc
    b49c:	01178793          	add	a5,a5,17 # ffffc011 <_ebss+0xfffe5f61>
    b4a0:	40a787b3          	sub	a5,a5,a0
    b4a4:	db9ff06f          	j	b25c <.L194>

0000b4a8 <.L22>:
    b4a8:	000b0a63          	beqz	s6,b4bc <.L24>
    b4ac:	000b0513          	mv	a0,s6
    b4b0:	964f60ef          	jal	1614 <__clzsi2>

0000b4b4 <.LVL57>:
    b4b4:	02050513          	add	a0,a0,32
    b4b8:	f5dff06f          	j	b414 <.L23>

0000b4bc <.L24>:
    b4bc:	00090a63          	beqz	s2,b4d0 <.L25>
    b4c0:	00090513          	mv	a0,s2
    b4c4:	950f60ef          	jal	1614 <__clzsi2>

0000b4c8 <.LVL60>:
    b4c8:	04050513          	add	a0,a0,64
    b4cc:	f49ff06f          	j	b414 <.L23>

0000b4d0 <.L25>:
    b4d0:	000b8513          	mv	a0,s7
    b4d4:	940f60ef          	jal	1614 <__clzsi2>

0000b4d8 <.LVL63>:
    b4d8:	06050513          	add	a0,a0,96
    b4dc:	f39ff06f          	j	b414 <.L23>

0000b4e0 <.L26>:
    b4e0:	ffc00613          	li	a2,-4
    b4e4:	02c78633          	mul	a2,a5,a2
    b4e8:	04c10713          	add	a4,sp,76

0000b4ec <.LBB19>:
    b4ec:	00300693          	li	a3,3

0000b4f0 <.L28>:
    b4f0:	00c705b3          	add	a1,a4,a2
    b4f4:	0005a583          	lw	a1,0(a1)
    b4f8:	fff68693          	add	a3,a3,-1

0000b4fc <.LVL67>:
    b4fc:	ffc70713          	add	a4,a4,-4
    b500:	00b72223          	sw	a1,4(a4)

0000b504 <.LVL68>:
    b504:	fef6d6e3          	bge	a3,a5,b4f0 <.L28>
    b508:	fff78713          	add	a4,a5,-1
    b50c:	f5dff06f          	j	b468 <.L31>

0000b510 <.L30>:
    b510:	00072583          	lw	a1,0(a4)
    b514:	ffc72883          	lw	a7,-4(a4)
    b518:	00c70e33          	add	t3,a4,a2
    b51c:	00d595b3          	sll	a1,a1,a3
    b520:	0108d8b3          	srl	a7,a7,a6
    b524:	0115e5b3          	or	a1,a1,a7
    b528:	00be2023          	sw	a1,0(t3)
    b52c:	ffc70713          	add	a4,a4,-4
    b530:	f15ff06f          	j	b444 <.L27>

0000b534 <.L19>:
    b534:	01796933          	or	s2,s2,s7
    b538:	01696933          	or	s2,s2,s6
    b53c:	00a96933          	or	s2,s2,a0
    b540:	00200713          	li	a4,2
    b544:	d0090ee3          	beqz	s2,b260 <.L21>
    b548:	00300713          	li	a4,3
    b54c:	d15ff06f          	j	b260 <.L21>

0000b550 <.L147>:
    b550:	00000793          	li	a5,0

0000b554 <.LBE24>:
    b554:	00100713          	li	a4,1

0000b558 <.LVL72>:
    b558:	d09ff06f          	j	b260 <.L21>

0000b55c <.L34>:
  FP_DIV_Q (R, A, B);
    b55c:	03c12703          	lw	a4,60(sp)

0000b560 <.LVL74>:
    b560:	04c12503          	lw	a0,76(sp)
    b564:	06012623          	sw	zero,108(sp)
    b568:	06012423          	sw	zero,104(sp)
    b56c:	06012223          	sw	zero,100(sp)
    b570:	06012023          	sw	zero,96(sp)
    b574:	03012783          	lw	a5,48(sp)
    b578:	03412603          	lw	a2,52(sp)
    b57c:	04012803          	lw	a6,64(sp)
    b580:	04812583          	lw	a1,72(sp)
    b584:	02e56263          	bltu	a0,a4,b5a8 <.L41>
    b588:	22a71263          	bne	a4,a0,b7ac <.L42>
    b58c:	03812503          	lw	a0,56(sp)
    b590:	00a5ec63          	bltu	a1,a0,b5a8 <.L41>
    b594:	20b51c63          	bne	a0,a1,b7ac <.L42>
    b598:	04412583          	lw	a1,68(sp)
    b59c:	00c5e663          	bltu	a1,a2,b5a8 <.L41>
    b5a0:	20c59663          	bne	a1,a2,b7ac <.L42>
    b5a4:	2107e463          	bltu	a5,a6,b7ac <.L42>

0000b5a8 <.L41>:
    b5a8:	01f79793          	sll	a5,a5,0x1f
    b5ac:	06f12623          	sw	a5,108(sp)

0000b5b0 <.LBB26>:
    b5b0:	03c10513          	add	a0,sp,60
    b5b4:	03010793          	add	a5,sp,48

0000b5b8 <.L43>:
    b5b8:	0007a603          	lw	a2,0(a5)
    b5bc:	0047a583          	lw	a1,4(a5)
    b5c0:	00478793          	add	a5,a5,4
    b5c4:	00165613          	srl	a2,a2,0x1
    b5c8:	01f59593          	sll	a1,a1,0x1f
    b5cc:	00b66633          	or	a2,a2,a1
    b5d0:	fec7ae23          	sw	a2,-4(a5)
    b5d4:	fef512e3          	bne	a0,a5,b5b8 <.L43>

0000b5d8 <.LVL77>:
    b5d8:	00175713          	srl	a4,a4,0x1
    b5dc:	02e12e23          	sw	a4,60(sp)

0000b5e0 <.L44>:
    b5e0:	04010593          	add	a1,sp,64
    b5e4:	04c10793          	add	a5,sp,76

0000b5e8 <.L45>:
    b5e8:	0007a703          	lw	a4,0(a5)
    b5ec:	ffc7a603          	lw	a2,-4(a5)
    b5f0:	ffc78793          	add	a5,a5,-4
    b5f4:	00c71713          	sll	a4,a4,0xc
    b5f8:	01465613          	srl	a2,a2,0x14
    b5fc:	00c76733          	or	a4,a4,a2
    b600:	00e7a223          	sw	a4,4(a5)
    b604:	fef592e3          	bne	a1,a5,b5e8 <.L45>

0000b608 <.LBE27>:
    b608:	04c12503          	lw	a0,76(sp)

0000b60c <.LBB28>:
    b60c:	00010eb7          	lui	t4,0x10

0000b610 <.LBB29>:
    b610:	04412303          	lw	t1,68(sp)

0000b614 <.LBB54>:
    b614:	fffe8e93          	add	t4,t4,-1 # ffff <.LBE193+0x3>

0000b618 <.LBB55>:
    b618:	00c81813          	sll	a6,a6,0xc

0000b61c <.LBB56>:
    b61c:	01d577b3          	and	a5,a0,t4

0000b620 <.LBB31>:
    b620:	04812f83          	lw	t6,72(sp)

0000b624 <.LBB58>:
    b624:	00f12e23          	sw	a5,28(sp)

0000b628 <.LBB32>:
    b628:	01085793          	srl	a5,a6,0x10
    b62c:	00f12423          	sw	a5,8(sp)

0000b630 <.LBB33>:
    b630:	01035793          	srl	a5,t1,0x10
    b634:	00f12623          	sw	a5,12(sp)
    b638:	01d377b3          	and	a5,t1,t4
    b63c:	00f12a23          	sw	a5,20(sp)

0000b640 <.LBB34>:
    b640:	010fd793          	srl	a5,t6,0x10
    b644:	00f12823          	sw	a5,16(sp)
    b648:	01dff7b3          	and	a5,t6,t4
    b64c:	00f12c23          	sw	a5,24(sp)
    b650:	01d877b3          	and	a5,a6,t4
    b654:	02f12023          	sw	a5,32(sp)
    b658:	03812883          	lw	a7,56(sp)

0000b65c <.LBB60>:
    b65c:	410307b3          	sub	a5,t1,a6
    b660:	03c12703          	lw	a4,60(sp)
    b664:	03412603          	lw	a2,52(sp)
    b668:	03012583          	lw	a1,48(sp)
    b66c:	02f12223          	sw	a5,36(sp)
    b670:	406f87b3          	sub	a5,t6,t1

0000b674 <.LBB61>:
    b674:	01055d13          	srl	s10,a0,0x10
    b678:	05010a13          	add	s4,sp,80

0000b67c <.LVL81>:
    b67c:	06010c13          	add	s8,sp,96

0000b680 <.LBE61>:
    b680:	00300c93          	li	s9,3

0000b684 <.LBB62>:
    b684:	00010db7          	lui	s11,0x10

0000b688 <.LBB63>:
    b688:	02f12423          	sw	a5,40(sp)

0000b68c <.L113>:
    b68c:	12e51463          	bne	a0,a4,b7b4 <.L46>
    b690:	fff00793          	li	a5,-1
    b694:	00fa2623          	sw	a5,12(s4)
    b698:	3e0c8c63          	beqz	s9,ba90 <.L114>

0000b69c <.LBB64>:
    b69c:	00cc2f03          	lw	t5,12(s8)

0000b6a0 <.LVL83>:
    b6a0:	40b803b3          	sub	t2,a6,a1
    b6a4:	00783e33          	sltu	t3,a6,t2
    b6a8:	01e037b3          	snez	a5,t5

0000b6ac <.LVL84>:
    b6ac:	00000993          	li	s3,0
    b6b0:	000f0463          	beqz	t5,b6b8 <.L50>
    b6b4:	0013b993          	seqz	s3,t2

0000b6b8 <.L50>:
    b6b8:	01c9e9b3          	or	s3,s3,t3

0000b6bc <.LVL85>:
    b6bc:	40c302b3          	sub	t0,t1,a2

0000b6c0 <.LVL86>:
    b6c0:	00533e33          	sltu	t3,t1,t0

0000b6c4 <.LVL87>:
    b6c4:	00000a93          	li	s5,0
    b6c8:	00098463          	beqz	s3,b6d0 <.L53>
    b6cc:	0012ba93          	seqz	s5,t0

0000b6d0 <.L53>:
    b6d0:	01caeab3          	or	s5,s5,t3

0000b6d4 <.LBB65>:
    b6d4:	02412e03          	lw	t3,36(sp)
    b6d8:	01e80f33          	add	t5,a6,t5

0000b6dc <.LVL89>:
    b6dc:	00be0e33          	add	t3,t3,a1
    b6e0:	00fe0e33          	add	t3,t3,a5

0000b6e4 <.LVL90>:
    b6e4:	01e835b3          	sltu	a1,a6,t5
    b6e8:	01c334b3          	sltu	s1,t1,t3

0000b6ec <.LVL91>:
    b6ec:	40be0e33          	sub	t3,t3,a1

0000b6f0 <.LVL92>:
    b6f0:	00000593          	li	a1,0
    b6f4:	01e87863          	bgeu	a6,t5,b704 <.L54>

0000b6f8 <.LBB66>:
    b6f8:	40f383b3          	sub	t2,t2,a5

0000b6fc <.LBB67>:
    b6fc:	406383b3          	sub	t2,t2,t1
    b700:	0013b593          	seqz	a1,t2

0000b704 <.L54>:
    b704:	02812783          	lw	a5,40(sp)

0000b708 <.LVL94>:
    b708:	0095e5b3          	or	a1,a1,s1

0000b70c <.LVL95>:
    b70c:	00c784b3          	add	s1,a5,a2
    b710:	013484b3          	add	s1,s1,s3

0000b714 <.LVL96>:
    b714:	009fb3b3          	sltu	t2,t6,s1

0000b718 <.LVL97>:
    b718:	00000613          	li	a2,0
    b71c:	40b484b3          	sub	s1,s1,a1

0000b720 <.LVL98>:
    b720:	00058863          	beqz	a1,b730 <.L55>

0000b724 <.LBB68>:
    b724:	413282b3          	sub	t0,t0,s3

0000b728 <.LBB69>:
    b728:	41f282b3          	sub	t0,t0,t6
    b72c:	0012b613          	seqz	a2,t0

0000b730 <.L55>:
    b730:	41f707b3          	sub	a5,a4,t6
    b734:	011787b3          	add	a5,a5,a7
    b738:	015787b3          	add	a5,a5,s5
    b73c:	00766633          	or	a2,a2,t2

0000b740 <.LVL101>:
    b740:	40c787b3          	sub	a5,a5,a2

0000b744 <.LBE69>:
    b744:	04f77463          	bgeu	a4,a5,b78c <.L56>
    b748:	006e02b3          	add	t0,t3,t1
    b74c:	01e80f33          	add	t5,a6,t5

0000b750 <.LVL102>:
    b750:	01c2b8b3          	sltu	a7,t0,t3

0000b754 <.LBB70>:
    b754:	010f3e33          	sltu	t3,t5,a6

0000b758 <.LVL103>:
    b758:	01c28e33          	add	t3,t0,t3
    b75c:	005e32b3          	sltu	t0,t3,t0
    b760:	01f485b3          	add	a1,s1,t6

0000b764 <.LVL104>:
    b764:	0058e8b3          	or	a7,a7,t0

0000b768 <.LBE70>:
    b768:	ffe00613          	li	a2,-2

0000b76c <.LVL105>:
    b76c:	011588b3          	add	a7,a1,a7
    b770:	00ca2623          	sw	a2,12(s4)

0000b774 <.LBB71>:
    b774:	0095b633          	sltu	a2,a1,s1

0000b778 <.LVL107>:
    b778:	00b8b5b3          	sltu	a1,a7,a1
    b77c:	00b66633          	or	a2,a2,a1

0000b780 <.LVL108>:
    b780:	00e60633          	add	a2,a2,a4
    b784:	00088493          	mv	s1,a7

0000b788 <.LVL109>:
    b788:	00c787b3          	add	a5,a5,a2

0000b78c <.L56>:
    b78c:	fffc8c93          	add	s9,s9,-1
    b790:	ffca0a13          	add	s4,s4,-4
    b794:	ffcc0c13          	add	s8,s8,-4
    b798:	00048893          	mv	a7,s1
    b79c:	000e0613          	mv	a2,t3
    b7a0:	000f0593          	mv	a1,t5
    b7a4:	00078713          	mv	a4,a5
    b7a8:	ee5ff06f          	j	b68c <.L113>

0000b7ac <.L42>:
    b7ac:	fff68693          	add	a3,a3,-1
    b7b0:	e31ff06f          	j	b5e0 <.L44>

0000b7b4 <.L46>:
    b7b4:	03a75e33          	divu	t3,a4,s10

0000b7b8 <.LVL115>:
    b7b8:	01c12783          	lw	a5,28(sp)
    b7bc:	0108df13          	srl	t5,a7,0x10
    b7c0:	03a77733          	remu	a4,a4,s10

0000b7c4 <.LVL116>:
    b7c4:	03c787b3          	mul	a5,a5,t3

0000b7c8 <.LVL117>:
    b7c8:	01071713          	sll	a4,a4,0x10

0000b7cc <.LVL118>:
    b7cc:	00ef6733          	or	a4,t5,a4

0000b7d0 <.LVL119>:
    b7d0:	000e0f13          	mv	t5,t3
    b7d4:	00f77e63          	bgeu	a4,a5,b7f0 <.L67>
    b7d8:	00e50733          	add	a4,a0,a4

0000b7dc <.LVL120>:
    b7dc:	fffe0f13          	add	t5,t3,-1

0000b7e0 <.LVL121>:
    b7e0:	00a76863          	bltu	a4,a0,b7f0 <.L67>
    b7e4:	00f77663          	bgeu	a4,a5,b7f0 <.L67>
    b7e8:	ffee0f13          	add	t5,t3,-2
    b7ec:	00a70733          	add	a4,a4,a0

0000b7f0 <.L67>:
    b7f0:	40f70733          	sub	a4,a4,a5

0000b7f4 <.LVL124>:
    b7f4:	03a75e33          	divu	t3,a4,s10

0000b7f8 <.LVL125>:
    b7f8:	01c12783          	lw	a5,28(sp)

0000b7fc <.LVL126>:
    b7fc:	01d8f8b3          	and	a7,a7,t4
    b800:	03a77733          	remu	a4,a4,s10

0000b804 <.LVL127>:
    b804:	03c787b3          	mul	a5,a5,t3

0000b808 <.LVL128>:
    b808:	01071713          	sll	a4,a4,0x10

0000b80c <.LVL129>:
    b80c:	00e8e8b3          	or	a7,a7,a4

0000b810 <.LVL130>:
    b810:	000e0713          	mv	a4,t3
    b814:	00f8fe63          	bgeu	a7,a5,b830 <.L70>
    b818:	011508b3          	add	a7,a0,a7

0000b81c <.LVL131>:
    b81c:	fffe0713          	add	a4,t3,-1

0000b820 <.LVL132>:
    b820:	00a8e863          	bltu	a7,a0,b830 <.L70>
    b824:	00f8f663          	bgeu	a7,a5,b830 <.L70>
    b828:	ffee0713          	add	a4,t3,-2
    b82c:	00a888b3          	add	a7,a7,a0

0000b830 <.L70>:
    b830:	40f887b3          	sub	a5,a7,a5

0000b834 <.LVL135>:
    b834:	010f1f13          	sll	t5,t5,0x10

0000b838 <.LBB35>:
    b838:	02012883          	lw	a7,32(sp)

0000b83c <.LBB74>:
    b83c:	00ef6f33          	or	t5,t5,a4

0000b840 <.LBB36>:
    b840:	010f5293          	srl	t0,t5,0x10
    b844:	01df7733          	and	a4,t5,t4

0000b848 <.LVL137>:
    b848:	02e88e33          	mul	t3,a7,a4

0000b84c <.LBB76>:
    b84c:	01ea2623          	sw	t5,12(s4)

0000b850 <.LBB37>:
    b850:	031284b3          	mul	s1,t0,a7

0000b854 <.LVL140>:
    b854:	00812883          	lw	a7,8(sp)
    b858:	010e5993          	srl	s3,t3,0x10
    b85c:	031283b3          	mul	t2,t0,a7

0000b860 <.LVL141>:
    b860:	02e888b3          	mul	a7,a7,a4

0000b864 <.LVL142>:
    b864:	009888b3          	add	a7,a7,s1

0000b868 <.LVL143>:
    b868:	011988b3          	add	a7,s3,a7

0000b86c <.LVL144>:
    b86c:	0098f463          	bgeu	a7,s1,b874 <.L73>
    b870:	01b383b3          	add	t2,t2,s11

0000b874 <.L73>:
    b874:	0108d493          	srl	s1,a7,0x10

0000b878 <.LVL146>:
    b878:	01d8f8b3          	and	a7,a7,t4

0000b87c <.LVL147>:
    b87c:	01de7e33          	and	t3,t3,t4

0000b880 <.LVL148>:
    b880:	01089893          	sll	a7,a7,0x10
    b884:	01c888b3          	add	a7,a7,t3

0000b888 <.LBB38>:
    b888:	01412e03          	lw	t3,20(sp)

0000b88c <.LBB39>:
    b88c:	007484b3          	add	s1,s1,t2

0000b890 <.LBB40>:
    b890:	02ee09b3          	mul	s3,t3,a4

0000b894 <.LVL150>:
    b894:	03c283b3          	mul	t2,t0,t3

0000b898 <.LVL151>:
    b898:	00c12e03          	lw	t3,12(sp)
    b89c:	0109db13          	srl	s6,s3,0x10
    b8a0:	03c28ab3          	mul	s5,t0,t3

0000b8a4 <.LVL152>:
    b8a4:	02ee0e33          	mul	t3,t3,a4

0000b8a8 <.LVL153>:
    b8a8:	007e0e33          	add	t3,t3,t2

0000b8ac <.LVL154>:
    b8ac:	01cb0e33          	add	t3,s6,t3

0000b8b0 <.LVL155>:
    b8b0:	007e7463          	bgeu	t3,t2,b8b8 <.L74>
    b8b4:	01ba8ab3          	add	s5,s5,s11

0000b8b8 <.L74>:
    b8b8:	01de73b3          	and	t2,t3,t4
    b8bc:	01d9f9b3          	and	s3,s3,t4

0000b8c0 <.LVL157>:
    b8c0:	01039393          	sll	t2,t2,0x10
    b8c4:	013383b3          	add	t2,t2,s3
    b8c8:	007483b3          	add	t2,s1,t2

0000b8cc <.LBB43>:
    b8cc:	01812983          	lw	s3,24(sp)

0000b8d0 <.LBB45>:
    b8d0:	0093b4b3          	sltu	s1,t2,s1

0000b8d4 <.LBB46>:
    b8d4:	010e5e13          	srl	t3,t3,0x10

0000b8d8 <.LBB47>:
    b8d8:	009e0e33          	add	t3,t3,s1
    b8dc:	015e0e33          	add	t3,t3,s5

0000b8e0 <.LBB48>:
    b8e0:	03328ab3          	mul	s5,t0,s3

0000b8e4 <.LVL162>:
    b8e4:	01012983          	lw	s3,16(sp)
    b8e8:	01812483          	lw	s1,24(sp)
    b8ec:	033289b3          	mul	s3,t0,s3
    b8f0:	01012283          	lw	t0,16(sp)

0000b8f4 <.LVL163>:
    b8f4:	02e484b3          	mul	s1,s1,a4

0000b8f8 <.LVL164>:
    b8f8:	02e28733          	mul	a4,t0,a4

0000b8fc <.LVL165>:
    b8fc:	0104d293          	srl	t0,s1,0x10
    b900:	01570733          	add	a4,a4,s5

0000b904 <.LVL166>:
    b904:	00e28733          	add	a4,t0,a4

0000b908 <.LVL167>:
    b908:	01577463          	bgeu	a4,s5,b910 <.L77>
    b90c:	01b989b3          	add	s3,s3,s11

0000b910 <.L77>:
    b910:	01d772b3          	and	t0,a4,t4
    b914:	01029293          	sll	t0,t0,0x10
    b918:	01d4f4b3          	and	s1,s1,t4

0000b91c <.LVL169>:
    b91c:	009282b3          	add	t0,t0,s1
    b920:	005e02b3          	add	t0,t3,t0

0000b924 <.LBB51>:
    b924:	01075713          	srl	a4,a4,0x10

0000b928 <.LBB53>:
    b928:	01c2be33          	sltu	t3,t0,t3

0000b92c <.LVL172>:
    b92c:	01c70733          	add	a4,a4,t3
    b930:	01370733          	add	a4,a4,s3

0000b934 <.LBE53>:
    b934:	00cc2983          	lw	s3,12(s8)

0000b938 <.LVL174>:
    b938:	00e7ee63          	bltu	a5,a4,b954 <.L80>
    b93c:	0ef71463          	bne	a4,a5,ba24 <.L81>
    b940:	00566a63          	bltu	a2,t0,b954 <.L80>
    b944:	0e561063          	bne	a2,t0,ba24 <.L81>
    b948:	0075e663          	bltu	a1,t2,b954 <.L80>
    b94c:	0c759c63          	bne	a1,t2,ba24 <.L81>
    b950:	0d19fa63          	bgeu	s3,a7,ba24 <.L81>

0000b954 <.L80>:
    b954:	ffff0e13          	add	t3,t5,-1
    b958:	01380ab3          	add	s5,a6,s3

0000b95c <.LVL175>:
    b95c:	00b30b33          	add	s6,t1,a1

0000b960 <.LVL176>:
    b960:	01ca2623          	sw	t3,12(s4)

0000b964 <.LBB78>:
    b964:	010abe33          	sltu	t3,s5,a6
    b968:	01cb04b3          	add	s1,s6,t3
    b96c:	03c12623          	sw	t3,44(sp)
    b970:	006b3e33          	sltu	t3,s6,t1
    b974:	0164bb33          	sltu	s6,s1,s6
    b978:	00cf8bb3          	add	s7,t6,a2
    b97c:	016e6e33          	or	t3,t3,s6
    b980:	01cb8e33          	add	t3,s7,t3
    b984:	01fbbb33          	sltu	s6,s7,t6
    b988:	017e3bb3          	sltu	s7,t3,s7
    b98c:	017b6b33          	or	s6,s6,s7
    b990:	00ab0b33          	add	s6,s6,a0
    b994:	016787b3          	add	a5,a5,s6

0000b998 <.LVL177>:
    b998:	000a8993          	mv	s3,s5

0000b99c <.LVL178>:
    b99c:	00048593          	mv	a1,s1
    b9a0:	000e0613          	mv	a2,t3

0000b9a4 <.LBE78>:
    b9a4:	02f56063          	bltu	a0,a5,b9c4 <.L92>
    b9a8:	06f51e63          	bne	a0,a5,ba24 <.L81>
    b9ac:	01cfec63          	bltu	t6,t3,b9c4 <.L92>
    b9b0:	07cf9a63          	bne	t6,t3,ba24 <.L81>
    b9b4:	00936863          	bltu	t1,s1,b9c4 <.L92>
    b9b8:	06931663          	bne	t1,s1,ba24 <.L81>
    b9bc:	010abb33          	sltu	s6,s5,a6
    b9c0:	060b1263          	bnez	s6,ba24 <.L81>

0000b9c4 <.L92>:
    b9c4:	00e7ee63          	bltu	a5,a4,b9e0 <.L93>
    b9c8:	04f71e63          	bne	a4,a5,ba24 <.L81>
    b9cc:	005e6a63          	bltu	t3,t0,b9e0 <.L93>
    b9d0:	045e1a63          	bne	t3,t0,ba24 <.L81>
    b9d4:	0074e663          	bltu	s1,t2,b9e0 <.L93>
    b9d8:	04749663          	bne	s1,t2,ba24 <.L81>
    b9dc:	051af463          	bgeu	s5,a7,ba24 <.L81>

0000b9e0 <.L93>:
    b9e0:	01580ab3          	add	s5,a6,s5
    b9e4:	009304b3          	add	s1,t1,s1

0000b9e8 <.LBB79>:
    b9e8:	010ab5b3          	sltu	a1,s5,a6
    b9ec:	00b485b3          	add	a1,s1,a1
    b9f0:	0064b633          	sltu	a2,s1,t1
    b9f4:	0095b4b3          	sltu	s1,a1,s1
    b9f8:	01cf8e33          	add	t3,t6,t3
    b9fc:	00966633          	or	a2,a2,s1

0000ba00 <.LBE79>:
    ba00:	ffef0f13          	add	t5,t5,-2

0000ba04 <.LVL180>:
    ba04:	00ce0633          	add	a2,t3,a2
    ba08:	01ea2623          	sw	t5,12(s4)

0000ba0c <.LBB80>:
    ba0c:	01fe3f33          	sltu	t5,t3,t6

0000ba10 <.LVL182>:
    ba10:	01c63e33          	sltu	t3,a2,t3
    ba14:	01cf6f33          	or	t5,t5,t3
    ba18:	00af0f33          	add	t5,t5,a0
    ba1c:	000a8993          	mv	s3,s5

0000ba20 <.LVL183>:
    ba20:	01e787b3          	add	a5,a5,t5

0000ba24 <.L81>:
    ba24:	41198ab3          	sub	s5,s3,a7
    ba28:	407584b3          	sub	s1,a1,t2
    ba2c:	0159be33          	sltu	t3,s3,s5
    ba30:	0095bb33          	sltu	s6,a1,s1
    ba34:	000a8f13          	mv	t5,s5

0000ba38 <.LVL185>:
    ba38:	41c48e33          	sub	t3,s1,t3

0000ba3c <.LVL186>:
    ba3c:	00000593          	li	a1,0

0000ba40 <.LVL187>:
    ba40:	0159f463          	bgeu	s3,s5,ba48 <.L108>
    ba44:	0014b593          	seqz	a1,s1

0000ba48 <.L108>:
    ba48:	0165e5b3          	or	a1,a1,s6

0000ba4c <.LVL188>:
    ba4c:	40560b33          	sub	s6,a2,t0

0000ba50 <.LVL189>:
    ba50:	01663633          	sltu	a2,a2,s6

0000ba54 <.LVL190>:
    ba54:	40bb04b3          	sub	s1,s6,a1

0000ba58 <.LVL191>:
    ba58:	00000993          	li	s3,0

0000ba5c <.LVL192>:
    ba5c:	00058463          	beqz	a1,ba64 <.L111>
    ba60:	001b3993          	seqz	s3,s6

0000ba64 <.L111>:
    ba64:	40e787b3          	sub	a5,a5,a4

0000ba68 <.LVL194>:
    ba68:	00c9e9b3          	or	s3,s3,a2

0000ba6c <.LVL195>:
    ba6c:	413787b3          	sub	a5,a5,s3

0000ba70 <.LBE81>:
    ba70:	d00c9ee3          	bnez	s9,b78c <.L56>
    ba74:	01589863          	bne	a7,s5,ba84 <.L112>
    ba78:	007e1663          	bne	t3,t2,ba84 <.L112>
    ba7c:	00549463          	bne	s1,t0,ba84 <.L112>
    ba80:	00f70863          	beq	a4,a5,ba90 <.L114>

0000ba84 <.L112>:
    ba84:	05012783          	lw	a5,80(sp)
    ba88:	0017e793          	or	a5,a5,1
    ba8c:	04f12823          	sw	a5,80(sp)

0000ba90 <.L114>:
  FP_PACK_Q (r, R);
    ba90:	000047b7          	lui	a5,0x4
    ba94:	fff78793          	add	a5,a5,-1 # 3fff <_dl_aux_init+0x3>
    ba98:	00f687b3          	add	a5,a3,a5

0000ba9c <.LVL197>:
    ba9c:	1af05463          	blez	a5,bc44 <.L116>
    baa0:	05012703          	lw	a4,80(sp)
    baa4:	00777613          	and	a2,a4,7
    baa8:	04060463          	beqz	a2,baf0 <.L117>
    baac:	00f77613          	and	a2,a4,15
    bab0:	00400593          	li	a1,4
    bab4:	02b60e63          	beq	a2,a1,baf0 <.L117>

0000bab8 <.LBB83>:
    bab8:	00470713          	add	a4,a4,4
    babc:	00473613          	sltiu	a2,a4,4
    bac0:	04e12823          	sw	a4,80(sp)

0000bac4 <.LVL198>:
    bac4:	05412703          	lw	a4,84(sp)

0000bac8 <.LVL199>:
    bac8:	00e60733          	add	a4,a2,a4
    bacc:	04e12a23          	sw	a4,84(sp)

0000bad0 <.LVL200>:
    bad0:	00c73733          	sltu	a4,a4,a2

0000bad4 <.LVL201>:
    bad4:	05812603          	lw	a2,88(sp)
    bad8:	00e60733          	add	a4,a2,a4

0000badc <.LVL202>:
    badc:	04e12c23          	sw	a4,88(sp)

0000bae0 <.LVL203>:
    bae0:	00c73733          	sltu	a4,a4,a2

0000bae4 <.LVL204>:
    bae4:	05c12603          	lw	a2,92(sp)
    bae8:	00c70733          	add	a4,a4,a2

0000baec <.LVL205>:
    baec:	04e12e23          	sw	a4,92(sp)

0000baf0 <.L117>:
    baf0:	05c12703          	lw	a4,92(sp)
    baf4:	00b71613          	sll	a2,a4,0xb
    baf8:	00065e63          	bgez	a2,bb14 <.L122>
    bafc:	fff007b7          	lui	a5,0xfff00

0000bb00 <.LVL207>:
    bb00:	fff78793          	add	a5,a5,-1 # ffefffff <_ebss+0xffee9f4f>
    bb04:	00f77733          	and	a4,a4,a5
    bb08:	000047b7          	lui	a5,0x4

0000bb0c <.LVL208>:
    bb0c:	04e12e23          	sw	a4,92(sp)
    bb10:	00f687b3          	add	a5,a3,a5

0000bb14 <.L122>:
    bb14:	05010713          	add	a4,sp,80
    bb18:	05c10593          	add	a1,sp,92

0000bb1c <.L123>:
    bb1c:	00072683          	lw	a3,0(a4)
    bb20:	00472603          	lw	a2,4(a4)
    bb24:	00470713          	add	a4,a4,4
    bb28:	0036d693          	srl	a3,a3,0x3
    bb2c:	01d61613          	sll	a2,a2,0x1d
    bb30:	00c6e6b3          	or	a3,a3,a2
    bb34:	fed72e23          	sw	a3,-4(a4)
    bb38:	feb712e3          	bne	a4,a1,bb1c <.L123>

0000bb3c <.LBE84>:
    bb3c:	000086b7          	lui	a3,0x8
    bb40:	ffe68693          	add	a3,a3,-2 # 7ffe <.L4+0xe>

0000bb44 <.LBB85>:
    bb44:	05c12703          	lw	a4,92(sp)

0000bb48 <.LBE85>:
    bb48:	0af6ce63          	blt	a3,a5,bc04 <.L39>

0000bb4c <.LBB86>:
    bb4c:	00375713          	srl	a4,a4,0x3
    bb50:	04e12e23          	sw	a4,92(sp)

0000bb54 <.L125>:
    bb54:	00f91913          	sll	s2,s2,0xf

0000bb58 <.LVL213>:
    bb58:	00f96933          	or	s2,s2,a5

0000bb5c <.LBE87>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    bb5c:	05012783          	lw	a5,80(sp)

0000bb60 <.LBB88>:
  FP_PACK_Q (r, R);
    bb60:	05c12703          	lw	a4,92(sp)
    bb64:	07211723          	sh	s2,110(sp)

0000bb68 <.LBE88>:
  return r;
    bb68:	00f42023          	sw	a5,0(s0)
    bb6c:	05412783          	lw	a5,84(sp)

0000bb70 <.LBB89>:
  FP_PACK_Q (r, R);
    bb70:	06e11623          	sh	a4,108(sp)

0000bb74 <.LBE89>:
}
    bb74:	0ac12083          	lw	ra,172(sp)
  return r;
    bb78:	00f42223          	sw	a5,4(s0)
    bb7c:	05812783          	lw	a5,88(sp)

0000bb80 <.LVL216>:
}
    bb80:	00040513          	mv	a0,s0
    bb84:	0a412483          	lw	s1,164(sp)
  return r;
    bb88:	00f42423          	sw	a5,8(s0)
    bb8c:	06c12783          	lw	a5,108(sp)
}
    bb90:	0a012903          	lw	s2,160(sp)
    bb94:	09c12983          	lw	s3,156(sp)
  return r;
    bb98:	00f42623          	sw	a5,12(s0)
}
    bb9c:	0a812403          	lw	s0,168(sp)
    bba0:	09812a03          	lw	s4,152(sp)
    bba4:	09412a83          	lw	s5,148(sp)
    bba8:	09012b03          	lw	s6,144(sp)
    bbac:	08c12b83          	lw	s7,140(sp)
    bbb0:	08812c03          	lw	s8,136(sp)
    bbb4:	08412c83          	lw	s9,132(sp)
    bbb8:	08012d03          	lw	s10,128(sp)
    bbbc:	07c12d83          	lw	s11,124(sp)
    bbc0:	0b010113          	add	sp,sp,176

0000bbc4 <.LVL218>:
    bbc4:	00008067          	ret

0000bbc8 <.L37>:
  FP_DIV_Q (R, A, B);
    bbc8:	03012783          	lw	a5,48(sp)

0000bbcc <.LBB90>:
  FP_UNPACK_Q (A, a);
    bbcc:	00098913          	mv	s2,s3

0000bbd0 <.LBE90>:
  FP_DIV_Q (R, A, B);
    bbd0:	000a0713          	mv	a4,s4

0000bbd4 <.LVL221>:
    bbd4:	04f12823          	sw	a5,80(sp)
    bbd8:	03412783          	lw	a5,52(sp)
    bbdc:	04f12a23          	sw	a5,84(sp)
    bbe0:	03812783          	lw	a5,56(sp)
    bbe4:	04f12c23          	sw	a5,88(sp)
    bbe8:	03c12783          	lw	a5,60(sp)

0000bbec <.L115>:
    bbec:	04f12e23          	sw	a5,92(sp)

0000bbf0 <.LVL223>:
  FP_PACK_Q (r, R);
    bbf0:	00100793          	li	a5,1
    bbf4:	24f70863          	beq	a4,a5,be44 <.L195>
    bbf8:	e8070ce3          	beqz	a4,ba90 <.L114>
    bbfc:	00200793          	li	a5,2
    bc00:	24f71c63          	bne	a4,a5,be58 <.L35>

0000bc04 <.L39>:
    bc04:	000087b7          	lui	a5,0x8
    bc08:	04012e23          	sw	zero,92(sp)
    bc0c:	04012c23          	sw	zero,88(sp)
    bc10:	04012a23          	sw	zero,84(sp)
    bc14:	04012823          	sw	zero,80(sp)
    bc18:	fff78793          	add	a5,a5,-1 # 7fff <.L4+0xf>
    bc1c:	f39ff06f          	j	bb54 <.L125>

0000bc20 <.L38>:
  FP_DIV_Q (R, A, B);
    bc20:	04012783          	lw	a5,64(sp)

0000bc24 <.LBB91>:
  FP_UNPACK_Q (B, b);
    bc24:	000a8913          	mv	s2,s5

0000bc28 <.LBE91>:
  FP_DIV_Q (R, A, B);
    bc28:	04f12823          	sw	a5,80(sp)
    bc2c:	04412783          	lw	a5,68(sp)
    bc30:	04f12a23          	sw	a5,84(sp)
    bc34:	04812783          	lw	a5,72(sp)
    bc38:	04f12c23          	sw	a5,88(sp)
    bc3c:	04c12783          	lw	a5,76(sp)

0000bc40 <.LVL227>:
    bc40:	fadff06f          	j	bbec <.L115>

0000bc44 <.L116>:
  FP_PACK_Q (r, R);
    bc44:	00100693          	li	a3,1
    bc48:	40f686b3          	sub	a3,a3,a5

0000bc4c <.LVL229>:
    bc4c:	07400793          	li	a5,116
    bc50:	1cd7ca63          	blt	a5,a3,be24 <.L126>

0000bc54 <.LBB93>:
    bc54:	05010613          	add	a2,sp,80
    bc58:	4056d713          	sra	a4,a3,0x5

0000bc5c <.LVL230>:
    bc5c:	00060513          	mv	a0,a2
    bc60:	01f6f693          	and	a3,a3,31

0000bc64 <.LVL231>:
    bc64:	00000793          	li	a5,0
    bc68:	00000593          	li	a1,0

0000bc6c <.L127>:
    bc6c:	02e59e63          	bne	a1,a4,bca8 <.L128>
    bc70:	00300593          	li	a1,3

0000bc74 <.LVL233>:
    bc74:	40e585b3          	sub	a1,a1,a4
    bc78:	00271513          	sll	a0,a4,0x2
    bc7c:	04069063          	bnez	a3,bcbc <.L129>
    bc80:	00060813          	mv	a6,a2

0000bc84 <.L130>:
    bc84:	00a808b3          	add	a7,a6,a0
    bc88:	0008a883          	lw	a7,0(a7) # 10000 <.LBE193+0x4>
    bc8c:	00168693          	add	a3,a3,1

0000bc90 <.LVL235>:
    bc90:	00480813          	add	a6,a6,4
    bc94:	ff182e23          	sw	a7,-4(a6)

0000bc98 <.LVL236>:
    bc98:	fed5d6e3          	bge	a1,a3,bc84 <.L130>
    bc9c:	00400693          	li	a3,4

0000bca0 <.LVL237>:
    bca0:	40e68733          	sub	a4,a3,a4

0000bca4 <.LVL238>:
    bca4:	06c0006f          	j	bd10 <.L134>

0000bca8 <.L128>:
    bca8:	00052803          	lw	a6,0(a0)
    bcac:	00158593          	add	a1,a1,1

0000bcb0 <.LVL240>:
    bcb0:	00450513          	add	a0,a0,4
    bcb4:	0107e7b3          	or	a5,a5,a6

0000bcb8 <.LVL241>:
    bcb8:	fb5ff06f          	j	bc6c <.L127>

0000bcbc <.L129>:
    bcbc:	04050813          	add	a6,a0,64
    bcc0:	03010893          	add	a7,sp,48
    bcc4:	01180833          	add	a6,a6,a7
    bcc8:	fe082803          	lw	a6,-32(a6)
    bccc:	02000313          	li	t1,32
    bcd0:	40d30333          	sub	t1,t1,a3
    bcd4:	00681833          	sll	a6,a6,t1
    bcd8:	0107e7b3          	or	a5,a5,a6

0000bcdc <.LVL243>:
    bcdc:	00000e13          	li	t3,0
    bce0:	00a60833          	add	a6,a2,a0
    bce4:	40a00533          	neg	a0,a0

0000bce8 <.L132>:
    bce8:	0ebe4063          	blt	t3,a1,bdc8 <.L133>
    bcec:	00400513          	li	a0,4
    bcf0:	00259593          	sll	a1,a1,0x2
    bcf4:	40e50733          	sub	a4,a0,a4

0000bcf8 <.LVL245>:
    bcf8:	04058593          	add	a1,a1,64
    bcfc:	03010513          	add	a0,sp,48
    bd00:	00a585b3          	add	a1,a1,a0
    bd04:	05c12503          	lw	a0,92(sp)
    bd08:	00d556b3          	srl	a3,a0,a3

0000bd0c <.LVL246>:
    bd0c:	fed5a023          	sw	a3,-32(a1)

0000bd10 <.L134>:
    bd10:	00400693          	li	a3,4
    bd14:	40e686b3          	sub	a3,a3,a4
    bd18:	00269693          	sll	a3,a3,0x2
    bd1c:	00271713          	sll	a4,a4,0x2
    bd20:	00800593          	li	a1,8
    bd24:	00e60733          	add	a4,a2,a4
    bd28:	00b6ea63          	bltu	a3,a1,bd3c <.L135>
    bd2c:	00072023          	sw	zero,0(a4)
    bd30:	00072223          	sw	zero,4(a4)
    bd34:	ff868693          	add	a3,a3,-8
    bd38:	00870713          	add	a4,a4,8

0000bd3c <.L135>:
    bd3c:	00400593          	li	a1,4
    bd40:	00b6e463          	bltu	a3,a1,bd48 <.L136>
    bd44:	00072023          	sw	zero,0(a4)

0000bd48 <.L136>:
    bd48:	05012703          	lw	a4,80(sp)

0000bd4c <.LBB95>:
    bd4c:	00f037b3          	snez	a5,a5

0000bd50 <.LBE95>:
    bd50:	00e7e7b3          	or	a5,a5,a4
    bd54:	04f12823          	sw	a5,80(sp)

0000bd58 <.LBE93>:
    bd58:	0077f713          	and	a4,a5,7
    bd5c:	04070463          	beqz	a4,bda4 <.L137>
    bd60:	00f7f713          	and	a4,a5,15
    bd64:	00400693          	li	a3,4
    bd68:	02d70e63          	beq	a4,a3,bda4 <.L137>

0000bd6c <.LBB97>:
    bd6c:	05412703          	lw	a4,84(sp)
    bd70:	00478793          	add	a5,a5,4
    bd74:	04f12823          	sw	a5,80(sp)

0000bd78 <.LVL249>:
    bd78:	0047b793          	sltiu	a5,a5,4

0000bd7c <.LVL250>:
    bd7c:	00f707b3          	add	a5,a4,a5
    bd80:	04f12a23          	sw	a5,84(sp)

0000bd84 <.LVL251>:
    bd84:	00e7b7b3          	sltu	a5,a5,a4

0000bd88 <.LVL252>:
    bd88:	05812703          	lw	a4,88(sp)
    bd8c:	00f707b3          	add	a5,a4,a5

0000bd90 <.LVL253>:
    bd90:	04f12c23          	sw	a5,88(sp)

0000bd94 <.LVL254>:
    bd94:	00e7b7b3          	sltu	a5,a5,a4

0000bd98 <.LVL255>:
    bd98:	05c12703          	lw	a4,92(sp)
    bd9c:	00e787b3          	add	a5,a5,a4

0000bda0 <.LVL256>:
    bda0:	04f12e23          	sw	a5,92(sp)

0000bda4 <.L137>:
    bda4:	05c12703          	lw	a4,92(sp)
    bda8:	00c71793          	sll	a5,a4,0xc
    bdac:	0407d263          	bgez	a5,bdf0 <.L142>

0000bdb0 <.LVL258>:
    bdb0:	04012e23          	sw	zero,92(sp)
    bdb4:	04012c23          	sw	zero,88(sp)
    bdb8:	04012a23          	sw	zero,84(sp)
    bdbc:	04012823          	sw	zero,80(sp)
    bdc0:	00100793          	li	a5,1
    bdc4:	d91ff06f          	j	bb54 <.L125>

0000bdc8 <.L133>:
    bdc8:	00082883          	lw	a7,0(a6)
    bdcc:	00482e83          	lw	t4,4(a6)
    bdd0:	00a80f33          	add	t5,a6,a0
    bdd4:	00d8d8b3          	srl	a7,a7,a3
    bdd8:	006e9eb3          	sll	t4,t4,t1
    bddc:	01d8e8b3          	or	a7,a7,t4
    bde0:	011f2023          	sw	a7,0(t5)

0000bde4 <.LVL260>:
    bde4:	001e0e13          	add	t3,t3,1

0000bde8 <.LVL261>:
    bde8:	00480813          	add	a6,a6,4
    bdec:	efdff06f          	j	bce8 <.L132>

0000bdf0 <.L142>:
    bdf0:	00c60593          	add	a1,a2,12

0000bdf4 <.L143>:
    bdf4:	00062783          	lw	a5,0(a2)
    bdf8:	00462683          	lw	a3,4(a2)
    bdfc:	00460613          	add	a2,a2,4
    be00:	0037d793          	srl	a5,a5,0x3
    be04:	01d69693          	sll	a3,a3,0x1d
    be08:	00d7e7b3          	or	a5,a5,a3
    be0c:	fef62e23          	sw	a5,-4(a2)
    be10:	fec592e3          	bne	a1,a2,bdf4 <.L143>

0000be14 <.LVL264>:
    be14:	00375713          	srl	a4,a4,0x3
    be18:	04e12e23          	sw	a4,92(sp)

0000be1c <.L144>:
    be1c:	00000793          	li	a5,0
    be20:	d35ff06f          	j	bb54 <.L125>

0000be24 <.L126>:
    be24:	05412703          	lw	a4,84(sp)
    be28:	05012783          	lw	a5,80(sp)
    be2c:	00e7e7b3          	or	a5,a5,a4
    be30:	05812703          	lw	a4,88(sp)
    be34:	00e7e7b3          	or	a5,a5,a4
    be38:	05c12703          	lw	a4,92(sp)
    be3c:	00e7e7b3          	or	a5,a5,a4
    be40:	fc078ee3          	beqz	a5,be1c <.L144>

0000be44 <.L195>:
    be44:	04012e23          	sw	zero,92(sp)
    be48:	04012c23          	sw	zero,88(sp)
    be4c:	04012a23          	sw	zero,84(sp)

0000be50 <.LBB100>:
    be50:	04012823          	sw	zero,80(sp)
    be54:	fc9ff06f          	j	be1c <.L144>

0000be58 <.L35>:
    be58:	000087b7          	lui	a5,0x8
    be5c:	04f12e23          	sw	a5,92(sp)
    be60:	04012c23          	sw	zero,88(sp)
    be64:	04012a23          	sw	zero,84(sp)
    be68:	04012823          	sw	zero,80(sp)

0000be6c <.LVL270>:
    be6c:	fff78793          	add	a5,a5,-1 # 7fff <.L4+0xf>
    be70:	00000913          	li	s2,0
    be74:	ce1ff06f          	j	bb54 <.L125>

0000be78 <__eqtf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__eqtf2 (TFtype a, TFtype b)
{
    be78:	00c52783          	lw	a5,12(a0)
    be7c:	0005af03          	lw	t5,0(a1)
    be80:	0045af83          	lw	t6,4(a1)
    be84:	0085a283          	lw	t0,8(a1)
    be88:	00c5a583          	lw	a1,12(a1)

0000be8c <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    be8c:	00008737          	lui	a4,0x8
    be90:	0107d693          	srl	a3,a5,0x10
    be94:	fff70713          	add	a4,a4,-1 # 7fff <.L4+0xf>
    be98:	01079813          	sll	a6,a5,0x10

0000be9c <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    be9c:	01059e93          	sll	t4,a1,0x10

0000bea0 <.LBB5>:
  FP_UNPACK_RAW_Q (A, a);
    bea0:	01f7d613          	srl	a2,a5,0x1f
    bea4:	00e6f6b3          	and	a3,a3,a4

0000bea8 <.LBB6>:
  FP_UNPACK_RAW_Q (B, b);
    bea8:	0105d793          	srl	a5,a1,0x10

0000beac <.LBE6>:
{
    beac:	00052883          	lw	a7,0(a0)

0000beb0 <.LBB7>:
    beb0:	00452303          	lw	t1,4(a0)

0000beb4 <.LBB8>:
    beb4:	00852e03          	lw	t3,8(a0)

0000beb8 <.LBB9>:
    beb8:	ff010113          	add	sp,sp,-16

0000bebc <.LBB10>:
  FP_UNPACK_RAW_Q (A, a);
    bebc:	01085813          	srl	a6,a6,0x10

0000bec0 <.LBB11>:
  FP_UNPACK_RAW_Q (B, b);
    bec0:	010ede93          	srl	t4,t4,0x10

0000bec4 <.LVL5>:
    bec4:	00e7f7b3          	and	a5,a5,a4
    bec8:	01f5d593          	srl	a1,a1,0x1f

0000becc <.LBE11>:
  FP_CMP_EQ_Q (r, A, B, 1);
    becc:	02e69063          	bne	a3,a4,beec <.L2>
    bed0:	0068e733          	or	a4,a7,t1
    bed4:	01c76733          	or	a4,a4,t3
    bed8:	01076733          	or	a4,a4,a6
    bedc:	00100513          	li	a0,1
    bee0:	04071a63          	bnez	a4,bf34 <.L1>
    bee4:	04d79863          	bne	a5,a3,bf34 <.L1>
    bee8:	0080006f          	j	bef0 <.L6>

0000beec <.L2>:
    beec:	00e79c63          	bne	a5,a4,bf04 <.L5>

0000bef0 <.L6>:
    bef0:	01ff6733          	or	a4,t5,t6
    bef4:	00576733          	or	a4,a4,t0
    bef8:	01d76733          	or	a4,a4,t4
    befc:	00100513          	li	a0,1
    bf00:	02071a63          	bnez	a4,bf34 <.L1>

0000bf04 <.L5>:
    bf04:	00100513          	li	a0,1
    bf08:	02d79663          	bne	a5,a3,bf34 <.L1>
    bf0c:	03e89463          	bne	a7,t5,bf34 <.L1>
    bf10:	03f31263          	bne	t1,t6,bf34 <.L1>
    bf14:	025e1063          	bne	t3,t0,bf34 <.L1>
    bf18:	01d81e63          	bne	a6,t4,bf34 <.L1>
    bf1c:	02b60063          	beq	a2,a1,bf3c <.L14>
    bf20:	00079a63          	bnez	a5,bf34 <.L1>
    bf24:	0068e533          	or	a0,a7,t1
    bf28:	01c56533          	or	a0,a0,t3
    bf2c:	01056533          	or	a0,a0,a6
    bf30:	00a03533          	snez	a0,a0

0000bf34 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    bf34:	01010113          	add	sp,sp,16
    bf38:	00008067          	ret

0000bf3c <.L14>:
  FP_CMP_EQ_Q (r, A, B, 1);
    bf3c:	00000513          	li	a0,0
    bf40:	ff5ff06f          	j	bf34 <.L1>

0000bf44 <__getf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__getf2 (TFtype a, TFtype b)
{
    bf44:	00c52783          	lw	a5,12(a0)
    bf48:	00c5a683          	lw	a3,12(a1)

0000bf4c <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    bf4c:	00008737          	lui	a4,0x8
    bf50:	0107d613          	srl	a2,a5,0x10
    bf54:	fff70713          	add	a4,a4,-1 # 7fff <.L4+0xf>
    bf58:	01079813          	sll	a6,a5,0x10

0000bf5c <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    bf5c:	01069293          	sll	t0,a3,0x10

0000bf60 <.LBE4>:
{
    bf60:	00052883          	lw	a7,0(a0)

0000bf64 <.LBB5>:
    bf64:	00452303          	lw	t1,4(a0)

0000bf68 <.LBB6>:
    bf68:	00852e03          	lw	t3,8(a0)

0000bf6c <.LBB7>:
  FP_UNPACK_RAW_Q (A, a);
    bf6c:	00e67633          	and	a2,a2,a4

0000bf70 <.LBB8>:
  FP_UNPACK_RAW_Q (B, b);
    bf70:	0106d513          	srl	a0,a3,0x10

0000bf74 <.LBE8>:
{
    bf74:	0005ae83          	lw	t4,0(a1)
    bf78:	0045af03          	lw	t5,4(a1)
    bf7c:	0085af83          	lw	t6,8(a1)
    bf80:	ff010113          	add	sp,sp,-16

0000bf84 <.LBB9>:
  FP_UNPACK_RAW_Q (A, a);
    bf84:	01085813          	srl	a6,a6,0x10

0000bf88 <.LVL4>:
    bf88:	01f7d793          	srl	a5,a5,0x1f

0000bf8c <.LBB10>:
  FP_UNPACK_RAW_Q (B, b);
    bf8c:	0102d293          	srl	t0,t0,0x10

0000bf90 <.LVL6>:
    bf90:	00e57533          	and	a0,a0,a4

0000bf94 <.LVL7>:
    bf94:	01f6d693          	srl	a3,a3,0x1f

0000bf98 <.LBE10>:
  FP_CMP_Q (r, A, B, -2, 2);
    bf98:	00e61a63          	bne	a2,a4,bfac <.L2>
    bf9c:	01136733          	or	a4,t1,a7
    bfa0:	01c76733          	or	a4,a4,t3
    bfa4:	01076733          	or	a4,a4,a6
    bfa8:	0a071463          	bnez	a4,c050 <.L17>

0000bfac <.L2>:
    bfac:	00008737          	lui	a4,0x8
    bfb0:	fff70713          	add	a4,a4,-1 # 7fff <.L4+0xf>
    bfb4:	00e51a63          	bne	a0,a4,bfc8 <.L4>
    bfb8:	01eee733          	or	a4,t4,t5
    bfbc:	01f76733          	or	a4,a4,t6
    bfc0:	00576733          	or	a4,a4,t0
    bfc4:	08071663          	bnez	a4,c050 <.L17>

0000bfc8 <.L4>:
    bfc8:	00000713          	li	a4,0
    bfcc:	00061a63          	bnez	a2,bfe0 <.L5>
    bfd0:	01136733          	or	a4,t1,a7
    bfd4:	01c76733          	or	a4,a4,t3
    bfd8:	01076733          	or	a4,a4,a6
    bfdc:	00173713          	seqz	a4,a4

0000bfe0 <.L5>:
    bfe0:	06051c63          	bnez	a0,c058 <.L6>
    bfe4:	01eee5b3          	or	a1,t4,t5
    bfe8:	01f5e5b3          	or	a1,a1,t6
    bfec:	0055e5b3          	or	a1,a1,t0

0000bff0 <.LVL10>:
    bff0:	00070c63          	beqz	a4,c008 <.L7>
    bff4:	02058063          	beqz	a1,c014 <.L1>

0000bff8 <.L39>:
    bff8:	00100513          	li	a0,1

0000bffc <.LVL12>:
    bffc:	00069c63          	bnez	a3,c014 <.L1>

0000c000 <.L35>:
    c000:	fff00513          	li	a0,-1
    c004:	0100006f          	j	c014 <.L1>

0000c008 <.L7>:
    c008:	04059a63          	bnez	a1,c05c <.L8>

0000c00c <.L12>:
    c00c:	fff00513          	li	a0,-1

0000c010 <.LVL15>:
    c010:	04078e63          	beqz	a5,c06c <.L34>

0000c014 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    c014:	01010113          	add	sp,sp,16
    c018:	00008067          	ret

0000c01c <.L10>:
  FP_CMP_Q (r, A, B, -2, 2);
    c01c:	fca64ee3          	blt	a2,a0,bff8 <.L39>
    c020:	ff02e6e3          	bltu	t0,a6,c00c <.L12>
    c024:	02581063          	bne	a6,t0,c044 <.L13>
    c028:	ffcfe2e3          	bltu	t6,t3,c00c <.L12>
    c02c:	01fe1c63          	bne	t3,t6,c044 <.L13>
    c030:	fc6f6ee3          	bltu	t5,t1,c00c <.L12>
    c034:	01e31863          	bne	t1,t5,c044 <.L13>
    c038:	fd1eeae3          	bltu	t4,a7,c00c <.L12>
    c03c:	00000513          	li	a0,0

0000c040 <.LVL18>:
    c040:	fdd8fae3          	bgeu	a7,t4,c014 <.L1>

0000c044 <.L13>:
    c044:	00100513          	li	a0,1
    c048:	fc0796e3          	bnez	a5,c014 <.L1>
    c04c:	fb5ff06f          	j	c000 <.L35>

0000c050 <.L17>:
    c050:	ffe00513          	li	a0,-2

0000c054 <.LVL20>:
    c054:	fc1ff06f          	j	c014 <.L1>

0000c058 <.L6>:
    c058:	fa0710e3          	bnez	a4,bff8 <.L39>

0000c05c <.L8>:
    c05c:	faf698e3          	bne	a3,a5,c00c <.L12>
    c060:	fac55ee3          	bge	a0,a2,c01c <.L10>
    c064:	fff00513          	li	a0,-1

0000c068 <.LVL23>:
    c068:	fa0696e3          	bnez	a3,c014 <.L1>

0000c06c <.L34>:
    c06c:	00100513          	li	a0,1
    c070:	fa5ff06f          	j	c014 <.L1>

0000c074 <__letf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__letf2 (TFtype a, TFtype b)
{
    c074:	00c52783          	lw	a5,12(a0)
    c078:	00c5a683          	lw	a3,12(a1)

0000c07c <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    c07c:	00008737          	lui	a4,0x8
    c080:	0107d613          	srl	a2,a5,0x10
    c084:	fff70713          	add	a4,a4,-1 # 7fff <.L4+0xf>
    c088:	01079813          	sll	a6,a5,0x10

0000c08c <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    c08c:	01069293          	sll	t0,a3,0x10

0000c090 <.LBE4>:
{
    c090:	00052883          	lw	a7,0(a0)

0000c094 <.LBB5>:
    c094:	00452303          	lw	t1,4(a0)

0000c098 <.LBB6>:
    c098:	00852e03          	lw	t3,8(a0)

0000c09c <.LBB7>:
  FP_UNPACK_RAW_Q (A, a);
    c09c:	00e67633          	and	a2,a2,a4

0000c0a0 <.LBB8>:
  FP_UNPACK_RAW_Q (B, b);
    c0a0:	0106d513          	srl	a0,a3,0x10

0000c0a4 <.LBE8>:
{
    c0a4:	0005ae83          	lw	t4,0(a1)
    c0a8:	0045af03          	lw	t5,4(a1)
    c0ac:	0085af83          	lw	t6,8(a1)
    c0b0:	ff010113          	add	sp,sp,-16

0000c0b4 <.LBB9>:
  FP_UNPACK_RAW_Q (A, a);
    c0b4:	01085813          	srl	a6,a6,0x10

0000c0b8 <.LVL4>:
    c0b8:	01f7d793          	srl	a5,a5,0x1f

0000c0bc <.LBB10>:
  FP_UNPACK_RAW_Q (B, b);
    c0bc:	0102d293          	srl	t0,t0,0x10

0000c0c0 <.LVL6>:
    c0c0:	00e57533          	and	a0,a0,a4

0000c0c4 <.LVL7>:
    c0c4:	01f6d693          	srl	a3,a3,0x1f

0000c0c8 <.LBE10>:
  FP_CMP_Q (r, A, B, 2, 2);
    c0c8:	00e61a63          	bne	a2,a4,c0dc <.L2>
    c0cc:	01136733          	or	a4,t1,a7
    c0d0:	01c76733          	or	a4,a4,t3
    c0d4:	01076733          	or	a4,a4,a6
    c0d8:	0a071463          	bnez	a4,c180 <.L17>

0000c0dc <.L2>:
    c0dc:	00008737          	lui	a4,0x8
    c0e0:	fff70713          	add	a4,a4,-1 # 7fff <.L4+0xf>
    c0e4:	00e51a63          	bne	a0,a4,c0f8 <.L4>
    c0e8:	01eee733          	or	a4,t4,t5
    c0ec:	01f76733          	or	a4,a4,t6
    c0f0:	00576733          	or	a4,a4,t0
    c0f4:	08071663          	bnez	a4,c180 <.L17>

0000c0f8 <.L4>:
    c0f8:	00000713          	li	a4,0
    c0fc:	00061a63          	bnez	a2,c110 <.L5>
    c100:	01136733          	or	a4,t1,a7
    c104:	01c76733          	or	a4,a4,t3
    c108:	01076733          	or	a4,a4,a6
    c10c:	00173713          	seqz	a4,a4

0000c110 <.L5>:
    c110:	06051c63          	bnez	a0,c188 <.L6>
    c114:	01eee5b3          	or	a1,t4,t5
    c118:	01f5e5b3          	or	a1,a1,t6
    c11c:	0055e5b3          	or	a1,a1,t0

0000c120 <.LVL10>:
    c120:	00070c63          	beqz	a4,c138 <.L7>
    c124:	02058063          	beqz	a1,c144 <.L1>

0000c128 <.L39>:
    c128:	00100513          	li	a0,1

0000c12c <.LVL12>:
    c12c:	00069c63          	bnez	a3,c144 <.L1>

0000c130 <.L35>:
    c130:	fff00513          	li	a0,-1
    c134:	0100006f          	j	c144 <.L1>

0000c138 <.L7>:
    c138:	04059a63          	bnez	a1,c18c <.L8>

0000c13c <.L12>:
    c13c:	fff00513          	li	a0,-1

0000c140 <.LVL15>:
    c140:	04078e63          	beqz	a5,c19c <.L34>

0000c144 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    c144:	01010113          	add	sp,sp,16
    c148:	00008067          	ret

0000c14c <.L10>:
  FP_CMP_Q (r, A, B, 2, 2);
    c14c:	fca64ee3          	blt	a2,a0,c128 <.L39>
    c150:	ff02e6e3          	bltu	t0,a6,c13c <.L12>
    c154:	02581063          	bne	a6,t0,c174 <.L13>
    c158:	ffcfe2e3          	bltu	t6,t3,c13c <.L12>
    c15c:	01fe1c63          	bne	t3,t6,c174 <.L13>
    c160:	fc6f6ee3          	bltu	t5,t1,c13c <.L12>
    c164:	01e31863          	bne	t1,t5,c174 <.L13>
    c168:	fd1eeae3          	bltu	t4,a7,c13c <.L12>
    c16c:	00000513          	li	a0,0

0000c170 <.LVL18>:
    c170:	fdd8fae3          	bgeu	a7,t4,c144 <.L1>

0000c174 <.L13>:
    c174:	00100513          	li	a0,1
    c178:	fc0796e3          	bnez	a5,c144 <.L1>
    c17c:	fb5ff06f          	j	c130 <.L35>

0000c180 <.L17>:
    c180:	00200513          	li	a0,2

0000c184 <.LVL20>:
    c184:	fc1ff06f          	j	c144 <.L1>

0000c188 <.L6>:
    c188:	fa0710e3          	bnez	a4,c128 <.L39>

0000c18c <.L8>:
    c18c:	faf698e3          	bne	a3,a5,c13c <.L12>
    c190:	fac55ee3          	bge	a0,a2,c14c <.L10>
    c194:	fff00513          	li	a0,-1

0000c198 <.LVL23>:
    c198:	fa0696e3          	bnez	a3,c144 <.L1>

0000c19c <.L34>:
    c19c:	00100513          	li	a0,1
    c1a0:	fa5ff06f          	j	c144 <.L1>

0000c1a4 <__multf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__multf3 (TFtype a, TFtype b)
{
    c1a4:	f5010113          	add	sp,sp,-176
    c1a8:	09412c23          	sw	s4,152(sp)
    c1ac:	00c5aa03          	lw	s4,12(a1)
    c1b0:	0005a783          	lw	a5,0(a1)
    c1b4:	0085a683          	lw	a3,8(a1)
    c1b8:	0a812423          	sw	s0,168(sp)
    c1bc:	00050413          	mv	s0,a0
    c1c0:	0045a503          	lw	a0,4(a1)

0000c1c4 <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_Q (A, a);
    c1c4:	010a1713          	sll	a4,s4,0x10

0000c1c8 <.LBE3>:
{
    c1c8:	0b212023          	sw	s2,160(sp)
    c1cc:	09312e23          	sw	s3,156(sp)
    c1d0:	00062903          	lw	s2,0(a2)
    c1d4:	00c62983          	lw	s3,12(a2)
    c1d8:	09512a23          	sw	s5,148(sp)
    c1dc:	09612823          	sw	s6,144(sp)
    c1e0:	00862a83          	lw	s5,8(a2)
    c1e4:	00462b03          	lw	s6,4(a2)

0000c1e8 <.LBB4>:
  FP_UNPACK_Q (A, a);
    c1e8:	00008637          	lui	a2,0x8

0000c1ec <.LBE4>:
{
    c1ec:	0a912223          	sw	s1,164(sp)

0000c1f0 <.LBB5>:
  FP_UNPACK_Q (A, a);
    c1f0:	01075713          	srl	a4,a4,0x10
    c1f4:	010a5493          	srl	s1,s4,0x10
    c1f8:	fff60613          	add	a2,a2,-1 # 7fff <.L4+0xf>
    c1fc:	05412e23          	sw	s4,92(sp)

0000c200 <.LBE5>:
{
    c200:	0a112623          	sw	ra,172(sp)
    c204:	09712623          	sw	s7,140(sp)
    c208:	09812423          	sw	s8,136(sp)
    c20c:	09912223          	sw	s9,132(sp)
    c210:	09a12023          	sw	s10,128(sp)
    c214:	07b12e23          	sw	s11,124(sp)

0000c218 <.LBB6>:
  FP_UNPACK_Q (A, a);
    c218:	04f12823          	sw	a5,80(sp)
    c21c:	04a12a23          	sw	a0,84(sp)
    c220:	04d12c23          	sw	a3,88(sp)
    c224:	02f12023          	sw	a5,32(sp)
    c228:	02a12223          	sw	a0,36(sp)
    c22c:	02d12423          	sw	a3,40(sp)
    c230:	02e12623          	sw	a4,44(sp)
    c234:	00c4f4b3          	and	s1,s1,a2

0000c238 <.LVL2>:
    c238:	01fa5a13          	srl	s4,s4,0x1f

0000c23c <.LBE6>:
    c23c:	080482e3          	beqz	s1,cac0 <.L2>
    c240:	1ac48ce3          	beq	s1,a2,cbf8 <.L3>
    c244:	000106b7          	lui	a3,0x10
    c248:	00d76733          	or	a4,a4,a3
    c24c:	02e12623          	sw	a4,44(sp)

0000c250 <.LBB7>:
    c250:	02010593          	add	a1,sp,32
    c254:	02c10713          	add	a4,sp,44

0000c258 <.L4>:
    c258:	00072683          	lw	a3,0(a4)
    c25c:	ffc72603          	lw	a2,-4(a4)
    c260:	ffc70713          	add	a4,a4,-4
    c264:	00369693          	sll	a3,a3,0x3
    c268:	01d65613          	srl	a2,a2,0x1d
    c26c:	00c6e6b3          	or	a3,a3,a2
    c270:	00d72223          	sw	a3,4(a4)
    c274:	fee592e3          	bne	a1,a4,c258 <.L4>

0000c278 <.LVL6>:
    c278:	00379793          	sll	a5,a5,0x3
    c27c:	02f12023          	sw	a5,32(sp)

0000c280 <.LBE7>:
    c280:	ffffc7b7          	lui	a5,0xffffc
    c284:	00178793          	add	a5,a5,1 # ffffc001 <_ebss+0xfffe5f51>
    c288:	00f484b3          	add	s1,s1,a5

0000c28c <.L209>:
    c28c:	00000b93          	li	s7,0

0000c290 <.L5>:
  FP_UNPACK_Q (B, b);
    c290:	01099513          	sll	a0,s3,0x10
    c294:	00008737          	lui	a4,0x8
    c298:	0109d793          	srl	a5,s3,0x10
    c29c:	01055513          	srl	a0,a0,0x10
    c2a0:	fff70713          	add	a4,a4,-1 # 7fff <.L4+0xf>
    c2a4:	05312e23          	sw	s3,92(sp)
    c2a8:	05212823          	sw	s2,80(sp)
    c2ac:	05612a23          	sw	s6,84(sp)
    c2b0:	05512c23          	sw	s5,88(sp)
    c2b4:	03212823          	sw	s2,48(sp)
    c2b8:	03612a23          	sw	s6,52(sp)
    c2bc:	03512c23          	sw	s5,56(sp)
    c2c0:	02a12e23          	sw	a0,60(sp)
    c2c4:	00e7f7b3          	and	a5,a5,a4

0000c2c8 <.LVL9>:
    c2c8:	01f9d993          	srl	s3,s3,0x1f

0000c2cc <.LBE11>:
    c2cc:	14078ae3          	beqz	a5,cc20 <.L18>
    c2d0:	28e784e3          	beq	a5,a4,cd58 <.L19>
    c2d4:	00010737          	lui	a4,0x10
    c2d8:	00e56533          	or	a0,a0,a4
    c2dc:	02a12e23          	sw	a0,60(sp)

0000c2e0 <.LBB12>:
    c2e0:	03010593          	add	a1,sp,48
    c2e4:	03c10713          	add	a4,sp,60

0000c2e8 <.L20>:
    c2e8:	00072683          	lw	a3,0(a4) # 10000 <.LBE193+0x4>
    c2ec:	ffc72603          	lw	a2,-4(a4)
    c2f0:	ffc70713          	add	a4,a4,-4
    c2f4:	00369693          	sll	a3,a3,0x3
    c2f8:	01d65613          	srl	a2,a2,0x1d
    c2fc:	00c6e6b3          	or	a3,a3,a2
    c300:	00d72223          	sw	a3,4(a4)
    c304:	fee592e3          	bne	a1,a4,c2e8 <.L20>

0000c308 <.LBE12>:
    c308:	ffffc737          	lui	a4,0xffffc

0000c30c <.LBB13>:
    c30c:	00391913          	sll	s2,s2,0x3

0000c310 <.LBE13>:
    c310:	00170713          	add	a4,a4,1 # ffffc001 <_ebss+0xfffe5f51>

0000c314 <.LBB14>:
    c314:	03212823          	sw	s2,48(sp)

0000c318 <.LBE14>:
    c318:	00e787b3          	add	a5,a5,a4

0000c31c <.L210>:
    c31c:	00000693          	li	a3,0

0000c320 <.L21>:
  FP_MUL_Q (R, A, B);
    c320:	009787b3          	add	a5,a5,s1

0000c324 <.LVL16>:
    c324:	00f12623          	sw	a5,12(sp)
    c328:	00178793          	add	a5,a5,1
    c32c:	00f12423          	sw	a5,8(sp)

0000c330 <.LVL17>:
    c330:	002b9793          	sll	a5,s7,0x2

0000c334 <.LVL18>:
    c334:	00d7e7b3          	or	a5,a5,a3
    c338:	00a00713          	li	a4,10
    c33c:	28f742e3          	blt	a4,a5,cdc0 <.L34>
    c340:	013a4733          	xor	a4,s4,s3
    c344:	00e12223          	sw	a4,4(sp)
    c348:	00200713          	li	a4,2
    c34c:	22f74ae3          	blt	a4,a5,cd80 <.L35>
    c350:	fff78793          	add	a5,a5,-1
    c354:	00100713          	li	a4,1
    c358:	28f770e3          	bgeu	a4,a5,cdd8 <.L37>

0000c35c <.L36>:
    c35c:	02012883          	lw	a7,32(sp)

0000c360 <.LVL20>:
    c360:	03012f03          	lw	t5,48(sp)
    c364:	000105b7          	lui	a1,0x10
    c368:	fff58713          	add	a4,a1,-1 # ffff <.LBE193+0x3>
    c36c:	0108d913          	srl	s2,a7,0x10

0000c370 <.LVL21>:
    c370:	010f5493          	srl	s1,t5,0x10

0000c374 <.LVL22>:
    c374:	00e8f8b3          	and	a7,a7,a4

0000c378 <.LVL23>:
    c378:	00ef7f33          	and	t5,t5,a4

0000c37c <.LVL24>:
    c37c:	031f0633          	mul	a2,t5,a7

0000c380 <.LVL25>:
    c380:	03e90533          	mul	a0,s2,t5

0000c384 <.LVL26>:
    c384:	01065793          	srl	a5,a2,0x10
    c388:	031486b3          	mul	a3,s1,a7

0000c38c <.LVL27>:
    c38c:	00a686b3          	add	a3,a3,a0

0000c390 <.LVL28>:
    c390:	00d787b3          	add	a5,a5,a3
    c394:	02990bb3          	mul	s7,s2,s1

0000c398 <.LVL29>:
    c398:	00a7f463          	bgeu	a5,a0,c3a0 <.L42>
    c39c:	00bb8bb3          	add	s7,s7,a1

0000c3a0 <.L42>:
    c3a0:	03412e83          	lw	t4,52(sp)

0000c3a4 <.LBB22>:
    c3a4:	0107d693          	srl	a3,a5,0x10
    c3a8:	00e7f7b3          	and	a5,a5,a4

0000c3ac <.LVL31>:
    c3ac:	00e67633          	and	a2,a2,a4

0000c3b0 <.LVL32>:
    c3b0:	01079793          	sll	a5,a5,0x10
    c3b4:	00c787b3          	add	a5,a5,a2

0000c3b8 <.LBB23>:
    c3b8:	010ed293          	srl	t0,t4,0x10
    c3bc:	00eefeb3          	and	t4,t4,a4
    c3c0:	03d90633          	mul	a2,s2,t4

0000c3c4 <.LBB24>:
    c3c4:	00f12823          	sw	a5,16(sp)
    c3c8:	04f12823          	sw	a5,80(sp)

0000c3cc <.LBB25>:
    c3cc:	03128733          	mul	a4,t0,a7
    c3d0:	031e87b3          	mul	a5,t4,a7

0000c3d4 <.LVL34>:
    c3d4:	00c70733          	add	a4,a4,a2

0000c3d8 <.LVL35>:
    c3d8:	0107d313          	srl	t1,a5,0x10
    c3dc:	00e30333          	add	t1,t1,a4
    c3e0:	02590b33          	mul	s6,s2,t0

0000c3e4 <.LVL36>:
    c3e4:	00c37663          	bgeu	t1,a2,c3f0 <.L43>
    c3e8:	00010737          	lui	a4,0x10
    c3ec:	00eb0b33          	add	s6,s6,a4

0000c3f0 <.L43>:
    c3f0:	02412803          	lw	a6,36(sp)

0000c3f4 <.LBB27>:
    c3f4:	00010737          	lui	a4,0x10
    c3f8:	fff70613          	add	a2,a4,-1 # ffff <.LBE193+0x3>

0000c3fc <.LVL38>:
    c3fc:	01035513          	srl	a0,t1,0x10

0000c400 <.LVL39>:
    c400:	00c37333          	and	t1,t1,a2

0000c404 <.LVL40>:
    c404:	00c7f7b3          	and	a5,a5,a2

0000c408 <.LBB28>:
    c408:	01085393          	srl	t2,a6,0x10

0000c40c <.LBB29>:
    c40c:	01031313          	sll	t1,t1,0x10
    c410:	00c87833          	and	a6,a6,a2
    c414:	00f30333          	add	t1,t1,a5

0000c418 <.LBB30>:
    c418:	03e38fb3          	mul	t6,t2,t5
    c41c:	006686b3          	add	a3,a3,t1

0000c420 <.LBB31>:
    c420:	03e807b3          	mul	a5,a6,t5

0000c424 <.LVL43>:
    c424:	03048e33          	mul	t3,s1,a6

0000c428 <.LVL44>:
    c428:	0107d613          	srl	a2,a5,0x10
    c42c:	01fe0e33          	add	t3,t3,t6

0000c430 <.LVL45>:
    c430:	01c60633          	add	a2,a2,t3
    c434:	027485b3          	mul	a1,s1,t2

0000c438 <.LVL46>:
    c438:	01f67463          	bgeu	a2,t6,c440 <.L44>
    c43c:	00e585b3          	add	a1,a1,a4

0000c440 <.L44>:
    c440:	01065a93          	srl	s5,a2,0x10
    c444:	00010737          	lui	a4,0x10
    c448:	00ba8ab3          	add	s5,s5,a1

0000c44c <.LVL48>:
    c44c:	fff70593          	add	a1,a4,-1 # ffff <.LBE193+0x3>

0000c450 <.LVL49>:
    c450:	00b7f7b3          	and	a5,a5,a1

0000c454 <.LVL50>:
    c454:	00b67633          	and	a2,a2,a1

0000c458 <.LVL51>:
    c458:	01061613          	sll	a2,a2,0x10

0000c45c <.LBB32>:
    c45c:	030e85b3          	mul	a1,t4,a6

0000c460 <.LBB33>:
    c460:	00f60633          	add	a2,a2,a5

0000c464 <.LBB34>:
    c464:	03d38fb3          	mul	t6,t2,t4

0000c468 <.LVL53>:
    c468:	0105d793          	srl	a5,a1,0x10
    c46c:	03028e33          	mul	t3,t0,a6

0000c470 <.LVL54>:
    c470:	01fe0e33          	add	t3,t3,t6

0000c474 <.LVL55>:
    c474:	01c787b3          	add	a5,a5,t3
    c478:	027289b3          	mul	s3,t0,t2

0000c47c <.LVL56>:
    c47c:	01f7f463          	bgeu	a5,t6,c484 <.L45>
    c480:	00e989b3          	add	s3,s3,a4

0000c484 <.L45>:
    c484:	0107d713          	srl	a4,a5,0x10
    c488:	01370733          	add	a4,a4,s3
    c48c:	00010a37          	lui	s4,0x10

0000c490 <.LVL58>:
    c490:	00e12a23          	sw	a4,20(sp)

0000c494 <.LVL59>:
    c494:	fffa0713          	add	a4,s4,-1 # ffff <.LBE193+0x3>

0000c498 <.LBB35>:
    c498:	03812e03          	lw	t3,56(sp)

0000c49c <.LBB36>:
    c49c:	00e7f7b3          	and	a5,a5,a4

0000c4a0 <.LVL61>:
    c4a0:	00e5f5b3          	and	a1,a1,a4

0000c4a4 <.LVL62>:
    c4a4:	01079793          	sll	a5,a5,0x10
    c4a8:	00b787b3          	add	a5,a5,a1
    c4ac:	00f12c23          	sw	a5,24(sp)

0000c4b0 <.LBB37>:
    c4b0:	010e5793          	srl	a5,t3,0x10

0000c4b4 <.LVL64>:
    c4b4:	00ee7e33          	and	t3,t3,a4

0000c4b8 <.LVL65>:
    c4b8:	031e05b3          	mul	a1,t3,a7

0000c4bc <.LVL66>:
    c4bc:	03c90c33          	mul	s8,s2,t3

0000c4c0 <.LVL67>:
    c4c0:	0105d713          	srl	a4,a1,0x10
    c4c4:	031789b3          	mul	s3,a5,a7

0000c4c8 <.LVL68>:
    c4c8:	018989b3          	add	s3,s3,s8

0000c4cc <.LVL69>:
    c4cc:	01370733          	add	a4,a4,s3
    c4d0:	02f90fb3          	mul	t6,s2,a5

0000c4d4 <.LVL70>:
    c4d4:	01877463          	bgeu	a4,s8,c4dc <.L46>
    c4d8:	014f8fb3          	add	t6,t6,s4

0000c4dc <.L46>:
    c4dc:	01075993          	srl	s3,a4,0x10
    c4e0:	00010cb7          	lui	s9,0x10
    c4e4:	01f98fb3          	add	t6,s3,t6

0000c4e8 <.LVL72>:
    c4e8:	fffc8993          	add	s3,s9,-1 # ffff <.LBE193+0x3>
    c4ec:	01377733          	and	a4,a4,s3

0000c4f0 <.LVL73>:
    c4f0:	0135f5b3          	and	a1,a1,s3

0000c4f4 <.LVL74>:
    c4f4:	01071713          	sll	a4,a4,0x10
    c4f8:	00b70733          	add	a4,a4,a1

0000c4fc <.LBB38>:
    c4fc:	02812583          	lw	a1,40(sp)

0000c500 <.LBB39>:
    c500:	01f12e23          	sw	t6,28(sp)

0000c504 <.LBB40>:
    c504:	0105df93          	srl	t6,a1,0x10

0000c508 <.LVL76>:
    c508:	0135f5b3          	and	a1,a1,s3

0000c50c <.LVL77>:
    c50c:	03e58a33          	mul	s4,a1,t5

0000c510 <.LVL78>:
    c510:	03ef8d33          	mul	s10,t6,t5

0000c514 <.LVL79>:
    c514:	010a5d93          	srl	s11,s4,0x10
    c518:	02b489b3          	mul	s3,s1,a1

0000c51c <.LVL80>:
    c51c:	01a989b3          	add	s3,s3,s10

0000c520 <.LVL81>:
    c520:	013d89b3          	add	s3,s11,s3
    c524:	03f48c33          	mul	s8,s1,t6

0000c528 <.LVL82>:
    c528:	01a9f463          	bgeu	s3,s10,c530 <.L47>
    c52c:	019c0c33          	add	s8,s8,s9

0000c530 <.L47>:
    c530:	00db86b3          	add	a3,s7,a3
    c534:	0066b333          	sltu	t1,a3,t1

0000c538 <.LBB42>:
    c538:	0109dd13          	srl	s10,s3,0x10

0000c53c <.LBB43>:
    c53c:	00650533          	add	a0,a0,t1

0000c540 <.LBB44>:
    c540:	00010cb7          	lui	s9,0x10

0000c544 <.LBB45>:
    c544:	01650533          	add	a0,a0,s6

0000c548 <.LBB46>:
    c548:	018d0d33          	add	s10,s10,s8

0000c54c <.LVL87>:
    c54c:	00c68633          	add	a2,a3,a2

0000c550 <.LVL88>:
    c550:	fffc8c13          	add	s8,s9,-1 # ffff <.LBE193+0x3>

0000c554 <.LVL89>:
    c554:	01550ab3          	add	s5,a0,s5

0000c558 <.LVL90>:
    c558:	0189f9b3          	and	s3,s3,s8

0000c55c <.LBB47>:
    c55c:	00d636b3          	sltu	a3,a2,a3
    c560:	00da86b3          	add	a3,s5,a3

0000c564 <.LBB48>:
    c564:	01099993          	sll	s3,s3,0x10
    c568:	018a7a33          	and	s4,s4,s8

0000c56c <.LVL92>:
    c56c:	01498a33          	add	s4,s3,s4

0000c570 <.LBB49>:
    c570:	00aab9b3          	sltu	s3,s5,a0
    c574:	0156bab3          	sltu	s5,a3,s5
    c578:	0159e9b3          	or	s3,s3,s5

0000c57c <.LBB51>:
    c57c:	00653533          	sltu	a0,a0,t1

0000c580 <.LBB52>:
    c580:	00a98533          	add	a0,s3,a0
    c584:	01812303          	lw	t1,24(sp)

0000c588 <.LVL95>:
    c588:	01412983          	lw	s3,20(sp)
    c58c:	04c12a23          	sw	a2,84(sp)

0000c590 <.LBB53>:
    c590:	00668333          	add	t1,a3,t1

0000c594 <.LVL97>:
    c594:	01350ab3          	add	s5,a0,s3

0000c598 <.LVL98>:
    c598:	01c12983          	lw	s3,28(sp)
    c59c:	00d336b3          	sltu	a3,t1,a3

0000c5a0 <.LVL99>:
    c5a0:	00da86b3          	add	a3,s5,a3

0000c5a4 <.LBB54>:
    c5a4:	00e30733          	add	a4,t1,a4

0000c5a8 <.LVL101>:
    c5a8:	01368b33          	add	s6,a3,s3

0000c5ac <.LVL102>:
    c5ac:	00673333          	sltu	t1,a4,t1

0000c5b0 <.LVL103>:
    c5b0:	006b0333          	add	t1,s6,t1

0000c5b4 <.LVL104>:
    c5b4:	01470a33          	add	s4,a4,s4

0000c5b8 <.LVL105>:
    c5b8:	01a30d33          	add	s10,t1,s10

0000c5bc <.LBB55>:
    c5bc:	00ea3733          	sltu	a4,s4,a4

0000c5c0 <.LBB56>:
    c5c0:	00aab533          	sltu	a0,s5,a0

0000c5c4 <.LVL107>:
    c5c4:	00ed0733          	add	a4,s10,a4
    c5c8:	0156bab3          	sltu	s5,a3,s5

0000c5cc <.LBB57>:
    c5cc:	00db36b3          	sltu	a3,s6,a3

0000c5d0 <.LVL109>:
    c5d0:	01633b33          	sltu	s6,t1,s6

0000c5d4 <.LVL110>:
    c5d4:	0166e6b3          	or	a3,a3,s6

0000c5d8 <.LBB58>:
    c5d8:	006d39b3          	sltu	s3,s10,t1

0000c5dc <.LBB59>:
    c5dc:	01556ab3          	or	s5,a0,s5

0000c5e0 <.LBB60>:
    c5e0:	01a73d33          	sltu	s10,a4,s10

0000c5e4 <.LBB61>:
    c5e4:	00da8ab3          	add	s5,s5,a3

0000c5e8 <.LBB62>:
    c5e8:	01a9e9b3          	or	s3,s3,s10
    c5ec:	015989b3          	add	s3,s3,s5

0000c5f0 <.LBB63>:
    c5f0:	03c12a83          	lw	s5,60(sp)

0000c5f4 <.LBB64>:
    c5f4:	05412c23          	sw	s4,88(sp)

0000c5f8 <.LBB65>:
    c5f8:	010adb13          	srl	s6,s5,0x10

0000c5fc <.LVL114>:
    c5fc:	018afab3          	and	s5,s5,s8

0000c600 <.LVL115>:
    c600:	031a86b3          	mul	a3,s5,a7

0000c604 <.LVL116>:
    c604:	03590533          	mul	a0,s2,s5

0000c608 <.LVL117>:
    c608:	031b08b3          	mul	a7,s6,a7

0000c60c <.LVL118>:
    c60c:	00a88333          	add	t1,a7,a0
    c610:	0106d893          	srl	a7,a3,0x10

0000c614 <.LVL119>:
    c614:	006888b3          	add	a7,a7,t1
    c618:	03690933          	mul	s2,s2,s6

0000c61c <.LVL120>:
    c61c:	00a8f463          	bgeu	a7,a0,c624 <.L72>
    c620:	01990933          	add	s2,s2,s9

0000c624 <.L72>:
    c624:	02c12b83          	lw	s7,44(sp)

0000c628 <.LBB67>:
    c628:	0108d513          	srl	a0,a7,0x10

0000c62c <.LVL123>:
    c62c:	01250533          	add	a0,a0,s2
    c630:	00010c37          	lui	s8,0x10
    c634:	00a12a23          	sw	a0,20(sp)

0000c638 <.LVL124>:
    c638:	fffc0513          	add	a0,s8,-1 # ffff <.LBE193+0x3>

0000c63c <.LBB68>:
    c63c:	010bd913          	srl	s2,s7,0x10

0000c640 <.LVL126>:
    c640:	00abfbb3          	and	s7,s7,a0

0000c644 <.LBB69>:
    c644:	00a6f6b3          	and	a3,a3,a0

0000c648 <.LVL127>:
    c648:	00a8f8b3          	and	a7,a7,a0

0000c64c <.LBB70>:
    c64c:	03248333          	mul	t1,s1,s2

0000c650 <.LBB71>:
    c650:	01089893          	sll	a7,a7,0x10
    c654:	00d888b3          	add	a7,a7,a3

0000c658 <.LBB72>:
    c658:	03eb8533          	mul	a0,s7,t5

0000c65c <.LVL131>:
    c65c:	037484b3          	mul	s1,s1,s7

0000c660 <.LVL132>:
    c660:	01055693          	srl	a3,a0,0x10
    c664:	03e90f33          	mul	t5,s2,t5

0000c668 <.LVL133>:
    c668:	01e484b3          	add	s1,s1,t5

0000c66c <.LVL134>:
    c66c:	009686b3          	add	a3,a3,s1

0000c670 <.LVL135>:
    c670:	01e6f463          	bgeu	a3,t5,c678 <.L73>
    c674:	01830333          	add	t1,t1,s8

0000c678 <.L73>:
    c678:	0106df13          	srl	t5,a3,0x10

0000c67c <.LVL137>:
    c67c:	006f0333          	add	t1,t5,t1

0000c680 <.LVL138>:
    c680:	00010cb7          	lui	s9,0x10

0000c684 <.LVL139>:
    c684:	00612c23          	sw	t1,24(sp)

0000c688 <.LVL140>:
    c688:	fffc8313          	add	t1,s9,-1 # ffff <.LBE193+0x3>

0000c68c <.LVL141>:
    c68c:	00657533          	and	a0,a0,t1

0000c690 <.LVL142>:
    c690:	0066f6b3          	and	a3,a3,t1

0000c694 <.LBB73>:
    c694:	03c38f33          	mul	t5,t2,t3

0000c698 <.LBB74>:
    c698:	01069693          	sll	a3,a3,0x10
    c69c:	00a686b3          	add	a3,a3,a0

0000c6a0 <.LBB75>:
    c6a0:	03c80333          	mul	t1,a6,t3

0000c6a4 <.LVL145>:
    c6a4:	030784b3          	mul	s1,a5,a6

0000c6a8 <.LVL146>:
    c6a8:	01035513          	srl	a0,t1,0x10
    c6ac:	01e484b3          	add	s1,s1,t5

0000c6b0 <.LVL147>:
    c6b0:	00950533          	add	a0,a0,s1
    c6b4:	02f38c33          	mul	s8,t2,a5

0000c6b8 <.LVL148>:
    c6b8:	01e57463          	bgeu	a0,t5,c6c0 <.L74>
    c6bc:	019c0c33          	add	s8,s8,s9

0000c6c0 <.L74>:
    c6c0:	00010d37          	lui	s10,0x10
    c6c4:	fffd0f13          	add	t5,s10,-1 # ffff <.LBE193+0x3>
    c6c8:	01055493          	srl	s1,a0,0x10
    c6cc:	01e57533          	and	a0,a0,t5

0000c6d0 <.LVL150>:
    c6d0:	01e37333          	and	t1,t1,t5

0000c6d4 <.LVL151>:
    c6d4:	01051513          	sll	a0,a0,0x10
    c6d8:	018484b3          	add	s1,s1,s8

0000c6dc <.LBB76>:
    c6dc:	02b28f33          	mul	t5,t0,a1

0000c6e0 <.LBB77>:
    c6e0:	00650533          	add	a0,a0,t1

0000c6e4 <.LBB78>:
    c6e4:	03df8c33          	mul	s8,t6,t4

0000c6e8 <.LVL154>:
    c6e8:	02be8333          	mul	t1,t4,a1

0000c6ec <.LVL155>:
    c6ec:	018f0f33          	add	t5,t5,s8

0000c6f0 <.LVL156>:
    c6f0:	01035d93          	srl	s11,t1,0x10

0000c6f4 <.LVL157>:
    c6f4:	01ed8f33          	add	t5,s11,t5
    c6f8:	03f28cb3          	mul	s9,t0,t6

0000c6fc <.LVL158>:
    c6fc:	018f7463          	bgeu	t5,s8,c704 <.L75>
    c700:	01ac8cb3          	add	s9,s9,s10

0000c704 <.L75>:
    c704:	010f5c13          	srl	s8,t5,0x10
    c708:	019c0c33          	add	s8,s8,s9

0000c70c <.LVL160>:
    c70c:	00010cb7          	lui	s9,0x10

0000c710 <.LVL161>:
    c710:	fffc8d13          	add	s10,s9,-1 # ffff <.LBE193+0x3>

0000c714 <.LVL162>:
    c714:	01af7f33          	and	t5,t5,s10

0000c718 <.LVL163>:
    c718:	010f1f13          	sll	t5,t5,0x10
    c71c:	01a37333          	and	t1,t1,s10

0000c720 <.LVL164>:
    c720:	006f0333          	add	t1,t5,t1

0000c724 <.LBB79>:
    c724:	01412f03          	lw	t5,20(sp)
    c728:	011708b3          	add	a7,a4,a7

0000c72c <.LVL166>:
    c72c:	01812d03          	lw	s10,24(sp)

0000c730 <.LVL167>:
    c730:	01e98f33          	add	t5,s3,t5

0000c734 <.LVL168>:
    c734:	00e8b733          	sltu	a4,a7,a4

0000c738 <.LVL169>:
    c738:	00ef0733          	add	a4,t5,a4

0000c73c <.LBB80>:
    c73c:	00d886b3          	add	a3,a7,a3

0000c740 <.LVL171>:
    c740:	01a70d33          	add	s10,a4,s10

0000c744 <.LVL172>:
    c744:	0116b8b3          	sltu	a7,a3,a7

0000c748 <.LVL173>:
    c748:	011d08b3          	add	a7,s10,a7

0000c74c <.LVL174>:
    c74c:	00a68533          	add	a0,a3,a0

0000c750 <.LVL175>:
    c750:	009884b3          	add	s1,a7,s1

0000c754 <.LBB81>:
    c754:	00d536b3          	sltu	a3,a0,a3
    c758:	00d486b3          	add	a3,s1,a3

0000c75c <.LBB82>:
    c75c:	013f39b3          	sltu	s3,t5,s3

0000c760 <.LVL177>:
    c760:	01e73f33          	sltu	t5,a4,t5

0000c764 <.LBB83>:
    c764:	00ed3733          	sltu	a4,s10,a4

0000c768 <.LVL179>:
    c768:	01a8bd33          	sltu	s10,a7,s10

0000c76c <.LBB84>:
    c76c:	01e9ef33          	or	t5,s3,t5

0000c770 <.LBB85>:
    c770:	0114b8b3          	sltu	a7,s1,a7

0000c774 <.LBB86>:
    c774:	01a76733          	or	a4,a4,s10

0000c778 <.LBB87>:
    c778:	0096b4b3          	sltu	s1,a3,s1
    c77c:	01868c33          	add	s8,a3,s8

0000c780 <.LBB88>:
    c780:	00ef0733          	add	a4,t5,a4

0000c784 <.LBB89>:
    c784:	0098e8b3          	or	a7,a7,s1
    c788:	00e884b3          	add	s1,a7,a4

0000c78c <.LBB90>:
    c78c:	03cf8f33          	mul	t5,t6,t3

0000c790 <.LBB92>:
    c790:	00dc38b3          	sltu	a7,s8,a3
    c794:	00650333          	add	t1,a0,t1

0000c798 <.LVL185>:
    c798:	00a33533          	sltu	a0,t1,a0
    c79c:	00ac0533          	add	a0,s8,a0
    c7a0:	01853c33          	sltu	s8,a0,s8
    c7a4:	0188e8b3          	or	a7,a7,s8
    c7a8:	04612e23          	sw	t1,92(sp)
    c7ac:	009888b3          	add	a7,a7,s1

0000c7b0 <.LBB93>:
    c7b0:	02be06b3          	mul	a3,t3,a1

0000c7b4 <.LVL188>:
    c7b4:	02b789b3          	mul	s3,a5,a1

0000c7b8 <.LVL189>:
    c7b8:	0106d713          	srl	a4,a3,0x10
    c7bc:	01e989b3          	add	s3,s3,t5

0000c7c0 <.LVL190>:
    c7c0:	01370733          	add	a4,a4,s3
    c7c4:	03f784b3          	mul	s1,a5,t6

0000c7c8 <.LVL191>:
    c7c8:	01e77463          	bgeu	a4,t5,c7d0 <.L100>
    c7cc:	019484b3          	add	s1,s1,s9

0000c7d0 <.L100>:
    c7d0:	01075f13          	srl	t5,a4,0x10
    c7d4:	009f0f33          	add	t5,t5,s1

0000c7d8 <.LVL193>:
    c7d8:	000104b7          	lui	s1,0x10

0000c7dc <.LVL194>:
    c7dc:	fff48993          	add	s3,s1,-1 # ffff <.LBE193+0x3>
    c7e0:	01377733          	and	a4,a4,s3

0000c7e4 <.LVL195>:
    c7e4:	0136f6b3          	and	a3,a3,s3

0000c7e8 <.LVL196>:
    c7e8:	01071713          	sll	a4,a4,0x10

0000c7ec <.LBB94>:
    c7ec:	035389b3          	mul	s3,t2,s5

0000c7f0 <.LBB95>:
    c7f0:	00d70733          	add	a4,a4,a3

0000c7f4 <.LBB96>:
    c7f4:	030a86b3          	mul	a3,s5,a6

0000c7f8 <.LVL198>:
    c7f8:	030b0833          	mul	a6,s6,a6

0000c7fc <.LVL199>:
    c7fc:	01380c33          	add	s8,a6,s3
    c800:	0106d813          	srl	a6,a3,0x10

0000c804 <.LVL200>:
    c804:	01880833          	add	a6,a6,s8
    c808:	036383b3          	mul	t2,t2,s6

0000c80c <.LVL201>:
    c80c:	01387463          	bgeu	a6,s3,c814 <.L101>
    c810:	009383b3          	add	t2,t2,s1

0000c814 <.L101>:
    c814:	01085493          	srl	s1,a6,0x10
    c818:	00010c37          	lui	s8,0x10
    c81c:	007483b3          	add	t2,s1,t2

0000c820 <.LVL203>:
    c820:	fffc0493          	add	s1,s8,-1 # ffff <.LBE193+0x3>
    c824:	0096f6b3          	and	a3,a3,s1

0000c828 <.LVL204>:
    c828:	00987833          	and	a6,a6,s1

0000c82c <.LVL205>:
    c82c:	01081813          	sll	a6,a6,0x10

0000c830 <.LBB97>:
    c830:	03db89b3          	mul	s3,s7,t4

0000c834 <.LBB98>:
    c834:	00d80833          	add	a6,a6,a3

0000c838 <.LBB99>:
    c838:	03d90eb3          	mul	t4,s2,t4

0000c83c <.LVL208>:
    c83c:	0109d693          	srl	a3,s3,0x10
    c840:	032284b3          	mul	s1,t0,s2

0000c844 <.LVL209>:
    c844:	037282b3          	mul	t0,t0,s7

0000c848 <.LVL210>:
    c848:	01d282b3          	add	t0,t0,t4

0000c84c <.LVL211>:
    c84c:	005686b3          	add	a3,a3,t0

0000c850 <.LVL212>:
    c850:	01d6f463          	bgeu	a3,t4,c858 <.L102>
    c854:	018484b3          	add	s1,s1,s8

0000c858 <.L102>:
    c858:	0106de93          	srl	t4,a3,0x10

0000c85c <.LVL214>:
    c85c:	009e8eb3          	add	t4,t4,s1

0000c860 <.LVL215>:
    c860:	000104b7          	lui	s1,0x10

0000c864 <.LVL216>:
    c864:	fff48293          	add	t0,s1,-1 # ffff <.LBE193+0x3>
    c868:	0056f6b3          	and	a3,a3,t0

0000c86c <.LVL217>:
    c86c:	0059f9b3          	and	s3,s3,t0

0000c870 <.LVL218>:
    c870:	01069693          	sll	a3,a3,0x10

0000c874 <.LBB100>:
    c874:	02ba82b3          	mul	t0,s5,a1

0000c878 <.LBB101>:
    c878:	013686b3          	add	a3,a3,s3

0000c87c <.LBB102>:
    c87c:	02bb05b3          	mul	a1,s6,a1

0000c880 <.LVL220>:
    c880:	035f89b3          	mul	s3,t6,s5

0000c884 <.LVL221>:
    c884:	01358c33          	add	s8,a1,s3
    c888:	0102d593          	srl	a1,t0,0x10

0000c88c <.LVL222>:
    c88c:	018585b3          	add	a1,a1,s8
    c890:	036f8fb3          	mul	t6,t6,s6

0000c894 <.LVL223>:
    c894:	0135f463          	bgeu	a1,s3,c89c <.L103>
    c898:	009f8fb3          	add	t6,t6,s1

0000c89c <.L103>:
    c89c:	0105d493          	srl	s1,a1,0x10
    c8a0:	01f48fb3          	add	t6,s1,t6

0000c8a4 <.LVL225>:
    c8a4:	000104b7          	lui	s1,0x10
    c8a8:	fff48993          	add	s3,s1,-1 # ffff <.LBE193+0x3>

0000c8ac <.LVL226>:
    c8ac:	0135f5b3          	and	a1,a1,s3

0000c8b0 <.LVL227>:
    c8b0:	0132f2b3          	and	t0,t0,s3

0000c8b4 <.LVL228>:
    c8b4:	01059593          	sll	a1,a1,0x10

0000c8b8 <.LBB103>:
    c8b8:	032789b3          	mul	s3,a5,s2

0000c8bc <.LBB104>:
    c8bc:	005585b3          	add	a1,a1,t0

0000c8c0 <.LBB105>:
    c8c0:	037787b3          	mul	a5,a5,s7

0000c8c4 <.LVL230>:
    c8c4:	03cb82b3          	mul	t0,s7,t3

0000c8c8 <.LVL231>:
    c8c8:	03c90e33          	mul	t3,s2,t3

0000c8cc <.LVL232>:
    c8cc:	0102dc13          	srl	s8,t0,0x10

0000c8d0 <.LVL233>:
    c8d0:	01c787b3          	add	a5,a5,t3
    c8d4:	00fc07b3          	add	a5,s8,a5

0000c8d8 <.LVL235>:
    c8d8:	01c7f463          	bgeu	a5,t3,c8e0 <.L104>
    c8dc:	009989b3          	add	s3,s3,s1

0000c8e0 <.L104>:
    c8e0:	00e50733          	add	a4,a0,a4

0000c8e4 <.LVL237>:
    c8e4:	01070833          	add	a6,a4,a6

0000c8e8 <.LVL238>:
    c8e8:	01e88f33          	add	t5,a7,t5

0000c8ec <.LBB106>:
    c8ec:	00a73533          	sltu	a0,a4,a0
    c8f0:	00af0533          	add	a0,t5,a0
    c8f4:	00d806b3          	add	a3,a6,a3

0000c8f8 <.LVL240>:
    c8f8:	007503b3          	add	t2,a0,t2

0000c8fc <.LBB107>:
    c8fc:	00e83733          	sltu	a4,a6,a4

0000c900 <.LBB108>:
    c900:	06d12023          	sw	a3,96(sp)
    c904:	0106b6b3          	sltu	a3,a3,a6

0000c908 <.LBB109>:
    c908:	037a8833          	mul	a6,s5,s7
    c90c:	00e38733          	add	a4,t2,a4
    c910:	01d70eb3          	add	t4,a4,t4

0000c914 <.LVL242>:
    c914:	00de86b3          	add	a3,t4,a3

0000c918 <.LBB110>:
    c918:	0107de13          	srl	t3,a5,0x10

0000c91c <.LBB111>:
    c91c:	011f38b3          	sltu	a7,t5,a7

0000c920 <.LBB112>:
    c920:	000104b7          	lui	s1,0x10

0000c924 <.LBB113>:
    c924:	01e53f33          	sltu	t5,a0,t5

0000c928 <.LBB114>:
    c928:	00a3b533          	sltu	a0,t2,a0
    c92c:	007733b3          	sltu	t2,a4,t2

0000c930 <.LBB115>:
    c930:	03590ab3          	mul	s5,s2,s5

0000c934 <.LBB116>:
    c934:	013e0e33          	add	t3,t3,s3

0000c938 <.LBB117>:
    c938:	00756533          	or	a0,a0,t2

0000c93c <.LBB118>:
    c93c:	fff48993          	add	s3,s1,-1 # ffff <.LBE193+0x3>

0000c940 <.LBB119>:
    c940:	00eeb733          	sltu	a4,t4,a4

0000c944 <.LBB120>:
    c944:	01e8e8b3          	or	a7,a7,t5

0000c948 <.LBB121>:
    c948:	01d6beb3          	sltu	t4,a3,t4

0000c94c <.LBB122>:
    c94c:	00a888b3          	add	a7,a7,a0

0000c950 <.LBB123>:
    c950:	0137f7b3          	and	a5,a5,s3

0000c954 <.LBB124>:
    c954:	01d76733          	or	a4,a4,t4

0000c958 <.LBB125>:
    c958:	032b0933          	mul	s2,s6,s2

0000c95c <.LVL248>:
    c95c:	00b685b3          	add	a1,a3,a1

0000c960 <.LBB126>:
    c960:	01170733          	add	a4,a4,a7

0000c964 <.LBB127>:
    c964:	01079793          	sll	a5,a5,0x10
    c968:	0132f2b3          	and	t0,t0,s3

0000c96c <.LVL250>:
    c96c:	01f70fb3          	add	t6,a4,t6

0000c970 <.LVL251>:
    c970:	005787b3          	add	a5,a5,t0

0000c974 <.LBB128>:
    c974:	00d5b6b3          	sltu	a3,a1,a3

0000c978 <.LVL253>:
    c978:	00df86b3          	add	a3,t6,a3

0000c97c <.LVL254>:
    c97c:	00f587b3          	add	a5,a1,a5

0000c980 <.LBB132>:
    c980:	037b0b33          	mul	s6,s6,s7

0000c984 <.LBB133>:
    c984:	00efb733          	sltu	a4,t6,a4

0000c988 <.LVL257>:
    c988:	01c68e33          	add	t3,a3,t3

0000c98c <.LVL258>:
    c98c:	01f6bfb3          	sltu	t6,a3,t6

0000c990 <.LBB134>:
    c990:	06f12223          	sw	a5,100(sp)
    c994:	00b7b7b3          	sltu	a5,a5,a1

0000c998 <.LBB135>:
    c998:	01f76533          	or	a0,a4,t6

0000c99c <.LBB136>:
    c99c:	00fe07b3          	add	a5,t3,a5

0000c9a0 <.LBB137>:
    c9a0:	01085713          	srl	a4,a6,0x10

0000c9a4 <.LBB138>:
    c9a4:	00de36b3          	sltu	a3,t3,a3

0000c9a8 <.LVL260>:
    c9a8:	015b0b33          	add	s6,s6,s5
    c9ac:	01c7be33          	sltu	t3,a5,t3

0000c9b0 <.LBB139>:
    c9b0:	01670733          	add	a4,a4,s6

0000c9b4 <.LBB140>:
    c9b4:	01c6e6b3          	or	a3,a3,t3

0000c9b8 <.LBB141>:
    c9b8:	01577463          	bgeu	a4,s5,c9c0 <.L135>
    c9bc:	00990933          	add	s2,s2,s1

0000c9c0 <.L135>:
    c9c0:	01075593          	srl	a1,a4,0x10
    c9c4:	00a585b3          	add	a1,a1,a0

0000c9c8 <.LBB142>:
    c9c8:	00010537          	lui	a0,0x10

0000c9cc <.LVL264>:
    c9cc:	fff50513          	add	a0,a0,-1 # ffff <.LBE193+0x3>
    c9d0:	00a77733          	and	a4,a4,a0

0000c9d4 <.LVL265>:
    c9d4:	01071713          	sll	a4,a4,0x10
    c9d8:	00a87833          	and	a6,a6,a0

0000c9dc <.LVL266>:
    c9dc:	01070733          	add	a4,a4,a6
    c9e0:	00e78733          	add	a4,a5,a4

0000c9e4 <.LBB144>:
    c9e4:	00d586b3          	add	a3,a1,a3

0000c9e8 <.LVL268>:
    c9e8:	00f737b3          	sltu	a5,a4,a5
    c9ec:	00f687b3          	add	a5,a3,a5
    c9f0:	012787b3          	add	a5,a5,s2
    c9f4:	06f12623          	sw	a5,108(sp)

0000c9f8 <.LBB146>:
    c9f8:	01012783          	lw	a5,16(sp)
    c9fc:	00d31313          	sll	t1,t1,0xd

0000ca00 <.LBB145>:
    ca00:	06e12423          	sw	a4,104(sp)

0000ca04 <.LBB148>:
    ca04:	00c7e7b3          	or	a5,a5,a2

0000ca08 <.LVL270>:
    ca08:	0147e7b3          	or	a5,a5,s4

0000ca0c <.LVL271>:
    ca0c:	00f36333          	or	t1,t1,a5

0000ca10 <.LVL272>:
    ca10:	06010613          	add	a2,sp,96
    ca14:	05010793          	add	a5,sp,80

0000ca18 <.L138>:
    ca18:	00c7a703          	lw	a4,12(a5)
    ca1c:	0107a683          	lw	a3,16(a5)
    ca20:	00478793          	add	a5,a5,4
    ca24:	01375713          	srl	a4,a4,0x13
    ca28:	00d69693          	sll	a3,a3,0xd
    ca2c:	00d76733          	or	a4,a4,a3
    ca30:	fee7ae23          	sw	a4,-4(a5)
    ca34:	fef612e3          	bne	a2,a5,ca18 <.L138>
    ca38:	05012783          	lw	a5,80(sp)
    ca3c:	00603333          	snez	t1,t1

0000ca40 <.LBE148>:
    ca40:	05c12703          	lw	a4,92(sp)

0000ca44 <.LBB149>:
    ca44:	00f36333          	or	t1,t1,a5

0000ca48 <.LBE149>:
    ca48:	05812783          	lw	a5,88(sp)
    ca4c:	04e12623          	sw	a4,76(sp)
    ca50:	04612023          	sw	t1,64(sp)

0000ca54 <.LBB150>:
    ca54:	04f12423          	sw	a5,72(sp)
    ca58:	05412783          	lw	a5,84(sp)
    ca5c:	04f12223          	sw	a5,68(sp)

0000ca60 <.LBE150>:
    ca60:	00b71793          	sll	a5,a4,0xb
    ca64:	0407d863          	bgez	a5,cab4 <.L139>

0000ca68 <.LBB151>:
    ca68:	01f31313          	sll	t1,t1,0x1f

0000ca6c <.LVL276>:
    ca6c:	04010793          	add	a5,sp,64
    ca70:	04c10593          	add	a1,sp,76

0000ca74 <.L140>:
    ca74:	0007a683          	lw	a3,0(a5)
    ca78:	0047a603          	lw	a2,4(a5)
    ca7c:	00478793          	add	a5,a5,4
    ca80:	0016d693          	srl	a3,a3,0x1
    ca84:	01f61613          	sll	a2,a2,0x1f
    ca88:	00c6e6b3          	or	a3,a3,a2
    ca8c:	fed7ae23          	sw	a3,-4(a5)
    ca90:	fef592e3          	bne	a1,a5,ca74 <.L140>

0000ca94 <.LBE152>:
    ca94:	04012783          	lw	a5,64(sp)

0000ca98 <.LBB153>:
    ca98:	00603333          	snez	t1,t1

0000ca9c <.LVL279>:
    ca9c:	00175713          	srl	a4,a4,0x1

0000caa0 <.LBE153>:
    caa0:	0067e7b3          	or	a5,a5,t1
    caa4:	04f12023          	sw	a5,64(sp)

0000caa8 <.LBE151>:
    caa8:	00812783          	lw	a5,8(sp)

0000caac <.LBB154>:
    caac:	04e12623          	sw	a4,76(sp)

0000cab0 <.LBE154>:
    cab0:	00f12623          	sw	a5,12(sp)

0000cab4 <.L139>:
    cab4:	00c12783          	lw	a5,12(sp)
    cab8:	00f12423          	sw	a5,8(sp)
    cabc:	3780006f          	j	ce34 <.L173>

0000cac0 <.L2>:
  FP_UNPACK_Q (A, a);
    cac0:	00a7e633          	or	a2,a5,a0
    cac4:	00d66633          	or	a2,a2,a3
    cac8:	00e66633          	or	a2,a2,a4
    cacc:	14060463          	beqz	a2,cc14 <.L174>

0000cad0 <.LBB156>:
    cad0:	0a070063          	beqz	a4,cb70 <.L6>
    cad4:	00070513          	mv	a0,a4
    cad8:	b3df40ef          	jal	1614 <__clzsi2>

0000cadc <.L7>:
    cadc:	ff450713          	add	a4,a0,-12
    cae0:	40575593          	sra	a1,a4,0x5

0000cae4 <.LVL284>:
    cae4:	01f77713          	and	a4,a4,31

0000cae8 <.LVL285>:
    cae8:	0a070e63          	beqz	a4,cba4 <.L10>
    caec:	ffc00693          	li	a3,-4
    caf0:	02d586b3          	mul	a3,a1,a3
    caf4:	02000813          	li	a6,32
    caf8:	02010313          	add	t1,sp,32
    cafc:	40e80833          	sub	a6,a6,a4

0000cb00 <.LVL286>:
    cb00:	00c68793          	add	a5,a3,12 # 1000c <.LBE194>
    cb04:	00f307b3          	add	a5,t1,a5
    cb08:	40d006b3          	neg	a3,a3

0000cb0c <.L11>:
    cb0c:	0cf31463          	bne	t1,a5,cbd4 <.L14>
    cb10:	fff58793          	add	a5,a1,-1

0000cb14 <.LVL287>:
    cb14:	00259593          	sll	a1,a1,0x2

0000cb18 <.LVL288>:
    cb18:	05058693          	add	a3,a1,80
    cb1c:	02010613          	add	a2,sp,32
    cb20:	00c685b3          	add	a1,a3,a2
    cb24:	02012683          	lw	a3,32(sp)
    cb28:	00e69733          	sll	a4,a3,a4

0000cb2c <.LVL289>:
    cb2c:	fae5a823          	sw	a4,-80(a1)

0000cb30 <.L15>:
    cb30:	00178793          	add	a5,a5,1
    cb34:	00279793          	sll	a5,a5,0x2
    cb38:	00800693          	li	a3,8
    cb3c:	02010713          	add	a4,sp,32
    cb40:	00d7ea63          	bltu	a5,a3,cb54 <.L16>
    cb44:	02012023          	sw	zero,32(sp)
    cb48:	00072223          	sw	zero,4(a4)
    cb4c:	ff878793          	add	a5,a5,-8
    cb50:	02810713          	add	a4,sp,40

0000cb54 <.L16>:
    cb54:	00400693          	li	a3,4
    cb58:	00d7e463          	bltu	a5,a3,cb60 <.L17>
    cb5c:	00072023          	sw	zero,0(a4)

0000cb60 <.L17>:
    cb60:	ffffc4b7          	lui	s1,0xffffc

0000cb64 <.LVL291>:
    cb64:	01148493          	add	s1,s1,17 # ffffc011 <_ebss+0xfffe5f61>
    cb68:	40a484b3          	sub	s1,s1,a0
    cb6c:	f20ff06f          	j	c28c <.L209>

0000cb70 <.L6>:
    cb70:	00068a63          	beqz	a3,cb84 <.L8>
    cb74:	00068513          	mv	a0,a3
    cb78:	a9df40ef          	jal	1614 <__clzsi2>

0000cb7c <.LVL293>:
    cb7c:	02050513          	add	a0,a0,32
    cb80:	f5dff06f          	j	cadc <.L7>

0000cb84 <.L8>:
    cb84:	00050863          	beqz	a0,cb94 <.L9>
    cb88:	a8df40ef          	jal	1614 <__clzsi2>

0000cb8c <.LVL296>:
    cb8c:	04050513          	add	a0,a0,64
    cb90:	f4dff06f          	j	cadc <.L7>

0000cb94 <.L9>:
    cb94:	00078513          	mv	a0,a5
    cb98:	a7df40ef          	jal	1614 <__clzsi2>

0000cb9c <.LVL299>:
    cb9c:	06050513          	add	a0,a0,96
    cba0:	f3dff06f          	j	cadc <.L7>

0000cba4 <.L10>:
    cba4:	ffc00693          	li	a3,-4
    cba8:	02d586b3          	mul	a3,a1,a3
    cbac:	02c10793          	add	a5,sp,44

0000cbb0 <.LBB10>:
    cbb0:	00300713          	li	a4,3

0000cbb4 <.L12>:
    cbb4:	00d78633          	add	a2,a5,a3
    cbb8:	00062603          	lw	a2,0(a2)
    cbbc:	fff70713          	add	a4,a4,-1

0000cbc0 <.LVL303>:
    cbc0:	ffc78793          	add	a5,a5,-4
    cbc4:	00c7a223          	sw	a2,4(a5)

0000cbc8 <.LVL304>:
    cbc8:	feb756e3          	bge	a4,a1,cbb4 <.L12>
    cbcc:	fff58793          	add	a5,a1,-1
    cbd0:	f61ff06f          	j	cb30 <.L15>

0000cbd4 <.L14>:
    cbd4:	0007a603          	lw	a2,0(a5)
    cbd8:	ffc7a883          	lw	a7,-4(a5)
    cbdc:	00d78e33          	add	t3,a5,a3
    cbe0:	00e61633          	sll	a2,a2,a4
    cbe4:	0108d8b3          	srl	a7,a7,a6
    cbe8:	01166633          	or	a2,a2,a7
    cbec:	00ce2023          	sw	a2,0(t3)
    cbf0:	ffc78793          	add	a5,a5,-4
    cbf4:	f19ff06f          	j	cb0c <.L11>

0000cbf8 <.L3>:
    cbf8:	00a7e7b3          	or	a5,a5,a0
    cbfc:	00d7e7b3          	or	a5,a5,a3
    cc00:	00e7e7b3          	or	a5,a5,a4
    cc04:	00200b93          	li	s7,2
    cc08:	e8078463          	beqz	a5,c290 <.L5>
    cc0c:	00300b93          	li	s7,3
    cc10:	e80ff06f          	j	c290 <.L5>

0000cc14 <.L174>:
    cc14:	00000493          	li	s1,0

0000cc18 <.LBE157>:
    cc18:	00100b93          	li	s7,1
    cc1c:	e74ff06f          	j	c290 <.L5>

0000cc20 <.L18>:
  FP_UNPACK_Q (B, b);
    cc20:	016967b3          	or	a5,s2,s6

0000cc24 <.LVL309>:
    cc24:	0157e7b3          	or	a5,a5,s5
    cc28:	00a7e7b3          	or	a5,a5,a0
    cc2c:	14078463          	beqz	a5,cd74 <.L176>

0000cc30 <.LBB158>:
    cc30:	08050e63          	beqz	a0,cccc <.L22>
    cc34:	9e1f40ef          	jal	1614 <__clzsi2>

0000cc38 <.L23>:
    cc38:	ff450693          	add	a3,a0,-12
    cc3c:	4056d793          	sra	a5,a3,0x5

0000cc40 <.LVL311>:
    cc40:	01f6f693          	and	a3,a3,31

0000cc44 <.LVL312>:
    cc44:	0c068063          	beqz	a3,cd04 <.L26>
    cc48:	ffc00613          	li	a2,-4
    cc4c:	02c78633          	mul	a2,a5,a2
    cc50:	02000813          	li	a6,32
    cc54:	03010313          	add	t1,sp,48
    cc58:	40d80833          	sub	a6,a6,a3

0000cc5c <.LVL313>:
    cc5c:	00c60713          	add	a4,a2,12
    cc60:	00e30733          	add	a4,t1,a4
    cc64:	40c00633          	neg	a2,a2

0000cc68 <.L27>:
    cc68:	0ce31663          	bne	t1,a4,cd34 <.L30>
    cc6c:	fff78713          	add	a4,a5,-1

0000cc70 <.LVL314>:
    cc70:	00279793          	sll	a5,a5,0x2

0000cc74 <.LVL315>:
    cc74:	02010613          	add	a2,sp,32
    cc78:	05078793          	add	a5,a5,80
    cc7c:	00c787b3          	add	a5,a5,a2
    cc80:	03012603          	lw	a2,48(sp)
    cc84:	00d616b3          	sll	a3,a2,a3

0000cc88 <.LVL316>:
    cc88:	fcd7a023          	sw	a3,-64(a5)

0000cc8c <.L31>:
    cc8c:	00170793          	add	a5,a4,1
    cc90:	00279793          	sll	a5,a5,0x2
    cc94:	00800693          	li	a3,8
    cc98:	03010713          	add	a4,sp,48
    cc9c:	00d7ea63          	bltu	a5,a3,ccb0 <.L32>
    cca0:	02012823          	sw	zero,48(sp)
    cca4:	00072223          	sw	zero,4(a4)
    cca8:	ff878793          	add	a5,a5,-8
    ccac:	03810713          	add	a4,sp,56

0000ccb0 <.L32>:
    ccb0:	00400693          	li	a3,4
    ccb4:	00d7e463          	bltu	a5,a3,ccbc <.L33>
    ccb8:	00072023          	sw	zero,0(a4)

0000ccbc <.L33>:
    ccbc:	ffffc7b7          	lui	a5,0xffffc
    ccc0:	01178793          	add	a5,a5,17 # ffffc011 <_ebss+0xfffe5f61>
    ccc4:	40a787b3          	sub	a5,a5,a0
    ccc8:	e54ff06f          	j	c31c <.L210>

0000cccc <.L22>:
    cccc:	000a8a63          	beqz	s5,cce0 <.L24>
    ccd0:	000a8513          	mv	a0,s5
    ccd4:	941f40ef          	jal	1614 <__clzsi2>

0000ccd8 <.LVL319>:
    ccd8:	02050513          	add	a0,a0,32
    ccdc:	f5dff06f          	j	cc38 <.L23>

0000cce0 <.L24>:
    cce0:	000b0a63          	beqz	s6,ccf4 <.L25>
    cce4:	000b0513          	mv	a0,s6
    cce8:	92df40ef          	jal	1614 <__clzsi2>

0000ccec <.LVL322>:
    ccec:	04050513          	add	a0,a0,64
    ccf0:	f49ff06f          	j	cc38 <.L23>

0000ccf4 <.L25>:
    ccf4:	00090513          	mv	a0,s2
    ccf8:	91df40ef          	jal	1614 <__clzsi2>

0000ccfc <.LVL325>:
    ccfc:	06050513          	add	a0,a0,96
    cd00:	f39ff06f          	j	cc38 <.L23>

0000cd04 <.L26>:
    cd04:	ffc00613          	li	a2,-4
    cd08:	02c78633          	mul	a2,a5,a2
    cd0c:	03c10713          	add	a4,sp,60

0000cd10 <.LBB17>:
    cd10:	00300693          	li	a3,3

0000cd14 <.L28>:
    cd14:	00c705b3          	add	a1,a4,a2
    cd18:	0005a583          	lw	a1,0(a1)
    cd1c:	fff68693          	add	a3,a3,-1

0000cd20 <.LVL329>:
    cd20:	ffc70713          	add	a4,a4,-4
    cd24:	00b72223          	sw	a1,4(a4)

0000cd28 <.LVL330>:
    cd28:	fef6d6e3          	bge	a3,a5,cd14 <.L28>
    cd2c:	fff78713          	add	a4,a5,-1
    cd30:	f5dff06f          	j	cc8c <.L31>

0000cd34 <.L30>:
    cd34:	00072583          	lw	a1,0(a4)
    cd38:	ffc72883          	lw	a7,-4(a4)
    cd3c:	00c70e33          	add	t3,a4,a2
    cd40:	00d595b3          	sll	a1,a1,a3
    cd44:	0108d8b3          	srl	a7,a7,a6
    cd48:	0115e5b3          	or	a1,a1,a7
    cd4c:	00be2023          	sw	a1,0(t3)
    cd50:	ffc70713          	add	a4,a4,-4
    cd54:	f15ff06f          	j	cc68 <.L27>

0000cd58 <.L19>:
    cd58:	01696933          	or	s2,s2,s6
    cd5c:	01596933          	or	s2,s2,s5
    cd60:	00a96933          	or	s2,s2,a0
    cd64:	00200693          	li	a3,2
    cd68:	da090c63          	beqz	s2,c320 <.L21>
    cd6c:	00300693          	li	a3,3
    cd70:	db0ff06f          	j	c320 <.L21>

0000cd74 <.L176>:
    cd74:	00000793          	li	a5,0

0000cd78 <.LBE159>:
    cd78:	00100693          	li	a3,1
    cd7c:	da4ff06f          	j	c320 <.L21>

0000cd80 <.L35>:
    cd80:	00100713          	li	a4,1
    cd84:	00f717b3          	sll	a5,a4,a5
  FP_MUL_Q (R, A, B);
    cd88:	5307f713          	and	a4,a5,1328
    cd8c:	06071863          	bnez	a4,cdfc <.L38>
    cd90:	0887f713          	and	a4,a5,136
    cd94:	04071063          	bnez	a4,cdd4 <.L39>
    cd98:	2407f793          	and	a5,a5,576
    cd9c:	dc078063          	beqz	a5,c35c <.L36>

0000cda0 <.L40>:
  FP_PACK_Q (r, R);
    cda0:	000087b7          	lui	a5,0x8
    cda4:	04f12623          	sw	a5,76(sp)
    cda8:	04012423          	sw	zero,72(sp)
    cdac:	04012223          	sw	zero,68(sp)
    cdb0:	04012023          	sw	zero,64(sp)

0000cdb4 <.LVL336>:
    cdb4:	fff78793          	add	a5,a5,-1 # 7fff <.L4+0xf>
    cdb8:	00012223          	sw	zero,4(sp)
    cdbc:	1440006f          	j	cf00 <.L153>

0000cdc0 <.L34>:
  FP_MUL_Q (R, A, B);
    cdc0:	00f00713          	li	a4,15
    cdc4:	fce78ee3          	beq	a5,a4,cda0 <.L40>
    cdc8:	00b00713          	li	a4,11

0000cdcc <.LBB160>:
  FP_UNPACK_Q (A, a);
    cdcc:	01412223          	sw	s4,4(sp)

0000cdd0 <.LBE160>:
  FP_MUL_Q (R, A, B);
    cdd0:	02e79663          	bne	a5,a4,cdfc <.L38>

0000cdd4 <.L39>:
  FP_UNPACK_Q (B, b);
    cdd4:	01312223          	sw	s3,4(sp)

0000cdd8 <.L37>:
  FP_MUL_Q (R, A, B);
    cdd8:	03012783          	lw	a5,48(sp)
    cddc:	00068b93          	mv	s7,a3

0000cde0 <.LVL339>:
    cde0:	04f12023          	sw	a5,64(sp)
    cde4:	03412783          	lw	a5,52(sp)
    cde8:	04f12223          	sw	a5,68(sp)
    cdec:	03812783          	lw	a5,56(sp)
    cdf0:	04f12423          	sw	a5,72(sp)
    cdf4:	03c12783          	lw	a5,60(sp)

0000cdf8 <.LVL340>:
    cdf8:	0200006f          	j	ce18 <.L141>

0000cdfc <.L38>:
    cdfc:	02012783          	lw	a5,32(sp)
    ce00:	04f12023          	sw	a5,64(sp)
    ce04:	02412783          	lw	a5,36(sp)
    ce08:	04f12223          	sw	a5,68(sp)
    ce0c:	02812783          	lw	a5,40(sp)
    ce10:	04f12423          	sw	a5,72(sp)
    ce14:	02c12783          	lw	a5,44(sp)

0000ce18 <.L141>:
    ce18:	04f12623          	sw	a5,76(sp)
  FP_PACK_Q (r, R);
    ce1c:	00200793          	li	a5,2
    ce20:	36fb8663          	beq	s7,a5,d18c <.L142>
    ce24:	00300793          	li	a5,3
    ce28:	f6fb8ce3          	beq	s7,a5,cda0 <.L40>
    ce2c:	00100793          	li	a5,1
    ce30:	34fb8463          	beq	s7,a5,d178 <.L211>

0000ce34 <.L173>:
    ce34:	00812703          	lw	a4,8(sp)
    ce38:	000047b7          	lui	a5,0x4
    ce3c:	fff78793          	add	a5,a5,-1 # 3fff <_dl_aux_init+0x3>
    ce40:	00f707b3          	add	a5,a4,a5

0000ce44 <.LVL344>:
    ce44:	12f05a63          	blez	a5,cf78 <.L144>
    ce48:	04012703          	lw	a4,64(sp)
    ce4c:	00777693          	and	a3,a4,7
    ce50:	04068463          	beqz	a3,ce98 <.L145>
    ce54:	00f77693          	and	a3,a4,15
    ce58:	00400613          	li	a2,4
    ce5c:	02c68e63          	beq	a3,a2,ce98 <.L145>

0000ce60 <.LBB162>:
    ce60:	00470713          	add	a4,a4,4
    ce64:	00473693          	sltiu	a3,a4,4
    ce68:	04e12023          	sw	a4,64(sp)

0000ce6c <.LVL345>:
    ce6c:	04412703          	lw	a4,68(sp)

0000ce70 <.LVL346>:
    ce70:	00e68733          	add	a4,a3,a4
    ce74:	04e12223          	sw	a4,68(sp)

0000ce78 <.LVL347>:
    ce78:	00d73733          	sltu	a4,a4,a3

0000ce7c <.LVL348>:
    ce7c:	04812683          	lw	a3,72(sp)
    ce80:	00e68733          	add	a4,a3,a4

0000ce84 <.LVL349>:
    ce84:	04e12423          	sw	a4,72(sp)

0000ce88 <.LVL350>:
    ce88:	00d73733          	sltu	a4,a4,a3

0000ce8c <.LVL351>:
    ce8c:	04c12683          	lw	a3,76(sp)
    ce90:	00d70733          	add	a4,a4,a3

0000ce94 <.LVL352>:
    ce94:	04e12623          	sw	a4,76(sp)

0000ce98 <.L145>:
    ce98:	04c12703          	lw	a4,76(sp)
    ce9c:	00b71693          	sll	a3,a4,0xb
    cea0:	0206d063          	bgez	a3,cec0 <.L150>
    cea4:	fff007b7          	lui	a5,0xfff00

0000cea8 <.LVL354>:
    cea8:	fff78793          	add	a5,a5,-1 # ffefffff <_ebss+0xffee9f4f>
    ceac:	00f77733          	and	a4,a4,a5
    ceb0:	04e12623          	sw	a4,76(sp)
    ceb4:	00812703          	lw	a4,8(sp)
    ceb8:	000047b7          	lui	a5,0x4

0000cebc <.LVL355>:
    cebc:	00f707b3          	add	a5,a4,a5

0000cec0 <.L150>:
    cec0:	04010713          	add	a4,sp,64
    cec4:	04c10593          	add	a1,sp,76

0000cec8 <.L151>:
    cec8:	00072683          	lw	a3,0(a4)
    cecc:	00472603          	lw	a2,4(a4)
    ced0:	00470713          	add	a4,a4,4
    ced4:	0036d693          	srl	a3,a3,0x3
    ced8:	01d61613          	sll	a2,a2,0x1d
    cedc:	00c6e6b3          	or	a3,a3,a2
    cee0:	fed72e23          	sw	a3,-4(a4)
    cee4:	fee592e3          	bne	a1,a4,cec8 <.L151>

0000cee8 <.LBE163>:
    cee8:	000086b7          	lui	a3,0x8
    ceec:	ffe68693          	add	a3,a3,-2 # 7ffe <.L4+0xe>

0000cef0 <.LBB164>:
    cef0:	04c12703          	lw	a4,76(sp)

0000cef4 <.LBE164>:
    cef4:	28f6cc63          	blt	a3,a5,d18c <.L142>

0000cef8 <.LBB165>:
    cef8:	00375713          	srl	a4,a4,0x3
    cefc:	04e12623          	sw	a4,76(sp)

0000cf00 <.L153>:
    cf00:	04c12703          	lw	a4,76(sp)

0000cf04 <.LBE166>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    cf04:	0ac12083          	lw	ra,172(sp)
    cf08:	00040513          	mv	a0,s0

0000cf0c <.LBB167>:
  FP_PACK_Q (r, R);
    cf0c:	04e11e23          	sh	a4,92(sp)
    cf10:	00412703          	lw	a4,4(sp)

0000cf14 <.LBE167>:
}
    cf14:	0a412483          	lw	s1,164(sp)
    cf18:	0a012903          	lw	s2,160(sp)

0000cf1c <.LBB168>:
  FP_PACK_Q (r, R);
    cf1c:	00f71713          	sll	a4,a4,0xf
    cf20:	00f767b3          	or	a5,a4,a5

0000cf24 <.LVL360>:
    cf24:	04f11f23          	sh	a5,94(sp)

0000cf28 <.LBE168>:
  return r;
    cf28:	04012783          	lw	a5,64(sp)
}
    cf2c:	09c12983          	lw	s3,156(sp)
    cf30:	09812a03          	lw	s4,152(sp)
  return r;
    cf34:	00f42023          	sw	a5,0(s0)
    cf38:	04412783          	lw	a5,68(sp)
}
    cf3c:	09412a83          	lw	s5,148(sp)
    cf40:	09012b03          	lw	s6,144(sp)
  return r;
    cf44:	00f42223          	sw	a5,4(s0)
    cf48:	04812783          	lw	a5,72(sp)
}
    cf4c:	08c12b83          	lw	s7,140(sp)
    cf50:	08812c03          	lw	s8,136(sp)
  return r;
    cf54:	00f42423          	sw	a5,8(s0)
    cf58:	05c12783          	lw	a5,92(sp)
}
    cf5c:	08412c83          	lw	s9,132(sp)
    cf60:	08012d03          	lw	s10,128(sp)
  return r;
    cf64:	00f42623          	sw	a5,12(s0)
}
    cf68:	0a812403          	lw	s0,168(sp)
    cf6c:	07c12d83          	lw	s11,124(sp)
    cf70:	0b010113          	add	sp,sp,176

0000cf74 <.LVL363>:
    cf74:	00008067          	ret

0000cf78 <.L144>:
  FP_PACK_Q (r, R);
    cf78:	00100693          	li	a3,1
    cf7c:	40f686b3          	sub	a3,a3,a5

0000cf80 <.LVL365>:
    cf80:	07400793          	li	a5,116
    cf84:	1cd7ca63          	blt	a5,a3,d158 <.L154>

0000cf88 <.LBB170>:
    cf88:	04010613          	add	a2,sp,64
    cf8c:	4056d713          	sra	a4,a3,0x5

0000cf90 <.LVL367>:
    cf90:	00060513          	mv	a0,a2
    cf94:	01f6f693          	and	a3,a3,31

0000cf98 <.LVL368>:
    cf98:	00000793          	li	a5,0
    cf9c:	00000593          	li	a1,0

0000cfa0 <.L155>:
    cfa0:	02e59e63          	bne	a1,a4,cfdc <.L156>
    cfa4:	00300593          	li	a1,3

0000cfa8 <.LVL370>:
    cfa8:	40e585b3          	sub	a1,a1,a4
    cfac:	00271513          	sll	a0,a4,0x2
    cfb0:	04069063          	bnez	a3,cff0 <.L157>
    cfb4:	00060813          	mv	a6,a2

0000cfb8 <.L158>:
    cfb8:	00a808b3          	add	a7,a6,a0
    cfbc:	0008a883          	lw	a7,0(a7)
    cfc0:	00168693          	add	a3,a3,1

0000cfc4 <.LVL372>:
    cfc4:	00480813          	add	a6,a6,4
    cfc8:	ff182e23          	sw	a7,-4(a6)

0000cfcc <.LVL373>:
    cfcc:	fed5d6e3          	bge	a1,a3,cfb8 <.L158>
    cfd0:	00400693          	li	a3,4

0000cfd4 <.LVL374>:
    cfd4:	40e68733          	sub	a4,a3,a4

0000cfd8 <.LVL375>:
    cfd8:	06c0006f          	j	d044 <.L162>

0000cfdc <.L156>:
    cfdc:	00052803          	lw	a6,0(a0)
    cfe0:	00158593          	add	a1,a1,1

0000cfe4 <.LVL377>:
    cfe4:	00450513          	add	a0,a0,4
    cfe8:	0107e7b3          	or	a5,a5,a6

0000cfec <.LVL378>:
    cfec:	fb5ff06f          	j	cfa0 <.L155>

0000cff0 <.L157>:
    cff0:	05050813          	add	a6,a0,80
    cff4:	02010893          	add	a7,sp,32
    cff8:	01180833          	add	a6,a6,a7
    cffc:	fd082803          	lw	a6,-48(a6)
    d000:	02000313          	li	t1,32
    d004:	40d30333          	sub	t1,t1,a3
    d008:	00681833          	sll	a6,a6,t1
    d00c:	0107e7b3          	or	a5,a5,a6

0000d010 <.LVL380>:
    d010:	00000e13          	li	t3,0
    d014:	00a60833          	add	a6,a2,a0
    d018:	40a00533          	neg	a0,a0

0000d01c <.L160>:
    d01c:	0ebe4063          	blt	t3,a1,d0fc <.L161>
    d020:	00400513          	li	a0,4
    d024:	00259593          	sll	a1,a1,0x2
    d028:	40e50733          	sub	a4,a0,a4

0000d02c <.LVL382>:
    d02c:	05058593          	add	a1,a1,80
    d030:	02010513          	add	a0,sp,32
    d034:	00a585b3          	add	a1,a1,a0
    d038:	04c12503          	lw	a0,76(sp)
    d03c:	00d556b3          	srl	a3,a0,a3

0000d040 <.LVL383>:
    d040:	fcd5a823          	sw	a3,-48(a1)

0000d044 <.L162>:
    d044:	00400693          	li	a3,4
    d048:	40e686b3          	sub	a3,a3,a4
    d04c:	00269693          	sll	a3,a3,0x2
    d050:	00271713          	sll	a4,a4,0x2
    d054:	00800593          	li	a1,8
    d058:	00e60733          	add	a4,a2,a4
    d05c:	00b6ea63          	bltu	a3,a1,d070 <.L163>
    d060:	00072023          	sw	zero,0(a4)
    d064:	00072223          	sw	zero,4(a4)
    d068:	ff868693          	add	a3,a3,-8
    d06c:	00870713          	add	a4,a4,8

0000d070 <.L163>:
    d070:	00400593          	li	a1,4
    d074:	00b6e463          	bltu	a3,a1,d07c <.L164>
    d078:	00072023          	sw	zero,0(a4)

0000d07c <.L164>:
    d07c:	04012703          	lw	a4,64(sp)

0000d080 <.LBB172>:
    d080:	00f037b3          	snez	a5,a5

0000d084 <.LBE172>:
    d084:	00e7e7b3          	or	a5,a5,a4
    d088:	04f12023          	sw	a5,64(sp)

0000d08c <.LBE170>:
    d08c:	0077f713          	and	a4,a5,7
    d090:	04070463          	beqz	a4,d0d8 <.L165>
    d094:	00f7f713          	and	a4,a5,15
    d098:	00400693          	li	a3,4
    d09c:	02d70e63          	beq	a4,a3,d0d8 <.L165>

0000d0a0 <.LBB174>:
    d0a0:	04412703          	lw	a4,68(sp)
    d0a4:	00478793          	add	a5,a5,4 # 4004 <_dl_aux_init+0x8>
    d0a8:	04f12023          	sw	a5,64(sp)

0000d0ac <.LVL386>:
    d0ac:	0047b793          	sltiu	a5,a5,4

0000d0b0 <.LVL387>:
    d0b0:	00f707b3          	add	a5,a4,a5
    d0b4:	04f12223          	sw	a5,68(sp)

0000d0b8 <.LVL388>:
    d0b8:	00e7b7b3          	sltu	a5,a5,a4

0000d0bc <.LVL389>:
    d0bc:	04812703          	lw	a4,72(sp)
    d0c0:	00f707b3          	add	a5,a4,a5

0000d0c4 <.LVL390>:
    d0c4:	04f12423          	sw	a5,72(sp)

0000d0c8 <.LVL391>:
    d0c8:	00e7b7b3          	sltu	a5,a5,a4

0000d0cc <.LVL392>:
    d0cc:	04c12703          	lw	a4,76(sp)
    d0d0:	00e787b3          	add	a5,a5,a4

0000d0d4 <.LVL393>:
    d0d4:	04f12623          	sw	a5,76(sp)

0000d0d8 <.L165>:
    d0d8:	04c12703          	lw	a4,76(sp)
    d0dc:	00c71793          	sll	a5,a4,0xc
    d0e0:	0407d263          	bgez	a5,d124 <.L170>

0000d0e4 <.LVL395>:
    d0e4:	04012623          	sw	zero,76(sp)
    d0e8:	04012423          	sw	zero,72(sp)
    d0ec:	04012223          	sw	zero,68(sp)
    d0f0:	04012023          	sw	zero,64(sp)
    d0f4:	00100793          	li	a5,1

0000d0f8 <.LVL396>:
    d0f8:	e09ff06f          	j	cf00 <.L153>

0000d0fc <.L161>:
    d0fc:	00082883          	lw	a7,0(a6)
    d100:	00482e83          	lw	t4,4(a6)
    d104:	00a80f33          	add	t5,a6,a0
    d108:	00d8d8b3          	srl	a7,a7,a3
    d10c:	006e9eb3          	sll	t4,t4,t1
    d110:	01d8e8b3          	or	a7,a7,t4
    d114:	011f2023          	sw	a7,0(t5)

0000d118 <.LVL398>:
    d118:	001e0e13          	add	t3,t3,1

0000d11c <.LVL399>:
    d11c:	00480813          	add	a6,a6,4
    d120:	efdff06f          	j	d01c <.L160>

0000d124 <.L170>:
    d124:	00c60593          	add	a1,a2,12

0000d128 <.L171>:
    d128:	00062783          	lw	a5,0(a2)
    d12c:	00462683          	lw	a3,4(a2)
    d130:	00460613          	add	a2,a2,4
    d134:	0037d793          	srl	a5,a5,0x3
    d138:	01d69693          	sll	a3,a3,0x1d
    d13c:	00d7e7b3          	or	a5,a5,a3
    d140:	fef62e23          	sw	a5,-4(a2)
    d144:	fec592e3          	bne	a1,a2,d128 <.L171>

0000d148 <.LVL402>:
    d148:	00375713          	srl	a4,a4,0x3
    d14c:	04e12623          	sw	a4,76(sp)

0000d150 <.L172>:
    d150:	00000793          	li	a5,0
    d154:	dadff06f          	j	cf00 <.L153>

0000d158 <.L154>:
    d158:	04412703          	lw	a4,68(sp)
    d15c:	04012783          	lw	a5,64(sp)
    d160:	00e7e7b3          	or	a5,a5,a4
    d164:	04812703          	lw	a4,72(sp)
    d168:	00e7e7b3          	or	a5,a5,a4
    d16c:	04c12703          	lw	a4,76(sp)
    d170:	00e7e7b3          	or	a5,a5,a4
    d174:	fc078ee3          	beqz	a5,d150 <.L172>

0000d178 <.L211>:
    d178:	04012623          	sw	zero,76(sp)
    d17c:	04012423          	sw	zero,72(sp)
    d180:	04012223          	sw	zero,68(sp)

0000d184 <.LBB178>:
    d184:	04012023          	sw	zero,64(sp)
    d188:	fc9ff06f          	j	d150 <.L172>

0000d18c <.L142>:
    d18c:	000087b7          	lui	a5,0x8
    d190:	04012623          	sw	zero,76(sp)
    d194:	04012423          	sw	zero,72(sp)
    d198:	04012223          	sw	zero,68(sp)
    d19c:	04012023          	sw	zero,64(sp)
    d1a0:	fff78793          	add	a5,a5,-1 # 7fff <.L4+0xf>
    d1a4:	d5dff06f          	j	cf00 <.L153>

0000d1a8 <__subtf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__subtf3 (TFtype a, TFtype b)
{
    d1a8:	f9010113          	add	sp,sp,-112
    d1ac:	0085a703          	lw	a4,8(a1)
    d1b0:	05512a23          	sw	s5,84(sp)
    d1b4:	00c5aa83          	lw	s5,12(a1)
    d1b8:	0005a783          	lw	a5,0(a1)
    d1bc:	0045a683          	lw	a3,4(a1)

0000d1c0 <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_Q (A, a);
    d1c0:	02e12c23          	sw	a4,56(sp)
    d1c4:	00e12c23          	sw	a4,24(sp)
    d1c8:	010a9713          	sll	a4,s5,0x10

0000d1cc <.LBE3>:
{
    d1cc:	06912223          	sw	s1,100(sp)

0000d1d0 <.LBB4>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d1d0:	01075713          	srl	a4,a4,0x10
    d1d4:	001a9493          	sll	s1,s5,0x1

0000d1d8 <.LBE4>:
{
    d1d8:	00462803          	lw	a6,4(a2)
    d1dc:	00862583          	lw	a1,8(a2)
    d1e0:	06812423          	sw	s0,104(sp)
    d1e4:	07212023          	sw	s2,96(sp)
    d1e8:	00062403          	lw	s0,0(a2)
    d1ec:	00c62903          	lw	s2,12(a2)
    d1f0:	05412c23          	sw	s4,88(sp)

0000d1f4 <.LBB5>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d1f4:	03512e23          	sw	s5,60(sp)

0000d1f8 <.LBE5>:
{
    d1f8:	00050a13          	mv	s4,a0
    d1fc:	06112623          	sw	ra,108(sp)
    d200:	05312e23          	sw	s3,92(sp)
    d204:	05612823          	sw	s6,80(sp)
    d208:	05712623          	sw	s7,76(sp)
    d20c:	05812423          	sw	s8,72(sp)

0000d210 <.LBB6>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d210:	02f12823          	sw	a5,48(sp)
    d214:	02d12a23          	sw	a3,52(sp)
    d218:	00f12823          	sw	a5,16(sp)
    d21c:	00d12a23          	sw	a3,20(sp)
    d220:	00e12e23          	sw	a4,28(sp)
    d224:	0114d493          	srl	s1,s1,0x11

0000d228 <.LVL1>:
    d228:	01fada93          	srl	s5,s5,0x1f

0000d22c <.LBB7>:
    d22c:	01010513          	add	a0,sp,16
    d230:	01c10613          	add	a2,sp,28

0000d234 <.L2>:
    d234:	00062703          	lw	a4,0(a2)
    d238:	ffc62683          	lw	a3,-4(a2)
    d23c:	ffc60613          	add	a2,a2,-4
    d240:	00371713          	sll	a4,a4,0x3
    d244:	01d6d693          	srl	a3,a3,0x1d
    d248:	00d76733          	or	a4,a4,a3
    d24c:	00e62223          	sw	a4,4(a2)
    d250:	fec512e3          	bne	a0,a2,d234 <.L2>

0000d254 <.LBB8>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    d254:	01091713          	sll	a4,s2,0x10
    d258:	00191b93          	sll	s7,s2,0x1

0000d25c <.LBB9>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d25c:	00379793          	sll	a5,a5,0x3

0000d260 <.LBB10>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    d260:	01075713          	srl	a4,a4,0x10
    d264:	03012a23          	sw	a6,52(sp)
    d268:	03212e23          	sw	s2,60(sp)
    d26c:	03012223          	sw	a6,36(sp)

0000d270 <.LBB11>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d270:	00f12823          	sw	a5,16(sp)

0000d274 <.LBB12>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    d274:	02812823          	sw	s0,48(sp)
    d278:	02b12c23          	sw	a1,56(sp)
    d27c:	02812023          	sw	s0,32(sp)
    d280:	02b12423          	sw	a1,40(sp)
    d284:	02e12623          	sw	a4,44(sp)
    d288:	011bdb93          	srl	s7,s7,0x11

0000d28c <.LVL6>:
    d28c:	01f95913          	srl	s2,s2,0x1f

0000d290 <.LBB13>:
    d290:	02010813          	add	a6,sp,32
    d294:	02c10313          	add	t1,sp,44

0000d298 <.L3>:
    d298:	00032703          	lw	a4,0(t1)
    d29c:	ffc32683          	lw	a3,-4(t1)
    d2a0:	ffc30313          	add	t1,t1,-4
    d2a4:	00371713          	sll	a4,a4,0x3
    d2a8:	01d6d693          	srl	a3,a3,0x1d
    d2ac:	00d76733          	or	a4,a4,a3
    d2b0:	00e32223          	sw	a4,4(t1)
    d2b4:	fe6812e3          	bne	a6,t1,d298 <.L3>

0000d2b8 <.LVL9>:
    d2b8:	00341413          	sll	s0,s0,0x3

0000d2bc <.LBE13>:
  FP_SUB_Q (R, A, B);
    d2bc:	00008737          	lui	a4,0x8

0000d2c0 <.LBB14>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    d2c0:	02812023          	sw	s0,32(sp)

0000d2c4 <.LBE14>:
  FP_SUB_Q (R, A, B);
    d2c4:	fff70713          	add	a4,a4,-1 # 7fff <.L4+0xf>
    d2c8:	02eb9063          	bne	s7,a4,d2e8 <.L4>
    d2cc:	02812683          	lw	a3,40(sp)
    d2d0:	02412703          	lw	a4,36(sp)
    d2d4:	00d76733          	or	a4,a4,a3
    d2d8:	02c12683          	lw	a3,44(sp)
    d2dc:	00d76733          	or	a4,a4,a3
    d2e0:	00876733          	or	a4,a4,s0
    d2e4:	00071463          	bnez	a4,d2ec <.L5>

0000d2e8 <.L4>:
    d2e8:	00194913          	xor	s2,s2,1

0000d2ec <.L5>:
    d2ec:	417488b3          	sub	a7,s1,s7

0000d2f0 <.LBE15>:
    d2f0:	095916e3          	bne	s2,s5,db7c <.L6>

0000d2f4 <.LBB48>:
    d2f4:	45105263          	blez	a7,d738 <.L7>

0000d2f8 <.LVL12>:
    d2f8:	01412903          	lw	s2,20(sp)

0000d2fc <.LVL13>:
    d2fc:	01812983          	lw	s3,24(sp)
    d300:	01c12b03          	lw	s6,28(sp)
    d304:	0a0b9263          	bnez	s7,d3a8 <.L8>
    d308:	02412683          	lw	a3,36(sp)
    d30c:	02812703          	lw	a4,40(sp)
    d310:	02c12583          	lw	a1,44(sp)
    d314:	00e6e633          	or	a2,a3,a4
    d318:	00b66633          	or	a2,a2,a1
    d31c:	00866633          	or	a2,a2,s0
    d320:	00061e63          	bnez	a2,d33c <.L9>

0000d324 <.L363>:
    d324:	02f12823          	sw	a5,48(sp)
    d328:	03212a23          	sw	s2,52(sp)
    d32c:	03312c23          	sw	s3,56(sp)
    d330:	03612e23          	sw	s6,60(sp)

0000d334 <.LBB91>:
    d334:	00088493          	mv	s1,a7

0000d338 <.LVL16>:
    d338:	08c0006f          	j	d3c4 <.L10>

0000d33c <.L9>:
    d33c:	fff88613          	add	a2,a7,-1

0000d340 <.LVL18>:
    d340:	04061863          	bnez	a2,d390 <.L11>

0000d344 <.LBB16>:
    d344:	00878433          	add	s0,a5,s0
    d348:	01268933          	add	s2,a3,s2
    d34c:	02812823          	sw	s0,48(sp)

0000d350 <.LVL19>:
    d350:	00f43433          	sltu	s0,s0,a5

0000d354 <.LVL20>:
    d354:	00890433          	add	s0,s2,s0

0000d358 <.LVL21>:
    d358:	02812a23          	sw	s0,52(sp)

0000d35c <.LVL22>:
    d35c:	00d936b3          	sltu	a3,s2,a3

0000d360 <.LVL23>:
    d360:	01243433          	sltu	s0,s0,s2

0000d364 <.LVL24>:
    d364:	013709b3          	add	s3,a4,s3

0000d368 <.LVL25>:
    d368:	0086e6b3          	or	a3,a3,s0

0000d36c <.LVL26>:
    d36c:	00d986b3          	add	a3,s3,a3
    d370:	02d12c23          	sw	a3,56(sp)

0000d374 <.LVL27>:
    d374:	00e9b7b3          	sltu	a5,s3,a4

0000d378 <.LVL28>:
    d378:	0136b6b3          	sltu	a3,a3,s3

0000d37c <.LVL29>:
    d37c:	00d7e7b3          	or	a5,a5,a3

0000d380 <.LVL30>:
    d380:	016585b3          	add	a1,a1,s6
    d384:	00b787b3          	add	a5,a5,a1

0000d388 <.L355>:
    d388:	00100493          	li	s1,1

0000d38c <.LVL32>:
    d38c:	2fc0006f          	j	d688 <.L22>

0000d390 <.L11>:
    d390:	00008737          	lui	a4,0x8
    d394:	fff70713          	add	a4,a4,-1 # 7fff <.L4+0xf>
    d398:	00e88463          	beq	a7,a4,d3a0 <.L23>
    d39c:	2540106f          	j	e5f0 <.L343>

0000d3a0 <.L23>:
    d3a0:	02f12823          	sw	a5,48(sp)
    d3a4:	4400006f          	j	d7e4 <.L364>

0000d3a8 <.L8>:
    d3a8:	00008737          	lui	a4,0x8
    d3ac:	fff70713          	add	a4,a4,-1 # 7fff <.L4+0xf>
    d3b0:	16e49a63          	bne	s1,a4,d524 <.L25>

0000d3b4 <.LVL36>:
    d3b4:	02f12823          	sw	a5,48(sp)
    d3b8:	03212a23          	sw	s2,52(sp)
    d3bc:	03312c23          	sw	s3,56(sp)
    d3c0:	03612e23          	sw	s6,60(sp)

0000d3c4 <.L10>:
  FP_PACK_SEMIRAW_Q (r, R);
    d3c4:	03012783          	lw	a5,48(sp)
    d3c8:	0077f713          	and	a4,a5,7
    d3cc:	04070463          	beqz	a4,d414 <.L257>
    d3d0:	00f7f713          	and	a4,a5,15
    d3d4:	00400693          	li	a3,4
    d3d8:	02d70e63          	beq	a4,a3,d414 <.L257>

0000d3dc <.LBB92>:
    d3dc:	03412703          	lw	a4,52(sp)
    d3e0:	00478793          	add	a5,a5,4
    d3e4:	02f12823          	sw	a5,48(sp)

0000d3e8 <.LVL38>:
    d3e8:	0047b793          	sltiu	a5,a5,4

0000d3ec <.LVL39>:
    d3ec:	00f707b3          	add	a5,a4,a5
    d3f0:	02f12a23          	sw	a5,52(sp)

0000d3f4 <.LVL40>:
    d3f4:	00e7b7b3          	sltu	a5,a5,a4

0000d3f8 <.LVL41>:
    d3f8:	03812703          	lw	a4,56(sp)
    d3fc:	00f707b3          	add	a5,a4,a5

0000d400 <.LVL42>:
    d400:	02f12c23          	sw	a5,56(sp)

0000d404 <.LVL43>:
    d404:	00e7b7b3          	sltu	a5,a5,a4

0000d408 <.LVL44>:
    d408:	03c12703          	lw	a4,60(sp)
    d40c:	00e787b3          	add	a5,a5,a4

0000d410 <.LVL45>:
    d410:	02f12e23          	sw	a5,60(sp)

0000d414 <.L257>:
    d414:	03c12783          	lw	a5,60(sp)
    d418:	00c79713          	sll	a4,a5,0xc
    d41c:	02075463          	bgez	a4,d444 <.L262>
    d420:	00008737          	lui	a4,0x8
    d424:	00148493          	add	s1,s1,1

0000d428 <.LVL47>:
    d428:	fff70713          	add	a4,a4,-1 # 7fff <.L4+0xf>
    d42c:	00e49463          	bne	s1,a4,d434 <.LVL47+0xc>
    d430:	1ac0106f          	j	e5dc <.L263>
    d434:	fff80737          	lui	a4,0xfff80
    d438:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff69f4f>
    d43c:	00e7f7b3          	and	a5,a5,a4
    d440:	02f12e23          	sw	a5,60(sp)

0000d444 <.L262>:
    d444:	03010793          	add	a5,sp,48
    d448:	03c10613          	add	a2,sp,60

0000d44c <.L265>:
    d44c:	0007a703          	lw	a4,0(a5)
    d450:	0047a683          	lw	a3,4(a5)
    d454:	00478793          	add	a5,a5,4
    d458:	00375713          	srl	a4,a4,0x3
    d45c:	01d69693          	sll	a3,a3,0x1d
    d460:	00d76733          	or	a4,a4,a3
    d464:	fee7ae23          	sw	a4,-4(a5)
    d468:	fec792e3          	bne	a5,a2,d44c <.L265>

0000d46c <.LVL50>:
    d46c:	03c12703          	lw	a4,60(sp)

0000d470 <.LBE93>:
    d470:	000086b7          	lui	a3,0x8
    d474:	fff68793          	add	a5,a3,-1 # 7fff <.L4+0xf>

0000d478 <.LBB94>:
    d478:	00375713          	srl	a4,a4,0x3
    d47c:	02e12e23          	sw	a4,60(sp)

0000d480 <.LBE94>:
    d480:	02f49a63          	bne	s1,a5,d4b4 <.L266>
    d484:	03412603          	lw	a2,52(sp)
    d488:	03012783          	lw	a5,48(sp)
    d48c:	00c7e7b3          	or	a5,a5,a2
    d490:	03812603          	lw	a2,56(sp)
    d494:	00c7e7b3          	or	a5,a5,a2
    d498:	00e7e7b3          	or	a5,a5,a4
    d49c:	00078c63          	beqz	a5,d4b4 <.L266>
    d4a0:	02d12e23          	sw	a3,60(sp)
    d4a4:	02012c23          	sw	zero,56(sp)
    d4a8:	02012a23          	sw	zero,52(sp)
    d4ac:	02012823          	sw	zero,48(sp)

0000d4b0 <.LVL51>:
    d4b0:	00000a93          	li	s5,0

0000d4b4 <.L266>:
    d4b4:	03c12783          	lw	a5,60(sp)
    d4b8:	01149493          	sll	s1,s1,0x11

0000d4bc <.LVL53>:
    d4bc:	0114d493          	srl	s1,s1,0x11
    d4c0:	00f11623          	sh	a5,12(sp)

0000d4c4 <.LBE101>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    d4c4:	03012783          	lw	a5,48(sp)

0000d4c8 <.LBB102>:
  FP_PACK_SEMIRAW_Q (r, R);
    d4c8:	00fa9a93          	sll	s5,s5,0xf

0000d4cc <.LVL54>:
    d4cc:	009aeab3          	or	s5,s5,s1

0000d4d0 <.LBE102>:
  return r;
    d4d0:	00fa2023          	sw	a5,0(s4)
    d4d4:	03412783          	lw	a5,52(sp)

0000d4d8 <.LBB103>:
  FP_PACK_SEMIRAW_Q (r, R);
    d4d8:	01511723          	sh	s5,14(sp)

0000d4dc <.LBE103>:
}
    d4dc:	06c12083          	lw	ra,108(sp)
  return r;
    d4e0:	00fa2223          	sw	a5,4(s4)
    d4e4:	03812783          	lw	a5,56(sp)

0000d4e8 <.LVL56>:
}
    d4e8:	06812403          	lw	s0,104(sp)
    d4ec:	06412483          	lw	s1,100(sp)
  return r;
    d4f0:	00fa2423          	sw	a5,8(s4)
    d4f4:	00c12783          	lw	a5,12(sp)
}
    d4f8:	06012903          	lw	s2,96(sp)
    d4fc:	05c12983          	lw	s3,92(sp)
  return r;
    d500:	00fa2623          	sw	a5,12(s4)
}
    d504:	05412a83          	lw	s5,84(sp)
    d508:	05012b03          	lw	s6,80(sp)
    d50c:	04c12b83          	lw	s7,76(sp)

0000d510 <.LVL57>:
    d510:	04812c03          	lw	s8,72(sp)
    d514:	000a0513          	mv	a0,s4
    d518:	05812a03          	lw	s4,88(sp)
    d51c:	07010113          	add	sp,sp,112

0000d520 <.LVL59>:
    d520:	00008067          	ret

0000d524 <.L25>:
  FP_SUB_Q (R, A, B);
    d524:	02c12703          	lw	a4,44(sp)
    d528:	000806b7          	lui	a3,0x80
    d52c:	00d76733          	or	a4,a4,a3
    d530:	02e12623          	sw	a4,44(sp)

0000d534 <.LDL1>:
    d534:	07400713          	li	a4,116
    d538:	01175463          	bge	a4,a7,d540 <.LDL1+0xc>
    d53c:	0c00106f          	j	e5fc <.L26>
    d540:	00088613          	mv	a2,a7

0000d544 <.L267>:
    d544:	40565693          	sra	a3,a2,0x5

0000d548 <.LVL62>:
    d548:	00030513          	mv	a0,t1
    d54c:	01f67613          	and	a2,a2,31

0000d550 <.LVL63>:
    d550:	00000713          	li	a4,0
    d554:	00000593          	li	a1,0

0000d558 <.L27>:
    d558:	02d59c63          	bne	a1,a3,d590 <.L28>
    d55c:	00300593          	li	a1,3

0000d560 <.LVL65>:
    d560:	40d585b3          	sub	a1,a1,a3
    d564:	00269513          	sll	a0,a3,0x2
    d568:	02061e63          	bnez	a2,d5a4 <.L29>

0000d56c <.L30>:
    d56c:	00a308b3          	add	a7,t1,a0
    d570:	0008a883          	lw	a7,0(a7)
    d574:	00160613          	add	a2,a2,1

0000d578 <.LVL67>:
    d578:	00430313          	add	t1,t1,4
    d57c:	ff132e23          	sw	a7,-4(t1)

0000d580 <.LVL68>:
    d580:	fec5d6e3          	bge	a1,a2,d56c <.L30>
    d584:	00400613          	li	a2,4

0000d588 <.LVL69>:
    d588:	40d606b3          	sub	a3,a2,a3

0000d58c <.LVL70>:
    d58c:	0640006f          	j	d5f0 <.L34>

0000d590 <.L28>:
    d590:	00052883          	lw	a7,0(a0)
    d594:	00158593          	add	a1,a1,1

0000d598 <.LVL72>:
    d598:	00450513          	add	a0,a0,4
    d59c:	01176733          	or	a4,a4,a7

0000d5a0 <.LVL73>:
    d5a0:	fb9ff06f          	j	d558 <.L27>

0000d5a4 <.L29>:
    d5a4:	04050893          	add	a7,a0,64
    d5a8:	002888b3          	add	a7,a7,sp
    d5ac:	fe08a883          	lw	a7,-32(a7)
    d5b0:	02000e13          	li	t3,32
    d5b4:	40ce0e33          	sub	t3,t3,a2
    d5b8:	01c898b3          	sll	a7,a7,t3
    d5bc:	01176733          	or	a4,a4,a7

0000d5c0 <.LVL75>:
    d5c0:	00000e93          	li	t4,0
    d5c4:	00a808b3          	add	a7,a6,a0
    d5c8:	40a00533          	neg	a0,a0

0000d5cc <.L32>:
    d5cc:	14bec263          	blt	t4,a1,d710 <.L33>
    d5d0:	00400513          	li	a0,4
    d5d4:	40d506b3          	sub	a3,a0,a3

0000d5d8 <.LVL77>:
    d5d8:	02c12503          	lw	a0,44(sp)
    d5dc:	00259593          	sll	a1,a1,0x2

0000d5e0 <.LVL78>:
    d5e0:	04058593          	add	a1,a1,64
    d5e4:	002585b3          	add	a1,a1,sp
    d5e8:	00c55633          	srl	a2,a0,a2

0000d5ec <.LVL79>:
    d5ec:	fec5a023          	sw	a2,-32(a1)

0000d5f0 <.L34>:
    d5f0:	00400613          	li	a2,4
    d5f4:	40d60633          	sub	a2,a2,a3
    d5f8:	00261613          	sll	a2,a2,0x2
    d5fc:	00269693          	sll	a3,a3,0x2
    d600:	00800593          	li	a1,8
    d604:	00d806b3          	add	a3,a6,a3
    d608:	00b66a63          	bltu	a2,a1,d61c <.L35>
    d60c:	0006a023          	sw	zero,0(a3) # 80000 <_ebss+0x69f50>
    d610:	0006a223          	sw	zero,4(a3)
    d614:	ff860613          	add	a2,a2,-8
    d618:	00868693          	add	a3,a3,8

0000d61c <.L35>:
    d61c:	00400593          	li	a1,4
    d620:	00b66463          	bltu	a2,a1,d628 <.L36>
    d624:	0006a023          	sw	zero,0(a3)

0000d628 <.L36>:
    d628:	02012683          	lw	a3,32(sp)

0000d62c <.LBB19>:
    d62c:	00e03733          	snez	a4,a4

0000d630 <.LBE19>:
    d630:	00d76733          	or	a4,a4,a3

0000d634 <.L37>:
    d634:	02412683          	lw	a3,36(sp)

0000d638 <.LBB21>:
    d638:	02e12023          	sw	a4,32(sp)

0000d63c <.LBB22>:
    d63c:	00e78733          	add	a4,a5,a4
    d640:	01268933          	add	s2,a3,s2
    d644:	02e12823          	sw	a4,48(sp)

0000d648 <.LVL84>:
    d648:	00f73733          	sltu	a4,a4,a5

0000d64c <.LVL85>:
    d64c:	02812783          	lw	a5,40(sp)
    d650:	00e90733          	add	a4,s2,a4

0000d654 <.LVL86>:
    d654:	02e12a23          	sw	a4,52(sp)

0000d658 <.LVL87>:
    d658:	00d936b3          	sltu	a3,s2,a3

0000d65c <.LVL88>:
    d65c:	01273733          	sltu	a4,a4,s2

0000d660 <.LVL89>:
    d660:	013789b3          	add	s3,a5,s3

0000d664 <.LVL90>:
    d664:	00e6e733          	or	a4,a3,a4

0000d668 <.LVL91>:
    d668:	00e98733          	add	a4,s3,a4
    d66c:	02e12c23          	sw	a4,56(sp)

0000d670 <.LVL92>:
    d670:	00f9b7b3          	sltu	a5,s3,a5

0000d674 <.LVL93>:
    d674:	01373733          	sltu	a4,a4,s3

0000d678 <.LVL94>:
    d678:	00e7e7b3          	or	a5,a5,a4

0000d67c <.LVL95>:
    d67c:	02c12703          	lw	a4,44(sp)

0000d680 <.LVL96>:
    d680:	00eb0733          	add	a4,s6,a4
    d684:	00e787b3          	add	a5,a5,a4

0000d688 <.L22>:
    d688:	02f12e23          	sw	a5,60(sp)

0000d68c <.LBE23>:
    d68c:	00c79713          	sll	a4,a5,0xc
    d690:	d2075ae3          	bgez	a4,d3c4 <.L10>

0000d694 <.LBB24>:
    d694:	03012683          	lw	a3,48(sp)

0000d698 <.LBE24>:
    d698:	fff80737          	lui	a4,0xfff80
    d69c:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff69f4f>
    d6a0:	00e7f7b3          	and	a5,a5,a4
    d6a4:	02f12e23          	sw	a5,60(sp)
    d6a8:	00148493          	add	s1,s1,1

0000d6ac <.LBB26>:
    d6ac:	01f69693          	sll	a3,a3,0x1f

0000d6b0 <.LVL100>:
    d6b0:	03010713          	add	a4,sp,48
    d6b4:	03c10513          	add	a0,sp,60

0000d6b8 <.L115>:
    d6b8:	00072603          	lw	a2,0(a4)
    d6bc:	00472583          	lw	a1,4(a4)
    d6c0:	00470713          	add	a4,a4,4
    d6c4:	00165613          	srl	a2,a2,0x1
    d6c8:	01f59593          	sll	a1,a1,0x1f
    d6cc:	00b66633          	or	a2,a2,a1
    d6d0:	fec72e23          	sw	a2,-4(a4)
    d6d4:	fee512e3          	bne	a0,a4,d6b8 <.L115>

0000d6d8 <.LBE26>:
    d6d8:	03012703          	lw	a4,48(sp)

0000d6dc <.LBB27>:
    d6dc:	0017d793          	srl	a5,a5,0x1
    d6e0:	02f12e23          	sw	a5,60(sp)

0000d6e4 <.LBB28>:
    d6e4:	00d037b3          	snez	a5,a3

0000d6e8 <.LBE28>:
    d6e8:	00f767b3          	or	a5,a4,a5
    d6ec:	02f12823          	sw	a5,48(sp)

0000d6f0 <.LBE29>:
    d6f0:	000087b7          	lui	a5,0x8
    d6f4:	fff78793          	add	a5,a5,-1 # 7fff <.L4+0xf>
    d6f8:	ccf496e3          	bne	s1,a5,d3c4 <.L10>

0000d6fc <.LVL104>:
    d6fc:	02012e23          	sw	zero,60(sp)
    d700:	02012c23          	sw	zero,56(sp)
    d704:	02012a23          	sw	zero,52(sp)
    d708:	02012823          	sw	zero,48(sp)

0000d70c <.LBB105>:
  FP_PACK_SEMIRAW_Q (r, R);
    d70c:	cb9ff06f          	j	d3c4 <.L10>

0000d710 <.L33>:
  FP_SUB_Q (R, A, B);
    d710:	0008a303          	lw	t1,0(a7)
    d714:	0048af03          	lw	t5,4(a7)
    d718:	00a88fb3          	add	t6,a7,a0
    d71c:	00c35333          	srl	t1,t1,a2
    d720:	01cf1f33          	sll	t5,t5,t3
    d724:	01e36333          	or	t1,t1,t5
    d728:	006fa023          	sw	t1,0(t6)

0000d72c <.LVL107>:
    d72c:	001e8e93          	add	t4,t4,1

0000d730 <.LVL108>:
    d730:	00488893          	add	a7,a7,4
    d734:	e99ff06f          	j	d5cc <.L32>

0000d738 <.L7>:
    d738:	02412903          	lw	s2,36(sp)

0000d73c <.LVL110>:
    d73c:	02812983          	lw	s3,40(sp)
    d740:	02c12b03          	lw	s6,44(sp)

0000d744 <.LBB108>:
    d744:	26088263          	beqz	a7,d9a8 <.L48>
    d748:	409b8833          	sub	a6,s7,s1

0000d74c <.LVL111>:
    d74c:	0a049c63          	bnez	s1,d804 <.L49>
    d750:	01412683          	lw	a3,20(sp)
    d754:	01812703          	lw	a4,24(sp)
    d758:	01c12883          	lw	a7,28(sp)
    d75c:	00e6e5b3          	or	a1,a3,a4
    d760:	0115e5b3          	or	a1,a1,a7
    d764:	00f5e5b3          	or	a1,a1,a5
    d768:	00059e63          	bnez	a1,d784 <.L50>

0000d76c <.LVL112>:
    d76c:	02812823          	sw	s0,48(sp)
    d770:	03212a23          	sw	s2,52(sp)
    d774:	03312c23          	sw	s3,56(sp)
    d778:	03612e23          	sw	s6,60(sp)

0000d77c <.L360>:
    d77c:	00080493          	mv	s1,a6

0000d780 <.LVL114>:
    d780:	c45ff06f          	j	d3c4 <.L10>

0000d784 <.L50>:
    d784:	fff80593          	add	a1,a6,-1

0000d788 <.LVL116>:
    d788:	04059663          	bnez	a1,d7d4 <.L51>

0000d78c <.LBB31>:
    d78c:	00878433          	add	s0,a5,s0
    d790:	01268933          	add	s2,a3,s2
    d794:	02812823          	sw	s0,48(sp)

0000d798 <.LVL117>:
    d798:	00f43433          	sltu	s0,s0,a5

0000d79c <.LVL118>:
    d79c:	00890433          	add	s0,s2,s0

0000d7a0 <.LVL119>:
    d7a0:	02812a23          	sw	s0,52(sp)

0000d7a4 <.LVL120>:
    d7a4:	00d936b3          	sltu	a3,s2,a3

0000d7a8 <.LVL121>:
    d7a8:	01243433          	sltu	s0,s0,s2

0000d7ac <.LVL122>:
    d7ac:	013709b3          	add	s3,a4,s3

0000d7b0 <.LVL123>:
    d7b0:	0086e6b3          	or	a3,a3,s0

0000d7b4 <.LVL124>:
    d7b4:	00d986b3          	add	a3,s3,a3
    d7b8:	02d12c23          	sw	a3,56(sp)

0000d7bc <.LVL125>:
    d7bc:	00e9b7b3          	sltu	a5,s3,a4

0000d7c0 <.LVL126>:
    d7c0:	0136b6b3          	sltu	a3,a3,s3

0000d7c4 <.LVL127>:
    d7c4:	00d7e7b3          	or	a5,a5,a3

0000d7c8 <.LVL128>:
    d7c8:	016888b3          	add	a7,a7,s6
    d7cc:	011787b3          	add	a5,a5,a7
    d7d0:	bb9ff06f          	j	d388 <.L355>

0000d7d4 <.L51>:
    d7d4:	000087b7          	lui	a5,0x8
    d7d8:	fff78793          	add	a5,a5,-1 # 7fff <.L4+0xf>
    d7dc:	62f81ae3          	bne	a6,a5,e610 <.L62>

0000d7e0 <.L63>:
    d7e0:	02812823          	sw	s0,48(sp)

0000d7e4 <.L364>:
    d7e4:	03212a23          	sw	s2,52(sp)
    d7e8:	03312c23          	sw	s3,56(sp)
    d7ec:	03612e23          	sw	s6,60(sp)

0000d7f0 <.L359>:
    d7f0:	000084b7          	lui	s1,0x8

0000d7f4 <.LVL132>:
    d7f4:	fff48493          	add	s1,s1,-1 # 7fff <.L4+0xf>
    d7f8:	bcdff06f          	j	d3c4 <.L10>

0000d7fc <.L274>:
    d7fc:	00078413          	mv	s0,a5
    d800:	fe1ff06f          	j	d7e0 <.L63>

0000d804 <.L49>:
    d804:	000087b7          	lui	a5,0x8
    d808:	fff78793          	add	a5,a5,-1 # 7fff <.L4+0xf>
    d80c:	fcfb8ae3          	beq	s7,a5,d7e0 <.L63>
    d810:	01c12783          	lw	a5,28(sp)
    d814:	00080737          	lui	a4,0x80
    d818:	00e7e7b3          	or	a5,a5,a4
    d81c:	00f12e23          	sw	a5,28(sp)

0000d820 <.LDL2>:
    d820:	07400793          	li	a5,116
    d824:	5f07cae3          	blt	a5,a6,e618 <.L64>
    d828:	00080593          	mv	a1,a6

0000d82c <.L268>:
    d82c:	02000713          	li	a4,32
    d830:	02e5c733          	div	a4,a1,a4

0000d834 <.LVL136>:
    d834:	00060693          	mv	a3,a2
    d838:	00000493          	li	s1,0

0000d83c <.LVL137>:
    d83c:	00000793          	li	a5,0

0000d840 <.L65>:
    d840:	02e7ce63          	blt	a5,a4,d87c <.L66>
    d844:	00300793          	li	a5,3

0000d848 <.LVL139>:
    d848:	01f5f893          	and	a7,a1,31
    d84c:	40e787b3          	sub	a5,a5,a4
    d850:	00271813          	sll	a6,a4,0x2
    d854:	02089e63          	bnez	a7,d890 <.L67>

0000d858 <.L68>:
    d858:	010606b3          	add	a3,a2,a6
    d85c:	0006a683          	lw	a3,0(a3)
    d860:	00188893          	add	a7,a7,1

0000d864 <.LVL141>:
    d864:	00460613          	add	a2,a2,4
    d868:	fed62e23          	sw	a3,-4(a2)

0000d86c <.LVL142>:
    d86c:	ff17d6e3          	bge	a5,a7,d858 <.L68>
    d870:	00400793          	li	a5,4
    d874:	40e78733          	sub	a4,a5,a4

0000d878 <.LVL143>:
    d878:	0780006f          	j	d8f0 <.L73>

0000d87c <.L66>:
    d87c:	0006a803          	lw	a6,0(a3)
    d880:	00178793          	add	a5,a5,1

0000d884 <.LVL145>:
    d884:	00468693          	add	a3,a3,4
    d888:	0104e4b3          	or	s1,s1,a6

0000d88c <.LVL146>:
    d88c:	fb5ff06f          	j	d840 <.L65>

0000d890 <.L67>:
    d890:	02000693          	li	a3,32
    d894:	02d5e5b3          	rem	a1,a1,a3

0000d898 <.LVL148>:
    d898:	40b685b3          	sub	a1,a3,a1
    d89c:	00070693          	mv	a3,a4
    d8a0:	00075463          	bgez	a4,d8a8 <.L70>

0000d8a4 <.LVL149>:
    d8a4:	00000693          	li	a3,0

0000d8a8 <.L70>:
    d8a8:	00269693          	sll	a3,a3,0x2
    d8ac:	04068693          	add	a3,a3,64
    d8b0:	002686b3          	add	a3,a3,sp
    d8b4:	fd06a683          	lw	a3,-48(a3)
    d8b8:	00000313          	li	t1,0
    d8bc:	00b696b3          	sll	a3,a3,a1
    d8c0:	00d4e4b3          	or	s1,s1,a3

0000d8c4 <.LVL151>:
    d8c4:	010506b3          	add	a3,a0,a6
    d8c8:	41000833          	neg	a6,a6

0000d8cc <.L71>:
    d8cc:	0af34a63          	blt	t1,a5,d980 <.L72>
    d8d0:	00400693          	li	a3,4
    d8d4:	40e68733          	sub	a4,a3,a4

0000d8d8 <.LVL153>:
    d8d8:	01c12683          	lw	a3,28(sp)
    d8dc:	00279793          	sll	a5,a5,0x2

0000d8e0 <.LVL154>:
    d8e0:	04078793          	add	a5,a5,64
    d8e4:	002787b3          	add	a5,a5,sp
    d8e8:	0116d6b3          	srl	a3,a3,a7
    d8ec:	fcd7a823          	sw	a3,-48(a5)

0000d8f0 <.L73>:
    d8f0:	00572793          	slti	a5,a4,5
    d8f4:	00000613          	li	a2,0
    d8f8:	00078863          	beqz	a5,d908 <.L75>
    d8fc:	00400613          	li	a2,4
    d900:	40e60633          	sub	a2,a2,a4
    d904:	00261613          	sll	a2,a2,0x2

0000d908 <.L75>:
    d908:	00271713          	sll	a4,a4,0x2
    d90c:	00e50533          	add	a0,a0,a4
    d910:	00000593          	li	a1,0
    d914:	c84f50ef          	jal	2d98 <__GI_memset>

0000d918 <.LBE33>:
    d918:	01012703          	lw	a4,16(sp)

0000d91c <.LBB34>:
    d91c:	009037b3          	snez	a5,s1

0000d920 <.LBE34>:
    d920:	00e7e7b3          	or	a5,a5,a4

0000d924 <.L76>:
    d924:	01412683          	lw	a3,20(sp)

0000d928 <.LBB36>:
    d928:	00f12823          	sw	a5,16(sp)

0000d92c <.LBB37>:
    d92c:	00f407b3          	add	a5,s0,a5
    d930:	01268933          	add	s2,a3,s2
    d934:	02f12823          	sw	a5,48(sp)

0000d938 <.LVL158>:
    d938:	0087b7b3          	sltu	a5,a5,s0

0000d93c <.LVL159>:
    d93c:	00f90733          	add	a4,s2,a5
    d940:	01812783          	lw	a5,24(sp)

0000d944 <.LVL160>:
    d944:	02e12a23          	sw	a4,52(sp)

0000d948 <.LVL161>:
    d948:	00d936b3          	sltu	a3,s2,a3

0000d94c <.LVL162>:
    d94c:	01273733          	sltu	a4,a4,s2

0000d950 <.LVL163>:
    d950:	013789b3          	add	s3,a5,s3

0000d954 <.LVL164>:
    d954:	00e6e733          	or	a4,a3,a4

0000d958 <.LVL165>:
    d958:	00e98733          	add	a4,s3,a4
    d95c:	02e12c23          	sw	a4,56(sp)

0000d960 <.LVL166>:
    d960:	00f9b7b3          	sltu	a5,s3,a5

0000d964 <.LVL167>:
    d964:	01373733          	sltu	a4,a4,s3

0000d968 <.LVL168>:
    d968:	00e7e7b3          	or	a5,a5,a4

0000d96c <.LVL169>:
    d96c:	01c12703          	lw	a4,28(sp)

0000d970 <.LBE37>:
    d970:	000b8493          	mv	s1,s7

0000d974 <.LBB38>:
    d974:	00eb0733          	add	a4,s6,a4
    d978:	00e787b3          	add	a5,a5,a4

0000d97c <.LBE38>:
    d97c:	d0dff06f          	j	d688 <.L22>

0000d980 <.L72>:
    d980:	0006a603          	lw	a2,0(a3)
    d984:	0046ae03          	lw	t3,4(a3)
    d988:	01068eb3          	add	t4,a3,a6
    d98c:	01165633          	srl	a2,a2,a7
    d990:	00be1e33          	sll	t3,t3,a1
    d994:	01c66633          	or	a2,a2,t3
    d998:	00cea023          	sw	a2,0(t4)

0000d99c <.LVL172>:
    d99c:	00130313          	add	t1,t1,1

0000d9a0 <.LVL173>:
    d9a0:	00468693          	add	a3,a3,4
    d9a4:	f29ff06f          	j	d8cc <.L71>

0000d9a8 <.L48>:
    d9a8:	00148813          	add	a6,s1,1
    d9ac:	01181893          	sll	a7,a6,0x11
    d9b0:	0128d893          	srl	a7,a7,0x12
    d9b4:	01412683          	lw	a3,20(sp)
    d9b8:	01812703          	lw	a4,24(sp)
    d9bc:	01c12603          	lw	a2,28(sp)
    d9c0:	03010593          	add	a1,sp,48
    d9c4:	03c10513          	add	a0,sp,60
    d9c8:	10089e63          	bnez	a7,dae4 <.L87>
    d9cc:	00e6e833          	or	a6,a3,a4
    d9d0:	00c86833          	or	a6,a6,a2
    d9d4:	00f86833          	or	a6,a6,a5
    d9d8:	0a049863          	bnez	s1,da88 <.L88>

0000d9dc <.LVL175>:
    d9dc:	00081e63          	bnez	a6,d9f8 <.L89>
    d9e0:	02812823          	sw	s0,48(sp)
    d9e4:	03212a23          	sw	s2,52(sp)
    d9e8:	03312c23          	sw	s3,56(sp)
    d9ec:	03612e23          	sw	s6,60(sp)

0000d9f0 <.L357>:
    d9f0:	00000493          	li	s1,0
    d9f4:	9d1ff06f          	j	d3c4 <.L10>

0000d9f8 <.L89>:
    d9f8:	013965b3          	or	a1,s2,s3
    d9fc:	0165e5b3          	or	a1,a1,s6
    da00:	0085e5b3          	or	a1,a1,s0
    da04:	00059c63          	bnez	a1,da1c <.L90>
    da08:	02f12823          	sw	a5,48(sp)
    da0c:	02d12a23          	sw	a3,52(sp)
    da10:	02e12c23          	sw	a4,56(sp)
    da14:	02c12e23          	sw	a2,60(sp)

0000da18 <.LBB123>:
  FP_PACK_SEMIRAW_Q (r, R);
    da18:	9adff06f          	j	d3c4 <.L10>

0000da1c <.L90>:
  FP_SUB_Q (R, A, B);
    da1c:	00878433          	add	s0,a5,s0
    da20:	01268933          	add	s2,a3,s2
    da24:	02812823          	sw	s0,48(sp)

0000da28 <.LVL180>:
    da28:	00f43433          	sltu	s0,s0,a5

0000da2c <.LVL181>:
    da2c:	00890433          	add	s0,s2,s0

0000da30 <.LVL182>:
    da30:	02812a23          	sw	s0,52(sp)

0000da34 <.LVL183>:
    da34:	00d936b3          	sltu	a3,s2,a3

0000da38 <.LVL184>:
    da38:	01243433          	sltu	s0,s0,s2

0000da3c <.LVL185>:
    da3c:	013709b3          	add	s3,a4,s3

0000da40 <.LVL186>:
    da40:	0086e6b3          	or	a3,a3,s0

0000da44 <.LVL187>:
    da44:	00d986b3          	add	a3,s3,a3
    da48:	02d12c23          	sw	a3,56(sp)

0000da4c <.LVL188>:
    da4c:	00e9b733          	sltu	a4,s3,a4

0000da50 <.LVL189>:
    da50:	0136b6b3          	sltu	a3,a3,s3

0000da54 <.LVL190>:
    da54:	00d76733          	or	a4,a4,a3

0000da58 <.LVL191>:
    da58:	01660633          	add	a2,a2,s6
    da5c:	00c70733          	add	a4,a4,a2

0000da60 <.LBE40>:
    da60:	00c71793          	sll	a5,a4,0xc

0000da64 <.LVL192>:
    da64:	0007c663          	bltz	a5,da70 <.L101>

0000da68 <.LBB41>:
    da68:	02e12e23          	sw	a4,60(sp)
    da6c:	959ff06f          	j	d3c4 <.L10>

0000da70 <.L101>:
    da70:	fff807b7          	lui	a5,0xfff80
    da74:	fff78793          	add	a5,a5,-1 # fff7ffff <_ebss+0xfff69f4f>
    da78:	00f77733          	and	a4,a4,a5
    da7c:	02e12e23          	sw	a4,60(sp)

0000da80 <.LBB126>:
    da80:	00100493          	li	s1,1

0000da84 <.LVL194>:
    da84:	941ff06f          	j	d3c4 <.L10>

0000da88 <.L88>:
    da88:	1a080463          	beqz	a6,dc30 <.L271>
    da8c:	01396933          	or	s2,s2,s3
    da90:	01696933          	or	s2,s2,s6
    da94:	00896933          	or	s2,s2,s0
    da98:	1a090063          	beqz	s2,dc38 <.L272>

0000da9c <.LBB129>:
    da9c:	000087b7          	lui	a5,0x8
    daa0:	02f12e23          	sw	a5,60(sp)
    daa4:	02012c23          	sw	zero,56(sp)
    daa8:	02012a23          	sw	zero,52(sp)
    daac:	02012823          	sw	zero,48(sp)

0000dab0 <.LBB42>:
    dab0:	00050793          	mv	a5,a0

0000dab4 <.L102>:
    dab4:	0007a703          	lw	a4,0(a5) # 8000 <.L4+0x10>
    dab8:	ffc7a683          	lw	a3,-4(a5)
    dabc:	ffc78793          	add	a5,a5,-4
    dac0:	00371713          	sll	a4,a4,0x3
    dac4:	01d6d693          	srl	a3,a3,0x1d
    dac8:	00d76733          	or	a4,a4,a3
    dacc:	00e7a223          	sw	a4,4(a5)
    dad0:	fef592e3          	bne	a1,a5,dab4 <.L102>

0000dad4 <.L213>:
    dad4:	000084b7          	lui	s1,0x8

0000dad8 <.LVL200>:
    dad8:	fff48493          	add	s1,s1,-1 # 7fff <.L4+0xf>

0000dadc <.L358>:
    dadc:	00000a93          	li	s5,0
    dae0:	8e5ff06f          	j	d3c4 <.L10>

0000dae4 <.L87>:
    dae4:	00878433          	add	s0,a5,s0
    dae8:	01268933          	add	s2,a3,s2
    daec:	02812823          	sw	s0,48(sp)

0000daf0 <.LVL203>:
    daf0:	00f43433          	sltu	s0,s0,a5

0000daf4 <.LVL204>:
    daf4:	00890433          	add	s0,s2,s0

0000daf8 <.LVL205>:
    daf8:	02812a23          	sw	s0,52(sp)

0000dafc <.LVL206>:
    dafc:	00d936b3          	sltu	a3,s2,a3

0000db00 <.LVL207>:
    db00:	01243433          	sltu	s0,s0,s2

0000db04 <.LVL208>:
    db04:	013709b3          	add	s3,a4,s3

0000db08 <.LVL209>:
    db08:	0086e6b3          	or	a3,a3,s0

0000db0c <.LVL210>:
    db0c:	00d986b3          	add	a3,s3,a3
    db10:	02d12c23          	sw	a3,56(sp)

0000db14 <.LVL211>:
    db14:	00e9b733          	sltu	a4,s3,a4

0000db18 <.LVL212>:
    db18:	0136b6b3          	sltu	a3,a3,s3

0000db1c <.LVL213>:
    db1c:	00d76733          	or	a4,a4,a3

0000db20 <.LVL214>:
    db20:	01660633          	add	a2,a2,s6
    db24:	00c70733          	add	a4,a4,a2
    db28:	02e12e23          	sw	a4,60(sp)

0000db2c <.LBB44>:
    db2c:	00058793          	mv	a5,a1

0000db30 <.L113>:
    db30:	0007a683          	lw	a3,0(a5)
    db34:	0047a603          	lw	a2,4(a5)
    db38:	00478793          	add	a5,a5,4
    db3c:	0016d693          	srl	a3,a3,0x1
    db40:	01f61613          	sll	a2,a2,0x1f
    db44:	00c6e6b3          	or	a3,a3,a2
    db48:	fed7ae23          	sw	a3,-4(a5)
    db4c:	fef512e3          	bne	a0,a5,db30 <.L113>

0000db50 <.LBE44>:
    db50:	000087b7          	lui	a5,0x8
    db54:	fff78793          	add	a5,a5,-1 # 7fff <.L4+0xf>
    db58:	00f80863          	beq	a6,a5,db68 <.L114>

0000db5c <.LBB47>:
    db5c:	00175713          	srl	a4,a4,0x1
    db60:	02e12e23          	sw	a4,60(sp)
    db64:	c19ff06f          	j	d77c <.L360>

0000db68 <.L114>:
    db68:	02012e23          	sw	zero,60(sp)
    db6c:	02012c23          	sw	zero,56(sp)
    db70:	02012a23          	sw	zero,52(sp)
    db74:	02012823          	sw	zero,48(sp)
    db78:	c05ff06f          	j	d77c <.L360>

0000db7c <.L6>:
    db7c:	29105c63          	blez	a7,de14 <.L118>

0000db80 <.LBB133>:
    db80:	01412903          	lw	s2,20(sp)

0000db84 <.LVL221>:
    db84:	01812983          	lw	s3,24(sp)
    db88:	01c12b03          	lw	s6,28(sp)

0000db8c <.LBB134>:
    db8c:	0a0b9e63          	bnez	s7,dc48 <.L119>
    db90:	02412e03          	lw	t3,36(sp)
    db94:	02812503          	lw	a0,40(sp)
    db98:	02c12683          	lw	a3,44(sp)
    db9c:	00ae6733          	or	a4,t3,a0
    dba0:	00d76733          	or	a4,a4,a3
    dba4:	00876733          	or	a4,a4,s0
    dba8:	f6070e63          	beqz	a4,d324 <.L363>
    dbac:	fff88e93          	add	t4,a7,-1

0000dbb0 <.LVL222>:
    dbb0:	040e9c63          	bnez	t4,dc08 <.L121>

0000dbb4 <.LBB61>:
    dbb4:	40878733          	sub	a4,a5,s0

0000dbb8 <.LVL224>:
    dbb8:	41c90633          	sub	a2,s2,t3

0000dbbc <.LVL225>:
    dbbc:	00e7b5b3          	sltu	a1,a5,a4
    dbc0:	00c93833          	sltu	a6,s2,a2

0000dbc4 <.LVL226>:
    dbc4:	40b60633          	sub	a2,a2,a1

0000dbc8 <.LVL227>:
    dbc8:	00000593          	li	a1,0
    dbcc:	00e7f663          	bgeu	a5,a4,dbd8 <.L126>
    dbd0:	412e0e33          	sub	t3,t3,s2
    dbd4:	001e3593          	seqz	a1,t3

0000dbd8 <.L126>:
    dbd8:	0105e7b3          	or	a5,a1,a6

0000dbdc <.LVL228>:
    dbdc:	40a985b3          	sub	a1,s3,a0

0000dbe0 <.LVL229>:
    dbe0:	00b9b833          	sltu	a6,s3,a1

0000dbe4 <.LVL230>:
    dbe4:	40f585b3          	sub	a1,a1,a5

0000dbe8 <.LVL231>:
    dbe8:	00078663          	beqz	a5,dbf4 <.L129>
    dbec:	41350533          	sub	a0,a0,s3
    dbf0:	00153e93          	seqz	t4,a0

0000dbf4 <.L129>:
    dbf4:	40db07b3          	sub	a5,s6,a3

0000dbf8 <.LVL233>:
    dbf8:	010ee6b3          	or	a3,t4,a6

0000dbfc <.LVL234>:
    dbfc:	40d787b3          	sub	a5,a5,a3

0000dc00 <.L356>:
    dc00:	00100493          	li	s1,1

0000dc04 <.LVL236>:
    dc04:	1bc0006f          	j	ddc0 <.L130>

0000dc08 <.L121>:
    dc08:	00008737          	lui	a4,0x8
    dc0c:	fff70713          	add	a4,a4,-1 # 7fff <.L4+0xf>
    dc10:	f8e88863          	beq	a7,a4,d3a0 <.L23>
    dc14:	07400713          	li	a4,116
    dc18:	05d75c63          	bge	a4,t4,dc70 <.L269>

0000dc1c <.L132>:
    dc1c:	02012623          	sw	zero,44(sp)
    dc20:	02012423          	sw	zero,40(sp)
    dc24:	02012223          	sw	zero,36(sp)
    dc28:	00100713          	li	a4,1
    dc2c:	1340006f          	j	dd60 <.L143>

0000dc30 <.L271>:
    dc30:	00040793          	mv	a5,s0
    dc34:	f6cff06f          	j	d3a0 <.L23>

0000dc38 <.L272>:
    dc38:	00068913          	mv	s2,a3
    dc3c:	00070993          	mv	s3,a4
    dc40:	00060b13          	mv	s6,a2
    dc44:	f5cff06f          	j	d3a0 <.L23>

0000dc48 <.L119>:
    dc48:	00008737          	lui	a4,0x8
    dc4c:	fff70713          	add	a4,a4,-1 # 7fff <.L4+0xf>
    dc50:	bae486e3          	beq	s1,a4,d7fc <.L274>
    dc54:	02c12703          	lw	a4,44(sp)
    dc58:	000806b7          	lui	a3,0x80
    dc5c:	00d76733          	or	a4,a4,a3
    dc60:	02e12623          	sw	a4,44(sp)

0000dc64 <.LDL3>:
    dc64:	07400713          	li	a4,116
    dc68:	fb174ae3          	blt	a4,a7,dc1c <.L132>
    dc6c:	00088e93          	mv	t4,a7

0000dc70 <.L269>:
    dc70:	405ed693          	sra	a3,t4,0x5

0000dc74 <.LVL242>:
    dc74:	00030593          	mv	a1,t1
    dc78:	01fefe93          	and	t4,t4,31

0000dc7c <.LVL243>:
    dc7c:	00000713          	li	a4,0
    dc80:	00000613          	li	a2,0

0000dc84 <.L133>:
    dc84:	02d61c63          	bne	a2,a3,dcbc <.L134>
    dc88:	00300613          	li	a2,3

0000dc8c <.LVL245>:
    dc8c:	40d60633          	sub	a2,a2,a3
    dc90:	00269593          	sll	a1,a3,0x2
    dc94:	020e9e63          	bnez	t4,dcd0 <.L135>

0000dc98 <.L136>:
    dc98:	00b30533          	add	a0,t1,a1
    dc9c:	00052503          	lw	a0,0(a0)
    dca0:	001e8e93          	add	t4,t4,1

0000dca4 <.LVL247>:
    dca4:	00430313          	add	t1,t1,4
    dca8:	fea32e23          	sw	a0,-4(t1)

0000dcac <.LVL248>:
    dcac:	ffd656e3          	bge	a2,t4,dc98 <.L136>
    dcb0:	00400613          	li	a2,4
    dcb4:	40d606b3          	sub	a3,a2,a3

0000dcb8 <.LVL249>:
    dcb8:	0640006f          	j	dd1c <.L140>

0000dcbc <.L134>:
    dcbc:	0005a503          	lw	a0,0(a1)
    dcc0:	00160613          	add	a2,a2,1

0000dcc4 <.LVL251>:
    dcc4:	00458593          	add	a1,a1,4
    dcc8:	00a76733          	or	a4,a4,a0

0000dccc <.LVL252>:
    dccc:	fb9ff06f          	j	dc84 <.L133>

0000dcd0 <.L135>:
    dcd0:	04058513          	add	a0,a1,64
    dcd4:	00250533          	add	a0,a0,sp
    dcd8:	fe052503          	lw	a0,-32(a0)
    dcdc:	02000313          	li	t1,32
    dce0:	41d30333          	sub	t1,t1,t4
    dce4:	00651533          	sll	a0,a0,t1
    dce8:	00a76733          	or	a4,a4,a0

0000dcec <.LVL254>:
    dcec:	00000e13          	li	t3,0
    dcf0:	00b80533          	add	a0,a6,a1
    dcf4:	40b005b3          	neg	a1,a1

0000dcf8 <.L138>:
    dcf8:	0ece4a63          	blt	t3,a2,ddec <.L139>
    dcfc:	00400593          	li	a1,4
    dd00:	40d586b3          	sub	a3,a1,a3

0000dd04 <.LVL256>:
    dd04:	02c12583          	lw	a1,44(sp)
    dd08:	00261613          	sll	a2,a2,0x2

0000dd0c <.LVL257>:
    dd0c:	04060613          	add	a2,a2,64
    dd10:	00260633          	add	a2,a2,sp
    dd14:	01d5d5b3          	srl	a1,a1,t4
    dd18:	feb62023          	sw	a1,-32(a2)

0000dd1c <.L140>:
    dd1c:	00400613          	li	a2,4
    dd20:	40d60633          	sub	a2,a2,a3
    dd24:	00261613          	sll	a2,a2,0x2
    dd28:	00269693          	sll	a3,a3,0x2
    dd2c:	00800593          	li	a1,8
    dd30:	00d806b3          	add	a3,a6,a3
    dd34:	00b66a63          	bltu	a2,a1,dd48 <.L141>
    dd38:	0006a023          	sw	zero,0(a3) # 80000 <_ebss+0x69f50>
    dd3c:	0006a223          	sw	zero,4(a3)
    dd40:	ff860613          	add	a2,a2,-8
    dd44:	00868693          	add	a3,a3,8

0000dd48 <.L141>:
    dd48:	00400593          	li	a1,4
    dd4c:	00b66463          	bltu	a2,a1,dd54 <.L142>
    dd50:	0006a023          	sw	zero,0(a3)

0000dd54 <.L142>:
    dd54:	02012683          	lw	a3,32(sp)

0000dd58 <.LBB64>:
    dd58:	00e03733          	snez	a4,a4

0000dd5c <.LBE64>:
    dd5c:	00d76733          	or	a4,a4,a3

0000dd60 <.L143>:
    dd60:	02412583          	lw	a1,36(sp)

0000dd64 <.LBB67>:
    dd64:	02e12023          	sw	a4,32(sp)

0000dd68 <.LBB68>:
    dd68:	40e78733          	sub	a4,a5,a4

0000dd6c <.LVL263>:
    dd6c:	40b90633          	sub	a2,s2,a1

0000dd70 <.LVL264>:
    dd70:	00e7b6b3          	sltu	a3,a5,a4
    dd74:	00c93533          	sltu	a0,s2,a2

0000dd78 <.LVL265>:
    dd78:	40d60633          	sub	a2,a2,a3

0000dd7c <.LVL266>:
    dd7c:	00000693          	li	a3,0
    dd80:	00e7f663          	bgeu	a5,a4,dd8c <.L148>
    dd84:	412585b3          	sub	a1,a1,s2
    dd88:	0015b693          	seqz	a3,a1

0000dd8c <.L148>:
    dd8c:	00a6e7b3          	or	a5,a3,a0

0000dd90 <.LVL267>:
    dd90:	02812503          	lw	a0,40(sp)
    dd94:	00000693          	li	a3,0
    dd98:	40a985b3          	sub	a1,s3,a0

0000dd9c <.LVL268>:
    dd9c:	00b9b833          	sltu	a6,s3,a1

0000dda0 <.LVL269>:
    dda0:	40f585b3          	sub	a1,a1,a5

0000dda4 <.LVL270>:
    dda4:	00078663          	beqz	a5,ddb0 <.L151>
    dda8:	41350533          	sub	a0,a0,s3
    ddac:	00153693          	seqz	a3,a0

0000ddb0 <.L151>:
    ddb0:	02c12783          	lw	a5,44(sp)

0000ddb4 <.LVL272>:
    ddb4:	0106e6b3          	or	a3,a3,a6

0000ddb8 <.LVL273>:
    ddb8:	40fb07b3          	sub	a5,s6,a5
    ddbc:	40d787b3          	sub	a5,a5,a3

0000ddc0 <.L130>:
    ddc0:	02e12823          	sw	a4,48(sp)

0000ddc4 <.LBB70>:
    ddc4:	02f12e23          	sw	a5,60(sp)
    ddc8:	02b12c23          	sw	a1,56(sp)
    ddcc:	02c12a23          	sw	a2,52(sp)

0000ddd0 <.LBE70>:
    ddd0:	00c79713          	sll	a4,a5,0xc
    ddd4:	de075863          	bgez	a4,d3c4 <.L10>

0000ddd8 <.LBB71>:
    ddd8:	00080737          	lui	a4,0x80
    dddc:	fff70713          	add	a4,a4,-1 # 7ffff <_ebss+0x69f4f>
    dde0:	00e7f7b3          	and	a5,a5,a4
    dde4:	02f12e23          	sw	a5,60(sp)
    dde8:	5740006f          	j	e35c <.L233>

0000ddec <.L139>:
    ddec:	00052883          	lw	a7,0(a0)
    ddf0:	00452f03          	lw	t5,4(a0)
    ddf4:	00b50fb3          	add	t6,a0,a1
    ddf8:	01d8d8b3          	srl	a7,a7,t4
    ddfc:	006f1f33          	sll	t5,t5,t1
    de00:	01e8e8b3          	or	a7,a7,t5
    de04:	011fa023          	sw	a7,0(t6)

0000de08 <.LVL277>:
    de08:	001e0e13          	add	t3,t3,1

0000de0c <.LVL278>:
    de0c:	00450513          	add	a0,a0,4
    de10:	ee9ff06f          	j	dcf8 <.L138>

0000de14 <.L118>:
    de14:	02412983          	lw	s3,36(sp)
    de18:	02812c03          	lw	s8,40(sp)
    de1c:	02c12b03          	lw	s6,44(sp)

0000de20 <.LBB137>:
    de20:	28088463          	beqz	a7,e0a8 <.L152>
    de24:	409b8333          	sub	t1,s7,s1

0000de28 <.LVL280>:
    de28:	0a049e63          	bnez	s1,dee4 <.L153>
    de2c:	01412583          	lw	a1,20(sp)
    de30:	01812803          	lw	a6,24(sp)
    de34:	01c12683          	lw	a3,28(sp)
    de38:	0105e8b3          	or	a7,a1,a6
    de3c:	00d8e8b3          	or	a7,a7,a3
    de40:	00f8e8b3          	or	a7,a7,a5
    de44:	02089063          	bnez	a7,de64 <.L154>

0000de48 <.LVL281>:
    de48:	02812823          	sw	s0,48(sp)
    de4c:	03312a23          	sw	s3,52(sp)
    de50:	03812c23          	sw	s8,56(sp)
    de54:	03612e23          	sw	s6,60(sp)

0000de58 <.LBB138>:
    de58:	00030493          	mv	s1,t1

0000de5c <.L361>:
    de5c:	00090a93          	mv	s5,s2

0000de60 <.LVL284>:
    de60:	d64ff06f          	j	d3c4 <.L10>

0000de64 <.L154>:
    de64:	fff30893          	add	a7,t1,-1

0000de68 <.LVL286>:
    de68:	04089c63          	bnez	a7,dec0 <.L155>

0000de6c <.LBB73>:
    de6c:	40f40733          	sub	a4,s0,a5

0000de70 <.LVL288>:
    de70:	40b98633          	sub	a2,s3,a1

0000de74 <.LVL289>:
    de74:	00e437b3          	sltu	a5,s0,a4
    de78:	00c9b533          	sltu	a0,s3,a2

0000de7c <.LVL290>:
    de7c:	40f60633          	sub	a2,a2,a5

0000de80 <.LVL291>:
    de80:	00000793          	li	a5,0
    de84:	00e47663          	bgeu	s0,a4,de90 <.L160>
    de88:	413585b3          	sub	a1,a1,s3
    de8c:	0015b793          	seqz	a5,a1

0000de90 <.L160>:
    de90:	00a7e7b3          	or	a5,a5,a0

0000de94 <.LVL292>:
    de94:	410c05b3          	sub	a1,s8,a6

0000de98 <.LVL293>:
    de98:	00bc3533          	sltu	a0,s8,a1

0000de9c <.LVL294>:
    de9c:	40f585b3          	sub	a1,a1,a5

0000dea0 <.LVL295>:
    dea0:	00078663          	beqz	a5,deac <.L163>
    dea4:	41880833          	sub	a6,a6,s8
    dea8:	00183893          	seqz	a7,a6

0000deac <.L163>:
    deac:	40db07b3          	sub	a5,s6,a3

0000deb0 <.LVL297>:
    deb0:	00a8e6b3          	or	a3,a7,a0

0000deb4 <.LVL298>:
    deb4:	40d787b3          	sub	a5,a5,a3

0000deb8 <.LBE73>:
    deb8:	00090a93          	mv	s5,s2

0000debc <.LVL299>:
    debc:	d45ff06f          	j	dc00 <.L356>

0000dec0 <.L155>:
    dec0:	000087b7          	lui	a5,0x8
    dec4:	fff78793          	add	a5,a5,-1 # 7fff <.L4+0xf>
    dec8:	76f31263          	bne	t1,a5,e62c <.L164>

0000decc <.L165>:
    decc:	02812823          	sw	s0,48(sp)
    ded0:	03312a23          	sw	s3,52(sp)
    ded4:	03812c23          	sw	s8,56(sp)
    ded8:	03612e23          	sw	s6,60(sp)
    dedc:	00090a93          	mv	s5,s2

0000dee0 <.LVL302>:
    dee0:	911ff06f          	j	d7f0 <.L359>

0000dee4 <.L153>:
    dee4:	000087b7          	lui	a5,0x8
    dee8:	fff78793          	add	a5,a5,-1 # 7fff <.L4+0xf>
    deec:	fefb80e3          	beq	s7,a5,decc <.L165>
    def0:	01c12783          	lw	a5,28(sp)
    def4:	00080737          	lui	a4,0x80
    def8:	00e7e7b3          	or	a5,a5,a4
    defc:	00f12e23          	sw	a5,28(sp)

0000df00 <.LDL4>:
    df00:	07400793          	li	a5,116
    df04:	1867c863          	blt	a5,t1,e094 <.L166>

0000df08 <.L270>:
    df08:	02000793          	li	a5,32
    df0c:	02f347b3          	div	a5,t1,a5

0000df10 <.LVL304>:
    df10:	00060693          	mv	a3,a2
    df14:	00000493          	li	s1,0

0000df18 <.LVL305>:
    df18:	00000713          	li	a4,0

0000df1c <.L167>:
    df1c:	02f74e63          	blt	a4,a5,df58 <.L168>
    df20:	00300713          	li	a4,3

0000df24 <.LVL307>:
    df24:	01f37893          	and	a7,t1,31
    df28:	40f70e33          	sub	t3,a4,a5
    df2c:	00279593          	sll	a1,a5,0x2
    df30:	02089e63          	bnez	a7,df6c <.L169>

0000df34 <.L170>:
    df34:	00b60733          	add	a4,a2,a1
    df38:	00072703          	lw	a4,0(a4) # 80000 <_ebss+0x69f50>
    df3c:	00188893          	add	a7,a7,1

0000df40 <.LVL309>:
    df40:	00460613          	add	a2,a2,4
    df44:	fee62e23          	sw	a4,-4(a2)

0000df48 <.LVL310>:
    df48:	ff1e56e3          	bge	t3,a7,df34 <.L170>
    df4c:	00400713          	li	a4,4
    df50:	40f707b3          	sub	a5,a4,a5

0000df54 <.LVL311>:
    df54:	0780006f          	j	dfcc <.L175>

0000df58 <.L168>:
    df58:	0006a583          	lw	a1,0(a3)
    df5c:	00170713          	add	a4,a4,1

0000df60 <.LVL313>:
    df60:	00468693          	add	a3,a3,4
    df64:	00b4e4b3          	or	s1,s1,a1

0000df68 <.LVL314>:
    df68:	fb5ff06f          	j	df1c <.L167>

0000df6c <.L169>:
    df6c:	02000613          	li	a2,32
    df70:	02c36733          	rem	a4,t1,a2
    df74:	00078693          	mv	a3,a5
    df78:	40e60633          	sub	a2,a2,a4
    df7c:	0007d463          	bgez	a5,df84 <.L172>

0000df80 <.LVL316>:
    df80:	00000693          	li	a3,0

0000df84 <.L172>:
    df84:	00269693          	sll	a3,a3,0x2
    df88:	04068713          	add	a4,a3,64
    df8c:	002706b3          	add	a3,a4,sp
    df90:	fd06a703          	lw	a4,-48(a3)
    df94:	00b506b3          	add	a3,a0,a1
    df98:	40b005b3          	neg	a1,a1
    df9c:	00c71733          	sll	a4,a4,a2
    dfa0:	00e4e4b3          	or	s1,s1,a4

0000dfa4 <.LVL318>:
    dfa4:	00000713          	li	a4,0

0000dfa8 <.L173>:
    dfa8:	0dc74263          	blt	a4,t3,e06c <.L174>
    dfac:	01c12683          	lw	a3,28(sp)
    dfb0:	00400713          	li	a4,4

0000dfb4 <.LVL320>:
    dfb4:	40f707b3          	sub	a5,a4,a5

0000dfb8 <.LVL321>:
    dfb8:	002e1713          	sll	a4,t3,0x2
    dfbc:	04070713          	add	a4,a4,64
    dfc0:	00270733          	add	a4,a4,sp
    dfc4:	0116d6b3          	srl	a3,a3,a7
    dfc8:	fcd72823          	sw	a3,-48(a4)

0000dfcc <.L175>:
    dfcc:	0057a713          	slti	a4,a5,5
    dfd0:	00000613          	li	a2,0
    dfd4:	00070863          	beqz	a4,dfe4 <.L177>
    dfd8:	00400613          	li	a2,4
    dfdc:	40f60633          	sub	a2,a2,a5
    dfe0:	00261613          	sll	a2,a2,0x2

0000dfe4 <.L177>:
    dfe4:	00279793          	sll	a5,a5,0x2
    dfe8:	00f50533          	add	a0,a0,a5
    dfec:	00000593          	li	a1,0
    dff0:	da9f40ef          	jal	2d98 <__GI_memset>

0000dff4 <.LBE75>:
    dff4:	01012783          	lw	a5,16(sp)

0000dff8 <.LBB76>:
    dff8:	00903733          	snez	a4,s1

0000dffc <.LBE76>:
    dffc:	00f76733          	or	a4,a4,a5

0000e000 <.L178>:
    e000:	01412683          	lw	a3,20(sp)

0000e004 <.LBB79>:
    e004:	00e12823          	sw	a4,16(sp)

0000e008 <.LBB80>:
    e008:	40e40733          	sub	a4,s0,a4

0000e00c <.LVL326>:
    e00c:	40d98633          	sub	a2,s3,a3

0000e010 <.LVL327>:
    e010:	00e437b3          	sltu	a5,s0,a4
    e014:	00c9b5b3          	sltu	a1,s3,a2

0000e018 <.LVL328>:
    e018:	40f60633          	sub	a2,a2,a5

0000e01c <.LVL329>:
    e01c:	00000793          	li	a5,0
    e020:	00e47663          	bgeu	s0,a4,e02c <.L183>
    e024:	413686b3          	sub	a3,a3,s3
    e028:	0016b793          	seqz	a5,a3

0000e02c <.L183>:
    e02c:	01812503          	lw	a0,24(sp)
    e030:	00b7e7b3          	or	a5,a5,a1

0000e034 <.LVL330>:
    e034:	00000693          	li	a3,0
    e038:	40ac05b3          	sub	a1,s8,a0

0000e03c <.LVL331>:
    e03c:	00bc3833          	sltu	a6,s8,a1

0000e040 <.LVL332>:
    e040:	40f585b3          	sub	a1,a1,a5

0000e044 <.LVL333>:
    e044:	00078663          	beqz	a5,e050 <.L186>
    e048:	41850533          	sub	a0,a0,s8
    e04c:	00153693          	seqz	a3,a0

0000e050 <.L186>:
    e050:	01c12783          	lw	a5,28(sp)

0000e054 <.LVL335>:
    e054:	0106e6b3          	or	a3,a3,a6

0000e058 <.LBE80>:
    e058:	000b8493          	mv	s1,s7

0000e05c <.LBB81>:
    e05c:	40fb07b3          	sub	a5,s6,a5
    e060:	40d787b3          	sub	a5,a5,a3

0000e064 <.LBE81>:
    e064:	00090a93          	mv	s5,s2

0000e068 <.LVL337>:
    e068:	d59ff06f          	j	ddc0 <.L130>

0000e06c <.L174>:
    e06c:	0006a803          	lw	a6,0(a3)
    e070:	0046a303          	lw	t1,4(a3)
    e074:	00b68eb3          	add	t4,a3,a1
    e078:	01185833          	srl	a6,a6,a7
    e07c:	00c31333          	sll	t1,t1,a2
    e080:	00686833          	or	a6,a6,t1
    e084:	010ea023          	sw	a6,0(t4)

0000e088 <.LVL339>:
    e088:	00170713          	add	a4,a4,1

0000e08c <.LVL340>:
    e08c:	00468693          	add	a3,a3,4
    e090:	f19ff06f          	j	dfa8 <.L173>

0000e094 <.L166>:
    e094:	00012e23          	sw	zero,28(sp)
    e098:	00012c23          	sw	zero,24(sp)
    e09c:	00012a23          	sw	zero,20(sp)
    e0a0:	00100713          	li	a4,1
    e0a4:	f5dff06f          	j	e000 <.L178>

0000e0a8 <.L152>:
    e0a8:	00148713          	add	a4,s1,1
    e0ac:	01171513          	sll	a0,a4,0x11
    e0b0:	01255513          	srl	a0,a0,0x12

0000e0b4 <.LBB142>:
    e0b4:	01412683          	lw	a3,20(sp)
    e0b8:	01812603          	lw	a2,24(sp)
    e0bc:	01c12583          	lw	a1,28(sp)

0000e0c0 <.LBB143>:
    e0c0:	00008337          	lui	t1,0x8
    e0c4:	1e051063          	bnez	a0,e2a4 <.L187>
    e0c8:	0189e533          	or	a0,s3,s8
    e0cc:	00c6e833          	or	a6,a3,a2
    e0d0:	01656533          	or	a0,a0,s6
    e0d4:	00b86833          	or	a6,a6,a1
    e0d8:	00856533          	or	a0,a0,s0
    e0dc:	00f86833          	or	a6,a6,a5
    e0e0:	10049863          	bnez	s1,e1f0 <.L188>

0000e0e4 <.LVL343>:
    e0e4:	02081263          	bnez	a6,e108 <.L189>
    e0e8:	02812823          	sw	s0,48(sp)
    e0ec:	03312a23          	sw	s3,52(sp)
    e0f0:	03812c23          	sw	s8,56(sp)
    e0f4:	03612e23          	sw	s6,60(sp)
    e0f8:	00090a93          	mv	s5,s2

0000e0fc <.LVL344>:
    e0fc:	ac051463          	bnez	a0,d3c4 <.L10>

0000e100 <.L209>:
    e100:	00000493          	li	s1,0

0000e104 <.LVL346>:
    e104:	9d9ff06f          	j	dadc <.L358>

0000e108 <.L189>:
    e108:	00051c63          	bnez	a0,e120 <.L190>
    e10c:	02f12823          	sw	a5,48(sp)
    e110:	02d12a23          	sw	a3,52(sp)
    e114:	02c12c23          	sw	a2,56(sp)
    e118:	02b12e23          	sw	a1,60(sp)

0000e11c <.LBB146>:
  FP_PACK_SEMIRAW_Q (r, R);
    e11c:	8d5ff06f          	j	d9f0 <.L357>

0000e120 <.L190>:
  FP_SUB_Q (R, A, B);
    e120:	40878533          	sub	a0,a5,s0

0000e124 <.LVL350>:
    e124:	41368e33          	sub	t3,a3,s3

0000e128 <.LVL351>:
    e128:	00a7b833          	sltu	a6,a5,a0
    e12c:	01c6b8b3          	sltu	a7,a3,t3

0000e130 <.LVL352>:
    e130:	410e0833          	sub	a6,t3,a6

0000e134 <.LVL353>:
    e134:	00000713          	li	a4,0
    e138:	00a7f463          	bgeu	a5,a0,e140 <.L196>
    e13c:	001e3713          	seqz	a4,t3

0000e140 <.L196>:
    e140:	01176733          	or	a4,a4,a7

0000e144 <.LVL354>:
    e144:	418608b3          	sub	a7,a2,s8

0000e148 <.LVL355>:
    e148:	01163f33          	sltu	t5,a2,a7

0000e14c <.LVL356>:
    e14c:	40e88eb3          	sub	t4,a7,a4

0000e150 <.LVL357>:
    e150:	00000313          	li	t1,0
    e154:	00070463          	beqz	a4,e15c <.L199>
    e158:	0018b313          	seqz	t1,a7

0000e15c <.L199>:
    e15c:	01e36333          	or	t1,t1,t5

0000e160 <.LVL359>:
    e160:	41658733          	sub	a4,a1,s6

0000e164 <.LVL360>:
    e164:	40670733          	sub	a4,a4,t1
    e168:	02e12e23          	sw	a4,60(sp)
    e16c:	03d12c23          	sw	t4,56(sp)
    e170:	03012a23          	sw	a6,52(sp)
    e174:	02a12823          	sw	a0,48(sp)

0000e178 <.LBE83>:
    e178:	00c71313          	sll	t1,a4,0xc

0000e17c <.LVL362>:
    e17c:	06035063          	bgez	t1,e1dc <.L200>

0000e180 <.LBB84>:
    e180:	40f407b3          	sub	a5,s0,a5

0000e184 <.LVL363>:
    e184:	40d986b3          	sub	a3,s3,a3

0000e188 <.LVL364>:
    e188:	00f43733          	sltu	a4,s0,a5
    e18c:	00d9b9b3          	sltu	s3,s3,a3

0000e190 <.LVL365>:
    e190:	40e686b3          	sub	a3,a3,a4

0000e194 <.LVL366>:
    e194:	00000713          	li	a4,0
    e198:	00f47463          	bgeu	s0,a5,e1a0 <.L205>
    e19c:	001e3713          	seqz	a4,t3

0000e1a0 <.L205>:
    e1a0:	40cc0633          	sub	a2,s8,a2
    e1a4:	013769b3          	or	s3,a4,s3

0000e1a8 <.LVL367>:
    e1a8:	00cc3c33          	sltu	s8,s8,a2

0000e1ac <.LVL368>:
    e1ac:	00000513          	li	a0,0

0000e1b0 <.LVL369>:
    e1b0:	41360633          	sub	a2,a2,s3

0000e1b4 <.LVL370>:
    e1b4:	00098463          	beqz	s3,e1bc <.L208>
    e1b8:	0018b513          	seqz	a0,a7

0000e1bc <.L208>:
    e1bc:	40bb05b3          	sub	a1,s6,a1
    e1c0:	01856533          	or	a0,a0,s8

0000e1c4 <.LVL372>:
    e1c4:	40a585b3          	sub	a1,a1,a0
    e1c8:	02b12e23          	sw	a1,60(sp)
    e1cc:	02c12c23          	sw	a2,56(sp)
    e1d0:	02d12a23          	sw	a3,52(sp)
    e1d4:	02f12823          	sw	a5,48(sp)

0000e1d8 <.LVL373>:
    e1d8:	c85ff06f          	j	de5c <.L361>

0000e1dc <.L200>:
    e1dc:	01056533          	or	a0,a0,a6

0000e1e0 <.LVL375>:
    e1e0:	01d56533          	or	a0,a0,t4
    e1e4:	00e56533          	or	a0,a0,a4
    e1e8:	f0050ce3          	beqz	a0,e100 <.L209>
    e1ec:	805ff06f          	j	d9f0 <.L357>

0000e1f0 <.L188>:
    e1f0:	03010893          	add	a7,sp,48
    e1f4:	03c10713          	add	a4,sp,60
    e1f8:	04081e63          	bnez	a6,e254 <.L210>
    e1fc:	02051e63          	bnez	a0,e238 <.L211>

0000e200 <.LVL377>:
    e200:	02612e23          	sw	t1,60(sp)
    e204:	02012c23          	sw	zero,56(sp)
    e208:	02012a23          	sw	zero,52(sp)
    e20c:	02012823          	sw	zero,48(sp)

0000e210 <.LBB85>:
    e210:	00070793          	mv	a5,a4

0000e214 <.L212>:
    e214:	0007a703          	lw	a4,0(a5)
    e218:	ffc7a683          	lw	a3,-4(a5)
    e21c:	ffc78793          	add	a5,a5,-4
    e220:	00371713          	sll	a4,a4,0x3
    e224:	01d6d693          	srl	a3,a3,0x1d
    e228:	00d76733          	or	a4,a4,a3
    e22c:	00e7a223          	sw	a4,4(a5)
    e230:	fef892e3          	bne	a7,a5,e214 <.L212>
    e234:	8a1ff06f          	j	dad4 <.L213>

0000e238 <.L211>:
    e238:	02812823          	sw	s0,48(sp)
    e23c:	03312a23          	sw	s3,52(sp)
    e240:	03812c23          	sw	s8,56(sp)
    e244:	03612e23          	sw	s6,60(sp)

0000e248 <.LBB148>:
    e248:	00090a93          	mv	s5,s2

0000e24c <.L362>:
    e24c:	fff30493          	add	s1,t1,-1 # 7fff <.L4+0xf>

0000e250 <.LVL382>:
    e250:	974ff06f          	j	d3c4 <.L10>

0000e254 <.L210>:
    e254:	00051c63          	bnez	a0,e26c <.L214>

0000e258 <.LVL384>:
    e258:	02f12823          	sw	a5,48(sp)
    e25c:	02d12a23          	sw	a3,52(sp)
    e260:	02c12c23          	sw	a2,56(sp)
    e264:	02b12e23          	sw	a1,60(sp)
    e268:	fe5ff06f          	j	e24c <.L362>

0000e26c <.L214>:
    e26c:	02612e23          	sw	t1,60(sp)
    e270:	02012c23          	sw	zero,56(sp)
    e274:	02012a23          	sw	zero,52(sp)
    e278:	02012823          	sw	zero,48(sp)

0000e27c <.LBB86>:
    e27c:	00070793          	mv	a5,a4

0000e280 <.L215>:
    e280:	0007a703          	lw	a4,0(a5)
    e284:	ffc7a683          	lw	a3,-4(a5)
    e288:	ffc78793          	add	a5,a5,-4
    e28c:	00371713          	sll	a4,a4,0x3
    e290:	01d6d693          	srl	a3,a3,0x1d
    e294:	00d76733          	or	a4,a4,a3
    e298:	00e7a223          	sw	a4,4(a5)
    e29c:	fef892e3          	bne	a7,a5,e280 <.L215>
    e2a0:	835ff06f          	j	dad4 <.L213>

0000e2a4 <.L187>:
    e2a4:	40878533          	sub	a0,a5,s0

0000e2a8 <.LVL389>:
    e2a8:	41368eb3          	sub	t4,a3,s3

0000e2ac <.LVL390>:
    e2ac:	00a7b833          	sltu	a6,a5,a0
    e2b0:	01d6b333          	sltu	t1,a3,t4

0000e2b4 <.LVL391>:
    e2b4:	410e8833          	sub	a6,t4,a6

0000e2b8 <.LVL392>:
    e2b8:	00000713          	li	a4,0
    e2bc:	00a7f463          	bgeu	a5,a0,e2c4 <.L220>
    e2c0:	001eb713          	seqz	a4,t4

0000e2c4 <.L220>:
    e2c4:	00676733          	or	a4,a4,t1

0000e2c8 <.LVL393>:
    e2c8:	41860333          	sub	t1,a2,s8

0000e2cc <.LVL394>:
    e2cc:	00663fb3          	sltu	t6,a2,t1

0000e2d0 <.LVL395>:
    e2d0:	40e30f33          	sub	t5,t1,a4

0000e2d4 <.LVL396>:
    e2d4:	00000e13          	li	t3,0
    e2d8:	00070463          	beqz	a4,e2e0 <.L223>
    e2dc:	00133e13          	seqz	t3,t1

0000e2e0 <.L223>:
    e2e0:	01fe6e33          	or	t3,t3,t6

0000e2e4 <.LVL398>:
    e2e4:	41658733          	sub	a4,a1,s6

0000e2e8 <.LVL399>:
    e2e8:	41c70733          	sub	a4,a4,t3
    e2ec:	02e12e23          	sw	a4,60(sp)
    e2f0:	03e12c23          	sw	t5,56(sp)
    e2f4:	03012a23          	sw	a6,52(sp)
    e2f8:	02a12823          	sw	a0,48(sp)

0000e2fc <.LBE87>:
    e2fc:	00c71e13          	sll	t3,a4,0xc

0000e300 <.LVL401>:
    e300:	140e5663          	bgez	t3,e44c <.L224>

0000e304 <.LBB88>:
    e304:	40f407b3          	sub	a5,s0,a5

0000e308 <.LVL402>:
    e308:	40d986b3          	sub	a3,s3,a3

0000e30c <.LVL403>:
    e30c:	00f43733          	sltu	a4,s0,a5
    e310:	00d9b9b3          	sltu	s3,s3,a3

0000e314 <.LVL404>:
    e314:	40e686b3          	sub	a3,a3,a4

0000e318 <.LVL405>:
    e318:	00000713          	li	a4,0
    e31c:	00f47463          	bgeu	s0,a5,e324 <.L229>
    e320:	001eb713          	seqz	a4,t4

0000e324 <.L229>:
    e324:	40cc0633          	sub	a2,s8,a2
    e328:	013769b3          	or	s3,a4,s3

0000e32c <.LVL406>:
    e32c:	00cc3c33          	sltu	s8,s8,a2

0000e330 <.LVL407>:
    e330:	41360633          	sub	a2,a2,s3

0000e334 <.LVL408>:
    e334:	00098463          	beqz	s3,e33c <.L232>
    e338:	00133893          	seqz	a7,t1

0000e33c <.L232>:
    e33c:	40bb05b3          	sub	a1,s6,a1
    e340:	0188e733          	or	a4,a7,s8

0000e344 <.LVL410>:
    e344:	40e58733          	sub	a4,a1,a4

0000e348 <.LVL411>:
    e348:	02e12e23          	sw	a4,60(sp)
    e34c:	02c12c23          	sw	a2,56(sp)
    e350:	02d12a23          	sw	a3,52(sp)
    e354:	02f12823          	sw	a5,48(sp)

0000e358 <.LBE88>:
    e358:	00090a93          	mv	s5,s2

0000e35c <.L233>:
    e35c:	03c12503          	lw	a0,60(sp)
    e360:	10050063          	beqz	a0,e460 <.L234>
    e364:	ab0f30ef          	jal	1614 <__clzsi2>

0000e368 <.L235>:
    e368:	ff450513          	add	a0,a0,-12

0000e36c <.LBB56>:
    e36c:	02000713          	li	a4,32
    e370:	01f57813          	and	a6,a0,31
    e374:	02e547b3          	div	a5,a0,a4

0000e378 <.LVL416>:
    e378:	12080063          	beqz	a6,e498 <.L238>
    e37c:	03010313          	add	t1,sp,48
    e380:	02e566b3          	rem	a3,a0,a4

0000e384 <.LVL417>:
    e384:	40d70633          	sub	a2,a4,a3
    e388:	ffc00693          	li	a3,-4

0000e38c <.LVL418>:
    e38c:	02d786b3          	mul	a3,a5,a3
    e390:	00c68713          	add	a4,a3,12
    e394:	00e30733          	add	a4,t1,a4
    e398:	40d006b3          	neg	a3,a3

0000e39c <.L239>:
    e39c:	12e31663          	bne	t1,a4,e4c8 <.L242>
    e3a0:	03012683          	lw	a3,48(sp)
    e3a4:	fff78713          	add	a4,a5,-1

0000e3a8 <.LVL419>:
    e3a8:	00279793          	sll	a5,a5,0x2

0000e3ac <.LVL420>:
    e3ac:	04078793          	add	a5,a5,64
    e3b0:	002787b3          	add	a5,a5,sp
    e3b4:	010696b3          	sll	a3,a3,a6
    e3b8:	fed7a823          	sw	a3,-16(a5)

0000e3bc <.L243>:
    e3bc:	00170713          	add	a4,a4,1
    e3c0:	03010793          	add	a5,sp,48
    e3c4:	00271713          	sll	a4,a4,0x2
    e3c8:	00800693          	li	a3,8
    e3cc:	00078893          	mv	a7,a5
    e3d0:	00d76a63          	bltu	a4,a3,e3e4 <.L244>
    e3d4:	02012823          	sw	zero,48(sp)
    e3d8:	0007a223          	sw	zero,4(a5)
    e3dc:	ff870713          	add	a4,a4,-8
    e3e0:	03810793          	add	a5,sp,56

0000e3e4 <.L244>:
    e3e4:	00400693          	li	a3,4
    e3e8:	00d76463          	bltu	a4,a3,e3f0 <.L245>
    e3ec:	0007a023          	sw	zero,0(a5)

0000e3f0 <.L245>:
    e3f0:	1c954863          	blt	a0,s1,e5c0 <.L246>
    e3f4:	40950533          	sub	a0,a0,s1

0000e3f8 <.LVL422>:
    e3f8:	00150513          	add	a0,a0,1

0000e3fc <.LBB52>:
    e3fc:	40555713          	sra	a4,a0,0x5

0000e400 <.LVL424>:
    e400:	01f57793          	and	a5,a0,31

0000e404 <.LVL425>:
    e404:	00088593          	mv	a1,a7
    e408:	00088613          	mv	a2,a7
    e40c:	00000313          	li	t1,0
    e410:	00000693          	li	a3,0

0000e414 <.L247>:
    e414:	0ce69c63          	bne	a3,a4,e4ec <.L248>
    e418:	00300693          	li	a3,3

0000e41c <.LVL427>:
    e41c:	40e686b3          	sub	a3,a3,a4
    e420:	00271613          	sll	a2,a4,0x2
    e424:	0c079e63          	bnez	a5,e500 <.L249>

0000e428 <.L250>:
    e428:	00c58533          	add	a0,a1,a2
    e42c:	00052503          	lw	a0,0(a0)
    e430:	00178793          	add	a5,a5,1

0000e434 <.LVL429>:
    e434:	00458593          	add	a1,a1,4
    e438:	fea5ae23          	sw	a0,-4(a1)

0000e43c <.LVL430>:
    e43c:	fef6d6e3          	bge	a3,a5,e428 <.L250>
    e440:	00400793          	li	a5,4

0000e444 <.LVL431>:
    e444:	40e78733          	sub	a4,a5,a4

0000e448 <.LVL432>:
    e448:	1040006f          	j	e54c <.L254>

0000e44c <.L224>:
    e44c:	01056533          	or	a0,a0,a6

0000e450 <.LVL434>:
    e450:	01e56533          	or	a0,a0,t5
    e454:	00e56533          	or	a0,a0,a4
    e458:	ca0504e3          	beqz	a0,e100 <.L209>
    e45c:	f01ff06f          	j	e35c <.L233>

0000e460 <.L234>:
    e460:	03812503          	lw	a0,56(sp)
    e464:	00050863          	beqz	a0,e474 <.L236>
    e468:	9acf30ef          	jal	1614 <__clzsi2>

0000e46c <.LVL436>:
    e46c:	02050513          	add	a0,a0,32
    e470:	ef9ff06f          	j	e368 <.L235>

0000e474 <.L236>:
    e474:	03412503          	lw	a0,52(sp)
    e478:	00050863          	beqz	a0,e488 <.L237>
    e47c:	998f30ef          	jal	1614 <__clzsi2>

0000e480 <.LVL439>:
    e480:	04050513          	add	a0,a0,64
    e484:	ee5ff06f          	j	e368 <.L235>

0000e488 <.L237>:
    e488:	03012503          	lw	a0,48(sp)
    e48c:	988f30ef          	jal	1614 <__clzsi2>

0000e490 <.LVL442>:
    e490:	06050513          	add	a0,a0,96
    e494:	ed5ff06f          	j	e368 <.L235>

0000e498 <.L238>:
    e498:	ffc00613          	li	a2,-4
    e49c:	02c78633          	mul	a2,a5,a2
    e4a0:	03c10713          	add	a4,sp,60

0000e4a4 <.LBB58>:
    e4a4:	00300693          	li	a3,3

0000e4a8 <.L240>:
    e4a8:	00c705b3          	add	a1,a4,a2
    e4ac:	0005a583          	lw	a1,0(a1)
    e4b0:	fff68693          	add	a3,a3,-1

0000e4b4 <.LVL446>:
    e4b4:	ffc70713          	add	a4,a4,-4
    e4b8:	00b72223          	sw	a1,4(a4)

0000e4bc <.LVL447>:
    e4bc:	fef6d6e3          	bge	a3,a5,e4a8 <.L240>
    e4c0:	fff78713          	add	a4,a5,-1
    e4c4:	ef9ff06f          	j	e3bc <.L243>

0000e4c8 <.L242>:
    e4c8:	00072583          	lw	a1,0(a4)
    e4cc:	ffc72883          	lw	a7,-4(a4)
    e4d0:	00d70e33          	add	t3,a4,a3
    e4d4:	010595b3          	sll	a1,a1,a6
    e4d8:	00c8d8b3          	srl	a7,a7,a2
    e4dc:	0115e5b3          	or	a1,a1,a7
    e4e0:	00be2023          	sw	a1,0(t3)
    e4e4:	ffc70713          	add	a4,a4,-4
    e4e8:	eb5ff06f          	j	e39c <.L239>

0000e4ec <.L248>:
    e4ec:	00062503          	lw	a0,0(a2)
    e4f0:	00168693          	add	a3,a3,1

0000e4f4 <.LVL450>:
    e4f4:	00460613          	add	a2,a2,4
    e4f8:	00a36333          	or	t1,t1,a0

0000e4fc <.LVL451>:
    e4fc:	f19ff06f          	j	e414 <.L247>

0000e500 <.L249>:
    e500:	04060593          	add	a1,a2,64
    e504:	002585b3          	add	a1,a1,sp
    e508:	ff05a583          	lw	a1,-16(a1)
    e50c:	02000813          	li	a6,32
    e510:	40f80833          	sub	a6,a6,a5
    e514:	010595b3          	sll	a1,a1,a6
    e518:	00b36333          	or	t1,t1,a1

0000e51c <.LVL453>:
    e51c:	00000e13          	li	t3,0
    e520:	00c885b3          	add	a1,a7,a2
    e524:	40c00633          	neg	a2,a2

0000e528 <.L252>:
    e528:	06de4863          	blt	t3,a3,e598 <.L253>
    e52c:	00400613          	li	a2,4
    e530:	40e60733          	sub	a4,a2,a4

0000e534 <.LVL455>:
    e534:	03c12603          	lw	a2,60(sp)
    e538:	00269693          	sll	a3,a3,0x2

0000e53c <.LVL456>:
    e53c:	04068693          	add	a3,a3,64
    e540:	002686b3          	add	a3,a3,sp
    e544:	00f657b3          	srl	a5,a2,a5

0000e548 <.LVL457>:
    e548:	fef6a823          	sw	a5,-16(a3)

0000e54c <.L254>:
    e54c:	00400693          	li	a3,4
    e550:	40e686b3          	sub	a3,a3,a4
    e554:	00271713          	sll	a4,a4,0x2
    e558:	00e887b3          	add	a5,a7,a4
    e55c:	00269713          	sll	a4,a3,0x2
    e560:	00800693          	li	a3,8
    e564:	00d76a63          	bltu	a4,a3,e578 <.L255>
    e568:	0007a023          	sw	zero,0(a5)
    e56c:	0007a223          	sw	zero,4(a5)
    e570:	ff870713          	add	a4,a4,-8
    e574:	00878793          	add	a5,a5,8

0000e578 <.L255>:
    e578:	00400693          	li	a3,4
    e57c:	00d76463          	bltu	a4,a3,e584 <.L256>
    e580:	0007a023          	sw	zero,0(a5)

0000e584 <.L256>:
    e584:	03012703          	lw	a4,48(sp)

0000e588 <.LBB54>:
    e588:	006037b3          	snez	a5,t1

0000e58c <.LBE54>:
    e58c:	00f767b3          	or	a5,a4,a5
    e590:	02f12823          	sw	a5,48(sp)
    e594:	c5cff06f          	j	d9f0 <.L357>

0000e598 <.L253>:
    e598:	0005a503          	lw	a0,0(a1)
    e59c:	0045ae83          	lw	t4,4(a1)
    e5a0:	00c58f33          	add	t5,a1,a2
    e5a4:	00f55533          	srl	a0,a0,a5
    e5a8:	010e9eb3          	sll	t4,t4,a6
    e5ac:	01d56533          	or	a0,a0,t4
    e5b0:	00af2023          	sw	a0,0(t5)

0000e5b4 <.LVL461>:
    e5b4:	001e0e13          	add	t3,t3,1

0000e5b8 <.LVL462>:
    e5b8:	00458593          	add	a1,a1,4
    e5bc:	f6dff06f          	j	e528 <.L252>

0000e5c0 <.L246>:
    e5c0:	03c12783          	lw	a5,60(sp)
    e5c4:	fff80737          	lui	a4,0xfff80
    e5c8:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff69f4f>
    e5cc:	00e7f7b3          	and	a5,a5,a4
    e5d0:	40a484b3          	sub	s1,s1,a0
    e5d4:	02f12e23          	sw	a5,60(sp)

0000e5d8 <.LBB153>:
  FP_PACK_SEMIRAW_Q (r, R);
    e5d8:	dedfe06f          	j	d3c4 <.L10>

0000e5dc <.L263>:
    e5dc:	02012e23          	sw	zero,60(sp)
    e5e0:	02012c23          	sw	zero,56(sp)
    e5e4:	02012a23          	sw	zero,52(sp)
    e5e8:	02012823          	sw	zero,48(sp)
    e5ec:	e59fe06f          	j	d444 <.L262>

0000e5f0 <.L343>:
  FP_SUB_Q (R, A, B);
    e5f0:	07400713          	li	a4,116
    e5f4:	00c74463          	blt	a4,a2,e5fc <.L26>
    e5f8:	f4dfe06f          	j	d544 <.L267>

0000e5fc <.L26>:
    e5fc:	02012623          	sw	zero,44(sp)
    e600:	02012423          	sw	zero,40(sp)
    e604:	02012223          	sw	zero,36(sp)
    e608:	00100713          	li	a4,1
    e60c:	828ff06f          	j	d634 <.L37>

0000e610 <.L62>:
    e610:	07400793          	li	a5,116
    e614:	a0b7dc63          	bge	a5,a1,d82c <.L268>

0000e618 <.L64>:
    e618:	00012e23          	sw	zero,28(sp)
    e61c:	00012c23          	sw	zero,24(sp)
    e620:	00012a23          	sw	zero,20(sp)
    e624:	00100793          	li	a5,1
    e628:	afcff06f          	j	d924 <.L76>

0000e62c <.L164>:
    e62c:	07400793          	li	a5,116
    e630:	a717c2e3          	blt	a5,a7,e094 <.L166>
    e634:	00088313          	mv	t1,a7
    e638:	8d1ff06f          	j	df08 <.L270>

0000e63c <__fixunstfsi>:
#include "soft-fp.h"
#include "quad.h"

USItype
__fixunstfsi (TFtype a)
{
    e63c:	00052703          	lw	a4,0(a0)
    e640:	00c52783          	lw	a5,12(a0)
    e644:	00852583          	lw	a1,8(a0)
    e648:	00452683          	lw	a3,4(a0)
    e64c:	fe010113          	add	sp,sp,-32

0000e650 <.LBB3>:
  FP_DECL_EX;
  FP_DECL_Q (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    e650:	00e12023          	sw	a4,0(sp)
    e654:	00e12823          	sw	a4,16(sp)
    e658:	00179613          	sll	a2,a5,0x1

0000e65c <.LBE3>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e65c:	00004737          	lui	a4,0x4

0000e660 <.LBB4>:
  FP_UNPACK_RAW_Q (A, a);
    e660:	00d12223          	sw	a3,4(sp)
    e664:	00b12423          	sw	a1,8(sp)
    e668:	00f12623          	sw	a5,12(sp)
    e66c:	00b12c23          	sw	a1,24(sp)
    e670:	01165613          	srl	a2,a2,0x11

0000e674 <.LBE4>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e674:	ffe70713          	add	a4,a4,-2 # 3ffe <_dl_aux_init+0x2>
    e678:	00000513          	li	a0,0
    e67c:	06c75a63          	bge	a4,a2,e6f0 <.L1>
    e680:	01f7d813          	srl	a6,a5,0x1f
    e684:	00004737          	lui	a4,0x4

0000e688 <.LBB5>:
  FP_UNPACK_RAW_Q (A, a);
    e688:	00080693          	mv	a3,a6

0000e68c <.LBE5>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e68c:	01e70713          	add	a4,a4,30 # 401e <_dl_aux_init+0x22>
    e690:	00081663          	bnez	a6,e69c <.L5>
    e694:	00004737          	lui	a4,0x4
    e698:	01f70713          	add	a4,a4,31 # 401f <_dl_aux_init+0x23>

0000e69c <.L5>:
    e69c:	fff80513          	add	a0,a6,-1
    e6a0:	04e65863          	bge	a2,a4,e6f0 <.L1>
    e6a4:	00000513          	li	a0,0
    e6a8:	04081463          	bnez	a6,e6f0 <.L1>

0000e6ac <.LBB10>:
  FP_UNPACK_RAW_Q (A, a);
    e6ac:	01079793          	sll	a5,a5,0x10

0000e6b0 <.LBB11>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e6b0:	00010737          	lui	a4,0x10

0000e6b4 <.LBB12>:
  FP_UNPACK_RAW_Q (A, a);
    e6b4:	0107d793          	srl	a5,a5,0x10

0000e6b8 <.LBB13>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e6b8:	00e7e7b3          	or	a5,a5,a4

0000e6bc <.LBB7>:
    e6bc:	00004737          	lui	a4,0x4
    e6c0:	06f70713          	add	a4,a4,111 # 406f <atan2f+0x37>
    e6c4:	40c70733          	sub	a4,a4,a2
    e6c8:	40575613          	sra	a2,a4,0x5

0000e6cc <.LBE7>:
    e6cc:	00f12e23          	sw	a5,28(sp)

0000e6d0 <.LBB8>:
    e6d0:	01f77713          	and	a4,a4,31

0000e6d4 <.LVL6>:
    e6d4:	02071263          	bnez	a4,e6f8 <.L7>

0000e6d8 <.LVL7>:
    e6d8:	00261613          	sll	a2,a2,0x2

0000e6dc <.LVL8>:
    e6dc:	02060793          	add	a5,a2,32
    e6e0:	00278633          	add	a2,a5,sp
    e6e4:	ff062783          	lw	a5,-16(a2)
    e6e8:	00f12823          	sw	a5,16(sp)

0000e6ec <.L8>:
    e6ec:	01012503          	lw	a0,16(sp)

0000e6f0 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    e6f0:	02010113          	add	sp,sp,32

0000e6f4 <.LVL11>:
    e6f4:	00008067          	ret

0000e6f8 <.L7>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e6f8:	00200513          	li	a0,2
    e6fc:	02a61063          	bne	a2,a0,e71c <.L9>
    e700:	02000693          	li	a3,32
    e704:	40e686b3          	sub	a3,a3,a4
    e708:	00d796b3          	sll	a3,a5,a3
    e70c:	00e5d5b3          	srl	a1,a1,a4
    e710:	00b6e6b3          	or	a3,a3,a1
    e714:	00d12823          	sw	a3,16(sp)

0000e718 <.LVL13>:
    e718:	00100693          	li	a3,1

0000e71c <.L9>:
    e71c:	00269693          	sll	a3,a3,0x2

0000e720 <.LVL15>:
    e720:	02068693          	add	a3,a3,32
    e724:	002686b3          	add	a3,a3,sp
    e728:	00e7d7b3          	srl	a5,a5,a4
    e72c:	fef6a823          	sw	a5,-16(a3)
    e730:	fbdff06f          	j	e6ec <.L8>

0000e734 <__floatunsitf>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__floatunsitf (USItype i)
{
    e734:	fd010113          	add	sp,sp,-48
    e738:	02912223          	sw	s1,36(sp)
    e73c:	02112623          	sw	ra,44(sp)
    e740:	02812423          	sw	s0,40(sp)
    e744:	00050493          	mv	s1,a0

0000e748 <.LBB12>:
  FP_DECL_Q (A);
  TFtype a;

  FP_FROM_INT_Q (A, i, SI_BITS, USItype);
    e748:	10058463          	beqz	a1,e850 <.L2>

0000e74c <.LBB3>:
    e74c:	00058513          	mv	a0,a1
    e750:	00058413          	mv	s0,a1

0000e754 <.LBB5>:
    e754:	ec1f20ef          	jal	1614 <__clzsi2>

0000e758 <.LVL3>:
    e758:	00004737          	lui	a4,0x4
    e75c:	01e70713          	add	a4,a4,30 # 401e <_dl_aux_init+0x22>

0000e760 <.LBB6>:
    e760:	05150793          	add	a5,a0,81

0000e764 <.LBB7>:
    e764:	40a70633          	sub	a2,a4,a0

0000e768 <.LBE7>:
    e768:	00812823          	sw	s0,16(sp)

0000e76c <.LBB8>:
    e76c:	4057d713          	sra	a4,a5,0x5

0000e770 <.LBE8>:
    e770:	00012a23          	sw	zero,20(sp)
    e774:	00012c23          	sw	zero,24(sp)
    e778:	00012e23          	sw	zero,28(sp)

0000e77c <.LBB9>:
    e77c:	01f7f793          	and	a5,a5,31

0000e780 <.LVL6>:
    e780:	02078c63          	beqz	a5,e7b8 <.L3>

0000e784 <.LVL7>:
    e784:	00200693          	li	a3,2
    e788:	0cd71063          	bne	a4,a3,e848 <.L8>
    e78c:	02000693          	li	a3,32
    e790:	40f686b3          	sub	a3,a3,a5

0000e794 <.LVL8>:
    e794:	00d456b3          	srl	a3,s0,a3

0000e798 <.LVL9>:
    e798:	00d12e23          	sw	a3,28(sp)

0000e79c <.L4>:
    e79c:	fff70693          	add	a3,a4,-1

0000e7a0 <.LVL11>:
    e7a0:	00271713          	sll	a4,a4,0x2
    e7a4:	02070713          	add	a4,a4,32
    e7a8:	00270733          	add	a4,a4,sp
    e7ac:	00f41433          	sll	s0,s0,a5

0000e7b0 <.LVL12>:
    e7b0:	fe872823          	sw	s0,-16(a4)
    e7b4:	0340006f          	j	e7e8 <.L5>

0000e7b8 <.L3>:
    e7b8:	00300793          	li	a5,3

0000e7bc <.LVL14>:
    e7bc:	40e787b3          	sub	a5,a5,a4
    e7c0:	00279793          	sll	a5,a5,0x2
    e7c4:	02078793          	add	a5,a5,32
    e7c8:	002787b3          	add	a5,a5,sp
    e7cc:	ff07a783          	lw	a5,-16(a5)
    e7d0:	00200693          	li	a3,2
    e7d4:	00f12e23          	sw	a5,28(sp)

0000e7d8 <.LVL15>:
    e7d8:	00200793          	li	a5,2
    e7dc:	00f71663          	bne	a4,a5,e7e8 <.L5>
    e7e0:	00812c23          	sw	s0,24(sp)

0000e7e4 <.LVL16>:
    e7e4:	00100693          	li	a3,1

0000e7e8 <.L5>:
    e7e8:	00269693          	sll	a3,a3,0x2
    e7ec:	00012823          	sw	zero,16(sp)

0000e7f0 <.LVL18>:
    e7f0:	00012a23          	sw	zero,20(sp)
    e7f4:	ffc68693          	add	a3,a3,-4
    e7f8:	00400793          	li	a5,4
    e7fc:	00f6e463          	bltu	a3,a5,e804 <.L7>
    e800:	00012c23          	sw	zero,24(sp)

0000e804 <.L7>:
  FP_PACK_RAW_Q (a, A);
    e804:	01c12783          	lw	a5,28(sp)
    e808:	00c11723          	sh	a2,14(sp)

0000e80c <.LBE13>:

  return a;
}
    e80c:	02c12083          	lw	ra,44(sp)

0000e810 <.LBB14>:
  FP_PACK_RAW_Q (a, A);
    e810:	00f11623          	sh	a5,12(sp)

0000e814 <.LBE14>:
  return a;
    e814:	01012783          	lw	a5,16(sp)
}
    e818:	02812403          	lw	s0,40(sp)
    e81c:	00048513          	mv	a0,s1
  return a;
    e820:	00f4a023          	sw	a5,0(s1)
    e824:	01412783          	lw	a5,20(sp)
    e828:	00f4a223          	sw	a5,4(s1)
    e82c:	01812783          	lw	a5,24(sp)
    e830:	00f4a423          	sw	a5,8(s1)
    e834:	00c12783          	lw	a5,12(sp)
    e838:	00f4a623          	sw	a5,12(s1)
}
    e83c:	02412483          	lw	s1,36(sp)
    e840:	03010113          	add	sp,sp,48

0000e844 <.LVL22>:
    e844:	00008067          	ret

0000e848 <.L8>:
  FP_FROM_INT_Q (A, i, SI_BITS, USItype);
    e848:	00300713          	li	a4,3

0000e84c <.LVL24>:
    e84c:	f51ff06f          	j	e79c <.L4>

0000e850 <.L2>:
    e850:	00012e23          	sw	zero,28(sp)
    e854:	00012c23          	sw	zero,24(sp)
    e858:	00012a23          	sw	zero,20(sp)
    e85c:	00012823          	sw	zero,16(sp)
    e860:	00000613          	li	a2,0
    e864:	fa1ff06f          	j	e804 <.L7>

0000e868 <__extendsfdf2>:
  FP_DECL_S (A);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_S (A, a);
    e868:	01755713          	srl	a4,a0,0x17
    e86c:	0ff77713          	zext.b	a4,a4

0000e870 <.LBE2>:
{
    e870:	ff010113          	add	sp,sp,-16
#if _FP_W_TYPE_SIZE < _FP_FRACBITS_D
  FP_EXTEND (D, S, 2, 1, R, A);
    e874:	00170793          	add	a5,a4,1
{
    e878:	00812423          	sw	s0,8(sp)
    e87c:	00912223          	sw	s1,4(sp)

0000e880 <.LBB3>:
  FP_UNPACK_RAW_S (A, a);
    e880:	00951413          	sll	s0,a0,0x9

0000e884 <.LBE3>:
{
    e884:	00112623          	sw	ra,12(sp)
  FP_EXTEND (D, S, 2, 1, R, A);
    e888:	0fe7f793          	and	a5,a5,254

0000e88c <.LBB4>:
  FP_UNPACK_RAW_S (A, a);
    e88c:	00945413          	srl	s0,s0,0x9

0000e890 <.LVL1>:
    e890:	01f55493          	srl	s1,a0,0x1f

0000e894 <.LBE4>:
  FP_EXTEND (D, S, 2, 1, R, A);
    e894:	04078263          	beqz	a5,e8d8 <.L2>
    e898:	00345793          	srl	a5,s0,0x3
    e89c:	38070713          	add	a4,a4,896

0000e8a0 <.LVL3>:
    e8a0:	01d41413          	sll	s0,s0,0x1d

0000e8a4 <.L3>:
#else
  FP_EXTEND (D, S, 1, 1, R, A);
#endif
  FP_PACK_RAW_D (r, R);
    e8a4:	00c79793          	sll	a5,a5,0xc

0000e8a8 <.LVL5>:
    e8a8:	00c7d793          	srl	a5,a5,0xc
    e8ac:	01471713          	sll	a4,a4,0x14

0000e8b0 <.LVL6>:
    e8b0:	01f49513          	sll	a0,s1,0x1f
    e8b4:	00f76733          	or	a4,a4,a5

0000e8b8 <.LBE7>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    e8b8:	00c12083          	lw	ra,12(sp)

0000e8bc <.LBB8>:
  FP_PACK_RAW_D (r, R);
    e8bc:	00a767b3          	or	a5,a4,a0

0000e8c0 <.LBE8>:
}
    e8c0:	00040513          	mv	a0,s0
    e8c4:	00812403          	lw	s0,8(sp)

0000e8c8 <.LVL8>:
    e8c8:	00412483          	lw	s1,4(sp)

0000e8cc <.LVL9>:
    e8cc:	00078593          	mv	a1,a5
    e8d0:	01010113          	add	sp,sp,16
    e8d4:	00008067          	ret

0000e8d8 <.L2>:
  FP_EXTEND (D, S, 2, 1, R, A);
    e8d8:	04071663          	bnez	a4,e924 <.L4>
    e8dc:	00000793          	li	a5,0
    e8e0:	fc0402e3          	beqz	s0,e8a4 <.L3>

0000e8e4 <.LBB9>:
    e8e4:	00040513          	mv	a0,s0

0000e8e8 <.LVL11>:
    e8e8:	d2df20ef          	jal	1614 <__clzsi2>

0000e8ec <.LVL12>:
    e8ec:	00a00793          	li	a5,10
    e8f0:	02a7c263          	blt	a5,a0,e914 <.L5>
    e8f4:	00b00793          	li	a5,11
    e8f8:	40a787b3          	sub	a5,a5,a0
    e8fc:	01550713          	add	a4,a0,21
    e900:	00f457b3          	srl	a5,s0,a5

0000e904 <.LVL13>:
    e904:	00e41433          	sll	s0,s0,a4

0000e908 <.L6>:
    e908:	38900713          	li	a4,905
    e90c:	40a70733          	sub	a4,a4,a0

0000e910 <.LVL15>:
    e910:	f95ff06f          	j	e8a4 <.L3>

0000e914 <.L5>:
    e914:	ff550793          	add	a5,a0,-11
    e918:	00f417b3          	sll	a5,s0,a5

0000e91c <.LVL17>:
    e91c:	00000413          	li	s0,0

0000e920 <.LVL18>:
    e920:	fe9ff06f          	j	e908 <.L6>

0000e924 <.L4>:
    e924:	00000793          	li	a5,0
    e928:	00040a63          	beqz	s0,e93c <.L11>

0000e92c <.LVL20>:
    e92c:	00345793          	srl	a5,s0,0x3

0000e930 <.LVL21>:
    e930:	00080737          	lui	a4,0x80

0000e934 <.LVL22>:
    e934:	01d41413          	sll	s0,s0,0x1d

0000e938 <.LVL23>:
    e938:	00e7e7b3          	or	a5,a5,a4

0000e93c <.L11>:
    e93c:	7ff00713          	li	a4,2047
    e940:	f65ff06f          	j	e8a4 <.L3>

0000e944 <__extenddftf2>:
  FP_DECL_D (A);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    e944:	01465713          	srl	a4,a2,0x14
    e948:	00c61793          	sll	a5,a2,0xc
    e94c:	7ff77713          	and	a4,a4,2047

0000e950 <.LBE2>:
{
    e950:	fd010113          	add	sp,sp,-48

0000e954 <.LBB3>:
  FP_UNPACK_RAW_D (A, a);
    e954:	00c7d793          	srl	a5,a5,0xc

0000e958 <.LBE3>:
#if _FP_W_TYPE_SIZE < 64
  FP_EXTEND (Q, D, 4, 2, R, A);
    e958:	00170693          	add	a3,a4,1 # 80001 <_ebss+0x69f51>
{
    e95c:	02812423          	sw	s0,40(sp)
    e960:	02912223          	sw	s1,36(sp)
    e964:	03212023          	sw	s2,32(sp)
    e968:	02112623          	sw	ra,44(sp)
  FP_EXTEND (Q, D, 4, 2, R, A);
    e96c:	00b12823          	sw	a1,16(sp)
    e970:	00f12a23          	sw	a5,20(sp)
    e974:	00012e23          	sw	zero,28(sp)
    e978:	00012c23          	sw	zero,24(sp)
    e97c:	7fe6f693          	and	a3,a3,2046
{
    e980:	00050913          	mv	s2,a0
    e984:	00058413          	mv	s0,a1

0000e988 <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    e988:	01f65493          	srl	s1,a2,0x1f

0000e98c <.LBE4>:
  FP_EXTEND (Q, D, 4, 2, R, A);
    e98c:	08068263          	beqz	a3,ea10 <.L2>
    e990:	000046b7          	lui	a3,0x4
    e994:	c0068693          	add	a3,a3,-1024 # 3c00 <.L72+0x10>
    e998:	00d70733          	add	a4,a4,a3

0000e99c <.LBB5>:
    e99c:	0047d693          	srl	a3,a5,0x4
    e9a0:	00d12e23          	sw	a3,28(sp)

0000e9a4 <.LVL4>:
    e9a4:	01c79793          	sll	a5,a5,0x1c

0000e9a8 <.LVL5>:
    e9a8:	0045d693          	srl	a3,a1,0x4
    e9ac:	00d7e7b3          	or	a5,a5,a3
    e9b0:	01c59413          	sll	s0,a1,0x1c
    e9b4:	00f12c23          	sw	a5,24(sp)

0000e9b8 <.LVL6>:
    e9b8:	00812a23          	sw	s0,20(sp)

0000e9bc <.LVL7>:
    e9bc:	00012823          	sw	zero,16(sp)

0000e9c0 <.L3>:
#else
  FP_EXTEND (Q, D, 2, 1, R, A);
#endif
  FP_PACK_RAW_Q (r, R);
    e9c0:	01c12783          	lw	a5,28(sp)
    e9c4:	00f49493          	sll	s1,s1,0xf

0000e9c8 <.LVL9>:
    e9c8:	00e4e4b3          	or	s1,s1,a4
    e9cc:	00f11623          	sh	a5,12(sp)

0000e9d0 <.LBE6>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    e9d0:	01012783          	lw	a5,16(sp)

0000e9d4 <.LBB7>:
  FP_PACK_RAW_Q (r, R);
    e9d4:	00911723          	sh	s1,14(sp)

0000e9d8 <.LBE7>:
}
    e9d8:	02c12083          	lw	ra,44(sp)
  return r;
    e9dc:	00f92023          	sw	a5,0(s2)
    e9e0:	01412783          	lw	a5,20(sp)

0000e9e4 <.LVL11>:
}
    e9e4:	02812403          	lw	s0,40(sp)
    e9e8:	02412483          	lw	s1,36(sp)
  return r;
    e9ec:	00f92223          	sw	a5,4(s2)
    e9f0:	01812783          	lw	a5,24(sp)
}
    e9f4:	00090513          	mv	a0,s2
  return r;
    e9f8:	00f92423          	sw	a5,8(s2)
    e9fc:	00c12783          	lw	a5,12(sp)
    ea00:	00f92623          	sw	a5,12(s2)
}
    ea04:	02012903          	lw	s2,32(sp)
    ea08:	03010113          	add	sp,sp,48

0000ea0c <.LVL13>:
    ea0c:	00008067          	ret

0000ea10 <.L2>:
  FP_EXTEND (Q, D, 4, 2, R, A);
    ea10:	00b7e533          	or	a0,a5,a1
    ea14:	10071063          	bnez	a4,eb14 <.L4>
    ea18:	fa0504e3          	beqz	a0,e9c0 <.L3>

0000ea1c <.LBB8>:
    ea1c:	04078e63          	beqz	a5,ea78 <.L5>
    ea20:	00078513          	mv	a0,a5
    ea24:	bf1f20ef          	jal	1614 <__clzsi2>

0000ea28 <.L6>:
    ea28:	03150693          	add	a3,a0,49
    ea2c:	4056d793          	sra	a5,a3,0x5

0000ea30 <.LVL17>:
    ea30:	01f6f693          	and	a3,a3,31

0000ea34 <.LVL18>:
    ea34:	04068863          	beqz	a3,ea84 <.L7>
    ea38:	ffc00613          	li	a2,-4
    ea3c:	02c78633          	mul	a2,a5,a2
    ea40:	02000813          	li	a6,32
    ea44:	01010313          	add	t1,sp,16
    ea48:	40d80833          	sub	a6,a6,a3

0000ea4c <.LVL19>:
    ea4c:	00c60713          	add	a4,a2,12
    ea50:	00e30733          	add	a4,t1,a4
    ea54:	40c00633          	neg	a2,a2

0000ea58 <.L8>:
    ea58:	08e31c63          	bne	t1,a4,eaf0 <.L11>
    ea5c:	fff78713          	add	a4,a5,-1

0000ea60 <.LVL20>:
    ea60:	00279793          	sll	a5,a5,0x2

0000ea64 <.LVL21>:
    ea64:	02078793          	add	a5,a5,32
    ea68:	002787b3          	add	a5,a5,sp
    ea6c:	00d416b3          	sll	a3,s0,a3

0000ea70 <.LVL22>:
    ea70:	fed7a823          	sw	a3,-16(a5)
    ea74:	03c0006f          	j	eab0 <.L10>

0000ea78 <.L5>:
    ea78:	b9df20ef          	jal	1614 <__clzsi2>

0000ea7c <.LVL24>:
    ea7c:	02050513          	add	a0,a0,32
    ea80:	fa9ff06f          	j	ea28 <.L6>

0000ea84 <.L7>:
    ea84:	ffc00613          	li	a2,-4
    ea88:	02c78633          	mul	a2,a5,a2
    ea8c:	01c10713          	add	a4,sp,28

0000ea90 <.LBB10>:
    ea90:	00300693          	li	a3,3

0000ea94 <.L9>:
    ea94:	00c705b3          	add	a1,a4,a2
    ea98:	0005a583          	lw	a1,0(a1)
    ea9c:	fff68693          	add	a3,a3,-1

0000eaa0 <.LVL28>:
    eaa0:	ffc70713          	add	a4,a4,-4
    eaa4:	00b72223          	sw	a1,4(a4)

0000eaa8 <.LVL29>:
    eaa8:	fef6d6e3          	bge	a3,a5,ea94 <.L9>
    eaac:	fff78713          	add	a4,a5,-1

0000eab0 <.L10>:
    eab0:	00170793          	add	a5,a4,1
    eab4:	00279793          	sll	a5,a5,0x2
    eab8:	00800693          	li	a3,8
    eabc:	01010713          	add	a4,sp,16
    eac0:	00d7ea63          	bltu	a5,a3,ead4 <.L12>
    eac4:	00012823          	sw	zero,16(sp)
    eac8:	00072223          	sw	zero,4(a4)
    eacc:	ff878793          	add	a5,a5,-8
    ead0:	01810713          	add	a4,sp,24

0000ead4 <.L12>:
    ead4:	00400693          	li	a3,4
    ead8:	00d7e463          	bltu	a5,a3,eae0 <.L13>
    eadc:	00072023          	sw	zero,0(a4)

0000eae0 <.L13>:
    eae0:	00004737          	lui	a4,0x4
    eae4:	c0c70713          	add	a4,a4,-1012 # 3c0c <.L75>
    eae8:	40a70733          	sub	a4,a4,a0

0000eaec <.LVL31>:
    eaec:	ed5ff06f          	j	e9c0 <.L3>

0000eaf0 <.L11>:
    eaf0:	00072583          	lw	a1,0(a4)
    eaf4:	ffc72883          	lw	a7,-4(a4)
    eaf8:	00c70e33          	add	t3,a4,a2
    eafc:	00d595b3          	sll	a1,a1,a3
    eb00:	0108d8b3          	srl	a7,a7,a6
    eb04:	0115e5b3          	or	a1,a1,a7
    eb08:	00be2023          	sw	a1,0(t3)
    eb0c:	ffc70713          	add	a4,a4,-4
    eb10:	f49ff06f          	j	ea58 <.L8>

0000eb14 <.L4>:
    eb14:	02050863          	beqz	a0,eb44 <.L14>

0000eb18 <.LBB12>:
    eb18:	01c79713          	sll	a4,a5,0x1c

0000eb1c <.LVL35>:
    eb1c:	0045d693          	srl	a3,a1,0x4
    eb20:	00d76733          	or	a4,a4,a3
    eb24:	00e12c23          	sw	a4,24(sp)

0000eb28 <.LVL36>:
    eb28:	0047d793          	srl	a5,a5,0x4

0000eb2c <.LBE12>:
    eb2c:	00008737          	lui	a4,0x8

0000eb30 <.LBB13>:
    eb30:	01c59413          	sll	s0,a1,0x1c

0000eb34 <.LBE13>:
    eb34:	00e7e7b3          	or	a5,a5,a4

0000eb38 <.LBB14>:
    eb38:	00812a23          	sw	s0,20(sp)

0000eb3c <.LVL39>:
    eb3c:	00012823          	sw	zero,16(sp)

0000eb40 <.LBE14>:
    eb40:	00f12e23          	sw	a5,28(sp)

0000eb44 <.L14>:
    eb44:	00008737          	lui	a4,0x8
    eb48:	fff70713          	add	a4,a4,-1 # 7fff <.L4+0xf>
    eb4c:	e75ff06f          	j	e9c0 <.L3>

0000eb50 <__truncdfsf2>:
  FP_DECL_D (A);
  FP_DECL_S (R);
  SFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
    eb50:	0145d613          	srl	a2,a1,0x14
    eb54:	7ff67613          	and	a2,a2,2047
    eb58:	00c59793          	sll	a5,a1,0xc

0000eb5c <.LBE2>:
#if _FP_W_TYPE_SIZE < _FP_FRACBITS_D
  FP_TRUNC (S, D, 1, 2, R, A);
    eb5c:	00160713          	add	a4,a2,1
  FP_UNPACK_SEMIRAW_D (A, a);
    eb60:	0097d793          	srl	a5,a5,0x9

0000eb64 <.LVL2>:
    eb64:	01d55693          	srl	a3,a0,0x1d
  FP_TRUNC (S, D, 1, 2, R, A);
    eb68:	7fe77713          	and	a4,a4,2046
  FP_UNPACK_SEMIRAW_D (A, a);
    eb6c:	00f6e6b3          	or	a3,a3,a5

0000eb70 <.LBB5>:
    eb70:	01f5d593          	srl	a1,a1,0x1f

0000eb74 <.LBE5>:
    eb74:	00351793          	sll	a5,a0,0x3

0000eb78 <.LVL4>:
  FP_TRUNC (S, D, 1, 2, R, A);
    eb78:	0a070663          	beqz	a4,ec24 <.L2>
    eb7c:	c8060713          	add	a4,a2,-896

0000eb80 <.LVL5>:
    eb80:	0fe00813          	li	a6,254
    eb84:	0ce84263          	blt	a6,a4,ec48 <.L11>
    eb88:	08e04063          	bgtz	a4,ec08 <.L4>
    eb8c:	fe900513          	li	a0,-23

0000eb90 <.LVL6>:
    eb90:	10a74a63          	blt	a4,a0,eca4 <.L12>
    eb94:	00800537          	lui	a0,0x800
    eb98:	00a6e6b3          	or	a3,a3,a0
    eb9c:	01e00513          	li	a0,30
    eba0:	40e50533          	sub	a0,a0,a4
    eba4:	01f00813          	li	a6,31
    eba8:	02a84863          	blt	a6,a0,ebd8 <.L5>
    ebac:	c8260613          	add	a2,a2,-894

0000ebb0 <.LVL8>:
    ebb0:	00a7d533          	srl	a0,a5,a0
    ebb4:	00c797b3          	sll	a5,a5,a2

0000ebb8 <.LVL9>:
    ebb8:	00f037b3          	snez	a5,a5
    ebbc:	00c696b3          	sll	a3,a3,a2

0000ebc0 <.LVL10>:
    ebc0:	00d7e7b3          	or	a5,a5,a3
    ebc4:	00f567b3          	or	a5,a0,a5

0000ebc8 <.L26>:
    ebc8:	00000713          	li	a4,0

0000ebcc <.L3>:
#else
  FP_TRUNC (S, D, 1, 1, R, A);
#endif
  FP_PACK_SEMIRAW_S (r, R);
    ebcc:	0077f693          	and	a3,a5,7
    ebd0:	08068063          	beqz	a3,ec50 <.L8>
    ebd4:	0d80006f          	j	ecac <.L24>

0000ebd8 <.L5>:
  FP_TRUNC (S, D, 1, 2, R, A);
    ebd8:	ffe00813          	li	a6,-2
    ebdc:	40e80833          	sub	a6,a6,a4
    ebe0:	02000893          	li	a7,32
    ebe4:	0106d833          	srl	a6,a3,a6
    ebe8:	00000713          	li	a4,0

0000ebec <.LVL14>:
    ebec:	01150663          	beq	a0,a7,ebf8 <.L6>
    ebf0:	ca260613          	add	a2,a2,-862

0000ebf4 <.LVL15>:
    ebf4:	00c69733          	sll	a4,a3,a2

0000ebf8 <.L6>:
    ebf8:	00f76733          	or	a4,a4,a5
    ebfc:	00e03733          	snez	a4,a4
    ec00:	00e867b3          	or	a5,a6,a4

0000ec04 <.LVL17>:
    ec04:	fc5ff06f          	j	ebc8 <.L26>

0000ec08 <.L4>:
    ec08:	00651513          	sll	a0,a0,0x6

0000ec0c <.LVL19>:
    ec0c:	00a03533          	snez	a0,a0
    ec10:	00369693          	sll	a3,a3,0x3

0000ec14 <.LVL20>:
    ec14:	01d7d793          	srl	a5,a5,0x1d

0000ec18 <.LVL21>:
    ec18:	00d566b3          	or	a3,a0,a3

0000ec1c <.L27>:
    ec1c:	00f6e7b3          	or	a5,a3,a5

0000ec20 <.LVL23>:
    ec20:	fadff06f          	j	ebcc <.L3>

0000ec24 <.L2>:
    ec24:	00f6e7b3          	or	a5,a3,a5

0000ec28 <.LVL25>:
    ec28:	00061663          	bnez	a2,ec34 <.L7>

0000ec2c <.LVL26>:
    ec2c:	00f037b3          	snez	a5,a5
    ec30:	f99ff06f          	j	ebc8 <.L26>

0000ec34 <.L7>:
    ec34:	0ff00713          	li	a4,255
    ec38:	00078c63          	beqz	a5,ec50 <.L8>

0000ec3c <.LVL28>:
    ec3c:	00369693          	sll	a3,a3,0x3

0000ec40 <.LVL29>:
    ec40:	020007b7          	lui	a5,0x2000
    ec44:	fd9ff06f          	j	ec1c <.L27>

0000ec48 <.L11>:
    ec48:	00000793          	li	a5,0

0000ec4c <.LVL31>:
    ec4c:	0ff00713          	li	a4,255

0000ec50 <.L8>:
  FP_PACK_SEMIRAW_S (r, R);
    ec50:	00579693          	sll	a3,a5,0x5
    ec54:	0006de63          	bgez	a3,ec70 <.L9>

0000ec58 <.LVL33>:
    ec58:	00170713          	add	a4,a4,1

0000ec5c <.LVL34>:
    ec5c:	0ff00693          	li	a3,255
    ec60:	06d70063          	beq	a4,a3,ecc0 <.L15>
    ec64:	fc0006b7          	lui	a3,0xfc000
    ec68:	fff68693          	add	a3,a3,-1 # fbffffff <_ebss+0xfbfe9f4f>
    ec6c:	00d7f7b3          	and	a5,a5,a3

0000ec70 <.L9>:
    ec70:	0ff00693          	li	a3,255
    ec74:	0037d793          	srl	a5,a5,0x3
    ec78:	00d71863          	bne	a4,a3,ec88 <.L10>
    ec7c:	00078663          	beqz	a5,ec88 <.L10>
    ec80:	004007b7          	lui	a5,0x400

0000ec84 <.LVL37>:
    ec84:	00000593          	li	a1,0

0000ec88 <.L10>:
    ec88:	7f8006b7          	lui	a3,0x7f800
    ec8c:	01771713          	sll	a4,a4,0x17

0000ec90 <.LVL39>:
    ec90:	00d77733          	and	a4,a4,a3
    ec94:	00f76733          	or	a4,a4,a5
    ec98:	01f59513          	sll	a0,a1,0x1f

0000ec9c <.LBE13>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    ec9c:	00a76533          	or	a0,a4,a0

0000eca0 <.LVL41>:
    eca0:	00008067          	ret

0000eca4 <.L12>:
  FP_TRUNC (S, D, 1, 2, R, A);
    eca4:	00100793          	li	a5,1

0000eca8 <.LVL43>:
    eca8:	00000713          	li	a4,0

0000ecac <.L24>:
  FP_PACK_SEMIRAW_S (r, R);
    ecac:	00f7f693          	and	a3,a5,15
    ecb0:	00400613          	li	a2,4
    ecb4:	f8c68ee3          	beq	a3,a2,ec50 <.L8>
    ecb8:	00478793          	add	a5,a5,4 # 400004 <_ebss+0x3e9f54>
    ecbc:	f95ff06f          	j	ec50 <.L8>

0000ecc0 <.L15>:
    ecc0:	00000793          	li	a5,0

0000ecc4 <.LVL47>:
    ecc4:	fadff06f          	j	ec70 <.L9>

0000ecc8 <__trunctfdf2>:
#include "double.h"
#include "quad.h"

DFtype
__trunctfdf2 (TFtype a)
{
    ecc8:	00c52583          	lw	a1,12(a0) # 80000c <_ebss+0x7e9f5c>
    eccc:	00852703          	lw	a4,8(a0)
    ecd0:	00452683          	lw	a3,4(a0)
    ecd4:	fe010113          	add	sp,sp,-32
    ecd8:	00052783          	lw	a5,0(a0)

0000ecdc <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_Q (A, a);
    ecdc:	00e12423          	sw	a4,8(sp)
    ece0:	00e12c23          	sw	a4,24(sp)
    ece4:	01059713          	sll	a4,a1,0x10
    ece8:	01075713          	srl	a4,a4,0x10
    ecec:	00d12223          	sw	a3,4(sp)
    ecf0:	00d12a23          	sw	a3,20(sp)
    ecf4:	01010613          	add	a2,sp,16
    ecf8:	00159693          	sll	a3,a1,0x1
    ecfc:	00b12623          	sw	a1,12(sp)
    ed00:	00e12e23          	sw	a4,28(sp)
    ed04:	00f12023          	sw	a5,0(sp)
    ed08:	00f12823          	sw	a5,16(sp)
    ed0c:	0116d693          	srl	a3,a3,0x11

0000ed10 <.LVL1>:
    ed10:	01f5d593          	srl	a1,a1,0x1f

0000ed14 <.LBB4>:
    ed14:	01c10713          	add	a4,sp,28
    ed18:	00060893          	mv	a7,a2

0000ed1c <.L2>:
    ed1c:	00072503          	lw	a0,0(a4)
    ed20:	ffc72803          	lw	a6,-4(a4)
    ed24:	ffc70713          	add	a4,a4,-4
    ed28:	00351513          	sll	a0,a0,0x3
    ed2c:	01d85813          	srl	a6,a6,0x1d
    ed30:	01056533          	or	a0,a0,a6
    ed34:	00a72223          	sw	a0,4(a4)
    ed38:	fee612e3          	bne	a2,a4,ed1c <.L2>

0000ed3c <.LVL4>:
    ed3c:	00379513          	sll	a0,a5,0x3

0000ed40 <.LBE4>:
#if _FP_W_TYPE_SIZE < 64
  FP_TRUNC (D, Q, 2, 4, R, A);
    ed40:	00168793          	add	a5,a3,1 # 7f800001 <_ebss+0x7f7e9f51>
    ed44:	01179713          	sll	a4,a5,0x11

0000ed48 <.LBB5>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    ed48:	00a12823          	sw	a0,16(sp)

0000ed4c <.LBE5>:
  FP_TRUNC (D, Q, 2, 4, R, A);
    ed4c:	01275713          	srl	a4,a4,0x12
    ed50:	1c070263          	beqz	a4,ef14 <.L3>
    ed54:	ffffc7b7          	lui	a5,0xffffc
    ed58:	40078793          	add	a5,a5,1024 # ffffc400 <_ebss+0xfffe6350>
    ed5c:	00f686b3          	add	a3,a3,a5

0000ed60 <.LVL6>:
    ed60:	7fe00793          	li	a5,2046
    ed64:	20d7c463          	blt	a5,a3,ef6c <.L23>
    ed68:	06d05463          	blez	a3,edd0 <.L5>

0000ed6c <.LBB6>:
    ed6c:	01812603          	lw	a2,24(sp)
    ed70:	01c12783          	lw	a5,28(sp)
    ed74:	01412703          	lw	a4,20(sp)

0000ed78 <.LVL8>:
    ed78:	01c65813          	srl	a6,a2,0x1c
    ed7c:	00479793          	sll	a5,a5,0x4
    ed80:	0107e7b3          	or	a5,a5,a6
    ed84:	00f12a23          	sw	a5,20(sp)

0000ed88 <.LBB8>:
    ed88:	00471793          	sll	a5,a4,0x4
    ed8c:	00a7e7b3          	or	a5,a5,a0

0000ed90 <.LVL10>:
    ed90:	01c75713          	srl	a4,a4,0x1c

0000ed94 <.LVL11>:
    ed94:	00461613          	sll	a2,a2,0x4
    ed98:	00f037b3          	snez	a5,a5

0000ed9c <.LVL12>:
    ed9c:	00c76733          	or	a4,a4,a2

0000eda0 <.LBE8>:
    eda0:	00e7e7b3          	or	a5,a5,a4

0000eda4 <.L6>:
    eda4:	01412703          	lw	a4,20(sp)

0000eda8 <.L4>:
#else
  FP_TRUNC (D, Q, 1, 2, R, A);
#endif
  FP_PACK_SEMIRAW_D (r, R);
    eda8:	0077f613          	and	a2,a5,7
    edac:	1c060663          	beqz	a2,ef78 <.L18>
    edb0:	00f7f613          	and	a2,a5,15
    edb4:	00400513          	li	a0,4
    edb8:	1ca60063          	beq	a2,a0,ef78 <.L18>

0000edbc <.LBB11>:
    edbc:	00478613          	add	a2,a5,4
    edc0:	00f63533          	sltu	a0,a2,a5
    edc4:	00a70733          	add	a4,a4,a0

0000edc8 <.LVL15>:
    edc8:	00060793          	mv	a5,a2

0000edcc <.LVL16>:
    edcc:	1ac0006f          	j	ef78 <.L18>

0000edd0 <.L5>:
  FP_TRUNC (D, Q, 2, 4, R, A);
    edd0:	fcc00793          	li	a5,-52
    edd4:	00f6da63          	bge	a3,a5,ede8 <.L7>
    edd8:	00012a23          	sw	zero,20(sp)
    eddc:	00100793          	li	a5,1

0000ede0 <.L39>:
    ede0:	00000693          	li	a3,0
    ede4:	fc1ff06f          	j	eda4 <.L6>

0000ede8 <.L7>:
    ede8:	01c12783          	lw	a5,28(sp)
    edec:	00080737          	lui	a4,0x80

0000edf0 <.LBB15>:
    edf0:	00060813          	mv	a6,a2

0000edf4 <.LBE15>:
    edf4:	00f76eb3          	or	t4,a4,a5

0000edf8 <.LBB17>:
    edf8:	03d00793          	li	a5,61
    edfc:	40d787b3          	sub	a5,a5,a3
    ee00:	4057d693          	sra	a3,a5,0x5

0000ee04 <.LVL20>:
    ee04:	01f7f713          	and	a4,a5,31

0000ee08 <.LBE17>:
    ee08:	01d12e23          	sw	t4,28(sp)

0000ee0c <.LBB18>:
    ee0c:	00000513          	li	a0,0
    ee10:	00000793          	li	a5,0

0000ee14 <.L8>:
    ee14:	00082303          	lw	t1,0(a6)
    ee18:	00150513          	add	a0,a0,1

0000ee1c <.LVL23>:
    ee1c:	00480813          	add	a6,a6,4
    ee20:	0067e7b3          	or	a5,a5,t1

0000ee24 <.LVL24>:
    ee24:	fea698e3          	bne	a3,a0,ee14 <.L8>
    ee28:	00300513          	li	a0,3

0000ee2c <.LVL25>:
    ee2c:	40d50533          	sub	a0,a0,a3
    ee30:	00269813          	sll	a6,a3,0x2
    ee34:	02071463          	bnez	a4,ee5c <.L9>

0000ee38 <.L10>:
    ee38:	01088333          	add	t1,a7,a6
    ee3c:	00032303          	lw	t1,0(t1)
    ee40:	00170713          	add	a4,a4,1 # 80001 <_ebss+0x69f51>

0000ee44 <.LVL27>:
    ee44:	00488893          	add	a7,a7,4
    ee48:	fe68ae23          	sw	t1,-4(a7)

0000ee4c <.LVL28>:
    ee4c:	fee556e3          	bge	a0,a4,ee38 <.L10>
    ee50:	00400713          	li	a4,4

0000ee54 <.LVL29>:
    ee54:	40d706b3          	sub	a3,a4,a3

0000ee58 <.LVL30>:
    ee58:	04c0006f          	j	eea4 <.L14>

0000ee5c <.L9>:
    ee5c:	02080893          	add	a7,a6,32
    ee60:	002888b3          	add	a7,a7,sp
    ee64:	ff08a883          	lw	a7,-16(a7)
    ee68:	02000e13          	li	t3,32
    ee6c:	40ee0e33          	sub	t3,t3,a4
    ee70:	01c898b3          	sll	a7,a7,t3
    ee74:	0117e7b3          	or	a5,a5,a7

0000ee78 <.LVL32>:
    ee78:	00000f13          	li	t5,0
    ee7c:	010608b3          	add	a7,a2,a6
    ee80:	41000833          	neg	a6,a6

0000ee84 <.L12>:
    ee84:	06af4463          	blt	t5,a0,eeec <.L13>
    ee88:	00251513          	sll	a0,a0,0x2
    ee8c:	02050513          	add	a0,a0,32
    ee90:	00400813          	li	a6,4
    ee94:	00250533          	add	a0,a0,sp
    ee98:	00eed733          	srl	a4,t4,a4

0000ee9c <.LVL34>:
    ee9c:	40d806b3          	sub	a3,a6,a3

0000eea0 <.LVL35>:
    eea0:	fee52823          	sw	a4,-16(a0)

0000eea4 <.L14>:
    eea4:	00400513          	li	a0,4
    eea8:	40d50533          	sub	a0,a0,a3
    eeac:	00269693          	sll	a3,a3,0x2

0000eeb0 <.LVL37>:
    eeb0:	00d60733          	add	a4,a2,a3
    eeb4:	00251693          	sll	a3,a0,0x2
    eeb8:	00800613          	li	a2,8
    eebc:	00c6ea63          	bltu	a3,a2,eed0 <.L15>
    eec0:	00072023          	sw	zero,0(a4)
    eec4:	00072223          	sw	zero,4(a4)
    eec8:	ff868693          	add	a3,a3,-8
    eecc:	00870713          	add	a4,a4,8

0000eed0 <.L15>:
    eed0:	00400613          	li	a2,4
    eed4:	00c6e463          	bltu	a3,a2,eedc <.L16>
    eed8:	00072023          	sw	zero,0(a4)

0000eedc <.L16>:
    eedc:	01012703          	lw	a4,16(sp)

0000eee0 <.LBB19>:
    eee0:	00f037b3          	snez	a5,a5

0000eee4 <.LBE19>:
    eee4:	00e7e7b3          	or	a5,a5,a4
    eee8:	ef9ff06f          	j	ede0 <.L39>

0000eeec <.L13>:
    eeec:	0008a303          	lw	t1,0(a7)
    eef0:	0048af83          	lw	t6,4(a7)
    eef4:	010882b3          	add	t0,a7,a6
    eef8:	00e35333          	srl	t1,t1,a4
    eefc:	01cf9fb3          	sll	t6,t6,t3
    ef00:	01f36333          	or	t1,t1,t6
    ef04:	0062a023          	sw	t1,0(t0)

0000ef08 <.LVL41>:
    ef08:	001f0f13          	add	t5,t5,1

0000ef0c <.LVL42>:
    ef0c:	00488893          	add	a7,a7,4
    ef10:	f75ff06f          	j	ee84 <.L12>

0000ef14 <.L3>:
    ef14:	01412603          	lw	a2,20(sp)
    ef18:	01812703          	lw	a4,24(sp)
    ef1c:	01c12803          	lw	a6,28(sp)

0000ef20 <.LBE23>:
    ef20:	00c767b3          	or	a5,a4,a2
    ef24:	0107e7b3          	or	a5,a5,a6
    ef28:	00a7e7b3          	or	a5,a5,a0
    ef2c:	00069863          	bnez	a3,ef3c <.L17>

0000ef30 <.LVL44>:
    ef30:	00f037b3          	snez	a5,a5
    ef34:	00000713          	li	a4,0
    ef38:	e71ff06f          	j	eda8 <.L4>

0000ef3c <.L17>:
    ef3c:	0a078e63          	beqz	a5,eff8 <.L24>

0000ef40 <.LBB24>:
    ef40:	00471793          	sll	a5,a4,0x4
    ef44:	01c65613          	srl	a2,a2,0x1c

0000ef48 <.LVL47>:
    ef48:	01c75713          	srl	a4,a4,0x1c

0000ef4c <.LVL48>:
    ef4c:	00481813          	sll	a6,a6,0x4

0000ef50 <.LBE25>:
    ef50:	004006b7          	lui	a3,0x400

0000ef54 <.LBB26>:
    ef54:	00f66633          	or	a2,a2,a5

0000ef58 <.LVL51>:
    ef58:	01076733          	or	a4,a4,a6

0000ef5c <.LBE26>:
    ef5c:	00d76733          	or	a4,a4,a3

0000ef60 <.LVL53>:
    ef60:	ff867793          	and	a5,a2,-8

0000ef64 <.LVL54>:
    ef64:	7ff00693          	li	a3,2047
    ef68:	e41ff06f          	j	eda8 <.L4>

0000ef6c <.L23>:
    ef6c:	00000713          	li	a4,0
    ef70:	00000793          	li	a5,0

0000ef74 <.L40>:
    ef74:	7ff00693          	li	a3,2047

0000ef78 <.L18>:
  FP_PACK_SEMIRAW_D (r, R);
    ef78:	00871613          	sll	a2,a4,0x8
    ef7c:	00065e63          	bgez	a2,ef98 <.L21>

0000ef80 <.LVL58>:
    ef80:	00168693          	add	a3,a3,1 # 400001 <_ebss+0x3e9f51>

0000ef84 <.LVL59>:
    ef84:	7ff00613          	li	a2,2047
    ef88:	06c68c63          	beq	a3,a2,f000 <.L25>
    ef8c:	ff800637          	lui	a2,0xff800
    ef90:	fff60613          	add	a2,a2,-1 # ff7fffff <_ebss+0xff7e9f4f>
    ef94:	00c77733          	and	a4,a4,a2

0000ef98 <.L21>:
    ef98:	01d71613          	sll	a2,a4,0x1d
    ef9c:	0037d793          	srl	a5,a5,0x3

0000efa0 <.LVL61>:
    efa0:	00f667b3          	or	a5,a2,a5

0000efa4 <.LVL62>:
    efa4:	7ff00613          	li	a2,2047
    efa8:	00375713          	srl	a4,a4,0x3
    efac:	00c69e63          	bne	a3,a2,efc8 <.L22>

0000efb0 <.LVL64>:
    efb0:	00e7e7b3          	or	a5,a5,a4

0000efb4 <.LVL65>:
    efb4:	00000713          	li	a4,0

0000efb8 <.LVL66>:
    efb8:	00078863          	beqz	a5,efc8 <.L22>
    efbc:	00080737          	lui	a4,0x80
    efc0:	00000793          	li	a5,0
    efc4:	00000593          	li	a1,0

0000efc8 <.L22>:
    efc8:	01469693          	sll	a3,a3,0x14
    efcc:	7ff00637          	lui	a2,0x7ff00
    efd0:	00c71713          	sll	a4,a4,0xc

0000efd4 <.LVL68>:
    efd4:	00c75713          	srl	a4,a4,0xc
    efd8:	00c6f6b3          	and	a3,a3,a2
    efdc:	01f59593          	sll	a1,a1,0x1f

0000efe0 <.LVL69>:
    efe0:	00e6e6b3          	or	a3,a3,a4
    efe4:	00b6e733          	or	a4,a3,a1

0000efe8 <.LBE28>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    efe8:	00078513          	mv	a0,a5
    efec:	00070593          	mv	a1,a4
    eff0:	02010113          	add	sp,sp,32

0000eff4 <.LVL71>:
    eff4:	00008067          	ret

0000eff8 <.L24>:
    eff8:	00000713          	li	a4,0
    effc:	f79ff06f          	j	ef74 <.L40>

0000f000 <.L25>:
    f000:	00000713          	li	a4,0

0000f004 <.LVL74>:
    f004:	00000793          	li	a5,0

0000f008 <.LVL75>:
    f008:	f91ff06f          	j	ef98 <.L21>

0000f00c <pset>:
/* ------------------------------------------------------------------ */
/* Primitives                                                           */
/* ------------------------------------------------------------------ */
static void pset(int x, int y, uint8_t r, uint8_t g, uint8_t b)
{
    if ((unsigned)x >= (unsigned)g_w || (unsigned)y >= (unsigned)g_h) return;
    f00c:	00007797          	auipc	a5,0x7
    f010:	0407a783          	lw	a5,64(a5) # 1604c <g_w>
    f014:	02f57e63          	bgeu	a0,a5,f050 <.L1>
    f018:	00007817          	auipc	a6,0x7
    f01c:	03082803          	lw	a6,48(a6) # 16048 <g_h>
    f020:	0305f863          	bgeu	a1,a6,f050 <.L1>

0000f024 <.LVL1>:
    int off = (y * g_w + x) * 4;
    f024:	02b787b3          	mul	a5,a5,a1

0000f028 <.LVL2>:
    g_buf[off+0] = r; g_buf[off+1] = g; g_buf[off+2] = b; g_buf[off+3] = 0xff;
    f028:	00007597          	auipc	a1,0x7
    f02c:	0285a583          	lw	a1,40(a1) # 16050 <g_buf>

0000f030 <.LVL3>:
    int off = (y * g_w + x) * 4;
    f030:	00a787b3          	add	a5,a5,a0
    f034:	00279793          	sll	a5,a5,0x2

0000f038 <.LVL4>:
    g_buf[off+0] = r; g_buf[off+1] = g; g_buf[off+2] = b; g_buf[off+3] = 0xff;
    f038:	00f587b3          	add	a5,a1,a5

0000f03c <.LVL5>:
    f03c:	00e78123          	sb	a4,2(a5)
    f040:	fff00713          	li	a4,-1

0000f044 <.LVL6>:
    f044:	00c78023          	sb	a2,0(a5)
    f048:	00d780a3          	sb	a3,1(a5)
    f04c:	00e781a3          	sb	a4,3(a5)

0000f050 <.L1>:
}
    f050:	00008067          	ret

0000f054 <fill_rect>:

static void fill_rect(int x0, int y0, int x1, int y1,
                      uint8_t r, uint8_t g, uint8_t b)
{
    if (x0 < 0) x0 = 0; if (y0 < 0) y0 = 0;
    f054:	00055463          	bgez	a0,f05c <.L4>
    f058:	00000513          	li	a0,0

0000f05c <.L4>:
    f05c:	0005d463          	bgez	a1,f064 <.L5>
    f060:	00000593          	li	a1,0

0000f064 <.L5>:
    if (x1 > g_w) x1 = g_w; if (y1 > g_h) y1 = g_h;
    f064:	00007897          	auipc	a7,0x7
    f068:	fe88a883          	lw	a7,-24(a7) # 1604c <g_w>
    f06c:	00088e93          	mv	t4,a7
    f070:	01165463          	bge	a2,a7,f078 <.L6>
    f074:	00060e93          	mv	t4,a2

0000f078 <.L6>:
    f078:	00007e17          	auipc	t3,0x7
    f07c:	fd0e2e03          	lw	t3,-48(t3) # 16048 <g_h>
    f080:	01c6d463          	bge	a3,t3,f088 <.L7>
    f084:	00068e13          	mv	t3,a3

0000f088 <.L7>:
    for (int y = y0; y < y1; y++)
    f088:	03158333          	mul	t1,a1,a7

0000f08c <.LBB3>:
        for (int x = x0; x < x1; x++) {
            int off = (y * g_w + x) * 4;
            g_buf[off+0]=r; g_buf[off+1]=g; g_buf[off+2]=b; g_buf[off+3]=0xff;
    f08c:	00007f17          	auipc	t5,0x7
    f090:	fc4f2f03          	lw	t5,-60(t5) # 16050 <g_buf>
    f094:	fff00f93          	li	t6,-1

0000f098 <.L8>:
    for (int y = y0; y < y1; y++)
    f098:	05c5d063          	bge	a1,t3,f0d8 <.L3>
    f09c:	00a306b3          	add	a3,t1,a0
    f0a0:	00269693          	sll	a3,a3,0x2
    f0a4:	00df06b3          	add	a3,t5,a3

0000f0a8 <.LBB6>:
        for (int x = x0; x < x1; x++) {
    f0a8:	00050613          	mv	a2,a0
    f0ac:	01c0006f          	j	f0c8 <.L11>

0000f0b0 <.L9>:
            g_buf[off+0]=r; g_buf[off+1]=g; g_buf[off+2]=b; g_buf[off+3]=0xff;
    f0b0:	00e68023          	sb	a4,0(a3)
    f0b4:	00f680a3          	sb	a5,1(a3)
    f0b8:	01068123          	sb	a6,2(a3)
    f0bc:	01f681a3          	sb	t6,3(a3)

0000f0c0 <.LBE5>:
        for (int x = x0; x < x1; x++) {
    f0c0:	00160613          	add	a2,a2,1 # 7ff00001 <_ebss+0x7fee9f51>
    f0c4:	00468693          	add	a3,a3,4

0000f0c8 <.L11>:
    f0c8:	ffd644e3          	blt	a2,t4,f0b0 <.L9>

0000f0cc <.LBE6>:
    for (int y = y0; y < y1; y++)
    f0cc:	00158593          	add	a1,a1,1
    f0d0:	01130333          	add	t1,t1,a7
    f0d4:	fc5ff06f          	j	f098 <.L8>

0000f0d8 <.L3>:
        }
}
    f0d8:	00008067          	ret

0000f0dc <clear>:

static void clear(void) { fill_rect(0, 0, g_w, g_h, 0, 0, 0); }
    f0dc:	00000813          	li	a6,0
    f0e0:	00000793          	li	a5,0
    f0e4:	00000713          	li	a4,0
    f0e8:	00007697          	auipc	a3,0x7
    f0ec:	f606a683          	lw	a3,-160(a3) # 16048 <g_h>
    f0f0:	00007617          	auipc	a2,0x7
    f0f4:	f5c62603          	lw	a2,-164(a2) # 1604c <g_w>
    f0f8:	00000593          	li	a1,0
    f0fc:	00000513          	li	a0,0
    f100:	f55ff06f          	j	f054 <fill_rect>

0000f104 <draw_line>:

/* Bresenham line */
static void draw_line(int x0, int y0, int x1, int y1,
                      uint8_t r, uint8_t g, uint8_t b)
{
    f104:	fb010113          	add	sp,sp,-80
    f108:	03412c23          	sw	s4,56(sp)
    f10c:	00060a13          	mv	s4,a2
    f110:	05212023          	sw	s2,64(sp)
    int dx = abs(x1-x0), sx = x0<x1 ? 1 : -1;
    f114:	40aa0933          	sub	s2,s4,a0
{
    f118:	03812423          	sw	s8,40(sp)
    f11c:	00078c13          	mv	s8,a5
    int dx = abs(x1-x0), sx = x0<x1 ? 1 : -1;
    f120:	41f95793          	sra	a5,s2,0x1f

0000f124 <.LVL21>:
{
    f124:	04812423          	sw	s0,72(sp)
    f128:	04912223          	sw	s1,68(sp)
    f12c:	03512a23          	sw	s5,52(sp)
    f130:	03912223          	sw	s9,36(sp)
    f134:	01b12e23          	sw	s11,28(sp)
    int dx = abs(x1-x0), sx = x0<x1 ? 1 : -1;
    f138:	0127c933          	xor	s2,a5,s2
{
    f13c:	04112623          	sw	ra,76(sp)
    f140:	03312e23          	sw	s3,60(sp)
    f144:	03612823          	sw	s6,48(sp)
    f148:	03712623          	sw	s7,44(sp)
    f14c:	03a12023          	sw	s10,32(sp)
    f150:	00050493          	mv	s1,a0
    f154:	00058413          	mv	s0,a1
    f158:	00068a93          	mv	s5,a3
    f15c:	00070613          	mv	a2,a4

0000f160 <.LVL22>:
    f160:	00080c93          	mv	s9,a6
    int dx = abs(x1-x0), sx = x0<x1 ? 1 : -1;
    f164:	40f90933          	sub	s2,s2,a5

0000f168 <.LVL23>:
    f168:	00100d93          	li	s11,1
    f16c:	01454463          	blt	a0,s4,f174 <.L14>
    f170:	fff00d93          	li	s11,-1

0000f174 <.L14>:
    int dy = -abs(y1-y0), sy = y0<y1 ? 1 : -1;
    f174:	408a89b3          	sub	s3,s5,s0
    f178:	41f9d793          	sra	a5,s3,0x1f
    f17c:	0137c9b3          	xor	s3,a5,s3
    f180:	40f989b3          	sub	s3,s3,a5
    f184:	41300bb3          	neg	s7,s3

0000f188 <.LVL25>:
    f188:	fff00d13          	li	s10,-1
    f18c:	01545463          	bge	s0,s5,f194 <.L15>
    f190:	00100d13          	li	s10,1

0000f194 <.L15>:
    int err = dx+dy;
    f194:	41390b33          	sub	s6,s2,s3

0000f198 <.L16>:
    for (;;) {
        pset(x0, y0, r, g, b);
    f198:	000c8713          	mv	a4,s9
    f19c:	000c0693          	mv	a3,s8
    f1a0:	00040593          	mv	a1,s0
    f1a4:	00048513          	mv	a0,s1
    f1a8:	00c12623          	sw	a2,12(sp)
    f1ac:	e61ff0ef          	jal	f00c <pset>

0000f1b0 <.LVL28>:
        if (x0==x1 && y0==y1) break;
    f1b0:	00c12603          	lw	a2,12(sp)
    f1b4:	01449463          	bne	s1,s4,f1bc <.L17>
    f1b8:	03540663          	beq	s0,s5,f1e4 <.L13>

0000f1bc <.L17>:
        int e2 = err<<1;
    f1bc:	001b1793          	sll	a5,s6,0x1

0000f1c0 <.LVL29>:
        if (e2 >= dy) { if (x0==x1) break; err+=dy; x0+=sx; }
    f1c0:	0177ca63          	blt	a5,s7,f1d4 <.L19>
    f1c4:	03448063          	beq	s1,s4,f1e4 <.L13>
    f1c8:	413b0b33          	sub	s6,s6,s3
    f1cc:	01b484b3          	add	s1,s1,s11
        if (e2 <= dx) { if (y0==y1) break; err+=dx; y0+=sy; }
    f1d0:	fcf944e3          	blt	s2,a5,f198 <.L16>

0000f1d4 <.L19>:
    f1d4:	01540863          	beq	s0,s5,f1e4 <.L13>
    f1d8:	012b0b33          	add	s6,s6,s2
    f1dc:	01a40433          	add	s0,s0,s10
    f1e0:	fb9ff06f          	j	f198 <.L16>

0000f1e4 <.L13>:
    }
}
    f1e4:	04c12083          	lw	ra,76(sp)
    f1e8:	04812403          	lw	s0,72(sp)

0000f1ec <.LVL35>:
    f1ec:	04412483          	lw	s1,68(sp)

0000f1f0 <.LVL36>:
    f1f0:	04012903          	lw	s2,64(sp)

0000f1f4 <.LVL37>:
    f1f4:	03c12983          	lw	s3,60(sp)
    f1f8:	03812a03          	lw	s4,56(sp)

0000f1fc <.LVL38>:
    f1fc:	03412a83          	lw	s5,52(sp)

0000f200 <.LVL39>:
    f200:	03012b03          	lw	s6,48(sp)

0000f204 <.LVL40>:
    f204:	02c12b83          	lw	s7,44(sp)

0000f208 <.LVL41>:
    f208:	02812c03          	lw	s8,40(sp)

0000f20c <.LVL42>:
    f20c:	02412c83          	lw	s9,36(sp)

0000f210 <.LVL43>:
    f210:	02012d03          	lw	s10,32(sp)

0000f214 <.LVL44>:
    f214:	01c12d83          	lw	s11,28(sp)

0000f218 <.LVL45>:
    f218:	05010113          	add	sp,sp,80
    f21c:	00008067          	ret

0000f220 <hsv2rgb>:

/* HSV [0,1] → RGB [0,255] */
static void hsv2rgb(float h, float s, float v,
                    uint8_t *r, uint8_t *g, uint8_t *b)
{
    f220:	fd010113          	add	sp,sp,-48
    f224:	02912223          	sw	s1,36(sp)
    f228:	00050493          	mv	s1,a0
    float c = v*s;
    f22c:	00060513          	mv	a0,a2

0000f230 <.LVL47>:
{
    f230:	02112623          	sw	ra,44(sp)
    f234:	02812423          	sw	s0,40(sp)
    f238:	03212023          	sw	s2,32(sp)
    f23c:	01312e23          	sw	s3,28(sp)
    f240:	00060913          	mv	s2,a2
    f244:	00078993          	mv	s3,a5
    f248:	01412c23          	sw	s4,24(sp)
    f24c:	01512a23          	sw	s5,20(sp)
    f250:	00070a13          	mv	s4,a4
    f254:	00068a93          	mv	s5,a3
    f258:	01612823          	sw	s6,16(sp)
    f25c:	01712623          	sw	s7,12(sp)
    float c = v*s;
    f260:	a89f10ef          	jal	ce8 <__mulsf3>

0000f264 <.LVL48>:
    f264:	00050413          	mv	s0,a0

0000f268 <.LVL49>:
    float x = c * (1.0f - fabsf(fmodf(h*6.0f, 2.0f) - 1.0f));
    f268:	00003597          	auipc	a1,0x3
    f26c:	e1c5a583          	lw	a1,-484(a1) # 12084 <.LC0>
    f270:	00048513          	mv	a0,s1
    f274:	a75f10ef          	jal	ce8 <__mulsf3>

0000f278 <.LVL50>:
    f278:	00003597          	auipc	a1,0x3
    f27c:	e105a583          	lw	a1,-496(a1) # 12088 <.LC1>
    f280:	00050b93          	mv	s7,a0
    f284:	e0df40ef          	jal	4090 <fmodf>

0000f288 <.LVL51>:
    f288:	00003597          	auipc	a1,0x3
    f28c:	e045a583          	lw	a1,-508(a1) # 1208c <.LC2>
    f290:	d75f10ef          	jal	1004 <__subsf3>

0000f294 <.LVL52>:
    f294:	00151593          	sll	a1,a0,0x1
    f298:	0015d593          	srl	a1,a1,0x1
    f29c:	00003517          	auipc	a0,0x3
    f2a0:	df052503          	lw	a0,-528(a0) # 1208c <.LC2>
    f2a4:	d61f10ef          	jal	1004 <__subsf3>

0000f2a8 <.LVL53>:
    f2a8:	00040593          	mv	a1,s0
    f2ac:	a3df10ef          	jal	ce8 <__mulsf3>

0000f2b0 <.LVL54>:
    float m = v-c;
    f2b0:	00040593          	mv	a1,s0
    float x = c * (1.0f - fabsf(fmodf(h*6.0f, 2.0f) - 1.0f));
    f2b4:	00050493          	mv	s1,a0

0000f2b8 <.LVL55>:
    float m = v-c;
    f2b8:	00090513          	mv	a0,s2
    f2bc:	d49f10ef          	jal	1004 <__subsf3>

0000f2c0 <.LVL56>:
    f2c0:	00050b13          	mv	s6,a0

0000f2c4 <.LVL57>:
    float r1,g1,b1;
    int hi = (int)(h*6.0f) % 6;
    f2c4:	000b8513          	mv	a0,s7

0000f2c8 <.LVL58>:
    f2c8:	96cf20ef          	jal	1434 <__fixsfsi>

0000f2cc <.LVL59>:
    f2cc:	00600793          	li	a5,6
    f2d0:	02f56633          	rem	a2,a0,a5
    f2d4:	00400793          	li	a5,4
    f2d8:	02c7e063          	bltu	a5,a2,f2f8 <.L26>
    f2dc:	00003717          	auipc	a4,0x3
    f2e0:	9fc70713          	add	a4,a4,-1540 # 11cd8 <.L28>
    f2e4:	00261613          	sll	a2,a2,0x2
    f2e8:	00e60633          	add	a2,a2,a4
    f2ec:	00062783          	lw	a5,0(a2)
    f2f0:	00e787b3          	add	a5,a5,a4
    f2f4:	00078067          	jr	a5

0000f2f8 <.L26>:
    if      (hi==0){r1=c;g1=x;b1=0;}
    else if (hi==1){r1=x;g1=c;b1=0;}
    else if (hi==2){r1=0;g1=c;b1=x;}
    else if (hi==3){r1=0;g1=x;b1=c;}
    else if (hi==4){r1=x;g1=0;b1=c;}
    else           {r1=c;g1=0;b1=x;}
    f2f8:	00048913          	mv	s2,s1

0000f2fc <.L35>:
    int hi = (int)(h*6.0f) % 6;
    f2fc:	00000493          	li	s1,0

0000f300 <.LVL61>:
    f300:	0240006f          	j	f324 <.L32>

0000f304 <.L31>:
    f304:	00040793          	mv	a5,s0
    f308:	00048413          	mv	s0,s1

0000f30c <.LVL63>:
    f30c:	00078493          	mv	s1,a5

0000f310 <.L33>:
    f310:	00000913          	li	s2,0

0000f314 <.LVL65>:
    f314:	0100006f          	j	f324 <.L32>

0000f318 <.L30>:
    f318:	00048913          	mv	s2,s1

0000f31c <.LVL67>:
    f31c:	00040493          	mv	s1,s0

0000f320 <.L36>:
    f320:	00000413          	li	s0,0

0000f324 <.L32>:
    *r = (uint8_t)((r1+m)*255.0f);
    f324:	000b0593          	mv	a1,s6
    f328:	00040513          	mv	a0,s0
    f32c:	a6cf10ef          	jal	598 <__addsf3>

0000f330 <.LVL70>:
    f330:	00003597          	auipc	a1,0x3
    f334:	d605a583          	lw	a1,-672(a1) # 12090 <.LC3>
    f338:	9b1f10ef          	jal	ce8 <__mulsf3>

0000f33c <.LVL71>:
    f33c:	968f20ef          	jal	14a4 <__fixunssfsi>

0000f340 <.LVL72>:
    f340:	00aa8023          	sb	a0,0(s5)
    *g = (uint8_t)((g1+m)*255.0f);
    f344:	000b0593          	mv	a1,s6
    f348:	00048513          	mv	a0,s1
    f34c:	a4cf10ef          	jal	598 <__addsf3>

0000f350 <.LVL73>:
    f350:	00003597          	auipc	a1,0x3
    f354:	d405a583          	lw	a1,-704(a1) # 12090 <.LC3>
    f358:	991f10ef          	jal	ce8 <__mulsf3>

0000f35c <.LVL74>:
    f35c:	948f20ef          	jal	14a4 <__fixunssfsi>

0000f360 <.LVL75>:
    f360:	00aa0023          	sb	a0,0(s4)
    *b = (uint8_t)((b1+m)*255.0f);
    f364:	000b0593          	mv	a1,s6
    f368:	00090513          	mv	a0,s2
    f36c:	a2cf10ef          	jal	598 <__addsf3>

0000f370 <.LVL76>:
    f370:	00003597          	auipc	a1,0x3
    f374:	d205a583          	lw	a1,-736(a1) # 12090 <.LC3>
    f378:	971f10ef          	jal	ce8 <__mulsf3>

0000f37c <.LVL77>:
    f37c:	928f20ef          	jal	14a4 <__fixunssfsi>

0000f380 <.LVL78>:
    f380:	00a98023          	sb	a0,0(s3)
}
    f384:	02c12083          	lw	ra,44(sp)
    f388:	02812403          	lw	s0,40(sp)

0000f38c <.LVL79>:
    f38c:	02412483          	lw	s1,36(sp)

0000f390 <.LVL80>:
    f390:	02012903          	lw	s2,32(sp)

0000f394 <.LVL81>:
    f394:	01c12983          	lw	s3,28(sp)

0000f398 <.LVL82>:
    f398:	01812a03          	lw	s4,24(sp)

0000f39c <.LVL83>:
    f39c:	01412a83          	lw	s5,20(sp)

0000f3a0 <.LVL84>:
    f3a0:	01012b03          	lw	s6,16(sp)

0000f3a4 <.LVL85>:
    f3a4:	00c12b83          	lw	s7,12(sp)

0000f3a8 <.LVL86>:
    f3a8:	03010113          	add	sp,sp,48
    f3ac:	00008067          	ret

0000f3b0 <.L29>:
    int hi = (int)(h*6.0f) % 6;
    f3b0:	00040913          	mv	s2,s0

0000f3b4 <.LVL88>:
    f3b4:	f6dff06f          	j	f320 <.L36>

0000f3b8 <.L27>:
    f3b8:	00040913          	mv	s2,s0

0000f3bc <.LVL90>:
    f3bc:	00048413          	mv	s0,s1

0000f3c0 <.LVL91>:
    f3c0:	f3dff06f          	j	f2fc <.L35>

0000f3c4 <sin_tab_init>:
}

/* Sin lookup table [-127,127], 256 entries for one full period */
static int8_t sin_tab[256];
static void sin_tab_init(void)
{
    f3c4:	fe010113          	add	sp,sp,-32
    f3c8:	00812c23          	sw	s0,24(sp)
    f3cc:	00912a23          	sw	s1,20(sp)
    f3d0:	01312623          	sw	s3,12(sp)
    f3d4:	01412423          	sw	s4,8(sp)
    f3d8:	01512223          	sw	s5,4(sp)
    f3dc:	01612023          	sw	s6,0(sp)
    f3e0:	00112e23          	sw	ra,28(sp)
    f3e4:	01212823          	sw	s2,16(sp)

0000f3e8 <.LBB9>:
    for (int i = 0; i < 256; i++)
    f3e8:	00000413          	li	s0,0
        sin_tab[i] = (int8_t)(sinf(i * 2.0f * PI / 256.0f) * 127.0f);
    f3ec:	00003b17          	auipc	s6,0x3
    f3f0:	ca8b2b03          	lw	s6,-856(s6) # 12094 <.LC4>
    f3f4:	00003a97          	auipc	s5,0x3
    f3f8:	ca4aaa83          	lw	s5,-860(s5) # 12098 <.LC5>
    f3fc:	00007a17          	auipc	s4,0x7
    f400:	b4ca0a13          	add	s4,s4,-1204 # 15f48 <sin_tab>
    f404:	00003997          	auipc	s3,0x3
    f408:	c989a983          	lw	s3,-872(s3) # 1209c <.LC6>
    for (int i = 0; i < 256; i++)
    f40c:	10000493          	li	s1,256

0000f410 <.L38>:
        sin_tab[i] = (int8_t)(sinf(i * 2.0f * PI / 256.0f) * 127.0f);
    f410:	00040513          	mv	a0,s0
    f414:	8f8f20ef          	jal	150c <__floatsisf>

0000f418 <.LVL94>:
    f418:	00050593          	mv	a1,a0
    f41c:	97cf10ef          	jal	598 <__addsf3>

0000f420 <.LVL95>:
    f420:	000b0593          	mv	a1,s6
    f424:	8c5f10ef          	jal	ce8 <__mulsf3>

0000f428 <.LVL96>:
    f428:	000a8593          	mv	a1,s5
    f42c:	8bdf10ef          	jal	ce8 <__mulsf3>

0000f430 <.LVL97>:
    f430:	cd9f40ef          	jal	4108 <__GI_sinf>

0000f434 <.LVL98>:
    f434:	00098593          	mv	a1,s3
    f438:	8b1f10ef          	jal	ce8 <__mulsf3>

0000f43c <.LVL99>:
    f43c:	01440933          	add	s2,s0,s4
    f440:	ff5f10ef          	jal	1434 <__fixsfsi>

0000f444 <.LVL100>:
    f444:	00a90023          	sb	a0,0(s2)
    for (int i = 0; i < 256; i++)
    f448:	00140413          	add	s0,s0,1
    f44c:	fc9412e3          	bne	s0,s1,f410 <.L38>

0000f450 <.LBE9>:
}
    f450:	01c12083          	lw	ra,28(sp)
    f454:	01812403          	lw	s0,24(sp)

0000f458 <.LVL102>:
    f458:	01412483          	lw	s1,20(sp)
    f45c:	01012903          	lw	s2,16(sp)
    f460:	00c12983          	lw	s3,12(sp)
    f464:	00812a03          	lw	s4,8(sp)
    f468:	00412a83          	lw	s5,4(sp)
    f46c:	00012b03          	lw	s6,0(sp)
    f470:	02010113          	add	sp,sp,32
    f474:	00008067          	ret

0000f478 <main>:

/* ================================================================== */
/* main                                                                 */
/* ================================================================== */
int main(int argc, char *argv[])
{
    f478:	ea010113          	add	sp,sp,-352
    f47c:	14112e23          	sw	ra,348(sp)
    f480:	14812c23          	sw	s0,344(sp)
    f484:	14912a23          	sw	s1,340(sp)
    f488:	15212823          	sw	s2,336(sp)
    f48c:	15312623          	sw	s3,332(sp)
    f490:	15412423          	sw	s4,328(sp)
    f494:	15512223          	sw	s5,324(sp)
    f498:	15612023          	sw	s6,320(sp)
    f49c:	13712e23          	sw	s7,316(sp)
    f4a0:	13812c23          	sw	s8,312(sp)
    f4a4:	13912a23          	sw	s9,308(sp)
    f4a8:	13a12823          	sw	s10,304(sp)
    f4ac:	13b12623          	sw	s11,300(sp)
    if (argc < 2) {
    f4b0:	00100793          	li	a5,1
    f4b4:	04a7c863          	blt	a5,a0,f504 <.L42>
        printf("Usage: framebuff <1-10>\n"
    f4b8:	00003517          	auipc	a0,0x3
    f4bc:	83450513          	add	a0,a0,-1996 # 11cec <.LC8>

0000f4c0 <.L123>:
               "  5  3D cube            10  Lissajous\n");
        return 1;
    }

    int pat = atoi(argv[1]);
    if (pat < 1 || pat > 10) { printf("Pattern must be 1-10\n"); return 1; }
    f4c0:	b4cf20ef          	jal	180c <puts>

0000f4c4 <.L43>:
        return 1;
    f4c4:	00100513          	li	a0,1

0000f4c8 <.L41>:
    write(fd, g_buf, size);

    free(g_buf);
    close(fd);
    return 0;
}
    f4c8:	15c12083          	lw	ra,348(sp)
    f4cc:	15812403          	lw	s0,344(sp)
    f4d0:	15412483          	lw	s1,340(sp)
    f4d4:	15012903          	lw	s2,336(sp)
    f4d8:	14c12983          	lw	s3,332(sp)
    f4dc:	14812a03          	lw	s4,328(sp)
    f4e0:	14412a83          	lw	s5,324(sp)
    f4e4:	14012b03          	lw	s6,320(sp)
    f4e8:	13c12b83          	lw	s7,316(sp)
    f4ec:	13812c03          	lw	s8,312(sp)
    f4f0:	13412c83          	lw	s9,308(sp)
    f4f4:	13012d03          	lw	s10,304(sp)
    f4f8:	12c12d83          	lw	s11,300(sp)
    f4fc:	16010113          	add	sp,sp,352
    f500:	00008067          	ret

0000f504 <.L42>:
    int pat = atoi(argv[1]);
    f504:	0045a503          	lw	a0,4(a1)

0000f508 <.LVL107>:
    f508:	978f40ef          	jal	3680 <__GI_atoi>

0000f50c <.LVL108>:
    f50c:	00a12423          	sw	a0,8(sp)

0000f510 <.LVL109>:
    if (pat < 1 || pat > 10) { printf("Pattern must be 1-10\n"); return 1; }
    f510:	fff50713          	add	a4,a0,-1
    f514:	00900793          	li	a5,9
    f518:	00e7f863          	bgeu	a5,a4,f528 <.L44>
    f51c:	00003517          	auipc	a0,0x3
    f520:	8bc50513          	add	a0,a0,-1860 # 11dd8 <.LC9>

0000f524 <.LVL110>:
    f524:	f9dff06f          	j	f4c0 <.L123>

0000f528 <.L44>:
    int fd = open("/dev/fb0", O_RDWR);
    f528:	00200593          	li	a1,2
    f52c:	00003517          	auipc	a0,0x3
    f530:	8c450513          	add	a0,a0,-1852 # 11df0 <.LC10>

0000f534 <.LVL112>:
    f534:	a00f20ef          	jal	1734 <__GI_open>

0000f538 <.LVL113>:
    f538:	00a12023          	sw	a0,0(sp)

0000f53c <.LVL114>:
    if (fd < 0) { printf("framebuff: open /dev/fb0 failed\n"); return 1; }
    f53c:	00055863          	bgez	a0,f54c <.L46>
    f540:	00003517          	auipc	a0,0x3
    f544:	8bc50513          	add	a0,a0,-1860 # 11dfc <.LC11>

0000f548 <.LVL115>:
    f548:	f79ff06f          	j	f4c0 <.L123>

0000f54c <.L46>:
    if (ioctl(fd, FBIOGET_VSCREENINFO, &vinfo) < 0) {
    f54c:	000045b7          	lui	a1,0x4
    f550:	08010613          	add	a2,sp,128
    f554:	60058593          	add	a1,a1,1536 # 4600 <__GI_config_read+0x3c>
    f558:	93cf20ef          	jal	1694 <__GI_ioctl>

0000f55c <.LVL117>:
    f55c:	00055e63          	bgez	a0,f578 <.L47>
        printf("framebuff: ioctl failed\n"); close(fd); return 1;
    f560:	00003517          	auipc	a0,0x3
    f564:	8bc50513          	add	a0,a0,-1860 # 11e1c <.LC12>

0000f568 <.L124>:
    if (!g_buf) { printf("framebuff: malloc failed\n"); close(fd); return 1; }
    f568:	aa4f20ef          	jal	180c <puts>

0000f56c <.LVL118>:
    f56c:	00012503          	lw	a0,0(sp)
    f570:	8f0f20ef          	jal	1660 <__GI_close>

0000f574 <.LVL119>:
    f574:	f51ff06f          	j	f4c4 <.L43>

0000f578 <.L47>:
    g_w = (int)vinfo.xres;
    f578:	08012d03          	lw	s10,128(sp)
    g_h = (int)vinfo.yres;
    f57c:	08412d83          	lw	s11,132(sp)
    g_w = (int)vinfo.xres;
    f580:	00007797          	auipc	a5,0x7
    f584:	acc78793          	add	a5,a5,-1332 # 1604c <g_w>
    f588:	01a7a023          	sw	s10,0(a5)
    g_h = (int)vinfo.yres;
    f58c:	00007797          	auipc	a5,0x7
    f590:	abc78793          	add	a5,a5,-1348 # 16048 <g_h>
    f594:	01b7a023          	sw	s11,0(a5)

0000f598 <.LVL120>:
    int size = g_w * g_h * 4;
    f598:	03bd07b3          	mul	a5,s10,s11
    f59c:	00279793          	sll	a5,a5,0x2

0000f5a0 <.LVL121>:
    g_buf = malloc(size);
    f5a0:	00078513          	mv	a0,a5
    int size = g_w * g_h * 4;
    f5a4:	00f12223          	sw	a5,4(sp)
    g_buf = malloc(size);
    f5a8:	d21f30ef          	jal	32c8 <malloc>

0000f5ac <.LVL122>:
    f5ac:	00007797          	auipc	a5,0x7
    f5b0:	aa478793          	add	a5,a5,-1372 # 16050 <g_buf>
    f5b4:	00a7a023          	sw	a0,0(a5)
    if (!g_buf) { printf("framebuff: malloc failed\n"); close(fd); return 1; }
    f5b8:	00051863          	bnez	a0,f5c8 <.L48>
    f5bc:	00003517          	auipc	a0,0x3
    f5c0:	87850513          	add	a0,a0,-1928 # 11e34 <.LC13>
    f5c4:	fa5ff06f          	j	f568 <.L124>

0000f5c8 <.L48>:
    switch (pat) {
    f5c8:	00812783          	lw	a5,8(sp)
    f5cc:	00800713          	li	a4,8
    f5d0:	ffe78793          	add	a5,a5,-2
    f5d4:	02f76063          	bltu	a4,a5,f5f4 <.L49>
    f5d8:	00003717          	auipc	a4,0x3
    f5dc:	89870713          	add	a4,a4,-1896 # 11e70 <.L51>
    f5e0:	00279793          	sll	a5,a5,0x2
    f5e4:	00e787b3          	add	a5,a5,a4
    f5e8:	0007a783          	lw	a5,0(a5)
    f5ec:	00e787b3          	add	a5,a5,a4
    f5f0:	00078067          	jr	a5

0000f5f4 <.L49>:
    int w=g_w, h=g_h, y1=h*7/12, y2=h*8/12;
    f5f4:	00700913          	li	s2,7
    f5f8:	032d8933          	mul	s2,s11,s2
    f5fc:	00c00793          	li	a5,12
    f600:	003d9493          	sll	s1,s11,0x3
    f604:	00003417          	auipc	s0,0x3
    f608:	9dc40413          	add	s0,s0,-1572 # 11fe0 <top.5>
    f60c:	00003997          	auipc	s3,0x3
    f610:	9bc98993          	add	s3,s3,-1604 # 11fc8 <mid.4>
    f614:	00003b17          	auipc	s6,0x3
    f618:	9e1b0b13          	add	s6,s6,-1567 # 11ff5 <.LLST23+0x5>
    f61c:	00000a13          	li	s4,0

0000f620 <.LBB76>:
        int x0 = w*i/7, x1 = w*(i+1)/7;
    f620:	00700a93          	li	s5,7

0000f624 <.LBE76>:
    int w=g_w, h=g_h, y1=h*7/12, y2=h*8/12;
    f624:	02f94933          	div	s2,s2,a5

0000f628 <.LVL124>:
    f628:	02f4c4b3          	div	s1,s1,a5

0000f62c <.L60>:
        fill_rect(x0, 0,  x1, y1, top[i][0], top[i][1], top[i][2]);
    f62c:	00244803          	lbu	a6,2(s0)
    f630:	00144783          	lbu	a5,1(s0)
    f634:	00044703          	lbu	a4,0(s0)
    f638:	00090693          	mv	a3,s2
    f63c:	00000593          	li	a1,0

0000f640 <.LBE78>:
    for (int i = 0; i < 7; i++) {
    f640:	00340413          	add	s0,s0,3
    f644:	00398993          	add	s3,s3,3

0000f648 <.LBB79>:
        int x0 = w*i/7, x1 = w*(i+1)/7;
    f648:	035a4533          	div	a0,s4,s5

0000f64c <.LVL126>:
    f64c:	01aa0a33          	add	s4,s4,s10
    f650:	035a4633          	div	a2,s4,s5

0000f654 <.LVL127>:
        fill_rect(x0, 0,  x1, y1, top[i][0], top[i][1], top[i][2]);
    f654:	00a12623          	sw	a0,12(sp)
    f658:	00c12823          	sw	a2,16(sp)
    f65c:	9f9ff0ef          	jal	f054 <fill_rect>

0000f660 <.LVL128>:
        fill_rect(x0, y1, x1, y2, mid[i][0], mid[i][1], mid[i][2]);
    f660:	fff9c803          	lbu	a6,-1(s3)
    f664:	ffe9c783          	lbu	a5,-2(s3)
    f668:	ffd9c703          	lbu	a4,-3(s3)
    f66c:	01012603          	lw	a2,16(sp)
    f670:	00c12503          	lw	a0,12(sp)
    f674:	00048693          	mv	a3,s1
    f678:	00090593          	mv	a1,s2
    f67c:	9d9ff0ef          	jal	f054 <fill_rect>

0000f680 <.LBE79>:
    for (int i = 0; i < 7; i++) {
    f680:	fa8b16e3          	bne	s6,s0,f62c <.L60>

0000f684 <.LBE80>:
    int bw = w/4;
    f684:	00400413          	li	s0,4
    f688:	028d4433          	div	s0,s10,s0

0000f68c <.LVL130>:
    fill_rect(0,    y2, bw,   h,  0,  0,128);
    f68c:	08000813          	li	a6,128
    f690:	00000793          	li	a5,0
    f694:	00000713          	li	a4,0
    f698:	000d8693          	mv	a3,s11
    f69c:	00048593          	mv	a1,s1
    f6a0:	00000513          	li	a0,0
    f6a4:	00040613          	mv	a2,s0
    f6a8:	9adff0ef          	jal	f054 <fill_rect>

0000f6ac <.LVL131>:
    fill_rect(bw,   y2, bw*2, h, 255,255,255);
    f6ac:	00141913          	sll	s2,s0,0x1

0000f6b0 <.LVL132>:
    f6b0:	00040513          	mv	a0,s0
    f6b4:	0ff00813          	li	a6,255
    f6b8:	0ff00793          	li	a5,255
    f6bc:	0ff00713          	li	a4,255
    f6c0:	000d8693          	mv	a3,s11
    f6c4:	00090613          	mv	a2,s2
    f6c8:	00048593          	mv	a1,s1
    f6cc:	989ff0ef          	jal	f054 <fill_rect>

0000f6d0 <.LVL133>:
    fill_rect(bw*2, y2, bw*3, h,  75,  0,128);
    f6d0:	00300793          	li	a5,3
    f6d4:	02f40433          	mul	s0,s0,a5

0000f6d8 <.LVL134>:
    f6d8:	08000813          	li	a6,128
    f6dc:	00000793          	li	a5,0
    f6e0:	04b00713          	li	a4,75
    f6e4:	000d8693          	mv	a3,s11
    f6e8:	00048593          	mv	a1,s1
    f6ec:	00090513          	mv	a0,s2
    f6f0:	00040613          	mv	a2,s0
    f6f4:	961ff0ef          	jal	f054 <fill_rect>

0000f6f8 <.LVL135>:
    fill_rect(bw*3, y2, w,    h,  0,  0,  0);
    f6f8:	00000813          	li	a6,0
    f6fc:	00000793          	li	a5,0
    f700:	00000713          	li	a4,0
    f704:	000d8693          	mv	a3,s11
    f708:	000d0613          	mv	a2,s10
    f70c:	00048593          	mv	a1,s1
    f710:	00040513          	mv	a0,s0
    f714:	941ff0ef          	jal	f054 <fill_rect>

0000f718 <.L61>:
    printf("framebuff: %s rendered (%dx%d)\n", names[pat], g_w, g_h);
    f718:	00812783          	lw	a5,8(sp)
    f71c:	00003717          	auipc	a4,0x3
    f720:	d5470713          	add	a4,a4,-684 # 12470 <names.6>
    f724:	00002517          	auipc	a0,0x2
    f728:	72c50513          	add	a0,a0,1836 # 11e50 <.LC23>
    f72c:	00279793          	sll	a5,a5,0x2
    f730:	00f707b3          	add	a5,a4,a5
    f734:	00007717          	auipc	a4,0x7
    f738:	91470713          	add	a4,a4,-1772 # 16048 <g_h>
    f73c:	00072683          	lw	a3,0(a4)
    f740:	00007717          	auipc	a4,0x7
    f744:	90c70713          	add	a4,a4,-1780 # 1604c <g_w>
    f748:	00072603          	lw	a2,0(a4)
    f74c:	0007a583          	lw	a1,0(a5)
    f750:	91cf20ef          	jal	186c <__GI_printf>

0000f754 <.LVL137>:
    lseek(fd, 0, SEEK_SET);
    f754:	00012503          	lw	a0,0(sp)
    f758:	00000613          	li	a2,0
    f75c:	00000593          	li	a1,0
    f760:	f85f10ef          	jal	16e4 <__GI_lseek>

0000f764 <.LVL138>:
    write(fd, g_buf, size);
    f764:	00007797          	auipc	a5,0x7
    f768:	8ec78793          	add	a5,a5,-1812 # 16050 <g_buf>
    f76c:	00412603          	lw	a2,4(sp)
    f770:	0007a583          	lw	a1,0(a5)
    f774:	00012503          	lw	a0,0(sp)
    f778:	00078413          	mv	s0,a5
    f77c:	868f20ef          	jal	17e4 <__GI_write>

0000f780 <.LVL139>:
    free(g_buf);
    f780:	00042503          	lw	a0,0(s0)
    f784:	d5df30ef          	jal	34e0 <free>

0000f788 <.LVL140>:
    close(fd);
    f788:	00012503          	lw	a0,0(sp)
    f78c:	ed5f10ef          	jal	1660 <__GI_close>

0000f790 <.LVL141>:
    return 0;
    f790:	00000513          	li	a0,0
    f794:	d35ff06f          	j	f4c8 <.L41>

0000f798 <.L62>:
            hsv2rgb((float)x/g_w, 1.0f, 1.0f - (float)y/g_h, &r,&g,&b);
    f798:	000b0513          	mv	a0,s6
    f79c:	d71f10ef          	jal	150c <__floatsisf>

0000f7a0 <.LVL143>:
    f7a0:	00050493          	mv	s1,a0
    f7a4:	000d8513          	mv	a0,s11
    f7a8:	d65f10ef          	jal	150c <__floatsisf>

0000f7ac <.LVL144>:
    f7ac:	00050593          	mv	a1,a0
    f7b0:	00048513          	mv	a0,s1
    f7b4:	a04f10ef          	jal	9b8 <__divsf3>

0000f7b8 <.LVL145>:
    f7b8:	00050593          	mv	a1,a0
    f7bc:	00090513          	mv	a0,s2
    f7c0:	845f10ef          	jal	1004 <__subsf3>

0000f7c4 <.LVL146>:
    f7c4:	00a12623          	sw	a0,12(sp)
    f7c8:	00040513          	mv	a0,s0
    f7cc:	d41f10ef          	jal	150c <__floatsisf>

0000f7d0 <.LVL147>:
    f7d0:	00050493          	mv	s1,a0
    f7d4:	000d0513          	mv	a0,s10
    f7d8:	d35f10ef          	jal	150c <__floatsisf>

0000f7dc <.LVL148>:
    f7dc:	00050593          	mv	a1,a0
    f7e0:	00048513          	mv	a0,s1
    f7e4:	9d4f10ef          	jal	9b8 <__divsf3>

0000f7e8 <.LVL149>:
    f7e8:	00c12603          	lw	a2,12(sp)
    f7ec:	00098793          	mv	a5,s3
    f7f0:	000a0713          	mv	a4,s4
    f7f4:	000a8693          	mv	a3,s5
    f7f8:	00090593          	mv	a1,s2
    f7fc:	a25ff0ef          	jal	f220 <hsv2rgb>

0000f800 <.LVL150>:
            pset(x, y, r, g, b);
    f800:	06014703          	lbu	a4,96(sp)
    f804:	04014683          	lbu	a3,64(sp)
    f808:	03f14603          	lbu	a2,63(sp)
    f80c:	00040513          	mv	a0,s0
    f810:	000b0593          	mv	a1,s6
    f814:	ff8ff0ef          	jal	f00c <pset>

0000f818 <.LBE84>:
        for (int x = 0; x < g_w; x++) {
    f818:	00140413          	add	s0,s0,1

0000f81c <.L63>:
    f81c:	f7a44ee3          	blt	s0,s10,f798 <.L62>

0000f820 <.LBE83>:
    for (int y = 0; y < g_h; y++)
    f820:	001b0b13          	add	s6,s6,1

0000f824 <.L59>:
    f824:	efbb5ae3          	bge	s6,s11,f718 <.L61>

0000f828 <.LBB86>:
        for (int x = 0; x < g_w; x++) {
    f828:	00000413          	li	s0,0
    f82c:	ff1ff06f          	j	f81c <.L63>

0000f830 <.L108>:
    switch (pat) {
    f830:	00000b13          	li	s6,0

0000f834 <.LBB85>:
            hsv2rgb((float)x/g_w, 1.0f, 1.0f - (float)y/g_h, &r,&g,&b);
    f834:	06010993          	add	s3,sp,96
    f838:	04010a13          	add	s4,sp,64
    f83c:	03f10a93          	add	s5,sp,63
    f840:	00003917          	auipc	s2,0x3
    f844:	84c92903          	lw	s2,-1972(s2) # 1208c <.LC2>
    f848:	fddff06f          	j	f824 <.L59>

0000f84c <.L71>:
        int32_t cim = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
    f84c:	000d8613          	mv	a2,s11
    f850:	00000693          	li	a3,0
    f854:	00090513          	mv	a0,s2
    f858:	000a0593          	mv	a1,s4
    f85c:	8c5f00ef          	jal	120 <__divdi3>

0000f860 <.LBB94>:
                hsv2rgb((float)iter/MAXITER, 0.9f, 1.0f, &r,&g,&b);
    f860:	06010793          	add	a5,sp,96
    f864:	00f12623          	sw	a5,12(sp)
    f868:	04010793          	add	a5,sp,64

0000f86c <.LBE94>:
        int32_t cim = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
    f86c:	01550cb3          	add	s9,a0,s5

0000f870 <.LBB110>:
        for (int px = 0; px < g_w; px++) {
    f870:	00000993          	li	s3,0
    f874:	00000b93          	li	s7,0
    f878:	00000493          	li	s1,0

0000f87c <.LBB105>:
                if (zr2+zi2 > ESCAPE) break;
    f87c:	00004c37          	lui	s8,0x4

0000f880 <.LBB98>:
                hsv2rgb((float)iter/MAXITER, 0.9f, 1.0f, &r,&g,&b);
    f880:	00f12823          	sw	a5,16(sp)

0000f884 <.L65>:
        for (int px = 0; px < g_w; px++) {
    f884:	03a4c463          	blt	s1,s10,f8ac <.L70>

0000f888 <.LBE110>:
    for (int py = 0; py < g_h; py++) {
    f888:	000037b7          	lui	a5,0x3
    f88c:	80078793          	add	a5,a5,-2048 # 2800 <.L47+0x8>
    f890:	00f907b3          	add	a5,s2,a5
    f894:	0127b733          	sltu	a4,a5,s2
    f898:	00140413          	add	s0,s0,1
    f89c:	00078913          	mv	s2,a5
    f8a0:	01470a33          	add	s4,a4,s4

0000f8a4 <.L58>:
    f8a4:	fbb444e3          	blt	s0,s11,f84c <.L71>
    f8a8:	e71ff06f          	j	f718 <.L61>

0000f8ac <.L70>:
            int32_t cre = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
    f8ac:	000d0613          	mv	a2,s10
    f8b0:	00000693          	li	a3,0
    f8b4:	00098513          	mv	a0,s3
    f8b8:	000b8593          	mv	a1,s7
    f8bc:	865f00ef          	jal	120 <__divdi3>

0000f8c0 <.LVL162>:
    f8c0:	016505b3          	add	a1,a0,s6

0000f8c4 <.LBB99>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FP);
    f8c4:	00000613          	li	a2,0

0000f8c8 <.LBE99>:
            int iter=0;
    f8c8:	00000513          	li	a0,0

0000f8cc <.LBB100>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FP);
    f8cc:	00000793          	li	a5,0
    f8d0:	00000313          	li	t1,0
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FP);
    f8d4:	00000693          	li	a3,0
    f8d8:	00000893          	li	a7,0
    f8dc:	00000713          	li	a4,0

0000f8e0 <.LBE100>:
            while (iter < MAXITER) {
    f8e0:	05000813          	li	a6,80

0000f8e4 <.L66>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FP-1)) + cim;
    f8e4:	02f70733          	mul	a4,a4,a5
                int32_t tmp = zr2 - zi2 + cre;
    f8e8:	40c686b3          	sub	a3,a3,a2
                iter++;
    f8ec:	00150513          	add	a0,a0,1

0000f8f0 <.LVL165>:
                int32_t tmp = zr2 - zi2 + cre;
    f8f0:	00b686b3          	add	a3,a3,a1

0000f8f4 <.LVL166>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FP-1)) + cim;
    f8f4:	03130333          	mul	t1,t1,a7
    f8f8:	02f88633          	mul	a2,a7,a5
    f8fc:	00670733          	add	a4,a4,t1
    f900:	02f8b7b3          	mulhu	a5,a7,a5
    f904:	00f707b3          	add	a5,a4,a5
    f908:	01579793          	sll	a5,a5,0x15
    f90c:	00b65713          	srl	a4,a2,0xb
    f910:	00e7e733          	or	a4,a5,a4
    f914:	00ec87b3          	add	a5,s9,a4

0000f918 <.LBE101>:
            while (iter < MAXITER) {
    f918:	03051e63          	bne	a0,a6,f954 <.L68>
            if (iter == MAXITER) { pset(px,py, 0,0,0); }
    f91c:	00000713          	li	a4,0
    f920:	00000693          	li	a3,0

0000f924 <.LVL168>:
    f924:	00000613          	li	a2,0

0000f928 <.L125>:
                pset(px, py, r, g, b);
    f928:	00048513          	mv	a0,s1
    f92c:	00040593          	mv	a1,s0
    f930:	edcff0ef          	jal	f00c <pset>

0000f934 <.LBE102>:
        for (int px = 0; px < g_w; px++) {
    f934:	000047b7          	lui	a5,0x4
    f938:	80078793          	add	a5,a5,-2048 # 3800 <.L20+0x4>
    f93c:	00f987b3          	add	a5,s3,a5
    f940:	0137b733          	sltu	a4,a5,s3
    f944:	00148493          	add	s1,s1,1
    f948:	00078993          	mv	s3,a5
    f94c:	01770bb3          	add	s7,a4,s7
    f950:	f35ff06f          	j	f884 <.L65>

0000f954 <.L68>:
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FP);
    f954:	02d68633          	mul	a2,a3,a3
    f958:	00068893          	mv	a7,a3
    f95c:	41f6d713          	sra	a4,a3,0x1f
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FP);
    f960:	41f7d313          	sra	t1,a5,0x1f
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FP);
    f964:	02d696b3          	mulh	a3,a3,a3

0000f968 <.LVL173>:
    f968:	00c65613          	srl	a2,a2,0xc
    f96c:	01469693          	sll	a3,a3,0x14
    f970:	00c6e6b3          	or	a3,a3,a2

0000f974 <.LVL174>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FP);
    f974:	02f78e33          	mul	t3,a5,a5
    f978:	02f79633          	mulh	a2,a5,a5

0000f97c <.LVL175>:
    f97c:	00ce5e13          	srl	t3,t3,0xc
    f980:	01461613          	sll	a2,a2,0x14
    f984:	01c66633          	or	a2,a2,t3

0000f988 <.LVL176>:
                if (zr2+zi2 > ESCAPE) break;
    f988:	00c68e33          	add	t3,a3,a2

0000f98c <.LVL177>:
    f98c:	f5cc5ce3          	bge	s8,t3,f8e4 <.L66>

0000f990 <.LBB104>:
                hsv2rgb((float)iter/MAXITER, 0.9f, 1.0f, &r,&g,&b);
    f990:	b7df10ef          	jal	150c <__floatsisf>

0000f994 <.LVL178>:
    f994:	00002797          	auipc	a5,0x2
    f998:	71478793          	add	a5,a5,1812 # 120a8 <.LC15>
    f99c:	0007a583          	lw	a1,0(a5)
    f9a0:	818f10ef          	jal	9b8 <__divsf3>

0000f9a4 <.LVL179>:
    f9a4:	00002617          	auipc	a2,0x2
    f9a8:	6e860613          	add	a2,a2,1768 # 1208c <.LC2>
    f9ac:	00002597          	auipc	a1,0x2
    f9b0:	6f858593          	add	a1,a1,1784 # 120a4 <.LC14>
    f9b4:	01012703          	lw	a4,16(sp)
    f9b8:	00062603          	lw	a2,0(a2)
    f9bc:	00c12783          	lw	a5,12(sp)
    f9c0:	0005a583          	lw	a1,0(a1)
    f9c4:	03f10693          	add	a3,sp,63
    f9c8:	859ff0ef          	jal	f220 <hsv2rgb>

0000f9cc <.LVL180>:
                pset(px, py, r, g, b);
    f9cc:	06014703          	lbu	a4,96(sp)
    f9d0:	04014683          	lbu	a3,64(sp)
    f9d4:	03f14603          	lbu	a2,63(sp)
    f9d8:	f51ff06f          	j	f928 <.L125>

0000f9dc <.L109>:
        int32_t cim = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
    f9dc:	fffffab7          	lui	s5,0xfffff

0000f9e0 <.LBB108>:
            int32_t cre = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
    f9e0:	ffffeb37          	lui	s6,0xffffe

0000f9e4 <.LBE108>:
    switch (pat) {
    f9e4:	00000913          	li	s2,0
    f9e8:	00000a13          	li	s4,0
    f9ec:	00000413          	li	s0,0

0000f9f0 <.LBB115>:
        int32_t cim = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
    f9f0:	c00a8a93          	add	s5,s5,-1024 # ffffec00 <_ebss+0xfffe8b50>

0000f9f4 <.LBB109>:
            int32_t cre = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
    f9f4:	800b0b13          	add	s6,s6,-2048 # ffffd800 <_ebss+0xfffe7750>
    f9f8:	eadff06f          	j	f8a4 <.L58>

0000f9fc <.L57>:
    sin_tab_init();
    f9fc:	9c9ff0ef          	jal	f3c4 <sin_tab_init>

0000fa00 <.LBB121>:
    for (int y = 0; y < g_h; y++)
    fa00:	00000a93          	li	s5,0

0000fa04 <.LBB122>:
            hsv2rgb((float)v / 762.0f, 1.0f, 1.0f, &r,&g,&bl);
    fa04:	06010493          	add	s1,sp,96
    fa08:	04010913          	add	s2,sp,64
    fa0c:	03f10993          	add	s3,sp,63
    fa10:	00002a17          	auipc	s4,0x2
    fa14:	69ca2a03          	lw	s4,1692(s4) # 120ac <.LC16>

0000fa18 <.L72>:
    for (int y = 0; y < g_h; y++)
    fa18:	d1bad0e3          	bge	s5,s11,f718 <.L61>
    fa1c:	001a9b93          	sll	s7,s5,0x1
    fa20:	00300c93          	li	s9,3
    fa24:	039a8cb3          	mul	s9,s5,s9
    fa28:	080b8b93          	add	s7,s7,128

0000fa2c <.LBB125>:
        for (int x = 0; x < g_w; x++) {
    fa2c:	00000b13          	li	s6,0

0000fa30 <.LBB124>:
            int v = (int)sin_tab[a] + (int)sin_tab[b] + (int)sin_tab[c] + 381;
    fa30:	00006c17          	auipc	s8,0x6
    fa34:	518c0c13          	add	s8,s8,1304 # 15f48 <sin_tab>
            int a = (x*3 + y)     & 255;
    fa38:	00300413          	li	s0,3
    fa3c:	08c0006f          	j	fac8 <.L74>

0000fa40 <.L73>:
    fa40:	028b07b3          	mul	a5,s6,s0
    fa44:	015787b3          	add	a5,a5,s5
    fa48:	0ff7f793          	zext.b	a5,a5
            int v = (int)sin_tab[a] + (int)sin_tab[b] + (int)sin_tab[c] + 381;
    fa4c:	00fc07b3          	add	a5,s8,a5
    fa50:	00078503          	lb	a0,0(a5)
            int b = (x   + y*3)   & 255;
    fa54:	016c87b3          	add	a5,s9,s6

0000fa58 <.LVL185>:
    fa58:	0ff7f793          	zext.b	a5,a5

0000fa5c <.LVL186>:
            int v = (int)sin_tab[a] + (int)sin_tab[b] + (int)sin_tab[c] + 381;
    fa5c:	00fc07b3          	add	a5,s8,a5
    fa60:	00078783          	lb	a5,0(a5)
    fa64:	00f50533          	add	a0,a0,a5
            int c = (x*2 + y*2+128) & 255;
    fa68:	0ffbf793          	zext.b	a5,s7

0000fa6c <.LVL187>:
            int v = (int)sin_tab[a] + (int)sin_tab[b] + (int)sin_tab[c] + 381;
    fa6c:	00fc07b3          	add	a5,s8,a5

0000fa70 <.LVL188>:
    fa70:	00078783          	lb	a5,0(a5)
    fa74:	002b8b93          	add	s7,s7,2

0000fa78 <.LVL189>:
    fa78:	00f50533          	add	a0,a0,a5
            hsv2rgb((float)v / 762.0f, 1.0f, 1.0f, &r,&g,&bl);
    fa7c:	17d50513          	add	a0,a0,381
    fa80:	a8df10ef          	jal	150c <__floatsisf>

0000fa84 <.LVL190>:
    fa84:	000a0593          	mv	a1,s4
    fa88:	f31f00ef          	jal	9b8 <__divsf3>

0000fa8c <.LVL191>:
    fa8c:	00002617          	auipc	a2,0x2
    fa90:	60060613          	add	a2,a2,1536 # 1208c <.LC2>
    fa94:	00062603          	lw	a2,0(a2)
    fa98:	00048793          	mv	a5,s1
    fa9c:	00090713          	mv	a4,s2
    faa0:	00060593          	mv	a1,a2
    faa4:	00098693          	mv	a3,s3
    faa8:	f78ff0ef          	jal	f220 <hsv2rgb>

0000faac <.LVL192>:
            pset(x, y, r, g, bl);
    faac:	06014703          	lbu	a4,96(sp)
    fab0:	04014683          	lbu	a3,64(sp)
    fab4:	03f14603          	lbu	a2,63(sp)
    fab8:	000b0513          	mv	a0,s6
    fabc:	000a8593          	mv	a1,s5
    fac0:	d4cff0ef          	jal	f00c <pset>

0000fac4 <.LBE124>:
        for (int x = 0; x < g_w; x++) {
    fac4:	001b0b13          	add	s6,s6,1

0000fac8 <.L74>:
    fac8:	f7ab4ce3          	blt	s6,s10,fa40 <.L73>

0000facc <.LBE125>:
    for (int y = 0; y < g_h; y++)
    facc:	001a8a93          	add	s5,s5,1
    fad0:	f49ff06f          	j	fa18 <.L72>

0000fad4 <.L110>:
    switch (pat) {
    fad4:	06400a13          	li	s4,100
    fad8:	00002417          	auipc	s0,0x2
    fadc:	5c842403          	lw	s0,1480(s0) # 120a0 <.LC7>
    fae0:	00000493          	li	s1,0

0000fae4 <.LBB126>:
        px[i] = (int)(x1*proj) + g_w/2;
    fae4:	00200b13          	li	s6,2
    fae8:	04010d93          	add	s11,sp,64
        py[i] = (int)(y2*proj) + g_h/2;
    faec:	06010d13          	add	s10,sp,96

0000faf0 <.L56>:
    clear();
    faf0:	decff0ef          	jal	f0dc <clear>

0000faf4 <.LVL198>:
    float cy = cosf(ay), sy = sinf(ay);
    faf4:	00048513          	mv	a0,s1
    faf8:	df0f40ef          	jal	40e8 <__GI_cosf>

0000fafc <.LVL199>:
    fafc:	00a12623          	sw	a0,12(sp)

0000fb00 <.LVL200>:
    fb00:	00048513          	mv	a0,s1

0000fb04 <.LVL201>:
    fb04:	e04f40ef          	jal	4108 <__GI_sinf>

0000fb08 <.LVL202>:
    fb08:	00a12823          	sw	a0,16(sp)

0000fb0c <.LVL203>:
    float cx = cosf(ax), sx = sinf(ax);
    fb0c:	00040513          	mv	a0,s0

0000fb10 <.LVL204>:
    fb10:	dd8f40ef          	jal	40e8 <__GI_cosf>

0000fb14 <.LVL205>:
    fb14:	00a12a23          	sw	a0,20(sp)

0000fb18 <.LVL206>:
    fb18:	00040513          	mv	a0,s0

0000fb1c <.LVL207>:
    fb1c:	decf40ef          	jal	4108 <__GI_sinf>

0000fb20 <.LBB132>:
        px[i] = (int)(x1*proj) + g_w/2;
    fb20:	00006797          	auipc	a5,0x6
    fb24:	52c78793          	add	a5,a5,1324 # 1604c <g_w>
    fb28:	0007a783          	lw	a5,0(a5)

0000fb2c <.LBE132>:
    float cx = cosf(ax), sx = sinf(ax);
    fb2c:	00a12c23          	sw	a0,24(sp)

0000fb30 <.LBB138>:
    for (int i = 0; i < 8; i++) {
    fb30:	00002717          	auipc	a4,0x2
    fb34:	43870713          	add	a4,a4,1080 # 11f68 <vraw.3>

0000fb38 <.LBB133>:
        px[i] = (int)(x1*proj) + g_w/2;
    fb38:	0367ccb3          	div	s9,a5,s6
        py[i] = (int)(y2*proj) + g_h/2;
    fb3c:	00006797          	auipc	a5,0x6
    fb40:	50c78793          	add	a5,a5,1292 # 16048 <g_h>
    fb44:	0007a683          	lw	a3,0(a5)
    fb48:	00000b93          	li	s7,0

0000fb4c <.LBE133>:
    for (int i = 0; i < 8; i++) {
    fb4c:	02000993          	li	s3,32

0000fb50 <.LBB134>:
        py[i] = (int)(y2*proj) + g_h/2;
    fb50:	0366c6b3          	div	a3,a3,s6

0000fb54 <.L75>:
        float x = vraw[i][0], y = vraw[i][1], z = vraw[i][2];
    fb54:	00072a83          	lw	s5,0(a4)
    fb58:	00472783          	lw	a5,4(a4)
        float z1 =  x*sy + z*cy;
    fb5c:	01012503          	lw	a0,16(sp)
    fb60:	000a8593          	mv	a1,s5
        float x = vraw[i][0], y = vraw[i][1], z = vraw[i][2];
    fb64:	00872c03          	lw	s8,8(a4)
    fb68:	02d12623          	sw	a3,44(sp)

0000fb6c <.LVL211>:
    fb6c:	02e12423          	sw	a4,40(sp)
    fb70:	00f12e23          	sw	a5,28(sp)

0000fb74 <.LVL212>:
        float z1 =  x*sy + z*cy;
    fb74:	974f10ef          	jal	ce8 <__mulsf3>

0000fb78 <.LVL213>:
    fb78:	00050913          	mv	s2,a0
    fb7c:	00c12503          	lw	a0,12(sp)
    fb80:	000c0593          	mv	a1,s8
    fb84:	964f10ef          	jal	ce8 <__mulsf3>

0000fb88 <.LVL214>:
    fb88:	00050593          	mv	a1,a0
    fb8c:	00090513          	mv	a0,s2
    fb90:	a09f00ef          	jal	598 <__addsf3>

0000fb94 <.LVL215>:
        float z2 =  y*sx + z1*cx;
    fb94:	01c12583          	lw	a1,28(sp)
        float z1 =  x*sy + z*cy;
    fb98:	02a12023          	sw	a0,32(sp)

0000fb9c <.LVL216>:
        float z2 =  y*sx + z1*cx;
    fb9c:	01812503          	lw	a0,24(sp)

0000fba0 <.LVL217>:
    fba0:	948f10ef          	jal	ce8 <__mulsf3>

0000fba4 <.LVL218>:
    fba4:	02012583          	lw	a1,32(sp)
    fba8:	00050913          	mv	s2,a0
    fbac:	01412503          	lw	a0,20(sp)
    fbb0:	938f10ef          	jal	ce8 <__mulsf3>

0000fbb4 <.LVL219>:
    fbb4:	00050593          	mv	a1,a0
    fbb8:	00090513          	mv	a0,s2
    fbbc:	9ddf00ef          	jal	598 <__addsf3>

0000fbc0 <.LVL220>:
        float proj = fov / (dist + z2);
    fbc0:	00002797          	auipc	a5,0x2
    fbc4:	4f078793          	add	a5,a5,1264 # 120b0 <.LC17>
    fbc8:	0007a583          	lw	a1,0(a5)
        px[i] = (int)(x1*proj) + g_w/2;
    fbcc:	017d8933          	add	s2,s11,s7
        float proj = fov / (dist + z2);
    fbd0:	9c9f00ef          	jal	598 <__addsf3>

0000fbd4 <.LVL221>:
    fbd4:	00002797          	auipc	a5,0x2
    fbd8:	4e078793          	add	a5,a5,1248 # 120b4 <.LC18>
    fbdc:	00050593          	mv	a1,a0
    fbe0:	0007a503          	lw	a0,0(a5)
    fbe4:	dd5f00ef          	jal	9b8 <__divsf3>

0000fbe8 <.LVL222>:
    fbe8:	02a12223          	sw	a0,36(sp)

0000fbec <.LVL223>:
        float x1 =  x*cy - z*sy;
    fbec:	00c12503          	lw	a0,12(sp)

0000fbf0 <.LVL224>:
    fbf0:	000a8593          	mv	a1,s5
    fbf4:	8f4f10ef          	jal	ce8 <__mulsf3>

0000fbf8 <.LVL225>:
    fbf8:	00050a93          	mv	s5,a0

0000fbfc <.LVL226>:
    fbfc:	01012503          	lw	a0,16(sp)
    fc00:	000c0593          	mv	a1,s8
        py[i] = (int)(y2*proj) + g_h/2;
    fc04:	017d0c33          	add	s8,s10,s7

0000fc08 <.LVL227>:
        float x1 =  x*cy - z*sy;
    fc08:	8e0f10ef          	jal	ce8 <__mulsf3>

0000fc0c <.LVL228>:
    fc0c:	00050593          	mv	a1,a0
    fc10:	000a8513          	mv	a0,s5
    fc14:	bf0f10ef          	jal	1004 <__subsf3>

0000fc18 <.LVL229>:
        px[i] = (int)(x1*proj) + g_w/2;
    fc18:	02412583          	lw	a1,36(sp)

0000fc1c <.LBE134>:
    for (int i = 0; i < 8; i++) {
    fc1c:	004b8b93          	add	s7,s7,4

0000fc20 <.LBB135>:
        px[i] = (int)(x1*proj) + g_w/2;
    fc20:	8c8f10ef          	jal	ce8 <__mulsf3>

0000fc24 <.LVL230>:
    fc24:	811f10ef          	jal	1434 <__fixsfsi>

0000fc28 <.LVL231>:
    fc28:	01950533          	add	a0,a0,s9
        float y2 =  y*cx - z1*sx;
    fc2c:	01c12583          	lw	a1,28(sp)
        px[i] = (int)(x1*proj) + g_w/2;
    fc30:	00a92023          	sw	a0,0(s2)
        float y2 =  y*cx - z1*sx;
    fc34:	01412503          	lw	a0,20(sp)
    fc38:	8b0f10ef          	jal	ce8 <__mulsf3>

0000fc3c <.LVL232>:
    fc3c:	02012583          	lw	a1,32(sp)
    fc40:	00050a93          	mv	s5,a0
    fc44:	01812503          	lw	a0,24(sp)
    fc48:	8a0f10ef          	jal	ce8 <__mulsf3>

0000fc4c <.LVL233>:
    fc4c:	00050593          	mv	a1,a0
    fc50:	000a8513          	mv	a0,s5
    fc54:	bb0f10ef          	jal	1004 <__subsf3>

0000fc58 <.LVL234>:
        py[i] = (int)(y2*proj) + g_h/2;
    fc58:	02412583          	lw	a1,36(sp)
    fc5c:	88cf10ef          	jal	ce8 <__mulsf3>

0000fc60 <.LVL235>:
    fc60:	fd4f10ef          	jal	1434 <__fixsfsi>

0000fc64 <.LVL236>:
    fc64:	02c12683          	lw	a3,44(sp)

0000fc68 <.LBE135>:
    for (int i = 0; i < 8; i++) {
    fc68:	02812703          	lw	a4,40(sp)

0000fc6c <.LBB136>:
        py[i] = (int)(y2*proj) + g_h/2;
    fc6c:	00d50533          	add	a0,a0,a3
    fc70:	00ac2023          	sw	a0,0(s8)

0000fc74 <.LBE136>:
    for (int i = 0; i < 8; i++) {
    fc74:	00c70713          	add	a4,a4,12
    fc78:	ed3b9ee3          	bne	s7,s3,fb54 <.L75>
    fc7c:	00002c97          	auipc	s9,0x2
    fc80:	28cc8c93          	add	s9,s9,652 # 11f08 <edges.2>
    fc84:	00002a97          	auipc	s5,0x2
    fc88:	260a8a93          	add	s5,s5,608 # 11ee4 <ecol.1>

0000fc8c <.L76>:
        int a = edges[i][0], b = edges[i][1];
    fc8c:	000ca703          	lw	a4,0(s9)

0000fc90 <.LVL238>:
    fc90:	004ca783          	lw	a5,4(s9)

0000fc94 <.LVL239>:
        draw_line(px[a],   py[a],   px[b],   py[b],   ecol[i][0],ecol[i][1],ecol[i][2]);
    fc94:	03010693          	add	a3,sp,48
    fc98:	00271713          	sll	a4,a4,0x2

0000fc9c <.LVL240>:
    fc9c:	00279793          	sll	a5,a5,0x2

0000fca0 <.LVL241>:
    fca0:	0f070713          	add	a4,a4,240
    fca4:	0f078793          	add	a5,a5,240
    fca8:	00d70733          	add	a4,a4,a3
    fcac:	00d787b3          	add	a5,a5,a3
    fcb0:	f2072903          	lw	s2,-224(a4)
    fcb4:	f4072c03          	lw	s8,-192(a4)
    fcb8:	f207a983          	lw	s3,-224(a5)
    fcbc:	f407ab83          	lw	s7,-192(a5)
    fcc0:	000ac703          	lbu	a4,0(s5)
    fcc4:	001ac783          	lbu	a5,1(s5)
    fcc8:	002ac803          	lbu	a6,2(s5)
    fccc:	000b8693          	mv	a3,s7
    fcd0:	00098613          	mv	a2,s3
    fcd4:	000c0593          	mv	a1,s8
    fcd8:	00090513          	mv	a0,s2
    fcdc:	01012a23          	sw	a6,20(sp)
    fce0:	00f12823          	sw	a5,16(sp)
    fce4:	00e12623          	sw	a4,12(sp)
    fce8:	c1cff0ef          	jal	f104 <draw_line>

0000fcec <.LVL242>:
        draw_line(px[a]+1, py[a],   px[b]+1, py[b],   ecol[i][0],ecol[i][1],ecol[i][2]);
    fcec:	01412803          	lw	a6,20(sp)
    fcf0:	01012783          	lw	a5,16(sp)
    fcf4:	00c12703          	lw	a4,12(sp)
    fcf8:	000b8693          	mv	a3,s7
    fcfc:	00198613          	add	a2,s3,1
    fd00:	000c0593          	mv	a1,s8
    fd04:	00190513          	add	a0,s2,1
    fd08:	bfcff0ef          	jal	f104 <draw_line>

0000fd0c <.LVL243>:
        draw_line(px[a],   py[a]+1, px[b],   py[b]+1, ecol[i][0],ecol[i][1],ecol[i][2]);
    fd0c:	01012783          	lw	a5,16(sp)
    fd10:	01412803          	lw	a6,20(sp)
    fd14:	00c12703          	lw	a4,12(sp)
    fd18:	001b8693          	add	a3,s7,1
    fd1c:	00098613          	mv	a2,s3
    fd20:	001c0593          	add	a1,s8,1
    fd24:	00090513          	mv	a0,s2
    fd28:	bdcff0ef          	jal	f104 <draw_line>

0000fd2c <.LBE140>:
    for (int i = 0; i < 12; i++) {
    fd2c:	003a8a93          	add	s5,s5,3
    fd30:	00002797          	auipc	a5,0x2
    fd34:	1d878793          	add	a5,a5,472 # 11f08 <edges.2>
    fd38:	008c8c93          	add	s9,s9,8
    fd3c:	f55798e3          	bne	a5,s5,fc8c <.L76>

0000fd40 <.LBE139>:
        lseek(fd, 0, SEEK_SET);
    fd40:	00012503          	lw	a0,0(sp)
    fd44:	00000613          	li	a2,0
    fd48:	00000593          	li	a1,0
    fd4c:	999f10ef          	jal	16e4 <__GI_lseek>

0000fd50 <.LVL246>:
        write(fd, g_buf, size);
    fd50:	00006797          	auipc	a5,0x6
    fd54:	30078793          	add	a5,a5,768 # 16050 <g_buf>
    fd58:	00412603          	lw	a2,4(sp)
    fd5c:	0007a583          	lw	a1,0(a5)
    fd60:	00012503          	lw	a0,0(sp)
    for (frame = 0; frame < 100; frame++) {
    fd64:	fffa0a13          	add	s4,s4,-1

0000fd68 <.LVL247>:
        write(fd, g_buf, size);
    fd68:	a7df10ef          	jal	17e4 <__GI_write>

0000fd6c <.LVL248>:
        ay += 0.04f;
    fd6c:	00002797          	auipc	a5,0x2
    fd70:	34c78793          	add	a5,a5,844 # 120b8 <.LC19>
    fd74:	0007a583          	lw	a1,0(a5)
    fd78:	00048513          	mv	a0,s1
    fd7c:	81df00ef          	jal	598 <__addsf3>

0000fd80 <.LVL249>:
        ax += 0.013f;
    fd80:	00002797          	auipc	a5,0x2
    fd84:	33c78793          	add	a5,a5,828 # 120bc <.LC20>
    fd88:	0007a583          	lw	a1,0(a5)
        ay += 0.04f;
    fd8c:	00050493          	mv	s1,a0
        ax += 0.013f;
    fd90:	00040513          	mv	a0,s0
    fd94:	805f00ef          	jal	598 <__addsf3>

0000fd98 <.LVL251>:
    fd98:	00050413          	mv	s0,a0

0000fd9c <.LVL252>:
    for (frame = 0; frame < 100; frame++) {
    fd9c:	d40a1ae3          	bnez	s4,faf0 <.L56>
    fda0:	979ff06f          	j	f718 <.L61>

0000fda4 <.L55>:
    int cx = g_w/2, cy = g_h/2;
    fda4:	00200c13          	li	s8,2
    fda8:	038d4433          	div	s0,s10,s8

0000fdac <.LBB145>:
    for (int y = 0; y < g_h; y++)
    fdac:	00000b13          	li	s6,0

0000fdb0 <.LBB146>:
            hsv2rgb((float)(dist % 48) / 48.0f, 1.0f, 1.0f, &r,&g,&b);
    fdb0:	06010493          	add	s1,sp,96
    fdb4:	04010913          	add	s2,sp,64
    fdb8:	03f10993          	add	s3,sp,63
    fdbc:	00002a17          	auipc	s4,0x2
    fdc0:	304a2a03          	lw	s4,772(s4) # 120c0 <.LC21>

0000fdc4 <.LBE145>:
    int cx = g_w/2, cy = g_h/2;
    fdc4:	038dcc33          	div	s8,s11,s8

0000fdc8 <.L77>:
    for (int y = 0; y < g_h; y++)
    fdc8:	95bb58e3          	bge	s6,s11,f718 <.L61>

0000fdcc <.LBB156>:
            int dx = x-cx, dy = y-cy;
    fdcc:	418b0bb3          	sub	s7,s6,s8

0000fdd0 <.LBE156>:
        for (int x = 0; x < g_w; x++) {
    fdd0:	00000a93          	li	s5,0

0000fdd4 <.LBB148>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    fdd4:	00200c93          	li	s9,2

0000fdd8 <.LBE148>:
            int dist = isqrt(dx*dx + dy*dy);
    fdd8:	037b8bb3          	mul	s7,s7,s7
    fddc:	0780006f          	j	fe54 <.L82>

0000fde0 <.L81>:
            int dx = x-cx, dy = y-cy;
    fde0:	408a87b3          	sub	a5,s5,s0

0000fde4 <.LVL257>:
            int dist = isqrt(dx*dx + dy*dy);
    fde4:	02f787b3          	mul	a5,a5,a5

0000fde8 <.LBB153>:
    if (n <= 0) return 0;
    fde8:	00000693          	li	a3,0

0000fdec <.LBE153>:
            int dist = isqrt(dx*dx + dy*dy);
    fdec:	017787b3          	add	a5,a5,s7

0000fdf0 <.LBB154>:
    if (n <= 0) return 0;
    fdf0:	00078a63          	beqz	a5,fe04 <.L78>

0000fdf4 <.LVL260>:
    int x = n, y = (x+1)/2;
    fdf4:	00178713          	add	a4,a5,1
    fdf8:	40175713          	sra	a4,a4,0x1

0000fdfc <.LVL261>:
    fdfc:	00078693          	mv	a3,a5

0000fe00 <.L79>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    fe00:	06d74063          	blt	a4,a3,fe60 <.L80>

0000fe04 <.L78>:
            hsv2rgb((float)(dist % 48) / 48.0f, 1.0f, 1.0f, &r,&g,&b);
    fe04:	03000513          	li	a0,48
    fe08:	02a6e533          	rem	a0,a3,a0
    fe0c:	f00f10ef          	jal	150c <__floatsisf>

0000fe10 <.LVL264>:
    fe10:	000a0593          	mv	a1,s4
    fe14:	ba5f00ef          	jal	9b8 <__divsf3>

0000fe18 <.LVL265>:
    fe18:	00002617          	auipc	a2,0x2
    fe1c:	27460613          	add	a2,a2,628 # 1208c <.LC2>
    fe20:	00062603          	lw	a2,0(a2)
    fe24:	00048793          	mv	a5,s1
    fe28:	00090713          	mv	a4,s2
    fe2c:	00060593          	mv	a1,a2
    fe30:	00098693          	mv	a3,s3
    fe34:	becff0ef          	jal	f220 <hsv2rgb>

0000fe38 <.LVL266>:
            pset(x, y, r, g, b);
    fe38:	06014703          	lbu	a4,96(sp)
    fe3c:	04014683          	lbu	a3,64(sp)
    fe40:	03f14603          	lbu	a2,63(sp)
    fe44:	000a8513          	mv	a0,s5
    fe48:	000b0593          	mv	a1,s6
    fe4c:	9c0ff0ef          	jal	f00c <pset>

0000fe50 <.LBE157>:
        for (int x = 0; x < g_w; x++) {
    fe50:	001a8a93          	add	s5,s5,1

0000fe54 <.L82>:
    fe54:	f9aac6e3          	blt	s5,s10,fde0 <.L81>

0000fe58 <.LBE159>:
    for (int y = 0; y < g_h; y++)
    fe58:	001b0b13          	add	s6,s6,1
    fe5c:	f6dff06f          	j	fdc8 <.L77>

0000fe60 <.L80>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    fe60:	02e7c633          	div	a2,a5,a4
    fe64:	00070693          	mv	a3,a4
    fe68:	00e60633          	add	a2,a2,a4

0000fe6c <.LVL271>:
    fe6c:	03964733          	div	a4,a2,s9

0000fe70 <.LVL272>:
    fe70:	f91ff06f          	j	fe00 <.L79>

0000fe74 <.L54>:
    int cx = g_w/2, cy = g_h/2;
    fe74:	00200813          	li	a6,2
    fe78:	030d4bb3          	div	s7,s10,a6

0000fe7c <.LVL274>:
    fe7c:	030dcc33          	div	s8,s11,a6

0000fe80 <.LVL275>:
    int maxr = (cx < cy ? cx : cy);
    fe80:	000b8493          	mv	s1,s7
    fe84:	017c5463          	bge	s8,s7,fe8c <.L83>
    fe88:	000c0493          	mv	s1,s8

0000fe8c <.L83>:
            hsv2rgb(hue, sat, 1.0f, &rv,&gv,&bv);
    fe8c:	06010793          	add	a5,sp,96
    fe90:	00f12a23          	sw	a5,20(sp)
    fe94:	04010793          	add	a5,sp,64
    fe98:	41800a33          	neg	s4,s8
    fe9c:	00f12c23          	sw	a5,24(sp)
    fea0:	00002c97          	auipc	s9,0x2
    fea4:	1eccac83          	lw	s9,492(s9) # 1208c <.LC2>

0000fea8 <.L84>:
    fea8:	018a0933          	add	s2,s4,s8

0000feac <.LBE165>:
    for (int y = 0; y < g_h; y++)
    feac:	87b956e3          	bge	s2,s11,f718 <.L61>

0000feb0 <.LBB175>:
            hsv2rgb(hue, sat, 1.0f, &rv,&gv,&bv);
    feb0:	03f10793          	add	a5,sp,63
            int r = isqrt(dx*dx + dy*dy);
    feb4:	034a0b33          	mul	s6,s4,s4

0000feb8 <.LBE175>:
        for (int x = 0; x < g_w; x++) {
    feb8:	00000413          	li	s0,0

0000febc <.LBB167>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    febc:	00200a93          	li	s5,2

0000fec0 <.LBE167>:
            hsv2rgb(hue, sat, 1.0f, &rv,&gv,&bv);
    fec0:	00f12823          	sw	a5,16(sp)
    fec4:	0480006f          	j	ff0c <.L91>

0000fec8 <.L90>:
            int dx = x-cx, dy = y-cy;
    fec8:	41740533          	sub	a0,s0,s7

0000fecc <.LVL280>:
            int r = isqrt(dx*dx + dy*dy);
    fecc:	02a50733          	mul	a4,a0,a0

0000fed0 <.LBB172>:
    if (n <= 0) return 0;
    fed0:	00000993          	li	s3,0

0000fed4 <.LBE172>:
            int r = isqrt(dx*dx + dy*dy);
    fed4:	01670733          	add	a4,a4,s6

0000fed8 <.LBB173>:
    if (n <= 0) return 0;
    fed8:	00070a63          	beqz	a4,feec <.L85>

0000fedc <.LVL282>:
    int x = n, y = (x+1)/2;
    fedc:	00170793          	add	a5,a4,1
    fee0:	4017d793          	sra	a5,a5,0x1

0000fee4 <.LVL283>:
    fee4:	00070993          	mv	s3,a4

0000fee8 <.L86>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    fee8:	0337c863          	blt	a5,s3,ff18 <.L87>

0000feec <.L85>:
            if (r > maxr) { pset(x,y, 0,0,0); continue; }
    feec:	0534d063          	bge	s1,s3,ff2c <.L88>
    fef0:	00000713          	li	a4,0
    fef4:	00000693          	li	a3,0
    fef8:	00000613          	li	a2,0

0000fefc <.L126>:
            pset(x, y, rv, gv, bv);
    fefc:	00040513          	mv	a0,s0
    ff00:	00090593          	mv	a1,s2
    ff04:	908ff0ef          	jal	f00c <pset>

0000ff08 <.LBE176>:
        for (int x = 0; x < g_w; x++) {
    ff08:	00140413          	add	s0,s0,1

0000ff0c <.L91>:
    ff0c:	fba44ee3          	blt	s0,s10,fec8 <.L90>

0000ff10 <.LBE178>:
    for (int y = 0; y < g_h; y++)
    ff10:	001a0a13          	add	s4,s4,1

0000ff14 <.LVL290>:
    ff14:	f95ff06f          	j	fea8 <.L84>

0000ff18 <.L87>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    ff18:	02f746b3          	div	a3,a4,a5
    ff1c:	00078993          	mv	s3,a5
    ff20:	00f686b3          	add	a3,a3,a5

0000ff24 <.LVL292>:
    ff24:	0356c7b3          	div	a5,a3,s5

0000ff28 <.LVL293>:
    ff28:	fc1ff06f          	j	fee8 <.L86>

0000ff2c <.L88>:
            float hue = (atan2f((float)dy, (float)dx) + PI) / (2.0f*PI);
    ff2c:	de0f10ef          	jal	150c <__floatsisf>

0000ff30 <.LVL295>:
    ff30:	00a12623          	sw	a0,12(sp)
    ff34:	000a0513          	mv	a0,s4
    ff38:	dd4f10ef          	jal	150c <__floatsisf>

0000ff3c <.LVL296>:
    ff3c:	00c12583          	lw	a1,12(sp)
    ff40:	8f8f40ef          	jal	4038 <atan2f>

0000ff44 <.LVL297>:
    ff44:	00a12623          	sw	a0,12(sp)

0000ff48 <.LVL298>:
            float sat = (float)r / maxr;
    ff48:	00098513          	mv	a0,s3

0000ff4c <.LVL299>:
    ff4c:	dc0f10ef          	jal	150c <__floatsisf>

0000ff50 <.LVL300>:
    ff50:	00050993          	mv	s3,a0

0000ff54 <.LVL301>:
    ff54:	00048513          	mv	a0,s1
    ff58:	db4f10ef          	jal	150c <__floatsisf>

0000ff5c <.LVL302>:
    ff5c:	00050593          	mv	a1,a0
    ff60:	00098513          	mv	a0,s3
    ff64:	a55f00ef          	jal	9b8 <__divsf3>

0000ff68 <.LVL303>:
            float hue = (atan2f((float)dy, (float)dx) + PI) / (2.0f*PI);
    ff68:	00002797          	auipc	a5,0x2
    ff6c:	12c78793          	add	a5,a5,300 # 12094 <.LC4>
    ff70:	0007a583          	lw	a1,0(a5)
            float sat = (float)r / maxr;
    ff74:	00050993          	mv	s3,a0
            float hue = (atan2f((float)dy, (float)dx) + PI) / (2.0f*PI);
    ff78:	00c12503          	lw	a0,12(sp)
    ff7c:	e1cf00ef          	jal	598 <__addsf3>

0000ff80 <.LVL304>:
    ff80:	00002797          	auipc	a5,0x2
    ff84:	14478793          	add	a5,a5,324 # 120c4 <.LC22>
    ff88:	0007a583          	lw	a1,0(a5)
    ff8c:	a2df00ef          	jal	9b8 <__divsf3>

0000ff90 <.LVL305>:
            hsv2rgb(hue, sat, 1.0f, &rv,&gv,&bv);
    ff90:	01812703          	lw	a4,24(sp)
    ff94:	01012683          	lw	a3,16(sp)
    ff98:	01412783          	lw	a5,20(sp)
    ff9c:	000c8613          	mv	a2,s9
    ffa0:	00098593          	mv	a1,s3
    ffa4:	a7cff0ef          	jal	f220 <hsv2rgb>

0000ffa8 <.LVL306>:
            pset(x, y, rv, gv, bv);
    ffa8:	06014703          	lbu	a4,96(sp)
    ffac:	04014683          	lbu	a3,64(sp)
    ffb0:	03f14603          	lbu	a2,63(sp)
    ffb4:	f49ff06f          	j	fefc <.L126>

0000ffb8 <.L92>:
    while (sz < g_h) sz <<= 1;
    ffb8:	00141413          	sll	s0,s0,0x1

0000ffbc <.L53>:
    ffbc:	ffb44ee3          	blt	s0,s11,ffb8 <.L92>

0000ffc0 <.LBB182>:
                hsv2rgb((float)(row ^ col) / (float)sz, 1.0f, 1.0f, &r,&g,&b);
    ffc0:	03f10793          	add	a5,sp,63

0000ffc4 <.LBE183>:
    for (int y = 0; y < g_h; y++) {
    ffc4:	00000493          	li	s1,0

0000ffc8 <.LBB187>:
                hsv2rgb((float)(row ^ col) / (float)sz, 1.0f, 1.0f, &r,&g,&b);
    ffc8:	06010c13          	add	s8,sp,96
    ffcc:	04010c93          	add	s9,sp,64
    ffd0:	00f12823          	sw	a5,16(sp)
    ffd4:	00002b97          	auipc	s7,0x2
    ffd8:	0b8bab83          	lw	s7,184(s7) # 1208c <.LC2>

0000ffdc <.L93>:
    for (int y = 0; y < g_h; y++) {
    ffdc:	f3b4de63          	bge	s1,s11,f718 <.L61>

0000ffe0 <.LBB197>:
        int row = (int)((int64_t)y * sz / g_h);
    ffe0:	028495b3          	mulh	a1,s1,s0
    ffe4:	000d8613          	mv	a2,s11
    ffe8:	00000693          	li	a3,0
    ffec:	41f45b13          	sra	s6,s0,0x1f

0000fff0 <.LBB193>:
        for (int x = 0; x < g_w; x++) {
    fff0:	00000a93          	li	s5,0
    fff4:	00000993          	li	s3,0
    fff8:	00000913          	li	s2,0

0000fffc <.LBE193>:
        int row = (int)((int64_t)y * sz / g_h);
    fffc:	02848533          	mul	a0,s1,s0
   10000:	920f00ef          	jal	120 <__divdi3>

00010004 <.LVL310>:
   10004:	00050a13          	mv	s4,a0

00010008 <.L94>:
        for (int x = 0; x < g_w; x++) {
   10008:	01a94a63          	blt	s2,s10,1001c <.L97>

0001000c <.LBE194>:
    for (int y = 0; y < g_h; y++) {
   1000c:	00148493          	add	s1,s1,1
   10010:	fcdff06f          	j	ffdc <.L93>

00010014 <.L111>:
    switch (pat) {
   10014:	00100413          	li	s0,1
   10018:	fa5ff06f          	j	ffbc <.L53>

0001001c <.L97>:
            int col = (int)((int64_t)x * sz / g_w);
   1001c:	000d0613          	mv	a2,s10
   10020:	00000693          	li	a3,0
   10024:	000a8513          	mv	a0,s5
   10028:	00098593          	mv	a1,s3
   1002c:	8f4f00ef          	jal	120 <__divdi3>

00010030 <.LVL315>:
            if ((row & col) == 0) {
   10030:	00aa77b3          	and	a5,s4,a0
   10034:	06079863          	bnez	a5,100a4 <.L95>

00010038 <.LBB188>:
                hsv2rgb((float)(row ^ col) / (float)sz, 1.0f, 1.0f, &r,&g,&b);
   10038:	00aa4533          	xor	a0,s4,a0

0001003c <.LVL316>:
   1003c:	cd0f10ef          	jal	150c <__floatsisf>

00010040 <.LVL317>:
   10040:	00a12623          	sw	a0,12(sp)
   10044:	00040513          	mv	a0,s0
   10048:	cc4f10ef          	jal	150c <__floatsisf>

0001004c <.LVL318>:
   1004c:	00050593          	mv	a1,a0
   10050:	00c12503          	lw	a0,12(sp)
   10054:	965f00ef          	jal	9b8 <__divsf3>

00010058 <.LVL319>:
   10058:	01012683          	lw	a3,16(sp)
   1005c:	000c8713          	mv	a4,s9
   10060:	000b8613          	mv	a2,s7
   10064:	000c0793          	mv	a5,s8
   10068:	000b8593          	mv	a1,s7
   1006c:	9b4ff0ef          	jal	f220 <hsv2rgb>

00010070 <.LVL320>:
                pset(x, y, r, g, b);
   10070:	06014703          	lbu	a4,96(sp)
   10074:	04014683          	lbu	a3,64(sp)
   10078:	03f14603          	lbu	a2,63(sp)

0001007c <.L127>:
                pset(x, y, 0, 0, 0);
   1007c:	00090513          	mv	a0,s2
   10080:	00048593          	mv	a1,s1
   10084:	f89fe0ef          	jal	f00c <pset>

00010088 <.LBE190>:
        for (int x = 0; x < g_w; x++) {
   10088:	008a87b3          	add	a5,s5,s0
   1008c:	0157b733          	sltu	a4,a5,s5
   10090:	016989b3          	add	s3,s3,s6
   10094:	00190913          	add	s2,s2,1
   10098:	00078a93          	mv	s5,a5
   1009c:	013709b3          	add	s3,a4,s3
   100a0:	f69ff06f          	j	10008 <.L94>

000100a4 <.L95>:
                pset(x, y, 0, 0, 0);
   100a4:	00000713          	li	a4,0
   100a8:	00000693          	li	a3,0
   100ac:	00000613          	li	a2,0
   100b0:	fcdff06f          	j	1007c <.L127>

000100b4 <.L105>:
        int32_t im0 = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
   100b4:	000d8613          	mv	a2,s11
   100b8:	00000693          	li	a3,0
   100bc:	00098513          	mv	a0,s3
   100c0:	000c8593          	mv	a1,s9
   100c4:	85cf00ef          	jal	120 <__divdi3>

000100c8 <.LVL325>:
   100c8:	01550bb3          	add	s7,a0,s5

000100cc <.LBB206>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
   100cc:	41fbd793          	sra	a5,s7,0x1f
   100d0:	037b9433          	mulh	s0,s7,s7
   100d4:	00f12823          	sw	a5,16(sp)
                zi = (int32_t)(((int64_t)zr*zi) >> (FPJ-1)) + cim;
   100d8:	00001c37          	lui	s8,0x1

000100dc <.LBE207>:
        for (int px = 0; px < g_w; px++) {
   100dc:	00000a13          	li	s4,0
   100e0:	00012623          	sw	zero,12(sp)
   100e4:	00000913          	li	s2,0

000100e8 <.LBB209>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FPJ-1)) + cim;
   100e8:	999c0c13          	add	s8,s8,-1639 # 999 <.LVL124+0x1>
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
   100ec:	037b87b3          	mul	a5,s7,s7
   100f0:	01441413          	sll	s0,s0,0x14
   100f4:	00c7d793          	srl	a5,a5,0xc
   100f8:	00f46433          	or	s0,s0,a5

000100fc <.LBB210>:
                hsv2rgb((float)iter/MAXITER, 1.0f, 0.9f, &r,&g,&b);
   100fc:	06010793          	add	a5,sp,96
   10100:	00f12a23          	sw	a5,20(sp)
   10104:	04010793          	add	a5,sp,64
   10108:	00f12c23          	sw	a5,24(sp)
   1010c:	03f10793          	add	a5,sp,63
   10110:	00f12e23          	sw	a5,28(sp)

00010114 <.L99>:
        for (int px = 0; px < g_w; px++) {
   10114:	03a94463          	blt	s2,s10,1013c <.L104>

00010118 <.LBE205>:
    for (int py = 0; py < g_h; py++) {
   10118:	000027b7          	lui	a5,0x2
   1011c:	ccc78793          	add	a5,a5,-820 # 1ccc <.L34+0x10>
   10120:	00f987b3          	add	a5,s3,a5
   10124:	0137b733          	sltu	a4,a5,s3
   10128:	00148493          	add	s1,s1,1
   1012c:	00078993          	mv	s3,a5
   10130:	01970cb3          	add	s9,a4,s9

00010134 <.L52>:
   10134:	f9b4c0e3          	blt	s1,s11,100b4 <.L105>
   10138:	de0ff06f          	j	f718 <.L61>

0001013c <.L104>:
            int32_t zr = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
   1013c:	00c12583          	lw	a1,12(sp)
   10140:	000d0613          	mv	a2,s10
   10144:	00000693          	li	a3,0
   10148:	000a0513          	mv	a0,s4
   1014c:	fd5ef0ef          	jal	120 <__divdi3>

00010150 <.LVL331>:
   10150:	016507b3          	add	a5,a0,s6

00010154 <.LBB211>:
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FPJ);
   10154:	02f786b3          	mul	a3,a5,a5
   10158:	41f7d613          	sra	a2,a5,0x1f
   1015c:	02f79733          	mulh	a4,a5,a5
   10160:	00c6d693          	srl	a3,a3,0xc
   10164:	01471713          	sll	a4,a4,0x14
   10168:	00d76733          	or	a4,a4,a3

0001016c <.LVL333>:
                if (zr2+zi2 > ESCAPE) break;
   1016c:	008705b3          	add	a1,a4,s0
   10170:	000046b7          	lui	a3,0x4

00010174 <.LVL334>:
   10174:	10b6ce63          	blt	a3,a1,10290 <.L116>
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
   10178:	01012e03          	lw	t3,16(sp)
   1017c:	00040593          	mv	a1,s0
   10180:	000b8693          	mv	a3,s7

00010184 <.LBE211>:
            int iter = 0;
   10184:	00000513          	li	a0,0

00010188 <.LVL335>:
            while (iter < MAXITER) {
   10188:	05000893          	li	a7,80

0001018c <.LBB212>:
                if (zr2+zi2 > ESCAPE) break;
   1018c:	00004337          	lui	t1,0x4

00010190 <.L101>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FPJ-1)) + cim;
   10190:	02d60633          	mul	a2,a2,a3
                int32_t tmp = zr2 - zi2 + cre;
   10194:	40b70733          	sub	a4,a4,a1
                iter++;
   10198:	00150513          	add	a0,a0,1

0001019c <.LVL337>:
                int32_t tmp = zr2 - zi2 + cre;
   1019c:	99a70713          	add	a4,a4,-1638

000101a0 <.LVL338>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FPJ-1)) + cim;
   101a0:	02fe0e33          	mul	t3,t3,a5
   101a4:	02d785b3          	mul	a1,a5,a3
   101a8:	01c60633          	add	a2,a2,t3
   101ac:	02d7b7b3          	mulhu	a5,a5,a3
   101b0:	00b5d693          	srl	a3,a1,0xb
   101b4:	00f607b3          	add	a5,a2,a5
   101b8:	01579793          	sll	a5,a5,0x15
   101bc:	00d7e6b3          	or	a3,a5,a3
   101c0:	018686b3          	add	a3,a3,s8

000101c4 <.LBE212>:
            while (iter < MAXITER) {
   101c4:	05151263          	bne	a0,a7,10208 <.L102>
            if (iter == MAXITER) { pset(px,py, 0,0,0); }
   101c8:	00000713          	li	a4,0

000101cc <.LVL340>:
   101cc:	00000693          	li	a3,0

000101d0 <.LVL341>:
   101d0:	00000613          	li	a2,0

000101d4 <.L128>:
                pset(px, py, r, g, b);
   101d4:	00090513          	mv	a0,s2
   101d8:	00048593          	mv	a1,s1
   101dc:	e31fe0ef          	jal	f00c <pset>

000101e0 <.LBE213>:
        for (int px = 0; px < g_w; px++) {
   101e0:	000037b7          	lui	a5,0x3
   101e4:	33278793          	add	a5,a5,818 # 3332 <__free_to_heap+0xa>
   101e8:	00fa07b3          	add	a5,s4,a5
   101ec:	0147b733          	sltu	a4,a5,s4
   101f0:	00078a13          	mv	s4,a5
   101f4:	00c12783          	lw	a5,12(sp)
   101f8:	00190913          	add	s2,s2,1
   101fc:	00f707b3          	add	a5,a4,a5
   10200:	00f12623          	sw	a5,12(sp)
   10204:	f11ff06f          	j	10114 <.L99>

00010208 <.L102>:
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FPJ);
   10208:	02e705b3          	mul	a1,a4,a4
   1020c:	00070793          	mv	a5,a4
   10210:	41f75613          	sra	a2,a4,0x1f
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
   10214:	41f6de13          	sra	t3,a3,0x1f
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FPJ);
   10218:	02e71733          	mulh	a4,a4,a4

0001021c <.LVL346>:
   1021c:	00c5d593          	srl	a1,a1,0xc
   10220:	01471713          	sll	a4,a4,0x14
   10224:	00b76733          	or	a4,a4,a1

00010228 <.LVL347>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
   10228:	02d68eb3          	mul	t4,a3,a3
   1022c:	02d695b3          	mulh	a1,a3,a3

00010230 <.LVL348>:
   10230:	00cede93          	srl	t4,t4,0xc
   10234:	01459593          	sll	a1,a1,0x14
   10238:	01d5e5b3          	or	a1,a1,t4

0001023c <.LVL349>:
                if (zr2+zi2 > ESCAPE) break;
   1023c:	00b70eb3          	add	t4,a4,a1

00010240 <.LVL350>:
   10240:	f5d358e3          	bge	t1,t4,10190 <.L101>

00010244 <.L100>:
                hsv2rgb((float)iter/MAXITER, 1.0f, 0.9f, &r,&g,&b);
   10244:	ac8f10ef          	jal	150c <__floatsisf>

00010248 <.LVL352>:
   10248:	00002797          	auipc	a5,0x2
   1024c:	e6078793          	add	a5,a5,-416 # 120a8 <.LC15>
   10250:	0007a583          	lw	a1,0(a5)
   10254:	f64f00ef          	jal	9b8 <__divsf3>

00010258 <.LVL353>:
   10258:	00002617          	auipc	a2,0x2
   1025c:	e4c60613          	add	a2,a2,-436 # 120a4 <.LC14>
   10260:	00002597          	auipc	a1,0x2
   10264:	e2c58593          	add	a1,a1,-468 # 1208c <.LC2>
   10268:	01812703          	lw	a4,24(sp)
   1026c:	01c12683          	lw	a3,28(sp)
   10270:	00062603          	lw	a2,0(a2)
   10274:	01412783          	lw	a5,20(sp)
   10278:	0005a583          	lw	a1,0(a1)
   1027c:	fa5fe0ef          	jal	f220 <hsv2rgb>

00010280 <.LVL354>:
                pset(px, py, r, g, b);
   10280:	06014703          	lbu	a4,96(sp)
   10284:	04014683          	lbu	a3,64(sp)
   10288:	03f14603          	lbu	a2,63(sp)
   1028c:	f49ff06f          	j	101d4 <.L128>

00010290 <.L116>:
            int iter = 0;
   10290:	00000513          	li	a0,0

00010294 <.LVL356>:
   10294:	fb1ff06f          	j	10244 <.L100>

00010298 <.L112>:
        int32_t im0 = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
   10298:	fffffab7          	lui	s5,0xfffff

0001029c <.LBB219>:
            int32_t zr = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
   1029c:	ffffeb37          	lui	s6,0xffffe

000102a0 <.LBE202>:
    switch (pat) {
   102a0:	00000993          	li	s3,0
   102a4:	00000c93          	li	s9,0
   102a8:	00000493          	li	s1,0

000102ac <.LBB225>:
        int32_t im0 = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
   102ac:	19aa8a93          	add	s5,s5,410 # fffff19a <_ebss+0xfffe90ea>

000102b0 <.LBB220>:
            int32_t zr = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
   102b0:	667b0b13          	add	s6,s6,1639 # ffffe667 <_ebss+0xfffe85b7>
   102b4:	e81ff06f          	j	10134 <.L52>

000102b8 <.L50>:
    clear();
   102b8:	e25fe0ef          	jal	f0dc <clear>

000102bc <.LVL358>:
    sin_tab_init();
   102bc:	908ff0ef          	jal	f3c4 <sin_tab_init>

000102c0 <.LVL359>:
    int cx = g_w/2, cy = g_h/2;
   102c0:	00200c93          	li	s9,2
    int rx = g_w*2/5, ry = g_h*2/5;
   102c4:	001d1493          	sll	s1,s10,0x1
   102c8:	00500793          	li	a5,5
   102cc:	001d9413          	sll	s0,s11,0x1
    int cx = g_w/2, cy = g_h/2;
   102d0:	039d4833          	div	a6,s10,s9

000102d4 <.LVL360>:
   102d4:	00002b97          	auipc	s7,0x2
   102d8:	bc0b8b93          	add	s7,s7,-1088 # 11e94 <curves.0>
   102dc:	00002997          	auipc	s3,0x2
   102e0:	c0898993          	add	s3,s3,-1016 # 11ee4 <ecol.1>

000102e4 <.LBB231>:
            int x = cx + rx * (int)sin_tab[ai] / 128;
   102e4:	00006d17          	auipc	s10,0x6
   102e8:	c64d0d13          	add	s10,s10,-924 # 15f48 <sin_tab>
            int ai = (curves[ci].a * t * 256 / STEPS) & 255;
   102ec:	02000a13          	li	s4,32
            int x = cx + rx * (int)sin_tab[ai] / 128;
   102f0:	08000a93          	li	s5,128

000102f4 <.LBE233>:
        for (int t = 0; t < STEPS; t++) {
   102f4:	00002b37          	lui	s6,0x2

000102f8 <.LBE231>:
    int cx = g_w/2, cy = g_h/2;
   102f8:	039dccb3          	div	s9,s11,s9
    int rx = g_w*2/5, ry = g_h*2/5;
   102fc:	02f4c4b3          	div	s1,s1,a5
   10300:	02f44433          	div	s0,s0,a5

00010304 <.L106>:
        for (int t = 0; t < STEPS; t++) {
   10304:	00000c13          	li	s8,0

00010308 <.L107>:
            int ai = (curves[ci].a * t * 256 / STEPS) & 255;
   10308:	000ba703          	lw	a4,0(s7)
            int bi = (curves[ci].q * t * 256 / STEPS + curves[ci].phase) & 255;
   1030c:	008ba683          	lw	a3,8(s7)
            pset(x,   y,   curves[ci].r, curves[ci].g, curves[ci].b);
   10310:	00cbcd83          	lbu	s11,12(s7)
            int x = cx + rx * (int)sin_tab[ai] / 128;
   10314:	01012e23          	sw	a6,28(sp)
            pset(x,   y,   curves[ci].r, curves[ci].g, curves[ci].b);
   10318:	000d8613          	mv	a2,s11
            int ai = (curves[ci].a * t * 256 / STEPS) & 255;
   1031c:	02ec0733          	mul	a4,s8,a4
   10320:	03474733          	div	a4,a4,s4
   10324:	0ff77713          	zext.b	a4,a4
            int x = cx + rx * (int)sin_tab[ai] / 128;
   10328:	00ed0733          	add	a4,s10,a4
   1032c:	00070903          	lb	s2,0(a4)
            int bi = (curves[ci].q * t * 256 / STEPS + curves[ci].phase) & 255;
   10330:	004ba703          	lw	a4,4(s7)
            int x = cx + rx * (int)sin_tab[ai] / 128;
   10334:	02990933          	mul	s2,s2,s1
            int bi = (curves[ci].q * t * 256 / STEPS + curves[ci].phase) & 255;
   10338:	02ec0733          	mul	a4,s8,a4

0001033c <.LBE234>:
        for (int t = 0; t < STEPS; t++) {
   1033c:	001c0c13          	add	s8,s8,1

00010340 <.LBB235>:
            int bi = (curves[ci].q * t * 256 / STEPS + curves[ci].phase) & 255;
   10340:	03474733          	div	a4,a4,s4
   10344:	00d70733          	add	a4,a4,a3
   10348:	0ff77713          	zext.b	a4,a4
            int y = cy + ry * (int)sin_tab[bi] / 128;
   1034c:	00ed0733          	add	a4,s10,a4
   10350:	00070583          	lb	a1,0(a4)
            int x = cx + rx * (int)sin_tab[ai] / 128;
   10354:	03594933          	div	s2,s2,s5
            pset(x,   y,   curves[ci].r, curves[ci].g, curves[ci].b);
   10358:	00dbc683          	lbu	a3,13(s7)
   1035c:	00ebc703          	lbu	a4,14(s7)
   10360:	00d12a23          	sw	a3,20(sp)
   10364:	00e12c23          	sw	a4,24(sp)
            int y = cy + ry * (int)sin_tab[bi] / 128;
   10368:	028585b3          	mul	a1,a1,s0
            int x = cx + rx * (int)sin_tab[ai] / 128;
   1036c:	01090933          	add	s2,s2,a6
            pset(x,   y,   curves[ci].r, curves[ci].g, curves[ci].b);
   10370:	00090513          	mv	a0,s2
            int y = cy + ry * (int)sin_tab[bi] / 128;
   10374:	0355c5b3          	div	a1,a1,s5
   10378:	019585b3          	add	a1,a1,s9

0001037c <.LVL367>:
            pset(x,   y,   curves[ci].r, curves[ci].g, curves[ci].b);
   1037c:	00b12823          	sw	a1,16(sp)
   10380:	c8dfe0ef          	jal	f00c <pset>

00010384 <.LVL368>:
            pset(x+1, y,   curves[ci].r, curves[ci].g, curves[ci].b);
   10384:	01812703          	lw	a4,24(sp)
   10388:	01412683          	lw	a3,20(sp)
   1038c:	01012583          	lw	a1,16(sp)
   10390:	00190793          	add	a5,s2,1
   10394:	00078513          	mv	a0,a5
   10398:	000d8613          	mv	a2,s11
   1039c:	00f12623          	sw	a5,12(sp)
   103a0:	c6dfe0ef          	jal	f00c <pset>

000103a4 <.LVL369>:
            pset(x,   y+1, curves[ci].r, curves[ci].g, curves[ci].b);
   103a4:	01012583          	lw	a1,16(sp)
   103a8:	01812703          	lw	a4,24(sp)
   103ac:	01412683          	lw	a3,20(sp)
   103b0:	00158593          	add	a1,a1,1
   103b4:	000d8613          	mv	a2,s11
   103b8:	00090513          	mv	a0,s2
   103bc:	00b12823          	sw	a1,16(sp)

000103c0 <.LVL370>:
   103c0:	c4dfe0ef          	jal	f00c <pset>

000103c4 <.LVL371>:
            pset(x+1, y+1, curves[ci].r, curves[ci].g, curves[ci].b);
   103c4:	01812703          	lw	a4,24(sp)
   103c8:	01412683          	lw	a3,20(sp)
   103cc:	01012583          	lw	a1,16(sp)
   103d0:	00c12503          	lw	a0,12(sp)
   103d4:	000d8613          	mv	a2,s11
   103d8:	c35fe0ef          	jal	f00c <pset>

000103dc <.LBE235>:
        for (int t = 0; t < STEPS; t++) {
   103dc:	01c12803          	lw	a6,28(sp)
   103e0:	f36c14e3          	bne	s8,s6,10308 <.L107>

000103e4 <.LBE236>:
    for (int ci = 0; ci < ncurves; ci++) {
   103e4:	010b8b93          	add	s7,s7,16
   103e8:	f1799ee3          	bne	s3,s7,10304 <.L106>
   103ec:	b2cff06f          	j	f718 <.L61>
