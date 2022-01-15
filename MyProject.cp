#line 1 "C:/Users/rudij/Documents/UFPI/LAB MICRO/Projeto/NOVA TENTATIVA/MyProject.c"






sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;


sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;




 double source=0,
 sensortemp=0,
 temp=0,
 hum=0,
 rntc=0;

 int view=0;

 char txt[6],txt2[6];

 void main()

 {

 double a = 0.0011303,
 b = 0.0002339,
 c = 0.00000008863,
 b1,c1;

 TRISB = 0x00;
 PORTB = 0x00;

 ADC_Init();

 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1, 1, "controle auto");
 Lcd_Out(2, 1, "de irrigação");
 delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "iniciando");
 Lcd_Out(2, 1, "leitura");
 delay_ms(2000);

 Lcd_Cmd(_LCD_CLEAR);

 while(1)
 {

 CMCON = 0x07;

 ADCON0 = 0x01;


 sensortemp=Adc_Read(0);
 sensortemp*=5;
 sensortemp/=1023;

 rntc=33000/sensortemp;
 rntc=rntc-10000;
 b1=log(rntc);
 b1=b1*b;
 c1=log(rntc);
 c1=pow(c1,3);
 c1=c1*c;
 temp=a+b1+c1;
 temp=1/temp;
 temp=temp-273.15;
 temp=74-temp;

 inttostr(temp,txt2);
 Ltrim(txt2);
 Lcd_Out(2,3,"");
 Lcd_Out_Cp(&txt2);


 source=Adc_Read(1);
 hum=Adc_Read(1);
 hum=100*hum;
 hum=100-hum/1023;

 inttostr(hum,txt);
 Ltrim(txt);

 Lcd_Out(1,3,"");
 Lcd_Out_Cp(&txt);


 if(source>600 && temp>45)
 {

 PORTB = 0b00110000;
 delay_ms(500);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"U:");
 Lcd_Out(2,1,"T:");
 Lcd_Out(1,12,"SECO");
 Lcd_Out(2,7,"Motor:on");
 }

 if(source>600 && temp<45)
 {

 PORTB = 0b00010000;
 delay_ms(500);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"U:");
 Lcd_Out(2,1,"T:");
 Lcd_Out(1,12,"SECO");
 Lcd_Out(2,7,"Motor:on");
 }

 if(source<=600 && temp>45)
 {

 PORTB = 0b00100000;
 delay_ms(500);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"U:");
 Lcd_Out(2,1,"T:");
 Lcd_Out(1,9,"MOLHADO");
 Lcd_Out(2,7,"Motor off");
 }

 if(source<=600 && temp<45)
 {

 PORTB = 0b00000000;
 delay_ms(500);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"U:");
 Lcd_Out(2,1,"T:");
 Lcd_Out(1,9,"MOLHADO");
 Lcd_Out(2,7,"Motor off");
 }
 }

 }
