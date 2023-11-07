///randomization in such a way that only one bit should be high
class test;
  randc bit[7:0]num;
  function void post_randomize;
    $displayb(num);
  endfunction
  constraint c{$onehot(num);}
endclass
module top;
  test t;
  initial
    begin
      t=new;
      repeat(10)t.randomize;
    end
endmodule
