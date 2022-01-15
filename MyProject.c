//função que determina a saida correta para a cada entrada determinada
//recebendo o número e fazendo sua conversão para BCD

// tem que habilitar as bibliotecas: ADC , CONVERSIONS, LCD

// Selecionando pinos utilizados para comunicação com display LCD
sbit LCD_RS at RD2_bit;          // PINO 2 DO PORTD INTERLIGADO AO RS DO DISPLAY
sbit LCD_EN at RD3_bit;          // PINO 3 DO PORTD INTERLIGADO AO EN DO DISPLAY
sbit LCD_D7 at RD7_bit;          // PINO 7 DO PORTD INTERLIGADO AO D7 DO DISPLAY
sbit LCD_D6 at RD6_bit;          // PINO 6 DO PORTD INTERLIGADO AO D6 DO DISPLAY
sbit LCD_D5 at RD5_bit;          // PINO 5 DO PORTD INTERLIGADO AO D5 DO DISPLAY
sbit LCD_D4 at RD4_bit;          // PINO 4 DO PORTD INTERLIGADO AO D4 DO DISPLAY

// Selecionando direção de fluxo de dados dos pinos utilizados para a comunicação com display LCD
sbit LCD_RS_Direction at TRISD2_bit;     // SETA DIREÇÃO DO FLUXO DE DADOS DO PINO 2 DO PORTD
sbit LCD_EN_Direction at TRISD3_bit;     // SETA DIREÇÃO DO FLUXO DE DADOS DO PINO 3 DO PORTD
sbit LCD_D7_Direction at TRISD7_bit;     // SETA DIREÇÃO DO FLUXO DE DADOS DO PINO 7 DO PORTD
sbit LCD_D6_Direction at TRISD6_bit;     // SETA DIREÇÃO DO FLUXO DE DADOS DO PINO 6 DO PORTD
sbit LCD_D5_Direction at TRISD5_bit;     // SETA DIREÇÃO DO FLUXO DE DADOS DO PINO 5 DO PORTD
sbit LCD_D4_Direction at TRISD4_bit;     // SETA DIREÇÃO DO FLUXO DE DADOS DO PINO 4 DO PORTD

// End LCD module connections

//Criação de variaveis, tipo double para maior precisão.
 double source=0,
        sensortemp=0,
        temp=0,
        hum=0,
        rntc=0;
//criação variavel tipo inteiro
 int view=0;
 //criação variaveis tipo char com espaço para 6 caracteres.
 char txt[6],txt2[6];
 //função principal
 void main()

 {
 //Constantes encontradas no datasheat referentes ao sensor NTC 10k
  double a = 0.0011303,
         b = 0.0002339,
         c = 0.00000008863,
         b1,c1;
  //Acionamento das portas B como saida
  TRISB = 0x00;
  PORTB = 0x00;
  // Initialize ADC
  ADC_Init();
  // Initialize LCD
  Lcd_Init();
  // Clear display
  Lcd_Cmd(_LCD_CLEAR);
  // Cursor off
  Lcd_Cmd(_LCD_CURSOR_OFF);
  //Exibe na interface no display
  Lcd_Out(1, 1, "controle auto");
  Lcd_Out(2, 1, "de irrigação");
  delay_ms(2000);
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1, 1, "iniciando");
  Lcd_Out(2, 1, "leitura");
  delay_ms(2000);
  // Clear display
  Lcd_Cmd(_LCD_CLEAR);

  while(1)
  {
        //desabilita comparadores
        CMCON  = 0x07;
        //liga conversão ad
        ADCON0 = 0x01;
        //////////// SENSOR DE TEMPERATURA //////////////////////////////
        //adiciona a variavel o valor lido na porta analogica.
        sensortemp=Adc_Read(0);
        sensortemp*=5;
        sensortemp/=1023;
        //Calculo para a resistencia do Termistor.
        rntc=33000/sensortemp;
        rntc=rntc-10000;
        b1=log(rntc);
        b1=b1*b;               //b*LN(RNTC)
        c1=log(rntc);          //LN(RNTC)
        c1=pow(c1,3);          //LN(RNTC)^3
        c1=c1*c;               //c*(LN(RNTC)^3)
        temp=a+b1+c1;          //a+b*LN(RNTC)+c*(LN(RNTC)^3)
        temp=1/temp;           //1/(a+b*LN(RNTC)+c*(LN(RNTC)^3))
        temp=temp-273.15;
        temp=74-temp;
        //Converter a variavel para uma tipo string.
        inttostr(temp,txt2);
        Ltrim(txt2);
        Lcd_Out(2,3,"");
        Lcd_Out_Cp(&txt2);
        //////////// SENSOR DE UMIDADE //////////////////////////////
        //VALOR DA VARIAVEL IGUAL AO VALOR LIDO NA PORTA ANALOGICA
        source=Adc_Read(1);
        hum=Adc_Read(1);
        hum=100*hum;
        hum=100-hum/1023;
        //CONVERTER A VARAIVEL PARA O TIPO STRING
        inttostr(hum,txt);
        Ltrim(txt);
        //EXIBE NO DISPLAY
        Lcd_Out(1,3,"");
        Lcd_Out_Cp(&txt);
        ////////////////////////CONDIÇÕES///////////////
        //// SE A UMIDADE FOR BAIXA E A TEMPERATURA FOR ALTA
        if(source>600 && temp>45)
        {
          // ACIONA A IRRIGAÇÃO E A VENTILAÇÃO
          PORTB = 0b00110000;
          delay_ms(500);
          Lcd_Cmd(_LCD_CLEAR);
          Lcd_Out(1,1,"U:");
          Lcd_Out(2,1,"T:");
          Lcd_Out(1,12,"SECO");
          Lcd_Out(2,7,"Motor:on");
        }
        //// SE A UMIDADE FOR BAIXA E A TEMPERATURA FOR BAIXA
         if(source>600 && temp<45)
        {
          // ACIONA A IRRIGAÇÃO
          PORTB = 0b00010000;
          delay_ms(500);
          Lcd_Cmd(_LCD_CLEAR);
          Lcd_Out(1,1,"U:");
          Lcd_Out(2,1,"T:");
          Lcd_Out(1,12,"SECO");
          Lcd_Out(2,7,"Motor:on");
        }
        //// SE A UMIDADE FOR ALTA E A TEMPERATURA FOR ALTA
        if(source<=600 && temp>45)
        {
          // ACIONA A VENTILAÇÃO
          PORTB = 0b00100000;
          delay_ms(500);                  //motor on
          Lcd_Cmd(_LCD_CLEAR);
          Lcd_Out(1,1,"U:");
          Lcd_Out(2,1,"T:");
          Lcd_Out(1,9,"MOLHADO");
          Lcd_Out(2,7,"Motor off");
        }
        //// SE A UMIDADE FOR ALTA E A TEMPERATURA FOR BAIXA
        if(source<=600 && temp<45)
        {
        // NADA É ACIONADO
          PORTB = 0b00000000;
          delay_ms(500);                  //motor on
          Lcd_Cmd(_LCD_CLEAR);
          Lcd_Out(1,1,"U:");
          Lcd_Out(2,1,"T:");
          Lcd_Out(1,9,"MOLHADO");
          Lcd_Out(2,7,"Motor off");
        }
     }

 }