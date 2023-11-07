//Q.23 write constraint to generate random values for var1[7:0] within 50 and var2[7:0] with non-repeated value in every randomization
class test;
  rand bit[7:0]var1;
  randc bit[7:0]var2;
  function void post_randomize;
    $display("var1=%d var2=%d",var1,var2);
  endfunction
  constraint v{var1 inside{[0:50]};}
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(5) t.randomize;
    end
endmodule
