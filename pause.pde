void pause() {
  intro.pause();
  
  fill(white); 
  textFont(leavesandground);
  textSize(100);
  text("pause", width/2, height/2);
} //end of void pause---------------------

void pauseClicks() { 
  mode = GAME;
} //end of void pauseClicks------------------
