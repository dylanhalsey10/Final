class Player{                           //player class
  
  //properties
  int x;                                //x-coordinate for my player
  int y;                                //y-coordinate for my player
  int speed;                            //speed of player
  PImage b;                             //what player will look like
  int score;                            
  int lives;

  //constructor
  Player(){                                  //assigning values to variables
    x=width/2;                               //setting player in the middle of the screen (across)
    y=height-50;                             //setting player at bottom of the screen
    speed=1;
    score=0;
    lives=3;
  }
  
  
  //abilities
  void move(){
    x=x+2*(speed);
    if (x+50>=width || x<=0){            //checking whether it is at the edge of screen
      speed=0;                           //if it is stop moving
    }
    
  }
  
  void render(){
    b=loadImage("archer.png");          //making player look like image i chose
    image(b,x,y);
  }
  
  void setSpeed(){
    if (keyCode==LEFT){                 //move the player to the left when the left key is pressed
     speed=-3; 
    }
    if (keyCode==RIGHT){                //move the player to the right when the right key is pressed
     speed=3; 
    }
    if (keyCode==DOWN){                //make the player stop moving when the down key is pressed
     speed=0; 
    }

    
  }
  
}
