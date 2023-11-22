class Asteroids {
  float RandomAsteroidSize;//asteroid size
  
  PVector AsteroidPosition; //asteroid starting position
  PVector AsteroidsDirection; //direction asteroid goes in
  
  
  
  
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
