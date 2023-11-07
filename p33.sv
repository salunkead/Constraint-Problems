///write constraint to generate unique numbers in an array without using unique keyword
class test;
  rand bit[7:0]arr[10];
  function void post_randomize;
    $display("arr=%p",arr);
  endfunction
  constraint c{
    foreach(arr[i]){
      if(i>0){
        foreach(arr[j]){
          if(j<i){
            arr[i]!=arr[j];
          }
        }
      }
      }
      }
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(5)
      t.randomize;
    end
endmodule

