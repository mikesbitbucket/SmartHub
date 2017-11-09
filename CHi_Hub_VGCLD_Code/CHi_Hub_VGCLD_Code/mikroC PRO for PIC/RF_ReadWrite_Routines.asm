
_write_ZIGBEE_short:

;RF_ReadWrite_Routines.c,26 :: 		void write_ZIGBEE_short(short int address, short int data_r) {
;RF_ReadWrite_Routines.c,27 :: 		CS = 0;
	BCF         CS+0, BitPos(CS+0) 
;RF_ReadWrite_Routines.c,29 :: 		address = ((address << 1) & 0b01111111) | 0x01; // calculating addressing mode
	MOVF        FARG_write_ZIGBEE_short_address+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVLW       127
	ANDWF       R0, 1 
	BSF         R0, 0 
	MOVF        R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_address+0 
;RF_ReadWrite_Routines.c,30 :: 		SPI1_Write(address);       // addressing register
	MOVF        R0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;RF_ReadWrite_Routines.c,31 :: 		SPI1_Write(data_r);        // write data in register
	MOVF        FARG_write_ZIGBEE_short_data_r+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;RF_ReadWrite_Routines.c,33 :: 		CS = 1;
	BSF         CS+0, BitPos(CS+0) 
;RF_ReadWrite_Routines.c,34 :: 		}
L_end_write_ZIGBEE_short:
	RETURN      0
; end of _write_ZIGBEE_short

_read_ZIGBEE_short:

;RF_ReadWrite_Routines.c,37 :: 		short int read_ZIGBEE_short(short int address) {
;RF_ReadWrite_Routines.c,38 :: 		short int data_r = 0, dummy_data_r = 0;
	CLRF        read_ZIGBEE_short_dummy_data_r_L0+0 
;RF_ReadWrite_Routines.c,40 :: 		CS = 0;
	BCF         CS+0, BitPos(CS+0) 
;RF_ReadWrite_Routines.c,42 :: 		address = (address << 1) & 0b01111110;      // calculating addressing mode
	MOVF        FARG_read_ZIGBEE_short_address+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVLW       126
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       FARG_read_ZIGBEE_short_address+0 
;RF_ReadWrite_Routines.c,43 :: 		SPI1_Write(address);                        // addressing register
	MOVF        R0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;RF_ReadWrite_Routines.c,44 :: 		data_r = SPI1_Read(dummy_data_r);           // read data from register
	MOVF        read_ZIGBEE_short_dummy_data_r_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
;RF_ReadWrite_Routines.c,46 :: 		CS = 1;
	BSF         CS+0, BitPos(CS+0) 
;RF_ReadWrite_Routines.c,47 :: 		return data_r;
;RF_ReadWrite_Routines.c,48 :: 		}
L_end_read_ZIGBEE_short:
	RETURN      0
; end of _read_ZIGBEE_short

_write_ZIGBEE_long:

;RF_ReadWrite_Routines.c,54 :: 		void write_ZIGBEE_long(int address, short int data_r) {
;RF_ReadWrite_Routines.c,55 :: 		short int address_high = 0, address_low = 0;
	CLRF        write_ZIGBEE_long_address_low_L0+0 
;RF_ReadWrite_Routines.c,57 :: 		CS = 0;
	BCF         CS+0, BitPos(CS+0) 
;RF_ReadWrite_Routines.c,59 :: 		address_high = (((short int)(address >> 3)) & 0b01111111) | 0x80;  // calculating addressing mode
	MOVLW       3
	MOVWF       R2 
	MOVF        FARG_write_ZIGBEE_long_address+0, 0 
	MOVWF       R0 
	MOVF        FARG_write_ZIGBEE_long_address+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__write_ZIGBEE_long17:
	BZ          L__write_ZIGBEE_long18
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	ADDLW       255
	GOTO        L__write_ZIGBEE_long17
L__write_ZIGBEE_long18:
	MOVLW       127
	ANDWF       R0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	BSF         FARG_SPI1_Write_data_+0, 7 
;RF_ReadWrite_Routines.c,60 :: 		address_low  = (((short int)(address << 5)) & 0b11100000) | 0x10;  // calculating addressing mode
	MOVLW       5
	MOVWF       R0 
	MOVF        FARG_write_ZIGBEE_long_address+0, 0 
	MOVWF       write_ZIGBEE_long_address_low_L0+0 
	MOVF        R0, 0 
L__write_ZIGBEE_long19:
	BZ          L__write_ZIGBEE_long20
	RLCF        write_ZIGBEE_long_address_low_L0+0, 1 
	BCF         write_ZIGBEE_long_address_low_L0+0, 0 
	ADDLW       255
	GOTO        L__write_ZIGBEE_long19
L__write_ZIGBEE_long20:
	MOVLW       224
	ANDWF       write_ZIGBEE_long_address_low_L0+0, 1 
	BSF         write_ZIGBEE_long_address_low_L0+0, 4 
;RF_ReadWrite_Routines.c,61 :: 		SPI1_Write(address_high);           // addressing register
	CALL        _SPI1_Write+0, 0
;RF_ReadWrite_Routines.c,62 :: 		SPI1_Write(address_low);            // addressing register
	MOVF        write_ZIGBEE_long_address_low_L0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;RF_ReadWrite_Routines.c,63 :: 		SPI1_Write(data_r);                 // write data in registerr
	MOVF        FARG_write_ZIGBEE_long_data_r+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;RF_ReadWrite_Routines.c,65 :: 		CS = 1;
	BSF         CS+0, BitPos(CS+0) 
;RF_ReadWrite_Routines.c,66 :: 		}
L_end_write_ZIGBEE_long:
	RETURN      0
; end of _write_ZIGBEE_long

_read_ZIGBEE_long:

;RF_ReadWrite_Routines.c,69 :: 		short int read_ZIGBEE_long(int address) {
;RF_ReadWrite_Routines.c,70 :: 		short int data_r = 0, dummy_data_r = 0;
	CLRF        read_ZIGBEE_long_dummy_data_r_L0+0 
	CLRF        read_ZIGBEE_long_address_low_L0+0 
;RF_ReadWrite_Routines.c,73 :: 		CS = 0;
	BCF         CS+0, BitPos(CS+0) 
;RF_ReadWrite_Routines.c,75 :: 		address_high = ((short int)(address >> 3) & 0b01111111) | 0x80;  //calculating addressing mode
	MOVLW       3
	MOVWF       R2 
	MOVF        FARG_read_ZIGBEE_long_address+0, 0 
	MOVWF       R0 
	MOVF        FARG_read_ZIGBEE_long_address+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__read_ZIGBEE_long22:
	BZ          L__read_ZIGBEE_long23
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	ADDLW       255
	GOTO        L__read_ZIGBEE_long22
L__read_ZIGBEE_long23:
	MOVLW       127
	ANDWF       R0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	BSF         FARG_SPI1_Write_data_+0, 7 
;RF_ReadWrite_Routines.c,76 :: 		address_low  = ((short int)(address << 5) & 0b11100000);         //calculating addressing mode
	MOVLW       5
	MOVWF       R0 
	MOVF        FARG_read_ZIGBEE_long_address+0, 0 
	MOVWF       read_ZIGBEE_long_address_low_L0+0 
	MOVF        R0, 0 
L__read_ZIGBEE_long24:
	BZ          L__read_ZIGBEE_long25
	RLCF        read_ZIGBEE_long_address_low_L0+0, 1 
	BCF         read_ZIGBEE_long_address_low_L0+0, 0 
	ADDLW       255
	GOTO        L__read_ZIGBEE_long24
L__read_ZIGBEE_long25:
	MOVLW       224
	ANDWF       read_ZIGBEE_long_address_low_L0+0, 1 
;RF_ReadWrite_Routines.c,77 :: 		SPI1_Write(address_high);            // addressing register
	CALL        _SPI1_Write+0, 0
;RF_ReadWrite_Routines.c,78 :: 		SPI1_Write(address_low);             // addressing register
	MOVF        read_ZIGBEE_long_address_low_L0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;RF_ReadWrite_Routines.c,79 :: 		data_r = SPI1_Read(dummy_data_r);    // read data from register
	MOVF        read_ZIGBEE_long_dummy_data_r_L0+0, 0 
	MOVWF       FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
;RF_ReadWrite_Routines.c,81 :: 		CS = 1;
	BSF         CS+0, BitPos(CS+0) 
;RF_ReadWrite_Routines.c,82 :: 		return data_r;
;RF_ReadWrite_Routines.c,83 :: 		}
L_end_read_ZIGBEE_long:
	RETURN      0
; end of _read_ZIGBEE_long

_start_transmit:

;RF_ReadWrite_Routines.c,88 :: 		void start_transmit() {
;RF_ReadWrite_Routines.c,89 :: 		short int temp = 0;
;RF_ReadWrite_Routines.c,91 :: 		temp = read_ZIGBEE_short(TXNCON);
	MOVLW       27
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_ReadWrite_Routines.c,92 :: 		temp = temp | 0x01;                 // mask for start transmit
	MOVLW       1
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_ReadWrite_Routines.c,93 :: 		write_ZIGBEE_short(TXNCON, temp);
	MOVLW       27
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_ReadWrite_Routines.c,94 :: 		}
L_end_start_transmit:
	RETURN      0
; end of _start_transmit

_read_RX_FIFO:

;RF_ReadWrite_Routines.c,99 :: 		void read_RX_FIFO() {
;RF_ReadWrite_Routines.c,100 :: 		unsigned short int temp = 0;
;RF_ReadWrite_Routines.c,101 :: 		int i = 0;
	CLRF        read_RX_FIFO_i_L0+0 
	CLRF        read_RX_FIFO_i_L0+1 
;RF_ReadWrite_Routines.c,103 :: 		temp = read_ZIGBEE_short(BBREG1);      // disable receiving packets off air.
	MOVLW       57
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_ReadWrite_Routines.c,104 :: 		temp = temp | 0x04;                    // mask for disable receiving packets
	MOVLW       4
	IORWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_ReadWrite_Routines.c,105 :: 		write_ZIGBEE_short(BBREG1, temp);
	MOVLW       57
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_ReadWrite_Routines.c,107 :: 		for(i=0; i<128; i++) {
	CLRF        read_RX_FIFO_i_L0+0 
	CLRF        read_RX_FIFO_i_L0+1 
L_read_RX_FIFO0:
	MOVLW       128
	XORWF       read_RX_FIFO_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__read_RX_FIFO28
	MOVLW       128
	SUBWF       read_RX_FIFO_i_L0+0, 0 
L__read_RX_FIFO28:
	BTFSC       STATUS+0, 0 
	GOTO        L_read_RX_FIFO1
;RF_ReadWrite_Routines.c,108 :: 		if(i <  (1 + DATA_LENGHT + HEADER_LENGHT + 2 + 1 + 1))
	MOVLW       128
	XORWF       read_RX_FIFO_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__read_RX_FIFO29
	MOVLW       23
	SUBWF       read_RX_FIFO_i_L0+0, 0 
L__read_RX_FIFO29:
	BTFSC       STATUS+0, 0 
	GOTO        L_read_RX_FIFO3
;RF_ReadWrite_Routines.c,109 :: 		data_RX_FIFO[i] = read_ZIGBEE_long(address_RX_FIFO + i);  // reading valid data from RX FIFO
	MOVLW       _data_RX_FIFO+0
	ADDWF       read_RX_FIFO_i_L0+0, 0 
	MOVWF       FLOC__read_RX_FIFO+0 
	MOVLW       hi_addr(_data_RX_FIFO+0)
	ADDWFC      read_RX_FIFO_i_L0+1, 0 
	MOVWF       FLOC__read_RX_FIFO+1 
	MOVF        read_RX_FIFO_i_L0+0, 0 
	ADDWF       _address_RX_FIFO+0, 0 
	MOVWF       FARG_read_ZIGBEE_long_address+0 
	MOVF        read_RX_FIFO_i_L0+1, 0 
	ADDWFC      _address_RX_FIFO+1, 0 
	MOVWF       FARG_read_ZIGBEE_long_address+1 
	CALL        _read_ZIGBEE_long+0, 0
	MOVFF       FLOC__read_RX_FIFO+0, FSR1
	MOVFF       FLOC__read_RX_FIFO+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
L_read_RX_FIFO3:
;RF_ReadWrite_Routines.c,110 :: 		if(i >= (1 + DATA_LENGHT + HEADER_LENGHT + 2 + 1 + 1))
	MOVLW       128
	XORWF       read_RX_FIFO_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__read_RX_FIFO30
	MOVLW       23
	SUBWF       read_RX_FIFO_i_L0+0, 0 
L__read_RX_FIFO30:
	BTFSS       STATUS+0, 0 
	GOTO        L_read_RX_FIFO4
;RF_ReadWrite_Routines.c,111 :: 		lost_data = read_ZIGBEE_long(address_RX_FIFO + i);        // reading invalid data from RX FIFO
	MOVF        read_RX_FIFO_i_L0+0, 0 
	ADDWF       _address_RX_FIFO+0, 0 
	MOVWF       FARG_read_ZIGBEE_long_address+0 
	MOVF        read_RX_FIFO_i_L0+1, 0 
	ADDWFC      _address_RX_FIFO+1, 0 
	MOVWF       FARG_read_ZIGBEE_long_address+1 
	CALL        _read_ZIGBEE_long+0, 0
	MOVF        R0, 0 
	MOVWF       _lost_data+0 
L_read_RX_FIFO4:
;RF_ReadWrite_Routines.c,107 :: 		for(i=0; i<128; i++) {
	INFSNZ      read_RX_FIFO_i_L0+0, 1 
	INCF        read_RX_FIFO_i_L0+1, 1 
;RF_ReadWrite_Routines.c,112 :: 		}
	GOTO        L_read_RX_FIFO0
L_read_RX_FIFO1:
;RF_ReadWrite_Routines.c,114 :: 		DATA_RX[0] = data_RX_FIFO[HEADER_LENGHT + 1];               // coping valid data
	MOVF        _data_RX_FIFO+18, 0 
	MOVWF       _DATA_RX+0 
;RF_ReadWrite_Routines.c,115 :: 		DATA_RX[1] = data_RX_FIFO[HEADER_LENGHT + 2];               // coping valid data
	MOVF        _data_RX_FIFO+19, 0 
	MOVWF       _DATA_RX+1 
;RF_ReadWrite_Routines.c,116 :: 		DATA_RX[2] = data_RX_FIFO[HEADER_LENGHT + 3];               // coping valid data
	MOVF        _data_RX_FIFO+20, 0 
	MOVWF       _DATA_RX+2 
;RF_ReadWrite_Routines.c,117 :: 		LQI   = data_RX_FIFO[1 + HEADER_LENGHT + DATA_LENGHT + 2];  // coping valid data
	MOVF        _data_RX_FIFO+21, 0 
	MOVWF       _LQI+0 
;RF_ReadWrite_Routines.c,118 :: 		RSSI2 = data_RX_FIFO[1 + HEADER_LENGHT + DATA_LENGHT + 3];  // coping valid data
	MOVF        _data_RX_FIFO+22, 0 
	MOVWF       _RSSI2+0 
;RF_ReadWrite_Routines.c,120 :: 		temp = read_ZIGBEE_short(BBREG1);      // enable receiving packets off air.
	MOVLW       57
	MOVWF       FARG_read_ZIGBEE_short_address+0 
	CALL        _read_ZIGBEE_short+0, 0
;RF_ReadWrite_Routines.c,121 :: 		temp = temp & (!0x04);                 // mask for enable receiving
	MOVLW       0
	ANDWF       R0, 0 
	MOVWF       FARG_write_ZIGBEE_short_data_r+0 
;RF_ReadWrite_Routines.c,122 :: 		write_ZIGBEE_short(BBREG1, temp);
	MOVLW       57
	MOVWF       FARG_write_ZIGBEE_short_address+0 
	CALL        _write_ZIGBEE_short+0, 0
;RF_ReadWrite_Routines.c,123 :: 		}
L_end_read_RX_FIFO:
	RETURN      0
; end of _read_RX_FIFO

_write_TX_normal_FIFO:

;RF_ReadWrite_Routines.c,125 :: 		void write_TX_normal_FIFO() {
;RF_ReadWrite_Routines.c,126 :: 		int i = 0;
	CLRF        write_TX_normal_FIFO_i_L0+0 
	CLRF        write_TX_normal_FIFO_i_L0+1 
;RF_ReadWrite_Routines.c,128 :: 		data_TX_normal_FIFO[0]  = 17;        // was 11 - long address on source adds 6 bytes
	MOVLW       17
	MOVWF       _data_TX_normal_FIFO+0 
;RF_ReadWrite_Routines.c,129 :: 		data_TX_normal_FIFO[1]  = 18; // was: HEADER_LENGHT + DATA_LENGHT;
	MOVLW       18
	MOVWF       _data_TX_normal_FIFO+1 
;RF_ReadWrite_Routines.c,130 :: 		data_TX_normal_FIFO[2]  = 0x01;                        // control frame
	MOVLW       1
	MOVWF       _data_TX_normal_FIFO+2 
;RF_ReadWrite_Routines.c,131 :: 		data_TX_normal_FIFO[3]  = 0xC8;         // Was 0x88 - both addresses short
	MOVLW       200
	MOVWF       _data_TX_normal_FIFO+3 
;RF_ReadWrite_Routines.c,132 :: 		data_TX_normal_FIFO[4]  = SEQ_NUMBER++;                  // sequence number Mike
	MOVF        _SEQ_NUMBER+0, 0 
	MOVWF       _data_TX_normal_FIFO+4 
	INCF        _SEQ_NUMBER+0, 1 
;RF_ReadWrite_Routines.c,133 :: 		data_TX_normal_FIFO[5]  = PAN_ID_2[0];                 // destination pan
	MOVF        _PAN_ID_2+0, 0 
	MOVWF       _data_TX_normal_FIFO+5 
;RF_ReadWrite_Routines.c,134 :: 		data_TX_normal_FIFO[6]  = PAN_ID_2[1];
	MOVF        _PAN_ID_2+1, 0 
	MOVWF       _data_TX_normal_FIFO+6 
;RF_ReadWrite_Routines.c,135 :: 		data_TX_normal_FIFO[7]  = Dest_Address_short[0];          // destination address
	MOVF        _Dest_Address_short+0, 0 
	MOVWF       _data_TX_normal_FIFO+7 
;RF_ReadWrite_Routines.c,136 :: 		data_TX_normal_FIFO[8]  = Dest_Address_short[1];
	MOVF        _Dest_Address_short+1, 0 
	MOVWF       _data_TX_normal_FIFO+8 
;RF_ReadWrite_Routines.c,137 :: 		data_TX_normal_FIFO[9]  = PAN_ID_1[0];                 // source pan
	MOVF        _PAN_ID_1+0, 0 
	MOVWF       _data_TX_normal_FIFO+9 
;RF_ReadWrite_Routines.c,138 :: 		data_TX_normal_FIFO[10] = PAN_ID_1[1];
	MOVF        _PAN_ID_1+1, 0 
	MOVWF       _data_TX_normal_FIFO+10 
;RF_ReadWrite_Routines.c,139 :: 		data_TX_normal_FIFO[11] = ADDRESS_long_1[0];          // source address
	MOVF        _ADDRESS_long_1+0, 0 
	MOVWF       _data_TX_normal_FIFO+11 
;RF_ReadWrite_Routines.c,140 :: 		data_TX_normal_FIFO[12] = ADDRESS_long_1[1];
	MOVF        _ADDRESS_long_1+1, 0 
	MOVWF       _data_TX_normal_FIFO+12 
;RF_ReadWrite_Routines.c,141 :: 		data_TX_normal_FIFO[13] = ADDRESS_long_1[2];
	MOVF        _ADDRESS_long_1+2, 0 
	MOVWF       _data_TX_normal_FIFO+13 
;RF_ReadWrite_Routines.c,142 :: 		data_TX_normal_FIFO[14] = ADDRESS_long_1[3];
	MOVF        _ADDRESS_long_1+3, 0 
	MOVWF       _data_TX_normal_FIFO+14 
;RF_ReadWrite_Routines.c,143 :: 		data_TX_normal_FIFO[15] = ADDRESS_long_1[4];
	MOVF        _ADDRESS_long_1+4, 0 
	MOVWF       _data_TX_normal_FIFO+15 
;RF_ReadWrite_Routines.c,144 :: 		data_TX_normal_FIFO[16] = ADDRESS_long_1[5];
	MOVF        _ADDRESS_long_1+5, 0 
	MOVWF       _data_TX_normal_FIFO+16 
;RF_ReadWrite_Routines.c,145 :: 		data_TX_normal_FIFO[17] = ADDRESS_long_1[6];
	MOVF        _ADDRESS_long_1+6, 0 
	MOVWF       _data_TX_normal_FIFO+17 
;RF_ReadWrite_Routines.c,146 :: 		data_TX_normal_FIFO[18] = ADDRESS_long_1[7];
	MOVF        _ADDRESS_long_1+7, 0 
	MOVWF       _data_TX_normal_FIFO+18 
;RF_ReadWrite_Routines.c,149 :: 		data_TX_normal_FIFO[19] = DATA_TX[0];                  // data
	MOVF        _DATA_TX+0, 0 
	MOVWF       _data_TX_normal_FIFO+19 
;RF_ReadWrite_Routines.c,169 :: 		for(i = 0; i < (20); i++) {
	CLRF        write_TX_normal_FIFO_i_L0+0 
	CLRF        write_TX_normal_FIFO_i_L0+1 
L_write_TX_normal_FIFO5:
	MOVLW       128
	XORWF       write_TX_normal_FIFO_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__write_TX_normal_FIFO32
	MOVLW       20
	SUBWF       write_TX_normal_FIFO_i_L0+0, 0 
L__write_TX_normal_FIFO32:
	BTFSC       STATUS+0, 0 
	GOTO        L_write_TX_normal_FIFO6
;RF_ReadWrite_Routines.c,170 :: 		write_ZIGBEE_long(address_TX_normal_FIFO + i, data_TX_normal_FIFO[i]); // write frame into normal FIFO
	MOVF        write_TX_normal_FIFO_i_L0+0, 0 
	ADDWF       _address_TX_normal_FIFO+0, 0 
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVF        write_TX_normal_FIFO_i_L0+1, 0 
	ADDWFC      _address_TX_normal_FIFO+1, 0 
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       _data_TX_normal_FIFO+0
	ADDWF       write_TX_normal_FIFO_i_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_data_TX_normal_FIFO+0)
	ADDWFC      write_TX_normal_FIFO_i_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_ReadWrite_Routines.c,169 :: 		for(i = 0; i < (20); i++) {
	INFSNZ      write_TX_normal_FIFO_i_L0+0, 1 
	INCF        write_TX_normal_FIFO_i_L0+1, 1 
;RF_ReadWrite_Routines.c,171 :: 		}
	GOTO        L_write_TX_normal_FIFO5
L_write_TX_normal_FIFO6:
;RF_ReadWrite_Routines.c,173 :: 		set_not_ACK();
	CALL        _set_not_ACK+0, 0
;RF_ReadWrite_Routines.c,174 :: 		set_not_encrypt();
	CALL        _set_not_encrypt+0, 0
;RF_ReadWrite_Routines.c,175 :: 		start_transmit();
	CALL        _start_transmit+0, 0
;RF_ReadWrite_Routines.c,176 :: 		}
L_end_write_TX_normal_FIFO:
	RETURN      0
; end of _write_TX_normal_FIFO

_write_TX_normal_FIFO_variable:

;RF_ReadWrite_Routines.c,178 :: 		void write_TX_normal_FIFO_variable() {
;RF_ReadWrite_Routines.c,179 :: 		char i = 0;
	CLRF        write_TX_normal_FIFO_variable_i_L0+0 
;RF_ReadWrite_Routines.c,181 :: 		data_TX_normal_FIFO[0]  = 17;        // was 11 - long address on source adds 6 bytes
	MOVLW       17
	MOVWF       _data_TX_normal_FIFO+0 
;RF_ReadWrite_Routines.c,182 :: 		data_TX_normal_FIFO[1]  = 17 + Data_buf[0]; // This byte holds the # of data bytes
	MOVF        _Data_buf+0, 0 
	ADDLW       17
	MOVWF       _data_TX_normal_FIFO+1 
;RF_ReadWrite_Routines.c,183 :: 		data_TX_normal_FIFO[2]  = 0x01;                        // control frame
	MOVLW       1
	MOVWF       _data_TX_normal_FIFO+2 
;RF_ReadWrite_Routines.c,184 :: 		data_TX_normal_FIFO[3]  = 0xC8;         // Was 0x88 - both addresses short
	MOVLW       200
	MOVWF       _data_TX_normal_FIFO+3 
;RF_ReadWrite_Routines.c,185 :: 		data_TX_normal_FIFO[4]  = SEQ_NUMBER++;                  // sequence number Mike
	MOVF        _SEQ_NUMBER+0, 0 
	MOVWF       _data_TX_normal_FIFO+4 
	INCF        _SEQ_NUMBER+0, 1 
;RF_ReadWrite_Routines.c,186 :: 		data_TX_normal_FIFO[5]  = PAN_ID_2[0];                 // destination pan
	MOVF        _PAN_ID_2+0, 0 
	MOVWF       _data_TX_normal_FIFO+5 
;RF_ReadWrite_Routines.c,187 :: 		data_TX_normal_FIFO[6]  = PAN_ID_2[1];
	MOVF        _PAN_ID_2+1, 0 
	MOVWF       _data_TX_normal_FIFO+6 
;RF_ReadWrite_Routines.c,188 :: 		data_TX_normal_FIFO[7]  = Dest_Address_short[0];          // destination address
	MOVF        _Dest_Address_short+0, 0 
	MOVWF       _data_TX_normal_FIFO+7 
;RF_ReadWrite_Routines.c,189 :: 		data_TX_normal_FIFO[8]  = Dest_Address_short[1];
	MOVF        _Dest_Address_short+1, 0 
	MOVWF       _data_TX_normal_FIFO+8 
;RF_ReadWrite_Routines.c,190 :: 		data_TX_normal_FIFO[9]  = PAN_ID_1[0];                 // source pan
	MOVF        _PAN_ID_1+0, 0 
	MOVWF       _data_TX_normal_FIFO+9 
;RF_ReadWrite_Routines.c,191 :: 		data_TX_normal_FIFO[10] = PAN_ID_1[1];
	MOVF        _PAN_ID_1+1, 0 
	MOVWF       _data_TX_normal_FIFO+10 
;RF_ReadWrite_Routines.c,192 :: 		data_TX_normal_FIFO[11] = ADDRESS_long_1[0];          // source address
	MOVF        _ADDRESS_long_1+0, 0 
	MOVWF       _data_TX_normal_FIFO+11 
;RF_ReadWrite_Routines.c,193 :: 		data_TX_normal_FIFO[12] = ADDRESS_long_1[1];
	MOVF        _ADDRESS_long_1+1, 0 
	MOVWF       _data_TX_normal_FIFO+12 
;RF_ReadWrite_Routines.c,194 :: 		data_TX_normal_FIFO[13] = ADDRESS_long_1[2];
	MOVF        _ADDRESS_long_1+2, 0 
	MOVWF       _data_TX_normal_FIFO+13 
;RF_ReadWrite_Routines.c,195 :: 		data_TX_normal_FIFO[14] = ADDRESS_long_1[3];
	MOVF        _ADDRESS_long_1+3, 0 
	MOVWF       _data_TX_normal_FIFO+14 
;RF_ReadWrite_Routines.c,196 :: 		data_TX_normal_FIFO[15] = ADDRESS_long_1[4];
	MOVF        _ADDRESS_long_1+4, 0 
	MOVWF       _data_TX_normal_FIFO+15 
;RF_ReadWrite_Routines.c,197 :: 		data_TX_normal_FIFO[16] = ADDRESS_long_1[5];
	MOVF        _ADDRESS_long_1+5, 0 
	MOVWF       _data_TX_normal_FIFO+16 
;RF_ReadWrite_Routines.c,198 :: 		data_TX_normal_FIFO[17] = ADDRESS_long_1[6];
	MOVF        _ADDRESS_long_1+6, 0 
	MOVWF       _data_TX_normal_FIFO+17 
;RF_ReadWrite_Routines.c,199 :: 		data_TX_normal_FIFO[18] = ADDRESS_long_1[7];
	MOVF        _ADDRESS_long_1+7, 0 
	MOVWF       _data_TX_normal_FIFO+18 
;RF_ReadWrite_Routines.c,201 :: 		for(i=1; i<=Data_buf[0]; i++)  //setting dat_buf[0]=2 for 2 data bytes, loops 2 times
	MOVLW       1
	MOVWF       write_TX_normal_FIFO_variable_i_L0+0 
L_write_TX_normal_FIFO_variable8:
	MOVF        write_TX_normal_FIFO_variable_i_L0+0, 0 
	SUBWF       _Data_buf+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_write_TX_normal_FIFO_variable9
;RF_ReadWrite_Routines.c,203 :: 		data_TX_normal_FIFO[18+i] = Data_buf[i];
	MOVF        write_TX_normal_FIFO_variable_i_L0+0, 0 
	ADDLW       18
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _data_TX_normal_FIFO+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_data_TX_normal_FIFO+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       _Data_buf+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_Data_buf+0)
	MOVWF       FSR0H 
	MOVF        write_TX_normal_FIFO_variable_i_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;RF_ReadWrite_Routines.c,201 :: 		for(i=1; i<=Data_buf[0]; i++)  //setting dat_buf[0]=2 for 2 data bytes, loops 2 times
	INCF        write_TX_normal_FIFO_variable_i_L0+0, 1 
;RF_ReadWrite_Routines.c,204 :: 		}
	GOTO        L_write_TX_normal_FIFO_variable8
L_write_TX_normal_FIFO_variable9:
;RF_ReadWrite_Routines.c,209 :: 		for(i = 0; i < (19 + Data_buf[0]); i++) {   // Min frame with 1 data byte is 20 bytes to be written out
	CLRF        write_TX_normal_FIFO_variable_i_L0+0 
L_write_TX_normal_FIFO_variable11:
	MOVF        _Data_buf+0, 0 
	ADDLW       19
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	ADDWFC      R2, 1 
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__write_TX_normal_FIFO_variable34
	MOVF        R1, 0 
	SUBWF       write_TX_normal_FIFO_variable_i_L0+0, 0 
L__write_TX_normal_FIFO_variable34:
	BTFSC       STATUS+0, 0 
	GOTO        L_write_TX_normal_FIFO_variable12
;RF_ReadWrite_Routines.c,210 :: 		write_ZIGBEE_long(address_TX_normal_FIFO + i, data_TX_normal_FIFO[i]); // write frame into normal FIFO
	MOVF        write_TX_normal_FIFO_variable_i_L0+0, 0 
	ADDWF       _address_TX_normal_FIFO+0, 0 
	MOVWF       FARG_write_ZIGBEE_long_address+0 
	MOVLW       0
	ADDWFC      _address_TX_normal_FIFO+1, 0 
	MOVWF       FARG_write_ZIGBEE_long_address+1 
	MOVLW       _data_TX_normal_FIFO+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_data_TX_normal_FIFO+0)
	MOVWF       FSR0H 
	MOVF        write_TX_normal_FIFO_variable_i_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_write_ZIGBEE_long_data_r+0 
	CALL        _write_ZIGBEE_long+0, 0
;RF_ReadWrite_Routines.c,209 :: 		for(i = 0; i < (19 + Data_buf[0]); i++) {   // Min frame with 1 data byte is 20 bytes to be written out
	INCF        write_TX_normal_FIFO_variable_i_L0+0, 1 
;RF_ReadWrite_Routines.c,211 :: 		}
	GOTO        L_write_TX_normal_FIFO_variable11
L_write_TX_normal_FIFO_variable12:
;RF_ReadWrite_Routines.c,213 :: 		set_not_ACK();
	CALL        _set_not_ACK+0, 0
;RF_ReadWrite_Routines.c,214 :: 		set_not_encrypt();
	CALL        _set_not_encrypt+0, 0
;RF_ReadWrite_Routines.c,215 :: 		start_transmit();
	CALL        _start_transmit+0, 0
;RF_ReadWrite_Routines.c,216 :: 		}
L_end_write_TX_normal_FIFO_variable:
	RETURN      0
; end of _write_TX_normal_FIFO_variable
