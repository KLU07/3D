class Snow extends GameObject {
 
  float speed;
  float size;
  float x, y, z;
  int transparency;
  
  Snow() {
    x = random(-2000, 2000);
    y = -500;
    z = random(-2000, 2000);
    speed = random(1, 4);
    size = random(1, 5);
    transparency = 255;
    lives = 1;
  }
  

  void show() {
    world.pushMatrix();
    world.translate(x, y, z);
    world.strokeWeight(2);
    world.stroke(white, transparency);
    world.fill(white, transparency);
    world.box(size);
    //world.ellipse(x, y, size, size); 
    world.popMatrix();
    
    if (y >= height-10) {
    transparency = transparency - 3;       
    }
  }


  void act() {
    if (y < height-10) {
      y = y + speed;    
    }
    
    if (transparency <= 0) {
      x = random(-2000, 2000);
      y = -500;
      z = random(-2000, 2000);
      speed = random(1, 4);
      size = random(1, 5);      
      transparency = 255;
    }
    
  }

}
