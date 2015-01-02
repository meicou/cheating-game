class Paper {

  int pX;
  int pY;
  int SpeedU, SpeedD, SpeedR, SpeedL= 0;
  int pSize = 3;
  boolean gone = false;


  Paper(int x, int y) {
    pX = x;
    pY = y;
  }

  void display() {
    fill(251, 255, 0);
    rect(pX, pY, pSize,pSize);
  }

  void keyTyped() {

    //Limit Paper Position
    if (pX+pSize >= 640) {
      SpeedR = 0;
    } else if (pX-pSize <= 0) {
      SpeedL = 0;
    } else if (pX-pSize > 0 && pX+pSize<640) {
      SpeedU= SpeedD= SpeedR= SpeedL= 10;
    }

    //Ship Ctrl
    if (key == CODED) {
      switch(keyCode) {
      case LEFT:
        this.pX -= SpeedL;
        break;
      case RIGHT:
        this.pX += SpeedR;
        break;
      case UP:
        this.pY -= SpeedU;
        break;
      case DOWN:
        this.pY += SpeedD;
        break;
      }
    }
  }
}
