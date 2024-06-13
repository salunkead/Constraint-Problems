class test;
  rand bit[4:0] a[];
  function void post_randomize;
    $display("%p",a);
  endfunction
  
  constraint c{a.size==10;}
  constraint c1{a.sum() with (int'(item))==20;} ///each element of the array is typecasted into int type
endclass

module top;
  test t;
  initial
    begin
      t=new;
      t.randomize;
    end
endmodule
