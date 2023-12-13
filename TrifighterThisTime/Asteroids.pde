class Asteroids {
  float RandomAsteroidSize;//randomized asteroid size multiplyer

  PVector AsteroidPosition; //asteroid starting position
  PVector AsteroidsDirection; //direction for asteroid

  Asteroids() {
    AsteroidPosition = new PVector(random(width), random(height)); // randomizes the starting location of the asteroid

    AsteroidsDirection = new PVector(random(-2, 2), random(-2, 2)); //randomizes the direction of the asteroid
    //AsteroidsDirection = new PVector(100,100); //infitie speed
    RandomAsteroidSize = random(66, 96); //randomizes the size of the asteroid
  }

  void CreateAsteroids() {
    imageMode(CENTER);
    image(AsteroidSprite, AsteroidPosition.x, AsteroidPosition.y, RandomAsteroidSize, RandomAsteroidSize);
    //AsteroidSprite.resize(66,66);
    fill(255);
    //rect(400,400,215,215);
    //AsteroidSprite.resize(80,76);
  }

  void ReCreateAsteroids() {
    AsteroidPosition = new PVector(random(width), random(height)); // randomizes the starting location of the asteroid
    AsteroidsDirection = new PVector(random(-2, 2), random(-2, 2)); //randomizes the direction of the asteroid
    RandomAsteroidSize = random(66, 96); //randomizes the size of the asteroid
    imageMode(CENTER);
    image(AsteroidSprite, AsteroidPosition.x, AsteroidPosition.y, RandomAsteroidSize, RandomAsteroidSize);
    //AsteroidSprite.resize(66,66);
    fill(255);
    //rect(400,400,215,215);
    //AsteroidSprite.resize(80,76);
  }

  void MoveAsteroids() {
    AsteroidPosition.add(AsteroidsDirection);//sets asteroid in motion and inspired by nottrifighteranymorecode but modified to fit this coding project
    for (int i = 0; i < bulletlist.size(); i++)
    {
      float BulletCollisionDetector = AsteroidPosition.dist(bulletlist.get(i).BulletPosition);
      if (BulletCollisionDetector <= RandomAsteroidSize/2) {
        ReCreateAsteroids();
        bulletlist.remove(i);
      }
      
      if (i >= bulletlist.size()){
        i = 0;
        
      }
    }
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
