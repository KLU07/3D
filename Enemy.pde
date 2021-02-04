class Enemy extends GameObject {

  PVector vel;
  int speed;
  
  Enemy() {
    loc = new PVector(random(-2000, 2000), height-99, random(-2000, 2000));
    size = 100;
    lives = 1;

  }
  
  
  void show() {
    world.pushMatrix();
    world.fill(white);
    slime(loc.x, loc.y, loc.z, slimeback, slime, slimeback, 100);
    world.popMatrix();
  }
  
  
  void act() {
    spawnTimer++;
    
    PVector vel = new PVector(eyex - loc.x, 0, eyez - loc.z);
    vel.setMag(2);
    loc.add(vel);
    
    if (loc.x > eyex - 100 && loc.x < eyex + 100 && loc.z > eyez - 100 && loc.z < eyez + 100) {
      engulfed = true;
    }
    
    if (engulfed == true) {
      engulfed = false;
      injured = true;
    }
    
    if (spawnTimer >= spawnThreshold) {
      objects.add(new Enemy());
      spawnTimer = 0;
    } 

    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= size/2 + obj.size) { 
          obj.lives = 0;
          lives = 0;
          injured = false;
          spawnTimer = 0;

        }
      }
      i = i + 1;
    }
    
  }
  
  
  void slime(float x, float y, float z, PImage top, PImage side, PImage bottom, float size) {
    world.pushMatrix();
    world.translate(x, y, z);
    world.scale(size);
    world.noStroke();
    
    world.beginShape(QUADS); //groups of 4 vertexes
    world.texture(top);
    //top 
    //           x, y, z, texture's x, texture's y
    world.vertex(0, 0, 0, 0, 0);
    world.vertex(1, 0, 0, 1, 0);
    world.vertex(1, 0, 1, 1, 1);
    world.vertex(0, 0, 1, 0, 1);
    
    world.endShape();
    
    
    world.beginShape(QUADS);
    world.texture(bottom);
    
    //bottom
    world.vertex(0, 1, 0, 0, 0);
    world.vertex(1, 1, 0, 1, 0);
    world.vertex(1, 1, 1, 1, 1);
    world.vertex(0, 1, 1, 0, 1); 
    
    world.endShape();
    
    
    world.beginShape(QUADS);
    world.texture(side);
    
    //front
    world.vertex(0, 0, 1, 0, 0);
    world.vertex(1, 0, 1, 1, 0);
    world.vertex(1, 1, 1, 1, 1);
    world.vertex(0, 1, 1, 0, 1);
    
    //back 
    world.vertex(0, 0, 0, 0, 0);
    world.vertex(1, 0, 0, 1, 0);
    world.vertex(1, 1, 0, 1, 1);
    world.vertex(0, 1, 0, 0, 1);  
    
    //left
    world.vertex(0, 0, 1, 0, 0);
    world.vertex(0, 0, 0, 1, 0);
    world.vertex(0, 1, 0, 1, 1);
    world.vertex(0, 1, 1, 0, 1);   
    
    //right 
    world.vertex(1, 0, 1, 0, 0);
    world.vertex(1, 0, 0, 1, 0);
    world.vertex(1, 1, 0, 1, 1);
    world.vertex(1, 1, 1, 0, 1);
    
    world.endShape();
    
    world.popMatrix();  
  }  
}
