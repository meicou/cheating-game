class EyeLaser {

  int eX;
  int eY;
  float eSpeed;
  int eSize = 100;
  float rot=0;
  boolean gone = false;


  EyeLaser() {
    eX = teacher.tX;
    eY = teacher.tY;

  }

  void display() {
    fill(28, 213, 128);
    rect(eX, eY, eSize, 2*eSize);
  }

  void move() {

  translate(eX,eY);
  rotate(rot);
  eSpeed = 0.005;
  rot += eSpeed;
    if(rot >=0.009) {
      eSpeed*= -1;
     }
  }
}
