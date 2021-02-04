boolean touchingBlock;
int timer;
int endTimer;

int mapx, mapy;
float fwdx, fwdy, fwdz; 

int playerLives = 3;  
  
void game() {
  touchingBlock = false;
  timer = 30;
  endTimer = 0;
  
  fwdx = eyex + cos(leftRightAngle)*100;
  fwdy = eyey; //since no collision with ceiling
  fwdz = eyez + sin(leftRightAngle)*100;  
  mapx = int (fwdx+2000) / gridSize;
  mapy = int (fwdz+2000) / gridSize;
  
  background(0);

  world.beginDraw();
  world.textureMode(NORMAL); 
  
  world.background(sblue);
  
  //world.spotLight(255, 255, 255, eyex, eyey, eyez, focusx, focusy, focusz, PI/2, 0.5);
  world.pointLight(255, 255, 255, eyex, eyey + 45, eyez); //colour = white, location where light comes from = camera location
  world.ambientLight(102, 102, 102);   //use only ambientLight after sun sets
  
  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);

  drawAxis();
  drawFloor(-2000, 2000, height, gridSize); //draw floor
  //drawFloor(-2000, 2000, -500, 100); //draw ceiling
                      
  world.pushMatrix();
  world.imageMode(CORNER);
  world.translate(-4000, -900, -3400);
  world.rotateX(radians(90));
  world.image(sky2, 0, 0, 10000, 8000);
  world.popMatrix();
  
  drawMap();
  move();
  
  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.show();
    obj.act();  
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
  world.endDraw();
  if (injured == false) {
  image(world, 0, 0); //draw canvas on screen
  } else if (injured == true) {
    image(world, random(-5, 5), random(-5, 5)); //shake when engulfed by slime
  }

  
  HUD.beginDraw();
  if (injured == false) {
    HUD.clear(); //clears background
  } else if (injured == true) {
    HUD.background(red, 127);
  }
  drawCrosshair();
  
  if (timer >= endTimer) {                    //<================== minimap shows up at beginning and throughout entire game??
    drawMinimap();
  }
  
  drawCompass();
  drawInventory();
  HUD.endDraw();
  image(HUD, 0, 0); 
  
  if (keyPressed && spacekey) {
  objects.add(new Bullet());
  }
  
  if (keyPressed && pkey) {
    mode = PAUSE;
  }

  if (keyPressed && mkey) {
    mode = MENU;
  }
  
  if (map.get(mapx, mapy) == green) {
    mode = WIN;
  } 
  if (map.get(mapx, mapy) == orange) {
    begin();
  }
  
}


void gameClicks() {
  
}


void begin() {
  timer--;
}
