import java.awt.Robot; 

Robot rbt;

//colours
color black = #000000; //oak plank
color white = #FFFFFF; //empty space
color dullBlue = #7092BE; //mossy bricks

//map variables
int gridSize;
PImage map;

//textures 
PImage mossyStone;
PImage oakPlanks;

//camera variables
float eyex, eyey, eyez; //camera position
float focusx, focusy, focusz; //point at which camera focuses
float upx, upy, upz; //tilt axis

//keyboard variables
boolean wkey, akey, skey, dkey;

//rotation variables
float leftRightAngle, upDownAngle;


void setup() {
  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");
  textureMode(NORMAL); 
  
  try {
    rbt = new Robot();  //robot MUST be instantiated inside try-catch 
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  
  size(displayWidth, displayHeight, P3D); //display = device's screen width and height
  
  eyex = width/2;
  eyey = 9*height/10;
  eyez = height/2;
  
  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 100;
  
  upx = 0;
  upy = 1;
  upz = 0;
  
  //initialize map
  map = loadImage("map.png");
  gridSize = 100;
  
}


void draw() {
  background(0);
  
  //soptLight(255, 255, 255, eyex, eyey, eyez, focusx, focusy, focusz, PI/2, 0.5);
  pointLight(255, 255, 255, eyex, eyey, eyez); //colour = white, location where light comes from = camera location
  
  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  move();
  
  drawAxis();
  drawFloor(-2000, 2000, height, gridSize); //draw floor
  drawFloor(-2000, 2000, height-gridSize*4, 100); //draw ceiling
  drawMap();
}


void move() {
  pushMatrix();
  translate(focusx, focusy, focusz);
  sphere(2);
  popMatrix();
  
  //left right movement
  if (akey && canMoveLeft()) {
    eyex = eyex - cos(leftRightAngle + radians(90))*10;
    eyez = eyez - sin(leftRightAngle + radians(90))*10;
  }
  if (dkey && canMoveRight()) {
    eyex = eyex + cos(leftRightAngle + radians(90))*10;
    eyez = eyez + sin(leftRightAngle + radians(90))*10;
  }
  //forward back movement
  if (wkey && canMoveForward()) {
    eyex = eyex + cos(leftRightAngle)*10;
    eyez = eyez + sin(leftRightAngle)*10;
    //can also be written as eyez += sin(leftRightAngle)*10;    
  }
  if (skey && canMoveBackward()) {
    eyex = eyex - cos(leftRightAngle)*10;
    eyez = eyez - sin(leftRightAngle)*10;
  }
  
  focusx = eyex + cos(leftRightAngle)*200;
  focusy = eyey + tan(upDownAngle)*200;
  focusz = eyez + sin(leftRightAngle)*200;
  
  leftRightAngle = leftRightAngle + (mouseX - pmouseX)*0.01;
  upDownAngle = upDownAngle + (mouseY - pmouseY)*0.01;
  
  //prevent teleporting from ceiling to floor
  if (upDownAngle > PI/2.5) upDownAngle = PI/2.5; //PI/2.5 = approx 90 degrees
  if (upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;
    
  //make mouse wrap-around screen
  if (mouseX > width-2) rbt.mouseMove(3, mouseY);
  if (mouseX < 2) rbt.mouseMove(width-3, mouseY);
}


boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  int mapx, mapy; //coordinates of map that correspond to 3D position
  float lx, ly, lz;  
  float rx, ry, rz;
  
  fwdx = eyex + cos(leftRightAngle)*100;
  fwdy = eyey; //since you will not collide with ceiling
  fwdz = eyez + sin(leftRightAngle)*100; 
  //turn mouse coordinate into grid coordinate
  mapx = int (fwdx+2000) / gridSize;
  mapy = int (fwdz+2000) / gridSize;

  lx = eyex + cos(leftRightAngle - radians(20))*100;
  ly = eyey;  
  lz = eyez + sin(leftRightAngle - radians(20))*100; 
  //turn mouse coordinate into grid coordinate
  mapx = int (lx+2000) / gridSize;
  mapy = int (lz+2000) / gridSize; 
  
  rx = eyex + cos(leftRightAngle + radians(20))*100;
  ry = eyey;  
  rz = eyez + sin(leftRightAngle + radians(20))*100; 
  //turn mouse coordinate into grid coordinate
  mapx = int (rx+2000) / gridSize;
  mapy = int (rz+2000) / gridSize;
  
  if (map.get(mapx, mapy) == white) {   //if empty space
    return true;
  } else { //if coloured block
    return false;
  }
 
}


boolean canMoveLeft() {
  float leftx, lefty, leftz;
  int mapx, mapy; //coordinates of map that correspond to 3D position
  float lx, ly, lz;  
  float rx, ry, rz;  

  leftx = eyex + cos(leftRightAngle-radians(90))*100;
  lefty = eyey; //since you will not collide with ceiling
  leftz = eyez + sin(leftRightAngle-radians(90))*100; 
  //turn mouse coordinate into grid coordinate
  mapx = int (leftx+2000) / gridSize;
  mapy = int (leftz+2000) / gridSize;
 
  lx = eyex + cos(leftRightAngle - radians(20))*100;
  ly = eyey;  
  lz = eyez + sin(leftRightAngle - radians(20))*100; 
  //turn mouse coordinate into grid coordinate
  mapx = int (lx+2000) / gridSize;
  mapy = int (lz+2000) / gridSize; 
  
  rx = eyex + cos(leftRightAngle + radians(20))*100;
  ry = eyey;  
  rz = eyez + sin(leftRightAngle + radians(20))*100; 
  //turn mouse coordinate into grid coordinate
  mapx = int (rx+2000) / gridSize;
  mapy = int (rz+2000) / gridSize;
  
  if (map.get(mapx, mapy) == white) {   //if empty space
    return true;
  } else { //if coloured block
    return false;
  } 
}


boolean canMoveRight() {
  float rightx, righty, rightz;
  int mapx, mapy; //coordinates of map that correspond to 3D position
  float lx, ly, lz;  
  float rx, ry, rz;  

  rightx = eyex + cos(leftRightAngle+radians(90))*100;
  righty = eyey; //since you will not collide with ceiling
  rightz = eyez + sin(leftRightAngle+radians(90))*100; 
  //turn mouse coordinate into grid coordinate
  mapx = int (rightx+2000) / gridSize;
  mapy = int (rightz+2000) / gridSize;
  
  lx = eyex + cos(leftRightAngle - radians(20))*100;
  ly = eyey;  
  lz = eyez + sin(leftRightAngle - radians(20))*100; 
  //turn mouse coordinate into grid coordinate
  mapx = int (lx+2000) / gridSize;
  mapy = int (lz+2000) / gridSize; 
  
  rx = eyex + cos(leftRightAngle + radians(20))*100;
  ry = eyey;  
  rz = eyez + sin(leftRightAngle + radians(20))*100; 
  //turn mouse coordinate into grid coordinate
  mapx = int (rx+2000) / gridSize;
  mapy = int (rz+2000) / gridSize;  
  
  if (map.get(mapx, mapy) == white) {   //if empty space
    return true;
  } else { //if coloured block
    return false;
  }   
}


boolean canMoveBackward() {
  float backx, backy, backz;
  int mapx, mapy; //coordinates of map that correspond to 3D position
  float lx, ly, lz;  
  float rx, ry, rz;
  
  backx = eyex + cos(leftRightAngle+radians(180))*100;
  backy = eyey; //since you will not collide with ceiling
  backz = eyez + sin(leftRightAngle+radians(180))*100; 
  //turn mouse coordinate into grid coordinate
  mapx = int (backx+2000) / gridSize;
  mapy = int (backz+2000) / gridSize;
  
  lx = eyex + cos(leftRightAngle - radians(20))*100;
  ly = eyey;  
  lz = eyez + sin(leftRightAngle - radians(20))*100; 
  //turn mouse coordinate into grid coordinate
  mapx = int (lx+2000) / gridSize;
  mapy = int (lz+2000) / gridSize; 
  
  rx = eyex + cos(leftRightAngle + radians(20))*100;
  ry = eyey;  
  rz = eyez + sin(leftRightAngle + radians(20))*100; 
  //turn mouse coordinate into grid coordinate
  mapx = int (rx+2000) / gridSize;
  mapy = int (rz+2000) / gridSize;  
  
  if (map.get(mapx, mapy) == white) {   //if empty space
    return true;
  } else { //if coloured block
    return false;
  }   
}


void drawAxis() {
  
}


void drawFloor(int start, int end, int level, int gap) {
  //start = -2000, end = 2000, level = height, gap = 100
  stroke(255);
  strokeWeight(1);
  
  int x = start;
  int z = start;
  while (z < end) {
    texturedCube(x, level, z, oakPlanks, gap);
    //line(x1, y1, z1, x2, y2, z2);
    //line(x, level, start, x, level, end);
    //line(start, level, z, end, level, z);
    x = x + gap;
    if (x >= end) {
      x = start;
      z = z + gap;      
    }
  }
}


void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y); //checks colour of each pixel
      if (c == dullBlue || c == black) { 
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, mossyStone, gridSize);            
      }
    }
  }
}


void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;  
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;  
}
