//Generate prime numbers from the given range using constraints
class test;
  rand bit[7:0]num;
  int max,min;
  function void post_randomize;
    $display(num);
  endfunction
  constraint c1{(num==2||num==3||num==7)||(num%10==1 || num%10==3 || num%10==7 || num%10==9)&&(num%3!=0 && num%7!=0 && num%9!=0 && num!=1);}
  constraint c2{
    num inside{[min:max]};
  }
 
endclass

module top;
  test t;
  initial
    begin
      t=new;
      t.min=0;
      t.max=100;
      repeat(10)
      t.randomize;
    end
endmodule
