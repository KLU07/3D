class Particle extends GameObject {
  
  PVector velocity;
  int transparency;
  float speed;
  PVector gravity;
  
  Particle(PVector locB) {
    super();
    loc = locB.copy();
    size = 5;    
    speed = 5;
    velocity = new PVector (random(-3, 3), random(-3, 0), random(-3, 3));
    velocity.setMag(speed);
    gravity = new PVector(0, 2, 0);
    transparency = 255;
  }
  
  
  void show() {
    transparency = transparency - 2;
    
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.strokeWeight(2);
    world.stroke(white, transparency);
    world.fill(white, transparency);
    world.box(size);
    world.popMatrix();
  }
  
  void act() {
    if (transparency <= 0) {
      lives = 0;
    }
    
    if (loc.y >= height-5) {
      loc.y = height-5;
    } else if (loc.y <= height - gridSize*3) {
      loc.y = height - gridSize*3;
    } else {
      velocity.add(gravity);
      loc.add(velocity);
    }
  }
   
}
