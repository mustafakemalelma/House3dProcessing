class Garden {
  PImage grassImg, fenceImg;
  float gardenWidth, fenceWidth, fenceHeight;
  
  int fenceCountOnEachEdge;
  float distBetweenFences;
  
  Garden() {
    grassImg = loadImage("grass.jpg");
    fenceImg = loadImage("wood.jpg");
    
    gardenWidth = 10;
    fenceWidth = 0.5;
    fenceHeight = 0.25;
    fenceCountOnEachEdge = 8;
    
    distBetweenFences = (gardenWidth - fenceCountOnEachEdge * fenceWidth) / (fenceCountOnEachEdge - 1);
  }
  
  void drawGarden() {
    drawGrass();
    
    int passedEdgeCount = 0;
    for(int i = 0; i < fenceCountOnEachEdge * 4; i++) {
      pushMatrix();
      
      int fenceNoInEachEdge = i % fenceCountOnEachEdge; 
      if(fenceNoInEachEdge == 0 && i != 0) {
         
        passedEdgeCount += 1;
      }
      
      rotateY(radians(-90 * passedEdgeCount));
      translate((distBetweenFences + fenceWidth) * fenceNoInEachEdge, 0, 0);
      drawFence();
      
      popMatrix();
    }
  }
  
  void drawGrass() {
    int w = grassImg.width;
    int h = grassImg.height;
    
    beginShape(QUADS);
    texture(grassImg);
    
    vertex(-gardenWidth / 2, 1.001, -gardenWidth / 2, 0, 0);
    vertex(gardenWidth / 2, 1.001, -gardenWidth / 2, w, 0);
    vertex(gardenWidth / 2, 1.001, gardenWidth / 2, w, h);
    vertex(-gardenWidth / 2, 1.001, gardenWidth / 2, 0, h);
    
    endShape();
  }
  
  void drawFence() {
    int w = fenceImg.width;
    int h = fenceImg.height;
    
    beginShape(QUADS);
    texture(fenceImg);
    
    vertex(-gardenWidth / 2, 0.999, -gardenWidth / 2, 0, 0);
    vertex(-gardenWidth / 2 + fenceWidth, 0.999, -gardenWidth / 2, w, 0);
    vertex(-gardenWidth / 2 + fenceWidth, -fenceHeight, -gardenWidth / 2, w, h);
    vertex(-gardenWidth / 2, -fenceHeight, -gardenWidth / 2, 0, h);
    
    endShape();
  }
}
