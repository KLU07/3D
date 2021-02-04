class Rain extends GameObject {
  
  float x, y, z;
  float speed;
  
  Rain() {
    x = random(-2000, 2000);
    y = -500;
    z = random(-2000, 2000);
    speed = random(3, 7);
    lives = 1;
  }
  
  void show() {
    world.pushMatrix();
    world.translate(x, y, z);
    world.strokeWeight(2);
    world.stroke(#E0E0DE);
    world.line(x, y, x, y - 20);
    world.popMatrix();
  }
  
  
  void act() {
    y = y + speed;    
    
    if (y >= height) {
      x = random(-2000, 2000);
      y = -500;
      z = random(-2000, 2000);
      speed = random(3, 7);
      objects.add(new Ripple());

    }
  }
  
}
