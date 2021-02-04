class MysteryBlock extends GameObject {

  float x, y, z;
  
  MysteryBlock() {
    //x = random(-2000, 2000);
    //y = height - 100;
    //z = random(-2000, 2000);
    x = eyex;
    y = height - 100;
    z = eyez;
    size = 100;
  }
  
  void show() {
    world.pushMatrix();
    world.translate(x, y, z);
    world.image(coin, size, size);
    world.popMatrix();
  }
  
  void act() {
    
  }
}
