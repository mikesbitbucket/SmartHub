#line 1 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/CHi_Hub_VGCLD_main.c"
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
#line 90 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/CHi_Hub_VGCLD_main.c"
sbit CS at LATE0_bit;
sbit RST at LATE2_bit;
sbit INT at RB0_bit;
sbit WAKE at LATE7_bit;

sbit CS_Direction at TRISE0_bit;
sbit RST_Direction at TRISE2_bit;
sbit INT_Direction at TRISB0_bit;
sbit WAKE_Direction at TRISE7_bit;

sfr unsigned short volatile TMR0HM absolute 0x0FD7;


extern sfr sbit Buzzer_Direction;
extern sfr sbit Buzzer_Out;


sbit BacklightBlue at LATG0_bit;
sbit BacklightRed at LATC2_bit;
sbit BacklightGreen at LATC1_bit;

unsigned short i,j;
const code char DefaultHubAddress[] = {0x21, 0x43, 0x65, 0x10,0x11, 0x55, 0xAA, 0x01};




const code char DefaultPassword[] =  "1234" ;


 unsigned char  g_send_bind_with_flash=0, g_send_bind_no_flash=0, g_send_flash = 0;
 unsigned char  one_second_tic=0, two_second_tic=0;

extern short int DATA_TX[];
extern char Data_buf[10];

union params_t EEParams;

volatile  unsigned int  heartbeat_tmr, open_close_tmr, time_out_tmr;




 void interrupt_low() {

 if (TMR5IF_bit == 1) {
 heartbeat_tmr++;
 open_close_tmr++;
 time_out_tmr++;
 TMR5ON_bit = 0;
 TMR5H =  0x15 ;
 TMR5L =  0xA0 ;
 TMR5IF_bit = 0;
 TMR5ON_bit = 1;
 }





 GIEL_bit = 1;
}


void main() {

 Start_TP();



 Read_params(EEParams.Params_Array);
 if(EEParams.HubParams.MyLongAddress[6] == 0xAA)
{


}
else
{

 for(i=0; i<8; i++)
 {

 EEParams.HubParams.MyLongAddress[i]=EEPROM_Read(i);
 }
 if(EEParams.HubParams.MyLongAddress[7] == 0xFF)
 {

 for(i=0; i<8; i++)
 {
 EEParams.HubParams.MyLongAddress[i] = DefaultHubAddress[i];

 }
 }
 EEParams.HubParams.Backlight_Level =  240 ;
 EEParams.HubParams.MyPanID[0] =  0xAA ;
 EEParams.HubParams.MyPanID[1] =  0x55 ;
 EEParams.HubParams.MyShortAddress[0] =  0x12 ;
 EEParams.HubParams.MyShortAddress[1] =  0x34 ;


 EEParams.HubParams.TP_Cals[0] = 200;
 EEParams.HubParams.TP_Cals[1] = 3815;
 EEParams.HubParams.TP_Cals[2] = 380;
 EEParams.HubParams.TP_Cals[3] = 3615;


 for(i=0; i<4; i++)
 {
 EEParams.HubParams.Password[i] = 0x31 + i;
 }
 EEParams.HubParams.Password[4] = 0 ;


 Write_params(EEParams.Params_Array);


 for(i=0; i<5; i++)
 {
 for(j=0; j<3; j++)
 {
 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = 255;
 Delay_ms(100);
 BacklightRed = 0;
 Delay_ms(100);
 }
 BacklightRed = 1;
 Delay_ms(250);
 Delay_ms(250);
 }
 BacklightRed = 1;
  CCPR3L  = EEParams.HubParams.Backlight_Level;


}






 DrawScreen(&ScreenWelcome);
 BacklightRed = 1;
 BacklightGreen = 1;
 My_Init();
 RF_Initialize();
  CCPR3L  = EEParams.HubParams.Backlight_Level;






 TMR5ON_bit = 1;
 GIEL_bit = 1;
 GIE_bit = 1;



 for(i=0; i<250; i++)
 {
 Buzzer_Out = 1;
 Delay_us(140);
 Buzzer_Out = 0;
 Delay_us(140);
 }


 while (1) {
 Check_TP();

 if(heartbeat_tmr > 10)
 {

 heartbeat_tmr = 0;


 one_second_tic++;
 two_second_tic++;
 if(one_second_tic >= 10)
 {

 one_second_tic = 0;
 if(g_send_bind_with_flash == 1)
 {
 send_broadcast_message( 0x02 );
 time_out_tmr = 0;
 }
 else if(g_send_bind_no_flash == 1)
 {
 send_broadcast_message( 0x01 );
 time_out_tmr = 0;
 }
 }
 if(two_second_tic >= 20)
 {

 two_second_tic = 0;
 if(g_send_flash == 1)
 {
 send_broadcast_message( 0x09 );
 time_out_tmr = 0;
 }
 }



 Send_RF_Broadcast_Cmd_n(0);

 }


 if(time_out_tmr >  6000 )
 {
 time_out_tmr = 0;
 BacklightRed = 1;
 BacklightGreen = 1;
  CCPR3L  = 0;
 strcpy(lPWLabel_Caption, "      ");
 strcpy(lChPWLabel_Caption, "    ");
 DrawScreen(&ScreenWelcome);
 }
 }

}
