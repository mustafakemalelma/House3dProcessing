class Roof {
  PImage roofImg;

  Roof() {
    roofImg = loadImage("roof.jpg");
  }

  void drawRoof() {
    int w = roofImg.width;
    int h = roofImg.height;

    beginShape(TRIANGLE);
    texture(roofImg);

    vertex(-1.5, -1, 1.5, 0, h);
    vertex(1.5, -1, 1.5, w, h);
    vertex(0, -2, 1.5, w/2, 0);

    vertex(-1.5, -1, -1.5, 0, h);
    vertex(1.5, -1, -1.5, w, h);
    vertex(0, -2, -1.5, w/2, 0);
    
    endShape();

    beginShape(QUADS);
    texture(roofImg);

    vertex(0, -2, 1.5, 0, 0);
    vertex(0, -2, -1.5, w, 0);
    vertex(1.5, -1, -1.5, w, h);
    vertex(1.5, -1, 1.5, 0, h);
    
    vertex(0, -2, 1.5, 0, 0);
    vertex(0, -2, -1.5, w, 0);
    vertex(-1.5, -1, -1.5, w, h);
    vertex(-1.5, -1, 1.5, 0, h);
    
    vertex(1.5, -1.0001, 1.5, 0, 0);
    vertex(-1.5, -1.0001, 1.5, w, 0);
    vertex(-1.5, -1.0001, -1.5, w, h);
    vertex(1.5, -1.0001, -1.5, 0, h);
    
    endShape();
  }
}
