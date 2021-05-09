//space invaders

//initializing variables
GameManager game;                                      
import processing.sound.*;                                 //importing sound library


PImage startscreen;                                  //what the startscreen will look like                           
PImage gameover;                                     //what the game over will look like
PImage background;                                   //what the backdrop of the game will look like
PImage win;                                          //what winning screen will look like
int outcome = 0;                                     //to check what mode the game is in (start, play, win, or lose)
SoundFile music;                                     //instantiate music
SoundFile playerHit;
SoundFile goblinHit;

void setup(){
  size(1000,800);                                    //window
  game = new GameManager();                          //instantiating my gameManager object
  startscreen = loadImage("startscreen.jpg");        //storeing images into variables for different backgrounds
  gameover = loadImage("gameover.jpg");
  background = loadImage("backgound.png");
  win = loadImage("win.png");
  music = new SoundFile(this,"music.mp3");
  playerHit = new SoundFile(this,"playerHit.mp3");
  goblinHit = new SoundFile(this,"goblinHit.mp3");
  music.amp(.1);                                     // set music volume
  music.play();                                      // play music
  
}


void draw(){
  
  if (keyCode==ENTER && outcome!=3 && outcome!=2){    //once enter is presed start the game
    outcome=1;
  }
  if (outcome==0){                                    //making my start screen
    background(startscreen);
    fill(0,255,255);
    textSize(30);
    text("right and left keys to move",550,170);
    text("click to shoot",550,110);
    text("press 'enter' to start",550,50);
  }
  else if (outcome==1){                               //when enter is pressed start this game code
  background(background);
  game.update();
  game.render();
  }
  else if (outcome==2){                              //when the requirements to lose the game are met show the game over screen
    background(gameover);
    fill(255);
    textSize(90);
    fill(0);
    text("you lose!",400,500);
  }
  else if (outcome==3){                             //when the requirements to win the game are met show the winning screen
    background(win);
    textSize(90);
    fill(random(255),random(255),random(255));
    text("YOU WIN!",400,400);
  }
  
  
}

void keyPressed(){  
  game.action();                                    //moving the player with the arrow keys
}

void mousePressed(){
  game.actionI();                                   //shooting arrows with the click of a mouse
}
