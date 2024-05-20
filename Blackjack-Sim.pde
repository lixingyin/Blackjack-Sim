import g4p_controls.*;

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
PImage cardBack;
PImage Blackjack;


//Import images for player decisions (hit, stand, split, double)
boolean playerStand = false;
boolean determineWinner = false;

boolean cardClicked = false;
boolean incrementsClicked= false; 
boolean activeGame = false;
int round =1;
boolean playerBusted = false;
boolean playerDoubled = false;
boolean restart = false;

//Import images for how to play and the cheat sheet
PImage cheatSheat, howToPlay;
boolean cheatSheatClicked = false;
boolean howToPlayClicked = false;



float [] increments = {1,5,10, 25, 50, 100,1000};
int incrementIndex = 0;


Dealer bob = new Dealer();
Player nathan = new Player (1000);


void setup() {
  size(600, 600);
  imageLoader();
}

//Create background that looks like a card table
void draw () {
  
  if (round ==1){
  background(0, 150, 35);  //darker green
  
  rectMode(CORNERS);
  fill(0);
  noStroke();
  rect(0, 600, 600, 547);
  rect(0, 547, 100, 500);
  rect(600, 547, 500, 500);
  
  rectMode(CORNERS);
  fill(0, 150, 35);
  noStroke();
  rect(75, 510, 100, 490);
  rect(440, 510, 550, 490);

  
  noFill();
  strokeWeight(50);
  stroke(150,80,20);
  ellipse(300, 270, 800, height);
  
  rectMode(CENTER);
  fill(0, 150, 35);
  noStroke();
  rect(300, 100, 600, 300);
  
  noFill();
  strokeWeight(3);
  stroke(200,150, 35);
  rect(300,170,500,100);
  rect(300,350,500,100);
 
  fill(255);
  rect(125,440,150,40);
  rect(300,440,150,40);
  rect(475,440,150,40);
  rect(125,500,150,40);
  rect(300,500,150,40);
  rect(475,500,150,40);
  rect(125,560,150,40);
  rect(300,560,150,40);
  rect(475,560,150,40);  
  
  fill(0);
  textSize(16);
  text("Deal",110,445);
  text("Decrease Bet",250,445);
  text("Increase Bet",430,445);
  text("Split",110,505);
  text("Double",270,505);
  text("Rules",450,505);
  text("Hit",110,565);
  text("Stand",280,565);
  text("Help",450,565);

  image(Blackjack, 130, 20);
  
  }
  
  noStroke();
  fill(0, 150, 35);
  rect(300,260,600,50);
  rect(150,90,300,50);
  
  fill(0);
  textSize(28);
  text("Dealer: "+ bob.handValue, 50, 100); 
  text("Player: "+ bob.playerHandValue, 50, 280);

  if (playerDoubled ==true){
    text("Bet: $"+2*increments[incrementIndex], 220, 280);
  }
  else{
     text("Bet: $"+increments[incrementIndex], 220, 280);
  }
  text("$"+nathan.currentAmount, 400, 280);
  
  if (round >2 && cardClicked ==true && activeGame ==true){
     bob.displayNewCardPlayer(bob.randomCard(1));
     cardClicked = false;
     if (playerDoubled ==true){
       activeGame =false;
     }
  }
  
  else if (round >1 && cardClicked ==true && playerDoubled == false){
    bob.displayNewCardPlayer(bob.randomCard(1));
    bob.displayNewCardPlayer(bob.randomCard(1));
    bob.displayNewCardDealer(bob.randomCard(2));
    bob.displayNewCardBck();
    activeGame = true;
    cardClicked = false;
  }
  
  if (playerStand == true){
    if(bob.dealerRound==1){
      bob.dealerRound = 0;
      bob.displayNewCardDealer(bob.randomCard(2));
      bob.dealerRound =2;
     }
    else if (bob.dealerRound!=1 && bob.handValue <= 17){
      delay(500);
      bob.displayNewCardDealer(bob.randomCard(2));
      bob.dealerRound +=1;
      
    }
    else{
      playerStand = false;
      determineWinner = true;
    }
  }
  
  bob.checkOutcome(nathan);
  round+=1;
}



void mouseClicked(){
  if (cardClicked == false){
    if (mouseX >= 50 && mouseX <= 200 && mouseY >= 420 && mouseY <= 460 && activeGame ==false && playerBusted == false && nathan.currentAmount >0){  // Deal
      if(restart == true){
        round =1;
        bob.handValue = 0;
        bob.playerHandValue = 0;
        bob.playerRound= 1;
        bob.dealerRound =1;  
        if(playerDoubled == true){
        nathan.currentBet /=2;
        }
        playerDoubled = false;
        restart = false;
      }
    cardClicked = true;
    }
    else if (mouseX >= 50 && mouseX <= 200 && mouseY >= 540 && mouseY <= 580 && activeGame ==true){  // Hit
    cardClicked = true;
    }
    
    else if (mouseX >= 225 && mouseX <= 375 && mouseY >= 480 && mouseY <= 520 && activeGame ==true){  // Double
      cardClicked = true;
      playerStand = true;
      playerDoubled = true;
      nathan.currentBet *=2;
    }
      //rect(125,440,150,40);
      //rect(300,440,150,40);
      //rect(475,440,150,40);
      //rect(125,500,150,40);
      //rect(300,500,150,40);
      //rect(475,500,150,40);
      //rect(125,560,150,40);
      //rect(300,560,150,40);
      //rect(475,560,150,40);  
  }
  
  if (mouseX >= 400 && mouseX <= 550 && mouseY >= 420 && mouseY <= 460 && activeGame ==false && playerBusted == false && playerStand == false && incrementIndex+1 <increments.length ){  // Inc Increment
    incrementIndex +=1;
    nathan.currentBet = increments[incrementIndex];
    println(nathan.currentBet);
  }
  
  if (mouseX >= 225 && mouseX <= 375 && mouseY >= 420 && mouseY <= 460 && activeGame ==false && playerBusted == false && playerStand == false && incrementIndex >0 ){  // dec Increment
    incrementIndex -=1;
    nathan.currentBet = increments[incrementIndex];
    println(nathan.currentBet);
  }
  
  if (mouseX >= 225 && mouseX <= 375 && mouseY >= 540 && mouseY <= 580 && activeGame ==true){  // Stand
    activeGame = false;
    playerStand = true;
  } 
}
