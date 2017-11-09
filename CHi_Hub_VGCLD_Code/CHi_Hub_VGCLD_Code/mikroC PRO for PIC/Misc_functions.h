 /*
    My Misc Funcitons
 */
 
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