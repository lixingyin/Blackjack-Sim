////////////////////////////////////////////////////////
//  BLACKJACK SIMULATOR                               //
//  * MATEO GONZALEZ                                  //
//  * NATHAN EDWARDS                                  //
//  * LI XING YIN                                     //
//                                                    //
//  ICS4U 01 - Jason Schattman                        //
//  MAY 2024                                          //
////////////////////////////////////////////////////////


////////////////////////////////////////////////////////
//                      IMAGES                        //
////////////////////////////////////////////////////////

//Import images for all 52 cards
PImage clubs_A, spades_A, hearts_A, diamonds_A;
PImage clubs_2, spades_2, hearts_2, diamonds_2;
PImage clubs_3, spades_3, hearts_3, diamonds_3;
PImage clubs_4, spades_4, hearts_4, diamonds_4;
PImage clubs_5, spades_5, hearts_5, diamonds_5;
PImage clubs_6, spades_6, hearts_6, diamonds_6;
PImage clubs_7, spades_7, hearts_7, diamonds_7;
PImage clubs_8, spades_8 , hearts_8, diamonds_8;
PImage clubs_9, spades_9, hearts_9, diamonds_9;
PImage clubs_10, spades_10, hearts_10, diamonds_10;
PImage clubs_J, spades_J, hearts_J, diamonds_J;
PImage clubs_Q, spades_Q, hearts_Q, diamonds_Q;
PImage clubs_K, spades_K, hearts_K, diamonds_K;

//Import Additional Images
PImage cardBack;
PImage Blackjack;
PImage rules, cheatSheet;


////////////////////////////////////////////////////////
//                    BOOLEANS                        //
////////////////////////////////////////////////////////

// Booleans that define the Player's Status
boolean playerStand = false;
boolean playerBusted = false;
boolean playerDoubled = false;
boolean cardClicked = false;
boolean incrementsClicked= false; 

// Booleans that define the Game's Status
boolean activeGame = false;
boolean restart = false;
boolean determineWinner = false;
boolean Aprocedure = false;

// Booleans that define the Screen's Status
boolean rulesScreen = true;
boolean cheatSheetScreen = false;


////////////////////////////////////////////////////////
//             OTHER GENERAL VARIABLES                //
////////////////////////////////////////////////////////

float [] increments = {1,5,10, 25, 50, 100, 1000};  // Available Increments
int incrementIndex = 0;  // Initial Increment set at $1.00
int round =1;  // Counter used to restart game


////////////////////////////////////////////////////////
//           CREATE DEALER AND PLAYER                 //
////////////////////////////////////////////////////////

Dealer bob = new Dealer();
Player nathan = new Player (1000);


////////////////////////////////////////////////////////
//                 VOID SETUP                         //
////////////////////////////////////////////////////////

void setup() {
  // Create Screen and upload all images
  size(1500, 600);
  imageLoader();
}

////////////////////////////////////////////////////////
//                 VOID DRAW                          //
////////////////////////////////////////////////////////

void draw () {
  //************ GENERATE NEW GAME *******************
  if (round ==1){
    background(0, 150, 35);  // Dark green background
    
    rectMode(CORNERS);
    noStroke();
    
    // Black background
    fill(0);
    rect(0, 600, 600, 547);
    rect(0, 547, 100, 500);
    rect(600, 547, 500, 500);

    // Brown background
    noFill();
    strokeWeight(50);
    stroke(150,80,20);
    ellipse(300, 270, 800, height);
    
    // Green background to cover extra elipse
    rectMode(CENTER);
    fill(0, 150, 35);
    noStroke();
    rect(300, 100, 600, 300);
    
    // Gold dealer and player boards
    noFill();
    strokeWeight(3);
    stroke(200,150, 35);
    rect(300,170,500,100);
    rect(300,350,500,100);
  
    // Game Title
    image(Blackjack, 130, 20);
  }
  
  //************ UPDATE SCREEN *******************
  // Update Rules and Cheat Sheet Screens
  displayScreens();
  
  // Green background to update game info
  noStroke();
  fill(0, 150, 35);
  rect(300,260,600,50);
  rect(150,90,300,50);
  
  // Generate game info
  fill(0);
  textSize(28);
  text("Dealer: "+ bob.handValue, 50, 100); 
  text("Player: "+ bob.playerHandValue, 50, 280);

  // Display current beting amount and avaliable funds
  if (playerDoubled ==true){
    text("Bet: $"+2*increments[incrementIndex], 220, 280);
  }
  else{
     text("Bet: $"+increments[incrementIndex], 220, 280);
  }
  text("$"+nathan.currentAmount, 400, 280);
  
  
  //************ EVALUATE CURRENT GAME AND PLAYER CONDITIONS *******************
  
  // Procedure when the game starts
  // * Generate cards for the player and dealer
  // * Set the game status to active
  
  if (cardClicked ==true && playerDoubled == false){
    bob.displayNewCardPlayer(bob.randomCard(1));
    bob.displayNewCardPlayer(bob.randomCard(1));
    bob.displayNewCardDealer(bob.randomCard(2));
    bob.displayNewCardBck();
    activeGame = true;
    cardClicked = false;
  }
  
  // Procedure when the player hits
  // * Generate a new card for player
  // * Set the game status as inactive if the player doubled
  
  else if (cardClicked ==true && activeGame ==true){
     bob.displayNewCardPlayer(bob.randomCard(1));
     cardClicked = false;
     if (playerDoubled ==true){
       activeGame =false;
     }
  }
  
  // Procedure when the player Stands
  
  if (playerStand == true){
    // * Reveal dealer's first card 
    if(bob.dealerRound==1){
      bob.dealerRound = 0;
      bob.displayNewCardDealer(bob.randomCard(2));
      bob.dealerRound =2; // Updates new card position
     }
    
    // * Deal cards to dealer's hand until it goes over 17 or the dealer is busted 
    else if (bob.dealerRound!=1 && bob.handValue <= 17){
      delay(500);
      bob.displayNewCardDealer(bob.randomCard(2));
      bob.dealerRound +=1; 
    }
    
    // * Reset the playerStand status and activate the determineWinner boolean
    else{
      playerStand = false;
      determineWinner = true;
    }
  }
  
  // Dealer evaluates the game conditions and checks if there's a winner by this point
  bob.checkOutcome(nathan);
  
  // Draws the buttons according to the game conditions
  displayButtons();
  
  // Increases rthe round counter by one
  round+=1;
}
