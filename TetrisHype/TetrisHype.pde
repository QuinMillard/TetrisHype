import java.util.*;
Board B;
int C;
int A;
color col;
block[][] blocks;
ArrayList<Square> boardSquares;
ArrayList<Line> boardLines;
int rng;
boolean isLine;

void setup(){
  background(0);
  size(400, 400);
  B = new Board();
  C = 0;
  A = 0;
  isLine = false;
  col = color(255, 255, 255);
  blocks = new block[10][20];
  for (int i = 0; i < 10; i++){
    for(int j = 0; j < 20; j++){
      blocks[i][j] = new block(i*15 + 25,j*15 + 25,color(255),0,15);
    }
  }
  boardLines = new ArrayList<Line>();
  boardSquares = new ArrayList<Square>();
  rng = int(random(2));
  switch(rng){
    case 0:
      Square square = new Square(blocks);
      boardSquares.add(square);
      break;
    case 1:
      Line lines = new Line(blocks);
      boardLines.add(lines);
  }
  B.DrawBoard();
}

void draw(){
  B.DrawBoard();
  C += 1;
  text("C = " + C, 0, 10);
  if(C%30 == 0){
    switch(rng){
      case 0:
        if(boardSquares.get(0).moveDown()){
           boardSquares.remove(0);
           rng = int(random(2));
           switch(rng){
             case 0:
               Square square = new Square(blocks);
               boardSquares.add(square);
               break;
             case 1:
               Line lines = new Line(blocks);
               boardLines.add(lines);
           } 
        }
        break;
      case 1:
        if(boardLines.get(0).moveDown()){
          boardLines.remove(0);
          for (int i = 0; i < 20; i++){
            for(int j = 0; j<10; j++){
              if( !blocks[j][i].checkVisable()){
                isLine = true;
              }
            }
          }
          rng = int(random(2));
          switch(rng){
             case 0:
               Square square = new Square(blocks);
               boardSquares.add(square);
               break;
             case 1:
               Line lines = new Line(blocks);
               boardLines.add(lines);
           } 
        }
    } 
    
    
  }
  if(C%2 == 0 && keyPressed && key == 'a'){
    switch(rng){
      case 0:
        boardSquares.get(0).moveLeft();
        break;
      case 1:
        boardLines.get(0).moveLeft();
    } 
  }
  if(C%2 == 0 & key == 'd'){
    switch(rng){
      case 0:
        boardSquares.get(0).moveRight();
        break;
      case 1:
        boardLines.get(0).moveRight();
    } 
  }
  switch(rng){
      case 0:
        blocks = boardSquares.get(0).updateArray();
        break;
      case 1:
        blocks = boardLines.get(0).updateArray();
    } 
  
}