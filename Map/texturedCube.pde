void texturedCube(float x, float y, float z, PImage texture, float size) {
  world.pushMatrix();
  world.translate(x, y, z);
  world.scale(size);
  world.noStroke();
  
  world.beginShape(QUADS); //groups of 4 vertexes
  world.texture(texture);
  //top 
  //     x, y, z, texture's x, texture's y
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 0, 1, 1, 1);
  world.vertex(0, 0, 1, 0, 1);
  
  //bottom
  world.vertex(0, 1, 0, 0, 0);
  world.vertex(1, 1, 0, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1); 
  
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


void texturedCube(float x, float y, float z, PImage top, PImage side, PImage bottom, float size) {
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
