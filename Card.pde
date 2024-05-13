class Card{
  int value;
  String code;
  String suit;
  String colour;
  String name;

  Card(int v, String s){
  this.value = v;
  this.suit = s;
   
    if(this.suit == "clubs" || this.suit == "spades"){
      this.colour = "black";
    }
    else{
      this.colour = "red";
    }
   
    if (this.value == 1){
      this.code ="A";
    }
    
    else if (this.value == 11){
      this.code ="J";
    }
    
    else if (this.value == 12){
      this.code ="Q";
    }
   
    else if (this.value == 13){
      this.code ="K";
    }
    
    else{
      this.code = str(this.value);
    }
     
  }
}
