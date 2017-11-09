#line 1 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/interrupt.c"
#line 1 "c:/users/mike/desktop/projects/chi_chair/smartglcd/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/global_defs.h"
#line 59 "c:/users/mike/desktop/projects/chi_chair/smartglcd/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/global_defs.h"
typedef union params_t {
  unsigned char  Params_Array[ 15 ];
 struct
 {
  unsigned char  Backlight_Level;
  unsigned char  MyPanID[2];
  unsigned char  ChairPanID[2];
  unsigned char  MyShortAddress[2];
  unsigned char  MyLongAddress[8];


 } HubParams;
} ;
#line 7 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/interrupt.c"
 void interrupt_low() {

 if (INTCON.TMR0IF) {
 heartbeat_tmr++;
 TMR0L =  170 ;
 TMR0H =  252 ;
 INTCON.TMR0IF = 0;
 }





}
