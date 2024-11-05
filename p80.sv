//constraint for the pattern 010011000111 so on

//solution
class test;
  rand bit[31:0] num;
  function bit[31:0] pattern;
    int index=31;
    bit[31:0] a;
    for(int i=1;i<$size(num);i++)
      begin
        if(index<0)
          break;
        
        repeat(i)
          begin
            a[index]=1'b0;
            index--;
          end
        repeat(i)
          begin
            a[index]=1'b1;
            index--;
          end
      end
    return a;
  endfunction
  
  function void post_randomize;
    $display("For Tushar.......!");
    $display("num=%b",num);
  endfunction
  
  constraint c1{num==pattern();}
endclass

module top;
  test t;
  initial
    begin
      t=new;
      t.randomize;
    end
endmodule
