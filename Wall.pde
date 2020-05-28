class Wall {
  PImage wallImg;

  Wall() {
    wallImg = loadImage("wall.jpg");
  }

  void drawWalls() {
    int w = wallImg.width;
    int h = wallImg.height;

    beginShape(QUADS);
    texture(wallImg);

    getXFace(1, w, h);
    getXFace(-1, w, h);

    getYFace(1, w, h);
    getYFace(-1, w, h);

    getZFace(1, w, h);
    getZFace(-1, w, h);

    endShape();
  }

  void getXFace(int dir, int w, int h) {
    vertex( 1 * dir, -1, 1, 0, 0);
    vertex( 1 * dir, -1, -1, w, 0);
    vertex( 1 * dir, 1, -1, w, h);
    vertex( 1 * dir, 1, 1, 0, h);
  }

  void getYFace(int dir, int w, int h) {
    vertex(-1, 1 * dir, 1, 0, 0);
    vertex( 1, 1 * dir, 1, w, 0);
    vertex( 1, 1 * dir, -1, w, h);
    vertex(-1, 1 * dir, -1, 0, h);
  }

  void getZFace(int dir, int w, int h) {
    vertex(-1, -1, 1 * dir, 0, 0);
    vertex( 1, -1, 1 * dir, w, 0);
    vertex( 1, 1, 1 * dir, w, h);
    vertex(-1, 1, 1 * dir, 0, h);
  }
}
