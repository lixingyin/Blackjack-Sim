class Dealer{
  int handValue;
  int playerRound;
  int dealerRound;
  int playerHandValue;
  
  Dealer(){
  this.handValue = 0;
  this.playerHandValue = 0;
  
  this.playerRound= 1;
  this.dealerRound =1;
  }


PImage randomCard(int h){
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
  if (h==1){
    this.playerHandValue += x;
  }
  else{
    this.handValue += x;
  }
  
  if (x ==1 && h == 1){
    rect(50,50,50,50);
  }
  
  return n;

}

void displayNewCardPlayer(PImage n){
  int xpos = (65*((this.playerRound)-1))+55;
  n.resize(60,84);
 image(n, xpos, 310);
 this.playerRound +=1;
} 

void displayNewCardDealer(PImage n){
  int xpos = (65*(this.dealerRound))+55;
  n.resize(60,84);
 image(n, xpos, 130);

} 

void displayNewCardBck(){
 cardBack.resize(60,84);
 image(cardBack, 55, 130);
} 



void checkOutcome(Player n){
  if (this.playerHandValue > 21 && activeGame == true){
    activeGame = false; 
    n.losser();
  }
  
  if (this.playerHandValue == 21 && activeGame == true){
    activeGame = false;
    n.winner();
  }
  
  if (determineWinner ==true){
    if (this.handValue > 21){
      n.winner();
    }
    
    else if (this.playerHandValue> this.handValue){
      n.winner();
    }
    else if (this.playerHandValue< this.handValue){
      n.losser();
    }
    else{
     text("Tie!",300,300);
    }
  }
}

}
