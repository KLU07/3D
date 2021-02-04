class Ripple extends GameObject {

  float speed;
  float size;
  float x, y, z;
  int transparency;  
  
  Ripple() {
    x = random(-2000, 2000);
    y = height;
    z = random(-2000, 2000);
    speed = random(1, 2);
    size = random(0, 1);
    transparency = 255; 
  }
  
  void show() {
    world.pushMatrix();
    world.translate(x, y, z);
    world.rotateX(radians(90));
    world.noFill();
    world.strokeWeight(1.5);
    world.stroke(#E0E0DE, transparency);
    world.ellipse(x, z, size, size);
    world.popMatrix();  
    
    if (transparency <= 0) {
      lives = 0;
    }
  }
  
  void act() {
    size = size + speed/2;
    transparency = transparency - 3;  
  }

}
