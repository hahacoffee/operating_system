;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module cooperative
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
;	cooperative.c:126: void Bootstrap(void) {
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
;	cooperative.c:134: threadBitMap = 0x00;
	clr	a
	mov	_threadBitMap,a
	mov	(_threadBitMap + 1),a
;	cooperative.c:135: th0_SP = 0x3F;
	mov	_th0_SP,#0x3f
;	1-genFromRTrack replaced	mov	(_th0_SP + 1),#0x00
	mov	(_th0_SP + 1),a
;	cooperative.c:136: th1_SP = 0x4F;
	mov	_th1_SP,#0x4f
;	1-genFromRTrack replaced	mov	(_th1_SP + 1),#0x00
	mov	(_th1_SP + 1),a
;	cooperative.c:137: th2_SP = 0x5F;
	mov	_th2_SP,#0x5f
;	1-genFromRTrack replaced	mov	(_th2_SP + 1),#0x00
	mov	(_th2_SP + 1),a
;	cooperative.c:138: th3_SP = 0x6F;
	mov	_th3_SP,#0x6f
;	1-genFromRTrack replaced	mov	(_th3_SP + 1),#0x00
	mov	(_th3_SP + 1),a
;	cooperative.c:145: currentThreadID = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_currentThreadID,dpl
;	cooperative.c:146: RESTORESTATE;
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
;	cooperative.c:147: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;------------------------------------------------------------
;	cooperative.c:155: ThreadID ThreadCreate(FunctionPtr fp) {
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	cooperative.c:161: if ((threadBitMap & 0xFF) == 0xFF) {
	mov	r6,_threadBitMap
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0xff,00102$
	cjne	r7,#0x00,00102$
;	cooperative.c:162: return -1;
	mov	dpl,#0xff
	ret
00102$:
;	cooperative.c:175: createdThreadID = 'x';
	mov	_createdThreadID,#0x78
;	cooperative.c:176: if ((threadBitMap & 0x01) == 0x00) {
	mov	a,_threadBitMap
	jb	acc.0,00112$
;	cooperative.c:181: __endasm;
	MOV	0x22, #48
	ORL	0x34, #01
	MOV	0x21, 0x30
	sjmp	00113$
00112$:
;	cooperative.c:185: } else if ((threadBitMap & 0x02) == 0x00) {
	mov	a,_threadBitMap
	jb	acc.1,00109$
;	cooperative.c:190: __endasm;
	MOV	0x22, #49
	ORL	0x34, #02
	MOV	0x21, 0x31
	sjmp	00113$
00109$:
;	cooperative.c:194: } else if ((threadBitMap & 0x04) == 0x00) {
	mov	a,_threadBitMap
	jb	acc.2,00106$
;	cooperative.c:199: __endasm;
	MOV	0x22, #50
	ORL	0x34, #04
	MOV	0x21, 0x32
	sjmp	00113$
00106$:
;	cooperative.c:203: } else if ((threadBitMap & 0x08) == 0x00) {
	mov	a,_threadBitMap
	jb	acc.3,00113$
;	cooperative.c:208: __endasm;
	MOV	0x22, #51
	ORL	0x34, #08
	MOV	0x21, 0x33
00113$:
;	cooperative.c:220: __endasm;
	MOV	0x20, sp
	MOV	sp, 0x21
;	cooperative.c:232: __endasm;
	PUSH	DPL
	PUSH	DPH
;	cooperative.c:246: __endasm;
	MOV	A, 0x00
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
;	cooperative.c:262: switch (createdThreadID) {
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
;	cooperative.c:263: case '0':
	cjne	r7,#0x33,00119$
	sjmp	00117$
00114$:
;	cooperative.c:268: __endasm;
	MOV	PSW, #0x00
	PUSH	PSW
	MOV	0x30, SP
;	cooperative.c:269: break;
;	cooperative.c:270: case '1':
	sjmp	00119$
00115$:
;	cooperative.c:275: __endasm;
	MOV	PSW, #0x08
	PUSH	PSW
	MOV	0x31, SP
;	cooperative.c:276: break;
;	cooperative.c:277: case '2':
	sjmp	00119$
00116$:
;	cooperative.c:282: __endasm;
	MOV	PSW, #0x10
	PUSH	PSW
	MOV	0x32, SP
;	cooperative.c:283: break;
;	cooperative.c:284: case '3':
	sjmp	00119$
00117$:
;	cooperative.c:289: __endasm;
	MOV	PSW, #0x18
	PUSH	PSW
	MOV	0x33, SP
;	cooperative.c:293: }
00119$:
;	cooperative.c:300: __endasm;
	MOV	sp, 0x20
;	cooperative.c:304: return createdThreadID;
	mov	dpl,_createdThreadID
;	cooperative.c:305: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	cooperative.c:314: void ThreadYield(void) {
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	cooperative.c:315: SAVESTATE;
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
;	cooperative.c:316: do {
00128$:
;	cooperative.c:326: switch (currentThreadID) {
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
;	cooperative.c:327: case '0':
	cjne	r7,#0x33,00112$
	sjmp	00110$
00107$:
;	cooperative.c:328: currentThreadID = '1';
	mov	_currentThreadID,#0x31
;	cooperative.c:329: break;
;	cooperative.c:330: case '1':
	sjmp	00112$
00108$:
;	cooperative.c:331: currentThreadID = '2';
	mov	_currentThreadID,#0x32
;	cooperative.c:332: break;
;	cooperative.c:333: case '2':
	sjmp	00112$
00109$:
;	cooperative.c:334: currentThreadID = '3';
	mov	_currentThreadID,#0x33
;	cooperative.c:335: break;
;	cooperative.c:336: case '3':
	sjmp	00112$
00110$:
;	cooperative.c:337: currentThreadID = '0';
	mov	_currentThreadID,#0x30
;	cooperative.c:341: }
00112$:
;	cooperative.c:342: if ((currentThreadID == '0') && ((threadBitMap & 0x01) == 0x01)) {
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
;	cooperative.c:343: break;
00125$:
;	cooperative.c:344: } else if ((currentThreadID == '1') && ((threadBitMap & 0x02) == 0x02)) {
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
;	cooperative.c:345: break;
00121$:
;	cooperative.c:346: } else if ((currentThreadID == '2') && ((threadBitMap & 0x04) == 0x04)) {
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
;	cooperative.c:347: break;
00117$:
;	cooperative.c:348: } else if ((currentThreadID == '3') && ((threadBitMap & 0x08) == 0x08)) {
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
;	cooperative.c:351: } while (1);
00130$:
;	cooperative.c:352: RESTORESTATE;
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
;	cooperative.c:353: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	cooperative.c:361: void ThreadExit(void) {
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	cooperative.c:368: switch (currentThreadID) {
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
;	cooperative.c:369: case '0':
	cjne	r7,#0x33,00127$
	sjmp	00104$
00101$:
;	cooperative.c:372: __endasm;
	ANL	0x34, #11111110
;	cooperative.c:373: break;
;	cooperative.c:374: case '1':
	sjmp	00127$
00102$:
;	cooperative.c:377: __endasm;
	ANL	0x34, #11111101
;	cooperative.c:378: break;
;	cooperative.c:379: case '2':
	sjmp	00127$
00103$:
;	cooperative.c:382: __endasm;
	ANL	0x34, #11111011
;	cooperative.c:383: break;
;	cooperative.c:384: case '3':
	sjmp	00127$
00104$:
;	cooperative.c:387: __endasm;
	ANL	0x34, #11110111
;	cooperative.c:390: do {
00127$:
;	cooperative.c:391: switch (currentThreadID) {
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
;	cooperative.c:392: case '0':
	cjne	r7,#0x33,00111$
	sjmp	00109$
00106$:
;	cooperative.c:393: currentThreadID = '1';
	mov	_currentThreadID,#0x31
;	cooperative.c:394: break;
;	cooperative.c:395: case '1':
	sjmp	00111$
00107$:
;	cooperative.c:396: currentThreadID = '2';
	mov	_currentThreadID,#0x32
;	cooperative.c:397: break;
;	cooperative.c:398: case '2':
	sjmp	00111$
00108$:
;	cooperative.c:399: currentThreadID = '3';
	mov	_currentThreadID,#0x33
;	cooperative.c:400: break;
;	cooperative.c:401: case '3':
	sjmp	00111$
00109$:
;	cooperative.c:402: currentThreadID = '0';
	mov	_currentThreadID,#0x30
;	cooperative.c:406: }
00111$:
;	cooperative.c:407: if ((currentThreadID == '0') && ((threadBitMap & 0x01) == 0x01)) {
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
;	cooperative.c:408: break;
00124$:
;	cooperative.c:409: } else if ((currentThreadID == '1') && ((threadBitMap & 0x02) == 0x02)) {
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
;	cooperative.c:410: break;
00120$:
;	cooperative.c:411: } else if ((currentThreadID == '2') && ((threadBitMap & 0x04) == 0x04)) {
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
;	cooperative.c:412: break;
00116$:
;	cooperative.c:413: } else if ((currentThreadID == '3') && ((threadBitMap & 0x08) == 0x08)) {
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
;	cooperative.c:416: } while (1);
00129$:
;	cooperative.c:417: RESTORESTATE;
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
;	cooperative.c:418: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
