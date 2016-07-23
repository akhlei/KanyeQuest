//Background/Graphics of each level. Can call a different image as the game
//progresses. World method is called upon by the Level method. 

class World {
  PImage bg;
  int repeatX, repeatY;
  float scrollSpeed;


  //test constructor with no scrolling background
  World(PImage bg) {
    this.bg=bg;
    bg.resize(width(), height());
  }

  //intended final constructor for scrolling background 
  World(PImage bg, int repeatX, int repeatY, float scrollSpeed) {
    this.bg=bg;
    bg.resize(width(), height());
    this.repeatX = repeatX;
    this.repeatY = repeatY;
    this.scrollSpeed = scrollSpeed;
  }

  void worldDraw(PVector pos) {
    pos.mult(scrollSpeed);
    image(bg, -player.pos.x, pos.y);
  }



  int width() {
    return bg.width;
  }

  int height() {
    return bg.height;
  }
}

