/*Q.11 there are two constraint applied to same variable.one will generate values bewteen [25:50] and another expression should be greater than 40.what should be the value generated and what is the generated.
*/

class test;
  rand bit[7:0]a;
  function void post_randomize;
    $display(a);
  endfunction
  
  constraint c{a inside {[25:50]};}
  constraint c1{a>40;}
endclass

module top;
  test t;
  initial
    begin
      t=new();
      repeat(10) t.randomize;
    end
endmodule
