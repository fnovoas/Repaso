class Triang extends Shape {
  float _edge;
  PImage triang;
  color _currentPixel = get(mouseX, mouseY);
  Triang() {
    this(100);
  }

  Triang(float edge) {
    triang = loadImage("largetriang1.png");
    setEdge(edge);
  }

  @Override
    void draw() {
    push();
    translate(position().x, position().y);
    //    rotate(rotation());
    //scale(scaling(), scaling());
    rotate(rotation);
    aspect();
    contains(int(get(mouseX,mouseY))); //color de la ficha
    pop();
    mouseReleased();
  }

  @Override
    void aspect() {
   triang.resize(300, 300);
    imageMode(CENTER);
    image(triang, x, y);
  }

  void drag() {
    //check if the user's clicking the image (check if mouseX, mouseY are inside the image's limits
    if (triang.width + position().x >= mouseX && position().x < mouseX) {
      if (triang.height + position().y >= mouseY && position().y < mouseY) {
        position().x = mouseX-75;
        position().y = mouseY-75;
      }
    }
  }


  /*  float rotation(float beta)
   {
   translate(mouseX, mouseY);
   rotate(beta);
   translate(-mouseX, -mouseY);
   
   return _rotation;
   } */


  //segundo prototipo para rotar:
  /*  float rotation()
   {
   if (square.width + position().x >= mouseX && position().x < mouseX) {
   if (square.height + position().y >= mouseY && position().y < mouseY) {
   
   if (keyPressed && keyCode=='q') {
   _rotation+= PI/50;
   }
   if (keyPressed && keyCode=='e') {
   _rotation-= PI/50;
   }
   }
   }
   return _rotation;
   } */

  public float edge() {
    return _edge;
  }

  public void setEdge(float edge) {
    _edge = edge;
  }
}

//niveles: anotar dónde deben ir x, y con rango de tolerancia
//
