/*Q.7 write a constraint for two random variables such that one variable should not match with other and total bits toggled in variable should be 5 with respect to other 
*/
class test;
  rand bit [7:0]a,b;
  rand bit [7:0]ref1;
  function void post_randomize;
    $display("a=%b b=%b",a,b);
  endfunction
  constraint r{$countones(ref1)==5;}
  constraint result{b==(a^ref1);}
endclass
module top;
  test t;
  initial
    begin
      t=new;
      repeat(5) void'(t.randomize);
    end
endmodule
