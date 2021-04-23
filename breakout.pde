int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//entity variables (paddle and ball)
float px, py, pd; //paddles
float ballx, bally, balld; //ball
float vx, vy;

//keyboard variables 
boolean rkey, lkey; 

//arrays and brick variables
int[] x;    //array or book of x coordinates
int[] y;    //array or book of y coordinates
boolean[] alive;
int n;      //how many 'pages' are in my book
int brickd; //diameter of all bricks 
int tempx, tempy; 


//scoring
int score;
int timer; 

//lives 
int lives; 

//colours
color deeppurple = #442A80;
color purple = #961B8E;
color pink = #CF3276; 
color red = #AC4C50;
color orange = #EB6854;
color yellow = #F9D423;
color darkblue = #15305D;
color teal = #60B2A4;
color white = #FFFFFD;
color black = #000000;
color cream = #ECDBBC;
color brown = #40230C;

//image variables
PImage sky; 

//GIF
PImage[] gif;
int numberofFrames;
int f;

//font
PFont leavesandground;
PFont strawberryblossom;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//sound variables 
Minim minim; 
AudioPlayer intro, pong, sad, gameover, lost; 

void setup() {
  size(800, 800); 
  mode = INTRO;
  
  textAlign(CENTER, CENTER);
  
  //initialize paddles
  px = width/2;
  py = height; 
  pd = 100;
  
  //initialize ball 
  ballx = width/2;
  bally = height/2+50;
  balld = 20;
  
  //initialize keyboard variables 
  rkey = lkey = false;
  
  //initialize target
  vx = random(-5, 5);
  vy = random(-5, 5);
  
  //brick array setup 
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
  
  //initialize score 
  score = 0;
  timer = 100;
  
  //initialize lives
  lives = 3; 
  
  //image 
  sky = loadImage("sky.png");
  
  //fonts 
  leavesandground = createFont("leaves_and_ground.ttf", 100);
  strawberryblossom = createFont("Strawberry Blossom.ttf", 100);
  
  //minim
  minim = new Minim(this);
  intro = minim.loadFile("intro.mp3");
  pong = minim.loadFile("pong.mp3");
  sad = minim.loadFile("sad.mp3");
  gameover = minim.loadFile("gameover.mp3");
  lost = minim.loadFile("lost.mp3");
  
} //end of void setup---------------------

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
  
} //end of void draw-----------------------
