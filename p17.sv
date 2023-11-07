/*
Q.17 write single constraint to genrate random values for bit[8:0] variable in the below range -1-34,127,129-156,192-202,257-260
*/
class test;
  rand bit [8:0]a;
  constraint c{a inside{[1:34],127,[129:156],[192:202],[257:260]};}
  function void post_randomize;
    $display("a=%d",a);
  endfunction
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(20) void'(t.randomize);
    end
endmodule
