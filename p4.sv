//problem-4 constraint divisible by 5
class test;
  rand bit [7:0]data;
  function void post_randomize;
    $display(data);
  endfunction
  constraint c{data%5==0;}
endclass
module top;
  test t;
  initial
    begin
      t=new;
      repeat(10) void'(t.randomize);
    end
endmodule
