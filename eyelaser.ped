class EyeLaser {

  int eX;
  int eY;
  int eSpeedX = 0;
  int eSpeedY = 3;
  int eSize = 100;
  float rot;
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
  rot += PI/30;
  }
}
