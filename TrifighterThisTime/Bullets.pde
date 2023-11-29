class Bullets {
  
  PVector BulletPosition = ship.ShipPosition.copy();
  PVector BulletDirection = ship.ShipPosition.copy();
  PVector BulletVelocity;
  
  

  Bullets() {
    
    
    
    
    
  }
  
  void MakeBullet() {
    //noStroke(); //no outline
    //fill(255, 220, 0);
    imageMode(CENTER);
    pushMatrix();
    translate(BulletPosition.x, BulletPosition.y);
    rotate(BulletDirection.heading()); //actually rotates the ship by providing an angle based on the shipdirection pvector
    image(BulletSprite, 0, 0);
    //ShipSprite.resize(80, 76);

    popMatrix();
  }
  
  
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
