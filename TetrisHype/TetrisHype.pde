import java.util.*;
Board B;
int C;
int A;
color col;
block[][] blocks;
ArrayList<Square> boardSquares;
void setup(){
  background(0);
  size(400, 400);
  B = new Board();
  C = 0;
  A = 0;
  col = color(255, 255, 255);
  blocks = new block[10][20];
  for (int i = 0; i < 10; i++){
    for(int j = 0; j < 20; j++){
      blocks[i][j] = new block(i*15 + 25,j*15 + 25,color(255),0,15);
    }
  }
  boardSquares = new ArrayList<Square>();
  Square square = new Square(blocks);
  boardSquares.add(square);
  B.DrawBoard();
}

void draw(){
  B.DrawBoard();
  C += 1;
  text("C = " + C, 0, 10);
  if(C%30 == 0 && boardSquares.get(0).moveDown()){
    boardSquares.remove(0);
    Square square = new Square(blocks);
    boardSquares.add(square); 
  }
  if(C%2 == 0 && keyPressed && key == 'a'){
    boardSquares.get(0).moveLeft();
    text("a",300,100);
  }
  if(C%2 == 0 & key == 'd'){
    boardSquares.get(0).moveRight();
    text("d",330,100);
  }
  blocks = boardSquares.get(0).updateArray();
}