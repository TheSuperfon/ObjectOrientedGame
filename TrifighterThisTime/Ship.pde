class Ship {

  //ship position variables
  float playerX;
  float playerY;
  PVector ShipPosition = new PVector();



  Ship(float playerX, float playerY) {

    ShipPosition.x = playerX;
    ShipPosition.y = playerY;
  }


  void MakeShip() {
    noStroke(); //no outline
    fill(255, 220, 0);
    triangle(400, 340, 380, 370, 420, 370);
    rect(ShipPosition.x, ShipPosition.y, 40, 60);
    //print(playerX);
    //fill(255);
    rect((ShipPosition.x)+25, (ShipPosition.y)+30, 15, 60);
    rect((ShipPosition.x)-25, (ShipPosition.y)+30, 15, 60);
  }
}
