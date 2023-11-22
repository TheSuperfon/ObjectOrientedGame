class Ship {

  //ship position variables
  //float playerX;
  //float playerY;
  PVector ShipPosition = new PVector();
  float rotate;
  float speed;


  Ship(float playerX, float playerY) {

    ShipPosition.x = playerX;
    ShipPosition.y = playerY;
    speed = 0;
    rotate = 0;
  }


  void MakeShip() {
    noStroke(); //no outline
    fill(255, 220, 0);
    pushMatrix();
    translate(ShipPosition.x, ShipPosition.y); 
    rotate(rotate);
    
    triangle(0, (- 60), (- 20), (- 30), (+ 20), (- 30));
    rect(0, 0, 40, 60);
    rect((0)+25, (0)+30, 15, 60);
    rect((0)-25, (0)+30, 15, 60);
    popMatrix();
  }
  
  
  
  
   //this void keeps the player on the map
  void StayOnMap() {
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
