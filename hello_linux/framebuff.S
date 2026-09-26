
framebuff.gdb:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start-0x4>:
       0:	0000                	.2byte	0x0
	...

00000004 <_start>:
       4:	02c000ef          	jal	30 <.Lload_gp>
       8:	00050793          	mv	a5,a0
       c:	00010517          	auipc	a0,0x10
      10:	3f450513          	add	a0,a0,1012 # 10400 <main>
      14:	00012583          	lw	a1,0(sp)
      18:	00410613          	add	a2,sp,4
      1c:	ff017113          	and	sp,sp,-16
      20:	00000693          	li	a3,0
      24:	00000713          	li	a4,0
      28:	00010813          	mv	a6,sp
      2c:	6c90306f          	j	3ef4 <__uClibc_main>

00000030 <.Lload_gp>:
      30:	00011197          	auipc	gp,0x11
      34:	e3018193          	add	gp,gp,-464 # 10e60 <__global_pointer$>
      38:	00008067          	ret

0000003c <deregister_tm_clones>:
      3c:	00012517          	auipc	a0,0x12
      40:	72050513          	add	a0,a0,1824 # 1275c <__TMC_END__>
      44:	00012797          	auipc	a5,0x12
      48:	71878793          	add	a5,a5,1816 # 1275c <__TMC_END__>
      4c:	00a78a63          	beq	a5,a0,60 <.L1>
      50:	00010797          	auipc	a5,0x10
      54:	5a87a783          	lw	a5,1448(a5) # 105f8 <_GLOBAL_OFFSET_TABLE_+0x30>
      58:	00078463          	beqz	a5,60 <.L1>
      5c:	00078067          	jr	a5

00000060 <.L1>:
      60:	00008067          	ret

00000064 <register_tm_clones>:
      64:	00012517          	auipc	a0,0x12
      68:	6f850513          	add	a0,a0,1784 # 1275c <__TMC_END__>
      6c:	00012597          	auipc	a1,0x12
      70:	6f058593          	add	a1,a1,1776 # 1275c <__TMC_END__>
      74:	40a585b3          	sub	a1,a1,a0
      78:	4025d593          	sra	a1,a1,0x2
      7c:	00200793          	li	a5,2
      80:	02f5c5b3          	div	a1,a1,a5
      84:	00058a63          	beqz	a1,98 <.L6>
      88:	00010797          	auipc	a5,0x10
      8c:	5647a783          	lw	a5,1380(a5) # 105ec <_GLOBAL_OFFSET_TABLE_+0x24>
      90:	00078463          	beqz	a5,98 <.L6>
      94:	00078067          	jr	a5

00000098 <.L6>:
      98:	00008067          	ret

0000009c <__do_global_dtors_aux>:
      9c:	ff010113          	add	sp,sp,-16
      a0:	00812423          	sw	s0,8(sp)
      a4:	00014417          	auipc	s0,0x14
      a8:	0d040413          	add	s0,s0,208 # 14174 <completed.1>
      ac:	00044783          	lbu	a5,0(s0)
      b0:	00112623          	sw	ra,12(sp)
      b4:	02079463          	bnez	a5,dc <.L14>
      b8:	f85ff0ef          	jal	3c <deregister_tm_clones>
      bc:	00010797          	auipc	a5,0x10
      c0:	52c7a783          	lw	a5,1324(a5) # 105e8 <_GLOBAL_OFFSET_TABLE_+0x20>
      c4:	00078863          	beqz	a5,d4 <.L16>
      c8:	00012517          	auipc	a0,0x12
      cc:	69450513          	add	a0,a0,1684 # 1275c <__TMC_END__>
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
      f0:	52c7a783          	lw	a5,1324(a5) # 10618 <.LLST90+0x9>
      f4:	02078463          	beqz	a5,11c <.L27>
      f8:	ff010113          	add	sp,sp,-16
      fc:	00112623          	sw	ra,12(sp)
     100:	00014597          	auipc	a1,0x14
     104:	07858593          	add	a1,a1,120 # 14178 <object.0>
     108:	00012517          	auipc	a0,0x12
     10c:	65450513          	add	a0,a0,1620 # 1275c <__TMC_END__>
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
     170:	4945a583          	lw	a1,1172(a1) # 10600 <_GLOBAL_OFFSET_TABLE_+0x38>
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
     420:	1e47a783          	lw	a5,484(a5) # 10600 <_GLOBAL_OFFSET_TABLE_+0x38>
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
     514:	fffe8693          	add	a3,t4,-1 # ffff <.LBB204+0xb>

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
     564:	fff78793          	add	a5,a5,-1 # ffff <.LBB204+0xb>

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
     584:	fff50513          	add	a0,a0,-1 # ffffff <_ebss+0xfe9ccf>

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
     59c:	fff68693          	add	a3,a3,-1 # 7fffff <_ebss+0x7e9ccf>

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
     668:	fff70713          	add	a4,a4,-1 # 7dffffff <_ebss+0x7dfe9ccf>
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
     710:	fff70713          	add	a4,a4,-1 # fbffffff <_ebss+0xfbfe9ccf>
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
     7bc:	fff48493          	add	s1,s1,-1 # 3ffffff <_ebss+0x3fe9ccf>
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
     7ec:	fff70693          	add	a3,a4,-1 # 3ffffff <_ebss+0x3fe9ccf>

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
     91c:	fff78793          	add	a5,a5,-1 # fbffffff <_ebss+0xfbfe9ccf>
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
     94c:	fff70713          	add	a4,a4,-1 # fbffffff <_ebss+0xfbfe9ccf>
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
     a3c:	f8178793          	add	a5,a5,-127 # 3ffff81 <_ebss+0x3fe9c51>

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
     a64:	c0060613          	add	a2,a2,-1024 # 10660 <.L10>
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
     b18:	fe070713          	add	a4,a4,-32 # ffe0 <.L86>
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
     bd0:	fff78793          	add	a5,a5,-1 # f7ffffff <_ebss+0xf7fe9ccf>
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
     d6c:	f8178793          	add	a5,a5,-127 # 3ffff81 <_ebss+0x3fe9c51>

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
     da8:	fff80513          	add	a0,a6,-1 # ffff <.LBB204+0xb>
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
     eec:	07f68713          	add	a4,a3,127 # 7f80007f <_ebss+0x7f7e9d4f>

00000ef0 <.LVL62>:
     ef0:	08e05c63          	blez	a4,f88 <.L18>
     ef4:	00747793          	and	a5,s0,7
     ef8:	00078a63          	beqz	a5,f0c <.L19>
     efc:	00f47793          	and	a5,s0,15
     f00:	00400613          	li	a2,4
     f04:	00c78463          	beq	a5,a2,f0c <.L19>
     f08:	00440413          	add	s0,s0,4 # 400004 <_ebss+0x3e9cd4>

00000f0c <.L19>:
     f0c:	00441793          	sll	a5,s0,0x4
     f10:	0007da63          	bgez	a5,f24 <.L20>
     f14:	f80007b7          	lui	a5,0xf8000
     f18:	fff78793          	add	a5,a5,-1 # f7ffffff <_ebss+0xf7fe9ccf>
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
    1008:	fff68693          	add	a3,a3,-1 # 7fffff <_ebss+0x7e9ccf>

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
    10e4:	fff70713          	add	a4,a4,-1 # 7dffffff <_ebss+0x7dfe9ccf>
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
    118c:	fff70713          	add	a4,a4,-1 # fbffffff <_ebss+0xfbfe9ccf>
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
    11ac:	00478793          	add	a5,a5,4 # 400004 <_ebss+0x3e9cd4>
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
    1238:	fff48493          	add	s1,s1,-1 # 3ffffff <_ebss+0x3fe9ccf>
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
    1268:	fff70693          	add	a3,a4,-1 # 3ffffff <_ebss+0x3fe9ccf>

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
    1398:	fff78793          	add	a5,a5,-1 # fbffffff <_ebss+0xfbfe9ccf>
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
    13c8:	fff70713          	add	a4,a4,-1 # fbffffff <_ebss+0xfbfe9ccf>
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
    143c:	fff60793          	add	a5,a2,-1 # 7fffff <_ebss+0x7e9ccf>
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
    1460:	fff50513          	add	a0,a0,-1 # 7fffffff <_ebss+0x7ffe9ccf>
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
    14ac:	fff58693          	add	a3,a1,-1 # 7fffff <_ebss+0x7e9ccf>
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
    14e8:	f6a78793          	add	a5,a5,-150 # 3fff6a <_ebss+0x3e9c3a>

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
    15b0:	fff40413          	add	s0,s0,-1 # fbffffff <_ebss+0xfbfe9ccf>

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
    15dc:	fff78793          	add	a5,a5,-1 # fbffffff <_ebss+0xfbfe9ccf>
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
    1638:	fcc7a783          	lw	a5,-52(a5) # 10600 <_GLOBAL_OFFSET_TABLE_+0x38>

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
    1678:	f607a783          	lw	a5,-160(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
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
    16d0:	f087a783          	lw	a5,-248(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
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
    1714:	ec47a783          	lw	a5,-316(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
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
    1740:	04078793          	add	a5,a5,64 # 400040 <_ebss+0x3e9d10>
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
    17d0:	e087a783          	lw	a5,-504(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
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
    17fc:	ddc7a783          	lw	a5,-548(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    1800:	00a7a023          	sw	a0,0(a5)
    1804:	fff00513          	li	a0,-1

00001808 <.L1>:
    1808:	00008067          	ret

0000180c <puts>:
    180c:	0000f797          	auipc	a5,0xf
    1810:	dc07a783          	lw	a5,-576(a5) # 105cc <_GLOBAL_OFFSET_TABLE_+0x4>
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
    1890:	d407a783          	lw	a5,-704(a5) # 105cc <_GLOBAL_OFFSET_TABLE_+0x4>
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
    18c0:	d287a783          	lw	a5,-728(a5) # 105e4 <_GLOBAL_OFFSET_TABLE_+0x1c>
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
    1934:	ca442403          	lw	s0,-860(s0) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    1938:	00912223          	sw	s1,4(sp)
    193c:	00112623          	sw	ra,12(sp)
    1940:	00042483          	lw	s1,0(s0)
    1944:	79c010ef          	jal	30e0 <__GI_isatty>
    1948:	00051c63          	bnez	a0,1960 <.L14>
    194c:	00011717          	auipc	a4,0x11
    1950:	d6070713          	add	a4,a4,-672 # 126ac <_stdio_streams>
    1954:	00075783          	lhu	a5,0(a4)
    1958:	1007c793          	xor	a5,a5,256
    195c:	00f71023          	sh	a5,0(a4)

00001960 <.L14>:
    1960:	00100513          	li	a0,1
    1964:	77c010ef          	jal	30e0 <__GI_isatty>
    1968:	00051c63          	bnez	a0,1980 <.L15>
    196c:	00011717          	auipc	a4,0x11
    1970:	d4070713          	add	a4,a4,-704 # 126ac <_stdio_streams>
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
    19bc:	154030ef          	jal	4b10 <__stdio_WRITE>

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
    1a14:	620030ef          	jal	5034 <__stdio_trans2w>
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
    1a74:	470030ef          	jal	4ee4 <__stdio_fwrite>
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
    1ae4:	380010ef          	jal	2e64 <__GI_strlen>
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
    1b24:	3c0030ef          	jal	4ee4 <__stdio_fwrite>

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
    1bbc:	2a8010ef          	jal	2e64 <__GI_strlen>
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
    1c14:	2d0030ef          	jal	4ee4 <__stdio_fwrite>
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
    1c3c:	93c18c13          	add	s8,gp,-1732 # 1079c <prefix.0>
    1c40:	fffa8a93          	add	s5,s5,-1 # 3fffffff <_ebss+0x3ffe9ccf>
    1c44:	fffb0b13          	add	s6,s6,-1 # fffffff <_ebss+0xffe9ccf>

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
    1c68:	00a6a023          	sw	a0,0(a3) # 7f800000 <_ebss+0x7f7e9cd0>
    1c6c:	00170713          	add	a4,a4,1
    1c70:	00468693          	add	a3,a3,4
    1c74:	4a00006f          	j	2114 <.L29>

00001c78 <.L31>:
    1c78:	00700713          	li	a4,7
    1c7c:	28f76663          	bltu	a4,a5,1f08 <.L33>
    1c80:	00010717          	auipc	a4,0x10
    1c84:	66870713          	add	a4,a4,1640 # 122e8 <spec_base.1>
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
    1d2c:	3dc030ef          	jal	5108 <_load_inttype>
    1d30:	00c12703          	lw	a4,12(sp)
    1d34:	00812683          	lw	a3,8(sp)
    1d38:	0bf10c93          	add	s9,sp,191
    1d3c:	00058613          	mv	a2,a1
    1d40:	00050593          	mv	a1,a0
    1d44:	000c8513          	mv	a0,s9
    1d48:	478030ef          	jal	51c0 <_uintmaxtostr>
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
    1ec4:	020030ef          	jal	4ee4 <__stdio_fwrite>
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
    1ef0:	3ecd0d13          	add	s10,s10,1004 # 122d8 <.LC0>
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
    1f58:	328030ef          	jal	5280 <_fpmaxtostr>

00001f5c <.L108>:
    1f5c:	c60546e3          	bltz	a0,1bc8 <.L60>
    1f60:	00a484b3          	add	s1,s1,a0
    1f64:	1e80006f          	j	214c <.L32>

00001f68 <.L49>:
    1f68:	0047a603          	lw	a2,4(a5)
    1f6c:	0007a583          	lw	a1,0(a5)
    1f70:	00040513          	mv	a0,s0
    1f74:	2a90c0ef          	jal	ea1c <__extenddftf2>
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
    1fc8:	731000ef          	jal	2ef8 <__GI_strnlen>
    1fcc:	00050c93          	mv	s9,a0
    1fd0:	02000913          	li	s2,32
    1fd4:	00b00d93          	li	s11,11
    1fd8:	f21ff06f          	j	1ef8 <.L86>

00001fdc <.L54>:
    1fdc:	00500793          	li	a5,5
    1fe0:	00010d17          	auipc	s10,0x10
    1fe4:	300d0d13          	add	s10,s10,768 # 122e0 <.LC1>
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
    202c:	5ac7a783          	lw	a5,1452(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    2030:	0007a503          	lw	a0,0(a5)
    2034:	08000613          	li	a2,128
    2038:	04010593          	add	a1,sp,64
    203c:	779000ef          	jal	2fb4 <__GI___glibc_strerror_r>
    2040:	00050d13          	mv	s10,a0
    2044:	f71ff06f          	j	1fb4 <.L55>

00002048 <.L57>:
    2048:	0cc12583          	lw	a1,204(sp)
    204c:	00010717          	auipc	a4,0x10
    2050:	6e472703          	lw	a4,1764(a4) # 12730 <_custom_printf_spec>
    2054:	00a70693          	add	a3,a4,10
    2058:	00070793          	mv	a5,a4

0000205c <.L61>:
    205c:	0007c503          	lbu	a0,0(a5)
    2060:	02b51663          	bne	a0,a1,208c <.L58>
    2064:	40e787b3          	sub	a5,a5,a4
    2068:	00279793          	sll	a5,a5,0x2
    206c:	00014717          	auipc	a4,0x14
    2070:	29070713          	add	a4,a4,656 # 162fc <_custom_printf_handler>
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
    20ac:	639020ef          	jal	4ee4 <__stdio_fwrite>
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
    2148:	03c030ef          	jal	5184 <_store_inttype>

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
    22c8:	00478693          	add	a3,a5,4 # 80000004 <_ebss+0x7ffe9cd4>
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
    2330:	0005a683          	lw	a3,0(a1) # 80000000 <_ebss+0x7ffe9cd0>
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
    240c:	96018793          	add	a5,gp,-1696 # 107c0 <type_sizes>
    2410:	94818713          	add	a4,gp,-1720 # 107a8 <type_codes>

00002414 <.L3>:
    2414:	ffe79683          	lh	a3,-2(a5) # 7ffffffe <_ebss+0x7ffe9cce>
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
    24a0:	2ac2a283          	lw	t0,684(t0) # 12748 <__GI___ctype_b>
    24a4:	00000513          	li	a0,0
    24a8:	00000613          	li	a2,0
    24ac:	00000893          	li	a7,0
    24b0:	02a00e93          	li	t4,42
    24b4:	ccb30313          	add	t1,t1,-821 # ccccccb <_ebss+0xccb699b>
    24b8:	00a00393          	li	t2,10
    24bc:	ccce0e13          	add	t3,t3,-820 # ccccccc <_ebss+0xccb699c>
    24c0:	fff80813          	add	a6,a6,-1 # 7fffffff <_ebss+0x7ffe9ccf>
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
    25b4:	d5868693          	add	a3,a3,-680 # 12308 <spec_flags.5>

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
    266c:	96c18713          	add	a4,gp,-1684 # 107cc <qual_chars.4>
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
    26b4:	c4070713          	add	a4,a4,-960 # 122f0 <spec_chars.3>
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
    26dc:	98018513          	add	a0,gp,-1664 # 107e0 <spec_ranges.2>
    26e0:	02e42023          	sw	a4,32(s0)
    26e4:	00050813          	mv	a6,a0

000026e8 <.L34>:
    26e8:	00050593          	mv	a1,a0
    26ec:	0005c303          	lbu	t1,0(a1)
    26f0:	00150513          	add	a0,a0,1
    26f4:	fee34ae3          	blt	t1,a4,26e8 <.L34>
    26f8:	410585b3          	sub	a1,a1,a6
    26fc:	94818713          	add	a4,gp,-1720 # 107a8 <type_codes>
    2700:	00159593          	sll	a1,a1,0x1
    2704:	00b705b3          	add	a1,a4,a1
    2708:	04459703          	lh	a4,68(a1)
    270c:	05459583          	lh	a1,84(a1)
    2710:	00d76733          	or	a4,a4,a3
    2714:	00b77733          	and	a4,a4,a1
    2718:	00e12e23          	sw	a4,28(sp)
    271c:	00010717          	auipc	a4,0x10
    2720:	bd470713          	add	a4,a4,-1068 # 122f0 <spec_chars.3>

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
    2854:	ee072703          	lw	a4,-288(a4) # 12730 <_custom_printf_spec>
    2858:	00a70693          	add	a3,a4,10
    285c:	00070793          	mv	a5,a4

00002860 <.L42>:
    2860:	0007c583          	lbu	a1,0(a5)
    2864:	02c59e63          	bne	a1,a2,28a0 <.L41>
    2868:	40e787b3          	sub	a5,a5,a4
    286c:	00279793          	sll	a5,a5,0x2
    2870:	00014717          	auipc	a4,0x14
    2874:	a6470713          	add	a4,a4,-1436 # 162d4 <_custom_printf_arginfo>
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
    29b8:	67c020ef          	jal	5034 <__stdio_trans2w>
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
    29e8:	128020ef          	jal	4b10 <__stdio_WRITE>
    29ec:	f40510e3          	bnez	a0,292c <.L5>
    29f0:	fd1ff06f          	j	29c0 <.L8>

000029f4 <__GI_fputs>:
    29f4:	fe010113          	add	sp,sp,-32
    29f8:	00812c23          	sw	s0,24(sp)
    29fc:	00912a23          	sw	s1,20(sp)
    2a00:	00112e23          	sw	ra,28(sp)
    2a04:	00050493          	mv	s1,a0
    2a08:	00b12623          	sw	a1,12(sp)
    2a0c:	458000ef          	jal	2e64 <__GI_strlen>
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
    2aa0:	594020ef          	jal	5034 <__stdio_trans2w>
    2aa4:	fc050ae3          	beqz	a0,2a78 <.L5>
    2aa8:	fd5ff06f          	j	2a7c <.L10>

00002aac <.L3>:
    2aac:	fc0908e3          	beqz	s2,2a7c <.L10>
    2ab0:	0324b7b3          	mulhu	a5,s1,s2
    2ab4:	00079e63          	bnez	a5,2ad0 <.L9>
    2ab8:	032485b3          	mul	a1,s1,s2
    2abc:	00040613          	mv	a2,s0
    2ac0:	00098513          	mv	a0,s3
    2ac4:	420020ef          	jal	4ee4 <__stdio_fwrite>
    2ac8:	02955533          	divu	a0,a0,s1
    2acc:	fb5ff06f          	j	2a80 <.L1>

00002ad0 <.L9>:
    2ad0:	00045783          	lhu	a5,0(s0)
    2ad4:	01600713          	li	a4,22
    2ad8:	0087e793          	or	a5,a5,8
    2adc:	00f41023          	sh	a5,0(s0)
    2ae0:	0000e797          	auipc	a5,0xe
    2ae4:	af47a783          	lw	a5,-1292(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
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
    2b40:	9ac18313          	add	t1,gp,-1620 # 1080c <.L8>
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
    2dac:	10168693          	add	a3,a3,257 # 1010101 <_ebss+0xff9dd1>
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

00002e3c <__GI_strcmp>:
    2e3c:	00054703          	lbu	a4,0(a0)
    2e40:	00150513          	add	a0,a0,1
    2e44:	00158593          	add	a1,a1,1
    2e48:	fff5c783          	lbu	a5,-1(a1)
    2e4c:	00071663          	bnez	a4,2e58 <.L2>
    2e50:	40f00533          	neg	a0,a5
    2e54:	00008067          	ret

00002e58 <.L2>:
    2e58:	fef702e3          	beq	a4,a5,2e3c <__GI_strcmp>
    2e5c:	40f70533          	sub	a0,a4,a5
    2e60:	00008067          	ret

00002e64 <__GI_strlen>:
    2e64:	00050793          	mv	a5,a0

00002e68 <.L2>:
    2e68:	0037f713          	and	a4,a5,3
    2e6c:	04071263          	bnez	a4,2eb0 <.L5>
    2e70:	feff0637          	lui	a2,0xfeff0
    2e74:	808085b7          	lui	a1,0x80808
    2e78:	eff60613          	add	a2,a2,-257 # fefefeff <_ebss+0xfefd9bcf>
    2e7c:	08058593          	add	a1,a1,128 # 80808080 <_ebss+0x807f1d50>

00002e80 <.L6>:
    2e80:	0007a683          	lw	a3,0(a5)
    2e84:	00478713          	add	a4,a5,4
    2e88:	00c686b3          	add	a3,a3,a2
    2e8c:	00b6f6b3          	and	a3,a3,a1
    2e90:	02068c63          	beqz	a3,2ec8 <.L7>
    2e94:	ffc74683          	lbu	a3,-4(a4)
    2e98:	02068063          	beqz	a3,2eb8 <.L14>
    2e9c:	ffd74683          	lbu	a3,-3(a4)
    2ea0:	02069863          	bnez	a3,2ed0 <.L9>
    2ea4:	40a787b3          	sub	a5,a5,a0
    2ea8:	00178513          	add	a0,a5,1
    2eac:	00008067          	ret

00002eb0 <.L5>:
    2eb0:	0007c703          	lbu	a4,0(a5)
    2eb4:	00071663          	bnez	a4,2ec0 <.L3>

00002eb8 <.L14>:
    2eb8:	40a78533          	sub	a0,a5,a0
    2ebc:	00008067          	ret

00002ec0 <.L3>:
    2ec0:	00178793          	add	a5,a5,1
    2ec4:	fa5ff06f          	j	2e68 <.L2>

00002ec8 <.L7>:
    2ec8:	00070793          	mv	a5,a4
    2ecc:	fb5ff06f          	j	2e80 <.L6>

00002ed0 <.L9>:
    2ed0:	ffe74683          	lbu	a3,-2(a4)
    2ed4:	00069863          	bnez	a3,2ee4 <.L10>
    2ed8:	40a787b3          	sub	a5,a5,a0
    2edc:	00278513          	add	a0,a5,2
    2ee0:	00008067          	ret

00002ee4 <.L10>:
    2ee4:	fff74683          	lbu	a3,-1(a4)
    2ee8:	fe0690e3          	bnez	a3,2ec8 <.L7>
    2eec:	40a787b3          	sub	a5,a5,a0
    2ef0:	00378513          	add	a0,a5,3
    2ef4:	00008067          	ret

00002ef8 <__GI_strnlen>:
    2ef8:	00050713          	mv	a4,a0
    2efc:	00058513          	mv	a0,a1
    2f00:	06058a63          	beqz	a1,2f74 <.L2>
    2f04:	00b705b3          	add	a1,a4,a1
    2f08:	00e5f463          	bgeu	a1,a4,2f10 <.L3>
    2f0c:	fff00593          	li	a1,-1

00002f10 <.L3>:
    2f10:	00070793          	mv	a5,a4

00002f14 <.L4>:
    2f14:	0037f693          	and	a3,a5,3
    2f18:	04069463          	bnez	a3,2f60 <.L7>
    2f1c:	feff0537          	lui	a0,0xfeff0
    2f20:	80808837          	lui	a6,0x80808
    2f24:	00078693          	mv	a3,a5
    2f28:	eff50513          	add	a0,a0,-257 # fefefeff <_ebss+0xfefd9bcf>
    2f2c:	08080813          	add	a6,a6,128 # 80808080 <_ebss+0x807f1d50>

00002f30 <.L8>:
    2f30:	02b6fc63          	bgeu	a3,a1,2f68 <.L10>
    2f34:	0006a783          	lw	a5,0(a3)
    2f38:	00468613          	add	a2,a3,4
    2f3c:	00a787b3          	add	a5,a5,a0
    2f40:	0107f7b3          	and	a5,a5,a6
    2f44:	04078e63          	beqz	a5,2fa0 <.L18>
    2f48:	ffc64783          	lbu	a5,-4(a2)
    2f4c:	06078063          	beqz	a5,2fac <.L17>
    2f50:	ffd64783          	lbu	a5,-3(a2)
    2f54:	02079663          	bnez	a5,2f80 <.L11>
    2f58:	00168793          	add	a5,a3,1
    2f5c:	00c0006f          	j	2f68 <.L10>

00002f60 <.L7>:
    2f60:	0007c683          	lbu	a3,0(a5)
    2f64:	00069a63          	bnez	a3,2f78 <.L5>

00002f68 <.L10>:
    2f68:	00b7f463          	bgeu	a5,a1,2f70 <.L14>
    2f6c:	00078593          	mv	a1,a5

00002f70 <.L14>:
    2f70:	40e58533          	sub	a0,a1,a4

00002f74 <.L2>:
    2f74:	00008067          	ret

00002f78 <.L5>:
    2f78:	00178793          	add	a5,a5,1
    2f7c:	f99ff06f          	j	2f14 <.L4>

00002f80 <.L11>:
    2f80:	ffe64783          	lbu	a5,-2(a2)
    2f84:	00079663          	bnez	a5,2f90 <.L12>
    2f88:	00268793          	add	a5,a3,2
    2f8c:	fddff06f          	j	2f68 <.L10>

00002f90 <.L12>:
    2f90:	fff64783          	lbu	a5,-1(a2)
    2f94:	00079663          	bnez	a5,2fa0 <.L18>
    2f98:	00368793          	add	a5,a3,3
    2f9c:	fcdff06f          	j	2f68 <.L10>

00002fa0 <.L18>:
    2fa0:	00058793          	mv	a5,a1
    2fa4:	00060693          	mv	a3,a2
    2fa8:	f89ff06f          	j	2f30 <.L8>

00002fac <.L17>:
    2fac:	00068793          	mv	a5,a3
    2fb0:	fb9ff06f          	j	2f68 <.L10>

00002fb4 <__GI___glibc_strerror_r>:
    2fb4:	ff010113          	add	sp,sp,-16
    2fb8:	00812423          	sw	s0,8(sp)
    2fbc:	00112623          	sw	ra,12(sp)
    2fc0:	00058413          	mv	s0,a1
    2fc4:	018000ef          	jal	2fdc <__GI___xpg_strerror_r>
    2fc8:	00c12083          	lw	ra,12(sp)
    2fcc:	00040513          	mv	a0,s0
    2fd0:	00812403          	lw	s0,8(sp)
    2fd4:	01010113          	add	sp,sp,16
    2fd8:	00008067          	ret

00002fdc <__GI___xpg_strerror_r>:
    2fdc:	fa010113          	add	sp,sp,-96
    2fe0:	05312623          	sw	s3,76(sp)
    2fe4:	05412423          	sw	s4,72(sp)
    2fe8:	04112e23          	sw	ra,92(sp)
    2fec:	04812c23          	sw	s0,88(sp)
    2ff0:	04912a23          	sw	s1,84(sp)
    2ff4:	05212823          	sw	s2,80(sp)
    2ff8:	07c00793          	li	a5,124
    2ffc:	00058993          	mv	s3,a1
    3000:	00060a13          	mv	s4,a2
    3004:	08a7f463          	bgeu	a5,a0,308c <.L13>

00003008 <.L3>:
    3008:	00050593          	mv	a1,a0
    300c:	41f55613          	sra	a2,a0,0x1f
    3010:	00000713          	li	a4,0
    3014:	ff600693          	li	a3,-10
    3018:	03d10513          	add	a0,sp,61
    301c:	1a4020ef          	jal	51c0 <_uintmaxtostr>
    3020:	ff250913          	add	s2,a0,-14
    3024:	00e00613          	li	a2,14
    3028:	0000f597          	auipc	a1,0xf
    302c:	2e858593          	add	a1,a1,744 # 12310 <unknown.0>
    3030:	00090513          	mv	a0,s2
    3034:	abdff0ef          	jal	2af0 <__GI_memcpy>
    3038:	01600493          	li	s1,22
    303c:	01c0006f          	j	3058 <.L6>

00003040 <.L5>:
    3040:	00079463          	bnez	a5,3048 <.L4>
    3044:	fff48493          	add	s1,s1,-1

00003048 <.L4>:
    3048:	00190913          	add	s2,s2,1

0000304c <.L2>:
    304c:	00094783          	lbu	a5,0(s2)
    3050:	fe0498e3          	bnez	s1,3040 <.L5>
    3054:	fa078ae3          	beqz	a5,3008 <.L3>

00003058 <.L6>:
    3058:	00099463          	bnez	s3,3060 <.L7>
    305c:	00000a13          	li	s4,0

00003060 <.L7>:
    3060:	00090513          	mv	a0,s2
    3064:	e01ff0ef          	jal	2e64 <__GI_strlen>
    3068:	00150413          	add	s0,a0,1
    306c:	028a7863          	bgeu	s4,s0,309c <.L8>
    3070:	000a0413          	mv	s0,s4
    3074:	02200493          	li	s1,34
    3078:	020a1463          	bnez	s4,30a0 <.L9>

0000307c <.L10>:
    307c:	0000d797          	auipc	a5,0xd
    3080:	5587a783          	lw	a5,1368(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    3084:	0097a023          	sw	s1,0(a5)
    3088:	0340006f          	j	30bc <.L1>

0000308c <.L13>:
    308c:	00050493          	mv	s1,a0
    3090:	0000d917          	auipc	s2,0xd
    3094:	79890913          	add	s2,s2,1944 # 10828 <_string_syserrmsgs>
    3098:	fb5ff06f          	j	304c <.L2>

0000309c <.L8>:
    309c:	00040e63          	beqz	s0,30b8 <.L11>

000030a0 <.L9>:
    30a0:	00098513          	mv	a0,s3
    30a4:	00040613          	mv	a2,s0
    30a8:	00090593          	mv	a1,s2
    30ac:	008989b3          	add	s3,s3,s0
    30b0:	a41ff0ef          	jal	2af0 <__GI_memcpy>
    30b4:	fe098fa3          	sb	zero,-1(s3)

000030b8 <.L11>:
    30b8:	fc0492e3          	bnez	s1,307c <.L10>

000030bc <.L1>:
    30bc:	05c12083          	lw	ra,92(sp)
    30c0:	05812403          	lw	s0,88(sp)
    30c4:	05012903          	lw	s2,80(sp)
    30c8:	04c12983          	lw	s3,76(sp)
    30cc:	04812a03          	lw	s4,72(sp)
    30d0:	00048513          	mv	a0,s1
    30d4:	05412483          	lw	s1,84(sp)
    30d8:	06010113          	add	sp,sp,96
    30dc:	00008067          	ret

000030e0 <__GI_isatty>:
    30e0:	fb010113          	add	sp,sp,-80
    30e4:	00410593          	add	a1,sp,4
    30e8:	04112623          	sw	ra,76(sp)
    30ec:	014000ef          	jal	3100 <__GI_tcgetattr>
    30f0:	04c12083          	lw	ra,76(sp)
    30f4:	00153513          	seqz	a0,a0
    30f8:	05010113          	add	sp,sp,80
    30fc:	00008067          	ret

00003100 <__GI_tcgetattr>:
    3100:	fc010113          	add	sp,sp,-64
    3104:	02812c23          	sw	s0,56(sp)
    3108:	00058413          	mv	s0,a1
    310c:	000055b7          	lui	a1,0x5
    3110:	00c10613          	add	a2,sp,12
    3114:	40158593          	add	a1,a1,1025 # 5401 <.L59+0x4d>
    3118:	02912a23          	sw	s1,52(sp)
    311c:	02112e23          	sw	ra,60(sp)
    3120:	d74fe0ef          	jal	1694 <__GI_ioctl>
    3124:	00050493          	mv	s1,a0
    3128:	04051463          	bnez	a0,3170 <.L1>
    312c:	00c12783          	lw	a5,12(sp)
    3130:	01300613          	li	a2,19
    3134:	01d10593          	add	a1,sp,29
    3138:	00f42023          	sw	a5,0(s0)
    313c:	01012783          	lw	a5,16(sp)
    3140:	01140513          	add	a0,s0,17
    3144:	00f42223          	sw	a5,4(s0)
    3148:	01412783          	lw	a5,20(sp)
    314c:	00f42423          	sw	a5,8(s0)
    3150:	01812783          	lw	a5,24(sp)
    3154:	00f42623          	sw	a5,12(s0)
    3158:	01c14783          	lbu	a5,28(sp)
    315c:	00f40823          	sb	a5,16(s0)
    3160:	08c030ef          	jal	61ec <__GI_mempcpy>
    3164:	00d00613          	li	a2,13
    3168:	00000593          	li	a1,0
    316c:	c2dff0ef          	jal	2d98 <__GI_memset>

00003170 <.L1>:
    3170:	03c12083          	lw	ra,60(sp)
    3174:	03812403          	lw	s0,56(sp)
    3178:	00048513          	mv	a0,s1
    317c:	03412483          	lw	s1,52(sp)
    3180:	04010113          	add	sp,sp,64
    3184:	00008067          	ret

00003188 <__malloc_from_heap>:
    3188:	fd010113          	add	sp,sp,-48
    318c:	01412c23          	sw	s4,24(sp)
    3190:	01512a23          	sw	s5,20(sp)
    3194:	00058a13          	mv	s4,a1
    3198:	00850513          	add	a0,a0,8
    319c:	00c10a93          	add	s5,sp,12
    31a0:	00a12623          	sw	a0,12(sp)
    31a4:	000a8593          	mv	a1,s5
    31a8:	000a0513          	mv	a0,s4
    31ac:	03212023          	sw	s2,32(sp)
    31b0:	02112623          	sw	ra,44(sp)
    31b4:	02812423          	sw	s0,40(sp)
    31b8:	02912223          	sw	s1,36(sp)
    31bc:	01312e23          	sw	s3,28(sp)
    31c0:	354000ef          	jal	3514 <__heap_alloc>
    31c4:	00050913          	mv	s2,a0
    31c8:	0a051863          	bnez	a0,3278 <.L2>
    31cc:	00050493          	mv	s1,a0
    31d0:	01e00513          	li	a0,30
    31d4:	0fd000ef          	jal	3ad0 <__GI_sysconf>
    31d8:	00c12783          	lw	a5,12(sp)
    31dc:	0ca7f863          	bgeu	a5,a0,32ac <.L3>
    31e0:	01e00513          	li	a0,30
    31e4:	0ed000ef          	jal	3ad0 <__GI_sysconf>
    31e8:	00050413          	mv	s0,a0

000031ec <.L4>:
    31ec:	040006b7          	lui	a3,0x4000
    31f0:	00000793          	li	a5,0
    31f4:	00000713          	li	a4,0
    31f8:	02168693          	add	a3,a3,33 # 4000021 <_ebss+0x3fe9cf1>
    31fc:	00300613          	li	a2,3
    3200:	00040593          	mv	a1,s0
    3204:	00000513          	li	a0,0
    3208:	0bc010ef          	jal	42c4 <__GI_mmap>
    320c:	fff00793          	li	a5,-1
    3210:	00050993          	mv	s3,a0
    3214:	06f50863          	beq	a0,a5,3284 <.L1>
    3218:	00040613          	mv	a2,s0
    321c:	00050593          	mv	a1,a0
    3220:	000a0513          	mv	a0,s4
    3224:	378000ef          	jal	359c <__heap_free>
    3228:	000a8593          	mv	a1,s5
    322c:	000a0513          	mv	a0,s4
    3230:	2e4000ef          	jal	3514 <__heap_alloc>
    3234:	00050913          	mv	s2,a0
    3238:	0000d597          	auipc	a1,0xd
    323c:	3dc5a583          	lw	a1,988(a1) # 10614 <.LLST90+0x5>
    3240:	00c00513          	li	a0,12
    3244:	f45ff0ef          	jal	3188 <__malloc_from_heap>
    3248:	0000d617          	auipc	a2,0xd
    324c:	39462603          	lw	a2,916(a2) # 105dc <_GLOBAL_OFFSET_TABLE_+0x14>
    3250:	00062703          	lw	a4,0(a2)
    3254:	00050793          	mv	a5,a0
    3258:	00000693          	li	a3,0

0000325c <.L7>:
    325c:	06071c63          	bnez	a4,32d4 <.L9>

00003260 <.L8>:
    3260:	00e7a423          	sw	a4,8(a5)
    3264:	0137a023          	sw	s3,0(a5)
    3268:	0087a223          	sw	s0,4(a5)
    326c:	06068e63          	beqz	a3,32e8 <.L10>
    3270:	00f6a423          	sw	a5,8(a3)

00003274 <.L11>:
    3274:	00090863          	beqz	s2,3284 <.L1>

00003278 <.L2>:
    3278:	00c12783          	lw	a5,12(sp)
    327c:	00890493          	add	s1,s2,8
    3280:	00f92023          	sw	a5,0(s2)

00003284 <.L1>:
    3284:	02c12083          	lw	ra,44(sp)
    3288:	02812403          	lw	s0,40(sp)
    328c:	02012903          	lw	s2,32(sp)
    3290:	01c12983          	lw	s3,28(sp)
    3294:	01812a03          	lw	s4,24(sp)
    3298:	01412a83          	lw	s5,20(sp)
    329c:	00048513          	mv	a0,s1
    32a0:	02412483          	lw	s1,36(sp)
    32a4:	03010113          	add	sp,sp,48
    32a8:	00008067          	ret

000032ac <.L3>:
    32ac:	01e00513          	li	a0,30
    32b0:	021000ef          	jal	3ad0 <__GI_sysconf>
    32b4:	00c12903          	lw	s2,12(sp)
    32b8:	fff90913          	add	s2,s2,-1
    32bc:	00a90933          	add	s2,s2,a0
    32c0:	01e00513          	li	a0,30
    32c4:	00d000ef          	jal	3ad0 <__GI_sysconf>
    32c8:	40a00433          	neg	s0,a0
    32cc:	01247433          	and	s0,s0,s2
    32d0:	f1dff06f          	j	31ec <.L4>

000032d4 <.L9>:
    32d4:	00072583          	lw	a1,0(a4)
    32d8:	f8b9e4e3          	bltu	s3,a1,3260 <.L8>
    32dc:	00070693          	mv	a3,a4
    32e0:	00872703          	lw	a4,8(a4)
    32e4:	f79ff06f          	j	325c <.L7>

000032e8 <.L10>:
    32e8:	00f62023          	sw	a5,0(a2)
    32ec:	f89ff06f          	j	3274 <.L11>

000032f0 <malloc>:
    32f0:	02050263          	beqz	a0,3314 <.L23>
    32f4:	ff000793          	li	a5,-16
    32f8:	02a7f063          	bgeu	a5,a0,3318 <.L20>
    32fc:	0000d797          	auipc	a5,0xd
    3300:	2d87a783          	lw	a5,728(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    3304:	00c00713          	li	a4,12
    3308:	00e7a023          	sw	a4,0(a5)
    330c:	00000513          	li	a0,0
    3310:	00008067          	ret

00003314 <.L23>:
    3314:	00100513          	li	a0,1

00003318 <.L20>:
    3318:	ff010113          	add	sp,sp,-16
    331c:	0000f597          	auipc	a1,0xf
    3320:	41858593          	add	a1,a1,1048 # 12734 <__malloc_heap>
    3324:	00112623          	sw	ra,12(sp)
    3328:	e61ff0ef          	jal	3188 <__malloc_from_heap>
    332c:	00051c63          	bnez	a0,3344 <.L19>
    3330:	0000d797          	auipc	a5,0xd
    3334:	2a47a783          	lw	a5,676(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    3338:	00c00713          	li	a4,12
    333c:	00e7a023          	sw	a4,0(a5)
    3340:	00000513          	li	a0,0

00003344 <.L19>:
    3344:	00c12083          	lw	ra,12(sp)
    3348:	01010113          	add	sp,sp,16
    334c:	00008067          	ret

00003350 <__free_to_heap>:
    3350:	1a050a63          	beqz	a0,3504 <.L25>
    3354:	fd010113          	add	sp,sp,-48
    3358:	ff852603          	lw	a2,-8(a0)
    335c:	03212023          	sw	s2,32(sp)
    3360:	00058913          	mv	s2,a1
    3364:	ff850593          	add	a1,a0,-8
    3368:	00090513          	mv	a0,s2
    336c:	02112623          	sw	ra,44(sp)
    3370:	02812423          	sw	s0,40(sp)
    3374:	02912223          	sw	s1,36(sp)
    3378:	01312e23          	sw	s3,28(sp)
    337c:	01412c23          	sw	s4,24(sp)
    3380:	01512a23          	sw	s5,20(sp)
    3384:	01612823          	sw	s6,16(sp)
    3388:	01712623          	sw	s7,12(sp)
    338c:	01812423          	sw	s8,8(sp)
    3390:	01912223          	sw	s9,4(sp)
    3394:	01a12023          	sw	s10,0(sp)
    3398:	204000ef          	jal	359c <__heap_free>
    339c:	00052483          	lw	s1,0(a0)
    33a0:	00050413          	mv	s0,a0
    33a4:	01e00513          	li	a0,30
    33a8:	728000ef          	jal	3ad0 <__GI_sysconf>
    33ac:	00351513          	sll	a0,a0,0x3
    33b0:	10a4ee63          	bltu	s1,a0,34cc <.L1>
    33b4:	00042783          	lw	a5,0(s0)
    33b8:	00c40993          	add	s3,s0,12
    33bc:	40f407b3          	sub	a5,s0,a5
    33c0:	00c78593          	add	a1,a5,12
    33c4:	00442783          	lw	a5,4(s0)
    33c8:	00078663          	beqz	a5,33d4 <.L5>
    33cc:	00842703          	lw	a4,8(s0)
    33d0:	00e7a423          	sw	a4,8(a5)

000033d4 <.L5>:
    33d4:	00842703          	lw	a4,8(s0)
    33d8:	06070e63          	beqz	a4,3454 <.L6>
    33dc:	00f72223          	sw	a5,4(a4)

000033e0 <.L7>:
    33e0:	0000dc17          	auipc	s8,0xd
    33e4:	1fcc2c03          	lw	s8,508(s8) # 105dc <_GLOBAL_OFFSET_TABLE_+0x14>
    33e8:	000c2483          	lw	s1,0(s8)
    33ec:	00000a93          	li	s5,0
    33f0:	0000dc97          	auipc	s9,0xd
    33f4:	224cac83          	lw	s9,548(s9) # 10614 <.LLST90+0x5>
    33f8:	03000d13          	li	s10,48

000033fc <.L8>:
    33fc:	00048a63          	beqz	s1,3410 <.L12>
    3400:	0004a403          	lw	s0,0(s1)
    3404:	0044ab83          	lw	s7,4(s1)
    3408:	008b8a33          	add	s4,s7,s0
    340c:	0549f863          	bgeu	s3,s4,345c <.L17>

00003410 <.L12>:
    3410:	0b358e63          	beq	a1,s3,34cc <.L1>
    3414:	02812403          	lw	s0,40(sp)
    3418:	02c12083          	lw	ra,44(sp)
    341c:	02412483          	lw	s1,36(sp)
    3420:	01812a03          	lw	s4,24(sp)
    3424:	01412a83          	lw	s5,20(sp)
    3428:	01012b03          	lw	s6,16(sp)
    342c:	00c12b83          	lw	s7,12(sp)
    3430:	00812c03          	lw	s8,8(sp)
    3434:	00412c83          	lw	s9,4(sp)
    3438:	00012d03          	lw	s10,0(sp)
    343c:	40b98633          	sub	a2,s3,a1
    3440:	00090513          	mv	a0,s2
    3444:	01c12983          	lw	s3,28(sp)
    3448:	02012903          	lw	s2,32(sp)
    344c:	03010113          	add	sp,sp,48
    3450:	14c0006f          	j	359c <__heap_free>

00003454 <.L6>:
    3454:	00f92023          	sw	a5,0(s2)
    3458:	f89ff06f          	j	33e0 <.L7>

0000345c <.L17>:
    345c:	0084ab03          	lw	s6,8(s1)
    3460:	06b46063          	bltu	s0,a1,34c0 <.L9>
    3464:	00858663          	beq	a1,s0,3470 <.L10>
    3468:	40b407b3          	sub	a5,s0,a1
    346c:	04fd7a63          	bgeu	s10,a5,34c0 <.L9>

00003470 <.L10>:
    3470:	01498663          	beq	s3,s4,347c <.L11>
    3474:	030a0793          	add	a5,s4,48
    3478:	f8f9ece3          	bltu	s3,a5,3410 <.L12>

0000347c <.L11>:
    347c:	00b40863          	beq	s0,a1,348c <.L13>
    3480:	40b40633          	sub	a2,s0,a1
    3484:	00090513          	mv	a0,s2
    3488:	114000ef          	jal	359c <__heap_free>

0000348c <.L13>:
    348c:	020a8663          	beqz	s5,34b8 <.L14>
    3490:	016aa423          	sw	s6,8(s5)

00003494 <.L15>:
    3494:	000c8593          	mv	a1,s9
    3498:	00048513          	mv	a0,s1
    349c:	eb5ff0ef          	jal	3350 <__free_to_heap>
    34a0:	000b8593          	mv	a1,s7
    34a4:	00040513          	mv	a0,s0
    34a8:	665000ef          	jal	430c <__GI_munmap>

000034ac <.L16>:
    34ac:	000b0493          	mv	s1,s6
    34b0:	000a0593          	mv	a1,s4
    34b4:	f49ff06f          	j	33fc <.L8>

000034b8 <.L14>:
    34b8:	016c2023          	sw	s6,0(s8)
    34bc:	fd9ff06f          	j	3494 <.L15>

000034c0 <.L9>:
    34c0:	00048a93          	mv	s5,s1
    34c4:	00058a13          	mv	s4,a1
    34c8:	fe5ff06f          	j	34ac <.L16>

000034cc <.L1>:
    34cc:	02c12083          	lw	ra,44(sp)
    34d0:	02812403          	lw	s0,40(sp)
    34d4:	02412483          	lw	s1,36(sp)
    34d8:	02012903          	lw	s2,32(sp)
    34dc:	01c12983          	lw	s3,28(sp)
    34e0:	01812a03          	lw	s4,24(sp)
    34e4:	01412a83          	lw	s5,20(sp)
    34e8:	01012b03          	lw	s6,16(sp)
    34ec:	00c12b83          	lw	s7,12(sp)
    34f0:	00812c03          	lw	s8,8(sp)
    34f4:	00412c83          	lw	s9,4(sp)
    34f8:	00012d03          	lw	s10,0(sp)
    34fc:	03010113          	add	sp,sp,48
    3500:	00008067          	ret

00003504 <.L25>:
    3504:	00008067          	ret

00003508 <free>:
    3508:	0000f597          	auipc	a1,0xf
    350c:	22c58593          	add	a1,a1,556 # 12734 <__malloc_heap>
    3510:	e41ff06f          	j	3350 <__free_to_heap>

00003514 <__heap_alloc>:
    3514:	0005a783          	lw	a5,0(a1)
    3518:	00b00713          	li	a4,11
    351c:	00050693          	mv	a3,a0
    3520:	00778793          	add	a5,a5,7
    3524:	ff87f793          	and	a5,a5,-8
    3528:	00f76463          	bltu	a4,a5,3530 <.L2>
    352c:	01000793          	li	a5,16

00003530 <.L2>:
    3530:	0006a503          	lw	a0,0(a3)

00003534 <.L3>:
    3534:	00051463          	bnez	a0,353c <.L11>
    3538:	00008067          	ret

0000353c <.L11>:
    353c:	00052703          	lw	a4,0(a0)
    3540:	04f76a63          	bltu	a4,a5,3594 <.L4>
    3544:	40e50633          	sub	a2,a0,a4
    3548:	03078813          	add	a6,a5,48
    354c:	00c60613          	add	a2,a2,12
    3550:	03077a63          	bgeu	a4,a6,3584 <.L5>
    3554:	00452783          	lw	a5,4(a0)
    3558:	00078663          	beqz	a5,3564 <.L6>
    355c:	00852803          	lw	a6,8(a0)
    3560:	0107a423          	sw	a6,8(a5)

00003564 <.L6>:
    3564:	00852503          	lw	a0,8(a0)
    3568:	00050a63          	beqz	a0,357c <.L7>
    356c:	00f52223          	sw	a5,4(a0)

00003570 <.L9>:
    3570:	00e5a023          	sw	a4,0(a1)
    3574:	00060513          	mv	a0,a2
    3578:	00008067          	ret

0000357c <.L7>:
    357c:	00f6a023          	sw	a5,0(a3)
    3580:	ff1ff06f          	j	3570 <.L9>

00003584 <.L5>:
    3584:	40f70733          	sub	a4,a4,a5
    3588:	00e52023          	sw	a4,0(a0)
    358c:	00078713          	mv	a4,a5
    3590:	fe1ff06f          	j	3570 <.L9>

00003594 <.L4>:
    3594:	00452503          	lw	a0,4(a0)
    3598:	f9dff06f          	j	3534 <.L3>

0000359c <__heap_free>:
    359c:	00050813          	mv	a6,a0
    35a0:	00052503          	lw	a0,0(a0)
    35a4:	00c58333          	add	t1,a1,a2
    35a8:	00000793          	li	a5,0

000035ac <.L2>:
    35ac:	02051863          	bnez	a0,35dc <.L4>

000035b0 <.L5>:
    35b0:	ff460713          	add	a4,a2,-12
    35b4:	00e585b3          	add	a1,a1,a4
    35b8:	00c5a023          	sw	a2,0(a1)
    35bc:	00a5a223          	sw	a0,4(a1)
    35c0:	00f5a423          	sw	a5,8(a1)
    35c4:	0c078e63          	beqz	a5,36a0 <.L17>
    35c8:	00b7a223          	sw	a1,4(a5)

000035cc <.L18>:
    35cc:	00050463          	beqz	a0,35d4 <.L19>
    35d0:	00b52423          	sw	a1,8(a0)

000035d4 <.L19>:
    35d4:	00058513          	mv	a0,a1
    35d8:	00008067          	ret

000035dc <.L4>:
    35dc:	00c50713          	add	a4,a0,12
    35e0:	00b77863          	bgeu	a4,a1,35f0 <.L3>
    35e4:	00050793          	mv	a5,a0
    35e8:	00452503          	lw	a0,4(a0)
    35ec:	fc1ff06f          	j	35ac <.L2>

000035f0 <.L3>:
    35f0:	00052683          	lw	a3,0(a0)
    35f4:	00c00893          	li	a7,12
    35f8:	40d88733          	sub	a4,a7,a3
    35fc:	00e50733          	add	a4,a0,a4
    3600:	fae368e3          	bltu	t1,a4,35b0 <.L5>
    3604:	00c686b3          	add	a3,a3,a2
    3608:	02671c63          	bne	a4,t1,3640 <.L6>
    360c:	02078263          	beqz	a5,3630 <.L7>
    3610:	00c78713          	add	a4,a5,12
    3614:	00e59e63          	bne	a1,a4,3630 <.L7>
    3618:	0007a703          	lw	a4,0(a5)
    361c:	0087a783          	lw	a5,8(a5)
    3620:	00e686b3          	add	a3,a3,a4
    3624:	00078a63          	beqz	a5,3638 <.L8>
    3628:	00a7a223          	sw	a0,4(a5)

0000362c <.L9>:
    362c:	00f52423          	sw	a5,8(a0)

00003630 <.L7>:
    3630:	00d52023          	sw	a3,0(a0)
    3634:	00008067          	ret

00003638 <.L8>:
    3638:	00a82023          	sw	a0,0(a6)
    363c:	ff1ff06f          	j	362c <.L9>

00003640 <.L6>:
    3640:	00452703          	lw	a4,4(a0)
    3644:	02070a63          	beqz	a4,3678 <.L10>
    3648:	00072583          	lw	a1,0(a4)
    364c:	40b888b3          	sub	a7,a7,a1
    3650:	011708b3          	add	a7,a4,a7
    3654:	03131263          	bne	t1,a7,3678 <.L10>
    3658:	00b686b3          	add	a3,a3,a1
    365c:	00078a63          	beqz	a5,3670 <.L11>
    3660:	00e7a223          	sw	a4,4(a5)

00003664 <.L12>:
    3664:	00f72423          	sw	a5,8(a4)
    3668:	00070513          	mv	a0,a4
    366c:	fc5ff06f          	j	3630 <.L7>

00003670 <.L11>:
    3670:	00e82023          	sw	a4,0(a6)
    3674:	ff1ff06f          	j	3664 <.L12>

00003678 <.L10>:
    3678:	00c50533          	add	a0,a0,a2
    367c:	00e52223          	sw	a4,4(a0)
    3680:	00f52423          	sw	a5,8(a0)
    3684:	00078a63          	beqz	a5,3698 <.L13>
    3688:	00a7a223          	sw	a0,4(a5)

0000368c <.L14>:
    368c:	fa0702e3          	beqz	a4,3630 <.L7>
    3690:	00a72423          	sw	a0,8(a4)
    3694:	f9dff06f          	j	3630 <.L7>

00003698 <.L13>:
    3698:	00a82023          	sw	a0,0(a6)
    369c:	ff1ff06f          	j	368c <.L14>

000036a0 <.L17>:
    36a0:	00b82023          	sw	a1,0(a6)
    36a4:	f29ff06f          	j	35cc <.L18>

000036a8 <__GI_atoi>:
    36a8:	00a00613          	li	a2,10
    36ac:	00000593          	li	a1,0
    36b0:	0040006f          	j	36b4 <__GI_strtol>

000036b4 <__GI_strtol>:
    36b4:	00100693          	li	a3,1
    36b8:	0040006f          	j	36bc <_stdlib_strto_l>

000036bc <_stdlib_strto_l>:
    36bc:	00050893          	mv	a7,a0
    36c0:	00088813          	mv	a6,a7
    36c4:	0000f517          	auipc	a0,0xf
    36c8:	08452503          	lw	a0,132(a0) # 12748 <__GI___ctype_b>

000036cc <.L2>:
    36cc:	00084783          	lbu	a5,0(a6)
    36d0:	00179713          	sll	a4,a5,0x1
    36d4:	00e50733          	add	a4,a0,a4
    36d8:	00075703          	lhu	a4,0(a4)
    36dc:	02077713          	and	a4,a4,32
    36e0:	08071a63          	bnez	a4,3774 <.L3>
    36e4:	02b00713          	li	a4,43
    36e8:	08e78a63          	beq	a5,a4,377c <.L25>
    36ec:	02d00713          	li	a4,45
    36f0:	00000313          	li	t1,0
    36f4:	00e79663          	bne	a5,a4,3700 <.L5>
    36f8:	00100313          	li	t1,1

000036fc <.L4>:
    36fc:	00180813          	add	a6,a6,1

00003700 <.L5>:
    3700:	fef67793          	and	a5,a2,-17
    3704:	0a079663          	bnez	a5,37b0 <.L6>
    3708:	00084703          	lbu	a4,0(a6)
    370c:	03000793          	li	a5,48
    3710:	06f70a63          	beq	a4,a5,3784 <.L7>
    3714:	00a60613          	add	a2,a2,10

00003718 <.L8>:
    3718:	01000793          	li	a5,16
    371c:	00c7d463          	bge	a5,a2,3724 <.L10>
    3720:	01000613          	li	a2,16

00003724 <.L10>:
    3724:	fff00713          	li	a4,-1
    3728:	02c77eb3          	remu	t4,a4,a2
    372c:	00000e13          	li	t3,0
    3730:	00000513          	li	a0,0
    3734:	00900f93          	li	t6,9
    3738:	06000293          	li	t0,96
    373c:	02c75733          	divu	a4,a4,a2
    3740:	0ffefe93          	zext.b	t4,t4

00003744 <.L12>:
    3744:	00084f03          	lbu	t5,0(a6)
    3748:	fd0f0793          	add	a5,t5,-48
    374c:	0ff7f793          	zext.b	a5,a5
    3750:	0afffa63          	bgeu	t6,a5,3804 <.L13>
    3754:	020f6793          	or	a5,t5,32
    3758:	0af2e263          	bltu	t0,a5,37fc <.L14>

0000375c <.L17>:
    375c:	060e0263          	beqz	t3,37c0 <.L11>
    3760:	0000d797          	auipc	a5,0xd
    3764:	e747a783          	lw	a5,-396(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    3768:	02200713          	li	a4,34
    376c:	00e7a023          	sw	a4,0(a5)
    3770:	0500006f          	j	37c0 <.L11>

00003774 <.L3>:
    3774:	00180813          	add	a6,a6,1
    3778:	f55ff06f          	j	36cc <.L2>

0000377c <.L25>:
    377c:	00000313          	li	t1,0
    3780:	f7dff06f          	j	36fc <.L4>

00003784 <.L7>:
    3784:	00184783          	lbu	a5,1(a6)
    3788:	07800713          	li	a4,120
    378c:	00180893          	add	a7,a6,1
    3790:	0207e793          	or	a5,a5,32
    3794:	00860613          	add	a2,a2,8
    3798:	00e79863          	bne	a5,a4,37a8 <.L27>
    379c:	00280813          	add	a6,a6,2
    37a0:	00161613          	sll	a2,a2,0x1
    37a4:	f75ff06f          	j	3718 <.L8>

000037a8 <.L27>:
    37a8:	00088813          	mv	a6,a7
    37ac:	f6dff06f          	j	3718 <.L8>

000037b0 <.L6>:
    37b0:	ffe60793          	add	a5,a2,-2
    37b4:	02200713          	li	a4,34
    37b8:	00000513          	li	a0,0
    37bc:	f6f774e3          	bgeu	a4,a5,3724 <.L10>

000037c0 <.L11>:
    37c0:	00058463          	beqz	a1,37c8 <.L22>
    37c4:	0115a023          	sw	a7,0(a1)

000037c8 <.L22>:
    37c8:	02068463          	beqz	a3,37f0 <.L23>
    37cc:	800007b7          	lui	a5,0x80000
    37d0:	fff78793          	add	a5,a5,-1 # 7fffffff <_ebss+0x7ffe9ccf>
    37d4:	00f307b3          	add	a5,t1,a5
    37d8:	00a7fc63          	bgeu	a5,a0,37f0 <.L23>
    37dc:	0000d717          	auipc	a4,0xd
    37e0:	df872703          	lw	a4,-520(a4) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    37e4:	02200693          	li	a3,34
    37e8:	00d72023          	sw	a3,0(a4)
    37ec:	00078513          	mv	a0,a5

000037f0 <.L23>:
    37f0:	00030463          	beqz	t1,37f8 <.L1>
    37f4:	40a00533          	neg	a0,a0

000037f8 <.L1>:
    37f8:	00008067          	ret

000037fc <.L14>:
    37fc:	fa978793          	add	a5,a5,-87
    3800:	0ff7f793          	zext.b	a5,a5

00003804 <.L13>:
    3804:	f4c7dce3          	bge	a5,a2,375c <.L17>
    3808:	00180813          	add	a6,a6,1
    380c:	00a76663          	bltu	a4,a0,3818 <.L18>
    3810:	00e51e63          	bne	a0,a4,382c <.L19>
    3814:	00fefc63          	bgeu	t4,a5,382c <.L19>

00003818 <.L18>:
    3818:	00d37333          	and	t1,t1,a3
    381c:	00100e13          	li	t3,1
    3820:	fff00513          	li	a0,-1

00003824 <.L20>:
    3824:	00080893          	mv	a7,a6
    3828:	f1dff06f          	j	3744 <.L12>

0000382c <.L19>:
    382c:	02a60533          	mul	a0,a2,a0
    3830:	00a78533          	add	a0,a5,a0
    3834:	ff1ff06f          	j	3824 <.L20>

00003838 <__GI_sleep>:
    3838:	fc010113          	add	sp,sp,-64
    383c:	02812c23          	sw	s0,56(sp)
    3840:	02112e23          	sw	ra,60(sp)
    3844:	00a12623          	sw	a0,12(sp)
    3848:	00012823          	sw	zero,16(sp)
    384c:	00050413          	mv	s0,a0
    3850:	08050263          	beqz	a0,38d4 <.L2>
    3854:	000107b7          	lui	a5,0x10
    3858:	01c10613          	add	a2,sp,28
    385c:	00000593          	li	a1,0
    3860:	01100513          	li	a0,17
    3864:	00f12a23          	sw	a5,20(sp)
    3868:	00012c23          	sw	zero,24(sp)
    386c:	4f1020ef          	jal	655c <__GI_sigaction>
    3870:	01c12703          	lw	a4,28(sp)
    3874:	00100793          	li	a5,1
    3878:	00f71a63          	bne	a4,a5,388c <.L3>
    387c:	01410613          	add	a2,sp,20
    3880:	00060593          	mv	a1,a2
    3884:	00000513          	li	a0,0
    3888:	2d5000ef          	jal	435c <__GI_sigprocmask>

0000388c <.L3>:
    388c:	00c10593          	add	a1,sp,12
    3890:	00058513          	mv	a0,a1
    3894:	2a1000ef          	jal	4334 <__GI_nanosleep>
    3898:	00000413          	li	s0,0
    389c:	00050e63          	beqz	a0,38b8 <.L4>
    38a0:	01012403          	lw	s0,16(sp)
    38a4:	1dcd67b7          	lui	a5,0x1dcd6
    38a8:	4ff78793          	add	a5,a5,1279 # 1dcd64ff <_ebss+0x1dcc01cf>
    38ac:	0087a433          	slt	s0,a5,s0
    38b0:	00c12783          	lw	a5,12(sp)
    38b4:	00f40433          	add	s0,s0,a5

000038b8 <.L4>:
    38b8:	01412783          	lw	a5,20(sp)
    38bc:	00f79713          	sll	a4,a5,0xf
    38c0:	00074a63          	bltz	a4,38d4 <.L2>
    38c4:	00000613          	li	a2,0
    38c8:	01410593          	add	a1,sp,20
    38cc:	00200513          	li	a0,2
    38d0:	28d000ef          	jal	435c <__GI_sigprocmask>

000038d4 <.L2>:
    38d4:	03c12083          	lw	ra,60(sp)
    38d8:	00040513          	mv	a0,s0
    38dc:	03812403          	lw	s0,56(sp)
    38e0:	04010113          	add	sp,sp,64
    38e4:	00008067          	ret

000038e8 <nprocessors_onln>:
    38e8:	fd010113          	add	sp,sp,-48
    38ec:	0000f517          	auipc	a0,0xf
    38f0:	a3450513          	add	a0,a0,-1484 # 12320 <.LC0>
    38f4:	02912223          	sw	s1,36(sp)
    38f8:	02112623          	sw	ra,44(sp)
    38fc:	02812423          	sw	s0,40(sp)
    3900:	03212023          	sw	s2,32(sp)
    3904:	01312e23          	sw	s3,28(sp)
    3908:	01412c23          	sw	s4,24(sp)
    390c:	01512a23          	sw	s5,20(sp)
    3910:	00012623          	sw	zero,12(sp)
    3914:	549000ef          	jal	465c <__GI_config_open>
    3918:	00000493          	li	s1,0
    391c:	0a050c63          	beqz	a0,39d4 <.L19>
    3920:	00050413          	mv	s0,a0
    3924:	00c10913          	add	s2,sp,12
    3928:	0000f997          	auipc	s3,0xf
    392c:	a0498993          	add	s3,s3,-1532 # 1232c <.LC1>
    3930:	06300a13          	li	s4,99
    3934:	07000a93          	li	s5,112

00003938 <.L2>:
    3938:	00098693          	mv	a3,s3
    393c:	10200613          	li	a2,258
    3940:	00090593          	mv	a1,s2
    3944:	00040513          	mv	a0,s0
    3948:	5a9000ef          	jal	46f0 <__GI_config_read>
    394c:	02051e63          	bnez	a0,3988 <.L5>

00003950 <.L6>:
    3950:	00040513          	mv	a0,s0
    3954:	559000ef          	jal	46ac <__GI_config_close>
    3958:	00049463          	bnez	s1,3960 <.L1>
    395c:	00100493          	li	s1,1

00003960 <.L1>:
    3960:	02c12083          	lw	ra,44(sp)
    3964:	02812403          	lw	s0,40(sp)
    3968:	02012903          	lw	s2,32(sp)
    396c:	01c12983          	lw	s3,28(sp)
    3970:	01812a03          	lw	s4,24(sp)
    3974:	01412a83          	lw	s5,20(sp)
    3978:	00048513          	mv	a0,s1
    397c:	02412483          	lw	s1,36(sp)
    3980:	03010113          	add	sp,sp,48
    3984:	00008067          	ret

00003988 <.L5>:
    3988:	00c12783          	lw	a5,12(sp)
    398c:	0007a783          	lw	a5,0(a5)
    3990:	0007c703          	lbu	a4,0(a5)
    3994:	fb4712e3          	bne	a4,s4,3938 <.L2>
    3998:	0017c703          	lbu	a4,1(a5)
    399c:	f9571ee3          	bne	a4,s5,3938 <.L2>
    39a0:	0027c683          	lbu	a3,2(a5)
    39a4:	07500713          	li	a4,117
    39a8:	f8e698e3          	bne	a3,a4,3938 <.L2>
    39ac:	0037c703          	lbu	a4,3(a5)
    39b0:	0000f797          	auipc	a5,0xf
    39b4:	d987a783          	lw	a5,-616(a5) # 12748 <__GI___ctype_b>
    39b8:	00171713          	sll	a4,a4,0x1
    39bc:	00e787b3          	add	a5,a5,a4
    39c0:	0007d783          	lhu	a5,0(a5)
    39c4:	0087f793          	and	a5,a5,8
    39c8:	f60788e3          	beqz	a5,3938 <.L2>
    39cc:	00148493          	add	s1,s1,1
    39d0:	f69ff06f          	j	3938 <.L2>

000039d4 <.L19>:
    39d4:	0000f517          	auipc	a0,0xf
    39d8:	95c50513          	add	a0,a0,-1700 # 12330 <.LC2>
    39dc:	481000ef          	jal	465c <__GI_config_open>
    39e0:	00050413          	mv	s0,a0
    39e4:	f60506e3          	beqz	a0,3950 <.L6>
    39e8:	00070937          	lui	s2,0x70
    39ec:	00c10993          	add	s3,sp,12
    39f0:	0000ea17          	auipc	s4,0xe
    39f4:	d10a0a13          	add	s4,s4,-752 # 11700 <.LANCHOR0>
    39f8:	20290913          	add	s2,s2,514 # 70202 <_ebss+0x59ed2>
    39fc:	0000fa97          	auipc	s5,0xf
    3a00:	944a8a93          	add	s5,s5,-1724 # 12340 <.LC3>

00003a04 <.L7>:
    3a04:	000a0693          	mv	a3,s4
    3a08:	00090613          	mv	a2,s2
    3a0c:	00098593          	mv	a1,s3
    3a10:	00040513          	mv	a0,s0
    3a14:	4dd000ef          	jal	46f0 <__GI_config_read>
    3a18:	f2050ce3          	beqz	a0,3950 <.L6>
    3a1c:	00c12783          	lw	a5,12(sp)
    3a20:	000a8513          	mv	a0,s5
    3a24:	0007a583          	lw	a1,0(a5)
    3a28:	c14ff0ef          	jal	2e3c <__GI_strcmp>
    3a2c:	fc051ce3          	bnez	a0,3a04 <.L7>
    3a30:	00148493          	add	s1,s1,1
    3a34:	fd1ff06f          	j	3a04 <.L7>

00003a38 <get_phys_pages>:
    3a38:	fb010113          	add	sp,sp,-80
    3a3c:	04112623          	sw	ra,76(sp)
    3a40:	04812423          	sw	s0,72(sp)
    3a44:	015000ef          	jal	4258 <__GI_getpagesize>
    3a48:	00050413          	mv	s0,a0
    3a4c:	00010513          	mv	a0,sp
    3a50:	139000ef          	jal	4388 <sysinfo>
    3a54:	03412783          	lw	a5,52(sp)
    3a58:	01012503          	lw	a0,16(sp)
    3a5c:	00f46e63          	bltu	s0,a5,3a78 <.L22>
    3a60:	02f45433          	divu	s0,s0,a5
    3a64:	02855533          	divu	a0,a0,s0

00003a68 <.L21>:
    3a68:	04c12083          	lw	ra,76(sp)
    3a6c:	04812403          	lw	s0,72(sp)
    3a70:	05010113          	add	sp,sp,80
    3a74:	00008067          	ret

00003a78 <.L22>:
    3a78:	0287d7b3          	divu	a5,a5,s0
    3a7c:	02a78533          	mul	a0,a5,a0
    3a80:	fe9ff06f          	j	3a68 <.L21>

00003a84 <get_avphys_pages>:
    3a84:	fb010113          	add	sp,sp,-80
    3a88:	04112623          	sw	ra,76(sp)
    3a8c:	04812423          	sw	s0,72(sp)
    3a90:	7c8000ef          	jal	4258 <__GI_getpagesize>
    3a94:	00050413          	mv	s0,a0
    3a98:	00010513          	mv	a0,sp
    3a9c:	0ed000ef          	jal	4388 <sysinfo>
    3aa0:	03412783          	lw	a5,52(sp)
    3aa4:	01412503          	lw	a0,20(sp)
    3aa8:	00f46e63          	bltu	s0,a5,3ac4 <.L26>
    3aac:	02f45433          	divu	s0,s0,a5
    3ab0:	02855533          	divu	a0,a0,s0

00003ab4 <.L25>:
    3ab4:	04c12083          	lw	ra,76(sp)
    3ab8:	04812403          	lw	s0,72(sp)
    3abc:	05010113          	add	sp,sp,80
    3ac0:	00008067          	ret

00003ac4 <.L26>:
    3ac4:	0287d7b3          	divu	a5,a5,s0
    3ac8:	02a78533          	mul	a0,a5,a0
    3acc:	fe9ff06f          	j	3ab4 <.L25>

00003ad0 <__GI_sysconf>:
    3ad0:	fd010113          	add	sp,sp,-48
    3ad4:	02112623          	sw	ra,44(sp)
    3ad8:	02812423          	sw	s0,40(sp)
    3adc:	02912223          	sw	s1,36(sp)
    3ae0:	03212023          	sw	s2,32(sp)
    3ae4:	01312e23          	sw	s3,28(sp)
    3ae8:	01412c23          	sw	s4,24(sp)
    3aec:	01512a23          	sw	s5,20(sp)
    3af0:	0f000793          	li	a5,240
    3af4:	00a7ce63          	blt	a5,a0,3b10 <.L30>
    3af8:	01600793          	li	a5,22
    3afc:	00050413          	mv	s0,a0
    3b00:	02a7c463          	blt	a5,a0,3b28 <.L31>
    3b04:	00500793          	li	a5,5
    3b08:	0aa7cc63          	blt	a5,a0,3bc0 <.L32>
    3b0c:	08055263          	bgez	a0,3b90 <.L33>

00003b10 <.L30>:
    3b10:	0000d797          	auipc	a5,0xd
    3b14:	ac47a783          	lw	a5,-1340(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    3b18:	01600713          	li	a4,22
    3b1c:	00e7a023          	sw	a4,0(a5)

00003b20 <.L34>:
    3b20:	fff00413          	li	s0,-1
    3b24:	02c0006f          	j	3b50 <.L47>

00003b28 <.L31>:
    3b28:	fe950413          	add	s0,a0,-23
    3b2c:	0d900793          	li	a5,217
    3b30:	fe87e0e3          	bltu	a5,s0,3b10 <.L30>
    3b34:	52418713          	add	a4,gp,1316 # 11384 <.L35>
    3b38:	00241413          	sll	s0,s0,0x2
    3b3c:	00e40433          	add	s0,s0,a4
    3b40:	00042783          	lw	a5,0(s0)
    3b44:	00e787b3          	add	a5,a5,a4
    3b48:	00078067          	jr	a5

00003b4c <.L65>:
    3b4c:	00008437          	lui	s0,0x8

00003b50 <.L47>:
    3b50:	02c12083          	lw	ra,44(sp)
    3b54:	00040513          	mv	a0,s0
    3b58:	02812403          	lw	s0,40(sp)
    3b5c:	02412483          	lw	s1,36(sp)
    3b60:	02012903          	lw	s2,32(sp)
    3b64:	01c12983          	lw	s3,28(sp)
    3b68:	01812a03          	lw	s4,24(sp)
    3b6c:	01412a83          	lw	s5,20(sp)
    3b70:	03010113          	add	sp,sp,48
    3b74:	00008067          	ret

00003b78 <.L86>:
    3b78:	00c75793          	srl	a5,a4,0xc
    3b7c:	3e37f793          	and	a5,a5,995
    3b80:	fa0790e3          	bnez	a5,3b20 <.L34>
    3b84:	00600793          	li	a5,6
    3b88:	fcf404e3          	beq	s0,a5,3b50 <.L47>
    3b8c:	f85ff06f          	j	3b10 <.L30>

00003b90 <.L33>:
    3b90:	fff50413          	add	s0,a0,-1
    3b94:	00400793          	li	a5,4
    3b98:	0487e463          	bltu	a5,s0,3be0 <.L66>
    3b9c:	0000e717          	auipc	a4,0xe
    3ba0:	b5070713          	add	a4,a4,-1200 # 116ec <.L68>
    3ba4:	00241413          	sll	s0,s0,0x2
    3ba8:	00e40433          	add	s0,s0,a4
    3bac:	00042783          	lw	a5,0(s0) # 8000 <.L2+0x7c>
    3bb0:	00e787b3          	add	a5,a5,a4
    3bb4:	00078067          	jr	a5

00003bb8 <.L70>:
    3bb8:	06400413          	li	s0,100
    3bbc:	f95ff06f          	j	3b50 <.L47>

00003bc0 <.L32>:
    3bc0:	00100713          	li	a4,1
    3bc4:	0041d7b7          	lui	a5,0x41d
    3bc8:	00a71733          	sll	a4,a4,a0
    3bcc:	f8078793          	add	a5,a5,-128 # 41cf80 <_ebss+0x406c50>
    3bd0:	00f777b3          	and	a5,a4,a5
    3bd4:	fa0782e3          	beqz	a5,3b78 <.L86>

00003bd8 <.L36>:
    3bd8:	00100413          	li	s0,1
    3bdc:	f75ff06f          	j	3b50 <.L47>

00003be0 <.L66>:
    3be0:	00810593          	add	a1,sp,8
    3be4:	00300513          	li	a0,3
    3be8:	67c000ef          	jal	4264 <__GI_getrlimit>
    3bec:	00020437          	lui	s0,0x20
    3bf0:	f60510e3          	bnez	a0,3b50 <.L47>
    3bf4:	00812783          	lw	a5,8(sp)
    3bf8:	00080737          	lui	a4,0x80
    3bfc:	f4e7eae3          	bltu	a5,a4,3b50 <.L47>
    3c00:	0027d413          	srl	s0,a5,0x2
    3c04:	f4dff06f          	j	3b50 <.L47>

00003c08 <.L69>:
    3c08:	02812403          	lw	s0,40(sp)
    3c0c:	02c12083          	lw	ra,44(sp)
    3c10:	02412483          	lw	s1,36(sp)
    3c14:	02012903          	lw	s2,32(sp)
    3c18:	01c12983          	lw	s3,28(sp)
    3c1c:	01812a03          	lw	s4,24(sp)
    3c20:	01412a83          	lw	s5,20(sp)
    3c24:	03010113          	add	sp,sp,48
    3c28:	6000006f          	j	4228 <__GI_getdtablesize>

00003c2c <.L48>:
    3c2c:	01000413          	li	s0,16
    3c30:	f21ff06f          	j	3b50 <.L47>

00003c34 <.L64>:
    3c34:	02812403          	lw	s0,40(sp)
    3c38:	02c12083          	lw	ra,44(sp)
    3c3c:	02412483          	lw	s1,36(sp)
    3c40:	02012903          	lw	s2,32(sp)
    3c44:	01c12983          	lw	s3,28(sp)
    3c48:	01812a03          	lw	s4,24(sp)
    3c4c:	01412a83          	lw	s5,20(sp)
    3c50:	03010113          	add	sp,sp,48
    3c54:	6040006f          	j	4258 <__GI_getpagesize>

00003c58 <.L49>:
    3c58:	02000413          	li	s0,32
    3c5c:	ef5ff06f          	j	3b50 <.L47>

00003c60 <.L63>:
    3c60:	06300413          	li	s0,99
    3c64:	eedff06f          	j	3b50 <.L47>

00003c68 <.L39>:
    3c68:	00001437          	lui	s0,0x1
    3c6c:	80040413          	add	s0,s0,-2048 # 800 <.L25>
    3c70:	ee1ff06f          	j	3b50 <.L47>

00003c74 <.L62>:
    3c74:	3e800413          	li	s0,1000
    3c78:	ed9ff06f          	j	3b50 <.L47>

00003c7c <.L42>:
    3c7c:	0ff00413          	li	s0,255
    3c80:	ed1ff06f          	j	3b50 <.L47>

00003c84 <.L44>:
    3c84:	00008437          	lui	s0,0x8

00003c88 <.L90>:
    3c88:	fff40413          	add	s0,s0,-1 # 7fff <.L2+0x7b>
    3c8c:	ec5ff06f          	j	3b50 <.L47>

00003c90 <.L61>:
    3c90:	10000413          	li	s0,256
    3c94:	ebdff06f          	j	3b50 <.L47>

00003c98 <.L60>:
    3c98:	0000e517          	auipc	a0,0xe
    3c9c:	6b450513          	add	a0,a0,1716 # 1234c <.LC5>
    3ca0:	0a1000ef          	jal	4540 <__GI_opendir>
    3ca4:	00050493          	mv	s1,a0
    3ca8:	00000413          	li	s0,0
    3cac:	06050c63          	beqz	a0,3d24 <.L87>
    3cb0:	00010937          	lui	s2,0x10
    3cb4:	000079b7          	lui	s3,0x7
    3cb8:	ffff0a37          	lui	s4,0xffff0
    3cbc:	63040ab7          	lui	s5,0x63040
    3cc0:	fff90913          	add	s2,s2,-1 # ffff <.LBB204+0xb>
    3cc4:	57098993          	add	s3,s3,1392 # 7570 <__GI_fseeko64+0x8>

00003cc8 <.L72>:
    3cc8:	00048513          	mv	a0,s1
    3ccc:	0f9000ef          	jal	45c4 <__GI_readdir64>
    3cd0:	00051a63          	bnez	a0,3ce4 <.L75>
    3cd4:	00048513          	mv	a0,s1
    3cd8:	6d8000ef          	jal	43b0 <__GI_closedir>

00003cdc <.L76>:
    3cdc:	e6041ae3          	bnez	s0,3b50 <.L47>
    3ce0:	ef9ff06f          	j	3bd8 <.L36>

00003ce4 <.L75>:
    3ce4:	01052783          	lw	a5,16(a0)
    3ce8:	00fa77b3          	and	a5,s4,a5
    3cec:	fd579ee3          	bne	a5,s5,3cc8 <.L72>
    3cf0:	01452783          	lw	a5,20(a0)
    3cf4:	0127f7b3          	and	a5,a5,s2
    3cf8:	fd3798e3          	bne	a5,s3,3cc8 <.L72>
    3cfc:	01654703          	lbu	a4,22(a0)
    3d00:	0000f797          	auipc	a5,0xf
    3d04:	a487a783          	lw	a5,-1464(a5) # 12748 <__GI___ctype_b>
    3d08:	00171713          	sll	a4,a4,0x1
    3d0c:	00e787b3          	add	a5,a5,a4
    3d10:	0007d783          	lhu	a5,0(a5)
    3d14:	0087f793          	and	a5,a5,8
    3d18:	fa0788e3          	beqz	a5,3cc8 <.L72>
    3d1c:	00140413          	add	s0,s0,1
    3d20:	fa9ff06f          	j	3cc8 <.L72>

00003d24 <.L87>:
    3d24:	bc5ff0ef          	jal	38e8 <nprocessors_onln>
    3d28:	00050413          	mv	s0,a0
    3d2c:	fb1ff06f          	j	3cdc <.L76>

00003d30 <.L59>:
    3d30:	02812403          	lw	s0,40(sp)
    3d34:	02c12083          	lw	ra,44(sp)
    3d38:	02412483          	lw	s1,36(sp)
    3d3c:	02012903          	lw	s2,32(sp)
    3d40:	01c12983          	lw	s3,28(sp)
    3d44:	01812a03          	lw	s4,24(sp)
    3d48:	01412a83          	lw	s5,20(sp)
    3d4c:	03010113          	add	sp,sp,48
    3d50:	b99ff06f          	j	38e8 <nprocessors_onln>

00003d54 <.L58>:
    3d54:	02812403          	lw	s0,40(sp)
    3d58:	02c12083          	lw	ra,44(sp)
    3d5c:	02412483          	lw	s1,36(sp)
    3d60:	02012903          	lw	s2,32(sp)
    3d64:	01c12983          	lw	s3,28(sp)
    3d68:	01812a03          	lw	s4,24(sp)
    3d6c:	01412a83          	lw	s5,20(sp)
    3d70:	03010113          	add	sp,sp,48
    3d74:	cc5ff06f          	j	3a38 <get_phys_pages>

00003d78 <.L57>:
    3d78:	02812403          	lw	s0,40(sp)
    3d7c:	02c12083          	lw	ra,44(sp)
    3d80:	02412483          	lw	s1,36(sp)
    3d84:	02012903          	lw	s2,32(sp)
    3d88:	01c12983          	lw	s3,28(sp)
    3d8c:	01812a03          	lw	s4,24(sp)
    3d90:	01412a83          	lw	s5,20(sp)
    3d94:	03010113          	add	sp,sp,48
    3d98:	cedff06f          	j	3a84 <get_avphys_pages>

00003d9c <.L38>:
    3d9c:	80000437          	lui	s0,0x80000
    3da0:	ee9ff06f          	j	3c88 <.L90>

00003da4 <.L56>:
    3da4:	00001437          	lui	s0,0x1
    3da8:	da9ff06f          	j	3b50 <.L47>

00003dac <.L55>:
    3dac:	2bc00413          	li	s0,700
    3db0:	da1ff06f          	j	3b50 <.L47>

00003db4 <.L54>:
    3db4:	00400413          	li	s0,4
    3db8:	d99ff06f          	j	3b50 <.L47>

00003dbc <.L52>:
    3dbc:	00800413          	li	s0,8
    3dc0:	d91ff06f          	j	3b50 <.L47>

00003dc4 <.L51>:
    3dc4:	00000413          	li	s0,0
    3dc8:	d89ff06f          	j	3b50 <.L47>

00003dcc <.L50>:
    3dcc:	80000437          	lui	s0,0x80000
    3dd0:	d81ff06f          	j	3b50 <.L47>

00003dd4 <.L46>:
    3dd4:	07f00413          	li	s0,127
    3dd8:	d79ff06f          	j	3b50 <.L47>

00003ddc <.L45>:
    3ddc:	f8000413          	li	s0,-128
    3de0:	d71ff06f          	j	3b50 <.L47>

00003de4 <.L43>:
    3de4:	ffff8437          	lui	s0,0xffff8
    3de8:	d69ff06f          	j	3b50 <.L47>

00003dec <.L41>:
    3dec:	00010437          	lui	s0,0x10
    3df0:	e99ff06f          	j	3c88 <.L90>

00003df4 <.L40>:
    3df4:	00900413          	li	s0,9
    3df8:	d59ff06f          	j	3b50 <.L47>

00003dfc <.L37>:
    3dfc:	00000593          	li	a1,0
    3e00:	00100513          	li	a0,1
    3e04:	3fc000ef          	jal	4200 <__GI_clock_getres>
    3e08:	d0054ce3          	bltz	a0,3b20 <.L34>

00003e0c <.L53>:
    3e0c:	00031437          	lui	s0,0x31
    3e10:	06940413          	add	s0,s0,105 # 31069 <_ebss+0x1ad39>
    3e14:	d3dff06f          	j	3b50 <.L47>

00003e18 <.L77>:
    3e18:	01400413          	li	s0,20
    3e1c:	d35ff06f          	j	3b50 <.L47>

00003e20 <.L78>:
    3e20:	00010437          	lui	s0,0x10
    3e24:	d2dff06f          	j	3b50 <.L47>

00003e28 <__uClibc_init>:
    3e28:	00012797          	auipc	a5,0x12
    3e2c:	37c78793          	add	a5,a5,892 # 161a4 <__pagesize>
    3e30:	0007a703          	lw	a4,0(a5)
    3e34:	02071063          	bnez	a4,3e54 <.L1>
    3e38:	00002737          	lui	a4,0x2
    3e3c:	00e7a023          	sw	a4,0(a5)
    3e40:	0000c717          	auipc	a4,0xc
    3e44:	7d072703          	lw	a4,2000(a4) # 10610 <.LLST90+0x1>
    3e48:	00070793          	mv	a5,a4
    3e4c:	00078463          	beqz	a5,3e54 <.L1>
    3e50:	00070067          	jr	a4

00003e54 <.L1>:
    3e54:	00008067          	ret

00003e58 <__uClibc_fini>:
    3e58:	ff010113          	add	sp,sp,-16
    3e5c:	00812423          	sw	s0,8(sp)
    3e60:	00912223          	sw	s1,4(sp)
    3e64:	0000f417          	auipc	s0,0xf
    3e68:	8f840413          	add	s0,s0,-1800 # 1275c <__TMC_END__>
    3e6c:	0000f497          	auipc	s1,0xf
    3e70:	8ec48493          	add	s1,s1,-1812 # 12758 <__do_global_dtors_aux_fini_array_entry>
    3e74:	40940433          	sub	s0,s0,s1
    3e78:	40245413          	sra	s0,s0,0x2
    3e7c:	01212023          	sw	s2,0(sp)
    3e80:	00112623          	sw	ra,12(sp)
    3e84:	fff40413          	add	s0,s0,-1
    3e88:	fff00913          	li	s2,-1

00003e8c <.L9>:
    3e8c:	03241c63          	bne	s0,s2,3ec4 <.L10>
    3e90:	00012417          	auipc	s0,0x12
    3e94:	31440413          	add	s0,s0,788 # 161a4 <__pagesize>
    3e98:	00442783          	lw	a5,4(s0)
    3e9c:	00078463          	beqz	a5,3ea4 <.L11>
    3ea0:	000780e7          	jalr	a5

00003ea4 <.L11>:
    3ea4:	00842783          	lw	a5,8(s0)
    3ea8:	02078a63          	beqz	a5,3edc <.L8>
    3eac:	00812403          	lw	s0,8(sp)
    3eb0:	00c12083          	lw	ra,12(sp)
    3eb4:	00412483          	lw	s1,4(sp)
    3eb8:	00012903          	lw	s2,0(sp)
    3ebc:	01010113          	add	sp,sp,16
    3ec0:	00078067          	jr	a5

00003ec4 <.L10>:
    3ec4:	00241793          	sll	a5,s0,0x2
    3ec8:	00f487b3          	add	a5,s1,a5
    3ecc:	0007a783          	lw	a5,0(a5)
    3ed0:	fff40413          	add	s0,s0,-1
    3ed4:	000780e7          	jalr	a5
    3ed8:	fb5ff06f          	j	3e8c <.L9>

00003edc <.L8>:
    3edc:	00c12083          	lw	ra,12(sp)
    3ee0:	00812403          	lw	s0,8(sp)
    3ee4:	00412483          	lw	s1,4(sp)
    3ee8:	00012903          	lw	s2,0(sp)
    3eec:	01010113          	add	sp,sp,16
    3ef0:	00008067          	ret

00003ef4 <__uClibc_main>:
    3ef4:	f5010113          	add	sp,sp,-176
    3ef8:	0a812423          	sw	s0,168(sp)
    3efc:	0b212023          	sw	s2,160(sp)
    3f00:	09312e23          	sw	s3,156(sp)
    3f04:	09412c23          	sw	s4,152(sp)
    3f08:	09512a23          	sw	s5,148(sp)
    3f0c:	09612823          	sw	s6,144(sp)
    3f10:	09712623          	sw	s7,140(sp)
    3f14:	0a112623          	sw	ra,172(sp)
    3f18:	0a912223          	sw	s1,164(sp)
    3f1c:	09812423          	sw	s8,136(sp)
    3f20:	09912223          	sw	s9,132(sp)
    3f24:	09a12023          	sw	s10,128(sp)
    3f28:	00070a93          	mv	s5,a4
    3f2c:	00012b17          	auipc	s6,0x12
    3f30:	278b0b13          	add	s6,s6,632 # 161a4 <__pagesize>
    3f34:	0000c717          	auipc	a4,0xc
    3f38:	69c72703          	lw	a4,1692(a4) # 105d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    3f3c:	01072023          	sw	a6,0(a4)
    3f40:	00fb2423          	sw	a5,8(s6)
    3f44:	00158793          	add	a5,a1,1
    3f48:	00068993          	mv	s3,a3
    3f4c:	00279793          	sll	a5,a5,0x2
    3f50:	00062683          	lw	a3,0(a2)
    3f54:	00f60733          	add	a4,a2,a5
    3f58:	0000cb97          	auipc	s7,0xc
    3f5c:	680bab83          	lw	s7,1664(s7) # 105d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    3f60:	00eba023          	sw	a4,0(s7)
    3f64:	00050a13          	mv	s4,a0
    3f68:	00058913          	mv	s2,a1
    3f6c:	00060413          	mv	s0,a2
    3f70:	00d71863          	bne	a4,a3,3f80 <.L18>
    3f74:	ffc78793          	add	a5,a5,-4
    3f78:	00f607b3          	add	a5,a2,a5
    3f7c:	00fba023          	sw	a5,0(s7)

00003f80 <.L18>:
    3f80:	00810c93          	add	s9,sp,8
    3f84:	07800613          	li	a2,120
    3f88:	00000593          	li	a1,0
    3f8c:	000c8513          	mv	a0,s9
    3f90:	e09fe0ef          	jal	2d98 <__GI_memset>
    3f94:	000bac03          	lw	s8,0(s7)

00003f98 <.L19>:
    3f98:	000c2783          	lw	a5,0(s8)
    3f9c:	004c0c13          	add	s8,s8,4
    3fa0:	fe079ce3          	bnez	a5,3f98 <.L19>
    3fa4:	00e00d13          	li	s10,14

00003fa8 <.L20>:
    3fa8:	000c2483          	lw	s1,0(s8)
    3fac:	0c049a63          	bnez	s1,4080 <.L22>
    3fb0:	000c8513          	mv	a0,s9
    3fb4:	120000ef          	jal	40d4 <_dl_aux_init>
    3fb8:	e71ff0ef          	jal	3e28 <__uClibc_init>
    3fbc:	00042783          	lw	a5,0(s0)
    3fc0:	0000e717          	auipc	a4,0xe
    3fc4:	76f72e23          	sw	a5,1916(a4) # 1273c <__uclibc_progname>
    3fc8:	02078a63          	beqz	a5,3ffc <.L23>
    3fcc:	0000c717          	auipc	a4,0xc
    3fd0:	65472703          	lw	a4,1620(a4) # 10620 <.LLST90+0x11>
    3fd4:	00f72023          	sw	a5,0(a4)
    3fd8:	00042503          	lw	a0,0(s0)
    3fdc:	02f00593          	li	a1,47
    3fe0:	4d4020ef          	jal	64b4 <__GI_strrchr>
    3fe4:	0000c797          	auipc	a5,0xc
    3fe8:	60c7a783          	lw	a5,1548(a5) # 105f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    3fec:	00a7a023          	sw	a0,0(a5)
    3ff0:	0a050863          	beqz	a0,40a0 <.L24>
    3ff4:	00150513          	add	a0,a0,1
    3ff8:	00a7a023          	sw	a0,0(a5)

00003ffc <.L23>:
    3ffc:	015b2223          	sw	s5,4(s6)
    4000:	0000eb17          	auipc	s6,0xe
    4004:	750b0b13          	add	s6,s6,1872 # 12750 <__preinit_array_start>
    4008:	0000ea97          	auipc	s5,0xe
    400c:	74ca8a93          	add	s5,s5,1868 # 12754 <__frame_dummy_init_array_entry>
    4010:	416a8ab3          	sub	s5,s5,s6
    4014:	402ada93          	sra	s5,s5,0x2
    4018:	00000c13          	li	s8,0

0000401c <.L25>:
    401c:	095c1863          	bne	s8,s5,40ac <.L26>
    4020:	00098463          	beqz	s3,4028 <.L27>
    4024:	000980e7          	jalr	s3

00004028 <.L27>:
    4028:	0000ea97          	auipc	s5,0xe
    402c:	72ca8a93          	add	s5,s5,1836 # 12754 <__frame_dummy_init_array_entry>
    4030:	0000e997          	auipc	s3,0xe
    4034:	72898993          	add	s3,s3,1832 # 12758 <__do_global_dtors_aux_fini_array_entry>
    4038:	415989b3          	sub	s3,s3,s5
    403c:	4029d993          	sra	s3,s3,0x2

00004040 <.L28>:
    4040:	08999063          	bne	s3,s1,40c0 <.L29>
    4044:	0000c797          	auipc	a5,0xc
    4048:	5c87a783          	lw	a5,1480(a5) # 1060c <_GLOBAL_OFFSET_TABLE_+0x44>
    404c:	00078663          	beqz	a5,4058 <.L30>
    4050:	5f4000ef          	jal	4644 <__errno_location>
    4054:	00052023          	sw	zero,0(a0)

00004058 <.L30>:
    4058:	0000c797          	auipc	a5,0xc
    405c:	5a47a783          	lw	a5,1444(a5) # 105fc <_GLOBAL_OFFSET_TABLE_+0x34>
    4060:	00078663          	beqz	a5,406c <.L31>
    4064:	5ec000ef          	jal	4650 <__h_errno_location>
    4068:	00052023          	sw	zero,0(a0)

0000406c <.L31>:
    406c:	000ba603          	lw	a2,0(s7)
    4070:	00040593          	mv	a1,s0
    4074:	00090513          	mv	a0,s2
    4078:	000a00e7          	jalr	s4 # ffff0000 <_ebss+0xfffd9cd0>
    407c:	6a8020ef          	jal	6724 <__GI_exit>

00004080 <.L22>:
    4080:	009d6c63          	bltu	s10,s1,4098 <.L21>
    4084:	00349513          	sll	a0,s1,0x3
    4088:	00800613          	li	a2,8
    408c:	000c0593          	mv	a1,s8
    4090:	00ac8533          	add	a0,s9,a0
    4094:	a5dfe0ef          	jal	2af0 <__GI_memcpy>

00004098 <.L21>:
    4098:	008c0c13          	add	s8,s8,8
    409c:	f0dff06f          	j	3fa8 <.L20>

000040a0 <.L24>:
    40a0:	00042703          	lw	a4,0(s0)
    40a4:	00e7a023          	sw	a4,0(a5)
    40a8:	f55ff06f          	j	3ffc <.L23>

000040ac <.L26>:
    40ac:	000b2783          	lw	a5,0(s6)
    40b0:	001c0c13          	add	s8,s8,1
    40b4:	004b0b13          	add	s6,s6,4
    40b8:	000780e7          	jalr	a5
    40bc:	f61ff06f          	j	401c <.L25>

000040c0 <.L29>:
    40c0:	000aa783          	lw	a5,0(s5)
    40c4:	00148493          	add	s1,s1,1
    40c8:	004a8a93          	add	s5,s5,4
    40cc:	000780e7          	jalr	a5
    40d0:	f71ff06f          	j	4040 <.L28>

000040d4 <_dl_aux_init>:
    40d4:	01c52703          	lw	a4,28(a0)
    40d8:	0000c797          	auipc	a5,0xc
    40dc:	51c7a783          	lw	a5,1308(a5) # 105f4 <_GLOBAL_OFFSET_TABLE_+0x2c>
    40e0:	00e7a023          	sw	a4,0(a5)
    40e4:	02c52703          	lw	a4,44(a0)
    40e8:	0000c797          	auipc	a5,0xc
    40ec:	5207a783          	lw	a5,1312(a5) # 10608 <_GLOBAL_OFFSET_TABLE_+0x40>
    40f0:	00e7a023          	sw	a4,0(a5)
    40f4:	03452783          	lw	a5,52(a0)
    40f8:	00079463          	bnez	a5,4100 <.L2>
    40fc:	000027b7          	lui	a5,0x2

00004100 <.L2>:
    4100:	0000c717          	auipc	a4,0xc
    4104:	51c72703          	lw	a4,1308(a4) # 1061c <.LLST90+0xd>
    4108:	00f72023          	sw	a5,0(a4)
    410c:	00008067          	ret

00004110 <atan2f>:
    4110:	ff010113          	add	sp,sp,-16
    4114:	01212023          	sw	s2,0(sp)
    4118:	00050913          	mv	s2,a0
    411c:	00058513          	mv	a0,a1
    4120:	00112623          	sw	ra,12(sp)
    4124:	00812423          	sw	s0,8(sp)
    4128:	00912223          	sw	s1,4(sp)
    412c:	0150a0ef          	jal	e940 <__extendsfdf2>
    4130:	00050493          	mv	s1,a0
    4134:	00090513          	mv	a0,s2
    4138:	00058413          	mv	s0,a1
    413c:	0050a0ef          	jal	e940 <__extendsfdf2>
    4140:	00048613          	mv	a2,s1
    4144:	00040693          	mv	a3,s0
    4148:	620020ef          	jal	6768 <__ieee754_atan2>
    414c:	2dd0a0ef          	jal	ec28 <__truncdfsf2>
    4150:	00c12083          	lw	ra,12(sp)
    4154:	00812403          	lw	s0,8(sp)
    4158:	00412483          	lw	s1,4(sp)
    415c:	00012903          	lw	s2,0(sp)
    4160:	01010113          	add	sp,sp,16
    4164:	00008067          	ret

00004168 <fmodf>:
    4168:	ff010113          	add	sp,sp,-16
    416c:	01212023          	sw	s2,0(sp)
    4170:	00050913          	mv	s2,a0
    4174:	00058513          	mv	a0,a1
    4178:	00112623          	sw	ra,12(sp)
    417c:	00812423          	sw	s0,8(sp)
    4180:	00912223          	sw	s1,4(sp)
    4184:	7bc0a0ef          	jal	e940 <__extendsfdf2>
    4188:	00050493          	mv	s1,a0
    418c:	00090513          	mv	a0,s2
    4190:	00058413          	mv	s0,a1
    4194:	7ac0a0ef          	jal	e940 <__extendsfdf2>
    4198:	00048613          	mv	a2,s1
    419c:	00040693          	mv	a3,s0
    41a0:	029020ef          	jal	69c8 <__ieee754_fmod>
    41a4:	2850a0ef          	jal	ec28 <__truncdfsf2>
    41a8:	00c12083          	lw	ra,12(sp)
    41ac:	00812403          	lw	s0,8(sp)
    41b0:	00412483          	lw	s1,4(sp)
    41b4:	00012903          	lw	s2,0(sp)
    41b8:	01010113          	add	sp,sp,16
    41bc:	00008067          	ret

000041c0 <__GI_cosf>:
    41c0:	ff010113          	add	sp,sp,-16
    41c4:	00112623          	sw	ra,12(sp)
    41c8:	7780a0ef          	jal	e940 <__extendsfdf2>
    41cc:	771020ef          	jal	713c <__GI_cos>
    41d0:	2590a0ef          	jal	ec28 <__truncdfsf2>
    41d4:	00c12083          	lw	ra,12(sp)
    41d8:	01010113          	add	sp,sp,16
    41dc:	00008067          	ret

000041e0 <__GI_sinf>:
    41e0:	ff010113          	add	sp,sp,-16
    41e4:	00112623          	sw	ra,12(sp)
    41e8:	7580a0ef          	jal	e940 <__extendsfdf2>
    41ec:	024030ef          	jal	7210 <__GI_sin>
    41f0:	2390a0ef          	jal	ec28 <__truncdfsf2>
    41f4:	00c12083          	lw	ra,12(sp)
    41f8:	01010113          	add	sp,sp,16
    41fc:	00008067          	ret

00004200 <__GI_clock_getres>:
    4200:	07200893          	li	a7,114
    4204:	00000073          	ecall
    4208:	fffff7b7          	lui	a5,0xfffff
    420c:	00a7fc63          	bgeu	a5,a0,4224 <.L1>
    4210:	40a00533          	neg	a0,a0
    4214:	0000c797          	auipc	a5,0xc
    4218:	3c07a783          	lw	a5,960(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    421c:	00a7a023          	sw	a0,0(a5)
    4220:	fff00513          	li	a0,-1

00004224 <.L1>:
    4224:	00008067          	ret

00004228 <__GI_getdtablesize>:
    4228:	fe010113          	add	sp,sp,-32
    422c:	00810593          	add	a1,sp,8
    4230:	00700513          	li	a0,7
    4234:	00112e23          	sw	ra,28(sp)
    4238:	02c000ef          	jal	4264 <__GI_getrlimit>
    423c:	10000793          	li	a5,256
    4240:	00054463          	bltz	a0,4248 <.L1>
    4244:	00812783          	lw	a5,8(sp)

00004248 <.L1>:
    4248:	01c12083          	lw	ra,28(sp)
    424c:	00078513          	mv	a0,a5
    4250:	02010113          	add	sp,sp,32
    4254:	00008067          	ret

00004258 <__GI_getpagesize>:
    4258:	00012517          	auipc	a0,0x12
    425c:	f4c52503          	lw	a0,-180(a0) # 161a4 <__pagesize>
    4260:	00008067          	ret

00004264 <__GI_getrlimit>:
    4264:	00058793          	mv	a5,a1
    4268:	0a300893          	li	a7,163
    426c:	00000073          	ecall
    4270:	fffff737          	lui	a4,0xfffff
    4274:	02a76c63          	bltu	a4,a0,42ac <.L2>
    4278:	0005a683          	lw	a3,0(a1)
    427c:	80000737          	lui	a4,0x80000
    4280:	fff70713          	add	a4,a4,-1 # 7fffffff <_ebss+0x7ffe9ccf>
    4284:	00e69663          	bne	a3,a4,4290 <.L4>
    4288:	fff00713          	li	a4,-1
    428c:	00e5a023          	sw	a4,0(a1)

00004290 <.L4>:
    4290:	0047a683          	lw	a3,4(a5)
    4294:	80000737          	lui	a4,0x80000
    4298:	fff70713          	add	a4,a4,-1 # 7fffffff <_ebss+0x7ffe9ccf>
    429c:	00e69663          	bne	a3,a4,42a8 <.L1>
    42a0:	fff00713          	li	a4,-1
    42a4:	00e7a223          	sw	a4,4(a5)

000042a8 <.L1>:
    42a8:	00008067          	ret

000042ac <.L2>:
    42ac:	40a00533          	neg	a0,a0
    42b0:	0000c797          	auipc	a5,0xc
    42b4:	3247a783          	lw	a5,804(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    42b8:	00a7a023          	sw	a0,0(a5)
    42bc:	fff00513          	li	a0,-1
    42c0:	00008067          	ret

000042c4 <__GI_mmap>:
    42c4:	01379813          	sll	a6,a5,0x13
    42c8:	00080e63          	beqz	a6,42e4 <.L2>
    42cc:	0000c797          	auipc	a5,0xc
    42d0:	3087a783          	lw	a5,776(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    42d4:	01600713          	li	a4,22
    42d8:	00e7a023          	sw	a4,0(a5)

000042dc <.L5>:
    42dc:	fff00513          	li	a0,-1

000042e0 <.L1>:
    42e0:	00008067          	ret

000042e4 <.L2>:
    42e4:	00d7d793          	srl	a5,a5,0xd
    42e8:	0de00893          	li	a7,222
    42ec:	00000073          	ecall
    42f0:	fffff7b7          	lui	a5,0xfffff
    42f4:	fea7f6e3          	bgeu	a5,a0,42e0 <.L1>
    42f8:	40a00533          	neg	a0,a0
    42fc:	0000c797          	auipc	a5,0xc
    4300:	2d87a783          	lw	a5,728(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    4304:	00a7a023          	sw	a0,0(a5)
    4308:	fd5ff06f          	j	42dc <.L5>

0000430c <__GI_munmap>:
    430c:	0d700893          	li	a7,215
    4310:	00000073          	ecall
    4314:	fffff7b7          	lui	a5,0xfffff
    4318:	00a7fc63          	bgeu	a5,a0,4330 <.L1>
    431c:	40a00533          	neg	a0,a0
    4320:	0000c797          	auipc	a5,0xc
    4324:	2b47a783          	lw	a5,692(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    4328:	00a7a023          	sw	a0,0(a5)
    432c:	fff00513          	li	a0,-1

00004330 <.L1>:
    4330:	00008067          	ret

00004334 <__GI_nanosleep>:
    4334:	06500893          	li	a7,101
    4338:	00000073          	ecall
    433c:	fffff7b7          	lui	a5,0xfffff
    4340:	00a7fc63          	bgeu	a5,a0,4358 <.L1>
    4344:	40a00533          	neg	a0,a0
    4348:	0000c797          	auipc	a5,0xc
    434c:	28c7a783          	lw	a5,652(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    4350:	00a7a023          	sw	a0,0(a5)
    4354:	fff00513          	li	a0,-1

00004358 <.L1>:
    4358:	00008067          	ret

0000435c <__GI_sigprocmask>:
    435c:	00800693          	li	a3,8
    4360:	08700893          	li	a7,135
    4364:	00000073          	ecall
    4368:	fffff7b7          	lui	a5,0xfffff
    436c:	00a7fc63          	bgeu	a5,a0,4384 <.L1>
    4370:	40a00533          	neg	a0,a0
    4374:	0000c797          	auipc	a5,0xc
    4378:	2607a783          	lw	a5,608(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    437c:	00a7a023          	sw	a0,0(a5)
    4380:	fff00513          	li	a0,-1

00004384 <.L1>:
    4384:	00008067          	ret

00004388 <sysinfo>:
    4388:	0b300893          	li	a7,179
    438c:	00000073          	ecall
    4390:	fffff7b7          	lui	a5,0xfffff
    4394:	00a7fc63          	bgeu	a5,a0,43ac <.L1>
    4398:	40a00533          	neg	a0,a0
    439c:	0000c797          	auipc	a5,0xc
    43a0:	2387a783          	lw	a5,568(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    43a4:	00a7a023          	sw	a0,0(a5)
    43a8:	fff00513          	li	a0,-1

000043ac <.L1>:
    43ac:	00008067          	ret

000043b0 <__GI_closedir>:
    43b0:	ff010113          	add	sp,sp,-16
    43b4:	00912223          	sw	s1,4(sp)
    43b8:	00052483          	lw	s1,0(a0)
    43bc:	00112623          	sw	ra,12(sp)
    43c0:	00812423          	sw	s0,8(sp)
    43c4:	fff00793          	li	a5,-1
    43c8:	02f48a63          	beq	s1,a5,43fc <.L5>
    43cc:	00050413          	mv	s0,a0
    43d0:	00f52023          	sw	a5,0(a0)
    43d4:	00c52503          	lw	a0,12(a0)
    43d8:	930ff0ef          	jal	3508 <free>
    43dc:	00040513          	mv	a0,s0
    43e0:	928ff0ef          	jal	3508 <free>
    43e4:	00812403          	lw	s0,8(sp)
    43e8:	00c12083          	lw	ra,12(sp)
    43ec:	00048513          	mv	a0,s1
    43f0:	00412483          	lw	s1,4(sp)
    43f4:	01010113          	add	sp,sp,16
    43f8:	a68fd06f          	j	1660 <__GI_close>

000043fc <.L5>:
    43fc:	00c12083          	lw	ra,12(sp)
    4400:	00812403          	lw	s0,8(sp)
    4404:	0000c797          	auipc	a5,0xc
    4408:	1d07a783          	lw	a5,464(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    440c:	00900713          	li	a4,9
    4410:	00e7a023          	sw	a4,0(a5)
    4414:	00412483          	lw	s1,4(sp)
    4418:	fff00513          	li	a0,-1
    441c:	01010113          	add	sp,sp,16
    4420:	00008067          	ret

00004424 <fd_to_DIR>:
    4424:	ff010113          	add	sp,sp,-16
    4428:	01212023          	sw	s2,0(sp)
    442c:	00050913          	mv	s2,a0
    4430:	01c00513          	li	a0,28
    4434:	00912223          	sw	s1,4(sp)
    4438:	00112623          	sw	ra,12(sp)
    443c:	00812423          	sw	s0,8(sp)
    4440:	00058493          	mv	s1,a1
    4444:	eadfe0ef          	jal	32f0 <malloc>
    4448:	04050263          	beqz	a0,448c <.L2>
    444c:	01252023          	sw	s2,0(a0)
    4450:	00052823          	sw	zero,16(a0)
    4454:	00052423          	sw	zero,8(a0)
    4458:	00052223          	sw	zero,4(a0)
    445c:	20000793          	li	a5,512
    4460:	00050413          	mv	s0,a0
    4464:	00048593          	mv	a1,s1
    4468:	00f4f463          	bgeu	s1,a5,4470 <.L3>
    446c:	20000593          	li	a1,512

00004470 <.L3>:
    4470:	00b42a23          	sw	a1,20(s0)
    4474:	00100513          	li	a0,1
    4478:	0ec020ef          	jal	6564 <calloc>
    447c:	00a42623          	sw	a0,12(s0)
    4480:	00051863          	bnez	a0,4490 <.L1>
    4484:	00040513          	mv	a0,s0
    4488:	880ff0ef          	jal	3508 <free>

0000448c <.L2>:
    448c:	00000413          	li	s0,0

00004490 <.L1>:
    4490:	00c12083          	lw	ra,12(sp)
    4494:	00040513          	mv	a0,s0
    4498:	00812403          	lw	s0,8(sp)
    449c:	00412483          	lw	s1,4(sp)
    44a0:	00012903          	lw	s2,0(sp)
    44a4:	01010113          	add	sp,sp,16
    44a8:	00008067          	ret

000044ac <fdopendir>:
    44ac:	f8010113          	add	sp,sp,-128
    44b0:	00810593          	add	a1,sp,8
    44b4:	06812c23          	sw	s0,120(sp)
    44b8:	06112e23          	sw	ra,124(sp)
    44bc:	00050413          	mv	s0,a0
    44c0:	701020ef          	jal	73c0 <__GI_fstat64>
    44c4:	02051463          	bnez	a0,44ec <.L11>
    44c8:	01812703          	lw	a4,24(sp)
    44cc:	0000f7b7          	lui	a5,0xf
    44d0:	00e7f7b3          	and	a5,a5,a4
    44d4:	00004737          	lui	a4,0x4
    44d8:	02e78463          	beq	a5,a4,4500 <.L12>
    44dc:	0000c797          	auipc	a5,0xc
    44e0:	0f87a783          	lw	a5,248(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    44e4:	01400713          	li	a4,20

000044e8 <.L17>:
    44e8:	00e7a023          	sw	a4,0(a5)

000044ec <.L11>:
    44ec:	00000513          	li	a0,0

000044f0 <.L9>:
    44f0:	07c12083          	lw	ra,124(sp)
    44f4:	07812403          	lw	s0,120(sp)
    44f8:	08010113          	add	sp,sp,128
    44fc:	00008067          	ret

00004500 <.L12>:
    4500:	00300593          	li	a1,3
    4504:	00040513          	mv	a0,s0
    4508:	615020ef          	jal	731c <__GI_fcntl>
    450c:	fff00793          	li	a5,-1
    4510:	fcf50ee3          	beq	a0,a5,44ec <.L11>
    4514:	00357793          	and	a5,a0,3
    4518:	00100713          	li	a4,1
    451c:	00e79a63          	bne	a5,a4,4530 <.L15>
    4520:	0000c797          	auipc	a5,0xc
    4524:	0b47a783          	lw	a5,180(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    4528:	01600713          	li	a4,22
    452c:	fbdff06f          	j	44e8 <.L17>

00004530 <.L15>:
    4530:	04012583          	lw	a1,64(sp)
    4534:	00040513          	mv	a0,s0
    4538:	eedff0ef          	jal	4424 <fd_to_DIR>
    453c:	fb5ff06f          	j	44f0 <.L9>

00004540 <__GI_opendir>:
    4540:	000915b7          	lui	a1,0x91
    4544:	f8010113          	add	sp,sp,-128
    4548:	80058593          	add	a1,a1,-2048 # 90800 <_ebss+0x7a4d0>
    454c:	06112e23          	sw	ra,124(sp)
    4550:	06812c23          	sw	s0,120(sp)
    4554:	06912a23          	sw	s1,116(sp)
    4558:	a38fd0ef          	jal	1790 <__open2_nocancel>
    455c:	00054e63          	bltz	a0,4578 <.L19>
    4560:	00810593          	add	a1,sp,8
    4564:	00050413          	mv	s0,a0
    4568:	659020ef          	jal	73c0 <__GI_fstat64>
    456c:	02055463          	bgez	a0,4594 <.L20>
    4570:	00040513          	mv	a0,s0
    4574:	914fd0ef          	jal	1688 <__close_nocancel_no_status>

00004578 <.L19>:
    4578:	00000493          	li	s1,0

0000457c <.L18>:
    457c:	07c12083          	lw	ra,124(sp)
    4580:	07812403          	lw	s0,120(sp)
    4584:	00048513          	mv	a0,s1
    4588:	07412483          	lw	s1,116(sp)
    458c:	08010113          	add	sp,sp,128
    4590:	00008067          	ret

00004594 <.L20>:
    4594:	00100613          	li	a2,1
    4598:	00200593          	li	a1,2
    459c:	00040513          	mv	a0,s0
    45a0:	531020ef          	jal	72d0 <__fcntl_nocancel>
    45a4:	04012583          	lw	a1,64(sp)
    45a8:	00040513          	mv	a0,s0
    45ac:	e79ff0ef          	jal	4424 <fd_to_DIR>
    45b0:	00050493          	mv	s1,a0
    45b4:	fc0514e3          	bnez	a0,457c <.L18>
    45b8:	00040513          	mv	a0,s0
    45bc:	8ccfd0ef          	jal	1688 <__close_nocancel_no_status>
    45c0:	fbdff06f          	j	457c <.L18>

000045c4 <__GI_readdir64>:
    45c4:	ff010113          	add	sp,sp,-16
    45c8:	00812423          	sw	s0,8(sp)
    45cc:	00112623          	sw	ra,12(sp)
    45d0:	00050413          	mv	s0,a0

000045d4 <.L4>:
    45d4:	00842703          	lw	a4,8(s0)
    45d8:	00442783          	lw	a5,4(s0)
    45dc:	00c42583          	lw	a1,12(s0)
    45e0:	00e7ee63          	bltu	a5,a4,45fc <.L2>
    45e4:	01442603          	lw	a2,20(s0)
    45e8:	00042503          	lw	a0,0(s0)
    45ec:	5fd020ef          	jal	73e8 <__getdents>
    45f0:	04a05663          	blez	a0,463c <.L6>
    45f4:	00a42423          	sw	a0,8(s0)
    45f8:	00042223          	sw	zero,4(s0)

000045fc <.L2>:
    45fc:	00442703          	lw	a4,4(s0)
    4600:	00c42503          	lw	a0,12(s0)
    4604:	00e50533          	add	a0,a0,a4
    4608:	01055783          	lhu	a5,16(a0)
    460c:	00e787b3          	add	a5,a5,a4
    4610:	00f42223          	sw	a5,4(s0)
    4614:	00852783          	lw	a5,8(a0)
    4618:	00452703          	lw	a4,4(a0)
    461c:	00f42823          	sw	a5,16(s0)
    4620:	00052783          	lw	a5,0(a0)
    4624:	00e7e7b3          	or	a5,a5,a4
    4628:	fa0786e3          	beqz	a5,45d4 <.L4>

0000462c <.L1>:
    462c:	00c12083          	lw	ra,12(sp)
    4630:	00812403          	lw	s0,8(sp)
    4634:	01010113          	add	sp,sp,16
    4638:	00008067          	ret

0000463c <.L6>:
    463c:	00000513          	li	a0,0
    4640:	fedff06f          	j	462c <.L1>

00004644 <__errno_location>:
    4644:	0000c517          	auipc	a0,0xc
    4648:	f9052503          	lw	a0,-112(a0) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    464c:	00008067          	ret

00004650 <__h_errno_location>:
    4650:	0000c517          	auipc	a0,0xc
    4654:	f9052503          	lw	a0,-112(a0) # 105e0 <_GLOBAL_OFFSET_TABLE_+0x18>
    4658:	00008067          	ret

0000465c <__GI_config_open>:
    465c:	ff010113          	add	sp,sp,-16
    4660:	0000e597          	auipc	a1,0xe
    4664:	ce858593          	add	a1,a1,-792 # 12348 <.LC0>
    4668:	00812423          	sw	s0,8(sp)
    466c:	00112623          	sw	ra,12(sp)
    4670:	494000ef          	jal	4b04 <__GI_fopen>
    4674:	00050413          	mv	s0,a0
    4678:	00050c63          	beqz	a0,4690 <.L1>
    467c:	01800593          	li	a1,24
    4680:	00100513          	li	a0,1
    4684:	6e1010ef          	jal	6564 <calloc>
    4688:	00051e63          	bnez	a0,46a4 <.L3>

0000468c <.L4>:
    468c:	00050413          	mv	s0,a0

00004690 <.L1>:
    4690:	00c12083          	lw	ra,12(sp)
    4694:	00040513          	mv	a0,s0
    4698:	00812403          	lw	s0,8(sp)
    469c:	01010113          	add	sp,sp,16
    46a0:	00008067          	ret

000046a4 <.L3>:
    46a4:	00852023          	sw	s0,0(a0)
    46a8:	fe5ff06f          	j	468c <.L4>

000046ac <__GI_config_close>:
    46ac:	04050063          	beqz	a0,46ec <.L9>
    46b0:	ff010113          	add	sp,sp,-16
    46b4:	00812423          	sw	s0,8(sp)
    46b8:	00050413          	mv	s0,a0
    46bc:	00052503          	lw	a0,0(a0)
    46c0:	00112623          	sw	ra,12(sp)
    46c4:	358000ef          	jal	4a1c <__GI_fclose>
    46c8:	01442783          	lw	a5,20(s0)
    46cc:	00078663          	beqz	a5,46d8 <.L11>
    46d0:	00442503          	lw	a0,4(s0)
    46d4:	e35fe0ef          	jal	3508 <free>

000046d8 <.L11>:
    46d8:	00040513          	mv	a0,s0
    46dc:	00812403          	lw	s0,8(sp)
    46e0:	00c12083          	lw	ra,12(sp)
    46e4:	01010113          	add	sp,sp,16
    46e8:	e21fe06f          	j	3508 <free>

000046ec <.L9>:
    46ec:	00008067          	ret

000046f0 <__GI_config_read>:
    46f0:	fa010113          	add	sp,sp,-96
    46f4:	04112e23          	sw	ra,92(sp)
    46f8:	04812c23          	sw	s0,88(sp)
    46fc:	04912a23          	sw	s1,84(sp)
    4700:	05212823          	sw	s2,80(sp)
    4704:	05312623          	sw	s3,76(sp)
    4708:	05412423          	sw	s4,72(sp)
    470c:	05512223          	sw	s5,68(sp)
    4710:	05612023          	sw	s6,64(sp)
    4714:	03712e23          	sw	s7,60(sp)
    4718:	03812c23          	sw	s8,56(sp)
    471c:	03912a23          	sw	s9,52(sp)
    4720:	03a12823          	sw	s10,48(sp)
    4724:	03b12623          	sw	s11,44(sp)
    4728:	0e050063          	beqz	a0,4808 <.L20>
    472c:	0ff67a13          	zext.b	s4,a2
    4730:	002a1793          	sll	a5,s4,0x2
    4734:	00865a93          	srl	s5,a2,0x8
    4738:	00f12623          	sw	a5,12(sp)
    473c:	000209b7          	lui	s3,0x20
    4740:	00178793          	add	a5,a5,1
    4744:	00040b37          	lui	s6,0x40
    4748:	00010bb7          	lui	s7,0x10
    474c:	00050c93          	mv	s9,a0
    4750:	00058913          	mv	s2,a1
    4754:	00060493          	mv	s1,a2
    4758:	00068413          	mv	s0,a3
    475c:	0ffafa93          	zext.b	s5,s5
    4760:	00f12823          	sw	a5,16(sp)
    4764:	013679b3          	and	s3,a2,s3
    4768:	01667b33          	and	s6,a2,s6
    476c:	01767bb3          	and	s7,a2,s7

00004770 <.L21>:
    4770:	004ca683          	lw	a3,4(s9)
    4774:	010ca703          	lw	a4,16(s9)
    4778:	04069263          	bnez	a3,47bc <.L22>
    477c:	00071663          	bnez	a4,4788 <.L23>
    4780:	05100713          	li	a4,81
    4784:	00eca823          	sw	a4,16(s9)

00004788 <.L23>:
    4788:	008ca703          	lw	a4,8(s9)
    478c:	00071663          	bnez	a4,4798 <.L24>
    4790:	01012783          	lw	a5,16(sp)
    4794:	00fca423          	sw	a5,8(s9)

00004798 <.L24>:
    4798:	008ca503          	lw	a0,8(s9)
    479c:	010ca703          	lw	a4,16(s9)
    47a0:	00e50533          	add	a0,a0,a4
    47a4:	b4dfe0ef          	jal	32f0 <malloc>
    47a8:	00aca223          	sw	a0,4(s9)
    47ac:	04050e63          	beqz	a0,4808 <.L20>
    47b0:	014ca703          	lw	a4,20(s9)
    47b4:	00176713          	or	a4,a4,1
    47b8:	00ecaa23          	sw	a4,20(s9)

000047bc <.L22>:
    47bc:	004ca703          	lw	a4,4(s9)
    47c0:	008ca683          	lw	a3,8(s9)
    47c4:	00000d93          	li	s11,0
    47c8:	00002c37          	lui	s8,0x2
    47cc:	00d70733          	add	a4,a4,a3
    47d0:	00eca623          	sw	a4,12(s9)
    47d4:	05c00d13          	li	s10,92

000047d8 <.L26>:
    47d8:	010ca583          	lw	a1,16(s9)
    47dc:	00cca503          	lw	a0,12(s9)
    47e0:	000ca603          	lw	a2,0(s9)
    47e4:	41b585b3          	sub	a1,a1,s11
    47e8:	01b50533          	add	a0,a0,s11
    47ec:	05d010ef          	jal	6048 <__GI_fgets>
    47f0:	00cca703          	lw	a4,12(s9)
    47f4:	04051c63          	bnez	a0,484c <.L27>
    47f8:	010ca603          	lw	a2,16(s9)
    47fc:	00000593          	li	a1,0
    4800:	00070513          	mv	a0,a4
    4804:	d94fe0ef          	jal	2d98 <__GI_memset>

00004808 <.L20>:
    4808:	00000d93          	li	s11,0

0000480c <.L18>:
    480c:	05c12083          	lw	ra,92(sp)
    4810:	05812403          	lw	s0,88(sp)
    4814:	05412483          	lw	s1,84(sp)
    4818:	05012903          	lw	s2,80(sp)
    481c:	04c12983          	lw	s3,76(sp)
    4820:	04812a03          	lw	s4,72(sp)
    4824:	04412a83          	lw	s5,68(sp)
    4828:	04012b03          	lw	s6,64(sp)
    482c:	03c12b83          	lw	s7,60(sp)
    4830:	03812c03          	lw	s8,56(sp)
    4834:	03412c83          	lw	s9,52(sp)
    4838:	03012d03          	lw	s10,48(sp)
    483c:	000d8513          	mv	a0,s11
    4840:	02c12d83          	lw	s11,44(sp)
    4844:	06010113          	add	sp,sp,96
    4848:	00008067          	ret

0000484c <.L27>:
    484c:	01b70533          	add	a0,a4,s11
    4850:	00e12a23          	sw	a4,20(sp)
    4854:	e10fe0ef          	jal	2e64 <__GI_strlen>
    4858:	01412703          	lw	a4,20(sp)
    485c:	00ad8db3          	add	s11,s11,a0
    4860:	00a00593          	li	a1,10
    4864:	00070513          	mv	a0,a4
    4868:	289010ef          	jal	62f0 <__GI_strchr>
    486c:	02050063          	beqz	a0,488c <.L29>
    4870:	00054703          	lbu	a4,0(a0)
    4874:	fff70713          	add	a4,a4,-1 # 3fff <.L23+0x3>
    4878:	0ff77713          	zext.b	a4,a4
    487c:	00e50023          	sb	a4,0(a0)
    4880:	0fa71a63          	bne	a4,s10,4974 <.L30>
    4884:	ffed8d93          	add	s11,s11,-2
    4888:	f51ff06f          	j	47d8 <.L26>

0000488c <.L29>:
    488c:	014ca703          	lw	a4,20(s9)
    4890:	02071863          	bnez	a4,48c0 <.L72>
    4894:	fff00d13          	li	s10,-1
    4898:	00a00c13          	li	s8,10

0000489c <.L32>:
    489c:	000ca503          	lw	a0,0(s9)
    48a0:	01052703          	lw	a4,16(a0)
    48a4:	01852683          	lw	a3,24(a0)
    48a8:	04d77463          	bgeu	a4,a3,48f0 <.L33>
    48ac:	00170693          	add	a3,a4,1
    48b0:	00d52823          	sw	a3,16(a0)
    48b4:	00074503          	lbu	a0,0(a4)

000048b8 <.L34>:
    48b8:	ff8512e3          	bne	a0,s8,489c <.L32>
    48bc:	03c0006f          	j	48f8 <.L35>

000048c0 <.L72>:
    48c0:	010ca703          	lw	a4,16(s9)
    48c4:	008ca583          	lw	a1,8(s9)
    48c8:	004ca503          	lw	a0,4(s9)
    48cc:	00ec0733          	add	a4,s8,a4
    48d0:	00eca823          	sw	a4,16(s9)
    48d4:	00b705b3          	add	a1,a4,a1
    48d8:	4f1010ef          	jal	65c8 <realloc>
    48dc:	008ca703          	lw	a4,8(s9)
    48e0:	00aca223          	sw	a0,4(s9)
    48e4:	00e50533          	add	a0,a0,a4
    48e8:	00aca623          	sw	a0,12(s9)
    48ec:	eedff06f          	j	47d8 <.L26>

000048f0 <.L33>:
    48f0:	64c010ef          	jal	5f3c <__GI___fgetc_unlocked>
    48f4:	fda512e3          	bne	a0,s10,48b8 <.L34>

000048f8 <.L35>:
    48f8:	fff00713          	li	a4,-1
    48fc:	f0ed86e3          	beq	s11,a4,4808 <.L20>
    4900:	00ccad03          	lw	s10,12(s9)
    4904:	00098a63          	beqz	s3,4918 <.L37>
    4908:	000d0513          	mv	a0,s10
    490c:	00140593          	add	a1,s0,1
    4910:	411010ef          	jal	6520 <__GI_strspn>
    4914:	00ad0d33          	add	s10,s10,a0

00004918 <.L37>:
    4918:	000d4683          	lbu	a3,0(s10)
    491c:	004ca503          	lw	a0,4(s9)
    4920:	e40688e3          	beqz	a3,4770 <.L21>
    4924:	00044603          	lbu	a2,0(s0)
    4928:	e4d604e3          	beq	a2,a3,4770 <.L21>
    492c:	00c12603          	lw	a2,12(sp)
    4930:	00a92023          	sw	a0,0(s2)
    4934:	00000593          	li	a1,0
    4938:	c60fe0ef          	jal	2d98 <__GI_memset>
    493c:	fffa0793          	add	a5,s4,-1
    4940:	00f12c23          	sw	a5,24(sp)
    4944:	00140793          	add	a5,s0,1
    4948:	00000d93          	li	s11,0
    494c:	00f12e23          	sw	a5,28(sp)

00004950 <.L39>:
    4950:	000d4603          	lbu	a2,0(s10)
    4954:	00060863          	beqz	a2,4964 <.L51>
    4958:	00044583          	lbu	a1,0(s0)
    495c:	00c58463          	beq	a1,a2,4964 <.L51>
    4960:	014dce63          	blt	s11,s4,497c <.L52>

00004964 <.L51>:
    4964:	eb5dd4e3          	bge	s11,s5,480c <.L18>
    4968:	00b49713          	sll	a4,s1,0xb
    496c:	e00752e3          	bgez	a4,4770 <.L21>
    4970:	e99ff06f          	j	4808 <.L20>

00004974 <.L30>:
    4974:	fffd8d93          	add	s11,s11,-1
    4978:	f81ff06f          	j	48f8 <.L35>

0000497c <.L52>:
    497c:	00092603          	lw	a2,0(s2)
    4980:	002d9593          	sll	a1,s11,0x2
    4984:	01812783          	lw	a5,24(sp)
    4988:	00b60633          	add	a2,a2,a1
    498c:	01a62023          	sw	s10,0(a2)
    4990:	00044c03          	lbu	s8,0(s0)
    4994:	01b79463          	bne	a5,s11,499c <.L40>
    4998:	040b1063          	bnez	s6,49d8 <.L41>

0000499c <.L40>:
    499c:	001c3593          	seqz	a1,s8
    49a0:	000d0513          	mv	a0,s10
    49a4:	00b405b3          	add	a1,s0,a1
    49a8:	2b1010ef          	jal	6458 <__GI_strcspn>
    49ac:	00ad0d33          	add	s10,s10,a0

000049b0 <.L43>:
    49b0:	000d4603          	lbu	a2,0(s10)
    49b4:	04cc1c63          	bne	s8,a2,4a0c <.L46>
    49b8:	000d0023          	sb	zero,0(s10)

000049bc <.L49>:
    49bc:	000b8a63          	beqz	s7,49d0 <.L50>
    49c0:	01c12583          	lw	a1,28(sp)
    49c4:	000d0513          	mv	a0,s10
    49c8:	359010ef          	jal	6520 <__GI_strspn>
    49cc:	00ad0d33          	add	s10,s10,a0

000049d0 <.L50>:
    49d0:	001d8d93          	add	s11,s11,1
    49d4:	f7dff06f          	j	4950 <.L39>

000049d8 <.L41>:
    49d8:	000d0513          	mv	a0,s10
    49dc:	000c0593          	mv	a1,s8
    49e0:	1cd010ef          	jal	63ac <__GI_strchrnul>
    49e4:	00050d13          	mv	s10,a0
    49e8:	fc0984e3          	beqz	s3,49b0 <.L43>
    49ec:	00140793          	add	a5,s0,1
    49f0:	00f12a23          	sw	a5,20(sp)

000049f4 <.L44>:
    49f4:	fffd4583          	lbu	a1,-1(s10)
    49f8:	01412503          	lw	a0,20(sp)
    49fc:	0f5010ef          	jal	62f0 <__GI_strchr>
    4a00:	fa0508e3          	beqz	a0,49b0 <.L43>
    4a04:	fffd0d13          	add	s10,s10,-1
    4a08:	fedff06f          	j	49f4 <.L44>

00004a0c <.L46>:
    4a0c:	fa0608e3          	beqz	a2,49bc <.L49>
    4a10:	000d0023          	sb	zero,0(s10)
    4a14:	001d0d13          	add	s10,s10,1
    4a18:	fa5ff06f          	j	49bc <.L49>

00004a1c <__GI_fclose>:
    4a1c:	0000c717          	auipc	a4,0xc
    4a20:	bc872703          	lw	a4,-1080(a4) # 105e4 <_GLOBAL_OFFSET_TABLE_+0x1c>
    4a24:	00072783          	lw	a5,0(a4)
    4a28:	ff010113          	add	sp,sp,-16
    4a2c:	00812423          	sw	s0,8(sp)
    4a30:	00112623          	sw	ra,12(sp)
    4a34:	00912223          	sw	s1,4(sp)
    4a38:	00050413          	mv	s0,a0
    4a3c:	0aa79463          	bne	a5,a0,4ae4 <.L2>
    4a40:	02052783          	lw	a5,32(a0)
    4a44:	00f72023          	sw	a5,0(a4)

00004a48 <.L3>:
    4a48:	00045783          	lhu	a5,0(s0)
    4a4c:	00000493          	li	s1,0
    4a50:	0407f793          	and	a5,a5,64
    4a54:	00078863          	beqz	a5,4a64 <.L5>
    4a58:	00040513          	mv	a0,s0
    4a5c:	408010ef          	jal	5e64 <__GI_fflush>
    4a60:	00050493          	mv	s1,a0

00004a64 <.L5>:
    4a64:	00442503          	lw	a0,4(s0)
    4a68:	ffe00793          	li	a5,-2
    4a6c:	08f51863          	bne	a0,a5,4afc <.L6>
    4a70:	03442783          	lw	a5,52(s0)
    4a74:	00078a63          	beqz	a5,4a88 <.L9>
    4a78:	02442503          	lw	a0,36(s0)
    4a7c:	000780e7          	jalr	a5

00004a80 <.L8>:
    4a80:	00055463          	bgez	a0,4a88 <.L9>
    4a84:	fff00493          	li	s1,-1

00004a88 <.L9>:
    4a88:	00045703          	lhu	a4,0(s0)
    4a8c:	fff00793          	li	a5,-1
    4a90:	00f42223          	sw	a5,4(s0)
    4a94:	000067b7          	lui	a5,0x6
    4a98:	00f777b3          	and	a5,a4,a5
    4a9c:	0307e793          	or	a5,a5,48
    4aa0:	00f41023          	sh	a5,0(s0)
    4aa4:	01171793          	sll	a5,a4,0x11
    4aa8:	0007d663          	bgez	a5,4ab4 <.L10>
    4aac:	00842503          	lw	a0,8(s0)
    4ab0:	a59fe0ef          	jal	3508 <free>

00004ab4 <.L10>:
    4ab4:	00045783          	lhu	a5,0(s0)
    4ab8:	01279713          	sll	a4,a5,0x12
    4abc:	00075663          	bgez	a4,4ac8 <.L1>
    4ac0:	00040513          	mv	a0,s0
    4ac4:	a45fe0ef          	jal	3508 <free>

00004ac8 <.L1>:
    4ac8:	00c12083          	lw	ra,12(sp)
    4acc:	00812403          	lw	s0,8(sp)
    4ad0:	00048513          	mv	a0,s1
    4ad4:	00412483          	lw	s1,4(sp)
    4ad8:	01010113          	add	sp,sp,16
    4adc:	00008067          	ret

00004ae0 <.L12>:
    4ae0:	00070793          	mv	a5,a4

00004ae4 <.L2>:
    4ae4:	f60782e3          	beqz	a5,4a48 <.L3>
    4ae8:	0207a703          	lw	a4,32(a5) # 6020 <.L11+0x20>
    4aec:	fe871ae3          	bne	a4,s0,4ae0 <.L12>
    4af0:	02042703          	lw	a4,32(s0)
    4af4:	02e7a023          	sw	a4,32(a5)
    4af8:	f51ff06f          	j	4a48 <.L3>

00004afc <.L6>:
    4afc:	b65fc0ef          	jal	1660 <__GI_close>
    4b00:	f81ff06f          	j	4a80 <.L8>

00004b04 <__GI_fopen>:
    4b04:	fff00693          	li	a3,-1
    4b08:	00000613          	li	a2,0
    4b0c:	16c0006f          	j	4c78 <_stdio_fopen>

00004b10 <__stdio_WRITE>:
    4b10:	fd010113          	add	sp,sp,-48
    4b14:	01512a23          	sw	s5,20(sp)
    4b18:	80000ab7          	lui	s5,0x80000
    4b1c:	02812423          	sw	s0,40(sp)
    4b20:	02912223          	sw	s1,36(sp)
    4b24:	03212023          	sw	s2,32(sp)
    4b28:	01312e23          	sw	s3,28(sp)
    4b2c:	01612823          	sw	s6,16(sp)
    4b30:	01712623          	sw	s7,12(sp)
    4b34:	01812423          	sw	s8,8(sp)
    4b38:	02112623          	sw	ra,44(sp)
    4b3c:	01412c23          	sw	s4,24(sp)
    4b40:	00050493          	mv	s1,a0
    4b44:	00058413          	mv	s0,a1
    4b48:	00060993          	mv	s3,a2
    4b4c:	00060913          	mv	s2,a2
    4b50:	fffa8a93          	add	s5,s5,-1 # 7fffffff <_ebss+0x7ffe9ccf>
    4b54:	ffe00b93          	li	s7,-2
    4b58:	0000cb17          	auipc	s6,0xc
    4b5c:	a7cb2b03          	lw	s6,-1412(s6) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    4b60:	00b00c13          	li	s8,11

00004b64 <.L2>:
    4b64:	04090c63          	beqz	s2,4bbc <.L10>
    4b68:	00090a13          	mv	s4,s2
    4b6c:	00090613          	mv	a2,s2
    4b70:	00095463          	bgez	s2,4b78 <.L3>
    4b74:	000a8613          	mv	a2,s5

00004b78 <.L3>:
    4b78:	0044a503          	lw	a0,4(s1)
    4b7c:	09751c63          	bne	a0,s7,4c14 <.L4>
    4b80:	02c4a783          	lw	a5,44(s1)
    4b84:	06079663          	bnez	a5,4bf0 <.L5>
    4b88:	01600793          	li	a5,22
    4b8c:	00fb2023          	sw	a5,0(s6)

00004b90 <.L6>:
    4b90:	0004d783          	lhu	a5,0(s1)
    4b94:	00400713          	li	a4,4
    4b98:	0087e793          	or	a5,a5,8
    4b9c:	00f49023          	sh	a5,0(s1)
    4ba0:	0000c797          	auipc	a5,0xc
    4ba4:	a347a783          	lw	a5,-1484(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    4ba8:	0007a783          	lw	a5,0(a5)
    4bac:	06e78a63          	beq	a5,a4,4c20 <.L9>
    4bb0:	00b00713          	li	a4,11
    4bb4:	06e78663          	beq	a5,a4,4c20 <.L9>

00004bb8 <.L11>:
    4bb8:	412989b3          	sub	s3,s3,s2

00004bbc <.L10>:
    4bbc:	02c12083          	lw	ra,44(sp)
    4bc0:	02812403          	lw	s0,40(sp)
    4bc4:	02412483          	lw	s1,36(sp)
    4bc8:	02012903          	lw	s2,32(sp)
    4bcc:	01812a03          	lw	s4,24(sp)
    4bd0:	01412a83          	lw	s5,20(sp)
    4bd4:	01012b03          	lw	s6,16(sp)
    4bd8:	00c12b83          	lw	s7,12(sp)
    4bdc:	00812c03          	lw	s8,8(sp)
    4be0:	00098513          	mv	a0,s3
    4be4:	01c12983          	lw	s3,28(sp)
    4be8:	03010113          	add	sp,sp,48
    4bec:	00008067          	ret

00004bf0 <.L5>:
    4bf0:	0244a503          	lw	a0,36(s1)
    4bf4:	018b2023          	sw	s8,0(s6)
    4bf8:	00040593          	mv	a1,s0
    4bfc:	000780e7          	jalr	a5
    4c00:	f80508e3          	beqz	a0,4b90 <.L6>

00004c04 <.L7>:
    4c04:	f80546e3          	bltz	a0,4b90 <.L6>
    4c08:	40a90933          	sub	s2,s2,a0
    4c0c:	00a40433          	add	s0,s0,a0
    4c10:	f55ff06f          	j	4b64 <.L2>

00004c14 <.L4>:
    4c14:	00040593          	mv	a1,s0
    4c18:	bcdfc0ef          	jal	17e4 <__GI_write>
    4c1c:	fe9ff06f          	j	4c04 <.L7>

00004c20 <.L9>:
    4c20:	0084a783          	lw	a5,8(s1)
    4c24:	00c4a683          	lw	a3,12(s1)
    4c28:	40f68733          	sub	a4,a3,a5
    4c2c:	f8f686e3          	beq	a3,a5,4bb8 <.L11>
    4c30:	00e96463          	bltu	s2,a4,4c38 <.L12>
    4c34:	00070a13          	mv	s4,a4

00004c38 <.L12>:
    4c38:	00a00693          	li	a3,10
    4c3c:	01440a33          	add	s4,s0,s4

00004c40 <.L15>:
    4c40:	00044703          	lbu	a4,0(s0)
    4c44:	00e78023          	sb	a4,0(a5)
    4c48:	00d71863          	bne	a4,a3,4c58 <.L13>
    4c4c:	0004d703          	lhu	a4,0(s1)
    4c50:	10077713          	and	a4,a4,256
    4c54:	00071863          	bnez	a4,4c64 <.L14>

00004c58 <.L13>:
    4c58:	00140413          	add	s0,s0,1
    4c5c:	00178793          	add	a5,a5,1
    4c60:	ff4410e3          	bne	s0,s4,4c40 <.L15>

00004c64 <.L14>:
    4c64:	0084a703          	lw	a4,8(s1)
    4c68:	00f4a823          	sw	a5,16(s1)
    4c6c:	40e787b3          	sub	a5,a5,a4
    4c70:	40f90933          	sub	s2,s2,a5
    4c74:	f45ff06f          	j	4bb8 <.L11>

00004c78 <_stdio_fopen>:
    4c78:	fe010113          	add	sp,sp,-32
    4c7c:	00812c23          	sw	s0,24(sp)
    4c80:	01212823          	sw	s2,16(sp)
    4c84:	01312623          	sw	s3,12(sp)
    4c88:	00112e23          	sw	ra,28(sp)
    4c8c:	00912a23          	sw	s1,20(sp)
    4c90:	0005c783          	lbu	a5,0(a1)
    4c94:	07200713          	li	a4,114
    4c98:	00050913          	mv	s2,a0
    4c9c:	00060413          	mv	s0,a2
    4ca0:	00068993          	mv	s3,a3
    4ca4:	04e78663          	beq	a5,a4,4cf0 <.L26>
    4ca8:	07700713          	li	a4,119
    4cac:	0ee78663          	beq	a5,a4,4d98 <.L27>
    4cb0:	06100713          	li	a4,97
    4cb4:	0ee78663          	beq	a5,a4,4da0 <.L28>
    4cb8:	0000c797          	auipc	a5,0xc
    4cbc:	91c7a783          	lw	a5,-1764(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    4cc0:	01600713          	li	a4,22
    4cc4:	00e7a023          	sw	a4,0(a5)
    4cc8:	0a061c63          	bnez	a2,4d80 <.L5>

00004ccc <.L8>:
    4ccc:	00000413          	li	s0,0

00004cd0 <.L6>:
    4cd0:	01c12083          	lw	ra,28(sp)
    4cd4:	00040513          	mv	a0,s0
    4cd8:	01812403          	lw	s0,24(sp)
    4cdc:	01412483          	lw	s1,20(sp)
    4ce0:	01012903          	lw	s2,16(sp)
    4ce4:	00c12983          	lw	s3,12(sp)
    4ce8:	02010113          	add	sp,sp,32
    4cec:	00008067          	ret

00004cf0 <.L26>:
    4cf0:	00000493          	li	s1,0

00004cf4 <.L2>:
    4cf4:	0015c703          	lbu	a4,1(a1)
    4cf8:	06200793          	li	a5,98
    4cfc:	00f71463          	bne	a4,a5,4d04 <.L9>
    4d00:	00158593          	add	a1,a1,1

00004d04 <.L9>:
    4d04:	0015c703          	lbu	a4,1(a1)
    4d08:	02b00793          	li	a5,43
    4d0c:	00f71863          	bne	a4,a5,4d1c <.L10>
    4d10:	0014e493          	or	s1,s1,1
    4d14:	00158593          	add	a1,a1,1
    4d18:	00148493          	add	s1,s1,1

00004d1c <.L10>:
    4d1c:	07800713          	li	a4,120

00004d20 <.L11>:
    4d20:	0015c783          	lbu	a5,1(a1)
    4d24:	00158593          	add	a1,a1,1
    4d28:	08079063          	bnez	a5,4da8 <.L13>
    4d2c:	02041063          	bnez	s0,4d4c <.L14>
    4d30:	02400513          	li	a0,36
    4d34:	dbcfe0ef          	jal	32f0 <malloc>
    4d38:	00050413          	mv	s0,a0
    4d3c:	f80508e3          	beqz	a0,4ccc <.L8>
    4d40:	000027b7          	lui	a5,0x2
    4d44:	00f51023          	sh	a5,0(a0)
    4d48:	00052423          	sw	zero,8(a0)

00004d4c <.L14>:
    4d4c:	1609c263          	bltz	s3,4eb0 <.L15>
    4d50:	000087b7          	lui	a5,0x8
    4d54:	00378793          	add	a5,a5,3 # 8003 <.L2+0x7f>
    4d58:	00f4f7b3          	and	a5,s1,a5
    4d5c:	00178793          	add	a5,a5,1
    4d60:	00190713          	add	a4,s2,1
    4d64:	01342223          	sw	s3,4(s0)
    4d68:	00f77733          	and	a4,a4,a5
    4d6c:	04f70463          	beq	a4,a5,4db4 <.L16>

00004d70 <.L41>:
    4d70:	0000c797          	auipc	a5,0xc
    4d74:	8647a783          	lw	a5,-1948(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    4d78:	01600713          	li	a4,22
    4d7c:	00e7a023          	sw	a4,0(a5)

00004d80 <.L5>:
    4d80:	00045783          	lhu	a5,0(s0)
    4d84:	01279713          	sll	a4,a5,0x12
    4d88:	f40752e3          	bgez	a4,4ccc <.L8>
    4d8c:	00040513          	mv	a0,s0
    4d90:	f78fe0ef          	jal	3508 <free>
    4d94:	f39ff06f          	j	4ccc <.L8>

00004d98 <.L27>:
    4d98:	24100493          	li	s1,577
    4d9c:	f59ff06f          	j	4cf4 <.L2>

00004da0 <.L28>:
    4da0:	44100493          	li	s1,1089
    4da4:	f51ff06f          	j	4cf4 <.L2>

00004da8 <.L13>:
    4da8:	f6e79ce3          	bne	a5,a4,4d20 <.L11>
    4dac:	0804e493          	or	s1,s1,128
    4db0:	f71ff06f          	j	4d20 <.L11>

00004db4 <.L16>:
    4db4:	fff94793          	not	a5,s2
    4db8:	0097f7b3          	and	a5,a5,s1
    4dbc:	4007f793          	and	a5,a5,1024
    4dc0:	0c079c63          	bnez	a5,4e98 <.L17>

00004dc4 <.L20>:
    4dc4:	000087b7          	lui	a5,0x8
    4dc8:	00f977b3          	and	a5,s2,a5
    4dcc:	00f4e4b3          	or	s1,s1,a5

00004dd0 <.L18>:
    4dd0:	00045783          	lhu	a5,0(s0)
    4dd4:	00002737          	lui	a4,0x2
    4dd8:	00442503          	lw	a0,4(s0)
    4ddc:	00e7f7b3          	and	a5,a5,a4
    4de0:	ffff8737          	lui	a4,0xffff8
    4de4:	40070713          	add	a4,a4,1024 # ffff8400 <_ebss+0xfffe20d0>
    4de8:	00e4f733          	and	a4,s1,a4
    4dec:	0034f493          	and	s1,s1,3
    4df0:	00148493          	add	s1,s1,1
    4df4:	0034c493          	xor	s1,s1,3
    4df8:	00e7e7b3          	or	a5,a5,a4
    4dfc:	00449493          	sll	s1,s1,0x4
    4e00:	0097e7b3          	or	a5,a5,s1
    4e04:	00f41023          	sh	a5,0(s0)
    4e08:	800007b7          	lui	a5,0x80000
    4e0c:	fff78793          	add	a5,a5,-1 # 7fffffff <_ebss+0x7ffe9ccf>
    4e10:	02f50463          	beq	a0,a5,4e38 <.L22>
    4e14:	0000b497          	auipc	s1,0xb
    4e18:	7c04a483          	lw	s1,1984(s1) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    4e1c:	0004a903          	lw	s2,0(s1)
    4e20:	ac0fe0ef          	jal	30e0 <__GI_isatty>
    4e24:	00050863          	beqz	a0,4e34 <.L23>
    4e28:	00045783          	lhu	a5,0(s0)
    4e2c:	1007e793          	or	a5,a5,256
    4e30:	00f41023          	sh	a5,0(s0)

00004e34 <.L23>:
    4e34:	0124a023          	sw	s2,0(s1)

00004e38 <.L22>:
    4e38:	00842783          	lw	a5,8(s0)
    4e3c:	02079863          	bnez	a5,4e6c <.L24>
    4e40:	00001537          	lui	a0,0x1
    4e44:	cacfe0ef          	jal	32f0 <malloc>
    4e48:	00a42423          	sw	a0,8(s0)
    4e4c:	08050863          	beqz	a0,4edc <.L25>
    4e50:	000017b7          	lui	a5,0x1
    4e54:	00f50533          	add	a0,a0,a5
    4e58:	00045783          	lhu	a5,0(s0)
    4e5c:	00004737          	lui	a4,0x4
    4e60:	00a42623          	sw	a0,12(s0)
    4e64:	00e7e7b3          	or	a5,a5,a4
    4e68:	00f41023          	sh	a5,0(s0)

00004e6c <.L24>:
    4e6c:	00842783          	lw	a5,8(s0)
    4e70:	00f42c23          	sw	a5,24(s0)
    4e74:	00f42e23          	sw	a5,28(s0)
    4e78:	00f42823          	sw	a5,16(s0)
    4e7c:	00f42a23          	sw	a5,20(s0)
    4e80:	0000b797          	auipc	a5,0xb
    4e84:	7647a783          	lw	a5,1892(a5) # 105e4 <_GLOBAL_OFFSET_TABLE_+0x1c>
    4e88:	0007a703          	lw	a4,0(a5)
    4e8c:	0087a023          	sw	s0,0(a5)
    4e90:	02e42023          	sw	a4,32(s0)
    4e94:	e3dff06f          	j	4cd0 <.L6>

00004e98 <.L17>:
    4e98:	40000613          	li	a2,1024
    4e9c:	00400593          	li	a1,4
    4ea0:	00098513          	mv	a0,s3
    4ea4:	478020ef          	jal	731c <__GI_fcntl>
    4ea8:	f0050ee3          	beqz	a0,4dc4 <.L20>
    4eac:	ec5ff06f          	j	4d70 <.L41>

00004eb0 <.L15>:
    4eb0:	fff00793          	li	a5,-1
    4eb4:	00f98663          	beq	s3,a5,4ec0 <.L21>
    4eb8:	000087b7          	lui	a5,0x8
    4ebc:	00f4e4b3          	or	s1,s1,a5

00004ec0 <.L21>:
    4ec0:	1b600613          	li	a2,438
    4ec4:	00048593          	mv	a1,s1
    4ec8:	00090513          	mv	a0,s2
    4ecc:	869fc0ef          	jal	1734 <__GI_open>
    4ed0:	00a42223          	sw	a0,4(s0)
    4ed4:	ee055ee3          	bgez	a0,4dd0 <.L18>
    4ed8:	ea9ff06f          	j	4d80 <.L5>

00004edc <.L25>:
    4edc:	00042623          	sw	zero,12(s0)
    4ee0:	f8dff06f          	j	4e6c <.L24>

00004ee4 <__stdio_fwrite>:
    4ee4:	00065783          	lhu	a5,0(a2)
    4ee8:	fe010113          	add	sp,sp,-32
    4eec:	00812c23          	sw	s0,24(sp)
    4ef0:	00912a23          	sw	s1,20(sp)
    4ef4:	01212823          	sw	s2,16(sp)
    4ef8:	00112e23          	sw	ra,28(sp)
    4efc:	01312623          	sw	s3,12(sp)
    4f00:	2007f793          	and	a5,a5,512
    4f04:	00050913          	mv	s2,a0
    4f08:	00058413          	mv	s0,a1
    4f0c:	00060493          	mv	s1,a2
    4f10:	02078663          	beqz	a5,4f3c <.L2>

00004f14 <.L11>:
    4f14:	00040613          	mv	a2,s0
    4f18:	01812403          	lw	s0,24(sp)
    4f1c:	01c12083          	lw	ra,28(sp)
    4f20:	00c12983          	lw	s3,12(sp)
    4f24:	00090593          	mv	a1,s2
    4f28:	00048513          	mv	a0,s1
    4f2c:	01012903          	lw	s2,16(sp)
    4f30:	01412483          	lw	s1,20(sp)
    4f34:	02010113          	add	sp,sp,32
    4f38:	bd9ff06f          	j	4b10 <__stdio_WRITE>

00004f3c <.L2>:
    4f3c:	01062503          	lw	a0,16(a2)
    4f40:	00c62783          	lw	a5,12(a2)
    4f44:	00462683          	lw	a3,4(a2)
    4f48:	ffd00713          	li	a4,-3
    4f4c:	40a787b3          	sub	a5,a5,a0
    4f50:	04e69463          	bne	a3,a4,4f98 <.L3>
    4f54:	00058993          	mv	s3,a1
    4f58:	00b7f463          	bgeu	a5,a1,4f60 <.L4>
    4f5c:	00078993          	mv	s3,a5

00004f60 <.L4>:
    4f60:	00098613          	mv	a2,s3
    4f64:	00090593          	mv	a1,s2
    4f68:	b89fd0ef          	jal	2af0 <__GI_memcpy>
    4f6c:	0104a783          	lw	a5,16(s1)
    4f70:	013787b3          	add	a5,a5,s3

00004f74 <.L25>:
    4f74:	00f4a823          	sw	a5,16(s1)

00004f78 <.L5>:
    4f78:	01c12083          	lw	ra,28(sp)
    4f7c:	00040513          	mv	a0,s0
    4f80:	01812403          	lw	s0,24(sp)
    4f84:	01412483          	lw	s1,20(sp)
    4f88:	01012903          	lw	s2,16(sp)
    4f8c:	00c12983          	lw	s3,12(sp)
    4f90:	02010113          	add	sp,sp,32
    4f94:	00008067          	ret

00004f98 <.L3>:
    4f98:	08b7e063          	bltu	a5,a1,5018 <.L6>
    4f9c:	00058613          	mv	a2,a1
    4fa0:	00090593          	mv	a1,s2
    4fa4:	b4dfd0ef          	jal	2af0 <__GI_memcpy>
    4fa8:	0104a783          	lw	a5,16(s1)
    4fac:	008787b3          	add	a5,a5,s0
    4fb0:	00f4a823          	sw	a5,16(s1)
    4fb4:	0004d783          	lhu	a5,0(s1)
    4fb8:	1007f793          	and	a5,a5,256
    4fbc:	fa078ee3          	beqz	a5,4f78 <.L5>
    4fc0:	00040613          	mv	a2,s0
    4fc4:	00a00593          	li	a1,10
    4fc8:	00090513          	mv	a0,s2
    4fcc:	254010ef          	jal	6220 <__GI_memrchr>
    4fd0:	fa0504e3          	beqz	a0,4f78 <.L5>
    4fd4:	00048513          	mv	a0,s1
    4fd8:	9c1fc0ef          	jal	1998 <__stdio_wcommit>
    4fdc:	f8050ee3          	beqz	a0,4f78 <.L5>
    4fe0:	00040613          	mv	a2,s0
    4fe4:	00857463          	bgeu	a0,s0,4fec <.L10>
    4fe8:	00050613          	mv	a2,a0

00004fec <.L10>:
    4fec:	40c40533          	sub	a0,s0,a2
    4ff0:	00a00593          	li	a1,10
    4ff4:	00a90533          	add	a0,s2,a0
    4ff8:	12c010ef          	jal	6124 <__GI_memchr>
    4ffc:	f6050ee3          	beqz	a0,4f78 <.L5>
    5000:	0104a783          	lw	a5,16(s1)
    5004:	00890933          	add	s2,s2,s0
    5008:	40a90533          	sub	a0,s2,a0
    500c:	40a40433          	sub	s0,s0,a0
    5010:	40a787b3          	sub	a5,a5,a0
    5014:	f61ff06f          	j	4f74 <.L25>

00005018 <.L6>:
    5018:	00862783          	lw	a5,8(a2)
    501c:	eea78ce3          	beq	a5,a0,4f14 <.L11>
    5020:	00060513          	mv	a0,a2
    5024:	975fc0ef          	jal	1998 <__stdio_wcommit>
    5028:	ee0506e3          	beqz	a0,4f14 <.L11>
    502c:	00000413          	li	s0,0
    5030:	f49ff06f          	j	4f78 <.L5>

00005034 <__stdio_trans2w>:
    5034:	00055603          	lhu	a2,0(a0) # 1000 <.L52+0x4>
    5038:	ff010113          	add	sp,sp,-16
    503c:	00812423          	sw	s0,8(sp)
    5040:	00112623          	sw	ra,12(sp)
    5044:	02067793          	and	a5,a2,32
    5048:	00050413          	mv	s0,a0
    504c:	02078a63          	beqz	a5,5080 <.L2>
    5050:	0000b797          	auipc	a5,0xb
    5054:	5847a783          	lw	a5,1412(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    5058:	00900713          	li	a4,9
    505c:	00e7a023          	sw	a4,0(a5)

00005060 <.L3>:
    5060:	00045783          	lhu	a5,0(s0)
    5064:	fff00513          	li	a0,-1
    5068:	0087e793          	or	a5,a5,8
    506c:	00f41023          	sh	a5,0(s0)

00005070 <.L1>:
    5070:	00c12083          	lw	ra,12(sp)
    5074:	00812403          	lw	s0,8(sp)
    5078:	01010113          	add	sp,sp,16
    507c:	00008067          	ret

00005080 <.L2>:
    5080:	00367793          	and	a5,a2,3
    5084:	02078463          	beqz	a5,50ac <.L5>
    5088:	00467793          	and	a5,a2,4
    508c:	02078e63          	beqz	a5,50c8 <.L6>

00005090 <.L8>:
    5090:	00045783          	lhu	a5,0(s0)
    5094:	ffc7f793          	and	a5,a5,-4
    5098:	00f41023          	sh	a5,0(s0)
    509c:	00842783          	lw	a5,8(s0)
    50a0:	00f42c23          	sw	a5,24(s0)
    50a4:	00f42823          	sw	a5,16(s0)
    50a8:	00f42a23          	sw	a5,20(s0)

000050ac <.L5>:
    50ac:	00045783          	lhu	a5,0(s0)
    50b0:	0407e713          	or	a4,a5,64
    50b4:	00e41023          	sh	a4,0(s0)
    50b8:	3007f793          	and	a5,a5,768
    50bc:	04078063          	beqz	a5,50fc <.L10>

000050c0 <.L11>:
    50c0:	00000513          	li	a0,0
    50c4:	fadff06f          	j	5070 <.L1>

000050c8 <.L6>:
    50c8:	01452703          	lw	a4,20(a0)
    50cc:	01052783          	lw	a5,16(a0)
    50d0:	00f71663          	bne	a4,a5,50dc <.L7>
    50d4:	00267793          	and	a5,a2,2
    50d8:	fa078ce3          	beqz	a5,5090 <.L8>

000050dc <.L7>:
    50dc:	40067613          	and	a2,a2,1024
    50e0:	00c03633          	snez	a2,a2
    50e4:	00160613          	add	a2,a2,1
    50e8:	00000593          	li	a1,0
    50ec:	00040513          	mv	a0,s0
    50f0:	46c020ef          	jal	755c <__GI_fseek>
    50f4:	f8050ee3          	beqz	a0,5090 <.L8>
    50f8:	f69ff06f          	j	5060 <.L3>

000050fc <.L10>:
    50fc:	00c42783          	lw	a5,12(s0)
    5100:	00f42e23          	sw	a5,28(s0)
    5104:	fbdff06f          	j	50c0 <.L11>

00005108 <_load_inttype>:
    5108:	00001737          	lui	a4,0x1
    510c:	80070713          	add	a4,a4,-2048 # 800 <.L25>
    5110:	00050793          	mv	a5,a0
    5114:	00e57733          	and	a4,a0,a4
    5118:	0005a503          	lw	a0,0(a1)
    511c:	02064c63          	bltz	a2,5154 <.L2>
    5120:	00070663          	beqz	a4,512c <.L3>

00005124 <.L10>:
    5124:	0045a583          	lw	a1,4(a1)
    5128:	00008067          	ret

0000512c <.L3>:
    512c:	10000713          	li	a4,256
    5130:	00e79863          	bne	a5,a4,5140 <.L5>
    5134:	0ff57513          	zext.b	a0,a0

00005138 <.L6>:
    5138:	00000593          	li	a1,0
    513c:	00008067          	ret

00005140 <.L5>:
    5140:	20000713          	li	a4,512
    5144:	fee79ae3          	bne	a5,a4,5138 <.L6>
    5148:	01051513          	sll	a0,a0,0x10
    514c:	01055513          	srl	a0,a0,0x10
    5150:	fe9ff06f          	j	5138 <.L6>

00005154 <.L2>:
    5154:	fc0718e3          	bnez	a4,5124 <.L10>
    5158:	10000713          	li	a4,256
    515c:	00e79a63          	bne	a5,a4,5170 <.L8>
    5160:	01851513          	sll	a0,a0,0x18
    5164:	41855513          	sra	a0,a0,0x18

00005168 <.L9>:
    5168:	41f55593          	sra	a1,a0,0x1f
    516c:	00008067          	ret

00005170 <.L8>:
    5170:	20000713          	li	a4,512
    5174:	fee79ae3          	bne	a5,a4,5168 <.L9>
    5178:	01051513          	sll	a0,a0,0x10
    517c:	41055513          	sra	a0,a0,0x10
    5180:	fe9ff06f          	j	5168 <.L9>

00005184 <_store_inttype>:
    5184:	10000793          	li	a5,256
    5188:	00f59663          	bne	a1,a5,5194 <.L2>
    518c:	00c50023          	sb	a2,0(a0)
    5190:	00008067          	ret

00005194 <.L2>:
    5194:	80058793          	add	a5,a1,-2048
    5198:	00079863          	bnez	a5,51a8 <.L4>
    519c:	00c52023          	sw	a2,0(a0)
    51a0:	00d52223          	sw	a3,4(a0)
    51a4:	00008067          	ret

000051a8 <.L4>:
    51a8:	20000793          	li	a5,512
    51ac:	00f59663          	bne	a1,a5,51b8 <.L5>
    51b0:	00c51023          	sh	a2,0(a0)
    51b4:	00008067          	ret

000051b8 <.L5>:
    51b8:	00c52023          	sw	a2,0(a0)
    51bc:	00008067          	ret

000051c0 <_uintmaxtostr>:
    51c0:	00050893          	mv	a7,a0
    51c4:	00000e13          	li	t3,0
    51c8:	0206d063          	bgez	a3,51e8 <.L2>
    51cc:	40d006b3          	neg	a3,a3
    51d0:	00065c63          	bgez	a2,51e8 <.L2>
    51d4:	00b037b3          	snez	a5,a1
    51d8:	40c00633          	neg	a2,a2
    51dc:	40f60633          	sub	a2,a2,a5
    51e0:	40b005b3          	neg	a1,a1
    51e4:	00100e13          	li	t3,1

000051e8 <.L2>:
    51e8:	fff00813          	li	a6,-1
    51ec:	02d85333          	divu	t1,a6,a3
    51f0:	00088023          	sb	zero,0(a7)
    51f4:	02d87833          	remu	a6,a6,a3
    51f8:	00180813          	add	a6,a6,1
    51fc:	01069663          	bne	a3,a6,5208 <.L4>
    5200:	00130313          	add	t1,t1,1
    5204:	00000813          	li	a6,0

00005208 <.L4>:
    5208:	00900e93          	li	t4,9

0000520c <.L8>:
    520c:	02d5f533          	remu	a0,a1,a3
    5210:	02d5d5b3          	divu	a1,a1,a3
    5214:	02060463          	beqz	a2,523c <.L5>
    5218:	02d677b3          	remu	a5,a2,a3
    521c:	02f80f33          	mul	t5,a6,a5
    5220:	02f307b3          	mul	a5,t1,a5
    5224:	00af0533          	add	a0,t5,a0
    5228:	00b785b3          	add	a1,a5,a1
    522c:	02d557b3          	divu	a5,a0,a3
    5230:	02d65633          	divu	a2,a2,a3
    5234:	00f585b3          	add	a1,a1,a5
    5238:	02d57533          	remu	a0,a0,a3

0000523c <.L5>:
    523c:	0ff57793          	zext.b	a5,a0
    5240:	02aeec63          	bltu	t4,a0,5278 <.L6>
    5244:	03078793          	add	a5,a5,48

00005248 <.L19>:
    5248:	0ff7f793          	zext.b	a5,a5
    524c:	fef88fa3          	sb	a5,-1(a7)
    5250:	00b667b3          	or	a5,a2,a1
    5254:	fff88513          	add	a0,a7,-1
    5258:	00079c63          	bnez	a5,5270 <.L12>
    525c:	000e0863          	beqz	t3,526c <.L1>
    5260:	02d00793          	li	a5,45
    5264:	fef50fa3          	sb	a5,-1(a0)
    5268:	ffe88513          	add	a0,a7,-2

0000526c <.L1>:
    526c:	00008067          	ret

00005270 <.L12>:
    5270:	00050893          	mv	a7,a0
    5274:	f99ff06f          	j	520c <.L8>

00005278 <.L6>:
    5278:	00e787b3          	add	a5,a5,a4
    527c:	fcdff06f          	j	5248 <.L19>

00005280 <_fpmaxtostr>:
    5280:	e7010113          	add	sp,sp,-400
    5284:	00462783          	lw	a5,4(a2)
    5288:	18812423          	sw	s0,392(sp)
    528c:	00864403          	lbu	s0,8(a2)
    5290:	02f12c23          	sw	a5,56(sp)
    5294:	06500793          	li	a5,101
    5298:	18912223          	sw	s1,388(sp)
    529c:	19212023          	sw	s2,384(sp)
    52a0:	17312e23          	sw	s3,380(sp)
    52a4:	17412c23          	sw	s4,376(sp)
    52a8:	17512a23          	sw	s5,372(sp)
    52ac:	17612823          	sw	s6,368(sp)
    52b0:	17912223          	sw	s9,356(sp)
    52b4:	0af10c23          	sb	a5,184(sp)
    52b8:	18112623          	sw	ra,396(sp)
    52bc:	17712623          	sw	s7,364(sp)
    52c0:	17812423          	sw	s8,360(sp)
    52c4:	17a12023          	sw	s10,352(sp)
    52c8:	15b12e23          	sw	s11,348(sp)
    52cc:	04a12823          	sw	a0,80(sp)
    52d0:	04d12a23          	sw	a3,84(sp)
    52d4:	02046c93          	or	s9,s0,32
    52d8:	06100793          	li	a5,97
    52dc:	0005aa03          	lw	s4,0(a1)
    52e0:	0045aa83          	lw	s5,4(a1)
    52e4:	0085ab03          	lw	s6,8(a1)
    52e8:	00c5a903          	lw	s2,12(a1)
    52ec:	00062483          	lw	s1,0(a2)
    52f0:	00060993          	mv	s3,a2
    52f4:	1cfc9e63          	bne	s9,a5,54d0 <.L2>
    52f8:	07000793          	li	a5,112
    52fc:	0af10c23          	sb	a5,184(sp)
    5300:	1e04c063          	bltz	s1,54e0 <.L67>

00005304 <.L4>:
    5304:	02012a23          	sw	zero,52(sp)

00005308 <.L3>:
    5308:	00c9a783          	lw	a5,12(s3) # 2000c <_ebss+0x9cdc>
    530c:	0a010823          	sb	zero,176(sp)
    5310:	0027f713          	and	a4,a5,2
    5314:	1c070e63          	beqz	a4,54f0 <.L5>
    5318:	02b00793          	li	a5,43

0000531c <.L118>:
    531c:	0af10823          	sb	a5,176(sp)

00005320 <.L6>:
    5320:	0a010c13          	add	s8,sp,160
    5324:	09010b93          	add	s7,sp,144
    5328:	000b8593          	mv	a1,s7
    532c:	000c0513          	mv	a0,s8
    5330:	0a0108a3          	sb	zero,177(sp)
    5334:	10012223          	sw	zero,260(sp)
    5338:	0b412023          	sw	s4,160(sp)
    533c:	0b512223          	sw	s5,164(sp)
    5340:	0b612423          	sw	s6,168(sp)
    5344:	0b212623          	sw	s2,172(sp)
    5348:	09412823          	sw	s4,144(sp)
    534c:	09512a23          	sw	s5,148(sp)
    5350:	09612c23          	sw	s6,152(sp)
    5354:	09212e23          	sw	s2,156(sp)
    5358:	3f9060ef          	jal	bf50 <__eqtf2>
    535c:	1a050263          	beqz	a0,5500 <.L113>
    5360:	00800793          	li	a5,8
    5364:	10f12223          	sw	a5,260(sp)

00005368 <.L9>:
    5368:	02000793          	li	a5,32
    536c:	00f9a823          	sw	a5,16(s3)
    5370:	07000793          	li	a5,112
    5374:	0ef12e23          	sw	a5,252(sp)
    5378:	00300793          	li	a5,3
    537c:	10f12023          	sw	a5,256(sp)
    5380:	06000793          	li	a5,96
    5384:	0087e863          	bltu	a5,s0,5394 <.L18>
    5388:	10412783          	lw	a5,260(sp)
    538c:	00478793          	add	a5,a5,4
    5390:	10f12223          	sw	a5,260(sp)

00005394 <.L18>:
    5394:	10412783          	lw	a5,260(sp)
    5398:	0000d717          	auipc	a4,0xd
    539c:	81870713          	add	a4,a4,-2024 # 11bb0 <fmt>
    53a0:	00040593          	mv	a1,s0
    53a4:	00e787b3          	add	a5,a5,a4
    53a8:	10f12223          	sw	a5,260(sp)
    53ac:	10810913          	add	s2,sp,264

000053b0 <.L19>:
    53b0:	10010793          	add	a5,sp,256

000053b4 <.L59>:
    53b4:	0007a703          	lw	a4,0(a5)
    53b8:	03812683          	lw	a3,56(sp)
    53bc:	00c78793          	add	a5,a5,12
    53c0:	40e68733          	sub	a4,a3,a4
    53c4:	02e12c23          	sw	a4,56(sp)
    53c8:	ff27e6e3          	bltu	a5,s2,53b4 <.L59>
    53cc:	0b014703          	lbu	a4,176(sp)
    53d0:	0a000793          	li	a5,160
    53d4:	0ef12823          	sw	a5,240(sp)
    53d8:	00e03733          	snez	a4,a4
    53dc:	0b010693          	add	a3,sp,176
    53e0:	0205e793          	or	a5,a1,32
    53e4:	0ee12a23          	sw	a4,244(sp)
    53e8:	0ed12c23          	sw	a3,248(sp)
    53ec:	0ff7f793          	zext.b	a5,a5
    53f0:	06100613          	li	a2,97
    53f4:	02c79a63          	bne	a5,a2,5428 <.L60>
    53f8:	0fc12603          	lw	a2,252(sp)
    53fc:	00f00793          	li	a5,15
    5400:	02c7d463          	bge	a5,a2,5428 <.L60>
    5404:	00e687b3          	add	a5,a3,a4
    5408:	03000693          	li	a3,48
    540c:	00d78023          	sb	a3,0(a5)
    5410:	0b814683          	lbu	a3,184(sp)
    5414:	00270713          	add	a4,a4,2
    5418:	00078123          	sb	zero,2(a5)
    541c:	00868693          	add	a3,a3,8
    5420:	00d780a3          	sb	a3,1(a5)
    5424:	0ee12a23          	sw	a4,244(sp)

00005428 <.L60>:
    5428:	03812783          	lw	a5,56(sp)
    542c:	40e787b3          	sub	a5,a5,a4
    5430:	02f05663          	blez	a5,545c <.L63>
    5434:	00c9a703          	lw	a4,12(s3)
    5438:	00877713          	and	a4,a4,8
    543c:	1e070ae3          	beqz	a4,5e30 <.L62>
    5440:	00f92223          	sw	a5,4(s2)
    5444:	0a000713          	li	a4,160
    5448:	0000c797          	auipc	a5,0xc
    544c:	76b78793          	add	a5,a5,1899 # 11bb3 <fmt+0x3>
    5450:	00e92023          	sw	a4,0(s2)
    5454:	00f92423          	sw	a5,8(s2)
    5458:	00c90913          	add	s2,s2,12

0000545c <.L63>:
    545c:	0f010413          	add	s0,sp,240
    5460:	00000493          	li	s1,0

00005464 <.L66>:
    5464:	00442983          	lw	s3,4(s0)
    5468:	00842683          	lw	a3,8(s0)
    546c:	00042583          	lw	a1,0(s0)
    5470:	05012503          	lw	a0,80(sp)
    5474:	05412783          	lw	a5,84(sp)
    5478:	00098613          	mv	a2,s3
    547c:	000780e7          	jalr	a5
    5480:	1d351ee3          	bne	a0,s3,5e5c <.L82>
    5484:	00c40413          	add	s0,s0,12
    5488:	00a484b3          	add	s1,s1,a0
    548c:	fd246ce3          	bltu	s0,s2,5464 <.L66>

00005490 <.L1>:
    5490:	18c12083          	lw	ra,396(sp)
    5494:	18812403          	lw	s0,392(sp)
    5498:	18012903          	lw	s2,384(sp)
    549c:	17c12983          	lw	s3,380(sp)
    54a0:	17812a03          	lw	s4,376(sp)
    54a4:	17412a83          	lw	s5,372(sp)
    54a8:	17012b03          	lw	s6,368(sp)
    54ac:	16c12b83          	lw	s7,364(sp)
    54b0:	16812c03          	lw	s8,360(sp)
    54b4:	16412c83          	lw	s9,356(sp)
    54b8:	16012d03          	lw	s10,352(sp)
    54bc:	15c12d83          	lw	s11,348(sp)
    54c0:	00048513          	mv	a0,s1
    54c4:	18412483          	lw	s1,388(sp)
    54c8:	19010113          	add	sp,sp,400
    54cc:	00008067          	ret

000054d0 <.L2>:
    54d0:	e204dae3          	bgez	s1,5304 <.L4>
    54d4:	02012a23          	sw	zero,52(sp)
    54d8:	00600493          	li	s1,6
    54dc:	e2dff06f          	j	5308 <.L3>

000054e0 <.L67>:
    54e0:	00100793          	li	a5,1
    54e4:	02f12a23          	sw	a5,52(sp)
    54e8:	01d00493          	li	s1,29
    54ec:	e1dff06f          	j	5308 <.L3>

000054f0 <.L5>:
    54f0:	0017f793          	and	a5,a5,1
    54f4:	e20786e3          	beqz	a5,5320 <.L6>
    54f8:	02000793          	li	a5,32
    54fc:	e21ff06f          	j	531c <.L118>

00005500 <.L113>:
    5500:	000b8593          	mv	a1,s7
    5504:	000c0513          	mv	a0,s8
    5508:	0b412023          	sw	s4,160(sp)
    550c:	0b512223          	sw	s5,164(sp)
    5510:	0b612423          	sw	s6,168(sp)
    5514:	0b212623          	sw	s2,172(sp)
    5518:	08012823          	sw	zero,144(sp)
    551c:	08012a23          	sw	zero,148(sp)
    5520:	08012c23          	sw	zero,152(sp)
    5524:	08012e23          	sw	zero,156(sp)
    5528:	229060ef          	jal	bf50 <__eqtf2>
    552c:	24051e63          	bnez	a0,5788 <.L114>
    5530:	000c0513          	mv	a0,s8
    5534:	06d090ef          	jal	eda0 <__trunctfdf2>
    5538:	00b50663          	beq	a0,a1,5544 <.L12>
    553c:	02d00793          	li	a5,45
    5540:	0af10823          	sb	a5,176(sp)

00005544 <.L12>:
    5544:	02400793          	li	a5,36
    5548:	02f12623          	sw	a5,44(sp)
    554c:	00900793          	li	a5,9
    5550:	0000d617          	auipc	a2,0xd
    5554:	e4060613          	add	a2,a2,-448 # 12390 <.LC2>
    5558:	02f12423          	sw	a5,40(sp)
    555c:	00a00793          	li	a5,10
    5560:	00f12623          	sw	a5,12(sp)
    5564:	00062783          	lw	a5,0(a2)
    5568:	000a0c93          	mv	s9,s4
    556c:	000a8d13          	mv	s10,s5
    5570:	00f12c23          	sw	a5,24(sp)
    5574:	00462783          	lw	a5,4(a2)
    5578:	000b0d93          	mv	s11,s6
    557c:	00090b93          	mv	s7,s2
    5580:	00f12e23          	sw	a5,28(sp)
    5584:	00862783          	lw	a5,8(a2)
    5588:	fff00c13          	li	s8,-1
    558c:	02f12023          	sw	a5,32(sp)
    5590:	00c62783          	lw	a5,12(a2)
    5594:	02f12223          	sw	a5,36(sp)

00005598 <.L13>:
    5598:	0a010793          	add	a5,sp,160
    559c:	00f12823          	sw	a5,16(sp)
    55a0:	09010793          	add	a5,sp,144
    55a4:	00f12a23          	sw	a5,20(sp)
    55a8:	08010793          	add	a5,sp,128
    55ac:	00400913          	li	s2,4
    55b0:	0ca10a13          	add	s4,sp,202
    55b4:	02f12823          	sw	a5,48(sp)
    55b8:	07010b13          	add	s6,sp,112

000055bc <.L29>:
    55bc:	01012503          	lw	a0,16(sp)
    55c0:	0b912023          	sw	s9,160(sp)
    55c4:	0ba12223          	sw	s10,164(sp)
    55c8:	0bb12423          	sw	s11,168(sp)
    55cc:	0b712623          	sw	s7,172(sp)
    55d0:	144090ef          	jal	e714 <__fixunstfsi>
    55d4:	00050593          	mv	a1,a0
    55d8:	00050a93          	mv	s5,a0
    55dc:	01012503          	lw	a0,16(sp)
    55e0:	22c090ef          	jal	e80c <__floatunsitf>
    55e4:	0a012703          	lw	a4,160(sp)
    55e8:	03012583          	lw	a1,48(sp)
    55ec:	01412503          	lw	a0,20(sp)
    55f0:	06e12823          	sw	a4,112(sp)
    55f4:	0a412703          	lw	a4,164(sp)
    55f8:	000b0613          	mv	a2,s6
    55fc:	09912023          	sw	s9,128(sp)
    5600:	06e12a23          	sw	a4,116(sp)
    5604:	0a812703          	lw	a4,168(sp)
    5608:	09a12223          	sw	s10,132(sp)
    560c:	09b12423          	sw	s11,136(sp)
    5610:	06e12c23          	sw	a4,120(sp)
    5614:	0ac12703          	lw	a4,172(sp)
    5618:	09712623          	sw	s7,140(sp)
    561c:	06e12e23          	sw	a4,124(sp)
    5620:	461070ef          	jal	d280 <__subtf3>
    5624:	01812783          	lw	a5,24(sp)
    5628:	03012603          	lw	a2,48(sp)
    562c:	01012503          	lw	a0,16(sp)
    5630:	08f12023          	sw	a5,128(sp)
    5634:	01c12783          	lw	a5,28(sp)
    5638:	01412583          	lw	a1,20(sp)
    563c:	08f12223          	sw	a5,132(sp)
    5640:	02012783          	lw	a5,32(sp)
    5644:	08f12423          	sw	a5,136(sp)
    5648:	02412783          	lw	a5,36(sp)
    564c:	08f12623          	sw	a5,140(sp)
    5650:	42d060ef          	jal	c27c <__multf3>
    5654:	02812783          	lw	a5,40(sp)
    5658:	0a012c83          	lw	s9,160(sp)
    565c:	0a412d03          	lw	s10,164(sp)
    5660:	0a812d83          	lw	s11,168(sp)
    5664:	0ac12b83          	lw	s7,172(sp)
    5668:	00fa0a33          	add	s4,s4,a5
    566c:	000a0613          	mv	a2,s4
    5670:	40fa0533          	sub	a0,s4,a5

00005674 <.L28>:
    5674:	00c12783          	lw	a5,12(sp)
    5678:	fff60613          	add	a2,a2,-1
    567c:	02faf5b3          	remu	a1,s5,a5
    5680:	03058593          	add	a1,a1,48
    5684:	00b60023          	sb	a1,0(a2)
    5688:	02fadab3          	divu	s5,s5,a5
    568c:	fec514e3          	bne	a0,a2,5674 <.L28>
    5690:	fff90913          	add	s2,s2,-1
    5694:	f20914e3          	bnez	s2,55bc <.L29>
    5698:	06000713          	li	a4,96
    569c:	00876c63          	bltu	a4,s0,56b4 <.L30>
    56a0:	0b814703          	lbu	a4,184(sp)
    56a4:	02040413          	add	s0,s0,32
    56a8:	0ff47413          	zext.b	s0,s0
    56ac:	fe070713          	add	a4,a4,-32
    56b0:	0ae10c23          	sb	a4,184(sp)

000056b4 <.L30>:
    56b4:	06700713          	li	a4,103
    56b8:	50e41663          	bne	s0,a4,5bc4 <.L31>
    56bc:	00000693          	li	a3,0
    56c0:	00048663          	beqz	s1,56cc <.L32>
    56c4:	fff48493          	add	s1,s1,-1
    56c8:	00048693          	mv	a3,s1

000056cc <.L32>:
    56cc:	02c12783          	lw	a5,44(sp)
    56d0:	00003737          	lui	a4,0x3
    56d4:	0ce11423          	sh	a4,200(sp)
    56d8:	0c910513          	add	a0,sp,201
    56dc:	50f6ce63          	blt	a3,a5,5bf8 <.L33>
    56e0:	00178613          	add	a2,a5,1
    56e4:	00c50633          	add	a2,a0,a2
    56e8:	00000593          	li	a1,0

000056ec <.L34>:
    56ec:	00c12783          	lw	a5,12(sp)
    56f0:	03000813          	li	a6,48
    56f4:	02f78b93          	add	s7,a5,47

000056f8 <.L35>:
    56f8:	fff64703          	lbu	a4,-1(a2)
    56fc:	fff60613          	add	a2,a2,-1
    5700:	00b70733          	add	a4,a4,a1
    5704:	0ff77713          	zext.b	a4,a4
    5708:	00e60023          	sb	a4,0(a2)
    570c:	ff0706e3          	beq	a4,a6,56f8 <.L35>
    5710:	feebe4e3          	bltu	s7,a4,56f8 <.L35>
    5714:	02046713          	or	a4,s0,32
    5718:	06100593          	li	a1,97
    571c:	52b71063          	bne	a4,a1,5c3c <.L37>
    5720:	0b814583          	lbu	a1,184(sp)
    5724:	00060813          	mv	a6,a2
    5728:	03900893          	li	a7,57
    572c:	fb758593          	add	a1,a1,-73
    5730:	0ff5f593          	zext.b	a1,a1

00005734 <.L38>:
    5734:	00084703          	lbu	a4,0(a6)
    5738:	4e071263          	bnez	a4,5c1c <.L40>
    573c:	4ec56a63          	bltu	a0,a2,5c30 <.L41>

00005740 <.L43>:
    5740:	001c0c13          	add	s8,s8,1 # 2001 <.L53+0x1>
    5744:	00050613          	mv	a2,a0
    5748:	00050713          	mv	a4,a0

0000574c <.L42>:
    574c:	000600a3          	sb	zero,1(a2)
    5750:	06700593          	li	a1,103
    5754:	4eb41863          	bne	s0,a1,5c44 <.L44>
    5758:	ffc00593          	li	a1,-4
    575c:	4ebc4c63          	blt	s8,a1,5c54 <.L73>
    5760:	4f86ca63          	blt	a3,s8,5c54 <.L73>
    5764:	418684b3          	sub	s1,a3,s8

00005768 <.L46>:
    5768:	000c0693          	mv	a3,s8
    576c:	000c5a63          	bgez	s8,5780 <.L123>
    5770:	03000693          	li	a3,48
    5774:	fed70fa3          	sb	a3,-1(a4) # 2fff <__GI___xpg_strerror_r+0x23>
    5778:	000c0693          	mv	a3,s8
    577c:	fff70713          	add	a4,a4,-1

00005780 <.L123>:
    5780:	06600593          	li	a1,102
    5784:	4d80006f          	j	5c5c <.L45>

00005788 <.L114>:
    5788:	000b8593          	mv	a1,s7
    578c:	000c0513          	mv	a0,s8
    5790:	0b412023          	sw	s4,160(sp)
    5794:	0b512223          	sw	s5,164(sp)
    5798:	0b612423          	sw	s6,168(sp)
    579c:	0b212623          	sw	s2,172(sp)
    57a0:	08012823          	sw	zero,144(sp)
    57a4:	08012a23          	sw	zero,148(sp)
    57a8:	08012c23          	sw	zero,152(sp)
    57ac:	08012e23          	sw	zero,156(sp)
    57b0:	19d060ef          	jal	c14c <__letf2>
    57b4:	00055a63          	bgez	a0,57c8 <.L14>
    57b8:	02d00793          	li	a5,45
    57bc:	0af10823          	sb	a5,176(sp)
    57c0:	800007b7          	lui	a5,0x80000
    57c4:	0127c933          	xor	s2,a5,s2

000057c8 <.L14>:
    57c8:	0000d797          	auipc	a5,0xd
    57cc:	be878793          	add	a5,a5,-1048 # 123b0 <.LC4>
    57d0:	0007a603          	lw	a2,0(a5)
    57d4:	0047a683          	lw	a3,4(a5)
    57d8:	0087a703          	lw	a4,8(a5)
    57dc:	00c7a783          	lw	a5,12(a5)
    57e0:	08010d13          	add	s10,sp,128
    57e4:	08c12023          	sw	a2,128(sp)
    57e8:	000b8593          	mv	a1,s7
    57ec:	000c0513          	mv	a0,s8
    57f0:	000d0613          	mv	a2,s10
    57f4:	08f12623          	sw	a5,140(sp)
    57f8:	09412823          	sw	s4,144(sp)
    57fc:	09512a23          	sw	s5,148(sp)
    5800:	09612c23          	sw	s6,152(sp)
    5804:	09212e23          	sw	s2,156(sp)
    5808:	08d12223          	sw	a3,132(sp)
    580c:	08e12423          	sw	a4,136(sp)
    5810:	26d060ef          	jal	c27c <__multf3>
    5814:	0a012783          	lw	a5,160(sp)
    5818:	000d0593          	mv	a1,s10
    581c:	000b8513          	mv	a0,s7
    5820:	08f12823          	sw	a5,144(sp)
    5824:	0a412783          	lw	a5,164(sp)
    5828:	09412023          	sw	s4,128(sp)
    582c:	09512223          	sw	s5,132(sp)
    5830:	08f12a23          	sw	a5,148(sp)
    5834:	0a812783          	lw	a5,168(sp)
    5838:	09612423          	sw	s6,136(sp)
    583c:	09212623          	sw	s2,140(sp)
    5840:	08f12c23          	sw	a5,152(sp)
    5844:	0ac12783          	lw	a5,172(sp)
    5848:	08f12e23          	sw	a5,156(sp)
    584c:	704060ef          	jal	bf50 <__eqtf2>
    5850:	b0050ce3          	beqz	a0,5368 <.L9>
    5854:	06100793          	li	a5,97
    5858:	2afc9063          	bne	s9,a5,5af8 <.L68>
    585c:	01d00793          	li	a5,29
    5860:	02f12623          	sw	a5,44(sp)
    5864:	00800793          	li	a5,8
    5868:	0000d717          	auipc	a4,0xd
    586c:	b0870713          	add	a4,a4,-1272 # 12370 <.LC0>
    5870:	02f12423          	sw	a5,40(sp)
    5874:	01000793          	li	a5,16
    5878:	00f12623          	sw	a5,12(sp)
    587c:	00072783          	lw	a5,0(a4)
    5880:	00700c13          	li	s8,7
    5884:	0000c317          	auipc	t1,0xc
    5888:	18c30313          	add	t1,t1,396 # 11a10 <exp16_table>
    588c:	00f12c23          	sw	a5,24(sp)
    5890:	00472783          	lw	a5,4(a4)
    5894:	00f12e23          	sw	a5,28(sp)
    5898:	00872783          	lw	a5,8(a4)
    589c:	02f12023          	sw	a5,32(sp)
    58a0:	00c72783          	lw	a5,12(a4)
    58a4:	0000d717          	auipc	a4,0xd
    58a8:	adc70713          	add	a4,a4,-1316 # 12380 <.LC1>
    58ac:	02f12223          	sw	a5,36(sp)

000058b0 <.L119>:
    58b0:	00072783          	lw	a5,0(a4)
    58b4:	0c030e13          	add	t3,t1,192
    58b8:	000a0c93          	mv	s9,s4
    58bc:	02f12e23          	sw	a5,60(sp)
    58c0:	00472783          	lw	a5,4(a4)
    58c4:	000a8d13          	mv	s10,s5
    58c8:	000b0d93          	mv	s11,s6
    58cc:	04f12023          	sw	a5,64(sp)
    58d0:	00872783          	lw	a5,8(a4)
    58d4:	00090b93          	mv	s7,s2
    58d8:	04f12223          	sw	a5,68(sp)
    58dc:	00c72783          	lw	a5,12(a4)
    58e0:	04f12423          	sw	a5,72(sp)
    58e4:	000017b7          	lui	a5,0x1
    58e8:	02f12823          	sw	a5,48(sp)
    58ec:	0a010793          	add	a5,sp,160
    58f0:	00f12823          	sw	a5,16(sp)
    58f4:	09010793          	add	a5,sp,144
    58f8:	00f12a23          	sw	a5,20(sp)
    58fc:	08010793          	add	a5,sp,128
    5900:	04f12623          	sw	a5,76(sp)

00005904 <.L26>:
    5904:	03c12783          	lw	a5,60(sp)
    5908:	000e2f83          	lw	t6,0(t3)
    590c:	004e2f03          	lw	t5,4(t3)
    5910:	008e2e83          	lw	t4,8(t3)
    5914:	00ce2603          	lw	a2,12(t3)
    5918:	08f12823          	sw	a5,144(sp)
    591c:	04012783          	lw	a5,64(sp)
    5920:	01412583          	lw	a1,20(sp)
    5924:	01012503          	lw	a0,16(sp)
    5928:	08f12a23          	sw	a5,148(sp)
    592c:	04412783          	lw	a5,68(sp)
    5930:	06612623          	sw	t1,108(sp)
    5934:	07f12423          	sw	t6,104(sp)
    5938:	08f12c23          	sw	a5,152(sp)
    593c:	04812783          	lw	a5,72(sp)
    5940:	07e12223          	sw	t5,100(sp)
    5944:	07d12023          	sw	t4,96(sp)
    5948:	05c12e23          	sw	t3,92(sp)
    594c:	04c12c23          	sw	a2,88(sp)
    5950:	0b412023          	sw	s4,160(sp)
    5954:	0b512223          	sw	s5,164(sp)
    5958:	0b612423          	sw	s6,168(sp)
    595c:	0b212623          	sw	s2,172(sp)
    5960:	08f12e23          	sw	a5,156(sp)
    5964:	7e8060ef          	jal	c14c <__letf2>
    5968:	05812603          	lw	a2,88(sp)
    596c:	06812f83          	lw	t6,104(sp)
    5970:	06c12303          	lw	t1,108(sp)
    5974:	05c12e03          	lw	t3,92(sp)
    5978:	06012e83          	lw	t4,96(sp)
    597c:	06412f03          	lw	t5,100(sp)
    5980:	08c12623          	sw	a2,140(sp)
    5984:	07c12623          	sw	t3,108(sp)
    5988:	06612423          	sw	t1,104(sp)
    598c:	09912823          	sw	s9,144(sp)
    5990:	09a12a23          	sw	s10,148(sp)
    5994:	09b12c23          	sw	s11,152(sp)
    5998:	09712e23          	sw	s7,156(sp)
    599c:	09f12023          	sw	t6,128(sp)
    59a0:	09e12223          	sw	t5,132(sp)
    59a4:	09d12423          	sw	t4,136(sp)
    59a8:	04c12603          	lw	a2,76(sp)
    59ac:	01412583          	lw	a1,20(sp)
    59b0:	1a055463          	bgez	a0,5b58 <.L116>
    59b4:	01012503          	lw	a0,16(sp)
    59b8:	0c5060ef          	jal	c27c <__multf3>
    59bc:	01812783          	lw	a5,24(sp)
    59c0:	0a012f83          	lw	t6,160(sp)
    59c4:	0a412f03          	lw	t5,164(sp)
    59c8:	08f12823          	sw	a5,144(sp)
    59cc:	01c12783          	lw	a5,28(sp)
    59d0:	0a812e83          	lw	t4,168(sp)
    59d4:	0ac12603          	lw	a2,172(sp)
    59d8:	08f12a23          	sw	a5,148(sp)
    59dc:	02012783          	lw	a5,32(sp)
    59e0:	01412583          	lw	a1,20(sp)
    59e4:	01012503          	lw	a0,16(sp)
    59e8:	08f12c23          	sw	a5,152(sp)
    59ec:	02412783          	lw	a5,36(sp)
    59f0:	07f12223          	sw	t6,100(sp)
    59f4:	07e12023          	sw	t5,96(sp)
    59f8:	05d12e23          	sw	t4,92(sp)
    59fc:	04c12c23          	sw	a2,88(sp)
    5a00:	08f12e23          	sw	a5,156(sp)
    5a04:	748060ef          	jal	c14c <__letf2>
    5a08:	06812303          	lw	t1,104(sp)
    5a0c:	06c12e03          	lw	t3,108(sp)
    5a10:	02055663          	bgez	a0,5a3c <.L23>
    5a14:	03012783          	lw	a5,48(sp)
    5a18:	40fc0c33          	sub	s8,s8,a5

00005a1c <.L120>:
    5a1c:	06412f83          	lw	t6,100(sp)
    5a20:	06012f03          	lw	t5,96(sp)
    5a24:	05c12e83          	lw	t4,92(sp)
    5a28:	05812603          	lw	a2,88(sp)
    5a2c:	000f8c93          	mv	s9,t6
    5a30:	000f0d13          	mv	s10,t5
    5a34:	000e8d93          	mv	s11,t4
    5a38:	00060b93          	mv	s7,a2

00005a3c <.L23>:
    5a3c:	03012783          	lw	a5,48(sp)
    5a40:	ff0e0613          	add	a2,t3,-16
    5a44:	4017d793          	sra	a5,a5,0x1
    5a48:	02f12823          	sw	a5,48(sp)
    5a4c:	11c31263          	bne	t1,t3,5b50 <.L69>
    5a50:	01812783          	lw	a5,24(sp)
    5a54:	0a010913          	add	s2,sp,160
    5a58:	09010593          	add	a1,sp,144
    5a5c:	08f12823          	sw	a5,144(sp)
    5a60:	01c12783          	lw	a5,28(sp)
    5a64:	00090513          	mv	a0,s2
    5a68:	00612a23          	sw	t1,20(sp)
    5a6c:	08f12a23          	sw	a5,148(sp)
    5a70:	02012783          	lw	a5,32(sp)
    5a74:	0b912023          	sw	s9,160(sp)
    5a78:	0ba12223          	sw	s10,164(sp)
    5a7c:	08f12c23          	sw	a5,152(sp)
    5a80:	02412783          	lw	a5,36(sp)
    5a84:	0bb12423          	sw	s11,168(sp)
    5a88:	0b712623          	sw	s7,172(sp)
    5a8c:	08f12e23          	sw	a5,156(sp)
    5a90:	00b12823          	sw	a1,16(sp)
    5a94:	588060ef          	jal	c01c <__getf2>
    5a98:	b00540e3          	bltz	a0,5598 <.L13>
    5a9c:	01412303          	lw	t1,20(sp)
    5aa0:	09912823          	sw	s9,144(sp)
    5aa4:	09a12a23          	sw	s10,148(sp)
    5aa8:	09b12c23          	sw	s11,152(sp)
    5aac:	09712e23          	sw	s7,156(sp)
    5ab0:	00032703          	lw	a4,0(t1)
    5ab4:	01012583          	lw	a1,16(sp)
    5ab8:	08010613          	add	a2,sp,128
    5abc:	08e12023          	sw	a4,128(sp)
    5ac0:	00432703          	lw	a4,4(t1)
    5ac4:	00090513          	mv	a0,s2
    5ac8:	001c0c13          	add	s8,s8,1
    5acc:	08e12223          	sw	a4,132(sp)
    5ad0:	00832703          	lw	a4,8(t1)
    5ad4:	08e12423          	sw	a4,136(sp)
    5ad8:	00c32703          	lw	a4,12(t1)
    5adc:	08e12623          	sw	a4,140(sp)
    5ae0:	6dc050ef          	jal	b1bc <__divtf3>
    5ae4:	0a012c83          	lw	s9,160(sp)
    5ae8:	0a412d03          	lw	s10,164(sp)
    5aec:	0a812d83          	lw	s11,168(sp)
    5af0:	0ac12b83          	lw	s7,172(sp)
    5af4:	aa5ff06f          	j	5598 <.L13>

00005af8 <.L68>:
    5af8:	02400793          	li	a5,36
    5afc:	02f12623          	sw	a5,44(sp)
    5b00:	00900793          	li	a5,9
    5b04:	0000d717          	auipc	a4,0xd
    5b08:	88c70713          	add	a4,a4,-1908 # 12390 <.LC2>
    5b0c:	02f12423          	sw	a5,40(sp)
    5b10:	00a00793          	li	a5,10
    5b14:	00f12623          	sw	a5,12(sp)
    5b18:	00072783          	lw	a5,0(a4)
    5b1c:	00800c13          	li	s8,8
    5b20:	0000c317          	auipc	t1,0xc
    5b24:	fc030313          	add	t1,t1,-64 # 11ae0 <exp10_table>
    5b28:	00f12c23          	sw	a5,24(sp)
    5b2c:	00472783          	lw	a5,4(a4)
    5b30:	00f12e23          	sw	a5,28(sp)
    5b34:	00872783          	lw	a5,8(a4)
    5b38:	02f12023          	sw	a5,32(sp)
    5b3c:	00c72783          	lw	a5,12(a4)
    5b40:	0000d717          	auipc	a4,0xd
    5b44:	86070713          	add	a4,a4,-1952 # 123a0 <.LC3>
    5b48:	02f12223          	sw	a5,36(sp)
    5b4c:	d65ff06f          	j	58b0 <.L119>

00005b50 <.L69>:
    5b50:	00060e13          	mv	t3,a2
    5b54:	db1ff06f          	j	5904 <.L26>

00005b58 <.L116>:
    5b58:	01012503          	lw	a0,16(sp)
    5b5c:	660050ef          	jal	b1bc <__divtf3>
    5b60:	03c12783          	lw	a5,60(sp)
    5b64:	0a012f83          	lw	t6,160(sp)
    5b68:	0a412f03          	lw	t5,164(sp)
    5b6c:	08f12823          	sw	a5,144(sp)
    5b70:	04012783          	lw	a5,64(sp)
    5b74:	0a812e83          	lw	t4,168(sp)
    5b78:	0ac12603          	lw	a2,172(sp)
    5b7c:	08f12a23          	sw	a5,148(sp)
    5b80:	04412783          	lw	a5,68(sp)
    5b84:	01412583          	lw	a1,20(sp)
    5b88:	01012503          	lw	a0,16(sp)
    5b8c:	08f12c23          	sw	a5,152(sp)
    5b90:	04812783          	lw	a5,72(sp)
    5b94:	07f12223          	sw	t6,100(sp)
    5b98:	07e12023          	sw	t5,96(sp)
    5b9c:	05d12e23          	sw	t4,92(sp)
    5ba0:	04c12c23          	sw	a2,88(sp)
    5ba4:	08f12e23          	sw	a5,156(sp)
    5ba8:	474060ef          	jal	c01c <__getf2>
    5bac:	06812303          	lw	t1,104(sp)
    5bb0:	06c12e03          	lw	t3,108(sp)
    5bb4:	e80544e3          	bltz	a0,5a3c <.L23>
    5bb8:	03012783          	lw	a5,48(sp)
    5bbc:	00fc0c33          	add	s8,s8,a5
    5bc0:	e5dff06f          	j	5a1c <.L120>

00005bc4 <.L31>:
    5bc4:	06600713          	li	a4,102
    5bc8:	00048693          	mv	a3,s1
    5bcc:	b0e410e3          	bne	s0,a4,56cc <.L32>
    5bd0:	009c06b3          	add	a3,s8,s1
    5bd4:	fff00713          	li	a4,-1
    5bd8:	aee6dae3          	bge	a3,a4,56cc <.L32>
    5bdc:	02400613          	li	a2,36
    5be0:	03000593          	li	a1,48
    5be4:	0c810513          	add	a0,sp,200
    5be8:	9b0fd0ef          	jal	2d98 <__GI_memset>
    5bec:	fff00c13          	li	s8,-1
    5bf0:	fff00693          	li	a3,-1
    5bf4:	ad9ff06f          	j	56cc <.L32>

00005bf8 <.L33>:
    5bf8:	00c12783          	lw	a5,12(sp)
    5bfc:	00268613          	add	a2,a3,2
    5c00:	00c50633          	add	a2,a0,a2
    5c04:	00064583          	lbu	a1,0(a2)
    5c08:	0017d713          	srl	a4,a5,0x1
    5c0c:	03070713          	add	a4,a4,48
    5c10:	00e5b5b3          	sltu	a1,a1,a4
    5c14:	0015b593          	seqz	a1,a1
    5c18:	ad5ff06f          	j	56ec <.L34>

00005c1c <.L40>:
    5c1c:	00e8f663          	bgeu	a7,a4,5c28 <.L39>
    5c20:	00b70733          	add	a4,a4,a1
    5c24:	00e80023          	sb	a4,0(a6)

00005c28 <.L39>:
    5c28:	fff80813          	add	a6,a6,-1
    5c2c:	b09ff06f          	j	5734 <.L38>

00005c30 <.L41>:
    5c30:	002c1c13          	sll	s8,s8,0x2

00005c34 <.L121>:
    5c34:	0ca10713          	add	a4,sp,202
    5c38:	b15ff06f          	j	574c <.L42>

00005c3c <.L37>:
    5c3c:	b0c572e3          	bgeu	a0,a2,5740 <.L43>
    5c40:	ff5ff06f          	j	5c34 <.L121>

00005c44 <.L44>:
    5c44:	06600693          	li	a3,102
    5c48:	b2d400e3          	beq	s0,a3,5768 <.L46>
    5c4c:	00040593          	mv	a1,s0
    5c50:	0080006f          	j	5c58 <.L122>

00005c54 <.L73>:
    5c54:	06700593          	li	a1,103

00005c58 <.L122>:
    5c58:	00000693          	li	a3,0

00005c5c <.L45>:
    5c5c:	00074883          	lbu	a7,0(a4)
    5c60:	00100513          	li	a0,1
    5c64:	0b000813          	li	a6,176
    5c68:	10a12023          	sw	a0,256(sp)
    5c6c:	0b410513          	add	a0,sp,180
    5c70:	10a12223          	sw	a0,260(sp)
    5c74:	0f012e23          	sw	a6,252(sp)
    5c78:	0b110a23          	sb	a7,180(sp)
    5c7c:	0a010aa3          	sb	zero,181(sp)
    5c80:	00170513          	add	a0,a4,1
    5c84:	10810913          	add	s2,sp,264
    5c88:	40e60733          	sub	a4,a2,a4
    5c8c:	0406c063          	bltz	a3,5ccc <.L47>
    5c90:	07000613          	li	a2,112
    5c94:	10c12423          	sw	a2,264(sp)
    5c98:	10a12823          	sw	a0,272(sp)
    5c9c:	16e6c863          	blt	a3,a4,5e0c <.L48>
    5ca0:	10e12623          	sw	a4,268(sp)
    5ca4:	40e68733          	sub	a4,a3,a4
    5ca8:	16070a63          	beqz	a4,5e1c <.L77>
    5cac:	10e12c23          	sw	a4,280(sp)
    5cb0:	0000c717          	auipc	a4,0xc
    5cb4:	f0370713          	add	a4,a4,-253 # 11bb3 <fmt+0x3>
    5cb8:	10e12e23          	sw	a4,284(sp)
    5cbc:	11012a23          	sw	a6,276(sp)
    5cc0:	00000713          	li	a4,0
    5cc4:	12010913          	add	s2,sp,288

00005cc8 <.L78>:
    5cc8:	fff00693          	li	a3,-1

00005ccc <.L47>:
    5ccc:	00c9a603          	lw	a2,12(s3)
    5cd0:	01067613          	and	a2,a2,16
    5cd4:	00c76833          	or	a6,a4,a2
    5cd8:	00081c63          	bnez	a6,5cf0 <.L49>
    5cdc:	06700813          	li	a6,103
    5ce0:	03040863          	beq	s0,a6,5d10 <.L50>
    5ce4:	06100813          	li	a6,97
    5ce8:	03040463          	beq	s0,a6,5d10 <.L50>
    5cec:	02048263          	beqz	s1,5d10 <.L50>

00005cf0 <.L49>:
    5cf0:	07000813          	li	a6,112
    5cf4:	01092023          	sw	a6,0(s2)
    5cf8:	00100813          	li	a6,1
    5cfc:	01092223          	sw	a6,4(s2)
    5d00:	0000c817          	auipc	a6,0xc
    5d04:	ec080813          	add	a6,a6,-320 # 11bc0 <.LLST0+0x9>
    5d08:	01092423          	sw	a6,8(s2)
    5d0c:	00c90913          	add	s2,s2,12

00005d10 <.L50>:
    5d10:	00168813          	add	a6,a3,1
    5d14:	02080263          	beqz	a6,5d38 <.L51>
    5d18:	fff6c693          	not	a3,a3
    5d1c:	00d92223          	sw	a3,4(s2)
    5d20:	0b000893          	li	a7,176
    5d24:	0000c697          	auipc	a3,0xc
    5d28:	e8f68693          	add	a3,a3,-369 # 11bb3 <fmt+0x3>
    5d2c:	01192023          	sw	a7,0(s2)
    5d30:	00d92423          	sw	a3,8(s2)
    5d34:	00c90913          	add	s2,s2,12

00005d38 <.L51>:
    5d38:	00070c63          	beqz	a4,5d50 <.L52>
    5d3c:	07000693          	li	a3,112
    5d40:	00d92023          	sw	a3,0(s2)
    5d44:	00e92223          	sw	a4,4(s2)
    5d48:	00a92423          	sw	a0,8(s2)
    5d4c:	00c90913          	add	s2,s2,12

00005d50 <.L52>:
    5d50:	06700693          	li	a3,103
    5d54:	00d41463          	bne	s0,a3,5d5c <.L53>
    5d58:	02060a63          	beqz	a2,5d8c <.L54>

00005d5c <.L53>:
    5d5c:	03412783          	lw	a5,52(sp)
    5d60:	02079663          	bnez	a5,5d8c <.L54>
    5d64:	41070733          	sub	a4,a4,a6
    5d68:	02975263          	bge	a4,s1,5d8c <.L54>
    5d6c:	40e484b3          	sub	s1,s1,a4
    5d70:	0b000693          	li	a3,176
    5d74:	0000c717          	auipc	a4,0xc
    5d78:	e3f70713          	add	a4,a4,-449 # 11bb3 <fmt+0x3>
    5d7c:	00d92023          	sw	a3,0(s2)
    5d80:	00992223          	sw	s1,4(s2)
    5d84:	00e92423          	sw	a4,8(s2)
    5d88:	00c90913          	add	s2,s2,12

00005d8c <.L54>:
    5d8c:	06600713          	li	a4,102
    5d90:	e2e58063          	beq	a1,a4,53b0 <.L19>
    5d94:	06100713          	li	a4,97
    5d98:	0b814e03          	lbu	t3,184(sp)
    5d9c:	00300893          	li	a7,3
    5da0:	00e40463          	beq	s0,a4,5da8 <.L55>
    5da4:	00400893          	li	a7,4

00005da8 <.L55>:
    5da8:	02b00813          	li	a6,43
    5dac:	000c5663          	bgez	s8,5db8 <.L56>
    5db0:	41800c33          	neg	s8,s8
    5db4:	02d00813          	li	a6,45

00005db8 <.L56>:
    5db8:	0c0103a3          	sb	zero,199(sp)
    5dbc:	00200693          	li	a3,2
    5dc0:	0c710713          	add	a4,sp,199
    5dc4:	00a00313          	li	t1,10

00005dc8 <.L57>:
    5dc8:	026c6533          	rem	a0,s8,t1
    5dcc:	00168693          	add	a3,a3,1
    5dd0:	fff70613          	add	a2,a4,-1
    5dd4:	03050513          	add	a0,a0,48
    5dd8:	fea70fa3          	sb	a0,-1(a4)
    5ddc:	026c4c33          	div	s8,s8,t1
    5de0:	0516c263          	blt	a3,a7,5e24 <.L81>
    5de4:	040c1263          	bnez	s8,5e28 <.L58>
    5de8:	07000793          	li	a5,112
    5dec:	ffd70713          	add	a4,a4,-3
    5df0:	00f92023          	sw	a5,0(s2)
    5df4:	00d92223          	sw	a3,4(s2)
    5df8:	00e92423          	sw	a4,8(s2)
    5dfc:	ff060fa3          	sb	a6,-1(a2)
    5e00:	ffc60f23          	sb	t3,-2(a2)
    5e04:	00c90913          	add	s2,s2,12
    5e08:	da8ff06f          	j	53b0 <.L19>

00005e0c <.L48>:
    5e0c:	ea068ee3          	beqz	a3,5cc8 <.L78>
    5e10:	10d12623          	sw	a3,268(sp)
    5e14:	00d50533          	add	a0,a0,a3
    5e18:	40d70733          	sub	a4,a4,a3

00005e1c <.L77>:
    5e1c:	11410913          	add	s2,sp,276
    5e20:	ea9ff06f          	j	5cc8 <.L78>

00005e24 <.L81>:
    5e24:	00300693          	li	a3,3

00005e28 <.L58>:
    5e28:	00060713          	mv	a4,a2
    5e2c:	f9dff06f          	j	5dc8 <.L57>

00005e30 <.L62>:
    5e30:	0109a603          	lw	a2,16(s3)
    5e34:	03000693          	li	a3,48
    5e38:	0f412703          	lw	a4,244(sp)
    5e3c:	00d61a63          	bne	a2,a3,5e50 <.L64>
    5e40:	10012703          	lw	a4,256(sp)
    5e44:	00f707b3          	add	a5,a4,a5
    5e48:	10f12023          	sw	a5,256(sp)
    5e4c:	e10ff06f          	j	545c <.L63>

00005e50 <.L64>:
    5e50:	00e787b3          	add	a5,a5,a4
    5e54:	0ef12a23          	sw	a5,244(sp)
    5e58:	e04ff06f          	j	545c <.L63>

00005e5c <.L82>:
    5e5c:	fff00493          	li	s1,-1
    5e60:	e30ff06f          	j	5490 <.L1>

00005e64 <__GI_fflush>:
    5e64:	ff010113          	add	sp,sp,-16
    5e68:	00112623          	sw	ra,12(sp)
    5e6c:	00812423          	sw	s0,8(sp)
    5e70:	00912223          	sw	s1,4(sp)
    5e74:	01212023          	sw	s2,0(sp)
    5e78:	0000a797          	auipc	a5,0xa
    5e7c:	76c7a783          	lw	a5,1900(a5) # 105e4 <_GLOBAL_OFFSET_TABLE_+0x1c>
    5e80:	04f50263          	beq	a0,a5,5ec4 <.L11>
    5e84:	00050413          	mv	s0,a0
    5e88:	10000913          	li	s2,256
    5e8c:	02050e63          	beqz	a0,5ec8 <.L2>
    5e90:	00055783          	lhu	a5,0(a0)
    5e94:	0407f793          	and	a5,a5,64
    5e98:	02078263          	beqz	a5,5ebc <.L10>
    5e9c:	afdfb0ef          	jal	1998 <__stdio_wcommit>
    5ea0:	fff00493          	li	s1,-1
    5ea4:	02051863          	bnez	a0,5ed4 <.L1>
    5ea8:	00842783          	lw	a5,8(s0)
    5eac:	00f42e23          	sw	a5,28(s0)
    5eb0:	00045783          	lhu	a5,0(s0)
    5eb4:	fbf7f793          	and	a5,a5,-65
    5eb8:	00f41023          	sh	a5,0(s0)

00005ebc <.L10>:
    5ebc:	00000493          	li	s1,0
    5ec0:	0140006f          	j	5ed4 <.L1>

00005ec4 <.L11>:
    5ec4:	00000913          	li	s2,0

00005ec8 <.L2>:
    5ec8:	0007a403          	lw	s0,0(a5)
    5ecc:	00000493          	li	s1,0

00005ed0 <.L4>:
    5ed0:	02041063          	bnez	s0,5ef0 <.L8>

00005ed4 <.L1>:
    5ed4:	00c12083          	lw	ra,12(sp)
    5ed8:	00812403          	lw	s0,8(sp)
    5edc:	00012903          	lw	s2,0(sp)
    5ee0:	00048513          	mv	a0,s1
    5ee4:	00412483          	lw	s1,4(sp)
    5ee8:	01010113          	add	sp,sp,16
    5eec:	00008067          	ret

00005ef0 <.L8>:
    5ef0:	00045783          	lhu	a5,0(s0)
    5ef4:	0407f713          	and	a4,a5,64
    5ef8:	02070a63          	beqz	a4,5f2c <.L7>
    5efc:	0127e7b3          	or	a5,a5,s2
    5f00:	1407c793          	xor	a5,a5,320
    5f04:	3407f793          	and	a5,a5,832
    5f08:	02079263          	bnez	a5,5f2c <.L7>
    5f0c:	00040513          	mv	a0,s0
    5f10:	a89fb0ef          	jal	1998 <__stdio_wcommit>
    5f14:	02051063          	bnez	a0,5f34 <.L12>
    5f18:	00842783          	lw	a5,8(s0)
    5f1c:	00f42e23          	sw	a5,28(s0)
    5f20:	00045783          	lhu	a5,0(s0)
    5f24:	fbf7f793          	and	a5,a5,-65
    5f28:	00f41023          	sh	a5,0(s0)

00005f2c <.L7>:
    5f2c:	02042403          	lw	s0,32(s0)
    5f30:	fa1ff06f          	j	5ed0 <.L4>

00005f34 <.L12>:
    5f34:	fff00493          	li	s1,-1
    5f38:	ff5ff06f          	j	5f2c <.L7>

00005f3c <__GI___fgetc_unlocked>:
    5f3c:	01052783          	lw	a5,16(a0)
    5f40:	01852703          	lw	a4,24(a0)
    5f44:	fe010113          	add	sp,sp,-32
    5f48:	00812c23          	sw	s0,24(sp)
    5f4c:	00112e23          	sw	ra,28(sp)
    5f50:	00050413          	mv	s0,a0
    5f54:	00e7fa63          	bgeu	a5,a4,5f68 <.L2>

00005f58 <.L29>:
    5f58:	00178713          	add	a4,a5,1
    5f5c:	00e42823          	sw	a4,16(s0)
    5f60:	0007c503          	lbu	a0,0(a5)
    5f64:	0340006f          	j	5f98 <.L1>

00005f68 <.L2>:
    5f68:	00055783          	lhu	a5,0(a0)
    5f6c:	0037f793          	and	a5,a5,3
    5f70:	02078c63          	beqz	a5,5fa8 <.L4>

00005f74 <.L7>:
    5f74:	00045783          	lhu	a5,0(s0)
    5f78:	0027f713          	and	a4,a5,2
    5f7c:	02070e63          	beqz	a4,5fb8 <.L27>
    5f80:	fff78713          	add	a4,a5,-1
    5f84:	0017f793          	and	a5,a5,1
    5f88:	00e41023          	sh	a4,0(s0)
    5f8c:	00f407b3          	add	a5,s0,a5
    5f90:	0027c503          	lbu	a0,2(a5)
    5f94:	000401a3          	sb	zero,3(s0)

00005f98 <.L1>:
    5f98:	01c12083          	lw	ra,28(sp)
    5f9c:	01812403          	lw	s0,24(sp)
    5fa0:	02010113          	add	sp,sp,32
    5fa4:	00008067          	ret

00005fa8 <.L4>:
    5fa8:	009010ef          	jal	77b0 <__stdio_trans2r>
    5fac:	fc0504e3          	beqz	a0,5f74 <.L7>

00005fb0 <.L8>:
    5fb0:	fff00513          	li	a0,-1
    5fb4:	fe5ff06f          	j	5f98 <.L1>

00005fb8 <.L27>:
    5fb8:	01042703          	lw	a4,16(s0)
    5fbc:	01442683          	lw	a3,20(s0)
    5fc0:	00e68a63          	beq	a3,a4,5fd4 <.L9>
    5fc4:	00170793          	add	a5,a4,1
    5fc8:	00f42823          	sw	a5,16(s0)
    5fcc:	00074503          	lbu	a0,0(a4)
    5fd0:	fc9ff06f          	j	5f98 <.L1>

00005fd4 <.L9>:
    5fd4:	00442683          	lw	a3,4(s0)
    5fd8:	ffd00713          	li	a4,-3
    5fdc:	00e69863          	bne	a3,a4,5fec <.L10>
    5fe0:	0047e793          	or	a5,a5,4
    5fe4:	00f41023          	sh	a5,0(s0)
    5fe8:	fc9ff06f          	j	5fb0 <.L8>

00005fec <.L10>:
    5fec:	3007f793          	and	a5,a5,768
    5ff0:	00078863          	beqz	a5,6000 <.L11>
    5ff4:	0000a517          	auipc	a0,0xa
    5ff8:	5f052503          	lw	a0,1520(a0) # 105e4 <_GLOBAL_OFFSET_TABLE_+0x1c>
    5ffc:	e69ff0ef          	jal	5e64 <__GI_fflush>

00006000 <.L11>:
    6000:	00842783          	lw	a5,8(s0)
    6004:	00c42703          	lw	a4,12(s0)
    6008:	02f70263          	beq	a4,a5,602c <.L12>
    600c:	00f42c23          	sw	a5,24(s0)
    6010:	00040513          	mv	a0,s0
    6014:	75c010ef          	jal	7770 <__stdio_rfill>
    6018:	f8050ce3          	beqz	a0,5fb0 <.L8>
    601c:	01442783          	lw	a5,20(s0)
    6020:	00f42c23          	sw	a5,24(s0)
    6024:	01042783          	lw	a5,16(s0)
    6028:	f31ff06f          	j	5f58 <.L29>

0000602c <.L12>:
    602c:	00100613          	li	a2,1
    6030:	00f10593          	add	a1,sp,15
    6034:	00040513          	mv	a0,s0
    6038:	614010ef          	jal	764c <__stdio_READ>
    603c:	f6050ae3          	beqz	a0,5fb0 <.L8>
    6040:	00f14503          	lbu	a0,15(sp)
    6044:	f55ff06f          	j	5f98 <.L1>

00006048 <__GI_fgets>:
    6048:	fe010113          	add	sp,sp,-32
    604c:	00112e23          	sw	ra,28(sp)
    6050:	00812c23          	sw	s0,24(sp)
    6054:	00912a23          	sw	s1,20(sp)
    6058:	01212823          	sw	s2,16(sp)
    605c:	01312623          	sw	s3,12(sp)
    6060:	01412423          	sw	s4,8(sp)
    6064:	01512223          	sw	s5,4(sp)
    6068:	01612023          	sw	s6,0(sp)
    606c:	02b04a63          	bgtz	a1,60a0 <.L2>

00006070 <.L9>:
    6070:	00000493          	li	s1,0

00006074 <.L3>:
    6074:	01c12083          	lw	ra,28(sp)
    6078:	01812403          	lw	s0,24(sp)
    607c:	01012903          	lw	s2,16(sp)
    6080:	00c12983          	lw	s3,12(sp)
    6084:	00812a03          	lw	s4,8(sp)
    6088:	00412a83          	lw	s5,4(sp)
    608c:	00012b03          	lw	s6,0(sp)
    6090:	00048513          	mv	a0,s1
    6094:	01412483          	lw	s1,20(sp)
    6098:	02010113          	add	sp,sp,32
    609c:	00008067          	ret

000060a0 <.L2>:
    60a0:	00050493          	mv	s1,a0
    60a4:	00060913          	mv	s2,a2
    60a8:	00150413          	add	s0,a0,1
    60ac:	00b509b3          	add	s3,a0,a1
    60b0:	fff00b13          	li	s6,-1
    60b4:	00a00a93          	li	s5,10

000060b8 <.L4>:
    60b8:	fff40a13          	add	s4,s0,-1
    60bc:	03340463          	beq	s0,s3,60e4 <.L6>
    60c0:	01092783          	lw	a5,16(s2)
    60c4:	01892703          	lw	a4,24(s2)
    60c8:	02e7f463          	bgeu	a5,a4,60f0 <.L5>
    60cc:	00178713          	add	a4,a5,1
    60d0:	00e92823          	sw	a4,16(s2)
    60d4:	0007c783          	lbu	a5,0(a5)
    60d8:	00040a13          	mv	s4,s0
    60dc:	fef40fa3          	sb	a5,-1(s0)
    60e0:	03579e63          	bne	a5,s5,611c <.L7>

000060e4 <.L6>:
    60e4:	f944f6e3          	bgeu	s1,s4,6070 <.L9>
    60e8:	000a0023          	sb	zero,0(s4)
    60ec:	f89ff06f          	j	6074 <.L3>

000060f0 <.L5>:
    60f0:	00090513          	mv	a0,s2
    60f4:	e49ff0ef          	jal	5f3c <__GI___fgetc_unlocked>
    60f8:	01651a63          	bne	a0,s6,610c <.L8>
    60fc:	00095783          	lhu	a5,0(s2)
    6100:	0087f793          	and	a5,a5,8
    6104:	fe0780e3          	beqz	a5,60e4 <.L6>
    6108:	f69ff06f          	j	6070 <.L9>

0000610c <.L8>:
    610c:	0ff57513          	zext.b	a0,a0
    6110:	fea40fa3          	sb	a0,-1(s0)
    6114:	00040a13          	mv	s4,s0
    6118:	fd5506e3          	beq	a0,s5,60e4 <.L6>

0000611c <.L7>:
    611c:	00140413          	add	s0,s0,1
    6120:	f99ff06f          	j	60b8 <.L4>

00006124 <__GI_memchr>:
    6124:	0ff5f793          	zext.b	a5,a1

00006128 <.L2>:
    6128:	00060663          	beqz	a2,6134 <.L4>
    612c:	00357713          	and	a4,a0,3
    6130:	02071c63          	bnez	a4,6168 <.L5>

00006134 <.L4>:
    6134:	01010737          	lui	a4,0x1010
    6138:	0ff5f593          	zext.b	a1,a1
    613c:	10170713          	add	a4,a4,257 # 1010101 <_ebss+0xff9dd1>
    6140:	02e585b3          	mul	a1,a1,a4
    6144:	7eff0837          	lui	a6,0x7eff0
    6148:	00300313          	li	t1,3
    614c:	eff80813          	add	a6,a6,-257 # 7efefeff <_ebss+0x7efd9bcf>
    6150:	fff00e13          	li	t3,-1

00006154 <.L6>:
    6154:	02c36463          	bltu	t1,a2,617c <.L10>
    6158:	00c50633          	add	a2,a0,a2

0000615c <.L11>:
    615c:	08c51063          	bne	a0,a2,61dc <.L12>
    6160:	00000513          	li	a0,0

00006164 <.L1>:
    6164:	00008067          	ret

00006168 <.L5>:
    6168:	00054703          	lbu	a4,0(a0)
    616c:	fef70ce3          	beq	a4,a5,6164 <.L1>
    6170:	fff60613          	add	a2,a2,-1
    6174:	00150513          	add	a0,a0,1
    6178:	fb1ff06f          	j	6128 <.L2>

0000617c <.L10>:
    617c:	00052883          	lw	a7,0(a0)
    6180:	00450713          	add	a4,a0,4
    6184:	0115c8b3          	xor	a7,a1,a7
    6188:	010886b3          	add	a3,a7,a6
    618c:	0116c6b3          	xor	a3,a3,a7
    6190:	0106e6b3          	or	a3,a3,a6
    6194:	03c68e63          	beq	a3,t3,61d0 <.L7>
    6198:	ffc74683          	lbu	a3,-4(a4)
    619c:	fcf684e3          	beq	a3,a5,6164 <.L1>
    61a0:	ffd74683          	lbu	a3,-3(a4)
    61a4:	00f69663          	bne	a3,a5,61b0 <.L8>
    61a8:	00150513          	add	a0,a0,1
    61ac:	00008067          	ret

000061b0 <.L8>:
    61b0:	ffe74683          	lbu	a3,-2(a4)
    61b4:	00f69663          	bne	a3,a5,61c0 <.L9>
    61b8:	00250513          	add	a0,a0,2
    61bc:	00008067          	ret

000061c0 <.L9>:
    61c0:	fff74683          	lbu	a3,-1(a4)
    61c4:	00f69663          	bne	a3,a5,61d0 <.L7>
    61c8:	00350513          	add	a0,a0,3
    61cc:	00008067          	ret

000061d0 <.L7>:
    61d0:	ffc60613          	add	a2,a2,-4
    61d4:	00070513          	mv	a0,a4
    61d8:	f7dff06f          	j	6154 <.L6>

000061dc <.L12>:
    61dc:	00054703          	lbu	a4,0(a0)
    61e0:	f8f702e3          	beq	a4,a5,6164 <.L1>
    61e4:	00150513          	add	a0,a0,1
    61e8:	f75ff06f          	j	615c <.L11>

000061ec <__GI_mempcpy>:
    61ec:	ff010113          	add	sp,sp,-16
    61f0:	00812423          	sw	s0,8(sp)
    61f4:	00912223          	sw	s1,4(sp)
    61f8:	00112623          	sw	ra,12(sp)
    61fc:	00050493          	mv	s1,a0
    6200:	00060413          	mv	s0,a2
    6204:	8edfc0ef          	jal	2af0 <__GI_memcpy>
    6208:	00848533          	add	a0,s1,s0
    620c:	00c12083          	lw	ra,12(sp)
    6210:	00812403          	lw	s0,8(sp)
    6214:	00412483          	lw	s1,4(sp)
    6218:	01010113          	add	sp,sp,16
    621c:	00008067          	ret

00006220 <__GI_memrchr>:
    6220:	0ff5f793          	zext.b	a5,a1
    6224:	00c50533          	add	a0,a0,a2

00006228 <.L2>:
    6228:	00060663          	beqz	a2,6234 <.L4>
    622c:	00357713          	and	a4,a0,3
    6230:	02071e63          	bnez	a4,626c <.L5>

00006234 <.L4>:
    6234:	01010737          	lui	a4,0x1010
    6238:	0ff5f593          	zext.b	a1,a1
    623c:	10170713          	add	a4,a4,257 # 1010101 <_ebss+0xff9dd1>
    6240:	02e585b3          	mul	a1,a1,a4
    6244:	7eff0837          	lui	a6,0x7eff0
    6248:	00050693          	mv	a3,a0
    624c:	00300313          	li	t1,3
    6250:	eff80813          	add	a6,a6,-257 # 7efefeff <_ebss+0x7efd9bcf>
    6254:	fff00e13          	li	t3,-1

00006258 <.L6>:
    6258:	02c36463          	bltu	t1,a2,6280 <.L11>
    625c:	40c50633          	sub	a2,a0,a2

00006260 <.L12>:
    6260:	08c51063          	bne	a0,a2,62e0 <.L13>
    6264:	00000513          	li	a0,0
    6268:	00008067          	ret

0000626c <.L5>:
    626c:	fff54703          	lbu	a4,-1(a0)
    6270:	fff50513          	add	a0,a0,-1
    6274:	06f70c63          	beq	a4,a5,62ec <.L1>
    6278:	fff60613          	add	a2,a2,-1
    627c:	fadff06f          	j	6228 <.L2>

00006280 <.L11>:
    6280:	ffc52883          	lw	a7,-4(a0)
    6284:	ffc50513          	add	a0,a0,-4
    6288:	0115c8b3          	xor	a7,a1,a7
    628c:	01088733          	add	a4,a7,a6
    6290:	01174733          	xor	a4,a4,a7
    6294:	01076733          	or	a4,a4,a6
    6298:	03c70e63          	beq	a4,t3,62d4 <.L7>
    629c:	00354703          	lbu	a4,3(a0)
    62a0:	00f71663          	bne	a4,a5,62ac <.L8>
    62a4:	fff68513          	add	a0,a3,-1
    62a8:	00008067          	ret

000062ac <.L8>:
    62ac:	00254703          	lbu	a4,2(a0)
    62b0:	00f71663          	bne	a4,a5,62bc <.L9>
    62b4:	ffe68513          	add	a0,a3,-2
    62b8:	00008067          	ret

000062bc <.L9>:
    62bc:	00154703          	lbu	a4,1(a0)
    62c0:	00f71663          	bne	a4,a5,62cc <.L10>
    62c4:	ffd68513          	add	a0,a3,-3
    62c8:	00008067          	ret

000062cc <.L10>:
    62cc:	00054703          	lbu	a4,0(a0)
    62d0:	00f70e63          	beq	a4,a5,62ec <.L1>

000062d4 <.L7>:
    62d4:	ffc60613          	add	a2,a2,-4
    62d8:	00050693          	mv	a3,a0
    62dc:	f7dff06f          	j	6258 <.L6>

000062e0 <.L13>:
    62e0:	fff54703          	lbu	a4,-1(a0)
    62e4:	fff50513          	add	a0,a0,-1
    62e8:	f6f71ce3          	bne	a4,a5,6260 <.L12>

000062ec <.L1>:
    62ec:	00008067          	ret

000062f0 <__GI_strchr>:
    62f0:	0ff5f693          	zext.b	a3,a1

000062f4 <.L2>:
    62f4:	00357793          	and	a5,a0,3
    62f8:	06079263          	bnez	a5,635c <.L4>
    62fc:	010107b7          	lui	a5,0x1010
    6300:	0ff5f593          	zext.b	a1,a1
    6304:	10178793          	add	a5,a5,257 # 1010101 <_ebss+0xff9dd1>
    6308:	02f585b3          	mul	a1,a1,a5
    630c:	7eff0637          	lui	a2,0x7eff0
    6310:	eff60613          	add	a2,a2,-257 # 7efefeff <_ebss+0x7efd9bcf>
    6314:	fff00313          	li	t1,-1

00006318 <.L5>:
    6318:	00052803          	lw	a6,0(a0)
    631c:	00450713          	add	a4,a0,4
    6320:	0105c8b3          	xor	a7,a1,a6
    6324:	00c807b3          	add	a5,a6,a2
    6328:	0107c7b3          	xor	a5,a5,a6
    632c:	00c88833          	add	a6,a7,a2
    6330:	01184833          	xor	a6,a6,a7
    6334:	0107f7b3          	and	a5,a5,a6
    6338:	00c7e7b3          	or	a5,a5,a2
    633c:	02678a63          	beq	a5,t1,6370 <.L6>
    6340:	ffc74783          	lbu	a5,-4(a4)
    6344:	06d78263          	beq	a5,a3,63a8 <.L1>
    6348:	04078e63          	beqz	a5,63a4 <.L13>
    634c:	ffd74783          	lbu	a5,-3(a4)
    6350:	02d79463          	bne	a5,a3,6378 <.L7>
    6354:	00150513          	add	a0,a0,1
    6358:	00008067          	ret

0000635c <.L4>:
    635c:	00054783          	lbu	a5,0(a0)
    6360:	04d78463          	beq	a5,a3,63a8 <.L1>
    6364:	04078063          	beqz	a5,63a4 <.L13>
    6368:	00150513          	add	a0,a0,1
    636c:	f89ff06f          	j	62f4 <.L2>

00006370 <.L6>:
    6370:	00070513          	mv	a0,a4
    6374:	fa5ff06f          	j	6318 <.L5>

00006378 <.L7>:
    6378:	02078663          	beqz	a5,63a4 <.L13>
    637c:	ffe74783          	lbu	a5,-2(a4)
    6380:	00d79663          	bne	a5,a3,638c <.L8>
    6384:	00250513          	add	a0,a0,2
    6388:	00008067          	ret

0000638c <.L8>:
    638c:	00078c63          	beqz	a5,63a4 <.L13>
    6390:	fff74783          	lbu	a5,-1(a4)
    6394:	00d79663          	bne	a5,a3,63a0 <.L9>
    6398:	00350513          	add	a0,a0,3
    639c:	00008067          	ret

000063a0 <.L9>:
    63a0:	fc0798e3          	bnez	a5,6370 <.L6>

000063a4 <.L13>:
    63a4:	00000513          	li	a0,0

000063a8 <.L1>:
    63a8:	00008067          	ret

000063ac <__GI_strchrnul>:
    63ac:	0ff5f693          	zext.b	a3,a1

000063b0 <.L2>:
    63b0:	00357793          	and	a5,a0,3
    63b4:	08079463          	bnez	a5,643c <.L4>
    63b8:	010107b7          	lui	a5,0x1010
    63bc:	0ff5f593          	zext.b	a1,a1
    63c0:	10178793          	add	a5,a5,257 # 1010101 <_ebss+0xff9dd1>
    63c4:	02f585b3          	mul	a1,a1,a5
    63c8:	7eff0637          	lui	a2,0x7eff0
    63cc:	eff60613          	add	a2,a2,-257 # 7efefeff <_ebss+0x7efd9bcf>
    63d0:	fff00313          	li	t1,-1

000063d4 <.L5>:
    63d4:	00052803          	lw	a6,0(a0)
    63d8:	00450793          	add	a5,a0,4
    63dc:	0105c8b3          	xor	a7,a1,a6
    63e0:	00c80733          	add	a4,a6,a2
    63e4:	01074733          	xor	a4,a4,a6
    63e8:	00c88833          	add	a6,a7,a2
    63ec:	01184833          	xor	a6,a6,a7
    63f0:	01077733          	and	a4,a4,a6
    63f4:	00c76733          	or	a4,a4,a2
    63f8:	04670c63          	beq	a4,t1,6450 <.L6>
    63fc:	ffc7c703          	lbu	a4,-4(a5)
    6400:	02d70c63          	beq	a4,a3,6438 <.L1>
    6404:	02070a63          	beqz	a4,6438 <.L1>
    6408:	ffd7c703          	lbu	a4,-3(a5)
    640c:	00150513          	add	a0,a0,1
    6410:	02d70463          	beq	a4,a3,6438 <.L1>
    6414:	02070263          	beqz	a4,6438 <.L1>
    6418:	ffe7c703          	lbu	a4,-2(a5)
    641c:	ffe78513          	add	a0,a5,-2
    6420:	00d70c63          	beq	a4,a3,6438 <.L1>
    6424:	00070a63          	beqz	a4,6438 <.L1>
    6428:	fff7c703          	lbu	a4,-1(a5)
    642c:	fff78513          	add	a0,a5,-1
    6430:	00d70463          	beq	a4,a3,6438 <.L1>
    6434:	00071e63          	bnez	a4,6450 <.L6>

00006438 <.L1>:
    6438:	00008067          	ret

0000643c <.L4>:
    643c:	00054783          	lbu	a5,0(a0)
    6440:	fed78ce3          	beq	a5,a3,6438 <.L1>
    6444:	fe078ae3          	beqz	a5,6438 <.L1>
    6448:	00150513          	add	a0,a0,1
    644c:	f65ff06f          	j	63b0 <.L2>

00006450 <.L6>:
    6450:	00078513          	mv	a0,a5
    6454:	f81ff06f          	j	63d4 <.L5>

00006458 <__GI_strcspn>:
    6458:	ff010113          	add	sp,sp,-16
    645c:	00812423          	sw	s0,8(sp)
    6460:	00912223          	sw	s1,4(sp)
    6464:	01212023          	sw	s2,0(sp)
    6468:	00112623          	sw	ra,12(sp)
    646c:	00050493          	mv	s1,a0
    6470:	00058913          	mv	s2,a1
    6474:	00000413          	li	s0,0

00006478 <.L2>:
    6478:	008487b3          	add	a5,s1,s0
    647c:	0007c583          	lbu	a1,0(a5)
    6480:	02059063          	bnez	a1,64a0 <.L4>

00006484 <.L1>:
    6484:	00c12083          	lw	ra,12(sp)
    6488:	00040513          	mv	a0,s0
    648c:	00812403          	lw	s0,8(sp)
    6490:	00412483          	lw	s1,4(sp)
    6494:	00012903          	lw	s2,0(sp)
    6498:	01010113          	add	sp,sp,16
    649c:	00008067          	ret

000064a0 <.L4>:
    64a0:	00090513          	mv	a0,s2
    64a4:	e4dff0ef          	jal	62f0 <__GI_strchr>
    64a8:	fc051ee3          	bnez	a0,6484 <.L1>
    64ac:	00140413          	add	s0,s0,1
    64b0:	fc9ff06f          	j	6478 <.L2>

000064b4 <__GI_strrchr>:
    64b4:	ff010113          	add	sp,sp,-16
    64b8:	00812423          	sw	s0,8(sp)
    64bc:	00112623          	sw	ra,12(sp)
    64c0:	00912223          	sw	s1,4(sp)
    64c4:	0ff5f413          	zext.b	s0,a1
    64c8:	04041663          	bnez	s0,6514 <.L6>
    64cc:	00812403          	lw	s0,8(sp)
    64d0:	00c12083          	lw	ra,12(sp)
    64d4:	00412483          	lw	s1,4(sp)
    64d8:	00000593          	li	a1,0
    64dc:	01010113          	add	sp,sp,16
    64e0:	e11ff06f          	j	62f0 <__GI_strchr>

000064e4 <.L3>:
    64e4:	00150793          	add	a5,a0,1
    64e8:	00050493          	mv	s1,a0

000064ec <.L2>:
    64ec:	00040593          	mv	a1,s0
    64f0:	00078513          	mv	a0,a5
    64f4:	dfdff0ef          	jal	62f0 <__GI_strchr>
    64f8:	fe0516e3          	bnez	a0,64e4 <.L3>
    64fc:	00c12083          	lw	ra,12(sp)
    6500:	00812403          	lw	s0,8(sp)
    6504:	00048513          	mv	a0,s1
    6508:	00412483          	lw	s1,4(sp)
    650c:	01010113          	add	sp,sp,16
    6510:	00008067          	ret

00006514 <.L6>:
    6514:	00050793          	mv	a5,a0
    6518:	00000493          	li	s1,0
    651c:	fd1ff06f          	j	64ec <.L2>

00006520 <__GI_strspn>:
    6520:	00050793          	mv	a5,a0
    6524:	00000513          	li	a0,0

00006528 <.L2>:
    6528:	00a78733          	add	a4,a5,a0
    652c:	00074683          	lbu	a3,0(a4)
    6530:	00069e63          	bnez	a3,654c <.L7>
    6534:	00008067          	ret

00006538 <.L4>:
    6538:	00d60e63          	beq	a2,a3,6554 <.L3>
    653c:	00170713          	add	a4,a4,1

00006540 <.L6>:
    6540:	00074603          	lbu	a2,0(a4)
    6544:	fe061ae3          	bnez	a2,6538 <.L4>
    6548:	00008067          	ret

0000654c <.L7>:
    654c:	00058713          	mv	a4,a1
    6550:	ff1ff06f          	j	6540 <.L6>

00006554 <.L3>:
    6554:	00150513          	add	a0,a0,1
    6558:	fd1ff06f          	j	6528 <.L2>

0000655c <__GI_sigaction>:
    655c:	00800693          	li	a3,8
    6560:	60d0006f          	j	736c <__syscall_rt_sigaction>

00006564 <calloc>:
    6564:	02a5b7b3          	mulhu	a5,a1,a0
    6568:	fe010113          	add	sp,sp,-32
    656c:	00112e23          	sw	ra,28(sp)
    6570:	00812c23          	sw	s0,24(sp)
    6574:	02a58633          	mul	a2,a1,a0
    6578:	02078663          	beqz	a5,65a4 <.L9>
    657c:	0000a797          	auipc	a5,0xa
    6580:	0587a783          	lw	a5,88(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    6584:	00c00713          	li	a4,12
    6588:	00e7a023          	sw	a4,0(a5)
    658c:	00000413          	li	s0,0

00006590 <.L1>:
    6590:	01c12083          	lw	ra,28(sp)
    6594:	00040513          	mv	a0,s0
    6598:	01812403          	lw	s0,24(sp)
    659c:	02010113          	add	sp,sp,32
    65a0:	00008067          	ret

000065a4 <.L9>:
    65a4:	00060513          	mv	a0,a2
    65a8:	00c12623          	sw	a2,12(sp)
    65ac:	d45fc0ef          	jal	32f0 <malloc>
    65b0:	00050413          	mv	s0,a0
    65b4:	fc050ee3          	beqz	a0,6590 <.L1>
    65b8:	00c12603          	lw	a2,12(sp)
    65bc:	00000593          	li	a1,0
    65c0:	fd8fc0ef          	jal	2d98 <__GI_memset>
    65c4:	fcdff06f          	j	6590 <.L1>

000065c8 <realloc>:
    65c8:	00051663          	bnez	a0,65d4 <.L2>
    65cc:	00058513          	mv	a0,a1
    65d0:	d21fc06f          	j	32f0 <malloc>

000065d4 <.L2>:
    65d4:	ff010113          	add	sp,sp,-16
    65d8:	00112623          	sw	ra,12(sp)
    65dc:	00812423          	sw	s0,8(sp)
    65e0:	00912223          	sw	s1,4(sp)
    65e4:	01212023          	sw	s2,0(sp)
    65e8:	02059463          	bnez	a1,6610 <.L3>
    65ec:	f1dfc0ef          	jal	3508 <free>

000065f0 <.L4>:
    65f0:	00000413          	li	s0,0

000065f4 <.L1>:
    65f4:	00c12083          	lw	ra,12(sp)
    65f8:	00040513          	mv	a0,s0
    65fc:	00812403          	lw	s0,8(sp)
    6600:	00412483          	lw	s1,4(sp)
    6604:	00012903          	lw	s2,0(sp)
    6608:	01010113          	add	sp,sp,16
    660c:	00008067          	ret

00006610 <.L3>:
    6610:	ff000793          	li	a5,-16
    6614:	fcb7eee3          	bltu	a5,a1,65f0 <.L4>
    6618:	ff852903          	lw	s2,-8(a0)
    661c:	00f58413          	add	s0,a1,15
    6620:	ff847413          	and	s0,s0,-8
    6624:	00050493          	mv	s1,a0
    6628:	ff850793          	add	a5,a0,-8
    662c:	04897a63          	bgeu	s2,s0,6680 <.L7>
    6630:	41240633          	sub	a2,s0,s2
    6634:	012785b3          	add	a1,a5,s2
    6638:	0000c517          	auipc	a0,0xc
    663c:	0fc50513          	add	a0,a0,252 # 12734 <__malloc_heap>
    6640:	064000ef          	jal	66a4 <__heap_alloc_at>
    6644:	00050a63          	beqz	a0,6658 <.L8>
    6648:	00a90933          	add	s2,s2,a0
    664c:	ff24ac23          	sw	s2,-8(s1)

00006650 <.L9>:
    6650:	00048413          	mv	s0,s1
    6654:	fa1ff06f          	j	65f4 <.L1>

00006658 <.L8>:
    6658:	ff840513          	add	a0,s0,-8
    665c:	c95fc0ef          	jal	32f0 <malloc>
    6660:	00050413          	mv	s0,a0
    6664:	f80508e3          	beqz	a0,65f4 <.L1>
    6668:	ff890613          	add	a2,s2,-8
    666c:	00048593          	mv	a1,s1
    6670:	c80fc0ef          	jal	2af0 <__GI_memcpy>
    6674:	00048513          	mv	a0,s1
    6678:	e91fc0ef          	jal	3508 <free>
    667c:	f79ff06f          	j	65f4 <.L1>

00006680 <.L7>:
    6680:	02040713          	add	a4,s0,32
    6684:	fce966e3          	bltu	s2,a4,6650 <.L9>
    6688:	40890633          	sub	a2,s2,s0
    668c:	008785b3          	add	a1,a5,s0
    6690:	0000c517          	auipc	a0,0xc
    6694:	0a450513          	add	a0,a0,164 # 12734 <__malloc_heap>
    6698:	f05fc0ef          	jal	359c <__heap_free>
    669c:	fe84ac23          	sw	s0,-8(s1)
    66a0:	fb1ff06f          	j	6650 <.L9>

000066a4 <__heap_alloc_at>:
    66a4:	00052783          	lw	a5,0(a0)
    66a8:	00050713          	mv	a4,a0
    66ac:	00c00813          	li	a6,12

000066b0 <.L2>:
    66b0:	00079663          	bnez	a5,66bc <.L9>

000066b4 <.L11>:
    66b4:	00000513          	li	a0,0
    66b8:	00008067          	ret

000066bc <.L9>:
    66bc:	0007a503          	lw	a0,0(a5)
    66c0:	40a806b3          	sub	a3,a6,a0
    66c4:	00d786b3          	add	a3,a5,a3
    66c8:	04d5ea63          	bltu	a1,a3,671c <.L3>
    66cc:	feb694e3          	bne	a3,a1,66b4 <.L11>
    66d0:	00760613          	add	a2,a2,7
    66d4:	ff867613          	and	a2,a2,-8
    66d8:	fcc56ee3          	bltu	a0,a2,66b4 <.L11>
    66dc:	03060693          	add	a3,a2,48
    66e0:	02d57663          	bgeu	a0,a3,670c <.L5>
    66e4:	0047a683          	lw	a3,4(a5)
    66e8:	00068663          	beqz	a3,66f4 <.L6>
    66ec:	0087a603          	lw	a2,8(a5)
    66f0:	00c6a423          	sw	a2,8(a3)

000066f4 <.L6>:
    66f4:	0087a783          	lw	a5,8(a5)
    66f8:	00078663          	beqz	a5,6704 <.L7>
    66fc:	00d7a223          	sw	a3,4(a5)
    6700:	00008067          	ret

00006704 <.L7>:
    6704:	00d72023          	sw	a3,0(a4)
    6708:	00008067          	ret

0000670c <.L5>:
    670c:	40c50533          	sub	a0,a0,a2
    6710:	00a7a023          	sw	a0,0(a5)
    6714:	00060513          	mv	a0,a2
    6718:	00008067          	ret

0000671c <.L3>:
    671c:	0047a783          	lw	a5,4(a5)
    6720:	f91ff06f          	j	66b0 <.L2>

00006724 <__GI_exit>:
    6724:	ff010113          	add	sp,sp,-16
    6728:	00812423          	sw	s0,8(sp)
    672c:	00010717          	auipc	a4,0x10
    6730:	a9072703          	lw	a4,-1392(a4) # 161bc <__exit_cleanup>
    6734:	00112623          	sw	ra,12(sp)
    6738:	00070793          	mv	a5,a4
    673c:	00050413          	mv	s0,a0
    6740:	00078463          	beqz	a5,6748 <.L2>
    6744:	000700e7          	jalr	a4

00006748 <.L2>:
    6748:	f10fd0ef          	jal	3e58 <__uClibc_fini>
    674c:	0000a717          	auipc	a4,0xa
    6750:	eb872703          	lw	a4,-328(a4) # 10604 <_GLOBAL_OFFSET_TABLE_+0x3c>
    6754:	00070793          	mv	a5,a4
    6758:	00078463          	beqz	a5,6760 <.L3>
    675c:	000700e7          	jalr	a4

00006760 <.L3>:
    6760:	00040513          	mv	a0,s0
    6764:	431000ef          	jal	7394 <__GI__exit>

00006768 <__ieee754_atan2>:
    6768:	00060893          	mv	a7,a2
    676c:	80000837          	lui	a6,0x80000
    6770:	40c00633          	neg	a2,a2
    6774:	fff80813          	add	a6,a6,-1 # 7fffffff <_ebss+0x7ffe9ccf>
    6778:	01166633          	or	a2,a2,a7
    677c:	ff010113          	add	sp,sp,-16
    6780:	00d87333          	and	t1,a6,a3
    6784:	01f65613          	srl	a2,a2,0x1f
    6788:	00112623          	sw	ra,12(sp)
    678c:	00812423          	sw	s0,8(sp)
    6790:	00666633          	or	a2,a2,t1
    6794:	7ff00e37          	lui	t3,0x7ff00
    6798:	00050793          	mv	a5,a0
    679c:	00058713          	mv	a4,a1
    67a0:	02ce6063          	bltu	t3,a2,67c0 <.L2>
    67a4:	40a00633          	neg	a2,a0
    67a8:	00a66633          	or	a2,a2,a0
    67ac:	00b87833          	and	a6,a6,a1
    67b0:	01f65613          	srl	a2,a2,0x1f
    67b4:	01066633          	or	a2,a2,a6
    67b8:	00058e93          	mv	t4,a1
    67bc:	02ce7063          	bgeu	t3,a2,67dc <.L3>

000067c0 <.L2>:
    67c0:	00088613          	mv	a2,a7
    67c4:	00078513          	mv	a0,a5
    67c8:	00070593          	mv	a1,a4
    67cc:	355020ef          	jal	9320 <__adddf3>

000067d0 <.L29>:
    67d0:	00050793          	mv	a5,a0
    67d4:	00058713          	mv	a4,a1
    67d8:	04c0006f          	j	6824 <.L4>

000067dc <.L3>:
    67dc:	c0100637          	lui	a2,0xc0100
    67e0:	00d60633          	add	a2,a2,a3
    67e4:	01166633          	or	a2,a2,a7
    67e8:	00061a63          	bnez	a2,67fc <.L5>
    67ec:	00812403          	lw	s0,8(sp)
    67f0:	00c12083          	lw	ra,12(sp)
    67f4:	01010113          	add	sp,sp,16
    67f8:	4b80006f          	j	6cb0 <__GI_atan>

000067fc <.L5>:
    67fc:	41e6d413          	sra	s0,a3,0x1e
    6800:	00247413          	and	s0,s0,2
    6804:	01f5d613          	srl	a2,a1,0x1f
    6808:	00a86fb3          	or	t6,a6,a0
    680c:	00c46433          	or	s0,s0,a2
    6810:	020f9663          	bnez	t6,683c <.L6>
    6814:	00200693          	li	a3,2
    6818:	18d40c63          	beq	s0,a3,69b0 <.L16>
    681c:	00300693          	li	a3,3
    6820:	18d40e63          	beq	s0,a3,69bc <.L17>

00006824 <.L4>:
    6824:	00c12083          	lw	ra,12(sp)
    6828:	00812403          	lw	s0,8(sp)
    682c:	00078513          	mv	a0,a5
    6830:	00070593          	mv	a1,a4
    6834:	01010113          	add	sp,sp,16
    6838:	00008067          	ret

0000683c <.L6>:
    683c:	01136633          	or	a2,t1,a7
    6840:	00061e63          	bnez	a2,685c <.L7>

00006844 <.L34>:
    6844:	0000c717          	auipc	a4,0xc
    6848:	b7c70713          	add	a4,a4,-1156 # 123c0 <.LC0>
    684c:	020ede63          	bgez	t4,6888 <.L30>
    6850:	0000c717          	auipc	a4,0xc
    6854:	b9070713          	add	a4,a4,-1136 # 123e0 <.LC1>
    6858:	0300006f          	j	6888 <.L30>

0000685c <.L7>:
    685c:	07c31263          	bne	t1,t3,68c0 <.L8>
    6860:	fff40413          	add	s0,s0,-1
    6864:	02681863          	bne	a6,t1,6894 <.L9>
    6868:	00200793          	li	a5,2
    686c:	0000c717          	auipc	a4,0xc
    6870:	b6c70713          	add	a4,a4,-1172 # 123d8 <.LC3>
    6874:	0087ea63          	bltu	a5,s0,6888 <.L30>
    6878:	00341413          	sll	s0,s0,0x3
    687c:	0000b717          	auipc	a4,0xb
    6880:	34c70713          	add	a4,a4,844 # 11bc8 <CSWTCH.8>
    6884:	00870733          	add	a4,a4,s0

00006888 <.L30>:
    6888:	00072783          	lw	a5,0(a4)
    688c:	00472703          	lw	a4,4(a4)
    6890:	f95ff06f          	j	6824 <.L4>

00006894 <.L9>:
    6894:	00200693          	li	a3,2
    6898:	00000793          	li	a5,0
    689c:	00000713          	li	a4,0
    68a0:	f886e2e3          	bltu	a3,s0,6824 <.L4>
    68a4:	00341413          	sll	s0,s0,0x3
    68a8:	0000b717          	auipc	a4,0xb
    68ac:	32070713          	add	a4,a4,800 # 11bc8 <CSWTCH.8>
    68b0:	00870733          	add	a4,a4,s0
    68b4:	01872783          	lw	a5,24(a4)
    68b8:	01c72703          	lw	a4,28(a4)
    68bc:	f69ff06f          	j	6824 <.L4>

000068c0 <.L8>:
    68c0:	f9c802e3          	beq	a6,t3,6844 <.L34>
    68c4:	40680833          	sub	a6,a6,t1
    68c8:	41485813          	sra	a6,a6,0x14
    68cc:	03c00613          	li	a2,60
    68d0:	07064a63          	blt	a2,a6,6944 <.L22>
    68d4:	0006d663          	bgez	a3,68e0 <.L12>
    68d8:	fc400613          	li	a2,-60
    68dc:	06c84e63          	blt	a6,a2,6958 <.L23>

000068e0 <.L12>:
    68e0:	00078513          	mv	a0,a5
    68e4:	00070593          	mv	a1,a4
    68e8:	00088613          	mv	a2,a7
    68ec:	1c8030ef          	jal	9ab4 <__divdf3>
    68f0:	109000ef          	jal	71f8 <__GI_fabs>
    68f4:	3bc000ef          	jal	6cb0 <__GI_atan>
    68f8:	00050793          	mv	a5,a0
    68fc:	00058713          	mv	a4,a1

00006900 <.L11>:
    6900:	00100693          	li	a3,1
    6904:	06d40063          	beq	s0,a3,6964 <.L13>
    6908:	00200693          	li	a3,2
    690c:	06d40463          	beq	s0,a3,6974 <.L14>
    6910:	f0040ae3          	beqz	s0,6824 <.L4>
    6914:	0000c697          	auipc	a3,0xc
    6918:	ad468693          	add	a3,a3,-1324 # 123e8 <.LC5>
    691c:	0006a603          	lw	a2,0(a3)
    6920:	0046a683          	lw	a3,4(a3)
    6924:	00078513          	mv	a0,a5
    6928:	00070593          	mv	a1,a4
    692c:	7c1030ef          	jal	a8ec <__subdf3>
    6930:	0000c797          	auipc	a5,0xc
    6934:	a9878793          	add	a5,a5,-1384 # 123c8 <.LC1>
    6938:	0007a603          	lw	a2,0(a5)
    693c:	0047a683          	lw	a3,4(a5)
    6940:	0680006f          	j	69a8 <.L31>

00006944 <.L22>:
    6944:	0000c717          	auipc	a4,0xc
    6948:	a7c70713          	add	a4,a4,-1412 # 123c0 <.LC0>
    694c:	00072783          	lw	a5,0(a4)
    6950:	00472703          	lw	a4,4(a4)
    6954:	fadff06f          	j	6900 <.L11>

00006958 <.L23>:
    6958:	00000793          	li	a5,0
    695c:	00000713          	li	a4,0
    6960:	fa1ff06f          	j	6900 <.L11>

00006964 <.L13>:
    6964:	800006b7          	lui	a3,0x80000
    6968:	00e6c6b3          	xor	a3,a3,a4
    696c:	00068713          	mv	a4,a3
    6970:	eb5ff06f          	j	6824 <.L4>

00006974 <.L14>:
    6974:	0000c697          	auipc	a3,0xc
    6978:	a7468693          	add	a3,a3,-1420 # 123e8 <.LC5>
    697c:	0006a603          	lw	a2,0(a3)
    6980:	0046a683          	lw	a3,4(a3)
    6984:	00078513          	mv	a0,a5
    6988:	00070593          	mv	a1,a4
    698c:	761030ef          	jal	a8ec <__subdf3>
    6990:	0000c797          	auipc	a5,0xc
    6994:	a3878793          	add	a5,a5,-1480 # 123c8 <.LC1>
    6998:	00050613          	mv	a2,a0
    699c:	00058693          	mv	a3,a1
    69a0:	0007a503          	lw	a0,0(a5)
    69a4:	0047a583          	lw	a1,4(a5)

000069a8 <.L31>:
    69a8:	745030ef          	jal	a8ec <__subdf3>
    69ac:	e25ff06f          	j	67d0 <.L29>

000069b0 <.L16>:
    69b0:	0000c717          	auipc	a4,0xc
    69b4:	a1870713          	add	a4,a4,-1512 # 123c8 <.LC1>
    69b8:	ed1ff06f          	j	6888 <.L30>

000069bc <.L17>:
    69bc:	0000c717          	auipc	a4,0xc
    69c0:	a1470713          	add	a4,a4,-1516 # 123d0 <.LC2>
    69c4:	ec5ff06f          	j	6888 <.L30>

000069c8 <__ieee754_fmod>:
    69c8:	80000fb7          	lui	t6,0x80000
    69cc:	00060313          	mv	t1,a2
    69d0:	00068f13          	mv	t5,a3
    69d4:	00060e93          	mv	t4,a2
    69d8:	ffff8613          	add	a2,t6,-1 # 7fffffff <_ebss+0x7ffe9ccf>
    69dc:	01e67e33          	and	t3,a2,t5
    69e0:	006e67b3          	or	a5,t3,t1
    69e4:	02078463          	beqz	a5,6a0c <.L2>
    69e8:	00b67633          	and	a2,a2,a1
    69ec:	7ff008b7          	lui	a7,0x7ff00
    69f0:	00058793          	mv	a5,a1
    69f4:	01167c63          	bgeu	a2,a7,6a0c <.L2>
    69f8:	40600733          	neg	a4,t1
    69fc:	00676733          	or	a4,a4,t1
    6a00:	01f75713          	srl	a4,a4,0x1f
    6a04:	01c76733          	or	a4,a4,t3
    6a08:	02e8f863          	bgeu	a7,a4,6a38 <.L3>

00006a0c <.L2>:
    6a0c:	ff010113          	add	sp,sp,-16
    6a10:	00030613          	mv	a2,t1
    6a14:	000f0693          	mv	a3,t5
    6a18:	00112623          	sw	ra,12(sp)
    6a1c:	0e1030ef          	jal	a2fc <__muldf3>
    6a20:	00050613          	mv	a2,a0
    6a24:	00058693          	mv	a3,a1
    6a28:	08c030ef          	jal	9ab4 <__divdf3>
    6a2c:	00c12083          	lw	ra,12(sp)
    6a30:	01010113          	add	sp,sp,16
    6a34:	00008067          	ret

00006a38 <.L3>:
    6a38:	00050893          	mv	a7,a0
    6a3c:	01f5f833          	and	a6,a1,t6
    6a40:	02ce4663          	blt	t3,a2,6a6c <.L5>
    6a44:	23c64c63          	blt	a2,t3,6c7c <.L45>
    6a48:	22656a63          	bltu	a0,t1,6c7c <.L45>
    6a4c:	02a31063          	bne	t1,a0,6a6c <.L5>

00006a50 <.L49>:
    6a50:	0000b797          	auipc	a5,0xb
    6a54:	1a878793          	add	a5,a5,424 # 11bf8 <Zero>
    6a58:	01c85813          	srl	a6,a6,0x1c
    6a5c:	01078833          	add	a6,a5,a6
    6a60:	00082503          	lw	a0,0(a6)
    6a64:	00482583          	lw	a1,4(a6)
    6a68:	00008067          	ret

00006a6c <.L5>:
    6a6c:	0147d713          	srl	a4,a5,0x14
    6a70:	7ff77713          	and	a4,a4,2047
    6a74:	0c071e63          	bnez	a4,6b50 <.L6>
    6a78:	0c061063          	bnez	a2,6b38 <.L7>
    6a7c:	00088713          	mv	a4,a7
    6a80:	bed00513          	li	a0,-1043

00006a84 <.L8>:
    6a84:	0ae04463          	bgtz	a4,6b2c <.L9>

00006a88 <.L10>:
    6a88:	014f5713          	srl	a4,t5,0x14
    6a8c:	7ff77713          	and	a4,a4,2047
    6a90:	0e071863          	bnez	a4,6b80 <.L13>
    6a94:	0c0e1a63          	bnez	t3,6b68 <.L14>
    6a98:	00030693          	mv	a3,t1
    6a9c:	bed00713          	li	a4,-1043

00006aa0 <.L15>:
    6aa0:	0ad04e63          	bgtz	a3,6b5c <.L16>

00006aa4 <.L17>:
    6aa4:	c0200693          	li	a3,-1022
    6aa8:	0ed54263          	blt	a0,a3,6b8c <.L20>
    6aac:	001006b7          	lui	a3,0x100
    6ab0:	fff68613          	add	a2,a3,-1 # fffff <_ebss+0xe9ccf>
    6ab4:	00c7f5b3          	and	a1,a5,a2
    6ab8:	00d5e5b3          	or	a1,a1,a3

00006abc <.L21>:
    6abc:	c0200613          	li	a2,-1022
    6ac0:	10c74263          	blt	a4,a2,6bc4 <.L23>
    6ac4:	001007b7          	lui	a5,0x100
    6ac8:	fff78693          	add	a3,a5,-1 # fffff <_ebss+0xe9ccf>
    6acc:	01e6f6b3          	and	a3,a3,t5
    6ad0:	00f6e6b3          	or	a3,a3,a5

00006ad4 <.L24>:
    6ad4:	40e50533          	sub	a0,a0,a4

00006ad8 <.L26>:
    6ad8:	40d587b3          	sub	a5,a1,a3
    6adc:	41d88633          	sub	a2,a7,t4
    6ae0:	10051e63          	bnez	a0,6bfc <.L31>
    6ae4:	01d8f463          	bgeu	a7,t4,6aec <.L32>
    6ae8:	fff78793          	add	a5,a5,-1

00006aec <.L32>:
    6aec:	0007d663          	bgez	a5,6af8 <.L33>
    6af0:	00088613          	mv	a2,a7
    6af4:	00058793          	mv	a5,a1

00006af8 <.L33>:
    6af8:	00c7e6b3          	or	a3,a5,a2
    6afc:	001005b7          	lui	a1,0x100
    6b00:	f40688e3          	beqz	a3,6a50 <.L49>

00006b04 <.L34>:
    6b04:	12b7cc63          	blt	a5,a1,6c3c <.L35>
    6b08:	c0200693          	li	a3,-1022
    6b0c:	14d74463          	blt	a4,a3,6c54 <.L36>
    6b10:	40b787b3          	sub	a5,a5,a1
    6b14:	3ff70713          	add	a4,a4,1023
    6b18:	0107e7b3          	or	a5,a5,a6
    6b1c:	01471713          	sll	a4,a4,0x14
    6b20:	00060513          	mv	a0,a2
    6b24:	00e7e5b3          	or	a1,a5,a4
    6b28:	00008067          	ret

00006b2c <.L9>:
    6b2c:	fff50513          	add	a0,a0,-1
    6b30:	00171713          	sll	a4,a4,0x1
    6b34:	f51ff06f          	j	6a84 <.L8>

00006b38 <.L7>:
    6b38:	00b61713          	sll	a4,a2,0xb
    6b3c:	c0200513          	li	a0,-1022

00006b40 <.L11>:
    6b40:	f4e054e3          	blez	a4,6a88 <.L10>
    6b44:	fff50513          	add	a0,a0,-1
    6b48:	00171713          	sll	a4,a4,0x1
    6b4c:	ff5ff06f          	j	6b40 <.L11>

00006b50 <.L6>:
    6b50:	41465513          	sra	a0,a2,0x14
    6b54:	c0150513          	add	a0,a0,-1023
    6b58:	f31ff06f          	j	6a88 <.L10>

00006b5c <.L16>:
    6b5c:	fff70713          	add	a4,a4,-1
    6b60:	00169693          	sll	a3,a3,0x1
    6b64:	f3dff06f          	j	6aa0 <.L15>

00006b68 <.L14>:
    6b68:	00be1693          	sll	a3,t3,0xb
    6b6c:	c0200713          	li	a4,-1022

00006b70 <.L18>:
    6b70:	f2d05ae3          	blez	a3,6aa4 <.L17>
    6b74:	fff70713          	add	a4,a4,-1
    6b78:	00169693          	sll	a3,a3,0x1
    6b7c:	ff5ff06f          	j	6b70 <.L18>

00006b80 <.L13>:
    6b80:	414e5713          	sra	a4,t3,0x14
    6b84:	c0170713          	add	a4,a4,-1023
    6b88:	f1dff06f          	j	6aa4 <.L17>

00006b8c <.L20>:
    6b8c:	40a687b3          	sub	a5,a3,a0
    6b90:	01f00693          	li	a3,31
    6b94:	00f6ce63          	blt	a3,a5,6bb0 <.L22>
    6b98:	41e50593          	add	a1,a0,1054
    6b9c:	00b8d5b3          	srl	a1,a7,a1
    6ba0:	00f61633          	sll	a2,a2,a5
    6ba4:	00c5e5b3          	or	a1,a1,a2
    6ba8:	00f898b3          	sll	a7,a7,a5
    6bac:	f11ff06f          	j	6abc <.L21>

00006bb0 <.L22>:
    6bb0:	be200593          	li	a1,-1054
    6bb4:	40a585b3          	sub	a1,a1,a0
    6bb8:	00b895b3          	sll	a1,a7,a1
    6bbc:	00000893          	li	a7,0
    6bc0:	efdff06f          	j	6abc <.L21>

00006bc4 <.L23>:
    6bc4:	40e60633          	sub	a2,a2,a4
    6bc8:	01f00793          	li	a5,31
    6bcc:	00c7ce63          	blt	a5,a2,6be8 <.L25>
    6bd0:	41e70693          	add	a3,a4,1054
    6bd4:	00ce17b3          	sll	a5,t3,a2
    6bd8:	00d356b3          	srl	a3,t1,a3
    6bdc:	00f6e6b3          	or	a3,a3,a5
    6be0:	00c31eb3          	sll	t4,t1,a2
    6be4:	ef1ff06f          	j	6ad4 <.L24>

00006be8 <.L25>:
    6be8:	be200693          	li	a3,-1054
    6bec:	40e686b3          	sub	a3,a3,a4
    6bf0:	00d316b3          	sll	a3,t1,a3
    6bf4:	00000e93          	li	t4,0
    6bf8:	eddff06f          	j	6ad4 <.L24>

00006bfc <.L31>:
    6bfc:	01d8f463          	bgeu	a7,t4,6c04 <.L27>
    6c00:	fff78793          	add	a5,a5,-1

00006c04 <.L27>:
    6c04:	0007de63          	bgez	a5,6c20 <.L28>
    6c08:	01f8d793          	srl	a5,a7,0x1f
    6c0c:	00159593          	sll	a1,a1,0x1
    6c10:	00f585b3          	add	a1,a1,a5
    6c14:	00189893          	sll	a7,a7,0x1

00006c18 <.L29>:
    6c18:	fff50513          	add	a0,a0,-1
    6c1c:	ebdff06f          	j	6ad8 <.L26>

00006c20 <.L28>:
    6c20:	00c7e5b3          	or	a1,a5,a2
    6c24:	e20586e3          	beqz	a1,6a50 <.L49>
    6c28:	00179793          	sll	a5,a5,0x1
    6c2c:	01f65593          	srl	a1,a2,0x1f
    6c30:	00b785b3          	add	a1,a5,a1
    6c34:	00161893          	sll	a7,a2,0x1
    6c38:	fe1ff06f          	j	6c18 <.L29>

00006c3c <.L35>:
    6c3c:	01f65693          	srl	a3,a2,0x1f
    6c40:	00179793          	sll	a5,a5,0x1
    6c44:	00d787b3          	add	a5,a5,a3
    6c48:	00161613          	sll	a2,a2,0x1
    6c4c:	fff70713          	add	a4,a4,-1
    6c50:	eb5ff06f          	j	6b04 <.L34>

00006c54 <.L36>:
    6c54:	40e686b3          	sub	a3,a3,a4
    6c58:	01400593          	li	a1,20
    6c5c:	02d5c263          	blt	a1,a3,6c80 <.L37>
    6c60:	41e70713          	add	a4,a4,1054
    6c64:	00e79733          	sll	a4,a5,a4
    6c68:	00d65633          	srl	a2,a2,a3
    6c6c:	00c76633          	or	a2,a4,a2
    6c70:	40d7d7b3          	sra	a5,a5,a3

00006c74 <.L38>:
    6c74:	00060513          	mv	a0,a2
    6c78:	0107e5b3          	or	a1,a5,a6

00006c7c <.L45>:
    6c7c:	00008067          	ret

00006c80 <.L37>:
    6c80:	01f00593          	li	a1,31
    6c84:	00d5ce63          	blt	a1,a3,6ca0 <.L39>
    6c88:	41e70713          	add	a4,a4,1054
    6c8c:	00d65633          	srl	a2,a2,a3
    6c90:	00e797b3          	sll	a5,a5,a4
    6c94:	00c7e633          	or	a2,a5,a2

00006c98 <.L47>:
    6c98:	00080793          	mv	a5,a6
    6c9c:	fd9ff06f          	j	6c74 <.L38>

00006ca0 <.L39>:
    6ca0:	be200613          	li	a2,-1054
    6ca4:	40e60633          	sub	a2,a2,a4
    6ca8:	40c7d633          	sra	a2,a5,a2
    6cac:	fedff06f          	j	6c98 <.L47>

00006cb0 <__GI_atan>:
    6cb0:	fd010113          	add	sp,sp,-48
    6cb4:	02912223          	sw	s1,36(sp)
    6cb8:	00159493          	sll	s1,a1,0x1
    6cbc:	02812423          	sw	s0,40(sp)
    6cc0:	01712623          	sw	s7,12(sp)
    6cc4:	02112623          	sw	ra,44(sp)
    6cc8:	03212023          	sw	s2,32(sp)
    6ccc:	01312e23          	sw	s3,28(sp)
    6cd0:	01412c23          	sw	s4,24(sp)
    6cd4:	01512a23          	sw	s5,20(sp)
    6cd8:	01612823          	sw	s6,16(sp)
    6cdc:	0014d493          	srl	s1,s1,0x1
    6ce0:	441007b7          	lui	a5,0x44100
    6ce4:	00050b93          	mv	s7,a0
    6ce8:	00058413          	mv	s0,a1
    6cec:	08f4e263          	bltu	s1,a5,6d70 <.L2>
    6cf0:	7ff007b7          	lui	a5,0x7ff00
    6cf4:	0097e663          	bltu	a5,s1,6d00 <.L3>
    6cf8:	04f49c63          	bne	s1,a5,6d50 <.L4>
    6cfc:	04050a63          	beqz	a0,6d50 <.L4>

00006d00 <.L3>:
    6d00:	000b8613          	mv	a2,s7
    6d04:	00040693          	mv	a3,s0
    6d08:	000b8513          	mv	a0,s7
    6d0c:	00040593          	mv	a1,s0
    6d10:	610020ef          	jal	9320 <__adddf3>

00006d14 <.L18>:
    6d14:	00050b93          	mv	s7,a0
    6d18:	00058413          	mv	s0,a1

00006d1c <.L5>:
    6d1c:	02c12083          	lw	ra,44(sp)
    6d20:	00040593          	mv	a1,s0
    6d24:	02812403          	lw	s0,40(sp)
    6d28:	02412483          	lw	s1,36(sp)
    6d2c:	02012903          	lw	s2,32(sp)
    6d30:	01c12983          	lw	s3,28(sp)
    6d34:	01812a03          	lw	s4,24(sp)
    6d38:	01412a83          	lw	s5,20(sp)
    6d3c:	01012b03          	lw	s6,16(sp)
    6d40:	000b8513          	mv	a0,s7
    6d44:	00c12b83          	lw	s7,12(sp)
    6d48:	03010113          	add	sp,sp,48
    6d4c:	00008067          	ret

00006d50 <.L4>:
    6d50:	0000b797          	auipc	a5,0xb
    6d54:	67078793          	add	a5,a5,1648 # 123c0 <.LC0>
    6d58:	00804663          	bgtz	s0,6d64 <.L19>
    6d5c:	0000b797          	auipc	a5,0xb
    6d60:	68478793          	add	a5,a5,1668 # 123e0 <.LC1>

00006d64 <.L19>:
    6d64:	0007ab83          	lw	s7,0(a5)
    6d68:	0047a403          	lw	s0,4(a5)
    6d6c:	fb1ff06f          	j	6d1c <.L5>

00006d70 <.L2>:
    6d70:	3fdc07b7          	lui	a5,0x3fdc0
    6d74:	00058a13          	mv	s4,a1
    6d78:	04f4f063          	bgeu	s1,a5,6db8 <.L6>
    6d7c:	3e2007b7          	lui	a5,0x3e200
    6d80:	02f4f863          	bgeu	s1,a5,6db0 <.L13>
    6d84:	0000b797          	auipc	a5,0xb
    6d88:	66c78793          	add	a5,a5,1644 # 123f0 <.LC0>
    6d8c:	0007a603          	lw	a2,0(a5)
    6d90:	0047a683          	lw	a3,4(a5)
    6d94:	58c020ef          	jal	9320 <__adddf3>
    6d98:	0000b797          	auipc	a5,0xb
    6d9c:	66078793          	add	a5,a5,1632 # 123f8 <.LC1>
    6da0:	0007a603          	lw	a2,0(a5)
    6da4:	0047a683          	lw	a3,4(a5)
    6da8:	478030ef          	jal	a220 <__gedf2>
    6dac:	f6a048e3          	bgtz	a0,6d1c <.L5>

00006db0 <.L13>:
    6db0:	fff00993          	li	s3,-1
    6db4:	0840006f          	j	6e38 <.L7>

00006db8 <.L6>:
    6db8:	440000ef          	jal	71f8 <__GI_fabs>
    6dbc:	3ff307b7          	lui	a5,0x3ff30
    6dc0:	00050913          	mv	s2,a0
    6dc4:	00058413          	mv	s0,a1
    6dc8:	28f4f263          	bgeu	s1,a5,704c <.L8>
    6dcc:	3fe607b7          	lui	a5,0x3fe60
    6dd0:	0000ba97          	auipc	s5,0xb
    6dd4:	628a8a93          	add	s5,s5,1576 # 123f8 <.LC1>
    6dd8:	22f4f463          	bgeu	s1,a5,7000 <.L9>
    6ddc:	00050613          	mv	a2,a0
    6de0:	00058693          	mv	a3,a1
    6de4:	53c020ef          	jal	9320 <__adddf3>
    6de8:	000aa603          	lw	a2,0(s5)
    6dec:	004aa683          	lw	a3,4(s5)
    6df0:	2fd030ef          	jal	a8ec <__subdf3>
    6df4:	0000b797          	auipc	a5,0xb
    6df8:	60c78793          	add	a5,a5,1548 # 12400 <.LC4>
    6dfc:	0007a603          	lw	a2,0(a5)
    6e00:	0047a683          	lw	a3,4(a5)
    6e04:	00050993          	mv	s3,a0
    6e08:	00058493          	mv	s1,a1
    6e0c:	00090513          	mv	a0,s2
    6e10:	00040593          	mv	a1,s0
    6e14:	50c020ef          	jal	9320 <__adddf3>
    6e18:	00050613          	mv	a2,a0
    6e1c:	00058693          	mv	a3,a1
    6e20:	00098513          	mv	a0,s3
    6e24:	00048593          	mv	a1,s1
    6e28:	48d020ef          	jal	9ab4 <__divdf3>
    6e2c:	00050b93          	mv	s7,a0
    6e30:	00058413          	mv	s0,a1
    6e34:	00000993          	li	s3,0

00006e38 <.L7>:
    6e38:	000b8613          	mv	a2,s7
    6e3c:	00040693          	mv	a3,s0
    6e40:	000b8513          	mv	a0,s7
    6e44:	00040593          	mv	a1,s0
    6e48:	4b4030ef          	jal	a2fc <__muldf3>
    6e4c:	00050613          	mv	a2,a0
    6e50:	00058693          	mv	a3,a1
    6e54:	00050b13          	mv	s6,a0
    6e58:	00058a93          	mv	s5,a1
    6e5c:	4a0030ef          	jal	a2fc <__muldf3>
    6e60:	0000b797          	auipc	a5,0xb
    6e64:	5b878793          	add	a5,a5,1464 # 12418 <.LC7>
    6e68:	0007a603          	lw	a2,0(a5)
    6e6c:	0047a683          	lw	a3,4(a5)
    6e70:	00050913          	mv	s2,a0
    6e74:	00058493          	mv	s1,a1
    6e78:	484030ef          	jal	a2fc <__muldf3>
    6e7c:	0000b797          	auipc	a5,0xb
    6e80:	5a478793          	add	a5,a5,1444 # 12420 <.LC8>
    6e84:	0007a603          	lw	a2,0(a5)
    6e88:	0047a683          	lw	a3,4(a5)
    6e8c:	494020ef          	jal	9320 <__adddf3>
    6e90:	00090613          	mv	a2,s2
    6e94:	00048693          	mv	a3,s1
    6e98:	464030ef          	jal	a2fc <__muldf3>
    6e9c:	0000b797          	auipc	a5,0xb
    6ea0:	58c78793          	add	a5,a5,1420 # 12428 <.LC9>
    6ea4:	0007a603          	lw	a2,0(a5)
    6ea8:	0047a683          	lw	a3,4(a5)
    6eac:	474020ef          	jal	9320 <__adddf3>
    6eb0:	00090613          	mv	a2,s2
    6eb4:	00048693          	mv	a3,s1
    6eb8:	444030ef          	jal	a2fc <__muldf3>
    6ebc:	0000b797          	auipc	a5,0xb
    6ec0:	57478793          	add	a5,a5,1396 # 12430 <.LC10>
    6ec4:	0007a603          	lw	a2,0(a5)
    6ec8:	0047a683          	lw	a3,4(a5)
    6ecc:	454020ef          	jal	9320 <__adddf3>
    6ed0:	00090613          	mv	a2,s2
    6ed4:	00048693          	mv	a3,s1
    6ed8:	424030ef          	jal	a2fc <__muldf3>
    6edc:	0000b797          	auipc	a5,0xb
    6ee0:	55c78793          	add	a5,a5,1372 # 12438 <.LC11>
    6ee4:	0007a603          	lw	a2,0(a5)
    6ee8:	0047a683          	lw	a3,4(a5)
    6eec:	434020ef          	jal	9320 <__adddf3>
    6ef0:	00090613          	mv	a2,s2
    6ef4:	00048693          	mv	a3,s1
    6ef8:	404030ef          	jal	a2fc <__muldf3>
    6efc:	0000b797          	auipc	a5,0xb
    6f00:	54478793          	add	a5,a5,1348 # 12440 <.LC12>
    6f04:	0007a603          	lw	a2,0(a5)
    6f08:	0047a683          	lw	a3,4(a5)
    6f0c:	414020ef          	jal	9320 <__adddf3>
    6f10:	000b0613          	mv	a2,s6
    6f14:	000a8693          	mv	a3,s5
    6f18:	3e4030ef          	jal	a2fc <__muldf3>
    6f1c:	0000b797          	auipc	a5,0xb
    6f20:	52c78793          	add	a5,a5,1324 # 12448 <.LC13>
    6f24:	0007a603          	lw	a2,0(a5)
    6f28:	0047a683          	lw	a3,4(a5)
    6f2c:	00050b13          	mv	s6,a0
    6f30:	00058a93          	mv	s5,a1
    6f34:	00090513          	mv	a0,s2
    6f38:	00048593          	mv	a1,s1
    6f3c:	3c0030ef          	jal	a2fc <__muldf3>
    6f40:	0000b797          	auipc	a5,0xb
    6f44:	51078793          	add	a5,a5,1296 # 12450 <.LC14>
    6f48:	0007a603          	lw	a2,0(a5)
    6f4c:	0047a683          	lw	a3,4(a5)
    6f50:	19d030ef          	jal	a8ec <__subdf3>
    6f54:	00090613          	mv	a2,s2
    6f58:	00048693          	mv	a3,s1
    6f5c:	3a0030ef          	jal	a2fc <__muldf3>
    6f60:	0000b797          	auipc	a5,0xb
    6f64:	4f878793          	add	a5,a5,1272 # 12458 <.LC15>
    6f68:	0007a603          	lw	a2,0(a5)
    6f6c:	0047a683          	lw	a3,4(a5)
    6f70:	17d030ef          	jal	a8ec <__subdf3>
    6f74:	00090613          	mv	a2,s2
    6f78:	00048693          	mv	a3,s1
    6f7c:	380030ef          	jal	a2fc <__muldf3>
    6f80:	0000b797          	auipc	a5,0xb
    6f84:	4e078793          	add	a5,a5,1248 # 12460 <.LC16>
    6f88:	0007a603          	lw	a2,0(a5)
    6f8c:	0047a683          	lw	a3,4(a5)
    6f90:	15d030ef          	jal	a8ec <__subdf3>
    6f94:	00090613          	mv	a2,s2
    6f98:	00048693          	mv	a3,s1
    6f9c:	360030ef          	jal	a2fc <__muldf3>
    6fa0:	0000b797          	auipc	a5,0xb
    6fa4:	4c878793          	add	a5,a5,1224 # 12468 <.LC17>
    6fa8:	0007a603          	lw	a2,0(a5)
    6fac:	0047a683          	lw	a3,4(a5)
    6fb0:	13d030ef          	jal	a8ec <__subdf3>
    6fb4:	00090613          	mv	a2,s2
    6fb8:	00048693          	mv	a3,s1
    6fbc:	340030ef          	jal	a2fc <__muldf3>
    6fc0:	00050613          	mv	a2,a0
    6fc4:	00058693          	mv	a3,a1
    6fc8:	000b0513          	mv	a0,s6
    6fcc:	000a8593          	mv	a1,s5
    6fd0:	350020ef          	jal	9320 <__adddf3>
    6fd4:	00040693          	mv	a3,s0
    6fd8:	000b8613          	mv	a2,s7
    6fdc:	320030ef          	jal	a2fc <__muldf3>
    6fe0:	fff00693          	li	a3,-1
    6fe4:	10d99263          	bne	s3,a3,70e8 <.L11>
    6fe8:	00050613          	mv	a2,a0
    6fec:	00058693          	mv	a3,a1
    6ff0:	000b8513          	mv	a0,s7
    6ff4:	00040593          	mv	a1,s0
    6ff8:	0f5030ef          	jal	a8ec <__subdf3>
    6ffc:	d19ff06f          	j	6d14 <.L18>

00007000 <.L9>:
    7000:	000aa603          	lw	a2,0(s5)
    7004:	004aa683          	lw	a3,4(s5)
    7008:	0e5030ef          	jal	a8ec <__subdf3>
    700c:	000aa603          	lw	a2,0(s5)
    7010:	004aa683          	lw	a3,4(s5)
    7014:	00050993          	mv	s3,a0
    7018:	00058493          	mv	s1,a1
    701c:	00090513          	mv	a0,s2
    7020:	00040593          	mv	a1,s0
    7024:	2fc020ef          	jal	9320 <__adddf3>
    7028:	00050613          	mv	a2,a0
    702c:	00058693          	mv	a3,a1
    7030:	00098513          	mv	a0,s3
    7034:	00048593          	mv	a1,s1
    7038:	27d020ef          	jal	9ab4 <__divdf3>
    703c:	00050b93          	mv	s7,a0
    7040:	00058413          	mv	s0,a1
    7044:	00100993          	li	s3,1
    7048:	df1ff06f          	j	6e38 <.L7>

0000704c <.L8>:
    704c:	400387b7          	lui	a5,0x40038
    7050:	06f4f663          	bgeu	s1,a5,70bc <.L10>
    7054:	0000ba97          	auipc	s5,0xb
    7058:	3b4a8a93          	add	s5,s5,948 # 12408 <.LC5>
    705c:	000aa603          	lw	a2,0(s5)
    7060:	004aa683          	lw	a3,4(s5)
    7064:	089030ef          	jal	a8ec <__subdf3>
    7068:	000aa603          	lw	a2,0(s5)
    706c:	004aa683          	lw	a3,4(s5)
    7070:	00050993          	mv	s3,a0
    7074:	00058493          	mv	s1,a1
    7078:	00090513          	mv	a0,s2
    707c:	00040593          	mv	a1,s0
    7080:	27c030ef          	jal	a2fc <__muldf3>
    7084:	0000b797          	auipc	a5,0xb
    7088:	37478793          	add	a5,a5,884 # 123f8 <.LC1>
    708c:	0007a603          	lw	a2,0(a5)
    7090:	0047a683          	lw	a3,4(a5)
    7094:	28c020ef          	jal	9320 <__adddf3>
    7098:	00050613          	mv	a2,a0
    709c:	00058693          	mv	a3,a1
    70a0:	00098513          	mv	a0,s3
    70a4:	00048593          	mv	a1,s1
    70a8:	20d020ef          	jal	9ab4 <__divdf3>
    70ac:	00050b93          	mv	s7,a0
    70b0:	00058413          	mv	s0,a1
    70b4:	00200993          	li	s3,2
    70b8:	d81ff06f          	j	6e38 <.L7>

000070bc <.L10>:
    70bc:	0000b797          	auipc	a5,0xb
    70c0:	35478793          	add	a5,a5,852 # 12410 <.LC6>
    70c4:	00050613          	mv	a2,a0
    70c8:	00058693          	mv	a3,a1
    70cc:	0007a503          	lw	a0,0(a5)
    70d0:	0047a583          	lw	a1,4(a5)
    70d4:	00300993          	li	s3,3
    70d8:	1dd020ef          	jal	9ab4 <__divdf3>
    70dc:	00050b93          	mv	s7,a0
    70e0:	00058413          	mv	s0,a1
    70e4:	d55ff06f          	j	6e38 <.L7>

000070e8 <.L11>:
    70e8:	00399993          	sll	s3,s3,0x3
    70ec:	0000b497          	auipc	s1,0xb
    70f0:	b1c48493          	add	s1,s1,-1252 # 11c08 <atanhi>
    70f4:	013484b3          	add	s1,s1,s3
    70f8:	0204a603          	lw	a2,32(s1)
    70fc:	0244a683          	lw	a3,36(s1)
    7100:	7ec030ef          	jal	a8ec <__subdf3>
    7104:	000b8613          	mv	a2,s7
    7108:	00040693          	mv	a3,s0
    710c:	7e0030ef          	jal	a8ec <__subdf3>
    7110:	00050613          	mv	a2,a0
    7114:	00058693          	mv	a3,a1
    7118:	0004a503          	lw	a0,0(s1)
    711c:	0044a583          	lw	a1,4(s1)
    7120:	7cc030ef          	jal	a8ec <__subdf3>
    7124:	00050b93          	mv	s7,a0
    7128:	00058413          	mv	s0,a1
    712c:	be0a58e3          	bgez	s4,6d1c <.L5>
    7130:	80000437          	lui	s0,0x80000
    7134:	00b44433          	xor	s0,s0,a1
    7138:	be5ff06f          	j	6d1c <.L5>

0000713c <__GI_cos>:
    713c:	fe010113          	add	sp,sp,-32
    7140:	00812c23          	sw	s0,24(sp)
    7144:	80000437          	lui	s0,0x80000
    7148:	fff40713          	add	a4,s0,-1 # 7fffffff <_ebss+0x7ffe9ccf>
    714c:	3fe926b7          	lui	a3,0x3fe92
    7150:	00112e23          	sw	ra,28(sp)
    7154:	00b77733          	and	a4,a4,a1
    7158:	1fb68693          	add	a3,a3,507 # 3fe921fb <_ebss+0x3fe7becb>
    715c:	00e6ee63          	bltu	a3,a4,7178 <.L2>
    7160:	01812403          	lw	s0,24(sp)
    7164:	01c12083          	lw	ra,28(sp)
    7168:	00000613          	li	a2,0
    716c:	00000693          	li	a3,0
    7170:	02010113          	add	sp,sp,32
    7174:	5b10006f          	j	7f24 <__kernel_cos>

00007178 <.L2>:
    7178:	7ff006b7          	lui	a3,0x7ff00
    717c:	02d76063          	bltu	a4,a3,719c <.L3>
    7180:	00050613          	mv	a2,a0
    7184:	00058693          	mv	a3,a1
    7188:	764030ef          	jal	a8ec <__subdf3>

0000718c <.L1>:
    718c:	01c12083          	lw	ra,28(sp)
    7190:	01812403          	lw	s0,24(sp)
    7194:	02010113          	add	sp,sp,32
    7198:	00008067          	ret

0000719c <.L3>:
    719c:	00010613          	mv	a2,sp
    71a0:	784000ef          	jal	7924 <__ieee754_rem_pio2>
    71a4:	00357793          	and	a5,a0,3
    71a8:	00100713          	li	a4,1
    71ac:	00812603          	lw	a2,8(sp)
    71b0:	00c12683          	lw	a3,12(sp)
    71b4:	00012503          	lw	a0,0(sp)
    71b8:	00412583          	lw	a1,4(sp)
    71bc:	00e78c63          	beq	a5,a4,71d4 <.L5>
    71c0:	00200713          	li	a4,2
    71c4:	02e78063          	beq	a5,a4,71e4 <.L6>
    71c8:	02079263          	bnez	a5,71ec <.L7>
    71cc:	559000ef          	jal	7f24 <__kernel_cos>
    71d0:	fbdff06f          	j	718c <.L1>

000071d4 <.L5>:
    71d4:	00100713          	li	a4,1
    71d8:	2b5010ef          	jal	8c8c <__kernel_sin>

000071dc <.L10>:
    71dc:	00b445b3          	xor	a1,s0,a1
    71e0:	fadff06f          	j	718c <.L1>

000071e4 <.L6>:
    71e4:	541000ef          	jal	7f24 <__kernel_cos>
    71e8:	ff5ff06f          	j	71dc <.L10>

000071ec <.L7>:
    71ec:	00100713          	li	a4,1
    71f0:	29d010ef          	jal	8c8c <__kernel_sin>
    71f4:	f99ff06f          	j	718c <.L1>

000071f8 <__GI_fabs>:
    71f8:	00159593          	sll	a1,a1,0x1
    71fc:	00050713          	mv	a4,a0
    7200:	0015d793          	srl	a5,a1,0x1
    7204:	00070513          	mv	a0,a4
    7208:	00078593          	mv	a1,a5
    720c:	00008067          	ret

00007210 <__GI_sin>:
    7210:	fe010113          	add	sp,sp,-32
    7214:	00812c23          	sw	s0,24(sp)
    7218:	80000437          	lui	s0,0x80000
    721c:	fff40713          	add	a4,s0,-1 # 7fffffff <_ebss+0x7ffe9ccf>
    7220:	3fe926b7          	lui	a3,0x3fe92
    7224:	00112e23          	sw	ra,28(sp)
    7228:	00b77733          	and	a4,a4,a1
    722c:	1fb68693          	add	a3,a3,507 # 3fe921fb <_ebss+0x3fe7becb>
    7230:	02e6e063          	bltu	a3,a4,7250 <.L2>
    7234:	01812403          	lw	s0,24(sp)
    7238:	01c12083          	lw	ra,28(sp)
    723c:	00000713          	li	a4,0
    7240:	00000613          	li	a2,0
    7244:	00000693          	li	a3,0
    7248:	02010113          	add	sp,sp,32
    724c:	2410106f          	j	8c8c <__kernel_sin>

00007250 <.L2>:
    7250:	7ff006b7          	lui	a3,0x7ff00
    7254:	02d76063          	bltu	a4,a3,7274 <.L3>
    7258:	00050613          	mv	a2,a0
    725c:	00058693          	mv	a3,a1
    7260:	68c030ef          	jal	a8ec <__subdf3>

00007264 <.L1>:
    7264:	01c12083          	lw	ra,28(sp)
    7268:	01812403          	lw	s0,24(sp)
    726c:	02010113          	add	sp,sp,32
    7270:	00008067          	ret

00007274 <.L3>:
    7274:	00010613          	mv	a2,sp
    7278:	6ac000ef          	jal	7924 <__ieee754_rem_pio2>
    727c:	00357793          	and	a5,a0,3
    7280:	00100713          	li	a4,1
    7284:	00812603          	lw	a2,8(sp)
    7288:	00c12683          	lw	a3,12(sp)
    728c:	00012503          	lw	a0,0(sp)
    7290:	00412583          	lw	a1,4(sp)
    7294:	00e78e63          	beq	a5,a4,72b0 <.L5>
    7298:	00200713          	li	a4,2
    729c:	00e78e63          	beq	a5,a4,72b8 <.L6>
    72a0:	02079463          	bnez	a5,72c8 <.L7>
    72a4:	00100713          	li	a4,1
    72a8:	1e5010ef          	jal	8c8c <__kernel_sin>
    72ac:	fb9ff06f          	j	7264 <.L1>

000072b0 <.L5>:
    72b0:	475000ef          	jal	7f24 <__kernel_cos>
    72b4:	fb1ff06f          	j	7264 <.L1>

000072b8 <.L6>:
    72b8:	00100713          	li	a4,1
    72bc:	1d1010ef          	jal	8c8c <__kernel_sin>

000072c0 <.L10>:
    72c0:	00b445b3          	xor	a1,s0,a1
    72c4:	fa1ff06f          	j	7264 <.L1>

000072c8 <.L7>:
    72c8:	45d000ef          	jal	7f24 <__kernel_cos>
    72cc:	ff5ff06f          	j	72c0 <.L10>

000072d0 <__fcntl_nocancel>:
    72d0:	ff458793          	add	a5,a1,-12 # ffff4 <_ebss+0xe9cc4>
    72d4:	00200713          	li	a4,2
    72d8:	02f76663          	bltu	a4,a5,7304 <.L2>
    72dc:	01900893          	li	a7,25
    72e0:	00000073          	ecall
    72e4:	fffff7b7          	lui	a5,0xfffff
    72e8:	02a7f863          	bgeu	a5,a0,7318 <.L1>
    72ec:	40a00533          	neg	a0,a0
    72f0:	00009797          	auipc	a5,0x9
    72f4:	2e47a783          	lw	a5,740(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    72f8:	00a7a023          	sw	a0,0(a5)

000072fc <.L4>:
    72fc:	fff00513          	li	a0,-1
    7300:	00008067          	ret

00007304 <.L2>:
    7304:	00009797          	auipc	a5,0x9
    7308:	2d07a783          	lw	a5,720(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    730c:	02600713          	li	a4,38
    7310:	00e7a023          	sw	a4,0(a5)
    7314:	fe9ff06f          	j	72fc <.L4>

00007318 <.L1>:
    7318:	00008067          	ret

0000731c <__GI_fcntl>:
    731c:	fd010113          	add	sp,sp,-48
    7320:	02f12223          	sw	a5,36(sp)
    7324:	01810793          	add	a5,sp,24
    7328:	03112623          	sw	a7,44(sp)
    732c:	00c12c23          	sw	a2,24(sp)
    7330:	00d12e23          	sw	a3,28(sp)
    7334:	02e12023          	sw	a4,32(sp)
    7338:	03012423          	sw	a6,40(sp)
    733c:	00f12623          	sw	a5,12(sp)
    7340:	01900893          	li	a7,25
    7344:	00000073          	ecall
    7348:	fffff7b7          	lui	a5,0xfffff
    734c:	00a7fc63          	bgeu	a5,a0,7364 <.L5>
    7350:	40a00533          	neg	a0,a0
    7354:	00009797          	auipc	a5,0x9
    7358:	2807a783          	lw	a5,640(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    735c:	00a7a023          	sw	a0,0(a5)
    7360:	fff00513          	li	a0,-1

00007364 <.L5>:
    7364:	03010113          	add	sp,sp,48
    7368:	00008067          	ret

0000736c <__syscall_rt_sigaction>:
    736c:	08600893          	li	a7,134
    7370:	00000073          	ecall
    7374:	fffff7b7          	lui	a5,0xfffff
    7378:	00a7fc63          	bgeu	a5,a0,7390 <.L1>
    737c:	40a00533          	neg	a0,a0
    7380:	00009797          	auipc	a5,0x9
    7384:	2547a783          	lw	a5,596(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    7388:	00a7a023          	sw	a0,0(a5)
    738c:	fff00513          	li	a0,-1

00007390 <.L1>:
    7390:	00008067          	ret

00007394 <__GI__exit>:
    7394:	00050713          	mv	a4,a0
    7398:	fffff637          	lui	a2,0xfffff
    739c:	00009697          	auipc	a3,0x9
    73a0:	2386a683          	lw	a3,568(a3) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>

000073a4 <.L2>:
    73a4:	00070513          	mv	a0,a4
    73a8:	05d00893          	li	a7,93
    73ac:	00000073          	ecall
    73b0:	fea67ae3          	bgeu	a2,a0,73a4 <.L2>
    73b4:	40a007b3          	neg	a5,a0
    73b8:	00f6a023          	sw	a5,0(a3)
    73bc:	fe9ff06f          	j	73a4 <.L2>

000073c0 <__GI_fstat64>:
    73c0:	05000893          	li	a7,80
    73c4:	00000073          	ecall
    73c8:	fffff7b7          	lui	a5,0xfffff
    73cc:	00a7fc63          	bgeu	a5,a0,73e4 <.L1>
    73d0:	40a00533          	neg	a0,a0
    73d4:	00009797          	auipc	a5,0x9
    73d8:	2007a783          	lw	a5,512(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    73dc:	00a7a023          	sw	a0,0(a5)
    73e0:	fff00513          	li	a0,-1

000073e4 <.L1>:
    73e4:	00008067          	ret

000073e8 <__getdents>:
    73e8:	fd010113          	add	sp,sp,-48
    73ec:	01812423          	sw	s8,8(sp)
    73f0:	00050c13          	mv	s8,a0
    73f4:	00060513          	mv	a0,a2
    73f8:	01312e23          	sw	s3,28(sp)
    73fc:	01412c23          	sw	s4,24(sp)
    7400:	01512a23          	sw	s5,20(sp)
    7404:	00060a13          	mv	s4,a2
    7408:	00058a93          	mv	s5,a1
    740c:	02112623          	sw	ra,44(sp)
    7410:	02812423          	sw	s0,40(sp)
    7414:	02912223          	sw	s1,36(sp)
    7418:	03212023          	sw	s2,32(sp)
    741c:	01612823          	sw	s6,16(sp)
    7420:	01712623          	sw	s7,12(sp)
    7424:	01912223          	sw	s9,4(sp)
    7428:	ec9fb0ef          	jal	32f0 <malloc>
    742c:	00050993          	mv	s3,a0
    7430:	00098593          	mv	a1,s3
    7434:	000c0513          	mv	a0,s8
    7438:	000a0613          	mv	a2,s4
    743c:	03d00893          	li	a7,61
    7440:	00000073          	ecall
    7444:	fffff737          	lui	a4,0xfffff
    7448:	0ea77c63          	bgeu	a4,a0,7540 <.L9>
    744c:	40a007b3          	neg	a5,a0
    7450:	00009717          	auipc	a4,0x9
    7454:	18472703          	lw	a4,388(a4) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    7458:	00098513          	mv	a0,s3
    745c:	00f72023          	sw	a5,0(a4)
    7460:	8a8fc0ef          	jal	3508 <free>

00007464 <.L3>:
    7464:	fff00513          	li	a0,-1
    7468:	0a40006f          	j	750c <.L1>

0000746c <.L5>:
    746c:	00098513          	mv	a0,s3
    7470:	898fc0ef          	jal	3508 <free>
    7474:	00009797          	auipc	a5,0x9
    7478:	1607a783          	lw	a5,352(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    747c:	01600713          	li	a4,22
    7480:	00e7a023          	sw	a4,0(a5)
    7484:	fe1ff06f          	j	7464 <.L3>

00007488 <.L4>:
    7488:	00492783          	lw	a5,4(s2)
    748c:	00892b03          	lw	s6,8(s2)
    7490:	00c92b83          	lw	s7,12(s2)
    7494:	00092703          	lw	a4,0(s2)
    7498:	00f42223          	sw	a5,4(s0)
    749c:	01294783          	lbu	a5,18(s2)
    74a0:	00e42023          	sw	a4,0(s0)
    74a4:	01642423          	sw	s6,8(s0)
    74a8:	00f40923          	sb	a5,18(s0)
    74ac:	01742623          	sw	s7,12(s0)
    74b0:	00d41823          	sh	a3,16(s0)
    74b4:	01390593          	add	a1,s2,19
    74b8:	01340513          	add	a0,s0,19
    74bc:	fed60613          	add	a2,a2,-19 # ffffefed <_ebss+0xfffe8cbd>
    74c0:	e30fb0ef          	jal	2af0 <__GI_memcpy>
    74c4:	01095783          	lhu	a5,16(s2)
    74c8:	000c8413          	mv	s0,s9
    74cc:	00f90933          	add	s2,s2,a5

000074d0 <.L2>:
    74d0:	02997863          	bgeu	s2,s1,7500 <.L8>
    74d4:	01095603          	lhu	a2,16(s2)
    74d8:	00760693          	add	a3,a2,7
    74dc:	ff86f693          	and	a3,a3,-8
    74e0:	00d40cb3          	add	s9,s0,a3
    74e4:	fb9a72e3          	bgeu	s4,s9,7488 <.L4>
    74e8:	00000693          	li	a3,0
    74ec:	000b0593          	mv	a1,s6
    74f0:	000b8613          	mv	a2,s7
    74f4:	000c0513          	mv	a0,s8
    74f8:	551010ef          	jal	9248 <__GI_lseek64>
    74fc:	f75408e3          	beq	s0,s5,746c <.L5>

00007500 <.L8>:
    7500:	00098513          	mv	a0,s3
    7504:	804fc0ef          	jal	3508 <free>
    7508:	41540533          	sub	a0,s0,s5

0000750c <.L1>:
    750c:	02c12083          	lw	ra,44(sp)
    7510:	02812403          	lw	s0,40(sp)
    7514:	02412483          	lw	s1,36(sp)
    7518:	02012903          	lw	s2,32(sp)
    751c:	01c12983          	lw	s3,28(sp)
    7520:	01812a03          	lw	s4,24(sp)
    7524:	01412a83          	lw	s5,20(sp)
    7528:	01012b03          	lw	s6,16(sp)
    752c:	00c12b83          	lw	s7,12(sp)
    7530:	00812c03          	lw	s8,8(sp)
    7534:	00412c83          	lw	s9,4(sp)
    7538:	03010113          	add	sp,sp,48
    753c:	00008067          	ret

00007540 <.L9>:
    7540:	00098913          	mv	s2,s3
    7544:	000a8413          	mv	s0,s5
    7548:	fff00b13          	li	s6,-1
    754c:	fff00b93          	li	s7,-1
    7550:	00a984b3          	add	s1,s3,a0
    7554:	014a8a33          	add	s4,s5,s4
    7558:	f79ff06f          	j	74d0 <.L2>

0000755c <__GI_fseek>:
    755c:	00060693          	mv	a3,a2
    7560:	41f5d613          	sra	a2,a1,0x1f
    7564:	0040006f          	j	7568 <__GI_fseeko64>

00007568 <__GI_fseeko64>:
    7568:	fd010113          	add	sp,sp,-48
    756c:	02112623          	sw	ra,44(sp)
    7570:	02812423          	sw	s0,40(sp)
    7574:	00b12c23          	sw	a1,24(sp)
    7578:	00c12e23          	sw	a2,28(sp)
    757c:	00200793          	li	a5,2
    7580:	02d7f463          	bgeu	a5,a3,75a8 <.L2>
    7584:	00009797          	auipc	a5,0x9
    7588:	0507a783          	lw	a5,80(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    758c:	01600713          	li	a4,22
    7590:	00e7a023          	sw	a4,0(a5)

00007594 <.L3>:
    7594:	fff00513          	li	a0,-1

00007598 <.L1>:
    7598:	02c12083          	lw	ra,44(sp)
    759c:	02812403          	lw	s0,40(sp)
    75a0:	03010113          	add	sp,sp,48
    75a4:	00008067          	ret

000075a8 <.L2>:
    75a8:	00055783          	lhu	a5,0(a0)
    75ac:	00050413          	mv	s0,a0
    75b0:	00068613          	mv	a2,a3
    75b4:	0407f793          	and	a5,a5,64
    75b8:	06079863          	bnez	a5,7628 <.L4>

000075bc <.L7>:
    75bc:	00100793          	li	a5,1
    75c0:	00f61e63          	bne	a2,a5,75dc <.L5>
    75c4:	01810593          	add	a1,sp,24
    75c8:	00040513          	mv	a0,s0
    75cc:	00c12623          	sw	a2,12(sp)
    75d0:	120000ef          	jal	76f0 <__stdio_adjust_position>
    75d4:	00c12603          	lw	a2,12(sp)
    75d8:	fa054ee3          	bltz	a0,7594 <.L3>

000075dc <.L5>:
    75dc:	00442703          	lw	a4,4(s0)
    75e0:	ffe00793          	li	a5,-2
    75e4:	04f71c63          	bne	a4,a5,763c <.L20>
    75e8:	03042783          	lw	a5,48(s0)
    75ec:	fa0784e3          	beqz	a5,7594 <.L3>
    75f0:	02442503          	lw	a0,36(s0)
    75f4:	01810593          	add	a1,sp,24
    75f8:	000780e7          	jalr	a5

000075fc <.L12>:
    75fc:	f8054ce3          	bltz	a0,7594 <.L3>
    7600:	00045783          	lhu	a5,0(s0)
    7604:	00000513          	li	a0,0
    7608:	fb87f793          	and	a5,a5,-72
    760c:	00f41023          	sh	a5,0(s0)
    7610:	00842783          	lw	a5,8(s0)
    7614:	00f42823          	sw	a5,16(s0)
    7618:	00f42a23          	sw	a5,20(s0)
    761c:	00f42c23          	sw	a5,24(s0)
    7620:	00f42e23          	sw	a5,28(s0)
    7624:	f75ff06f          	j	7598 <.L1>

00007628 <.L4>:
    7628:	00d12623          	sw	a3,12(sp)
    762c:	b6cfa0ef          	jal	1998 <__stdio_wcommit>
    7630:	00c12603          	lw	a2,12(sp)
    7634:	f80504e3          	beqz	a0,75bc <.L7>
    7638:	f5dff06f          	j	7594 <.L3>

0000763c <.L20>:
    763c:	01810593          	add	a1,sp,24
    7640:	00040513          	mv	a0,s0
    7644:	1ec000ef          	jal	7830 <__stdio_seek>
    7648:	fb5ff06f          	j	75fc <.L12>

0000764c <__stdio_READ>:
    764c:	00055783          	lhu	a5,0(a0)
    7650:	0047f793          	and	a5,a5,4
    7654:	08079a63          	bnez	a5,76e8 <.L13>
    7658:	ff010113          	add	sp,sp,-16
    765c:	800007b7          	lui	a5,0x80000
    7660:	00812423          	sw	s0,8(sp)
    7664:	00912223          	sw	s1,4(sp)
    7668:	00112623          	sw	ra,12(sp)
    766c:	fff78793          	add	a5,a5,-1 # 7fffffff <_ebss+0x7ffe9ccf>
    7670:	00050413          	mv	s0,a0
    7674:	00060493          	mv	s1,a2
    7678:	00c7f463          	bgeu	a5,a2,7680 <.L3>
    767c:	00078493          	mv	s1,a5

00007680 <.L3>:
    7680:	00442503          	lw	a0,4(s0)
    7684:	ffe00793          	li	a5,-2
    7688:	04f51663          	bne	a0,a5,76d4 <.L4>
    768c:	02842783          	lw	a5,40(s0)
    7690:	02078063          	beqz	a5,76b0 <.L5>
    7694:	02442503          	lw	a0,36(s0)
    7698:	00048613          	mv	a2,s1
    769c:	000780e7          	jalr	a5

000076a0 <.L6>:
    76a0:	04a04063          	bgtz	a0,76e0 <.L7>
    76a4:	00045783          	lhu	a5,0(s0)
    76a8:	0047e793          	or	a5,a5,4
    76ac:	00050663          	beqz	a0,76b8 <.L17>

000076b0 <.L5>:
    76b0:	00045783          	lhu	a5,0(s0)
    76b4:	0087e793          	or	a5,a5,8

000076b8 <.L17>:
    76b8:	00f41023          	sh	a5,0(s0)
    76bc:	00000513          	li	a0,0

000076c0 <.L8>:
    76c0:	00c12083          	lw	ra,12(sp)
    76c4:	00812403          	lw	s0,8(sp)
    76c8:	00412483          	lw	s1,4(sp)
    76cc:	01010113          	add	sp,sp,16
    76d0:	00008067          	ret

000076d4 <.L4>:
    76d4:	00048613          	mv	a2,s1
    76d8:	349010ef          	jal	9220 <__GI_read>
    76dc:	fc5ff06f          	j	76a0 <.L6>

000076e0 <.L7>:
    76e0:	fea4f0e3          	bgeu	s1,a0,76c0 <.L8>
    76e4:	190000ef          	jal	7874 <__GI_abort>

000076e8 <.L13>:
    76e8:	00000513          	li	a0,0
    76ec:	00008067          	ret

000076f0 <__stdio_adjust_position>:
    76f0:	00055783          	lhu	a5,0(a0)
    76f4:	00000713          	li	a4,0
    76f8:	0037f693          	and	a3,a5,3
    76fc:	00068463          	beqz	a3,7704 <.L2>
    7700:	fff68713          	add	a4,a3,-1

00007704 <.L2>:
    7704:	0407f793          	and	a5,a5,64
    7708:	06078063          	beqz	a5,7768 <.L3>
    770c:	00852783          	lw	a5,8(a0)

00007710 <.L4>:
    7710:	01052683          	lw	a3,16(a0)
    7714:	0045a603          	lw	a2,4(a1)
    7718:	40d78533          	sub	a0,a5,a3
    771c:	00e50533          	add	a0,a0,a4
    7720:	0005a703          	lw	a4,0(a1)
    7724:	41f55793          	sra	a5,a0,0x1f
    7728:	40f607b3          	sub	a5,a2,a5
    772c:	40a706b3          	sub	a3,a4,a0
    7730:	00d73833          	sltu	a6,a4,a3
    7734:	410787b3          	sub	a5,a5,a6
    7738:	00d5a023          	sw	a3,0(a1)
    773c:	00f5a223          	sw	a5,4(a1)
    7740:	00f64663          	blt	a2,a5,774c <.L9>
    7744:	00c79663          	bne	a5,a2,7750 <.L5>
    7748:	00d77463          	bgeu	a4,a3,7750 <.L5>

0000774c <.L9>:
    774c:	40a00533          	neg	a0,a0

00007750 <.L5>:
    7750:	00055a63          	bgez	a0,7764 <.L1>
    7754:	00009797          	auipc	a5,0x9
    7758:	e807a783          	lw	a5,-384(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    775c:	04b00713          	li	a4,75
    7760:	00e7a023          	sw	a4,0(a5)

00007764 <.L1>:
    7764:	00008067          	ret

00007768 <.L3>:
    7768:	01452783          	lw	a5,20(a0)
    776c:	fa5ff06f          	j	7710 <.L4>

00007770 <__stdio_rfill>:
    7770:	00852583          	lw	a1,8(a0)
    7774:	00c52603          	lw	a2,12(a0)
    7778:	ff010113          	add	sp,sp,-16
    777c:	00812423          	sw	s0,8(sp)
    7780:	40b60633          	sub	a2,a2,a1
    7784:	00112623          	sw	ra,12(sp)
    7788:	00050413          	mv	s0,a0
    778c:	ec1ff0ef          	jal	764c <__stdio_READ>
    7790:	00842783          	lw	a5,8(s0)
    7794:	00c12083          	lw	ra,12(sp)
    7798:	00f42823          	sw	a5,16(s0)
    779c:	00a787b3          	add	a5,a5,a0
    77a0:	00f42a23          	sw	a5,20(s0)
    77a4:	00812403          	lw	s0,8(sp)
    77a8:	01010113          	add	sp,sp,16
    77ac:	00008067          	ret

000077b0 <__stdio_trans2r>:
    77b0:	00055783          	lhu	a5,0(a0)
    77b4:	ff010113          	add	sp,sp,-16
    77b8:	00812423          	sw	s0,8(sp)
    77bc:	00112623          	sw	ra,12(sp)
    77c0:	0107f713          	and	a4,a5,16
    77c4:	00050413          	mv	s0,a0
    77c8:	02070a63          	beqz	a4,77fc <.L2>
    77cc:	00009797          	auipc	a5,0x9
    77d0:	e087a783          	lw	a5,-504(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    77d4:	00900713          	li	a4,9
    77d8:	00e7a023          	sw	a4,0(a5)

000077dc <.L3>:
    77dc:	00045783          	lhu	a5,0(s0)
    77e0:	fff00513          	li	a0,-1
    77e4:	0087e793          	or	a5,a5,8

000077e8 <.L4>:
    77e8:	00c12083          	lw	ra,12(sp)
    77ec:	00f41023          	sh	a5,0(s0)
    77f0:	00812403          	lw	s0,8(sp)
    77f4:	01010113          	add	sp,sp,16
    77f8:	00008067          	ret

000077fc <.L2>:
    77fc:	0407f793          	and	a5,a5,64
    7800:	02078063          	beqz	a5,7820 <.L5>
    7804:	994fa0ef          	jal	1998 <__stdio_wcommit>
    7808:	fc051ae3          	bnez	a0,77dc <.L3>
    780c:	00842783          	lw	a5,8(s0)
    7810:	00f42e23          	sw	a5,28(s0)
    7814:	00045783          	lhu	a5,0(s0)
    7818:	fbf7f793          	and	a5,a5,-65
    781c:	00f41023          	sh	a5,0(s0)

00007820 <.L5>:
    7820:	00045783          	lhu	a5,0(s0)
    7824:	00000513          	li	a0,0
    7828:	0017e793          	or	a5,a5,1
    782c:	fbdff06f          	j	77e8 <.L4>

00007830 <__stdio_seek>:
    7830:	ff010113          	add	sp,sp,-16
    7834:	00812423          	sw	s0,8(sp)
    7838:	00058413          	mv	s0,a1
    783c:	00060693          	mv	a3,a2
    7840:	0005a583          	lw	a1,0(a1)
    7844:	00442603          	lw	a2,4(s0)
    7848:	00452503          	lw	a0,4(a0)
    784c:	00112623          	sw	ra,12(sp)
    7850:	1f9010ef          	jal	9248 <__GI_lseek64>
    7854:	0005c863          	bltz	a1,7864 <.L1>
    7858:	00a42023          	sw	a0,0(s0)
    785c:	00b42223          	sw	a1,4(s0)
    7860:	00000513          	li	a0,0

00007864 <.L1>:
    7864:	00c12083          	lw	ra,12(sp)
    7868:	00812403          	lw	s0,8(sp)
    786c:	01010113          	add	sp,sp,16
    7870:	00008067          	ret

00007874 <__GI_abort>:
    7874:	fd010113          	add	sp,sp,-48
    7878:	02000793          	li	a5,32
    787c:	00000613          	li	a2,0
    7880:	00410593          	add	a1,sp,4
    7884:	00100513          	li	a0,1
    7888:	02812423          	sw	s0,40(sp)
    788c:	00f12223          	sw	a5,4(sp)
    7890:	02112623          	sw	ra,44(sp)
    7894:	02912223          	sw	s1,36(sp)
    7898:	00012423          	sw	zero,8(sp)
    789c:	0000f417          	auipc	s0,0xf
    78a0:	92840413          	add	s0,s0,-1752 # 161c4 <been_there_done_that>
    78a4:	ab9fc0ef          	jal	435c <__GI_sigprocmask>
    78a8:	00042783          	lw	a5,0(s0)
    78ac:	00079a63          	bnez	a5,78c0 <.L2>
    78b0:	00100793          	li	a5,1
    78b4:	00f42023          	sw	a5,0(s0)

000078b8 <.L3>:
    78b8:	00600513          	li	a0,6
    78bc:	1ed010ef          	jal	92a8 <__GI_raise>

000078c0 <.L2>:
    78c0:	00042783          	lw	a5,0(s0)
    78c4:	00100713          	li	a4,1
    78c8:	04e79063          	bne	a5,a4,7908 <.L4>
    78cc:	00c10493          	add	s1,sp,12
    78d0:	00200793          	li	a5,2
    78d4:	01400613          	li	a2,20
    78d8:	00000593          	li	a1,0
    78dc:	00048513          	mv	a0,s1
    78e0:	00f42023          	sw	a5,0(s0)
    78e4:	cb4fb0ef          	jal	2d98 <__GI_memset>
    78e8:	fff00793          	li	a5,-1
    78ec:	00000613          	li	a2,0
    78f0:	00048593          	mv	a1,s1
    78f4:	00600513          	li	a0,6
    78f8:	00f12c23          	sw	a5,24(sp)
    78fc:	00f12e23          	sw	a5,28(sp)
    7900:	c5dfe0ef          	jal	655c <__GI_sigaction>
    7904:	fb5ff06f          	j	78b8 <.L3>

00007908 <.L4>:
    7908:	ffe78793          	add	a5,a5,-2
    790c:	00f76a63          	bltu	a4,a5,7920 <.L5>
    7910:	00400793          	li	a5,4
    7914:	07f00513          	li	a0,127
    7918:	00f42023          	sw	a5,0(s0)
    791c:	a79ff0ef          	jal	7394 <__GI__exit>

00007920 <.L5>:
    7920:	0000006f          	j	7920 <.L5>

00007924 <__ieee754_rem_pio2>:
    7924:	fa010113          	add	sp,sp,-96
    7928:	04912a23          	sw	s1,84(sp)
    792c:	3fe926b7          	lui	a3,0x3fe92
    7930:	00159493          	sll	s1,a1,0x1
    7934:	04812c23          	sw	s0,88(sp)
    7938:	04112e23          	sw	ra,92(sp)
    793c:	05212823          	sw	s2,80(sp)
    7940:	05312623          	sw	s3,76(sp)
    7944:	05412423          	sw	s4,72(sp)
    7948:	05512223          	sw	s5,68(sp)
    794c:	05612023          	sw	s6,64(sp)
    7950:	03712e23          	sw	s7,60(sp)
    7954:	03812c23          	sw	s8,56(sp)
    7958:	03912a23          	sw	s9,52(sp)
    795c:	03a12823          	sw	s10,48(sp)
    7960:	03b12623          	sw	s11,44(sp)
    7964:	0014d493          	srl	s1,s1,0x1
    7968:	1fb68693          	add	a3,a3,507 # 3fe921fb <_ebss+0x3fe7becb>
    796c:	00060413          	mv	s0,a2
    7970:	0296e263          	bltu	a3,s1,7994 <.L2>
    7974:	00000713          	li	a4,0
    7978:	00000793          	li	a5,0
    797c:	00a42023          	sw	a0,0(s0)
    7980:	00b42223          	sw	a1,4(s0)
    7984:	00e42423          	sw	a4,8(s0)
    7988:	00f42623          	sw	a5,12(s0)

0000798c <.L3>:
    798c:	00000913          	li	s2,0
    7990:	0b40006f          	j	7a44 <.L1>

00007994 <.L2>:
    7994:	4002e6b7          	lui	a3,0x4002e
    7998:	97b68693          	add	a3,a3,-1669 # 4002d97b <_ebss+0x4001764b>
    799c:	00058c93          	mv	s9,a1
    79a0:	1696ee63          	bltu	a3,s1,7b1c <.L4>
    79a4:	0000b797          	auipc	a5,0xb
    79a8:	acc78793          	add	a5,a5,-1332 # 12470 <.LC0>
    79ac:	0cb05c63          	blez	a1,7a84 <.L5>
    79b0:	0007a603          	lw	a2,0(a5)
    79b4:	0047a683          	lw	a3,4(a5)
    79b8:	0000ba97          	auipc	s5,0xb
    79bc:	ac0a8a93          	add	s5,s5,-1344 # 12478 <.LC1>
    79c0:	72d020ef          	jal	a8ec <__subdf3>
    79c4:	3ff927b7          	lui	a5,0x3ff92
    79c8:	1fb78793          	add	a5,a5,507 # 3ff921fb <_ebss+0x3ff7becb>
    79cc:	00050a13          	mv	s4,a0
    79d0:	00058993          	mv	s3,a1
    79d4:	02f49463          	bne	s1,a5,79fc <.L22>
    79d8:	0000b797          	auipc	a5,0xb
    79dc:	aa878793          	add	a5,a5,-1368 # 12480 <.LC2>
    79e0:	0007a603          	lw	a2,0(a5)
    79e4:	0047a683          	lw	a3,4(a5)
    79e8:	0000ba97          	auipc	s5,0xb
    79ec:	aa0a8a93          	add	s5,s5,-1376 # 12488 <.LC3>
    79f0:	6fd020ef          	jal	a8ec <__subdf3>
    79f4:	00050a13          	mv	s4,a0
    79f8:	00058993          	mv	s3,a1

000079fc <.L22>:
    79fc:	000aa603          	lw	a2,0(s5)
    7a00:	004aa683          	lw	a3,4(s5)
    7a04:	6e9020ef          	jal	a8ec <__subdf3>
    7a08:	00050913          	mv	s2,a0
    7a0c:	00050613          	mv	a2,a0
    7a10:	00058693          	mv	a3,a1
    7a14:	00058493          	mv	s1,a1
    7a18:	000a0513          	mv	a0,s4
    7a1c:	00098593          	mv	a1,s3
    7a20:	6cd020ef          	jal	a8ec <__subdf3>
    7a24:	000aa603          	lw	a2,0(s5)
    7a28:	004aa683          	lw	a3,4(s5)
    7a2c:	6c1020ef          	jal	a8ec <__subdf3>
    7a30:	00a42423          	sw	a0,8(s0)
    7a34:	01242023          	sw	s2,0(s0)
    7a38:	00942223          	sw	s1,4(s0)
    7a3c:	00b42623          	sw	a1,12(s0)
    7a40:	00100913          	li	s2,1

00007a44 <.L1>:
    7a44:	05c12083          	lw	ra,92(sp)
    7a48:	05812403          	lw	s0,88(sp)
    7a4c:	05412483          	lw	s1,84(sp)
    7a50:	04c12983          	lw	s3,76(sp)
    7a54:	04812a03          	lw	s4,72(sp)
    7a58:	04412a83          	lw	s5,68(sp)
    7a5c:	04012b03          	lw	s6,64(sp)
    7a60:	03c12b83          	lw	s7,60(sp)
    7a64:	03812c03          	lw	s8,56(sp)
    7a68:	03412c83          	lw	s9,52(sp)
    7a6c:	03012d03          	lw	s10,48(sp)
    7a70:	02c12d83          	lw	s11,44(sp)
    7a74:	00090513          	mv	a0,s2
    7a78:	05012903          	lw	s2,80(sp)
    7a7c:	06010113          	add	sp,sp,96
    7a80:	00008067          	ret

00007a84 <.L5>:
    7a84:	0007a603          	lw	a2,0(a5)
    7a88:	0047a683          	lw	a3,4(a5)
    7a8c:	0000ba97          	auipc	s5,0xb
    7a90:	9eca8a93          	add	s5,s5,-1556 # 12478 <.LC1>
    7a94:	08d010ef          	jal	9320 <__adddf3>
    7a98:	3ff927b7          	lui	a5,0x3ff92
    7a9c:	1fb78793          	add	a5,a5,507 # 3ff921fb <_ebss+0x3ff7becb>
    7aa0:	00050a13          	mv	s4,a0
    7aa4:	00058993          	mv	s3,a1
    7aa8:	02f49463          	bne	s1,a5,7ad0 <.L23>
    7aac:	0000b797          	auipc	a5,0xb
    7ab0:	9d478793          	add	a5,a5,-1580 # 12480 <.LC2>
    7ab4:	0007a603          	lw	a2,0(a5)
    7ab8:	0047a683          	lw	a3,4(a5)
    7abc:	0000ba97          	auipc	s5,0xb
    7ac0:	9cca8a93          	add	s5,s5,-1588 # 12488 <.LC3>
    7ac4:	05d010ef          	jal	9320 <__adddf3>
    7ac8:	00050a13          	mv	s4,a0
    7acc:	00058993          	mv	s3,a1

00007ad0 <.L23>:
    7ad0:	000aa603          	lw	a2,0(s5)
    7ad4:	004aa683          	lw	a3,4(s5)
    7ad8:	049010ef          	jal	9320 <__adddf3>
    7adc:	00050913          	mv	s2,a0
    7ae0:	00050613          	mv	a2,a0
    7ae4:	00058693          	mv	a3,a1
    7ae8:	00058493          	mv	s1,a1
    7aec:	000a0513          	mv	a0,s4
    7af0:	00098593          	mv	a1,s3
    7af4:	5f9020ef          	jal	a8ec <__subdf3>
    7af8:	000aa603          	lw	a2,0(s5)
    7afc:	004aa683          	lw	a3,4(s5)
    7b00:	021010ef          	jal	9320 <__adddf3>
    7b04:	00a42423          	sw	a0,8(s0)
    7b08:	01242023          	sw	s2,0(s0)
    7b0c:	00942223          	sw	s1,4(s0)
    7b10:	00b42623          	sw	a1,12(s0)
    7b14:	fff00913          	li	s2,-1
    7b18:	f2dff06f          	j	7a44 <.L1>

00007b1c <.L4>:
    7b1c:	413926b7          	lui	a3,0x41392
    7b20:	1fb68693          	add	a3,a3,507 # 413921fb <_ebss+0x4137becb>
    7b24:	2c96ea63          	bltu	a3,s1,7df8 <.L11>
    7b28:	ed0ff0ef          	jal	71f8 <__GI_fabs>
    7b2c:	0000b797          	auipc	a5,0xb
    7b30:	96478793          	add	a5,a5,-1692 # 12490 <.LC4>
    7b34:	0007a603          	lw	a2,0(a5)
    7b38:	0047a683          	lw	a3,4(a5)
    7b3c:	00050a13          	mv	s4,a0
    7b40:	00058993          	mv	s3,a1
    7b44:	7b8020ef          	jal	a2fc <__muldf3>
    7b48:	0000b797          	auipc	a5,0xb
    7b4c:	95078793          	add	a5,a5,-1712 # 12498 <.LC2>
    7b50:	0007a603          	lw	a2,0(a5)
    7b54:	0047a683          	lw	a3,4(a5)
    7b58:	7c8010ef          	jal	9320 <__adddf3>
    7b5c:	538030ef          	jal	b094 <__fixdfsi>
    7b60:	00050913          	mv	s2,a0
    7b64:	5b0030ef          	jal	b114 <__floatsidf>
    7b68:	0000b797          	auipc	a5,0xb
    7b6c:	90878793          	add	a5,a5,-1784 # 12470 <.LC0>
    7b70:	0007a603          	lw	a2,0(a5)
    7b74:	0047a683          	lw	a3,4(a5)
    7b78:	00050c13          	mv	s8,a0
    7b7c:	00058b93          	mv	s7,a1
    7b80:	77c020ef          	jal	a2fc <__muldf3>
    7b84:	00050613          	mv	a2,a0
    7b88:	00058693          	mv	a3,a1
    7b8c:	000a0513          	mv	a0,s4
    7b90:	00098593          	mv	a1,s3
    7b94:	559020ef          	jal	a8ec <__subdf3>
    7b98:	0000b797          	auipc	a5,0xb
    7b9c:	8e078793          	add	a5,a5,-1824 # 12478 <.LC1>
    7ba0:	0007a603          	lw	a2,0(a5)
    7ba4:	0047a683          	lw	a3,4(a5)
    7ba8:	00050b13          	mv	s6,a0
    7bac:	00058a93          	mv	s5,a1
    7bb0:	000c0513          	mv	a0,s8
    7bb4:	000b8593          	mv	a1,s7
    7bb8:	744020ef          	jal	a2fc <__muldf3>
    7bbc:	00050613          	mv	a2,a0
    7bc0:	00058693          	mv	a3,a1
    7bc4:	00050a13          	mv	s4,a0
    7bc8:	00058993          	mv	s3,a1
    7bcc:	000b0513          	mv	a0,s6
    7bd0:	000a8593          	mv	a1,s5
    7bd4:	519020ef          	jal	a8ec <__subdf3>
    7bd8:	01f00793          	li	a5,31
    7bdc:	0327c063          	blt	a5,s2,7bfc <.L12>
    7be0:	fff90713          	add	a4,s2,-1
    7be4:	00271713          	sll	a4,a4,0x2
    7be8:	0000a797          	auipc	a5,0xa
    7bec:	06078793          	add	a5,a5,96 # 11c48 <npio2_hw>
    7bf0:	00e787b3          	add	a5,a5,a4
    7bf4:	0007a783          	lw	a5,0(a5)
    7bf8:	00979e63          	bne	a5,s1,7c14 <.L13>

00007bfc <.L12>:
    7bfc:	0145d793          	srl	a5,a1,0x14
    7c00:	4144d493          	sra	s1,s1,0x14
    7c04:	7ff7f793          	and	a5,a5,2047
    7c08:	40f487b3          	sub	a5,s1,a5
    7c0c:	01000713          	li	a4,16
    7c10:	04f74e63          	blt	a4,a5,7c6c <.L14>

00007c14 <.L13>:
    7c14:	00a42023          	sw	a0,0(s0)
    7c18:	00b42223          	sw	a1,4(s0)

00007c1c <.L15>:
    7c1c:	00042703          	lw	a4,0(s0)
    7c20:	00442483          	lw	s1,4(s0)
    7c24:	000b0513          	mv	a0,s6
    7c28:	00070613          	mv	a2,a4
    7c2c:	00048693          	mv	a3,s1
    7c30:	000a8593          	mv	a1,s5
    7c34:	4b9020ef          	jal	a8ec <__subdf3>
    7c38:	000a0613          	mv	a2,s4
    7c3c:	00098693          	mv	a3,s3
    7c40:	4ad020ef          	jal	a8ec <__subdf3>
    7c44:	00a42423          	sw	a0,8(s0)
    7c48:	00b42623          	sw	a1,12(s0)
    7c4c:	de0cdce3          	bgez	s9,7a44 <.L1>
    7c50:	800007b7          	lui	a5,0x80000
    7c54:	0097c4b3          	xor	s1,a5,s1
    7c58:	00942223          	sw	s1,4(s0)
    7c5c:	00b7c7b3          	xor	a5,a5,a1

00007c60 <.L24>:
    7c60:	00f42623          	sw	a5,12(s0)
    7c64:	41200933          	neg	s2,s2
    7c68:	dddff06f          	j	7a44 <.L1>

00007c6c <.L14>:
    7c6c:	0000b797          	auipc	a5,0xb
    7c70:	81478793          	add	a5,a5,-2028 # 12480 <.LC2>
    7c74:	0007a603          	lw	a2,0(a5)
    7c78:	0047a683          	lw	a3,4(a5)
    7c7c:	000c0513          	mv	a0,s8
    7c80:	000b8593          	mv	a1,s7
    7c84:	678020ef          	jal	a2fc <__muldf3>
    7c88:	00050a13          	mv	s4,a0
    7c8c:	00058993          	mv	s3,a1
    7c90:	00050613          	mv	a2,a0
    7c94:	00058693          	mv	a3,a1
    7c98:	000b0513          	mv	a0,s6
    7c9c:	000a8593          	mv	a1,s5
    7ca0:	44d020ef          	jal	a8ec <__subdf3>
    7ca4:	00050613          	mv	a2,a0
    7ca8:	00058693          	mv	a3,a1
    7cac:	00050d93          	mv	s11,a0
    7cb0:	00058d13          	mv	s10,a1
    7cb4:	000b0513          	mv	a0,s6
    7cb8:	000a8593          	mv	a1,s5
    7cbc:	431020ef          	jal	a8ec <__subdf3>
    7cc0:	000a0613          	mv	a2,s4
    7cc4:	00098693          	mv	a3,s3
    7cc8:	425020ef          	jal	a8ec <__subdf3>
    7ccc:	0000a797          	auipc	a5,0xa
    7cd0:	7bc78793          	add	a5,a5,1980 # 12488 <.LC3>
    7cd4:	0007a603          	lw	a2,0(a5)
    7cd8:	0047a683          	lw	a3,4(a5)
    7cdc:	00050a13          	mv	s4,a0
    7ce0:	00058993          	mv	s3,a1
    7ce4:	000c0513          	mv	a0,s8
    7ce8:	000b8593          	mv	a1,s7
    7cec:	610020ef          	jal	a2fc <__muldf3>
    7cf0:	000a0613          	mv	a2,s4
    7cf4:	00098693          	mv	a3,s3
    7cf8:	3f5020ef          	jal	a8ec <__subdf3>
    7cfc:	00050613          	mv	a2,a0
    7d00:	00058693          	mv	a3,a1
    7d04:	00050a13          	mv	s4,a0
    7d08:	00058993          	mv	s3,a1
    7d0c:	000d8513          	mv	a0,s11
    7d10:	000d0593          	mv	a1,s10
    7d14:	3d9020ef          	jal	a8ec <__subdf3>
    7d18:	0145d793          	srl	a5,a1,0x14
    7d1c:	7ff7f793          	and	a5,a5,2047
    7d20:	40f484b3          	sub	s1,s1,a5
    7d24:	03100793          	li	a5,49
    7d28:	0097cc63          	blt	a5,s1,7d40 <.L16>
    7d2c:	00a42023          	sw	a0,0(s0)
    7d30:	00b42223          	sw	a1,4(s0)
    7d34:	000d8b13          	mv	s6,s11
    7d38:	000d0a93          	mv	s5,s10
    7d3c:	ee1ff06f          	j	7c1c <.L15>

00007d40 <.L16>:
    7d40:	0000a797          	auipc	a5,0xa
    7d44:	76078793          	add	a5,a5,1888 # 124a0 <.LC6>
    7d48:	0007a603          	lw	a2,0(a5)
    7d4c:	0047a683          	lw	a3,4(a5)
    7d50:	000c0513          	mv	a0,s8
    7d54:	000b8593          	mv	a1,s7
    7d58:	5a4020ef          	jal	a2fc <__muldf3>
    7d5c:	00050993          	mv	s3,a0
    7d60:	00058493          	mv	s1,a1
    7d64:	00050613          	mv	a2,a0
    7d68:	00058693          	mv	a3,a1
    7d6c:	000d8513          	mv	a0,s11
    7d70:	000d0593          	mv	a1,s10
    7d74:	379020ef          	jal	a8ec <__subdf3>
    7d78:	00050613          	mv	a2,a0
    7d7c:	00058693          	mv	a3,a1
    7d80:	00050b13          	mv	s6,a0
    7d84:	00058a93          	mv	s5,a1
    7d88:	000d8513          	mv	a0,s11
    7d8c:	000d0593          	mv	a1,s10
    7d90:	35d020ef          	jal	a8ec <__subdf3>
    7d94:	00098613          	mv	a2,s3
    7d98:	00048693          	mv	a3,s1
    7d9c:	351020ef          	jal	a8ec <__subdf3>
    7da0:	0000a797          	auipc	a5,0xa
    7da4:	70878793          	add	a5,a5,1800 # 124a8 <.LC7>
    7da8:	0007a603          	lw	a2,0(a5)
    7dac:	0047a683          	lw	a3,4(a5)
    7db0:	00050993          	mv	s3,a0
    7db4:	00058493          	mv	s1,a1
    7db8:	000c0513          	mv	a0,s8
    7dbc:	000b8593          	mv	a1,s7
    7dc0:	53c020ef          	jal	a2fc <__muldf3>
    7dc4:	00098613          	mv	a2,s3
    7dc8:	00048693          	mv	a3,s1
    7dcc:	321020ef          	jal	a8ec <__subdf3>
    7dd0:	00050613          	mv	a2,a0
    7dd4:	00058693          	mv	a3,a1
    7dd8:	00050a13          	mv	s4,a0
    7ddc:	00058993          	mv	s3,a1
    7de0:	000b0513          	mv	a0,s6
    7de4:	000a8593          	mv	a1,s5
    7de8:	305020ef          	jal	a8ec <__subdf3>
    7dec:	00a42023          	sw	a0,0(s0)
    7df0:	00b42223          	sw	a1,4(s0)
    7df4:	e29ff06f          	j	7c1c <.L15>

00007df8 <.L11>:
    7df8:	7ff006b7          	lui	a3,0x7ff00
    7dfc:	02d4e263          	bltu	s1,a3,7e20 <.L17>
    7e00:	00050613          	mv	a2,a0
    7e04:	00058693          	mv	a3,a1
    7e08:	2e5020ef          	jal	a8ec <__subdf3>
    7e0c:	00a42423          	sw	a0,8(s0)
    7e10:	00b42623          	sw	a1,12(s0)
    7e14:	00a42023          	sw	a0,0(s0)
    7e18:	00b42223          	sw	a1,4(s0)
    7e1c:	b71ff06f          	j	798c <.L3>

00007e20 <.L17>:
    7e20:	4144d913          	sra	s2,s1,0x14
    7e24:	bea90913          	add	s2,s2,-1046
    7e28:	01491713          	sll	a4,s2,0x14
    7e2c:	40e489b3          	sub	s3,s1,a4
    7e30:	00098593          	mv	a1,s3
    7e34:	00050a13          	mv	s4,a0
    7e38:	25c030ef          	jal	b094 <__fixdfsi>
    7e3c:	2d8030ef          	jal	b114 <__floatsidf>
    7e40:	00050613          	mv	a2,a0
    7e44:	00058693          	mv	a3,a1
    7e48:	00a12423          	sw	a0,8(sp)
    7e4c:	00b12623          	sw	a1,12(sp)
    7e50:	000a0513          	mv	a0,s4
    7e54:	00098593          	mv	a1,s3
    7e58:	0000aa17          	auipc	s4,0xa
    7e5c:	658a0a13          	add	s4,s4,1624 # 124b0 <.LC1>
    7e60:	28d020ef          	jal	a8ec <__subdf3>
    7e64:	000a2603          	lw	a2,0(s4)
    7e68:	004a2683          	lw	a3,4(s4)
    7e6c:	490020ef          	jal	a2fc <__muldf3>
    7e70:	00058493          	mv	s1,a1
    7e74:	00050993          	mv	s3,a0
    7e78:	21c030ef          	jal	b094 <__fixdfsi>
    7e7c:	298030ef          	jal	b114 <__floatsidf>
    7e80:	00050613          	mv	a2,a0
    7e84:	00058693          	mv	a3,a1
    7e88:	00a12823          	sw	a0,16(sp)
    7e8c:	00b12a23          	sw	a1,20(sp)
    7e90:	00098513          	mv	a0,s3
    7e94:	00048593          	mv	a1,s1
    7e98:	255020ef          	jal	a8ec <__subdf3>
    7e9c:	000a2603          	lw	a2,0(s4)
    7ea0:	004a2683          	lw	a3,4(s4)
    7ea4:	00810493          	add	s1,sp,8
    7ea8:	00300993          	li	s3,3
    7eac:	450020ef          	jal	a2fc <__muldf3>
    7eb0:	00a12c23          	sw	a0,24(sp)
    7eb4:	00b12e23          	sw	a1,28(sp)
    7eb8:	00048a13          	mv	s4,s1

00007ebc <.L18>:
    7ebc:	0104a503          	lw	a0,16(s1)
    7ec0:	0144a583          	lw	a1,20(s1)
    7ec4:	00000613          	li	a2,0
    7ec8:	00000693          	li	a3,0
    7ecc:	ff848493          	add	s1,s1,-8
    7ed0:	00098a93          	mv	s5,s3
    7ed4:	fff98993          	add	s3,s3,-1
    7ed8:	2bc020ef          	jal	a194 <__eqdf2>
    7edc:	fe0500e3          	beqz	a0,7ebc <.L18>
    7ee0:	00090613          	mv	a2,s2
    7ee4:	0000a797          	auipc	a5,0xa
    7ee8:	de478793          	add	a5,a5,-540 # 11cc8 <two_over_pi>
    7eec:	00200713          	li	a4,2
    7ef0:	000a8693          	mv	a3,s5
    7ef4:	00040593          	mv	a1,s0
    7ef8:	000a0513          	mv	a0,s4
    7efc:	2b4000ef          	jal	81b0 <__kernel_rem_pio2>
    7f00:	00050913          	mv	s2,a0
    7f04:	b40cd0e3          	bgez	s9,7a44 <.L1>
    7f08:	00442603          	lw	a2,4(s0)
    7f0c:	800006b7          	lui	a3,0x80000
    7f10:	00d647b3          	xor	a5,a2,a3
    7f14:	00c42603          	lw	a2,12(s0)
    7f18:	00f42223          	sw	a5,4(s0)
    7f1c:	00d647b3          	xor	a5,a2,a3
    7f20:	d41ff06f          	j	7c60 <.L24>

00007f24 <__kernel_cos>:
    7f24:	fd010113          	add	sp,sp,-48
    7f28:	03212023          	sw	s2,32(sp)
    7f2c:	00159913          	sll	s2,a1,0x1
    7f30:	01312e23          	sw	s3,28(sp)
    7f34:	01412c23          	sw	s4,24(sp)
    7f38:	01512a23          	sw	s5,20(sp)
    7f3c:	01812423          	sw	s8,8(sp)
    7f40:	01912223          	sw	s9,4(sp)
    7f44:	02112623          	sw	ra,44(sp)
    7f48:	02812423          	sw	s0,40(sp)
    7f4c:	02912223          	sw	s1,36(sp)
    7f50:	01612823          	sw	s6,16(sp)
    7f54:	01712623          	sw	s7,12(sp)
    7f58:	00195913          	srl	s2,s2,0x1
    7f5c:	3e4007b7          	lui	a5,0x3e400
    7f60:	00050a13          	mv	s4,a0
    7f64:	00058993          	mv	s3,a1
    7f68:	00060c93          	mv	s9,a2
    7f6c:	00068c13          	mv	s8,a3
    7f70:	0000aa97          	auipc	s5,0xa
    7f74:	488a8a93          	add	s5,s5,1160 # 123f8 <.LC1>
    7f78:	00f97663          	bgeu	s2,a5,7f84 <.L2>
    7f7c:	118030ef          	jal	b094 <__fixdfsi>
    7f80:	22050263          	beqz	a0,81a4 <.L6>

00007f84 <.L2>:
    7f84:	000a0613          	mv	a2,s4
    7f88:	00098693          	mv	a3,s3
    7f8c:	000a0513          	mv	a0,s4
    7f90:	00098593          	mv	a1,s3
    7f94:	368020ef          	jal	a2fc <__muldf3>
    7f98:	0000a797          	auipc	a5,0xa
    7f9c:	50078793          	add	a5,a5,1280 # 12498 <.LC2>
    7fa0:	0007a603          	lw	a2,0(a5)
    7fa4:	0047a683          	lw	a3,4(a5)
    7fa8:	00050493          	mv	s1,a0
    7fac:	00058413          	mv	s0,a1
    7fb0:	34c020ef          	jal	a2fc <__muldf3>
    7fb4:	0000a797          	auipc	a5,0xa
    7fb8:	50c78793          	add	a5,a5,1292 # 124c0 <.LC3>
    7fbc:	0007a603          	lw	a2,0(a5)
    7fc0:	0047a683          	lw	a3,4(a5)
    7fc4:	00050b93          	mv	s7,a0
    7fc8:	00058b13          	mv	s6,a1
    7fcc:	00048513          	mv	a0,s1
    7fd0:	00040593          	mv	a1,s0
    7fd4:	328020ef          	jal	a2fc <__muldf3>
    7fd8:	0000a797          	auipc	a5,0xa
    7fdc:	4f078793          	add	a5,a5,1264 # 124c8 <.LC4>
    7fe0:	0007a603          	lw	a2,0(a5)
    7fe4:	0047a683          	lw	a3,4(a5)
    7fe8:	338010ef          	jal	9320 <__adddf3>
    7fec:	00048613          	mv	a2,s1
    7ff0:	00040693          	mv	a3,s0
    7ff4:	308020ef          	jal	a2fc <__muldf3>
    7ff8:	0000a797          	auipc	a5,0xa
    7ffc:	4d878793          	add	a5,a5,1240 # 124d0 <.LC5>
    8000:	0007a603          	lw	a2,0(a5)
    8004:	0047a683          	lw	a3,4(a5)
    8008:	0e5020ef          	jal	a8ec <__subdf3>
    800c:	00048613          	mv	a2,s1
    8010:	00040693          	mv	a3,s0
    8014:	2e8020ef          	jal	a2fc <__muldf3>
    8018:	0000a797          	auipc	a5,0xa
    801c:	4c078793          	add	a5,a5,1216 # 124d8 <.LC6>
    8020:	0007a603          	lw	a2,0(a5)
    8024:	0047a683          	lw	a3,4(a5)
    8028:	2f8010ef          	jal	9320 <__adddf3>
    802c:	00048613          	mv	a2,s1
    8030:	00040693          	mv	a3,s0
    8034:	2c8020ef          	jal	a2fc <__muldf3>
    8038:	0000a797          	auipc	a5,0xa
    803c:	4a878793          	add	a5,a5,1192 # 124e0 <.LC7>
    8040:	0007a603          	lw	a2,0(a5)
    8044:	0047a683          	lw	a3,4(a5)
    8048:	0a5020ef          	jal	a8ec <__subdf3>
    804c:	00048613          	mv	a2,s1
    8050:	00040693          	mv	a3,s0
    8054:	2a8020ef          	jal	a2fc <__muldf3>
    8058:	0000a797          	auipc	a5,0xa
    805c:	49078793          	add	a5,a5,1168 # 124e8 <.LC8>
    8060:	0007a603          	lw	a2,0(a5)
    8064:	0047a683          	lw	a3,4(a5)
    8068:	2b8010ef          	jal	9320 <__adddf3>
    806c:	00048613          	mv	a2,s1
    8070:	00040693          	mv	a3,s0
    8074:	288020ef          	jal	a2fc <__muldf3>
    8078:	00048613          	mv	a2,s1
    807c:	00040693          	mv	a3,s0
    8080:	27c020ef          	jal	a2fc <__muldf3>
    8084:	00050493          	mv	s1,a0
    8088:	00058413          	mv	s0,a1
    808c:	000c8613          	mv	a2,s9
    8090:	000c0693          	mv	a3,s8
    8094:	000a0513          	mv	a0,s4
    8098:	00098593          	mv	a1,s3
    809c:	260020ef          	jal	a2fc <__muldf3>
    80a0:	00050613          	mv	a2,a0
    80a4:	00058693          	mv	a3,a1
    80a8:	00048513          	mv	a0,s1
    80ac:	00040593          	mv	a1,s0
    80b0:	03d020ef          	jal	a8ec <__subdf3>
    80b4:	3fd337b7          	lui	a5,0x3fd33
    80b8:	33278793          	add	a5,a5,818 # 3fd33332 <_ebss+0x3fd1d002>
    80bc:	00050a13          	mv	s4,a0
    80c0:	00058993          	mv	s3,a1
    80c4:	0727e063          	bltu	a5,s2,8124 <.L4>
    80c8:	00050613          	mv	a2,a0
    80cc:	00058693          	mv	a3,a1
    80d0:	000b8513          	mv	a0,s7
    80d4:	000b0593          	mv	a1,s6
    80d8:	015020ef          	jal	a8ec <__subdf3>
    80dc:	00050613          	mv	a2,a0
    80e0:	00058693          	mv	a3,a1
    80e4:	000aa503          	lw	a0,0(s5)
    80e8:	004aa583          	lw	a1,4(s5)

000080ec <.L9>:
    80ec:	001020ef          	jal	a8ec <__subdf3>

000080f0 <.L1>:
    80f0:	02c12083          	lw	ra,44(sp)
    80f4:	02812403          	lw	s0,40(sp)
    80f8:	02412483          	lw	s1,36(sp)
    80fc:	02012903          	lw	s2,32(sp)
    8100:	01c12983          	lw	s3,28(sp)
    8104:	01812a03          	lw	s4,24(sp)
    8108:	01412a83          	lw	s5,20(sp)
    810c:	01012b03          	lw	s6,16(sp)
    8110:	00c12b83          	lw	s7,12(sp)
    8114:	00812c03          	lw	s8,8(sp)
    8118:	00412c83          	lw	s9,4(sp)
    811c:	03010113          	add	sp,sp,48
    8120:	00008067          	ret

00008124 <.L4>:
    8124:	3fe907b7          	lui	a5,0x3fe90
    8128:	0727e463          	bltu	a5,s2,8190 <.L7>
    812c:	ffe007b7          	lui	a5,0xffe00
    8130:	00000713          	li	a4,0
    8134:	00f907b3          	add	a5,s2,a5
    8138:	00070413          	mv	s0,a4
    813c:	00078493          	mv	s1,a5

00008140 <.L5>:
    8140:	000aa503          	lw	a0,0(s5)
    8144:	004aa583          	lw	a1,4(s5)
    8148:	00040613          	mv	a2,s0
    814c:	00048693          	mv	a3,s1
    8150:	79c020ef          	jal	a8ec <__subdf3>
    8154:	00050a93          	mv	s5,a0
    8158:	00058913          	mv	s2,a1
    815c:	00040613          	mv	a2,s0
    8160:	00048693          	mv	a3,s1
    8164:	000b8513          	mv	a0,s7
    8168:	000b0593          	mv	a1,s6
    816c:	780020ef          	jal	a8ec <__subdf3>
    8170:	000a0613          	mv	a2,s4
    8174:	00098693          	mv	a3,s3
    8178:	774020ef          	jal	a8ec <__subdf3>
    817c:	00050613          	mv	a2,a0
    8180:	00058693          	mv	a3,a1
    8184:	000a8513          	mv	a0,s5
    8188:	00090593          	mv	a1,s2
    818c:	f61ff06f          	j	80ec <.L9>

00008190 <.L7>:
    8190:	0000a797          	auipc	a5,0xa
    8194:	32878793          	add	a5,a5,808 # 124b8 <.LC0>
    8198:	0007a403          	lw	s0,0(a5)
    819c:	0047a483          	lw	s1,4(a5)
    81a0:	fa1ff06f          	j	8140 <.L5>

000081a4 <.L6>:
    81a4:	000aa503          	lw	a0,0(s5)
    81a8:	004aa583          	lw	a1,4(s5)
    81ac:	f45ff06f          	j	80f0 <.L1>

000081b0 <__kernel_rem_pio2>:
    81b0:	d6010113          	add	sp,sp,-672
    81b4:	28912a23          	sw	s1,660(sp)
    81b8:	00f12c23          	sw	a5,24(sp)
    81bc:	00070493          	mv	s1,a4
    81c0:	0000a797          	auipc	a5,0xa
    81c4:	c1078793          	add	a5,a5,-1008 # 11dd0 <init_jk>
    81c8:	00271713          	sll	a4,a4,0x2
    81cc:	00e787b3          	add	a5,a5,a4
    81d0:	29212823          	sw	s2,656(sp)
    81d4:	29312623          	sw	s3,652(sp)
    81d8:	29512223          	sw	s5,644(sp)
    81dc:	27812c23          	sw	s8,632(sp)
    81e0:	28112e23          	sw	ra,668(sp)
    81e4:	0007ac03          	lw	s8,0(a5)
    81e8:	28812c23          	sw	s0,664(sp)
    81ec:	29412423          	sw	s4,648(sp)
    81f0:	29612023          	sw	s6,640(sp)
    81f4:	27712e23          	sw	s7,636(sp)
    81f8:	27912a23          	sw	s9,628(sp)
    81fc:	27a12823          	sw	s10,624(sp)
    8200:	27b12623          	sw	s11,620(sp)
    8204:	00a12a23          	sw	a0,20(sp)
    8208:	fec00793          	li	a5,-20
    820c:	00012423          	sw	zero,8(sp)
    8210:	00058a93          	mv	s5,a1
    8214:	00068913          	mv	s2,a3
    8218:	fff68993          	add	s3,a3,-1 # 7fffffff <_ebss+0x7ffe9ccf>
    821c:	00f64a63          	blt	a2,a5,8230 <.L2>
    8220:	ffd60713          	add	a4,a2,-3
    8224:	01800793          	li	a5,24
    8228:	02f747b3          	div	a5,a4,a5
    822c:	00f12423          	sw	a5,8(sp)

00008230 <.L2>:
    8230:	00812783          	lw	a5,8(sp)
    8234:	013c0cb3          	add	s9,s8,s3
    8238:	00178413          	add	s0,a5,1
    823c:	fe800793          	li	a5,-24
    8240:	02f40433          	mul	s0,s0,a5
    8244:	00812783          	lw	a5,8(sp)
    8248:	41378bb3          	sub	s7,a5,s3
    824c:	08010793          	add	a5,sp,128
    8250:	00f12823          	sw	a5,16(sp)
    8254:	00078b13          	mv	s6,a5
    8258:	000b8a13          	mv	s4,s7
    825c:	00c40433          	add	s0,s0,a2

00008260 <.L3>:
    8260:	417a07b3          	sub	a5,s4,s7
    8264:	02fcda63          	bge	s9,a5,8298 <.L5>
    8268:	1c010d13          	add	s10,sp,448
    826c:	00090d93          	mv	s11,s2
    8270:	000d0793          	mv	a5,s10

00008274 <.L6>:
    8274:	412d8733          	sub	a4,s11,s2
    8278:	0aec4c63          	blt	s8,a4,8330 <.L8>
    827c:	01012703          	lw	a4,16(sp)
    8280:	003d9b93          	sll	s7,s11,0x3
    8284:	00000b13          	li	s6,0
    8288:	00eb8bb3          	add	s7,s7,a4
    828c:	00000a13          	li	s4,0
    8290:	00000c93          	li	s9,0
    8294:	0800006f          	j	8314 <.L9>

00008298 <.L5>:
    8298:	00000513          	li	a0,0
    829c:	00000593          	li	a1,0
    82a0:	000a4c63          	bltz	s4,82b8 <.L4>
    82a4:	01812703          	lw	a4,24(sp)
    82a8:	002a1793          	sll	a5,s4,0x2
    82ac:	00f707b3          	add	a5,a4,a5
    82b0:	0007a503          	lw	a0,0(a5)
    82b4:	661020ef          	jal	b114 <__floatsidf>

000082b8 <.L4>:
    82b8:	00ab2023          	sw	a0,0(s6)
    82bc:	00bb2223          	sw	a1,4(s6)
    82c0:	001a0a13          	add	s4,s4,1
    82c4:	008b0b13          	add	s6,s6,8
    82c8:	f99ff06f          	j	8260 <.L3>

000082cc <.L7>:
    82cc:	00f12e23          	sw	a5,28(sp)
    82d0:	01412783          	lw	a5,20(sp)
    82d4:	003c9713          	sll	a4,s9,0x3
    82d8:	000ba603          	lw	a2,0(s7) # 10000 <.LBE204>
    82dc:	00e78733          	add	a4,a5,a4
    82e0:	004ba683          	lw	a3,4(s7)
    82e4:	00072503          	lw	a0,0(a4)
    82e8:	00472583          	lw	a1,4(a4)
    82ec:	001c8c93          	add	s9,s9,1
    82f0:	00c020ef          	jal	a2fc <__muldf3>
    82f4:	00050613          	mv	a2,a0
    82f8:	00058693          	mv	a3,a1
    82fc:	000b0513          	mv	a0,s6
    8300:	000a0593          	mv	a1,s4
    8304:	01c010ef          	jal	9320 <__adddf3>
    8308:	01c12783          	lw	a5,28(sp)
    830c:	00050b13          	mv	s6,a0
    8310:	00058a13          	mv	s4,a1

00008314 <.L9>:
    8314:	ff8b8b93          	add	s7,s7,-8
    8318:	fb99dae3          	bge	s3,s9,82cc <.L7>
    831c:	0167a023          	sw	s6,0(a5)
    8320:	0147a223          	sw	s4,4(a5)
    8324:	001d8d93          	add	s11,s11,1
    8328:	00878793          	add	a5,a5,8
    832c:	f49ff06f          	j	8274 <.L6>

00008330 <.L8>:
    8330:	03010c93          	add	s9,sp,48
    8334:	002c1793          	sll	a5,s8,0x2
    8338:	00fc87b3          	add	a5,s9,a5
    833c:	00f12e23          	sw	a5,28(sp)
    8340:	000c0a13          	mv	s4,s8

00008344 <.L10>:
    8344:	003a1793          	sll	a5,s4,0x3
    8348:	03010713          	add	a4,sp,48
    834c:	23078793          	add	a5,a5,560
    8350:	00e787b3          	add	a5,a5,a4
    8354:	f607ab83          	lw	s7,-160(a5)
    8358:	f647ab03          	lw	s6,-156(a5)
    835c:	000c8d93          	mv	s11,s9
    8360:	000c8713          	mv	a4,s9
    8364:	000a0793          	mv	a5,s4

00008368 <.L11>:
    8368:	22f04063          	bgtz	a5,8588 <.L12>
    836c:	00040613          	mv	a2,s0
    8370:	000b8513          	mv	a0,s7
    8374:	000b0593          	mv	a1,s6
    8378:	555000ef          	jal	90cc <__GI_scalbln>
    837c:	0000a797          	auipc	a5,0xa
    8380:	17c78793          	add	a5,a5,380 # 124f8 <.LC2>
    8384:	0007a603          	lw	a2,0(a5)
    8388:	0047a683          	lw	a3,4(a5)
    838c:	00050b93          	mv	s7,a0
    8390:	00058b13          	mv	s6,a1
    8394:	769010ef          	jal	a2fc <__muldf3>
    8398:	371000ef          	jal	8f08 <__GI_floor>
    839c:	0000a797          	auipc	a5,0xa
    83a0:	16478793          	add	a5,a5,356 # 12500 <.LC3>
    83a4:	0007a603          	lw	a2,0(a5)
    83a8:	0047a683          	lw	a3,4(a5)
    83ac:	751010ef          	jal	a2fc <__muldf3>
    83b0:	00050613          	mv	a2,a0
    83b4:	00058693          	mv	a3,a1
    83b8:	000b8513          	mv	a0,s7
    83bc:	000b0593          	mv	a1,s6
    83c0:	52c020ef          	jal	a8ec <__subdf3>
    83c4:	00058b13          	mv	s6,a1
    83c8:	02a12023          	sw	a0,32(sp)
    83cc:	4c9020ef          	jal	b094 <__fixdfsi>
    83d0:	00050b93          	mv	s7,a0
    83d4:	541020ef          	jal	b114 <__floatsidf>
    83d8:	02012783          	lw	a5,32(sp)
    83dc:	00050613          	mv	a2,a0
    83e0:	00058693          	mv	a3,a1
    83e4:	00078513          	mv	a0,a5
    83e8:	000b0593          	mv	a1,s6
    83ec:	500020ef          	jal	a8ec <__subdf3>
    83f0:	00050713          	mv	a4,a0
    83f4:	00058793          	mv	a5,a1
    83f8:	24805063          	blez	s0,8638 <.L13>
    83fc:	fffa0693          	add	a3,s4,-1
    8400:	00269693          	sll	a3,a3,0x2
    8404:	03010613          	add	a2,sp,48
    8408:	23068693          	add	a3,a3,560
    840c:	00c686b3          	add	a3,a3,a2
    8410:	dd06ab03          	lw	s6,-560(a3)
    8414:	01800593          	li	a1,24
    8418:	408585b3          	sub	a1,a1,s0
    841c:	40bb5633          	sra	a2,s6,a1
    8420:	00cb8bb3          	add	s7,s7,a2
    8424:	00b61633          	sll	a2,a2,a1
    8428:	40cb0b33          	sub	s6,s6,a2
    842c:	dd66a823          	sw	s6,-560(a3)
    8430:	01700693          	li	a3,23
    8434:	408686b3          	sub	a3,a3,s0
    8438:	40db5b33          	sra	s6,s6,a3

0000843c <.L14>:
    843c:	09605e63          	blez	s6,84d8 <.L17>

00008440 <.L16>:
    8440:	001b8b93          	add	s7,s7,1
    8444:	00000613          	li	a2,0
    8448:	00000813          	li	a6,0

0000844c <.L18>:
    844c:	25464263          	blt	a2,s4,8690 <.L22>
    8450:	00805a63          	blez	s0,8464 <.L23>
    8454:	00100693          	li	a3,1
    8458:	26d40863          	beq	s0,a3,86c8 <.L24>
    845c:	00200693          	li	a3,2
    8460:	28d40863          	beq	s0,a3,86f0 <.L25>

00008464 <.L23>:
    8464:	00200693          	li	a3,2
    8468:	06db1863          	bne	s6,a3,84d8 <.L17>
    846c:	0000ad97          	auipc	s11,0xa
    8470:	f8cd8d93          	add	s11,s11,-116 # 123f8 <.LC1>
    8474:	000da503          	lw	a0,0(s11)
    8478:	004da583          	lw	a1,4(s11)
    847c:	00070613          	mv	a2,a4
    8480:	00078693          	mv	a3,a5
    8484:	03012023          	sw	a6,32(sp)
    8488:	464020ef          	jal	a8ec <__subdf3>
    848c:	02012803          	lw	a6,32(sp)
    8490:	00050713          	mv	a4,a0
    8494:	00058793          	mv	a5,a1
    8498:	04080063          	beqz	a6,84d8 <.L17>
    849c:	02b12223          	sw	a1,36(sp)
    84a0:	02a12023          	sw	a0,32(sp)
    84a4:	004da583          	lw	a1,4(s11)
    84a8:	000da503          	lw	a0,0(s11)
    84ac:	00040613          	mv	a2,s0
    84b0:	41d000ef          	jal	90cc <__GI_scalbln>
    84b4:	02012703          	lw	a4,32(sp)
    84b8:	02412783          	lw	a5,36(sp)
    84bc:	00050613          	mv	a2,a0
    84c0:	00058693          	mv	a3,a1
    84c4:	00070513          	mv	a0,a4
    84c8:	00078593          	mv	a1,a5
    84cc:	420020ef          	jal	a8ec <__subdf3>
    84d0:	00050713          	mv	a4,a0
    84d4:	00058793          	mv	a5,a1

000084d8 <.L17>:
    84d8:	00070513          	mv	a0,a4
    84dc:	00078593          	mv	a1,a5
    84e0:	00000613          	li	a2,0
    84e4:	00000693          	li	a3,0
    84e8:	02e12223          	sw	a4,36(sp)
    84ec:	02f12023          	sw	a5,32(sp)
    84f0:	4a5010ef          	jal	a194 <__eqdf2>
    84f4:	02012783          	lw	a5,32(sp)
    84f8:	02412703          	lw	a4,36(sp)
    84fc:	32051263          	bnez	a0,8820 <.L89>
    8500:	fffa0793          	add	a5,s4,-1
    8504:	00000713          	li	a4,0
    8508:	00078613          	mv	a2,a5

0000850c <.L28>:
    850c:	2187d463          	bge	a5,s8,8714 <.L29>
    8510:	28070e63          	beqz	a4,87ac <.L70>
    8514:	00060a13          	mv	s4,a2

00008518 <.L95>:
    8518:	002a1793          	sll	a5,s4,0x2
    851c:	00fc87b3          	add	a5,s9,a5
    8520:	0007a783          	lw	a5,0(a5)
    8524:	fe840413          	add	s0,s0,-24
    8528:	2e078863          	beqz	a5,8818 <.L38>

0000852c <.L39>:
    852c:	0000a797          	auipc	a5,0xa
    8530:	ecc78793          	add	a5,a5,-308 # 123f8 <.LC1>
    8534:	0007a503          	lw	a0,0(a5)
    8538:	0047a583          	lw	a1,4(a5)
    853c:	00040613          	mv	a2,s0
    8540:	000a0d93          	mv	s11,s4
    8544:	389000ef          	jal	90cc <__GI_scalbln>
    8548:	00050413          	mv	s0,a0
    854c:	00058913          	mv	s2,a1
    8550:	0000a997          	auipc	s3,0xa
    8554:	fa098993          	add	s3,s3,-96 # 124f0 <.LC0>

00008558 <.L42>:
    8558:	3a0dd663          	bgez	s11,8904 <.L43>
    855c:	000a0913          	mv	s2,s4

00008560 <.L44>:
    8560:	46094863          	bltz	s2,89d0 <.L47>
    8564:	00391d93          	sll	s11,s2,0x3
    8568:	0000a717          	auipc	a4,0xa
    856c:	87870713          	add	a4,a4,-1928 # 11de0 <PIo2>
    8570:	01ad8db3          	add	s11,s11,s10
    8574:	00000c93          	li	s9,0
    8578:	00000993          	li	s3,0
    857c:	00000793          	li	a5,0
    8580:	412a0433          	sub	s0,s4,s2
    8584:	4240006f          	j	89a8 <.L48>

00008588 <.L12>:
    8588:	02f12023          	sw	a5,32(sp)
    858c:	0000a797          	auipc	a5,0xa
    8590:	f6478793          	add	a5,a5,-156 # 124f0 <.LC0>
    8594:	0007a603          	lw	a2,0(a5)
    8598:	0047a683          	lw	a3,4(a5)
    859c:	000b8513          	mv	a0,s7
    85a0:	000b0593          	mv	a1,s6
    85a4:	02e12223          	sw	a4,36(sp)
    85a8:	555010ef          	jal	a2fc <__muldf3>
    85ac:	2e9020ef          	jal	b094 <__fixdfsi>
    85b0:	365020ef          	jal	b114 <__floatsidf>
    85b4:	0000a797          	auipc	a5,0xa
    85b8:	efc78793          	add	a5,a5,-260 # 124b0 <.LC1>
    85bc:	0007a603          	lw	a2,0(a5)
    85c0:	0047a683          	lw	a3,4(a5)
    85c4:	02a12623          	sw	a0,44(sp)
    85c8:	02b12423          	sw	a1,40(sp)
    85cc:	531010ef          	jal	a2fc <__muldf3>
    85d0:	00050613          	mv	a2,a0
    85d4:	00058693          	mv	a3,a1
    85d8:	000b8513          	mv	a0,s7
    85dc:	000b0593          	mv	a1,s6
    85e0:	30c020ef          	jal	a8ec <__subdf3>
    85e4:	2b1020ef          	jal	b094 <__fixdfsi>
    85e8:	02012783          	lw	a5,32(sp)
    85ec:	02412703          	lw	a4,36(sp)
    85f0:	02c12883          	lw	a7,44(sp)
    85f4:	fff78793          	add	a5,a5,-1
    85f8:	00379693          	sll	a3,a5,0x3
    85fc:	02812803          	lw	a6,40(sp)
    8600:	00dd06b3          	add	a3,s10,a3
    8604:	0006a603          	lw	a2,0(a3)
    8608:	0046a683          	lw	a3,4(a3)
    860c:	00a72023          	sw	a0,0(a4)
    8610:	00080593          	mv	a1,a6
    8614:	00088513          	mv	a0,a7
    8618:	02f12023          	sw	a5,32(sp)
    861c:	505000ef          	jal	9320 <__adddf3>
    8620:	02412703          	lw	a4,36(sp)
    8624:	02012783          	lw	a5,32(sp)
    8628:	00050b93          	mv	s7,a0
    862c:	00058b13          	mv	s6,a1
    8630:	00470713          	add	a4,a4,4
    8634:	d35ff06f          	j	8368 <.L11>

00008638 <.L13>:
    8638:	02041263          	bnez	s0,865c <.L15>
    863c:	fffa0693          	add	a3,s4,-1
    8640:	00269693          	sll	a3,a3,0x2
    8644:	23068693          	add	a3,a3,560
    8648:	03010613          	add	a2,sp,48
    864c:	00c686b3          	add	a3,a3,a2
    8650:	dd06ab03          	lw	s6,-560(a3)
    8654:	417b5b13          	sra	s6,s6,0x17
    8658:	de5ff06f          	j	843c <.L14>

0000865c <.L15>:
    865c:	0000a697          	auipc	a3,0xa
    8660:	e3c68693          	add	a3,a3,-452 # 12498 <.LC2>
    8664:	0006a603          	lw	a2,0(a3)
    8668:	0046a683          	lw	a3,4(a3)
    866c:	02b12223          	sw	a1,36(sp)
    8670:	02a12023          	sw	a0,32(sp)
    8674:	3ad010ef          	jal	a220 <__gedf2>
    8678:	02012703          	lw	a4,32(sp)
    867c:	02412783          	lw	a5,36(sp)
    8680:	00000b13          	li	s6,0
    8684:	e4054ae3          	bltz	a0,84d8 <.L17>
    8688:	00200b13          	li	s6,2
    868c:	db5ff06f          	j	8440 <.L16>

00008690 <.L22>:
    8690:	000da683          	lw	a3,0(s11)
    8694:	00081e63          	bnez	a6,86b0 <.L19>
    8698:	010005b7          	lui	a1,0x1000
    869c:	00069e63          	bnez	a3,86b8 <.L93>

000086a0 <.L20>:
    86a0:	00160613          	add	a2,a2,1
    86a4:	004d8d93          	add	s11,s11,4
    86a8:	00068813          	mv	a6,a3
    86ac:	da1ff06f          	j	844c <.L18>

000086b0 <.L19>:
    86b0:	010005b7          	lui	a1,0x1000
    86b4:	fff58593          	add	a1,a1,-1 # ffffff <_ebss+0xfe9ccf>

000086b8 <.L93>:
    86b8:	40d586b3          	sub	a3,a1,a3
    86bc:	00dda023          	sw	a3,0(s11)
    86c0:	00100693          	li	a3,1
    86c4:	fddff06f          	j	86a0 <.L20>

000086c8 <.L24>:
    86c8:	fffa0693          	add	a3,s4,-1
    86cc:	00269693          	sll	a3,a3,0x2
    86d0:	03010613          	add	a2,sp,48
    86d4:	23068693          	add	a3,a3,560
    86d8:	00c686b3          	add	a3,a3,a2
    86dc:	dd06a603          	lw	a2,-560(a3)
    86e0:	00961613          	sll	a2,a2,0x9
    86e4:	00965613          	srl	a2,a2,0x9

000086e8 <.L94>:
    86e8:	dcc6a823          	sw	a2,-560(a3)
    86ec:	d79ff06f          	j	8464 <.L23>

000086f0 <.L25>:
    86f0:	fffa0693          	add	a3,s4,-1
    86f4:	00269693          	sll	a3,a3,0x2
    86f8:	03010613          	add	a2,sp,48
    86fc:	23068693          	add	a3,a3,560
    8700:	00c686b3          	add	a3,a3,a2
    8704:	dd06a603          	lw	a2,-560(a3)
    8708:	00a61613          	sll	a2,a2,0xa
    870c:	00a65613          	srl	a2,a2,0xa
    8710:	fd9ff06f          	j	86e8 <.L94>

00008714 <.L29>:
    8714:	00279693          	sll	a3,a5,0x2
    8718:	00dc86b3          	add	a3,s9,a3
    871c:	0006a683          	lw	a3,0(a3)
    8720:	fff78793          	add	a5,a5,-1
    8724:	00d76733          	or	a4,a4,a3
    8728:	de5ff06f          	j	850c <.L28>

0000872c <.L32>:
    872c:	00178793          	add	a5,a5,1

00008730 <.L30>:
    8730:	ffc72683          	lw	a3,-4(a4)
    8734:	ffc70713          	add	a4,a4,-4
    8738:	fe068ae3          	beqz	a3,872c <.L32>
    873c:	01012703          	lw	a4,16(sp)
    8740:	012a0bb3          	add	s7,s4,s2
    8744:	003b9b93          	sll	s7,s7,0x3
    8748:	001a0d93          	add	s11,s4,1
    874c:	01770bb3          	add	s7,a4,s7
    8750:	00fa0a33          	add	s4,s4,a5

00008754 <.L33>:
    8754:	bfba48e3          	blt	s4,s11,8344 <.L10>
    8758:	00812783          	lw	a5,8(sp)
    875c:	01812703          	lw	a4,24(sp)
    8760:	00000b13          	li	s6,0
    8764:	01b787b3          	add	a5,a5,s11
    8768:	00279793          	sll	a5,a5,0x2
    876c:	00f707b3          	add	a5,a4,a5
    8770:	0007a503          	lw	a0,0(a5)
    8774:	1a1020ef          	jal	b114 <__floatsidf>
    8778:	00aba023          	sw	a0,0(s7)
    877c:	00bba223          	sw	a1,4(s7)
    8780:	000b8813          	mv	a6,s7
    8784:	00000713          	li	a4,0
    8788:	00000793          	li	a5,0

0000878c <.L34>:
    878c:	0369d663          	bge	s3,s6,87b8 <.L35>
    8790:	003d9693          	sll	a3,s11,0x3
    8794:	00dd06b3          	add	a3,s10,a3
    8798:	00e6a023          	sw	a4,0(a3)
    879c:	00f6a223          	sw	a5,4(a3)
    87a0:	001d8d93          	add	s11,s11,1
    87a4:	008b8b93          	add	s7,s7,8
    87a8:	fadff06f          	j	8754 <.L33>

000087ac <.L70>:
    87ac:	01c12703          	lw	a4,28(sp)
    87b0:	00100793          	li	a5,1
    87b4:	f7dff06f          	j	8730 <.L30>

000087b8 <.L35>:
    87b8:	02f12423          	sw	a5,40(sp)
    87bc:	01412783          	lw	a5,20(sp)
    87c0:	003b1593          	sll	a1,s6,0x3
    87c4:	00082603          	lw	a2,0(a6)
    87c8:	00b785b3          	add	a1,a5,a1
    87cc:	00482683          	lw	a3,4(a6)
    87d0:	0005a503          	lw	a0,0(a1)
    87d4:	0045a583          	lw	a1,4(a1)
    87d8:	03012023          	sw	a6,32(sp)
    87dc:	02e12223          	sw	a4,36(sp)
    87e0:	31d010ef          	jal	a2fc <__muldf3>
    87e4:	02412703          	lw	a4,36(sp)
    87e8:	02812783          	lw	a5,40(sp)
    87ec:	00050613          	mv	a2,a0
    87f0:	00058693          	mv	a3,a1
    87f4:	00070513          	mv	a0,a4
    87f8:	00078593          	mv	a1,a5
    87fc:	325000ef          	jal	9320 <__adddf3>
    8800:	02012803          	lw	a6,32(sp)
    8804:	00050713          	mv	a4,a0
    8808:	00058793          	mv	a5,a1
    880c:	001b0b13          	add	s6,s6,1
    8810:	ff880813          	add	a6,a6,-8
    8814:	f79ff06f          	j	878c <.L34>

00008818 <.L38>:
    8818:	fffa0a13          	add	s4,s4,-1
    881c:	cfdff06f          	j	8518 <.L95>

00008820 <.L89>:
    8820:	40800633          	neg	a2,s0
    8824:	00070513          	mv	a0,a4
    8828:	00078593          	mv	a1,a5
    882c:	0a1000ef          	jal	90cc <__GI_scalbln>
    8830:	0000a697          	auipc	a3,0xa
    8834:	c8068693          	add	a3,a3,-896 # 124b0 <.LC1>
    8838:	0006a783          	lw	a5,0(a3)
    883c:	0046a803          	lw	a6,4(a3)
    8840:	00050993          	mv	s3,a0
    8844:	00078613          	mv	a2,a5
    8848:	00080693          	mv	a3,a6
    884c:	00058913          	mv	s2,a1
    8850:	00f12423          	sw	a5,8(sp)
    8854:	01012623          	sw	a6,12(sp)
    8858:	1c9010ef          	jal	a220 <__gedf2>
    885c:	002a1d93          	sll	s11,s4,0x2
    8860:	08054263          	bltz	a0,88e4 <.L91>
    8864:	0000a697          	auipc	a3,0xa
    8868:	c8c68693          	add	a3,a3,-884 # 124f0 <.LC0>
    886c:	0006a603          	lw	a2,0(a3)
    8870:	0046a683          	lw	a3,4(a3)
    8874:	00098513          	mv	a0,s3
    8878:	00090593          	mv	a1,s2
    887c:	281010ef          	jal	a2fc <__muldf3>
    8880:	015020ef          	jal	b094 <__fixdfsi>
    8884:	230d8793          	add	a5,s11,560
    8888:	03010713          	add	a4,sp,48
    888c:	00e78db3          	add	s11,a5,a4
    8890:	00a12823          	sw	a0,16(sp)
    8894:	081020ef          	jal	b114 <__floatsidf>
    8898:	00812603          	lw	a2,8(sp)
    889c:	00c12683          	lw	a3,12(sp)
    88a0:	001a0a13          	add	s4,s4,1
    88a4:	01840413          	add	s0,s0,24
    88a8:	255010ef          	jal	a2fc <__muldf3>
    88ac:	00050613          	mv	a2,a0
    88b0:	00058693          	mv	a3,a1
    88b4:	00098513          	mv	a0,s3
    88b8:	00090593          	mv	a1,s2
    88bc:	030020ef          	jal	a8ec <__subdf3>
    88c0:	7d4020ef          	jal	b094 <__fixdfsi>
    88c4:	01012803          	lw	a6,16(sp)
    88c8:	002a1793          	sll	a5,s4,0x2
    88cc:	23078793          	add	a5,a5,560
    88d0:	03010713          	add	a4,sp,48
    88d4:	dcada823          	sw	a0,-560(s11)
    88d8:	00e787b3          	add	a5,a5,a4
    88dc:	dd07a823          	sw	a6,-560(a5)
    88e0:	c4dff06f          	j	852c <.L39>

000088e4 <.L91>:
    88e4:	230d8793          	add	a5,s11,560
    88e8:	03010713          	add	a4,sp,48
    88ec:	00098513          	mv	a0,s3
    88f0:	00090593          	mv	a1,s2
    88f4:	00e78db3          	add	s11,a5,a4
    88f8:	79c020ef          	jal	b094 <__fixdfsi>
    88fc:	dcada823          	sw	a0,-560(s11)
    8900:	c2dff06f          	j	852c <.L39>

00008904 <.L43>:
    8904:	002d9713          	sll	a4,s11,0x2
    8908:	00ec8733          	add	a4,s9,a4
    890c:	00072503          	lw	a0,0(a4)
    8910:	003d9793          	sll	a5,s11,0x3
    8914:	00fd07b3          	add	a5,s10,a5
    8918:	00f12423          	sw	a5,8(sp)
    891c:	7f8020ef          	jal	b114 <__floatsidf>
    8920:	00040613          	mv	a2,s0
    8924:	00090693          	mv	a3,s2
    8928:	1d5010ef          	jal	a2fc <__muldf3>
    892c:	00812783          	lw	a5,8(sp)
    8930:	0009a603          	lw	a2,0(s3)
    8934:	0049a683          	lw	a3,4(s3)
    8938:	00a7a023          	sw	a0,0(a5)
    893c:	00b7a223          	sw	a1,4(a5)
    8940:	00040513          	mv	a0,s0
    8944:	00090593          	mv	a1,s2
    8948:	1b5010ef          	jal	a2fc <__muldf3>
    894c:	00050413          	mv	s0,a0
    8950:	00058913          	mv	s2,a1
    8954:	fffd8d93          	add	s11,s11,-1
    8958:	c01ff06f          	j	8558 <.L42>

0000895c <.L46>:
    895c:	000da603          	lw	a2,0(s11)
    8960:	004da683          	lw	a3,4(s11)
    8964:	00072503          	lw	a0,0(a4)
    8968:	00472583          	lw	a1,4(a4)
    896c:	00f12823          	sw	a5,16(sp)
    8970:	00e12423          	sw	a4,8(sp)
    8974:	189010ef          	jal	a2fc <__muldf3>
    8978:	00050613          	mv	a2,a0
    897c:	00058693          	mv	a3,a1
    8980:	000c8513          	mv	a0,s9
    8984:	00098593          	mv	a1,s3
    8988:	199000ef          	jal	9320 <__adddf3>
    898c:	01012783          	lw	a5,16(sp)
    8990:	00812703          	lw	a4,8(sp)
    8994:	00050c93          	mv	s9,a0
    8998:	00058993          	mv	s3,a1
    899c:	00178793          	add	a5,a5,1
    89a0:	00870713          	add	a4,a4,8
    89a4:	008d8d93          	add	s11,s11,8

000089a8 <.L48>:
    89a8:	00fc4463          	blt	s8,a5,89b0 <.L45>
    89ac:	faf458e3          	bge	s0,a5,895c <.L46>

000089b0 <.L45>:
    89b0:	00341413          	sll	s0,s0,0x3
    89b4:	23040793          	add	a5,s0,560
    89b8:	03010713          	add	a4,sp,48
    89bc:	00e78433          	add	s0,a5,a4
    89c0:	ed942023          	sw	s9,-320(s0)
    89c4:	ed342223          	sw	s3,-316(s0)
    89c8:	fff90913          	add	s2,s2,-1
    89cc:	b95ff06f          	j	8560 <.L44>

000089d0 <.L47>:
    89d0:	00200793          	li	a5,2
    89d4:	0497c663          	blt	a5,s1,8a20 <.L49>
    89d8:	16904863          	bgtz	s1,8b48 <.L71>
    89dc:	0e048863          	beqz	s1,8acc <.L72>

000089e0 <.L52>:
    89e0:	29c12083          	lw	ra,668(sp)
    89e4:	29812403          	lw	s0,664(sp)
    89e8:	29412483          	lw	s1,660(sp)
    89ec:	29012903          	lw	s2,656(sp)
    89f0:	28c12983          	lw	s3,652(sp)
    89f4:	28812a03          	lw	s4,648(sp)
    89f8:	28412a83          	lw	s5,644(sp)
    89fc:	28012b03          	lw	s6,640(sp)
    8a00:	27812c03          	lw	s8,632(sp)
    8a04:	27412c83          	lw	s9,628(sp)
    8a08:	27012d03          	lw	s10,624(sp)
    8a0c:	26c12d83          	lw	s11,620(sp)
    8a10:	007bf513          	and	a0,s7,7
    8a14:	27c12b83          	lw	s7,636(sp)
    8a18:	2a010113          	add	sp,sp,672
    8a1c:	00008067          	ret

00008a20 <.L49>:
    8a20:	00300793          	li	a5,3
    8a24:	faf49ee3          	bne	s1,a5,89e0 <.L52>
    8a28:	12010c93          	add	s9,sp,288
    8a2c:	003a1c13          	sll	s8,s4,0x3
    8a30:	018c8c33          	add	s8,s9,s8
    8a34:	000c0d13          	mv	s10,s8
    8a38:	000a0413          	mv	s0,s4

00008a3c <.L53>:
    8a3c:	ff8d0d13          	add	s10,s10,-8
    8a40:	12804863          	bgtz	s0,8b70 <.L61>
    8a44:	000a0493          	mv	s1,s4
    8a48:	00100413          	li	s0,1

00008a4c <.L62>:
    8a4c:	ff8c0c13          	add	s8,s8,-8
    8a50:	18944663          	blt	s0,s1,8bdc <.L63>
    8a54:	00000513          	li	a0,0
    8a58:	00000593          	li	a1,0
    8a5c:	00100413          	li	s0,1

00008a60 <.L64>:
    8a60:	1f444463          	blt	s0,s4,8c48 <.L65>
    8a64:	12012783          	lw	a5,288(sp)
    8a68:	12412683          	lw	a3,292(sp)
    8a6c:	12812603          	lw	a2,296(sp)
    8a70:	12c12703          	lw	a4,300(sp)
    8a74:	1e0b1863          	bnez	s6,8c64 <.L66>
    8a78:	00faa023          	sw	a5,0(s5)
    8a7c:	00daa223          	sw	a3,4(s5)
    8a80:	00caa423          	sw	a2,8(s5)
    8a84:	00eaa623          	sw	a4,12(s5)
    8a88:	00058793          	mv	a5,a1
    8a8c:	00aaa823          	sw	a0,16(s5)

00008a90 <.L96>:
    8a90:	00faaa23          	sw	a5,20(s5)
    8a94:	f4dff06f          	j	89e0 <.L52>

00008a98 <.L54>:
    8a98:	003a1793          	sll	a5,s4,0x3
    8a9c:	00f407b3          	add	a5,s0,a5
    8aa0:	0007a603          	lw	a2,0(a5)
    8aa4:	0047a683          	lw	a3,4(a5)
    8aa8:	fffa0a13          	add	s4,s4,-1
    8aac:	075000ef          	jal	9320 <__adddf3>

00008ab0 <.L51>:
    8ab0:	fe0a54e3          	bgez	s4,8a98 <.L54>
    8ab4:	000b0663          	beqz	s6,8ac0 <.L55>
    8ab8:	800007b7          	lui	a5,0x80000
    8abc:	00b7c5b3          	xor	a1,a5,a1

00008ac0 <.L55>:
    8ac0:	00aaa023          	sw	a0,0(s5)
    8ac4:	00baa223          	sw	a1,4(s5)
    8ac8:	f19ff06f          	j	89e0 <.L52>

00008acc <.L72>:
    8acc:	00000513          	li	a0,0
    8ad0:	00000593          	li	a1,0
    8ad4:	12010413          	add	s0,sp,288
    8ad8:	fd9ff06f          	j	8ab0 <.L51>

00008adc <.L56>:
    8adc:	00349793          	sll	a5,s1,0x3
    8ae0:	00f407b3          	add	a5,s0,a5
    8ae4:	0007a603          	lw	a2,0(a5) # 80000000 <_ebss+0x7ffe9cd0>
    8ae8:	0047a683          	lw	a3,4(a5)
    8aec:	fff48493          	add	s1,s1,-1
    8af0:	031000ef          	jal	9320 <__adddf3>

00008af4 <.L50>:
    8af4:	fe04d4e3          	bgez	s1,8adc <.L56>
    8af8:	00058793          	mv	a5,a1
    8afc:	000b0663          	beqz	s6,8b08 <.L57>
    8b00:	800007b7          	lui	a5,0x80000
    8b04:	00b7c7b3          	xor	a5,a5,a1

00008b08 <.L57>:
    8b08:	00aaa023          	sw	a0,0(s5)
    8b0c:	00050613          	mv	a2,a0
    8b10:	00058693          	mv	a3,a1
    8b14:	12012503          	lw	a0,288(sp)
    8b18:	12412583          	lw	a1,292(sp)
    8b1c:	00faa223          	sw	a5,4(s5)
    8b20:	00100493          	li	s1,1
    8b24:	5c9010ef          	jal	a8ec <__subdf3>

00008b28 <.L58>:
    8b28:	00840413          	add	s0,s0,8
    8b2c:	029a5863          	bge	s4,s1,8b5c <.L59>
    8b30:	000b0663          	beqz	s6,8b3c <.L60>
    8b34:	800007b7          	lui	a5,0x80000
    8b38:	00b7c5b3          	xor	a1,a5,a1

00008b3c <.L60>:
    8b3c:	00aaa423          	sw	a0,8(s5)
    8b40:	00baa623          	sw	a1,12(s5)
    8b44:	e9dff06f          	j	89e0 <.L52>

00008b48 <.L71>:
    8b48:	000a0493          	mv	s1,s4
    8b4c:	00000513          	li	a0,0
    8b50:	00000593          	li	a1,0
    8b54:	12010413          	add	s0,sp,288
    8b58:	f9dff06f          	j	8af4 <.L50>

00008b5c <.L59>:
    8b5c:	00042603          	lw	a2,0(s0)
    8b60:	00442683          	lw	a3,4(s0)
    8b64:	00148493          	add	s1,s1,1
    8b68:	7b8000ef          	jal	9320 <__adddf3>
    8b6c:	fbdff06f          	j	8b28 <.L58>

00008b70 <.L61>:
    8b70:	008d2783          	lw	a5,8(s10)
    8b74:	00cd2803          	lw	a6,12(s10)
    8b78:	000d2903          	lw	s2,0(s10)
    8b7c:	004d2983          	lw	s3,4(s10)
    8b80:	00078613          	mv	a2,a5
    8b84:	00080693          	mv	a3,a6
    8b88:	00090513          	mv	a0,s2
    8b8c:	00098593          	mv	a1,s3
    8b90:	00f12423          	sw	a5,8(sp)
    8b94:	01012623          	sw	a6,12(sp)
    8b98:	788000ef          	jal	9320 <__adddf3>
    8b9c:	00050613          	mv	a2,a0
    8ba0:	00058693          	mv	a3,a1
    8ba4:	00050493          	mv	s1,a0
    8ba8:	00058d93          	mv	s11,a1
    8bac:	00090513          	mv	a0,s2
    8bb0:	00098593          	mv	a1,s3
    8bb4:	539010ef          	jal	a8ec <__subdf3>
    8bb8:	00812603          	lw	a2,8(sp)
    8bbc:	00c12683          	lw	a3,12(sp)
    8bc0:	fff40413          	add	s0,s0,-1
    8bc4:	75c000ef          	jal	9320 <__adddf3>
    8bc8:	00ad2423          	sw	a0,8(s10)
    8bcc:	00bd2623          	sw	a1,12(s10)
    8bd0:	009d2023          	sw	s1,0(s10)
    8bd4:	01bd2223          	sw	s11,4(s10)
    8bd8:	e65ff06f          	j	8a3c <.L53>

00008bdc <.L63>:
    8bdc:	008c2783          	lw	a5,8(s8)
    8be0:	00cc2803          	lw	a6,12(s8)
    8be4:	000c2903          	lw	s2,0(s8)
    8be8:	004c2983          	lw	s3,4(s8)
    8bec:	00078613          	mv	a2,a5
    8bf0:	00080693          	mv	a3,a6
    8bf4:	00090513          	mv	a0,s2
    8bf8:	00098593          	mv	a1,s3
    8bfc:	00f12423          	sw	a5,8(sp)
    8c00:	01012623          	sw	a6,12(sp)
    8c04:	71c000ef          	jal	9320 <__adddf3>
    8c08:	00050613          	mv	a2,a0
    8c0c:	00058693          	mv	a3,a1
    8c10:	00050d93          	mv	s11,a0
    8c14:	00058d13          	mv	s10,a1
    8c18:	00090513          	mv	a0,s2
    8c1c:	00098593          	mv	a1,s3
    8c20:	4cd010ef          	jal	a8ec <__subdf3>
    8c24:	00812603          	lw	a2,8(sp)
    8c28:	00c12683          	lw	a3,12(sp)
    8c2c:	fff48493          	add	s1,s1,-1
    8c30:	6f0000ef          	jal	9320 <__adddf3>
    8c34:	00ac2423          	sw	a0,8(s8)
    8c38:	00bc2623          	sw	a1,12(s8)
    8c3c:	01bc2023          	sw	s11,0(s8)
    8c40:	01ac2223          	sw	s10,4(s8)
    8c44:	e09ff06f          	j	8a4c <.L62>

00008c48 <.L65>:
    8c48:	003a1793          	sll	a5,s4,0x3
    8c4c:	00fc87b3          	add	a5,s9,a5
    8c50:	0007a603          	lw	a2,0(a5) # 80000000 <_ebss+0x7ffe9cd0>
    8c54:	0047a683          	lw	a3,4(a5)
    8c58:	fffa0a13          	add	s4,s4,-1
    8c5c:	6c4000ef          	jal	9320 <__adddf3>
    8c60:	e01ff06f          	j	8a60 <.L64>

00008c64 <.L66>:
    8c64:	00faa023          	sw	a5,0(s5)
    8c68:	800007b7          	lui	a5,0x80000
    8c6c:	00d7c6b3          	xor	a3,a5,a3
    8c70:	00e7c733          	xor	a4,a5,a4
    8c74:	00daa223          	sw	a3,4(s5)
    8c78:	00caa423          	sw	a2,8(s5)
    8c7c:	00eaa623          	sw	a4,12(s5)
    8c80:	00aaa823          	sw	a0,16(s5)
    8c84:	00b7c7b3          	xor	a5,a5,a1
    8c88:	e09ff06f          	j	8a90 <.L96>

00008c8c <__kernel_sin>:
    8c8c:	fb010113          	add	sp,sp,-80
    8c90:	00159793          	sll	a5,a1,0x1
    8c94:	04812423          	sw	s0,72(sp)
    8c98:	04912223          	sw	s1,68(sp)
    8c9c:	03612823          	sw	s6,48(sp)
    8ca0:	03712623          	sw	s7,44(sp)
    8ca4:	03a12023          	sw	s10,32(sp)
    8ca8:	04112623          	sw	ra,76(sp)
    8cac:	00070d13          	mv	s10,a4
    8cb0:	05212023          	sw	s2,64(sp)
    8cb4:	03312e23          	sw	s3,60(sp)
    8cb8:	03412c23          	sw	s4,56(sp)
    8cbc:	03512a23          	sw	s5,52(sp)
    8cc0:	03812423          	sw	s8,40(sp)
    8cc4:	03912223          	sw	s9,36(sp)
    8cc8:	01b12e23          	sw	s11,28(sp)
    8ccc:	0017d793          	srl	a5,a5,0x1
    8cd0:	3e400737          	lui	a4,0x3e400
    8cd4:	00050493          	mv	s1,a0
    8cd8:	00058413          	mv	s0,a1
    8cdc:	00060b93          	mv	s7,a2
    8ce0:	00068b13          	mv	s6,a3
    8ce4:	00e7f663          	bgeu	a5,a4,8cf0 <.L2>
    8ce8:	3ac020ef          	jal	b094 <__fixdfsi>
    8cec:	12050463          	beqz	a0,8e14 <.L3>

00008cf0 <.L2>:
    8cf0:	00048613          	mv	a2,s1
    8cf4:	00040693          	mv	a3,s0
    8cf8:	00048513          	mv	a0,s1
    8cfc:	00040593          	mv	a1,s0
    8d00:	5fc010ef          	jal	a2fc <__muldf3>
    8d04:	00050993          	mv	s3,a0
    8d08:	00058913          	mv	s2,a1
    8d0c:	00050613          	mv	a2,a0
    8d10:	00058693          	mv	a3,a1
    8d14:	00048513          	mv	a0,s1
    8d18:	00040593          	mv	a1,s0
    8d1c:	5e0010ef          	jal	a2fc <__muldf3>
    8d20:	00009797          	auipc	a5,0x9
    8d24:	7e878793          	add	a5,a5,2024 # 12508 <.LC0>
    8d28:	0007a603          	lw	a2,0(a5)
    8d2c:	0047a683          	lw	a3,4(a5)
    8d30:	00050a93          	mv	s5,a0
    8d34:	00058a13          	mv	s4,a1
    8d38:	00098513          	mv	a0,s3
    8d3c:	00090593          	mv	a1,s2
    8d40:	5bc010ef          	jal	a2fc <__muldf3>
    8d44:	00009797          	auipc	a5,0x9
    8d48:	7cc78793          	add	a5,a5,1996 # 12510 <.LC1>
    8d4c:	0007a603          	lw	a2,0(a5)
    8d50:	0047a683          	lw	a3,4(a5)
    8d54:	00009d97          	auipc	s11,0x9
    8d58:	7dcd8d93          	add	s11,s11,2012 # 12530 <.LC5>
    8d5c:	391010ef          	jal	a8ec <__subdf3>
    8d60:	00098613          	mv	a2,s3
    8d64:	00090693          	mv	a3,s2
    8d68:	594010ef          	jal	a2fc <__muldf3>
    8d6c:	00009797          	auipc	a5,0x9
    8d70:	7ac78793          	add	a5,a5,1964 # 12518 <.LC2>
    8d74:	0007a603          	lw	a2,0(a5)
    8d78:	0047a683          	lw	a3,4(a5)
    8d7c:	5a4000ef          	jal	9320 <__adddf3>
    8d80:	00098613          	mv	a2,s3
    8d84:	00090693          	mv	a3,s2
    8d88:	574010ef          	jal	a2fc <__muldf3>
    8d8c:	00009797          	auipc	a5,0x9
    8d90:	79478793          	add	a5,a5,1940 # 12520 <.LC3>
    8d94:	0007a603          	lw	a2,0(a5)
    8d98:	0047a683          	lw	a3,4(a5)
    8d9c:	351010ef          	jal	a8ec <__subdf3>
    8da0:	00098613          	mv	a2,s3
    8da4:	00090693          	mv	a3,s2
    8da8:	554010ef          	jal	a2fc <__muldf3>
    8dac:	00009797          	auipc	a5,0x9
    8db0:	77c78793          	add	a5,a5,1916 # 12528 <.LC4>
    8db4:	0007a603          	lw	a2,0(a5)
    8db8:	0047a683          	lw	a3,4(a5)
    8dbc:	564000ef          	jal	9320 <__adddf3>
    8dc0:	00050c93          	mv	s9,a0
    8dc4:	00058c13          	mv	s8,a1
    8dc8:	080d1863          	bnez	s10,8e58 <.L4>
    8dcc:	00050613          	mv	a2,a0
    8dd0:	00058693          	mv	a3,a1
    8dd4:	00098513          	mv	a0,s3
    8dd8:	00090593          	mv	a1,s2
    8ddc:	520010ef          	jal	a2fc <__muldf3>
    8de0:	000da603          	lw	a2,0(s11)
    8de4:	004da683          	lw	a3,4(s11)
    8de8:	305010ef          	jal	a8ec <__subdf3>
    8dec:	000a8613          	mv	a2,s5
    8df0:	000a0693          	mv	a3,s4
    8df4:	508010ef          	jal	a2fc <__muldf3>
    8df8:	00050613          	mv	a2,a0
    8dfc:	00058693          	mv	a3,a1
    8e00:	00048513          	mv	a0,s1
    8e04:	00040593          	mv	a1,s0
    8e08:	518000ef          	jal	9320 <__adddf3>

00008e0c <.L9>:
    8e0c:	00050493          	mv	s1,a0
    8e10:	00058413          	mv	s0,a1

00008e14 <.L3>:
    8e14:	04c12083          	lw	ra,76(sp)
    8e18:	00040593          	mv	a1,s0
    8e1c:	04812403          	lw	s0,72(sp)
    8e20:	04012903          	lw	s2,64(sp)
    8e24:	03c12983          	lw	s3,60(sp)
    8e28:	03812a03          	lw	s4,56(sp)
    8e2c:	03412a83          	lw	s5,52(sp)
    8e30:	03012b03          	lw	s6,48(sp)
    8e34:	02c12b83          	lw	s7,44(sp)
    8e38:	02812c03          	lw	s8,40(sp)
    8e3c:	02412c83          	lw	s9,36(sp)
    8e40:	02012d03          	lw	s10,32(sp)
    8e44:	01c12d83          	lw	s11,28(sp)
    8e48:	00048513          	mv	a0,s1
    8e4c:	04412483          	lw	s1,68(sp)
    8e50:	05010113          	add	sp,sp,80
    8e54:	00008067          	ret

00008e58 <.L4>:
    8e58:	00009797          	auipc	a5,0x9
    8e5c:	64078793          	add	a5,a5,1600 # 12498 <.LC2>
    8e60:	0007a603          	lw	a2,0(a5)
    8e64:	0047a683          	lw	a3,4(a5)
    8e68:	000b8513          	mv	a0,s7
    8e6c:	000b0593          	mv	a1,s6
    8e70:	48c010ef          	jal	a2fc <__muldf3>
    8e74:	00a12623          	sw	a0,12(sp)
    8e78:	00058d13          	mv	s10,a1
    8e7c:	000c8613          	mv	a2,s9
    8e80:	000c0693          	mv	a3,s8
    8e84:	000a8513          	mv	a0,s5
    8e88:	000a0593          	mv	a1,s4
    8e8c:	470010ef          	jal	a2fc <__muldf3>
    8e90:	00c12783          	lw	a5,12(sp)
    8e94:	00050613          	mv	a2,a0
    8e98:	00058693          	mv	a3,a1
    8e9c:	00078513          	mv	a0,a5
    8ea0:	000d0593          	mv	a1,s10
    8ea4:	249010ef          	jal	a8ec <__subdf3>
    8ea8:	00098613          	mv	a2,s3
    8eac:	00090693          	mv	a3,s2
    8eb0:	44c010ef          	jal	a2fc <__muldf3>
    8eb4:	000b8613          	mv	a2,s7
    8eb8:	000b0693          	mv	a3,s6
    8ebc:	231010ef          	jal	a8ec <__subdf3>
    8ec0:	000da603          	lw	a2,0(s11)
    8ec4:	004da683          	lw	a3,4(s11)
    8ec8:	00050993          	mv	s3,a0
    8ecc:	00058913          	mv	s2,a1
    8ed0:	000a8513          	mv	a0,s5
    8ed4:	000a0593          	mv	a1,s4
    8ed8:	424010ef          	jal	a2fc <__muldf3>
    8edc:	00050613          	mv	a2,a0
    8ee0:	00058693          	mv	a3,a1
    8ee4:	00098513          	mv	a0,s3
    8ee8:	00090593          	mv	a1,s2
    8eec:	434000ef          	jal	9320 <__adddf3>
    8ef0:	00050613          	mv	a2,a0
    8ef4:	00058693          	mv	a3,a1
    8ef8:	00048513          	mv	a0,s1
    8efc:	00040593          	mv	a1,s0
    8f00:	1ed010ef          	jal	a8ec <__subdf3>
    8f04:	f09ff06f          	j	8e0c <.L9>

00008f08 <__GI_floor>:
    8f08:	4145d693          	sra	a3,a1,0x14
    8f0c:	fe010113          	add	sp,sp,-32
    8f10:	7ff6f693          	and	a3,a3,2047
    8f14:	00812c23          	sw	s0,24(sp)
    8f18:	00912a23          	sw	s1,20(sp)
    8f1c:	01312623          	sw	s3,12(sp)
    8f20:	01512223          	sw	s5,4(sp)
    8f24:	00112e23          	sw	ra,28(sp)
    8f28:	01212823          	sw	s2,16(sp)
    8f2c:	01412423          	sw	s4,8(sp)
    8f30:	c0168493          	add	s1,a3,-1023
    8f34:	01300613          	li	a2,19
    8f38:	00050713          	mv	a4,a0
    8f3c:	00058793          	mv	a5,a1
    8f40:	00058413          	mv	s0,a1
    8f44:	00050a93          	mv	s5,a0
    8f48:	00050993          	mv	s3,a0
    8f4c:	0a964663          	blt	a2,s1,8ff8 <.L2>
    8f50:	0404d863          	bgez	s1,8fa0 <.L3>
    8f54:	00009797          	auipc	a5,0x9
    8f58:	49c78793          	add	a5,a5,1180 # 123f0 <.LC0>
    8f5c:	0007a603          	lw	a2,0(a5)
    8f60:	0047a683          	lw	a3,4(a5)
    8f64:	3bc000ef          	jal	9320 <__adddf3>
    8f68:	00000613          	li	a2,0
    8f6c:	00000693          	li	a3,0
    8f70:	2b0010ef          	jal	a220 <__gedf2>
    8f74:	02a05063          	blez	a0,8f94 <.L4>
    8f78:	14045063          	bgez	s0,90b8 <.L13>
    8f7c:	00141413          	sll	s0,s0,0x1
    8f80:	00145413          	srl	s0,s0,0x1
    8f84:	01546433          	or	s0,s0,s5
    8f88:	00000993          	li	s3,0
    8f8c:	12041c63          	bnez	s0,90c4 <.L14>
    8f90:	80000437          	lui	s0,0x80000

00008f94 <.L4>:
    8f94:	00098713          	mv	a4,s3
    8f98:	00040793          	mv	a5,s0
    8f9c:	0800006f          	j	901c <.L6>

00008fa0 <.L3>:
    8fa0:	00100a37          	lui	s4,0x100
    8fa4:	fffa0913          	add	s2,s4,-1 # fffff <_ebss+0xe9ccf>
    8fa8:	40995933          	sra	s2,s2,s1
    8fac:	0125f6b3          	and	a3,a1,s2
    8fb0:	00a6e6b3          	or	a3,a3,a0
    8fb4:	06068463          	beqz	a3,901c <.L6>
    8fb8:	00009797          	auipc	a5,0x9
    8fbc:	43878793          	add	a5,a5,1080 # 123f0 <.LC0>
    8fc0:	0007a603          	lw	a2,0(a5)
    8fc4:	0047a683          	lw	a3,4(a5)
    8fc8:	358000ef          	jal	9320 <__adddf3>
    8fcc:	00000613          	li	a2,0
    8fd0:	00000693          	li	a3,0
    8fd4:	24c010ef          	jal	a220 <__gedf2>
    8fd8:	faa05ee3          	blez	a0,8f94 <.L4>
    8fdc:	00045663          	bgez	s0,8fe8 <.L8>
    8fe0:	409a5a33          	sra	s4,s4,s1
    8fe4:	01440433          	add	s0,s0,s4

00008fe8 <.L8>:
    8fe8:	fff94913          	not	s2,s2
    8fec:	01247433          	and	s0,s0,s2
    8ff0:	00000993          	li	s3,0
    8ff4:	fa1ff06f          	j	8f94 <.L4>

00008ff8 <.L2>:
    8ff8:	03300613          	li	a2,51
    8ffc:	04965663          	bge	a2,s1,9048 <.L9>
    9000:	40000693          	li	a3,1024
    9004:	00d49c63          	bne	s1,a3,901c <.L6>
    9008:	00050613          	mv	a2,a0
    900c:	00058693          	mv	a3,a1
    9010:	310000ef          	jal	9320 <__adddf3>
    9014:	00050713          	mv	a4,a0
    9018:	00058793          	mv	a5,a1

0000901c <.L6>:
    901c:	01c12083          	lw	ra,28(sp)
    9020:	01812403          	lw	s0,24(sp)
    9024:	01412483          	lw	s1,20(sp)
    9028:	01012903          	lw	s2,16(sp)
    902c:	00c12983          	lw	s3,12(sp)
    9030:	00812a03          	lw	s4,8(sp)
    9034:	00412a83          	lw	s5,4(sp)
    9038:	00070513          	mv	a0,a4
    903c:	00078593          	mv	a1,a5
    9040:	02010113          	add	sp,sp,32
    9044:	00008067          	ret

00009048 <.L9>:
    9048:	bed68693          	add	a3,a3,-1043
    904c:	fff00913          	li	s2,-1
    9050:	00d95933          	srl	s2,s2,a3
    9054:	00a976b3          	and	a3,s2,a0
    9058:	fc0682e3          	beqz	a3,901c <.L6>
    905c:	00009797          	auipc	a5,0x9
    9060:	39478793          	add	a5,a5,916 # 123f0 <.LC0>
    9064:	0007a603          	lw	a2,0(a5)
    9068:	0047a683          	lw	a3,4(a5)
    906c:	2b4000ef          	jal	9320 <__adddf3>
    9070:	00000613          	li	a2,0
    9074:	00000693          	li	a3,0
    9078:	1a8010ef          	jal	a220 <__gedf2>
    907c:	f0a05ce3          	blez	a0,8f94 <.L4>
    9080:	02045663          	bgez	s0,90ac <.L11>
    9084:	01400793          	li	a5,20
    9088:	00f49663          	bne	s1,a5,9094 <.L12>

0000908c <.L25>:
    908c:	00140413          	add	s0,s0,1 # 80000001 <_ebss+0x7ffe9cd1>
    9090:	01c0006f          	j	90ac <.L11>

00009094 <.L12>:
    9094:	03400713          	li	a4,52
    9098:	40970733          	sub	a4,a4,s1
    909c:	00100793          	li	a5,1
    90a0:	00e797b3          	sll	a5,a5,a4
    90a4:	00fa89b3          	add	s3,s5,a5
    90a8:	ff59e2e3          	bltu	s3,s5,908c <.L25>

000090ac <.L11>:
    90ac:	fff94913          	not	s2,s2
    90b0:	0129f9b3          	and	s3,s3,s2
    90b4:	ee1ff06f          	j	8f94 <.L4>

000090b8 <.L13>:
    90b8:	00000993          	li	s3,0
    90bc:	00000413          	li	s0,0
    90c0:	ed5ff06f          	j	8f94 <.L4>

000090c4 <.L14>:
    90c4:	bff00437          	lui	s0,0xbff00
    90c8:	ecdff06f          	j	8f94 <.L4>

000090cc <__GI_scalbln>:
    90cc:	ff010113          	add	sp,sp,-16
    90d0:	4145d693          	sra	a3,a1,0x14
    90d4:	00812423          	sw	s0,8(sp)
    90d8:	00112623          	sw	ra,12(sp)
    90dc:	00912223          	sw	s1,4(sp)
    90e0:	7ff6f693          	and	a3,a3,2047
    90e4:	00050713          	mv	a4,a0
    90e8:	00058793          	mv	a5,a1
    90ec:	00060413          	mv	s0,a2
    90f0:	08069063          	bnez	a3,9170 <.L2>
    90f4:	00159693          	sll	a3,a1,0x1
    90f8:	0016d693          	srl	a3,a3,0x1
    90fc:	00a6e6b3          	or	a3,a3,a0
    9100:	0c068263          	beqz	a3,91c4 <.L3>
    9104:	00009797          	auipc	a5,0x9
    9108:	43478793          	add	a5,a5,1076 # 12538 <.LC0>
    910c:	0047a683          	lw	a3,4(a5)
    9110:	0007a603          	lw	a2,0(a5)
    9114:	1e8010ef          	jal	a2fc <__muldf3>
    9118:	4145d693          	sra	a3,a1,0x14
    911c:	7ff6f693          	and	a3,a3,2047
    9120:	00050713          	mv	a4,a0
    9124:	00058793          	mv	a5,a1
    9128:	00058813          	mv	a6,a1
    912c:	fca68693          	add	a3,a3,-54

00009130 <.L4>:
    9130:	00d406b3          	add	a3,s0,a3
    9134:	7fe00613          	li	a2,2046
    9138:	04d65e63          	bge	a2,a3,9194 <.L5>
    913c:	00009697          	auipc	a3,0x9
    9140:	2b468693          	add	a3,a3,692 # 123f0 <.LC0>

00009144 <.L15>:
    9144:	0006a403          	lw	s0,0(a3)
    9148:	0046a483          	lw	s1,4(a3)
    914c:	00070613          	mv	a2,a4
    9150:	00078693          	mv	a3,a5
    9154:	00040513          	mv	a0,s0
    9158:	00048593          	mv	a1,s1
    915c:	16c000ef          	jal	92c8 <__GI_copysign>
    9160:	00040613          	mv	a2,s0
    9164:	00048693          	mv	a3,s1

00009168 <.L14>:
    9168:	194010ef          	jal	a2fc <__muldf3>
    916c:	01c0006f          	j	9188 <.L13>

00009170 <.L2>:
    9170:	7ff00613          	li	a2,2047
    9174:	00058813          	mv	a6,a1
    9178:	fac69ce3          	bne	a3,a2,9130 <.L4>
    917c:	00050613          	mv	a2,a0
    9180:	00058693          	mv	a3,a1
    9184:	19c000ef          	jal	9320 <__adddf3>

00009188 <.L13>:
    9188:	00050713          	mv	a4,a0
    918c:	00058793          	mv	a5,a1
    9190:	0340006f          	j	91c4 <.L3>

00009194 <.L5>:
    9194:	ffff4637          	lui	a2,0xffff4
    9198:	cb060613          	add	a2,a2,-848 # ffff3cb0 <_ebss+0xfffdd980>
    919c:	00c45863          	bge	s0,a2,91ac <.L6>

000091a0 <.L16>:
    91a0:	00009697          	auipc	a3,0x9
    91a4:	3a068693          	add	a3,a3,928 # 12540 <.LC2>
    91a8:	f9dff06f          	j	9144 <.L15>

000091ac <.L6>:
    91ac:	02d05a63          	blez	a3,91e0 <.L7>
    91b0:	801007b7          	lui	a5,0x80100
    91b4:	fff78793          	add	a5,a5,-1 # 800fffff <_ebss+0x800e9ccf>
    91b8:	00f87833          	and	a6,a6,a5
    91bc:	01469693          	sll	a3,a3,0x14
    91c0:	00d867b3          	or	a5,a6,a3

000091c4 <.L3>:
    91c4:	00c12083          	lw	ra,12(sp)
    91c8:	00812403          	lw	s0,8(sp)
    91cc:	00412483          	lw	s1,4(sp)
    91d0:	00070513          	mv	a0,a4
    91d4:	00078593          	mv	a1,a5
    91d8:	01010113          	add	sp,sp,16
    91dc:	00008067          	ret

000091e0 <.L7>:
    91e0:	fcb00613          	li	a2,-53
    91e4:	fac6cee3          	blt	a3,a2,91a0 <.L16>
    91e8:	801007b7          	lui	a5,0x80100
    91ec:	fff78793          	add	a5,a5,-1 # 800fffff <_ebss+0x800e9ccf>
    91f0:	03668693          	add	a3,a3,54
    91f4:	01469693          	sll	a3,a3,0x14
    91f8:	00f87833          	and	a6,a6,a5
    91fc:	00070893          	mv	a7,a4
    9200:	0106e7b3          	or	a5,a3,a6
    9204:	00009717          	auipc	a4,0x9
    9208:	34470713          	add	a4,a4,836 # 12548 <.LC3>
    920c:	00072603          	lw	a2,0(a4)
    9210:	00472683          	lw	a3,4(a4)
    9214:	00088513          	mv	a0,a7
    9218:	00078593          	mv	a1,a5
    921c:	f4dff06f          	j	9168 <.L14>

00009220 <__GI_read>:
    9220:	03f00893          	li	a7,63
    9224:	00000073          	ecall
    9228:	fffff7b7          	lui	a5,0xfffff
    922c:	00a7fc63          	bgeu	a5,a0,9244 <.L1>
    9230:	40a00533          	neg	a0,a0
    9234:	00007797          	auipc	a5,0x7
    9238:	3a07a783          	lw	a5,928(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    923c:	00a7a023          	sw	a0,0(a5)
    9240:	fff00513          	li	a0,-1

00009244 <.L1>:
    9244:	00008067          	ret

00009248 <__GI_lseek64>:
    9248:	00058793          	mv	a5,a1
    924c:	ff010113          	add	sp,sp,-16
    9250:	00068713          	mv	a4,a3
    9254:	00060593          	mv	a1,a2
    9258:	00810693          	add	a3,sp,8
    925c:	00078613          	mv	a2,a5
    9260:	03e00893          	li	a7,62
    9264:	00000073          	ecall
    9268:	fffff7b7          	lui	a5,0xfffff
    926c:	02a7f263          	bgeu	a5,a0,9290 <.L2>
    9270:	40a00533          	neg	a0,a0
    9274:	00007797          	auipc	a5,0x7
    9278:	3607a783          	lw	a5,864(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    927c:	00a7a023          	sw	a0,0(a5)
    9280:	fff00593          	li	a1,-1
    9284:	fff00513          	li	a0,-1

00009288 <.L1>:
    9288:	01010113          	add	sp,sp,16
    928c:	00008067          	ret

00009290 <.L2>:
    9290:	41f55593          	sra	a1,a0,0x1f
    9294:	00b567b3          	or	a5,a0,a1
    9298:	fe0798e3          	bnez	a5,9288 <.L1>
    929c:	00812503          	lw	a0,8(sp)
    92a0:	00c12583          	lw	a1,12(sp)
    92a4:	fe5ff06f          	j	9288 <.L1>

000092a8 <__GI_raise>:
    92a8:	fe010113          	add	sp,sp,-32
    92ac:	00112e23          	sw	ra,28(sp)
    92b0:	00a12623          	sw	a0,12(sp)
    92b4:	038000ef          	jal	92ec <__GI_getpid>
    92b8:	00c12583          	lw	a1,12(sp)
    92bc:	01c12083          	lw	ra,28(sp)
    92c0:	02010113          	add	sp,sp,32
    92c4:	0340006f          	j	92f8 <__GI_kill>

000092c8 <__GI_copysign>:
    92c8:	800007b7          	lui	a5,0x80000
    92cc:	fff78713          	add	a4,a5,-1 # 7fffffff <_ebss+0x7ffe9ccf>
    92d0:	00b775b3          	and	a1,a4,a1
    92d4:	00d7f7b3          	and	a5,a5,a3
    92d8:	00f5e733          	or	a4,a1,a5
    92dc:	00050693          	mv	a3,a0
    92e0:	00068513          	mv	a0,a3
    92e4:	00070593          	mv	a1,a4
    92e8:	00008067          	ret

000092ec <__GI_getpid>:
    92ec:	0ac00893          	li	a7,172
    92f0:	00000073          	ecall
    92f4:	00008067          	ret

000092f8 <__GI_kill>:
    92f8:	08100893          	li	a7,129
    92fc:	00000073          	ecall
    9300:	fffff7b7          	lui	a5,0xfffff
    9304:	00a7fc63          	bgeu	a5,a0,931c <.L1>
    9308:	40a00533          	neg	a0,a0
    930c:	00007797          	auipc	a5,0x7
    9310:	2c87a783          	lw	a5,712(a5) # 105d4 <_GLOBAL_OFFSET_TABLE_+0xc>
    9314:	00a7a023          	sw	a0,0(a5)
    9318:	fff00513          	li	a0,-1

0000931c <.L1>:
    931c:	00008067          	ret

00009320 <__adddf3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
    9320:	00100837          	lui	a6,0x100
    9324:	fff80813          	add	a6,a6,-1 # fffff <_ebss+0xe9ccf>

00009328 <.LBE2>:
{
    9328:	fe010113          	add	sp,sp,-32

0000932c <.LBB3>:
  FP_UNPACK_SEMIRAW_D (A, a);
    932c:	00b878b3          	and	a7,a6,a1

00009330 <.LVL1>:
    9330:	0145d713          	srl	a4,a1,0x14

00009334 <.LBE3>:
    9334:	01d55793          	srl	a5,a0,0x1d

00009338 <.LBB5>:
  FP_UNPACK_SEMIRAW_D (B, b);
    9338:	00d87833          	and	a6,a6,a3

0000933c <.LBE5>:
{
    933c:	00912a23          	sw	s1,20(sp)

00009340 <.LBB6>:
  FP_UNPACK_SEMIRAW_D (A, a);
    9340:	7ff77493          	and	s1,a4,2047

00009344 <.LBE6>:
    9344:	00389713          	sll	a4,a7,0x3

00009348 <.LBB8>:
  FP_UNPACK_SEMIRAW_D (B, b);
    9348:	0146d893          	srl	a7,a3,0x14

0000934c <.LBE8>:
    934c:	00381813          	sll	a6,a6,0x3
{
    9350:	01212823          	sw	s2,16(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
    9354:	00e7e7b3          	or	a5,a5,a4

00009358 <.LBB11>:
  FP_UNPACK_SEMIRAW_D (B, b);
    9358:	7ff8f893          	and	a7,a7,2047

0000935c <.LBE11>:
    935c:	01d65713          	srl	a4,a2,0x1d
{
    9360:	00112e23          	sw	ra,28(sp)
    9364:	00812c23          	sw	s0,24(sp)
    9368:	01312623          	sw	s3,12(sp)

0000936c <.LBB13>:
  FP_UNPACK_SEMIRAW_D (A, a);
    936c:	01f5d913          	srl	s2,a1,0x1f

00009370 <.LBB15>:
  FP_UNPACK_SEMIRAW_D (B, b);
    9370:	01f6d693          	srl	a3,a3,0x1f

00009374 <.LBE15>:
    9374:	01076733          	or	a4,a4,a6
  FP_UNPACK_SEMIRAW_D (A, a);
    9378:	00351513          	sll	a0,a0,0x3

0000937c <.LBB18>:
  FP_UNPACK_SEMIRAW_D (B, b);
    937c:	00361613          	sll	a2,a2,0x3

00009380 <.LVL6>:
  FP_ADD_D (R, A, B);
    9380:	41148833          	sub	a6,s1,a7
    9384:	2ad91a63          	bne	s2,a3,9638 <.L2>

00009388 <.LBB20>:
    9388:	11005c63          	blez	a6,94a0 <.L3>

0000938c <.LVL8>:
    938c:	04089063          	bnez	a7,93cc <.L4>
    9390:	00c766b3          	or	a3,a4,a2

00009394 <.LVL9>:
    9394:	66068063          	beqz	a3,99f4 <.L100>
    9398:	fff80593          	add	a1,a6,-1

0000939c <.LVL10>:
    939c:	02059063          	bnez	a1,93bc <.L6>

000093a0 <.L143>:
    93a0:	00c50633          	add	a2,a0,a2

000093a4 <.LVL12>:
    93a4:	00a636b3          	sltu	a3,a2,a0
    93a8:	00e78733          	add	a4,a5,a4

000093ac <.LVL13>:
    93ac:	00060513          	mv	a0,a2

000093b0 <.LVL14>:
    93b0:	00d707b3          	add	a5,a4,a3

000093b4 <.LBE21>:
    93b4:	00100493          	li	s1,1

000093b8 <.LVL16>:
    93b8:	06c0006f          	j	9424 <.L9>

000093bc <.L6>:
    93bc:	7ff00693          	li	a3,2047
    93c0:	02d81063          	bne	a6,a3,93e0 <.L10>

000093c4 <.L110>:
    93c4:	7ff00493          	li	s1,2047

000093c8 <.LVL19>:
    93c8:	1f80006f          	j	95c0 <.L5>

000093cc <.L4>:
    93cc:	7ff00693          	li	a3,2047

000093d0 <.LVL21>:
    93d0:	1ed48863          	beq	s1,a3,95c0 <.L5>
    93d4:	008006b7          	lui	a3,0x800
    93d8:	00d76733          	or	a4,a4,a3
    93dc:	00080593          	mv	a1,a6

000093e0 <.L10>:
    93e0:	03800693          	li	a3,56
    93e4:	0ab6c863          	blt	a3,a1,9494 <.L11>
    93e8:	01f00693          	li	a3,31
    93ec:	06b6ca63          	blt	a3,a1,9460 <.L12>
    93f0:	02000813          	li	a6,32
    93f4:	40b80833          	sub	a6,a6,a1
    93f8:	010716b3          	sll	a3,a4,a6
    93fc:	00b658b3          	srl	a7,a2,a1

00009400 <.LVL24>:
    9400:	01061833          	sll	a6,a2,a6
    9404:	0116e6b3          	or	a3,a3,a7
    9408:	01003833          	snez	a6,a6
    940c:	0106e6b3          	or	a3,a3,a6

00009410 <.LVL25>:
    9410:	00b755b3          	srl	a1,a4,a1

00009414 <.L13>:
    9414:	00a68533          	add	a0,a3,a0

00009418 <.LVL27>:
    9418:	00f585b3          	add	a1,a1,a5

0000941c <.LVL28>:
    941c:	00d536b3          	sltu	a3,a0,a3

00009420 <.LVL29>:
    9420:	00d587b3          	add	a5,a1,a3

00009424 <.L9>:
    9424:	00879713          	sll	a4,a5,0x8
    9428:	18075c63          	bgez	a4,95c0 <.L5>

0000942c <.LVL31>:
    942c:	00148493          	add	s1,s1,1

00009430 <.LVL32>:
    9430:	7ff00713          	li	a4,2047
    9434:	5ae48a63          	beq	s1,a4,99e8 <.L150>
    9438:	ff800737          	lui	a4,0xff800
    943c:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9ccf>
    9440:	00e7f733          	and	a4,a5,a4
    9444:	00155793          	srl	a5,a0,0x1

00009448 <.LVL33>:
    9448:	00157513          	and	a0,a0,1
    944c:	00a7e7b3          	or	a5,a5,a0
    9450:	01f71513          	sll	a0,a4,0x1f
    9454:	00f56533          	or	a0,a0,a5
    9458:	00175793          	srl	a5,a4,0x1
    945c:	1640006f          	j	95c0 <.L5>

00009460 <.L12>:
    9460:	fe058693          	add	a3,a1,-32
    9464:	02000893          	li	a7,32

00009468 <.LVL35>:
    9468:	00d756b3          	srl	a3,a4,a3
    946c:	00000813          	li	a6,0
    9470:	01158863          	beq	a1,a7,9480 <.L14>
    9474:	04000813          	li	a6,64
    9478:	40b80833          	sub	a6,a6,a1
    947c:	01071833          	sll	a6,a4,a6

00009480 <.L14>:
    9480:	00c86833          	or	a6,a6,a2
    9484:	01003833          	snez	a6,a6
    9488:	0106e6b3          	or	a3,a3,a6

0000948c <.L141>:
    948c:	00000593          	li	a1,0

00009490 <.LVL37>:
    9490:	f85ff06f          	j	9414 <.L13>

00009494 <.L11>:
    9494:	00c766b3          	or	a3,a4,a2
    9498:	00d036b3          	snez	a3,a3
    949c:	ff1ff06f          	j	948c <.L141>

000094a0 <.L3>:
    94a0:	0c080a63          	beqz	a6,9574 <.L17>
    94a4:	409886b3          	sub	a3,a7,s1

000094a8 <.LVL40>:
    94a8:	02049463          	bnez	s1,94d0 <.L18>
    94ac:	00a7e5b3          	or	a1,a5,a0
    94b0:	50058e63          	beqz	a1,99cc <.L91>
    94b4:	fff68593          	add	a1,a3,-1 # 7fffff <_ebss+0x7e9ccf>

000094b8 <.LVL41>:
    94b8:	ee0584e3          	beqz	a1,93a0 <.L143>
    94bc:	7ff00813          	li	a6,2047
    94c0:	03069263          	bne	a3,a6,94e4 <.L22>

000094c4 <.L96>:
    94c4:	00070793          	mv	a5,a4

000094c8 <.LVL43>:
    94c8:	00060513          	mv	a0,a2

000094cc <.LVL44>:
    94cc:	ef9ff06f          	j	93c4 <.L110>

000094d0 <.L18>:
    94d0:	7ff00593          	li	a1,2047
    94d4:	feb888e3          	beq	a7,a1,94c4 <.L96>
    94d8:	008005b7          	lui	a1,0x800
    94dc:	00b7e7b3          	or	a5,a5,a1
    94e0:	00068593          	mv	a1,a3

000094e4 <.L22>:
    94e4:	03800693          	li	a3,56
    94e8:	08b6c063          	blt	a3,a1,9568 <.L23>
    94ec:	01f00693          	li	a3,31
    94f0:	04b6c263          	blt	a3,a1,9534 <.L24>
    94f4:	02000813          	li	a6,32
    94f8:	40b80833          	sub	a6,a6,a1
    94fc:	010796b3          	sll	a3,a5,a6
    9500:	00b55333          	srl	t1,a0,a1
    9504:	01051833          	sll	a6,a0,a6
    9508:	0066e6b3          	or	a3,a3,t1
    950c:	01003833          	snez	a6,a6
    9510:	0106e6b3          	or	a3,a3,a6

00009514 <.LVL48>:
    9514:	00b7d5b3          	srl	a1,a5,a1

00009518 <.L25>:
    9518:	00c68633          	add	a2,a3,a2

0000951c <.LVL50>:
    951c:	00e585b3          	add	a1,a1,a4

00009520 <.LVL51>:
    9520:	00d636b3          	sltu	a3,a2,a3

00009524 <.LVL52>:
    9524:	00060513          	mv	a0,a2

00009528 <.LVL53>:
    9528:	00d587b3          	add	a5,a1,a3

0000952c <.LBE28>:
    952c:	00088493          	mv	s1,a7

00009530 <.LVL55>:
    9530:	ef5ff06f          	j	9424 <.L9>

00009534 <.L24>:
    9534:	fe058693          	add	a3,a1,-32 # 7fffe0 <_ebss+0x7e9cb0>
    9538:	02000313          	li	t1,32
    953c:	00d7d6b3          	srl	a3,a5,a3
    9540:	00000813          	li	a6,0
    9544:	00658863          	beq	a1,t1,9554 <.L26>
    9548:	04000813          	li	a6,64
    954c:	40b80833          	sub	a6,a6,a1
    9550:	01079833          	sll	a6,a5,a6

00009554 <.L26>:
    9554:	00a86833          	or	a6,a6,a0
    9558:	01003833          	snez	a6,a6
    955c:	0106e6b3          	or	a3,a3,a6

00009560 <.L142>:
    9560:	00000593          	li	a1,0

00009564 <.LVL58>:
    9564:	fb5ff06f          	j	9518 <.L25>

00009568 <.L23>:
    9568:	00a7e6b3          	or	a3,a5,a0
    956c:	00d036b3          	snez	a3,a3
    9570:	ff1ff06f          	j	9560 <.L142>

00009574 <.L17>:
    9574:	00148693          	add	a3,s1,1

00009578 <.LVL61>:
    9578:	7fe6f593          	and	a1,a3,2046
    957c:	08059663          	bnez	a1,9608 <.L29>
    9580:	00a7e6b3          	or	a3,a5,a0
    9584:	06049263          	bnez	s1,95e8 <.L30>

00009588 <.LVL62>:
    9588:	44068863          	beqz	a3,99d8 <.L95>
    958c:	00c766b3          	or	a3,a4,a2
    9590:	02068863          	beqz	a3,95c0 <.L5>

00009594 <.LBB30>:
    9594:	00c50633          	add	a2,a0,a2

00009598 <.LVL63>:
    9598:	00a636b3          	sltu	a3,a2,a0
    959c:	00e78733          	add	a4,a5,a4

000095a0 <.LVL64>:
    95a0:	00d707b3          	add	a5,a4,a3

000095a4 <.LBE30>:
    95a4:	00879713          	sll	a4,a5,0x8

000095a8 <.LBB31>:
    95a8:	00060513          	mv	a0,a2

000095ac <.LBE31>:
    95ac:	00075a63          	bgez	a4,95c0 <.L5>
    95b0:	ff800737          	lui	a4,0xff800
    95b4:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9ccf>
    95b8:	00e7f7b3          	and	a5,a5,a4

000095bc <.LVL67>:
    95bc:	00100493          	li	s1,1

000095c0 <.L5>:
  FP_PACK_SEMIRAW_D (r, R);
    95c0:	00757713          	and	a4,a0,7
    95c4:	44070863          	beqz	a4,9a14 <.L83>
    95c8:	00f57713          	and	a4,a0,15
    95cc:	00400693          	li	a3,4
    95d0:	44d70263          	beq	a4,a3,9a14 <.L83>

000095d4 <.LBB64>:
    95d4:	00450713          	add	a4,a0,4
    95d8:	00a736b3          	sltu	a3,a4,a0
    95dc:	00d787b3          	add	a5,a5,a3

000095e0 <.LVL69>:
    95e0:	00070513          	mv	a0,a4

000095e4 <.LVL70>:
    95e4:	4300006f          	j	9a14 <.L83>

000095e8 <.L30>:
  FP_ADD_D (R, A, B);
    95e8:	ec068ee3          	beqz	a3,94c4 <.L96>
    95ec:	00c76633          	or	a2,a4,a2

000095f0 <.LVL72>:
    95f0:	dc060ae3          	beqz	a2,93c4 <.L110>

000095f4 <.L109>:
    95f4:	00000913          	li	s2,0

000095f8 <.LVL74>:
    95f8:	004007b7          	lui	a5,0x400

000095fc <.LVL75>:
    95fc:	00000513          	li	a0,0

00009600 <.LVL76>:
    9600:	7ff00493          	li	s1,2047

00009604 <.LVL77>:
    9604:	4100006f          	j	9a14 <.L83>

00009608 <.L29>:
    9608:	7ff00593          	li	a1,2047
    960c:	3cb68c63          	beq	a3,a1,99e4 <.L98>
    9610:	00c50633          	add	a2,a0,a2

00009614 <.LBB34>:
    9614:	00a63533          	sltu	a0,a2,a0

00009618 <.LVL80>:
    9618:	00e78733          	add	a4,a5,a4

0000961c <.LVL81>:
    961c:	00a70733          	add	a4,a4,a0

00009620 <.LBE34>:
    9620:	01f71513          	sll	a0,a4,0x1f
    9624:	00165613          	srl	a2,a2,0x1

00009628 <.LVL82>:
    9628:	00c56533          	or	a0,a0,a2
    962c:	00175793          	srl	a5,a4,0x1

00009630 <.L147>:
    9630:	00068493          	mv	s1,a3

00009634 <.LVL84>:
    9634:	f8dff06f          	j	95c0 <.L5>

00009638 <.L2>:
    9638:	0f005c63          	blez	a6,9730 <.L35>

0000963c <.LVL86>:
    963c:	08089e63          	bnez	a7,96d8 <.L36>
    9640:	00c766b3          	or	a3,a4,a2

00009644 <.LVL87>:
    9644:	3a068863          	beqz	a3,99f4 <.L100>
    9648:	fff80693          	add	a3,a6,-1

0000964c <.LVL88>:
    964c:	02069063          	bnez	a3,966c <.L37>

00009650 <.LBB38>:
    9650:	40c50633          	sub	a2,a0,a2

00009654 <.LVL89>:
    9654:	00c536b3          	sltu	a3,a0,a2

00009658 <.LVL90>:
    9658:	40e78733          	sub	a4,a5,a4

0000965c <.LVL91>:
    965c:	00060513          	mv	a0,a2

00009660 <.LVL92>:
    9660:	40d707b3          	sub	a5,a4,a3

00009664 <.L146>:
    9664:	00100493          	li	s1,1

00009668 <.LVL94>:
    9668:	0540006f          	j	96bc <.L40>

0000966c <.L37>:
    966c:	7ff00593          	li	a1,2047
    9670:	d4b80ae3          	beq	a6,a1,93c4 <.L110>

00009674 <.L41>:
    9674:	03800593          	li	a1,56
    9678:	0ad5c663          	blt	a1,a3,9724 <.L42>
    967c:	01f00593          	li	a1,31
    9680:	06d5c863          	blt	a1,a3,96f0 <.L43>
    9684:	02000813          	li	a6,32
    9688:	40d80833          	sub	a6,a6,a3
    968c:	00d658b3          	srl	a7,a2,a3

00009690 <.LVL96>:
    9690:	010715b3          	sll	a1,a4,a6
    9694:	01061833          	sll	a6,a2,a6
    9698:	0115e5b3          	or	a1,a1,a7
    969c:	01003833          	snez	a6,a6
    96a0:	0105e633          	or	a2,a1,a6
    96a4:	00d756b3          	srl	a3,a4,a3

000096a8 <.L44>:
    96a8:	40c50633          	sub	a2,a0,a2

000096ac <.LVL99>:
    96ac:	00c53733          	sltu	a4,a0,a2
    96b0:	40d786b3          	sub	a3,a5,a3

000096b4 <.LVL100>:
    96b4:	00060513          	mv	a0,a2

000096b8 <.LVL101>:
    96b8:	40e687b3          	sub	a5,a3,a4

000096bc <.L40>:
    96bc:	00879713          	sll	a4,a5,0x8
    96c0:	f00750e3          	bgez	a4,95c0 <.L5>

000096c4 <.LBB41>:
    96c4:	00800437          	lui	s0,0x800
    96c8:	fff40413          	add	s0,s0,-1 # 7fffff <_ebss+0x7e9ccf>
    96cc:	0087f433          	and	s0,a5,s0

000096d0 <.LVL103>:
    96d0:	00050993          	mv	s3,a0
    96d4:	2100006f          	j	98e4 <.L74>

000096d8 <.L36>:
    96d8:	7ff00693          	li	a3,2047

000096dc <.LVL105>:
    96dc:	eed482e3          	beq	s1,a3,95c0 <.L5>
    96e0:	008006b7          	lui	a3,0x800
    96e4:	00d76733          	or	a4,a4,a3
    96e8:	00080693          	mv	a3,a6
    96ec:	f89ff06f          	j	9674 <.L41>

000096f0 <.L43>:
    96f0:	fe068593          	add	a1,a3,-32 # 7fffe0 <_ebss+0x7e9cb0>
    96f4:	02000893          	li	a7,32

000096f8 <.LVL108>:
    96f8:	00b755b3          	srl	a1,a4,a1
    96fc:	00000813          	li	a6,0
    9700:	01168863          	beq	a3,a7,9710 <.L45>
    9704:	04000813          	li	a6,64
    9708:	40d80833          	sub	a6,a6,a3
    970c:	01071833          	sll	a6,a4,a6

00009710 <.L45>:
    9710:	00c86833          	or	a6,a6,a2
    9714:	01003833          	snez	a6,a6
    9718:	0105e633          	or	a2,a1,a6

0000971c <.L144>:
    971c:	00000693          	li	a3,0

00009720 <.LVL110>:
    9720:	f89ff06f          	j	96a8 <.L44>

00009724 <.L42>:
    9724:	00c76633          	or	a2,a4,a2

00009728 <.LVL112>:
    9728:	00c03633          	snez	a2,a2
    972c:	ff1ff06f          	j	971c <.L144>

00009730 <.L35>:
    9730:	0e080863          	beqz	a6,9820 <.L48>
    9734:	40988833          	sub	a6,a7,s1

00009738 <.LVL114>:
    9738:	04049263          	bnez	s1,977c <.L49>
    973c:	00a7e5b3          	or	a1,a5,a0
    9740:	2a058e63          	beqz	a1,99fc <.L103>
    9744:	fff80593          	add	a1,a6,-1

00009748 <.LVL115>:
    9748:	00059e63          	bnez	a1,9764 <.L50>

0000974c <.LBB47>:
    974c:	40a60533          	sub	a0,a2,a0

00009750 <.LVL117>:
    9750:	40f70733          	sub	a4,a4,a5

00009754 <.LVL118>:
    9754:	00a63633          	sltu	a2,a2,a0

00009758 <.LVL119>:
    9758:	40c707b3          	sub	a5,a4,a2

0000975c <.LBE47>:
    975c:	00068913          	mv	s2,a3

00009760 <.LVL121>:
    9760:	f05ff06f          	j	9664 <.L146>

00009764 <.L50>:
    9764:	7ff00313          	li	t1,2047
    9768:	02681463          	bne	a6,t1,9790 <.L53>

0000976c <.L105>:
    976c:	00070793          	mv	a5,a4

00009770 <.LVL124>:
    9770:	00060513          	mv	a0,a2

00009774 <.LVL125>:
    9774:	7ff00493          	li	s1,2047

00009778 <.LVL126>:
    9778:	0d00006f          	j	9848 <.L148>

0000977c <.L49>:
    977c:	7ff00593          	li	a1,2047
    9780:	feb886e3          	beq	a7,a1,976c <.L105>
    9784:	008005b7          	lui	a1,0x800
    9788:	00b7e7b3          	or	a5,a5,a1
    978c:	00080593          	mv	a1,a6

00009790 <.L53>:
    9790:	03800813          	li	a6,56
    9794:	08b84063          	blt	a6,a1,9814 <.L54>
    9798:	01f00813          	li	a6,31
    979c:	04b84263          	blt	a6,a1,97e0 <.L55>
    97a0:	02000313          	li	t1,32
    97a4:	40b30333          	sub	t1,t1,a1
    97a8:	00b55e33          	srl	t3,a0,a1
    97ac:	00679833          	sll	a6,a5,t1
    97b0:	00651333          	sll	t1,a0,t1
    97b4:	01c86833          	or	a6,a6,t3
    97b8:	00603333          	snez	t1,t1
    97bc:	00686533          	or	a0,a6,t1
    97c0:	00b7d5b3          	srl	a1,a5,a1

000097c4 <.L56>:
    97c4:	40a60533          	sub	a0,a2,a0

000097c8 <.LVL132>:
    97c8:	40b705b3          	sub	a1,a4,a1

000097cc <.LVL133>:
    97cc:	00a63633          	sltu	a2,a2,a0

000097d0 <.LVL134>:
    97d0:	40c587b3          	sub	a5,a1,a2

000097d4 <.LBE49>:
    97d4:	00088493          	mv	s1,a7

000097d8 <.LVL136>:
    97d8:	00068913          	mv	s2,a3

000097dc <.LVL137>:
    97dc:	ee1ff06f          	j	96bc <.L40>

000097e0 <.L55>:
    97e0:	fe058813          	add	a6,a1,-32 # 7fffe0 <_ebss+0x7e9cb0>
    97e4:	02000e13          	li	t3,32
    97e8:	0107d833          	srl	a6,a5,a6
    97ec:	00000313          	li	t1,0
    97f0:	01c58863          	beq	a1,t3,9800 <.L57>
    97f4:	04000313          	li	t1,64
    97f8:	40b30333          	sub	t1,t1,a1
    97fc:	00679333          	sll	t1,a5,t1

00009800 <.L57>:
    9800:	00a36333          	or	t1,t1,a0
    9804:	00603333          	snez	t1,t1
    9808:	00686533          	or	a0,a6,t1

0000980c <.L145>:
    980c:	00000593          	li	a1,0

00009810 <.LVL140>:
    9810:	fb5ff06f          	j	97c4 <.L56>

00009814 <.L54>:
    9814:	00a7e533          	or	a0,a5,a0

00009818 <.LVL142>:
    9818:	00a03533          	snez	a0,a0
    981c:	ff1ff06f          	j	980c <.L145>

00009820 <.L48>:
    9820:	00148593          	add	a1,s1,1
    9824:	7fe5f593          	and	a1,a1,2046
    9828:	08059663          	bnez	a1,98b4 <.L60>

0000982c <.LBB72>:
    982c:	00a7e833          	or	a6,a5,a0

00009830 <.LVL144>:
    9830:	00c765b3          	or	a1,a4,a2

00009834 <.LBB73>:
    9834:	06049063          	bnez	s1,9894 <.L61>

00009838 <.LVL145>:
    9838:	00081c63          	bnez	a6,9850 <.L62>

0000983c <.LVL146>:
    983c:	10058e63          	beqz	a1,9958 <.L151>
    9840:	00070793          	mv	a5,a4

00009844 <.LVL147>:
    9844:	00060513          	mv	a0,a2

00009848 <.L148>:
    9848:	00068913          	mv	s2,a3

0000984c <.LVL149>:
    984c:	d75ff06f          	j	95c0 <.L5>

00009850 <.L62>:
    9850:	d60588e3          	beqz	a1,95c0 <.L5>

00009854 <.LBB51>:
    9854:	40c50833          	sub	a6,a0,a2

00009858 <.LVL151>:
    9858:	010538b3          	sltu	a7,a0,a6

0000985c <.LVL152>:
    985c:	40e785b3          	sub	a1,a5,a4
    9860:	411585b3          	sub	a1,a1,a7

00009864 <.LBE51>:
    9864:	00859893          	sll	a7,a1,0x8
    9868:	0008dc63          	bgez	a7,9880 <.L65>

0000986c <.LBB52>:
    986c:	40a60533          	sub	a0,a2,a0

00009870 <.LVL155>:
    9870:	40f70733          	sub	a4,a4,a5

00009874 <.LVL156>:
    9874:	00a63633          	sltu	a2,a2,a0

00009878 <.LVL157>:
    9878:	40c707b3          	sub	a5,a4,a2

0000987c <.LBE52>:
    987c:	fcdff06f          	j	9848 <.L148>

00009880 <.L65>:
    9880:	00b86533          	or	a0,a6,a1

00009884 <.LVL160>:
    9884:	18050463          	beqz	a0,9a0c <.L108>

00009888 <.LBB53>:
    9888:	00058793          	mv	a5,a1

0000988c <.LVL161>:
    988c:	00080513          	mv	a0,a6
    9890:	d31ff06f          	j	95c0 <.L5>

00009894 <.L61>:
    9894:	00081c63          	bnez	a6,98ac <.L68>
    9898:	d4058ee3          	beqz	a1,95f4 <.L109>
    989c:	00070793          	mv	a5,a4

000098a0 <.LVL163>:
    98a0:	00060513          	mv	a0,a2

000098a4 <.LVL164>:
    98a4:	00068913          	mv	s2,a3

000098a8 <.LVL165>:
    98a8:	b1dff06f          	j	93c4 <.L110>

000098ac <.L68>:
    98ac:	b0058ce3          	beqz	a1,93c4 <.L110>
    98b0:	d45ff06f          	j	95f4 <.L109>

000098b4 <.L60>:
    98b4:	40c505b3          	sub	a1,a0,a2
    98b8:	00b53833          	sltu	a6,a0,a1

000098bc <.LVL168>:
    98bc:	40e78433          	sub	s0,a5,a4
    98c0:	41040433          	sub	s0,s0,a6

000098c4 <.LBE54>:
    98c4:	00841813          	sll	a6,s0,0x8

000098c8 <.LBB55>:
    98c8:	00058993          	mv	s3,a1

000098cc <.LBE55>:
    98cc:	08085063          	bgez	a6,994c <.L71>

000098d0 <.LBB56>:
    98d0:	40a609b3          	sub	s3,a2,a0

000098d4 <.LVL171>:
    98d4:	40f70433          	sub	s0,a4,a5

000098d8 <.LVL172>:
    98d8:	01363633          	sltu	a2,a2,s3

000098dc <.LVL173>:
    98dc:	40c40433          	sub	s0,s0,a2

000098e0 <.LBE56>:
    98e0:	00068913          	mv	s2,a3

000098e4 <.L74>:
    98e4:	06040e63          	beqz	s0,9960 <.L75>
    98e8:	00040513          	mv	a0,s0
    98ec:	d29f70ef          	jal	1614 <__clzsi2>

000098f0 <.LVL176>:
    98f0:	ff850693          	add	a3,a0,-8

000098f4 <.L76>:
    98f4:	02000793          	li	a5,32
    98f8:	40d787b3          	sub	a5,a5,a3
    98fc:	00d41433          	sll	s0,s0,a3

00009900 <.LVL178>:
    9900:	00f9d7b3          	srl	a5,s3,a5
    9904:	0087e7b3          	or	a5,a5,s0

00009908 <.LVL179>:
    9908:	00d99433          	sll	s0,s3,a3

0000990c <.L78>:
    990c:	0a96c463          	blt	a3,s1,99b4 <.L79>
    9910:	409686b3          	sub	a3,a3,s1

00009914 <.LVL181>:
    9914:	00168613          	add	a2,a3,1

00009918 <.LVL182>:
    9918:	01f00713          	li	a4,31
    991c:	06c74263          	blt	a4,a2,9980 <.L80>
    9920:	02000713          	li	a4,32
    9924:	40c70733          	sub	a4,a4,a2
    9928:	00e79533          	sll	a0,a5,a4
    992c:	00c456b3          	srl	a3,s0,a2
    9930:	00e41733          	sll	a4,s0,a4
    9934:	00d56533          	or	a0,a0,a3
    9938:	00e03733          	snez	a4,a4
    993c:	00e56533          	or	a0,a0,a4

00009940 <.LVL183>:
    9940:	00c7d7b3          	srl	a5,a5,a2

00009944 <.L149>:
    9944:	00000493          	li	s1,0

00009948 <.LVL185>:
    9948:	c79ff06f          	j	95c0 <.L5>

0000994c <.L71>:
    994c:	0085e5b3          	or	a1,a1,s0

00009950 <.LVL187>:
    9950:	f8059ae3          	bnez	a1,98e4 <.L74>
    9954:	00000493          	li	s1,0

00009958 <.L151>:
    9958:	00000913          	li	s2,0

0000995c <.LVL189>:
    995c:	08c0006f          	j	99e8 <.L150>

00009960 <.L75>:
    9960:	00098513          	mv	a0,s3
    9964:	cb1f70ef          	jal	1614 <__clzsi2>

00009968 <.LVL191>:
    9968:	01850693          	add	a3,a0,24

0000996c <.LVL192>:
    996c:	01f00793          	li	a5,31
    9970:	f8d7d2e3          	bge	a5,a3,98f4 <.L76>
    9974:	ff850793          	add	a5,a0,-8
    9978:	00f997b3          	sll	a5,s3,a5

0000997c <.LVL193>:
    997c:	f91ff06f          	j	990c <.L78>

00009980 <.L80>:
    9980:	fe168693          	add	a3,a3,-31
    9984:	00d7d533          	srl	a0,a5,a3
    9988:	02000693          	li	a3,32
    998c:	00000713          	li	a4,0
    9990:	00d60863          	beq	a2,a3,99a0 <.L81>
    9994:	04000713          	li	a4,64
    9998:	40c70733          	sub	a4,a4,a2
    999c:	00e79733          	sll	a4,a5,a4

000099a0 <.L81>:
    99a0:	00e46733          	or	a4,s0,a4
    99a4:	00e03733          	snez	a4,a4
    99a8:	00e56533          	or	a0,a0,a4

000099ac <.LVL195>:
    99ac:	00000793          	li	a5,0
    99b0:	f95ff06f          	j	9944 <.L149>

000099b4 <.L79>:
    99b4:	ff800737          	lui	a4,0xff800
    99b8:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9ccf>
    99bc:	40d484b3          	sub	s1,s1,a3
    99c0:	00e7f7b3          	and	a5,a5,a4
    99c4:	00040513          	mv	a0,s0
    99c8:	bf9ff06f          	j	95c0 <.L5>

000099cc <.L91>:
    99cc:	00070793          	mv	a5,a4

000099d0 <.LVL200>:
    99d0:	00060513          	mv	a0,a2

000099d4 <.LVL201>:
    99d4:	c5dff06f          	j	9630 <.L147>

000099d8 <.L95>:
    99d8:	00070793          	mv	a5,a4

000099dc <.LVL203>:
    99dc:	00060513          	mv	a0,a2

000099e0 <.LVL204>:
    99e0:	be1ff06f          	j	95c0 <.L5>

000099e4 <.L98>:
    99e4:	7ff00493          	li	s1,2047

000099e8 <.L150>:
    99e8:	00000793          	li	a5,0
    99ec:	00000513          	li	a0,0
    99f0:	0240006f          	j	9a14 <.L83>

000099f4 <.L100>:
    99f4:	00080493          	mv	s1,a6

000099f8 <.LVL208>:
    99f8:	bc9ff06f          	j	95c0 <.L5>

000099fc <.L103>:
    99fc:	00070793          	mv	a5,a4

00009a00 <.LVL210>:
    9a00:	00060513          	mv	a0,a2

00009a04 <.LVL211>:
    9a04:	00080493          	mv	s1,a6

00009a08 <.LVL212>:
    9a08:	e41ff06f          	j	9848 <.L148>

00009a0c <.L108>:
    9a0c:	00000793          	li	a5,0

00009a10 <.LBE60>:
    9a10:	00000913          	li	s2,0

00009a14 <.L83>:
  FP_PACK_SEMIRAW_D (r, R);
    9a14:	00879713          	sll	a4,a5,0x8
    9a18:	00075e63          	bgez	a4,9a34 <.L86>

00009a1c <.LVL216>:
    9a1c:	00148493          	add	s1,s1,1

00009a20 <.LVL217>:
    9a20:	7ff00713          	li	a4,2047
    9a24:	08e48263          	beq	s1,a4,9aa8 <.L113>
    9a28:	ff800737          	lui	a4,0xff800
    9a2c:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9ccf>
    9a30:	00e7f7b3          	and	a5,a5,a4

00009a34 <.L86>:
    9a34:	01d79693          	sll	a3,a5,0x1d
    9a38:	00355513          	srl	a0,a0,0x3

00009a3c <.LVL219>:
    9a3c:	7ff00713          	li	a4,2047
    9a40:	00a6e6b3          	or	a3,a3,a0

00009a44 <.LVL220>:
    9a44:	0037d793          	srl	a5,a5,0x3
    9a48:	00e49e63          	bne	s1,a4,9a64 <.L87>

00009a4c <.LVL222>:
    9a4c:	00f6e6b3          	or	a3,a3,a5

00009a50 <.LVL223>:
    9a50:	00000793          	li	a5,0

00009a54 <.LVL224>:
    9a54:	00068863          	beqz	a3,9a64 <.L87>
    9a58:	000807b7          	lui	a5,0x80
    9a5c:	00000693          	li	a3,0
    9a60:	00000913          	li	s2,0

00009a64 <.L87>:
    9a64:	01449713          	sll	a4,s1,0x14
    9a68:	7ff00637          	lui	a2,0x7ff00
    9a6c:	00c79793          	sll	a5,a5,0xc

00009a70 <.LVL226>:
    9a70:	00c77733          	and	a4,a4,a2

00009a74 <.LBE77>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    9a74:	01c12083          	lw	ra,28(sp)
    9a78:	01812403          	lw	s0,24(sp)

00009a7c <.LBB78>:
  FP_PACK_SEMIRAW_D (r, R);
    9a7c:	00c7d793          	srl	a5,a5,0xc
    9a80:	00f767b3          	or	a5,a4,a5
    9a84:	01f91713          	sll	a4,s2,0x1f
    9a88:	00e7e633          	or	a2,a5,a4

00009a8c <.LBE78>:
}
    9a8c:	01412483          	lw	s1,20(sp)
    9a90:	01012903          	lw	s2,16(sp)

00009a94 <.LVL228>:
    9a94:	00c12983          	lw	s3,12(sp)
    9a98:	00068513          	mv	a0,a3
    9a9c:	00060593          	mv	a1,a2
    9aa0:	02010113          	add	sp,sp,32
    9aa4:	00008067          	ret

00009aa8 <.L113>:
    9aa8:	00000793          	li	a5,0

00009aac <.LVL230>:
    9aac:	00000513          	li	a0,0

00009ab0 <.LVL231>:
    9ab0:	f85ff06f          	j	9a34 <.L86>

00009ab4 <__divdf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__divdf3 (DFtype a, DFtype b)
{
    9ab4:	fd010113          	add	sp,sp,-48

00009ab8 <.LBB3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
    9ab8:	0145d813          	srl	a6,a1,0x14

00009abc <.LBE3>:
{
    9abc:	02912223          	sw	s1,36(sp)
    9ac0:	03212023          	sw	s2,32(sp)
    9ac4:	01312e23          	sw	s3,28(sp)
    9ac8:	01612823          	sw	s6,16(sp)
    9acc:	01712623          	sw	s7,12(sp)

00009ad0 <.LBB4>:
  FP_UNPACK_D (A, a);
    9ad0:	00c59493          	sll	s1,a1,0xc

00009ad4 <.LBE4>:
{
    9ad4:	02112623          	sw	ra,44(sp)
    9ad8:	02812423          	sw	s0,40(sp)
    9adc:	01412c23          	sw	s4,24(sp)
    9ae0:	01512a23          	sw	s5,20(sp)

00009ae4 <.LBB5>:
  FP_UNPACK_D (A, a);
    9ae4:	7ff87813          	and	a6,a6,2047

00009ae8 <.LBE5>:
{
    9ae8:	00050b13          	mv	s6,a0
    9aec:	00060b93          	mv	s7,a2
    9af0:	00068913          	mv	s2,a3

00009af4 <.LBB6>:
  FP_UNPACK_D (A, a);
    9af4:	00c4d493          	srl	s1,s1,0xc

00009af8 <.LVL1>:
    9af8:	01f5d993          	srl	s3,a1,0x1f

00009afc <.LBE6>:
    9afc:	0a080263          	beqz	a6,9ba0 <.L2>
    9b00:	7ff00793          	li	a5,2047
    9b04:	10f80263          	beq	a6,a5,9c08 <.L3>

00009b08 <.LVL3>:
    9b08:	01d55a13          	srl	s4,a0,0x1d
    9b0c:	00349493          	sll	s1,s1,0x3

00009b10 <.LVL4>:
    9b10:	009a6a33          	or	s4,s4,s1
    9b14:	008007b7          	lui	a5,0x800
    9b18:	00fa6a33          	or	s4,s4,a5

00009b1c <.LVL5>:
    9b1c:	00351413          	sll	s0,a0,0x3

00009b20 <.LVL6>:
    9b20:	c0180a93          	add	s5,a6,-1023

00009b24 <.L104>:
    9b24:	00000b13          	li	s6,0

00009b28 <.L4>:
  FP_UNPACK_D (B, b);
    9b28:	01495713          	srl	a4,s2,0x14
    9b2c:	00c91493          	sll	s1,s2,0xc
    9b30:	7ff77713          	and	a4,a4,2047
    9b34:	00c4d493          	srl	s1,s1,0xc

00009b38 <.LVL9>:
    9b38:	01f95913          	srl	s2,s2,0x1f

00009b3c <.LBE11>:
    9b3c:	10070463          	beqz	a4,9c44 <.L9>
    9b40:	7ff00793          	li	a5,2047
    9b44:	16f70863          	beq	a4,a5,9cb4 <.L10>

00009b48 <.LVL11>:
    9b48:	00349493          	sll	s1,s1,0x3

00009b4c <.LVL12>:
    9b4c:	01dbd793          	srl	a5,s7,0x1d
    9b50:	0097e7b3          	or	a5,a5,s1
    9b54:	008004b7          	lui	s1,0x800
    9b58:	0097e4b3          	or	s1,a5,s1

00009b5c <.LVL13>:
    9b5c:	003b9f13          	sll	t5,s7,0x3

00009b60 <.LVL14>:
    9b60:	c0170713          	add	a4,a4,-1023

00009b64 <.L105>:
    9b64:	00000793          	li	a5,0

00009b68 <.L11>:
  FP_DIV_D (R, A, B);
    9b68:	40ea8833          	sub	a6,s5,a4
    9b6c:	002b1713          	sll	a4,s6,0x2

00009b70 <.LVL17>:
    9b70:	00f76733          	or	a4,a4,a5
    9b74:	fff70713          	add	a4,a4,-1
    9b78:	00e00693          	li	a3,14
    9b7c:	0129c633          	xor	a2,s3,s2

00009b80 <.LVL18>:
    9b80:	16e6e663          	bltu	a3,a4,9cec <.L16>
    9b84:	00008697          	auipc	a3,0x8
    9b88:	29c68693          	add	a3,a3,668 # 11e20 <.L18>
    9b8c:	00271713          	sll	a4,a4,0x2
    9b90:	00d70733          	add	a4,a4,a3
    9b94:	00072703          	lw	a4,0(a4)
    9b98:	00d70733          	add	a4,a4,a3
    9b9c:	00070067          	jr	a4

00009ba0 <.L2>:
  FP_UNPACK_D (A, a);
    9ba0:	00a4ea33          	or	s4,s1,a0
    9ba4:	060a0e63          	beqz	s4,9c20 <.L71>

00009ba8 <.LBB16>:
    9ba8:	02048e63          	beqz	s1,9be4 <.L5>
    9bac:	00048513          	mv	a0,s1

00009bb0 <.LVL20>:
    9bb0:	a65f70ef          	jal	1614 <__clzsi2>

00009bb4 <.LVL21>:
    9bb4:	ff550793          	add	a5,a0,-11

00009bb8 <.L6>:
    9bb8:	01d00a13          	li	s4,29
    9bbc:	ff850713          	add	a4,a0,-8
    9bc0:	40fa0a33          	sub	s4,s4,a5
    9bc4:	00e494b3          	sll	s1,s1,a4

00009bc8 <.LVL23>:
    9bc8:	014b5a33          	srl	s4,s6,s4
    9bcc:	009a6a33          	or	s4,s4,s1

00009bd0 <.LVL24>:
    9bd0:	00eb14b3          	sll	s1,s6,a4

00009bd4 <.L8>:
    9bd4:	c0d00813          	li	a6,-1011
    9bd8:	40a80ab3          	sub	s5,a6,a0

00009bdc <.LVL26>:
    9bdc:	00048413          	mv	s0,s1
    9be0:	f45ff06f          	j	9b24 <.L104>

00009be4 <.L5>:
    9be4:	a31f70ef          	jal	1614 <__clzsi2>

00009be8 <.LVL28>:
    9be8:	00050a13          	mv	s4,a0

00009bec <.LVL29>:
    9bec:	015a0793          	add	a5,s4,21
    9bf0:	01c00713          	li	a4,28
    9bf4:	02050513          	add	a0,a0,32

00009bf8 <.LVL30>:
    9bf8:	fcf750e3          	bge	a4,a5,9bb8 <.L6>
    9bfc:	ff8a0a13          	add	s4,s4,-8
    9c00:	014b1a33          	sll	s4,s6,s4

00009c04 <.LVL31>:
    9c04:	fd1ff06f          	j	9bd4 <.L8>

00009c08 <.L3>:
    9c08:	00a4ea33          	or	s4,s1,a0
    9c0c:	020a1263          	bnez	s4,9c30 <.L72>

00009c10 <.LBB17>:
    9c10:	00000413          	li	s0,0
    9c14:	7ff00a93          	li	s5,2047

00009c18 <.LBE17>:
    9c18:	00200b13          	li	s6,2
    9c1c:	f0dff06f          	j	9b28 <.L4>

00009c20 <.L71>:
    9c20:	00000413          	li	s0,0
    9c24:	00000a93          	li	s5,0

00009c28 <.LBE18>:
    9c28:	00100b13          	li	s6,1
    9c2c:	efdff06f          	j	9b28 <.L4>

00009c30 <.L72>:
    9c30:	00050413          	mv	s0,a0

00009c34 <.LBB19>:
    9c34:	00048a13          	mv	s4,s1
    9c38:	7ff00a93          	li	s5,2047

00009c3c <.LBE19>:
    9c3c:	00300b13          	li	s6,3
    9c40:	ee9ff06f          	j	9b28 <.L4>

00009c44 <.L9>:
  FP_UNPACK_D (B, b);
    9c44:	0174ef33          	or	t5,s1,s7
    9c48:	080f0263          	beqz	t5,9ccc <.L73>

00009c4c <.LBB20>:
    9c4c:	04048063          	beqz	s1,9c8c <.L12>
    9c50:	00048513          	mv	a0,s1
    9c54:	9c1f70ef          	jal	1614 <__clzsi2>

00009c58 <.LVL34>:
    9c58:	ff550713          	add	a4,a0,-11

00009c5c <.L13>:
    9c5c:	01d00793          	li	a5,29
    9c60:	ff850693          	add	a3,a0,-8
    9c64:	40e787b3          	sub	a5,a5,a4
    9c68:	00d494b3          	sll	s1,s1,a3

00009c6c <.LVL36>:
    9c6c:	00fbd7b3          	srl	a5,s7,a5
    9c70:	0097e7b3          	or	a5,a5,s1

00009c74 <.LVL37>:
    9c74:	00db94b3          	sll	s1,s7,a3

00009c78 <.L15>:
    9c78:	c0d00713          	li	a4,-1011

00009c7c <.LVL39>:
    9c7c:	00048f13          	mv	t5,s1
    9c80:	40a70733          	sub	a4,a4,a0

00009c84 <.LVL40>:
    9c84:	00078493          	mv	s1,a5

00009c88 <.LVL41>:
    9c88:	eddff06f          	j	9b64 <.L105>

00009c8c <.L12>:
    9c8c:	000b8513          	mv	a0,s7
    9c90:	985f70ef          	jal	1614 <__clzsi2>

00009c94 <.LVL43>:
    9c94:	00050793          	mv	a5,a0

00009c98 <.LVL44>:
    9c98:	01578713          	add	a4,a5,21 # 800015 <_ebss+0x7e9ce5>
    9c9c:	01c00693          	li	a3,28
    9ca0:	02050513          	add	a0,a0,32

00009ca4 <.LVL45>:
    9ca4:	fae6dce3          	bge	a3,a4,9c5c <.L13>
    9ca8:	ff878793          	add	a5,a5,-8
    9cac:	00fb97b3          	sll	a5,s7,a5

00009cb0 <.LVL46>:
    9cb0:	fc9ff06f          	j	9c78 <.L15>

00009cb4 <.L10>:
    9cb4:	0174ef33          	or	t5,s1,s7
    9cb8:	020f1263          	bnez	t5,9cdc <.L74>

00009cbc <.LBB21>:
    9cbc:	00000493          	li	s1,0

00009cc0 <.LVL48>:
    9cc0:	7ff00713          	li	a4,2047

00009cc4 <.LBE21>:
    9cc4:	00200793          	li	a5,2
    9cc8:	ea1ff06f          	j	9b68 <.L11>

00009ccc <.L73>:
    9ccc:	00000493          	li	s1,0

00009cd0 <.LVL51>:
    9cd0:	00000713          	li	a4,0

00009cd4 <.LBE22>:
    9cd4:	00100793          	li	a5,1
    9cd8:	e91ff06f          	j	9b68 <.L11>

00009cdc <.L74>:
    9cdc:	000b8f13          	mv	t5,s7
    9ce0:	7ff00713          	li	a4,2047

00009ce4 <.LBE23>:
    9ce4:	00300793          	li	a5,3
    9ce8:	e81ff06f          	j	9b68 <.L11>

00009cec <.L16>:
  FP_DIV_D (R, A, B);
    9cec:	0144e663          	bltu	s1,s4,9cf8 <.L23>
    9cf0:	349a1c63          	bne	s4,s1,a048 <.L24>
    9cf4:	35e46a63          	bltu	s0,t5,a048 <.L24>

00009cf8 <.L23>:
    9cf8:	01fa1693          	sll	a3,s4,0x1f
    9cfc:	00145793          	srl	a5,s0,0x1

00009d00 <.LVL57>:
    9d00:	01f41713          	sll	a4,s0,0x1f

00009d04 <.LVL58>:
    9d04:	001a5a13          	srl	s4,s4,0x1

00009d08 <.LVL59>:
    9d08:	00f6e433          	or	s0,a3,a5

00009d0c <.L25>:
    9d0c:	00849893          	sll	a7,s1,0x8
    9d10:	018f5593          	srl	a1,t5,0x18
    9d14:	0115e5b3          	or	a1,a1,a7

00009d18 <.LBB26>:
    9d18:	0108d893          	srl	a7,a7,0x10
    9d1c:	031a5eb3          	divu	t4,s4,a7
    9d20:	01059313          	sll	t1,a1,0x10
    9d24:	01035313          	srl	t1,t1,0x10
    9d28:	01045793          	srl	a5,s0,0x10

00009d2c <.LBE26>:
    9d2c:	008f1513          	sll	a0,t5,0x8

00009d30 <.LBB28>:
    9d30:	031a7a33          	remu	s4,s4,a7

00009d34 <.LVL63>:
    9d34:	000e8693          	mv	a3,t4
    9d38:	03d30e33          	mul	t3,t1,t4

00009d3c <.LVL64>:
    9d3c:	010a1a13          	sll	s4,s4,0x10

00009d40 <.LVL65>:
    9d40:	0147e7b3          	or	a5,a5,s4

00009d44 <.LVL66>:
    9d44:	01c7fe63          	bgeu	a5,t3,9d60 <.L26>
    9d48:	00f587b3          	add	a5,a1,a5

00009d4c <.LVL67>:
    9d4c:	fffe8693          	add	a3,t4,-1

00009d50 <.LVL68>:
    9d50:	00b7e863          	bltu	a5,a1,9d60 <.L26>
    9d54:	01c7f663          	bgeu	a5,t3,9d60 <.L26>
    9d58:	ffee8693          	add	a3,t4,-2
    9d5c:	00b787b3          	add	a5,a5,a1

00009d60 <.L26>:
    9d60:	41c787b3          	sub	a5,a5,t3

00009d64 <.LVL71>:
    9d64:	0317df33          	divu	t5,a5,a7

00009d68 <.LVL72>:
    9d68:	01041413          	sll	s0,s0,0x10

00009d6c <.LVL73>:
    9d6c:	01045413          	srl	s0,s0,0x10
    9d70:	0317f7b3          	remu	a5,a5,a7

00009d74 <.LVL74>:
    9d74:	000f0e13          	mv	t3,t5

00009d78 <.LVL75>:
    9d78:	03e30eb3          	mul	t4,t1,t5

00009d7c <.LVL76>:
    9d7c:	01079793          	sll	a5,a5,0x10

00009d80 <.LVL77>:
    9d80:	00f467b3          	or	a5,s0,a5

00009d84 <.LVL78>:
    9d84:	01d7fe63          	bgeu	a5,t4,9da0 <.L29>
    9d88:	00f587b3          	add	a5,a1,a5

00009d8c <.LVL79>:
    9d8c:	ffff0e13          	add	t3,t5,-1

00009d90 <.LVL80>:
    9d90:	00b7e863          	bltu	a5,a1,9da0 <.L29>
    9d94:	01d7f663          	bgeu	a5,t4,9da0 <.L29>
    9d98:	ffef0e13          	add	t3,t5,-2
    9d9c:	00b787b3          	add	a5,a5,a1

00009da0 <.L29>:
    9da0:	01069693          	sll	a3,a3,0x10

00009da4 <.LVL83>:
    9da4:	00010437          	lui	s0,0x10
    9da8:	01c6e2b3          	or	t0,a3,t3
    9dac:	fff40e13          	add	t3,s0,-1 # ffff <.LBB204+0xb>

00009db0 <.LVL84>:
    9db0:	01c2f6b3          	and	a3,t0,t3

00009db4 <.LBB29>:
    9db4:	0102df93          	srl	t6,t0,0x10
    9db8:	01c57e33          	and	t3,a0,t3

00009dbc <.LBB30>:
    9dbc:	41d787b3          	sub	a5,a5,t4

00009dc0 <.LBB31>:
    9dc0:	01055e93          	srl	t4,a0,0x10

00009dc4 <.LVL86>:
    9dc4:	02de03b3          	mul	t2,t3,a3

00009dc8 <.LVL87>:
    9dc8:	03cf84b3          	mul	s1,t6,t3

00009dcc <.LVL88>:
    9dcc:	02de86b3          	mul	a3,t4,a3

00009dd0 <.LVL89>:
    9dd0:	00968f33          	add	t5,a3,s1

00009dd4 <.LVL90>:
    9dd4:	0103d693          	srl	a3,t2,0x10

00009dd8 <.LVL91>:
    9dd8:	01e686b3          	add	a3,a3,t5
    9ddc:	03df8fb3          	mul	t6,t6,t4

00009de0 <.LVL92>:
    9de0:	0096f463          	bgeu	a3,s1,9de8 <.L32>
    9de4:	008f8fb3          	add	t6,t6,s0

00009de8 <.L32>:
    9de8:	0106df13          	srl	t5,a3,0x10
    9dec:	01ff0f33          	add	t5,t5,t6

00009df0 <.LVL94>:
    9df0:	00010fb7          	lui	t6,0x10

00009df4 <.LVL95>:
    9df4:	ffff8f93          	add	t6,t6,-1 # ffff <.LBB204+0xb>
    9df8:	01f6f6b3          	and	a3,a3,t6

00009dfc <.LVL96>:
    9dfc:	01069693          	sll	a3,a3,0x10
    9e00:	01f3f3b3          	and	t2,t2,t6

00009e04 <.LVL97>:
    9e04:	007686b3          	add	a3,a3,t2

00009e08 <.LBE31>:
    9e08:	01e7e863          	bltu	a5,t5,9e18 <.L33>

00009e0c <.LBB32>:
    9e0c:	00028493          	mv	s1,t0

00009e10 <.LBE32>:
    9e10:	05e79863          	bne	a5,t5,9e60 <.L34>
    9e14:	04d77663          	bgeu	a4,a3,9e60 <.L34>

00009e18 <.L33>:
    9e18:	00a70fb3          	add	t6,a4,a0

00009e1c <.LVL100>:
    9e1c:	00efb3b3          	sltu	t2,t6,a4

00009e20 <.LBB33>:
    9e20:	00b38433          	add	s0,t2,a1

00009e24 <.LVL101>:
    9e24:	008787b3          	add	a5,a5,s0

00009e28 <.LBE33>:
    9e28:	fff28493          	add	s1,t0,-1

00009e2c <.LBB34>:
    9e2c:	000f8713          	mv	a4,t6

00009e30 <.LBE34>:
    9e30:	00f5e663          	bltu	a1,a5,9e3c <.L37>
    9e34:	02f59663          	bne	a1,a5,9e60 <.L34>
    9e38:	02039463          	bnez	t2,9e60 <.L34>

00009e3c <.L37>:
    9e3c:	01e7e663          	bltu	a5,t5,9e48 <.L38>
    9e40:	02ff1063          	bne	t5,a5,9e60 <.L34>
    9e44:	00dffe63          	bgeu	t6,a3,9e60 <.L34>

00009e48 <.L38>:
    9e48:	01f50fb3          	add	t6,a0,t6

00009e4c <.LBB35>:
    9e4c:	000f8713          	mv	a4,t6

00009e50 <.LVL105>:
    9e50:	00afbfb3          	sltu	t6,t6,a0
    9e54:	00bf8fb3          	add	t6,t6,a1

00009e58 <.LBE35>:
    9e58:	ffe28493          	add	s1,t0,-2

00009e5c <.LBB36>:
    9e5c:	01f787b3          	add	a5,a5,t6

00009e60 <.L34>:
    9e60:	40d706b3          	sub	a3,a4,a3

00009e64 <.LVL108>:
    9e64:	41e787b3          	sub	a5,a5,t5

00009e68 <.LVL109>:
    9e68:	00d73733          	sltu	a4,a4,a3

00009e6c <.LVL110>:
    9e6c:	40e787b3          	sub	a5,a5,a4

00009e70 <.LBE37>:
    9e70:	fff00f13          	li	t5,-1

00009e74 <.LVL112>:
    9e74:	12f58663          	beq	a1,a5,9fa0 <.L70>

00009e78 <.LBB38>:
    9e78:	0317dfb3          	divu	t6,a5,a7

00009e7c <.LVL114>:
    9e7c:	0106d713          	srl	a4,a3,0x10
    9e80:	0317f7b3          	remu	a5,a5,a7

00009e84 <.LVL115>:
    9e84:	03f30f33          	mul	t5,t1,t6

00009e88 <.LVL116>:
    9e88:	01079793          	sll	a5,a5,0x10

00009e8c <.LVL117>:
    9e8c:	00f767b3          	or	a5,a4,a5

00009e90 <.LVL118>:
    9e90:	000f8713          	mv	a4,t6
    9e94:	01e7fe63          	bgeu	a5,t5,9eb0 <.L44>
    9e98:	00f587b3          	add	a5,a1,a5

00009e9c <.LVL119>:
    9e9c:	ffff8713          	add	a4,t6,-1

00009ea0 <.LVL120>:
    9ea0:	00b7e863          	bltu	a5,a1,9eb0 <.L44>
    9ea4:	01e7f663          	bgeu	a5,t5,9eb0 <.L44>
    9ea8:	ffef8713          	add	a4,t6,-2
    9eac:	00b787b3          	add	a5,a5,a1

00009eb0 <.L44>:
    9eb0:	41e787b3          	sub	a5,a5,t5

00009eb4 <.LVL123>:
    9eb4:	0317df33          	divu	t5,a5,a7

00009eb8 <.LVL124>:
    9eb8:	01069693          	sll	a3,a3,0x10

00009ebc <.LVL125>:
    9ebc:	0106d693          	srl	a3,a3,0x10
    9ec0:	0317f7b3          	remu	a5,a5,a7

00009ec4 <.LVL126>:
    9ec4:	000f0893          	mv	a7,t5

00009ec8 <.LVL127>:
    9ec8:	03e30333          	mul	t1,t1,t5

00009ecc <.LVL128>:
    9ecc:	01079793          	sll	a5,a5,0x10

00009ed0 <.LVL129>:
    9ed0:	00f6e7b3          	or	a5,a3,a5

00009ed4 <.LVL130>:
    9ed4:	0067fe63          	bgeu	a5,t1,9ef0 <.L47>
    9ed8:	00f587b3          	add	a5,a1,a5

00009edc <.LVL131>:
    9edc:	ffff0893          	add	a7,t5,-1

00009ee0 <.LVL132>:
    9ee0:	00b7e863          	bltu	a5,a1,9ef0 <.L47>
    9ee4:	0067f663          	bgeu	a5,t1,9ef0 <.L47>
    9ee8:	ffef0893          	add	a7,t5,-2
    9eec:	00b787b3          	add	a5,a5,a1

00009ef0 <.L47>:
    9ef0:	01071693          	sll	a3,a4,0x10
    9ef4:	0116e6b3          	or	a3,a3,a7
    9ef8:	01069713          	sll	a4,a3,0x10

00009efc <.LVL135>:
    9efc:	01075713          	srl	a4,a4,0x10
    9f00:	406787b3          	sub	a5,a5,t1

00009f04 <.LBB39>:
    9f04:	0106d313          	srl	t1,a3,0x10

00009f08 <.LVL137>:
    9f08:	03c70f33          	mul	t5,a4,t3

00009f0c <.LVL138>:
    9f0c:	03c30e33          	mul	t3,t1,t3

00009f10 <.LVL139>:
    9f10:	026e8333          	mul	t1,t4,t1

00009f14 <.LVL140>:
    9f14:	02ee8eb3          	mul	t4,t4,a4

00009f18 <.LVL141>:
    9f18:	010f5713          	srl	a4,t5,0x10
    9f1c:	01ce8eb3          	add	t4,t4,t3

00009f20 <.LVL142>:
    9f20:	01d70733          	add	a4,a4,t4

00009f24 <.LVL143>:
    9f24:	01c77663          	bgeu	a4,t3,9f30 <.L50>
    9f28:	000108b7          	lui	a7,0x10

00009f2c <.LVL144>:
    9f2c:	01130333          	add	t1,t1,a7

00009f30 <.L50>:
    9f30:	01075893          	srl	a7,a4,0x10
    9f34:	006888b3          	add	a7,a7,t1

00009f38 <.LVL146>:
    9f38:	00010337          	lui	t1,0x10

00009f3c <.LVL147>:
    9f3c:	fff30313          	add	t1,t1,-1 # ffff <.LBB204+0xb>

00009f40 <.LVL148>:
    9f40:	00677733          	and	a4,a4,t1

00009f44 <.LVL149>:
    9f44:	01071713          	sll	a4,a4,0x10
    9f48:	006f7f33          	and	t5,t5,t1

00009f4c <.LVL150>:
    9f4c:	01e70733          	add	a4,a4,t5

00009f50 <.LBE39>:
    9f50:	0117e863          	bltu	a5,a7,9f60 <.L51>
    9f54:	23179c63          	bne	a5,a7,a18c <.L52>

00009f58 <.LBB40>:
    9f58:	00068f13          	mv	t5,a3

00009f5c <.LBE40>:
    9f5c:	04070263          	beqz	a4,9fa0 <.L70>

00009f60 <.L51>:
    9f60:	00f587b3          	add	a5,a1,a5

00009f64 <.LVL152>:
    9f64:	fff68f13          	add	t5,a3,-1

00009f68 <.LBB41>:
    9f68:	00078313          	mv	t1,a5

00009f6c <.LBE41>:
    9f6c:	02b7e463          	bltu	a5,a1,9f94 <.L55>
    9f70:	0117e663          	bltu	a5,a7,9f7c <.L56>
    9f74:	21179a63          	bne	a5,a7,a188 <.L85>
    9f78:	02e57063          	bgeu	a0,a4,9f98 <.L57>

00009f7c <.L56>:
    9f7c:	ffe68f13          	add	t5,a3,-2

00009f80 <.LBB42>:
    9f80:	00151693          	sll	a3,a0,0x1

00009f84 <.LVL156>:
    9f84:	00a6b333          	sltu	t1,a3,a0

00009f88 <.LVL157>:
    9f88:	00b30333          	add	t1,t1,a1
    9f8c:	00678333          	add	t1,a5,t1

00009f90 <.LVL158>:
    9f90:	00068513          	mv	a0,a3

00009f94 <.L55>:
    9f94:	01131463          	bne	t1,a7,9f9c <.L58>

00009f98 <.L57>:
    9f98:	00a70463          	beq	a4,a0,9fa0 <.L70>

00009f9c <.L58>:
    9f9c:	001f6f13          	or	t5,t5,1

00009fa0 <.L70>:
  FP_PACK_D (r, R);
    9fa0:	3ff80713          	add	a4,a6,1023

00009fa4 <.LVL163>:
    9fa4:	10e05263          	blez	a4,a0a8 <.L59>
    9fa8:	007f7793          	and	a5,t5,7
    9fac:	02078063          	beqz	a5,9fcc <.L60>
    9fb0:	00ff7793          	and	a5,t5,15
    9fb4:	00400693          	li	a3,4
    9fb8:	00d78a63          	beq	a5,a3,9fcc <.L60>

00009fbc <.LBB44>:
    9fbc:	004f0793          	add	a5,t5,4
    9fc0:	01e7b6b3          	sltu	a3,a5,t5
    9fc4:	00d484b3          	add	s1,s1,a3

00009fc8 <.LVL164>:
    9fc8:	00078f13          	mv	t5,a5

00009fcc <.L60>:
    9fcc:	00749793          	sll	a5,s1,0x7
    9fd0:	0007da63          	bgez	a5,9fe4 <.L63>
    9fd4:	ff0007b7          	lui	a5,0xff000
    9fd8:	fff78793          	add	a5,a5,-1 # feffffff <_ebss+0xfefe9ccf>
    9fdc:	00f4f4b3          	and	s1,s1,a5
    9fe0:	40080713          	add	a4,a6,1024

00009fe4 <.L63>:
    9fe4:	7fe00793          	li	a5,2046
    9fe8:	08e7ca63          	blt	a5,a4,a07c <.L21>
    9fec:	003f5f13          	srl	t5,t5,0x3

00009ff0 <.LVL168>:
    9ff0:	01d49793          	sll	a5,s1,0x1d

00009ff4 <.LVL169>:
    9ff4:	01e7ef33          	or	t5,a5,t5

00009ff8 <.LVL170>:
    9ff8:	0034d513          	srl	a0,s1,0x3

00009ffc <.L22>:
    9ffc:	00c51513          	sll	a0,a0,0xc

0000a000 <.LBE47>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    a000:	02c12083          	lw	ra,44(sp)
    a004:	02812403          	lw	s0,40(sp)

0000a008 <.LBB48>:
  FP_PACK_D (r, R);
    a008:	00c55513          	srl	a0,a0,0xc
    a00c:	01471713          	sll	a4,a4,0x14

0000a010 <.LVL173>:
    a010:	00a76733          	or	a4,a4,a0
    a014:	01f61613          	sll	a2,a2,0x1f

0000a018 <.LVL174>:
    a018:	00c767b3          	or	a5,a4,a2

0000a01c <.LBE48>:
}
    a01c:	02412483          	lw	s1,36(sp)
    a020:	02012903          	lw	s2,32(sp)

0000a024 <.LVL176>:
    a024:	01c12983          	lw	s3,28(sp)

0000a028 <.LVL177>:
    a028:	01812a03          	lw	s4,24(sp)
    a02c:	01412a83          	lw	s5,20(sp)

0000a030 <.LVL178>:
    a030:	01012b03          	lw	s6,16(sp)

0000a034 <.LVL179>:
    a034:	00c12b83          	lw	s7,12(sp)
    a038:	000f0513          	mv	a0,t5
    a03c:	00078593          	mv	a1,a5
    a040:	03010113          	add	sp,sp,48
    a044:	00008067          	ret

0000a048 <.L24>:
  FP_DIV_D (R, A, B);
    a048:	fff80813          	add	a6,a6,-1

0000a04c <.LVL181>:
    a04c:	00000713          	li	a4,0
    a050:	cbdff06f          	j	9d0c <.L25>

0000a054 <.L19>:
  FP_UNPACK_D (A, a);
    a054:	00098613          	mv	a2,s3

0000a058 <.LBE50>:
  FP_DIV_D (R, A, B);
    a058:	000a0493          	mv	s1,s4

0000a05c <.LVL184>:
    a05c:	00040f13          	mv	t5,s0

0000a060 <.LVL185>:
    a060:	000b0793          	mv	a5,s6

0000a064 <.L17>:
  FP_PACK_D (r, R);
    a064:	00300713          	li	a4,3
    a068:	0ee78863          	beq	a5,a4,a158 <.L86>
    a06c:	00100713          	li	a4,1
    a070:	0ee78e63          	beq	a5,a4,a16c <.L88>
    a074:	00200713          	li	a4,2
    a078:	f2e794e3          	bne	a5,a4,9fa0 <.L70>

0000a07c <.L21>:
    a07c:	00000513          	li	a0,0
    a080:	00000f13          	li	t5,0
    a084:	7ff00713          	li	a4,2047
    a088:	f75ff06f          	j	9ffc <.L22>

0000a08c <.L20>:
  FP_UNPACK_D (B, b);
    a08c:	00090613          	mv	a2,s2

0000a090 <.LBE51>:
  FP_DIV_D (R, A, B);
    a090:	fd5ff06f          	j	a064 <.L17>

0000a094 <.L76>:
    a094:	000804b7          	lui	s1,0x80

0000a098 <.LVL191>:
    a098:	00000f13          	li	t5,0

0000a09c <.LVL192>:
    a09c:	00000613          	li	a2,0

0000a0a0 <.LVL193>:
    a0a0:	00300793          	li	a5,3

0000a0a4 <.LVL194>:
    a0a4:	fc1ff06f          	j	a064 <.L17>

0000a0a8 <.L59>:
  FP_PACK_D (r, R);
    a0a8:	00100513          	li	a0,1
    a0ac:	40e50533          	sub	a0,a0,a4

0000a0b0 <.LVL196>:
    a0b0:	03800793          	li	a5,56
    a0b4:	0aa7cc63          	blt	a5,a0,a16c <.L88>
    a0b8:	01f00793          	li	a5,31
    a0bc:	06a7c463          	blt	a5,a0,a124 <.L64>
    a0c0:	41e80813          	add	a6,a6,1054
    a0c4:	010497b3          	sll	a5,s1,a6
    a0c8:	00af5733          	srl	a4,t5,a0
    a0cc:	010f1833          	sll	a6,t5,a6
    a0d0:	00e7e7b3          	or	a5,a5,a4
    a0d4:	01003833          	snez	a6,a6
    a0d8:	0107e7b3          	or	a5,a5,a6

0000a0dc <.LVL197>:
    a0dc:	00a4d533          	srl	a0,s1,a0

0000a0e0 <.L65>:
    a0e0:	0077f713          	and	a4,a5,7
    a0e4:	02070063          	beqz	a4,a104 <.L67>
    a0e8:	00f7f713          	and	a4,a5,15
    a0ec:	00400693          	li	a3,4
    a0f0:	00d70a63          	beq	a4,a3,a104 <.L67>

0000a0f4 <.LBB54>:
    a0f4:	00478713          	add	a4,a5,4
    a0f8:	00f736b3          	sltu	a3,a4,a5
    a0fc:	00d50533          	add	a0,a0,a3

0000a100 <.LVL199>:
    a100:	00070793          	mv	a5,a4

0000a104 <.L67>:
    a104:	00851713          	sll	a4,a0,0x8
    a108:	06074863          	bltz	a4,a178 <.L90>

0000a10c <.LVL201>:
    a10c:	01d51f13          	sll	t5,a0,0x1d
    a110:	0037d793          	srl	a5,a5,0x3

0000a114 <.LVL202>:
    a114:	00ff6f33          	or	t5,t5,a5

0000a118 <.LVL203>:
    a118:	00355513          	srl	a0,a0,0x3

0000a11c <.L106>:
    a11c:	00000713          	li	a4,0
    a120:	eddff06f          	j	9ffc <.L22>

0000a124 <.L64>:
    a124:	fe100793          	li	a5,-31
    a128:	40e787b3          	sub	a5,a5,a4
    a12c:	02000693          	li	a3,32
    a130:	00f4d7b3          	srl	a5,s1,a5
    a134:	00000713          	li	a4,0
    a138:	00d50663          	beq	a0,a3,a144 <.L66>
    a13c:	43e80713          	add	a4,a6,1086
    a140:	00e49733          	sll	a4,s1,a4

0000a144 <.L66>:
    a144:	01e76733          	or	a4,a4,t5
    a148:	00e03733          	snez	a4,a4
    a14c:	00e7e7b3          	or	a5,a5,a4

0000a150 <.LVL206>:
    a150:	00000513          	li	a0,0

0000a154 <.LVL207>:
    a154:	f8dff06f          	j	a0e0 <.L65>

0000a158 <.L86>:
    a158:	00080537          	lui	a0,0x80
    a15c:	00000f13          	li	t5,0

0000a160 <.LVL209>:
    a160:	7ff00713          	li	a4,2047
    a164:	00000613          	li	a2,0

0000a168 <.LVL210>:
    a168:	e95ff06f          	j	9ffc <.L22>

0000a16c <.L88>:
    a16c:	00000513          	li	a0,0
    a170:	00000f13          	li	t5,0
    a174:	fa9ff06f          	j	a11c <.L106>

0000a178 <.L90>:
    a178:	00000513          	li	a0,0

0000a17c <.LVL213>:
    a17c:	00000f13          	li	t5,0
    a180:	00100713          	li	a4,1
    a184:	e79ff06f          	j	9ffc <.L22>

0000a188 <.L85>:
  FP_DIV_D (R, A, B);
    a188:	000f0693          	mv	a3,t5

0000a18c <.L52>:
    a18c:	00068f13          	mv	t5,a3
    a190:	e0dff06f          	j	9f9c <.L58>

0000a194 <__eqdf2>:
  FP_DECL_D (A);
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    a194:	0145d713          	srl	a4,a1,0x14
    a198:	001007b7          	lui	a5,0x100
    a19c:	fff78793          	add	a5,a5,-1 # fffff <_ebss+0xe9ccf>

0000a1a0 <.LBB3>:
  FP_UNPACK_RAW_D (B, b);
    a1a0:	0146d813          	srl	a6,a3,0x14

0000a1a4 <.LBE3>:
{
    a1a4:	00050313          	mv	t1,a0
    a1a8:	00050e93          	mv	t4,a0

0000a1ac <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    a1ac:	7ff77713          	and	a4,a4,2047

0000a1b0 <.LBE4>:
  FP_CMP_EQ_D (r, A, B, 1);
    a1b0:	7ff00513          	li	a0,2047

0000a1b4 <.LBB5>:
  FP_UNPACK_RAW_D (A, a);
    a1b4:	00b7f8b3          	and	a7,a5,a1

0000a1b8 <.LVL3>:
    a1b8:	00060f13          	mv	t5,a2

0000a1bc <.LBB6>:
  FP_UNPACK_RAW_D (B, b);
    a1bc:	00d7f7b3          	and	a5,a5,a3

0000a1c0 <.LBB7>:
  FP_UNPACK_RAW_D (A, a);
    a1c0:	01f5d593          	srl	a1,a1,0x1f

0000a1c4 <.LBB8>:
  FP_UNPACK_RAW_D (B, b);
    a1c4:	7ff87813          	and	a6,a6,2047
    a1c8:	01f6d693          	srl	a3,a3,0x1f

0000a1cc <.LBE8>:
  FP_CMP_EQ_D (r, A, B, 1);
    a1cc:	00a71c63          	bne	a4,a0,a1e4 <.L2>
    a1d0:	0068ee33          	or	t3,a7,t1
    a1d4:	00100513          	li	a0,1
    a1d8:	000e1463          	bnez	t3,a1e0 <.L1>
    a1dc:	00e80663          	beq	a6,a4,a1e8 <.L6>

0000a1e0 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    a1e0:	00008067          	ret

0000a1e4 <.L2>:
  FP_CMP_EQ_D (r, A, B, 1);
    a1e4:	00a81863          	bne	a6,a0,a1f4 <.L5>

0000a1e8 <.L6>:
    a1e8:	00c7e633          	or	a2,a5,a2

0000a1ec <.LVL9>:
    a1ec:	00100513          	li	a0,1
    a1f0:	fe0618e3          	bnez	a2,a1e0 <.L1>

0000a1f4 <.L5>:
    a1f4:	00100513          	li	a0,1
    a1f8:	ff0714e3          	bne	a4,a6,a1e0 <.L1>
    a1fc:	fef892e3          	bne	a7,a5,a1e0 <.L1>
    a200:	ffee90e3          	bne	t4,t5,a1e0 <.L1>
    a204:	00d58a63          	beq	a1,a3,a218 <.L12>
    a208:	fc071ce3          	bnez	a4,a1e0 <.L1>
    a20c:	0068e8b3          	or	a7,a7,t1

0000a210 <.LVL10>:
    a210:	01103533          	snez	a0,a7
    a214:	00008067          	ret

0000a218 <.L12>:
    a218:	00000513          	li	a0,0
    a21c:	00008067          	ret

0000a220 <__gedf2>:
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
  FP_UNPACK_RAW_D (B, b);
    a220:	0146d793          	srl	a5,a3,0x14

0000a224 <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    a224:	0145d893          	srl	a7,a1,0x14
    a228:	00100737          	lui	a4,0x100
    a22c:	fff70713          	add	a4,a4,-1 # fffff <_ebss+0xe9ccf>

0000a230 <.LBE4>:
{
    a230:	00050813          	mv	a6,a0
    a234:	00050e13          	mv	t3,a0

0000a238 <.LBB5>:
  FP_UNPACK_RAW_D (A, a);
    a238:	7ff8f893          	and	a7,a7,2047

0000a23c <.LBB6>:
  FP_UNPACK_RAW_D (B, b);
    a23c:	7ff7f513          	and	a0,a5,2047

0000a240 <.LBE6>:
  FP_CMP_D (r, A, B, -2, 2);
    a240:	7ff00793          	li	a5,2047

0000a244 <.LBB7>:
  FP_UNPACK_RAW_D (A, a);
    a244:	00b77333          	and	t1,a4,a1
    a248:	00060e93          	mv	t4,a2

0000a24c <.LBB8>:
  FP_UNPACK_RAW_D (B, b);
    a24c:	00d77733          	and	a4,a4,a3

0000a250 <.LBB9>:
  FP_UNPACK_RAW_D (A, a);
    a250:	01f5d593          	srl	a1,a1,0x1f

0000a254 <.LBB10>:
  FP_UNPACK_RAW_D (B, b);
    a254:	01f6d693          	srl	a3,a3,0x1f

0000a258 <.LBE10>:
  FP_CMP_D (r, A, B, -2, 2);
    a258:	00f89663          	bne	a7,a5,a264 <.L2>
    a25c:	010367b3          	or	a5,t1,a6
    a260:	06079c63          	bnez	a5,a2d8 <.L17>

0000a264 <.L2>:
    a264:	7ff00793          	li	a5,2047
    a268:	00f51663          	bne	a0,a5,a274 <.L4>
    a26c:	00c767b3          	or	a5,a4,a2
    a270:	06079463          	bnez	a5,a2d8 <.L17>

0000a274 <.L4>:
    a274:	00000793          	li	a5,0
    a278:	00089663          	bnez	a7,a284 <.L5>
    a27c:	01036833          	or	a6,t1,a6

0000a280 <.LVL6>:
    a280:	00183793          	seqz	a5,a6

0000a284 <.L5>:
    a284:	04051e63          	bnez	a0,a2e0 <.L6>
    a288:	00c76633          	or	a2,a4,a2

0000a28c <.LVL8>:
    a28c:	00078c63          	beqz	a5,a2a4 <.L7>
    a290:	02060063          	beqz	a2,a2b0 <.L1>

0000a294 <.L38>:
    a294:	00100513          	li	a0,1

0000a298 <.LVL10>:
    a298:	00069c63          	bnez	a3,a2b0 <.L1>

0000a29c <.L34>:
    a29c:	fff00513          	li	a0,-1
    a2a0:	00008067          	ret

0000a2a4 <.L7>:
    a2a4:	04061063          	bnez	a2,a2e4 <.L8>

0000a2a8 <.L12>:
    a2a8:	fff00513          	li	a0,-1

0000a2ac <.LVL13>:
    a2ac:	04058463          	beqz	a1,a2f4 <.L33>

0000a2b0 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    a2b0:	00008067          	ret

0000a2b4 <.L10>:
  FP_CMP_D (r, A, B, -2, 2);
    a2b4:	fea8c0e3          	blt	a7,a0,a294 <.L38>
    a2b8:	fe6768e3          	bltu	a4,t1,a2a8 <.L12>
    a2bc:	00e31863          	bne	t1,a4,a2cc <.L13>
    a2c0:	ffcee4e3          	bltu	t4,t3,a2a8 <.L12>
    a2c4:	00000513          	li	a0,0

0000a2c8 <.LVL15>:
    a2c8:	ffde74e3          	bgeu	t3,t4,a2b0 <.L1>

0000a2cc <.L13>:
    a2cc:	00100513          	li	a0,1
    a2d0:	fe0590e3          	bnez	a1,a2b0 <.L1>
    a2d4:	fc9ff06f          	j	a29c <.L34>

0000a2d8 <.L17>:
    a2d8:	ffe00513          	li	a0,-2

0000a2dc <.LVL17>:
    a2dc:	00008067          	ret

0000a2e0 <.L6>:
    a2e0:	fa079ae3          	bnez	a5,a294 <.L38>

0000a2e4 <.L8>:
    a2e4:	fcb692e3          	bne	a3,a1,a2a8 <.L12>
    a2e8:	fd1556e3          	bge	a0,a7,a2b4 <.L10>
    a2ec:	fff00513          	li	a0,-1

0000a2f0 <.LVL20>:
    a2f0:	fc0690e3          	bnez	a3,a2b0 <.L1>

0000a2f4 <.L33>:
    a2f4:	00100513          	li	a0,1
    a2f8:	00008067          	ret

0000a2fc <__muldf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__muldf3 (DFtype a, DFtype b)
{
    a2fc:	fd010113          	add	sp,sp,-48
    a300:	01512a23          	sw	s5,20(sp)

0000a304 <.LBB3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
    a304:	0145da93          	srl	s5,a1,0x14

0000a308 <.LBE3>:
{
    a308:	02812423          	sw	s0,40(sp)
    a30c:	02912223          	sw	s1,36(sp)
    a310:	01312e23          	sw	s3,28(sp)
    a314:	01412c23          	sw	s4,24(sp)
    a318:	01612823          	sw	s6,16(sp)

0000a31c <.LBB4>:
  FP_UNPACK_D (A, a);
    a31c:	00c59493          	sll	s1,a1,0xc

0000a320 <.LBE4>:
{
    a320:	02112623          	sw	ra,44(sp)
    a324:	03212023          	sw	s2,32(sp)
    a328:	01712623          	sw	s7,12(sp)

0000a32c <.LBB5>:
  FP_UNPACK_D (A, a);
    a32c:	7ffafa93          	and	s5,s5,2047

0000a330 <.LBE5>:
{
    a330:	00050413          	mv	s0,a0
    a334:	00060b13          	mv	s6,a2
    a338:	00068993          	mv	s3,a3

0000a33c <.LBB6>:
  FP_UNPACK_D (A, a);
    a33c:	00c4d493          	srl	s1,s1,0xc

0000a340 <.LVL1>:
    a340:	01f5da13          	srl	s4,a1,0x1f

0000a344 <.LBE6>:
    a344:	240a8e63          	beqz	s5,a5a0 <.L2>
    a348:	7ff00793          	li	a5,2047
    a34c:	2cfa8063          	beq	s5,a5,a60c <.L3>

0000a350 <.LVL3>:
    a350:	00349493          	sll	s1,s1,0x3
    a354:	01d55793          	srl	a5,a0,0x1d
    a358:	0097e7b3          	or	a5,a5,s1
    a35c:	008004b7          	lui	s1,0x800

0000a360 <.LVL4>:
    a360:	0097e4b3          	or	s1,a5,s1

0000a364 <.LVL5>:
    a364:	00351913          	sll	s2,a0,0x3

0000a368 <.LVL6>:
    a368:	c01a8a93          	add	s5,s5,-1023

0000a36c <.L79>:
    a36c:	00000b93          	li	s7,0

0000a370 <.L4>:
  FP_UNPACK_D (B, b);
    a370:	0149d713          	srl	a4,s3,0x14
    a374:	00c99413          	sll	s0,s3,0xc
    a378:	7ff77713          	and	a4,a4,2047
    a37c:	00c45413          	srl	s0,s0,0xc

0000a380 <.LVL9>:
    a380:	01f9d993          	srl	s3,s3,0x1f

0000a384 <.LBE11>:
    a384:	2c070063          	beqz	a4,a644 <.L9>
    a388:	7ff00793          	li	a5,2047
    a38c:	32f70463          	beq	a4,a5,a6b4 <.L10>
    a390:	00341413          	sll	s0,s0,0x3
    a394:	01db5793          	srl	a5,s6,0x1d
    a398:	0087e7b3          	or	a5,a5,s0
    a39c:	00800437          	lui	s0,0x800

0000a3a0 <.LVL11>:
    a3a0:	0087e433          	or	s0,a5,s0

0000a3a4 <.LVL12>:
    a3a4:	c0170693          	add	a3,a4,-1023
    a3a8:	003b1793          	sll	a5,s6,0x3

0000a3ac <.L80>:
    a3ac:	00000713          	li	a4,0

0000a3b0 <.L11>:
  FP_MUL_D (R, A, B);
    a3b0:	00da8ab3          	add	s5,s5,a3

0000a3b4 <.LVL15>:
    a3b4:	002b9693          	sll	a3,s7,0x2

0000a3b8 <.LVL16>:
    a3b8:	00e6e6b3          	or	a3,a3,a4
    a3bc:	00a00613          	li	a2,10
    a3c0:	001a8513          	add	a0,s5,1

0000a3c4 <.LVL17>:
    a3c4:	40d64663          	blt	a2,a3,a7d0 <.L16>
    a3c8:	00200613          	li	a2,2
    a3cc:	013a45b3          	xor	a1,s4,s3
    a3d0:	30d64e63          	blt	a2,a3,a6ec <.L17>
    a3d4:	fff68693          	add	a3,a3,-1
    a3d8:	00100613          	li	a2,1
    a3dc:	32d67a63          	bgeu	a2,a3,a710 <.L19>

0000a3e0 <.L18>:
    a3e0:	00010337          	lui	t1,0x10
    a3e4:	fff30e13          	add	t3,t1,-1 # ffff <.LBB204+0xb>
    a3e8:	01095713          	srl	a4,s2,0x10

0000a3ec <.LVL19>:
    a3ec:	0107d893          	srl	a7,a5,0x10

0000a3f0 <.LVL20>:
    a3f0:	01c97933          	and	s2,s2,t3

0000a3f4 <.LVL21>:
    a3f4:	01c7ff33          	and	t5,a5,t3
    a3f8:	03e907b3          	mul	a5,s2,t5

0000a3fc <.LVL22>:
    a3fc:	03e70eb3          	mul	t4,a4,t5

0000a400 <.LVL23>:
    a400:	0107d813          	srl	a6,a5,0x10
    a404:	03288633          	mul	a2,a7,s2

0000a408 <.LVL24>:
    a408:	01d60633          	add	a2,a2,t4

0000a40c <.LVL25>:
    a40c:	00c80833          	add	a6,a6,a2
    a410:	031706b3          	mul	a3,a4,a7

0000a414 <.LVL26>:
    a414:	01d87463          	bgeu	a6,t4,a41c <.L23>
    a418:	006686b3          	add	a3,a3,t1

0000a41c <.L23>:
    a41c:	01085293          	srl	t0,a6,0x10
    a420:	01c87833          	and	a6,a6,t3

0000a424 <.LVL28>:
    a424:	01c7f7b3          	and	a5,a5,t3

0000a428 <.LBB20>:
    a428:	01045613          	srl	a2,s0,0x10

0000a42c <.LVL30>:
    a42c:	01c47e33          	and	t3,s0,t3

0000a430 <.LBB21>:
    a430:	01081813          	sll	a6,a6,0x10
    a434:	00f80833          	add	a6,a6,a5

0000a438 <.LBB22>:
    a438:	03c90eb3          	mul	t4,s2,t3

0000a43c <.LVL32>:
    a43c:	03c707b3          	mul	a5,a4,t3

0000a440 <.LVL33>:
    a440:	03260933          	mul	s2,a2,s2

0000a444 <.LVL34>:
    a444:	02c70333          	mul	t1,a4,a2

0000a448 <.LVL35>:
    a448:	00f90933          	add	s2,s2,a5

0000a44c <.LVL36>:
    a44c:	010ed713          	srl	a4,t4,0x10

0000a450 <.LVL37>:
    a450:	01270733          	add	a4,a4,s2

0000a454 <.LVL38>:
    a454:	00f77663          	bgeu	a4,a5,a460 <.L24>
    a458:	000107b7          	lui	a5,0x10

0000a45c <.LVL39>:
    a45c:	00f30333          	add	t1,t1,a5

0000a460 <.L24>:
    a460:	00010437          	lui	s0,0x10
    a464:	01075793          	srl	a5,a4,0x10
    a468:	fff40f93          	add	t6,s0,-1 # ffff <.LBB204+0xb>
    a46c:	00678333          	add	t1,a5,t1

0000a470 <.LVL41>:
    a470:	01f777b3          	and	a5,a4,t6
    a474:	01fefeb3          	and	t4,t4,t6

0000a478 <.LVL42>:
    a478:	01079793          	sll	a5,a5,0x10
    a47c:	01f4ffb3          	and	t6,s1,t6
    a480:	01d787b3          	add	a5,a5,t4

0000a484 <.LBB23>:
    a484:	0104de93          	srl	t4,s1,0x10
    a488:	03ff03b3          	mul	t2,t5,t6
    a48c:	00f282b3          	add	t0,t0,a5

0000a490 <.LBB24>:
    a490:	03ee8f33          	mul	t5,t4,t5

0000a494 <.LVL44>:
    a494:	0103d713          	srl	a4,t2,0x10

0000a498 <.LVL45>:
    a498:	03d884b3          	mul	s1,a7,t4

0000a49c <.LVL46>:
    a49c:	03f888b3          	mul	a7,a7,t6

0000a4a0 <.LVL47>:
    a4a0:	01e888b3          	add	a7,a7,t5

0000a4a4 <.LVL48>:
    a4a4:	01170733          	add	a4,a4,a7

0000a4a8 <.LVL49>:
    a4a8:	01e77463          	bgeu	a4,t5,a4b0 <.L25>
    a4ac:	008484b3          	add	s1,s1,s0

0000a4b0 <.L25>:
    a4b0:	01075f13          	srl	t5,a4,0x10

0000a4b4 <.LVL51>:
    a4b4:	009f0f33          	add	t5,t5,s1

0000a4b8 <.LVL52>:
    a4b8:	000104b7          	lui	s1,0x10

0000a4bc <.LVL53>:
    a4bc:	fff48413          	add	s0,s1,-1 # ffff <.LBB204+0xb>
    a4c0:	00877733          	and	a4,a4,s0

0000a4c4 <.LVL54>:
    a4c4:	0083f3b3          	and	t2,t2,s0

0000a4c8 <.LVL55>:
    a4c8:	01071713          	sll	a4,a4,0x10
    a4cc:	007708b3          	add	a7,a4,t2

0000a4d0 <.LBB25>:
    a4d0:	03fe03b3          	mul	t2,t3,t6

0000a4d4 <.LVL57>:
    a4d4:	03ce8e33          	mul	t3,t4,t3

0000a4d8 <.LVL58>:
    a4d8:	03d60eb3          	mul	t4,a2,t4

0000a4dc <.LVL59>:
    a4dc:	03f60633          	mul	a2,a2,t6

0000a4e0 <.LVL60>:
    a4e0:	0103df93          	srl	t6,t2,0x10
    a4e4:	01c60633          	add	a2,a2,t3

0000a4e8 <.LVL61>:
    a4e8:	00cf8fb3          	add	t6,t6,a2

0000a4ec <.LVL62>:
    a4ec:	01cff463          	bgeu	t6,t3,a4f4 <.L26>
    a4f0:	009e8eb3          	add	t4,t4,s1

0000a4f4 <.L26>:
    a4f4:	008ff733          	and	a4,t6,s0
    a4f8:	0083f3b3          	and	t2,t2,s0

0000a4fc <.LVL64>:
    a4fc:	01071713          	sll	a4,a4,0x10

0000a500 <.LBB28>:
    a500:	005686b3          	add	a3,a3,t0

0000a504 <.LBB29>:
    a504:	00770733          	add	a4,a4,t2
    a508:	00670333          	add	t1,a4,t1

0000a50c <.LBB30>:
    a50c:	00f6b7b3          	sltu	a5,a3,a5

0000a510 <.LVL67>:
    a510:	00f307b3          	add	a5,t1,a5
    a514:	00e33633          	sltu	a2,t1,a4

0000a518 <.LVL68>:
    a518:	011688b3          	add	a7,a3,a7

0000a51c <.LVL69>:
    a51c:	0067b333          	sltu	t1,a5,t1
    a520:	00666633          	or	a2,a2,t1

0000a524 <.LBB31>:
    a524:	00d8b6b3          	sltu	a3,a7,a3
    a528:	01e78333          	add	t1,a5,t5
    a52c:	00d306b3          	add	a3,t1,a3
    a530:	00f33733          	sltu	a4,t1,a5

0000a534 <.LBB32>:
    a534:	010fdf93          	srl	t6,t6,0x10

0000a538 <.LBB33>:
    a538:	0066b333          	sltu	t1,a3,t1

0000a53c <.LBB38>:
    a53c:	00989793          	sll	a5,a7,0x9
    a540:	01f60633          	add	a2,a2,t6

0000a544 <.LBB34>:
    a544:	00676733          	or	a4,a4,t1
    a548:	00c70733          	add	a4,a4,a2

0000a54c <.LBB41>:
    a54c:	0107e7b3          	or	a5,a5,a6

0000a550 <.LBB37>:
    a550:	01d70733          	add	a4,a4,t4

0000a554 <.LBB42>:
    a554:	00f037b3          	snez	a5,a5

0000a558 <.LVL74>:
    a558:	0178d893          	srl	a7,a7,0x17

0000a55c <.LVL75>:
    a55c:	00971713          	sll	a4,a4,0x9
    a560:	0176d413          	srl	s0,a3,0x17

0000a564 <.LBE42>:
    a564:	0117e7b3          	or	a5,a5,a7

0000a568 <.LBB43>:
    a568:	00969693          	sll	a3,a3,0x9

0000a56c <.LBE43>:
    a56c:	00d7e7b3          	or	a5,a5,a3

0000a570 <.LBE17>:
    a570:	00771693          	sll	a3,a4,0x7

0000a574 <.LBB44>:
    a574:	00876433          	or	s0,a4,s0

0000a578 <.LBE44>:
    a578:	0206d063          	bgez	a3,a598 <.L37>
    a57c:	0017d713          	srl	a4,a5,0x1
    a580:	0017f793          	and	a5,a5,1
    a584:	00f76733          	or	a4,a4,a5
    a588:	01f41793          	sll	a5,s0,0x1f

0000a58c <.LVL78>:
    a58c:	00f767b3          	or	a5,a4,a5

0000a590 <.LVL79>:
    a590:	00145413          	srl	s0,s0,0x1

0000a594 <.LVL80>:
    a594:	00050a93          	mv	s5,a0

0000a598 <.L37>:
    a598:	000a8513          	mv	a0,s5
    a59c:	18c0006f          	j	a728 <.L50>

0000a5a0 <.L2>:
  FP_UNPACK_D (A, a);
    a5a0:	00a4e933          	or	s2,s1,a0
    a5a4:	08090063          	beqz	s2,a624 <.L51>

0000a5a8 <.LBB54>:
    a5a8:	04048063          	beqz	s1,a5e8 <.L5>
    a5ac:	00048513          	mv	a0,s1

0000a5b0 <.LVL83>:
    a5b0:	864f70ef          	jal	1614 <__clzsi2>

0000a5b4 <.LVL84>:
    a5b4:	ff550713          	add	a4,a0,-11 # 7fff5 <_ebss+0x69cc5>

0000a5b8 <.L6>:
    a5b8:	01d00793          	li	a5,29
    a5bc:	ff850693          	add	a3,a0,-8
    a5c0:	40e787b3          	sub	a5,a5,a4
    a5c4:	00d494b3          	sll	s1,s1,a3
    a5c8:	00f457b3          	srl	a5,s0,a5
    a5cc:	0097e7b3          	or	a5,a5,s1

0000a5d0 <.LVL86>:
    a5d0:	00d414b3          	sll	s1,s0,a3

0000a5d4 <.L8>:
    a5d4:	c0d00a93          	li	s5,-1011

0000a5d8 <.LVL88>:
    a5d8:	00048913          	mv	s2,s1
    a5dc:	40aa8ab3          	sub	s5,s5,a0

0000a5e0 <.LVL89>:
    a5e0:	00078493          	mv	s1,a5
    a5e4:	d89ff06f          	j	a36c <.L79>

0000a5e8 <.L5>:
    a5e8:	82cf70ef          	jal	1614 <__clzsi2>

0000a5ec <.LVL91>:
    a5ec:	00050793          	mv	a5,a0

0000a5f0 <.LVL92>:
    a5f0:	01578713          	add	a4,a5,21 # 10015 <.L87+0x1>
    a5f4:	01c00693          	li	a3,28
    a5f8:	02050513          	add	a0,a0,32

0000a5fc <.LVL93>:
    a5fc:	fae6dee3          	bge	a3,a4,a5b8 <.L6>
    a600:	ff878793          	add	a5,a5,-8
    a604:	00f417b3          	sll	a5,s0,a5

0000a608 <.LVL94>:
    a608:	fcdff06f          	j	a5d4 <.L8>

0000a60c <.L3>:
    a60c:	00a4e933          	or	s2,s1,a0
    a610:	02091263          	bnez	s2,a634 <.L52>

0000a614 <.LBB55>:
    a614:	00000493          	li	s1,0
    a618:	7ff00a93          	li	s5,2047

0000a61c <.LBE55>:
    a61c:	00200b93          	li	s7,2
    a620:	d51ff06f          	j	a370 <.L4>

0000a624 <.L51>:
    a624:	00000493          	li	s1,0
    a628:	00000a93          	li	s5,0

0000a62c <.LBE56>:
    a62c:	00100b93          	li	s7,1
    a630:	d41ff06f          	j	a370 <.L4>

0000a634 <.L52>:
    a634:	00050913          	mv	s2,a0
    a638:	7ff00a93          	li	s5,2047

0000a63c <.LBE57>:
    a63c:	00300b93          	li	s7,3
    a640:	d31ff06f          	j	a370 <.L4>

0000a644 <.L9>:
  FP_UNPACK_D (B, b);
    a644:	016467b3          	or	a5,s0,s6
    a648:	08078263          	beqz	a5,a6cc <.L53>

0000a64c <.LBB58>:
    a64c:	04040063          	beqz	s0,a68c <.L12>
    a650:	00040513          	mv	a0,s0
    a654:	fc1f60ef          	jal	1614 <__clzsi2>

0000a658 <.LVL103>:
    a658:	ff550693          	add	a3,a0,-11

0000a65c <.L13>:
    a65c:	01d00713          	li	a4,29
    a660:	ff850793          	add	a5,a0,-8
    a664:	40d70733          	sub	a4,a4,a3
    a668:	00f41433          	sll	s0,s0,a5
    a66c:	00eb5733          	srl	a4,s6,a4
    a670:	00876733          	or	a4,a4,s0

0000a674 <.LVL105>:
    a674:	00fb1433          	sll	s0,s6,a5

0000a678 <.L15>:
    a678:	c0d00693          	li	a3,-1011

0000a67c <.LVL107>:
    a67c:	00040793          	mv	a5,s0
    a680:	40a686b3          	sub	a3,a3,a0

0000a684 <.LVL108>:
    a684:	00070413          	mv	s0,a4
    a688:	d25ff06f          	j	a3ac <.L80>

0000a68c <.L12>:
    a68c:	000b0513          	mv	a0,s6
    a690:	f85f60ef          	jal	1614 <__clzsi2>

0000a694 <.LVL110>:
    a694:	00050793          	mv	a5,a0

0000a698 <.LVL111>:
    a698:	01578693          	add	a3,a5,21
    a69c:	01c00713          	li	a4,28
    a6a0:	02050513          	add	a0,a0,32

0000a6a4 <.LVL112>:
    a6a4:	fad75ce3          	bge	a4,a3,a65c <.L13>
    a6a8:	ff878793          	add	a5,a5,-8
    a6ac:	00fb1733          	sll	a4,s6,a5

0000a6b0 <.LVL113>:
    a6b0:	fc9ff06f          	j	a678 <.L15>

0000a6b4 <.L10>:
    a6b4:	016467b3          	or	a5,s0,s6
    a6b8:	02079263          	bnez	a5,a6dc <.L54>

0000a6bc <.LBB59>:
    a6bc:	00000413          	li	s0,0
    a6c0:	7ff00693          	li	a3,2047

0000a6c4 <.LBE59>:
    a6c4:	00200713          	li	a4,2

0000a6c8 <.LVL116>:
    a6c8:	ce9ff06f          	j	a3b0 <.L11>

0000a6cc <.L53>:
    a6cc:	00000413          	li	s0,0
    a6d0:	00000693          	li	a3,0

0000a6d4 <.LBE60>:
    a6d4:	00100713          	li	a4,1

0000a6d8 <.LVL118>:
    a6d8:	cd9ff06f          	j	a3b0 <.L11>

0000a6dc <.L54>:
    a6dc:	000b0793          	mv	a5,s6
    a6e0:	7ff00693          	li	a3,2047

0000a6e4 <.LBE61>:
    a6e4:	00300713          	li	a4,3

0000a6e8 <.LVL120>:
    a6e8:	cc9ff06f          	j	a3b0 <.L11>

0000a6ec <.L17>:
    a6ec:	00100613          	li	a2,1
    a6f0:	00d61633          	sll	a2,a2,a3
  FP_MUL_D (R, A, B);
    a6f4:	53067693          	and	a3,a2,1328
    a6f8:	0e069663          	bnez	a3,a7e4 <.L55>
    a6fc:	24067813          	and	a6,a2,576
    a700:	1a081a63          	bnez	a6,a8b4 <.L56>
    a704:	08867613          	and	a2,a2,136
    a708:	cc060ce3          	beqz	a2,a3e0 <.L18>

0000a70c <.L21>:
  FP_UNPACK_D (B, b);
    a70c:	00098593          	mv	a1,s3

0000a710 <.L19>:
  FP_PACK_D (r, R);
    a710:	00200693          	li	a3,2
    a714:	18d70863          	beq	a4,a3,a8a4 <.L38>
    a718:	00300693          	li	a3,3
    a71c:	1ad70463          	beq	a4,a3,a8c4 <.L58>
    a720:	00100693          	li	a3,1
    a724:	1ad70663          	beq	a4,a3,a8d0 <.L60>

0000a728 <.L50>:
    a728:	3ff50613          	add	a2,a0,1023

0000a72c <.LVL124>:
    a72c:	0cc05463          	blez	a2,a7f4 <.L39>
    a730:	0077f713          	and	a4,a5,7
    a734:	02070063          	beqz	a4,a754 <.L40>
    a738:	00f7f713          	and	a4,a5,15
    a73c:	00400693          	li	a3,4
    a740:	00d70a63          	beq	a4,a3,a754 <.L40>

0000a744 <.LBB63>:
    a744:	00478713          	add	a4,a5,4
    a748:	00f736b3          	sltu	a3,a4,a5

0000a74c <.LVL125>:
    a74c:	00d40433          	add	s0,s0,a3
    a750:	00070793          	mv	a5,a4

0000a754 <.L40>:
    a754:	00741713          	sll	a4,s0,0x7
    a758:	00075a63          	bgez	a4,a76c <.L43>
    a75c:	ff000737          	lui	a4,0xff000
    a760:	fff70713          	add	a4,a4,-1 # feffffff <_ebss+0xfefe9ccf>

0000a764 <.LVL127>:
    a764:	00e47433          	and	s0,s0,a4

0000a768 <.LVL128>:
    a768:	40050613          	add	a2,a0,1024

0000a76c <.L43>:
    a76c:	7fe00713          	li	a4,2046
    a770:	12c74a63          	blt	a4,a2,a8a4 <.L38>
    a774:	0037d793          	srl	a5,a5,0x3
    a778:	01d41693          	sll	a3,s0,0x1d
    a77c:	00f6e6b3          	or	a3,a3,a5
    a780:	00345713          	srl	a4,s0,0x3

0000a784 <.L20>:
    a784:	00c71713          	sll	a4,a4,0xc

0000a788 <.LBE66>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    a788:	02c12083          	lw	ra,44(sp)
    a78c:	02812403          	lw	s0,40(sp)

0000a790 <.LBB67>:
  FP_PACK_D (r, R);
    a790:	01461613          	sll	a2,a2,0x14

0000a794 <.LVL132>:
    a794:	00c75713          	srl	a4,a4,0xc
    a798:	01f59593          	sll	a1,a1,0x1f

0000a79c <.LVL133>:
    a79c:	00e66633          	or	a2,a2,a4
    a7a0:	00b667b3          	or	a5,a2,a1

0000a7a4 <.LBE67>:
}
    a7a4:	02412483          	lw	s1,36(sp)
    a7a8:	02012903          	lw	s2,32(sp)
    a7ac:	01c12983          	lw	s3,28(sp)

0000a7b0 <.LVL135>:
    a7b0:	01812a03          	lw	s4,24(sp)

0000a7b4 <.LVL136>:
    a7b4:	01412a83          	lw	s5,20(sp)
    a7b8:	01012b03          	lw	s6,16(sp)
    a7bc:	00c12b83          	lw	s7,12(sp)

0000a7c0 <.LVL137>:
    a7c0:	00068513          	mv	a0,a3
    a7c4:	00078593          	mv	a1,a5
    a7c8:	03010113          	add	sp,sp,48
    a7cc:	00008067          	ret

0000a7d0 <.L16>:
  FP_MUL_D (R, A, B);
    a7d0:	00f00613          	li	a2,15
    a7d4:	0ec68863          	beq	a3,a2,a8c4 <.L58>
    a7d8:	00b00613          	li	a2,11

0000a7dc <.LBB68>:
  FP_UNPACK_D (A, a);
    a7dc:	000a0593          	mv	a1,s4

0000a7e0 <.LBE68>:
  FP_MUL_D (R, A, B);
    a7e0:	f2c686e3          	beq	a3,a2,a70c <.L21>

0000a7e4 <.L55>:
    a7e4:	00048413          	mv	s0,s1

0000a7e8 <.LVL140>:
    a7e8:	00090793          	mv	a5,s2
    a7ec:	000b8713          	mv	a4,s7

0000a7f0 <.LVL141>:
    a7f0:	f21ff06f          	j	a710 <.L19>

0000a7f4 <.L39>:
  FP_PACK_D (r, R);
    a7f4:	00100713          	li	a4,1
    a7f8:	40c70733          	sub	a4,a4,a2

0000a7fc <.LVL143>:
    a7fc:	03800693          	li	a3,56
    a800:	0ce6c863          	blt	a3,a4,a8d0 <.L60>
    a804:	01f00693          	li	a3,31
    a808:	06e6c463          	blt	a3,a4,a870 <.L44>
    a80c:	41e50513          	add	a0,a0,1054
    a810:	00e7d633          	srl	a2,a5,a4
    a814:	00a416b3          	sll	a3,s0,a0
    a818:	00a79533          	sll	a0,a5,a0
    a81c:	00c6e6b3          	or	a3,a3,a2
    a820:	00a03533          	snez	a0,a0
    a824:	00a6e7b3          	or	a5,a3,a0

0000a828 <.LVL144>:
    a828:	00e45733          	srl	a4,s0,a4

0000a82c <.L45>:
    a82c:	0077f693          	and	a3,a5,7
    a830:	02068063          	beqz	a3,a850 <.L47>
    a834:	00f7f693          	and	a3,a5,15
    a838:	00400613          	li	a2,4
    a83c:	00c68a63          	beq	a3,a2,a850 <.L47>

0000a840 <.LBB71>:
    a840:	00478693          	add	a3,a5,4
    a844:	00f6b633          	sltu	a2,a3,a5
    a848:	00c70733          	add	a4,a4,a2

0000a84c <.LVL146>:
    a84c:	00068793          	mv	a5,a3

0000a850 <.L47>:
    a850:	00871693          	sll	a3,a4,0x8
    a854:	0806c463          	bltz	a3,a8dc <.L62>

0000a858 <.LVL148>:
    a858:	01d71693          	sll	a3,a4,0x1d
    a85c:	0037d793          	srl	a5,a5,0x3

0000a860 <.LVL149>:
    a860:	00f6e6b3          	or	a3,a3,a5

0000a864 <.LVL150>:
    a864:	00375713          	srl	a4,a4,0x3

0000a868 <.L82>:
    a868:	00000613          	li	a2,0
    a86c:	f19ff06f          	j	a784 <.L20>

0000a870 <.L44>:
    a870:	fe100693          	li	a3,-31
    a874:	40c686b3          	sub	a3,a3,a2
    a878:	02000813          	li	a6,32
    a87c:	00d456b3          	srl	a3,s0,a3
    a880:	00000613          	li	a2,0
    a884:	01070663          	beq	a4,a6,a890 <.L46>
    a888:	43e50613          	add	a2,a0,1086
    a88c:	00c41633          	sll	a2,s0,a2

0000a890 <.L46>:
    a890:	00f66633          	or	a2,a2,a5
    a894:	00c03633          	snez	a2,a2
    a898:	00c6e7b3          	or	a5,a3,a2

0000a89c <.LVL153>:
    a89c:	00000713          	li	a4,0

0000a8a0 <.LVL154>:
    a8a0:	f8dff06f          	j	a82c <.L45>

0000a8a4 <.L38>:
    a8a4:	00000713          	li	a4,0
    a8a8:	00000693          	li	a3,0
    a8ac:	7ff00613          	li	a2,2047
    a8b0:	ed5ff06f          	j	a784 <.L20>

0000a8b4 <.L56>:
  FP_MUL_D (R, A, B);
    a8b4:	00080737          	lui	a4,0x80

0000a8b8 <.L81>:
  FP_PACK_D (r, R);
    a8b8:	7ff00613          	li	a2,2047
    a8bc:	00000593          	li	a1,0
    a8c0:	ec5ff06f          	j	a784 <.L20>

0000a8c4 <.L58>:
    a8c4:	00080737          	lui	a4,0x80
    a8c8:	00000693          	li	a3,0
    a8cc:	fedff06f          	j	a8b8 <.L81>

0000a8d0 <.L60>:
    a8d0:	00000713          	li	a4,0
    a8d4:	00000693          	li	a3,0
    a8d8:	f91ff06f          	j	a868 <.L82>

0000a8dc <.L62>:
    a8dc:	00000713          	li	a4,0

0000a8e0 <.LVL160>:
    a8e0:	00000693          	li	a3,0
    a8e4:	00100613          	li	a2,1
    a8e8:	e9dff06f          	j	a784 <.L20>

0000a8ec <__subdf3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
    a8ec:	00100837          	lui	a6,0x100
    a8f0:	fff80813          	add	a6,a6,-1 # fffff <_ebss+0xe9ccf>

0000a8f4 <.LBE2>:
{
    a8f4:	fe010113          	add	sp,sp,-32

0000a8f8 <.LBB3>:
  FP_UNPACK_SEMIRAW_D (A, a);
    a8f8:	00b878b3          	and	a7,a6,a1

0000a8fc <.LVL1>:
    a8fc:	0145d713          	srl	a4,a1,0x14

0000a900 <.LBE3>:
    a900:	01d55793          	srl	a5,a0,0x1d

0000a904 <.LBB5>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a904:	00d87833          	and	a6,a6,a3

0000a908 <.LBE5>:
{
    a908:	01212823          	sw	s2,16(sp)

0000a90c <.LBB6>:
  FP_UNPACK_SEMIRAW_D (A, a);
    a90c:	7ff77913          	and	s2,a4,2047

0000a910 <.LBE6>:
    a910:	00389713          	sll	a4,a7,0x3

0000a914 <.LBB8>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a914:	0146d893          	srl	a7,a3,0x14

0000a918 <.LBE8>:
{
    a918:	00912a23          	sw	s1,20(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
    a91c:	00e7e7b3          	or	a5,a5,a4

0000a920 <.LBB10>:
    a920:	01f5d493          	srl	s1,a1,0x1f

0000a924 <.LBE10>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a924:	01d65713          	srl	a4,a2,0x1d
    a928:	00381813          	sll	a6,a6,0x3
{
    a92c:	00112e23          	sw	ra,28(sp)
    a930:	00812c23          	sw	s0,24(sp)
    a934:	01312623          	sw	s3,12(sp)

0000a938 <.LBB13>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a938:	7ff8f893          	and	a7,a7,2047

0000a93c <.LBE13>:
  FP_SUB_D (R, A, B);
    a93c:	7ff00593          	li	a1,2047
  FP_UNPACK_SEMIRAW_D (A, a);
    a940:	00351513          	sll	a0,a0,0x3

0000a944 <.LBB15>:
  FP_UNPACK_SEMIRAW_D (B, b);
    a944:	01f6d693          	srl	a3,a3,0x1f

0000a948 <.LBE15>:
    a948:	01076733          	or	a4,a4,a6

0000a94c <.LVL7>:
    a94c:	00361613          	sll	a2,a2,0x3

0000a950 <.LVL8>:
  FP_SUB_D (R, A, B);
    a950:	00b89663          	bne	a7,a1,a95c <.L2>
    a954:	00c765b3          	or	a1,a4,a2
    a958:	00059463          	bnez	a1,a960 <.L3>

0000a95c <.L2>:
    a95c:	0016c693          	xor	a3,a3,1

0000a960 <.L3>:
    a960:	41190833          	sub	a6,s2,a7

0000a964 <.LBE17>:
    a964:	2a969a63          	bne	a3,s1,ac18 <.L4>

0000a968 <.LBB33>:
    a968:	11005c63          	blez	a6,aa80 <.L5>

0000a96c <.LVL11>:
    a96c:	04089063          	bnez	a7,a9ac <.L6>
    a970:	00c766b3          	or	a3,a4,a2

0000a974 <.LVL12>:
    a974:	66068063          	beqz	a3,afd4 <.L102>
    a978:	fff80593          	add	a1,a6,-1

0000a97c <.LVL13>:
    a97c:	02059063          	bnez	a1,a99c <.L8>

0000a980 <.L148>:
    a980:	00c50633          	add	a2,a0,a2

0000a984 <.LVL15>:
    a984:	00a636b3          	sltu	a3,a2,a0
    a988:	00e78733          	add	a4,a5,a4

0000a98c <.LVL16>:
    a98c:	00060513          	mv	a0,a2

0000a990 <.LVL17>:
    a990:	00d707b3          	add	a5,a4,a3

0000a994 <.LBE18>:
    a994:	00100913          	li	s2,1

0000a998 <.LVL19>:
    a998:	06c0006f          	j	aa04 <.L11>

0000a99c <.L8>:
    a99c:	7ff00693          	li	a3,2047
    a9a0:	02d81063          	bne	a6,a3,a9c0 <.L12>

0000a9a4 <.L112>:
    a9a4:	7ff00913          	li	s2,2047

0000a9a8 <.LVL22>:
    a9a8:	1f80006f          	j	aba0 <.L7>

0000a9ac <.L6>:
    a9ac:	7ff00693          	li	a3,2047

0000a9b0 <.LVL24>:
    a9b0:	1ed90863          	beq	s2,a3,aba0 <.L7>
    a9b4:	008006b7          	lui	a3,0x800
    a9b8:	00d76733          	or	a4,a4,a3
    a9bc:	00080593          	mv	a1,a6

0000a9c0 <.L12>:
    a9c0:	03800693          	li	a3,56
    a9c4:	0ab6c863          	blt	a3,a1,aa74 <.L13>
    a9c8:	01f00693          	li	a3,31
    a9cc:	06b6ca63          	blt	a3,a1,aa40 <.L14>
    a9d0:	02000813          	li	a6,32
    a9d4:	40b80833          	sub	a6,a6,a1
    a9d8:	010716b3          	sll	a3,a4,a6
    a9dc:	00b658b3          	srl	a7,a2,a1

0000a9e0 <.LVL27>:
    a9e0:	01061833          	sll	a6,a2,a6
    a9e4:	0116e6b3          	or	a3,a3,a7
    a9e8:	01003833          	snez	a6,a6
    a9ec:	0106e6b3          	or	a3,a3,a6

0000a9f0 <.LVL28>:
    a9f0:	00b755b3          	srl	a1,a4,a1

0000a9f4 <.L15>:
    a9f4:	00a68533          	add	a0,a3,a0

0000a9f8 <.LVL30>:
    a9f8:	00f585b3          	add	a1,a1,a5

0000a9fc <.LVL31>:
    a9fc:	00d536b3          	sltu	a3,a0,a3

0000aa00 <.LVL32>:
    aa00:	00d587b3          	add	a5,a1,a3

0000aa04 <.L11>:
    aa04:	00879713          	sll	a4,a5,0x8
    aa08:	18075c63          	bgez	a4,aba0 <.L7>

0000aa0c <.LVL34>:
    aa0c:	00190913          	add	s2,s2,1

0000aa10 <.LVL35>:
    aa10:	7ff00713          	li	a4,2047
    aa14:	5ae90a63          	beq	s2,a4,afc8 <.L155>
    aa18:	ff800737          	lui	a4,0xff800
    aa1c:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9ccf>
    aa20:	00e7f733          	and	a4,a5,a4
    aa24:	00155793          	srl	a5,a0,0x1

0000aa28 <.LVL36>:
    aa28:	00157513          	and	a0,a0,1
    aa2c:	00a7e7b3          	or	a5,a5,a0
    aa30:	01f71513          	sll	a0,a4,0x1f
    aa34:	00f56533          	or	a0,a0,a5
    aa38:	00175793          	srl	a5,a4,0x1
    aa3c:	1640006f          	j	aba0 <.L7>

0000aa40 <.L14>:
    aa40:	fe058693          	add	a3,a1,-32
    aa44:	02000893          	li	a7,32

0000aa48 <.LVL38>:
    aa48:	00d756b3          	srl	a3,a4,a3
    aa4c:	00000813          	li	a6,0
    aa50:	01158863          	beq	a1,a7,aa60 <.L16>
    aa54:	04000813          	li	a6,64
    aa58:	40b80833          	sub	a6,a6,a1
    aa5c:	01071833          	sll	a6,a4,a6

0000aa60 <.L16>:
    aa60:	00c86833          	or	a6,a6,a2
    aa64:	01003833          	snez	a6,a6
    aa68:	0106e6b3          	or	a3,a3,a6

0000aa6c <.L146>:
    aa6c:	00000593          	li	a1,0

0000aa70 <.LVL40>:
    aa70:	f85ff06f          	j	a9f4 <.L15>

0000aa74 <.L13>:
    aa74:	00c766b3          	or	a3,a4,a2
    aa78:	00d036b3          	snez	a3,a3
    aa7c:	ff1ff06f          	j	aa6c <.L146>

0000aa80 <.L5>:
    aa80:	0c080a63          	beqz	a6,ab54 <.L19>
    aa84:	412886b3          	sub	a3,a7,s2

0000aa88 <.LVL43>:
    aa88:	02091463          	bnez	s2,aab0 <.L20>
    aa8c:	00a7e5b3          	or	a1,a5,a0
    aa90:	50058e63          	beqz	a1,afac <.L93>
    aa94:	fff68593          	add	a1,a3,-1 # 7fffff <_ebss+0x7e9ccf>

0000aa98 <.LVL44>:
    aa98:	ee0584e3          	beqz	a1,a980 <.L148>
    aa9c:	7ff00813          	li	a6,2047
    aaa0:	03069263          	bne	a3,a6,aac4 <.L24>

0000aaa4 <.L98>:
    aaa4:	00070793          	mv	a5,a4

0000aaa8 <.LVL46>:
    aaa8:	00060513          	mv	a0,a2

0000aaac <.LVL47>:
    aaac:	ef9ff06f          	j	a9a4 <.L112>

0000aab0 <.L20>:
    aab0:	7ff00593          	li	a1,2047
    aab4:	feb888e3          	beq	a7,a1,aaa4 <.L98>
    aab8:	008005b7          	lui	a1,0x800
    aabc:	00b7e7b3          	or	a5,a5,a1
    aac0:	00068593          	mv	a1,a3

0000aac4 <.L24>:
    aac4:	03800693          	li	a3,56
    aac8:	08b6c063          	blt	a3,a1,ab48 <.L25>
    aacc:	01f00693          	li	a3,31
    aad0:	04b6c263          	blt	a3,a1,ab14 <.L26>
    aad4:	02000813          	li	a6,32
    aad8:	40b80833          	sub	a6,a6,a1
    aadc:	010796b3          	sll	a3,a5,a6
    aae0:	00b55333          	srl	t1,a0,a1
    aae4:	01051833          	sll	a6,a0,a6
    aae8:	0066e6b3          	or	a3,a3,t1
    aaec:	01003833          	snez	a6,a6
    aaf0:	0106e6b3          	or	a3,a3,a6

0000aaf4 <.LVL51>:
    aaf4:	00b7d5b3          	srl	a1,a5,a1

0000aaf8 <.L27>:
    aaf8:	00c68633          	add	a2,a3,a2

0000aafc <.LVL53>:
    aafc:	00e585b3          	add	a1,a1,a4

0000ab00 <.LVL54>:
    ab00:	00d636b3          	sltu	a3,a2,a3

0000ab04 <.LVL55>:
    ab04:	00060513          	mv	a0,a2

0000ab08 <.LVL56>:
    ab08:	00d587b3          	add	a5,a1,a3

0000ab0c <.LBE25>:
    ab0c:	00088913          	mv	s2,a7

0000ab10 <.LVL58>:
    ab10:	ef5ff06f          	j	aa04 <.L11>

0000ab14 <.L26>:
    ab14:	fe058693          	add	a3,a1,-32 # 7fffe0 <_ebss+0x7e9cb0>
    ab18:	02000313          	li	t1,32
    ab1c:	00d7d6b3          	srl	a3,a5,a3
    ab20:	00000813          	li	a6,0
    ab24:	00658863          	beq	a1,t1,ab34 <.L28>
    ab28:	04000813          	li	a6,64
    ab2c:	40b80833          	sub	a6,a6,a1
    ab30:	01079833          	sll	a6,a5,a6

0000ab34 <.L28>:
    ab34:	00a86833          	or	a6,a6,a0
    ab38:	01003833          	snez	a6,a6
    ab3c:	0106e6b3          	or	a3,a3,a6

0000ab40 <.L147>:
    ab40:	00000593          	li	a1,0

0000ab44 <.LVL61>:
    ab44:	fb5ff06f          	j	aaf8 <.L27>

0000ab48 <.L25>:
    ab48:	00a7e6b3          	or	a3,a5,a0
    ab4c:	00d036b3          	snez	a3,a3
    ab50:	ff1ff06f          	j	ab40 <.L147>

0000ab54 <.L19>:
    ab54:	00190693          	add	a3,s2,1

0000ab58 <.LVL64>:
    ab58:	7fe6f593          	and	a1,a3,2046
    ab5c:	08059663          	bnez	a1,abe8 <.L31>
    ab60:	00a7e6b3          	or	a3,a5,a0
    ab64:	06091263          	bnez	s2,abc8 <.L32>

0000ab68 <.LVL65>:
    ab68:	44068863          	beqz	a3,afb8 <.L97>
    ab6c:	00c766b3          	or	a3,a4,a2
    ab70:	02068863          	beqz	a3,aba0 <.L7>

0000ab74 <.LBB27>:
    ab74:	00c50633          	add	a2,a0,a2

0000ab78 <.LVL66>:
    ab78:	00a636b3          	sltu	a3,a2,a0
    ab7c:	00e78733          	add	a4,a5,a4

0000ab80 <.LVL67>:
    ab80:	00d707b3          	add	a5,a4,a3

0000ab84 <.LBE27>:
    ab84:	00879713          	sll	a4,a5,0x8

0000ab88 <.LBB28>:
    ab88:	00060513          	mv	a0,a2

0000ab8c <.LBE28>:
    ab8c:	00075a63          	bgez	a4,aba0 <.L7>
    ab90:	ff800737          	lui	a4,0xff800
    ab94:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9ccf>
    ab98:	00e7f7b3          	and	a5,a5,a4

0000ab9c <.LVL70>:
    ab9c:	00100913          	li	s2,1

0000aba0 <.L7>:
  FP_PACK_SEMIRAW_D (r, R);
    aba0:	00757713          	and	a4,a0,7
    aba4:	44070863          	beqz	a4,aff4 <.L85>
    aba8:	00f57713          	and	a4,a0,15
    abac:	00400693          	li	a3,4
    abb0:	44d70263          	beq	a4,a3,aff4 <.L85>

0000abb4 <.LBB62>:
    abb4:	00450713          	add	a4,a0,4
    abb8:	00a736b3          	sltu	a3,a4,a0
    abbc:	00d787b3          	add	a5,a5,a3

0000abc0 <.LVL72>:
    abc0:	00070513          	mv	a0,a4

0000abc4 <.LVL73>:
    abc4:	4300006f          	j	aff4 <.L85>

0000abc8 <.L32>:
  FP_SUB_D (R, A, B);
    abc8:	ec068ee3          	beqz	a3,aaa4 <.L98>
    abcc:	00c76633          	or	a2,a4,a2

0000abd0 <.LVL75>:
    abd0:	dc060ae3          	beqz	a2,a9a4 <.L112>

0000abd4 <.L111>:
    abd4:	00000493          	li	s1,0

0000abd8 <.LVL77>:
    abd8:	004007b7          	lui	a5,0x400

0000abdc <.LVL78>:
    abdc:	00000513          	li	a0,0

0000abe0 <.LVL79>:
    abe0:	7ff00913          	li	s2,2047

0000abe4 <.LVL80>:
    abe4:	4100006f          	j	aff4 <.L85>

0000abe8 <.L31>:
    abe8:	7ff00593          	li	a1,2047
    abec:	3cb68c63          	beq	a3,a1,afc4 <.L100>
    abf0:	00c50633          	add	a2,a0,a2

0000abf4 <.LBB31>:
    abf4:	00a63533          	sltu	a0,a2,a0

0000abf8 <.LVL83>:
    abf8:	00e78733          	add	a4,a5,a4

0000abfc <.LVL84>:
    abfc:	00a70733          	add	a4,a4,a0

0000ac00 <.LBE31>:
    ac00:	01f71513          	sll	a0,a4,0x1f
    ac04:	00165613          	srl	a2,a2,0x1

0000ac08 <.LVL85>:
    ac08:	00c56533          	or	a0,a0,a2
    ac0c:	00175793          	srl	a5,a4,0x1

0000ac10 <.L152>:
    ac10:	00068913          	mv	s2,a3

0000ac14 <.LVL87>:
    ac14:	f8dff06f          	j	aba0 <.L7>

0000ac18 <.L4>:
    ac18:	0f005c63          	blez	a6,ad10 <.L37>

0000ac1c <.LVL89>:
    ac1c:	08089e63          	bnez	a7,acb8 <.L38>
    ac20:	00c766b3          	or	a3,a4,a2

0000ac24 <.LVL90>:
    ac24:	3a068863          	beqz	a3,afd4 <.L102>
    ac28:	fff80693          	add	a3,a6,-1

0000ac2c <.LVL91>:
    ac2c:	02069063          	bnez	a3,ac4c <.L39>

0000ac30 <.LBB36>:
    ac30:	40c50633          	sub	a2,a0,a2

0000ac34 <.LVL92>:
    ac34:	00c536b3          	sltu	a3,a0,a2

0000ac38 <.LVL93>:
    ac38:	40e78733          	sub	a4,a5,a4

0000ac3c <.LVL94>:
    ac3c:	00060513          	mv	a0,a2

0000ac40 <.LVL95>:
    ac40:	40d707b3          	sub	a5,a4,a3

0000ac44 <.L151>:
    ac44:	00100913          	li	s2,1

0000ac48 <.LVL97>:
    ac48:	0540006f          	j	ac9c <.L42>

0000ac4c <.L39>:
    ac4c:	7ff00593          	li	a1,2047
    ac50:	d4b80ae3          	beq	a6,a1,a9a4 <.L112>

0000ac54 <.L43>:
    ac54:	03800593          	li	a1,56
    ac58:	0ad5c663          	blt	a1,a3,ad04 <.L44>
    ac5c:	01f00593          	li	a1,31
    ac60:	06d5c863          	blt	a1,a3,acd0 <.L45>
    ac64:	02000813          	li	a6,32
    ac68:	40d80833          	sub	a6,a6,a3
    ac6c:	00d658b3          	srl	a7,a2,a3

0000ac70 <.LVL100>:
    ac70:	010715b3          	sll	a1,a4,a6
    ac74:	01061833          	sll	a6,a2,a6
    ac78:	0115e5b3          	or	a1,a1,a7
    ac7c:	01003833          	snez	a6,a6
    ac80:	0105e633          	or	a2,a1,a6
    ac84:	00d756b3          	srl	a3,a4,a3

0000ac88 <.L46>:
    ac88:	40c50633          	sub	a2,a0,a2

0000ac8c <.LVL103>:
    ac8c:	00c53733          	sltu	a4,a0,a2
    ac90:	40d786b3          	sub	a3,a5,a3

0000ac94 <.LVL104>:
    ac94:	00060513          	mv	a0,a2

0000ac98 <.LVL105>:
    ac98:	40e687b3          	sub	a5,a3,a4

0000ac9c <.L42>:
    ac9c:	00879713          	sll	a4,a5,0x8
    aca0:	f00750e3          	bgez	a4,aba0 <.L7>

0000aca4 <.LBB39>:
    aca4:	00800437          	lui	s0,0x800
    aca8:	fff40413          	add	s0,s0,-1 # 7fffff <_ebss+0x7e9ccf>
    acac:	0087f433          	and	s0,a5,s0

0000acb0 <.LVL107>:
    acb0:	00050993          	mv	s3,a0
    acb4:	2100006f          	j	aec4 <.L76>

0000acb8 <.L38>:
    acb8:	7ff00693          	li	a3,2047

0000acbc <.LVL109>:
    acbc:	eed902e3          	beq	s2,a3,aba0 <.L7>
    acc0:	008006b7          	lui	a3,0x800
    acc4:	00d76733          	or	a4,a4,a3
    acc8:	00080693          	mv	a3,a6
    accc:	f89ff06f          	j	ac54 <.L43>

0000acd0 <.L45>:
    acd0:	fe068593          	add	a1,a3,-32 # 7fffe0 <_ebss+0x7e9cb0>
    acd4:	02000893          	li	a7,32

0000acd8 <.LVL112>:
    acd8:	00b755b3          	srl	a1,a4,a1
    acdc:	00000813          	li	a6,0
    ace0:	01168863          	beq	a3,a7,acf0 <.L47>
    ace4:	04000813          	li	a6,64
    ace8:	40d80833          	sub	a6,a6,a3
    acec:	01071833          	sll	a6,a4,a6

0000acf0 <.L47>:
    acf0:	00c86833          	or	a6,a6,a2
    acf4:	01003833          	snez	a6,a6
    acf8:	0105e633          	or	a2,a1,a6

0000acfc <.L149>:
    acfc:	00000693          	li	a3,0

0000ad00 <.LVL114>:
    ad00:	f89ff06f          	j	ac88 <.L46>

0000ad04 <.L44>:
    ad04:	00c76633          	or	a2,a4,a2

0000ad08 <.LVL116>:
    ad08:	00c03633          	snez	a2,a2
    ad0c:	ff1ff06f          	j	acfc <.L149>

0000ad10 <.L37>:
    ad10:	0e080863          	beqz	a6,ae00 <.L50>
    ad14:	41288833          	sub	a6,a7,s2

0000ad18 <.LVL118>:
    ad18:	04091263          	bnez	s2,ad5c <.L51>
    ad1c:	00a7e5b3          	or	a1,a5,a0
    ad20:	2a058e63          	beqz	a1,afdc <.L105>
    ad24:	fff80593          	add	a1,a6,-1

0000ad28 <.LVL119>:
    ad28:	00059e63          	bnez	a1,ad44 <.L52>

0000ad2c <.LBB45>:
    ad2c:	40a60533          	sub	a0,a2,a0

0000ad30 <.LVL121>:
    ad30:	40f70733          	sub	a4,a4,a5

0000ad34 <.LVL122>:
    ad34:	00a63633          	sltu	a2,a2,a0

0000ad38 <.LVL123>:
    ad38:	40c707b3          	sub	a5,a4,a2

0000ad3c <.LBE45>:
    ad3c:	00068493          	mv	s1,a3

0000ad40 <.LVL125>:
    ad40:	f05ff06f          	j	ac44 <.L151>

0000ad44 <.L52>:
    ad44:	7ff00313          	li	t1,2047
    ad48:	02681463          	bne	a6,t1,ad70 <.L55>

0000ad4c <.L107>:
    ad4c:	00070793          	mv	a5,a4

0000ad50 <.LVL128>:
    ad50:	00060513          	mv	a0,a2

0000ad54 <.LVL129>:
    ad54:	7ff00913          	li	s2,2047

0000ad58 <.LVL130>:
    ad58:	0d00006f          	j	ae28 <.L153>

0000ad5c <.L51>:
    ad5c:	7ff00593          	li	a1,2047
    ad60:	feb886e3          	beq	a7,a1,ad4c <.L107>
    ad64:	008005b7          	lui	a1,0x800
    ad68:	00b7e7b3          	or	a5,a5,a1
    ad6c:	00080593          	mv	a1,a6

0000ad70 <.L55>:
    ad70:	03800813          	li	a6,56
    ad74:	08b84063          	blt	a6,a1,adf4 <.L56>
    ad78:	01f00813          	li	a6,31
    ad7c:	04b84263          	blt	a6,a1,adc0 <.L57>
    ad80:	02000313          	li	t1,32
    ad84:	40b30333          	sub	t1,t1,a1
    ad88:	00b55e33          	srl	t3,a0,a1
    ad8c:	00679833          	sll	a6,a5,t1
    ad90:	00651333          	sll	t1,a0,t1
    ad94:	01c86833          	or	a6,a6,t3
    ad98:	00603333          	snez	t1,t1
    ad9c:	00686533          	or	a0,a6,t1
    ada0:	00b7d5b3          	srl	a1,a5,a1

0000ada4 <.L58>:
    ada4:	40a60533          	sub	a0,a2,a0

0000ada8 <.LVL136>:
    ada8:	40b705b3          	sub	a1,a4,a1

0000adac <.LVL137>:
    adac:	00a63633          	sltu	a2,a2,a0

0000adb0 <.LVL138>:
    adb0:	40c587b3          	sub	a5,a1,a2

0000adb4 <.LBE47>:
    adb4:	00088913          	mv	s2,a7

0000adb8 <.LVL140>:
    adb8:	00068493          	mv	s1,a3

0000adbc <.LVL141>:
    adbc:	ee1ff06f          	j	ac9c <.L42>

0000adc0 <.L57>:
    adc0:	fe058813          	add	a6,a1,-32 # 7fffe0 <_ebss+0x7e9cb0>
    adc4:	02000e13          	li	t3,32
    adc8:	0107d833          	srl	a6,a5,a6
    adcc:	00000313          	li	t1,0
    add0:	01c58863          	beq	a1,t3,ade0 <.L59>
    add4:	04000313          	li	t1,64
    add8:	40b30333          	sub	t1,t1,a1
    addc:	00679333          	sll	t1,a5,t1

0000ade0 <.L59>:
    ade0:	00a36333          	or	t1,t1,a0
    ade4:	00603333          	snez	t1,t1
    ade8:	00686533          	or	a0,a6,t1

0000adec <.L150>:
    adec:	00000593          	li	a1,0

0000adf0 <.LVL144>:
    adf0:	fb5ff06f          	j	ada4 <.L58>

0000adf4 <.L56>:
    adf4:	00a7e533          	or	a0,a5,a0

0000adf8 <.LVL146>:
    adf8:	00a03533          	snez	a0,a0
    adfc:	ff1ff06f          	j	adec <.L150>

0000ae00 <.L50>:
    ae00:	00190593          	add	a1,s2,1
    ae04:	7fe5f593          	and	a1,a1,2046
    ae08:	08059663          	bnez	a1,ae94 <.L62>

0000ae0c <.LBE69>:
    ae0c:	00c765b3          	or	a1,a4,a2

0000ae10 <.LBB70>:
    ae10:	00a7e833          	or	a6,a5,a0

0000ae14 <.LBB71>:
    ae14:	06091063          	bnez	s2,ae74 <.L63>

0000ae18 <.LVL148>:
    ae18:	00081c63          	bnez	a6,ae30 <.L64>

0000ae1c <.LVL149>:
    ae1c:	10058e63          	beqz	a1,af38 <.L156>
    ae20:	00070793          	mv	a5,a4

0000ae24 <.LVL150>:
    ae24:	00060513          	mv	a0,a2

0000ae28 <.L153>:
    ae28:	00068493          	mv	s1,a3

0000ae2c <.LVL152>:
    ae2c:	d75ff06f          	j	aba0 <.L7>

0000ae30 <.L64>:
    ae30:	d60588e3          	beqz	a1,aba0 <.L7>

0000ae34 <.LBB49>:
    ae34:	40c50833          	sub	a6,a0,a2

0000ae38 <.LVL154>:
    ae38:	010538b3          	sltu	a7,a0,a6

0000ae3c <.LVL155>:
    ae3c:	40e785b3          	sub	a1,a5,a4
    ae40:	411585b3          	sub	a1,a1,a7

0000ae44 <.LBE49>:
    ae44:	00859893          	sll	a7,a1,0x8
    ae48:	0008dc63          	bgez	a7,ae60 <.L67>

0000ae4c <.LBB50>:
    ae4c:	40a60533          	sub	a0,a2,a0

0000ae50 <.LVL158>:
    ae50:	40f70733          	sub	a4,a4,a5

0000ae54 <.LVL159>:
    ae54:	00a63633          	sltu	a2,a2,a0

0000ae58 <.LVL160>:
    ae58:	40c707b3          	sub	a5,a4,a2

0000ae5c <.LBE50>:
    ae5c:	fcdff06f          	j	ae28 <.L153>

0000ae60 <.L67>:
    ae60:	00b86533          	or	a0,a6,a1

0000ae64 <.LVL163>:
    ae64:	18050463          	beqz	a0,afec <.L110>

0000ae68 <.LBB51>:
    ae68:	00058793          	mv	a5,a1

0000ae6c <.LVL164>:
    ae6c:	00080513          	mv	a0,a6
    ae70:	d31ff06f          	j	aba0 <.L7>

0000ae74 <.L63>:
    ae74:	00081c63          	bnez	a6,ae8c <.L70>
    ae78:	d4058ee3          	beqz	a1,abd4 <.L111>
    ae7c:	00070793          	mv	a5,a4

0000ae80 <.LVL166>:
    ae80:	00060513          	mv	a0,a2

0000ae84 <.LVL167>:
    ae84:	00068493          	mv	s1,a3

0000ae88 <.LVL168>:
    ae88:	b1dff06f          	j	a9a4 <.L112>

0000ae8c <.L70>:
    ae8c:	b0058ce3          	beqz	a1,a9a4 <.L112>
    ae90:	d45ff06f          	j	abd4 <.L111>

0000ae94 <.L62>:
    ae94:	40c505b3          	sub	a1,a0,a2
    ae98:	00b53833          	sltu	a6,a0,a1
    ae9c:	40e78433          	sub	s0,a5,a4
    aea0:	41040433          	sub	s0,s0,a6

0000aea4 <.LBE52>:
    aea4:	00841813          	sll	a6,s0,0x8

0000aea8 <.LBB53>:
    aea8:	00058993          	mv	s3,a1

0000aeac <.LBE53>:
    aeac:	08085063          	bgez	a6,af2c <.L73>

0000aeb0 <.LBB54>:
    aeb0:	40a609b3          	sub	s3,a2,a0

0000aeb4 <.LVL173>:
    aeb4:	40f70433          	sub	s0,a4,a5

0000aeb8 <.LVL174>:
    aeb8:	01363633          	sltu	a2,a2,s3

0000aebc <.LVL175>:
    aebc:	40c40433          	sub	s0,s0,a2

0000aec0 <.LBE54>:
    aec0:	00068493          	mv	s1,a3

0000aec4 <.L76>:
    aec4:	06040e63          	beqz	s0,af40 <.L77>
    aec8:	00040513          	mv	a0,s0
    aecc:	f48f60ef          	jal	1614 <__clzsi2>

0000aed0 <.LVL178>:
    aed0:	ff850693          	add	a3,a0,-8

0000aed4 <.L78>:
    aed4:	02000793          	li	a5,32
    aed8:	40d787b3          	sub	a5,a5,a3
    aedc:	00d41433          	sll	s0,s0,a3

0000aee0 <.LVL180>:
    aee0:	00f9d7b3          	srl	a5,s3,a5
    aee4:	0087e7b3          	or	a5,a5,s0

0000aee8 <.LVL181>:
    aee8:	00d99433          	sll	s0,s3,a3

0000aeec <.L80>:
    aeec:	0b26c463          	blt	a3,s2,af94 <.L81>
    aef0:	412686b3          	sub	a3,a3,s2

0000aef4 <.LVL183>:
    aef4:	00168613          	add	a2,a3,1

0000aef8 <.LVL184>:
    aef8:	01f00713          	li	a4,31
    aefc:	06c74263          	blt	a4,a2,af60 <.L82>
    af00:	02000713          	li	a4,32
    af04:	40c70733          	sub	a4,a4,a2
    af08:	00e79533          	sll	a0,a5,a4
    af0c:	00c456b3          	srl	a3,s0,a2
    af10:	00e41733          	sll	a4,s0,a4
    af14:	00d56533          	or	a0,a0,a3
    af18:	00e03733          	snez	a4,a4
    af1c:	00e56533          	or	a0,a0,a4

0000af20 <.LVL185>:
    af20:	00c7d7b3          	srl	a5,a5,a2

0000af24 <.L154>:
    af24:	00000913          	li	s2,0

0000af28 <.LVL187>:
    af28:	c79ff06f          	j	aba0 <.L7>

0000af2c <.L73>:
    af2c:	0085e5b3          	or	a1,a1,s0

0000af30 <.LVL189>:
    af30:	f8059ae3          	bnez	a1,aec4 <.L76>
    af34:	00000913          	li	s2,0

0000af38 <.L156>:
    af38:	00000493          	li	s1,0

0000af3c <.LVL191>:
    af3c:	08c0006f          	j	afc8 <.L155>

0000af40 <.L77>:
    af40:	00098513          	mv	a0,s3
    af44:	ed0f60ef          	jal	1614 <__clzsi2>

0000af48 <.LVL193>:
    af48:	01850693          	add	a3,a0,24

0000af4c <.LVL194>:
    af4c:	01f00793          	li	a5,31
    af50:	f8d7d2e3          	bge	a5,a3,aed4 <.L78>
    af54:	ff850793          	add	a5,a0,-8
    af58:	00f997b3          	sll	a5,s3,a5

0000af5c <.LVL195>:
    af5c:	f91ff06f          	j	aeec <.L80>

0000af60 <.L82>:
    af60:	fe168693          	add	a3,a3,-31
    af64:	00d7d533          	srl	a0,a5,a3
    af68:	02000693          	li	a3,32
    af6c:	00000713          	li	a4,0
    af70:	00d60863          	beq	a2,a3,af80 <.L83>
    af74:	04000713          	li	a4,64
    af78:	40c70733          	sub	a4,a4,a2
    af7c:	00e79733          	sll	a4,a5,a4

0000af80 <.L83>:
    af80:	00e46733          	or	a4,s0,a4
    af84:	00e03733          	snez	a4,a4
    af88:	00e56533          	or	a0,a0,a4

0000af8c <.LVL197>:
    af8c:	00000793          	li	a5,0
    af90:	f95ff06f          	j	af24 <.L154>

0000af94 <.L81>:
    af94:	ff800737          	lui	a4,0xff800
    af98:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9ccf>
    af9c:	40d90933          	sub	s2,s2,a3
    afa0:	00e7f7b3          	and	a5,a5,a4
    afa4:	00040513          	mv	a0,s0
    afa8:	bf9ff06f          	j	aba0 <.L7>

0000afac <.L93>:
    afac:	00070793          	mv	a5,a4

0000afb0 <.LVL202>:
    afb0:	00060513          	mv	a0,a2

0000afb4 <.LVL203>:
    afb4:	c5dff06f          	j	ac10 <.L152>

0000afb8 <.L97>:
    afb8:	00070793          	mv	a5,a4

0000afbc <.LVL205>:
    afbc:	00060513          	mv	a0,a2

0000afc0 <.LVL206>:
    afc0:	be1ff06f          	j	aba0 <.L7>

0000afc4 <.L100>:
    afc4:	7ff00913          	li	s2,2047

0000afc8 <.L155>:
    afc8:	00000793          	li	a5,0
    afcc:	00000513          	li	a0,0
    afd0:	0240006f          	j	aff4 <.L85>

0000afd4 <.L102>:
    afd4:	00080913          	mv	s2,a6

0000afd8 <.LVL210>:
    afd8:	bc9ff06f          	j	aba0 <.L7>

0000afdc <.L105>:
    afdc:	00070793          	mv	a5,a4

0000afe0 <.LVL212>:
    afe0:	00060513          	mv	a0,a2

0000afe4 <.LVL213>:
    afe4:	00080913          	mv	s2,a6

0000afe8 <.LVL214>:
    afe8:	e41ff06f          	j	ae28 <.L153>

0000afec <.L110>:
    afec:	00000793          	li	a5,0

0000aff0 <.LBE58>:
    aff0:	00000493          	li	s1,0

0000aff4 <.L85>:
  FP_PACK_SEMIRAW_D (r, R);
    aff4:	00879713          	sll	a4,a5,0x8
    aff8:	00075e63          	bgez	a4,b014 <.L88>

0000affc <.LVL218>:
    affc:	00190913          	add	s2,s2,1

0000b000 <.LVL219>:
    b000:	7ff00713          	li	a4,2047
    b004:	08e90263          	beq	s2,a4,b088 <.L115>
    b008:	ff800737          	lui	a4,0xff800
    b00c:	fff70713          	add	a4,a4,-1 # ff7fffff <_ebss+0xff7e9ccf>
    b010:	00e7f7b3          	and	a5,a5,a4

0000b014 <.L88>:
    b014:	01d79693          	sll	a3,a5,0x1d
    b018:	00355513          	srl	a0,a0,0x3

0000b01c <.LVL221>:
    b01c:	7ff00713          	li	a4,2047
    b020:	00a6e6b3          	or	a3,a3,a0

0000b024 <.LVL222>:
    b024:	0037d793          	srl	a5,a5,0x3
    b028:	00e91e63          	bne	s2,a4,b044 <.L89>

0000b02c <.LVL224>:
    b02c:	00f6e6b3          	or	a3,a3,a5

0000b030 <.LVL225>:
    b030:	00000793          	li	a5,0

0000b034 <.LVL226>:
    b034:	00068863          	beqz	a3,b044 <.L89>
    b038:	000807b7          	lui	a5,0x80
    b03c:	00000693          	li	a3,0
    b040:	00000493          	li	s1,0

0000b044 <.L89>:
    b044:	01491713          	sll	a4,s2,0x14
    b048:	7ff00637          	lui	a2,0x7ff00
    b04c:	00c79793          	sll	a5,a5,0xc

0000b050 <.LVL228>:
    b050:	00c77733          	and	a4,a4,a2

0000b054 <.LBE75>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    b054:	01c12083          	lw	ra,28(sp)
    b058:	01812403          	lw	s0,24(sp)

0000b05c <.LBB76>:
  FP_PACK_SEMIRAW_D (r, R);
    b05c:	00c7d793          	srl	a5,a5,0xc
    b060:	00f767b3          	or	a5,a4,a5
    b064:	01f49713          	sll	a4,s1,0x1f
    b068:	00e7e633          	or	a2,a5,a4

0000b06c <.LBE76>:
}
    b06c:	01412483          	lw	s1,20(sp)

0000b070 <.LVL230>:
    b070:	01012903          	lw	s2,16(sp)
    b074:	00c12983          	lw	s3,12(sp)
    b078:	00068513          	mv	a0,a3
    b07c:	00060593          	mv	a1,a2
    b080:	02010113          	add	sp,sp,32
    b084:	00008067          	ret

0000b088 <.L115>:
    b088:	00000793          	li	a5,0

0000b08c <.LVL232>:
    b08c:	00000513          	li	a0,0

0000b090 <.LVL233>:
    b090:	f85ff06f          	j	b014 <.L88>

0000b094 <__fixdfsi>:
  FP_DECL_EX;
  FP_DECL_D (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    b094:	0145d713          	srl	a4,a1,0x14
    b098:	001006b7          	lui	a3,0x100
    b09c:	fff68793          	add	a5,a3,-1 # fffff <_ebss+0xe9ccf>
    b0a0:	7ff77713          	and	a4,a4,2047

0000b0a4 <.LBE2>:
  FP_TO_INT_D (r, A, SI_BITS, 1);
    b0a4:	3fe00613          	li	a2,1022

0000b0a8 <.LBB3>:
  FP_UNPACK_RAW_D (A, a);
    b0a8:	00b7f7b3          	and	a5,a5,a1

0000b0ac <.LVL1>:
    b0ac:	01f5d593          	srl	a1,a1,0x1f

0000b0b0 <.LBE3>:
  FP_TO_INT_D (r, A, SI_BITS, 1);
    b0b0:	04e65e63          	bge	a2,a4,b10c <.L6>
    b0b4:	41d00613          	li	a2,1053
    b0b8:	00e65a63          	bge	a2,a4,b0cc <.L3>

0000b0bc <.LVL3>:
    b0bc:	80000537          	lui	a0,0x80000

0000b0c0 <.LVL4>:
    b0c0:	fff50513          	add	a0,a0,-1 # 7fffffff <_ebss+0x7ffe9ccf>
    b0c4:	00a58533          	add	a0,a1,a0
    b0c8:	00008067          	ret

0000b0cc <.L3>:
    b0cc:	00d7e7b3          	or	a5,a5,a3
    b0d0:	43300693          	li	a3,1075
    b0d4:	40e686b3          	sub	a3,a3,a4
    b0d8:	01f00613          	li	a2,31
    b0dc:	02d64063          	blt	a2,a3,b0fc <.L4>

0000b0e0 <.LVL7>:
    b0e0:	bed70713          	add	a4,a4,-1043

0000b0e4 <.LVL8>:
    b0e4:	00e797b3          	sll	a5,a5,a4

0000b0e8 <.LVL9>:
    b0e8:	00d55533          	srl	a0,a0,a3

0000b0ec <.LVL10>:
    b0ec:	00a7e533          	or	a0,a5,a0

0000b0f0 <.L5>:
    b0f0:	02058063          	beqz	a1,b110 <.L2>
    b0f4:	40a00533          	neg	a0,a0

0000b0f8 <.LVL12>:
    b0f8:	00008067          	ret

0000b0fc <.L4>:
    b0fc:	41300693          	li	a3,1043
    b100:	40e68733          	sub	a4,a3,a4

0000b104 <.LVL14>:
    b104:	00e7d533          	srl	a0,a5,a4

0000b108 <.LVL15>:
    b108:	fe9ff06f          	j	b0f0 <.L5>

0000b10c <.L6>:
    b10c:	00000513          	li	a0,0

0000b110 <.L2>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    b110:	00008067          	ret

0000b114 <__floatsidf>:
#include "soft-fp.h"
#include "double.h"

DFtype
__floatsidf (SItype i)
{
    b114:	ff010113          	add	sp,sp,-16
    b118:	00112623          	sw	ra,12(sp)
    b11c:	00812423          	sw	s0,8(sp)
    b120:	00912223          	sw	s1,4(sp)

0000b124 <.LBB9>:
  FP_DECL_D (A);
  DFtype a;

  FP_FROM_INT_D (A, i, SI_BITS, USItype);
    b124:	08050663          	beqz	a0,b1b0 <.L5>

0000b128 <.LBB3>:
    b128:	41f55793          	sra	a5,a0,0x1f
    b12c:	00a7c433          	xor	s0,a5,a0
    b130:	40f40433          	sub	s0,s0,a5
    b134:	01f55493          	srl	s1,a0,0x1f

0000b138 <.LBB4>:
    b138:	00040513          	mv	a0,s0

0000b13c <.LVL3>:
    b13c:	cd8f60ef          	jal	1614 <__clzsi2>

0000b140 <.LVL4>:
    b140:	41e00713          	li	a4,1054

0000b144 <.LBE4>:
    b144:	00a00793          	li	a5,10

0000b148 <.LBB5>:
    b148:	40a70733          	sub	a4,a4,a0

0000b14c <.LBE5>:
    b14c:	04a7c863          	blt	a5,a0,b19c <.L4>
    b150:	00b00793          	li	a5,11
    b154:	40a787b3          	sub	a5,a5,a0
    b158:	01550513          	add	a0,a0,21

0000b15c <.LVL6>:
    b15c:	00f457b3          	srl	a5,s0,a5

0000b160 <.LVL7>:
    b160:	00a41433          	sll	s0,s0,a0

0000b164 <.LVL8>:
    b164:	00048513          	mv	a0,s1

0000b168 <.L2>:
  FP_PACK_RAW_D (a, A);
    b168:	00c79793          	sll	a5,a5,0xc

0000b16c <.LVL10>:
    b16c:	00c7d793          	srl	a5,a5,0xc
    b170:	01471713          	sll	a4,a4,0x14

0000b174 <.LVL11>:
    b174:	01f51513          	sll	a0,a0,0x1f

0000b178 <.LVL12>:
    b178:	00f76733          	or	a4,a4,a5

0000b17c <.LBE10>:

  return a;
}
    b17c:	00c12083          	lw	ra,12(sp)

0000b180 <.LBB11>:
  FP_PACK_RAW_D (a, A);
    b180:	00a767b3          	or	a5,a4,a0

0000b184 <.LBE11>:
}
    b184:	00040513          	mv	a0,s0
    b188:	00812403          	lw	s0,8(sp)

0000b18c <.LVL14>:
    b18c:	00412483          	lw	s1,4(sp)
    b190:	00078593          	mv	a1,a5
    b194:	01010113          	add	sp,sp,16
    b198:	00008067          	ret

0000b19c <.L4>:
  FP_FROM_INT_D (A, i, SI_BITS, USItype);
    b19c:	ff550513          	add	a0,a0,-11

0000b1a0 <.LVL16>:
    b1a0:	00a417b3          	sll	a5,s0,a0

0000b1a4 <.LVL17>:
    b1a4:	00048513          	mv	a0,s1

0000b1a8 <.L7>:
    b1a8:	00000413          	li	s0,0
    b1ac:	fbdff06f          	j	b168 <.L2>

0000b1b0 <.L5>:
    b1b0:	00000713          	li	a4,0
    b1b4:	00000793          	li	a5,0
    b1b8:	ff1ff06f          	j	b1a8 <.L7>

0000b1bc <__divtf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__divtf3 (TFtype a, TFtype b)
{
    b1bc:	f5010113          	add	sp,sp,-176
    b1c0:	09312e23          	sw	s3,156(sp)
    b1c4:	00c5a983          	lw	s3,12(a1)
    b1c8:	0045a783          	lw	a5,4(a1)
    b1cc:	0085a803          	lw	a6,8(a1)
    b1d0:	0a812423          	sw	s0,168(sp)
    b1d4:	00050413          	mv	s0,a0
    b1d8:	0005a503          	lw	a0,0(a1)

0000b1dc <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_Q (A, a);
    b1dc:	01099713          	sll	a4,s3,0x10

0000b1e0 <.LBE3>:
{
    b1e0:	0b212023          	sw	s2,160(sp)
    b1e4:	09512a23          	sw	s5,148(sp)
    b1e8:	00462903          	lw	s2,4(a2) # 7ff00004 <_ebss+0x7fee9cd4>
    b1ec:	00c62a83          	lw	s5,12(a2)
    b1f0:	09612823          	sw	s6,144(sp)
    b1f4:	09712623          	sw	s7,140(sp)
    b1f8:	00862b03          	lw	s6,8(a2)
    b1fc:	00062b83          	lw	s7,0(a2)

0000b200 <.LBB4>:
  FP_UNPACK_Q (A, a);
    b200:	00008637          	lui	a2,0x8

0000b204 <.LBE4>:
{
    b204:	0a912223          	sw	s1,164(sp)

0000b208 <.LBB5>:
  FP_UNPACK_Q (A, a);
    b208:	01075713          	srl	a4,a4,0x10
    b20c:	0109d493          	srl	s1,s3,0x10
    b210:	fff60613          	add	a2,a2,-1 # 7fff <.L2+0x7b>
    b214:	07312623          	sw	s3,108(sp)

0000b218 <.LBE5>:
{
    b218:	0a112623          	sw	ra,172(sp)
    b21c:	09412c23          	sw	s4,152(sp)
    b220:	09812423          	sw	s8,136(sp)
    b224:	09912223          	sw	s9,132(sp)
    b228:	09a12023          	sw	s10,128(sp)
    b22c:	07b12e23          	sw	s11,124(sp)

0000b230 <.LBB6>:
  FP_UNPACK_Q (A, a);
    b230:	06a12023          	sw	a0,96(sp)
    b234:	06f12223          	sw	a5,100(sp)
    b238:	07012423          	sw	a6,104(sp)
    b23c:	02a12823          	sw	a0,48(sp)
    b240:	02f12a23          	sw	a5,52(sp)
    b244:	03012c23          	sw	a6,56(sp)
    b248:	02e12e23          	sw	a4,60(sp)
    b24c:	00c4f6b3          	and	a3,s1,a2

0000b250 <.LVL2>:
    b250:	01f9d993          	srl	s3,s3,0x1f

0000b254 <.LBE6>:
    b254:	10068e63          	beqz	a3,b370 <.L2>
    b258:	24c68863          	beq	a3,a2,b4a8 <.L3>
    b25c:	000107b7          	lui	a5,0x10
    b260:	00f76733          	or	a4,a4,a5
    b264:	02e12e23          	sw	a4,60(sp)

0000b268 <.LBB7>:
    b268:	03010593          	add	a1,sp,48
    b26c:	03c10793          	add	a5,sp,60

0000b270 <.L4>:
    b270:	0007a703          	lw	a4,0(a5) # 10000 <.LBE204>
    b274:	ffc7a603          	lw	a2,-4(a5)
    b278:	ffc78793          	add	a5,a5,-4
    b27c:	00371713          	sll	a4,a4,0x3
    b280:	01d65613          	srl	a2,a2,0x1d
    b284:	00c76733          	or	a4,a4,a2
    b288:	00e7a223          	sw	a4,4(a5)
    b28c:	fef592e3          	bne	a1,a5,b270 <.L4>

0000b290 <.LBE7>:
    b290:	ffffc7b7          	lui	a5,0xffffc

0000b294 <.LBB8>:
    b294:	00351513          	sll	a0,a0,0x3

0000b298 <.LBE8>:
    b298:	00178793          	add	a5,a5,1 # ffffc001 <_ebss+0xfffe5cd1>

0000b29c <.LBB9>:
    b29c:	02a12823          	sw	a0,48(sp)

0000b2a0 <.LBE9>:
    b2a0:	00f684b3          	add	s1,a3,a5

0000b2a4 <.L193>:
    b2a4:	00000a13          	li	s4,0

0000b2a8 <.L5>:
  FP_UNPACK_Q (B, b);
    b2a8:	010a9513          	sll	a0,s5,0x10
    b2ac:	00008737          	lui	a4,0x8
    b2b0:	010ad793          	srl	a5,s5,0x10
    b2b4:	01055513          	srl	a0,a0,0x10
    b2b8:	fff70713          	add	a4,a4,-1 # 7fff <.L2+0x7b>
    b2bc:	07512623          	sw	s5,108(sp)
    b2c0:	07712023          	sw	s7,96(sp)
    b2c4:	07212223          	sw	s2,100(sp)
    b2c8:	07612423          	sw	s6,104(sp)
    b2cc:	05712023          	sw	s7,64(sp)
    b2d0:	05212223          	sw	s2,68(sp)
    b2d4:	05612423          	sw	s6,72(sp)
    b2d8:	04a12623          	sw	a0,76(sp)
    b2dc:	00e7f7b3          	and	a5,a5,a4

0000b2e0 <.LVL9>:
    b2e0:	01fada93          	srl	s5,s5,0x1f

0000b2e4 <.LBE13>:
    b2e4:	1e078863          	beqz	a5,b4d4 <.L18>
    b2e8:	32e78263          	beq	a5,a4,b60c <.L19>
    b2ec:	00010737          	lui	a4,0x10
    b2f0:	00e56533          	or	a0,a0,a4
    b2f4:	04a12623          	sw	a0,76(sp)

0000b2f8 <.LBB14>:
    b2f8:	04010593          	add	a1,sp,64
    b2fc:	04c10713          	add	a4,sp,76

0000b300 <.L20>:
    b300:	00072683          	lw	a3,0(a4) # 10000 <.LBE204>
    b304:	ffc72603          	lw	a2,-4(a4)
    b308:	ffc70713          	add	a4,a4,-4
    b30c:	00369693          	sll	a3,a3,0x3
    b310:	01d65613          	srl	a2,a2,0x1d
    b314:	00c6e6b3          	or	a3,a3,a2
    b318:	00d72223          	sw	a3,4(a4)
    b31c:	fee592e3          	bne	a1,a4,b300 <.L20>

0000b320 <.LBE14>:
    b320:	ffffc737          	lui	a4,0xffffc

0000b324 <.LBB15>:
    b324:	003b9b93          	sll	s7,s7,0x3

0000b328 <.LBE15>:
    b328:	00170713          	add	a4,a4,1 # ffffc001 <_ebss+0xfffe5cd1>

0000b32c <.LBB16>:
    b32c:	05712023          	sw	s7,64(sp)

0000b330 <.LBE16>:
    b330:	00e787b3          	add	a5,a5,a4

0000b334 <.L194>:
    b334:	00000713          	li	a4,0

0000b338 <.L21>:
  FP_DIV_Q (R, A, B);
    b338:	40f486b3          	sub	a3,s1,a5
    b33c:	002a1793          	sll	a5,s4,0x2

0000b340 <.LVL16>:
    b340:	00e7e7b3          	or	a5,a5,a4
    b344:	fff78793          	add	a5,a5,-1
    b348:	00e00613          	li	a2,14
    b34c:	0159c933          	xor	s2,s3,s5

0000b350 <.LVL17>:
    b350:	2ef66263          	bltu	a2,a5,b634 <.L34>
    b354:	00007617          	auipc	a2,0x7
    b358:	b0860613          	add	a2,a2,-1272 # 11e5c <.L36>
    b35c:	00279793          	sll	a5,a5,0x2
    b360:	00c787b3          	add	a5,a5,a2
    b364:	0007a783          	lw	a5,0(a5)
    b368:	00c787b3          	add	a5,a5,a2
    b36c:	00078067          	jr	a5

0000b370 <.L2>:
  FP_UNPACK_Q (A, a);
    b370:	00a7e6b3          	or	a3,a5,a0

0000b374 <.LVL19>:
    b374:	0106e6b3          	or	a3,a3,a6
    b378:	00e6e6b3          	or	a3,a3,a4
    b37c:	14068663          	beqz	a3,b4c8 <.L145>

0000b380 <.LBB20>:
    b380:	0a070063          	beqz	a4,b420 <.L6>
    b384:	00070513          	mv	a0,a4
    b388:	a8cf60ef          	jal	1614 <__clzsi2>

0000b38c <.L7>:
    b38c:	ff450713          	add	a4,a0,-12
    b390:	40575593          	sra	a1,a4,0x5

0000b394 <.LVL21>:
    b394:	01f77713          	and	a4,a4,31

0000b398 <.LVL22>:
    b398:	0a070e63          	beqz	a4,b454 <.L10>
    b39c:	ffc00693          	li	a3,-4
    b3a0:	02d586b3          	mul	a3,a1,a3
    b3a4:	02000813          	li	a6,32
    b3a8:	03010313          	add	t1,sp,48
    b3ac:	40e80833          	sub	a6,a6,a4

0000b3b0 <.LVL23>:
    b3b0:	00c68793          	add	a5,a3,12
    b3b4:	00f307b3          	add	a5,t1,a5
    b3b8:	40d006b3          	neg	a3,a3

0000b3bc <.L11>:
    b3bc:	0cf31463          	bne	t1,a5,b484 <.L14>
    b3c0:	fff58793          	add	a5,a1,-1

0000b3c4 <.LVL24>:
    b3c4:	00259593          	sll	a1,a1,0x2

0000b3c8 <.LVL25>:
    b3c8:	04058693          	add	a3,a1,64
    b3cc:	03010613          	add	a2,sp,48
    b3d0:	00c685b3          	add	a1,a3,a2
    b3d4:	03012683          	lw	a3,48(sp)
    b3d8:	00e69733          	sll	a4,a3,a4

0000b3dc <.LVL26>:
    b3dc:	fce5a023          	sw	a4,-64(a1)

0000b3e0 <.L15>:
    b3e0:	00178793          	add	a5,a5,1
    b3e4:	00279793          	sll	a5,a5,0x2
    b3e8:	00800693          	li	a3,8
    b3ec:	03010713          	add	a4,sp,48
    b3f0:	00d7ea63          	bltu	a5,a3,b404 <.L16>
    b3f4:	02012823          	sw	zero,48(sp)
    b3f8:	00072223          	sw	zero,4(a4)
    b3fc:	ff878793          	add	a5,a5,-8
    b400:	03810713          	add	a4,sp,56

0000b404 <.L16>:
    b404:	00400693          	li	a3,4
    b408:	00d7e463          	bltu	a5,a3,b410 <.L17>
    b40c:	00072023          	sw	zero,0(a4)

0000b410 <.L17>:
    b410:	ffffc6b7          	lui	a3,0xffffc
    b414:	01168693          	add	a3,a3,17 # ffffc011 <_ebss+0xfffe5ce1>
    b418:	40a684b3          	sub	s1,a3,a0

0000b41c <.LVL28>:
    b41c:	e89ff06f          	j	b2a4 <.L193>

0000b420 <.L6>:
    b420:	00080a63          	beqz	a6,b434 <.L8>
    b424:	00080513          	mv	a0,a6
    b428:	9ecf60ef          	jal	1614 <__clzsi2>

0000b42c <.LVL30>:
    b42c:	02050513          	add	a0,a0,32
    b430:	f5dff06f          	j	b38c <.L7>

0000b434 <.L8>:
    b434:	00078a63          	beqz	a5,b448 <.L9>
    b438:	00078513          	mv	a0,a5
    b43c:	9d8f60ef          	jal	1614 <__clzsi2>

0000b440 <.LVL33>:
    b440:	04050513          	add	a0,a0,64
    b444:	f49ff06f          	j	b38c <.L7>

0000b448 <.L9>:
    b448:	9ccf60ef          	jal	1614 <__clzsi2>

0000b44c <.LVL36>:
    b44c:	06050513          	add	a0,a0,96
    b450:	f3dff06f          	j	b38c <.L7>

0000b454 <.L10>:
    b454:	ffc00693          	li	a3,-4
    b458:	02d586b3          	mul	a3,a1,a3
    b45c:	03c10793          	add	a5,sp,60

0000b460 <.LBB12>:
    b460:	00300713          	li	a4,3

0000b464 <.L12>:
    b464:	00d78633          	add	a2,a5,a3
    b468:	00062603          	lw	a2,0(a2)
    b46c:	fff70713          	add	a4,a4,-1

0000b470 <.LVL40>:
    b470:	ffc78793          	add	a5,a5,-4
    b474:	00c7a223          	sw	a2,4(a5)

0000b478 <.LVL41>:
    b478:	feb756e3          	bge	a4,a1,b464 <.L12>
    b47c:	fff58793          	add	a5,a1,-1
    b480:	f61ff06f          	j	b3e0 <.L15>

0000b484 <.L14>:
    b484:	0007a603          	lw	a2,0(a5)
    b488:	ffc7a883          	lw	a7,-4(a5)
    b48c:	00d78e33          	add	t3,a5,a3
    b490:	00e61633          	sll	a2,a2,a4
    b494:	0108d8b3          	srl	a7,a7,a6
    b498:	01166633          	or	a2,a2,a7
    b49c:	00ce2023          	sw	a2,0(t3) # 7ff00000 <_ebss+0x7fee9cd0>
    b4a0:	ffc78793          	add	a5,a5,-4
    b4a4:	f19ff06f          	j	b3bc <.L11>

0000b4a8 <.L3>:
    b4a8:	00a7e7b3          	or	a5,a5,a0
    b4ac:	0107e7b3          	or	a5,a5,a6
    b4b0:	00e7e7b3          	or	a5,a5,a4

0000b4b4 <.LBB21>:
    b4b4:	00068493          	mv	s1,a3

0000b4b8 <.LBE21>:
    b4b8:	00200a13          	li	s4,2
    b4bc:	de0786e3          	beqz	a5,b2a8 <.L5>
    b4c0:	00300a13          	li	s4,3
    b4c4:	de5ff06f          	j	b2a8 <.L5>

0000b4c8 <.L145>:
    b4c8:	00000493          	li	s1,0

0000b4cc <.LBE22>:
    b4cc:	00100a13          	li	s4,1
    b4d0:	dd9ff06f          	j	b2a8 <.L5>

0000b4d4 <.L18>:
  FP_UNPACK_Q (B, b);
    b4d4:	017967b3          	or	a5,s2,s7

0000b4d8 <.LVL47>:
    b4d8:	0167e7b3          	or	a5,a5,s6
    b4dc:	00a7e7b3          	or	a5,a5,a0
    b4e0:	14078463          	beqz	a5,b628 <.L147>

0000b4e4 <.LBB23>:
    b4e4:	08050e63          	beqz	a0,b580 <.L22>
    b4e8:	92cf60ef          	jal	1614 <__clzsi2>

0000b4ec <.L23>:
    b4ec:	ff450693          	add	a3,a0,-12
    b4f0:	4056d793          	sra	a5,a3,0x5

0000b4f4 <.LVL49>:
    b4f4:	01f6f693          	and	a3,a3,31

0000b4f8 <.LVL50>:
    b4f8:	0c068063          	beqz	a3,b5b8 <.L26>
    b4fc:	ffc00613          	li	a2,-4
    b500:	02c78633          	mul	a2,a5,a2
    b504:	02000813          	li	a6,32
    b508:	04010313          	add	t1,sp,64
    b50c:	40d80833          	sub	a6,a6,a3

0000b510 <.LVL51>:
    b510:	00c60713          	add	a4,a2,12
    b514:	00e30733          	add	a4,t1,a4
    b518:	40c00633          	neg	a2,a2

0000b51c <.L27>:
    b51c:	0ce31663          	bne	t1,a4,b5e8 <.L30>
    b520:	fff78713          	add	a4,a5,-1

0000b524 <.LVL52>:
    b524:	00279793          	sll	a5,a5,0x2

0000b528 <.LVL53>:
    b528:	03010613          	add	a2,sp,48
    b52c:	04078793          	add	a5,a5,64
    b530:	00c787b3          	add	a5,a5,a2
    b534:	04012603          	lw	a2,64(sp)
    b538:	00d616b3          	sll	a3,a2,a3

0000b53c <.LVL54>:
    b53c:	fcd7a823          	sw	a3,-48(a5)

0000b540 <.L31>:
    b540:	00170793          	add	a5,a4,1
    b544:	00279793          	sll	a5,a5,0x2
    b548:	00800693          	li	a3,8
    b54c:	04010713          	add	a4,sp,64
    b550:	00d7ea63          	bltu	a5,a3,b564 <.L32>
    b554:	04012023          	sw	zero,64(sp)
    b558:	00072223          	sw	zero,4(a4)
    b55c:	ff878793          	add	a5,a5,-8
    b560:	04810713          	add	a4,sp,72

0000b564 <.L32>:
    b564:	00400693          	li	a3,4
    b568:	00d7e463          	bltu	a5,a3,b570 <.L33>
    b56c:	00072023          	sw	zero,0(a4)

0000b570 <.L33>:
    b570:	ffffc7b7          	lui	a5,0xffffc
    b574:	01178793          	add	a5,a5,17 # ffffc011 <_ebss+0xfffe5ce1>
    b578:	40a787b3          	sub	a5,a5,a0
    b57c:	db9ff06f          	j	b334 <.L194>

0000b580 <.L22>:
    b580:	000b0a63          	beqz	s6,b594 <.L24>
    b584:	000b0513          	mv	a0,s6
    b588:	88cf60ef          	jal	1614 <__clzsi2>

0000b58c <.LVL57>:
    b58c:	02050513          	add	a0,a0,32
    b590:	f5dff06f          	j	b4ec <.L23>

0000b594 <.L24>:
    b594:	00090a63          	beqz	s2,b5a8 <.L25>
    b598:	00090513          	mv	a0,s2
    b59c:	878f60ef          	jal	1614 <__clzsi2>

0000b5a0 <.LVL60>:
    b5a0:	04050513          	add	a0,a0,64
    b5a4:	f49ff06f          	j	b4ec <.L23>

0000b5a8 <.L25>:
    b5a8:	000b8513          	mv	a0,s7
    b5ac:	868f60ef          	jal	1614 <__clzsi2>

0000b5b0 <.LVL63>:
    b5b0:	06050513          	add	a0,a0,96
    b5b4:	f39ff06f          	j	b4ec <.L23>

0000b5b8 <.L26>:
    b5b8:	ffc00613          	li	a2,-4
    b5bc:	02c78633          	mul	a2,a5,a2
    b5c0:	04c10713          	add	a4,sp,76

0000b5c4 <.LBB19>:
    b5c4:	00300693          	li	a3,3

0000b5c8 <.L28>:
    b5c8:	00c705b3          	add	a1,a4,a2
    b5cc:	0005a583          	lw	a1,0(a1)
    b5d0:	fff68693          	add	a3,a3,-1

0000b5d4 <.LVL67>:
    b5d4:	ffc70713          	add	a4,a4,-4
    b5d8:	00b72223          	sw	a1,4(a4)

0000b5dc <.LVL68>:
    b5dc:	fef6d6e3          	bge	a3,a5,b5c8 <.L28>
    b5e0:	fff78713          	add	a4,a5,-1
    b5e4:	f5dff06f          	j	b540 <.L31>

0000b5e8 <.L30>:
    b5e8:	00072583          	lw	a1,0(a4)
    b5ec:	ffc72883          	lw	a7,-4(a4)
    b5f0:	00c70e33          	add	t3,a4,a2
    b5f4:	00d595b3          	sll	a1,a1,a3
    b5f8:	0108d8b3          	srl	a7,a7,a6
    b5fc:	0115e5b3          	or	a1,a1,a7
    b600:	00be2023          	sw	a1,0(t3)
    b604:	ffc70713          	add	a4,a4,-4
    b608:	f15ff06f          	j	b51c <.L27>

0000b60c <.L19>:
    b60c:	01796933          	or	s2,s2,s7
    b610:	01696933          	or	s2,s2,s6
    b614:	00a96933          	or	s2,s2,a0
    b618:	00200713          	li	a4,2
    b61c:	d0090ee3          	beqz	s2,b338 <.L21>
    b620:	00300713          	li	a4,3
    b624:	d15ff06f          	j	b338 <.L21>

0000b628 <.L147>:
    b628:	00000793          	li	a5,0

0000b62c <.LBE24>:
    b62c:	00100713          	li	a4,1

0000b630 <.LVL72>:
    b630:	d09ff06f          	j	b338 <.L21>

0000b634 <.L34>:
  FP_DIV_Q (R, A, B);
    b634:	03c12703          	lw	a4,60(sp)

0000b638 <.LVL74>:
    b638:	04c12503          	lw	a0,76(sp)
    b63c:	06012623          	sw	zero,108(sp)
    b640:	06012423          	sw	zero,104(sp)
    b644:	06012223          	sw	zero,100(sp)
    b648:	06012023          	sw	zero,96(sp)
    b64c:	03012783          	lw	a5,48(sp)
    b650:	03412603          	lw	a2,52(sp)
    b654:	04012803          	lw	a6,64(sp)
    b658:	04812583          	lw	a1,72(sp)
    b65c:	02e56263          	bltu	a0,a4,b680 <.L41>
    b660:	22a71263          	bne	a4,a0,b884 <.L42>
    b664:	03812503          	lw	a0,56(sp)
    b668:	00a5ec63          	bltu	a1,a0,b680 <.L41>
    b66c:	20b51c63          	bne	a0,a1,b884 <.L42>
    b670:	04412583          	lw	a1,68(sp)
    b674:	00c5e663          	bltu	a1,a2,b680 <.L41>
    b678:	20c59663          	bne	a1,a2,b884 <.L42>
    b67c:	2107e463          	bltu	a5,a6,b884 <.L42>

0000b680 <.L41>:
    b680:	01f79793          	sll	a5,a5,0x1f
    b684:	06f12623          	sw	a5,108(sp)

0000b688 <.LBB26>:
    b688:	03c10513          	add	a0,sp,60
    b68c:	03010793          	add	a5,sp,48

0000b690 <.L43>:
    b690:	0007a603          	lw	a2,0(a5)
    b694:	0047a583          	lw	a1,4(a5)
    b698:	00478793          	add	a5,a5,4
    b69c:	00165613          	srl	a2,a2,0x1
    b6a0:	01f59593          	sll	a1,a1,0x1f
    b6a4:	00b66633          	or	a2,a2,a1
    b6a8:	fec7ae23          	sw	a2,-4(a5)
    b6ac:	fef512e3          	bne	a0,a5,b690 <.L43>

0000b6b0 <.LVL77>:
    b6b0:	00175713          	srl	a4,a4,0x1
    b6b4:	02e12e23          	sw	a4,60(sp)

0000b6b8 <.L44>:
    b6b8:	04010593          	add	a1,sp,64
    b6bc:	04c10793          	add	a5,sp,76

0000b6c0 <.L45>:
    b6c0:	0007a703          	lw	a4,0(a5)
    b6c4:	ffc7a603          	lw	a2,-4(a5)
    b6c8:	ffc78793          	add	a5,a5,-4
    b6cc:	00c71713          	sll	a4,a4,0xc
    b6d0:	01465613          	srl	a2,a2,0x14
    b6d4:	00c76733          	or	a4,a4,a2
    b6d8:	00e7a223          	sw	a4,4(a5)
    b6dc:	fef592e3          	bne	a1,a5,b6c0 <.L45>

0000b6e0 <.LBE27>:
    b6e0:	04c12503          	lw	a0,76(sp)

0000b6e4 <.LBB28>:
    b6e4:	00010eb7          	lui	t4,0x10

0000b6e8 <.LBB29>:
    b6e8:	04412303          	lw	t1,68(sp)

0000b6ec <.LBB54>:
    b6ec:	fffe8e93          	add	t4,t4,-1 # ffff <.LBB204+0xb>

0000b6f0 <.LBB55>:
    b6f0:	00c81813          	sll	a6,a6,0xc

0000b6f4 <.LBB56>:
    b6f4:	01d577b3          	and	a5,a0,t4

0000b6f8 <.LBB31>:
    b6f8:	04812f83          	lw	t6,72(sp)

0000b6fc <.LBB58>:
    b6fc:	00f12e23          	sw	a5,28(sp)

0000b700 <.LBB32>:
    b700:	01085793          	srl	a5,a6,0x10
    b704:	00f12423          	sw	a5,8(sp)

0000b708 <.LBB33>:
    b708:	01035793          	srl	a5,t1,0x10
    b70c:	00f12623          	sw	a5,12(sp)
    b710:	01d377b3          	and	a5,t1,t4
    b714:	00f12a23          	sw	a5,20(sp)

0000b718 <.LBB34>:
    b718:	010fd793          	srl	a5,t6,0x10
    b71c:	00f12823          	sw	a5,16(sp)
    b720:	01dff7b3          	and	a5,t6,t4
    b724:	00f12c23          	sw	a5,24(sp)
    b728:	01d877b3          	and	a5,a6,t4
    b72c:	02f12023          	sw	a5,32(sp)
    b730:	03812883          	lw	a7,56(sp)

0000b734 <.LBB60>:
    b734:	410307b3          	sub	a5,t1,a6
    b738:	03c12703          	lw	a4,60(sp)
    b73c:	03412603          	lw	a2,52(sp)
    b740:	03012583          	lw	a1,48(sp)
    b744:	02f12223          	sw	a5,36(sp)
    b748:	406f87b3          	sub	a5,t6,t1

0000b74c <.LBB61>:
    b74c:	01055d13          	srl	s10,a0,0x10
    b750:	05010a13          	add	s4,sp,80

0000b754 <.LVL81>:
    b754:	06010c13          	add	s8,sp,96

0000b758 <.LBE61>:
    b758:	00300c93          	li	s9,3

0000b75c <.LBB62>:
    b75c:	00010db7          	lui	s11,0x10

0000b760 <.LBB63>:
    b760:	02f12423          	sw	a5,40(sp)

0000b764 <.L113>:
    b764:	12e51463          	bne	a0,a4,b88c <.L46>
    b768:	fff00793          	li	a5,-1
    b76c:	00fa2623          	sw	a5,12(s4)
    b770:	3e0c8c63          	beqz	s9,bb68 <.L114>

0000b774 <.LBB64>:
    b774:	00cc2f03          	lw	t5,12(s8)

0000b778 <.LVL83>:
    b778:	40b803b3          	sub	t2,a6,a1
    b77c:	00783e33          	sltu	t3,a6,t2
    b780:	01e037b3          	snez	a5,t5

0000b784 <.LVL84>:
    b784:	00000993          	li	s3,0
    b788:	000f0463          	beqz	t5,b790 <.L50>
    b78c:	0013b993          	seqz	s3,t2

0000b790 <.L50>:
    b790:	01c9e9b3          	or	s3,s3,t3

0000b794 <.LVL85>:
    b794:	40c302b3          	sub	t0,t1,a2

0000b798 <.LVL86>:
    b798:	00533e33          	sltu	t3,t1,t0

0000b79c <.LVL87>:
    b79c:	00000a93          	li	s5,0
    b7a0:	00098463          	beqz	s3,b7a8 <.L53>
    b7a4:	0012ba93          	seqz	s5,t0

0000b7a8 <.L53>:
    b7a8:	01caeab3          	or	s5,s5,t3

0000b7ac <.LBB65>:
    b7ac:	02412e03          	lw	t3,36(sp)
    b7b0:	01e80f33          	add	t5,a6,t5

0000b7b4 <.LVL89>:
    b7b4:	00be0e33          	add	t3,t3,a1
    b7b8:	00fe0e33          	add	t3,t3,a5

0000b7bc <.LVL90>:
    b7bc:	01e835b3          	sltu	a1,a6,t5
    b7c0:	01c334b3          	sltu	s1,t1,t3

0000b7c4 <.LVL91>:
    b7c4:	40be0e33          	sub	t3,t3,a1

0000b7c8 <.LVL92>:
    b7c8:	00000593          	li	a1,0
    b7cc:	01e87863          	bgeu	a6,t5,b7dc <.L54>

0000b7d0 <.LBB66>:
    b7d0:	40f383b3          	sub	t2,t2,a5

0000b7d4 <.LBB67>:
    b7d4:	406383b3          	sub	t2,t2,t1
    b7d8:	0013b593          	seqz	a1,t2

0000b7dc <.L54>:
    b7dc:	02812783          	lw	a5,40(sp)

0000b7e0 <.LVL94>:
    b7e0:	0095e5b3          	or	a1,a1,s1

0000b7e4 <.LVL95>:
    b7e4:	00c784b3          	add	s1,a5,a2
    b7e8:	013484b3          	add	s1,s1,s3

0000b7ec <.LVL96>:
    b7ec:	009fb3b3          	sltu	t2,t6,s1

0000b7f0 <.LVL97>:
    b7f0:	00000613          	li	a2,0
    b7f4:	40b484b3          	sub	s1,s1,a1

0000b7f8 <.LVL98>:
    b7f8:	00058863          	beqz	a1,b808 <.L55>

0000b7fc <.LBB68>:
    b7fc:	413282b3          	sub	t0,t0,s3

0000b800 <.LBB69>:
    b800:	41f282b3          	sub	t0,t0,t6
    b804:	0012b613          	seqz	a2,t0

0000b808 <.L55>:
    b808:	41f707b3          	sub	a5,a4,t6
    b80c:	011787b3          	add	a5,a5,a7
    b810:	015787b3          	add	a5,a5,s5
    b814:	00766633          	or	a2,a2,t2

0000b818 <.LVL101>:
    b818:	40c787b3          	sub	a5,a5,a2

0000b81c <.LBE69>:
    b81c:	04f77463          	bgeu	a4,a5,b864 <.L56>
    b820:	006e02b3          	add	t0,t3,t1
    b824:	01e80f33          	add	t5,a6,t5

0000b828 <.LVL102>:
    b828:	01c2b8b3          	sltu	a7,t0,t3

0000b82c <.LBB70>:
    b82c:	010f3e33          	sltu	t3,t5,a6

0000b830 <.LVL103>:
    b830:	01c28e33          	add	t3,t0,t3
    b834:	005e32b3          	sltu	t0,t3,t0
    b838:	01f485b3          	add	a1,s1,t6

0000b83c <.LVL104>:
    b83c:	0058e8b3          	or	a7,a7,t0

0000b840 <.LBE70>:
    b840:	ffe00613          	li	a2,-2

0000b844 <.LVL105>:
    b844:	011588b3          	add	a7,a1,a7
    b848:	00ca2623          	sw	a2,12(s4)

0000b84c <.LBB71>:
    b84c:	0095b633          	sltu	a2,a1,s1

0000b850 <.LVL107>:
    b850:	00b8b5b3          	sltu	a1,a7,a1
    b854:	00b66633          	or	a2,a2,a1

0000b858 <.LVL108>:
    b858:	00e60633          	add	a2,a2,a4
    b85c:	00088493          	mv	s1,a7

0000b860 <.LVL109>:
    b860:	00c787b3          	add	a5,a5,a2

0000b864 <.L56>:
    b864:	fffc8c93          	add	s9,s9,-1
    b868:	ffca0a13          	add	s4,s4,-4
    b86c:	ffcc0c13          	add	s8,s8,-4
    b870:	00048893          	mv	a7,s1
    b874:	000e0613          	mv	a2,t3
    b878:	000f0593          	mv	a1,t5
    b87c:	00078713          	mv	a4,a5
    b880:	ee5ff06f          	j	b764 <.L113>

0000b884 <.L42>:
    b884:	fff68693          	add	a3,a3,-1
    b888:	e31ff06f          	j	b6b8 <.L44>

0000b88c <.L46>:
    b88c:	03a75e33          	divu	t3,a4,s10

0000b890 <.LVL115>:
    b890:	01c12783          	lw	a5,28(sp)
    b894:	0108df13          	srl	t5,a7,0x10
    b898:	03a77733          	remu	a4,a4,s10

0000b89c <.LVL116>:
    b89c:	03c787b3          	mul	a5,a5,t3

0000b8a0 <.LVL117>:
    b8a0:	01071713          	sll	a4,a4,0x10

0000b8a4 <.LVL118>:
    b8a4:	00ef6733          	or	a4,t5,a4

0000b8a8 <.LVL119>:
    b8a8:	000e0f13          	mv	t5,t3
    b8ac:	00f77e63          	bgeu	a4,a5,b8c8 <.L67>
    b8b0:	00e50733          	add	a4,a0,a4

0000b8b4 <.LVL120>:
    b8b4:	fffe0f13          	add	t5,t3,-1

0000b8b8 <.LVL121>:
    b8b8:	00a76863          	bltu	a4,a0,b8c8 <.L67>
    b8bc:	00f77663          	bgeu	a4,a5,b8c8 <.L67>
    b8c0:	ffee0f13          	add	t5,t3,-2
    b8c4:	00a70733          	add	a4,a4,a0

0000b8c8 <.L67>:
    b8c8:	40f70733          	sub	a4,a4,a5

0000b8cc <.LVL124>:
    b8cc:	03a75e33          	divu	t3,a4,s10

0000b8d0 <.LVL125>:
    b8d0:	01c12783          	lw	a5,28(sp)

0000b8d4 <.LVL126>:
    b8d4:	01d8f8b3          	and	a7,a7,t4
    b8d8:	03a77733          	remu	a4,a4,s10

0000b8dc <.LVL127>:
    b8dc:	03c787b3          	mul	a5,a5,t3

0000b8e0 <.LVL128>:
    b8e0:	01071713          	sll	a4,a4,0x10

0000b8e4 <.LVL129>:
    b8e4:	00e8e8b3          	or	a7,a7,a4

0000b8e8 <.LVL130>:
    b8e8:	000e0713          	mv	a4,t3
    b8ec:	00f8fe63          	bgeu	a7,a5,b908 <.L70>
    b8f0:	011508b3          	add	a7,a0,a7

0000b8f4 <.LVL131>:
    b8f4:	fffe0713          	add	a4,t3,-1

0000b8f8 <.LVL132>:
    b8f8:	00a8e863          	bltu	a7,a0,b908 <.L70>
    b8fc:	00f8f663          	bgeu	a7,a5,b908 <.L70>
    b900:	ffee0713          	add	a4,t3,-2
    b904:	00a888b3          	add	a7,a7,a0

0000b908 <.L70>:
    b908:	40f887b3          	sub	a5,a7,a5

0000b90c <.LVL135>:
    b90c:	010f1f13          	sll	t5,t5,0x10

0000b910 <.LBB35>:
    b910:	02012883          	lw	a7,32(sp)

0000b914 <.LBB74>:
    b914:	00ef6f33          	or	t5,t5,a4

0000b918 <.LBB36>:
    b918:	010f5293          	srl	t0,t5,0x10
    b91c:	01df7733          	and	a4,t5,t4

0000b920 <.LVL137>:
    b920:	02e88e33          	mul	t3,a7,a4

0000b924 <.LBB76>:
    b924:	01ea2623          	sw	t5,12(s4)

0000b928 <.LBB37>:
    b928:	031284b3          	mul	s1,t0,a7

0000b92c <.LVL140>:
    b92c:	00812883          	lw	a7,8(sp)
    b930:	010e5993          	srl	s3,t3,0x10
    b934:	031283b3          	mul	t2,t0,a7

0000b938 <.LVL141>:
    b938:	02e888b3          	mul	a7,a7,a4

0000b93c <.LVL142>:
    b93c:	009888b3          	add	a7,a7,s1

0000b940 <.LVL143>:
    b940:	011988b3          	add	a7,s3,a7

0000b944 <.LVL144>:
    b944:	0098f463          	bgeu	a7,s1,b94c <.L73>
    b948:	01b383b3          	add	t2,t2,s11

0000b94c <.L73>:
    b94c:	0108d493          	srl	s1,a7,0x10

0000b950 <.LVL146>:
    b950:	01d8f8b3          	and	a7,a7,t4

0000b954 <.LVL147>:
    b954:	01de7e33          	and	t3,t3,t4

0000b958 <.LVL148>:
    b958:	01089893          	sll	a7,a7,0x10
    b95c:	01c888b3          	add	a7,a7,t3

0000b960 <.LBB38>:
    b960:	01412e03          	lw	t3,20(sp)

0000b964 <.LBB39>:
    b964:	007484b3          	add	s1,s1,t2

0000b968 <.LBB40>:
    b968:	02ee09b3          	mul	s3,t3,a4

0000b96c <.LVL150>:
    b96c:	03c283b3          	mul	t2,t0,t3

0000b970 <.LVL151>:
    b970:	00c12e03          	lw	t3,12(sp)
    b974:	0109db13          	srl	s6,s3,0x10
    b978:	03c28ab3          	mul	s5,t0,t3

0000b97c <.LVL152>:
    b97c:	02ee0e33          	mul	t3,t3,a4

0000b980 <.LVL153>:
    b980:	007e0e33          	add	t3,t3,t2

0000b984 <.LVL154>:
    b984:	01cb0e33          	add	t3,s6,t3

0000b988 <.LVL155>:
    b988:	007e7463          	bgeu	t3,t2,b990 <.L74>
    b98c:	01ba8ab3          	add	s5,s5,s11

0000b990 <.L74>:
    b990:	01de73b3          	and	t2,t3,t4
    b994:	01d9f9b3          	and	s3,s3,t4

0000b998 <.LVL157>:
    b998:	01039393          	sll	t2,t2,0x10
    b99c:	013383b3          	add	t2,t2,s3
    b9a0:	007483b3          	add	t2,s1,t2

0000b9a4 <.LBB43>:
    b9a4:	01812983          	lw	s3,24(sp)

0000b9a8 <.LBB45>:
    b9a8:	0093b4b3          	sltu	s1,t2,s1

0000b9ac <.LBB46>:
    b9ac:	010e5e13          	srl	t3,t3,0x10

0000b9b0 <.LBB47>:
    b9b0:	009e0e33          	add	t3,t3,s1
    b9b4:	015e0e33          	add	t3,t3,s5

0000b9b8 <.LBB48>:
    b9b8:	03328ab3          	mul	s5,t0,s3

0000b9bc <.LVL162>:
    b9bc:	01012983          	lw	s3,16(sp)
    b9c0:	01812483          	lw	s1,24(sp)
    b9c4:	033289b3          	mul	s3,t0,s3
    b9c8:	01012283          	lw	t0,16(sp)

0000b9cc <.LVL163>:
    b9cc:	02e484b3          	mul	s1,s1,a4

0000b9d0 <.LVL164>:
    b9d0:	02e28733          	mul	a4,t0,a4

0000b9d4 <.LVL165>:
    b9d4:	0104d293          	srl	t0,s1,0x10
    b9d8:	01570733          	add	a4,a4,s5

0000b9dc <.LVL166>:
    b9dc:	00e28733          	add	a4,t0,a4

0000b9e0 <.LVL167>:
    b9e0:	01577463          	bgeu	a4,s5,b9e8 <.L77>
    b9e4:	01b989b3          	add	s3,s3,s11

0000b9e8 <.L77>:
    b9e8:	01d772b3          	and	t0,a4,t4
    b9ec:	01029293          	sll	t0,t0,0x10
    b9f0:	01d4f4b3          	and	s1,s1,t4

0000b9f4 <.LVL169>:
    b9f4:	009282b3          	add	t0,t0,s1
    b9f8:	005e02b3          	add	t0,t3,t0

0000b9fc <.LBB51>:
    b9fc:	01075713          	srl	a4,a4,0x10

0000ba00 <.LBB53>:
    ba00:	01c2be33          	sltu	t3,t0,t3

0000ba04 <.LVL172>:
    ba04:	01c70733          	add	a4,a4,t3
    ba08:	01370733          	add	a4,a4,s3

0000ba0c <.LBE53>:
    ba0c:	00cc2983          	lw	s3,12(s8)

0000ba10 <.LVL174>:
    ba10:	00e7ee63          	bltu	a5,a4,ba2c <.L80>
    ba14:	0ef71463          	bne	a4,a5,bafc <.L81>
    ba18:	00566a63          	bltu	a2,t0,ba2c <.L80>
    ba1c:	0e561063          	bne	a2,t0,bafc <.L81>
    ba20:	0075e663          	bltu	a1,t2,ba2c <.L80>
    ba24:	0c759c63          	bne	a1,t2,bafc <.L81>
    ba28:	0d19fa63          	bgeu	s3,a7,bafc <.L81>

0000ba2c <.L80>:
    ba2c:	ffff0e13          	add	t3,t5,-1
    ba30:	01380ab3          	add	s5,a6,s3

0000ba34 <.LVL175>:
    ba34:	00b30b33          	add	s6,t1,a1

0000ba38 <.LVL176>:
    ba38:	01ca2623          	sw	t3,12(s4)

0000ba3c <.LBB78>:
    ba3c:	010abe33          	sltu	t3,s5,a6
    ba40:	01cb04b3          	add	s1,s6,t3
    ba44:	03c12623          	sw	t3,44(sp)
    ba48:	006b3e33          	sltu	t3,s6,t1
    ba4c:	0164bb33          	sltu	s6,s1,s6
    ba50:	00cf8bb3          	add	s7,t6,a2
    ba54:	016e6e33          	or	t3,t3,s6
    ba58:	01cb8e33          	add	t3,s7,t3
    ba5c:	01fbbb33          	sltu	s6,s7,t6
    ba60:	017e3bb3          	sltu	s7,t3,s7
    ba64:	017b6b33          	or	s6,s6,s7
    ba68:	00ab0b33          	add	s6,s6,a0
    ba6c:	016787b3          	add	a5,a5,s6

0000ba70 <.LVL177>:
    ba70:	000a8993          	mv	s3,s5

0000ba74 <.LVL178>:
    ba74:	00048593          	mv	a1,s1
    ba78:	000e0613          	mv	a2,t3

0000ba7c <.LBE78>:
    ba7c:	02f56063          	bltu	a0,a5,ba9c <.L92>
    ba80:	06f51e63          	bne	a0,a5,bafc <.L81>
    ba84:	01cfec63          	bltu	t6,t3,ba9c <.L92>
    ba88:	07cf9a63          	bne	t6,t3,bafc <.L81>
    ba8c:	00936863          	bltu	t1,s1,ba9c <.L92>
    ba90:	06931663          	bne	t1,s1,bafc <.L81>
    ba94:	010abb33          	sltu	s6,s5,a6
    ba98:	060b1263          	bnez	s6,bafc <.L81>

0000ba9c <.L92>:
    ba9c:	00e7ee63          	bltu	a5,a4,bab8 <.L93>
    baa0:	04f71e63          	bne	a4,a5,bafc <.L81>
    baa4:	005e6a63          	bltu	t3,t0,bab8 <.L93>
    baa8:	045e1a63          	bne	t3,t0,bafc <.L81>
    baac:	0074e663          	bltu	s1,t2,bab8 <.L93>
    bab0:	04749663          	bne	s1,t2,bafc <.L81>
    bab4:	051af463          	bgeu	s5,a7,bafc <.L81>

0000bab8 <.L93>:
    bab8:	01580ab3          	add	s5,a6,s5
    babc:	009304b3          	add	s1,t1,s1

0000bac0 <.LBB79>:
    bac0:	010ab5b3          	sltu	a1,s5,a6
    bac4:	00b485b3          	add	a1,s1,a1
    bac8:	0064b633          	sltu	a2,s1,t1
    bacc:	0095b4b3          	sltu	s1,a1,s1
    bad0:	01cf8e33          	add	t3,t6,t3
    bad4:	00966633          	or	a2,a2,s1

0000bad8 <.LBE79>:
    bad8:	ffef0f13          	add	t5,t5,-2

0000badc <.LVL180>:
    badc:	00ce0633          	add	a2,t3,a2
    bae0:	01ea2623          	sw	t5,12(s4)

0000bae4 <.LBB80>:
    bae4:	01fe3f33          	sltu	t5,t3,t6

0000bae8 <.LVL182>:
    bae8:	01c63e33          	sltu	t3,a2,t3
    baec:	01cf6f33          	or	t5,t5,t3
    baf0:	00af0f33          	add	t5,t5,a0
    baf4:	000a8993          	mv	s3,s5

0000baf8 <.LVL183>:
    baf8:	01e787b3          	add	a5,a5,t5

0000bafc <.L81>:
    bafc:	41198ab3          	sub	s5,s3,a7
    bb00:	407584b3          	sub	s1,a1,t2
    bb04:	0159be33          	sltu	t3,s3,s5
    bb08:	0095bb33          	sltu	s6,a1,s1
    bb0c:	000a8f13          	mv	t5,s5

0000bb10 <.LVL185>:
    bb10:	41c48e33          	sub	t3,s1,t3

0000bb14 <.LVL186>:
    bb14:	00000593          	li	a1,0

0000bb18 <.LVL187>:
    bb18:	0159f463          	bgeu	s3,s5,bb20 <.L108>
    bb1c:	0014b593          	seqz	a1,s1

0000bb20 <.L108>:
    bb20:	0165e5b3          	or	a1,a1,s6

0000bb24 <.LVL188>:
    bb24:	40560b33          	sub	s6,a2,t0

0000bb28 <.LVL189>:
    bb28:	01663633          	sltu	a2,a2,s6

0000bb2c <.LVL190>:
    bb2c:	40bb04b3          	sub	s1,s6,a1

0000bb30 <.LVL191>:
    bb30:	00000993          	li	s3,0

0000bb34 <.LVL192>:
    bb34:	00058463          	beqz	a1,bb3c <.L111>
    bb38:	001b3993          	seqz	s3,s6

0000bb3c <.L111>:
    bb3c:	40e787b3          	sub	a5,a5,a4

0000bb40 <.LVL194>:
    bb40:	00c9e9b3          	or	s3,s3,a2

0000bb44 <.LVL195>:
    bb44:	413787b3          	sub	a5,a5,s3

0000bb48 <.LBE81>:
    bb48:	d00c9ee3          	bnez	s9,b864 <.L56>
    bb4c:	01589863          	bne	a7,s5,bb5c <.L112>
    bb50:	007e1663          	bne	t3,t2,bb5c <.L112>
    bb54:	00549463          	bne	s1,t0,bb5c <.L112>
    bb58:	00f70863          	beq	a4,a5,bb68 <.L114>

0000bb5c <.L112>:
    bb5c:	05012783          	lw	a5,80(sp)
    bb60:	0017e793          	or	a5,a5,1
    bb64:	04f12823          	sw	a5,80(sp)

0000bb68 <.L114>:
  FP_PACK_Q (r, R);
    bb68:	000047b7          	lui	a5,0x4
    bb6c:	fff78793          	add	a5,a5,-1 # 3fff <.L23+0x3>
    bb70:	00f687b3          	add	a5,a3,a5

0000bb74 <.LVL197>:
    bb74:	1af05463          	blez	a5,bd1c <.L116>
    bb78:	05012703          	lw	a4,80(sp)
    bb7c:	00777613          	and	a2,a4,7
    bb80:	04060463          	beqz	a2,bbc8 <.L117>
    bb84:	00f77613          	and	a2,a4,15
    bb88:	00400593          	li	a1,4
    bb8c:	02b60e63          	beq	a2,a1,bbc8 <.L117>

0000bb90 <.LBB83>:
    bb90:	00470713          	add	a4,a4,4
    bb94:	00473613          	sltiu	a2,a4,4
    bb98:	04e12823          	sw	a4,80(sp)

0000bb9c <.LVL198>:
    bb9c:	05412703          	lw	a4,84(sp)

0000bba0 <.LVL199>:
    bba0:	00e60733          	add	a4,a2,a4
    bba4:	04e12a23          	sw	a4,84(sp)

0000bba8 <.LVL200>:
    bba8:	00c73733          	sltu	a4,a4,a2

0000bbac <.LVL201>:
    bbac:	05812603          	lw	a2,88(sp)
    bbb0:	00e60733          	add	a4,a2,a4

0000bbb4 <.LVL202>:
    bbb4:	04e12c23          	sw	a4,88(sp)

0000bbb8 <.LVL203>:
    bbb8:	00c73733          	sltu	a4,a4,a2

0000bbbc <.LVL204>:
    bbbc:	05c12603          	lw	a2,92(sp)
    bbc0:	00c70733          	add	a4,a4,a2

0000bbc4 <.LVL205>:
    bbc4:	04e12e23          	sw	a4,92(sp)

0000bbc8 <.L117>:
    bbc8:	05c12703          	lw	a4,92(sp)
    bbcc:	00b71613          	sll	a2,a4,0xb
    bbd0:	00065e63          	bgez	a2,bbec <.L122>
    bbd4:	fff007b7          	lui	a5,0xfff00

0000bbd8 <.LVL207>:
    bbd8:	fff78793          	add	a5,a5,-1 # ffefffff <_ebss+0xffee9ccf>
    bbdc:	00f77733          	and	a4,a4,a5
    bbe0:	000047b7          	lui	a5,0x4

0000bbe4 <.LVL208>:
    bbe4:	04e12e23          	sw	a4,92(sp)
    bbe8:	00f687b3          	add	a5,a3,a5

0000bbec <.L122>:
    bbec:	05010713          	add	a4,sp,80
    bbf0:	05c10593          	add	a1,sp,92

0000bbf4 <.L123>:
    bbf4:	00072683          	lw	a3,0(a4)
    bbf8:	00472603          	lw	a2,4(a4)
    bbfc:	00470713          	add	a4,a4,4
    bc00:	0036d693          	srl	a3,a3,0x3
    bc04:	01d61613          	sll	a2,a2,0x1d
    bc08:	00c6e6b3          	or	a3,a3,a2
    bc0c:	fed72e23          	sw	a3,-4(a4)
    bc10:	feb712e3          	bne	a4,a1,bbf4 <.L123>

0000bc14 <.LBE84>:
    bc14:	000086b7          	lui	a3,0x8
    bc18:	ffe68693          	add	a3,a3,-2 # 7ffe <.L2+0x7a>

0000bc1c <.LBB85>:
    bc1c:	05c12703          	lw	a4,92(sp)

0000bc20 <.LBE85>:
    bc20:	0af6ce63          	blt	a3,a5,bcdc <.L39>

0000bc24 <.LBB86>:
    bc24:	00375713          	srl	a4,a4,0x3
    bc28:	04e12e23          	sw	a4,92(sp)

0000bc2c <.L125>:
    bc2c:	00f91913          	sll	s2,s2,0xf

0000bc30 <.LVL213>:
    bc30:	00f96933          	or	s2,s2,a5

0000bc34 <.LBE87>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    bc34:	05012783          	lw	a5,80(sp)

0000bc38 <.LBB88>:
  FP_PACK_Q (r, R);
    bc38:	05c12703          	lw	a4,92(sp)
    bc3c:	07211723          	sh	s2,110(sp)

0000bc40 <.LBE88>:
  return r;
    bc40:	00f42023          	sw	a5,0(s0)
    bc44:	05412783          	lw	a5,84(sp)

0000bc48 <.LBB89>:
  FP_PACK_Q (r, R);
    bc48:	06e11623          	sh	a4,108(sp)

0000bc4c <.LBE89>:
}
    bc4c:	0ac12083          	lw	ra,172(sp)
  return r;
    bc50:	00f42223          	sw	a5,4(s0)
    bc54:	05812783          	lw	a5,88(sp)

0000bc58 <.LVL216>:
}
    bc58:	00040513          	mv	a0,s0
    bc5c:	0a412483          	lw	s1,164(sp)
  return r;
    bc60:	00f42423          	sw	a5,8(s0)
    bc64:	06c12783          	lw	a5,108(sp)
}
    bc68:	0a012903          	lw	s2,160(sp)
    bc6c:	09c12983          	lw	s3,156(sp)
  return r;
    bc70:	00f42623          	sw	a5,12(s0)
}
    bc74:	0a812403          	lw	s0,168(sp)
    bc78:	09812a03          	lw	s4,152(sp)
    bc7c:	09412a83          	lw	s5,148(sp)
    bc80:	09012b03          	lw	s6,144(sp)
    bc84:	08c12b83          	lw	s7,140(sp)
    bc88:	08812c03          	lw	s8,136(sp)
    bc8c:	08412c83          	lw	s9,132(sp)
    bc90:	08012d03          	lw	s10,128(sp)
    bc94:	07c12d83          	lw	s11,124(sp)
    bc98:	0b010113          	add	sp,sp,176

0000bc9c <.LVL218>:
    bc9c:	00008067          	ret

0000bca0 <.L37>:
  FP_DIV_Q (R, A, B);
    bca0:	03012783          	lw	a5,48(sp)

0000bca4 <.LBB90>:
  FP_UNPACK_Q (A, a);
    bca4:	00098913          	mv	s2,s3

0000bca8 <.LBE90>:
  FP_DIV_Q (R, A, B);
    bca8:	000a0713          	mv	a4,s4

0000bcac <.LVL221>:
    bcac:	04f12823          	sw	a5,80(sp)
    bcb0:	03412783          	lw	a5,52(sp)
    bcb4:	04f12a23          	sw	a5,84(sp)
    bcb8:	03812783          	lw	a5,56(sp)
    bcbc:	04f12c23          	sw	a5,88(sp)
    bcc0:	03c12783          	lw	a5,60(sp)

0000bcc4 <.L115>:
    bcc4:	04f12e23          	sw	a5,92(sp)

0000bcc8 <.LVL223>:
  FP_PACK_Q (r, R);
    bcc8:	00100793          	li	a5,1
    bccc:	24f70863          	beq	a4,a5,bf1c <.L195>
    bcd0:	e8070ce3          	beqz	a4,bb68 <.L114>
    bcd4:	00200793          	li	a5,2
    bcd8:	24f71c63          	bne	a4,a5,bf30 <.L35>

0000bcdc <.L39>:
    bcdc:	000087b7          	lui	a5,0x8
    bce0:	04012e23          	sw	zero,92(sp)
    bce4:	04012c23          	sw	zero,88(sp)
    bce8:	04012a23          	sw	zero,84(sp)
    bcec:	04012823          	sw	zero,80(sp)
    bcf0:	fff78793          	add	a5,a5,-1 # 7fff <.L2+0x7b>
    bcf4:	f39ff06f          	j	bc2c <.L125>

0000bcf8 <.L38>:
  FP_DIV_Q (R, A, B);
    bcf8:	04012783          	lw	a5,64(sp)

0000bcfc <.LBB91>:
  FP_UNPACK_Q (B, b);
    bcfc:	000a8913          	mv	s2,s5

0000bd00 <.LBE91>:
  FP_DIV_Q (R, A, B);
    bd00:	04f12823          	sw	a5,80(sp)
    bd04:	04412783          	lw	a5,68(sp)
    bd08:	04f12a23          	sw	a5,84(sp)
    bd0c:	04812783          	lw	a5,72(sp)
    bd10:	04f12c23          	sw	a5,88(sp)
    bd14:	04c12783          	lw	a5,76(sp)

0000bd18 <.LVL227>:
    bd18:	fadff06f          	j	bcc4 <.L115>

0000bd1c <.L116>:
  FP_PACK_Q (r, R);
    bd1c:	00100693          	li	a3,1
    bd20:	40f686b3          	sub	a3,a3,a5

0000bd24 <.LVL229>:
    bd24:	07400793          	li	a5,116
    bd28:	1cd7ca63          	blt	a5,a3,befc <.L126>

0000bd2c <.LBB93>:
    bd2c:	05010613          	add	a2,sp,80
    bd30:	4056d713          	sra	a4,a3,0x5

0000bd34 <.LVL230>:
    bd34:	00060513          	mv	a0,a2
    bd38:	01f6f693          	and	a3,a3,31

0000bd3c <.LVL231>:
    bd3c:	00000793          	li	a5,0
    bd40:	00000593          	li	a1,0

0000bd44 <.L127>:
    bd44:	02e59e63          	bne	a1,a4,bd80 <.L128>
    bd48:	00300593          	li	a1,3

0000bd4c <.LVL233>:
    bd4c:	40e585b3          	sub	a1,a1,a4
    bd50:	00271513          	sll	a0,a4,0x2
    bd54:	04069063          	bnez	a3,bd94 <.L129>
    bd58:	00060813          	mv	a6,a2

0000bd5c <.L130>:
    bd5c:	00a808b3          	add	a7,a6,a0
    bd60:	0008a883          	lw	a7,0(a7) # 10000 <.LBE204>
    bd64:	00168693          	add	a3,a3,1

0000bd68 <.LVL235>:
    bd68:	00480813          	add	a6,a6,4
    bd6c:	ff182e23          	sw	a7,-4(a6)

0000bd70 <.LVL236>:
    bd70:	fed5d6e3          	bge	a1,a3,bd5c <.L130>
    bd74:	00400693          	li	a3,4

0000bd78 <.LVL237>:
    bd78:	40e68733          	sub	a4,a3,a4

0000bd7c <.LVL238>:
    bd7c:	06c0006f          	j	bde8 <.L134>

0000bd80 <.L128>:
    bd80:	00052803          	lw	a6,0(a0)
    bd84:	00158593          	add	a1,a1,1

0000bd88 <.LVL240>:
    bd88:	00450513          	add	a0,a0,4
    bd8c:	0107e7b3          	or	a5,a5,a6

0000bd90 <.LVL241>:
    bd90:	fb5ff06f          	j	bd44 <.L127>

0000bd94 <.L129>:
    bd94:	04050813          	add	a6,a0,64
    bd98:	03010893          	add	a7,sp,48
    bd9c:	01180833          	add	a6,a6,a7
    bda0:	fe082803          	lw	a6,-32(a6)
    bda4:	02000313          	li	t1,32
    bda8:	40d30333          	sub	t1,t1,a3
    bdac:	00681833          	sll	a6,a6,t1
    bdb0:	0107e7b3          	or	a5,a5,a6

0000bdb4 <.LVL243>:
    bdb4:	00000e13          	li	t3,0
    bdb8:	00a60833          	add	a6,a2,a0
    bdbc:	40a00533          	neg	a0,a0

0000bdc0 <.L132>:
    bdc0:	0ebe4063          	blt	t3,a1,bea0 <.L133>
    bdc4:	00400513          	li	a0,4
    bdc8:	00259593          	sll	a1,a1,0x2
    bdcc:	40e50733          	sub	a4,a0,a4

0000bdd0 <.LVL245>:
    bdd0:	04058593          	add	a1,a1,64
    bdd4:	03010513          	add	a0,sp,48
    bdd8:	00a585b3          	add	a1,a1,a0
    bddc:	05c12503          	lw	a0,92(sp)
    bde0:	00d556b3          	srl	a3,a0,a3

0000bde4 <.LVL246>:
    bde4:	fed5a023          	sw	a3,-32(a1)

0000bde8 <.L134>:
    bde8:	00400693          	li	a3,4
    bdec:	40e686b3          	sub	a3,a3,a4
    bdf0:	00269693          	sll	a3,a3,0x2
    bdf4:	00271713          	sll	a4,a4,0x2
    bdf8:	00800593          	li	a1,8
    bdfc:	00e60733          	add	a4,a2,a4
    be00:	00b6ea63          	bltu	a3,a1,be14 <.L135>
    be04:	00072023          	sw	zero,0(a4)
    be08:	00072223          	sw	zero,4(a4)
    be0c:	ff868693          	add	a3,a3,-8
    be10:	00870713          	add	a4,a4,8

0000be14 <.L135>:
    be14:	00400593          	li	a1,4
    be18:	00b6e463          	bltu	a3,a1,be20 <.L136>
    be1c:	00072023          	sw	zero,0(a4)

0000be20 <.L136>:
    be20:	05012703          	lw	a4,80(sp)

0000be24 <.LBB95>:
    be24:	00f037b3          	snez	a5,a5

0000be28 <.LBE95>:
    be28:	00e7e7b3          	or	a5,a5,a4
    be2c:	04f12823          	sw	a5,80(sp)

0000be30 <.LBE93>:
    be30:	0077f713          	and	a4,a5,7
    be34:	04070463          	beqz	a4,be7c <.L137>
    be38:	00f7f713          	and	a4,a5,15
    be3c:	00400693          	li	a3,4
    be40:	02d70e63          	beq	a4,a3,be7c <.L137>

0000be44 <.LBB97>:
    be44:	05412703          	lw	a4,84(sp)
    be48:	00478793          	add	a5,a5,4
    be4c:	04f12823          	sw	a5,80(sp)

0000be50 <.LVL249>:
    be50:	0047b793          	sltiu	a5,a5,4

0000be54 <.LVL250>:
    be54:	00f707b3          	add	a5,a4,a5
    be58:	04f12a23          	sw	a5,84(sp)

0000be5c <.LVL251>:
    be5c:	00e7b7b3          	sltu	a5,a5,a4

0000be60 <.LVL252>:
    be60:	05812703          	lw	a4,88(sp)
    be64:	00f707b3          	add	a5,a4,a5

0000be68 <.LVL253>:
    be68:	04f12c23          	sw	a5,88(sp)

0000be6c <.LVL254>:
    be6c:	00e7b7b3          	sltu	a5,a5,a4

0000be70 <.LVL255>:
    be70:	05c12703          	lw	a4,92(sp)
    be74:	00e787b3          	add	a5,a5,a4

0000be78 <.LVL256>:
    be78:	04f12e23          	sw	a5,92(sp)

0000be7c <.L137>:
    be7c:	05c12703          	lw	a4,92(sp)
    be80:	00c71793          	sll	a5,a4,0xc
    be84:	0407d263          	bgez	a5,bec8 <.L142>

0000be88 <.LVL258>:
    be88:	04012e23          	sw	zero,92(sp)
    be8c:	04012c23          	sw	zero,88(sp)
    be90:	04012a23          	sw	zero,84(sp)
    be94:	04012823          	sw	zero,80(sp)
    be98:	00100793          	li	a5,1
    be9c:	d91ff06f          	j	bc2c <.L125>

0000bea0 <.L133>:
    bea0:	00082883          	lw	a7,0(a6)
    bea4:	00482e83          	lw	t4,4(a6)
    bea8:	00a80f33          	add	t5,a6,a0
    beac:	00d8d8b3          	srl	a7,a7,a3
    beb0:	006e9eb3          	sll	t4,t4,t1
    beb4:	01d8e8b3          	or	a7,a7,t4
    beb8:	011f2023          	sw	a7,0(t5)

0000bebc <.LVL260>:
    bebc:	001e0e13          	add	t3,t3,1

0000bec0 <.LVL261>:
    bec0:	00480813          	add	a6,a6,4
    bec4:	efdff06f          	j	bdc0 <.L132>

0000bec8 <.L142>:
    bec8:	00c60593          	add	a1,a2,12

0000becc <.L143>:
    becc:	00062783          	lw	a5,0(a2)
    bed0:	00462683          	lw	a3,4(a2)
    bed4:	00460613          	add	a2,a2,4
    bed8:	0037d793          	srl	a5,a5,0x3
    bedc:	01d69693          	sll	a3,a3,0x1d
    bee0:	00d7e7b3          	or	a5,a5,a3
    bee4:	fef62e23          	sw	a5,-4(a2)
    bee8:	fec592e3          	bne	a1,a2,becc <.L143>

0000beec <.LVL264>:
    beec:	00375713          	srl	a4,a4,0x3
    bef0:	04e12e23          	sw	a4,92(sp)

0000bef4 <.L144>:
    bef4:	00000793          	li	a5,0
    bef8:	d35ff06f          	j	bc2c <.L125>

0000befc <.L126>:
    befc:	05412703          	lw	a4,84(sp)
    bf00:	05012783          	lw	a5,80(sp)
    bf04:	00e7e7b3          	or	a5,a5,a4
    bf08:	05812703          	lw	a4,88(sp)
    bf0c:	00e7e7b3          	or	a5,a5,a4
    bf10:	05c12703          	lw	a4,92(sp)
    bf14:	00e7e7b3          	or	a5,a5,a4
    bf18:	fc078ee3          	beqz	a5,bef4 <.L144>

0000bf1c <.L195>:
    bf1c:	04012e23          	sw	zero,92(sp)
    bf20:	04012c23          	sw	zero,88(sp)
    bf24:	04012a23          	sw	zero,84(sp)

0000bf28 <.LBB100>:
    bf28:	04012823          	sw	zero,80(sp)
    bf2c:	fc9ff06f          	j	bef4 <.L144>

0000bf30 <.L35>:
    bf30:	000087b7          	lui	a5,0x8
    bf34:	04f12e23          	sw	a5,92(sp)
    bf38:	04012c23          	sw	zero,88(sp)
    bf3c:	04012a23          	sw	zero,84(sp)
    bf40:	04012823          	sw	zero,80(sp)

0000bf44 <.LVL270>:
    bf44:	fff78793          	add	a5,a5,-1 # 7fff <.L2+0x7b>
    bf48:	00000913          	li	s2,0
    bf4c:	ce1ff06f          	j	bc2c <.L125>

0000bf50 <__eqtf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__eqtf2 (TFtype a, TFtype b)
{
    bf50:	00c52783          	lw	a5,12(a0)
    bf54:	0005af03          	lw	t5,0(a1)
    bf58:	0045af83          	lw	t6,4(a1)
    bf5c:	0085a283          	lw	t0,8(a1)
    bf60:	00c5a583          	lw	a1,12(a1)

0000bf64 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    bf64:	00008737          	lui	a4,0x8
    bf68:	0107d693          	srl	a3,a5,0x10
    bf6c:	fff70713          	add	a4,a4,-1 # 7fff <.L2+0x7b>
    bf70:	01079813          	sll	a6,a5,0x10

0000bf74 <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    bf74:	01059e93          	sll	t4,a1,0x10

0000bf78 <.LBB5>:
  FP_UNPACK_RAW_Q (A, a);
    bf78:	01f7d613          	srl	a2,a5,0x1f
    bf7c:	00e6f6b3          	and	a3,a3,a4

0000bf80 <.LBB6>:
  FP_UNPACK_RAW_Q (B, b);
    bf80:	0105d793          	srl	a5,a1,0x10

0000bf84 <.LBE6>:
{
    bf84:	00052883          	lw	a7,0(a0)

0000bf88 <.LBB7>:
    bf88:	00452303          	lw	t1,4(a0)

0000bf8c <.LBB8>:
    bf8c:	00852e03          	lw	t3,8(a0)

0000bf90 <.LBB9>:
    bf90:	ff010113          	add	sp,sp,-16

0000bf94 <.LBB10>:
  FP_UNPACK_RAW_Q (A, a);
    bf94:	01085813          	srl	a6,a6,0x10

0000bf98 <.LBB11>:
  FP_UNPACK_RAW_Q (B, b);
    bf98:	010ede93          	srl	t4,t4,0x10

0000bf9c <.LVL5>:
    bf9c:	00e7f7b3          	and	a5,a5,a4
    bfa0:	01f5d593          	srl	a1,a1,0x1f

0000bfa4 <.LBE11>:
  FP_CMP_EQ_Q (r, A, B, 1);
    bfa4:	02e69063          	bne	a3,a4,bfc4 <.L2>
    bfa8:	0068e733          	or	a4,a7,t1
    bfac:	01c76733          	or	a4,a4,t3
    bfb0:	01076733          	or	a4,a4,a6
    bfb4:	00100513          	li	a0,1
    bfb8:	04071a63          	bnez	a4,c00c <.L1>
    bfbc:	04d79863          	bne	a5,a3,c00c <.L1>
    bfc0:	0080006f          	j	bfc8 <.L6>

0000bfc4 <.L2>:
    bfc4:	00e79c63          	bne	a5,a4,bfdc <.L5>

0000bfc8 <.L6>:
    bfc8:	01ff6733          	or	a4,t5,t6
    bfcc:	00576733          	or	a4,a4,t0
    bfd0:	01d76733          	or	a4,a4,t4
    bfd4:	00100513          	li	a0,1
    bfd8:	02071a63          	bnez	a4,c00c <.L1>

0000bfdc <.L5>:
    bfdc:	00100513          	li	a0,1
    bfe0:	02d79663          	bne	a5,a3,c00c <.L1>
    bfe4:	03e89463          	bne	a7,t5,c00c <.L1>
    bfe8:	03f31263          	bne	t1,t6,c00c <.L1>
    bfec:	025e1063          	bne	t3,t0,c00c <.L1>
    bff0:	01d81e63          	bne	a6,t4,c00c <.L1>
    bff4:	02b60063          	beq	a2,a1,c014 <.L14>
    bff8:	00079a63          	bnez	a5,c00c <.L1>
    bffc:	0068e533          	or	a0,a7,t1
    c000:	01c56533          	or	a0,a0,t3
    c004:	01056533          	or	a0,a0,a6
    c008:	00a03533          	snez	a0,a0

0000c00c <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    c00c:	01010113          	add	sp,sp,16
    c010:	00008067          	ret

0000c014 <.L14>:
  FP_CMP_EQ_Q (r, A, B, 1);
    c014:	00000513          	li	a0,0
    c018:	ff5ff06f          	j	c00c <.L1>

0000c01c <__getf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__getf2 (TFtype a, TFtype b)
{
    c01c:	00c52783          	lw	a5,12(a0)
    c020:	00c5a683          	lw	a3,12(a1)

0000c024 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    c024:	00008737          	lui	a4,0x8
    c028:	0107d613          	srl	a2,a5,0x10
    c02c:	fff70713          	add	a4,a4,-1 # 7fff <.L2+0x7b>
    c030:	01079813          	sll	a6,a5,0x10

0000c034 <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    c034:	01069293          	sll	t0,a3,0x10

0000c038 <.LBE4>:
{
    c038:	00052883          	lw	a7,0(a0)

0000c03c <.LBB5>:
    c03c:	00452303          	lw	t1,4(a0)

0000c040 <.LBB6>:
    c040:	00852e03          	lw	t3,8(a0)

0000c044 <.LBB7>:
  FP_UNPACK_RAW_Q (A, a);
    c044:	00e67633          	and	a2,a2,a4

0000c048 <.LBB8>:
  FP_UNPACK_RAW_Q (B, b);
    c048:	0106d513          	srl	a0,a3,0x10

0000c04c <.LBE8>:
{
    c04c:	0005ae83          	lw	t4,0(a1)
    c050:	0045af03          	lw	t5,4(a1)
    c054:	0085af83          	lw	t6,8(a1)
    c058:	ff010113          	add	sp,sp,-16

0000c05c <.LBB9>:
  FP_UNPACK_RAW_Q (A, a);
    c05c:	01085813          	srl	a6,a6,0x10

0000c060 <.LVL4>:
    c060:	01f7d793          	srl	a5,a5,0x1f

0000c064 <.LBB10>:
  FP_UNPACK_RAW_Q (B, b);
    c064:	0102d293          	srl	t0,t0,0x10

0000c068 <.LVL6>:
    c068:	00e57533          	and	a0,a0,a4

0000c06c <.LVL7>:
    c06c:	01f6d693          	srl	a3,a3,0x1f

0000c070 <.LBE10>:
  FP_CMP_Q (r, A, B, -2, 2);
    c070:	00e61a63          	bne	a2,a4,c084 <.L2>
    c074:	01136733          	or	a4,t1,a7
    c078:	01c76733          	or	a4,a4,t3
    c07c:	01076733          	or	a4,a4,a6
    c080:	0a071463          	bnez	a4,c128 <.L17>

0000c084 <.L2>:
    c084:	00008737          	lui	a4,0x8
    c088:	fff70713          	add	a4,a4,-1 # 7fff <.L2+0x7b>
    c08c:	00e51a63          	bne	a0,a4,c0a0 <.L4>
    c090:	01eee733          	or	a4,t4,t5
    c094:	01f76733          	or	a4,a4,t6
    c098:	00576733          	or	a4,a4,t0
    c09c:	08071663          	bnez	a4,c128 <.L17>

0000c0a0 <.L4>:
    c0a0:	00000713          	li	a4,0
    c0a4:	00061a63          	bnez	a2,c0b8 <.L5>
    c0a8:	01136733          	or	a4,t1,a7
    c0ac:	01c76733          	or	a4,a4,t3
    c0b0:	01076733          	or	a4,a4,a6
    c0b4:	00173713          	seqz	a4,a4

0000c0b8 <.L5>:
    c0b8:	06051c63          	bnez	a0,c130 <.L6>
    c0bc:	01eee5b3          	or	a1,t4,t5
    c0c0:	01f5e5b3          	or	a1,a1,t6
    c0c4:	0055e5b3          	or	a1,a1,t0

0000c0c8 <.LVL10>:
    c0c8:	00070c63          	beqz	a4,c0e0 <.L7>
    c0cc:	02058063          	beqz	a1,c0ec <.L1>

0000c0d0 <.L39>:
    c0d0:	00100513          	li	a0,1

0000c0d4 <.LVL12>:
    c0d4:	00069c63          	bnez	a3,c0ec <.L1>

0000c0d8 <.L35>:
    c0d8:	fff00513          	li	a0,-1
    c0dc:	0100006f          	j	c0ec <.L1>

0000c0e0 <.L7>:
    c0e0:	04059a63          	bnez	a1,c134 <.L8>

0000c0e4 <.L12>:
    c0e4:	fff00513          	li	a0,-1

0000c0e8 <.LVL15>:
    c0e8:	04078e63          	beqz	a5,c144 <.L34>

0000c0ec <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    c0ec:	01010113          	add	sp,sp,16
    c0f0:	00008067          	ret

0000c0f4 <.L10>:
  FP_CMP_Q (r, A, B, -2, 2);
    c0f4:	fca64ee3          	blt	a2,a0,c0d0 <.L39>
    c0f8:	ff02e6e3          	bltu	t0,a6,c0e4 <.L12>
    c0fc:	02581063          	bne	a6,t0,c11c <.L13>
    c100:	ffcfe2e3          	bltu	t6,t3,c0e4 <.L12>
    c104:	01fe1c63          	bne	t3,t6,c11c <.L13>
    c108:	fc6f6ee3          	bltu	t5,t1,c0e4 <.L12>
    c10c:	01e31863          	bne	t1,t5,c11c <.L13>
    c110:	fd1eeae3          	bltu	t4,a7,c0e4 <.L12>
    c114:	00000513          	li	a0,0

0000c118 <.LVL18>:
    c118:	fdd8fae3          	bgeu	a7,t4,c0ec <.L1>

0000c11c <.L13>:
    c11c:	00100513          	li	a0,1
    c120:	fc0796e3          	bnez	a5,c0ec <.L1>
    c124:	fb5ff06f          	j	c0d8 <.L35>

0000c128 <.L17>:
    c128:	ffe00513          	li	a0,-2

0000c12c <.LVL20>:
    c12c:	fc1ff06f          	j	c0ec <.L1>

0000c130 <.L6>:
    c130:	fa0710e3          	bnez	a4,c0d0 <.L39>

0000c134 <.L8>:
    c134:	faf698e3          	bne	a3,a5,c0e4 <.L12>
    c138:	fac55ee3          	bge	a0,a2,c0f4 <.L10>
    c13c:	fff00513          	li	a0,-1

0000c140 <.LVL23>:
    c140:	fa0696e3          	bnez	a3,c0ec <.L1>

0000c144 <.L34>:
    c144:	00100513          	li	a0,1
    c148:	fa5ff06f          	j	c0ec <.L1>

0000c14c <__letf2>:
#include "soft-fp.h"
#include "quad.h"

CMPtype
__letf2 (TFtype a, TFtype b)
{
    c14c:	00c52783          	lw	a5,12(a0)
    c150:	00c5a683          	lw	a3,12(a1)

0000c154 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_Q (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    c154:	00008737          	lui	a4,0x8
    c158:	0107d613          	srl	a2,a5,0x10
    c15c:	fff70713          	add	a4,a4,-1 # 7fff <.L2+0x7b>
    c160:	01079813          	sll	a6,a5,0x10

0000c164 <.LBB4>:
  FP_UNPACK_RAW_Q (B, b);
    c164:	01069293          	sll	t0,a3,0x10

0000c168 <.LBE4>:
{
    c168:	00052883          	lw	a7,0(a0)

0000c16c <.LBB5>:
    c16c:	00452303          	lw	t1,4(a0)

0000c170 <.LBB6>:
    c170:	00852e03          	lw	t3,8(a0)

0000c174 <.LBB7>:
  FP_UNPACK_RAW_Q (A, a);
    c174:	00e67633          	and	a2,a2,a4

0000c178 <.LBB8>:
  FP_UNPACK_RAW_Q (B, b);
    c178:	0106d513          	srl	a0,a3,0x10

0000c17c <.LBE8>:
{
    c17c:	0005ae83          	lw	t4,0(a1)
    c180:	0045af03          	lw	t5,4(a1)
    c184:	0085af83          	lw	t6,8(a1)
    c188:	ff010113          	add	sp,sp,-16

0000c18c <.LBB9>:
  FP_UNPACK_RAW_Q (A, a);
    c18c:	01085813          	srl	a6,a6,0x10

0000c190 <.LVL4>:
    c190:	01f7d793          	srl	a5,a5,0x1f

0000c194 <.LBB10>:
  FP_UNPACK_RAW_Q (B, b);
    c194:	0102d293          	srl	t0,t0,0x10

0000c198 <.LVL6>:
    c198:	00e57533          	and	a0,a0,a4

0000c19c <.LVL7>:
    c19c:	01f6d693          	srl	a3,a3,0x1f

0000c1a0 <.LBE10>:
  FP_CMP_Q (r, A, B, 2, 2);
    c1a0:	00e61a63          	bne	a2,a4,c1b4 <.L2>
    c1a4:	01136733          	or	a4,t1,a7
    c1a8:	01c76733          	or	a4,a4,t3
    c1ac:	01076733          	or	a4,a4,a6
    c1b0:	0a071463          	bnez	a4,c258 <.L17>

0000c1b4 <.L2>:
    c1b4:	00008737          	lui	a4,0x8
    c1b8:	fff70713          	add	a4,a4,-1 # 7fff <.L2+0x7b>
    c1bc:	00e51a63          	bne	a0,a4,c1d0 <.L4>
    c1c0:	01eee733          	or	a4,t4,t5
    c1c4:	01f76733          	or	a4,a4,t6
    c1c8:	00576733          	or	a4,a4,t0
    c1cc:	08071663          	bnez	a4,c258 <.L17>

0000c1d0 <.L4>:
    c1d0:	00000713          	li	a4,0
    c1d4:	00061a63          	bnez	a2,c1e8 <.L5>
    c1d8:	01136733          	or	a4,t1,a7
    c1dc:	01c76733          	or	a4,a4,t3
    c1e0:	01076733          	or	a4,a4,a6
    c1e4:	00173713          	seqz	a4,a4

0000c1e8 <.L5>:
    c1e8:	06051c63          	bnez	a0,c260 <.L6>
    c1ec:	01eee5b3          	or	a1,t4,t5
    c1f0:	01f5e5b3          	or	a1,a1,t6
    c1f4:	0055e5b3          	or	a1,a1,t0

0000c1f8 <.LVL10>:
    c1f8:	00070c63          	beqz	a4,c210 <.L7>
    c1fc:	02058063          	beqz	a1,c21c <.L1>

0000c200 <.L39>:
    c200:	00100513          	li	a0,1

0000c204 <.LVL12>:
    c204:	00069c63          	bnez	a3,c21c <.L1>

0000c208 <.L35>:
    c208:	fff00513          	li	a0,-1
    c20c:	0100006f          	j	c21c <.L1>

0000c210 <.L7>:
    c210:	04059a63          	bnez	a1,c264 <.L8>

0000c214 <.L12>:
    c214:	fff00513          	li	a0,-1

0000c218 <.LVL15>:
    c218:	04078e63          	beqz	a5,c274 <.L34>

0000c21c <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    c21c:	01010113          	add	sp,sp,16
    c220:	00008067          	ret

0000c224 <.L10>:
  FP_CMP_Q (r, A, B, 2, 2);
    c224:	fca64ee3          	blt	a2,a0,c200 <.L39>
    c228:	ff02e6e3          	bltu	t0,a6,c214 <.L12>
    c22c:	02581063          	bne	a6,t0,c24c <.L13>
    c230:	ffcfe2e3          	bltu	t6,t3,c214 <.L12>
    c234:	01fe1c63          	bne	t3,t6,c24c <.L13>
    c238:	fc6f6ee3          	bltu	t5,t1,c214 <.L12>
    c23c:	01e31863          	bne	t1,t5,c24c <.L13>
    c240:	fd1eeae3          	bltu	t4,a7,c214 <.L12>
    c244:	00000513          	li	a0,0

0000c248 <.LVL18>:
    c248:	fdd8fae3          	bgeu	a7,t4,c21c <.L1>

0000c24c <.L13>:
    c24c:	00100513          	li	a0,1
    c250:	fc0796e3          	bnez	a5,c21c <.L1>
    c254:	fb5ff06f          	j	c208 <.L35>

0000c258 <.L17>:
    c258:	00200513          	li	a0,2

0000c25c <.LVL20>:
    c25c:	fc1ff06f          	j	c21c <.L1>

0000c260 <.L6>:
    c260:	fa0710e3          	bnez	a4,c200 <.L39>

0000c264 <.L8>:
    c264:	faf698e3          	bne	a3,a5,c214 <.L12>
    c268:	fac55ee3          	bge	a0,a2,c224 <.L10>
    c26c:	fff00513          	li	a0,-1

0000c270 <.LVL23>:
    c270:	fa0696e3          	bnez	a3,c21c <.L1>

0000c274 <.L34>:
    c274:	00100513          	li	a0,1
    c278:	fa5ff06f          	j	c21c <.L1>

0000c27c <__multf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__multf3 (TFtype a, TFtype b)
{
    c27c:	f5010113          	add	sp,sp,-176
    c280:	09412c23          	sw	s4,152(sp)
    c284:	00c5aa03          	lw	s4,12(a1)
    c288:	0005a783          	lw	a5,0(a1)
    c28c:	0085a683          	lw	a3,8(a1)
    c290:	0a812423          	sw	s0,168(sp)
    c294:	00050413          	mv	s0,a0
    c298:	0045a503          	lw	a0,4(a1)

0000c29c <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_Q (A, a);
    c29c:	010a1713          	sll	a4,s4,0x10

0000c2a0 <.LBE3>:
{
    c2a0:	0b212023          	sw	s2,160(sp)
    c2a4:	09312e23          	sw	s3,156(sp)
    c2a8:	00062903          	lw	s2,0(a2)
    c2ac:	00c62983          	lw	s3,12(a2)
    c2b0:	09512a23          	sw	s5,148(sp)
    c2b4:	09612823          	sw	s6,144(sp)
    c2b8:	00862a83          	lw	s5,8(a2)
    c2bc:	00462b03          	lw	s6,4(a2)

0000c2c0 <.LBB4>:
  FP_UNPACK_Q (A, a);
    c2c0:	00008637          	lui	a2,0x8

0000c2c4 <.LBE4>:
{
    c2c4:	0a912223          	sw	s1,164(sp)

0000c2c8 <.LBB5>:
  FP_UNPACK_Q (A, a);
    c2c8:	01075713          	srl	a4,a4,0x10
    c2cc:	010a5493          	srl	s1,s4,0x10
    c2d0:	fff60613          	add	a2,a2,-1 # 7fff <.L2+0x7b>
    c2d4:	05412e23          	sw	s4,92(sp)

0000c2d8 <.LBE5>:
{
    c2d8:	0a112623          	sw	ra,172(sp)
    c2dc:	09712623          	sw	s7,140(sp)
    c2e0:	09812423          	sw	s8,136(sp)
    c2e4:	09912223          	sw	s9,132(sp)
    c2e8:	09a12023          	sw	s10,128(sp)
    c2ec:	07b12e23          	sw	s11,124(sp)

0000c2f0 <.LBB6>:
  FP_UNPACK_Q (A, a);
    c2f0:	04f12823          	sw	a5,80(sp)
    c2f4:	04a12a23          	sw	a0,84(sp)
    c2f8:	04d12c23          	sw	a3,88(sp)
    c2fc:	02f12023          	sw	a5,32(sp)
    c300:	02a12223          	sw	a0,36(sp)
    c304:	02d12423          	sw	a3,40(sp)
    c308:	02e12623          	sw	a4,44(sp)
    c30c:	00c4f4b3          	and	s1,s1,a2

0000c310 <.LVL2>:
    c310:	01fa5a13          	srl	s4,s4,0x1f

0000c314 <.LBE6>:
    c314:	080482e3          	beqz	s1,cb98 <.L2>
    c318:	1ac48ce3          	beq	s1,a2,ccd0 <.L3>
    c31c:	000106b7          	lui	a3,0x10
    c320:	00d76733          	or	a4,a4,a3
    c324:	02e12623          	sw	a4,44(sp)

0000c328 <.LBB7>:
    c328:	02010593          	add	a1,sp,32
    c32c:	02c10713          	add	a4,sp,44

0000c330 <.L4>:
    c330:	00072683          	lw	a3,0(a4)
    c334:	ffc72603          	lw	a2,-4(a4)
    c338:	ffc70713          	add	a4,a4,-4
    c33c:	00369693          	sll	a3,a3,0x3
    c340:	01d65613          	srl	a2,a2,0x1d
    c344:	00c6e6b3          	or	a3,a3,a2
    c348:	00d72223          	sw	a3,4(a4)
    c34c:	fee592e3          	bne	a1,a4,c330 <.L4>

0000c350 <.LVL6>:
    c350:	00379793          	sll	a5,a5,0x3
    c354:	02f12023          	sw	a5,32(sp)

0000c358 <.LBE7>:
    c358:	ffffc7b7          	lui	a5,0xffffc
    c35c:	00178793          	add	a5,a5,1 # ffffc001 <_ebss+0xfffe5cd1>
    c360:	00f484b3          	add	s1,s1,a5

0000c364 <.L209>:
    c364:	00000b93          	li	s7,0

0000c368 <.L5>:
  FP_UNPACK_Q (B, b);
    c368:	01099513          	sll	a0,s3,0x10
    c36c:	00008737          	lui	a4,0x8
    c370:	0109d793          	srl	a5,s3,0x10
    c374:	01055513          	srl	a0,a0,0x10
    c378:	fff70713          	add	a4,a4,-1 # 7fff <.L2+0x7b>
    c37c:	05312e23          	sw	s3,92(sp)
    c380:	05212823          	sw	s2,80(sp)
    c384:	05612a23          	sw	s6,84(sp)
    c388:	05512c23          	sw	s5,88(sp)
    c38c:	03212823          	sw	s2,48(sp)
    c390:	03612a23          	sw	s6,52(sp)
    c394:	03512c23          	sw	s5,56(sp)
    c398:	02a12e23          	sw	a0,60(sp)
    c39c:	00e7f7b3          	and	a5,a5,a4

0000c3a0 <.LVL9>:
    c3a0:	01f9d993          	srl	s3,s3,0x1f

0000c3a4 <.LBE11>:
    c3a4:	14078ae3          	beqz	a5,ccf8 <.L18>
    c3a8:	28e784e3          	beq	a5,a4,ce30 <.L19>
    c3ac:	00010737          	lui	a4,0x10
    c3b0:	00e56533          	or	a0,a0,a4
    c3b4:	02a12e23          	sw	a0,60(sp)

0000c3b8 <.LBB12>:
    c3b8:	03010593          	add	a1,sp,48
    c3bc:	03c10713          	add	a4,sp,60

0000c3c0 <.L20>:
    c3c0:	00072683          	lw	a3,0(a4) # 10000 <.LBE204>
    c3c4:	ffc72603          	lw	a2,-4(a4)
    c3c8:	ffc70713          	add	a4,a4,-4
    c3cc:	00369693          	sll	a3,a3,0x3
    c3d0:	01d65613          	srl	a2,a2,0x1d
    c3d4:	00c6e6b3          	or	a3,a3,a2
    c3d8:	00d72223          	sw	a3,4(a4)
    c3dc:	fee592e3          	bne	a1,a4,c3c0 <.L20>

0000c3e0 <.LBE12>:
    c3e0:	ffffc737          	lui	a4,0xffffc

0000c3e4 <.LBB13>:
    c3e4:	00391913          	sll	s2,s2,0x3

0000c3e8 <.LBE13>:
    c3e8:	00170713          	add	a4,a4,1 # ffffc001 <_ebss+0xfffe5cd1>

0000c3ec <.LBB14>:
    c3ec:	03212823          	sw	s2,48(sp)

0000c3f0 <.LBE14>:
    c3f0:	00e787b3          	add	a5,a5,a4

0000c3f4 <.L210>:
    c3f4:	00000693          	li	a3,0

0000c3f8 <.L21>:
  FP_MUL_Q (R, A, B);
    c3f8:	009787b3          	add	a5,a5,s1

0000c3fc <.LVL16>:
    c3fc:	00f12623          	sw	a5,12(sp)
    c400:	00178793          	add	a5,a5,1
    c404:	00f12423          	sw	a5,8(sp)

0000c408 <.LVL17>:
    c408:	002b9793          	sll	a5,s7,0x2

0000c40c <.LVL18>:
    c40c:	00d7e7b3          	or	a5,a5,a3
    c410:	00a00713          	li	a4,10
    c414:	28f742e3          	blt	a4,a5,ce98 <.L34>
    c418:	013a4733          	xor	a4,s4,s3
    c41c:	00e12223          	sw	a4,4(sp)
    c420:	00200713          	li	a4,2
    c424:	22f74ae3          	blt	a4,a5,ce58 <.L35>
    c428:	fff78793          	add	a5,a5,-1
    c42c:	00100713          	li	a4,1
    c430:	28f770e3          	bgeu	a4,a5,ceb0 <.L37>

0000c434 <.L36>:
    c434:	02012883          	lw	a7,32(sp)

0000c438 <.LVL20>:
    c438:	03012f03          	lw	t5,48(sp)
    c43c:	000105b7          	lui	a1,0x10
    c440:	fff58713          	add	a4,a1,-1 # ffff <.LBB204+0xb>
    c444:	0108d913          	srl	s2,a7,0x10

0000c448 <.LVL21>:
    c448:	010f5493          	srl	s1,t5,0x10

0000c44c <.LVL22>:
    c44c:	00e8f8b3          	and	a7,a7,a4

0000c450 <.LVL23>:
    c450:	00ef7f33          	and	t5,t5,a4

0000c454 <.LVL24>:
    c454:	031f0633          	mul	a2,t5,a7

0000c458 <.LVL25>:
    c458:	03e90533          	mul	a0,s2,t5

0000c45c <.LVL26>:
    c45c:	01065793          	srl	a5,a2,0x10
    c460:	031486b3          	mul	a3,s1,a7

0000c464 <.LVL27>:
    c464:	00a686b3          	add	a3,a3,a0

0000c468 <.LVL28>:
    c468:	00d787b3          	add	a5,a5,a3
    c46c:	02990bb3          	mul	s7,s2,s1

0000c470 <.LVL29>:
    c470:	00a7f463          	bgeu	a5,a0,c478 <.L42>
    c474:	00bb8bb3          	add	s7,s7,a1

0000c478 <.L42>:
    c478:	03412e83          	lw	t4,52(sp)

0000c47c <.LBB22>:
    c47c:	0107d693          	srl	a3,a5,0x10
    c480:	00e7f7b3          	and	a5,a5,a4

0000c484 <.LVL31>:
    c484:	00e67633          	and	a2,a2,a4

0000c488 <.LVL32>:
    c488:	01079793          	sll	a5,a5,0x10
    c48c:	00c787b3          	add	a5,a5,a2

0000c490 <.LBB23>:
    c490:	010ed293          	srl	t0,t4,0x10
    c494:	00eefeb3          	and	t4,t4,a4
    c498:	03d90633          	mul	a2,s2,t4

0000c49c <.LBB24>:
    c49c:	00f12823          	sw	a5,16(sp)
    c4a0:	04f12823          	sw	a5,80(sp)

0000c4a4 <.LBB25>:
    c4a4:	03128733          	mul	a4,t0,a7
    c4a8:	031e87b3          	mul	a5,t4,a7

0000c4ac <.LVL34>:
    c4ac:	00c70733          	add	a4,a4,a2

0000c4b0 <.LVL35>:
    c4b0:	0107d313          	srl	t1,a5,0x10
    c4b4:	00e30333          	add	t1,t1,a4
    c4b8:	02590b33          	mul	s6,s2,t0

0000c4bc <.LVL36>:
    c4bc:	00c37663          	bgeu	t1,a2,c4c8 <.L43>
    c4c0:	00010737          	lui	a4,0x10
    c4c4:	00eb0b33          	add	s6,s6,a4

0000c4c8 <.L43>:
    c4c8:	02412803          	lw	a6,36(sp)

0000c4cc <.LBB27>:
    c4cc:	00010737          	lui	a4,0x10
    c4d0:	fff70613          	add	a2,a4,-1 # ffff <.LBB204+0xb>

0000c4d4 <.LVL38>:
    c4d4:	01035513          	srl	a0,t1,0x10

0000c4d8 <.LVL39>:
    c4d8:	00c37333          	and	t1,t1,a2

0000c4dc <.LVL40>:
    c4dc:	00c7f7b3          	and	a5,a5,a2

0000c4e0 <.LBB28>:
    c4e0:	01085393          	srl	t2,a6,0x10

0000c4e4 <.LBB29>:
    c4e4:	01031313          	sll	t1,t1,0x10
    c4e8:	00c87833          	and	a6,a6,a2
    c4ec:	00f30333          	add	t1,t1,a5

0000c4f0 <.LBB30>:
    c4f0:	03e38fb3          	mul	t6,t2,t5
    c4f4:	006686b3          	add	a3,a3,t1

0000c4f8 <.LBB31>:
    c4f8:	03e807b3          	mul	a5,a6,t5

0000c4fc <.LVL43>:
    c4fc:	03048e33          	mul	t3,s1,a6

0000c500 <.LVL44>:
    c500:	0107d613          	srl	a2,a5,0x10
    c504:	01fe0e33          	add	t3,t3,t6

0000c508 <.LVL45>:
    c508:	01c60633          	add	a2,a2,t3
    c50c:	027485b3          	mul	a1,s1,t2

0000c510 <.LVL46>:
    c510:	01f67463          	bgeu	a2,t6,c518 <.L44>
    c514:	00e585b3          	add	a1,a1,a4

0000c518 <.L44>:
    c518:	01065a93          	srl	s5,a2,0x10
    c51c:	00010737          	lui	a4,0x10
    c520:	00ba8ab3          	add	s5,s5,a1

0000c524 <.LVL48>:
    c524:	fff70593          	add	a1,a4,-1 # ffff <.LBB204+0xb>

0000c528 <.LVL49>:
    c528:	00b7f7b3          	and	a5,a5,a1

0000c52c <.LVL50>:
    c52c:	00b67633          	and	a2,a2,a1

0000c530 <.LVL51>:
    c530:	01061613          	sll	a2,a2,0x10

0000c534 <.LBB32>:
    c534:	030e85b3          	mul	a1,t4,a6

0000c538 <.LBB33>:
    c538:	00f60633          	add	a2,a2,a5

0000c53c <.LBB34>:
    c53c:	03d38fb3          	mul	t6,t2,t4

0000c540 <.LVL53>:
    c540:	0105d793          	srl	a5,a1,0x10
    c544:	03028e33          	mul	t3,t0,a6

0000c548 <.LVL54>:
    c548:	01fe0e33          	add	t3,t3,t6

0000c54c <.LVL55>:
    c54c:	01c787b3          	add	a5,a5,t3
    c550:	027289b3          	mul	s3,t0,t2

0000c554 <.LVL56>:
    c554:	01f7f463          	bgeu	a5,t6,c55c <.L45>
    c558:	00e989b3          	add	s3,s3,a4

0000c55c <.L45>:
    c55c:	0107d713          	srl	a4,a5,0x10
    c560:	01370733          	add	a4,a4,s3
    c564:	00010a37          	lui	s4,0x10

0000c568 <.LVL58>:
    c568:	00e12a23          	sw	a4,20(sp)

0000c56c <.LVL59>:
    c56c:	fffa0713          	add	a4,s4,-1 # ffff <.LBB204+0xb>

0000c570 <.LBB35>:
    c570:	03812e03          	lw	t3,56(sp)

0000c574 <.LBB36>:
    c574:	00e7f7b3          	and	a5,a5,a4

0000c578 <.LVL61>:
    c578:	00e5f5b3          	and	a1,a1,a4

0000c57c <.LVL62>:
    c57c:	01079793          	sll	a5,a5,0x10
    c580:	00b787b3          	add	a5,a5,a1
    c584:	00f12c23          	sw	a5,24(sp)

0000c588 <.LBB37>:
    c588:	010e5793          	srl	a5,t3,0x10

0000c58c <.LVL64>:
    c58c:	00ee7e33          	and	t3,t3,a4

0000c590 <.LVL65>:
    c590:	031e05b3          	mul	a1,t3,a7

0000c594 <.LVL66>:
    c594:	03c90c33          	mul	s8,s2,t3

0000c598 <.LVL67>:
    c598:	0105d713          	srl	a4,a1,0x10
    c59c:	031789b3          	mul	s3,a5,a7

0000c5a0 <.LVL68>:
    c5a0:	018989b3          	add	s3,s3,s8

0000c5a4 <.LVL69>:
    c5a4:	01370733          	add	a4,a4,s3
    c5a8:	02f90fb3          	mul	t6,s2,a5

0000c5ac <.LVL70>:
    c5ac:	01877463          	bgeu	a4,s8,c5b4 <.L46>
    c5b0:	014f8fb3          	add	t6,t6,s4

0000c5b4 <.L46>:
    c5b4:	01075993          	srl	s3,a4,0x10
    c5b8:	00010cb7          	lui	s9,0x10
    c5bc:	01f98fb3          	add	t6,s3,t6

0000c5c0 <.LVL72>:
    c5c0:	fffc8993          	add	s3,s9,-1 # ffff <.LBB204+0xb>
    c5c4:	01377733          	and	a4,a4,s3

0000c5c8 <.LVL73>:
    c5c8:	0135f5b3          	and	a1,a1,s3

0000c5cc <.LVL74>:
    c5cc:	01071713          	sll	a4,a4,0x10
    c5d0:	00b70733          	add	a4,a4,a1

0000c5d4 <.LBB38>:
    c5d4:	02812583          	lw	a1,40(sp)

0000c5d8 <.LBB39>:
    c5d8:	01f12e23          	sw	t6,28(sp)

0000c5dc <.LBB40>:
    c5dc:	0105df93          	srl	t6,a1,0x10

0000c5e0 <.LVL76>:
    c5e0:	0135f5b3          	and	a1,a1,s3

0000c5e4 <.LVL77>:
    c5e4:	03e58a33          	mul	s4,a1,t5

0000c5e8 <.LVL78>:
    c5e8:	03ef8d33          	mul	s10,t6,t5

0000c5ec <.LVL79>:
    c5ec:	010a5d93          	srl	s11,s4,0x10
    c5f0:	02b489b3          	mul	s3,s1,a1

0000c5f4 <.LVL80>:
    c5f4:	01a989b3          	add	s3,s3,s10

0000c5f8 <.LVL81>:
    c5f8:	013d89b3          	add	s3,s11,s3
    c5fc:	03f48c33          	mul	s8,s1,t6

0000c600 <.LVL82>:
    c600:	01a9f463          	bgeu	s3,s10,c608 <.L47>
    c604:	019c0c33          	add	s8,s8,s9

0000c608 <.L47>:
    c608:	00db86b3          	add	a3,s7,a3
    c60c:	0066b333          	sltu	t1,a3,t1

0000c610 <.LBB42>:
    c610:	0109dd13          	srl	s10,s3,0x10

0000c614 <.LBB43>:
    c614:	00650533          	add	a0,a0,t1

0000c618 <.LBB44>:
    c618:	00010cb7          	lui	s9,0x10

0000c61c <.LBB45>:
    c61c:	01650533          	add	a0,a0,s6

0000c620 <.LBB46>:
    c620:	018d0d33          	add	s10,s10,s8

0000c624 <.LVL87>:
    c624:	00c68633          	add	a2,a3,a2

0000c628 <.LVL88>:
    c628:	fffc8c13          	add	s8,s9,-1 # ffff <.LBB204+0xb>

0000c62c <.LVL89>:
    c62c:	01550ab3          	add	s5,a0,s5

0000c630 <.LVL90>:
    c630:	0189f9b3          	and	s3,s3,s8

0000c634 <.LBB47>:
    c634:	00d636b3          	sltu	a3,a2,a3
    c638:	00da86b3          	add	a3,s5,a3

0000c63c <.LBB48>:
    c63c:	01099993          	sll	s3,s3,0x10
    c640:	018a7a33          	and	s4,s4,s8

0000c644 <.LVL92>:
    c644:	01498a33          	add	s4,s3,s4

0000c648 <.LBB49>:
    c648:	00aab9b3          	sltu	s3,s5,a0
    c64c:	0156bab3          	sltu	s5,a3,s5
    c650:	0159e9b3          	or	s3,s3,s5

0000c654 <.LBB51>:
    c654:	00653533          	sltu	a0,a0,t1

0000c658 <.LBB52>:
    c658:	00a98533          	add	a0,s3,a0
    c65c:	01812303          	lw	t1,24(sp)

0000c660 <.LVL95>:
    c660:	01412983          	lw	s3,20(sp)
    c664:	04c12a23          	sw	a2,84(sp)

0000c668 <.LBB53>:
    c668:	00668333          	add	t1,a3,t1

0000c66c <.LVL97>:
    c66c:	01350ab3          	add	s5,a0,s3

0000c670 <.LVL98>:
    c670:	01c12983          	lw	s3,28(sp)
    c674:	00d336b3          	sltu	a3,t1,a3

0000c678 <.LVL99>:
    c678:	00da86b3          	add	a3,s5,a3

0000c67c <.LBB54>:
    c67c:	00e30733          	add	a4,t1,a4

0000c680 <.LVL101>:
    c680:	01368b33          	add	s6,a3,s3

0000c684 <.LVL102>:
    c684:	00673333          	sltu	t1,a4,t1

0000c688 <.LVL103>:
    c688:	006b0333          	add	t1,s6,t1

0000c68c <.LVL104>:
    c68c:	01470a33          	add	s4,a4,s4

0000c690 <.LVL105>:
    c690:	01a30d33          	add	s10,t1,s10

0000c694 <.LBB55>:
    c694:	00ea3733          	sltu	a4,s4,a4

0000c698 <.LBB56>:
    c698:	00aab533          	sltu	a0,s5,a0

0000c69c <.LVL107>:
    c69c:	00ed0733          	add	a4,s10,a4
    c6a0:	0156bab3          	sltu	s5,a3,s5

0000c6a4 <.LBB57>:
    c6a4:	00db36b3          	sltu	a3,s6,a3

0000c6a8 <.LVL109>:
    c6a8:	01633b33          	sltu	s6,t1,s6

0000c6ac <.LVL110>:
    c6ac:	0166e6b3          	or	a3,a3,s6

0000c6b0 <.LBB58>:
    c6b0:	006d39b3          	sltu	s3,s10,t1

0000c6b4 <.LBB59>:
    c6b4:	01556ab3          	or	s5,a0,s5

0000c6b8 <.LBB60>:
    c6b8:	01a73d33          	sltu	s10,a4,s10

0000c6bc <.LBB61>:
    c6bc:	00da8ab3          	add	s5,s5,a3

0000c6c0 <.LBB62>:
    c6c0:	01a9e9b3          	or	s3,s3,s10
    c6c4:	015989b3          	add	s3,s3,s5

0000c6c8 <.LBB63>:
    c6c8:	03c12a83          	lw	s5,60(sp)

0000c6cc <.LBB64>:
    c6cc:	05412c23          	sw	s4,88(sp)

0000c6d0 <.LBB65>:
    c6d0:	010adb13          	srl	s6,s5,0x10

0000c6d4 <.LVL114>:
    c6d4:	018afab3          	and	s5,s5,s8

0000c6d8 <.LVL115>:
    c6d8:	031a86b3          	mul	a3,s5,a7

0000c6dc <.LVL116>:
    c6dc:	03590533          	mul	a0,s2,s5

0000c6e0 <.LVL117>:
    c6e0:	031b08b3          	mul	a7,s6,a7

0000c6e4 <.LVL118>:
    c6e4:	00a88333          	add	t1,a7,a0
    c6e8:	0106d893          	srl	a7,a3,0x10

0000c6ec <.LVL119>:
    c6ec:	006888b3          	add	a7,a7,t1
    c6f0:	03690933          	mul	s2,s2,s6

0000c6f4 <.LVL120>:
    c6f4:	00a8f463          	bgeu	a7,a0,c6fc <.L72>
    c6f8:	01990933          	add	s2,s2,s9

0000c6fc <.L72>:
    c6fc:	02c12b83          	lw	s7,44(sp)

0000c700 <.LBB67>:
    c700:	0108d513          	srl	a0,a7,0x10

0000c704 <.LVL123>:
    c704:	01250533          	add	a0,a0,s2
    c708:	00010c37          	lui	s8,0x10
    c70c:	00a12a23          	sw	a0,20(sp)

0000c710 <.LVL124>:
    c710:	fffc0513          	add	a0,s8,-1 # ffff <.LBB204+0xb>

0000c714 <.LBB68>:
    c714:	010bd913          	srl	s2,s7,0x10

0000c718 <.LVL126>:
    c718:	00abfbb3          	and	s7,s7,a0

0000c71c <.LBB69>:
    c71c:	00a6f6b3          	and	a3,a3,a0

0000c720 <.LVL127>:
    c720:	00a8f8b3          	and	a7,a7,a0

0000c724 <.LBB70>:
    c724:	03248333          	mul	t1,s1,s2

0000c728 <.LBB71>:
    c728:	01089893          	sll	a7,a7,0x10
    c72c:	00d888b3          	add	a7,a7,a3

0000c730 <.LBB72>:
    c730:	03eb8533          	mul	a0,s7,t5

0000c734 <.LVL131>:
    c734:	037484b3          	mul	s1,s1,s7

0000c738 <.LVL132>:
    c738:	01055693          	srl	a3,a0,0x10
    c73c:	03e90f33          	mul	t5,s2,t5

0000c740 <.LVL133>:
    c740:	01e484b3          	add	s1,s1,t5

0000c744 <.LVL134>:
    c744:	009686b3          	add	a3,a3,s1

0000c748 <.LVL135>:
    c748:	01e6f463          	bgeu	a3,t5,c750 <.L73>
    c74c:	01830333          	add	t1,t1,s8

0000c750 <.L73>:
    c750:	0106df13          	srl	t5,a3,0x10

0000c754 <.LVL137>:
    c754:	006f0333          	add	t1,t5,t1

0000c758 <.LVL138>:
    c758:	00010cb7          	lui	s9,0x10

0000c75c <.LVL139>:
    c75c:	00612c23          	sw	t1,24(sp)

0000c760 <.LVL140>:
    c760:	fffc8313          	add	t1,s9,-1 # ffff <.LBB204+0xb>

0000c764 <.LVL141>:
    c764:	00657533          	and	a0,a0,t1

0000c768 <.LVL142>:
    c768:	0066f6b3          	and	a3,a3,t1

0000c76c <.LBB73>:
    c76c:	03c38f33          	mul	t5,t2,t3

0000c770 <.LBB74>:
    c770:	01069693          	sll	a3,a3,0x10
    c774:	00a686b3          	add	a3,a3,a0

0000c778 <.LBB75>:
    c778:	03c80333          	mul	t1,a6,t3

0000c77c <.LVL145>:
    c77c:	030784b3          	mul	s1,a5,a6

0000c780 <.LVL146>:
    c780:	01035513          	srl	a0,t1,0x10
    c784:	01e484b3          	add	s1,s1,t5

0000c788 <.LVL147>:
    c788:	00950533          	add	a0,a0,s1
    c78c:	02f38c33          	mul	s8,t2,a5

0000c790 <.LVL148>:
    c790:	01e57463          	bgeu	a0,t5,c798 <.L74>
    c794:	019c0c33          	add	s8,s8,s9

0000c798 <.L74>:
    c798:	00010d37          	lui	s10,0x10
    c79c:	fffd0f13          	add	t5,s10,-1 # ffff <.LBB204+0xb>
    c7a0:	01055493          	srl	s1,a0,0x10
    c7a4:	01e57533          	and	a0,a0,t5

0000c7a8 <.LVL150>:
    c7a8:	01e37333          	and	t1,t1,t5

0000c7ac <.LVL151>:
    c7ac:	01051513          	sll	a0,a0,0x10
    c7b0:	018484b3          	add	s1,s1,s8

0000c7b4 <.LBB76>:
    c7b4:	02b28f33          	mul	t5,t0,a1

0000c7b8 <.LBB77>:
    c7b8:	00650533          	add	a0,a0,t1

0000c7bc <.LBB78>:
    c7bc:	03df8c33          	mul	s8,t6,t4

0000c7c0 <.LVL154>:
    c7c0:	02be8333          	mul	t1,t4,a1

0000c7c4 <.LVL155>:
    c7c4:	018f0f33          	add	t5,t5,s8

0000c7c8 <.LVL156>:
    c7c8:	01035d93          	srl	s11,t1,0x10

0000c7cc <.LVL157>:
    c7cc:	01ed8f33          	add	t5,s11,t5
    c7d0:	03f28cb3          	mul	s9,t0,t6

0000c7d4 <.LVL158>:
    c7d4:	018f7463          	bgeu	t5,s8,c7dc <.L75>
    c7d8:	01ac8cb3          	add	s9,s9,s10

0000c7dc <.L75>:
    c7dc:	010f5c13          	srl	s8,t5,0x10
    c7e0:	019c0c33          	add	s8,s8,s9

0000c7e4 <.LVL160>:
    c7e4:	00010cb7          	lui	s9,0x10

0000c7e8 <.LVL161>:
    c7e8:	fffc8d13          	add	s10,s9,-1 # ffff <.LBB204+0xb>

0000c7ec <.LVL162>:
    c7ec:	01af7f33          	and	t5,t5,s10

0000c7f0 <.LVL163>:
    c7f0:	010f1f13          	sll	t5,t5,0x10
    c7f4:	01a37333          	and	t1,t1,s10

0000c7f8 <.LVL164>:
    c7f8:	006f0333          	add	t1,t5,t1

0000c7fc <.LBB79>:
    c7fc:	01412f03          	lw	t5,20(sp)
    c800:	011708b3          	add	a7,a4,a7

0000c804 <.LVL166>:
    c804:	01812d03          	lw	s10,24(sp)

0000c808 <.LVL167>:
    c808:	01e98f33          	add	t5,s3,t5

0000c80c <.LVL168>:
    c80c:	00e8b733          	sltu	a4,a7,a4

0000c810 <.LVL169>:
    c810:	00ef0733          	add	a4,t5,a4

0000c814 <.LBB80>:
    c814:	00d886b3          	add	a3,a7,a3

0000c818 <.LVL171>:
    c818:	01a70d33          	add	s10,a4,s10

0000c81c <.LVL172>:
    c81c:	0116b8b3          	sltu	a7,a3,a7

0000c820 <.LVL173>:
    c820:	011d08b3          	add	a7,s10,a7

0000c824 <.LVL174>:
    c824:	00a68533          	add	a0,a3,a0

0000c828 <.LVL175>:
    c828:	009884b3          	add	s1,a7,s1

0000c82c <.LBB81>:
    c82c:	00d536b3          	sltu	a3,a0,a3
    c830:	00d486b3          	add	a3,s1,a3

0000c834 <.LBB82>:
    c834:	013f39b3          	sltu	s3,t5,s3

0000c838 <.LVL177>:
    c838:	01e73f33          	sltu	t5,a4,t5

0000c83c <.LBB83>:
    c83c:	00ed3733          	sltu	a4,s10,a4

0000c840 <.LVL179>:
    c840:	01a8bd33          	sltu	s10,a7,s10

0000c844 <.LBB84>:
    c844:	01e9ef33          	or	t5,s3,t5

0000c848 <.LBB85>:
    c848:	0114b8b3          	sltu	a7,s1,a7

0000c84c <.LBB86>:
    c84c:	01a76733          	or	a4,a4,s10

0000c850 <.LBB87>:
    c850:	0096b4b3          	sltu	s1,a3,s1
    c854:	01868c33          	add	s8,a3,s8

0000c858 <.LBB88>:
    c858:	00ef0733          	add	a4,t5,a4

0000c85c <.LBB89>:
    c85c:	0098e8b3          	or	a7,a7,s1
    c860:	00e884b3          	add	s1,a7,a4

0000c864 <.LBB90>:
    c864:	03cf8f33          	mul	t5,t6,t3

0000c868 <.LBB92>:
    c868:	00dc38b3          	sltu	a7,s8,a3
    c86c:	00650333          	add	t1,a0,t1

0000c870 <.LVL185>:
    c870:	00a33533          	sltu	a0,t1,a0
    c874:	00ac0533          	add	a0,s8,a0
    c878:	01853c33          	sltu	s8,a0,s8
    c87c:	0188e8b3          	or	a7,a7,s8
    c880:	04612e23          	sw	t1,92(sp)
    c884:	009888b3          	add	a7,a7,s1

0000c888 <.LBB93>:
    c888:	02be06b3          	mul	a3,t3,a1

0000c88c <.LVL188>:
    c88c:	02b789b3          	mul	s3,a5,a1

0000c890 <.LVL189>:
    c890:	0106d713          	srl	a4,a3,0x10
    c894:	01e989b3          	add	s3,s3,t5

0000c898 <.LVL190>:
    c898:	01370733          	add	a4,a4,s3
    c89c:	03f784b3          	mul	s1,a5,t6

0000c8a0 <.LVL191>:
    c8a0:	01e77463          	bgeu	a4,t5,c8a8 <.L100>
    c8a4:	019484b3          	add	s1,s1,s9

0000c8a8 <.L100>:
    c8a8:	01075f13          	srl	t5,a4,0x10
    c8ac:	009f0f33          	add	t5,t5,s1

0000c8b0 <.LVL193>:
    c8b0:	000104b7          	lui	s1,0x10

0000c8b4 <.LVL194>:
    c8b4:	fff48993          	add	s3,s1,-1 # ffff <.LBB204+0xb>
    c8b8:	01377733          	and	a4,a4,s3

0000c8bc <.LVL195>:
    c8bc:	0136f6b3          	and	a3,a3,s3

0000c8c0 <.LVL196>:
    c8c0:	01071713          	sll	a4,a4,0x10

0000c8c4 <.LBB94>:
    c8c4:	035389b3          	mul	s3,t2,s5

0000c8c8 <.LBB95>:
    c8c8:	00d70733          	add	a4,a4,a3

0000c8cc <.LBB96>:
    c8cc:	030a86b3          	mul	a3,s5,a6

0000c8d0 <.LVL198>:
    c8d0:	030b0833          	mul	a6,s6,a6

0000c8d4 <.LVL199>:
    c8d4:	01380c33          	add	s8,a6,s3
    c8d8:	0106d813          	srl	a6,a3,0x10

0000c8dc <.LVL200>:
    c8dc:	01880833          	add	a6,a6,s8
    c8e0:	036383b3          	mul	t2,t2,s6

0000c8e4 <.LVL201>:
    c8e4:	01387463          	bgeu	a6,s3,c8ec <.L101>
    c8e8:	009383b3          	add	t2,t2,s1

0000c8ec <.L101>:
    c8ec:	01085493          	srl	s1,a6,0x10
    c8f0:	00010c37          	lui	s8,0x10
    c8f4:	007483b3          	add	t2,s1,t2

0000c8f8 <.LVL203>:
    c8f8:	fffc0493          	add	s1,s8,-1 # ffff <.LBB204+0xb>
    c8fc:	0096f6b3          	and	a3,a3,s1

0000c900 <.LVL204>:
    c900:	00987833          	and	a6,a6,s1

0000c904 <.LVL205>:
    c904:	01081813          	sll	a6,a6,0x10

0000c908 <.LBB97>:
    c908:	03db89b3          	mul	s3,s7,t4

0000c90c <.LBB98>:
    c90c:	00d80833          	add	a6,a6,a3

0000c910 <.LBB99>:
    c910:	03d90eb3          	mul	t4,s2,t4

0000c914 <.LVL208>:
    c914:	0109d693          	srl	a3,s3,0x10
    c918:	032284b3          	mul	s1,t0,s2

0000c91c <.LVL209>:
    c91c:	037282b3          	mul	t0,t0,s7

0000c920 <.LVL210>:
    c920:	01d282b3          	add	t0,t0,t4

0000c924 <.LVL211>:
    c924:	005686b3          	add	a3,a3,t0

0000c928 <.LVL212>:
    c928:	01d6f463          	bgeu	a3,t4,c930 <.L102>
    c92c:	018484b3          	add	s1,s1,s8

0000c930 <.L102>:
    c930:	0106de93          	srl	t4,a3,0x10

0000c934 <.LVL214>:
    c934:	009e8eb3          	add	t4,t4,s1

0000c938 <.LVL215>:
    c938:	000104b7          	lui	s1,0x10

0000c93c <.LVL216>:
    c93c:	fff48293          	add	t0,s1,-1 # ffff <.LBB204+0xb>
    c940:	0056f6b3          	and	a3,a3,t0

0000c944 <.LVL217>:
    c944:	0059f9b3          	and	s3,s3,t0

0000c948 <.LVL218>:
    c948:	01069693          	sll	a3,a3,0x10

0000c94c <.LBB100>:
    c94c:	02ba82b3          	mul	t0,s5,a1

0000c950 <.LBB101>:
    c950:	013686b3          	add	a3,a3,s3

0000c954 <.LBB102>:
    c954:	02bb05b3          	mul	a1,s6,a1

0000c958 <.LVL220>:
    c958:	035f89b3          	mul	s3,t6,s5

0000c95c <.LVL221>:
    c95c:	01358c33          	add	s8,a1,s3
    c960:	0102d593          	srl	a1,t0,0x10

0000c964 <.LVL222>:
    c964:	018585b3          	add	a1,a1,s8
    c968:	036f8fb3          	mul	t6,t6,s6

0000c96c <.LVL223>:
    c96c:	0135f463          	bgeu	a1,s3,c974 <.L103>
    c970:	009f8fb3          	add	t6,t6,s1

0000c974 <.L103>:
    c974:	0105d493          	srl	s1,a1,0x10
    c978:	01f48fb3          	add	t6,s1,t6

0000c97c <.LVL225>:
    c97c:	000104b7          	lui	s1,0x10
    c980:	fff48993          	add	s3,s1,-1 # ffff <.LBB204+0xb>

0000c984 <.LVL226>:
    c984:	0135f5b3          	and	a1,a1,s3

0000c988 <.LVL227>:
    c988:	0132f2b3          	and	t0,t0,s3

0000c98c <.LVL228>:
    c98c:	01059593          	sll	a1,a1,0x10

0000c990 <.LBB103>:
    c990:	032789b3          	mul	s3,a5,s2

0000c994 <.LBB104>:
    c994:	005585b3          	add	a1,a1,t0

0000c998 <.LBB105>:
    c998:	037787b3          	mul	a5,a5,s7

0000c99c <.LVL230>:
    c99c:	03cb82b3          	mul	t0,s7,t3

0000c9a0 <.LVL231>:
    c9a0:	03c90e33          	mul	t3,s2,t3

0000c9a4 <.LVL232>:
    c9a4:	0102dc13          	srl	s8,t0,0x10

0000c9a8 <.LVL233>:
    c9a8:	01c787b3          	add	a5,a5,t3
    c9ac:	00fc07b3          	add	a5,s8,a5

0000c9b0 <.LVL235>:
    c9b0:	01c7f463          	bgeu	a5,t3,c9b8 <.L104>
    c9b4:	009989b3          	add	s3,s3,s1

0000c9b8 <.L104>:
    c9b8:	00e50733          	add	a4,a0,a4

0000c9bc <.LVL237>:
    c9bc:	01070833          	add	a6,a4,a6

0000c9c0 <.LVL238>:
    c9c0:	01e88f33          	add	t5,a7,t5

0000c9c4 <.LBB106>:
    c9c4:	00a73533          	sltu	a0,a4,a0
    c9c8:	00af0533          	add	a0,t5,a0
    c9cc:	00d806b3          	add	a3,a6,a3

0000c9d0 <.LVL240>:
    c9d0:	007503b3          	add	t2,a0,t2

0000c9d4 <.LBB107>:
    c9d4:	00e83733          	sltu	a4,a6,a4

0000c9d8 <.LBB108>:
    c9d8:	06d12023          	sw	a3,96(sp)
    c9dc:	0106b6b3          	sltu	a3,a3,a6

0000c9e0 <.LBB109>:
    c9e0:	037a8833          	mul	a6,s5,s7
    c9e4:	00e38733          	add	a4,t2,a4
    c9e8:	01d70eb3          	add	t4,a4,t4

0000c9ec <.LVL242>:
    c9ec:	00de86b3          	add	a3,t4,a3

0000c9f0 <.LBB110>:
    c9f0:	0107de13          	srl	t3,a5,0x10

0000c9f4 <.LBB111>:
    c9f4:	011f38b3          	sltu	a7,t5,a7

0000c9f8 <.LBB112>:
    c9f8:	000104b7          	lui	s1,0x10

0000c9fc <.LBB113>:
    c9fc:	01e53f33          	sltu	t5,a0,t5

0000ca00 <.LBB114>:
    ca00:	00a3b533          	sltu	a0,t2,a0
    ca04:	007733b3          	sltu	t2,a4,t2

0000ca08 <.LBB115>:
    ca08:	03590ab3          	mul	s5,s2,s5

0000ca0c <.LBB116>:
    ca0c:	013e0e33          	add	t3,t3,s3

0000ca10 <.LBB117>:
    ca10:	00756533          	or	a0,a0,t2

0000ca14 <.LBB118>:
    ca14:	fff48993          	add	s3,s1,-1 # ffff <.LBB204+0xb>

0000ca18 <.LBB119>:
    ca18:	00eeb733          	sltu	a4,t4,a4

0000ca1c <.LBB120>:
    ca1c:	01e8e8b3          	or	a7,a7,t5

0000ca20 <.LBB121>:
    ca20:	01d6beb3          	sltu	t4,a3,t4

0000ca24 <.LBB122>:
    ca24:	00a888b3          	add	a7,a7,a0

0000ca28 <.LBB123>:
    ca28:	0137f7b3          	and	a5,a5,s3

0000ca2c <.LBB124>:
    ca2c:	01d76733          	or	a4,a4,t4

0000ca30 <.LBB125>:
    ca30:	032b0933          	mul	s2,s6,s2

0000ca34 <.LVL248>:
    ca34:	00b685b3          	add	a1,a3,a1

0000ca38 <.LBB126>:
    ca38:	01170733          	add	a4,a4,a7

0000ca3c <.LBB127>:
    ca3c:	01079793          	sll	a5,a5,0x10
    ca40:	0132f2b3          	and	t0,t0,s3

0000ca44 <.LVL250>:
    ca44:	01f70fb3          	add	t6,a4,t6

0000ca48 <.LVL251>:
    ca48:	005787b3          	add	a5,a5,t0

0000ca4c <.LBB128>:
    ca4c:	00d5b6b3          	sltu	a3,a1,a3

0000ca50 <.LVL253>:
    ca50:	00df86b3          	add	a3,t6,a3

0000ca54 <.LVL254>:
    ca54:	00f587b3          	add	a5,a1,a5

0000ca58 <.LBB132>:
    ca58:	037b0b33          	mul	s6,s6,s7

0000ca5c <.LBB133>:
    ca5c:	00efb733          	sltu	a4,t6,a4

0000ca60 <.LVL257>:
    ca60:	01c68e33          	add	t3,a3,t3

0000ca64 <.LVL258>:
    ca64:	01f6bfb3          	sltu	t6,a3,t6

0000ca68 <.LBB134>:
    ca68:	06f12223          	sw	a5,100(sp)
    ca6c:	00b7b7b3          	sltu	a5,a5,a1

0000ca70 <.LBB135>:
    ca70:	01f76533          	or	a0,a4,t6

0000ca74 <.LBB136>:
    ca74:	00fe07b3          	add	a5,t3,a5

0000ca78 <.LBB137>:
    ca78:	01085713          	srl	a4,a6,0x10

0000ca7c <.LBB138>:
    ca7c:	00de36b3          	sltu	a3,t3,a3

0000ca80 <.LVL260>:
    ca80:	015b0b33          	add	s6,s6,s5
    ca84:	01c7be33          	sltu	t3,a5,t3

0000ca88 <.LBB139>:
    ca88:	01670733          	add	a4,a4,s6

0000ca8c <.LBB140>:
    ca8c:	01c6e6b3          	or	a3,a3,t3

0000ca90 <.LBB141>:
    ca90:	01577463          	bgeu	a4,s5,ca98 <.L135>
    ca94:	00990933          	add	s2,s2,s1

0000ca98 <.L135>:
    ca98:	01075593          	srl	a1,a4,0x10
    ca9c:	00a585b3          	add	a1,a1,a0

0000caa0 <.LBB142>:
    caa0:	00010537          	lui	a0,0x10

0000caa4 <.LVL264>:
    caa4:	fff50513          	add	a0,a0,-1 # ffff <.LBB204+0xb>
    caa8:	00a77733          	and	a4,a4,a0

0000caac <.LVL265>:
    caac:	01071713          	sll	a4,a4,0x10
    cab0:	00a87833          	and	a6,a6,a0

0000cab4 <.LVL266>:
    cab4:	01070733          	add	a4,a4,a6
    cab8:	00e78733          	add	a4,a5,a4

0000cabc <.LBB144>:
    cabc:	00d586b3          	add	a3,a1,a3

0000cac0 <.LVL268>:
    cac0:	00f737b3          	sltu	a5,a4,a5
    cac4:	00f687b3          	add	a5,a3,a5
    cac8:	012787b3          	add	a5,a5,s2
    cacc:	06f12623          	sw	a5,108(sp)

0000cad0 <.LBB146>:
    cad0:	01012783          	lw	a5,16(sp)
    cad4:	00d31313          	sll	t1,t1,0xd

0000cad8 <.LBB145>:
    cad8:	06e12423          	sw	a4,104(sp)

0000cadc <.LBB148>:
    cadc:	00c7e7b3          	or	a5,a5,a2

0000cae0 <.LVL270>:
    cae0:	0147e7b3          	or	a5,a5,s4

0000cae4 <.LVL271>:
    cae4:	00f36333          	or	t1,t1,a5

0000cae8 <.LVL272>:
    cae8:	06010613          	add	a2,sp,96
    caec:	05010793          	add	a5,sp,80

0000caf0 <.L138>:
    caf0:	00c7a703          	lw	a4,12(a5)
    caf4:	0107a683          	lw	a3,16(a5)
    caf8:	00478793          	add	a5,a5,4
    cafc:	01375713          	srl	a4,a4,0x13
    cb00:	00d69693          	sll	a3,a3,0xd
    cb04:	00d76733          	or	a4,a4,a3
    cb08:	fee7ae23          	sw	a4,-4(a5)
    cb0c:	fef612e3          	bne	a2,a5,caf0 <.L138>
    cb10:	05012783          	lw	a5,80(sp)
    cb14:	00603333          	snez	t1,t1

0000cb18 <.LBE148>:
    cb18:	05c12703          	lw	a4,92(sp)

0000cb1c <.LBB149>:
    cb1c:	00f36333          	or	t1,t1,a5

0000cb20 <.LBE149>:
    cb20:	05812783          	lw	a5,88(sp)
    cb24:	04e12623          	sw	a4,76(sp)
    cb28:	04612023          	sw	t1,64(sp)

0000cb2c <.LBB150>:
    cb2c:	04f12423          	sw	a5,72(sp)
    cb30:	05412783          	lw	a5,84(sp)
    cb34:	04f12223          	sw	a5,68(sp)

0000cb38 <.LBE150>:
    cb38:	00b71793          	sll	a5,a4,0xb
    cb3c:	0407d863          	bgez	a5,cb8c <.L139>

0000cb40 <.LBB151>:
    cb40:	01f31313          	sll	t1,t1,0x1f

0000cb44 <.LVL276>:
    cb44:	04010793          	add	a5,sp,64
    cb48:	04c10593          	add	a1,sp,76

0000cb4c <.L140>:
    cb4c:	0007a683          	lw	a3,0(a5)
    cb50:	0047a603          	lw	a2,4(a5)
    cb54:	00478793          	add	a5,a5,4
    cb58:	0016d693          	srl	a3,a3,0x1
    cb5c:	01f61613          	sll	a2,a2,0x1f
    cb60:	00c6e6b3          	or	a3,a3,a2
    cb64:	fed7ae23          	sw	a3,-4(a5)
    cb68:	fef592e3          	bne	a1,a5,cb4c <.L140>

0000cb6c <.LBE152>:
    cb6c:	04012783          	lw	a5,64(sp)

0000cb70 <.LBB153>:
    cb70:	00603333          	snez	t1,t1

0000cb74 <.LVL279>:
    cb74:	00175713          	srl	a4,a4,0x1

0000cb78 <.LBE153>:
    cb78:	0067e7b3          	or	a5,a5,t1
    cb7c:	04f12023          	sw	a5,64(sp)

0000cb80 <.LBE151>:
    cb80:	00812783          	lw	a5,8(sp)

0000cb84 <.LBB154>:
    cb84:	04e12623          	sw	a4,76(sp)

0000cb88 <.LBE154>:
    cb88:	00f12623          	sw	a5,12(sp)

0000cb8c <.L139>:
    cb8c:	00c12783          	lw	a5,12(sp)
    cb90:	00f12423          	sw	a5,8(sp)
    cb94:	3780006f          	j	cf0c <.L173>

0000cb98 <.L2>:
  FP_UNPACK_Q (A, a);
    cb98:	00a7e633          	or	a2,a5,a0
    cb9c:	00d66633          	or	a2,a2,a3
    cba0:	00e66633          	or	a2,a2,a4
    cba4:	14060463          	beqz	a2,ccec <.L174>

0000cba8 <.LBB156>:
    cba8:	0a070063          	beqz	a4,cc48 <.L6>
    cbac:	00070513          	mv	a0,a4
    cbb0:	a65f40ef          	jal	1614 <__clzsi2>

0000cbb4 <.L7>:
    cbb4:	ff450713          	add	a4,a0,-12
    cbb8:	40575593          	sra	a1,a4,0x5

0000cbbc <.LVL284>:
    cbbc:	01f77713          	and	a4,a4,31

0000cbc0 <.LVL285>:
    cbc0:	0a070e63          	beqz	a4,cc7c <.L10>
    cbc4:	ffc00693          	li	a3,-4
    cbc8:	02d586b3          	mul	a3,a1,a3
    cbcc:	02000813          	li	a6,32
    cbd0:	02010313          	add	t1,sp,32
    cbd4:	40e80833          	sub	a6,a6,a4

0000cbd8 <.LVL286>:
    cbd8:	00c68793          	add	a5,a3,12 # 1000c <.LBE195>
    cbdc:	00f307b3          	add	a5,t1,a5
    cbe0:	40d006b3          	neg	a3,a3

0000cbe4 <.L11>:
    cbe4:	0cf31463          	bne	t1,a5,ccac <.L14>
    cbe8:	fff58793          	add	a5,a1,-1

0000cbec <.LVL287>:
    cbec:	00259593          	sll	a1,a1,0x2

0000cbf0 <.LVL288>:
    cbf0:	05058693          	add	a3,a1,80
    cbf4:	02010613          	add	a2,sp,32
    cbf8:	00c685b3          	add	a1,a3,a2
    cbfc:	02012683          	lw	a3,32(sp)
    cc00:	00e69733          	sll	a4,a3,a4

0000cc04 <.LVL289>:
    cc04:	fae5a823          	sw	a4,-80(a1)

0000cc08 <.L15>:
    cc08:	00178793          	add	a5,a5,1
    cc0c:	00279793          	sll	a5,a5,0x2
    cc10:	00800693          	li	a3,8
    cc14:	02010713          	add	a4,sp,32
    cc18:	00d7ea63          	bltu	a5,a3,cc2c <.L16>
    cc1c:	02012023          	sw	zero,32(sp)
    cc20:	00072223          	sw	zero,4(a4)
    cc24:	ff878793          	add	a5,a5,-8
    cc28:	02810713          	add	a4,sp,40

0000cc2c <.L16>:
    cc2c:	00400693          	li	a3,4
    cc30:	00d7e463          	bltu	a5,a3,cc38 <.L17>
    cc34:	00072023          	sw	zero,0(a4)

0000cc38 <.L17>:
    cc38:	ffffc4b7          	lui	s1,0xffffc

0000cc3c <.LVL291>:
    cc3c:	01148493          	add	s1,s1,17 # ffffc011 <_ebss+0xfffe5ce1>
    cc40:	40a484b3          	sub	s1,s1,a0
    cc44:	f20ff06f          	j	c364 <.L209>

0000cc48 <.L6>:
    cc48:	00068a63          	beqz	a3,cc5c <.L8>
    cc4c:	00068513          	mv	a0,a3
    cc50:	9c5f40ef          	jal	1614 <__clzsi2>

0000cc54 <.LVL293>:
    cc54:	02050513          	add	a0,a0,32
    cc58:	f5dff06f          	j	cbb4 <.L7>

0000cc5c <.L8>:
    cc5c:	00050863          	beqz	a0,cc6c <.L9>
    cc60:	9b5f40ef          	jal	1614 <__clzsi2>

0000cc64 <.LVL296>:
    cc64:	04050513          	add	a0,a0,64
    cc68:	f4dff06f          	j	cbb4 <.L7>

0000cc6c <.L9>:
    cc6c:	00078513          	mv	a0,a5
    cc70:	9a5f40ef          	jal	1614 <__clzsi2>

0000cc74 <.LVL299>:
    cc74:	06050513          	add	a0,a0,96
    cc78:	f3dff06f          	j	cbb4 <.L7>

0000cc7c <.L10>:
    cc7c:	ffc00693          	li	a3,-4
    cc80:	02d586b3          	mul	a3,a1,a3
    cc84:	02c10793          	add	a5,sp,44

0000cc88 <.LBB10>:
    cc88:	00300713          	li	a4,3

0000cc8c <.L12>:
    cc8c:	00d78633          	add	a2,a5,a3
    cc90:	00062603          	lw	a2,0(a2)
    cc94:	fff70713          	add	a4,a4,-1

0000cc98 <.LVL303>:
    cc98:	ffc78793          	add	a5,a5,-4
    cc9c:	00c7a223          	sw	a2,4(a5)

0000cca0 <.LVL304>:
    cca0:	feb756e3          	bge	a4,a1,cc8c <.L12>
    cca4:	fff58793          	add	a5,a1,-1
    cca8:	f61ff06f          	j	cc08 <.L15>

0000ccac <.L14>:
    ccac:	0007a603          	lw	a2,0(a5)
    ccb0:	ffc7a883          	lw	a7,-4(a5)
    ccb4:	00d78e33          	add	t3,a5,a3
    ccb8:	00e61633          	sll	a2,a2,a4
    ccbc:	0108d8b3          	srl	a7,a7,a6
    ccc0:	01166633          	or	a2,a2,a7
    ccc4:	00ce2023          	sw	a2,0(t3)
    ccc8:	ffc78793          	add	a5,a5,-4
    cccc:	f19ff06f          	j	cbe4 <.L11>

0000ccd0 <.L3>:
    ccd0:	00a7e7b3          	or	a5,a5,a0
    ccd4:	00d7e7b3          	or	a5,a5,a3
    ccd8:	00e7e7b3          	or	a5,a5,a4
    ccdc:	00200b93          	li	s7,2
    cce0:	e8078463          	beqz	a5,c368 <.L5>
    cce4:	00300b93          	li	s7,3
    cce8:	e80ff06f          	j	c368 <.L5>

0000ccec <.L174>:
    ccec:	00000493          	li	s1,0

0000ccf0 <.LBE157>:
    ccf0:	00100b93          	li	s7,1
    ccf4:	e74ff06f          	j	c368 <.L5>

0000ccf8 <.L18>:
  FP_UNPACK_Q (B, b);
    ccf8:	016967b3          	or	a5,s2,s6

0000ccfc <.LVL309>:
    ccfc:	0157e7b3          	or	a5,a5,s5
    cd00:	00a7e7b3          	or	a5,a5,a0
    cd04:	14078463          	beqz	a5,ce4c <.L176>

0000cd08 <.LBB158>:
    cd08:	08050e63          	beqz	a0,cda4 <.L22>
    cd0c:	909f40ef          	jal	1614 <__clzsi2>

0000cd10 <.L23>:
    cd10:	ff450693          	add	a3,a0,-12
    cd14:	4056d793          	sra	a5,a3,0x5

0000cd18 <.LVL311>:
    cd18:	01f6f693          	and	a3,a3,31

0000cd1c <.LVL312>:
    cd1c:	0c068063          	beqz	a3,cddc <.L26>
    cd20:	ffc00613          	li	a2,-4
    cd24:	02c78633          	mul	a2,a5,a2
    cd28:	02000813          	li	a6,32
    cd2c:	03010313          	add	t1,sp,48
    cd30:	40d80833          	sub	a6,a6,a3

0000cd34 <.LVL313>:
    cd34:	00c60713          	add	a4,a2,12
    cd38:	00e30733          	add	a4,t1,a4
    cd3c:	40c00633          	neg	a2,a2

0000cd40 <.L27>:
    cd40:	0ce31663          	bne	t1,a4,ce0c <.L30>
    cd44:	fff78713          	add	a4,a5,-1

0000cd48 <.LVL314>:
    cd48:	00279793          	sll	a5,a5,0x2

0000cd4c <.LVL315>:
    cd4c:	02010613          	add	a2,sp,32
    cd50:	05078793          	add	a5,a5,80
    cd54:	00c787b3          	add	a5,a5,a2
    cd58:	03012603          	lw	a2,48(sp)
    cd5c:	00d616b3          	sll	a3,a2,a3

0000cd60 <.LVL316>:
    cd60:	fcd7a023          	sw	a3,-64(a5)

0000cd64 <.L31>:
    cd64:	00170793          	add	a5,a4,1
    cd68:	00279793          	sll	a5,a5,0x2
    cd6c:	00800693          	li	a3,8
    cd70:	03010713          	add	a4,sp,48
    cd74:	00d7ea63          	bltu	a5,a3,cd88 <.L32>
    cd78:	02012823          	sw	zero,48(sp)
    cd7c:	00072223          	sw	zero,4(a4)
    cd80:	ff878793          	add	a5,a5,-8
    cd84:	03810713          	add	a4,sp,56

0000cd88 <.L32>:
    cd88:	00400693          	li	a3,4
    cd8c:	00d7e463          	bltu	a5,a3,cd94 <.L33>
    cd90:	00072023          	sw	zero,0(a4)

0000cd94 <.L33>:
    cd94:	ffffc7b7          	lui	a5,0xffffc
    cd98:	01178793          	add	a5,a5,17 # ffffc011 <_ebss+0xfffe5ce1>
    cd9c:	40a787b3          	sub	a5,a5,a0
    cda0:	e54ff06f          	j	c3f4 <.L210>

0000cda4 <.L22>:
    cda4:	000a8a63          	beqz	s5,cdb8 <.L24>
    cda8:	000a8513          	mv	a0,s5
    cdac:	869f40ef          	jal	1614 <__clzsi2>

0000cdb0 <.LVL319>:
    cdb0:	02050513          	add	a0,a0,32
    cdb4:	f5dff06f          	j	cd10 <.L23>

0000cdb8 <.L24>:
    cdb8:	000b0a63          	beqz	s6,cdcc <.L25>
    cdbc:	000b0513          	mv	a0,s6
    cdc0:	855f40ef          	jal	1614 <__clzsi2>

0000cdc4 <.LVL322>:
    cdc4:	04050513          	add	a0,a0,64
    cdc8:	f49ff06f          	j	cd10 <.L23>

0000cdcc <.L25>:
    cdcc:	00090513          	mv	a0,s2
    cdd0:	845f40ef          	jal	1614 <__clzsi2>

0000cdd4 <.LVL325>:
    cdd4:	06050513          	add	a0,a0,96
    cdd8:	f39ff06f          	j	cd10 <.L23>

0000cddc <.L26>:
    cddc:	ffc00613          	li	a2,-4
    cde0:	02c78633          	mul	a2,a5,a2
    cde4:	03c10713          	add	a4,sp,60

0000cde8 <.LBB17>:
    cde8:	00300693          	li	a3,3

0000cdec <.L28>:
    cdec:	00c705b3          	add	a1,a4,a2
    cdf0:	0005a583          	lw	a1,0(a1)
    cdf4:	fff68693          	add	a3,a3,-1

0000cdf8 <.LVL329>:
    cdf8:	ffc70713          	add	a4,a4,-4
    cdfc:	00b72223          	sw	a1,4(a4)

0000ce00 <.LVL330>:
    ce00:	fef6d6e3          	bge	a3,a5,cdec <.L28>
    ce04:	fff78713          	add	a4,a5,-1
    ce08:	f5dff06f          	j	cd64 <.L31>

0000ce0c <.L30>:
    ce0c:	00072583          	lw	a1,0(a4)
    ce10:	ffc72883          	lw	a7,-4(a4)
    ce14:	00c70e33          	add	t3,a4,a2
    ce18:	00d595b3          	sll	a1,a1,a3
    ce1c:	0108d8b3          	srl	a7,a7,a6
    ce20:	0115e5b3          	or	a1,a1,a7
    ce24:	00be2023          	sw	a1,0(t3)
    ce28:	ffc70713          	add	a4,a4,-4
    ce2c:	f15ff06f          	j	cd40 <.L27>

0000ce30 <.L19>:
    ce30:	01696933          	or	s2,s2,s6
    ce34:	01596933          	or	s2,s2,s5
    ce38:	00a96933          	or	s2,s2,a0
    ce3c:	00200693          	li	a3,2
    ce40:	da090c63          	beqz	s2,c3f8 <.L21>
    ce44:	00300693          	li	a3,3
    ce48:	db0ff06f          	j	c3f8 <.L21>

0000ce4c <.L176>:
    ce4c:	00000793          	li	a5,0

0000ce50 <.LBE159>:
    ce50:	00100693          	li	a3,1
    ce54:	da4ff06f          	j	c3f8 <.L21>

0000ce58 <.L35>:
    ce58:	00100713          	li	a4,1
    ce5c:	00f717b3          	sll	a5,a4,a5
  FP_MUL_Q (R, A, B);
    ce60:	5307f713          	and	a4,a5,1328
    ce64:	06071863          	bnez	a4,ced4 <.L38>
    ce68:	0887f713          	and	a4,a5,136
    ce6c:	04071063          	bnez	a4,ceac <.L39>
    ce70:	2407f793          	and	a5,a5,576
    ce74:	dc078063          	beqz	a5,c434 <.L36>

0000ce78 <.L40>:
  FP_PACK_Q (r, R);
    ce78:	000087b7          	lui	a5,0x8
    ce7c:	04f12623          	sw	a5,76(sp)
    ce80:	04012423          	sw	zero,72(sp)
    ce84:	04012223          	sw	zero,68(sp)
    ce88:	04012023          	sw	zero,64(sp)

0000ce8c <.LVL336>:
    ce8c:	fff78793          	add	a5,a5,-1 # 7fff <.L2+0x7b>
    ce90:	00012223          	sw	zero,4(sp)
    ce94:	1440006f          	j	cfd8 <.L153>

0000ce98 <.L34>:
  FP_MUL_Q (R, A, B);
    ce98:	00f00713          	li	a4,15
    ce9c:	fce78ee3          	beq	a5,a4,ce78 <.L40>
    cea0:	00b00713          	li	a4,11

0000cea4 <.LBB160>:
  FP_UNPACK_Q (A, a);
    cea4:	01412223          	sw	s4,4(sp)

0000cea8 <.LBE160>:
  FP_MUL_Q (R, A, B);
    cea8:	02e79663          	bne	a5,a4,ced4 <.L38>

0000ceac <.L39>:
  FP_UNPACK_Q (B, b);
    ceac:	01312223          	sw	s3,4(sp)

0000ceb0 <.L37>:
  FP_MUL_Q (R, A, B);
    ceb0:	03012783          	lw	a5,48(sp)
    ceb4:	00068b93          	mv	s7,a3

0000ceb8 <.LVL339>:
    ceb8:	04f12023          	sw	a5,64(sp)
    cebc:	03412783          	lw	a5,52(sp)
    cec0:	04f12223          	sw	a5,68(sp)
    cec4:	03812783          	lw	a5,56(sp)
    cec8:	04f12423          	sw	a5,72(sp)
    cecc:	03c12783          	lw	a5,60(sp)

0000ced0 <.LVL340>:
    ced0:	0200006f          	j	cef0 <.L141>

0000ced4 <.L38>:
    ced4:	02012783          	lw	a5,32(sp)
    ced8:	04f12023          	sw	a5,64(sp)
    cedc:	02412783          	lw	a5,36(sp)
    cee0:	04f12223          	sw	a5,68(sp)
    cee4:	02812783          	lw	a5,40(sp)
    cee8:	04f12423          	sw	a5,72(sp)
    ceec:	02c12783          	lw	a5,44(sp)

0000cef0 <.L141>:
    cef0:	04f12623          	sw	a5,76(sp)
  FP_PACK_Q (r, R);
    cef4:	00200793          	li	a5,2
    cef8:	36fb8663          	beq	s7,a5,d264 <.L142>
    cefc:	00300793          	li	a5,3
    cf00:	f6fb8ce3          	beq	s7,a5,ce78 <.L40>
    cf04:	00100793          	li	a5,1
    cf08:	34fb8463          	beq	s7,a5,d250 <.L211>

0000cf0c <.L173>:
    cf0c:	00812703          	lw	a4,8(sp)
    cf10:	000047b7          	lui	a5,0x4
    cf14:	fff78793          	add	a5,a5,-1 # 3fff <.L23+0x3>
    cf18:	00f707b3          	add	a5,a4,a5

0000cf1c <.LVL344>:
    cf1c:	12f05a63          	blez	a5,d050 <.L144>
    cf20:	04012703          	lw	a4,64(sp)
    cf24:	00777693          	and	a3,a4,7
    cf28:	04068463          	beqz	a3,cf70 <.L145>
    cf2c:	00f77693          	and	a3,a4,15
    cf30:	00400613          	li	a2,4
    cf34:	02c68e63          	beq	a3,a2,cf70 <.L145>

0000cf38 <.LBB162>:
    cf38:	00470713          	add	a4,a4,4
    cf3c:	00473693          	sltiu	a3,a4,4
    cf40:	04e12023          	sw	a4,64(sp)

0000cf44 <.LVL345>:
    cf44:	04412703          	lw	a4,68(sp)

0000cf48 <.LVL346>:
    cf48:	00e68733          	add	a4,a3,a4
    cf4c:	04e12223          	sw	a4,68(sp)

0000cf50 <.LVL347>:
    cf50:	00d73733          	sltu	a4,a4,a3

0000cf54 <.LVL348>:
    cf54:	04812683          	lw	a3,72(sp)
    cf58:	00e68733          	add	a4,a3,a4

0000cf5c <.LVL349>:
    cf5c:	04e12423          	sw	a4,72(sp)

0000cf60 <.LVL350>:
    cf60:	00d73733          	sltu	a4,a4,a3

0000cf64 <.LVL351>:
    cf64:	04c12683          	lw	a3,76(sp)
    cf68:	00d70733          	add	a4,a4,a3

0000cf6c <.LVL352>:
    cf6c:	04e12623          	sw	a4,76(sp)

0000cf70 <.L145>:
    cf70:	04c12703          	lw	a4,76(sp)
    cf74:	00b71693          	sll	a3,a4,0xb
    cf78:	0206d063          	bgez	a3,cf98 <.L150>
    cf7c:	fff007b7          	lui	a5,0xfff00

0000cf80 <.LVL354>:
    cf80:	fff78793          	add	a5,a5,-1 # ffefffff <_ebss+0xffee9ccf>
    cf84:	00f77733          	and	a4,a4,a5
    cf88:	04e12623          	sw	a4,76(sp)
    cf8c:	00812703          	lw	a4,8(sp)
    cf90:	000047b7          	lui	a5,0x4

0000cf94 <.LVL355>:
    cf94:	00f707b3          	add	a5,a4,a5

0000cf98 <.L150>:
    cf98:	04010713          	add	a4,sp,64
    cf9c:	04c10593          	add	a1,sp,76

0000cfa0 <.L151>:
    cfa0:	00072683          	lw	a3,0(a4)
    cfa4:	00472603          	lw	a2,4(a4)
    cfa8:	00470713          	add	a4,a4,4
    cfac:	0036d693          	srl	a3,a3,0x3
    cfb0:	01d61613          	sll	a2,a2,0x1d
    cfb4:	00c6e6b3          	or	a3,a3,a2
    cfb8:	fed72e23          	sw	a3,-4(a4)
    cfbc:	fee592e3          	bne	a1,a4,cfa0 <.L151>

0000cfc0 <.LBE163>:
    cfc0:	000086b7          	lui	a3,0x8
    cfc4:	ffe68693          	add	a3,a3,-2 # 7ffe <.L2+0x7a>

0000cfc8 <.LBB164>:
    cfc8:	04c12703          	lw	a4,76(sp)

0000cfcc <.LBE164>:
    cfcc:	28f6cc63          	blt	a3,a5,d264 <.L142>

0000cfd0 <.LBB165>:
    cfd0:	00375713          	srl	a4,a4,0x3
    cfd4:	04e12623          	sw	a4,76(sp)

0000cfd8 <.L153>:
    cfd8:	04c12703          	lw	a4,76(sp)

0000cfdc <.LBE166>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    cfdc:	0ac12083          	lw	ra,172(sp)
    cfe0:	00040513          	mv	a0,s0

0000cfe4 <.LBB167>:
  FP_PACK_Q (r, R);
    cfe4:	04e11e23          	sh	a4,92(sp)
    cfe8:	00412703          	lw	a4,4(sp)

0000cfec <.LBE167>:
}
    cfec:	0a412483          	lw	s1,164(sp)
    cff0:	0a012903          	lw	s2,160(sp)

0000cff4 <.LBB168>:
  FP_PACK_Q (r, R);
    cff4:	00f71713          	sll	a4,a4,0xf
    cff8:	00f767b3          	or	a5,a4,a5

0000cffc <.LVL360>:
    cffc:	04f11f23          	sh	a5,94(sp)

0000d000 <.LBE168>:
  return r;
    d000:	04012783          	lw	a5,64(sp)
}
    d004:	09c12983          	lw	s3,156(sp)
    d008:	09812a03          	lw	s4,152(sp)
  return r;
    d00c:	00f42023          	sw	a5,0(s0)
    d010:	04412783          	lw	a5,68(sp)
}
    d014:	09412a83          	lw	s5,148(sp)
    d018:	09012b03          	lw	s6,144(sp)
  return r;
    d01c:	00f42223          	sw	a5,4(s0)
    d020:	04812783          	lw	a5,72(sp)
}
    d024:	08c12b83          	lw	s7,140(sp)
    d028:	08812c03          	lw	s8,136(sp)
  return r;
    d02c:	00f42423          	sw	a5,8(s0)
    d030:	05c12783          	lw	a5,92(sp)
}
    d034:	08412c83          	lw	s9,132(sp)
    d038:	08012d03          	lw	s10,128(sp)
  return r;
    d03c:	00f42623          	sw	a5,12(s0)
}
    d040:	0a812403          	lw	s0,168(sp)
    d044:	07c12d83          	lw	s11,124(sp)
    d048:	0b010113          	add	sp,sp,176

0000d04c <.LVL363>:
    d04c:	00008067          	ret

0000d050 <.L144>:
  FP_PACK_Q (r, R);
    d050:	00100693          	li	a3,1
    d054:	40f686b3          	sub	a3,a3,a5

0000d058 <.LVL365>:
    d058:	07400793          	li	a5,116
    d05c:	1cd7ca63          	blt	a5,a3,d230 <.L154>

0000d060 <.LBB170>:
    d060:	04010613          	add	a2,sp,64
    d064:	4056d713          	sra	a4,a3,0x5

0000d068 <.LVL367>:
    d068:	00060513          	mv	a0,a2
    d06c:	01f6f693          	and	a3,a3,31

0000d070 <.LVL368>:
    d070:	00000793          	li	a5,0
    d074:	00000593          	li	a1,0

0000d078 <.L155>:
    d078:	02e59e63          	bne	a1,a4,d0b4 <.L156>
    d07c:	00300593          	li	a1,3

0000d080 <.LVL370>:
    d080:	40e585b3          	sub	a1,a1,a4
    d084:	00271513          	sll	a0,a4,0x2
    d088:	04069063          	bnez	a3,d0c8 <.L157>
    d08c:	00060813          	mv	a6,a2

0000d090 <.L158>:
    d090:	00a808b3          	add	a7,a6,a0
    d094:	0008a883          	lw	a7,0(a7)
    d098:	00168693          	add	a3,a3,1

0000d09c <.LVL372>:
    d09c:	00480813          	add	a6,a6,4
    d0a0:	ff182e23          	sw	a7,-4(a6)

0000d0a4 <.LVL373>:
    d0a4:	fed5d6e3          	bge	a1,a3,d090 <.L158>
    d0a8:	00400693          	li	a3,4

0000d0ac <.LVL374>:
    d0ac:	40e68733          	sub	a4,a3,a4

0000d0b0 <.LVL375>:
    d0b0:	06c0006f          	j	d11c <.L162>

0000d0b4 <.L156>:
    d0b4:	00052803          	lw	a6,0(a0)
    d0b8:	00158593          	add	a1,a1,1

0000d0bc <.LVL377>:
    d0bc:	00450513          	add	a0,a0,4
    d0c0:	0107e7b3          	or	a5,a5,a6

0000d0c4 <.LVL378>:
    d0c4:	fb5ff06f          	j	d078 <.L155>

0000d0c8 <.L157>:
    d0c8:	05050813          	add	a6,a0,80
    d0cc:	02010893          	add	a7,sp,32
    d0d0:	01180833          	add	a6,a6,a7
    d0d4:	fd082803          	lw	a6,-48(a6)
    d0d8:	02000313          	li	t1,32
    d0dc:	40d30333          	sub	t1,t1,a3
    d0e0:	00681833          	sll	a6,a6,t1
    d0e4:	0107e7b3          	or	a5,a5,a6

0000d0e8 <.LVL380>:
    d0e8:	00000e13          	li	t3,0
    d0ec:	00a60833          	add	a6,a2,a0
    d0f0:	40a00533          	neg	a0,a0

0000d0f4 <.L160>:
    d0f4:	0ebe4063          	blt	t3,a1,d1d4 <.L161>
    d0f8:	00400513          	li	a0,4
    d0fc:	00259593          	sll	a1,a1,0x2
    d100:	40e50733          	sub	a4,a0,a4

0000d104 <.LVL382>:
    d104:	05058593          	add	a1,a1,80
    d108:	02010513          	add	a0,sp,32
    d10c:	00a585b3          	add	a1,a1,a0
    d110:	04c12503          	lw	a0,76(sp)
    d114:	00d556b3          	srl	a3,a0,a3

0000d118 <.LVL383>:
    d118:	fcd5a823          	sw	a3,-48(a1)

0000d11c <.L162>:
    d11c:	00400693          	li	a3,4
    d120:	40e686b3          	sub	a3,a3,a4
    d124:	00269693          	sll	a3,a3,0x2
    d128:	00271713          	sll	a4,a4,0x2
    d12c:	00800593          	li	a1,8
    d130:	00e60733          	add	a4,a2,a4
    d134:	00b6ea63          	bltu	a3,a1,d148 <.L163>
    d138:	00072023          	sw	zero,0(a4)
    d13c:	00072223          	sw	zero,4(a4)
    d140:	ff868693          	add	a3,a3,-8
    d144:	00870713          	add	a4,a4,8

0000d148 <.L163>:
    d148:	00400593          	li	a1,4
    d14c:	00b6e463          	bltu	a3,a1,d154 <.L164>
    d150:	00072023          	sw	zero,0(a4)

0000d154 <.L164>:
    d154:	04012703          	lw	a4,64(sp)

0000d158 <.LBB172>:
    d158:	00f037b3          	snez	a5,a5

0000d15c <.LBE172>:
    d15c:	00e7e7b3          	or	a5,a5,a4
    d160:	04f12023          	sw	a5,64(sp)

0000d164 <.LBE170>:
    d164:	0077f713          	and	a4,a5,7
    d168:	04070463          	beqz	a4,d1b0 <.L165>
    d16c:	00f7f713          	and	a4,a5,15
    d170:	00400693          	li	a3,4
    d174:	02d70e63          	beq	a4,a3,d1b0 <.L165>

0000d178 <.LBB174>:
    d178:	04412703          	lw	a4,68(sp)
    d17c:	00478793          	add	a5,a5,4 # 4004 <.L23+0x8>
    d180:	04f12023          	sw	a5,64(sp)

0000d184 <.LVL386>:
    d184:	0047b793          	sltiu	a5,a5,4

0000d188 <.LVL387>:
    d188:	00f707b3          	add	a5,a4,a5
    d18c:	04f12223          	sw	a5,68(sp)

0000d190 <.LVL388>:
    d190:	00e7b7b3          	sltu	a5,a5,a4

0000d194 <.LVL389>:
    d194:	04812703          	lw	a4,72(sp)
    d198:	00f707b3          	add	a5,a4,a5

0000d19c <.LVL390>:
    d19c:	04f12423          	sw	a5,72(sp)

0000d1a0 <.LVL391>:
    d1a0:	00e7b7b3          	sltu	a5,a5,a4

0000d1a4 <.LVL392>:
    d1a4:	04c12703          	lw	a4,76(sp)
    d1a8:	00e787b3          	add	a5,a5,a4

0000d1ac <.LVL393>:
    d1ac:	04f12623          	sw	a5,76(sp)

0000d1b0 <.L165>:
    d1b0:	04c12703          	lw	a4,76(sp)
    d1b4:	00c71793          	sll	a5,a4,0xc
    d1b8:	0407d263          	bgez	a5,d1fc <.L170>

0000d1bc <.LVL395>:
    d1bc:	04012623          	sw	zero,76(sp)
    d1c0:	04012423          	sw	zero,72(sp)
    d1c4:	04012223          	sw	zero,68(sp)
    d1c8:	04012023          	sw	zero,64(sp)
    d1cc:	00100793          	li	a5,1

0000d1d0 <.LVL396>:
    d1d0:	e09ff06f          	j	cfd8 <.L153>

0000d1d4 <.L161>:
    d1d4:	00082883          	lw	a7,0(a6)
    d1d8:	00482e83          	lw	t4,4(a6)
    d1dc:	00a80f33          	add	t5,a6,a0
    d1e0:	00d8d8b3          	srl	a7,a7,a3
    d1e4:	006e9eb3          	sll	t4,t4,t1
    d1e8:	01d8e8b3          	or	a7,a7,t4
    d1ec:	011f2023          	sw	a7,0(t5)

0000d1f0 <.LVL398>:
    d1f0:	001e0e13          	add	t3,t3,1

0000d1f4 <.LVL399>:
    d1f4:	00480813          	add	a6,a6,4
    d1f8:	efdff06f          	j	d0f4 <.L160>

0000d1fc <.L170>:
    d1fc:	00c60593          	add	a1,a2,12

0000d200 <.L171>:
    d200:	00062783          	lw	a5,0(a2)
    d204:	00462683          	lw	a3,4(a2)
    d208:	00460613          	add	a2,a2,4
    d20c:	0037d793          	srl	a5,a5,0x3
    d210:	01d69693          	sll	a3,a3,0x1d
    d214:	00d7e7b3          	or	a5,a5,a3
    d218:	fef62e23          	sw	a5,-4(a2)
    d21c:	fec592e3          	bne	a1,a2,d200 <.L171>

0000d220 <.LVL402>:
    d220:	00375713          	srl	a4,a4,0x3
    d224:	04e12623          	sw	a4,76(sp)

0000d228 <.L172>:
    d228:	00000793          	li	a5,0
    d22c:	dadff06f          	j	cfd8 <.L153>

0000d230 <.L154>:
    d230:	04412703          	lw	a4,68(sp)
    d234:	04012783          	lw	a5,64(sp)
    d238:	00e7e7b3          	or	a5,a5,a4
    d23c:	04812703          	lw	a4,72(sp)
    d240:	00e7e7b3          	or	a5,a5,a4
    d244:	04c12703          	lw	a4,76(sp)
    d248:	00e7e7b3          	or	a5,a5,a4
    d24c:	fc078ee3          	beqz	a5,d228 <.L172>

0000d250 <.L211>:
    d250:	04012623          	sw	zero,76(sp)
    d254:	04012423          	sw	zero,72(sp)
    d258:	04012223          	sw	zero,68(sp)

0000d25c <.LBB178>:
    d25c:	04012023          	sw	zero,64(sp)
    d260:	fc9ff06f          	j	d228 <.L172>

0000d264 <.L142>:
    d264:	000087b7          	lui	a5,0x8
    d268:	04012623          	sw	zero,76(sp)
    d26c:	04012423          	sw	zero,72(sp)
    d270:	04012223          	sw	zero,68(sp)
    d274:	04012023          	sw	zero,64(sp)
    d278:	fff78793          	add	a5,a5,-1 # 7fff <.L2+0x7b>
    d27c:	d5dff06f          	j	cfd8 <.L153>

0000d280 <__subtf3>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__subtf3 (TFtype a, TFtype b)
{
    d280:	f9010113          	add	sp,sp,-112
    d284:	0085a703          	lw	a4,8(a1)
    d288:	05512a23          	sw	s5,84(sp)
    d28c:	00c5aa83          	lw	s5,12(a1)
    d290:	0005a783          	lw	a5,0(a1)
    d294:	0045a683          	lw	a3,4(a1)

0000d298 <.LBB3>:
  FP_DECL_Q (B);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_Q (A, a);
    d298:	02e12c23          	sw	a4,56(sp)
    d29c:	00e12c23          	sw	a4,24(sp)
    d2a0:	010a9713          	sll	a4,s5,0x10

0000d2a4 <.LBE3>:
{
    d2a4:	06912223          	sw	s1,100(sp)

0000d2a8 <.LBB4>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d2a8:	01075713          	srl	a4,a4,0x10
    d2ac:	001a9493          	sll	s1,s5,0x1

0000d2b0 <.LBE4>:
{
    d2b0:	00462803          	lw	a6,4(a2)
    d2b4:	00862583          	lw	a1,8(a2)
    d2b8:	06812423          	sw	s0,104(sp)
    d2bc:	07212023          	sw	s2,96(sp)
    d2c0:	00062403          	lw	s0,0(a2)
    d2c4:	00c62903          	lw	s2,12(a2)
    d2c8:	05412c23          	sw	s4,88(sp)

0000d2cc <.LBB5>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d2cc:	03512e23          	sw	s5,60(sp)

0000d2d0 <.LBE5>:
{
    d2d0:	00050a13          	mv	s4,a0
    d2d4:	06112623          	sw	ra,108(sp)
    d2d8:	05312e23          	sw	s3,92(sp)
    d2dc:	05612823          	sw	s6,80(sp)
    d2e0:	05712623          	sw	s7,76(sp)
    d2e4:	05812423          	sw	s8,72(sp)

0000d2e8 <.LBB6>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d2e8:	02f12823          	sw	a5,48(sp)
    d2ec:	02d12a23          	sw	a3,52(sp)
    d2f0:	00f12823          	sw	a5,16(sp)
    d2f4:	00d12a23          	sw	a3,20(sp)
    d2f8:	00e12e23          	sw	a4,28(sp)
    d2fc:	0114d493          	srl	s1,s1,0x11

0000d300 <.LVL1>:
    d300:	01fada93          	srl	s5,s5,0x1f

0000d304 <.LBB7>:
    d304:	01010513          	add	a0,sp,16
    d308:	01c10613          	add	a2,sp,28

0000d30c <.L2>:
    d30c:	00062703          	lw	a4,0(a2)
    d310:	ffc62683          	lw	a3,-4(a2)
    d314:	ffc60613          	add	a2,a2,-4
    d318:	00371713          	sll	a4,a4,0x3
    d31c:	01d6d693          	srl	a3,a3,0x1d
    d320:	00d76733          	or	a4,a4,a3
    d324:	00e62223          	sw	a4,4(a2)
    d328:	fec512e3          	bne	a0,a2,d30c <.L2>

0000d32c <.LBB8>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    d32c:	01091713          	sll	a4,s2,0x10
    d330:	00191b93          	sll	s7,s2,0x1

0000d334 <.LBB9>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d334:	00379793          	sll	a5,a5,0x3

0000d338 <.LBB10>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    d338:	01075713          	srl	a4,a4,0x10
    d33c:	03012a23          	sw	a6,52(sp)
    d340:	03212e23          	sw	s2,60(sp)
    d344:	03012223          	sw	a6,36(sp)

0000d348 <.LBB11>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    d348:	00f12823          	sw	a5,16(sp)

0000d34c <.LBB12>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    d34c:	02812823          	sw	s0,48(sp)
    d350:	02b12c23          	sw	a1,56(sp)
    d354:	02812023          	sw	s0,32(sp)
    d358:	02b12423          	sw	a1,40(sp)
    d35c:	02e12623          	sw	a4,44(sp)
    d360:	011bdb93          	srl	s7,s7,0x11

0000d364 <.LVL6>:
    d364:	01f95913          	srl	s2,s2,0x1f

0000d368 <.LBB13>:
    d368:	02010813          	add	a6,sp,32
    d36c:	02c10313          	add	t1,sp,44

0000d370 <.L3>:
    d370:	00032703          	lw	a4,0(t1)
    d374:	ffc32683          	lw	a3,-4(t1)
    d378:	ffc30313          	add	t1,t1,-4
    d37c:	00371713          	sll	a4,a4,0x3
    d380:	01d6d693          	srl	a3,a3,0x1d
    d384:	00d76733          	or	a4,a4,a3
    d388:	00e32223          	sw	a4,4(t1)
    d38c:	fe6812e3          	bne	a6,t1,d370 <.L3>

0000d390 <.LVL9>:
    d390:	00341413          	sll	s0,s0,0x3

0000d394 <.LBE13>:
  FP_SUB_Q (R, A, B);
    d394:	00008737          	lui	a4,0x8

0000d398 <.LBB14>:
  FP_UNPACK_SEMIRAW_Q (B, b);
    d398:	02812023          	sw	s0,32(sp)

0000d39c <.LBE14>:
  FP_SUB_Q (R, A, B);
    d39c:	fff70713          	add	a4,a4,-1 # 7fff <.L2+0x7b>
    d3a0:	02eb9063          	bne	s7,a4,d3c0 <.L4>
    d3a4:	02812683          	lw	a3,40(sp)
    d3a8:	02412703          	lw	a4,36(sp)
    d3ac:	00d76733          	or	a4,a4,a3
    d3b0:	02c12683          	lw	a3,44(sp)
    d3b4:	00d76733          	or	a4,a4,a3
    d3b8:	00876733          	or	a4,a4,s0
    d3bc:	00071463          	bnez	a4,d3c4 <.L5>

0000d3c0 <.L4>:
    d3c0:	00194913          	xor	s2,s2,1

0000d3c4 <.L5>:
    d3c4:	417488b3          	sub	a7,s1,s7

0000d3c8 <.LBE15>:
    d3c8:	095916e3          	bne	s2,s5,dc54 <.L6>

0000d3cc <.LBB48>:
    d3cc:	45105263          	blez	a7,d810 <.L7>

0000d3d0 <.LVL12>:
    d3d0:	01412903          	lw	s2,20(sp)

0000d3d4 <.LVL13>:
    d3d4:	01812983          	lw	s3,24(sp)
    d3d8:	01c12b03          	lw	s6,28(sp)
    d3dc:	0a0b9263          	bnez	s7,d480 <.L8>
    d3e0:	02412683          	lw	a3,36(sp)
    d3e4:	02812703          	lw	a4,40(sp)
    d3e8:	02c12583          	lw	a1,44(sp)
    d3ec:	00e6e633          	or	a2,a3,a4
    d3f0:	00b66633          	or	a2,a2,a1
    d3f4:	00866633          	or	a2,a2,s0
    d3f8:	00061e63          	bnez	a2,d414 <.L9>

0000d3fc <.L363>:
    d3fc:	02f12823          	sw	a5,48(sp)
    d400:	03212a23          	sw	s2,52(sp)
    d404:	03312c23          	sw	s3,56(sp)
    d408:	03612e23          	sw	s6,60(sp)

0000d40c <.LBB91>:
    d40c:	00088493          	mv	s1,a7

0000d410 <.LVL16>:
    d410:	08c0006f          	j	d49c <.L10>

0000d414 <.L9>:
    d414:	fff88613          	add	a2,a7,-1

0000d418 <.LVL18>:
    d418:	04061863          	bnez	a2,d468 <.L11>

0000d41c <.LBB16>:
    d41c:	00878433          	add	s0,a5,s0
    d420:	01268933          	add	s2,a3,s2
    d424:	02812823          	sw	s0,48(sp)

0000d428 <.LVL19>:
    d428:	00f43433          	sltu	s0,s0,a5

0000d42c <.LVL20>:
    d42c:	00890433          	add	s0,s2,s0

0000d430 <.LVL21>:
    d430:	02812a23          	sw	s0,52(sp)

0000d434 <.LVL22>:
    d434:	00d936b3          	sltu	a3,s2,a3

0000d438 <.LVL23>:
    d438:	01243433          	sltu	s0,s0,s2

0000d43c <.LVL24>:
    d43c:	013709b3          	add	s3,a4,s3

0000d440 <.LVL25>:
    d440:	0086e6b3          	or	a3,a3,s0

0000d444 <.LVL26>:
    d444:	00d986b3          	add	a3,s3,a3
    d448:	02d12c23          	sw	a3,56(sp)

0000d44c <.LVL27>:
    d44c:	00e9b7b3          	sltu	a5,s3,a4

0000d450 <.LVL28>:
    d450:	0136b6b3          	sltu	a3,a3,s3

0000d454 <.LVL29>:
    d454:	00d7e7b3          	or	a5,a5,a3

0000d458 <.LVL30>:
    d458:	016585b3          	add	a1,a1,s6
    d45c:	00b787b3          	add	a5,a5,a1

0000d460 <.L355>:
    d460:	00100493          	li	s1,1

0000d464 <.LVL32>:
    d464:	2fc0006f          	j	d760 <.L22>

0000d468 <.L11>:
    d468:	00008737          	lui	a4,0x8
    d46c:	fff70713          	add	a4,a4,-1 # 7fff <.L2+0x7b>
    d470:	00e88463          	beq	a7,a4,d478 <.L23>
    d474:	2540106f          	j	e6c8 <.L343>

0000d478 <.L23>:
    d478:	02f12823          	sw	a5,48(sp)
    d47c:	4400006f          	j	d8bc <.L364>

0000d480 <.L8>:
    d480:	00008737          	lui	a4,0x8
    d484:	fff70713          	add	a4,a4,-1 # 7fff <.L2+0x7b>
    d488:	16e49a63          	bne	s1,a4,d5fc <.L25>

0000d48c <.LVL36>:
    d48c:	02f12823          	sw	a5,48(sp)
    d490:	03212a23          	sw	s2,52(sp)
    d494:	03312c23          	sw	s3,56(sp)
    d498:	03612e23          	sw	s6,60(sp)

0000d49c <.L10>:
  FP_PACK_SEMIRAW_Q (r, R);
    d49c:	03012783          	lw	a5,48(sp)
    d4a0:	0077f713          	and	a4,a5,7
    d4a4:	04070463          	beqz	a4,d4ec <.L257>
    d4a8:	00f7f713          	and	a4,a5,15
    d4ac:	00400693          	li	a3,4
    d4b0:	02d70e63          	beq	a4,a3,d4ec <.L257>

0000d4b4 <.LBB92>:
    d4b4:	03412703          	lw	a4,52(sp)
    d4b8:	00478793          	add	a5,a5,4
    d4bc:	02f12823          	sw	a5,48(sp)

0000d4c0 <.LVL38>:
    d4c0:	0047b793          	sltiu	a5,a5,4

0000d4c4 <.LVL39>:
    d4c4:	00f707b3          	add	a5,a4,a5
    d4c8:	02f12a23          	sw	a5,52(sp)

0000d4cc <.LVL40>:
    d4cc:	00e7b7b3          	sltu	a5,a5,a4

0000d4d0 <.LVL41>:
    d4d0:	03812703          	lw	a4,56(sp)
    d4d4:	00f707b3          	add	a5,a4,a5

0000d4d8 <.LVL42>:
    d4d8:	02f12c23          	sw	a5,56(sp)

0000d4dc <.LVL43>:
    d4dc:	00e7b7b3          	sltu	a5,a5,a4

0000d4e0 <.LVL44>:
    d4e0:	03c12703          	lw	a4,60(sp)
    d4e4:	00e787b3          	add	a5,a5,a4

0000d4e8 <.LVL45>:
    d4e8:	02f12e23          	sw	a5,60(sp)

0000d4ec <.L257>:
    d4ec:	03c12783          	lw	a5,60(sp)
    d4f0:	00c79713          	sll	a4,a5,0xc
    d4f4:	02075463          	bgez	a4,d51c <.L262>
    d4f8:	00008737          	lui	a4,0x8
    d4fc:	00148493          	add	s1,s1,1

0000d500 <.LVL47>:
    d500:	fff70713          	add	a4,a4,-1 # 7fff <.L2+0x7b>
    d504:	00e49463          	bne	s1,a4,d50c <.LVL47+0xc>
    d508:	1ac0106f          	j	e6b4 <.L263>
    d50c:	fff80737          	lui	a4,0xfff80
    d510:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff69ccf>
    d514:	00e7f7b3          	and	a5,a5,a4
    d518:	02f12e23          	sw	a5,60(sp)

0000d51c <.L262>:
    d51c:	03010793          	add	a5,sp,48
    d520:	03c10613          	add	a2,sp,60

0000d524 <.L265>:
    d524:	0007a703          	lw	a4,0(a5)
    d528:	0047a683          	lw	a3,4(a5)
    d52c:	00478793          	add	a5,a5,4
    d530:	00375713          	srl	a4,a4,0x3
    d534:	01d69693          	sll	a3,a3,0x1d
    d538:	00d76733          	or	a4,a4,a3
    d53c:	fee7ae23          	sw	a4,-4(a5)
    d540:	fec792e3          	bne	a5,a2,d524 <.L265>

0000d544 <.LVL50>:
    d544:	03c12703          	lw	a4,60(sp)

0000d548 <.LBE93>:
    d548:	000086b7          	lui	a3,0x8
    d54c:	fff68793          	add	a5,a3,-1 # 7fff <.L2+0x7b>

0000d550 <.LBB94>:
    d550:	00375713          	srl	a4,a4,0x3
    d554:	02e12e23          	sw	a4,60(sp)

0000d558 <.LBE94>:
    d558:	02f49a63          	bne	s1,a5,d58c <.L266>
    d55c:	03412603          	lw	a2,52(sp)
    d560:	03012783          	lw	a5,48(sp)
    d564:	00c7e7b3          	or	a5,a5,a2
    d568:	03812603          	lw	a2,56(sp)
    d56c:	00c7e7b3          	or	a5,a5,a2
    d570:	00e7e7b3          	or	a5,a5,a4
    d574:	00078c63          	beqz	a5,d58c <.L266>
    d578:	02d12e23          	sw	a3,60(sp)
    d57c:	02012c23          	sw	zero,56(sp)
    d580:	02012a23          	sw	zero,52(sp)
    d584:	02012823          	sw	zero,48(sp)

0000d588 <.LVL51>:
    d588:	00000a93          	li	s5,0

0000d58c <.L266>:
    d58c:	03c12783          	lw	a5,60(sp)
    d590:	01149493          	sll	s1,s1,0x11

0000d594 <.LVL53>:
    d594:	0114d493          	srl	s1,s1,0x11
    d598:	00f11623          	sh	a5,12(sp)

0000d59c <.LBE101>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    d59c:	03012783          	lw	a5,48(sp)

0000d5a0 <.LBB102>:
  FP_PACK_SEMIRAW_Q (r, R);
    d5a0:	00fa9a93          	sll	s5,s5,0xf

0000d5a4 <.LVL54>:
    d5a4:	009aeab3          	or	s5,s5,s1

0000d5a8 <.LBE102>:
  return r;
    d5a8:	00fa2023          	sw	a5,0(s4)
    d5ac:	03412783          	lw	a5,52(sp)

0000d5b0 <.LBB103>:
  FP_PACK_SEMIRAW_Q (r, R);
    d5b0:	01511723          	sh	s5,14(sp)

0000d5b4 <.LBE103>:
}
    d5b4:	06c12083          	lw	ra,108(sp)
  return r;
    d5b8:	00fa2223          	sw	a5,4(s4)
    d5bc:	03812783          	lw	a5,56(sp)

0000d5c0 <.LVL56>:
}
    d5c0:	06812403          	lw	s0,104(sp)
    d5c4:	06412483          	lw	s1,100(sp)
  return r;
    d5c8:	00fa2423          	sw	a5,8(s4)
    d5cc:	00c12783          	lw	a5,12(sp)
}
    d5d0:	06012903          	lw	s2,96(sp)
    d5d4:	05c12983          	lw	s3,92(sp)
  return r;
    d5d8:	00fa2623          	sw	a5,12(s4)
}
    d5dc:	05412a83          	lw	s5,84(sp)
    d5e0:	05012b03          	lw	s6,80(sp)
    d5e4:	04c12b83          	lw	s7,76(sp)

0000d5e8 <.LVL57>:
    d5e8:	04812c03          	lw	s8,72(sp)
    d5ec:	000a0513          	mv	a0,s4
    d5f0:	05812a03          	lw	s4,88(sp)
    d5f4:	07010113          	add	sp,sp,112

0000d5f8 <.LVL59>:
    d5f8:	00008067          	ret

0000d5fc <.L25>:
  FP_SUB_Q (R, A, B);
    d5fc:	02c12703          	lw	a4,44(sp)
    d600:	000806b7          	lui	a3,0x80
    d604:	00d76733          	or	a4,a4,a3
    d608:	02e12623          	sw	a4,44(sp)

0000d60c <.LDL1>:
    d60c:	07400713          	li	a4,116
    d610:	01175463          	bge	a4,a7,d618 <.LDL1+0xc>
    d614:	0c00106f          	j	e6d4 <.L26>
    d618:	00088613          	mv	a2,a7

0000d61c <.L267>:
    d61c:	40565693          	sra	a3,a2,0x5

0000d620 <.LVL62>:
    d620:	00030513          	mv	a0,t1
    d624:	01f67613          	and	a2,a2,31

0000d628 <.LVL63>:
    d628:	00000713          	li	a4,0
    d62c:	00000593          	li	a1,0

0000d630 <.L27>:
    d630:	02d59c63          	bne	a1,a3,d668 <.L28>
    d634:	00300593          	li	a1,3

0000d638 <.LVL65>:
    d638:	40d585b3          	sub	a1,a1,a3
    d63c:	00269513          	sll	a0,a3,0x2
    d640:	02061e63          	bnez	a2,d67c <.L29>

0000d644 <.L30>:
    d644:	00a308b3          	add	a7,t1,a0
    d648:	0008a883          	lw	a7,0(a7)
    d64c:	00160613          	add	a2,a2,1

0000d650 <.LVL67>:
    d650:	00430313          	add	t1,t1,4
    d654:	ff132e23          	sw	a7,-4(t1)

0000d658 <.LVL68>:
    d658:	fec5d6e3          	bge	a1,a2,d644 <.L30>
    d65c:	00400613          	li	a2,4

0000d660 <.LVL69>:
    d660:	40d606b3          	sub	a3,a2,a3

0000d664 <.LVL70>:
    d664:	0640006f          	j	d6c8 <.L34>

0000d668 <.L28>:
    d668:	00052883          	lw	a7,0(a0)
    d66c:	00158593          	add	a1,a1,1

0000d670 <.LVL72>:
    d670:	00450513          	add	a0,a0,4
    d674:	01176733          	or	a4,a4,a7

0000d678 <.LVL73>:
    d678:	fb9ff06f          	j	d630 <.L27>

0000d67c <.L29>:
    d67c:	04050893          	add	a7,a0,64
    d680:	002888b3          	add	a7,a7,sp
    d684:	fe08a883          	lw	a7,-32(a7)
    d688:	02000e13          	li	t3,32
    d68c:	40ce0e33          	sub	t3,t3,a2
    d690:	01c898b3          	sll	a7,a7,t3
    d694:	01176733          	or	a4,a4,a7

0000d698 <.LVL75>:
    d698:	00000e93          	li	t4,0
    d69c:	00a808b3          	add	a7,a6,a0
    d6a0:	40a00533          	neg	a0,a0

0000d6a4 <.L32>:
    d6a4:	14bec263          	blt	t4,a1,d7e8 <.L33>
    d6a8:	00400513          	li	a0,4
    d6ac:	40d506b3          	sub	a3,a0,a3

0000d6b0 <.LVL77>:
    d6b0:	02c12503          	lw	a0,44(sp)
    d6b4:	00259593          	sll	a1,a1,0x2

0000d6b8 <.LVL78>:
    d6b8:	04058593          	add	a1,a1,64
    d6bc:	002585b3          	add	a1,a1,sp
    d6c0:	00c55633          	srl	a2,a0,a2

0000d6c4 <.LVL79>:
    d6c4:	fec5a023          	sw	a2,-32(a1)

0000d6c8 <.L34>:
    d6c8:	00400613          	li	a2,4
    d6cc:	40d60633          	sub	a2,a2,a3
    d6d0:	00261613          	sll	a2,a2,0x2
    d6d4:	00269693          	sll	a3,a3,0x2
    d6d8:	00800593          	li	a1,8
    d6dc:	00d806b3          	add	a3,a6,a3
    d6e0:	00b66a63          	bltu	a2,a1,d6f4 <.L35>
    d6e4:	0006a023          	sw	zero,0(a3) # 80000 <_ebss+0x69cd0>
    d6e8:	0006a223          	sw	zero,4(a3)
    d6ec:	ff860613          	add	a2,a2,-8
    d6f0:	00868693          	add	a3,a3,8

0000d6f4 <.L35>:
    d6f4:	00400593          	li	a1,4
    d6f8:	00b66463          	bltu	a2,a1,d700 <.L36>
    d6fc:	0006a023          	sw	zero,0(a3)

0000d700 <.L36>:
    d700:	02012683          	lw	a3,32(sp)

0000d704 <.LBB19>:
    d704:	00e03733          	snez	a4,a4

0000d708 <.LBE19>:
    d708:	00d76733          	or	a4,a4,a3

0000d70c <.L37>:
    d70c:	02412683          	lw	a3,36(sp)

0000d710 <.LBB21>:
    d710:	02e12023          	sw	a4,32(sp)

0000d714 <.LBB22>:
    d714:	00e78733          	add	a4,a5,a4
    d718:	01268933          	add	s2,a3,s2
    d71c:	02e12823          	sw	a4,48(sp)

0000d720 <.LVL84>:
    d720:	00f73733          	sltu	a4,a4,a5

0000d724 <.LVL85>:
    d724:	02812783          	lw	a5,40(sp)
    d728:	00e90733          	add	a4,s2,a4

0000d72c <.LVL86>:
    d72c:	02e12a23          	sw	a4,52(sp)

0000d730 <.LVL87>:
    d730:	00d936b3          	sltu	a3,s2,a3

0000d734 <.LVL88>:
    d734:	01273733          	sltu	a4,a4,s2

0000d738 <.LVL89>:
    d738:	013789b3          	add	s3,a5,s3

0000d73c <.LVL90>:
    d73c:	00e6e733          	or	a4,a3,a4

0000d740 <.LVL91>:
    d740:	00e98733          	add	a4,s3,a4
    d744:	02e12c23          	sw	a4,56(sp)

0000d748 <.LVL92>:
    d748:	00f9b7b3          	sltu	a5,s3,a5

0000d74c <.LVL93>:
    d74c:	01373733          	sltu	a4,a4,s3

0000d750 <.LVL94>:
    d750:	00e7e7b3          	or	a5,a5,a4

0000d754 <.LVL95>:
    d754:	02c12703          	lw	a4,44(sp)

0000d758 <.LVL96>:
    d758:	00eb0733          	add	a4,s6,a4
    d75c:	00e787b3          	add	a5,a5,a4

0000d760 <.L22>:
    d760:	02f12e23          	sw	a5,60(sp)

0000d764 <.LBE23>:
    d764:	00c79713          	sll	a4,a5,0xc
    d768:	d2075ae3          	bgez	a4,d49c <.L10>

0000d76c <.LBB24>:
    d76c:	03012683          	lw	a3,48(sp)

0000d770 <.LBE24>:
    d770:	fff80737          	lui	a4,0xfff80
    d774:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff69ccf>
    d778:	00e7f7b3          	and	a5,a5,a4
    d77c:	02f12e23          	sw	a5,60(sp)
    d780:	00148493          	add	s1,s1,1

0000d784 <.LBB26>:
    d784:	01f69693          	sll	a3,a3,0x1f

0000d788 <.LVL100>:
    d788:	03010713          	add	a4,sp,48
    d78c:	03c10513          	add	a0,sp,60

0000d790 <.L115>:
    d790:	00072603          	lw	a2,0(a4)
    d794:	00472583          	lw	a1,4(a4)
    d798:	00470713          	add	a4,a4,4
    d79c:	00165613          	srl	a2,a2,0x1
    d7a0:	01f59593          	sll	a1,a1,0x1f
    d7a4:	00b66633          	or	a2,a2,a1
    d7a8:	fec72e23          	sw	a2,-4(a4)
    d7ac:	fee512e3          	bne	a0,a4,d790 <.L115>

0000d7b0 <.LBE26>:
    d7b0:	03012703          	lw	a4,48(sp)

0000d7b4 <.LBB27>:
    d7b4:	0017d793          	srl	a5,a5,0x1
    d7b8:	02f12e23          	sw	a5,60(sp)

0000d7bc <.LBB28>:
    d7bc:	00d037b3          	snez	a5,a3

0000d7c0 <.LBE28>:
    d7c0:	00f767b3          	or	a5,a4,a5
    d7c4:	02f12823          	sw	a5,48(sp)

0000d7c8 <.LBE29>:
    d7c8:	000087b7          	lui	a5,0x8
    d7cc:	fff78793          	add	a5,a5,-1 # 7fff <.L2+0x7b>
    d7d0:	ccf496e3          	bne	s1,a5,d49c <.L10>

0000d7d4 <.LVL104>:
    d7d4:	02012e23          	sw	zero,60(sp)
    d7d8:	02012c23          	sw	zero,56(sp)
    d7dc:	02012a23          	sw	zero,52(sp)
    d7e0:	02012823          	sw	zero,48(sp)

0000d7e4 <.LBB105>:
  FP_PACK_SEMIRAW_Q (r, R);
    d7e4:	cb9ff06f          	j	d49c <.L10>

0000d7e8 <.L33>:
  FP_SUB_Q (R, A, B);
    d7e8:	0008a303          	lw	t1,0(a7)
    d7ec:	0048af03          	lw	t5,4(a7)
    d7f0:	00a88fb3          	add	t6,a7,a0
    d7f4:	00c35333          	srl	t1,t1,a2
    d7f8:	01cf1f33          	sll	t5,t5,t3
    d7fc:	01e36333          	or	t1,t1,t5
    d800:	006fa023          	sw	t1,0(t6)

0000d804 <.LVL107>:
    d804:	001e8e93          	add	t4,t4,1

0000d808 <.LVL108>:
    d808:	00488893          	add	a7,a7,4
    d80c:	e99ff06f          	j	d6a4 <.L32>

0000d810 <.L7>:
    d810:	02412903          	lw	s2,36(sp)

0000d814 <.LVL110>:
    d814:	02812983          	lw	s3,40(sp)
    d818:	02c12b03          	lw	s6,44(sp)

0000d81c <.LBB108>:
    d81c:	26088263          	beqz	a7,da80 <.L48>
    d820:	409b8833          	sub	a6,s7,s1

0000d824 <.LVL111>:
    d824:	0a049c63          	bnez	s1,d8dc <.L49>
    d828:	01412683          	lw	a3,20(sp)
    d82c:	01812703          	lw	a4,24(sp)
    d830:	01c12883          	lw	a7,28(sp)
    d834:	00e6e5b3          	or	a1,a3,a4
    d838:	0115e5b3          	or	a1,a1,a7
    d83c:	00f5e5b3          	or	a1,a1,a5
    d840:	00059e63          	bnez	a1,d85c <.L50>

0000d844 <.LVL112>:
    d844:	02812823          	sw	s0,48(sp)
    d848:	03212a23          	sw	s2,52(sp)
    d84c:	03312c23          	sw	s3,56(sp)
    d850:	03612e23          	sw	s6,60(sp)

0000d854 <.L360>:
    d854:	00080493          	mv	s1,a6

0000d858 <.LVL114>:
    d858:	c45ff06f          	j	d49c <.L10>

0000d85c <.L50>:
    d85c:	fff80593          	add	a1,a6,-1

0000d860 <.LVL116>:
    d860:	04059663          	bnez	a1,d8ac <.L51>

0000d864 <.LBB31>:
    d864:	00878433          	add	s0,a5,s0
    d868:	01268933          	add	s2,a3,s2
    d86c:	02812823          	sw	s0,48(sp)

0000d870 <.LVL117>:
    d870:	00f43433          	sltu	s0,s0,a5

0000d874 <.LVL118>:
    d874:	00890433          	add	s0,s2,s0

0000d878 <.LVL119>:
    d878:	02812a23          	sw	s0,52(sp)

0000d87c <.LVL120>:
    d87c:	00d936b3          	sltu	a3,s2,a3

0000d880 <.LVL121>:
    d880:	01243433          	sltu	s0,s0,s2

0000d884 <.LVL122>:
    d884:	013709b3          	add	s3,a4,s3

0000d888 <.LVL123>:
    d888:	0086e6b3          	or	a3,a3,s0

0000d88c <.LVL124>:
    d88c:	00d986b3          	add	a3,s3,a3
    d890:	02d12c23          	sw	a3,56(sp)

0000d894 <.LVL125>:
    d894:	00e9b7b3          	sltu	a5,s3,a4

0000d898 <.LVL126>:
    d898:	0136b6b3          	sltu	a3,a3,s3

0000d89c <.LVL127>:
    d89c:	00d7e7b3          	or	a5,a5,a3

0000d8a0 <.LVL128>:
    d8a0:	016888b3          	add	a7,a7,s6
    d8a4:	011787b3          	add	a5,a5,a7
    d8a8:	bb9ff06f          	j	d460 <.L355>

0000d8ac <.L51>:
    d8ac:	000087b7          	lui	a5,0x8
    d8b0:	fff78793          	add	a5,a5,-1 # 7fff <.L2+0x7b>
    d8b4:	62f81ae3          	bne	a6,a5,e6e8 <.L62>

0000d8b8 <.L63>:
    d8b8:	02812823          	sw	s0,48(sp)

0000d8bc <.L364>:
    d8bc:	03212a23          	sw	s2,52(sp)
    d8c0:	03312c23          	sw	s3,56(sp)
    d8c4:	03612e23          	sw	s6,60(sp)

0000d8c8 <.L359>:
    d8c8:	000084b7          	lui	s1,0x8

0000d8cc <.LVL132>:
    d8cc:	fff48493          	add	s1,s1,-1 # 7fff <.L2+0x7b>
    d8d0:	bcdff06f          	j	d49c <.L10>

0000d8d4 <.L274>:
    d8d4:	00078413          	mv	s0,a5
    d8d8:	fe1ff06f          	j	d8b8 <.L63>

0000d8dc <.L49>:
    d8dc:	000087b7          	lui	a5,0x8
    d8e0:	fff78793          	add	a5,a5,-1 # 7fff <.L2+0x7b>
    d8e4:	fcfb8ae3          	beq	s7,a5,d8b8 <.L63>
    d8e8:	01c12783          	lw	a5,28(sp)
    d8ec:	00080737          	lui	a4,0x80
    d8f0:	00e7e7b3          	or	a5,a5,a4
    d8f4:	00f12e23          	sw	a5,28(sp)

0000d8f8 <.LDL2>:
    d8f8:	07400793          	li	a5,116
    d8fc:	5f07cae3          	blt	a5,a6,e6f0 <.L64>
    d900:	00080593          	mv	a1,a6

0000d904 <.L268>:
    d904:	02000713          	li	a4,32
    d908:	02e5c733          	div	a4,a1,a4

0000d90c <.LVL136>:
    d90c:	00060693          	mv	a3,a2
    d910:	00000493          	li	s1,0

0000d914 <.LVL137>:
    d914:	00000793          	li	a5,0

0000d918 <.L65>:
    d918:	02e7ce63          	blt	a5,a4,d954 <.L66>
    d91c:	00300793          	li	a5,3

0000d920 <.LVL139>:
    d920:	01f5f893          	and	a7,a1,31
    d924:	40e787b3          	sub	a5,a5,a4
    d928:	00271813          	sll	a6,a4,0x2
    d92c:	02089e63          	bnez	a7,d968 <.L67>

0000d930 <.L68>:
    d930:	010606b3          	add	a3,a2,a6
    d934:	0006a683          	lw	a3,0(a3)
    d938:	00188893          	add	a7,a7,1

0000d93c <.LVL141>:
    d93c:	00460613          	add	a2,a2,4
    d940:	fed62e23          	sw	a3,-4(a2)

0000d944 <.LVL142>:
    d944:	ff17d6e3          	bge	a5,a7,d930 <.L68>
    d948:	00400793          	li	a5,4
    d94c:	40e78733          	sub	a4,a5,a4

0000d950 <.LVL143>:
    d950:	0780006f          	j	d9c8 <.L73>

0000d954 <.L66>:
    d954:	0006a803          	lw	a6,0(a3)
    d958:	00178793          	add	a5,a5,1

0000d95c <.LVL145>:
    d95c:	00468693          	add	a3,a3,4
    d960:	0104e4b3          	or	s1,s1,a6

0000d964 <.LVL146>:
    d964:	fb5ff06f          	j	d918 <.L65>

0000d968 <.L67>:
    d968:	02000693          	li	a3,32
    d96c:	02d5e5b3          	rem	a1,a1,a3

0000d970 <.LVL148>:
    d970:	40b685b3          	sub	a1,a3,a1
    d974:	00070693          	mv	a3,a4
    d978:	00075463          	bgez	a4,d980 <.L70>

0000d97c <.LVL149>:
    d97c:	00000693          	li	a3,0

0000d980 <.L70>:
    d980:	00269693          	sll	a3,a3,0x2
    d984:	04068693          	add	a3,a3,64
    d988:	002686b3          	add	a3,a3,sp
    d98c:	fd06a683          	lw	a3,-48(a3)
    d990:	00000313          	li	t1,0
    d994:	00b696b3          	sll	a3,a3,a1
    d998:	00d4e4b3          	or	s1,s1,a3

0000d99c <.LVL151>:
    d99c:	010506b3          	add	a3,a0,a6
    d9a0:	41000833          	neg	a6,a6

0000d9a4 <.L71>:
    d9a4:	0af34a63          	blt	t1,a5,da58 <.L72>
    d9a8:	00400693          	li	a3,4
    d9ac:	40e68733          	sub	a4,a3,a4

0000d9b0 <.LVL153>:
    d9b0:	01c12683          	lw	a3,28(sp)
    d9b4:	00279793          	sll	a5,a5,0x2

0000d9b8 <.LVL154>:
    d9b8:	04078793          	add	a5,a5,64
    d9bc:	002787b3          	add	a5,a5,sp
    d9c0:	0116d6b3          	srl	a3,a3,a7
    d9c4:	fcd7a823          	sw	a3,-48(a5)

0000d9c8 <.L73>:
    d9c8:	00572793          	slti	a5,a4,5
    d9cc:	00000613          	li	a2,0
    d9d0:	00078863          	beqz	a5,d9e0 <.L75>
    d9d4:	00400613          	li	a2,4
    d9d8:	40e60633          	sub	a2,a2,a4
    d9dc:	00261613          	sll	a2,a2,0x2

0000d9e0 <.L75>:
    d9e0:	00271713          	sll	a4,a4,0x2
    d9e4:	00e50533          	add	a0,a0,a4
    d9e8:	00000593          	li	a1,0
    d9ec:	bacf50ef          	jal	2d98 <__GI_memset>

0000d9f0 <.LBE33>:
    d9f0:	01012703          	lw	a4,16(sp)

0000d9f4 <.LBB34>:
    d9f4:	009037b3          	snez	a5,s1

0000d9f8 <.LBE34>:
    d9f8:	00e7e7b3          	or	a5,a5,a4

0000d9fc <.L76>:
    d9fc:	01412683          	lw	a3,20(sp)

0000da00 <.LBB36>:
    da00:	00f12823          	sw	a5,16(sp)

0000da04 <.LBB37>:
    da04:	00f407b3          	add	a5,s0,a5
    da08:	01268933          	add	s2,a3,s2
    da0c:	02f12823          	sw	a5,48(sp)

0000da10 <.LVL158>:
    da10:	0087b7b3          	sltu	a5,a5,s0

0000da14 <.LVL159>:
    da14:	00f90733          	add	a4,s2,a5
    da18:	01812783          	lw	a5,24(sp)

0000da1c <.LVL160>:
    da1c:	02e12a23          	sw	a4,52(sp)

0000da20 <.LVL161>:
    da20:	00d936b3          	sltu	a3,s2,a3

0000da24 <.LVL162>:
    da24:	01273733          	sltu	a4,a4,s2

0000da28 <.LVL163>:
    da28:	013789b3          	add	s3,a5,s3

0000da2c <.LVL164>:
    da2c:	00e6e733          	or	a4,a3,a4

0000da30 <.LVL165>:
    da30:	00e98733          	add	a4,s3,a4
    da34:	02e12c23          	sw	a4,56(sp)

0000da38 <.LVL166>:
    da38:	00f9b7b3          	sltu	a5,s3,a5

0000da3c <.LVL167>:
    da3c:	01373733          	sltu	a4,a4,s3

0000da40 <.LVL168>:
    da40:	00e7e7b3          	or	a5,a5,a4

0000da44 <.LVL169>:
    da44:	01c12703          	lw	a4,28(sp)

0000da48 <.LBE37>:
    da48:	000b8493          	mv	s1,s7

0000da4c <.LBB38>:
    da4c:	00eb0733          	add	a4,s6,a4
    da50:	00e787b3          	add	a5,a5,a4

0000da54 <.LBE38>:
    da54:	d0dff06f          	j	d760 <.L22>

0000da58 <.L72>:
    da58:	0006a603          	lw	a2,0(a3)
    da5c:	0046ae03          	lw	t3,4(a3)
    da60:	01068eb3          	add	t4,a3,a6
    da64:	01165633          	srl	a2,a2,a7
    da68:	00be1e33          	sll	t3,t3,a1
    da6c:	01c66633          	or	a2,a2,t3
    da70:	00cea023          	sw	a2,0(t4)

0000da74 <.LVL172>:
    da74:	00130313          	add	t1,t1,1

0000da78 <.LVL173>:
    da78:	00468693          	add	a3,a3,4
    da7c:	f29ff06f          	j	d9a4 <.L71>

0000da80 <.L48>:
    da80:	00148813          	add	a6,s1,1
    da84:	01181893          	sll	a7,a6,0x11
    da88:	0128d893          	srl	a7,a7,0x12
    da8c:	01412683          	lw	a3,20(sp)
    da90:	01812703          	lw	a4,24(sp)
    da94:	01c12603          	lw	a2,28(sp)
    da98:	03010593          	add	a1,sp,48
    da9c:	03c10513          	add	a0,sp,60
    daa0:	10089e63          	bnez	a7,dbbc <.L87>
    daa4:	00e6e833          	or	a6,a3,a4
    daa8:	00c86833          	or	a6,a6,a2
    daac:	00f86833          	or	a6,a6,a5
    dab0:	0a049863          	bnez	s1,db60 <.L88>

0000dab4 <.LVL175>:
    dab4:	00081e63          	bnez	a6,dad0 <.L89>
    dab8:	02812823          	sw	s0,48(sp)
    dabc:	03212a23          	sw	s2,52(sp)
    dac0:	03312c23          	sw	s3,56(sp)
    dac4:	03612e23          	sw	s6,60(sp)

0000dac8 <.L357>:
    dac8:	00000493          	li	s1,0
    dacc:	9d1ff06f          	j	d49c <.L10>

0000dad0 <.L89>:
    dad0:	013965b3          	or	a1,s2,s3
    dad4:	0165e5b3          	or	a1,a1,s6
    dad8:	0085e5b3          	or	a1,a1,s0
    dadc:	00059c63          	bnez	a1,daf4 <.L90>
    dae0:	02f12823          	sw	a5,48(sp)
    dae4:	02d12a23          	sw	a3,52(sp)
    dae8:	02e12c23          	sw	a4,56(sp)
    daec:	02c12e23          	sw	a2,60(sp)

0000daf0 <.LBB123>:
  FP_PACK_SEMIRAW_Q (r, R);
    daf0:	9adff06f          	j	d49c <.L10>

0000daf4 <.L90>:
  FP_SUB_Q (R, A, B);
    daf4:	00878433          	add	s0,a5,s0
    daf8:	01268933          	add	s2,a3,s2
    dafc:	02812823          	sw	s0,48(sp)

0000db00 <.LVL180>:
    db00:	00f43433          	sltu	s0,s0,a5

0000db04 <.LVL181>:
    db04:	00890433          	add	s0,s2,s0

0000db08 <.LVL182>:
    db08:	02812a23          	sw	s0,52(sp)

0000db0c <.LVL183>:
    db0c:	00d936b3          	sltu	a3,s2,a3

0000db10 <.LVL184>:
    db10:	01243433          	sltu	s0,s0,s2

0000db14 <.LVL185>:
    db14:	013709b3          	add	s3,a4,s3

0000db18 <.LVL186>:
    db18:	0086e6b3          	or	a3,a3,s0

0000db1c <.LVL187>:
    db1c:	00d986b3          	add	a3,s3,a3
    db20:	02d12c23          	sw	a3,56(sp)

0000db24 <.LVL188>:
    db24:	00e9b733          	sltu	a4,s3,a4

0000db28 <.LVL189>:
    db28:	0136b6b3          	sltu	a3,a3,s3

0000db2c <.LVL190>:
    db2c:	00d76733          	or	a4,a4,a3

0000db30 <.LVL191>:
    db30:	01660633          	add	a2,a2,s6
    db34:	00c70733          	add	a4,a4,a2

0000db38 <.LBE40>:
    db38:	00c71793          	sll	a5,a4,0xc

0000db3c <.LVL192>:
    db3c:	0007c663          	bltz	a5,db48 <.L101>

0000db40 <.LBB41>:
    db40:	02e12e23          	sw	a4,60(sp)
    db44:	959ff06f          	j	d49c <.L10>

0000db48 <.L101>:
    db48:	fff807b7          	lui	a5,0xfff80
    db4c:	fff78793          	add	a5,a5,-1 # fff7ffff <_ebss+0xfff69ccf>
    db50:	00f77733          	and	a4,a4,a5
    db54:	02e12e23          	sw	a4,60(sp)

0000db58 <.LBB126>:
    db58:	00100493          	li	s1,1

0000db5c <.LVL194>:
    db5c:	941ff06f          	j	d49c <.L10>

0000db60 <.L88>:
    db60:	1a080463          	beqz	a6,dd08 <.L271>
    db64:	01396933          	or	s2,s2,s3
    db68:	01696933          	or	s2,s2,s6
    db6c:	00896933          	or	s2,s2,s0
    db70:	1a090063          	beqz	s2,dd10 <.L272>

0000db74 <.LBB129>:
    db74:	000087b7          	lui	a5,0x8
    db78:	02f12e23          	sw	a5,60(sp)
    db7c:	02012c23          	sw	zero,56(sp)
    db80:	02012a23          	sw	zero,52(sp)
    db84:	02012823          	sw	zero,48(sp)

0000db88 <.LBB42>:
    db88:	00050793          	mv	a5,a0

0000db8c <.L102>:
    db8c:	0007a703          	lw	a4,0(a5) # 8000 <.L2+0x7c>
    db90:	ffc7a683          	lw	a3,-4(a5)
    db94:	ffc78793          	add	a5,a5,-4
    db98:	00371713          	sll	a4,a4,0x3
    db9c:	01d6d693          	srl	a3,a3,0x1d
    dba0:	00d76733          	or	a4,a4,a3
    dba4:	00e7a223          	sw	a4,4(a5)
    dba8:	fef592e3          	bne	a1,a5,db8c <.L102>

0000dbac <.L213>:
    dbac:	000084b7          	lui	s1,0x8

0000dbb0 <.LVL200>:
    dbb0:	fff48493          	add	s1,s1,-1 # 7fff <.L2+0x7b>

0000dbb4 <.L358>:
    dbb4:	00000a93          	li	s5,0
    dbb8:	8e5ff06f          	j	d49c <.L10>

0000dbbc <.L87>:
    dbbc:	00878433          	add	s0,a5,s0
    dbc0:	01268933          	add	s2,a3,s2
    dbc4:	02812823          	sw	s0,48(sp)

0000dbc8 <.LVL203>:
    dbc8:	00f43433          	sltu	s0,s0,a5

0000dbcc <.LVL204>:
    dbcc:	00890433          	add	s0,s2,s0

0000dbd0 <.LVL205>:
    dbd0:	02812a23          	sw	s0,52(sp)

0000dbd4 <.LVL206>:
    dbd4:	00d936b3          	sltu	a3,s2,a3

0000dbd8 <.LVL207>:
    dbd8:	01243433          	sltu	s0,s0,s2

0000dbdc <.LVL208>:
    dbdc:	013709b3          	add	s3,a4,s3

0000dbe0 <.LVL209>:
    dbe0:	0086e6b3          	or	a3,a3,s0

0000dbe4 <.LVL210>:
    dbe4:	00d986b3          	add	a3,s3,a3
    dbe8:	02d12c23          	sw	a3,56(sp)

0000dbec <.LVL211>:
    dbec:	00e9b733          	sltu	a4,s3,a4

0000dbf0 <.LVL212>:
    dbf0:	0136b6b3          	sltu	a3,a3,s3

0000dbf4 <.LVL213>:
    dbf4:	00d76733          	or	a4,a4,a3

0000dbf8 <.LVL214>:
    dbf8:	01660633          	add	a2,a2,s6
    dbfc:	00c70733          	add	a4,a4,a2
    dc00:	02e12e23          	sw	a4,60(sp)

0000dc04 <.LBB44>:
    dc04:	00058793          	mv	a5,a1

0000dc08 <.L113>:
    dc08:	0007a683          	lw	a3,0(a5)
    dc0c:	0047a603          	lw	a2,4(a5)
    dc10:	00478793          	add	a5,a5,4
    dc14:	0016d693          	srl	a3,a3,0x1
    dc18:	01f61613          	sll	a2,a2,0x1f
    dc1c:	00c6e6b3          	or	a3,a3,a2
    dc20:	fed7ae23          	sw	a3,-4(a5)
    dc24:	fef512e3          	bne	a0,a5,dc08 <.L113>

0000dc28 <.LBE44>:
    dc28:	000087b7          	lui	a5,0x8
    dc2c:	fff78793          	add	a5,a5,-1 # 7fff <.L2+0x7b>
    dc30:	00f80863          	beq	a6,a5,dc40 <.L114>

0000dc34 <.LBB47>:
    dc34:	00175713          	srl	a4,a4,0x1
    dc38:	02e12e23          	sw	a4,60(sp)
    dc3c:	c19ff06f          	j	d854 <.L360>

0000dc40 <.L114>:
    dc40:	02012e23          	sw	zero,60(sp)
    dc44:	02012c23          	sw	zero,56(sp)
    dc48:	02012a23          	sw	zero,52(sp)
    dc4c:	02012823          	sw	zero,48(sp)
    dc50:	c05ff06f          	j	d854 <.L360>

0000dc54 <.L6>:
    dc54:	29105c63          	blez	a7,deec <.L118>

0000dc58 <.LBB133>:
    dc58:	01412903          	lw	s2,20(sp)

0000dc5c <.LVL221>:
    dc5c:	01812983          	lw	s3,24(sp)
    dc60:	01c12b03          	lw	s6,28(sp)

0000dc64 <.LBB134>:
    dc64:	0a0b9e63          	bnez	s7,dd20 <.L119>
    dc68:	02412e03          	lw	t3,36(sp)
    dc6c:	02812503          	lw	a0,40(sp)
    dc70:	02c12683          	lw	a3,44(sp)
    dc74:	00ae6733          	or	a4,t3,a0
    dc78:	00d76733          	or	a4,a4,a3
    dc7c:	00876733          	or	a4,a4,s0
    dc80:	f6070e63          	beqz	a4,d3fc <.L363>
    dc84:	fff88e93          	add	t4,a7,-1

0000dc88 <.LVL222>:
    dc88:	040e9c63          	bnez	t4,dce0 <.L121>

0000dc8c <.LBB61>:
    dc8c:	40878733          	sub	a4,a5,s0

0000dc90 <.LVL224>:
    dc90:	41c90633          	sub	a2,s2,t3

0000dc94 <.LVL225>:
    dc94:	00e7b5b3          	sltu	a1,a5,a4
    dc98:	00c93833          	sltu	a6,s2,a2

0000dc9c <.LVL226>:
    dc9c:	40b60633          	sub	a2,a2,a1

0000dca0 <.LVL227>:
    dca0:	00000593          	li	a1,0
    dca4:	00e7f663          	bgeu	a5,a4,dcb0 <.L126>
    dca8:	412e0e33          	sub	t3,t3,s2
    dcac:	001e3593          	seqz	a1,t3

0000dcb0 <.L126>:
    dcb0:	0105e7b3          	or	a5,a1,a6

0000dcb4 <.LVL228>:
    dcb4:	40a985b3          	sub	a1,s3,a0

0000dcb8 <.LVL229>:
    dcb8:	00b9b833          	sltu	a6,s3,a1

0000dcbc <.LVL230>:
    dcbc:	40f585b3          	sub	a1,a1,a5

0000dcc0 <.LVL231>:
    dcc0:	00078663          	beqz	a5,dccc <.L129>
    dcc4:	41350533          	sub	a0,a0,s3
    dcc8:	00153e93          	seqz	t4,a0

0000dccc <.L129>:
    dccc:	40db07b3          	sub	a5,s6,a3

0000dcd0 <.LVL233>:
    dcd0:	010ee6b3          	or	a3,t4,a6

0000dcd4 <.LVL234>:
    dcd4:	40d787b3          	sub	a5,a5,a3

0000dcd8 <.L356>:
    dcd8:	00100493          	li	s1,1

0000dcdc <.LVL236>:
    dcdc:	1bc0006f          	j	de98 <.L130>

0000dce0 <.L121>:
    dce0:	00008737          	lui	a4,0x8
    dce4:	fff70713          	add	a4,a4,-1 # 7fff <.L2+0x7b>
    dce8:	f8e88863          	beq	a7,a4,d478 <.L23>
    dcec:	07400713          	li	a4,116
    dcf0:	05d75c63          	bge	a4,t4,dd48 <.L269>

0000dcf4 <.L132>:
    dcf4:	02012623          	sw	zero,44(sp)
    dcf8:	02012423          	sw	zero,40(sp)
    dcfc:	02012223          	sw	zero,36(sp)
    dd00:	00100713          	li	a4,1
    dd04:	1340006f          	j	de38 <.L143>

0000dd08 <.L271>:
    dd08:	00040793          	mv	a5,s0
    dd0c:	f6cff06f          	j	d478 <.L23>

0000dd10 <.L272>:
    dd10:	00068913          	mv	s2,a3
    dd14:	00070993          	mv	s3,a4
    dd18:	00060b13          	mv	s6,a2
    dd1c:	f5cff06f          	j	d478 <.L23>

0000dd20 <.L119>:
    dd20:	00008737          	lui	a4,0x8
    dd24:	fff70713          	add	a4,a4,-1 # 7fff <.L2+0x7b>
    dd28:	bae486e3          	beq	s1,a4,d8d4 <.L274>
    dd2c:	02c12703          	lw	a4,44(sp)
    dd30:	000806b7          	lui	a3,0x80
    dd34:	00d76733          	or	a4,a4,a3
    dd38:	02e12623          	sw	a4,44(sp)

0000dd3c <.LDL3>:
    dd3c:	07400713          	li	a4,116
    dd40:	fb174ae3          	blt	a4,a7,dcf4 <.L132>
    dd44:	00088e93          	mv	t4,a7

0000dd48 <.L269>:
    dd48:	405ed693          	sra	a3,t4,0x5

0000dd4c <.LVL242>:
    dd4c:	00030593          	mv	a1,t1
    dd50:	01fefe93          	and	t4,t4,31

0000dd54 <.LVL243>:
    dd54:	00000713          	li	a4,0
    dd58:	00000613          	li	a2,0

0000dd5c <.L133>:
    dd5c:	02d61c63          	bne	a2,a3,dd94 <.L134>
    dd60:	00300613          	li	a2,3

0000dd64 <.LVL245>:
    dd64:	40d60633          	sub	a2,a2,a3
    dd68:	00269593          	sll	a1,a3,0x2
    dd6c:	020e9e63          	bnez	t4,dda8 <.L135>

0000dd70 <.L136>:
    dd70:	00b30533          	add	a0,t1,a1
    dd74:	00052503          	lw	a0,0(a0)
    dd78:	001e8e93          	add	t4,t4,1

0000dd7c <.LVL247>:
    dd7c:	00430313          	add	t1,t1,4
    dd80:	fea32e23          	sw	a0,-4(t1)

0000dd84 <.LVL248>:
    dd84:	ffd656e3          	bge	a2,t4,dd70 <.L136>
    dd88:	00400613          	li	a2,4
    dd8c:	40d606b3          	sub	a3,a2,a3

0000dd90 <.LVL249>:
    dd90:	0640006f          	j	ddf4 <.L140>

0000dd94 <.L134>:
    dd94:	0005a503          	lw	a0,0(a1)
    dd98:	00160613          	add	a2,a2,1

0000dd9c <.LVL251>:
    dd9c:	00458593          	add	a1,a1,4
    dda0:	00a76733          	or	a4,a4,a0

0000dda4 <.LVL252>:
    dda4:	fb9ff06f          	j	dd5c <.L133>

0000dda8 <.L135>:
    dda8:	04058513          	add	a0,a1,64
    ddac:	00250533          	add	a0,a0,sp
    ddb0:	fe052503          	lw	a0,-32(a0)
    ddb4:	02000313          	li	t1,32
    ddb8:	41d30333          	sub	t1,t1,t4
    ddbc:	00651533          	sll	a0,a0,t1
    ddc0:	00a76733          	or	a4,a4,a0

0000ddc4 <.LVL254>:
    ddc4:	00000e13          	li	t3,0
    ddc8:	00b80533          	add	a0,a6,a1
    ddcc:	40b005b3          	neg	a1,a1

0000ddd0 <.L138>:
    ddd0:	0ece4a63          	blt	t3,a2,dec4 <.L139>
    ddd4:	00400593          	li	a1,4
    ddd8:	40d586b3          	sub	a3,a1,a3

0000dddc <.LVL256>:
    dddc:	02c12583          	lw	a1,44(sp)
    dde0:	00261613          	sll	a2,a2,0x2

0000dde4 <.LVL257>:
    dde4:	04060613          	add	a2,a2,64
    dde8:	00260633          	add	a2,a2,sp
    ddec:	01d5d5b3          	srl	a1,a1,t4
    ddf0:	feb62023          	sw	a1,-32(a2)

0000ddf4 <.L140>:
    ddf4:	00400613          	li	a2,4
    ddf8:	40d60633          	sub	a2,a2,a3
    ddfc:	00261613          	sll	a2,a2,0x2
    de00:	00269693          	sll	a3,a3,0x2
    de04:	00800593          	li	a1,8
    de08:	00d806b3          	add	a3,a6,a3
    de0c:	00b66a63          	bltu	a2,a1,de20 <.L141>
    de10:	0006a023          	sw	zero,0(a3) # 80000 <_ebss+0x69cd0>
    de14:	0006a223          	sw	zero,4(a3)
    de18:	ff860613          	add	a2,a2,-8
    de1c:	00868693          	add	a3,a3,8

0000de20 <.L141>:
    de20:	00400593          	li	a1,4
    de24:	00b66463          	bltu	a2,a1,de2c <.L142>
    de28:	0006a023          	sw	zero,0(a3)

0000de2c <.L142>:
    de2c:	02012683          	lw	a3,32(sp)

0000de30 <.LBB64>:
    de30:	00e03733          	snez	a4,a4

0000de34 <.LBE64>:
    de34:	00d76733          	or	a4,a4,a3

0000de38 <.L143>:
    de38:	02412583          	lw	a1,36(sp)

0000de3c <.LBB67>:
    de3c:	02e12023          	sw	a4,32(sp)

0000de40 <.LBB68>:
    de40:	40e78733          	sub	a4,a5,a4

0000de44 <.LVL263>:
    de44:	40b90633          	sub	a2,s2,a1

0000de48 <.LVL264>:
    de48:	00e7b6b3          	sltu	a3,a5,a4
    de4c:	00c93533          	sltu	a0,s2,a2

0000de50 <.LVL265>:
    de50:	40d60633          	sub	a2,a2,a3

0000de54 <.LVL266>:
    de54:	00000693          	li	a3,0
    de58:	00e7f663          	bgeu	a5,a4,de64 <.L148>
    de5c:	412585b3          	sub	a1,a1,s2
    de60:	0015b693          	seqz	a3,a1

0000de64 <.L148>:
    de64:	00a6e7b3          	or	a5,a3,a0

0000de68 <.LVL267>:
    de68:	02812503          	lw	a0,40(sp)
    de6c:	00000693          	li	a3,0
    de70:	40a985b3          	sub	a1,s3,a0

0000de74 <.LVL268>:
    de74:	00b9b833          	sltu	a6,s3,a1

0000de78 <.LVL269>:
    de78:	40f585b3          	sub	a1,a1,a5

0000de7c <.LVL270>:
    de7c:	00078663          	beqz	a5,de88 <.L151>
    de80:	41350533          	sub	a0,a0,s3
    de84:	00153693          	seqz	a3,a0

0000de88 <.L151>:
    de88:	02c12783          	lw	a5,44(sp)

0000de8c <.LVL272>:
    de8c:	0106e6b3          	or	a3,a3,a6

0000de90 <.LVL273>:
    de90:	40fb07b3          	sub	a5,s6,a5
    de94:	40d787b3          	sub	a5,a5,a3

0000de98 <.L130>:
    de98:	02e12823          	sw	a4,48(sp)

0000de9c <.LBB70>:
    de9c:	02f12e23          	sw	a5,60(sp)
    dea0:	02b12c23          	sw	a1,56(sp)
    dea4:	02c12a23          	sw	a2,52(sp)

0000dea8 <.LBE70>:
    dea8:	00c79713          	sll	a4,a5,0xc
    deac:	de075863          	bgez	a4,d49c <.L10>

0000deb0 <.LBB71>:
    deb0:	00080737          	lui	a4,0x80
    deb4:	fff70713          	add	a4,a4,-1 # 7ffff <_ebss+0x69ccf>
    deb8:	00e7f7b3          	and	a5,a5,a4
    debc:	02f12e23          	sw	a5,60(sp)
    dec0:	5740006f          	j	e434 <.L233>

0000dec4 <.L139>:
    dec4:	00052883          	lw	a7,0(a0)
    dec8:	00452f03          	lw	t5,4(a0)
    decc:	00b50fb3          	add	t6,a0,a1
    ded0:	01d8d8b3          	srl	a7,a7,t4
    ded4:	006f1f33          	sll	t5,t5,t1
    ded8:	01e8e8b3          	or	a7,a7,t5
    dedc:	011fa023          	sw	a7,0(t6)

0000dee0 <.LVL277>:
    dee0:	001e0e13          	add	t3,t3,1

0000dee4 <.LVL278>:
    dee4:	00450513          	add	a0,a0,4
    dee8:	ee9ff06f          	j	ddd0 <.L138>

0000deec <.L118>:
    deec:	02412983          	lw	s3,36(sp)
    def0:	02812c03          	lw	s8,40(sp)
    def4:	02c12b03          	lw	s6,44(sp)

0000def8 <.LBB137>:
    def8:	28088463          	beqz	a7,e180 <.L152>
    defc:	409b8333          	sub	t1,s7,s1

0000df00 <.LVL280>:
    df00:	0a049e63          	bnez	s1,dfbc <.L153>
    df04:	01412583          	lw	a1,20(sp)
    df08:	01812803          	lw	a6,24(sp)
    df0c:	01c12683          	lw	a3,28(sp)
    df10:	0105e8b3          	or	a7,a1,a6
    df14:	00d8e8b3          	or	a7,a7,a3
    df18:	00f8e8b3          	or	a7,a7,a5
    df1c:	02089063          	bnez	a7,df3c <.L154>

0000df20 <.LVL281>:
    df20:	02812823          	sw	s0,48(sp)
    df24:	03312a23          	sw	s3,52(sp)
    df28:	03812c23          	sw	s8,56(sp)
    df2c:	03612e23          	sw	s6,60(sp)

0000df30 <.LBB138>:
    df30:	00030493          	mv	s1,t1

0000df34 <.L361>:
    df34:	00090a93          	mv	s5,s2

0000df38 <.LVL284>:
    df38:	d64ff06f          	j	d49c <.L10>

0000df3c <.L154>:
    df3c:	fff30893          	add	a7,t1,-1

0000df40 <.LVL286>:
    df40:	04089c63          	bnez	a7,df98 <.L155>

0000df44 <.LBB73>:
    df44:	40f40733          	sub	a4,s0,a5

0000df48 <.LVL288>:
    df48:	40b98633          	sub	a2,s3,a1

0000df4c <.LVL289>:
    df4c:	00e437b3          	sltu	a5,s0,a4
    df50:	00c9b533          	sltu	a0,s3,a2

0000df54 <.LVL290>:
    df54:	40f60633          	sub	a2,a2,a5

0000df58 <.LVL291>:
    df58:	00000793          	li	a5,0
    df5c:	00e47663          	bgeu	s0,a4,df68 <.L160>
    df60:	413585b3          	sub	a1,a1,s3
    df64:	0015b793          	seqz	a5,a1

0000df68 <.L160>:
    df68:	00a7e7b3          	or	a5,a5,a0

0000df6c <.LVL292>:
    df6c:	410c05b3          	sub	a1,s8,a6

0000df70 <.LVL293>:
    df70:	00bc3533          	sltu	a0,s8,a1

0000df74 <.LVL294>:
    df74:	40f585b3          	sub	a1,a1,a5

0000df78 <.LVL295>:
    df78:	00078663          	beqz	a5,df84 <.L163>
    df7c:	41880833          	sub	a6,a6,s8
    df80:	00183893          	seqz	a7,a6

0000df84 <.L163>:
    df84:	40db07b3          	sub	a5,s6,a3

0000df88 <.LVL297>:
    df88:	00a8e6b3          	or	a3,a7,a0

0000df8c <.LVL298>:
    df8c:	40d787b3          	sub	a5,a5,a3

0000df90 <.LBE73>:
    df90:	00090a93          	mv	s5,s2

0000df94 <.LVL299>:
    df94:	d45ff06f          	j	dcd8 <.L356>

0000df98 <.L155>:
    df98:	000087b7          	lui	a5,0x8
    df9c:	fff78793          	add	a5,a5,-1 # 7fff <.L2+0x7b>
    dfa0:	76f31263          	bne	t1,a5,e704 <.L164>

0000dfa4 <.L165>:
    dfa4:	02812823          	sw	s0,48(sp)
    dfa8:	03312a23          	sw	s3,52(sp)
    dfac:	03812c23          	sw	s8,56(sp)
    dfb0:	03612e23          	sw	s6,60(sp)
    dfb4:	00090a93          	mv	s5,s2

0000dfb8 <.LVL302>:
    dfb8:	911ff06f          	j	d8c8 <.L359>

0000dfbc <.L153>:
    dfbc:	000087b7          	lui	a5,0x8
    dfc0:	fff78793          	add	a5,a5,-1 # 7fff <.L2+0x7b>
    dfc4:	fefb80e3          	beq	s7,a5,dfa4 <.L165>
    dfc8:	01c12783          	lw	a5,28(sp)
    dfcc:	00080737          	lui	a4,0x80
    dfd0:	00e7e7b3          	or	a5,a5,a4
    dfd4:	00f12e23          	sw	a5,28(sp)

0000dfd8 <.LDL4>:
    dfd8:	07400793          	li	a5,116
    dfdc:	1867c863          	blt	a5,t1,e16c <.L166>

0000dfe0 <.L270>:
    dfe0:	02000793          	li	a5,32
    dfe4:	02f347b3          	div	a5,t1,a5

0000dfe8 <.LVL304>:
    dfe8:	00060693          	mv	a3,a2
    dfec:	00000493          	li	s1,0

0000dff0 <.LVL305>:
    dff0:	00000713          	li	a4,0

0000dff4 <.L167>:
    dff4:	02f74e63          	blt	a4,a5,e030 <.L168>
    dff8:	00300713          	li	a4,3

0000dffc <.LVL307>:
    dffc:	01f37893          	and	a7,t1,31
    e000:	40f70e33          	sub	t3,a4,a5
    e004:	00279593          	sll	a1,a5,0x2
    e008:	02089e63          	bnez	a7,e044 <.L169>

0000e00c <.L170>:
    e00c:	00b60733          	add	a4,a2,a1
    e010:	00072703          	lw	a4,0(a4) # 80000 <_ebss+0x69cd0>
    e014:	00188893          	add	a7,a7,1

0000e018 <.LVL309>:
    e018:	00460613          	add	a2,a2,4
    e01c:	fee62e23          	sw	a4,-4(a2)

0000e020 <.LVL310>:
    e020:	ff1e56e3          	bge	t3,a7,e00c <.L170>
    e024:	00400713          	li	a4,4
    e028:	40f707b3          	sub	a5,a4,a5

0000e02c <.LVL311>:
    e02c:	0780006f          	j	e0a4 <.L175>

0000e030 <.L168>:
    e030:	0006a583          	lw	a1,0(a3)
    e034:	00170713          	add	a4,a4,1

0000e038 <.LVL313>:
    e038:	00468693          	add	a3,a3,4
    e03c:	00b4e4b3          	or	s1,s1,a1

0000e040 <.LVL314>:
    e040:	fb5ff06f          	j	dff4 <.L167>

0000e044 <.L169>:
    e044:	02000613          	li	a2,32
    e048:	02c36733          	rem	a4,t1,a2
    e04c:	00078693          	mv	a3,a5
    e050:	40e60633          	sub	a2,a2,a4
    e054:	0007d463          	bgez	a5,e05c <.L172>

0000e058 <.LVL316>:
    e058:	00000693          	li	a3,0

0000e05c <.L172>:
    e05c:	00269693          	sll	a3,a3,0x2
    e060:	04068713          	add	a4,a3,64
    e064:	002706b3          	add	a3,a4,sp
    e068:	fd06a703          	lw	a4,-48(a3)
    e06c:	00b506b3          	add	a3,a0,a1
    e070:	40b005b3          	neg	a1,a1
    e074:	00c71733          	sll	a4,a4,a2
    e078:	00e4e4b3          	or	s1,s1,a4

0000e07c <.LVL318>:
    e07c:	00000713          	li	a4,0

0000e080 <.L173>:
    e080:	0dc74263          	blt	a4,t3,e144 <.L174>
    e084:	01c12683          	lw	a3,28(sp)
    e088:	00400713          	li	a4,4

0000e08c <.LVL320>:
    e08c:	40f707b3          	sub	a5,a4,a5

0000e090 <.LVL321>:
    e090:	002e1713          	sll	a4,t3,0x2
    e094:	04070713          	add	a4,a4,64
    e098:	00270733          	add	a4,a4,sp
    e09c:	0116d6b3          	srl	a3,a3,a7
    e0a0:	fcd72823          	sw	a3,-48(a4)

0000e0a4 <.L175>:
    e0a4:	0057a713          	slti	a4,a5,5
    e0a8:	00000613          	li	a2,0
    e0ac:	00070863          	beqz	a4,e0bc <.L177>
    e0b0:	00400613          	li	a2,4
    e0b4:	40f60633          	sub	a2,a2,a5
    e0b8:	00261613          	sll	a2,a2,0x2

0000e0bc <.L177>:
    e0bc:	00279793          	sll	a5,a5,0x2
    e0c0:	00f50533          	add	a0,a0,a5
    e0c4:	00000593          	li	a1,0
    e0c8:	cd1f40ef          	jal	2d98 <__GI_memset>

0000e0cc <.LBE75>:
    e0cc:	01012783          	lw	a5,16(sp)

0000e0d0 <.LBB76>:
    e0d0:	00903733          	snez	a4,s1

0000e0d4 <.LBE76>:
    e0d4:	00f76733          	or	a4,a4,a5

0000e0d8 <.L178>:
    e0d8:	01412683          	lw	a3,20(sp)

0000e0dc <.LBB79>:
    e0dc:	00e12823          	sw	a4,16(sp)

0000e0e0 <.LBB80>:
    e0e0:	40e40733          	sub	a4,s0,a4

0000e0e4 <.LVL326>:
    e0e4:	40d98633          	sub	a2,s3,a3

0000e0e8 <.LVL327>:
    e0e8:	00e437b3          	sltu	a5,s0,a4
    e0ec:	00c9b5b3          	sltu	a1,s3,a2

0000e0f0 <.LVL328>:
    e0f0:	40f60633          	sub	a2,a2,a5

0000e0f4 <.LVL329>:
    e0f4:	00000793          	li	a5,0
    e0f8:	00e47663          	bgeu	s0,a4,e104 <.L183>
    e0fc:	413686b3          	sub	a3,a3,s3
    e100:	0016b793          	seqz	a5,a3

0000e104 <.L183>:
    e104:	01812503          	lw	a0,24(sp)
    e108:	00b7e7b3          	or	a5,a5,a1

0000e10c <.LVL330>:
    e10c:	00000693          	li	a3,0
    e110:	40ac05b3          	sub	a1,s8,a0

0000e114 <.LVL331>:
    e114:	00bc3833          	sltu	a6,s8,a1

0000e118 <.LVL332>:
    e118:	40f585b3          	sub	a1,a1,a5

0000e11c <.LVL333>:
    e11c:	00078663          	beqz	a5,e128 <.L186>
    e120:	41850533          	sub	a0,a0,s8
    e124:	00153693          	seqz	a3,a0

0000e128 <.L186>:
    e128:	01c12783          	lw	a5,28(sp)

0000e12c <.LVL335>:
    e12c:	0106e6b3          	or	a3,a3,a6

0000e130 <.LBE80>:
    e130:	000b8493          	mv	s1,s7

0000e134 <.LBB81>:
    e134:	40fb07b3          	sub	a5,s6,a5
    e138:	40d787b3          	sub	a5,a5,a3

0000e13c <.LBE81>:
    e13c:	00090a93          	mv	s5,s2

0000e140 <.LVL337>:
    e140:	d59ff06f          	j	de98 <.L130>

0000e144 <.L174>:
    e144:	0006a803          	lw	a6,0(a3)
    e148:	0046a303          	lw	t1,4(a3)
    e14c:	00b68eb3          	add	t4,a3,a1
    e150:	01185833          	srl	a6,a6,a7
    e154:	00c31333          	sll	t1,t1,a2
    e158:	00686833          	or	a6,a6,t1
    e15c:	010ea023          	sw	a6,0(t4)

0000e160 <.LVL339>:
    e160:	00170713          	add	a4,a4,1

0000e164 <.LVL340>:
    e164:	00468693          	add	a3,a3,4
    e168:	f19ff06f          	j	e080 <.L173>

0000e16c <.L166>:
    e16c:	00012e23          	sw	zero,28(sp)
    e170:	00012c23          	sw	zero,24(sp)
    e174:	00012a23          	sw	zero,20(sp)
    e178:	00100713          	li	a4,1
    e17c:	f5dff06f          	j	e0d8 <.L178>

0000e180 <.L152>:
    e180:	00148713          	add	a4,s1,1
    e184:	01171513          	sll	a0,a4,0x11
    e188:	01255513          	srl	a0,a0,0x12

0000e18c <.LBB142>:
    e18c:	01412683          	lw	a3,20(sp)
    e190:	01812603          	lw	a2,24(sp)
    e194:	01c12583          	lw	a1,28(sp)

0000e198 <.LBB143>:
    e198:	00008337          	lui	t1,0x8
    e19c:	1e051063          	bnez	a0,e37c <.L187>
    e1a0:	0189e533          	or	a0,s3,s8
    e1a4:	00c6e833          	or	a6,a3,a2
    e1a8:	01656533          	or	a0,a0,s6
    e1ac:	00b86833          	or	a6,a6,a1
    e1b0:	00856533          	or	a0,a0,s0
    e1b4:	00f86833          	or	a6,a6,a5
    e1b8:	10049863          	bnez	s1,e2c8 <.L188>

0000e1bc <.LVL343>:
    e1bc:	02081263          	bnez	a6,e1e0 <.L189>
    e1c0:	02812823          	sw	s0,48(sp)
    e1c4:	03312a23          	sw	s3,52(sp)
    e1c8:	03812c23          	sw	s8,56(sp)
    e1cc:	03612e23          	sw	s6,60(sp)
    e1d0:	00090a93          	mv	s5,s2

0000e1d4 <.LVL344>:
    e1d4:	ac051463          	bnez	a0,d49c <.L10>

0000e1d8 <.L209>:
    e1d8:	00000493          	li	s1,0

0000e1dc <.LVL346>:
    e1dc:	9d9ff06f          	j	dbb4 <.L358>

0000e1e0 <.L189>:
    e1e0:	00051c63          	bnez	a0,e1f8 <.L190>
    e1e4:	02f12823          	sw	a5,48(sp)
    e1e8:	02d12a23          	sw	a3,52(sp)
    e1ec:	02c12c23          	sw	a2,56(sp)
    e1f0:	02b12e23          	sw	a1,60(sp)

0000e1f4 <.LBB146>:
  FP_PACK_SEMIRAW_Q (r, R);
    e1f4:	8d5ff06f          	j	dac8 <.L357>

0000e1f8 <.L190>:
  FP_SUB_Q (R, A, B);
    e1f8:	40878533          	sub	a0,a5,s0

0000e1fc <.LVL350>:
    e1fc:	41368e33          	sub	t3,a3,s3

0000e200 <.LVL351>:
    e200:	00a7b833          	sltu	a6,a5,a0
    e204:	01c6b8b3          	sltu	a7,a3,t3

0000e208 <.LVL352>:
    e208:	410e0833          	sub	a6,t3,a6

0000e20c <.LVL353>:
    e20c:	00000713          	li	a4,0
    e210:	00a7f463          	bgeu	a5,a0,e218 <.L196>
    e214:	001e3713          	seqz	a4,t3

0000e218 <.L196>:
    e218:	01176733          	or	a4,a4,a7

0000e21c <.LVL354>:
    e21c:	418608b3          	sub	a7,a2,s8

0000e220 <.LVL355>:
    e220:	01163f33          	sltu	t5,a2,a7

0000e224 <.LVL356>:
    e224:	40e88eb3          	sub	t4,a7,a4

0000e228 <.LVL357>:
    e228:	00000313          	li	t1,0
    e22c:	00070463          	beqz	a4,e234 <.L199>
    e230:	0018b313          	seqz	t1,a7

0000e234 <.L199>:
    e234:	01e36333          	or	t1,t1,t5

0000e238 <.LVL359>:
    e238:	41658733          	sub	a4,a1,s6

0000e23c <.LVL360>:
    e23c:	40670733          	sub	a4,a4,t1
    e240:	02e12e23          	sw	a4,60(sp)
    e244:	03d12c23          	sw	t4,56(sp)
    e248:	03012a23          	sw	a6,52(sp)
    e24c:	02a12823          	sw	a0,48(sp)

0000e250 <.LBE83>:
    e250:	00c71313          	sll	t1,a4,0xc

0000e254 <.LVL362>:
    e254:	06035063          	bgez	t1,e2b4 <.L200>

0000e258 <.LBB84>:
    e258:	40f407b3          	sub	a5,s0,a5

0000e25c <.LVL363>:
    e25c:	40d986b3          	sub	a3,s3,a3

0000e260 <.LVL364>:
    e260:	00f43733          	sltu	a4,s0,a5
    e264:	00d9b9b3          	sltu	s3,s3,a3

0000e268 <.LVL365>:
    e268:	40e686b3          	sub	a3,a3,a4

0000e26c <.LVL366>:
    e26c:	00000713          	li	a4,0
    e270:	00f47463          	bgeu	s0,a5,e278 <.L205>
    e274:	001e3713          	seqz	a4,t3

0000e278 <.L205>:
    e278:	40cc0633          	sub	a2,s8,a2
    e27c:	013769b3          	or	s3,a4,s3

0000e280 <.LVL367>:
    e280:	00cc3c33          	sltu	s8,s8,a2

0000e284 <.LVL368>:
    e284:	00000513          	li	a0,0

0000e288 <.LVL369>:
    e288:	41360633          	sub	a2,a2,s3

0000e28c <.LVL370>:
    e28c:	00098463          	beqz	s3,e294 <.L208>
    e290:	0018b513          	seqz	a0,a7

0000e294 <.L208>:
    e294:	40bb05b3          	sub	a1,s6,a1
    e298:	01856533          	or	a0,a0,s8

0000e29c <.LVL372>:
    e29c:	40a585b3          	sub	a1,a1,a0
    e2a0:	02b12e23          	sw	a1,60(sp)
    e2a4:	02c12c23          	sw	a2,56(sp)
    e2a8:	02d12a23          	sw	a3,52(sp)
    e2ac:	02f12823          	sw	a5,48(sp)

0000e2b0 <.LVL373>:
    e2b0:	c85ff06f          	j	df34 <.L361>

0000e2b4 <.L200>:
    e2b4:	01056533          	or	a0,a0,a6

0000e2b8 <.LVL375>:
    e2b8:	01d56533          	or	a0,a0,t4
    e2bc:	00e56533          	or	a0,a0,a4
    e2c0:	f0050ce3          	beqz	a0,e1d8 <.L209>
    e2c4:	805ff06f          	j	dac8 <.L357>

0000e2c8 <.L188>:
    e2c8:	03010893          	add	a7,sp,48
    e2cc:	03c10713          	add	a4,sp,60
    e2d0:	04081e63          	bnez	a6,e32c <.L210>
    e2d4:	02051e63          	bnez	a0,e310 <.L211>

0000e2d8 <.LVL377>:
    e2d8:	02612e23          	sw	t1,60(sp)
    e2dc:	02012c23          	sw	zero,56(sp)
    e2e0:	02012a23          	sw	zero,52(sp)
    e2e4:	02012823          	sw	zero,48(sp)

0000e2e8 <.LBB85>:
    e2e8:	00070793          	mv	a5,a4

0000e2ec <.L212>:
    e2ec:	0007a703          	lw	a4,0(a5)
    e2f0:	ffc7a683          	lw	a3,-4(a5)
    e2f4:	ffc78793          	add	a5,a5,-4
    e2f8:	00371713          	sll	a4,a4,0x3
    e2fc:	01d6d693          	srl	a3,a3,0x1d
    e300:	00d76733          	or	a4,a4,a3
    e304:	00e7a223          	sw	a4,4(a5)
    e308:	fef892e3          	bne	a7,a5,e2ec <.L212>
    e30c:	8a1ff06f          	j	dbac <.L213>

0000e310 <.L211>:
    e310:	02812823          	sw	s0,48(sp)
    e314:	03312a23          	sw	s3,52(sp)
    e318:	03812c23          	sw	s8,56(sp)
    e31c:	03612e23          	sw	s6,60(sp)

0000e320 <.LBB148>:
    e320:	00090a93          	mv	s5,s2

0000e324 <.L362>:
    e324:	fff30493          	add	s1,t1,-1 # 7fff <.L2+0x7b>

0000e328 <.LVL382>:
    e328:	974ff06f          	j	d49c <.L10>

0000e32c <.L210>:
    e32c:	00051c63          	bnez	a0,e344 <.L214>

0000e330 <.LVL384>:
    e330:	02f12823          	sw	a5,48(sp)
    e334:	02d12a23          	sw	a3,52(sp)
    e338:	02c12c23          	sw	a2,56(sp)
    e33c:	02b12e23          	sw	a1,60(sp)
    e340:	fe5ff06f          	j	e324 <.L362>

0000e344 <.L214>:
    e344:	02612e23          	sw	t1,60(sp)
    e348:	02012c23          	sw	zero,56(sp)
    e34c:	02012a23          	sw	zero,52(sp)
    e350:	02012823          	sw	zero,48(sp)

0000e354 <.LBB86>:
    e354:	00070793          	mv	a5,a4

0000e358 <.L215>:
    e358:	0007a703          	lw	a4,0(a5)
    e35c:	ffc7a683          	lw	a3,-4(a5)
    e360:	ffc78793          	add	a5,a5,-4
    e364:	00371713          	sll	a4,a4,0x3
    e368:	01d6d693          	srl	a3,a3,0x1d
    e36c:	00d76733          	or	a4,a4,a3
    e370:	00e7a223          	sw	a4,4(a5)
    e374:	fef892e3          	bne	a7,a5,e358 <.L215>
    e378:	835ff06f          	j	dbac <.L213>

0000e37c <.L187>:
    e37c:	40878533          	sub	a0,a5,s0

0000e380 <.LVL389>:
    e380:	41368eb3          	sub	t4,a3,s3

0000e384 <.LVL390>:
    e384:	00a7b833          	sltu	a6,a5,a0
    e388:	01d6b333          	sltu	t1,a3,t4

0000e38c <.LVL391>:
    e38c:	410e8833          	sub	a6,t4,a6

0000e390 <.LVL392>:
    e390:	00000713          	li	a4,0
    e394:	00a7f463          	bgeu	a5,a0,e39c <.L220>
    e398:	001eb713          	seqz	a4,t4

0000e39c <.L220>:
    e39c:	00676733          	or	a4,a4,t1

0000e3a0 <.LVL393>:
    e3a0:	41860333          	sub	t1,a2,s8

0000e3a4 <.LVL394>:
    e3a4:	00663fb3          	sltu	t6,a2,t1

0000e3a8 <.LVL395>:
    e3a8:	40e30f33          	sub	t5,t1,a4

0000e3ac <.LVL396>:
    e3ac:	00000e13          	li	t3,0
    e3b0:	00070463          	beqz	a4,e3b8 <.L223>
    e3b4:	00133e13          	seqz	t3,t1

0000e3b8 <.L223>:
    e3b8:	01fe6e33          	or	t3,t3,t6

0000e3bc <.LVL398>:
    e3bc:	41658733          	sub	a4,a1,s6

0000e3c0 <.LVL399>:
    e3c0:	41c70733          	sub	a4,a4,t3
    e3c4:	02e12e23          	sw	a4,60(sp)
    e3c8:	03e12c23          	sw	t5,56(sp)
    e3cc:	03012a23          	sw	a6,52(sp)
    e3d0:	02a12823          	sw	a0,48(sp)

0000e3d4 <.LBE87>:
    e3d4:	00c71e13          	sll	t3,a4,0xc

0000e3d8 <.LVL401>:
    e3d8:	140e5663          	bgez	t3,e524 <.L224>

0000e3dc <.LBB88>:
    e3dc:	40f407b3          	sub	a5,s0,a5

0000e3e0 <.LVL402>:
    e3e0:	40d986b3          	sub	a3,s3,a3

0000e3e4 <.LVL403>:
    e3e4:	00f43733          	sltu	a4,s0,a5
    e3e8:	00d9b9b3          	sltu	s3,s3,a3

0000e3ec <.LVL404>:
    e3ec:	40e686b3          	sub	a3,a3,a4

0000e3f0 <.LVL405>:
    e3f0:	00000713          	li	a4,0
    e3f4:	00f47463          	bgeu	s0,a5,e3fc <.L229>
    e3f8:	001eb713          	seqz	a4,t4

0000e3fc <.L229>:
    e3fc:	40cc0633          	sub	a2,s8,a2
    e400:	013769b3          	or	s3,a4,s3

0000e404 <.LVL406>:
    e404:	00cc3c33          	sltu	s8,s8,a2

0000e408 <.LVL407>:
    e408:	41360633          	sub	a2,a2,s3

0000e40c <.LVL408>:
    e40c:	00098463          	beqz	s3,e414 <.L232>
    e410:	00133893          	seqz	a7,t1

0000e414 <.L232>:
    e414:	40bb05b3          	sub	a1,s6,a1
    e418:	0188e733          	or	a4,a7,s8

0000e41c <.LVL410>:
    e41c:	40e58733          	sub	a4,a1,a4

0000e420 <.LVL411>:
    e420:	02e12e23          	sw	a4,60(sp)
    e424:	02c12c23          	sw	a2,56(sp)
    e428:	02d12a23          	sw	a3,52(sp)
    e42c:	02f12823          	sw	a5,48(sp)

0000e430 <.LBE88>:
    e430:	00090a93          	mv	s5,s2

0000e434 <.L233>:
    e434:	03c12503          	lw	a0,60(sp)
    e438:	10050063          	beqz	a0,e538 <.L234>
    e43c:	9d8f30ef          	jal	1614 <__clzsi2>

0000e440 <.L235>:
    e440:	ff450513          	add	a0,a0,-12

0000e444 <.LBB56>:
    e444:	02000713          	li	a4,32
    e448:	01f57813          	and	a6,a0,31
    e44c:	02e547b3          	div	a5,a0,a4

0000e450 <.LVL416>:
    e450:	12080063          	beqz	a6,e570 <.L238>
    e454:	03010313          	add	t1,sp,48
    e458:	02e566b3          	rem	a3,a0,a4

0000e45c <.LVL417>:
    e45c:	40d70633          	sub	a2,a4,a3
    e460:	ffc00693          	li	a3,-4

0000e464 <.LVL418>:
    e464:	02d786b3          	mul	a3,a5,a3
    e468:	00c68713          	add	a4,a3,12
    e46c:	00e30733          	add	a4,t1,a4
    e470:	40d006b3          	neg	a3,a3

0000e474 <.L239>:
    e474:	12e31663          	bne	t1,a4,e5a0 <.L242>
    e478:	03012683          	lw	a3,48(sp)
    e47c:	fff78713          	add	a4,a5,-1

0000e480 <.LVL419>:
    e480:	00279793          	sll	a5,a5,0x2

0000e484 <.LVL420>:
    e484:	04078793          	add	a5,a5,64
    e488:	002787b3          	add	a5,a5,sp
    e48c:	010696b3          	sll	a3,a3,a6
    e490:	fed7a823          	sw	a3,-16(a5)

0000e494 <.L243>:
    e494:	00170713          	add	a4,a4,1
    e498:	03010793          	add	a5,sp,48
    e49c:	00271713          	sll	a4,a4,0x2
    e4a0:	00800693          	li	a3,8
    e4a4:	00078893          	mv	a7,a5
    e4a8:	00d76a63          	bltu	a4,a3,e4bc <.L244>
    e4ac:	02012823          	sw	zero,48(sp)
    e4b0:	0007a223          	sw	zero,4(a5)
    e4b4:	ff870713          	add	a4,a4,-8
    e4b8:	03810793          	add	a5,sp,56

0000e4bc <.L244>:
    e4bc:	00400693          	li	a3,4
    e4c0:	00d76463          	bltu	a4,a3,e4c8 <.L245>
    e4c4:	0007a023          	sw	zero,0(a5)

0000e4c8 <.L245>:
    e4c8:	1c954863          	blt	a0,s1,e698 <.L246>
    e4cc:	40950533          	sub	a0,a0,s1

0000e4d0 <.LVL422>:
    e4d0:	00150513          	add	a0,a0,1

0000e4d4 <.LBB52>:
    e4d4:	40555713          	sra	a4,a0,0x5

0000e4d8 <.LVL424>:
    e4d8:	01f57793          	and	a5,a0,31

0000e4dc <.LVL425>:
    e4dc:	00088593          	mv	a1,a7
    e4e0:	00088613          	mv	a2,a7
    e4e4:	00000313          	li	t1,0
    e4e8:	00000693          	li	a3,0

0000e4ec <.L247>:
    e4ec:	0ce69c63          	bne	a3,a4,e5c4 <.L248>
    e4f0:	00300693          	li	a3,3

0000e4f4 <.LVL427>:
    e4f4:	40e686b3          	sub	a3,a3,a4
    e4f8:	00271613          	sll	a2,a4,0x2
    e4fc:	0c079e63          	bnez	a5,e5d8 <.L249>

0000e500 <.L250>:
    e500:	00c58533          	add	a0,a1,a2
    e504:	00052503          	lw	a0,0(a0)
    e508:	00178793          	add	a5,a5,1

0000e50c <.LVL429>:
    e50c:	00458593          	add	a1,a1,4
    e510:	fea5ae23          	sw	a0,-4(a1)

0000e514 <.LVL430>:
    e514:	fef6d6e3          	bge	a3,a5,e500 <.L250>
    e518:	00400793          	li	a5,4

0000e51c <.LVL431>:
    e51c:	40e78733          	sub	a4,a5,a4

0000e520 <.LVL432>:
    e520:	1040006f          	j	e624 <.L254>

0000e524 <.L224>:
    e524:	01056533          	or	a0,a0,a6

0000e528 <.LVL434>:
    e528:	01e56533          	or	a0,a0,t5
    e52c:	00e56533          	or	a0,a0,a4
    e530:	ca0504e3          	beqz	a0,e1d8 <.L209>
    e534:	f01ff06f          	j	e434 <.L233>

0000e538 <.L234>:
    e538:	03812503          	lw	a0,56(sp)
    e53c:	00050863          	beqz	a0,e54c <.L236>
    e540:	8d4f30ef          	jal	1614 <__clzsi2>

0000e544 <.LVL436>:
    e544:	02050513          	add	a0,a0,32
    e548:	ef9ff06f          	j	e440 <.L235>

0000e54c <.L236>:
    e54c:	03412503          	lw	a0,52(sp)
    e550:	00050863          	beqz	a0,e560 <.L237>
    e554:	8c0f30ef          	jal	1614 <__clzsi2>

0000e558 <.LVL439>:
    e558:	04050513          	add	a0,a0,64
    e55c:	ee5ff06f          	j	e440 <.L235>

0000e560 <.L237>:
    e560:	03012503          	lw	a0,48(sp)
    e564:	8b0f30ef          	jal	1614 <__clzsi2>

0000e568 <.LVL442>:
    e568:	06050513          	add	a0,a0,96
    e56c:	ed5ff06f          	j	e440 <.L235>

0000e570 <.L238>:
    e570:	ffc00613          	li	a2,-4
    e574:	02c78633          	mul	a2,a5,a2
    e578:	03c10713          	add	a4,sp,60

0000e57c <.LBB58>:
    e57c:	00300693          	li	a3,3

0000e580 <.L240>:
    e580:	00c705b3          	add	a1,a4,a2
    e584:	0005a583          	lw	a1,0(a1)
    e588:	fff68693          	add	a3,a3,-1

0000e58c <.LVL446>:
    e58c:	ffc70713          	add	a4,a4,-4
    e590:	00b72223          	sw	a1,4(a4)

0000e594 <.LVL447>:
    e594:	fef6d6e3          	bge	a3,a5,e580 <.L240>
    e598:	fff78713          	add	a4,a5,-1
    e59c:	ef9ff06f          	j	e494 <.L243>

0000e5a0 <.L242>:
    e5a0:	00072583          	lw	a1,0(a4)
    e5a4:	ffc72883          	lw	a7,-4(a4)
    e5a8:	00d70e33          	add	t3,a4,a3
    e5ac:	010595b3          	sll	a1,a1,a6
    e5b0:	00c8d8b3          	srl	a7,a7,a2
    e5b4:	0115e5b3          	or	a1,a1,a7
    e5b8:	00be2023          	sw	a1,0(t3)
    e5bc:	ffc70713          	add	a4,a4,-4
    e5c0:	eb5ff06f          	j	e474 <.L239>

0000e5c4 <.L248>:
    e5c4:	00062503          	lw	a0,0(a2)
    e5c8:	00168693          	add	a3,a3,1

0000e5cc <.LVL450>:
    e5cc:	00460613          	add	a2,a2,4
    e5d0:	00a36333          	or	t1,t1,a0

0000e5d4 <.LVL451>:
    e5d4:	f19ff06f          	j	e4ec <.L247>

0000e5d8 <.L249>:
    e5d8:	04060593          	add	a1,a2,64
    e5dc:	002585b3          	add	a1,a1,sp
    e5e0:	ff05a583          	lw	a1,-16(a1)
    e5e4:	02000813          	li	a6,32
    e5e8:	40f80833          	sub	a6,a6,a5
    e5ec:	010595b3          	sll	a1,a1,a6
    e5f0:	00b36333          	or	t1,t1,a1

0000e5f4 <.LVL453>:
    e5f4:	00000e13          	li	t3,0
    e5f8:	00c885b3          	add	a1,a7,a2
    e5fc:	40c00633          	neg	a2,a2

0000e600 <.L252>:
    e600:	06de4863          	blt	t3,a3,e670 <.L253>
    e604:	00400613          	li	a2,4
    e608:	40e60733          	sub	a4,a2,a4

0000e60c <.LVL455>:
    e60c:	03c12603          	lw	a2,60(sp)
    e610:	00269693          	sll	a3,a3,0x2

0000e614 <.LVL456>:
    e614:	04068693          	add	a3,a3,64
    e618:	002686b3          	add	a3,a3,sp
    e61c:	00f657b3          	srl	a5,a2,a5

0000e620 <.LVL457>:
    e620:	fef6a823          	sw	a5,-16(a3)

0000e624 <.L254>:
    e624:	00400693          	li	a3,4
    e628:	40e686b3          	sub	a3,a3,a4
    e62c:	00271713          	sll	a4,a4,0x2
    e630:	00e887b3          	add	a5,a7,a4
    e634:	00269713          	sll	a4,a3,0x2
    e638:	00800693          	li	a3,8
    e63c:	00d76a63          	bltu	a4,a3,e650 <.L255>
    e640:	0007a023          	sw	zero,0(a5)
    e644:	0007a223          	sw	zero,4(a5)
    e648:	ff870713          	add	a4,a4,-8
    e64c:	00878793          	add	a5,a5,8

0000e650 <.L255>:
    e650:	00400693          	li	a3,4
    e654:	00d76463          	bltu	a4,a3,e65c <.L256>
    e658:	0007a023          	sw	zero,0(a5)

0000e65c <.L256>:
    e65c:	03012703          	lw	a4,48(sp)

0000e660 <.LBB54>:
    e660:	006037b3          	snez	a5,t1

0000e664 <.LBE54>:
    e664:	00f767b3          	or	a5,a4,a5
    e668:	02f12823          	sw	a5,48(sp)
    e66c:	c5cff06f          	j	dac8 <.L357>

0000e670 <.L253>:
    e670:	0005a503          	lw	a0,0(a1)
    e674:	0045ae83          	lw	t4,4(a1)
    e678:	00c58f33          	add	t5,a1,a2
    e67c:	00f55533          	srl	a0,a0,a5
    e680:	010e9eb3          	sll	t4,t4,a6
    e684:	01d56533          	or	a0,a0,t4
    e688:	00af2023          	sw	a0,0(t5)

0000e68c <.LVL461>:
    e68c:	001e0e13          	add	t3,t3,1

0000e690 <.LVL462>:
    e690:	00458593          	add	a1,a1,4
    e694:	f6dff06f          	j	e600 <.L252>

0000e698 <.L246>:
    e698:	03c12783          	lw	a5,60(sp)
    e69c:	fff80737          	lui	a4,0xfff80
    e6a0:	fff70713          	add	a4,a4,-1 # fff7ffff <_ebss+0xfff69ccf>
    e6a4:	00e7f7b3          	and	a5,a5,a4
    e6a8:	40a484b3          	sub	s1,s1,a0
    e6ac:	02f12e23          	sw	a5,60(sp)

0000e6b0 <.LBB153>:
  FP_PACK_SEMIRAW_Q (r, R);
    e6b0:	dedfe06f          	j	d49c <.L10>

0000e6b4 <.L263>:
    e6b4:	02012e23          	sw	zero,60(sp)
    e6b8:	02012c23          	sw	zero,56(sp)
    e6bc:	02012a23          	sw	zero,52(sp)
    e6c0:	02012823          	sw	zero,48(sp)
    e6c4:	e59fe06f          	j	d51c <.L262>

0000e6c8 <.L343>:
  FP_SUB_Q (R, A, B);
    e6c8:	07400713          	li	a4,116
    e6cc:	00c74463          	blt	a4,a2,e6d4 <.L26>
    e6d0:	f4dfe06f          	j	d61c <.L267>

0000e6d4 <.L26>:
    e6d4:	02012623          	sw	zero,44(sp)
    e6d8:	02012423          	sw	zero,40(sp)
    e6dc:	02012223          	sw	zero,36(sp)
    e6e0:	00100713          	li	a4,1
    e6e4:	828ff06f          	j	d70c <.L37>

0000e6e8 <.L62>:
    e6e8:	07400793          	li	a5,116
    e6ec:	a0b7dc63          	bge	a5,a1,d904 <.L268>

0000e6f0 <.L64>:
    e6f0:	00012e23          	sw	zero,28(sp)
    e6f4:	00012c23          	sw	zero,24(sp)
    e6f8:	00012a23          	sw	zero,20(sp)
    e6fc:	00100793          	li	a5,1
    e700:	afcff06f          	j	d9fc <.L76>

0000e704 <.L164>:
    e704:	07400793          	li	a5,116
    e708:	a717c2e3          	blt	a5,a7,e16c <.L166>
    e70c:	00088313          	mv	t1,a7
    e710:	8d1ff06f          	j	dfe0 <.L270>

0000e714 <__fixunstfsi>:
#include "soft-fp.h"
#include "quad.h"

USItype
__fixunstfsi (TFtype a)
{
    e714:	00052703          	lw	a4,0(a0)
    e718:	00c52783          	lw	a5,12(a0)
    e71c:	00852583          	lw	a1,8(a0)
    e720:	00452683          	lw	a3,4(a0)
    e724:	fe010113          	add	sp,sp,-32

0000e728 <.LBB3>:
  FP_DECL_EX;
  FP_DECL_Q (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_Q (A, a);
    e728:	00e12023          	sw	a4,0(sp)
    e72c:	00e12823          	sw	a4,16(sp)
    e730:	00179613          	sll	a2,a5,0x1

0000e734 <.LBE3>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e734:	00004737          	lui	a4,0x4

0000e738 <.LBB4>:
  FP_UNPACK_RAW_Q (A, a);
    e738:	00d12223          	sw	a3,4(sp)
    e73c:	00b12423          	sw	a1,8(sp)
    e740:	00f12623          	sw	a5,12(sp)
    e744:	00b12c23          	sw	a1,24(sp)
    e748:	01165613          	srl	a2,a2,0x11

0000e74c <.LBE4>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e74c:	ffe70713          	add	a4,a4,-2 # 3ffe <.L23+0x2>
    e750:	00000513          	li	a0,0
    e754:	06c75a63          	bge	a4,a2,e7c8 <.L1>
    e758:	01f7d813          	srl	a6,a5,0x1f
    e75c:	00004737          	lui	a4,0x4

0000e760 <.LBB5>:
  FP_UNPACK_RAW_Q (A, a);
    e760:	00080693          	mv	a3,a6

0000e764 <.LBE5>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e764:	01e70713          	add	a4,a4,30 # 401e <.L25+0x2>
    e768:	00081663          	bnez	a6,e774 <.L5>
    e76c:	00004737          	lui	a4,0x4
    e770:	01f70713          	add	a4,a4,31 # 401f <.L25+0x3>

0000e774 <.L5>:
    e774:	fff80513          	add	a0,a6,-1
    e778:	04e65863          	bge	a2,a4,e7c8 <.L1>
    e77c:	00000513          	li	a0,0
    e780:	04081463          	bnez	a6,e7c8 <.L1>

0000e784 <.LBB10>:
  FP_UNPACK_RAW_Q (A, a);
    e784:	01079793          	sll	a5,a5,0x10

0000e788 <.LBB11>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e788:	00010737          	lui	a4,0x10

0000e78c <.LBB12>:
  FP_UNPACK_RAW_Q (A, a);
    e78c:	0107d793          	srl	a5,a5,0x10

0000e790 <.LBB13>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e790:	00e7e7b3          	or	a5,a5,a4

0000e794 <.LBB7>:
    e794:	00004737          	lui	a4,0x4
    e798:	06f70713          	add	a4,a4,111 # 406f <.L31+0x3>
    e79c:	40c70733          	sub	a4,a4,a2
    e7a0:	40575613          	sra	a2,a4,0x5

0000e7a4 <.LBE7>:
    e7a4:	00f12e23          	sw	a5,28(sp)

0000e7a8 <.LBB8>:
    e7a8:	01f77713          	and	a4,a4,31

0000e7ac <.LVL6>:
    e7ac:	02071263          	bnez	a4,e7d0 <.L7>

0000e7b0 <.LVL7>:
    e7b0:	00261613          	sll	a2,a2,0x2

0000e7b4 <.LVL8>:
    e7b4:	02060793          	add	a5,a2,32
    e7b8:	00278633          	add	a2,a5,sp
    e7bc:	ff062783          	lw	a5,-16(a2)
    e7c0:	00f12823          	sw	a5,16(sp)

0000e7c4 <.L8>:
    e7c4:	01012503          	lw	a0,16(sp)

0000e7c8 <.L1>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    e7c8:	02010113          	add	sp,sp,32

0000e7cc <.LVL11>:
    e7cc:	00008067          	ret

0000e7d0 <.L7>:
  FP_TO_INT_Q (r, A, SI_BITS, 0);
    e7d0:	00200513          	li	a0,2
    e7d4:	02a61063          	bne	a2,a0,e7f4 <.L9>
    e7d8:	02000693          	li	a3,32
    e7dc:	40e686b3          	sub	a3,a3,a4
    e7e0:	00d796b3          	sll	a3,a5,a3
    e7e4:	00e5d5b3          	srl	a1,a1,a4
    e7e8:	00b6e6b3          	or	a3,a3,a1
    e7ec:	00d12823          	sw	a3,16(sp)

0000e7f0 <.LVL13>:
    e7f0:	00100693          	li	a3,1

0000e7f4 <.L9>:
    e7f4:	00269693          	sll	a3,a3,0x2

0000e7f8 <.LVL15>:
    e7f8:	02068693          	add	a3,a3,32
    e7fc:	002686b3          	add	a3,a3,sp
    e800:	00e7d7b3          	srl	a5,a5,a4
    e804:	fef6a823          	sw	a5,-16(a3)
    e808:	fbdff06f          	j	e7c4 <.L8>

0000e80c <__floatunsitf>:
#include "soft-fp.h"
#include "quad.h"

TFtype
__floatunsitf (USItype i)
{
    e80c:	fd010113          	add	sp,sp,-48
    e810:	02912223          	sw	s1,36(sp)
    e814:	02112623          	sw	ra,44(sp)
    e818:	02812423          	sw	s0,40(sp)
    e81c:	00050493          	mv	s1,a0

0000e820 <.LBB12>:
  FP_DECL_Q (A);
  TFtype a;

  FP_FROM_INT_Q (A, i, SI_BITS, USItype);
    e820:	10058463          	beqz	a1,e928 <.L2>

0000e824 <.LBB3>:
    e824:	00058513          	mv	a0,a1
    e828:	00058413          	mv	s0,a1

0000e82c <.LBB5>:
    e82c:	de9f20ef          	jal	1614 <__clzsi2>

0000e830 <.LVL3>:
    e830:	00004737          	lui	a4,0x4
    e834:	01e70713          	add	a4,a4,30 # 401e <.L25+0x2>

0000e838 <.LBB6>:
    e838:	05150793          	add	a5,a0,81

0000e83c <.LBB7>:
    e83c:	40a70633          	sub	a2,a4,a0

0000e840 <.LBE7>:
    e840:	00812823          	sw	s0,16(sp)

0000e844 <.LBB8>:
    e844:	4057d713          	sra	a4,a5,0x5

0000e848 <.LBE8>:
    e848:	00012a23          	sw	zero,20(sp)
    e84c:	00012c23          	sw	zero,24(sp)
    e850:	00012e23          	sw	zero,28(sp)

0000e854 <.LBB9>:
    e854:	01f7f793          	and	a5,a5,31

0000e858 <.LVL6>:
    e858:	02078c63          	beqz	a5,e890 <.L3>

0000e85c <.LVL7>:
    e85c:	00200693          	li	a3,2
    e860:	0cd71063          	bne	a4,a3,e920 <.L8>
    e864:	02000693          	li	a3,32
    e868:	40f686b3          	sub	a3,a3,a5

0000e86c <.LVL8>:
    e86c:	00d456b3          	srl	a3,s0,a3

0000e870 <.LVL9>:
    e870:	00d12e23          	sw	a3,28(sp)

0000e874 <.L4>:
    e874:	fff70693          	add	a3,a4,-1

0000e878 <.LVL11>:
    e878:	00271713          	sll	a4,a4,0x2
    e87c:	02070713          	add	a4,a4,32
    e880:	00270733          	add	a4,a4,sp
    e884:	00f41433          	sll	s0,s0,a5

0000e888 <.LVL12>:
    e888:	fe872823          	sw	s0,-16(a4)
    e88c:	0340006f          	j	e8c0 <.L5>

0000e890 <.L3>:
    e890:	00300793          	li	a5,3

0000e894 <.LVL14>:
    e894:	40e787b3          	sub	a5,a5,a4
    e898:	00279793          	sll	a5,a5,0x2
    e89c:	02078793          	add	a5,a5,32
    e8a0:	002787b3          	add	a5,a5,sp
    e8a4:	ff07a783          	lw	a5,-16(a5)
    e8a8:	00200693          	li	a3,2
    e8ac:	00f12e23          	sw	a5,28(sp)

0000e8b0 <.LVL15>:
    e8b0:	00200793          	li	a5,2
    e8b4:	00f71663          	bne	a4,a5,e8c0 <.L5>
    e8b8:	00812c23          	sw	s0,24(sp)

0000e8bc <.LVL16>:
    e8bc:	00100693          	li	a3,1

0000e8c0 <.L5>:
    e8c0:	00269693          	sll	a3,a3,0x2
    e8c4:	00012823          	sw	zero,16(sp)

0000e8c8 <.LVL18>:
    e8c8:	00012a23          	sw	zero,20(sp)
    e8cc:	ffc68693          	add	a3,a3,-4
    e8d0:	00400793          	li	a5,4
    e8d4:	00f6e463          	bltu	a3,a5,e8dc <.L7>
    e8d8:	00012c23          	sw	zero,24(sp)

0000e8dc <.L7>:
  FP_PACK_RAW_Q (a, A);
    e8dc:	01c12783          	lw	a5,28(sp)
    e8e0:	00c11723          	sh	a2,14(sp)

0000e8e4 <.LBE13>:

  return a;
}
    e8e4:	02c12083          	lw	ra,44(sp)

0000e8e8 <.LBB14>:
  FP_PACK_RAW_Q (a, A);
    e8e8:	00f11623          	sh	a5,12(sp)

0000e8ec <.LBE14>:
  return a;
    e8ec:	01012783          	lw	a5,16(sp)
}
    e8f0:	02812403          	lw	s0,40(sp)
    e8f4:	00048513          	mv	a0,s1
  return a;
    e8f8:	00f4a023          	sw	a5,0(s1)
    e8fc:	01412783          	lw	a5,20(sp)
    e900:	00f4a223          	sw	a5,4(s1)
    e904:	01812783          	lw	a5,24(sp)
    e908:	00f4a423          	sw	a5,8(s1)
    e90c:	00c12783          	lw	a5,12(sp)
    e910:	00f4a623          	sw	a5,12(s1)
}
    e914:	02412483          	lw	s1,36(sp)
    e918:	03010113          	add	sp,sp,48

0000e91c <.LVL22>:
    e91c:	00008067          	ret

0000e920 <.L8>:
  FP_FROM_INT_Q (A, i, SI_BITS, USItype);
    e920:	00300713          	li	a4,3

0000e924 <.LVL24>:
    e924:	f51ff06f          	j	e874 <.L4>

0000e928 <.L2>:
    e928:	00012e23          	sw	zero,28(sp)
    e92c:	00012c23          	sw	zero,24(sp)
    e930:	00012a23          	sw	zero,20(sp)
    e934:	00012823          	sw	zero,16(sp)
    e938:	00000613          	li	a2,0
    e93c:	fa1ff06f          	j	e8dc <.L7>

0000e940 <__extendsfdf2>:
  FP_DECL_S (A);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_S (A, a);
    e940:	01755713          	srl	a4,a0,0x17
    e944:	0ff77713          	zext.b	a4,a4

0000e948 <.LBE2>:
{
    e948:	ff010113          	add	sp,sp,-16
#if _FP_W_TYPE_SIZE < _FP_FRACBITS_D
  FP_EXTEND (D, S, 2, 1, R, A);
    e94c:	00170793          	add	a5,a4,1
{
    e950:	00812423          	sw	s0,8(sp)
    e954:	00912223          	sw	s1,4(sp)

0000e958 <.LBB3>:
  FP_UNPACK_RAW_S (A, a);
    e958:	00951413          	sll	s0,a0,0x9

0000e95c <.LBE3>:
{
    e95c:	00112623          	sw	ra,12(sp)
  FP_EXTEND (D, S, 2, 1, R, A);
    e960:	0fe7f793          	and	a5,a5,254

0000e964 <.LBB4>:
  FP_UNPACK_RAW_S (A, a);
    e964:	00945413          	srl	s0,s0,0x9

0000e968 <.LVL1>:
    e968:	01f55493          	srl	s1,a0,0x1f

0000e96c <.LBE4>:
  FP_EXTEND (D, S, 2, 1, R, A);
    e96c:	04078263          	beqz	a5,e9b0 <.L2>
    e970:	00345793          	srl	a5,s0,0x3
    e974:	38070713          	add	a4,a4,896

0000e978 <.LVL3>:
    e978:	01d41413          	sll	s0,s0,0x1d

0000e97c <.L3>:
#else
  FP_EXTEND (D, S, 1, 1, R, A);
#endif
  FP_PACK_RAW_D (r, R);
    e97c:	00c79793          	sll	a5,a5,0xc

0000e980 <.LVL5>:
    e980:	00c7d793          	srl	a5,a5,0xc
    e984:	01471713          	sll	a4,a4,0x14

0000e988 <.LVL6>:
    e988:	01f49513          	sll	a0,s1,0x1f
    e98c:	00f76733          	or	a4,a4,a5

0000e990 <.LBE7>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    e990:	00c12083          	lw	ra,12(sp)

0000e994 <.LBB8>:
  FP_PACK_RAW_D (r, R);
    e994:	00a767b3          	or	a5,a4,a0

0000e998 <.LBE8>:
}
    e998:	00040513          	mv	a0,s0
    e99c:	00812403          	lw	s0,8(sp)

0000e9a0 <.LVL8>:
    e9a0:	00412483          	lw	s1,4(sp)

0000e9a4 <.LVL9>:
    e9a4:	00078593          	mv	a1,a5
    e9a8:	01010113          	add	sp,sp,16
    e9ac:	00008067          	ret

0000e9b0 <.L2>:
  FP_EXTEND (D, S, 2, 1, R, A);
    e9b0:	04071663          	bnez	a4,e9fc <.L4>
    e9b4:	00000793          	li	a5,0
    e9b8:	fc0402e3          	beqz	s0,e97c <.L3>

0000e9bc <.LBB9>:
    e9bc:	00040513          	mv	a0,s0

0000e9c0 <.LVL11>:
    e9c0:	c55f20ef          	jal	1614 <__clzsi2>

0000e9c4 <.LVL12>:
    e9c4:	00a00793          	li	a5,10
    e9c8:	02a7c263          	blt	a5,a0,e9ec <.L5>
    e9cc:	00b00793          	li	a5,11
    e9d0:	40a787b3          	sub	a5,a5,a0
    e9d4:	01550713          	add	a4,a0,21
    e9d8:	00f457b3          	srl	a5,s0,a5

0000e9dc <.LVL13>:
    e9dc:	00e41433          	sll	s0,s0,a4

0000e9e0 <.L6>:
    e9e0:	38900713          	li	a4,905
    e9e4:	40a70733          	sub	a4,a4,a0

0000e9e8 <.LVL15>:
    e9e8:	f95ff06f          	j	e97c <.L3>

0000e9ec <.L5>:
    e9ec:	ff550793          	add	a5,a0,-11
    e9f0:	00f417b3          	sll	a5,s0,a5

0000e9f4 <.LVL17>:
    e9f4:	00000413          	li	s0,0

0000e9f8 <.LVL18>:
    e9f8:	fe9ff06f          	j	e9e0 <.L6>

0000e9fc <.L4>:
    e9fc:	00000793          	li	a5,0
    ea00:	00040a63          	beqz	s0,ea14 <.L11>

0000ea04 <.LVL20>:
    ea04:	00345793          	srl	a5,s0,0x3

0000ea08 <.LVL21>:
    ea08:	00080737          	lui	a4,0x80

0000ea0c <.LVL22>:
    ea0c:	01d41413          	sll	s0,s0,0x1d

0000ea10 <.LVL23>:
    ea10:	00e7e7b3          	or	a5,a5,a4

0000ea14 <.L11>:
    ea14:	7ff00713          	li	a4,2047
    ea18:	f65ff06f          	j	e97c <.L3>

0000ea1c <__extenddftf2>:
  FP_DECL_D (A);
  FP_DECL_Q (R);
  TFtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
    ea1c:	01465713          	srl	a4,a2,0x14
    ea20:	00c61793          	sll	a5,a2,0xc
    ea24:	7ff77713          	and	a4,a4,2047

0000ea28 <.LBE2>:
{
    ea28:	fd010113          	add	sp,sp,-48

0000ea2c <.LBB3>:
  FP_UNPACK_RAW_D (A, a);
    ea2c:	00c7d793          	srl	a5,a5,0xc

0000ea30 <.LBE3>:
#if _FP_W_TYPE_SIZE < 64
  FP_EXTEND (Q, D, 4, 2, R, A);
    ea30:	00170693          	add	a3,a4,1 # 80001 <_ebss+0x69cd1>
{
    ea34:	02812423          	sw	s0,40(sp)
    ea38:	02912223          	sw	s1,36(sp)
    ea3c:	03212023          	sw	s2,32(sp)
    ea40:	02112623          	sw	ra,44(sp)
  FP_EXTEND (Q, D, 4, 2, R, A);
    ea44:	00b12823          	sw	a1,16(sp)
    ea48:	00f12a23          	sw	a5,20(sp)
    ea4c:	00012e23          	sw	zero,28(sp)
    ea50:	00012c23          	sw	zero,24(sp)
    ea54:	7fe6f693          	and	a3,a3,2046
{
    ea58:	00050913          	mv	s2,a0
    ea5c:	00058413          	mv	s0,a1

0000ea60 <.LBB4>:
  FP_UNPACK_RAW_D (A, a);
    ea60:	01f65493          	srl	s1,a2,0x1f

0000ea64 <.LBE4>:
  FP_EXTEND (Q, D, 4, 2, R, A);
    ea64:	08068263          	beqz	a3,eae8 <.L2>
    ea68:	000046b7          	lui	a3,0x4
    ea6c:	c0068693          	add	a3,a3,-1024 # 3c00 <.L66+0x20>
    ea70:	00d70733          	add	a4,a4,a3

0000ea74 <.LBB5>:
    ea74:	0047d693          	srl	a3,a5,0x4
    ea78:	00d12e23          	sw	a3,28(sp)

0000ea7c <.LVL4>:
    ea7c:	01c79793          	sll	a5,a5,0x1c

0000ea80 <.LVL5>:
    ea80:	0045d693          	srl	a3,a1,0x4
    ea84:	00d7e7b3          	or	a5,a5,a3
    ea88:	01c59413          	sll	s0,a1,0x1c
    ea8c:	00f12c23          	sw	a5,24(sp)

0000ea90 <.LVL6>:
    ea90:	00812a23          	sw	s0,20(sp)

0000ea94 <.LVL7>:
    ea94:	00012823          	sw	zero,16(sp)

0000ea98 <.L3>:
#else
  FP_EXTEND (Q, D, 2, 1, R, A);
#endif
  FP_PACK_RAW_Q (r, R);
    ea98:	01c12783          	lw	a5,28(sp)
    ea9c:	00f49493          	sll	s1,s1,0xf

0000eaa0 <.LVL9>:
    eaa0:	00e4e4b3          	or	s1,s1,a4
    eaa4:	00f11623          	sh	a5,12(sp)

0000eaa8 <.LBE6>:
  FP_HANDLE_EXCEPTIONS;

  return r;
    eaa8:	01012783          	lw	a5,16(sp)

0000eaac <.LBB7>:
  FP_PACK_RAW_Q (r, R);
    eaac:	00911723          	sh	s1,14(sp)

0000eab0 <.LBE7>:
}
    eab0:	02c12083          	lw	ra,44(sp)
  return r;
    eab4:	00f92023          	sw	a5,0(s2)
    eab8:	01412783          	lw	a5,20(sp)

0000eabc <.LVL11>:
}
    eabc:	02812403          	lw	s0,40(sp)
    eac0:	02412483          	lw	s1,36(sp)
  return r;
    eac4:	00f92223          	sw	a5,4(s2)
    eac8:	01812783          	lw	a5,24(sp)
}
    eacc:	00090513          	mv	a0,s2
  return r;
    ead0:	00f92423          	sw	a5,8(s2)
    ead4:	00c12783          	lw	a5,12(sp)
    ead8:	00f92623          	sw	a5,12(s2)
}
    eadc:	02012903          	lw	s2,32(sp)
    eae0:	03010113          	add	sp,sp,48

0000eae4 <.LVL13>:
    eae4:	00008067          	ret

0000eae8 <.L2>:
  FP_EXTEND (Q, D, 4, 2, R, A);
    eae8:	00b7e533          	or	a0,a5,a1
    eaec:	10071063          	bnez	a4,ebec <.L4>
    eaf0:	fa0504e3          	beqz	a0,ea98 <.L3>

0000eaf4 <.LBB8>:
    eaf4:	04078e63          	beqz	a5,eb50 <.L5>
    eaf8:	00078513          	mv	a0,a5
    eafc:	b19f20ef          	jal	1614 <__clzsi2>

0000eb00 <.L6>:
    eb00:	03150693          	add	a3,a0,49
    eb04:	4056d793          	sra	a5,a3,0x5

0000eb08 <.LVL17>:
    eb08:	01f6f693          	and	a3,a3,31

0000eb0c <.LVL18>:
    eb0c:	04068863          	beqz	a3,eb5c <.L7>
    eb10:	ffc00613          	li	a2,-4
    eb14:	02c78633          	mul	a2,a5,a2
    eb18:	02000813          	li	a6,32
    eb1c:	01010313          	add	t1,sp,16
    eb20:	40d80833          	sub	a6,a6,a3

0000eb24 <.LVL19>:
    eb24:	00c60713          	add	a4,a2,12
    eb28:	00e30733          	add	a4,t1,a4
    eb2c:	40c00633          	neg	a2,a2

0000eb30 <.L8>:
    eb30:	08e31c63          	bne	t1,a4,ebc8 <.L11>
    eb34:	fff78713          	add	a4,a5,-1

0000eb38 <.LVL20>:
    eb38:	00279793          	sll	a5,a5,0x2

0000eb3c <.LVL21>:
    eb3c:	02078793          	add	a5,a5,32
    eb40:	002787b3          	add	a5,a5,sp
    eb44:	00d416b3          	sll	a3,s0,a3

0000eb48 <.LVL22>:
    eb48:	fed7a823          	sw	a3,-16(a5)
    eb4c:	03c0006f          	j	eb88 <.L10>

0000eb50 <.L5>:
    eb50:	ac5f20ef          	jal	1614 <__clzsi2>

0000eb54 <.LVL24>:
    eb54:	02050513          	add	a0,a0,32
    eb58:	fa9ff06f          	j	eb00 <.L6>

0000eb5c <.L7>:
    eb5c:	ffc00613          	li	a2,-4
    eb60:	02c78633          	mul	a2,a5,a2
    eb64:	01c10713          	add	a4,sp,28

0000eb68 <.LBB10>:
    eb68:	00300693          	li	a3,3

0000eb6c <.L9>:
    eb6c:	00c705b3          	add	a1,a4,a2
    eb70:	0005a583          	lw	a1,0(a1)
    eb74:	fff68693          	add	a3,a3,-1

0000eb78 <.LVL28>:
    eb78:	ffc70713          	add	a4,a4,-4
    eb7c:	00b72223          	sw	a1,4(a4)

0000eb80 <.LVL29>:
    eb80:	fef6d6e3          	bge	a3,a5,eb6c <.L9>
    eb84:	fff78713          	add	a4,a5,-1

0000eb88 <.L10>:
    eb88:	00170793          	add	a5,a4,1
    eb8c:	00279793          	sll	a5,a5,0x2
    eb90:	00800693          	li	a3,8
    eb94:	01010713          	add	a4,sp,16
    eb98:	00d7ea63          	bltu	a5,a3,ebac <.L12>
    eb9c:	00012823          	sw	zero,16(sp)
    eba0:	00072223          	sw	zero,4(a4)
    eba4:	ff878793          	add	a5,a5,-8
    eba8:	01810713          	add	a4,sp,24

0000ebac <.L12>:
    ebac:	00400693          	li	a3,4
    ebb0:	00d7e463          	bltu	a5,a3,ebb8 <.L13>
    ebb4:	00072023          	sw	zero,0(a4)

0000ebb8 <.L13>:
    ebb8:	00004737          	lui	a4,0x4
    ebbc:	c0c70713          	add	a4,a4,-1012 # 3c0c <.L69+0x4>
    ebc0:	40a70733          	sub	a4,a4,a0

0000ebc4 <.LVL31>:
    ebc4:	ed5ff06f          	j	ea98 <.L3>

0000ebc8 <.L11>:
    ebc8:	00072583          	lw	a1,0(a4)
    ebcc:	ffc72883          	lw	a7,-4(a4)
    ebd0:	00c70e33          	add	t3,a4,a2
    ebd4:	00d595b3          	sll	a1,a1,a3
    ebd8:	0108d8b3          	srl	a7,a7,a6
    ebdc:	0115e5b3          	or	a1,a1,a7
    ebe0:	00be2023          	sw	a1,0(t3)
    ebe4:	ffc70713          	add	a4,a4,-4
    ebe8:	f49ff06f          	j	eb30 <.L8>

0000ebec <.L4>:
    ebec:	02050863          	beqz	a0,ec1c <.L14>

0000ebf0 <.LBB12>:
    ebf0:	01c79713          	sll	a4,a5,0x1c

0000ebf4 <.LVL35>:
    ebf4:	0045d693          	srl	a3,a1,0x4
    ebf8:	00d76733          	or	a4,a4,a3
    ebfc:	00e12c23          	sw	a4,24(sp)

0000ec00 <.LVL36>:
    ec00:	0047d793          	srl	a5,a5,0x4

0000ec04 <.LBE12>:
    ec04:	00008737          	lui	a4,0x8

0000ec08 <.LBB13>:
    ec08:	01c59413          	sll	s0,a1,0x1c

0000ec0c <.LBE13>:
    ec0c:	00e7e7b3          	or	a5,a5,a4

0000ec10 <.LBB14>:
    ec10:	00812a23          	sw	s0,20(sp)

0000ec14 <.LVL39>:
    ec14:	00012823          	sw	zero,16(sp)

0000ec18 <.LBE14>:
    ec18:	00f12e23          	sw	a5,28(sp)

0000ec1c <.L14>:
    ec1c:	00008737          	lui	a4,0x8
    ec20:	fff70713          	add	a4,a4,-1 # 7fff <.L2+0x7b>
    ec24:	e75ff06f          	j	ea98 <.L3>

0000ec28 <__truncdfsf2>:
  FP_DECL_D (A);
  FP_DECL_S (R);
  SFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
    ec28:	0145d613          	srl	a2,a1,0x14
    ec2c:	7ff67613          	and	a2,a2,2047
    ec30:	00c59793          	sll	a5,a1,0xc

0000ec34 <.LBE2>:
#if _FP_W_TYPE_SIZE < _FP_FRACBITS_D
  FP_TRUNC (S, D, 1, 2, R, A);
    ec34:	00160713          	add	a4,a2,1
  FP_UNPACK_SEMIRAW_D (A, a);
    ec38:	0097d793          	srl	a5,a5,0x9

0000ec3c <.LVL2>:
    ec3c:	01d55693          	srl	a3,a0,0x1d
  FP_TRUNC (S, D, 1, 2, R, A);
    ec40:	7fe77713          	and	a4,a4,2046
  FP_UNPACK_SEMIRAW_D (A, a);
    ec44:	00f6e6b3          	or	a3,a3,a5

0000ec48 <.LBB5>:
    ec48:	01f5d593          	srl	a1,a1,0x1f

0000ec4c <.LBE5>:
    ec4c:	00351793          	sll	a5,a0,0x3

0000ec50 <.LVL4>:
  FP_TRUNC (S, D, 1, 2, R, A);
    ec50:	0a070663          	beqz	a4,ecfc <.L2>
    ec54:	c8060713          	add	a4,a2,-896

0000ec58 <.LVL5>:
    ec58:	0fe00813          	li	a6,254
    ec5c:	0ce84263          	blt	a6,a4,ed20 <.L11>
    ec60:	08e04063          	bgtz	a4,ece0 <.L4>
    ec64:	fe900513          	li	a0,-23

0000ec68 <.LVL6>:
    ec68:	10a74a63          	blt	a4,a0,ed7c <.L12>
    ec6c:	00800537          	lui	a0,0x800
    ec70:	00a6e6b3          	or	a3,a3,a0
    ec74:	01e00513          	li	a0,30
    ec78:	40e50533          	sub	a0,a0,a4
    ec7c:	01f00813          	li	a6,31
    ec80:	02a84863          	blt	a6,a0,ecb0 <.L5>
    ec84:	c8260613          	add	a2,a2,-894

0000ec88 <.LVL8>:
    ec88:	00a7d533          	srl	a0,a5,a0
    ec8c:	00c797b3          	sll	a5,a5,a2

0000ec90 <.LVL9>:
    ec90:	00f037b3          	snez	a5,a5
    ec94:	00c696b3          	sll	a3,a3,a2

0000ec98 <.LVL10>:
    ec98:	00d7e7b3          	or	a5,a5,a3
    ec9c:	00f567b3          	or	a5,a0,a5

0000eca0 <.L26>:
    eca0:	00000713          	li	a4,0

0000eca4 <.L3>:
#else
  FP_TRUNC (S, D, 1, 1, R, A);
#endif
  FP_PACK_SEMIRAW_S (r, R);
    eca4:	0077f693          	and	a3,a5,7
    eca8:	08068063          	beqz	a3,ed28 <.L8>
    ecac:	0d80006f          	j	ed84 <.L24>

0000ecb0 <.L5>:
  FP_TRUNC (S, D, 1, 2, R, A);
    ecb0:	ffe00813          	li	a6,-2
    ecb4:	40e80833          	sub	a6,a6,a4
    ecb8:	02000893          	li	a7,32
    ecbc:	0106d833          	srl	a6,a3,a6
    ecc0:	00000713          	li	a4,0

0000ecc4 <.LVL14>:
    ecc4:	01150663          	beq	a0,a7,ecd0 <.L6>
    ecc8:	ca260613          	add	a2,a2,-862

0000eccc <.LVL15>:
    eccc:	00c69733          	sll	a4,a3,a2

0000ecd0 <.L6>:
    ecd0:	00f76733          	or	a4,a4,a5
    ecd4:	00e03733          	snez	a4,a4
    ecd8:	00e867b3          	or	a5,a6,a4

0000ecdc <.LVL17>:
    ecdc:	fc5ff06f          	j	eca0 <.L26>

0000ece0 <.L4>:
    ece0:	00651513          	sll	a0,a0,0x6

0000ece4 <.LVL19>:
    ece4:	00a03533          	snez	a0,a0
    ece8:	00369693          	sll	a3,a3,0x3

0000ecec <.LVL20>:
    ecec:	01d7d793          	srl	a5,a5,0x1d

0000ecf0 <.LVL21>:
    ecf0:	00d566b3          	or	a3,a0,a3

0000ecf4 <.L27>:
    ecf4:	00f6e7b3          	or	a5,a3,a5

0000ecf8 <.LVL23>:
    ecf8:	fadff06f          	j	eca4 <.L3>

0000ecfc <.L2>:
    ecfc:	00f6e7b3          	or	a5,a3,a5

0000ed00 <.LVL25>:
    ed00:	00061663          	bnez	a2,ed0c <.L7>

0000ed04 <.LVL26>:
    ed04:	00f037b3          	snez	a5,a5
    ed08:	f99ff06f          	j	eca0 <.L26>

0000ed0c <.L7>:
    ed0c:	0ff00713          	li	a4,255
    ed10:	00078c63          	beqz	a5,ed28 <.L8>

0000ed14 <.LVL28>:
    ed14:	00369693          	sll	a3,a3,0x3

0000ed18 <.LVL29>:
    ed18:	020007b7          	lui	a5,0x2000
    ed1c:	fd9ff06f          	j	ecf4 <.L27>

0000ed20 <.L11>:
    ed20:	00000793          	li	a5,0

0000ed24 <.LVL31>:
    ed24:	0ff00713          	li	a4,255

0000ed28 <.L8>:
  FP_PACK_SEMIRAW_S (r, R);
    ed28:	00579693          	sll	a3,a5,0x5
    ed2c:	0006de63          	bgez	a3,ed48 <.L9>

0000ed30 <.LVL33>:
    ed30:	00170713          	add	a4,a4,1

0000ed34 <.LVL34>:
    ed34:	0ff00693          	li	a3,255
    ed38:	06d70063          	beq	a4,a3,ed98 <.L15>
    ed3c:	fc0006b7          	lui	a3,0xfc000
    ed40:	fff68693          	add	a3,a3,-1 # fbffffff <_ebss+0xfbfe9ccf>
    ed44:	00d7f7b3          	and	a5,a5,a3

0000ed48 <.L9>:
    ed48:	0ff00693          	li	a3,255
    ed4c:	0037d793          	srl	a5,a5,0x3
    ed50:	00d71863          	bne	a4,a3,ed60 <.L10>
    ed54:	00078663          	beqz	a5,ed60 <.L10>
    ed58:	004007b7          	lui	a5,0x400

0000ed5c <.LVL37>:
    ed5c:	00000593          	li	a1,0

0000ed60 <.L10>:
    ed60:	7f8006b7          	lui	a3,0x7f800
    ed64:	01771713          	sll	a4,a4,0x17

0000ed68 <.LVL39>:
    ed68:	00d77733          	and	a4,a4,a3
    ed6c:	00f76733          	or	a4,a4,a5
    ed70:	01f59513          	sll	a0,a1,0x1f

0000ed74 <.LBE13>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    ed74:	00a76533          	or	a0,a4,a0

0000ed78 <.LVL41>:
    ed78:	00008067          	ret

0000ed7c <.L12>:
  FP_TRUNC (S, D, 1, 2, R, A);
    ed7c:	00100793          	li	a5,1

0000ed80 <.LVL43>:
    ed80:	00000713          	li	a4,0

0000ed84 <.L24>:
  FP_PACK_SEMIRAW_S (r, R);
    ed84:	00f7f693          	and	a3,a5,15
    ed88:	00400613          	li	a2,4
    ed8c:	f8c68ee3          	beq	a3,a2,ed28 <.L8>
    ed90:	00478793          	add	a5,a5,4 # 400004 <_ebss+0x3e9cd4>
    ed94:	f95ff06f          	j	ed28 <.L8>

0000ed98 <.L15>:
    ed98:	00000793          	li	a5,0

0000ed9c <.LVL47>:
    ed9c:	fadff06f          	j	ed48 <.L9>

0000eda0 <__trunctfdf2>:
#include "double.h"
#include "quad.h"

DFtype
__trunctfdf2 (TFtype a)
{
    eda0:	00c52583          	lw	a1,12(a0) # 80000c <_ebss+0x7e9cdc>
    eda4:	00852703          	lw	a4,8(a0)
    eda8:	00452683          	lw	a3,4(a0)
    edac:	fe010113          	add	sp,sp,-32
    edb0:	00052783          	lw	a5,0(a0)

0000edb4 <.LBB3>:
  FP_DECL_Q (A);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_Q (A, a);
    edb4:	00e12423          	sw	a4,8(sp)
    edb8:	00e12c23          	sw	a4,24(sp)
    edbc:	01059713          	sll	a4,a1,0x10
    edc0:	01075713          	srl	a4,a4,0x10
    edc4:	00d12223          	sw	a3,4(sp)
    edc8:	00d12a23          	sw	a3,20(sp)
    edcc:	01010613          	add	a2,sp,16
    edd0:	00159693          	sll	a3,a1,0x1
    edd4:	00b12623          	sw	a1,12(sp)
    edd8:	00e12e23          	sw	a4,28(sp)
    eddc:	00f12023          	sw	a5,0(sp)
    ede0:	00f12823          	sw	a5,16(sp)
    ede4:	0116d693          	srl	a3,a3,0x11

0000ede8 <.LVL1>:
    ede8:	01f5d593          	srl	a1,a1,0x1f

0000edec <.LBB4>:
    edec:	01c10713          	add	a4,sp,28
    edf0:	00060893          	mv	a7,a2

0000edf4 <.L2>:
    edf4:	00072503          	lw	a0,0(a4)
    edf8:	ffc72803          	lw	a6,-4(a4)
    edfc:	ffc70713          	add	a4,a4,-4
    ee00:	00351513          	sll	a0,a0,0x3
    ee04:	01d85813          	srl	a6,a6,0x1d
    ee08:	01056533          	or	a0,a0,a6
    ee0c:	00a72223          	sw	a0,4(a4)
    ee10:	fee612e3          	bne	a2,a4,edf4 <.L2>

0000ee14 <.LVL4>:
    ee14:	00379513          	sll	a0,a5,0x3

0000ee18 <.LBE4>:
#if _FP_W_TYPE_SIZE < 64
  FP_TRUNC (D, Q, 2, 4, R, A);
    ee18:	00168793          	add	a5,a3,1 # 7f800001 <_ebss+0x7f7e9cd1>
    ee1c:	01179713          	sll	a4,a5,0x11

0000ee20 <.LBB5>:
  FP_UNPACK_SEMIRAW_Q (A, a);
    ee20:	00a12823          	sw	a0,16(sp)

0000ee24 <.LBE5>:
  FP_TRUNC (D, Q, 2, 4, R, A);
    ee24:	01275713          	srl	a4,a4,0x12
    ee28:	1c070263          	beqz	a4,efec <.L3>
    ee2c:	ffffc7b7          	lui	a5,0xffffc
    ee30:	40078793          	add	a5,a5,1024 # ffffc400 <_ebss+0xfffe60d0>
    ee34:	00f686b3          	add	a3,a3,a5

0000ee38 <.LVL6>:
    ee38:	7fe00793          	li	a5,2046
    ee3c:	20d7c463          	blt	a5,a3,f044 <.L23>
    ee40:	06d05463          	blez	a3,eea8 <.L5>

0000ee44 <.LBB6>:
    ee44:	01812603          	lw	a2,24(sp)
    ee48:	01c12783          	lw	a5,28(sp)
    ee4c:	01412703          	lw	a4,20(sp)

0000ee50 <.LVL8>:
    ee50:	01c65813          	srl	a6,a2,0x1c
    ee54:	00479793          	sll	a5,a5,0x4
    ee58:	0107e7b3          	or	a5,a5,a6
    ee5c:	00f12a23          	sw	a5,20(sp)

0000ee60 <.LBB8>:
    ee60:	00471793          	sll	a5,a4,0x4
    ee64:	00a7e7b3          	or	a5,a5,a0

0000ee68 <.LVL10>:
    ee68:	01c75713          	srl	a4,a4,0x1c

0000ee6c <.LVL11>:
    ee6c:	00461613          	sll	a2,a2,0x4
    ee70:	00f037b3          	snez	a5,a5

0000ee74 <.LVL12>:
    ee74:	00c76733          	or	a4,a4,a2

0000ee78 <.LBE8>:
    ee78:	00e7e7b3          	or	a5,a5,a4

0000ee7c <.L6>:
    ee7c:	01412703          	lw	a4,20(sp)

0000ee80 <.L4>:
#else
  FP_TRUNC (D, Q, 1, 2, R, A);
#endif
  FP_PACK_SEMIRAW_D (r, R);
    ee80:	0077f613          	and	a2,a5,7
    ee84:	1c060663          	beqz	a2,f050 <.L18>
    ee88:	00f7f613          	and	a2,a5,15
    ee8c:	00400513          	li	a0,4
    ee90:	1ca60063          	beq	a2,a0,f050 <.L18>

0000ee94 <.LBB11>:
    ee94:	00478613          	add	a2,a5,4
    ee98:	00f63533          	sltu	a0,a2,a5
    ee9c:	00a70733          	add	a4,a4,a0

0000eea0 <.LVL15>:
    eea0:	00060793          	mv	a5,a2

0000eea4 <.LVL16>:
    eea4:	1ac0006f          	j	f050 <.L18>

0000eea8 <.L5>:
  FP_TRUNC (D, Q, 2, 4, R, A);
    eea8:	fcc00793          	li	a5,-52
    eeac:	00f6da63          	bge	a3,a5,eec0 <.L7>
    eeb0:	00012a23          	sw	zero,20(sp)
    eeb4:	00100793          	li	a5,1

0000eeb8 <.L39>:
    eeb8:	00000693          	li	a3,0
    eebc:	fc1ff06f          	j	ee7c <.L6>

0000eec0 <.L7>:
    eec0:	01c12783          	lw	a5,28(sp)
    eec4:	00080737          	lui	a4,0x80

0000eec8 <.LBB15>:
    eec8:	00060813          	mv	a6,a2

0000eecc <.LBE15>:
    eecc:	00f76eb3          	or	t4,a4,a5

0000eed0 <.LBB17>:
    eed0:	03d00793          	li	a5,61
    eed4:	40d787b3          	sub	a5,a5,a3
    eed8:	4057d693          	sra	a3,a5,0x5

0000eedc <.LVL20>:
    eedc:	01f7f713          	and	a4,a5,31

0000eee0 <.LBE17>:
    eee0:	01d12e23          	sw	t4,28(sp)

0000eee4 <.LBB18>:
    eee4:	00000513          	li	a0,0
    eee8:	00000793          	li	a5,0

0000eeec <.L8>:
    eeec:	00082303          	lw	t1,0(a6)
    eef0:	00150513          	add	a0,a0,1

0000eef4 <.LVL23>:
    eef4:	00480813          	add	a6,a6,4
    eef8:	0067e7b3          	or	a5,a5,t1

0000eefc <.LVL24>:
    eefc:	fea698e3          	bne	a3,a0,eeec <.L8>
    ef00:	00300513          	li	a0,3

0000ef04 <.LVL25>:
    ef04:	40d50533          	sub	a0,a0,a3
    ef08:	00269813          	sll	a6,a3,0x2
    ef0c:	02071463          	bnez	a4,ef34 <.L9>

0000ef10 <.L10>:
    ef10:	01088333          	add	t1,a7,a6
    ef14:	00032303          	lw	t1,0(t1)
    ef18:	00170713          	add	a4,a4,1 # 80001 <_ebss+0x69cd1>

0000ef1c <.LVL27>:
    ef1c:	00488893          	add	a7,a7,4
    ef20:	fe68ae23          	sw	t1,-4(a7)

0000ef24 <.LVL28>:
    ef24:	fee556e3          	bge	a0,a4,ef10 <.L10>
    ef28:	00400713          	li	a4,4

0000ef2c <.LVL29>:
    ef2c:	40d706b3          	sub	a3,a4,a3

0000ef30 <.LVL30>:
    ef30:	04c0006f          	j	ef7c <.L14>

0000ef34 <.L9>:
    ef34:	02080893          	add	a7,a6,32
    ef38:	002888b3          	add	a7,a7,sp
    ef3c:	ff08a883          	lw	a7,-16(a7)
    ef40:	02000e13          	li	t3,32
    ef44:	40ee0e33          	sub	t3,t3,a4
    ef48:	01c898b3          	sll	a7,a7,t3
    ef4c:	0117e7b3          	or	a5,a5,a7

0000ef50 <.LVL32>:
    ef50:	00000f13          	li	t5,0
    ef54:	010608b3          	add	a7,a2,a6
    ef58:	41000833          	neg	a6,a6

0000ef5c <.L12>:
    ef5c:	06af4463          	blt	t5,a0,efc4 <.L13>
    ef60:	00251513          	sll	a0,a0,0x2
    ef64:	02050513          	add	a0,a0,32
    ef68:	00400813          	li	a6,4
    ef6c:	00250533          	add	a0,a0,sp
    ef70:	00eed733          	srl	a4,t4,a4

0000ef74 <.LVL34>:
    ef74:	40d806b3          	sub	a3,a6,a3

0000ef78 <.LVL35>:
    ef78:	fee52823          	sw	a4,-16(a0)

0000ef7c <.L14>:
    ef7c:	00400513          	li	a0,4
    ef80:	40d50533          	sub	a0,a0,a3
    ef84:	00269693          	sll	a3,a3,0x2

0000ef88 <.LVL37>:
    ef88:	00d60733          	add	a4,a2,a3
    ef8c:	00251693          	sll	a3,a0,0x2
    ef90:	00800613          	li	a2,8
    ef94:	00c6ea63          	bltu	a3,a2,efa8 <.L15>
    ef98:	00072023          	sw	zero,0(a4)
    ef9c:	00072223          	sw	zero,4(a4)
    efa0:	ff868693          	add	a3,a3,-8
    efa4:	00870713          	add	a4,a4,8

0000efa8 <.L15>:
    efa8:	00400613          	li	a2,4
    efac:	00c6e463          	bltu	a3,a2,efb4 <.L16>
    efb0:	00072023          	sw	zero,0(a4)

0000efb4 <.L16>:
    efb4:	01012703          	lw	a4,16(sp)

0000efb8 <.LBB19>:
    efb8:	00f037b3          	snez	a5,a5

0000efbc <.LBE19>:
    efbc:	00e7e7b3          	or	a5,a5,a4
    efc0:	ef9ff06f          	j	eeb8 <.L39>

0000efc4 <.L13>:
    efc4:	0008a303          	lw	t1,0(a7)
    efc8:	0048af83          	lw	t6,4(a7)
    efcc:	010882b3          	add	t0,a7,a6
    efd0:	00e35333          	srl	t1,t1,a4
    efd4:	01cf9fb3          	sll	t6,t6,t3
    efd8:	01f36333          	or	t1,t1,t6
    efdc:	0062a023          	sw	t1,0(t0)

0000efe0 <.LVL41>:
    efe0:	001f0f13          	add	t5,t5,1

0000efe4 <.LVL42>:
    efe4:	00488893          	add	a7,a7,4
    efe8:	f75ff06f          	j	ef5c <.L12>

0000efec <.L3>:
    efec:	01412603          	lw	a2,20(sp)
    eff0:	01812703          	lw	a4,24(sp)
    eff4:	01c12803          	lw	a6,28(sp)

0000eff8 <.LBE23>:
    eff8:	00c767b3          	or	a5,a4,a2
    effc:	0107e7b3          	or	a5,a5,a6
    f000:	00a7e7b3          	or	a5,a5,a0
    f004:	00069863          	bnez	a3,f014 <.L17>

0000f008 <.LVL44>:
    f008:	00f037b3          	snez	a5,a5
    f00c:	00000713          	li	a4,0
    f010:	e71ff06f          	j	ee80 <.L4>

0000f014 <.L17>:
    f014:	0a078e63          	beqz	a5,f0d0 <.L24>

0000f018 <.LBB24>:
    f018:	00471793          	sll	a5,a4,0x4
    f01c:	01c65613          	srl	a2,a2,0x1c

0000f020 <.LVL47>:
    f020:	01c75713          	srl	a4,a4,0x1c

0000f024 <.LVL48>:
    f024:	00481813          	sll	a6,a6,0x4

0000f028 <.LBE25>:
    f028:	004006b7          	lui	a3,0x400

0000f02c <.LBB26>:
    f02c:	00f66633          	or	a2,a2,a5

0000f030 <.LVL51>:
    f030:	01076733          	or	a4,a4,a6

0000f034 <.LBE26>:
    f034:	00d76733          	or	a4,a4,a3

0000f038 <.LVL53>:
    f038:	ff867793          	and	a5,a2,-8

0000f03c <.LVL54>:
    f03c:	7ff00693          	li	a3,2047
    f040:	e41ff06f          	j	ee80 <.L4>

0000f044 <.L23>:
    f044:	00000713          	li	a4,0
    f048:	00000793          	li	a5,0

0000f04c <.L40>:
    f04c:	7ff00693          	li	a3,2047

0000f050 <.L18>:
  FP_PACK_SEMIRAW_D (r, R);
    f050:	00871613          	sll	a2,a4,0x8
    f054:	00065e63          	bgez	a2,f070 <.L21>

0000f058 <.LVL58>:
    f058:	00168693          	add	a3,a3,1 # 400001 <_ebss+0x3e9cd1>

0000f05c <.LVL59>:
    f05c:	7ff00613          	li	a2,2047
    f060:	06c68c63          	beq	a3,a2,f0d8 <.L25>
    f064:	ff800637          	lui	a2,0xff800
    f068:	fff60613          	add	a2,a2,-1 # ff7fffff <_ebss+0xff7e9ccf>
    f06c:	00c77733          	and	a4,a4,a2

0000f070 <.L21>:
    f070:	01d71613          	sll	a2,a4,0x1d
    f074:	0037d793          	srl	a5,a5,0x3

0000f078 <.LVL61>:
    f078:	00f667b3          	or	a5,a2,a5

0000f07c <.LVL62>:
    f07c:	7ff00613          	li	a2,2047
    f080:	00375713          	srl	a4,a4,0x3
    f084:	00c69e63          	bne	a3,a2,f0a0 <.L22>

0000f088 <.LVL64>:
    f088:	00e7e7b3          	or	a5,a5,a4

0000f08c <.LVL65>:
    f08c:	00000713          	li	a4,0

0000f090 <.LVL66>:
    f090:	00078863          	beqz	a5,f0a0 <.L22>
    f094:	00080737          	lui	a4,0x80
    f098:	00000793          	li	a5,0
    f09c:	00000593          	li	a1,0

0000f0a0 <.L22>:
    f0a0:	01469693          	sll	a3,a3,0x14
    f0a4:	7ff00637          	lui	a2,0x7ff00
    f0a8:	00c71713          	sll	a4,a4,0xc

0000f0ac <.LVL68>:
    f0ac:	00c75713          	srl	a4,a4,0xc
    f0b0:	00c6f6b3          	and	a3,a3,a2
    f0b4:	01f59593          	sll	a1,a1,0x1f

0000f0b8 <.LVL69>:
    f0b8:	00e6e6b3          	or	a3,a3,a4
    f0bc:	00b6e733          	or	a4,a3,a1

0000f0c0 <.LBE28>:
  FP_HANDLE_EXCEPTIONS;

  return r;
}
    f0c0:	00078513          	mv	a0,a5
    f0c4:	00070593          	mv	a1,a4
    f0c8:	02010113          	add	sp,sp,32

0000f0cc <.LVL71>:
    f0cc:	00008067          	ret

0000f0d0 <.L24>:
    f0d0:	00000713          	li	a4,0
    f0d4:	f79ff06f          	j	f04c <.L40>

0000f0d8 <.L25>:
    f0d8:	00000713          	li	a4,0

0000f0dc <.LVL74>:
    f0dc:	00000793          	li	a5,0

0000f0e0 <.LVL75>:
    f0e0:	f91ff06f          	j	f070 <.L21>

0000f0e4 <pset>:
/* ------------------------------------------------------------------ */
/* Primitives                                                           */
/* ------------------------------------------------------------------ */
static void pset(int x, int y, uint8_t r, uint8_t g, uint8_t b)
{
    if ((unsigned)x >= (unsigned)g_w || (unsigned)y >= (unsigned)g_h) return;
    f0e4:	00007797          	auipc	a5,0x7
    f0e8:	1e87a783          	lw	a5,488(a5) # 162cc <g_w>
    f0ec:	02f57e63          	bgeu	a0,a5,f128 <.L1>
    f0f0:	00007817          	auipc	a6,0x7
    f0f4:	1d882803          	lw	a6,472(a6) # 162c8 <g_h>
    f0f8:	0305f863          	bgeu	a1,a6,f128 <.L1>

0000f0fc <.LVL1>:
    int off = (y * g_w + x) * 4;
    f0fc:	02b787b3          	mul	a5,a5,a1

0000f100 <.LVL2>:
    g_buf[off+0] = r; g_buf[off+1] = g; g_buf[off+2] = b; g_buf[off+3] = 0xff;
    f100:	00007597          	auipc	a1,0x7
    f104:	1d05a583          	lw	a1,464(a1) # 162d0 <g_buf>

0000f108 <.LVL3>:
    int off = (y * g_w + x) * 4;
    f108:	00a787b3          	add	a5,a5,a0
    f10c:	00279793          	sll	a5,a5,0x2

0000f110 <.LVL4>:
    g_buf[off+0] = r; g_buf[off+1] = g; g_buf[off+2] = b; g_buf[off+3] = 0xff;
    f110:	00f587b3          	add	a5,a1,a5

0000f114 <.LVL5>:
    f114:	00e78123          	sb	a4,2(a5)
    f118:	fff00713          	li	a4,-1

0000f11c <.LVL6>:
    f11c:	00c78023          	sb	a2,0(a5)
    f120:	00d780a3          	sb	a3,1(a5)
    f124:	00e781a3          	sb	a4,3(a5)

0000f128 <.L1>:
}
    f128:	00008067          	ret

0000f12c <fill_rect>:

static void fill_rect(int x0, int y0, int x1, int y1,
                      uint8_t r, uint8_t g, uint8_t b)
{
    if (x0 < 0) x0 = 0; if (y0 < 0) y0 = 0;
    f12c:	00055463          	bgez	a0,f134 <.L4>
    f130:	00000513          	li	a0,0

0000f134 <.L4>:
    f134:	0005d463          	bgez	a1,f13c <.L5>
    f138:	00000593          	li	a1,0

0000f13c <.L5>:
    if (x1 > g_w) x1 = g_w; if (y1 > g_h) y1 = g_h;
    f13c:	00007897          	auipc	a7,0x7
    f140:	1908a883          	lw	a7,400(a7) # 162cc <g_w>
    f144:	00088e93          	mv	t4,a7
    f148:	01165463          	bge	a2,a7,f150 <.L6>
    f14c:	00060e93          	mv	t4,a2

0000f150 <.L6>:
    f150:	00007e17          	auipc	t3,0x7
    f154:	178e2e03          	lw	t3,376(t3) # 162c8 <g_h>
    f158:	01c6d463          	bge	a3,t3,f160 <.L7>
    f15c:	00068e13          	mv	t3,a3

0000f160 <.L7>:
    for (int y = y0; y < y1; y++)
    f160:	03158333          	mul	t1,a1,a7

0000f164 <.LBB3>:
        for (int x = x0; x < x1; x++) {
            int off = (y * g_w + x) * 4;
            g_buf[off+0]=r; g_buf[off+1]=g; g_buf[off+2]=b; g_buf[off+3]=0xff;
    f164:	00007f17          	auipc	t5,0x7
    f168:	16cf2f03          	lw	t5,364(t5) # 162d0 <g_buf>
    f16c:	fff00f93          	li	t6,-1

0000f170 <.L8>:
    for (int y = y0; y < y1; y++)
    f170:	05c5d063          	bge	a1,t3,f1b0 <.L3>
    f174:	00a306b3          	add	a3,t1,a0
    f178:	00269693          	sll	a3,a3,0x2
    f17c:	00df06b3          	add	a3,t5,a3

0000f180 <.LBB6>:
        for (int x = x0; x < x1; x++) {
    f180:	00050613          	mv	a2,a0
    f184:	01c0006f          	j	f1a0 <.L11>

0000f188 <.L9>:
            g_buf[off+0]=r; g_buf[off+1]=g; g_buf[off+2]=b; g_buf[off+3]=0xff;
    f188:	00e68023          	sb	a4,0(a3)
    f18c:	00f680a3          	sb	a5,1(a3)
    f190:	01068123          	sb	a6,2(a3)
    f194:	01f681a3          	sb	t6,3(a3)

0000f198 <.LBE5>:
        for (int x = x0; x < x1; x++) {
    f198:	00160613          	add	a2,a2,1 # 7ff00001 <_ebss+0x7fee9cd1>
    f19c:	00468693          	add	a3,a3,4

0000f1a0 <.L11>:
    f1a0:	ffd644e3          	blt	a2,t4,f188 <.L9>

0000f1a4 <.LBE6>:
    for (int y = y0; y < y1; y++)
    f1a4:	00158593          	add	a1,a1,1
    f1a8:	01130333          	add	t1,t1,a7
    f1ac:	fc5ff06f          	j	f170 <.L8>

0000f1b0 <.L3>:
        }
}
    f1b0:	00008067          	ret

0000f1b4 <clear>:

static void clear(void) { fill_rect(0, 0, g_w, g_h, 0, 0, 0); }
    f1b4:	00000813          	li	a6,0
    f1b8:	00000793          	li	a5,0
    f1bc:	00000713          	li	a4,0
    f1c0:	00007697          	auipc	a3,0x7
    f1c4:	1086a683          	lw	a3,264(a3) # 162c8 <g_h>
    f1c8:	00007617          	auipc	a2,0x7
    f1cc:	10462603          	lw	a2,260(a2) # 162cc <g_w>
    f1d0:	00000593          	li	a1,0
    f1d4:	00000513          	li	a0,0
    f1d8:	f55ff06f          	j	f12c <fill_rect>

0000f1dc <draw_line>:

/* Bresenham line */
static void draw_line(int x0, int y0, int x1, int y1,
                      uint8_t r, uint8_t g, uint8_t b)
{
    f1dc:	fb010113          	add	sp,sp,-80
    f1e0:	03412c23          	sw	s4,56(sp)
    f1e4:	00060a13          	mv	s4,a2
    f1e8:	05212023          	sw	s2,64(sp)
    int dx = abs(x1-x0), sx = x0<x1 ? 1 : -1;
    f1ec:	40aa0933          	sub	s2,s4,a0
{
    f1f0:	03812423          	sw	s8,40(sp)
    f1f4:	00078c13          	mv	s8,a5
    int dx = abs(x1-x0), sx = x0<x1 ? 1 : -1;
    f1f8:	41f95793          	sra	a5,s2,0x1f

0000f1fc <.LVL21>:
{
    f1fc:	04812423          	sw	s0,72(sp)
    f200:	04912223          	sw	s1,68(sp)
    f204:	03512a23          	sw	s5,52(sp)
    f208:	03912223          	sw	s9,36(sp)
    f20c:	01b12e23          	sw	s11,28(sp)
    int dx = abs(x1-x0), sx = x0<x1 ? 1 : -1;
    f210:	0127c933          	xor	s2,a5,s2
{
    f214:	04112623          	sw	ra,76(sp)
    f218:	03312e23          	sw	s3,60(sp)
    f21c:	03612823          	sw	s6,48(sp)
    f220:	03712623          	sw	s7,44(sp)
    f224:	03a12023          	sw	s10,32(sp)
    f228:	00050493          	mv	s1,a0
    f22c:	00058413          	mv	s0,a1
    f230:	00068a93          	mv	s5,a3
    f234:	00070613          	mv	a2,a4

0000f238 <.LVL22>:
    f238:	00080c93          	mv	s9,a6
    int dx = abs(x1-x0), sx = x0<x1 ? 1 : -1;
    f23c:	40f90933          	sub	s2,s2,a5

0000f240 <.LVL23>:
    f240:	00100d93          	li	s11,1
    f244:	01454463          	blt	a0,s4,f24c <.L14>
    f248:	fff00d93          	li	s11,-1

0000f24c <.L14>:
    int dy = -abs(y1-y0), sy = y0<y1 ? 1 : -1;
    f24c:	408a89b3          	sub	s3,s5,s0
    f250:	41f9d793          	sra	a5,s3,0x1f
    f254:	0137c9b3          	xor	s3,a5,s3
    f258:	40f989b3          	sub	s3,s3,a5
    f25c:	41300bb3          	neg	s7,s3

0000f260 <.LVL25>:
    f260:	fff00d13          	li	s10,-1
    f264:	01545463          	bge	s0,s5,f26c <.L15>
    f268:	00100d13          	li	s10,1

0000f26c <.L15>:
    int err = dx+dy;
    f26c:	41390b33          	sub	s6,s2,s3

0000f270 <.L16>:
    for (;;) {
        pset(x0, y0, r, g, b);
    f270:	000c8713          	mv	a4,s9
    f274:	000c0693          	mv	a3,s8
    f278:	00040593          	mv	a1,s0
    f27c:	00048513          	mv	a0,s1
    f280:	00c12623          	sw	a2,12(sp)
    f284:	e61ff0ef          	jal	f0e4 <pset>

0000f288 <.LVL28>:
        if (x0==x1 && y0==y1) break;
    f288:	00c12603          	lw	a2,12(sp)
    f28c:	01449463          	bne	s1,s4,f294 <.L17>
    f290:	03540663          	beq	s0,s5,f2bc <.L13>

0000f294 <.L17>:
        int e2 = err<<1;
    f294:	001b1793          	sll	a5,s6,0x1

0000f298 <.LVL29>:
        if (e2 >= dy) { if (x0==x1) break; err+=dy; x0+=sx; }
    f298:	0177ca63          	blt	a5,s7,f2ac <.L19>
    f29c:	03448063          	beq	s1,s4,f2bc <.L13>
    f2a0:	413b0b33          	sub	s6,s6,s3
    f2a4:	01b484b3          	add	s1,s1,s11
        if (e2 <= dx) { if (y0==y1) break; err+=dx; y0+=sy; }
    f2a8:	fcf944e3          	blt	s2,a5,f270 <.L16>

0000f2ac <.L19>:
    f2ac:	01540863          	beq	s0,s5,f2bc <.L13>
    f2b0:	012b0b33          	add	s6,s6,s2
    f2b4:	01a40433          	add	s0,s0,s10
    f2b8:	fb9ff06f          	j	f270 <.L16>

0000f2bc <.L13>:
    }
}
    f2bc:	04c12083          	lw	ra,76(sp)
    f2c0:	04812403          	lw	s0,72(sp)

0000f2c4 <.LVL35>:
    f2c4:	04412483          	lw	s1,68(sp)

0000f2c8 <.LVL36>:
    f2c8:	04012903          	lw	s2,64(sp)

0000f2cc <.LVL37>:
    f2cc:	03c12983          	lw	s3,60(sp)
    f2d0:	03812a03          	lw	s4,56(sp)

0000f2d4 <.LVL38>:
    f2d4:	03412a83          	lw	s5,52(sp)

0000f2d8 <.LVL39>:
    f2d8:	03012b03          	lw	s6,48(sp)

0000f2dc <.LVL40>:
    f2dc:	02c12b83          	lw	s7,44(sp)

0000f2e0 <.LVL41>:
    f2e0:	02812c03          	lw	s8,40(sp)

0000f2e4 <.LVL42>:
    f2e4:	02412c83          	lw	s9,36(sp)

0000f2e8 <.LVL43>:
    f2e8:	02012d03          	lw	s10,32(sp)

0000f2ec <.LVL44>:
    f2ec:	01c12d83          	lw	s11,28(sp)

0000f2f0 <.LVL45>:
    f2f0:	05010113          	add	sp,sp,80
    f2f4:	00008067          	ret

0000f2f8 <hsv2rgb>:

/* HSV [0,1] → RGB [0,255] */
static void hsv2rgb(float h, float s, float v,
                    uint8_t *r, uint8_t *g, uint8_t *b)
{
    f2f8:	fd010113          	add	sp,sp,-48
    f2fc:	02912223          	sw	s1,36(sp)
    f300:	00050493          	mv	s1,a0
    float c = v*s;
    f304:	00060513          	mv	a0,a2

0000f308 <.LVL47>:
{
    f308:	02112623          	sw	ra,44(sp)
    f30c:	02812423          	sw	s0,40(sp)
    f310:	03212023          	sw	s2,32(sp)
    f314:	01312e23          	sw	s3,28(sp)
    f318:	00060913          	mv	s2,a2
    f31c:	00078993          	mv	s3,a5
    f320:	01412c23          	sw	s4,24(sp)
    f324:	01512a23          	sw	s5,20(sp)
    f328:	00070a13          	mv	s4,a4
    f32c:	00068a93          	mv	s5,a3
    f330:	01612823          	sw	s6,16(sp)
    f334:	01712623          	sw	s7,12(sp)
    float c = v*s;
    f338:	9b1f10ef          	jal	ce8 <__mulsf3>

0000f33c <.LVL48>:
    f33c:	00050413          	mv	s0,a0

0000f340 <.LVL49>:
    float x = c * (1.0f - fabsf(fmodf(h*6.0f, 2.0f) - 1.0f));
    f340:	00003597          	auipc	a1,0x3
    f344:	f545a583          	lw	a1,-172(a1) # 12294 <.LC0>
    f348:	00048513          	mv	a0,s1
    f34c:	99df10ef          	jal	ce8 <__mulsf3>

0000f350 <.LVL50>:
    f350:	00003597          	auipc	a1,0x3
    f354:	f485a583          	lw	a1,-184(a1) # 12298 <.LC1>
    f358:	00050b93          	mv	s7,a0
    f35c:	e0df40ef          	jal	4168 <fmodf>

0000f360 <.LVL51>:
    f360:	00003597          	auipc	a1,0x3
    f364:	f3c5a583          	lw	a1,-196(a1) # 1229c <.LC2>
    f368:	c9df10ef          	jal	1004 <__subsf3>

0000f36c <.LVL52>:
    f36c:	00151593          	sll	a1,a0,0x1
    f370:	0015d593          	srl	a1,a1,0x1
    f374:	00003517          	auipc	a0,0x3
    f378:	f2852503          	lw	a0,-216(a0) # 1229c <.LC2>
    f37c:	c89f10ef          	jal	1004 <__subsf3>

0000f380 <.LVL53>:
    f380:	00040593          	mv	a1,s0
    f384:	965f10ef          	jal	ce8 <__mulsf3>

0000f388 <.LVL54>:
    float m = v-c;
    f388:	00040593          	mv	a1,s0
    float x = c * (1.0f - fabsf(fmodf(h*6.0f, 2.0f) - 1.0f));
    f38c:	00050493          	mv	s1,a0

0000f390 <.LVL55>:
    float m = v-c;
    f390:	00090513          	mv	a0,s2
    f394:	c71f10ef          	jal	1004 <__subsf3>

0000f398 <.LVL56>:
    f398:	00050b13          	mv	s6,a0

0000f39c <.LVL57>:
    float r1,g1,b1;
    int hi = (int)(h*6.0f) % 6;
    f39c:	000b8513          	mv	a0,s7

0000f3a0 <.LVL58>:
    f3a0:	894f20ef          	jal	1434 <__fixsfsi>

0000f3a4 <.LVL59>:
    f3a4:	00600793          	li	a5,6
    f3a8:	02f56633          	rem	a2,a0,a5
    f3ac:	00400793          	li	a5,4
    f3b0:	02c7e063          	bltu	a5,a2,f3d0 <.L26>
    f3b4:	00003717          	auipc	a4,0x3
    f3b8:	ae470713          	add	a4,a4,-1308 # 11e98 <.L28>
    f3bc:	00261613          	sll	a2,a2,0x2
    f3c0:	00e60633          	add	a2,a2,a4
    f3c4:	00062783          	lw	a5,0(a2)
    f3c8:	00e787b3          	add	a5,a5,a4
    f3cc:	00078067          	jr	a5

0000f3d0 <.L26>:
    if      (hi==0){r1=c;g1=x;b1=0;}
    else if (hi==1){r1=x;g1=c;b1=0;}
    else if (hi==2){r1=0;g1=c;b1=x;}
    else if (hi==3){r1=0;g1=x;b1=c;}
    else if (hi==4){r1=x;g1=0;b1=c;}
    else           {r1=c;g1=0;b1=x;}
    f3d0:	00048913          	mv	s2,s1

0000f3d4 <.L35>:
    int hi = (int)(h*6.0f) % 6;
    f3d4:	00000493          	li	s1,0

0000f3d8 <.LVL61>:
    f3d8:	0240006f          	j	f3fc <.L32>

0000f3dc <.L31>:
    f3dc:	00040793          	mv	a5,s0
    f3e0:	00048413          	mv	s0,s1

0000f3e4 <.LVL63>:
    f3e4:	00078493          	mv	s1,a5

0000f3e8 <.L33>:
    f3e8:	00000913          	li	s2,0

0000f3ec <.LVL65>:
    f3ec:	0100006f          	j	f3fc <.L32>

0000f3f0 <.L30>:
    f3f0:	00048913          	mv	s2,s1

0000f3f4 <.LVL67>:
    f3f4:	00040493          	mv	s1,s0

0000f3f8 <.L36>:
    f3f8:	00000413          	li	s0,0

0000f3fc <.L32>:
    *r = (uint8_t)((r1+m)*255.0f);
    f3fc:	000b0593          	mv	a1,s6
    f400:	00040513          	mv	a0,s0
    f404:	994f10ef          	jal	598 <__addsf3>

0000f408 <.LVL70>:
    f408:	00003597          	auipc	a1,0x3
    f40c:	e985a583          	lw	a1,-360(a1) # 122a0 <.LC3>
    f410:	8d9f10ef          	jal	ce8 <__mulsf3>

0000f414 <.LVL71>:
    f414:	890f20ef          	jal	14a4 <__fixunssfsi>

0000f418 <.LVL72>:
    f418:	00aa8023          	sb	a0,0(s5)
    *g = (uint8_t)((g1+m)*255.0f);
    f41c:	000b0593          	mv	a1,s6
    f420:	00048513          	mv	a0,s1
    f424:	974f10ef          	jal	598 <__addsf3>

0000f428 <.LVL73>:
    f428:	00003597          	auipc	a1,0x3
    f42c:	e785a583          	lw	a1,-392(a1) # 122a0 <.LC3>
    f430:	8b9f10ef          	jal	ce8 <__mulsf3>

0000f434 <.LVL74>:
    f434:	870f20ef          	jal	14a4 <__fixunssfsi>

0000f438 <.LVL75>:
    f438:	00aa0023          	sb	a0,0(s4)
    *b = (uint8_t)((b1+m)*255.0f);
    f43c:	000b0593          	mv	a1,s6
    f440:	00090513          	mv	a0,s2
    f444:	954f10ef          	jal	598 <__addsf3>

0000f448 <.LVL76>:
    f448:	00003597          	auipc	a1,0x3
    f44c:	e585a583          	lw	a1,-424(a1) # 122a0 <.LC3>
    f450:	899f10ef          	jal	ce8 <__mulsf3>

0000f454 <.LVL77>:
    f454:	850f20ef          	jal	14a4 <__fixunssfsi>

0000f458 <.LVL78>:
    f458:	00a98023          	sb	a0,0(s3)
}
    f45c:	02c12083          	lw	ra,44(sp)
    f460:	02812403          	lw	s0,40(sp)

0000f464 <.LVL79>:
    f464:	02412483          	lw	s1,36(sp)

0000f468 <.LVL80>:
    f468:	02012903          	lw	s2,32(sp)

0000f46c <.LVL81>:
    f46c:	01c12983          	lw	s3,28(sp)

0000f470 <.LVL82>:
    f470:	01812a03          	lw	s4,24(sp)

0000f474 <.LVL83>:
    f474:	01412a83          	lw	s5,20(sp)

0000f478 <.LVL84>:
    f478:	01012b03          	lw	s6,16(sp)

0000f47c <.LVL85>:
    f47c:	00c12b83          	lw	s7,12(sp)

0000f480 <.LVL86>:
    f480:	03010113          	add	sp,sp,48
    f484:	00008067          	ret

0000f488 <.L29>:
    int hi = (int)(h*6.0f) % 6;
    f488:	00040913          	mv	s2,s0

0000f48c <.LVL88>:
    f48c:	f6dff06f          	j	f3f8 <.L36>

0000f490 <.L27>:
    f490:	00040913          	mv	s2,s0

0000f494 <.LVL90>:
    f494:	00048413          	mv	s0,s1

0000f498 <.LVL91>:
    f498:	f3dff06f          	j	f3d4 <.L35>

0000f49c <sin_tab_init>:
}

/* Sin lookup table [-127,127], 256 entries for one full period */
static int8_t sin_tab[256];
static void sin_tab_init(void)
{
    f49c:	fe010113          	add	sp,sp,-32
    f4a0:	00812c23          	sw	s0,24(sp)
    f4a4:	00912a23          	sw	s1,20(sp)
    f4a8:	01312623          	sw	s3,12(sp)
    f4ac:	01412423          	sw	s4,8(sp)
    f4b0:	01512223          	sw	s5,4(sp)
    f4b4:	01612023          	sw	s6,0(sp)
    f4b8:	00112e23          	sw	ra,28(sp)
    f4bc:	01212823          	sw	s2,16(sp)

0000f4c0 <.LBB9>:
    for (int i = 0; i < 256; i++)
    f4c0:	00000413          	li	s0,0
        sin_tab[i] = (int8_t)(sinf(i * 2.0f * PI / 256.0f) * 127.0f);
    f4c4:	00003b17          	auipc	s6,0x3
    f4c8:	de0b2b03          	lw	s6,-544(s6) # 122a4 <.LC4>
    f4cc:	00003a97          	auipc	s5,0x3
    f4d0:	ddcaaa83          	lw	s5,-548(s5) # 122a8 <.LC5>
    f4d4:	00007a17          	auipc	s4,0x7
    f4d8:	cf4a0a13          	add	s4,s4,-780 # 161c8 <sin_tab>
    f4dc:	00003997          	auipc	s3,0x3
    f4e0:	dd09a983          	lw	s3,-560(s3) # 122ac <.LC6>
    for (int i = 0; i < 256; i++)
    f4e4:	10000493          	li	s1,256

0000f4e8 <.L38>:
        sin_tab[i] = (int8_t)(sinf(i * 2.0f * PI / 256.0f) * 127.0f);
    f4e8:	00040513          	mv	a0,s0
    f4ec:	820f20ef          	jal	150c <__floatsisf>

0000f4f0 <.LVL94>:
    f4f0:	00050593          	mv	a1,a0
    f4f4:	8a4f10ef          	jal	598 <__addsf3>

0000f4f8 <.LVL95>:
    f4f8:	000b0593          	mv	a1,s6
    f4fc:	fecf10ef          	jal	ce8 <__mulsf3>

0000f500 <.LVL96>:
    f500:	000a8593          	mv	a1,s5
    f504:	fe4f10ef          	jal	ce8 <__mulsf3>

0000f508 <.LVL97>:
    f508:	cd9f40ef          	jal	41e0 <__GI_sinf>

0000f50c <.LVL98>:
    f50c:	00098593          	mv	a1,s3
    f510:	fd8f10ef          	jal	ce8 <__mulsf3>

0000f514 <.LVL99>:
    f514:	01440933          	add	s2,s0,s4
    f518:	f1df10ef          	jal	1434 <__fixsfsi>

0000f51c <.LVL100>:
    f51c:	00a90023          	sb	a0,0(s2)
    for (int i = 0; i < 256; i++)
    f520:	00140413          	add	s0,s0,1
    f524:	fc9412e3          	bne	s0,s1,f4e8 <.L38>

0000f528 <.LBE9>:
}
    f528:	01c12083          	lw	ra,28(sp)
    f52c:	01812403          	lw	s0,24(sp)

0000f530 <.LVL102>:
    f530:	01412483          	lw	s1,20(sp)
    f534:	01012903          	lw	s2,16(sp)
    f538:	00c12983          	lw	s3,12(sp)
    f53c:	00812a03          	lw	s4,8(sp)
    f540:	00412a83          	lw	s5,4(sp)
    f544:	00012b03          	lw	s6,0(sp)
    f548:	02010113          	add	sp,sp,32
    f54c:	00008067          	ret

0000f550 <render_pattern>:
    "Sierpinski triangle", "Julia set", "Lissajous",
};

/* Render one pattern (1-10) into g_buf and push it to the framebuffer */
static void render_pattern(int pat, int fd, int size)
{
    f550:	f4010113          	add	sp,sp,-192

0000f554 <.LBB74>:
    int w=g_w, h=g_h, y1=h*7/12, y2=h*8/12;
    f554:	00007797          	auipc	a5,0x7
    f558:	d7878793          	add	a5,a5,-648 # 162cc <g_w>

0000f55c <.LBE74>:
{
    f55c:	09912a23          	sw	s9,148(sp)

0000f560 <.LBB84>:
    int w=g_w, h=g_h, y1=h*7/12, y2=h*8/12;
    f560:	0007ac83          	lw	s9,0(a5)
    f564:	00007797          	auipc	a5,0x7
    f568:	d6478793          	add	a5,a5,-668 # 162c8 <g_h>

0000f56c <.LBE84>:
{
    f56c:	09b12623          	sw	s11,140(sp)
    f570:	0a112e23          	sw	ra,188(sp)

0000f574 <.LBB85>:
    int w=g_w, h=g_h, y1=h*7/12, y2=h*8/12;
    f574:	0007ad83          	lw	s11,0(a5)

0000f578 <.LBE85>:
{
    f578:	0a812c23          	sw	s0,184(sp)
    f57c:	0a912a23          	sw	s1,180(sp)
    f580:	0b212823          	sw	s2,176(sp)
    f584:	0b312623          	sw	s3,172(sp)
    f588:	0b412423          	sw	s4,168(sp)
    f58c:	0b512223          	sw	s5,164(sp)
    f590:	0b612023          	sw	s6,160(sp)
    f594:	09712e23          	sw	s7,156(sp)
    f598:	09812c23          	sw	s8,152(sp)
    f59c:	09a12823          	sw	s10,144(sp)
    f5a0:	00a12c23          	sw	a0,24(sp)
    f5a4:	00b12023          	sw	a1,0(sp)
    f5a8:	00c12e23          	sw	a2,28(sp)
    switch (pat) {
    f5ac:	fff50793          	add	a5,a0,-1
    f5b0:	00900713          	li	a4,9
    f5b4:	14f76263          	bltu	a4,a5,f6f8 <.L42>
    f5b8:	00003717          	auipc	a4,0x3
    f5bc:	91470713          	add	a4,a4,-1772 # 11ecc <.L44>
    f5c0:	00279793          	sll	a5,a5,0x2
    f5c4:	00e787b3          	add	a5,a5,a4
    f5c8:	0007a783          	lw	a5,0(a5)
    f5cc:	00e787b3          	add	a5,a5,a4
    f5d0:	00078067          	jr	a5

0000f5d4 <.L53>:
    int w=g_w, h=g_h, y1=h*7/12, y2=h*8/12;
    f5d4:	00700a13          	li	s4,7
    f5d8:	034d8a33          	mul	s4,s11,s4
    f5dc:	00c00793          	li	a5,12
    f5e0:	003d9493          	sll	s1,s11,0x3
    f5e4:	00003417          	auipc	s0,0x3
    f5e8:	c0c40413          	add	s0,s0,-1012 # 121f0 <top.5>
    f5ec:	00003917          	auipc	s2,0x3
    f5f0:	bec90913          	add	s2,s2,-1044 # 121d8 <mid.4>
    f5f4:	00003b17          	auipc	s6,0x3
    f5f8:	c11b0b13          	add	s6,s6,-1007 # 12205 <top.5+0x15>
    f5fc:	00000993          	li	s3,0

0000f600 <.LBB76>:
        int x0 = w*i/7, x1 = w*(i+1)/7;
    f600:	00700a93          	li	s5,7

0000f604 <.LBE76>:
    int w=g_w, h=g_h, y1=h*7/12, y2=h*8/12;
    f604:	02fa4a33          	div	s4,s4,a5

0000f608 <.LVL105>:
    f608:	02f4c4b3          	div	s1,s1,a5

0000f60c <.L54>:
        fill_rect(x0, 0,  x1, y1, top[i][0], top[i][1], top[i][2]);
    f60c:	00244803          	lbu	a6,2(s0)
    f610:	00144783          	lbu	a5,1(s0)
    f614:	00044703          	lbu	a4,0(s0)
    f618:	000a0693          	mv	a3,s4
    f61c:	00000593          	li	a1,0

0000f620 <.LBE78>:
    for (int i = 0; i < 7; i++) {
    f620:	00340413          	add	s0,s0,3
    f624:	00390913          	add	s2,s2,3

0000f628 <.LBB79>:
        int x0 = w*i/7, x1 = w*(i+1)/7;
    f628:	0359c533          	div	a0,s3,s5

0000f62c <.LVL107>:
    f62c:	019989b3          	add	s3,s3,s9
    f630:	0359c633          	div	a2,s3,s5

0000f634 <.LVL108>:
        fill_rect(x0, 0,  x1, y1, top[i][0], top[i][1], top[i][2]);
    f634:	00a12223          	sw	a0,4(sp)
    f638:	00c12423          	sw	a2,8(sp)
    f63c:	af1ff0ef          	jal	f12c <fill_rect>

0000f640 <.LVL109>:
        fill_rect(x0, y1, x1, y2, mid[i][0], mid[i][1], mid[i][2]);
    f640:	fff94803          	lbu	a6,-1(s2)
    f644:	ffe94783          	lbu	a5,-2(s2)
    f648:	ffd94703          	lbu	a4,-3(s2)
    f64c:	00812603          	lw	a2,8(sp)
    f650:	00412503          	lw	a0,4(sp)
    f654:	00048693          	mv	a3,s1
    f658:	000a0593          	mv	a1,s4
    f65c:	ad1ff0ef          	jal	f12c <fill_rect>

0000f660 <.LBE79>:
    for (int i = 0; i < 7; i++) {
    f660:	fa8b16e3          	bne	s6,s0,f60c <.L54>

0000f664 <.LBE80>:
    int bw = w/4;
    f664:	00400413          	li	s0,4
    f668:	028cc433          	div	s0,s9,s0

0000f66c <.LVL111>:
    fill_rect(0,    y2, bw,   h,  0,  0,128);
    f66c:	08000813          	li	a6,128
    f670:	00000793          	li	a5,0
    f674:	00000713          	li	a4,0
    f678:	000d8693          	mv	a3,s11
    f67c:	00048593          	mv	a1,s1
    f680:	00000513          	li	a0,0
    f684:	00040613          	mv	a2,s0
    f688:	aa5ff0ef          	jal	f12c <fill_rect>

0000f68c <.LVL112>:
    fill_rect(bw,   y2, bw*2, h, 255,255,255);
    f68c:	00141913          	sll	s2,s0,0x1
    f690:	00040513          	mv	a0,s0
    f694:	0ff00813          	li	a6,255
    f698:	0ff00793          	li	a5,255
    f69c:	0ff00713          	li	a4,255
    f6a0:	000d8693          	mv	a3,s11
    f6a4:	00090613          	mv	a2,s2
    f6a8:	00048593          	mv	a1,s1
    f6ac:	a81ff0ef          	jal	f12c <fill_rect>

0000f6b0 <.LVL113>:
    fill_rect(bw*2, y2, bw*3, h,  75,  0,128);
    f6b0:	00300793          	li	a5,3
    f6b4:	02f40433          	mul	s0,s0,a5

0000f6b8 <.LVL114>:
    f6b8:	08000813          	li	a6,128
    f6bc:	00000793          	li	a5,0
    f6c0:	04b00713          	li	a4,75
    f6c4:	000d8693          	mv	a3,s11
    f6c8:	00048593          	mv	a1,s1
    f6cc:	00090513          	mv	a0,s2
    f6d0:	00040613          	mv	a2,s0
    f6d4:	a59ff0ef          	jal	f12c <fill_rect>

0000f6d8 <.LVL115>:
    fill_rect(bw*3, y2, w,    h,  0,  0,  0);
    f6d8:	00000813          	li	a6,0
    f6dc:	00000793          	li	a5,0
    f6e0:	00000713          	li	a4,0
    f6e4:	000d8693          	mv	a3,s11
    f6e8:	000c8613          	mv	a2,s9
    f6ec:	00048593          	mv	a1,s1
    f6f0:	00040513          	mv	a0,s0
    f6f4:	a39ff0ef          	jal	f12c <fill_rect>

0000f6f8 <.L42>:
    case  8: pat_sierpinski(); break;
    case  9: pat_julia();      break;
    case 10: pat_lissajous();  break;
    }

    printf("framebuff: %s rendered (%dx%d)\n", names[pat], g_w, g_h);
    f6f8:	01812783          	lw	a5,24(sp)
    f6fc:	00003717          	auipc	a4,0x3
    f700:	f8470713          	add	a4,a4,-124 # 12680 <names>
    f704:	00002517          	auipc	a0,0x2
    f708:	7a850513          	add	a0,a0,1960 # 11eac <.LC17>
    f70c:	00279793          	sll	a5,a5,0x2
    f710:	00f707b3          	add	a5,a4,a5
    f714:	00007717          	auipc	a4,0x7
    f718:	bb470713          	add	a4,a4,-1100 # 162c8 <g_h>
    f71c:	00072683          	lw	a3,0(a4)
    f720:	00007717          	auipc	a4,0x7
    f724:	bac70713          	add	a4,a4,-1108 # 162cc <g_w>
    f728:	00072603          	lw	a2,0(a4)
    f72c:	0007a583          	lw	a1,0(a5)
    f730:	93cf20ef          	jal	186c <__GI_printf>

0000f734 <.LVL117>:
    lseek(fd, 0, SEEK_SET);
    f734:	00012503          	lw	a0,0(sp)
    f738:	00000613          	li	a2,0
    f73c:	00000593          	li	a1,0
    f740:	fa5f10ef          	jal	16e4 <__GI_lseek>

0000f744 <.LVL118>:
    write(fd, g_buf, size);
}
    f744:	0b812403          	lw	s0,184(sp)
    write(fd, g_buf, size);
    f748:	01c12603          	lw	a2,28(sp)
    f74c:	00012503          	lw	a0,0(sp)
}
    f750:	0bc12083          	lw	ra,188(sp)
    f754:	0b412483          	lw	s1,180(sp)
    f758:	0b012903          	lw	s2,176(sp)
    f75c:	0ac12983          	lw	s3,172(sp)
    f760:	0a812a03          	lw	s4,168(sp)
    f764:	0a412a83          	lw	s5,164(sp)
    f768:	0a012b03          	lw	s6,160(sp)
    f76c:	09c12b83          	lw	s7,156(sp)
    f770:	09812c03          	lw	s8,152(sp)
    f774:	09412c83          	lw	s9,148(sp)
    f778:	09012d03          	lw	s10,144(sp)
    f77c:	08c12d83          	lw	s11,140(sp)
    write(fd, g_buf, size);
    f780:	00007597          	auipc	a1,0x7
    f784:	b505a583          	lw	a1,-1200(a1) # 162d0 <g_buf>
}
    f788:	0c010113          	add	sp,sp,192

0000f78c <.LVL119>:
    write(fd, g_buf, size);
    f78c:	858f206f          	j	17e4 <__GI_write>

0000f790 <.L55>:
            hsv2rgb((float)x/g_w, 1.0f, 1.0f - (float)y/g_h, &r,&g,&b);
    f790:	000b0513          	mv	a0,s6
    f794:	d79f10ef          	jal	150c <__floatsisf>

0000f798 <.LVL121>:
    f798:	00050493          	mv	s1,a0
    f79c:	000d8513          	mv	a0,s11
    f7a0:	d6df10ef          	jal	150c <__floatsisf>

0000f7a4 <.LVL122>:
    f7a4:	00050593          	mv	a1,a0
    f7a8:	00048513          	mv	a0,s1
    f7ac:	a0cf10ef          	jal	9b8 <__divsf3>

0000f7b0 <.LVL123>:
    f7b0:	00050593          	mv	a1,a0
    f7b4:	00090513          	mv	a0,s2
    f7b8:	84df10ef          	jal	1004 <__subsf3>

0000f7bc <.LVL124>:
    f7bc:	00a12223          	sw	a0,4(sp)
    f7c0:	00040513          	mv	a0,s0
    f7c4:	d49f10ef          	jal	150c <__floatsisf>

0000f7c8 <.LVL125>:
    f7c8:	00050493          	mv	s1,a0
    f7cc:	000c8513          	mv	a0,s9
    f7d0:	d3df10ef          	jal	150c <__floatsisf>

0000f7d4 <.LVL126>:
    f7d4:	00050593          	mv	a1,a0
    f7d8:	00048513          	mv	a0,s1
    f7dc:	9dcf10ef          	jal	9b8 <__divsf3>

0000f7e0 <.LVL127>:
    f7e0:	00412603          	lw	a2,4(sp)
    f7e4:	00098793          	mv	a5,s3
    f7e8:	000a0713          	mv	a4,s4
    f7ec:	000a8693          	mv	a3,s5
    f7f0:	00090593          	mv	a1,s2
    f7f4:	b05ff0ef          	jal	f2f8 <hsv2rgb>

0000f7f8 <.LVL128>:
            pset(x, y, r, g, b);
    f7f8:	06014703          	lbu	a4,96(sp)
    f7fc:	04014683          	lbu	a3,64(sp)
    f800:	03f14603          	lbu	a2,63(sp)
    f804:	00040513          	mv	a0,s0
    f808:	000b0593          	mv	a1,s6
    f80c:	8d9ff0ef          	jal	f0e4 <pset>

0000f810 <.LBE90>:
        for (int x = 0; x < g_w; x++) {
    f810:	00140413          	add	s0,s0,1

0000f814 <.L56>:
    f814:	f7944ee3          	blt	s0,s9,f790 <.L55>

0000f818 <.LBE89>:
    for (int y = 0; y < g_h; y++)
    f818:	001b0b13          	add	s6,s6,1

0000f81c <.L52>:
    f81c:	edbb5ee3          	bge	s6,s11,f6f8 <.L42>

0000f820 <.LBB92>:
        for (int x = 0; x < g_w; x++) {
    f820:	00000413          	li	s0,0
    f824:	ff1ff06f          	j	f814 <.L56>

0000f828 <.L101>:
    switch (pat) {
    f828:	00000b13          	li	s6,0

0000f82c <.LBB91>:
            hsv2rgb((float)x/g_w, 1.0f, 1.0f - (float)y/g_h, &r,&g,&b);
    f82c:	06010993          	add	s3,sp,96
    f830:	04010a13          	add	s4,sp,64
    f834:	03f10a93          	add	s5,sp,63
    f838:	00003917          	auipc	s2,0x3
    f83c:	a6492903          	lw	s2,-1436(s2) # 1229c <.LC2>
    f840:	fddff06f          	j	f81c <.L52>

0000f844 <.L63>:
        int32_t cim = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
    f844:	00812683          	lw	a3,8(sp)
    f848:	000d8613          	mv	a2,s11
    f84c:	00090513          	mv	a0,s2
    f850:	000a0593          	mv	a1,s4
    f854:	8cdf00ef          	jal	120 <__divdi3>

0000f858 <.LVL134>:
    f858:	fffff7b7          	lui	a5,0xfffff
    f85c:	c0078793          	add	a5,a5,-1024 # ffffec00 <_ebss+0xfffe88d0>
    f860:	00f50ab3          	add	s5,a0,a5

0000f864 <.LBB100>:
            int32_t cre = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
    f864:	ffffebb7          	lui	s7,0xffffe

0000f868 <.LBB102>:
                hsv2rgb((float)iter/MAXITER, 0.9f, 1.0f, &r,&g,&b);
    f868:	06010793          	add	a5,sp,96

0000f86c <.LBE101>:
        for (int px = 0; px < g_w; px++) {
    f86c:	00000993          	li	s3,0
    f870:	00000b13          	li	s6,0
    f874:	00000493          	li	s1,0

0000f878 <.LBB112>:
            int32_t cre = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
    f878:	800b8b93          	add	s7,s7,-2048 # ffffd800 <_ebss+0xfffe74d0>

0000f87c <.LBB103>:
                if (zr2+zi2 > ESCAPE) break;
    f87c:	00004c37          	lui	s8,0x4

0000f880 <.LBB104>:
                hsv2rgb((float)iter/MAXITER, 0.9f, 1.0f, &r,&g,&b);
    f880:	00f12223          	sw	a5,4(sp)

0000f884 <.L57>:
        for (int px = 0; px < g_w; px++) {
    f884:	0394c463          	blt	s1,s9,f8ac <.L62>

0000f888 <.LBE100>:
    for (int py = 0; py < g_h; py++) {
    f888:	000037b7          	lui	a5,0x3
    f88c:	80078793          	add	a5,a5,-2048 # 2800 <.L47+0x8>
    f890:	00f907b3          	add	a5,s2,a5
    f894:	0127b733          	sltu	a4,a5,s2
    f898:	00140413          	add	s0,s0,1
    f89c:	00078913          	mv	s2,a5
    f8a0:	01470a33          	add	s4,a4,s4

0000f8a4 <.L51>:
    f8a4:	fbb440e3          	blt	s0,s11,f844 <.L63>
    f8a8:	e51ff06f          	j	f6f8 <.L42>

0000f8ac <.L62>:
            int32_t cre = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
    f8ac:	00c12683          	lw	a3,12(sp)
    f8b0:	000c8613          	mv	a2,s9
    f8b4:	00098513          	mv	a0,s3
    f8b8:	000b0593          	mv	a1,s6
    f8bc:	865f00ef          	jal	120 <__divdi3>

0000f8c0 <.LVL140>:
    f8c0:	017505b3          	add	a1,a0,s7

0000f8c4 <.LBB105>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FP);
    f8c4:	00000613          	li	a2,0

0000f8c8 <.LBE105>:
            int iter=0;
    f8c8:	00000513          	li	a0,0

0000f8cc <.LBB106>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FP);
    f8cc:	00000793          	li	a5,0
    f8d0:	00000313          	li	t1,0
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FP);
    f8d4:	00000693          	li	a3,0
    f8d8:	00000893          	li	a7,0
    f8dc:	00000713          	li	a4,0

0000f8e0 <.LBE106>:
            while (iter < MAXITER) {
    f8e0:	05000813          	li	a6,80

0000f8e4 <.L58>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FP-1)) + cim;
    f8e4:	02f70733          	mul	a4,a4,a5
                int32_t tmp = zr2 - zi2 + cre;
    f8e8:	40c686b3          	sub	a3,a3,a2
                iter++;
    f8ec:	00150513          	add	a0,a0,1

0000f8f0 <.LVL143>:
                int32_t tmp = zr2 - zi2 + cre;
    f8f0:	00b686b3          	add	a3,a3,a1

0000f8f4 <.LVL144>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FP-1)) + cim;
    f8f4:	03130333          	mul	t1,t1,a7
    f8f8:	02f88633          	mul	a2,a7,a5
    f8fc:	00670733          	add	a4,a4,t1
    f900:	02f8b7b3          	mulhu	a5,a7,a5
    f904:	00f707b3          	add	a5,a4,a5
    f908:	01579793          	sll	a5,a5,0x15
    f90c:	00b65713          	srl	a4,a2,0xb
    f910:	00e7e733          	or	a4,a5,a4
    f914:	00ea87b3          	add	a5,s5,a4

0000f918 <.LBE107>:
            while (iter < MAXITER) {
    f918:	03051e63          	bne	a0,a6,f954 <.L60>
            if (iter == MAXITER) { pset(px,py, 0,0,0); }
    f91c:	00000713          	li	a4,0
    f920:	00000693          	li	a3,0

0000f924 <.LVL146>:
    f924:	00000613          	li	a2,0

0000f928 <.L116>:
                pset(px, py, r, g, b);
    f928:	00048513          	mv	a0,s1
    f92c:	00040593          	mv	a1,s0
    f930:	fb4ff0ef          	jal	f0e4 <pset>

0000f934 <.LBE108>:
        for (int px = 0; px < g_w; px++) {
    f934:	000047b7          	lui	a5,0x4
    f938:	80078793          	add	a5,a5,-2048 # 3800 <.L14+0x4>
    f93c:	00f987b3          	add	a5,s3,a5
    f940:	0137b733          	sltu	a4,a5,s3
    f944:	00148493          	add	s1,s1,1
    f948:	00078993          	mv	s3,a5
    f94c:	01670b33          	add	s6,a4,s6
    f950:	f35ff06f          	j	f884 <.L57>

0000f954 <.L60>:
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FP);
    f954:	02d68633          	mul	a2,a3,a3
    f958:	00068893          	mv	a7,a3
    f95c:	41f6d713          	sra	a4,a3,0x1f
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FP);
    f960:	41f7d313          	sra	t1,a5,0x1f
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FP);
    f964:	02d696b3          	mulh	a3,a3,a3

0000f968 <.LVL151>:
    f968:	00c65613          	srl	a2,a2,0xc
    f96c:	01469693          	sll	a3,a3,0x14
    f970:	00c6e6b3          	or	a3,a3,a2

0000f974 <.LVL152>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FP);
    f974:	02f78e33          	mul	t3,a5,a5
    f978:	02f79633          	mulh	a2,a5,a5

0000f97c <.LVL153>:
    f97c:	00ce5e13          	srl	t3,t3,0xc
    f980:	01461613          	sll	a2,a2,0x14
    f984:	01c66633          	or	a2,a2,t3

0000f988 <.LVL154>:
                if (zr2+zi2 > ESCAPE) break;
    f988:	00c68e33          	add	t3,a3,a2

0000f98c <.LVL155>:
    f98c:	f5cc5ce3          	bge	s8,t3,f8e4 <.L58>

0000f990 <.LBB110>:
                hsv2rgb((float)iter/MAXITER, 0.9f, 1.0f, &r,&g,&b);
    f990:	b7df10ef          	jal	150c <__floatsisf>

0000f994 <.LVL156>:
    f994:	000d0593          	mv	a1,s10
    f998:	820f10ef          	jal	9b8 <__divsf3>

0000f99c <.LVL157>:
    f99c:	00003617          	auipc	a2,0x3
    f9a0:	90060613          	add	a2,a2,-1792 # 1229c <.LC2>
    f9a4:	00003597          	auipc	a1,0x3
    f9a8:	91058593          	add	a1,a1,-1776 # 122b4 <.LC8>
    f9ac:	00062603          	lw	a2,0(a2)
    f9b0:	00412783          	lw	a5,4(sp)
    f9b4:	0005a583          	lw	a1,0(a1)
    f9b8:	04010713          	add	a4,sp,64
    f9bc:	03f10693          	add	a3,sp,63
    f9c0:	939ff0ef          	jal	f2f8 <hsv2rgb>

0000f9c4 <.LVL158>:
                pset(px, py, r, g, b);
    f9c4:	06014703          	lbu	a4,96(sp)
    f9c8:	04014683          	lbu	a3,64(sp)
    f9cc:	03f14603          	lbu	a2,63(sp)
    f9d0:	f59ff06f          	j	f928 <.L116>

0000f9d4 <.L102>:
        int32_t cim = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
    f9d4:	41fdd793          	sra	a5,s11,0x1f
    f9d8:	00f12423          	sw	a5,8(sp)

0000f9dc <.LBB115>:
            int32_t cre = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
    f9dc:	41fcd793          	sra	a5,s9,0x1f

0000f9e0 <.LBE115>:
    switch (pat) {
    f9e0:	00000913          	li	s2,0
    f9e4:	00000a13          	li	s4,0
    f9e8:	00000413          	li	s0,0

0000f9ec <.LBB116>:
            int32_t cre = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
    f9ec:	00f12623          	sw	a5,12(sp)

0000f9f0 <.LBB111>:
                hsv2rgb((float)iter/MAXITER, 0.9f, 1.0f, &r,&g,&b);
    f9f0:	00003d17          	auipc	s10,0x3
    f9f4:	8c8d2d03          	lw	s10,-1848(s10) # 122b8 <.LC9>
    f9f8:	eadff06f          	j	f8a4 <.L51>

0000f9fc <.L50>:
    sin_tab_init();
    f9fc:	aa1ff0ef          	jal	f49c <sin_tab_init>

0000fa00 <.LBB127>:
    for (int y = 0; y < g_h; y++)
    fa00:	00000a93          	li	s5,0

0000fa04 <.LBB128>:
            hsv2rgb((float)v / 762.0f, 1.0f, 1.0f, &r,&g,&bl);
    fa04:	06010493          	add	s1,sp,96
    fa08:	04010913          	add	s2,sp,64
    fa0c:	03f10993          	add	s3,sp,63
    fa10:	00003a17          	auipc	s4,0x3
    fa14:	8aca2a03          	lw	s4,-1876(s4) # 122bc <.LC10>

0000fa18 <.L65>:
    for (int y = 0; y < g_h; y++)
    fa18:	cfbad0e3          	bge	s5,s11,f6f8 <.L42>
    fa1c:	001a9b93          	sll	s7,s5,0x1
    fa20:	00300793          	li	a5,3
    fa24:	02fa8433          	mul	s0,s5,a5
    fa28:	080b8b93          	add	s7,s7,128

0000fa2c <.LBB131>:
        for (int x = 0; x < g_w; x++) {
    fa2c:	00000b13          	li	s6,0

0000fa30 <.LBB130>:
            int v = (int)sin_tab[a] + (int)sin_tab[b] + (int)sin_tab[c] + 381;
    fa30:	00006c17          	auipc	s8,0x6
    fa34:	798c0c13          	add	s8,s8,1944 # 161c8 <sin_tab>
            int a = (x*3 + y)     & 255;
    fa38:	00300d13          	li	s10,3
    fa3c:	08c0006f          	j	fac8 <.L67>

0000fa40 <.L66>:
    fa40:	03ab07b3          	mul	a5,s6,s10
    fa44:	015787b3          	add	a5,a5,s5
    fa48:	0ff7f793          	zext.b	a5,a5
            int v = (int)sin_tab[a] + (int)sin_tab[b] + (int)sin_tab[c] + 381;
    fa4c:	00fc07b3          	add	a5,s8,a5
    fa50:	00078503          	lb	a0,0(a5)
            int b = (x   + y*3)   & 255;
    fa54:	016407b3          	add	a5,s0,s6

0000fa58 <.LVL163>:
    fa58:	0ff7f793          	zext.b	a5,a5

0000fa5c <.LVL164>:
            int v = (int)sin_tab[a] + (int)sin_tab[b] + (int)sin_tab[c] + 381;
    fa5c:	00fc07b3          	add	a5,s8,a5
    fa60:	00078783          	lb	a5,0(a5)
    fa64:	00f50533          	add	a0,a0,a5
            int c = (x*2 + y*2+128) & 255;
    fa68:	0ffbf793          	zext.b	a5,s7

0000fa6c <.LVL165>:
            int v = (int)sin_tab[a] + (int)sin_tab[b] + (int)sin_tab[c] + 381;
    fa6c:	00fc07b3          	add	a5,s8,a5

0000fa70 <.LVL166>:
    fa70:	00078783          	lb	a5,0(a5)
    fa74:	002b8b93          	add	s7,s7,2

0000fa78 <.LVL167>:
    fa78:	00f50533          	add	a0,a0,a5
            hsv2rgb((float)v / 762.0f, 1.0f, 1.0f, &r,&g,&bl);
    fa7c:	17d50513          	add	a0,a0,381
    fa80:	a8df10ef          	jal	150c <__floatsisf>

0000fa84 <.LVL168>:
    fa84:	000a0593          	mv	a1,s4
    fa88:	f31f00ef          	jal	9b8 <__divsf3>

0000fa8c <.LVL169>:
    fa8c:	00003617          	auipc	a2,0x3
    fa90:	81060613          	add	a2,a2,-2032 # 1229c <.LC2>
    fa94:	00062603          	lw	a2,0(a2)
    fa98:	00048793          	mv	a5,s1
    fa9c:	00090713          	mv	a4,s2
    faa0:	00060593          	mv	a1,a2
    faa4:	00098693          	mv	a3,s3
    faa8:	851ff0ef          	jal	f2f8 <hsv2rgb>

0000faac <.LVL170>:
            pset(x, y, r, g, bl);
    faac:	06014703          	lbu	a4,96(sp)
    fab0:	04014683          	lbu	a3,64(sp)
    fab4:	03f14603          	lbu	a2,63(sp)
    fab8:	000b0513          	mv	a0,s6
    fabc:	000a8593          	mv	a1,s5
    fac0:	e24ff0ef          	jal	f0e4 <pset>

0000fac4 <.LBE130>:
        for (int x = 0; x < g_w; x++) {
    fac4:	001b0b13          	add	s6,s6,1

0000fac8 <.L67>:
    fac8:	f79b4ce3          	blt	s6,s9,fa40 <.L66>

0000facc <.LBE131>:
    for (int y = 0; y < g_h; y++)
    facc:	001a8a93          	add	s5,s5,1
    fad0:	f49ff06f          	j	fa18 <.L65>

0000fad4 <.L103>:
    switch (pat) {
    fad4:	06400a13          	li	s4,100
    fad8:	00002417          	auipc	s0,0x2
    fadc:	7d842403          	lw	s0,2008(s0) # 122b0 <.LC7>
    fae0:	00000493          	li	s1,0

0000fae4 <.LBB132>:
        px[i] = (int)(x1*proj) + g_w/2;
    fae4:	04010d13          	add	s10,sp,64
        py[i] = (int)(y2*proj) + g_h/2;
    fae8:	06010c93          	add	s9,sp,96
    faec:	00002d97          	auipc	s11,0x2
    faf0:	62cd8d93          	add	s11,s11,1580 # 12118 <edges.2>

0000faf4 <.L49>:
    clear();
    faf4:	ec0ff0ef          	jal	f1b4 <clear>

0000faf8 <.LVL176>:
    float cy = cosf(ay), sy = sinf(ay);
    faf8:	00048513          	mv	a0,s1
    fafc:	ec4f40ef          	jal	41c0 <__GI_cosf>

0000fb00 <.LVL177>:
    fb00:	00a12223          	sw	a0,4(sp)

0000fb04 <.LVL178>:
    fb04:	00048513          	mv	a0,s1

0000fb08 <.LVL179>:
    fb08:	ed8f40ef          	jal	41e0 <__GI_sinf>

0000fb0c <.LVL180>:
    fb0c:	00a12423          	sw	a0,8(sp)

0000fb10 <.LVL181>:
    float cx = cosf(ax), sx = sinf(ax);
    fb10:	00040513          	mv	a0,s0

0000fb14 <.LVL182>:
    fb14:	eacf40ef          	jal	41c0 <__GI_cosf>

0000fb18 <.LVL183>:
    fb18:	00a12623          	sw	a0,12(sp)

0000fb1c <.LVL184>:
    fb1c:	00040513          	mv	a0,s0

0000fb20 <.LVL185>:
    fb20:	ec0f40ef          	jal	41e0 <__GI_sinf>

0000fb24 <.LBB138>:
        px[i] = (int)(x1*proj) + g_w/2;
    fb24:	00006797          	auipc	a5,0x6
    fb28:	7a878793          	add	a5,a5,1960 # 162cc <g_w>
        py[i] = (int)(y2*proj) + g_h/2;
    fb2c:	00006717          	auipc	a4,0x6
    fb30:	79c70713          	add	a4,a4,1948 # 162c8 <g_h>
        px[i] = (int)(x1*proj) + g_w/2;
    fb34:	0007aa83          	lw	s5,0(a5)
        py[i] = (int)(y2*proj) + g_h/2;
    fb38:	00072683          	lw	a3,0(a4)
        px[i] = (int)(x1*proj) + g_w/2;
    fb3c:	00200793          	li	a5,2
    fb40:	02facab3          	div	s5,s5,a5

0000fb44 <.LBE138>:
    float cx = cosf(ax), sx = sinf(ax);
    fb44:	00a12823          	sw	a0,16(sp)

0000fb48 <.LBB144>:
    for (int i = 0; i < 8; i++) {
    fb48:	00002717          	auipc	a4,0x2
    fb4c:	63070713          	add	a4,a4,1584 # 12178 <vraw.3>

0000fb50 <.LBB139>:
        py[i] = (int)(y2*proj) + g_h/2;
    fb50:	00000b93          	li	s7,0

0000fb54 <.LBE139>:
    for (int i = 0; i < 8; i++) {
    fb54:	02000993          	li	s3,32

0000fb58 <.LBB140>:
        py[i] = (int)(y2*proj) + g_h/2;
    fb58:	02f6c6b3          	div	a3,a3,a5

0000fb5c <.L68>:
        float x = vraw[i][0], y = vraw[i][1], z = vraw[i][2];
    fb5c:	00072b03          	lw	s6,0(a4)
    fb60:	00472783          	lw	a5,4(a4)
        float z1 =  x*sy + z*cy;
    fb64:	00812503          	lw	a0,8(sp)
    fb68:	000b0593          	mv	a1,s6
        float x = vraw[i][0], y = vraw[i][1], z = vraw[i][2];
    fb6c:	00872c03          	lw	s8,8(a4)
    fb70:	02d12623          	sw	a3,44(sp)

0000fb74 <.LVL189>:
    fb74:	02e12423          	sw	a4,40(sp)
    fb78:	00f12a23          	sw	a5,20(sp)

0000fb7c <.LVL190>:
        float z1 =  x*sy + z*cy;
    fb7c:	96cf10ef          	jal	ce8 <__mulsf3>

0000fb80 <.LVL191>:
    fb80:	00050913          	mv	s2,a0
    fb84:	00412503          	lw	a0,4(sp)
    fb88:	000c0593          	mv	a1,s8
    fb8c:	95cf10ef          	jal	ce8 <__mulsf3>

0000fb90 <.LVL192>:
    fb90:	00050593          	mv	a1,a0
    fb94:	00090513          	mv	a0,s2
    fb98:	a01f00ef          	jal	598 <__addsf3>

0000fb9c <.LVL193>:
        float z2 =  y*sx + z1*cx;
    fb9c:	01412583          	lw	a1,20(sp)
        float z1 =  x*sy + z*cy;
    fba0:	02a12023          	sw	a0,32(sp)

0000fba4 <.LVL194>:
        float z2 =  y*sx + z1*cx;
    fba4:	01012503          	lw	a0,16(sp)

0000fba8 <.LVL195>:
    fba8:	940f10ef          	jal	ce8 <__mulsf3>

0000fbac <.LVL196>:
    fbac:	02012583          	lw	a1,32(sp)
    fbb0:	00050913          	mv	s2,a0
    fbb4:	00c12503          	lw	a0,12(sp)
    fbb8:	930f10ef          	jal	ce8 <__mulsf3>

0000fbbc <.LVL197>:
    fbbc:	00050593          	mv	a1,a0
    fbc0:	00090513          	mv	a0,s2
    fbc4:	9d5f00ef          	jal	598 <__addsf3>

0000fbc8 <.LVL198>:
        float proj = fov / (dist + z2);
    fbc8:	00002797          	auipc	a5,0x2
    fbcc:	6f878793          	add	a5,a5,1784 # 122c0 <.LC11>
    fbd0:	0007a583          	lw	a1,0(a5)
        px[i] = (int)(x1*proj) + g_w/2;
    fbd4:	017d0933          	add	s2,s10,s7
        float proj = fov / (dist + z2);
    fbd8:	9c1f00ef          	jal	598 <__addsf3>

0000fbdc <.LVL199>:
    fbdc:	00002797          	auipc	a5,0x2
    fbe0:	6e878793          	add	a5,a5,1768 # 122c4 <.LC12>
    fbe4:	00050593          	mv	a1,a0
    fbe8:	0007a503          	lw	a0,0(a5)
    fbec:	dcdf00ef          	jal	9b8 <__divsf3>

0000fbf0 <.LVL200>:
    fbf0:	02a12223          	sw	a0,36(sp)

0000fbf4 <.LVL201>:
        float x1 =  x*cy - z*sy;
    fbf4:	00412503          	lw	a0,4(sp)

0000fbf8 <.LVL202>:
    fbf8:	000b0593          	mv	a1,s6
    fbfc:	8ecf10ef          	jal	ce8 <__mulsf3>

0000fc00 <.LVL203>:
    fc00:	00050b13          	mv	s6,a0

0000fc04 <.LVL204>:
    fc04:	00812503          	lw	a0,8(sp)
    fc08:	000c0593          	mv	a1,s8
        py[i] = (int)(y2*proj) + g_h/2;
    fc0c:	017c8c33          	add	s8,s9,s7

0000fc10 <.LVL205>:
        float x1 =  x*cy - z*sy;
    fc10:	8d8f10ef          	jal	ce8 <__mulsf3>

0000fc14 <.LVL206>:
    fc14:	00050593          	mv	a1,a0
    fc18:	000b0513          	mv	a0,s6
    fc1c:	be8f10ef          	jal	1004 <__subsf3>

0000fc20 <.LVL207>:
        px[i] = (int)(x1*proj) + g_w/2;
    fc20:	02412583          	lw	a1,36(sp)

0000fc24 <.LBE140>:
    for (int i = 0; i < 8; i++) {
    fc24:	004b8b93          	add	s7,s7,4

0000fc28 <.LBB141>:
        px[i] = (int)(x1*proj) + g_w/2;
    fc28:	8c0f10ef          	jal	ce8 <__mulsf3>

0000fc2c <.LVL208>:
    fc2c:	809f10ef          	jal	1434 <__fixsfsi>

0000fc30 <.LVL209>:
    fc30:	01550533          	add	a0,a0,s5
        float y2 =  y*cx - z1*sx;
    fc34:	01412583          	lw	a1,20(sp)
        px[i] = (int)(x1*proj) + g_w/2;
    fc38:	00a92023          	sw	a0,0(s2)
        float y2 =  y*cx - z1*sx;
    fc3c:	00c12503          	lw	a0,12(sp)
    fc40:	8a8f10ef          	jal	ce8 <__mulsf3>

0000fc44 <.LVL210>:
    fc44:	02012583          	lw	a1,32(sp)
    fc48:	00050b13          	mv	s6,a0
    fc4c:	01012503          	lw	a0,16(sp)
    fc50:	898f10ef          	jal	ce8 <__mulsf3>

0000fc54 <.LVL211>:
    fc54:	00050593          	mv	a1,a0
    fc58:	000b0513          	mv	a0,s6
    fc5c:	ba8f10ef          	jal	1004 <__subsf3>

0000fc60 <.LVL212>:
        py[i] = (int)(y2*proj) + g_h/2;
    fc60:	02412583          	lw	a1,36(sp)
    fc64:	884f10ef          	jal	ce8 <__mulsf3>

0000fc68 <.LVL213>:
    fc68:	fccf10ef          	jal	1434 <__fixsfsi>

0000fc6c <.LVL214>:
    fc6c:	02c12683          	lw	a3,44(sp)

0000fc70 <.LBE141>:
    for (int i = 0; i < 8; i++) {
    fc70:	02812703          	lw	a4,40(sp)

0000fc74 <.LBB142>:
        py[i] = (int)(y2*proj) + g_h/2;
    fc74:	00d50533          	add	a0,a0,a3
    fc78:	00ac2023          	sw	a0,0(s8)

0000fc7c <.LBE142>:
    for (int i = 0; i < 8; i++) {
    fc7c:	00c70713          	add	a4,a4,12
    fc80:	ed3b9ee3          	bne	s7,s3,fb5c <.L68>
    fc84:	00002c17          	auipc	s8,0x2
    fc88:	494c0c13          	add	s8,s8,1172 # 12118 <edges.2>
    fc8c:	00002a97          	auipc	s5,0x2
    fc90:	468a8a93          	add	s5,s5,1128 # 120f4 <ecol.1>

0000fc94 <.L69>:
        int a = edges[i][0], b = edges[i][1];
    fc94:	000c2703          	lw	a4,0(s8)

0000fc98 <.LVL216>:
    fc98:	004c2783          	lw	a5,4(s8)

0000fc9c <.LVL217>:
        draw_line(px[a],   py[a],   px[b],   py[b],   ecol[i][0],ecol[i][1],ecol[i][2]);
    fc9c:	03010693          	add	a3,sp,48
    fca0:	00271713          	sll	a4,a4,0x2

0000fca4 <.LVL218>:
    fca4:	00279793          	sll	a5,a5,0x2

0000fca8 <.LVL219>:
    fca8:	05070713          	add	a4,a4,80
    fcac:	05078793          	add	a5,a5,80
    fcb0:	00d70733          	add	a4,a4,a3
    fcb4:	00d787b3          	add	a5,a5,a3
    fcb8:	fc072903          	lw	s2,-64(a4)
    fcbc:	fe072b83          	lw	s7,-32(a4)
    fcc0:	fc07a983          	lw	s3,-64(a5)
    fcc4:	fe07ab03          	lw	s6,-32(a5)
    fcc8:	000ac703          	lbu	a4,0(s5)
    fccc:	001ac783          	lbu	a5,1(s5)
    fcd0:	002ac803          	lbu	a6,2(s5)
    fcd4:	000b0693          	mv	a3,s6
    fcd8:	00098613          	mv	a2,s3
    fcdc:	000b8593          	mv	a1,s7
    fce0:	00090513          	mv	a0,s2
    fce4:	01012623          	sw	a6,12(sp)
    fce8:	00f12423          	sw	a5,8(sp)
    fcec:	00e12223          	sw	a4,4(sp)
    fcf0:	cecff0ef          	jal	f1dc <draw_line>

0000fcf4 <.LVL220>:
        draw_line(px[a]+1, py[a],   px[b]+1, py[b],   ecol[i][0],ecol[i][1],ecol[i][2]);
    fcf4:	00c12803          	lw	a6,12(sp)
    fcf8:	00812783          	lw	a5,8(sp)
    fcfc:	00412703          	lw	a4,4(sp)
    fd00:	000b0693          	mv	a3,s6
    fd04:	00198613          	add	a2,s3,1
    fd08:	000b8593          	mv	a1,s7
    fd0c:	00190513          	add	a0,s2,1
    fd10:	cccff0ef          	jal	f1dc <draw_line>

0000fd14 <.LVL221>:
        draw_line(px[a],   py[a]+1, px[b],   py[b]+1, ecol[i][0],ecol[i][1],ecol[i][2]);
    fd14:	00c12803          	lw	a6,12(sp)
    fd18:	00812783          	lw	a5,8(sp)
    fd1c:	00412703          	lw	a4,4(sp)
    fd20:	001b0693          	add	a3,s6,1
    fd24:	00098613          	mv	a2,s3
    fd28:	001b8593          	add	a1,s7,1
    fd2c:	00090513          	mv	a0,s2

0000fd30 <.LBE146>:
    for (int i = 0; i < 12; i++) {
    fd30:	003a8a93          	add	s5,s5,3

0000fd34 <.LBB147>:
        draw_line(px[a],   py[a]+1, px[b],   py[b]+1, ecol[i][0],ecol[i][1],ecol[i][2]);
    fd34:	ca8ff0ef          	jal	f1dc <draw_line>

0000fd38 <.LBE147>:
    for (int i = 0; i < 12; i++) {
    fd38:	008c0c13          	add	s8,s8,8
    fd3c:	f55d9ce3          	bne	s11,s5,fc94 <.L69>

0000fd40 <.LBE145>:
        lseek(fd, 0, SEEK_SET);
    fd40:	00012503          	lw	a0,0(sp)
    fd44:	00000613          	li	a2,0
    fd48:	00000593          	li	a1,0
    fd4c:	999f10ef          	jal	16e4 <__GI_lseek>

0000fd50 <.LVL224>:
        write(fd, g_buf, size);
    fd50:	00006797          	auipc	a5,0x6
    fd54:	58078793          	add	a5,a5,1408 # 162d0 <g_buf>
    fd58:	01c12603          	lw	a2,28(sp)
    fd5c:	0007a583          	lw	a1,0(a5)
    fd60:	00012503          	lw	a0,0(sp)
    for (frame = 0; frame < 100; frame++) {
    fd64:	fffa0a13          	add	s4,s4,-1

0000fd68 <.LVL225>:
        write(fd, g_buf, size);
    fd68:	a7df10ef          	jal	17e4 <__GI_write>

0000fd6c <.LVL226>:
        ay += 0.04f;
    fd6c:	00002797          	auipc	a5,0x2
    fd70:	55c78793          	add	a5,a5,1372 # 122c8 <.LC13>
    fd74:	0007a583          	lw	a1,0(a5)
    fd78:	00048513          	mv	a0,s1
    fd7c:	81df00ef          	jal	598 <__addsf3>

0000fd80 <.LVL227>:
        ax += 0.013f;
    fd80:	00002797          	auipc	a5,0x2
    fd84:	54c78793          	add	a5,a5,1356 # 122cc <.LC14>
    fd88:	0007a583          	lw	a1,0(a5)
        ay += 0.04f;
    fd8c:	00050493          	mv	s1,a0
        ax += 0.013f;
    fd90:	00040513          	mv	a0,s0
    fd94:	805f00ef          	jal	598 <__addsf3>

0000fd98 <.LVL229>:
    fd98:	00050413          	mv	s0,a0

0000fd9c <.LVL230>:
    for (frame = 0; frame < 100; frame++) {
    fd9c:	d40a1ce3          	bnez	s4,faf4 <.L49>
    fda0:	959ff06f          	j	f6f8 <.L42>

0000fda4 <.L48>:
    int cx = g_w/2, cy = g_h/2;
    fda4:	00200c13          	li	s8,2
    fda8:	038ccd33          	div	s10,s9,s8

0000fdac <.LBB152>:
    for (int y = 0; y < g_h; y++)
    fdac:	00000b13          	li	s6,0

0000fdb0 <.LBB153>:
            hsv2rgb((float)(dist % 48) / 48.0f, 1.0f, 1.0f, &r,&g,&b);
    fdb0:	06010493          	add	s1,sp,96
    fdb4:	04010913          	add	s2,sp,64
    fdb8:	03f10993          	add	s3,sp,63
    fdbc:	00002a17          	auipc	s4,0x2
    fdc0:	514a2a03          	lw	s4,1300(s4) # 122d0 <.LC15>

0000fdc4 <.LBE152>:
    int cx = g_w/2, cy = g_h/2;
    fdc4:	038dcc33          	div	s8,s11,s8

0000fdc8 <.L70>:
    for (int y = 0; y < g_h; y++)
    fdc8:	93bb58e3          	bge	s6,s11,f6f8 <.L42>

0000fdcc <.LBB163>:
            int dx = x-cx, dy = y-cy;
    fdcc:	418b0bb3          	sub	s7,s6,s8

0000fdd0 <.LBE163>:
        for (int x = 0; x < g_w; x++) {
    fdd0:	00000a93          	li	s5,0

0000fdd4 <.LBB155>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    fdd4:	00200413          	li	s0,2

0000fdd8 <.LBE155>:
            int dist = isqrt(dx*dx + dy*dy);
    fdd8:	037b8bb3          	mul	s7,s7,s7
    fddc:	0780006f          	j	fe54 <.L75>

0000fde0 <.L74>:
            int dx = x-cx, dy = y-cy;
    fde0:	41aa87b3          	sub	a5,s5,s10

0000fde4 <.LVL235>:
            int dist = isqrt(dx*dx + dy*dy);
    fde4:	02f787b3          	mul	a5,a5,a5

0000fde8 <.LBB160>:
    if (n <= 0) return 0;
    fde8:	00000693          	li	a3,0

0000fdec <.LBE160>:
            int dist = isqrt(dx*dx + dy*dy);
    fdec:	017787b3          	add	a5,a5,s7

0000fdf0 <.LBB161>:
    if (n <= 0) return 0;
    fdf0:	00078a63          	beqz	a5,fe04 <.L71>

0000fdf4 <.LVL238>:
    int x = n, y = (x+1)/2;
    fdf4:	00178713          	add	a4,a5,1
    fdf8:	40175713          	sra	a4,a4,0x1

0000fdfc <.LVL239>:
    fdfc:	00078693          	mv	a3,a5

0000fe00 <.L72>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    fe00:	06d74063          	blt	a4,a3,fe60 <.L73>

0000fe04 <.L71>:
            hsv2rgb((float)(dist % 48) / 48.0f, 1.0f, 1.0f, &r,&g,&b);
    fe04:	03000513          	li	a0,48
    fe08:	02a6e533          	rem	a0,a3,a0
    fe0c:	f00f10ef          	jal	150c <__floatsisf>

0000fe10 <.LVL242>:
    fe10:	000a0593          	mv	a1,s4
    fe14:	ba5f00ef          	jal	9b8 <__divsf3>

0000fe18 <.LVL243>:
    fe18:	00002617          	auipc	a2,0x2
    fe1c:	48460613          	add	a2,a2,1156 # 1229c <.LC2>
    fe20:	00062603          	lw	a2,0(a2)
    fe24:	00048793          	mv	a5,s1
    fe28:	00090713          	mv	a4,s2
    fe2c:	00060593          	mv	a1,a2
    fe30:	00098693          	mv	a3,s3
    fe34:	cc4ff0ef          	jal	f2f8 <hsv2rgb>

0000fe38 <.LVL244>:
            pset(x, y, r, g, b);
    fe38:	06014703          	lbu	a4,96(sp)
    fe3c:	04014683          	lbu	a3,64(sp)
    fe40:	03f14603          	lbu	a2,63(sp)
    fe44:	000a8513          	mv	a0,s5
    fe48:	000b0593          	mv	a1,s6
    fe4c:	a98ff0ef          	jal	f0e4 <pset>

0000fe50 <.LBE164>:
        for (int x = 0; x < g_w; x++) {
    fe50:	001a8a93          	add	s5,s5,1

0000fe54 <.L75>:
    fe54:	f99ac6e3          	blt	s5,s9,fde0 <.L74>

0000fe58 <.LBE166>:
    for (int y = 0; y < g_h; y++)
    fe58:	001b0b13          	add	s6,s6,1
    fe5c:	f6dff06f          	j	fdc8 <.L70>

0000fe60 <.L73>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    fe60:	02e7c633          	div	a2,a5,a4
    fe64:	00070693          	mv	a3,a4
    fe68:	00e60633          	add	a2,a2,a4

0000fe6c <.LVL249>:
    fe6c:	02864733          	div	a4,a2,s0

0000fe70 <.LVL250>:
    fe70:	f91ff06f          	j	fe00 <.L72>

0000fe74 <.L47>:
    int cx = g_w/2, cy = g_h/2;
    fe74:	00200813          	li	a6,2
    fe78:	030ccbb3          	div	s7,s9,a6

0000fe7c <.LVL252>:
    fe7c:	030dcc33          	div	s8,s11,a6

0000fe80 <.LVL253>:
    int maxr = (cx < cy ? cx : cy);
    fe80:	000b8493          	mv	s1,s7
    fe84:	017c5463          	bge	s8,s7,fe8c <.L76>
    fe88:	000c0493          	mv	s1,s8

0000fe8c <.L76>:
            hsv2rgb(hue, sat, 1.0f, &rv,&gv,&bv);
    fe8c:	06010793          	add	a5,sp,96
    fe90:	00f12623          	sw	a5,12(sp)
    fe94:	04010793          	add	a5,sp,64
    fe98:	41800a33          	neg	s4,s8
    fe9c:	00f12823          	sw	a5,16(sp)
            float hue = (atan2f((float)dy, (float)dx) + PI) / (2.0f*PI);
    fea0:	00002d17          	auipc	s10,0x2
    fea4:	404d2d03          	lw	s10,1028(s10) # 122a4 <.LC4>

0000fea8 <.L77>:
    fea8:	014c0933          	add	s2,s8,s4

0000feac <.LBE172>:
    for (int y = 0; y < g_h; y++)
    feac:	85b956e3          	bge	s2,s11,f6f8 <.L42>

0000feb0 <.LBB182>:
            hsv2rgb(hue, sat, 1.0f, &rv,&gv,&bv);
    feb0:	03f10793          	add	a5,sp,63
            int r = isqrt(dx*dx + dy*dy);
    feb4:	034a0b33          	mul	s6,s4,s4

0000feb8 <.LBE182>:
        for (int x = 0; x < g_w; x++) {
    feb8:	00000413          	li	s0,0

0000febc <.LBB174>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    febc:	00200a93          	li	s5,2

0000fec0 <.LBE174>:
            hsv2rgb(hue, sat, 1.0f, &rv,&gv,&bv);
    fec0:	00f12423          	sw	a5,8(sp)
    fec4:	0480006f          	j	ff0c <.L84>

0000fec8 <.L83>:
            int dx = x-cx, dy = y-cy;
    fec8:	41740533          	sub	a0,s0,s7

0000fecc <.LVL258>:
            int r = isqrt(dx*dx + dy*dy);
    fecc:	02a50733          	mul	a4,a0,a0

0000fed0 <.LBB179>:
    if (n <= 0) return 0;
    fed0:	00000993          	li	s3,0

0000fed4 <.LBE179>:
            int r = isqrt(dx*dx + dy*dy);
    fed4:	01670733          	add	a4,a4,s6

0000fed8 <.LBB180>:
    if (n <= 0) return 0;
    fed8:	00070a63          	beqz	a4,feec <.L78>

0000fedc <.LVL260>:
    int x = n, y = (x+1)/2;
    fedc:	00170793          	add	a5,a4,1
    fee0:	4017d793          	sra	a5,a5,0x1

0000fee4 <.LVL261>:
    fee4:	00070993          	mv	s3,a4

0000fee8 <.L79>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    fee8:	0337c863          	blt	a5,s3,ff18 <.L80>

0000feec <.L78>:
            if (r > maxr) { pset(x,y, 0,0,0); continue; }
    feec:	0534d063          	bge	s1,s3,ff2c <.L81>
    fef0:	00000713          	li	a4,0
    fef4:	00000693          	li	a3,0
    fef8:	00000613          	li	a2,0

0000fefc <.L117>:
            pset(x, y, rv, gv, bv);
    fefc:	00040513          	mv	a0,s0
    ff00:	00090593          	mv	a1,s2
    ff04:	9e0ff0ef          	jal	f0e4 <pset>

0000ff08 <.LBE183>:
        for (int x = 0; x < g_w; x++) {
    ff08:	00140413          	add	s0,s0,1

0000ff0c <.L84>:
    ff0c:	fb944ee3          	blt	s0,s9,fec8 <.L83>

0000ff10 <.LBE185>:
    for (int y = 0; y < g_h; y++)
    ff10:	001a0a13          	add	s4,s4,1

0000ff14 <.LVL268>:
    ff14:	f95ff06f          	j	fea8 <.L77>

0000ff18 <.L80>:
    while (y < x) { x = y; y = (x + n/x) / 2; }
    ff18:	02f746b3          	div	a3,a4,a5
    ff1c:	00078993          	mv	s3,a5
    ff20:	00f686b3          	add	a3,a3,a5

0000ff24 <.LVL270>:
    ff24:	0356c7b3          	div	a5,a3,s5

0000ff28 <.LVL271>:
    ff28:	fc1ff06f          	j	fee8 <.L79>

0000ff2c <.L81>:
            float hue = (atan2f((float)dy, (float)dx) + PI) / (2.0f*PI);
    ff2c:	de0f10ef          	jal	150c <__floatsisf>

0000ff30 <.LVL273>:
    ff30:	00a12223          	sw	a0,4(sp)
    ff34:	000a0513          	mv	a0,s4
    ff38:	dd4f10ef          	jal	150c <__floatsisf>

0000ff3c <.LVL274>:
    ff3c:	00412583          	lw	a1,4(sp)
    ff40:	9d0f40ef          	jal	4110 <atan2f>

0000ff44 <.LVL275>:
    ff44:	00a12223          	sw	a0,4(sp)

0000ff48 <.LVL276>:
            float sat = (float)r / maxr;
    ff48:	00098513          	mv	a0,s3

0000ff4c <.LVL277>:
    ff4c:	dc0f10ef          	jal	150c <__floatsisf>

0000ff50 <.LVL278>:
    ff50:	00050993          	mv	s3,a0

0000ff54 <.LVL279>:
    ff54:	00048513          	mv	a0,s1
    ff58:	db4f10ef          	jal	150c <__floatsisf>

0000ff5c <.LVL280>:
    ff5c:	00050593          	mv	a1,a0
    ff60:	00098513          	mv	a0,s3
    ff64:	a55f00ef          	jal	9b8 <__divsf3>

0000ff68 <.LVL281>:
    ff68:	00050993          	mv	s3,a0
            float hue = (atan2f((float)dy, (float)dx) + PI) / (2.0f*PI);
    ff6c:	00412503          	lw	a0,4(sp)
    ff70:	000d0593          	mv	a1,s10
    ff74:	e24f00ef          	jal	598 <__addsf3>

0000ff78 <.LVL282>:
    ff78:	00002797          	auipc	a5,0x2
    ff7c:	35c78793          	add	a5,a5,860 # 122d4 <.LC16>
    ff80:	0007a583          	lw	a1,0(a5)
    ff84:	a35f00ef          	jal	9b8 <__divsf3>

0000ff88 <.LVL283>:
            hsv2rgb(hue, sat, 1.0f, &rv,&gv,&bv);
    ff88:	00002617          	auipc	a2,0x2
    ff8c:	31460613          	add	a2,a2,788 # 1229c <.LC2>
    ff90:	01012703          	lw	a4,16(sp)
    ff94:	00812683          	lw	a3,8(sp)
    ff98:	00062603          	lw	a2,0(a2)
    ff9c:	00c12783          	lw	a5,12(sp)
    ffa0:	00098593          	mv	a1,s3
    ffa4:	b54ff0ef          	jal	f2f8 <hsv2rgb>

0000ffa8 <.LVL284>:
            pset(x, y, rv, gv, bv);
    ffa8:	06014703          	lbu	a4,96(sp)
    ffac:	04014683          	lbu	a3,64(sp)
    ffb0:	03f14603          	lbu	a2,63(sp)
    ffb4:	f49ff06f          	j	fefc <.L117>

0000ffb8 <.L85>:
    while (sz < g_h) sz <<= 1;
    ffb8:	00141413          	sll	s0,s0,0x1

0000ffbc <.L46>:
    ffbc:	ffb44ee3          	blt	s0,s11,ffb8 <.L85>

0000ffc0 <.LBB189>:
            int col = (int)((int64_t)x * sz / g_w);
    ffc0:	41fcd793          	sra	a5,s9,0x1f
    ffc4:	00f12423          	sw	a5,8(sp)

0000ffc8 <.LBB193>:
                hsv2rgb((float)(row ^ col) / (float)sz, 1.0f, 1.0f, &r,&g,&b);
    ffc8:	04010793          	add	a5,sp,64

0000ffcc <.LBE190>:
    for (int y = 0; y < g_h; y++) {
    ffcc:	00000493          	li	s1,0

0000ffd0 <.LBB194>:
                hsv2rgb((float)(row ^ col) / (float)sz, 1.0f, 1.0f, &r,&g,&b);
    ffd0:	06010c13          	add	s8,sp,96
    ffd4:	00f12623          	sw	a5,12(sp)
    ffd8:	00002b97          	auipc	s7,0x2
    ffdc:	2c4bab83          	lw	s7,708(s7) # 1229c <.LC2>

0000ffe0 <.L86>:
    for (int y = 0; y < g_h; y++) {
    ffe0:	f1b4dc63          	bge	s1,s11,f6f8 <.L42>

0000ffe4 <.LBB209>:
        int row = (int)((int64_t)y * sz / g_h);
    ffe4:	028495b3          	mulh	a1,s1,s0
    ffe8:	000d8613          	mv	a2,s11
    ffec:	41fdd693          	sra	a3,s11,0x1f
    fff0:	41f45d13          	sra	s10,s0,0x1f

0000fff4 <.LBB204>:
        for (int x = 0; x < g_w; x++) {
    fff4:	00000a93          	li	s5,0
    fff8:	00000993          	li	s3,0
    fffc:	00000913          	li	s2,0

00010000 <.LBE204>:
        int row = (int)((int64_t)y * sz / g_h);
   10000:	02848533          	mul	a0,s1,s0
   10004:	91cf00ef          	jal	120 <__divdi3>

00010008 <.LBB195>:
                hsv2rgb((float)(row ^ col) / (float)sz, 1.0f, 1.0f, &r,&g,&b);
   10008:	03f10793          	add	a5,sp,63

0001000c <.LBE195>:
        int row = (int)((int64_t)y * sz / g_h);
   1000c:	00050a13          	mv	s4,a0

00010010 <.LBB196>:
                hsv2rgb((float)(row ^ col) / (float)sz, 1.0f, 1.0f, &r,&g,&b);
   10010:	00f12223          	sw	a5,4(sp)

00010014 <.L87>:
        for (int x = 0; x < g_w; x++) {
   10014:	01994a63          	blt	s2,s9,10028 <.L90>

00010018 <.LBE206>:
    for (int y = 0; y < g_h; y++) {
   10018:	00148493          	add	s1,s1,1
   1001c:	fc5ff06f          	j	ffe0 <.L86>

00010020 <.L104>:
    switch (pat) {
   10020:	00100413          	li	s0,1
   10024:	f99ff06f          	j	ffbc <.L46>

00010028 <.L90>:
            int col = (int)((int64_t)x * sz / g_w);
   10028:	00812683          	lw	a3,8(sp)
   1002c:	000c8613          	mv	a2,s9
   10030:	000a8513          	mv	a0,s5
   10034:	00098593          	mv	a1,s3
   10038:	8e8f00ef          	jal	120 <__divdi3>

0001003c <.LVL294>:
            if ((row & col) == 0) {
   1003c:	00aa77b3          	and	a5,s4,a0
   10040:	06079863          	bnez	a5,100b0 <.L88>

00010044 <.LBB197>:
                hsv2rgb((float)(row ^ col) / (float)sz, 1.0f, 1.0f, &r,&g,&b);
   10044:	00aa4533          	xor	a0,s4,a0

00010048 <.LVL295>:
   10048:	cc4f10ef          	jal	150c <__floatsisf>

0001004c <.LVL296>:
   1004c:	00050b13          	mv	s6,a0
   10050:	00040513          	mv	a0,s0
   10054:	cb8f10ef          	jal	150c <__floatsisf>

00010058 <.LVL297>:
   10058:	00050593          	mv	a1,a0
   1005c:	000b0513          	mv	a0,s6
   10060:	959f00ef          	jal	9b8 <__divsf3>

00010064 <.LVL298>:
   10064:	00c12703          	lw	a4,12(sp)
   10068:	00412683          	lw	a3,4(sp)
   1006c:	000b8613          	mv	a2,s7
   10070:	000c0793          	mv	a5,s8
   10074:	000b8593          	mv	a1,s7
   10078:	a80ff0ef          	jal	f2f8 <hsv2rgb>

0001007c <.LVL299>:
                pset(x, y, r, g, b);
   1007c:	06014703          	lbu	a4,96(sp)
   10080:	04014683          	lbu	a3,64(sp)
   10084:	03f14603          	lbu	a2,63(sp)

00010088 <.L118>:
                pset(x, y, 0, 0, 0);
   10088:	00090513          	mv	a0,s2
   1008c:	00048593          	mv	a1,s1
   10090:	854ff0ef          	jal	f0e4 <pset>

00010094 <.LBE201>:
        for (int x = 0; x < g_w; x++) {
   10094:	008a87b3          	add	a5,s5,s0
   10098:	0157b733          	sltu	a4,a5,s5
   1009c:	01a989b3          	add	s3,s3,s10
   100a0:	00190913          	add	s2,s2,1
   100a4:	00078a93          	mv	s5,a5
   100a8:	013709b3          	add	s3,a4,s3
   100ac:	f69ff06f          	j	10014 <.L87>

000100b0 <.L88>:
                pset(x, y, 0, 0, 0);
   100b0:	00000713          	li	a4,0
   100b4:	00000693          	li	a3,0
   100b8:	00000613          	li	a2,0
   100bc:	fcdff06f          	j	10088 <.L118>

000100c0 <.L98>:
        int32_t im0 = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
   100c0:	01012683          	lw	a3,16(sp)
   100c4:	000d8613          	mv	a2,s11
   100c8:	00098513          	mv	a0,s3
   100cc:	000a8593          	mv	a1,s5
   100d0:	850f00ef          	jal	120 <__divdi3>

000100d4 <.LVL304>:
   100d4:	fffff7b7          	lui	a5,0xfffff
   100d8:	19a78793          	add	a5,a5,410 # fffff19a <_ebss+0xfffe8e6a>
   100dc:	00f50d33          	add	s10,a0,a5

000100e0 <.LBB218>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
   100e0:	03ad07b3          	mul	a5,s10,s10

000100e4 <.LBE220>:
            int32_t zr = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
   100e4:	ffffebb7          	lui	s7,0xffffe

000100e8 <.LBB221>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
   100e8:	41fd5c13          	sra	s8,s10,0x1f

000100ec <.LBE219>:
        for (int px = 0; px < g_w; px++) {
   100ec:	00000a13          	li	s4,0
   100f0:	00000b13          	li	s6,0
   100f4:	00000913          	li	s2,0

000100f8 <.LBB230>:
            int32_t zr = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
   100f8:	667b8b93          	add	s7,s7,1639 # ffffe667 <_ebss+0xfffe8337>

000100fc <.LBB222>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
   100fc:	03ad1433          	mulh	s0,s10,s10
   10100:	00c7d793          	srl	a5,a5,0xc
   10104:	01441413          	sll	s0,s0,0x14
   10108:	00f46433          	or	s0,s0,a5

0001010c <.LBB223>:
                hsv2rgb((float)iter/MAXITER, 1.0f, 0.9f, &r,&g,&b);
   1010c:	06010793          	add	a5,sp,96
   10110:	00f12223          	sw	a5,4(sp)
   10114:	04010793          	add	a5,sp,64
   10118:	00f12423          	sw	a5,8(sp)
   1011c:	03f10793          	add	a5,sp,63
   10120:	00f12623          	sw	a5,12(sp)

00010124 <.L92>:
        for (int px = 0; px < g_w; px++) {
   10124:	03994463          	blt	s2,s9,1014c <.L97>

00010128 <.LBE217>:
    for (int py = 0; py < g_h; py++) {
   10128:	000027b7          	lui	a5,0x2
   1012c:	ccc78793          	add	a5,a5,-820 # 1ccc <.L34+0x10>
   10130:	00f987b3          	add	a5,s3,a5
   10134:	0137b733          	sltu	a4,a5,s3
   10138:	00148493          	add	s1,s1,1
   1013c:	00078993          	mv	s3,a5
   10140:	01570ab3          	add	s5,a4,s5

00010144 <.L45>:
   10144:	f7b4cee3          	blt	s1,s11,100c0 <.L98>
   10148:	db0ff06f          	j	f6f8 <.L42>

0001014c <.L97>:
            int32_t zr = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
   1014c:	01412683          	lw	a3,20(sp)
   10150:	000c8613          	mv	a2,s9
   10154:	000a0513          	mv	a0,s4
   10158:	000b0593          	mv	a1,s6
   1015c:	fc5ef0ef          	jal	120 <__divdi3>

00010160 <.LVL310>:
   10160:	017507b3          	add	a5,a0,s7

00010164 <.LBB224>:
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FPJ);
   10164:	02f786b3          	mul	a3,a5,a5
   10168:	41f7d613          	sra	a2,a5,0x1f
   1016c:	02f79733          	mulh	a4,a5,a5
   10170:	00c6d693          	srl	a3,a3,0xc
   10174:	01471713          	sll	a4,a4,0x14
   10178:	00d76733          	or	a4,a4,a3

0001017c <.LVL312>:
                if (zr2+zi2 > ESCAPE) break;
   1017c:	008705b3          	add	a1,a4,s0
   10180:	000046b7          	lui	a3,0x4

00010184 <.LVL313>:
   10184:	10b6ce63          	blt	a3,a1,102a0 <.L109>
                zi = (int32_t)(((int64_t)zr*zi) >> (FPJ-1)) + cim;
   10188:	000018b7          	lui	a7,0x1
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
   1018c:	00040593          	mv	a1,s0
   10190:	000d0693          	mv	a3,s10
   10194:	000c0e93          	mv	t4,s8

00010198 <.LBE224>:
            int iter = 0;
   10198:	00000513          	li	a0,0

0001019c <.LBB225>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FPJ-1)) + cim;
   1019c:	99988893          	add	a7,a7,-1639 # 999 <.LVL124+0x1>

000101a0 <.LBE225>:
            while (iter < MAXITER) {
   101a0:	05000313          	li	t1,80

000101a4 <.LBB226>:
                if (zr2+zi2 > ESCAPE) break;
   101a4:	00004e37          	lui	t3,0x4

000101a8 <.L94>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FPJ-1)) + cim;
   101a8:	02d60633          	mul	a2,a2,a3
                int32_t tmp = zr2 - zi2 + cre;
   101ac:	40b70733          	sub	a4,a4,a1
                iter++;
   101b0:	00150513          	add	a0,a0,1

000101b4 <.LVL316>:
                int32_t tmp = zr2 - zi2 + cre;
   101b4:	99a70713          	add	a4,a4,-1638

000101b8 <.LVL317>:
                zi = (int32_t)(((int64_t)zr*zi) >> (FPJ-1)) + cim;
   101b8:	02fe8eb3          	mul	t4,t4,a5
   101bc:	02d785b3          	mul	a1,a5,a3
   101c0:	01d60633          	add	a2,a2,t4
   101c4:	02d7b7b3          	mulhu	a5,a5,a3
   101c8:	00b5d693          	srl	a3,a1,0xb
   101cc:	00f607b3          	add	a5,a2,a5
   101d0:	01579793          	sll	a5,a5,0x15
   101d4:	00d7e6b3          	or	a3,a5,a3
   101d8:	011686b3          	add	a3,a3,a7

000101dc <.LBE226>:
            while (iter < MAXITER) {
   101dc:	02651e63          	bne	a0,t1,10218 <.L95>
            if (iter == MAXITER) { pset(px,py, 0,0,0); }
   101e0:	00000713          	li	a4,0

000101e4 <.LVL319>:
   101e4:	00000693          	li	a3,0

000101e8 <.LVL320>:
   101e8:	00000613          	li	a2,0

000101ec <.L119>:
                pset(px, py, r, g, b);
   101ec:	00090513          	mv	a0,s2
   101f0:	00048593          	mv	a1,s1
   101f4:	ef1fe0ef          	jal	f0e4 <pset>

000101f8 <.LBE227>:
        for (int px = 0; px < g_w; px++) {
   101f8:	000037b7          	lui	a5,0x3
   101fc:	33278793          	add	a5,a5,818 # 3332 <.L20+0x1a>
   10200:	00fa07b3          	add	a5,s4,a5
   10204:	0147b733          	sltu	a4,a5,s4
   10208:	00190913          	add	s2,s2,1
   1020c:	00078a13          	mv	s4,a5
   10210:	01670b33          	add	s6,a4,s6
   10214:	f11ff06f          	j	10124 <.L92>

00010218 <.L95>:
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FPJ);
   10218:	02e705b3          	mul	a1,a4,a4
   1021c:	00070793          	mv	a5,a4
   10220:	41f75613          	sra	a2,a4,0x1f
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
   10224:	41f6de93          	sra	t4,a3,0x1f
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FPJ);
   10228:	02e71733          	mulh	a4,a4,a4

0001022c <.LVL325>:
   1022c:	00c5d593          	srl	a1,a1,0xc
   10230:	01471713          	sll	a4,a4,0x14
   10234:	00b76733          	or	a4,a4,a1

00010238 <.LVL326>:
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
   10238:	02d68f33          	mul	t5,a3,a3
   1023c:	02d695b3          	mulh	a1,a3,a3

00010240 <.LVL327>:
   10240:	00cf5f13          	srl	t5,t5,0xc
   10244:	01459593          	sll	a1,a1,0x14
   10248:	01e5e5b3          	or	a1,a1,t5

0001024c <.LVL328>:
                if (zr2+zi2 > ESCAPE) break;
   1024c:	00b70f33          	add	t5,a4,a1

00010250 <.LVL329>:
   10250:	f5ee5ce3          	bge	t3,t5,101a8 <.L94>

00010254 <.L93>:
                hsv2rgb((float)iter/MAXITER, 1.0f, 0.9f, &r,&g,&b);
   10254:	ab8f10ef          	jal	150c <__floatsisf>

00010258 <.LVL331>:
   10258:	00002797          	auipc	a5,0x2
   1025c:	06078793          	add	a5,a5,96 # 122b8 <.LC9>
   10260:	0007a583          	lw	a1,0(a5)
   10264:	f54f00ef          	jal	9b8 <__divsf3>

00010268 <.LVL332>:
   10268:	00002617          	auipc	a2,0x2
   1026c:	04c60613          	add	a2,a2,76 # 122b4 <.LC8>
   10270:	00002597          	auipc	a1,0x2
   10274:	02c58593          	add	a1,a1,44 # 1229c <.LC2>
   10278:	00812703          	lw	a4,8(sp)
   1027c:	00c12683          	lw	a3,12(sp)
   10280:	00062603          	lw	a2,0(a2)
   10284:	00412783          	lw	a5,4(sp)
   10288:	0005a583          	lw	a1,0(a1)
   1028c:	86cff0ef          	jal	f2f8 <hsv2rgb>

00010290 <.LVL333>:
                pset(px, py, r, g, b);
   10290:	06014703          	lbu	a4,96(sp)
   10294:	04014683          	lbu	a3,64(sp)
   10298:	03f14603          	lbu	a2,63(sp)
   1029c:	f51ff06f          	j	101ec <.L119>

000102a0 <.L109>:
            int iter = 0;
   102a0:	00000513          	li	a0,0

000102a4 <.LVL335>:
   102a4:	fb1ff06f          	j	10254 <.L93>

000102a8 <.L105>:
        int32_t im0 = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
   102a8:	41fdd793          	sra	a5,s11,0x1f
   102ac:	00f12823          	sw	a5,16(sp)

000102b0 <.LBB233>:
            int32_t zr = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
   102b0:	41fcd793          	sra	a5,s9,0x1f

000102b4 <.LBE214>:
    switch (pat) {
   102b4:	00000993          	li	s3,0
   102b8:	00000a93          	li	s5,0
   102bc:	00000493          	li	s1,0

000102c0 <.LBB234>:
            int32_t zr = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
   102c0:	00f12a23          	sw	a5,20(sp)
   102c4:	e81ff06f          	j	10144 <.L45>

000102c8 <.L43>:
    clear();
   102c8:	eedfe0ef          	jal	f1b4 <clear>

000102cc <.LVL337>:
    sin_tab_init();
   102cc:	9d0ff0ef          	jal	f49c <sin_tab_init>

000102d0 <.LVL338>:
    int rx = g_w*2/5, ry = g_h*2/5;
   102d0:	00500713          	li	a4,5
   102d4:	001d9413          	sll	s0,s11,0x1
   102d8:	001c9493          	sll	s1,s9,0x1
   102dc:	02e4c4b3          	div	s1,s1,a4
    int cx = g_w/2, cy = g_h/2;
   102e0:	00200d13          	li	s10,2
   102e4:	00002c17          	auipc	s8,0x2
   102e8:	dc0c0c13          	add	s8,s8,-576 # 120a4 <curves.0>
   102ec:	00002a17          	auipc	s4,0x2
   102f0:	e08a0a13          	add	s4,s4,-504 # 120f4 <ecol.1>

000102f4 <.LBB245>:
            int ai = (curves[ci].a * t * 256 / STEPS) & 255;
   102f4:	02000b13          	li	s6,32
            int x = cx + rx * (int)sin_tab[ai] / 128;
   102f8:	08000b93          	li	s7,128

000102fc <.LBE245>:
    int rx = g_w*2/5, ry = g_h*2/5;
   102fc:	02e44433          	div	s0,s0,a4
    int cx = g_w/2, cy = g_h/2;
   10300:	03accab3          	div	s5,s9,s10
   10304:	03adcd33          	div	s10,s11,s10

00010308 <.LBB248>:
            int x = cx + rx * (int)sin_tab[ai] / 128;
   10308:	00006d97          	auipc	s11,0x6
   1030c:	ec0d8d93          	add	s11,s11,-320 # 161c8 <sin_tab>

00010310 <.L99>:
        for (int t = 0; t < STEPS; t++) {
   10310:	00000c93          	li	s9,0

00010314 <.L100>:
            int ai = (curves[ci].a * t * 256 / STEPS) & 255;
   10314:	000c2703          	lw	a4,0(s8)
            int bi = (curves[ci].q * t * 256 / STEPS + curves[ci].phase) & 255;
   10318:	008c2683          	lw	a3,8(s8)
            pset(x,   y,   curves[ci].r, curves[ci].g, curves[ci].b);
   1031c:	00cc4603          	lbu	a2,12(s8)
   10320:	00c12423          	sw	a2,8(sp)
            int ai = (curves[ci].a * t * 256 / STEPS) & 255;
   10324:	02ec8733          	mul	a4,s9,a4
   10328:	03674733          	div	a4,a4,s6
   1032c:	0ff77713          	zext.b	a4,a4
            int x = cx + rx * (int)sin_tab[ai] / 128;
   10330:	00ed8733          	add	a4,s11,a4
   10334:	00070983          	lb	s3,0(a4)
            int bi = (curves[ci].q * t * 256 / STEPS + curves[ci].phase) & 255;
   10338:	004c2703          	lw	a4,4(s8)
            int x = cx + rx * (int)sin_tab[ai] / 128;
   1033c:	029989b3          	mul	s3,s3,s1
            int bi = (curves[ci].q * t * 256 / STEPS + curves[ci].phase) & 255;
   10340:	02ec8733          	mul	a4,s9,a4

00010344 <.LBE249>:
        for (int t = 0; t < STEPS; t++) {
   10344:	001c8c93          	add	s9,s9,1

00010348 <.LBB250>:
            int bi = (curves[ci].q * t * 256 / STEPS + curves[ci].phase) & 255;
   10348:	03674733          	div	a4,a4,s6
   1034c:	00d70733          	add	a4,a4,a3
   10350:	0ff77713          	zext.b	a4,a4
            int y = cy + ry * (int)sin_tab[bi] / 128;
   10354:	00ed8733          	add	a4,s11,a4
   10358:	00070903          	lb	s2,0(a4)
            int x = cx + rx * (int)sin_tab[ai] / 128;
   1035c:	0379c9b3          	div	s3,s3,s7
            pset(x,   y,   curves[ci].r, curves[ci].g, curves[ci].b);
   10360:	00dc4683          	lbu	a3,13(s8)
   10364:	00ec4703          	lbu	a4,14(s8)
   10368:	00d12623          	sw	a3,12(sp)
   1036c:	00e12823          	sw	a4,16(sp)
            int y = cy + ry * (int)sin_tab[bi] / 128;
   10370:	02890933          	mul	s2,s2,s0
            int x = cx + rx * (int)sin_tab[ai] / 128;
   10374:	015989b3          	add	s3,s3,s5
            pset(x,   y,   curves[ci].r, curves[ci].g, curves[ci].b);
   10378:	00098513          	mv	a0,s3
            int y = cy + ry * (int)sin_tab[bi] / 128;
   1037c:	03794933          	div	s2,s2,s7
   10380:	01a90933          	add	s2,s2,s10
            pset(x,   y,   curves[ci].r, curves[ci].g, curves[ci].b);
   10384:	00090593          	mv	a1,s2
   10388:	d5dfe0ef          	jal	f0e4 <pset>

0001038c <.LVL346>:
            pset(x+1, y,   curves[ci].r, curves[ci].g, curves[ci].b);
   1038c:	01012703          	lw	a4,16(sp)
   10390:	00c12683          	lw	a3,12(sp)
   10394:	00812603          	lw	a2,8(sp)
   10398:	00198793          	add	a5,s3,1
   1039c:	00078513          	mv	a0,a5
   103a0:	00090593          	mv	a1,s2
   103a4:	00f12223          	sw	a5,4(sp)
   103a8:	d3dfe0ef          	jal	f0e4 <pset>

000103ac <.LVL347>:
            pset(x,   y+1, curves[ci].r, curves[ci].g, curves[ci].b);
   103ac:	01012703          	lw	a4,16(sp)
   103b0:	00c12683          	lw	a3,12(sp)
   103b4:	00812603          	lw	a2,8(sp)
   103b8:	00190593          	add	a1,s2,1
   103bc:	00098513          	mv	a0,s3
   103c0:	00e12a23          	sw	a4,20(sp)
   103c4:	00d12823          	sw	a3,16(sp)
   103c8:	00c12623          	sw	a2,12(sp)
   103cc:	00b12423          	sw	a1,8(sp)
   103d0:	d15fe0ef          	jal	f0e4 <pset>

000103d4 <.LVL348>:
            pset(x+1, y+1, curves[ci].r, curves[ci].g, curves[ci].b);
   103d4:	01412703          	lw	a4,20(sp)
   103d8:	01012683          	lw	a3,16(sp)
   103dc:	00c12603          	lw	a2,12(sp)
   103e0:	00812583          	lw	a1,8(sp)
   103e4:	00412503          	lw	a0,4(sp)
   103e8:	cfdfe0ef          	jal	f0e4 <pset>

000103ec <.LBE250>:
        for (int t = 0; t < STEPS; t++) {
   103ec:	00002e37          	lui	t3,0x2
   103f0:	f3cc92e3          	bne	s9,t3,10314 <.L100>

000103f4 <.LBE251>:
    for (int ci = 0; ci < ncurves; ci++) {
   103f4:	010c0c13          	add	s8,s8,16
   103f8:	f18a1ce3          	bne	s4,s8,10310 <.L99>
   103fc:	afcff06f          	j	f6f8 <.L42>

00010400 <main>:
{
    return strcmp(a, "all") == 0 || strcmp(a, "-a") == 0 || strcmp(a, "--all") == 0;
}

int main(int argc, char *argv[])
{
   10400:	f4010113          	add	sp,sp,-192
   10404:	0a112e23          	sw	ra,188(sp)
   10408:	0a812c23          	sw	s0,184(sp)
   1040c:	0a912a23          	sw	s1,180(sp)
   10410:	0b212823          	sw	s2,176(sp)
   10414:	0b312623          	sw	s3,172(sp)
   10418:	0b412423          	sw	s4,168(sp)
    if (argc < 2) {
   1041c:	00100793          	li	a5,1
   10420:	02a7ca63          	blt	a5,a0,10454 <.L121>
        printf("Usage: framebuff <1-10 | all>\n"
   10424:	00002517          	auipc	a0,0x2
   10428:	ad050513          	add	a0,a0,-1328 # 11ef4 <.LC18>

0001042c <.L136>:
        return 1;
    }

    int all = is_all_flag(argv[1]);
    int pat = all ? 0 : atoi(argv[1]);
    if (!all && (pat < 1 || pat > 10)) { printf("Pattern must be 1-10 or all\n"); return 1; }
   1042c:	be0f10ef          	jal	180c <puts>

00010430 <.L122>:
        return 1;
   10430:	00100513          	li	a0,1

00010434 <.L120>:
    }

    free(g_buf);
    close(fd);
    return 0;
}
   10434:	0bc12083          	lw	ra,188(sp)
   10438:	0b812403          	lw	s0,184(sp)
   1043c:	0b412483          	lw	s1,180(sp)
   10440:	0b012903          	lw	s2,176(sp)
   10444:	0ac12983          	lw	s3,172(sp)
   10448:	0a812a03          	lw	s4,168(sp)
   1044c:	0c010113          	add	sp,sp,192
   10450:	00008067          	ret

00010454 <.L121>:
    int all = is_all_flag(argv[1]);
   10454:	0045a483          	lw	s1,4(a1)

00010458 <.LBB256>:
    return strcmp(a, "all") == 0 || strcmp(a, "-a") == 0 || strcmp(a, "--all") == 0;
   10458:	00002597          	auipc	a1,0x2
   1045c:	be858593          	add	a1,a1,-1048 # 12040 <.LC19>

00010460 <.LVL355>:
   10460:	00048513          	mv	a0,s1

00010464 <.LVL356>:
   10464:	9d9f20ef          	jal	2e3c <__GI_strcmp>

00010468 <.LVL357>:
   10468:	00050413          	mv	s0,a0
   1046c:	04050e63          	beqz	a0,104c8 <.L133>
   10470:	00002597          	auipc	a1,0x2
   10474:	bac58593          	add	a1,a1,-1108 # 1201c <.LC20>
   10478:	00048513          	mv	a0,s1
   1047c:	9c1f20ef          	jal	2e3c <__GI_strcmp>

00010480 <.LVL358>:
   10480:	00050413          	mv	s0,a0
   10484:	04050263          	beqz	a0,104c8 <.L133>
   10488:	00002597          	auipc	a1,0x2
   1048c:	b9858593          	add	a1,a1,-1128 # 12020 <.LC21>
   10490:	00048513          	mv	a0,s1
   10494:	9a9f20ef          	jal	2e3c <__GI_strcmp>

00010498 <.LVL359>:
   10498:	00050413          	mv	s0,a0
   1049c:	02050663          	beqz	a0,104c8 <.L133>

000104a0 <.LBE256>:
    int pat = all ? 0 : atoi(argv[1]);
   104a0:	00048513          	mv	a0,s1
   104a4:	a04f30ef          	jal	36a8 <__GI_atoi>

000104a8 <.LVL361>:
    if (!all && (pat < 1 || pat > 10)) { printf("Pattern must be 1-10 or all\n"); return 1; }
   104a8:	fff50713          	add	a4,a0,-1
   104ac:	00900793          	li	a5,9
    int pat = all ? 0 : atoi(argv[1]);
   104b0:	00050413          	mv	s0,a0

000104b4 <.LBB260>:
    return strcmp(a, "all") == 0 || strcmp(a, "-a") == 0 || strcmp(a, "--all") == 0;
   104b4:	00000993          	li	s3,0

000104b8 <.LBE260>:
    if (!all && (pat < 1 || pat > 10)) { printf("Pattern must be 1-10 or all\n"); return 1; }
   104b8:	00e7fa63          	bgeu	a5,a4,104cc <.L123>
   104bc:	00002517          	auipc	a0,0x2
   104c0:	b6c50513          	add	a0,a0,-1172 # 12028 <.LC22>
   104c4:	f69ff06f          	j	1042c <.L136>

000104c8 <.L133>:
    return strcmp(a, "all") == 0 || strcmp(a, "-a") == 0 || strcmp(a, "--all") == 0;
   104c8:	00100993          	li	s3,1

000104cc <.L123>:
    int fd = open("/dev/fb0", O_RDWR);
   104cc:	00200593          	li	a1,2
   104d0:	00002517          	auipc	a0,0x2
   104d4:	b7450513          	add	a0,a0,-1164 # 12044 <.LC23>
   104d8:	a5cf10ef          	jal	1734 <__GI_open>

000104dc <.LVL365>:
   104dc:	00050493          	mv	s1,a0
    if (fd < 0) { printf("framebuff: open /dev/fb0 failed\n"); return 1; }
   104e0:	00055863          	bgez	a0,104f0 <.L125>
   104e4:	00002517          	auipc	a0,0x2
   104e8:	b6c50513          	add	a0,a0,-1172 # 12050 <.LC24>
   104ec:	f41ff06f          	j	1042c <.L136>

000104f0 <.L125>:
    if (ioctl(fd, FBIOGET_VSCREENINFO, &vinfo) < 0) {
   104f0:	000045b7          	lui	a1,0x4
   104f4:	00010613          	mv	a2,sp
   104f8:	60058593          	add	a1,a1,1536 # 4600 <.L2+0x4>
   104fc:	998f10ef          	jal	1694 <__GI_ioctl>

00010500 <.LVL367>:
   10500:	00055e63          	bgez	a0,1051c <.L126>
        printf("framebuff: ioctl failed\n"); close(fd); return 1;
   10504:	00002517          	auipc	a0,0x2
   10508:	b6c50513          	add	a0,a0,-1172 # 12070 <.LC25>

0001050c <.L137>:
    if (!g_buf) { printf("framebuff: malloc failed\n"); close(fd); return 1; }
   1050c:	b00f10ef          	jal	180c <puts>

00010510 <.LVL368>:
   10510:	00048513          	mv	a0,s1
   10514:	94cf10ef          	jal	1660 <__GI_close>

00010518 <.LVL369>:
   10518:	f19ff06f          	j	10430 <.L122>

0001051c <.L126>:
    g_w = (int)vinfo.xres;
   1051c:	00012903          	lw	s2,0(sp)
    g_buf = malloc(size);
   10520:	00006a17          	auipc	s4,0x6
   10524:	db0a0a13          	add	s4,s4,-592 # 162d0 <g_buf>
    g_w = (int)vinfo.xres;
   10528:	00006797          	auipc	a5,0x6
   1052c:	db27a223          	sw	s2,-604(a5) # 162cc <g_w>
    g_h = (int)vinfo.yres;
   10530:	00412783          	lw	a5,4(sp)
    int size = g_w * g_h * 4;
   10534:	02f90933          	mul	s2,s2,a5
    g_h = (int)vinfo.yres;
   10538:	00006717          	auipc	a4,0x6
   1053c:	d8f72823          	sw	a5,-624(a4) # 162c8 <g_h>
    int size = g_w * g_h * 4;
   10540:	00291913          	sll	s2,s2,0x2
    g_buf = malloc(size);
   10544:	00090513          	mv	a0,s2
   10548:	da9f20ef          	jal	32f0 <malloc>

0001054c <.LVL371>:
   1054c:	00aa2023          	sw	a0,0(s4)
    if (!g_buf) { printf("framebuff: malloc failed\n"); close(fd); return 1; }
   10550:	00051863          	bnez	a0,10560 <.L127>
   10554:	00002517          	auipc	a0,0x2
   10558:	b3450513          	add	a0,a0,-1228 # 12088 <.LC26>
   1055c:	fb1ff06f          	j	1050c <.L137>

00010560 <.L127>:
    if (all) {
   10560:	02098663          	beqz	s3,1058c <.L128>

00010564 <.LBB262>:
            if (p < 10) sleep(1);   /* 1 second between patterns */
   10564:	00a00413          	li	s0,10

00010568 <.L130>:
            render_pattern(p, fd, size);
   10568:	00090613          	mv	a2,s2
   1056c:	00048593          	mv	a1,s1
   10570:	00098513          	mv	a0,s3
   10574:	fddfe0ef          	jal	f550 <render_pattern>

00010578 <.LVL373>:
            if (p < 10) sleep(1);   /* 1 second between patterns */
   10578:	02898263          	beq	s3,s0,1059c <.L129>
   1057c:	00100513          	li	a0,1
   10580:	ab8f30ef          	jal	3838 <__GI_sleep>

00010584 <.LVL374>:
        for (int p = 1; p <= 10; p++) {
   10584:	00198993          	add	s3,s3,1
   10588:	fe1ff06f          	j	10568 <.L130>

0001058c <.L128>:
        render_pattern(pat, fd, size);
   1058c:	00090613          	mv	a2,s2
   10590:	00048593          	mv	a1,s1
   10594:	00040513          	mv	a0,s0
   10598:	fb9fe0ef          	jal	f550 <render_pattern>

0001059c <.L129>:
    free(g_buf);
   1059c:	000a2503          	lw	a0,0(s4)
   105a0:	f69f20ef          	jal	3508 <free>

000105a4 <.LVL378>:
    close(fd);
   105a4:	00048513          	mv	a0,s1
   105a8:	8b8f10ef          	jal	1660 <__GI_close>

000105ac <.LVL379>:
    return 0;
   105ac:	00000513          	li	a0,0
   105b0:	e85ff06f          	j	10434 <.L120>
