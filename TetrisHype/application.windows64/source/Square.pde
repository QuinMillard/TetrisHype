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
   int moveDown(){
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
   boolean moveRight(){
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