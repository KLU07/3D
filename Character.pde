void move() {

  if (akey && canMoveLeft()) {
    eyex = eyex - cos(leftRightAngle + radians(90))*10;
    eyez = eyez - sin(leftRightAngle + radians(90))*10;
  }
  if (dkey && canMoveRight()) {
    eyex = eyex + cos(leftRightAngle + radians(90))*10;
    eyez = eyez + sin(leftRightAngle + radians(90))*10;
  }
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
  
  //camera wrap around code
  if (frameCount < 2) {
    rbt.mouseMove(width/2, height/2);
    mouseX = width/2;
    mouseY = height/2;
   }
   
  if (mouseX < 1) {
    rbt.mouseMove(width-2, mouseY);
  } else if (mouseX > width-2) {
    rbt.mouseMove(1, mouseY);
    }
    
  leftRightAngle += (mouseX - pmouseX)*0.01;
  upDownAngle    += (mouseY - pmouseY)*0.005;

  //prevent teleporting from ceiling to floor  
  if (upDownAngle > PI/2.5) upDownAngle = PI/2.5;
  if (upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;


   
}


boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  int mapx, mapy; //coordinates of map that correspond to 3D position
  float lx, ly, lz;  
  float rx, ry, rz;
  
  fwdx = eyex + cos(leftRightAngle)*100;
  fwdy = eyey; //since no collision with ceiling
  fwdz = eyez + sin(leftRightAngle)*100; 
  //turn mouse coordinate into grid coordinate
  mapx = int (fwdx+2000) / gridSize;
  mapy = int (fwdz+2000) / gridSize;

  lx = eyex + cos(leftRightAngle - radians(20))*100;
  ly = eyey;  
  lz = eyez + sin(leftRightAngle - radians(20))*100; 
  mapx = int (lx+2000) / gridSize;
  mapy = int (lz+2000) / gridSize; 
  
  rx = eyex + cos(leftRightAngle + radians(20))*100;
  ry = eyey;  
  rz = eyez + sin(leftRightAngle + radians(20))*100; 
  mapx = int (rx+2000) / gridSize;
  mapy = int (rz+2000) / gridSize;
  
  if (map.get(mapx, mapy) == white || map.get(mapx, mapy) == red) {   //if empty space
    return true;
  } else { //if coloured block
    return false;
  }
 
}


boolean canMoveLeft() {
  float leftx, lefty, leftz;
  int mapx, mapy;
  float lx, ly, lz;  
  float rx, ry, rz;  

  leftx = eyex + cos(leftRightAngle-radians(90))*100;
  lefty = eyey;
  leftz = eyez + sin(leftRightAngle-radians(90))*100; 
  mapx = int (leftx+2000) / gridSize;
  mapy = int (leftz+2000) / gridSize;
 
  lx = eyex + cos(leftRightAngle - radians(20))*100;
  ly = eyey;  
  lz = eyez + sin(leftRightAngle - radians(20))*100; 
  mapx = int (lx+2000) / gridSize;
  mapy = int (lz+2000) / gridSize; 
  
  rx = eyex + cos(leftRightAngle + radians(20))*100;
  ry = eyey;  
  rz = eyez + sin(leftRightAngle + radians(20))*100; 
  mapx = int (rx+2000) / gridSize;
  mapy = int (rz+2000) / gridSize;
  
  if (map.get(mapx, mapy) == white || map.get(mapx, mapy) == red) {
    return true;
  } else {
    return false;
  } 
}


boolean canMoveRight() {
  float rightx, righty, rightz;
  int mapx, mapy;
  float lx, ly, lz;  
  float rx, ry, rz;  

  rightx = eyex + cos(leftRightAngle+radians(90))*100;
  righty = eyey;
  rightz = eyez + sin(leftRightAngle+radians(90))*100; 
  mapx = int (rightx+2000) / gridSize;
  mapy = int (rightz+2000) / gridSize;
  
  lx = eyex + cos(leftRightAngle - radians(20))*100;
  ly = eyey;  
  lz = eyez + sin(leftRightAngle - radians(20))*100; 
  mapx = int (lx+2000) / gridSize;
  mapy = int (lz+2000) / gridSize; 
  
  rx = eyex + cos(leftRightAngle + radians(20))*100;
  ry = eyey;  
  rz = eyez + sin(leftRightAngle + radians(20))*100; 
  mapx = int (rx+2000) / gridSize;
  mapy = int (rz+2000) / gridSize;  
  
  if (map.get(mapx, mapy) == white || map.get(mapx, mapy) == red) {
    return true;
  } else {
    return false;
  }   
}


boolean canMoveBackward() {
  float backx, backy, backz;
  int mapx, mapy; 
  float lx, ly, lz;  
  float rx, ry, rz;
  
  backx = eyex + cos(leftRightAngle+radians(180))*100;
  backy = eyey;
  backz = eyez + sin(leftRightAngle+radians(180))*100; 
  mapx = int (backx+2000) / gridSize;
  mapy = int (backz+2000) / gridSize;
  
  lx = eyex + cos(leftRightAngle - radians(20))*100;
  ly = eyey;  
  lz = eyez + sin(leftRightAngle - radians(20))*100; 
  mapx = int (lx+2000) / gridSize;
  mapy = int (lz+2000) / gridSize; 
  
  rx = eyex + cos(leftRightAngle + radians(20))*100;
  ry = eyey;  
  rz = eyez + sin(leftRightAngle + radians(20))*100; 
  mapx = int (rx+2000) / gridSize;
  mapy = int (rz+2000) / gridSize;  
  
  if (map.get(mapx, mapy) == white || map.get(mapx, mapy) == red) { 
    return true;
  } else {
    return false;
  }   
}
