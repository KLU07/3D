class GameObject {
  
  PVector loc;
  float size;
  float lives;
  boolean engulfed;
  
  GameObject() {
    loc = new PVector(0, 0, 0);
    size = 10;
    lives = 1;
    engulfed = false;
  }
  
  GameObject(float x, float y, float z, float s) {
    loc = new PVector(x, y, z);
    size = s;
    lives = 1;
  }
  
  void show() {

  }
  
  void act() {

    
  }
    
}
