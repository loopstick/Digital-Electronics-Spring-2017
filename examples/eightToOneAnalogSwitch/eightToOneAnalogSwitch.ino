/*
   Control a 74HC4051 8 to 1 analog switch to select different resistors for
   an oscillator based on a 40106

   TODO:
   - add schematics

   2/9/17 - created by Michael Shiloh

*/

// Pin usage
const int select0Pin = 7;
const int select1Pin = 4;
const int select2Pin = 2;




void setup() {
  pinMode(select0Pin, OUTPUT);
  pinMode(select1Pin, OUTPUT);
  pinMode(select2Pin, OUTPUT);

}

void loop() {
  for (int i = 0; i < 8; i++ ) {
    select(i);
    delay(500);
  }
}

void select(int whichSwitch) {
  if ( 0 == whichSwitch ) {
    digitalWrite( select0Pin, LOW);
    digitalWrite( select1Pin, LOW);
    digitalWrite( select2Pin, LOW);
  }
  if ( 1 == whichSwitch ) {
    digitalWrite( select0Pin, HIGH);
    digitalWrite( select1Pin, LOW);
    digitalWrite( select2Pin, LOW);
  }
  if ( 2 == whichSwitch ) {
    digitalWrite( select0Pin, LOW);
    digitalWrite( select1Pin, HIGH);
    digitalWrite( select2Pin, LOW);
  }
  if ( 4 == whichSwitch ) {
    digitalWrite( select0Pin, HIGH);
    digitalWrite( select1Pin, HIGH);
    digitalWrite( select2Pin, LOW);
  }
  if ( 4 == whichSwitch ) {
    digitalWrite( select0Pin, LOW);
    digitalWrite( select1Pin, LOW);
    digitalWrite( select2Pin, HIGH);
  }
  if ( 5 == whichSwitch ) {
    digitalWrite( select0Pin, HIGH);
    digitalWrite( select1Pin, LOW);
    digitalWrite( select2Pin, HIGH);
  }
  if ( 6 == whichSwitch ) {
    digitalWrite( select0Pin, LOW);
    digitalWrite( select1Pin, HIGH);
    digitalWrite( select2Pin, HIGH);
  }

  if ( 7 == whichSwitch ) {
    digitalWrite( select0Pin, HIGH);
    digitalWrite( select1Pin, HIGH);
    digitalWrite( select2Pin, HIGH);
  }
}

