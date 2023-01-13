;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (Linux)
;--------------------------------------------------------
	.module testparking
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __compare_PARM_2
	.globl _SemaphoreCreate_PARM_2
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _Parking5
	.globl _Parking4
	.globl _Parking3
	.globl _Parking2
	.globl _Parking1
	.globl __compare
	.globl _SemaphoreCreate
	.globl _now
	.globl _delay
	.globl _char_to_int
	.globl _ThreadExit
	.globl _ThreadYield
	.globl _ThreadCreate
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
	.globl _numOfThreads
	.globl _i
	.globl _LeaveTimes
	.globl _EnterTimes
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
_EnterTimes	=	0x0023
_LeaveTimes	=	0x0028
_i	=	0x002d
_numOfThreads	=	0x002e
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
_SemaphoreCreate_PARM_2:
	.ds 1
	.area	OSEG    (OVR,DATA)
__compare_PARM_2:
	.ds 1
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

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
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'SemaphoreCreate'
;------------------------------------------------------------
;n                         Allocated with name '_SemaphoreCreate_PARM_2'
;s                         Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	testparking.c:10: void SemaphoreCreate(char *s, char n) {
;	-----------------------------------------
;	 function SemaphoreCreate
;	-----------------------------------------
_SemaphoreCreate:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	testparking.c:14: }
	mov	r4,#0x01
	jbc	ea,00103$
	mov	r4,#0x00
00103$:
;	testparking.c:13: *s = n;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,_SemaphoreCreate_PARM_2
	lcall	__gptrput
	mov	a,r4
	rrc	a
	mov	ea,c
;	testparking.c:15: return;
;	testparking.c:16: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_compare'
;------------------------------------------------------------
;t                         Allocated with name '__compare_PARM_2'
;s                         Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	testparking.c:39: int _compare(char *s, char t) {return (*s == t);}
;	-----------------------------------------
;	 function _compare
;	-----------------------------------------
__compare:
	lcall	__gptrget
	cjne	a,__compare_PARM_2,00103$
	mov	a,#0x01
	sjmp	00104$
00103$:
	clr	a
00104$:
	mov	r5,a
	mov	r7,#0x00
	mov	dpl,r5
	mov	dph,r7
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Parking1'
;------------------------------------------------------------
;	testparking.c:55: void Parking1(void) {
;	-----------------------------------------
;	 function Parking1
;	-----------------------------------------
_Parking1:
;	testparking.c:58: while (_compare(&delays[0], '0') == 0) {ThreadYield();}
00101$:
	mov	__compare_PARM_2,#0x30
	mov	dptr,#_delays
	mov	b,#0x40
	lcall	__compare
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00103$
	lcall	_ThreadYield
	sjmp	00101$
00103$:
;	testparking.c:59: for (i=0; i<2; i++) {
	mov	_i,#0x00
00116$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00106$
;	testparking.c:60: if (_compare(&spots[i], '1') == 1) {
	mov	a,_i
	add	a,#_spots
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	__compare_PARM_2,#0x31
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__compare
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0x01,00117$
	cjne	r7,#0x00,00117$
;	testparking.c:62: spots[i] = '_';
	mov	a,_i
	add	a,#_spots
	mov	r0,a
	mov	@r0,#0x5f
;	testparking.c:63: LeaveTimes[0] = now();
	lcall	_now
	mov	a,dpl
	mov	_LeaveTimes,a
;	testparking.c:64: SemaphoreSignal(mutex);
	INC _mutex 
;	testparking.c:65: ThreadExit();
	lcall	_ThreadExit
00117$:
;	testparking.c:59: for (i=0; i<2; i++) {
	inc	_i
	sjmp	00116$
00106$:
;	testparking.c:68: for (i=0; i<2; i++) {
	mov	_i,#0x00
00119$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00101$
;	testparking.c:69: if (_compare(&spots[i], '_') == 1) {
	mov	a,_i
	add	a,#_spots
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	__compare_PARM_2,#0x5f
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__compare
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0x01,00108$
	cjne	r7,#0x00,00108$
;	testparking.c:71: SemaphoreWait(mutex);
		0$:
	MOV ACC, _mutex 
	JZ 0$ 
	DEC _mutex 
;	testparking.c:72: spots[i] = '1';                                
	mov	a,_i
	add	a,#_spots
	mov	r0,a
	mov	@r0,#0x31
;	testparking.c:73: delay('8');
	mov	dpl,#0x38
	lcall	_delay
;	testparking.c:74: EnterTimes[0] = now();
	lcall	_now
	mov	a,dpl
	mov	_EnterTimes,a
;	testparking.c:75: break;
	ljmp	00101$
00108$:
;	testparking.c:77: if (i == 1) delay('2');
	mov	a,#0x01
	cjne	a,_i,00120$
	mov	dpl,#0x32
	lcall	_delay
00120$:
;	testparking.c:68: for (i=0; i<2; i++) {
	inc	_i
;	testparking.c:80: }
	sjmp	00119$
;------------------------------------------------------------
;Allocation info for local variables in function 'Parking2'
;------------------------------------------------------------
;	testparking.c:81: void Parking2(void) {
;	-----------------------------------------
;	 function Parking2
;	-----------------------------------------
_Parking2:
;	testparking.c:84: while (_compare(&delays[1], '0') == 0) {ThreadYield();}
00101$:
	mov	__compare_PARM_2,#0x30
	mov	dptr,#(_delays + 0x0001)
	mov	b,#0x40
	lcall	__compare
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00103$
	lcall	_ThreadYield
	sjmp	00101$
00103$:
;	testparking.c:85: for (i=0; i<2; i++) {
	mov	_i,#0x00
00116$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00106$
;	testparking.c:86: if (_compare(&spots[i], '2') == 1) {
	mov	a,_i
	add	a,#_spots
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	__compare_PARM_2,#0x32
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__compare
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0x01,00117$
	cjne	r7,#0x00,00117$
;	testparking.c:88: spots[i] = '_';
	mov	a,_i
	add	a,#_spots
	mov	r0,a
	mov	@r0,#0x5f
;	testparking.c:89: LeaveTimes[1] = now();
	lcall	_now
	mov	a,dpl
	mov	(_LeaveTimes + 0x0001),a
;	testparking.c:90: SemaphoreSignal(mutex);
	INC _mutex 
;	testparking.c:91: ThreadExit();
	lcall	_ThreadExit
00117$:
;	testparking.c:85: for (i=0; i<2; i++) {
	inc	_i
	sjmp	00116$
00106$:
;	testparking.c:94: for (i=0; i<2; i++) {
	mov	_i,#0x00
00119$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00101$
;	testparking.c:95: if (_compare(&spots[i], '_') == 1) {
	mov	a,_i
	add	a,#_spots
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	__compare_PARM_2,#0x5f
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__compare
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0x01,00108$
	cjne	r7,#0x00,00108$
;	testparking.c:97: SemaphoreWait(mutex);
		1$:
	MOV ACC, _mutex 
	JZ 1$ 
	DEC _mutex 
;	testparking.c:98: spots[i] = '2';
	mov	a,_i
	add	a,#_spots
	mov	r0,a
	mov	@r0,#0x32
;	testparking.c:99: delay('4');
	mov	dpl,#0x34
	lcall	_delay
;	testparking.c:100: EnterTimes[1] = now();
	lcall	_now
	mov	a,dpl
	mov	(_EnterTimes + 0x0001),a
;	testparking.c:101: break;
	ljmp	00101$
00108$:
;	testparking.c:103: if (i == 1) delay('2');
	mov	a,#0x01
	cjne	a,_i,00120$
	mov	dpl,#0x32
	lcall	_delay
00120$:
;	testparking.c:94: for (i=0; i<2; i++) {
	inc	_i
;	testparking.c:106: }
	sjmp	00119$
;------------------------------------------------------------
;Allocation info for local variables in function 'Parking3'
;------------------------------------------------------------
;	testparking.c:107: void Parking3(void) {
;	-----------------------------------------
;	 function Parking3
;	-----------------------------------------
_Parking3:
;	testparking.c:110: while (_compare(&delays[2], '0') == 0) {ThreadYield();}
00101$:
	mov	__compare_PARM_2,#0x30
	mov	dptr,#(_delays + 0x0002)
	mov	b,#0x40
	lcall	__compare
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00103$
	lcall	_ThreadYield
	sjmp	00101$
00103$:
;	testparking.c:111: for (i=0; i<2; i++) {
	mov	_i,#0x00
00116$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00106$
;	testparking.c:112: if (_compare(&spots[i], '3') == 1) {
	mov	a,_i
	add	a,#_spots
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	__compare_PARM_2,#0x33
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__compare
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0x01,00117$
	cjne	r7,#0x00,00117$
;	testparking.c:114: spots[i] = '_';
	mov	a,_i
	add	a,#_spots
	mov	r0,a
	mov	@r0,#0x5f
;	testparking.c:115: LeaveTimes[2] = now();
	lcall	_now
	mov	a,dpl
	mov	(_LeaveTimes + 0x0002),a
;	testparking.c:116: SemaphoreSignal(mutex);
	INC _mutex 
;	testparking.c:117: ThreadExit();
	lcall	_ThreadExit
00117$:
;	testparking.c:111: for (i=0; i<2; i++) {
	inc	_i
	sjmp	00116$
00106$:
;	testparking.c:120: for (i=0; i<2; i++) {
	mov	_i,#0x00
00119$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00101$
;	testparking.c:121: if (_compare(&spots[i], '_') == 1) {
	mov	a,_i
	add	a,#_spots
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	__compare_PARM_2,#0x5f
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__compare
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0x01,00108$
	cjne	r7,#0x00,00108$
;	testparking.c:123: SemaphoreWait(mutex);
		2$:
	MOV ACC, _mutex 
	JZ 2$ 
	DEC _mutex 
;	testparking.c:124: spots[i] = '3';
	mov	a,_i
	add	a,#_spots
	mov	r0,a
	mov	@r0,#0x33
;	testparking.c:125: delay('5');
	mov	dpl,#0x35
	lcall	_delay
;	testparking.c:126: EnterTimes[2] = now();
	lcall	_now
	mov	a,dpl
	mov	(_EnterTimes + 0x0002),a
;	testparking.c:127: break;
	ljmp	00101$
00108$:
;	testparking.c:129: if (i == 1) delay('2');
	mov	a,#0x01
	cjne	a,_i,00120$
	mov	dpl,#0x32
	lcall	_delay
00120$:
;	testparking.c:120: for (i=0; i<2; i++) {
	inc	_i
;	testparking.c:132: }
	sjmp	00119$
;------------------------------------------------------------
;Allocation info for local variables in function 'Parking4'
;------------------------------------------------------------
;	testparking.c:133: void Parking4(void) {
;	-----------------------------------------
;	 function Parking4
;	-----------------------------------------
_Parking4:
;	testparking.c:136: while (_compare(&delays[char_to_int(thrd_4)], '0') == 0) {ThreadYield();}
00101$:
	mov	dpl,_thrd_4
	lcall	_char_to_int
	mov	r6,dpl
	mov	a,r6
	add	a,#_delays
	mov	r6,a
	mov	r7,#0x00
	mov	r5,#0x40
	mov	__compare_PARM_2,#0x30
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__compare
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00103$
	lcall	_ThreadYield
	sjmp	00101$
00103$:
;	testparking.c:137: for (i=0; i<2; i++) {
	mov	_i,#0x00
00116$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00106$
;	testparking.c:138: if (_compare(&spots[i], '4') == 1) {
	mov	a,_i
	add	a,#_spots
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	__compare_PARM_2,#0x34
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__compare
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0x01,00117$
	cjne	r7,#0x00,00117$
;	testparking.c:140: spots[i] = '_';
	mov	a,_i
	add	a,#_spots
	mov	r0,a
	mov	@r0,#0x5f
;	testparking.c:141: LeaveTimes[3] = now();
	lcall	_now
	mov	a,dpl
	mov	(_LeaveTimes + 0x0003),a
;	testparking.c:142: SemaphoreSignal(mutex);
	INC _mutex 
;	testparking.c:143: ThreadExit();
	lcall	_ThreadExit
00117$:
;	testparking.c:137: for (i=0; i<2; i++) {
	inc	_i
	sjmp	00116$
00106$:
;	testparking.c:146: for (i=0; i<2; i++) {
	mov	_i,#0x00
00119$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00101$
;	testparking.c:147: if (_compare(&spots[i], '_') == 1) {
	mov	a,_i
	add	a,#_spots
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	__compare_PARM_2,#0x5f
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__compare
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0x01,00108$
	cjne	r7,#0x00,00108$
;	testparking.c:149: SemaphoreWait(mutex);
		3$:
	MOV ACC, _mutex 
	JZ 3$ 
	DEC _mutex 
;	testparking.c:150: spots[i] = '4';
	mov	a,_i
	add	a,#_spots
	mov	r0,a
	mov	@r0,#0x34
;	testparking.c:151: delay('7');
	mov	dpl,#0x37
	lcall	_delay
;	testparking.c:152: EnterTimes[3] = now();
	lcall	_now
	mov	a,dpl
	mov	(_EnterTimes + 0x0003),a
;	testparking.c:153: break;
	ljmp	00101$
00108$:
;	testparking.c:155: if (i == 1) delay('2');
	mov	a,#0x01
	cjne	a,_i,00120$
	mov	dpl,#0x32
	lcall	_delay
00120$:
;	testparking.c:146: for (i=0; i<2; i++) {
	inc	_i
;	testparking.c:158: }
	sjmp	00119$
;------------------------------------------------------------
;Allocation info for local variables in function 'Parking5'
;------------------------------------------------------------
;	testparking.c:159: void Parking5(void) {
;	-----------------------------------------
;	 function Parking5
;	-----------------------------------------
_Parking5:
;	testparking.c:162: while (_compare(&delays[char_to_int(thrd_5)], '0') == 0) {ThreadYield();}
00101$:
	mov	dpl,_thrd_5
	lcall	_char_to_int
	mov	r6,dpl
	mov	a,r6
	add	a,#_delays
	mov	r6,a
	mov	r7,#0x00
	mov	r5,#0x40
	mov	__compare_PARM_2,#0x30
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	lcall	__compare
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00103$
	lcall	_ThreadYield
	sjmp	00101$
00103$:
;	testparking.c:163: for (i=0; i<2; i++) {
	mov	_i,#0x00
00116$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00106$
;	testparking.c:164: if (_compare(&spots[i], '5') == 1) {
	mov	a,_i
	add	a,#_spots
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	__compare_PARM_2,#0x35
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__compare
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0x01,00117$
	cjne	r7,#0x00,00117$
;	testparking.c:166: spots[i] = '_';
	mov	a,_i
	add	a,#_spots
	mov	r0,a
	mov	@r0,#0x5f
;	testparking.c:167: LeaveTimes[4] = now();
	lcall	_now
	mov	a,dpl
	mov	(_LeaveTimes + 0x0004),a
;	testparking.c:168: SemaphoreSignal(mutex);
	INC _mutex 
;	testparking.c:169: ThreadExit();
	lcall	_ThreadExit
00117$:
;	testparking.c:163: for (i=0; i<2; i++) {
	inc	_i
	sjmp	00116$
00106$:
;	testparking.c:172: for (i=0; i<2; i++) {
	mov	_i,#0x00
00119$:
	mov	a,#0x100 - 0x02
	add	a,_i
	jc	00101$
;	testparking.c:173: if (_compare(&spots[i], '_') == 1) {
	mov	a,_i
	add	a,#_spots
	mov	r7,a
	mov	r6,#0x00
	mov	r5,#0x40
	mov	__compare_PARM_2,#0x5f
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__compare
	mov	r6,dpl
	mov	r7,dph
	cjne	r6,#0x01,00108$
	cjne	r7,#0x00,00108$
;	testparking.c:175: SemaphoreWait(mutex);
		4$:
	MOV ACC, _mutex 
	JZ 4$ 
	DEC _mutex 
;	testparking.c:176: spots[i] = '5';
	mov	a,_i
	add	a,#_spots
	mov	r0,a
	mov	@r0,#0x35
;	testparking.c:177: delay('2');
	mov	dpl,#0x32
	lcall	_delay
;	testparking.c:178: EnterTimes[4] = now();
	lcall	_now
	mov	a,dpl
	mov	(_EnterTimes + 0x0004),a
;	testparking.c:179: break;
	ljmp	00101$
00108$:
;	testparking.c:181: if (i == 1) delay('2');
	mov	a,#0x01
	cjne	a,_i,00120$
	mov	dpl,#0x32
	lcall	_delay
00120$:
;	testparking.c:172: for (i=0; i<2; i++) {
	inc	_i
;	testparking.c:184: }
	sjmp	00119$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	testparking.c:186: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	testparking.c:188: SemaphoreCreate(&mutex, 2);  // semaphore for spots
	mov	_SemaphoreCreate_PARM_2,#0x02
	mov	dptr,#_mutex
	mov	b,#0x40
	lcall	_SemaphoreCreate
;	testparking.c:190: ThreadCreate(Parking1);
	mov	dptr,#_Parking1
	lcall	_ThreadCreate
;	testparking.c:191: ThreadCreate(Parking2);
	mov	dptr,#_Parking2
	lcall	_ThreadCreate
;	testparking.c:192: ThreadCreate(Parking3);
	mov	dptr,#_Parking3
	lcall	_ThreadCreate
;	testparking.c:194: TMOD |= 0x20;
	mov	r6,_TMOD
	orl	ar6,#0x20
	mov	_TMOD,r6
;	testparking.c:195: TH1 = (char)-6;
	mov	_TH1,#0xfa
;	testparking.c:196: SCON = 0x50;
	mov	_SCON,#0x50
;	testparking.c:197: TR1 = 1;
;	assignBit
	setb	_TR1
;	testparking.c:198: TI = 1;
;	assignBit
	setb	_TI
;	testparking.c:200: ThreadYield();  // start parking
	lcall	_ThreadYield
;	testparking.c:202: while (numOfThreads >= MAXTHREADS) {ThreadYield();}
00101$:
	clr	c
	mov	a,_numOfThreads
	subb	a,#0x04
	mov	a,(_numOfThreads + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jc	00103$
	lcall	_ThreadYield
	sjmp	00101$
00103$:
;	testparking.c:203: ThreadCreate(Parking4);  // have available thread, create a new one for car 4
	mov	dptr,#_Parking4
	lcall	_ThreadCreate
;	testparking.c:205: while (numOfThreads >= MAXTHREADS) {ThreadYield();}
00104$:
	clr	c
	mov	a,_numOfThreads
	subb	a,#0x04
	mov	a,(_numOfThreads + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jc	00106$
	lcall	_ThreadYield
	sjmp	00104$
00106$:
;	testparking.c:206: ThreadCreate(Parking5);  // have available thread, create a new one for car 5
	mov	dptr,#_Parking5
	lcall	_ThreadCreate
;	testparking.c:208: while (numOfThreads != 1) {ThreadYield();}
00107$:
	mov	a,#0x01
	cjne	a,_numOfThreads,00138$
	dec	a
	cjne	a,(_numOfThreads + 1),00138$
	sjmp	00109$
00138$:
	lcall	_ThreadYield
	sjmp	00107$
00109$:
;	testparking.c:210: ThreadExit();  // all parking finished, exit this example
;	testparking.c:211: }
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	testparking.c:213: void _sdcc_gsinit_startup(void) {
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	testparking.c:216: __endasm;
	ljmp	_Bootstrap
;	testparking.c:217: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	testparking.c:218: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	testparking.c:219: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	testparking.c:220: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	testparking.c:222: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	testparking.c:225: __endasm;
	ljmp	_myTimer0Handler
;	testparking.c:226: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
