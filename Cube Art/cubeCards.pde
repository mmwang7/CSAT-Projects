public class cubeCards {
  
  public cubeCards() {
    
  }
  
  public void colorPDF (PGraphicsPDF cubeDoc, PImage[] cubes){
    noFill();
    textSize(30);
    String coor = "";
    int row = 0;
    int col = 0;
    
    for (int i = 0; i < cubes.length; i++){
      coor = "(" + i%25 + ", " + (24 - (int)i/25) + ")";
      pushMatrix();
      translate(425 * col, 275 * row);
      // Cards
      rect(50, 50, 325, 175);
      // Cube Face
      cubes[i].resize(150, 150);
      image(cubes[i], 212.5, 62.5);
      rect(212.5, 62.5, 150, 150);
      line(262.5, 62.5, 262.5, 212.5);
      line(312.5, 62.5, 312.5, 212.5);
      line(212.5,112.5,362.5,112.5);
      line(212.5,162.5,362.5,162.5);
      // Coordinates
      fill(0);
      text(coor, 75, 100);
      noFill();
      popMatrix();
      col++;
      if (col > 1){
        col = 0;
        row++;
      }
      if (row > 3){
        cubeDoc.nextPage();
        row = 0;
      }
    }
  }
  
  public void textPDF (PGraphicsPDF cubeDoc, PImage[] cubes){
    noFill();
    textSize(30);
    String coor = "";
    int row = 0;
    int col = 0;
    
    for (int i = 0; i < cubes.length; i++){
      coor = "(" + i%25 + ", " + (24 - (int)i/25) + ")";
      pushMatrix();
      translate(425 * col, 275 * row);
      // Cards
      rect(50, 50, 325, 175);
      // Cube Face
      String [] pixelColor = colorLetter(cubes[i], rubikColors);
      rect(212.5, 62.5, 150, 150);
      line(262.5, 62.5, 262.5, 212.5);
      line(312.5, 62.5, 312.5, 212.5);
      line(212.5,112.5,362.5,112.5);
      line(212.5,162.5,362.5,162.5);
      
      float r = 97.5;
      float c = 227.5;
      for (int a = 0; a < pixelColor.length; a++){
        fill(0);
        text(pixelColor[a], c, r);
        noFill();
        
        c += 50;
        if (c > 362.5){
          c = 227.5;
          r += 50; //max= 212.5
        }
      }
      // Coordinates
      fill(0);
      text(coor, 75, 100);
      popMatrix();
      noFill();
      
      col++;
      if (col > 1){
        col = 0;
        row++;
      }
      if (row > 3){
        cubeDoc.nextPage();
        row = 0;
      }
    }
  }
  
  public String[] colorLetter(PImage img, color[] faceColor){
    int index = 0;
    String[] colorLetter = new String[9];
    for (int y = 0; y < img.height; y += img.height/3) {
      for (int x = 0; x < img.width; x += img.width/3) {
        color pxl = img.get(x+1, y+1);
        
        if (pxl == faceColor[0])
          colorLetter[index] = "W";
        if (pxl == faceColor[1])
          colorLetter[index] = "R";
        if (pxl == faceColor[2])
          colorLetter[index] = "G";
        if (pxl == faceColor[3])
          colorLetter[index] = "O";
        if (pxl == faceColor[4])
          colorLetter[index] = "B";
        if (pxl == faceColor[5])
          colorLetter[index] = "Y";
        
        index++;
      }
    }
    return colorLetter;
  }
    
}
