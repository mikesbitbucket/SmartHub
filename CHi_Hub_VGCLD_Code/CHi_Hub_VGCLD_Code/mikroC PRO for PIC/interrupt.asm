
_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;interrupt.c,7 :: 		void interrupt_low() {
;interrupt.c,9 :: 		if (INTCON.TMR0IF) {
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt_low0
;interrupt.c,10 :: 		heartbeat_tmr++;
	MOVLW       1
	ADDWF       _heartbeat_tmr+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _heartbeat_tmr+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _heartbeat_tmr+0 
	MOVF        R1, 0 
	MOVWF       _heartbeat_tmr+1 
;interrupt.c,11 :: 		TMR0L = TMR_RELOAD_LOW;
	MOVLW       170
	MOVWF       TMR0L+0 
;interrupt.c,12 :: 		TMR0H = TMR_RELOAD_HIGH;
	MOVLW       252
	MOVWF       TMR0H+0 
;interrupt.c,13 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;interrupt.c,14 :: 		}
L_interrupt_low0:
;interrupt.c,20 :: 		}
L_end_interrupt_low:
L__interrupt_low2:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _interrupt_low

interrupt____?ag:

L_end_interrupt___?ag:
	RETURN      0
; end of interrupt____?ag
