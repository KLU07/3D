void menu() {
  image(maze2, 0, 0, width, height);
  
  textFont(EarlyGameBoy);  
  textSize(70);
  fill(white);
  text("MENU", width/2-190, height/3-50); 
 
  textFont(marioKart);  
  textSize(50);
  fill(0);
  text("uh oh, you've been trapped in a maze!", width/2-380, height/4*3-250);
  text("escape as fast as you can", width/2-300, height/4*3-210);
  text("but beware of the slimes...", width/2-300, height/4*3-170);

  text("W, A, S, D to move", width/2-200, height/4*3-75);
  text("SPACE to shoot", width/2-200, height/4*3);   
  text("P to pause", width/2-200, height/4*3+75);  
  
  text("B to go back", width/20, height/10);
  text("ENTER to start", width/10*7, height/10);  
  
  if (keyPressed && bkey) {
    mode = INTRO;
  }
  
  if (keyPressed && enter) {
    mode = GAME;
    rbt.mouseMove(width/2, height/2);
    mouseX = width/2;
    mouseY = height/2;    
  }
  
}

void menuClicks() {

}
