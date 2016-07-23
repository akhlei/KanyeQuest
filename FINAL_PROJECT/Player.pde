//Playable character class
//Extends from avatar, has own hit list, collision detection, draw
//General physics and interactions of the player controlled character


class Player extends Avatar {
  ArrayList<Projectile> shots;
  float maxHealth; 
  float healthRatio;
  float fireRate; 
  float shotspd;
  float baseFireRate;
  float damp = 0.9;
  float shotTime;


  Player (PImage img, PVector pos) {
    super(img, pos);
    vel= new PVector();
    maxHealth=10;
    shotspd=13.5;
    baseFireRate=15;   //higher number means a longer time between shots
    fireRate=baseFireRate;
    charHeight = 100; 
    charWidth = 80;
    health = 10;
    healthRatio= health/maxHealth;
    shots = new ArrayList<Projectile>();
  }

  //decrease health method
  void damage() {
    health -=1 ;
    if (health==0) {
      state=LOST;
    } 
    if (health > maxHealth) {
      health = maxHealth;
    }
  }

  //creates projectile objects and dictates fire rate
  void shoot() {
    if (shotTime == 0) {
      shots.add(new Projectile (new PVector(pos.x, pos.y-50), new PVector(shotspd, 0), 1, shots)); 
      shotTime=fireRate;
    }
    shotTime --;
  }

  //physics of player movement

  //game mechanics and updates
  void update() {
    //generate list of projectiles
    for (int i=0; i<shots.size (); i++) {
      Projectile shot = shots.get(i);
      shot.update();
      shot.drawProjectile();

      for (int j = 0; j < currentLevel.enemies.size (); j++) {
        Enemy foe = currentLevel.enemies.get(j);
        if (shot.hitAva(foe)) {
          foe.damage();
          shot.status = -1;
        }
      }
    }
    super.update();
    drawPlayer();
    wallDetection();
    healthRatio=health/maxHealth;
    if (pos.x+charWidth/2 >=width) nextLevel();
  }

  //maintains boundaries of the game for player
  void wallDetection() {
    //if (pos.x+charWidth/2 >=width) pos.x= width-charWidth/2;
    if (pos.x-charWidth/2 <=0) pos.x=charWidth/2;
    if (pos.y-charHeight/2 <= height/2-charHeight/2) pos.y=height/2;
    if (pos.y+charHeight/2 >=height) pos.y=height-charHeight/2;
  }

  //on death or level change, reposition and reset the player
  void respawn() {
    pos.x=charWidth;
    pos.y=height/2;
    health=maxHealth;
    fireRate=baseFireRate;
  }

  //draw method for player character (tested as a hitbox) 
  void drawPlayer() {
    pushMatrix();
    translate(pos.x, pos.y);
    image(playImg, -charWidth/2, -charHeight);
    //fill(0, 155, 0);
    //rectMode(CENTER);
    //rect(0, 0, charWidth, charHeight);
    popMatrix();
  }
}

