PImage img; //<>//
color[] rubikColors;

void settings() {
  img = loadImage("pengmad.jpg");
  size(img.width, img.height);
}

void setup() {
  // colorMode(HSB, 255);
  rubikColors = new color[] {color(255, 255, 255), color(255, 0, 0), color(0, 255, 0), color(255, 165, 0), color(0, 0, 255), color(255, 255, 0)};
}

void draw() {
  PImage newPic = img;
  
  image(img, 0, 0);
  colorConvert CCimg = new colorConvert(newPic);
  CCimg.rubikScale(rubikColors);
  // CCimg.show(img.width, 0);
  
  newPic = CCimg.pic;
  // pixelate Pimg = 
  pixelate(newPic, 20, 15);
  image(newPic, 0, 0);
  
  
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
