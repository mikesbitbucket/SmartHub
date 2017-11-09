
_interrupt_low:
	MOVWF       ___Low_saveWREG+0 
	MOVF        STATUS+0, 0 
	MOVWF       ___Low_saveSTATUS+0 
	MOVF        BSR+0, 0 
	MOVWF       ___Low_saveBSR+0 

;CHi_Hub_VGCLD_main.c,133 :: 		void interrupt_low() {
;CHi_Hub_VGCLD_main.c,135 :: 		if (TMR5IF_bit == 1) {
	BTFSS       TMR5IF_bit+0, BitPos(TMR5IF_bit+0) 
	GOTO        L_interrupt_low0
;CHi_Hub_VGCLD_main.c,136 :: 		heartbeat_tmr++;
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
;CHi_Hub_VGCLD_main.c,137 :: 		open_close_tmr++;
	MOVLW       1
	ADDWF       _open_close_tmr+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _open_close_tmr+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _open_close_tmr+0 
	MOVF        R1, 0 
	MOVWF       _open_close_tmr+1 
;CHi_Hub_VGCLD_main.c,138 :: 		time_out_tmr++;
	MOVLW       1
	ADDWF       _time_out_tmr+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      _time_out_tmr+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _time_out_tmr+0 
	MOVF        R1, 0 
	MOVWF       _time_out_tmr+1 
;CHi_Hub_VGCLD_main.c,139 :: 		TMR5ON_bit = 0;
	BCF         TMR5ON_bit+0, BitPos(TMR5ON_bit+0) 
;CHi_Hub_VGCLD_main.c,140 :: 		TMR5H = TMR_RELOAD_HIGH;
	MOVLW       21
	MOVWF       TMR5H+0 
;CHi_Hub_VGCLD_main.c,141 :: 		TMR5L = TMR_RELOAD_LOW;
	MOVLW       160
	MOVWF       TMR5L+0 
;CHi_Hub_VGCLD_main.c,142 :: 		TMR5IF_bit = 0;
	BCF         TMR5IF_bit+0, BitPos(TMR5IF_bit+0) 
;CHi_Hub_VGCLD_main.c,143 :: 		TMR5ON_bit = 1;
	BSF         TMR5ON_bit+0, BitPos(TMR5ON_bit+0) 
;CHi_Hub_VGCLD_main.c,144 :: 		}
L_interrupt_low0:
;CHi_Hub_VGCLD_main.c,150 :: 		GIEL_bit = 1; // enable low priority interrupts
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
;CHi_Hub_VGCLD_main.c,151 :: 		}
L_end_interrupt_low:
L__interrupt_low39:
	MOVF        ___Low_saveBSR+0, 0 
	MOVWF       BSR+0 
	MOVF        ___Low_saveSTATUS+0, 0 
	MOVWF       STATUS+0 
	SWAPF       ___Low_saveWREG+0, 1 
	SWAPF       ___Low_saveWREG+0, 0 
	RETFIE      0
; end of _interrupt_low

_main:

;CHi_Hub_VGCLD_main.c,154 :: 		void main() {
;CHi_Hub_VGCLD_main.c,156 :: 		Start_TP();
	CALL        _Start_TP+0, 0
;CHi_Hub_VGCLD_main.c,160 :: 		Read_params(EEParams.Params_Array);
	MOVLW       _EEParams+0
	MOVWF       FARG_Read_params_ptr+0 
	MOVLW       hi_addr(_EEParams+0)
	MOVWF       FARG_Read_params_ptr+1 
	CALL        _Read_params+0, 0
;CHi_Hub_VGCLD_main.c,161 :: 		if(EEParams.HubParams.MyLongAddress[6] == 0xAA)
	MOVF        _EEParams+13, 0 
	XORLW       170
	BTFSS       STATUS+0, 2 
	GOTO        L_main1
;CHi_Hub_VGCLD_main.c,165 :: 		}
	GOTO        L_main2
L_main1:
;CHi_Hub_VGCLD_main.c,169 :: 		for(i=0; i<8; i++)
	CLRF        _i+0 
L_main3:
	MOVLW       8
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;CHi_Hub_VGCLD_main.c,172 :: 		EEParams.HubParams.MyLongAddress[i]=EEPROM_Read(i); // Default MAC stored at EE address 0-7 - this is written at program time by SQRT
	MOVLW       _EEParams+7
	MOVWF       FLOC__main+0 
	MOVLW       hi_addr(_EEParams+7)
	MOVWF       FLOC__main+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__main+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__main+1, 1 
	MOVF        _i+0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Read_address+1 
	CALL        _EEPROM_Read+0, 0
	MOVFF       FLOC__main+0, FSR1
	MOVFF       FLOC__main+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CHi_Hub_VGCLD_main.c,169 :: 		for(i=0; i<8; i++)
	INCF        _i+0, 1 
;CHi_Hub_VGCLD_main.c,173 :: 		}
	GOTO        L_main3
L_main4:
;CHi_Hub_VGCLD_main.c,174 :: 		if(EEParams.HubParams.MyLongAddress[7] == 0xFF)
	MOVF        _EEParams+14, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;CHi_Hub_VGCLD_main.c,177 :: 		for(i=0; i<8; i++)
	CLRF        _i+0 
L_main7:
	MOVLW       8
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
;CHi_Hub_VGCLD_main.c,179 :: 		EEParams.HubParams.MyLongAddress[i] = DefaultHubAddress[i];  // Use this if no address programmed in by SQTP in first 8 EEPROM locations
	MOVLW       _EEParams+7
	MOVWF       FSR1 
	MOVLW       hi_addr(_EEParams+7)
	MOVWF       FSR1H 
	MOVF        _i+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _DefaultHubAddress+0
	ADDWF       _i+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_DefaultHubAddress+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_DefaultHubAddress+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CHi_Hub_VGCLD_main.c,177 :: 		for(i=0; i<8; i++)
	INCF        _i+0, 1 
;CHi_Hub_VGCLD_main.c,181 :: 		}
	GOTO        L_main7
L_main8:
;CHi_Hub_VGCLD_main.c,182 :: 		}
L_main6:
;CHi_Hub_VGCLD_main.c,183 :: 		EEParams.HubParams.Backlight_Level = BLUE_DUTY_CYCLE_HIGH; // Set initial to brightest
	MOVLW       240
	MOVWF       _EEParams+0 
;CHi_Hub_VGCLD_main.c,184 :: 		EEParams.HubParams.MyPanID[0] = DEFAULT_PAN_ID_0; // Default PAN
	MOVLW       170
	MOVWF       _EEParams+1 
;CHi_Hub_VGCLD_main.c,185 :: 		EEParams.HubParams.MyPanID[1] = DEFAULT_PAN_ID_1; // Default PAN
	MOVLW       85
	MOVWF       _EEParams+2 
;CHi_Hub_VGCLD_main.c,186 :: 		EEParams.HubParams.MyShortAddress[0] = DEFAULT_SHORT_ADDRESS_0; // Default Address
	MOVLW       18
	MOVWF       _EEParams+5 
;CHi_Hub_VGCLD_main.c,187 :: 		EEParams.HubParams.MyShortAddress[1] = DEFAULT_SHORT_ADDRESS_1; // Default Address
	MOVLW       52
	MOVWF       _EEParams+6 
;CHi_Hub_VGCLD_main.c,190 :: 		EEParams.HubParams.TP_Cals[0] = 200; // Xmin
	MOVLW       200
	MOVWF       _EEParams+15 
	MOVLW       0
	MOVWF       _EEParams+16 
;CHi_Hub_VGCLD_main.c,191 :: 		EEParams.HubParams.TP_Cals[1] = 3815; // Xmax
	MOVLW       231
	MOVWF       _EEParams+17 
	MOVLW       14
	MOVWF       _EEParams+18 
;CHi_Hub_VGCLD_main.c,192 :: 		EEParams.HubParams.TP_Cals[2] = 380; // Ymin
	MOVLW       124
	MOVWF       _EEParams+19 
	MOVLW       1
	MOVWF       _EEParams+20 
;CHi_Hub_VGCLD_main.c,193 :: 		EEParams.HubParams.TP_Cals[3] = 3615; // Ymax
	MOVLW       31
	MOVWF       _EEParams+21 
	MOVLW       14
	MOVWF       _EEParams+22 
;CHi_Hub_VGCLD_main.c,196 :: 		for(i=0; i<4; i++)
	CLRF        _i+0 
L_main10:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main11
;CHi_Hub_VGCLD_main.c,198 :: 		EEParams.HubParams.Password[i] = 0x31 + i; // Ascii 1234
	MOVLW       _EEParams+23
	MOVWF       FSR1 
	MOVLW       hi_addr(_EEParams+23)
	MOVWF       FSR1H 
	MOVF        _i+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        _i+0, 0 
	ADDLW       49
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;CHi_Hub_VGCLD_main.c,196 :: 		for(i=0; i<4; i++)
	INCF        _i+0, 1 
;CHi_Hub_VGCLD_main.c,199 :: 		}
	GOTO        L_main10
L_main11:
;CHi_Hub_VGCLD_main.c,200 :: 		EEParams.HubParams.Password[4] = 0 ; // Null terminator for string compare
	CLRF        _EEParams+27 
;CHi_Hub_VGCLD_main.c,203 :: 		Write_params(EEParams.Params_Array);
	MOVLW       _EEParams+0
	MOVWF       FARG_Write_params_ptr+0 
	MOVLW       hi_addr(_EEParams+0)
	MOVWF       FARG_Write_params_ptr+1 
	CALL        _Write_params+0, 0
;CHi_Hub_VGCLD_main.c,206 :: 		for(i=0; i<5; i++)
	CLRF        _i+0 
L_main13:
	MOVLW       5
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;CHi_Hub_VGCLD_main.c,208 :: 		for(j=0; j<3; j++)
	CLRF        _j+0 
L_main16:
	MOVLW       3
	SUBWF       _j+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main17
;CHi_Hub_VGCLD_main.c,210 :: 		BacklightRed = 1;
	BSF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;CHi_Hub_VGCLD_main.c,211 :: 		BacklightGreen = 1;
	BSF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;CHi_Hub_VGCLD_main.c,212 :: 		BLUE_DUTY_CYCLE = 255;
	MOVLW       255
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_main.c,213 :: 		Delay_ms(100);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
	NOP
;CHi_Hub_VGCLD_main.c,214 :: 		BacklightRed = 0;  // Change Color
	BCF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;CHi_Hub_VGCLD_main.c,215 :: 		Delay_ms(100);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_main20:
	DECFSZ      R13, 1, 1
	BRA         L_main20
	DECFSZ      R12, 1, 1
	BRA         L_main20
	DECFSZ      R11, 1, 1
	BRA         L_main20
	NOP
;CHi_Hub_VGCLD_main.c,208 :: 		for(j=0; j<3; j++)
	INCF        _j+0, 1 
;CHi_Hub_VGCLD_main.c,216 :: 		}
	GOTO        L_main16
L_main17:
;CHi_Hub_VGCLD_main.c,217 :: 		BacklightRed = 1;
	BSF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;CHi_Hub_VGCLD_main.c,218 :: 		Delay_ms(250);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main21:
	DECFSZ      R13, 1, 1
	BRA         L_main21
	DECFSZ      R12, 1, 1
	BRA         L_main21
	DECFSZ      R11, 1, 1
	BRA         L_main21
	NOP
	NOP
;CHi_Hub_VGCLD_main.c,219 :: 		Delay_ms(250);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main22:
	DECFSZ      R13, 1, 1
	BRA         L_main22
	DECFSZ      R12, 1, 1
	BRA         L_main22
	DECFSZ      R11, 1, 1
	BRA         L_main22
	NOP
	NOP
;CHi_Hub_VGCLD_main.c,206 :: 		for(i=0; i<5; i++)
	INCF        _i+0, 1 
;CHi_Hub_VGCLD_main.c,220 :: 		}
	GOTO        L_main13
L_main14:
;CHi_Hub_VGCLD_main.c,221 :: 		BacklightRed = 1;
	BSF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;CHi_Hub_VGCLD_main.c,222 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level; // set the duty cycle Register - that's why it's in CAPS - it's a define
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_main.c,225 :: 		} // end test for new part
L_main2:
;CHi_Hub_VGCLD_main.c,232 :: 		DrawScreen(&ScreenWelcome);
	MOVLW       _ScreenWelcome+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenWelcome+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_main.c,233 :: 		BacklightRed = 1;
	BSF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;CHi_Hub_VGCLD_main.c,234 :: 		BacklightGreen = 1;
	BSF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;CHi_Hub_VGCLD_main.c,235 :: 		My_Init();
	CALL        _My_Init+0, 0
;CHi_Hub_VGCLD_main.c,236 :: 		RF_Initialize();
	CALL        _RF_Initialize+0, 0
;CHi_Hub_VGCLD_main.c,237 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;  // Set to default power to start (full if new part)
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_main.c,244 :: 		TMR5ON_bit = 1;
	BSF         TMR5ON_bit+0, BitPos(TMR5ON_bit+0) 
;CHi_Hub_VGCLD_main.c,245 :: 		GIEL_bit = 1; // enable low priority interrupts
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
;CHi_Hub_VGCLD_main.c,246 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;CHi_Hub_VGCLD_main.c,250 :: 		for(i=0; i<250; i++)
	CLRF        _i+0 
L_main23:
	MOVLW       250
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main24
;CHi_Hub_VGCLD_main.c,252 :: 		Buzzer_Out = 1;
	BSF         Buzzer_Out+0, BitPos(Buzzer_Out+0) 
;CHi_Hub_VGCLD_main.c,253 :: 		Delay_us(140);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       45
	MOVWF       R13, 0
L_main26:
	DECFSZ      R13, 1, 1
	BRA         L_main26
	DECFSZ      R12, 1, 1
	BRA         L_main26
;CHi_Hub_VGCLD_main.c,254 :: 		Buzzer_Out = 0;
	BCF         Buzzer_Out+0, BitPos(Buzzer_Out+0) 
;CHi_Hub_VGCLD_main.c,255 :: 		Delay_us(140);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       45
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
;CHi_Hub_VGCLD_main.c,250 :: 		for(i=0; i<250; i++)
	INCF        _i+0, 1 
;CHi_Hub_VGCLD_main.c,256 :: 		}
	GOTO        L_main23
L_main24:
;CHi_Hub_VGCLD_main.c,259 :: 		while (1) {
L_main28:
;CHi_Hub_VGCLD_main.c,260 :: 		Check_TP();
	CALL        _Check_TP+0, 0
;CHi_Hub_VGCLD_main.c,262 :: 		if(heartbeat_tmr > 10) // 100ms tics
	MOVLW       0
	MOVWF       R0 
	MOVF        _heartbeat_tmr+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main41
	MOVF        _heartbeat_tmr+0, 0 
	SUBLW       10
L__main41:
	BTFSC       STATUS+0, 0 
	GOTO        L_main30
;CHi_Hub_VGCLD_main.c,265 :: 		heartbeat_tmr = 0;
	CLRF        _heartbeat_tmr+0 
	CLRF        _heartbeat_tmr+1 
;CHi_Hub_VGCLD_main.c,268 :: 		one_second_tic++; // Inc this variable - test for 1 second events
	INCF        _one_second_tic+0, 1 
;CHi_Hub_VGCLD_main.c,269 :: 		two_second_tic++; // Inc this variable - test for 2 second events
	INCF        _two_second_tic+0, 1 
;CHi_Hub_VGCLD_main.c,270 :: 		if(one_second_tic >= 10)
	MOVLW       10
	SUBWF       _one_second_tic+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main31
;CHi_Hub_VGCLD_main.c,273 :: 		one_second_tic = 0;
	CLRF        _one_second_tic+0 
;CHi_Hub_VGCLD_main.c,274 :: 		if(g_send_bind_with_flash == 1) // should we send out the Bind with Flash command?
	MOVF        _g_send_bind_with_flash+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main32
;CHi_Hub_VGCLD_main.c,276 :: 		send_broadcast_message(CMD_BIND_WITH_FLASH); // Send message
	MOVLW       2
	MOVWF       FARG_send_broadcast_message_cmd+0 
	CALL        _send_broadcast_message+0, 0
;CHi_Hub_VGCLD_main.c,277 :: 		time_out_tmr = 0; // Reset timer so this command stays active...
	CLRF        _time_out_tmr+0 
	CLRF        _time_out_tmr+1 
;CHi_Hub_VGCLD_main.c,278 :: 		}
	GOTO        L_main33
L_main32:
;CHi_Hub_VGCLD_main.c,279 :: 		else if(g_send_bind_no_flash == 1)  // use else if tree so no multiple commands
	MOVF        _g_send_bind_no_flash+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main34
;CHi_Hub_VGCLD_main.c,281 :: 		send_broadcast_message(CMD_BIND_NO_FLASH); // Send message
	MOVLW       1
	MOVWF       FARG_send_broadcast_message_cmd+0 
	CALL        _send_broadcast_message+0, 0
;CHi_Hub_VGCLD_main.c,282 :: 		time_out_tmr = 0; // Reset timer so this command stays active...
	CLRF        _time_out_tmr+0 
	CLRF        _time_out_tmr+1 
;CHi_Hub_VGCLD_main.c,283 :: 		}
L_main34:
L_main33:
;CHi_Hub_VGCLD_main.c,284 :: 		}   // end 1 second tic stuff
L_main31:
;CHi_Hub_VGCLD_main.c,285 :: 		if(two_second_tic >= 20)
	MOVLW       20
	SUBWF       _two_second_tic+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main35
;CHi_Hub_VGCLD_main.c,288 :: 		two_second_tic = 0;
	CLRF        _two_second_tic+0 
;CHi_Hub_VGCLD_main.c,289 :: 		if(g_send_flash == 1) // should we send out the Flash all chairs command?
	MOVF        _g_send_flash+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main36
;CHi_Hub_VGCLD_main.c,291 :: 		send_broadcast_message(CMD_FLASH_CHAIR); // Send message
	MOVLW       9
	MOVWF       FARG_send_broadcast_message_cmd+0 
	CALL        _send_broadcast_message+0, 0
;CHi_Hub_VGCLD_main.c,292 :: 		time_out_tmr = 0; // Reset timer so this command stays active...
	CLRF        _time_out_tmr+0 
	CLRF        _time_out_tmr+1 
;CHi_Hub_VGCLD_main.c,293 :: 		}
L_main36:
;CHi_Hub_VGCLD_main.c,294 :: 		}   // end 2 second tic stuff
L_main35:
;CHi_Hub_VGCLD_main.c,298 :: 		Send_RF_Broadcast_Cmd_n(0); // By sending zero, we just check if it is running and have it send out if it is
	CLRF        FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_main.c,300 :: 		}    // end 100ms tic stuff
L_main30:
;CHi_Hub_VGCLD_main.c,303 :: 		if(time_out_tmr > TIME_OUT_NO_ACTIVITY)
	MOVF        _time_out_tmr+1, 0 
	SUBLW       23
	BTFSS       STATUS+0, 2 
	GOTO        L__main42
	MOVF        _time_out_tmr+0, 0 
	SUBLW       112
L__main42:
	BTFSC       STATUS+0, 0 
	GOTO        L_main37
;CHi_Hub_VGCLD_main.c,305 :: 		time_out_tmr = 0;
	CLRF        _time_out_tmr+0 
	CLRF        _time_out_tmr+1 
;CHi_Hub_VGCLD_main.c,306 :: 		BacklightRed = 1;  // off
	BSF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;CHi_Hub_VGCLD_main.c,307 :: 		BacklightGreen = 1;  // off
	BSF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;CHi_Hub_VGCLD_main.c,308 :: 		BLUE_DUTY_CYCLE = 0;  // Set Blue PWM to OFF
	CLRF        CCPR3L+0 
;CHi_Hub_VGCLD_main.c,309 :: 		strcpy(lPWLabel_Caption, "      ");  // Clear PW field just in case they left something there
	MOVLW       _lPWLabel_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_lPWLabel_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr1_CHi_Hub_VGCLD_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr1_CHi_Hub_VGCLD_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CHi_Hub_VGCLD_main.c,310 :: 		strcpy(lChPWLabel_Caption, "    ");
	MOVLW       _lChPWLabel_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_lChPWLabel_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr2_CHi_Hub_VGCLD_main+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr2_CHi_Hub_VGCLD_main+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CHi_Hub_VGCLD_main.c,311 :: 		DrawScreen(&ScreenWelcome);
	MOVLW       _ScreenWelcome+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenWelcome+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_main.c,312 :: 		}
L_main37:
;CHi_Hub_VGCLD_main.c,313 :: 		}
	GOTO        L_main28
;CHi_Hub_VGCLD_main.c,315 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
