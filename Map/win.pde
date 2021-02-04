void win() {
  textFont(EarlyGameBoy);
  textSize(60);
  fill(0);
  text("WINNER WINNER", width/2-300, height/3);
  text("CHICKEN DINNER", width/2-325, height/3+70);
 
  textFont(marioKart);  
  textSize(50);
  fill(0);
  text("your run time", width/2-150, height/4*3-75);
  text("" + startTimer.getTime(), width/2-100, height/4*3);   
  
  text("click to restart", width/10*7-20, height/10*9); 
}

void winClicks() {
  mode = INTRO;
  setup();
}
