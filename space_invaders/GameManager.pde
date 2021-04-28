class GameManager{
  
  //properites
  Player player;                                                     //player variable
  ArrayList<Alien>aliens;                                            //list containing all the aliens
  ArrayList<Bullet> bullets;                                        //list containing all the bullets
  ArrayList<Bomb> bombs;                                            //list containing all the bombs
  //int gameMode;                                 
  //boolean live;                                  
  boolean bang;                                                    //whether bullets hit aliens
  //int bbb = 0;
  int bulletcount = 65;                                           //restricting # of bullets
  //boolean h=false;                                
  
  //constructor
  GameManager(){
    player = new Player();                                       //instantiating player object
    aliens = new ArrayList<Alien>();                            //instantiating Alien object/ArrayList
    for (int a=0; a<5; a=a+1){                                  //5 aliens across
      for (int b=0; b<4; b=b+1) {                               //4 aliens down
        aliens.add(new Alien(a*50+10,b*50+10));                 //add aliens so that there are 5 across and 4 down
      }
    }
    bullets = new ArrayList<Bullet>();                        //instantiating Bullet object/ArrayList
    bombs = new ArrayList<Bomb>();                             //instantiating Bomb object/ArrayList

  }
  
  
  
  //abilities
  void update(){
    if(player.lives==0){                                             //display the losing screen when lives are zero
      outcome=2;
    }
    player.move();
    turnAround=false;                                               //starting by assuming aliens are not at the edge of the screen
    for(Alien a:aliens){                                
      a.move();                                                     //move all aliens
      if (a.y>=800){                                                //if the aliens are below the player display the losing screen
       outcome=2;
      }
    }
    for(Alien a:aliens){
      if (turnAround==true){                                       //if the aliens are on the edge of the screen...
        a.reverseSpeed();                                          //make them move in the opposite direction
      }
    }
    bang=false;                                                    //start by assuming bullets arent hitting aliens
    for(Bullet b: bullets){
      b.move();                                                   //move all the bullets
    }
    for(Bullet b: bullets){
      for (Alien a: aliens){
        if (b.x>a.x && b.y>a.y && b.x<a.x+30 && b.y<a.y+30){      //if the bullet hits an alien...
          bullets.remove(b);                                      //remove the bullet from the screen
          aliens.remove(a);                                       //remove the alien from the screen
          player.score=player.score+1;                            //add 1 to the score
          bang=true;                                              
          if (aliens.size()==0){
            outcome = 3;                                          //display the winning screen if there are no aliens left
      }
          break;
        }
      }
    if (bang==true){
      break;  
  }
    if (b.y<0) {
      bullets.remove(b);                                          //remove bullet from existence once it is out of view
      break;
    }
    }
    if (frameCount%20==0){                                        //at every interval of 20 drop a bomb
    int bomb = (int) random(0,aliens.size()-1);                   //make bombs drop from random alien
     bombs.add(new Bomb(aliens.get(bomb).x, aliens.get(bomb).y)); 
    }
    
    for (Bomb c: bombs){
      c.move();                                                                  //move the bombs
      if(c.x>player.x && c.y>player.y && c.x<player.x+50 && c.y<player.y+50){    //if the bombs hit the player...
        bombs.remove(c);                                                         //remove the bomb from the screen
        player.lives=player.lives-1;                                             //remove a life
        break;
      }
      if(c.y>height){
        bombs.remove(c);                                                         //remove bomb from existence if it is out of view
        break;
    }
     if (bulletcount<=0){                                                        //if player runs out of bullets display losing screen
       outcome = 2;
      }
    }
  }
  
  void render(){
    player.render();                                                            //put the player on the screen
    for(Alien a:aliens){
      a.render();                                                               //put the aliens on the screen
    } 
    for (Bullet b: bullets){
      b.render();                                                               //put the bullets on the screen
    }
    for (Bomb c: bombs){
      c.render();                                                               //put the bombs on the screen
    }
    
    textSize(40);
    fill(255,255,255);
    text(bulletcount,425,40);
    text("bullets left:",200,40);                                               //shows how many bullets player has left
    text(player.lives,110,40);
    text("lives:",0,40);                                                        //shows how many lives player has left
    text(player.score,120,90);
    text("score:",0,90);                                                        //shows player's score
    
  }
  
  
  void action(){
    player.setSpeed();                                                         //move the player in the program
  

  }
  
  void actionI(){
    bullets.add(new Bullet(player.x+20,player.y+20));                         //add bullets (comming out of player) when mouse is clicked
      bulletcount=bulletcount-1;
  }
} 
