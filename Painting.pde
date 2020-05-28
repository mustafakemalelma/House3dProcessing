class Painting{
  PImage paintingImg1, paintingImg2;

  Painting() {
    paintingImg1 = loadImage("painting1.jpg");
    paintingImg2 = loadImage("painting2.jpg");
  }

  void drawPaintings() {
    getPainting(paintingImg1, 1);
    getPainting(paintingImg2, -1);
  }
  
  void getPainting(PImage text, int dir) {
    int w = text.width;
    int h = text.height;
    
    beginShape(QUADS);
    texture(text);
    
    vertex(-0.8 * dir, -0.7, -0.9999, 0, 0);
    vertex(-0.3 * dir, -0.7, -0.9999, w, 0);
    vertex(-0.3 * dir, -0.1, -0.9999, w, h);
    vertex(-0.8 * dir, -0.1, -0.9999, 0, h);
    
    endShape();
  }
}
