#include "__T6963C.h"
enum GlcdColor {_clClear, _clDraw, _clInvert};
typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;

typedef struct Screen TScreen;

typedef struct  Button_Round {
  TScreen*  OwnerScreen;
  char          Order;
  char          Left;
  char          Top;
  char          Width;
  char          Height;
  char          Visible;
  char          Active;
  char          *Caption;
  TTextAlign    TextAlign;
  const char    *FontName;
  char          Corner_Radius;
  char          PressColEnabled;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TButton_Round;

typedef const struct  CButton_Round {
  TScreen*  OwnerScreen;
  char          Order;
  char          Left;
  char          Top;
  char          Width;
  char          Height;
  char          Visible;
  char          Active;
  const char          *Caption;
  TTextAlign    TextAlign;
  const char    *FontName;
  char          Corner_Radius;
  char          PressColEnabled;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TCButton_Round;

typedef struct  Label {
  TScreen*  OwnerScreen;
  char          Order;
  char          Left;
  char          Top;
  char          Width;
  char          Height;
  char          *Caption;
  const char    *FontName;
  unsigned char Font_Color;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TLabel;

typedef const struct  CLabel {
  TScreen*  OwnerScreen;
  char          Order;
  char          Left;
  char          Top;
  char          Width;
  char          Height;
  const char          *Caption;
  const char    *FontName;
  unsigned char Font_Color;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TCLabel;

typedef struct  Image {
  TScreen*  OwnerScreen;
  char          Order;
  char          Left;
  char          Top;
  char          Width;
  char          Height;
  char          PictureWidth;
  char          PictureHeight;
  const char    *Picture_Name;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TImage;

typedef const struct  CImage {
  TScreen*  OwnerScreen;
  char          Order;
  char          Left;
  char          Top;
  char          Width;
  char          Height;
  char          PictureWidth;
  char          PictureHeight;
  const char    *Picture_Name;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TCImage;

typedef struct  Box {
  TScreen*  OwnerScreen;
  char          Order;
  char          Left;
  char          Top;
  char          Width;
  char          Height;
  char          Visible;
  char          Active;
  char          Transparent;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TBox;

struct Screen {
  unsigned short         ObjectsCount;
  unsigned int           Buttons_RoundCount;
  TButton_Round          * const code *Buttons_Round;
  unsigned int           CButtons_RoundCount;
  TCButton_Round          * const code *CButtons_Round;
  unsigned int           LabelsCount;
  TLabel                 * const code *Labels;
  unsigned int           CLabelsCount;
  TCLabel                 * const code *CLabels;
  unsigned int           ImagesCount;
  TImage                 * const code *Images;
  unsigned int           CImagesCount;
  TCImage                 * const code *CImages;
  unsigned int           BoxesCount;
  TBox                   * const code *Boxes;
};

extern   TScreen                ScreenWelcome;
extern   TImage               CHiLogo;
extern   TCLabel          lRevNo;
extern   TCLabel                 * const code Screen1_CLabels[1];
extern   TImage                 * const code Screen1_Images[1];


extern   TScreen                ScreenMain;
extern   TCImage               SmallChairLogo;
extern   TCImage               bClean;
extern   TCImage               bHome;
extern   TCLabel          lHome;
extern   TCLabel          lClean;
extern   TCImage               bFootRestOpen;
extern   TCLabel          lFootReset;
extern   TCLabel          lOpen;
extern   TCLabel                 * const code Screen2_CLabels[4];
extern   TCImage                 * const code Screen2_CImages[4];


extern   TScreen                ScreenPW;
extern   TBox                   PwRect;
extern   TButton_Round          bPWEnter;
extern   TButton_Round          bNum1;
extern   TButton_Round          bNum4;
extern   TButton_Round          bNum7;
extern   TButton_Round          bNum2;
extern   TButton_Round          bNum5;
extern   TButton_Round          bNum8;
extern   TButton_Round          bNum0;
extern   TButton_Round          bNum3;
extern   TButton_Round          bNum6;
extern   TButton_Round          bNum9;
extern   TButton_Round          bPWCancel;
extern   TCLabel          lEnterPassword;
extern   TLabel                 lPWLabel;
extern   TButton_Round          * const code Screen3_Buttons_Round[12];
extern   TLabel                 * const code Screen3_Labels[1];
extern   TCLabel                 * const code Screen3_CLabels[1];
extern   TBox                   * const code Screen3_Boxes[1];


extern   TScreen                ScreenAdmin1;
extern   TBox                   Box1;
extern   TButton_Round          bAdminReturn;
extern   TButton_Round          bChangePW;
extern   TButton_Round          bSetReclineLimit;
extern   TButton_Round          bBindFlash;
extern   TButton_Round          bBindNoFlash;
extern   TButton_Round          bDimLevel;
extern   TButton_Round          bChairDim;
extern   TButton_Round          bNext2Admin2;
extern   TButton_Round          * const code Screen4_Buttons_Round[8];
extern   TBox                   * const code Screen4_Boxes[1];


extern   TScreen                ScreenSetRecline;
extern   TCLabel          lReclineIinst1;
extern   TCLabel          lReclineIinst2;
extern   TCLabel          lReclineIinst3;
extern   TCLabel          lReclineIinst4;
extern   TCLabel          lReclineIinst5;
extern   TCLabel          lReclineIinst6;
extern   TCLabel          lReclineIinst7;
extern   TButton_Round          bSendReclineLimitCmd;
extern   TButton_Round          bReclineBack;
extern   TButton_Round          * const code Screen5_Buttons_Round[2];
extern   TCLabel                 * const code Screen5_CLabels[7];


extern   TScreen                ScreenChangePW;
extern   TBox                   ChPwRect;
extern   TButton_Round          bChPw;
extern   TButton_Round          bNum1Ch;
extern   TButton_Round          bNum4Ch;
extern   TButton_Round          bNum7Ch;
extern   TButton_Round          bNum2Ch;
extern   TButton_Round          bNum5Ch;
extern   TButton_Round          bNum8Ch;
extern   TButton_Round          bNum0Ch;
extern   TButton_Round          bNum3Ch;
extern   TButton_Round          bNum6Ch;
extern   TButton_Round          bNum9Ch;
extern   TButton_Round          bChPWCancel;
extern   TCLabel          lChPw1;
extern   TCLabel          lChPw2;
extern   TLabel                 lChPWLabel;
extern   TButton_Round          * const code Screen6_Buttons_Round[12];
extern   TLabel                 * const code Screen6_Labels[1];
extern   TCLabel                 * const code Screen6_CLabels[2];
extern   TBox                   * const code Screen6_Boxes[1];


extern   TScreen                ScreenTPDimLevel;
extern   TCButton_Round          bDimOff;
extern   TCLabel          lDimInstruct1;
extern   TCButton_Round          bDimLow;
extern   TCButton_Round          bDimHigh;
extern   TCButton_Round          bDimMed;
extern   TCButton_Round          bDimBack;
extern   TCLabel          Label2;
extern   TCButton_Round          * const code Screen7_CButtons_Round[5];
extern   TCLabel                 * const code Screen7_CLabels[2];


extern   TScreen                ScreenChDimLevel;
extern   TCButton_Round          bDimBackOff;
extern   TCLabel          lDimCh1;
extern   TCLabel          lDimCh2;
extern   TCButton_Round          bDimBack1;
extern   TCButton_Round          bDimBack2;
extern   TCButton_Round          bDimBack3;
extern   TCButton_Round          bDimBack4;
extern   TCButton_Round          bDimBack5;
extern   TCButton_Round          bDimBack6;
extern   TCButton_Round          bDimBackMax;
extern   TCLabel          Label5;
extern   TButton_Round          bDimChBack;
extern   TButton_Round          * const code Screen8_Buttons_Round[1];
extern   TCButton_Round          * const code Screen8_CButtons_Round[8];
extern   TCLabel                 * const code Screen8_CLabels[3];


extern   TScreen                ScreenAdmin2;
extern   TButton_Round          bAdminReturn2;
extern   TButton_Round          bCalTouch;
extern   TButton_Round          bFlashChair;
extern   TButton_Round          bDisplayCals;
extern   TButton_Round          bEnableKidLock;
extern   TButton_Round          bDisableKidLock;
extern   TButton_Round          * const code Screen9_Buttons_Round[6];



/////////////////////////
// Events Code Declarations
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
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
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
/////////////////////////////////

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
