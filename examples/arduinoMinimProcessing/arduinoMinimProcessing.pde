import processing.serial.*;
import ddf.minim.signals.*;

Serial myPort;        // The serial port
float inByte = 0;
float freq;

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioOutput out;
SineWave sine;   // a function to generate the values of a sine wave

void setup () {
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[1], 9600);

  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');

  minim = new Minim(this);

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
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    println(inString);
    // trim off any whitespace:
    inString = trim(inString);
    // convert to an int and map to the screen height:
    inByte = float(inString);
    freq = map(inByte, 0, 1023, 110, 880);
  }
}