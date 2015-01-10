Student [] students;
Paper paper;
Teacher teacher;
EyeLaser eyelaser;
int life =3;
final int GAME_START   = 0;
final int GAME_PLAYING = 1;
final int GAME_PAUSE   = 2;
final int GAME_WIN     = 3;
final int GAME_LOSE    = 4;
int status;

void setup() {
   status = GAME_START;
   size(640,480);
   background(0, 0, 0);
   reset();
}

void draw() {
  background(50, 50, 50);
  noStroke();
  rectMode(CENTER);

  switch(status) {

  case GAME_START:
       background(0, 0, 0);
       printText(width/2, 240, 60, 20, 40, "CHEAT GAME", "Press ENTER to Start"); // replace this with printText
       break;
  case GAME_PLAYING:
       background(50, 50, 50);
       teacher.display();
       teacher.move();
       eyelaser.display(); 
       eyelaser.move(teacher);     
       for (int i=0; i<students.length; i++){
          students[i].display();
       } 
       paper.display();  
       drawLife();
       checkWin();
       checkLose();    
       break;

  case GAME_PAUSE:
       printText(width/2, 240, 40, 20, 40, "PAUSE", "Press ENTER to Resume");
       break;

  case GAME_WIN:

    //winAnimate();
    break;

  case GAME_LOSE:
    //loseAnimate();
    printText(width/2, 240, 40, 20, 40, "BOOOM", "You are dead!!");
    break;
  }
}

void keyPressed() {

  if (status == GAME_PLAYING) {
   if (key == CODED ) {
      switch(keyCode){
        case UP:
               if(paper.pY <= height - 120 && paper.pY >= 120) {
                 paper.pY -= 70;
               }      
               break;
        case DOWN:
               if(paper.pY <= height - 120 && paper.pY >= 120) {
                  paper.pY += 70;
               } 
               break;
        case LEFT:
               if(paper.pX <= width - 150 && paper.pX >= 100) {
                  paper.pX -= 70;
               } 
               break;
        case RIGHT:
               if(paper.pX <= width - 150 && paper.pX >= 100) {
                  paper.pX += 70;
               } 
               break;
    }
    
    if(paper.pX >= width - 150){
      paper.pX = width - 150;
    } 
    if(paper.pX < 100){
      paper.pX = 100;
    }
    if(paper.pY >= height - 120){
      paper.pY = height - 120;
    }
    if(paper.pY <= 120){
      paper.pY = 120;
    }
  }
  }
  statusCtrl();
}

void studentMaker(int total, int numInRow) {

  int ox = 150; 
  int oy = 150; 
  int xSpacing = 70; 
  int ySpacing = 70; 

  for (int i=0; i <total; ++i) {

    int x = ox + (xSpacing*(i % numInRow));
    int y = oy + (ySpacing*int(i / numInRow));

    students[i]= new Student(x, y);
  }
}

void checkWin() {
   int i=int(random(20));  
  if(key == ' ' && paper.pX <= students[i].sX && paper.pX >= students[i].sX-80 
  && paper.pY <= students[i].sY+20 && paper.pY >= students[i].sY-20) {
    status = GAME_WIN;
  }
}

void checkLose() {  
    for (int j=0; j<students.length-1; j++) {
  Student student = students[j];
  if( paper.pY > student.sY+20 && paper.pY < student.sY+100 && 
  paper.pX >= eyelaser.eX && paper.pX <= eyelaser.eX+eyelaser.eSize 
  && paper.pY <= eyelaser.eY+2*eyelaser.eSize && paper.pY >= eyelaser.eY) {

    status = GAME_LOSE;
  }
  
}
}

void drawLife() {
  rectMode(CORNER);
  fill(230, 74, 96);
  text("LIFE:", 36, 455);

  int ox = 78; 
  int oy = 459;
  int spacing = 25;
  int diameter = 15;

  for (int i=0; i<life; i++) {
    int x = ox + spacing*i;
    int y = oy;
    ellipse(x, y, diameter, diameter);
  }
}

void printText(int x, int y, int size1, int size2, int distance, String line1, String line2) {
  colorMode(RGB);
  fill(95, 194, 226);
  textSize(size1);
  textAlign(CENTER, CENTER);
  text(line1, x, y);

  fill(95, 194, 226);
  textSize(size2);
  text(line2, x, y+distance);
}

void reset() {
   rectMode(CENTER);
   life=3;
   students = new Student[24];
   studentMaker(24,6);
   teacher = new Teacher(100,70);
   eyelaser = new EyeLaser();
   paper = new Paper(150,150);
}

void statusCtrl() {
  if (key == ENTER) {
    switch(status) {

    case GAME_START:
      status = GAME_PLAYING;
      reset();

      break;

    case GAME_PLAYING:
      status = GAME_PAUSE;

      break;

    case GAME_PAUSE:
      status = GAME_PLAYING;
      break;

    case GAME_WIN:
      status = GAME_PLAYING;
      reset();
      break;

    case GAME_LOSE:
      status = GAME_PLAYING;
      reset();
      break;
    }
  }
}




