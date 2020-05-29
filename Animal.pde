class Animal {
  PImage texture;
  
  float startX, startZ, xSize, ySize;
  int animDir = 1;

  Animal(String imgPath, float xSize, float ySize) {
    texture = loadImage(imgPath);
    
    this.xSize = xSize;
    this.ySize = ySize;
    
    startX = garden.getRandomCoordInGarden();
    startZ = garden.getRandomCoordInGarden();
  }

  void drawAnimal() {
    int w = texture.width;
    int h = texture.height;

    pushMatrix();
    translate(startX, 0, 0);
    
    beginShape(QUADS);
    texture(texture);

    vertex(-xSize, -ySize, startZ, 0, 0);
    vertex(xSize, -ySize, startZ, w, 0);
    vertex(xSize, 0, startZ, w, h);
    vertex(-xSize, 0, startZ, 0, h);

    endShape();
    
    popMatrix();
    
    startX += animDir * ANIMAL_SPEED;
    if(startX >= MAX_SPAWNABLE_SIZE || startX <= -MAX_SPAWNABLE_SIZE)
      animDir *= -1;
  }
}
