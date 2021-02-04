void intro() {
  pushMatrix();
  image(maze, 0, 0, width, height);
  popMatrix();
 
  textFont(EarlyGameBoy);  
  textSize(70);
  fill(white);
  text("MAPCRAFT", width/2-230, height/3-50);

  textFont(marioKart);  
  textSize(50);
  fill(0);
  text("press M to open menu", width/2-200, height/4*3-75);
  text("press ENTER to start", width/2-200, height/4*3);    
  
  if (keyPressed && enter) {
    mode = GAME;
    rbt.mouseMove(width/2, height/2);
    mouseX = width/2;
    mouseY = height/2;
  }

  if (keyPressed && mkey) {
    mode = MENU;
  }
  
}


void introClicks() {
 
}
