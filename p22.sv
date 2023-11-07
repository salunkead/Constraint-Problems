//Q.22 generate 8 bit random number with only one bit set(should not use $countones)
class test;
  rand int i;
  bit [7:0]ref1;
  function void set();
    ref1[i]=1;
    $displayb(ref1);
  endfunction
  constraint c{i inside{[0:7]};}
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(10)
        begin
          t.randomize;
          t.set;
          t.ref1[t.i]=0;
        end
    end
endmodule
