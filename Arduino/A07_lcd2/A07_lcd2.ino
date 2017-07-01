// A07_lcd2
// From http://mechatrofice.blogspot.fr/2015/06/lcd-matrix-display-shield-interface-with-arduino-library.html
// 2016-05-13 PV

#include <LiquidCrystal.h>
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
int i=0;
void setup() {
  lcd.begin(16, 2);
}

void loop() {
  lcd.setCursor(4,0);
  lcd.print("Mechatrofice");
  for(i=0;i<4;i++){
    lcd.scrollDisplayLeft();
    delay(500);
  }
  for(i=0;i<4;i++){
    lcd.scrollDisplayRight();
    delay(500);
  }
}

