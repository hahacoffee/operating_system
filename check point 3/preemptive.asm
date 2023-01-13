;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module preemptive
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _myTimer0Handler
	.globl _Bootstrap
	.globl _main
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _createdThreadID
	.globl _createdThreadSP
	.globl _oldSP
	.globl _currentThreadID
	.globl _threadBitMap
	.globl _th3_SP
	.globl _th2_SP
	.globl _th1_SP
	.globl _th0_SP
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_th0_SP	=	0x0030
_th1_SP	=	0x0031
_th2_SP	=	0x0032
_th3_SP	=	0x0033
_threadBitMap	=	0x0034
_currentThreadID	=	0x0035
_oldSP	=	0x0020
_createdThreadSP	=	0x0021
_createdThreadID	=	0x0022
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:126: void Bootstrap(void) {
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	preemptive.c:140: threadBitMap = 0x00;
	clr	a
	mov	_threadBitMap,a
	mov	(_threadBitMap + 1),a
;	preemptive.c:141: th0_SP = 0x3F;
	mov	_th0_SP,#0x3f
;	1-genFromRTrack replaced	mov	(_th0_SP + 1),#0x00
	mov	(_th0_SP + 1),a
;	preemptive.c:142: th1_SP = 0x4F;
	mov	_th1_SP,#0x4f
;	1-genFromRTrack replaced	mov	(_th1_SP + 1),#0x00
	mov	(_th1_SP + 1),a
;	preemptive.c:143: th2_SP = 0x5F;
	mov	_th2_SP,#0x5f
;	1-genFromRTrack replaced	mov	(_th2_SP + 1),#0x00
	mov	(_th2_SP + 1),a
;	preemptive.c:144: th3_SP = 0x6F;
	mov	_th3_SP,#0x6f
;	1-genFromRTrack replaced	mov	(_th3_SP + 1),#0x00
	mov	(_th3_SP + 1),a
;	preemptive.c:146: TMOD = 0;
;	1-genFromRTrack replaced	mov	_TMOD,#0x00
	mov	_TMOD,a
;	preemptive.c:147: IE = 0x82;
	mov	_IE,#0x82
;	preemptive.c:148: TR0 = 1;
;	assignBit
	setb	_TR0
;	preemptive.c:150: currentThreadID = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_currentThreadID,dpl
;	preemptive.c:151: RESTORESTATE;
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00125$
	sjmp	00101$
00125$:
	cjne	r7,#0x31,00126$
	sjmp	00102$
00126$:
	cjne	r7,#0x32,00127$
	sjmp	00103$
00127$:
	cjne	r7,#0x33,00106$
	sjmp	00104$
00101$:
	MOV SP, 0x30 
	sjmp	00106$
00102$:
	MOV SP, 0x31 
	sjmp	00106$
00103$:
	MOV SP, 0x32 
	sjmp	00106$
00104$:
	MOV SP, 0x33 
00106$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:152: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:154: void myTimer0Handler(void) {
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	preemptive.c:155: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:156: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00207$
	sjmp	00101$
00207$:
	cjne	r7,#0x31,00208$
	sjmp	00102$
00208$:
	cjne	r7,#0x32,00209$
	sjmp	00103$
00209$:
	cjne	r7,#0x33,00128$
	sjmp	00104$
00101$:
	MOV 0x30, SP 
	sjmp	00128$
00102$:
	MOV 0x31, SP 
	sjmp	00128$
00103$:
	MOV 0x32, SP 
	sjmp	00128$
00104$:
	MOV 0x33, SP 
;	preemptive.c:157: do {
00128$:
;	preemptive.c:158: switch (currentThreadID) {
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00211$
	sjmp	00107$
00211$:
	cjne	r7,#0x31,00212$
	sjmp	00108$
00212$:
	cjne	r7,#0x32,00213$
	sjmp	00109$
00213$:
;	preemptive.c:159: case '0':
	cjne	r7,#0x33,00112$
	sjmp	00110$
00107$:
;	preemptive.c:160: currentThreadID = '1';
	mov	_currentThreadID,#0x31
;	preemptive.c:161: break;
;	preemptive.c:162: case '1':
	sjmp	00112$
00108$:
;	preemptive.c:163: currentThreadID = '2';
	mov	_currentThreadID,#0x32
;	preemptive.c:164: break;
;	preemptive.c:165: case '2':
	sjmp	00112$
00109$:
;	preemptive.c:166: currentThreadID = '3';
	mov	_currentThreadID,#0x33
;	preemptive.c:167: break;
;	preemptive.c:168: case '3':
	sjmp	00112$
00110$:
;	preemptive.c:169: currentThreadID = '0';
	mov	_currentThreadID,#0x30
;	preemptive.c:173: }
00112$:
;	preemptive.c:174: if ((currentThreadID == '0') && ((threadBitMap & 0x01) == 0x01)) {
	mov	a,#0x30
	cjne	a,_currentThreadID,00125$
	mov	a,#0x01
	anl	a,_threadBitMap
	mov	r6,a
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x01,00217$
	cjne	r7,#0x00,00217$
	sjmp	00130$
00217$:
;	preemptive.c:175: break;
00125$:
;	preemptive.c:176: } else if ((currentThreadID == '1') && ((threadBitMap & 0x02) == 0x02)) {
	mov	a,#0x31
	cjne	a,_currentThreadID,00121$
	mov	a,#0x02
	anl	a,_threadBitMap
	mov	r6,a
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x02,00220$
	cjne	r7,#0x00,00220$
	sjmp	00130$
00220$:
;	preemptive.c:177: break;
00121$:
;	preemptive.c:178: } else if ((currentThreadID == '2') && ((threadBitMap & 0x04) == 0x04)) {
	mov	a,#0x32
	cjne	a,_currentThreadID,00117$
	mov	a,#0x04
	anl	a,_threadBitMap
	mov	r6,a
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x04,00223$
	cjne	r7,#0x00,00223$
	sjmp	00130$
00223$:
;	preemptive.c:179: break;
00117$:
;	preemptive.c:180: } else if ((currentThreadID == '3') && ((threadBitMap & 0x08) == 0x08)) {
	mov	a,#0x33
	cjne	a,_currentThreadID,00224$
	sjmp	00225$
00224$:
	ljmp	00128$
00225$:
	mov	a,#0x08
	anl	a,_threadBitMap
	mov	r6,a
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x08,00226$
	cjne	r7,#0x00,00226$
	sjmp	00227$
00226$:
	ljmp	00128$
00227$:
;	preemptive.c:183: } while (1);
00130$:
;	preemptive.c:184: RESTORESTATE;
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00228$
	sjmp	00131$
00228$:
	cjne	r7,#0x31,00229$
	sjmp	00132$
00229$:
	cjne	r7,#0x32,00230$
	sjmp	00133$
00230$:
	cjne	r7,#0x33,00136$
	sjmp	00134$
00131$:
	MOV SP, 0x30 
	sjmp	00136$
00132$:
	MOV SP, 0x31 
	sjmp	00136$
00133$:
	MOV SP, 0x32 
	sjmp	00136$
00134$:
	MOV SP, 0x33 
00136$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:185: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:188: __endasm;
	RETI
;	preemptive.c:189: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;------------------------------------------------------------
;	preemptive.c:197: ThreadID ThreadCreate(FunctionPtr fp) {
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemptive.c:204: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:206: if ((threadBitMap & 0xFF) == 0xFF) {
	mov	r6,_threadBitMap
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0xff,00102$
	cjne	r7,#0x00,00102$
;	preemptive.c:207: return -1;
	mov	dpl,#0xff
	ret
00102$:
;	preemptive.c:250: createdThreadID = 'x';
	mov	_createdThreadID,#0x78
;	preemptive.c:251: if ((threadBitMap & 0x01) == 0x00) {
	mov	a,_threadBitMap
	jb	acc.0,00112$
;	preemptive.c:256: __endasm;
	MOV	0x22, #48
	ORL	0x34, #01
	MOV	0x21, 0x30
	sjmp	00113$
00112$:
;	preemptive.c:260: } else if ((threadBitMap & 0x02) == 0x00) {
	mov	a,_threadBitMap
	jb	acc.1,00109$
;	preemptive.c:265: __endasm;
	MOV	0x22, #49
	ORL	0x34, #02
	MOV	0x21, 0x31
	sjmp	00113$
00109$:
;	preemptive.c:269: } else if ((threadBitMap & 0x04) == 0x00) {
	mov	a,_threadBitMap
	jb	acc.2,00106$
;	preemptive.c:274: __endasm;
	MOV	0x22, #50
	ORL	0x34, #04
	MOV	0x21, 0x32
	sjmp	00113$
00106$:
;	preemptive.c:278: } else if ((threadBitMap & 0x08) == 0x00) {
	mov	a,_threadBitMap
	jb	acc.3,00113$
;	preemptive.c:283: __endasm;
	MOV	0x22, #51
	ORL	0x34, #08
	MOV	0x21, 0x33
00113$:
;	preemptive.c:292: __endasm;
	MOV	0x20, sp
	MOV	sp, 0x21
;	preemptive.c:297: __endasm;
	PUSH	DPL
	PUSH	DPH
;	preemptive.c:305: __endasm;
	MOV	A, 0x00
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
;	preemptive.c:307: switch (createdThreadID) {
	mov	r7,_createdThreadID
	cjne	r7,#0x30,00164$
	sjmp	00114$
00164$:
	cjne	r7,#0x31,00165$
	sjmp	00115$
00165$:
	cjne	r7,#0x32,00166$
	sjmp	00116$
00166$:
;	preemptive.c:308: case '0':
	cjne	r7,#0x33,00119$
	sjmp	00117$
00114$:
;	preemptive.c:313: __endasm;
	MOV	PSW, #0x00
	PUSH	PSW
	MOV	0x30, SP
;	preemptive.c:314: break;
;	preemptive.c:315: case '1':
	sjmp	00119$
00115$:
;	preemptive.c:320: __endasm;
	MOV	PSW, #0x08
	PUSH	PSW
	MOV	0x31, SP
;	preemptive.c:321: break;
;	preemptive.c:322: case '2':
	sjmp	00119$
00116$:
;	preemptive.c:327: __endasm;
	MOV	PSW, #0x10
	PUSH	PSW
	MOV	0x32, SP
;	preemptive.c:328: break;
;	preemptive.c:329: case '3':
	sjmp	00119$
00117$:
;	preemptive.c:334: __endasm;
	MOV	PSW, #0x18
	PUSH	PSW
	MOV	0x33, SP
;	preemptive.c:338: }
00119$:
;	preemptive.c:343: __endasm;
	MOV	sp, 0x20
;	preemptive.c:344: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:345: return createdThreadID;
	mov	dpl,_createdThreadID
;	preemptive.c:346: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:355: void ThreadYield(void) {
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	preemptive.c:356: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00207$
	sjmp	00101$
00207$:
	cjne	r7,#0x31,00208$
	sjmp	00102$
00208$:
	cjne	r7,#0x32,00209$
	sjmp	00103$
00209$:
	cjne	r7,#0x33,00128$
	sjmp	00104$
00101$:
	MOV 0x30, SP 
	sjmp	00128$
00102$:
	MOV 0x31, SP 
	sjmp	00128$
00103$:
	MOV 0x32, SP 
	sjmp	00128$
00104$:
	MOV 0x33, SP 
;	preemptive.c:357: do {
00128$:
;	preemptive.c:367: switch (currentThreadID) {
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00211$
	sjmp	00107$
00211$:
	cjne	r7,#0x31,00212$
	sjmp	00108$
00212$:
	cjne	r7,#0x32,00213$
	sjmp	00109$
00213$:
;	preemptive.c:368: case '0':
	cjne	r7,#0x33,00112$
	sjmp	00110$
00107$:
;	preemptive.c:369: currentThreadID = '1';
	mov	_currentThreadID,#0x31
;	preemptive.c:370: break;
;	preemptive.c:371: case '1':
	sjmp	00112$
00108$:
;	preemptive.c:372: currentThreadID = '2';
	mov	_currentThreadID,#0x32
;	preemptive.c:373: break;
;	preemptive.c:374: case '2':
	sjmp	00112$
00109$:
;	preemptive.c:375: currentThreadID = '3';
	mov	_currentThreadID,#0x33
;	preemptive.c:376: break;
;	preemptive.c:377: case '3':
	sjmp	00112$
00110$:
;	preemptive.c:378: currentThreadID = '0';
	mov	_currentThreadID,#0x30
;	preemptive.c:382: }
00112$:
;	preemptive.c:383: if ((currentThreadID == '0') && ((threadBitMap & 0x01) == 0x01)) {
	mov	a,#0x30
	cjne	a,_currentThreadID,00125$
	mov	a,#0x01
	anl	a,_threadBitMap
	mov	r6,a
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x01,00217$
	cjne	r7,#0x00,00217$
	sjmp	00130$
00217$:
;	preemptive.c:384: break;
00125$:
;	preemptive.c:385: } else if ((currentThreadID == '1') && ((threadBitMap & 0x02) == 0x02)) {
	mov	a,#0x31
	cjne	a,_currentThreadID,00121$
	mov	a,#0x02
	anl	a,_threadBitMap
	mov	r6,a
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x02,00220$
	cjne	r7,#0x00,00220$
	sjmp	00130$
00220$:
;	preemptive.c:386: break;
00121$:
;	preemptive.c:387: } else if ((currentThreadID == '2') && ((threadBitMap & 0x04) == 0x04)) {
	mov	a,#0x32
	cjne	a,_currentThreadID,00117$
	mov	a,#0x04
	anl	a,_threadBitMap
	mov	r6,a
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x04,00223$
	cjne	r7,#0x00,00223$
	sjmp	00130$
00223$:
;	preemptive.c:388: break;
00117$:
;	preemptive.c:389: } else if ((currentThreadID == '3') && ((threadBitMap & 0x08) == 0x08)) {
	mov	a,#0x33
	cjne	a,_currentThreadID,00224$
	sjmp	00225$
00224$:
	ljmp	00128$
00225$:
	mov	a,#0x08
	anl	a,_threadBitMap
	mov	r6,a
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x08,00226$
	cjne	r7,#0x00,00226$
	sjmp	00227$
00226$:
	ljmp	00128$
00227$:
;	preemptive.c:392: } while (1);
00130$:
;	preemptive.c:393: RESTORESTATE;
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00228$
	sjmp	00131$
00228$:
	cjne	r7,#0x31,00229$
	sjmp	00132$
00229$:
	cjne	r7,#0x32,00230$
	sjmp	00133$
00230$:
	cjne	r7,#0x33,00136$
	sjmp	00134$
00131$:
	MOV SP, 0x30 
	sjmp	00136$
00132$:
	MOV SP, 0x31 
	sjmp	00136$
00133$:
	MOV SP, 0x32 
	sjmp	00136$
00134$:
	MOV SP, 0x33 
00136$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:394: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemptive.c:402: void ThreadExit(void) {
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	preemptive.c:409: switch (currentThreadID) {
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00206$
	sjmp	00101$
00206$:
	cjne	r7,#0x31,00207$
	sjmp	00102$
00207$:
	cjne	r7,#0x32,00208$
	sjmp	00103$
00208$:
;	preemptive.c:410: case '0':
	cjne	r7,#0x33,00127$
	sjmp	00104$
00101$:
;	preemptive.c:413: __endasm;
	ANL	0x34, #11111110
;	preemptive.c:414: break;
;	preemptive.c:415: case '1':
	sjmp	00127$
00102$:
;	preemptive.c:418: __endasm;
	ANL	0x34, #11111101
;	preemptive.c:419: break;
;	preemptive.c:420: case '2':
	sjmp	00127$
00103$:
;	preemptive.c:423: __endasm;
	ANL	0x34, #11111011
;	preemptive.c:424: break;
;	preemptive.c:425: case '3':
	sjmp	00127$
00104$:
;	preemptive.c:428: __endasm;
	ANL	0x34, #11110111
;	preemptive.c:431: do {
00127$:
;	preemptive.c:432: switch (currentThreadID) {
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00210$
	sjmp	00106$
00210$:
	cjne	r7,#0x31,00211$
	sjmp	00107$
00211$:
	cjne	r7,#0x32,00212$
	sjmp	00108$
00212$:
;	preemptive.c:433: case '0':
	cjne	r7,#0x33,00111$
	sjmp	00109$
00106$:
;	preemptive.c:434: currentThreadID = '1';
	mov	_currentThreadID,#0x31
;	preemptive.c:435: break;
;	preemptive.c:436: case '1':
	sjmp	00111$
00107$:
;	preemptive.c:437: currentThreadID = '2';
	mov	_currentThreadID,#0x32
;	preemptive.c:438: break;
;	preemptive.c:439: case '2':
	sjmp	00111$
00108$:
;	preemptive.c:440: currentThreadID = '3';
	mov	_currentThreadID,#0x33
;	preemptive.c:441: break;
;	preemptive.c:442: case '3':
	sjmp	00111$
00109$:
;	preemptive.c:443: currentThreadID = '0';
	mov	_currentThreadID,#0x30
;	preemptive.c:447: }
00111$:
;	preemptive.c:448: if ((currentThreadID == '0') && ((threadBitMap & 0x01) == 0x01)) {
	mov	a,#0x30
	cjne	a,_currentThreadID,00124$
	mov	a,#0x01
	anl	a,_threadBitMap
	mov	r6,a
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x01,00216$
	cjne	r7,#0x00,00216$
	sjmp	00129$
00216$:
;	preemptive.c:449: break;
00124$:
;	preemptive.c:450: } else if ((currentThreadID == '1') && ((threadBitMap & 0x02) == 0x02)) {
	mov	a,#0x31
	cjne	a,_currentThreadID,00120$
	mov	a,#0x02
	anl	a,_threadBitMap
	mov	r6,a
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x02,00219$
	cjne	r7,#0x00,00219$
	sjmp	00129$
00219$:
;	preemptive.c:451: break;
00120$:
;	preemptive.c:452: } else if ((currentThreadID == '2') && ((threadBitMap & 0x04) == 0x04)) {
	mov	a,#0x32
	cjne	a,_currentThreadID,00116$
	mov	a,#0x04
	anl	a,_threadBitMap
	mov	r6,a
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x04,00222$
	cjne	r7,#0x00,00222$
	sjmp	00129$
00222$:
;	preemptive.c:453: break;
00116$:
;	preemptive.c:454: } else if ((currentThreadID == '3') && ((threadBitMap & 0x08) == 0x08)) {
	mov	a,#0x33
	cjne	a,_currentThreadID,00223$
	sjmp	00224$
00223$:
	ljmp	00127$
00224$:
	mov	a,#0x08
	anl	a,_threadBitMap
	mov	r6,a
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x08,00225$
	cjne	r7,#0x00,00225$
	sjmp	00226$
00225$:
	ljmp	00127$
00226$:
;	preemptive.c:457: } while (1);
00129$:
;	preemptive.c:458: RESTORESTATE;
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00227$
	sjmp	00130$
00227$:
	cjne	r7,#0x31,00228$
	sjmp	00131$
00228$:
	cjne	r7,#0x32,00229$
	sjmp	00132$
00229$:
	cjne	r7,#0x33,00135$
	sjmp	00133$
00130$:
	MOV SP, 0x30 
	sjmp	00135$
00131$:
	MOV SP, 0x31 
	sjmp	00135$
00132$:
	MOV SP, 0x32 
	sjmp	00135$
00133$:
	MOV SP, 0x33 
00135$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:459: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
