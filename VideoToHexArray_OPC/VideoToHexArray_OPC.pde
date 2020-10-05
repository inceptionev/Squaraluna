//Simple sketch to test out capturing video on a pc or rpi

import processing.video.*;

OPC opc;
DCapture video;

void setup() {
 size(640, 360);
 frameRate(30);
 printArray(Capture.list());
 video = new DCapture();
 
  // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // Map an 8x8 grid of LEDs to the center of the window, scaled to take up most of the space
  float spacing = height / 14.0;
  float radius = 4.7*spacing;
  //opc.ledGrid8x8(0, width/2, height/2, spacing, HALF_PI, false, false);
  //hexCircularArray(0, width/2, height/2, spacing, radius, true);
  hexRectangularArray(0, width/2, height/2, spacing, 2.2*radius, 2*radius, false);
  opc.setColorCorrection(2.5, 0.4, 0.4, 0.4);
}

void draw() {
  image(video.updateImage(), 0, 0, video.width, video.height);
}
