#include "global_defs.h"
#include "RF_registers.h"
#include "RF_ReadWrite_Routines.h"
#include "RF_Reset_Routines.h"
#include "RF_Misc_Routines.h"

extern sfr sbit CS_Direction;       // CS pin direction
extern sfr sbit RST_Direction;      // RST pin direction
extern sfr sbit INT_Direction;      // INT pin direction
extern sfr sbit WAKE_Direction;     // WAKE pin direction
extern short int ADDRESS_short_1[], ADDRESS_short_2[], ADDRESS_long_1[], ADDRESS_long_2[], PAN_ID_1[], PAN_ID_2[];
extern short int Dest_Address_short[], My_Address_short[];  // Destination , My short Addressses
extern short int LQI, RSSI2, SEQ_NUMBER, lost_data;
extern int address_RX_FIFO, address_TX_normal_FIFO;
extern short int DATA_TX[];

 extern union params_t EEParams;    // EE Parameters used in init

void RF_Initialize() {
  short int i = 0;
  //variable initialization
  LQI = 0;
  RSSI2 = 0;
  SEQ_NUMBER = 0xF0;      // Was 0x23 Mike
  lost_data = 0;
  address_RX_FIFO = 0x300;
  address_TX_normal_FIFO = 0;

 // for (i = 0; i < 2; i++) {
 //   ADDRESS_short_1[i] = 1;
 //   ADDRESS_short_2[i] = 2;
 //   PAN_ID_1[i] = 3;
 //   PAN_ID_2[i] = 3;
 // }

//  for (i = 0; i < 8; i++) {
//    ADDRESS_long_1[i] = 1;
//    ADDRESS_long_2[i] = 2;
//  }

  // Stuff I added for testing
  PAN_ID_1[0] = 0xAA;  // These are my PAN ID - Hubs use AA55 for PANID
  PAN_ID_1[1] = 0x55;
  PAN_ID_2[0] = 0x12;  // These are Destination PAN ID
  PAN_ID_2[1] = 0x34;
  
  // Broadcast PAN
  PAN_ID_2[0] = 0xFF;  // These are Destination PAN ID
  PAN_ID_2[1] = 0xFF;

  // Now set Source Address   - in Microchip memory, lower address is lower byte in int, etc - Little Endian format
  for(i=0; i<8; i++)
  {
      ADDRESS_long_1[i] = EEParams.HubParams.MyLongAddress[i];     // LSB of address
  }

 // ADDRESS_long_1[0] = 0x21;     // LSB of address
 // ADDRESS_long_1[1] = 0x43;
 // ADDRESS_long_1[2] = 0x65;
 // ADDRESS_long_1[3] = 0x10;    // 10 identifies this as a hub device
 // ADDRESS_long_1[4] = 0x11;   // the following 4 bytes are fixed and identify us as a CHi device
 // ADDRESS_long_1[5] = 0x55;
 // ADDRESS_long_1[6] = 0xAA;
 // ADDRESS_long_1[7] = 0x01;
  
  Dest_Address_short[0] = 'C';   // 'Chair'
  Dest_Address_short[1] = 'H';
  My_Address_short[0] = 'H';     // 'Hub'
  My_Address_short[1] = 'B';
  
  
  ANCON0 = 0;            // Configure ports as digital I/O
  ANCON1 = 0;
  ANCON2 = 0;
  GIE_bit = 0;           // Disable interrupts

  //TRISA = 0x00;          // Set direction to be output
  //TRISB = 0x00;          // Set direction to be output
  //TRISC = 0x00;          // Set direction to be output
  //TRISD = 0x00;          // Set direction to be output

  CS_Direction = 0;      // Set direction to be output
  RST_Direction  = 0;    // Set direction to be output
  INT_Direction  = 1;    // Set direction to be input
  WAKE_Direction = 0;    // Set direction to be output

  DATA_TX[0] = 0;        // Initialize first byte

  //PORTD = 0;             // Clear PORTD register
  //LATD  = 0;             // Clear LATD register

  Delay_ms(5);

  // Initialize SPI module
  SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
  pin_reset();                              // Activate reset from pin
  software_reset();                         // Activate software reset
  RF_reset();                               // RF reset
  set_WAKE_from_pin();                      // Set wake from pin

  set_long_address(ADDRESS_long_1);         // Set long address
  set_short_address(ADDRESS_short_1);       // Set short address
  set_PAN_ID(PAN_ID_1);                     // Set PAN_ID

  init_ZIGBEE_nonbeacon();                  // Initialize ZigBee module
  nonbeacon_PAN_coordinator_device();
  set_TX_power(31);                         // Set max TX power
  set_frame_format_filter(1);               // 1 all frames, 3 data frame only
  set_reception_mode(1);                    // 1 normal mode

  pin_wake();                               // Wake from pin
}