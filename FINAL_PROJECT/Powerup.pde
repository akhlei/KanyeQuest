//Overarching class for collision based power-ups which alter the players parameters

class Powerup {
  PVector pos;
  PImage img;
  int size;
  color colour;
  //probability that the powerup appears 

  Powerup (PImage img,PVector pos) {
    this.img=img;
    this.pos=pos;
    size = 10;
  }

  boolean playerContact(Player player) {
    if ((dist(pos.x, pos.y, player.pos.x, player.pos.y) < player.charWidth/2 + size/2)) {
      return true;
    }
    return false;
  }

  void effect() {
    player.health +=1;
  }


  void powUpdate() {
    draw();
    if (playerContact(player)) {
      currentLevel.powerups.remove(this); 
      effect();
    }
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(colour);
    stroke(255);
    strokeWeight(2);
    rectMode(CENTER);
    rect(0, 0, size, size);
    rectMode(RECT);
    stroke(0);      
    strokeWeight(1);
    popMatrix();
  }
}

