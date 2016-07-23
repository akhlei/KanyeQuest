

class Enemy extends Avatar {
  float speed;
  PVector forward;
  float angle;

  //Constructor for the most basic form of Enemies 
  Enemy (PImage img, PVector pos) {
    super(img, pos);
    this.health = 3;
    this.speed = random(0.5,0.6);
    this.vel = new PVector (0,0);
    this.charHeight = 90;
    this.charWidth = 90;
    forward = new PVector (-speed, 0);
  } 

  //collision detection for other characters returning a boolean
  boolean collision(Avatar other) {
    if (dist(pos.x, pos.y, other.pos.x, other.pos.y) < charWidth/2 + charHeight/2) {
      return true;
    }
    return false;
  }


  //frame by frame update including the draw method 
  void update() {
    move(forward);
    drawFoe();
    if (pos.x < 0) {
      currentLevel.enemies.remove(this);
    }
    super.update();
  }

  //health management (basically, taking a hit)
  void damage() {
    health --;
    if (health<=0) {
      currentLevel.enemies.remove(this);
    }
  } 

  void move(PVector force) {
    super.move(force);
  }

  //clone method used in the spawnEnemies method to create duplicates of a predetermined enemy type 
  Enemy clone() {
    return new Enemy(foeImg, new PVector(random(width, width+50), random(height/2, height-charHeight)));
  }

  //basic draw function, also serves as a visual representation of a hitbox during testing 
  void drawFoe() {
    pushMatrix();
    angle += random(0.04, 0.06);
    translate(pos.x, pos.y);
    image(foeImg, -charWidth/2, -charHeight/2-10);
    popMatrix();
  }
}

