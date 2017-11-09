#line 1 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_ReadWrite_Routines.c"
#line 1 "c:/users/mike/desktop/projects/chi_chair/smartglcd hub/chi_hub_vgcld_code/chi_hub_vgcld_code/mikroc pro for pic/rf_registers.h"
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
#line 4 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_ReadWrite_Routines.c"
extern sfr sbit CS;
extern sfr sbit CS_Direction;

const unsigned short int DATA_LENGHT = 1;
const unsigned short int HEADER_LENGHT = 17;

int address_RX_FIFO, address_TX_normal_FIFO;
short int data_RX_FIFO[1 + HEADER_LENGHT + DATA_LENGHT + 2 + 1 + 1], lost_data;

short int ADDRESS_short_1[2], ADDRESS_long_1[8];
short int ADDRESS_short_2[2], ADDRESS_long_2[8];
short int Dest_Address_short[2], My_Address_short[2];
short int PAN_ID_1[2];
short int PAN_ID_2[2];
short int DATA_RX[DATA_LENGHT], DATA_TX[DATA_LENGHT], data_TX_normal_FIFO[DATA_LENGHT + HEADER_LENGHT + 12];
char Data_buf[10];
short int LQI, RSSI2, SEQ_NUMBER;
#line 26 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_ReadWrite_Routines.c"
void write_ZIGBEE_short(short int address, short int data_r) {
 CS = 0;

 address = ((address << 1) & 0b01111111) | 0x01;
 SPI1_Write(address);
 SPI1_Write(data_r);

 CS = 1;
}


short int read_ZIGBEE_short(short int address) {
 short int data_r = 0, dummy_data_r = 0;

 CS = 0;

 address = (address << 1) & 0b01111110;
 SPI1_Write(address);
 data_r = SPI1_Read(dummy_data_r);

 CS = 1;
 return data_r;
}
#line 54 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_ReadWrite_Routines.c"
void write_ZIGBEE_long(int address, short int data_r) {
 short int address_high = 0, address_low = 0;

 CS = 0;

 address_high = (((short int)(address >> 3)) & 0b01111111) | 0x80;
 address_low = (((short int)(address << 5)) & 0b11100000) | 0x10;
 SPI1_Write(address_high);
 SPI1_Write(address_low);
 SPI1_Write(data_r);

 CS = 1;
}


short int read_ZIGBEE_long(int address) {
 short int data_r = 0, dummy_data_r = 0;
 short int address_high = 0, address_low = 0;

 CS = 0;

 address_high = ((short int)(address >> 3) & 0b01111111) | 0x80;
 address_low = ((short int)(address << 5) & 0b11100000);
 SPI1_Write(address_high);
 SPI1_Write(address_low);
 data_r = SPI1_Read(dummy_data_r);

 CS = 1;
 return data_r;
}
#line 88 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_ReadWrite_Routines.c"
void start_transmit() {
 short int temp = 0;

 temp = read_ZIGBEE_short( 0x1B );
 temp = temp | 0x01;
 write_ZIGBEE_short( 0x1B , temp);
}
#line 99 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_ReadWrite_Routines.c"
void read_RX_FIFO() {
 unsigned short int temp = 0;
 int i = 0;

 temp = read_ZIGBEE_short( 0x39 );
 temp = temp | 0x04;
 write_ZIGBEE_short( 0x39 , temp);

 for(i=0; i<128; i++) {
 if(i < (1 + DATA_LENGHT + HEADER_LENGHT + 2 + 1 + 1))
 data_RX_FIFO[i] = read_ZIGBEE_long(address_RX_FIFO + i);
 if(i >= (1 + DATA_LENGHT + HEADER_LENGHT + 2 + 1 + 1))
 lost_data = read_ZIGBEE_long(address_RX_FIFO + i);
 }

 DATA_RX[0] = data_RX_FIFO[HEADER_LENGHT + 1];
 DATA_RX[1] = data_RX_FIFO[HEADER_LENGHT + 2];
 DATA_RX[2] = data_RX_FIFO[HEADER_LENGHT + 3];
 LQI = data_RX_FIFO[1 + HEADER_LENGHT + DATA_LENGHT + 2];
 RSSI2 = data_RX_FIFO[1 + HEADER_LENGHT + DATA_LENGHT + 3];

 temp = read_ZIGBEE_short( 0x39 );
 temp = temp & (!0x04);
 write_ZIGBEE_short( 0x39 , temp);
}

void write_TX_normal_FIFO() {
 int i = 0;

 data_TX_normal_FIFO[0] = 17;
 data_TX_normal_FIFO[1] = 18;
 data_TX_normal_FIFO[2] = 0x01;
 data_TX_normal_FIFO[3] = 0xC8;
 data_TX_normal_FIFO[4] = SEQ_NUMBER++;
 data_TX_normal_FIFO[5] = PAN_ID_2[0];
 data_TX_normal_FIFO[6] = PAN_ID_2[1];
 data_TX_normal_FIFO[7] = Dest_Address_short[0];
 data_TX_normal_FIFO[8] = Dest_Address_short[1];
 data_TX_normal_FIFO[9] = PAN_ID_1[0];
 data_TX_normal_FIFO[10] = PAN_ID_1[1];
 data_TX_normal_FIFO[11] = ADDRESS_long_1[0];
 data_TX_normal_FIFO[12] = ADDRESS_long_1[1];
 data_TX_normal_FIFO[13] = ADDRESS_long_1[2];
 data_TX_normal_FIFO[14] = ADDRESS_long_1[3];
 data_TX_normal_FIFO[15] = ADDRESS_long_1[4];
 data_TX_normal_FIFO[16] = ADDRESS_long_1[5];
 data_TX_normal_FIFO[17] = ADDRESS_long_1[6];
 data_TX_normal_FIFO[18] = ADDRESS_long_1[7];


 data_TX_normal_FIFO[19] = DATA_TX[0];
#line 169 "C:/Users/mike/Desktop/Projects/CHi_Chair/SmartGLCD Hub/CHi_Hub_VGCLD_Code/CHi_Hub_VGCLD_Code/mikroC PRO for PIC/RF_ReadWrite_Routines.c"
 for(i = 0; i < (20); i++) {
 write_ZIGBEE_long(address_TX_normal_FIFO + i, data_TX_normal_FIFO[i]);
 }

 set_not_ACK();
 set_not_encrypt();
 start_transmit();
}

void write_TX_normal_FIFO_variable() {
 char i = 0;

 data_TX_normal_FIFO[0] = 17;
 data_TX_normal_FIFO[1] = 17 + Data_buf[0];
 data_TX_normal_FIFO[2] = 0x01;
 data_TX_normal_FIFO[3] = 0xC8;
 data_TX_normal_FIFO[4] = SEQ_NUMBER++;
 data_TX_normal_FIFO[5] = PAN_ID_2[0];
 data_TX_normal_FIFO[6] = PAN_ID_2[1];
 data_TX_normal_FIFO[7] = Dest_Address_short[0];
 data_TX_normal_FIFO[8] = Dest_Address_short[1];
 data_TX_normal_FIFO[9] = PAN_ID_1[0];
 data_TX_normal_FIFO[10] = PAN_ID_1[1];
 data_TX_normal_FIFO[11] = ADDRESS_long_1[0];
 data_TX_normal_FIFO[12] = ADDRESS_long_1[1];
 data_TX_normal_FIFO[13] = ADDRESS_long_1[2];
 data_TX_normal_FIFO[14] = ADDRESS_long_1[3];
 data_TX_normal_FIFO[15] = ADDRESS_long_1[4];
 data_TX_normal_FIFO[16] = ADDRESS_long_1[5];
 data_TX_normal_FIFO[17] = ADDRESS_long_1[6];
 data_TX_normal_FIFO[18] = ADDRESS_long_1[7];

 for(i=1; i<=Data_buf[0]; i++)
 {
 data_TX_normal_FIFO[18+i] = Data_buf[i];
 }




 for(i = 0; i < (19 + Data_buf[0]); i++) {
 write_ZIGBEE_long(address_TX_normal_FIFO + i, data_TX_normal_FIFO[i]);
 }

 set_not_ACK();
 set_not_encrypt();
 start_transmit();
}
