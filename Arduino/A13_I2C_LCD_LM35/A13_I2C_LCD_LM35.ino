/* A13_I2C_LCD_LM35
** 16 character 2 line I2C Display + Temperature sensor
** 2016-05-20 PV
**
** Connections LCD I2C: GND=0V, Vcc=5V, SDA=A4, SCL=A5
** Connections LM35:    G=GND=0V, R=Vcc=5V, Y=A0
*/

#include <Wire.h>  // Comes with Arduino IDE
#include <LiquidCrystal_I2C.h>

// set the LCD address to 0x27 for a 16 chars 2 line display
// Set the pins on the I2C chip used for LCD connections:
//                    addr, en,rw,rs,d4,d5,d6,d7,bl,blpol
LiquidCrystal_I2C lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);  // Set the LCD I2C address


const int sensorPin = A0;


void setup()
{
  Serial.begin(9600);
  lcd.begin(16,2);   // initialize the lcd for 16 chars 2 lines, turn on backlight
  lcd.clear();
}


void loop()   
{
  int sensorVal = analogRead(sensorPin);
  Serial.print("Sensor Value: ");
  Serial.print(sensorVal);
  // convert the ADC reading to voltage
  float voltage = (sensorVal/1024.0) * 5.0;
  Serial.print(", Volts: ");
  Serial.print(voltage);
  Serial.print(", degrees C: ");
  // convert the voltage to temperature in degrees
  float temperature = voltage * 100;
  Serial.println(temperature);

  lcd.setCursor(0,0);
  lcd.print("Sensor: ");
  lcd.print(sensorVal);
  lcd.setCursor(0, 1);
  lcd.print("Temp:   ");
  lcd.print(temperature);

  delay(500);
}

