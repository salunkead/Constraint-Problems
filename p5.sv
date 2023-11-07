//Q.5 derive odd numbers within the range of 10 to 30 using sv constraint 

class test;
  randc bit[7:0]data;
  constraint c{data inside{[10:30]};}
  constraint c1{data%2!=0;}
  function void post_randomize;
    $display(data);
  endfunction
endclass
module top;
  test t;
  initial
    begin
      t=new;
      repeat(10)void'(t.randomize);
    end
endmodule
