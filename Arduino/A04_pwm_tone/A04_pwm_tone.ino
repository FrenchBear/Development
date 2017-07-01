// A04_pwm_tone
// Circuit tone (chap 6) avec photores IN A0 out buzzer OUT 8 et PWN avec pot IN A1 et diode PWM 9 

int sensorValue;
int sensorLow=1023; // initial value for calibration
int sensorHigh=0;   // idem

const int calibrationLedPin = 13;
const int ledPin = 9;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(calibrationLedPin, OUTPUT);
  pinMode(ledPin, OUTPUT);

  // Autocalibrarion for 5s, led 13 is on during that phase
  digitalWrite(calibrationLedPin, HIGH);
  while(millis()<5000) {
    sensorValue = analogRead(A0);
    if (sensorValue>sensorHigh) sensorHigh=sensorValue;
    if (sensorValue<sensorLow)  sensorLow=sensorValue;
  }
  digitalWrite(calibrationLedPin, LOW);
}

void loop() {
  // put your main code here, to run repeatedly:
  sensorValue = analogRead(A0);
  int pitch = map(sensorValue, sensorLow, sensorHigh, 50, 1000);
  tone(8, pitch, 20);
  delay(10);

  int potValue = analogRead(A1);
  int ledValue = map(potValue, 0, 1023, 0, 255);
  analogWrite(ledPin, ledValue);
}
