void setup() {
  
  size(1280,960);
  
  fill(#FFFF6F);
  
  int[] rowcount = {8, 9, 10, 11, 12, 13, 14, 15, 14, 13, 12, 11, 10, 9, 8};
  float[] rowprob = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0 ,0, 0, 0};
  
  int[] shellcount = {1, 6, 12, 18, 24, 30, 36, 42};
  float[] shellprob = {0, 0, 0, 0, 0, 0, 0, 0};
  
  for(int n = 0; n < 15; n++) {
    //rowprob[15-n-1] = 1 - 0.05*n;
    rowprob[15-n-1] = 1.f-0.75f*pow((float)n/15.f, 2.f);
  }
  
  int spacing = 48;
  int radius = 24;
  
  //polygon(640, 480, 24, 6);
  
  /*
  //Gradient Up
  for(int i=0; i < 15; i++){
    for(int k=0; k < rowcount[i]; k++) {
      if(random(1.f) < rowprob[i]) {
        polygon(width/2-spacing*rowcount[i]/2+spacing*k, height/2-round((7.5-i)*spacing*0.866), radius, 6);
      }
    }
  }
  */
  
  
  
  //Gradient Center
  //polygon(640, 480, 24, 6);
  for(int i=0; i<3; i++){
    //top row
    for(int k=7-i; k < 7+i; k++) {
      polygon(width/2-spacing*rowcount[7+i]/2+spacing*k, height/2-round((7.5-(7+i))*spacing*0.866), radius, 6);
    }
    
    //bottom row
    for(int k=7-i; k < 7+i; k++) {
      polygon(width/2-spacing*rowcount[7-i]/2+spacing*k, height/2-round((7.5-(7-i))*spacing*0.866), radius, 6);
    }
    
    //sides
    for(int k=7-i+1; k < 7+i; k++) {
      polygon(width/2-spacing*rowcount[k]/2+spacing*rowcount[k], height/2-round((7.5+k)*spacing*0.866), radius, 6);
      polygon(width/2+spacing*rowcount[k]/2+spacing*rowcount[k], height/2-round((7.5+k)*spacing*0.866), radius, 6);
    }
  }
  
 
  
  /*
  //All Fill
  for(int i=0; i < 15; i++){
    for(int k=0; k < rowcount[i]; k++) {
      if(true) {
        polygon(width/2-spacing*rowcount[i]/2+spacing*k, height/2-round((7.5-i)*spacing*0.866), radius, 6);
      }
    }
  }
  */
  
  for(int  i = 0; i < 169; i++) {
    println(i+1 + ": " + (random(1.f) > 0.33));
  }
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a+HALF_PI) * radius;
    float sy = y + sin(a+HALF_PI) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
