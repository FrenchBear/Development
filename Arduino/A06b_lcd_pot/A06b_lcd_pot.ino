// A06b_lcd_pot
// From http://garagelab.com/profiles/blogs/tutorial-basic-16x2-lcd-with-arduino
// LCD direct + potentiometer on A0
// 2016-05-16 PV

#include <LiquidCrystal.h> //Include LCDs Library

const int potPin = A0;
long n = 0;

LiquidCrystal lcd(12, 11, 5, 4, 3, 2); //Attach LCDs and Arduino pin comunnication

void setup() {
  lcd.begin(16, 2); //LCD begins. dimension: 16x2(Coluns x Rows)
  lcd.setCursor(0, 0); // Positions the cursor in the first column (0) and the firt row (1) at LCD
  lcd.print("LCD arduino"); //LCD write comand"LiquidCrystal.h"
  //lcd.setCursor(0, 1); // Positions the cursor in the first column (0) and the second row (1) at LCD
  //lcd.print("GarageLab"); // LCD write command "GarageLab"
}

void loop() {
  int potVal = analogRead(potPin);
  char buf[5];
  sprintf(buf, "%4d", potVal);
  lcd.setCursor(0, 1); // Positions the cursor col=0 row=1
  lcd.print(buf);

  sprintf(buf, "%ld", n++);
  lcd.setCursor(6, 1);
  lcd.print(buf);
  
  //delay(10); // Waits for 1/100 second
}

