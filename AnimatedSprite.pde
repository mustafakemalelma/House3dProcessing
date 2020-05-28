//https://processing.org/examples/animatedsprite.html

class AnimatedSprite {
  PImage[] images;
  int imageCount;
  
  float time;
  
  AnimatedSprite(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i+1, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos, float w, float h, float timeFactor) {
    time += (1 / frameRate) * timeFactor;
    
    int frame = (int) time % imageCount;
    image(images[frame], xpos, ypos, w, h);
  }
  
  int getWidth() {
    return images[0].width;
  }
}
