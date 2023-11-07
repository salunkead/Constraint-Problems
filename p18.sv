/*
Q.18 generate unique random values without using unique constraint 
*/

class test;
  rand bit[4:0]data;
  int q[$];
  function void post_randomize;
    $display("data=%d",data);
    q.push_back(data);
  endfunction
  constraint c{
    foreach(q[i])
    {
      data!=q[i];
    }
  }
endclass

module top;
  test t;
  initial
    begin
      t=new();
      repeat(20)
        begin
          void'(t.randomize);
        end
    end
endmodule
