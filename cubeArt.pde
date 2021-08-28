PImage img;
color[] rubikColors;
colorConvert ccImg;

void settings() {
  size(800, 800);
}

void setup() {
  background(0);
  // colorMode(HSB, 255);
  
  rubikColors = new color[] {color(255, 255, 255), color(255, 0, 0), color(0, 255, 0), color(255, 165, 0), color(0, 0, 255), color(255, 255, 0)};
  
  img = loadImage("pengmad.jpg");
  img = img.get(325, 0, 675, 720);
  ccImg = new colorConvert(img);
}

void draw() {
  // ccImg.rubikScale(rubikColors);
  // ccImg.show(0, 0);
  
  // pixelate(img, 4, 4); // Image divided unevenly
  // pixelate(img, 5, 10); // Attempt at pixelating image into rectangular shape.
  pixelate(img, 15, 15); // The dimensions we are going to use for our project (I think)
  image(img, 0, 0);
  
  
  noLoop();
}

void pixelate (PImage basePic, int cubeWidth, int cubeHeight){
  int cubiesW = cubeWidth * 3;
  int cubiesH = cubeHeight * 3;
  for (int x = 0; x < basePic.width; x+= basePic.width/cubiesW) {
    for (int y = 0; y < basePic.height; y+= basePic.height/cubiesH) {
      color pixel = basePic.get(x, y);
      
      for (int a = x; (a < x + basePic.width/cubiesW) && (a < basePic.width); a++) {
        for (int b = y; (b < y + basePic.height/cubiesH) && (b < basePic.height); b++) {
          basePic.set(a, b, pixel);
        }
      } 
    }
  }
}
