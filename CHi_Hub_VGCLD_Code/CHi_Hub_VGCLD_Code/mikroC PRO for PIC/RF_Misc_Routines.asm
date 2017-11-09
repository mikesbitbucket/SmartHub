
_enable_interrupt:

;RF_Misc_Routines.c,13 :: 		void enable_interrupt() {
;RF_Misc_Routines.c,14 :: 		write_ZIGBEE_short(INTCON_M, 0x00);   // 0x00  all interrupts are enable
	MOVLW       50
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CLRF        FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,15 :: 		}
L_end_enable_interrupt:
	RETURN      0
; end of _enable_interrupt

_set_channel:

;RF_Misc_Routines.c,20 :: 		void set_channel(short int channel_number) {               // 11-26 possible channels
;RF_Misc_Routines.c,21 :: 		if((channel_number > 26) || (channel_number < 11)) channel_number = 11;
	MOVLW       128
	XORLW       26
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_set_channel_channel_number+0, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__set_channel48
	MOVLW       128
	XORWF       FARG_set_channel_channel_number+0, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       11
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__set_channel48
	GOTO        L_set_channel2
L__set_channel48:
	MOVLW       11
	MOVWF       FARG_set_channel_channel_number+0 
L_set_channel2:
;RF_Misc_Routines.c,22 :: 		switch(channel_number) {
	GOTO        L_set_channel3
;RF_Misc_Routines.c,23 :: 		case 11:
L_set_channel5:
;RF_Misc_Routines.c,24 :: 		write_ZIGBEE_long(RFCON0, 0x02);  // 0x02 for 11. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,25 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,26 :: 		case 12:
L_set_channel6:
;RF_Misc_Routines.c,27 :: 		write_ZIGBEE_long(RFCON0, 0x12);  // 0x12 for 12. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       18
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,28 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,29 :: 		case 13:
L_set_channel7:
;RF_Misc_Routines.c,30 :: 		write_ZIGBEE_long(RFCON0, 0x22);  // 0x22 for 13. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       34
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,31 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,32 :: 		case 14:
L_set_channel8:
;RF_Misc_Routines.c,33 :: 		write_ZIGBEE_long(RFCON0, 0x32);  // 0x32 for 14. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       50
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,34 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,35 :: 		case 15:
L_set_channel9:
;RF_Misc_Routines.c,36 :: 		write_ZIGBEE_long(RFCON0, 0x42);  // 0x42 for 15. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       66
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,37 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,38 :: 		case 16:
L_set_channel10:
;RF_Misc_Routines.c,39 :: 		write_ZIGBEE_long(RFCON0, 0x52);  // 0x52 for 16. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       82
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,40 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,41 :: 		case 17:
L_set_channel11:
;RF_Misc_Routines.c,42 :: 		write_ZIGBEE_long(RFCON0, 0x62);  // 0x62 for 17. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       98
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,43 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,44 :: 		case 18:
L_set_channel12:
;RF_Misc_Routines.c,45 :: 		write_ZIGBEE_long(RFCON0, 0x72);  // 0x72 for 18. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       114
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,46 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,47 :: 		case 19:
L_set_channel13:
;RF_Misc_Routines.c,48 :: 		write_ZIGBEE_long(RFCON0, 0x82);  // 0x82 for 19. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       130
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,49 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,50 :: 		case 20:
L_set_channel14:
;RF_Misc_Routines.c,51 :: 		write_ZIGBEE_long(RFCON0, 0x92);  // 0x92 for 20. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       146
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,52 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,53 :: 		case 21:
L_set_channel15:
;RF_Misc_Routines.c,54 :: 		write_ZIGBEE_long(RFCON0, 0xA2);  // 0xA2 for 21. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       162
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,55 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,56 :: 		case 22:
L_set_channel16:
;RF_Misc_Routines.c,57 :: 		write_ZIGBEE_long(RFCON0, 0xB2);  // 0xB2 for 22. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       178
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,58 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,59 :: 		case 23:
L_set_channel17:
;RF_Misc_Routines.c,60 :: 		write_ZIGBEE_long(RFCON0, 0xC2);  // 0xC2 for 23. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       194
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,61 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,62 :: 		case 24:
L_set_channel18:
;RF_Misc_Routines.c,63 :: 		write_ZIGBEE_long(RFCON0, 0xD2);  // 0xD2 for 24. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       210
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,64 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,65 :: 		case 25:
L_set_channel19:
;RF_Misc_Routines.c,66 :: 		write_ZIGBEE_long(RFCON0, 0xE2);  // 0xE2 for 25. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       226
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,67 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,68 :: 		case 26:
L_set_channel20:
;RF_Misc_Routines.c,69 :: 		write_ZIGBEE_long(RFCON0, 0xF2);  // 0xF2 for 26. channel
	MOVLW       0
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       242
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,70 :: 		break;
	GOTO        L_set_channel4
;RF_Misc_Routines.c,71 :: 		}
L_set_channel3:
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel5
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel6
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel7
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel8
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel9
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel10
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       17
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel11
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       18
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel12
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       19
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel13
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       20
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel14
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       21
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel15
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       22
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel16
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       23
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel17
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       24
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel18
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       25
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel19
	MOVF        FARG_set_channel_channel_number+0, 0 
	XORLW       26
	BTFSC       STATUS+0, 2 
	GOTO        L_set_channel20
L_set_channel4:
;RF_Misc_Routines.c,72 :: 		RF_reset();
	CALL        _RF_reset+0, 0
;RF_Misc_Routines.c,73 :: 		}
L_end_set_channel:
	RETURN      0
; end of _set_channel

_set_CCA_mode:

;RF_Misc_Routines.c,78 :: 		void set_CCA_mode(short int CCA_mode) {
;RF_Misc_Routines.c,79 :: 		short int temp = 0;
;RF_Misc_Routines.c,80 :: 		switch(CCA_mode) {
	GOTO        L_set_CCA_mode21
;RF_Misc_Routines.c,81 :: 		case 1: {                               // ENERGY ABOVE THRESHOLD
L_set_CCA_mode23:
;RF_Misc_Routines.c,82 :: 		temp = read_ZIGBEE_short(BBREG2);
	MOVLW       58
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,83 :: 		temp = temp | 0x80;                   // 0x80 mask
	MOVLW       128
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,84 :: 		temp = temp & 0xDF;                   // 0xDF mask
	MOVLW       223
	ANDWF       FARG_write_ZIGBEE_short_data_r+0, 1 
;RF_Misc_Routines.c,85 :: 		write_ZIGBEE_short(BBREG2, temp);
	MOVLW       58
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,86 :: 		write_ZIGBEE_short(CCAEDTH, 0x60);    // Set CCA ED threshold to -69 dBm
	MOVLW       63
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVLW       96
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,88 :: 		break;
	GOTO        L_set_CCA_mode22
;RF_Misc_Routines.c,90 :: 		case 2: {                               // CARRIER SENSE ONLY
L_set_CCA_mode24:
;RF_Misc_Routines.c,91 :: 		temp = read_ZIGBEE_short(BBREG2);
	MOVLW       58
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,92 :: 		temp = temp | 0x40;                   // 0x40 mask
	MOVLW       64
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,93 :: 		temp = temp & 0x7F;                   // 0x7F mask
	MOVLW       127
	ANDWF       FARG_write_ZIGBEE_short_data_r+0, 1 
;RF_Misc_Routines.c,94 :: 		write_ZIGBEE_short(BBREG2, temp);
	MOVLW       58
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,96 :: 		temp = read_ZIGBEE_short(BBREG2);     // carrier sense threshold
	MOVLW       58
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,97 :: 		temp = temp | 0x38;
	MOVLW       56
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,98 :: 		temp = temp & 0xFB;
	MOVLW       251
	ANDWF       FARG_write_ZIGBEE_short_data_r+0, 1 
;RF_Misc_Routines.c,99 :: 		write_ZIGBEE_short(BBREG2, temp);
	MOVLW       58
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,101 :: 		break;
	GOTO        L_set_CCA_mode22
;RF_Misc_Routines.c,103 :: 		case 3: {                               // CARRIER SENSE AND ENERGY ABOVE THRESHOLD
L_set_CCA_mode25:
;RF_Misc_Routines.c,104 :: 		temp = read_ZIGBEE_short(BBREG2);
	MOVLW       58
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,105 :: 		temp = temp | 0xC0;                   // 0xC0 mask
	MOVLW       192
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,106 :: 		write_ZIGBEE_short(BBREG2, temp);
	MOVLW       58
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,108 :: 		temp = read_ZIGBEE_short(BBREG2);     // carrier sense threshold
	MOVLW       58
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,109 :: 		temp = temp | 0x38;                   // 0x38 mask
	MOVLW       56
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,110 :: 		temp = temp & 0xFB;                   // 0xFB mask
	MOVLW       251
	ANDWF       FARG_write_ZIGBEE_short_data_r+0, 1 
;RF_Misc_Routines.c,111 :: 		write_ZIGBEE_short(BBREG2, temp);
	MOVLW       58
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,113 :: 		write_ZIGBEE_short(CCAEDTH, 0x60);    // Set CCA ED threshold to -69 dBm
	MOVLW       63
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVLW       96
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,115 :: 		break;
	GOTO        L_set_CCA_mode22
;RF_Misc_Routines.c,116 :: 		}
L_set_CCA_mode21:
	MOVF        FARG_set_CCA_mode_CCA_mode+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_set_CCA_mode23
	MOVF        FARG_set_CCA_mode_CCA_mode+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_set_CCA_mode24
	MOVF        FARG_set_CCA_mode_CCA_mode+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_set_CCA_mode25
L_set_CCA_mode22:
;RF_Misc_Routines.c,117 :: 		}
L_end_set_CCA_mode:
	RETURN      0
; end of _set_CCA_mode

_set_RSSI_mode:

;RF_Misc_Routines.c,122 :: 		void set_RSSI_mode(short int RSSI_mode) {       // 1 for RSSI1, 2 for RSSI2 mode
;RF_Misc_Routines.c,123 :: 		short int temp = 0;
;RF_Misc_Routines.c,125 :: 		switch(RSSI_mode) {
	GOTO        L_set_RSSI_mode26
;RF_Misc_Routines.c,126 :: 		case 1: {
L_set_RSSI_mode28:
;RF_Misc_Routines.c,127 :: 		temp = read_ZIGBEE_short(BBREG6);
	MOVLW       62
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,128 :: 		temp = temp | 0x80;                       // 0x80 mask for RSSI1 mode
	MOVLW       128
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,129 :: 		write_ZIGBEE_short(BBREG6, temp);
	MOVLW       62
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,131 :: 		break;
	GOTO        L_set_RSSI_mode27
;RF_Misc_Routines.c,133 :: 		case 2:
L_set_RSSI_mode29:
;RF_Misc_Routines.c,134 :: 		write_ZIGBEE_short(BBREG6, 0x40);         // 0x40 data for RSSI2 mode
	MOVLW       62
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVLW       64
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,135 :: 		break;
	GOTO        L_set_RSSI_mode27
;RF_Misc_Routines.c,136 :: 		}
L_set_RSSI_mode26:
	MOVF        FARG_set_RSSI_mode_RSSI_mode+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_set_RSSI_mode28
	MOVF        FARG_set_RSSI_mode_RSSI_mode+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_set_RSSI_mode29
L_set_RSSI_mode27:
;RF_Misc_Routines.c,137 :: 		}
L_end_set_RSSI_mode:
	RETURN      0
; end of _set_RSSI_mode

_nonbeacon_PAN_coordinator_device:

;RF_Misc_Routines.c,142 :: 		void nonbeacon_PAN_coordinator_device() {
;RF_Misc_Routines.c,143 :: 		short int temp = 0;
;RF_Misc_Routines.c,145 :: 		temp = read_ZIGBEE_short(RXMCR);
	CLRF        FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,146 :: 		temp = temp | 0x08;                 // 0x08 mask for PAN coordinator
	MOVLW       8
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,147 :: 		write_ZIGBEE_short(RXMCR, temp);
	CLRF        FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,149 :: 		temp = read_ZIGBEE_short(TXMCR);
	MOVLW       17
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,150 :: 		temp = temp & 0xDF;                 // 0xDF mask for CSMA-CA mode
	MOVLW       223
	ANDWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,151 :: 		write_ZIGBEE_short(TXMCR, temp);
	MOVLW       17
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,153 :: 		write_ZIGBEE_short(ORDER, 0xFF);    // BO, SO are 15
	MOVLW       16
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVLW       255
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,154 :: 		}
L_end_nonbeacon_PAN_coordinator_device:
	RETURN      0
; end of _nonbeacon_PAN_coordinator_device

_nonbeacon_coordinator_device:

;RF_Misc_Routines.c,156 :: 		void nonbeacon_coordinator_device() {
;RF_Misc_Routines.c,157 :: 		short int temp = 0;
;RF_Misc_Routines.c,159 :: 		temp = read_ZIGBEE_short(RXMCR);
	CLRF        FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,160 :: 		temp = temp | 0x04;                 // 0x04 mask for coordinator
	MOVLW       4
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,161 :: 		write_ZIGBEE_short(RXMCR, temp);
	CLRF        FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,163 :: 		temp = read_ZIGBEE_short(TXMCR);
	MOVLW       17
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,164 :: 		temp = temp & 0xDF;                 // 0xDF mask for CSMA-CA mode
	MOVLW       223
	ANDWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,165 :: 		write_ZIGBEE_short(TXMCR, temp);
	MOVLW       17
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,167 :: 		write_ZIGBEE_short(ORDER, 0xFF);    // BO, SO  are 15
	MOVLW       16
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVLW       255
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,168 :: 		}
L_end_nonbeacon_coordinator_device:
	RETURN      0
; end of _nonbeacon_coordinator_device

_nonbeacon_device:

;RF_Misc_Routines.c,170 :: 		void nonbeacon_device() {
;RF_Misc_Routines.c,171 :: 		short int temp = 0;
;RF_Misc_Routines.c,173 :: 		temp = read_ZIGBEE_short(RXMCR);
	CLRF        FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,174 :: 		temp = temp & 0xF3;                 // 0xF3 mask for PAN coordinator and coordinator
	MOVLW       243
	ANDWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,175 :: 		write_ZIGBEE_short(RXMCR, temp);
	CLRF        FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,177 :: 		temp = read_ZIGBEE_short(TXMCR);
	MOVLW       17
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,178 :: 		temp = temp & 0xDF;                 // 0xDF mask for CSMA-CA mode
	MOVLW       223
	ANDWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,179 :: 		write_ZIGBEE_short(TXMCR, temp);
	MOVLW       17
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,180 :: 		}
L_end_nonbeacon_device:
	RETURN      0
; end of _nonbeacon_device

_set_ACK:

;RF_Misc_Routines.c,185 :: 		void set_ACK(void){
;RF_Misc_Routines.c,186 :: 		short int temp = 0;
;RF_Misc_Routines.c,188 :: 		temp = read_ZIGBEE_short(TXNCON);
	MOVLW       27
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,189 :: 		temp = temp | 0x04;                   // 0x04 mask for set ACK
	MOVLW       4
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,190 :: 		write_ZIGBEE_short(TXNCON, temp);
	MOVLW       27
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,191 :: 		}
L_end_set_ACK:
	RETURN      0
; end of _set_ACK

_set_not_ACK:

;RF_Misc_Routines.c,193 :: 		void set_not_ACK(void){
;RF_Misc_Routines.c,194 :: 		short int temp = 0;
;RF_Misc_Routines.c,196 :: 		temp = read_ZIGBEE_short(TXNCON);
	MOVLW       27
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,197 :: 		temp = temp & (!0x04);                // 0x04 mask for set not ACK
	MOVLW       0
	ANDWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,198 :: 		write_ZIGBEE_short(TXNCON, temp);
	MOVLW       27
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,199 :: 		}
L_end_set_not_ACK:
	RETURN      0
; end of _set_not_ACK

_set_encrypt:

;RF_Misc_Routines.c,204 :: 		void set_encrypt(void){
;RF_Misc_Routines.c,205 :: 		short int temp = 0;
;RF_Misc_Routines.c,207 :: 		temp = read_ZIGBEE_short(TXNCON);
	MOVLW       27
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,208 :: 		temp = temp | 0x02;                   // mask for set encrypt
	MOVLW       2
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,209 :: 		write_ZIGBEE_short(TXNCON, temp);
	MOVLW       27
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,210 :: 		}
L_end_set_encrypt:
	RETURN      0
; end of _set_encrypt

_set_not_encrypt:

;RF_Misc_Routines.c,212 :: 		void set_not_encrypt(void){
;RF_Misc_Routines.c,213 :: 		short int temp = 0;
;RF_Misc_Routines.c,215 :: 		temp = read_ZIGBEE_short(TXNCON);
	MOVLW       27
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,216 :: 		temp = temp & (!0x02);                // mask for set not encrypt
	MOVLW       0
	ANDWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,217 :: 		write_ZIGBEE_short(TXNCON, temp);
	MOVLW       27
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,218 :: 		}
L_end_set_not_encrypt:
	RETURN      0
; end of _set_not_encrypt

_set_IFS_recomended:

;RF_Misc_Routines.c,223 :: 		void set_IFS_recomended() {
;RF_Misc_Routines.c,224 :: 		short int temp = 0;
;RF_Misc_Routines.c,226 :: 		write_ZIGBEE_short(RXMCR, 0x93);    // Min SIFS Period
	CLRF        FARG_write_ZIGBEE_short_address+0 
	MOVLW       147
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,228 :: 		temp = read_ZIGBEE_short(TXPEND);
	MOVLW       33
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,229 :: 		temp = temp | 0x7C;                 // MinLIFSPeriod
	MOVLW       124
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,230 :: 		write_ZIGBEE_short(TXPEND, temp);
	MOVLW       33
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,232 :: 		temp = read_ZIGBEE_short(TXSTBL);
	MOVLW       46
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,233 :: 		temp = temp | 0x90;                 // MinLIFSPeriod
	MOVLW       144
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,234 :: 		write_ZIGBEE_short(TXSTBL, temp);
	MOVLW       46
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,236 :: 		temp = read_ZIGBEE_short(TXTIME);
	MOVLW       39
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,237 :: 		temp = temp | 0x31;                 // TurnaroundTime
	MOVLW       49
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,238 :: 		write_ZIGBEE_short(TXTIME, temp);
	MOVLW       39
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,239 :: 		}
L_end_set_IFS_recomended:
	RETURN      0
; end of _set_IFS_recomended

_set_IFS_default:

;RF_Misc_Routines.c,241 :: 		void set_IFS_default() {
;RF_Misc_Routines.c,242 :: 		short int temp = 0;
;RF_Misc_Routines.c,244 :: 		write_ZIGBEE_short(RXMCR, 0x75);    // Min SIFS Period
	CLRF        FARG_write_ZIGBEE_short_address+0 
	MOVLW       117
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,246 :: 		temp = read_ZIGBEE_short(TXPEND);
	MOVLW       33
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,247 :: 		temp = temp | 0x84;                 // Min LIFS Period
	MOVLW       132
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,248 :: 		write_ZIGBEE_short(TXPEND, temp);
	MOVLW       33
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,250 :: 		temp = read_ZIGBEE_short(TXSTBL);
	MOVLW       46
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,251 :: 		temp = temp | 0x50;                 // Min LIFS Period
	MOVLW       80
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,252 :: 		write_ZIGBEE_short(TXSTBL, temp);
	MOVLW       46
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,254 :: 		temp = read_ZIGBEE_short(TXTIME);
	MOVLW       39
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,255 :: 		temp = temp | 0x41;                 // Turnaround Time
	MOVLW       65
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,256 :: 		write_ZIGBEE_short(TXTIME, temp);
	MOVLW       39
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,257 :: 		}
L_end_set_IFS_default:
	RETURN      0
; end of _set_IFS_default

_set_reception_mode:

;RF_Misc_Routines.c,262 :: 		void set_reception_mode(short int r_mode) { // 1 normal, 2 error, 3 promiscuous mode
;RF_Misc_Routines.c,263 :: 		short int temp = 0;
;RF_Misc_Routines.c,265 :: 		switch(r_mode) {
	GOTO        L_set_reception_mode30
;RF_Misc_Routines.c,266 :: 		case 1: {
L_set_reception_mode32:
;RF_Misc_Routines.c,267 :: 		temp = read_ZIGBEE_short(RXMCR);      // normal mode
	CLRF        FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,268 :: 		temp = temp & (!0x03);                // mask for normal mode
	MOVLW       0
	ANDWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,269 :: 		write_ZIGBEE_short(RXMCR, temp);
	CLRF        FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,271 :: 		break;
	GOTO        L_set_reception_mode31
;RF_Misc_Routines.c,273 :: 		case 2: {
L_set_reception_mode33:
;RF_Misc_Routines.c,274 :: 		temp = read_ZIGBEE_short(RXMCR);      // error mode
	CLRF        FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,275 :: 		temp = temp & (!0x01);                // mask for error mode
	MOVLW       0
	ANDWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,276 :: 		temp = temp | 0x02;                   // mask for error mode
	BSF         FARG_write_ZIGBEE_short_data_r+0, 1 
;RF_Misc_Routines.c,277 :: 		write_ZIGBEE_short(RXMCR, temp);
	CLRF        FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,279 :: 		break;
	GOTO        L_set_reception_mode31
;RF_Misc_Routines.c,281 :: 		case 3: {
L_set_reception_mode34:
;RF_Misc_Routines.c,282 :: 		temp = read_ZIGBEE_short(RXMCR);      // promiscuous mode
	CLRF        FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,283 :: 		temp = temp & (!0x02);                // mask for promiscuous mode
	MOVLW       0
	ANDWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,284 :: 		temp = temp | 0x01;                   // mask for promiscuous mode
	BSF         FARG_write_ZIGBEE_short_data_r+0, 0 
;RF_Misc_Routines.c,285 :: 		write_ZIGBEE_short(RXMCR, temp);
	CLRF        FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,287 :: 		break;
	GOTO        L_set_reception_mode31
;RF_Misc_Routines.c,288 :: 		}
L_set_reception_mode30:
	MOVF        FARG_set_reception_mode_r_mode+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_set_reception_mode32
	MOVF        FARG_set_reception_mode_r_mode+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_set_reception_mode33
	MOVF        FARG_set_reception_mode_r_mode+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_set_reception_mode34
L_set_reception_mode31:
;RF_Misc_Routines.c,289 :: 		}
L_end_set_reception_mode:
	RETURN      0
; end of _set_reception_mode

_set_frame_format_filter:

;RF_Misc_Routines.c,294 :: 		void set_frame_format_filter(short int fff_mode) {   // 1 all frames, 2 command only, 3 data only, 4 beacon only
;RF_Misc_Routines.c,295 :: 		short int temp = 0;
;RF_Misc_Routines.c,297 :: 		switch(fff_mode) {
	GOTO        L_set_frame_format_filter35
;RF_Misc_Routines.c,298 :: 		case 1: {
L_set_frame_format_filter37:
;RF_Misc_Routines.c,299 :: 		temp = read_ZIGBEE_short(RXFLUSH);      // all frames
	MOVLW       13
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,300 :: 		temp = temp & (!0x0E);                  // mask for all frames
	MOVLW       0
	ANDWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,301 :: 		write_ZIGBEE_short(RXFLUSH, temp);
	MOVLW       13
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,303 :: 		break;
	GOTO        L_set_frame_format_filter36
;RF_Misc_Routines.c,305 :: 		case 2: {
L_set_frame_format_filter38:
;RF_Misc_Routines.c,306 :: 		temp = read_ZIGBEE_short(RXFLUSH);      // command only
	MOVLW       13
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,307 :: 		temp = temp & (!0x06);                  // mask for command only
	MOVLW       0
	ANDWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,308 :: 		temp = temp | 0x08;                     // mask for command only
	BSF         FARG_write_ZIGBEE_short_data_r+0, 3 
;RF_Misc_Routines.c,309 :: 		write_ZIGBEE_short(RXFLUSH, temp);
	MOVLW       13
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,311 :: 		break;
	GOTO        L_set_frame_format_filter36
;RF_Misc_Routines.c,313 :: 		case 3: {
L_set_frame_format_filter39:
;RF_Misc_Routines.c,314 :: 		temp = read_ZIGBEE_short(RXFLUSH);      // data only
	MOVLW       13
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,315 :: 		temp = temp & (!0x0A);                  // mask for data only
	MOVLW       0
	ANDWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,316 :: 		temp = temp | 0x04;                     // mask for data only
	BSF         FARG_write_ZIGBEE_short_data_r+0, 2 
;RF_Misc_Routines.c,317 :: 		write_ZIGBEE_short(RXFLUSH, temp);
	MOVLW       13
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,319 :: 		break;
	GOTO        L_set_frame_format_filter36
;RF_Misc_Routines.c,321 :: 		case 4: {
L_set_frame_format_filter40:
;RF_Misc_Routines.c,322 :: 		temp = read_ZIGBEE_short(RXFLUSH);      // beacon only
	MOVLW       13
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,323 :: 		temp = temp & (!0x0C);                  // mask for beacon only
	MOVLW       0
	ANDWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,324 :: 		temp = temp | 0x02;                     // mask for beacon only
	BSF         FARG_write_ZIGBEE_short_data_r+0, 1 
;RF_Misc_Routines.c,325 :: 		write_ZIGBEE_short(RXFLUSH, temp);
	MOVLW       13
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,327 :: 		break;
	GOTO        L_set_frame_format_filter36
;RF_Misc_Routines.c,328 :: 		}
L_set_frame_format_filter35:
	MOVF        FARG_set_frame_format_filter_fff_mode+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_set_frame_format_filter37
	MOVF        FARG_set_frame_format_filter_fff_mode+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_set_frame_format_filter38
	MOVF        FARG_set_frame_format_filter_fff_mode+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_set_frame_format_filter39
	MOVF        FARG_set_frame_format_filter_fff_mode+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_set_frame_format_filter40
L_set_frame_format_filter36:
;RF_Misc_Routines.c,329 :: 		}
L_end_set_frame_format_filter:
	RETURN      0
; end of _set_frame_format_filter

_flush_RX_FIFO_pointer:

;RF_Misc_Routines.c,334 :: 		void flush_RX_FIFO_pointer() {
;RF_Misc_Routines.c,337 :: 		temp = read_ZIGBEE_short(RXFLUSH);
	MOVLW       13
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,338 :: 		temp = temp | 0x01;                        // mask for flush RX FIFO
	MOVLW       1
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,339 :: 		write_ZIGBEE_short(RXFLUSH, temp);
	MOVLW       13
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,340 :: 		}
L_end_flush_RX_FIFO_pointer:
	RETURN      0
; end of _flush_RX_FIFO_pointer

_set_short_address:

;RF_Misc_Routines.c,345 :: 		void set_short_address(short int * address) {
;RF_Misc_Routines.c,346 :: 		write_ZIGBEE_short(SADRL, address[0]);
	MOVLW       3
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVFF       FARG_set_short_address_address+0, FSR0
	MOVFF       FARG_set_short_address_address+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,347 :: 		write_ZIGBEE_short(SADRH, address[1]);
	MOVLW       4
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVLW       1
	ADDWF       FARG_set_short_address_address+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_set_short_address_address+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,348 :: 		}
L_end_set_short_address:
	RETURN      0
; end of _set_short_address

_set_long_address:

;RF_Misc_Routines.c,350 :: 		void set_long_address(short int * address) {
;RF_Misc_Routines.c,351 :: 		short int i = 0;
	CLRF        set_long_address_i_L0+0 
;RF_Misc_Routines.c,353 :: 		for(i = 0; i < 8; i++) {
	CLRF        set_long_address_i_L0+0 
L_set_long_address41:
	MOVLW       128
	XORWF       set_long_address_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       8
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_set_long_address42
;RF_Misc_Routines.c,354 :: 		write_ZIGBEE_short(EADR0 + i, address[i]);   // 0x05 address of EADR0
	MOVF        set_long_address_i_L0+0, 0 
	ADDLW       5
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVF        set_long_address_i_L0+0, 0 
	ADDWF       FARG_set_long_address_address+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	BTFSC       set_long_address_i_L0+0, 7 
	MOVLW       255
	ADDWFC      FARG_set_long_address_address+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,353 :: 		for(i = 0; i < 8; i++) {
	INCF        set_long_address_i_L0+0, 1 
;RF_Misc_Routines.c,355 :: 		}
	GOTO        L_set_long_address41
L_set_long_address42:
;RF_Misc_Routines.c,356 :: 		}
L_end_set_long_address:
	RETURN      0
; end of _set_long_address

_set_PAN_ID:

;RF_Misc_Routines.c,358 :: 		void set_PAN_ID(short int * address) {
;RF_Misc_Routines.c,359 :: 		write_ZIGBEE_short(PANIDL, address[0]);
	MOVLW       1
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVFF       FARG_set_PAN_ID_address+0, FSR0
	MOVFF       FARG_set_PAN_ID_address+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,360 :: 		write_ZIGBEE_short(PANIDH, address[1]);
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVLW       1
	ADDWF       FARG_set_PAN_ID_address+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_set_PAN_ID_address+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,361 :: 		}
L_end_set_PAN_ID:
	RETURN      0
; end of _set_PAN_ID

_set_wake_from_pin:

;RF_Misc_Routines.c,366 :: 		void set_wake_from_pin() {
;RF_Misc_Routines.c,367 :: 		short int temp = 0;
;RF_Misc_Routines.c,369 :: 		WAKE = 0;
	BCF         WAKE+0, BitPos(WAKE+0) 
;RF_Misc_Routines.c,370 :: 		temp = read_ZIGBEE_short(RXFLUSH);
	MOVLW       13
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,371 :: 		temp = temp | 0x60;                     // mask
	MOVLW       96
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,372 :: 		write_ZIGBEE_short(RXFLUSH, temp);
	MOVLW       13
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,374 :: 		temp = read_ZIGBEE_short(WAKECON);
	MOVLW       34
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,375 :: 		temp = temp | 0x80;
	MOVLW       128
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_Misc_Routines.c,376 :: 		write_ZIGBEE_short(WAKECON, temp);
	MOVLW       34
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,377 :: 		}
L_end_set_wake_from_pin:
	RETURN      0
; end of _set_wake_from_pin

_pin_wake:

;RF_Misc_Routines.c,379 :: 		void pin_wake() {
;RF_Misc_Routines.c,380 :: 		WAKE = 1;
	BSF         WAKE+0, BitPos(WAKE+0) 
;RF_Misc_Routines.c,381 :: 		Delay_ms(5);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_pin_wake44:
	DECFSZ      R13, 1, 1
	BRA         L_pin_wake44
	DECFSZ      R12, 1, 1
	BRA         L_pin_wake44
;RF_Misc_Routines.c,382 :: 		}
L_end_pin_wake:
	RETURN      0
; end of _pin_wake

_enable_PLL:

;RF_Misc_Routines.c,387 :: 		void enable_PLL() {
;RF_Misc_Routines.c,388 :: 		write_ZIGBEE_long(RFCON2, 0x80);       // mask for PLL enable
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       128
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,389 :: 		}
L_end_enable_PLL:
	RETURN      0
; end of _enable_PLL

_disable_PLL:

;RF_Misc_Routines.c,391 :: 		void disable_PLL() {
;RF_Misc_Routines.c,392 :: 		write_ZIGBEE_long(RFCON2, 0x00);       // mask for PLL disable
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	CLRF        FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,393 :: 		}
L_end_disable_PLL:
	RETURN      0
; end of _disable_PLL

_set_TX_power:

;RF_Misc_Routines.c,398 :: 		void set_TX_power(unsigned short int power) {             // 0-31 possible variants
;RF_Misc_Routines.c,399 :: 		if((power < 0) || (power > 31))
	MOVLW       0
	SUBWF       FARG_set_TX_power_power+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__set_TX_power49
	MOVF        FARG_set_TX_power_power+0, 0 
	SUBLW       31
	BTFSS       STATUS+0, 0 
	GOTO        L__set_TX_power49
	GOTO        L_set_TX_power47
L__set_TX_power49:
;RF_Misc_Routines.c,400 :: 		power = 31;
	MOVLW       31
	MOVWF       FARG_set_TX_power_power+0 
L_set_TX_power47:
;RF_Misc_Routines.c,401 :: 		power = 31 - power;                                     // 0 max, 31 min -> 31 max, 0 min
	MOVF        FARG_set_TX_power_power+0, 0 
	SUBLW       31
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_set_TX_power_power+0 
;RF_Misc_Routines.c,402 :: 		power = ((power & 0b00011111) << 3) & 0b11111000;       // calculating power
	MOVLW       31
	ANDWF       R0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVLW       248
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       FARG_set_TX_power_power+0 
;RF_Misc_Routines.c,403 :: 		write_ZIGBEE_long(RFCON3, power);
	MOVLW       3
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVF        R0, 0 
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,404 :: 		}
L_end_set_TX_power:
	RETURN      0
; end of _set_TX_power

_init_ZIGBEE_basic:

;RF_Misc_Routines.c,409 :: 		void init_ZIGBEE_basic() {
;RF_Misc_Routines.c,410 :: 		write_ZIGBEE_short(PACON2, 0x98);   // Initialize FIFOEN = 1 and TXONTS = 0x6
	MOVLW       24
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVLW       152
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,411 :: 		write_ZIGBEE_short(TXSTBL, 0x95);   // Initialize RFSTBL = 0x9
	MOVLW       46
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	MOVLW       149
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_Misc_Routines.c,412 :: 		write_ZIGBEE_long(RFCON1, 0x01);    // Initialize VCOOPT = 0x01
	MOVLW       1
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       1
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,413 :: 		enable_PLL();                       // Enable PLL (PLLEN = 1)
	CALL        _enable_PLL+0, 0
;RF_Misc_Routines.c,414 :: 		write_ZIGBEE_long(RFCON6, 0x90);    // Initialize TXFIL = 1 and 20MRECVR = 1
	MOVLW       6
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       144
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,415 :: 		write_ZIGBEE_long(RFCON7, 0x80);    // Initialize SLPCLKSEL = 0x2 (100 kHz Internal oscillator)
	MOVLW       7
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       128
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,416 :: 		write_ZIGBEE_long(RFCON8, 0x10);    // Initialize RFVCO = 1
	MOVLW       8
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       16
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,417 :: 		write_ZIGBEE_long(SLPCON1, 0x21);   // Initialize CLKOUTEN = 1 and SLPCLKDIV = 0x01
	MOVLW       32
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       33
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,418 :: 		write_ZIGBEE_long(TESTMODE, 0x0F);  // Optimized RSSI (default) and Set to use external LNA and PA on high power module
	MOVLW       47
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       2
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       15
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_Misc_Routines.c,419 :: 		}
L_end_init_ZIGBEE_basic:
	RETURN      0
; end of _init_ZIGBEE_basic

_init_ZIGBEE_nonbeacon:

;RF_Misc_Routines.c,421 :: 		void init_ZIGBEE_nonbeacon() {
;RF_Misc_Routines.c,422 :: 		init_ZIGBEE_basic();
	CALL        _init_ZIGBEE_basic+0, 0
;RF_Misc_Routines.c,423 :: 		set_CCA_mode(1);     // Set CCA mode to ED and set threshold
	MOVLW       1
	MOVWF       FARG_set_CCA_mode_CCA_mode+0 
	CALL        _set_CCA_mode+0, 0
;RF_Misc_Routines.c,424 :: 		set_RSSI_mode(2);    // RSSI2 mode
	MOVLW       2
	MOVWF       FARG_set_RSSI_mode_RSSI_mode+0 
	CALL        _set_RSSI_mode+0, 0
;RF_Misc_Routines.c,425 :: 		enable_interrupt();  // Enables all interrupts
	CALL        _enable_interrupt+0, 0
;RF_Misc_Routines.c,426 :: 		set_channel(ZIGBEE_CHANNEL);     // Tested at 25 - now using  20 - 15, 20 ,25,26 are non wifi overlapping
	MOVLW       20
	MOVWF       FARG_set_channel_channel_number+0 
	CALL        _set_channel+0, 0
;RF_Misc_Routines.c,427 :: 		RF_reset();
	CALL        _RF_reset+0, 0
;RF_Misc_Routines.c,428 :: 		}
L_end_init_ZIGBEE_nonbeacon:
	RETURN      0
; end of _init_ZIGBEE_nonbeacon

_send_test_message:

;RF_Misc_Routines.c,430 :: 		void send_test_message(uint8_t cmd)
;RF_Misc_Routines.c,434 :: 		DATA_TX[0] = cmd; // Command for Bind with Flash
	MOVF        FARG_send_test_message_cmd+0, 0 
	MOVWF       _DATA_TX+0 
;RF_Misc_Routines.c,435 :: 		write_TX_normal_FIFO();          // Transmiting
	CALL        _write_TX_normal_FIFO+0, 0
;RF_Misc_Routines.c,439 :: 		}
L_end_send_test_message:
	RETURN      0
; end of _send_test_message

_send_broadcast_message:

;RF_Misc_Routines.c,441 :: 		void send_broadcast_message(uint8_t cmd)
;RF_Misc_Routines.c,445 :: 		DATA_TX[0] = cmd; // Command for Bind with Flash
	MOVF        FARG_send_broadcast_message_cmd+0, 0 
	MOVWF       _DATA_TX+0 
;RF_Misc_Routines.c,446 :: 		write_TX_normal_FIFO();          // Transmiting
	CALL        _write_TX_normal_FIFO+0, 0
;RF_Misc_Routines.c,450 :: 		}
L_end_send_broadcast_message:
	RETURN      0
; end of _send_broadcast_message
