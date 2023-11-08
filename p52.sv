//prime number constraint
class test;
  rand bit[7:0]num;
  bit [7:0]arr[$];
  function void pre_randomize;
    for(int i=2;i<2**$bits(num);i++)
      arr.push_back(i);
  endfunction
  function void post_randomize;
    $display(num);
    arr.delete;
  endfunction
  constraint c1{if(num==2)num==2;}
  constraint cons{
    foreach(arr[i])
    {
      if(arr[i]<num)
      {
        num%arr[i]!=0;
      }
    }
  }
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(10) t.randomize;
    end
endmodule
