
_Key_pressed:

;CHi_Hub_VGCLD_events_code.c,30 :: 		void Key_pressed(char letter_pressed){
;CHi_Hub_VGCLD_events_code.c,32 :: 		char res[2] = " ";
	MOVLW       32
	MOVWF       Key_pressed_res_L0+0 
	CLRF        Key_pressed_res_L0+1 
;CHi_Hub_VGCLD_events_code.c,34 :: 		text_length = strlen(typed_letters);
	MOVLW       _typed_letters+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
;CHi_Hub_VGCLD_events_code.c,35 :: 		if (text_length >= 6) {
	MOVLW       6
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Key_pressed0
;CHi_Hub_VGCLD_events_code.c,36 :: 		lPWLabel.Font_Color = T6963C_BLACK; // Clears old text
	CLRF        _lPWLabel+12 
;CHi_Hub_VGCLD_events_code.c,37 :: 		DrawLabel(&lPWLabel);
	MOVLW       _lPWLabel+0
	MOVWF       FARG_DrawLabel_ALabel+0 
	MOVLW       hi_addr(_lPWLabel+0)
	MOVWF       FARG_DrawLabel_ALabel+1 
	CALL        _DrawLabel+0, 0
;CHi_Hub_VGCLD_events_code.c,38 :: 		lPWLabel.Font_Color = T6963C_WHITE; // Back to normal text
	MOVLW       8
	MOVWF       _lPWLabel+12 
;CHi_Hub_VGCLD_events_code.c,39 :: 		strcpy(lPWLabel_Caption, "      ");
	MOVLW       _lPWLabel_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_lPWLabel_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr1_CHi_Hub_VGCLD_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr1_CHi_Hub_VGCLD_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CHi_Hub_VGCLD_events_code.c,40 :: 		DrawLabel(&lPWLabel);
	MOVLW       _lPWLabel+0
	MOVWF       FARG_DrawLabel_ALabel+0 
	MOVLW       hi_addr(_lPWLabel+0)
	MOVWF       FARG_DrawLabel_ALabel+1 
	CALL        _DrawLabel+0, 0
;CHi_Hub_VGCLD_events_code.c,41 :: 		typed_letters[0] = 0;
	CLRF        _typed_letters+0 
;CHi_Hub_VGCLD_events_code.c,44 :: 		}
L_Key_pressed0:
;CHi_Hub_VGCLD_events_code.c,46 :: 		res[0] = letter_pressed;
	MOVF        FARG_Key_pressed_letter_pressed+0, 0 
	MOVWF       Key_pressed_res_L0+0 
;CHi_Hub_VGCLD_events_code.c,47 :: 		strcat(typed_letters, res);
	MOVLW       _typed_letters+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Key_pressed_res_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Key_pressed_res_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CHi_Hub_VGCLD_events_code.c,48 :: 		strcpy(lPWLabel_Caption, typed_letters);
	MOVLW       _lPWLabel_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_lPWLabel_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       _typed_letters+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CHi_Hub_VGCLD_events_code.c,49 :: 		DrawLabel(&lPWLabel);
	MOVLW       _lPWLabel+0
	MOVWF       FARG_DrawLabel_ALabel+0 
	MOVLW       hi_addr(_lPWLabel+0)
	MOVWF       FARG_DrawLabel_ALabel+1 
	CALL        _DrawLabel+0, 0
;CHi_Hub_VGCLD_events_code.c,50 :: 		}
L_end_Key_pressed:
	RETURN      0
; end of _Key_pressed

_Ch_Key_pressed:

;CHi_Hub_VGCLD_events_code.c,52 :: 		void Ch_Key_pressed(char letter_pressed){
;CHi_Hub_VGCLD_events_code.c,54 :: 		char res[2] = " ";
	MOVLW       32
	MOVWF       Ch_Key_pressed_res_L0+0 
	CLRF        Ch_Key_pressed_res_L0+1 
;CHi_Hub_VGCLD_events_code.c,56 :: 		text_length = strlen(typed_letters);
	MOVLW       _typed_letters+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
;CHi_Hub_VGCLD_events_code.c,57 :: 		if (text_length >= 4) {
	MOVLW       4
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Ch_Key_pressed1
;CHi_Hub_VGCLD_events_code.c,58 :: 		lChPWLabel.Font_Color = T6963C_BLACK; // Clears old text
	CLRF        _lChPWLabel+12 
;CHi_Hub_VGCLD_events_code.c,59 :: 		DrawLabel(&lChPWLabel);
	MOVLW       _lChPWLabel+0
	MOVWF       FARG_DrawLabel_ALabel+0 
	MOVLW       hi_addr(_lChPWLabel+0)
	MOVWF       FARG_DrawLabel_ALabel+1 
	CALL        _DrawLabel+0, 0
;CHi_Hub_VGCLD_events_code.c,60 :: 		lChPWLabel.Font_Color = T6963C_WHITE; // Back to normal text
	MOVLW       8
	MOVWF       _lChPWLabel+12 
;CHi_Hub_VGCLD_events_code.c,61 :: 		strcpy(lChPWLabel_Caption, "    ");
	MOVLW       _lChPWLabel_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_lChPWLabel_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr2_CHi_Hub_VGCLD_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr2_CHi_Hub_VGCLD_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CHi_Hub_VGCLD_events_code.c,62 :: 		DrawLabel(&lChPWLabel);
	MOVLW       _lChPWLabel+0
	MOVWF       FARG_DrawLabel_ALabel+0 
	MOVLW       hi_addr(_lChPWLabel+0)
	MOVWF       FARG_DrawLabel_ALabel+1 
	CALL        _DrawLabel+0, 0
;CHi_Hub_VGCLD_events_code.c,63 :: 		typed_letters[0] = 0;
	CLRF        _typed_letters+0 
;CHi_Hub_VGCLD_events_code.c,66 :: 		}
L_Ch_Key_pressed1:
;CHi_Hub_VGCLD_events_code.c,68 :: 		res[0] = letter_pressed;
	MOVF        FARG_Ch_Key_pressed_letter_pressed+0, 0 
	MOVWF       Ch_Key_pressed_res_L0+0 
;CHi_Hub_VGCLD_events_code.c,69 :: 		strcat(typed_letters, res);
	MOVLW       _typed_letters+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Ch_Key_pressed_res_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Ch_Key_pressed_res_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;CHi_Hub_VGCLD_events_code.c,70 :: 		strcpy(lChPWLabel_Caption, typed_letters);
	MOVLW       _lChPWLabel_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_lChPWLabel_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       _typed_letters+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CHi_Hub_VGCLD_events_code.c,71 :: 		DrawLabel(&lChPWLabel);
	MOVLW       _lChPWLabel+0
	MOVWF       FARG_DrawLabel_ALabel+0 
	MOVLW       hi_addr(_lChPWLabel+0)
	MOVWF       FARG_DrawLabel_ALabel+1 
	CALL        _DrawLabel+0, 0
;CHi_Hub_VGCLD_events_code.c,72 :: 		}
L_end_Ch_Key_pressed:
	RETURN      0
; end of _Ch_Key_pressed

_bHomeOnPress:

;CHi_Hub_VGCLD_events_code.c,79 :: 		void bHomeOnPress() {
;CHi_Hub_VGCLD_events_code.c,82 :: 		BacklightRed = 1;  // off
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,83 :: 		BacklightGreen = 0;  // On
	BCF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,84 :: 		BLUE_DUTY_CYCLE = 0; // Off
	CLRF        CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,86 :: 		SendRF_Command_CLOSE_ALL();
	CALL        _SendRF_Command_CLOSE_ALL+0, 0
;CHi_Hub_VGCLD_events_code.c,87 :: 		}
L_end_bHomeOnPress:
	RETURN      0
; end of _bHomeOnPress

_bHomeOnUp:

;CHi_Hub_VGCLD_events_code.c,89 :: 		void bHomeOnUp() {
;CHi_Hub_VGCLD_events_code.c,91 :: 		BacklightRed = 1;  // off
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,92 :: 		BacklightGreen = 1;  // off
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,93 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;  // Set to desired level
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,95 :: 		}
L_end_bHomeOnUp:
	RETURN      0
; end of _bHomeOnUp

_bCleanOnPress:

;CHi_Hub_VGCLD_events_code.c,97 :: 		void bCleanOnPress() {
;CHi_Hub_VGCLD_events_code.c,100 :: 		BacklightRed = 1;  // off
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,101 :: 		BacklightGreen = 0;  // On
	BCF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,102 :: 		BLUE_DUTY_CYCLE = 0;   // Set to Off
	CLRF        CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,104 :: 		SendRF_Command_OPEN_ALL();
	CALL        _SendRF_Command_OPEN_ALL+0, 0
;CHi_Hub_VGCLD_events_code.c,105 :: 		}
L_end_bCleanOnPress:
	RETURN      0
; end of _bCleanOnPress

_bCleanOnUp:

;CHi_Hub_VGCLD_events_code.c,107 :: 		void bCleanOnUp() {
;CHi_Hub_VGCLD_events_code.c,109 :: 		BacklightRed = 1;  // off
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,110 :: 		BacklightGreen = 1;  // off
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,111 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;  // Set to desired level
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,113 :: 		}
L_end_bCleanOnUp:
	RETURN      0
; end of _bCleanOnUp

_bFootRestOpenOnPress:

;CHi_Hub_VGCLD_events_code.c,115 :: 		void bFootRestOpenOnPress() {
;CHi_Hub_VGCLD_events_code.c,118 :: 		BacklightRed = 1;  // off
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,119 :: 		BacklightGreen = 0;  // On
	BCF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,120 :: 		BLUE_DUTY_CYCLE = 0;   // Set to Off
	CLRF        CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,122 :: 		SendRF_Command_OPEN_FOOTREST_ALL();
	CALL        _SendRF_Command_OPEN_FOOTREST_ALL+0, 0
;CHi_Hub_VGCLD_events_code.c,123 :: 		}
L_end_bFootRestOpenOnPress:
	RETURN      0
; end of _bFootRestOpenOnPress

_bFootRestOpenOnUp:

;CHi_Hub_VGCLD_events_code.c,125 :: 		void bFootRestOpenOnUp() {
;CHi_Hub_VGCLD_events_code.c,127 :: 		BacklightRed = 1;  // off
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,128 :: 		BacklightGreen = 1;  // off
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,129 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;  // Set to desired level
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,131 :: 		}
L_end_bFootRestOpenOnUp:
	RETURN      0
; end of _bFootRestOpenOnUp

_bNum1OnClick:

;CHi_Hub_VGCLD_events_code.c,133 :: 		void bNum1OnClick() {
;CHi_Hub_VGCLD_events_code.c,134 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,135 :: 		Key_pressed('1');
	MOVLW       49
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,136 :: 		}
L_end_bNum1OnClick:
	RETURN      0
; end of _bNum1OnClick

_bNum2OnClick:

;CHi_Hub_VGCLD_events_code.c,138 :: 		void bNum2OnClick() {
;CHi_Hub_VGCLD_events_code.c,139 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,140 :: 		Key_pressed('2');
	MOVLW       50
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,141 :: 		}
L_end_bNum2OnClick:
	RETURN      0
; end of _bNum2OnClick

_bNum3OnClick:

;CHi_Hub_VGCLD_events_code.c,143 :: 		void bNum3OnClick() {
;CHi_Hub_VGCLD_events_code.c,144 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,145 :: 		Key_pressed('3');
	MOVLW       51
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,146 :: 		}
L_end_bNum3OnClick:
	RETURN      0
; end of _bNum3OnClick

_bNum4OnClick:

;CHi_Hub_VGCLD_events_code.c,148 :: 		void bNum4OnClick() {
;CHi_Hub_VGCLD_events_code.c,149 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,150 :: 		Key_pressed('4');
	MOVLW       52
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,151 :: 		}
L_end_bNum4OnClick:
	RETURN      0
; end of _bNum4OnClick

_bNum5OnClick:

;CHi_Hub_VGCLD_events_code.c,153 :: 		void bNum5OnClick() {
;CHi_Hub_VGCLD_events_code.c,154 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,155 :: 		Key_pressed('5');
	MOVLW       53
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,156 :: 		}
L_end_bNum5OnClick:
	RETURN      0
; end of _bNum5OnClick

_bNum6OnClick:

;CHi_Hub_VGCLD_events_code.c,158 :: 		void bNum6OnClick() {
;CHi_Hub_VGCLD_events_code.c,159 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,160 :: 		Key_pressed('6');
	MOVLW       54
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,161 :: 		}
L_end_bNum6OnClick:
	RETURN      0
; end of _bNum6OnClick

_bNum7OnClick:

;CHi_Hub_VGCLD_events_code.c,163 :: 		void bNum7OnClick() {
;CHi_Hub_VGCLD_events_code.c,164 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,165 :: 		Key_pressed('7');
	MOVLW       55
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,166 :: 		}
L_end_bNum7OnClick:
	RETURN      0
; end of _bNum7OnClick

_bNum8OnClick:

;CHi_Hub_VGCLD_events_code.c,168 :: 		void bNum8OnClick() {
;CHi_Hub_VGCLD_events_code.c,169 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,170 :: 		Key_pressed('8');
	MOVLW       56
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,171 :: 		}
L_end_bNum8OnClick:
	RETURN      0
; end of _bNum8OnClick

_bNum9OnClick:

;CHi_Hub_VGCLD_events_code.c,173 :: 		void bNum9OnClick() {
;CHi_Hub_VGCLD_events_code.c,174 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,175 :: 		Key_pressed('9');
	MOVLW       57
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,176 :: 		}
L_end_bNum9OnClick:
	RETURN      0
; end of _bNum9OnClick

_bNum0OnClick:

;CHi_Hub_VGCLD_events_code.c,178 :: 		void bNum0OnClick() {
;CHi_Hub_VGCLD_events_code.c,179 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,180 :: 		Key_pressed('0');
	MOVLW       48
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,181 :: 		}
L_end_bNum0OnClick:
	RETURN      0
; end of _bNum0OnClick

_bNum1ChOnClick:

;CHi_Hub_VGCLD_events_code.c,183 :: 		void bNum1ChOnClick() {
;CHi_Hub_VGCLD_events_code.c,184 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,185 :: 		Ch_Key_pressed('1');
	MOVLW       49
	MOVWF       FARG_Ch_Key_pressed_letter_pressed+0 
	CALL        _Ch_Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,186 :: 		}
L_end_bNum1ChOnClick:
	RETURN      0
; end of _bNum1ChOnClick

_bNum2ChOnClick:

;CHi_Hub_VGCLD_events_code.c,188 :: 		void bNum2ChOnClick() {
;CHi_Hub_VGCLD_events_code.c,189 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,190 :: 		Ch_Key_pressed('2');
	MOVLW       50
	MOVWF       FARG_Ch_Key_pressed_letter_pressed+0 
	CALL        _Ch_Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,191 :: 		}
L_end_bNum2ChOnClick:
	RETURN      0
; end of _bNum2ChOnClick

_bNum3ChOnClick:

;CHi_Hub_VGCLD_events_code.c,193 :: 		void bNum3ChOnClick() {
;CHi_Hub_VGCLD_events_code.c,194 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,195 :: 		Ch_Key_pressed('3');
	MOVLW       51
	MOVWF       FARG_Ch_Key_pressed_letter_pressed+0 
	CALL        _Ch_Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,196 :: 		}
L_end_bNum3ChOnClick:
	RETURN      0
; end of _bNum3ChOnClick

_bNum4ChOnClick:

;CHi_Hub_VGCLD_events_code.c,198 :: 		void bNum4ChOnClick() {
;CHi_Hub_VGCLD_events_code.c,199 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,200 :: 		Ch_Key_pressed('4');
	MOVLW       52
	MOVWF       FARG_Ch_Key_pressed_letter_pressed+0 
	CALL        _Ch_Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,201 :: 		}
L_end_bNum4ChOnClick:
	RETURN      0
; end of _bNum4ChOnClick

_bNum5ChOnClick:

;CHi_Hub_VGCLD_events_code.c,203 :: 		void bNum5ChOnClick() {
;CHi_Hub_VGCLD_events_code.c,204 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,205 :: 		Ch_Key_pressed('5');
	MOVLW       53
	MOVWF       FARG_Ch_Key_pressed_letter_pressed+0 
	CALL        _Ch_Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,206 :: 		}
L_end_bNum5ChOnClick:
	RETURN      0
; end of _bNum5ChOnClick

_bNum6ChOnClick:

;CHi_Hub_VGCLD_events_code.c,208 :: 		void bNum6ChOnClick() {
;CHi_Hub_VGCLD_events_code.c,209 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,210 :: 		Ch_Key_pressed('6');
	MOVLW       54
	MOVWF       FARG_Ch_Key_pressed_letter_pressed+0 
	CALL        _Ch_Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,211 :: 		}
L_end_bNum6ChOnClick:
	RETURN      0
; end of _bNum6ChOnClick

_bNum7ChOnClick:

;CHi_Hub_VGCLD_events_code.c,213 :: 		void bNum7ChOnClick() {
;CHi_Hub_VGCLD_events_code.c,214 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,215 :: 		Ch_Key_pressed('7');
	MOVLW       55
	MOVWF       FARG_Ch_Key_pressed_letter_pressed+0 
	CALL        _Ch_Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,216 :: 		}
L_end_bNum7ChOnClick:
	RETURN      0
; end of _bNum7ChOnClick

_bNum8ChOnClick:

;CHi_Hub_VGCLD_events_code.c,218 :: 		void bNum8ChOnClick() {
;CHi_Hub_VGCLD_events_code.c,219 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,220 :: 		Ch_Key_pressed('8');
	MOVLW       56
	MOVWF       FARG_Ch_Key_pressed_letter_pressed+0 
	CALL        _Ch_Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,221 :: 		}
L_end_bNum8ChOnClick:
	RETURN      0
; end of _bNum8ChOnClick

_bNum9ChOnClick:

;CHi_Hub_VGCLD_events_code.c,223 :: 		void bNum9ChOnClick() {
;CHi_Hub_VGCLD_events_code.c,224 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,225 :: 		Ch_Key_pressed('9');
	MOVLW       57
	MOVWF       FARG_Ch_Key_pressed_letter_pressed+0 
	CALL        _Ch_Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,226 :: 		}
L_end_bNum9ChOnClick:
	RETURN      0
; end of _bNum9ChOnClick

_bNum0ChOnClick:

;CHi_Hub_VGCLD_events_code.c,228 :: 		void bNum0ChOnClick() {
;CHi_Hub_VGCLD_events_code.c,229 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,230 :: 		Ch_Key_pressed('0');
	MOVLW       48
	MOVWF       FARG_Ch_Key_pressed_letter_pressed+0 
	CALL        _Ch_Key_pressed+0, 0
;CHi_Hub_VGCLD_events_code.c,231 :: 		}
L_end_bNum0ChOnClick:
	RETURN      0
; end of _bNum0ChOnClick

_bChPwOnClick:

;CHi_Hub_VGCLD_events_code.c,234 :: 		void bChPwOnClick() {
;CHi_Hub_VGCLD_events_code.c,236 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,240 :: 		lChPWLabel.Font_Color = T6963C_BLACK; // Clears old text
	CLRF        _lChPWLabel+12 
;CHi_Hub_VGCLD_events_code.c,241 :: 		DrawLabel(&lChPWLabel);
	MOVLW       _lChPWLabel+0
	MOVWF       FARG_DrawLabel_ALabel+0 
	MOVLW       hi_addr(_lChPWLabel+0)
	MOVWF       FARG_DrawLabel_ALabel+1 
	CALL        _DrawLabel+0, 0
;CHi_Hub_VGCLD_events_code.c,242 :: 		lChPWLabel.Font_Color = T6963C_WHITE; // Back to normal text
	MOVLW       8
	MOVWF       _lChPWLabel+12 
;CHi_Hub_VGCLD_events_code.c,244 :: 		if(strlen(typed_letters) == 4)
	MOVLW       _typed_letters+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bChPwOnClick45
	MOVLW       4
	XORWF       R0, 0 
L__bChPwOnClick45:
	BTFSS       STATUS+0, 2 
	GOTO        L_bChPwOnClick2
;CHi_Hub_VGCLD_events_code.c,247 :: 		BacklightRed = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,248 :: 		BacklightGreen = 0;
	BCF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,249 :: 		BLUE_DUTY_CYCLE = 0;
	CLRF        CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,250 :: 		Delay_Ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_bChPwOnClick3:
	DECFSZ      R13, 1, 1
	BRA         L_bChPwOnClick3
	DECFSZ      R12, 1, 1
	BRA         L_bChPwOnClick3
	DECFSZ      R11, 1, 1
	BRA         L_bChPwOnClick3
	NOP
	NOP
;CHi_Hub_VGCLD_events_code.c,251 :: 		BacklightRed = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,252 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,253 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,254 :: 		for(i=0; i<4; i++)
	CLRF        bChPwOnClick_i_L0+0 
L_bChPwOnClick4:
	MOVLW       4
	SUBWF       bChPwOnClick_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_bChPwOnClick5
;CHi_Hub_VGCLD_events_code.c,256 :: 		EEParams.HubParams.Password[i] = typed_letters[i];
	MOVLW       _EEParams+23
	MOVWF       FSR1 
	MOVLW       hi_addr(_EEParams+23)
	MOVWF       FSR1H 
	MOVF        bChPwOnClick_i_L0+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _typed_letters+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FSR0H 
	MOVF        bChPwOnClick_i_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;CHi_Hub_VGCLD_events_code.c,258 :: 		Write_params(EEParams.Params_Array);
	MOVLW       _EEParams+0
	MOVWF       FARG_Write_params_ptr+0 
	MOVLW       hi_addr(_EEParams+0)
	MOVWF       FARG_Write_params_ptr+1 
	CALL        _Write_params+0, 0
;CHi_Hub_VGCLD_events_code.c,254 :: 		for(i=0; i<4; i++)
	INCF        bChPwOnClick_i_L0+0, 1 
;CHi_Hub_VGCLD_events_code.c,259 :: 		}
	GOTO        L_bChPwOnClick4
L_bChPwOnClick5:
;CHi_Hub_VGCLD_events_code.c,260 :: 		strcpy(bChPWCancel_Caption,"DONE");
	MOVLW       _bChPWCancel_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_bChPWCancel_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr3_CHi_Hub_VGCLD_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr3_CHi_Hub_VGCLD_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CHi_Hub_VGCLD_events_code.c,261 :: 		DrawRoundButton(&bChPWCancel);
	MOVLW       _bChPWCancel+0
	MOVWF       FARG_DrawRoundButton_Around_button+0 
	MOVLW       hi_addr(_bChPWCancel+0)
	MOVWF       FARG_DrawRoundButton_Around_button+1 
	CALL        _DrawRoundButton+0, 0
;CHi_Hub_VGCLD_events_code.c,262 :: 		}
	GOTO        L_bChPwOnClick7
L_bChPwOnClick2:
;CHi_Hub_VGCLD_events_code.c,267 :: 		BacklightRed = 0;
	BCF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,268 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,269 :: 		BLUE_DUTY_CYCLE = 0;
	CLRF        CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,270 :: 		Delay_Ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_bChPwOnClick8:
	DECFSZ      R13, 1, 1
	BRA         L_bChPwOnClick8
	DECFSZ      R12, 1, 1
	BRA         L_bChPwOnClick8
	DECFSZ      R11, 1, 1
	BRA         L_bChPwOnClick8
	NOP
	NOP
;CHi_Hub_VGCLD_events_code.c,271 :: 		BacklightRed = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,272 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,273 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,274 :: 		BacklightBlue = 0; // Set PWM for blue to off
	BCF         BacklightBlue+0, BitPos(BacklightBlue+0) 
;CHi_Hub_VGCLD_events_code.c,276 :: 		}  // end not the correct password
L_bChPwOnClick7:
;CHi_Hub_VGCLD_events_code.c,278 :: 		strcpy(lChPWLabel_Caption, "    ");
	MOVLW       _lChPWLabel_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_lChPWLabel_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr4_CHi_Hub_VGCLD_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr4_CHi_Hub_VGCLD_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CHi_Hub_VGCLD_events_code.c,279 :: 		DrawLabel(&lChPWLabel);
	MOVLW       _lChPWLabel+0
	MOVWF       FARG_DrawLabel_ALabel+0 
	MOVLW       hi_addr(_lChPWLabel+0)
	MOVWF       FARG_DrawLabel_ALabel+1 
	CALL        _DrawLabel+0, 0
;CHi_Hub_VGCLD_events_code.c,280 :: 		typed_letters[0] = 0;
	CLRF        _typed_letters+0 
;CHi_Hub_VGCLD_events_code.c,281 :: 		}
L_end_bChPwOnClick:
	RETURN      0
; end of _bChPwOnClick

_bChPWCancelOnClick:

;CHi_Hub_VGCLD_events_code.c,283 :: 		void bChPWCancelOnClick() {
;CHi_Hub_VGCLD_events_code.c,285 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,286 :: 		strcpy(lChPWLabel_Caption, "    ");
	MOVLW       _lChPWLabel_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_lChPWLabel_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr5_CHi_Hub_VGCLD_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr5_CHi_Hub_VGCLD_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CHi_Hub_VGCLD_events_code.c,287 :: 		strcpy(typed_letters, "");
	MOVLW       _typed_letters+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr6_CHi_Hub_VGCLD_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr6_CHi_Hub_VGCLD_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CHi_Hub_VGCLD_events_code.c,288 :: 		DrawScreen(&ScreenAdmin1);
	MOVLW       _ScreenAdmin1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,289 :: 		strcpy(bChPWCancel_Caption,"CANCEL");
	MOVLW       _bChPWCancel_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_bChPWCancel_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr7_CHi_Hub_VGCLD_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr7_CHi_Hub_VGCLD_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CHi_Hub_VGCLD_events_code.c,290 :: 		}
L_end_bChPWCancelOnClick:
	RETURN      0
; end of _bChPWCancelOnClick

_bSetUpOnClick:

;CHi_Hub_VGCLD_events_code.c,292 :: 		void bSetUpOnClick() {
;CHi_Hub_VGCLD_events_code.c,294 :: 		DrawScreen(&ScreenPW);
	MOVLW       _ScreenPW+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,295 :: 		}
L_end_bSetUpOnClick:
	RETURN      0
; end of _bSetUpOnClick

_CHiLogoOnClick:

;CHi_Hub_VGCLD_events_code.c,298 :: 		void CHiLogoOnClick() {
;CHi_Hub_VGCLD_events_code.c,299 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,300 :: 		BacklightRed = 1;  // off
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,301 :: 		BacklightGreen = 1;  // off
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,302 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;  // Set Blue PWM to duty cycle...
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,303 :: 		DrawScreen(&ScreenPW);
	MOVLW       _ScreenPW+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,304 :: 		}
L_end_CHiLogoOnClick:
	RETURN      0
; end of _CHiLogoOnClick

_SmallChairLogoOnClick:

;CHi_Hub_VGCLD_events_code.c,306 :: 		void SmallChairLogoOnClick() {
;CHi_Hub_VGCLD_events_code.c,307 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,308 :: 		DrawScreen(&ScreenWelcome);
	MOVLW       _ScreenWelcome+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenWelcome+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,311 :: 		time_out_tmr = (TIME_OUT_NO_ACTIVITY - 500);
	MOVLW       124
	MOVWF       _time_out_tmr+0 
	MOVLW       21
	MOVWF       _time_out_tmr+1 
;CHi_Hub_VGCLD_events_code.c,312 :: 		}
L_end_SmallChairLogoOnClick:
	RETURN      0
; end of _SmallChairLogoOnClick

_bReclineBackOnClick:

;CHi_Hub_VGCLD_events_code.c,314 :: 		void bReclineBackOnClick() {
;CHi_Hub_VGCLD_events_code.c,315 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,317 :: 		DrawScreen(&ScreenAdmin1);
	MOVLW       _ScreenAdmin1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,318 :: 		}
L_end_bReclineBackOnClick:
	RETURN      0
; end of _bReclineBackOnClick

_bBindFlashOnClick:

;CHi_Hub_VGCLD_events_code.c,320 :: 		void bBindFlashOnClick() {
;CHi_Hub_VGCLD_events_code.c,322 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,323 :: 		Toggle_Send_RF_Bind_with_Flash();
	CALL        _Toggle_Send_RF_Bind_with_Flash+0, 0
;CHi_Hub_VGCLD_events_code.c,324 :: 		}
L_end_bBindFlashOnClick:
	RETURN      0
; end of _bBindFlashOnClick

_bBindFlashOnUp:

;CHi_Hub_VGCLD_events_code.c,326 :: 		void bBindFlashOnUp() {
;CHi_Hub_VGCLD_events_code.c,328 :: 		BacklightRed = 1;  // off
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,329 :: 		BacklightGreen = 1;  // off
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,330 :: 		BacklightBlue = 0;  // Set Blue PWM to duty cycle...
	BCF         BacklightBlue+0, BitPos(BacklightBlue+0) 
;CHi_Hub_VGCLD_events_code.c,331 :: 		}
L_end_bBindFlashOnUp:
	RETURN      0
; end of _bBindFlashOnUp

_bBindFlashOnPress:

;CHi_Hub_VGCLD_events_code.c,333 :: 		void bBindFlashOnPress() {
;CHi_Hub_VGCLD_events_code.c,335 :: 		BacklightRed = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,336 :: 		BacklightGreen = 0;
	BCF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,337 :: 		BacklightBlue = 1; // Set PWM for blue to off
	BSF         BacklightBlue+0, BitPos(BacklightBlue+0) 
;CHi_Hub_VGCLD_events_code.c,340 :: 		}
L_end_bBindFlashOnPress:
	RETURN      0
; end of _bBindFlashOnPress

_bBindNoFlashOnClick:

;CHi_Hub_VGCLD_events_code.c,342 :: 		void bBindNoFlashOnClick() {
;CHi_Hub_VGCLD_events_code.c,344 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,345 :: 		Toggle_Send_RF_Bind_no_Flash();
	CALL        _Toggle_Send_RF_Bind_no_Flash+0, 0
;CHi_Hub_VGCLD_events_code.c,346 :: 		}
L_end_bBindNoFlashOnClick:
	RETURN      0
; end of _bBindNoFlashOnClick

_bBindNoFlashOnUp:

;CHi_Hub_VGCLD_events_code.c,348 :: 		void bBindNoFlashOnUp() {
;CHi_Hub_VGCLD_events_code.c,350 :: 		BacklightRed = 1;  // off
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,351 :: 		BacklightGreen = 1;  // off
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,352 :: 		BacklightBlue = 0;  // Set Blue PWM to duty cycle...
	BCF         BacklightBlue+0, BitPos(BacklightBlue+0) 
;CHi_Hub_VGCLD_events_code.c,353 :: 		}
L_end_bBindNoFlashOnUp:
	RETURN      0
; end of _bBindNoFlashOnUp

_bBindNoFlashOnPress:

;CHi_Hub_VGCLD_events_code.c,355 :: 		void bBindNoFlashOnPress() {
;CHi_Hub_VGCLD_events_code.c,357 :: 		BacklightRed = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,358 :: 		BacklightGreen = 0;
	BCF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,359 :: 		BLUE_DUTY_CYCLE = 0;  // Set Blue PWM to duty cycle to OFF
	CLRF        CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,362 :: 		}
L_end_bBindNoFlashOnPress:
	RETURN      0
; end of _bBindNoFlashOnPress

_bCalTouchOnClick:

;CHi_Hub_VGCLD_events_code.c,364 :: 		void bCalTouchOnClick() {
;CHi_Hub_VGCLD_events_code.c,367 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,368 :: 		BacklightRed = 0;
	BCF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,369 :: 		BacklightGreen = 0;
	BCF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,370 :: 		BacklightBlue = 0; // Make the Screen white
	BCF         BacklightBlue+0, BitPos(BacklightBlue+0) 
;CHi_Hub_VGCLD_events_code.c,372 :: 		My_Calibrate_TP();
	CALL        _My_Calibrate_TP+0, 0
;CHi_Hub_VGCLD_events_code.c,375 :: 		BacklightRed = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,376 :: 		BacklightGreen = 1; // Back to blue
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,379 :: 		Write_Cals(); // Write to EEProm
	CALL        _Write_Cals+0, 0
;CHi_Hub_VGCLD_events_code.c,381 :: 		DrawScreen(&ScreenAdmin2); // Draw the screen
	MOVLW       _ScreenAdmin2+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin2+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,382 :: 		}
L_end_bCalTouchOnClick:
	RETURN      0
; end of _bCalTouchOnClick

_bPWEnterOnClick:

;CHi_Hub_VGCLD_events_code.c,384 :: 		void bPWEnterOnClick() {
;CHi_Hub_VGCLD_events_code.c,387 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,388 :: 		lPWLabel.Font_Color = T6963C_BLACK; // Clears old text
	CLRF        _lPWLabel+12 
;CHi_Hub_VGCLD_events_code.c,389 :: 		DrawLabel(&lPWLabel);
	MOVLW       _lPWLabel+0
	MOVWF       FARG_DrawLabel_ALabel+0 
	MOVLW       hi_addr(_lPWLabel+0)
	MOVWF       FARG_DrawLabel_ALabel+1 
	CALL        _DrawLabel+0, 0
;CHi_Hub_VGCLD_events_code.c,390 :: 		lPWLabel.Font_Color = T6963C_WHITE; // Back to normal text
	MOVLW       8
	MOVWF       _lPWLabel+12 
;CHi_Hub_VGCLD_events_code.c,402 :: 		if(strcmp(lPWLabel_Caption, EEParams.HubParams.Password) == 0)
	MOVLW       _lPWLabel_Caption+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_lPWLabel_Caption+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       _EEParams+23
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(_EEParams+23)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bPWEnterOnClick59
	MOVLW       0
	XORWF       R0, 0 
L__bPWEnterOnClick59:
	BTFSS       STATUS+0, 2 
	GOTO        L_bPWEnterOnClick9
;CHi_Hub_VGCLD_events_code.c,405 :: 		DrawScreen(&ScreenMain);
	MOVLW       _ScreenMain+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenMain+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,406 :: 		}
	GOTO        L_bPWEnterOnClick10
L_bPWEnterOnClick9:
;CHi_Hub_VGCLD_events_code.c,407 :: 		else if(strcmp(lPWLabel_Caption, FACTORY_PASSWORD) == 0)
	MOVLW       _lPWLabel_Caption+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_lPWLabel_Caption+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr8_CHi_Hub_VGCLD_events_code+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr8_CHi_Hub_VGCLD_events_code+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bPWEnterOnClick60
	MOVLW       0
	XORWF       R0, 0 
L__bPWEnterOnClick60:
	BTFSS       STATUS+0, 2 
	GOTO        L_bPWEnterOnClick11
;CHi_Hub_VGCLD_events_code.c,410 :: 		DrawScreen(&ScreenAdmin1);
	MOVLW       _ScreenAdmin1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,411 :: 		}
	GOTO        L_bPWEnterOnClick12
L_bPWEnterOnClick11:
;CHi_Hub_VGCLD_events_code.c,416 :: 		BacklightRed = 0;
	BCF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,417 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,418 :: 		BLUE_DUTY_CYCLE = 0;
	CLRF        CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,419 :: 		Delay_Ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_bPWEnterOnClick13:
	DECFSZ      R13, 1, 1
	BRA         L_bPWEnterOnClick13
	DECFSZ      R12, 1, 1
	BRA         L_bPWEnterOnClick13
	DECFSZ      R11, 1, 1
	BRA         L_bPWEnterOnClick13
	NOP
	NOP
;CHi_Hub_VGCLD_events_code.c,420 :: 		BacklightRed = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,421 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,422 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,423 :: 		BacklightBlue = 0; // Set PWM for blue to off
	BCF         BacklightBlue+0, BitPos(BacklightBlue+0) 
;CHi_Hub_VGCLD_events_code.c,425 :: 		}  // end not the correct password
L_bPWEnterOnClick12:
L_bPWEnterOnClick10:
;CHi_Hub_VGCLD_events_code.c,427 :: 		strcpy(lPWLabel_Caption, "      ");
	MOVLW       _lPWLabel_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_lPWLabel_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr9_CHi_Hub_VGCLD_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr9_CHi_Hub_VGCLD_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CHi_Hub_VGCLD_events_code.c,428 :: 		DrawLabel(&lPWLabel);
	MOVLW       _lPWLabel+0
	MOVWF       FARG_DrawLabel_ALabel+0 
	MOVLW       hi_addr(_lPWLabel+0)
	MOVWF       FARG_DrawLabel_ALabel+1 
	CALL        _DrawLabel+0, 0
;CHi_Hub_VGCLD_events_code.c,429 :: 		typed_letters[0] = 0;
	CLRF        _typed_letters+0 
;CHi_Hub_VGCLD_events_code.c,430 :: 		}
L_end_bPWEnterOnClick:
	RETURN      0
; end of _bPWEnterOnClick

_bPWCancelOnClick:

;CHi_Hub_VGCLD_events_code.c,433 :: 		void bPWCancelOnClick() {
;CHi_Hub_VGCLD_events_code.c,435 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,436 :: 		strcpy(lPWLabel_Caption, "      "); // clear caption label
	MOVLW       _lPWLabel_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_lPWLabel_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr10_CHi_Hub_VGCLD_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr10_CHi_Hub_VGCLD_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CHi_Hub_VGCLD_events_code.c,437 :: 		strcpy(typed_letters, "");
	MOVLW       _typed_letters+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr11_CHi_Hub_VGCLD_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr11_CHi_Hub_VGCLD_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;CHi_Hub_VGCLD_events_code.c,438 :: 		DrawScreen(&ScreenWelcome);
	MOVLW       _ScreenWelcome+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenWelcome+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,441 :: 		time_out_tmr = (TIME_OUT_NO_ACTIVITY - 500);
	MOVLW       124
	MOVWF       _time_out_tmr+0 
	MOVLW       21
	MOVWF       _time_out_tmr+1 
;CHi_Hub_VGCLD_events_code.c,442 :: 		}
L_end_bPWCancelOnClick:
	RETURN      0
; end of _bPWCancelOnClick

_bSetReclineLimitOnClick:

;CHi_Hub_VGCLD_events_code.c,444 :: 		void bSetReclineLimitOnClick() {
;CHi_Hub_VGCLD_events_code.c,445 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,446 :: 		DrawScreen(&ScreenSetRecline);
	MOVLW       _ScreenSetRecline+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenSetRecline+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,447 :: 		}
L_end_bSetReclineLimitOnClick:
	RETURN      0
; end of _bSetReclineLimitOnClick

_bChangePWOnClick:

;CHi_Hub_VGCLD_events_code.c,449 :: 		void bChangePWOnClick(void) {
;CHi_Hub_VGCLD_events_code.c,450 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,451 :: 		DrawScreen(&ScreenChangePW);
	MOVLW       _ScreenChangePW+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,452 :: 		}
L_end_bChangePWOnClick:
	RETURN      0
; end of _bChangePWOnClick

_bDimLevelOnClick:

;CHi_Hub_VGCLD_events_code.c,454 :: 		void bDimLevelOnClick() {
;CHi_Hub_VGCLD_events_code.c,456 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,457 :: 		DrawScreen(&ScreenTPDimLevel);
	MOVLW       _ScreenTPDimLevel+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenTPDimLevel+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,458 :: 		}
L_end_bDimLevelOnClick:
	RETURN      0
; end of _bDimLevelOnClick

_bDimBackOnClick:

;CHi_Hub_VGCLD_events_code.c,460 :: 		void bDimBackOnClick() {
;CHi_Hub_VGCLD_events_code.c,463 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,464 :: 		EEParams.HubParams.Backlight_Level = BLUE_DUTY_CYCLE;
	MOVF        CCPR3L+0, 0 
	MOVWF       _EEParams+0 
;CHi_Hub_VGCLD_events_code.c,465 :: 		EEPROM_Write(CHAIR_PARAMS_ADDRESS, BLUE_DUTY_CYCLE);  // BLUE_DUTY_CYCLE is mapped to CCPR3L - duty cycle register
	MOVLW       10
	MOVWF       FARG_EEPROM_Write_address+0 
	MOVLW       0
	MOVWF       FARG_EEPROM_Write_address+1 
	MOVF        CCPR3L+0, 0 
	MOVWF       FARG_EEPROM_Write_data_+0 
	CALL        _EEPROM_Write+0, 0
;CHi_Hub_VGCLD_events_code.c,468 :: 		DrawScreen(&ScreenAdmin1);
	MOVLW       _ScreenAdmin1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,469 :: 		}
L_end_bDimBackOnClick:
	RETURN      0
; end of _bDimBackOnClick

_bDimOffOnClick:

;CHi_Hub_VGCLD_events_code.c,471 :: 		void bDimOffOnClick() {
;CHi_Hub_VGCLD_events_code.c,473 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,474 :: 		BLUE_DUTY_CYCLE = 0;  // Set to Zero
	CLRF        CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,476 :: 		}
L_end_bDimOffOnClick:
	RETURN      0
; end of _bDimOffOnClick

_bDimLowOnClick:

;CHi_Hub_VGCLD_events_code.c,478 :: 		void bDimLowOnClick() {
;CHi_Hub_VGCLD_events_code.c,480 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,481 :: 		BLUE_DUTY_CYCLE = BLUE_DUTY_CYCLE_LOW;  // Set to low Brightness
	MOVLW       10
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,482 :: 		}
L_end_bDimLowOnClick:
	RETURN      0
; end of _bDimLowOnClick

_bDimMedOnClick:

;CHi_Hub_VGCLD_events_code.c,484 :: 		void bDimMedOnClick() {
;CHi_Hub_VGCLD_events_code.c,486 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,487 :: 		BLUE_DUTY_CYCLE = BLUE_DUTY_CYCLE_MED;  // Set to Med Brightness
	MOVLW       100
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,488 :: 		}
L_end_bDimMedOnClick:
	RETURN      0
; end of _bDimMedOnClick

_bDimHighOnClick:

;CHi_Hub_VGCLD_events_code.c,490 :: 		void bDimHighOnClick() {
;CHi_Hub_VGCLD_events_code.c,492 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,493 :: 		BLUE_DUTY_CYCLE = BLUE_DUTY_CYCLE_HIGH;  // Set to High Brightness
	MOVLW       240
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,494 :: 		}
L_end_bDimHighOnClick:
	RETURN      0
; end of _bDimHighOnClick

_bNext2Admin2OnClick:

;CHi_Hub_VGCLD_events_code.c,496 :: 		void bNext2Admin2OnClick() {
;CHi_Hub_VGCLD_events_code.c,498 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,499 :: 		DrawScreen(&ScreenAdmin2);
	MOVLW       _ScreenAdmin2+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin2+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,500 :: 		}
L_end_bNext2Admin2OnClick:
	RETURN      0
; end of _bNext2Admin2OnClick

_bAdminReturn2OnClick:

;CHi_Hub_VGCLD_events_code.c,502 :: 		void bAdminReturn2OnClick() {
;CHi_Hub_VGCLD_events_code.c,504 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,505 :: 		DrawScreen(&ScreenAdmin1);
	MOVLW       _ScreenAdmin1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,506 :: 		}
L_end_bAdminReturn2OnClick:
	RETURN      0
; end of _bAdminReturn2OnClick

_bAdminReturnOnClick:

;CHi_Hub_VGCLD_events_code.c,508 :: 		void bAdminReturnOnClick() {
;CHi_Hub_VGCLD_events_code.c,510 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,511 :: 		DrawScreen(&ScreenWelcome);
	MOVLW       _ScreenWelcome+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenWelcome+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,514 :: 		time_out_tmr = (TIME_OUT_NO_ACTIVITY - 500);
	MOVLW       124
	MOVWF       _time_out_tmr+0 
	MOVLW       21
	MOVWF       _time_out_tmr+1 
;CHi_Hub_VGCLD_events_code.c,515 :: 		}
L_end_bAdminReturnOnClick:
	RETURN      0
; end of _bAdminReturnOnClick

_bSendReclineLimitCmdOnClick:

;CHi_Hub_VGCLD_events_code.c,517 :: 		void bSendReclineLimitCmdOnClick() {
;CHi_Hub_VGCLD_events_code.c,520 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,522 :: 		BacklightRed = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,523 :: 		BacklightGreen = 0;
	BCF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,524 :: 		BLUE_DUTY_CYCLE = 255; // Set PWM for blue to off
	MOVLW       255
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,527 :: 		Data_buf[0] = 1; // length = 1 - Only a Command
	MOVLW       1
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,528 :: 		Data_buf[1] = CMD_SET_RECLINE_POS; // define for the command
	MOVLW       10
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,529 :: 		Send_RF_Broadcast_Cmd_n(5); // Send it 5 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       5
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,531 :: 		Delay_Ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_bSendReclineLimitCmdOnClick14:
	DECFSZ      R13, 1, 1
	BRA         L_bSendReclineLimitCmdOnClick14
	DECFSZ      R12, 1, 1
	BRA         L_bSendReclineLimitCmdOnClick14
	DECFSZ      R11, 1, 1
	BRA         L_bSendReclineLimitCmdOnClick14
	NOP
	NOP
;CHi_Hub_VGCLD_events_code.c,532 :: 		BacklightRed = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,533 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,534 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level; // Set PWM for blue to Nominal value
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,535 :: 		}
L_end_bSendReclineLimitCmdOnClick:
	RETURN      0
; end of _bSendReclineLimitCmdOnClick

_bSendReclineLimitCmdOnPress:

;CHi_Hub_VGCLD_events_code.c,537 :: 		void bSendReclineLimitCmdOnPress() {
;CHi_Hub_VGCLD_events_code.c,542 :: 		BacklightRed = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,543 :: 		BacklightGreen = 0;
	BCF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,544 :: 		BLUE_DUTY_CYCLE = 255; // Set PWM for blue to off
	MOVLW       255
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,547 :: 		Data_buf[0] = 1; // length = 1 - Only a Command
	MOVLW       1
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,548 :: 		Data_buf[1] = CMD_SET_RECLINE_POS; // define for the command
	MOVLW       10
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,549 :: 		Send_RF_Broadcast_Cmd_n(5); // Send it 5 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       5
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,551 :: 		}
L_end_bSendReclineLimitCmdOnPress:
	RETURN      0
; end of _bSendReclineLimitCmdOnPress

_bSendReclineLimitCmdOnUp:

;CHi_Hub_VGCLD_events_code.c,553 :: 		void bSendReclineLimitCmdOnUp() {
;CHi_Hub_VGCLD_events_code.c,556 :: 		BacklightRed = 1;  // off
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,557 :: 		BacklightGreen = 1;  // off
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,558 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;  // Set Blue PWM to duty cycle...
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,559 :: 		}
L_end_bSendReclineLimitCmdOnUp:
	RETURN      0
; end of _bSendReclineLimitCmdOnUp

_bChairDimOnClick:

;CHi_Hub_VGCLD_events_code.c,561 :: 		void bChairDimOnClick() {
;CHi_Hub_VGCLD_events_code.c,563 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,564 :: 		DrawScreen(&ScreenChDimLevel);
	MOVLW       _ScreenChDimLevel+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenChDimLevel+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,565 :: 		}
L_end_bChairDimOnClick:
	RETURN      0
; end of _bChairDimOnClick

_bDimChBackOnClick:

;CHi_Hub_VGCLD_events_code.c,567 :: 		void bDimChBackOnClick() {
;CHi_Hub_VGCLD_events_code.c,569 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,570 :: 		DrawScreen(&ScreenAdmin1);
	MOVLW       _ScreenAdmin1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,571 :: 		}
L_end_bDimChBackOnClick:
	RETURN      0
; end of _bDimChBackOnClick

_bDimBackOffOnClick:

;CHi_Hub_VGCLD_events_code.c,573 :: 		void bDimBackOffOnClick() {
;CHi_Hub_VGCLD_events_code.c,576 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,577 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,578 :: 		Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
	MOVLW       11
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,579 :: 		Data_buf[2] = 0; // Set dim level to 0 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	CLRF        _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,580 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,582 :: 		}
L_end_bDimBackOffOnClick:
	RETURN      0
; end of _bDimBackOffOnClick

_bDimBack1OnClick:

;CHi_Hub_VGCLD_events_code.c,584 :: 		void bDimBack1OnClick() {
;CHi_Hub_VGCLD_events_code.c,587 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,588 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,589 :: 		Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
	MOVLW       11
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,590 :: 		Data_buf[2] = 1; // Set dim level to 1 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	MOVLW       1
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,591 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,593 :: 		}
L_end_bDimBack1OnClick:
	RETURN      0
; end of _bDimBack1OnClick

_bDimBack2OnClick:

;CHi_Hub_VGCLD_events_code.c,596 :: 		void bDimBack2OnClick() {
;CHi_Hub_VGCLD_events_code.c,599 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,600 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,601 :: 		Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
	MOVLW       11
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,602 :: 		Data_buf[2] = 2; // Set dim level to 2 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	MOVLW       2
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,603 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,605 :: 		}
L_end_bDimBack2OnClick:
	RETURN      0
; end of _bDimBack2OnClick

_bDimBack3OnClick:

;CHi_Hub_VGCLD_events_code.c,608 :: 		void bDimBack3OnClick() {
;CHi_Hub_VGCLD_events_code.c,611 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,612 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,613 :: 		Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
	MOVLW       11
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,614 :: 		Data_buf[2] = 3; // Set dim level to 3 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	MOVLW       3
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,615 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,617 :: 		}
L_end_bDimBack3OnClick:
	RETURN      0
; end of _bDimBack3OnClick

_bDimBack4OnClick:

;CHi_Hub_VGCLD_events_code.c,619 :: 		void bDimBack4OnClick() {
;CHi_Hub_VGCLD_events_code.c,622 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,623 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,624 :: 		Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
	MOVLW       11
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,625 :: 		Data_buf[2] = 4; // Set dim level to 4 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	MOVLW       4
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,626 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,628 :: 		}
L_end_bDimBack4OnClick:
	RETURN      0
; end of _bDimBack4OnClick

_bDimBack5OnClick:

;CHi_Hub_VGCLD_events_code.c,630 :: 		void bDimBack5OnClick() {
;CHi_Hub_VGCLD_events_code.c,633 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,634 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,635 :: 		Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
	MOVLW       11
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,636 :: 		Data_buf[2] = 5; // Set dim level to 5 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	MOVLW       5
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,637 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,639 :: 		}
L_end_bDimBack5OnClick:
	RETURN      0
; end of _bDimBack5OnClick

_bDimBack6OnClick:

;CHi_Hub_VGCLD_events_code.c,641 :: 		void bDimBack6OnClick() {
;CHi_Hub_VGCLD_events_code.c,644 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,645 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,646 :: 		Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
	MOVLW       11
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,647 :: 		Data_buf[2] = 6; // Set dim level to 6 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	MOVLW       6
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,648 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,650 :: 		}
L_end_bDimBack6OnClick:
	RETURN      0
; end of _bDimBack6OnClick

_bDimBackMaxOnClick:

;CHi_Hub_VGCLD_events_code.c,652 :: 		void bDimBackMaxOnClick() {
;CHi_Hub_VGCLD_events_code.c,655 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,656 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,657 :: 		Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
	MOVLW       11
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,658 :: 		Data_buf[2] = 7; // Set dim level to 7 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	MOVLW       7
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,659 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,661 :: 		}
L_end_bDimBackMaxOnClick:
	RETURN      0
; end of _bDimBackMaxOnClick

_bDimAmbOffOnClick:

;CHi_Hub_VGCLD_events_code.c,665 :: 		void bDimAmbOffOnClick() {
;CHi_Hub_VGCLD_events_code.c,668 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,669 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,670 :: 		Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
	MOVLW       12
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,671 :: 		Data_buf[2] = 0; // Set dim level to 0 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	CLRF        _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,672 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,674 :: 		}
L_end_bDimAmbOffOnClick:
	RETURN      0
; end of _bDimAmbOffOnClick

_bDimAmb1OnClick:

;CHi_Hub_VGCLD_events_code.c,676 :: 		void bDimAmb1OnClick() {
;CHi_Hub_VGCLD_events_code.c,679 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,680 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,681 :: 		Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
	MOVLW       12
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,682 :: 		Data_buf[2] = 1; // Set dim level to 1 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	MOVLW       1
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,683 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,685 :: 		}
L_end_bDimAmb1OnClick:
	RETURN      0
; end of _bDimAmb1OnClick

_bDimAmb2OnClick:

;CHi_Hub_VGCLD_events_code.c,687 :: 		void bDimAmb2OnClick() {
;CHi_Hub_VGCLD_events_code.c,690 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,691 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,692 :: 		Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
	MOVLW       12
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,693 :: 		Data_buf[2] = 2; // Set dim level to 2 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	MOVLW       2
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,694 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,696 :: 		}
L_end_bDimAmb2OnClick:
	RETURN      0
; end of _bDimAmb2OnClick

_bDimAmb3OnClick:

;CHi_Hub_VGCLD_events_code.c,698 :: 		void bDimAmb3OnClick() {
;CHi_Hub_VGCLD_events_code.c,701 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,702 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,703 :: 		Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
	MOVLW       12
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,704 :: 		Data_buf[2] = 3; // Set dim level to 3 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	MOVLW       3
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,705 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,707 :: 		}
L_end_bDimAmb3OnClick:
	RETURN      0
; end of _bDimAmb3OnClick

_bDimAmb4OnClick:

;CHi_Hub_VGCLD_events_code.c,709 :: 		void bDimAmb4OnClick() {
;CHi_Hub_VGCLD_events_code.c,712 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,713 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,714 :: 		Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
	MOVLW       12
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,715 :: 		Data_buf[2] = 4; // Set dim level to 4 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	MOVLW       4
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,716 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,718 :: 		}
L_end_bDimAmb4OnClick:
	RETURN      0
; end of _bDimAmb4OnClick

_bDimAmb5OnClick:

;CHi_Hub_VGCLD_events_code.c,720 :: 		void bDimAmb5OnClick() {
;CHi_Hub_VGCLD_events_code.c,723 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,724 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,725 :: 		Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
	MOVLW       12
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,726 :: 		Data_buf[2] = 5; // Set dim level to 5 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	MOVLW       5
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,727 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,729 :: 		}
L_end_bDimAmb5OnClick:
	RETURN      0
; end of _bDimAmb5OnClick

_bDimAmb6OnClick:

;CHi_Hub_VGCLD_events_code.c,731 :: 		void bDimAmb6OnClick() {
;CHi_Hub_VGCLD_events_code.c,734 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,735 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,736 :: 		Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
	MOVLW       12
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,737 :: 		Data_buf[2] = 6; // Set dim level to 6 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	MOVLW       6
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,738 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,740 :: 		}
L_end_bDimAmb6OnClick:
	RETURN      0
; end of _bDimAmb6OnClick

_bDimAmbMaxOnClick:

;CHi_Hub_VGCLD_events_code.c,742 :: 		void bDimAmbMaxOnClick() {
;CHi_Hub_VGCLD_events_code.c,745 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,746 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,747 :: 		Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
	MOVLW       12
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,748 :: 		Data_buf[2] = 7; // Set dim level to 7 - Chair uses this as an index into the PWM register array to pick the right value to actually load
	MOVLW       7
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,749 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,751 :: 		}
L_end_bDimAmbMaxOnClick:
	RETURN      0
; end of _bDimAmbMaxOnClick

_bFlashChairOnClick:

;CHi_Hub_VGCLD_events_code.c,753 :: 		void bFlashChairOnClick() {
;CHi_Hub_VGCLD_events_code.c,755 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,756 :: 		Toggle_Send_Flash();
	CALL        _Toggle_Send_Flash+0, 0
;CHi_Hub_VGCLD_events_code.c,757 :: 		}
L_end_bFlashChairOnClick:
	RETURN      0
; end of _bFlashChairOnClick

_bDisplayCalsOnClick:

;CHi_Hub_VGCLD_events_code.c,759 :: 		void bDisplayCalsOnClick() {
;CHi_Hub_VGCLD_events_code.c,761 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,762 :: 		BacklightRed = 0;
	BCF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,763 :: 		BacklightGreen = 0;
	BCF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,764 :: 		BLUE_DUTY_CYCLE = 255; // Full white
	MOVLW       255
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,767 :: 		Display_Cals();  // Write to Screen
	CALL        _Display_Cals+0, 0
;CHi_Hub_VGCLD_events_code.c,768 :: 		Display_Hub_Address();
	CALL        _Display_Hub_Address+0, 0
;CHi_Hub_VGCLD_events_code.c,769 :: 		Delay_ms(7000);
	MOVLW       2
	MOVWF       R10, 0
	MOVLW       171
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_bDisplayCalsOnClick15:
	DECFSZ      R13, 1, 1
	BRA         L_bDisplayCalsOnClick15
	DECFSZ      R12, 1, 1
	BRA         L_bDisplayCalsOnClick15
	DECFSZ      R11, 1, 1
	BRA         L_bDisplayCalsOnClick15
	DECFSZ      R10, 1, 1
	BRA         L_bDisplayCalsOnClick15
;CHi_Hub_VGCLD_events_code.c,771 :: 		BacklightRed = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;CHi_Hub_VGCLD_events_code.c,772 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;CHi_Hub_VGCLD_events_code.c,773 :: 		BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level; // set the duty cycle Register - that's why it's in CAPS - it's a define
	MOVF        _EEParams+0, 0 
	MOVWF       CCPR3L+0 
;CHi_Hub_VGCLD_events_code.c,774 :: 		DrawScreen(&ScreenAdmin2);
	MOVLW       _ScreenAdmin2+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenAdmin2+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_events_code.c,775 :: 		}
L_end_bDisplayCalsOnClick:
	RETURN      0
; end of _bDisplayCalsOnClick

_bEnableKidLockOnClick:

;CHi_Hub_VGCLD_events_code.c,777 :: 		void bEnableKidLockOnClick() {
;CHi_Hub_VGCLD_events_code.c,780 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,781 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,782 :: 		Data_buf[1] = CMD_SET_KID_LOCKOUT; // define for the command
	MOVLW       13
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,783 :: 		Data_buf[2] = 1; // Enable the lockout
	MOVLW       1
	MOVWF       _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,784 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,786 :: 		}
L_end_bEnableKidLockOnClick:
	RETURN      0
; end of _bEnableKidLockOnClick

_bDisableKidLockOnClick:

;CHi_Hub_VGCLD_events_code.c,789 :: 		void bDisableKidLockOnClick() {
;CHi_Hub_VGCLD_events_code.c,792 :: 		Beep();
	CALL        _Beep+0, 0
;CHi_Hub_VGCLD_events_code.c,793 :: 		Data_buf[0] = 2; // length = 2 - Command + 1 byte data
	MOVLW       2
	MOVWF       _Data_buf+0 
;CHi_Hub_VGCLD_events_code.c,794 :: 		Data_buf[1] = CMD_SET_KID_LOCKOUT; // define for the command
	MOVLW       13
	MOVWF       _Data_buf+1 
;CHi_Hub_VGCLD_events_code.c,795 :: 		Data_buf[2] = 0; // Disable the lockout
	CLRF        _Data_buf+2 
;CHi_Hub_VGCLD_events_code.c,796 :: 		Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
	MOVLW       3
	MOVWF       FARG_Send_RF_Broadcast_Cmd_n_n_times+0 
	CALL        _Send_RF_Broadcast_Cmd_n+0, 0
;CHi_Hub_VGCLD_events_code.c,798 :: 		}
L_end_bDisableKidLockOnClick:
	RETURN      0
; end of _bDisableKidLockOnClick
