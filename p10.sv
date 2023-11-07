/* Q.10 Write a program using dynamic array
   array1:no of elements should be between 30-40
   array2:sum of elements should be <100
   array3:sum of elements should be >100
*/

class test;
  rand int unsigned arr1[],arr2[],arr3[];
  function void post_randomize;
    $display("arr1=%p",arr1);
    $display("arr2=%p",arr2);
    $display("arr3=%p",arr3);
  endfunction
  constraint c{arr1.size==10;
              arr2.size==20;
              arr3.size==30;
              }
  constraint c1{
    foreach(arr1[i])
      arr1[i] inside{[30:40]};
  }
  constraint c2{
    arr2.sum()<100;
    arr3.sum()>100;
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
