
class Arrow{                            //arrow class
  
  //Properties
  int x;                                //x-coordinate for arrow
  int y;                                //y-coordinate for arrow
  int speedy;                           //speed of arrow (straight up)
  PImage b;                             //arrow's look
  
  //Constructor
  Arrow(int n, int m){                 //assigning values to the variables
    x=n;
    y=m;
    speedy=8;
  }
  
  //abilities
   void move(){
     y=y-speedy;                        //making arrows move straight up
   }
   
   void render(){
     b= loadImage("arrow.png");        //making arrows look like the image i chose
       image(b,x,y);
   }
   

}
     
  

  
