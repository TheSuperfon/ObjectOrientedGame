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

//sprite images
PImage ShipSprite;
PImage AsteroidSprite;
PImage BulletSprite;

//direction variables
boolean GoForward;
boolean LeftRotation;
boolean RightRotation;
boolean GoBackwards;



//object things
Ship ship;




//arraylist for bullets and arrays for asteroids
ArrayList<Bullets> bulletlist = new ArrayList<Bullets>();

Asteroids [] asteroidslist = new Asteroids[6];// array that holds 6 asteroids that appear in the game

//do cases for credits and add timer



void setup() {
  size(800, 800);
  frameRate = 60;
  background(0);
  ShipSprite = loadImage("ShipSprite.png");
  AsteroidSprite = loadImage("AsteroidSprite.png");
  BulletSprite = loadImage("BulletSprite.png");
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
  BuildAsteroids();
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
    ship.MoveShip();
    ship.ShipStayOnMap();
    for (int i = 0; i < asteroidslist.length; i++)
    {
      float ShipCollisionDetector = asteroidslist[i].AsteroidPosition.dist(ship.ShipPosition);
      if (ShipCollisionDetector < asteroidslist[i].RandomAsteroidSize/2) {
        GameStart = false;
        CreditsActive = false;
      }
    }

    SpawnInAsteroids();
    //println(bulletlist.size());
    for (int i = 0; i < bulletlist.size(); i++)
    {
      bulletlist.get(i).MakeBullet();
      bulletlist.get(i).MoveBullet();
      bulletlist.get(i).BulletsStayOnMap();
      if ((bulletlist.size()) > 3) {
        //println("too many");
        bulletlist.remove((bulletlist.size()-1));
      }
      for (int j = 0; j < asteroidslist.length; j++)
      {
        //if ((dist(asteroidslist[i].AsteroidPosition.x, bulletlist.BulletPosition.x, asteroidslist[i].AsteroidPosition.y, bulletlist.BulletPosition.y) )) {
        //
        //}
      }
    }


    //asteroid.CreateAsteroids();
  } else if ((GameStart == false) && (CreditsActive == true)) {
  }
}



//creates the asteroids for the code to see what they are
void BuildAsteroids()
{//uses a list to create asteroids and creates them the number of times specified when the array was set up which was 10
  for (int i = 0; i < asteroidslist.length; i++)
  {
    asteroidslist[i]=new Asteroids();
  }
}

void SpawnInAsteroids()
{
  for (int i = 0; i < asteroidslist.length; i++)
  {
    asteroidslist[i].MoveAsteroids();
    asteroidslist[i].AsteroidsStayOnMap();
    asteroidslist[i].CreateAsteroids();

    //if ((dist(asteroidslist[i].AsteroidPosition, bulletlist.BulletPosition) )){
    //
    //
    //}
  }
}

void SpawnInBullets()
{
  bulletlist.add(new Bullets());
}




void Title() {
  //print("Test");
  fill(255, 255, 240);
  textSize(100);
  text(("TriFighter"), 190, 190); //Title text with the name of the game
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
  // the randomness of x,y,size was done because i thought it was neat
  for (float i = random(40, 41); i < random(799, 800); i = i+ random(99, 100)) {
    for (float j = random(40, 41); j < random(799, 800); j = j+random(99, 100)) {
      noStroke();
      fill(255, 252, 155); // star (debatable) color
      circle(i, j, random(4, 5));
    }
  }
}

// ship rotates if A or D and moves forwards/backwards for W and S
void keyPressed() {



  if (GameStart == false) {
    if (key == 'w') {
      startbuttonpress = true; //highlights start button
    } else if (key == 's') {
      startbuttonpress = false; //unhighlights start button and highlights credits instead
    }

    if (startbuttonpress == true) {
      if (key == ' ') {
        print("Start Gameplay");
        GameStart = true;
        //sets starting position
        ship.ShipPosition.x = width/2;
        ship.ShipPosition.y = height/2;
        //sets starting speed
        ship.ShipVelocity.x = 0;
        ship.ShipVelocity.y = 0;
        //sets starting direction
        ship.ShipDirection.x = 0;
        ship.ShipDirection.y = -0.05;
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
      GoForward = true;
    } else if (key == 'a') {
      LeftRotation = true;
    } else if (key == 's') {
      GoBackwards = true;
    } else if (key == 'd') {
      RightRotation = true;
    } else if (key == ' ') {
      //SpawnInBullets();
    }
  }
}
// void keyreleased code makes sure that the ship stops going in that direction when that key is released
void keyReleased() {
  if (key == 'w') {
    GoForward = false;
  } else if (key == 'a') {
    LeftRotation = false;
  } else if (key == 's') {
    GoBackwards = false;
  } else if (key == 'd') {
    RightRotation = false;
  } else if (key == 'e') {
  }
}
