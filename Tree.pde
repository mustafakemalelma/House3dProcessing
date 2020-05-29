class Tree {
  PImage bodyImg, leafImg;

  int detail;
  float angle;

  float xPos, zPos, treeHeight, treeR, leafHeight, leafR;

  Tree(float xPos, float zPos) {
    bodyImg = loadImage("tree-body.jpg");
    leafImg = loadImage("tree-leaf.jpg");

    detail = 60;
    angle = 360 / detail;
    
    this.xPos = xPos;
    this.zPos = zPos;
    
    treeHeight = random(3, 7);
    treeR = random(0.25, 0.6);
    leafHeight = random(1, 4);
    leafR = random(treeR + 0.5, treeR + 2);
  }

  void drawTree() {
    pushMatrix();
    translate(xPos, 0, zPos);

    drawBody();
    drawLeaves();

    popMatrix();
  }

  void drawLeaves() {
    float w = leafImg.width;
    float h = leafImg.height;

    beginShape(TRIANGLES);
    texture(leafImg);

    for (int i = 0; i < detail; i++) {
      vertex(0, -leafHeight - treeHeight, 0, 0, 0);
      vertex(leafR * cos(radians(i*angle)), -treeHeight / 2, leafR * sin(radians(i*angle)), w, h);
      vertex(leafR * cos(radians((i+1)*angle)), -treeHeight / 2, leafR * sin(radians((i+1)*angle)), 0, h);
    }

    endShape();
  }

  void drawBody() {
    float w = bodyImg.width / detail;
    float h = bodyImg.height;

    beginShape(QUADS);
    texture(bodyImg);

    for (int i = 0; i < detail; i++) {
      vertex(treeR * cos(radians(i*angle)), 0, treeR * sin(radians(i*angle)), w*i, 0);
      vertex(treeR * cos(radians((i+1)*angle)), 0, treeR * sin(radians((i+1)*angle)), w*(i+1), 0);
      vertex(treeR * cos(radians((i+1)*angle)), -treeHeight, treeR * sin(radians((i+1)*angle)), w*(i+1), h);
      vertex(treeR * cos(radians(i*angle)), -treeHeight, treeR * sin(radians(i*angle)), w*i, h);
    }

    endShape();
  }
}
