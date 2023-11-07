///implication operator
class test;
  rand bit[7:0]num;
  bit ctrl;
  function void post_randomize;
    $display("ctrl=%0b and num=%0d",ctrl,num);
  endfunction
  constraint c{ctrl-> num inside{[1:10]};
              !ctrl->num==20;}
endclass

module top;
  test t;
  initial
    begin
      t=new;
      t.ctrl=1;
      repeat(5)t.randomize;
      t.ctrl=0;
      t.randomize;
    end
endmodule
