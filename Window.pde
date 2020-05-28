class Window {
  PImage windowImg;

  Window() {
    windowImg = loadImage("window.jpg");
  }

  void drawWindow() { 
    int w = windowImg.width;
    int h = windowImg.height;
    
    beginShape(QUADS);
    texture(windowImg);

    getWindows(1, w, h);
    getWindows(-1, w, h);

    endShape();
  }
  
  void getWindows(int dir, int w, int h)
  {
    vertex(1.0001 * dir, -0.35, 0.75, 0, 0);
    vertex(1.0001 * dir, -0.35, 0.05, w, 0);
    vertex(1.0001 * dir, 0.35, 0.05, w, h);
    vertex(1.0001 * dir, 0.35, 0.75, 0, h);

    vertex(1.0001 * dir, -0.35, -0.75, 0, 0);
    vertex(1.0001 * dir, -0.35, -0.05, w, 0);
    vertex(1.0001 * dir, 0.35, -0.05, w, h);
    vertex(1.0001 * dir, 0.35, -0.75, 0, h);
  }
}
