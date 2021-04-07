  // pinta un poligono regular debajo del mouse - fnovoas@unal.edu.co

void setup() {
  size(1240, 840);
  background(56);
    
}

void draw() {
  pushMatrix();
  
  
  int fillx;
  int filly;
  int fillz;
  
  if(mousePressed==true);{
    fillx=mouseX-100;
    filly=mouseY-100;
    fillz=frameCount-100;
    
  }if(mousePressed==false);{
        fillx=mouseY-100;
    filly=mouseX-100;
    fillz=((mouseX+mouseY)/2);
    
}
  
  fill(fillx, filly, fillz);
  dibujoPoligonoRegular(mouseX, mouseY, 100, mouseY/20);  // El polígono aumenta sus lados dependiendo de la posición en Y del cursor.
  popMatrix();
  }

void dibujoPoligonoRegular(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void keyPressed(){
  
}
