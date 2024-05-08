import g4p_controls.*;

//Import images for all 52 cards (C = Clubs, S = Spades, H = Hearts, D = Diamonds)
PImage ace_C, ace_S, ace_H, ace_D;
PImage 2_C, 2_S, 2_H, 2_D;
PImage 3_C, 3_S, 3_H, 3_D;
PImage 4_C, 4_S, 4_H, 4_D;
PImage 5_C, 5_S, 5_H, 5_D;
PImage 6_C, 6_S, 6_H, 6_D;
PImage 7_C, 7_S, 7_H, 7_D;
PImage 8_C, 8_S , 8_H, 8_D;
PImage 9_C, 9_S, 9_H, 9_D;
PImage 10_C, 10_S, 10_H, 10_D;
PImage jack_C, jack_S, jack_H, jack_D;
PImage queen_C, queen_S, queen_H, queen_D;
PImage king_C, king_S, king_H, king_D;

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
