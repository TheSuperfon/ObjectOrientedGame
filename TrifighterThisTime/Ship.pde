class Ship {

  //ship position variables
  float playerX;
  float playerY;
  PVector ShipPosition = new PVector();
  PVector ShipVelocity = new PVector(); //velocity = direction + speed
  PVector ShipDirection = new PVector();
  float rotate;
  float speed;


  Ship() {

    //ShipPosition.x = playerX;
    //ShipPosition.y = playerY;
    speed = 0;
    rotate = 0;
  }


  void MakeShip() {
    imageMode(CENTER);
    pushMatrix();
    translate(ShipPosition.x, ShipPosition.y);
    rotate(ShipDirection.heading()); //actually rotates the ship by providing an angle based on the shipdirection pvector
    image(ShipSprite, 0, 0,80,76);
    popMatrix();
  }

  void MoveShip() {

    ShipPosition.add(ShipVelocity);

    if (LeftRotation == true) {
      ShipDirection.rotate(radians(-5));
      //print("rotate");
    }
    if (RightRotation == true) {
      ShipDirection.rotate(radians(5));
    }
    if (GoForward == true){
      ShipVelocity.add(ShipDirection);
      ShipVelocity.add(ShipDirection);
    }
    if (GoBackwards == true){
      ShipVelocity.sub(ShipDirection);
      ShipVelocity.sub(ShipDirection);
    }
    ShipVelocity.limit(6);
  }


  //this void keeps the player on the map
  void ShipStayOnMap() {
    if (ShipPosition.x > width) {
      ShipPosition.x = 0;
    } else if (ShipPosition.x < 0) {
      ShipPosition.x = width;
    }

    if (ShipPosition.y > height) {
      ShipPosition.y = 0;
    } else if (ShipPosition.y < 0) {
      ShipPosition.y = height;
    }
  }
}
