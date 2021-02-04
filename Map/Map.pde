import java.awt.Robot; 

Robot rbt;

//timer
Timer startTimer;

//colours
color black = #000000; //oak plank
color white = #FFFFFF; //empty space
color dullBlue = #7092BE; //mossy bricks
color skyblue = #E0EFF1;
color sblue = #7DB4B5;
color waterblue = #99D9EA;
color red = #ED1C24; //spawn point colour
color green = #B5E61D; //end point colour
color yellow = #FFF200; //mystery block
color orange = #FFC90E; //area around mystery block

//map variables
int gridSize;
PImage map;

//textures 
PImage mossyStone;
PImage oakPlanks;
PImage snow;
PImage water;
PImage grass;
PImage mysteryblock;

//camera variables
float eyex, eyey, eyez; //camera position
float focusx, focusy, focusz; //point at which camera focuses
float upx, upy, upz; //tilt axis

//keyboard variables
boolean wkey, akey, skey, dkey, spacekey, enter, pkey, mkey, bkey;

//rotation variables
float leftRightAngle, upDownAngle;

//GameObjects
ArrayList<GameObject> objects;

//gif
ArrayList<PImage> gif;
int n = 0;

//canvases / layers
PGraphics world;
PGraphics HUD;

//items 
PImage torch;
PImage coin;

//font
PFont marioKart;
PFont EarlyGameBoy;

//images
PImage maze;
PImage maze2;
PImage sky3;
PImage sky2;
PImage sky;
PImage clouds;
PImage rainysky;

//slime
PImage slime;
PImage slimeback;
boolean injured;
int spawnTimer;
int spawnThreshold;

//game screens
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int WIN = 3;
final int MENU = 4;
int mode = INTRO;


void setup() {
  rectMode(CENTER);
  
  //canvases
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
  
  //create Game Object list
  objects = new ArrayList <GameObject>();
  
  //timer
  startTimer = new Timer(0);
  //startTimer.start();            <=========== create start() function
  
  //textures
  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");
  snow = loadImage("snow.jpg");
  water = loadImage("water.png");
  grass = loadImage("grass.jpg");
  mysteryblock = loadImage("mysteryblock.jpg");
  
  //items 
  torch = loadImage("torch.png");
  coin = loadImage("mysterycoin.png");
  
  //font
  marioKart = createFont("Mario-Kart-DS.ttf", 32);
  EarlyGameBoy = createFont("Early GameBoy.ttf", 32);

  //images
  maze = loadImage("maze.jpg");
  maze2 = loadImage("maze2.png");
  sky3 = loadImage("sky3.png");
  sky2 = loadImage("sky2.png");
  sky = loadImage("sky.jpg");
  clouds = loadImage("frame_0_delay-0.22s.gif");
  rainysky = loadImage("rainysky.jpg");
  
  //slime
  slime = loadImage("slime1.png");
  slimeback = loadImage("slimeback.png");
      
  spawnTimer = 0;
  spawnThreshold = 200;
  
  gif = new ArrayList<PImage>();
  int n = 0;
  while (n < 7) {
    gif.add(loadImage("frame_" + n + "_delay-0.2s.gif"));
    n++;
  }
  frameRate(35);
  
  try {
    rbt = new Robot();  //robot MUST be instantiated inside try-catch 
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  
  size(displayWidth, displayHeight, P2D); //display = device's screen width and height
  
  //initialize map
  map = loadImage("map.png");
  gridSize = 100;
  
  //spawn at red point on map
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == red) { 
        eyex = x*gridSize-2000;
        eyey = 9*height/10;
        eyez = y*gridSize-2000;
      }
    }
  }
  
  //eyex = width/2;
  //eyey = 9*height/10;
  //eyez = height/2;
  
  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 100;
  
  upx = 0;
  upy = 1;
  upz = 0;
  
  //add snow
  int i = 0;
  while(i < 200) {
    objects.add(new Snow());
    objects.add(new Rain());
    i++;
  } 
  
  //objects.add(new Torch());

  //objects.add(new MysteryBlock());
  
  objects.add(new Enemy());
}


void draw() {
  PImage frame = gif.get(n);
  world.imageMode(CORNER);
  world.translate(-2000, -700, -2000);  
  world.image(frame, 0, 0, 8000, 6000);
  n++;
  if (n > 6) n = 0;
  
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
    startTimer.countUp();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == WIN) {
    win();
  } else if (mode == MENU) {
    menu();
  } else {
    println("ERROR: Mode =" + mode);
  }
  
}
