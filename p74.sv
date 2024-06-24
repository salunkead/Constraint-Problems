//There is a 4x4 matrix and diagonal elements must be 20

//Solution
class test;
  rand bit[7:0]a[][];
  function void post_randomize;
    foreach(a[i])
      begin
        foreach(a[j])
          begin
            $write("%d\t",a[i][j]);
          end
        $display;
      end
  endfunction
  constraint c1{
    a.size==4;
    foreach(a[i])
    {
      a[i].size==4;
    }
  }
      constraint c2{
        foreach(a[i,j])
        {
          if(i==j)
            a[i][j]==20;
        }
          foreach(a[i])
          {
            a[i][3-i]==20;
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
