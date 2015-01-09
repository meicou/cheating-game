class Paper {

  int pX;
  int pY;
  int SpeedU, SpeedD, SpeedR, SpeedL= 0;
  int pSize = 10;
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

       if (key == CODED ) {
      switch(keyCode){
        case UP:
          pY -= 80;
          break;
        case DOWN:
          pY += 80;
          break;
        case LEFT:
          pX -= 100;
          break;
        case RIGHT:
          pX += 100;
          break;
    }
     if(pX >= width - 150){
      pX = width - 150;
    }else if(pX < 100){
      pX = 100;
    }else if(pY >= height - 120){
      pY = height - 120;
    }else if(pY <= 120){
      pY = 120;
    }
  }
}
}
