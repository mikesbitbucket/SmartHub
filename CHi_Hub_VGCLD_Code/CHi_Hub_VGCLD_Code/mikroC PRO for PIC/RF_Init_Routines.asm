
_RF_Initialize:

;RF_Init_Routines.c,19 :: 		void RF_Initialize() {
;RF_Init_Routines.c,20 :: 		short int i = 0;
	CLRF        RF_Initialize_i_L0+0 
;RF_Init_Routines.c,22 :: 		LQI = 0;
	CLRF        _LQI+0 
;RF_Init_Routines.c,23 :: 		RSSI2 = 0;
	CLRF        _RSSI2+0 
;RF_Init_Routines.c,24 :: 		SEQ_NUMBER = 0xF0;      // Was 0x23 Mike
	MOVLW       240
	MOVWF       _SEQ_NUMBER+0 
;RF_Init_Routines.c,25 :: 		lost_data = 0;
	CLRF        _lost_data+0 
;RF_Init_Routines.c,26 :: 		address_RX_FIFO = 0x300;
	MOVLW       0
	MOVWF       _address_RX_FIFO+0 
	MOVLW       3
	MOVWF       _address_RX_FIFO+1 
;RF_Init_Routines.c,27 :: 		address_TX_normal_FIFO = 0;
	CLRF        _address_TX_normal_FIFO+0 
	CLRF        _address_TX_normal_FIFO+1 
;RF_Init_Routines.c,42 :: 		PAN_ID_1[0] = 0xAA;  // These are my PAN ID - Hubs use AA55 for PANID
	MOVLW       170
	MOVWF       _PAN_ID_1+0 
;RF_Init_Routines.c,43 :: 		PAN_ID_1[1] = 0x55;
	MOVLW       85
	MOVWF       _PAN_ID_1+1 
;RF_Init_Routines.c,44 :: 		PAN_ID_2[0] = 0x12;  // These are Destination PAN ID
	MOVLW       18
	MOVWF       _PAN_ID_2+0 
;RF_Init_Routines.c,45 :: 		PAN_ID_2[1] = 0x34;
	MOVLW       52
	MOVWF       _PAN_ID_2+1 
;RF_Init_Routines.c,48 :: 		PAN_ID_2[0] = 0xFF;  // These are Destination PAN ID
	MOVLW       255
	MOVWF       _PAN_ID_2+0 
;RF_Init_Routines.c,49 :: 		PAN_ID_2[1] = 0xFF;
	MOVLW       255
	MOVWF       _PAN_ID_2+1 
;RF_Init_Routines.c,52 :: 		for(i=0; i<8; i++)
	CLRF        RF_Initialize_i_L0+0 
L_RF_Initialize0:
	MOVLW       128
	XORWF       RF_Initialize_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       8
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_RF_Initialize1
;RF_Init_Routines.c,54 :: 		ADDRESS_long_1[i] = EEParams.HubParams.MyLongAddress[i];     // LSB of address
	MOVLW       _ADDRESS_long_1+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_ADDRESS_long_1+0)
	MOVWF       FSR1H 
	MOVF        RF_Initialize_i_L0+0, 0 
	ADDWF       FSR1, 1 
	MOVLW       0
	BTFSC       RF_Initialize_i_L0+0, 7 
	MOVLW       255
	ADDWFC      FSR1H, 1 
	MOVLW       _EEParams+7
	MOVWF       FSR0 
	MOVLW       hi_addr(_EEParams+7)
	MOVWF       FSR0H 
	MOVF        RF_Initialize_i_L0+0, 0 
	ADDWF       FSR0, 1 
	MOVLW       0
	BTFSC       RF_Initialize_i_L0+0, 7 
	MOVLW       255
	ADDWFC      FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;RF_Init_Routines.c,52 :: 		for(i=0; i<8; i++)
	INCF        RF_Initialize_i_L0+0, 1 
;RF_Init_Routines.c,55 :: 		}
	GOTO        L_RF_Initialize0
L_RF_Initialize1:
;RF_Init_Routines.c,66 :: 		Dest_Address_short[0] = 'C';   // 'Chair'
	MOVLW       67
	MOVWF       _Dest_Address_short+0 
;RF_Init_Routines.c,67 :: 		Dest_Address_short[1] = 'H';
	MOVLW       72
	MOVWF       _Dest_Address_short+1 
;RF_Init_Routines.c,68 :: 		My_Address_short[0] = 'H';     // 'Hub'
	MOVLW       72
	MOVWF       _My_Address_short+0 
;RF_Init_Routines.c,69 :: 		My_Address_short[1] = 'B';
	MOVLW       66
	MOVWF       _My_Address_short+1 
;RF_Init_Routines.c,72 :: 		ANCON0 = 0;            // Configure ports as digital I/O
	CLRF        ANCON0+0 
;RF_Init_Routines.c,73 :: 		ANCON1 = 0;
	CLRF        ANCON1+0 
;RF_Init_Routines.c,74 :: 		ANCON2 = 0;
	CLRF        ANCON2+0 
;RF_Init_Routines.c,75 :: 		GIE_bit = 0;           // Disable interrupts
	BCF         GIE_bit+0, BitPos(GIE_bit+0) 
;RF_Init_Routines.c,82 :: 		CS_Direction = 0;      // Set direction to be output
	BCF         CS_Direction+0, BitPos(CS_Direction+0) 
;RF_Init_Routines.c,83 :: 		RST_Direction  = 0;    // Set direction to be output
	BCF         RST_Direction+0, BitPos(RST_Direction+0) 
;RF_Init_Routines.c,84 :: 		INT_Direction  = 1;    // Set direction to be input
	BSF         INT_Direction+0, BitPos(INT_Direction+0) 
;RF_Init_Routines.c,85 :: 		WAKE_Direction = 0;    // Set direction to be output
	BCF         WAKE_Direction+0, BitPos(WAKE_Direction+0) 
;RF_Init_Routines.c,87 :: 		DATA_TX[0] = 0;        // Initialize first byte
	CLRF        _DATA_TX+0 
;RF_Init_Routines.c,92 :: 		Delay_ms(5);
	MOVLW       78
	MOVWF       R12, 0
	MOVLW       235
	MOVWF       R13, 0
L_RF_Initialize3:
	DECFSZ      R13, 1, 1
	BRA         L_RF_Initialize3
	DECFSZ      R12, 1, 1
	BRA         L_RF_Initialize3
;RF_Init_Routines.c,95 :: 		SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
	CLRF        FARG_SPI1_Init_Advanced_master+0 
	CLRF        FARG_SPI1_Init_Advanced_data_sample+0 
	CLRF        FARG_SPI1_Init_Advanced_clock_idle+0 
	MOVLW       1
	MOVWF       FARG_SPI1_Init_Advanced_transmit_edge+0 
	CALL        _SPI1_Init_Advanced+0, 0
;RF_Init_Routines.c,96 :: 		pin_reset();                              // Activate reset from pin
	CALL        _pin_reset+0, 0
;RF_Init_Routines.c,97 :: 		software_reset();                         // Activate software reset
	CALL        _software_reset+0, 0
;RF_Init_Routines.c,98 :: 		RF_reset();                               // RF reset
	CALL        _RF_reset+0, 0
;RF_Init_Routines.c,99 :: 		set_WAKE_from_pin();                      // Set wake from pin
	CALL        _set_wake_from_pin+0, 0
;RF_Init_Routines.c,101 :: 		set_long_address(ADDRESS_long_1);         // Set long address
	MOVLW       _ADDRESS_long_1+0
	MOVWF       FARG_set_long_address_address+0 
	MOVLW       hi_addr(_ADDRESS_long_1+0)
	MOVWF       FARG_set_long_address_address+1 
	CALL        _set_long_address+0, 0
;RF_Init_Routines.c,102 :: 		set_short_address(ADDRESS_short_1);       // Set short address
	MOVLW       _ADDRESS_short_1+0
	MOVWF       FARG_set_short_address_address+0 
	MOVLW       hi_addr(_ADDRESS_short_1+0)
	MOVWF       FARG_set_short_address_address+1 
	CALL        _set_short_address+0, 0
;RF_Init_Routines.c,103 :: 		set_PAN_ID(PAN_ID_1);                     // Set PAN_ID
	MOVLW       _PAN_ID_1+0
	MOVWF       FARG_set_PAN_ID_address+0 
	MOVLW       hi_addr(_PAN_ID_1+0)
	MOVWF       FARG_set_PAN_ID_address+1 
	CALL        _set_PAN_ID+0, 0
;RF_Init_Routines.c,105 :: 		init_ZIGBEE_nonbeacon();                  // Initialize ZigBee module
	CALL        _init_ZIGBEE_nonbeacon+0, 0
;RF_Init_Routines.c,106 :: 		nonbeacon_PAN_coordinator_device();
	CALL        _nonbeacon_PAN_coordinator_device+0, 0
;RF_Init_Routines.c,107 :: 		set_TX_power(31);                         // Set max TX power
	MOVLW       31
	MOVWF       FARG_set_TX_power_power+0 
	CALL        _set_TX_power+0, 0
;RF_Init_Routines.c,108 :: 		set_frame_format_filter(1);               // 1 all frames, 3 data frame only
	MOVLW       1
	MOVWF       FARG_set_frame_format_filter_fff_mode+0 
	CALL        _set_frame_format_filter+0, 0
;RF_Init_Routines.c,109 :: 		set_reception_mode(1);                    // 1 normal mode
	MOVLW       1
	MOVWF       FARG_set_reception_mode_r_mode+0 
	CALL        _set_reception_mode+0, 0
;RF_Init_Routines.c,111 :: 		pin_wake();                               // Wake from pin
	CALL        _pin_wake+0, 0
;RF_Init_Routines.c,112 :: 		}
L_end_RF_Initialize:
	RETURN      0
; end of _RF_Initialize
