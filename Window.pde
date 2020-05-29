class Window {
  PImage windowImg;

  Window() {
    windowImg = loadImage("window.jpg");
  }

  void drawWindow() { 
    int w = windowImg.width;
    int h = windowImg.height;

    pushMatrix();
    translate(0, 0, WINDOW_DISTANCE);
    getWindows(1, w, h);
    getWindows(-1, w, h);
    popMatrix();
    
    pushMatrix();
    translate(0, 0, -WINDOW_DISTANCE);
    getWindows(1, w, h);
    getWindows(-1, w, h);
    popMatrix();
  }

  void getWindows(int dir, int w, int h)
  {
    beginShape(QUADS);
    texture(windowImg);
    
    float halfWall = -HOUSE_HEIGHT / 2;
    vertex(HOUSE_WIDTH * dir + 0.001, halfWall - WINDOW_SIZE, WINDOW_SIZE, 0, 0);
    vertex(HOUSE_WIDTH * dir + 0.001, halfWall - WINDOW_SIZE, -WINDOW_SIZE, w, 0);
    vertex(HOUSE_WIDTH * dir + 0.001, halfWall + WINDOW_SIZE, -WINDOW_SIZE, w, h);
    vertex(HOUSE_WIDTH * dir + 0.001, halfWall + WINDOW_SIZE, WINDOW_SIZE, 0, h);

    vertex(HOUSE_WIDTH * dir - 0.001, halfWall - WINDOW_SIZE, WINDOW_SIZE, 0, 0);
    vertex(HOUSE_WIDTH * dir - 0.001, halfWall - WINDOW_SIZE, -WINDOW_SIZE, w, 0);
    vertex(HOUSE_WIDTH * dir - 0.001, halfWall + WINDOW_SIZE, -WINDOW_SIZE, w, h);
    vertex(HOUSE_WIDTH * dir - 0.001, halfWall + WINDOW_SIZE, WINDOW_SIZE, 0, h);
    
    endShape();
  }
}
