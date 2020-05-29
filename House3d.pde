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

float ANIMAL_SPEED = 0.05;

int TREE_COUNT = 10;

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

ArrayList<Tree> trees;

ColliderManager colliderMng;

int scaleFactor;

void setup() {
  size(1200, 1000, P3D);
  scaleFactor = 100;

  cam = new Camera(new PVector(0, -300, 800)); // start position

  wall = new Wall();
  door = new Door();
  roof = new Roof();
  window = new Window();
  painting = new Painting();
  fireplace = new Fireplace();
  garden = new Garden();
  unicorn = new Animal("unicorn.png", 1.5, 3);
  dog = new Animal("lab.png", 1.5, 2);
  
  trees = new ArrayList();
  for(int i = 0; i < TREE_COUNT; i++) {
    float rX = garden.getRandomCoordInGarden();
    float rZ = garden.getRandomCoordInGarden();
    
    trees.add(new Tree(rX, rZ));
  }
  
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
 
  for(int i = 0; i < TREE_COUNT; i++)
    trees.get(i).drawTree();
  
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
