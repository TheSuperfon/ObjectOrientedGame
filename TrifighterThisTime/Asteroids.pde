class Asteroids {
  float RandomAsteroidSize;//asteroid size
  
  PVector AsteroidPosition; //asteroid starting position
  PVector AsteroidsDirection; //direction asteroid goes in
  
  Asteroids() {//determines how the asteroids are made and what direction they will go in and these are randomized each time the program starts
    AsteroidPosition = new PVector(random(width),random(height)); // randomizes the starting location of the asteroid
    //AsteroidPosition = new PVector(400,400); // randomizes the starting location of the asteroid
    AsteroidsDirection = new PVector(random(-2,2),random(-2,2)); //randomizes the direction of the asteroid
    RandomAsteroidSize = random(30,80); //randomizes the size of the asteroid
  }
  
  void CreateAsteroids() {
    //circle(AsteroidLocation.x,AsteroidLocation.y,AsteroidSize); //tells the program how to spawn the asteroid
    imageMode(CENTER);
    image(AsteroidSprite, AsteroidPosition.x, AsteroidPosition.y);
    AsteroidSprite.resize(66,66);
    fill(255);
    //rect(400,400,215,215);
    //AsteroidSprite.resize(80,76);
  }
  
  void update() {
    AsteroidPosition.add(AsteroidsDirection);//constantly moves asteroid based on random direction
  }
  
  
  
  void AsteroidsStayOnMap() {
    if (AsteroidPosition.x > width) {
      AsteroidPosition.x = 0;
    } else if (AsteroidPosition.x < 0) {
      AsteroidPosition.x = width;
    }

    if (AsteroidPosition.y > height) {
      AsteroidPosition.y = 0;
    } else if (AsteroidPosition.y < 0) {
      AsteroidPosition.y = height;
    }
  }
}
