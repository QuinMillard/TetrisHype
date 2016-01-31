class Board{
  
Board(){
}
void DrawBoard(int p1){

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
  fill(color(255, 0, 0));
  rect(41, 341, 16, 8);
  fill(color(225, 225, 0));
  rect(91, 341, 16, 8);
  fill(color(0, 255, 0));
  rect(141, 341, 16, 8);
    
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
}
}