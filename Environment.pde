void drawAxis() {
  
}


void drawFloor(int start, int end, int level, int gap) {
  //start = -2000, end = 2000, level = height, gap = 100
  stroke(255);
  strokeWeight(1);
  
  int x = start;
  int z = start;
  while (z < end) {  
    texturedCube(x, level, z, grass, oakPlanks, oakPlanks, gap);
    
    x = x + gap;
    
    if (x >= end) {
      x = start;
      z = z + gap;      
    }

    
  }
  
}


void drawMap() {

  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y); //checks colour of each pixel
      if (c == dullBlue || c == black) { 
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, mossyStone, gridSize);            
      } else if (c == yellow) {
          texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, mysteryblock, gridSize);
      }
    }
  }
}
