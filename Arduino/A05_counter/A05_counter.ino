// A05_counter
//Simple binary counter on 16 bits
// 2016-04-25 PV

const int ledPIN = 9;   // PWM

const int wait1 = 0;   // between digits
const int wait2 = 1;  // after number

int c = 0;              // counter

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  pinMode(ledPIN, OUTPUT);
  
  pinMode(2, OUTPUT);   // Trigger indicating the beginning
  pinMode(3, OUTPUT);   // COunter
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(2, HIGH);
  //delay(1);
  digitalWrite(2, LOW);

  int i;
  int c2 = c;
  for (i=0 ; i<16 ; i++) {
    digitalWrite(3, ((c2&1)==1)?HIGH:LOW);
    //delay(wait1);
    //delay(1);
    c2 >>= 1;
    digitalWrite(3, 0);
  }
  delay(wait2);

  c = (c+1) & 0xFFFF;
  digitalWrite(ledPIN, ((c&1)==1)?HIGH:LOW);
}

