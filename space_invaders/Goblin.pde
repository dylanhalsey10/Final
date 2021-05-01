boolean turnAround;                //boolean for when to turn around
class Goblin{                       //goblin class
  
  //properties
  int x;                                  //x-coordinate for goblin
  int y;                                  //y-coordinate for goblin
  PImage a;                               //image (what goblins are going to look like)
  int speedx;                             //speed at which goblin move  (straight across)                                    
  int w;
  int h;

  
  //constructor
  Goblin(int r, int f){                        //assinging values to the variables
    x=r;
    y=f;
    speedx=9;
  }
  
  //abilities
  
  void move(){
    x=x+speedx;        
    if (x+w>=width || x-w<=0){              //if the goblins are at either end of the screen then they must trun around
      turnAround=true;
    }
  }
  
  void reverseSpeed(){
   if (turnAround==true){                   //if goblins are at the end of the screen
     speedx=-speedx;                        //make them move the opposite way
     y=y+50;                                //move them down by 50 pixels
   }
  }
  void render(){
    a= loadImage("goblin.png");             //making goblin look like a picture i chose
    image(a,x,y);

    
    
  }
  
  void setSpeed(){
  

    
  }
  
}
