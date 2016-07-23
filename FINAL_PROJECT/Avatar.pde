//PARENT CLASS FOR AN IN GAME CHARACTER
//Fields for position, health, size 

class Avatar {
  //fields
  PVector pos, vel;
  int charHeight, charWidth;
  float health;
  float damp = 0.9;

  PImage img;

  //constructor 
  Avatar(PImage img, PVector pos) {
    this.img = img;
    this.pos = pos;
  }

  //Movement update and collision detection 
  void update() { 
    vel.mult(damp);
    pos.add(vel);
  }

  void move(PVector force) {
    vel.add(force);
  }
}

