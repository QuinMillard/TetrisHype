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
     if(xPosition + 2 < 20 && (square[xPosition][yPosition+2].checkVisable() ||square[xPosition][yPosition+2].checkVisable())){
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