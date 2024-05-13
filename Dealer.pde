class Dealer{
  int handValue;
  
  Dealer(){
  this.handValue = 0;
  }


void randomCard(){
  String z;
  int x = int(random(1,14));
  int y = int(random(1,5));
  println(y);
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
  
  println(z+"_"+str(x));
}

void displayNewCard(PImage n){
 image(n, 0, 0);
} 

}
