class Torch extends GameObject {
  
  float x, y, z;
  
  Torch() {
    //loc = new PVector(random(-2000, 2000), height-10, random(-2000, 2000));
    x = random(-2000, 2000);
    y = height;
    z = random(-2000, 2000);
    loc = new PVector(x, y, z);
    size = 10;
    lives = 1;
  }
  
  
  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.image(torch, size, size);
    world.popMatrix();
  }
  
  
  void act() {
    
  }
    
}
