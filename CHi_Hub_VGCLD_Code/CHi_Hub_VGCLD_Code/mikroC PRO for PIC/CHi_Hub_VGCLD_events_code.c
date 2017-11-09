#include "CHi_Hub_VGCLD_objects.h"
#include "CHi_Hub_VGCLD_resources.h"

//--------------------- User code ---------------------//

#include "Misc_functions.h"
#include "global_defs.h"
#include "built_in.h"

 // extern variables
 extern union params_t EEParams;  // Set up the Params structure
 extern volatile uint16_t open_close_tmr, time_out_tmr;
 
// Function Prototypes
void Key_pressed(char);
void Ch_Key_pressed(char);


extern sfr sbit BacklightBlue;
extern sfr sbit BacklightRed;
extern sfr sbit BacklightGreen;
//sbit BacklightBlue at LATG0_bit;
//sbit BacklightRed at LATC2_bit;
//sbit BacklightGreen at LATC1_bit;

char typed_letters[6] = "";
extern char Data_buf[10]; // Buffer to hold commands and data sent to radio functions


void Key_pressed(char letter_pressed){
unsigned short text_length;
char res[2] = " ";
  
  text_length = strlen(typed_letters);
  if (text_length >= 6) {
     lPWLabel.Font_Color = T6963C_BLACK; // Clears old text
     DrawLabel(&lPWLabel);
     lPWLabel.Font_Color = T6963C_WHITE; // Back to normal text
     strcpy(lPWLabel_Caption, "      ");
     DrawLabel(&lPWLabel);
     typed_letters[0] = 0;
    //strcpy(typed_letters, "");
    //return;
  }

  res[0] = letter_pressed;
  strcat(typed_letters, res);
  strcpy(lPWLabel_Caption, typed_letters);
  DrawLabel(&lPWLabel);
}

void Ch_Key_pressed(char letter_pressed){
unsigned short text_length;
char res[2] = " ";

  text_length = strlen(typed_letters);
  if (text_length >= 4) {
     lChPWLabel.Font_Color = T6963C_BLACK; // Clears old text
     DrawLabel(&lChPWLabel);
     lChPWLabel.Font_Color = T6963C_WHITE; // Back to normal text
     strcpy(lChPWLabel_Caption, "    ");
     DrawLabel(&lChPWLabel);
     typed_letters[0] = 0;
     //strcpy(typed_letters, "");
     //return;
  }

  res[0] = letter_pressed;
  strcat(typed_letters, res);
  strcpy(lChPWLabel_Caption, typed_letters);
  DrawLabel(&lChPWLabel);
}

//----------------- End of User code ------------------//

// Event Handlers


void bHomeOnPress() {
     // This is the CLOSE all button on main screen
     // Keep sending while the press button, but with timer to not repeat too often
     BacklightRed = 1;  // off
     BacklightGreen = 0;  // On
     BLUE_DUTY_CYCLE = 0; // Off
     //BacklightBlue = 1;  // Set Blue PWM to off...
     SendRF_Command_CLOSE_ALL();
}

void bHomeOnUp() {
     // they released the home button - turn colors back
     BacklightRed = 1;  // off
     BacklightGreen = 1;  // off
     BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;  // Set to desired level
     //BacklightBlue = 0;  // Set Blue PWM to duty cycle...
}

void bCleanOnPress() {
     // This will open the footrest and recline the headreast
     // Keep sending while the press button, but with timer to not repeat too often
     BacklightRed = 1;  // off
     BacklightGreen = 0;  // On
     BLUE_DUTY_CYCLE = 0;   // Set to Off
     //BacklightBlue = 1;  // Set Blue PWM to off...
     SendRF_Command_OPEN_ALL();
}

void bCleanOnUp() {
     // they released the Foot up button - turn colors back
     BacklightRed = 1;  // off
     BacklightGreen = 1;  // off
     BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;  // Set to desired level
     //BacklightBlue = 0;  // Set Blue PWM to duty cycle...
}

void bFootRestOpenOnPress() {
     // This will open the footrest Only
     // Keep sending while the press button, but with timer to not repeat too often
     BacklightRed = 1;  // off
     BacklightGreen = 0;  // On
     BLUE_DUTY_CYCLE = 0;   // Set to Off
     //BacklightBlue = 1;  // Set Blue PWM to off...
     SendRF_Command_OPEN_FOOTREST_ALL();
}

void bFootRestOpenOnUp() {
     // they released the Foot up button - turn colors back
     BacklightRed = 1;  // off
     BacklightGreen = 1;  // off
     BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;  // Set to desired level
     //BacklightBlue = 0;  // Set Blue PWM to duty cycle...
}

void bNum1OnClick() {
     Beep();
     Key_pressed('1');
}

void bNum2OnClick() {
     Beep();
     Key_pressed('2');
}

void bNum3OnClick() {
     Beep();
     Key_pressed('3');
}

void bNum4OnClick() {
     Beep();
     Key_pressed('4');
}

void bNum5OnClick() {
     Beep();
     Key_pressed('5');
}

void bNum6OnClick() {
     Beep();
     Key_pressed('6');
}

void bNum7OnClick() {
     Beep();
     Key_pressed('7');
}

void bNum8OnClick() {
     Beep();
     Key_pressed('8');
}

void bNum9OnClick() {
     Beep();
     Key_pressed('9');
}

void bNum0OnClick() {
     Beep();
     Key_pressed('0');
}

void bNum1ChOnClick() {
     Beep();
     Ch_Key_pressed('1');
}

void bNum2ChOnClick() {
     Beep();
     Ch_Key_pressed('2');
}

void bNum3ChOnClick() {
     Beep();
     Ch_Key_pressed('3');
}

void bNum4ChOnClick() {
     Beep();
     Ch_Key_pressed('4');
}

void bNum5ChOnClick() {
     Beep();
     Ch_Key_pressed('5');
}

void bNum6ChOnClick() {
     Beep();
     Ch_Key_pressed('6');
}

void bNum7ChOnClick() {
     Beep();
     Ch_Key_pressed('7');
}

void bNum8ChOnClick() {
     Beep();
     Ch_Key_pressed('8');
}

void bNum9ChOnClick() {
     Beep();
     Ch_Key_pressed('9');
}

void bNum0ChOnClick() {
     Beep();
     Ch_Key_pressed('0');
}


void bChPwOnClick() {
     char i;
     Beep();
     // Add code to verify PW and then draw admin screen if OK
     // Maybe add another screen to say 'Password successfully changed....
          // Verify correct passord, if OK then go to Admin Screen
     lChPWLabel.Font_Color = T6963C_BLACK; // Clears old text
     DrawLabel(&lChPWLabel);
     lChPWLabel.Font_Color = T6963C_WHITE; // Back to normal text

     if(strlen(typed_letters) == 4)
     {
         // change the password - flash green
         BacklightRed = 1;
         BacklightGreen = 0;
         BLUE_DUTY_CYCLE = 0;
         Delay_Ms(1000);
         BacklightRed = 1;
         BacklightGreen = 1;
         BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;
         for(i=0; i<4; i++)
         {
             EEParams.HubParams.Password[i] = typed_letters[i];
             // Now write them back out to the EEPROM
             Write_params(EEParams.Params_Array);
         }
         strcpy(bChPWCancel_Caption,"DONE");
         DrawRoundButton(&bChPWCancel);
     }
     else
     {
         // Not equal - try again
         // Turn red then redraw
         BacklightRed = 0;
         BacklightGreen = 1;
         BLUE_DUTY_CYCLE = 0;
         Delay_Ms(1000);
         BacklightRed = 1;
         BacklightGreen = 1;
         BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;
         BacklightBlue = 0; // Set PWM for blue to off
         //DrawLabel(&lPWLabel);
     }  // end not the correct password
     // DrawScreen(&ScreenAdmin1);
     strcpy(lChPWLabel_Caption, "    ");
     DrawLabel(&lChPWLabel);
     typed_letters[0] = 0;
}

void bChPWCancelOnClick() {
     // Clear out PW Entry - they hit the cancel button from the PW schange Screen
     Beep();
     strcpy(lChPWLabel_Caption, "    ");
     strcpy(typed_letters, "");
     DrawScreen(&ScreenAdmin1);
     strcpy(bChPWCancel_Caption,"CANCEL");
}

void bSetUpOnClick() {
     // Not used any more - PW Screen on click of main Screen now
     DrawScreen(&ScreenPW);
}


void CHiLogoOnClick() {
     Beep();
     BacklightRed = 1;  // off
     BacklightGreen = 1;  // off
     BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;  // Set Blue PWM to duty cycle...
     DrawScreen(&ScreenPW);
}

void SmallChairLogoOnClick() {
     Beep();
     DrawScreen(&ScreenWelcome);
     // This is the top level Screen with the logo on it
     // Turn Lights off after only 5 seconds
     time_out_tmr = (TIME_OUT_NO_ACTIVITY - 500);
}

void bReclineBackOnClick() {
     Beep();
     // go back to admin screen from setting recline limit
     DrawScreen(&ScreenAdmin1);
}

void bBindFlashOnClick() {
     // Toggle sending of "Bind with Flash" command
     Beep();
     Toggle_Send_RF_Bind_with_Flash();
}

void bBindFlashOnUp() {
     // No longer used
     BacklightRed = 1;  // off
     BacklightGreen = 1;  // off
     BacklightBlue = 0;  // Set Blue PWM to duty cycle...
}

void bBindFlashOnPress() {
     //No longer used....
     BacklightRed = 1;
     BacklightGreen = 0;
     BacklightBlue = 1; // Set PWM for blue to off
     // Add code to send Bind with flash command every xx milliseconds
     // in function - need to make sure we only send every xx milliseconds
}

void bBindNoFlashOnClick() {
     // Toggle sending of "Bind with Flash" command
     Beep();
     Toggle_Send_RF_Bind_no_Flash();
}

void bBindNoFlashOnUp() {
     // No longer used
     BacklightRed = 1;  // off
     BacklightGreen = 1;  // off
     BacklightBlue = 0;  // Set Blue PWM to duty cycle...
}

void bBindNoFlashOnPress() {
     // No longer used
     BacklightRed = 1;
     BacklightGreen = 0;
     BLUE_DUTY_CYCLE = 0;  // Set Blue PWM to duty cycle to OFF
     // Add code to send Bind with no flash command every xx milliseconds
     // in function - need to make sure we only send every xx milliseconds
}

void bCalTouchOnClick() {
     // Add code to call calibrate touch panel, and store in EEProm
     // Add a delay before starting call to allow for pen up
     Beep();
     BacklightRed = 0;
     BacklightGreen = 0;
     BacklightBlue = 0; // Make the Screen white

     My_Calibrate_TP();


     BacklightRed = 1;
     BacklightGreen = 1; // Back to blue
     // Write out the new cal values

     Write_Cals(); // Write to EEProm

     DrawScreen(&ScreenAdmin2); // Draw the screen
}

void bPWEnterOnClick() {
     // Verify correct passord, if OK then go to Admin Screen
     // Need to go to appropriate screen - depending on passwork entered
     Beep();
     lPWLabel.Font_Color = T6963C_BLACK; // Clears old text
     DrawLabel(&lPWLabel);
     lPWLabel.Font_Color = T6963C_WHITE; // Back to normal text

     // Put in for testing - no password needed!
     //DrawScreen(&ScreenAdmin1);
     //strcpy(lPWLabel_Caption, "    ");
     //DrawLabel(&lPWLabel);
     //typed_letters[0] = 0;
     //return;
     // Remove in final

     // Add verification code of correct password
     // if OK - goto appropriate Screen: Main or ScreenAdmin1
     if(strcmp(lPWLabel_Caption, EEParams.HubParams.Password) == 0)
     {
         // It's the User's password - go to this screen
         DrawScreen(&ScreenMain);
     }
     else if(strcmp(lPWLabel_Caption, FACTORY_PASSWORD) == 0)
     {
         // It's the Admin password - go to this screen
         DrawScreen(&ScreenAdmin1);
     }
     else
     {
         // Not equal - try again
         // Turn red then redraw
         BacklightRed = 0;
         BacklightGreen = 1;
         BLUE_DUTY_CYCLE = 0;
         Delay_Ms(1000);
         BacklightRed = 1;
         BacklightGreen = 1;
         BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;
         BacklightBlue = 0; // Set PWM for blue to off
         //DrawLabel(&lPWLabel);
     }  // end not the correct password
     // DrawScreen(&ScreenAdmin1);
     strcpy(lPWLabel_Caption, "      ");
     DrawLabel(&lPWLabel);
     typed_letters[0] = 0;
}


void bPWCancelOnClick() {
     // Clear numeric label and go to Home Screen
     Beep();
     strcpy(lPWLabel_Caption, "      "); // clear caption label
     strcpy(typed_letters, "");
     DrawScreen(&ScreenWelcome);
     // This is the top level Screen with the logo on it
     // Turn Lights off after only 5 seconds
     time_out_tmr = (TIME_OUT_NO_ACTIVITY - 500);
}

void bSetReclineLimitOnClick() {
     Beep();
     DrawScreen(&ScreenSetRecline);
}

void bChangePWOnClick(void) {
     Beep();
     DrawScreen(&ScreenChangePW);
}

void bDimLevelOnClick() {
     // Enter the set dim level of this touchscreen
     Beep();
     DrawScreen(&ScreenTPDimLevel);
}

void bDimBackOnClick() {
     // Add code to set dim level in EEprom to current level (OFF, Low, Med High)
     // and then go back to admin screen
     Beep();
     EEParams.HubParams.Backlight_Level = BLUE_DUTY_CYCLE;
     EEPROM_Write(CHAIR_PARAMS_ADDRESS, BLUE_DUTY_CYCLE);  // BLUE_DUTY_CYCLE is mapped to CCPR3L - duty cycle register
                                                           // Since duty cycle is fisrt EEPROM paramater, pass the address as this
     //Write_params(EEParams.Params_Array); // Write all them out - could just write the Dim level
     DrawScreen(&ScreenAdmin1);
}

void bDimOffOnClick() {
     //Add code to change dim Level to OFF - Do not write EEProm Yet..
     Beep();
     BLUE_DUTY_CYCLE = 0;  // Set to Zero
     
}

void bDimLowOnClick() {
     //Add code to change dim Level to Low - Do not write EEProm Yet..
     Beep();
     BLUE_DUTY_CYCLE = BLUE_DUTY_CYCLE_LOW;  // Set to low Brightness
}

void bDimMedOnClick() {
     //Add code to change dim Level to Med - Do not write EEProm Yet..
     Beep();
     BLUE_DUTY_CYCLE = BLUE_DUTY_CYCLE_MED;  // Set to Med Brightness
}

void bDimHighOnClick() {
     //Add code to change dim Level to OFF - Do not write EEProm Yet..
     Beep();
     BLUE_DUTY_CYCLE = BLUE_DUTY_CYCLE_HIGH;  // Set to High Brightness
}

void bNext2Admin2OnClick() {
     // Done with admin screen, back to Welcome screen
     Beep();
     DrawScreen(&ScreenAdmin2);
}

void bAdminReturn2OnClick() {
     // Done with admin screen, back to 1st admin screen
     Beep();
     DrawScreen(&ScreenAdmin1);
}

void bAdminReturnOnClick() {
     // Done with admin screen, back to Welcome screen
     Beep();
     DrawScreen(&ScreenWelcome);
     // This is the top level Screen with the logo on it
     // Turn Lights off after only 5 seconds
     time_out_tmr = (TIME_OUT_NO_ACTIVITY - 500);
}

void bSendReclineLimitCmdOnClick() {
     // Pressing the 'Set' Recline limit
     // send RF command  -  with timer to not repeat too fast
     Beep();
     // Change Backligt during this...
     BacklightRed = 1;
     BacklightGreen = 0;
     BLUE_DUTY_CYCLE = 255; // Set PWM for blue to off
     // Send Command to all chairs to set their Recline Limit
     // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
     Data_buf[0] = 1; // length = 1 - Only a Command
     Data_buf[1] = CMD_SET_RECLINE_POS; // define for the command
     Send_RF_Broadcast_Cmd_n(5); // Send it 5 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
     Delay_Ms(1000);
     BacklightRed = 1;
     BacklightGreen = 1;
     BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level; // Set PWM for blue to Nominal value
}

void bSendReclineLimitCmdOnPress() {
// Not used... went to click instead of press and hold
     // Pressing the 'Set' Recline limit
     // send RF command  -  with timer to not repeat too fast
     // Change Backligt during this...
     BacklightRed = 1;
     BacklightGreen = 0;
     BLUE_DUTY_CYCLE = 255; // Set PWM for blue to off
     // Send Command to all chairs to set their Recline Limit
     // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
     Data_buf[0] = 1; // length = 1 - Only a Command
     Data_buf[1] = CMD_SET_RECLINE_POS; // define for the command
     Send_RF_Broadcast_Cmd_n(5); // Send it 5 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

void bSendReclineLimitCmdOnUp() {
// Not used... went to click instead of press and hold
     // They let up on the 'SET' recline button - restore backlight
     BacklightRed = 1;  // off
     BacklightGreen = 1;  // off
     BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level;  // Set Blue PWM to duty cycle...
}

void bChairDimOnClick() {
     // Enter the set dim level of the chair lighting
     Beep();
     DrawScreen(&ScreenChDimLevel);
}

void bDimChBackOnClick() {
     // Done with Setting chair light levels - back to admin screen
     Beep();
     DrawScreen(&ScreenAdmin1);
}

void bDimBackOffOnClick() {
     // Send Command to all chairs to set their Keypad Backlight level to 'OFF'
     // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
     Beep();
     Data_buf[0] = 2; // length = 2 - Command + 1 byte data
     Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
     Data_buf[2] = 0; // Set dim level to 0 - Chair uses this as an index into the PWM register array to pick the right value to actually load
     Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

void bDimBack1OnClick() {
    // Send Command to all chairs to set their Keypad Backlight level to 'Level 1'
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
    Data_buf[2] = 1; // Set dim level to 1 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}


void bDimBack2OnClick() {
     // Send Command to all chairs to set their Keypad Backlight level to 'Level 2'
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
    Data_buf[2] = 2; // Set dim level to 2 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}


void bDimBack3OnClick() {
     // Send Command to all chairs to set their Keypad Backlight level to 'Level 3'
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
    Data_buf[2] = 3; // Set dim level to 3 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

void bDimBack4OnClick() {
     // Send Command to all chairs to set their Keypad Backlight level to 'Level 4'
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
    Data_buf[2] = 4; // Set dim level to 4 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

void bDimBack5OnClick() {
     // Send Command to all chairs to set their Keypad Backlight level to 'Level 5'
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
    Data_buf[2] = 5; // Set dim level to 5 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

void bDimBack6OnClick() {
     // Send Command to all chairs to set their Keypad Backlight level to 'Level 6'
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
    Data_buf[2] = 6; // Set dim level to 6 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

void bDimBackMaxOnClick() {
     // Send Command to all chairs to set their Keypad Backlight level to 'Level 7'   Maximum
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_KEYPAD_LIGHT; // define for the command
    Data_buf[2] = 7; // Set dim level to 7 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

// These are not used any more - there is no 'Ambience' lights anymore...

void bDimAmbOffOnClick() {
    // Send Command to all chairs to set their Keypad Ambient level to 'Level 0' (OFF)
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
    Data_buf[2] = 0; // Set dim level to 0 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

void bDimAmb1OnClick() {
    // Send Command to all chairs to set their Keypad Ambient level to 'Level 1'
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
    Data_buf[2] = 1; // Set dim level to 1 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

void bDimAmb2OnClick() {
    // Send Command to all chairs to set their Keypad Ambient level to 'Level 2'
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
    Data_buf[2] = 2; // Set dim level to 2 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

void bDimAmb3OnClick() {
    // Send Command to all chairs to set their Keypad Ambient level to 'Level 3'
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
    Data_buf[2] = 3; // Set dim level to 3 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

void bDimAmb4OnClick() {
    // Send Command to all chairs to set their Keypad Ambient level to 'Level 4'
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
    Data_buf[2] = 4; // Set dim level to 4 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

void bDimAmb5OnClick() {
    // Send Command to all chairs to set their Keypad Ambient level to 'Level 5'
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
    Data_buf[2] = 5; // Set dim level to 5 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

void bDimAmb6OnClick() {
    // Send Command to all chairs to set their Keypad Ambient level to 'Level 6'
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
    Data_buf[2] = 6; // Set dim level to 6 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

void bDimAmbMaxOnClick() {
    // Send Command to all chairs to set their Keypad Ambient level to 'Level 7'  Max
    // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
    Beep();
    Data_buf[0] = 2; // length = 2 - Command + 1 byte data
    Data_buf[1] = CMD_SET_AMBIENT_LIGHT; // define for the command
    Data_buf[2] = 7; // Set dim level to 7 - Chair uses this as an index into the PWM register array to pick the right value to actually load
    Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}

void bFlashChairOnClick() {
    // Flash all chairs that receive this command
    Beep();
    Toggle_Send_Flash();
}

void bDisplayCalsOnClick() {
    // Display the Touch calibration consttants to record
    Beep();
    BacklightRed = 0;
    BacklightGreen = 0;
    BLUE_DUTY_CYCLE = 255; // Full white
    //T6963C_grFill(0);                                        // Clear display
    //T6963C_txtFill(0);
    Display_Cals();  // Write to Screen
    Display_Hub_Address();
    Delay_ms(7000);
    //Change color back to normal
    BacklightRed = 1;
    BacklightGreen = 1;
    BLUE_DUTY_CYCLE = EEParams.HubParams.Backlight_Level; // set the duty cycle Register - that's why it's in CAPS - it's a define
    DrawScreen(&ScreenAdmin2);
}

void bEnableKidLockOnClick() {
     // Send command to Enable Kid Lock Feature
     // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
     Beep();
     Data_buf[0] = 2; // length = 2 - Command + 1 byte data
     Data_buf[1] = CMD_SET_KID_LOCKOUT; // define for the command
     Data_buf[2] = 1; // Enable the lockout
     Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}


void bDisableKidLockOnClick() {
     // Send command to Disable Kid Lock Feature
     // Load the Data buffer with the command and data, then call Send_RF_Broadcast_Cmd_n (send 'n' times)
     Beep();
     Data_buf[0] = 2; // length = 2 - Command + 1 byte data
     Data_buf[1] = CMD_SET_KID_LOCKOUT; // define for the command
     Data_buf[2] = 0; // Disable the lockout
     Send_RF_Broadcast_Cmd_n(3); // Send it 3 times - dont inc sequence number so chairs that get it don't repeat
                                 // Data_buf is a global variable that everyone uses along the way
}