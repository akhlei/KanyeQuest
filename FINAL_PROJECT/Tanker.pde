class Tanker extends Enemy {
  Tanker (PImage img, PVector pos) {
    super(img, pos);
    this.health = 6;
    this.speed = random(0.3, 0.45);;
    this.vel = new PVector (0, 0);
    this.charHeight = 110;
    this.charWidth = 100;
    forward = new PVector (-speed, 0);
  }

  boolean collision(Avatar other) {
    if (dist(pos.x, pos.y, other.pos.x, other.pos.y) < charWidth/2 + charHeight/2) {
      return true;
    }
    return false;
  }

  void update() {
    super.update();
  }

  void damage() {
    super.damage();
  }

  void move(PVector force) {
    super.move(force);
  }

  Tanker clone() {
    return new Tanker(tankImg, new PVector(random(width, width+50), random(height/2, height-charHeight)));
  }

  void drawFoe () {
    pushMatrix();
    translate(pos.x-player.vel.x, pos.y);
    image(tankImg, -charWidth/2, -charHeight/2-12);
    popMatrix();
  }
}

