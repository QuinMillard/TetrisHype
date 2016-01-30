class Board{
  
Board(){
}
void DrawBoard(){

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
}
}