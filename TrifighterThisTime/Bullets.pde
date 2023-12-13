class Bullets {

  PVector BulletPosition;
  PVector BulletDirection;
  PVector BulletVelocity = new PVector();
  int BulletNumber;

//nottrifighteranymore may of had some inspiration on this but I didn't refer to it when making this code (like when refering to the asteroid list i didn't think of nottrifighteranymore and just wanted to make code to refer to every asteroid

  Bullets() {
    BulletPosition = ship.ShipPosition.copy(); //gets copy of the ships position for bullet starting point
    BulletDirection = ship.ShipDirection.copy(); //gets copy of ships direction so it knows where to point and subsequently go
    BulletNumber = (bulletlist.size()-1); //gets assigned a number
  }

  void MakeBullet() {
    imageMode(CENTER);
    pushMatrix(); //isolates the bullet translation so it can move
    translate(BulletPosition.x, BulletPosition.y); //moves the bullet based on the pvector's x and y values
    rotate(BulletDirection.heading()); //actually rotates the bullet by providing an angle based on the shipdirection pvector
    image(BulletSprite, 0, 0); //gets the image
    BulletSprite.resize(25, 15); //resized it because i felt like it
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
        while (BulletNumber >= bulletlist.size()){
          BulletNumber -= 1;
          //print("wow");
          
        }
        
        
        GlobalBulletNumber = BulletNumber;
        PlayerTimer += 1;
        RemoveBullets();
      }
    }
  }
  void lessenBullet() {
    if (BulletNumber > 0) {
      BulletNumber -= 1;
    }
  }


//inspired by nottrifighteranymore but modified and improved in it's application
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
