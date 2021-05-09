class GameManager{
  
  //properites
  Player player;                                                     //player variable
  ArrayList<Goblin>goblins;                                            //list containing all the goblins
  ArrayList<Arrow> arrows;                                        //list containing all the arrows
  ArrayList<Bomb> bombs;                                            //list containing all the bombs                                
  boolean bang;                                                    //whether arrow hit goblins
  int arrowcount = 65;                                           //restricting # of arrows

  
  //constructor
  GameManager(){
    player = new Player();                                       //instantiating player object
    goblins = new ArrayList<Goblin>();                            //instantiating goblin object/ArrayList
    for (int a=0; a<5; a=a+1){                                  //5 goblins across
      for (int b=0; b<4; b=b+1) {                               //4 goblins down
        goblins.add(new Goblin(a*50+10,b*50+10));                 //add goblins so that there are 5 across and 4 down
      }
    }
    arrows = new ArrayList<Arrow>();                        //instantiating arrow object/ArrayList
    bombs = new ArrayList<Bomb>();                             //instantiating Bomb object/ArrayList

  }
  
  
  
  //abilities
  void update(){
    if(player.lives==0){                                             //display the losing screen when lives are zero
      outcome=2;
    }
    player.move();
    turnAround=false;                                               //starting by assuming goblins are not at the edge of the screen
    for(Goblin a:goblins){                                
      a.move();                                                     //move all goblins
      if (a.y>=800){                                                //if the goblins are below the player display the losing screen
       outcome=2;
      }
    }
    for(Goblin a:goblins){
      if (turnAround==true){                                       //if the goblins are on the edge of the screen...
        a.reverseSpeed();                                          //make them move in the opposite direction
      }
    }
    bang=false;                                                    //start by assuming arrow arent hitting goblins
    for(Arrow b: arrows){
      b.move();                                                   //move all the arrow
    }
    for(Arrow b: arrows){
      for (Goblin a:goblins){
        if (b.x>a.x && b.y>a.y && b.x<a.x+30 && b.y<a.y+30){      //if the arrow hits a goblin...
          goblinHit.play();                                       // plays the sound effect for when the goblin is hit
          arrows.remove(b);                                      //remove the arrow from the screen
          goblins.remove(a);                                       //remove the goblin from the screen
          player.score=player.score+1;                            //add 1 to the score
          bang=true;                                              
          if (goblins.size()==0){
            outcome = 3;                                          //display the winning screen if there are no goblin left
      }
          break;
        }
      }
    if (bang==true){
      break;  
  }
    if (b.y<0) {
      arrows.remove(b);                                          //remove arrow from existence once it is out of view
      break;
    }
    }
    if (frameCount%20==0){                                        //at every interval of 20 drop a bomb
    int bomb = (int) random(0,goblins.size()-1);                   //make bombs drop from random goblin
     bombs.add(new Bomb(goblins.get(bomb).x, goblins.get(bomb).y)); 
    }
    
    for (Bomb c: bombs){
      c.move();                                                                  //move the bombs
      if(c.x>player.x && c.y>player.y && c.x<player.x+50 && c.y<player.y+50){    //if the bombs hit the player...
        playerHit.play();                                                        // plays the sound effect for when the player is hit
        bombs.remove(c);                                                         //remove the bomb from the screen
        player.lives=player.lives-1;                                             //remove a life
        break;
      }
      if(c.y>height){
        bombs.remove(c);                                                         //remove bomb from existence if it is out of view
        break;
    }
     if (arrowcount<=0){                                                        //if player runs out of arrows display losing screen
       outcome = 2;
      }
    }
  }
  
  void render(){
    player.render();                                                            //put the player on the screen
    for(Goblin a:goblins){
      a.render();                                                               //put the goblin on the screen
    } 
    for (Arrow b: arrows){
      b.render();                                                               //put the arrows on the screen
    }
    for (Bomb c: bombs){
      c.render();                                                               //put the bombs on the screen
    }
    
    textSize(40);
    fill(255,255,255);
    text(arrowcount,425,40);
    text("arrows left:",200,40);                                               //shows how many arrow player has left
    text(player.lives,110,40);
    text("lives:",0,40);                                                        //shows how many lives player has left
    text(player.score,120,90);
    text("score:",0,90);                                                        //shows player's score
    
  }
  
  
  void action(){
    player.setSpeed();                                                         //move the player in the program
  

  }
  
  void actionI(){
    arrows.add(new Arrow(player.x+20,player.y+20));                         //add arrow (comming out of player) when mouse is clicked
      arrowcount=arrowcount-1;
  }
} 
