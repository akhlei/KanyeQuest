/*Main Setup for "HipHopHeroes"
 Narrative begins with your choice between three contemporary 
 hip hop artists/MC's (Kanye West, Kendrick Lamar, Drake). They're
 transported via time travel back to NYC in the 70's, during the 
 beginning eras of hip hop. Intimidated by their new-fangled 
 rhyme schemes and lyrical content, the hip-hop giants of the era
 attempt to eliminate their contemporary counterparts. Recruiting 
 armies of 70's era NYC gangsters, thugs,  and rap fans, the
 pioneers of hip-hop (Grandmaster Flash, Afrikaa Bambaataa, and 
 Run DMC) must have their perspectives of new era hip-hop changed 
 by the juggernauts of their genre from 40 years in future. 
 */


//GAMESTATE
int state= 1;
final int STARTSCREEN=0;
final int GAMEPLAY=1;
final int WINSCREEN=2;
final int LOST=3;
Player player;
Powerup buff;

Level currentLevel; 
ArrayList<Level> levels; 


//Should load player, game world, and enemies within level
void setup() {
  size(1200, 600);
  loadImages();
  initializeGame();
  frameRate(60);
  
}

void initializeGame() {
  //declare the starting gameplay state 
  state=STARTSCREEN;
  //instantiate the playable character 
  player = new Player(playImg, new PVector(60, height-100));


  //level management, create an instance of the level and add 
  //to the ArrayList which manages levels 
  levels = new ArrayList<Level>();
  Level level1 = new Level(level1bg, 5, new Enemy(foeImg, new PVector(random(width/2, width-12), random(height/2+12, height-12))), new Breaker(foeImg, new PVector(random(width/2, width-12), random(height/2+12, height-12))));
  Level level2 = new Level(level2bg, 6, new Enemy(foeImg, new PVector(random(width/2, width-12), random(height/2+12, height-12))), new Tanker(foeImg, new PVector(random(width/2, width-12), random(height/2+12, height-12))));
  Level level3 = new Level(level3bg, 10, new Tanker(foeImg, new PVector(random(width/2, width-12), random(height/2+12, height-12))), new Breaker(foeImg, new PVector(random(width/2, width-12), random(height/2+12, height-12))));
  //MAKE SURE - levels are added in reverse order to properly remove correct level after completetion
  levels.add(level3);
  levels.add(level2);
  levels.add(level1);


  currentLevel = level1;     //current level will be changed as player progresses, initially level 1 duh.
}


void nextLevel() {
  //as per lab example, to prevent calling an ever-shrinking levels
  //arraylist, current level is always the last item in level list
  levels.remove(levels.size()-1);
  if (levels.size()==0) {
    state=WINSCREEN;
  } else { 
    currentLevel = levels.get(levels.size()-1);
    currentLevel.variableReset();
  }
}



//Main draw loop of game
void draw() {
  switch(state) {
  case STARTSCREEN: 
    startScreen("KANYE QUEST", "In the year 2017, Drake is a bigger star than Kanye West.\nKanye's last album in 2015 was outsold heavily by Drizzy and Kim left him and took half his money. \nYe's massive ego cannot handle these slights against him; he's design a time machine and travelled back in time  to 80's era \nNew York city so he can fully develop his creative musical genius. \n\nHowever, gangsterous battle-MC's of the 80s aren't down with this kid from Chicago. \nTo earn their respect, Kanye must defeat them all in bar-for-bar combat.\nUse the WASD keys to move Kanye and the J key to spit over some dope beats.");
    break;
  case GAMEPLAY:
    currentLevel.gamePlay();
    break;
  case LOST:
    menuScreen("YOU'VE FAILED HIP HOP", "Click to Continue");
    break;
  case WINSCREEN: 
    menuScreen("HIP HOP HAS BEEN UNITED! YOU WIN!", "After earning the respect of local MC's,\nKanye now has the time to hone his skills\n and prepare for that dastardly Aubrey Graham\nClick to Restart");
    break;
  }
}


void menuScreen(String title, String text) {
  background (0);
  PFont styleFont = loadFont("FloodStd-48.vlw");
  PFont legibleFont = loadFont("Futura-Medium-36.vlw");
  fill (255);
  textFont(styleFont, 60);
  text(title, width/2-title.length()*60/3.8, height/2-100); 
  textFont(legibleFont, 48);
  text(text, width/2-text.length()*48/4, height/2);
}

void startScreen(String title, String text) {
  background(85, 3, 3);
  PFont styleFont = loadFont("FloodStd-48.vlw");
  PFont legibleFont = loadFont("Futura-Medium-36.vlw");
  fill(#F2C727);
  textFont(styleFont, 48);
  text(title, width/2-title.length()*60/3, 50);
  textFont(legibleFont, 20); 
  textLeading(36);
  text(text, 30, 90);
}
