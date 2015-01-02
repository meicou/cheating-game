cheating-game
=============
Student [] students;
Paper paper;
Teacher teacher;
EyeLaser eyelaser;

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
 rectMode(CENTER);
 students = new Student[30];
 studentMaker(30,5);
 for (int i=0; i<students.length; i++){
    students[i].display();
  }
  teacher = new Teacher(100,70);
  eyelaser = new EyeLaser();
  paper = new Paper(100,100);
}

void draw() {
  background(50, 50, 50);
  noStroke();

  switch(status) {

  case GAME_START:

    printText(width/2, 240, 60, 20, 40, "CHEAT GAME", "Press ENTER to Start"); // replace this with printText

    break;
  case GAME_PLAYING:
    background(50, 50, 50);

    drawLife();
    teacher.display(); 
    drawStudent();
    drawEyeLaser();
    drawPaper();
 for (int i=0; i<students.length; i++){
    students[i].display();
  }
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
    teacher.keyTyped();
    paper.keyTyped();
  }
  statusCtrl();
}

void studentMaker(int total, int numInRow) {

  int ox = 30; 
  int oy = 30; 
  int xSpacing = 50; 
  int ySpacing = 50; 

  for (int i=0; i <total; ++i) {

    int x = ox + (xSpacing*(i % numInRow));
    int y = oy + (ySpacing*int(i / numInRow));

    students[i]= new Student(x, y);
  }
}

void drawStudent() {
  for (int i=0; i<students.length-1; i++) {
    Student student = students[i];
      //students[i].move();    
     // students[i].display(); 
  }
}


void drawLife() {
  fill(230, 74, 96);
  text("LIFE:", 36, 455);
  /*---------Draw Ship Life---------*/
  int ox = 78; 
  int oy = 459;
  int spacing = 25;
  int diameter = 15;

  for (int i=0; i<3; i++) {
    int x = ox + spacing*i;
    int y = oy;
    ellipse(x, y, diameter, diameter);
  }
}

void drawPaper() {
    if (paper!=null && !paper.gone) { // Check Array isn't empty and bullet still exist
      paper.keyTyped();     //Move Bullet
      paper.display();  //Draw Bullet on the Screen
  }
}

void drawEyeLaser() {

    if (eyelaser!=null && !eyelaser.gone) { // Check Array isn't empty and Laser still exist
      eyelaser.move();      //Move Laser
      eyelaser.display();   //Draw Laser
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
  for (int i=0; i<students.length-1; i++) {
    students[i] = null;
  }


}

void statusCtrl() {
  if (key == ENTER) {
    switch(status) {

    case GAME_START:
      status = GAME_PLAYING;
      reset();

      break;

      /*-----------add things here--------*/

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


