class Chair {
  PImage chairImg, legImg;

  float sitSizeX, sitSizeY, sitSizeZ;
  float backSizeX, backSizeY, backSizeZ;
  float legWidth, legHeight;

  PShape leg1, leg2, leg3, leg4, sit, back;

  Collider cl1;

  Chair() {
    chairImg = loadImage("chair.jpg");
    legImg = loadImage("table.jpg");

    sitSizeX = backSizeZ = 0.6;
    sitSizeY = backSizeX = 0.25;
    sitSizeZ = backSizeY = 0.6;

    legWidth = 0.25;
    legHeight = 1;

    noStroke();
    leg1 = createShape(BOX, legWidth, legHeight, legWidth);
    leg1.setTexture(legImg);

    leg2 = createShape(BOX, legWidth, legHeight, legWidth);
    leg2.setTexture(legImg);

    leg3 = createShape(BOX, legWidth, legHeight, legWidth);
    leg3.setTexture(legImg);

    leg4 = createShape(BOX, legWidth, legHeight, legWidth);
    leg4.setTexture(legImg);

    sit = createShape(BOX, 2 * sitSizeX, sitSizeY, 2 * sitSizeZ);
    sit.setTexture(chairImg);

    back = createShape(BOX, backSizeX, 2 * backSizeY, 2 * backSizeZ);
    back.setTexture(chairImg);

    cl1 = new Collider("Chair", -HOUSE_WIDTH + 2 * table.tableSizeX, 0, sitSizeX + 0.25, 1, sitSizeZ + 0.25);
    colliderMng.addCollider(cl1);
  }

  void drawChair() {
    pushMatrix();
    translate(-HOUSE_WIDTH + 2 * table.tableSizeX, 0, 0);

    getChair();
    popMatrix();
  }

  void getChair() {
    float legOffsetX = sitSizeX - legWidth;
    float legOffsetZ = sitSizeZ - legWidth;

    pushMatrix();
    translate(-legOffsetX, -legHeight / 2, legOffsetZ);
    shape(leg1);
    popMatrix();

    pushMatrix();
    translate(legOffsetX, -legHeight / 2, legOffsetZ);
    shape(leg2);
    popMatrix();

    pushMatrix();
    translate(legOffsetX, -legHeight / 2, -legOffsetZ);
    shape(leg3);
    popMatrix();

    pushMatrix();
    translate(-legOffsetX, -legHeight / 2, -legOffsetZ);
    shape(leg4);
    popMatrix();

    pushMatrix();
    translate(0, -legHeight, 0);
    shape(sit);
    popMatrix();

    pushMatrix();
    translate(sitSizeX, -legHeight - backSizeY, 0);
    shape(back);
    popMatrix();
  }
}
