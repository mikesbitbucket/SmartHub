
_pin_reset:

;RF_Reset_Routines.c,12 :: 		void pin_reset() {
;RF_Reset_Routines.c,13 :: 		RST = 0;  // activate reset
	BCF         RST+0, BitPos(RST+0) 
;RF_Reset_Routines.c,14 :: 		Delay_ms(5);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_pin_reset0:
	DECFSZ      R13, 1, 1
	BRA         L_pin_reset0
	DECFSZ      R12, 1, 1
	BRA         L_pin_reset0
;RF_Reset_Routines.c,15 :: 		RST = 1;  // deactivate reset
	BSF         RST+0, BitPos(RST+0) 
;RF_Reset_Routines.c,16 :: 		Delay_ms(5);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_pin_reset1:
	DECFSZ      R13, 1, 1
	BRA         L_pin_reset1
	DECFSZ      R12, 1, 1
	BRA         L_pin_reset1
;RF_Reset_Routines.c,17 :: 		}
L_end_pin_reset:
	RETURN      0
; end of _pin_reset

_PWR_reset:

;RF_Reset_Routines.c,19 :: 		void PWR_reset() {
;RF_Reset_Routines.c,20 :: 		write_ZIGBEE_short(SOFTRST, 0x04);   // 0x04  mask for RSTPWR bit
	MOVLW       42
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVLW       4
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Reset_Routines.c,21 :: 		}
L_end_PWR_reset:
	RETURN      0
; end of _PWR_reset

_BB_reset:

;RF_Reset_Routines.c,23 :: 		void BB_reset() {
;RF_Reset_Routines.c,24 :: 		write_ZIGBEE_short(SOFTRST, 0x02);   // 0x02 mask for RSTBB bit
	MOVLW       42
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Reset_Routines.c,25 :: 		}
L_end_BB_reset:
	RETURN      0
; end of _BB_reset

_MAC_reset:

;RF_Reset_Routines.c,27 :: 		void MAC_reset() {
;RF_Reset_Routines.c,28 :: 		write_ZIGBEE_short(SOFTRST, 0x01);   // 0x01 mask for RSTMAC bit
	MOVLW       42
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVLW       1
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Reset_Routines.c,29 :: 		}
L_end_MAC_reset:
	RETURN      0
; end of _MAC_reset

_software_reset:

;RF_Reset_Routines.c,31 :: 		void software_reset() {                // PWR_reset,BB_reset and MAC_reset at once
;RF_Reset_Routines.c,32 :: 		write_ZIGBEE_short(SOFTRST, 0x07);
	MOVLW       42
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVLW       7
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Reset_Routines.c,33 :: 		}
L_end_software_reset:
	RETURN      0
; end of _software_reset

_RF_reset:

;RF_Reset_Routines.c,35 :: 		void RF_reset() {
;RF_Reset_Routines.c,36 :: 		short int temp = 0;
	CLRF        RF_reset_temp_L0+0 
;RF_Reset_Routines.c,37 :: 		temp = read_ZIGBEE_short(RFCTL);
	MOVLW       54
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
	MOVF        R0, 0 
	MOVWF       RF_reset_temp_L0+0 
;RF_Reset_Routines.c,38 :: 		temp = temp | 0x04;                  // mask for RFRST bit
	BSF         R0, 2 
	MOVF        R0, 0 
	MOVWF       RF_reset_temp_L0+0 
;RF_Reset_Routines.c,39 :: 		write_ZIGBEE_short(RFCTL, temp);
	MOVLW       54
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVF        R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Reset_Routines.c,40 :: 		temp = temp & (!0x04);               // mask for RFRST bit
	MOVLW       0
	ANDWF       RF_reset_temp_L0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       RF_reset_temp_L0+0 
;RF_Reset_Routines.c,41 :: 		write_ZIGBEE_short(RFCTL, temp);
	MOVLW       54
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVF        R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Reset_Routines.c,42 :: 		Delay_ms(1);
	MOVLW       16
	MOVWF       R12, 0
	MOVLW       148
	MOVWF       R13, 0
L_RF_reset2:
	DECFSZ      R13, 1, 1
	BRA         L_RF_reset2
	DECFSZ      R12, 1, 1
	BRA         L_RF_reset2
	NOP
;RF_Reset_Routines.c,43 :: 		}
L_end_RF_reset:
	RETURN      0
; end of _RF_reset
