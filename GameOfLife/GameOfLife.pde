//Juego de La Vida de Conway // fnovoas@unal.edu.co

/*CONTROLES
 1 = VELOCIDAD BAJA
 2 = VELOCIDAD NORMAL
 3 = VELOCIDAD RÁPIDA
 + (mantener) = AUMENTAR VELOCIDAD
 - (mantener) = DISMINUIR VELOCIDAD
 
 4 = PRESET1
 5 = PRESET2
 6 = PRESET3
 7 = PRESET4
 8 = PRESET5
 9 = PRESET6
 0 = PRESET7
 
 r = SEMILLA ALEATORIA
 c = LIMPIAR TABLERO
 p o ESPACIO = COMENZAR / PAUSAR / REANUDAR
 q = REINICAR COLOR
 
 CLIC = CAMBIAR ESTADO DE LA CÉLULA MANUALMENTE
 */

int tamano = 8; //no admite eñes
int col = 800/tamano; //columnas
int fil = 800/tamano; //filas
int ciclocolor; //variable que determina el color

int tempo=10; //velocidad de ejecución

boolean limpiar;
boolean pausa;

//declarar arreglo 2d
int [][] tablero = new int[col][fil];
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
  colorMode(HSB, 360, 100, 100);
  size(800, 800);
  frameRate(tempo);
  pausa = true; // el juego empieza pausado
}

//draw() tablero inicial
void draw() {
  background(0, 50, 0);
  ciclocolor = frameCount%360;


  if (!pausa) {
    //computar siguiente tablero (nuevo tablero)
    int [][] ntablero = new int[col][fil];
    //ntablero: nuevo tablero
    for (int y=1; y<fil-1; y++) {
      for (int x=1; x<col-1; x++) {
        int vecinas = contarVecinas(x, y);
        ntablero[x][y] = reglas(tablero[x][y], vecinas);
      }
    }
    tablero = ntablero;
  }
  drawTablero();
}


//cambiar estado de las células con el ratón
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
        fill(color(ciclocolor, 100, 100)); //color vivas
      } else {
        fill(0, 0, 10); //color muertas
      }
      stroke(48); //cuadrícula del fondo
      rect(x*tamano, y*tamano, tamano, tamano);
    }
  }
}


//funcionalidades:

void limpiar() {
  //limpiar el tablero al oprimir 'c'
  for (int y=0; y<fil; y++) { //itera desde 0 para borrar los bordes
    for (int x=0; x<col; x++) {
      tablero[x][y]=0;
    }
  }
}


//cambiar velocidad de ejecución
void keyPressed() {
  if (key=='+') {
    tempo += 5;
  }
  if (key=='-' && tempo > 4) { //para que no llegue a cero
    tempo -= 2;
  }
  if (key=='1') {
    tempo = 1;
  }
  if (key=='2') {
    tempo = 5;
  }
  if (key=='3') {
    tempo = 100;
  }
  if (key=='p' || key==' ') {
    pausa = !pausa;
  }
  if (key=='c') {
    limpiar();
  }

  if (key=='q') { //extra: reiniciar color
    frameCount=1;
    ciclocolor = frameCount%360;
  }
  if (key=='r') { //reiniciar (tablero aleatorio)
    for (int y=0; y<fil; y++) {
      for (int x=0; x<col; x++) {
        tablero[x][y] = int(random(2));
      }
    }
  }

  //Presets:
  if (key=='4') { //pulsar
    limpiar();
    tablero[45][45]=1;
    tablero[46][45]=1;
    tablero[47][45]=1;
    tablero[51][45]=1;
    tablero[52][45]=1;
    tablero[53][45]=1;
    tablero[43][47]=1;
    tablero[48][47]=1;
    tablero[50][47]=1;
    tablero[55][47]=1;
    tablero[43][48]=1;
    tablero[48][48]=1;
    tablero[50][48]=1;
    tablero[55][48]=1;
    tablero[43][49]=1;
    tablero[48][49]=1;
    tablero[50][49]=1;
    tablero[55][49]=1;
    tablero[45][50]=1;
    tablero[46][50]=1;
    tablero[47][50]=1;
    tablero[51][50]=1;
    tablero[52][50]=1;
    tablero[53][50]=1;
    tablero[45][52]=1;
    tablero[46][52]=1;
    tablero[47][52]=1;
    tablero[51][52]=1;
    tablero[52][52]=1;
    tablero[53][52]=1;
    tablero[43][53]=1;
    tablero[48][53]=1;
    tablero[50][53]=1;
    tablero[55][53]=1;
    tablero[43][54]=1;
    tablero[48][54]=1;
    tablero[50][54]=1;
    tablero[55][54]=1;
    tablero[43][55]=1;
    tablero[48][55]=1;
    tablero[50][55]=1;
    tablero[55][55]=1;
    tablero[45][57]=1;
    tablero[46][57]=1;
    tablero[47][57]=1;
    tablero[51][57]=1;
    tablero[52][57]=1;
    tablero[53][57]=1;
  }

  if (key=='5') { //penta-decathlon
    limpiar();
    tablero[45][45]=1;
    tablero[46][45]=1;
    tablero[47][45]=1;
    tablero[45][46]=1;
    tablero[47][46]=1;
    tablero[45][47]=1;
    tablero[46][47]=1;
    tablero[47][47]=1;
    tablero[45][48]=1;
    tablero[46][48]=1;
    tablero[47][48]=1;
    tablero[45][49]=1;
    tablero[46][49]=1;
    tablero[47][49]=1;
    tablero[45][50]=1;
    tablero[46][50]=1;
    tablero[47][50]=1;
    tablero[45][51]=1;
    tablero[47][51]=1;
    tablero[45][52]=1;
    tablero[46][52]=1;
    tablero[47][52]=1;
  }
  if (key=='6') { //Heavy-weight spaceship
    limpiar();
    tablero[47][45]=1;
    tablero[48][45]=1;
    tablero[45][46]=1;
    tablero[50][46]=1;
    tablero[51][47]=1;
    tablero[45][48]=1;
    tablero[51][48]=1;
    tablero[46][49]=1;
    tablero[47][49]=1;
    tablero[48][49]=1;
    tablero[49][49]=1;
    tablero[50][49]=1;
    tablero[51][49]=1;
  }
  if (key=='7') { //gosper glider gun
    limpiar();
    tablero[26][2]=1;
    tablero[24][3]=1;
    tablero[26][3]=1;
    tablero[14][4]=1;
    tablero[15][4]=1;
    tablero[22][4]=1;
    tablero[23][4]=1;
    tablero[36][4]=1;
    tablero[37][4]=1;
    tablero[13][5]=1;
    tablero[17][5]=1;
    tablero[22][5]=1;
    tablero[23][5]=1;
    tablero[36][5]=1;
    tablero[37][5]=1;
    tablero[2][6]=1;
    tablero[3][6]=1;
    tablero[12][6]=1;
    tablero[18][6]=1;
    tablero[22][6]=1;
    tablero[23][6]=1;
    tablero[2][7]=1;
    tablero[3][7]=1;
    tablero[12][7]=1;
    tablero[16][7]=1;
    tablero[18][7]=1;
    tablero[19][7]=1;
    tablero[24][7]=1;
    tablero[26][7]=1;
    tablero[12][8]=1;
    tablero[18][8]=1;
    tablero[26][8]=1;
    tablero[13][9]=1;
    tablero[17][9]=1;
    tablero[14][10]=1;
    tablero[15][10]=1;
  }
  if (key=='8') {//Simkin glider gun
    limpiar();
    tablero[94][86]=1;
    tablero[93][86]=1;
    tablero[94][85]=1;
    tablero[93][85]=1;
    tablero[90][85]=1;
    tablero[89][84]=1;
    tablero[88][83]=1;
    tablero[87][83]=1;
    tablero[85][83]=1;
    tablero[84][83]=1;
    tablero[83][84]=1;
    tablero[83][85]=1;
    tablero[83][86]=1;
    tablero[84][86]=1;
    tablero[85][86]=1;
    tablero[89][86]=1;
    tablero[88][87]=1;
    tablero[83][91]=1;
    tablero[82][91]=1;
    tablero[82][92]=1;
    tablero[83][93]=1;
    tablero[84][93]=1;
    tablero[85][93]=1;
    tablero[85][94]=1;

    tablero[62][74]=1;
    tablero[63][74]=1;
    tablero[62][75]=1;
    tablero[63][75]=1;
    tablero[69][74]=1;
    tablero[70][74]=1;
    tablero[69][75]=1;
    tablero[70][75]=1;
    tablero[66][77]=1;
    tablero[67][77]=1;
    tablero[66][78]=1;
    tablero[67][78]=1;
  }
  if (key=='9') {//infinite1 de Bryan Burgers
    limpiar();
    tablero[73][69]=1;
    tablero[71][70]=1;
    tablero[73][70]=1;
    tablero[74][70]=1;
    tablero[71][71]=1;
    tablero[73][71]=1;
    tablero[71][72]=1;
    tablero[69][73]=1;
    tablero[67][74]=1;
    tablero[69][74]=1;
  }

  if (key=='0') {//infinite2 de Bryan Burgers
    limpiar();
    tablero[60][60]=1;
    tablero[61][60]=1;
    tablero[62][60]=1;
    tablero[64][60]=1;
    tablero[60][61]=1;
    tablero[63][62]=1;
    tablero[64][62]=1;
    tablero[61][63]=1;
    tablero[62][63]=1;
    tablero[64][63]=1;
    tablero[60][64]=1;
    tablero[62][64]=1;
    tablero[64][64]=1;
  }

  println(frameRate);
  frameRate(tempo);
}


/*atribución, crédito para la inspiración de este código:
 Miles Berry en YouTube https://www.youtube.com/channel/UCDVb7qOzTimRNY2YoC81pBA
 código del color cambiante de https://www.reddit.com/r/processing/comments/9gr5pb/question_how_to_create_rainbow_color_cycle_in/
 por el usuario u/million_eyes_monster*/
