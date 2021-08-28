public class pixelate {
  private colorConvert cubeColorImg;
  
  public pixelate(colorConvert picture) {
    cubeColorImg = picture;  
  }
  
  public void cubes (PImage basePic, int cubeWidth, int cubeHeight){
    int cubiesW = cubeWidth * 3;
    int cubiesH = cubeHeight * 3;
    for (int x = 0; x < cubeColorImg.ccWidth; x+= cubeColorImg.ccWidth/cubiesW) {
      for (int y = 0; y < cubeColorImg.ccHeight; y+= cubeColorImg.ccHeight/cubiesH) {
        color pixel = basePic.get(x, y);
        
        for (int a = x; (a < x + cubeColorImg.ccWidth/cubiesW) && (a < cubeColorImg.ccWidth); a++) {
          for (int b = y; (b < y + cubeColorImg.ccHeight/cubiesH) && (b < cubeColorImg.ccHeight); b++) {
            basePic.set(a, b, pixel);
          }
        } 
      }
    }
  }
  
  public void cubiesGridLines(
}
