//write constraint in such a way that size of the array must be between 2 and 5
//all the elements of an array must be between 0 to 100
//and sum of all the elements must be 100
class p;
  rand byte arr[];
  constraint c1{arr.size inside{[2:5]};
               }
  constraint c2{
    foreach(arr[i])
      arr[i] inside{[0:100]};
  }
  constraint c3{arr.sum==100;}
  function void post_randomize;
    $display("arr=%p",arr);
  endfunction
endclass

module test;
  p p1;
  initial
    begin
      p1=new;
      p1.randomize;
    end
endmodule
