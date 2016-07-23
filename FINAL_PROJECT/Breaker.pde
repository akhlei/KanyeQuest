class Breaker extends Enemy {
  PVector bounce;
  PVector reverse;
  PVector vertical;

  Breaker (PImage img, PVector pos) {
    super(img, pos);
    this.health = 3;
    this.speed = random(0.45, 0.5);
    this.vel = new PVector (0, 0);
    this.charHeight = 110;
    this.charWidth = 100;
    forward = new PVector (-speed, 0);
    bounce = new PVector (0, -0.3);
    reverse = new PVector(0, 0.3);
    vertical = reverse;
  }

  boolean collision(Avatar other) {
    if (dist(pos.x, pos.y, other.pos.x, other.pos.y) < charWidth/2 + charHeight/2) {
      return true;
    }
    return false;
  }

  void update() {
    if (pos.y-charHeight/2< height/2) {
      vertical=reverse;
    }
    if (pos.y+charHeight> height) {
      vertical=bounce;
    } 
    super.update();
    vel.add(vertical);
  }

  void damage() {
    super.damage();
  }

  void move(PVector force) {
    super.move(force);
  }

  Breaker clone() {
    return new Breaker(breakImg, new PVector(random(width, width+50), random(height/2, height-charHeight)));
  }

  void drawFoe () {
    pushMatrix();
    translate(pos.x, pos.y);
    image(breakImg, -charWidth/2, -charHeight/2-10);
    popMatrix();
  }
}

