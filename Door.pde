class Door {
  PImage doorImg;

  Door() {
    doorImg = loadImage("door.jpg");
  }

  void drawDoors() {
    int w = doorImg.width;
    int h = doorImg.height;

    beginShape(QUADS);
    texture(doorImg);

    vertex(-DOOR_WIDTH, -DOOR_HEIGHT, HOUSE_WIDTH + 0.001, 0, 0);
    vertex( DOOR_WIDTH, -DOOR_HEIGHT, HOUSE_WIDTH + 0.001, w, 0);
    vertex( DOOR_WIDTH, 0, HOUSE_WIDTH + 0.001, w, h);
    vertex(-DOOR_WIDTH, 0, HOUSE_WIDTH + 0.001, 0, h);

    vertex(-DOOR_WIDTH, -DOOR_HEIGHT, HOUSE_WIDTH - 0.001, 0, 0);
    vertex( DOOR_WIDTH, -DOOR_HEIGHT, HOUSE_WIDTH - 0.001, w, 0);
    vertex( DOOR_WIDTH, 0, HOUSE_WIDTH - 0.001, w, h);
    vertex(-DOOR_WIDTH, 0, HOUSE_WIDTH - 0.001, 0, h);

    endShape();
  }
}
