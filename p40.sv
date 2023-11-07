//write constraint to generate two x,two z and two 1
class test;
  logic [5:0]num;
  rand bit[2:0]index[6];
  function void post_randomize;
    foreach(index[i])
      begin
        if(i<2)
          num[index[i]]=1'bz;
        else if(i>=2&&i<4)
          num[index[i]]=1'bx;
        else
          num[index[i]]=1'b1;
      end
    $displayb(num);
  endfunction
  constraint c{unique{index};}
  constraint c1{
    foreach(index[i])index[i] inside{[0:5]};}
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(10)t.randomize;
    end
endmodule
