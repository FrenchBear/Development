/* 12_I2C_LCD
** 16 character 2 line I2C Display
** From: https://arduino-info.wikispaces.com/LCD-Blue-I2C
** Lib from: https://bitbucket.org/fmalpartida/new-liquidcrystal/downloads
** 2016-05-20 PV
**
** Connections LCD I2C: GND=0V, VCC=5V, SDA=A4, SCL=A5
*/

#include <Wire.h>  // Comes with Arduino IDE
#include <LiquidCrystal_I2C.h>

// set the LCD address to 0x27 for a 16 chars 2 line display
// Set the pins on the I2C chip used for LCD connections:
//                    addr, en,rw,rs,d4,d5,d6,d7,bl,blpol
LiquidCrystal_I2C lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);  // Set the LCD I2C address


void setup()
{
  Serial.begin(9600);  // Used to type in characters
  lcd.begin(16,2);   // initialize the lcd for 16 chars 2 lines, turn on backlight

  // ------- Quick 3 blinks of backlight  -------------
  for(int i = 0; i< 3; i++)
  {
    lcd.backlight();
    delay(150);
    lcd.noBacklight();
    delay(150);
  }
  lcd.backlight(); // finish with backlight on  

  lcd.clear();
  lcd.setCursor(0,0); //Start at character 0 on line 0
  lcd.print("Use Serial Mon");
  lcd.setCursor(0,1);
  lcd.print("Type to display");  
}


void loop()   
{
    // when characters arrive over the serial port...
    if (Serial.available()) {
      // wait a bit for the entire message to arrive
      delay(100);
      // clear the screen
      lcd.clear();
      // read all the available characters
      while (Serial.available() > 0) {
        // display each character to the LCD
        lcd.write(Serial.read());
      }
    }
}

