/*
for the first four loactions of an array,the values should be even and multiples of 4 and for the next four locations,values should be odd and multilples of 3 
*/
class test;
  randc bit[4:0]arr[8];
  function void post_randomize;
    $display("arr=%p",arr);
  endfunction
  constraint c1{
    foreach(arr[i]){
      if(i<4)
      {
        arr[i]%2==0 && arr[i]%4==0;
      }
        else{
          arr[i]%2!=0 && arr[i]%3==0;
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

