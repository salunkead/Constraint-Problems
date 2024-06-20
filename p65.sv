//There are two random hexa decimal number,write a constraint such that one number is reverse of other

///use of streaming operator
class test;
  rand bit[15:0]a,b;
  function void post_randomize;
    $display("a=%0h b=%0h",a,b);
  endfunction
  
  function bit[15:0] ret(bit[15:0]val);
    ret={<<4{val}};
  endfunction
  
  constraint c1{
    b==ret(a);
  }
endclass

module top;
  test t;
  initial
    begin
      t=new;
      repeat(4)
      t.randomize;
    end
endmodule
