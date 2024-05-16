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


//Import images for player decisions (hit, stand, split, double)
PImage hit, stand, split, doubleDown;
boolean playerHit = false;
boolean playerStand = false;
boolean playerSplit = false;
boolean playerDouble = false;

//Import images for how to play and the cheat sheet
PImage cheatSheat, howToPlay;
boolean cheatSheatClicked = false;
boolean howToPlayClicked = false;

PImage Blackjack;

Dealer bob = new Dealer();

Card[] cards;

void setup() {
  size(600, 600);
 
  clubs_A = loadImage("clubs_A.png");
  clubs_2 = loadImage("clubs_2.png");
  clubs_3 = loadImage("clubs_3.png");
  clubs_4 = loadImage("clubs_4.png");
  clubs_5 = loadImage("clubs_5.png");
  clubs_6 = loadImage("clubs_6.png");
  clubs_7 = loadImage("clubs_7.png");
  clubs_8 = loadImage("clubs_8.png");
  clubs_9 = loadImage("clubs_9.png");
  clubs_10 = loadImage("clubs_10.png");
  clubs_J = loadImage("clubs_J.png");
  clubs_Q = loadImage("clubs_Q.png");
  clubs_K = loadImage("clubs_K.png");
 
  spades_A = loadImage("spades_A.png");
  spades_2 = loadImage("spades_2.png");
  spades_3 = loadImage("spades_3.png");
  spades_4 = loadImage("spades_4.png");
  spades_5 = loadImage("spades_5.png");
  spades_6 = loadImage("spades_6.png");
  spades_7 = loadImage("spades_7.png");
  spades_8 = loadImage("spades_8.png");  
  spades_9 = loadImage("spades_9.png");  
  spades_10 = loadImage("spades_10.png");  
  spades_J = loadImage("spades_J.png");  
  spades_Q = loadImage("spades_Q.png");
  spades_K = loadImage("spades_K.png");
 
  hearts_A = loadImage("hearts_A.png");
  hearts_2 = loadImage("hearts_2.png");
  hearts_3 = loadImage("hearts_3.png");
  hearts_4 = loadImage("hearts_4.png");
  hearts_5 = loadImage("hearts_5.png");
  hearts_6 = loadImage("hearts_6.png");
  hearts_7 = loadImage("hearts_7.png");
  hearts_8 = loadImage("hearts_8.png");
  hearts_9 = loadImage("hearts_9.png");
  hearts_10 = loadImage("hearts_10.png");  
  hearts_J = loadImage("hearts_J.png");
  hearts_Q = loadImage("hearts_Q.png");
  hearts_K = loadImage("hearts_K.png");

  diamonds_A = loadImage("diamonds_A.png");
  diamonds_2 = loadImage("diamonds_2.png");  
  diamonds_3 = loadImage("diamonds_3.png");  
  diamonds_4 = loadImage("diamonds_4.png");  
  diamonds_5 = loadImage("diamonds_5.png");  
  diamonds_6 = loadImage("diamonds_6.png");
  diamonds_7 = loadImage("diamonds_7.png");
  diamonds_8 = loadImage("diamonds_8.png");
  diamonds_9 = loadImage("diamonds_9.png");
  diamonds_10 = loadImage("diamonds_10.png");
  diamonds_J = loadImage("diamonds_J.png");
  diamonds_Q = loadImage("diamonds_Q.png");
  diamonds_K = loadImage("diamonds_K.png"); 
  
  Blackjack = loadImage("Blackjack.png"); 
}

//Create background that looks like a card table
void draw () {
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

  
  createGUI();
  noLoop();
  
  image(Blackjack, 130, 20);
  bob.displayNewCard(bob.randomCard());
  bob.displayNewCard(bob.randomCard());
  
  fill(0);
  textSize(28);
  text("Dealer: "+ bob.handValue, 50, 100); 
  text("Player: "+ bob.playerHandValue, 50, 280);
  text("$1, 000.00", 400, 280);
  
  
  //noLoop();
  
}

ArrayList<Card> newDeck(){
  ArrayList<Card> card_list = new ArrayList<Card>();
  String[] suits = {"Spade","Club","Heart", "Diamond"};
  for (int h = 0; h < 4; h++){
    
    for(int i = 1; i < 14; i++){
      if (i == 10){
       card_list.add(new Card(1, 11, "ace", suits[h]));
      }
      if (i == 10){
       card_list.add(new Card(10,0, "ten", suits[h]));
      }
      if (i == 11){
       card_list.add(new Card(10,0, "jack", suits[h]));
      }
      if (i == 12){
       card_list.add(new Card(10,0, "queen", suits[h]));
      }
      if (i == 13){
       card_list.add(new Card(10,0, "king", suits[h]));
      }
      else{
        card_list.add(new Card(i,0, str(i), suits[h]));
      }
    }
  }
  return card_list;
}

