import java.awt.Robot; 

Robot rbt;

ArrayList<Snowflake> mySnowflake;

//camera variables
float eyex, eyey, eyez; //camera position
float focusx, focusy, focusz; //point at which camera focuses
float upx, upy, upz; //tilt axis

//keyboard variables
boolean wkey, akey, skey, dkey;

//rotation variables
float leftRightAngle, upDownAngle;

//grass block 
float rotx, roty;
PImage dirt;
PImage grass_top;
PImage grass_side;


void setup() {
  try {
    rbt = new Robot();  //robot MUST be instantiated inside try-catch 
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  
  size(displayWidth, displayHeight, P3D); //display = device's screen width and height
  
  mySnowflake = new ArrayList<Snowflake>();
  int i = 0;
  while (i < 1000) {
    mySnowflake.add(new Snowflake());
    i = i + 1;
  }
  
  eyex = width/2;
  eyey = height/2;
  eyez = height/2;
  
  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 100;
  
  upx = 0;
  upy = 1;
  upz = 0;
  
  dirt = loadImage("dirt.png");
  grass_top = loadImage("grass_top.png");
  grass_side = loadImage("grass_side.png");
  textureMode(NORMAL);
}


void draw() {
  background(0);
  
  int i = 0;
  while (i < 1000) {
    Snowflake s = mySnowflake.get(i);
    s.act();
    s.show();
    i = i + 1;
  }
  
  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  move();
  
  drawAxis();
  drawFloor(-2000, 2000, height, 100); //draw floor
  drawFloor(-2000, 2000, 0, 100); //draw ceiling
  
  texturedCube(width/2, 100, 0, grass_top, grass_side, dirt, 100);
}


void move() {
  pushMatrix();
  translate(focusx, focusy, focusz);
  //sphere(5);
  popMatrix();
  
  //left right movement
  if (akey) {
    eyex = eyex - cos(leftRightAngle + radians(90))*10;
    eyez = eyez - sin(leftRightAngle + radians(90))*10;
  }
  if (dkey) {
    eyex = eyex + cos(leftRightAngle + radians(90))*10;
    eyez = eyez + sin(leftRightAngle + radians(90))*10;
  }
  //forward back movement
  if (wkey) {
    eyex = eyex + cos(leftRightAngle)*10;
    eyez = eyez + sin(leftRightAngle)*10;
    //can also be written as eyez += sin(leftRightAngle)*10;    
  }
  if (skey) {
    eyex = eyex - cos(leftRightAngle)*10;
    eyez = eyez - sin(leftRightAngle)*10;
  }
  
  focusx = eyex + cos(leftRightAngle)*100;
  focusy = eyey + tan(upDownAngle)*100;
  focusz = eyez + sin(leftRightAngle)*100;
  
  leftRightAngle = leftRightAngle + (mouseX - pmouseX)*0.01;
  upDownAngle = upDownAngle + (mouseY - pmouseY)*0.01;
  
  //prevent teleporting from ceiling to floor
  if (upDownAngle > PI/2.5) upDownAngle = PI/2.5; //PI/2.5 = approx 90 degrees
  if (upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;
    
  //make mouse wrap-around screen
  if (mouseX > width-2) rbt.mouseMove(3, mouseY);
  if (mouseX < 2) rbt.mouseMove(width-3, mouseY);
}


void drawAxis() {
  
}


void drawFloor(int start, int end, int level, int gap) {
  //start = -2000, end = 2000, level = height, gap = 100
  stroke(255);
  strokeWeight(1);
  
  int x = start;
  int z = start;
  while (x < end) {
    //line(x1, y1, z1, x2, y2, z2);
    line(x, level, start, x, level, end);
    line(start, level, z, end, level, z);
    x = x + gap;
    z = z + gap;
  }
}


void texturedCube(float x, float y, float z, PImage top, PImage side, PImage bottom, float size) {
  pushMatrix();
  translate(x, 750, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);
  
  noStroke();
  
  beginShape(QUADS); //groups of 4 vertexes
  texture(top);
  //top 
  //     x, y, z, texture's x, texture's y
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  
  endShape();
  
  
  beginShape(QUADS);
  texture(bottom);
  
  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1); 
  
  endShape();
  
  
  beginShape(QUADS);
  texture(side);
  
  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  //back 
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);  
  
  //left
  vertex(0, 0, 1, 0, 0);
  vertex(0, 0, 0, 1, 0);
  vertex(0, 1, 0, 1, 1);
  vertex(0, 1, 1, 0, 1);   
  
  //right 
  vertex(1, 0, 1, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(1, 1, 1, 0, 1);
  
  endShape();
  
  popMatrix();  
}


void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*-0.01;
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
