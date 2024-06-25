//There is 4x4 matrix and each element inside this matrix is of 4 bit,write a constraint to generate unique element in the matrix without using unique keyword

//Solution
class test;
  rand bit[3:0]arr[4][4];
  function void post_randomize;
    foreach(arr[i])
      begin
        foreach(arr[j])
          begin
            $write("%d\t",arr[i][j]);
          end
        $display;
      end
  endfunction
  
  constraint c1{
    foreach(arr[i,j])
    {
      foreach(arr[ii,jj])
      {
        if(ii==i && jj==j)
          arr[i][j]==arr[ii][jj];
        else
          arr[i][j]!=arr[ii][jj];
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
