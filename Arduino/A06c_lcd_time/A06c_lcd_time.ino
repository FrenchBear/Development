// A06c_lcd_time
// LCD: From http://garagelab.com/profiles/blogs/tutorial-basic-16x2-lcd-with-arduino
// Time: http://www.instructables.com/id/Real-time-clock-using-DS3231-EASY 
// 2016-05-16 PV

#include <LiquidCrystal.h> //Include LCDs Library
#include <DS3231.h>

const int potPin = A0;
//const int SDA = A4;
//const int SCL = A5;

LiquidCrystal lcd(12, 11, 5, 4, 3, 2); //Attach LCDs and Arduino pin communication

// Init the DS3231 using the hardware interface
DS3231  rtc(SDA, SCL);

void setup() {
  lcd.begin(16, 2); //LCD begins. dimension: 16x2(Coluns x Rows)

  // Initialize the rtc object
  rtc.begin();
  
  // The following lines can be uncommented to set the date and time
  //rtc.setDOW(MONDAY);     // Set Day-of-Week to SUNDAY
  //rtc.setTime(18, 10, 0);
  //rtc.setDate(16, 5, 2016);
}

void loop() {
  int potVal = analogRead(potPin);
  char buf[5];
  sprintf(buf, "%4d", potVal);
  lcd.setCursor(0, 1); // Positions the cursor col=0 row=1
  lcd.print(buf);

  lcd.setCursor(0, 0);
  lcd.print(rtc.getDOWStr(FORMAT_SHORT));
  lcd.print(" ");
  
  // Send date
  lcd.print(rtc.getDateStr(FORMAT_LONG, FORMAT_BIGENDIAN, '-'));
  lcd.print(" ");

  // Send time
  lcd.setCursor(8,1);
  lcd.print(rtc.getTimeStr());
  delay(1000); 
}

