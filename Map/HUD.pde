void drawCrosshair() {
  HUD.stroke(white);
  HUD.strokeWeight(5);
  HUD.line(width/2-15, height/2, width/2+15, height/2);
  HUD.line(width/2, height/2-15, width/2, height/2+15);  
}


void drawMinimap() {
  HUD.image(map, 50, 50, 120, 120); //size x3
  
  int miniX = int (eyex + 2000) / gridSize;
  int miniY = int (eyez + 2000) / gridSize;  
  
  HUD.textSize(30);
  HUD.fill(black);
  HUD.text("X:" + miniX, 50, 210);
  HUD.text("Y:" + miniY, 50, 245);
  
  HUD.strokeWeight(1.5);
  HUD.stroke(255, 0, 0);
  HUD.fill(255, 0, 0);
  HUD.rect(miniX*3 + 50, miniY*3 + 50, 3, 3); //indicates location on minimap
  
  HUD.fill(black);
  HUD.text(startTimer.getTime(), 50, height/10*9);
}


void drawCompass() {
  HUD.pushMatrix();
  
  HUD.strokeWeight(3);
  HUD.stroke(black);                         
  HUD.translate(90, 345);
  HUD.rotate(radians(80));
  HUD.rotate(-leftRightAngle);
  HUD.beginShape();
  HUD.noFill();
  HUD.vertex(0, 25);
  HUD.vertex(-10, -25);
  HUD.vertex(0, -15);  
  HUD.vertex(10, -25); 
  HUD.vertex(0, 25);
  HUD.endShape();
  
  HUD.textSize(25);
  HUD.fill(black);
  HUD.text("N", -8, 55); 
  
  HUD.rotate(radians(leftRightAngle));
  HUD.popMatrix();
}


void drawInventory() {
  HUD.pushMatrix();
  HUD.noFill();
  HUD.strokeWeight(3);
  HUD.stroke(black);
  HUD.rect(displayWidth/2, displayHeight/6*4.8, 90, 90);
  HUD.rect(displayWidth/2+90, displayHeight/6*4.8, 90, 90);
  HUD.rect(displayWidth/2-180, displayHeight/6*4.8, 90, 90);
  HUD.rect(displayWidth/2-90, displayHeight/6*4.8, 90, 90);
  HUD.popMatrix();
}
