class Teacher {
  int speedL = 10;
  int speedR = 10;
  int tSize = 50;
  int tX;
  int tY;
  boolean upGrade = false;

  Teacher(int x, int y) {
    this.tX = x;
    this.tY = y;
  } 

  void display() {

      fill(230, 74, 96);
      ellipse(tX, tY, tSize, tSize);
    
  }


  void keyTyped() {

    //Limit Ship Position
    if (tX+tSize >= 640) {
      speedR = 0;
    } else if (tX-tSize <= 0) {
      speedL = 0;
    } else if (tX-tSize > 0 && tX+tSize<640) {
      speedL = 10;
      speedR = 10;
    }

    //Ship Ctrl
    if (key == CODED) {
      switch(keyCode) {
      case LEFT:
        this.tX -= speedL;
        break;
      case RIGHT:
        this.tX += speedR;
        break;
      }
    }
  }
}
