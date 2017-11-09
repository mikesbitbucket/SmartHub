#line 1 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/Misc_functions.c"
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
#line 1 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/rf_registers.h"
#line 1 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/rf_readwrite_routines.h"
short int read_ZIGBEE_long(int address);
void write_ZIGBEE_long(int address, short int data_r);
short int read_ZIGBEE_short(short int address);
void write_ZIGBEE_short(short int address, short int data_r);
void read_RX_FIFO();
void start_transmit();
void write_TX_normal_FIFO();
void write_TX_normal_FIFO_variable();
#line 1 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/rf_reset_routines.h"
void RF_reset();
void software_reset();
void MAC_reset();
void BB_reset();
void PWR_reset();
void pin_reset();
#line 1 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/rf_misc_routines.h"
void init_ZIGBEE_nonbeacon();
void init_ZIGBEE_basic();
void set_TX_power(unsigned short int power);
void disable_PLL();
void enable_PLL();
void pin_wake();
void set_wake_from_pin();
void set_PAN_ID(short int * address);
void set_PAN_ID(short int * address);
void set_long_address(short int * address);
void set_short_address(short int * address);
void flush_RX_FIFO_pointer();
void set_frame_format_filter(short int fff_mode);
void set_reception_mode(short int r_mode);
void set_IFS_default();
void set_IFS_recomended();
void set_not_encrypt();
void set_encrypt();
void set_not_ACK();
void set_ACK();
void nonbeacon_device();
void nonbeacon_coordinator_device();
void nonbeacon_PAN_coordinator_device();
void set_RSSI_mode(short int RSSI_mode);
void set_CCA_mode(short int CCA_mode);
void set_channel(short int channel_number);
void enable_interrupt();
void send_test_message(unsigned char cmd);
void send_broadcast_message(unsigned char cmd);
#line 1 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/rf_init_routines.h"
void RF_Initialize();
#line 35 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/Misc_functions.c"
extern  unsigned char  g_send_bind_with_flash, g_send_bind_no_flash, g_send_flash;
extern union params_t EEParams;


extern volatile  unsigned int  heartbeat_tmr, open_close_tmr;


extern sfr sbit BacklightBlue;
extern sfr sbit BacklightRed;
extern sfr sbit BacklightGreen;



sbit Buzzer_Direction at TRISJ7_bit;
sbit Buzzer_Out at LATJ7_bit;

void My_Init(void)
{






  CCPR3L  = 64;
 CCPTMRS0 = 0b01000000;
 PR4 = 0xFF;
 CCP3CON = 0b00001111;
 T4CON = 0xFF;
 TMR4IP_bit = 1;
 PSTR3CON = 0b00010001;
#line 80 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/Misc_functions.c"
 T5CON = 0x10;
 TMR5IF_bit = 0;
 TMR5H = 0x15;
 TMR5L = 0xA0;
 TMR5IP_bit = 0;
 TMR5IE_bit = 1;




 Buzzer_Direction = 0;
 Buzzer_Out = 0;





 IPEN_bit = 1;
 GIEH_bit = 1;
 GIEL_bit = 1;


 TP_Set_Calibration_Consts(EEParams.HubParams.TP_Cals[0], EEParams.HubParams.TP_Cals[1], EEParams.HubParams.TP_Cals[2], EEParams.HubParams.TP_Cals[3]);

}

void Display_Cals()
{
 unsigned int tp_xmin, tp_xmax, tp_ymin, tp_ymax;
 char strtemp[20];
 char numstr[7];


  T6963C_fill(0, 0, T6963C_grMemSize) ;
  T6963C_fill(0, T6963C_grMemSize, T6963C_txtMemSize) ;
 T6963C_Set_Font_Adv(T6963C_defaultFont,  0b1000 , _T6963C_HORIZONTAL);
 TP_Get_Calibration_Consts(&tp_xmin, &tp_xmax, &tp_ymin, &tp_ymax);
 IntToStr(tp_xmin, numstr);
 strcpy(strtemp,"X Min: ");
 strcat(strtemp,numstr);
 T6963C_Write_Text_Adv(strtemp, 13, 30);
 IntToStr(tp_xmax, numstr);
 strcpy(strtemp,"X max: ");
 strcat(strtemp,numstr);
 T6963C_Write_Text_Adv(strtemp, 13, 40);
 IntToStr(tp_ymin, numstr);
 strcpy(strtemp,"Y Min: ");
 strcat(strtemp,numstr);
 T6963C_Write_Text_Adv(strtemp, 13, 50);
 IntToStr(tp_ymax, numstr);
 strcpy(strtemp,"Y Max: ");
 strcat(strtemp,numstr);
 T6963C_Write_Text_Adv(strtemp, 13, 60);
}

void Write_Cals(void)
{
 unsigned int tp_xmin, tp_xmax, tp_ymin, tp_ymax;

 TP_Get_Calibration_Consts(&tp_xmin, &tp_xmax, &tp_ymin, &tp_ymax);
 EEParams.HubParams.TP_Cals[0] = tp_xmin;
 EEParams.HubParams.TP_Cals[1] = tp_xmax;
 EEParams.HubParams.TP_Cals[2] = tp_ymin;
 EEParams.HubParams.TP_Cals[3] = tp_ymax;

 Write_params(EEParams.Params_Array);
}




void My_Calibrate_TP() {
 char i;
 unsigned int tp_xmin, tp_xmax, tp_ymin, tp_ymax;
 do{
 i=0;
 BacklightRed = 0;
 BacklightGreen = 0;
  CCPR3L  = 255;
  T6963C_fill(0, 0, T6963C_grMemSize) ;
  T6963C_fill(0, T6963C_grMemSize, T6963C_txtMemSize) ;
 T6963C_Set_Font_Adv(T6963C_defaultFont,  0b1000 , _T6963C_HORIZONTAL);
 T6963C_Write_Text_Adv("CALIBRATION", 80, 60);
 Delay_ms(1000);
  T6963C_fill(0, 0, T6963C_grMemSize) ;
  T6963C_fill(0, T6963C_grMemSize, T6963C_txtMemSize) ;

 T6963C_dot(0,127, 0b1000 );
 T6963C_Write_Text_Adv("TOUCH BOTTOM LEFT", 13, 50);
 TP_Calibrate_Bottom_Left();
 Delay_ms(500);

 T6963C_dot(0,127, 0 );
 T6963C_Set_Font_Adv(T6963C_defaultFont,  0 , _T6963C_HORIZONTAL);
 T6963C_Write_Text_Adv("TOUCH BOTTOM LEFT", 13, 50);
 T6963C_dot(239,0, 0b1000 );
 T6963C_Set_Font_Adv(T6963C_defaultFont,  0b1000 , _T6963C_HORIZONTAL);
 T6963C_Write_Text_Adv("TOUCH UPPER RIGHT", 20, 13);
 TP_Calibrate_Upper_Right();

 Delay_ms(500);
  T6963C_fill(0, 0, T6963C_grMemSize) ;
  T6963C_fill(0, T6963C_grMemSize, T6963C_txtMemSize) ;
 Display_Cals();

 TP_Get_Calibration_Consts(&tp_xmin, &tp_xmax, &tp_ymin, &tp_ymax);
 if((tp_xmin<100) || (tp_xmin>300)) i=1;
 if((tp_xmax<3700) || (tp_xmax>3900)) i=1;
 if((tp_ymin<300) || (tp_ymin>500)) i=1;
 if((tp_ymax<3500) || (tp_ymax>3700)) i=1;
 if(i==1)
 {

 BacklightRed = 0;
 BacklightGreen = 1;
  CCPR3L  = 0;
 Delay_ms(5000);
 }
 else
 {
 Delay_ms(2000);
 }
  T6963C_fill(0, 0, T6963C_grMemSize) ;
  T6963C_fill(0, T6963C_grMemSize, T6963C_txtMemSize) ;

 } while (i == 1);
}


void Read_params(unsigned char *ptr)
{

 unsigned int i;
 for(i=0; i< 28 ; i++)
 {

 *ptr++ = EEPROM_Read( i+ 10  );
 }
}


void Write_params(unsigned char *ptr)
{

 unsigned int i;
 for(i=0; i< 28 ; i++)
 {

 EEPROM_Write( i+ 10 , *ptr++ );
 while(WR_bit);
 }
}

void Toggle_Send_RF_Bind_with_Flash() {

 static  unsigned char  f_send;
 if(0 == f_send)
 {

 f_send = 1;
 g_send_bind_with_flash = 1;

 bSetReclineLimit.Active = 0;
 bChangePW.Active = 0;
 bDimLevel.Active = 0;
 bNext2Admin2.Active = 0;
 bBindNoFlash.Active = 0;
 bChairDim.Active = 0;
 bAdminReturn.Active = 0;

 bSetReclineLimit.Visible = 0;
 bChangePW.Visible = 0;
 bDimLevel.Visible = 0;
 bNext2Admin2.Visible = 0;
 bBindNoFlash.Visible = 0;
 bChairDim.Visible = 0;
 bAdminReturn.Visible = 0;
 bBindFlash.Caption = "Stop Sending";
 DrawScreen(&ScreenAdmin1);


 BacklightRed = 0;
 BacklightGreen = 1;
  CCPR3L  = 0;

 }
 else
 {

 f_send = 0;
 g_send_bind_with_flash = 0;

 bSetReclineLimit.Active = 1;
 bChangePW.Active = 1;
 bDimLevel.Active = 1;
 bNext2Admin2.Active = 1;
 bBindNoFlash.Active = 1;
 bChairDim.Active = 1;
 bAdminReturn.Active = 1;

 bSetReclineLimit.Visible = 1;
 bChangePW.Visible = 1;
 bDimLevel.Visible = 1;
 bNext2Admin2.Visible = 1;
 bBindNoFlash.Visible = 1;
 bChairDim.Visible = 1;
 bAdminReturn.Visible = 1;
 bBindFlash.Caption = "Sync with Flash";
 DrawScreen(&ScreenAdmin1);

 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = EEParams.HubParams.Backlight_Level;
 }
}

void Toggle_Send_RF_Bind_no_Flash() {

 static  unsigned char  f_send;
 if(0 == f_send)
 {

 f_send = 1;
 g_send_bind_no_flash = 1;

 bSetReclineLimit.Active = 0;
 bChangePW.Active = 0;
 bDimLevel.Active = 0;
 bNext2Admin2.Active = 0;
 bBindFlash.Active = 0;
 bChairDim.Active = 0;
 bAdminReturn.Active = 0;

 bSetReclineLimit.Visible = 0;
 bChangePW.Visible = 0;
 bDimLevel.Visible = 0;
 bNext2Admin2.Visible = 0;
 bBindFlash.Visible = 0;
 bChairDim.Visible = 0;
 bAdminReturn.Visible = 0;
 bBindNoFlash.Caption = "Stop Sending";
 DrawScreen(&ScreenAdmin1);


 BacklightRed = 0;
 BacklightGreen = 1;
  CCPR3L  = 0;

 }
 else
 {

 f_send = 0;
 g_send_bind_no_flash = 0;

 bSetReclineLimit.Active = 1;
 bChangePW.Active = 1;
 bDimLevel.Active = 1;
 bNext2Admin2.Active = 1;
 bBindFlash.Active = 1;
 bChairDim.Active = 1;
 bAdminReturn.Active = 1;

 bSetReclineLimit.Visible = 1;
 bChangePW.Visible = 1;
 bDimLevel.Visible = 1;
 bNext2Admin2.Visible = 1;
 bBindFlash.Visible = 1;
 bChairDim.Visible = 1;
 bAdminReturn.Visible = 1;
 bBindNoFlash.Caption = "Sync no Flash";
 DrawScreen(&ScreenAdmin1);

 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = EEParams.HubParams.Backlight_Level;
 }
}

void Send_RF_Broadcast_Cmd_n(char n_times)
{
 static n=0;


 if(n_times == 0)
 {

 if(n != 0)
 {

 n--;
 write_TX_normal_FIFO_variable();
 }
 }
 else
 {

 n = n_times;
 n--;
 heartbeat_tmr = 0;
 write_TX_normal_FIFO_variable();
 }
}

void SendRF_Command_CLOSE_ALL(void)
{


 if(open_close_tmr >  50 )
 {

 send_broadcast_message( 0x03 );
 open_close_tmr = 0;
 }
}

void SendRF_Command_OPEN_ALL(void)
{


 if(open_close_tmr >  50 )
 {

 send_broadcast_message( 0x04 );
 open_close_tmr = 0;
 }
}

void SendRF_Command_OPEN_FOOTREST_ALL(void)
{


 if(open_close_tmr >  50 )
 {

 send_broadcast_message( 0x07 );
 open_close_tmr = 0;
 }
}

void Toggle_Send_Flash() {

 static  unsigned char  f_send;
 if(0 == f_send)
 {

 f_send = 1;
 g_send_flash = 1;

 bCalTouch.Active = 0;
 bAdminReturn2.Active = 0;
 bDisplayCals.Active = 0;
 bEnableKidLock.Active = 0;
 bDisableKidLock.Active = 0;

 bCalTouch.Visible = 0;
 bAdminReturn2.Visible = 0;
 bDisplayCals.Visible =0;
 bEnableKidLock.Visible = 0;
 bDisableKidLock.Visible = 0;
 bFlashChair.Caption = "Stop Sending";
 DrawScreen(&ScreenAdmin2);

 BacklightRed = 0;
 BacklightGreen = 1;
  CCPR3L  = 0;

 }
 else
 {

 f_send = 0;
 g_send_flash = 0;

 bCalTouch.Active = 1;
 bAdminReturn2.Active = 1;
 bDisplayCals.Active=1;
 bEnableKidLock.Active = 1;
 bDisableKidLock.Active = 1;

 bCalTouch.Visible = 1;
 bAdminReturn2.Visible = 1;
 bDisplayCals.Visible =1;
 bEnableKidLock.Visible = 1;
 bDisableKidLock.Visible = 1;
 bFlashChair.Caption = "Flash All Chairs";
 DrawScreen(&ScreenAdmin2);

 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = EEParams.HubParams.Backlight_Level;
 }
}

void Display_Hub_Address()
{



 char strtemp[32];
 char i, num2hex[4];




 strcpy(strtemp,"Hub Addr:  ");
 for(i=8; i>0; i--)
 {


 ByteToHex(EEParams.HubParams.MyLongAddress[i-1], num2hex);
 strcat(strtemp, num2hex);
 }
 T6963C_Write_Text_Adv(strtemp, 13, 90);

}

void Beep()
{

  unsigned char  i;
 for(i=0; i<250; i++)
 {
 Buzzer_Out = 1;
 Delay_us(140);
 Buzzer_Out = 0;
 Delay_us(140);
 }
}
