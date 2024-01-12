//write a constraint such that the sum of the digits of a three digit number should be 9

class test;
  randc int num;
  function void post_randomize;
    $display("num=%0d",num);
  endfunction
  constraint c1{num%10+(num/10)%10+(num/100)%10==9;}
  constraint c2{num>100 && num<999;}
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(10)t.randomize;
    end
endmodule
