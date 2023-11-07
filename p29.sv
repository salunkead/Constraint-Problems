///50 to 100 even numbers using constraints
class test;
  randc int a;
  int arr[$];
  function void post_randomize;
    arr.push_back(a);
  endfunction
  constraint c{a inside{[50:100]};}
  constraint c1{a%2==0;}
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(25)
        begin
          t.randomize;
        end
      t.arr.sort;
      $display("arr=%p",t.arr);
    end
endmodule
