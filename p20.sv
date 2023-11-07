/*
Q.20 write constraint for 16 bit variable such that no two consecutive ones should be generated
*/

class test;
  rand bit [15:0]num;
  function void post_randomize;
    $display("num=%b",num);
  endfunction
  constraint c{
    foreach(num[i])
    {
      if(i>0)
      {
        if(num[i])
          num[i-1]!=1;
      }
    }
  }
endclass
module top;
  test t;
  initial
    begin
      t=new();
      repeat(10) t.randomize;
    end
endmodule
