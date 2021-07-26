// Implementar:
// 1. La creación de las siete distintas piezas (por ahora son todas Rect)
// 2. La interacción: selección y manipulación de las piezas (ratón, teclas, touch...)
// 3. La evaluación de la solución
// 4. El modo de creación de nuevos problemas
/* PImage lvl1;
 PImage lvl2;
 PImage lvl3;
 PImage lvl4;
 PImage lvl5; */
// float scale = 1;
color currentPixel;
// ArrayList<PVector> listMousePositions = new ArrayList<PVector>();

Rect rect;

Shape[] shapes;
PImage[] lvl;
boolean drawGrid = true;
boolean selected = false;
float rotation = 0;


void setup() {
  size(1080, 720);
  shapes = new Shape[8];
//  lvl = new PImage[5];
//  shapes[0] = new Rect();
  spawn();
  for (int i = 0; i<shapes.length; i++) {
    shapes[i] = i < 4 ? new  Triang() : new Rect();
  }

}


void drawGrid(float scale) {
  push();
  strokeWeight(1);
  int i;
  for (i=0; i<=width/scale; i++) {
    stroke(0, 0, 0, 20);
    line(i*scale, 0, i*scale, height);
  }
  for (i=0; i<=height/scale; i++) {
    stroke(0, 0, 0, 20);
    line(0, i*scale, width, i*scale);
  }
  pop();
}

void draw() {
  currentPixel = get(mouseX, mouseY);
  background(252, 252, 252);
  if (drawGrid) {
    drawGrid(10);
  }

/*  for (Shape shape : shapes) {
    shape.draw(); } */
 drawShapes();

  //loadPixels();
}

void spawn() {
  shapes[0] = new Triang();
  shapes[1] = new Triang();
  shapes[2] = new Triang();
  shapes[3] = new Triang();
  shapes[4] = new Triang();
  shapes[5] = new Rect();
  //  shapes[6] = new Paral();
}


void drawShapes() {
  for (Shape shapes : shapes) {
    shapes.draw();
  }
}

void mouseDragged() {
  for (Shape shape : shapes) {
    shape.drag();
  }
  // listMousePositions.add(new PVector(mouseX,mouseY));
}




void keyPressed() {
  if (key == 'g' || key == 'G') {
    drawGrid = !drawGrid;
  }
  {
    if (key == 'q' || key == 'Q') {  //rotar a la izquierda
      for (Shape shape : shapes) {
        if (shape.selected()) {
          rotation = shape.rotation()+PI/32;
          shape.setRotation(rotation);
        }
      }
    }
    if (key == 'e' || key == 'E') { //rotar a la derecha
      for (Shape shape : shapes) {
        if (shape.selected()) {
          rotation = shape.rotation()-PI/32;
          shape.setRotation(rotation);
        }
      }
    }
  }
}

void mousePressed() {
}
