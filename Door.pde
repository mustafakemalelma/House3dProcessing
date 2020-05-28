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

    vertex(-0.5, -0.7, 1.0001, 0, 0);
    vertex( 0.5, -0.7, 1.0001, w, 0);
    vertex( 0.5, 1, 1.0001, w, h);
    vertex(-0.5, 1, 1.0001, 0, h);

    vertex(-0.5, -0.7, 0.9999, 0, 0);
    vertex( 0.5, -0.7, 0.9999, w, 0);
    vertex( 0.5, 1, 0.9999, w, h);
    vertex(-0.5, 1, 0.9999, 0, h);

    endShape();
  }
}
