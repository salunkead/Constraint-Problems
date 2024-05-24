//4 X 4 matrix with lower triangle elements should be prime numbers and upper traingle elements should be 0
//code
class test;
  randc bit[7:0]arr[4][4];
  int min,max;
  function void post_randomize;
    for(int i=0;i<4;i++)
      begin
        for(int j=0;j<4;j++)
          begin
            $write(arr[i][j]);
          end
        $display();
      end
  endfunction
  
  constraint c{
    foreach(arr[i,j])
    {
      if(j>i)
      {
        arr[i][j]==0;
      }
        else{
          arr[i][j]==(arr[i][j]==2||arr[i][j]==3||arr[i][j]==7)||(arr[i][j]%10==1 || arr[i][j]%10==3 || arr[i][j]%10==7 || arr[i][j]%10==9)&&(arr[i][j]%3!=0 && arr[i][j]%7!=0 && arr[i][j]%9!=0 &&arr[i][j]!=1);
        }
    }
  }
          
          constraint c2{
            foreach(arr[i,j]){
              arr[i][j] inside{[min:max]};
            }
          }
 
endclass

module top;
  test t;
  initial
    begin
      t=new;
      t.min=0;
      t.max=100;
      t.randomize;
    end
endmodule
