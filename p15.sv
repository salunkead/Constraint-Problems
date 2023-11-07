/*
Q.15 generate unique values without using rand or randc
*/
class test;
  bit [3:0]a;
  int q[$];
  function void post_randomize;
    $display("a=%d",a);
    q.push_back(a);
  endfunction
  constraint c{
    foreach(q[i])
      a!=q[i];
  }
endclass
module top;
  test t;
  initial
    begin
      t=new;
      for(int i=0;i<15;i++)
        begin
          if(i==0)
            begin
              t.c.constraint_mode(0);
              t.randomize(a);
            end
          else
            begin
              t.c.constraint_mode(1);
              t.randomize(a);
            end
        end
    end
endmodule

