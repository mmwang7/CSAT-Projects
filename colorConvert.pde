public class colorConvert {
  private PImage pic;
  
  public colorConvert(PImage image) {
    pic = image;  
  }

  // Converts pixel colors to grayscale value
  // Formula = average of R, G, and B values of a pixel
  public void grayScale() {
    for (int x = 0; x < pic.width; x++) {
      for (int y = 0; y < pic.height; y++) {
        color pxl = pic.get(x, y);
        float avg = (red(pxl) + green(pxl) + blue(pxl)) / 3;
        
        pic.set(x, y, color(avg, avg, avg));
      }
    }
  }

  public void rubikScale(color[] faceColor) {
    for (int x = 0; x < pic.width; x++) {
      for (int y = 0; y < pic.height; y++) {
        float[] colorDist = new float[faceColor.length];
        color pxl = pic.get(x, y);
        
        float rPix = red(pxl);
        float gPix = green(pxl);
        float bPix = blue(pxl);
        for (int i = 0; i < faceColor.length; i++){
          float rList = red(faceColor[i]);
          float rMean = (rPix + rList) / 2;
          float rDiff = abs(rPix - rList);
          float gDiff = abs(gPix - green(faceColor[i]));
          float bDiff = abs(bPix - blue(faceColor[i]));
    
          colorDist[i] = (((512+rMean)*rDiff*rDiff)/256) + 4*gDiff*gDiff + (((767-rMean)*bDiff*bDiff)/256);
        }
        
        int index = 0;
        float min = colorDist[0];
  
        for (int j = 1; j < colorDist.length; j++){
          if (colorDist[j] < min){
            index = j;
            min = colorDist[j];
          }
        
        pic.set(x, y, faceColor[index]);
        }
      }
    }
  }


  public void show(int x, int y) {
    image(pic, x, y);
  }
}
