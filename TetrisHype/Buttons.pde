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
  
  void draw(){
  }
  
  void p1CyclePress(){
  p1Selected++;
  p1Selected = p1Selected%3;
  }
  
  void p1AcceptPress(){
  switch(p1Selected){
  case 0:
  p1Speed -= 1;
  break;
  
  case 1:
  p2Speed += 1;
  break;
  
  case 2:
  p1Income += 1;
  break;
  }
  }
  
  void income(){
    p1Money += p1Income;
    p2Money += p2Income;
  }
  
  void giveMoney(int x, int m){
  if(x == 1) p1Money += m;
  if(x == 2) p2Money += m;
  }
  
  int getMoney(int x){
  if(x==1) return p1Money;
  if(x==2) return p2Money;
    return -1;
  }
  
  int getSpeed(int x){
  if(x==1) return p1Speed;
  if(x==2) return p2Speed;
  return 0;
  }
}