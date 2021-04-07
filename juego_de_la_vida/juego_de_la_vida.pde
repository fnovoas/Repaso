//Juego de La Vida de Conway // fnovoas@unal.edu.co
int tamano = 5; //no admite eñes
int col = 800/tamano; //columnas
int fil = 800/tamano; //filas

int [][] tablero = new int[col][fil]; //declarar arreglo 2d
{ 
  for (int y=0; y<fil; y++) { //y itera en filas
    for (int x=0; x<col; x++) { //x itera en columnas
      tablero[x][y] = int(random(2)); //para cada una de las locaciones de memoria
      //en el tablero, se iniciarán como enteros <2 (0, 1)
    }
  }
}

//tablero inicial
void setup() {
  size(800, 800);
  frameRate(10);
}

//draw() tablero inicial
void draw() {
  background(0, 50, 0);


//computar siguiente tablero (nuevo tablero)
int [][] ntablero = new int[col][fil]; 
{ //ntablero: nuevo tablero
  for (int y=1; y<fil-1; y++) { 
    for (int x=1; x<col-1; x++) {
      int vecinas = contarVecinas(x, y);
      ntablero[x][y] = reglas(tablero[x][y], vecinas);
    }
  }
  tablero = ntablero;
  drawTablero();
}}

//evento de interacción adicional
void mousePressed() {
  int celulaX = mouseX / tamano;
  int celulaY = mouseY / tamano;
  tablero[celulaX][celulaY] = 1-tablero[celulaX][celulaY];
}


//contar número de vecinos de cada célula
int contarVecinas(int x, int y) {
  int vecinas = 0;
  for (int i=-1; i<=1; i++) { //i para las filas, j para las columnas
    for (int j=-1; j<=1; j++) {
      vecinas += tablero[x+j][y+i];
    }
  }
  //restar estado de la célula en el medio
  vecinas -= tablero[x][y];
  return(vecinas);
}

//reglas
int reglas(int estado, int vecinas) { //estado: 1 o 0, viva o muerta
  if (estado==1 && vecinas > 3) return(0); //muerte por sobrepoblación
  else if (estado == 1 && vecinas < 2) return(0); //muerte por subpoblación
  else if (estado == 0 && vecinas == 3) return(1); //reproducción
  else return(estado); //devolver estado actual
}

//draw() tablero en pantalla
void drawTablero() {
  for (int y=0; y<fil; y++) {
    for (int x=0; x<col; x++) {
      if (tablero[x][y]==1) {
        fill(0, 0, 192); //color vivas
      } else {
        fill(0, 0, 10); //color mueras
      }
      rect(x*tamano, y*tamano, tamano, tamano);
    }
  }
}
