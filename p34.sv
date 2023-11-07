/////////////////////
///write a constraint such that elements 0 to 4 should be in ascending order and 5 to 9 should be in descending order 
class test;
  rand bit[7:0]a[10];
  function void post_randomize;
    $display("arr=%p",a);
  endfunction
  constraint c{
    foreach(a[i]){
      if(i<5){
        if(i>0)
          a[i-1]<a[i];
      }
        else{
          a[i-1]>a[i];
        }
    }
  }
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(1)
      t.randomize;
    end
endmodule
