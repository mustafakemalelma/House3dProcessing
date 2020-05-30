class Chimney {
  PImage chimneyImg;
  
  Chimney() {
    chimneyImg = roof.roofImg;
  }
  
  void drawChimney() {
    int w = chimneyImg.width;
    int h = chimneyImg.height;
    
    pushMatrix();
    translate(HOUSE_WIDTH / 2, -HOUSE_HEIGHT, 0);
    
    beginShape(QUADS);
    texture(chimneyImg);
    
    getXFace(1, w, h);
    getXFace(-1, w, h);
    
    getZFace(1, w, h);
    getZFace(-1, w, h);
    
    endShape();
    
    popMatrix();
  }
  
  void getXFace(int dir, int w, int h) {
    vertex(CHIMNEY_WIDTH * dir, 0, CHIMNEY_WIDTH, 0, h);
    vertex(CHIMNEY_WIDTH * dir, 0, -CHIMNEY_WIDTH, w, h);
    vertex(CHIMNEY_WIDTH * dir, -CHIMNEY_HEIGHT, -CHIMNEY_WIDTH, w, 0);
    vertex(CHIMNEY_WIDTH * dir, -CHIMNEY_HEIGHT, CHIMNEY_WIDTH, 0, 0);
  }
  
  void getZFace(int dir, int w, int h) {
    vertex(-CHIMNEY_WIDTH, 0, CHIMNEY_WIDTH * dir, 0, h);
    vertex(CHIMNEY_WIDTH, 0, CHIMNEY_WIDTH * dir, w, h);
    vertex(CHIMNEY_WIDTH, -CHIMNEY_HEIGHT, CHIMNEY_WIDTH * dir, w, 0);
    vertex(-CHIMNEY_WIDTH, -CHIMNEY_HEIGHT, CHIMNEY_WIDTH * dir, 0, 0);
  }
}
