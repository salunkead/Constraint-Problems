//write a constraint to generate power of two values without using 2**power (2 raise to power)

//Solution
class test;
  rand bit[7:0]a,power;
  function void post_randomize;
    $display(a,power);
  endfunction
  
  function bit[7:0] power2(bit[7:0]num);
    bit[7:0]r=1;
    repeat(num)
      begin
        r=r*2;
      end
    return r;
  endfunction
  
  constraint c1{
    power inside{[1:20]};
    a==power2(power);
  }
endclass

module top;
  test t;
  initial
    begin
      t=new;
      t.randomize;
    end
endmodule
