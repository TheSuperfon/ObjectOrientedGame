class Ship {

  //ship position variables
  float playerX;
  float playerY;
  PVector ShipPosition = new PVector();
  PVector ShipVelocity = new PVector(); //velocity = direction + speed
  PVector ShipDirection = new PVector();



  Ship() {
  }

  //push and pop matrix and rotate inspired by nottrifighteranymore but implimented way differently except for maybe translate as there was really only one way to impliment asteroid positioning with translate
  void MakeShip() {
    imageMode(CENTER);
    pushMatrix();
    translate(ShipPosition.x, ShipPosition.y);
    rotate(ShipDirection.heading()); //actually rotates the ship by providing an angle based on the shipdirection pvector
    image(ShipSprite, 0, 0, 80, 76);
    popMatrix();
  }

  void MoveShip() {


    //custom code that was inspired by but done way differently than nottrifighteranymore
    ShipPosition.add(ShipVelocity);

    if (LeftRotation == true) {
      ShipDirection.rotate(radians(-5));
      //print("rotate");
    }
    if (RightRotation == true) {
      ShipDirection.rotate(radians(5));
    }
    if (GoForward == true) {
      ShipVelocity.add(ShipDirection);
      ShipVelocity.add(ShipDirection);
    }
    if (GoBackwards == true) {
      ShipVelocity.sub(ShipDirection);
      ShipVelocity.sub(ShipDirection);
    }
    ShipVelocity.limit(6);
  }


  //inspired by nottrifighteranymore but modified and improved in it's application
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
