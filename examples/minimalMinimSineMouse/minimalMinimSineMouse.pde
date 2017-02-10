/**

  09/22/15 - initial creation - Michael Shiloh

  Based on 
http://code.compartmental.net/minim/examples/AudioOutput/SineWaveSignal/SineWaveSignal.pde

	Create a simple sine wave, and modify the frequency according to the
	position of the mouse
  */

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

void setup()
{
  size(512, 200);
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  
  // makes the frequency change smoothly
  // try commenting out this line 
  // and see what happens
  sine.portamento(200);

  out.addSignal(sine);
}

void draw()
{

}

void mouseMoved()
{
  float freq = map(mouseY, 0, height, 1500, 60);
  sine.setFreq(freq);  
}

void stop()
{
  out.close();
  minim.stop();
  super.stop();
}
