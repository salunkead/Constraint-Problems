/*Q.8 write a constraint such that when rand [3:0]a is randomized,the value of a should not be same as 5 previous occurrences of the value of a
*/

class test;
  rand bit [3:0]a;
  int ref1[$];
  function void post_randomize;
    $display("a=%d",a);
  endfunction
  constraint c{
    foreach(ref1[i])
    {
      a!=ref1[i];
    }
  }
endclass

module top;
  test t;
  initial
    begin
      t=new;
      for(int i=0;i<16;i++)
        begin
          if(i<5)
            begin
              t.c.constraint_mode(0);
              t.randomize;
              t.ref1.push_back(t.a);
            end
          else
            begin
              t.ref1.pop_front;
              t.ref1.push_back(t.a);
              t.c.constraint_mode(1);
              t.randomize;
            end
        end
    end
endmodule
