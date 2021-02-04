void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;  
  if (key == ' ') spacekey = true;
  if (key == ENTER) enter = true;
  if (key == 'p' || key == 'P') pkey = true;
  if (key == 'm' || key == 'M') mkey = true;
  if (key == 'b' || key == 'B') bkey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;  
  if (key == ' ') spacekey = false;
  if (key == ENTER) enter = false;
  if (key == 'p' || key == 'P') pkey = false;
  if (key == 'm' || key == 'M') mkey = false;
  if (key == 'b' || key == 'B') bkey = false;
}

void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == WIN) {
    winClicks();
  } else if (mode == MENU) {
    menuClicks();
  } else {
    println("ERROR: Mode =" + mode);
  }  

}
