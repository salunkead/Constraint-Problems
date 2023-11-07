/*Q.12 constraint the array size of 5 to 10 and the array values should be in ascending order
*/

class test;
  rand bit[7:0] a[];
  function void post_randomize;
    $display("a=%p",a);
  endfunction
  constraint size{a.size inside{[5:10]};}
  constraint order{
    foreach(a[i])
    {
      if(i>0)
        a[i]>a[i-1];
    }
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
