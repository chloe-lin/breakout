void keyPressed() {
  if (keyCode == RIGHT) rkey = true;
  if (keyCode == LEFT) lkey = true; 
} //end of void keyPressed--------------------

void keyReleased() { 
  if (keyCode == RIGHT) rkey = false;
  if (keyCode == LEFT) lkey = false; 
} //end of void keyReleased--------------------
