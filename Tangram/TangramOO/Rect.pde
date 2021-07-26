class Rect extends Shape {
  float _edge;
  PImage square;
  color _currentPixel = get(mouseX, mouseY);
  Rect() {
    this(100);
  }

  Rect(float edge) {
    square = loadImage("square.png");
    setEdge(edge);
  }

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

    void aspect() {
    square.resize(150, 150);
    imageMode(CENTER);
    image(square, x, y);
  }

  void drag() {
    //verificar si el usuario está cliqueando la imagen
    //verificar que mouseX, mouseY estén dentro de los límites de la imagen
    if (square.width + position().x >= mouseX && position().x < mouseX) {
      if (square.height + position().y >= mouseY && position().y < mouseY) {
        position().x = mouseX-20;
        position().y = mouseY-20;
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
