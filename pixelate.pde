 public class pixelate {
  private PImage pic;
  int cubeWidth, cubeHeight, numCubes;
  
  public pixelate(PImage picture, int cw, int ch) {
    pic = picture.get(0, 0, (picture.width - picture.width%(3*cw)), (picture.height - picture.height%(3*ch)));
    cubeWidth = cw;
    cubeHeight = ch;
    numCubes = cw * ch;
  }
  
  public pixelate(PImage picture, int nc) {
    pic = picture;  
    numCubes = nc;
    cubeWidth = (int) sqrt(nc);
    cubeHeight = (int) sqrt(nc);
  }

  // Pixelate image to cubes with color based on top right pixel
  public void cubeulate (){
    int cubiesW = cubeWidth * 3;
    int cubiesH = cubeHeight * 3;
    for (int x = 0; x < pic.width; x+= pic.width/cubiesW) {
      for (int y = 0; y < pic.height; y+= pic.height/cubiesH) {
        color pixel = pic.get(x+1, y+1);
      
        for (int a = x; (a < x + pic.width/cubiesW) && (a < pic.width); a++) {
          for (int b = y; (b < y + pic.height/cubiesH) && (b < pic.height); b++) {
            pic.set(a, b, pixel);
          }
        } 
      }
    }
  }
  
  public void gridLines (int xPos, int yPos){
    stroke(0);
    for (int x = xPos; x <= pic.width + xPos; x+= pic.width/cubeWidth) {
      for (int y = yPos; y <= pic.height + yPos; y+= pic.height/cubeHeight) {
        line(x, yPos, x, pic.height + yPos);
        line(xPos, y, pic.width + xPos, y);
      }
    }
  }
  
  public PImage[] cubeFaces(){
    PImage[] cubeFaces = new PImage[numCubes];
    int index = 0;
    for (int y = 0; y < pic.height; y+= pic.height/cubeHeight) {
      for (int x = 0; x < pic.width; x+= pic.width/cubeWidth) {
        cubeFaces[index] = pic.get(x, y, pic.width/cubeWidth, pic.height/cubeHeight);
        if (index < numCubes)
          index++;
      }
    }
    return cubeFaces;
  }
  
  public PImage createIMG (PImage[] faces){
    PImage createdPic = createImage(pic.width, pic.height, RGB);
    int index = 0;
    for (int y = 0; y < createdPic.height; y+= createdPic.height/cubeHeight) {
      for (int x = 0; x < createdPic.width; x+= createdPic.width/cubeWidth) {
        createdPic.set(x, y, faces[index]);
        if (index < faces.length)
          index++;
      }
    }
    return createdPic;
  }
  
  public void show(int x, int y) {
    image(pic, x, y);
  }

}
