//Generating unique elements in an array without using unique keyword
class test;
  rand bit[3:0]arr[10];
  function void post_randomize;
    $display("%p",arr);
  endfunction
  constraint c{
    foreach(arr[i])
    {
      foreach(arr[j])
      {
        if(i!=j)
          arr[i]!=arr[j];
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
