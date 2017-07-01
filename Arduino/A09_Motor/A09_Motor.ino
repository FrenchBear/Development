// A09_Motor Arduino Projects Book, Project #10
// 2016-05-17 PV

const int controlPin1 = 2;
const int controlPin2 = 3;
const int enablePin = 9;
const int directionSwitchPin = 7;
const int onOffSwitchStateSwitchPin = 5;
const int potPin = A0;

int onOffSwitchState = 0;
int previousOnOffSwitchState = 0;
int directionSwitchState = 0;
int previousDirectionSwitchState = 0;

int motorEnabled = 0;
int motorSpeed = 0;
int motorDirection = 1;

void setup() {
  pinMode(directionSwitchPin, INPUT);
  pinMode(onOffSwitchStateSwitchPin, INPUT);
  pinMode(controlPin1, OUTPUT);
  pinMode(controlPin2, OUTPUT);
  pinMode(enablePin, OUTPUT);

  digitalWrite(enablePin, LOW);

  Serial.begin(9600);
}

void loop() {
  onOffSwitchState = digitalRead(onOffSwitchStateSwitchPin);
  delay(1);
  directionSwitchState = digitalRead(directionSwitchPin);
  motorSpeed = analogRead(potPin)/4;

  if (onOffSwitchState != previousOnOffSwitchState) {
    if (onOffSwitchState == HIGH) {
      motorEnabled = !motorEnabled;
      Serial.print("motorEnabled: ");
      Serial.println(motorEnabled);
    }
    previousOnOffSwitchState = onOffSwitchState;
  }


  if (directionSwitchState != previousDirectionSwitchState) {
    if (directionSwitchState == HIGH) {
      motorDirection = !motorDirection;
      Serial.print("motorDirection: ");
      Serial.println(motorDirection);
    }
    previousDirectionSwitchState = directionSwitchState;
  }

  if (motorDirection==1) {
    digitalWrite(controlPin1, HIGH);
    digitalWrite(controlPin2, LOW);
  }
  else {
    digitalWrite(controlPin1, LOW);
    digitalWrite(controlPin2, HIGH);
  }

  if (motorEnabled==1)
    analogWrite(enablePin, motorSpeed);
  else
    analogWrite(enablePin, 0);
}

