///two digit and three digit palindrom number
class top;
  randc int a;
  function void post_randomize;
    $display(a);
  endfunction
  constraint c1{a inside{[10:99]};}
  constraint c2{
    a%10==(a/10)%10;
  }
  constraint c3{a inside{[100:200]};}
  constraint c4{a%10==(a/100)%10;}
endclass
module test;
  top t;
  initial
    begin
      t=new;
      t.c3.constraint_mode(0);
      t.c4.constraint_mode(0);
      repeat(5)t.randomize;
      t.c3.constraint_mode(1);
      t.c4.constraint_mode(1);
      t.c1.constraint_mode(0);
      t.c2.constraint_mode(0);
      repeat(5)t.randomize;
    end
endmodule
