class block{
  float size;
  float positionX;
  float positionY;
  color colour;
  float speed;
  boolean isVisable;
  
  block(){
  size = 0;
  positionX = 0;
  positionY = 0;
  colour = 0;
  speed = 10;
  }
  block(float xPosistion, float yPosistion, color Color, float fastness, float bigness){
    positionX = xPosistion;
    positionY = yPosistion;
    colour = Color;
    speed = fastness;
    size = bigness;
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