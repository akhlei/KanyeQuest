//MOVEMENT PHYSICS
float speed = 0.9;
PVector upForce = new PVector(0, -speed);
PVector downForce = new PVector(0, speed);
PVector leftForce = new PVector(-speed, 0);
PVector rightForce = new PVector(speed, 0);
boolean up, down, left, right, shot;

//Player KEY CONTROLS
void keyPressed() {
  if (key == 'A' || key == 'a') left = true; 
  else if (key =='D' || key =='d') right = true;
  else if (key =='W' || key =='w') up = true; 
  else if (key == 'S' || key == 's') down = true;
  else if (key == 'J' || key  =='j') shot = true;
}
void keyReleased() {
  if (key == 'A' || key == 'a') left = false; 
  else if (key =='D' || key =='d') right = false; 
  else if (key =='W' || key =='w') up = false; 
  else if (key == 'S' || key == 's') down = false; 
  else if (key == 'J' || key == 'j') shot = false;
}

void mousePressed() {
  if (state == STARTSCREEN) {
    state=GAMEPLAY;
  }
  if (state != GAMEPLAY) {
    initializeGame();
  }
}

