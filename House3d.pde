Camera cam;

Wall wall;
Door door;
Roof roof;
Window window;
Painting painting;
Fireplace fireplace;
Garden garden;
Animal unicorn;
Animal dog;

ColliderManager colliderMng;
Collider cl1, cl2, cl3, cl4;

int scaleFactor;

void setup() {
  size(800, 800, P3D);
  scaleFactor = 100;

  cam = new Camera();

  wall = new Wall();
  door = new Door();
  roof = new Roof();
  window = new Window();
  painting = new Painting();
  fireplace = new Fireplace();
  garden = new Garden();
  unicorn = new Animal("unicorn.png", 1, 1.5);
  dog = new Animal("lab.png", 1, 0.2);
  
  colliderMng = new ColliderManager();
}

void draw() {
  background(0);
  noStroke();

  cam.process();

  pushMatrix();
  scale(scaleFactor);

  wall.drawWalls();
  door.drawDoors();
  roof.drawRoof();
  window.drawWindow();
  painting.drawPaintings();
  fireplace.drawFireplace();
  garden.drawGarden();
  unicorn.drawAnimal();
  dog.drawAnimal();

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
