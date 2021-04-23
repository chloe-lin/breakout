void intro() {
  intro.play();
  
  background(black);
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
  
  fill(deeppurple);
  strokeWeight(4);
  textSize(50);
  textFont(strawberryblossom);
  text("breakout!", width/2, height/2);
  fill(purple);
  textSize(30);
  textFont(leavesandground);
  text("click to play", width/2, 500);
  textSize(40);
  fill(yellow);
  text("get 4000 points to win", width/2, 600);
  text("but you only have three lives!", width/2, 630);
} //end of void intro-------------------

void introClicks() {
  mode = GAME;
} //end of void introClicks--------------------
