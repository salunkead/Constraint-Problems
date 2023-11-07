//array1 and array2 should be equal and value of c should be of array element value
class test;
  rand bit[7:0]a,b;
  function void post_randomize;
    $display(a,b);
  endfunction
  constraint c{a inside{[1:20]};
               b inside{[1:20]};
              }
  constraint c1{unique{a,b};}
endclass

class test1;
  rand bit[7:0]a[],b[],c;
  function void post_randomize;
    $display("a=%p",a);
    $display("b=%p",b);
    $display("c=%0d",c);
  endfunction
  constraint c1{a.size==5;
               b.size==5;
                c inside{a};}
  constraint c2{
    foreach(a[i]){
      a[i]==b[i];
    }
  }
endclass

module top;
  test t;
  test1 t1;
  initial
    begin
      t=new;
      t1=new;
      repeat(10)t.randomize;
      t1.randomize;
    end
endmodule
