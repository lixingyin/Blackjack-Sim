////////////////////////////////////////////////////////
//                 DEALER CLASS                       //
////////////////////////////////////////////////////////

class Dealer{
  int handValue;        // The dealer's hand value
  int dealerRound;      // The dealer's turn #
  int playerHandValue;  // The player's hand value
  int playerRound;      // The player's turn #
  
  Dealer(){
    this.handValue = 0;
    this.dealerRound =1;
    this.playerHandValue = 0;
    this.playerRound= 1;
  }

////////////////////////////////////////////////////////
//             RANDOM CARD GENERATOR                  //
////////////////////////////////////////////////////////

PImage randomCard(int h){
  int x = int(random(1,14));   // Random card value generator 
  int y = int(random(1,5));    // Random card set generator 
  
  String l;  // Card value as a string for "A", "J", "Q" and "K"
  String z;  // Card set as a string
  
  
  //************ USE CARD VALUE AND TURN IT INTO A STRING THAT CAN BE USED TO CALL THE CORRESPONDING IMAGE *******************
  //* Redefine the hand value of "J", "Q" and "K"
  
  if (x == 1){
    l ="A";
  }
    
  else if (x == 11){
    l ="J";
    x = 10;
  }
    
  else if (x == 12){
    l ="Q";
    x = 10;
  }
   
  else if (x == 13){
    l ="K";
    x = 10;
  }
  
  else{
    l = str(x);
  }
  
  //************ ASSOCIATE THE NUMBER GENERATED TO A CARD SET THAT CAN BE USED TO CALL THE CORRESPONDING IMAGE *******************
  
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
  
  //************ USE THE STRING DATA TO CALL TO CREATE A PIMAGE THAT CORRESPONDS TO THE GIVEN CHARACTERISTICS *******************
  
  String outcome = (z+"_"+l);
  PImage n = loadImage(outcome+".png");
  
  //************ ADD THE CARD VALUE TO THE DEALER OR THE PLAYER DEPENDING ON THE INFORMATION INPUTED *******************
  
  if (h==1){
    this.playerHandValue += x;
  }
  else{
    this.handValue += x;
  }
  
  //************ ACTIVATE THE APROCEDURE BOOLEAN IF THE CARD DRAWN WAS AN "A" *******************
  
  if (x ==1 && h == 1){
    Aprocedure = true;
  }
  
  return n;
}


////////////////////////////////////////////////////////
//             DIAPLAY NEW CARD VOIDS                 //
////////////////////////////////////////////////////////
// * Resize the images to it in the screen
// * Move the x starting point to the right for each new card

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

// * Generate a card back for the dealer's first unkown card
void displayNewCardBck(){
 cardBack.resize(60,84);
 image(cardBack, 55, 130);
} 


////////////////////////////////////////////////////////
//                VOID CHECK OUTCOME                  //
////////////////////////////////////////////////////////

void checkOutcome(Player n){
  
  // Call a bust if the player's hand value goes over 21
  if (this.playerHandValue > 21 && activeGame == true){
    activeGame = false; 
    n.losser();
  }
  
  // Call blackjack if the player's hand value is exactly 21
  if (this.playerHandValue == 21 && activeGame == true){
    activeGame = false;
    n.winner();
  }
  
  // Compare the player's and dealer's hands to determine winner
  if (determineWinner ==true){
    
    // Reacheck for bust
    if (this.handValue > 21){
      n.winner();
    }
  
    // The player's hand is better than the dealer's hand
    else if (this.playerHandValue> this.handValue){
      n.winner();
    }
    
    // The dealer's hand is better than the player's hand
    else if (this.playerHandValue< this.handValue){
      n.losser();
    }
    
    // if both hands are the same no one wins and a new game can be started
    else{
     text("Tie!", 400,100);
      determineWinner = false;
      restart = true;
    }
  }
}

}
