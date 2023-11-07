///generate a clock with 75% duty cycle and divide by 2
class x;
  rand bit clk;
  bit [1:0]i;
  function void post_randomize;
    $display("i=%0d  and clk=%b at t=%0t",i,clk,$time);
  endfunction
  constraint cons{
    if(i<=2)
      clk==1;
    else
      clk==0;
  } 
endclass

module test;
  bit clk;
  bit clk_ref;
  always #5 clk_ref=~clk_ref;
  x x1;
  initial
    begin
       x1=new();
      repeat(50)
        begin
          @(edge clk_ref);
          x1.randomize;
          x1.i++;
          clk=x1.clk;
        end
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #200 $finish;
    end
endmodule
