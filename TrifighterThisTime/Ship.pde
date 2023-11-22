class Ship {

  //ship position variables
  float playerX;
  float playerY;
  PVector ShipPosition = new PVector();
  PVector ShipVelocity = new PVector(); //velocity = direction + speed
  float rotate;
  float speed;


  Ship() {

    ShipPosition.x = playerX;
    ShipPosition.y = playerY;
    speed = 0;
    rotate = 0;
  }


  void MakeShip() {
    //noStroke(); //no outline
    //fill(255, 220, 0);
    imageMode(CENTER);
    pushMatrix();
    translate(ShipPosition.x, ShipPosition.y);
    rotate(rotate);

    image(ShipSprite, 0, 0);
    ShipSprite.resize(80,76);

    //triangle(0, (- 60), (- 20), (- 30), (+ 20), (- 30));
    //rect(0, 0, 40, 60);
    //rect((0)+25, (0)+30, 15, 60);
    //rect((0)-25, (0)+30, 15, 60);
    popMatrix();
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
