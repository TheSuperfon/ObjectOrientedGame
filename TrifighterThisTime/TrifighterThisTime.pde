//Trifighter hopefully this time

//menu variables
boolean GameStart;
int timerFrames;
int PlayerTimer;
boolean ButtonHighlighted; //button color when mouse not over and when mouse is over
boolean printTitleOnce; //makes sure title is printed once or else it looks odd

void setup() {
  size(800, 800);
  background(0);
  //strokeWeight(4); //default outline thickness
  stars();
  printTitleOnce = true;
}




void draw() {
  Title();
  //MenuButton();
}



void Title() {
  while (printTitleOnce == true) {
    //print("Test");
    fill(255, 255, 240);
    textSize(100);
    //strokeWeight(10); // thicker outline
    //stroke(255,252,155);
    text(("TriFighter"), 190, 190); //Title text with the name of the game
    textSize(20);
    text(("Left = up and Right = down on menu"), 250, 230); //Menu Instructions
    printTitleOnce = false;
    
  }
}


void MenuButton() {
  fill(255, 0, 0);
}

void stars() {
  // the randomness of x,y,size and number of stars makes them look a bit more natural and not like a forced pattern
  for (float i = random(20, 40); i < random(750, 800); i = i+ random(80, 100)) {
    for (float j = random(20, 40); j < random(800, 900); j = j+random(80, 100)) {
      noStroke();
      fill(255, 252, 155); // star (debatable) color
      circle(i, j, random(2, 5));
    }
  }
}
