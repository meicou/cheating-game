class Teacher {
  int speedL = 10;
  int speedR = 10;
  int tSize = 50;
  int tX;
  int tY;
  int state = 0;

  Teacher(int x, int y) {
    this.tX = x;
    this.tY = y;
  } 
  
  void display() {
      fill(230, 74, 96);
      ellipse(tX, tY, tSize, tSize);
  }
  
  
  void move(){
   
   switch(state){
         case 0:
               tX += 1;
               if(tX > 590){
                  tX = 590;
                  state = 1;
               }
               break;
         case 1:
              tY += 1;
              if(tY > 430){
                tY = 430;
                state = 2;
             }
             break;
         case 2:
              tX -= 1;
              if(tX < 50){
                  tX = 50;
                  state = 3;
              }
             break;
   
        case 3:
             tY -= 1;
             if(tY < 50){
                tY = 50;
                state = 0;
             }
             break;
     }   
  }

}
