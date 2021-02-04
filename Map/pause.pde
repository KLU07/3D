void pause() {
  textFont(EarlyGameBoy);
  textSize(60);
  fill(0);
  text("PAUSED", width/2-180, height/3);
  
  textFont(marioKart);
  textSize(50);
  fill(0);
  text("click to resume", width/2-200, height/4*3);
  
}


void pauseClicks() {
  mode = GAME;
}
