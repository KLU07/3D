float rotx, roty;
color sage = #99B898;
color coral = #FF847C;


void setup() {
  size(800, 800, P3D); //turn on 3D rendering engine
  rotx = radians(45);
  roty = radians(45); 
}


void draw() {
  background(255);
  cube(width/2, 600, 0, sage, 150);
  ball(width/2, 200, 0, coral, 150);
}


void ball(float x, float y, float z, color coral, float size) {
  pushMatrix();
  translate(x, y, z);
  
  rotateX(rotx);
  rotateY(roty);
  
  fill(coral);
  stroke(0);
  strokeWeight(1.4);
  sphere(size);
  popMatrix();
}


void cube(float x, float y, float z, color sage, float size) {
  pushMatrix();
  translate(x, y, z); //x, y, z coordinates - increase z = closer to screen, decrease z = further away from screen

  rotateX(rotx);
  rotateY(roty);
  //rotateZ();
  
  fill(sage);
  stroke(0);
  strokeWeight(3);
  box(size); // side length
  popMatrix();
}


void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*-0.01;
}
