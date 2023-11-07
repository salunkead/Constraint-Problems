//problem-2 constraint to generate unique numbers between 99 to 100

class unq;
  randc int num;
  real data;
  real n;
  function void post_randomize;
    $cast(n,num);
    n=1/n;
    data=99+n;
    $display("data=%0f",data);
  endfunction
  constraint c{num<50 && num>0;}
endclass

module top;
  unq u;
  initial
    begin
      u=new;
      repeat(20)
      u.randomize;
    end
endmodule
