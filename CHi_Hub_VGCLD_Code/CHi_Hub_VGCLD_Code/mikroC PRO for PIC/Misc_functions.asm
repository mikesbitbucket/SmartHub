
_My_Init:

;Misc_functions.c,51 :: 		void My_Init(void)
;Misc_functions.c,59 :: 		BLUE_DUTY_CYCLE = 64; // 25% duty cycle - Mapped to CCPR3L
	MOVLW       64
	MOVWF       CCPR3L+0 
;Misc_functions.c,60 :: 		CCPTMRS0 = 0b01000000;  // Map to timer 4
	MOVLW       64
	MOVWF       CCPTMRS0+0 
;Misc_functions.c,61 :: 		PR4 = 0xFF; // Period register - lowest frequency
	MOVLW       255
	MOVWF       PR4+0 
;Misc_functions.c,62 :: 		CCP3CON = 0b00001111; // Single output, Lower duty cycle = 0, PWM Mode A is active low
	MOVLW       15
	MOVWF       CCP3CON+0 
;Misc_functions.c,63 :: 		T4CON = 0xFF; // 1:16 post scale, timer on, 1:16 Prescale in
	MOVLW       255
	MOVWF       T4CON+0 
;Misc_functions.c,64 :: 		TMR4IP_bit = 1; // High priority (default)
	BSF         TMR4IP_bit+0, BitPos(TMR4IP_bit+0) 
;Misc_functions.c,65 :: 		PSTR3CON = 0b00010001; // STR signal control output, Sync on PWM Period, Only A output
	MOVLW       17
	MOVWF       PSTR3CON+0 
;Misc_functions.c,80 :: 		T5CON         = 0x10; // Not turned on yet
	MOVLW       16
	MOVWF       T5CON+0 
;Misc_functions.c,81 :: 		TMR5IF_bit         = 0;
	BCF         TMR5IF_bit+0, BitPos(TMR5IF_bit+0) 
;Misc_functions.c,82 :: 		TMR5H         = 0x15;
	MOVLW       21
	MOVWF       TMR5H+0 
;Misc_functions.c,83 :: 		TMR5L         = 0xA0;
	MOVLW       160
	MOVWF       TMR5L+0 
;Misc_functions.c,84 :: 		TMR5IP_bit  = 0;  // low priority
	BCF         TMR5IP_bit+0, BitPos(TMR5IP_bit+0) 
;Misc_functions.c,85 :: 		TMR5IE_bit         = 1;
	BSF         TMR5IE_bit+0, BitPos(TMR5IE_bit+0) 
;Misc_functions.c,90 :: 		Buzzer_Direction = 0;
	BCF         TRISJ7_bit+0, BitPos(TRISJ7_bit+0) 
;Misc_functions.c,91 :: 		Buzzer_Out = 0;
	BCF         LATJ7_bit+0, BitPos(LATJ7_bit+0) 
;Misc_functions.c,97 :: 		IPEN_bit = 1; // Enable Priority interrupts
	BSF         IPEN_bit+0, BitPos(IPEN_bit+0) 
;Misc_functions.c,98 :: 		GIEH_bit = 1; // Enable high priority interrupts
	BSF         GIEH_bit+0, BitPos(GIEH_bit+0) 
;Misc_functions.c,99 :: 		GIEL_bit = 1; // enable low priority interrupts
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
;Misc_functions.c,102 :: 		TP_Set_Calibration_Consts(EEParams.HubParams.TP_Cals[0], EEParams.HubParams.TP_Cals[1], EEParams.HubParams.TP_Cals[2], EEParams.HubParams.TP_Cals[3]);
	MOVF        _EEParams+15, 0 
	MOVWF       FARG_TP_Set_Calibration_Consts_x_min+0 
	MOVF        _EEParams+16, 0 
	MOVWF       FARG_TP_Set_Calibration_Consts_x_min+1 
	MOVF        _EEParams+17, 0 
	MOVWF       FARG_TP_Set_Calibration_Consts_x_max+0 
	MOVF        _EEParams+18, 0 
	MOVWF       FARG_TP_Set_Calibration_Consts_x_max+1 
	MOVF        _EEParams+19, 0 
	MOVWF       FARG_TP_Set_Calibration_Consts_y_min+0 
	MOVF        _EEParams+20, 0 
	MOVWF       FARG_TP_Set_Calibration_Consts_y_min+1 
	MOVF        _EEParams+21, 0 
	MOVWF       FARG_TP_Set_Calibration_Consts_y_max+0 
	MOVF        _EEParams+22, 0 
	MOVWF       FARG_TP_Set_Calibration_Consts_y_max+1 
	CALL        _TP_Set_Calibration_Consts+0, 0
;Misc_functions.c,104 :: 		}      // End My Init
L_end_My_Init:
	RETURN      0
; end of _My_Init

_Display_Cals:

;Misc_functions.c,106 :: 		void Display_Cals()
;Misc_functions.c,113 :: 		T6963C_grFill(0);                                        // Clear display
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;Misc_functions.c,114 :: 		T6963C_txtFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_start+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;Misc_functions.c,115 :: 		T6963C_Set_Font_Adv(T6963C_defaultFont, T6963C_WHITE, _T6963C_HORIZONTAL);
	MOVLW       _T6963C_defaultFont+0
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+0 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+1 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+2 
	MOVLW       8
	MOVWF       FARG_T6963C_Set_Font_Adv_font_color+0 
	CLRF        FARG_T6963C_Set_Font_Adv_font_orientation+0 
	CALL        _T6963C_Set_Font_Adv+0, 0
;Misc_functions.c,116 :: 		TP_Get_Calibration_Consts(&tp_xmin, &tp_xmax, &tp_ymin, &tp_ymax);
	MOVLW       Display_Cals_tp_xmin_L0+0
	MOVWF       FARG_TP_Get_Calibration_Consts_x_min+0 
	MOVLW       hi_addr(Display_Cals_tp_xmin_L0+0)
	MOVWF       FARG_TP_Get_Calibration_Consts_x_min+1 
	MOVLW       Display_Cals_tp_xmax_L0+0
	MOVWF       FARG_TP_Get_Calibration_Consts_x_max+0 
	MOVLW       hi_addr(Display_Cals_tp_xmax_L0+0)
	MOVWF       FARG_TP_Get_Calibration_Consts_x_max+1 
	MOVLW       Display_Cals_tp_ymin_L0+0
	MOVWF       FARG_TP_Get_Calibration_Consts_y_min+0 
	MOVLW       hi_addr(Display_Cals_tp_ymin_L0+0)
	MOVWF       FARG_TP_Get_Calibration_Consts_y_min+1 
	MOVLW       Display_Cals_tp_ymax_L0+0
	MOVWF       FARG_TP_Get_Calibration_Consts_y_max+0 
	MOVLW       hi_addr(Display_Cals_tp_ymax_L0+0)
	MOVWF       FARG_TP_Get_Calibration_Consts_y_max+1 
	CALL        _TP_Get_Calibration_Consts+0, 0
;Misc_functions.c,117 :: 		IntToStr(tp_xmin, numstr);
	MOVF        Display_Cals_tp_xmin_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        Display_Cals_tp_xmin_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       Display_Cals_numstr_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(Display_Cals_numstr_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Misc_functions.c,118 :: 		strcpy(strtemp,"X Min: ");
	MOVLW       Display_Cals_strtemp_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(Display_Cals_strtemp_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr1_Misc_functions+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr1_Misc_functions+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;Misc_functions.c,119 :: 		strcat(strtemp,numstr);
	MOVLW       Display_Cals_strtemp_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Cals_strtemp_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Cals_numstr_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Cals_numstr_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;Misc_functions.c,120 :: 		T6963C_Write_Text_Adv(strtemp, 13, 30);
	MOVLW       Display_Cals_strtemp_L0+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(Display_Cals_strtemp_L0+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       13
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       30
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Misc_functions.c,121 :: 		IntToStr(tp_xmax, numstr);
	MOVF        Display_Cals_tp_xmax_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        Display_Cals_tp_xmax_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       Display_Cals_numstr_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(Display_Cals_numstr_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Misc_functions.c,122 :: 		strcpy(strtemp,"X max: ");
	MOVLW       Display_Cals_strtemp_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(Display_Cals_strtemp_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr2_Misc_functions+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr2_Misc_functions+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;Misc_functions.c,123 :: 		strcat(strtemp,numstr);
	MOVLW       Display_Cals_strtemp_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Cals_strtemp_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Cals_numstr_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Cals_numstr_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;Misc_functions.c,124 :: 		T6963C_Write_Text_Adv(strtemp, 13, 40);
	MOVLW       Display_Cals_strtemp_L0+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(Display_Cals_strtemp_L0+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       13
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       40
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Misc_functions.c,125 :: 		IntToStr(tp_ymin, numstr);
	MOVF        Display_Cals_tp_ymin_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        Display_Cals_tp_ymin_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       Display_Cals_numstr_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(Display_Cals_numstr_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Misc_functions.c,126 :: 		strcpy(strtemp,"Y Min: ");
	MOVLW       Display_Cals_strtemp_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(Display_Cals_strtemp_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr3_Misc_functions+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr3_Misc_functions+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;Misc_functions.c,127 :: 		strcat(strtemp,numstr);
	MOVLW       Display_Cals_strtemp_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Cals_strtemp_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Cals_numstr_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Cals_numstr_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;Misc_functions.c,128 :: 		T6963C_Write_Text_Adv(strtemp, 13, 50);
	MOVLW       Display_Cals_strtemp_L0+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(Display_Cals_strtemp_L0+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       13
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       50
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Misc_functions.c,129 :: 		IntToStr(tp_ymax, numstr);
	MOVF        Display_Cals_tp_ymax_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        Display_Cals_tp_ymax_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       Display_Cals_numstr_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(Display_Cals_numstr_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Misc_functions.c,130 :: 		strcpy(strtemp,"Y Max: ");
	MOVLW       Display_Cals_strtemp_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(Display_Cals_strtemp_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr4_Misc_functions+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr4_Misc_functions+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;Misc_functions.c,131 :: 		strcat(strtemp,numstr);
	MOVLW       Display_Cals_strtemp_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Cals_strtemp_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Cals_numstr_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Cals_numstr_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;Misc_functions.c,132 :: 		T6963C_Write_Text_Adv(strtemp, 13, 60);
	MOVLW       Display_Cals_strtemp_L0+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(Display_Cals_strtemp_L0+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       13
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Misc_functions.c,133 :: 		}
L_end_Display_Cals:
	RETURN      0
; end of _Display_Cals

_Write_Cals:

;Misc_functions.c,135 :: 		void Write_Cals(void)
;Misc_functions.c,139 :: 		TP_Get_Calibration_Consts(&tp_xmin, &tp_xmax, &tp_ymin, &tp_ymax);
	MOVLW       Write_Cals_tp_xmin_L0+0
	MOVWF       FARG_TP_Get_Calibration_Consts_x_min+0 
	MOVLW       hi_addr(Write_Cals_tp_xmin_L0+0)
	MOVWF       FARG_TP_Get_Calibration_Consts_x_min+1 
	MOVLW       Write_Cals_tp_xmax_L0+0
	MOVWF       FARG_TP_Get_Calibration_Consts_x_max+0 
	MOVLW       hi_addr(Write_Cals_tp_xmax_L0+0)
	MOVWF       FARG_TP_Get_Calibration_Consts_x_max+1 
	MOVLW       Write_Cals_tp_ymin_L0+0
	MOVWF       FARG_TP_Get_Calibration_Consts_y_min+0 
	MOVLW       hi_addr(Write_Cals_tp_ymin_L0+0)
	MOVWF       FARG_TP_Get_Calibration_Consts_y_min+1 
	MOVLW       Write_Cals_tp_ymax_L0+0
	MOVWF       FARG_TP_Get_Calibration_Consts_y_max+0 
	MOVLW       hi_addr(Write_Cals_tp_ymax_L0+0)
	MOVWF       FARG_TP_Get_Calibration_Consts_y_max+1 
	CALL        _TP_Get_Calibration_Consts+0, 0
;Misc_functions.c,140 :: 		EEParams.HubParams.TP_Cals[0] = tp_xmin; // Xmin
	MOVF        Write_Cals_tp_xmin_L0+0, 0 
	MOVWF       _EEParams+15 
	MOVF        Write_Cals_tp_xmin_L0+1, 0 
	MOVWF       _EEParams+16 
;Misc_functions.c,141 :: 		EEParams.HubParams.TP_Cals[1] = tp_xmax; // Xmax
	MOVF        Write_Cals_tp_xmax_L0+0, 0 
	MOVWF       _EEParams+17 
	MOVF        Write_Cals_tp_xmax_L0+1, 0 
	MOVWF       _EEParams+18 
;Misc_functions.c,142 :: 		EEParams.HubParams.TP_Cals[2] = tp_ymin; // Ymin
	MOVF        Write_Cals_tp_ymin_L0+0, 0 
	MOVWF       _EEParams+19 
	MOVF        Write_Cals_tp_ymin_L0+1, 0 
	MOVWF       _EEParams+20 
;Misc_functions.c,143 :: 		EEParams.HubParams.TP_Cals[3] = tp_ymax; // Ymax
	MOVF        Write_Cals_tp_ymax_L0+0, 0 
	MOVWF       _EEParams+21 
	MOVF        Write_Cals_tp_ymax_L0+1, 0 
	MOVWF       _EEParams+22 
;Misc_functions.c,145 :: 		Write_params(EEParams.Params_Array);
	MOVLW       _EEParams+0
	MOVWF       FARG_Write_params_ptr+0 
	MOVLW       hi_addr(_EEParams+0)
	MOVWF       FARG_Write_params_ptr+1 
	CALL        _Write_params+0, 0
;Misc_functions.c,146 :: 		}
L_end_Write_Cals:
	RETURN      0
; end of _Write_Cals

_My_Calibrate_TP:

;Misc_functions.c,151 :: 		void My_Calibrate_TP() {
;Misc_functions.c,154 :: 		do{
L_My_Calibrate_TP0:
;Misc_functions.c,155 :: 		i=0;
	CLRF        My_Calibrate_TP_i_L0+0 
;Misc_functions.c,156 :: 		BacklightRed = 0;
	BCF         BacklightRed+0, BitPos(BacklightRed+0) 
;Misc_functions.c,157 :: 		BacklightGreen = 0;
	BCF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;Misc_functions.c,158 :: 		BLUE_DUTY_CYCLE = 255; // Full white
	MOVLW       255
	MOVWF       CCPR3L+0 
;Misc_functions.c,159 :: 		T6963C_grFill(0);                                        // Clear display
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;Misc_functions.c,160 :: 		T6963C_txtFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_start+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;Misc_functions.c,161 :: 		T6963C_Set_Font_Adv(T6963C_defaultFont, T6963C_WHITE, _T6963C_HORIZONTAL);
	MOVLW       _T6963C_defaultFont+0
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+0 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+1 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+2 
	MOVLW       8
	MOVWF       FARG_T6963C_Set_Font_Adv_font_color+0 
	CLRF        FARG_T6963C_Set_Font_Adv_font_orientation+0 
	CALL        _T6963C_Set_Font_Adv+0, 0
;Misc_functions.c,162 :: 		T6963C_Write_Text_Adv("CALIBRATION", 80, 60);
	MOVLW       ?lstr5_Misc_functions+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr5_Misc_functions+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       80
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       60
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Misc_functions.c,163 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_My_Calibrate_TP3:
	DECFSZ      R13, 1, 1
	BRA         L_My_Calibrate_TP3
	DECFSZ      R12, 1, 1
	BRA         L_My_Calibrate_TP3
	DECFSZ      R11, 1, 1
	BRA         L_My_Calibrate_TP3
	NOP
	NOP
;Misc_functions.c,164 :: 		T6963C_grFill(0);                                        // Clear display
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;Misc_functions.c,165 :: 		T6963C_txtFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_start+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;Misc_functions.c,167 :: 		T6963C_dot(0,127,T6963C_WHITE);  // Draw bottom left dot
	CLRF        FARG_T6963C_dot_x+0 
	CLRF        FARG_T6963C_dot_x+1 
	MOVLW       127
	MOVWF       FARG_T6963C_dot_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_dot_y+1 
	MOVLW       8
	MOVWF       FARG_T6963C_dot_color+0 
	CALL        _T6963C_dot+0, 0
;Misc_functions.c,168 :: 		T6963C_Write_Text_Adv("TOUCH BOTTOM LEFT", 13, 50);
	MOVLW       ?lstr6_Misc_functions+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr6_Misc_functions+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       13
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       50
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Misc_functions.c,169 :: 		TP_Calibrate_Bottom_Left();          // Calibration of bottom left corner
	CALL        _TP_Calibrate_Bottom_Left+0, 0
;Misc_functions.c,170 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_My_Calibrate_TP4:
	DECFSZ      R13, 1, 1
	BRA         L_My_Calibrate_TP4
	DECFSZ      R12, 1, 1
	BRA         L_My_Calibrate_TP4
	DECFSZ      R11, 1, 1
	BRA         L_My_Calibrate_TP4
	NOP
;Misc_functions.c,172 :: 		T6963C_dot(0,127,T6963C_BLACK);                                        // Clear bottom left dot
	CLRF        FARG_T6963C_dot_x+0 
	CLRF        FARG_T6963C_dot_x+1 
	MOVLW       127
	MOVWF       FARG_T6963C_dot_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_dot_y+1 
	CLRF        FARG_T6963C_dot_color+0 
	CALL        _T6963C_dot+0, 0
;Misc_functions.c,173 :: 		T6963C_Set_Font_Adv(T6963C_defaultFont, T6963C_BLACK, _T6963C_HORIZONTAL);
	MOVLW       _T6963C_defaultFont+0
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+0 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+1 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+2 
	CLRF        FARG_T6963C_Set_Font_Adv_font_color+0 
	CLRF        FARG_T6963C_Set_Font_Adv_font_orientation+0 
	CALL        _T6963C_Set_Font_Adv+0, 0
;Misc_functions.c,174 :: 		T6963C_Write_Text_Adv("TOUCH BOTTOM LEFT", 13, 50);
	MOVLW       ?lstr7_Misc_functions+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr7_Misc_functions+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       13
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       50
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Misc_functions.c,175 :: 		T6963C_dot(239,0,T6963C_WHITE);                                       // Draw upper right dot
	MOVLW       239
	MOVWF       FARG_T6963C_dot_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_dot_x+1 
	CLRF        FARG_T6963C_dot_y+0 
	CLRF        FARG_T6963C_dot_y+1 
	MOVLW       8
	MOVWF       FARG_T6963C_dot_color+0 
	CALL        _T6963C_dot+0, 0
;Misc_functions.c,176 :: 		T6963C_Set_Font_Adv(T6963C_defaultFont, T6963C_WHITE, _T6963C_HORIZONTAL);
	MOVLW       _T6963C_defaultFont+0
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+0 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+1 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+2 
	MOVLW       8
	MOVWF       FARG_T6963C_Set_Font_Adv_font_color+0 
	CLRF        FARG_T6963C_Set_Font_Adv_font_orientation+0 
	CALL        _T6963C_Set_Font_Adv+0, 0
;Misc_functions.c,177 :: 		T6963C_Write_Text_Adv("TOUCH UPPER RIGHT", 20, 13);
	MOVLW       ?lstr8_Misc_functions+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(?lstr8_Misc_functions+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       20
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       13
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Misc_functions.c,178 :: 		TP_Calibrate_Upper_Right();                              // Calibration of upper right corner
	CALL        _TP_Calibrate_Upper_Right+0, 0
;Misc_functions.c,180 :: 		Delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_My_Calibrate_TP5:
	DECFSZ      R13, 1, 1
	BRA         L_My_Calibrate_TP5
	DECFSZ      R12, 1, 1
	BRA         L_My_Calibrate_TP5
	DECFSZ      R11, 1, 1
	BRA         L_My_Calibrate_TP5
	NOP
;Misc_functions.c,181 :: 		T6963C_grFill(0);                                        // Clear display
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;Misc_functions.c,182 :: 		T6963C_txtFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_start+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;Misc_functions.c,183 :: 		Display_Cals();  // Write to Screen
	CALL        _Display_Cals+0, 0
;Misc_functions.c,185 :: 		TP_Get_Calibration_Consts(&tp_xmin, &tp_xmax, &tp_ymin, &tp_ymax);
	MOVLW       My_Calibrate_TP_tp_xmin_L0+0
	MOVWF       FARG_TP_Get_Calibration_Consts_x_min+0 
	MOVLW       hi_addr(My_Calibrate_TP_tp_xmin_L0+0)
	MOVWF       FARG_TP_Get_Calibration_Consts_x_min+1 
	MOVLW       My_Calibrate_TP_tp_xmax_L0+0
	MOVWF       FARG_TP_Get_Calibration_Consts_x_max+0 
	MOVLW       hi_addr(My_Calibrate_TP_tp_xmax_L0+0)
	MOVWF       FARG_TP_Get_Calibration_Consts_x_max+1 
	MOVLW       My_Calibrate_TP_tp_ymin_L0+0
	MOVWF       FARG_TP_Get_Calibration_Consts_y_min+0 
	MOVLW       hi_addr(My_Calibrate_TP_tp_ymin_L0+0)
	MOVWF       FARG_TP_Get_Calibration_Consts_y_min+1 
	MOVLW       My_Calibrate_TP_tp_ymax_L0+0
	MOVWF       FARG_TP_Get_Calibration_Consts_y_max+0 
	MOVLW       hi_addr(My_Calibrate_TP_tp_ymax_L0+0)
	MOVWF       FARG_TP_Get_Calibration_Consts_y_max+1 
	CALL        _TP_Get_Calibration_Consts+0, 0
;Misc_functions.c,186 :: 		if((tp_xmin<100) || (tp_xmin>300)) i=1;
	MOVLW       0
	SUBWF       My_Calibrate_TP_tp_xmin_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__My_Calibrate_TP58
	MOVLW       100
	SUBWF       My_Calibrate_TP_tp_xmin_L0+0, 0 
L__My_Calibrate_TP58:
	BTFSS       STATUS+0, 0 
	GOTO        L__My_Calibrate_TP53
	MOVF        My_Calibrate_TP_tp_xmin_L0+1, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__My_Calibrate_TP59
	MOVF        My_Calibrate_TP_tp_xmin_L0+0, 0 
	SUBLW       44
L__My_Calibrate_TP59:
	BTFSS       STATUS+0, 0 
	GOTO        L__My_Calibrate_TP53
	GOTO        L_My_Calibrate_TP8
L__My_Calibrate_TP53:
	MOVLW       1
	MOVWF       My_Calibrate_TP_i_L0+0 
L_My_Calibrate_TP8:
;Misc_functions.c,187 :: 		if((tp_xmax<3700) || (tp_xmax>3900)) i=1;
	MOVLW       14
	SUBWF       My_Calibrate_TP_tp_xmax_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__My_Calibrate_TP60
	MOVLW       116
	SUBWF       My_Calibrate_TP_tp_xmax_L0+0, 0 
L__My_Calibrate_TP60:
	BTFSS       STATUS+0, 0 
	GOTO        L__My_Calibrate_TP52
	MOVF        My_Calibrate_TP_tp_xmax_L0+1, 0 
	SUBLW       15
	BTFSS       STATUS+0, 2 
	GOTO        L__My_Calibrate_TP61
	MOVF        My_Calibrate_TP_tp_xmax_L0+0, 0 
	SUBLW       60
L__My_Calibrate_TP61:
	BTFSS       STATUS+0, 0 
	GOTO        L__My_Calibrate_TP52
	GOTO        L_My_Calibrate_TP11
L__My_Calibrate_TP52:
	MOVLW       1
	MOVWF       My_Calibrate_TP_i_L0+0 
L_My_Calibrate_TP11:
;Misc_functions.c,188 :: 		if((tp_ymin<300) || (tp_ymin>500)) i=1;
	MOVLW       1
	SUBWF       My_Calibrate_TP_tp_ymin_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__My_Calibrate_TP62
	MOVLW       44
	SUBWF       My_Calibrate_TP_tp_ymin_L0+0, 0 
L__My_Calibrate_TP62:
	BTFSS       STATUS+0, 0 
	GOTO        L__My_Calibrate_TP51
	MOVF        My_Calibrate_TP_tp_ymin_L0+1, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__My_Calibrate_TP63
	MOVF        My_Calibrate_TP_tp_ymin_L0+0, 0 
	SUBLW       244
L__My_Calibrate_TP63:
	BTFSS       STATUS+0, 0 
	GOTO        L__My_Calibrate_TP51
	GOTO        L_My_Calibrate_TP14
L__My_Calibrate_TP51:
	MOVLW       1
	MOVWF       My_Calibrate_TP_i_L0+0 
L_My_Calibrate_TP14:
;Misc_functions.c,189 :: 		if((tp_ymax<3500) || (tp_ymax>3700)) i=1;
	MOVLW       13
	SUBWF       My_Calibrate_TP_tp_ymax_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__My_Calibrate_TP64
	MOVLW       172
	SUBWF       My_Calibrate_TP_tp_ymax_L0+0, 0 
L__My_Calibrate_TP64:
	BTFSS       STATUS+0, 0 
	GOTO        L__My_Calibrate_TP50
	MOVF        My_Calibrate_TP_tp_ymax_L0+1, 0 
	SUBLW       14
	BTFSS       STATUS+0, 2 
	GOTO        L__My_Calibrate_TP65
	MOVF        My_Calibrate_TP_tp_ymax_L0+0, 0 
	SUBLW       116
L__My_Calibrate_TP65:
	BTFSS       STATUS+0, 0 
	GOTO        L__My_Calibrate_TP50
	GOTO        L_My_Calibrate_TP17
L__My_Calibrate_TP50:
	MOVLW       1
	MOVWF       My_Calibrate_TP_i_L0+0 
L_My_Calibrate_TP17:
;Misc_functions.c,190 :: 		if(i==1)
	MOVF        My_Calibrate_TP_i_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_My_Calibrate_TP18
;Misc_functions.c,193 :: 		BacklightRed = 0;
	BCF         BacklightRed+0, BitPos(BacklightRed+0) 
;Misc_functions.c,194 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;Misc_functions.c,195 :: 		BLUE_DUTY_CYCLE = 0; // turn to red
	CLRF        CCPR3L+0 
;Misc_functions.c,196 :: 		Delay_ms(5000);
	MOVLW       2
	MOVWF       R10, 0
	MOVLW       49
	MOVWF       R11, 0
	MOVLW       98
	MOVWF       R12, 0
	MOVLW       69
	MOVWF       R13, 0
L_My_Calibrate_TP19:
	DECFSZ      R13, 1, 1
	BRA         L_My_Calibrate_TP19
	DECFSZ      R12, 1, 1
	BRA         L_My_Calibrate_TP19
	DECFSZ      R11, 1, 1
	BRA         L_My_Calibrate_TP19
	DECFSZ      R10, 1, 1
	BRA         L_My_Calibrate_TP19
;Misc_functions.c,197 :: 		}
	GOTO        L_My_Calibrate_TP20
L_My_Calibrate_TP18:
;Misc_functions.c,200 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_My_Calibrate_TP21:
	DECFSZ      R13, 1, 1
	BRA         L_My_Calibrate_TP21
	DECFSZ      R12, 1, 1
	BRA         L_My_Calibrate_TP21
	DECFSZ      R11, 1, 1
	BRA         L_My_Calibrate_TP21
	NOP
	NOP
;Misc_functions.c,201 :: 		}
L_My_Calibrate_TP20:
;Misc_functions.c,202 :: 		T6963C_grFill(0);                                        // Clear display
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;Misc_functions.c,203 :: 		T6963C_txtFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_start+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;Misc_functions.c,205 :: 		} while (i == 1);
	MOVF        My_Calibrate_TP_i_L0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_My_Calibrate_TP0
;Misc_functions.c,206 :: 		}
L_end_My_Calibrate_TP:
	RETURN      0
; end of _My_Calibrate_TP

_Read_params:

;Misc_functions.c,209 :: 		void Read_params(unsigned char *ptr)
;Misc_functions.c,213 :: 		for(i=0; i<NUMEEPARAMS; i++)
	CLRF        Read_params_i_L0+0 
	CLRF        Read_params_i_L0+1 
L_Read_params22:
	MOVLW       0
	SUBWF       Read_params_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Read_params67
	MOVLW       28
	SUBWF       Read_params_i_L0+0, 0 
L__Read_params67:
	BTFSC       STATUS+0, 0 
	GOTO        L_Read_params23
;Misc_functions.c,216 :: 		*ptr++ = EEPROM_Read( i+CHAIR_PARAMS_ADDRESS );  // Expects unsigned Int as argument
	MOVLW       10
	ADDWF       Read_params_i_L0+0, 0 
	MOVWF       FARG_EEPROM_Read_address+0 
	MOVLW       0
	ADDWFC      Read_params_i_L0+1, 0 
	MOVWF       FARG_EEPROM_Read_address+1 
	CALL        _EEPROM_Read+0, 0
	MOVFF       FARG_Read_params_ptr+0, FSR1
	MOVFF       FARG_Read_params_ptr+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INFSNZ      FARG_Read_params_ptr+0, 1 
	INCF        FARG_Read_params_ptr+1, 1 
;Misc_functions.c,213 :: 		for(i=0; i<NUMEEPARAMS; i++)
	INFSNZ      Read_params_i_L0+0, 1 
	INCF        Read_params_i_L0+1, 1 
;Misc_functions.c,217 :: 		}
	GOTO        L_Read_params22
L_Read_params23:
;Misc_functions.c,218 :: 		}
L_end_Read_params:
	RETURN      0
; end of _Read_params

_Write_params:

;Misc_functions.c,221 :: 		void Write_params(unsigned char *ptr)
;Misc_functions.c,225 :: 		for(i=0; i<NUMEEPARAMS; i++)
	CLRF        Write_params_i_L0+0 
	CLRF        Write_params_i_L0+1 
L_Write_params25:
	MOVLW       0
	SUBWF       Write_params_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Write_params69
	MOVLW       28
	SUBWF       Write_params_i_L0+0, 0 
L__Write_params69:
	BTFSC       STATUS+0, 0 
	GOTO        L_Write_params26
;Misc_functions.c,228 :: 		EEPROM_Write( i+CHAIR_PARAMS_ADDRESS, *ptr++ );
	MOVLW       10
	ADDWF       Write_params_i_L0+0, 0 
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	ADDWFC      Write_params_i_L0+1, 0 
	MOVWF       FARG_EEPROM_Write_address+1 
	MOVFF       FARG_Write_params_ptr+0, FSR0
	MOVFF       FARG_Write_params_ptr+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
	INFSNZ      FARG_Write_params_ptr+0, 1 
	INCF        FARG_Write_params_ptr+1, 1 
;Misc_functions.c,229 :: 		while(WR_bit); // wait for done        EECON1.WR
L_Write_params28:
	BTFSS       WR_bit+0, BitPos(WR_bit+0) 
	GOTO        L_Write_params29
	GOTO        L_Write_params28
L_Write_params29:
;Misc_functions.c,225 :: 		for(i=0; i<NUMEEPARAMS; i++)
	INFSNZ      Write_params_i_L0+0, 1 
	INCF        Write_params_i_L0+1, 1 
;Misc_functions.c,230 :: 		}
	GOTO        L_Write_params25
L_Write_params26:
;Misc_functions.c,231 :: 		}
L_end_Write_params:
	RETURN      0
; end of _Write_params

_Toggle_Send_RF_Bind_with_Flash:

;Misc_functions.c,233 :: 		void Toggle_Send_RF_Bind_with_Flash() {
;Misc_functions.c,236 :: 		if(0 == f_send)
	MOVLW       0
	XORWF       Toggle_Send_RF_Bind_with_Flash_f_send_L0+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_Toggle_Send_RF_Bind_with_Flash30
;Misc_functions.c,239 :: 		f_send = 1;
	MOVLW       1
	MOVWF       Toggle_Send_RF_Bind_with_Flash_f_send_L0+0 
;Misc_functions.c,240 :: 		g_send_bind_with_flash = 1; // set global variable for checking
	MOVLW       1
	MOVWF       _g_send_bind_with_flash+0 
;Misc_functions.c,242 :: 		bSetReclineLimit.Active = 0;
	CLRF        _bSetReclineLimit+8 
;Misc_functions.c,243 :: 		bChangePW.Active = 0;
	CLRF        _bChangePW+8 
;Misc_functions.c,244 :: 		bDimLevel.Active = 0;
	CLRF        _bDimLevel+8 
;Misc_functions.c,245 :: 		bNext2Admin2.Active = 0;
	CLRF        _bNext2Admin2+8 
;Misc_functions.c,246 :: 		bBindNoFlash.Active = 0;
	CLRF        _bBindNoFlash+8 
;Misc_functions.c,247 :: 		bChairDim.Active = 0;
	CLRF        _bChairDim+8 
;Misc_functions.c,248 :: 		bAdminReturn.Active = 0;
	CLRF        _bAdminReturn+8 
;Misc_functions.c,250 :: 		bSetReclineLimit.Visible = 0;
	CLRF        _bSetReclineLimit+7 
;Misc_functions.c,251 :: 		bChangePW.Visible = 0;
	CLRF        _bChangePW+7 
;Misc_functions.c,252 :: 		bDimLevel.Visible = 0;
	CLRF        _bDimLevel+7 
;Misc_functions.c,253 :: 		bNext2Admin2.Visible = 0;
	CLRF        _bNext2Admin2+7 
;Misc_functions.c,254 :: 		bBindNoFlash.Visible = 0;
	CLRF        _bBindNoFlash+7 
;Misc_functions.c,255 :: 		bChairDim.Visible = 0;
	CLRF        _bChairDim+7 
;Misc_functions.c,256 :: 		bAdminReturn.Visible = 0;
	CLRF        _bAdminReturn+7 
;Misc_functions.c,257 :: 		bBindFlash.Caption = "Stop Sending";
	MOVLW       ?lstr9_Misc_functions+0
	MOVWF       _bBindFlash+9 
	MOVLW       hi_addr(?lstr9_Misc_functions+0)
	MOVWF       _bBindFlash+10 
;Misc_functions.c,258 :: 		DrawScreen(&ScreenAdmin1);
	MOVLW       _ScreenAdmin1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;Misc_functions.c,261 :: 		BacklightRed = 0;
	BCF         BacklightRed+0, BitPos(BacklightRed+0) 
;Misc_functions.c,262 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;Misc_functions.c,263 :: 		BLUE_DUTY_CYCLE = 0; // off
	CLRF        CCPR3L+0 
;Misc_functions.c,265 :: 		}
	GOTO        L_Toggle_Send_RF_Bind_with_Flash31
L_Toggle_Send_RF_Bind_with_Flash30:
;Misc_functions.c,269 :: 		f_send = 0;
	CLRF        Toggle_Send_RF_Bind_with_Flash_f_send_L0+0 
;Misc_functions.c,270 :: 		g_send_bind_with_flash = 0; // clear global variable for checking
	CLRF        _g_send_bind_with_flash+0 
;Misc_functions.c,272 :: 		bSetReclineLimit.Active = 1;
	MOVLW       1
	MOVWF       _bSetReclineLimit+8 
;Misc_functions.c,273 :: 		bChangePW.Active = 1;
	MOVLW       1
	MOVWF       _bChangePW+8 
;Misc_functions.c,274 :: 		bDimLevel.Active = 1;
	MOVLW       1
	MOVWF       _bDimLevel+8 
;Misc_functions.c,275 :: 		bNext2Admin2.Active = 1;
	MOVLW       1
	MOVWF       _bNext2Admin2+8 
;Misc_functions.c,276 :: 		bBindNoFlash.Active = 1;
	MOVLW       1
	MOVWF       _bBindNoFlash+8 
;Misc_functions.c,277 :: 		bChairDim.Active = 1;
	MOVLW       1
	MOVWF       _bChairDim+8 
;Misc_functions.c,278 :: 		bAdminReturn.Active = 1;
	MOVLW       1
	MOVWF       _bAdminReturn+8 
;Misc_functions.c,280 :: 		bSetReclineLimit.Visible = 1;
	MOVLW       1
	MOVWF       _bSetReclineLimit+7 
;Misc_functions.c,281 :: 		bChangePW.Visible = 1;
	MOVLW       1
	MOVWF       _bChangePW+7 
;Misc_functions.c,282 :: 		bDimLevel.Visible = 1;
	MOVLW       1
	MOVWF       _bDimLevel+7 
;Misc_functions.c,283 :: 		bNext2Admin2.Visible = 1;
	MOVLW       1
	MOVWF       _bNext2Admin2+7 
;Misc_functions.c,284 :: 		bBindNoFlash.Visible = 1;
	MOVLW       1
	MOVWF       _bBindNoFlash+7 
;Misc_functions.c,285 :: 		bChairDim.Visible = 1;
	MOVLW       1
	MOVWF       _bChairDim+7 
;Misc_functions.c,286 :: 		bAdminReturn.Visible = 1;
	MOVLW       1
	MOVWF       _bAdminReturn+7 
;Misc_functions.c,287 :: 		bBindFlash.Caption = "Sync with Flash";
	MOVLW       ?lstr10_Misc_functions+0
	MOVWF       _bBindFlash+9 
	MOVLW       hi_addr(?lstr10_Misc_functions+0)
	MOVWF       _bBindFlash+10 
;Misc_functions.c,288 :: 		DrawScreen(&ScreenAdmin1);
	MOVLW       _ScreenAdmin1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;Misc_functions.c,290 :: 		BacklightRed = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;Misc_functions.c,291 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;Misc_functions.c,292 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level; // set the duty cycle Register - that's why it's in CAPS - it's a define
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;Misc_functions.c,293 :: 		}
L_Toggle_Send_RF_Bind_with_Flash31:
;Misc_functions.c,294 :: 		}
L_end_Toggle_Send_RF_Bind_with_Flash:
	RETURN      0
; end of _Toggle_Send_RF_Bind_with_Flash

_Toggle_Send_RF_Bind_no_Flash:

;Misc_functions.c,296 :: 		void Toggle_Send_RF_Bind_no_Flash() {
;Misc_functions.c,299 :: 		if(0 == f_send)
	MOVLW       0
	XORWF       Toggle_Send_RF_Bind_no_Flash_f_send_L0+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_Toggle_Send_RF_Bind_no_Flash32
;Misc_functions.c,302 :: 		f_send = 1;
	MOVLW       1
	MOVWF       Toggle_Send_RF_Bind_no_Flash_f_send_L0+0 
;Misc_functions.c,303 :: 		g_send_bind_no_flash = 1; // set global variable for checking
	MOVLW       1
	MOVWF       _g_send_bind_no_flash+0 
;Misc_functions.c,305 :: 		bSetReclineLimit.Active = 0;
	CLRF        _bSetReclineLimit+8 
;Misc_functions.c,306 :: 		bChangePW.Active = 0;
	CLRF        _bChangePW+8 
;Misc_functions.c,307 :: 		bDimLevel.Active = 0;
	CLRF        _bDimLevel+8 
;Misc_functions.c,308 :: 		bNext2Admin2.Active = 0;
	CLRF        _bNext2Admin2+8 
;Misc_functions.c,309 :: 		bBindFlash.Active = 0;
	CLRF        _bBindFlash+8 
;Misc_functions.c,310 :: 		bChairDim.Active = 0;
	CLRF        _bChairDim+8 
;Misc_functions.c,311 :: 		bAdminReturn.Active = 0;
	CLRF        _bAdminReturn+8 
;Misc_functions.c,313 :: 		bSetReclineLimit.Visible = 0;
	CLRF        _bSetReclineLimit+7 
;Misc_functions.c,314 :: 		bChangePW.Visible = 0;
	CLRF        _bChangePW+7 
;Misc_functions.c,315 :: 		bDimLevel.Visible = 0;
	CLRF        _bDimLevel+7 
;Misc_functions.c,316 :: 		bNext2Admin2.Visible = 0;
	CLRF        _bNext2Admin2+7 
;Misc_functions.c,317 :: 		bBindFlash.Visible = 0;
	CLRF        _bBindFlash+7 
;Misc_functions.c,318 :: 		bChairDim.Visible = 0;
	CLRF        _bChairDim+7 
;Misc_functions.c,319 :: 		bAdminReturn.Visible = 0;
	CLRF        _bAdminReturn+7 
;Misc_functions.c,320 :: 		bBindNoFlash.Caption = "Stop Sending";
	MOVLW       ?lstr11_Misc_functions+0
	MOVWF       _bBindNoFlash+9 
	MOVLW       hi_addr(?lstr11_Misc_functions+0)
	MOVWF       _bBindNoFlash+10 
;Misc_functions.c,321 :: 		DrawScreen(&ScreenAdmin1);
	MOVLW       _ScreenAdmin1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;Misc_functions.c,324 :: 		BacklightRed = 0;
	BCF         BacklightRed+0, BitPos(BacklightRed+0) 
;Misc_functions.c,325 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;Misc_functions.c,326 :: 		BLUE_DUTY_CYCLE = 0; // off
	CLRF        CCPR3L+0 
;Misc_functions.c,328 :: 		}
	GOTO        L_Toggle_Send_RF_Bind_no_Flash33
L_Toggle_Send_RF_Bind_no_Flash32:
;Misc_functions.c,332 :: 		f_send = 0;
	CLRF        Toggle_Send_RF_Bind_no_Flash_f_send_L0+0 
;Misc_functions.c,333 :: 		g_send_bind_no_flash = 0; // clear global variable for checking
	CLRF        _g_send_bind_no_flash+0 
;Misc_functions.c,335 :: 		bSetReclineLimit.Active = 1;
	MOVLW       1
	MOVWF       _bSetReclineLimit+8 
;Misc_functions.c,336 :: 		bChangePW.Active = 1;
	MOVLW       1
	MOVWF       _bChangePW+8 
;Misc_functions.c,337 :: 		bDimLevel.Active = 1;
	MOVLW       1
	MOVWF       _bDimLevel+8 
;Misc_functions.c,338 :: 		bNext2Admin2.Active = 1;
	MOVLW       1
	MOVWF       _bNext2Admin2+8 
;Misc_functions.c,339 :: 		bBindFlash.Active = 1;
	MOVLW       1
	MOVWF       _bBindFlash+8 
;Misc_functions.c,340 :: 		bChairDim.Active = 1;
	MOVLW       1
	MOVWF       _bChairDim+8 
;Misc_functions.c,341 :: 		bAdminReturn.Active = 1;
	MOVLW       1
	MOVWF       _bAdminReturn+8 
;Misc_functions.c,343 :: 		bSetReclineLimit.Visible = 1;
	MOVLW       1
	MOVWF       _bSetReclineLimit+7 
;Misc_functions.c,344 :: 		bChangePW.Visible = 1;
	MOVLW       1
	MOVWF       _bChangePW+7 
;Misc_functions.c,345 :: 		bDimLevel.Visible = 1;
	MOVLW       1
	MOVWF       _bDimLevel+7 
;Misc_functions.c,346 :: 		bNext2Admin2.Visible = 1;
	MOVLW       1
	MOVWF       _bNext2Admin2+7 
;Misc_functions.c,347 :: 		bBindFlash.Visible = 1;
	MOVLW       1
	MOVWF       _bBindFlash+7 
;Misc_functions.c,348 :: 		bChairDim.Visible = 1;
	MOVLW       1
	MOVWF       _bChairDim+7 
;Misc_functions.c,349 :: 		bAdminReturn.Visible = 1;
	MOVLW       1
	MOVWF       _bAdminReturn+7 
;Misc_functions.c,350 :: 		bBindNoFlash.Caption = "Sync no Flash";
	MOVLW       ?lstr12_Misc_functions+0
	MOVWF       _bBindNoFlash+9 
	MOVLW       hi_addr(?lstr12_Misc_functions+0)
	MOVWF       _bBindNoFlash+10 
;Misc_functions.c,351 :: 		DrawScreen(&ScreenAdmin1);
	MOVLW       _ScreenAdmin1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;Misc_functions.c,353 :: 		BacklightRed = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;Misc_functions.c,354 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;Misc_functions.c,355 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level; // set the duty cycle Register - that's why it's in CAPS - it's a define
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;Misc_functions.c,356 :: 		}
L_Toggle_Send_RF_Bind_no_Flash33:
;Misc_functions.c,357 :: 		}
L_end_Toggle_Send_RF_Bind_no_Flash:
	RETURN      0
; end of _Toggle_Send_RF_Bind_no_Flash

_Send_RF_Broadcast_Cmd_n:

;Misc_functions.c,359 :: 		void Send_RF_Broadcast_Cmd_n(char n_times)
;Misc_functions.c,364 :: 		if(n_times == 0)
	MOVF        FARG_Send_RF_Broadcast_Cmd_n_n_times+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Send_RF_Broadcast_Cmd_n34
;Misc_functions.c,367 :: 		if(n != 0)
	MOVLW       0
	XORWF       Send_RF_Broadcast_Cmd_n_n_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Send_RF_Broadcast_Cmd_n73
	MOVLW       0
	XORWF       Send_RF_Broadcast_Cmd_n_n_L0+0, 0 
L__Send_RF_Broadcast_Cmd_n73:
	BTFSC       STATUS+0, 2 
	GOTO        L_Send_RF_Broadcast_Cmd_n35
;Misc_functions.c,370 :: 		n--;
	MOVLW       1
	SUBWF       Send_RF_Broadcast_Cmd_n_n_L0+0, 1 
	MOVLW       0
	SUBWFB      Send_RF_Broadcast_Cmd_n_n_L0+1, 1 
;Misc_functions.c,371 :: 		write_TX_normal_FIFO_variable(); // Data_buf[] global should already be set up . This will send it out the radio too...
	CALL        _write_TX_normal_FIFO_variable+0, 0
;Misc_functions.c,372 :: 		}
L_Send_RF_Broadcast_Cmd_n35:
;Misc_functions.c,373 :: 		}
	GOTO        L_Send_RF_Broadcast_Cmd_n36
L_Send_RF_Broadcast_Cmd_n34:
;Misc_functions.c,377 :: 		n = n_times;
	MOVF        FARG_Send_RF_Broadcast_Cmd_n_n_times+0, 0 
	MOVWF       Send_RF_Broadcast_Cmd_n_n_L0+0 
	MOVLW       0
	MOVWF       Send_RF_Broadcast_Cmd_n_n_L0+1 
;Misc_functions.c,378 :: 		n--;
	MOVLW       1
	SUBWF       Send_RF_Broadcast_Cmd_n_n_L0+0, 1 
	MOVLW       0
	SUBWFB      Send_RF_Broadcast_Cmd_n_n_L0+1, 1 
;Misc_functions.c,379 :: 		heartbeat_tmr = 0; // reset timer
	CLRF        _heartbeat_tmr+0 
	CLRF        _heartbeat_tmr+1 
;Misc_functions.c,380 :: 		write_TX_normal_FIFO_variable(); // Data_buf[] global should already be set up . This will send it out the radio too...
	CALL        _write_TX_normal_FIFO_variable+0, 0
;Misc_functions.c,381 :: 		}
L_Send_RF_Broadcast_Cmd_n36:
;Misc_functions.c,382 :: 		}
L_end_Send_RF_Broadcast_Cmd_n:
	RETURN      0
; end of _Send_RF_Broadcast_Cmd_n

_SendRF_Command_CLOSE_ALL:

;Misc_functions.c,384 :: 		void SendRF_Command_CLOSE_ALL(void)
;Misc_functions.c,388 :: 		if(open_close_tmr > OPEN_CLOSE_RESEND_TIME)
	MOVLW       0
	MOVWF       R0 
	MOVF        _open_close_tmr+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SendRF_Command_CLOSE_ALL75
	MOVF        _open_close_tmr+0, 0 
	SUBLW       50
L__SendRF_Command_CLOSE_ALL75:
	BTFSC       STATUS+0, 0 
	GOTO        L_SendRF_Command_CLOSE_ALL37
;Misc_functions.c,391 :: 		send_broadcast_message(CMD_CLOSE_ALL);
	MOVLW       3
	MOVWF       FARG_send_broadcast_message_cmd+0 
	CALL        _send_broadcast_message+0, 0
;Misc_functions.c,392 :: 		open_close_tmr = 0;  // Reset timer
	CLRF        _open_close_tmr+0 
	CLRF        _open_close_tmr+1 
;Misc_functions.c,393 :: 		}
L_SendRF_Command_CLOSE_ALL37:
;Misc_functions.c,394 :: 		} // end Send Close ALL
L_end_SendRF_Command_CLOSE_ALL:
	RETURN      0
; end of _SendRF_Command_CLOSE_ALL

_SendRF_Command_OPEN_ALL:

;Misc_functions.c,396 :: 		void SendRF_Command_OPEN_ALL(void)
;Misc_functions.c,400 :: 		if(open_close_tmr > OPEN_CLOSE_RESEND_TIME)
	MOVLW       0
	MOVWF       R0 
	MOVF        _open_close_tmr+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SendRF_Command_OPEN_ALL77
	MOVF        _open_close_tmr+0, 0 
	SUBLW       50
L__SendRF_Command_OPEN_ALL77:
	BTFSC       STATUS+0, 0 
	GOTO        L_SendRF_Command_OPEN_ALL38
;Misc_functions.c,403 :: 		send_broadcast_message(CMD_OPEN_ALL);
	MOVLW       4
	MOVWF       FARG_send_broadcast_message_cmd+0 
	CALL        _send_broadcast_message+0, 0
;Misc_functions.c,404 :: 		open_close_tmr = 0;  // Reset timer
	CLRF        _open_close_tmr+0 
	CLRF        _open_close_tmr+1 
;Misc_functions.c,405 :: 		}
L_SendRF_Command_OPEN_ALL38:
;Misc_functions.c,406 :: 		} // end Send Open ALL
L_end_SendRF_Command_OPEN_ALL:
	RETURN      0
; end of _SendRF_Command_OPEN_ALL

_SendRF_Command_OPEN_FOOTREST_ALL:

;Misc_functions.c,408 :: 		void SendRF_Command_OPEN_FOOTREST_ALL(void)
;Misc_functions.c,412 :: 		if(open_close_tmr > OPEN_CLOSE_RESEND_TIME)
	MOVLW       0
	MOVWF       R0 
	MOVF        _open_close_tmr+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SendRF_Command_OPEN_FOOTREST_ALL79
	MOVF        _open_close_tmr+0, 0 
	SUBLW       50
L__SendRF_Command_OPEN_FOOTREST_ALL79:
	BTFSC       STATUS+0, 0 
	GOTO        L_SendRF_Command_OPEN_FOOTREST_ALL39
;Misc_functions.c,415 :: 		send_broadcast_message(CMD_FOOT_OPEN_ALL);
	MOVLW       7
	MOVWF       FARG_send_broadcast_message_cmd+0 
	CALL        _send_broadcast_message+0, 0
;Misc_functions.c,416 :: 		open_close_tmr = 0;  // Reset timer
	CLRF        _open_close_tmr+0 
	CLRF        _open_close_tmr+1 
;Misc_functions.c,417 :: 		}
L_SendRF_Command_OPEN_FOOTREST_ALL39:
;Misc_functions.c,418 :: 		} // end Send Open ALL
L_end_SendRF_Command_OPEN_FOOTREST_ALL:
	RETURN      0
; end of _SendRF_Command_OPEN_FOOTREST_ALL

_Toggle_Send_Flash:

;Misc_functions.c,420 :: 		void Toggle_Send_Flash() {
;Misc_functions.c,423 :: 		if(0 == f_send)
	MOVLW       0
	XORWF       Toggle_Send_Flash_f_send_L0+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_Toggle_Send_Flash40
;Misc_functions.c,426 :: 		f_send = 1;
	MOVLW       1
	MOVWF       Toggle_Send_Flash_f_send_L0+0 
;Misc_functions.c,427 :: 		g_send_flash = 1; // set global variable for checking
	MOVLW       1
	MOVWF       _g_send_flash+0 
;Misc_functions.c,429 :: 		bCalTouch.Active = 0;
	CLRF        _bCalTouch+8 
;Misc_functions.c,430 :: 		bAdminReturn2.Active = 0;
	CLRF        _bAdminReturn2+8 
;Misc_functions.c,431 :: 		bDisplayCals.Active = 0;
	CLRF        _bDisplayCals+8 
;Misc_functions.c,432 :: 		bEnableKidLock.Active = 0;
	CLRF        _bEnableKidLock+8 
;Misc_functions.c,433 :: 		bDisableKidLock.Active = 0;
	CLRF        _bDisableKidLock+8 
;Misc_functions.c,435 :: 		bCalTouch.Visible = 0;
	CLRF        _bCalTouch+7 
;Misc_functions.c,436 :: 		bAdminReturn2.Visible = 0;
	CLRF        _bAdminReturn2+7 
;Misc_functions.c,437 :: 		bDisplayCals.Visible =0;
	CLRF        _bDisplayCals+7 
;Misc_functions.c,438 :: 		bEnableKidLock.Visible = 0;
	CLRF        _bEnableKidLock+7 
;Misc_functions.c,439 :: 		bDisableKidLock.Visible = 0;
	CLRF        _bDisableKidLock+7 
;Misc_functions.c,440 :: 		bFlashChair.Caption = "Stop Sending";
	MOVLW       ?lstr13_Misc_functions+0
	MOVWF       _bFlashChair+9 
	MOVLW       hi_addr(?lstr13_Misc_functions+0)
	MOVWF       _bFlashChair+10 
;Misc_functions.c,441 :: 		DrawScreen(&ScreenAdmin2);
	MOVLW       _ScreenAdmin2+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin2+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;Misc_functions.c,443 :: 		BacklightRed = 0;
	BCF         BacklightRed+0, BitPos(BacklightRed+0) 
;Misc_functions.c,444 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;Misc_functions.c,445 :: 		BLUE_DUTY_CYCLE = 0; // off
	CLRF        CCPR3L+0 
;Misc_functions.c,447 :: 		}
	GOTO        L_Toggle_Send_Flash41
L_Toggle_Send_Flash40:
;Misc_functions.c,451 :: 		f_send = 0;
	CLRF        Toggle_Send_Flash_f_send_L0+0 
;Misc_functions.c,452 :: 		g_send_flash = 0; // clear global variable for checking
	CLRF        _g_send_flash+0 
;Misc_functions.c,454 :: 		bCalTouch.Active = 1;
	MOVLW       1
	MOVWF       _bCalTouch+8 
;Misc_functions.c,455 :: 		bAdminReturn2.Active = 1;
	MOVLW       1
	MOVWF       _bAdminReturn2+8 
;Misc_functions.c,456 :: 		bDisplayCals.Active=1;
	MOVLW       1
	MOVWF       _bDisplayCals+8 
;Misc_functions.c,457 :: 		bEnableKidLock.Active = 1;
	MOVLW       1
	MOVWF       _bEnableKidLock+8 
;Misc_functions.c,458 :: 		bDisableKidLock.Active = 1;
	MOVLW       1
	MOVWF       _bDisableKidLock+8 
;Misc_functions.c,460 :: 		bCalTouch.Visible = 1;
	MOVLW       1
	MOVWF       _bCalTouch+7 
;Misc_functions.c,461 :: 		bAdminReturn2.Visible = 1;
	MOVLW       1
	MOVWF       _bAdminReturn2+7 
;Misc_functions.c,462 :: 		bDisplayCals.Visible =1;
	MOVLW       1
	MOVWF       _bDisplayCals+7 
;Misc_functions.c,463 :: 		bEnableKidLock.Visible = 1;
	MOVLW       1
	MOVWF       _bEnableKidLock+7 
;Misc_functions.c,464 :: 		bDisableKidLock.Visible = 1;
	MOVLW       1
	MOVWF       _bDisableKidLock+7 
;Misc_functions.c,465 :: 		bFlashChair.Caption = "Flash All Chairs";
	MOVLW       ?lstr14_Misc_functions+0
	MOVWF       _bFlashChair+9 
	MOVLW       hi_addr(?lstr14_Misc_functions+0)
	MOVWF       _bFlashChair+10 
;Misc_functions.c,466 :: 		DrawScreen(&ScreenAdmin2);
	MOVLW       _ScreenAdmin2+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin2+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;Misc_functions.c,468 :: 		BacklightRed = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;Misc_functions.c,469 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;Misc_functions.c,470 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level; // set the duty cycle Register - that's why it's in CAPS - it's a define
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;Misc_functions.c,471 :: 		}
L_Toggle_Send_Flash41:
;Misc_functions.c,472 :: 		} // end send flash
L_end_Toggle_Send_Flash:
	RETURN      0
; end of _Toggle_Send_Flash

_Display_Hub_Address:

;Misc_functions.c,474 :: 		void Display_Hub_Address()
;Misc_functions.c,485 :: 		strcpy(strtemp,"Hub Addr:  ");
	MOVLW       Display_Hub_Address_strtemp_L0+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(Display_Hub_Address_strtemp_L0+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr15_Misc_functions+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr15_Misc_functions+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;Misc_functions.c,486 :: 		for(i=8; i>0; i--)
	MOVLW       8
	MOVWF       Display_Hub_Address_i_L0+0 
L_Display_Hub_Address42:
	MOVF        Display_Hub_Address_i_L0+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Display_Hub_Address43
;Misc_functions.c,490 :: 		ByteToHex(EEParams.HubParams.MyLongAddress[i-1], num2hex);   // Put hex in num2hex string
	DECF        Display_Hub_Address_i_L0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _EEParams+7
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_EEParams+7)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToHex_input+0 
	MOVLW       Display_Hub_Address_num2hex_L0+0
	MOVWF       FARG_ByteToHex_output+0 
	MOVLW       hi_addr(Display_Hub_Address_num2hex_L0+0)
	MOVWF       FARG_ByteToHex_output+1 
	CALL        _ByteToHex+0, 0
;Misc_functions.c,491 :: 		strcat(strtemp, num2hex); // add to string
	MOVLW       Display_Hub_Address_strtemp_L0+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(Display_Hub_Address_strtemp_L0+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Display_Hub_Address_num2hex_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Display_Hub_Address_num2hex_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;Misc_functions.c,486 :: 		for(i=8; i>0; i--)
	DECF        Display_Hub_Address_i_L0+0, 1 
;Misc_functions.c,492 :: 		}
	GOTO        L_Display_Hub_Address42
L_Display_Hub_Address43:
;Misc_functions.c,493 :: 		T6963C_Write_Text_Adv(strtemp, 13, 90);
	MOVLW       Display_Hub_Address_strtemp_L0+0
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVLW       hi_addr(Display_Hub_Address_strtemp_L0+0)
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       13
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       90
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;Misc_functions.c,495 :: 		} // end Display Hub Address
L_end_Display_Hub_Address:
	RETURN      0
; end of _Display_Hub_Address

_Beep:

;Misc_functions.c,497 :: 		void Beep()
;Misc_functions.c,501 :: 		for(i=0; i<250; i++)
	CLRF        R1 
L_Beep45:
	MOVLW       250
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Beep46
;Misc_functions.c,503 :: 		Buzzer_Out = 1;
	BSF         LATJ7_bit+0, BitPos(LATJ7_bit+0) 
;Misc_functions.c,504 :: 		Delay_us(140);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       45
	MOVWF       R13, 0
L_Beep48:
	DECFSZ      R13, 1, 1
	BRA         L_Beep48
	DECFSZ      R12, 1, 1
	BRA         L_Beep48
;Misc_functions.c,505 :: 		Buzzer_Out = 0;
	BCF         LATJ7_bit+0, BitPos(LATJ7_bit+0) 
;Misc_functions.c,506 :: 		Delay_us(140);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       45
	MOVWF       R13, 0
L_Beep49:
	DECFSZ      R13, 1, 1
	BRA         L_Beep49
	DECFSZ      R12, 1, 1
	BRA         L_Beep49
;Misc_functions.c,501 :: 		for(i=0; i<250; i++)
	INCF        R1, 1 
;Misc_functions.c,507 :: 		}
	GOTO        L_Beep45
L_Beep46:
;Misc_functions.c,508 :: 		} // End Beep
L_end_Beep:
	RETURN      0
; end of _Beep
