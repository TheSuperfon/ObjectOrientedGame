class Bullets {

  PVector BulletPosition;
  PVector BulletDirection;
  PVector BulletVelocity = new PVector();
  Boolean Activate;
  int BulletNumber;



  Bullets() {
    BulletPosition = ship.ShipPosition.copy();
    BulletDirection = ship.ShipDirection.copy();
    BulletNumber = (bulletlist.size()-1);
  }

  void MakeBullet() {
    imageMode(CENTER);
    pushMatrix();
    translate(BulletPosition.x, BulletPosition.y);
    rotate(BulletDirection.heading()); //actually rotates the bullet by providing an angle based on the shipdirection pvector
    image(BulletSprite, 0, 0);
    BulletSprite.resize(25, 15);
    Activate = true;
    popMatrix();
    //print(BulletNumber);
  }

  void MoveBullet() {
    for (int i = 0; i < 10; i++) {
      BulletVelocity.add(BulletDirection);
    }
    BulletVelocity.add(BulletDirection);
    BulletPosition.add(BulletVelocity);//constantly moves bullet based on random direction
    BulletVelocity.limit(10);
    
    
    for (int j = 0; j < asteroidslist.length; j++)
      {
        float BulletCollisionDetector = asteroidslist[j].AsteroidPosition.dist(BulletPosition);
        if (BulletCollisionDetector < asteroidslist[j].RandomAsteroidSize/2) {
          asteroidslist[j].ReCreateAsteroids();
          GlobalBulletNumber = BulletNumber;
          PlayerTimer += 1;
          RemoveBullets();
        }
      }
    
    
    
    
  }
  void lessenBullet(){
    BulletNumber -= 1;
    
    
  }
  
  //void StopBullet() {
  //  BulletPosition = ship.ShipPosition.copy();
  //  BulletDirection = ship.ShipDirection.copy();
  //  BulletVelocity = new PVector(); 
  //  
  //}



  void BulletsStayOnMap() {
    if (BulletPosition.x > width) {
      BulletPosition.x = 0;
    } else if (BulletPosition.x < 0) {
      BulletPosition.x = width;
    }

    if (BulletPosition.y > height) {
      BulletPosition.y = 0;
    } else if (BulletPosition.y < 0) {
      BulletPosition.y = height;
    }
  }
}
