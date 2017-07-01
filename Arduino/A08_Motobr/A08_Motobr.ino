// A08_Motor Arduino Projects Book, Project #9
// Adjusted for two transistors (IRF540 and 2N3904) since I don't have an IRF520
// 2016-05-17 PV

const int switchPin = 2;
const int motorPin = 9;
int switchState = 0;

void setup() {
  Serial.begin(9600);
  pinMode(motorPin, OUTPUT);
  pinMode(switchPin, INPUT);
}

void loop() {
  switchState = digitalRead(switchPin);

  if (switchState == HIGH) {
    digitalWrite(motorPin, LOW);
  }
  else {
    digitalWrite(motorPin, HIGH);
  }

  delay(250);
}
