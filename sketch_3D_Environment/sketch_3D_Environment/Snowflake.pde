class Snowflake {
  //instance variables
  float x, y, z, size, speed;
  
  //constructor
  Snowflake() {
    x = random(0, width);
    y = random(0, height);
    z = random(0, height);

    size = random(2, 10);
    speed = random(1, 5);
  }
  
  //behaviour function
  void act() {
    y = y + speed;
    if (y > height) {
      y = 0;
      x = random(0, width);                        // currently not 3D, only 2D screen
      //z = 0;  
    }
  }
  
  void show() {
    rect(x, y, size, size);                  //adding z variable creates chaos. why???
  }
}
