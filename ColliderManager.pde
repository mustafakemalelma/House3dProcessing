class Collider {
  String tag;
  PVector center, size;

  float xMin, xMax, yMin, yMax, zMin, zMax;

  Collider(String tag, float centerX, float centerY, float centerZ, 
    float xSize, float ySize, float zSize) {
    this.tag = tag;

    center = new PVector(centerX, centerY, centerZ);
    size = new PVector(xSize, ySize, zSize);

    xMin = center.x - size.x;
    xMax = center.x + size.x;

    yMin = center.y - size.y;
    yMax = center.y + size.y;

    zMin = center.z - size.z;
    zMax = center.z + size.z;
  }

  void drawColl() {
    pushMatrix();
    translate(center.x, center.y, center.z);
    box(size.x * 2, size.y * 2, size.z * 2);
    popMatrix();
  }

  boolean isPointInBounds(PVector p) {
    boolean isXInBound = p.x >= xMin && p.x <= xMax;
    boolean isYInBound = p.y >= yMin && p.y <= yMax;
    boolean isZInBound = p.z >= zMin && p.z <= zMax;

    return isXInBound && isYInBound && isZInBound;
  }
}

class ColliderManager {
  ArrayList<Collider> colliders;

  ColliderManager() {
    colliders = new ArrayList();

    float gardenSize = scaleFactor * GARDEN_SIZE / 2; 

    Collider cl1 = new Collider("Front fences", 0, 0, -gardenSize, gardenSize, 50, 100);
    colliders.add(cl1);

    Collider cl2 = new Collider("Back Fences", 0, 0, gardenSize, gardenSize, 50, 100);
    colliders.add(cl2);

    Collider cl3 = new Collider("Left Fences", -gardenSize, 0, 0, 100, 50, gardenSize);
    colliders.add(cl3);

    Collider cl4 = new Collider("Right Fences", gardenSize, 0, 0, 100, 50, gardenSize);
    colliders.add(cl4);
  }

  boolean checkCollision(PVector pos) {
    for (int i = 0; i < colliders.size(); i++) {
      Collider cl = colliders.get(i);
      if (cl.isPointInBounds(pos))
        return true;
    }

    return false;
  }
}
