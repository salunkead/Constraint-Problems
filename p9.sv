/*Q.9 constraint to generate 0,1,x and z randomly*/
class test;
  typedef enum bit[1:0]{s0,s1,s2,s3}state_type;
  rand state_type state;
  logic a;
  function void post_randomize;
    case(state)
      s0:a=1;
      s1:a=0;
      s2:a=1'bx;
      s3:a=1'bz;
    endcase
    $display("a=%b",a);
  endfunction
endclass

module top;
  test t;
  initial
    begin
      t=new();
      repeat(20)t.randomize;
    end
endmodule
