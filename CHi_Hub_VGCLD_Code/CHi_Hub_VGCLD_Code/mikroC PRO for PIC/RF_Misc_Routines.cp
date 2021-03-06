#line 1 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
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
#line 6 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
extern sfr sbit WAKE;
extern sfr sbit WAKE_Direction;
extern short int DATA_TX[];
#line 13 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void enable_interrupt() {
 write_ZIGBEE_short( 0x32 , 0x00);
}
#line 20 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void set_channel(short int channel_number) {
 if((channel_number > 26) || (channel_number < 11)) channel_number = 11;
 switch(channel_number) {
 case 11:
 write_ZIGBEE_long( 0x200 , 0x02);
 break;
 case 12:
 write_ZIGBEE_long( 0x200 , 0x12);
 break;
 case 13:
 write_ZIGBEE_long( 0x200 , 0x22);
 break;
 case 14:
 write_ZIGBEE_long( 0x200 , 0x32);
 break;
 case 15:
 write_ZIGBEE_long( 0x200 , 0x42);
 break;
 case 16:
 write_ZIGBEE_long( 0x200 , 0x52);
 break;
 case 17:
 write_ZIGBEE_long( 0x200 , 0x62);
 break;
 case 18:
 write_ZIGBEE_long( 0x200 , 0x72);
 break;
 case 19:
 write_ZIGBEE_long( 0x200 , 0x82);
 break;
 case 20:
 write_ZIGBEE_long( 0x200 , 0x92);
 break;
 case 21:
 write_ZIGBEE_long( 0x200 , 0xA2);
 break;
 case 22:
 write_ZIGBEE_long( 0x200 , 0xB2);
 break;
 case 23:
 write_ZIGBEE_long( 0x200 , 0xC2);
 break;
 case 24:
 write_ZIGBEE_long( 0x200 , 0xD2);
 break;
 case 25:
 write_ZIGBEE_long( 0x200 , 0xE2);
 break;
 case 26:
 write_ZIGBEE_long( 0x200 , 0xF2);
 break;
 }
 RF_reset();
}
#line 78 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void set_CCA_mode(short int CCA_mode) {
 short int temp = 0;
 switch(CCA_mode) {
 case 1: {
 temp = read_ZIGBEE_short( 0x3A );
 temp = temp | 0x80;
 temp = temp & 0xDF;
 write_ZIGBEE_short( 0x3A , temp);
 write_ZIGBEE_short( 0x3F , 0x60);
 }
 break;

 case 2: {
 temp = read_ZIGBEE_short( 0x3A );
 temp = temp | 0x40;
 temp = temp & 0x7F;
 write_ZIGBEE_short( 0x3A , temp);

 temp = read_ZIGBEE_short( 0x3A );
 temp = temp | 0x38;
 temp = temp & 0xFB;
 write_ZIGBEE_short( 0x3A , temp);
 }
 break;

 case 3: {
 temp = read_ZIGBEE_short( 0x3A );
 temp = temp | 0xC0;
 write_ZIGBEE_short( 0x3A , temp);

 temp = read_ZIGBEE_short( 0x3A );
 temp = temp | 0x38;
 temp = temp & 0xFB;
 write_ZIGBEE_short( 0x3A , temp);

 write_ZIGBEE_short( 0x3F , 0x60);
 }
 break;
 }
 }
#line 122 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void set_RSSI_mode(short int RSSI_mode) {
 short int temp = 0;

 switch(RSSI_mode) {
 case 1: {
 temp = read_ZIGBEE_short( 0x3E );
 temp = temp | 0x80;
 write_ZIGBEE_short( 0x3E , temp);
 }
 break;

 case 2:
 write_ZIGBEE_short( 0x3E , 0x40);
 break;
 }
}
#line 142 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void nonbeacon_PAN_coordinator_device() {
 short int temp = 0;

 temp = read_ZIGBEE_short( 0x00 );
 temp = temp | 0x08;
 write_ZIGBEE_short( 0x00 , temp);

 temp = read_ZIGBEE_short( 0x11 );
 temp = temp & 0xDF;
 write_ZIGBEE_short( 0x11 , temp);

 write_ZIGBEE_short( 0x10 , 0xFF);
}

void nonbeacon_coordinator_device() {
 short int temp = 0;

 temp = read_ZIGBEE_short( 0x00 );
 temp = temp | 0x04;
 write_ZIGBEE_short( 0x00 , temp);

 temp = read_ZIGBEE_short( 0x11 );
 temp = temp & 0xDF;
 write_ZIGBEE_short( 0x11 , temp);

 write_ZIGBEE_short( 0x10 , 0xFF);
}

void nonbeacon_device() {
 short int temp = 0;

 temp = read_ZIGBEE_short( 0x00 );
 temp = temp & 0xF3;
 write_ZIGBEE_short( 0x00 , temp);

 temp = read_ZIGBEE_short( 0x11 );
 temp = temp & 0xDF;
 write_ZIGBEE_short( 0x11 , temp);
}
#line 185 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void set_ACK(void){
 short int temp = 0;

 temp = read_ZIGBEE_short( 0x1B );
 temp = temp | 0x04;
 write_ZIGBEE_short( 0x1B , temp);
}

void set_not_ACK(void){
 short int temp = 0;

 temp = read_ZIGBEE_short( 0x1B );
 temp = temp & (!0x04);
 write_ZIGBEE_short( 0x1B , temp);
}
#line 204 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void set_encrypt(void){
 short int temp = 0;

 temp = read_ZIGBEE_short( 0x1B );
 temp = temp | 0x02;
 write_ZIGBEE_short( 0x1B , temp);
}

void set_not_encrypt(void){
 short int temp = 0;

 temp = read_ZIGBEE_short( 0x1B );
 temp = temp & (!0x02);
 write_ZIGBEE_short( 0x1B , temp);
}
#line 223 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void set_IFS_recomended() {
 short int temp = 0;

 write_ZIGBEE_short( 0x00 , 0x93);

 temp = read_ZIGBEE_short( 0x21 );
 temp = temp | 0x7C;
 write_ZIGBEE_short( 0x21 , temp);

 temp = read_ZIGBEE_short( 0x2E );
 temp = temp | 0x90;
 write_ZIGBEE_short( 0x2E , temp);

 temp = read_ZIGBEE_short( 0x27 );
 temp = temp | 0x31;
 write_ZIGBEE_short( 0x27 , temp);
}

void set_IFS_default() {
 short int temp = 0;

 write_ZIGBEE_short( 0x00 , 0x75);

 temp = read_ZIGBEE_short( 0x21 );
 temp = temp | 0x84;
 write_ZIGBEE_short( 0x21 , temp);

 temp = read_ZIGBEE_short( 0x2E );
 temp = temp | 0x50;
 write_ZIGBEE_short( 0x2E , temp);

 temp = read_ZIGBEE_short( 0x27 );
 temp = temp | 0x41;
 write_ZIGBEE_short( 0x27 , temp);
}
#line 262 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void set_reception_mode(short int r_mode) {
 short int temp = 0;

 switch(r_mode) {
 case 1: {
 temp = read_ZIGBEE_short( 0x00 );
 temp = temp & (!0x03);
 write_ZIGBEE_short( 0x00 , temp);
 }
 break;

 case 2: {
 temp = read_ZIGBEE_short( 0x00 );
 temp = temp & (!0x01);
 temp = temp | 0x02;
 write_ZIGBEE_short( 0x00 , temp);
 }
 break;

 case 3: {
 temp = read_ZIGBEE_short( 0x00 );
 temp = temp & (!0x02);
 temp = temp | 0x01;
 write_ZIGBEE_short( 0x00 , temp);
 }
 break;
 }
}
#line 294 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void set_frame_format_filter(short int fff_mode) {
 short int temp = 0;

 switch(fff_mode) {
 case 1: {
 temp = read_ZIGBEE_short( 0x0D );
 temp = temp & (!0x0E);
 write_ZIGBEE_short( 0x0D , temp);
 }
 break;

 case 2: {
 temp = read_ZIGBEE_short( 0x0D );
 temp = temp & (!0x06);
 temp = temp | 0x08;
 write_ZIGBEE_short( 0x0D , temp);
 }
 break;

 case 3: {
 temp = read_ZIGBEE_short( 0x0D );
 temp = temp & (!0x0A);
 temp = temp | 0x04;
 write_ZIGBEE_short( 0x0D , temp);
 }
 break;

 case 4: {
 temp = read_ZIGBEE_short( 0x0D );
 temp = temp & (!0x0C);
 temp = temp | 0x02;
 write_ZIGBEE_short( 0x0D , temp);
 }
 break;
 }
}
#line 334 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void flush_RX_FIFO_pointer() {
 short int temp;

 temp = read_ZIGBEE_short( 0x0D );
 temp = temp | 0x01;
 write_ZIGBEE_short( 0x0D , temp);
}
#line 345 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void set_short_address(short int * address) {
 write_ZIGBEE_short( 0x03 , address[0]);
 write_ZIGBEE_short( 0x04 , address[1]);
}

void set_long_address(short int * address) {
 short int i = 0;

 for(i = 0; i < 8; i++) {
 write_ZIGBEE_short( 0x05  + i, address[i]);
 }
}

void set_PAN_ID(short int * address) {
 write_ZIGBEE_short( 0x01 , address[0]);
 write_ZIGBEE_short( 0x02 , address[1]);
}
#line 366 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void set_wake_from_pin() {
 short int temp = 0;

 WAKE = 0;
 temp = read_ZIGBEE_short( 0x0D );
 temp = temp | 0x60;
 write_ZIGBEE_short( 0x0D , temp);

 temp = read_ZIGBEE_short( 0x22 );
 temp = temp | 0x80;
 write_ZIGBEE_short( 0x22 , temp);
}

void pin_wake() {
 WAKE = 1;
 Delay_ms(5);
}
#line 387 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void enable_PLL() {
 write_ZIGBEE_long( 0x202 , 0x80);
}

void disable_PLL() {
 write_ZIGBEE_long( 0x202 , 0x00);
}
#line 398 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void set_TX_power(unsigned short int power) {
 if((power < 0) || (power > 31))
 power = 31;
 power = 31 - power;
 power = ((power & 0b00011111) << 3) & 0b11111000;
 write_ZIGBEE_long( 0x203 , power);
}
#line 409 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Misc_Routines.c"
void init_ZIGBEE_basic() {
 write_ZIGBEE_short( 0x18 , 0x98);
 write_ZIGBEE_short( 0x2E , 0x95);
 write_ZIGBEE_long( 0x201 , 0x01);
 enable_PLL();
 write_ZIGBEE_long( 0x206 , 0x90);
 write_ZIGBEE_long( 0x207 , 0x80);
 write_ZIGBEE_long( 0x208 , 0x10);
 write_ZIGBEE_long( 0x220 , 0x21);
 write_ZIGBEE_long( 0x22F , 0x0F);
}

void init_ZIGBEE_nonbeacon() {
 init_ZIGBEE_basic();
 set_CCA_mode(1);
 set_RSSI_mode(2);
 enable_interrupt();
 set_channel( 20 );
 RF_reset();
}

void send_test_message( unsigned char  cmd)
{


 DATA_TX[0] = cmd;
 write_TX_normal_FIFO();



}

 void send_broadcast_message( unsigned char  cmd)
{


 DATA_TX[0] = cmd;
 write_TX_normal_FIFO();



}
