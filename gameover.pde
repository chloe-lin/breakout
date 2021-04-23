void gameover() {
  intro.pause();
  sad.pause();
  
  background(0);
  stroke(yellow);
  textAlign(CENTER, CENTER);
  
  //GIF
  numberofFrames = 30;
  gif = new PImage[numberofFrames];
  
  int i = 0;
  while(i < numberofFrames) {
    gif[i] = loadImage("frame_"+i+"_delay-0.1s.gif");
    
    i=i+1;
  }
  image(gif[f], 0, 0, width, height);
  f = f + 1;
  if (f == numberofFrames) f = 0;
  
  if (score == 4000) {
  gameover.play();
  stroke(white);
  fill(white);
  textFont(strawberryblossom);
  text("you won!", width/2, height/2);
  textFont(leavesandground);
  text("click to restart", width/2, 500);
  } else {
  lost.play();
  stroke(white);
  fill(white);
  textFont(strawberryblossom);
  text("you lost!", width/2, height/2); 
  textFont(leavesandground);
  text("click to restart", width/2, 500);
  }
  
} //end of void gameover----------------------

void gameoverClicks() {
  mode = INTRO;
  
  score = 0;
  lives = 3;
  px = width/2;
  py = height; 
  pd = 100;
  ballx = width/2;
  bally = height/2+50;
  balld = 20;
  
  n = 40;
  x = new int[n]; //tells the arrays how many pages they should have
  y = new int[n];
  brickd = 30;
  tempx = 90;
  tempy = 90;
  alive = new boolean[n];
  
  int i = 0; 
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 70;
    if (tempx > width-50) {
      tempx = 90;
      tempy = tempy + 90;
    }
    i = i + 1; 
  }
  
  intro.rewind();
  gameover.pause();
  lost.pause();
 
} //end of gameoverClicks-------------------
