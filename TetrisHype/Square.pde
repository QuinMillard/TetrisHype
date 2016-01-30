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
     if(yPosition + 2 == 20 || (square[xPosition][yPosition+2].checkVisable() ||square[xPosition + 1][yPosition+2].checkVisable())){
       return true;
     }
     else{
       square[xPosition][yPosition].invisible();
       square[xPosition+1][yPosition].invisible();
       yPosition++;
       square[xPosition][yPosition+1].display(colour);
       square[xPosition + 1][yPosition + 1].display(colour);
       return false;
     }
   }
   boolean moveRight(){
    if(xPosition + 2 < 10 
    && !(square[xPosition + 2][yPosition].checkVisable() 
   || square[xPosition+2][yPosition+1].checkVisable())){
       
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
    boolean moveLeft(){
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
   block[][] updateArray(){
     return square;
   }
}