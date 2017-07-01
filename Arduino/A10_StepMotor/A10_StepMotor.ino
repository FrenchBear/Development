// A10_StepMotor
// Arduino Projects Book #5
// 2016-06-17 PV

#include <Servo.h>

Servo myServo;

const int potPin = A0;
const int servoPin = 9;
int potVal;
int angle;

void setup() {
  myServo.attach(servoPin);
  Serial.begin(9600);
}

void loop() {
  potVal = analogRead(potPin);
  if (potVal<100) potVal = 100;
  Serial.print("potVal: ");
  Serial.print(potVal);

  angle = map(potVal, 0, 1023, 0, 179);
  Serial.print("   angle: ");
  Serial.println(angle);

  myServo.write(angle);
  delay(150);
}

