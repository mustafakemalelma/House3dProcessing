class Camera {
  PVector pos, center, dir;
  float speed;
  float rotY = HALF_PI, lastX, distX;

  Camera() {
    pos = new PVector(0, 0, 300);

    dir = new PVector(-pos.x, -pos.y, -pos.z);
    dir.normalize();

    center = new PVector(0, 0, 0);

    speed = 5;
  }

  void process() {
    dir.x = -cos(rotY + distX);
    dir.z = -sin(rotY + distX);
    dir.normalize();

    if (keyPressed) {
      if (keyCode == UP) {
        PVector nextPos = PVector.add(pos, PVector.mult(dir, speed));
        if(!colliderMng.checkCollision(nextPos))
          pos.add(PVector.mult(dir, speed));
      }
      if (keyCode == DOWN) {
        PVector nextPos = PVector.add(pos, PVector.mult(dir, -speed));
        if(!colliderMng.checkCollision(nextPos))
          pos.add(PVector.mult(dir, -speed));
      }
    }

    center = PVector.add(PVector.mult(dir, 300), pos);
    camera(pos.x, pos.y, pos.z, center.x, center.y, center.z, 0, 1, 0);
  }

  void processMousePress() {
    lastX = mouseX;
  }

  void processMouseDrag() {
    distX = radians(mouseX - lastX);
  }

  void processMouseRelease() { 
    rotY += distX;
    distX = 0;
  }
}
