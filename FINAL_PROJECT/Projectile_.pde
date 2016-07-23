class Projectile {
  PVector pos, vel;
  int radius;
  int  status = 1;
  ArrayList list;

  Projectile(PVector pos, PVector vel, int status, ArrayList list) {
    this.pos=pos;
    this.vel=vel;
    this.list=list;
    radius=16;
  }

  boolean hitAva(Avatar ava) {
    if (abs(pos.x-ava.pos.x) < abs(radius + ava.charWidth/2) &&
      abs(pos.y-ava.pos.y) < abs(radius + ava.charHeight/2)) {
      status = -1;
      return true;
    }
    return false;
  }

  void update() {
    pos.add(vel);
    if (pos.x > width) {
      status = -1;
    }
    if (status < 0) {
      list.remove(this);
    }
  }


  void drawProjectile() {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(0);
    strokeWeight(0.5);
    fill(0);
    ellipse(0, 0, radius*2, radius*2);
    fill(255,0,0);
    ellipse(0,0, radius*2/3, radius*2/3);
    fill(0);
    ellipse(0,0, 4, 4);
    popMatrix();
  }

}
