///4 by 4 matrix, sum of each column should be 30

//Solution
class test;
  rand bit[7:0]a[4][4];
  function void post_randomize;
    for(int i=0;i<4;i++)
      begin
        for(int j=0;j<4;j++)
          begin
            $write("\t%0d",a[i][j]);
          end
        $display;
      end
  endfunction
  
  constraint c1{
    foreach(a[i])
      a.sum() with (int'(a[item.index][i]))==30;
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
