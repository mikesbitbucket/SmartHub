
_Init_ADC:

;CHi_Hub_VGCLD_driver.c,74 :: 		void Init_ADC() {
;CHi_Hub_VGCLD_driver.c,75 :: 		ANCON0.B0 = 1;    // Configure RA0 pin as analog
	BSF         ANCON0+0, 0 
;CHi_Hub_VGCLD_driver.c,76 :: 		ANCON0.B1 = 1;    // Configure RA1 pin as analog
	BSF         ANCON0+0, 1 
;CHi_Hub_VGCLD_driver.c,77 :: 		TRISA.B0  = 1;    // Set RA0 pin as input
	BSF         TRISA+0, 0 
;CHi_Hub_VGCLD_driver.c,78 :: 		TRISA.B1  = 1;    // Set RA1 pin as input
	BSF         TRISA+0, 1 
;CHi_Hub_VGCLD_driver.c,79 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;CHi_Hub_VGCLD_driver.c,80 :: 		}
L_end_Init_ADC:
	RETURN      0
; end of _Init_ADC

CHi_Hub_VGCLD_driver_InitializeTouchPanel:

;CHi_Hub_VGCLD_driver.c,81 :: 		static void InitializeTouchPanel() {
;CHi_Hub_VGCLD_driver.c,82 :: 		Init_ADC();
	CALL        _Init_ADC+0, 0
;CHi_Hub_VGCLD_driver.c,83 :: 		T6963C_ctrlce_Direction = 0;
	BCF         TRISJ3_bit+0, BitPos(TRISJ3_bit+0) 
;CHi_Hub_VGCLD_driver.c,84 :: 		T6963C_ctrlce = 0;            // Enable T6963C
	BCF         LATJ3_bit+0, BitPos(LATJ3_bit+0) 
;CHi_Hub_VGCLD_driver.c,85 :: 		T6963C_ctrlmd_Direction = 0;
	BCF         TRISJ5_bit+0, BitPos(TRISJ5_bit+0) 
;CHi_Hub_VGCLD_driver.c,86 :: 		T6963C_ctrlmd = 0;            // Column number select
	BCF         LATJ5_bit+0, BitPos(LATJ5_bit+0) 
;CHi_Hub_VGCLD_driver.c,87 :: 		T6963C_ctrlfs_Direction = 0;
	BCF         TRISJ6_bit+0, BitPos(TRISJ6_bit+0) 
;CHi_Hub_VGCLD_driver.c,88 :: 		T6963C_ctrlfs = 0;            // Wide Font
	BCF         LATJ6_bit+0, BitPos(LATJ6_bit+0) 
;CHi_Hub_VGCLD_driver.c,91 :: 		T6963C_init(240, 128, 8);
	MOVLW       240
	MOVWF       FARG_T6963C_init_width+0 
	MOVLW       0
	MOVWF       FARG_T6963C_init_width+1 
	MOVLW       128
	MOVWF       FARG_T6963C_init_height+0 
	MOVLW       8
	MOVWF       FARG_T6963C_init_fntW+0 
	CALL        _T6963C_init+0, 0
;CHi_Hub_VGCLD_driver.c,92 :: 		T6963C_graphics(1);
	BSF         _T6963C_display+0, 3 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;CHi_Hub_VGCLD_driver.c,93 :: 		T6963C_text(1);
	BSF         _T6963C_display+0, 2 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;CHi_Hub_VGCLD_driver.c,94 :: 		T6963C_cursor(0);
	BCF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;CHi_Hub_VGCLD_driver.c,96 :: 		TP_Init(240, 128, 0, 1);                                  // Initialize touch panel
	MOVLW       240
	MOVWF       FARG_TP_Init_display_width+0 
	MOVLW       0
	MOVWF       FARG_TP_Init_display_width+1 
	MOVLW       128
	MOVWF       FARG_TP_Init_display_height+0 
	MOVLW       0
	MOVWF       FARG_TP_Init_display_height+1 
	CLRF        FARG_TP_Init_readX_ChNo+0 
	MOVLW       1
	MOVWF       FARG_TP_Init_readY_ChNo+0 
	CALL        _TP_Init+0, 0
;CHi_Hub_VGCLD_driver.c,97 :: 		TP_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
	MOVLW       244
	MOVWF       FARG_TP_Set_ADC_Threshold_threshold+0 
	MOVLW       1
	MOVWF       FARG_TP_Set_ADC_Threshold_threshold+1 
	CALL        _TP_Set_ADC_Threshold+0, 0
;CHi_Hub_VGCLD_driver.c,99 :: 		PenDown = 0;
	CLRF        _PenDown+0 
;CHi_Hub_VGCLD_driver.c,100 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
	CLRF        _PressedObject+2 
	CLRF        _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,101 :: 		PressedObjectType = -1;
	MOVLW       255
	MOVWF       _PressedObjectType+0 
	MOVLW       255
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,102 :: 		}
L_end_InitializeTouchPanel:
	RETURN      0
; end of CHi_Hub_VGCLD_driver_InitializeTouchPanel

CHi_Hub_VGCLD_driver_InitializeObjects:

;CHi_Hub_VGCLD_driver.c,1178 :: 		static void InitializeObjects() {
;CHi_Hub_VGCLD_driver.c,1179 :: 		ScreenWelcome.Buttons_RoundCount        = 0;
	CLRF        _ScreenWelcome+1 
	CLRF        _ScreenWelcome+2 
;CHi_Hub_VGCLD_driver.c,1180 :: 		ScreenWelcome.CButtons_RoundCount       = 0;
	CLRF        _ScreenWelcome+6 
	CLRF        _ScreenWelcome+7 
;CHi_Hub_VGCLD_driver.c,1181 :: 		ScreenWelcome.LabelsCount               = 0;
	CLRF        _ScreenWelcome+11 
	CLRF        _ScreenWelcome+12 
;CHi_Hub_VGCLD_driver.c,1182 :: 		ScreenWelcome.CLabelsCount              = 1;
	MOVLW       1
	MOVWF       _ScreenWelcome+16 
	MOVLW       0
	MOVWF       _ScreenWelcome+17 
;CHi_Hub_VGCLD_driver.c,1183 :: 		ScreenWelcome.CLabels                   = Screen1_CLabels;
	MOVLW       _Screen1_CLabels+0
	MOVWF       _ScreenWelcome+18 
	MOVLW       hi_addr(_Screen1_CLabels+0)
	MOVWF       _ScreenWelcome+19 
	MOVLW       higher_addr(_Screen1_CLabels+0)
	MOVWF       _ScreenWelcome+20 
;CHi_Hub_VGCLD_driver.c,1184 :: 		ScreenWelcome.ImagesCount               = 1;
	MOVLW       1
	MOVWF       _ScreenWelcome+21 
	MOVLW       0
	MOVWF       _ScreenWelcome+22 
;CHi_Hub_VGCLD_driver.c,1185 :: 		ScreenWelcome.Images                    = Screen1_Images;
	MOVLW       _Screen1_Images+0
	MOVWF       _ScreenWelcome+23 
	MOVLW       hi_addr(_Screen1_Images+0)
	MOVWF       _ScreenWelcome+24 
	MOVLW       higher_addr(_Screen1_Images+0)
	MOVWF       _ScreenWelcome+25 
;CHi_Hub_VGCLD_driver.c,1186 :: 		ScreenWelcome.CImagesCount              = 0;
	CLRF        _ScreenWelcome+26 
	CLRF        _ScreenWelcome+27 
;CHi_Hub_VGCLD_driver.c,1187 :: 		ScreenWelcome.BoxesCount                = 0;
	CLRF        _ScreenWelcome+31 
	CLRF        _ScreenWelcome+32 
;CHi_Hub_VGCLD_driver.c,1188 :: 		ScreenWelcome.ObjectsCount              = 2;
	MOVLW       2
	MOVWF       _ScreenWelcome+0 
;CHi_Hub_VGCLD_driver.c,1190 :: 		ScreenMain.Buttons_RoundCount        = 0;
	CLRF        _ScreenMain+1 
	CLRF        _ScreenMain+2 
;CHi_Hub_VGCLD_driver.c,1191 :: 		ScreenMain.CButtons_RoundCount       = 0;
	CLRF        _ScreenMain+6 
	CLRF        _ScreenMain+7 
;CHi_Hub_VGCLD_driver.c,1192 :: 		ScreenMain.LabelsCount               = 0;
	CLRF        _ScreenMain+11 
	CLRF        _ScreenMain+12 
;CHi_Hub_VGCLD_driver.c,1193 :: 		ScreenMain.CLabelsCount              = 4;
	MOVLW       4
	MOVWF       _ScreenMain+16 
	MOVLW       0
	MOVWF       _ScreenMain+17 
;CHi_Hub_VGCLD_driver.c,1194 :: 		ScreenMain.CLabels                   = Screen2_CLabels;
	MOVLW       _Screen2_CLabels+0
	MOVWF       _ScreenMain+18 
	MOVLW       hi_addr(_Screen2_CLabels+0)
	MOVWF       _ScreenMain+19 
	MOVLW       higher_addr(_Screen2_CLabels+0)
	MOVWF       _ScreenMain+20 
;CHi_Hub_VGCLD_driver.c,1195 :: 		ScreenMain.ImagesCount               = 0;
	CLRF        _ScreenMain+21 
	CLRF        _ScreenMain+22 
;CHi_Hub_VGCLD_driver.c,1196 :: 		ScreenMain.CImagesCount              = 4;
	MOVLW       4
	MOVWF       _ScreenMain+26 
	MOVLW       0
	MOVWF       _ScreenMain+27 
;CHi_Hub_VGCLD_driver.c,1197 :: 		ScreenMain.CImages                   = Screen2_CImages;
	MOVLW       _Screen2_CImages+0
	MOVWF       _ScreenMain+28 
	MOVLW       hi_addr(_Screen2_CImages+0)
	MOVWF       _ScreenMain+29 
	MOVLW       higher_addr(_Screen2_CImages+0)
	MOVWF       _ScreenMain+30 
;CHi_Hub_VGCLD_driver.c,1198 :: 		ScreenMain.BoxesCount                = 0;
	CLRF        _ScreenMain+31 
	CLRF        _ScreenMain+32 
;CHi_Hub_VGCLD_driver.c,1199 :: 		ScreenMain.ObjectsCount              = 8;
	MOVLW       8
	MOVWF       _ScreenMain+0 
;CHi_Hub_VGCLD_driver.c,1201 :: 		ScreenPW.Buttons_RoundCount        = 12;
	MOVLW       12
	MOVWF       _ScreenPW+1 
	MOVLW       0
	MOVWF       _ScreenPW+2 
;CHi_Hub_VGCLD_driver.c,1202 :: 		ScreenPW.Buttons_Round             = Screen3_Buttons_Round;
	MOVLW       _Screen3_Buttons_Round+0
	MOVWF       _ScreenPW+3 
	MOVLW       hi_addr(_Screen3_Buttons_Round+0)
	MOVWF       _ScreenPW+4 
	MOVLW       higher_addr(_Screen3_Buttons_Round+0)
	MOVWF       _ScreenPW+5 
;CHi_Hub_VGCLD_driver.c,1203 :: 		ScreenPW.CButtons_RoundCount       = 0;
	CLRF        _ScreenPW+6 
	CLRF        _ScreenPW+7 
;CHi_Hub_VGCLD_driver.c,1204 :: 		ScreenPW.LabelsCount               = 1;
	MOVLW       1
	MOVWF       _ScreenPW+11 
	MOVLW       0
	MOVWF       _ScreenPW+12 
;CHi_Hub_VGCLD_driver.c,1205 :: 		ScreenPW.Labels                    = Screen3_Labels;
	MOVLW       _Screen3_Labels+0
	MOVWF       _ScreenPW+13 
	MOVLW       hi_addr(_Screen3_Labels+0)
	MOVWF       _ScreenPW+14 
	MOVLW       higher_addr(_Screen3_Labels+0)
	MOVWF       _ScreenPW+15 
;CHi_Hub_VGCLD_driver.c,1206 :: 		ScreenPW.CLabelsCount              = 1;
	MOVLW       1
	MOVWF       _ScreenPW+16 
	MOVLW       0
	MOVWF       _ScreenPW+17 
;CHi_Hub_VGCLD_driver.c,1207 :: 		ScreenPW.CLabels                   = Screen3_CLabels;
	MOVLW       _Screen3_CLabels+0
	MOVWF       _ScreenPW+18 
	MOVLW       hi_addr(_Screen3_CLabels+0)
	MOVWF       _ScreenPW+19 
	MOVLW       higher_addr(_Screen3_CLabels+0)
	MOVWF       _ScreenPW+20 
;CHi_Hub_VGCLD_driver.c,1208 :: 		ScreenPW.ImagesCount               = 0;
	CLRF        _ScreenPW+21 
	CLRF        _ScreenPW+22 
;CHi_Hub_VGCLD_driver.c,1209 :: 		ScreenPW.CImagesCount              = 0;
	CLRF        _ScreenPW+26 
	CLRF        _ScreenPW+27 
;CHi_Hub_VGCLD_driver.c,1210 :: 		ScreenPW.BoxesCount                = 1;
	MOVLW       1
	MOVWF       _ScreenPW+31 
	MOVLW       0
	MOVWF       _ScreenPW+32 
;CHi_Hub_VGCLD_driver.c,1211 :: 		ScreenPW.Boxes                     = Screen3_Boxes;
	MOVLW       _Screen3_Boxes+0
	MOVWF       _ScreenPW+33 
	MOVLW       hi_addr(_Screen3_Boxes+0)
	MOVWF       _ScreenPW+34 
	MOVLW       higher_addr(_Screen3_Boxes+0)
	MOVWF       _ScreenPW+35 
;CHi_Hub_VGCLD_driver.c,1212 :: 		ScreenPW.ObjectsCount              = 15;
	MOVLW       15
	MOVWF       _ScreenPW+0 
;CHi_Hub_VGCLD_driver.c,1214 :: 		ScreenAdmin1.Buttons_RoundCount        = 8;
	MOVLW       8
	MOVWF       _ScreenAdmin1+1 
	MOVLW       0
	MOVWF       _ScreenAdmin1+2 
;CHi_Hub_VGCLD_driver.c,1215 :: 		ScreenAdmin1.Buttons_Round             = Screen4_Buttons_Round;
	MOVLW       _Screen4_Buttons_Round+0
	MOVWF       _ScreenAdmin1+3 
	MOVLW       hi_addr(_Screen4_Buttons_Round+0)
	MOVWF       _ScreenAdmin1+4 
	MOVLW       higher_addr(_Screen4_Buttons_Round+0)
	MOVWF       _ScreenAdmin1+5 
;CHi_Hub_VGCLD_driver.c,1216 :: 		ScreenAdmin1.CButtons_RoundCount       = 0;
	CLRF        _ScreenAdmin1+6 
	CLRF        _ScreenAdmin1+7 
;CHi_Hub_VGCLD_driver.c,1217 :: 		ScreenAdmin1.LabelsCount               = 0;
	CLRF        _ScreenAdmin1+11 
	CLRF        _ScreenAdmin1+12 
;CHi_Hub_VGCLD_driver.c,1218 :: 		ScreenAdmin1.CLabelsCount              = 0;
	CLRF        _ScreenAdmin1+16 
	CLRF        _ScreenAdmin1+17 
;CHi_Hub_VGCLD_driver.c,1219 :: 		ScreenAdmin1.ImagesCount               = 0;
	CLRF        _ScreenAdmin1+21 
	CLRF        _ScreenAdmin1+22 
;CHi_Hub_VGCLD_driver.c,1220 :: 		ScreenAdmin1.CImagesCount              = 0;
	CLRF        _ScreenAdmin1+26 
	CLRF        _ScreenAdmin1+27 
;CHi_Hub_VGCLD_driver.c,1221 :: 		ScreenAdmin1.BoxesCount                = 1;
	MOVLW       1
	MOVWF       _ScreenAdmin1+31 
	MOVLW       0
	MOVWF       _ScreenAdmin1+32 
;CHi_Hub_VGCLD_driver.c,1222 :: 		ScreenAdmin1.Boxes                     = Screen4_Boxes;
	MOVLW       _Screen4_Boxes+0
	MOVWF       _ScreenAdmin1+33 
	MOVLW       hi_addr(_Screen4_Boxes+0)
	MOVWF       _ScreenAdmin1+34 
	MOVLW       higher_addr(_Screen4_Boxes+0)
	MOVWF       _ScreenAdmin1+35 
;CHi_Hub_VGCLD_driver.c,1223 :: 		ScreenAdmin1.ObjectsCount              = 9;
	MOVLW       9
	MOVWF       _ScreenAdmin1+0 
;CHi_Hub_VGCLD_driver.c,1225 :: 		ScreenSetRecline.Buttons_RoundCount        = 2;
	MOVLW       2
	MOVWF       _ScreenSetRecline+1 
	MOVLW       0
	MOVWF       _ScreenSetRecline+2 
;CHi_Hub_VGCLD_driver.c,1226 :: 		ScreenSetRecline.Buttons_Round             = Screen5_Buttons_Round;
	MOVLW       _Screen5_Buttons_Round+0
	MOVWF       _ScreenSetRecline+3 
	MOVLW       hi_addr(_Screen5_Buttons_Round+0)
	MOVWF       _ScreenSetRecline+4 
	MOVLW       higher_addr(_Screen5_Buttons_Round+0)
	MOVWF       _ScreenSetRecline+5 
;CHi_Hub_VGCLD_driver.c,1227 :: 		ScreenSetRecline.CButtons_RoundCount       = 0;
	CLRF        _ScreenSetRecline+6 
	CLRF        _ScreenSetRecline+7 
;CHi_Hub_VGCLD_driver.c,1228 :: 		ScreenSetRecline.LabelsCount               = 0;
	CLRF        _ScreenSetRecline+11 
	CLRF        _ScreenSetRecline+12 
;CHi_Hub_VGCLD_driver.c,1229 :: 		ScreenSetRecline.CLabelsCount              = 7;
	MOVLW       7
	MOVWF       _ScreenSetRecline+16 
	MOVLW       0
	MOVWF       _ScreenSetRecline+17 
;CHi_Hub_VGCLD_driver.c,1230 :: 		ScreenSetRecline.CLabels                   = Screen5_CLabels;
	MOVLW       _Screen5_CLabels+0
	MOVWF       _ScreenSetRecline+18 
	MOVLW       hi_addr(_Screen5_CLabels+0)
	MOVWF       _ScreenSetRecline+19 
	MOVLW       higher_addr(_Screen5_CLabels+0)
	MOVWF       _ScreenSetRecline+20 
;CHi_Hub_VGCLD_driver.c,1231 :: 		ScreenSetRecline.ImagesCount               = 0;
	CLRF        _ScreenSetRecline+21 
	CLRF        _ScreenSetRecline+22 
;CHi_Hub_VGCLD_driver.c,1232 :: 		ScreenSetRecline.CImagesCount              = 0;
	CLRF        _ScreenSetRecline+26 
	CLRF        _ScreenSetRecline+27 
;CHi_Hub_VGCLD_driver.c,1233 :: 		ScreenSetRecline.BoxesCount                = 0;
	CLRF        _ScreenSetRecline+31 
	CLRF        _ScreenSetRecline+32 
;CHi_Hub_VGCLD_driver.c,1234 :: 		ScreenSetRecline.ObjectsCount              = 9;
	MOVLW       9
	MOVWF       _ScreenSetRecline+0 
;CHi_Hub_VGCLD_driver.c,1236 :: 		ScreenChangePW.Buttons_RoundCount        = 12;
	MOVLW       12
	MOVWF       _ScreenChangePW+1 
	MOVLW       0
	MOVWF       _ScreenChangePW+2 
;CHi_Hub_VGCLD_driver.c,1237 :: 		ScreenChangePW.Buttons_Round             = Screen6_Buttons_Round;
	MOVLW       _Screen6_Buttons_Round+0
	MOVWF       _ScreenChangePW+3 
	MOVLW       hi_addr(_Screen6_Buttons_Round+0)
	MOVWF       _ScreenChangePW+4 
	MOVLW       higher_addr(_Screen6_Buttons_Round+0)
	MOVWF       _ScreenChangePW+5 
;CHi_Hub_VGCLD_driver.c,1238 :: 		ScreenChangePW.CButtons_RoundCount       = 0;
	CLRF        _ScreenChangePW+6 
	CLRF        _ScreenChangePW+7 
;CHi_Hub_VGCLD_driver.c,1239 :: 		ScreenChangePW.LabelsCount               = 1;
	MOVLW       1
	MOVWF       _ScreenChangePW+11 
	MOVLW       0
	MOVWF       _ScreenChangePW+12 
;CHi_Hub_VGCLD_driver.c,1240 :: 		ScreenChangePW.Labels                    = Screen6_Labels;
	MOVLW       _Screen6_Labels+0
	MOVWF       _ScreenChangePW+13 
	MOVLW       hi_addr(_Screen6_Labels+0)
	MOVWF       _ScreenChangePW+14 
	MOVLW       higher_addr(_Screen6_Labels+0)
	MOVWF       _ScreenChangePW+15 
;CHi_Hub_VGCLD_driver.c,1241 :: 		ScreenChangePW.CLabelsCount              = 2;
	MOVLW       2
	MOVWF       _ScreenChangePW+16 
	MOVLW       0
	MOVWF       _ScreenChangePW+17 
;CHi_Hub_VGCLD_driver.c,1242 :: 		ScreenChangePW.CLabels                   = Screen6_CLabels;
	MOVLW       _Screen6_CLabels+0
	MOVWF       _ScreenChangePW+18 
	MOVLW       hi_addr(_Screen6_CLabels+0)
	MOVWF       _ScreenChangePW+19 
	MOVLW       higher_addr(_Screen6_CLabels+0)
	MOVWF       _ScreenChangePW+20 
;CHi_Hub_VGCLD_driver.c,1243 :: 		ScreenChangePW.ImagesCount               = 0;
	CLRF        _ScreenChangePW+21 
	CLRF        _ScreenChangePW+22 
;CHi_Hub_VGCLD_driver.c,1244 :: 		ScreenChangePW.CImagesCount              = 0;
	CLRF        _ScreenChangePW+26 
	CLRF        _ScreenChangePW+27 
;CHi_Hub_VGCLD_driver.c,1245 :: 		ScreenChangePW.BoxesCount                = 1;
	MOVLW       1
	MOVWF       _ScreenChangePW+31 
	MOVLW       0
	MOVWF       _ScreenChangePW+32 
;CHi_Hub_VGCLD_driver.c,1246 :: 		ScreenChangePW.Boxes                     = Screen6_Boxes;
	MOVLW       _Screen6_Boxes+0
	MOVWF       _ScreenChangePW+33 
	MOVLW       hi_addr(_Screen6_Boxes+0)
	MOVWF       _ScreenChangePW+34 
	MOVLW       higher_addr(_Screen6_Boxes+0)
	MOVWF       _ScreenChangePW+35 
;CHi_Hub_VGCLD_driver.c,1247 :: 		ScreenChangePW.ObjectsCount              = 16;
	MOVLW       16
	MOVWF       _ScreenChangePW+0 
;CHi_Hub_VGCLD_driver.c,1249 :: 		ScreenTPDimLevel.Buttons_RoundCount        = 0;
	CLRF        _ScreenTPDimLevel+1 
	CLRF        _ScreenTPDimLevel+2 
;CHi_Hub_VGCLD_driver.c,1250 :: 		ScreenTPDimLevel.CButtons_RoundCount       = 5;
	MOVLW       5
	MOVWF       _ScreenTPDimLevel+6 
	MOVLW       0
	MOVWF       _ScreenTPDimLevel+7 
;CHi_Hub_VGCLD_driver.c,1251 :: 		ScreenTPDimLevel.CButtons_Round            = Screen7_CButtons_Round;
	MOVLW       _Screen7_CButtons_Round+0
	MOVWF       _ScreenTPDimLevel+8 
	MOVLW       hi_addr(_Screen7_CButtons_Round+0)
	MOVWF       _ScreenTPDimLevel+9 
	MOVLW       higher_addr(_Screen7_CButtons_Round+0)
	MOVWF       _ScreenTPDimLevel+10 
;CHi_Hub_VGCLD_driver.c,1252 :: 		ScreenTPDimLevel.LabelsCount               = 0;
	CLRF        _ScreenTPDimLevel+11 
	CLRF        _ScreenTPDimLevel+12 
;CHi_Hub_VGCLD_driver.c,1253 :: 		ScreenTPDimLevel.CLabelsCount              = 2;
	MOVLW       2
	MOVWF       _ScreenTPDimLevel+16 
	MOVLW       0
	MOVWF       _ScreenTPDimLevel+17 
;CHi_Hub_VGCLD_driver.c,1254 :: 		ScreenTPDimLevel.CLabels                   = Screen7_CLabels;
	MOVLW       _Screen7_CLabels+0
	MOVWF       _ScreenTPDimLevel+18 
	MOVLW       hi_addr(_Screen7_CLabels+0)
	MOVWF       _ScreenTPDimLevel+19 
	MOVLW       higher_addr(_Screen7_CLabels+0)
	MOVWF       _ScreenTPDimLevel+20 
;CHi_Hub_VGCLD_driver.c,1255 :: 		ScreenTPDimLevel.ImagesCount               = 0;
	CLRF        _ScreenTPDimLevel+21 
	CLRF        _ScreenTPDimLevel+22 
;CHi_Hub_VGCLD_driver.c,1256 :: 		ScreenTPDimLevel.CImagesCount              = 0;
	CLRF        _ScreenTPDimLevel+26 
	CLRF        _ScreenTPDimLevel+27 
;CHi_Hub_VGCLD_driver.c,1257 :: 		ScreenTPDimLevel.BoxesCount                = 0;
	CLRF        _ScreenTPDimLevel+31 
	CLRF        _ScreenTPDimLevel+32 
;CHi_Hub_VGCLD_driver.c,1258 :: 		ScreenTPDimLevel.ObjectsCount              = 7;
	MOVLW       7
	MOVWF       _ScreenTPDimLevel+0 
;CHi_Hub_VGCLD_driver.c,1260 :: 		ScreenChDimLevel.Buttons_RoundCount        = 1;
	MOVLW       1
	MOVWF       _ScreenChDimLevel+1 
	MOVLW       0
	MOVWF       _ScreenChDimLevel+2 
;CHi_Hub_VGCLD_driver.c,1261 :: 		ScreenChDimLevel.Buttons_Round             = Screen8_Buttons_Round;
	MOVLW       _Screen8_Buttons_Round+0
	MOVWF       _ScreenChDimLevel+3 
	MOVLW       hi_addr(_Screen8_Buttons_Round+0)
	MOVWF       _ScreenChDimLevel+4 
	MOVLW       higher_addr(_Screen8_Buttons_Round+0)
	MOVWF       _ScreenChDimLevel+5 
;CHi_Hub_VGCLD_driver.c,1262 :: 		ScreenChDimLevel.CButtons_RoundCount       = 8;
	MOVLW       8
	MOVWF       _ScreenChDimLevel+6 
	MOVLW       0
	MOVWF       _ScreenChDimLevel+7 
;CHi_Hub_VGCLD_driver.c,1263 :: 		ScreenChDimLevel.CButtons_Round            = Screen8_CButtons_Round;
	MOVLW       _Screen8_CButtons_Round+0
	MOVWF       _ScreenChDimLevel+8 
	MOVLW       hi_addr(_Screen8_CButtons_Round+0)
	MOVWF       _ScreenChDimLevel+9 
	MOVLW       higher_addr(_Screen8_CButtons_Round+0)
	MOVWF       _ScreenChDimLevel+10 
;CHi_Hub_VGCLD_driver.c,1264 :: 		ScreenChDimLevel.LabelsCount               = 0;
	CLRF        _ScreenChDimLevel+11 
	CLRF        _ScreenChDimLevel+12 
;CHi_Hub_VGCLD_driver.c,1265 :: 		ScreenChDimLevel.CLabelsCount              = 3;
	MOVLW       3
	MOVWF       _ScreenChDimLevel+16 
	MOVLW       0
	MOVWF       _ScreenChDimLevel+17 
;CHi_Hub_VGCLD_driver.c,1266 :: 		ScreenChDimLevel.CLabels                   = Screen8_CLabels;
	MOVLW       _Screen8_CLabels+0
	MOVWF       _ScreenChDimLevel+18 
	MOVLW       hi_addr(_Screen8_CLabels+0)
	MOVWF       _ScreenChDimLevel+19 
	MOVLW       higher_addr(_Screen8_CLabels+0)
	MOVWF       _ScreenChDimLevel+20 
;CHi_Hub_VGCLD_driver.c,1267 :: 		ScreenChDimLevel.ImagesCount               = 0;
	CLRF        _ScreenChDimLevel+21 
	CLRF        _ScreenChDimLevel+22 
;CHi_Hub_VGCLD_driver.c,1268 :: 		ScreenChDimLevel.CImagesCount              = 0;
	CLRF        _ScreenChDimLevel+26 
	CLRF        _ScreenChDimLevel+27 
;CHi_Hub_VGCLD_driver.c,1269 :: 		ScreenChDimLevel.BoxesCount                = 0;
	CLRF        _ScreenChDimLevel+31 
	CLRF        _ScreenChDimLevel+32 
;CHi_Hub_VGCLD_driver.c,1270 :: 		ScreenChDimLevel.ObjectsCount              = 12;
	MOVLW       12
	MOVWF       _ScreenChDimLevel+0 
;CHi_Hub_VGCLD_driver.c,1272 :: 		ScreenAdmin2.Buttons_RoundCount        = 6;
	MOVLW       6
	MOVWF       _ScreenAdmin2+1 
	MOVLW       0
	MOVWF       _ScreenAdmin2+2 
;CHi_Hub_VGCLD_driver.c,1273 :: 		ScreenAdmin2.Buttons_Round             = Screen9_Buttons_Round;
	MOVLW       _Screen9_Buttons_Round+0
	MOVWF       _ScreenAdmin2+3 
	MOVLW       hi_addr(_Screen9_Buttons_Round+0)
	MOVWF       _ScreenAdmin2+4 
	MOVLW       higher_addr(_Screen9_Buttons_Round+0)
	MOVWF       _ScreenAdmin2+5 
;CHi_Hub_VGCLD_driver.c,1274 :: 		ScreenAdmin2.CButtons_RoundCount       = 0;
	CLRF        _ScreenAdmin2+6 
	CLRF        _ScreenAdmin2+7 
;CHi_Hub_VGCLD_driver.c,1275 :: 		ScreenAdmin2.LabelsCount               = 0;
	CLRF        _ScreenAdmin2+11 
	CLRF        _ScreenAdmin2+12 
;CHi_Hub_VGCLD_driver.c,1276 :: 		ScreenAdmin2.CLabelsCount              = 0;
	CLRF        _ScreenAdmin2+16 
	CLRF        _ScreenAdmin2+17 
;CHi_Hub_VGCLD_driver.c,1277 :: 		ScreenAdmin2.ImagesCount               = 0;
	CLRF        _ScreenAdmin2+21 
	CLRF        _ScreenAdmin2+22 
;CHi_Hub_VGCLD_driver.c,1278 :: 		ScreenAdmin2.CImagesCount              = 0;
	CLRF        _ScreenAdmin2+26 
	CLRF        _ScreenAdmin2+27 
;CHi_Hub_VGCLD_driver.c,1279 :: 		ScreenAdmin2.BoxesCount                = 0;
	CLRF        _ScreenAdmin2+31 
	CLRF        _ScreenAdmin2+32 
;CHi_Hub_VGCLD_driver.c,1280 :: 		ScreenAdmin2.ObjectsCount              = 6;
	MOVLW       6
	MOVWF       _ScreenAdmin2+0 
;CHi_Hub_VGCLD_driver.c,1283 :: 		CHiLogo.OwnerScreen     = &ScreenWelcome;
	MOVLW       _ScreenWelcome+0
	MOVWF       _CHiLogo+0 
	MOVLW       hi_addr(_ScreenWelcome+0)
	MOVWF       _CHiLogo+1 
;CHi_Hub_VGCLD_driver.c,1284 :: 		CHiLogo.Order           = 0;
	CLRF        _CHiLogo+2 
;CHi_Hub_VGCLD_driver.c,1285 :: 		CHiLogo.Left            = 19;
	MOVLW       19
	MOVWF       _CHiLogo+3 
;CHi_Hub_VGCLD_driver.c,1286 :: 		CHiLogo.Top             = 14;
	MOVLW       14
	MOVWF       _CHiLogo+4 
;CHi_Hub_VGCLD_driver.c,1287 :: 		CHiLogo.Width           = 200;
	MOVLW       200
	MOVWF       _CHiLogo+5 
;CHi_Hub_VGCLD_driver.c,1288 :: 		CHiLogo.Height          = 91;
	MOVLW       91
	MOVWF       _CHiLogo+6 
;CHi_Hub_VGCLD_driver.c,1289 :: 		CHiLogo.PictureWidth    = 200;
	MOVLW       200
	MOVWF       _CHiLogo+7 
;CHi_Hub_VGCLD_driver.c,1290 :: 		CHiLogo.PictureHeight   = 91;
	MOVLW       91
	MOVWF       _CHiLogo+8 
;CHi_Hub_VGCLD_driver.c,1291 :: 		CHiLogo.Picture_Name    = Logo200x91_bmp;
	MOVLW       _Logo200x91_bmp+0
	MOVWF       R0 
	MOVLW       hi_addr(_Logo200x91_bmp+0)
	MOVWF       R1 
	MOVLW       higher_addr(_Logo200x91_bmp+0)
	MOVWF       R2 
	MOVF        R0, 0 
	MOVWF       _CHiLogo+9 
	MOVF        R1, 0 
	MOVWF       _CHiLogo+10 
	MOVF        R2, 0 
	MOVWF       _CHiLogo+11 
;CHi_Hub_VGCLD_driver.c,1292 :: 		CHiLogo.Visible         = 1;
	MOVLW       1
	MOVWF       _CHiLogo+12 
;CHi_Hub_VGCLD_driver.c,1293 :: 		CHiLogo.Active          = 1;
	MOVLW       1
	MOVWF       _CHiLogo+13 
;CHi_Hub_VGCLD_driver.c,1294 :: 		CHiLogo.OnUpPtr         = 0;
	CLRF        _CHiLogo+14 
	CLRF        _CHiLogo+15 
	CLRF        _CHiLogo+16 
	CLRF        _CHiLogo+17 
;CHi_Hub_VGCLD_driver.c,1295 :: 		CHiLogo.OnDownPtr       = 0;
	CLRF        _CHiLogo+18 
	CLRF        _CHiLogo+19 
	CLRF        _CHiLogo+20 
	CLRF        _CHiLogo+21 
;CHi_Hub_VGCLD_driver.c,1296 :: 		CHiLogo.OnClickPtr      = CHiLogoOnClick;
	MOVLW       _CHiLogoOnClick+0
	MOVWF       _CHiLogo+22 
	MOVLW       hi_addr(_CHiLogoOnClick+0)
	MOVWF       _CHiLogo+23 
	MOVLW       0
	MOVWF       _CHiLogo+24 
	MOVLW       0
	MOVWF       _CHiLogo+25 
;CHi_Hub_VGCLD_driver.c,1297 :: 		CHiLogo.OnPressPtr      = 0;
	CLRF        _CHiLogo+26 
	CLRF        _CHiLogo+27 
	CLRF        _CHiLogo+28 
	CLRF        _CHiLogo+29 
;CHi_Hub_VGCLD_driver.c,1299 :: 		PwRect.OwnerScreen     = &ScreenPW;
	MOVLW       _ScreenPW+0
	MOVWF       _PwRect+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       _PwRect+1 
;CHi_Hub_VGCLD_driver.c,1300 :: 		PwRect.Order           = 0;
	CLRF        _PwRect+2 
;CHi_Hub_VGCLD_driver.c,1301 :: 		PwRect.Left            = 126;
	MOVLW       126
	MOVWF       _PwRect+3 
;CHi_Hub_VGCLD_driver.c,1302 :: 		PwRect.Top             = 35;
	MOVLW       35
	MOVWF       _PwRect+4 
;CHi_Hub_VGCLD_driver.c,1303 :: 		PwRect.Width           = 58;
	MOVLW       58
	MOVWF       _PwRect+5 
;CHi_Hub_VGCLD_driver.c,1304 :: 		PwRect.Height          = 15;
	MOVLW       15
	MOVWF       _PwRect+6 
;CHi_Hub_VGCLD_driver.c,1305 :: 		PwRect.Visible         = 1;
	MOVLW       1
	MOVWF       _PwRect+7 
;CHi_Hub_VGCLD_driver.c,1306 :: 		PwRect.Active          = 1;
	MOVLW       1
	MOVWF       _PwRect+8 
;CHi_Hub_VGCLD_driver.c,1307 :: 		PwRect.Transparent     = 1;
	MOVLW       1
	MOVWF       _PwRect+9 
;CHi_Hub_VGCLD_driver.c,1308 :: 		PwRect.OnUpPtr         = 0;
	CLRF        _PwRect+10 
	CLRF        _PwRect+11 
	CLRF        _PwRect+12 
	CLRF        _PwRect+13 
;CHi_Hub_VGCLD_driver.c,1309 :: 		PwRect.OnDownPtr       = 0;
	CLRF        _PwRect+14 
	CLRF        _PwRect+15 
	CLRF        _PwRect+16 
	CLRF        _PwRect+17 
;CHi_Hub_VGCLD_driver.c,1310 :: 		PwRect.OnClickPtr      = 0;
	CLRF        _PwRect+18 
	CLRF        _PwRect+19 
	CLRF        _PwRect+20 
	CLRF        _PwRect+21 
;CHi_Hub_VGCLD_driver.c,1311 :: 		PwRect.OnPressPtr      = 0;
	CLRF        _PwRect+22 
	CLRF        _PwRect+23 
	CLRF        _PwRect+24 
	CLRF        _PwRect+25 
;CHi_Hub_VGCLD_driver.c,1313 :: 		bPWEnter.OwnerScreen     = &ScreenPW;
	MOVLW       _ScreenPW+0
	MOVWF       _bPWEnter+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       _bPWEnter+1 
;CHi_Hub_VGCLD_driver.c,1314 :: 		bPWEnter.Order           = 1;
	MOVLW       1
	MOVWF       _bPWEnter+2 
;CHi_Hub_VGCLD_driver.c,1315 :: 		bPWEnter.Left            = 107;
	MOVLW       107
	MOVWF       _bPWEnter+3 
;CHi_Hub_VGCLD_driver.c,1316 :: 		bPWEnter.Top             = 80;
	MOVLW       80
	MOVWF       _bPWEnter+4 
;CHi_Hub_VGCLD_driver.c,1317 :: 		bPWEnter.Width           = 54;
	MOVLW       54
	MOVWF       _bPWEnter+5 
;CHi_Hub_VGCLD_driver.c,1318 :: 		bPWEnter.Height          = 36;
	MOVLW       36
	MOVWF       _bPWEnter+6 
;CHi_Hub_VGCLD_driver.c,1319 :: 		bPWEnter.Visible         = 1;
	MOVLW       1
	MOVWF       _bPWEnter+7 
;CHi_Hub_VGCLD_driver.c,1320 :: 		bPWEnter.Active          = 1;
	MOVLW       1
	MOVWF       _bPWEnter+8 
;CHi_Hub_VGCLD_driver.c,1321 :: 		bPWEnter.Caption         = bPWEnter_Caption;
	MOVLW       _bPWEnter_Caption+0
	MOVWF       _bPWEnter+9 
	MOVLW       hi_addr(_bPWEnter_Caption+0)
	MOVWF       _bPWEnter+10 
;CHi_Hub_VGCLD_driver.c,1322 :: 		bPWEnter.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bPWEnter+11 
;CHi_Hub_VGCLD_driver.c,1323 :: 		bPWEnter.FontName        = Tahoma14x16_Bold;
	MOVLW       _Tahoma14x16_Bold+0
	MOVWF       R6 
	MOVLW       hi_addr(_Tahoma14x16_Bold+0)
	MOVWF       R7 
	MOVLW       higher_addr(_Tahoma14x16_Bold+0)
	MOVWF       R8 
	MOVF        R6, 0 
	MOVWF       _bPWEnter+12 
	MOVF        R7, 0 
	MOVWF       _bPWEnter+13 
	MOVF        R8, 0 
	MOVWF       _bPWEnter+14 
;CHi_Hub_VGCLD_driver.c,1324 :: 		bPWEnter.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bPWEnter+16 
;CHi_Hub_VGCLD_driver.c,1325 :: 		bPWEnter.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bPWEnter+15 
;CHi_Hub_VGCLD_driver.c,1326 :: 		bPWEnter.OnUpPtr         = 0;
	CLRF        _bPWEnter+17 
	CLRF        _bPWEnter+18 
	CLRF        _bPWEnter+19 
	CLRF        _bPWEnter+20 
;CHi_Hub_VGCLD_driver.c,1327 :: 		bPWEnter.OnDownPtr       = 0;
	CLRF        _bPWEnter+21 
	CLRF        _bPWEnter+22 
	CLRF        _bPWEnter+23 
	CLRF        _bPWEnter+24 
;CHi_Hub_VGCLD_driver.c,1328 :: 		bPWEnter.OnClickPtr      = bPWEnterOnClick;
	MOVLW       _bPWEnterOnClick+0
	MOVWF       _bPWEnter+25 
	MOVLW       hi_addr(_bPWEnterOnClick+0)
	MOVWF       _bPWEnter+26 
	MOVLW       0
	MOVWF       _bPWEnter+27 
	MOVLW       0
	MOVWF       _bPWEnter+28 
;CHi_Hub_VGCLD_driver.c,1329 :: 		bPWEnter.OnPressPtr      = 0;
	CLRF        _bPWEnter+29 
	CLRF        _bPWEnter+30 
	CLRF        _bPWEnter+31 
	CLRF        _bPWEnter+32 
;CHi_Hub_VGCLD_driver.c,1331 :: 		bNum1.OwnerScreen     = &ScreenPW;
	MOVLW       _ScreenPW+0
	MOVWF       _bNum1+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       _bNum1+1 
;CHi_Hub_VGCLD_driver.c,1332 :: 		bNum1.Order           = 2;
	MOVLW       2
	MOVWF       _bNum1+2 
;CHi_Hub_VGCLD_driver.c,1333 :: 		bNum1.Left            = 14;
	MOVLW       14
	MOVWF       _bNum1+3 
;CHi_Hub_VGCLD_driver.c,1334 :: 		bNum1.Top             = 6;
	MOVLW       6
	MOVWF       _bNum1+4 
;CHi_Hub_VGCLD_driver.c,1335 :: 		bNum1.Width           = 25;
	MOVLW       25
	MOVWF       _bNum1+5 
;CHi_Hub_VGCLD_driver.c,1336 :: 		bNum1.Height          = 25;
	MOVLW       25
	MOVWF       _bNum1+6 
;CHi_Hub_VGCLD_driver.c,1337 :: 		bNum1.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum1+7 
;CHi_Hub_VGCLD_driver.c,1338 :: 		bNum1.Active          = 1;
	MOVLW       1
	MOVWF       _bNum1+8 
;CHi_Hub_VGCLD_driver.c,1339 :: 		bNum1.Caption         = bNum1_Caption;
	MOVLW       _bNum1_Caption+0
	MOVWF       _bNum1+9 
	MOVLW       hi_addr(_bNum1_Caption+0)
	MOVWF       _bNum1+10 
;CHi_Hub_VGCLD_driver.c,1340 :: 		bNum1.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum1+11 
;CHi_Hub_VGCLD_driver.c,1341 :: 		bNum1.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bNum1+12 
	MOVF        R7, 0 
	MOVWF       _bNum1+13 
	MOVF        R8, 0 
	MOVWF       _bNum1+14 
;CHi_Hub_VGCLD_driver.c,1342 :: 		bNum1.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum1+16 
;CHi_Hub_VGCLD_driver.c,1343 :: 		bNum1.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum1+15 
;CHi_Hub_VGCLD_driver.c,1344 :: 		bNum1.OnUpPtr         = 0;
	CLRF        _bNum1+17 
	CLRF        _bNum1+18 
	CLRF        _bNum1+19 
	CLRF        _bNum1+20 
;CHi_Hub_VGCLD_driver.c,1345 :: 		bNum1.OnDownPtr       = 0;
	CLRF        _bNum1+21 
	CLRF        _bNum1+22 
	CLRF        _bNum1+23 
	CLRF        _bNum1+24 
;CHi_Hub_VGCLD_driver.c,1346 :: 		bNum1.OnClickPtr      = bNum1OnClick;
	MOVLW       _bNum1OnClick+0
	MOVWF       _bNum1+25 
	MOVLW       hi_addr(_bNum1OnClick+0)
	MOVWF       _bNum1+26 
	MOVLW       0
	MOVWF       _bNum1+27 
	MOVLW       0
	MOVWF       _bNum1+28 
;CHi_Hub_VGCLD_driver.c,1347 :: 		bNum1.OnPressPtr      = 0;
	CLRF        _bNum1+29 
	CLRF        _bNum1+30 
	CLRF        _bNum1+31 
	CLRF        _bNum1+32 
;CHi_Hub_VGCLD_driver.c,1349 :: 		bNum4.OwnerScreen     = &ScreenPW;
	MOVLW       _ScreenPW+0
	MOVWF       _bNum4+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       _bNum4+1 
;CHi_Hub_VGCLD_driver.c,1350 :: 		bNum4.Order           = 3;
	MOVLW       3
	MOVWF       _bNum4+2 
;CHi_Hub_VGCLD_driver.c,1351 :: 		bNum4.Left            = 14;
	MOVLW       14
	MOVWF       _bNum4+3 
;CHi_Hub_VGCLD_driver.c,1352 :: 		bNum4.Top             = 35;
	MOVLW       35
	MOVWF       _bNum4+4 
;CHi_Hub_VGCLD_driver.c,1353 :: 		bNum4.Width           = 25;
	MOVLW       25
	MOVWF       _bNum4+5 
;CHi_Hub_VGCLD_driver.c,1354 :: 		bNum4.Height          = 25;
	MOVLW       25
	MOVWF       _bNum4+6 
;CHi_Hub_VGCLD_driver.c,1355 :: 		bNum4.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum4+7 
;CHi_Hub_VGCLD_driver.c,1356 :: 		bNum4.Active          = 1;
	MOVLW       1
	MOVWF       _bNum4+8 
;CHi_Hub_VGCLD_driver.c,1357 :: 		bNum4.Caption         = bNum4_Caption;
	MOVLW       _bNum4_Caption+0
	MOVWF       _bNum4+9 
	MOVLW       hi_addr(_bNum4_Caption+0)
	MOVWF       _bNum4+10 
;CHi_Hub_VGCLD_driver.c,1358 :: 		bNum4.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum4+11 
;CHi_Hub_VGCLD_driver.c,1359 :: 		bNum4.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bNum4+12 
	MOVF        R7, 0 
	MOVWF       _bNum4+13 
	MOVF        R8, 0 
	MOVWF       _bNum4+14 
;CHi_Hub_VGCLD_driver.c,1360 :: 		bNum4.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum4+16 
;CHi_Hub_VGCLD_driver.c,1361 :: 		bNum4.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum4+15 
;CHi_Hub_VGCLD_driver.c,1362 :: 		bNum4.OnUpPtr         = 0;
	CLRF        _bNum4+17 
	CLRF        _bNum4+18 
	CLRF        _bNum4+19 
	CLRF        _bNum4+20 
;CHi_Hub_VGCLD_driver.c,1363 :: 		bNum4.OnDownPtr       = 0;
	CLRF        _bNum4+21 
	CLRF        _bNum4+22 
	CLRF        _bNum4+23 
	CLRF        _bNum4+24 
;CHi_Hub_VGCLD_driver.c,1364 :: 		bNum4.OnClickPtr      = bNum4OnClick;
	MOVLW       _bNum4OnClick+0
	MOVWF       _bNum4+25 
	MOVLW       hi_addr(_bNum4OnClick+0)
	MOVWF       _bNum4+26 
	MOVLW       0
	MOVWF       _bNum4+27 
	MOVLW       0
	MOVWF       _bNum4+28 
;CHi_Hub_VGCLD_driver.c,1365 :: 		bNum4.OnPressPtr      = 0;
	CLRF        _bNum4+29 
	CLRF        _bNum4+30 
	CLRF        _bNum4+31 
	CLRF        _bNum4+32 
;CHi_Hub_VGCLD_driver.c,1367 :: 		bNum7.OwnerScreen     = &ScreenPW;
	MOVLW       _ScreenPW+0
	MOVWF       _bNum7+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       _bNum7+1 
;CHi_Hub_VGCLD_driver.c,1368 :: 		bNum7.Order           = 4;
	MOVLW       4
	MOVWF       _bNum7+2 
;CHi_Hub_VGCLD_driver.c,1369 :: 		bNum7.Left            = 14;
	MOVLW       14
	MOVWF       _bNum7+3 
;CHi_Hub_VGCLD_driver.c,1370 :: 		bNum7.Top             = 64;
	MOVLW       64
	MOVWF       _bNum7+4 
;CHi_Hub_VGCLD_driver.c,1371 :: 		bNum7.Width           = 25;
	MOVLW       25
	MOVWF       _bNum7+5 
;CHi_Hub_VGCLD_driver.c,1372 :: 		bNum7.Height          = 25;
	MOVLW       25
	MOVWF       _bNum7+6 
;CHi_Hub_VGCLD_driver.c,1373 :: 		bNum7.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum7+7 
;CHi_Hub_VGCLD_driver.c,1374 :: 		bNum7.Active          = 1;
	MOVLW       1
	MOVWF       _bNum7+8 
;CHi_Hub_VGCLD_driver.c,1375 :: 		bNum7.Caption         = bNum7_Caption;
	MOVLW       _bNum7_Caption+0
	MOVWF       _bNum7+9 
	MOVLW       hi_addr(_bNum7_Caption+0)
	MOVWF       _bNum7+10 
;CHi_Hub_VGCLD_driver.c,1376 :: 		bNum7.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum7+11 
;CHi_Hub_VGCLD_driver.c,1377 :: 		bNum7.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bNum7+12 
	MOVF        R7, 0 
	MOVWF       _bNum7+13 
	MOVF        R8, 0 
	MOVWF       _bNum7+14 
;CHi_Hub_VGCLD_driver.c,1378 :: 		bNum7.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum7+16 
;CHi_Hub_VGCLD_driver.c,1379 :: 		bNum7.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum7+15 
;CHi_Hub_VGCLD_driver.c,1380 :: 		bNum7.OnUpPtr         = 0;
	CLRF        _bNum7+17 
	CLRF        _bNum7+18 
	CLRF        _bNum7+19 
	CLRF        _bNum7+20 
;CHi_Hub_VGCLD_driver.c,1381 :: 		bNum7.OnDownPtr       = 0;
	CLRF        _bNum7+21 
	CLRF        _bNum7+22 
	CLRF        _bNum7+23 
	CLRF        _bNum7+24 
;CHi_Hub_VGCLD_driver.c,1382 :: 		bNum7.OnClickPtr      = bNum7OnClick;
	MOVLW       _bNum7OnClick+0
	MOVWF       _bNum7+25 
	MOVLW       hi_addr(_bNum7OnClick+0)
	MOVWF       _bNum7+26 
	MOVLW       0
	MOVWF       _bNum7+27 
	MOVLW       0
	MOVWF       _bNum7+28 
;CHi_Hub_VGCLD_driver.c,1383 :: 		bNum7.OnPressPtr      = 0;
	CLRF        _bNum7+29 
	CLRF        _bNum7+30 
	CLRF        _bNum7+31 
	CLRF        _bNum7+32 
;CHi_Hub_VGCLD_driver.c,1385 :: 		bNum2.OwnerScreen     = &ScreenPW;
	MOVLW       _ScreenPW+0
	MOVWF       _bNum2+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       _bNum2+1 
;CHi_Hub_VGCLD_driver.c,1386 :: 		bNum2.Order           = 5;
	MOVLW       5
	MOVWF       _bNum2+2 
;CHi_Hub_VGCLD_driver.c,1387 :: 		bNum2.Left            = 43;
	MOVLW       43
	MOVWF       _bNum2+3 
;CHi_Hub_VGCLD_driver.c,1388 :: 		bNum2.Top             = 6;
	MOVLW       6
	MOVWF       _bNum2+4 
;CHi_Hub_VGCLD_driver.c,1389 :: 		bNum2.Width           = 25;
	MOVLW       25
	MOVWF       _bNum2+5 
;CHi_Hub_VGCLD_driver.c,1390 :: 		bNum2.Height          = 25;
	MOVLW       25
	MOVWF       _bNum2+6 
;CHi_Hub_VGCLD_driver.c,1391 :: 		bNum2.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum2+7 
;CHi_Hub_VGCLD_driver.c,1392 :: 		bNum2.Active          = 1;
	MOVLW       1
	MOVWF       _bNum2+8 
;CHi_Hub_VGCLD_driver.c,1393 :: 		bNum2.Caption         = bNum2_Caption;
	MOVLW       _bNum2_Caption+0
	MOVWF       _bNum2+9 
	MOVLW       hi_addr(_bNum2_Caption+0)
	MOVWF       _bNum2+10 
;CHi_Hub_VGCLD_driver.c,1394 :: 		bNum2.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum2+11 
;CHi_Hub_VGCLD_driver.c,1395 :: 		bNum2.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bNum2+12 
	MOVF        R7, 0 
	MOVWF       _bNum2+13 
	MOVF        R8, 0 
	MOVWF       _bNum2+14 
;CHi_Hub_VGCLD_driver.c,1396 :: 		bNum2.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum2+16 
;CHi_Hub_VGCLD_driver.c,1397 :: 		bNum2.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum2+15 
;CHi_Hub_VGCLD_driver.c,1398 :: 		bNum2.OnUpPtr         = 0;
	CLRF        _bNum2+17 
	CLRF        _bNum2+18 
	CLRF        _bNum2+19 
	CLRF        _bNum2+20 
;CHi_Hub_VGCLD_driver.c,1399 :: 		bNum2.OnDownPtr       = 0;
	CLRF        _bNum2+21 
	CLRF        _bNum2+22 
	CLRF        _bNum2+23 
	CLRF        _bNum2+24 
;CHi_Hub_VGCLD_driver.c,1400 :: 		bNum2.OnClickPtr      = bNum2OnClick;
	MOVLW       _bNum2OnClick+0
	MOVWF       _bNum2+25 
	MOVLW       hi_addr(_bNum2OnClick+0)
	MOVWF       _bNum2+26 
	MOVLW       0
	MOVWF       _bNum2+27 
	MOVLW       0
	MOVWF       _bNum2+28 
;CHi_Hub_VGCLD_driver.c,1401 :: 		bNum2.OnPressPtr      = 0;
	CLRF        _bNum2+29 
	CLRF        _bNum2+30 
	CLRF        _bNum2+31 
	CLRF        _bNum2+32 
;CHi_Hub_VGCLD_driver.c,1403 :: 		bNum5.OwnerScreen     = &ScreenPW;
	MOVLW       _ScreenPW+0
	MOVWF       _bNum5+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       _bNum5+1 
;CHi_Hub_VGCLD_driver.c,1404 :: 		bNum5.Order           = 6;
	MOVLW       6
	MOVWF       _bNum5+2 
;CHi_Hub_VGCLD_driver.c,1405 :: 		bNum5.Left            = 43;
	MOVLW       43
	MOVWF       _bNum5+3 
;CHi_Hub_VGCLD_driver.c,1406 :: 		bNum5.Top             = 35;
	MOVLW       35
	MOVWF       _bNum5+4 
;CHi_Hub_VGCLD_driver.c,1407 :: 		bNum5.Width           = 25;
	MOVLW       25
	MOVWF       _bNum5+5 
;CHi_Hub_VGCLD_driver.c,1408 :: 		bNum5.Height          = 25;
	MOVLW       25
	MOVWF       _bNum5+6 
;CHi_Hub_VGCLD_driver.c,1409 :: 		bNum5.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum5+7 
;CHi_Hub_VGCLD_driver.c,1410 :: 		bNum5.Active          = 1;
	MOVLW       1
	MOVWF       _bNum5+8 
;CHi_Hub_VGCLD_driver.c,1411 :: 		bNum5.Caption         = bNum5_Caption;
	MOVLW       _bNum5_Caption+0
	MOVWF       _bNum5+9 
	MOVLW       hi_addr(_bNum5_Caption+0)
	MOVWF       _bNum5+10 
;CHi_Hub_VGCLD_driver.c,1412 :: 		bNum5.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum5+11 
;CHi_Hub_VGCLD_driver.c,1413 :: 		bNum5.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bNum5+12 
	MOVF        R7, 0 
	MOVWF       _bNum5+13 
	MOVF        R8, 0 
	MOVWF       _bNum5+14 
;CHi_Hub_VGCLD_driver.c,1414 :: 		bNum5.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum5+16 
;CHi_Hub_VGCLD_driver.c,1415 :: 		bNum5.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum5+15 
;CHi_Hub_VGCLD_driver.c,1416 :: 		bNum5.OnUpPtr         = 0;
	CLRF        _bNum5+17 
	CLRF        _bNum5+18 
	CLRF        _bNum5+19 
	CLRF        _bNum5+20 
;CHi_Hub_VGCLD_driver.c,1417 :: 		bNum5.OnDownPtr       = 0;
	CLRF        _bNum5+21 
	CLRF        _bNum5+22 
	CLRF        _bNum5+23 
	CLRF        _bNum5+24 
;CHi_Hub_VGCLD_driver.c,1418 :: 		bNum5.OnClickPtr      = bNum5OnClick;
	MOVLW       _bNum5OnClick+0
	MOVWF       _bNum5+25 
	MOVLW       hi_addr(_bNum5OnClick+0)
	MOVWF       _bNum5+26 
	MOVLW       0
	MOVWF       _bNum5+27 
	MOVLW       0
	MOVWF       _bNum5+28 
;CHi_Hub_VGCLD_driver.c,1419 :: 		bNum5.OnPressPtr      = 0;
	CLRF        _bNum5+29 
	CLRF        _bNum5+30 
	CLRF        _bNum5+31 
	CLRF        _bNum5+32 
;CHi_Hub_VGCLD_driver.c,1421 :: 		bNum8.OwnerScreen     = &ScreenPW;
	MOVLW       _ScreenPW+0
	MOVWF       _bNum8+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       _bNum8+1 
;CHi_Hub_VGCLD_driver.c,1422 :: 		bNum8.Order           = 7;
	MOVLW       7
	MOVWF       _bNum8+2 
;CHi_Hub_VGCLD_driver.c,1423 :: 		bNum8.Left            = 43;
	MOVLW       43
	MOVWF       _bNum8+3 
;CHi_Hub_VGCLD_driver.c,1424 :: 		bNum8.Top             = 64;
	MOVLW       64
	MOVWF       _bNum8+4 
;CHi_Hub_VGCLD_driver.c,1425 :: 		bNum8.Width           = 25;
	MOVLW       25
	MOVWF       _bNum8+5 
;CHi_Hub_VGCLD_driver.c,1426 :: 		bNum8.Height          = 25;
	MOVLW       25
	MOVWF       _bNum8+6 
;CHi_Hub_VGCLD_driver.c,1427 :: 		bNum8.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum8+7 
;CHi_Hub_VGCLD_driver.c,1428 :: 		bNum8.Active          = 1;
	MOVLW       1
	MOVWF       _bNum8+8 
;CHi_Hub_VGCLD_driver.c,1429 :: 		bNum8.Caption         = bNum8_Caption;
	MOVLW       _bNum8_Caption+0
	MOVWF       _bNum8+9 
	MOVLW       hi_addr(_bNum8_Caption+0)
	MOVWF       _bNum8+10 
;CHi_Hub_VGCLD_driver.c,1430 :: 		bNum8.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum8+11 
;CHi_Hub_VGCLD_driver.c,1431 :: 		bNum8.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bNum8+12 
	MOVF        R7, 0 
	MOVWF       _bNum8+13 
	MOVF        R8, 0 
	MOVWF       _bNum8+14 
;CHi_Hub_VGCLD_driver.c,1432 :: 		bNum8.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum8+16 
;CHi_Hub_VGCLD_driver.c,1433 :: 		bNum8.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum8+15 
;CHi_Hub_VGCLD_driver.c,1434 :: 		bNum8.OnUpPtr         = 0;
	CLRF        _bNum8+17 
	CLRF        _bNum8+18 
	CLRF        _bNum8+19 
	CLRF        _bNum8+20 
;CHi_Hub_VGCLD_driver.c,1435 :: 		bNum8.OnDownPtr       = 0;
	CLRF        _bNum8+21 
	CLRF        _bNum8+22 
	CLRF        _bNum8+23 
	CLRF        _bNum8+24 
;CHi_Hub_VGCLD_driver.c,1436 :: 		bNum8.OnClickPtr      = bNum8OnClick;
	MOVLW       _bNum8OnClick+0
	MOVWF       _bNum8+25 
	MOVLW       hi_addr(_bNum8OnClick+0)
	MOVWF       _bNum8+26 
	MOVLW       0
	MOVWF       _bNum8+27 
	MOVLW       0
	MOVWF       _bNum8+28 
;CHi_Hub_VGCLD_driver.c,1437 :: 		bNum8.OnPressPtr      = 0;
	CLRF        _bNum8+29 
	CLRF        _bNum8+30 
	CLRF        _bNum8+31 
	CLRF        _bNum8+32 
;CHi_Hub_VGCLD_driver.c,1439 :: 		bNum0.OwnerScreen     = &ScreenPW;
	MOVLW       _ScreenPW+0
	MOVWF       _bNum0+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       _bNum0+1 
;CHi_Hub_VGCLD_driver.c,1440 :: 		bNum0.Order           = 8;
	MOVLW       8
	MOVWF       _bNum0+2 
;CHi_Hub_VGCLD_driver.c,1441 :: 		bNum0.Left            = 43;
	MOVLW       43
	MOVWF       _bNum0+3 
;CHi_Hub_VGCLD_driver.c,1442 :: 		bNum0.Top             = 93;
	MOVLW       93
	MOVWF       _bNum0+4 
;CHi_Hub_VGCLD_driver.c,1443 :: 		bNum0.Width           = 25;
	MOVLW       25
	MOVWF       _bNum0+5 
;CHi_Hub_VGCLD_driver.c,1444 :: 		bNum0.Height          = 25;
	MOVLW       25
	MOVWF       _bNum0+6 
;CHi_Hub_VGCLD_driver.c,1445 :: 		bNum0.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum0+7 
;CHi_Hub_VGCLD_driver.c,1446 :: 		bNum0.Active          = 1;
	MOVLW       1
	MOVWF       _bNum0+8 
;CHi_Hub_VGCLD_driver.c,1447 :: 		bNum0.Caption         = bNum0_Caption;
	MOVLW       _bNum0_Caption+0
	MOVWF       _bNum0+9 
	MOVLW       hi_addr(_bNum0_Caption+0)
	MOVWF       _bNum0+10 
;CHi_Hub_VGCLD_driver.c,1448 :: 		bNum0.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum0+11 
;CHi_Hub_VGCLD_driver.c,1449 :: 		bNum0.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bNum0+12 
	MOVF        R7, 0 
	MOVWF       _bNum0+13 
	MOVF        R8, 0 
	MOVWF       _bNum0+14 
;CHi_Hub_VGCLD_driver.c,1450 :: 		bNum0.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum0+16 
;CHi_Hub_VGCLD_driver.c,1451 :: 		bNum0.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum0+15 
;CHi_Hub_VGCLD_driver.c,1452 :: 		bNum0.OnUpPtr         = 0;
	CLRF        _bNum0+17 
	CLRF        _bNum0+18 
	CLRF        _bNum0+19 
	CLRF        _bNum0+20 
;CHi_Hub_VGCLD_driver.c,1453 :: 		bNum0.OnDownPtr       = 0;
	CLRF        _bNum0+21 
	CLRF        _bNum0+22 
	CLRF        _bNum0+23 
	CLRF        _bNum0+24 
;CHi_Hub_VGCLD_driver.c,1454 :: 		bNum0.OnClickPtr      = bNum0OnClick;
	MOVLW       _bNum0OnClick+0
	MOVWF       _bNum0+25 
	MOVLW       hi_addr(_bNum0OnClick+0)
	MOVWF       _bNum0+26 
	MOVLW       0
	MOVWF       _bNum0+27 
	MOVLW       0
	MOVWF       _bNum0+28 
;CHi_Hub_VGCLD_driver.c,1455 :: 		bNum0.OnPressPtr      = 0;
	CLRF        _bNum0+29 
	CLRF        _bNum0+30 
	CLRF        _bNum0+31 
	CLRF        _bNum0+32 
;CHi_Hub_VGCLD_driver.c,1457 :: 		bNum3.OwnerScreen     = &ScreenPW;
	MOVLW       _ScreenPW+0
	MOVWF       _bNum3+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       _bNum3+1 
;CHi_Hub_VGCLD_driver.c,1458 :: 		bNum3.Order           = 9;
	MOVLW       9
	MOVWF       _bNum3+2 
;CHi_Hub_VGCLD_driver.c,1459 :: 		bNum3.Left            = 72;
	MOVLW       72
	MOVWF       _bNum3+3 
;CHi_Hub_VGCLD_driver.c,1460 :: 		bNum3.Top             = 6;
	MOVLW       6
	MOVWF       _bNum3+4 
;CHi_Hub_VGCLD_driver.c,1461 :: 		bNum3.Width           = 25;
	MOVLW       25
	MOVWF       _bNum3+5 
;CHi_Hub_VGCLD_driver.c,1462 :: 		bNum3.Height          = 25;
	MOVLW       25
	MOVWF       _bNum3+6 
;CHi_Hub_VGCLD_driver.c,1463 :: 		bNum3.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum3+7 
;CHi_Hub_VGCLD_driver.c,1464 :: 		bNum3.Active          = 1;
	MOVLW       1
	MOVWF       _bNum3+8 
;CHi_Hub_VGCLD_driver.c,1465 :: 		bNum3.Caption         = bNum3_Caption;
	MOVLW       _bNum3_Caption+0
	MOVWF       _bNum3+9 
	MOVLW       hi_addr(_bNum3_Caption+0)
	MOVWF       _bNum3+10 
;CHi_Hub_VGCLD_driver.c,1466 :: 		bNum3.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum3+11 
;CHi_Hub_VGCLD_driver.c,1467 :: 		bNum3.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bNum3+12 
	MOVF        R7, 0 
	MOVWF       _bNum3+13 
	MOVF        R8, 0 
	MOVWF       _bNum3+14 
;CHi_Hub_VGCLD_driver.c,1468 :: 		bNum3.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum3+16 
;CHi_Hub_VGCLD_driver.c,1469 :: 		bNum3.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum3+15 
;CHi_Hub_VGCLD_driver.c,1470 :: 		bNum3.OnUpPtr         = 0;
	CLRF        _bNum3+17 
	CLRF        _bNum3+18 
	CLRF        _bNum3+19 
	CLRF        _bNum3+20 
;CHi_Hub_VGCLD_driver.c,1471 :: 		bNum3.OnDownPtr       = 0;
	CLRF        _bNum3+21 
	CLRF        _bNum3+22 
	CLRF        _bNum3+23 
	CLRF        _bNum3+24 
;CHi_Hub_VGCLD_driver.c,1472 :: 		bNum3.OnClickPtr      = bNum3OnClick;
	MOVLW       _bNum3OnClick+0
	MOVWF       _bNum3+25 
	MOVLW       hi_addr(_bNum3OnClick+0)
	MOVWF       _bNum3+26 
	MOVLW       0
	MOVWF       _bNum3+27 
	MOVLW       0
	MOVWF       _bNum3+28 
;CHi_Hub_VGCLD_driver.c,1473 :: 		bNum3.OnPressPtr      = 0;
	CLRF        _bNum3+29 
	CLRF        _bNum3+30 
	CLRF        _bNum3+31 
	CLRF        _bNum3+32 
;CHi_Hub_VGCLD_driver.c,1475 :: 		bNum6.OwnerScreen     = &ScreenPW;
	MOVLW       _ScreenPW+0
	MOVWF       _bNum6+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       _bNum6+1 
;CHi_Hub_VGCLD_driver.c,1476 :: 		bNum6.Order           = 10;
	MOVLW       10
	MOVWF       _bNum6+2 
;CHi_Hub_VGCLD_driver.c,1477 :: 		bNum6.Left            = 72;
	MOVLW       72
	MOVWF       _bNum6+3 
;CHi_Hub_VGCLD_driver.c,1478 :: 		bNum6.Top             = 35;
	MOVLW       35
	MOVWF       _bNum6+4 
;CHi_Hub_VGCLD_driver.c,1479 :: 		bNum6.Width           = 25;
	MOVLW       25
	MOVWF       _bNum6+5 
;CHi_Hub_VGCLD_driver.c,1480 :: 		bNum6.Height          = 25;
	MOVLW       25
	MOVWF       _bNum6+6 
;CHi_Hub_VGCLD_driver.c,1481 :: 		bNum6.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum6+7 
;CHi_Hub_VGCLD_driver.c,1482 :: 		bNum6.Active          = 1;
	MOVLW       1
	MOVWF       _bNum6+8 
;CHi_Hub_VGCLD_driver.c,1483 :: 		bNum6.Caption         = bNum6_Caption;
	MOVLW       _bNum6_Caption+0
	MOVWF       _bNum6+9 
	MOVLW       hi_addr(_bNum6_Caption+0)
	MOVWF       _bNum6+10 
;CHi_Hub_VGCLD_driver.c,1484 :: 		bNum6.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum6+11 
;CHi_Hub_VGCLD_driver.c,1485 :: 		bNum6.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bNum6+12 
	MOVF        R7, 0 
	MOVWF       _bNum6+13 
	MOVF        R8, 0 
	MOVWF       _bNum6+14 
;CHi_Hub_VGCLD_driver.c,1486 :: 		bNum6.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum6+16 
;CHi_Hub_VGCLD_driver.c,1487 :: 		bNum6.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum6+15 
;CHi_Hub_VGCLD_driver.c,1488 :: 		bNum6.OnUpPtr         = 0;
	CLRF        _bNum6+17 
	CLRF        _bNum6+18 
	CLRF        _bNum6+19 
	CLRF        _bNum6+20 
;CHi_Hub_VGCLD_driver.c,1489 :: 		bNum6.OnDownPtr       = 0;
	CLRF        _bNum6+21 
	CLRF        _bNum6+22 
	CLRF        _bNum6+23 
	CLRF        _bNum6+24 
;CHi_Hub_VGCLD_driver.c,1490 :: 		bNum6.OnClickPtr      = bNum6OnClick;
	MOVLW       _bNum6OnClick+0
	MOVWF       _bNum6+25 
	MOVLW       hi_addr(_bNum6OnClick+0)
	MOVWF       _bNum6+26 
	MOVLW       0
	MOVWF       _bNum6+27 
	MOVLW       0
	MOVWF       _bNum6+28 
;CHi_Hub_VGCLD_driver.c,1491 :: 		bNum6.OnPressPtr      = 0;
	CLRF        _bNum6+29 
	CLRF        _bNum6+30 
	CLRF        _bNum6+31 
	CLRF        _bNum6+32 
;CHi_Hub_VGCLD_driver.c,1493 :: 		bNum9.OwnerScreen     = &ScreenPW;
	MOVLW       _ScreenPW+0
	MOVWF       _bNum9+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       _bNum9+1 
;CHi_Hub_VGCLD_driver.c,1494 :: 		bNum9.Order           = 11;
	MOVLW       11
	MOVWF       _bNum9+2 
;CHi_Hub_VGCLD_driver.c,1495 :: 		bNum9.Left            = 71;
	MOVLW       71
	MOVWF       _bNum9+3 
;CHi_Hub_VGCLD_driver.c,1496 :: 		bNum9.Top             = 64;
	MOVLW       64
	MOVWF       _bNum9+4 
;CHi_Hub_VGCLD_driver.c,1497 :: 		bNum9.Width           = 25;
	MOVLW       25
	MOVWF       _bNum9+5 
;CHi_Hub_VGCLD_driver.c,1498 :: 		bNum9.Height          = 25;
	MOVLW       25
	MOVWF       _bNum9+6 
;CHi_Hub_VGCLD_driver.c,1499 :: 		bNum9.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum9+7 
;CHi_Hub_VGCLD_driver.c,1500 :: 		bNum9.Active          = 1;
	MOVLW       1
	MOVWF       _bNum9+8 
;CHi_Hub_VGCLD_driver.c,1501 :: 		bNum9.Caption         = bNum9_Caption;
	MOVLW       _bNum9_Caption+0
	MOVWF       _bNum9+9 
	MOVLW       hi_addr(_bNum9_Caption+0)
	MOVWF       _bNum9+10 
;CHi_Hub_VGCLD_driver.c,1502 :: 		bNum9.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum9+11 
;CHi_Hub_VGCLD_driver.c,1503 :: 		bNum9.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bNum9+12 
	MOVF        R7, 0 
	MOVWF       _bNum9+13 
	MOVF        R8, 0 
	MOVWF       _bNum9+14 
;CHi_Hub_VGCLD_driver.c,1504 :: 		bNum9.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum9+16 
;CHi_Hub_VGCLD_driver.c,1505 :: 		bNum9.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum9+15 
;CHi_Hub_VGCLD_driver.c,1506 :: 		bNum9.OnUpPtr         = 0;
	CLRF        _bNum9+17 
	CLRF        _bNum9+18 
	CLRF        _bNum9+19 
	CLRF        _bNum9+20 
;CHi_Hub_VGCLD_driver.c,1507 :: 		bNum9.OnDownPtr       = 0;
	CLRF        _bNum9+21 
	CLRF        _bNum9+22 
	CLRF        _bNum9+23 
	CLRF        _bNum9+24 
;CHi_Hub_VGCLD_driver.c,1508 :: 		bNum9.OnClickPtr      = bNum9OnClick;
	MOVLW       _bNum9OnClick+0
	MOVWF       _bNum9+25 
	MOVLW       hi_addr(_bNum9OnClick+0)
	MOVWF       _bNum9+26 
	MOVLW       0
	MOVWF       _bNum9+27 
	MOVLW       0
	MOVWF       _bNum9+28 
;CHi_Hub_VGCLD_driver.c,1509 :: 		bNum9.OnPressPtr      = 0;
	CLRF        _bNum9+29 
	CLRF        _bNum9+30 
	CLRF        _bNum9+31 
	CLRF        _bNum9+32 
;CHi_Hub_VGCLD_driver.c,1511 :: 		bPWCancel.OwnerScreen     = &ScreenPW;
	MOVLW       _ScreenPW+0
	MOVWF       _bPWCancel+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       _bPWCancel+1 
;CHi_Hub_VGCLD_driver.c,1512 :: 		bPWCancel.Order           = 12;
	MOVLW       12
	MOVWF       _bPWCancel+2 
;CHi_Hub_VGCLD_driver.c,1513 :: 		bPWCancel.Left            = 172;
	MOVLW       172
	MOVWF       _bPWCancel+3 
;CHi_Hub_VGCLD_driver.c,1514 :: 		bPWCancel.Top             = 80;
	MOVLW       80
	MOVWF       _bPWCancel+4 
;CHi_Hub_VGCLD_driver.c,1515 :: 		bPWCancel.Width           = 62;
	MOVLW       62
	MOVWF       _bPWCancel+5 
;CHi_Hub_VGCLD_driver.c,1516 :: 		bPWCancel.Height          = 36;
	MOVLW       36
	MOVWF       _bPWCancel+6 
;CHi_Hub_VGCLD_driver.c,1517 :: 		bPWCancel.Visible         = 1;
	MOVLW       1
	MOVWF       _bPWCancel+7 
;CHi_Hub_VGCLD_driver.c,1518 :: 		bPWCancel.Active          = 1;
	MOVLW       1
	MOVWF       _bPWCancel+8 
;CHi_Hub_VGCLD_driver.c,1519 :: 		bPWCancel.Caption         = bPWCancel_Caption;
	MOVLW       _bPWCancel_Caption+0
	MOVWF       _bPWCancel+9 
	MOVLW       hi_addr(_bPWCancel_Caption+0)
	MOVWF       _bPWCancel+10 
;CHi_Hub_VGCLD_driver.c,1520 :: 		bPWCancel.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bPWCancel+11 
;CHi_Hub_VGCLD_driver.c,1521 :: 		bPWCancel.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bPWCancel+12 
	MOVF        R7, 0 
	MOVWF       _bPWCancel+13 
	MOVF        R8, 0 
	MOVWF       _bPWCancel+14 
;CHi_Hub_VGCLD_driver.c,1522 :: 		bPWCancel.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bPWCancel+16 
;CHi_Hub_VGCLD_driver.c,1523 :: 		bPWCancel.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bPWCancel+15 
;CHi_Hub_VGCLD_driver.c,1524 :: 		bPWCancel.OnUpPtr         = 0;
	CLRF        _bPWCancel+17 
	CLRF        _bPWCancel+18 
	CLRF        _bPWCancel+19 
	CLRF        _bPWCancel+20 
;CHi_Hub_VGCLD_driver.c,1525 :: 		bPWCancel.OnDownPtr       = 0;
	CLRF        _bPWCancel+21 
	CLRF        _bPWCancel+22 
	CLRF        _bPWCancel+23 
	CLRF        _bPWCancel+24 
;CHi_Hub_VGCLD_driver.c,1526 :: 		bPWCancel.OnClickPtr      = bPWCancelOnClick;
	MOVLW       _bPWCancelOnClick+0
	MOVWF       _bPWCancel+25 
	MOVLW       hi_addr(_bPWCancelOnClick+0)
	MOVWF       _bPWCancel+26 
	MOVLW       0
	MOVWF       _bPWCancel+27 
	MOVLW       0
	MOVWF       _bPWCancel+28 
;CHi_Hub_VGCLD_driver.c,1527 :: 		bPWCancel.OnPressPtr      = 0;
	CLRF        _bPWCancel+29 
	CLRF        _bPWCancel+30 
	CLRF        _bPWCancel+31 
	CLRF        _bPWCancel+32 
;CHi_Hub_VGCLD_driver.c,1529 :: 		lPWLabel.OwnerScreen     = &ScreenPW;
	MOVLW       _ScreenPW+0
	MOVWF       _lPWLabel+0 
	MOVLW       hi_addr(_ScreenPW+0)
	MOVWF       _lPWLabel+1 
;CHi_Hub_VGCLD_driver.c,1530 :: 		lPWLabel.Order           = 14;
	MOVLW       14
	MOVWF       _lPWLabel+2 
;CHi_Hub_VGCLD_driver.c,1531 :: 		lPWLabel.Left            = 130;
	MOVLW       130
	MOVWF       _lPWLabel+3 
;CHi_Hub_VGCLD_driver.c,1532 :: 		lPWLabel.Top             = 34;
	MOVLW       34
	MOVWF       _lPWLabel+4 
;CHi_Hub_VGCLD_driver.c,1533 :: 		lPWLabel.Width           = 0;
	CLRF        _lPWLabel+5 
;CHi_Hub_VGCLD_driver.c,1534 :: 		lPWLabel.Height          = 17;
	MOVLW       17
	MOVWF       _lPWLabel+6 
;CHi_Hub_VGCLD_driver.c,1535 :: 		lPWLabel.Visible         = 1;
	MOVLW       1
	MOVWF       _lPWLabel+13 
;CHi_Hub_VGCLD_driver.c,1536 :: 		lPWLabel.Active          = 1;
	MOVLW       1
	MOVWF       _lPWLabel+14 
;CHi_Hub_VGCLD_driver.c,1537 :: 		lPWLabel.Caption         = lPWLabel_Caption;
	MOVLW       _lPWLabel_Caption+0
	MOVWF       _lPWLabel+7 
	MOVLW       hi_addr(_lPWLabel_Caption+0)
	MOVWF       _lPWLabel+8 
;CHi_Hub_VGCLD_driver.c,1538 :: 		lPWLabel.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _lPWLabel+9 
	MOVF        R7, 0 
	MOVWF       _lPWLabel+10 
	MOVF        R8, 0 
	MOVWF       _lPWLabel+11 
;CHi_Hub_VGCLD_driver.c,1539 :: 		lPWLabel.Font_Color      = T6963C_WHITE;
	MOVLW       8
	MOVWF       _lPWLabel+12 
;CHi_Hub_VGCLD_driver.c,1540 :: 		lPWLabel.OnUpPtr         = 0;
	CLRF        _lPWLabel+15 
	CLRF        _lPWLabel+16 
	CLRF        _lPWLabel+17 
	CLRF        _lPWLabel+18 
;CHi_Hub_VGCLD_driver.c,1541 :: 		lPWLabel.OnDownPtr       = 0;
	CLRF        _lPWLabel+19 
	CLRF        _lPWLabel+20 
	CLRF        _lPWLabel+21 
	CLRF        _lPWLabel+22 
;CHi_Hub_VGCLD_driver.c,1542 :: 		lPWLabel.OnClickPtr      = 0;
	CLRF        _lPWLabel+23 
	CLRF        _lPWLabel+24 
	CLRF        _lPWLabel+25 
	CLRF        _lPWLabel+26 
;CHi_Hub_VGCLD_driver.c,1543 :: 		lPWLabel.OnPressPtr      = 0;
	CLRF        _lPWLabel+27 
	CLRF        _lPWLabel+28 
	CLRF        _lPWLabel+29 
	CLRF        _lPWLabel+30 
;CHi_Hub_VGCLD_driver.c,1545 :: 		Box1.OwnerScreen     = &ScreenAdmin1;
	MOVLW       _ScreenAdmin1+0
	MOVWF       _Box1+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       _Box1+1 
;CHi_Hub_VGCLD_driver.c,1546 :: 		Box1.Order           = 0;
	CLRF        _Box1+2 
;CHi_Hub_VGCLD_driver.c,1547 :: 		Box1.Left            = 115;
	MOVLW       115
	MOVWF       _Box1+3 
;CHi_Hub_VGCLD_driver.c,1548 :: 		Box1.Top             = 3;
	MOVLW       3
	MOVWF       _Box1+4 
;CHi_Hub_VGCLD_driver.c,1549 :: 		Box1.Width           = 101;
	MOVLW       101
	MOVWF       _Box1+5 
;CHi_Hub_VGCLD_driver.c,1550 :: 		Box1.Height          = 73;
	MOVLW       73
	MOVWF       _Box1+6 
;CHi_Hub_VGCLD_driver.c,1551 :: 		Box1.Visible         = 1;
	MOVLW       1
	MOVWF       _Box1+7 
;CHi_Hub_VGCLD_driver.c,1552 :: 		Box1.Active          = 1;
	MOVLW       1
	MOVWF       _Box1+8 
;CHi_Hub_VGCLD_driver.c,1553 :: 		Box1.Transparent     = 1;
	MOVLW       1
	MOVWF       _Box1+9 
;CHi_Hub_VGCLD_driver.c,1554 :: 		Box1.OnUpPtr         = 0;
	CLRF        _Box1+10 
	CLRF        _Box1+11 
	CLRF        _Box1+12 
	CLRF        _Box1+13 
;CHi_Hub_VGCLD_driver.c,1555 :: 		Box1.OnDownPtr       = 0;
	CLRF        _Box1+14 
	CLRF        _Box1+15 
	CLRF        _Box1+16 
	CLRF        _Box1+17 
;CHi_Hub_VGCLD_driver.c,1556 :: 		Box1.OnClickPtr      = 0;
	CLRF        _Box1+18 
	CLRF        _Box1+19 
	CLRF        _Box1+20 
	CLRF        _Box1+21 
;CHi_Hub_VGCLD_driver.c,1557 :: 		Box1.OnPressPtr      = 0;
	CLRF        _Box1+22 
	CLRF        _Box1+23 
	CLRF        _Box1+24 
	CLRF        _Box1+25 
;CHi_Hub_VGCLD_driver.c,1559 :: 		bAdminReturn.OwnerScreen     = &ScreenAdmin1;
	MOVLW       _ScreenAdmin1+0
	MOVWF       _bAdminReturn+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       _bAdminReturn+1 
;CHi_Hub_VGCLD_driver.c,1560 :: 		bAdminReturn.Order           = 1;
	MOVLW       1
	MOVWF       _bAdminReturn+2 
;CHi_Hub_VGCLD_driver.c,1561 :: 		bAdminReturn.Left            = 7;
	MOVLW       7
	MOVWF       _bAdminReturn+3 
;CHi_Hub_VGCLD_driver.c,1562 :: 		bAdminReturn.Top             = 4;
	MOVLW       4
	MOVWF       _bAdminReturn+4 
;CHi_Hub_VGCLD_driver.c,1563 :: 		bAdminReturn.Width           = 35;
	MOVLW       35
	MOVWF       _bAdminReturn+5 
;CHi_Hub_VGCLD_driver.c,1564 :: 		bAdminReturn.Height          = 15;
	MOVLW       15
	MOVWF       _bAdminReturn+6 
;CHi_Hub_VGCLD_driver.c,1565 :: 		bAdminReturn.Visible         = 1;
	MOVLW       1
	MOVWF       _bAdminReturn+7 
;CHi_Hub_VGCLD_driver.c,1566 :: 		bAdminReturn.Active          = 1;
	MOVLW       1
	MOVWF       _bAdminReturn+8 
;CHi_Hub_VGCLD_driver.c,1567 :: 		bAdminReturn.Caption         = bAdminReturn_Caption;
	MOVLW       _bAdminReturn_Caption+0
	MOVWF       _bAdminReturn+9 
	MOVLW       hi_addr(_bAdminReturn_Caption+0)
	MOVWF       _bAdminReturn+10 
;CHi_Hub_VGCLD_driver.c,1568 :: 		bAdminReturn.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bAdminReturn+11 
;CHi_Hub_VGCLD_driver.c,1569 :: 		bAdminReturn.FontName        = Tahoma12x11_Bold;
	MOVLW       _Tahoma12x11_Bold+0
	MOVWF       R3 
	MOVLW       hi_addr(_Tahoma12x11_Bold+0)
	MOVWF       R4 
	MOVLW       higher_addr(_Tahoma12x11_Bold+0)
	MOVWF       R5 
	MOVF        R3, 0 
	MOVWF       _bAdminReturn+12 
	MOVF        R4, 0 
	MOVWF       _bAdminReturn+13 
	MOVF        R5, 0 
	MOVWF       _bAdminReturn+14 
;CHi_Hub_VGCLD_driver.c,1570 :: 		bAdminReturn.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bAdminReturn+16 
;CHi_Hub_VGCLD_driver.c,1571 :: 		bAdminReturn.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bAdminReturn+15 
;CHi_Hub_VGCLD_driver.c,1572 :: 		bAdminReturn.OnUpPtr         = 0;
	CLRF        _bAdminReturn+17 
	CLRF        _bAdminReturn+18 
	CLRF        _bAdminReturn+19 
	CLRF        _bAdminReturn+20 
;CHi_Hub_VGCLD_driver.c,1573 :: 		bAdminReturn.OnDownPtr       = 0;
	CLRF        _bAdminReturn+21 
	CLRF        _bAdminReturn+22 
	CLRF        _bAdminReturn+23 
	CLRF        _bAdminReturn+24 
;CHi_Hub_VGCLD_driver.c,1574 :: 		bAdminReturn.OnClickPtr      = bAdminReturnOnClick;
	MOVLW       _bAdminReturnOnClick+0
	MOVWF       _bAdminReturn+25 
	MOVLW       hi_addr(_bAdminReturnOnClick+0)
	MOVWF       _bAdminReturn+26 
	MOVLW       0
	MOVWF       _bAdminReturn+27 
	MOVLW       0
	MOVWF       _bAdminReturn+28 
;CHi_Hub_VGCLD_driver.c,1575 :: 		bAdminReturn.OnPressPtr      = 0;
	CLRF        _bAdminReturn+29 
	CLRF        _bAdminReturn+30 
	CLRF        _bAdminReturn+31 
	CLRF        _bAdminReturn+32 
;CHi_Hub_VGCLD_driver.c,1577 :: 		bChangePW.OwnerScreen     = &ScreenAdmin1;
	MOVLW       _ScreenAdmin1+0
	MOVWF       _bChangePW+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       _bChangePW+1 
;CHi_Hub_VGCLD_driver.c,1578 :: 		bChangePW.Order           = 2;
	MOVLW       2
	MOVWF       _bChangePW+2 
;CHi_Hub_VGCLD_driver.c,1579 :: 		bChangePW.Left            = 7;
	MOVLW       7
	MOVWF       _bChangePW+3 
;CHi_Hub_VGCLD_driver.c,1580 :: 		bChangePW.Top             = 52;
	MOVLW       52
	MOVWF       _bChangePW+4 
;CHi_Hub_VGCLD_driver.c,1581 :: 		bChangePW.Width           = 88;
	MOVLW       88
	MOVWF       _bChangePW+5 
;CHi_Hub_VGCLD_driver.c,1582 :: 		bChangePW.Height          = 20;
	MOVLW       20
	MOVWF       _bChangePW+6 
;CHi_Hub_VGCLD_driver.c,1583 :: 		bChangePW.Visible         = 1;
	MOVLW       1
	MOVWF       _bChangePW+7 
;CHi_Hub_VGCLD_driver.c,1584 :: 		bChangePW.Active          = 1;
	MOVLW       1
	MOVWF       _bChangePW+8 
;CHi_Hub_VGCLD_driver.c,1585 :: 		bChangePW.Caption         = bChangePW_Caption;
	MOVLW       _bChangePW_Caption+0
	MOVWF       _bChangePW+9 
	MOVLW       hi_addr(_bChangePW_Caption+0)
	MOVWF       _bChangePW+10 
;CHi_Hub_VGCLD_driver.c,1586 :: 		bChangePW.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bChangePW+11 
;CHi_Hub_VGCLD_driver.c,1587 :: 		bChangePW.FontName        = T6963C_defaultFont;
	MOVLW       _T6963C_defaultFont+0
	MOVWF       _bChangePW+12 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       _bChangePW+13 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       _bChangePW+14 
;CHi_Hub_VGCLD_driver.c,1588 :: 		bChangePW.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bChangePW+16 
;CHi_Hub_VGCLD_driver.c,1589 :: 		bChangePW.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bChangePW+15 
;CHi_Hub_VGCLD_driver.c,1590 :: 		bChangePW.OnUpPtr         = 0;
	CLRF        _bChangePW+17 
	CLRF        _bChangePW+18 
	CLRF        _bChangePW+19 
	CLRF        _bChangePW+20 
;CHi_Hub_VGCLD_driver.c,1591 :: 		bChangePW.OnDownPtr       = 0;
	CLRF        _bChangePW+21 
	CLRF        _bChangePW+22 
	CLRF        _bChangePW+23 
	CLRF        _bChangePW+24 
;CHi_Hub_VGCLD_driver.c,1592 :: 		bChangePW.OnClickPtr      = bChangePWOnClick;
	MOVLW       _bChangePWOnClick+0
	MOVWF       _bChangePW+25 
	MOVLW       hi_addr(_bChangePWOnClick+0)
	MOVWF       _bChangePW+26 
	MOVLW       0
	MOVWF       _bChangePW+27 
	MOVLW       0
	MOVWF       _bChangePW+28 
;CHi_Hub_VGCLD_driver.c,1593 :: 		bChangePW.OnPressPtr      = 0;
	CLRF        _bChangePW+29 
	CLRF        _bChangePW+30 
	CLRF        _bChangePW+31 
	CLRF        _bChangePW+32 
;CHi_Hub_VGCLD_driver.c,1595 :: 		bSetReclineLimit.OwnerScreen     = &ScreenAdmin1;
	MOVLW       _ScreenAdmin1+0
	MOVWF       _bSetReclineLimit+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       _bSetReclineLimit+1 
;CHi_Hub_VGCLD_driver.c,1596 :: 		bSetReclineLimit.Order           = 3;
	MOVLW       3
	MOVWF       _bSetReclineLimit+2 
;CHi_Hub_VGCLD_driver.c,1597 :: 		bSetReclineLimit.Left            = 7;
	MOVLW       7
	MOVWF       _bSetReclineLimit+3 
;CHi_Hub_VGCLD_driver.c,1598 :: 		bSetReclineLimit.Top             = 28;
	MOVLW       28
	MOVWF       _bSetReclineLimit+4 
;CHi_Hub_VGCLD_driver.c,1599 :: 		bSetReclineLimit.Width           = 88;
	MOVLW       88
	MOVWF       _bSetReclineLimit+5 
;CHi_Hub_VGCLD_driver.c,1600 :: 		bSetReclineLimit.Height          = 20;
	MOVLW       20
	MOVWF       _bSetReclineLimit+6 
;CHi_Hub_VGCLD_driver.c,1601 :: 		bSetReclineLimit.Visible         = 1;
	MOVLW       1
	MOVWF       _bSetReclineLimit+7 
;CHi_Hub_VGCLD_driver.c,1602 :: 		bSetReclineLimit.Active          = 1;
	MOVLW       1
	MOVWF       _bSetReclineLimit+8 
;CHi_Hub_VGCLD_driver.c,1603 :: 		bSetReclineLimit.Caption         = bSetReclineLimit_Caption;
	MOVLW       _bSetReclineLimit_Caption+0
	MOVWF       _bSetReclineLimit+9 
	MOVLW       hi_addr(_bSetReclineLimit_Caption+0)
	MOVWF       _bSetReclineLimit+10 
;CHi_Hub_VGCLD_driver.c,1604 :: 		bSetReclineLimit.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bSetReclineLimit+11 
;CHi_Hub_VGCLD_driver.c,1605 :: 		bSetReclineLimit.FontName        = T6963C_defaultFont;
	MOVLW       _T6963C_defaultFont+0
	MOVWF       _bSetReclineLimit+12 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       _bSetReclineLimit+13 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       _bSetReclineLimit+14 
;CHi_Hub_VGCLD_driver.c,1606 :: 		bSetReclineLimit.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bSetReclineLimit+16 
;CHi_Hub_VGCLD_driver.c,1607 :: 		bSetReclineLimit.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bSetReclineLimit+15 
;CHi_Hub_VGCLD_driver.c,1608 :: 		bSetReclineLimit.OnUpPtr         = 0;
	CLRF        _bSetReclineLimit+17 
	CLRF        _bSetReclineLimit+18 
	CLRF        _bSetReclineLimit+19 
	CLRF        _bSetReclineLimit+20 
;CHi_Hub_VGCLD_driver.c,1609 :: 		bSetReclineLimit.OnDownPtr       = 0;
	CLRF        _bSetReclineLimit+21 
	CLRF        _bSetReclineLimit+22 
	CLRF        _bSetReclineLimit+23 
	CLRF        _bSetReclineLimit+24 
;CHi_Hub_VGCLD_driver.c,1610 :: 		bSetReclineLimit.OnClickPtr      = bSetReclineLimitOnClick;
	MOVLW       _bSetReclineLimitOnClick+0
	MOVWF       _bSetReclineLimit+25 
	MOVLW       hi_addr(_bSetReclineLimitOnClick+0)
	MOVWF       _bSetReclineLimit+26 
	MOVLW       0
	MOVWF       _bSetReclineLimit+27 
	MOVLW       0
	MOVWF       _bSetReclineLimit+28 
;CHi_Hub_VGCLD_driver.c,1611 :: 		bSetReclineLimit.OnPressPtr      = 0;
	CLRF        _bSetReclineLimit+29 
	CLRF        _bSetReclineLimit+30 
	CLRF        _bSetReclineLimit+31 
	CLRF        _bSetReclineLimit+32 
;CHi_Hub_VGCLD_driver.c,1613 :: 		bBindFlash.OwnerScreen     = &ScreenAdmin1;
	MOVLW       _ScreenAdmin1+0
	MOVWF       _bBindFlash+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       _bBindFlash+1 
;CHi_Hub_VGCLD_driver.c,1614 :: 		bBindFlash.Order           = 4;
	MOVLW       4
	MOVWF       _bBindFlash+2 
;CHi_Hub_VGCLD_driver.c,1615 :: 		bBindFlash.Left            = 122;
	MOVLW       122
	MOVWF       _bBindFlash+3 
;CHi_Hub_VGCLD_driver.c,1616 :: 		bBindFlash.Top             = 10;
	MOVLW       10
	MOVWF       _bBindFlash+4 
;CHi_Hub_VGCLD_driver.c,1617 :: 		bBindFlash.Width           = 86;
	MOVLW       86
	MOVWF       _bBindFlash+5 
;CHi_Hub_VGCLD_driver.c,1618 :: 		bBindFlash.Height          = 26;
	MOVLW       26
	MOVWF       _bBindFlash+6 
;CHi_Hub_VGCLD_driver.c,1619 :: 		bBindFlash.Visible         = 1;
	MOVLW       1
	MOVWF       _bBindFlash+7 
;CHi_Hub_VGCLD_driver.c,1620 :: 		bBindFlash.Active          = 1;
	MOVLW       1
	MOVWF       _bBindFlash+8 
;CHi_Hub_VGCLD_driver.c,1621 :: 		bBindFlash.Caption         = bBindFlash_Caption;
	MOVLW       _bBindFlash_Caption+0
	MOVWF       _bBindFlash+9 
	MOVLW       hi_addr(_bBindFlash_Caption+0)
	MOVWF       _bBindFlash+10 
;CHi_Hub_VGCLD_driver.c,1622 :: 		bBindFlash.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bBindFlash+11 
;CHi_Hub_VGCLD_driver.c,1623 :: 		bBindFlash.FontName        = T6963C_defaultFont;
	MOVLW       _T6963C_defaultFont+0
	MOVWF       _bBindFlash+12 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       _bBindFlash+13 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       _bBindFlash+14 
;CHi_Hub_VGCLD_driver.c,1624 :: 		bBindFlash.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bBindFlash+16 
;CHi_Hub_VGCLD_driver.c,1625 :: 		bBindFlash.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bBindFlash+15 
;CHi_Hub_VGCLD_driver.c,1626 :: 		bBindFlash.OnUpPtr         = 0;
	CLRF        _bBindFlash+17 
	CLRF        _bBindFlash+18 
	CLRF        _bBindFlash+19 
	CLRF        _bBindFlash+20 
;CHi_Hub_VGCLD_driver.c,1627 :: 		bBindFlash.OnDownPtr       = 0;
	CLRF        _bBindFlash+21 
	CLRF        _bBindFlash+22 
	CLRF        _bBindFlash+23 
	CLRF        _bBindFlash+24 
;CHi_Hub_VGCLD_driver.c,1628 :: 		bBindFlash.OnClickPtr      = bBindFlashOnClick;
	MOVLW       _bBindFlashOnClick+0
	MOVWF       _bBindFlash+25 
	MOVLW       hi_addr(_bBindFlashOnClick+0)
	MOVWF       _bBindFlash+26 
	MOVLW       0
	MOVWF       _bBindFlash+27 
	MOVLW       0
	MOVWF       _bBindFlash+28 
;CHi_Hub_VGCLD_driver.c,1629 :: 		bBindFlash.OnPressPtr      = 0;
	CLRF        _bBindFlash+29 
	CLRF        _bBindFlash+30 
	CLRF        _bBindFlash+31 
	CLRF        _bBindFlash+32 
;CHi_Hub_VGCLD_driver.c,1631 :: 		bBindNoFlash.OwnerScreen     = &ScreenAdmin1;
	MOVLW       _ScreenAdmin1+0
	MOVWF       _bBindNoFlash+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       _bBindNoFlash+1 
;CHi_Hub_VGCLD_driver.c,1632 :: 		bBindNoFlash.Order           = 5;
	MOVLW       5
	MOVWF       _bBindNoFlash+2 
;CHi_Hub_VGCLD_driver.c,1633 :: 		bBindNoFlash.Left            = 122;
	MOVLW       122
	MOVWF       _bBindNoFlash+3 
;CHi_Hub_VGCLD_driver.c,1634 :: 		bBindNoFlash.Top             = 44;
	MOVLW       44
	MOVWF       _bBindNoFlash+4 
;CHi_Hub_VGCLD_driver.c,1635 :: 		bBindNoFlash.Width           = 86;
	MOVLW       86
	MOVWF       _bBindNoFlash+5 
;CHi_Hub_VGCLD_driver.c,1636 :: 		bBindNoFlash.Height          = 26;
	MOVLW       26
	MOVWF       _bBindNoFlash+6 
;CHi_Hub_VGCLD_driver.c,1637 :: 		bBindNoFlash.Visible         = 1;
	MOVLW       1
	MOVWF       _bBindNoFlash+7 
;CHi_Hub_VGCLD_driver.c,1638 :: 		bBindNoFlash.Active          = 1;
	MOVLW       1
	MOVWF       _bBindNoFlash+8 
;CHi_Hub_VGCLD_driver.c,1639 :: 		bBindNoFlash.Caption         = bBindNoFlash_Caption;
	MOVLW       _bBindNoFlash_Caption+0
	MOVWF       _bBindNoFlash+9 
	MOVLW       hi_addr(_bBindNoFlash_Caption+0)
	MOVWF       _bBindNoFlash+10 
;CHi_Hub_VGCLD_driver.c,1640 :: 		bBindNoFlash.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bBindNoFlash+11 
;CHi_Hub_VGCLD_driver.c,1641 :: 		bBindNoFlash.FontName        = T6963C_defaultFont;
	MOVLW       _T6963C_defaultFont+0
	MOVWF       _bBindNoFlash+12 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       _bBindNoFlash+13 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       _bBindNoFlash+14 
;CHi_Hub_VGCLD_driver.c,1642 :: 		bBindNoFlash.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bBindNoFlash+16 
;CHi_Hub_VGCLD_driver.c,1643 :: 		bBindNoFlash.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bBindNoFlash+15 
;CHi_Hub_VGCLD_driver.c,1644 :: 		bBindNoFlash.OnUpPtr         = 0;
	CLRF        _bBindNoFlash+17 
	CLRF        _bBindNoFlash+18 
	CLRF        _bBindNoFlash+19 
	CLRF        _bBindNoFlash+20 
;CHi_Hub_VGCLD_driver.c,1645 :: 		bBindNoFlash.OnDownPtr       = 0;
	CLRF        _bBindNoFlash+21 
	CLRF        _bBindNoFlash+22 
	CLRF        _bBindNoFlash+23 
	CLRF        _bBindNoFlash+24 
;CHi_Hub_VGCLD_driver.c,1646 :: 		bBindNoFlash.OnClickPtr      = bBindNoFlashOnClick;
	MOVLW       _bBindNoFlashOnClick+0
	MOVWF       _bBindNoFlash+25 
	MOVLW       hi_addr(_bBindNoFlashOnClick+0)
	MOVWF       _bBindNoFlash+26 
	MOVLW       0
	MOVWF       _bBindNoFlash+27 
	MOVLW       0
	MOVWF       _bBindNoFlash+28 
;CHi_Hub_VGCLD_driver.c,1647 :: 		bBindNoFlash.OnPressPtr      = 0;
	CLRF        _bBindNoFlash+29 
	CLRF        _bBindNoFlash+30 
	CLRF        _bBindNoFlash+31 
	CLRF        _bBindNoFlash+32 
;CHi_Hub_VGCLD_driver.c,1649 :: 		bDimLevel.OwnerScreen     = &ScreenAdmin1;
	MOVLW       _ScreenAdmin1+0
	MOVWF       _bDimLevel+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       _bDimLevel+1 
;CHi_Hub_VGCLD_driver.c,1650 :: 		bDimLevel.Order           = 6;
	MOVLW       6
	MOVWF       _bDimLevel+2 
;CHi_Hub_VGCLD_driver.c,1651 :: 		bDimLevel.Left            = 7;
	MOVLW       7
	MOVWF       _bDimLevel+3 
;CHi_Hub_VGCLD_driver.c,1652 :: 		bDimLevel.Top             = 76;
	MOVLW       76
	MOVWF       _bDimLevel+4 
;CHi_Hub_VGCLD_driver.c,1653 :: 		bDimLevel.Width           = 88;
	MOVLW       88
	MOVWF       _bDimLevel+5 
;CHi_Hub_VGCLD_driver.c,1654 :: 		bDimLevel.Height          = 20;
	MOVLW       20
	MOVWF       _bDimLevel+6 
;CHi_Hub_VGCLD_driver.c,1655 :: 		bDimLevel.Visible         = 1;
	MOVLW       1
	MOVWF       _bDimLevel+7 
;CHi_Hub_VGCLD_driver.c,1656 :: 		bDimLevel.Active          = 1;
	MOVLW       1
	MOVWF       _bDimLevel+8 
;CHi_Hub_VGCLD_driver.c,1657 :: 		bDimLevel.Caption         = bDimLevel_Caption;
	MOVLW       _bDimLevel_Caption+0
	MOVWF       _bDimLevel+9 
	MOVLW       hi_addr(_bDimLevel_Caption+0)
	MOVWF       _bDimLevel+10 
;CHi_Hub_VGCLD_driver.c,1658 :: 		bDimLevel.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bDimLevel+11 
;CHi_Hub_VGCLD_driver.c,1659 :: 		bDimLevel.FontName        = T6963C_defaultFont;
	MOVLW       _T6963C_defaultFont+0
	MOVWF       _bDimLevel+12 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       _bDimLevel+13 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       _bDimLevel+14 
;CHi_Hub_VGCLD_driver.c,1660 :: 		bDimLevel.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bDimLevel+16 
;CHi_Hub_VGCLD_driver.c,1661 :: 		bDimLevel.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bDimLevel+15 
;CHi_Hub_VGCLD_driver.c,1662 :: 		bDimLevel.OnUpPtr         = 0;
	CLRF        _bDimLevel+17 
	CLRF        _bDimLevel+18 
	CLRF        _bDimLevel+19 
	CLRF        _bDimLevel+20 
;CHi_Hub_VGCLD_driver.c,1663 :: 		bDimLevel.OnDownPtr       = 0;
	CLRF        _bDimLevel+21 
	CLRF        _bDimLevel+22 
	CLRF        _bDimLevel+23 
	CLRF        _bDimLevel+24 
;CHi_Hub_VGCLD_driver.c,1664 :: 		bDimLevel.OnClickPtr      = bDimLevelOnClick;
	MOVLW       _bDimLevelOnClick+0
	MOVWF       _bDimLevel+25 
	MOVLW       hi_addr(_bDimLevelOnClick+0)
	MOVWF       _bDimLevel+26 
	MOVLW       0
	MOVWF       _bDimLevel+27 
	MOVLW       0
	MOVWF       _bDimLevel+28 
;CHi_Hub_VGCLD_driver.c,1665 :: 		bDimLevel.OnPressPtr      = 0;
	CLRF        _bDimLevel+29 
	CLRF        _bDimLevel+30 
	CLRF        _bDimLevel+31 
	CLRF        _bDimLevel+32 
;CHi_Hub_VGCLD_driver.c,1667 :: 		bChairDim.OwnerScreen     = &ScreenAdmin1;
	MOVLW       _ScreenAdmin1+0
	MOVWF       _bChairDim+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       _bChairDim+1 
;CHi_Hub_VGCLD_driver.c,1668 :: 		bChairDim.Order           = 7;
	MOVLW       7
	MOVWF       _bChairDim+2 
;CHi_Hub_VGCLD_driver.c,1669 :: 		bChairDim.Left            = 7;
	MOVLW       7
	MOVWF       _bChairDim+3 
;CHi_Hub_VGCLD_driver.c,1670 :: 		bChairDim.Top             = 100;
	MOVLW       100
	MOVWF       _bChairDim+4 
;CHi_Hub_VGCLD_driver.c,1671 :: 		bChairDim.Width           = 88;
	MOVLW       88
	MOVWF       _bChairDim+5 
;CHi_Hub_VGCLD_driver.c,1672 :: 		bChairDim.Height          = 20;
	MOVLW       20
	MOVWF       _bChairDim+6 
;CHi_Hub_VGCLD_driver.c,1673 :: 		bChairDim.Visible         = 1;
	MOVLW       1
	MOVWF       _bChairDim+7 
;CHi_Hub_VGCLD_driver.c,1674 :: 		bChairDim.Active          = 1;
	MOVLW       1
	MOVWF       _bChairDim+8 
;CHi_Hub_VGCLD_driver.c,1675 :: 		bChairDim.Caption         = bChairDim_Caption;
	MOVLW       _bChairDim_Caption+0
	MOVWF       _bChairDim+9 
	MOVLW       hi_addr(_bChairDim_Caption+0)
	MOVWF       _bChairDim+10 
;CHi_Hub_VGCLD_driver.c,1676 :: 		bChairDim.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bChairDim+11 
;CHi_Hub_VGCLD_driver.c,1677 :: 		bChairDim.FontName        = T6963C_defaultFont;
	MOVLW       _T6963C_defaultFont+0
	MOVWF       _bChairDim+12 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       _bChairDim+13 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       _bChairDim+14 
;CHi_Hub_VGCLD_driver.c,1678 :: 		bChairDim.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bChairDim+16 
;CHi_Hub_VGCLD_driver.c,1679 :: 		bChairDim.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bChairDim+15 
;CHi_Hub_VGCLD_driver.c,1680 :: 		bChairDim.OnUpPtr         = 0;
	CLRF        _bChairDim+17 
	CLRF        _bChairDim+18 
	CLRF        _bChairDim+19 
	CLRF        _bChairDim+20 
;CHi_Hub_VGCLD_driver.c,1681 :: 		bChairDim.OnDownPtr       = 0;
	CLRF        _bChairDim+21 
	CLRF        _bChairDim+22 
	CLRF        _bChairDim+23 
	CLRF        _bChairDim+24 
;CHi_Hub_VGCLD_driver.c,1682 :: 		bChairDim.OnClickPtr      = bChairDimOnClick;
	MOVLW       _bChairDimOnClick+0
	MOVWF       _bChairDim+25 
	MOVLW       hi_addr(_bChairDimOnClick+0)
	MOVWF       _bChairDim+26 
	MOVLW       0
	MOVWF       _bChairDim+27 
	MOVLW       0
	MOVWF       _bChairDim+28 
;CHi_Hub_VGCLD_driver.c,1683 :: 		bChairDim.OnPressPtr      = 0;
	CLRF        _bChairDim+29 
	CLRF        _bChairDim+30 
	CLRF        _bChairDim+31 
	CLRF        _bChairDim+32 
;CHi_Hub_VGCLD_driver.c,1685 :: 		bNext2Admin2.OwnerScreen     = &ScreenAdmin1;
	MOVLW       _ScreenAdmin1+0
	MOVWF       _bNext2Admin2+0 
	MOVLW       hi_addr(_ScreenAdmin1+0)
	MOVWF       _bNext2Admin2+1 
;CHi_Hub_VGCLD_driver.c,1686 :: 		bNext2Admin2.Order           = 8;
	MOVLW       8
	MOVWF       _bNext2Admin2+2 
;CHi_Hub_VGCLD_driver.c,1687 :: 		bNext2Admin2.Left            = 189;
	MOVLW       189
	MOVWF       _bNext2Admin2+3 
;CHi_Hub_VGCLD_driver.c,1688 :: 		bNext2Admin2.Top             = 104;
	MOVLW       104
	MOVWF       _bNext2Admin2+4 
;CHi_Hub_VGCLD_driver.c,1689 :: 		bNext2Admin2.Width           = 35;
	MOVLW       35
	MOVWF       _bNext2Admin2+5 
;CHi_Hub_VGCLD_driver.c,1690 :: 		bNext2Admin2.Height          = 15;
	MOVLW       15
	MOVWF       _bNext2Admin2+6 
;CHi_Hub_VGCLD_driver.c,1691 :: 		bNext2Admin2.Visible         = 1;
	MOVLW       1
	MOVWF       _bNext2Admin2+7 
;CHi_Hub_VGCLD_driver.c,1692 :: 		bNext2Admin2.Active          = 1;
	MOVLW       1
	MOVWF       _bNext2Admin2+8 
;CHi_Hub_VGCLD_driver.c,1693 :: 		bNext2Admin2.Caption         = bNext2Admin2_Caption;
	MOVLW       _bNext2Admin2_Caption+0
	MOVWF       _bNext2Admin2+9 
	MOVLW       hi_addr(_bNext2Admin2_Caption+0)
	MOVWF       _bNext2Admin2+10 
;CHi_Hub_VGCLD_driver.c,1694 :: 		bNext2Admin2.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNext2Admin2+11 
;CHi_Hub_VGCLD_driver.c,1695 :: 		bNext2Admin2.FontName        = Tahoma12x11_Bold;
	MOVF        R3, 0 
	MOVWF       _bNext2Admin2+12 
	MOVF        R4, 0 
	MOVWF       _bNext2Admin2+13 
	MOVF        R5, 0 
	MOVWF       _bNext2Admin2+14 
;CHi_Hub_VGCLD_driver.c,1696 :: 		bNext2Admin2.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNext2Admin2+16 
;CHi_Hub_VGCLD_driver.c,1697 :: 		bNext2Admin2.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNext2Admin2+15 
;CHi_Hub_VGCLD_driver.c,1698 :: 		bNext2Admin2.OnUpPtr         = 0;
	CLRF        _bNext2Admin2+17 
	CLRF        _bNext2Admin2+18 
	CLRF        _bNext2Admin2+19 
	CLRF        _bNext2Admin2+20 
;CHi_Hub_VGCLD_driver.c,1699 :: 		bNext2Admin2.OnDownPtr       = 0;
	CLRF        _bNext2Admin2+21 
	CLRF        _bNext2Admin2+22 
	CLRF        _bNext2Admin2+23 
	CLRF        _bNext2Admin2+24 
;CHi_Hub_VGCLD_driver.c,1700 :: 		bNext2Admin2.OnClickPtr      = bNext2Admin2OnClick;
	MOVLW       _bNext2Admin2OnClick+0
	MOVWF       _bNext2Admin2+25 
	MOVLW       hi_addr(_bNext2Admin2OnClick+0)
	MOVWF       _bNext2Admin2+26 
	MOVLW       0
	MOVWF       _bNext2Admin2+27 
	MOVLW       0
	MOVWF       _bNext2Admin2+28 
;CHi_Hub_VGCLD_driver.c,1701 :: 		bNext2Admin2.OnPressPtr      = 0;
	CLRF        _bNext2Admin2+29 
	CLRF        _bNext2Admin2+30 
	CLRF        _bNext2Admin2+31 
	CLRF        _bNext2Admin2+32 
;CHi_Hub_VGCLD_driver.c,1703 :: 		bSendReclineLimitCmd.OwnerScreen     = &ScreenSetRecline;
	MOVLW       _ScreenSetRecline+0
	MOVWF       _bSendReclineLimitCmd+0 
	MOVLW       hi_addr(_ScreenSetRecline+0)
	MOVWF       _bSendReclineLimitCmd+1 
;CHi_Hub_VGCLD_driver.c,1704 :: 		bSendReclineLimitCmd.Order           = 7;
	MOVLW       7
	MOVWF       _bSendReclineLimitCmd+2 
;CHi_Hub_VGCLD_driver.c,1705 :: 		bSendReclineLimitCmd.Left            = 34;
	MOVLW       34
	MOVWF       _bSendReclineLimitCmd+3 
;CHi_Hub_VGCLD_driver.c,1706 :: 		bSendReclineLimitCmd.Top             = 92;
	MOVLW       92
	MOVWF       _bSendReclineLimitCmd+4 
;CHi_Hub_VGCLD_driver.c,1707 :: 		bSendReclineLimitCmd.Width           = 50;
	MOVLW       50
	MOVWF       _bSendReclineLimitCmd+5 
;CHi_Hub_VGCLD_driver.c,1708 :: 		bSendReclineLimitCmd.Height          = 27;
	MOVLW       27
	MOVWF       _bSendReclineLimitCmd+6 
;CHi_Hub_VGCLD_driver.c,1709 :: 		bSendReclineLimitCmd.Visible         = 1;
	MOVLW       1
	MOVWF       _bSendReclineLimitCmd+7 
;CHi_Hub_VGCLD_driver.c,1710 :: 		bSendReclineLimitCmd.Active          = 1;
	MOVLW       1
	MOVWF       _bSendReclineLimitCmd+8 
;CHi_Hub_VGCLD_driver.c,1711 :: 		bSendReclineLimitCmd.Caption         = bSendReclineLimitCmd_Caption;
	MOVLW       _bSendReclineLimitCmd_Caption+0
	MOVWF       _bSendReclineLimitCmd+9 
	MOVLW       hi_addr(_bSendReclineLimitCmd_Caption+0)
	MOVWF       _bSendReclineLimitCmd+10 
;CHi_Hub_VGCLD_driver.c,1712 :: 		bSendReclineLimitCmd.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bSendReclineLimitCmd+11 
;CHi_Hub_VGCLD_driver.c,1713 :: 		bSendReclineLimitCmd.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bSendReclineLimitCmd+12 
	MOVF        R7, 0 
	MOVWF       _bSendReclineLimitCmd+13 
	MOVF        R8, 0 
	MOVWF       _bSendReclineLimitCmd+14 
;CHi_Hub_VGCLD_driver.c,1714 :: 		bSendReclineLimitCmd.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bSendReclineLimitCmd+16 
;CHi_Hub_VGCLD_driver.c,1715 :: 		bSendReclineLimitCmd.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bSendReclineLimitCmd+15 
;CHi_Hub_VGCLD_driver.c,1716 :: 		bSendReclineLimitCmd.OnUpPtr         = 0;
	CLRF        _bSendReclineLimitCmd+17 
	CLRF        _bSendReclineLimitCmd+18 
	CLRF        _bSendReclineLimitCmd+19 
	CLRF        _bSendReclineLimitCmd+20 
;CHi_Hub_VGCLD_driver.c,1717 :: 		bSendReclineLimitCmd.OnDownPtr       = 0;
	CLRF        _bSendReclineLimitCmd+21 
	CLRF        _bSendReclineLimitCmd+22 
	CLRF        _bSendReclineLimitCmd+23 
	CLRF        _bSendReclineLimitCmd+24 
;CHi_Hub_VGCLD_driver.c,1718 :: 		bSendReclineLimitCmd.OnClickPtr      = bSendReclineLimitCmdOnClick;
	MOVLW       _bSendReclineLimitCmdOnClick+0
	MOVWF       _bSendReclineLimitCmd+25 
	MOVLW       hi_addr(_bSendReclineLimitCmdOnClick+0)
	MOVWF       _bSendReclineLimitCmd+26 
	MOVLW       0
	MOVWF       _bSendReclineLimitCmd+27 
	MOVLW       0
	MOVWF       _bSendReclineLimitCmd+28 
;CHi_Hub_VGCLD_driver.c,1719 :: 		bSendReclineLimitCmd.OnPressPtr      = 0;
	CLRF        _bSendReclineLimitCmd+29 
	CLRF        _bSendReclineLimitCmd+30 
	CLRF        _bSendReclineLimitCmd+31 
	CLRF        _bSendReclineLimitCmd+32 
;CHi_Hub_VGCLD_driver.c,1721 :: 		bReclineBack.OwnerScreen     = &ScreenSetRecline;
	MOVLW       _ScreenSetRecline+0
	MOVWF       _bReclineBack+0 
	MOVLW       hi_addr(_ScreenSetRecline+0)
	MOVWF       _bReclineBack+1 
;CHi_Hub_VGCLD_driver.c,1722 :: 		bReclineBack.Order           = 8;
	MOVLW       8
	MOVWF       _bReclineBack+2 
;CHi_Hub_VGCLD_driver.c,1723 :: 		bReclineBack.Left            = 164;
	MOVLW       164
	MOVWF       _bReclineBack+3 
;CHi_Hub_VGCLD_driver.c,1724 :: 		bReclineBack.Top             = 92;
	MOVLW       92
	MOVWF       _bReclineBack+4 
;CHi_Hub_VGCLD_driver.c,1725 :: 		bReclineBack.Width           = 50;
	MOVLW       50
	MOVWF       _bReclineBack+5 
;CHi_Hub_VGCLD_driver.c,1726 :: 		bReclineBack.Height          = 27;
	MOVLW       27
	MOVWF       _bReclineBack+6 
;CHi_Hub_VGCLD_driver.c,1727 :: 		bReclineBack.Visible         = 1;
	MOVLW       1
	MOVWF       _bReclineBack+7 
;CHi_Hub_VGCLD_driver.c,1728 :: 		bReclineBack.Active          = 1;
	MOVLW       1
	MOVWF       _bReclineBack+8 
;CHi_Hub_VGCLD_driver.c,1729 :: 		bReclineBack.Caption         = bReclineBack_Caption;
	MOVLW       _bReclineBack_Caption+0
	MOVWF       _bReclineBack+9 
	MOVLW       hi_addr(_bReclineBack_Caption+0)
	MOVWF       _bReclineBack+10 
;CHi_Hub_VGCLD_driver.c,1730 :: 		bReclineBack.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bReclineBack+11 
;CHi_Hub_VGCLD_driver.c,1731 :: 		bReclineBack.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bReclineBack+12 
	MOVF        R7, 0 
	MOVWF       _bReclineBack+13 
	MOVF        R8, 0 
	MOVWF       _bReclineBack+14 
;CHi_Hub_VGCLD_driver.c,1732 :: 		bReclineBack.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bReclineBack+16 
;CHi_Hub_VGCLD_driver.c,1733 :: 		bReclineBack.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bReclineBack+15 
;CHi_Hub_VGCLD_driver.c,1734 :: 		bReclineBack.OnUpPtr         = 0;
	CLRF        _bReclineBack+17 
	CLRF        _bReclineBack+18 
	CLRF        _bReclineBack+19 
	CLRF        _bReclineBack+20 
;CHi_Hub_VGCLD_driver.c,1735 :: 		bReclineBack.OnDownPtr       = 0;
	CLRF        _bReclineBack+21 
	CLRF        _bReclineBack+22 
	CLRF        _bReclineBack+23 
	CLRF        _bReclineBack+24 
;CHi_Hub_VGCLD_driver.c,1736 :: 		bReclineBack.OnClickPtr      = bReclineBackOnClick;
	MOVLW       _bReclineBackOnClick+0
	MOVWF       _bReclineBack+25 
	MOVLW       hi_addr(_bReclineBackOnClick+0)
	MOVWF       _bReclineBack+26 
	MOVLW       0
	MOVWF       _bReclineBack+27 
	MOVLW       0
	MOVWF       _bReclineBack+28 
;CHi_Hub_VGCLD_driver.c,1737 :: 		bReclineBack.OnPressPtr      = 0;
	CLRF        _bReclineBack+29 
	CLRF        _bReclineBack+30 
	CLRF        _bReclineBack+31 
	CLRF        _bReclineBack+32 
;CHi_Hub_VGCLD_driver.c,1739 :: 		ChPwRect.OwnerScreen     = &ScreenChangePW;
	MOVLW       _ScreenChangePW+0
	MOVWF       _ChPwRect+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       _ChPwRect+1 
;CHi_Hub_VGCLD_driver.c,1740 :: 		ChPwRect.Order           = 0;
	CLRF        _ChPwRect+2 
;CHi_Hub_VGCLD_driver.c,1741 :: 		ChPwRect.Left            = 121;
	MOVLW       121
	MOVWF       _ChPwRect+3 
;CHi_Hub_VGCLD_driver.c,1742 :: 		ChPwRect.Top             = 39;
	MOVLW       39
	MOVWF       _ChPwRect+4 
;CHi_Hub_VGCLD_driver.c,1743 :: 		ChPwRect.Width           = 47;
	MOVLW       47
	MOVWF       _ChPwRect+5 
;CHi_Hub_VGCLD_driver.c,1744 :: 		ChPwRect.Height          = 15;
	MOVLW       15
	MOVWF       _ChPwRect+6 
;CHi_Hub_VGCLD_driver.c,1745 :: 		ChPwRect.Visible         = 1;
	MOVLW       1
	MOVWF       _ChPwRect+7 
;CHi_Hub_VGCLD_driver.c,1746 :: 		ChPwRect.Active          = 1;
	MOVLW       1
	MOVWF       _ChPwRect+8 
;CHi_Hub_VGCLD_driver.c,1747 :: 		ChPwRect.Transparent     = 1;
	MOVLW       1
	MOVWF       _ChPwRect+9 
;CHi_Hub_VGCLD_driver.c,1748 :: 		ChPwRect.OnUpPtr         = 0;
	CLRF        _ChPwRect+10 
	CLRF        _ChPwRect+11 
	CLRF        _ChPwRect+12 
	CLRF        _ChPwRect+13 
;CHi_Hub_VGCLD_driver.c,1749 :: 		ChPwRect.OnDownPtr       = 0;
	CLRF        _ChPwRect+14 
	CLRF        _ChPwRect+15 
	CLRF        _ChPwRect+16 
	CLRF        _ChPwRect+17 
;CHi_Hub_VGCLD_driver.c,1750 :: 		ChPwRect.OnClickPtr      = 0;
	CLRF        _ChPwRect+18 
	CLRF        _ChPwRect+19 
	CLRF        _ChPwRect+20 
	CLRF        _ChPwRect+21 
;CHi_Hub_VGCLD_driver.c,1751 :: 		ChPwRect.OnPressPtr      = 0;
	CLRF        _ChPwRect+22 
	CLRF        _ChPwRect+23 
	CLRF        _ChPwRect+24 
	CLRF        _ChPwRect+25 
;CHi_Hub_VGCLD_driver.c,1753 :: 		bChPw.OwnerScreen     = &ScreenChangePW;
	MOVLW       _ScreenChangePW+0
	MOVWF       _bChPw+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       _bChPw+1 
;CHi_Hub_VGCLD_driver.c,1754 :: 		bChPw.Order           = 1;
	MOVLW       1
	MOVWF       _bChPw+2 
;CHi_Hub_VGCLD_driver.c,1755 :: 		bChPw.Left            = 103;
	MOVLW       103
	MOVWF       _bChPw+3 
;CHi_Hub_VGCLD_driver.c,1756 :: 		bChPw.Top             = 80;
	MOVLW       80
	MOVWF       _bChPw+4 
;CHi_Hub_VGCLD_driver.c,1757 :: 		bChPw.Width           = 68;
	MOVLW       68
	MOVWF       _bChPw+5 
;CHi_Hub_VGCLD_driver.c,1758 :: 		bChPw.Height          = 36;
	MOVLW       36
	MOVWF       _bChPw+6 
;CHi_Hub_VGCLD_driver.c,1759 :: 		bChPw.Visible         = 1;
	MOVLW       1
	MOVWF       _bChPw+7 
;CHi_Hub_VGCLD_driver.c,1760 :: 		bChPw.Active          = 1;
	MOVLW       1
	MOVWF       _bChPw+8 
;CHi_Hub_VGCLD_driver.c,1761 :: 		bChPw.Caption         = bChPw_Caption;
	MOVLW       _bChPw_Caption+0
	MOVWF       _bChPw+9 
	MOVLW       hi_addr(_bChPw_Caption+0)
	MOVWF       _bChPw+10 
;CHi_Hub_VGCLD_driver.c,1762 :: 		bChPw.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bChPw+11 
;CHi_Hub_VGCLD_driver.c,1763 :: 		bChPw.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bChPw+12 
	MOVF        R7, 0 
	MOVWF       _bChPw+13 
	MOVF        R8, 0 
	MOVWF       _bChPw+14 
;CHi_Hub_VGCLD_driver.c,1764 :: 		bChPw.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bChPw+16 
;CHi_Hub_VGCLD_driver.c,1765 :: 		bChPw.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bChPw+15 
;CHi_Hub_VGCLD_driver.c,1766 :: 		bChPw.OnUpPtr         = 0;
	CLRF        _bChPw+17 
	CLRF        _bChPw+18 
	CLRF        _bChPw+19 
	CLRF        _bChPw+20 
;CHi_Hub_VGCLD_driver.c,1767 :: 		bChPw.OnDownPtr       = 0;
	CLRF        _bChPw+21 
	CLRF        _bChPw+22 
	CLRF        _bChPw+23 
	CLRF        _bChPw+24 
;CHi_Hub_VGCLD_driver.c,1768 :: 		bChPw.OnClickPtr      = bChPwOnClick;
	MOVLW       _bChPwOnClick+0
	MOVWF       _bChPw+25 
	MOVLW       hi_addr(_bChPwOnClick+0)
	MOVWF       _bChPw+26 
	MOVLW       0
	MOVWF       _bChPw+27 
	MOVLW       0
	MOVWF       _bChPw+28 
;CHi_Hub_VGCLD_driver.c,1769 :: 		bChPw.OnPressPtr      = 0;
	CLRF        _bChPw+29 
	CLRF        _bChPw+30 
	CLRF        _bChPw+31 
	CLRF        _bChPw+32 
;CHi_Hub_VGCLD_driver.c,1771 :: 		bNum1Ch.OwnerScreen     = &ScreenChangePW;
	MOVLW       _ScreenChangePW+0
	MOVWF       _bNum1Ch+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       _bNum1Ch+1 
;CHi_Hub_VGCLD_driver.c,1772 :: 		bNum1Ch.Order           = 2;
	MOVLW       2
	MOVWF       _bNum1Ch+2 
;CHi_Hub_VGCLD_driver.c,1773 :: 		bNum1Ch.Left            = 11;
	MOVLW       11
	MOVWF       _bNum1Ch+3 
;CHi_Hub_VGCLD_driver.c,1774 :: 		bNum1Ch.Top             = 7;
	MOVLW       7
	MOVWF       _bNum1Ch+4 
;CHi_Hub_VGCLD_driver.c,1775 :: 		bNum1Ch.Width           = 25;
	MOVLW       25
	MOVWF       _bNum1Ch+5 
;CHi_Hub_VGCLD_driver.c,1776 :: 		bNum1Ch.Height          = 25;
	MOVLW       25
	MOVWF       _bNum1Ch+6 
;CHi_Hub_VGCLD_driver.c,1777 :: 		bNum1Ch.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum1Ch+7 
;CHi_Hub_VGCLD_driver.c,1778 :: 		bNum1Ch.Active          = 1;
	MOVLW       1
	MOVWF       _bNum1Ch+8 
;CHi_Hub_VGCLD_driver.c,1779 :: 		bNum1Ch.Caption         = bNum1Ch_Caption;
	MOVLW       _bNum1Ch_Caption+0
	MOVWF       _bNum1Ch+9 
	MOVLW       hi_addr(_bNum1Ch_Caption+0)
	MOVWF       _bNum1Ch+10 
;CHi_Hub_VGCLD_driver.c,1780 :: 		bNum1Ch.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum1Ch+11 
;CHi_Hub_VGCLD_driver.c,1781 :: 		bNum1Ch.FontName        = Tahoma19x19_Bold;
	MOVLW       _Tahoma19x19_Bold+0
	MOVWF       R0 
	MOVLW       hi_addr(_Tahoma19x19_Bold+0)
	MOVWF       R1 
	MOVLW       higher_addr(_Tahoma19x19_Bold+0)
	MOVWF       R2 
	MOVF        R0, 0 
	MOVWF       _bNum1Ch+12 
	MOVF        R1, 0 
	MOVWF       _bNum1Ch+13 
	MOVF        R2, 0 
	MOVWF       _bNum1Ch+14 
;CHi_Hub_VGCLD_driver.c,1782 :: 		bNum1Ch.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum1Ch+16 
;CHi_Hub_VGCLD_driver.c,1783 :: 		bNum1Ch.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum1Ch+15 
;CHi_Hub_VGCLD_driver.c,1784 :: 		bNum1Ch.OnUpPtr         = 0;
	CLRF        _bNum1Ch+17 
	CLRF        _bNum1Ch+18 
	CLRF        _bNum1Ch+19 
	CLRF        _bNum1Ch+20 
;CHi_Hub_VGCLD_driver.c,1785 :: 		bNum1Ch.OnDownPtr       = 0;
	CLRF        _bNum1Ch+21 
	CLRF        _bNum1Ch+22 
	CLRF        _bNum1Ch+23 
	CLRF        _bNum1Ch+24 
;CHi_Hub_VGCLD_driver.c,1786 :: 		bNum1Ch.OnClickPtr      = bNum1ChOnClick;
	MOVLW       _bNum1ChOnClick+0
	MOVWF       _bNum1Ch+25 
	MOVLW       hi_addr(_bNum1ChOnClick+0)
	MOVWF       _bNum1Ch+26 
	MOVLW       0
	MOVWF       _bNum1Ch+27 
	MOVLW       0
	MOVWF       _bNum1Ch+28 
;CHi_Hub_VGCLD_driver.c,1787 :: 		bNum1Ch.OnPressPtr      = 0;
	CLRF        _bNum1Ch+29 
	CLRF        _bNum1Ch+30 
	CLRF        _bNum1Ch+31 
	CLRF        _bNum1Ch+32 
;CHi_Hub_VGCLD_driver.c,1789 :: 		bNum4Ch.OwnerScreen     = &ScreenChangePW;
	MOVLW       _ScreenChangePW+0
	MOVWF       _bNum4Ch+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       _bNum4Ch+1 
;CHi_Hub_VGCLD_driver.c,1790 :: 		bNum4Ch.Order           = 3;
	MOVLW       3
	MOVWF       _bNum4Ch+2 
;CHi_Hub_VGCLD_driver.c,1791 :: 		bNum4Ch.Left            = 11;
	MOVLW       11
	MOVWF       _bNum4Ch+3 
;CHi_Hub_VGCLD_driver.c,1792 :: 		bNum4Ch.Top             = 36;
	MOVLW       36
	MOVWF       _bNum4Ch+4 
;CHi_Hub_VGCLD_driver.c,1793 :: 		bNum4Ch.Width           = 25;
	MOVLW       25
	MOVWF       _bNum4Ch+5 
;CHi_Hub_VGCLD_driver.c,1794 :: 		bNum4Ch.Height          = 25;
	MOVLW       25
	MOVWF       _bNum4Ch+6 
;CHi_Hub_VGCLD_driver.c,1795 :: 		bNum4Ch.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum4Ch+7 
;CHi_Hub_VGCLD_driver.c,1796 :: 		bNum4Ch.Active          = 1;
	MOVLW       1
	MOVWF       _bNum4Ch+8 
;CHi_Hub_VGCLD_driver.c,1797 :: 		bNum4Ch.Caption         = bNum4Ch_Caption;
	MOVLW       _bNum4Ch_Caption+0
	MOVWF       _bNum4Ch+9 
	MOVLW       hi_addr(_bNum4Ch_Caption+0)
	MOVWF       _bNum4Ch+10 
;CHi_Hub_VGCLD_driver.c,1798 :: 		bNum4Ch.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum4Ch+11 
;CHi_Hub_VGCLD_driver.c,1799 :: 		bNum4Ch.FontName        = Tahoma19x19_Bold;
	MOVF        R0, 0 
	MOVWF       _bNum4Ch+12 
	MOVF        R1, 0 
	MOVWF       _bNum4Ch+13 
	MOVF        R2, 0 
	MOVWF       _bNum4Ch+14 
;CHi_Hub_VGCLD_driver.c,1800 :: 		bNum4Ch.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum4Ch+16 
;CHi_Hub_VGCLD_driver.c,1801 :: 		bNum4Ch.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum4Ch+15 
;CHi_Hub_VGCLD_driver.c,1802 :: 		bNum4Ch.OnUpPtr         = 0;
	CLRF        _bNum4Ch+17 
	CLRF        _bNum4Ch+18 
	CLRF        _bNum4Ch+19 
	CLRF        _bNum4Ch+20 
;CHi_Hub_VGCLD_driver.c,1803 :: 		bNum4Ch.OnDownPtr       = 0;
	CLRF        _bNum4Ch+21 
	CLRF        _bNum4Ch+22 
	CLRF        _bNum4Ch+23 
	CLRF        _bNum4Ch+24 
;CHi_Hub_VGCLD_driver.c,1804 :: 		bNum4Ch.OnClickPtr      = bNum4ChOnClick;
	MOVLW       _bNum4ChOnClick+0
	MOVWF       _bNum4Ch+25 
	MOVLW       hi_addr(_bNum4ChOnClick+0)
	MOVWF       _bNum4Ch+26 
	MOVLW       0
	MOVWF       _bNum4Ch+27 
	MOVLW       0
	MOVWF       _bNum4Ch+28 
;CHi_Hub_VGCLD_driver.c,1805 :: 		bNum4Ch.OnPressPtr      = 0;
	CLRF        _bNum4Ch+29 
	CLRF        _bNum4Ch+30 
	CLRF        _bNum4Ch+31 
	CLRF        _bNum4Ch+32 
;CHi_Hub_VGCLD_driver.c,1807 :: 		bNum7Ch.OwnerScreen     = &ScreenChangePW;
	MOVLW       _ScreenChangePW+0
	MOVWF       _bNum7Ch+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       _bNum7Ch+1 
;CHi_Hub_VGCLD_driver.c,1808 :: 		bNum7Ch.Order           = 4;
	MOVLW       4
	MOVWF       _bNum7Ch+2 
;CHi_Hub_VGCLD_driver.c,1809 :: 		bNum7Ch.Left            = 11;
	MOVLW       11
	MOVWF       _bNum7Ch+3 
;CHi_Hub_VGCLD_driver.c,1810 :: 		bNum7Ch.Top             = 65;
	MOVLW       65
	MOVWF       _bNum7Ch+4 
;CHi_Hub_VGCLD_driver.c,1811 :: 		bNum7Ch.Width           = 25;
	MOVLW       25
	MOVWF       _bNum7Ch+5 
;CHi_Hub_VGCLD_driver.c,1812 :: 		bNum7Ch.Height          = 25;
	MOVLW       25
	MOVWF       _bNum7Ch+6 
;CHi_Hub_VGCLD_driver.c,1813 :: 		bNum7Ch.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum7Ch+7 
;CHi_Hub_VGCLD_driver.c,1814 :: 		bNum7Ch.Active          = 1;
	MOVLW       1
	MOVWF       _bNum7Ch+8 
;CHi_Hub_VGCLD_driver.c,1815 :: 		bNum7Ch.Caption         = bNum7Ch_Caption;
	MOVLW       _bNum7Ch_Caption+0
	MOVWF       _bNum7Ch+9 
	MOVLW       hi_addr(_bNum7Ch_Caption+0)
	MOVWF       _bNum7Ch+10 
;CHi_Hub_VGCLD_driver.c,1816 :: 		bNum7Ch.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum7Ch+11 
;CHi_Hub_VGCLD_driver.c,1817 :: 		bNum7Ch.FontName        = Tahoma19x19_Bold;
	MOVF        R0, 0 
	MOVWF       _bNum7Ch+12 
	MOVF        R1, 0 
	MOVWF       _bNum7Ch+13 
	MOVF        R2, 0 
	MOVWF       _bNum7Ch+14 
;CHi_Hub_VGCLD_driver.c,1818 :: 		bNum7Ch.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum7Ch+16 
;CHi_Hub_VGCLD_driver.c,1819 :: 		bNum7Ch.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum7Ch+15 
;CHi_Hub_VGCLD_driver.c,1820 :: 		bNum7Ch.OnUpPtr         = 0;
	CLRF        _bNum7Ch+17 
	CLRF        _bNum7Ch+18 
	CLRF        _bNum7Ch+19 
	CLRF        _bNum7Ch+20 
;CHi_Hub_VGCLD_driver.c,1821 :: 		bNum7Ch.OnDownPtr       = 0;
	CLRF        _bNum7Ch+21 
	CLRF        _bNum7Ch+22 
	CLRF        _bNum7Ch+23 
	CLRF        _bNum7Ch+24 
;CHi_Hub_VGCLD_driver.c,1822 :: 		bNum7Ch.OnClickPtr      = bNum7ChOnClick;
	MOVLW       _bNum7ChOnClick+0
	MOVWF       _bNum7Ch+25 
	MOVLW       hi_addr(_bNum7ChOnClick+0)
	MOVWF       _bNum7Ch+26 
	MOVLW       0
	MOVWF       _bNum7Ch+27 
	MOVLW       0
	MOVWF       _bNum7Ch+28 
;CHi_Hub_VGCLD_driver.c,1823 :: 		bNum7Ch.OnPressPtr      = 0;
	CLRF        _bNum7Ch+29 
	CLRF        _bNum7Ch+30 
	CLRF        _bNum7Ch+31 
	CLRF        _bNum7Ch+32 
;CHi_Hub_VGCLD_driver.c,1825 :: 		bNum2Ch.OwnerScreen     = &ScreenChangePW;
	MOVLW       _ScreenChangePW+0
	MOVWF       _bNum2Ch+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       _bNum2Ch+1 
;CHi_Hub_VGCLD_driver.c,1826 :: 		bNum2Ch.Order           = 5;
	MOVLW       5
	MOVWF       _bNum2Ch+2 
;CHi_Hub_VGCLD_driver.c,1827 :: 		bNum2Ch.Left            = 40;
	MOVLW       40
	MOVWF       _bNum2Ch+3 
;CHi_Hub_VGCLD_driver.c,1828 :: 		bNum2Ch.Top             = 7;
	MOVLW       7
	MOVWF       _bNum2Ch+4 
;CHi_Hub_VGCLD_driver.c,1829 :: 		bNum2Ch.Width           = 25;
	MOVLW       25
	MOVWF       _bNum2Ch+5 
;CHi_Hub_VGCLD_driver.c,1830 :: 		bNum2Ch.Height          = 25;
	MOVLW       25
	MOVWF       _bNum2Ch+6 
;CHi_Hub_VGCLD_driver.c,1831 :: 		bNum2Ch.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum2Ch+7 
;CHi_Hub_VGCLD_driver.c,1832 :: 		bNum2Ch.Active          = 1;
	MOVLW       1
	MOVWF       _bNum2Ch+8 
;CHi_Hub_VGCLD_driver.c,1833 :: 		bNum2Ch.Caption         = bNum2Ch_Caption;
	MOVLW       _bNum2Ch_Caption+0
	MOVWF       _bNum2Ch+9 
	MOVLW       hi_addr(_bNum2Ch_Caption+0)
	MOVWF       _bNum2Ch+10 
;CHi_Hub_VGCLD_driver.c,1834 :: 		bNum2Ch.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum2Ch+11 
;CHi_Hub_VGCLD_driver.c,1835 :: 		bNum2Ch.FontName        = Tahoma19x19_Bold;
	MOVF        R0, 0 
	MOVWF       _bNum2Ch+12 
	MOVF        R1, 0 
	MOVWF       _bNum2Ch+13 
	MOVF        R2, 0 
	MOVWF       _bNum2Ch+14 
;CHi_Hub_VGCLD_driver.c,1836 :: 		bNum2Ch.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum2Ch+16 
;CHi_Hub_VGCLD_driver.c,1837 :: 		bNum2Ch.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum2Ch+15 
;CHi_Hub_VGCLD_driver.c,1838 :: 		bNum2Ch.OnUpPtr         = 0;
	CLRF        _bNum2Ch+17 
	CLRF        _bNum2Ch+18 
	CLRF        _bNum2Ch+19 
	CLRF        _bNum2Ch+20 
;CHi_Hub_VGCLD_driver.c,1839 :: 		bNum2Ch.OnDownPtr       = 0;
	CLRF        _bNum2Ch+21 
	CLRF        _bNum2Ch+22 
	CLRF        _bNum2Ch+23 
	CLRF        _bNum2Ch+24 
;CHi_Hub_VGCLD_driver.c,1840 :: 		bNum2Ch.OnClickPtr      = bNum2ChOnClick;
	MOVLW       _bNum2ChOnClick+0
	MOVWF       _bNum2Ch+25 
	MOVLW       hi_addr(_bNum2ChOnClick+0)
	MOVWF       _bNum2Ch+26 
	MOVLW       0
	MOVWF       _bNum2Ch+27 
	MOVLW       0
	MOVWF       _bNum2Ch+28 
;CHi_Hub_VGCLD_driver.c,1841 :: 		bNum2Ch.OnPressPtr      = 0;
	CLRF        _bNum2Ch+29 
	CLRF        _bNum2Ch+30 
	CLRF        _bNum2Ch+31 
	CLRF        _bNum2Ch+32 
;CHi_Hub_VGCLD_driver.c,1843 :: 		bNum5Ch.OwnerScreen     = &ScreenChangePW;
	MOVLW       _ScreenChangePW+0
	MOVWF       _bNum5Ch+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       _bNum5Ch+1 
;CHi_Hub_VGCLD_driver.c,1844 :: 		bNum5Ch.Order           = 6;
	MOVLW       6
	MOVWF       _bNum5Ch+2 
;CHi_Hub_VGCLD_driver.c,1845 :: 		bNum5Ch.Left            = 40;
	MOVLW       40
	MOVWF       _bNum5Ch+3 
;CHi_Hub_VGCLD_driver.c,1846 :: 		bNum5Ch.Top             = 36;
	MOVLW       36
	MOVWF       _bNum5Ch+4 
;CHi_Hub_VGCLD_driver.c,1847 :: 		bNum5Ch.Width           = 25;
	MOVLW       25
	MOVWF       _bNum5Ch+5 
;CHi_Hub_VGCLD_driver.c,1848 :: 		bNum5Ch.Height          = 25;
	MOVLW       25
	MOVWF       _bNum5Ch+6 
;CHi_Hub_VGCLD_driver.c,1849 :: 		bNum5Ch.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum5Ch+7 
;CHi_Hub_VGCLD_driver.c,1850 :: 		bNum5Ch.Active          = 1;
	MOVLW       1
	MOVWF       _bNum5Ch+8 
;CHi_Hub_VGCLD_driver.c,1851 :: 		bNum5Ch.Caption         = bNum5Ch_Caption;
	MOVLW       _bNum5Ch_Caption+0
	MOVWF       _bNum5Ch+9 
	MOVLW       hi_addr(_bNum5Ch_Caption+0)
	MOVWF       _bNum5Ch+10 
;CHi_Hub_VGCLD_driver.c,1852 :: 		bNum5Ch.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum5Ch+11 
;CHi_Hub_VGCLD_driver.c,1853 :: 		bNum5Ch.FontName        = Tahoma19x19_Bold;
	MOVF        R0, 0 
	MOVWF       _bNum5Ch+12 
	MOVF        R1, 0 
	MOVWF       _bNum5Ch+13 
	MOVF        R2, 0 
	MOVWF       _bNum5Ch+14 
;CHi_Hub_VGCLD_driver.c,1854 :: 		bNum5Ch.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum5Ch+16 
;CHi_Hub_VGCLD_driver.c,1855 :: 		bNum5Ch.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum5Ch+15 
;CHi_Hub_VGCLD_driver.c,1856 :: 		bNum5Ch.OnUpPtr         = 0;
	CLRF        _bNum5Ch+17 
	CLRF        _bNum5Ch+18 
	CLRF        _bNum5Ch+19 
	CLRF        _bNum5Ch+20 
;CHi_Hub_VGCLD_driver.c,1857 :: 		bNum5Ch.OnDownPtr       = 0;
	CLRF        _bNum5Ch+21 
	CLRF        _bNum5Ch+22 
	CLRF        _bNum5Ch+23 
	CLRF        _bNum5Ch+24 
;CHi_Hub_VGCLD_driver.c,1858 :: 		bNum5Ch.OnClickPtr      = bNum5ChOnClick;
	MOVLW       _bNum5ChOnClick+0
	MOVWF       _bNum5Ch+25 
	MOVLW       hi_addr(_bNum5ChOnClick+0)
	MOVWF       _bNum5Ch+26 
	MOVLW       0
	MOVWF       _bNum5Ch+27 
	MOVLW       0
	MOVWF       _bNum5Ch+28 
;CHi_Hub_VGCLD_driver.c,1859 :: 		bNum5Ch.OnPressPtr      = 0;
	CLRF        _bNum5Ch+29 
	CLRF        _bNum5Ch+30 
	CLRF        _bNum5Ch+31 
	CLRF        _bNum5Ch+32 
;CHi_Hub_VGCLD_driver.c,1861 :: 		bNum8Ch.OwnerScreen     = &ScreenChangePW;
	MOVLW       _ScreenChangePW+0
	MOVWF       _bNum8Ch+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       _bNum8Ch+1 
;CHi_Hub_VGCLD_driver.c,1862 :: 		bNum8Ch.Order           = 7;
	MOVLW       7
	MOVWF       _bNum8Ch+2 
;CHi_Hub_VGCLD_driver.c,1863 :: 		bNum8Ch.Left            = 40;
	MOVLW       40
	MOVWF       _bNum8Ch+3 
;CHi_Hub_VGCLD_driver.c,1864 :: 		bNum8Ch.Top             = 65;
	MOVLW       65
	MOVWF       _bNum8Ch+4 
;CHi_Hub_VGCLD_driver.c,1865 :: 		bNum8Ch.Width           = 25;
	MOVLW       25
	MOVWF       _bNum8Ch+5 
;CHi_Hub_VGCLD_driver.c,1866 :: 		bNum8Ch.Height          = 25;
	MOVLW       25
	MOVWF       _bNum8Ch+6 
;CHi_Hub_VGCLD_driver.c,1867 :: 		bNum8Ch.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum8Ch+7 
;CHi_Hub_VGCLD_driver.c,1868 :: 		bNum8Ch.Active          = 1;
	MOVLW       1
	MOVWF       _bNum8Ch+8 
;CHi_Hub_VGCLD_driver.c,1869 :: 		bNum8Ch.Caption         = bNum8Ch_Caption;
	MOVLW       _bNum8Ch_Caption+0
	MOVWF       _bNum8Ch+9 
	MOVLW       hi_addr(_bNum8Ch_Caption+0)
	MOVWF       _bNum8Ch+10 
;CHi_Hub_VGCLD_driver.c,1870 :: 		bNum8Ch.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum8Ch+11 
;CHi_Hub_VGCLD_driver.c,1871 :: 		bNum8Ch.FontName        = Tahoma19x19_Bold;
	MOVF        R0, 0 
	MOVWF       _bNum8Ch+12 
	MOVF        R1, 0 
	MOVWF       _bNum8Ch+13 
	MOVF        R2, 0 
	MOVWF       _bNum8Ch+14 
;CHi_Hub_VGCLD_driver.c,1872 :: 		bNum8Ch.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum8Ch+16 
;CHi_Hub_VGCLD_driver.c,1873 :: 		bNum8Ch.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum8Ch+15 
;CHi_Hub_VGCLD_driver.c,1874 :: 		bNum8Ch.OnUpPtr         = 0;
	CLRF        _bNum8Ch+17 
	CLRF        _bNum8Ch+18 
	CLRF        _bNum8Ch+19 
	CLRF        _bNum8Ch+20 
;CHi_Hub_VGCLD_driver.c,1875 :: 		bNum8Ch.OnDownPtr       = 0;
	CLRF        _bNum8Ch+21 
	CLRF        _bNum8Ch+22 
	CLRF        _bNum8Ch+23 
	CLRF        _bNum8Ch+24 
;CHi_Hub_VGCLD_driver.c,1876 :: 		bNum8Ch.OnClickPtr      = bNum8ChOnClick;
	MOVLW       _bNum8ChOnClick+0
	MOVWF       _bNum8Ch+25 
	MOVLW       hi_addr(_bNum8ChOnClick+0)
	MOVWF       _bNum8Ch+26 
	MOVLW       0
	MOVWF       _bNum8Ch+27 
	MOVLW       0
	MOVWF       _bNum8Ch+28 
;CHi_Hub_VGCLD_driver.c,1877 :: 		bNum8Ch.OnPressPtr      = 0;
	CLRF        _bNum8Ch+29 
	CLRF        _bNum8Ch+30 
	CLRF        _bNum8Ch+31 
	CLRF        _bNum8Ch+32 
;CHi_Hub_VGCLD_driver.c,1879 :: 		bNum0Ch.OwnerScreen     = &ScreenChangePW;
	MOVLW       _ScreenChangePW+0
	MOVWF       _bNum0Ch+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       _bNum0Ch+1 
;CHi_Hub_VGCLD_driver.c,1880 :: 		bNum0Ch.Order           = 8;
	MOVLW       8
	MOVWF       _bNum0Ch+2 
;CHi_Hub_VGCLD_driver.c,1881 :: 		bNum0Ch.Left            = 40;
	MOVLW       40
	MOVWF       _bNum0Ch+3 
;CHi_Hub_VGCLD_driver.c,1882 :: 		bNum0Ch.Top             = 94;
	MOVLW       94
	MOVWF       _bNum0Ch+4 
;CHi_Hub_VGCLD_driver.c,1883 :: 		bNum0Ch.Width           = 25;
	MOVLW       25
	MOVWF       _bNum0Ch+5 
;CHi_Hub_VGCLD_driver.c,1884 :: 		bNum0Ch.Height          = 25;
	MOVLW       25
	MOVWF       _bNum0Ch+6 
;CHi_Hub_VGCLD_driver.c,1885 :: 		bNum0Ch.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum0Ch+7 
;CHi_Hub_VGCLD_driver.c,1886 :: 		bNum0Ch.Active          = 1;
	MOVLW       1
	MOVWF       _bNum0Ch+8 
;CHi_Hub_VGCLD_driver.c,1887 :: 		bNum0Ch.Caption         = bNum0Ch_Caption;
	MOVLW       _bNum0Ch_Caption+0
	MOVWF       _bNum0Ch+9 
	MOVLW       hi_addr(_bNum0Ch_Caption+0)
	MOVWF       _bNum0Ch+10 
;CHi_Hub_VGCLD_driver.c,1888 :: 		bNum0Ch.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum0Ch+11 
;CHi_Hub_VGCLD_driver.c,1889 :: 		bNum0Ch.FontName        = Tahoma19x19_Bold;
	MOVF        R0, 0 
	MOVWF       _bNum0Ch+12 
	MOVF        R1, 0 
	MOVWF       _bNum0Ch+13 
	MOVF        R2, 0 
	MOVWF       _bNum0Ch+14 
;CHi_Hub_VGCLD_driver.c,1890 :: 		bNum0Ch.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum0Ch+16 
;CHi_Hub_VGCLD_driver.c,1891 :: 		bNum0Ch.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum0Ch+15 
;CHi_Hub_VGCLD_driver.c,1892 :: 		bNum0Ch.OnUpPtr         = 0;
	CLRF        _bNum0Ch+17 
	CLRF        _bNum0Ch+18 
	CLRF        _bNum0Ch+19 
	CLRF        _bNum0Ch+20 
;CHi_Hub_VGCLD_driver.c,1893 :: 		bNum0Ch.OnDownPtr       = 0;
	CLRF        _bNum0Ch+21 
	CLRF        _bNum0Ch+22 
	CLRF        _bNum0Ch+23 
	CLRF        _bNum0Ch+24 
;CHi_Hub_VGCLD_driver.c,1894 :: 		bNum0Ch.OnClickPtr      = bNum0ChOnClick;
	MOVLW       _bNum0ChOnClick+0
	MOVWF       _bNum0Ch+25 
	MOVLW       hi_addr(_bNum0ChOnClick+0)
	MOVWF       _bNum0Ch+26 
	MOVLW       0
	MOVWF       _bNum0Ch+27 
	MOVLW       0
	MOVWF       _bNum0Ch+28 
;CHi_Hub_VGCLD_driver.c,1895 :: 		bNum0Ch.OnPressPtr      = 0;
	CLRF        _bNum0Ch+29 
	CLRF        _bNum0Ch+30 
	CLRF        _bNum0Ch+31 
	CLRF        _bNum0Ch+32 
;CHi_Hub_VGCLD_driver.c,1897 :: 		bNum3Ch.OwnerScreen     = &ScreenChangePW;
	MOVLW       _ScreenChangePW+0
	MOVWF       _bNum3Ch+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       _bNum3Ch+1 
;CHi_Hub_VGCLD_driver.c,1898 :: 		bNum3Ch.Order           = 9;
	MOVLW       9
	MOVWF       _bNum3Ch+2 
;CHi_Hub_VGCLD_driver.c,1899 :: 		bNum3Ch.Left            = 69;
	MOVLW       69
	MOVWF       _bNum3Ch+3 
;CHi_Hub_VGCLD_driver.c,1900 :: 		bNum3Ch.Top             = 7;
	MOVLW       7
	MOVWF       _bNum3Ch+4 
;CHi_Hub_VGCLD_driver.c,1901 :: 		bNum3Ch.Width           = 25;
	MOVLW       25
	MOVWF       _bNum3Ch+5 
;CHi_Hub_VGCLD_driver.c,1902 :: 		bNum3Ch.Height          = 25;
	MOVLW       25
	MOVWF       _bNum3Ch+6 
;CHi_Hub_VGCLD_driver.c,1903 :: 		bNum3Ch.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum3Ch+7 
;CHi_Hub_VGCLD_driver.c,1904 :: 		bNum3Ch.Active          = 1;
	MOVLW       1
	MOVWF       _bNum3Ch+8 
;CHi_Hub_VGCLD_driver.c,1905 :: 		bNum3Ch.Caption         = bNum3Ch_Caption;
	MOVLW       _bNum3Ch_Caption+0
	MOVWF       _bNum3Ch+9 
	MOVLW       hi_addr(_bNum3Ch_Caption+0)
	MOVWF       _bNum3Ch+10 
;CHi_Hub_VGCLD_driver.c,1906 :: 		bNum3Ch.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum3Ch+11 
;CHi_Hub_VGCLD_driver.c,1907 :: 		bNum3Ch.FontName        = Tahoma19x19_Bold;
	MOVF        R0, 0 
	MOVWF       _bNum3Ch+12 
	MOVF        R1, 0 
	MOVWF       _bNum3Ch+13 
	MOVF        R2, 0 
	MOVWF       _bNum3Ch+14 
;CHi_Hub_VGCLD_driver.c,1908 :: 		bNum3Ch.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum3Ch+16 
;CHi_Hub_VGCLD_driver.c,1909 :: 		bNum3Ch.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum3Ch+15 
;CHi_Hub_VGCLD_driver.c,1910 :: 		bNum3Ch.OnUpPtr         = 0;
	CLRF        _bNum3Ch+17 
	CLRF        _bNum3Ch+18 
	CLRF        _bNum3Ch+19 
	CLRF        _bNum3Ch+20 
;CHi_Hub_VGCLD_driver.c,1911 :: 		bNum3Ch.OnDownPtr       = 0;
	CLRF        _bNum3Ch+21 
	CLRF        _bNum3Ch+22 
	CLRF        _bNum3Ch+23 
	CLRF        _bNum3Ch+24 
;CHi_Hub_VGCLD_driver.c,1912 :: 		bNum3Ch.OnClickPtr      = bNum3ChOnClick;
	MOVLW       _bNum3ChOnClick+0
	MOVWF       _bNum3Ch+25 
	MOVLW       hi_addr(_bNum3ChOnClick+0)
	MOVWF       _bNum3Ch+26 
	MOVLW       0
	MOVWF       _bNum3Ch+27 
	MOVLW       0
	MOVWF       _bNum3Ch+28 
;CHi_Hub_VGCLD_driver.c,1913 :: 		bNum3Ch.OnPressPtr      = 0;
	CLRF        _bNum3Ch+29 
	CLRF        _bNum3Ch+30 
	CLRF        _bNum3Ch+31 
	CLRF        _bNum3Ch+32 
;CHi_Hub_VGCLD_driver.c,1915 :: 		bNum6Ch.OwnerScreen     = &ScreenChangePW;
	MOVLW       _ScreenChangePW+0
	MOVWF       _bNum6Ch+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       _bNum6Ch+1 
;CHi_Hub_VGCLD_driver.c,1916 :: 		bNum6Ch.Order           = 10;
	MOVLW       10
	MOVWF       _bNum6Ch+2 
;CHi_Hub_VGCLD_driver.c,1917 :: 		bNum6Ch.Left            = 69;
	MOVLW       69
	MOVWF       _bNum6Ch+3 
;CHi_Hub_VGCLD_driver.c,1918 :: 		bNum6Ch.Top             = 36;
	MOVLW       36
	MOVWF       _bNum6Ch+4 
;CHi_Hub_VGCLD_driver.c,1919 :: 		bNum6Ch.Width           = 25;
	MOVLW       25
	MOVWF       _bNum6Ch+5 
;CHi_Hub_VGCLD_driver.c,1920 :: 		bNum6Ch.Height          = 25;
	MOVLW       25
	MOVWF       _bNum6Ch+6 
;CHi_Hub_VGCLD_driver.c,1921 :: 		bNum6Ch.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum6Ch+7 
;CHi_Hub_VGCLD_driver.c,1922 :: 		bNum6Ch.Active          = 1;
	MOVLW       1
	MOVWF       _bNum6Ch+8 
;CHi_Hub_VGCLD_driver.c,1923 :: 		bNum6Ch.Caption         = bNum6Ch_Caption;
	MOVLW       _bNum6Ch_Caption+0
	MOVWF       _bNum6Ch+9 
	MOVLW       hi_addr(_bNum6Ch_Caption+0)
	MOVWF       _bNum6Ch+10 
;CHi_Hub_VGCLD_driver.c,1924 :: 		bNum6Ch.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum6Ch+11 
;CHi_Hub_VGCLD_driver.c,1925 :: 		bNum6Ch.FontName        = Tahoma19x19_Bold;
	MOVF        R0, 0 
	MOVWF       _bNum6Ch+12 
	MOVF        R1, 0 
	MOVWF       _bNum6Ch+13 
	MOVF        R2, 0 
	MOVWF       _bNum6Ch+14 
;CHi_Hub_VGCLD_driver.c,1926 :: 		bNum6Ch.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum6Ch+16 
;CHi_Hub_VGCLD_driver.c,1927 :: 		bNum6Ch.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum6Ch+15 
;CHi_Hub_VGCLD_driver.c,1928 :: 		bNum6Ch.OnUpPtr         = 0;
	CLRF        _bNum6Ch+17 
	CLRF        _bNum6Ch+18 
	CLRF        _bNum6Ch+19 
	CLRF        _bNum6Ch+20 
;CHi_Hub_VGCLD_driver.c,1929 :: 		bNum6Ch.OnDownPtr       = 0;
	CLRF        _bNum6Ch+21 
	CLRF        _bNum6Ch+22 
	CLRF        _bNum6Ch+23 
	CLRF        _bNum6Ch+24 
;CHi_Hub_VGCLD_driver.c,1930 :: 		bNum6Ch.OnClickPtr      = bNum6ChOnClick;
	MOVLW       _bNum6ChOnClick+0
	MOVWF       _bNum6Ch+25 
	MOVLW       hi_addr(_bNum6ChOnClick+0)
	MOVWF       _bNum6Ch+26 
	MOVLW       0
	MOVWF       _bNum6Ch+27 
	MOVLW       0
	MOVWF       _bNum6Ch+28 
;CHi_Hub_VGCLD_driver.c,1931 :: 		bNum6Ch.OnPressPtr      = 0;
	CLRF        _bNum6Ch+29 
	CLRF        _bNum6Ch+30 
	CLRF        _bNum6Ch+31 
	CLRF        _bNum6Ch+32 
;CHi_Hub_VGCLD_driver.c,1933 :: 		bNum9Ch.OwnerScreen     = &ScreenChangePW;
	MOVLW       _ScreenChangePW+0
	MOVWF       _bNum9Ch+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       _bNum9Ch+1 
;CHi_Hub_VGCLD_driver.c,1934 :: 		bNum9Ch.Order           = 11;
	MOVLW       11
	MOVWF       _bNum9Ch+2 
;CHi_Hub_VGCLD_driver.c,1935 :: 		bNum9Ch.Left            = 68;
	MOVLW       68
	MOVWF       _bNum9Ch+3 
;CHi_Hub_VGCLD_driver.c,1936 :: 		bNum9Ch.Top             = 65;
	MOVLW       65
	MOVWF       _bNum9Ch+4 
;CHi_Hub_VGCLD_driver.c,1937 :: 		bNum9Ch.Width           = 25;
	MOVLW       25
	MOVWF       _bNum9Ch+5 
;CHi_Hub_VGCLD_driver.c,1938 :: 		bNum9Ch.Height          = 25;
	MOVLW       25
	MOVWF       _bNum9Ch+6 
;CHi_Hub_VGCLD_driver.c,1939 :: 		bNum9Ch.Visible         = 1;
	MOVLW       1
	MOVWF       _bNum9Ch+7 
;CHi_Hub_VGCLD_driver.c,1940 :: 		bNum9Ch.Active          = 1;
	MOVLW       1
	MOVWF       _bNum9Ch+8 
;CHi_Hub_VGCLD_driver.c,1941 :: 		bNum9Ch.Caption         = bNum9Ch_Caption;
	MOVLW       _bNum9Ch_Caption+0
	MOVWF       _bNum9Ch+9 
	MOVLW       hi_addr(_bNum9Ch_Caption+0)
	MOVWF       _bNum9Ch+10 
;CHi_Hub_VGCLD_driver.c,1942 :: 		bNum9Ch.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bNum9Ch+11 
;CHi_Hub_VGCLD_driver.c,1943 :: 		bNum9Ch.FontName        = Tahoma19x19_Bold;
	MOVF        R0, 0 
	MOVWF       _bNum9Ch+12 
	MOVF        R1, 0 
	MOVWF       _bNum9Ch+13 
	MOVF        R2, 0 
	MOVWF       _bNum9Ch+14 
;CHi_Hub_VGCLD_driver.c,1944 :: 		bNum9Ch.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bNum9Ch+16 
;CHi_Hub_VGCLD_driver.c,1945 :: 		bNum9Ch.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bNum9Ch+15 
;CHi_Hub_VGCLD_driver.c,1946 :: 		bNum9Ch.OnUpPtr         = 0;
	CLRF        _bNum9Ch+17 
	CLRF        _bNum9Ch+18 
	CLRF        _bNum9Ch+19 
	CLRF        _bNum9Ch+20 
;CHi_Hub_VGCLD_driver.c,1947 :: 		bNum9Ch.OnDownPtr       = 0;
	CLRF        _bNum9Ch+21 
	CLRF        _bNum9Ch+22 
	CLRF        _bNum9Ch+23 
	CLRF        _bNum9Ch+24 
;CHi_Hub_VGCLD_driver.c,1948 :: 		bNum9Ch.OnClickPtr      = bNum9ChOnClick;
	MOVLW       _bNum9ChOnClick+0
	MOVWF       _bNum9Ch+25 
	MOVLW       hi_addr(_bNum9ChOnClick+0)
	MOVWF       _bNum9Ch+26 
	MOVLW       0
	MOVWF       _bNum9Ch+27 
	MOVLW       0
	MOVWF       _bNum9Ch+28 
;CHi_Hub_VGCLD_driver.c,1949 :: 		bNum9Ch.OnPressPtr      = 0;
	CLRF        _bNum9Ch+29 
	CLRF        _bNum9Ch+30 
	CLRF        _bNum9Ch+31 
	CLRF        _bNum9Ch+32 
;CHi_Hub_VGCLD_driver.c,1951 :: 		bChPWCancel.OwnerScreen     = &ScreenChangePW;
	MOVLW       _ScreenChangePW+0
	MOVWF       _bChPWCancel+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       _bChPWCancel+1 
;CHi_Hub_VGCLD_driver.c,1952 :: 		bChPWCancel.Order           = 12;
	MOVLW       12
	MOVWF       _bChPWCancel+2 
;CHi_Hub_VGCLD_driver.c,1953 :: 		bChPWCancel.Left            = 177;
	MOVLW       177
	MOVWF       _bChPWCancel+3 
;CHi_Hub_VGCLD_driver.c,1954 :: 		bChPWCancel.Top             = 80;
	MOVLW       80
	MOVWF       _bChPWCancel+4 
;CHi_Hub_VGCLD_driver.c,1955 :: 		bChPWCancel.Width           = 60;
	MOVLW       60
	MOVWF       _bChPWCancel+5 
;CHi_Hub_VGCLD_driver.c,1956 :: 		bChPWCancel.Height          = 36;
	MOVLW       36
	MOVWF       _bChPWCancel+6 
;CHi_Hub_VGCLD_driver.c,1957 :: 		bChPWCancel.Visible         = 1;
	MOVLW       1
	MOVWF       _bChPWCancel+7 
;CHi_Hub_VGCLD_driver.c,1958 :: 		bChPWCancel.Active          = 1;
	MOVLW       1
	MOVWF       _bChPWCancel+8 
;CHi_Hub_VGCLD_driver.c,1959 :: 		bChPWCancel.Caption         = bChPWCancel_Caption;
	MOVLW       _bChPWCancel_Caption+0
	MOVWF       _bChPWCancel+9 
	MOVLW       hi_addr(_bChPWCancel_Caption+0)
	MOVWF       _bChPWCancel+10 
;CHi_Hub_VGCLD_driver.c,1960 :: 		bChPWCancel.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bChPWCancel+11 
;CHi_Hub_VGCLD_driver.c,1961 :: 		bChPWCancel.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _bChPWCancel+12 
	MOVF        R7, 0 
	MOVWF       _bChPWCancel+13 
	MOVF        R8, 0 
	MOVWF       _bChPWCancel+14 
;CHi_Hub_VGCLD_driver.c,1962 :: 		bChPWCancel.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bChPWCancel+16 
;CHi_Hub_VGCLD_driver.c,1963 :: 		bChPWCancel.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bChPWCancel+15 
;CHi_Hub_VGCLD_driver.c,1964 :: 		bChPWCancel.OnUpPtr         = 0;
	CLRF        _bChPWCancel+17 
	CLRF        _bChPWCancel+18 
	CLRF        _bChPWCancel+19 
	CLRF        _bChPWCancel+20 
;CHi_Hub_VGCLD_driver.c,1965 :: 		bChPWCancel.OnDownPtr       = 0;
	CLRF        _bChPWCancel+21 
	CLRF        _bChPWCancel+22 
	CLRF        _bChPWCancel+23 
	CLRF        _bChPWCancel+24 
;CHi_Hub_VGCLD_driver.c,1966 :: 		bChPWCancel.OnClickPtr      = bChPWCancelOnClick;
	MOVLW       _bChPWCancelOnClick+0
	MOVWF       _bChPWCancel+25 
	MOVLW       hi_addr(_bChPWCancelOnClick+0)
	MOVWF       _bChPWCancel+26 
	MOVLW       0
	MOVWF       _bChPWCancel+27 
	MOVLW       0
	MOVWF       _bChPWCancel+28 
;CHi_Hub_VGCLD_driver.c,1967 :: 		bChPWCancel.OnPressPtr      = 0;
	CLRF        _bChPWCancel+29 
	CLRF        _bChPWCancel+30 
	CLRF        _bChPWCancel+31 
	CLRF        _bChPWCancel+32 
;CHi_Hub_VGCLD_driver.c,1969 :: 		lChPWLabel.OwnerScreen     = &ScreenChangePW;
	MOVLW       _ScreenChangePW+0
	MOVWF       _lChPWLabel+0 
	MOVLW       hi_addr(_ScreenChangePW+0)
	MOVWF       _lChPWLabel+1 
;CHi_Hub_VGCLD_driver.c,1970 :: 		lChPWLabel.Order           = 15;
	MOVLW       15
	MOVWF       _lChPWLabel+2 
;CHi_Hub_VGCLD_driver.c,1971 :: 		lChPWLabel.Left            = 124;
	MOVLW       124
	MOVWF       _lChPWLabel+3 
;CHi_Hub_VGCLD_driver.c,1972 :: 		lChPWLabel.Top             = 38;
	MOVLW       38
	MOVWF       _lChPWLabel+4 
;CHi_Hub_VGCLD_driver.c,1973 :: 		lChPWLabel.Width           = 0;
	CLRF        _lChPWLabel+5 
;CHi_Hub_VGCLD_driver.c,1974 :: 		lChPWLabel.Height          = 17;
	MOVLW       17
	MOVWF       _lChPWLabel+6 
;CHi_Hub_VGCLD_driver.c,1975 :: 		lChPWLabel.Visible         = 1;
	MOVLW       1
	MOVWF       _lChPWLabel+13 
;CHi_Hub_VGCLD_driver.c,1976 :: 		lChPWLabel.Active          = 1;
	MOVLW       1
	MOVWF       _lChPWLabel+14 
;CHi_Hub_VGCLD_driver.c,1977 :: 		lChPWLabel.Caption         = lChPWLabel_Caption;
	MOVLW       _lChPWLabel_Caption+0
	MOVWF       _lChPWLabel+7 
	MOVLW       hi_addr(_lChPWLabel_Caption+0)
	MOVWF       _lChPWLabel+8 
;CHi_Hub_VGCLD_driver.c,1978 :: 		lChPWLabel.FontName        = Tahoma14x16_Bold;
	MOVF        R6, 0 
	MOVWF       _lChPWLabel+9 
	MOVF        R7, 0 
	MOVWF       _lChPWLabel+10 
	MOVF        R8, 0 
	MOVWF       _lChPWLabel+11 
;CHi_Hub_VGCLD_driver.c,1979 :: 		lChPWLabel.Font_Color      = T6963C_WHITE;
	MOVLW       8
	MOVWF       _lChPWLabel+12 
;CHi_Hub_VGCLD_driver.c,1980 :: 		lChPWLabel.OnUpPtr         = 0;
	CLRF        _lChPWLabel+15 
	CLRF        _lChPWLabel+16 
	CLRF        _lChPWLabel+17 
	CLRF        _lChPWLabel+18 
;CHi_Hub_VGCLD_driver.c,1981 :: 		lChPWLabel.OnDownPtr       = 0;
	CLRF        _lChPWLabel+19 
	CLRF        _lChPWLabel+20 
	CLRF        _lChPWLabel+21 
	CLRF        _lChPWLabel+22 
;CHi_Hub_VGCLD_driver.c,1982 :: 		lChPWLabel.OnClickPtr      = 0;
	CLRF        _lChPWLabel+23 
	CLRF        _lChPWLabel+24 
	CLRF        _lChPWLabel+25 
	CLRF        _lChPWLabel+26 
;CHi_Hub_VGCLD_driver.c,1983 :: 		lChPWLabel.OnPressPtr      = 0;
	CLRF        _lChPWLabel+27 
	CLRF        _lChPWLabel+28 
	CLRF        _lChPWLabel+29 
	CLRF        _lChPWLabel+30 
;CHi_Hub_VGCLD_driver.c,1985 :: 		bDimChBack.OwnerScreen     = &ScreenChDimLevel;
	MOVLW       _ScreenChDimLevel+0
	MOVWF       _bDimChBack+0 
	MOVLW       hi_addr(_ScreenChDimLevel+0)
	MOVWF       _bDimChBack+1 
;CHi_Hub_VGCLD_driver.c,1986 :: 		bDimChBack.Order           = 11;
	MOVLW       11
	MOVWF       _bDimChBack+2 
;CHi_Hub_VGCLD_driver.c,1987 :: 		bDimChBack.Left            = 191;
	MOVLW       191
	MOVWF       _bDimChBack+3 
;CHi_Hub_VGCLD_driver.c,1988 :: 		bDimChBack.Top             = 102;
	MOVLW       102
	MOVWF       _bDimChBack+4 
;CHi_Hub_VGCLD_driver.c,1989 :: 		bDimChBack.Width           = 42;
	MOVLW       42
	MOVWF       _bDimChBack+5 
;CHi_Hub_VGCLD_driver.c,1990 :: 		bDimChBack.Height          = 22;
	MOVLW       22
	MOVWF       _bDimChBack+6 
;CHi_Hub_VGCLD_driver.c,1991 :: 		bDimChBack.Visible         = 1;
	MOVLW       1
	MOVWF       _bDimChBack+7 
;CHi_Hub_VGCLD_driver.c,1992 :: 		bDimChBack.Active          = 1;
	MOVLW       1
	MOVWF       _bDimChBack+8 
;CHi_Hub_VGCLD_driver.c,1993 :: 		bDimChBack.Caption         = bDimChBack_Caption;
	MOVLW       _bDimChBack_Caption+0
	MOVWF       _bDimChBack+9 
	MOVLW       hi_addr(_bDimChBack_Caption+0)
	MOVWF       _bDimChBack+10 
;CHi_Hub_VGCLD_driver.c,1994 :: 		bDimChBack.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bDimChBack+11 
;CHi_Hub_VGCLD_driver.c,1995 :: 		bDimChBack.FontName        = Tahoma12x11_Bold;
	MOVF        R3, 0 
	MOVWF       _bDimChBack+12 
	MOVF        R4, 0 
	MOVWF       _bDimChBack+13 
	MOVF        R5, 0 
	MOVWF       _bDimChBack+14 
;CHi_Hub_VGCLD_driver.c,1996 :: 		bDimChBack.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bDimChBack+16 
;CHi_Hub_VGCLD_driver.c,1997 :: 		bDimChBack.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bDimChBack+15 
;CHi_Hub_VGCLD_driver.c,1998 :: 		bDimChBack.OnUpPtr         = 0;
	CLRF        _bDimChBack+17 
	CLRF        _bDimChBack+18 
	CLRF        _bDimChBack+19 
	CLRF        _bDimChBack+20 
;CHi_Hub_VGCLD_driver.c,1999 :: 		bDimChBack.OnDownPtr       = 0;
	CLRF        _bDimChBack+21 
	CLRF        _bDimChBack+22 
	CLRF        _bDimChBack+23 
	CLRF        _bDimChBack+24 
;CHi_Hub_VGCLD_driver.c,2000 :: 		bDimChBack.OnClickPtr      = bDimChBackOnClick;
	MOVLW       _bDimChBackOnClick+0
	MOVWF       _bDimChBack+25 
	MOVLW       hi_addr(_bDimChBackOnClick+0)
	MOVWF       _bDimChBack+26 
	MOVLW       0
	MOVWF       _bDimChBack+27 
	MOVLW       0
	MOVWF       _bDimChBack+28 
;CHi_Hub_VGCLD_driver.c,2001 :: 		bDimChBack.OnPressPtr      = 0;
	CLRF        _bDimChBack+29 
	CLRF        _bDimChBack+30 
	CLRF        _bDimChBack+31 
	CLRF        _bDimChBack+32 
;CHi_Hub_VGCLD_driver.c,2003 :: 		bAdminReturn2.OwnerScreen     = &ScreenAdmin2;
	MOVLW       _ScreenAdmin2+0
	MOVWF       _bAdminReturn2+0 
	MOVLW       hi_addr(_ScreenAdmin2+0)
	MOVWF       _bAdminReturn2+1 
;CHi_Hub_VGCLD_driver.c,2004 :: 		bAdminReturn2.Order           = 0;
	CLRF        _bAdminReturn2+2 
;CHi_Hub_VGCLD_driver.c,2005 :: 		bAdminReturn2.Left            = 7;
	MOVLW       7
	MOVWF       _bAdminReturn2+3 
;CHi_Hub_VGCLD_driver.c,2006 :: 		bAdminReturn2.Top             = 4;
	MOVLW       4
	MOVWF       _bAdminReturn2+4 
;CHi_Hub_VGCLD_driver.c,2007 :: 		bAdminReturn2.Width           = 35;
	MOVLW       35
	MOVWF       _bAdminReturn2+5 
;CHi_Hub_VGCLD_driver.c,2008 :: 		bAdminReturn2.Height          = 15;
	MOVLW       15
	MOVWF       _bAdminReturn2+6 
;CHi_Hub_VGCLD_driver.c,2009 :: 		bAdminReturn2.Visible         = 1;
	MOVLW       1
	MOVWF       _bAdminReturn2+7 
;CHi_Hub_VGCLD_driver.c,2010 :: 		bAdminReturn2.Active          = 1;
	MOVLW       1
	MOVWF       _bAdminReturn2+8 
;CHi_Hub_VGCLD_driver.c,2011 :: 		bAdminReturn2.Caption         = bAdminReturn2_Caption;
	MOVLW       _bAdminReturn2_Caption+0
	MOVWF       _bAdminReturn2+9 
	MOVLW       hi_addr(_bAdminReturn2_Caption+0)
	MOVWF       _bAdminReturn2+10 
;CHi_Hub_VGCLD_driver.c,2012 :: 		bAdminReturn2.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bAdminReturn2+11 
;CHi_Hub_VGCLD_driver.c,2013 :: 		bAdminReturn2.FontName        = Tahoma12x11_Bold;
	MOVF        R3, 0 
	MOVWF       _bAdminReturn2+12 
	MOVF        R4, 0 
	MOVWF       _bAdminReturn2+13 
	MOVF        R5, 0 
	MOVWF       _bAdminReturn2+14 
;CHi_Hub_VGCLD_driver.c,2014 :: 		bAdminReturn2.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bAdminReturn2+16 
;CHi_Hub_VGCLD_driver.c,2015 :: 		bAdminReturn2.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bAdminReturn2+15 
;CHi_Hub_VGCLD_driver.c,2016 :: 		bAdminReturn2.OnUpPtr         = 0;
	CLRF        _bAdminReturn2+17 
	CLRF        _bAdminReturn2+18 
	CLRF        _bAdminReturn2+19 
	CLRF        _bAdminReturn2+20 
;CHi_Hub_VGCLD_driver.c,2017 :: 		bAdminReturn2.OnDownPtr       = 0;
	CLRF        _bAdminReturn2+21 
	CLRF        _bAdminReturn2+22 
	CLRF        _bAdminReturn2+23 
	CLRF        _bAdminReturn2+24 
;CHi_Hub_VGCLD_driver.c,2018 :: 		bAdminReturn2.OnClickPtr      = bAdminReturn2OnClick;
	MOVLW       _bAdminReturn2OnClick+0
	MOVWF       _bAdminReturn2+25 
	MOVLW       hi_addr(_bAdminReturn2OnClick+0)
	MOVWF       _bAdminReturn2+26 
	MOVLW       0
	MOVWF       _bAdminReturn2+27 
	MOVLW       0
	MOVWF       _bAdminReturn2+28 
;CHi_Hub_VGCLD_driver.c,2019 :: 		bAdminReturn2.OnPressPtr      = 0;
	CLRF        _bAdminReturn2+29 
	CLRF        _bAdminReturn2+30 
	CLRF        _bAdminReturn2+31 
	CLRF        _bAdminReturn2+32 
;CHi_Hub_VGCLD_driver.c,2021 :: 		bCalTouch.OwnerScreen     = &ScreenAdmin2;
	MOVLW       _ScreenAdmin2+0
	MOVWF       _bCalTouch+0 
	MOVLW       hi_addr(_ScreenAdmin2+0)
	MOVWF       _bCalTouch+1 
;CHi_Hub_VGCLD_driver.c,2022 :: 		bCalTouch.Order           = 1;
	MOVLW       1
	MOVWF       _bCalTouch+2 
;CHi_Hub_VGCLD_driver.c,2023 :: 		bCalTouch.Left            = 7;
	MOVLW       7
	MOVWF       _bCalTouch+3 
;CHi_Hub_VGCLD_driver.c,2024 :: 		bCalTouch.Top             = 30;
	MOVLW       30
	MOVWF       _bCalTouch+4 
;CHi_Hub_VGCLD_driver.c,2025 :: 		bCalTouch.Width           = 88;
	MOVLW       88
	MOVWF       _bCalTouch+5 
;CHi_Hub_VGCLD_driver.c,2026 :: 		bCalTouch.Height          = 20;
	MOVLW       20
	MOVWF       _bCalTouch+6 
;CHi_Hub_VGCLD_driver.c,2027 :: 		bCalTouch.Visible         = 1;
	MOVLW       1
	MOVWF       _bCalTouch+7 
;CHi_Hub_VGCLD_driver.c,2028 :: 		bCalTouch.Active          = 1;
	MOVLW       1
	MOVWF       _bCalTouch+8 
;CHi_Hub_VGCLD_driver.c,2029 :: 		bCalTouch.Caption         = bCalTouch_Caption;
	MOVLW       _bCalTouch_Caption+0
	MOVWF       _bCalTouch+9 
	MOVLW       hi_addr(_bCalTouch_Caption+0)
	MOVWF       _bCalTouch+10 
;CHi_Hub_VGCLD_driver.c,2030 :: 		bCalTouch.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bCalTouch+11 
;CHi_Hub_VGCLD_driver.c,2031 :: 		bCalTouch.FontName        = T6963C_defaultFont;
	MOVLW       _T6963C_defaultFont+0
	MOVWF       _bCalTouch+12 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       _bCalTouch+13 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       _bCalTouch+14 
;CHi_Hub_VGCLD_driver.c,2032 :: 		bCalTouch.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bCalTouch+16 
;CHi_Hub_VGCLD_driver.c,2033 :: 		bCalTouch.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bCalTouch+15 
;CHi_Hub_VGCLD_driver.c,2034 :: 		bCalTouch.OnUpPtr         = 0;
	CLRF        _bCalTouch+17 
	CLRF        _bCalTouch+18 
	CLRF        _bCalTouch+19 
	CLRF        _bCalTouch+20 
;CHi_Hub_VGCLD_driver.c,2035 :: 		bCalTouch.OnDownPtr       = 0;
	CLRF        _bCalTouch+21 
	CLRF        _bCalTouch+22 
	CLRF        _bCalTouch+23 
	CLRF        _bCalTouch+24 
;CHi_Hub_VGCLD_driver.c,2036 :: 		bCalTouch.OnClickPtr      = bCalTouchOnClick;
	MOVLW       _bCalTouchOnClick+0
	MOVWF       _bCalTouch+25 
	MOVLW       hi_addr(_bCalTouchOnClick+0)
	MOVWF       _bCalTouch+26 
	MOVLW       0
	MOVWF       _bCalTouch+27 
	MOVLW       0
	MOVWF       _bCalTouch+28 
;CHi_Hub_VGCLD_driver.c,2037 :: 		bCalTouch.OnPressPtr      = 0;
	CLRF        _bCalTouch+29 
	CLRF        _bCalTouch+30 
	CLRF        _bCalTouch+31 
	CLRF        _bCalTouch+32 
;CHi_Hub_VGCLD_driver.c,2039 :: 		bFlashChair.OwnerScreen     = &ScreenAdmin2;
	MOVLW       _ScreenAdmin2+0
	MOVWF       _bFlashChair+0 
	MOVLW       hi_addr(_ScreenAdmin2+0)
	MOVWF       _bFlashChair+1 
;CHi_Hub_VGCLD_driver.c,2040 :: 		bFlashChair.Order           = 2;
	MOVLW       2
	MOVWF       _bFlashChair+2 
;CHi_Hub_VGCLD_driver.c,2041 :: 		bFlashChair.Left            = 7;
	MOVLW       7
	MOVWF       _bFlashChair+3 
;CHi_Hub_VGCLD_driver.c,2042 :: 		bFlashChair.Top             = 57;
	MOVLW       57
	MOVWF       _bFlashChair+4 
;CHi_Hub_VGCLD_driver.c,2043 :: 		bFlashChair.Width           = 88;
	MOVLW       88
	MOVWF       _bFlashChair+5 
;CHi_Hub_VGCLD_driver.c,2044 :: 		bFlashChair.Height          = 20;
	MOVLW       20
	MOVWF       _bFlashChair+6 
;CHi_Hub_VGCLD_driver.c,2045 :: 		bFlashChair.Visible         = 1;
	MOVLW       1
	MOVWF       _bFlashChair+7 
;CHi_Hub_VGCLD_driver.c,2046 :: 		bFlashChair.Active          = 1;
	MOVLW       1
	MOVWF       _bFlashChair+8 
;CHi_Hub_VGCLD_driver.c,2047 :: 		bFlashChair.Caption         = bFlashChair_Caption;
	MOVLW       _bFlashChair_Caption+0
	MOVWF       _bFlashChair+9 
	MOVLW       hi_addr(_bFlashChair_Caption+0)
	MOVWF       _bFlashChair+10 
;CHi_Hub_VGCLD_driver.c,2048 :: 		bFlashChair.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bFlashChair+11 
;CHi_Hub_VGCLD_driver.c,2049 :: 		bFlashChair.FontName        = T6963C_defaultFont;
	MOVLW       _T6963C_defaultFont+0
	MOVWF       _bFlashChair+12 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       _bFlashChair+13 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       _bFlashChair+14 
;CHi_Hub_VGCLD_driver.c,2050 :: 		bFlashChair.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bFlashChair+16 
;CHi_Hub_VGCLD_driver.c,2051 :: 		bFlashChair.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bFlashChair+15 
;CHi_Hub_VGCLD_driver.c,2052 :: 		bFlashChair.OnUpPtr         = 0;
	CLRF        _bFlashChair+17 
	CLRF        _bFlashChair+18 
	CLRF        _bFlashChair+19 
	CLRF        _bFlashChair+20 
;CHi_Hub_VGCLD_driver.c,2053 :: 		bFlashChair.OnDownPtr       = 0;
	CLRF        _bFlashChair+21 
	CLRF        _bFlashChair+22 
	CLRF        _bFlashChair+23 
	CLRF        _bFlashChair+24 
;CHi_Hub_VGCLD_driver.c,2054 :: 		bFlashChair.OnClickPtr      = bFlashChairOnClick;
	MOVLW       _bFlashChairOnClick+0
	MOVWF       _bFlashChair+25 
	MOVLW       hi_addr(_bFlashChairOnClick+0)
	MOVWF       _bFlashChair+26 
	MOVLW       0
	MOVWF       _bFlashChair+27 
	MOVLW       0
	MOVWF       _bFlashChair+28 
;CHi_Hub_VGCLD_driver.c,2055 :: 		bFlashChair.OnPressPtr      = 0;
	CLRF        _bFlashChair+29 
	CLRF        _bFlashChair+30 
	CLRF        _bFlashChair+31 
	CLRF        _bFlashChair+32 
;CHi_Hub_VGCLD_driver.c,2057 :: 		bDisplayCals.OwnerScreen     = &ScreenAdmin2;
	MOVLW       _ScreenAdmin2+0
	MOVWF       _bDisplayCals+0 
	MOVLW       hi_addr(_ScreenAdmin2+0)
	MOVWF       _bDisplayCals+1 
;CHi_Hub_VGCLD_driver.c,2058 :: 		bDisplayCals.Order           = 3;
	MOVLW       3
	MOVWF       _bDisplayCals+2 
;CHi_Hub_VGCLD_driver.c,2059 :: 		bDisplayCals.Left            = 7;
	MOVLW       7
	MOVWF       _bDisplayCals+3 
;CHi_Hub_VGCLD_driver.c,2060 :: 		bDisplayCals.Top             = 84;
	MOVLW       84
	MOVWF       _bDisplayCals+4 
;CHi_Hub_VGCLD_driver.c,2061 :: 		bDisplayCals.Width           = 88;
	MOVLW       88
	MOVWF       _bDisplayCals+5 
;CHi_Hub_VGCLD_driver.c,2062 :: 		bDisplayCals.Height          = 20;
	MOVLW       20
	MOVWF       _bDisplayCals+6 
;CHi_Hub_VGCLD_driver.c,2063 :: 		bDisplayCals.Visible         = 1;
	MOVLW       1
	MOVWF       _bDisplayCals+7 
;CHi_Hub_VGCLD_driver.c,2064 :: 		bDisplayCals.Active          = 1;
	MOVLW       1
	MOVWF       _bDisplayCals+8 
;CHi_Hub_VGCLD_driver.c,2065 :: 		bDisplayCals.Caption         = bDisplayCals_Caption;
	MOVLW       _bDisplayCals_Caption+0
	MOVWF       _bDisplayCals+9 
	MOVLW       hi_addr(_bDisplayCals_Caption+0)
	MOVWF       _bDisplayCals+10 
;CHi_Hub_VGCLD_driver.c,2066 :: 		bDisplayCals.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bDisplayCals+11 
;CHi_Hub_VGCLD_driver.c,2067 :: 		bDisplayCals.FontName        = T6963C_defaultFont;
	MOVLW       _T6963C_defaultFont+0
	MOVWF       _bDisplayCals+12 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       _bDisplayCals+13 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       _bDisplayCals+14 
;CHi_Hub_VGCLD_driver.c,2068 :: 		bDisplayCals.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bDisplayCals+16 
;CHi_Hub_VGCLD_driver.c,2069 :: 		bDisplayCals.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bDisplayCals+15 
;CHi_Hub_VGCLD_driver.c,2070 :: 		bDisplayCals.OnUpPtr         = 0;
	CLRF        _bDisplayCals+17 
	CLRF        _bDisplayCals+18 
	CLRF        _bDisplayCals+19 
	CLRF        _bDisplayCals+20 
;CHi_Hub_VGCLD_driver.c,2071 :: 		bDisplayCals.OnDownPtr       = 0;
	CLRF        _bDisplayCals+21 
	CLRF        _bDisplayCals+22 
	CLRF        _bDisplayCals+23 
	CLRF        _bDisplayCals+24 
;CHi_Hub_VGCLD_driver.c,2072 :: 		bDisplayCals.OnClickPtr      = bDisplayCalsOnClick;
	MOVLW       _bDisplayCalsOnClick+0
	MOVWF       _bDisplayCals+25 
	MOVLW       hi_addr(_bDisplayCalsOnClick+0)
	MOVWF       _bDisplayCals+26 
	MOVLW       0
	MOVWF       _bDisplayCals+27 
	MOVLW       0
	MOVWF       _bDisplayCals+28 
;CHi_Hub_VGCLD_driver.c,2073 :: 		bDisplayCals.OnPressPtr      = 0;
	CLRF        _bDisplayCals+29 
	CLRF        _bDisplayCals+30 
	CLRF        _bDisplayCals+31 
	CLRF        _bDisplayCals+32 
;CHi_Hub_VGCLD_driver.c,2075 :: 		bEnableKidLock.OwnerScreen     = &ScreenAdmin2;
	MOVLW       _ScreenAdmin2+0
	MOVWF       _bEnableKidLock+0 
	MOVLW       hi_addr(_ScreenAdmin2+0)
	MOVWF       _bEnableKidLock+1 
;CHi_Hub_VGCLD_driver.c,2076 :: 		bEnableKidLock.Order           = 4;
	MOVLW       4
	MOVWF       _bEnableKidLock+2 
;CHi_Hub_VGCLD_driver.c,2077 :: 		bEnableKidLock.Left            = 122;
	MOVLW       122
	MOVWF       _bEnableKidLock+3 
;CHi_Hub_VGCLD_driver.c,2078 :: 		bEnableKidLock.Top             = 30;
	MOVLW       30
	MOVWF       _bEnableKidLock+4 
;CHi_Hub_VGCLD_driver.c,2079 :: 		bEnableKidLock.Width           = 88;
	MOVLW       88
	MOVWF       _bEnableKidLock+5 
;CHi_Hub_VGCLD_driver.c,2080 :: 		bEnableKidLock.Height          = 20;
	MOVLW       20
	MOVWF       _bEnableKidLock+6 
;CHi_Hub_VGCLD_driver.c,2081 :: 		bEnableKidLock.Visible         = 1;
	MOVLW       1
	MOVWF       _bEnableKidLock+7 
;CHi_Hub_VGCLD_driver.c,2082 :: 		bEnableKidLock.Active          = 1;
	MOVLW       1
	MOVWF       _bEnableKidLock+8 
;CHi_Hub_VGCLD_driver.c,2083 :: 		bEnableKidLock.Caption         = bEnableKidLock_Caption;
	MOVLW       _bEnableKidLock_Caption+0
	MOVWF       _bEnableKidLock+9 
	MOVLW       hi_addr(_bEnableKidLock_Caption+0)
	MOVWF       _bEnableKidLock+10 
;CHi_Hub_VGCLD_driver.c,2084 :: 		bEnableKidLock.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bEnableKidLock+11 
;CHi_Hub_VGCLD_driver.c,2085 :: 		bEnableKidLock.FontName        = T6963C_defaultFont;
	MOVLW       _T6963C_defaultFont+0
	MOVWF       _bEnableKidLock+12 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       _bEnableKidLock+13 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       _bEnableKidLock+14 
;CHi_Hub_VGCLD_driver.c,2086 :: 		bEnableKidLock.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bEnableKidLock+16 
;CHi_Hub_VGCLD_driver.c,2087 :: 		bEnableKidLock.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bEnableKidLock+15 
;CHi_Hub_VGCLD_driver.c,2088 :: 		bEnableKidLock.OnUpPtr         = 0;
	CLRF        _bEnableKidLock+17 
	CLRF        _bEnableKidLock+18 
	CLRF        _bEnableKidLock+19 
	CLRF        _bEnableKidLock+20 
;CHi_Hub_VGCLD_driver.c,2089 :: 		bEnableKidLock.OnDownPtr       = 0;
	CLRF        _bEnableKidLock+21 
	CLRF        _bEnableKidLock+22 
	CLRF        _bEnableKidLock+23 
	CLRF        _bEnableKidLock+24 
;CHi_Hub_VGCLD_driver.c,2090 :: 		bEnableKidLock.OnClickPtr      = bEnableKidLockOnClick;
	MOVLW       _bEnableKidLockOnClick+0
	MOVWF       _bEnableKidLock+25 
	MOVLW       hi_addr(_bEnableKidLockOnClick+0)
	MOVWF       _bEnableKidLock+26 
	MOVLW       0
	MOVWF       _bEnableKidLock+27 
	MOVLW       0
	MOVWF       _bEnableKidLock+28 
;CHi_Hub_VGCLD_driver.c,2091 :: 		bEnableKidLock.OnPressPtr      = 0;
	CLRF        _bEnableKidLock+29 
	CLRF        _bEnableKidLock+30 
	CLRF        _bEnableKidLock+31 
	CLRF        _bEnableKidLock+32 
;CHi_Hub_VGCLD_driver.c,2093 :: 		bDisableKidLock.OwnerScreen     = &ScreenAdmin2;
	MOVLW       _ScreenAdmin2+0
	MOVWF       _bDisableKidLock+0 
	MOVLW       hi_addr(_ScreenAdmin2+0)
	MOVWF       _bDisableKidLock+1 
;CHi_Hub_VGCLD_driver.c,2094 :: 		bDisableKidLock.Order           = 5;
	MOVLW       5
	MOVWF       _bDisableKidLock+2 
;CHi_Hub_VGCLD_driver.c,2095 :: 		bDisableKidLock.Left            = 122;
	MOVLW       122
	MOVWF       _bDisableKidLock+3 
;CHi_Hub_VGCLD_driver.c,2096 :: 		bDisableKidLock.Top             = 57;
	MOVLW       57
	MOVWF       _bDisableKidLock+4 
;CHi_Hub_VGCLD_driver.c,2097 :: 		bDisableKidLock.Width           = 88;
	MOVLW       88
	MOVWF       _bDisableKidLock+5 
;CHi_Hub_VGCLD_driver.c,2098 :: 		bDisableKidLock.Height          = 20;
	MOVLW       20
	MOVWF       _bDisableKidLock+6 
;CHi_Hub_VGCLD_driver.c,2099 :: 		bDisableKidLock.Visible         = 1;
	MOVLW       1
	MOVWF       _bDisableKidLock+7 
;CHi_Hub_VGCLD_driver.c,2100 :: 		bDisableKidLock.Active          = 1;
	MOVLW       1
	MOVWF       _bDisableKidLock+8 
;CHi_Hub_VGCLD_driver.c,2101 :: 		bDisableKidLock.Caption         = bDisableKidLock_Caption;
	MOVLW       _bDisableKidLock_Caption+0
	MOVWF       _bDisableKidLock+9 
	MOVLW       hi_addr(_bDisableKidLock_Caption+0)
	MOVWF       _bDisableKidLock+10 
;CHi_Hub_VGCLD_driver.c,2102 :: 		bDisableKidLock.TextAlign       = _taCenter;
	MOVLW       1
	MOVWF       _bDisableKidLock+11 
;CHi_Hub_VGCLD_driver.c,2103 :: 		bDisableKidLock.FontName        = T6963C_defaultFont;
	MOVLW       _T6963C_defaultFont+0
	MOVWF       _bDisableKidLock+12 
	MOVLW       hi_addr(_T6963C_defaultFont+0)
	MOVWF       _bDisableKidLock+13 
	MOVLW       higher_addr(_T6963C_defaultFont+0)
	MOVWF       _bDisableKidLock+14 
;CHi_Hub_VGCLD_driver.c,2104 :: 		bDisableKidLock.PressColEnabled = 1;
	MOVLW       1
	MOVWF       _bDisableKidLock+16 
;CHi_Hub_VGCLD_driver.c,2105 :: 		bDisableKidLock.Corner_Radius   = 3;
	MOVLW       3
	MOVWF       _bDisableKidLock+15 
;CHi_Hub_VGCLD_driver.c,2106 :: 		bDisableKidLock.OnUpPtr         = 0;
	CLRF        _bDisableKidLock+17 
	CLRF        _bDisableKidLock+18 
	CLRF        _bDisableKidLock+19 
	CLRF        _bDisableKidLock+20 
;CHi_Hub_VGCLD_driver.c,2107 :: 		bDisableKidLock.OnDownPtr       = 0;
	CLRF        _bDisableKidLock+21 
	CLRF        _bDisableKidLock+22 
	CLRF        _bDisableKidLock+23 
	CLRF        _bDisableKidLock+24 
;CHi_Hub_VGCLD_driver.c,2108 :: 		bDisableKidLock.OnClickPtr      = bDisableKidLockOnClick;
	MOVLW       _bDisableKidLockOnClick+0
	MOVWF       _bDisableKidLock+25 
	MOVLW       hi_addr(_bDisableKidLockOnClick+0)
	MOVWF       _bDisableKidLock+26 
	MOVLW       0
	MOVWF       _bDisableKidLock+27 
	MOVLW       0
	MOVWF       _bDisableKidLock+28 
;CHi_Hub_VGCLD_driver.c,2109 :: 		bDisableKidLock.OnPressPtr      = 0;
	CLRF        _bDisableKidLock+29 
	CLRF        _bDisableKidLock+30 
	CLRF        _bDisableKidLock+31 
	CLRF        _bDisableKidLock+32 
;CHi_Hub_VGCLD_driver.c,2110 :: 		}
L_end_InitializeObjects:
	RETURN      0
; end of CHi_Hub_VGCLD_driver_InitializeObjects

CHi_Hub_VGCLD_driver_IsInsideObject:

;CHi_Hub_VGCLD_driver.c,2112 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
;CHi_Hub_VGCLD_driver.c,2113 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
	MOVF        FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+1, 0 
	SUBWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_IsInsideObject201
	MOVF        FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+0, 0 
	SUBWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+0, 0 
L_CHi_Hub_VGCLD_driver_IsInsideObject201:
	BTFSS       STATUS+0, 0 
	GOTO        L_CHi_Hub_VGCLD_driver_IsInsideObject2
	MOVF        FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+0, 0 
	ADDWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+0, 0 
	MOVWF       R0 
	MOVF        FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+1, 0 
	ADDWFC      FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+1, 0 
	MOVWF       R1 
	MOVLW       1
	SUBWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	SUBWFB      R1, 0 
	MOVWF       R3 
	MOVF        FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+1, 0 
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_IsInsideObject202
	MOVF        FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+0, 0 
	SUBWF       R2, 0 
L_CHi_Hub_VGCLD_driver_IsInsideObject202:
	BTFSS       STATUS+0, 0 
	GOTO        L_CHi_Hub_VGCLD_driver_IsInsideObject2
;CHi_Hub_VGCLD_driver.c,2114 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
	MOVF        FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+1, 0 
	SUBWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_IsInsideObject203
	MOVF        FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+0, 0 
	SUBWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+0, 0 
L_CHi_Hub_VGCLD_driver_IsInsideObject203:
	BTFSS       STATUS+0, 0 
	GOTO        L_CHi_Hub_VGCLD_driver_IsInsideObject2
	MOVF        FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+0, 0 
	ADDWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+0, 0 
	MOVWF       R0 
	MOVF        FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+1, 0 
	ADDWFC      FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+1, 0 
	MOVWF       R1 
	MOVLW       1
	SUBWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	SUBWFB      R1, 0 
	MOVWF       R3 
	MOVF        FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+1, 0 
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_IsInsideObject204
	MOVF        FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+0, 0 
	SUBWF       R2, 0 
L_CHi_Hub_VGCLD_driver_IsInsideObject204:
	BTFSS       STATUS+0, 0 
	GOTO        L_CHi_Hub_VGCLD_driver_IsInsideObject2
L_CHi_Hub_VGCLD_driver_IsInsideObject192:
;CHi_Hub_VGCLD_driver.c,2115 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_IsInsideObject
L_CHi_Hub_VGCLD_driver_IsInsideObject2:
;CHi_Hub_VGCLD_driver.c,2117 :: 		return 0;
	CLRF        R0 
;CHi_Hub_VGCLD_driver.c,2118 :: 		}
L_end_IsInsideObject:
	RETURN      0
; end of CHi_Hub_VGCLD_driver_IsInsideObject

_DrawRoundButton:

;CHi_Hub_VGCLD_driver.c,2130 :: 		void DrawRoundButton(TButton_Round *Around_button) {
;CHi_Hub_VGCLD_driver.c,2132 :: 		if (Around_button->Visible == 1) {
	MOVLW       7
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawRoundButton4
;CHi_Hub_VGCLD_driver.c,2133 :: 		if (object_pressed == 1) {
	MOVF        _object_pressed+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawRoundButton5
;CHi_Hub_VGCLD_driver.c,2134 :: 		object_pressed = 0;
	CLRF        _object_pressed+0 
;CHi_Hub_VGCLD_driver.c,2135 :: 		T6963C_Rectangle_Round_Edges(Around_button->Left - 1, Around_button->Top - 1,
	MOVLW       3
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	DECF        R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1, 1 
	MOVLW       4
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	DECF        R0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1, 1 
;CHi_Hub_VGCLD_driver.c,2136 :: 		Around_button->Left + Around_button->Width,
	MOVLW       5
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1, 1 
;CHi_Hub_VGCLD_driver.c,2137 :: 		Around_button->Top + Around_button->Height, Around_button->Corner_Radius, T6963C_WHITE);
	MOVLW       6
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1, 1 
	MOVLW       15
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+1 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_color+0 
	CALL        _T6963C_Rectangle_Round_Edges+0, 0
;CHi_Hub_VGCLD_driver.c,2138 :: 		T6963C_Rectangle_Round_Edges(Around_button->Left, Around_button->Top,
	MOVLW       3
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_upper_left+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1 
	MOVLW       4
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_upper_left+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1 
;CHi_Hub_VGCLD_driver.c,2139 :: 		Around_button->Left + Around_button->Width - 1,
	MOVLW       5
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1, 1 
;CHi_Hub_VGCLD_driver.c,2140 :: 		Around_button->Top + Around_button->Height - 1, Around_button->Corner_Radius, T6963C_BLACK);
	MOVLW       6
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1, 1 
	MOVLW       15
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+1 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+1 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_color+0 
	CALL        _T6963C_Rectangle_Round_Edges+0, 0
;CHi_Hub_VGCLD_driver.c,2141 :: 		T6963C_Rectangle_Round_Edges_Fill(Around_button->Left + 1, Around_button->Top + 1,
	MOVLW       3
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	ADDLW       1
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_Fill_x_upper_left+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_Fill_x_upper_left+1, 1 
	MOVLW       4
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       1
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_Fill_y_upper_left+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_Fill_y_upper_left+1, 1 
;CHi_Hub_VGCLD_driver.c,2142 :: 		Around_button->Left + Around_button->Width - 2,
	MOVLW       5
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1, 1 
	MOVLW       2
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1, 1 
;CHi_Hub_VGCLD_driver.c,2143 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius, T6963C_WHITE);
	MOVLW       6
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1, 1 
	MOVLW       2
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1, 1 
	MOVLW       15
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_round_radius+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_round_radius+1 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_round_radius+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_color+0 
	CALL        _T6963C_Rectangle_Round_Edges_Fill+0, 0
;CHi_Hub_VGCLD_driver.c,2144 :: 		}
	GOTO        L_DrawRoundButton6
L_DrawRoundButton5:
;CHi_Hub_VGCLD_driver.c,2146 :: 		T6963C_Rectangle_Round_Edges(Around_button->Left - 1, Around_button->Top - 1,
	MOVLW       3
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	DECF        R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1, 1 
	MOVLW       4
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	DECF        R0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1, 1 
;CHi_Hub_VGCLD_driver.c,2147 :: 		Around_button->Left + Around_button->Width,
	MOVLW       5
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1, 1 
;CHi_Hub_VGCLD_driver.c,2148 :: 		Around_button->Top + Around_button->Height, Around_button->Corner_Radius, T6963C_BLACK);
	MOVLW       6
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1, 1 
	MOVLW       15
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+1 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+1 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_color+0 
	CALL        _T6963C_Rectangle_Round_Edges+0, 0
;CHi_Hub_VGCLD_driver.c,2149 :: 		T6963C_Rectangle_Round_Edges_Fill(Around_button->Left, Around_button->Top,
	MOVLW       3
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_upper_left+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_upper_left+1 
	MOVLW       4
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_upper_left+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_upper_left+1 
;CHi_Hub_VGCLD_driver.c,2150 :: 		Around_button->Left + Around_button->Width - 1,
	MOVLW       5
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1, 1 
;CHi_Hub_VGCLD_driver.c,2151 :: 		Around_button->Top + Around_button->Height - 1, Around_button->Corner_Radius, T6963C_WHITE);
	MOVLW       6
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1, 1 
	MOVLW       15
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_round_radius+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_round_radius+1 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_round_radius+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_color+0 
	CALL        _T6963C_Rectangle_Round_Edges_Fill+0, 0
;CHi_Hub_VGCLD_driver.c,2152 :: 		if ((Around_button->Width >= 5) && (Around_button->Height >= 5)) {
	MOVLW       5
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVLW       5
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_DrawRoundButton9
	MOVLW       6
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVLW       5
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_DrawRoundButton9
L__DrawRoundButton193:
;CHi_Hub_VGCLD_driver.c,2153 :: 		T6963C_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
	MOVLW       3
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	ADDLW       1
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1, 1 
	MOVLW       4
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       1
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1, 1 
;CHi_Hub_VGCLD_driver.c,2154 :: 		Around_button->Left + Around_button->Width - 2,
	MOVLW       5
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1, 1 
	MOVLW       2
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1, 1 
;CHi_Hub_VGCLD_driver.c,2155 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius, T6963C_BLACK);
	MOVLW       6
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1, 1 
	MOVLW       2
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1, 1 
	MOVLW       15
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+1 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+1 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_color+0 
	CALL        _T6963C_Rectangle_Round_Edges+0, 0
;CHi_Hub_VGCLD_driver.c,2156 :: 		}
L_DrawRoundButton9:
;CHi_Hub_VGCLD_driver.c,2157 :: 		}
L_DrawRoundButton6:
;CHi_Hub_VGCLD_driver.c,2158 :: 		T6963C_Set_Font_Adv(Around_button->FontName, T6963C_BLACK, _T6963C_HORIZONTAL);
	MOVLW       12
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+2 
	CLRF        FARG_T6963C_Set_Font_Adv_font_color+0 
	CLRF        FARG_T6963C_Set_Font_Adv_font_orientation+0 
	CALL        _T6963C_Set_Font_Adv+0, 0
;CHi_Hub_VGCLD_driver.c,2159 :: 		T6963C_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
	MOVLW       9
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Return_Pos_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Return_Pos_text+1 
	MOVLW       3
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Return_Pos_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Return_Pos_x+1 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Return_Pos_x+1 
	MOVLW       4
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Return_Pos_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Return_Pos_y+1 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Return_Pos_y+1 
	CALL        _T6963C_Write_Text_Return_Pos+0, 0
;CHi_Hub_VGCLD_driver.c,2160 :: 		if (Around_button->TextAlign == _taLeft)
	MOVLW       11
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawRoundButton10
;CHi_Hub_VGCLD_driver.c,2161 :: 		T6963C_Write_Text_Adv(Around_button->Caption, Around_button->Left + 3, (Around_button->Top + ((Around_button->Height - T6963C_caption_height) / 2)));
	MOVLW       9
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       3
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVLW       3
	ADDWF       POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	CLRF        FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Write_Text_Adv_x+1, 1 
	MOVLW       4
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVLW       6
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        _T6963C_caption_height+0, 0 
	SUBWF       POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        _T6963C_caption_height+1, 0 
	MOVWF       R4 
	MOVLW       0
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	MOVF        R5, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
	GOTO        L_DrawRoundButton11
L_DrawRoundButton10:
;CHi_Hub_VGCLD_driver.c,2162 :: 		else if (Around_button->TextAlign == _taCenter)
	MOVLW       11
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawRoundButton12
;CHi_Hub_VGCLD_driver.c,2163 :: 		T6963C_Write_Text_Adv(Around_button->Caption, (Around_button->Left + (Around_button->Width - T6963C_caption_length) / 2), (Around_button->Top + ((Around_button->Height - T6963C_caption_height) / 2)));
	MOVLW       9
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       3
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVLW       5
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        _T6963C_caption_length+0, 0 
	SUBWF       POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        _T6963C_caption_length+1, 0 
	MOVWF       R4 
	MOVLW       0
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	MOVF        R5, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       4
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVLW       6
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        _T6963C_caption_height+0, 0 
	SUBWF       POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        _T6963C_caption_height+1, 0 
	MOVWF       R4 
	MOVLW       0
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	MOVF        R5, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
	GOTO        L_DrawRoundButton13
L_DrawRoundButton12:
;CHi_Hub_VGCLD_driver.c,2164 :: 		else if (Around_button->TextAlign == _taRight)
	MOVLW       11
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawRoundButton14
;CHi_Hub_VGCLD_driver.c,2165 :: 		T6963C_Write_Text_Adv(Around_button->Caption, Around_button->Left + (Around_button->Width - T6963C_caption_length - 4), (Around_button->Top + ((Around_button->Height - T6963C_caption_height) / 2)));
	MOVLW       9
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       3
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVLW       5
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        _T6963C_caption_length+0, 0 
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        _T6963C_caption_length+1, 0 
	MOVWF       R1 
	MOVLW       0
	SUBFWB      R1, 1 
	MOVLW       4
	SUBWF       R0, 1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        R2, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       4
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVLW       6
	ADDWF       FARG_DrawRoundButton_Around_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundButton_Around_button+1, 0 
	MOVWF       FSR0H 
	MOVF        _T6963C_caption_height+0, 0 
	SUBWF       POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        _T6963C_caption_height+1, 0 
	MOVWF       R4 
	MOVLW       0
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	MOVF        R5, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
L_DrawRoundButton14:
L_DrawRoundButton13:
L_DrawRoundButton11:
;CHi_Hub_VGCLD_driver.c,2166 :: 		}
L_DrawRoundButton4:
;CHi_Hub_VGCLD_driver.c,2167 :: 		}
L_end_DrawRoundButton:
	RETURN      0
; end of _DrawRoundButton

_DrawCRoundButton:

;CHi_Hub_VGCLD_driver.c,2169 :: 		void DrawCRoundButton(TCButton_Round *Around_button) {
;CHi_Hub_VGCLD_driver.c,2171 :: 		if (Around_button->Visible == 1) {
	MOVLW       7
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawCRoundButton15
;CHi_Hub_VGCLD_driver.c,2172 :: 		if (object_pressed == 1) {
	MOVF        _object_pressed+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawCRoundButton16
;CHi_Hub_VGCLD_driver.c,2173 :: 		object_pressed = 0;
	CLRF        _object_pressed+0 
;CHi_Hub_VGCLD_driver.c,2174 :: 		T6963C_Rectangle_Round_Edges(Around_button->Left - 1, Around_button->Top - 1,
	MOVLW       3
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R2
	DECF        R2, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1, 1 
	MOVLW       4
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	DECF        R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1, 1 
;CHi_Hub_VGCLD_driver.c,2175 :: 		Around_button->Left + Around_button->Width,
	MOVLW       5
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	ADDWF       R2, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1, 1 
;CHi_Hub_VGCLD_driver.c,2176 :: 		Around_button->Top + Around_button->Height, Around_button->Corner_Radius, T6963C_WHITE);
	MOVLW       6
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1, 1 
	MOVLW       16
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Rectangle_Round_Edges_round_radius+0
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_color+0 
	CALL        _T6963C_Rectangle_Round_Edges+0, 0
;CHi_Hub_VGCLD_driver.c,2177 :: 		T6963C_Rectangle_Round_Edges(Around_button->Left, Around_button->Top,
	MOVLW       3
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVF        R2, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_upper_left+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1 
	MOVLW       4
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_upper_left+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1 
;CHi_Hub_VGCLD_driver.c,2178 :: 		Around_button->Left + Around_button->Width - 1,
	MOVLW       5
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	ADDWF       R2, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1, 1 
;CHi_Hub_VGCLD_driver.c,2179 :: 		Around_button->Top + Around_button->Height - 1, Around_button->Corner_Radius, T6963C_BLACK);
	MOVLW       6
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1, 1 
	MOVLW       16
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Rectangle_Round_Edges_round_radius+0
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+1 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_color+0 
	CALL        _T6963C_Rectangle_Round_Edges+0, 0
;CHi_Hub_VGCLD_driver.c,2180 :: 		T6963C_Rectangle_Round_Edges_Fill(Around_button->Left + 1, Around_button->Top + 1,
	MOVLW       3
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVF        R2, 0 
	ADDLW       1
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_Fill_x_upper_left+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_Fill_x_upper_left+1, 1 
	MOVLW       4
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	ADDLW       1
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_Fill_y_upper_left+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_Fill_y_upper_left+1, 1 
;CHi_Hub_VGCLD_driver.c,2181 :: 		Around_button->Left + Around_button->Width - 2,
	MOVLW       5
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	ADDWF       R2, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1, 1 
	MOVLW       2
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1, 1 
;CHi_Hub_VGCLD_driver.c,2182 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius, T6963C_WHITE);
	MOVLW       6
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1, 1 
	MOVLW       2
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1, 1 
	MOVLW       16
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Rectangle_Round_Edges_Fill_round_radius+0
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_round_radius+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_color+0 
	CALL        _T6963C_Rectangle_Round_Edges_Fill+0, 0
;CHi_Hub_VGCLD_driver.c,2183 :: 		}
	GOTO        L_DrawCRoundButton17
L_DrawCRoundButton16:
;CHi_Hub_VGCLD_driver.c,2185 :: 		T6963C_Rectangle_Round_Edges(Around_button->Left - 1, Around_button->Top - 1,
	MOVLW       3
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R2
	DECF        R2, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1, 1 
	MOVLW       4
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	DECF        R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1, 1 
;CHi_Hub_VGCLD_driver.c,2186 :: 		Around_button->Left + Around_button->Width,
	MOVLW       5
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	ADDWF       R2, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1, 1 
;CHi_Hub_VGCLD_driver.c,2187 :: 		Around_button->Top + Around_button->Height, Around_button->Corner_Radius, T6963C_BLACK);
	MOVLW       6
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1, 1 
	MOVLW       16
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Rectangle_Round_Edges_round_radius+0
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+1 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_color+0 
	CALL        _T6963C_Rectangle_Round_Edges+0, 0
;CHi_Hub_VGCLD_driver.c,2188 :: 		T6963C_Rectangle_Round_Edges_Fill(Around_button->Left, Around_button->Top,
	MOVLW       3
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVF        R2, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_upper_left+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_upper_left+1 
	MOVLW       4
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_upper_left+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_upper_left+1 
;CHi_Hub_VGCLD_driver.c,2189 :: 		Around_button->Left + Around_button->Width - 1,
	MOVLW       5
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	ADDWF       R2, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1, 1 
;CHi_Hub_VGCLD_driver.c,2190 :: 		Around_button->Top + Around_button->Height - 1, Around_button->Corner_Radius, T6963C_WHITE);
	MOVLW       6
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1, 1 
	MOVLW       16
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Rectangle_Round_Edges_Fill_round_radius+0
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_round_radius+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_color+0 
	CALL        _T6963C_Rectangle_Round_Edges_Fill+0, 0
;CHi_Hub_VGCLD_driver.c,2191 :: 		if ((Around_button->Width >= 5) && (Around_button->Height >= 5)) {
	MOVLW       5
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVLW       5
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_DrawCRoundButton20
	MOVLW       6
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVLW       5
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_DrawCRoundButton20
L__DrawCRoundButton194:
;CHi_Hub_VGCLD_driver.c,2192 :: 		T6963C_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
	MOVLW       3
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVF        R2, 0 
	ADDLW       1
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1, 1 
	MOVLW       4
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	ADDLW       1
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1, 1 
;CHi_Hub_VGCLD_driver.c,2193 :: 		Around_button->Left + Around_button->Width - 2,
	MOVLW       5
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	ADDWF       R2, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1, 1 
	MOVLW       2
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1, 1 
;CHi_Hub_VGCLD_driver.c,2194 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius, T6963C_BLACK);
	MOVLW       6
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        R0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1, 1 
	MOVLW       2
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1, 1 
	MOVLW       16
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Rectangle_Round_Edges_round_radius+0
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+1 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_color+0 
	CALL        _T6963C_Rectangle_Round_Edges+0, 0
;CHi_Hub_VGCLD_driver.c,2195 :: 		}
L_DrawCRoundButton20:
;CHi_Hub_VGCLD_driver.c,2196 :: 		}
L_DrawCRoundButton17:
;CHi_Hub_VGCLD_driver.c,2197 :: 		T6963C_Set_Font_Adv(Around_button->FontName, T6963C_BLACK, _T6963C_HORIZONTAL);
	MOVLW       13
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Set_Font_Adv_activeFont+0
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Set_Font_Adv_activeFont+1
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Set_Font_Adv_activeFont+2
	CLRF        FARG_T6963C_Set_Font_Adv_font_color+0 
	CLRF        FARG_T6963C_Set_Font_Adv_font_orientation+0 
	CALL        _T6963C_Set_Font_Adv+0, 0
;CHi_Hub_VGCLD_driver.c,2198 :: 		T6963C_Write_Const_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
	MOVLW       9
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Return_Pos_text+0
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Return_Pos_text+1
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Return_Pos_text+2
	MOVLW       3
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Return_Pos_x+0
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Const_Text_Return_Pos_x+1 
	MOVLW       4
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Return_Pos_y+0
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Const_Text_Return_Pos_y+1 
	CALL        _T6963C_Write_Const_Text_Return_Pos+0, 0
;CHi_Hub_VGCLD_driver.c,2199 :: 		if (Around_button->TextAlign == _taLeft)
	MOVLW       12
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawCRoundButton21
;CHi_Hub_VGCLD_driver.c,2200 :: 		T6963C_Write_Const_Text_Adv(Around_button->Caption, Around_button->Left + 3, (Around_button->Top + ((Around_button->Height - T6963C_caption_height) / 2)));
	MOVLW       9
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Adv_text+0
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Adv_text+1
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Adv_text+2
	MOVLW       3
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Write_Const_Text_Adv_x+0 
	CLRF        FARG_T6963C_Write_Const_Text_Adv_x+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Write_Const_Text_Adv_x+1, 1 
	MOVLW       4
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R5
	MOVLW       6
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        _T6963C_caption_height+0, 0 
	SUBWF       R0, 0 
	MOVWF       R3 
	MOVF        _T6963C_caption_height+1, 0 
	MOVWF       R4 
	MOVLW       0
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	MOVF        R5, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Write_Const_Text_Adv_y+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_T6963C_Write_Const_Text_Adv_y+1 
	CALL        _T6963C_Write_Const_Text_Adv+0, 0
	GOTO        L_DrawCRoundButton22
L_DrawCRoundButton21:
;CHi_Hub_VGCLD_driver.c,2201 :: 		else if (Around_button->TextAlign == _taCenter)
	MOVLW       12
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawCRoundButton23
;CHi_Hub_VGCLD_driver.c,2202 :: 		T6963C_Write_Const_Text_Adv(Around_button->Caption, (Around_button->Left + (Around_button->Width - T6963C_caption_length) / 2), (Around_button->Top + ((Around_button->Height - T6963C_caption_height) / 2)));
	MOVLW       9
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Adv_text+0
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Adv_text+1
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Adv_text+2
	MOVLW       3
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R5
	MOVLW       5
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        _T6963C_caption_length+0, 0 
	SUBWF       R0, 0 
	MOVWF       R3 
	MOVF        _T6963C_caption_length+1, 0 
	MOVWF       R4 
	MOVLW       0
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	MOVF        R5, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Write_Const_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_T6963C_Write_Const_Text_Adv_x+1 
	MOVLW       4
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R5
	MOVLW       6
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        _T6963C_caption_height+0, 0 
	SUBWF       R0, 0 
	MOVWF       R3 
	MOVF        _T6963C_caption_height+1, 0 
	MOVWF       R4 
	MOVLW       0
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	MOVF        R5, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Write_Const_Text_Adv_y+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_T6963C_Write_Const_Text_Adv_y+1 
	CALL        _T6963C_Write_Const_Text_Adv+0, 0
	GOTO        L_DrawCRoundButton24
L_DrawCRoundButton23:
;CHi_Hub_VGCLD_driver.c,2203 :: 		else if (Around_button->TextAlign == _taRight)
	MOVLW       12
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawCRoundButton25
;CHi_Hub_VGCLD_driver.c,2204 :: 		T6963C_Write_Const_Text_Adv(Around_button->Caption, Around_button->Left + (Around_button->Width - T6963C_caption_length - 4), (Around_button->Top + ((Around_button->Height - T6963C_caption_height) / 2)));
	MOVLW       9
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Adv_text+0
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Adv_text+1
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Adv_text+2
	MOVLW       3
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVLW       5
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVLW       0
	MOVWF       R1 
	MOVF        _T6963C_caption_length+0, 0 
	SUBWF       R0, 1 
	MOVF        _T6963C_caption_length+1, 0 
	SUBWFB      R1, 1 
	MOVLW       4
	SUBWF       R0, 1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        R2, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Write_Const_Text_Adv_x+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_T6963C_Write_Const_Text_Adv_x+1 
	MOVLW       4
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R5
	MOVLW       6
	ADDWF       FARG_DrawCRoundButton_Around_button+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCRoundButton_Around_button+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVF        _T6963C_caption_height+0, 0 
	SUBWF       R0, 0 
	MOVWF       R3 
	MOVF        _T6963C_caption_height+1, 0 
	MOVWF       R4 
	MOVLW       0
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	MOVF        R5, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Write_Const_Text_Adv_y+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FARG_T6963C_Write_Const_Text_Adv_y+1 
	CALL        _T6963C_Write_Const_Text_Adv+0, 0
L_DrawCRoundButton25:
L_DrawCRoundButton24:
L_DrawCRoundButton22:
;CHi_Hub_VGCLD_driver.c,2205 :: 		}
L_DrawCRoundButton15:
;CHi_Hub_VGCLD_driver.c,2206 :: 		}
L_end_DrawCRoundButton:
	RETURN      0
; end of _DrawCRoundButton

_DrawLabel:

;CHi_Hub_VGCLD_driver.c,2208 :: 		void DrawLabel(TLabel *ALabel) {
;CHi_Hub_VGCLD_driver.c,2209 :: 		if (ALabel->Visible == 1) {
	MOVLW       13
	ADDWF       FARG_DrawLabel_ALabel+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_ALabel+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawLabel26
;CHi_Hub_VGCLD_driver.c,2210 :: 		T6963C_Set_Font_Adv(ALabel->FontName, ALabel->Font_Color, _T6963C_HORIZONTAL);
	MOVLW       9
	ADDWF       FARG_DrawLabel_ALabel+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_ALabel+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Set_Font_Adv_activeFont+2 
	MOVLW       12
	ADDWF       FARG_DrawLabel_ALabel+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_ALabel+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Set_Font_Adv_font_color+0 
	CLRF        FARG_T6963C_Set_Font_Adv_font_orientation+0 
	CALL        _T6963C_Set_Font_Adv+0, 0
;CHi_Hub_VGCLD_driver.c,2211 :: 		T6963C_Write_Text_Adv(ALabel->Caption, ALabel->Left, ALabel->Top);
	MOVLW       7
	ADDWF       FARG_DrawLabel_ALabel+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_ALabel+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_text+1 
	MOVLW       3
	ADDWF       FARG_DrawLabel_ALabel+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_ALabel+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_x+1 
	MOVLW       4
	ADDWF       FARG_DrawLabel_ALabel+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_ALabel+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Write_Text_Adv_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Text_Adv_y+1 
	CALL        _T6963C_Write_Text_Adv+0, 0
;CHi_Hub_VGCLD_driver.c,2212 :: 		}
L_DrawLabel26:
;CHi_Hub_VGCLD_driver.c,2213 :: 		}
L_end_DrawLabel:
	RETURN      0
; end of _DrawLabel

_DrawCLabel:

;CHi_Hub_VGCLD_driver.c,2215 :: 		void DrawCLabel(TCLabel *ALabel) {
;CHi_Hub_VGCLD_driver.c,2216 :: 		if (ALabel->Visible == 1) {
	MOVLW       14
	ADDWF       FARG_DrawCLabel_ALabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCLabel_ALabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCLabel_ALabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawCLabel27
;CHi_Hub_VGCLD_driver.c,2217 :: 		T6963C_Set_Font_Adv(ALabel->FontName, ALabel->Font_Color, _T6963C_HORIZONTAL);
	MOVLW       10
	ADDWF       FARG_DrawCLabel_ALabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCLabel_ALabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCLabel_ALabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Set_Font_Adv_activeFont+0
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Set_Font_Adv_activeFont+1
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Set_Font_Adv_activeFont+2
	MOVLW       13
	ADDWF       FARG_DrawCLabel_ALabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCLabel_ALabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCLabel_ALabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Set_Font_Adv_font_color+0
	CLRF        FARG_T6963C_Set_Font_Adv_font_orientation+0 
	CALL        _T6963C_Set_Font_Adv+0, 0
;CHi_Hub_VGCLD_driver.c,2218 :: 		T6963C_Write_Const_Text_Adv(ALabel->Caption, ALabel->Left, ALabel->Top);
	MOVLW       7
	ADDWF       FARG_DrawCLabel_ALabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCLabel_ALabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCLabel_ALabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Adv_text+0
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Adv_text+1
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Adv_text+2
	MOVLW       3
	ADDWF       FARG_DrawCLabel_ALabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCLabel_ALabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCLabel_ALabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Adv_x+0
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Const_Text_Adv_x+1 
	MOVLW       4
	ADDWF       FARG_DrawCLabel_ALabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCLabel_ALabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCLabel_ALabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_Write_Const_Text_Adv_y+0
	MOVLW       0
	MOVWF       FARG_T6963C_Write_Const_Text_Adv_y+1 
	CALL        _T6963C_Write_Const_Text_Adv+0, 0
;CHi_Hub_VGCLD_driver.c,2219 :: 		}
L_DrawCLabel27:
;CHi_Hub_VGCLD_driver.c,2220 :: 		}
L_end_DrawCLabel:
	RETURN      0
; end of _DrawCLabel

_DrawImage:

;CHi_Hub_VGCLD_driver.c,2222 :: 		void DrawImage(TImage *AImage) {
;CHi_Hub_VGCLD_driver.c,2223 :: 		if (AImage->Visible == 1) {
	MOVLW       12
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawImage28
;CHi_Hub_VGCLD_driver.c,2224 :: 		T6963C_PartialImage(AImage->Left, AImage->Top, AImage->Width,
	MOVLW       3
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_x_left+0 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_x_left+1 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_x_left+1 
	MOVLW       4
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_y_top+0 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_y_top+1 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_y_top+1 
	MOVLW       5
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_width+0 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_width+1 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_width+1 
;CHi_Hub_VGCLD_driver.c,2225 :: 		AImage->Height, AImage->PictureWidth, AImage->PictureHeight,
	MOVLW       6
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_height+0 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_height+1 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_height+1 
	MOVLW       7
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_picture_width+0 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_picture_width+1 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_picture_width+1 
	MOVLW       8
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_picture_height+0 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_picture_height+1 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_picture_height+1 
;CHi_Hub_VGCLD_driver.c,2226 :: 		AImage->Picture_Name);
	MOVLW       9
	ADDWF       FARG_DrawImage_AImage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_AImage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_image+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_image+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_image+2 
	CALL        _T6963C_PartialImage+0, 0
;CHi_Hub_VGCLD_driver.c,2227 :: 		}
L_DrawImage28:
;CHi_Hub_VGCLD_driver.c,2228 :: 		}
L_end_DrawImage:
	RETURN      0
; end of _DrawImage

_DrawCImage:

;CHi_Hub_VGCLD_driver.c,2230 :: 		void DrawCImage(TCImage *AImage) {
;CHi_Hub_VGCLD_driver.c,2231 :: 		if (AImage->Visible == 1) {
	MOVLW       12
	ADDWF       FARG_DrawCImage_AImage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawCImage29
;CHi_Hub_VGCLD_driver.c,2232 :: 		T6963C_PartialImage(AImage->Left, AImage->Top, AImage->Width,
	MOVLW       3
	ADDWF       FARG_DrawCImage_AImage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_PartialImage_x_left+0
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_x_left+1 
	MOVLW       4
	ADDWF       FARG_DrawCImage_AImage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_PartialImage_y_top+0
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_y_top+1 
	MOVLW       5
	ADDWF       FARG_DrawCImage_AImage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_PartialImage_width+0
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_width+1 
;CHi_Hub_VGCLD_driver.c,2233 :: 		AImage->Height, AImage->PictureWidth, AImage->PictureHeight,
	MOVLW       6
	ADDWF       FARG_DrawCImage_AImage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_PartialImage_height+0
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_height+1 
	MOVLW       7
	ADDWF       FARG_DrawCImage_AImage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_PartialImage_picture_width+0
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_picture_width+1 
	MOVLW       8
	ADDWF       FARG_DrawCImage_AImage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_PartialImage_picture_height+0
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_picture_height+1 
;CHi_Hub_VGCLD_driver.c,2234 :: 		AImage->Picture_Name);
	MOVLW       9
	ADDWF       FARG_DrawCImage_AImage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_DrawCImage_AImage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_PartialImage_image+0
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_PartialImage_image+1
	TBLRD*+
	MOVFF       TABLAT+0, FARG_T6963C_PartialImage_image+2
	CALL        _T6963C_PartialImage+0, 0
;CHi_Hub_VGCLD_driver.c,2235 :: 		}
L_DrawCImage29:
;CHi_Hub_VGCLD_driver.c,2236 :: 		}
L_end_DrawCImage:
	RETURN      0
; end of _DrawCImage

_DrawBox:

;CHi_Hub_VGCLD_driver.c,2238 :: 		void DrawBox(TBox *ABox) {
;CHi_Hub_VGCLD_driver.c,2239 :: 		if (ABox->Visible == 1) {
	MOVLW       7
	ADDWF       FARG_DrawBox_ABox+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawBox_ABox+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawBox30
;CHi_Hub_VGCLD_driver.c,2240 :: 		if (ABox->Transparent == 1) {
	MOVLW       9
	ADDWF       FARG_DrawBox_ABox+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawBox_ABox+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawBox31
;CHi_Hub_VGCLD_driver.c,2241 :: 		T6963C_rectangle(ABox->Left, ABox->Top,
	MOVLW       3
	ADDWF       FARG_DrawBox_ABox+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawBox_ABox+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       FARG_T6963C_rectangle_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_rectangle_x0+1 
	MOVLW       4
	ADDWF       FARG_DrawBox_ABox+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawBox_ABox+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_T6963C_rectangle_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_rectangle_y0+1 
;CHi_Hub_VGCLD_driver.c,2242 :: 		ABox->Left + ABox->Width - 1,
	MOVLW       5
	ADDWF       FARG_DrawBox_ABox+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawBox_ABox+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_rectangle_x1+0 
	CLRF        FARG_T6963C_rectangle_x1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_rectangle_x1+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_rectangle_x1+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_rectangle_x1+1, 1 
;CHi_Hub_VGCLD_driver.c,2243 :: 		ABox->Top + ABox->Height - 1, T6963C_WHITE);
	MOVLW       6
	ADDWF       FARG_DrawBox_ABox+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawBox_ABox+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_rectangle_y1+0 
	CLRF        FARG_T6963C_rectangle_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_rectangle_y1+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_rectangle_y1+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_rectangle_y1+1, 1 
	MOVLW       8
	MOVWF       FARG_T6963C_rectangle_pcolor+0 
	CALL        _T6963C_rectangle+0, 0
;CHi_Hub_VGCLD_driver.c,2244 :: 		}
	GOTO        L_DrawBox32
L_DrawBox31:
;CHi_Hub_VGCLD_driver.c,2246 :: 		T6963C_box(ABox->Left, ABox->Top,
	MOVLW       3
	ADDWF       FARG_DrawBox_ABox+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawBox_ABox+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       4
	ADDWF       FARG_DrawBox_ABox+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawBox_ABox+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
;CHi_Hub_VGCLD_driver.c,2247 :: 		ABox->Left + ABox->Width - 1,
	MOVLW       5
	ADDWF       FARG_DrawBox_ABox+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawBox_ABox+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	CLRF        FARG_T6963C_box_x1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x1+1, 1 
;CHi_Hub_VGCLD_driver.c,2248 :: 		ABox->Top + ABox->Height - 1, T6963C_WHITE);
	MOVLW       6
	ADDWF       FARG_DrawBox_ABox+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawBox_ABox+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_box_y1+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_y1+1, 1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;CHi_Hub_VGCLD_driver.c,2249 :: 		}
L_DrawBox32:
;CHi_Hub_VGCLD_driver.c,2250 :: 		}
L_DrawBox30:
;CHi_Hub_VGCLD_driver.c,2251 :: 		}
L_end_DrawBox:
	RETURN      0
; end of _DrawBox

_DrawScreen:

;CHi_Hub_VGCLD_driver.c,2253 :: 		void DrawScreen(TScreen *aScreen) {
;CHi_Hub_VGCLD_driver.c,2270 :: 		object_pressed = 0;
	CLRF        _object_pressed+0 
;CHi_Hub_VGCLD_driver.c,2271 :: 		order = 0;
	CLRF        DrawScreen_order_L0+0 
	CLRF        DrawScreen_order_L0+1 
;CHi_Hub_VGCLD_driver.c,2272 :: 		round_button_idx = 0;
	CLRF        DrawScreen_round_button_idx_L0+0 
;CHi_Hub_VGCLD_driver.c,2273 :: 		round_cbutton_idx = 0;
	CLRF        DrawScreen_round_cbutton_idx_L0+0 
;CHi_Hub_VGCLD_driver.c,2274 :: 		label_idx = 0;
	CLRF        DrawScreen_label_idx_L0+0 
;CHi_Hub_VGCLD_driver.c,2275 :: 		clabel_idx = 0;
	CLRF        DrawScreen_clabel_idx_L0+0 
;CHi_Hub_VGCLD_driver.c,2276 :: 		image_idx = 0;
	CLRF        DrawScreen_image_idx_L0+0 
;CHi_Hub_VGCLD_driver.c,2277 :: 		cimage_idx = 0;
	CLRF        DrawScreen_cimage_idx_L0+0 
;CHi_Hub_VGCLD_driver.c,2278 :: 		box_idx = 0;
	CLRF        DrawScreen_box_idx_L0+0 
;CHi_Hub_VGCLD_driver.c,2279 :: 		CurrentScreen = aScreen;
	MOVF        FARG_DrawScreen_aScreen+0, 0 
	MOVWF       _CurrentScreen+0 
	MOVF        FARG_DrawScreen_aScreen+1, 0 
	MOVWF       _CurrentScreen+1 
;CHi_Hub_VGCLD_driver.c,2281 :: 		T6963C_grFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;CHi_Hub_VGCLD_driver.c,2282 :: 		T6963C_txtFill(0);
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
;CHi_Hub_VGCLD_driver.c,2284 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen33:
	MOVFF       _CurrentScreen+0, FSR0
	MOVFF       _CurrentScreen+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       128
	XORWF       DrawScreen_order_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen213
	MOVF        R1, 0 
	SUBWF       DrawScreen_order_L0+0, 0 
L__DrawScreen213:
	BTFSC       STATUS+0, 0 
	GOTO        L_DrawScreen34
;CHi_Hub_VGCLD_driver.c,2285 :: 		if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
	MOVLW       1
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen214
	MOVF        R1, 0 
	SUBWF       DrawScreen_round_button_idx_L0+0, 0 
L__DrawScreen214:
	BTFSC       STATUS+0, 0 
	GOTO        L_DrawScreen35
;CHi_Hub_VGCLD_driver.c,2286 :: 		local_round_button = GetRoundButton(round_button_idx);
	MOVLW       3
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        DrawScreen_round_button_idx_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R0, 0 
	MOVWF       DrawScreen_local_round_button_L0+0 
	MOVF        R1, 0 
	MOVWF       DrawScreen_local_round_button_L0+1 
;CHi_Hub_VGCLD_driver.c,2287 :: 		if (order == local_round_button->Order) {
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       DrawScreen_order_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen215
	MOVF        R1, 0 
	XORWF       DrawScreen_order_L0+0, 0 
L__DrawScreen215:
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawScreen36
;CHi_Hub_VGCLD_driver.c,2288 :: 		order++;
	INFSNZ      DrawScreen_order_L0+0, 1 
	INCF        DrawScreen_order_L0+1, 1 
;CHi_Hub_VGCLD_driver.c,2289 :: 		round_button_idx++;
	INCF        DrawScreen_round_button_idx_L0+0, 1 
;CHi_Hub_VGCLD_driver.c,2290 :: 		DrawRoundButton(local_round_button);
	MOVF        DrawScreen_local_round_button_L0+0, 0 
	MOVWF       FARG_DrawRoundButton_Around_button+0 
	MOVF        DrawScreen_local_round_button_L0+1, 0 
	MOVWF       FARG_DrawRoundButton_Around_button+1 
	CALL        _DrawRoundButton+0, 0
;CHi_Hub_VGCLD_driver.c,2291 :: 		}
L_DrawScreen36:
;CHi_Hub_VGCLD_driver.c,2292 :: 		}
L_DrawScreen35:
;CHi_Hub_VGCLD_driver.c,2294 :: 		if (round_cbutton_idx < CurrentScreen->CButtons_RoundCount) {
	MOVLW       6
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen216
	MOVF        R1, 0 
	SUBWF       DrawScreen_round_cbutton_idx_L0+0, 0 
L__DrawScreen216:
	BTFSC       STATUS+0, 0 
	GOTO        L_DrawScreen37
;CHi_Hub_VGCLD_driver.c,2295 :: 		local_round_cbutton = GetCRoundButton(round_cbutton_idx);
	MOVLW       8
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        DrawScreen_round_cbutton_idx_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVF        R0, 0 
	MOVWF       DrawScreen_local_round_cbutton_L0+0 
	MOVF        R1, 0 
	MOVWF       DrawScreen_local_round_cbutton_L0+1 
	MOVF        R2, 0 
	MOVWF       DrawScreen_local_round_cbutton_L0+2 
;CHi_Hub_VGCLD_driver.c,2296 :: 		if (order == local_round_cbutton->Order) {
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVLW       0
	XORWF       DrawScreen_order_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen217
	MOVF        R1, 0 
	XORWF       DrawScreen_order_L0+0, 0 
L__DrawScreen217:
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawScreen38
;CHi_Hub_VGCLD_driver.c,2297 :: 		order++;
	INFSNZ      DrawScreen_order_L0+0, 1 
	INCF        DrawScreen_order_L0+1, 1 
;CHi_Hub_VGCLD_driver.c,2298 :: 		round_cbutton_idx++;
	INCF        DrawScreen_round_cbutton_idx_L0+0, 1 
;CHi_Hub_VGCLD_driver.c,2299 :: 		DrawCRoundButton(local_round_cbutton);
	MOVF        DrawScreen_local_round_cbutton_L0+0, 0 
	MOVWF       FARG_DrawCRoundButton_Around_button+0 
	MOVF        DrawScreen_local_round_cbutton_L0+1, 0 
	MOVWF       FARG_DrawCRoundButton_Around_button+1 
	MOVF        DrawScreen_local_round_cbutton_L0+2, 0 
	MOVWF       FARG_DrawCRoundButton_Around_button+2 
	CALL        _DrawCRoundButton+0, 0
;CHi_Hub_VGCLD_driver.c,2300 :: 		}
L_DrawScreen38:
;CHi_Hub_VGCLD_driver.c,2301 :: 		}
L_DrawScreen37:
;CHi_Hub_VGCLD_driver.c,2303 :: 		if (label_idx < CurrentScreen->LabelsCount) {
	MOVLW       11
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen218
	MOVF        R1, 0 
	SUBWF       DrawScreen_label_idx_L0+0, 0 
L__DrawScreen218:
	BTFSC       STATUS+0, 0 
	GOTO        L_DrawScreen39
;CHi_Hub_VGCLD_driver.c,2304 :: 		local_label = GetLabel(label_idx);
	MOVLW       13
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        DrawScreen_label_idx_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R0, 0 
	MOVWF       DrawScreen_local_label_L0+0 
	MOVF        R1, 0 
	MOVWF       DrawScreen_local_label_L0+1 
;CHi_Hub_VGCLD_driver.c,2305 :: 		if (order == local_label->Order) {
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       DrawScreen_order_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen219
	MOVF        R1, 0 
	XORWF       DrawScreen_order_L0+0, 0 
L__DrawScreen219:
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawScreen40
;CHi_Hub_VGCLD_driver.c,2306 :: 		label_idx++;
	INCF        DrawScreen_label_idx_L0+0, 1 
;CHi_Hub_VGCLD_driver.c,2307 :: 		order++;
	INFSNZ      DrawScreen_order_L0+0, 1 
	INCF        DrawScreen_order_L0+1, 1 
;CHi_Hub_VGCLD_driver.c,2308 :: 		DrawLabel(local_label);
	MOVF        DrawScreen_local_label_L0+0, 0 
	MOVWF       FARG_DrawLabel_ALabel+0 
	MOVF        DrawScreen_local_label_L0+1, 0 
	MOVWF       FARG_DrawLabel_ALabel+1 
	CALL        _DrawLabel+0, 0
;CHi_Hub_VGCLD_driver.c,2309 :: 		}
L_DrawScreen40:
;CHi_Hub_VGCLD_driver.c,2310 :: 		}
L_DrawScreen39:
;CHi_Hub_VGCLD_driver.c,2312 :: 		if (clabel_idx < CurrentScreen->CLabelsCount) {
	MOVLW       16
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen220
	MOVF        R1, 0 
	SUBWF       DrawScreen_clabel_idx_L0+0, 0 
L__DrawScreen220:
	BTFSC       STATUS+0, 0 
	GOTO        L_DrawScreen41
;CHi_Hub_VGCLD_driver.c,2313 :: 		local_clabel = GetCLabel(clabel_idx);
	MOVLW       18
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        DrawScreen_clabel_idx_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVF        R0, 0 
	MOVWF       DrawScreen_local_clabel_L0+0 
	MOVF        R1, 0 
	MOVWF       DrawScreen_local_clabel_L0+1 
	MOVF        R2, 0 
	MOVWF       DrawScreen_local_clabel_L0+2 
;CHi_Hub_VGCLD_driver.c,2314 :: 		if (order == local_clabel->Order) {
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVLW       0
	XORWF       DrawScreen_order_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen221
	MOVF        R1, 0 
	XORWF       DrawScreen_order_L0+0, 0 
L__DrawScreen221:
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawScreen42
;CHi_Hub_VGCLD_driver.c,2315 :: 		clabel_idx++;
	INCF        DrawScreen_clabel_idx_L0+0, 1 
;CHi_Hub_VGCLD_driver.c,2316 :: 		order++;
	INFSNZ      DrawScreen_order_L0+0, 1 
	INCF        DrawScreen_order_L0+1, 1 
;CHi_Hub_VGCLD_driver.c,2317 :: 		DrawCLabel(local_clabel);
	MOVF        DrawScreen_local_clabel_L0+0, 0 
	MOVWF       FARG_DrawCLabel_ALabel+0 
	MOVF        DrawScreen_local_clabel_L0+1, 0 
	MOVWF       FARG_DrawCLabel_ALabel+1 
	MOVF        DrawScreen_local_clabel_L0+2, 0 
	MOVWF       FARG_DrawCLabel_ALabel+2 
	CALL        _DrawCLabel+0, 0
;CHi_Hub_VGCLD_driver.c,2318 :: 		}
L_DrawScreen42:
;CHi_Hub_VGCLD_driver.c,2319 :: 		}
L_DrawScreen41:
;CHi_Hub_VGCLD_driver.c,2321 :: 		if (box_idx < CurrentScreen->BoxesCount) {
	MOVLW       31
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen222
	MOVF        R1, 0 
	SUBWF       DrawScreen_box_idx_L0+0, 0 
L__DrawScreen222:
	BTFSC       STATUS+0, 0 
	GOTO        L_DrawScreen43
;CHi_Hub_VGCLD_driver.c,2322 :: 		local_box = GetBox(box_idx);
	MOVLW       33
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        DrawScreen_box_idx_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R0, 0 
	MOVWF       DrawScreen_local_box_L0+0 
	MOVF        R1, 0 
	MOVWF       DrawScreen_local_box_L0+1 
;CHi_Hub_VGCLD_driver.c,2323 :: 		if (order == local_box->Order) {
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       DrawScreen_order_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen223
	MOVF        R1, 0 
	XORWF       DrawScreen_order_L0+0, 0 
L__DrawScreen223:
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawScreen44
;CHi_Hub_VGCLD_driver.c,2324 :: 		box_idx++;
	INCF        DrawScreen_box_idx_L0+0, 1 
;CHi_Hub_VGCLD_driver.c,2325 :: 		order++;
	INFSNZ      DrawScreen_order_L0+0, 1 
	INCF        DrawScreen_order_L0+1, 1 
;CHi_Hub_VGCLD_driver.c,2326 :: 		DrawBox(local_box);
	MOVF        DrawScreen_local_box_L0+0, 0 
	MOVWF       FARG_DrawBox_ABox+0 
	MOVF        DrawScreen_local_box_L0+1, 0 
	MOVWF       FARG_DrawBox_ABox+1 
	CALL        _DrawBox+0, 0
;CHi_Hub_VGCLD_driver.c,2327 :: 		}
L_DrawScreen44:
;CHi_Hub_VGCLD_driver.c,2328 :: 		}
L_DrawScreen43:
;CHi_Hub_VGCLD_driver.c,2330 :: 		if (image_idx  < CurrentScreen->ImagesCount) {
	MOVLW       21
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen224
	MOVF        R1, 0 
	SUBWF       DrawScreen_image_idx_L0+0, 0 
L__DrawScreen224:
	BTFSC       STATUS+0, 0 
	GOTO        L_DrawScreen45
;CHi_Hub_VGCLD_driver.c,2331 :: 		local_image = GetImage(image_idx);
	MOVLW       23
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        DrawScreen_image_idx_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R0, 0 
	MOVWF       DrawScreen_local_image_L0+0 
	MOVF        R1, 0 
	MOVWF       DrawScreen_local_image_L0+1 
;CHi_Hub_VGCLD_driver.c,2332 :: 		if (order == local_image->Order) {
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       DrawScreen_order_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen225
	MOVF        R1, 0 
	XORWF       DrawScreen_order_L0+0, 0 
L__DrawScreen225:
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawScreen46
;CHi_Hub_VGCLD_driver.c,2333 :: 		image_idx++;
	INCF        DrawScreen_image_idx_L0+0, 1 
;CHi_Hub_VGCLD_driver.c,2334 :: 		order++;
	INFSNZ      DrawScreen_order_L0+0, 1 
	INCF        DrawScreen_order_L0+1, 1 
;CHi_Hub_VGCLD_driver.c,2335 :: 		DrawImage(local_image);
	MOVF        DrawScreen_local_image_L0+0, 0 
	MOVWF       FARG_DrawImage_AImage+0 
	MOVF        DrawScreen_local_image_L0+1, 0 
	MOVWF       FARG_DrawImage_AImage+1 
	CALL        _DrawImage+0, 0
;CHi_Hub_VGCLD_driver.c,2336 :: 		}
L_DrawScreen46:
;CHi_Hub_VGCLD_driver.c,2337 :: 		}
L_DrawScreen45:
;CHi_Hub_VGCLD_driver.c,2339 :: 		if (cimage_idx  < CurrentScreen->CImagesCount) {
	MOVLW       26
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen226
	MOVF        R1, 0 
	SUBWF       DrawScreen_cimage_idx_L0+0, 0 
L__DrawScreen226:
	BTFSC       STATUS+0, 0 
	GOTO        L_DrawScreen47
;CHi_Hub_VGCLD_driver.c,2340 :: 		local_cimage = GetCImage(cimage_idx);
	MOVLW       28
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        DrawScreen_cimage_idx_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVF        R0, 0 
	MOVWF       DrawScreen_local_cimage_L0+0 
	MOVF        R1, 0 
	MOVWF       DrawScreen_local_cimage_L0+1 
	MOVF        R2, 0 
	MOVWF       DrawScreen_local_cimage_L0+2 
;CHi_Hub_VGCLD_driver.c,2341 :: 		if (order == local_cimage->Order) {
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVLW       0
	XORWF       DrawScreen_order_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__DrawScreen227
	MOVF        R1, 0 
	XORWF       DrawScreen_order_L0+0, 0 
L__DrawScreen227:
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawScreen48
;CHi_Hub_VGCLD_driver.c,2342 :: 		cimage_idx++;
	INCF        DrawScreen_cimage_idx_L0+0, 1 
;CHi_Hub_VGCLD_driver.c,2343 :: 		order++;
	INFSNZ      DrawScreen_order_L0+0, 1 
	INCF        DrawScreen_order_L0+1, 1 
;CHi_Hub_VGCLD_driver.c,2344 :: 		DrawCImage(local_cimage);
	MOVF        DrawScreen_local_cimage_L0+0, 0 
	MOVWF       FARG_DrawCImage_AImage+0 
	MOVF        DrawScreen_local_cimage_L0+1, 0 
	MOVWF       FARG_DrawCImage_AImage+1 
	MOVF        DrawScreen_local_cimage_L0+2, 0 
	MOVWF       FARG_DrawCImage_AImage+2 
	CALL        _DrawCImage+0, 0
;CHi_Hub_VGCLD_driver.c,2345 :: 		}
L_DrawScreen48:
;CHi_Hub_VGCLD_driver.c,2346 :: 		}
L_DrawScreen47:
;CHi_Hub_VGCLD_driver.c,2348 :: 		}
	GOTO        L_DrawScreen33
L_DrawScreen34:
;CHi_Hub_VGCLD_driver.c,2349 :: 		}
L_end_DrawScreen:
	RETURN      0
; end of _DrawScreen

_Get_Object:

;CHi_Hub_VGCLD_driver.c,2351 :: 		void Get_Object(unsigned int X, unsigned int Y) {
;CHi_Hub_VGCLD_driver.c,2352 :: 		round_button_order  = -1;
	MOVLW       255
	MOVWF       _round_button_order+0 
	MOVLW       255
	MOVWF       _round_button_order+1 
;CHi_Hub_VGCLD_driver.c,2353 :: 		round_cbutton_order = -1;
	MOVLW       255
	MOVWF       _round_cbutton_order+0 
	MOVLW       255
	MOVWF       _round_cbutton_order+1 
;CHi_Hub_VGCLD_driver.c,2354 :: 		label_order         = -1;
	MOVLW       255
	MOVWF       _label_order+0 
	MOVLW       255
	MOVWF       _label_order+1 
;CHi_Hub_VGCLD_driver.c,2355 :: 		clabel_order        = -1;
	MOVLW       255
	MOVWF       _clabel_order+0 
	MOVLW       255
	MOVWF       _clabel_order+1 
;CHi_Hub_VGCLD_driver.c,2356 :: 		image_order         = -1;
	MOVLW       255
	MOVWF       _image_order+0 
	MOVLW       255
	MOVWF       _image_order+1 
;CHi_Hub_VGCLD_driver.c,2357 :: 		cimage_order        = -1;
	MOVLW       255
	MOVWF       _cimage_order+0 
	MOVLW       255
	MOVWF       _cimage_order+1 
;CHi_Hub_VGCLD_driver.c,2358 :: 		box_order           = -1;
	MOVLW       255
	MOVWF       _box_order+0 
	MOVLW       255
	MOVWF       _box_order+1 
;CHi_Hub_VGCLD_driver.c,2360 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
	CLRF        __object_count+0 
	CLRF        __object_count+1 
L_Get_Object49:
	MOVLW       1
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       __object_count+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_Object229
	MOVF        R1, 0 
	SUBWF       __object_count+0, 0 
L__Get_Object229:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_Object50
;CHi_Hub_VGCLD_driver.c,2361 :: 		local_round_button = GetRoundButton(_object_count);
	MOVLW       3
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        __object_count+0, 0 
	MOVWF       R0 
	MOVF        __object_count+1, 0 
	MOVWF       R1 
	MOVLW       0
	BTFSC       __object_count+1, 7 
	MOVLW       255
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R0, 0 
	MOVWF       _local_round_button+0 
	MOVF        R1, 0 
	MOVWF       _local_round_button+1 
;CHi_Hub_VGCLD_driver.c,2362 :: 		if (local_round_button->Active == 1) {
	MOVLW       8
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_Object52
;CHi_Hub_VGCLD_driver.c,2363 :: 		if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
	MOVF        FARG_Get_Object_X+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+0 
	MOVF        FARG_Get_Object_X+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+1 
	MOVF        FARG_Get_Object_Y+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+0 
	MOVF        FARG_Get_Object_Y+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+1 
	MOVLW       3
	ADDWF       _local_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+1 
	MOVLW       4
	ADDWF       _local_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+1 
;CHi_Hub_VGCLD_driver.c,2364 :: 		local_round_button->Width, local_round_button->Height) == 1) {
	MOVLW       5
	ADDWF       _local_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+1 
	MOVLW       6
	ADDWF       _local_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+1 
	CALL        CHi_Hub_VGCLD_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_Object53
;CHi_Hub_VGCLD_driver.c,2365 :: 		round_button_order = local_round_button->Order;
	MOVLW       2
	ADDWF       _local_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _round_button_order+0 
	MOVLW       0
	MOVWF       _round_button_order+1 
	MOVLW       0
	MOVWF       _round_button_order+1 
;CHi_Hub_VGCLD_driver.c,2366 :: 		exec_round_button = local_round_button;
	MOVF        _local_round_button+0, 0 
	MOVWF       _exec_round_button+0 
	MOVF        _local_round_button+1, 0 
	MOVWF       _exec_round_button+1 
;CHi_Hub_VGCLD_driver.c,2367 :: 		}
L_Get_Object53:
;CHi_Hub_VGCLD_driver.c,2368 :: 		}
L_Get_Object52:
;CHi_Hub_VGCLD_driver.c,2360 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
	INFSNZ      __object_count+0, 1 
	INCF        __object_count+1, 1 
;CHi_Hub_VGCLD_driver.c,2369 :: 		}
	GOTO        L_Get_Object49
L_Get_Object50:
;CHi_Hub_VGCLD_driver.c,2372 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CButtons_RoundCount ; _object_count++ ) {
	CLRF        __object_count+0 
	CLRF        __object_count+1 
L_Get_Object54:
	MOVLW       6
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       __object_count+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_Object230
	MOVF        R1, 0 
	SUBWF       __object_count+0, 0 
L__Get_Object230:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_Object55
;CHi_Hub_VGCLD_driver.c,2373 :: 		local_round_cbutton = GetCRoundButton(_object_count);
	MOVLW       8
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        __object_count+0, 0 
	MOVWF       R4 
	MOVF        __object_count+1, 0 
	MOVWF       R5 
	MOVLW       0
	BTFSC       __object_count+1, 7 
	MOVLW       255
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVF        R0, 0 
	MOVWF       _local_round_cbutton+0 
	MOVF        R1, 0 
	MOVWF       _local_round_cbutton+1 
	MOVF        R2, 0 
	MOVWF       _local_round_cbutton+2 
;CHi_Hub_VGCLD_driver.c,2374 :: 		if (local_round_cbutton->Active == 1) {
	MOVLW       8
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_Object57
;CHi_Hub_VGCLD_driver.c,2375 :: 		if (IsInsideObject(X, Y, local_round_cbutton->Left, local_round_cbutton->Top,
	MOVF        FARG_Get_Object_X+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+0 
	MOVF        FARG_Get_Object_X+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+1 
	MOVF        FARG_Get_Object_Y+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+0 
	MOVF        FARG_Get_Object_Y+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+1 
	MOVLW       3
	ADDWF       _local_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+0
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+1 
	MOVLW       4
	ADDWF       _local_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+0
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+1 
;CHi_Hub_VGCLD_driver.c,2376 :: 		local_round_cbutton->Width, local_round_cbutton->Height) == 1) {
	MOVLW       5
	ADDWF       _local_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+0
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+1 
	MOVLW       6
	ADDWF       _local_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+0
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+1 
	CALL        CHi_Hub_VGCLD_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_Object58
;CHi_Hub_VGCLD_driver.c,2377 :: 		round_cbutton_order = local_round_cbutton->Order;
	MOVLW       2
	ADDWF       _local_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, _round_cbutton_order+0
	MOVLW       0
	MOVWF       _round_cbutton_order+1 
;CHi_Hub_VGCLD_driver.c,2378 :: 		exec_round_cbutton = local_round_cbutton;
	MOVF        _local_round_cbutton+0, 0 
	MOVWF       _exec_round_cbutton+0 
	MOVF        _local_round_cbutton+1, 0 
	MOVWF       _exec_round_cbutton+1 
	MOVF        _local_round_cbutton+2, 0 
	MOVWF       _exec_round_cbutton+2 
;CHi_Hub_VGCLD_driver.c,2379 :: 		}
L_Get_Object58:
;CHi_Hub_VGCLD_driver.c,2380 :: 		}
L_Get_Object57:
;CHi_Hub_VGCLD_driver.c,2372 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CButtons_RoundCount ; _object_count++ ) {
	INFSNZ      __object_count+0, 1 
	INCF        __object_count+1, 1 
;CHi_Hub_VGCLD_driver.c,2381 :: 		}
	GOTO        L_Get_Object54
L_Get_Object55:
;CHi_Hub_VGCLD_driver.c,2384 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
	CLRF        __object_count+0 
	CLRF        __object_count+1 
L_Get_Object59:
	MOVLW       11
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       __object_count+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_Object231
	MOVF        R1, 0 
	SUBWF       __object_count+0, 0 
L__Get_Object231:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_Object60
;CHi_Hub_VGCLD_driver.c,2385 :: 		local_label = GetLabel(_object_count);
	MOVLW       13
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        __object_count+0, 0 
	MOVWF       R0 
	MOVF        __object_count+1, 0 
	MOVWF       R1 
	MOVLW       0
	BTFSC       __object_count+1, 7 
	MOVLW       255
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R0, 0 
	MOVWF       _local_label+0 
	MOVF        R1, 0 
	MOVWF       _local_label+1 
;CHi_Hub_VGCLD_driver.c,2386 :: 		if (local_label->Active == 1) {
	MOVLW       14
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_Object62
;CHi_Hub_VGCLD_driver.c,2387 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
	MOVF        FARG_Get_Object_X+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+0 
	MOVF        FARG_Get_Object_X+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+1 
	MOVF        FARG_Get_Object_Y+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+0 
	MOVF        FARG_Get_Object_Y+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+1 
	MOVLW       3
	ADDWF       _local_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+1 
	MOVLW       4
	ADDWF       _local_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+1 
;CHi_Hub_VGCLD_driver.c,2388 :: 		local_label->Width, local_label->Height) == 1) {
	MOVLW       5
	ADDWF       _local_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+1 
	MOVLW       6
	ADDWF       _local_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+1 
	CALL        CHi_Hub_VGCLD_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_Object63
;CHi_Hub_VGCLD_driver.c,2389 :: 		label_order = local_label->Order;
	MOVLW       2
	ADDWF       _local_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _label_order+0 
	MOVLW       0
	MOVWF       _label_order+1 
	MOVLW       0
	MOVWF       _label_order+1 
;CHi_Hub_VGCLD_driver.c,2390 :: 		exec_label = local_label;
	MOVF        _local_label+0, 0 
	MOVWF       _exec_label+0 
	MOVF        _local_label+1, 0 
	MOVWF       _exec_label+1 
;CHi_Hub_VGCLD_driver.c,2391 :: 		}
L_Get_Object63:
;CHi_Hub_VGCLD_driver.c,2392 :: 		}
L_Get_Object62:
;CHi_Hub_VGCLD_driver.c,2384 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
	INFSNZ      __object_count+0, 1 
	INCF        __object_count+1, 1 
;CHi_Hub_VGCLD_driver.c,2393 :: 		}
	GOTO        L_Get_Object59
L_Get_Object60:
;CHi_Hub_VGCLD_driver.c,2396 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CLabelsCount ; _object_count++ ) {
	CLRF        __object_count+0 
	CLRF        __object_count+1 
L_Get_Object64:
	MOVLW       16
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       __object_count+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_Object232
	MOVF        R1, 0 
	SUBWF       __object_count+0, 0 
L__Get_Object232:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_Object65
;CHi_Hub_VGCLD_driver.c,2397 :: 		local_clabel = GetCLabel(_object_count);
	MOVLW       18
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        __object_count+0, 0 
	MOVWF       R4 
	MOVF        __object_count+1, 0 
	MOVWF       R5 
	MOVLW       0
	BTFSC       __object_count+1, 7 
	MOVLW       255
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVF        R0, 0 
	MOVWF       _local_clabel+0 
	MOVF        R1, 0 
	MOVWF       _local_clabel+1 
	MOVF        R2, 0 
	MOVWF       _local_clabel+2 
;CHi_Hub_VGCLD_driver.c,2398 :: 		if (local_clabel->Active == 1) {
	MOVLW       15
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_Object67
;CHi_Hub_VGCLD_driver.c,2399 :: 		if (IsInsideObject(X, Y, local_clabel->Left, local_clabel->Top,
	MOVF        FARG_Get_Object_X+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+0 
	MOVF        FARG_Get_Object_X+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+1 
	MOVF        FARG_Get_Object_Y+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+0 
	MOVF        FARG_Get_Object_Y+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+1 
	MOVLW       3
	ADDWF       _local_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+0
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+1 
	MOVLW       4
	ADDWF       _local_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+0
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+1 
;CHi_Hub_VGCLD_driver.c,2400 :: 		local_clabel->Width, local_clabel->Height) == 1) {
	MOVLW       5
	ADDWF       _local_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+0
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+1 
	MOVLW       6
	ADDWF       _local_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+0
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+1 
	CALL        CHi_Hub_VGCLD_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_Object68
;CHi_Hub_VGCLD_driver.c,2401 :: 		clabel_order = local_clabel->Order;
	MOVLW       2
	ADDWF       _local_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, _clabel_order+0
	MOVLW       0
	MOVWF       _clabel_order+1 
;CHi_Hub_VGCLD_driver.c,2402 :: 		exec_clabel = local_clabel;
	MOVF        _local_clabel+0, 0 
	MOVWF       _exec_clabel+0 
	MOVF        _local_clabel+1, 0 
	MOVWF       _exec_clabel+1 
	MOVF        _local_clabel+2, 0 
	MOVWF       _exec_clabel+2 
;CHi_Hub_VGCLD_driver.c,2403 :: 		}
L_Get_Object68:
;CHi_Hub_VGCLD_driver.c,2404 :: 		}
L_Get_Object67:
;CHi_Hub_VGCLD_driver.c,2396 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CLabelsCount ; _object_count++ ) {
	INFSNZ      __object_count+0, 1 
	INCF        __object_count+1, 1 
;CHi_Hub_VGCLD_driver.c,2405 :: 		}
	GOTO        L_Get_Object64
L_Get_Object65:
;CHi_Hub_VGCLD_driver.c,2408 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
	CLRF        __object_count+0 
	CLRF        __object_count+1 
L_Get_Object69:
	MOVLW       21
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       __object_count+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_Object233
	MOVF        R1, 0 
	SUBWF       __object_count+0, 0 
L__Get_Object233:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_Object70
;CHi_Hub_VGCLD_driver.c,2409 :: 		local_image = GetImage(_object_count);
	MOVLW       23
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        __object_count+0, 0 
	MOVWF       R0 
	MOVF        __object_count+1, 0 
	MOVWF       R1 
	MOVLW       0
	BTFSC       __object_count+1, 7 
	MOVLW       255
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R0, 0 
	MOVWF       _local_image+0 
	MOVF        R1, 0 
	MOVWF       _local_image+1 
;CHi_Hub_VGCLD_driver.c,2410 :: 		if (local_image->Active == 1) {
	MOVLW       13
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_Object72
;CHi_Hub_VGCLD_driver.c,2411 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
	MOVF        FARG_Get_Object_X+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+0 
	MOVF        FARG_Get_Object_X+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+1 
	MOVF        FARG_Get_Object_Y+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+0 
	MOVF        FARG_Get_Object_Y+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+1 
	MOVLW       3
	ADDWF       _local_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+1 
	MOVLW       4
	ADDWF       _local_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+1 
;CHi_Hub_VGCLD_driver.c,2412 :: 		local_image->Width, local_image->Height) == 1) {
	MOVLW       5
	ADDWF       _local_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+1 
	MOVLW       6
	ADDWF       _local_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+1 
	CALL        CHi_Hub_VGCLD_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_Object73
;CHi_Hub_VGCLD_driver.c,2413 :: 		image_order = local_image->Order;
	MOVLW       2
	ADDWF       _local_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _image_order+0 
	MOVLW       0
	MOVWF       _image_order+1 
	MOVLW       0
	MOVWF       _image_order+1 
;CHi_Hub_VGCLD_driver.c,2414 :: 		exec_image = local_image;
	MOVF        _local_image+0, 0 
	MOVWF       _exec_image+0 
	MOVF        _local_image+1, 0 
	MOVWF       _exec_image+1 
;CHi_Hub_VGCLD_driver.c,2415 :: 		}
L_Get_Object73:
;CHi_Hub_VGCLD_driver.c,2416 :: 		}
L_Get_Object72:
;CHi_Hub_VGCLD_driver.c,2408 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
	INFSNZ      __object_count+0, 1 
	INCF        __object_count+1, 1 
;CHi_Hub_VGCLD_driver.c,2417 :: 		}
	GOTO        L_Get_Object69
L_Get_Object70:
;CHi_Hub_VGCLD_driver.c,2420 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CImagesCount ; _object_count++ ) {
	CLRF        __object_count+0 
	CLRF        __object_count+1 
L_Get_Object74:
	MOVLW       26
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       __object_count+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_Object234
	MOVF        R1, 0 
	SUBWF       __object_count+0, 0 
L__Get_Object234:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_Object75
;CHi_Hub_VGCLD_driver.c,2421 :: 		local_cimage = GetCImage(_object_count);
	MOVLW       28
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        __object_count+0, 0 
	MOVWF       R4 
	MOVF        __object_count+1, 0 
	MOVWF       R5 
	MOVLW       0
	BTFSC       __object_count+1, 7 
	MOVLW       255
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVF        R0, 0 
	MOVWF       _local_cimage+0 
	MOVF        R1, 0 
	MOVWF       _local_cimage+1 
	MOVF        R2, 0 
	MOVWF       _local_cimage+2 
;CHi_Hub_VGCLD_driver.c,2422 :: 		if (local_cimage->Active == 1) {
	MOVLW       13
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_Object77
;CHi_Hub_VGCLD_driver.c,2423 :: 		if (IsInsideObject(X, Y, local_cimage->Left, local_cimage->Top,
	MOVF        FARG_Get_Object_X+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+0 
	MOVF        FARG_Get_Object_X+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+1 
	MOVF        FARG_Get_Object_Y+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+0 
	MOVF        FARG_Get_Object_Y+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+1 
	MOVLW       3
	ADDWF       _local_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+0
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+1 
	MOVLW       4
	ADDWF       _local_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+0
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+1 
;CHi_Hub_VGCLD_driver.c,2424 :: 		local_cimage->Width, local_cimage->Height) == 1) {
	MOVLW       5
	ADDWF       _local_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+0
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+1 
	MOVLW       6
	ADDWF       _local_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+0
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+1 
	CALL        CHi_Hub_VGCLD_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_Object78
;CHi_Hub_VGCLD_driver.c,2425 :: 		cimage_order = local_cimage->Order;
	MOVLW       2
	ADDWF       _local_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _local_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _local_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, _cimage_order+0
	MOVLW       0
	MOVWF       _cimage_order+1 
;CHi_Hub_VGCLD_driver.c,2426 :: 		exec_cimage = local_cimage;
	MOVF        _local_cimage+0, 0 
	MOVWF       _exec_cimage+0 
	MOVF        _local_cimage+1, 0 
	MOVWF       _exec_cimage+1 
	MOVF        _local_cimage+2, 0 
	MOVWF       _exec_cimage+2 
;CHi_Hub_VGCLD_driver.c,2427 :: 		}
L_Get_Object78:
;CHi_Hub_VGCLD_driver.c,2428 :: 		}
L_Get_Object77:
;CHi_Hub_VGCLD_driver.c,2420 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CImagesCount ; _object_count++ ) {
	INFSNZ      __object_count+0, 1 
	INCF        __object_count+1, 1 
;CHi_Hub_VGCLD_driver.c,2429 :: 		}
	GOTO        L_Get_Object74
L_Get_Object75:
;CHi_Hub_VGCLD_driver.c,2432 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
	CLRF        __object_count+0 
	CLRF        __object_count+1 
L_Get_Object79:
	MOVLW       31
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       __object_count+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_Object235
	MOVF        R1, 0 
	SUBWF       __object_count+0, 0 
L__Get_Object235:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_Object80
;CHi_Hub_VGCLD_driver.c,2433 :: 		local_box = GetBox(_object_count);
	MOVLW       33
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        __object_count+0, 0 
	MOVWF       R0 
	MOVF        __object_count+1, 0 
	MOVWF       R1 
	MOVLW       0
	BTFSC       __object_count+1, 7 
	MOVLW       255
	MOVWF       R2 
	MOVWF       R3 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R2, 1 
	RLCF        R3, 1 
	MOVF        POSTINC0+0, 0 
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R1, 0 
	MOVWF       TBLPTRH 
	MOVF        POSTINC0+0, 0 
	ADDWFC      R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R0, 0 
	MOVWF       _local_box+0 
	MOVF        R1, 0 
	MOVWF       _local_box+1 
;CHi_Hub_VGCLD_driver.c,2434 :: 		if (local_box->Active == 1) {
	MOVLW       8
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_Object82
;CHi_Hub_VGCLD_driver.c,2435 :: 		if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
	MOVF        FARG_Get_Object_X+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+0 
	MOVF        FARG_Get_Object_X+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_X+1 
	MOVF        FARG_Get_Object_Y+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+0 
	MOVF        FARG_Get_Object_Y+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Y+1 
	MOVLW       3
	ADDWF       _local_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Left+1 
	MOVLW       4
	ADDWF       _local_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Top+1 
;CHi_Hub_VGCLD_driver.c,2436 :: 		local_box->Width, local_box->Height) == 1) {
	MOVLW       5
	ADDWF       _local_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Width+1 
	MOVLW       6
	ADDWF       _local_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+0 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+1 
	MOVLW       0
	MOVWF       FARG_CHi_Hub_VGCLD_driver_IsInsideObject_Height+1 
	CALL        CHi_Hub_VGCLD_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_Object83
;CHi_Hub_VGCLD_driver.c,2437 :: 		box_order = local_box->Order;
	MOVLW       2
	ADDWF       _local_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _local_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _box_order+0 
	MOVLW       0
	MOVWF       _box_order+1 
	MOVLW       0
	MOVWF       _box_order+1 
;CHi_Hub_VGCLD_driver.c,2438 :: 		exec_box = local_box;
	MOVF        _local_box+0, 0 
	MOVWF       _exec_box+0 
	MOVF        _local_box+1, 0 
	MOVWF       _exec_box+1 
;CHi_Hub_VGCLD_driver.c,2439 :: 		}
L_Get_Object83:
;CHi_Hub_VGCLD_driver.c,2440 :: 		}
L_Get_Object82:
;CHi_Hub_VGCLD_driver.c,2432 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
	INFSNZ      __object_count+0, 1 
	INCF        __object_count+1, 1 
;CHi_Hub_VGCLD_driver.c,2441 :: 		}
	GOTO        L_Get_Object79
L_Get_Object80:
;CHi_Hub_VGCLD_driver.c,2443 :: 		_object_count = -1;
	MOVLW       255
	MOVWF       __object_count+0 
	MOVLW       255
	MOVWF       __object_count+1 
;CHi_Hub_VGCLD_driver.c,2444 :: 		if (round_button_order > _object_count)
	MOVLW       128
	XORLW       255
	MOVWF       R0 
	MOVLW       128
	XORWF       _round_button_order+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_Object236
	MOVF        _round_button_order+0, 0 
	SUBLW       255
L__Get_Object236:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_Object84
;CHi_Hub_VGCLD_driver.c,2445 :: 		_object_count = round_button_order;
	MOVF        _round_button_order+0, 0 
	MOVWF       __object_count+0 
	MOVF        _round_button_order+1, 0 
	MOVWF       __object_count+1 
L_Get_Object84:
;CHi_Hub_VGCLD_driver.c,2446 :: 		if (round_cbutton_order >  _object_count )
	MOVLW       128
	XORWF       __object_count+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _round_cbutton_order+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_Object237
	MOVF        _round_cbutton_order+0, 0 
	SUBWF       __object_count+0, 0 
L__Get_Object237:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_Object85
;CHi_Hub_VGCLD_driver.c,2447 :: 		_object_count = round_cbutton_order;
	MOVF        _round_cbutton_order+0, 0 
	MOVWF       __object_count+0 
	MOVF        _round_cbutton_order+1, 0 
	MOVWF       __object_count+1 
L_Get_Object85:
;CHi_Hub_VGCLD_driver.c,2448 :: 		if (label_order >  _object_count )
	MOVLW       128
	XORWF       __object_count+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _label_order+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_Object238
	MOVF        _label_order+0, 0 
	SUBWF       __object_count+0, 0 
L__Get_Object238:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_Object86
;CHi_Hub_VGCLD_driver.c,2449 :: 		_object_count = label_order;
	MOVF        _label_order+0, 0 
	MOVWF       __object_count+0 
	MOVF        _label_order+1, 0 
	MOVWF       __object_count+1 
L_Get_Object86:
;CHi_Hub_VGCLD_driver.c,2450 :: 		if (clabel_order >  _object_count )
	MOVLW       128
	XORWF       __object_count+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _clabel_order+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_Object239
	MOVF        _clabel_order+0, 0 
	SUBWF       __object_count+0, 0 
L__Get_Object239:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_Object87
;CHi_Hub_VGCLD_driver.c,2451 :: 		_object_count = clabel_order;
	MOVF        _clabel_order+0, 0 
	MOVWF       __object_count+0 
	MOVF        _clabel_order+1, 0 
	MOVWF       __object_count+1 
L_Get_Object87:
;CHi_Hub_VGCLD_driver.c,2452 :: 		if (image_order >  _object_count )
	MOVLW       128
	XORWF       __object_count+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _image_order+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_Object240
	MOVF        _image_order+0, 0 
	SUBWF       __object_count+0, 0 
L__Get_Object240:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_Object88
;CHi_Hub_VGCLD_driver.c,2453 :: 		_object_count = image_order;
	MOVF        _image_order+0, 0 
	MOVWF       __object_count+0 
	MOVF        _image_order+1, 0 
	MOVWF       __object_count+1 
L_Get_Object88:
;CHi_Hub_VGCLD_driver.c,2454 :: 		if (cimage_order >  _object_count )
	MOVLW       128
	XORWF       __object_count+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _cimage_order+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_Object241
	MOVF        _cimage_order+0, 0 
	SUBWF       __object_count+0, 0 
L__Get_Object241:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_Object89
;CHi_Hub_VGCLD_driver.c,2455 :: 		_object_count = cimage_order;
	MOVF        _cimage_order+0, 0 
	MOVWF       __object_count+0 
	MOVF        _cimage_order+1, 0 
	MOVWF       __object_count+1 
L_Get_Object89:
;CHi_Hub_VGCLD_driver.c,2456 :: 		if (box_order >  _object_count )
	MOVLW       128
	XORWF       __object_count+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _box_order+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_Object242
	MOVF        _box_order+0, 0 
	SUBWF       __object_count+0, 0 
L__Get_Object242:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_Object90
;CHi_Hub_VGCLD_driver.c,2457 :: 		_object_count = box_order;
	MOVF        _box_order+0, 0 
	MOVWF       __object_count+0 
	MOVF        _box_order+1, 0 
	MOVWF       __object_count+1 
L_Get_Object90:
;CHi_Hub_VGCLD_driver.c,2458 :: 		}
L_end_Get_Object:
	RETURN      0
; end of _Get_Object

CHi_Hub_VGCLD_driver_Process_TP_Press:

;CHi_Hub_VGCLD_driver.c,2461 :: 		static void Process_TP_Press(unsigned int X, unsigned int Y) {
;CHi_Hub_VGCLD_driver.c,2462 :: 		exec_round_button   = 0;
	CLRF        _exec_round_button+0 
	CLRF        _exec_round_button+1 
;CHi_Hub_VGCLD_driver.c,2463 :: 		exec_round_cbutton  = 0;
	CLRF        _exec_round_cbutton+0 
	CLRF        _exec_round_cbutton+1 
	CLRF        _exec_round_cbutton+2 
;CHi_Hub_VGCLD_driver.c,2464 :: 		exec_label          = 0;
	CLRF        _exec_label+0 
	CLRF        _exec_label+1 
;CHi_Hub_VGCLD_driver.c,2465 :: 		exec_clabel         = 0;
	CLRF        _exec_clabel+0 
	CLRF        _exec_clabel+1 
	CLRF        _exec_clabel+2 
;CHi_Hub_VGCLD_driver.c,2466 :: 		exec_image          = 0;
	CLRF        _exec_image+0 
	CLRF        _exec_image+1 
;CHi_Hub_VGCLD_driver.c,2467 :: 		exec_cimage         = 0;
	CLRF        _exec_cimage+0 
	CLRF        _exec_cimage+1 
	CLRF        _exec_cimage+2 
;CHi_Hub_VGCLD_driver.c,2468 :: 		exec_box            = 0;
	CLRF        _exec_box+0 
	CLRF        _exec_box+1 
;CHi_Hub_VGCLD_driver.c,2470 :: 		Get_Object(X, Y);
	MOVF        FARG_CHi_Hub_VGCLD_driver_Process_TP_Press_X+0, 0 
	MOVWF       FARG_Get_Object_X+0 
	MOVF        FARG_CHi_Hub_VGCLD_driver_Process_TP_Press_X+1, 0 
	MOVWF       FARG_Get_Object_X+1 
	MOVF        FARG_CHi_Hub_VGCLD_driver_Process_TP_Press_Y+0, 0 
	MOVWF       FARG_Get_Object_Y+0 
	MOVF        FARG_CHi_Hub_VGCLD_driver_Process_TP_Press_Y+1, 0 
	MOVWF       FARG_Get_Object_Y+1 
	CALL        _Get_Object+0, 0
;CHi_Hub_VGCLD_driver.c,2473 :: 		if (_object_count != -1) {
	MOVLW       255
	XORWF       __object_count+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press244
	MOVLW       255
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Press244:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press91
;CHi_Hub_VGCLD_driver.c,2474 :: 		if (_object_count == round_button_order) {
	MOVF        __object_count+1, 0 
	XORWF       _round_button_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press245
	MOVF        _round_button_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Press245:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press92
;CHi_Hub_VGCLD_driver.c,2475 :: 		if (exec_round_button->Active == 1) {
	MOVLW       8
	ADDWF       _exec_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press93
;CHi_Hub_VGCLD_driver.c,2476 :: 		if (exec_round_button->OnPressPtr != 0) {
	MOVLW       29
	ADDWF       _exec_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press246
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press246
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press246
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Press246:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press94
;CHi_Hub_VGCLD_driver.c,2477 :: 		exec_round_button->OnPressPtr();
	MOVLW       29
	ADDWF       _exec_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;CHi_Hub_VGCLD_driver.c,2478 :: 		return;
	GOTO        L_end_Process_TP_Press
;CHi_Hub_VGCLD_driver.c,2479 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press94:
;CHi_Hub_VGCLD_driver.c,2480 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press93:
;CHi_Hub_VGCLD_driver.c,2481 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press92:
;CHi_Hub_VGCLD_driver.c,2483 :: 		if (_object_count == round_cbutton_order) {
	MOVF        __object_count+1, 0 
	XORWF       _round_cbutton_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press247
	MOVF        _round_cbutton_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Press247:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press95
;CHi_Hub_VGCLD_driver.c,2484 :: 		if (exec_round_cbutton->Active == 1) {
	MOVLW       8
	ADDWF       _exec_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press96
;CHi_Hub_VGCLD_driver.c,2485 :: 		if (exec_round_cbutton->OnPressPtr != 0) {
	MOVLW       30
	ADDWF       _exec_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	TBLRD*+
	MOVFF       TABLAT+0, R4
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press248
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press248
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press248
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Press248:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press97
;CHi_Hub_VGCLD_driver.c,2486 :: 		exec_round_cbutton->OnPressPtr();
	MOVLW       30
	ADDWF       _exec_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	CALL        _____DoIFC+0, 0
;CHi_Hub_VGCLD_driver.c,2487 :: 		return;
	GOTO        L_end_Process_TP_Press
;CHi_Hub_VGCLD_driver.c,2488 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press97:
;CHi_Hub_VGCLD_driver.c,2489 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press96:
;CHi_Hub_VGCLD_driver.c,2490 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press95:
;CHi_Hub_VGCLD_driver.c,2492 :: 		if (_object_count == label_order) {
	MOVF        __object_count+1, 0 
	XORWF       _label_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press249
	MOVF        _label_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Press249:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press98
;CHi_Hub_VGCLD_driver.c,2493 :: 		if (exec_label->Active == 1) {
	MOVLW       14
	ADDWF       _exec_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press99
;CHi_Hub_VGCLD_driver.c,2494 :: 		if (exec_label->OnPressPtr != 0) {
	MOVLW       27
	ADDWF       _exec_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press250
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press250
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press250
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Press250:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press100
;CHi_Hub_VGCLD_driver.c,2495 :: 		exec_label->OnPressPtr();
	MOVLW       27
	ADDWF       _exec_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;CHi_Hub_VGCLD_driver.c,2496 :: 		return;
	GOTO        L_end_Process_TP_Press
;CHi_Hub_VGCLD_driver.c,2497 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press100:
;CHi_Hub_VGCLD_driver.c,2498 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press99:
;CHi_Hub_VGCLD_driver.c,2499 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press98:
;CHi_Hub_VGCLD_driver.c,2501 :: 		if (_object_count == clabel_order) {
	MOVF        __object_count+1, 0 
	XORWF       _clabel_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press251
	MOVF        _clabel_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Press251:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press101
;CHi_Hub_VGCLD_driver.c,2502 :: 		if (exec_clabel->Active == 1) {
	MOVLW       15
	ADDWF       _exec_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press102
;CHi_Hub_VGCLD_driver.c,2503 :: 		if (exec_clabel->OnPressPtr != 0) {
	MOVLW       28
	ADDWF       _exec_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	TBLRD*+
	MOVFF       TABLAT+0, R4
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press252
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press252
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press252
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Press252:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press103
;CHi_Hub_VGCLD_driver.c,2504 :: 		exec_clabel->OnPressPtr();
	MOVLW       28
	ADDWF       _exec_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	CALL        _____DoIFC+0, 0
;CHi_Hub_VGCLD_driver.c,2505 :: 		return;
	GOTO        L_end_Process_TP_Press
;CHi_Hub_VGCLD_driver.c,2506 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press103:
;CHi_Hub_VGCLD_driver.c,2507 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press102:
;CHi_Hub_VGCLD_driver.c,2508 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press101:
;CHi_Hub_VGCLD_driver.c,2510 :: 		if (_object_count == image_order) {
	MOVF        __object_count+1, 0 
	XORWF       _image_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press253
	MOVF        _image_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Press253:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press104
;CHi_Hub_VGCLD_driver.c,2511 :: 		if (exec_image->Active == 1) {
	MOVLW       13
	ADDWF       _exec_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press105
;CHi_Hub_VGCLD_driver.c,2512 :: 		if (exec_image->OnPressPtr != 0) {
	MOVLW       26
	ADDWF       _exec_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press254
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press254
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press254
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Press254:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press106
;CHi_Hub_VGCLD_driver.c,2513 :: 		exec_image->OnPressPtr();
	MOVLW       26
	ADDWF       _exec_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;CHi_Hub_VGCLD_driver.c,2514 :: 		return;
	GOTO        L_end_Process_TP_Press
;CHi_Hub_VGCLD_driver.c,2515 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press106:
;CHi_Hub_VGCLD_driver.c,2516 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press105:
;CHi_Hub_VGCLD_driver.c,2517 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press104:
;CHi_Hub_VGCLD_driver.c,2519 :: 		if (_object_count == cimage_order) {
	MOVF        __object_count+1, 0 
	XORWF       _cimage_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press255
	MOVF        _cimage_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Press255:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press107
;CHi_Hub_VGCLD_driver.c,2520 :: 		if (exec_cimage->Active == 1) {
	MOVLW       13
	ADDWF       _exec_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press108
;CHi_Hub_VGCLD_driver.c,2521 :: 		if (exec_cimage->OnPressPtr != 0) {
	MOVLW       26
	ADDWF       _exec_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	TBLRD*+
	MOVFF       TABLAT+0, R4
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press256
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press256
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press256
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Press256:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press109
;CHi_Hub_VGCLD_driver.c,2522 :: 		exec_cimage->OnPressPtr();
	MOVLW       26
	ADDWF       _exec_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	CALL        _____DoIFC+0, 0
;CHi_Hub_VGCLD_driver.c,2523 :: 		return;
	GOTO        L_end_Process_TP_Press
;CHi_Hub_VGCLD_driver.c,2524 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press109:
;CHi_Hub_VGCLD_driver.c,2525 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press108:
;CHi_Hub_VGCLD_driver.c,2526 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press107:
;CHi_Hub_VGCLD_driver.c,2528 :: 		if (_object_count == box_order) {
	MOVF        __object_count+1, 0 
	XORWF       _box_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press257
	MOVF        _box_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Press257:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press110
;CHi_Hub_VGCLD_driver.c,2529 :: 		if (exec_box->Active == 1) {
	MOVLW       8
	ADDWF       _exec_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press111
;CHi_Hub_VGCLD_driver.c,2530 :: 		if (exec_box->OnPressPtr != 0) {
	MOVLW       22
	ADDWF       _exec_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press258
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press258
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press258
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Press258:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Press112
;CHi_Hub_VGCLD_driver.c,2531 :: 		exec_box->OnPressPtr();
	MOVLW       22
	ADDWF       _exec_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;CHi_Hub_VGCLD_driver.c,2532 :: 		return;
	GOTO        L_end_Process_TP_Press
;CHi_Hub_VGCLD_driver.c,2533 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press112:
;CHi_Hub_VGCLD_driver.c,2534 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press111:
;CHi_Hub_VGCLD_driver.c,2535 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press110:
;CHi_Hub_VGCLD_driver.c,2537 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Press91:
;CHi_Hub_VGCLD_driver.c,2538 :: 		}
L_end_Process_TP_Press:
	RETURN      0
; end of CHi_Hub_VGCLD_driver_Process_TP_Press

CHi_Hub_VGCLD_driver_Process_TP_Up:

;CHi_Hub_VGCLD_driver.c,2540 :: 		static void Process_TP_Up(unsigned int X, unsigned int Y) {
;CHi_Hub_VGCLD_driver.c,2542 :: 		switch (PressedObjectType) {
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up113
;CHi_Hub_VGCLD_driver.c,2544 :: 		case 1: {
L_CHi_Hub_VGCLD_driver_Process_TP_Up115:
;CHi_Hub_VGCLD_driver.c,2545 :: 		if (PressedObject != 0) {
	MOVLW       0
	MOVWF       R0 
	XORWF       _PressedObject+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up260
	MOVF        R0, 0 
	XORWF       _PressedObject+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up260
	MOVF        R0, 0 
	XORWF       _PressedObject+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up260
	MOVF        _PressedObject+0, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up260:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up116
;CHi_Hub_VGCLD_driver.c,2546 :: 		exec_round_button = (TButton_Round*)PressedObject;
	MOVF        _PressedObject+0, 0 
	MOVWF       _exec_round_button+0 
	MOVF        _PressedObject+1, 0 
	MOVWF       _exec_round_button+1 
;CHi_Hub_VGCLD_driver.c,2547 :: 		if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
	MOVLW       16
	ADDWF       _PressedObject+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _PressedObject+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up119
	MOVFF       _exec_round_button+0, FSR0
	MOVFF       _exec_round_button+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	XORWF       _CurrentScreen+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up261
	MOVF        _CurrentScreen+0, 0 
	XORWF       R1, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up261:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up119
L_CHi_Hub_VGCLD_driver_Process_TP_Up196:
;CHi_Hub_VGCLD_driver.c,2548 :: 		DrawRoundButton(exec_round_button);
	MOVF        _exec_round_button+0, 0 
	MOVWF       FARG_DrawRoundButton_Around_button+0 
	MOVF        _exec_round_button+1, 0 
	MOVWF       FARG_DrawRoundButton_Around_button+1 
	CALL        _DrawRoundButton+0, 0
;CHi_Hub_VGCLD_driver.c,2549 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up119:
;CHi_Hub_VGCLD_driver.c,2550 :: 		break;
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up114
;CHi_Hub_VGCLD_driver.c,2551 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up116:
;CHi_Hub_VGCLD_driver.c,2552 :: 		break;
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up114
;CHi_Hub_VGCLD_driver.c,2555 :: 		case 9: {
L_CHi_Hub_VGCLD_driver_Process_TP_Up120:
;CHi_Hub_VGCLD_driver.c,2556 :: 		if (PressedObject != 0) {
	MOVLW       0
	MOVWF       R0 
	XORWF       _PressedObject+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up262
	MOVF        R0, 0 
	XORWF       _PressedObject+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up262
	MOVF        R0, 0 
	XORWF       _PressedObject+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up262
	MOVF        _PressedObject+0, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up262:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up121
;CHi_Hub_VGCLD_driver.c,2557 :: 		exec_round_cbutton = (TCButton_Round*)PressedObject;
	MOVF        _PressedObject+0, 0 
	MOVWF       _exec_round_cbutton+0 
	MOVF        _PressedObject+1, 0 
	MOVWF       _exec_round_cbutton+1 
	MOVF        _PressedObject+2, 0 
	MOVWF       _exec_round_cbutton+2 
;CHi_Hub_VGCLD_driver.c,2558 :: 		if ((exec_round_cbutton->PressColEnabled == 1) && (exec_round_cbutton->OwnerScreen == CurrentScreen)) {
	MOVLW       17
	ADDWF       _PressedObject+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _PressedObject+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _PressedObject+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up124
	MOVF        _exec_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVF        _exec_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVF        _exec_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVF        R2, 0 
	XORWF       _CurrentScreen+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up263
	MOVF        _CurrentScreen+0, 0 
	XORWF       R1, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up263:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up124
L_CHi_Hub_VGCLD_driver_Process_TP_Up195:
;CHi_Hub_VGCLD_driver.c,2559 :: 		DrawCRoundButton(exec_round_cbutton);
	MOVF        _exec_round_cbutton+0, 0 
	MOVWF       FARG_DrawCRoundButton_Around_button+0 
	MOVF        _exec_round_cbutton+1, 0 
	MOVWF       FARG_DrawCRoundButton_Around_button+1 
	MOVF        _exec_round_cbutton+2, 0 
	MOVWF       FARG_DrawCRoundButton_Around_button+2 
	CALL        _DrawCRoundButton+0, 0
;CHi_Hub_VGCLD_driver.c,2560 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up124:
;CHi_Hub_VGCLD_driver.c,2561 :: 		break;
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up114
;CHi_Hub_VGCLD_driver.c,2562 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up121:
;CHi_Hub_VGCLD_driver.c,2563 :: 		break;
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up114
;CHi_Hub_VGCLD_driver.c,2566 :: 		case 6: {
L_CHi_Hub_VGCLD_driver_Process_TP_Up125:
;CHi_Hub_VGCLD_driver.c,2567 :: 		if (PressedObject != 0) {
	MOVLW       0
	MOVWF       R0 
	XORWF       _PressedObject+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up264
	MOVF        R0, 0 
	XORWF       _PressedObject+2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up264
	MOVF        R0, 0 
	XORWF       _PressedObject+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up264
	MOVF        _PressedObject+0, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up264:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up126
;CHi_Hub_VGCLD_driver.c,2568 :: 		exec_box = (TBox*)PressedObject;
	MOVF        _PressedObject+0, 0 
	MOVWF       _exec_box+0 
	MOVF        _PressedObject+1, 0 
	MOVWF       _exec_box+1 
;CHi_Hub_VGCLD_driver.c,2569 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up126:
;CHi_Hub_VGCLD_driver.c,2570 :: 		break;
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up114
;CHi_Hub_VGCLD_driver.c,2572 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up113:
	MOVLW       0
	XORWF       _PressedObjectType+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up265
	MOVLW       1
	XORWF       _PressedObjectType+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up265:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up115
	MOVLW       0
	XORWF       _PressedObjectType+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up266
	MOVLW       9
	XORWF       _PressedObjectType+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up266:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up120
	MOVLW       0
	XORWF       _PressedObjectType+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up267
	MOVLW       6
	XORWF       _PressedObjectType+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up267:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up125
L_CHi_Hub_VGCLD_driver_Process_TP_Up114:
;CHi_Hub_VGCLD_driver.c,2574 :: 		exec_label          = 0;
	CLRF        _exec_label+0 
	CLRF        _exec_label+1 
;CHi_Hub_VGCLD_driver.c,2575 :: 		exec_clabel          = 0;
	CLRF        _exec_clabel+0 
	CLRF        _exec_clabel+1 
	CLRF        _exec_clabel+2 
;CHi_Hub_VGCLD_driver.c,2576 :: 		exec_image          = 0;
	CLRF        _exec_image+0 
	CLRF        _exec_image+1 
;CHi_Hub_VGCLD_driver.c,2577 :: 		exec_cimage          = 0;
	CLRF        _exec_cimage+0 
	CLRF        _exec_cimage+1 
	CLRF        _exec_cimage+2 
;CHi_Hub_VGCLD_driver.c,2579 :: 		Get_Object(X, Y);
	MOVF        FARG_CHi_Hub_VGCLD_driver_Process_TP_Up_X+0, 0 
	MOVWF       FARG_Get_Object_X+0 
	MOVF        FARG_CHi_Hub_VGCLD_driver_Process_TP_Up_X+1, 0 
	MOVWF       FARG_Get_Object_X+1 
	MOVF        FARG_CHi_Hub_VGCLD_driver_Process_TP_Up_Y+0, 0 
	MOVWF       FARG_Get_Object_Y+0 
	MOVF        FARG_CHi_Hub_VGCLD_driver_Process_TP_Up_Y+1, 0 
	MOVWF       FARG_Get_Object_Y+1 
	CALL        _Get_Object+0, 0
;CHi_Hub_VGCLD_driver.c,2582 :: 		if (_object_count != -1) {
	MOVLW       255
	XORWF       __object_count+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up268
	MOVLW       255
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up268:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up127
;CHi_Hub_VGCLD_driver.c,2584 :: 		if (_object_count == round_button_order) {
	MOVF        __object_count+1, 0 
	XORWF       _round_button_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up269
	MOVF        _round_button_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up269:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up128
;CHi_Hub_VGCLD_driver.c,2585 :: 		if (exec_round_button->Active == 1) {
	MOVLW       8
	ADDWF       _exec_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up129
;CHi_Hub_VGCLD_driver.c,2586 :: 		if (exec_round_button->OnUpPtr != 0)
	MOVLW       17
	ADDWF       _exec_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up270
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up270
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up270
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up270:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up130
;CHi_Hub_VGCLD_driver.c,2587 :: 		exec_round_button->OnUpPtr();
	MOVLW       17
	ADDWF       _exec_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_CHi_Hub_VGCLD_driver_Process_TP_Up130:
;CHi_Hub_VGCLD_driver.c,2588 :: 		if (PressedObject == (TPointer)exec_round_button)
	MOVF        _exec_round_button+0, 0 
	MOVWF       R1 
	MOVF        _exec_round_button+1, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R3 
	MOVWF       R4 
	MOVF        _PressedObject+3, 0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up271
	MOVF        _PressedObject+2, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up271
	MOVF        _PressedObject+1, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up271
	MOVF        _PressedObject+0, 0 
	XORWF       R1, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up271:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up131
;CHi_Hub_VGCLD_driver.c,2589 :: 		if (exec_round_button->OnClickPtr != 0)
	MOVLW       25
	ADDWF       _exec_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up272
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up272
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up272
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up272:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up132
;CHi_Hub_VGCLD_driver.c,2590 :: 		exec_round_button->OnClickPtr();
	MOVLW       25
	ADDWF       _exec_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_CHi_Hub_VGCLD_driver_Process_TP_Up132:
L_CHi_Hub_VGCLD_driver_Process_TP_Up131:
;CHi_Hub_VGCLD_driver.c,2591 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
	CLRF        _PressedObject+2 
	CLRF        _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2592 :: 		PressedObjectType = -1;
	MOVLW       255
	MOVWF       _PressedObjectType+0 
	MOVLW       255
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2593 :: 		return;
	GOTO        L_end_Process_TP_Up
;CHi_Hub_VGCLD_driver.c,2594 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up129:
;CHi_Hub_VGCLD_driver.c,2595 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up128:
;CHi_Hub_VGCLD_driver.c,2598 :: 		if (_object_count == round_cbutton_order) {
	MOVF        __object_count+1, 0 
	XORWF       _round_cbutton_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up273
	MOVF        _round_cbutton_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up273:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up133
;CHi_Hub_VGCLD_driver.c,2599 :: 		if (exec_round_cbutton->Active == 1) {
	MOVLW       8
	ADDWF       _exec_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up134
;CHi_Hub_VGCLD_driver.c,2600 :: 		if (exec_round_cbutton->OnUpPtr != 0)
	MOVLW       18
	ADDWF       _exec_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	TBLRD*+
	MOVFF       TABLAT+0, R4
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up274
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up274
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up274
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up274:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up135
;CHi_Hub_VGCLD_driver.c,2601 :: 		exec_round_cbutton->OnUpPtr();
	MOVLW       18
	ADDWF       _exec_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	CALL        _____DoIFC+0, 0
L_CHi_Hub_VGCLD_driver_Process_TP_Up135:
;CHi_Hub_VGCLD_driver.c,2602 :: 		if (PressedObject == (TPointer)exec_round_cbutton)
	MOVF        _exec_round_cbutton+0, 0 
	MOVWF       R1 
	MOVF        _exec_round_cbutton+1, 0 
	MOVWF       R2 
	MOVF        _exec_round_cbutton+2, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVF        _PressedObject+3, 0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up275
	MOVF        _PressedObject+2, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up275
	MOVF        _PressedObject+1, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up275
	MOVF        _PressedObject+0, 0 
	XORWF       R1, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up275:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up136
;CHi_Hub_VGCLD_driver.c,2603 :: 		if (exec_round_cbutton->OnClickPtr != 0)
	MOVLW       26
	ADDWF       _exec_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	TBLRD*+
	MOVFF       TABLAT+0, R4
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up276
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up276
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up276
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up276:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up137
;CHi_Hub_VGCLD_driver.c,2604 :: 		exec_round_cbutton->OnClickPtr();
	MOVLW       26
	ADDWF       _exec_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	CALL        _____DoIFC+0, 0
L_CHi_Hub_VGCLD_driver_Process_TP_Up137:
L_CHi_Hub_VGCLD_driver_Process_TP_Up136:
;CHi_Hub_VGCLD_driver.c,2605 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
	CLRF        _PressedObject+2 
	CLRF        _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2606 :: 		PressedObjectType = -1;
	MOVLW       255
	MOVWF       _PressedObjectType+0 
	MOVLW       255
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2607 :: 		return;
	GOTO        L_end_Process_TP_Up
;CHi_Hub_VGCLD_driver.c,2608 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up134:
;CHi_Hub_VGCLD_driver.c,2609 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up133:
;CHi_Hub_VGCLD_driver.c,2612 :: 		if (_object_count == label_order) {
	MOVF        __object_count+1, 0 
	XORWF       _label_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up277
	MOVF        _label_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up277:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up138
;CHi_Hub_VGCLD_driver.c,2613 :: 		if (exec_label->Active == 1) {
	MOVLW       14
	ADDWF       _exec_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up139
;CHi_Hub_VGCLD_driver.c,2614 :: 		if (exec_label->OnUpPtr != 0)
	MOVLW       15
	ADDWF       _exec_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up278
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up278
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up278
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up278:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up140
;CHi_Hub_VGCLD_driver.c,2615 :: 		exec_label->OnUpPtr();
	MOVLW       15
	ADDWF       _exec_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_CHi_Hub_VGCLD_driver_Process_TP_Up140:
;CHi_Hub_VGCLD_driver.c,2616 :: 		if (PressedObject == (TPointer)exec_label)
	MOVF        _exec_label+0, 0 
	MOVWF       R1 
	MOVF        _exec_label+1, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R3 
	MOVWF       R4 
	MOVF        _PressedObject+3, 0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up279
	MOVF        _PressedObject+2, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up279
	MOVF        _PressedObject+1, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up279
	MOVF        _PressedObject+0, 0 
	XORWF       R1, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up279:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up141
;CHi_Hub_VGCLD_driver.c,2617 :: 		if (exec_label->OnClickPtr != 0)
	MOVLW       23
	ADDWF       _exec_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up280
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up280
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up280
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up280:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up142
;CHi_Hub_VGCLD_driver.c,2618 :: 		exec_label->OnClickPtr();
	MOVLW       23
	ADDWF       _exec_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_CHi_Hub_VGCLD_driver_Process_TP_Up142:
L_CHi_Hub_VGCLD_driver_Process_TP_Up141:
;CHi_Hub_VGCLD_driver.c,2619 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
	CLRF        _PressedObject+2 
	CLRF        _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2620 :: 		PressedObjectType = -1;
	MOVLW       255
	MOVWF       _PressedObjectType+0 
	MOVLW       255
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2621 :: 		return;
	GOTO        L_end_Process_TP_Up
;CHi_Hub_VGCLD_driver.c,2622 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up139:
;CHi_Hub_VGCLD_driver.c,2623 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up138:
;CHi_Hub_VGCLD_driver.c,2626 :: 		if (_object_count == clabel_order) {
	MOVF        __object_count+1, 0 
	XORWF       _clabel_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up281
	MOVF        _clabel_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up281:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up143
;CHi_Hub_VGCLD_driver.c,2627 :: 		if (exec_clabel->Active == 1) {
	MOVLW       15
	ADDWF       _exec_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up144
;CHi_Hub_VGCLD_driver.c,2628 :: 		if (exec_clabel->OnUpPtr != 0)
	MOVLW       16
	ADDWF       _exec_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	TBLRD*+
	MOVFF       TABLAT+0, R4
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up282
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up282
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up282
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up282:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up145
;CHi_Hub_VGCLD_driver.c,2629 :: 		exec_clabel->OnUpPtr();
	MOVLW       16
	ADDWF       _exec_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	CALL        _____DoIFC+0, 0
L_CHi_Hub_VGCLD_driver_Process_TP_Up145:
;CHi_Hub_VGCLD_driver.c,2630 :: 		if (PressedObject == (TPointer)exec_clabel)
	MOVF        _exec_clabel+0, 0 
	MOVWF       R1 
	MOVF        _exec_clabel+1, 0 
	MOVWF       R2 
	MOVF        _exec_clabel+2, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVF        _PressedObject+3, 0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up283
	MOVF        _PressedObject+2, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up283
	MOVF        _PressedObject+1, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up283
	MOVF        _PressedObject+0, 0 
	XORWF       R1, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up283:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up146
;CHi_Hub_VGCLD_driver.c,2631 :: 		if (exec_clabel->OnClickPtr != 0)
	MOVLW       24
	ADDWF       _exec_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	TBLRD*+
	MOVFF       TABLAT+0, R4
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up284
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up284
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up284
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up284:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up147
;CHi_Hub_VGCLD_driver.c,2632 :: 		exec_clabel->OnClickPtr();
	MOVLW       24
	ADDWF       _exec_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	CALL        _____DoIFC+0, 0
L_CHi_Hub_VGCLD_driver_Process_TP_Up147:
L_CHi_Hub_VGCLD_driver_Process_TP_Up146:
;CHi_Hub_VGCLD_driver.c,2633 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
	CLRF        _PressedObject+2 
	CLRF        _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2634 :: 		PressedObjectType = -1;
	MOVLW       255
	MOVWF       _PressedObjectType+0 
	MOVLW       255
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2635 :: 		return;
	GOTO        L_end_Process_TP_Up
;CHi_Hub_VGCLD_driver.c,2636 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up144:
;CHi_Hub_VGCLD_driver.c,2637 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up143:
;CHi_Hub_VGCLD_driver.c,2640 :: 		if (_object_count == image_order) {
	MOVF        __object_count+1, 0 
	XORWF       _image_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up285
	MOVF        _image_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up285:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up148
;CHi_Hub_VGCLD_driver.c,2641 :: 		if (exec_image->Active == 1) {
	MOVLW       13
	ADDWF       _exec_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up149
;CHi_Hub_VGCLD_driver.c,2642 :: 		if (exec_image->OnUpPtr != 0)
	MOVLW       14
	ADDWF       _exec_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up286
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up286
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up286
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up286:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up150
;CHi_Hub_VGCLD_driver.c,2643 :: 		exec_image->OnUpPtr();
	MOVLW       14
	ADDWF       _exec_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_CHi_Hub_VGCLD_driver_Process_TP_Up150:
;CHi_Hub_VGCLD_driver.c,2644 :: 		if (PressedObject == (TPointer)exec_image)
	MOVF        _exec_image+0, 0 
	MOVWF       R1 
	MOVF        _exec_image+1, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R3 
	MOVWF       R4 
	MOVF        _PressedObject+3, 0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up287
	MOVF        _PressedObject+2, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up287
	MOVF        _PressedObject+1, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up287
	MOVF        _PressedObject+0, 0 
	XORWF       R1, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up287:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up151
;CHi_Hub_VGCLD_driver.c,2645 :: 		if (exec_image->OnClickPtr != 0)
	MOVLW       22
	ADDWF       _exec_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up288
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up288
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up288
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up288:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up152
;CHi_Hub_VGCLD_driver.c,2646 :: 		exec_image->OnClickPtr();
	MOVLW       22
	ADDWF       _exec_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_CHi_Hub_VGCLD_driver_Process_TP_Up152:
L_CHi_Hub_VGCLD_driver_Process_TP_Up151:
;CHi_Hub_VGCLD_driver.c,2647 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
	CLRF        _PressedObject+2 
	CLRF        _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2648 :: 		PressedObjectType = -1;
	MOVLW       255
	MOVWF       _PressedObjectType+0 
	MOVLW       255
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2649 :: 		return;
	GOTO        L_end_Process_TP_Up
;CHi_Hub_VGCLD_driver.c,2650 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up149:
;CHi_Hub_VGCLD_driver.c,2651 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up148:
;CHi_Hub_VGCLD_driver.c,2654 :: 		if (_object_count == cimage_order) {
	MOVF        __object_count+1, 0 
	XORWF       _cimage_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up289
	MOVF        _cimage_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up289:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up153
;CHi_Hub_VGCLD_driver.c,2655 :: 		if (exec_cimage->Active == 1) {
	MOVLW       13
	ADDWF       _exec_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up154
;CHi_Hub_VGCLD_driver.c,2656 :: 		if (exec_cimage->OnUpPtr != 0)
	MOVLW       14
	ADDWF       _exec_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	TBLRD*+
	MOVFF       TABLAT+0, R4
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up290
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up290
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up290
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up290:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up155
;CHi_Hub_VGCLD_driver.c,2657 :: 		exec_cimage->OnUpPtr();
	MOVLW       14
	ADDWF       _exec_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	CALL        _____DoIFC+0, 0
L_CHi_Hub_VGCLD_driver_Process_TP_Up155:
;CHi_Hub_VGCLD_driver.c,2658 :: 		if (PressedObject == (TPointer)exec_cimage)
	MOVF        _exec_cimage+0, 0 
	MOVWF       R1 
	MOVF        _exec_cimage+1, 0 
	MOVWF       R2 
	MOVF        _exec_cimage+2, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVF        _PressedObject+3, 0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up291
	MOVF        _PressedObject+2, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up291
	MOVF        _PressedObject+1, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up291
	MOVF        _PressedObject+0, 0 
	XORWF       R1, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up291:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up156
;CHi_Hub_VGCLD_driver.c,2659 :: 		if (exec_cimage->OnClickPtr != 0)
	MOVLW       22
	ADDWF       _exec_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	TBLRD*+
	MOVFF       TABLAT+0, R4
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up292
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up292
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up292
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up292:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up157
;CHi_Hub_VGCLD_driver.c,2660 :: 		exec_cimage->OnClickPtr();
	MOVLW       22
	ADDWF       _exec_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	CALL        _____DoIFC+0, 0
L_CHi_Hub_VGCLD_driver_Process_TP_Up157:
L_CHi_Hub_VGCLD_driver_Process_TP_Up156:
;CHi_Hub_VGCLD_driver.c,2661 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
	CLRF        _PressedObject+2 
	CLRF        _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2662 :: 		PressedObjectType = -1;
	MOVLW       255
	MOVWF       _PressedObjectType+0 
	MOVLW       255
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2663 :: 		return;
	GOTO        L_end_Process_TP_Up
;CHi_Hub_VGCLD_driver.c,2664 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up154:
;CHi_Hub_VGCLD_driver.c,2665 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up153:
;CHi_Hub_VGCLD_driver.c,2668 :: 		if (_object_count == box_order) {
	MOVF        __object_count+1, 0 
	XORWF       _box_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up293
	MOVF        _box_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up293:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up158
;CHi_Hub_VGCLD_driver.c,2669 :: 		if (exec_box->Active == 1) {
	MOVLW       8
	ADDWF       _exec_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up159
;CHi_Hub_VGCLD_driver.c,2670 :: 		if (exec_box->OnUpPtr != 0)
	MOVLW       10
	ADDWF       _exec_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up294
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up294
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up294
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up294:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up160
;CHi_Hub_VGCLD_driver.c,2671 :: 		exec_box->OnUpPtr();
	MOVLW       10
	ADDWF       _exec_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_CHi_Hub_VGCLD_driver_Process_TP_Up160:
;CHi_Hub_VGCLD_driver.c,2672 :: 		if (PressedObject == (TPointer)exec_box)
	MOVF        _exec_box+0, 0 
	MOVWF       R1 
	MOVF        _exec_box+1, 0 
	MOVWF       R2 
	MOVLW       0
	MOVWF       R3 
	MOVWF       R4 
	MOVF        _PressedObject+3, 0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up295
	MOVF        _PressedObject+2, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up295
	MOVF        _PressedObject+1, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up295
	MOVF        _PressedObject+0, 0 
	XORWF       R1, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Up295:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up161
;CHi_Hub_VGCLD_driver.c,2673 :: 		if (exec_box->OnClickPtr != 0)
	MOVLW       18
	ADDWF       _exec_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up296
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up296
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up296
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Up296:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Up162
;CHi_Hub_VGCLD_driver.c,2674 :: 		exec_box->OnClickPtr();
	MOVLW       18
	ADDWF       _exec_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_CHi_Hub_VGCLD_driver_Process_TP_Up162:
L_CHi_Hub_VGCLD_driver_Process_TP_Up161:
;CHi_Hub_VGCLD_driver.c,2675 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
	CLRF        _PressedObject+2 
	CLRF        _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2676 :: 		PressedObjectType = -1;
	MOVLW       255
	MOVWF       _PressedObjectType+0 
	MOVLW       255
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2677 :: 		return;
	GOTO        L_end_Process_TP_Up
;CHi_Hub_VGCLD_driver.c,2678 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up159:
;CHi_Hub_VGCLD_driver.c,2679 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up158:
;CHi_Hub_VGCLD_driver.c,2681 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Up127:
;CHi_Hub_VGCLD_driver.c,2682 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
	CLRF        _PressedObject+2 
	CLRF        _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2683 :: 		PressedObjectType = -1;
	MOVLW       255
	MOVWF       _PressedObjectType+0 
	MOVLW       255
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2684 :: 		}
L_end_Process_TP_Up:
	RETURN      0
; end of CHi_Hub_VGCLD_driver_Process_TP_Up

CHi_Hub_VGCLD_driver_Process_TP_Down:

;CHi_Hub_VGCLD_driver.c,2686 :: 		static void Process_TP_Down(unsigned int X, unsigned int Y) {
;CHi_Hub_VGCLD_driver.c,2688 :: 		object_pressed      = 0;
	CLRF        _object_pressed+0 
;CHi_Hub_VGCLD_driver.c,2689 :: 		exec_round_button   = 0;
	CLRF        _exec_round_button+0 
	CLRF        _exec_round_button+1 
;CHi_Hub_VGCLD_driver.c,2690 :: 		exec_round_cbutton = 0;
	CLRF        _exec_round_cbutton+0 
	CLRF        _exec_round_cbutton+1 
	CLRF        _exec_round_cbutton+2 
;CHi_Hub_VGCLD_driver.c,2691 :: 		exec_label          = 0;
	CLRF        _exec_label+0 
	CLRF        _exec_label+1 
;CHi_Hub_VGCLD_driver.c,2692 :: 		exec_clabel         = 0;
	CLRF        _exec_clabel+0 
	CLRF        _exec_clabel+1 
	CLRF        _exec_clabel+2 
;CHi_Hub_VGCLD_driver.c,2693 :: 		exec_image          = 0;
	CLRF        _exec_image+0 
	CLRF        _exec_image+1 
;CHi_Hub_VGCLD_driver.c,2694 :: 		exec_cimage         = 0;
	CLRF        _exec_cimage+0 
	CLRF        _exec_cimage+1 
	CLRF        _exec_cimage+2 
;CHi_Hub_VGCLD_driver.c,2695 :: 		exec_box            = 0;
	CLRF        _exec_box+0 
	CLRF        _exec_box+1 
;CHi_Hub_VGCLD_driver.c,2697 :: 		Get_Object(X, Y);
	MOVF        FARG_CHi_Hub_VGCLD_driver_Process_TP_Down_X+0, 0 
	MOVWF       FARG_Get_Object_X+0 
	MOVF        FARG_CHi_Hub_VGCLD_driver_Process_TP_Down_X+1, 0 
	MOVWF       FARG_Get_Object_X+1 
	MOVF        FARG_CHi_Hub_VGCLD_driver_Process_TP_Down_Y+0, 0 
	MOVWF       FARG_Get_Object_Y+0 
	MOVF        FARG_CHi_Hub_VGCLD_driver_Process_TP_Down_Y+1, 0 
	MOVWF       FARG_Get_Object_Y+1 
	CALL        _Get_Object+0, 0
;CHi_Hub_VGCLD_driver.c,2699 :: 		if (_object_count != -1) {
	MOVLW       255
	XORWF       __object_count+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down298
	MOVLW       255
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Down298:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down163
;CHi_Hub_VGCLD_driver.c,2700 :: 		if (_object_count == round_button_order) {
	MOVF        __object_count+1, 0 
	XORWF       _round_button_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down299
	MOVF        _round_button_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Down299:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down164
;CHi_Hub_VGCLD_driver.c,2701 :: 		if (exec_round_button->Active == 1) {
	MOVLW       8
	ADDWF       _exec_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down165
;CHi_Hub_VGCLD_driver.c,2702 :: 		if (exec_round_button->PressColEnabled == 1) {
	MOVLW       16
	ADDWF       _exec_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down166
;CHi_Hub_VGCLD_driver.c,2703 :: 		object_pressed = 1;
	MOVLW       1
	MOVWF       _object_pressed+0 
;CHi_Hub_VGCLD_driver.c,2704 :: 		DrawRoundButton(exec_round_button);
	MOVF        _exec_round_button+0, 0 
	MOVWF       FARG_DrawRoundButton_Around_button+0 
	MOVF        _exec_round_button+1, 0 
	MOVWF       FARG_DrawRoundButton_Around_button+1 
	CALL        _DrawRoundButton+0, 0
;CHi_Hub_VGCLD_driver.c,2705 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down166:
;CHi_Hub_VGCLD_driver.c,2706 :: 		PressedObject = (TPointer)exec_round_button;
	MOVF        _exec_round_button+0, 0 
	MOVWF       _PressedObject+0 
	MOVF        _exec_round_button+1, 0 
	MOVWF       _PressedObject+1 
	MOVLW       0
	MOVWF       _PressedObject+2 
	MOVWF       _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2707 :: 		PressedObjectType = 1;
	MOVLW       1
	MOVWF       _PressedObjectType+0 
	MOVLW       0
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2708 :: 		if (exec_round_button->OnDownPtr != 0) {
	MOVLW       21
	ADDWF       _exec_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down300
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down300
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down300
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Down300:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down167
;CHi_Hub_VGCLD_driver.c,2709 :: 		exec_round_button->OnDownPtr();
	MOVLW       21
	ADDWF       _exec_round_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_round_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;CHi_Hub_VGCLD_driver.c,2710 :: 		return;
	GOTO        L_end_Process_TP_Down
;CHi_Hub_VGCLD_driver.c,2711 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down167:
;CHi_Hub_VGCLD_driver.c,2712 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down165:
;CHi_Hub_VGCLD_driver.c,2713 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down164:
;CHi_Hub_VGCLD_driver.c,2715 :: 		if (_object_count == round_cbutton_order) {
	MOVF        __object_count+1, 0 
	XORWF       _round_cbutton_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down301
	MOVF        _round_cbutton_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Down301:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down168
;CHi_Hub_VGCLD_driver.c,2716 :: 		if (exec_round_cbutton->Active == 1) {
	MOVLW       8
	ADDWF       _exec_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down169
;CHi_Hub_VGCLD_driver.c,2717 :: 		if (exec_round_cbutton->PressColEnabled == 1) {
	MOVLW       17
	ADDWF       _exec_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down170
;CHi_Hub_VGCLD_driver.c,2718 :: 		object_pressed = 1;
	MOVLW       1
	MOVWF       _object_pressed+0 
;CHi_Hub_VGCLD_driver.c,2719 :: 		DrawCRoundButton(exec_round_cbutton);
	MOVF        _exec_round_cbutton+0, 0 
	MOVWF       FARG_DrawCRoundButton_Around_button+0 
	MOVF        _exec_round_cbutton+1, 0 
	MOVWF       FARG_DrawCRoundButton_Around_button+1 
	MOVF        _exec_round_cbutton+2, 0 
	MOVWF       FARG_DrawCRoundButton_Around_button+2 
	CALL        _DrawCRoundButton+0, 0
;CHi_Hub_VGCLD_driver.c,2720 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down170:
;CHi_Hub_VGCLD_driver.c,2721 :: 		PressedObject = (TPointer)exec_round_cbutton;
	MOVF        _exec_round_cbutton+0, 0 
	MOVWF       _PressedObject+0 
	MOVF        _exec_round_cbutton+1, 0 
	MOVWF       _PressedObject+1 
	MOVF        _exec_round_cbutton+2, 0 
	MOVWF       _PressedObject+2 
	MOVLW       0
	MOVWF       _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2722 :: 		PressedObjectType = 9;
	MOVLW       9
	MOVWF       _PressedObjectType+0 
	MOVLW       0
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2723 :: 		if (exec_round_cbutton->OnDownPtr != 0) {
	MOVLW       22
	ADDWF       _exec_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	TBLRD*+
	MOVFF       TABLAT+0, R4
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down302
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down302
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down302
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Down302:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down171
;CHi_Hub_VGCLD_driver.c,2724 :: 		exec_round_cbutton->OnDownPtr();
	MOVLW       22
	ADDWF       _exec_round_cbutton+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_round_cbutton+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	CALL        _____DoIFC+0, 0
;CHi_Hub_VGCLD_driver.c,2725 :: 		return;
	GOTO        L_end_Process_TP_Down
;CHi_Hub_VGCLD_driver.c,2726 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down171:
;CHi_Hub_VGCLD_driver.c,2727 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down169:
;CHi_Hub_VGCLD_driver.c,2728 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down168:
;CHi_Hub_VGCLD_driver.c,2730 :: 		if (_object_count == label_order) {
	MOVF        __object_count+1, 0 
	XORWF       _label_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down303
	MOVF        _label_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Down303:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down172
;CHi_Hub_VGCLD_driver.c,2731 :: 		if (exec_label->Active == 1) {
	MOVLW       14
	ADDWF       _exec_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down173
;CHi_Hub_VGCLD_driver.c,2732 :: 		PressedObject = (TPointer)exec_label;
	MOVF        _exec_label+0, 0 
	MOVWF       _PressedObject+0 
	MOVF        _exec_label+1, 0 
	MOVWF       _PressedObject+1 
	MOVLW       0
	MOVWF       _PressedObject+2 
	MOVWF       _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2733 :: 		PressedObjectType = 2;
	MOVLW       2
	MOVWF       _PressedObjectType+0 
	MOVLW       0
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2734 :: 		if (exec_label->OnDownPtr != 0) {
	MOVLW       19
	ADDWF       _exec_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down304
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down304
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down304
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Down304:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down174
;CHi_Hub_VGCLD_driver.c,2735 :: 		exec_label->OnDownPtr();
	MOVLW       19
	ADDWF       _exec_label+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_label+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;CHi_Hub_VGCLD_driver.c,2736 :: 		return;
	GOTO        L_end_Process_TP_Down
;CHi_Hub_VGCLD_driver.c,2737 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down174:
;CHi_Hub_VGCLD_driver.c,2738 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down173:
;CHi_Hub_VGCLD_driver.c,2739 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down172:
;CHi_Hub_VGCLD_driver.c,2741 :: 		if (_object_count == clabel_order) {
	MOVF        __object_count+1, 0 
	XORWF       _clabel_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down305
	MOVF        _clabel_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Down305:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down175
;CHi_Hub_VGCLD_driver.c,2742 :: 		if (exec_clabel->Active == 1) {
	MOVLW       15
	ADDWF       _exec_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down176
;CHi_Hub_VGCLD_driver.c,2743 :: 		PressedObject = (TPointer)exec_clabel;
	MOVF        _exec_clabel+0, 0 
	MOVWF       _PressedObject+0 
	MOVF        _exec_clabel+1, 0 
	MOVWF       _PressedObject+1 
	MOVF        _exec_clabel+2, 0 
	MOVWF       _PressedObject+2 
	MOVLW       0
	MOVWF       _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2744 :: 		PressedObjectType = 10;
	MOVLW       10
	MOVWF       _PressedObjectType+0 
	MOVLW       0
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2745 :: 		if (exec_clabel->OnDownPtr != 0) {
	MOVLW       20
	ADDWF       _exec_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	TBLRD*+
	MOVFF       TABLAT+0, R4
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down306
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down306
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down306
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Down306:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down177
;CHi_Hub_VGCLD_driver.c,2746 :: 		exec_clabel->OnDownPtr();
	MOVLW       20
	ADDWF       _exec_clabel+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_clabel+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_clabel+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	CALL        _____DoIFC+0, 0
;CHi_Hub_VGCLD_driver.c,2747 :: 		return;
	GOTO        L_end_Process_TP_Down
;CHi_Hub_VGCLD_driver.c,2748 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down177:
;CHi_Hub_VGCLD_driver.c,2749 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down176:
;CHi_Hub_VGCLD_driver.c,2750 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down175:
;CHi_Hub_VGCLD_driver.c,2752 :: 		if (_object_count == image_order) {
	MOVF        __object_count+1, 0 
	XORWF       _image_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down307
	MOVF        _image_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Down307:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down178
;CHi_Hub_VGCLD_driver.c,2753 :: 		if (exec_image->Active == 1) {
	MOVLW       13
	ADDWF       _exec_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down179
;CHi_Hub_VGCLD_driver.c,2754 :: 		PressedObject = (TPointer)exec_image;
	MOVF        _exec_image+0, 0 
	MOVWF       _PressedObject+0 
	MOVF        _exec_image+1, 0 
	MOVWF       _PressedObject+1 
	MOVLW       0
	MOVWF       _PressedObject+2 
	MOVWF       _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2755 :: 		PressedObjectType = 3;
	MOVLW       3
	MOVWF       _PressedObjectType+0 
	MOVLW       0
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2756 :: 		if (exec_image->OnDownPtr != 0) {
	MOVLW       18
	ADDWF       _exec_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down308
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down308
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down308
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Down308:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down180
;CHi_Hub_VGCLD_driver.c,2757 :: 		exec_image->OnDownPtr();
	MOVLW       18
	ADDWF       _exec_image+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_image+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;CHi_Hub_VGCLD_driver.c,2758 :: 		return;
	GOTO        L_end_Process_TP_Down
;CHi_Hub_VGCLD_driver.c,2759 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down180:
;CHi_Hub_VGCLD_driver.c,2760 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down179:
;CHi_Hub_VGCLD_driver.c,2761 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down178:
;CHi_Hub_VGCLD_driver.c,2763 :: 		if (_object_count == cimage_order) {
	MOVF        __object_count+1, 0 
	XORWF       _cimage_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down309
	MOVF        _cimage_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Down309:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down181
;CHi_Hub_VGCLD_driver.c,2764 :: 		if (exec_cimage->Active == 1) {
	MOVLW       13
	ADDWF       _exec_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down182
;CHi_Hub_VGCLD_driver.c,2765 :: 		PressedObject = (TPointer)exec_cimage;
	MOVF        _exec_cimage+0, 0 
	MOVWF       _PressedObject+0 
	MOVF        _exec_cimage+1, 0 
	MOVWF       _PressedObject+1 
	MOVF        _exec_cimage+2, 0 
	MOVWF       _PressedObject+2 
	MOVLW       0
	MOVWF       _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2766 :: 		PressedObjectType = 11;
	MOVLW       11
	MOVWF       _PressedObjectType+0 
	MOVLW       0
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2767 :: 		if (exec_cimage->OnDownPtr != 0) {
	MOVLW       18
	ADDWF       _exec_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	TBLRD*+
	MOVFF       TABLAT+0, R4
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down310
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down310
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down310
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Down310:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down183
;CHi_Hub_VGCLD_driver.c,2768 :: 		exec_cimage->OnDownPtr();
	MOVLW       18
	ADDWF       _exec_cimage+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      _exec_cimage+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      _exec_cimage+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	TBLRD*+
	MOVFF       TABLAT+0, R1
	TBLRD*+
	MOVFF       TABLAT+0, R2
	TBLRD*+
	MOVFF       TABLAT+0, R3
	CALL        _____DoIFC+0, 0
;CHi_Hub_VGCLD_driver.c,2769 :: 		return;
	GOTO        L_end_Process_TP_Down
;CHi_Hub_VGCLD_driver.c,2770 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down183:
;CHi_Hub_VGCLD_driver.c,2771 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down182:
;CHi_Hub_VGCLD_driver.c,2772 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down181:
;CHi_Hub_VGCLD_driver.c,2774 :: 		if (_object_count == box_order) {
	MOVF        __object_count+1, 0 
	XORWF       _box_order+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down311
	MOVF        _box_order+0, 0 
	XORWF       __object_count+0, 0 
L_CHi_Hub_VGCLD_driver_Process_TP_Down311:
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down184
;CHi_Hub_VGCLD_driver.c,2775 :: 		if (exec_box->Active == 1) {
	MOVLW       8
	ADDWF       _exec_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down185
;CHi_Hub_VGCLD_driver.c,2776 :: 		PressedObject = (TPointer)exec_box;
	MOVF        _exec_box+0, 0 
	MOVWF       _PressedObject+0 
	MOVF        _exec_box+1, 0 
	MOVWF       _PressedObject+1 
	MOVLW       0
	MOVWF       _PressedObject+2 
	MOVWF       _PressedObject+3 
;CHi_Hub_VGCLD_driver.c,2777 :: 		PressedObjectType = 6;
	MOVLW       6
	MOVWF       _PressedObjectType+0 
	MOVLW       0
	MOVWF       _PressedObjectType+1 
;CHi_Hub_VGCLD_driver.c,2778 :: 		if (exec_box->OnDownPtr != 0) {
	MOVLW       14
	ADDWF       _exec_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down312
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down312
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down312
	MOVF        R1, 0 
	XORLW       0
L_CHi_Hub_VGCLD_driver_Process_TP_Down312:
	BTFSC       STATUS+0, 2 
	GOTO        L_CHi_Hub_VGCLD_driver_Process_TP_Down186
;CHi_Hub_VGCLD_driver.c,2779 :: 		exec_box->OnDownPtr();
	MOVLW       14
	ADDWF       _exec_box+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _exec_box+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;CHi_Hub_VGCLD_driver.c,2780 :: 		return;
	GOTO        L_end_Process_TP_Down
;CHi_Hub_VGCLD_driver.c,2781 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down186:
;CHi_Hub_VGCLD_driver.c,2782 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down185:
;CHi_Hub_VGCLD_driver.c,2783 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down184:
;CHi_Hub_VGCLD_driver.c,2785 :: 		}
L_CHi_Hub_VGCLD_driver_Process_TP_Down163:
;CHi_Hub_VGCLD_driver.c,2786 :: 		}
L_end_Process_TP_Down:
	RETURN      0
; end of CHi_Hub_VGCLD_driver_Process_TP_Down

_Check_TP:

;CHi_Hub_VGCLD_driver.c,2788 :: 		void Check_TP() {
;CHi_Hub_VGCLD_driver.c,2789 :: 		if (TP_Press_Detect()) {
	CALL        _TP_Press_Detect+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Check_TP187
;CHi_Hub_VGCLD_driver.c,2791 :: 		if (TP_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
	MOVLW       _Xcoord+0
	MOVWF       FARG_TP_Get_Coordinates_x_coordinate+0 
	MOVLW       hi_addr(_Xcoord+0)
	MOVWF       FARG_TP_Get_Coordinates_x_coordinate+1 
	MOVLW       _Ycoord+0
	MOVWF       FARG_TP_Get_Coordinates_y_coordinate+0 
	MOVLW       hi_addr(_Ycoord+0)
	MOVWF       FARG_TP_Get_Coordinates_y_coordinate+1 
	CALL        _TP_Get_Coordinates+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Check_TP188
;CHi_Hub_VGCLD_driver.c,2792 :: 		time_out_tmr=0; // reset the timer
	CLRF        _time_out_tmr+0 
	CLRF        _time_out_tmr+1 
;CHi_Hub_VGCLD_driver.c,2793 :: 		Process_TP_Press(Xcoord, Ycoord);
	MOVF        _Xcoord+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_Process_TP_Press_X+0 
	MOVF        _Xcoord+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_Process_TP_Press_X+1 
	MOVF        _Ycoord+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_Process_TP_Press_Y+0 
	MOVF        _Ycoord+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_Process_TP_Press_Y+1 
	CALL        CHi_Hub_VGCLD_driver_Process_TP_Press+0, 0
;CHi_Hub_VGCLD_driver.c,2794 :: 		if (PenDown == 0) {
	MOVF        _PenDown+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Check_TP189
;CHi_Hub_VGCLD_driver.c,2795 :: 		PenDown = 1;
	MOVLW       1
	MOVWF       _PenDown+0 
;CHi_Hub_VGCLD_driver.c,2796 :: 		Process_TP_Down(Xcoord, Ycoord);
	MOVF        _Xcoord+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_Process_TP_Down_X+0 
	MOVF        _Xcoord+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_Process_TP_Down_X+1 
	MOVF        _Ycoord+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_Process_TP_Down_Y+0 
	MOVF        _Ycoord+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_Process_TP_Down_Y+1 
	CALL        CHi_Hub_VGCLD_driver_Process_TP_Down+0, 0
;CHi_Hub_VGCLD_driver.c,2797 :: 		}
L_Check_TP189:
;CHi_Hub_VGCLD_driver.c,2798 :: 		}
L_Check_TP188:
;CHi_Hub_VGCLD_driver.c,2799 :: 		}
	GOTO        L_Check_TP190
L_Check_TP187:
;CHi_Hub_VGCLD_driver.c,2800 :: 		else if (PenDown == 1) {
	MOVF        _PenDown+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Check_TP191
;CHi_Hub_VGCLD_driver.c,2801 :: 		PenDown = 0;
	CLRF        _PenDown+0 
;CHi_Hub_VGCLD_driver.c,2802 :: 		Process_TP_Up(Xcoord, Ycoord);
	MOVF        _Xcoord+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_Process_TP_Up_X+0 
	MOVF        _Xcoord+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_Process_TP_Up_X+1 
	MOVF        _Ycoord+0, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_Process_TP_Up_Y+0 
	MOVF        _Ycoord+1, 0 
	MOVWF       FARG_CHi_Hub_VGCLD_driver_Process_TP_Up_Y+1 
	CALL        CHi_Hub_VGCLD_driver_Process_TP_Up+0, 0
;CHi_Hub_VGCLD_driver.c,2803 :: 		}
L_Check_TP191:
L_Check_TP190:
;CHi_Hub_VGCLD_driver.c,2804 :: 		}
L_end_Check_TP:
	RETURN      0
; end of _Check_TP

_Init_MCU:

;CHi_Hub_VGCLD_driver.c,2806 :: 		void Init_MCU() {
;CHi_Hub_VGCLD_driver.c,2807 :: 		ANCON0 = 0;
	CLRF        ANCON0+0 
;CHi_Hub_VGCLD_driver.c,2808 :: 		ANCON1 = 0;
	CLRF        ANCON1+0 
;CHi_Hub_VGCLD_driver.c,2809 :: 		ANCON2 = 0;
	CLRF        ANCON2+0 
;CHi_Hub_VGCLD_driver.c,2810 :: 		BacklightRed_Direction = 0;
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;CHi_Hub_VGCLD_driver.c,2811 :: 		BacklightGreen_Direction = 0;
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;CHi_Hub_VGCLD_driver.c,2812 :: 		BacklightBlue_Direction = 0;
	BCF         TRISG0_bit+0, BitPos(TRISG0_bit+0) 
;CHi_Hub_VGCLD_driver.c,2813 :: 		BacklightRed = 0;
	BCF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;CHi_Hub_VGCLD_driver.c,2814 :: 		BacklightGreen = 0;
	BCF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;CHi_Hub_VGCLD_driver.c,2815 :: 		BacklightBlue = 0;
	BCF         LATG0_bit+0, BitPos(LATG0_bit+0) 
;CHi_Hub_VGCLD_driver.c,2816 :: 		}
L_end_Init_MCU:
	RETURN      0
; end of _Init_MCU

_Start_TP:

;CHi_Hub_VGCLD_driver.c,2818 :: 		void Start_TP() {
;CHi_Hub_VGCLD_driver.c,2819 :: 		Init_MCU();
	CALL        _Init_MCU+0, 0
;CHi_Hub_VGCLD_driver.c,2821 :: 		InitializeTouchPanel();
	CALL        CHi_Hub_VGCLD_driver_InitializeTouchPanel+0, 0
;CHi_Hub_VGCLD_driver.c,2824 :: 		TP_Set_Calibration_Consts(205, 3850, 385, 3650);    // Set calibration constants
	MOVLW       205
	MOVWF       FARG_TP_Set_Calibration_Consts_x_min+0 
	MOVLW       0
	MOVWF       FARG_TP_Set_Calibration_Consts_x_min+1 
	MOVLW       10
	MOVWF       FARG_TP_Set_Calibration_Consts_x_max+0 
	MOVLW       15
	MOVWF       FARG_TP_Set_Calibration_Consts_x_max+1 
	MOVLW       129
	MOVWF       FARG_TP_Set_Calibration_Consts_y_min+0 
	MOVLW       1
	MOVWF       FARG_TP_Set_Calibration_Consts_y_min+1 
	MOVLW       66
	MOVWF       FARG_TP_Set_Calibration_Consts_y_max+0 
	MOVLW       14
	MOVWF       FARG_TP_Set_Calibration_Consts_y_max+1 
	CALL        _TP_Set_Calibration_Consts+0, 0
;CHi_Hub_VGCLD_driver.c,2826 :: 		InitializeObjects();
	CALL        CHi_Hub_VGCLD_driver_InitializeObjects+0, 0
;CHi_Hub_VGCLD_driver.c,2827 :: 		DrawScreen(&ScreenWelcome);
	MOVLW       _ScreenWelcome+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_ScreenWelcome+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;CHi_Hub_VGCLD_driver.c,2828 :: 		}
L_end_Start_TP:
	RETURN      0
; end of _Start_TP

CHi_Hub_VGCLD_driver____?ag:

L_end_CHi_Hub_VGCLD_driver___?ag:
	RETURN      0
; end of CHi_Hub_VGCLD_driver____?ag
