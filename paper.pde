class Paper {

  int pX;
  int pY;
  int SpeedU, SpeedD, SpeedR, SpeedL= 0;
  int pSize = 10;

  Paper(int x, int y) {
    pX = x;
    pY = y;
  }
  void display() {
    fill(251, 255, 0);
    rect(pX, pY, pSize,pSize);
  }
}
