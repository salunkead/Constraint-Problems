//Factorial of a random number
class test;
  randc int num;
  function void post_randomize;
    $display("num=%0d",num);
  endfunction
  function factorial(int n);
    int fact=1;
    for(int i=1;i<=n;i++)
      begin
        fact=fact*i;
      end
    $display("factorial of n=%0d is %0d",n,fact);
  endfunction
  constraint c1{
   num>0 && num<10;
  }
endclass
     
module top;
  test t;
  initial
    begin
      t=new;
      repeat(3)
        begin
          t.randomize;
          t.factorial(t.num);
        end
    end
endmodule
