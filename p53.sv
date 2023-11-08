//clock generation using constraint
class test;
  rand bit clk1;
  bit clk;
  function void pre_randomize;
    clk=clk1;
  endfunction
  function void post_randomize;
    clk=clk1;
    $display("clock=%b at t=%0t",clk,$time);
  endfunction
  constraint c{
    if(clk){
      clk1==0;
    }
      else{
        clk1==1;
      }
  }
endclass
module top;
  test t;
  bit clock;
  initial
    begin
      t=new();
      repeat(10)
        begin
          clock=t.clk1;
          #5;
          t.randomize;
        end
    end
  initial
    begin
      $dumpfile("clock.vcd");
      $dumpvars;
    end
endmodule
