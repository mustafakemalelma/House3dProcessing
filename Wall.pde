class Wall {
  PImage wallImg, wallImg2;

  Collider cl1, cl2, cl3, cl4, cl5;

  Wall() {
    wallImg = loadImage("wall.jpg");
    wallImg2 = loadImage("wall2.jpg");
    
    cl1 = new Collider("Back Wall", 0, -HOUSE_WIDTH, HOUSE_WIDTH, 1, 1);
    colliderMng.addCollider(cl1);
    
    cl2 = new Collider("Left Wall", -HOUSE_WIDTH, 0, 1, 1, HOUSE_WIDTH);
    colliderMng.addCollider(cl2);
    
    cl3 = new Collider("Right Wall", HOUSE_WIDTH, 0, 1, 1, HOUSE_WIDTH);
    colliderMng.addCollider(cl3);
    
    float centerPoint = (HOUSE_WIDTH - DOOR_WIDTH) / 2;
    cl4 = new Collider("Front Left Wall", -centerPoint - DOOR_WIDTH, HOUSE_WIDTH, centerPoint, 1, 1);
    colliderMng.addCollider(cl4);
    
    cl5 = new Collider("Front Right Wall", centerPoint + DOOR_WIDTH, HOUSE_WIDTH, centerPoint, 1, 1);
    colliderMng.addCollider(cl5);
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
