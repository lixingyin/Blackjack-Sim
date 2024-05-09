import g4p_controls.*;

//Import images for all 52 cards
PImage clubs_A, spades_A, hearts_A, diamonds_A;
PImage clubs_2, spades_2, hearts_2, diamonds_2;
PImage clubs_3, spades_3, hearts_3, diamnds_3;
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
PImage hit, stand, split, double;
boolean playerHit = false;
boolean playerStand = false;
boolean playerSplit = false;
boolean playerDouble = false;

//Import images for how to play and the cheat sheet
PImage cheatSheat, howToPlay;
boolean cheatSheatClicked = false;
boolean howToPlayClicked = false;

card[] cards;

void setup() {
  size(600, 600);
  createGUI();
}

//Create background that looks like a card table
void draw () {
  background(0, 150, 35);  //darker green
  fill(0);
  textSize(#)
