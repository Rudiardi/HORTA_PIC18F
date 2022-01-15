
_main:

;MyProject.c,35 :: 		void main()
;MyProject.c,39 :: 		double a = 0.0011303,
	MOVLW       147
	MOVWF       main_a_L0+0 
	MOVLW       38
	MOVWF       main_a_L0+1 
	MOVLW       20
	MOVWF       main_a_L0+2 
	MOVLW       117
	MOVWF       main_a_L0+3 
	MOVLW       14
	MOVWF       main_b_L0+0 
	MOVLW       67
	MOVWF       main_b_L0+1 
	MOVLW       117
	MOVWF       main_b_L0+2 
	MOVLW       114
	MOVWF       main_b_L0+3 
	MOVLW       220
	MOVWF       main_c_L0+0 
	MOVLW       84
	MOVWF       main_c_L0+1 
	MOVLW       62
	MOVWF       main_c_L0+2 
	MOVLW       103
	MOVWF       main_c_L0+3 
;MyProject.c,44 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;MyProject.c,45 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;MyProject.c,47 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;MyProject.c,49 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,51 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,53 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,55 :: 		Lcd_Out(1, 1, "controle auto");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,56 :: 		Lcd_Out(2, 1, "de irrigação");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,57 :: 		delay_ms(2000);
	MOVLW       102
	MOVWF       R11, 0
	MOVLW       118
	MOVWF       R12, 0
	MOVLW       193
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
;MyProject.c,58 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,59 :: 		Lcd_Out(1, 1, "iniciando");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,60 :: 		Lcd_Out(2, 1, "leitura");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,61 :: 		delay_ms(2000);
	MOVLW       102
	MOVWF       R11, 0
	MOVLW       118
	MOVWF       R12, 0
	MOVLW       193
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
;MyProject.c,63 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,65 :: 		while(1)
L_main2:
;MyProject.c,68 :: 		CMCON  = 0x07;
	MOVLW       7
	MOVWF       CMCON+0 
;MyProject.c,70 :: 		ADCON0 = 0x01;
	MOVLW       1
	MOVWF       ADCON0+0 
;MyProject.c,73 :: 		sensortemp=Adc_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _sensortemp+0 
	MOVF        R1, 0 
	MOVWF       _sensortemp+1 
	MOVF        R2, 0 
	MOVWF       _sensortemp+2 
	MOVF        R3, 0 
	MOVWF       _sensortemp+3 
;MyProject.c,74 :: 		sensortemp*=5;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _sensortemp+0 
	MOVF        R1, 0 
	MOVWF       _sensortemp+1 
	MOVF        R2, 0 
	MOVWF       _sensortemp+2 
	MOVF        R3, 0 
	MOVWF       _sensortemp+3 
;MyProject.c,75 :: 		sensortemp/=1023;
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _sensortemp+0 
	MOVF        R1, 0 
	MOVWF       _sensortemp+1 
	MOVF        R2, 0 
	MOVWF       _sensortemp+2 
	MOVF        R3, 0 
	MOVWF       _sensortemp+3 
;MyProject.c,77 :: 		rntc=33000/sensortemp;
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       232
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       142
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _rntc+0 
	MOVF        R1, 0 
	MOVWF       _rntc+1 
	MOVF        R2, 0 
	MOVWF       _rntc+2 
	MOVF        R3, 0 
	MOVWF       _rntc+3 
;MyProject.c,78 :: 		rntc=rntc-10000;
	MOVLW       0
	MOVWF       R4 
	MOVLW       64
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       140
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _rntc+0 
	MOVF        R1, 0 
	MOVWF       _rntc+1 
	MOVF        R2, 0 
	MOVWF       _rntc+2 
	MOVF        R3, 0 
	MOVWF       _rntc+3 
;MyProject.c,79 :: 		b1=log(rntc);
	MOVF        R0, 0 
	MOVWF       FARG_log_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_log_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_log_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_log_x+3 
	CALL        _log+0, 0
	MOVF        R0, 0 
	MOVWF       main_b1_L0+0 
	MOVF        R1, 0 
	MOVWF       main_b1_L0+1 
	MOVF        R2, 0 
	MOVWF       main_b1_L0+2 
	MOVF        R3, 0 
	MOVWF       main_b1_L0+3 
;MyProject.c,80 :: 		b1=b1*b;               //b*LN(RNTC)
	MOVF        main_b_L0+0, 0 
	MOVWF       R4 
	MOVF        main_b_L0+1, 0 
	MOVWF       R5 
	MOVF        main_b_L0+2, 0 
	MOVWF       R6 
	MOVF        main_b_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       main_b1_L0+0 
	MOVF        R1, 0 
	MOVWF       main_b1_L0+1 
	MOVF        R2, 0 
	MOVWF       main_b1_L0+2 
	MOVF        R3, 0 
	MOVWF       main_b1_L0+3 
;MyProject.c,81 :: 		c1=log(rntc);          //LN(RNTC)
	MOVF        _rntc+0, 0 
	MOVWF       FARG_log_x+0 
	MOVF        _rntc+1, 0 
	MOVWF       FARG_log_x+1 
	MOVF        _rntc+2, 0 
	MOVWF       FARG_log_x+2 
	MOVF        _rntc+3, 0 
	MOVWF       FARG_log_x+3 
	CALL        _log+0, 0
;MyProject.c,82 :: 		c1=pow(c1,3);          //LN(RNTC)^3
	MOVF        R0, 0 
	MOVWF       FARG_pow_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_pow_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_pow_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_pow_x+3 
	MOVLW       0
	MOVWF       FARG_pow_y+0 
	MOVLW       0
	MOVWF       FARG_pow_y+1 
	MOVLW       64
	MOVWF       FARG_pow_y+2 
	MOVLW       128
	MOVWF       FARG_pow_y+3 
	CALL        _pow+0, 0
;MyProject.c,83 :: 		c1=c1*c;               //c*(LN(RNTC)^3)
	MOVF        main_c_L0+0, 0 
	MOVWF       R4 
	MOVF        main_c_L0+1, 0 
	MOVWF       R5 
	MOVF        main_c_L0+2, 0 
	MOVWF       R6 
	MOVF        main_c_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVF        main_a_L0+0, 0 
	MOVWF       R0 
	MOVF        main_a_L0+1, 0 
	MOVWF       R1 
	MOVF        main_a_L0+2, 0 
	MOVWF       R2 
	MOVF        main_a_L0+3, 0 
	MOVWF       R3 
	MOVF        main_b1_L0+0, 0 
	MOVWF       R4 
	MOVF        main_b1_L0+1, 0 
	MOVWF       R5 
	MOVF        main_b1_L0+2, 0 
	MOVWF       R6 
	MOVF        main_b1_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
;MyProject.c,84 :: 		temp=a+b1+c1;          //a+b*LN(RNTC)+c*(LN(RNTC)^3)
	MOVF        FLOC__main+0, 0 
	MOVWF       R4 
	MOVF        FLOC__main+1, 0 
	MOVWF       R5 
	MOVF        FLOC__main+2, 0 
	MOVWF       R6 
	MOVF        FLOC__main+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _temp+0 
	MOVF        R1, 0 
	MOVWF       _temp+1 
	MOVF        R2, 0 
	MOVWF       _temp+2 
	MOVF        R3, 0 
	MOVWF       _temp+3 
;MyProject.c,85 :: 		temp=1/temp;           //1/(a+b*LN(RNTC)+c*(LN(RNTC)^3))
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _temp+0 
	MOVF        R1, 0 
	MOVWF       _temp+1 
	MOVF        R2, 0 
	MOVWF       _temp+2 
	MOVF        R3, 0 
	MOVWF       _temp+3 
;MyProject.c,86 :: 		temp=temp-273.15;
	MOVLW       51
	MOVWF       R4 
	MOVLW       147
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _temp+0 
	MOVF        R1, 0 
	MOVWF       _temp+1 
	MOVF        R2, 0 
	MOVWF       _temp+2 
	MOVF        R3, 0 
	MOVWF       _temp+3 
;MyProject.c,87 :: 		temp=74-temp;
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       20
	MOVWF       R2 
	MOVLW       133
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _temp+0 
	MOVF        R1, 0 
	MOVWF       _temp+1 
	MOVF        R2, 0 
	MOVWF       _temp+2 
	MOVF        R3, 0 
	MOVWF       _temp+3 
;MyProject.c,89 :: 		inttostr(temp,txt2);
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt2+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;MyProject.c,90 :: 		Ltrim(txt2);
	MOVLW       _txt2+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;MyProject.c,91 :: 		Lcd_Out(2,3,"");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,92 :: 		Lcd_Out_Cp(&txt2);
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;MyProject.c,95 :: 		source=Adc_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _source+0 
	MOVF        R1, 0 
	MOVWF       _source+1 
	MOVF        R2, 0 
	MOVWF       _source+2 
	MOVF        R3, 0 
	MOVWF       _source+3 
;MyProject.c,96 :: 		hum=Adc_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _hum+0 
	MOVF        R1, 0 
	MOVWF       _hum+1 
	MOVF        R2, 0 
	MOVWF       _hum+2 
	MOVF        R3, 0 
	MOVWF       _hum+3 
;MyProject.c,97 :: 		hum=100*hum;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _hum+0 
	MOVF        R1, 0 
	MOVWF       _hum+1 
	MOVF        R2, 0 
	MOVWF       _hum+2 
	MOVF        R3, 0 
	MOVWF       _hum+3 
;MyProject.c,98 :: 		hum=100-hum/1023;
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       72
	MOVWF       R2 
	MOVLW       133
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _hum+0 
	MOVF        R1, 0 
	MOVWF       _hum+1 
	MOVF        R2, 0 
	MOVWF       _hum+2 
	MOVF        R3, 0 
	MOVWF       _hum+3 
;MyProject.c,100 :: 		inttostr(hum,txt);
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;MyProject.c,101 :: 		Ltrim(txt);
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;MyProject.c,103 :: 		Lcd_Out(1,3,"");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,104 :: 		Lcd_Out_Cp(&txt);
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;MyProject.c,107 :: 		if(source>600 && temp>45)
	MOVF        _source+0, 0 
	MOVWF       R4 
	MOVF        _source+1, 0 
	MOVWF       R5 
	MOVF        _source+2, 0 
	MOVWF       R6 
	MOVF        _source+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       22
	MOVWF       R2 
	MOVLW       136
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
	MOVF        _temp+0, 0 
	MOVWF       R4 
	MOVF        _temp+1, 0 
	MOVWF       R5 
	MOVF        _temp+2, 0 
	MOVWF       R6 
	MOVF        _temp+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
L__main23:
;MyProject.c,110 :: 		PORTB = 0b00110000;
	MOVLW       48
	MOVWF       PORTB+0 
;MyProject.c,111 :: 		delay_ms(500);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
;MyProject.c,112 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,113 :: 		Lcd_Out(1,1,"U:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,114 :: 		Lcd_Out(2,1,"T:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,115 :: 		Lcd_Out(1,12,"SECO");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,116 :: 		Lcd_Out(2,7,"Motor:on");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,117 :: 		}
L_main6:
;MyProject.c,119 :: 		if(source>600 && temp<45)
	MOVF        _source+0, 0 
	MOVWF       R4 
	MOVF        _source+1, 0 
	MOVWF       R5 
	MOVF        _source+2, 0 
	MOVWF       R6 
	MOVF        _source+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       22
	MOVWF       R2 
	MOVLW       136
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	MOVF        _temp+0, 0 
	MOVWF       R0 
	MOVF        _temp+1, 0 
	MOVWF       R1 
	MOVF        _temp+2, 0 
	MOVWF       R2 
	MOVF        _temp+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
L__main22:
;MyProject.c,122 :: 		PORTB = 0b00010000;
	MOVLW       16
	MOVWF       PORTB+0 
;MyProject.c,123 :: 		delay_ms(500);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
;MyProject.c,124 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,125 :: 		Lcd_Out(1,1,"U:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr11_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr11_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,126 :: 		Lcd_Out(2,1,"T:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr12_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr12_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,127 :: 		Lcd_Out(1,12,"SECO");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr13_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr13_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,128 :: 		Lcd_Out(2,7,"Motor:on");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr14_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr14_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,129 :: 		}
L_main10:
;MyProject.c,131 :: 		if(source<=600 && temp>45)
	MOVF        _source+0, 0 
	MOVWF       R4 
	MOVF        _source+1, 0 
	MOVWF       R5 
	MOVF        _source+2, 0 
	MOVWF       R6 
	MOVF        _source+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       22
	MOVWF       R2 
	MOVLW       136
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main14
	MOVF        _temp+0, 0 
	MOVWF       R4 
	MOVF        _temp+1, 0 
	MOVWF       R5 
	MOVF        _temp+2, 0 
	MOVWF       R6 
	MOVF        _temp+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main14
L__main21:
;MyProject.c,134 :: 		PORTB = 0b00100000;
	MOVLW       32
	MOVWF       PORTB+0 
;MyProject.c,135 :: 		delay_ms(500);                  //motor on
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
	NOP
;MyProject.c,136 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,137 :: 		Lcd_Out(1,1,"U:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr15_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr15_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,138 :: 		Lcd_Out(2,1,"T:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr16_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr16_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,139 :: 		Lcd_Out(1,9,"MOLHADO");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr17_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr17_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,140 :: 		Lcd_Out(2,7,"Motor off");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr18_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr18_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,141 :: 		}
L_main14:
;MyProject.c,143 :: 		if(source<=600 && temp<45)
	MOVF        _source+0, 0 
	MOVWF       R4 
	MOVF        _source+1, 0 
	MOVWF       R5 
	MOVF        _source+2, 0 
	MOVWF       R6 
	MOVF        _source+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       22
	MOVWF       R2 
	MOVLW       136
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main18
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	MOVF        _temp+0, 0 
	MOVWF       R0 
	MOVF        _temp+1, 0 
	MOVWF       R1 
	MOVF        _temp+2, 0 
	MOVWF       R2 
	MOVF        _temp+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main18
L__main20:
;MyProject.c,146 :: 		PORTB = 0b00000000;
	CLRF        PORTB+0 
;MyProject.c,147 :: 		delay_ms(500);                  //motor on
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
	NOP
;MyProject.c,148 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,149 :: 		Lcd_Out(1,1,"U:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr19_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr19_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,150 :: 		Lcd_Out(2,1,"T:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr20_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr20_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,151 :: 		Lcd_Out(1,9,"MOLHADO");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr21_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr21_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,152 :: 		Lcd_Out(2,7,"Motor off");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr22_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr22_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,153 :: 		}
L_main18:
;MyProject.c,154 :: 		}
	GOTO        L_main2
;MyProject.c,156 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
