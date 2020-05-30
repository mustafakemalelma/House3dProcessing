class Garden {
  PImage grassImg, fenceImg;
  
  float distBetweenFences;
  
  Collider cl1, cl2, cl3, cl4;
  
  Garden() {
    grassImg = loadImage("grass.jpg");
    fenceImg = loadImage("wood.jpg");
    
    distBetweenFences = (2 * GARDEN_SIZE - FENCE_COUNT * FENCE_WIDTH) / FENCE_COUNT;
    
    cl1 = new Collider("Back Fences", 0, -GARDEN_SIZE, GARDEN_SIZE, 1, 1);
    colliderMng.addCollider(cl1);
    
    cl2 = new Collider("Front Fences", 0, GARDEN_SIZE, GARDEN_SIZE, 1, 1);
    colliderMng.addCollider(cl2);
    
    cl3 = new Collider("Left Fences", -GARDEN_SIZE, 0, 1, 1, GARDEN_SIZE);
    colliderMng.addCollider(cl3);
    
    cl4 = new Collider("Right Fences", GARDEN_SIZE, 0, 1, 1, GARDEN_SIZE);
    colliderMng.addCollider(cl4);
  }
  
  void drawGarden() {
    drawGrass();
    drawFences();
  }
  
  void drawFences() {
    int passedEdgeCount = 0;
    for(int i = 0; i < FENCE_COUNT * 4; i++) {
      pushMatrix();
      
      int fenceNoInEachEdge = i % FENCE_COUNT; 
      if(fenceNoInEachEdge == 0 && i != 0) {
         
        passedEdgeCount += 1;
      }
      
      rotateY(radians(-90 * passedEdgeCount));
      translate((distBetweenFences + FENCE_WIDTH) * fenceNoInEachEdge, 0, 0);
      drawFence();
      
      popMatrix();
    }
  }
  
  void drawGrass() {
    int w = grassImg.width * 2;
    int h = grassImg.height * 2;
    
    beginShape(QUADS);
    texture(grassImg);
    textureWrap(REPEAT);
    
    vertex(-GARDEN_SIZE, 0, -GARDEN_SIZE, 0, 0);
    vertex(GARDEN_SIZE, 0, -GARDEN_SIZE, w, 0);
    vertex(GARDEN_SIZE, 0, GARDEN_SIZE, w, h);
    vertex(-GARDEN_SIZE, 0, GARDEN_SIZE, 0, h);
    
    endShape();
  }
  
  void drawFence() {
    int w = fenceImg.width;
    int h = fenceImg.height;
    
    beginShape(QUAD);
    texture(fenceImg);
    
    vertex(-GARDEN_SIZE, 0, -GARDEN_SIZE, 0, 0);
    vertex(-GARDEN_SIZE + FENCE_WIDTH, 0, -GARDEN_SIZE, w, 0);
    vertex(-GARDEN_SIZE + FENCE_WIDTH, -FENCE_HEIGHT, -GARDEN_SIZE, w, h);
    vertex(-GARDEN_SIZE, -FENCE_HEIGHT, -GARDEN_SIZE, 0, h);
    
    endShape();
  }
  
  float getRandomCoordInGarden() {
    float rndRes = random(-MAX_SPAWNABLE_SIZE, MAX_SPAWNABLE_SIZE);
    if(rndRes >= -MIN_SPAWNABLE_SIZE && rndRes <= MIN_SPAWNABLE_SIZE)
      rndRes = MAX_SPAWNABLE_SIZE * signum(rndRes) - rndRes;
    
    return rndRes;
  }
  
  int signum(float num) {
    return num >= 0 ? 1 : -1;
  }
}
