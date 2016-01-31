import java.util.*;
Board B;
button Button;
int timer;
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
  Button = new button();
  background(0);
  size(400, 400);
  B = new Board();
  C = 0;
  A = 0;
  timer = 0;
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
  B.DrawBoard(0, 0);
  noLoop();
  fill(255);
  text("Press a key to start", 50, 300);
  text("Press a key to start", 250, 300);
}

void draw(){
  
  
  timer++;
  B.DrawBoard(Button.getP1Selected(), Button.getP2Selected());
  Button.income();
  fill(0);
  noStroke();
  rect(0,0,400,20);
  fill(255);
  text("Player 1 = " + Button.getMoney(1), 0, 10);
  text("Player 2 = " + Button.getMoney(2), 300,10);
  if(timer%Button.getSpeed(1) == 0){
    switch(rng){
      case 0:
        boolean x;
        int temp1;
        int linesBroken1;
        temp1 = boardSquares.get(0).moveDown();
        linesBroken1 = temp1/2;
        Button.giveMoney(1, linesBroken1*10000);
        if(temp1 % 2 == 0){x = false;}else{x = true;}
        if(x){
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
        boolean x1;
        int temp;
        int linesBroken;
        temp = boardLines.get(0).moveDown();
        linesBroken = temp/2;
        Button.giveMoney(1, linesBroken*10000);
        if(temp % 2 == 0){x1 = false;}else{x1 = true;}
        if(x1){
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
  if(timer%2 == 0 && keyPressed && key == 'e' || key == 'E'){
  switch(Button.getP1Selected()){
    
  case 0:
  if(Button.getMoney(1) > 10000){
  Button.p1DecreaseSpeed();
  }
  break;
  
  case 1:
  if(Button.getMoney(1) > 10000){
  Button.p1IncreaseIncome();
  }
  break;
  
  case 2:
  if(Button.getMoney(1) > 10000 && Button.getSpeed(2) > 2){
  Button.p2IncreaseSpeed();
  }
  break;
  }
  }
  
  if(timer%2 == 0 && keyPressed && key == 'q' || key == 'Q'){
  Button.p1CyclePress();
  }
  
  if(timer%2 == 0 && keyPressed && key == 'a' || key == 'A'){
    switch(rng){
      case 0:
        boardSquares.get(0).moveLeft();
        break;
      case 1:
        boardLines.get(0).moveLeft();
    } 
  }
  
   
  if(timer%2 == 0 && keyPressed && key == 'd' || key == 'D'){
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
  if(timer%Button.getSpeed(2) == 0){
    switch(rng1){
      case 0: boolean x;
        int temp;
        int linesBroken;
        temp = boardSquares1.get(0).moveDown();
        linesBroken = temp/2;
        Button.giveMoney(2, linesBroken*10000);
        if(temp % 2 == 0){x = false;}else{x = true;}
        if(x){
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
        boolean x1;
        int temp1;
        int linesBroken1;
        temp1 = boardLines1.get(0).moveDown();
        linesBroken1 = temp1/2;
        Button.giveMoney(2, linesBroken1*10000);
        if(temp1 % 2 == 0){x1 = false;}else{x1 = true;}
        if(x1){
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
  if(timer%2 == 0 && keyPressed && keyCode == LEFT){
    switch(rng1){
      case 0:
        boardSquares1.get(0).moveLeft();
        break;
      case 1:
        boardLines1.get(0).moveLeft();
    } 
  }
  if(timer%2 == 0 && keyPressed && keyCode == RIGHT){
    switch(rng1){
      case 0:
        boardSquares1.get(0).moveRight();
        break;
      case 1:
        boardLines1.get(0).moveRight();
    } 
  }

  if(timer%2 == 0 && keyPressed && key == 'i' || key == 'I'){
  Button.p2CyclePress();
  }
  
  if(timer%2 == 0 && keyPressed && key == 'o' || key == 'O'){
  switch(Button.getP2Selected()){
    
  case 0:
  if(Button.getMoney(2) > 10000){
  Button.p2DecreaseSpeed();
  }
  break;
  
  case 1:
  if(Button.getMoney(2) > 10000){
  Button.p2IncreaseIncome();
  }
  break;
  
  case 2:
  if(Button.getMoney(2) > 10000 && Button.getSpeed(1) > 2){
  Button.p1IncreaseSpeed();
  }
  break;
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
void keyPressed(){
  loop();
  
}

void keyReleased(){
  if(boardLines.size() > 0 && (key == 'w' || key == 'W')){

    boardLines.get(0).rotate();
    
  } else if(boardLines1.size() > 0 && (keyCode == UP)){
    boardLines1.get(0).rotate();
  }
}