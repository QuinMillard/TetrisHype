class Line{
   color colour;
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
   int moveDown(){
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
    boolean moveRight(){
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
    boolean moveLeft(){
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
  void rotate(){
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
  block[][] updateArray(){
     return line;
   }
   
}