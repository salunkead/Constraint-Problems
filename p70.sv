///there is 4x4 matrix,write a constraint in such a way that sum of the all elements of each row must be 20

//Soultion 
class test;
  rand bit[7:0]arr[4][4];
  function void post_randomize;
    $display("%p",arr);
  endfunction
  
  constraint c1{
    foreach(arr[i]){
      arr[i].sum(x) with (int'(x))==20;
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
