// Led tricolore pilotée à partir de deux photorésistances et d'une thermistance
// 2016-04-23 PV

const int greenLEDPin=9;
const int redLEDPin=10;
const int blueLEDPin=11;

const int redSensorPin = A0;
const int greenSensorPin = A1;
const int blueSensorPin = A2;

int redValue = 0;
int greenValue = 0;
int blueValue = 0;

int redSensorValue = 0;
int greenSensorValue = 0;
int blueSensorValue = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  pinMode(redLEDPin, OUTPUT);
  pinMode(greenLEDPin, OUTPUT);
  pinMode(blueLEDPin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  redSensorValue = analogRead(redSensorPin);  delay(5);
  greenSensorValue = analogRead(greenSensorPin); delay(5);
  blueSensorValue = analogRead(blueSensorPin); delay(5);

  Serial.print("R=");  Serial.print(redSensorValue);
  Serial.print("  G=");  Serial.print(greenSensorValue);
  Serial.print("  B=");  Serial.println(blueSensorValue);
  delay(5);

  redValue = redSensorValue/8;
  greenValue = greenSensorValue/8;
  blueValue = blueSensorValue/8;

  Serial.print("Out R="); Serial.print(redValue);
  Serial.print("  G="); Serial.print(greenValue);
  Serial.print("  B="); Serial.println(blueValue);

  analogWrite(redLEDPin, redValue);
  analogWrite(greenLEDPin, greenValue);
  analogWrite(blueLEDPin, blueValue);
}

