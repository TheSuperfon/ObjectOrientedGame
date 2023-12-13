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

//direction variables inspired by trifighterthistimeforreal but modified and improved in it's application
boolean GoForward;
boolean LeftRotation;
boolean RightRotation;
boolean GoBackwards;




//object things
Ship ship;

//gamestarter for cases
int Gamestart2;

//
boolean BulletTimetoreset;

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
  PlayerTimer = 0;
  Gamestart2 = 1;
}




void draw() {
  fill(0); // black sky filling
  rect(width/2, height/2, width, height); // actual black sky rectangle
  stars();
  textSize(30);
  fill(255, 255, 240);
  text(("Score is" ), 30, 85); //instructs on how to start the game
  text((PlayerTimer), 150, 85);


  switch(Gamestart2) {
  case 1:
    Title();
    StartButton();
    CreditButton();
    Cursor();
    break;

  case 2:
    ship.MakeShip();
    ship.MoveShip();
    ship.ShipStayOnMap();
    for (int i = 0; i < asteroidslist.length; i++)
    {
      float ShipCollisionDetector = asteroidslist[i].AsteroidPosition.dist(ship.ShipPosition);
      if (ShipCollisionDetector < asteroidslist[i].RandomAsteroidSize/1.2) {
        Gamestart2 = 1;
        CreditsActive = false;
        asteroidslist[i].ReCreateAsteroids();
        BulletTimetoreset = true;
      }
    }

    SpawnInAsteroids();
    for (int i = 0; i < bulletlist.size() - 1; i++)
    {

      if (i >= 0) {

        bulletlist.get(i + 1).MakeBullet();
        bulletlist.get(i + 1).MoveBullet();
        bulletlist.get(i + 1).BulletsStayOnMap();
      }

      if ((bulletlist.size()) > 4) {
        //println("too many");
        bulletlist.remove((bulletlist.size()-1));
      }
      //for (int j = 0; j < asteroidslist.length; j++)
      //{
      //  float BulletCollisionDetector = asteroidslist[j].AsteroidPosition.dist(bulletlist.get(i).BulletPosition);
      //  if (BulletCollisionDetector < asteroidslist[j].RandomAsteroidSize/2) {
      //    print("shot");
      //    asteroidslist[j].ReCreateAsteroids();
      //    bulletlist.remove(i);
      //  }
      //}
      while (BulletTimetoreset == true) {
        if (BulletTimetoreset == true) {
          for (int r = 0; bulletlist.size() - 1 >= 0 ; r--) {
            bulletlist.remove(i);
          }

          BulletTimetoreset = false;
        }
      }
    }
    break;

  case 3:
    ActualCredits();
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


//credits button function because i wanted an excuse for another button
void CreditButton() {
  if (startbuttonpress == true) {
    fill(80, 0, 255); //highlighted purple
  }
  if (startbuttonpress == false) {
    fill(80, 100, 255); //unhighlited purple
  }
  rect(400, 475, 200, 50); //draws purple rectangle
  textSize(30); //sets good text size
  fill(255, 255, 240); //makes text white
  text(("Credits"), 355, 485); //credits text on purple button
}
void ActualCredits() {
  //rect(400, 475, 200, 50); //
  textSize(50);
  fill(255, 240, 240);
  text(("Credits"), 325, 90); //credits ext
  textSize(30);
  fill(255, 255, 240);
  text(("Revolutionnary genius and all around cool guy: Stefan Auburn"), 170, 290); //oh boy i'm so glad that i credited myself and everyone will be able to see my name associated with this game
  text(("Special thanks to the following:"), 180, 390); //oh boy i'm so glad that i credited myself and everyone will be able to see my name associated with this game
  text(("Lyle Rains"), 350, 430); //google his name
  text(("Ed Logg"), 350, 470); //google his name
  text(("Press A to return to menu"), 250, 670); //google his name
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



  if (Gamestart2 == 1) {
    if (key == 'w') {
      startbuttonpress = true; //highlights start button
    } else if (key == 's') {
      startbuttonpress = false; //unhighlights start button and highlights credits instead
    }

    if (startbuttonpress == true) {
      if (key == ' ') {
        GameStart = true;
        Gamestart2 = 2;
        PlayerTimer = 0;
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
        Gamestart2 = 3;
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


  if (Gamestart2 == 2) {
    if (key == 'w') {
      GoForward = true; //sets variable so ship can move forward in direction facing inspired by other coding projects like nottrifighteranymore and color dodge but modified to fit this project
    } else if (key == 'a') {
      LeftRotation = true; //sets variable so ship can rotate left inspired by other coding projects like nottrifighteranymore and color dodge but modified to fit this project
    } else if (key == 's') {
      GoBackwards = true; //sets variable so ship can move back inspired by other coding projects like nottrifighteranymore and color dodge but modified to fit this project
    } else if (key == 'd') {
      RightRotation = true; //sets variable so ship can rotate right inspired by other coding projects like nottrifighteranymore and color dodge but modified to fit this project
    } else if (key == ' ') {
      SpawnInBullets(); //activate the spawning in of bullets so they can be drawn and moved in direction of ship facing
    }
  }
  if (Gamestart2 == 3) {
    if (key == 'a') {
      Gamestart2 = 1;
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
