//Q. generate unique array elements without using unique keyword
class test;
  rand bit[3:0]a[4];
  
  function void post_randomize;
    $display("%p",a);
  endfunction
  
  constraint c1{
    foreach(a[i]){
      foreach(a[j]){
        if(i!=j){
          a[i]!=a[j];
        }
      }
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
