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
  
  void p2CyclePress(){
  p2Selected++;
  p2Selected = p2Selected%3;
  }
  
  void p1IncreaseSpeed(){
  p2Money -= 10000;
  p1Speed -= 2;
  }
  void p2IncreaseSpeed(){
  p1Money -= 10000;
  p2Speed -= 2;
  }
  
  void p1DecreaseSpeed(){
  p1Money -= 10000;
  p1Speed += 2;
  }
  void p2DecreaseSpeed(){
  p2Money -=10000;
  p2Speed += 2;
  }

  void p1IncreaseIncome(){
  p1Money -= 10000;
  p1Income += 15;
  }
  void p2IncreaseIncome(){
  p2Money -= 10000;
  p2Income += 5;
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
  
  int getP1Selected(){
    return p1Selected;
  }
  
  int getP2Selected(){
    return p2Selected;
  }
}