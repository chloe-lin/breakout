void game() {
  intro.play();
  
  background(sky);
  
  fill(0);
  textAlign(CENTER, CENTER);
  
  //bricks
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
    manageBrick(i);
    }
    i = i + 1;
  }

  //scoreboard
  stroke(black);
  textSize(40);
  fill(white);
  text("score: " + score, width/2, 20);
  timer = timer - 1;
  
  //draw lives 
  textFont(leavesandground);
  fill(white);
  textSize(40);
  text("lives: " + lives, width/2, 55);
  
  //ball
  stroke(teal);
  fill(teal);
  circle(ballx, bally, balld);
  
  //draw paddles
  stroke(black);
  fill(darkblue);
  circle(px, py, pd);
  
  //move paddles 
  if (lkey == true) px = px - 5;
  if (rkey == true) px = px + 5;
  
  //paddle stay on screen 
  if (px < 0+pd/2)
  {
   px = pd/2;
  }

  if (px > height-pd/2)
  {
   px = height-pd/2;
  }
  
  //bounce ball 
  if (timer < 0) {
  ballx = ballx + vx; 
  bally = bally + vy;
  }
  
  //ball stay on screen 
  if (bally < 0+balld/2)
  {
   bally = balld/2;
   ballx = ballx + vx; 
   bally = bally + vy;
  } 
  
   if (bally > width-balld/2)
  {
    bally = width-balld/2;
    ballx = ballx + vx; 
    bally = bally + vy;
  }
  
  if (ballx <0+balld/2) 
  {
    ballx = balld/2;
    ballx = ballx + vx; 
    bally = bally + vy;
  }
  
  //scoring
  if (score == 4000) {
    mode = GAMEOVER;
  }
 
  //lives   
  if (bally >= height-balld/2) 
  {
    lives = lives - 1;
    sad.rewind();
    sad.play();
    ballx = width/2;
    bally = height/2;
    timer = 100;
  }
 
  if (lives == 0) 
  {
    mode = GAMEOVER;
  }
 
  //bouncing ball on walls 
  if (bally < 0+balld/2 || bally > height-balld/2) {
    vy = vy * -1; 
  } 
 
  if (ballx < 0+balld/2 || ballx > height-balld/2) {
    vx = vx * -1; 
  } 
  
  //circle collisions 
  if (dist(ballx, bally, px, py) <= (balld/2 + pd/2)) {
    vx = (ballx-px)/10;
    vy = (bally-py)/10;
    pong.rewind();
    pong.play();
  } 
  
  } //end of void game-------------------------
 
void gameClicks() {
  mode = PAUSE;
} //end of void gameClicks-----------------------

void manageBrick (int i) {
    if (y[i] == 90) {
      stroke(pink);
      fill(pink); 
    }
    if (y[i] == 180) {
      stroke(red);
      fill(red);
    }
    if (y[i] == 270) {
      stroke(orange);
      fill(orange); 
    }
    if (y[i] == 360) {
      stroke(yellow);
      fill(yellow); 
    }
    circle(x[i], y[i], brickd);
    //collision code
    if (dist(ballx, bally, x[i], y[i]) <= (balld/2 + brickd/2)) {
      vx = (ballx-x[i])/10;
      vy = (bally-y[i])/10;
      alive[i] = false;
      score = score + 100;
      pong.rewind();
      pong.play();
  }
} //end of void manageBrick--------------------
