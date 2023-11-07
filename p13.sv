/*
Q.13 constraint for 0-100 range 70% and for 101-255 range 30%
*/

class test;
  rand int a;
  constraint prob{a dist {[0:100]:=70,[101:225]:=30};}
  function void post_randomize;
    $display("a=%0d",a);
  endfunction
endclass
module top;
  test t;
  initial
    begin
      t=new;
      repeat(10)
        t.randomize;
    end
endmodule
