void hexCircularArray(int index, float x, float y, float spacing, float radius, boolean zigzag) {
  
  //number of columns on either side of the center column, i.e. total columns = 2*hcount+1
  int hcount = floor((radius-1.f*spacing)/spacing);
  int nled = index;
  
  print("x: ");
  println(x);
  print("y: ");
  println(y);
  print("spacing: ");
  println(spacing);
  print("radius: ");
  println(radius);
  
  for(int ncolumn = -hcount; ncolumn < hcount+1 ; ncolumn++) { //this runs from -hcount to +hcount
    int hoffset = (int)(ncolumn*spacing);
    print("hoffset: ");
    println(hoffset);
    int vcount = floor((2*radius*sin(acos(abs(hoffset)/radius))-0.5*spacing)/spacing);  //calculate number of spacings that fit
    if (vcount%2 == abs(ncolumn%2)) {  //enforce odd columns must have even number of points and vice versa
      vcount--;
    }
    for(int nrow = 0; nrow < vcount ; nrow++) {
      opc.led(nled, (int)(x+hoffset), (int)(y+(ncolumn%2 == 0 || !zigzag ? 1 : -1)*spacing*(-vcount/2.f+nrow+0.5)));  //zig-zag numbering pattern
      print("pixel: ");
      print(nled);
      print(", ");
      print((int)(x+hoffset));
      print(", ");
      println((int)((ncolumn%2 == 0 || !zigzag ? 1 : -1)*spacing*(-vcount/2.f+nrow+0.5)));
      nled++;
      
    }
  }
}
