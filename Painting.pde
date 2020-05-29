class Painting{
  PImage paintingImg1, paintingImg2;

  Painting() {
    paintingImg1 = loadImage("painting1.jpg");
    paintingImg2 = loadImage("painting2.jpg");
  }

  void drawPaintings() {
    pushMatrix();
    translate(-PAINTING_DISTANCE, 0, 0);
    getPainting(paintingImg1);
    popMatrix();
    
    pushMatrix();
    translate(PAINTING_DISTANCE, 0, 0);
    getPainting(paintingImg2);
    popMatrix();
  }
  
  void getPainting(PImage text) {
    int w = text.width;
    int h = text.height;
    
    beginShape(QUADS);
    texture(text);
    
    float z = -HOUSE_WIDTH + 0.001;
    float y = -HOUSE_HEIGHT / 2 - 1;
    vertex(PAINTING_WIDTH, y - PAINTING_HEIGHT, z, 0, 0);
    vertex(-PAINTING_WIDTH, y - PAINTING_HEIGHT, z, w, 0);
    vertex(-PAINTING_WIDTH, y + PAINTING_HEIGHT, z, w, h);
    vertex(PAINTING_WIDTH, y + PAINTING_HEIGHT, z, 0, h);
    
    endShape();
  }
}
