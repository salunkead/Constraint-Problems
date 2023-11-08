//Card Game- Randomly picking single card from the pack of 52 playing card
class card_game;
  int card[4][13];
  int cardno;
  rand int suit,card1;
  typedef enum {diamond,spade,heart,club}suit_type;
  typedef enum {A=1,J=11,Q=12,K=13}face_card_type;
  suit_type s;
  face_card_type f;
  function void addCard();
    for(int i=0;i<4;i++)
      begin
        for(int j=0;j<13;j++)
          begin
            card[i][j]=j+1;
          end
      end
  endfunction
  constraint take{suit inside{[0:3]};
                  card1 inside{[0:12]};
                 }
  function void take1Card();
    cardno=card[suit][card1];
    $display("cardno=%0d",cardno);
    $cast(s,suit);
    $display("Suit :: %s",s.name());
    if(cardno==1 || cardno==11 || cardno==12 || cardno==13)
      begin
        $cast(f,cardno);
        $display("card :: %s",f.name());
      end
    else
      $display("card :: %0d",cardno);
  endfunction
endclass

module test;
  card_game c[5];
  int i;
  initial
    begin
      repeat(5)
        begin
          c[i]=new();
          c[i].addCard();
          c[i].randomize();
          c[i].take1Card();
          $display(c[i].suit,c[i].cardno);
          i++;
        end
    end
endmodule
