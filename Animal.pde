class Animal {
  PImage texture;
  
  float startX, startZ, xSize, ySize;
  int animDir = 1;
  
  float halfGardenSize;

  Animal(String imgPath, float xSize, float ySize) {
    texture = loadImage(imgPath);
    
    this.xSize = xSize;
    this.ySize = ySize;
    
    halfGardenSize = garden.gardenWidth / 2;
    getRandomStart();
  }

  void drawAnimal() {
    int w = texture.width;
    int h = texture.height;

    beginShape(QUADS);
    texture(texture);

    vertex(startX, -ySize, startZ, 0, 0);
    vertex(startX + xSize, -ySize, startZ, w, 0);
    vertex(startX + xSize, 1, startZ, w, h);
    vertex(startX, 1, startZ, 0, h);

    endShape();
    
    startX += animDir * 0.01;
    if(startX >= halfGardenSize || startX <= -halfGardenSize)
      animDir *= -1;
  }
  
  void getRandomStart() {
    startX = random(-halfGardenSize, halfGardenSize);
    startX += (startX >= -2 && startX <= 2 ? 2.5 : 0);
    
    startZ = random(-halfGardenSize, halfGardenSize);
    startZ += (startZ >= -2 && startZ <= 2 ? 2.5 : 0);
  }
}
