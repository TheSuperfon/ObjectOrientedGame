//Trifighter hopefully this time

//menu button variables
boolean GameStart;
int timerFrames;
int PlayerTimer;


void setup(){
  size(800,800);
  background(0);
  //strokeWeight(4); //default outline thickness
  stars();
}




void draw(){
  Title();
  
  
}



void Title(){
  fill(255,255,240);
  textSize(100);
  //strokeWeight(10); // thicker outline
  //stroke(255,252,155);
  text(("TriFighter"), 190, 190); //text so players know what the button does
  
  
}

void stars(){
  // the randomness makes the stars look a bit more natural and not like a forced pattern
  for (float i = random(20,40); i < random(750,800); i = i+ random(80,100)) {
    for (float j = random(20,40); j < random(800,900); j = j+random(80,100)) {
      noStroke();
      fill(255,252,155); // star (debatable) color
      circle(i, j,random(2,5));
    }
    }
}
