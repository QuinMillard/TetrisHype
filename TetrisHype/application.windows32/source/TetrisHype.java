import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class TetrisHype extends PApplet {


Board B;
button Button;
int timer;
int C;
int A;
int col;
block[][] blocks;
ArrayList<Square> boardSquares;
ArrayList<Line> boardLines;
int rng;
boolean isLine;
int col1;
block[][] blocks1;
ArrayList<Square> boardSquares1;
ArrayList<Line> boardLines1;
int rng1;
boolean isLine1;

public void setup(){
  Button = new button();
  background(0);
  
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
  rng = PApplet.parseInt(random(2));
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
  rng1 = PApplet.parseInt(random(2));
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

public void draw(){
  
  
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
           rng = PApplet.parseInt(random(2));
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
          rng = PApplet.parseInt(random(2));
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
           rng1 = PApplet.parseInt(random(2));
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
          rng1 = PApplet.parseInt(random(2));
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
public void keyPressed(){
  loop();
  
}

public void keyReleased(){
  if(boardLines.size() > 0 && (key == 'w' || key == 'W')){

    boardLines.get(0).rotate();
    
  } else if(boardLines1.size() > 0 && (keyCode == UP)){
    boardLines1.get(0).rotate();
  }
}
class block{
  float size;
  float positionX;
  float positionY;
  int colour;
  float speed;
  boolean isVisable;
  
  block(){
  size = 0;
  positionX = 0;
  positionY = 0;
  colour = 0;
  speed = 10;
  }
  block(float xPosistion, float yPosistion, int Color, float fastness, float bigness){
    positionX = xPosistion;
    positionY = yPosistion;
    colour = Color;
    speed = fastness;
    size = bigness;
  }
  public void display(int light){
    colour = light;
    fill(colour);
    noStroke();
    rect(positionX, positionY, size, size);
    isVisable = true;
  }
  public boolean checkVisable(){
    return isVisable;
  }
  public void invisible(){
    fill(0);
    rect(positionX, positionY, size, size);
    isVisable = false;
  }
  public void incrementSpeed(){
    speed++;
  }
  public void setPosistion(float Xposition, float Yposition){
  positionX = Xposition;
  positionY = Yposition;
  }
}
class Board{
  
Board(){
}
public void DrawBoard(int p1, int p2){

  stroke(50);
  //Left
  for(int index = 25; index <= 175 ; index+=15){
  line(index, 25, index, 325);
  }
  for(int index = 25; index <= 325; index+= 15){
  line(25, index, 175, index);
  } 
  
  //Right
  for(int index = 225; index <= 375 ; index+=15){
  line(index, 25, index, 325);
  }
  for(int index = 25; index <= 325; index+= 15){
  line(225, index, 375, index);
  }
  fill(color(0,0,255));
  rect(29, 330, 40, 30);
  rect(79, 330, 40, 30);
  rect(129, 330, 40, 30);
  rect(31, 332, 36, 26);
  rect(81, 332, 36, 26);
  rect(131, 332, 36, 26);
  
  rect(229, 330, 40, 30);
  rect(279, 330, 40, 30);
  rect(329, 330, 40, 30);
  rect(231, 332, 36, 26);
  rect(281, 332, 36, 26);
  rect(331, 332, 36, 26);
  
  
  fill(color(255, 0, 0));
  rect(41, 341, 16, 8);
  fill(color(225, 225, 0));
  rect(91, 341, 16, 8);
  fill(color(0, 255, 0));
  rect(141, 341, 16, 8);
    
  fill(color(255, 0, 0));
  rect(241, 341, 16, 8);
  fill(color(225, 225, 0));
  rect(291, 341, 16, 8);
  fill(color(0, 255, 0));
  rect(341, 341, 16, 8); 
    
  fill(color(150, 150, 255));
  switch(p1){
  case 0: rect(31, 365, 36, 5); 
  fill(0);
  rect(131, 365, 36, 5); 
  rect(81, 365, 36, 5); 
  break;
  case 1: rect(81, 365, 36, 5); 
  fill(0);
  rect(131, 365, 36, 5);
  rect(31, 365, 36, 5);
  break; 
  case 2: rect(131, 365, 36, 5); 
  fill(0);
  rect(81, 365, 36, 5);
  rect(31, 365, 36, 5);
  break;
  }
  
  fill(color(150, 150, 255));
  switch(p2){
  case 0: rect(231, 365, 36, 5); 
  fill(0);
  rect(331, 365, 36, 5); 
  rect(281, 365, 36, 5); 
  break;
  case 1: rect(281, 365, 36, 5); 
  fill(0);
  rect(331, 365, 36, 5);
  rect(231, 365, 36, 5);
  break; 
  case 2: rect(331, 365, 36, 5); 
  fill(0);
  rect(281, 365, 36, 5);
  rect(231, 365, 36, 5);
  break;
  }
  
}
}
class button{
  
  int p1Selected;
  int p1Speed;
  int p1Income;
  int p2Selected;
  int p2Speed;
  int p2Income;
  int p1Money;
  int p2Money;
  
  button() {
    p1Selected = 0;
    p2Selected = 0;
    p1Speed = 10;
    p2Speed = 10;
    p1Income = 10;
    p2Income = 10;
    p1Money = 0;
    p2Money = 0;
  }
  
  public void draw(){
  }
  
  public void p1CyclePress(){
  p1Selected++;
  p1Selected = p1Selected%3;
  }
  
  public void p2CyclePress(){
  p2Selected++;
  p2Selected = p2Selected%3;
  }
  
  public void p1IncreaseSpeed(){
  p2Money -= 10000;
  p1Speed -= 1;
  }
  public void p2IncreaseSpeed(){
  p1Money -= 10000;
  p2Speed -= 1;
  }
  
  public void p1DecreaseSpeed(){
  p1Money -= 10000;
  p1Speed += 2;
  }
  public void p2DecreaseSpeed(){
  p2Money -=10000;
  p2Speed += 2;
  }

  public void p1IncreaseIncome(){
  p1Money -= 10000;
  p1Income += 15;
  }
  public void p2IncreaseIncome(){
  p2Money -= 10000;
  p2Income += 5;
  }
  
  public void income(){
    p1Money += p1Income;
    p2Money += p2Income;
  }
  
  public void giveMoney(int x, int m){
  if(x == 1) p1Money += m;
  if(x == 2) p2Money += m;
  }
  
  public int getMoney(int x){
  if(x==1) return p1Money;
  if(x==2) return p2Money;
    return -1;
  }
  
  public int getSpeed(int x){
  if(x==1) return p1Speed;
  if(x==2) return p2Speed;
  return 0;
  }
  
  public int getP1Selected(){
    return p1Selected;
  }
  
  public int getP2Selected(){
    return p2Selected;
  }
}
class Line{
   int colour;
   int xPosition;
   int yPosition;
   boolean isRotated;
   block[][] line = new block[10][20];
   
   Line(block[][] board){
     xPosition = 3;
     yPosition = 0;
     isRotated = false;
     colour = color(200,200,20);
     line = board;
     if(!line[xPosition][yPosition].checkVisable() &&
       !line[xPosition + 1][yPosition].checkVisable() &&
       !line[xPosition + 2][yPosition].checkVisable() &&
       !line[xPosition + 3][yPosition].checkVisable()){
       
         line[xPosition][yPosition].display(colour);
         line[xPosition + 1][yPosition].display(colour);
         line[xPosition + 2][yPosition].display(colour);
         line[xPosition + 3][yPosition].display(colour);
     } else{
       text("You Lose (you are trash get good m80)",100,20);
       noLoop();
     }
   }
   public int moveDown(){
     int temp = 0;
     if(!isRotated){
       if(yPosition + 1 == 20 || (line[xPosition][yPosition+1].checkVisable() ||line[xPosition+1][yPosition+1].checkVisable() ||line[xPosition + 2][yPosition+1].checkVisable() ||line[xPosition +3][yPosition+1].checkVisable())){
         for(int j = 0; j < 20; j++){
           for(int i = 0; i < 10; i++){
             if(!line[i][j].isVisable){
               break;
             }
             if(i == 9){
               temp++;
               for(int index = 0; index < 10; index++){
                 line[index][j].invisible();
                 for( int k = j - 1; k >= 0; k--){
                   if(line[index][k].checkVisable()){
                     line[index][k+1].display(255);
                     line[index][k].invisible();
                   }
                 }
               }
             }
           }
         }
         return 2*temp + 1;
       }
       else{
         line[xPosition][yPosition].invisible();
         line[xPosition+1][yPosition].invisible();
         line[xPosition+2][yPosition].invisible();
         line[xPosition+3][yPosition].invisible();
         yPosition++;
         line[xPosition][yPosition].display(colour);
         line[xPosition + 1][yPosition].display(colour);
         line[xPosition + 2][yPosition].display(colour);
         line[xPosition + 3][yPosition].display(colour);
         return 0;
       }
     } 
     else {
       if(yPosition + 4 == 20 || (line[xPosition][yPosition+4].checkVisable())){
           for(int j = 0; j < 20; j++){
             for(int i = 0; i < 10; i++){
               if(!line[i][j].isVisable){
                 break;
               }
               if(i == 9){
                 for(int index = 0; index < 10; index++){
                   line[index][j].invisible();
                   for( int k = j - 1; k >= 0; k--){
                     if(line[index][k].checkVisable()){
                       line[index][k+1].display(255);
                       line[index][k].invisible();
                     }
                   }
                 }
               }
             }
           }
           return 2*temp+1;
         }
         else{
           line[xPosition][yPosition].invisible();
           yPosition++;
           line[xPosition][yPosition + 3].display(colour);
           return 0;
         }
       }
    }
    public boolean moveRight(){
    if(!isRotated){
        if(xPosition + 4 < 10 && !(line[xPosition + 4][yPosition].checkVisable())){
          line[xPosition][yPosition].invisible();
          xPosition++;
          line[xPosition + 3][yPosition].display(colour); 
          return true;
        }
        else {
          return false;
        }
      } 
      else {
        if(xPosition + 1 < 10 && !(line[xPosition + 1][yPosition].checkVisable() || line[xPosition + 1][yPosition + 1].checkVisable() || line[xPosition + 1][yPosition + 2].checkVisable() || line[xPosition + 1][yPosition + 3].checkVisable())){
          line[xPosition][yPosition].invisible();
          line[xPosition][yPosition + 1].invisible();
          line[xPosition][yPosition + 2].invisible();
          line[xPosition][yPosition + 3].invisible();
          xPosition++;
          line[xPosition][yPosition].display(colour); 
          line[xPosition][yPosition + 1].display(colour);  
          line[xPosition][yPosition + 2].display(colour); 
          line[xPosition][yPosition + 3].display(colour);
          return true;
        }
        else {
          return false;
        }
      }
    }
    public boolean moveLeft(){
    if(!isRotated){
      if(xPosition -1 >=0 && (!line[xPosition - 1][yPosition].checkVisable())){
        line[xPosition+3][yPosition].invisible();
        xPosition--;
        line[xPosition][yPosition].display(colour);
        return true;
      }
      else{
         return false;
      }
    } 
    else{
      if(xPosition - 1 >=0 && !(line[xPosition - 1][yPosition].checkVisable() || line[xPosition - 1][yPosition + 1].checkVisable() || line[xPosition - 1][yPosition + 2].checkVisable() || line[xPosition - 1][yPosition + 3].checkVisable())){
        line[xPosition][yPosition].invisible();
        line[xPosition][yPosition + 1].invisible();
        line[xPosition][yPosition + 2].invisible();
        line[xPosition][yPosition + 3].invisible();
        xPosition--;
        line[xPosition][yPosition].display(colour); 
        line[xPosition][yPosition + 1].display(colour);  
        line[xPosition][yPosition + 2].display(colour); 
        line[xPosition][yPosition + 3].display(colour);
        return true;
      }
      else {
        return false;
      }
    } 
  }
  public void rotate(){
    if(isRotated){
      isRotated = false;
      if(xPosition + 3 < 10 && !(line[xPosition + 1][yPosition].checkVisable() || line[xPosition + 2][yPosition].checkVisable() || line[xPosition + 3][yPosition].checkVisable())){ 
        line[xPosition][yPosition + 1].invisible();  
        line[xPosition][yPosition + 2].invisible(); 
        line[xPosition][yPosition + 3].invisible();
        line[xPosition + 1][yPosition].display(colour);  
        line[xPosition + 2][yPosition].display(colour); 
        line[xPosition + 3][yPosition].display(colour);
      }
    } else {
      if(yPosition + 3 < 20 && !(line[xPosition][yPosition + 1].checkVisable() || line[xPosition][yPosition + 2].checkVisable() || line[xPosition][yPosition + 3].checkVisable())){
        isRotated = true;
        line[xPosition + 1][yPosition].invisible(); 
        line[xPosition + 2][yPosition].invisible();   
        line[xPosition + 3][yPosition].invisible(); 
        line[xPosition][yPosition + 1].display(colour);  
        line[xPosition][yPosition + 2].display(colour); 
        line[xPosition][yPosition + 3].display(colour);
      }
    }
  }
  public block[][] updateArray(){
     return line;
   }
   
}
class Square{
   int colour;
   int xPosition;
   int yPosition;
   block[][] square = new block[10][20];
   
   Square(block[][] board){
     xPosition = 4;
     yPosition = 0;
     colour = color(20,200,20);
     square = board;
     if(!square[xPosition][yPosition].checkVisable() &&
     !square[xPosition][yPosition+1].checkVisable() &&
     !square[xPosition + 1][yPosition].checkVisable() &&
     !square[xPosition + 1][yPosition + 1].checkVisable()){
       
     square[xPosition][yPosition].display(colour);
     square[xPosition][yPosition+1].display(colour);
     square[xPosition + 1][yPosition].display(colour);
     square[xPosition + 1][yPosition + 1].display(colour);
     } else{
     text("YOU LOSE", 200,30);
     noLoop();
     }
   }
   public int moveDown(){
     int temp = 0;
     if(yPosition + 2 == 20 || (square[xPosition][yPosition+2].checkVisable() ||square[xPosition + 1][yPosition+2].checkVisable())){
       for(int j = 0; j < 20; j++){
         for(int i = 0; i < 10; i++){
           if(!square[i][j].isVisable){
             break;
           }
           if(i == 9){
             temp++;
             for(int index = 0; index < 10; index++){
               square[index][j].invisible();
               for( int k = j - 1; k >= 0; k--){
                 if(square[index][k].checkVisable()){
                   square[index][k+1].display(color(255, 0, 0));
                   square[index][k].invisible();
                 }
               }
                      //Drop everything above this line.
             }
           }
         }
       }

       return 2*temp + 1;
     }
     else{
       square[xPosition][yPosition].invisible();
       square[xPosition+1][yPosition].invisible();
       yPosition++;
       square[xPosition][yPosition+1].display(colour);
       square[xPosition + 1][yPosition + 1].display(colour);
       return 0;
     }
   }
   public boolean moveRight(){
    if(xPosition + 2 < 10 && !(square[xPosition + 2][yPosition].checkVisable() || square[xPosition+2][yPosition+1].checkVisable())){
       
       square[xPosition][yPosition].invisible();
       square[xPosition][yPosition+1].invisible();
       xPosition++;
       square[xPosition + 1][yPosition].display(colour);
       square[xPosition + 1][yPosition + 1].display(colour); 
      return true;
     }
     else{
       
       return false;
     }
   }
    public boolean moveLeft(){
    if(xPosition - 1 >=0 && !(square[xPosition - 1][yPosition].checkVisable() || square[xPosition - 1][yPosition+1].checkVisable())){
       square[xPosition+1][yPosition].invisible();
       square[xPosition+1][yPosition+1].invisible();
       xPosition--;
       square[xPosition][yPosition].display(colour);
       square[xPosition][yPosition + 1].display(colour); 
      return true;
     }else{
       
     return false;
     }
   }
   public block[][] updateArray(){
     return square;
   }
   
   
}
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "TetrisHype" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
