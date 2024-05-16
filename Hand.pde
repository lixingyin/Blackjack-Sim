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
      int n_ace = 0;
      for (int i = 0; i < cards.size(); i++){
        if (cards.get(i).number == "ace"){
          n_ace += 1;
        }
        else{
          n += cards.get(i).val1;
        }
      }
      if (n_ace > 0){
        int close_21 = 0;
        for (int a=0; a< n_ace+1 ; a++){
            if ((n + 1 * a + 11 * (n_ace-a)<=21) && (n + 1 * a + 11 * (n_ace-a)>close_21)){
              close_21 = n + 1 * a + 11 * (n_ace-a);
            }
        }
        if (close_21 == 0){
          return 22;
        }
        else{
          return close_21;
        }
      }
      else{
        if (n > 21){
          return 22;
        }
        else{
          return n;
        }
      }
    }
    int checknumcards(){
      return cards.size();
    }
    
}
    
