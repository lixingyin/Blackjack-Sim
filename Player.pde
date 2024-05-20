class Player{
  float currentAmount;
  float currentBet;

  Player(float ia){
    this.currentAmount = ia;
    this.currentBet = 1;
  }

void winner(){
  this.currentAmount +=currentBet;
  text("You Won!", 400,100);
  determineWinner = false;
  restart = true;
}

void losser(){
  this.currentAmount -=currentBet;
  text("You Lost!", 400,100);
  determineWinner = false;
  restart = true;
}

}
