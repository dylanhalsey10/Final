
class Bullet{                            //bullet class
  
  //Properties
  int x;                                //x-coordinate for my bullets
  int y;                                //y-coordinate for my bullets
  int speedy;                           //speed of bullet (straight up)
  PImage b;                             //bullet's look
  
  //Constructor
  Bullet(int n, int m){                 //assigning values to the variables
    x=n;
    y=m;
    speedy=8;
  }
  
  //abilities
   void move(){
     y=y-speedy;                        //making bullets move straight up
   }
   
   void render(){
     b= loadImage("arrow.png");        //making bullets look like the image i chose
       image(b,x,y);
   }
   

}
     
  

  
