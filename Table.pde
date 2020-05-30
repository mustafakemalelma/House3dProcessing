class TableF {
  PImage tableImg;

  float tableSizeX, tableSizeY, tableSizeZ;
  float legWidth, legHeight;

  PShape backLeftLeg, backRightLeg, frontLeftLeg, frontRightLeg, tableShape;

  Collider cl1;

  TableF() {
    tableImg = loadImage("table.jpg");

    tableSizeX = 1;
    tableSizeY = 0.25;
    tableSizeZ = 2;

    legWidth = 0.25;
    legHeight = 1.5;

    noStroke();
    backLeftLeg = createShape(BOX, legWidth, legHeight, legWidth);
    backLeftLeg.setTexture(tableImg);

    backRightLeg = createShape(BOX, legWidth, legHeight, legWidth);
    backRightLeg.setTexture(tableImg);

    frontLeftLeg = createShape(BOX, legWidth, legHeight, legWidth);
    frontLeftLeg.setTexture(tableImg);

    frontRightLeg = createShape(BOX, legWidth, legHeight, legWidth);
    frontRightLeg.setTexture(tableImg);

    tableShape = createShape(BOX, 2 * tableSizeX, tableSizeY, 2 * tableSizeZ);
    tableShape.setTexture(tableImg);

    cl1 = new Collider("Table", -HOUSE_WIDTH + tableSizeX, 0, tableSizeX + 0.25, 1, tableSizeZ + 0.25);
    colliderMng.addCollider(cl1);
  }

  void drawTable() {
    pushMatrix();
    translate(-HOUSE_WIDTH + tableSizeX + 0.001, 0, 0);

    getTable();
    popMatrix();
  }

  void getTable() {
    float legOffsetX = tableSizeX - legWidth;
    float legOffsetZ = tableSizeZ - legWidth;

    //back left leg
    pushMatrix();
    translate(-legOffsetX, -legHeight / 2, legOffsetZ);
    shape(backLeftLeg);
    popMatrix();

    //back right leg
    pushMatrix();
    translate(legOffsetX, -legHeight / 2, legOffsetZ);
    shape(backLeftLeg);
    popMatrix();

    //front right leg
    pushMatrix();
    translate(legOffsetX, -legHeight / 2, -legOffsetZ);
    shape(backLeftLeg);
    popMatrix();

    //front left leg
    pushMatrix();
    translate(-legOffsetX, -legHeight / 2, -legOffsetZ);
    shape(backLeftLeg);
    popMatrix();

    //table
    pushMatrix();
    translate(0, -legHeight, 0);
    shape(tableShape);
    popMatrix();
  }
}
