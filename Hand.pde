class Hand{
    ArrayList<Card> cards;
    int hand_val;
    int num_cards;
    Hand(ArrayList<Card> c, int hv, int nc){
      this.cards = c;
      this.hand_val = hv;
      this.num_cards = nc;
    }
    void addCard(){
      Card new_card = deck.removeCard();
      cards.add(new_card);
      this.num_cards+= 1;
    }
    boolean splitHand(){
       if (cards.get(0).val == cards.get(1).val){
          return true;
       }
       else{
         return false;
       }
    }
    int checkval(){
      int n = 0;
      for (int i = 0; i < cards.size(); i++){
        n += cards.get(i).val;
      }
      return n;
    }
    int checknumcards(){
      return cards.size();
    }
    
}
    
