public class pixelate {
  private PImage pic;
  
  public pixelate(PImage picture) {
    pic = picture;  
  }
  
  // Pixelate image to cubes with color based on top right pixel
  public void cubeulate (int cubeWidth, int cubeHeight){
  int cubiesW = cubeWidth * 3;
  int cubiesH = cubeHeight * 3;
  for (int x = 0; x < pic.width; x+= pic.width/cubiesW) {
    for (int y = 0; y < pic.height; y+= pic.height/cubiesH) {
      
      for (int a = x; (a < x + pic.width/cubiesW) && (a < pic.width); a++) {
        for (int b = y; (b < y + pic.height/cubiesH) && (b < pic.height); b++) {
          color pixel = pic.get(x, y);
      
      for (int a = x; (a < x + pic.width/cubiesW) && (a < pic.width); a++) {
        for (int b = y; (b < y + pic.height/cubiesH) && (b < pic.height); b++) {
          pic.set(a, b, pixel);
        }
      } 
    }
  }
}
  
  public void show(int x, int y) {
    image(pic, x, y);
  }
}
