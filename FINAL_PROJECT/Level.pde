//THIS ISN'T BEING USED YET
//Generates instances of the player, their mechanics, the enemies and their interactions
//General gameplay backbone is within this method. Calls several other methods (Enemy, World)
//Healthbar also located here

class Level { 
  World world;
  PImage bgimg;
  int surprise =  int(random(1, 4));
  int foeSpawn = int(random(1, 3));    // used in the powerupSpawn method to determine randomly what powerups will spawn
  int powChance = int(random(300, 600));  //timer which paces whether to check for adding powerups
  int maxPowerups = 2;
  ArrayList<Powerup> powerups; 
  ArrayList<Enemy> enemies;
  int startEnemy=10;
  int maxEnemy;
  int spawnTime;
  int oddsMatch=0;
  Enemy foetype;
  Enemy secondtype;  //foetype can change depending on level
  // for levels with multiple simultaneous enemies;

  //spawn specific enemy types depending on level


  Level(PImage bg, int maxEnemy, Enemy foetype) {
    world = new World(bg);
    this.foetype=foetype;
    this.maxEnemy=maxEnemy;
    enemies=new ArrayList<Enemy>();
    powerups=new ArrayList<Powerup>();
    for (int i=0; i < maxEnemy; i++) {
      spawnEnemies();
    }
  }

  Level(PImage bg, int maxEnemy, Enemy foetype, Enemy secondtype) {
    world = new World(bg,1,1,-.55);
    this.foetype=foetype;
    this.secondtype=secondtype;
    this.maxEnemy=maxEnemy;
    enemies=new ArrayList<Enemy>();
    powerups=new ArrayList<Powerup>();
    for (int i=0; i < maxEnemy; i++) {
      if (i%2 == 0) {
        spawnEnemies();
      } else {
        spawnTougherEnemies();
      }
    }
  }

  //THE GAMEPLAY IN THE MAIN METHOD WILL GO HERE. 
  void gamePlay() {

    world.worldDraw(new PVector(player.pos.x-player.vel.x, 0));
    //world.worldDraw(new PVector(-player.pos.x, -player.pos.y));
    //instantiate player and health bar 
    player.update();

    //Player movement physics 
    if (up) player.move(upForce);
    if (down) player.move(downForce);
    if (left) player.move (leftForce);
    if (right) player.move(rightForce);
    if (shot) player.shoot();

    //enemy generation 
    for (int i=0; i<enemies.size (); i++) {
      Enemy foe = enemies.get(i);
      foe.update();
      //collision detection (enemy w/ player)
      if (foe.collision(player)) {
        player.damage();
        enemies.remove(foe);
      }
      if (enemies.size() < maxEnemy) {
        if (frameCount%2==0) {
          spawnEnemies();
        } else {
          spawnTougherEnemies();
        }
      }
    }

    //powerUp geneation

    powerupChance(powChance);


    for (int j=0; j<powerups.size (); j++) {
      Powerup buff = powerups.get(j);
      buff.powUpdate();
      if (buff.playerContact(player)) {
        powerups.remove(buff);
      }
    }
    drawHealthBar();
  }


  //will need editing later
  void variableReset() {
    player.respawn();
  }

  //adds new enemy instances to the arraylist for enemies 
  void spawnEnemies() {
    enemies.add(foetype.clone());
  } 

  void spawnTougherEnemies() {
    enemies.add(secondtype.clone());
  }

  //adds new powerup instances to the arrlist for powerups 
  void powerupSpawn() { 
    if (surprise != 1) {
      powerups.add(new HealthPack(healthImg, new PVector (random(width/2, width-50), (random(height/2+50, height-50)))));
    } else if (surprise == 1) {
      powerups.add(new FireRate(healthImg, new PVector  (random(width/2, width-50), (random(height/2+50, height-50)))));
    }
    surprise = int(random(1, 3));
  }

  void powerupChance(int odds) {
    oddsMatch ++;
    if (oddsMatch == odds) {
      powerupSpawn();
      powChance = int(random(600, 1200));
      oddsMatch = 0;
    }
  }

  //Player Healthbar UI
  void drawHealthBar() {
    int healthBarWidth = 200;
    pushMatrix();
    fill(0, 50);
    translate(20, 20);
    rectMode(RECT);
    rect(0, 0, healthBarWidth, 20); //health bar "tube"
    fill(193, 18, 18);
    rect(0, 0, healthBarWidth*player.healthRatio, 20); //health in tube
    popMatrix();
  }
}

