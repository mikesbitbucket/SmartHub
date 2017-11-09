/*
 * Project name:
     CHi_Hub_VGCLD.vglcd
 * Generated by:
     Visual GLCD
 * Date of creation
     4/11/2016
 * Time of creation
     9:26:56 PM
 * Test configuration:
     MCU:             P18F87K22
     Dev.Board:       SmartGLCD240x128_hw_rev_1.51
     Oscillator:      48000000 Hz
     SW:              mikroC PRO for PIC
                      http://www.mikroe.com/eng/products/view/7/mikroc-pro-for-pic/
 */
 
 /*************************************************
 /
 /     Version 1.0 - Initial Release
 /     V 1.1 Aug 8, 2016 - Added Footrest raise command
 /     v 1.2 Aug 24, 2016 - Added Kid Lockout feature buttons on Admin 2 screen
 /
 /
 /
 *************************************************/
 
 
 /*************************************************
 /
 /    My Notes
 /    When doing a trip through Visual GCLD, it will wipe out some of my functions in their files
 /    You have to do the following;
 /    in file: CHi_Hub_VGCLD_driver.c
 /    Add #include "Misc_functions.h"
 /    They will do a calibrate in the "Start_TP()" funciton.
 /    Comment this out - we check at startup for a calibrated display
 /
 /     Also, add the reset for time out timer in the Check_TP routine of CHi_Hub_VGLCD_driver.c
 /     void Check_TP() {
 /          if (TP_Press_Detect()) {
 /          // After a PRESS is detected read X-Y and convert it to Display dimensions space
 /             if (TP_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
 /   --->         time_out_tmr=0; // reset the timer
 /                Process_TP_Press(Xcoord, Ycoord);
 /                if (PenDown == 0) {
 /                PenDown = 1;
 /                Process_TP_Down(Xcoord, Ycoord);
 /
 /                Be sure to include the extern declaration for this variable in CHi_Hub_VGLCD_driver.c
 /   --->         extern volatile unsigned int time_out_tmr;
 /
 /               This is what the Start_TP should look like
 /                void Start_TP() {
 /                Init_MCU();
 /
 /                InitializeTouchPanel();
 /                ***** Don't have to do this now!! Choose Manual Calibration in Visual GLCD!!
 
 /    --->        //T6963C_Write_Text_Adv("CALIBRATION", 80, 60);
 /    --->        //Delay_ms(1000);
 /                T6963C_grFill(0);                                        // Clear display
 /                T6963C_txtFill(0);
 /    --->        //Calibrate();
 /
 /                T6963C_grFill(0);                                        // Clear display
 /                T6963C_txtFill(0);
 /                InitializeObjects();
 /                DrawScreen(&ScreenWelcome);
 /                }
 /
 /
 /
 ************************************************/

#include "CHi_Hub_VGCLD_objects.h"
#include "Misc_functions.h"
#include "global_defs.h"


// RF files
#include "RF_registers.h"
#include "RF_ReadWrite_Routines.h"
#include "RF_Reset_Routines.h"
#include "RF_Misc_Routines.h"
#include "RF_Init_Routines.h"

// RF Module MRF24J40MA connections
// We use SPI1 for comms
sbit CS at LATE0_bit;                // CS pin
sbit RST at LATE2_bit;               // RST pin
sbit INT at RB0_bit;                 // INT pin
sbit WAKE at LATE7_bit;              // WAKE pin

sbit CS_Direction at TRISE0_bit;     // CS pin direction
sbit RST_Direction at TRISE2_bit;    // RST pin direction
sbit INT_Direction at TRISB0_bit;    // INT pin direction
sbit WAKE_Direction at TRISE7_bit;   // WAKE pin direction

sfr unsigned short volatile TMR0HM            absolute 0x0FD7;

// Buzzer
extern sfr sbit Buzzer_Direction;
extern sfr sbit Buzzer_Out;

// LED Bits
sbit BacklightBlue at LATG0_bit;
sbit BacklightRed at LATC2_bit;
sbit BacklightGreen at LATC1_bit;

unsigned short i,j;
const code char DefaultHubAddress[] = {0x21, 0x43, 0x65, 0x10,0x11, 0x55, 0xAA, 0x01}; // if nothing in EEPROM - use this
                                    // this should be for debug only -SQTP should put real address at EEPROM [0-7]
                                    

// Default Passwords
const code char DefaultPassword[] = DEFAULT_PASSWORD;  // Default password

                                    
uint8_t  g_send_bind_with_flash=0, g_send_bind_no_flash=0, g_send_flash = 0;
uint8_t  one_second_tic=0, two_second_tic=0;
                                    
extern short int DATA_TX[];   // used for sendig test messages
extern char Data_buf[10]; // Buffer to hold commands and data sent to radio functions

union params_t EEParams;  // Set up the Params structure

volatile uint16_t heartbeat_tmr, open_close_tmr, time_out_tmr;
//extern volatile uint16_t heartbeat_tmr;
 // Don't have to include interrupt.c
//#include "interrupt.c"

 void interrupt_low() {

  if (TMR5IF_bit == 1) {
    heartbeat_tmr++;
    open_close_tmr++;
    time_out_tmr++;
    TMR5ON_bit = 0;
    TMR5H = TMR_RELOAD_HIGH;
    TMR5L = TMR_RELOAD_LOW;
    TMR5IF_bit = 0;
    TMR5ON_bit = 1;
  }
  //else if (INTCON.RBIF) {
    //counter++;
    //TMR0 = 96;
    //INTCON.RBIF = 0;
  //}
  GIEL_bit = 1; // enable low priority interrupts
}


void main() {

  Start_TP();
  
  // Check for new chair
  // Read in the EE params
  Read_params(EEParams.Params_Array);
 if(EEParams.HubParams.MyLongAddress[6] == 0xAA)
{
    //we're good

}
else
{
    //New part - initialize the Params
    for(i=0; i<8; i++)
    {
        // read programmed long address, write it to Params Structure - SQTP writes 8 byte  SN at address 0
        EEParams.HubParams.MyLongAddress[i]=EEPROM_Read(i); // Default MAC stored at EE address 0-7 - this is written at program time by SQRT
    }
    if(EEParams.HubParams.MyLongAddress[7] == 0xFF)
    {
        // Need to put in default long address
        for(i=0; i<8; i++)
        {
             EEParams.HubParams.MyLongAddress[i] = DefaultHubAddress[i];  // Use this if no address programmed in by SQTP in first 8 EEPROM locations
             // This should never occur - only used during my testing to make sure a good address gets written in.
        }
    }
    EEParams.HubParams.Backlight_Level = BLUE_DUTY_CYCLE_HIGH; // Set initial to brightest
    EEParams.HubParams.MyPanID[0] = DEFAULT_PAN_ID_0; // Default PAN
    EEParams.HubParams.MyPanID[1] = DEFAULT_PAN_ID_1; // Default PAN
    EEParams.HubParams.MyShortAddress[0] = DEFAULT_SHORT_ADDRESS_0; // Default Address
    EEParams.HubParams.MyShortAddress[1] = DEFAULT_SHORT_ADDRESS_1; // Default Address

    // Let's put in default Cal values
    EEParams.HubParams.TP_Cals[0] = 200; // Xmin
    EEParams.HubParams.TP_Cals[1] = 3815; // Xmax
    EEParams.HubParams.TP_Cals[2] = 380; // Ymin
    EEParams.HubParams.TP_Cals[3] = 3615; // Ymax
    
    // Put it default password
    for(i=0; i<4; i++)
    {
         EEParams.HubParams.Password[i] = 0x31 + i; // Ascii 1234
    }
    EEParams.HubParams.Password[4] = 0 ; // Null terminator for string compare

    // Now write them back out to the EEPROM
    Write_params(EEParams.Params_Array);
    
    // Flash Special Sequence
    for(i=0; i<5; i++)
    {
        for(j=0; j<3; j++)
        {
            BacklightRed = 1;
            BacklightGreen = 1;
            BLUE_DUTY_CYCLE = 255;
            Delay_ms(100);
            BacklightRed = 0;  // Change Color
            Delay_ms(100);
        }
        BacklightRed = 1;
        Delay_ms(250);
        Delay_ms(250);
    }
    BacklightRed = 1;
    BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level; // set the duty cycle Register - that's why it's in CAPS - it's a define

    
} // end test for new part
  
  
  //Display_Cals();
  //Delay_ms(2000);
  
  //DrawScreen(&ScreenMain);
  DrawScreen(&ScreenWelcome);
  BacklightRed = 1;
  BacklightGreen = 1;
  My_Init();
  RF_Initialize();
  BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;  // Set to default power to start (full if new part)
  
  //TMR5H = 0x15; //TMR_RELOAD_HIGH;
  //TMR5L = 0xA0; //TMR_RELOAD_LOW;
  //TMR5IF_bit = 0;
  //TMR5IE_bit = 1;   // let it interrupt
  
  TMR5ON_bit = 1;
  GIEL_bit = 1; // enable low priority interrupts
  GIE_bit = 1;


  // Beep Once
  for(i=0; i<250; i++)
  {
    Buzzer_Out = 1;
    Delay_us(140);
    Buzzer_Out = 0;
    Delay_us(140);
  }

  
  while (1) {
        Check_TP();

        if(heartbeat_tmr > 10) // 100ms tics
        {
             // change color & send test message
             heartbeat_tmr = 0;
             // BacklightRed = ~BacklightRed;  // Change Color
             //send_test_message(2); // Send test message
             one_second_tic++; // Inc this variable - test for 1 second events
             two_second_tic++; // Inc this variable - test for 2 second events
             if(one_second_tic >= 10)
             {
                  // check events
                  one_second_tic = 0;
                  if(g_send_bind_with_flash == 1) // should we send out the Bind with Flash command?
                  {
                      send_broadcast_message(CMD_BIND_WITH_FLASH); // Send message
                      time_out_tmr = 0; // Reset timer so this command stays active...
                  }
                  else if(g_send_bind_no_flash == 1)  // use else if tree so no multiple commands
                  {
                      send_broadcast_message(CMD_BIND_NO_FLASH); // Send message
                      time_out_tmr = 0; // Reset timer so this command stays active...
                  }
             }   // end 1 second tic stuff
             if(two_second_tic >= 20)
             {
                  // check events
                  two_second_tic = 0;
                  if(g_send_flash == 1) // should we send out the Flash all chairs command?
                  {
                      send_broadcast_message(CMD_FLASH_CHAIR); // Send message
                      time_out_tmr = 0; // Reset timer so this command stays active...
                  }
             }   // end 2 second tic stuff
             
             // now check if we have the Send Variable command active
             // Call the routine with zeros in the field to have it just check, not set parameters
             Send_RF_Broadcast_Cmd_n(0); // By sending zero, we just check if it is running and have it send out if it is
             
        }    // end 100ms tic stuff
        
        //Check if timeout timer is expired - if so, go to home Screen
        if(time_out_tmr > TIME_OUT_NO_ACTIVITY)
        {
            time_out_tmr = 0;
            BacklightRed = 1;  // off
            BacklightGreen = 1;  // off
            BLUE_DUTY_CYCLE = 0;  // Set Blue PWM to OFF
            strcpy(lPWLabel_Caption, "      ");  // Clear PW field just in case they left something there
            strcpy(lChPWLabel_Caption, "    ");
            DrawScreen(&ScreenWelcome);
        }
  }

}