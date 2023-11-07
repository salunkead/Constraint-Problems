/*
Q.19 whats wrong with the below code? whats the correct process to write constraint?
class test;
rand bit[7:0]low,mid,high;
constraint c{low<mid<high;}
endclass
*/
class test;
  rand bit [7:0]low,mid,high;
  function void post_randomize;
    $display("low=%d mid=%d high=%d",low,mid,high);
  endfunction
  constraint LOW{low<mid && low<high;}
  constraint MID{mid>low && mid<high;}
  constraint HIGH{high>low && high>mid;}
endclass

module top;
  test t;
  initial
    begin
      t=new();
      repeat(10) void'(t.randomize);
    end
endmodule
