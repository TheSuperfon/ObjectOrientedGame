//Trifighter hopefully this time

//menu variables
boolean GameStart;
int timerFrames;
int PlayerTimer;
boolean ButtonHighlighted; //button color when mouse not over and when mouse is over
boolean printTitleOnce; //makes sure title is printed once or else it looks odd
boolean createStarsOnce;
boolean startbuttonpress;
boolean CreditsActive;

PImage ShipSprite;

Ship ship;

//star variables



//do cases for credits and add timer



void setup() {
  size(800, 800);
  background(0);
  ShipSprite = loadImage("ShipSprite.png");
  //strokeWeight(4); //default outline thickness
  //stars();
  printTitleOnce = true;
  createStarsOnce = true;
  startbuttonpress = true;
  CreditsActive = false;
  GameStart = false;
  rectMode(CENTER);
  fill(0); // black sky filling
  rect(width/2, height/2, width, height); // actual black sky rectangle
  ship = new Ship();
}




void draw() {
  fill(0); // black sky filling
  rect(width/2, height/2, width, height); // actual black sky rectangle
  stars();
  if ((GameStart == false) && (CreditsActive == false)) {
    Title();
    StartButton();
    CreditButton();
    Cursor();
  } else if (GameStart == true) {

    ship.MakeShip();
    ship.StayOnMap();
  } else if ((GameStart == false) && (CreditsActive == true)) {
  }


  
}



void Title() {
  //  while (printTitleOnce == true) {
  //    //print("Test");
  //    fill(255, 255, 240);
  //    textSize(100);
  //    //strokeWeight(10); // thicker outline
  //    //stroke(255,252,155);
  //    text(("TriFighter"), 190, 190); //Title text with the name of the game
  //    textSize(20);
  //    text(("Left = up and Right = down on menu"), 250, 230); //Menu Instructions
  //    printTitleOnce = false;
  //  }
  //print("Test");
  fill(255, 255, 240);
  textSize(100);
  //strokeWeight(10); // thicker outline
  //stroke(255,252,155);
  text(("TriFighter"), 190, 190); //Title text with the name of the game
  //textSize(20);
  //text(("Left = up and Right = down on menu"), 250, 230); //Menu Instructions
  printTitleOnce = false;
}


void StartButton() {
  if (startbuttonpress == true) {
    fill(80, 100, 255);
  }
  if (startbuttonpress == false) {
    fill(80, 0, 255);
  }
  rect(400, 375, 200, 50); //
  textSize(30);
  fill(255, 255, 240);
  text(("Start Game"), 330, 385); //instructs on how to start the game
}



void CreditButton() {
  if (startbuttonpress == true) {
    fill(80, 0, 255);
  }
  if (startbuttonpress == false) {
    fill(80, 100, 255);
  }
  rect(400, 475, 200, 50); //
  textSize(30);
  fill(255, 255, 240);
  text(("Credits"), 355, 485); //credits because i wanted an excuse for another button
}
void ActualCredits() {
  rect(400, 475, 200, 50); //
  textSize(30);
  fill(255, 255, 240);
  text(("Credits"), 355, 485); //credits because i wanted an excuse for another button
}




void Cursor() {
  if (startbuttonpress == true) {
    fill(255, 155, 0);
    circle(255, 375, 15);
  } else if (startbuttonpress == false) {
    fill(255, 155, 0);
    circle(255, 475, 15); //cursor that is near credits
  }
}

void stars() {
  //  while (createStarsOnce == true) {
  //    // the randomness of x,y,size and number of stars makes them look a bit more natural and not like a forced pattern
  //    for (float i = random(20, 40); i < random(750, 800); i = i+ random(80, 100)) {
  //      for (float j = random(20, 40); j < random(800, 900); j = j+random(80, 100)) {
  //        noStroke();
  //        fill(255, 252, 155); // star (debatable) color
  //        circle(i, j, random(2, 5));
  //      }
  //    }
  //    createStarsOnce = false;
  //  }

  // the randomness of x,y,size was done because i thought it was neat
  for (float i = random(40, 41); i < random(799, 800); i = i+ random(99, 100)) {
    for (float j = random(40, 41); j < random(799, 800); j = j+random(99, 100)) {
      noStroke();
      fill(255, 252, 155); // star (debatable) color
      circle(i, j, random(4, 5));
    }
  }
}

// When WSAD is pressed ship moves according to the direction in variable
void keyPressed() {



  if (GameStart == false) {
    if (key == 'w') {
      startbuttonpress = true;
    } else if (key == 's') {
      startbuttonpress = false;
    }

    if (startbuttonpress == true) {
      if (key == ' ') {
        print("Start Gameplay");
        GameStart = true;
        ship.ShipPosition.x = width/2;
        ship.ShipPosition.y = height/2;
      }
    }
    if (startbuttonpress == false) {
      if (key == ' ') {
        print("got to credits");
        CreditsActive = true;
      }
    }
    if (CreditsActive == true) {
      if (key == ' ') {
        println("go back to start screen");
        CreditsActive = false;
        delay(500);
      }
    }
    
  }


  if (GameStart == true) {
    if (key == 'w') {
      //ship.rotate(PI);
      ship.ShipPosition.y -= 10;
      //player.goUp=true;
    } else if (key == 'a') {
      //player.RotateLeft=true;
      ship.rotate -= PI/20;
      //ship.rotate += 1;
    } else if (key == 's') {
      //player.goDown=true;
      //ship.rotate -= 1;
    } else if (key == 'd') {
      //player.RotateRight=true;
    } else if (key == 'e') {
      //player.test=true; //something i had to test certain functions i no longer need it but i grew attached and didn't want to delete it so i repurposed it. press it see what happens
    }
  }
}
// void keyreleased code makes sure that the ship stops going in that direction when that key is released
void keyReleased() {
  if (key == 'w') {
    //player.goUp=false;
  } else if (key == 'a') {
    //player.RotateLeft=false;
  } else if (key == 's') {
    //player.goDown=false;
  } else if (key == 'd') {
    //player.RotateRight=false;
  } else if (key == 'e') {
    //player.test=false;
  }
}
