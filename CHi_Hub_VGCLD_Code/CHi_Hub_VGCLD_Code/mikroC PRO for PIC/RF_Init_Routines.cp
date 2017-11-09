#line 1 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Init_Routines.c"
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
#line 7 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Init_Routines.c"
extern sfr sbit CS_Direction;
extern sfr sbit RST_Direction;
extern sfr sbit INT_Direction;
extern sfr sbit WAKE_Direction;
extern short int ADDRESS_short_1[], ADDRESS_short_2[], ADDRESS_long_1[], ADDRESS_long_2[], PAN_ID_1[], PAN_ID_2[];
extern short int Dest_Address_short[], My_Address_short[];
extern short int LQI, RSSI2, SEQ_NUMBER, lost_data;
extern int address_RX_FIFO, address_TX_normal_FIFO;
extern short int DATA_TX[];

 extern union params_t EEParams;

void RF_Initialize() {
 short int i = 0;

 LQI = 0;
 RSSI2 = 0;
 SEQ_NUMBER = 0xF0;
 lost_data = 0;
 address_RX_FIFO = 0x300;
 address_TX_normal_FIFO = 0;
#line 42 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_Init_Routines.c"
 PAN_ID_1[0] = 0xAA;
 PAN_ID_1[1] = 0x55;
 PAN_ID_2[0] = 0x12;
 PAN_ID_2[1] = 0x34;


 PAN_ID_2[0] = 0xFF;
 PAN_ID_2[1] = 0xFF;


 for(i=0; i<8; i++)
 {
 ADDRESS_long_1[i] = EEParams.HubParams.MyLongAddress[i];
 }










 Dest_Address_short[0] = 'C';
 Dest_Address_short[1] = 'H';
 My_Address_short[0] = 'H';
 My_Address_short[1] = 'B';


 ANCON0 = 0;
 ANCON1 = 0;
 ANCON2 = 0;
 GIE_bit = 0;






 CS_Direction = 0;
 RST_Direction = 0;
 INT_Direction = 1;
 WAKE_Direction = 0;

 DATA_TX[0] = 0;




 Delay_ms(5);


 SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
 pin_reset();
 software_reset();
 RF_reset();
 set_WAKE_from_pin();

 set_long_address(ADDRESS_long_1);
 set_short_address(ADDRESS_short_1);
 set_PAN_ID(PAN_ID_1);

 init_ZIGBEE_nonbeacon();
 nonbeacon_PAN_coordinator_device();
 set_TX_power(31);
 set_frame_format_filter(1);
 set_reception_mode(1);

 pin_wake();
}
