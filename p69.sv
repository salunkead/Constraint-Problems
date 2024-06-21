////Q. write constraint to generate power of 2 values without using ** operator and rely on one variable.no other variable should be used

////Solution
class test;
  randc bit[15:0]num;
  function void post_randomize();
    $display("num=%0d",num);
  endfunction
  
  constraint c1{
    $countones(num)==1;
  }
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(20)
        begin
          t.randomize;
        end
    end
endmodule
