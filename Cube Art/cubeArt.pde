import processing.pdf.*; //<>//

PImage origImg;
color[] rubikColors;

colorConvert CCimg;
pixelate PxlImg;
cubeCards cubePDF;

PGraphicsPDF pdf;
int cubeXpos, cubeYpos;
PImage[] faces;

void settings() {
  origImg = loadImage("wave.jpg");
  size(850, 1100, PDF, "cubeCards.pdf"); //Create PDF pages
}

void setup() {
  pdf = (PGraphicsPDF) g; // Get the renderer
  background(255);
  // Cube face colors = {white, red, green, orange, blue, yellow}
  rubikColors = new color[] {color(255, 255, 255), color(255, 0, 0), color(0, 255, 0), color(255, 165, 0), color(0, 0, 255), color(255, 255, 0)};
  
  // PDF Setup
  cubePDF = new cubeCards();
  CCimg = new colorConvert(origImg.copy());
  CCimg.rubikScale(rubikColors);
  PxlImg = new pixelate(CCimg.pic, 25, 25);
  PxlImg.cubeulate();
  faces = PxlImg.cubeFaces();
  println(origImg.width + ", " + origImg.height);
  println(PxlImg.pic.width + ", " + PxlImg.pic.height);
}

void draw() {
  origImg.resize(500, 500);
  PxlImg.pic.resize(500, 500);
  
  image(origImg, 175, 25);
  image(PxlImg.pic, 175, (origImg.height + 75));
  PxlImg.gridLines(175, (origImg.height + 75));
  pdf.nextPage();
  
  cubePDF.textPDF(pdf, faces);
  
  exit();
  noLoop();
}
