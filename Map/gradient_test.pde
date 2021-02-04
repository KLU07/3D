//gradient
color skyblue = #E0EFF1;
color sblue = #7DB4B5;

void setup() {
  size(500, 500);  
 
  for (int y = 0; y < height; y++) {
    float n = map(y, 0, height, 0, 1);
    color c = lerpColor(sblue, skyblue, n);
    stroke(c);
    line(0, y, width, y);
    n = n + 1;
  }    
}

void draw() {

}
