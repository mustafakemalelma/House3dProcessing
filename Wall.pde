class Wall {
  PImage wallImg, wallImg2;

  Wall() {
    wallImg = loadImage("wall.jpg");
    wallImg2 = loadImage("wall2.jpg");
  }

  void drawWalls() {
    int w = wallImg.width * (int) HOUSE_WIDTH;
    int h = wallImg.height * (int) HOUSE_WIDTH;
    int w2 = wallImg.width * (int) HOUSE_WIDTH;
    int h2 = wallImg.height * (int) HOUSE_WIDTH;

    beginShape(QUADS);
    texture(wallImg);
    textureWrap(REPEAT);
    getXFace(1, w, h);
    getXFace(-1, w, h);

    getZFace(1, w, h);
    getZFace(-1, w, h);
    endShape();
    
    beginShape(QUADS);
    texture(wallImg2);
    textureWrap(REPEAT);
    getYFace(1, w2, h2);
    getYFace(-1, w2, h2);
    endShape();
  }

  void getXFace(int dir, int w, int h) {
    vertex( HOUSE_WIDTH * dir, -HOUSE_HEIGHT, HOUSE_WIDTH, 0, 0);
    vertex( HOUSE_WIDTH * dir, -HOUSE_HEIGHT, -HOUSE_WIDTH, w, 0);
    vertex( HOUSE_WIDTH * dir, 0, -HOUSE_WIDTH, w, h);
    vertex( HOUSE_WIDTH * dir, 0, HOUSE_WIDTH, 0, h);
  }

  void getYFace(int dir, int w, int h) {
    vertex(-HOUSE_WIDTH, (dir == -1 ? -HOUSE_HEIGHT : -0.001), HOUSE_WIDTH, 0, 0);
    vertex( HOUSE_WIDTH, (dir == -1 ? -HOUSE_HEIGHT : -0.001), HOUSE_WIDTH, w, 0);
    vertex( HOUSE_WIDTH, (dir == -1 ? -HOUSE_HEIGHT : -0.001), -HOUSE_WIDTH, w, h);
    vertex(-HOUSE_WIDTH, (dir == -1 ? -HOUSE_HEIGHT : -0.001), -HOUSE_WIDTH, 0, h);
  }

  void getZFace(int dir, int w, int h) {
    vertex(-HOUSE_WIDTH, -HOUSE_HEIGHT, HOUSE_WIDTH * dir, 0, 0);
    vertex( HOUSE_WIDTH, -HOUSE_HEIGHT, HOUSE_WIDTH * dir, w, 0);
    vertex( HOUSE_WIDTH, 0, HOUSE_WIDTH * dir, w, h);
    vertex(-HOUSE_WIDTH, 0, HOUSE_WIDTH * dir, 0, h);
  }
}
