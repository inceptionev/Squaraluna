import de.humatic.dsj.*;
import java.awt.image.BufferedImage;
 
class DMovie implements java.beans.PropertyChangeListener {
 
  private DSMovie movie;
  public int width, height;
 
  DMovie(String _s) {
    movie = new DSMovie(dataPath(_s), DSFiltergraph.DD7, this);
    movie.setVolume(1.0);
    movie.setLoop(false);
    movie.play();
    width = movie.getDisplaySize().width;
    height = movie.getDisplaySize().height;
  }
 
  public PImage updateImage() {
    PImage img = createImage(width, height, RGB);
    BufferedImage bimg = movie.getImage();
    bimg.getRGB(0, 0, img.width, img.height, img.pixels, 0, img.width);
    img.updatePixels();
    return img;
  }
 
  public void loop() {
    movie.setLoop(true);
    movie.play();
  }
 
  public void play() {
    movie.play();
  }
 
  public void propertyChange(java.beans.PropertyChangeEvent e) {
    switch (DSJUtils.getEventType(e)) {
    }
  }
}
