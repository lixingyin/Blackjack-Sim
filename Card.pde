class Card{
  int value;
  String suit;
  String color;

  Card(int v, String s){
  this.value = v;
  this.suit = s;
   
    if(this.suit == "spades" || this.suit == "clubs"){
      this.color = "black";
    }
    else(){
      this.color = "red";
    }
  }
}


  