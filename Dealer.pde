class Dealer{
  int handValue;
  int playerRound;
  int playerHandValue;
  
  Dealer(){
  this.handValue = 0;
  this.playerHandValue = 0;
  this.playerRound= 1;
  }


PImage randomCard(){
  String z;
  int x = int(random(1,14));
  int y = int(random(1,5));
  String l;
  
  if (x == 1){
    l ="A";
  }
    
  else if (x == 11){
    l ="J";
  }
    
  else if (x == 12){
    l ="Q";
  }
   
  else if (x == 13){
    l ="K";
  }
  
  else{
    l = str(x);
  }
  
  if (y==1){
    z = "clubs";
  }
  else if (y==2){
    z = "spades";
  }
  else if (y==3){
    z = "hearts";
  }
  else{
    z ="diamonds"; 
  }
  
  String outcome = (z+"_"+l);
  println (outcome);
  PImage n = loadImage(outcome+".png");
  this.playerHandValue += x;
  return n;

}

void displayNewCard(PImage n){
  int xpos = (65*((this.playerRound)-1))+55;
  n.resize(60,84);
 image(n, xpos, 310);
 this.playerRound +=1;

} 

}
