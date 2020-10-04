//Simple sketch to test out capturing video on a pc or rpi

import processing.video.*;

DCapture video;

void setup() {
 size(640, 360);
 frameRate(30);
 printArray(Capture.list());
 video = new DCapture();
}

void draw() {
  image(video.updateImage(), 0, 0, video.width, video.height);
}
