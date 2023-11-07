//Q.25 generate valid phone number using constraint
class test;
  rand bit[3:0]phone[];
  longint num;
  function void post_randomize;
    for(int i=9;i>=0;i--)
      begin
        num=num+(10**i)*phone[i];
      end
    $display(num);
    num=0;
  endfunction
  constraint c{
    foreach(phone[i])
    {
      if(i==9)
      {
        phone[i]==9;
      }
        else{
          phone[i] inside{[0:9]};
        }
    }
  }
      constraint siz{phone.size==10;}
      
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(10) t.randomize;
    end
endmodule
