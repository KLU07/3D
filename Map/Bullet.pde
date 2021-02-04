class Bullet extends GameObject {
  
  PVector dir;
  float speed;
  
  Bullet() {
    super(eyex, eyey, eyez, 10); //tells bullet to go in direction of camera position; 10 = size
    speed = 80;
    float vx = cos(leftRightAngle);
    float vy = tan(upDownAngle);
    float vz = sin(leftRightAngle);
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
  }
  
  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(white);
    world.stroke(white);
    world.box(size);
    world.popMatrix();    
  }
  
  void act() {
    int hitx = int(loc.x + 2000) / gridSize; //projects coordinates of 3D into 2D floorplan
    int hity = int(loc.z + 2000) / gridSize;
    if (map.get(hitx, hity) == white) {
      loc.add(dir);
    } else {
      lives = 0; //remove bullet if hitting something
      for (int i = 0; i < 5; i++) {
        objects.add(new Particle(loc));
      }
    }
    
  }
}
