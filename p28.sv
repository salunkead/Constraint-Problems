///constraint to generate 25,27,30,36,40,45
class test;
  randc int a;
  int i[$];
  function void post_randomize;
    $display("a=%0d",a);
    i.push_back(a);
  endfunction
  constraint c{a inside{[21:46]};}
  constraint c1{a%5==0||a%9==0;}
  constraint c2{a!=35;}
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(6)
        begin
          t.randomize;
        end
      t.i.sort;
      $display("q=%p",t.i);
    end
endmodule
