//Q.21 there should be only 5 ones in data
class test;
  rand bit [7:0]data;
  function void post_randomize;
    $display("data=%b",data);
  endfunction
  constraint c{$countones(data)==5;}
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(5) t.randomize;
    end
endmodule
