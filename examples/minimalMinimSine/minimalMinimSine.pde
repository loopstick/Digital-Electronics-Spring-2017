/**

	09/22/15 - initial creation - Michael Shiloh
  
	Based on
http://code.compartmental.net/minim/examples/AudioOutput/SineWaveSignal/SineWaveSignal.pde

	This is the simplest way I could find to create a simple sound with Minim

  */
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;     // the Minim library
AudioOutput out; // the audio output of my laptop
SineWave sine;   // a function to generate the values 
                 // of a sine wave

void setup(){    
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

void draw(){
}
