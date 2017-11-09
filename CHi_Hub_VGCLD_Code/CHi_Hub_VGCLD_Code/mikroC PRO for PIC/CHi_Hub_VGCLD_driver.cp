#line 1 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/CHi_Hub_VGCLD_driver.c"
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
#line 1 "c:/users/mike/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 5 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/CHi_Hub_VGCLD_driver.c"
 extern volatile unsigned int time_out_tmr;


char T6963C_dataPort at PORTH;
sbit T6963C_ctrlwr at LATJ2_bit;
sbit T6963C_ctrlcd at LATJ0_bit;
sbit T6963C_ctrlrst at LATJ4_bit;
sbit T6963C_ctrlce at LATJ3_bit;
sbit T6963C_ctrlfs at LATJ6_bit;
sbit T6963C_ctrlmd at LATJ5_bit;
sbit BacklightRed at LATC2_bit;
sbit BacklightGreen at LATC1_bit;
sbit BacklightBlue at LATG0_bit;
sbit T6963C_ctrlrd at LATJ1_bit;
sbit T6963C_ctrlwr_Direction at TRISJ2_bit;
sbit T6963C_ctrlrd_Direction at TRISJ1_bit;
sbit T6963C_ctrlcd_Direction at TRISJ0_bit;
sbit T6963C_ctrlrst_Direction at TRISJ4_bit;
sbit T6963C_ctrlce_Direction at TRISJ3_bit;
sbit T6963C_ctrlfs_Direction at TRISJ6_bit;
sbit T6963C_ctrlmd_Direction at TRISJ5_bit;
sbit BacklightRed_Direction at TRISC2_bit;
sbit BacklightGreen_Direction at TRISC1_bit;
sbit BacklightBlue_Direction at TRISG0_bit;



sbit DriveA at LATG3_bit;
sbit DriveB at LATG4_bit;
sbit DriveA_Direction at TRISG3_bit;
sbit DriveB_Direction at TRISG4_bit;



unsigned int Xcoord, Ycoord;
const ADC_THRESHOLD = 500;
char PenDown;
typedef unsigned long TPointer;
TPointer PressedObject;
int PressedObjectType;
unsigned int T6963C_caption_length, T6963C_caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TButton_Round *local_round_button;
TButton_Round *exec_round_button;
int round_button_order;
TCButton_Round *local_round_cbutton;
TCButton_Round *exec_round_cbutton;
int round_cbutton_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TCLabel *local_clabel;
TCLabel *exec_clabel;
int clabel_order;
TImage *local_image;
TImage *exec_image;
int image_order;
TCImage *local_cimage;
TCImage *exec_cimage;
int cimage_order;
TBox *local_box;
TBox *exec_box;
int box_order;



void Init_ADC() {
 ANCON0.B0 = 1;
 ANCON0.B1 = 1;
 TRISA.B0 = 1;
 TRISA.B1 = 1;
 ADC_Init();
}
static void InitializeTouchPanel() {
 Init_ADC();
 T6963C_ctrlce_Direction = 0;
 T6963C_ctrlce = 0;
 T6963C_ctrlmd_Direction = 0;
 T6963C_ctrlmd = 0;
 T6963C_ctrlfs_Direction = 0;
 T6963C_ctrlfs = 0;


 T6963C_init(240, 128, 8);
  T6963C_display. F3  = 1; T6963C_writeCommand(T6963C_display) ;
  T6963C_display. F2  = 1; T6963C_writeCommand(T6963C_display) ;
  T6963C_display. F1  = 0; T6963C_writeCommand(T6963C_display) ;

 TP_Init(240, 128, 0, 1);
 TP_Set_ADC_Threshold(ADC_THRESHOLD);

 PenDown = 0;
 PressedObject = 0;
 PressedObjectType = -1;
}



 TScreen* CurrentScreen;

 TScreen ScreenWelcome;
 TImage CHiLogo;
 TCLabel lRevNo =
 {
 &ScreenWelcome ,
 1 ,
 204 ,
 112 ,
 18 ,
 12 ,
 &lRevNo_Caption ,
 &T6963C_defaultFont ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lRevNo_Caption[5] = "V1.2";

 TCLabel * const code Screen1_CLabels[1]=
 {
 &lRevNo
 };
 TImage * const code Screen1_Images[1]=
 {
 &CHiLogo
 };


 TScreen ScreenMain;
 TCImage SmallChairLogo =
 {
 &ScreenMain ,
 0 ,
 0 ,
 0 ,
 32 ,
 32 ,
 32 ,
 32 ,
 &LogoChair32x32_bmp ,
 1 ,
 1 ,
 0 ,
 0 ,
 SmallChairLogoOnClick ,
 0
 };
 TCImage bClean =
 {
 &ScreenMain ,
 1 ,
 84 ,
 41 ,
 70 ,
 60 ,
 70 ,
 60 ,
 &CleanButton_bmp ,
 1 ,
 1 ,
 bCleanOnUp ,
 0 ,
 0 ,
 bCleanOnPress
 };
 TCImage bHome =
 {
 &ScreenMain ,
 2 ,
 163 ,
 41 ,
 70 ,
 60 ,
 70 ,
 60 ,
 &HomeButton_bmp ,
 1 ,
 1 ,
 bHomeOnUp ,
 0 ,
 0 ,
 bHomeOnPress
 };
 TCLabel lHome =
 {
 &ScreenMain ,
 3 ,
 173 ,
 103 ,
 50 ,
 12 ,
 &lHome_Caption ,
 &Tahoma12x11_Bold ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lHome_Caption[10] = "CLOSE ALL";

 TCLabel lClean =
 {
 &ScreenMain ,
 4 ,
 97 ,
 103 ,
 46 ,
 12 ,
 &lClean_Caption ,
 &Tahoma12x11_Bold ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lClean_Caption[9] = "OPEN ALL";

 TCImage bFootRestOpen =
 {
 &ScreenMain ,
 5 ,
 6 ,
 41 ,
 70 ,
 60 ,
 70 ,
 60 ,
 &FootRaiseButton_bmp ,
 1 ,
 1 ,
 bFootRestOpenOnUp ,
 0 ,
 0 ,
 bFootRestOpenOnPress
 };
 TCLabel lFootReset =
 {
 &ScreenMain ,
 6 ,
 16 ,
 110 ,
 49 ,
 12 ,
 &lFootReset_Caption ,
 &Tahoma12x11_Bold ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lFootReset_Caption[9] = "FOOTREST";

 TCLabel lOpen =
 {
 &ScreenMain ,
 7 ,
 28 ,
 101 ,
 26 ,
 12 ,
 &lOpen_Caption ,
 &Tahoma12x11_Bold ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lOpen_Caption[5] = "OPEN";

 TCLabel * const code Screen2_CLabels[4]=
 {
 &lHome,
 &lClean,
 &lFootReset,
 &lOpen
 };
 TCImage * const code Screen2_CImages[4]=
 {
 &SmallChairLogo,
 &bClean,
 &bHome,
 &bFootRestOpen
 };


 TScreen ScreenPW;
 TBox PwRect;
 TButton_Round bPWEnter;
char bPWEnter_Caption[6] = "ENTER";

 TButton_Round bNum1;
char bNum1_Caption[2] = "1";

 TButton_Round bNum4;
char bNum4_Caption[2] = "4";

 TButton_Round bNum7;
char bNum7_Caption[2] = "7";

 TButton_Round bNum2;
char bNum2_Caption[2] = "2";

 TButton_Round bNum5;
char bNum5_Caption[2] = "5";

 TButton_Round bNum8;
char bNum8_Caption[2] = "8";

 TButton_Round bNum0;
char bNum0_Caption[2] = "0";

 TButton_Round bNum3;
char bNum3_Caption[2] = "3";

 TButton_Round bNum6;
char bNum6_Caption[2] = "6";

 TButton_Round bNum9;
char bNum9_Caption[2] = "9";

 TButton_Round bPWCancel;
char bPWCancel_Caption[7] = "CANCEL";

 TCLabel lEnterPassword =
 {
 &ScreenPW ,
 13 ,
 125 ,
 5 ,
 105 ,
 17 ,
 &lEnterPassword_Caption,
 &Tahoma14x16_Bold ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lEnterPassword_Caption[15] = "Enter Password";

 TLabel lPWLabel;
char lPWLabel_Caption[9] = "       ";

 TButton_Round * const code Screen3_Buttons_Round[12]=
 {
 &bPWEnter,
 &bNum1,
 &bNum4,
 &bNum7,
 &bNum2,
 &bNum5,
 &bNum8,
 &bNum0,
 &bNum3,
 &bNum6,
 &bNum9,
 &bPWCancel
 };
 TLabel * const code Screen3_Labels[1]=
 {
 &lPWLabel
 };
 TCLabel * const code Screen3_CLabels[1]=
 {
 &lEnterPassword
 };
 TBox * const code Screen3_Boxes[1]=
 {
 &PwRect
 };


 TScreen ScreenAdmin1;
 TBox Box1;
 TButton_Round bAdminReturn;
char bAdminReturn_Caption[5] = "BACK";

 TButton_Round bChangePW;
char bChangePW_Caption[16] = "Change Password";

 TButton_Round bSetReclineLimit;
char bSetReclineLimit_Caption[18] = "Set Recline Limit";

 TButton_Round bBindFlash;
char bBindFlash_Caption[16] = "Sync with Flash";

 TButton_Round bBindNoFlash;
char bBindNoFlash_Caption[14] = "Sync no Flash";

 TButton_Round bDimLevel;
char bDimLevel_Caption[16] = "Hub Light Level";

 TButton_Round bChairDim;
char bChairDim_Caption[18] = "Chair Light Level";

 TButton_Round bNext2Admin2;
char bNext2Admin2_Caption[5] = "NEXT";

 TButton_Round * const code Screen4_Buttons_Round[8]=
 {
 &bAdminReturn,
 &bChangePW,
 &bSetReclineLimit,
 &bBindFlash,
 &bBindNoFlash,
 &bDimLevel,
 &bChairDim,
 &bNext2Admin2
 };
 TBox * const code Screen4_Boxes[1]=
 {
 &Box1
 };


 TScreen ScreenSetRecline;
 TCLabel lReclineIinst1 =
 {
 &ScreenSetRecline ,
 0 ,
 8 ,
 2 ,
 206 ,
 12 ,
 &lReclineIinst1_Caption,
 &T6963C_defaultFont ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lReclineIinst1_Caption[50] = "Using the  button on the chair, move the seatback";

 TCLabel lReclineIinst2 =
 {
 &ScreenSetRecline ,
 1 ,
 8 ,
 14 ,
 204 ,
 12 ,
 &lReclineIinst2_Caption,
 &T6963C_defaultFont ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lReclineIinst2_Caption[49] = "to the maximum reclined positon you want to set.";

 TCLabel lReclineIinst3 =
 {
 &ScreenSetRecline ,
 2 ,
 8 ,
 26 ,
 198 ,
 12 ,
 &lReclineIinst3_Caption,
 &T6963C_defaultFont ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lReclineIinst3_Caption[53] = "Chairs that are in the full upright position will be";

 TCLabel lReclineIinst4 =
 {
 &ScreenSetRecline ,
 3 ,
 8 ,
 38 ,
 99 ,
 12 ,
 &lReclineIinst4_Caption,
 &T6963C_defaultFont ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lReclineIinst4_Caption[28] = "reset to allow full travel.";

 TCLabel lReclineIinst5 =
 {
 &ScreenSetRecline ,
 4 ,
 8 ,
 50 ,
 206 ,
 12 ,
 &lReclineIinst5_Caption,
 &T6963C_defaultFont ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lReclineIinst5_Caption[53] = "When all chairs are set to the desired position, tap";

 TCLabel lReclineIinst6 =
 {
 &ScreenSetRecline ,
 5 ,
 8 ,
 62 ,
 177 ,
 12 ,
 &lReclineIinst6_Caption,
 &T6963C_defaultFont ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lReclineIinst6_Caption[47] = "the \'SET\' button below until all chairs flash.";

 TCLabel lReclineIinst7 =
 {
 &ScreenSetRecline ,
 6 ,
 8 ,
 74 ,
 226 ,
 12 ,
 &lReclineIinst7_Caption,
 &T6963C_defaultFont ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lReclineIinst7_Caption[55] = "To return to the Admin screen, push the \'BACK\' button.";

 TButton_Round bSendReclineLimitCmd;
char bSendReclineLimitCmd_Caption[4] = "SET";

 TButton_Round bReclineBack;
char bReclineBack_Caption[5] = "BACK";

 TButton_Round * const code Screen5_Buttons_Round[2]=
 {
 &bSendReclineLimitCmd,
 &bReclineBack
 };
 TCLabel * const code Screen5_CLabels[7]=
 {
 &lReclineIinst1,
 &lReclineIinst2,
 &lReclineIinst3,
 &lReclineIinst4,
 &lReclineIinst5,
 &lReclineIinst6,
 &lReclineIinst7
 };


 TScreen ScreenChangePW;
 TBox ChPwRect;
 TButton_Round bChPw;
char bChPw_Caption[7] = "CHANGE";

 TButton_Round bNum1Ch;
char bNum1Ch_Caption[2] = "1";

 TButton_Round bNum4Ch;
char bNum4Ch_Caption[2] = "4";

 TButton_Round bNum7Ch;
char bNum7Ch_Caption[2] = "7";

 TButton_Round bNum2Ch;
char bNum2Ch_Caption[2] = "2";

 TButton_Round bNum5Ch;
char bNum5Ch_Caption[2] = "5";

 TButton_Round bNum8Ch;
char bNum8Ch_Caption[2] = "8";

 TButton_Round bNum0Ch;
char bNum0Ch_Caption[2] = "0";

 TButton_Round bNum3Ch;
char bNum3Ch_Caption[2] = "3";

 TButton_Round bNum6Ch;
char bNum6Ch_Caption[2] = "6";

 TButton_Round bNum9Ch;
char bNum9Ch_Caption[2] = "9";

 TButton_Round bChPWCancel;
char bChPWCancel_Caption[7] = "CANCEL";

 TCLabel lChPw1 =
 {
 &ScreenChangePW ,
 13 ,
 113 ,
 2 ,
 70 ,
 17 ,
 &lChPw1_Caption ,
 &Tahoma14x16_Bold ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lChPw1_Caption[10] = "Enter New";

 TCLabel lChPw2 =
 {
 &ScreenChangePW ,
 14 ,
 113 ,
 15 ,
 114 ,
 17 ,
 &lChPw2_Caption ,
 &Tahoma14x16_Bold ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lChPw2_Caption[17] = "4 Digit Password";

 TLabel lChPWLabel;
char lChPWLabel_Caption[5] = "    ";

 TButton_Round * const code Screen6_Buttons_Round[12]=
 {
 &bChPw,
 &bNum1Ch,
 &bNum4Ch,
 &bNum7Ch,
 &bNum2Ch,
 &bNum5Ch,
 &bNum8Ch,
 &bNum0Ch,
 &bNum3Ch,
 &bNum6Ch,
 &bNum9Ch,
 &bChPWCancel
 };
 TLabel * const code Screen6_Labels[1]=
 {
 &lChPWLabel
 };
 TCLabel * const code Screen6_CLabels[2]=
 {
 &lChPw1,
 &lChPw2
 };
 TBox * const code Screen6_Boxes[1]=
 {
 &ChPwRect
 };


 TScreen ScreenTPDimLevel;
 TCButton_Round bDimOff =
 {
 &ScreenTPDimLevel ,
 0 ,
 22 ,
 39 ,
 41 ,
 21 ,
 1 ,
 1 ,
 &bDimOff_Caption ,
 _taCenter ,
 &Tahoma14x16_Bold ,
 3 ,
 1 ,
 0 ,
 0 ,
 bDimOffOnClick ,
 0
 };
const char bDimOff_Caption[4] = "OFF";

 TCLabel lDimInstruct1 =
 {
 &ScreenTPDimLevel ,
 1 ,
 16 ,
 6 ,
 188 ,
 12 ,
 &lDimInstruct1_Caption,
 &T6963C_defaultFont ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lDimInstruct1_Caption[48] = "Press the button of the desired backlight level";

 TCButton_Round bDimLow =
 {
 &ScreenTPDimLevel ,
 2 ,
 73 ,
 39 ,
 41 ,
 21 ,
 1 ,
 1 ,
 &bDimLow_Caption ,
 _taCenter ,
 &Tahoma14x16_Bold ,
 3 ,
 1 ,
 0 ,
 0 ,
 bDimLowOnClick ,
 0
 };
const char bDimLow_Caption[4] = "LOW";

 TCButton_Round bDimHigh =
 {
 &ScreenTPDimLevel ,
 3 ,
 175 ,
 39 ,
 41 ,
 21 ,
 1 ,
 1 ,
 &bDimHigh_Caption ,
 _taCenter ,
 &Tahoma14x16_Bold ,
 3 ,
 1 ,
 0 ,
 0 ,
 bDimHighOnClick ,
 0
 };
const char bDimHigh_Caption[4] = "MAX";

 TCButton_Round bDimMed =
 {
 &ScreenTPDimLevel ,
 4 ,
 124 ,
 39 ,
 41 ,
 21 ,
 1 ,
 1 ,
 &bDimMed_Caption ,
 _taCenter ,
 &Tahoma14x16_Bold ,
 3 ,
 1 ,
 0 ,
 0 ,
 bDimMedOnClick ,
 0
 };
const char bDimMed_Caption[4] = "MED";

 TCButton_Round bDimBack =
 {
 &ScreenTPDimLevel ,
 5 ,
 166 ,
 90 ,
 50 ,
 27 ,
 1 ,
 1 ,
 &bDimBack_Caption ,
 _taCenter ,
 &Tahoma14x16_Bold ,
 3 ,
 1 ,
 0 ,
 0 ,
 bDimBackOnClick ,
 0
 };
const char bDimBack_Caption[5] = "BACK";

 TCLabel Label2 =
 {
 &ScreenTPDimLevel ,
 6 ,
 16 ,
 16 ,
 108 ,
 12 ,
 &Label2_Caption ,
 &T6963C_defaultFont ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label2_Caption[28] = "for this hub\'s touchscreen.";

 TCButton_Round * const code Screen7_CButtons_Round[5]=
 {
 &bDimOff,
 &bDimLow,
 &bDimHigh,
 &bDimMed,
 &bDimBack
 };
 TCLabel * const code Screen7_CLabels[2]=
 {
 &lDimInstruct1,
 &Label2
 };


 TScreen ScreenChDimLevel;
 TCButton_Round bDimBackOff =
 {
 &ScreenChDimLevel ,
 0 ,
 6 ,
 54 ,
 25 ,
 15 ,
 1 ,
 1 ,
 &bDimBackOff_Caption ,
 _taCenter ,
 &T6963C_defaultFont ,
 3 ,
 1 ,
 0 ,
 0 ,
 bDimBackOffOnClick ,
 0
 };
const char bDimBackOff_Caption[4] = "OFF";

 TCLabel lDimCh1 =
 {
 &ScreenChDimLevel ,
 1 ,
 16 ,
 6 ,
 171 ,
 12 ,
 &lDimCh1_Caption ,
 &T6963C_defaultFont ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lDimCh1_Caption[46] = "Enter the desired light level for the chair\'s";

 TCLabel lDimCh2 =
 {
 &ScreenChDimLevel ,
 2 ,
 16 ,
 17 ,
 108 ,
 12 ,
 &lDimCh2_Caption ,
 &T6963C_defaultFont ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char lDimCh2_Caption[27] = "Keypad Backlight Lighting.";

 TCButton_Round bDimBack1 =
 {
 &ScreenChDimLevel ,
 3 ,
 35 ,
 54 ,
 25 ,
 15 ,
 1 ,
 1 ,
 &bDimBack1_Caption ,
 _taCenter ,
 &Tahoma12x11_Bold ,
 3 ,
 1 ,
 0 ,
 0 ,
 bDimBack1OnClick ,
 0
 };
const char bDimBack1_Caption[2] = "1";

 TCButton_Round bDimBack2 =
 {
 &ScreenChDimLevel ,
 4 ,
 64 ,
 54 ,
 25 ,
 15 ,
 1 ,
 1 ,
 &bDimBack2_Caption ,
 _taCenter ,
 &Tahoma12x11_Bold ,
 3 ,
 1 ,
 0 ,
 0 ,
 bDimBack2OnClick ,
 0
 };
const char bDimBack2_Caption[2] = "2";

 TCButton_Round bDimBack3 =
 {
 &ScreenChDimLevel ,
 5 ,
 93 ,
 54 ,
 25 ,
 15 ,
 1 ,
 1 ,
 &bDimBack3_Caption ,
 _taCenter ,
 &Tahoma12x11_Bold ,
 3 ,
 1 ,
 0 ,
 0 ,
 bDimBack3OnClick ,
 0
 };
const char bDimBack3_Caption[2] = "3";

 TCButton_Round bDimBack4 =
 {
 &ScreenChDimLevel ,
 6 ,
 122 ,
 54 ,
 25 ,
 15 ,
 1 ,
 1 ,
 &bDimBack4_Caption ,
 _taCenter ,
 &Tahoma12x11_Bold ,
 3 ,
 1 ,
 0 ,
 0 ,
 bDimBack4OnClick ,
 0
 };
const char bDimBack4_Caption[2] = "4";

 TCButton_Round bDimBack5 =
 {
 &ScreenChDimLevel ,
 7 ,
 151 ,
 54 ,
 25 ,
 15 ,
 1 ,
 1 ,
 &bDimBack5_Caption ,
 _taCenter ,
 &Tahoma12x11_Bold ,
 3 ,
 1 ,
 0 ,
 0 ,
 bDimBack5OnClick ,
 0
 };
const char bDimBack5_Caption[2] = "5";

 TCButton_Round bDimBack6 =
 {
 &ScreenChDimLevel ,
 8 ,
 180 ,
 54 ,
 25 ,
 15 ,
 1 ,
 1 ,
 &bDimBack6_Caption ,
 _taCenter ,
 &Tahoma12x11_Bold ,
 3 ,
 1 ,
 0 ,
 0 ,
 bDimBack6OnClick ,
 0
 };
const char bDimBack6_Caption[2] = "6";

 TCButton_Round bDimBackMax =
 {
 &ScreenChDimLevel ,
 9 ,
 209 ,
 54 ,
 25 ,
 15 ,
 1 ,
 1 ,
 &bDimBackMax_Caption ,
 _taCenter ,
 &T6963C_defaultFont ,
 3 ,
 1 ,
 0 ,
 0 ,
 bDimBackMaxOnClick ,
 0
 };
const char bDimBackMax_Caption[4] = "MAX";

 TCLabel Label5 =
 {
 &ScreenChDimLevel ,
 10 ,
 80 ,
 70 ,
 70 ,
 12 ,
 &Label5_Caption ,
 &T6963C_defaultFont ,
  0b1000  ,
 1 ,
 1 ,
 0 ,
 0 ,
 0 ,
 0
 };
const char Label5_Caption[17] = "Keypad Backlight";

 TButton_Round bDimChBack;
char bDimChBack_Caption[5] = "BACK";

 TButton_Round * const code Screen8_Buttons_Round[1]=
 {
 &bDimChBack
 };
 TCButton_Round * const code Screen8_CButtons_Round[8]=
 {
 &bDimBackOff,
 &bDimBack1,
 &bDimBack2,
 &bDimBack3,
 &bDimBack4,
 &bDimBack5,
 &bDimBack6,
 &bDimBackMax
 };
 TCLabel * const code Screen8_CLabels[3]=
 {
 &lDimCh1,
 &lDimCh2,
 &Label5
 };


 TScreen ScreenAdmin2;
 TButton_Round bAdminReturn2;
char bAdminReturn2_Caption[5] = "BACK";

 TButton_Round bCalTouch;
char bCalTouch_Caption[16] = "Calibrate Touch";

 TButton_Round bFlashChair;
char bFlashChair_Caption[17] = "Flash All Chairs";

 TButton_Round bDisplayCals;
char bDisplayCals_Caption[19] = "Display Touch Cals";

 TButton_Round bEnableKidLock;
char bEnableKidLock_Caption[16] = "Enable Kid Lock";

 TButton_Round bDisableKidLock;
char bDisableKidLock_Caption[17] = "Disable Kid Lock";

 TButton_Round * const code Screen9_Buttons_Round[6]=
 {
 &bAdminReturn2,
 &bCalTouch,
 &bFlashChair,
 &bDisplayCals,
 &bEnableKidLock,
 &bDisableKidLock
 };




static void InitializeObjects() {
 ScreenWelcome.Buttons_RoundCount = 0;
 ScreenWelcome.CButtons_RoundCount = 0;
 ScreenWelcome.LabelsCount = 0;
 ScreenWelcome.CLabelsCount = 1;
 ScreenWelcome.CLabels = Screen1_CLabels;
 ScreenWelcome.ImagesCount = 1;
 ScreenWelcome.Images = Screen1_Images;
 ScreenWelcome.CImagesCount = 0;
 ScreenWelcome.BoxesCount = 0;
 ScreenWelcome.ObjectsCount = 2;

 ScreenMain.Buttons_RoundCount = 0;
 ScreenMain.CButtons_RoundCount = 0;
 ScreenMain.LabelsCount = 0;
 ScreenMain.CLabelsCount = 4;
 ScreenMain.CLabels = Screen2_CLabels;
 ScreenMain.ImagesCount = 0;
 ScreenMain.CImagesCount = 4;
 ScreenMain.CImages = Screen2_CImages;
 ScreenMain.BoxesCount = 0;
 ScreenMain.ObjectsCount = 8;

 ScreenPW.Buttons_RoundCount = 12;
 ScreenPW.Buttons_Round = Screen3_Buttons_Round;
 ScreenPW.CButtons_RoundCount = 0;
 ScreenPW.LabelsCount = 1;
 ScreenPW.Labels = Screen3_Labels;
 ScreenPW.CLabelsCount = 1;
 ScreenPW.CLabels = Screen3_CLabels;
 ScreenPW.ImagesCount = 0;
 ScreenPW.CImagesCount = 0;
 ScreenPW.BoxesCount = 1;
 ScreenPW.Boxes = Screen3_Boxes;
 ScreenPW.ObjectsCount = 15;

 ScreenAdmin1.Buttons_RoundCount = 8;
 ScreenAdmin1.Buttons_Round = Screen4_Buttons_Round;
 ScreenAdmin1.CButtons_RoundCount = 0;
 ScreenAdmin1.LabelsCount = 0;
 ScreenAdmin1.CLabelsCount = 0;
 ScreenAdmin1.ImagesCount = 0;
 ScreenAdmin1.CImagesCount = 0;
 ScreenAdmin1.BoxesCount = 1;
 ScreenAdmin1.Boxes = Screen4_Boxes;
 ScreenAdmin1.ObjectsCount = 9;

 ScreenSetRecline.Buttons_RoundCount = 2;
 ScreenSetRecline.Buttons_Round = Screen5_Buttons_Round;
 ScreenSetRecline.CButtons_RoundCount = 0;
 ScreenSetRecline.LabelsCount = 0;
 ScreenSetRecline.CLabelsCount = 7;
 ScreenSetRecline.CLabels = Screen5_CLabels;
 ScreenSetRecline.ImagesCount = 0;
 ScreenSetRecline.CImagesCount = 0;
 ScreenSetRecline.BoxesCount = 0;
 ScreenSetRecline.ObjectsCount = 9;

 ScreenChangePW.Buttons_RoundCount = 12;
 ScreenChangePW.Buttons_Round = Screen6_Buttons_Round;
 ScreenChangePW.CButtons_RoundCount = 0;
 ScreenChangePW.LabelsCount = 1;
 ScreenChangePW.Labels = Screen6_Labels;
 ScreenChangePW.CLabelsCount = 2;
 ScreenChangePW.CLabels = Screen6_CLabels;
 ScreenChangePW.ImagesCount = 0;
 ScreenChangePW.CImagesCount = 0;
 ScreenChangePW.BoxesCount = 1;
 ScreenChangePW.Boxes = Screen6_Boxes;
 ScreenChangePW.ObjectsCount = 16;

 ScreenTPDimLevel.Buttons_RoundCount = 0;
 ScreenTPDimLevel.CButtons_RoundCount = 5;
 ScreenTPDimLevel.CButtons_Round = Screen7_CButtons_Round;
 ScreenTPDimLevel.LabelsCount = 0;
 ScreenTPDimLevel.CLabelsCount = 2;
 ScreenTPDimLevel.CLabels = Screen7_CLabels;
 ScreenTPDimLevel.ImagesCount = 0;
 ScreenTPDimLevel.CImagesCount = 0;
 ScreenTPDimLevel.BoxesCount = 0;
 ScreenTPDimLevel.ObjectsCount = 7;

 ScreenChDimLevel.Buttons_RoundCount = 1;
 ScreenChDimLevel.Buttons_Round = Screen8_Buttons_Round;
 ScreenChDimLevel.CButtons_RoundCount = 8;
 ScreenChDimLevel.CButtons_Round = Screen8_CButtons_Round;
 ScreenChDimLevel.LabelsCount = 0;
 ScreenChDimLevel.CLabelsCount = 3;
 ScreenChDimLevel.CLabels = Screen8_CLabels;
 ScreenChDimLevel.ImagesCount = 0;
 ScreenChDimLevel.CImagesCount = 0;
 ScreenChDimLevel.BoxesCount = 0;
 ScreenChDimLevel.ObjectsCount = 12;

 ScreenAdmin2.Buttons_RoundCount = 6;
 ScreenAdmin2.Buttons_Round = Screen9_Buttons_Round;
 ScreenAdmin2.CButtons_RoundCount = 0;
 ScreenAdmin2.LabelsCount = 0;
 ScreenAdmin2.CLabelsCount = 0;
 ScreenAdmin2.ImagesCount = 0;
 ScreenAdmin2.CImagesCount = 0;
 ScreenAdmin2.BoxesCount = 0;
 ScreenAdmin2.ObjectsCount = 6;


 CHiLogo.OwnerScreen = &ScreenWelcome;
 CHiLogo.Order = 0;
 CHiLogo.Left = 19;
 CHiLogo.Top = 14;
 CHiLogo.Width = 200;
 CHiLogo.Height = 91;
 CHiLogo.PictureWidth = 200;
 CHiLogo.PictureHeight = 91;
 CHiLogo.Picture_Name = Logo200x91_bmp;
 CHiLogo.Visible = 1;
 CHiLogo.Active = 1;
 CHiLogo.OnUpPtr = 0;
 CHiLogo.OnDownPtr = 0;
 CHiLogo.OnClickPtr = CHiLogoOnClick;
 CHiLogo.OnPressPtr = 0;

 PwRect.OwnerScreen = &ScreenPW;
 PwRect.Order = 0;
 PwRect.Left = 126;
 PwRect.Top = 35;
 PwRect.Width = 58;
 PwRect.Height = 15;
 PwRect.Visible = 1;
 PwRect.Active = 1;
 PwRect.Transparent = 1;
 PwRect.OnUpPtr = 0;
 PwRect.OnDownPtr = 0;
 PwRect.OnClickPtr = 0;
 PwRect.OnPressPtr = 0;

 bPWEnter.OwnerScreen = &ScreenPW;
 bPWEnter.Order = 1;
 bPWEnter.Left = 107;
 bPWEnter.Top = 80;
 bPWEnter.Width = 54;
 bPWEnter.Height = 36;
 bPWEnter.Visible = 1;
 bPWEnter.Active = 1;
 bPWEnter.Caption = bPWEnter_Caption;
 bPWEnter.TextAlign = _taCenter;
 bPWEnter.FontName = Tahoma14x16_Bold;
 bPWEnter.PressColEnabled = 1;
 bPWEnter.Corner_Radius = 3;
 bPWEnter.OnUpPtr = 0;
 bPWEnter.OnDownPtr = 0;
 bPWEnter.OnClickPtr = bPWEnterOnClick;
 bPWEnter.OnPressPtr = 0;

 bNum1.OwnerScreen = &ScreenPW;
 bNum1.Order = 2;
 bNum1.Left = 14;
 bNum1.Top = 6;
 bNum1.Width = 25;
 bNum1.Height = 25;
 bNum1.Visible = 1;
 bNum1.Active = 1;
 bNum1.Caption = bNum1_Caption;
 bNum1.TextAlign = _taCenter;
 bNum1.FontName = Tahoma14x16_Bold;
 bNum1.PressColEnabled = 1;
 bNum1.Corner_Radius = 3;
 bNum1.OnUpPtr = 0;
 bNum1.OnDownPtr = 0;
 bNum1.OnClickPtr = bNum1OnClick;
 bNum1.OnPressPtr = 0;

 bNum4.OwnerScreen = &ScreenPW;
 bNum4.Order = 3;
 bNum4.Left = 14;
 bNum4.Top = 35;
 bNum4.Width = 25;
 bNum4.Height = 25;
 bNum4.Visible = 1;
 bNum4.Active = 1;
 bNum4.Caption = bNum4_Caption;
 bNum4.TextAlign = _taCenter;
 bNum4.FontName = Tahoma14x16_Bold;
 bNum4.PressColEnabled = 1;
 bNum4.Corner_Radius = 3;
 bNum4.OnUpPtr = 0;
 bNum4.OnDownPtr = 0;
 bNum4.OnClickPtr = bNum4OnClick;
 bNum4.OnPressPtr = 0;

 bNum7.OwnerScreen = &ScreenPW;
 bNum7.Order = 4;
 bNum7.Left = 14;
 bNum7.Top = 64;
 bNum7.Width = 25;
 bNum7.Height = 25;
 bNum7.Visible = 1;
 bNum7.Active = 1;
 bNum7.Caption = bNum7_Caption;
 bNum7.TextAlign = _taCenter;
 bNum7.FontName = Tahoma14x16_Bold;
 bNum7.PressColEnabled = 1;
 bNum7.Corner_Radius = 3;
 bNum7.OnUpPtr = 0;
 bNum7.OnDownPtr = 0;
 bNum7.OnClickPtr = bNum7OnClick;
 bNum7.OnPressPtr = 0;

 bNum2.OwnerScreen = &ScreenPW;
 bNum2.Order = 5;
 bNum2.Left = 43;
 bNum2.Top = 6;
 bNum2.Width = 25;
 bNum2.Height = 25;
 bNum2.Visible = 1;
 bNum2.Active = 1;
 bNum2.Caption = bNum2_Caption;
 bNum2.TextAlign = _taCenter;
 bNum2.FontName = Tahoma14x16_Bold;
 bNum2.PressColEnabled = 1;
 bNum2.Corner_Radius = 3;
 bNum2.OnUpPtr = 0;
 bNum2.OnDownPtr = 0;
 bNum2.OnClickPtr = bNum2OnClick;
 bNum2.OnPressPtr = 0;

 bNum5.OwnerScreen = &ScreenPW;
 bNum5.Order = 6;
 bNum5.Left = 43;
 bNum5.Top = 35;
 bNum5.Width = 25;
 bNum5.Height = 25;
 bNum5.Visible = 1;
 bNum5.Active = 1;
 bNum5.Caption = bNum5_Caption;
 bNum5.TextAlign = _taCenter;
 bNum5.FontName = Tahoma14x16_Bold;
 bNum5.PressColEnabled = 1;
 bNum5.Corner_Radius = 3;
 bNum5.OnUpPtr = 0;
 bNum5.OnDownPtr = 0;
 bNum5.OnClickPtr = bNum5OnClick;
 bNum5.OnPressPtr = 0;

 bNum8.OwnerScreen = &ScreenPW;
 bNum8.Order = 7;
 bNum8.Left = 43;
 bNum8.Top = 64;
 bNum8.Width = 25;
 bNum8.Height = 25;
 bNum8.Visible = 1;
 bNum8.Active = 1;
 bNum8.Caption = bNum8_Caption;
 bNum8.TextAlign = _taCenter;
 bNum8.FontName = Tahoma14x16_Bold;
 bNum8.PressColEnabled = 1;
 bNum8.Corner_Radius = 3;
 bNum8.OnUpPtr = 0;
 bNum8.OnDownPtr = 0;
 bNum8.OnClickPtr = bNum8OnClick;
 bNum8.OnPressPtr = 0;

 bNum0.OwnerScreen = &ScreenPW;
 bNum0.Order = 8;
 bNum0.Left = 43;
 bNum0.Top = 93;
 bNum0.Width = 25;
 bNum0.Height = 25;
 bNum0.Visible = 1;
 bNum0.Active = 1;
 bNum0.Caption = bNum0_Caption;
 bNum0.TextAlign = _taCenter;
 bNum0.FontName = Tahoma14x16_Bold;
 bNum0.PressColEnabled = 1;
 bNum0.Corner_Radius = 3;
 bNum0.OnUpPtr = 0;
 bNum0.OnDownPtr = 0;
 bNum0.OnClickPtr = bNum0OnClick;
 bNum0.OnPressPtr = 0;

 bNum3.OwnerScreen = &ScreenPW;
 bNum3.Order = 9;
 bNum3.Left = 72;
 bNum3.Top = 6;
 bNum3.Width = 25;
 bNum3.Height = 25;
 bNum3.Visible = 1;
 bNum3.Active = 1;
 bNum3.Caption = bNum3_Caption;
 bNum3.TextAlign = _taCenter;
 bNum3.FontName = Tahoma14x16_Bold;
 bNum3.PressColEnabled = 1;
 bNum3.Corner_Radius = 3;
 bNum3.OnUpPtr = 0;
 bNum3.OnDownPtr = 0;
 bNum3.OnClickPtr = bNum3OnClick;
 bNum3.OnPressPtr = 0;

 bNum6.OwnerScreen = &ScreenPW;
 bNum6.Order = 10;
 bNum6.Left = 72;
 bNum6.Top = 35;
 bNum6.Width = 25;
 bNum6.Height = 25;
 bNum6.Visible = 1;
 bNum6.Active = 1;
 bNum6.Caption = bNum6_Caption;
 bNum6.TextAlign = _taCenter;
 bNum6.FontName = Tahoma14x16_Bold;
 bNum6.PressColEnabled = 1;
 bNum6.Corner_Radius = 3;
 bNum6.OnUpPtr = 0;
 bNum6.OnDownPtr = 0;
 bNum6.OnClickPtr = bNum6OnClick;
 bNum6.OnPressPtr = 0;

 bNum9.OwnerScreen = &ScreenPW;
 bNum9.Order = 11;
 bNum9.Left = 71;
 bNum9.Top = 64;
 bNum9.Width = 25;
 bNum9.Height = 25;
 bNum9.Visible = 1;
 bNum9.Active = 1;
 bNum9.Caption = bNum9_Caption;
 bNum9.TextAlign = _taCenter;
 bNum9.FontName = Tahoma14x16_Bold;
 bNum9.PressColEnabled = 1;
 bNum9.Corner_Radius = 3;
 bNum9.OnUpPtr = 0;
 bNum9.OnDownPtr = 0;
 bNum9.OnClickPtr = bNum9OnClick;
 bNum9.OnPressPtr = 0;

 bPWCancel.OwnerScreen = &ScreenPW;
 bPWCancel.Order = 12;
 bPWCancel.Left = 172;
 bPWCancel.Top = 80;
 bPWCancel.Width = 62;
 bPWCancel.Height = 36;
 bPWCancel.Visible = 1;
 bPWCancel.Active = 1;
 bPWCancel.Caption = bPWCancel_Caption;
 bPWCancel.TextAlign = _taCenter;
 bPWCancel.FontName = Tahoma14x16_Bold;
 bPWCancel.PressColEnabled = 1;
 bPWCancel.Corner_Radius = 3;
 bPWCancel.OnUpPtr = 0;
 bPWCancel.OnDownPtr = 0;
 bPWCancel.OnClickPtr = bPWCancelOnClick;
 bPWCancel.OnPressPtr = 0;

 lPWLabel.OwnerScreen = &ScreenPW;
 lPWLabel.Order = 14;
 lPWLabel.Left = 130;
 lPWLabel.Top = 34;
 lPWLabel.Width = 0;
 lPWLabel.Height = 17;
 lPWLabel.Visible = 1;
 lPWLabel.Active = 1;
 lPWLabel.Caption = lPWLabel_Caption;
 lPWLabel.FontName = Tahoma14x16_Bold;
 lPWLabel.Font_Color =  0b1000 ;
 lPWLabel.OnUpPtr = 0;
 lPWLabel.OnDownPtr = 0;
 lPWLabel.OnClickPtr = 0;
 lPWLabel.OnPressPtr = 0;

 Box1.OwnerScreen = &ScreenAdmin1;
 Box1.Order = 0;
 Box1.Left = 115;
 Box1.Top = 3;
 Box1.Width = 101;
 Box1.Height = 73;
 Box1.Visible = 1;
 Box1.Active = 1;
 Box1.Transparent = 1;
 Box1.OnUpPtr = 0;
 Box1.OnDownPtr = 0;
 Box1.OnClickPtr = 0;
 Box1.OnPressPtr = 0;

 bAdminReturn.OwnerScreen = &ScreenAdmin1;
 bAdminReturn.Order = 1;
 bAdminReturn.Left = 7;
 bAdminReturn.Top = 4;
 bAdminReturn.Width = 35;
 bAdminReturn.Height = 15;
 bAdminReturn.Visible = 1;
 bAdminReturn.Active = 1;
 bAdminReturn.Caption = bAdminReturn_Caption;
 bAdminReturn.TextAlign = _taCenter;
 bAdminReturn.FontName = Tahoma12x11_Bold;
 bAdminReturn.PressColEnabled = 1;
 bAdminReturn.Corner_Radius = 3;
 bAdminReturn.OnUpPtr = 0;
 bAdminReturn.OnDownPtr = 0;
 bAdminReturn.OnClickPtr = bAdminReturnOnClick;
 bAdminReturn.OnPressPtr = 0;

 bChangePW.OwnerScreen = &ScreenAdmin1;
 bChangePW.Order = 2;
 bChangePW.Left = 7;
 bChangePW.Top = 52;
 bChangePW.Width = 88;
 bChangePW.Height = 20;
 bChangePW.Visible = 1;
 bChangePW.Active = 1;
 bChangePW.Caption = bChangePW_Caption;
 bChangePW.TextAlign = _taCenter;
 bChangePW.FontName = T6963C_defaultFont;
 bChangePW.PressColEnabled = 1;
 bChangePW.Corner_Radius = 3;
 bChangePW.OnUpPtr = 0;
 bChangePW.OnDownPtr = 0;
 bChangePW.OnClickPtr = bChangePWOnClick;
 bChangePW.OnPressPtr = 0;

 bSetReclineLimit.OwnerScreen = &ScreenAdmin1;
 bSetReclineLimit.Order = 3;
 bSetReclineLimit.Left = 7;
 bSetReclineLimit.Top = 28;
 bSetReclineLimit.Width = 88;
 bSetReclineLimit.Height = 20;
 bSetReclineLimit.Visible = 1;
 bSetReclineLimit.Active = 1;
 bSetReclineLimit.Caption = bSetReclineLimit_Caption;
 bSetReclineLimit.TextAlign = _taCenter;
 bSetReclineLimit.FontName = T6963C_defaultFont;
 bSetReclineLimit.PressColEnabled = 1;
 bSetReclineLimit.Corner_Radius = 3;
 bSetReclineLimit.OnUpPtr = 0;
 bSetReclineLimit.OnDownPtr = 0;
 bSetReclineLimit.OnClickPtr = bSetReclineLimitOnClick;
 bSetReclineLimit.OnPressPtr = 0;

 bBindFlash.OwnerScreen = &ScreenAdmin1;
 bBindFlash.Order = 4;
 bBindFlash.Left = 122;
 bBindFlash.Top = 10;
 bBindFlash.Width = 86;
 bBindFlash.Height = 26;
 bBindFlash.Visible = 1;
 bBindFlash.Active = 1;
 bBindFlash.Caption = bBindFlash_Caption;
 bBindFlash.TextAlign = _taCenter;
 bBindFlash.FontName = T6963C_defaultFont;
 bBindFlash.PressColEnabled = 1;
 bBindFlash.Corner_Radius = 3;
 bBindFlash.OnUpPtr = 0;
 bBindFlash.OnDownPtr = 0;
 bBindFlash.OnClickPtr = bBindFlashOnClick;
 bBindFlash.OnPressPtr = 0;

 bBindNoFlash.OwnerScreen = &ScreenAdmin1;
 bBindNoFlash.Order = 5;
 bBindNoFlash.Left = 122;
 bBindNoFlash.Top = 44;
 bBindNoFlash.Width = 86;
 bBindNoFlash.Height = 26;
 bBindNoFlash.Visible = 1;
 bBindNoFlash.Active = 1;
 bBindNoFlash.Caption = bBindNoFlash_Caption;
 bBindNoFlash.TextAlign = _taCenter;
 bBindNoFlash.FontName = T6963C_defaultFont;
 bBindNoFlash.PressColEnabled = 1;
 bBindNoFlash.Corner_Radius = 3;
 bBindNoFlash.OnUpPtr = 0;
 bBindNoFlash.OnDownPtr = 0;
 bBindNoFlash.OnClickPtr = bBindNoFlashOnClick;
 bBindNoFlash.OnPressPtr = 0;

 bDimLevel.OwnerScreen = &ScreenAdmin1;
 bDimLevel.Order = 6;
 bDimLevel.Left = 7;
 bDimLevel.Top = 76;
 bDimLevel.Width = 88;
 bDimLevel.Height = 20;
 bDimLevel.Visible = 1;
 bDimLevel.Active = 1;
 bDimLevel.Caption = bDimLevel_Caption;
 bDimLevel.TextAlign = _taCenter;
 bDimLevel.FontName = T6963C_defaultFont;
 bDimLevel.PressColEnabled = 1;
 bDimLevel.Corner_Radius = 3;
 bDimLevel.OnUpPtr = 0;
 bDimLevel.OnDownPtr = 0;
 bDimLevel.OnClickPtr = bDimLevelOnClick;
 bDimLevel.OnPressPtr = 0;

 bChairDim.OwnerScreen = &ScreenAdmin1;
 bChairDim.Order = 7;
 bChairDim.Left = 7;
 bChairDim.Top = 100;
 bChairDim.Width = 88;
 bChairDim.Height = 20;
 bChairDim.Visible = 1;
 bChairDim.Active = 1;
 bChairDim.Caption = bChairDim_Caption;
 bChairDim.TextAlign = _taCenter;
 bChairDim.FontName = T6963C_defaultFont;
 bChairDim.PressColEnabled = 1;
 bChairDim.Corner_Radius = 3;
 bChairDim.OnUpPtr = 0;
 bChairDim.OnDownPtr = 0;
 bChairDim.OnClickPtr = bChairDimOnClick;
 bChairDim.OnPressPtr = 0;

 bNext2Admin2.OwnerScreen = &ScreenAdmin1;
 bNext2Admin2.Order = 8;
 bNext2Admin2.Left = 189;
 bNext2Admin2.Top = 104;
 bNext2Admin2.Width = 35;
 bNext2Admin2.Height = 15;
 bNext2Admin2.Visible = 1;
 bNext2Admin2.Active = 1;
 bNext2Admin2.Caption = bNext2Admin2_Caption;
 bNext2Admin2.TextAlign = _taCenter;
 bNext2Admin2.FontName = Tahoma12x11_Bold;
 bNext2Admin2.PressColEnabled = 1;
 bNext2Admin2.Corner_Radius = 3;
 bNext2Admin2.OnUpPtr = 0;
 bNext2Admin2.OnDownPtr = 0;
 bNext2Admin2.OnClickPtr = bNext2Admin2OnClick;
 bNext2Admin2.OnPressPtr = 0;

 bSendReclineLimitCmd.OwnerScreen = &ScreenSetRecline;
 bSendReclineLimitCmd.Order = 7;
 bSendReclineLimitCmd.Left = 34;
 bSendReclineLimitCmd.Top = 92;
 bSendReclineLimitCmd.Width = 50;
 bSendReclineLimitCmd.Height = 27;
 bSendReclineLimitCmd.Visible = 1;
 bSendReclineLimitCmd.Active = 1;
 bSendReclineLimitCmd.Caption = bSendReclineLimitCmd_Caption;
 bSendReclineLimitCmd.TextAlign = _taCenter;
 bSendReclineLimitCmd.FontName = Tahoma14x16_Bold;
 bSendReclineLimitCmd.PressColEnabled = 1;
 bSendReclineLimitCmd.Corner_Radius = 3;
 bSendReclineLimitCmd.OnUpPtr = 0;
 bSendReclineLimitCmd.OnDownPtr = 0;
 bSendReclineLimitCmd.OnClickPtr = bSendReclineLimitCmdOnClick;
 bSendReclineLimitCmd.OnPressPtr = 0;

 bReclineBack.OwnerScreen = &ScreenSetRecline;
 bReclineBack.Order = 8;
 bReclineBack.Left = 164;
 bReclineBack.Top = 92;
 bReclineBack.Width = 50;
 bReclineBack.Height = 27;
 bReclineBack.Visible = 1;
 bReclineBack.Active = 1;
 bReclineBack.Caption = bReclineBack_Caption;
 bReclineBack.TextAlign = _taCenter;
 bReclineBack.FontName = Tahoma14x16_Bold;
 bReclineBack.PressColEnabled = 1;
 bReclineBack.Corner_Radius = 3;
 bReclineBack.OnUpPtr = 0;
 bReclineBack.OnDownPtr = 0;
 bReclineBack.OnClickPtr = bReclineBackOnClick;
 bReclineBack.OnPressPtr = 0;

 ChPwRect.OwnerScreen = &ScreenChangePW;
 ChPwRect.Order = 0;
 ChPwRect.Left = 121;
 ChPwRect.Top = 39;
 ChPwRect.Width = 47;
 ChPwRect.Height = 15;
 ChPwRect.Visible = 1;
 ChPwRect.Active = 1;
 ChPwRect.Transparent = 1;
 ChPwRect.OnUpPtr = 0;
 ChPwRect.OnDownPtr = 0;
 ChPwRect.OnClickPtr = 0;
 ChPwRect.OnPressPtr = 0;

 bChPw.OwnerScreen = &ScreenChangePW;
 bChPw.Order = 1;
 bChPw.Left = 103;
 bChPw.Top = 80;
 bChPw.Width = 68;
 bChPw.Height = 36;
 bChPw.Visible = 1;
 bChPw.Active = 1;
 bChPw.Caption = bChPw_Caption;
 bChPw.TextAlign = _taCenter;
 bChPw.FontName = Tahoma14x16_Bold;
 bChPw.PressColEnabled = 1;
 bChPw.Corner_Radius = 3;
 bChPw.OnUpPtr = 0;
 bChPw.OnDownPtr = 0;
 bChPw.OnClickPtr = bChPwOnClick;
 bChPw.OnPressPtr = 0;

 bNum1Ch.OwnerScreen = &ScreenChangePW;
 bNum1Ch.Order = 2;
 bNum1Ch.Left = 11;
 bNum1Ch.Top = 7;
 bNum1Ch.Width = 25;
 bNum1Ch.Height = 25;
 bNum1Ch.Visible = 1;
 bNum1Ch.Active = 1;
 bNum1Ch.Caption = bNum1Ch_Caption;
 bNum1Ch.TextAlign = _taCenter;
 bNum1Ch.FontName = Tahoma19x19_Bold;
 bNum1Ch.PressColEnabled = 1;
 bNum1Ch.Corner_Radius = 3;
 bNum1Ch.OnUpPtr = 0;
 bNum1Ch.OnDownPtr = 0;
 bNum1Ch.OnClickPtr = bNum1ChOnClick;
 bNum1Ch.OnPressPtr = 0;

 bNum4Ch.OwnerScreen = &ScreenChangePW;
 bNum4Ch.Order = 3;
 bNum4Ch.Left = 11;
 bNum4Ch.Top = 36;
 bNum4Ch.Width = 25;
 bNum4Ch.Height = 25;
 bNum4Ch.Visible = 1;
 bNum4Ch.Active = 1;
 bNum4Ch.Caption = bNum4Ch_Caption;
 bNum4Ch.TextAlign = _taCenter;
 bNum4Ch.FontName = Tahoma19x19_Bold;
 bNum4Ch.PressColEnabled = 1;
 bNum4Ch.Corner_Radius = 3;
 bNum4Ch.OnUpPtr = 0;
 bNum4Ch.OnDownPtr = 0;
 bNum4Ch.OnClickPtr = bNum4ChOnClick;
 bNum4Ch.OnPressPtr = 0;

 bNum7Ch.OwnerScreen = &ScreenChangePW;
 bNum7Ch.Order = 4;
 bNum7Ch.Left = 11;
 bNum7Ch.Top = 65;
 bNum7Ch.Width = 25;
 bNum7Ch.Height = 25;
 bNum7Ch.Visible = 1;
 bNum7Ch.Active = 1;
 bNum7Ch.Caption = bNum7Ch_Caption;
 bNum7Ch.TextAlign = _taCenter;
 bNum7Ch.FontName = Tahoma19x19_Bold;
 bNum7Ch.PressColEnabled = 1;
 bNum7Ch.Corner_Radius = 3;
 bNum7Ch.OnUpPtr = 0;
 bNum7Ch.OnDownPtr = 0;
 bNum7Ch.OnClickPtr = bNum7ChOnClick;
 bNum7Ch.OnPressPtr = 0;

 bNum2Ch.OwnerScreen = &ScreenChangePW;
 bNum2Ch.Order = 5;
 bNum2Ch.Left = 40;
 bNum2Ch.Top = 7;
 bNum2Ch.Width = 25;
 bNum2Ch.Height = 25;
 bNum2Ch.Visible = 1;
 bNum2Ch.Active = 1;
 bNum2Ch.Caption = bNum2Ch_Caption;
 bNum2Ch.TextAlign = _taCenter;
 bNum2Ch.FontName = Tahoma19x19_Bold;
 bNum2Ch.PressColEnabled = 1;
 bNum2Ch.Corner_Radius = 3;
 bNum2Ch.OnUpPtr = 0;
 bNum2Ch.OnDownPtr = 0;
 bNum2Ch.OnClickPtr = bNum2ChOnClick;
 bNum2Ch.OnPressPtr = 0;

 bNum5Ch.OwnerScreen = &ScreenChangePW;
 bNum5Ch.Order = 6;
 bNum5Ch.Left = 40;
 bNum5Ch.Top = 36;
 bNum5Ch.Width = 25;
 bNum5Ch.Height = 25;
 bNum5Ch.Visible = 1;
 bNum5Ch.Active = 1;
 bNum5Ch.Caption = bNum5Ch_Caption;
 bNum5Ch.TextAlign = _taCenter;
 bNum5Ch.FontName = Tahoma19x19_Bold;
 bNum5Ch.PressColEnabled = 1;
 bNum5Ch.Corner_Radius = 3;
 bNum5Ch.OnUpPtr = 0;
 bNum5Ch.OnDownPtr = 0;
 bNum5Ch.OnClickPtr = bNum5ChOnClick;
 bNum5Ch.OnPressPtr = 0;

 bNum8Ch.OwnerScreen = &ScreenChangePW;
 bNum8Ch.Order = 7;
 bNum8Ch.Left = 40;
 bNum8Ch.Top = 65;
 bNum8Ch.Width = 25;
 bNum8Ch.Height = 25;
 bNum8Ch.Visible = 1;
 bNum8Ch.Active = 1;
 bNum8Ch.Caption = bNum8Ch_Caption;
 bNum8Ch.TextAlign = _taCenter;
 bNum8Ch.FontName = Tahoma19x19_Bold;
 bNum8Ch.PressColEnabled = 1;
 bNum8Ch.Corner_Radius = 3;
 bNum8Ch.OnUpPtr = 0;
 bNum8Ch.OnDownPtr = 0;
 bNum8Ch.OnClickPtr = bNum8ChOnClick;
 bNum8Ch.OnPressPtr = 0;

 bNum0Ch.OwnerScreen = &ScreenChangePW;
 bNum0Ch.Order = 8;
 bNum0Ch.Left = 40;
 bNum0Ch.Top = 94;
 bNum0Ch.Width = 25;
 bNum0Ch.Height = 25;
 bNum0Ch.Visible = 1;
 bNum0Ch.Active = 1;
 bNum0Ch.Caption = bNum0Ch_Caption;
 bNum0Ch.TextAlign = _taCenter;
 bNum0Ch.FontName = Tahoma19x19_Bold;
 bNum0Ch.PressColEnabled = 1;
 bNum0Ch.Corner_Radius = 3;
 bNum0Ch.OnUpPtr = 0;
 bNum0Ch.OnDownPtr = 0;
 bNum0Ch.OnClickPtr = bNum0ChOnClick;
 bNum0Ch.OnPressPtr = 0;

 bNum3Ch.OwnerScreen = &ScreenChangePW;
 bNum3Ch.Order = 9;
 bNum3Ch.Left = 69;
 bNum3Ch.Top = 7;
 bNum3Ch.Width = 25;
 bNum3Ch.Height = 25;
 bNum3Ch.Visible = 1;
 bNum3Ch.Active = 1;
 bNum3Ch.Caption = bNum3Ch_Caption;
 bNum3Ch.TextAlign = _taCenter;
 bNum3Ch.FontName = Tahoma19x19_Bold;
 bNum3Ch.PressColEnabled = 1;
 bNum3Ch.Corner_Radius = 3;
 bNum3Ch.OnUpPtr = 0;
 bNum3Ch.OnDownPtr = 0;
 bNum3Ch.OnClickPtr = bNum3ChOnClick;
 bNum3Ch.OnPressPtr = 0;

 bNum6Ch.OwnerScreen = &ScreenChangePW;
 bNum6Ch.Order = 10;
 bNum6Ch.Left = 69;
 bNum6Ch.Top = 36;
 bNum6Ch.Width = 25;
 bNum6Ch.Height = 25;
 bNum6Ch.Visible = 1;
 bNum6Ch.Active = 1;
 bNum6Ch.Caption = bNum6Ch_Caption;
 bNum6Ch.TextAlign = _taCenter;
 bNum6Ch.FontName = Tahoma19x19_Bold;
 bNum6Ch.PressColEnabled = 1;
 bNum6Ch.Corner_Radius = 3;
 bNum6Ch.OnUpPtr = 0;
 bNum6Ch.OnDownPtr = 0;
 bNum6Ch.OnClickPtr = bNum6ChOnClick;
 bNum6Ch.OnPressPtr = 0;

 bNum9Ch.OwnerScreen = &ScreenChangePW;
 bNum9Ch.Order = 11;
 bNum9Ch.Left = 68;
 bNum9Ch.Top = 65;
 bNum9Ch.Width = 25;
 bNum9Ch.Height = 25;
 bNum9Ch.Visible = 1;
 bNum9Ch.Active = 1;
 bNum9Ch.Caption = bNum9Ch_Caption;
 bNum9Ch.TextAlign = _taCenter;
 bNum9Ch.FontName = Tahoma19x19_Bold;
 bNum9Ch.PressColEnabled = 1;
 bNum9Ch.Corner_Radius = 3;
 bNum9Ch.OnUpPtr = 0;
 bNum9Ch.OnDownPtr = 0;
 bNum9Ch.OnClickPtr = bNum9ChOnClick;
 bNum9Ch.OnPressPtr = 0;

 bChPWCancel.OwnerScreen = &ScreenChangePW;
 bChPWCancel.Order = 12;
 bChPWCancel.Left = 177;
 bChPWCancel.Top = 80;
 bChPWCancel.Width = 60;
 bChPWCancel.Height = 36;
 bChPWCancel.Visible = 1;
 bChPWCancel.Active = 1;
 bChPWCancel.Caption = bChPWCancel_Caption;
 bChPWCancel.TextAlign = _taCenter;
 bChPWCancel.FontName = Tahoma14x16_Bold;
 bChPWCancel.PressColEnabled = 1;
 bChPWCancel.Corner_Radius = 3;
 bChPWCancel.OnUpPtr = 0;
 bChPWCancel.OnDownPtr = 0;
 bChPWCancel.OnClickPtr = bChPWCancelOnClick;
 bChPWCancel.OnPressPtr = 0;

 lChPWLabel.OwnerScreen = &ScreenChangePW;
 lChPWLabel.Order = 15;
 lChPWLabel.Left = 124;
 lChPWLabel.Top = 38;
 lChPWLabel.Width = 0;
 lChPWLabel.Height = 17;
 lChPWLabel.Visible = 1;
 lChPWLabel.Active = 1;
 lChPWLabel.Caption = lChPWLabel_Caption;
 lChPWLabel.FontName = Tahoma14x16_Bold;
 lChPWLabel.Font_Color =  0b1000 ;
 lChPWLabel.OnUpPtr = 0;
 lChPWLabel.OnDownPtr = 0;
 lChPWLabel.OnClickPtr = 0;
 lChPWLabel.OnPressPtr = 0;

 bDimChBack.OwnerScreen = &ScreenChDimLevel;
 bDimChBack.Order = 11;
 bDimChBack.Left = 191;
 bDimChBack.Top = 102;
 bDimChBack.Width = 42;
 bDimChBack.Height = 22;
 bDimChBack.Visible = 1;
 bDimChBack.Active = 1;
 bDimChBack.Caption = bDimChBack_Caption;
 bDimChBack.TextAlign = _taCenter;
 bDimChBack.FontName = Tahoma12x11_Bold;
 bDimChBack.PressColEnabled = 1;
 bDimChBack.Corner_Radius = 3;
 bDimChBack.OnUpPtr = 0;
 bDimChBack.OnDownPtr = 0;
 bDimChBack.OnClickPtr = bDimChBackOnClick;
 bDimChBack.OnPressPtr = 0;

 bAdminReturn2.OwnerScreen = &ScreenAdmin2;
 bAdminReturn2.Order = 0;
 bAdminReturn2.Left = 7;
 bAdminReturn2.Top = 4;
 bAdminReturn2.Width = 35;
 bAdminReturn2.Height = 15;
 bAdminReturn2.Visible = 1;
 bAdminReturn2.Active = 1;
 bAdminReturn2.Caption = bAdminReturn2_Caption;
 bAdminReturn2.TextAlign = _taCenter;
 bAdminReturn2.FontName = Tahoma12x11_Bold;
 bAdminReturn2.PressColEnabled = 1;
 bAdminReturn2.Corner_Radius = 3;
 bAdminReturn2.OnUpPtr = 0;
 bAdminReturn2.OnDownPtr = 0;
 bAdminReturn2.OnClickPtr = bAdminReturn2OnClick;
 bAdminReturn2.OnPressPtr = 0;

 bCalTouch.OwnerScreen = &ScreenAdmin2;
 bCalTouch.Order = 1;
 bCalTouch.Left = 7;
 bCalTouch.Top = 30;
 bCalTouch.Width = 88;
 bCalTouch.Height = 20;
 bCalTouch.Visible = 1;
 bCalTouch.Active = 1;
 bCalTouch.Caption = bCalTouch_Caption;
 bCalTouch.TextAlign = _taCenter;
 bCalTouch.FontName = T6963C_defaultFont;
 bCalTouch.PressColEnabled = 1;
 bCalTouch.Corner_Radius = 3;
 bCalTouch.OnUpPtr = 0;
 bCalTouch.OnDownPtr = 0;
 bCalTouch.OnClickPtr = bCalTouchOnClick;
 bCalTouch.OnPressPtr = 0;

 bFlashChair.OwnerScreen = &ScreenAdmin2;
 bFlashChair.Order = 2;
 bFlashChair.Left = 7;
 bFlashChair.Top = 57;
 bFlashChair.Width = 88;
 bFlashChair.Height = 20;
 bFlashChair.Visible = 1;
 bFlashChair.Active = 1;
 bFlashChair.Caption = bFlashChair_Caption;
 bFlashChair.TextAlign = _taCenter;
 bFlashChair.FontName = T6963C_defaultFont;
 bFlashChair.PressColEnabled = 1;
 bFlashChair.Corner_Radius = 3;
 bFlashChair.OnUpPtr = 0;
 bFlashChair.OnDownPtr = 0;
 bFlashChair.OnClickPtr = bFlashChairOnClick;
 bFlashChair.OnPressPtr = 0;

 bDisplayCals.OwnerScreen = &ScreenAdmin2;
 bDisplayCals.Order = 3;
 bDisplayCals.Left = 7;
 bDisplayCals.Top = 84;
 bDisplayCals.Width = 88;
 bDisplayCals.Height = 20;
 bDisplayCals.Visible = 1;
 bDisplayCals.Active = 1;
 bDisplayCals.Caption = bDisplayCals_Caption;
 bDisplayCals.TextAlign = _taCenter;
 bDisplayCals.FontName = T6963C_defaultFont;
 bDisplayCals.PressColEnabled = 1;
 bDisplayCals.Corner_Radius = 3;
 bDisplayCals.OnUpPtr = 0;
 bDisplayCals.OnDownPtr = 0;
 bDisplayCals.OnClickPtr = bDisplayCalsOnClick;
 bDisplayCals.OnPressPtr = 0;

 bEnableKidLock.OwnerScreen = &ScreenAdmin2;
 bEnableKidLock.Order = 4;
 bEnableKidLock.Left = 122;
 bEnableKidLock.Top = 30;
 bEnableKidLock.Width = 88;
 bEnableKidLock.Height = 20;
 bEnableKidLock.Visible = 1;
 bEnableKidLock.Active = 1;
 bEnableKidLock.Caption = bEnableKidLock_Caption;
 bEnableKidLock.TextAlign = _taCenter;
 bEnableKidLock.FontName = T6963C_defaultFont;
 bEnableKidLock.PressColEnabled = 1;
 bEnableKidLock.Corner_Radius = 3;
 bEnableKidLock.OnUpPtr = 0;
 bEnableKidLock.OnDownPtr = 0;
 bEnableKidLock.OnClickPtr = bEnableKidLockOnClick;
 bEnableKidLock.OnPressPtr = 0;

 bDisableKidLock.OwnerScreen = &ScreenAdmin2;
 bDisableKidLock.Order = 5;
 bDisableKidLock.Left = 122;
 bDisableKidLock.Top = 57;
 bDisableKidLock.Width = 88;
 bDisableKidLock.Height = 20;
 bDisableKidLock.Visible = 1;
 bDisableKidLock.Active = 1;
 bDisableKidLock.Caption = bDisableKidLock_Caption;
 bDisableKidLock.TextAlign = _taCenter;
 bDisableKidLock.FontName = T6963C_defaultFont;
 bDisableKidLock.PressColEnabled = 1;
 bDisableKidLock.Corner_Radius = 3;
 bDisableKidLock.OnUpPtr = 0;
 bDisableKidLock.OnDownPtr = 0;
 bDisableKidLock.OnClickPtr = bDisableKidLockOnClick;
 bDisableKidLock.OnPressPtr = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) {
 if ( (Left<= X) && (Left+ Width - 1 >= X) &&
 (Top <= Y) && (Top + Height - 1 >= Y) )
 return 1;
 else
 return 0;
}
#line 2130 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/CHi_Hub_VGCLD_driver.c"
void DrawRoundButton(TButton_Round *Around_button) {

 if (Around_button->Visible == 1) {
 if (object_pressed == 1) {
 object_pressed = 0;
 T6963C_Rectangle_Round_Edges(Around_button->Left - 1, Around_button->Top - 1,
 Around_button->Left + Around_button->Width,
 Around_button->Top + Around_button->Height, Around_button->Corner_Radius,  0b1000 );
 T6963C_Rectangle_Round_Edges(Around_button->Left, Around_button->Top,
 Around_button->Left + Around_button->Width - 1,
 Around_button->Top + Around_button->Height - 1, Around_button->Corner_Radius,  0 );
 T6963C_Rectangle_Round_Edges_Fill(Around_button->Left + 1, Around_button->Top + 1,
 Around_button->Left + Around_button->Width - 2,
 Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius,  0b1000 );
 }
 else {
 T6963C_Rectangle_Round_Edges(Around_button->Left - 1, Around_button->Top - 1,
 Around_button->Left + Around_button->Width,
 Around_button->Top + Around_button->Height, Around_button->Corner_Radius,  0 );
 T6963C_Rectangle_Round_Edges_Fill(Around_button->Left, Around_button->Top,
 Around_button->Left + Around_button->Width - 1,
 Around_button->Top + Around_button->Height - 1, Around_button->Corner_Radius,  0b1000 );
 if ((Around_button->Width >= 5) && (Around_button->Height >= 5)) {
 T6963C_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
 Around_button->Left + Around_button->Width - 2,
 Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius,  0 );
 }
 }
 T6963C_Set_Font_Adv(Around_button->FontName,  0 , _T6963C_HORIZONTAL);
 T6963C_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
 if (Around_button->TextAlign == _taLeft)
 T6963C_Write_Text_Adv(Around_button->Caption, Around_button->Left + 3, (Around_button->Top + ((Around_button->Height - T6963C_caption_height) / 2)));
 else if (Around_button->TextAlign == _taCenter)
 T6963C_Write_Text_Adv(Around_button->Caption, (Around_button->Left + (Around_button->Width - T6963C_caption_length) / 2), (Around_button->Top + ((Around_button->Height - T6963C_caption_height) / 2)));
 else if (Around_button->TextAlign == _taRight)
 T6963C_Write_Text_Adv(Around_button->Caption, Around_button->Left + (Around_button->Width - T6963C_caption_length - 4), (Around_button->Top + ((Around_button->Height - T6963C_caption_height) / 2)));
 }
}

void DrawCRoundButton(TCButton_Round *Around_button) {

 if (Around_button->Visible == 1) {
 if (object_pressed == 1) {
 object_pressed = 0;
 T6963C_Rectangle_Round_Edges(Around_button->Left - 1, Around_button->Top - 1,
 Around_button->Left + Around_button->Width,
 Around_button->Top + Around_button->Height, Around_button->Corner_Radius,  0b1000 );
 T6963C_Rectangle_Round_Edges(Around_button->Left, Around_button->Top,
 Around_button->Left + Around_button->Width - 1,
 Around_button->Top + Around_button->Height - 1, Around_button->Corner_Radius,  0 );
 T6963C_Rectangle_Round_Edges_Fill(Around_button->Left + 1, Around_button->Top + 1,
 Around_button->Left + Around_button->Width - 2,
 Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius,  0b1000 );
 }
 else {
 T6963C_Rectangle_Round_Edges(Around_button->Left - 1, Around_button->Top - 1,
 Around_button->Left + Around_button->Width,
 Around_button->Top + Around_button->Height, Around_button->Corner_Radius,  0 );
 T6963C_Rectangle_Round_Edges_Fill(Around_button->Left, Around_button->Top,
 Around_button->Left + Around_button->Width - 1,
 Around_button->Top + Around_button->Height - 1, Around_button->Corner_Radius,  0b1000 );
 if ((Around_button->Width >= 5) && (Around_button->Height >= 5)) {
 T6963C_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
 Around_button->Left + Around_button->Width - 2,
 Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius,  0 );
 }
 }
 T6963C_Set_Font_Adv(Around_button->FontName,  0 , _T6963C_HORIZONTAL);
 T6963C_Write_Const_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
 if (Around_button->TextAlign == _taLeft)
 T6963C_Write_Const_Text_Adv(Around_button->Caption, Around_button->Left + 3, (Around_button->Top + ((Around_button->Height - T6963C_caption_height) / 2)));
 else if (Around_button->TextAlign == _taCenter)
 T6963C_Write_Const_Text_Adv(Around_button->Caption, (Around_button->Left + (Around_button->Width - T6963C_caption_length) / 2), (Around_button->Top + ((Around_button->Height - T6963C_caption_height) / 2)));
 else if (Around_button->TextAlign == _taRight)
 T6963C_Write_Const_Text_Adv(Around_button->Caption, Around_button->Left + (Around_button->Width - T6963C_caption_length - 4), (Around_button->Top + ((Around_button->Height - T6963C_caption_height) / 2)));
 }
}

void DrawLabel(TLabel *ALabel) {
 if (ALabel->Visible == 1) {
 T6963C_Set_Font_Adv(ALabel->FontName, ALabel->Font_Color, _T6963C_HORIZONTAL);
 T6963C_Write_Text_Adv(ALabel->Caption, ALabel->Left, ALabel->Top);
 }
}

void DrawCLabel(TCLabel *ALabel) {
 if (ALabel->Visible == 1) {
 T6963C_Set_Font_Adv(ALabel->FontName, ALabel->Font_Color, _T6963C_HORIZONTAL);
 T6963C_Write_Const_Text_Adv(ALabel->Caption, ALabel->Left, ALabel->Top);
 }
}

void DrawImage(TImage *AImage) {
 if (AImage->Visible == 1) {
 T6963C_PartialImage(AImage->Left, AImage->Top, AImage->Width,
 AImage->Height, AImage->PictureWidth, AImage->PictureHeight,
 AImage->Picture_Name);
 }
}

void DrawCImage(TCImage *AImage) {
 if (AImage->Visible == 1) {
 T6963C_PartialImage(AImage->Left, AImage->Top, AImage->Width,
 AImage->Height, AImage->PictureWidth, AImage->PictureHeight,
 AImage->Picture_Name);
 }
}

void DrawBox(TBox *ABox) {
 if (ABox->Visible == 1) {
 if (ABox->Transparent == 1) {
 T6963C_rectangle(ABox->Left, ABox->Top,
 ABox->Left + ABox->Width - 1,
 ABox->Top + ABox->Height - 1,  0b1000 );
 }
 else {
 T6963C_box(ABox->Left, ABox->Top,
 ABox->Left + ABox->Width - 1,
 ABox->Top + ABox->Height - 1,  0b1000 );
 }
 }
}

void DrawScreen(TScreen *aScreen) {
 int order;
 unsigned short round_button_idx;
 TButton_Round *local_round_button;
 unsigned short round_cbutton_idx;
 TCButton_Round *local_round_cbutton;
 unsigned short label_idx;
 TLabel *local_label;
 unsigned short clabel_idx;
 TCLabel *local_clabel;
 unsigned short image_idx;
 TImage *local_image;
 unsigned short cimage_idx;
 TCImage *local_cimage;
 unsigned short box_idx;
 TBox *local_box;

 object_pressed = 0;
 order = 0;
 round_button_idx = 0;
 round_cbutton_idx = 0;
 label_idx = 0;
 clabel_idx = 0;
 image_idx = 0;
 cimage_idx = 0;
 box_idx = 0;
 CurrentScreen = aScreen;

  T6963C_fill(0, 0, T6963C_grMemSize) ;
  T6963C_fill(0, T6963C_grMemSize, T6963C_txtMemSize) ;

 while (order < CurrentScreen->ObjectsCount) {
 if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
 local_round_button =  CurrentScreen->Buttons_Round[round_button_idx] ;
 if (order == local_round_button->Order) {
 order++;
 round_button_idx++;
 DrawRoundButton(local_round_button);
 }
 }

 if (round_cbutton_idx < CurrentScreen->CButtons_RoundCount) {
 local_round_cbutton =  CurrentScreen->CButtons_Round[round_cbutton_idx] ;
 if (order == local_round_cbutton->Order) {
 order++;
 round_cbutton_idx++;
 DrawCRoundButton(local_round_cbutton);
 }
 }

 if (label_idx < CurrentScreen->LabelsCount) {
 local_label =  CurrentScreen->Labels[label_idx] ;
 if (order == local_label->Order) {
 label_idx++;
 order++;
 DrawLabel(local_label);
 }
 }

 if (clabel_idx < CurrentScreen->CLabelsCount) {
 local_clabel =  CurrentScreen->CLabels[clabel_idx] ;
 if (order == local_clabel->Order) {
 clabel_idx++;
 order++;
 DrawCLabel(local_clabel);
 }
 }

 if (box_idx < CurrentScreen->BoxesCount) {
 local_box =  CurrentScreen->Boxes[box_idx] ;
 if (order == local_box->Order) {
 box_idx++;
 order++;
 DrawBox(local_box);
 }
 }

 if (image_idx < CurrentScreen->ImagesCount) {
 local_image =  CurrentScreen->Images[image_idx] ;
 if (order == local_image->Order) {
 image_idx++;
 order++;
 DrawImage(local_image);
 }
 }

 if (cimage_idx < CurrentScreen->CImagesCount) {
 local_cimage =  CurrentScreen->CImages[cimage_idx] ;
 if (order == local_cimage->Order) {
 cimage_idx++;
 order++;
 DrawCImage(local_cimage);
 }
 }

 }
}

void Get_Object(unsigned int X, unsigned int Y) {
 round_button_order = -1;
 round_cbutton_order = -1;
 label_order = -1;
 clabel_order = -1;
 image_order = -1;
 cimage_order = -1;
 box_order = -1;

 for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
 local_round_button =  CurrentScreen->Buttons_Round[_object_count] ;
 if (local_round_button->Active == 1) {
 if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
 local_round_button->Width, local_round_button->Height) == 1) {
 round_button_order = local_round_button->Order;
 exec_round_button = local_round_button;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->CButtons_RoundCount ; _object_count++ ) {
 local_round_cbutton =  CurrentScreen->CButtons_Round[_object_count] ;
 if (local_round_cbutton->Active == 1) {
 if (IsInsideObject(X, Y, local_round_cbutton->Left, local_round_cbutton->Top,
 local_round_cbutton->Width, local_round_cbutton->Height) == 1) {
 round_cbutton_order = local_round_cbutton->Order;
 exec_round_cbutton = local_round_cbutton;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
 local_label =  CurrentScreen->Labels[_object_count] ;
 if (local_label->Active == 1) {
 if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
 local_label->Width, local_label->Height) == 1) {
 label_order = local_label->Order;
 exec_label = local_label;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->CLabelsCount ; _object_count++ ) {
 local_clabel =  CurrentScreen->CLabels[_object_count] ;
 if (local_clabel->Active == 1) {
 if (IsInsideObject(X, Y, local_clabel->Left, local_clabel->Top,
 local_clabel->Width, local_clabel->Height) == 1) {
 clabel_order = local_clabel->Order;
 exec_clabel = local_clabel;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
 local_image =  CurrentScreen->Images[_object_count] ;
 if (local_image->Active == 1) {
 if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
 local_image->Width, local_image->Height) == 1) {
 image_order = local_image->Order;
 exec_image = local_image;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->CImagesCount ; _object_count++ ) {
 local_cimage =  CurrentScreen->CImages[_object_count] ;
 if (local_cimage->Active == 1) {
 if (IsInsideObject(X, Y, local_cimage->Left, local_cimage->Top,
 local_cimage->Width, local_cimage->Height) == 1) {
 cimage_order = local_cimage->Order;
 exec_cimage = local_cimage;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
 local_box =  CurrentScreen->Boxes[_object_count] ;
 if (local_box->Active == 1) {
 if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
 local_box->Width, local_box->Height) == 1) {
 box_order = local_box->Order;
 exec_box = local_box;
 }
 }
 }

 _object_count = -1;
 if (round_button_order > _object_count)
 _object_count = round_button_order;
 if (round_cbutton_order > _object_count )
 _object_count = round_cbutton_order;
 if (label_order > _object_count )
 _object_count = label_order;
 if (clabel_order > _object_count )
 _object_count = clabel_order;
 if (image_order > _object_count )
 _object_count = image_order;
 if (cimage_order > _object_count )
 _object_count = cimage_order;
 if (box_order > _object_count )
 _object_count = box_order;
}


static void Process_TP_Press(unsigned int X, unsigned int Y) {
 exec_round_button = 0;
 exec_round_cbutton = 0;
 exec_label = 0;
 exec_clabel = 0;
 exec_image = 0;
 exec_cimage = 0;
 exec_box = 0;

 Get_Object(X, Y);


 if (_object_count != -1) {
 if (_object_count == round_button_order) {
 if (exec_round_button->Active == 1) {
 if (exec_round_button->OnPressPtr != 0) {
 exec_round_button->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == round_cbutton_order) {
 if (exec_round_cbutton->Active == 1) {
 if (exec_round_cbutton->OnPressPtr != 0) {
 exec_round_cbutton->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active == 1) {
 if (exec_label->OnPressPtr != 0) {
 exec_label->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == clabel_order) {
 if (exec_clabel->Active == 1) {
 if (exec_clabel->OnPressPtr != 0) {
 exec_clabel->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == image_order) {
 if (exec_image->Active == 1) {
 if (exec_image->OnPressPtr != 0) {
 exec_image->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == cimage_order) {
 if (exec_cimage->Active == 1) {
 if (exec_cimage->OnPressPtr != 0) {
 exec_cimage->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == box_order) {
 if (exec_box->Active == 1) {
 if (exec_box->OnPressPtr != 0) {
 exec_box->OnPressPtr();
 return;
 }
 }
 }

 }
}

static void Process_TP_Up(unsigned int X, unsigned int Y) {

 switch (PressedObjectType) {

 case 1: {
 if (PressedObject != 0) {
 exec_round_button = (TButton_Round*)PressedObject;
 if ((exec_round_button->PressColEnabled == 1) && (exec_round_button->OwnerScreen == CurrentScreen)) {
 DrawRoundButton(exec_round_button);
 }
 break;
 }
 break;
 }

 case 9: {
 if (PressedObject != 0) {
 exec_round_cbutton = (TCButton_Round*)PressedObject;
 if ((exec_round_cbutton->PressColEnabled == 1) && (exec_round_cbutton->OwnerScreen == CurrentScreen)) {
 DrawCRoundButton(exec_round_cbutton);
 }
 break;
 }
 break;
 }

 case 6: {
 if (PressedObject != 0) {
 exec_box = (TBox*)PressedObject;
 }
 break;
 }
 }

 exec_label = 0;
 exec_clabel = 0;
 exec_image = 0;
 exec_cimage = 0;

 Get_Object(X, Y);


 if (_object_count != -1) {

 if (_object_count == round_button_order) {
 if (exec_round_button->Active == 1) {
 if (exec_round_button->OnUpPtr != 0)
 exec_round_button->OnUpPtr();
 if (PressedObject == (TPointer)exec_round_button)
 if (exec_round_button->OnClickPtr != 0)
 exec_round_button->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == round_cbutton_order) {
 if (exec_round_cbutton->Active == 1) {
 if (exec_round_cbutton->OnUpPtr != 0)
 exec_round_cbutton->OnUpPtr();
 if (PressedObject == (TPointer)exec_round_cbutton)
 if (exec_round_cbutton->OnClickPtr != 0)
 exec_round_cbutton->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == label_order) {
 if (exec_label->Active == 1) {
 if (exec_label->OnUpPtr != 0)
 exec_label->OnUpPtr();
 if (PressedObject == (TPointer)exec_label)
 if (exec_label->OnClickPtr != 0)
 exec_label->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == clabel_order) {
 if (exec_clabel->Active == 1) {
 if (exec_clabel->OnUpPtr != 0)
 exec_clabel->OnUpPtr();
 if (PressedObject == (TPointer)exec_clabel)
 if (exec_clabel->OnClickPtr != 0)
 exec_clabel->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == image_order) {
 if (exec_image->Active == 1) {
 if (exec_image->OnUpPtr != 0)
 exec_image->OnUpPtr();
 if (PressedObject == (TPointer)exec_image)
 if (exec_image->OnClickPtr != 0)
 exec_image->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == cimage_order) {
 if (exec_cimage->Active == 1) {
 if (exec_cimage->OnUpPtr != 0)
 exec_cimage->OnUpPtr();
 if (PressedObject == (TPointer)exec_cimage)
 if (exec_cimage->OnClickPtr != 0)
 exec_cimage->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == box_order) {
 if (exec_box->Active == 1) {
 if (exec_box->OnUpPtr != 0)
 exec_box->OnUpPtr();
 if (PressedObject == (TPointer)exec_box)
 if (exec_box->OnClickPtr != 0)
 exec_box->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }

 }
 PressedObject = 0;
 PressedObjectType = -1;
}

static void Process_TP_Down(unsigned int X, unsigned int Y) {

 object_pressed = 0;
 exec_round_button = 0;
 exec_round_cbutton = 0;
 exec_label = 0;
 exec_clabel = 0;
 exec_image = 0;
 exec_cimage = 0;
 exec_box = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
 if (_object_count == round_button_order) {
 if (exec_round_button->Active == 1) {
 if (exec_round_button->PressColEnabled == 1) {
 object_pressed = 1;
 DrawRoundButton(exec_round_button);
 }
 PressedObject = (TPointer)exec_round_button;
 PressedObjectType = 1;
 if (exec_round_button->OnDownPtr != 0) {
 exec_round_button->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == round_cbutton_order) {
 if (exec_round_cbutton->Active == 1) {
 if (exec_round_cbutton->PressColEnabled == 1) {
 object_pressed = 1;
 DrawCRoundButton(exec_round_cbutton);
 }
 PressedObject = (TPointer)exec_round_cbutton;
 PressedObjectType = 9;
 if (exec_round_cbutton->OnDownPtr != 0) {
 exec_round_cbutton->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active == 1) {
 PressedObject = (TPointer)exec_label;
 PressedObjectType = 2;
 if (exec_label->OnDownPtr != 0) {
 exec_label->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == clabel_order) {
 if (exec_clabel->Active == 1) {
 PressedObject = (TPointer)exec_clabel;
 PressedObjectType = 10;
 if (exec_clabel->OnDownPtr != 0) {
 exec_clabel->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == image_order) {
 if (exec_image->Active == 1) {
 PressedObject = (TPointer)exec_image;
 PressedObjectType = 3;
 if (exec_image->OnDownPtr != 0) {
 exec_image->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == cimage_order) {
 if (exec_cimage->Active == 1) {
 PressedObject = (TPointer)exec_cimage;
 PressedObjectType = 11;
 if (exec_cimage->OnDownPtr != 0) {
 exec_cimage->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == box_order) {
 if (exec_box->Active == 1) {
 PressedObject = (TPointer)exec_box;
 PressedObjectType = 6;
 if (exec_box->OnDownPtr != 0) {
 exec_box->OnDownPtr();
 return;
 }
 }
 }

 }
}

void Check_TP() {
 if (TP_Press_Detect()) {

 if (TP_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
 time_out_tmr=0;
 Process_TP_Press(Xcoord, Ycoord);
 if (PenDown == 0) {
 PenDown = 1;
 Process_TP_Down(Xcoord, Ycoord);
 }
 }
 }
 else if (PenDown == 1) {
 PenDown = 0;
 Process_TP_Up(Xcoord, Ycoord);
 }
}

void Init_MCU() {
 ANCON0 = 0;
 ANCON1 = 0;
 ANCON2 = 0;
 BacklightRed_Direction = 0;
 BacklightGreen_Direction = 0;
 BacklightBlue_Direction = 0;
 BacklightRed = 0;
 BacklightGreen = 0;
 BacklightBlue = 0;
}

void Start_TP() {
 Init_MCU();

 InitializeTouchPanel();


 TP_Set_Calibration_Consts(205, 3850, 385, 3650);

 InitializeObjects();
 DrawScreen(&ScreenWelcome);
}
