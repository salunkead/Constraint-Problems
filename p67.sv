//Q.write a constraint using dynamic array
/*
1.array1 : no. of elements should be 20, or between 30 to 40
2.array2 : sum of all elements should be less than <100
3.array3 : sum of all elements greater than >100
4.array4 : size of array should not be same as array1,array2 and array 3
*/

//Solution
class test;
  rand bit[7:0] a1[],a2[],a3[],a4[];
  function void post_randomize();
    $display("%p\n %p\n %p\n %p\n",a1,a2,a3,a4);
  endfunction
  constraint c1{
    a1.size()==20 || a1.size() inside{[30:40]};
    a2.size()==10;
    a3.size()==5;
    a4.size() inside{[5:40]};
    !(a4.size() inside {5,10,20,[30:40]});
  }
  
  constraint c2{
    a2.sum(x) with (int'(x))<100;
    a3.sum(y) with (int'(y))>100;
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
