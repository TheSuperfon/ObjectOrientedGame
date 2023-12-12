class Bullets {

  PVector BulletPosition;
  PVector BulletDirection;
  PVector BulletVelocity = new PVector();
  Boolean Activate;



  Bullets() {
    BulletPosition = ship.ShipPosition.copy();
    BulletDirection = ship.ShipDirection.copy();
  }

  void MakeBullet() {
    imageMode(CENTER);
    pushMatrix();
    translate(BulletPosition.x, BulletPosition.y);
    rotate(BulletDirection.heading()); //actually rotates the bullet by providing an angle based on the shipdirection pvector
    image(BulletSprite, 0, 0);
    //ShipSprite.resize(80, 76);
    Activate = true;
    popMatrix();
  }

  void MoveBullet() {
    for (int i = 0; i < 10; i++) {
      BulletVelocity.add(BulletDirection);
    }
    BulletVelocity.add(BulletDirection);
    BulletPosition.add(BulletVelocity);//constantly moves bullet based on random direction
    BulletVelocity.limit(10);
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
