Camera cam;

Wall wall;
Door door;
Roof roof;
Window window;
Painting painting;
Fireplace fireplace;
Garden garden;

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
