//problem-1 write contraint to genrate pattern 0102030405
class test;
  rand bit [7:0]data;
  int count,num;
  function void pre_randomize;
    if(count%2!=0)
      num=num+1;
  endfunction
  function void post_randomize;
    $write(data);
    count++;
  endfunction
  constraint c{
    if(count%2==0)
      data==0;
    else
      data==num;
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
