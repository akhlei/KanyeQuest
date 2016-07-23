class HealthPack extends Powerup {

  HealthPack(PImage img, PVector pos){
    super(img, pos);
    size = 14;
    color colour = color(255,0,0);
  }
  

  void powUpdate() {
    super.powUpdate();
  }

  void effect() {
    player.health += 3;
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    image(healthImg, -size/2, -size/2);
    popMatrix();
  }
}

