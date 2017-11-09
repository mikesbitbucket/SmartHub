#line 1 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/CHi_Hub_VGCLD_events_code.c"
#line 1 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/chi_hub_vgcld_objects.h"
#line 1 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/__t6963c.h"
#line 165 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/__t6963c.h"
void T6963C_init(unsigned int w, unsigned char h, unsigned char fntW);
void T6963C_writeData(unsigned char mydata);
void T6963C_writeCommand(unsigned char mydata);
void T6963C_setPtr(unsigned int addr, unsigned char t);
void T6963C_waitReady(void);
void T6963C_fill(unsigned char mydata, unsigned int start, unsigned int len);
void T6963C_dot(int x, int y, unsigned char color);
void T6963C_write_char(unsigned char c, unsigned char x, unsigned char y, unsigned char mode);
void T6963C_write_text(unsigned char *str, unsigned char x, unsigned char y, unsigned char mode);
void T6963C_line(int px0, int py0, int px1, int py1, unsigned char pcolor);
void T6963C_rectangle(int x0, int y0, int x1, int y1, unsigned char pcolor);
void T6963C_box(int x0, int y0, int x1, int y1, unsigned char pcolor);
void T6963C_circle(int x, int y, long r, unsigned char pcolor);
void T6963C_image(const char *pic);
void T6963C_sprite(unsigned char px, unsigned char py, const char *pic, unsigned char sx, unsigned char sy);
void T6963C_set_cursor(unsigned char x, unsigned char y);
void T6963C_PartialImage(unsigned int x_left, unsigned int y_top, unsigned int width,
 unsigned int height, code const unsigned short * image);
void T6963C_Rectangle_Round_Edges(unsigned int x_upper_left, unsigned int y_upper_left,
 unsigned int x_bottom_right, unsigned int y_bottom_right,
 unsigned int round_radius, unsigned short color);
void T6963C_Rectangle_Round_Edges_Fill(unsigned int x_upper_left, unsigned int y_upper_left,
 unsigned int x_bottom_right, unsigned int y_bottom_right,
 unsigned int round_radius, unsigned short color);
void T6963C_Circle_Fill(int x_center, int y_center, int radius, unsigned short color);
#line 194 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/__t6963c.h"
extern sfr char T6963C_dataPort;
extern sfr char T6963C_cntlPort;

extern unsigned int T6963C_grWidth;
extern unsigned int T6963C_grHeight;
extern unsigned int T6963C_txtCols;

extern unsigned int T6963C_fontWidth;
extern unsigned int T6963C_grHomeAddr;
extern unsigned int T6963C_textHomeAddr;
extern unsigned int T6963C_grMemSize;
extern unsigned int T6963C_txtMemSize;

extern sfr sbit T6963C_cntlwr;
extern sfr sbit T6963C_cntlrd;
extern sfr sbit T6963C_cntlcd;
extern sfr sbit T6963C_cntlrst;

extern unsigned char T6963C_display;
#line 2 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/chi_hub_vgcld_objects.h"
enum GlcdColor {_clClear, _clDraw, _clInvert};
typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;

typedef struct Screen TScreen;

typedef struct Button_Round {
 TScreen* OwnerScreen;
 char Order;
 char Left;
 char Top;
 char Width;
 char Height;
 char Visible;
 char Active;
 char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 char Corner_Radius;
 char PressColEnabled;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton_Round;

typedef const struct CButton_Round {
 TScreen* OwnerScreen;
 char Order;
 char Left;
 char Top;
 char Width;
 char Height;
 char Visible;
 char Active;
 const char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 char Corner_Radius;
 char PressColEnabled;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCButton_Round;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 char Left;
 char Top;
 char Width;
 char Height;
 char *Caption;
 const char *FontName;
 unsigned char Font_Color;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef const struct CLabel {
 TScreen* OwnerScreen;
 char Order;
 char Left;
 char Top;
 char Width;
 char Height;
 const char *Caption;
 const char *FontName;
 unsigned char Font_Color;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCLabel;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 char Left;
 char Top;
 char Width;
 char Height;
 char PictureWidth;
 char PictureHeight;
 const char *Picture_Name;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

typedef const struct CImage {
 TScreen* OwnerScreen;
 char Order;
 char Left;
 char Top;
 char Width;
 char Height;
 char PictureWidth;
 char PictureHeight;
 const char *Picture_Name;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCImage;

typedef struct Box {
 TScreen* OwnerScreen;
 char Order;
 char Left;
 char Top;
 char Width;
 char Height;
 char Visible;
 char Active;
 char Transparent;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox;

struct Screen {
 unsigned short ObjectsCount;
 unsigned int Buttons_RoundCount;
 TButton_Round * const code *Buttons_Round;
 unsigned int CButtons_RoundCount;
 TCButton_Round * const code *CButtons_Round;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int CLabelsCount;
 TCLabel * const code *CLabels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int CImagesCount;
 TCImage * const code *CImages;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
};

extern TScreen ScreenWelcome;
extern TImage CHiLogo;
extern TCLabel lRevNo;
extern TCLabel * const code Screen1_CLabels[1];
extern TImage * const code Screen1_Images[1];


extern TScreen ScreenMain;
extern TCImage SmallChairLogo;
extern TCImage bClean;
extern TCImage bHome;
extern TCLabel lHome;
extern TCLabel lClean;
extern TCImage bFootRestOpen;
extern TCLabel lFootReset;
extern TCLabel lOpen;
extern TCLabel * const code Screen2_CLabels[4];
extern TCImage * const code Screen2_CImages[4];


extern TScreen ScreenPW;
extern TBox PwRect;
extern TButton_Round bPWEnter;
extern TButton_Round bNum1;
extern TButton_Round bNum4;
extern TButton_Round bNum7;
extern TButton_Round bNum2;
extern TButton_Round bNum5;
extern TButton_Round bNum8;
extern TButton_Round bNum0;
extern TButton_Round bNum3;
extern TButton_Round bNum6;
extern TButton_Round bNum9;
extern TButton_Round bPWCancel;
extern TCLabel lEnterPassword;
extern TLabel lPWLabel;
extern TButton_Round * const code Screen3_Buttons_Round[12];
extern TLabel * const code Screen3_Labels[1];
extern TCLabel * const code Screen3_CLabels[1];
extern TBox * const code Screen3_Boxes[1];


extern TScreen ScreenAdmin1;
extern TBox Box1;
extern TButton_Round bAdminReturn;
extern TButton_Round bChangePW;
extern TButton_Round bSetReclineLimit;
extern TButton_Round bBindFlash;
extern TButton_Round bBindNoFlash;
extern TButton_Round bDimLevel;
extern TButton_Round bChairDim;
extern TButton_Round bNext2Admin2;
extern TButton_Round * const code Screen4_Buttons_Round[8];
extern TBox * const code Screen4_Boxes[1];


extern TScreen ScreenSetRecline;
extern TCLabel lReclineIinst1;
extern TCLabel lReclineIinst2;
extern TCLabel lReclineIinst3;
extern TCLabel lReclineIinst4;
extern TCLabel lReclineIinst5;
extern TCLabel lReclineIinst6;
extern TCLabel lReclineIinst7;
extern TButton_Round bSendReclineLimitCmd;
extern TButton_Round bReclineBack;
extern TButton_Round * const code Screen5_Buttons_Round[2];
extern TCLabel * const code Screen5_CLabels[7];


extern TScreen ScreenChangePW;
extern TBox ChPwRect;
extern TButton_Round bChPw;
extern TButton_Round bNum1Ch;
extern TButton_Round bNum4Ch;
extern TButton_Round bNum7Ch;
extern TButton_Round bNum2Ch;
extern TButton_Round bNum5Ch;
extern TButton_Round bNum8Ch;
extern TButton_Round bNum0Ch;
extern TButton_Round bNum3Ch;
extern TButton_Round bNum6Ch;
extern TButton_Round bNum9Ch;
extern TButton_Round bChPWCancel;
extern TCLabel lChPw1;
extern TCLabel lChPw2;
extern TLabel lChPWLabel;
extern TButton_Round * const code Screen6_Buttons_Round[12];
extern TLabel * const code Screen6_Labels[1];
extern TCLabel * const code Screen6_CLabels[2];
extern TBox * const code Screen6_Boxes[1];


extern TScreen ScreenTPDimLevel;
extern TCButton_Round bDimOff;
extern TCLabel lDimInstruct1;
extern TCButton_Round bDimLow;
extern TCButton_Round bDimHigh;
extern TCButton_Round bDimMed;
extern TCButton_Round bDimBack;
extern TCLabel Label2;
extern TCButton_Round * const code Screen7_CButtons_Round[5];
extern TCLabel * const code Screen7_CLabels[2];


extern TScreen ScreenChDimLevel;
extern TCButton_Round bDimBackOff;
extern TCLabel lDimCh1;
extern TCLabel lDimCh2;
extern TCButton_Round bDimBack1;
extern TCButton_Round bDimBack2;
extern TCButton_Round bDimBack3;
extern TCButton_Round bDimBack4;
extern TCButton_Round bDimBack5;
extern TCButton_Round bDimBack6;
extern TCButton_Round bDimBackMax;
extern TCLabel Label5;
extern TButton_Round bDimChBack;
extern TButton_Round * const code Screen8_Buttons_Round[1];
extern TCButton_Round * const code Screen8_CButtons_Round[8];
extern TCLabel * const code Screen8_CLabels[3];


extern TScreen ScreenAdmin2;
extern TButton_Round bAdminReturn2;
extern TButton_Round bCalTouch;
extern TButton_Round bFlashChair;
extern TButton_Round bDisplayCals;
extern TButton_Round bEnableKidLock;
extern TButton_Round bDisableKidLock;
extern TButton_Round * const code Screen9_Buttons_Round[6];





void bAdminReturn2OnClick();
void bAdminReturnOnClick();
void bBindFlashOnClick();
void bBindNoFlashOnClick();
void bCalTouchOnClick();
void bChairDimOnClick();
void bChangePWOnClick();
void bChPWCancelOnClick();
void bChPwOnClick();
void bCleanOnPress();
void bCleanOnUp();
void bDimBack1OnClick();
void bDimBack2OnClick();
void bDimBack3OnClick();
void bDimBack4OnClick();
void bDimBack5OnClick();
void bDimBack6OnClick();
void bDimBackMaxOnClick();
void bDimBackOffOnClick();
void bDimBackOnClick();
void bDimChBackOnClick();
void bDimHighOnClick();
void bDimLevelOnClick();
void bDimLowOnClick();
void bDimMedOnClick();
void bDimOffOnClick();
void bDisableKidLockOnClick();
void bDisplayCalsOnClick();
void bEnableKidLockOnClick();
void bFlashChairOnClick();
void bFootRestOpenOnPress();
void bFootRestOpenOnUp();
void bHomeOnPress();
void bHomeOnUp();
void bNext2Admin2OnClick();
void bNum0ChOnClick();
void bNum0OnClick();
void bNum1ChOnClick();
void bNum1OnClick();
void bNum2ChOnClick();
void bNum2OnClick();
void bNum3ChOnClick();
void bNum3OnClick();
void bNum4ChOnClick();
void bNum4OnClick();
void bNum5ChOnClick();
void bNum5OnClick();
void bNum6ChOnClick();
void bNum6OnClick();
void bNum7ChOnClick();
void bNum7OnClick();
void bNum8ChOnClick();
void bNum8OnClick();
void bNum9ChOnClick();
void bNum9OnClick();
void bPWCancelOnClick();
void bPWEnterOnClick();
void bReclineBackOnClick();
void bSendReclineLimitCmdOnClick();
void bSetReclineLimitOnClick();
void CHiLogoOnClick();
void SmallChairLogoOnClick();




extern char CHiLogo_Caption[];
extern const char lRevNo_Caption[];
extern const char SmallChairLogo_Caption[];
extern const char bClean_Caption[];
extern const char bHome_Caption[];
extern const char lHome_Caption[];
extern const char lClean_Caption[];
extern const char bFootRestOpen_Caption[];
extern const char lFootReset_Caption[];
extern const char lOpen_Caption[];
extern char PwRect_Caption[];
extern char bPWEnter_Caption[];
extern char bNum1_Caption[];
extern char bNum4_Caption[];
extern char bNum7_Caption[];
extern char bNum2_Caption[];
extern char bNum5_Caption[];
extern char bNum8_Caption[];
extern char bNum0_Caption[];
extern char bNum3_Caption[];
extern char bNum6_Caption[];
extern char bNum9_Caption[];
extern char bPWCancel_Caption[];
extern const char lEnterPassword_Caption[];
extern char lPWLabel_Caption[];
extern char Box1_Caption[];
extern char bAdminReturn_Caption[];
extern char bChangePW_Caption[];
extern char bSetReclineLimit_Caption[];
extern char bBindFlash_Caption[];
extern char bBindNoFlash_Caption[];
extern char bDimLevel_Caption[];
extern char bChairDim_Caption[];
extern char bNext2Admin2_Caption[];
extern const char lReclineIinst1_Caption[];
extern const char lReclineIinst2_Caption[];
extern const char lReclineIinst3_Caption[];
extern const char lReclineIinst4_Caption[];
extern const char lReclineIinst5_Caption[];
extern const char lReclineIinst6_Caption[];
extern const char lReclineIinst7_Caption[];
extern char bSendReclineLimitCmd_Caption[];
extern char bReclineBack_Caption[];
extern char ChPwRect_Caption[];
extern char bChPw_Caption[];
extern char bNum1Ch_Caption[];
extern char bNum4Ch_Caption[];
extern char bNum7Ch_Caption[];
extern char bNum2Ch_Caption[];
extern char bNum5Ch_Caption[];
extern char bNum8Ch_Caption[];
extern char bNum0Ch_Caption[];
extern char bNum3Ch_Caption[];
extern char bNum6Ch_Caption[];
extern char bNum9Ch_Caption[];
extern char bChPWCancel_Caption[];
extern const char lChPw1_Caption[];
extern const char lChPw2_Caption[];
extern char lChPWLabel_Caption[];
extern const char bDimOff_Caption[];
extern const char lDimInstruct1_Caption[];
extern const char bDimLow_Caption[];
extern const char bDimHigh_Caption[];
extern const char bDimMed_Caption[];
extern const char bDimBack_Caption[];
extern const char Label2_Caption[];
extern const char bDimBackOff_Caption[];
extern const char lDimCh1_Caption[];
extern const char lDimCh2_Caption[];
extern const char bDimBack1_Caption[];
extern const char bDimBack2_Caption[];
extern const char bDimBack3_Caption[];
extern const char bDimBack4_Caption[];
extern const char bDimBack5_Caption[];
extern const char bDimBack6_Caption[];
extern const char bDimBackMax_Caption[];
extern const char Label5_Caption[];
extern char bDimChBack_Caption[];
extern char bAdminReturn2_Caption[];
extern char bCalTouch_Caption[];
extern char bFlashChair_Caption[];
extern char bDisplayCals_Caption[];
extern char bEnableKidLock_Caption[];
extern char bDisableKidLock_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawRoundButton(TButton_Round *Around_button);
void DrawCRoundButton(TCButton_Round *ACround_button);
void DrawLabel(TLabel *ALabel);
void DrawCLabel(TCLabel *AClabel);
void DrawImage(TImage *AImage);
void DrawCImage(TCImage *ACimage);
void DrawBox(TBox *ABox);
void Check_TP();
void Start_TP();
#line 1 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/chi_hub_vgcld_resources.h"
const code char Tahoma14x16_Bold[];
const code char Tahoma19x19_Bold[];
const code char Tahoma10x11_Regular[];
const code char Tahoma12x11_Bold[];
const code char Logo200x91_bmp[2275];
const code char LogoChair32x32_bmp[128];
const code char CleanButton_bmp[540];
const code char HomeButton_bmp[540];
const code char FootRaiseButton_bmp[540];
#line 1 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/misc_functions.h"
#line 5 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/misc_functions.h"
 void My_Init(void);
 void Display_Cals(void);
 void Write_Cals(void);
 void My_Calibrate_TP(void);
 void Read_params(unsigned char *ptr);
 void Write_params(unsigned char *ptr);
 void Toggle_Send_RF_Bind_with_Flash();
 void Toggle_Send_RF_Bind_no_Flash();
 void Send_RF_Broadcast_Cmd_n(char n_times);
 void SendRF_Command_CLOSE_ALL(void);
 void SendRF_Command_OPEN_ALL(void);
 void SendRF_Command_OPEN_FOOTREST_ALL(void);
 void Toggle_Send_Flash(void);
 void Display_Hub_Address(void);
 void Beep(void);
#line 1 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/global_defs.h"
#line 61 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/global_defs.h"
typedef union params_t {
  unsigned char  Params_Array[ 28 ];
 struct
 {
  unsigned char  Backlight_Level;
  unsigned char  MyPanID[2];
  unsigned char  ChairPanID[2];
  unsigned char  MyShortAddress[2];
  unsigned char  MyLongAddress[8];

  unsigned int  TP_Cals[4];
 unsigned char Password[5];

 } HubParams;
} ;
#line 1 "c:/users/mike/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 11 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/CHi_Hub_VGCLD_events_code.c"
 extern union params_t EEParams;
 extern volatile  unsigned int  open_close_tmr, time_out_tmr;


void Key_pressed(char);
void Ch_Key_pressed(char);


extern sfr sbit BacklightBlue;
extern sfr sbit BacklightRed;
extern sfr sbit BacklightGreen;




char typed_letters[6] = "";
extern char Data_buf[10];


void Key_pressed(char letter_pressed){
unsigned short text_length;
char res[2] = " ";

 text_length = strlen(typed_letters);
 if (text_length >= 6) {
 lPWLabel.Font_Color =  0 ;
 DrawLabel(&lPWLabel);
 lPWLabel.Font_Color =  0b1000 ;
 strcpy(lPWLabel_Caption, "      ");
 DrawLabel(&lPWLabel);
 typed_letters[0] = 0;


 }

 res[0] = letter_pressed;
 strcat(typed_letters, res);
 strcpy(lPWLabel_Caption, typed_letters);
 DrawLabel(&lPWLabel);
}

void Ch_Key_pressed(char letter_pressed){
unsigned short text_length;
char res[2] = " ";

 text_length = strlen(typed_letters);
 if (text_length >= 4) {
 lChPWLabel.Font_Color =  0 ;
 DrawLabel(&lChPWLabel);
 lChPWLabel.Font_Color =  0b1000 ;
 strcpy(lChPWLabel_Caption, "    ");
 DrawLabel(&lChPWLabel);
 typed_letters[0] = 0;


 }

 res[0] = letter_pressed;
 strcat(typed_letters, res);
 strcpy(lChPWLabel_Caption, typed_letters);
 DrawLabel(&lChPWLabel);
}






void bHomeOnPress() {


 BacklightRed = 1;
 BacklightGreen = 0;
  CCPR3L  = 0;

 SendRF_Command_CLOSE_ALL();
}

void bHomeOnUp() {

 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = EEParams.HubParams.Backlight_Level;

}

void bCleanOnPress() {


 BacklightRed = 1;
 BacklightGreen = 0;
  CCPR3L  = 0;

 SendRF_Command_OPEN_ALL();
}

void bCleanOnUp() {

 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = EEParams.HubParams.Backlight_Level;

}

void bFootRestOpenOnPress() {


 BacklightRed = 1;
 BacklightGreen = 0;
  CCPR3L  = 0;

 SendRF_Command_OPEN_FOOTREST_ALL();
}

void bFootRestOpenOnUp() {

 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = EEParams.HubParams.Backlight_Level;

}

void bNum1OnClick() {
 Beep();
 Key_pressed('1');
}

void bNum2OnClick() {
 Beep();
 Key_pressed('2');
}

void bNum3OnClick() {
 Beep();
 Key_pressed('3');
}

void bNum4OnClick() {
 Beep();
 Key_pressed('4');
}

void bNum5OnClick() {
 Beep();
 Key_pressed('5');
}

void bNum6OnClick() {
 Beep();
 Key_pressed('6');
}

void bNum7OnClick() {
 Beep();
 Key_pressed('7');
}

void bNum8OnClick() {
 Beep();
 Key_pressed('8');
}

void bNum9OnClick() {
 Beep();
 Key_pressed('9');
}

void bNum0OnClick() {
 Beep();
 Key_pressed('0');
}

void bNum1ChOnClick() {
 Beep();
 Ch_Key_pressed('1');
}

void bNum2ChOnClick() {
 Beep();
 Ch_Key_pressed('2');
}

void bNum3ChOnClick() {
 Beep();
 Ch_Key_pressed('3');
}

void bNum4ChOnClick() {
 Beep();
 Ch_Key_pressed('4');
}

void bNum5ChOnClick() {
 Beep();
 Ch_Key_pressed('5');
}

void bNum6ChOnClick() {
 Beep();
 Ch_Key_pressed('6');
}

void bNum7ChOnClick() {
 Beep();
 Ch_Key_pressed('7');
}

void bNum8ChOnClick() {
 Beep();
 Ch_Key_pressed('8');
}

void bNum9ChOnClick() {
 Beep();
 Ch_Key_pressed('9');
}

void bNum0ChOnClick() {
 Beep();
 Ch_Key_pressed('0');
}


void bChPwOnClick() {
 char i;
 Beep();



 lChPWLabel.Font_Color =  0 ;
 DrawLabel(&lChPWLabel);
 lChPWLabel.Font_Color =  0b1000 ;

 if(strlen(typed_letters) == 4)
 {

 BacklightRed = 1;
 BacklightGreen = 0;
  CCPR3L  = 0;
 Delay_Ms(1000);
 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = EEParams.HubParams.Backlight_Level;
 for(i=0; i<4; i++)
 {
 EEParams.HubParams.Password[i] = typed_letters[i];

 Write_params(EEParams.Params_Array);
 }
 strcpy(bChPWCancel_Caption,"DONE");
 DrawRoundButton(&bChPWCancel);
 }
 else
 {


 BacklightRed = 0;
 BacklightGreen = 1;
  CCPR3L  = 0;
 Delay_Ms(1000);
 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = EEParams.HubParams.Backlight_Level;
 BacklightBlue = 0;

 }

 strcpy(lChPWLabel_Caption, "    ");
 DrawLabel(&lChPWLabel);
 typed_letters[0] = 0;
}

void bChPWCancelOnClick() {

 Beep();
 strcpy(lChPWLabel_Caption, "    ");
 strcpy(typed_letters, "");
 DrawScreen(&ScreenAdmin1);
 strcpy(bChPWCancel_Caption,"CANCEL");
}

void bSetUpOnClick() {

 DrawScreen(&ScreenPW);
}


void CHiLogoOnClick() {
 Beep();
 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = EEParams.HubParams.Backlight_Level;
 DrawScreen(&ScreenPW);
}

void SmallChairLogoOnClick() {
 Beep();
 DrawScreen(&ScreenWelcome);


 time_out_tmr = ( 6000  - 500);
}

void bReclineBackOnClick() {
 Beep();

 DrawScreen(&ScreenAdmin1);
}

void bBindFlashOnClick() {

 Beep();
 Toggle_Send_RF_Bind_with_Flash();
}

void bBindFlashOnUp() {

 BacklightRed = 1;
 BacklightGreen = 1;
 BacklightBlue = 0;
}

void bBindFlashOnPress() {

 BacklightRed = 1;
 BacklightGreen = 0;
 BacklightBlue = 1;


}

void bBindNoFlashOnClick() {

 Beep();
 Toggle_Send_RF_Bind_no_Flash();
}

void bBindNoFlashOnUp() {

 BacklightRed = 1;
 BacklightGreen = 1;
 BacklightBlue = 0;
}

void bBindNoFlashOnPress() {

 BacklightRed = 1;
 BacklightGreen = 0;
  CCPR3L  = 0;


}

void bCalTouchOnClick() {


 Beep();
 BacklightRed = 0;
 BacklightGreen = 0;
 BacklightBlue = 0;

 My_Calibrate_TP();


 BacklightRed = 1;
 BacklightGreen = 1;


 Write_Cals();

 DrawScreen(&ScreenAdmin2);
}

void bPWEnterOnClick() {


 Beep();
 lPWLabel.Font_Color =  0 ;
 DrawLabel(&lPWLabel);
 lPWLabel.Font_Color =  0b1000 ;
#line 402 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/CHi_Hub_VGCLD_events_code.c"
 if(strcmp(lPWLabel_Caption, EEParams.HubParams.Password) == 0)
 {

 DrawScreen(&ScreenMain);
 }
 else if(strcmp(lPWLabel_Caption,  "193728" ) == 0)
 {

 DrawScreen(&ScreenAdmin1);
 }
 else
 {


 BacklightRed = 0;
 BacklightGreen = 1;
  CCPR3L  = 0;
 Delay_Ms(1000);
 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = EEParams.HubParams.Backlight_Level;
 BacklightBlue = 0;

 }

 strcpy(lPWLabel_Caption, "      ");
 DrawLabel(&lPWLabel);
 typed_letters[0] = 0;
}


void bPWCancelOnClick() {

 Beep();
 strcpy(lPWLabel_Caption, "      ");
 strcpy(typed_letters, "");
 DrawScreen(&ScreenWelcome);


 time_out_tmr = ( 6000  - 500);
}

void bSetReclineLimitOnClick() {
 Beep();
 DrawScreen(&ScreenSetRecline);
}

void bChangePWOnClick(void) {
 Beep();
 DrawScreen(&ScreenChangePW);
}

void bDimLevelOnClick() {

 Beep();
 DrawScreen(&ScreenTPDimLevel);
}

void bDimBackOnClick() {


 Beep();
 EEParams.HubParams.Backlight_Level =  CCPR3L ;
 EEPROM_Write( 10 ,  CCPR3L );


 DrawScreen(&ScreenAdmin1);
}

void bDimOffOnClick() {

 Beep();
  CCPR3L  = 0;

}

void bDimLowOnClick() {

 Beep();
  CCPR3L  =  10 ;
}

void bDimMedOnClick() {

 Beep();
  CCPR3L  =  100 ;
}

void bDimHighOnClick() {

 Beep();
  CCPR3L  =  240 ;
}

void bNext2Admin2OnClick() {

 Beep();
 DrawScreen(&ScreenAdmin2);
}

void bAdminReturn2OnClick() {

 Beep();
 DrawScreen(&ScreenAdmin1);
}

void bAdminReturnOnClick() {

 Beep();
 DrawScreen(&ScreenWelcome);


 time_out_tmr = ( 6000  - 500);
}

void bSendReclineLimitCmdOnClick() {


 Beep();

 BacklightRed = 1;
 BacklightGreen = 0;
  CCPR3L  = 255;


 Data_buf[0] = 1;
 Data_buf[1] =  0x0A ;
 Send_RF_Broadcast_Cmd_n(5);

 Delay_Ms(1000);
 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = EEParams.HubParams.Backlight_Level;
}

void bSendReclineLimitCmdOnPress() {




 BacklightRed = 1;
 BacklightGreen = 0;
  CCPR3L  = 255;


 Data_buf[0] = 1;
 Data_buf[1] =  0x0A ;
 Send_RF_Broadcast_Cmd_n(5);

}

void bSendReclineLimitCmdOnUp() {


 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = EEParams.HubParams.Backlight_Level;
}

void bChairDimOnClick() {

 Beep();
 DrawScreen(&ScreenChDimLevel);
}

void bDimChBackOnClick() {

 Beep();
 DrawScreen(&ScreenAdmin1);
}

void bDimBackOffOnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0B ;
 Data_buf[2] = 0;
 Send_RF_Broadcast_Cmd_n(3);

}

void bDimBack1OnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0B ;
 Data_buf[2] = 1;
 Send_RF_Broadcast_Cmd_n(3);

}


void bDimBack2OnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0B ;
 Data_buf[2] = 2;
 Send_RF_Broadcast_Cmd_n(3);

}


void bDimBack3OnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0B ;
 Data_buf[2] = 3;
 Send_RF_Broadcast_Cmd_n(3);

}

void bDimBack4OnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0B ;
 Data_buf[2] = 4;
 Send_RF_Broadcast_Cmd_n(3);

}

void bDimBack5OnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0B ;
 Data_buf[2] = 5;
 Send_RF_Broadcast_Cmd_n(3);

}

void bDimBack6OnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0B ;
 Data_buf[2] = 6;
 Send_RF_Broadcast_Cmd_n(3);

}

void bDimBackMaxOnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0B ;
 Data_buf[2] = 7;
 Send_RF_Broadcast_Cmd_n(3);

}



void bDimAmbOffOnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0C ;
 Data_buf[2] = 0;
 Send_RF_Broadcast_Cmd_n(3);

}

void bDimAmb1OnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0C ;
 Data_buf[2] = 1;
 Send_RF_Broadcast_Cmd_n(3);

}

void bDimAmb2OnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0C ;
 Data_buf[2] = 2;
 Send_RF_Broadcast_Cmd_n(3);

}

void bDimAmb3OnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0C ;
 Data_buf[2] = 3;
 Send_RF_Broadcast_Cmd_n(3);

}

void bDimAmb4OnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0C ;
 Data_buf[2] = 4;
 Send_RF_Broadcast_Cmd_n(3);

}

void bDimAmb5OnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0C ;
 Data_buf[2] = 5;
 Send_RF_Broadcast_Cmd_n(3);

}

void bDimAmb6OnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0C ;
 Data_buf[2] = 6;
 Send_RF_Broadcast_Cmd_n(3);

}

void bDimAmbMaxOnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0C ;
 Data_buf[2] = 7;
 Send_RF_Broadcast_Cmd_n(3);

}

void bFlashChairOnClick() {

 Beep();
 Toggle_Send_Flash();
}

void bDisplayCalsOnClick() {

 Beep();
 BacklightRed = 0;
 BacklightGreen = 0;
  CCPR3L  = 255;


 Display_Cals();
 Display_Hub_Address();
 Delay_ms(7000);

 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = EEParams.HubParams.Backlight_Level;
 DrawScreen(&ScreenAdmin2);
}

void bEnableKidLockOnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0D ;
 Data_buf[2] = 1;
 Send_RF_Broadcast_Cmd_n(3);

}


void bDisableKidLockOnClick() {


 Beep();
 Data_buf[0] = 2;
 Data_buf[1] =  0x0D ;
 Data_buf[2] = 0;
 Send_RF_Broadcast_Cmd_n(3);

}
