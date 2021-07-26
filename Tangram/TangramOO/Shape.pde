// Implementar:
// 1. El estilo del shape (e.g., stroke, stroke weight).
// 2. El método contains(int x, int y) que diga si un punto de coordenadas
// (x,y) se encuentra o no al interior del shape. Observe que esta
// función puede servir para la selección de la pieza con un puntero.
// 3. El resto de shapes que se requieran para el Tangram, como se
// hace con la clase Rect (ver Rect.pde).

abstract class Shape {
  float _rotation = 0;
  float _scaling;
  PVector _position;
  color _currentPixel;

  boolean _selected = false; //detecta cuál es la ficha seleccionada
  boolean _contains;
  float x; //posición actual de la ficha en x
  float y; //posición actual de la ficha en y
  float[] angle = {0, PI/4, PI/2, 3/4*PI, PI, 5/4*PI, 3/2*PI, 7/4*PI, 2*PI};
  Shape() {
    _position = new PVector(0, 0);
    _rotation = angle[(int) random(angle.length)];
    _currentPixel = get(mouseX,mouseY);
    ;
  }


  Shape(PVector position, float rotation, float scaling) {
    setPosition(position);
    //   setRotation(rotation);
    setScaling(scaling);
  }

  void draw() {
    push();
    translate(position().x, position().y);
    rotate(rotation());
    scale(scaling(), scaling());
 //   contains();
    selected();
    aspect();
    pop();
    keyPressed();
  }

  abstract void aspect(); //mostrar la ficha
  abstract void drag(); //arrastrar la ficha por la pantalla
  // abstract float rotation(); //rotar la ficha


  void contains(color c) {
    if (c == _currentPixel) {
      _selected = !_selected;
    }
  }

  boolean selected() {
    return !_selected;
  }

  void deSelected() {
    _selected = !_selected;
  }

/*****/

/*  boolean contains() {
    return _contains;
  }
  void setContains(boolean contains) {
    _contains = contains;
  } */

  float scaling() {
    return _scaling;
  }

  void setScaling(float scaling) {
    _scaling = scaling;
  }

  float rotation() {
    return _rotation;
  }

  void setRotation(float rotation) {
    _rotation = rotation;
  }

  PVector position() {
    if (_contains==true) {
      _position.x=mouseX;
      _position.y=mouseY;
    }
    return _position;
  }

  void setPosition(PVector position) {
    _position = position;
  }

  color currentPixel() {
    return _currentPixel;
  }

  void setcurrentPixel(color currentPixel) {
    _currentPixel = currentPixel;
  }
}
