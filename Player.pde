////////////////////////////////////////////////////////
//                 PLAYER CLASS                       //
////////////////////////////////////////////////////////

class Player{
  float currentAmount;  // Dollar value that the player has available for betting
  float currentBet;     // Dollar value that the player is betting during a game

  Player(float ia){
    this.currentAmount = ia;
    this.currentBet = 1;
  }

//************ VOID WINNER *******************
// * Add the currentBet value to the player's caurrentAmount
// * Set the determineWinner boolean to false in order to start a new game
// * Set the restart boolean to true if the player wishes to deal a new set of cards

void winner(){
  this.currentAmount +=currentBet;
  text("You Won!", 400,100);
  determineWinner = false;
  restart = true;
}


//************ VOID LOSSER *******************
// * Substracts the currentBet value of the player's caurrentAmount
// * Set the determineWinner boolean to false in order to start a new game
// * Set the restart boolean to true if the player wishes to deal a new set of cards

void losser(){
  this.currentAmount -=currentBet;
  text("You Lost!", 400,100);
  determineWinner = false;
  restart = true;
}

}
