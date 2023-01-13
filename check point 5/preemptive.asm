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
	.globl _thrd_5
	.globl _thrd_4
	.globl _Time
	.globl _delays
	.globl _spots
	.globl _mutex
	.globl _currentThreadID
	.globl _threadBitMap
	.globl _th3_SP
	.globl _th2_SP
	.globl _th1_SP
	.globl _th0_SP
	.globl _numOfThreads
	.globl _i
	.globl _LeaveTimes
	.globl _EnterTimes
	.globl _createdThreadID
	.globl _createdThreadSP
	.globl _oldSP
	.globl _char_to_int
	.globl _delay
	.globl _now
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
	.globl _PrintParkingResult
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
_oldSP	=	0x0020
_createdThreadSP	=	0x0021
_createdThreadID	=	0x0022
_EnterTimes	=	0x0023
_LeaveTimes	=	0x0028
_i	=	0x002d
_numOfThreads	=	0x002e
_th0_SP	=	0x0030
_th1_SP	=	0x0031
_th2_SP	=	0x0032
_th3_SP	=	0x0033
_threadBitMap	=	0x0034
_currentThreadID	=	0x0035
_mutex	=	0x0036
_spots	=	0x0037
_delays	=	0x0039
_Time	=	0x003c
_thrd_4	=	0x003d
_thrd_5	=	0x003e
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
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
;Allocation info for local variables in function 'char_to_int'
;------------------------------------------------------------
;c                         Allocated to registers r7 
;------------------------------------------------------------
;	preemptive.c:28: int char_to_int(char c) {return c - '0';}
;	-----------------------------------------
;	 function char_to_int
;	-----------------------------------------
_char_to_int:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7,dpl
	mov	r6,#0x00
	mov	a,r7
	add	a,#0xd0
	mov	dpl,a
	mov	a,r6
	addc	a,#0xff
	mov	dph,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;n                         Allocated to registers r7 
;------------------------------------------------------------
;	preemptive.c:30: void delay(unsigned char n) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	mov	r7,dpl
;	preemptive.c:32: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:33: switch (currentThreadID){
	mov	r6,_currentThreadID
	cjne	r6,#0x31,00120$
	sjmp	00101$
00120$:
	cjne	r6,#0x32,00121$
	sjmp	00102$
00121$:
;	preemptive.c:34: case '1':
	cjne	r6,#0x33,00105$
	sjmp	00103$
00101$:
;	preemptive.c:35: delays[0] = n;
	mov	_delays,r7
;	preemptive.c:36: break;
;	preemptive.c:37: case '2':
	sjmp	00105$
00102$:
;	preemptive.c:38: delays[1] = n;
	mov	(_delays + 0x0001),r7
;	preemptive.c:39: break;
;	preemptive.c:40: case '3':
	sjmp	00105$
00103$:
;	preemptive.c:41: delays[2] = n;
	mov	(_delays + 0x0002),r7
;	preemptive.c:45: }
00105$:
;	preemptive.c:46: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:47: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'now'
;------------------------------------------------------------
;	preemptive.c:49: unsigned char now(void) {
;	-----------------------------------------
;	 function now
;	-----------------------------------------
_now:
;	preemptive.c:51: return Time;
	mov	dpl,_Time
;	preemptive.c:52: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:126: void Bootstrap(void) {
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
;	preemptive.c:128: for (i=0; i<2; i++) {
	mov	_i,#0x00
00110$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00101$
;	preemptive.c:129: spots[i] = '_';
	mov	a,_i
	add	a,#_spots
	mov	r0,a
	mov	@r0,#0x5f
;	preemptive.c:128: for (i=0; i<2; i++) {
	inc	_i
	sjmp	00110$
00101$:
;	preemptive.c:131: for (i=0; i<5; i++) {
	mov	_i,#0x00
00113$:
	mov	a,#0x100 - 0x05
	add	a,_i
	jc	00102$
;	preemptive.c:132: EnterTimes[i] = '_';
	mov	a,_i
	add	a,#_EnterTimes
	mov	r0,a
	mov	@r0,#0x5f
;	preemptive.c:133: LeaveTimes[i] = '_';
	mov	a,_i
	add	a,#_LeaveTimes
	mov	r0,a
	mov	@r0,#0x5f
;	preemptive.c:131: for (i=0; i<5; i++) {
	inc	_i
	sjmp	00113$
00102$:
;	preemptive.c:136: thrd_4 = 'x';
	mov	_thrd_4,#0x78
;	preemptive.c:137: thrd_5 = 'x';
	mov	_thrd_5,#0x78
;	preemptive.c:139: threadBitMap = 0x00;
	clr	a
	mov	_threadBitMap,a
	mov	(_threadBitMap + 1),a
;	preemptive.c:140: th0_SP = 0x3F;
	mov	_th0_SP,#0x3f
;	1-genFromRTrack replaced	mov	(_th0_SP + 1),#0x00
	mov	(_th0_SP + 1),a
;	preemptive.c:141: th1_SP = 0x4F;
	mov	_th1_SP,#0x4f
;	1-genFromRTrack replaced	mov	(_th1_SP + 1),#0x00
	mov	(_th1_SP + 1),a
;	preemptive.c:142: th2_SP = 0x5F;
	mov	_th2_SP,#0x5f
;	1-genFromRTrack replaced	mov	(_th2_SP + 1),#0x00
	mov	(_th2_SP + 1),a
;	preemptive.c:143: th3_SP = 0x6F;
	mov	_th3_SP,#0x6f
;	1-genFromRTrack replaced	mov	(_th3_SP + 1),#0x00
	mov	(_th3_SP + 1),a
;	preemptive.c:145: TMOD = 0;
;	1-genFromRTrack replaced	mov	_TMOD,#0x00
	mov	_TMOD,a
;	preemptive.c:146: IE = 0x82;
	mov	_IE,#0x82
;	preemptive.c:147: TR0 = 1;
;	assignBit
	setb	_TR0
;	preemptive.c:149: currentThreadID = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_currentThreadID,dpl
;	preemptive.c:150: Time = 'a' - 1;
	mov	_Time,#0x60
;	preemptive.c:151: numOfThreads = 1;
	mov	_numOfThreads,#0x01
	mov	(_numOfThreads + 1),#0x00
;	preemptive.c:152: RESTORESTATE;
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00151$
	sjmp	00103$
00151$:
	cjne	r7,#0x31,00152$
	sjmp	00104$
00152$:
	cjne	r7,#0x32,00153$
	sjmp	00105$
00153$:
	cjne	r7,#0x33,00108$
	sjmp	00106$
00103$:
	MOV SP, 0x30 
	sjmp	00108$
00104$:
	MOV SP, 0x31 
	sjmp	00108$
00105$:
	MOV SP, 0x32 
	sjmp	00108$
00106$:
	MOV SP, 0x33 
00108$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:153: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:155: void myTimer0Handler(void) {
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	preemptive.c:157: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:158: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00345$
	sjmp	00101$
00345$:
	cjne	r7,#0x31,00346$
	sjmp	00102$
00346$:
	cjne	r7,#0x32,00347$
	sjmp	00103$
00347$:
	cjne	r7,#0x33,00106$
	sjmp	00104$
00101$:
	MOV 0x30, SP 
	sjmp	00106$
00102$:
	MOV 0x31, SP 
	sjmp	00106$
00103$:
	MOV 0x32, SP 
	sjmp	00106$
00104$:
	MOV 0x33, SP 
00106$:
;	preemptive.c:160: Time += 1;
	mov	a,_Time
	mov	r7,a
	inc	a
	mov	_Time,a
;	preemptive.c:161: for (i=0; i<3; i++) {  // decrement delays
	mov	_i,#0x00
00185$:
	mov	a,#0x100 - 0x03
	add	a,_i
	jc	00109$
;	preemptive.c:162: if (delays[i] > '0') {delays[i] -= 1;}
	mov	a,_i
	add	a,#_delays
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	add	a,#0xff - 0x30
	jnc	00186$
	mov	a,_i
	add	a,#_delays
	mov	r1,a
	mov	a,_i
	add	a,#_delays
	mov	r0,a
	mov	a,@r0
	mov	r7,a
	dec	a
	mov	@r1,a
00186$:
;	preemptive.c:161: for (i=0; i<3; i++) {  // decrement delays
	inc	_i
	sjmp	00185$
00109$:
;	preemptive.c:164: if (mutex == 0) {
	mov	a,_mutex
	jz	00351$
	ljmp	00176$
00351$:
;	preemptive.c:166: if ((LeaveTimes[0] == '_') && (delays[0] == '0')) currentThreadID = '1';
	mov	a,#0x5f
	cjne	a,_LeaveTimes,00143$
	mov	a,#0x30
	cjne	a,_delays,00143$
	mov	_currentThreadID,#0x31
	ljmp	00177$
00143$:
;	preemptive.c:167: else if ((LeaveTimes[1] == '_') && (delays[1] == '0')) currentThreadID = '2';
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0001),00139$
	mov	a,#0x30
	cjne	a,(_delays + 0x0001),00139$
	mov	_currentThreadID,#0x32
	ljmp	00177$
00139$:
;	preemptive.c:168: else if ((LeaveTimes[2] == '_') && (delays[2] == '0')) currentThreadID = '3';
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0002),00135$
	mov	a,#0x30
	cjne	a,(_delays + 0x0002),00135$
	mov	_currentThreadID,#0x33
	ljmp	00177$
00135$:
;	preemptive.c:169: else if ((thrd_4 != 'x') && (LeaveTimes[3] == '_') && (delays[char_to_int(thrd_4)] == '0')) currentThreadID = thrd_4 + 1;
	mov	a,#0x78
	cjne	a,_thrd_4,00364$
	sjmp	00130$
00364$:
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0003),00130$
	mov	dpl,_thrd_4
	lcall	_char_to_int
	mov	r6,dpl
	mov	a,r6
	add	a,#_delays
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x30,00130$
	mov	a,_thrd_4
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
	ljmp	00177$
00130$:
;	preemptive.c:170: else if ((thrd_5 != 'x') && (LeaveTimes[4] == '_') && (delays[char_to_int(thrd_5)] == '0')) currentThreadID = thrd_5 + 1;
	mov	a,#0x78
	cjne	a,_thrd_5,00369$
	sjmp	00125$
00369$:
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0004),00125$
	mov	dpl,_thrd_5
	lcall	_char_to_int
	mov	r6,dpl
	mov	a,r6
	add	a,#_delays
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x30,00125$
	mov	a,_thrd_5
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
	ljmp	00177$
00125$:
;	preemptive.c:171: else if (LeaveTimes[0] == '_') currentThreadID = '1';
	mov	a,#0x5f
	cjne	a,_LeaveTimes,00122$
	mov	_currentThreadID,#0x31
	ljmp	00177$
00122$:
;	preemptive.c:172: else if (LeaveTimes[1] == '_') currentThreadID = '2';
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0001),00119$
	mov	_currentThreadID,#0x32
	ljmp	00177$
00119$:
;	preemptive.c:173: else if (LeaveTimes[2] == '_') currentThreadID = '3';
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0002),00116$
	mov	_currentThreadID,#0x33
	ljmp	00177$
00116$:
;	preemptive.c:174: else if (LeaveTimes[3] == '_') currentThreadID = thrd_4 + 1;
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0003),00113$
	mov	a,_thrd_4
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
	ljmp	00177$
00113$:
;	preemptive.c:175: else if (LeaveTimes[4] == '_') currentThreadID = thrd_5 + 1;
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0004),00382$
	sjmp	00383$
00382$:
	ljmp	00177$
00383$:
	mov	a,_thrd_5
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
	ljmp	00177$
00176$:
;	preemptive.c:178: if (EnterTimes[0] == '_') currentThreadID = '1';
	mov	a,#0x5f
	cjne	a,_EnterTimes,00173$
	mov	_currentThreadID,#0x31
	ljmp	00177$
00173$:
;	preemptive.c:179: else if (EnterTimes[1] == '_') currentThreadID = '2';
	mov	a,#0x5f
	cjne	a,(_EnterTimes + 0x0001),00170$
	mov	_currentThreadID,#0x32
	ljmp	00177$
00170$:
;	preemptive.c:180: else if (EnterTimes[2] == '_') currentThreadID = '3';
	mov	a,#0x5f
	cjne	a,(_EnterTimes + 0x0002),00167$
	mov	_currentThreadID,#0x33
	sjmp	00177$
00167$:
;	preemptive.c:181: else if (EnterTimes[3] == '_') currentThreadID = thrd_4 + 1;
	mov	a,#0x5f
	cjne	a,(_EnterTimes + 0x0003),00164$
	mov	a,_thrd_4
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
	sjmp	00177$
00164$:
;	preemptive.c:182: else if (EnterTimes[4] == '_') currentThreadID = thrd_5 + 1;
	mov	a,#0x5f
	cjne	a,(_EnterTimes + 0x0004),00161$
	mov	a,_thrd_5
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
	sjmp	00177$
00161$:
;	preemptive.c:183: else if (LeaveTimes[0] == '_') currentThreadID = '1';
	mov	a,#0x5f
	cjne	a,_LeaveTimes,00158$
	mov	_currentThreadID,#0x31
	sjmp	00177$
00158$:
;	preemptive.c:184: else if (LeaveTimes[1] == '_') currentThreadID = '2';
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0001),00155$
	mov	_currentThreadID,#0x32
	sjmp	00177$
00155$:
;	preemptive.c:185: else if (LeaveTimes[2] == '_') currentThreadID = '3';
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0002),00152$
	mov	_currentThreadID,#0x33
	sjmp	00177$
00152$:
;	preemptive.c:186: else if (LeaveTimes[3] == '_') currentThreadID = thrd_4 + 1;
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0003),00149$
	mov	a,_thrd_4
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
	sjmp	00177$
00149$:
;	preemptive.c:187: else if (LeaveTimes[4] == '_') currentThreadID = thrd_5 + 1;
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0004),00177$
	mov	a,_thrd_5
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
00177$:
;	preemptive.c:190: RESTORESTATE;
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00404$
	sjmp	00178$
00404$:
	cjne	r7,#0x31,00405$
	sjmp	00179$
00405$:
	cjne	r7,#0x32,00406$
	sjmp	00180$
00406$:
	cjne	r7,#0x33,00183$
	sjmp	00181$
00178$:
	MOV SP, 0x30 
	sjmp	00183$
00179$:
	MOV SP, 0x31 
	sjmp	00183$
00180$:
	MOV SP, 0x32 
	sjmp	00183$
00181$:
	MOV SP, 0x33 
00183$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:191: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:195: __endasm;
	RETI
;	preemptive.c:196: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;------------------------------------------------------------
;	preemptive.c:198: ThreadID ThreadCreate(FunctionPtr fp) {
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemptive.c:200: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:202: if ((threadBitMap & 0xFF) == 0xFF) {  // maximum threads existed
	mov	r6,_threadBitMap
	mov	a,(_threadBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0xff,00102$
	cjne	r7,#0x00,00102$
;	preemptive.c:203: return -1;
	mov	dpl,#0xff
	ret
00102$:
;	preemptive.c:206: numOfThreads ++;
	mov	a,#0x01
	add	a,_numOfThreads
	mov	_numOfThreads,a
	clr	a
	addc	a,(_numOfThreads + 1)
	mov	(_numOfThreads + 1),a
;	preemptive.c:207: createdThreadID = 'x';
	mov	_createdThreadID,#0x78
;	preemptive.c:208: if ((threadBitMap & 0x01) == 0x00) {
	mov	a,_threadBitMap
	jb	acc.0,00112$
;	preemptive.c:213: __endasm;
	MOV	0x22, #48
	ORL	0x34, #01
	MOV	0x21, 0x30
	sjmp	00113$
00112$:
;	preemptive.c:214: } else if ((threadBitMap & 0x02) == 0x00) {
	mov	a,_threadBitMap
	jb	acc.1,00109$
;	preemptive.c:219: __endasm;
	MOV	0x22, #49
	ORL	0x34, #02
	MOV	0x21, 0x31
	sjmp	00113$
00109$:
;	preemptive.c:220: } else if ((threadBitMap & 0x04) == 0x00) {
	mov	a,_threadBitMap
	jb	acc.2,00106$
;	preemptive.c:225: __endasm;
	MOV	0x22, #50
	ORL	0x34, #04
	MOV	0x21, 0x32
	sjmp	00113$
00106$:
;	preemptive.c:226: } else if ((threadBitMap & 0x08) == 0x00) {
	mov	a,_threadBitMap
	jb	acc.3,00113$
;	preemptive.c:231: __endasm;
	MOV	0x22, #51
	ORL	0x34, #08
	MOV	0x21, 0x33
00113$:
;	preemptive.c:237: __endasm;
	MOV	0x20, sp
	MOV	sp, 0x21
;	preemptive.c:242: __endasm;
	PUSH	DPL
	PUSH	DPH
;	preemptive.c:250: __endasm;
	MOV	A, 0x00
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
;	preemptive.c:252: switch (createdThreadID) {
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
;	preemptive.c:253: case '0':
	cjne	r7,#0x33,00119$
	sjmp	00117$
00114$:
;	preemptive.c:258: __endasm;
	MOV	PSW, #0x00
	PUSH	PSW
	MOV	0x30, SP
;	preemptive.c:259: break;
;	preemptive.c:260: case '1':
	sjmp	00119$
00115$:
;	preemptive.c:265: __endasm;
	MOV	PSW, #0x08
	PUSH	PSW
	MOV	0x31, SP
;	preemptive.c:266: delays[0] = '0';               
	mov	_delays,#0x30
;	preemptive.c:267: break;
;	preemptive.c:268: case '2':
	sjmp	00119$
00116$:
;	preemptive.c:273: __endasm;
	MOV	PSW, #0x10
	PUSH	PSW
	MOV	0x32, SP
;	preemptive.c:274: delays[1] = '0';               
	mov	(_delays + 0x0001),#0x30
;	preemptive.c:275: break;
;	preemptive.c:276: case '3':
	sjmp	00119$
00117$:
;	preemptive.c:281: __endasm;
	MOV	PSW, #0x18
	PUSH	PSW
	MOV	0x33, SP
;	preemptive.c:282: delays[2] = '0';               
	mov	(_delays + 0x0002),#0x30
;	preemptive.c:286: }
00119$:
;	preemptive.c:290: __endasm;
	MOV	sp, 0x20
;	preemptive.c:292: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:293: return createdThreadID;
	mov	dpl,_createdThreadID
;	preemptive.c:294: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:296: void ThreadYield(void) {
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	preemptive.c:298: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:299: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00345$
	sjmp	00101$
00345$:
	cjne	r7,#0x31,00346$
	sjmp	00102$
00346$:
	cjne	r7,#0x32,00347$
	sjmp	00103$
00347$:
	cjne	r7,#0x33,00106$
	sjmp	00104$
00101$:
	MOV 0x30, SP 
	sjmp	00106$
00102$:
	MOV 0x31, SP 
	sjmp	00106$
00103$:
	MOV 0x32, SP 
	sjmp	00106$
00104$:
	MOV 0x33, SP 
00106$:
;	preemptive.c:301: Time += 1;      
	mov	a,_Time
	mov	r7,a
	inc	a
	mov	_Time,a
;	preemptive.c:302: for (i=0; i<3; i++) {  // decrement delays
	mov	_i,#0x00
00185$:
	mov	a,#0x100 - 0x03
	add	a,_i
	jc	00109$
;	preemptive.c:303: if (delays[i] > '0') {delays[i] -= 1;}
	mov	a,_i
	add	a,#_delays
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	add	a,#0xff - 0x30
	jnc	00186$
	mov	a,_i
	add	a,#_delays
	mov	r1,a
	mov	a,_i
	add	a,#_delays
	mov	r0,a
	mov	a,@r0
	mov	r7,a
	dec	a
	mov	@r1,a
00186$:
;	preemptive.c:302: for (i=0; i<3; i++) {  // decrement delays
	inc	_i
	sjmp	00185$
00109$:
;	preemptive.c:305: if (mutex == 0) {
	mov	a,_mutex
	jz	00351$
	ljmp	00176$
00351$:
;	preemptive.c:307: if ((LeaveTimes[0] == '_') && (delays[0] == '0')) currentThreadID = '1';
	mov	a,#0x5f
	cjne	a,_LeaveTimes,00143$
	mov	a,#0x30
	cjne	a,_delays,00143$
	mov	_currentThreadID,#0x31
	ljmp	00177$
00143$:
;	preemptive.c:308: else if ((LeaveTimes[1] == '_') && (delays[1] == '0')) currentThreadID = '2';
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0001),00139$
	mov	a,#0x30
	cjne	a,(_delays + 0x0001),00139$
	mov	_currentThreadID,#0x32
	ljmp	00177$
00139$:
;	preemptive.c:309: else if ((LeaveTimes[2] == '_') && (delays[2] == '0')) currentThreadID = '3';
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0002),00135$
	mov	a,#0x30
	cjne	a,(_delays + 0x0002),00135$
	mov	_currentThreadID,#0x33
	ljmp	00177$
00135$:
;	preemptive.c:310: else if ((thrd_4 != 'x') && (LeaveTimes[3] == '_') && (delays[char_to_int(thrd_4)] == '0')) currentThreadID = thrd_4 + 1;
	mov	a,#0x78
	cjne	a,_thrd_4,00364$
	sjmp	00130$
00364$:
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0003),00130$
	mov	dpl,_thrd_4
	lcall	_char_to_int
	mov	r6,dpl
	mov	a,r6
	add	a,#_delays
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x30,00130$
	mov	a,_thrd_4
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
	ljmp	00177$
00130$:
;	preemptive.c:311: else if ((thrd_5 != 'x') && (LeaveTimes[4] == '_') && (delays[char_to_int(thrd_5)] == '0')) currentThreadID = thrd_5 + 1;
	mov	a,#0x78
	cjne	a,_thrd_5,00369$
	sjmp	00125$
00369$:
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0004),00125$
	mov	dpl,_thrd_5
	lcall	_char_to_int
	mov	r6,dpl
	mov	a,r6
	add	a,#_delays
	mov	r1,a
	mov	ar7,@r1
	cjne	r7,#0x30,00125$
	mov	a,_thrd_5
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
	ljmp	00177$
00125$:
;	preemptive.c:312: else if (LeaveTimes[0] == '_') currentThreadID = '1';
	mov	a,#0x5f
	cjne	a,_LeaveTimes,00122$
	mov	_currentThreadID,#0x31
	ljmp	00177$
00122$:
;	preemptive.c:313: else if (LeaveTimes[1] == '_') currentThreadID = '2';
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0001),00119$
	mov	_currentThreadID,#0x32
	ljmp	00177$
00119$:
;	preemptive.c:314: else if (LeaveTimes[2] == '_') currentThreadID = '3';
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0002),00116$
	mov	_currentThreadID,#0x33
	ljmp	00177$
00116$:
;	preemptive.c:315: else if (LeaveTimes[3] == '_') currentThreadID = thrd_4 + 1;
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0003),00113$
	mov	a,_thrd_4
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
	ljmp	00177$
00113$:
;	preemptive.c:316: else if (LeaveTimes[4] == '_') currentThreadID = thrd_5 + 1;
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0004),00382$
	sjmp	00383$
00382$:
	ljmp	00177$
00383$:
	mov	a,_thrd_5
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
	ljmp	00177$
00176$:
;	preemptive.c:319: if (EnterTimes[0] == '_') currentThreadID = '1';
	mov	a,#0x5f
	cjne	a,_EnterTimes,00173$
	mov	_currentThreadID,#0x31
	ljmp	00177$
00173$:
;	preemptive.c:320: else if (EnterTimes[1] == '_') currentThreadID = '2';
	mov	a,#0x5f
	cjne	a,(_EnterTimes + 0x0001),00170$
	mov	_currentThreadID,#0x32
	ljmp	00177$
00170$:
;	preemptive.c:321: else if (EnterTimes[2] == '_') currentThreadID = '3';
	mov	a,#0x5f
	cjne	a,(_EnterTimes + 0x0002),00167$
	mov	_currentThreadID,#0x33
	sjmp	00177$
00167$:
;	preemptive.c:322: else if (EnterTimes[3] == '_') currentThreadID = thrd_4 + 1;
	mov	a,#0x5f
	cjne	a,(_EnterTimes + 0x0003),00164$
	mov	a,_thrd_4
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
	sjmp	00177$
00164$:
;	preemptive.c:323: else if (EnterTimes[4] == '_') currentThreadID = thrd_5 + 1;
	mov	a,#0x5f
	cjne	a,(_EnterTimes + 0x0004),00161$
	mov	a,_thrd_5
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
	sjmp	00177$
00161$:
;	preemptive.c:324: else if (LeaveTimes[0] == '_') currentThreadID = '1';
	mov	a,#0x5f
	cjne	a,_LeaveTimes,00158$
	mov	_currentThreadID,#0x31
	sjmp	00177$
00158$:
;	preemptive.c:325: else if (LeaveTimes[1] == '_') currentThreadID = '2';
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0001),00155$
	mov	_currentThreadID,#0x32
	sjmp	00177$
00155$:
;	preemptive.c:326: else if (LeaveTimes[2] == '_') currentThreadID = '3';
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0002),00152$
	mov	_currentThreadID,#0x33
	sjmp	00177$
00152$:
;	preemptive.c:327: else if (LeaveTimes[3] == '_') currentThreadID = thrd_4 + 1;
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0003),00149$
	mov	a,_thrd_4
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
	sjmp	00177$
00149$:
;	preemptive.c:328: else if (LeaveTimes[4] == '_') currentThreadID = thrd_5 + 1;
	mov	a,#0x5f
	cjne	a,(_LeaveTimes + 0x0004),00177$
	mov	a,_thrd_5
	mov	r7,a
	inc	a
	mov	_currentThreadID,a
00177$:
;	preemptive.c:330: RESTORESTATE;
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00404$
	sjmp	00178$
00404$:
	cjne	r7,#0x31,00405$
	sjmp	00179$
00405$:
	cjne	r7,#0x32,00406$
	sjmp	00180$
00406$:
	cjne	r7,#0x33,00183$
	sjmp	00181$
00178$:
	MOV SP, 0x30 
	sjmp	00183$
00179$:
	MOV SP, 0x31 
	sjmp	00183$
00180$:
	MOV SP, 0x32 
	sjmp	00183$
00181$:
	MOV SP, 0x33 
00183$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:331: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:332: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemptive.c:336: void ThreadExit(void) {
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	preemptive.c:338: numOfThreads --;
	dec	_numOfThreads
	mov	a,#0xff
	cjne	a,_numOfThreads,00199$
	dec	(_numOfThreads + 1)
00199$:
;	preemptive.c:339: switch (currentThreadID) {
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00200$
	sjmp	00101$
00200$:
	cjne	r7,#0x31,00201$
	sjmp	00102$
00201$:
	cjne	r7,#0x32,00202$
	sjmp	00103$
00202$:
;	preemptive.c:340: case '0':
	cjne	r7,#0x33,00105$
	sjmp	00104$
00101$:
;	preemptive.c:343: __endasm;
	ANL	0x34, #0xFE
;	preemptive.c:344: break;
;	preemptive.c:345: case '1':
	sjmp	00105$
00102$:
;	preemptive.c:348: __endasm;
	ANL	0x34, #0xFD
;	preemptive.c:349: delays[0] = '-';            
	mov	_delays,#0x2d
;	preemptive.c:350: break;
;	preemptive.c:351: case '2':
	sjmp	00105$
00103$:
;	preemptive.c:354: __endasm;
	ANL	0x34, #0xFB
;	preemptive.c:355: delays[1] = '-';            
	mov	(_delays + 0x0001),#0x2d
;	preemptive.c:356: break;
;	preemptive.c:357: case '3':
	sjmp	00105$
00104$:
;	preemptive.c:360: __endasm;
	ANL	0x34, #0xF7
;	preemptive.c:361: delays[2] = '-';            
	mov	(_delays + 0x0002),#0x2d
;	preemptive.c:363: }
00105$:
;	preemptive.c:364: if (currentThreadID == '0') {
	mov	a,#0x30
	cjne	a,_currentThreadID,00123$
;	preemptive.c:366: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:367: PrintParkingResult();
	lcall	_PrintParkingResult
;	preemptive.c:368: while (1) {}  // infinite loop
00107$:
	sjmp	00107$
00123$:
;	preemptive.c:371: if (thrd_4 == 'x') thrd_4 = (currentThreadID == '1') ? '0' : '1';
	mov	a,#0x78
	cjne	a,_thrd_4,00120$
	mov	a,#0x31
	cjne	a,_currentThreadID,00133$
	mov	r6,#0x30
	mov	r7,#0x00
	sjmp	00134$
00133$:
	mov	r6,#0x31
	mov	r7,#0x00
00134$:
	mov	_thrd_4,r6
	sjmp	00121$
00120$:
;	preemptive.c:372: else if (thrd_5 == 'x') {
	mov	a,#0x78
	cjne	a,_thrd_5,00121$
;	preemptive.c:373: if (currentThreadID == '1') thrd_5 = '0';
	mov	a,#0x31
	cjne	a,_currentThreadID,00115$
	mov	_thrd_5,#0x30
	sjmp	00121$
00115$:
;	preemptive.c:374: else if (currentThreadID == '2') thrd_5 = '1';
	mov	a,#0x32
	cjne	a,_currentThreadID,00112$
	mov	_thrd_5,#0x31
	sjmp	00121$
00112$:
;	preemptive.c:375: else if (currentThreadID == '3') thrd_5 = '2';
	mov	a,#0x33
	cjne	a,_currentThreadID,00121$
	mov	_thrd_5,#0x32
00121$:
;	preemptive.c:377: currentThreadID = '0';
	mov	_currentThreadID,#0x30
;	preemptive.c:379: RESTORESTATE;
	mov	r7,_currentThreadID
	cjne	r7,#0x30,00218$
	sjmp	00125$
00218$:
	cjne	r7,#0x31,00219$
	sjmp	00126$
00219$:
	cjne	r7,#0x32,00220$
	sjmp	00127$
00220$:
	cjne	r7,#0x33,00130$
	sjmp	00128$
00125$:
	MOV SP, 0x30 
	sjmp	00130$
00126$:
	MOV SP, 0x31 
	sjmp	00130$
00127$:
	MOV SP, 0x32 
	sjmp	00130$
00128$:
	MOV SP, 0x33 
00130$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:380: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PrintParkingResult'
;------------------------------------------------------------
;	preemptive.c:382: void PrintParkingResult() {
;	-----------------------------------------
;	 function PrintParkingResult
;	-----------------------------------------
_PrintParkingResult:
;	preemptive.c:386: while (!TI) {}
00101$:
	jnb	_TI,00101$
;	preemptive.c:387: SBUF = '1';
	mov	_SBUF,#0x31
;	preemptive.c:388: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:389: while (!TI) {}
00104$:
	jnb	_TI,00104$
;	preemptive.c:390: SBUF = ':';
	mov	_SBUF,#0x3a
;	preemptive.c:391: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:392: while (!TI) {}
00107$:
	jnb	_TI,00107$
;	preemptive.c:393: SBUF = EnterTimes[0];
	mov	_SBUF,_EnterTimes
;	preemptive.c:394: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:395: while (!TI) {}
00110$:
	jnb	_TI,00110$
;	preemptive.c:396: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:397: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:398: while (!TI) {}
00113$:
	jnb	_TI,00113$
;	preemptive.c:399: SBUF = LeaveTimes[0] - 1;
	mov	a,_LeaveTimes
	dec	a
	mov	_SBUF,a
;	preemptive.c:400: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:401: while (!TI) {}
00116$:
	jnb	_TI,00116$
;	preemptive.c:402: SBUF = '|';
	mov	_SBUF,#0x7c
;	preemptive.c:403: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:405: while (!TI) {}
00119$:
	jnb	_TI,00119$
;	preemptive.c:406: SBUF = '2';
	mov	_SBUF,#0x32
;	preemptive.c:407: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:408: while (!TI) {}
00122$:
	jnb	_TI,00122$
;	preemptive.c:409: SBUF = ':';
	mov	_SBUF,#0x3a
;	preemptive.c:410: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:411: while (!TI) {}
00125$:
	jnb	_TI,00125$
;	preemptive.c:412: SBUF = EnterTimes[1] - 1;
	mov	a,(_EnterTimes + 0x0001)
	dec	a
	mov	_SBUF,a
;	preemptive.c:413: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:414: while (!TI) {}
00128$:
	jnb	_TI,00128$
;	preemptive.c:415: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:416: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:417: while (!TI) {}
00131$:
	jnb	_TI,00131$
;	preemptive.c:418: SBUF = LeaveTimes[1] - 2;
	mov	a,(_LeaveTimes + 0x0001)
	add	a,#0xfe
	mov	_SBUF,a
;	preemptive.c:419: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:420: while (!TI) {}
00134$:
	jnb	_TI,00134$
;	preemptive.c:421: SBUF = '|';
	mov	_SBUF,#0x7c
;	preemptive.c:422: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:424: while (!TI) {}
00137$:
	jnb	_TI,00137$
;	preemptive.c:425: SBUF = '3';
	mov	_SBUF,#0x33
;	preemptive.c:426: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:427: while (!TI) {}
00140$:
	jnb	_TI,00140$
;	preemptive.c:428: SBUF = ':';
	mov	_SBUF,#0x3a
;	preemptive.c:429: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:430: if ((EnterTimes[2] - LeaveTimes[0]) == 1) {
	mov	r6,(_EnterTimes + 0x0002)
	mov	r7,#0x00
	mov	r4,_LeaveTimes
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00164$
	cjne	r7,#0x00,00164$
;	preemptive.c:431: while (!TI) {}
00143$:
	jnb	_TI,00143$
;	preemptive.c:432: SBUF = EnterTimes[2] - 1;
	mov	a,(_EnterTimes + 0x0002)
	dec	a
	mov	_SBUF,a
;	preemptive.c:433: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:434: while (!TI) {}
00146$:
	jnb	_TI,00146$
;	preemptive.c:435: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:436: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:437: while (!TI) {}
00149$:
	jnb	_TI,00149$
;	preemptive.c:438: SBUF = LeaveTimes[2] - 2;
	mov	a,(_LeaveTimes + 0x0002)
	mov	r7,a
	add	a,#0xfe
	mov	_SBUF,a
;	preemptive.c:439: TI = 0;
;	assignBit
	clr	_TI
	sjmp	00166$
00164$:
;	preemptive.c:440: } else if ((EnterTimes[2] - LeaveTimes[1]) == 1) {
	mov	r6,(_EnterTimes + 0x0002)
	mov	r7,#0x00
	mov	r4,(_LeaveTimes + 0x0001)
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00166$
	cjne	r7,#0x00,00166$
;	preemptive.c:441: while (!TI) {}
00152$:
	jnb	_TI,00152$
;	preemptive.c:442: SBUF = EnterTimes[2] - 2;
	mov	a,(_EnterTimes + 0x0002)
	add	a,#0xfe
	mov	_SBUF,a
;	preemptive.c:443: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:444: while (!TI) {}
00155$:
	jnb	_TI,00155$
;	preemptive.c:445: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:446: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:447: while (!TI) {}
00158$:
	jnb	_TI,00158$
;	preemptive.c:448: SBUF = LeaveTimes[2] - 3;
	mov	a,(_LeaveTimes + 0x0002)
	mov	r7,a
	add	a,#0xfd
	mov	_SBUF,a
;	preemptive.c:449: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:451: while (!TI) {}
00166$:
	jnb	_TI,00166$
;	preemptive.c:452: SBUF = '|';
	mov	_SBUF,#0x7c
;	preemptive.c:453: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:455: while (!TI) {}
00169$:
	jnb	_TI,00169$
;	preemptive.c:456: SBUF = '4';
	mov	_SBUF,#0x34
;	preemptive.c:457: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:458: while (!TI) {}
00172$:
	jnb	_TI,00172$
;	preemptive.c:459: SBUF = ':';
	mov	_SBUF,#0x3a
;	preemptive.c:460: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:461: if ((EnterTimes[3] - LeaveTimes[0]) == 1) {
	mov	r6,(_EnterTimes + 0x0003)
	mov	r7,#0x00
	mov	r4,_LeaveTimes
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00222$
	cjne	r7,#0x00,00222$
;	preemptive.c:462: while (!TI) {}
00175$:
	jnb	_TI,00175$
;	preemptive.c:463: SBUF = EnterTimes[3] - 1;
	mov	a,(_EnterTimes + 0x0003)
	dec	a
	mov	_SBUF,a
;	preemptive.c:464: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:465: while (!TI) {}
00178$:
	jnb	_TI,00178$
;	preemptive.c:466: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:467: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:468: while (!TI) {}
00181$:
	jnb	_TI,00181$
;	preemptive.c:469: SBUF = LeaveTimes[3] - 2;
	mov	a,(_LeaveTimes + 0x0003)
	mov	r7,a
	add	a,#0xfe
	mov	_SBUF,a
;	preemptive.c:470: TI = 0;
;	assignBit
	clr	_TI
	ljmp	00224$
00222$:
;	preemptive.c:471: } else if ((EnterTimes[3] - LeaveTimes[1]) == 1){
	mov	r6,(_EnterTimes + 0x0003)
	mov	r7,#0x00
	mov	r4,(_LeaveTimes + 0x0001)
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00219$
	cjne	r7,#0x00,00219$
;	preemptive.c:472: while (!TI) {}
00184$:
	jnb	_TI,00184$
;	preemptive.c:473: SBUF = EnterTimes[3] - 2;
	mov	a,(_EnterTimes + 0x0003)
	add	a,#0xfe
	mov	_SBUF,a
;	preemptive.c:474: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:475: while (!TI) {}
00187$:
	jnb	_TI,00187$
;	preemptive.c:476: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:477: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:478: while (!TI) {}
00190$:
	jnb	_TI,00190$
;	preemptive.c:479: SBUF = LeaveTimes[3] - 3;
	mov	a,(_LeaveTimes + 0x0003)
	mov	r7,a
	add	a,#0xfd
	mov	_SBUF,a
;	preemptive.c:480: TI = 0;
;	assignBit
	clr	_TI
	ljmp	00224$
00219$:
;	preemptive.c:481: } else if ((EnterTimes[3] - LeaveTimes[2]) == 1) {
	mov	r6,(_EnterTimes + 0x0003)
	mov	r7,#0x00
	mov	r4,(_LeaveTimes + 0x0002)
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00224$
	cjne	r7,#0x00,00224$
;	preemptive.c:482: if ((EnterTimes[2] - LeaveTimes[0]) == 1) {
	mov	r6,(_EnterTimes + 0x0002)
	mov	r7,#0x00
	mov	r4,_LeaveTimes
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00214$
	cjne	r7,#0x00,00214$
;	preemptive.c:483: while (!TI) {}
00193$:
	jnb	_TI,00193$
;	preemptive.c:484: SBUF = EnterTimes[3] - 2;
	mov	a,(_EnterTimes + 0x0003)
	add	a,#0xfe
	mov	_SBUF,a
;	preemptive.c:485: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:486: while (!TI) {}
00196$:
	jnb	_TI,00196$
;	preemptive.c:487: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:488: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:489: while (!TI) {}
00199$:
	jnb	_TI,00199$
;	preemptive.c:490: SBUF = LeaveTimes[3] - 3;
	mov	a,(_LeaveTimes + 0x0003)
	mov	r7,a
	add	a,#0xfd
	mov	_SBUF,a
;	preemptive.c:491: TI = 0;
;	assignBit
	clr	_TI
	sjmp	00224$
00214$:
;	preemptive.c:492: } else if ((EnterTimes[2] - LeaveTimes[1]) == 1) {
	mov	r6,(_EnterTimes + 0x0002)
	mov	r7,#0x00
	mov	r4,(_LeaveTimes + 0x0001)
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00224$
	cjne	r7,#0x00,00224$
;	preemptive.c:493: while (!TI) {}
00202$:
	jnb	_TI,00202$
;	preemptive.c:494: SBUF = EnterTimes[3] - 3;
	mov	a,(_EnterTimes + 0x0003)
	add	a,#0xfd
	mov	_SBUF,a
;	preemptive.c:495: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:496: while (!TI) {}
00205$:
	jnb	_TI,00205$
;	preemptive.c:497: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:498: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:499: while (!TI) {}
00208$:
	jnb	_TI,00208$
;	preemptive.c:500: SBUF = LeaveTimes[3] - 4;
	mov	a,(_LeaveTimes + 0x0003)
	mov	r7,a
	add	a,#0xfc
	mov	_SBUF,a
;	preemptive.c:501: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:504: while (!TI) {}
00224$:
	jnb	_TI,00224$
;	preemptive.c:505: SBUF = '|';
	mov	_SBUF,#0x7c
;	preemptive.c:506: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:508: while (!TI) {}
00227$:
	jnb	_TI,00227$
;	preemptive.c:509: SBUF = '5';
	mov	_SBUF,#0x35
;	preemptive.c:510: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:511: while (!TI) {}
00230$:
	jnb	_TI,00230$
;	preemptive.c:512: SBUF = ':';
	mov	_SBUF,#0x3a
;	preemptive.c:513: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:514: if ((EnterTimes[4] - LeaveTimes[0]) == 1) {
	mov	r6,(_EnterTimes + 0x0004)
	mov	r7,#0x00
	mov	r4,_LeaveTimes
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00332$
	cjne	r7,#0x00,00332$
;	preemptive.c:515: while (!TI) {}
00233$:
	jnb	_TI,00233$
;	preemptive.c:516: SBUF = EnterTimes[4] - 1;
	mov	a,(_EnterTimes + 0x0004)
	dec	a
	mov	_SBUF,a
;	preemptive.c:517: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:518: while (!TI) {}
00236$:
	jnb	_TI,00236$
;	preemptive.c:519: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:520: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:521: while (!TI) {}
00239$:
	jnb	_TI,00239$
;	preemptive.c:522: SBUF = LeaveTimes[4] - 2;
	mov	a,(_LeaveTimes + 0x0004)
	mov	r7,a
	add	a,#0xfe
	mov	_SBUF,a
;	preemptive.c:523: TI = 0;
;	assignBit
	clr	_TI
	ljmp	00334$
00332$:
;	preemptive.c:524: } else if ((EnterTimes[4] - LeaveTimes[1]) == 1){
	mov	r6,(_EnterTimes + 0x0004)
	mov	r7,#0x00
	mov	r4,(_LeaveTimes + 0x0001)
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00329$
	cjne	r7,#0x00,00329$
;	preemptive.c:525: while (!TI) {}
00242$:
	jnb	_TI,00242$
;	preemptive.c:526: SBUF = EnterTimes[4] - 2;
	mov	a,(_EnterTimes + 0x0004)
	add	a,#0xfe
	mov	_SBUF,a
;	preemptive.c:527: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:528: while (!TI) {}
00245$:
	jnb	_TI,00245$
;	preemptive.c:529: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:530: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:531: while (!TI) {}
00248$:
	jnb	_TI,00248$
;	preemptive.c:532: SBUF = LeaveTimes[4] - 3;
	mov	a,(_LeaveTimes + 0x0004)
	mov	r7,a
	add	a,#0xfd
	mov	_SBUF,a
;	preemptive.c:533: TI = 0;
;	assignBit
	clr	_TI
	ljmp	00334$
00329$:
;	preemptive.c:534: } else if ((EnterTimes[4] - LeaveTimes[2]) == 1) {
	mov	r6,(_EnterTimes + 0x0004)
	mov	r7,#0x00
	mov	r4,(_LeaveTimes + 0x0002)
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00921$
	cjne	r7,#0x00,00921$
	sjmp	00922$
00921$:
	sjmp	00326$
00922$:
;	preemptive.c:535: if ((EnterTimes[2] - LeaveTimes[0]) == 1) {
	mov	r6,(_EnterTimes + 0x0002)
	mov	r7,#0x00
	mov	r4,_LeaveTimes
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00272$
	cjne	r7,#0x00,00272$
;	preemptive.c:536: while (!TI) {}
00251$:
	jnb	_TI,00251$
;	preemptive.c:537: SBUF = EnterTimes[4] - 2;
	mov	a,(_EnterTimes + 0x0004)
	add	a,#0xfe
	mov	_SBUF,a
;	preemptive.c:538: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:539: while (!TI) {}
00254$:
	jnb	_TI,00254$
;	preemptive.c:540: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:541: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:542: while (!TI) {}
00257$:
	jnb	_TI,00257$
;	preemptive.c:543: SBUF = LeaveTimes[4] - 3;
	mov	a,(_LeaveTimes + 0x0004)
	mov	r7,a
	add	a,#0xfd
	mov	_SBUF,a
;	preemptive.c:544: TI = 0;
;	assignBit
	clr	_TI
	ljmp	00334$
00272$:
;	preemptive.c:545: } else if ((EnterTimes[2] - LeaveTimes[1]) == 1) {
	mov	r6,(_EnterTimes + 0x0002)
	mov	r7,#0x00
	mov	r4,(_LeaveTimes + 0x0001)
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00928$
	cjne	r7,#0x00,00928$
	sjmp	00929$
00928$:
	ljmp	00334$
00929$:
;	preemptive.c:546: while (!TI) {}
00260$:
	jnb	_TI,00260$
;	preemptive.c:547: SBUF = EnterTimes[4] - 3;
	mov	a,(_EnterTimes + 0x0004)
	add	a,#0xfd
	mov	_SBUF,a
;	preemptive.c:548: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:549: while (!TI) {}
00263$:
	jnb	_TI,00263$
;	preemptive.c:550: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:551: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:552: while (!TI) {}
00266$:
	jnb	_TI,00266$
;	preemptive.c:553: SBUF = LeaveTimes[4] - 4;
	mov	a,(_LeaveTimes + 0x0004)
	mov	r7,a
	add	a,#0xfc
	mov	_SBUF,a
;	preemptive.c:554: TI = 0;
;	assignBit
	clr	_TI
	ljmp	00334$
00326$:
;	preemptive.c:556: } else if ((EnterTimes[4] - LeaveTimes[3]) == 1) {
	mov	r6,(_EnterTimes + 0x0004)
	mov	r7,#0x00
	mov	r4,(_LeaveTimes + 0x0003)
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00933$
	cjne	r7,#0x00,00933$
	sjmp	00934$
00933$:
	ljmp	00334$
00934$:
;	preemptive.c:557: if ((EnterTimes[3] - LeaveTimes[0]) == 1) {
	mov	r6,(_EnterTimes + 0x0003)
	mov	r7,#0x00
	mov	r4,_LeaveTimes
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00321$
	cjne	r7,#0x00,00321$
;	preemptive.c:558: while (!TI) {}
00274$:
	jnb	_TI,00274$
;	preemptive.c:559: SBUF = EnterTimes[4] - 2;
	mov	a,(_EnterTimes + 0x0004)
	add	a,#0xfe
	mov	_SBUF,a
;	preemptive.c:560: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:561: while (!TI) {}
00277$:
	jnb	_TI,00277$
;	preemptive.c:562: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:563: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:564: while (!TI) {}
00280$:
	jnb	_TI,00280$
;	preemptive.c:565: SBUF = LeaveTimes[4] - 3;
	mov	a,(_LeaveTimes + 0x0004)
	mov	r7,a
	add	a,#0xfd
	mov	_SBUF,a
;	preemptive.c:566: TI = 0;
;	assignBit
	clr	_TI
	ljmp	00334$
00321$:
;	preemptive.c:567: } else if ((EnterTimes[3] - LeaveTimes[1]) == 1) {
	mov	r6,(_EnterTimes + 0x0003)
	mov	r7,#0x00
	mov	r4,(_LeaveTimes + 0x0001)
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00318$
	cjne	r7,#0x00,00318$
;	preemptive.c:568: while (!TI) {}
00283$:
	jnb	_TI,00283$
;	preemptive.c:569: SBUF = EnterTimes[4] - 3;
	mov	a,(_EnterTimes + 0x0004)
	add	a,#0xfd
	mov	_SBUF,a
;	preemptive.c:570: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:571: while (!TI) {}
00286$:
	jnb	_TI,00286$
;	preemptive.c:572: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:573: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:574: while (!TI) {}
00289$:
	jnb	_TI,00289$
;	preemptive.c:575: SBUF = LeaveTimes[4] - 4;
	mov	a,(_LeaveTimes + 0x0004)
	mov	r7,a
	add	a,#0xfc
	mov	_SBUF,a
;	preemptive.c:576: TI = 0;
;	assignBit
	clr	_TI
	ljmp	00334$
00318$:
;	preemptive.c:577: } else if ((EnterTimes[3] - LeaveTimes[2]) == 1) {
	mov	r6,(_EnterTimes + 0x0003)
	mov	r7,#0x00
	mov	r4,(_LeaveTimes + 0x0002)
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00334$
	cjne	r7,#0x00,00334$
;	preemptive.c:578: if ((EnterTimes[2] - LeaveTimes[0]) == 1) {
	mov	r6,(_EnterTimes + 0x0002)
	mov	r7,#0x00
	mov	r4,_LeaveTimes
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00313$
	cjne	r7,#0x00,00313$
;	preemptive.c:579: while (!TI) {}
00292$:
	jnb	_TI,00292$
;	preemptive.c:580: SBUF = EnterTimes[4] - 3;
	mov	a,(_EnterTimes + 0x0004)
	add	a,#0xfd
	mov	_SBUF,a
;	preemptive.c:581: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:582: while (!TI) {}
00295$:
	jnb	_TI,00295$
;	preemptive.c:583: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:584: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:585: while (!TI) {}
00298$:
	jnb	_TI,00298$
;	preemptive.c:586: SBUF = LeaveTimes[4] - 4;
	mov	a,(_LeaveTimes + 0x0004)
	mov	r7,a
	add	a,#0xfc
	mov	_SBUF,a
;	preemptive.c:587: TI = 0;
;	assignBit
	clr	_TI
	sjmp	00334$
00313$:
;	preemptive.c:588: } else if ((EnterTimes[2] - LeaveTimes[1]) == 1){
	mov	r6,(_EnterTimes + 0x0002)
	mov	r7,#0x00
	mov	r4,(_LeaveTimes + 0x0001)
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	cjne	r6,#0x01,00334$
	cjne	r7,#0x00,00334$
;	preemptive.c:589: while (!TI) {}
00301$:
	jnb	_TI,00301$
;	preemptive.c:590: SBUF = EnterTimes[4] - 4;
	mov	a,(_EnterTimes + 0x0004)
	add	a,#0xfc
	mov	_SBUF,a
;	preemptive.c:591: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:592: while (!TI) {}
00304$:
	jnb	_TI,00304$
;	preemptive.c:593: SBUF = '~';
	mov	_SBUF,#0x7e
;	preemptive.c:594: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:595: while (!TI) {}
00307$:
	jnb	_TI,00307$
;	preemptive.c:596: SBUF = LeaveTimes[4] - 5;
	mov	a,(_LeaveTimes + 0x0004)
	mov	r7,a
	add	a,#0xfb
	mov	_SBUF,a
;	preemptive.c:597: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:601: while (!TI) {}
00334$:
	jnb	_TI,00334$
;	preemptive.c:602: SBUF = '|';
	mov	_SBUF,#0x7c
;	preemptive.c:603: TI = 0;
;	assignBit
	clr	_TI
;	preemptive.c:604: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
