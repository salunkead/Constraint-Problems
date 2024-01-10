//in an array,all the numbers should be in the power of 2
class test;
  randc int num[10];
  function void post_randomize;
    $display("%p",num);
  endfunction
  constraint c1{
    foreach(num[i]){
      if(i==0)
      {
        num[i]==2;
      }
        else{
          num[i]==num[i-1]*2;
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
