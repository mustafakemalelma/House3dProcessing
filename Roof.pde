class Roof {
  PImage roofImg;

  Roof() {
    roofImg = loadImage("roof.jpg");
  }

  void drawRoof() {
    int w = roofImg.width;
    int h = roofImg.height;

    float increasedWidth = HOUSE_WIDTH + 0.5;
    float roofStartY = -HOUSE_HEIGHT - 0.001; 
    float roofEndY = -HOUSE_HEIGHT - ROOF_HEIGHT; 

    beginShape(TRIANGLE);
    texture(roofImg);

    vertex(-increasedWidth, roofStartY, increasedWidth, 0, h);
    vertex(increasedWidth, roofStartY, increasedWidth, w, h);
    vertex(0, roofEndY, increasedWidth, w/2, 0);

    vertex(-increasedWidth, roofStartY, -increasedWidth, 0, h);
    vertex(increasedWidth, roofStartY, -increasedWidth, w, h);
    vertex(0, roofEndY, -increasedWidth, w/2, 0);

    endShape();

    beginShape(QUADS);
    texture(roofImg);

    vertex(0, roofEndY, increasedWidth, 0, 0);
    vertex(0, roofEndY, -increasedWidth, w, 0);
    vertex(increasedWidth, roofStartY, -increasedWidth, w, h);
    vertex(increasedWidth, roofStartY, increasedWidth, 0, h);

    vertex(0, roofEndY, increasedWidth, 0, 0);
    vertex(0, roofEndY, -increasedWidth, w, 0);
    vertex(-increasedWidth, roofStartY, -increasedWidth, w, h);
    vertex(-increasedWidth, roofStartY, increasedWidth, 0, h);

    vertex(increasedWidth, roofStartY, increasedWidth, 0, 0);
    vertex(-increasedWidth, roofStartY, increasedWidth, w, 0);
    vertex(-increasedWidth, roofStartY, -increasedWidth, w, h);
    vertex(increasedWidth, roofStartY, -increasedWidth, 0, h);

    endShape();
  }
}
