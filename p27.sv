//constraint to generate unique random number between 1.35 to 2.57
class test;
  randc int a;
  real result;
  constraint c{a inside{[135:257]};}
  function void post_randomize;
    result=real'(a)/100.0;
    $display("result=%0f",result);
  endfunction
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(10)
        begin
          t.randomize;
        end
    end
endmodule
