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
color col1;
block[][] blocks1;
ArrayList<Square> boardSquares1;
ArrayList<Line> boardLines1;
int rng1;
boolean isLine1;

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
  isLine1 = false;
  col1 = color(255, 255, 255);
  blocks1 = new block[10][20];
  for (int i = 0; i < 10; i++){
    for(int j = 0; j < 20; j++){
      blocks1[i][j] = new block(i*15 + 225,j*15 + 25,color(255),0,15);
    }
  }
  boardLines1 = new ArrayList<Line>();
  boardSquares1 = new ArrayList<Square>();
  rng1 = int(random(2));
  switch(rng1){
    case 0:
      Square square = new Square(blocks1);
      boardSquares1.add(square);
      break;
    case 1:
      Line lines = new Line(blocks1);
      boardLines1.add(lines);
  }
  B.DrawBoard();
}

void draw(){
  B.DrawBoard();
  A += 1;
  C += 1;
  fill(0);
  noStroke();
  rect(0,0,400,20);
  fill(255);
  text("Player 1 = " + C, 0, 10);
  text("Player 2 = " + A, 300,10);
  if(C%10 == 0){
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
  if(C%2 == 0 && keyPressed && key == 'a' || key == 'A'){
    switch(rng){
      case 0:
        boardSquares.get(0).moveLeft();
        break;
      case 1:
        boardLines.get(0).moveLeft();
    } 
  }
  if(C%2 == 0 & key == 'd' || key == 'D'){
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
  //fix\/
  if(C%10 == 0){
    switch(rng1){
      case 0:
        if(boardSquares1.get(0).moveDown()){
           boardSquares1.remove(0);
           rng1 = int(random(2));
           switch(rng1){
             case 0:
               Square square = new Square(blocks1);
               boardSquares1.add(square);
               break;
             case 1:
               Line lines = new Line(blocks1);
               boardLines1.add(lines);
           } 
        }
        break;
      case 1:
        if(boardLines1.get(0).moveDown()){
          boardLines1.remove(0);
          for (int i = 0; i < 20; i++){
            for(int j = 0; j<10; j++){
              if( !blocks1[j][i].checkVisable()){
                isLine1 = true;
              }
            }
          }
          rng1 = int(random(2));
          switch(rng1){
             case 0:
               Square square = new Square(blocks1);
               boardSquares1.add(square);
               break;
             case 1:
               Line lines = new Line(blocks1);
               boardLines1.add(lines);
           } 
        }
    } 
    
    
  }
  if(C%2 == 0 && keyPressed && keyCode == LEFT){
    switch(rng1){
      case 0:
        boardSquares1.get(0).moveLeft();
        break;
      case 1:
        boardLines1.get(0).moveLeft();
    } 
  }
  if(C%2 == 0 && keyPressed && keyCode == RIGHT){
    switch(rng1){
      case 0:
        boardSquares1.get(0).moveRight();
        break;
      case 1:
        boardLines1.get(0).moveRight();
    } 
  }
  switch(rng1){
      case 0:
        blocks1 = boardSquares1.get(0).updateArray();
        break;
      case 1:
        blocks1 = boardLines1.get(0).updateArray();
    } 
}