class FireRate extends Powerup {

  FireRate(PImage img, PVector pos) {
    super(img, pos);
    size = 18;
    colour = color(0, 100, 255);
  }

  void powUpdate() {
    super.powUpdate();
  }

  void effect() {
    player.fireRate -= 2;
  }

  void draw() {
    pushMatrix();
    translate(pos.x-player.vel.x, pos.y);
    fill(0, 100, 255);
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

