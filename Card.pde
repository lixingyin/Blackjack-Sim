class Card{
  int value;
  String suit;
  String colour;

  Card(int v, String s){
  this.value = v;
  this.suit = s;
   
    if(this.suit == "spades" || this.suit == "clubs"){
      this.colour = "black";
    }
    else{
      this.colour = "red";
    }
  }
}
