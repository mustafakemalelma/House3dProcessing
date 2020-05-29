//Fire animation sprites
//Designed by upklyak / Freepik
//https://www.freepik.com/free-photos-vectors/light

class Fireplace{
  PImage fireplaceBgImg;
  AnimatedSprite fireAnim;
  
  Fireplace(){
    fireplaceBgImg = loadImage("fireplace.png");
    
    fireAnim = new AnimatedSprite("firesprite/fire", 10);
  }
  
  void drawFireplace() {
    int w = fireplaceBgImg.width;
    int h = fireplaceBgImg.height;
    
    beginShape(QUADS);
    texture(fireplaceBgImg);
    
    float z = -HOUSE_WIDTH + 0.001;
    vertex(-FIREPLACE_WIDTH, -FIREPLACE_HEIGHT, z, 0, 0);
    vertex(FIREPLACE_WIDTH, -FIREPLACE_HEIGHT, z, w, 0);
    vertex(FIREPLACE_WIDTH, 0, z, w, h);
    vertex(-FIREPLACE_WIDTH, 0, z, 0, h);
    
    endShape();
    
    pushMatrix();
    translate(0, 0, -0.9998);
    fireAnim.display(-0.3, 0.4, 0.6, 0.6, 10);
    popMatrix();
  }
}
