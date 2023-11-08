//write constraint to generate this sequence 111000111000111000111000111000..
class test;
  rand bit num;
  bit c1;
  bit[1:0]c2;
  function void post_randomize;
    $write("%b",num);
    c2++;
    if(c2==3)
      begin
        c2=0;
        c1++;
      end
  endfunction
  constraint c{
    if(!c1)
      num==1;
    else
      num==0;
  }
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(30)t.randomize;
      $display();
    end
endmodule
