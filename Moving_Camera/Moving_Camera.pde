import java.awt.Robot; 

Robot rbt;

//camera variables
float eyex, eyey, eyez; //camera position
float focusx, focusy, focusz; //point at which camera focuses
float upx, upy, upz; //tilt axis

//keyboard variables
boolean wkey, akey, skey, dkey;

//rotation variables
float leftRightAngle, upDownAngle;


void setup() {
  try {
    rbt = new Robot();  //robot MUST be instantiated inside try-catch 
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  
  size(displayWidth, displayHeight, P3D); //display = device's screen width and height
  
  eyex = width/2;
  eyey = height/2;
  eyez = height/2;
  
  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 100;
  
  upx = 0;
  upy = 1;
  upz = 0;
}


void draw() {
  background(0);
  
  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  move();
  
  drawAxis();
  drawFloor(-2000, 2000, height, 100); //draw existing floor
  drawFloor(-2000, 2000, 0, 100); //draw ceiling
}


void move() {
  pushMatrix();
  translate(focusx, focusy, focusz);
  sphere(5);
  popMatrix();
  
  //left right movement
  if (akey) eyex = eyex - 10;
  if (dkey) eyex = eyex + 10;
  //forward back movement
  if (wkey) eyez = eyez - 10;
  if (skey) eyez = eyez + 10;
  
  focusx = eyex + cos(leftRightAngle)*100;
  focusy = eyey + tan(upDownAngle)*100; //unchanged, as it is for looking up and down
  focusz = eyez + sin(leftRightAngle)*100;
  
  leftRightAngle = leftRightAngle + (mouseX - pmouseX)*0.01;
  upDownAngle = upDownAngle + (mouseY - pmouseY)*0.01;
  
  //prevent from teleporting from ceiling to floor
  if (upDownAngle > PI/2.5) upDownAngle = PI/2.5; //PI/2.5 = approx 90 degrees
  if (upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;
    
  //teleport mouse across screen
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
