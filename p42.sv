//write constraint for 4 digit number such that the sum of the all the digits are 12
class test;
  rand int num;
  function void post_randomize;
    $display("num=%0d",num);
  endfunction
  constraint c{
    num%10+(num/10)%10+(num/100)%10+(num/1000)%10==12;
  }
  constraint c1{num inside{[1000:9999]};}
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(10)t.randomize;
    end
endmodule
