//constraint to generate 11223344
class test;
  rand int num;
  int i,j=1;
  function void post_randomize;
    $write("%0d",j);
    i++;
    if(i%2==0)
      j++;
  endfunction
  constraint c{num==j;}
endclass
module top;
  test t;
  initial
    begin
      t=new;
      repeat(20)t.randomize;
      $display;
    end
endmodule
