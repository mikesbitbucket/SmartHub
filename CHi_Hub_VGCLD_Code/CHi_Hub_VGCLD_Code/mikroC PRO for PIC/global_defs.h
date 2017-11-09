/****************************************************************
* Copyright (c) 2016 Mike Hamerly                               *
****************************************************************/

#ifndef global_defs_h
#define global_defs_h

/****************************************************************
*
*   $Workfile:  $
*   $Revision:  Ver 1.1
*         rev 1.1. Temp constants changed to higher values
*     Project: 
*       $Date:  $
*
*---------------------------------------------------------------
*
* Description:  Global Defintions File
*
*---------------------------------------------------------------
*
* $History:  $
*
***************************************************************/



/******* Data Typedefs ********************************************************/
 // MikroE data types
 // Type                   Bytes       Range
 //  bit                   1–bit       0 or 1
//  sbit                   1–bit       0 or 1
//  (unsigned) char           1               0 .. 255
//  signed char                   1               - 128 .. 127
//  (signed) short (int)   1               - 128 .. 127
//  unsigned short (int)   1               0 .. 255
//  (signed) int           2               -32768 .. 32767
//  unsigned (int)           2               0 .. 65535
//  (signed) long (int)           4               -2147483648 .. 2147483647
//  unsigned long (int)           4           0 .. 4294967295
 #define uint8_t       unsigned char
 #define int8_t        signed char
 #define uint16_t      unsigned int
 #define int16_t       signed int

/***************************************************************
********************* Globals Definitions **********************
***************************************************************/
//const char RevNo[] = "1.0"; // keep as 3 chars only
//char RevStr[5]; // String to hold Revision


// EEprom Structure
#define NUMEEPARAMS 28   // Number of bytes in the structure below
#define CHAIR_PARAMS_ADDRESS 10        //Address where params start
#define MY_EE_LONG_ADDRESS  0   // Address where My long address (MAC) is stored. 8 bytes. This is burned in on programming - unique to each chair
#define CHAIR_TYPE_BYTE     EEParams.ChairParams.MyLongAddress[4]
#define DEFAULT_PASSWORD    "1234"
#define FACTORY_PASSWORD    "193728"    //Default non-changeable admin password

typedef union params_t {
        uint8_t Params_Array[NUMEEPARAMS];
        struct
        {
            uint8_t Backlight_Level;  // make this first so it is first address
            uint8_t MyPanID[2];
            uint8_t ChairPanID[2];  // not used now - PAN ID of the chairs in this theater
            uint8_t MyShortAddress[2];
            uint8_t MyLongAddress[8];   // 8 bytes
            //uint8_t MyHubAddress[8]; // 8 bytes, the Hub I am bound to. I only listen to the hub I am bound to.
            uint16_t TP_Cals[4];    //  X_min, X_Max, Y_Min, y_Max - Note these take 2 bytes each
            unsigned char Password[5]; // password - 4 digits plus string terminator 0 at end

        } HubParams;
} ; //EEParams;
// Use (name assigned to EEparams).HubParams.MyLongAddress[x] as example

// Radio Stuff
#define ZIGBEE_CHANNEL              20  // this is a WiFi clear channel  - 15, 20, 25 & 26 are clear
#define DEFAULT_PAN_ID              0xAA55
#define DEFAULT_PAN_ID_0            0xAA
#define DEFAULT_PAN_ID_1            0x55
#define DEFAULT_SHORT_ADDRESS       0x1234
#define DEFAULT_SHORT_ADDRESS_0     0x12
#define DEFAULT_SHORT_ADDRESS_1     0x34

/******************************
*
*  RF COmmands
*
******************************/
#define CMD_BIND_NO_FLASH       0x01
#define CMD_BIND_WITH_FLASH     0x02
#define CMD_CLOSE_ALL           0x03
#define CMD_OPEN_ALL            0x04
#define CMD_HEAD_OPEN_ALL       0x05
#define CMD_HEAD_CLOSE_ALL      0x06
#define CMD_FOOT_OPEN_ALL       0x07
#define CMD_FOOT_CLOSE_ALL      0x08
#define CMD_FLASH_CHAIR         0x09
#define CMD_SET_RECLINE_POS     0x0A
#define CMD_SET_KEYPAD_LIGHT    0x0B
#define CMD_SET_AMBIENT_LIGHT   0x0C
#define CMD_SET_KID_LOCKOUT     0x0D



// PWM Stuff
#define BLUE_DUTY_CYCLE      CCPR3L  // duty cycle register
#define BLUE_DUTY_CYCLE_LOW  10  // PWM setting for Low light setting on this Touch Screen
#define BLUE_DUTY_CYCLE_MED  100  // PWM setting for Med light setting
#define BLUE_DUTY_CYCLE_HIGH 240  // PWM setting for Bright light setting

#define TMR_RELOAD_HIGH 0x15  // High byte in 16 bit mode  for 10ms interrupt
#define TMR_RELOAD_LOW 0xA0

#define OPEN_CLOSE_RESEND_TIME   50 // repeat rate for sending open/close all - 50= 1/2 second

#define TIME_OUT_NO_ACTIVITY     6000 // timeout for no activity to reset to home screen 6000 = 60 seconds

#endif