float HOUSE_WIDTH = 4;
float HOUSE_HEIGHT = 6;

float GARDEN_SIZE = 15;
float MAX_SPAWNABLE_SIZE = GARDEN_SIZE - 1.5;
float MIN_SPAWNABLE_SIZE = HOUSE_WIDTH + 1.5;

int FENCE_COUNT = 30;
float FENCE_HEIGHT = 3;
float FENCE_WIDTH = 0.5;

float DOOR_HEIGHT = 4.5;
float DOOR_WIDTH = 1.5;

float ROOF_HEIGHT = 2;

float WINDOW_SIZE = 1;
float WINDOW_DISTANCE = 1.5;

float PAINTING_WIDTH = 0.5;
float PAINTING_HEIGHT = 0.8;
float PAINTING_DISTANCE = 2;

float FIREPLACE_WIDTH = 1.2;
float FIREPLACE_HEIGHT = 2.3;
float FIRE_SIZE = 1.4;

float ANIMAL_SPEED = 0.05;

int TREE_COUNT = 10;

float CAMERA_Y_POS = -3;
float CAMERA_Z_START_POS = 8;
float CAMERA_SPEED = 10;

float CHIMNEY_WIDTH = 0.5;
float CHIMNEY_HEIGHT = 3;

float CLOCK_SIZE = 1;

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
Chimney chimney;
TableF table;
Chair chair;
AnalogClock analogClock;

ArrayList<Tree> trees;

ColliderManager colliderMng;

int scaleFactor;

void setup() {
  size(800, 600, P3D);
  scaleFactor = 100;

  cam = new Camera(new PVector(0, CAMERA_Y_POS * scaleFactor, CAMERA_Z_START_POS * scaleFactor));
  
  colliderMng = new ColliderManager();

  wall = new Wall();
  door = new Door();
  roof = new Roof();
  window = new Window();
  painting = new Painting();
  fireplace = new Fireplace();
  garden = new Garden();
  unicorn = new Animal("unicorn.png", 1.5, 3);
  dog = new Animal("lab.png", 1.5, 2);
  chimney = new Chimney();
  table = new TableF();
  chair = new Chair();
  analogClock = new AnalogClock();
  
  trees = new ArrayList();
  for(int i = 0; i < TREE_COUNT; i++) {
    float rX = garden.getRandomCoordInGarden();
    float rZ = garden.getRandomCoordInGarden();
    
    trees.add(new Tree(rX, rZ));
  }
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
  chimney.drawChimney();
  table.drawTable();
  chair.drawChair();
  garden.drawGarden();
 
  for(int i = 0; i < TREE_COUNT; i++)
    trees.get(i).drawTree();
  
  unicorn.drawAnimal();
  dog.drawAnimal();

  popMatrix();
  
  analogClock.drawClock();
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
