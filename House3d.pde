Camera cam;

Wall wall;
Door door;
Roof roof;
Window window;
Painting painting;
Fireplace fireplace;
Garden garden;

ColliderManager colliderMng;
Collider cl1, cl2, cl3, cl4;

void setup() {
  size(800, 800, P3D);

  cam = new Camera();

  wall = new Wall();
  door = new Door();
  roof = new Roof();
  window = new Window();
  painting = new Painting();
  fireplace = new Fireplace();
  garden = new Garden();
  
  colliderMng = new ColliderManager();
  cl1 = new Collider("Front fences", 0, 0, -500, 500, 50, 100);
  colliderMng.pushCollider(cl1);
  
  cl2 = new Collider("Back Fences", 0, 0, 500, 500, 50, 100);
  colliderMng.pushCollider(cl2);
  
  cl3 = new Collider("Left Fences", -500, 0, 0, 100, 50, 500);
  colliderMng.pushCollider(cl3);
  
  cl4 = new Collider("Right Fences", 500, 0, 0, 100, 50, 500);
  colliderMng.pushCollider(cl4);
}

void draw() {
  background(0);
  noStroke();

  cam.process();

  pushMatrix();
  scale(100);

  wall.drawWalls();
  door.drawDoors();
  roof.drawRoof();
  window.drawWindow();
  painting.drawPaintings();
  fireplace.drawFireplace();
  garden.drawGarden();

  popMatrix();
}

void mousePressed() {
  cam.processMousePress();
}

void mouseDragged() {
  cam.processMouseDrag();
}

void mouseReleased() {
  cam.processMouseRelease();
}
