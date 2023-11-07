//problem-3 first element of array should be the depth of memory
class test;
  rand bit [7:0]arr[];
  function void post_randomize;
    $display("%p",arr);
  endfunction
  constraint c{arr.size==arr[0];}
endclass

module top;
  test t;
  initial
    begin
      t=new();
      repeat(10) void'(t.randomize);
    end
endmodule
