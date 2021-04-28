class Bomb{                           //bombs class
  
  //properties
  int x;                              //x-coordinate of my bombs
  int y;                              //y-coordinate of my bombs
  int speedy;                         //speed at which bombs will fall
  PImage c;                           //what the bombs will look like
  
  
  //constructor
  Bomb(int m, int n){                 //assinging values to variables
    x=m;
    y=n;
    speedy=4;
  }
  
  //abilities
  
  void move(){
  y=y+speedy;                         //move straight down
  }
  
  void render(){
    c=loadImage("fireball.png");          //make the bombs look like the image i chose
      image(c,x,y);
    
  }
    
 
}
