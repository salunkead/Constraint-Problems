///4 By 4 array - sum of each row=20, sum of each column=20, sum of all the diagonal elements=20

//Interview question asked in qualcomm
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
  
  constraint row_20{
    foreach(a[i])
    {
      a[i].sum(element) with (int'(element))==20;
    }
  }
      constraint column_20{
        foreach(a[i,j]){
          if(j==0)
          {
            a[j][i]+a[j+1][i]+a[j+2][i]+a[j+3][i]==20;
          }
        }
      }
            constraint left_diagonal_20{
              foreach(a[i]){
                if(i==0){
                a[i][i]+a[i+1][i+1]+a[i+2][i+2]+a[i+3][i+3]==20;
                }
              }
            }
                  constraint right_diagonal_20{
                    foreach(a[i]){
                      if(i==3)
                        a[i-3][i]+a[i-2][i-1]+a[i-1][i-2]+a[i][i-3]==20;
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
