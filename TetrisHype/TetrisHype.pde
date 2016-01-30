class block{
  float size;
  float positionX;
  float positionY;
  color colour;
  float speed;
  boolean isVisable;
  
  void block(){
  size = 0;
  positionX = 0;
  positionY = 0;
  colour = 0;
  speed = 10;
  }
  block(float xPosistion, float yPosistion, color Color, float fastness){
    positionX = xPosistion;
    positionY = yPosistion;
    colour = Color;
    speed = fastness;
  }
  void display(color light){
    colour = light;
    fill(colour);
    noStroke();
    rect(positionX, positionY, size, size);
    isVisable = true;
  }
  boolean checkVisable(){
    return isVisable;
  }
  void invisible(){
    fill(0);
    rect(positionX, positionY, size, size);
    isVisable = false;
  }
  void incrementSpeed(){
    speed++;
  }
  void setPosistion(float Xposition, float Yposition){
  positionX = Xposition;
  positionY = Yposition;
  }
}
class Square{
   color colour;
   int xPosition;
   int yPosition;
   block[][] square = new block[10][20];
   
   Square(block[][] board){
     xPosition = 4;
     yPosition = 0;
     colour = color(20,200,20);
     square = board;
     square[xPosition][yPosition].display(colour);
     square[xPosition][yPosition+1].display(colour);
     square[xPosition + 1][yPosition].display(colour);
     square[xPosition + 1][yPosition + 1].display(colour);
   }
   boolean moveDown(){
     if(square[xPosition][yPosition+2].checkVisable() ||square[xPosition][yPosition+2].checkVisable()){
       return true;
     }
     else{
       square[xPosition][yPosition].invisible();
       square[xPosition][yPosition].invisible();
       yPosition++;
       square[xPosition][yPosition].display(colour);
       square[xPosition][yPosition+1].display(colour);
       square[xPosition + 1][yPosition].display(colour);
       square[xPosition + 1][yPosition + 1].display(colour);
       return false;
     }
   }
   boolean moveRight(){
    
}