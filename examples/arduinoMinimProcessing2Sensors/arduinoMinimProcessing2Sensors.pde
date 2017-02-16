/*

Read a pair of numbers separated by a comma from the serial port, presumably sent by an Arduino

Use the first number to control the amplitude and the second number the frequency of a sine wave

*/

import processing.serial.*;    // Serial port for communication with Arduino
import ddf.minim.*;            // Minim library for generating sounds
import ddf.minim.signals.*;  // Minim library that provides sine wave

Serial myPort;        // The serial port
float freq;           // sine wave frequency
float amp;            // sine wave amplitude

Minim       minim;    // a Minim object
AudioOutput out;      // our audio output
SineWave sine;        // a function to generate the values of a sine wave

void setup () {
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[0], 9600);

  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');

  minim = new Minim(this); // Instantiate the minim object

  // Connect the output of Minim to the audio output 
  // of my laptop
  out = minim.getLineOut(Minim.STEREO);  

  // create a sine wave oscillator
  // Frequency = 440 Hz
  // Amplitude = 0.5
  // Use the same sample rate as my output  
  sine = new SineWave(440, 0.5, out.sampleRate()); 

  //connect the sine wave generator to my audio output
  out.addSignal(sine);
}
void draw () {
  sine.setFreq( freq );
  sine.setAmp( amp );

 // println(freq + ',' + amp);
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // println(inString);
    // trim off any whitespace:
    inString = trim(inString);
    // split the input string at the commas
    // and convert the sections into integers:
    int sensors[] = int(split(inString, ','));

    // if we have received all the sensor values, use them:
    if (sensors.length == 2) {
      amp = map(sensors[0], 0, 1023, 1, 0);
      freq = map(sensors[1], 0, 1023, 110, 880);
    }
  }
}