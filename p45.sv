//constraint to generate double of other number
class test;
  rand bit [7:0]a,b;
  constraint c{a==2*b;}
  function void post_randomize();
    $display("a=%0d",a);
    $display("b=%0d",b);
  endfunction
endclass
module t;
  test t1;
  initial
    begin
      t1=new();
      repeat(5) t1.randomize();
    end
endmodule
