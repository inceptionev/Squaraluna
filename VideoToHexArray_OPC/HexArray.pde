void hexCircularArray(int index, float x, float y, float spacing, float radius, boolean zigzag) {
  println("x: " + x + ", y: " + y + ", spacing: " + spacing + ", radius: " + radius); //debug
  
  //calculate number of columns on either side of the center column, i.e. total columns = 2*hcount+1
  //this mapping ensures there is always on hexagon in the exact middle of the map
  int hcount = floor((radius-1.f*spacing)/spacing);
  int nled = index;
  
  //this runs from -hcount to +hcount
  for(int ncolumn = -hcount; ncolumn < hcount+1 ; ncolumn++) { 
    
    //set the column's horizontal offset
    int hoffset = (int)(ncolumn*spacing);
    println("hoffset: " + hoffset); //debug
    
    //calculate number of spacings that fit
    int vcount = floor((2*radius*sin(acos(abs(hoffset)/radius))-0.5*spacing)/spacing);  
    if (vcount%2 == abs(ncolumn%2)) {  //enforce odd columns must have even number of points and vice versa
      vcount--;
    }
    
    //calculate vertical offset and set individual LED positions
    for(int nrow = 0; nrow < vcount ; nrow++) {
      opc.led(nled, (int)(x+hoffset), (int)(y+(ncolumn%2 == 0 || !zigzag ? 1 : -1)*spacing*(-vcount/2.f+nrow+0.5)));  //zig-zag numbering pattern
      println("pixel: " + nled + ", " + (int)(x+hoffset) + ", " + (int)((ncolumn%2 == 0 || !zigzag ? 1 : -1)*spacing*(-vcount/2.f+nrow+0.5))); //debug
      nled++;
    }
  }
}

void hexRectangularArray(int index, float x, float y, float spacing, float xsize, float ysize, boolean zigzag) {
  println("x: " + x + ", y: " + y + ", spacing: " + spacing + ", xsize: " + ysize + ", ysize: " + ysize); //debug
  
  //calculate number of columns on either side of the center column, i.e. total columns = 2*hcount+1
  //this mapping ensures there is always on hexagon in the exact middle of the map
  int hcount = floor((xsize/2-1.f*spacing)/spacing);
  int nled = index;
  
  //this runs from -hcount to +hcount
  for(int ncolumn = -hcount; ncolumn < hcount+1 ; ncolumn++) { 
    
    //set the column's horizontal offset
    int hoffset = (int)(ncolumn*spacing);
    println("hoffset: " + hoffset); //debug
    
    //calculate number of vertical spacings that fit
    int vcount = floor((ysize-0.5*spacing)/spacing);  
    if (vcount%2 == abs(ncolumn%2)) {  //enforce odd columns must have even number of points and vice versa
      vcount--;
    }

    //calculate vertical offset and set individual LED positions
    for(int nrow = 0; nrow < vcount ; nrow++) {
      opc.led(nled, (int)(x+hoffset), (int)(y+(ncolumn%2 == 0 || !zigzag ? 1 : -1)*spacing*(-vcount/2.f+nrow+0.5)));  //zig-zag numbering pattern
      println("pixel: " + nled + ", " + (int)(x+hoffset) + ", " + (int)((ncolumn%2 == 0 || !zigzag ? 1 : -1)*spacing*(-vcount/2.f+nrow+0.5))); //debug
      nled++;
    }
  }
}
