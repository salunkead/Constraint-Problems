//only 4 bits should be low
class test;
  randc bit[7:0]num;
  function void post_randomize;
    $displayb(num);
  endfunction
  constraint c{$countbits(num,0)==4;}
endclass
module top;
  test t;
  initial
    begin
      t=new;
      repeat(10)t.randomize;
    end
endmodule
