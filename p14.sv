/*
Q.14 without inside operator generate random values for range 34-43
*/

class test;
  rand int a;
  function void post_randomize;
    $display(a);
  endfunction
  constraint c{a>=34 && a<=43;}
endclass
module top;
  test t;
  initial
    begin
      t=new;
      repeat (10) t.randomize;
    end
endmodule
