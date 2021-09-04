public class cubeCards {
  private PImage pic;
  
  public colorConvert(PImage image) {
    pic = image;  
  }
}

import processing.pdf.*;
int cubeXpos, cubeYpos;

PGraphicsPDF pdf;

void setup() {
  size(850, 1100, PDF, "test.pdf");
  pdf = (PGraphicsPDF) g; // Get the renderer
  background(255);
  cubeXpos = 0;
  cubeYpos = 0;
}

void draw() {
  // Draw something good here
  String coor = "";
  for (int row = 0; row < 4; row++){
    for (int col = 0; col < 2; col++){
      coor = "(" + cubeXpos + ", " + cubeYpos + ")";
      pushMatrix();
      translate(425 * col, 275 * row);
      //card
      rect(50, 50, 325, 175);
      //Cube Grid
      rect(212.5, 62.5, 150, 150);
      line(262.5, 62.5, 262.5, 212.5);
      line(312.5, 62.5, 312.5, 212.5);
      line(212.5,112.5,362.5,112.5);
      line(212.5,162.5,362.5,162.5);
      // Coordinates
      fill(0);
      text(coor, 125, 100);
      popMatrix();
      noFill();
      if (cubeXpos < 14)
        cubeXpos++;
      else {
        cubeYpos++;
        cubeXpos = 0;
      }
    }
  }
  
  // When finished drawing, quit and save the file
  // if (frameCount == 10) {
  if (cubeYpos > 14){
    exit();
  }
  else {
    pdf.nextPage();  // Tell it to go to the next page
  }
}
