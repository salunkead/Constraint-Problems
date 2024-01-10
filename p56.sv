//in an array,number should be the double of the previous number
class test1;
  rand int arr[10];
  function void post_randomize;
    $display("arr=%p",arr);
  endfunction
  constraint c2{arr[0]>0 && arr[0]<10;}
  constraint c1{
    foreach(arr[i]){
      if(i!=0){
        arr[i]==arr[i-1]*2;
      }
    }
  }
endclass
        
module top1;
  test1 t1;
  initial
    begin
      t1=new;
      t1.randomize;
    end
endmodule
