// A06_lcd
// From http://garagelab.com/profiles/blogs/tutorial-basic-16x2-lcd-with-arduino
// 2016-05-13 PV

#include <LiquidCrystal.h> //Include LCDs Library

LiquidCrystal lcd(12, 11, 5, 4, 3, 2); //Attach LCDs and Arduino pin comunnication
int time;

void setup() {
  // put your setup code here, to run once:
  lcd.begin(16, 2); //LCD begins. dimension: 16x2(Coluns x Rows)
  lcd.setCursor(0, 0); // Positions the cursor in the first column (0) and the firt row (1) at LCD
  lcd.print("LiquidCrystal.h"); //LCD write comand"LiquidCrystal.h"
  lcd.setCursor(0, 1); // Positions the cursor in the first column (0) and the second row (1) at LCD
  lcd.print("GarageLab"); // LCD write command "GarageLab"
}

void loop() {
  // put your main code here, to run repeatedly:
  lcd.setCursor(13, 1); // Positions the cursor on the fourteenth column (13) and the second line (1) LCD 
  lcd.print(time); // Write the current value of the count variable in the LCD 
  delay(1000); // Waits for 1 second 
  time++; // Increment count variable

  if(time == 600) // If the variable temp get to 600 (10 minutes), ... 
  {
    time = 0; //... resets the count variable 
  }
}
