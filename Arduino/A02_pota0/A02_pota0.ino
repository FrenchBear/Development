// pota0
// Juste un potentiomètre sur la broche A0
// 2016-04-23 PV

const int sensorPin = A0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  int sensorVal = analogRead(sensorPin);

  Serial.println(sensorVal);
  delay(1);
}
